# What 3 towns have the highest population of citizens that are 65 years and older?
TownHealthRecord.select('town, population_greater_than_65_2005').order('population_greater_than_65_2005 DESC').limit(3)


# What 3 towns have the highest population of citizens that are 19 years and younger?
TownHealthRecord.select('town, population_0_to_19_2005').order('town, population_0_to_19_2005 DESC').limit(3)


# What 5 towns have the lowest per capita income?
TownHealthRecord.select('town, per_capita_income_2000').order('per_capita_income_2000').limit(5)


# Omitting Boston, Becket, and Beverly, what town has the highest percentage of teen births?
TownHealthRecord.select('town, percent_teen_births_2005_to_2008').where.not(town: ['Boston', 'Becket', 'Beverly']).where('percent_teen_births_2005_to_2008 IS NOT NULL').order('percent_teen_births_2005_to_2008 DESC').limit(1)
# or:
# TownHealthRecord.select('town, percent_teen_births_2005_to_2008').where.not(town: 'Boston, Becket, Beverly').where('percent_teen_births_2005_to_2008 IS NOT NULL').order('percent_teen_births_2005_to_2008 DESC').limit(1)


# Omitting Boston, what town has the highest number of infant mortalities?
TownHealthRecord.select('town, total_infant_deaths_2005_to_2008').where.not(town: 'Boston').where('total_infant_deaths_2005_to_2008 IS NOT NULL').order('total_infant_deaths_2005_to_2008 DESC').limit(1)


# Of the 5 towns with the highest per capita income, which one has the highest number of people below the poverty line?
TownHealthRecord.select('town, per_capita_income_2000, persons_below_poverty_2000').where(town: (TownHealthRecord.select('town').order('per_capita_income_2000 DESC').limit(5))).order('persons_below_poverty_2000 DESC').limit(1)


# Of the towns that start with the letter b, which has the highest population?
TownHealthRecord.select('town, total_population_2005').where("town LIKE 'B%'").order('total_population_2005 DESC').limit(1)


# Of the 10 towns with the highest percent publicly financed prenatal care, are any of them also the top 10 for total infant deaths?
TownHealthRecord.select('town, total_infant_deaths_2005_to_2008, percent_publicly_financed_prenatal_care_2005_to_2008').where(town: (TownHealthRecord.select('town').order('total_infant_deaths_2005_to_2008 DESC').limit(10))).order('percent_publicly_financed_prenatal_care_2005_to_2008 DESC').limit(10)


# Which town has the highest percent multiple births?
TownHealthRecord.where('percent_multiple_births_2005_to_2008 IS NOT NULL').order('percent_multiple_births_2005_to_2008 DESC').limit(1).pluck('town')


# What is the percent adequacy of prenatal care in that town?
TownHealthRecord.select('town, percent_adequacy_pre_natal_care').where("town = 'Dover'")


# Excluding towns that start with W, how many towns are part of this data?
TownHealthRecord.where.not("town LIKE 'W%'").count('town')


# How many towns have a lower per capita income that of Boston?
TownHealthRecord.where('per_capita_income_2000 < ?', (TownHealthRecord.where("town = 'Boston'")).pluck('per_capita_income_2000')).count('town')








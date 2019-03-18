############################
# Thesis Correlation Plots #    Author's Note: All correlation plots are conducted for the baseline sample when 
# Author: Connor Harrison  #                   Wave=0 in the data. 
# Date Modified: 3/18/2019 #
############################

# Load Packages
library(tidyverse)
library(foreign)
library(readxl)
library(haven)
library(corrplot)

# Load Data
control_vars <- read_dta("~/Georgetown Docs/Data/thesis_baseline_control_vars.dta")

# Separate Data into HH, Community, and Loan Sets

# HH Controls
hh_control <- select(control_vars, Female="female_hh", Age="age_hh", Education="educ_hh", Ethnicity="ethnicity_hh", 
                    Spouse_Age="age_sp", Dirt_Floor="dirtfloor97", Electricity="electricity97", Owns_Home="homeown97", 
                    Dep_Age0_7="dage0_7_97", Dep_Age8_17="dage8_17_97", HH_Size="hhsize97", HH_uses_land="land", 
                    Land_Used="ha", Animal_Draft="ani1", Animal_Other="ani2", Animal_Value="vani")

# Household Control Correlation Matrix
hh_cor <- cor(hh_control, use = "complete.obs")

# Household Controls Correlation Plot
corrplot(hh_cor, method = "shade", diag = FALSE, addCoef.col = "blacK", shade.col = NA, tl.cex = 0.8, number.cex = 0.5, 
         order = "AOE", type = "lower", tl.srt = 45, tl.col = "black", cl.pos = "n")

# Community Controls
comm_control <- select(control_vars, Production="org_production", Credit="org_credit", Consumption="org_consumption",
                       Religious="org_religion", Political="org_politics", Parental="org_parents", 
                       Assembly="org_com", Faenas_Comm="org_faenas", Primary_School="primary", 
                       Secondary_School="telesec", Health_Center="healthcenter", Mobile_Clinic="mobilehealth", 
                       Distance_to_Urban="min_dist")

# Community Controls Correlation Matrix
comm_cor <- cor(comm_control, use = "complete.obs")

# Community Control Correlation Plot
corrplot(comm_cor, method = "shade", diag = FALSE, addCoef.col = "blacK", shade.col = NA, tl.cex = 0.8, number.cex = 0.5, 
         order = "AOE", type = "lower", tl.srt = 45, tl.col = "black", cl.pos = "n")

# All Controls
all_cont <- select(control_vars, Female="female_hh", Age="age_hh", Education="educ_hh", Ethnicity="ethnicity_hh", 
                   Spouse_Age="age_sp", Dirt_Floor="dirtfloor97", Electricity="electricity97", Owns_Home="homeown97", 
                   Dep_Age0_7="dage0_7_97", Dep_Age8_17="dage8_17_97", HH_Size="hhsize97", HH_uses_land="land", 
                   Land_Used="ha", Animal_Draft="ani1", Animal_Other="ani2", Animal_Value="vani", 
                   Production="org_production", Credit="org_credit", Consumption="org_consumption",
                   Religious="org_religion", Political="org_politics", Parental="org_parents", 
                   Assembly="org_com", Faenas_Comm="org_faenas", Primary_School="primary", 
                   Secondary_School="telesec", Health_Center="healthcenter", Mobile_Clinic="mobilehealth", 
                   Distance_to_Urban="min_dist")

# All Controls Correlation Matrix
all_cor <- cor(all_cont, use = "complete.obs")

# All Controls Correlation Plot
corrplot(all_cor, method = "shade", diag = FALSE, shade.col = NA, tl.cex = 0.8, 
         order = "AOE", type = "lower", tl.srt = 45, tl.col = "black", cl.pos = "n")

### END ###
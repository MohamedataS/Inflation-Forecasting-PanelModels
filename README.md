# **Panel Data Models**
# **Applications in Macroeconometrics `(Inflation Forecasting)`**


---
author: "Mohamed Abd Al-mgyd"
supervisor: "Dr. Amal Abd-Elfatah"

---

# Table of Contents
1. Introduction and Review  
2. Study Objectives  
3. Dataset Overview  
4. Preprocessing  
    - 4.1 Missing Values (MICE-BR)  
    - 4.2 Correlation and VIF  
5. Panel Data Model Comparison  
    - 5.1 POLS, FE, and RE  
    - 5.2 Model Selection Tests  
    - 5.3 Diagnostic Testing  
    - 5.4 Two-Step Difference GMM  
6. Conclusion  
7. Recommendations and Future Work  
8. Appendix and References  

---

# 1. Introduction and Review

Panel data combines temporal depth with cross-sectional breadth, enhancing the richness of econometric inference (Hsiao, 2003). Early contributions include Verbeek & Nijman (1992), Moulton (1990), and Arellano & Bond (1991).

**Advantages of Panel Data:**
- **Controls unobservables:** Fixed and random effects.
- **Improves efficiency:** Reduces variance (Wooldridge, 2010).
- **Captures dynamics:** Lagged variables model persistence.

---

# 2. Study Objectives

- **Compare Models:** Evaluate POLS, FE, RE, and Difference GMM with diagnostics (Hausman, AR(2), Sargan).  
- **Application:** Forecast inflation using macro panel data (1980–2024) for 77 countries.  
- **Recommendations:** Best panel technique based on diagnostics and data structure.

---

# 3. Dataset Overview

- **Source:** IMF World Economic Outlook  
- **Target:** PCPIPCH (Inflation)  
- **Variables:**
    - **Public Finance:** GGSB_NPGDP, GGXWDG_NGDP  
    - **Output & PPP:** PPPPC  
    - **Trade:** TX_RPCH, TM_RPCH  
    - **Investment:** NID_NGDP  

---

# 4. Preprocessing

## 4.1 Missing Values (MICE-BR)

```python
# Python code for Bayesian Ridge Imputation
from sklearn.experimental import enable_iterative_imputer
from sklearn.impute import IterativeImputer
from sklearn.linear_model import BayesianRidge
imputer = IterativeImputer(estimator=BayesianRidge())
imputed_data = imputer.fit_transform(data)
```

## 4.2 Correlation and VIF

```r
# R code for correlation and VIF
library(car)
vif(lm_model)
cor(data)
```

---

# 5. Panel Data Models

## 5.1 POLS, FE, and RE Results

- **POLS R² = 0.4525**, significant (F = 454.25, p < 0.001)  
- **FE R² = 0.469**, significant (F = 535.95, p < 0.001)  
- **RE χ² = 3,262.87**, p < 0.001

## 5.2 Model Selection Tests

- **Wald test:** POLS vs FE  
- **Hausman test:** FE vs RE  

## 5.3 Diagnostic Testing

- Driscoll–Kraay Robust Errors  
- Model validity, heteroskedasticity, autocorrelation

## 5.4 Two-Step Difference GMM

- Solves endogeneity, autocorrelation, heteroskedasticity  
- Suitable when N ≫ T  
- Instruments: lagged variables

```r
# R code for GMM model (plm + pgmm)
library(plm)
library(pdynmc)
gmm_model <- pgmm(P ~ lag(P, 1:2) + X1 + X2 | lag(P, 2:99), data = pdata, effect = "individual", model = "twosteps")
summary(gmm_model)
```

---

# 6. Conclusion

- **POLS:** Biased due to omitted variables  
- **FE:** Good for heterogeneity, weak under endogeneity  
- **RE:** Consistent but lacks dynamics  
- **GMM:** Best performing model under all diagnostics

---

# 7. Recommendations and Future Work

- Prefer dynamic estimators (GMM) in inflation research  
- Expand dataset, add energy indices  
- Integrate machine learning and deep learning techniques

---

# 8. Appendix and References

## 🔗 Code Repositories

- [Dataset (SQL)](https://github.com/1145267383/Panal_Data_Inflation/tree/main/02-Dataset)  
- [Python: Cleaning & EDA](https://github.com/1145267383/Panal_Data_Inflation/tree/main/03-Clean_Organize_EDA)  
- [Python: Models](https://github.com/1145267383/Panal_Data_Inflation/blob/main/05-Models_Panel_Data/01-Models_Python.ipynb)  
- [R: Models](https://github.com/1145267383/Panal_Data_Inflation/blob/main/05-Models_Panel_Data/02-Models_R.ipynb)

## 📚 References

- Hsiao (2003). *Analysis of Panel Data*, Cambridge University Press.  
- Baltagi (2008). *Econometric Analysis of Panel Data*, Wiley.  
- Wooldridge (2010). *Econometric Analysis of Cross Section and Panel Data*, MIT Press.  
- Arellano & Bond (1991). *Dynamic Panel Estimators*, Journal of Econometrics.  
- Verbeek & Nijman (1992), Moulton (1990), Fischer (1993).

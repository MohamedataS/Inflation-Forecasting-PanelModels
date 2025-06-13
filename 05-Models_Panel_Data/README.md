# **Panel Data Methodologies**
# **Applications in Macroeconometrics `(Inflation Forecasting)`**

#### Dataset Description and Variable Overview:

The dataset includes annual macroeconomic data for  **77 countries** over the period **1980–2024**. Most variables are sourced from the **IMF’s World Economic Outlook (WEO)**, except **TRWMA**, which is derived from the **World Bank**. The target variable is **PCPIPCH** (Inflation, average consumer prices). Below is the list of variables used:

---

> #### **Inflation & Price Stability**

| **Variable Code** | **Description**                                    | **Units**                                         |
| ----------------- | -------------------------------------------------- | ------------------------------------------------- |
| **PCPIPCH**       | Inflation, average consumer prices `(Target)`      | Percent change                                    |

---

> #### **Public Finance**
| **Variable Code** | **Description**                                    | **Units**                                         |
| ----------------- | -------------------------------------------------- | ------------------------------------------------- |
| GGSB_NPGDP        | General government structural balance              | Percent of potential GDP                          |
| GGXWDG_NGDP       | General government gross debt                      | Percent of GDP                                    |

---


> #### **Economic Output & Productivity**
| **Variable Code** | **Description**                                    | **Units**                                         |
| ----------------- | -------------------------------------------------- | ------------------------------------------------- |
| PPPPC             | Gross domestic product per capita, current prices  | Purchasing power parity; international dollars    |

---

> #### **International Trade & Balance**
| **Variable Code** | **Description**                                    | **Units**                                         |
| ----------------- | -------------------------------------------------- | ------------------------------------------------- |
| TX_RPCH           | Volume of exports of goods and services            | Percent change                                    |
| TM_RPCH           | Volume of imports of goods and services            | Percent change                                    |
---

> #### **Savings & Investment **
| **Variable Code** | **Description**                                    | **Units**                                         |
| ----------------- | -------------------------------------------------- | ------------------------------------------------- |
| NID_NGDP          | Total investment                                   | Percent of GDP                                    |

---
------------------------------------------------------------------------------
---

#### **1. Inflation & Price Stability (التضخم واستقرار الأسعار)**

| Variable Code    | Term             | التفسير |                تأثيره على التضخم                                            |
| ---------------- | ---------------- | --------------------------------- | --------------------------------------------------- |
| **PCPIPCH**   | Inflation (CPI) | معدل التضخم بناءً على متوسط أسعار المستهلكين؛ مؤشر رئيسي لاستقرار الأسعار. | المتغير الهدف، ويقيس بشكل مباشر مدى ارتفاع الأسعار. |

---

#### **2. Public Finance (المالية العامة)**

| Variable Code    | Term             | التفسير |                تأثيره على التضخم                                            |
| ---------------- | ---------------- | --------------------------------- | --------------------------------------------------- |
| **GGSB_NPGDP**  | Structural Budget Balance         | الميزان الهيكلي بعد خصم أثر الدورة الاقتصادية.                         | الفائض الهيكلي يُعتبر إشارة إلى سياسة مالية انكماشية تقلل من التضخم.      |
| **GGXWDG_NGDP** | Gross Government Debt (% of GDP)  | الدين العام كنسبة من الناتج؛ يعكس عبء الحكومة المالي.                  | ارتفاع الدين قد يُجبر الحكومة على التوسع النقدي مستقبلاً مما يزيد التضخم. |


---


#### **3. Economic Output & Productivity (الإنتاجية والناتج الاقتصادي)**

| Variable Code    | Term             | التفسير |                تأثيره على التضخم                                            |
| ---------------- | ---------------- | --------------------------------- | --------------------------------------------------- |
| **PPPPC**      | GDP per Capita (PPP)   | نصيب الفرد من الناتج باستخدام تعادل القوة الشرائية.             | ارتفاعه يشير إلى قدرة شرائية أعلى، ما قد يدفع بالأسعار إلى الارتفاع.               |

---


#### **4. International Trade & Balance (التجارة الدولية والحساب الجاري)**

| Variable Code    | Term             | التفسير |                تأثيره على التضخم                                            |
| ---------------- | ---------------- | --------------------------------- | --------------------------------------------------- |
| **TX_RPCH**   | Export Volume Growth            | نمو حجم الصادرات.                   | زيادة الصادرات قد تقلل المعروض المحلي وترفع الأسعار.                |
| **TM_RPCH**   | Import Volume Growth            | نمو حجم الواردات.                   | زيادة الواردات توفر بدائل أرخص وتقلل من التضخم.                     |

---

#### **5. Savings & Investment (الادخار والاستثمار)**

| Variable Code    | Term             | التفسير |                تأثيره على التضخم                                            |
| ---------------- | ---------------- | --------------------------------- | --------------------------------------------------- |
| **NID_NGDP**  | Gross Capital Formation | الاستثمار الإجمالي كنسبة من الناتج. | استثمار أكبر قد يرفع الإنتاج في الأجل الطويل مما يقلل التضخم. |

---

#### **6. Country Metadata (بيانات الدول)**

| Variable Code    | Term             | التفسير |                تأثيره على التضخم                                            |
| ---------------- | ---------------- | --------------------------------- | --------------------------------------------------- |
| **Country_Code**     | Country ID         | معرف رقمي فريد لكل دولة. | -                 |
| **Country**           | Country Name       | اسم الدولة.              | -                 |
| **Advanced_Country** | Development Status | متقدمة (1) أو نامية (0). | -                 |
| **Years**             | Year               | السنة ما بين 2000 و2024. | -                 |

---


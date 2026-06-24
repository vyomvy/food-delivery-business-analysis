# Food Delivery Business Analysis — Lucknow

🔗 **Live site:** https://vyomvy.github.io/food-delivery-business-analysis/

Analysis of 1,500+ food delivery orders across 10 areas in Lucknow — built as an end-to-end pipeline using Python, SQL, and Power BI, each tool doing one job rather than one tool doing everything.

---

## Business Problem

Identify where the business is losing money or trust (refunds, discount leakage) and where it's winning (top-performing areas, peak demand windows) using order-level data.

## Pipeline

```
Raw CSV → Python (cleaning only) → SQL (business-question analysis) → Power BI (dashboard)
```

- **Python (Colab):** loaded raw data, classified nulls as structural vs real, fixed sign errors in distance, standardized text fields, removed duplicates. No analysis here — only output is a clean CSV.
- **SQL (MySQL):** answered 5 business questions using CTEs and window functions — distance vs delivery time/value, discount % by item, refund rate by order type, day vs night demand by area, delivery time vs rating.
- **Power BI:** rebuilt the same 5 questions as an interactive dashboard with KPI cards, slicers (area, order type), and 6 linked visuals.

## Key Findings

1. **First-time orders have the highest refund rate** — pattern more consistent with discount abuse on new accounts than genuine delivery failure.
2. **Refund rate climbs to ~17% beyond 9km**, and average rating drops as delivery time increases.
3. **Despite the risk, orders beyond 9km have the highest average order value** — the riskiest distance band is also the most profitable.
4. **Mahanagar leads all areas in revenue**, but order variety is narrow — dominated by one item.
5. **Every area orders more during the day (6 AM–6 PM) than at night.**
6. **Discount % varies meaningfully by food item** — not spread evenly across the menu.

## Files in This Repo

| File | What it is |
|---|---|
| `food_delivery_v2.sql` | All SQL queries — data import + 5 business-question queries |
| `food_delivery_cleaning.ipynb` | Python/Pandas cleaning notebook (Colab) |
| `index.html` | Source for the live project page |
| `images/` | Dashboard screenshots used on the live page |

## Tech Stack

Python · Pandas · Google Colab · MySQL (CTEs, Window Functions) · Power BI · DAX

## Dataset

1,500 orders, 21 columns — order info, customer & area, food item details, delivery logistics, discounts, and customer experience (refunds, ratings).

---

**Author:** [vyomvy](https://github.com/vyomvy) · [LinkedIn](https://www.linkedin.com/in/sant-sahu-738063319/)

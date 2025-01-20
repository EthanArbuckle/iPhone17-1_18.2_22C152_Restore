@interface PKSpendingSummaryGenerator
+ (id)generateSummaryOfType:(unint64_t)a3 startingAt:(id)a4 withSegmentLimit:(unint64_t)a5;
+ (id)generateSummaryOfType:(unint64_t)a3 startingAt:(id)a4 withSegmentLimit:(unint64_t)a5 generateBeyondCurrentDay:(BOOL)a6;
@end

@implementation PKSpendingSummaryGenerator

+ (id)generateSummaryOfType:(unint64_t)a3 startingAt:(id)a4 withSegmentLimit:(unint64_t)a5
{
  return (id)[a1 generateSummaryOfType:a3 startingAt:a4 withSegmentLimit:a5 generateBeyondCurrentDay:0];
}

+ (id)generateSummaryOfType:(unint64_t)a3 startingAt:(id)a4 withSegmentLimit:(unint64_t)a5 generateBeyondCurrentDay:(BOOL)a6
{
  BOOL v50 = a6;
  int v6 = a5;
  id v51 = a4;
  v8 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  [v8 setFirstWeekday:2];
  id v48 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (a3 == 2)
  {
    uint64_t v46 = 8;
    id v9 = v51;
    [v8 rangeOfUnit:8 inUnit:4 forDate:v51];
    uint64_t v11 = v17;
    id v12 = objc_alloc_init(MEMORY[0x1E4F1C9C8]);
    id v55 = v12;
    v13 = &v55;
    v14 = &v55;
    v15 = v8;
    uint64_t v16 = 4;
  }
  else if (a3 == 1)
  {
    uint64_t v46 = 4096;
    id v9 = v51;
    [v8 rangeOfUnit:4096 inUnit:8 forDate:v51];
    uint64_t v11 = v18;
    id v12 = objc_alloc_init(MEMORY[0x1E4F1C9C8]);
    id v56 = v12;
    v13 = &v56;
    v14 = &v56;
    v15 = v8;
    uint64_t v16 = 8;
  }
  else
  {
    if (a3)
    {
      id v47 = objc_alloc_init(MEMORY[0x1E4F1C9C8]);
      goto LABEL_21;
    }
    uint64_t v46 = 512;
    id v9 = v51;
    [v8 rangeOfUnit:512 inUnit:0x2000 forDate:v51];
    uint64_t v11 = v10;
    id v12 = objc_alloc_init(MEMORY[0x1E4F1C9C8]);
    v57[0] = v12;
    v13 = (id *)v57;
    v14 = (id *)v57;
    v15 = v8;
    uint64_t v16 = 0x2000;
  }
  [v15 rangeOfUnit:v16 startDate:v14 interval:0 forDate:v9];
  id v47 = *v13;

  if (!v11)
  {
LABEL_21:
    unint64_t v34 = 0;
    goto LABEL_22;
  }
  uint64_t v19 = 0;
  unint64_t v43 = a3;
  v44 = v53;
  double v20 = 0.0;
  uint64_t v21 = MEMORY[0x1E4F1CBF0];
  uint64_t v45 = v11;
  do
  {
    uint64_t v49 = v19;
    v22 = objc_msgSend(v8, "dateByAddingUnit:value:toDate:options:", v46, v43, v44);
    id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v24 = 0;
    double v25 = 0.0;
    do
    {
      if (v24)
      {
        if (([v8 compareDate:v22 toDate:v51 toUnitGranularity:16] != 1 || v50)
          && arc4random_uniform(3u))
        {
          unint64_t v26 = arc4random_uniform(v6 + 1);
        }
        else
        {
          unint64_t v26 = 0;
        }
        double v25 = v25 + (double)v26;
        v27 = objc_alloc_init(PKPaymentTransactionGroup);
        [(PKPaymentTransactionGroup *)v27 setTransactions:v21];
        [(PKPaymentTransactionGroup *)v27 setTransactionCount:0];
        [(PKPaymentTransactionGroup *)v27 setMerchantCategory:v24];
        [(PKPaymentTransactionGroup *)v27 setType:0];
        v28 = [MEMORY[0x1E4F28C28] decimalNumberWithMantissa:v26 exponent:0 isNegative:0];
        v29 = PKCurrencyAmountCreate(v28, &cfstr_Usd.isa, 0);
        [(PKPaymentTransactionGroup *)v27 setTotalAmount:v29];

        [v23 addObject:v27];
      }
      ++v24;
    }
    while (v24 != 8);
    v30 = objc_alloc_init(PKSpendingSummary);
    [(PKSpendingSummary *)v30 setStartDate:v22];
    [(PKSpendingSummary *)v30 setEndDate:v22];
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v53[0] = __105__PKSpendingSummaryGenerator_generateSummaryOfType_startingAt_withSegmentLimit_generateBeyondCurrentDay___block_invoke;
    v53[1] = &unk_1E56EDEE0;
    id v54 = &unk_1EE22B258;
    v31 = [v23 sortedArrayUsingComparator:v52];
    [(PKSpendingSummary *)v30 setOrderedSpendingCategories:v31];

    v32 = [MEMORY[0x1E4F28C28] decimalNumberWithMantissa:(unint64_t)v25 exponent:0 isNegative:0];
    v33 = PKCurrencyAmountCreate(v32, &cfstr_Usd.isa, 0);
    [(PKSpendingSummary *)v30 setTotalSpending:v33];

    [v48 addObject:v30];
    double v20 = v20 + v25;

    uint64_t v19 = v49 + 1;
  }
  while (v49 + 1 != v45);
  unint64_t v34 = (unint64_t)v20;
  a3 = v43;
LABEL_22:
  v35 = objc_alloc_init(PKSpendingSummary);
  [(PKSpendingSummary *)v35 setSummaryType:a3];
  v36 = [v48 firstObject];
  v37 = [v36 startDate];
  [(PKSpendingSummary *)v35 setStartDate:v37];

  v38 = [v48 lastObject];
  v39 = [v38 endDate];
  [(PKSpendingSummary *)v35 setEndDate:v39];

  v40 = [MEMORY[0x1E4F28C28] decimalNumberWithMantissa:v34 exponent:0 isNegative:0];
  v41 = PKCurrencyAmountCreate(v40, &cfstr_Usd.isa, 0);
  [(PKSpendingSummary *)v35 setTotalSpending:v41];

  [(PKSpendingSummary *)v35 setSpendingsPerCalendarUnit:v48];
  return v35;
}

uint64_t __105__PKSpendingSummaryGenerator_generateSummaryOfType_startingAt_withSegmentLimit_generateBeyondCurrentDay___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v5 = *(void **)(a1 + 32);
  int v6 = NSNumber;
  id v7 = a3;
  v8 = objc_msgSend(v6, "numberWithInteger:", objc_msgSend(a2, "merchantCategory"));
  unint64_t v9 = [v5 indexOfObject:v8];

  uint64_t v10 = *(void **)(a1 + 32);
  uint64_t v11 = NSNumber;
  uint64_t v12 = [v7 merchantCategory];

  v13 = [v11 numberWithInteger:v12];
  unint64_t v14 = [v10 indexOfObject:v13];

  if (v9 < v14) {
    return -1;
  }
  else {
    return v9 > v14;
  }
}

@end
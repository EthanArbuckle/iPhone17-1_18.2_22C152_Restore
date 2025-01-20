@interface PLMonthGroupingRule
- (BOOL)highlightItem:(id)a3 belongsToHighlightItemList:(id)a4;
- (BOOL)highlightItemHasMinimumRequirementToBePromoted:(id)a3 withSharingConsideration:(int64_t)a4;
- (BOOL)highlightItemList:(id)a3 canBeMergedWithOtherHighlightItemList:(id)a4;
- (NSCalendar)calendar;
- (PLMonthGroupingRule)init;
- (id)dominantMonthDateComponentForStartDateComponents:(id)a3 endDateComponents:(id)a4 numberOfDaysInMonthOfStartDate:(int64_t)a5;
- (id)fallbackHighlightItemFromAllHighlightItems:(id)a3 withSharingConsideration:(int64_t)a4;
- (id)highlightItemsSortedByImportance:(id)a3 withSharingConsideration:(int64_t)a4;
- (unint64_t)_extendedAssetsCountThresholdForHighlightItem:(id)a3;
- (unint64_t)maximumNumberOfHighlightItemsToPromote;
- (void)titlesForHighlightItemList:(id)a3 dateRangeTitleGenerator:(id)a4 forceUpdateLocale:(BOOL)a5 resultBlock:(id)a6;
- (void)titlesForHighlightItemList:(id)a3 dateRangeTitleGenerator:(id)a4 resultBlock:(id)a5;
@end

@implementation PLMonthGroupingRule

- (void).cxx_destruct
{
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (id)fallbackHighlightItemFromAllHighlightItems:(id)a3 withSharingConsideration:(int64_t)a4
{
  v5 = [a3 allObjects];
  v6 = (void *)[v5 mutableCopy];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __91__PLMonthGroupingRule_fallbackHighlightItemFromAllHighlightItems_withSharingConsideration___block_invoke;
  v11[3] = &__block_descriptor_40_e44_B24__0___PLHighlightItem__8__NSDictionary_16l;
  v11[4] = a4;
  v7 = [MEMORY[0x1E4F28F60] predicateWithBlock:v11];
  [v6 filterUsingPredicate:v7];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __91__PLMonthGroupingRule_fallbackHighlightItemFromAllHighlightItems_withSharingConsideration___block_invoke_2;
  v10[3] = &__block_descriptor_40_e49_q24__0___PLHighlightItem__8___PLHighlightItem__16l;
  v10[4] = a4;
  [v6 sortUsingComparator:v10];
  v8 = [v6 firstObject];

  return v8;
}

BOOL __91__PLMonthGroupingRule_fallbackHighlightItemFromAllHighlightItems_withSharingConsideration___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isRecent])
  {
    _os_feature_enabled_impl();
LABEL_3:
    BOOL v4 = 0;
    goto LABEL_4;
  }
  [v3 promotionScore];
  double v7 = v6;
  if (_os_feature_enabled_impl())
  {
    if (v7 <= 0.2 || [v3 kind]) {
      goto LABEL_3;
    }
  }
  else if (v7 <= 0.2 || [v3 type] == 6 || objc_msgSend(v3, "type") == 5)
  {
    goto LABEL_3;
  }
  BOOL v4 = *(void *)(a1 + 32) == 2 || objc_msgSend(v3, "numberOfAssetsInExtendedForSharingConsideration:") != 0;
LABEL_4:

  return v4;
}

uint64_t __91__PLMonthGroupingRule_fallbackHighlightItemFromAllHighlightItems_withSharingConsideration___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = _os_feature_enabled_impl();
  int v8 = [v5 type];
  if (v7)
  {
    if (v8 == 6 && [v6 type] != 6) {
      goto LABEL_12;
    }
    if ([v5 type] != 6 && objc_msgSend(v6, "type") == 6)
    {
LABEL_14:
      uint64_t v10 = 1;
      goto LABEL_16;
    }
  }
  else
  {
    if (v8 == 3 && [v6 type] != 3) {
      goto LABEL_12;
    }
    if ([v5 type] != 3 && objc_msgSend(v6, "type") == 3) {
      goto LABEL_14;
    }
  }
  unint64_t v9 = [v5 numberOfAssetsInExtendedForSharingConsideration:*(void *)(a1 + 32)];
  if (v9 <= [v6 numberOfAssetsInExtendedForSharingConsideration:*(void *)(a1 + 32)])
  {
    unint64_t v11 = [v5 numberOfAssetsInExtendedForSharingConsideration:*(void *)(a1 + 32)];
    if (v11 >= [v6 numberOfAssetsInExtendedForSharingConsideration:*(void *)(a1 + 32)])
    {
      v12 = [v5 startDate];
      v13 = [v6 startDate];
      uint64_t v10 = [v12 compare:v13];

      goto LABEL_16;
    }
    goto LABEL_14;
  }
LABEL_12:
  uint64_t v10 = -1;
LABEL_16:

  return v10;
}

- (id)highlightItemsSortedByImportance:(id)a3 withSharingConsideration:(int64_t)a4
{
  id v5 = [a3 allObjects];
  id v6 = (void *)[v5 mutableCopy];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __81__PLMonthGroupingRule_highlightItemsSortedByImportance_withSharingConsideration___block_invoke;
  v8[3] = &__block_descriptor_40_e49_q24__0___PLHighlightItem__8___PLHighlightItem__16l;
  v8[4] = a4;
  [v6 sortUsingComparator:v8];
  return v6;
}

uint64_t __81__PLMonthGroupingRule_highlightItemsSortedByImportance_withSharingConsideration___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = _os_feature_enabled_impl();
  int v8 = [v5 type];
  int v9 = v8;
  if (v7)
  {
    BOOL v10 = v8 != 5;
    int v11 = [v6 type];
    if (v11 == 5 || v10) {
      uint64_t v13 = 1;
    }
    else {
      uint64_t v13 = -1;
    }
    if (((v10 ^ (v11 == 5)) & 1) == 0) {
      goto LABEL_34;
    }
LABEL_29:
    unint64_t v21 = [v5 numberOfAssetsInExtendedForSharingConsideration:*(void *)(a1 + 32)];
    unint64_t v22 = [v6 numberOfAssetsInExtendedForSharingConsideration:*(void *)(a1 + 32)];
    if (v21 <= v22)
    {
      if (v21 >= v22)
      {
        v23 = [v5 startDate];
        v24 = [v6 startDate];
        uint64_t v13 = [v23 compare:v24];
      }
      else
      {
        uint64_t v13 = 1;
      }
    }
    else
    {
      uint64_t v13 = -1;
    }
    goto LABEL_34;
  }
  unsigned int v14 = v8 - 3;
  int v15 = [v6 type];
  int v17 = v15 == 4 || (v15 - 1) < 2;
  BOOL v18 = v9 == 4 || v14 >= 0xFFFFFFFE;
  int v19 = !v18;
  if (v18) {
    int v20 = v17;
  }
  else {
    int v20 = 1;
  }
  if (v20) {
    uint64_t v13 = 1;
  }
  else {
    uint64_t v13 = -1;
  }
  if (v17 != v19) {
    goto LABEL_29;
  }
LABEL_34:

  return v13;
}

- (unint64_t)_extendedAssetsCountThresholdForHighlightItem:(id)a3
{
  id v3 = a3;
  int v4 = _os_feature_enabled_impl();
  int v5 = [v3 type];

  BOOL v7 = v5 == 4 || (v5 - 1) < 2;
  if (v4) {
    BOOL v7 = v5 == 5;
  }
  if (v7) {
    return 0;
  }
  else {
    return 6;
  }
}

- (BOOL)highlightItemHasMinimumRequirementToBePromoted:(id)a3 withSharingConsideration:(int64_t)a4
{
  id v6 = a3;
  int v7 = _os_feature_enabled_impl();
  int v8 = [v6 type];
  if (v7)
  {
    if (v8 == 6 || [v6 kind]) {
      goto LABEL_10;
    }
  }
  else if (v8 == 3 || [v6 type] == 6 || objc_msgSend(v6, "type") == 5)
  {
    goto LABEL_10;
  }
  [v6 promotionScore];
  if (v9 > 0.2 && ([v6 isRecent] & 1) == 0)
  {
    unint64_t v12 = [(PLMonthGroupingRule *)self _extendedAssetsCountThresholdForHighlightItem:v6];
    BOOL v10 = [v6 numberOfAssetsInExtendedForSharingConsideration:a4] > v12;
    goto LABEL_11;
  }
LABEL_10:
  BOOL v10 = 0;
LABEL_11:

  return v10;
}

- (unint64_t)maximumNumberOfHighlightItemsToPromote
{
  if (_os_feature_enabled_impl()) {
    return 6;
  }
  else {
    return 5;
  }
}

- (BOOL)highlightItemList:(id)a3 canBeMergedWithOtherHighlightItemList:(id)a4
{
  return 0;
}

- (BOOL)highlightItem:(id)a3 belongsToHighlightItemList:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 groupingStartDate];
  if (v8)
  {
    double v9 = (void *)v8;
    BOOL v10 = [v7 groupingEndDate];

    if (v10)
    {
      int v11 = [(PLMonthGroupingRule *)self calendar];
      unint64_t v12 = [v7 groupingStartDate];
      uint64_t v13 = [v11 components:28 fromDate:v12];

      unsigned int v14 = [v7 groupingEndDate];
      int v15 = [v11 components:28 fromDate:v14];

      v16 = [v6 startDate];
      int v17 = [v11 components:28 fromDate:v16];

      BOOL v18 = [v6 endDate];
      int v19 = [v11 components:28 fromDate:v18];

      v46 = v13;
      uint64_t v20 = [v13 year];
      if (v20 != [v17 year])
      {
        uint64_t v21 = [v15 year];
        if (v21 != [v19 year])
        {
          BOOL v34 = 0;
LABEL_18:

          goto LABEL_19;
        }
      }
      unint64_t v22 = [v7 groupingStartDate];
      [v11 rangeOfUnit:16 inUnit:8 forDate:v22];
      uint64_t v24 = v23;

      v25 = [v6 startDate];
      [v11 rangeOfUnit:16 inUnit:8 forDate:v25];
      uint64_t v27 = v26;

      uint64_t v43 = v24;
      v45 = v15;
      v28 = [(PLMonthGroupingRule *)self dominantMonthDateComponentForStartDateComponents:v46 endDateComponents:v15 numberOfDaysInMonthOfStartDate:v24];
      v29 = [(PLMonthGroupingRule *)self dominantMonthDateComponentForStartDateComponents:v17 endDateComponents:v19 numberOfDaysInMonthOfStartDate:v27];
      uint64_t v30 = [v28 month];
      if (v30 == [v29 month])
      {
        uint64_t v31 = [v28 year];
        if (v31 == [v29 year])
        {
          uint64_t v32 = [v28 month];
          if (v32 == [v19 month])
          {
            uint64_t v33 = [v28 year];
            if (v33 == [v19 year])
            {
              BOOL v34 = 1;
LABEL_17:

              int v15 = v45;
              goto LABEL_18;
            }
          }
          v36 = (void *)[v28 copy];
          objc_msgSend(v36, "setMonth:", objc_msgSend(v36, "month") + 1);
          [v36 setDay:0];
          v42 = [v11 dateFromComponents:v36];
          v37 = [v6 endDate];
          v38 = [v11 components:16 fromDate:v42 toDate:v37 options:0];

          uint64_t v39 = v43 - [v17 day];
          uint64_t v44 = [v38 day];

          uint64_t v40 = v39;
          BOOL v34 = 1;
          if (v40 > 3 || v40 + 1 >= v44) {
            goto LABEL_17;
          }
        }
      }
      BOOL v34 = 0;
      goto LABEL_17;
    }
  }
  v35 = PLMomentsGetLog();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v48 = v7;
    _os_log_impl(&dword_19B3C7000, v35, OS_LOG_TYPE_ERROR, "unexpected nil startDate/endDate for: %@", buf, 0xCu);
  }

  BOOL v34 = 0;
LABEL_19:

  return v34;
}

- (id)dominantMonthDateComponentForStartDateComponents:(id)a3 endDateComponents:(id)a4 numberOfDaysInMonthOfStartDate:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  if (a5 - [v7 day] >= 5) {
    goto LABEL_9;
  }
  uint64_t v9 = [v7 month];
  uint64_t v10 = [v8 month];
  uint64_t v11 = [v8 year];
  uint64_t v12 = [v7 year];
  uint64_t v13 = v9 - v10 - 12 * (v11 - v12);
  if (v13 < 0) {
    uint64_t v13 = 12 * (v11 - v12) - (v9 - v10);
  }
  if ((unint64_t)v13 < 2)
  {
    int64_t v15 = a5 - [v7 day];
    if (v15 < [v8 day])
    {
      id v16 = v8;
LABEL_10:
      unsigned int v14 = v16;
      goto LABEL_11;
    }
LABEL_9:
    id v16 = v7;
    goto LABEL_10;
  }
  unsigned int v14 = (void *)[v7 copy];
  objc_msgSend(v14, "setMonth:", objc_msgSend(v14, "month") + 1);
  if ([v14 month] >= 13)
  {
    [v14 setMonth:1];
    objc_msgSend(v14, "setYear:", objc_msgSend(v14, "year") + 1);
  }
LABEL_11:

  return v14;
}

- (void)titlesForHighlightItemList:(id)a3 dateRangeTitleGenerator:(id)a4 forceUpdateLocale:(BOOL)a5 resultBlock:(id)a6
{
  BOOL v7 = a5;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = (void (**)(id, void, void *))a6;
  uint64_t v13 = [(PLMonthGroupingRule *)self calendar];
  unsigned int v14 = [v10 sortedChildHighlightItems];
  if ([v14 count])
  {
    int64_t v15 = [v14 firstObject];
    id v16 = [v15 endDate];

    int v17 = [v14 lastObject];
    BOOL v18 = [v17 startDate];

    if (v18 && v16)
    {
      int v19 = [v18 earlierDate:v16];

      id v34 = v10;
      uint64_t v32 = v11;
      BOOL v20 = v7;
      if (v19)
      {
        id v21 = v18;

        id v16 = v21;
      }
      unint64_t v22 = [v13 components:30 fromDate:v16];
      uint64_t v33 = v18;
      uint64_t v23 = [v13 components:30 fromDate:v18];
      uint64_t v24 = [v22 month];
      if (v24 != [v23 month])
      {
        [v13 rangeOfUnit:16 inUnit:8 forDate:v16];
        if (v25 - [v22 day] <= 5)
        {
          objc_msgSend(v22, "setMonth:", objc_msgSend(v22, "month") + 1);
          [v22 setDay:10];
        }
        uint64_t v26 = [v22 month];
        if (v26 != [v23 month] && objc_msgSend(v23, "day") <= 4)
        {
          objc_msgSend(v23, "setMonth:", objc_msgSend(v23, "month") - 1);
          [v23 setDay:10];
        }
      }
      uint64_t v27 = [v13 dateFromComponents:v22];
      v28 = [v13 dateFromComponents:v23];
      v29 = [v32 dateRangeTitleWithStartDate:v27 endDate:v28 category:0 kind:1 type:0 options:v20];
      v12[2](v12, 0, v29);

      id v11 = v32;
      BOOL v18 = v33;
      id v10 = v34;
    }
    else
    {
      uint64_t v31 = PLMomentsGetLog();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v36 = v10;
        _os_log_impl(&dword_19B3C7000, v31, OS_LOG_TYPE_FAULT, "Cannot generate title, unexpected nil startDate/endDate for: %@", buf, 0xCu);
      }

      v12[2](v12, 0, 0);
    }
  }
  else
  {
    uint64_t v30 = PLMomentsGetLog();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v36 = v10;
      _os_log_impl(&dword_19B3C7000, v30, OS_LOG_TYPE_FAULT, "Cannot generate title, no child highlights for: %@", buf, 0xCu);
    }

    v12[2](v12, 0, 0);
  }
}

- (void)titlesForHighlightItemList:(id)a3 dateRangeTitleGenerator:(id)a4 resultBlock:(id)a5
{
}

- (PLMonthGroupingRule)init
{
  v6.receiver = self;
  v6.super_class = (Class)PLMonthGroupingRule;
  v2 = [(PLMonthGroupingRule *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    calendar = v2->_calendar;
    v2->_calendar = (NSCalendar *)v3;
  }
  return v2;
}

@end
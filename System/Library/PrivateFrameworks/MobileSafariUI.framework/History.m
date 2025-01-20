@interface History
+ (BOOL)filterString:(id)a3 matchesHistoryItemAnywhereInTitleOrURL:(id)a4;
+ (BOOL)historyItemTitle:(id)a3 matchesFilterString:(id)a4;
+ (BOOL)historyItemURL:(id)a3 matchesFilter:(id)a4;
+ (BOOL)historyItemURL:(id)a3 matchesFilterStrings:(id)a4;
+ (_NSRange)hourRangeFromPartOfDay:(int64_t)a3;
+ (id)_localizedStringForTodayWithPartOfDay:(int64_t)a3;
+ (id)_localizedStringForWeekday:(int64_t)a3 partOfDay:(int64_t)a4;
+ (id)dayWithPeriodOfDayStringForDate:(id)a3;
+ (id)lowercaseStringTrimmedForHistorySearch:(id)a3;
+ (id)sessionIdentifierFromDate:(id)a3;
+ (id)sessionIdentifierFromSessionStartDate:(id)a3;
+ (id)sessionStartDateFromDate:(id)a3;
+ (id)sharedHistory;
+ (id)titleForHistoryItem:(id)a3;
+ (int64_t)partOfDayFromHourOfDay:(int64_t)a3;
+ (void)initialize;
+ (void)localeChanged:(__CFLocale *)a3;
- (BOOL)historyStoreShouldCheckDatabaseIntegrity:(id)a3;
- (Class)_historyItemClass;
- (_WKVisitedLinkStore)visitedLinkStore;
- (id)_weekdayMonthDateStringForDate:(id)a3;
- (id)titleForDate:(id)a3;
- (void)_addVisitedLinkForItemIfNeeded:(id)a3 withVisitOrigin:(int64_t)a4;
- (void)_removeAllVisitedLinks;
- (void)_updateForWKWebView:(id)a3 browserController:(id)a4 updates:(id)a5;
- (void)_webView:(id)a3 didNavigateWithNavigationData:(id)a4;
- (void)_webView:(id)a3 didPerformClientRedirectFromURL:(id)a4 toURL:(id)a5;
- (void)_webView:(id)a3 didPerformServerRedirectFromURL:(id)a4 toURL:(id)a5;
- (void)_webView:(id)a3 didUpdateHistoryTitle:(id)a4 forURL:(id)a5;
- (void)cancelDeferredUpdates;
- (void)commitDeferredUpdates;
- (void)dealloc;
- (void)removeItem:(id)a3;
@end

@implementation History

- (Class)_historyItemClass
{
  return (Class)objc_opt_class();
}

- (_WKVisitedLinkStore)visitedLinkStore
{
  visitedLinkStore = self->_visitedLinkStore;
  if (!visitedLinkStore)
  {
    v4 = (_WKVisitedLinkStore *)objc_alloc_init(MEMORY[0x1E4F467C8]);
    v5 = self->_visitedLinkStore;
    self->_visitedLinkStore = v4;

    v6 = dispatch_get_global_queue(17, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __27__History_visitedLinkStore__block_invoke;
    block[3] = &unk_1E6D79060;
    block[4] = self;
    dispatch_async(v6, block);

    visitedLinkStore = self->_visitedLinkStore;
  }
  return visitedLinkStore;
}

+ (void)localeChanged:(__CFLocale *)a3
{
  if (weekdayMonthDateFormatter) {
    CFRelease((CFTypeRef)weekdayMonthDateFormatter);
  }
  id v4 = (id)*MEMORY[0x1E4F4BE00];
  v5 = CFDateFormatterCreate(0, a3, kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
  if (!v5) {
    v5 = CFDateFormatterCreate(0, 0, kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
  }
  uint64_t v6 = CPDateFormatStringForFormatType();
  if (v6) {
    v7 = (__CFString *)v6;
  }
  else {
    v7 = @"EEEE, MMMM d";
  }
  CFDateFormatterSetFormat(v5, v7);

  weekdayMonthDateFormatter = (uint64_t)v5;
}

void __21__History_initialize__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)dateFormatter;
  dateFormatter = (uint64_t)v0;

  id v10 = (id)[objc_alloc(MEMORY[0x1E4F1CA20]) initWithLocaleIdentifier:@"en_US"];
  objc_msgSend((id)dateFormatter, "setLocale:");
  v2 = (void *)dateFormatter;
  id v3 = objc_alloc(MEMORY[0x1E4F1C9A8]);
  id v4 = (void *)[v3 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
  [v2 setCalendar:v4];

  [(id)dateFormatter setDateFormat:@"MMddyyyy"];
  id v5 = objc_alloc_init(MEMORY[0x1E4F28E58]);
  uint64_t v6 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  [v5 formUnionWithCharacterSet:v6];

  v7 = [MEMORY[0x1E4F28B88] punctuationCharacterSet];
  [v5 formUnionWithCharacterSet:v7];

  objc_storeStrong((id *)&TokenizationCharacterSet, v5);
  uint64_t v8 = [MEMORY[0x1E4F1C9A8] autoupdatingCurrentCalendar];
  v9 = (void *)calendar;
  calendar = v8;
}

void __24__History_sharedHistory__block_invoke()
{
  id v0 = [(WBUHistory *)[History alloc] initWithDatabaseID:0];
  v1 = (void *)+[History sharedHistory]::sharedHistory;
  +[History sharedHistory]::sharedHistory = (uint64_t)v0;
}

+ (void)initialize
{
  if (+[History initialize]::onceToken != -1) {
    dispatch_once(&+[History initialize]::onceToken, &__block_literal_global_19);
  }
}

uint64_t __27__History_visitedLinkStore__block_invoke_2(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __27__History_visitedLinkStore__block_invoke_3;
  v3[3] = &unk_1E6D7AC50;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(void *)(a1 + 40);
  return [v1 enumerateItemsUsingBlock:v3];
}

void __27__History_visitedLinkStore__block_invoke(uint64_t a1)
{
  v2 = +[History sharedHistory];
  [v2 waitUntilHistoryHasLoaded];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __27__History_visitedLinkStore__block_invoke_2;
  v5[3] = &unk_1E6D791E8;
  uint64_t v3 = *(void *)(a1 + 32);
  id v6 = v2;
  uint64_t v7 = v3;
  id v4 = v2;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

+ (id)sharedHistory
{
  if (+[History sharedHistory]::onceToken != -1) {
    dispatch_once(&+[History sharedHistory]::onceToken, &__block_literal_global_98);
  }
  v2 = (void *)+[History sharedHistory]::sharedHistory;
  return v2;
}

+ (id)dayWithPeriodOfDayStringForDate:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v6 = [v5 components:544 fromDate:v4];

  unint64_t v7 = [v6 hour];
  uint64_t v8 = 1;
  if (v7 - 12 >= 6) {
    uint64_t v8 = 2;
  }
  if (v7 >= 0xC) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0;
  }
  if (objc_msgSend(v4, "_web_isToday")) {
    [a1 _localizedStringForTodayWithPartOfDay:v9];
  }
  else {
  id v10 = objc_msgSend(a1, "_localizedStringForWeekday:partOfDay:", objc_msgSend(v6, "weekday"), v9);
  }

  return v10;
}

+ (int64_t)partOfDayFromHourOfDay:(int64_t)a3
{
  int64_t v3 = 1;
  if ((unint64_t)(a3 - 12) >= 6) {
    int64_t v3 = 2;
  }
  if ((unint64_t)a3 >= 0xC) {
    return v3;
  }
  else {
    return 0;
  }
}

+ (_NSRange)hourRangeFromPartOfDay:(int64_t)a3
{
  uint64_t v3 = 5;
  uint64_t v4 = 18;
  uint64_t v5 = 5;
  uint64_t v6 = 12;
  if (a3 != 1)
  {
    uint64_t v6 = 0;
    uint64_t v5 = 0;
  }
  if (a3 != 2)
  {
    uint64_t v4 = v6;
    uint64_t v3 = v5;
  }
  if (a3) {
    NSUInteger v7 = v4;
  }
  else {
    NSUInteger v7 = 0;
  }
  if (a3) {
    NSUInteger v8 = v3;
  }
  else {
    NSUInteger v8 = 11;
  }
  result.length = v8;
  result.location = v7;
  return result;
}

+ (id)_localizedStringForTodayWithPartOfDay:(int64_t)a3
{
  if ((unint64_t)a3 > 2)
  {
    uint64_t v4 = &stru_1F3C268E8;
  }
  else
  {
    _WBSLocalizedString();
    uint64_t v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

+ (id)_localizedStringForWeekday:(int64_t)a3 partOfDay:(int64_t)a4
{
  v53[21] = *MEMORY[0x1E4F143B8];
  {
    int64_t v39 = a3;
    int64_t v40 = a4;
    v52 = WBSLocalizedStringWithValue((NSString *)@"Sunday Morning", v9);
    v53[0] = v52;
    v51 = WBSLocalizedStringWithValue((NSString *)@"Sunday Afternoon", v10);
    v53[1] = v51;
    v50 = WBSLocalizedStringWithValue((NSString *)@"Sunday Evening", v11);
    v53[2] = v50;
    v49 = WBSLocalizedStringWithValue((NSString *)@"Monday Morning", v12);
    v53[3] = v49;
    v48 = WBSLocalizedStringWithValue((NSString *)@"Monday Afternoon", v13);
    v53[4] = v48;
    v47 = WBSLocalizedStringWithValue((NSString *)@"Monday Evening", v14);
    v53[5] = v47;
    v46 = WBSLocalizedStringWithValue((NSString *)@"Tuesday Morning", v15);
    v53[6] = v46;
    v45 = WBSLocalizedStringWithValue((NSString *)@"Tuesday Afternoon", v16);
    v53[7] = v45;
    v44 = WBSLocalizedStringWithValue((NSString *)@"Tuesday Evening", v17);
    v53[8] = v44;
    v43 = WBSLocalizedStringWithValue((NSString *)@"Wednesday Morning", v18);
    v53[9] = v43;
    v42 = WBSLocalizedStringWithValue((NSString *)@"Wednesday Afternoon", v19);
    v53[10] = v42;
    v41 = WBSLocalizedStringWithValue((NSString *)@"Wednesday Evening", v20);
    v53[11] = v41;
    v22 = WBSLocalizedStringWithValue((NSString *)@"Thursday Morning", v21);
    v53[12] = v22;
    v24 = WBSLocalizedStringWithValue((NSString *)@"Thursday Afternoon", v23);
    v53[13] = v24;
    v26 = WBSLocalizedStringWithValue((NSString *)@"Thursday Evening", v25);
    v53[14] = v26;
    v28 = WBSLocalizedStringWithValue((NSString *)@"Friday Morning", v27);
    v53[15] = v28;
    v30 = WBSLocalizedStringWithValue((NSString *)@"Friday Afternoon", v29);
    v53[16] = v30;
    v32 = WBSLocalizedStringWithValue((NSString *)@"Friday Evening", v31);
    v53[17] = v32;
    v34 = WBSLocalizedStringWithValue((NSString *)@"Saturday Morning", v33);
    v53[18] = v34;
    v36 = WBSLocalizedStringWithValue((NSString *)@"Saturday Afternoon", v35);
    v53[19] = v36;
    v38 = WBSLocalizedStringWithValue((NSString *)@"Saturday Evening", v37);
    v53[20] = v38;
    +[History _localizedStringForWeekday:partOfDay:]::localizedWeekdayPartOfDayArray = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:21];

    a3 = v39;
    a4 = v40;
  }
  if ((unint64_t)a4 >= 3) {
    int64_t v6 = -1;
  }
  else {
    int64_t v6 = a4;
  }
  NSUInteger v7 = [(id)+[History _localizedStringForWeekday:partOfDay:]::localizedWeekdayPartOfDayArray objectAtIndexedSubscript:3 * a3 + v6 - 3];
  return v7;
}

+ (id)sessionIdentifierFromDate:(id)a3
{
  uint64_t v4 = [a1 sessionStartDateFromDate:a3];
  uint64_t v5 = [a1 sessionIdentifierFromSessionStartDate:v4];

  return v5;
}

+ (id)sessionStartDateFromDate:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [(id)dateFormatter calendar];
  uint64_t v5 = [v4 components:32 fromDate:v3];

  uint64_t v6 = +[History hourRangeFromPartOfDay:](History, "hourRangeFromPartOfDay:", +[History partOfDayFromHourOfDay:](History, "partOfDayFromHourOfDay:", [v5 hour]));
  NSUInteger v7 = [(id)dateFormatter calendar];
  NSUInteger v8 = [v7 dateBySettingHour:v6 minute:0 second:0 ofDate:v3 options:0];

  return v8;
}

+ (id)sessionIdentifierFromSessionStartDate:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [(id)dateFormatter calendar];
  uint64_t v5 = [v4 components:32 fromDate:v3];

  int64_t v6 = +[History partOfDayFromHourOfDay:](History, "partOfDayFromHourOfDay:", [v5 hour]);
  NSUInteger v7 = NSString;
  NSUInteger v8 = [(id)dateFormatter stringFromDate:v3];
  uint64_t v9 = [v7 stringWithFormat:@"%@-%ld", v8, v6];

  return v9;
}

+ (id)lowercaseStringTrimmedForHistorySearch:(id)a3
{
  id v3 = [a3 stringByTrimmingCharactersInSet:TokenizationCharacterSet];
  uint64_t v4 = [v3 lowercaseString];

  return v4;
}

+ (BOOL)historyItemTitle:(id)a3 matchesFilterString:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v5 length])
  {
    NSUInteger v7 = [v5 componentsSeparatedByCharactersInSet:TokenizationCharacterSet];
    [v6 componentsSeparatedByCharactersInSet:TokenizationCharacterSet];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      id v15 = v6;
      uint64_t v10 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          v16[0] = MEMORY[0x1E4F143A8];
          v16[1] = 3221225472;
          v16[2] = __48__History_historyItemTitle_matchesFilterString___block_invoke;
          v16[3] = &unk_1E6D7ABD8;
          v16[4] = v12;
          if (objc_msgSend(v7, "indexOfObjectPassingTest:", v16, v15) == 0x7FFFFFFFFFFFFFFFLL)
          {
            BOOL v13 = 0;
            goto LABEL_12;
          }
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v9) {
          continue;
        }
        break;
      }
      BOOL v13 = 1;
LABEL_12:
      id v6 = v15;
    }
    else
    {
      BOOL v13 = 1;
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

BOOL __48__History_historyItemTitle_matchesFilterString___block_invoke(uint64_t a1, void *a2)
{
  return [a2 rangeOfString:*(void *)(a1 + 32) options:9] != 0x7FFFFFFFFFFFFFFFLL;
}

+ (BOOL)historyItemURL:(id)a3 matchesFilter:(id)a4
{
  unint64_t v4 = [MEMORY[0x1E4F98F68] matchLocationForString:a4 inURLString:a3];
  return (v4 > 8) | (0x24u >> v4) & 1;
}

+ (BOOL)historyItemURL:(id)a3 matchesFilterStrings:(id)a4
{
  id v6 = a3;
  NSUInteger v7 = [a4 allObjects];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __47__History_historyItemURL_matchesFilterStrings___block_invoke;
  v11[3] = &unk_1E6D7AC00;
  id v13 = a1;
  id v8 = v6;
  id v12 = v8;
  char v9 = objc_msgSend(v7, "safari_containsObjectPassingTest:", v11);

  return v9;
}

uint64_t __47__History_historyItemURL_matchesFilterStrings___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v6 = a1 + 32;
  uint64_t v5 = *(void *)(a1 + 32);
  unint64_t v4 = *(void **)(v6 + 8);
  NSUInteger v7 = (void *)[objc_alloc(MEMORY[0x1E4F98F70]) initWithString:v3];
  uint64_t v8 = [v4 historyItemURL:v5 matchesFilter:v7];

  return v8;
}

+ (BOOL)filterString:(id)a3 matchesHistoryItemAnywhereInTitleOrURL:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v21 = a4;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = [a3 components];
  uint64_t v5 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v5)
  {
    char v6 = 0;
    char v7 = 0;
    uint64_t v20 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v23 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F98F70]) initWithString:v9];
        v11 = objc_opt_class();
        id v12 = [v21 urlString];
        int v13 = [v11 historyItemURL:v12 matchesFilter:v10];

        v14 = objc_opt_class();
        id v15 = [v21 title];
        int v16 = [v14 historyItemTitle:v15 matchesFilterString:v9];

        if (((v13 | v16) & 1) == 0)
        {

          goto LABEL_11;
        }

        v6 |= v13;
        v7 |= v16;
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v5) {
        continue;
      }
      break;
    }
    char v17 = v6 & v7;
  }
  else
  {
LABEL_11:
    char v17 = 0;
  }

  return v17 & 1;
}

- (void)dealloc
{
  [(History *)self cancelDeferredUpdates];
  v3.receiver = self;
  v3.super_class = (Class)History;
  [(History *)&v3 dealloc];
}

+ (id)titleForHistoryItem:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [v3 title];
  if (![v4 length])
  {
    uint64_t v5 = [v3 url];
    if (![v5 isFileURL]) {
      goto LABEL_4;
    }
    char v6 = [MEMORY[0x1E4F28CB8] defaultManager];
    char v7 = [v5 path];
    uint64_t v8 = [v6 displayNameAtPath:v7];

    unint64_t v4 = (void *)v8;
    if (!v8)
    {
LABEL_4:
      uint64_t v9 = objc_msgSend(v5, "safari_userVisibleString");

      if (v9)
      {
        uint64_t v10 = objc_msgSend(v9, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 4, 1, 0);

        unint64_t v4 = (void *)v10;
      }
      else
      {
        unint64_t v4 = _WBSLocalizedString();
      }
    }
  }
  return v4;
}

- (id)titleForDate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)calendar;
  char v6 = [MEMORY[0x1E4F1C9C8] date];
  char v7 = [v5 components:28 fromDate:v6];

  objc_msgSend(v7, "setDay:", objc_msgSend(v7, "day") - 1);
  uint64_t v8 = [(id)calendar dateFromComponents:v7];
  if ([v4 compare:v8] == -1) {
    [(History *)self _weekdayMonthDateStringForDate:v4];
  }
  else {
  uint64_t v9 = +[History dayWithPeriodOfDayStringForDate:v4];
  }

  return v9;
}

- (id)_weekdayMonthDateStringForDate:(id)a3
{
  StringWithDate = (__CFString *)CFDateFormatterCreateStringWithDate(0, (CFDateFormatterRef)weekdayMonthDateFormatter, (CFDateRef)a3);
  return StringWithDate;
}

- (void)commitDeferredUpdates
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v3 = self->_deferredUpdates;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v3);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v7 + 1) + 8 * v6) + 16))(*(void *)(*((void *)&v7 + 1) + 8 * v6));
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }

  [(NSMutableArray *)self->_deferredUpdates removeAllObjects];
}

- (void)cancelDeferredUpdates
{
}

- (void)removeItem:(id)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v6[0] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  [(WBSHistory *)self _removeHistoryItemsInResponseToUserAction:v5];
}

- (BOOL)historyStoreShouldCheckDatabaseIntegrity:(id)a3
{
  id v3 = objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults", a3);
  char v4 = [v3 BOOLForKey:@"ShouldCheckHistoryStoreDatabaseIntegrity"];
  if ((v4 & 1) == 0) {
    [v3 setBool:1 forKey:@"ShouldCheckHistoryStoreDatabaseIntegrity"];
  }
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  char v17 = __Block_byref_object_copy__5;
  long long v18 = __Block_byref_object_dispose__5;
  id v19 = 0;
  uint64_t v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v6 = *MEMORY[0x1E4FB2640];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __52__History_historyStoreShouldCheckDatabaseIntegrity___block_invoke;
  v11[3] = &unk_1E6D7AC28;
  id v7 = v3;
  id v12 = v7;
  int v13 = &v14;
  uint64_t v8 = [v5 addObserverForName:v6 object:0 queue:0 usingBlock:v11];
  long long v9 = (void *)v15[5];
  v15[5] = v8;

  _Block_object_dispose(&v14, 8);
  return v4;
}

void __52__History_historyStoreShouldCheckDatabaseIntegrity___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) removeObjectForKey:@"ShouldCheckHistoryStoreDatabaseIntegrity"];
  v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 removeObserver:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];

  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  char v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;
}

void __27__History_visitedLinkStore__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 104);
  id v3 = [a2 url];
  objc_msgSend(v2, "addVisitedLinkWithURL:");
}

- (void)_updateForWKWebView:(id)a3 browserController:(id)a4 updates:(id)a5
{
  id v14 = a3;
  id v8 = a4;
  long long v9 = (void (**)(void))a5;
  if ([v8 shouldDeferHistoryUpdatesForWKWebView:v14])
  {
    deferredUpdates = self->_deferredUpdates;
    if (!deferredUpdates)
    {
      v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v12 = self->_deferredUpdates;
      self->_deferredUpdates = v11;

      deferredUpdates = self->_deferredUpdates;
    }
    int v13 = (void *)[v9 copy];
    [(NSMutableArray *)deferredUpdates addObject:v13];
  }
  else
  {
    v9[2](v9);
  }
}

- (void)_removeAllVisitedLinks
{
}

- (void)_addVisitedLinkForItemIfNeeded:(id)a3 withVisitOrigin:(int64_t)a4
{
  id v6 = a3;
  if (a4)
  {
    visitedLinkStore = self->_visitedLinkStore;
    id v9 = v6;
    id v8 = [v6 url];
    [(_WKVisitedLinkStore *)visitedLinkStore addVisitedLinkWithURL:v8];

    id v6 = v9;
  }
}

- (void)_webView:(id)a3 didNavigateWithNavigationData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[TabDocument tabDocumentForWKWebView:v6];
  if ([v8 sessionStateRestorationSource] != 1)
  {
    id v9 = [v6 _unreachableURL];
    if (v9)
    {
      uint64_t v10 = 0;
    }
    else
    {
      id v14 = [v7 response];
      id v15 = self;
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {

        char v12 = 0;
        uint64_t v10 = 0;
        goto LABEL_10;
      }
      uint64_t v10 = [v14 statusCode];
      uint64_t v17 = WBSStatusCodeGroupFromStatusCode();

      if (v17 < 4)
      {
        char v12 = 0;
        goto LABEL_10;
      }
    }
    v11 = objc_msgSend(v9, "safari_originalDataAsString");
    char v12 = 1;
    if (v11)
    {
      uint64_t v28 = v10;
      char v13 = 0;
LABEL_21:
      v37[0] = 0;
      v37[1] = v37;
      v37[2] = 0x3032000000;
      v37[3] = __Block_byref_object_copy__5;
      v37[4] = __Block_byref_object_dispose__5;
      long long v25 = self;
      v38 = v25;
      v26 = [v8 browserController];
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __50__History__webView_didNavigateWithNavigationData___block_invoke;
      v29[3] = &unk_1E6D7AC78;
      id v30 = v6;
      id v27 = v11;
      id v31 = v27;
      v33 = v37;
      char v35 = v13;
      char v36 = v12;
      id v32 = v7;
      uint64_t v34 = v28;
      [(History *)v25 _updateForWKWebView:v30 browserController:v26 updates:v29];

      _Block_object_dispose(v37, 8);
      goto LABEL_22;
    }
LABEL_10:
    long long v18 = [v7 originalRequest];
    id v19 = [v18 URL];
    v11 = objc_msgSend(v19, "safari_originalDataAsString");
    uint64_t v28 = v10;

    if (v12)
    {
      char v13 = 0;
      char v12 = 1;
    }
    else
    {
      uint64_t v20 = [v7 originalRequest];
      id v21 = [v20 HTTPMethod];
      if (objc_msgSend(v21, "safari_isCaseInsensitiveEqualToString:", @"GET"))
      {
        char v13 = 0;
      }
      else if (objc_msgSend(v11, "safari_hasCaseInsensitivePrefix:", @"http:"))
      {
        char v13 = 1;
      }
      else
      {
        char v13 = objc_msgSend(v11, "safari_hasCaseInsensitivePrefix:", @"https:");
      }

      if ([v8 currentPageLoadedFromReadingList]
        && ([MEMORY[0x1E4F1CB10] URLWithString:v11],
            long long v22 = objc_claimAutoreleasedReturnValue(),
            [v8 customUserVisibleStringForReadingListBookmarkURL:v22],
            long long v23 = objc_claimAutoreleasedReturnValue(),
            v22,
            v23))
      {
        id v24 = v23;

        char v12 = 0;
        v11 = v24;
      }
      else
      {
        char v12 = 0;
      }
    }
    goto LABEL_21;
  }
LABEL_22:
}

void __50__History__webView_didNavigateWithNavigationData___block_invoke(uint64_t a1)
{
  id v17 = +[TabDocument tabDocumentForWKWebView:*(void *)(a1 + 32)];
  v2 = [v17 lastVisit];
  id v3 = [v2 item];
  char v4 = [v3 url];

  if (*(void *)(a1 + 40))
  {
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CB10], "URLWithString:");
    char v6 = objc_msgSend(v5, "safari_isSafariWebExtensionURL");

    if ((v6 & 1) == 0)
    {
      id v7 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      uint64_t v8 = *(void *)(a1 + 40);
      id v9 = [*(id *)(a1 + 48) title];
      uint64_t v10 = [v7 itemVisitedAtURLString:v8 title:v9 wasHTTPNonGet:*(unsigned __int8 *)(a1 + 72) wasFailure:*(unsigned __int8 *)(a1 + 73) increaseVisitCount:1 statusCode:*(void *)(a1 + 64)];
      [v17 setLastVisit:v10];
    }
  }
  v11 = [*(id *)(a1 + 32) URL];
  int v12 = [v4 isEqual:v11];

  if (v12)
  {
    char v13 = [v17 sameDocumentNavigationToHistoryVisitCorrelator];
    id v14 = [v17 lastVisit];
    [v13 noteVisit:v14];
  }
  id v15 = [v17 browserController];
  uint64_t v16 = [v15 tabController];
  [v16 saveTabDocumentUserActivitySoon:v17];
}

- (void)_webView:(id)a3 didPerformClientRedirectFromURL:(id)a4 toURL:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = +[TabDocument tabDocumentForWKWebView:v7];
  if ([v9 sessionStateRestorationSource] != 1)
  {
    uint64_t v10 = objc_msgSend(v8, "safari_originalDataAsString");
    v18[0] = 0;
    v18[1] = v18;
    v18[2] = 0x3032000000;
    v18[3] = __Block_byref_object_copy__5;
    v18[4] = __Block_byref_object_dispose__5;
    v11 = self;
    id v19 = v11;
    int v12 = [v9 browserController];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __58__History__webView_didPerformClientRedirectFromURL_toURL___block_invoke;
    v14[3] = &unk_1E6D7ACA0;
    id v15 = v9;
    id v17 = v18;
    id v13 = v10;
    id v16 = v13;
    [(History *)v11 _updateForWKWebView:v7 browserController:v12 updates:v14];

    _Block_object_dispose(v18, 8);
  }
}

void __58__History__webView_didPerformClientRedirectFromURL_toURL___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  id v8 = [v2 lastVisit];
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = [*(id *)(a1 + 32) lastVisit];
  char v6 = [v5 item];
  id v7 = objc_msgSend(v3, "itemRedirectedFrom:to:origin:date:statusCode:", v8, v4, 0, 0, objc_msgSend(v6, "statusCode"));
  [v2 setLastVisit:v7];
}

- (void)_webView:(id)a3 didPerformServerRedirectFromURL:(id)a4 toURL:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = +[TabDocument tabDocumentForWKWebView:v7];
  if ([v9 sessionStateRestorationSource] != 1)
  {
    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x3032000000;
    v16[3] = __Block_byref_object_copy__5;
    v16[4] = __Block_byref_object_dispose__5;
    uint64_t v10 = self;
    id v17 = v10;
    v11 = [v9 browserController];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __58__History__webView_didPerformServerRedirectFromURL_toURL___block_invoke;
    v12[3] = &unk_1E6D7ACA0;
    id v13 = v9;
    id v15 = v16;
    id v14 = v8;
    [(History *)v10 _updateForWKWebView:v7 browserController:v11 updates:v12];

    _Block_object_dispose(v16, 8);
  }
}

void __58__History__webView_didPerformServerRedirectFromURL_toURL___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  id v8 = [v2 lastVisit];
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 40), "safari_originalDataAsString");
  uint64_t v5 = [*(id *)(a1 + 32) lastVisit];
  char v6 = [v5 item];
  id v7 = objc_msgSend(v3, "itemRedirectedFrom:to:origin:date:statusCode:", v8, v4, 0, 0, objc_msgSend(v6, "statusCode"));
  [v2 setLastVisit:v7];
}

- (void)_webView:(id)a3 didUpdateHistoryTitle:(id)a4 forURL:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [v7 configuration];
  uint64_t v10 = [v9 websiteDataStore];
  char v11 = [v10 isPersistent];

  if (v11)
  {
    int v12 = +[TabDocument tabDocumentForWKWebView:v7];
    if ([v12 sessionStateRestorationSource] != 1)
    {
      id v13 = [v12 browserController];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __49__History__webView_didUpdateHistoryTitle_forURL___block_invoke;
      v14[3] = &unk_1E6D79970;
      id v15 = v12;
      id v16 = self;
      id v17 = v8;
      [(History *)self _updateForWKWebView:v7 browserController:v13 updates:v14];
    }
  }
}

void __49__History__webView_didUpdateHistoryTitle_forURL___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) lastVisit];
  if (v2) {
    [*(id *)(a1 + 40) updateTitle:*(void *)(a1 + 48) forVisit:v2];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visitedLinkStore, 0);
  objc_storeStrong((id *)&self->_deferredUpdates, 0);
}

@end
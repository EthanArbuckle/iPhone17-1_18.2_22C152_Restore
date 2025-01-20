@interface WLKComingSoonInfo
+ (id)comingSoonItemsWithDictionaries:(id)a3;
- (BOOL)isComingSoon;
- (NSString)brandID;
- (NSString)dateFormat;
- (NSString)dateString;
- (WLKComingSoonInfo)initWithDictionary:(id)a3;
- (WLKComingSoonInfo)initWithDictionary:(id)a3 brandID:(id)a4;
- (unint64_t)precision;
- (void)_initializeDatesStrings;
@end

@implementation WLKComingSoonInfo

+ (id)comingSoonItemsWithDictionaries:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * v9);
        v11 = [WLKComingSoonInfo alloc];
        v12 = -[WLKComingSoonInfo initWithDictionary:](v11, "initWithDictionary:", v10, (void)v16);
        if (v12) {
          [v4 addObject:v12];
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  if ([v4 count]) {
    v13 = v4;
  }
  else {
    v13 = 0;
  }
  id v14 = v13;

  return v14;
}

- (WLKComingSoonInfo)initWithDictionary:(id)a3 brandID:(id)a4
{
  id v6 = a4;
  uint64_t v7 = (void *)[a3 mutableCopy];
  [v7 setObject:v6 forKeyedSubscript:@"channelId"];

  uint64_t v8 = [(WLKComingSoonInfo *)self initWithDictionary:v7];
  return v8;
}

- (WLKComingSoonInfo)initWithDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKey:@"isComingSoon"];

  if (v5)
  {
    v16.receiver = self;
    v16.super_class = (Class)WLKComingSoonInfo;
    id v6 = [(WLKComingSoonInfo *)&v16 init];
    if (v6)
    {
      v6->_comingSoon = objc_msgSend(v4, "wlk_BOOLForKey:defaultValue:", @"isComingSoon", 0);
      uint64_t v7 = objc_msgSend(v4, "wlk_stringForKey:", @"comingSoonDate");
      dateFormat = v6->_dateFormat;
      v6->_dateFormat = (NSString *)v7;

      uint64_t v9 = objc_msgSend(v4, "wlk_stringForKey:", @"channelId");
      uint64_t v10 = [v9 copy];
      brandID = v6->_brandID;
      v6->_brandID = (NSString *)v10;

      if ([(NSString *)v6->_dateFormat length])
      {
        [(WLKComingSoonInfo *)v6 _initializeDatesStrings];
      }
      else if (v6->_comingSoon)
      {
        v12 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.WatchListKit"];
        uint64_t v13 = [v12 localizedStringForKey:@"COMING_SOON" value:&stru_1F13BCF18 table:@"WatchListKit"];
        dateString = v6->_dateString;
        v6->_dateString = (NSString *)v13;
      }
    }
    self = v6;
    id v5 = self;
  }

  return v5;
}

- (void)_initializeDatesStrings
{
  id v28 = [(NSString *)self->_dateFormat componentsSeparatedByString:@"-"];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  if ([v28 count] == 3)
  {
    self->_precision = 2;
    id v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.WatchListKit"];
    id v5 = [v4 localizedStringForKey:@"COMING_SOON_FULL_MONTH_DATE" value:&stru_1F13BCF18 table:@"WatchListKit"];

    id v6 = [v28 objectAtIndex:0];
    objc_msgSend(v3, "setYear:", objc_msgSend(v6, "integerValue"));

    uint64_t v7 = [v28 objectAtIndex:1];
    objc_msgSend(v3, "setMonth:", objc_msgSend(v7, "integerValue"));

    uint64_t v8 = [v28 objectAtIndex:2];
    objc_msgSend(v3, "setDay:", objc_msgSend(v8, "integerValue"));
    uint64_t v9 = @"MMMM d";
  }
  else if ([v28 count] == 2)
  {
    self->_precision = 1;
    uint64_t v10 = [v28 objectAtIndex:0];
    uint64_t v11 = [v10 integerValue];

    id v12 = objc_alloc(MEMORY[0x1E4F1C9A8]);
    uint64_t v8 = (void *)[v12 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
    uint64_t v13 = [MEMORY[0x1E4F1C9C8] date];
    id v14 = [v8 components:4 fromDate:v13];

    uint64_t v15 = [v14 year];
    objc_super v16 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.WatchListKit"];
    long long v17 = v16;
    if (v11 == v15) {
      long long v18 = @"COMING_SOON_IN_FULL_MONTH";
    }
    else {
      long long v18 = @"COMING_SOON_FULL_MONTH_YEAR";
    }
    if (v11 == v15) {
      uint64_t v9 = @"MMMM";
    }
    else {
      uint64_t v9 = @"MMMM y";
    }
    id v5 = [v16 localizedStringForKey:v18 value:&stru_1F13BCF18 table:@"WatchListKit"];

    [v3 setYear:v11];
    long long v19 = [v28 objectAtIndex:1];
    objc_msgSend(v3, "setMonth:", objc_msgSend(v19, "integerValue"));
  }
  else
  {
    if ([v28 count] != 1) {
      goto LABEL_14;
    }
    self->_precision = 0;
    v20 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.WatchListKit"];
    id v5 = [v20 localizedStringForKey:@"COMING_SOON_YEAR" value:&stru_1F13BCF18 table:@"WatchListKit"];

    uint64_t v8 = [v28 objectAtIndex:0];
    objc_msgSend(v3, "setYear:", objc_msgSend(v8, "integerValue"));
    uint64_t v9 = @"y";
  }

  uint64_t v21 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v22 = [v21 dateFromComponents:v3];
  id v23 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v23 setTimeStyle:0];
  v24 = [MEMORY[0x1E4F1CA20] currentLocale];
  [v23 setLocale:v24];

  [v23 setLocalizedDateFormatFromTemplate:v9];
  v25 = [v23 stringFromDate:v22];
  v26 = [NSString stringWithValidatedFormat:v5, @"%@", 0, v25 validFormatSpecifiers error];
  dateString = self->_dateString;
  self->_dateString = v26;

LABEL_14:
}

- (BOOL)isComingSoon
{
  return self->_comingSoon;
}

- (NSString)dateString
{
  return self->_dateString;
}

- (NSString)dateFormat
{
  return self->_dateFormat;
}

- (unint64_t)precision
{
  return self->_precision;
}

- (NSString)brandID
{
  return self->_brandID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_brandID, 0);
  objc_storeStrong((id *)&self->_dateFormat, 0);

  objc_storeStrong((id *)&self->_dateString, 0);
}

@end
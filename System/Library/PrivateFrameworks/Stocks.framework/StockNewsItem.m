@interface StockNewsItem
+ (id)localizedStringForDate:(id)a3;
- (NSDate)date;
- (NSString)headline;
- (NSString)localizedDateString;
- (NSString)source;
- (NSString)summary;
- (NSURL)link;
- (StockNewsItem)initWithArchiveDictionary:(id)a3;
- (id)archiveDictionary;
- (id)description;
- (int64_t)chronologicalComparisonWithNewsItem:(id)a3;
- (void)resetLocale;
- (void)setDate:(id)a3;
- (void)setHeadline:(id)a3;
- (void)setLink:(id)a3;
- (void)setSource:(id)a3;
- (void)setSummary:(id)a3;
@end

@implementation StockNewsItem

+ (id)localizedStringForDate:(id)a3
{
  CFDateRef v3 = (const __CFDate *)a3;
  if (v3)
  {
    if (!dateFormatter_0) {
      dateFormatter_0 = (uint64_t)CFDateFormatterCreate(0, (CFLocaleRef)[MEMORY[0x263EFF960] currentLocale], kCFDateFormatterShortStyle, kCFDateFormatterNoStyle);
    }
    if (!timeFormatter) {
      timeFormatter = (uint64_t)CFDateFormatterCreate(0, (CFLocaleRef)[MEMORY[0x263EFF960] currentLocale], kCFDateFormatterNoStyle, kCFDateFormatterShortStyle);
    }
    id v4 = objc_alloc(MEMORY[0x263EFF8F0]);
    v5 = (void *)[v4 initWithCalendarIdentifier:*MEMORY[0x263EFF3F8]];
    v6 = [MEMORY[0x263EFFA18] systemTimeZone];
    [v5 setTimeZone:v6];

    int v7 = [v5 isDateInToday:v3];
    StringWithDate = (__CFString *)CFDateFormatterCreateStringWithDate(0, (CFDateFormatterRef)timeFormatter, v3);
    v9 = StringWithDate;
    if (v7)
    {
      v10 = StringWithDate;
    }
    else
    {
      v11 = NSString;
      v12 = +[StocksBundles getBundle:1];
      v13 = [v12 localizedStringForKey:@"%@ at %@" value:&stru_26D5DA820 table:@"Localizable"];
      v14 = (__CFString *)CFDateFormatterCreateStringWithDate(0, (CFDateFormatterRef)dateFormatter_0, v3);
      objc_msgSend(v11, "stringWithFormat:", v13, v14, v9);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)resetLocale
{
  if (dateFormatter_0)
  {
    CFRelease((CFTypeRef)dateFormatter_0);
    dateFormatter_0 = 0;
  }
  if (timeFormatter)
  {
    CFRelease((CFTypeRef)timeFormatter);
    timeFormatter = 0;
  }
  localizedDateString = self->_localizedDateString;
  self->_localizedDateString = 0;
}

- (StockNewsItem)initWithArchiveDictionary:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)StockNewsItem;
  v5 = [(StockNewsItem *)&v17 init];
  if (v5)
  {
    v6 = [v4 objectForKey:@"nih"];
    int v7 = [v4 objectForKey:@"nisum"];
    v8 = [v4 objectForKey:@"nis"];
    v9 = [v4 objectForKey:@"nid"];
    v10 = [v4 objectForKey:@"nil"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && (uint64_t v11 = [objc_alloc(NSURL) initWithString:v10]) != 0)
    {
      v12 = (void *)v11;
      [(StockNewsItem *)v5 setHeadline:v6];
      [(StockNewsItem *)v5 setSummary:v7];
      [(StockNewsItem *)v5 setSource:v8];
      v13 = (void *)MEMORY[0x263EFF910];
      [v9 doubleValue];
      v14 = objc_msgSend(v13, "dateWithTimeIntervalSinceReferenceDate:");
      [(StockNewsItem *)v5 setDate:v14];

      [(StockNewsItem *)v5 setLink:v12];
      v15 = v5;
    }
    else
    {
      v15 = 0;
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)archiveDictionary
{
  id v3 = objc_alloc(NSNumber);
  [(NSDate *)self->_date timeIntervalSinceReferenceDate];
  id v4 = objc_msgSend(v3, "initWithDouble:");
  v5 = NSDictionary;
  headline = self->_headline;
  summary = self->_summary;
  v8 = [(NSURL *)self->_link absoluteString];
  v9 = objc_msgSend(v5, "dictionaryWithObjectsAndKeys:", headline, @"nih", summary, @"nisum", v4, @"nid", v8, @"nil", self->_source, @"nis", 0);

  return v9;
}

- (void)setDate:(id)a3
{
  v5 = (NSDate *)a3;
  p_date = &self->_date;
  if (self->_date != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_date, a3);
    localizedDateString = self->_localizedDateString;
    self->_localizedDateString = 0;

    v5 = v8;
  }

  MEMORY[0x270F9A758](p_date, v5);
}

- (int64_t)chronologicalComparisonWithNewsItem:(id)a3
{
  id v4 = [a3 date];
  v5 = [(StockNewsItem *)self date];
  int64_t v6 = [v4 compare:v5];

  return v6;
}

- (NSString)localizedDateString
{
  localizedDateString = self->_localizedDateString;
  if (!localizedDateString)
  {
    id v4 = +[StockNewsItem localizedStringForDate:self->_date];
    v5 = self->_localizedDateString;
    self->_localizedDateString = v4;

    localizedDateString = self->_localizedDateString;
  }

  return localizedDateString;
}

- (id)description
{
  id v3 = NSString;
  id v4 = [(StockNewsItem *)self headline];
  v5 = [(StockNewsItem *)self date];
  int64_t v6 = [v3 stringWithFormat:@"<StockNewsItem: %p, headline: %@, date: %@>", self, v4, v5];

  return v6;
}

- (NSString)headline
{
  return self->_headline;
}

- (void)setHeadline:(id)a3
{
}

- (NSString)summary
{
  return self->_summary;
}

- (void)setSummary:(id)a3
{
}

- (NSString)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
}

- (NSDate)date
{
  return self->_date;
}

- (NSURL)link
{
  return self->_link;
}

- (void)setLink:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedDateString, 0);
  objc_storeStrong((id *)&self->_link, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_summary, 0);

  objc_storeStrong((id *)&self->_headline, 0);
}

@end
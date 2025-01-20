@interface OITSUDateFormatter_FormatterCache
+ (id)dateFormatterStringFromDate:(id)a3 withFormat:(id)a4 locale:(id)a5;
- (OITSUDateFormatter_FormatterCache)init;
- (id)dateFormatterStringFromDate:(id)a3 withFormat:(id)a4 locale:(id)a5;
@end

@implementation OITSUDateFormatter_FormatterCache

- (OITSUDateFormatter_FormatterCache)init
{
  v8.receiver = self;
  v8.super_class = (Class)OITSUDateFormatter_FormatterCache;
  v2 = [(OITSUDateFormatter_FormatterCache *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    dateFormatterCacheLock = v2->_dateFormatterCacheLock;
    v2->_dateFormatterCacheLock = (NSLock *)v3;

    uint64_t v5 = objc_opt_new();
    dateFormatterCache = v2->_dateFormatterCache;
    v2->_dateFormatterCache = (NSMutableDictionary *)v5;
  }
  return v2;
}

- (id)dateFormatterStringFromDate:(id)a3 withFormat:(id)a4 locale:(id)a5
{
  CFDateRef v8 = (const __CFDate *)a3;
  v9 = (__CFString *)a4;
  id v10 = a5;
  StringWithDate = 0;
  if (v8 && v9)
  {
    [(NSLock *)self->_dateFormatterCacheLock lock];
    UsingHarmonizedSymbols = (__CFDateFormatter *)[(NSMutableDictionary *)self->_dateFormatterCache objectForKey:v9];
    if (!UsingHarmonizedSymbols)
    {
      v13 = [v10 gregorianCalendarLocale];
      UsingHarmonizedSymbols = TSUDateFormatterCFDateFormatterCreateUsingHarmonizedSymbols(0, v13, kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);

      CFStringRef v14 = (const __CFString *)*MEMORY[0x263EFFC10];
      v15 = TSUGetGMTTimeZone();
      CFDateFormatterSetProperty(UsingHarmonizedSymbols, v14, v15);

      CFDateFormatterSetFormat(UsingHarmonizedSymbols, v9);
      [(NSMutableDictionary *)self->_dateFormatterCache setObject:UsingHarmonizedSymbols forKey:v9];
    }
    StringWithDate = (__CFString *)CFDateFormatterCreateStringWithDate(0, UsingHarmonizedSymbols, v8);
    [(NSLock *)self->_dateFormatterCacheLock unlock];
  }

  return StringWithDate;
}

+ (id)dateFormatterStringFromDate:(id)a3 withFormat:(id)a4 locale:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v10 localeSpecificStorageForKey:@"TSUDateFormatter_FormatterCache"];
  if (!v11)
  {
    id v12 = a1;
    objc_sync_enter(v12);
    v11 = [v10 localeSpecificStorageForKey:@"TSUDateFormatter_FormatterCache"];
    if (!v11)
    {
      v11 = objc_opt_new();
      [v10 setLocaleSpecificStorage:v11 forKey:@"TSUDateFormatter_FormatterCache"];
    }
    objc_sync_exit(v12);
  }
  v13 = [v11 dateFormatterStringFromDate:v8 withFormat:v9 locale:v10];

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateFormatterCache, 0);
  objc_storeStrong((id *)&self->_dateFormatterCacheLock, 0);
}

@end
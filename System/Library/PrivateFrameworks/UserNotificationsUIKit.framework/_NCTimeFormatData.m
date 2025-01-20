@interface _NCTimeFormatData
+ (id)_timeFormatDataAccessLock;
+ (id)_timeLocaleForLocale:(id)a3;
+ (id)instanceForLocale:(id)a3;
- (NSNumberFormatter)doubleWidthNumberFormatter;
- (NSNumberFormatter)singleWidthNumberFormatter;
- (NSString)formatHourMin;
- (NSString)formatHourMinSec;
- (NSString)formatHourMinSecSubsec;
- (NSString)formatMin;
- (NSString)formatMinSec;
- (NSString)formatMinSecSubsec;
- (_NCTimeFormatData)initWithLocale:(id)a3;
@end

@implementation _NCTimeFormatData

+ (id)instanceForLocale:(id)a3
{
  id v4 = a3;
  v5 = [a1 _timeFormatDataAccessLock];
  [v5 lock];
  v6 = (void *)__formatData;
  if (!__formatData)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v8 = (void *)__formatData;
    __formatData = (uint64_t)v7;

    v6 = (void *)__formatData;
  }
  v9 = [v6 objectForKeyedSubscript:v4];
  if (!v9)
  {
    v9 = [[_NCTimeFormatData alloc] initWithLocale:v4];
    [(id)__formatData setObject:v9 forKeyedSubscript:v4];
  }
  [v5 unlock];

  return v9;
}

+ (id)_timeFormatDataAccessLock
{
  if (_timeFormatDataAccessLock_onceToken != -1) {
    dispatch_once(&_timeFormatDataAccessLock_onceToken, &__block_literal_global_25);
  }
  v2 = (void *)_timeFormatDataAccessLock_accessLock;

  return v2;
}

+ (id)_timeLocaleForLocale:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F1CA20];
  id v4 = a3;
  id v5 = [v3 alloc];
  v6 = [v4 localeIdentifier];

  id v7 = (void *)[v5 initWithLocaleIdentifier:v6];

  return v7;
}

- (_NCTimeFormatData)initWithLocale:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)_NCTimeFormatData;
  id v5 = [(_NCTimeFormatData *)&v30 init];
  if (v5)
  {
    v6 = [(id)objc_opt_class() _timeLocaleForLocale:v4];
    uint64_t v7 = [MEMORY[0x1E4F28C10] dateFormatFromTemplate:@"HHmm" options:0 locale:v6];
    formatHourMin = v5->_formatHourMin;
    v5->_formatHourMin = (NSString *)v7;

    uint64_t v9 = [MEMORY[0x1E4F28C10] dateFormatFromTemplate:@"HHmmssSS" options:0 locale:v6];
    formatHourMinSecSubsec = v5->_formatHourMinSecSubsec;
    v5->_formatHourMinSecSubsec = (NSString *)v9;

    uint64_t v11 = [MEMORY[0x1E4F28C10] dateFormatFromTemplate:@"HHmmss" options:0 locale:v6];
    formatHourMinSec = v5->_formatHourMinSec;
    v5->_formatHourMinSec = (NSString *)v11;

    uint64_t v13 = [MEMORY[0x1E4F28C10] dateFormatFromTemplate:@"mmssSS" options:0 locale:v6];
    formatMinSecSubsec = v5->_formatMinSecSubsec;
    v5->_formatMinSecSubsec = (NSString *)v13;

    uint64_t v15 = [MEMORY[0x1E4F28C10] dateFormatFromTemplate:@"mmss" options:0 locale:v6];
    formatMinSec = v5->_formatMinSec;
    v5->_formatMinSec = (NSString *)v15;

    uint64_t v17 = [MEMORY[0x1E4F28C10] dateFormatFromTemplate:@"m" options:0 locale:v6];
    formatMin = v5->_formatMin;
    v5->_formatMin = (NSString *)v17;

    v19 = [v6 localeIdentifier];
    int v20 = [v19 hasPrefix:@"ee_"];

    if (v20)
    {
      if ([(NSString *)v5->_formatMinSecSubsec hasPrefix:@"'aɖabaƒoƒo' "])
      {
        uint64_t v21 = -[NSString substringFromIndex:](v5->_formatMinSecSubsec, "substringFromIndex:", [@"'aɖabaƒoƒo' " length]);
        v22 = v5->_formatMinSecSubsec;
        v5->_formatMinSecSubsec = (NSString *)v21;
      }
      if ([(NSString *)v5->_formatMinSec hasPrefix:@"'aɖabaƒoƒo' "])
      {
        uint64_t v23 = -[NSString substringFromIndex:](v5->_formatMinSec, "substringFromIndex:", [@"'aɖabaƒoƒo' " length]);
        v24 = v5->_formatMinSec;
        v5->_formatMinSec = (NSString *)v23;
      }
    }
    v25 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E4F28EE0]);
    singleWidthNumberFormatter = v5->_singleWidthNumberFormatter;
    v5->_singleWidthNumberFormatter = v25;

    [(NSNumberFormatter *)v5->_singleWidthNumberFormatter setNumberStyle:0];
    [(NSNumberFormatter *)v5->_singleWidthNumberFormatter setPositiveFormat:@"0"];
    [(NSNumberFormatter *)v5->_singleWidthNumberFormatter setLocale:v4];
    v27 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E4F28EE0]);
    doubleWidthNumberFormatter = v5->_doubleWidthNumberFormatter;
    v5->_doubleWidthNumberFormatter = v27;

    [(NSNumberFormatter *)v5->_doubleWidthNumberFormatter setNumberStyle:0];
    [(NSNumberFormatter *)v5->_doubleWidthNumberFormatter setPositiveFormat:@"00"];
    [(NSNumberFormatter *)v5->_doubleWidthNumberFormatter setLocale:v4];
  }
  return v5;
}

- (NSString)formatHourMinSecSubsec
{
  return self->_formatHourMinSecSubsec;
}

- (NSString)formatHourMinSec
{
  return self->_formatHourMinSec;
}

- (NSString)formatHourMin
{
  return self->_formatHourMin;
}

- (NSString)formatMinSecSubsec
{
  return self->_formatMinSecSubsec;
}

- (NSString)formatMinSec
{
  return self->_formatMinSec;
}

- (NSString)formatMin
{
  return self->_formatMin;
}

- (NSNumberFormatter)singleWidthNumberFormatter
{
  return self->_singleWidthNumberFormatter;
}

- (NSNumberFormatter)doubleWidthNumberFormatter
{
  return self->_doubleWidthNumberFormatter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_doubleWidthNumberFormatter, 0);
  objc_storeStrong((id *)&self->_singleWidthNumberFormatter, 0);
  objc_storeStrong((id *)&self->_formatMin, 0);
  objc_storeStrong((id *)&self->_formatMinSec, 0);
  objc_storeStrong((id *)&self->_formatMinSecSubsec, 0);
  objc_storeStrong((id *)&self->_formatHourMin, 0);
  objc_storeStrong((id *)&self->_formatHourMinSec, 0);

  objc_storeStrong((id *)&self->_formatHourMinSecSubsec, 0);
}

@end
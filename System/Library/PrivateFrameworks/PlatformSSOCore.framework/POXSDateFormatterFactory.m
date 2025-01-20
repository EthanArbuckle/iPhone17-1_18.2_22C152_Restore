@interface POXSDateFormatterFactory
+ (id)newDateFormatter;
+ (id)newDateFormatters;
+ (id)newDateTimeFormatterWithTimeZoneStyle:(int64_t)a3;
+ (id)newDateTimeFormatters;
+ (id)newTimeFormatterWithTimeZoneStyle:(int64_t)a3;
+ (id)newTimeFormatters;
@end

@implementation POXSDateFormatterFactory

+ (id)newDateTimeFormatterWithTimeZoneStyle:(int64_t)a3
{
  if (a3 == 2)
  {
    v3 = objc_opt_new();
    v4 = (void *)[objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:@"en_US_POSIX"];
    [v3 setLocale:v4];
    v5 = @"uuuu'-'MM'-'dd'T'HH':'mm':'ss'Z'";
  }
  else if (a3 == 1)
  {
    v3 = objc_opt_new();
    v4 = (void *)[objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:@"en_US_POSIX"];
    [v3 setLocale:v4];
    v5 = @"uuuu'-'MM'-'dd'T'HH':'mm':'ssXXX";
  }
  else
  {
    if (a3) {
      return 0;
    }
    v3 = objc_opt_new();
    v4 = (void *)[objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:@"en_US_POSIX"];
    [v3 setLocale:v4];
    v5 = @"uuuu'-'MM'-'dd'T'HH':'mm':'ss";
  }
  [v3 setDateFormat:v5];
  v6 = (void *)[objc_alloc(MEMORY[0x263EFFA18]) initWithName:@"UTC"];
  [v3 setTimeZone:v6];
  v7 = [v3 calendar];
  [v7 setTimeZone:v6];

  return v3;
}

+ (id)newDateTimeFormatters
{
  v20[4] = *MEMORY[0x263EF8340];
  v2 = objc_opt_new();
  v3 = (void *)[objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:@"en_US_POSIX"];
  [v2 setLocale:v3];
  [v2 setDateFormat:@"y'-'M'-'d'T'HH':'mm':'ssXXX"];
  v4 = (void *)[objc_alloc(MEMORY[0x263EFFA18]) initWithName:@"UTC"];
  [v2 setTimeZone:v4];
  v5 = [v2 calendar];
  [v5 setTimeZone:v4];

  [v2 setLenient:1];
  v6 = objc_opt_new();
  v7 = (void *)[objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:@"en_US_POSIX"];
  [v6 setLocale:v7];
  [v6 setDateFormat:@"y'-'M'-'d'T'HH':'mm':'ss"];
  v8 = (void *)[objc_alloc(MEMORY[0x263EFFA18]) initWithName:@"UTC"];
  [v6 setTimeZone:v8];
  v9 = [v6 calendar];
  [v9 setTimeZone:v8];

  [v6 setLenient:1];
  v10 = objc_opt_new();
  v11 = (void *)[objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:@"en_US_POSIX"];
  [v10 setLocale:v11];
  [v10 setDateFormat:@"y'-'M'-'d'T'HH':'mm':'ss'.'SXXX"];
  v12 = (void *)[objc_alloc(MEMORY[0x263EFFA18]) initWithName:@"UTC"];
  [v10 setTimeZone:v12];
  v13 = [v10 calendar];
  [v13 setTimeZone:v12];

  [v10 setLenient:1];
  v14 = objc_opt_new();
  v15 = (void *)[objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:@"en_US_POSIX"];
  [v14 setLocale:v15];
  [v14 setDateFormat:@"y'-'M'-'d'T'HH':'mm':'ss'.'S"];
  v16 = (void *)[objc_alloc(MEMORY[0x263EFFA18]) initWithName:@"UTC"];
  [v14 setTimeZone:v16];
  v17 = [v14 calendar];
  [v17 setTimeZone:v16];

  [v14 setLenient:1];
  v20[0] = v2;
  v20[1] = v6;
  v20[2] = v10;
  v20[3] = v14;
  v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:4];

  return v18;
}

+ (id)newDateFormatter
{
  v2 = objc_opt_new();
  v3 = (void *)[objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:@"en_US_POSIX"];
  [v2 setLocale:v3];
  [v2 setDateFormat:@"uuuu'-'MM'-'dd"];
  v4 = (void *)[objc_alloc(MEMORY[0x263EFFA18]) initWithName:@"UTC"];
  [v2 setTimeZone:v4];
  v5 = [v2 calendar];
  [v5 setTimeZone:v4];

  return v2;
}

+ (id)newDateFormatters
{
  v12[2] = *MEMORY[0x263EF8340];
  v2 = objc_opt_new();
  v3 = (void *)[objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:@"en_US_POSIX"];
  [v2 setLocale:v3];
  [v2 setDateFormat:@"y'-'M'-'dXXX"];
  v4 = (void *)[objc_alloc(MEMORY[0x263EFFA18]) initWithName:@"UTC"];
  [v2 setTimeZone:v4];
  v5 = [v2 calendar];
  [v5 setTimeZone:v4];

  [v2 setLenient:1];
  v6 = objc_opt_new();
  v7 = (void *)[objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:@"en_US_POSIX"];
  [v6 setLocale:v7];
  [v6 setDateFormat:@"y'-'M'-'d"];
  v8 = (void *)[objc_alloc(MEMORY[0x263EFFA18]) initWithName:@"UTC"];
  [v6 setTimeZone:v8];
  v9 = [v6 calendar];
  [v9 setTimeZone:v8];

  [v6 setLenient:1];
  v12[0] = v2;
  v12[1] = v6;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:2];

  return v10;
}

+ (id)newTimeFormatterWithTimeZoneStyle:(int64_t)a3
{
  if (a3 == 2)
  {
    v3 = objc_opt_new();
    v4 = (void *)[objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:@"en_US_POSIX"];
    [v3 setLocale:v4];
    v5 = @"HH':'mm':'ss'Z'";
  }
  else if (a3 == 1)
  {
    v3 = objc_opt_new();
    v4 = (void *)[objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:@"en_US_POSIX"];
    [v3 setLocale:v4];
    v5 = @"HH':'mm':'ssXXX";
  }
  else
  {
    if (a3) {
      return 0;
    }
    v3 = objc_opt_new();
    v4 = (void *)[objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:@"en_US_POSIX"];
    [v3 setLocale:v4];
    v5 = @"HH':'mm':'ss";
  }
  [v3 setDateFormat:v5];
  v6 = (void *)[objc_alloc(MEMORY[0x263EFFA18]) initWithName:@"UTC"];
  [v3 setTimeZone:v6];
  v7 = [v3 calendar];
  [v7 setTimeZone:v6];

  return v3;
}

+ (id)newTimeFormatters
{
  v20[4] = *MEMORY[0x263EF8340];
  v2 = objc_opt_new();
  v3 = (void *)[objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:@"en_US_POSIX"];
  [v2 setLocale:v3];
  [v2 setDateFormat:@"HH':'mm':'ssXXX"];
  v4 = (void *)[objc_alloc(MEMORY[0x263EFFA18]) initWithName:@"UTC"];
  [v2 setTimeZone:v4];
  v5 = [v2 calendar];
  [v5 setTimeZone:v4];

  [v2 setLenient:1];
  v6 = objc_opt_new();
  v7 = (void *)[objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:@"en_US_POSIX"];
  [v6 setLocale:v7];
  [v6 setDateFormat:@"HH':'mm':'ss"];
  v8 = (void *)[objc_alloc(MEMORY[0x263EFFA18]) initWithName:@"UTC"];
  [v6 setTimeZone:v8];
  v9 = [v6 calendar];
  [v9 setTimeZone:v8];

  [v6 setLenient:1];
  v10 = objc_opt_new();
  v11 = (void *)[objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:@"en_US_POSIX"];
  [v10 setLocale:v11];
  [v10 setDateFormat:@"HH':'mm':'ss'.'SXXX"];
  v12 = (void *)[objc_alloc(MEMORY[0x263EFFA18]) initWithName:@"UTC"];
  [v10 setTimeZone:v12];
  v13 = [v10 calendar];
  [v13 setTimeZone:v12];

  [v10 setLenient:1];
  v14 = objc_opt_new();
  v15 = (void *)[objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:@"en_US_POSIX"];
  [v14 setLocale:v15];
  [v14 setDateFormat:@"HH':'mm':'ss'.'S"];
  v16 = (void *)[objc_alloc(MEMORY[0x263EFFA18]) initWithName:@"UTC"];
  [v14 setTimeZone:v16];
  v17 = [v14 calendar];
  [v17 setTimeZone:v16];

  [v14 setLenient:1];
  v20[0] = v2;
  v20[1] = v6;
  v20[2] = v10;
  v20[3] = v14;
  v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:4];

  return v18;
}

@end
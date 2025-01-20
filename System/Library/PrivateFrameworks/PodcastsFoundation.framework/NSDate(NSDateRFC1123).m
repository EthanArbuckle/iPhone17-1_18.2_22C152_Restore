@interface NSDate(NSDateRFC1123)
+ (id)dateFromRFC1123:()NSDateRFC1123;
- (uint64_t)rfc1123String;
@end

@implementation NSDate(NSDateRFC1123)

+ (id)dateFromRFC1123:()NSDateRFC1123
{
  id v3 = a3;
  if (v3)
  {
    v4 = (void *)dateFromRFC1123__rfc1123;
    if (!dateFromRFC1123__rfc1123)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F28C10]);
      v6 = (void *)dateFromRFC1123__rfc1123;
      dateFromRFC1123__rfc1123 = (uint64_t)v5;

      v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CA20]) initWithLocaleIdentifier:@"en_US"];
      [(id)dateFromRFC1123__rfc1123 setLocale:v7];

      v8 = [MEMORY[0x1E4F1CAF0] timeZoneWithAbbreviation:@"GMT"];
      [(id)dateFromRFC1123__rfc1123 setTimeZone:v8];

      [(id)dateFromRFC1123__rfc1123 setDateFormat:@"EEE',' dd MMM yyyy HH':'mm':'ss z"];
      v4 = (void *)dateFromRFC1123__rfc1123;
    }
    v9 = [v4 dateFromString:v3];
    if (!v9)
    {
      v10 = (void *)dateFromRFC1123__rfc850;
      if (!dateFromRFC1123__rfc850)
      {
        id v11 = objc_alloc_init(MEMORY[0x1E4F28C10]);
        v12 = (void *)dateFromRFC1123__rfc850;
        dateFromRFC1123__rfc850 = (uint64_t)v11;

        v13 = [(id)dateFromRFC1123__rfc1123 locale];
        [(id)dateFromRFC1123__rfc850 setLocale:v13];

        v14 = [(id)dateFromRFC1123__rfc1123 timeZone];
        [(id)dateFromRFC1123__rfc850 setTimeZone:v14];

        [(id)dateFromRFC1123__rfc850 setDateFormat:@"EEEE',' dd'-'MMM'-'yy HH':'mm':'ss z"];
        v10 = (void *)dateFromRFC1123__rfc850;
      }
      v9 = [v10 dateFromString:v3];
      if (!v9)
      {
        v15 = (void *)dateFromRFC1123__asctime;
        if (!dateFromRFC1123__asctime)
        {
          id v16 = objc_alloc_init(MEMORY[0x1E4F28C10]);
          v17 = (void *)dateFromRFC1123__asctime;
          dateFromRFC1123__asctime = (uint64_t)v16;

          v18 = [(id)dateFromRFC1123__rfc1123 locale];
          [(id)dateFromRFC1123__asctime setLocale:v18];

          v19 = [(id)dateFromRFC1123__rfc1123 timeZone];
          [(id)dateFromRFC1123__asctime setTimeZone:v19];

          [(id)dateFromRFC1123__asctime setDateFormat:@"EEE MMM d HH':'mm':'ss yyyy"];
          v15 = (void *)dateFromRFC1123__asctime;
        }
        v9 = [v15 dateFromString:v3];
      }
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (uint64_t)rfc1123String
{
  v2 = (void *)rfc1123String_df;
  if (!rfc1123String_df)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    v4 = (void *)rfc1123String_df;
    rfc1123String_df = (uint64_t)v3;

    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA20]) initWithLocaleIdentifier:@"en_US"];
    [(id)rfc1123String_df setLocale:v5];

    v6 = [MEMORY[0x1E4F1CAF0] timeZoneWithAbbreviation:@"GMT"];
    [(id)rfc1123String_df setTimeZone:v6];

    [(id)rfc1123String_df setDateFormat:@"EEE',' dd MMM yyyy HH':'mm':'ss 'GMT'"];
    v2 = (void *)rfc1123String_df;
  }
  return [v2 stringFromDate:a1];
}

@end
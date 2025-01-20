@interface ICQError
+ (id)_errorWithCode:(int64_t)a3 retryAfter:(id)a4;
+ (id)_errorWithCode:(int64_t)a3 statusCode:(int64_t)a4;
+ (id)_formatterForHTTPDate;
+ (id)_retryAfterDateFromString:(id)a3;
+ (id)_retryAfterDelayFromString:(id)a3;
+ (id)clientErrorWithStatusCode:(int64_t)a3;
+ (id)retryErrorWithRetryAfter:(id)a3;
+ (id)serviceUnavailableWithRetryAfter:(id)a3;
@end

@implementation ICQError

+ (id)retryErrorWithRetryAfter:(id)a3
{
  return (id)[a1 _errorWithCode:16 retryAfter:a3];
}

+ (id)serviceUnavailableWithRetryAfter:(id)a3
{
  return (id)[a1 _errorWithCode:17 retryAfter:a3];
}

+ (id)clientErrorWithStatusCode:(int64_t)a3
{
  return (id)[a1 _errorWithCode:21 statusCode:a3];
}

+ (id)_errorWithCode:(int64_t)a3 retryAfter:(id)a4
{
  id v6 = a4;
  v7 = [a1 _retryAfterDelayFromString:v6];
  v8 = [a1 _retryAfterDateFromString:v6];

  v9 = [MEMORY[0x1E4F1CA60] dictionary];
  v10 = v9;
  if (v7) {
    [v9 setObject:v7 forKeyedSubscript:@"retryAfterDelay"];
  }
  if (v8) {
    [v10 setObject:v8 forKeyedSubscript:@"retryAfterDate"];
  }
  v11 = (void *)MEMORY[0x1E4F28C58];
  v12 = (void *)[v10 copy];
  v13 = [v11 errorWithDomain:@"com.apple.icloud.quota" code:a3 userInfo:v12];

  return v13;
}

+ (id)_retryAfterDelayFromString:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F28EE0];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 setNumberStyle:1];
  id v6 = [v5 numberFromString:v4];

  return v6;
}

+ (id)_retryAfterDateFromString:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _formatterForHTTPDate];
  id v6 = [v5 dateFromString:v4];

  return v6;
}

+ (id)_formatterForHTTPDate
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v3 = [MEMORY[0x1E4F1CA20] currentLocale];
  [v2 setLocale:v3];

  id v4 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
  [v2 setTimeZone:v4];

  [v2 setDateFormat:@"E, dd MMM yyyy HH:mm:ss 'GMT'"];
  return v2;
}

+ (id)_errorWithCode:(int64_t)a3 statusCode:(int64_t)a4
{
  id v6 = [MEMORY[0x1E4F1CA60] dictionary];
  if (a4)
  {
    v7 = [NSNumber numberWithInteger:a4];
    [v6 setObject:v7 forKeyedSubscript:@"statusCode"];
  }
  v8 = (void *)MEMORY[0x1E4F28C58];
  v9 = (void *)[v6 copy];
  v10 = [v8 errorWithDomain:@"com.apple.icloud.quota" code:a3 userInfo:v9];

  return v10;
}

@end
@interface WFWeatherDataServiceRequestSigner
+ (id)buildAuthHeader:(id)a3 withSecret:(id)a4 andDate:(id)a5;
+ (id)roundDate:(id)a3 toMinutes:(unint64_t)a4;
+ (void)signRequest:(id)a3 withDate:(id)a4;
+ (void)signRequest:(id)a3 withSecret:(id)a4 andDate:(id)a5;
@end

@implementation WFWeatherDataServiceRequestSigner

+ (void)signRequest:(id)a3 withDate:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  [(id)objc_opt_class() signRequest:v6 withSecret:@"m7K5xE7hT9lf4luzWj6CO9PDWdtkoNQbI3akfwHNu+A=" andDate:v5];
}

+ (void)signRequest:(id)a3 withSecret:(id)a4 andDate:(id)a5
{
  id v9 = a3;
  id v6 = a5;
  v7 = [v9 URL];
  if (v7)
  {
    v8 = [(id)objc_opt_class() buildAuthHeader:v7 withSecret:@"m7K5xE7hT9lf4luzWj6CO9PDWdtkoNQbI3akfwHNu+A=" andDate:v6];
    [v9 addValue:v8 forHTTPHeaderField:@"Authorization"];
  }
}

+ (id)buildAuthHeader:(id)a3 withSecret:(id)a4 andDate:(id)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  v7 = (objc_class *)MEMORY[0x263EFF8F8];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)[[v7 alloc] initWithBase64EncodedString:v9 options:0];

  v12 = [@"GET" dataUsingEncoding:4];
  v13 = (void *)[objc_alloc(MEMORY[0x263F08BA0]) initWithURL:v10 resolvingAgainstBaseURL:0];

  [v13 setScheme:0];
  v14 = [v13 string];
  v15 = [v14 stringByReplacingOccurrencesOfString:@"//" withString:&stru_26CD4CE08];

  v16 = [v15 dataUsingEncoding:4];
  v28 = v15;
  if (buildAuthHeader_withSecret_andDate__onceToken != -1) {
    dispatch_once(&buildAuthHeader_withSecret_andDate__onceToken, &__block_literal_global_17);
  }
  v17 = [(id)objc_opt_class() roundDate:v8 toMinutes:3];

  v18 = [(id)buildAuthHeader_withSecret_andDate__formatter stringFromDate:v17];
  v19 = [v18 dataUsingEncoding:4];
  memset(&ctx, 0, sizeof(ctx));
  id v20 = v11;
  CCHmacInit(&ctx, 2u, (const void *)[v20 bytes], objc_msgSend(v20, "length"));
  id v21 = v12;
  CCHmacUpdate(&ctx, (const void *)[v21 bytes], objc_msgSend(v21, "length"));
  id v22 = v16;
  CCHmacUpdate(&ctx, (const void *)[v22 bytes], objc_msgSend(v22, "length"));
  id v23 = v19;
  CCHmacUpdate(&ctx, (const void *)[v23 bytes], objc_msgSend(v23, "length"));
  CCHmacFinal(&ctx, macOut);
  v24 = [MEMORY[0x263EFF8F8] dataWithBytes:macOut length:32];
  v25 = [v24 base64EncodedStringWithOptions:0];
  v26 = [NSString stringWithFormat:@"HHMACdate=\"%@\";signature=\"%@\"", v18, v25];;

  return v26;
}

uint64_t __72__WFWeatherDataServiceRequestSigner_buildAuthHeader_withSecret_andDate___block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = buildAuthHeader_withSecret_andDate__formatter;
  buildAuthHeader_withSecret_andDate__formatter = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

+ (id)roundDate:(id)a3 toMinutes:(unint64_t)a4
{
  id v5 = (void *)MEMORY[0x263EFF8F0];
  id v6 = a3;
  v7 = [v5 currentCalendar];
  id v8 = [v7 components:3145852 fromDate:v6];

  [v8 setCalendar:v7];
  objc_msgSend(v8, "setMinute:", objc_msgSend(v8, "minute") / a4 * a4);
  id v9 = [v7 dateFromComponents:v8];

  return v9;
}

@end
@interface NSError(PerformanceTrace)
+ (id)error:()PerformanceTrace description:;
+ (id)error:()PerformanceTrace description:underlyingError:;
@end

@implementation NSError(PerformanceTrace)

+ (id)error:()PerformanceTrace description:
{
  v4 = (void *)MEMORY[0x263F087E8];
  if (a4)
  {
    v6 = [NSDictionary dictionaryWithObject:a4 forKey:*MEMORY[0x263F08320]];
    v7 = v4;
    uint64_t v8 = a3;
  }
  else
  {
    v6 = [NSDictionary dictionaryWithObject:@"Unknown Error (description cannot be nil)" forKey:*MEMORY[0x263F08320]];
    v7 = v4;
    uint64_t v8 = 0;
  }
  v9 = [v7 errorWithDomain:@"PerformanceTraceError" code:v8 userInfo:v6];

  return v9;
}

+ (id)error:()PerformanceTrace description:underlyingError:
{
  v21[2] = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  v9 = v8;
  if (v7)
  {
    if (v8)
    {
      uint64_t v10 = *MEMORY[0x263F08608];
      v20[0] = *MEMORY[0x263F08320];
      v20[1] = v10;
      v21[0] = v7;
      v21[1] = v8;
      v11 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];
      v12 = (void *)MEMORY[0x263F087E8];
      uint64_t v13 = a3;
      goto LABEL_7;
    }
    v14 = (void *)MEMORY[0x263F087E8];
    v15 = NSDictionary;
    uint64_t v16 = *MEMORY[0x263F08320];
    v17 = @"Unknown Error (underlyingError cannot be nil)";
  }
  else
  {
    v14 = (void *)MEMORY[0x263F087E8];
    v15 = NSDictionary;
    uint64_t v16 = *MEMORY[0x263F08320];
    v17 = @"Unknown Error (description cannot be nil)";
  }
  v11 = [v15 dictionaryWithObject:v17 forKey:v16];
  v12 = v14;
  uint64_t v13 = 0;
LABEL_7:
  v18 = [v12 errorWithDomain:@"PerformanceTraceError" code:v13 userInfo:v11];

  return v18;
}

@end
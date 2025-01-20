@interface NSError(Metrics)
- (id)metricsAdditionalData;
- (id)metricsContentIdentifier;
- (uint64_t)recordMetrics;
@end

@implementation NSError(Metrics)

- (id)metricsAdditionalData
{
  v14[4] = *MEMORY[0x1E4F143B8];
  v13[0] = @"code";
  v2 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(a1, "code"));
  v14[0] = v2;
  v13[1] = @"domain";
  uint64_t v3 = [a1 domain];
  v4 = (void *)v3;
  v5 = &stru_1F03A51F0;
  if (v3) {
    v5 = (__CFString *)v3;
  }
  v14[1] = v5;
  v13[2] = @"user_info";
  uint64_t v6 = [a1 userInfo];
  v7 = (void *)v6;
  uint64_t v8 = MEMORY[0x1E4F1CC08];
  if (v6) {
    uint64_t v8 = v6;
  }
  v14[2] = v8;
  v13[3] = @"call_stack";
  v9 = [MEMORY[0x1E4F29060] callStackSymbols];
  v10 = [v9 description];
  v14[3] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:4];

  return v11;
}

- (uint64_t)recordMetrics
{
  return +[IMMetrics recordUserAction:@"error" dataSource:a1];
}

- (id)metricsContentIdentifier
{
  v2 = NSString;
  uint64_t v3 = [a1 code];
  v4 = [a1 domain];
  v5 = [v2 stringWithFormat:@"NSError: %ld-%@", v3, v4];

  return v5;
}

@end
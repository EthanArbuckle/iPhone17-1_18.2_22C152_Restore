@interface NSError(PosterFoundation)
+ (id)pf_errorWithCode:()PosterFoundation;
+ (id)pf_errorWithCode:()PosterFoundation underlyingError:userInfo:;
+ (uint64_t)pf_errorWithCode:()PosterFoundation userInfo:;
- (uint64_t)pf_isFileNotFoundError;
@end

@implementation NSError(PosterFoundation)

+ (id)pf_errorWithCode:()PosterFoundation
{
  v10[1] = *MEMORY[0x263EF8340];
  uint64_t v9 = *MEMORY[0x263F08338];
  if ((unint64_t)(a3 - 1) > 2) {
    v5 = @"Unknown error.";
  }
  else {
    v5 = (__CFString *)*((void *)&off_26546EE00 + a3 - 1);
  }
  v10[0] = v5;
  v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  v7 = objc_msgSend(a1, "pf_errorWithCode:underlyingError:userInfo:", a3, 0, v6);

  return v7;
}

+ (uint64_t)pf_errorWithCode:()PosterFoundation userInfo:
{
  return objc_msgSend(a1, "pf_errorWithCode:underlyingError:userInfo:", a3, 0, a4);
}

+ (id)pf_errorWithCode:()PosterFoundation underlyingError:userInfo:
{
  id v8 = a4;
  uint64_t v9 = (void *)[a5 mutableCopy];
  v10 = v9;
  if (v9) {
    id v11 = v9;
  }
  else {
    id v11 = (id)objc_opt_new();
  }
  v12 = v11;

  if (v8) {
    [v12 setObject:v8 forKeyedSubscript:*MEMORY[0x263F08608]];
  }
  if ((unint64_t)(a3 - 1) > 2) {
    v13 = @"Unknown error.";
  }
  else {
    v13 = (__CFString *)*((void *)&off_26546EE00 + a3 - 1);
  }
  [v12 setObject:v13 forKeyedSubscript:*MEMORY[0x263F08338]];
  v14 = [a1 errorWithDomain:@"com.apple.PosterFoundation" code:a3 userInfo:v12];

  return v14;
}

- (uint64_t)pf_isFileNotFoundError
{
  v2 = [a1 domain];
  if ([v2 isEqualToString:*MEMORY[0x263F07F70]])
  {
    BOOL v3 = (([a1 code] - 4) & 0xFFFFFFFFFFFFFEFFLL) == 0;
  }
  else
  {
    if (![v2 isEqualToString:*MEMORY[0x263F08438]])
    {
      uint64_t v4 = 0;
      goto LABEL_9;
    }
    BOOL v3 = [a1 code] == 2;
  }
  uint64_t v4 = v3;
LABEL_9:

  return v4;
}

@end
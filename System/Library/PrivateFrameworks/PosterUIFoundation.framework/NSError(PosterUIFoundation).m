@interface NSError(PosterUIFoundation)
+ (id)pui_errorWithCode:()PosterUIFoundation;
+ (id)pui_errorWithCode:()PosterUIFoundation underlyingError:userInfo:;
+ (uint64_t)pui_errorWithCode:()PosterUIFoundation userInfo:;
@end

@implementation NSError(PosterUIFoundation)

+ (id)pui_errorWithCode:()PosterUIFoundation
{
  v10[1] = *MEMORY[0x263EF8340];
  uint64_t v9 = *MEMORY[0x263F08338];
  if ((unint64_t)(a3 - 1) > 8) {
    v5 = @"Unknown error.";
  }
  else {
    v5 = off_265471E00[a3 - 1];
  }
  v10[0] = v5;
  v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  v7 = objc_msgSend(a1, "pui_errorWithCode:underlyingError:userInfo:", a3, 0, v6);

  return v7;
}

+ (uint64_t)pui_errorWithCode:()PosterUIFoundation userInfo:
{
  return objc_msgSend(a1, "pui_errorWithCode:underlyingError:userInfo:", a3, 0, a4);
}

+ (id)pui_errorWithCode:()PosterUIFoundation underlyingError:userInfo:
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
  if ((unint64_t)(a3 - 1) > 8) {
    v13 = @"Unknown error.";
  }
  else {
    v13 = off_265471E00[a3 - 1];
  }
  [v12 setObject:v13 forKeyedSubscript:*MEMORY[0x263F08338]];
  v14 = [a1 errorWithDomain:@"com.apple.PosterUIFoundation.errorDomain" code:a3 userInfo:v12];

  return v14;
}

@end
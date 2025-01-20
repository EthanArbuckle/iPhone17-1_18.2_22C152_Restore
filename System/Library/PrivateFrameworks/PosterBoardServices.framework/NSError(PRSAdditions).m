@interface NSError(PRSAdditions)
+ (id)prs_errorWithCode:()PRSAdditions;
+ (id)prs_errorWithCode:()PRSAdditions underlyingError:userInfo:;
+ (uint64_t)prs_errorWithCode:()PRSAdditions userInfo:;
@end

@implementation NSError(PRSAdditions)

+ (id)prs_errorWithCode:()PRSAdditions
{
  v12[1] = *MEMORY[0x1E4F143B8];
  if (a3) {
    v5 = @"the 'currentConfiguration' argument was invalid.";
  }
  else {
    v5 = @"Unknown error.";
  }
  uint64_t v11 = *MEMORY[0x1E4F28588];
  v12[0] = v5;
  v6 = (void *)MEMORY[0x1E4F1C9E8];
  v7 = v5;
  v8 = [v6 dictionaryWithObjects:v12 forKeys:&v11 count:1];

  v9 = objc_msgSend(a1, "prs_errorWithCode:underlyingError:userInfo:", a3, 0, v8);

  return v9;
}

+ (uint64_t)prs_errorWithCode:()PRSAdditions userInfo:
{
  return objc_msgSend(a1, "prs_errorWithCode:underlyingError:userInfo:", a3, 0, a4);
}

+ (id)prs_errorWithCode:()PRSAdditions underlyingError:userInfo:
{
  id v8 = a4;
  v9 = (void *)[a5 mutableCopy];
  v10 = v9;
  if (v9) {
    id v11 = v9;
  }
  else {
    id v11 = (id)objc_opt_new();
  }
  v12 = v11;

  if (v8) {
    [v12 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
  }
  if (a3) {
    v13 = @"the 'currentConfiguration' argument was invalid.";
  }
  else {
    v13 = @"Unknown error.";
  }
  [v12 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F28588]];
  v14 = [a1 errorWithDomain:@"com.apple.PosterBoardServices.errorDomain" code:a3 userInfo:v12];

  return v14;
}

@end
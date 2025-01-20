@interface NSError(PRUtilities)
+ (id)pr_errorWithCode:()PRUtilities;
+ (id)pr_errorWithCode:()PRUtilities underlyingError:userInfo:;
+ (uint64_t)pr_errorWithCode:()PRUtilities userInfo:;
@end

@implementation NSError(PRUtilities)

+ (id)pr_errorWithCode:()PRUtilities
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v9 = *MEMORY[0x1E4F28588];
  if ((unint64_t)(a3 - 1) > 8) {
    v5 = @"Unknown error.";
  }
  else {
    v5 = off_1E54DCE88[a3 - 1];
  }
  v10[0] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  v7 = objc_msgSend(a1, "pr_errorWithCode:underlyingError:userInfo:", a3, 0, v6);

  return v7;
}

+ (uint64_t)pr_errorWithCode:()PRUtilities userInfo:
{
  return objc_msgSend(a1, "pr_errorWithCode:underlyingError:userInfo:", a3, 0, a4);
}

+ (id)pr_errorWithCode:()PRUtilities underlyingError:userInfo:
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
    [v12 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
  }
  if ((unint64_t)(a3 - 1) > 8) {
    v13 = @"Unknown error.";
  }
  else {
    v13 = off_1E54DCE88[a3 - 1];
  }
  [v12 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F28588]];
  v14 = [a1 errorWithDomain:@"com.apple.PosterKit.errorDomain" code:a3 userInfo:v12];

  return v14;
}

@end
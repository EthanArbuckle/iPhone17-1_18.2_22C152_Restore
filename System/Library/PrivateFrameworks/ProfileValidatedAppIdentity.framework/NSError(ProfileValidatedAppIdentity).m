@interface NSError(ProfileValidatedAppIdentity)
+ (id)pvai_wrappedError:()ProfileValidatedAppIdentity error:;
+ (uint64_t)pvai_errorWithCode:()ProfileValidatedAppIdentity;
+ (uint64_t)pvai_errorWithCode:()ProfileValidatedAppIdentity userInfo:;
@end

@implementation NSError(ProfileValidatedAppIdentity)

+ (uint64_t)pvai_errorWithCode:()ProfileValidatedAppIdentity
{
  return objc_msgSend(a1, "pvai_errorWithCode:userInfo:", a3, 0);
}

+ (uint64_t)pvai_errorWithCode:()ProfileValidatedAppIdentity userInfo:
{
  return [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.devicecheck.error.pvappidentity" code:a3 userInfo:a4];
}

+ (id)pvai_wrappedError:()ProfileValidatedAppIdentity error:
{
  id v5 = a4;
  v6 = v5;
  if (v5)
  {
    v7 = [v5 domain];
    char v8 = [v7 isEqualToString:@"com.apple.devicecheck.error.pvappidentity"];

    if (v8)
    {
      id v9 = v6;
      goto LABEL_7;
    }
    id v10 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [v10 setObject:v6 forKeyedSubscript:*MEMORY[0x263F08608]];
  }
  else
  {
    id v10 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  }
  objc_msgSend(MEMORY[0x263F087E8], "pvai_errorWithCode:userInfo:", a3, v10);
  id v9 = (id)objc_claimAutoreleasedReturnValue();

LABEL_7:

  return v9;
}

@end
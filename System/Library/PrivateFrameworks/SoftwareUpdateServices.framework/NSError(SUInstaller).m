@interface NSError(SUInstaller)
- (id)errorWithExtendedUserInfoFromOptions:()SUInstaller;
@end

@implementation NSError(SUInstaller)

- (id)errorWithExtendedUserInfoFromOptions:()SUInstaller
{
  id v4 = a3;
  v5 = [a1 domain];
  int v6 = [v5 isEqualToString:@"com.apple.softwareupdateservices.errors"];

  if (v6)
  {
    v7 = [a1 userInfo];

    v8 = (void *)MEMORY[0x263EFF9A0];
    if (v7)
    {
      v9 = [a1 userInfo];
      v10 = [v8 dictionaryWithDictionary:v9];
    }
    else
    {
      v10 = [MEMORY[0x263EFF9A0] dictionary];
    }
    v12 = [v4 clientName];
    int v13 = [v12 isEqualToString:@"dmd"];

    if (v13) {
      [v10 setSafeObject:MEMORY[0x263EFFA88] forKey:@"SUMDMInstallationRequest"];
    }
    v14 = (void *)MEMORY[0x263F087E8];
    v15 = [a1 domain];
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, objc_msgSend(a1, "code"), v10);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v11 = a1;
  }

  return v11;
}

@end
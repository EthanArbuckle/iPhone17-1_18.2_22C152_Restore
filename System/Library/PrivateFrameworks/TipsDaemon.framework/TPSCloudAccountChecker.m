@interface TPSCloudAccountChecker
+ (BOOL)isiCloudAccountEnabled;
+ (BOOL)isiCloudDataClassEnabled:(id)a3;
+ (id)_primaryCloudAccount;
@end

@implementation TPSCloudAccountChecker

+ (BOOL)isiCloudAccountEnabled
{
  v2 = [a1 _primaryCloudAccount];
  BOOL v3 = v2 != 0;

  return v3;
}

+ (id)_primaryCloudAccount
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F179C8]);
  BOOL v3 = objc_msgSend(v2, "aa_primaryAppleAccount");

  return v3;
}

+ (BOOL)isiCloudDataClassEnabled:(id)a3
{
  id v4 = a3;
  v5 = [a1 _primaryCloudAccount];
  v6 = [v5 enabledDataclasses];
  char v7 = [v6 containsObject:v4];

  return v7;
}

@end
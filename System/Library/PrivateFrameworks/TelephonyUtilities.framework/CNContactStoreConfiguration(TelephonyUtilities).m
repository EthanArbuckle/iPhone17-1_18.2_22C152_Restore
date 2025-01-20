@interface CNContactStoreConfiguration(TelephonyUtilities)
+ (id)tu_contactStoreConfigurationForBundleIdentifier:()TelephonyUtilities;
+ (id)tu_contactStoreConfigurationForCall:()TelephonyUtilities;
@end

@implementation CNContactStoreConfiguration(TelephonyUtilities)

+ (id)tu_contactStoreConfigurationForBundleIdentifier:()TelephonyUtilities
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1B990]);
  if ([v3 length])
  {
    v5 = objc_msgSend(MEMORY[0x1E4F28B50], "tu_assumedIdentityForBundleIdentifier:", v3);
  }
  else
  {
    v5 = 0;
  }
  [v4 setAssumedIdentity:v5];

  return v4;
}

+ (id)tu_contactStoreConfigurationForCall:()TelephonyUtilities
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1B990]);
  v5 = [v3 provider];
  int v6 = [v5 isSystemProvider];

  if (v6)
  {
    v7 = [v3 provider];
    [v7 assumedIdentity];
  }
  else
  {
    v7 = [MEMORY[0x1E4F28B50] mainBundle];
    objc_msgSend(v7, "tu_assumedIdentity");
  v8 = };

  [v4 setAssumedIdentity:v8];

  return v4;
}

@end
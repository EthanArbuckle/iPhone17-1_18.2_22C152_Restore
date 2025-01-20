@interface ICQInternetPrivacyRestrictions
+ (BOOL)isCloudPrivateRelayAllowed;
@end

@implementation ICQInternetPrivacyRestrictions

+ (BOOL)isCloudPrivateRelayAllowed
{
  v2 = [MEMORY[0x263F53C50] sharedConnection];
  char v3 = [v2 isCloudPrivateRelayAllowed];

  if ((v3 & 1) == 0)
  {
    v4 = _ICQGetLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_22C821000, v4, OS_LOG_TYPE_DEFAULT, "Privacy proxy prohibited by profile", v6, 2u);
    }
  }
  return v3;
}

@end
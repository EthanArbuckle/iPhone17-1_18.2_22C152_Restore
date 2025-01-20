@interface STSFRestrictionsPasscodeControllerShim
+ (id)keychainPasscodeForRestrictions;
+ (void)setKeychainPasscode:(id)a3;
@end

@implementation STSFRestrictionsPasscodeControllerShim

+ (id)keychainPasscodeForRestrictions
{
  return +[SFRestrictionsPasscodeController _keychainPasswordForRestrictions];
}

+ (void)setKeychainPasscode:(id)a3
{
}

@end
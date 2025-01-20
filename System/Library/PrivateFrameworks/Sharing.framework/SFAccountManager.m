@interface SFAccountManager
+ (void)appleAccountSignedIn;
+ (void)appleAccountSignedOut;
@end

@implementation SFAccountManager

+ (void)appleAccountSignedIn
{
  id v2 = +[SFCompanionXPCManager sharedManager];
  [v2 appleAccountSignedIn];
}

+ (void)appleAccountSignedOut
{
  id v2 = +[SFCompanionXPCManager sharedManager];
  [v2 appleAccountSignedOut];
}

@end
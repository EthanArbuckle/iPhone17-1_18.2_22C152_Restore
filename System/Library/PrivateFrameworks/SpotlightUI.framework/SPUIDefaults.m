@interface SPUIDefaults
+ (BOOL)enableFloatingWindow;
+ (BOOL)isPhone;
+ (BOOL)separateHeaderBlurLayeringEnabled;
+ (BOOL)useUnifiedBackground;
+ (double)bottomPaddingToKeyboard;
+ (id)textFieldTraits;
@end

@implementation SPUIDefaults

+ (BOOL)enableFloatingWindow
{
  return [a1 isPhone] ^ 1;
}

+ (BOOL)isPhone
{
  v2 = [MEMORY[0x263F1C5C0] currentDevice];
  BOOL v3 = [v2 userInterfaceIdiom] == 0;

  return v3;
}

+ (double)bottomPaddingToKeyboard
{
  return 3.0;
}

+ (BOOL)useUnifiedBackground
{
  return 1;
}

+ (BOOL)separateHeaderBlurLayeringEnabled
{
  return 1;
}

+ (id)textFieldTraits
{
  return +[SPUIProxySearchField sharedInstance];
}

@end
@interface PKAppProtectionShieldViewController
+ (id)createShieldViewController;
+ (id)createShieldViewControllerWithConfiguration:(id)a3;
- (PKAppProtectionShieldViewController)init;
@end

@implementation PKAppProtectionShieldViewController

- (PKAppProtectionShieldViewController)init
{
  return 0;
}

+ (id)createShieldViewController
{
  return (id)[a1 createShieldViewControllerWithConfiguration:0];
}

+ (id)createShieldViewControllerWithConfiguration:(id)a3
{
  id v3 = a3;
  v4 = [[_PKAppProtectionShieldViewController alloc] initWithConfiguration:v3];

  return v4;
}

@end
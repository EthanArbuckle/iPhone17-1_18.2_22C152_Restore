@interface ACMEUIController_Legacy
- (Class)customSignInClass;
- (Class)iTunesSignInClass;
- (Class)signInWidgetClass;
- (Class)standardSignInClass;
@end

@implementation ACMEUIController_Legacy

- (Class)standardSignInClass
{
  return (Class)objc_opt_class();
}

- (Class)customSignInClass
{
  return (Class)objc_opt_class();
}

- (Class)iTunesSignInClass
{
  return (Class)objc_opt_class();
}

- (Class)signInWidgetClass
{
  return (Class)objc_opt_class();
}

@end
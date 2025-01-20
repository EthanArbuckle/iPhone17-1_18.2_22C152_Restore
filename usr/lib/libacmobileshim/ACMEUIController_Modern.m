@interface ACMEUIController_Modern
- (Class)customSignInClass;
- (Class)iTunesSignInClass;
- (Class)signInWidgetClass;
- (Class)standardSignInClass;
@end

@implementation ACMEUIController_Modern

- (Class)standardSignInClass
{
  [MEMORY[0x263F1C5C0] currentDevice];
  if (objc_opt_respondsToSelector()) {
    [((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice")) userInterfaceIdiom];
  }

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
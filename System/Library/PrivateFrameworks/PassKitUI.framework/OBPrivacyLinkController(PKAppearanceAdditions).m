@interface OBPrivacyLinkController(PKAppearanceAdditions)
- (uint64_t)pk_applyAppearance:()PKAppearanceAdditions;
@end

@implementation OBPrivacyLinkController(PKAppearanceAdditions)

- (uint64_t)pk_applyAppearance:()PKAppearanceAdditions
{
  v9.receiver = a1;
  v9.super_class = (Class)&off_1EF3F27D0;
  id v4 = a3;
  objc_msgSendSuper2(&v9, sel_pk_applyAppearance_, v4);
  v5 = objc_msgSend(a1, "view", v9.receiver, v9.super_class);
  v6 = [v4 tintColor];
  [v5 setTintColor:v6];

  uint64_t v7 = [v4 hasDarkAppearance];
  return [a1 setPresentedViewControllerShouldUseDarkMode:v7];
}

@end
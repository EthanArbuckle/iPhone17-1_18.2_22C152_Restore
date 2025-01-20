@interface UIKBAutoFillMenus
+ (id)updatedSystemAutoFillMenuWithMenuElements:(id)a3;
+ (id)updatedSystemAutoFillMenuWithMenuElements:(id)a3 isSecureTextField:(BOOL)a4;
@end

@implementation UIKBAutoFillMenus

+ (id)updatedSystemAutoFillMenuWithMenuElements:(id)a3
{
  return (id)[a1 updatedSystemAutoFillMenuWithMenuElements:a3 isSecureTextField:0];
}

+ (id)updatedSystemAutoFillMenuWithMenuElements:(id)a3 isSecureTextField:(BOOL)a4
{
  id v5 = a3;
  if (+[UIKeyboard supportsAutoFillPanel])
  {
    v6 = +[UIKeyboardImpl activeInstance];
    if ([v6 isCurrentEditResponderInEditingMode]
      && ([(id)UIApp isProtectedDataAvailable] & 1) != 0)
    {
      v7 = +[UIKeyboard keyboardBundleIdentifier];
      char v8 = [v7 isEqualToString:@"com.apple.purplebuddy"];

      if ((v8 & 1) == 0)
      {
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __81__UIKBAutoFillMenus_updatedSystemAutoFillMenuWithMenuElements_isSecureTextField___block_invoke_2;
        v11[3] = &__block_descriptor_33_e25___NSArray_16__0__UIMenu_8l;
        BOOL v12 = a4;
        v9 = _UIMenuReplacingElementMatchingPredicate(v5, &__block_literal_global_618, v11);
        goto LABEL_8;
      }
    }
    else
    {
    }
  }
  v9 = 0;
LABEL_8:

  return v9;
}

uint64_t __81__UIKBAutoFillMenus_updatedSystemAutoFillMenuWithMenuElements_isSecureTextField___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = [v2 identifier];
    uint64_t v4 = [v3 isEqualToString:@"com.apple.menu.insert-from-external-sources"];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

id __81__UIKBAutoFillMenus_updatedSystemAutoFillMenuWithMenuElements_isSecureTextField___block_invoke_2(uint64_t a1, void *a2)
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
  if (!*(unsigned char *)(a1 + 32))
  {
    id v5 = _UILocalizedString(@"AUTOFILL_MENU_CONTACT", @"Contact label in system AutoFill menu", @"Contact");
    v6 = +[UIImage systemImageNamed:@"person.crop.circle"];
    v7 = +[UIAction actionWithTitle:v5 image:v6 identifier:@"com.apple.action.insert.contacts" handler:&__block_literal_global_30_3];
    [v4 addObject:v7];
  }
  char v8 = [MEMORY[0x1E4F28B50] mainBundle];
  v9 = [v8 bundleIdentifier];
  char v10 = [v9 isEqualToString:@"com.apple.SafariViewService"];

  if ((v10 & 1) == 0)
  {
    v11 = _UILocalizedString(@"AUTOFILL_MENU_PASSWORDS", @"Passwords label in system AutoFill menu", @"Passwords");
    BOOL v12 = +[UIImage systemImageNamed:@"key"];
    v13 = +[UIAction actionWithTitle:v11 image:v12 identifier:@"com.apple.action.insert.passwords" handler:&__block_literal_global_48_2];
    [v4 addObject:v13];
  }
  if (_os_feature_enabled_impl())
  {
    v14 = _UILocalizedString(@"AUTOFILL_MENU_CREDIT_CARD", @"Credit Card label in system AutoFill menu", @"Credit Card");
    v15 = +[UIImage systemImageNamed:@"creditcard"];
    v16 = +[UIAction actionWithTitle:v14 image:v15 identifier:@"com.apple.action.insert.creditcards" handler:&__block_literal_global_62_4];
    [v4 addObject:v16];
  }
  v17 = [v3 menuByReplacingChildren:v4];
  v20[0] = v17;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];

  return v18;
}

void __81__UIKBAutoFillMenus_updatedSystemAutoFillMenuWithMenuElements_isSecureTextField___block_invoke_3()
{
  id v0 = +[UIKeyboardImpl activeInstance];
  [v0 handleAutoFillContactPopoverCommand];
}

void __81__UIKBAutoFillMenus_updatedSystemAutoFillMenuWithMenuElements_isSecureTextField___block_invoke_4()
{
  id v0 = +[UIKeyboardImpl activeInstance];
  [v0 handleAutoFillPasswordPopoverCommand];
}

void __81__UIKBAutoFillMenus_updatedSystemAutoFillMenuWithMenuElements_isSecureTextField___block_invoke_5()
{
  id v0 = +[UIKeyboardImpl activeInstance];
  [v0 handleAutoFillCreditCardPopoverCommand];
}

@end
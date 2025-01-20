@interface SUUIJSNavigationDocument
- (BOOL)isStopPageBagValueOverrideEnabledForTab:(id)a3;
- (BOOL)isStopPageEnabledForTab:(id)a3;
- (void)showStopPageForTab:(id)a3 replacementAppAdamId:(id)a4 title:(id)a5 subtitle:(id)a6 artwork:(id)a7 deeplinkUrl:(id)a8 force:(BOOL)a9 purchasesUrl:(id)a10 wishlistButtonTitle:(id)a11 showWishlistButton:(BOOL)a12;
@end

@implementation SUUIJSNavigationDocument

- (void)showStopPageForTab:(id)a3 replacementAppAdamId:(id)a4 title:(id)a5 subtitle:(id)a6 artwork:(id)a7 deeplinkUrl:(id)a8 force:(BOOL)a9 purchasesUrl:(id)a10 wishlistButtonTitle:(id)a11 showWishlistButton:(BOOL)a12
{
  id v30 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a10;
  id v24 = a11;
  v25 = [(IKJSNavigationDocument *)self navigationControllerDelegate];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v27 = [(IKJSNavigationDocument *)self navigationControllerDelegate];
    LOBYTE(v29) = a12;
    LOBYTE(v28) = a9;
    [v27 showStopPageForTab:v30 replacementAppAdamId:v18 title:v19 subtitle:v20 artwork:v21 deeplinkUrl:v22 force:v28 purchasesUrl:v23 wishlistButtonTitle:v24 showWishlistButton:v29];
  }
}

- (BOOL)isStopPageEnabledForTab:(id)a3
{
  id v4 = a3;
  v5 = [(IKJSNavigationDocument *)self navigationControllerDelegate];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v7 = [(IKJSNavigationDocument *)self navigationControllerDelegate];
    char v8 = [v7 isStopPageEnabledForTab:v4];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (BOOL)isStopPageBagValueOverrideEnabledForTab:(id)a3
{
  id v4 = a3;
  v5 = [(IKJSNavigationDocument *)self navigationControllerDelegate];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v7 = [(IKJSNavigationDocument *)self navigationControllerDelegate];
    char v8 = [v7 isStopPageBagValueOverrideEnabledForTab:v4];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

@end
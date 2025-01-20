@interface OBPrivacyPresenter
+ (id)presenterForPrivacySplashWithBundle:(id)a3;
+ (id)presenterForPrivacySplashWithBundleAtPath:(id)a3;
+ (id)presenterForPrivacySplashWithIdentifier:(id)a3;
+ (id)presenterForPrivacyUnifiedAbout;
+ (id)presenterForPrivacyUnifiedAboutWithBundles:(id)a3;
+ (id)presenterForPrivacyUnifiedAboutWithBundlesAtPaths:(id)a3;
+ (id)presenterForPrivacyUnifiedAboutWithIdentifiers:(id)a3;
- (BOOL)animatePresentAndDismiss;
- (BOOL)darkMode;
- (BOOL)underlineLinks;
- (BOOL)usesFullScreenPresentation;
- (NSArray)presentedIdentifiers;
- (NSString)displayLanguage;
- (OBPrivacyCombinedController)combinedController;
- (OBPrivacySplashController)splashController;
- (UIColor)customTintColor;
- (UIViewController)presentedController;
- (UIViewController)presentingViewController;
- (id)dismissHandler;
- (id)presentationCompletionHandler;
- (int64_t)modalPresentationStyle;
- (unint64_t)supportedInterfaceOrientations;
- (void)_presenterDidDismiss;
- (void)dismiss;
- (void)present;
- (void)presentInNavigationStack:(id)a3;
- (void)presentInNavigationStack:(id)a3 animated:(BOOL)a4;
- (void)setAnimatePresentAndDismiss:(BOOL)a3;
- (void)setCombinedController:(id)a3;
- (void)setCustomTintColor:(id)a3;
- (void)setDarkMode:(BOOL)a3;
- (void)setDismissHandler:(id)a3;
- (void)setDisplayLanguage:(id)a3;
- (void)setModalPresentationStyle:(int64_t)a3;
- (void)setPresentationCompletionHandler:(id)a3;
- (void)setPresentedController:(id)a3;
- (void)setPresentedIdentifiers:(id)a3;
- (void)setPresentingViewController:(id)a3;
- (void)setSplashController:(id)a3;
- (void)setSupportedInterfaceOrientations:(unint64_t)a3;
- (void)setUnderlineLinks:(BOOL)a3;
- (void)setUsesFullScreenPresentation:(BOOL)a3;
@end

@implementation OBPrivacyPresenter

+ (id)presenterForPrivacySplashWithBundle:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 identifier];
  int v6 = [v5 isEqualToString:@"com.apple.onboarding.imessagefacetime"];

  if (v6)
  {
    v7 = [a1 presenterForPrivacyUnifiedAboutWithIdentifiers:&unk_1EEC37B00];
  }
  else
  {
    v8 = [v4 privacyFlow];
    if (v8)
    {
      v7 = objc_alloc_init(OBPrivacyPresenter);
      v9 = [[OBPrivacySplashController alloc] initWithFlow:v8];
      [(OBPrivacyPresenter *)v7 setSplashController:v9];

      v10 = [(OBPrivacyPresenter *)v7 splashController];
      [v10 setShowsLinkToUnifiedAbout:1];

      v11 = [v8 identifier];
      v14[0] = v11;
      v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
      [(OBPrivacyPresenter *)v7 setPresentedIdentifiers:v12];

      [(OBPrivacyPresenter *)v7 setModalPresentationStyle:2];
      [(OBPrivacyPresenter *)v7 setAnimatePresentAndDismiss:1];
    }
    else
    {
      v7 = 0;
    }
  }
  return v7;
}

+ (id)presenterForPrivacySplashWithIdentifier:(id)a3
{
  id v4 = +[OBBundle bundleWithIdentifier:a3];
  v5 = [a1 presenterForPrivacySplashWithBundle:v4];

  return v5;
}

+ (id)presenterForPrivacySplashWithBundleAtPath:(id)a3
{
  id v4 = +[OBBundle bundleAtPath:a3];
  v5 = [a1 presenterForPrivacySplashWithBundle:v4];

  return v5;
}

+ (id)presenterForPrivacyUnifiedAbout
{
  v2 = objc_opt_new();
  v3 = objc_opt_new();
  [v2 setCombinedController:v3];

  [v2 setModalPresentationStyle:2];
  [v2 setAnimatePresentAndDismiss:1];
  return v2;
}

+ (id)presenterForPrivacyUnifiedAboutWithBundles:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "identifier", (void)v14);
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  v11 = objc_opt_new();
  v12 = [[OBPrivacyCombinedController alloc] initWithBundles:v5];
  [v11 setCombinedController:v12];

  [v11 setPresentedIdentifiers:v4];
  [v11 setModalPresentationStyle:2];
  [v11 setAnimatePresentAndDismiss:1];

  return v11;
}

+ (id)presenterForPrivacyUnifiedAboutWithIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = +[OBBundleManager sharedManager];
  uint64_t v6 = [v5 bundlesWithIdentifiers:v4];

  uint64_t v7 = [a1 presenterForPrivacyUnifiedAboutWithBundles:v6];

  return v7;
}

+ (id)presenterForPrivacyUnifiedAboutWithBundlesAtPaths:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = +[OBBundle bundleAtPath:](OBBundle, "bundleAtPath:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  v12 = [a1 presenterForPrivacyUnifiedAboutWithBundles:v5];

  return v12;
}

- (void)setDisplayLanguage:(id)a3
{
  objc_storeStrong((id *)&self->_displayLanguage, a3);
  id v5 = a3;
  id v6 = [(OBPrivacyPresenter *)self splashController];
  [v6 setDisplayLanguage:v5];

  id v7 = [(OBPrivacyPresenter *)self combinedController];
  [v7 setDisplayLanguage:v5];
}

- (void)_presenterDidDismiss
{
  id v3 = [(OBPrivacyPresenter *)self dismissHandler];

  if (v3)
  {
    id v4 = [(OBPrivacyPresenter *)self dismissHandler];
    v4[2]();
  }
  [(OBPrivacyPresenter *)self setPresentedController:0];
}

- (void)present
{
  id v3 = [(OBPrivacyPresenter *)self splashController];
  if (v3
    || ([(OBPrivacyPresenter *)self combinedController],
        (id v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v4 = [(OBPrivacyPresenter *)self presentingViewController];

    if (v4)
    {
      [(OBPrivacyPresenter *)self setPresentedController:v3];
      id v5 = [(OBPrivacyPresenter *)self customTintColor];
      id v6 = [(OBPrivacyPresenter *)self splashController];
      [v6 setCustomTintColor:v5];

      id v7 = [(OBPrivacyPresenter *)self customTintColor];
      uint64_t v8 = [(OBPrivacyPresenter *)self combinedController];
      [v8 setCustomTintColor:v7];

      uint64_t v9 = [[OBPrivacyModalNavigationController alloc] initWithRootViewController:v3];
      v10 = [(OBPrivacyPresenter *)self customTintColor];
      v11 = [(OBPrivacyModalNavigationController *)v9 view];
      [v11 setTintColor:v10];

      [(OBPrivacyModalNavigationController *)v9 setDarkMode:[(OBPrivacyPresenter *)self darkMode]];
      [(OBNavigationController *)v9 setSupportedInterfaceOrientations:self->_supportedInterfaceOrientations];
      [(OBPrivacyModalNavigationController *)v9 setModalPresentationStyle:self->_modalPresentationStyle];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __29__OBPrivacyPresenter_present__block_invoke;
      v18[3] = &unk_1E58AE998;
      v18[4] = self;
      [(OBPrivacyModalNavigationController *)v9 addDismissButtonWithPressedHandler:v18];
      v12 = [(OBPrivacyPresenter *)self dismissHandler];

      if (v12)
      {
        v13 = [(OBPrivacyModalNavigationController *)v9 presentationController];
        [v13 setDelegate:self];
      }
      long long v14 = [(OBPrivacyPresenter *)self presentingViewController];
      BOOL v15 = [(OBPrivacyPresenter *)self animatePresentAndDismiss];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __29__OBPrivacyPresenter_present__block_invoke_2;
      v17[3] = &unk_1E58AE998;
      v17[4] = self;
      [v14 presentViewController:v9 animated:v15 completion:v17];
    }
    else
    {
      _OBLoggingFacility();
      uint64_t v9 = (OBPrivacyModalNavigationController *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v9->super.super.super.super.super, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long v16 = 0;
        _os_log_impl(&dword_19BF0F000, &v9->super.super.super.super.super, OS_LOG_TYPE_DEFAULT, "Tried to present with no presenter", v16, 2u);
      }
    }
  }
}

uint64_t __29__OBPrivacyPresenter_present__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismiss];
}

void __29__OBPrivacyPresenter_present__block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) presentationCompletionHandler];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) presentationCompletionHandler];
    v3[2]();
  }
}

- (void)presentInNavigationStack:(id)a3
{
}

- (void)presentInNavigationStack:(id)a3 animated:(BOOL)a4
{
  if (a3)
  {
    BOOL v5 = a4;
    -[OBPrivacyPresenter setPresentingViewController:](self, "setPresentingViewController:");
    uint64_t v6 = [(OBPrivacyPresenter *)self splashController];
    if (v6
      || ([(OBPrivacyPresenter *)self combinedController],
          (uint64_t v6 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v8 = (id)v6;
      id v7 = [(OBPrivacyPresenter *)self presentingViewController];
      [v7 pushViewController:v8 animated:v5];
    }
  }
  else
  {
    [(OBPrivacyPresenter *)self present];
  }
}

- (void)dismiss
{
  id v3 = [(OBPrivacyPresenter *)self presentingViewController];
  BOOL v4 = [(OBPrivacyPresenter *)self animatePresentAndDismiss];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __29__OBPrivacyPresenter_dismiss__block_invoke;
  v5[3] = &unk_1E58AE998;
  v5[4] = self;
  [v3 dismissViewControllerAnimated:v4 completion:v5];
}

uint64_t __29__OBPrivacyPresenter_dismiss__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _presenterDidDismiss];
}

- (void)setDarkMode:(BOOL)a3
{
  BOOL v3 = a3;
  self->_darkMode = a3;
  BOOL v5 = [(OBPrivacyPresenter *)self splashController];
  [v5 setDarkMode:v3];

  uint64_t v6 = [(OBPrivacyPresenter *)self combinedController];
  [v6 setDarkMode:v3];

  id v7 = [(OBPrivacyPresenter *)self splashController];
  id v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [(OBPrivacyPresenter *)self combinedController];
  }
  id v13 = v9;

  v10 = [v13 navigationController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v12 = [v13 navigationController];
    [v12 setDarkMode:v3];
  }
}

- (id)dismissHandler
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setDismissHandler:(id)a3
{
}

- (OBPrivacySplashController)splashController
{
  return (OBPrivacySplashController *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSplashController:(id)a3
{
}

- (OBPrivacyCombinedController)combinedController
{
  return (OBPrivacyCombinedController *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCombinedController:(id)a3
{
}

- (NSString)displayLanguage
{
  return self->_displayLanguage;
}

- (UIViewController)presentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  return (UIViewController *)WeakRetained;
}

- (void)setPresentingViewController:(id)a3
{
}

- (UIColor)customTintColor
{
  return self->_customTintColor;
}

- (void)setCustomTintColor:(id)a3
{
}

- (BOOL)underlineLinks
{
  return self->_underlineLinks;
}

- (void)setUnderlineLinks:(BOOL)a3
{
  self->_underlineLinks = a3;
}

- (BOOL)darkMode
{
  return self->_darkMode;
}

- (BOOL)usesFullScreenPresentation
{
  return self->_usesFullScreenPresentation;
}

- (void)setUsesFullScreenPresentation:(BOOL)a3
{
  self->_usesFullScreenPresentation = a3;
}

- (int64_t)modalPresentationStyle
{
  return self->_modalPresentationStyle;
}

- (void)setModalPresentationStyle:(int64_t)a3
{
  self->_modalPresentationStyle = a3;
}

- (unint64_t)supportedInterfaceOrientations
{
  return self->_supportedInterfaceOrientations;
}

- (void)setSupportedInterfaceOrientations:(unint64_t)a3
{
  self->_supportedInterfaceOrientations = a3;
}

- (UIViewController)presentedController
{
  return (UIViewController *)objc_getProperty(self, a2, 80, 1);
}

- (void)setPresentedController:(id)a3
{
}

- (NSArray)presentedIdentifiers
{
  return (NSArray *)objc_getProperty(self, a2, 88, 1);
}

- (void)setPresentedIdentifiers:(id)a3
{
}

- (id)presentationCompletionHandler
{
  return objc_getProperty(self, a2, 96, 1);
}

- (void)setPresentationCompletionHandler:(id)a3
{
}

- (BOOL)animatePresentAndDismiss
{
  return self->_animatePresentAndDismiss;
}

- (void)setAnimatePresentAndDismiss:(BOOL)a3
{
  self->_animatePresentAndDismiss = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_presentationCompletionHandler, 0);
  objc_storeStrong((id *)&self->_presentedIdentifiers, 0);
  objc_storeStrong((id *)&self->_presentedController, 0);
  objc_storeStrong((id *)&self->_customTintColor, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_displayLanguage, 0);
  objc_storeStrong((id *)&self->_combinedController, 0);
  objc_storeStrong((id *)&self->_splashController, 0);
  objc_storeStrong(&self->_dismissHandler, 0);
}

@end
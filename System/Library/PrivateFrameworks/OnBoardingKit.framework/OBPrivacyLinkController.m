@interface OBPrivacyLinkController
+ (Class)_platformSpecificClass;
+ (id)linkWithBundleAtPath:(id)a3;
+ (id)linkWithBundleIdentifier:(id)a3;
+ (id)linkWithBundleIdentifiers:(id)a3;
+ (id)linkWithBundlesAtPaths:(id)a3;
+ (id)linkWithPrivacyBundle:(id)a3;
- (BOOL)allowsOpeningSafari;
- (BOOL)displayCaptionText;
- (BOOL)displayIcon;
- (BOOL)displayLargeIcon;
- (BOOL)presentedViewControllerShouldUseDarkMode;
- (BOOL)showsLinkToUnifiedAbout;
- (BOOL)underlineLinks;
- (NSArray)bundles;
- (NSString)displayLanguage;
- (OBBundle)bundle;
- (OBPrivacyFlow)flow;
- (OBPrivacyLinkController)init;
- (OBPrivacyLinkController)initWithBundleIdentifiers:(id)a3;
- (OBPrivacyLinkController)initWithPrivacyBundle:(id)a3;
- (OBPrivacyLinkController)initWithPrivacyBundles:(id)a3;
- (UIColor)customTintColor;
- (id)_privacyPresenter;
- (unint64_t)displayDeviceType;
- (void)_linkPressed;
- (void)setAllowsOpeningSafari:(BOOL)a3;
- (void)setCustomTintColor:(id)a3;
- (void)setDisplayCaptionText:(BOOL)a3;
- (void)setDisplayDeviceType:(unint64_t)a3;
- (void)setDisplayIcon:(BOOL)a3;
- (void)setDisplayLanguage:(id)a3;
- (void)setDisplayLargeIcon:(BOOL)a3;
- (void)setPresentedViewControllerShouldUseDarkMode:(BOOL)a3;
- (void)setShowsLinkToUnifiedAbout:(BOOL)a3;
- (void)setUnderlineLinks:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation OBPrivacyLinkController

+ (Class)_platformSpecificClass
{
  return (Class)objc_opt_class();
}

+ (id)linkWithBundleIdentifiers:(id)a3
{
  id v4 = a3;
  if ([v4 count]) {
    v5 = objc_msgSend(objc_alloc((Class)objc_msgSend(a1, "_platformSpecificClass")), "initWithBundleIdentifiers:", v4);
  }
  else {
    v5 = 0;
  }

  return v5;
}

+ (id)linkWithBundleIdentifier:(id)a3
{
  id v4 = +[OBBundle bundleWithIdentifier:a3];
  v5 = [a1 linkWithPrivacyBundle:v4];

  return v5;
}

+ (id)linkWithBundleAtPath:(id)a3
{
  id v4 = +[OBBundle bundleAtPath:a3];
  v5 = [a1 linkWithPrivacyBundle:v4];

  return v5;
}

+ (id)linkWithBundlesAtPaths:(id)a3
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

  v12 = objc_msgSend(objc_alloc((Class)objc_msgSend(a1, "_platformSpecificClass")), "initWithPrivacyBundles:", v5);
  return v12;
}

+ (id)linkWithPrivacyBundle:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = objc_msgSend(objc_alloc((Class)objc_msgSend(a1, "_platformSpecificClass")), "initWithPrivacyBundle:", v4);
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (OBPrivacyLinkController)init
{
  v6.receiver = self;
  v6.super_class = (Class)OBPrivacyLinkController;
  v2 = [(OBPrivacyLinkController *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(OBPrivacyLinkController *)v2 setDisplayIcon:1];
    id v4 = +[OBCapabilities sharedCapabilities];
    -[OBPrivacyLinkController setAllowsOpeningSafari:](v3, "setAllowsOpeningSafari:", [v4 preventOpeningSafari] ^ 1);
  }
  return v3;
}

- (OBPrivacyLinkController)initWithPrivacyBundles:(id)a3
{
  id v4 = a3;
  id v5 = [(OBPrivacyLinkController *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    bundles = v5->_bundles;
    v5->_bundles = (NSArray *)v6;
  }
  return v5;
}

- (OBPrivacyLinkController)initWithPrivacyBundle:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 privacyFlow];

  if (v5)
  {
    v9[0] = v4;
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    uint64_t v7 = [(OBPrivacyLinkController *)self initWithPrivacyBundles:v6];

    self = v7;
    id v5 = self;
  }

  return v5;
}

- (OBPrivacyLinkController)initWithBundleIdentifiers:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[OBBundleManager sharedManager];
  uint64_t v6 = [v5 bundlesWithIdentifiers:v4];

  if ([v6 count])
  {
    id v27 = v4;
    if (v4)
    {
      uint64_t v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v8 = v6;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v32 objects:v39 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v33;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v33 != v11) {
              objc_enumerationMutation(v8);
            }
            v13 = [*(id *)(*((void *)&v32 + 1) + 8 * i) identifier];
            [v7 addObject:v13];
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v32 objects:v39 count:16];
        }
        while (v10);
      }
    }
    else
    {
      uint64_t v7 = 0;
    }
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v15 = v6;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v28 objects:v38 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v29;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v29 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = *(void **)(*((void *)&v28 + 1) + 8 * j);
          v21 = [v20 privacyFlow];

          if (!v21)
          {
            v22 = _OBLoggingFacility();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
              -[OBPrivacyLinkController initWithBundleIdentifiers:](v36, v20, &v37, v22);
            }
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v28 objects:v38 count:16];
      }
      while (v17);
    }

    v23 = [(OBPrivacyLinkController *)self initWithPrivacyBundles:v15];
    if (v23)
    {
      uint64_t v24 = [v7 copy];
      bundleIdentifiers = v23->_bundleIdentifiers;
      v23->_bundleIdentifiers = (NSArray *)v24;
    }
    self = v23;
    long long v14 = self;
    id v4 = v27;
  }
  else
  {
    uint64_t v7 = _OBLoggingFacility();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[OBPrivacyLinkController initWithBundleIdentifiers:]((uint64_t)v4, v7);
    }
    long long v14 = 0;
  }

  return v14;
}

- (OBBundle)bundle
{
  v3 = +[OBBundleManager sharedManager];
  id v4 = [(OBPrivacyLinkController *)self bundles];
  id v5 = [v3 privacyLinkBundleForBundles:v4];

  return (OBBundle *)v5;
}

- (NSArray)bundles
{
  return self->_bundles;
}

- (OBPrivacyFlow)flow
{
  v2 = [(OBPrivacyLinkController *)self bundle];
  v3 = [v2 privacyFlow];

  return (OBPrivacyFlow *)v3;
}

- (void)viewDidAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)OBPrivacyLinkController;
  [(OBPrivacyLinkController *)&v7 viewDidAppear:a3];
  if ([(OBPrivacyLinkController *)self isMovingToParentViewController])
  {
    id v4 = +[OBAnalyticsManager sharedManager];
    id v5 = [(OBPrivacyLinkController *)self bundle];
    uint64_t v6 = [v5 identifier];
    [v4 logPresentationOfPrivacyLinkWithIdentifier:v6];
  }
}

- (id)_privacyPresenter
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ([(NSArray *)self->_bundleIdentifiers count] >= 2)
  {
    v3 = [(OBPrivacyLinkController *)self bundles];
    id v4 = +[OBPrivacyPresenter presenterForPrivacyUnifiedAboutWithBundles:v3];
LABEL_17:

    goto LABEL_18;
  }
  if (self->_bundleIdentifiers
    || ([(OBPrivacyLinkController *)self bundle],
        id v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 isPlaceholder],
        v5,
        v6))
  {
    objc_super v7 = [(OBPrivacyLinkController *)self bundle];
    id v4 = +[OBPrivacyPresenter presenterForPrivacySplashWithBundle:v7];

    if (v4) {
      goto LABEL_18;
    }
    goto LABEL_16;
  }
  id v8 = [(OBPrivacyLinkController *)self bundles];
  unint64_t v9 = [v8 count];

  if (v9 < 2)
  {
LABEL_16:
    v3 = [(OBPrivacyLinkController *)self bundle];
    uint64_t v18 = [v3 underlyingBundle];
    uint64_t v19 = [v18 bundlePath];
    id v4 = +[OBPrivacyPresenter presenterForPrivacySplashWithBundleAtPath:v19];

    goto LABEL_17;
  }
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v11 = [(OBPrivacyLinkController *)self bundles];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = [*(id *)(*((void *)&v21 + 1) + 8 * i) underlyingBundle];
        uint64_t v17 = [v16 bundlePath];
        [v10 addObject:v17];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v13);
  }

  id v4 = +[OBPrivacyPresenter presenterForPrivacyUnifiedAboutWithBundlesAtPaths:v10];

LABEL_18:
  return v4;
}

- (void)_linkPressed
{
  v3 = _OBLoggingFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long v21 = 0;
    _os_log_impl(&dword_19BF0F000, v3, OS_LOG_TYPE_DEFAULT, "OBPrivacy link pressed!", v21, 2u);
  }

  id v4 = [(OBPrivacyLinkController *)self _privacyPresenter];
  [v4 setPresentingViewController:self];
  id v5 = [(OBPrivacyLinkController *)self displayLanguage];
  [v4 setDisplayLanguage:v5];

  BOOL v6 = [(OBPrivacyLinkController *)self allowsOpeningSafari];
  objc_super v7 = [v4 splashController];
  [v7 setAllowsOpeningSafari:v6];

  BOOL v8 = [(OBPrivacyLinkController *)self underlineLinks];
  unint64_t v9 = [v4 splashController];
  [v9 setUnderlineLinks:v8];

  if (self->_didOverrideShowUnifiedAbout)
  {
    BOOL v10 = [(OBPrivacyLinkController *)self showsLinkToUnifiedAbout];
    uint64_t v11 = [v4 splashController];
    [v11 setShowsLinkToUnifiedAbout:v10];
  }
  uint64_t v12 = [(OBPrivacyLinkController *)self customTintColor];
  [v4 setCustomTintColor:v12];

  unint64_t v13 = [(OBPrivacyLinkController *)self displayDeviceType];
  uint64_t v14 = [v4 splashController];
  [v14 setDisplayDeviceType:v13];

  id v15 = [(OBPrivacyLinkController *)self displayLanguage];
  uint64_t v16 = [v4 splashController];
  [v16 setDisplayLanguage:v15];

  objc_msgSend(v4, "setDarkMode:", -[OBPrivacyLinkController presentedViewControllerShouldUseDarkMode](self, "presentedViewControllerShouldUseDarkMode"));
  objc_msgSend(v4, "setModalPresentationStyle:", -[OBPrivacyLinkController modalPresentationStyle](self, "modalPresentationStyle"));
  uint64_t v17 = [(OBPrivacyLinkController *)self presentingViewController];
  objc_msgSend(v4, "setSupportedInterfaceOrientations:", objc_msgSend(v17, "supportedInterfaceOrientations"));

  [v4 present];
  uint64_t v18 = +[OBAnalyticsManager sharedManager];
  uint64_t v19 = [(OBPrivacyLinkController *)self bundle];
  v20 = [v19 identifier];
  [v18 logTapOnPrivacyLinkWithIdentifier:v20];
}

- (void)setShowsLinkToUnifiedAbout:(BOOL)a3
{
  self->_showsLinkToUnifiedAbout = a3;
  self->_didOverrideShowUnifiedAbout = 1;
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

- (BOOL)presentedViewControllerShouldUseDarkMode
{
  return self->_presentedViewControllerShouldUseDarkMode;
}

- (void)setPresentedViewControllerShouldUseDarkMode:(BOOL)a3
{
  self->_presentedViewControllerShouldUseDarkMode = a3;
}

- (BOOL)displayIcon
{
  return self->_displayIcon;
}

- (void)setDisplayIcon:(BOOL)a3
{
  self->_displayIcon = a3;
}

- (BOOL)displayLargeIcon
{
  return self->_displayLargeIcon;
}

- (void)setDisplayLargeIcon:(BOOL)a3
{
  self->_displayLargeIcon = a3;
}

- (BOOL)displayCaptionText
{
  return self->_displayCaptionText;
}

- (void)setDisplayCaptionText:(BOOL)a3
{
  self->_displayCaptionText = a3;
}

- (NSString)displayLanguage
{
  return (NSString *)objc_getProperty(self, a2, 1008, 1);
}

- (void)setDisplayLanguage:(id)a3
{
}

- (unint64_t)displayDeviceType
{
  return self->_displayDeviceType;
}

- (void)setDisplayDeviceType:(unint64_t)a3
{
  self->_displayDeviceType = a3;
}

- (BOOL)allowsOpeningSafari
{
  return self->_allowsOpeningSafari;
}

- (void)setAllowsOpeningSafari:(BOOL)a3
{
  self->_allowsOpeningSafaruint64_t i = a3;
}

- (BOOL)showsLinkToUnifiedAbout
{
  return self->_showsLinkToUnifiedAbout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayLanguage, 0);
  objc_storeStrong((id *)&self->_customTintColor, 0);
  objc_storeStrong((id *)&self->_bundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_bundles, 0);
}

- (void)initWithBundleIdentifiers:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_19BF0F000, a2, OS_LOG_TYPE_ERROR, "No bundles found for bundle identifiers: %@", (uint8_t *)&v2, 0xCu);
}

- (void)initWithBundleIdentifiers:(void *)a3 .cold.2(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  objc_super v7 = [a2 identifier];
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl(&dword_19BF0F000, a4, OS_LOG_TYPE_ERROR, "Privacy link controller encountered nil flow for bundle identifier %@", a1, 0xCu);
}

@end
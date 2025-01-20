@interface OBPrivacyLinkController_iOS
- (BOOL)_canShowWhileLocked;
- (OBPrivacyLinkController_iOS)initWithBundleIdentifiers:(id)a3;
- (OBPrivacyLinkController_iOS)initWithPrivacyBundle:(id)a3;
- (UIImageView)iconView;
- (UITextView)textView;
- (void)loadView;
- (void)processBundlesForTitleInformation;
- (void)setCustomTintColor:(id)a3;
- (void)setLinkEnabled:(BOOL)a3;
- (void)setUnderlineLinks:(BOOL)a3;
@end

@implementation OBPrivacyLinkController_iOS

- (OBPrivacyLinkController_iOS)initWithPrivacyBundle:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)OBPrivacyLinkController_iOS;
  v3 = [(OBPrivacyLinkController *)&v7 initWithPrivacyBundle:a3];
  if (v3)
  {
    v4 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v4 bounds];
    [(OBPrivacyLinkController *)v3 setDisplayLargeIcon:v5 > 568.01];

    [(OBPrivacyLinkController *)v3 setDisplayCaptionText:1];
    [(OBPrivacyLinkController *)v3 setDisplayDeviceType:0];
    [(OBPrivacyLinkController_iOS *)v3 setModalPresentationStyle:2];
  }
  return v3;
}

- (OBPrivacyLinkController_iOS)initWithBundleIdentifiers:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)OBPrivacyLinkController_iOS;
  v3 = [(OBPrivacyLinkController *)&v7 initWithBundleIdentifiers:a3];
  if (v3)
  {
    v4 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v4 bounds];
    [(OBPrivacyLinkController *)v3 setDisplayLargeIcon:v5 > 568.01];

    [(OBPrivacyLinkController *)v3 setDisplayCaptionText:1];
    [(OBPrivacyLinkController *)v3 setDisplayDeviceType:0];
    [(OBPrivacyLinkController_iOS *)v3 setModalPresentationStyle:2];
  }
  return v3;
}

- (void)loadView
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if ([(OBPrivacyLinkController *)self displayIcon])
  {
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    v3 = [(OBPrivacyLinkController *)self bundles];
    v4 = (void *)[v3 countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v37;
      while (2)
      {
        for (i = 0; i != v4; i = (char *)i + 1)
        {
          if (*(void *)v37 != v5) {
            objc_enumerationMutation(v3);
          }
          objc_super v7 = [*(id *)(*((void *)&v36 + 1) + 8 * i) privacyFlow];
          v8 = [v7 buttonIcon];

          if (v8)
          {
            v4 = [v7 buttonIcon];

            goto LABEL_13;
          }
        }
        v4 = (void *)[v3 countByEnumeratingWithState:&v36 objects:v40 count:16];
        if (v4) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  else
  {
    v4 = 0;
  }
  [(OBPrivacyLinkController_iOS *)self processBundlesForTitleInformation];
  v9 = [(OBPrivacyLinkController *)self bundles];
  if ((unint64_t)[v9 count] < 2 || self->bundleTitlesMatch)
  {
  }
  else
  {
    v32 = [(OBPrivacyLinkController *)self bundle];
    char v33 = [v32 isLinkBundle];

    if ((v33 & 1) == 0)
    {
      BOOL bundlesIncludePII = self->bundlesIncludePII;
      v10 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v11 = [(OBPrivacyLinkController *)self displayLanguage];
      if (bundlesIncludePII) {
        v35 = @"PRIVACY_LINK_MULTIPLE_PII";
      }
      else {
        v35 = @"PRIVACY_LINK_MULTIPLE";
      }
      uint64_t v12 = +[OBUtilities localizedString:v35 forTable:@"Localizable" inBundle:v10 forLanguage:v11];
      goto LABEL_18;
    }
  }
  v10 = [(OBPrivacyLinkController *)self flow];
  v11 = [(OBPrivacyLinkController *)self displayLanguage];
  uint64_t v12 = objc_msgSend(v10, "localizedButtonTitleForLanguage:preferredDeviceType:", v11, -[OBPrivacyLinkController displayDeviceType](self, "displayDeviceType"));
LABEL_18:
  v13 = (void *)v12;

  if ([(OBPrivacyLinkController *)self displayIcon]
    && [(OBPrivacyLinkController *)self displayCaptionText])
  {
    v14 = [(OBPrivacyLinkController *)self flow];
    v15 = [(OBPrivacyLinkController *)self displayLanguage];
    v16 = objc_msgSend(v14, "localizedButtonCaptionForLanguage:preferredDeviceType:", v15, -[OBPrivacyLinkController displayDeviceType](self, "displayDeviceType"));
  }
  else
  {
    v16 = 0;
  }
  v17 = [OBPrivacyLinkButton alloc];
  [v4 size];
  double v19 = v18;
  double v21 = v20;
  BOOL v22 = [(OBPrivacyLinkController *)self displayLargeIcon];
  v23 = [(OBPrivacyLinkController *)self displayLanguage];
  v24 = -[OBPrivacyLinkButton initWithCaption:buttonText:image:imageSize:useLargeIcon:displayLanguage:](v17, "initWithCaption:buttonText:image:imageSize:useLargeIcon:displayLanguage:", v16, v13, v4, v22, v23, v19, v21);
  linkButton = self->_linkButton;
  self->_linkButton = v24;

  [(OBPrivacyLinkButton *)self->_linkButton addTarget:self action:sel__linkPressed forControlEvents:0x2000];
  v26 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v27 = [(OBPrivacyLinkController *)self displayLanguage];
  v28 = +[OBUtilities localizedString:@"PRIVACY_ICON_DESCRIPTION" forTable:@"Localizable" inBundle:v26 forLanguage:v27];
  v29 = [(OBPrivacyLinkButton *)self->_linkButton iconView];
  [v29 setAccessibilityLabel:v28];

  [(OBPrivacyLinkButton *)self->_linkButton setUnderlineLinks:[(OBPrivacyLinkController *)self underlineLinks]];
  v30 = [(OBPrivacyLinkController *)self customTintColor];

  if (v30)
  {
    v31 = [(OBPrivacyLinkController *)self customTintColor];
    [(OBPrivacyLinkButton *)self->_linkButton setTintColor:v31];
  }
  [(OBPrivacyLinkController_iOS *)self setView:self->_linkButton];
}

- (void)processBundlesForTitleInformation
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  self->bundleTitlesMatch = 1;
  self->BOOL bundlesIncludePII = 0;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v3 = [(OBPrivacyLinkController *)self bundles];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    v6 = 0;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v3);
        }
        v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) privacyFlow];
        v10 = [v9 localizedButtonTitle];
        v11 = v10;
        if (v6)
        {
          if ([v10 localizedStandardCompare:v6]) {
            self->bundleTitlesMatch = 0;
          }
          if (!self->bundlesIncludePII) {
            self->BOOL bundlesIncludePII = [v9 isPersonallyIdentifiable];
          }
        }
        else
        {
          if (!self->bundlesIncludePII) {
            self->BOOL bundlesIncludePII = [v9 isPersonallyIdentifiable];
          }
          v6 = v11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }
}

- (void)setLinkEnabled:(BOOL)a3
{
}

- (UIImageView)iconView
{
  return [(OBPrivacyLinkButton *)self->_linkButton iconView];
}

- (UITextView)textView
{
  return [(OBPrivacyLinkButton *)self->_linkButton textView];
}

- (void)setCustomTintColor:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)OBPrivacyLinkController_iOS;
  id v4 = a3;
  [(OBPrivacyLinkController *)&v5 setCustomTintColor:v4];
  -[OBPrivacyLinkButton setTintColor:](self->_linkButton, "setTintColor:", v4, v5.receiver, v5.super_class);
}

- (void)setUnderlineLinks:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)OBPrivacyLinkController_iOS;
  -[OBPrivacyLinkController setUnderlineLinks:](&v5, sel_setUnderlineLinks_);
  [(OBPrivacyLinkButton *)self->_linkButton setUnderlineLinks:v3];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void).cxx_destruct
{
}

@end
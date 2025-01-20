@interface SFAppLinkBanner
- (SFAppLinkBanner)initWithAppLink:(id)a3 openActionHandler:(id)a4;
- (WBSAppLink)appLink;
@end

@implementation SFAppLinkBanner

- (SFAppLinkBanner)initWithAppLink:(id)a3 openActionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v27.receiver = self;
  v27.super_class = (Class)SFAppLinkBanner;
  v9 = [(SFLinkBanner *)&v27 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_appLink, a3);
    [(SFLinkBanner *)v10 setOpenActionHandler:v8];
    v11 = _WBSLocalizedString();
    [(SFLinkBanner *)v10 setOpenButtonTitle:v11];

    v12 = [(SFLinkBanner *)v10 openButton];
    [v12 setAccessibilityIdentifier:@"AppLinkBannerOpenButton"];

    appLink = v10->_appLink;
    id v25 = 0;
    id v26 = 0;
    id v24 = 0;
    [(WBSAppLink *)appLink getAppLinkLabel:&v26 name:&v25 bundleIdentifier:0 icon:&v24];
    id v14 = v26;
    id v15 = v25;
    id v16 = v24;
    v17 = [(SFLinkBanner *)v10 titleLabel];
    [v17 setAttributedText:v14];

    v18 = NSString;
    v19 = _WBSLocalizedString();
    v20 = objc_msgSend(v18, "stringWithFormat:", v19, v15);
    [(SFLinkBanner *)v10 setMessageLabelText:v20];

    v21 = [(SFLinkBanner *)v10 icon];
    [v21 setImage:v16];

    v22 = v10;
  }

  return v10;
}

- (WBSAppLink)appLink
{
  return self->_appLink;
}

- (void).cxx_destruct
{
}

@end
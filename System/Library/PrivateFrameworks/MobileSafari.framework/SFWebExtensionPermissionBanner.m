@interface SFWebExtensionPermissionBanner
- (SFWebExtensionPermissionBanner)initWithExtension:(id)a3;
- (id)dismissHandler;
- (id)preferredButtonBackgroundColor;
- (id)preferredButtonTintColor;
- (void)setDismissHandler:(id)a3;
@end

@implementation SFWebExtensionPermissionBanner

- (SFWebExtensionPermissionBanner)initWithExtension:(id)a3
{
  id v4 = a3;
  v5 = [(SFLinkBanner *)self init];
  if (v5)
  {
    v6 = [v4 displayName];
    v7 = [(SFLinkBanner *)v5 titleLabel];
    [v7 setText:v6];

    v8 = _WBSLocalizedString();
    [(SFLinkBanner *)v5 setMessageLabelText:v8];

    v9 = [v4 icon];
    v10 = [(SFLinkBanner *)v5 icon];
    [v10 setImage:v9];

    v11 = _WBSLocalizedString();
    [(SFLinkBanner *)v5 setOpenButtonTitle:v11];

    v12 = v5;
  }

  return v5;
}

- (id)preferredButtonBackgroundColor
{
  return (id)[MEMORY[0x1E4FB1618] systemGray5Color];
}

- (id)preferredButtonTintColor
{
  return (id)[MEMORY[0x1E4FB1618] labelColor];
}

- (id)dismissHandler
{
  return self->_dismissHandler;
}

- (void)setDismissHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
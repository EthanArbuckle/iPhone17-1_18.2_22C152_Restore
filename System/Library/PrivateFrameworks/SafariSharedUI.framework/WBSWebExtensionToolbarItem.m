@interface WBSWebExtensionToolbarItem
- (BOOL)hasUpdatedBadgeTextInTab:(id)a3;
- (BOOL)isEnabledForTab:(id)a3;
- (BOOL)shouldRequestAccessForTab:(id)a3;
- (BOOL)showingExtensionPopup;
- (NSString)label;
- (UIImage)image;
- (WBSWebExtensionData)webExtension;
- (WBSWebExtensionToolbarItem)initWithWebExtension:(id)a3 extensionsController:(id)a4;
- (WKWebExtensionAction)webKitAction;
- (WKWebView)popupWebView;
- (id)badgeTextForTab:(id)a3;
- (id)iconForTab:(id)a3;
- (id)popupWebViewInspectionNameForAction:(id)a3;
- (id)titleForTab:(id)a3;
- (void)_webKitExtensionActionDidChange:(id)a3;
- (void)didViewBadgeInTab:(id)a3;
- (void)setWebKitAction:(id)a3;
@end

@implementation WBSWebExtensionToolbarItem

- (WBSWebExtensionToolbarItem)initWithWebExtension:(id)a3 extensionsController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)WBSWebExtensionToolbarItem;
  v8 = [(WBSWebExtensionToolbarItem *)&v18 init];
  if (v8)
  {
    v9 = [v6 webKitContext];
    v10 = [v9 actionForTab:0];

    uint64_t v11 = [v6 toolbarImage];
    image = v8->_image;
    v8->_image = (UIImage *)v11;

    uint64_t v13 = [v10 label];
    label = v8->_label;
    v8->_label = (NSString *)v13;

    v8->_enabled = [v10 isEnabled];
    objc_storeWeak((id *)&v8->_extensionsController, v7);
    objc_storeWeak((id *)&v8->_webExtension, v6);
    v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v15 addObserver:v8 selector:sel__webKitExtensionActionDidChange_ name:*MEMORY[0x1E4F46838] object:0];

    v16 = v8;
  }

  return v8;
}

- (void)_webKitExtensionActionDidChange:(id)a3
{
  id v8 = [a3 object];
  v4 = [(WBSWebExtensionToolbarItem *)self webExtension];
  v5 = [v8 webExtensionContext];
  id v6 = +[WBSWebExtensionData webExtensionForWebKitExtensionContext:v5];

  if (v6 == v4)
  {
    id v7 = [v8 associatedTab];
    [(WBSWebExtensionToolbarItem *)self webKitExtensionAction:v8 didChangeForTab:v7];
  }
}

- (id)popupWebViewInspectionNameForAction:(id)a3
{
  v4 = [a3 popupWebView];
  v5 = [v4 URL];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_webExtension);
  id v7 = objc_loadWeakRetained((id *)&self->_extensionsController);
  if ([v7 hasNamedProfiles])
  {
    id v8 = [v7 profile];
    v9 = NSString;
    v10 = _WBSLocalizedString();
    uint64_t v11 = [WeakRetained displayShortName];
    v12 = [v8 title];
    uint64_t v13 = [v5 lastPathComponent];
    v14 = objc_msgSend(v9, "stringWithFormat:", v10, v11, v12, v13);
  }
  else
  {
    v15 = NSString;
    id v8 = _WBSLocalizedString();
    v10 = [WeakRetained displayShortName];
    uint64_t v11 = [v5 lastPathComponent];
    v14 = objc_msgSend(v15, "stringWithFormat:", v8, v10, v11);
  }

  return v14;
}

- (id)badgeTextForTab:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_webExtension);
  id v6 = [WeakRetained webKitContext];
  id v7 = [v6 actionForTab:v4];
  id v8 = [v7 badgeText];

  return v8;
}

- (void)didViewBadgeInTab:(id)a3
{
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_webExtension);
  v5 = [WeakRetained webKitContext];
  id v6 = [v5 actionForTab:v7];

  if (objc_opt_respondsToSelector()) {
    [v6 setHasUnreadBadgeText:0];
  }
}

- (BOOL)hasUpdatedBadgeTextInTab:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_webExtension);
  id v6 = [WeakRetained webKitContext];
  id v7 = [v6 actionForTab:v4];

  if (objc_opt_respondsToSelector()) {
    char v8 = [v7 hasUnreadBadgeText];
  }
  else {
    char v8 = 0;
  }

  return v8;
}

- (id)titleForTab:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_webExtension);
  id v6 = [WeakRetained webKitContext];
  id v7 = [v6 actionForTab:v4];
  char v8 = [v7 label];

  return v8;
}

- (BOOL)isEnabledForTab:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_webExtension);
  id v6 = [WeakRetained webKitContext];
  id v7 = [v6 actionForTab:v4];
  char v8 = [v7 isEnabled];

  return v8;
}

- (id)iconForTab:(id)a3
{
  id v4 = a3;
  v5 = [(WBSWebExtensionToolbarItem *)self webExtension];
  id v6 = [v5 extensionsController];
  unint64_t v7 = [v6 toolbarItemIdealPointSize];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_webExtension);
  v9 = [WeakRetained webKitContext];
  v10 = [v9 actionForTab:v4];
  uint64_t v11 = objc_msgSend(v10, "iconForSize:", (double)v7, (double)v7);
  v12 = v11;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    id v13 = [v5 toolbarImage];
  }
  v14 = v13;

  return v14;
}

- (BOOL)shouldRequestAccessForTab:(id)a3
{
  id v4 = a3;
  v5 = [v4 urlForExtensions];
  if (objc_msgSend(v5, "safari_isHTTPFamilyURL"))
  {
    id v6 = [(WBSWebExtensionToolbarItem *)self webExtension];
    unint64_t v7 = [MEMORY[0x1E4F98348] sharedController];
    char v8 = [v5 host];
    v9 = [v6 composedIdentifier];
    char v10 = [v7 domainIsManaged:v8 forComposedIdentifier:v9];

    BOOL v11 = (v10 & 1) == 0 && (unint64_t)([v6 permissionStateForURL:v5 inTab:v4] + 1) < 2;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (WBSWebExtensionData)webExtension
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_webExtension);
  return (WBSWebExtensionData *)WeakRetained;
}

- (WKWebExtensionAction)webKitAction
{
  return self->_webKitAction;
}

- (void)setWebKitAction:(id)a3
{
}

- (WKWebView)popupWebView
{
  return self->_popupWebView;
}

- (BOOL)showingExtensionPopup
{
  return self->_showingExtensionPopup;
}

- (NSString)label
{
  return self->_label;
}

- (UIImage)image
{
  return self->_image;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_popupWebView, 0);
  objc_storeStrong((id *)&self->_webKitAction, 0);
  objc_destroyWeak((id *)&self->_webExtension);
  objc_destroyWeak((id *)&self->_extensionsController);
}

@end
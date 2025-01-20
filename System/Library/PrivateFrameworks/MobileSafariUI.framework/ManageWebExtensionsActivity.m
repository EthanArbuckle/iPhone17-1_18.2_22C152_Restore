@interface ManageWebExtensionsActivity
- (BOOL)canPerformWithActivityItems:(id)a3;
- (ManageWebExtensionsActivity)init;
- (UIActivityViewController)parentActivityViewController;
- (_SFBrowserDocument)browserDocument;
- (id)_activityBadgeColor;
- (id)_activityBadgeText;
- (id)_activityBadgeTextColor;
- (id)_systemImageName;
- (id)activityTitle;
- (id)activityType;
- (id)activityViewController;
- (void)_formatBadgeText;
- (void)_reloadBadgeCount;
- (void)dealloc;
- (void)extensionsControllerExtensionListDidChange:(id)a3;
- (void)setBrowserDocument:(id)a3;
- (void)setParentActivityViewController:(id)a3;
@end

@implementation ManageWebExtensionsActivity

- (ManageWebExtensionsActivity)init
{
  v6.receiver = self;
  v6.super_class = (Class)ManageWebExtensionsActivity;
  v2 = [(UIActivity *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(ManageWebExtensionsActivity *)v2 _formatBadgeText];
    v4 = v3;
  }

  return v3;
}

- (void)_formatBadgeText
{
  v9 = self->_browserDocument;
  if ([(_SFBrowserDocument *)v9 isPrivateBrowsingEnabled])
  {
    numberOfNewlyInstalledExtensions = self->_numberOfNewlyInstalledExtensions;
    self->_numberOfNewlyInstalledExtensions = 0;
  }
  else
  {
    numberOfNewlyInstalledExtensions = [(_SFBrowserDocument *)v9 webExtensionsController];
    uint64_t v4 = [numberOfNewlyInstalledExtensions recentlyInstalledExtensionCount];
    v5 = [(_SFBrowserDocument *)v9 contentBlockerManager];
    uint64_t v6 = [v5 recentlyInstalledExtensionCount] + v4;

    if (v6)
    {
      v7 = (void *)MEMORY[0x1E4F28EE0];
      numberOfNewlyInstalledExtensions = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v6];
      v8 = [v7 localizedStringFromNumber:numberOfNewlyInstalledExtensions numberStyle:1];
    }
    else
    {
      v8 = 0;
    }
    objc_storeStrong((id *)&self->_numberOfNewlyInstalledExtensions, v8);
    if (!v6) {
      goto LABEL_9;
    }
  }
LABEL_9:
}

- (void)setBrowserDocument:(id)a3
{
  uint64_t v4 = (_SFBrowserDocument *)a3;
  v5 = [(_SFBrowserDocument *)self->_browserDocument webExtensionsController];
  [v5 removeObserver:self];

  browserDocument = self->_browserDocument;
  self->_browserDocument = v4;
  v7 = v4;

  id v8 = [(_SFBrowserDocument *)self->_browserDocument webExtensionsController];

  [v8 addObserver:self];
}

- (void)dealloc
{
  v3 = [(_SFBrowserDocument *)self->_browserDocument webExtensionsController];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ManageWebExtensionsActivity;
  [(ManageWebExtensionsActivity *)&v4 dealloc];
}

- (id)activityType
{
  return @"SafariActivityTypeWebExtension";
}

- (id)activityTitle
{
  return (id)_WBSLocalizedString();
}

- (id)_systemImageName
{
  return @"puzzlepiece.extension";
}

- (id)_activityBadgeText
{
  return self->_numberOfNewlyInstalledExtensions;
}

- (id)_activityBadgeColor
{
  return (id)objc_msgSend(MEMORY[0x1E4FB1618], "sf_colorNamed:", @"shareSheetBadgeBackgroundColor");
}

- (id)_activityBadgeTextColor
{
  return (id)[MEMORY[0x1E4FB1618] labelColor];
}

- (id)activityViewController
{
  activityViewController = self->_activityViewController;
  if (!activityViewController)
  {
    objc_super v4 = [MEMORY[0x1E4F782D8] createManageExtensionsNavigationControllerFromPageFormatMenu:0 activeDocument:self->_browserDocument];
    v5 = self->_activityViewController;
    self->_activityViewController = v4;

    activityViewController = self->_activityViewController;
  }
  return activityViewController;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return 1;
}

- (void)_reloadBadgeCount
{
  [(ManageWebExtensionsActivity *)self _formatBadgeText];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentActivityViewController);
  [WeakRetained _reloadActivity:self];
}

- (void)extensionsControllerExtensionListDidChange:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__ManageWebExtensionsActivity_extensionsControllerExtensionListDidChange___block_invoke;
  block[3] = &unk_1E6D77E20;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __74__ManageWebExtensionsActivity_extensionsControllerExtensionListDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadBadgeCount];
}

- (UIActivityViewController)parentActivityViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentActivityViewController);
  return (UIActivityViewController *)WeakRetained;
}

- (void)setParentActivityViewController:(id)a3
{
}

- (_SFBrowserDocument)browserDocument
{
  return self->_browserDocument;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_browserDocument, 0);
  objc_destroyWeak((id *)&self->_parentActivityViewController);
  objc_storeStrong((id *)&self->_activityViewController, 0);
  objc_storeStrong((id *)&self->_numberOfNewlyInstalledExtensions, 0);
}

@end
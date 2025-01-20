@interface WebExtensionWindow
- (BOOL)_isPrivateWithSingleTabShowingExplanationText;
- (BOOL)isFocused;
- (BOOL)isPopupWindow;
- (BOOL)isPrivate;
- (BOOL)isPrivateWindow;
- (BrowserController)browserController;
- (CGRect)webExtensionWindowGeometry;
- (NSArray)webExtensionTabs;
- (NSString)webExtensionWindowState;
- (NSString)webExtensionWindowType;
- (WBProfile)profile;
- (WBSWebExtensionTab)activeWebExtensionTab;
- (WebExtensionWindow)initWithBrowserController:(id)a3 isPrivateWindow:(BOOL)a4;
- (double)idForWebExtensions;
- (id)_webExtensionTabsWithoutCopying;
- (id)tabsForWebExtensionContext:(id)a3;
- (int64_t)windowStateForWebExtensionContext:(id)a3;
- (int64_t)windowTypeForWebExtensionContext:(id)a3;
- (void)createNewTabAtIndex:(id)a3 url:(id)a4 makeActive:(BOOL)a5 completionHandler:(id)a6;
- (void)setIsPrivateWindow:(BOOL)a3;
- (void)validateToolbarItemForExtension:(id)a3;
@end

@implementation WebExtensionWindow

- (WebExtensionWindow)initWithBrowserController:(id)a3 isPrivateWindow:(BOOL)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WebExtensionWindow;
  v7 = [(WebExtensionWindow *)&v12 init];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_browserController, v6);
    v8->_isPrivateWindow = a4;
    [MEMORY[0x1E4F98FC0] nextWindowID];
    v8->_idForWebExtensions = v9;
    v10 = v8;
  }

  return v8;
}

- (void)createNewTabAtIndex:(id)a3 url:(id)a4 makeActive:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v7 = a5;
  v26[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = [(WebExtensionWindow *)self _webExtensionTabsWithoutCopying];
  unint64_t v14 = [v13 count];
  if (v10)
  {
    unint64_t v15 = [v10 integerValue] < 1 ? 0 : objc_msgSend(v10, "integerValue");
    if (v15 < v14) {
      unint64_t v14 = v15;
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  v17 = [WeakRetained tabController];
  if (!v14
    && [(WebExtensionWindow *)self _isPrivateWithSingleTabShowingExplanationText])
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __75__WebExtensionWindow_createNewTabAtIndex_url_makeActive_completionHandler___block_invoke;
    v22[3] = &unk_1E6D786F8;
    v25 = (TabDocument *)v12;
    id v23 = v17;
    id v24 = v11;
    [v23 openNewTabWithOptions:2 completionHandler:v22];

    v18 = v25;
    goto LABEL_20;
  }
  v18 = -[TabDocument initWithTitle:URL:UUID:privateBrowsingEnabled:controlledByAutomation:hibernated:bookmark:browserController:relatedWebView:]([TabDocument alloc], "initWithTitle:URL:UUID:privateBrowsingEnabled:controlledByAutomation:hibernated:bookmark:browserController:relatedWebView:", 0, 0, 0, self->_isPrivateWindow, [WeakRetained isControlledByAutomation], 0, 0, WeakRetained, 0);
  [(TabDocument *)v18 setIsBlank:1];
  -[TabDocument setScrollPoint:](v18, "setScrollPoint:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  if (v11)
  {
    if (!v7) {
      goto LABEL_12;
    }
LABEL_15:
    [WeakRetained dismissTransientUIAnimated:1];
    if (v14) {
      goto LABEL_13;
    }
LABEL_16:
    v26[0] = v18;
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
    v20 = [v13 firstObject];
    [v17 insertTabs:v19 beforeTab:v20 inBackground:!v7 animated:1];

    goto LABEL_17;
  }
  [(TabDocument *)v18 displayNewTabOverridePageIfNecessary];
  if (v7) {
    goto LABEL_15;
  }
LABEL_12:
  if (!v14) {
    goto LABEL_16;
  }
LABEL_13:
  v19 = [v13 objectAtIndexedSubscript:v14 - 1];
  [v17 insertTab:v18 afterTab:v19 inBackground:!v7 animated:1];
LABEL_17:

  if (v11) {
    id v21 = [(TabDocument *)v18 loadURL:v11 userDriven:1];
  }
  (*((void (**)(id, TabDocument *))v12 + 2))(v12, v18);
LABEL_20:
}

void __75__WebExtensionWindow_createNewTabAtIndex_url_makeActive_completionHandler___block_invoke(uint64_t a1, char a2)
{
  if (a2)
  {
    v3 = [*(id *)(a1 + 32) activeTabDocument];
    uint64_t v4 = *(void *)(a1 + 40);
    id v7 = v3;
    if (v4) {
      id v5 = (id)[v3 loadURL:v4 userDriven:1];
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v6();
  }
}

- (id)_webExtensionTabsWithoutCopying
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  uint64_t v4 = WeakRetained;
  if (self->_isPrivateWindow)
  {
    if ([(WebExtensionWindow *)self _isPrivateWithSingleTabShowingExplanationText])
    {
      id v5 = (void *)MEMORY[0x1E4F1CBF0];
      goto LABEL_7;
    }
    id v6 = [v4 tabController];
    uint64_t v7 = [v6 privateTabs];
  }
  else
  {
    id v6 = [WeakRetained tabController];
    uint64_t v7 = [v6 normalTabs];
  }
  id v5 = (void *)v7;

LABEL_7:
  return v5;
}

- (BOOL)_isPrivateWithSingleTabShowingExplanationText
{
  if (!self->_isPrivateWindow) {
    return 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  v3 = [WeakRetained tabController];
  uint64_t v4 = [v3 hiddenPrivateTabDocumentWhenShowingPrivateBrowsingExplanationText];
  BOOL v5 = v4 != 0;

  return v5;
}

- (BOOL)isFocused
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  if (self->_isPrivateWindow == [WeakRetained isPrivateBrowsingEnabled]) {
    char v4 = [WeakRetained activeWebExtensionWindowIsFocused];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (BOOL)isPopupWindow
{
  return 0;
}

- (BOOL)isPrivate
{
  return self->_isPrivateWindow;
}

- (CGRect)webExtensionWindowGeometry
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  [WeakRetained webExtensionWindowGeometry];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (NSString)webExtensionWindowType
{
  return (NSString *)(id)*MEMORY[0x1E4F997A0];
}

- (NSString)webExtensionWindowState
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  double v3 = [WeakRetained tabController];
  double v4 = [v3 activeTabDocument];
  int v5 = [v4 webViewIsFullscreen];
  double v6 = (id *)MEMORY[0x1E4F99790];
  if (!v5) {
    double v6 = (id *)MEMORY[0x1E4F99798];
  }
  double v7 = (NSString *)*v6;

  return v7;
}

- (NSArray)webExtensionTabs
{
  v2 = [(WebExtensionWindow *)self _webExtensionTabsWithoutCopying];
  double v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (WBSWebExtensionTab)activeWebExtensionTab
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  double v4 = WeakRetained;
  if (self->_isPrivateWindow)
  {
    if ([(WebExtensionWindow *)self _isPrivateWithSingleTabShowingExplanationText])
    {
      int v5 = 0;
      goto LABEL_7;
    }
    double v6 = [v4 tabController];
    uint64_t v7 = [v6 privateActiveTabDocument];
  }
  else
  {
    double v6 = [WeakRetained tabController];
    uint64_t v7 = [v6 normalActiveTabDocument];
  }
  int v5 = (void *)v7;

LABEL_7:
  return (WBSWebExtensionTab *)v5;
}

- (void)validateToolbarItemForExtension:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  [WeakRetained validateExtensionToolbarItemsInWindow:self];
}

- (WBProfile)profile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  double v3 = [WeakRetained effectiveProfile];

  return (WBProfile *)v3;
}

- (id)tabsForWebExtensionContext:(id)a3
{
  double v3 = [(WebExtensionWindow *)self webExtensionTabs];
  double v4 = v3;
  if (!v3) {
    double v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v5 = v3;

  return v5;
}

- (int64_t)windowTypeForWebExtensionContext:(id)a3
{
  return [(WebExtensionWindow *)self isPopupWindow];
}

- (int64_t)windowStateForWebExtensionContext:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  double v4 = [WeakRetained tabController];
  id v5 = [v4 activeTabDocument];
  if ([v5 webViewIsFullscreen]) {
    int64_t v6 = 3;
  }
  else {
    int64_t v6 = 0;
  }

  return v6;
}

- (double)idForWebExtensions
{
  return self->_idForWebExtensions;
}

- (BrowserController)browserController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  return (BrowserController *)WeakRetained;
}

- (BOOL)isPrivateWindow
{
  return self->_isPrivateWindow;
}

- (void)setIsPrivateWindow:(BOOL)a3
{
  self->_isPrivateWindow = a3;
}

- (void).cxx_destruct
{
}

@end
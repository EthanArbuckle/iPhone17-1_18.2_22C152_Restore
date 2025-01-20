@interface UIDocumentViewControllerLaunchOptions
+ (id)createDocumentActionWithIntent:(id)a3;
- (NSString)title;
- (UIAction)primaryAction;
- (UIAction)secondaryAction;
- (UIBackgroundConfiguration)background;
- (UIDocumentBrowserViewController)browserViewController;
- (UIDocumentViewControllerLaunchOptions)init;
- (UIMenu)_secondaryMenu;
- (UIView)backgroundAccessoryView;
- (UIView)documentTargetView;
- (UIView)foregroundAccessoryView;
- (id)_documentUnavailableConfiguration;
- (id)defaultBrowserViewController;
- (id)initWithDocumentViewController:(void *)a1;
- (void)_dismissBrowserViewController;
- (void)_documentCloseStateDidChange;
- (void)_documentDidChange;
- (void)_documentProgressStateDidChange;
- (void)_prepareBrowserViewController:(id)a3;
- (void)_presentAlertForDocumentAtURL:(id)a3 error:(id)a4 isImport:(BOOL)a5;
- (void)_replaceDocumentWithDocumentAtURL:(id)a3 isImport:(BOOL)a4;
- (void)_setNeedsUpdateDocumentUnavailableConfiguration;
- (void)_setSecondaryMenu:(id)a3;
- (void)documentLandingBrowser:(id)a3 didPickDocumentsAtURLs:(id)a4;
- (void)documentLandingBrowser:(id)a3 didRequestDocumentCreationWithHandler:(id)a4;
- (void)documentLandingBrowserDidEndDocumentCreation:(id)a3 importedURL:(id)a4 canceled:(BOOL)a5 error:(id)a6;
- (void)documentLandingBrowserWillStartDocumentCreation:(id)a3;
- (void)setBackground:(id)a3;
- (void)setBackgroundAccessoryView:(id)a3;
- (void)setBrowserViewController:(id)a3;
- (void)setDocumentTargetView:(id)a3;
- (void)setForegroundAccessoryView:(id)a3;
- (void)setPrimaryAction:(id)a3;
- (void)setSecondaryAction:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation UIDocumentViewControllerLaunchOptions

- (UIDocumentViewControllerLaunchOptions)init
{
  return (UIDocumentViewControllerLaunchOptions *)-[UIDocumentViewControllerLaunchOptions initWithDocumentViewController:](self, 0);
}

- (id)initWithDocumentViewController:(void *)a1
{
  if (!a1) {
    return 0;
  }
  v15.receiver = a1;
  v15.super_class = (Class)UIDocumentViewControllerLaunchOptions;
  v3 = (id *)objc_msgSendSuper2(&v15, sel_init);
  v4 = v3;
  if (v3)
  {
    objc_storeWeak(v3 + 15, a2);
    uint64_t v5 = -[UIDocumentViewControllerLaunchOptions defaultBrowserViewController](v4);
    id v6 = v4[4];
    v4[4] = (id)v5;

    uint64_t v7 = [(id)UIApp _localizedApplicationName];
    id v8 = v4[5];
    v4[5] = (id)v7;

    v9 = -[UIDocumentViewControllerLaunchOptions defaultBrowserViewController](v4);
    if ([v9 allowsDocumentCreation])
    {
      uint64_t v10 = +[UIDocumentViewControllerLaunchOptions createDocumentActionWithIntent:@"UIDocumentCreationIntentDefault"];
      id v11 = v4[6];
      v4[6] = (id)v10;
    }
    else
    {
      id v11 = v4[6];
      v4[6] = 0;
    }

    uint64_t v12 = +[UIBackgroundConfiguration clearConfiguration];
    id v13 = v4[10];
    v4[10] = (id)v12;
  }
  return v4;
}

- (id)defaultBrowserViewController
{
  v2 = a1 + 11;
  id v3 = a1[11];
  if (!v3)
  {
    v4 = +[_UIApplicationInfoParser mainBundleInfoParser];
    uint64_t v5 = [v4 viewerRoleDocumentUTTypes];

    id v6 = +[_UIApplicationInfoParser mainBundleInfoParser];
    uint64_t v7 = [v6 editorRoleDocumentUTTypes];

    id v8 = [v5 arrayByAddingObjectsFromArray:v7];
    uint64_t v13 = 0;
    v14 = &v13;
    uint64_t v15 = 0x2050000000;
    v9 = (void *)qword_1EB264848;
    uint64_t v16 = qword_1EB264848;
    if (!qword_1EB264848)
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __getUIDocumentBrowserViewControllerClass_block_invoke_2;
      v12[3] = &unk_1E52D9900;
      v12[4] = &v13;
      __getUIDocumentBrowserViewControllerClass_block_invoke_2((uint64_t)v12);
      v9 = (void *)v14[3];
    }
    uint64_t v10 = v9;
    _Block_object_dispose(&v13, 8);
    id v3 = (id)[[v10 alloc] initForOpeningContentTypes:v8];
    objc_msgSend(v3, "setAllowsDocumentCreation:", objc_msgSend(v7, "count") != 0);
    [a1 _prepareBrowserViewController:v3];
    objc_storeStrong(v2, v3);
  }
  return v3;
}

- (void)setBrowserViewController:(id)a3
{
  browserViewController = self->_browserViewController;
  p_browserViewController = &self->_browserViewController;
  if (browserViewController != a3)
  {
    objc_storeStrong((id *)p_browserViewController, a3);
    [(UIDocumentViewControllerLaunchOptions *)self _prepareBrowserViewController:a3];
    [(UIDocumentViewControllerLaunchOptions *)self _setNeedsUpdateDocumentUnavailableConfiguration];
  }
}

- (void)setTitle:(id)a3
{
  if (!-[NSString isEqualToString:](self->_title, "isEqualToString:"))
  {
    uint64_t v5 = (NSString *)[a3 copy];
    title = self->_title;
    self->_title = v5;

    [(UIDocumentViewControllerLaunchOptions *)self _setNeedsUpdateDocumentUnavailableConfiguration];
  }
}

- (void)setPrimaryAction:(id)a3
{
  if (self->_primaryAction != a3)
  {
    v4 = (UIAction *)[a3 copy];
    primaryAction = self->_primaryAction;
    self->_primaryAction = v4;

    [(UIDocumentViewControllerLaunchOptions *)self _setNeedsUpdateDocumentUnavailableConfiguration];
  }
}

- (void)setSecondaryAction:(id)a3
{
  if (self->_secondaryAction != a3)
  {
    v4 = (UIAction *)[a3 copy];
    secondaryAction = self->_secondaryAction;
    self->_secondaryAction = v4;

    [(UIDocumentViewControllerLaunchOptions *)self _setNeedsUpdateDocumentUnavailableConfiguration];
  }
}

- (void)setDocumentTargetView:(id)a3
{
  documentTargetView = self->_documentTargetView;
  p_documentTargetView = &self->_documentTargetView;
  if (documentTargetView != a3)
  {
    objc_storeStrong((id *)p_documentTargetView, a3);
    [(UIDocumentViewControllerLaunchOptions *)self _setNeedsUpdateDocumentUnavailableConfiguration];
  }
  *(unsigned char *)&self->_flags |= 2u;
}

- (UIView)documentTargetView
{
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    id v3 = self->_documentTargetView;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->__documentViewController);
    id v3 = [WeakRetained viewIfLoaded];
  }
  return v3;
}

- (void)setBackground:(id)a3
{
  p_background = &self->_background;
  if ((-[UIBackgroundConfiguration _isEqualToConfiguration:]((uint64_t)self->_background, a3) & 1) == 0)
  {
    objc_storeStrong((id *)p_background, a3);
    [(UIDocumentViewControllerLaunchOptions *)self _setNeedsUpdateDocumentUnavailableConfiguration];
  }
}

- (void)setForegroundAccessoryView:(id)a3
{
  foregroundAccessoryView = self->_foregroundAccessoryView;
  p_foregroundAccessoryView = &self->_foregroundAccessoryView;
  if (foregroundAccessoryView != a3)
  {
    objc_storeStrong((id *)p_foregroundAccessoryView, a3);
    [(UIDocumentViewControllerLaunchOptions *)self _setNeedsUpdateDocumentUnavailableConfiguration];
  }
}

- (void)setBackgroundAccessoryView:(id)a3
{
  backgroundAccessoryView = self->_backgroundAccessoryView;
  p_backgroundAccessoryView = &self->_backgroundAccessoryView;
  if (backgroundAccessoryView != a3)
  {
    objc_storeStrong((id *)p_backgroundAccessoryView, a3);
    [(UIDocumentViewControllerLaunchOptions *)self _setNeedsUpdateDocumentUnavailableConfiguration];
  }
}

- (void)_setSecondaryMenu:(id)a3
{
  secondaryMenu = self->_secondaryMenu;
  p_secondaryMenu = &self->_secondaryMenu;
  if (secondaryMenu != a3)
  {
    objc_storeStrong((id *)p_secondaryMenu, a3);
    [(UIDocumentViewControllerLaunchOptions *)self _setNeedsUpdateDocumentUnavailableConfiguration];
  }
}

+ (id)createDocumentActionWithIntent:(id)a3
{
  return +[_UIDocumentUnavailableConfiguration createDocumentActionWithIntent:]((uint64_t)_UIDocumentUnavailableConfiguration, a3);
}

- (void)_setNeedsUpdateDocumentUnavailableConfiguration
{
  if (self) {
    self = (UIDocumentViewControllerLaunchOptions *)objc_loadWeakRetained((id *)&self->__documentViewController);
  }
  v2 = self;
  -[UIDocumentViewController _setNeedsUpdateDocumentUnavailableConfiguration](self);
}

- (void)_documentDidChange
{
  if (a1)
  {
    id v9 = a1[4];
    if ([v9 isViewLoaded]) {
      [v9 _endTransitionCoordinatorSession];
    }
    id WeakRetained = objc_loadWeakRetained(a1 + 15);
    id v3 = [WeakRetained document];

    if (v3)
    {
      v4 = [v3 fileURL];
      objc_storeStrong(a1 + 12, v4);
      if ([v9 isViewLoaded]) {
        [v9 _beginTransitionCoordinatorSessionForDocumentURL:v4];
      }
      if ((_UIDocumentViewControllerWantsUIPDocumentLanding() & 1) == 0 && ([v3 documentState] & 1) == 0) {
        [a1 _dismissBrowserViewController];
      }
    }
    id v5 = a1[13];
    if (v5)
    {
      id v6 = [v3 fileURL];
      char v7 = [v6 isEqual:v5];

      if ((v7 & 1) == 0)
      {
        id v8 = a1[13];
        a1[13] = 0;
      }
    }
  }
}

- (void)_documentCloseStateDidChange
{
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 15);
    id v3 = [WeakRetained document];

    if ((_UIDocumentViewControllerWantsUIPDocumentLanding() & 1) == 0 && ([v3 documentState] & 1) == 0) {
      [a1 _dismissBrowserViewController];
    }
    [a1 _setNeedsUpdateDocumentUnavailableConfiguration];
  }
}

- (void)_documentProgressStateDidChange
{
  if (a1)
  {
    id v7 = *(id *)(a1 + 32);
    if ([v7 isViewLoaded])
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 120));
      id v3 = [WeakRetained document];

      v4 = [v3 fileURL];
      id v5 = [v7 transitionControllerForDocumentAtURL:v4];

      id v6 = [v3 progress];
      [v5 setLoadingProgress:v6];
    }
  }
}

- (void)documentLandingBrowser:(id)a3 didPickDocumentsAtURLs:(id)a4
{
  id v6 = [a3 delegate];
  char v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) == 0)
  {
    id v8 = [a4 firstObject];
    [(UIDocumentViewControllerLaunchOptions *)self _replaceDocumentWithDocumentAtURL:v8 isImport:0];
  }
}

- (void)documentLandingBrowser:(id)a3 didRequestDocumentCreationWithHandler:(id)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  char v7 = [a3 contentTypesForRecentDocuments];
  id v8 = (void *)MEMORY[0x1E4F1CAD0];
  id v9 = +[_UIApplicationInfoParser mainBundleInfoParser];
  uint64_t v10 = [v9 editorRoleDocumentUTTypes];
  id v11 = [v8 setWithArray:v10];

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v12 = v7;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v42 objects:v50 count:16];
  if (!v13)
  {
LABEL_9:

LABEL_17:
    if ([v12 count])
    {
      v34 = *(NSObject **)(__UILogGetCategoryCachedImpl("UIDocument", &_MergedGlobals_1270) + 8);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v35 = "Unable to create document. The UIDocumentBrowserViewController supports no content types that have a UIDoc"
              "ument subclass with an editor role defined in the Info.plist's CFBundleDocumentTypes dictionary.";
LABEL_22:
        _os_log_impl(&dword_1853B0000, v34, OS_LOG_TYPE_ERROR, v35, buf, 2u);
      }
    }
    else
    {
      v34 = *(NSObject **)(__UILogGetCategoryCachedImpl("UIDocument", &qword_1EB264838) + 8);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v35 = "Unable to create document. Ensure a UIDocument subclass with an editor role is defined in the Info.plist's"
              " CFBundleDocumentTypes dictionary.";
        goto LABEL_22;
      }
    }
    (*((void (**)(id, void, void))a4 + 2))(a4, 0, 0);
    goto LABEL_24;
  }
  uint64_t v14 = v13;
  uint64_t v15 = *(void *)v43;
LABEL_3:
  uint64_t v16 = 0;
  while (1)
  {
    if (*(void *)v43 != v15) {
      objc_enumerationMutation(v12);
    }
    v17 = *(void **)(*((void *)&v42 + 1) + 8 * v16);
    if ([v11 containsObject:v17]) {
      break;
    }
    if (v14 == ++v16)
    {
      uint64_t v14 = [v12 countByEnumeratingWithState:&v42 objects:v50 count:16];
      if (v14) {
        goto LABEL_3;
      }
      goto LABEL_9;
    }
  }
  id v18 = v17;

  if (!v18) {
    goto LABEL_17;
  }
  v19 = +[_UIApplicationInfoParser mainBundleInfoParser];
  v20 = [v19 utTypeToDocumentClassMap];

  v21 = (void *)[v20 objectForKeyedSubscript:v18];
  if (!v21 || ([v21 isSubclassOfClass:objc_opt_class()] & 1) == 0)
  {
    v36 = [MEMORY[0x1E4F28B00] currentHandler];
    [v36 handleFailureInMethod:a2, self, @"UIDocumentViewControllerLaunchOptions.m", 257, @"Expected UIDocument subclass for %@. Received: %@", v18, v21 object file lineNumber description];
  }
  v22 = [a3 activeDocumentCreationIntent];
  char v23 = [v22 isEqualToString:@"UIDocumentCreationIntentDefault"];

  if ((v23 & 1) == 0)
  {
    v24 = *(NSObject **)(__UILogGetCategoryCachedImpl("UIDocument", &qword_1EB264840) + 8);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v25 = v24;
      v26 = [a3 activeDocumentCreationIntent];
      *(_DWORD *)buf = 138412546;
      v47 = @"UIDocumentCreationIntentDefault";
      __int16 v48 = 2112;
      v49 = v26;
      _os_log_impl(&dword_1853B0000, v25, OS_LOG_TYPE_ERROR, "UIDocumentBrowserViewController requested the creation of a document with an app-defined intent. Falling back to creating a document for %@. To control the document created for %@, implement -[UIDocumentBrowserViewControllerDelegate documentBrowser:didRequestDocumentCreationWithHandler:].", buf, 0x16u);
    }
  }
  v27 = [MEMORY[0x1E4F28CB8] defaultManager];
  v28 = [v27 temporaryDirectory];

  v29 = _UILocalizedString(@"com.apple.documents.untitled.document", @"The default title of a new document.", @"Untitled");
  v30 = [v28 URLByAppendingPathComponent:v29 conformingToType:v18];

  v31 = (void *)[objc_alloc((Class)v21) initWithFileURL:v30];
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __102__UIDocumentViewControllerLaunchOptions_documentLandingBrowser_didRequestDocumentCreationWithHandler___block_invoke;
  v38[3] = &unk_1E52EBD50;
  id v40 = v30;
  id v41 = a4;
  id v39 = v31;
  id v32 = v30;
  id v33 = v31;
  [v33 saveToURL:v32 forSaveOperation:0 completionHandler:v38];

LABEL_24:
}

void __102__UIDocumentViewControllerLaunchOptions_documentLandingBrowser_didRequestDocumentCreationWithHandler___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    v2 = *(void **)(a1 + 32);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __102__UIDocumentViewControllerLaunchOptions_documentLandingBrowser_didRequestDocumentCreationWithHandler___block_invoke_2;
    v6[3] = &unk_1E52EDA60;
    long long v5 = *(_OWORD *)(a1 + 40);
    id v3 = (id)v5;
    long long v7 = v5;
    [v2 closeWithCompletionHandler:v6];
  }
  else
  {
    v4 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v4();
  }
}

uint64_t __102__UIDocumentViewControllerLaunchOptions_documentLandingBrowser_didRequestDocumentCreationWithHandler___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  if (a2) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(v3 + 16))(v3, *(void *)(a1 + 32), 2);
  }
  else {
    return (*(uint64_t (**)(uint64_t, void, void))(v3 + 16))(v3, 0, 0);
  }
}

- (void)documentLandingBrowserWillStartDocumentCreation:(id)a3
{
  char flags = (char)self->_flags;
  if (flags)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"UIDocumentViewControllerLaunchOptions.m" lineNumber:295 description:@"UIKit internal inconsistency: attempted to begin document creation session whilst an existing session is active"];

    char flags = (char)self->_flags;
  }
  *(unsigned char *)&self->_char flags = flags | 1;
  id v6 = [a3 activeDocumentCreationIntent];
  objc_storeStrong((id *)&self->_documentCreationIntent, v6);

  [(UIDocumentViewControllerLaunchOptions *)self _setNeedsUpdateDocumentUnavailableConfiguration];
}

- (void)documentLandingBrowserDidEndDocumentCreation:(id)a3 importedURL:(id)a4 canceled:(BOOL)a5 error:(id)a6
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)&self->_flags &= ~1u;
  if (a6)
  {
    uint64_t v10 = *(NSObject **)(__UILogGetCategoryCachedImpl("UIDocument", &documentLandingBrowserDidEndDocumentCreation_importedURL_canceled_error____s_category)+ 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v15 = 138412290;
      id v16 = a6;
      _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_ERROR, "Failed to create document. Error: %@", (uint8_t *)&v15, 0xCu);
    }
    id v11 = [a3 delegate];
    char v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) == 0) {
      [(UIDocumentViewControllerLaunchOptions *)self _presentAlertForDocumentAtURL:a4 error:a6 isImport:1];
    }
  }
  objc_storeStrong((id *)&self->_createdDocumentURL, a4);
  [(UIDocumentViewControllerLaunchOptions *)self _setNeedsUpdateDocumentUnavailableConfiguration];
  if (a4)
  {
    uint64_t v13 = [a3 delegate];
    char v14 = objc_opt_respondsToSelector();

    if ((v14 & 1) == 0) {
      [(UIDocumentViewControllerLaunchOptions *)self _replaceDocumentWithDocumentAtURL:a4 isImport:1];
    }
  }
}

- (void)_replaceDocumentWithDocumentAtURL:(id)a3 isImport:(BOOL)a4
{
  BOOL v4 = a4;
  id v10 = 0;
  long long v7 = +[UIDocument _documentWithContentsOfFileURL:a3 error:&v10];
  id v8 = v10;
  if (v7)
  {
    if (self) {
      id WeakRetained = objc_loadWeakRetained((id *)&self->__documentViewController);
    }
    else {
      id WeakRetained = 0;
    }
    [WeakRetained setDocument:v7];
  }
  else
  {
    [(UIDocumentViewControllerLaunchOptions *)self _presentAlertForDocumentAtURL:a3 error:v8 isImport:v4];
  }
}

- (void)_presentAlertForDocumentAtURL:(id)a3 error:(id)a4 isImport:(BOOL)a5
{
  BOOL v5 = a5;
  long long v7 = a3;
  if (a3)
  {
    id v9 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v10 = [v7 path];
    long long v7 = [v9 displayNameAtPath:v10];
  }
  if (v5)
  {
    _UILocalizedString(@"com.apple.documents.error.import.title", @"The title of an alert presented when a document could not be imported.", @"Unable to Import Document");
    id v31 = (id)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      _UILocalizedFormat(@"com.apple.documents.error.import.message", @"The message of an alert presented when a document could not be imported.", @"The document “%@” could not be imported.", v11, v12, v13, v14, v15, (uint64_t)v7);
      v21 = LABEL_8:;
      goto LABEL_10;
    }
  }
  else
  {
    _UILocalizedString(@"com.apple.documents.error.open.title", @"The title of an alert presented when a document could not be opened.", @"Unable to Open Document");
    id v31 = (id)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      _UILocalizedFormat(@"com.apple.documents.error.open.message", @"The message of an alert presented when a document could not be opened.", @"The document “%@” could not be opened.", v16, v17, v18, v19, v20, (uint64_t)v7);
      goto LABEL_8;
    }
  }
  v21 = 0;
LABEL_10:
  v22 = [a4 localizedFailureReason];
  char v23 = v22;
  if (v22)
  {
    id v24 = v22;
  }
  else
  {
    id v24 = [a4 localizedDescription];
  }
  v25 = v24;

  if (v21 && [v25 length])
  {
    id v26 = [v21 stringByAppendingFormat:@" %@", v25];
  }
  else
  {
    id v26 = v25;
  }
  v27 = v26;

  v28 = +[UIAlertController alertControllerWithTitle:v31 message:v27 preferredStyle:1];
  v29 = _UILocalizedString(@"OK", @"Dismiss button of an alert when opening a document failed", @"OK");
  v30 = +[UIAlertAction actionWithTitle:v29 style:1 handler:0];
  [v28 addAction:v30];

  if (self) {
    self = (UIDocumentViewControllerLaunchOptions *)objc_loadWeakRetained((id *)&self->__documentViewController);
  }
  [(UIDocumentViewControllerLaunchOptions *)self presentViewController:v28 animated:1 completion:0];
}

- (id)_documentUnavailableConfiguration
{
  if (a1)
  {
    v2 = [_UIDocumentUnavailableConfiguration alloc];
    uint64_t v3 = [(id)a1 browserViewController];
    BOOL v4 = -[_UIDocumentUnavailableConfiguration initWithBrowserViewController:](v2, v3);

    id v6 = [(id)a1 title];
    if (v4) {
      objc_setProperty_nonatomic_copy(v4, v5, v6, 56);
    }

    id v8 = [(id)a1 primaryAction];
    if (v4) {
      objc_setProperty_nonatomic_copy(v4, v7, v8, 64);
    }

    id v10 = [(id)a1 secondaryAction];
    if (v4) {
      objc_setProperty_nonatomic_copy(v4, v9, v10, 72);
    }

    uint64_t v11 = [(id)a1 documentTargetView];
    -[_UIDocumentUnavailableConfiguration setDocumentTargetView:]((uint64_t)v4, v11);

    uint64_t v12 = [(id)a1 background];
    -[UIBackgroundConfiguration _setStrokeColor:]((uint64_t)v4, v12);

    uint64_t v13 = [(id)a1 foregroundAccessoryView];
    -[_UICollectionLayoutSectionListSolver setPreferredSizes:]((uint64_t)v4, v13);

    uint64_t v14 = [(id)a1 backgroundAccessoryView];
    -[_UIDocumentUnavailableConfiguration setBackgroundAccessoryView:]((uint64_t)v4, v14);

    uint64_t v15 = [(id)a1 _secondaryMenu];
    -[_UIDocumentUnavailableConfiguration _setSecondaryMenu:]((uint64_t)v4, v15);

    -[_UIHomeAffordanceObservationRecord setLegacyViewServiceSessionIdentifier:]((uint64_t)v4, *(void **)(a1 + 96));
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 120));
    uint64_t v17 = [WeakRetained document];

    if (v17)
    {
      if ([v17 documentState]) {
        uint64_t v18 = 9;
      }
      else {
        uint64_t v18 = 1;
      }
      uint64_t v19 = [v17 fileURL];
      int v20 = [v19 isEqual:*(void *)(a1 + 104)];

      if (v20) {
        uint64_t v21 = v18 | 4;
      }
      else {
        uint64_t v21 = v18;
      }
    }
    else
    {
      uint64_t v21 = 0;
    }
    char v22 = *(unsigned char *)(a1 + 8);

    if (v4) {
      v4[4] = (id)(v21 | (2 * (v22 & 1)));
    }
    -[UIBackgroundConfiguration _setBackgroundColor:]((uint64_t)v4, *(void **)(a1 + 112));
    if (_UIDocumentViewControllerWantsUIPDocumentLanding())
    {
      char v23 = objc_loadWeakRetained((id *)(a1 + 120));
      if (v23)
      {
        BOOL v24 = (v23[976] & 1) == 0;
        if (!v4)
        {
LABEL_22:

          goto LABEL_25;
        }
      }
      else
      {
        BOOL v24 = 1;
        if (!v4) {
          goto LABEL_22;
        }
      }
      *((unsigned char *)v4 + 8) = v24;
      goto LABEL_22;
    }
    if (v4) {
      *((unsigned char *)v4 + 8) = 0;
    }
  }
  else
  {
    BOOL v4 = 0;
  }
LABEL_25:
  return v4;
}

- (void)_prepareBrowserViewController:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v6 = [a3 documentLandingPresenter];

  if (v6)
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v14 = [a3 documentLandingPresenter];
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UIDocumentViewControllerLaunchOptions.m", 423, @"Attempted to set browser view controller that is already associated with another launch options instance. Browser view controller: %@; Existing launch options: %@",
      a3,
      v14);
  }
  [a3 setDocumentLandingPresenter:self];
  if (_UIDocumentViewControllerWantsUIPDocumentLanding())
  {
    if (objc_opt_respondsToSelector())
    {
      [a3 _didAttachToDocumentLaunchOptionsForUseInUIPDocumentLanding];
    }
  }
  else
  {
    long long v7 = [a3 configuration];
    [v7 setForPickingDocuments:1];

    id v8 = [a3 configuration];
    [v8 setShouldHideCatalystHostWindow:0];

    id v9 = [a3 additionalTrailingNavigationBarButtonItems];
    id v10 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:1 target:self action:sel__dismissBrowserViewController];
    v15[0] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    uint64_t v12 = [v9 arrayByAddingObjectsFromArray:v11];
    [a3 setAdditionalTrailingNavigationBarButtonItems:v12];
  }
}

- (void)_dismissBrowserViewController
{
  id v4 = [(UIDocumentViewControllerLaunchOptions *)self browserViewController];
  v2 = [v4 presentingViewController];

  if (v2)
  {
    [v4 dismissViewControllerAnimated:1 completion:0];
    uint64_t v3 = [v4 activePresentationController];
    [v3 _sendDismissalsAsNeeded];
  }
}

- (UIMenu)_secondaryMenu
{
  return self->_secondaryMenu;
}

- (UIDocumentBrowserViewController)browserViewController
{
  return self->_browserViewController;
}

- (NSString)title
{
  return self->_title;
}

- (UIAction)primaryAction
{
  return self->_primaryAction;
}

- (UIAction)secondaryAction
{
  return self->_secondaryAction;
}

- (UIView)foregroundAccessoryView
{
  return self->_foregroundAccessoryView;
}

- (UIView)backgroundAccessoryView
{
  return self->_backgroundAccessoryView;
}

- (UIBackgroundConfiguration)background
{
  return self->_background;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->__documentViewController);
  objc_storeStrong((id *)&self->_documentCreationIntent, 0);
  objc_storeStrong((id *)&self->_createdDocumentURL, 0);
  objc_storeStrong((id *)&self->_documentURL, 0);
  objc_storeStrong((id *)&self->_defaultBrowserViewController, 0);
  objc_storeStrong((id *)&self->_background, 0);
  objc_storeStrong((id *)&self->_backgroundAccessoryView, 0);
  objc_storeStrong((id *)&self->_foregroundAccessoryView, 0);
  objc_storeStrong((id *)&self->_secondaryAction, 0);
  objc_storeStrong((id *)&self->_primaryAction, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_browserViewController, 0);
  objc_storeStrong((id *)&self->_secondaryMenu, 0);
  objc_storeStrong((id *)&self->_documentTargetView, 0);
}

@end
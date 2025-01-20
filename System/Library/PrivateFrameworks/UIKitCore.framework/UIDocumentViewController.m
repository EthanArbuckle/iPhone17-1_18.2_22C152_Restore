@interface UIDocumentViewController
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (UIBarButtonItemGroup)undoRedoItemGroup;
- (UIDocument)document;
- (UIDocumentViewController)initWithDocument:(UIDocument *)document;
- (UIDocumentViewControllerLaunchOptions)launchOptions;
- (UIEdgeInsets)_edgeInsetsForChildViewController:(id)a3 insetsAreAbsolute:(BOOL *)a4;
- (dispatch_queue_t)documentBackgroundQueue;
- (id)undoManager;
- (void)_closeDocumentIfNecessary:(id)a3 completionHandler:(id)a4;
- (void)_documentDidOpen;
- (void)_documentStateChanged:(id)a3;
- (void)_intelligenceCollectContentIn:(CGRect)a3 collector:(id)a4;
- (void)_localizedNameChanged:(id)a3;
- (void)_performDocumentUnavailableConfigurationUpdate;
- (void)_registerDocumentAssociation;
- (void)_registerDocumentObservers;
- (void)_setNeedsUpdateDocumentUnavailableConfiguration;
- (void)_unregisterDocumentAssociation;
- (void)_unregisterDocumentObservers;
- (void)_updateIsPresentedFromDocumentBrowser;
- (void)_updateNavigationItem;
- (void)_updateUndoManagerBinding;
- (void)dealloc;
- (void)didMoveToParentViewController:(id)a3;
- (void)loadView;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)open:(id)a3;
- (void)openDocumentWithCompletionHandler:(void *)completionHandler;
- (void)redo:(id)a3;
- (void)setDocument:(UIDocument *)document;
- (void)setLaunchOptions:(id)a3;
- (void)setView:(id)a3;
- (void)undo:(id)a3;
- (void)updateContentUnavailableConfigurationUsingState:(id)a3;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation UIDocumentViewController

- (void)_intelligenceCollectContentIn:(CGRect)a3 collector:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v10 = self;
  UIDocumentViewController._intelligenceCollectContent(in:collector:)((void (*)(void, void))v9, x, y, width, height);
}

- (UIDocumentViewController)initWithDocument:(UIDocument *)document
{
  v4 = [(UIViewController *)self initWithNibName:0 bundle:0];
  v5 = v4;
  if (v4) {
    [(UIDocumentViewController *)v4 setDocument:document];
  }
  return v5;
}

- (void)setDocument:(UIDocument *)document
{
  p_document = &self->_document;
  if (self->_document != document)
  {
    [(UIDocumentViewController *)self _unregisterDocumentObservers];
    [(UIDocumentViewController *)self _unregisterDocumentAssociation];
    v6 = [(UIDocumentViewController *)self document];
    [(UIDocumentViewController *)self _closeDocumentIfNecessary:v6 completionHandler:0];

    *(unsigned char *)&self->_flags &= ~2u;
    objc_storeStrong((id *)p_document, document);
    [(UIDocumentViewController *)self _registerDocumentObservers];
    [(UIDocumentViewController *)self _registerDocumentAssociation];
    [(UIDocumentViewController *)self _updateUndoManagerBinding];
    v7 = [(UIDocument *)document userActivity];
    [(UIViewController *)self setUserActivity:v7];

    v8 = [(UIDocumentViewController *)self launchOptions];
    -[UIDocumentViewControllerLaunchOptions _documentDidChange](v8);

    [(UIDocumentViewController *)self _updateNavigationItem];
    -[UIDocumentViewController _setNeedsUpdateDocumentUnavailableConfiguration](self);
    int v9 = [(UIViewController *)self _appearState];
    if (document)
    {
      if ((v9 - 1) <= 1)
      {
        [(UIDocumentViewController *)self openDocumentWithCompletionHandler:&__block_literal_global_6_9];
      }
    }
  }
}

- (void)_setNeedsUpdateDocumentUnavailableConfiguration
{
  if (a1)
  {
    if (qword_1EB25D860 != -1) {
      dispatch_once(&qword_1EB25D860, &__block_literal_global_265);
    }
    if (_MergedGlobals_19_4)
    {
      a1[976] |= 4u;
      id v2 = [a1 view];
      [v2 setNeedsLayout];
    }
    else
    {
      [a1 setNeedsUpdateContentUnavailableConfiguration];
    }
  }
}

- (void)openDocumentWithCompletionHandler:(void *)completionHandler
{
  v5 = [(UIDocumentViewController *)self document];
  v6 = v5;
  if (!v5)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __62__UIDocumentViewController_openDocumentWithCompletionHandler___block_invoke;
    v16[3] = &unk_1E52DA040;
    v16[4] = completionHandler;
    v8 = MEMORY[0x1E4F14428];
    int v9 = v16;
LABEL_6:
    dispatch_async(v8, v9);
    goto LABEL_7;
  }
  if ([v5 documentState] != 1)
  {
    [(UIDocumentViewController *)self _documentDidOpen];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62__UIDocumentViewController_openDocumentWithCompletionHandler___block_invoke_2;
    block[3] = &unk_1E52DA040;
    block[4] = completionHandler;
    v8 = MEMORY[0x1E4F14428];
    int v9 = block;
    goto LABEL_6;
  }
  objc_initWeak(&location, self);
  v7 = -[UIDocumentViewController documentBackgroundQueue]((uint64_t)self);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __62__UIDocumentViewController_openDocumentWithCompletionHandler___block_invoke_3;
  v10[3] = &unk_1E52F0B98;
  id v11 = v6;
  objc_copyWeak(&v13, &location);
  v12 = completionHandler;
  dispatch_async(v7, v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
LABEL_7:
}

uint64_t __62__UIDocumentViewController_openDocumentWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __62__UIDocumentViewController_openDocumentWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

- (dispatch_queue_t)documentBackgroundQueue
{
  if (a1)
  {
    dispatch_queue_t v2 = (dispatch_queue_t)*(id *)(a1 + 1000);
    if (!v2)
    {
      dispatch_queue_t v2 = dispatch_queue_create("com.apple.uikit.documentviewcontroller", 0);
      objc_storeStrong((id *)(a1 + 1000), v2);
    }
  }
  else
  {
    dispatch_queue_t v2 = 0;
  }
  return v2;
}

void __62__UIDocumentViewController_openDocumentWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  dispatch_queue_t v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __62__UIDocumentViewController_openDocumentWithCompletionHandler___block_invoke_4;
  v5[3] = &unk_1E52F0B70;
  objc_copyWeak(&v8, (id *)(a1 + 48));
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = v3;
  uint64_t v7 = v4;
  [v2 openWithCompletionHandler:v5];

  objc_destroyWeak(&v8);
}

void __62__UIDocumentViewController_openDocumentWithCompletionHandler___block_invoke_4(uint64_t a1, char a2)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __62__UIDocumentViewController_openDocumentWithCompletionHandler___block_invoke_5;
  v5[3] = &unk_1E52F0B48;
  char v9 = a2;
  objc_copyWeak(&v8, (id *)(a1 + 48));
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = v3;
  uint64_t v7 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v8);
}

uint64_t __62__UIDocumentViewController_openDocumentWithCompletionHandler___block_invoke_5(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    id v3 = [WeakRetained document];
    uint64_t v4 = *(void **)(a1 + 32);

    if (v3 == v4) {
      [WeakRetained _documentDidOpen];
    }
    else {
      [WeakRetained _closeDocumentIfNecessary:*(void *)(a1 + 32) completionHandler:0];
    }
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v6 = *(uint64_t (**)(void))(result + 16);
    return v6();
  }
  return result;
}

- (void)_documentDidOpen
{
  if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    *(unsigned char *)&self->_flags |= 2u;
    [(UIDocumentViewController *)self documentDidOpen];
  }
}

- (void)_closeDocumentIfNecessary:(id)a3 completionHandler:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (a3 && [a3 documentState] != 1)
  {
    objc_getAssociatedObject(a3, &_UIDocumentAssociatedDocumentViewControllers);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v7 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v19;
      while (2)
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          if (*(UIDocumentViewController **)(*((void *)&v18 + 1) + 8 * v11) != self)
          {
            v17[0] = MEMORY[0x1E4F143A8];
            v17[1] = 3221225472;
            v17[2] = __72__UIDocumentViewController__closeDocumentIfNecessary_completionHandler___block_invoke_2;
            v17[3] = &unk_1E52DA040;
            v17[4] = a4;
            dispatch_async(MEMORY[0x1E4F14428], v17);
            id v13 = v7;
            goto LABEL_14;
          }
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v23 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    v12 = -[UIDocumentViewController documentBackgroundQueue]((uint64_t)self);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __72__UIDocumentViewController__closeDocumentIfNecessary_completionHandler___block_invoke_3;
    v14[3] = &unk_1E52E3298;
    v14[4] = a3;
    id v15 = v12;
    id v16 = a4;
    id v13 = v12;
    dispatch_async(v13, v14);

LABEL_14:
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __72__UIDocumentViewController__closeDocumentIfNecessary_completionHandler___block_invoke;
    block[3] = &unk_1E52DA040;
    block[4] = a4;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __72__UIDocumentViewController__closeDocumentIfNecessary_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

uint64_t __72__UIDocumentViewController__closeDocumentIfNecessary_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __72__UIDocumentViewController__closeDocumentIfNecessary_completionHandler___block_invoke_3(uint64_t a1)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __72__UIDocumentViewController__closeDocumentIfNecessary_completionHandler___block_invoke_4;
  v5[3] = &unk_1E52F0BC0;
  dispatch_queue_t v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = v3;
  uint64_t v7 = v4;
  uint64_t v8 = *(void *)(a1 + 48);
  [v2 closeWithCompletionHandler:v5];
}

void __72__UIDocumentViewController__closeDocumentIfNecessary_completionHandler___block_invoke_4(uint64_t a1, char a2)
{
  dispatch_queue_t v2 = *(void **)(a1 + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__UIDocumentViewController__closeDocumentIfNecessary_completionHandler___block_invoke_5;
  block[3] = &unk_1E52E3538;
  char v6 = a2;
  long long v5 = *(_OWORD *)(a1 + 40);
  id v3 = v2;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __72__UIDocumentViewController__closeDocumentIfNecessary_completionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (!*(unsigned char *)(a1 + 48))
  {
    dispatch_queue_t v2 = *(id *)(__UILogGetCategoryCachedImpl("UIDocument", &_UIInternalPreference_ForceDocumentViewControllerDocumentLanding_block_invoke___s_category)+ 8);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      id v3 = *(void **)(a1 + 32);
      if (v3)
      {
        uint64_t v4 = NSString;
        id v5 = v3;
        char v6 = (objc_class *)objc_opt_class();
        uint64_t v7 = NSStringFromClass(v6);
        uint64_t v8 = [v4 stringWithFormat:@"<%@: %p>", v7, v5];
      }
      else
      {
        uint64_t v8 = @"(nil)";
      }
      *(_DWORD *)buf = 138412290;
      uint64_t v11 = v8;
      _os_log_impl(&dword_1853B0000, v2, OS_LOG_TYPE_ERROR, "Unable to close document. Reference to this document will be dropped but the document remains open. This might cause state to be lost. Document: %@", buf, 0xCu);
    }
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 48));
  }
  return result;
}

- (void)updateContentUnavailableConfigurationUsingState:(id)a3
{
  uint64_t v4 = [(UIDocumentViewController *)self document];
  if (self) {
    char v5 = *(unsigned char *)&self->_flags & 1;
  }
  else {
    char v5 = 0;
  }
  if (qword_1EB25D860 != -1) {
    dispatch_once(&qword_1EB25D860, &__block_literal_global_265);
  }
  char v6 = 0;
  if (_MergedGlobals_19_4) {
    char v7 = 1;
  }
  else {
    char v7 = v5;
  }
  if ((v7 & 1) == 0 && !v4)
  {
    char v6 = +[UIContentUnavailableConfiguration emptyConfiguration];
    uint64_t v8 = +[UIImage systemImageNamed:@"doc"];
    [v6 setImage:v8];

    uint64_t v9 = _UILocalizedString(@"com.apple.documents.empty.title", @"The title of the message showing in a document view controller if there's no document loaded.", @"No Document");
    [v6 setText:v9];

    uint64_t v10 = _UILocalizedString(@"com.apple.documents.empty.message", @"The message showing in a document view controller if there's no document loaded. The button label mentioned in the message should equal the localization key com.apple.documents.backaction", @"Select a document by tapping the “Documents” button.");
    [v6 setSecondaryText:v10];

    uint64_t v11 = +[UIColor systemBackgroundColor];
    uint64_t v12 = [v6 background];
    [v12 setBackgroundColor:v11];

    id v13 = [(UIViewController *)self navigationController];
    v14 = v13;
    if (!v13 || [v13 isNavigationBarHidden])
    {
      id v15 = _UILocalizedString(@"com.apple.documents.backaction", @"The title of the back button in a document based app that leads back to the document view controller.", @"Documents");
      id v16 = [v6 button];
      [v16 setTitle:v15];

      objc_initWeak(&location, self);
      uint64_t v19 = MEMORY[0x1E4F143A8];
      uint64_t v20 = 3221225472;
      long long v21 = __76__UIDocumentViewController_updateContentUnavailableConfigurationUsingState___block_invoke;
      v22 = &unk_1E52DDB60;
      objc_copyWeak(&v23, &location);
      v17 = +[UIAction actionWithHandler:&v19];
      long long v18 = objc_msgSend(v6, "buttonProperties", v19, v20, v21, v22);
      [v18 setPrimaryAction:v17];

      objc_destroyWeak(&v23);
      objc_destroyWeak(&location);
    }
  }
  [(UIViewController *)self setContentUnavailableConfiguration:v6];
}

void __76__UIDocumentViewController_updateContentUnavailableConfigurationUsingState___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained open:0];
}

- (void)_performDocumentUnavailableConfigurationUpdate
{
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    *(unsigned char *)&self->_flags &= ~4u;
    id v8 = [(UIDocumentViewController *)self launchOptions];
    id v3 = -[UIDocumentViewControllerLaunchOptions _documentUnavailableConfiguration]((uint64_t)v8);
    uint64_t v4 = self->_launchViewController;
    if (!v4)
    {
      if (qword_1EB25D860 != -1) {
        dispatch_once(&qword_1EB25D860, &__block_literal_global_265);
      }
      if (!_MergedGlobals_19_4 || (*((_WORD *)&self->super._viewControllerFlags + 4) & 0x80) != 0)
      {
        uint64_t v4 = 0;
      }
      else
      {
        char v5 = [_UIDocumentLaunchViewController alloc];
        char v6 = [(UIDocumentViewController *)self launchOptions];
        char v7 = -[UIDocumentViewControllerLaunchOptions _documentUnavailableConfiguration]((uint64_t)v6);
        uint64_t v4 = (_UIDocumentLaunchViewController *)-[_UIDocumentLaunchViewController initWithConfiguration:](v5, (uint64_t)v7);

        [(UIViewController *)self addChildViewController:v4];
        [(_UIDocumentLaunchViewController *)v4 didMoveToParentViewController:self];
        objc_storeStrong((id *)&self->_launchViewController, v4);
      }
    }
    -[_UIDocumentLaunchViewController setConfiguration:]((uint64_t)v4, (uint64_t)v3);
  }
}

- (UIDocumentViewControllerLaunchOptions)launchOptions
{
  p_launchOptions = &self->_launchOptions;
  uint64_t v4 = self->_launchOptions;
  if (!v4)
  {
    if ((*((_WORD *)&self->super._viewControllerFlags + 4) & 0x80) != 0)
    {
      uint64_t v4 = 0;
    }
    else
    {
      uint64_t v4 = (UIDocumentViewControllerLaunchOptions *)-[UIDocumentViewControllerLaunchOptions initWithDocumentViewController:]([UIDocumentViewControllerLaunchOptions alloc], self);
      objc_storeStrong((id *)p_launchOptions, v4);
    }
  }
  return v4;
}

- (void)setLaunchOptions:(id)a3
{
  p_launchOptions = &self->_launchOptions;
  launchOptions = self->_launchOptions;
  if (launchOptions != a3 && (*((_WORD *)&self->super._viewControllerFlags + 4) & 0x80) == 0)
  {
    if (launchOptions) {
      objc_storeWeak((id *)&launchOptions->__documentViewController, 0);
    }
    objc_storeStrong((id *)p_launchOptions, a3);
    if (a3) {
      objc_storeWeak((id *)a3 + 15, self);
    }
    -[UIDocumentViewController _setNeedsUpdateDocumentUnavailableConfiguration](self);
  }
}

- (void)_registerDocumentObservers
{
  id v5 = [(UIDocumentViewController *)self document];
  self->_lastKnownState = [v5 documentState];
  if (v5)
  {
    [v5 addObserver:self forKeyPath:@"undoManager" options:1 context:&unk_1EB25D85A];
    [v5 addObserver:self forKeyPath:@"fileURL" options:1 context:&unk_1EB25D85C];
    [v5 addObserver:self forKeyPath:@"userActivity" options:1 context:&unk_1EB25D85E];
    id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:self selector:sel__documentStateChanged_ name:@"UIDocumentStateChangedNotification" object:v5];

    uint64_t v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:self selector:sel__localizedNameChanged_ name:@"UIDocumentLocalizedNameChangedNotification" object:v5];
  }
}

- (void)_unregisterDocumentObservers
{
  id v3 = [(UIDocumentViewController *)self document];
  if (v3)
  {
    id v6 = v3;
    [v3 removeObserver:self forKeyPath:@"undoManager" context:&unk_1EB25D85A];
    [v6 removeObserver:self forKeyPath:@"fileURL" context:&unk_1EB25D85C];
    [v6 removeObserver:self forKeyPath:@"userActivity" context:&unk_1EB25D85E];
    uint64_t v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 removeObserver:self name:@"UIDocumentStateChangedNotification" object:v6];

    id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 removeObserver:self name:@"UIDocumentLocalizedNameChangedNotification" object:v6];

    id v3 = v6;
  }
}

- (void)_documentStateChanged:(id)a3
{
  id v5 = [(UIDocumentViewController *)self document];
  id v6 = [a3 object];

  if (v6 != v5)
  {
    if (os_variant_has_internal_diagnostics())
    {
      v14 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v14, OS_LOG_TYPE_FAULT, "Received a document state did change notification from a document not associated with this view controller.", buf, 2u);
      }
    }
    else
    {
      id v13 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_documentStateChanged____s_category) + 8);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v15 = 0;
        _os_log_impl(&dword_1853B0000, v13, OS_LOG_TYPE_ERROR, "Received a document state did change notification from a document not associated with this view controller.", v15, 2u);
      }
    }
  }
  char v7 = [a3 object];

  if (v7 == v5)
  {
    unint64_t v8 = [v5 documentState];
    if (self) {
      unint64_t lastKnownState = self->_lastKnownState;
    }
    else {
      LOBYTE(lastKnownState) = 0;
    }
    self->_unint64_t lastKnownState = v8;
    char v10 = lastKnownState ^ v8;
    uint64_t v11 = [(UIDocumentViewController *)self launchOptions];
    uint64_t v12 = v11;
    if (v10) {
      -[UIDocumentViewControllerLaunchOptions _documentCloseStateDidChange](v11);
    }
    if ((v10 & 0x10) != 0) {
      -[UIDocumentViewControllerLaunchOptions _documentProgressStateDidChange]((uint64_t)v12);
    }
  }
}

- (void)_localizedNameChanged:(id)a3
{
  id v5 = [(UIDocumentViewController *)self document];
  id v6 = [a3 object];

  if (v6 != v5)
  {
    if (os_variant_has_internal_diagnostics())
    {
      uint64_t v9 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v9, OS_LOG_TYPE_FAULT, "Received a localization name did change notification from a document not associated with this view controller.", buf, 2u);
      }
    }
    else
    {
      unint64_t v8 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_localizedNameChanged____s_category) + 8);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)char v10 = 0;
        _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_ERROR, "Received a localization name did change notification from a document not associated with this view controller.", v10, 2u);
      }
    }
  }
  char v7 = [a3 object];

  if (v7 == v5) {
    [(UIDocumentViewController *)self _updateNavigationItem];
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __75__UIDocumentViewController_observeValueForKeyPath_ofObject_change_context___block_invoke;
  aBlock[3] = &unk_1E52DF528;
  objc_copyWeak(v9, &location);
  v9[1] = a6;
  char v7 = (void (**)(void))_Block_copy(aBlock);
  if (pthread_main_np() == 1) {
    v7[2](v7);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], v7);
  }

  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
}

void __75__UIDocumentViewController_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = *(void **)(a1 + 40);
  if (v3 == &unk_1EB25D85A)
  {
    id v6 = WeakRetained;
    [WeakRetained _updateUndoManagerBinding];
  }
  else
  {
    if (v3 == &unk_1EB25D85C)
    {
      id v6 = WeakRetained;
      uint64_t v4 = [WeakRetained launchOptions];
      -[UIDocumentViewControllerLaunchOptions _documentDidChange](v4);
    }
    else
    {
      if (v3 != &unk_1EB25D85E) {
        goto LABEL_9;
      }
      id v6 = WeakRetained;
      uint64_t v4 = [WeakRetained document];
      id v5 = [v4 userActivity];
      [v6 setUserActivity:v5];
    }
  }
  id WeakRetained = v6;
LABEL_9:
}

- (void)_registerDocumentAssociation
{
  id v3 = [(UIDocumentViewController *)self document];
  if (v3)
  {
    id object = v3;
    uint64_t v4 = objc_getAssociatedObject(v3, &_UIDocumentAssociatedDocumentViewControllers);
    if (!v4)
    {
      uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:517 capacity:1];
      objc_setAssociatedObject(object, &_UIDocumentAssociatedDocumentViewControllers, v4, (void *)1);
    }
    [v4 addObject:self];

    id v3 = object;
  }
}

- (void)_unregisterDocumentAssociation
{
  id v3 = [(UIDocumentViewController *)self document];
  if (v3)
  {
    id v5 = v3;
    uint64_t v4 = objc_getAssociatedObject(v3, &_UIDocumentAssociatedDocumentViewControllers);
    [v4 removeObject:self];

    id v3 = v5;
  }
}

- (void)_updateNavigationItem
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(UIDocumentViewController *)self document];
  uint64_t v4 = [(UIViewController *)self navigationItem];
  [v4 setStyle:2];
  [v4 setLargeTitleDisplayMode:2];
  [v4 setTitleMenuProvider:&__block_literal_global_62];
  if (v3)
  {
    id v5 = [v3 localizedName];
    [v4 setTitle:v5];

    [v4 setRenameDelegate:v3];
    id v6 = objc_alloc(MEMORY[0x1E4F28D78]);
    char v7 = [v3 fileURL];
    unint64_t v8 = (void *)[v6 initWithContentsOfURL:v7];

    uint64_t v9 = [v3 localizedName];
    [v8 setSuggestedName:v9];

    char v10 = [UIDocumentProperties alloc];
    uint64_t v11 = [v3 fileURL];
    uint64_t v12 = [(UIDocumentProperties *)v10 initWithURL:v11];

    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __49__UIDocumentViewController__updateNavigationItem__block_invoke_2;
    v28[3] = &unk_1E52F0C08;
    id v13 = v8;
    id v29 = v13;
    [(UIDocumentProperties *)v12 setDragItemsProvider:v28];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __49__UIDocumentViewController__updateNavigationItem__block_invoke_3;
    v26[3] = &unk_1E52F0C30;
    id v27 = v13;
    id v14 = v13;
    [(UIDocumentProperties *)v12 setActivityViewControllerProvider:v26];
    [v4 setDocumentProperties:v12];
  }
  char flags = (char)self->_flags;
  if (flags) {
    goto LABEL_7;
  }
  if (qword_1EB25D860 != -1) {
    dispatch_once(&qword_1EB25D860, &__block_literal_global_265);
  }
  if (_MergedGlobals_19_4)
  {
LABEL_7:
    objc_initWeak(&location, self);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __49__UIDocumentViewController__updateNavigationItem__block_invoke_4;
    v22[3] = &unk_1E52F0C80;
    objc_copyWeak(&v23, &location);
    char v24 = flags & 1;
    id v16 = +[UIAction actionWithHandler:v22];
    [v4 setBackAction:v16];

    [v4 setLeadingItemGroups:MEMORY[0x1E4F1CBF0]];
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }
  else
  {
    [v4 setBackAction:0];
    v17 = [UIBarButtonItem alloc];
    long long v18 = _UILocalizedString(@"com.apple.documents.backaction", @"The title of the back button in a document based app that leads back to the document view controller.", @"Documents");
    uint64_t v19 = [(UIBarButtonItem *)v17 initWithTitle:v18 image:0 target:self action:sel_open_ menu:0];
    uint64_t v20 = [(UIBarButtonItem *)v19 creatingFixedGroup];
    v30[0] = v20;
    long long v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
    [v4 setLeadingItemGroups:v21];
  }
  [(UIDocumentViewController *)self navigationItemDidUpdate];
}

UIMenu *__49__UIDocumentViewController__updateNavigationItem__block_invoke(uint64_t a1, uint64_t a2)
{
  return +[UIMenu menuWithChildren:a2];
}

id __49__UIDocumentViewController__updateNavigationItem__block_invoke_2(uint64_t a1)
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v1 = [[UIDragItem alloc] initWithItemProvider:*(void *)(a1 + 32)];
  v4[0] = v1;
  dispatch_queue_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

id __49__UIDocumentViewController__updateNavigationItem__block_invoke_3(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F9F2E8]);
  v6[0] = *(void *)(a1 + 32);
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  uint64_t v4 = (void *)[v2 initWithActivityItems:v3 applicationActivities:0];

  return v4;
}

void __49__UIDocumentViewController__updateNavigationItem__block_invoke_4(uint64_t a1)
{
  id v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = [WeakRetained document];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __49__UIDocumentViewController__updateNavigationItem__block_invoke_5;
  v6[3] = &unk_1E52F0C58;
  objc_copyWeak(&v8, v2);
  id v5 = v4;
  id v7 = v5;
  char v9 = *(unsigned char *)(a1 + 40);
  [WeakRetained _closeDocumentIfNecessary:v5 completionHandler:v6];

  objc_destroyWeak(&v8);
}

void __49__UIDocumentViewController__updateNavigationItem__block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained document];
  id v3 = *(void **)(a1 + 32);

  if (v2 == v3)
  {
    if (*(unsigned char *)(a1 + 48)) {
      [WeakRetained dismissViewControllerAnimated:1 completion:0];
    }
    else {
      [WeakRetained setDocument:0];
    }
  }
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v7 = [(UIDocumentViewController *)self document];
  id v8 = v7;
  if (sel_undo_ == a3)
  {
    if (v7)
    {
      char v10 = [v7 undoManager];
      if (![v10 canUndo])
      {
LABEL_10:
        unsigned __int8 v9 = 0;
        goto LABEL_11;
      }
LABEL_7:
      unsigned __int8 v9 = ([v8 documentState] & 8) == 0;
LABEL_11:

      goto LABEL_16;
    }
LABEL_12:
    unsigned __int8 v9 = 0;
    goto LABEL_16;
  }
  if (sel_redo_ == a3)
  {
    if (v7)
    {
      char v10 = [v7 undoManager];
      if (![v10 canRedo]) {
        goto LABEL_10;
      }
      goto LABEL_7;
    }
    goto LABEL_12;
  }
  if (sel_open_ == a3)
  {
    if (qword_1EB25D860 != -1) {
      dispatch_once(&qword_1EB25D860, &__block_literal_global_265);
    }
    unsigned __int8 v9 = _MergedGlobals_19_4 == 0;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)UIDocumentViewController;
    unsigned __int8 v9 = [(UIViewController *)&v12 canPerformAction:a3 withSender:a4];
  }
LABEL_16:

  return v9;
}

- (void)undo:(id)a3
{
  id v4 = [(UIDocumentViewController *)self document];
  id v3 = [v4 undoManager];
  [v3 undo];
}

- (void)redo:(id)a3
{
  id v4 = [(UIDocumentViewController *)self document];
  id v3 = [v4 undoManager];
  [v3 redo];
}

- (void)open:(id)a3
{
  id v4 = [(UIDocumentViewController *)self launchOptions];
  id v7 = [v4 browserViewController];

  id v5 = v7;
  if (v7)
  {
    id v6 = [v7 presentingViewController];

    id v5 = v7;
    if (!v6)
    {
      [(UIViewController *)self presentViewController:v7 animated:1 completion:0];
      id v5 = v7;
    }
  }
}

- (id)undoManager
{
  id v2 = [(UIDocumentViewController *)self document];
  id v3 = [v2 undoManager];

  return v3;
}

- (UIBarButtonItemGroup)undoRedoItemGroup
{
  v15[2] = *MEMORY[0x1E4F143B8];
  p_undoRedoItemGroup = &self->_undoRedoItemGroup;
  id v4 = self->_undoRedoItemGroup;
  if (!v4)
  {
    id v5 = [UIBarButtonItem alloc];
    id v6 = _UILocalizedString(@"Undo", @"Undo bar button item title", @"Undo");
    id v7 = +[UIImage systemImageNamed:@"arrow.uturn.backward.circle"];
    id v8 = [(UIBarButtonItem *)v5 initWithTitle:v6 image:v7 target:self action:sel_undo_ menu:0];

    unsigned __int8 v9 = [UIBarButtonItem alloc];
    char v10 = _UILocalizedString(@"Redo", @"Redo bar button item title", @"Redo");
    uint64_t v11 = +[UIImage systemImageNamed:@"arrow.uturn.forward.circle"];
    objc_super v12 = [(UIBarButtonItem *)v9 initWithTitle:v10 image:v11 target:self action:sel_redo_ menu:0];

    v15[0] = v8;
    v15[1] = v12;
    id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
    id v4 = +[UIBarButtonItemGroup optionalGroupWithCustomizationIdentifier:@"com.apple.undoredo" inDefaultCustomization:1 representativeItem:0 items:v13];

    objc_storeStrong((id *)p_undoRedoItemGroup, v4);
  }
  return v4;
}

- (void)_updateUndoManagerBinding
{
  if (self) {
    undoManagerBinding = self->_undoManagerBinding;
  }
  else {
    undoManagerBinding = 0;
  }
  id v4 = undoManagerBinding;
  [(_UIBarButtonItemActionBinding *)v4 stopMonitoring];
  p_undoManagerBinding = &self->_undoManagerBinding;
  id v6 = self->_undoManagerBinding;
  self->_undoManagerBinding = 0;

  id v7 = [(UIDocumentViewController *)self document];
  id v8 = [v7 undoManager];
  if (v8)
  {
    unsigned __int8 v9 = [_UIBarButtonItemActionBinding alloc];
    char v10 = [(UIDocumentViewController *)self undoRedoItemGroup];
    uint64_t v11 = [v10 barButtonItems];
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    id v15 = __53__UIDocumentViewController__updateUndoManagerBinding__block_invoke;
    id v16 = &unk_1E52F0CA8;
    id v17 = v8;
    id v18 = v7;
    objc_super v12 = [(_UIBarButtonItemActionBinding *)v9 initWithBarButtonItems:v11 registerObservers:&v13 unregisterObservers:&__block_literal_global_105];

    objc_storeStrong((id *)p_undoManagerBinding, v12);
    [(_UIBarButtonItemActionBinding *)v12 startMonitoring];

    id v4 = v12;
  }
}

void __53__UIDocumentViewController__updateUndoManagerBinding__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 addObserver:a2 selector:a3 name:*MEMORY[0x1E4F28A90] object:*(void *)(a1 + 32)];
  [v6 addObserver:a2 selector:a3 name:*MEMORY[0x1E4F28A78] object:*(void *)(a1 + 32)];
  [v6 addObserver:a2 selector:a3 name:*MEMORY[0x1E4F28A98] object:*(void *)(a1 + 32)];
  [v6 addObserver:a2 selector:a3 name:*MEMORY[0x1E4F28A80] object:*(void *)(a1 + 32)];
  [v6 addObserver:a2 selector:a3 name:*MEMORY[0x1E4F28A68] object:*(void *)(a1 + 32)];
  [v6 addObserver:a2 selector:a3 name:@"UIDocumentStateChangedNotification" object:*(void *)(a1 + 40)];
}

void __53__UIDocumentViewController__updateUndoManagerBinding__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:a2];
}

- (void)loadView
{
  v5.receiver = self;
  v5.super_class = (Class)UIDocumentViewController;
  [(UIViewController *)&v5 loadView];
  id v3 = +[UIColor systemBackgroundColor];
  id v4 = [(UIViewController *)self view];
  [v4 setBackgroundColor:v3];

  [(UIDocumentViewController *)self _updateNavigationItem];
}

- (void)setView:(id)a3
{
  id v5 = [(UIViewController *)self viewIfLoaded];
  v6.receiver = self;
  v6.super_class = (Class)UIDocumentViewController;
  [(UIViewController *)&v6 setView:a3];
  if (v5 != a3) {
    -[UIDocumentViewController _setNeedsUpdateDocumentUnavailableConfiguration](self);
  }
}

- (void)viewIsAppearing:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UIDocumentViewController;
  [(UIViewController *)&v5 viewIsAppearing:a3];
  [(UIDocumentViewController *)self _updateIsPresentedFromDocumentBrowser];
  id v4 = [(UIDocumentViewController *)self document];

  if (v4)
  {
    [(UIDocumentViewController *)self openDocumentWithCompletionHandler:&__block_literal_global_113_2];
  }
  else
  {
    if (qword_1EB25D860 != -1) {
      dispatch_once(&qword_1EB25D860, &__block_literal_global_265);
    }
    if (!_MergedGlobals_19_4 && (*(unsigned char *)&self->_flags & 1) == 0) {
      [(UIDocumentViewController *)self open:0];
    }
  }
}

- (void)didMoveToParentViewController:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UIDocumentViewController;
  -[UIViewController didMoveToParentViewController:](&v6, sel_didMoveToParentViewController_);
  [(UIDocumentViewController *)self _updateIsPresentedFromDocumentBrowser];
  if (!a3)
  {
    objc_super v5 = [(UIDocumentViewController *)self document];
    [v5 autosaveWithCompletionHandler:0];
  }
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)UIDocumentViewController;
  [(UIViewController *)&v3 viewWillLayoutSubviews];
  [(UIDocumentViewController *)self _performDocumentUnavailableConfigurationUpdate];
}

- (void)_updateIsPresentedFromDocumentBrowser
{
  id v2 = self;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2050000000;
  objc_super v3 = (void *)qword_1EB25D868;
  uint64_t v15 = qword_1EB25D868;
  if (!qword_1EB25D868)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __getUIDocumentBrowserViewControllerClass_block_invoke_0;
    v11[3] = &unk_1E52D9900;
    v11[4] = &v12;
    __getUIDocumentBrowserViewControllerClass_block_invoke_0((uint64_t)v11);
    objc_super v3 = (void *)v13[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v12, 8);
  objc_super v5 = v2;
  while (1)
  {
    objc_super v6 = [v5 presentingViewController];
    if (v6)
    {
      if (objc_opt_isKindOfClass()) {
        break;
      }
    }

    uint64_t v7 = [v5 parentViewController];

    objc_super v5 = (void *)v7;
    if (!v7)
    {
      p_char flags = &v2->_flags;
      char flags = (char)v2->_flags;
      if ((flags & 1) == 0) {
        goto LABEL_12;
      }
      char v10 = 0;
      goto LABEL_11;
    }
  }

  p_char flags = &v2->_flags;
  char flags = (char)v2->_flags;
  if (flags) {
    goto LABEL_12;
  }
  char v10 = 1;
LABEL_11:
  *(unsigned char *)p_char flags = flags & 0xFE | v10;
  [(UIDocumentViewController *)v2 _updateNavigationItem];
  -[UIDocumentViewController _setNeedsUpdateDocumentUnavailableConfiguration](v2);
LABEL_12:
}

- (UIEdgeInsets)_edgeInsetsForChildViewController:(id)a3 insetsAreAbsolute:(BOOL *)a4
{
  uint64_t v7 = [(UIViewController *)self navigationController];
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    *a4 = 1;
    [v7 _contentOverlayInsets];
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)UIDocumentViewController;
    [(UIViewController *)&v20 _edgeInsetsForChildViewController:a3 insetsAreAbsolute:a4];
  }
  double v12 = v8;
  double v13 = v9;
  double v14 = v10;
  double v15 = v11;

  double v16 = v12;
  double v17 = v13;
  double v18 = v14;
  double v19 = v15;
  result.right = v19;
  result.bottom = v18;
  result.left = v17;
  result.top = v16;
  return result;
}

- (void)dealloc
{
  [(_UIDocumentLaunchViewController *)self->_launchViewController willMoveToParentViewController:0];
  [(UIViewController *)self->_launchViewController removeFromParentViewController];
  [(UIDocumentViewController *)self _unregisterDocumentObservers];
  [(UIDocumentViewController *)self _unregisterDocumentAssociation];
  objc_super v3 = [(UIDocumentViewController *)self document];
  [(UIDocumentViewController *)self _closeDocumentIfNecessary:v3 completionHandler:0];

  v4.receiver = self;
  v4.super_class = (Class)UIDocumentViewController;
  [(UIViewController *)&v4 dealloc];
}

- (UIDocument)document
{
  return self->_document;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_undoManagerBinding, 0);
  objc_storeStrong((id *)&self->_document, 0);
  objc_storeStrong((id *)&self->_launchViewController, 0);
  objc_storeStrong((id *)&self->_documentBackgroundQueue, 0);
  objc_storeStrong((id *)&self->_undoRedoItemGroup, 0);
  objc_storeStrong((id *)&self->_launchOptions, 0);
}

@end
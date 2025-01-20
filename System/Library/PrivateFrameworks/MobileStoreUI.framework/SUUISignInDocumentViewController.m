@interface SUUISignInDocumentViewController
- (SUUISignInDocumentViewController)initWithTemplateElement:(id)a3;
- (id)_backgroundColor;
- (id)_layoutContext;
- (void)_keyboardWillChangeFrame:(id)a3;
- (void)_keyboardWillHide:(id)a3;
- (void)_keyboardWillShow:(id)a3;
- (void)_layoutScrollView;
- (void)_reloadContentSize;
- (void)_reloadPanelViewWithScrollViewSize:(CGSize)a3;
- (void)_signInFailed:(id)a3 error:(id)a4;
- (void)_signInSuccess:(id)a3;
- (void)artworkRequest:(id)a3 didLoadImage:(id)a4;
- (void)dealloc;
- (void)documentDidUpdate:(id)a3;
- (void)layoutCacheDidFinishBatch:(id)a3;
- (void)loadView;
- (void)signInEntryComplete:(id)a3 accountName:(id)a4 password:(id)a5;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation SUUISignInDocumentViewController

- (SUUISignInDocumentViewController)initWithTemplateElement:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SUUISignInDocumentViewController;
  v6 = [(SUUISignInDocumentViewController *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_templateElement, a3);
    v8 = [MEMORY[0x263F08A00] defaultCenter];
    [v8 addObserver:v7 selector:sel__keyboardWillShow_ name:*MEMORY[0x263F83808] object:0];
    [v8 addObserver:v7 selector:sel__keyboardWillChangeFrame_ name:*MEMORY[0x263F837F8] object:0];
    [v8 addObserver:v7 selector:sel__keyboardWillHide_ name:*MEMORY[0x263F83800] object:0];
  }
  return v7;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F83808] object:0];
  [v3 removeObserver:self name:*MEMORY[0x263F837F8] object:0];
  [v3 removeObserver:self name:*MEMORY[0x263F83800] object:0];
  [(SUUIViewElementLayoutContext *)self->_layoutContext setArtworkRequestDelegate:0];
  [(SUUIViewElementLayoutContext *)self->_layoutContext setParentViewController:0];
  [(SUUILayoutCache *)self->_textLayoutCache setDelegate:0];

  v4.receiver = self;
  v4.super_class = (Class)SUUISignInDocumentViewController;
  [(SUUIViewController *)&v4 dealloc];
}

- (void)loadView
{
  id v10 = objc_alloc_init(MEMORY[0x263F82E00]);
  if (!self->_loginView)
  {
    v3 = objc_alloc_init(SUUISignInTemplateView);
    loginView = self->_loginView;
    self->_loginView = v3;

    [(SUUISignInTemplateView *)self->_loginView setDelegate:self];
    id v5 = self->_loginView;
    v6 = [(SUUISignInDocumentViewController *)self _backgroundColor];
    [(SUUIViewReuseView *)v5 setBackgroundColor:v6];

    [(SUUISignInTemplateView *)self->_loginView setPreservesSuperviewLayoutMargins:1];
  }
  scrollView = self->_scrollView;
  if (!scrollView)
  {
    v8 = (UIScrollView *)objc_alloc_init(MEMORY[0x263F82B88]);
    v9 = self->_scrollView;
    self->_scrollView = v8;

    [(UIScrollView *)self->_scrollView setAlwaysBounceHorizontal:0];
    [(UIScrollView *)self->_scrollView setAlwaysBounceVertical:0];
    [(UIScrollView *)self->_scrollView setPreservesSuperviewLayoutMargins:1];
    [(UIScrollView *)self->_scrollView addSubview:self->_loginView];
    scrollView = self->_scrollView;
  }
  [v10 addSubview:scrollView];
  [(SUUISignInDocumentViewController *)self setView:v10];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  [(SUUISignInDocumentViewController *)self _layoutScrollView];
  if (self->_loginView)
  {
    [(UIScrollView *)self->_scrollView bounds];
    -[SUUISignInDocumentViewController _reloadPanelViewWithScrollViewSize:](self, "_reloadPanelViewWithScrollViewSize:", v5, v6);
  }
  v7.receiver = self;
  v7.super_class = (Class)SUUISignInDocumentViewController;
  [(SUUIViewController *)&v7 viewWillAppear:v3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(SUUISignInTemplateView *)self->_loginView resignFirstResponder];
  v5.receiver = self;
  v5.super_class = (Class)SUUISignInDocumentViewController;
  [(SUUISignInDocumentViewController *)&v5 viewWillDisappear:v3];
}

- (void)viewWillLayoutSubviews
{
  [(SUUISignInDocumentViewController *)self _layoutScrollView];
  if (self->_loginView) {
    [(SUUISignInDocumentViewController *)self _reloadContentSize];
  }
  v3.receiver = self;
  v3.super_class = (Class)SUUISignInDocumentViewController;
  [(SUUISignInDocumentViewController *)&v3 viewWillLayoutSubviews];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  -[SUUISignInDocumentViewController _reloadPanelViewWithScrollViewSize:](self, "_reloadPanelViewWithScrollViewSize:", width, height);
  v8.receiver = self;
  v8.super_class = (Class)SUUISignInDocumentViewController;
  -[SUUISignInDocumentViewController viewWillTransitionToSize:withTransitionCoordinator:](&v8, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
}

- (void)artworkRequest:(id)a3 didLoadImage:(id)a4
{
  loginView = self->_loginView;
  id v7 = a4;
  id v8 = a3;
  id v9 = [(SUUISignInDocumentViewController *)self _layoutContext];
  [(SUUISignInTemplateView *)loginView setImage:v7 forArtworkRequest:v8 context:v9];
}

- (void)documentDidUpdate:(id)a3
{
  objc_super v4 = [a3 templateElement];
  templateElement = self->_templateElement;
  self->_templateElement = v4;

  loginView = self->_loginView;
  if (loginView)
  {
    id v7 = [(SUUISignInDocumentViewController *)self _backgroundColor];
    [(SUUIViewReuseView *)loginView setBackgroundColor:v7];

    [(UIScrollView *)self->_scrollView bounds];
    -[SUUISignInDocumentViewController _reloadPanelViewWithScrollViewSize:](self, "_reloadPanelViewWithScrollViewSize:", v8, v9);
  }
}

- (void)layoutCacheDidFinishBatch:(id)a3
{
  loginView = self->_loginView;
  templateElement = self->_templateElement;
  [(UIScrollView *)self->_scrollView bounds];
  double v7 = v6;
  id v8 = [(SUUISignInDocumentViewController *)self _layoutContext];
  [(SUUISignInTemplateView *)loginView reloadWithViewElement:templateElement width:v8 context:v7];
}

- (void)signInEntryComplete:(id)a3 accountName:(id)a4 password:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc_init(MEMORY[0x263F29118]);
  id v12 = objc_alloc_init(MEMORY[0x263F292A8]);
  [v12 setServiceType:2];
  [v12 setUsername:v9];
  [v12 _setPassword:v10];
  [v12 setIsUsernameEditable:0];
  [v12 setShouldAllowAppleIDCreation:0];
  [v12 setPresentingViewController:self];
  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __77__SUUISignInDocumentViewController_signInEntryComplete_accountName_password___block_invoke;
  v14[3] = &unk_2654012F0;
  objc_copyWeak(&v16, &location);
  id v13 = v9;
  id v15 = v13;
  [v11 authenticateWithContext:v12 completion:v14];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __77__SUUISignInDocumentViewController_signInEntryComplete_accountName_password___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __77__SUUISignInDocumentViewController_signInEntryComplete_accountName_password___block_invoke_5;
    v7[3] = &unk_2654012C8;
    objc_copyWeak(&v10, (id *)(a1 + 40));
    id v8 = *(id *)(a1 + 32);
    id v9 = v6;
    dispatch_async(MEMORY[0x263EF83A0], v7);

    objc_destroyWeak(&v10);
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __77__SUUISignInDocumentViewController_signInEntryComplete_accountName_password___block_invoke_2;
    block[3] = &unk_2654012A0;
    id v12 = v5;
    objc_copyWeak(&v14, (id *)(a1 + 40));
    id v13 = *(id *)(a1 + 32);
    dispatch_sync(MEMORY[0x263EF83A0], block);

    objc_destroyWeak(&v14);
  }
}

void __77__SUUISignInDocumentViewController_signInEntryComplete_accountName_password___block_invoke_2(id *a1)
{
  v2 = [MEMORY[0x263F7B288] contextForSignIn];
  objc_super v3 = [a1[4] objectForKey:*MEMORY[0x263F29010]];
  [v2 setAccountName:v3];

  objc_super v4 = [a1[4] objectForKey:*MEMORY[0x263F28FF0]];
  [v2 setInitialPassword:v4];

  id v5 = [a1[4] objectForKey:*MEMORY[0x263F28F58]];
  [v2 setAltDSID:v5];

  [v2 setAllowsRetry:0];
  [v2 setCanSetActiveAccount:1];
  [v2 setPromptStyle:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x263F7B118]) initWithAuthenticationContext:v2];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __77__SUUISignInDocumentViewController_signInEntryComplete_accountName_password___block_invoke_3;
  v7[3] = &unk_265401278;
  objc_copyWeak(&v9, a1 + 6);
  id v8 = a1[5];
  [v6 startWithAuthenticateResponseBlock:v7];

  objc_destroyWeak(&v9);
}

void __77__SUUISignInDocumentViewController_signInEntryComplete_accountName_password___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __77__SUUISignInDocumentViewController_signInEntryComplete_accountName_password___block_invoke_4;
  v9[3] = &unk_265401250;
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  objc_copyWeak(&v13, (id *)(a1 + 40));
  id v12 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], v9);

  objc_destroyWeak(&v13);
}

void __77__SUUISignInDocumentViewController_signInEntryComplete_accountName_password___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (!*(void *)(a1 + 32))
  {
    if (!v2) {
      return;
    }
    goto LABEL_5;
  }
  if (v2)
  {
LABEL_5:
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    [WeakRetained _signInFailed:*(void *)(a1 + 48) error:*(void *)(a1 + 40)];
    goto LABEL_6;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_super v3 = [*(id *)(a1 + 32) authenticatedAccount];
  [WeakRetained _signInSuccess:v3];

LABEL_6:
}

void __77__SUUISignInDocumentViewController_signInEntryComplete_accountName_password___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _signInFailed:*(void *)(a1 + 32) error:*(void *)(a1 + 40)];
}

- (void)_keyboardWillShow:(id)a3
{
  objc_super v4 = [a3 userInfo];
  id v10 = [v4 objectForKey:*MEMORY[0x263F837B8]];

  if (v10)
  {
    id v5 = [(SUUISignInDocumentViewController *)self view];
    [v10 CGRectValue];
    objc_msgSend(v5, "convertRect:fromView:", 0);
    self->_keyboardFrame.origin.x = v6;
    self->_keyboardFrame.origin.y = v7;
    self->_keyboardFrame.size.double width = v8;
    self->_keyboardFrame.size.double height = v9;

    [(SUUISignInDocumentViewController *)self _layoutScrollView];
    [(SUUISignInDocumentViewController *)self _reloadContentSize];
  }
}

- (void)_keyboardWillChangeFrame:(id)a3
{
  objc_super v4 = [a3 userInfo];
  id v10 = [v4 objectForKey:*MEMORY[0x263F837B8]];

  if (v10)
  {
    id v5 = [(SUUISignInDocumentViewController *)self view];
    [v10 CGRectValue];
    objc_msgSend(v5, "convertRect:fromView:", 0);
    self->_keyboardFrame.origin.x = v6;
    self->_keyboardFrame.origin.y = v7;
    self->_keyboardFrame.size.double width = v8;
    self->_keyboardFrame.size.double height = v9;

    [(SUUISignInDocumentViewController *)self _layoutScrollView];
    [(SUUISignInDocumentViewController *)self _reloadContentSize];
  }
}

- (void)_keyboardWillHide:(id)a3
{
  objc_super v4 = [a3 userInfo];
  id v6 = [v4 objectForKey:*MEMORY[0x263F837B8]];

  if (v6)
  {
    CGSize v5 = *(CGSize *)(MEMORY[0x263F001A8] + 16);
    self->_keyboardFrame.origin = (CGPoint)*MEMORY[0x263F001A8];
    self->_keyboardFrame.size = v5;
    [(SUUISignInDocumentViewController *)self _layoutScrollView];
    [(SUUISignInDocumentViewController *)self _reloadContentSize];
  }
}

- (id)_backgroundColor
{
  uint64_t v2 = [(SUUISignInTemplateViewElement *)self->_templateElement style];
  objc_super v3 = [v2 ikBackgroundColor];
  objc_super v4 = [v3 color];

  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    id v5 = [MEMORY[0x263F825C8] whiteColor];
  }
  id v6 = v5;

  return v6;
}

- (id)_layoutContext
{
  layoutContext = self->_layoutContext;
  if (!layoutContext)
  {
    objc_super v4 = objc_alloc_init(SUUIViewElementLayoutContext);
    id v5 = self->_layoutContext;
    self->_layoutContext = v4;

    [(SUUIViewElementLayoutContext *)self->_layoutContext setArtworkRequestDelegate:self];
    id v6 = self->_layoutContext;
    CGFloat v7 = [(SUUIViewController *)self clientContext];
    [(SUUIViewElementLayoutContext *)v6 setClientContext:v7];

    [(SUUIViewElementLayoutContext *)self->_layoutContext setContainerViewElementType:[(SUUISignInTemplateViewElement *)self->_templateElement elementType]];
    [(SUUIViewElementLayoutContext *)self->_layoutContext setParentViewController:self];
    CGFloat v8 = objc_alloc_init(SUUILayoutCache);
    textLayoutCache = self->_textLayoutCache;
    self->_textLayoutCache = v8;

    [(SUUILayoutCache *)self->_textLayoutCache setDelegate:self];
    id v10 = [[SUUIViewElementTextLayoutCache alloc] initWithLayoutCache:self->_textLayoutCache];
    [(SUUIViewElementLayoutContext *)self->_layoutContext setLabelLayoutCache:v10];
    id v11 = [SUUIResourceLoader alloc];
    id v12 = [(SUUIViewController *)self operationQueue];
    id v13 = [(SUUIViewController *)self clientContext];
    id v14 = [(SUUIResourceLoader *)v11 initWithOperationQueue:v12 clientContext:v13];

    [(SUUIViewElementLayoutContext *)self->_layoutContext setResourceLoader:v14];
    layoutContext = self->_layoutContext;
  }
  return layoutContext;
}

- (void)_signInFailed:(id)a3 error:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  CGFloat v7 = [(SUUIViewController *)self clientContext];
  CGFloat v8 = v7;
  CGFloat v9 = (void *)MEMORY[0x263F82418];
  if (v7) {
    [v7 localizedStringForKey:@"CANNOT_LOGIN_TITLE"];
  }
  else {
  id v10 = +[SUUIClientContext localizedStringForKey:@"CANNOT_LOGIN_TITLE" inBundles:0];
  }
  id v11 = [v6 localizedDescription];
  id v12 = [v9 alertControllerWithTitle:v10 message:v11 preferredStyle:1];

  id v13 = (void *)MEMORY[0x263F82400];
  if (v8) {
    [v8 localizedStringForKey:@"OK"];
  }
  else {
  id v14 = +[SUUIClientContext localizedStringForKey:@"OK" inBundles:0];
  }
  id v15 = [v13 actionWithTitle:v14 style:0 handler:0];
  [v12 addAction:v15];

  [(SUUISignInDocumentViewController *)self presentViewController:v12 animated:1 completion:0];
  if (self->_templateElement)
  {
    id v16 = [v6 description];
    v17 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", @"failed", @"result", v18, @"accountName", v16, @"reason", 0);
    [(SUUISignInTemplateViewElement *)self->_templateElement dispatchEventOfType:15 canBubble:1 isCancelable:1 extraInfo:v17 completionBlock:0];
  }
}

- (void)_signInSuccess:(id)a3
{
  if (self->_templateElement)
  {
    objc_super v4 = (objc_class *)NSDictionary;
    id v5 = a3;
    id v6 = [v4 alloc];
    CGFloat v7 = [v5 accountName];

    id v8 = (id)objc_msgSend(v6, "initWithObjectsAndKeys:", @"success", @"result", v7, @"accountName", 0);
    [(SUUISignInTemplateViewElement *)self->_templateElement dispatchEventOfType:15 canBubble:1 isCancelable:1 extraInfo:v8 completionBlock:0];
  }
}

- (void)_layoutScrollView
{
  objc_super v3 = [(SUUISignInDocumentViewController *)self view];
  [v3 frame];
  CGRect v21 = CGRectIntersection(v20, self->_keyboardFrame);
  CGFloat x = v21.origin.x;
  CGFloat y = v21.origin.y;
  CGFloat width = v21.size.width;
  CGFloat height = v21.size.height;

  id v8 = [(SUUISignInDocumentViewController *)self view];
  [v8 bounds];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  v22.origin.CGFloat x = x;
  v22.origin.CGFloat y = y;
  v22.size.CGFloat width = width;
  v22.size.CGFloat height = height;
  double v17 = CGRectGetHeight(v22);
  scrollView = self->_scrollView;
  -[UIScrollView setFrame:](scrollView, "setFrame:", v10, v12, v14, v16 - v17);
}

- (void)_reloadContentSize
{
  [(UIScrollView *)self->_scrollView contentInset];
  double v4 = v3;
  double v6 = v5;
  [(SUUISignInTemplateView *)self->_loginView layoutMargins];
  double v8 = v7;
  double v10 = v9;
  [(UIScrollView *)self->_scrollView bounds];
  double v13 = v11;
  double v14 = 0.0;
  if (self->_keyboardFrame.size.height < 0.00000011920929) {
    double v14 = v6;
  }
  double v15 = v12 - v4 - v14;
  float v16 = v11 - v8 - v10;
  double v17 = floorf(v16);
  double v18 = *MEMORY[0x263F001A8];
  double v19 = *(double *)(MEMORY[0x263F001A8] + 8);
  CGRect v20 = objc_opt_class();
  templateElement = self->_templateElement;
  CGRect v22 = [(SUUISignInDocumentViewController *)self _layoutContext];
  [v20 sizeThatFitsWidth:templateElement viewElement:v22 context:v17];
  double v24 = v23;
  double v26 = v25;

  if (v26 < v15) {
    double v26 = v15;
  }
  if (v24 < v13) {
    double v24 = v13;
  }
  -[SUUISignInTemplateView setFrame:](self->_loginView, "setFrame:", v18, v19, v24, v26);
  scrollView = self->_scrollView;
  -[UIScrollView setContentSize:](scrollView, "setContentSize:", v24, v26);
}

- (void)_reloadPanelViewWithScrollViewSize:(CGSize)a3
{
  double width = a3.width;
  if (self->_loginView) {
    BOOL v4 = a3.width <= 0.00000011920929;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4)
  {
    id v13 = [(SUUISignInDocumentViewController *)self _layoutContext];
    double v6 = [(SUUISignInTemplateView *)self->_loginView tintColor];
    [v13 setTintColor:v6];

    [(id)objc_opt_class() prefetchResourcesForViewElement:self->_templateElement reason:1 context:v13];
    [(SUUISignInTemplateView *)self->_loginView layoutMargins];
    double v8 = v7;
    double v10 = v9;
    [(SUUISignInTemplateView *)self->_loginView setLayoutMargins:0.0];
    float v11 = width - v8 - v10;
    double v12 = floorf(v11);
    [(id)objc_opt_class() requestLayoutForViewElement:self->_templateElement width:v13 context:v12];
    [(SUUILayoutCache *)self->_textLayoutCache commitLayoutRequests];
    [(SUUISignInTemplateView *)self->_loginView reloadWithViewElement:self->_templateElement width:v13 context:v12];
    [(SUUISignInDocumentViewController *)self _reloadContentSize];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textLayoutCache, 0);
  objc_storeStrong((id *)&self->_templateElement, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_loginView, 0);
  objc_storeStrong((id *)&self->_layoutContext, 0);
}

@end
@interface SKUICommentDocumentViewController
- (BOOL)_loadImageForURL:(id)a3 cacheKey:(id)a4 dataConsumer:(id)a5 reason:(int64_t)a6;
- (SKUICommentDocumentViewController)initWithTemplateElement:(id)a3;
- (id)_backgroundColor;
- (id)_getSelectedCommenter;
- (id)_layoutContext;
- (void)_changeCommenter;
- (void)_checkAdminStatus;
- (void)_keyboardDidHideChangeNotification:(id)a3;
- (void)_keyboardWillChangeNotification:(id)a3 accountForGuideLines:(BOOL)a4 applyKeyboardOffset:(BOOL)a5;
- (void)_keyboardWillHideNotification:(id)a3;
- (void)_keyboardWillShowNotification:(id)a3;
- (void)_layoutKeyboard;
- (void)_layoutScrollView:(double)a3;
- (void)_preloadCommenterImages;
- (void)_reloadContentSize:(double)a3;
- (void)_setSelectedCommenter:(int64_t)a3;
- (void)commentPostBarView:(id)a3 text:(id)a4 as:(id)a5;
- (void)dealloc;
- (void)documentDidUpdate:(id)a3;
- (void)loadView;
- (void)updateStackElement:(id)a3 withView:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation SKUICommentDocumentViewController

- (SKUICommentDocumentViewController)initWithTemplateElement:(id)a3
{
  id v5 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v6 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v6) {
        -[SKUICommentDocumentViewController initWithTemplateElement:](v6, v7, v8, v9, v10, v11, v12, v13);
      }
    }
  }
  v23.receiver = self;
  v23.super_class = (Class)SKUICommentDocumentViewController;
  v14 = [(SKUICommentDocumentViewController *)&v23 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_templateElement, a3);
    v15->_scrollNewCommentToView = [(SKUICommentTemplateViewElement *)v15->_templateElement scrollNewCommentToView];
    uint64_t v16 = [v5 firstChildForElementType:132];
    stackTemplateElement = v15->_stackTemplateElement;
    v15->_stackTemplateElement = (SKUIStackTemplateElement *)v16;

    [(SKUICommentDocumentViewController *)v15 setAutomaticallyAdjustsScrollViewInsets:0];
    v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v18 addObserver:v15 selector:sel__keyboardWillChangeFrameNotification_ name:*MEMORY[0x1E4FB2C48] object:0];
    [v18 addObserver:v15 selector:sel__keyboardDidHideChangeNotification_ name:*MEMORY[0x1E4FB2BC0] object:0];
    [v18 addObserver:v15 selector:sel__keyboardWillHideNotification_ name:*MEMORY[0x1E4FB2C50] object:0];
    [v18 addObserver:v15 selector:sel__keyboardWillShowNotification_ name:*MEMORY[0x1E4FB2C58] object:0];
    v19 = +[SKUIMediaSocialProfileCoordinator sharedCoordinator];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __61__SKUICommentDocumentViewController_initWithTemplateElement___block_invoke;
    v21[3] = &unk_1E64298D8;
    v22 = v15;
    [v19 getProfileWithOptions:0 profileBlock:v21];
  }
  return v15;
}

void __61__SKUICommentDocumentViewController_initWithTemplateElement___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = a2;
    v4 = objc_alloc_init(SKUIMediaSocialAuthor);
    uint64_t v5 = *(void *)(a1 + 32);
    BOOL v6 = *(void **)(v5 + 1048);
    *(void *)(v5 + 1048) = v4;

    uint64_t v7 = *(void **)(*(void *)(a1 + 32) + 1048);
    uint64_t v8 = [v3 profileType];
    [v7 setAuthorType:v8];

    uint64_t v9 = *(void **)(*(void *)(a1 + 32) + 1048);
    uint64_t v10 = [v3 identifier];
    [v9 setIdentifier:v10];

    uint64_t v11 = *(void **)(*(void *)(a1 + 32) + 1048);
    uint64_t v12 = [v3 name];
    [v11 setName:v12];

    uint64_t v13 = *(void **)(*(void *)(a1 + 32) + 1048);
    id v14 = [v3 profileImageURL];

    [v13 setThumbnailImageURL:v14];
  }
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB2C48] object:0];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB2C58] object:0];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB2C50] object:0];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB2BC0] object:0];
  [(SKUIViewElementLayoutContext *)self->_layoutContext setArtworkRequestDelegate:0];
  [(SKUIViewElementLayoutContext *)self->_layoutContext setParentViewController:0];
  [(SKUILayoutCache *)self->_textLayoutCache setDelegate:0];

  v4.receiver = self;
  v4.super_class = (Class)SKUICommentDocumentViewController;
  [(SKUIViewController *)&v4 dealloc];
}

- (void)loadView
{
  id v3 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  stackTemplateElement = self->_stackTemplateElement;
  id v15 = v3;
  if (stackTemplateElement)
  {
    [(SKUICommentDocumentViewController *)self updateStackElement:stackTemplateElement withView:v3];
    id v3 = v15;
  }
  if (!self->_postView)
  {
    uint64_t v5 = [SKUICommentPostBarView alloc];
    BOOL v6 = -[SKUICommentPostBarView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    postView = self->_postView;
    self->_postView = v6;

    [(SKUICommentPostBarView *)self->_postView setDelegate:self];
    uint64_t v8 = self->_postView;
    uint64_t v9 = [(SKUICommentTemplateViewElement *)self->_templateElement postButtonText];
    [(SKUICommentPostBarView *)v8 setPostButtonText:v9];

    uint64_t v10 = self->_postView;
    uint64_t v11 = [(SKUICommentTemplateViewElement *)self->_templateElement postPlaceholderText];
    [(SKUICommentPostBarView *)v10 setPlaceholderText:v11];

    [(SKUICommentPostBarView *)self->_postView setPostButtonVisible:0];
    uint64_t v12 = [(SKUICommentTemplateViewElement *)self->_templateElement asText];

    if (v12)
    {
      uint64_t v13 = self->_postView;
      id v14 = [(SKUICommentTemplateViewElement *)self->_templateElement asText];
      [(SKUICommentPostBarView *)v13 setAsText:v14];
    }
    [v15 addSubview:self->_postView];
    id v3 = v15;
  }
  [(SKUICommentDocumentViewController *)self setView:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  templateElement = self->_templateElement;
  if (templateElement
    && [(SKUICommentTemplateViewElement *)templateElement showKeyboard]
    && !self->_didShowKeyboard)
  {
    [(SKUICommentPostBarView *)self->_postView becomeFirstResponder];
    self->_didShowKeyboard = 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)SKUICommentDocumentViewController;
  [(SKUICommentDocumentViewController *)&v6 viewDidAppear:v3];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  [(SKUICommentDocumentViewController *)self _layoutScrollView:0.0];
  v5.receiver = self;
  v5.super_class = (Class)SKUICommentDocumentViewController;
  [(SKUIViewController *)&v5 viewWillAppear:v3];
  [(SKUICommentDocumentViewController *)self _checkAdminStatus];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [(SKUIStackDocumentViewController *)self->_childViewController view];
  [v5 resignFirstResponder];
  v6.receiver = self;
  v6.super_class = (Class)SKUICommentDocumentViewController;
  [(SKUICommentDocumentViewController *)&v6 viewWillDisappear:v3];
}

- (void)viewWillLayoutSubviews
{
  [(SKUICommentDocumentViewController *)self _layoutScrollView:0.0];
  if (!self->_keyboardVisible)
  {
    [(SKUICommentDocumentViewController *)self _layoutKeyboard];
    [(SKUICommentDocumentViewController *)self _reloadContentSize:0.0];
  }
  v3.receiver = self;
  v3.super_class = (Class)SKUICommentDocumentViewController;
  [(SKUICommentDocumentViewController *)&v3 viewWillLayoutSubviews];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v8.receiver = self;
  v8.super_class = (Class)SKUICommentDocumentViewController;
  id v7 = a4;
  -[SKUICommentDocumentViewController viewWillTransitionToSize:withTransitionCoordinator:](&v8, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  -[SKUIStackDocumentViewController viewWillTransitionToSize:withTransitionCoordinator:](self->_childViewController, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height, v8.receiver, v8.super_class);
}

- (void)documentDidUpdate:(id)a3
{
  id v9 = a3;
  objc_super v4 = [v9 templateElement];
  templateElement = self->_templateElement;
  self->_templateElement = v4;

  objc_super v6 = [(SKUIViewElement *)self->_templateElement firstChildForElementType:132];
  childViewController = self->_childViewController;
  if (childViewController)
  {
    [(SKUIStackDocumentViewController *)childViewController documentDidUpdate:v9 withTemplate:v6];
  }
  else
  {
    objc_super v8 = [(SKUICommentDocumentViewController *)self view];
    [(SKUICommentDocumentViewController *)self updateStackElement:v6 withView:v8];

    [(SKUICommentDocumentViewController *)self _reloadContentSize:0.0];
  }
}

- (void)updateStackElement:(id)a3 withView:(id)a4
{
  id v18 = a3;
  objc_storeStrong((id *)&self->_stackTemplateElement, a3);
  id v7 = a4;
  childViewController = self->_childViewController;
  if (childViewController)
  {
    id v9 = [(SKUIStackDocumentViewController *)childViewController view];
    [v9 removeFromSuperview];

    [(SKUIStackDocumentViewController *)self->_childViewController removeFromParentViewController];
  }
  uint64_t v10 = [[SKUIStackDocumentViewController alloc] initWithTemplateElement:self->_stackTemplateElement layoutStyle:0];
  uint64_t v11 = self->_childViewController;
  self->_childViewController = v10;

  uint64_t v12 = self->_childViewController;
  uint64_t v13 = [(SKUIViewController *)self clientContext];
  [(SKUIViewController *)v12 setClientContext:v13];

  id v14 = self->_childViewController;
  id v15 = [(SKUIViewController *)self operationQueue];
  [(SKUIViewController *)v14 setOperationQueue:v15];

  uint64_t v16 = [(SKUIStackDocumentViewController *)self->_childViewController view];
  [v16 setAutoresizingMask:18];
  v17 = [(SKUICommentDocumentViewController *)self _backgroundColor];
  [v16 setBackgroundColor:v17];

  [v7 bounds];
  objc_msgSend(v16, "setFrame:");
  [(SKUICommentDocumentViewController *)self addChildViewController:self->_childViewController];
  [(SKUIStackDocumentViewController *)self->_childViewController didMoveToParentViewController:self];
  [v7 addSubview:v16];
  [v7 sendSubviewToBack:v16];
}

- (void)commentPostBarView:(id)a3 text:(id)a4 as:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  if (self->_templateElement)
  {
    id v9 = [(SKUICommentDocumentViewController *)self _getSelectedCommenter];
    uint64_t v10 = [(SKUICommentDocumentViewController *)self _getSelectedCommenter];
    uint64_t v11 = [v10 identifier];

    int v12 = [v9 isAttributed];
    uint64_t v13 = (void *)MEMORY[0x1E4F1CC28];
    if (v12) {
      uint64_t v13 = (void *)MEMORY[0x1E4F1CC38];
    }
    id v14 = v13;
    id v15 = [v9 authorType];
    if (v15)
    {
      uint64_t v16 = [v9 authorType];
    }
    else
    {
      uint64_t v16 = &stru_1F1C879E8;
    }

    v17 = objc_opt_new();
    [v17 setObject:@"post" forKey:@"type"];
    if (v8) {
      [v17 setObject:v8 forKey:@"comment"];
    }
    if (v11) {
      [v17 setObject:v11 forKey:@"commenter"];
    }
    [v17 setObject:v14 forKey:@"isAttributed"];
    [v17 setObject:v16 forKey:@"authorType"];
    templateElement = self->_templateElement;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __64__SKUICommentDocumentViewController_commentPostBarView_text_as___block_invoke;
    v19[3] = &unk_1E6424E80;
    id v20 = v7;
    [(SKUICommentTemplateViewElement *)templateElement dispatchEventOfType:15 canBubble:1 isCancelable:1 extraInfo:v17 completionBlock:v19];
  }
}

void __64__SKUICommentDocumentViewController_commentPostBarView_text_as___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__SKUICommentDocumentViewController_commentPostBarView_text_as___block_invoke_2;
  block[3] = &unk_1E6422020;
  id v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __64__SKUICommentDocumentViewController_commentPostBarView_text_as___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setText:&stru_1F1C879E8];
  id v2 = *(void **)(a1 + 32);

  return [v2 resignFirstResponder];
}

- (void)_keyboardWillShowNotification:(id)a3
{
  self->_keyboardVisible = 1;
  int64_t selectedCommenter = self->_selectedCommenter;
  id v5 = a3;
  [(SKUICommentDocumentViewController *)self _setSelectedCommenter:selectedCommenter];
  [(SKUICommentPostBarView *)self->_postView setPostButtonVisible:1];
  [(SKUICommentDocumentViewController *)self _layoutKeyboard];
  [(SKUICommentDocumentViewController *)self _keyboardWillChangeNotification:v5 accountForGuideLines:0 applyKeyboardOffset:1];
}

- (void)_keyboardWillHideNotification:(id)a3
{
  postView = self->_postView;
  id v5 = a3;
  [(SKUICommentPostBarView *)postView setCommenter:0];
  [(SKUICommentPostBarView *)self->_postView setPostButtonVisible:0];
  [(SKUICommentDocumentViewController *)self _layoutKeyboard];
  [(SKUICommentDocumentViewController *)self _keyboardWillChangeNotification:v5 accountForGuideLines:1 applyKeyboardOffset:0];
}

- (void)_keyboardDidHideChangeNotification:(id)a3
{
  id v4 = a3;
  self->_keyboardVisible = 0;
  if (self->_scrollNewCommentToView)
  {
    id v15 = v4;
    id v5 = [(SKUIStackDocumentViewController *)self->_childViewController sectionsViewController];
    objc_super v6 = [v5 collectionView];

    [v6 contentSize];
    double v8 = v7;
    id v9 = [(SKUICommentDocumentViewController *)self view];
    [v9 bounds];
    double v11 = v10;

    if (v8 >= v11)
    {
      [v6 contentInset];
      double v13 = v12;
      [v6 bounds];
      objc_msgSend(v6, "setContentOffset:animated:", 1, 0.0, v13 + v8 - v14);
    }

    id v4 = v15;
  }
}

- (void)_keyboardWillChangeNotification:(id)a3 accountForGuideLines:(BOOL)a4 applyKeyboardOffset:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v38 = [a3 userInfo];
  double v8 = [v38 objectForKey:*MEMORY[0x1E4FB2BD8]];
  id v9 = v8;
  if (v8)
  {
    [v8 CGRectValue];
    self->_keyboardRect.origin.x = v10;
    self->_keyboardRect.origin.double y = v11;
    self->_keyboardRect.size.double width = v12;
    self->_keyboardRect.size.double height = v13;
    double v14 = [v38 objectForKey:*MEMORY[0x1E4FB2BA8]];
    [v14 doubleValue];
    double v16 = v15;

    v17 = [v38 objectForKey:*MEMORY[0x1E4FB2BA0]];
    uint64_t v18 = [v17 unsignedIntegerValue];

    [MEMORY[0x1E4FB1EB0] beginAnimations:0 context:0];
    [MEMORY[0x1E4FB1EB0] setAnimationCurve:v18];
    [MEMORY[0x1E4FB1EB0] setAnimationDuration:v16];
    [(SKUICommentPostBarView *)self->_postView frame];
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
    double y = self->_keyboardRect.origin.y;
    [(SKUICommentPostBarView *)self->_postView bounds];
    if (v6)
    {
      uint64_t v27 = [(SKUICommentDocumentViewController *)self presentingViewController];
      v28 = (void *)v27;
      if (v27) {
        v29 = (SKUICommentDocumentViewController *)v27;
      }
      else {
        v29 = self;
      }
      v30 = v29;

      v31 = [(SKUICommentDocumentViewController *)self view];
      [v31 bounds];
      double v33 = v32 - v24;
      v34 = [(SKUICommentDocumentViewController *)v30 bottomLayoutGuide];

      [v34 length];
      double v36 = v33 - v35;
    }
    else
    {
      double v36 = y - v26;
    }
    -[SKUICommentPostBarView setFrame:](self->_postView, "setFrame:", v20, v36, v22, v24);
    [MEMORY[0x1E4FB1EB0] commitAnimations];
    double height = 0.0;
    if (v5) {
      double height = self->_keyboardRect.size.height;
    }
    [(SKUICommentDocumentViewController *)self _reloadContentSize:height];
  }
}

- (id)_backgroundColor
{
  id v2 = [(SKUICommentTemplateViewElement *)self->_templateElement style];
  objc_super v3 = [v2 ikBackgroundColor];
  id v4 = [v3 color];

  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    id v5 = [MEMORY[0x1E4FB1618] whiteColor];
  }
  BOOL v6 = v5;

  return v6;
}

- (void)_changeCommenter
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  objc_super v3 = (void *)MEMORY[0x1E4FB1418];
  id v4 = [(SKUIViewController *)self clientContext];
  double v26 = [v3 alertControllerWithTitle:0 message:0 preferredStyle:SKUIUserInterfaceIdiom(v4) == 1];

  [v26 setModalPresentationStyle:7];
  double v24 = [(SKUICommentTemplateViewElement *)self->_templateElement commentAsText];
  double v23 = [[SKUICommentHeaderViewController alloc] initWithTitle:v24];
  double v22 = objc_msgSend(MEMORY[0x1E4FB1410], "_actionWithContentViewController:style:");
  objc_msgSend(v26, "addAction:");
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  obj = self->_commenters;
  uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(obj);
        }
        CGFloat v10 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        if ([v10 isMySelf])
        {
          CGFloat v11 = NSString;
          CGFloat v12 = [v10 name];
          CGFloat v13 = [(SKUICommentTemplateViewElement *)self->_templateElement myselfText];
          double v14 = [v11 stringWithFormat:@"%@ (%@)", v12, v13];
        }
        else
        {
          if ([v10 isAttributed]) {
            [v10 attributedName];
          }
          else {
          double v14 = [v10 name];
          }
        }
        double v15 = [v10 thumbnailImage];
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __53__SKUICommentDocumentViewController__changeCommenter__block_invoke;
        v27[3] = &unk_1E6425BA0;
        v27[4] = self;
        double v16 = +[SKUICommenterAction _actionWithTitle:v14 image:v15 style:0 handler:v27 shouldDismissHandler:&__block_literal_global_50];
        [v16 setIndex:v7 + i];
        [v16 _setChecked:v7 + i == self->_selectedCommenter];
        [v16 _setTitleTextAlignment:4];
        v17 = [MEMORY[0x1E4FB1618] colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
        [v16 _setTitleTextColor:v17];

        [v26 addAction:v16];
      }
      uint64_t v6 = [(NSArray *)obj countByEnumeratingWithState:&v28 objects:v32 count:16];
      v7 += i;
    }
    while (v6);
  }

  uint64_t v18 = (void *)MEMORY[0x1E4FB1410];
  double v19 = [MEMORY[0x1E4F28B50] mainBundle];
  double v20 = [v19 localizedStringForKey:@"CANCEL" value:&stru_1F1C879E8 table:0];
  double v21 = [v18 actionWithTitle:v20 style:1 handler:&__block_literal_global_67];

  if (v21) {
    [v26 addAction:v21];
  }
  [(SKUICommentDocumentViewController *)self presentViewController:v26 animated:1 completion:0];
}

void __53__SKUICommentDocumentViewController__changeCommenter__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    *(void *)(*(void *)(a1 + 32) + 1144) = [v3 index];
    [*(id *)(a1 + 32) _setSelectedCommenter:*(void *)(*(void *)(a1 + 32) + 1144)];
  }
}

uint64_t __53__SKUICommentDocumentViewController__changeCommenter__block_invoke_2()
{
  return 1;
}

- (void)_checkAdminStatus
{
  id v3 = [MEMORY[0x1E4FA8340] sharedCoordinator];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __54__SKUICommentDocumentViewController__checkAdminStatus__block_invoke;
  v4[3] = &unk_1E64253F8;
  v4[4] = self;
  [v3 getAdminStatusAndWaitWithOptions:0 resultBlock:v4];
}

void __54__SKUICommentDocumentViewController__checkAdminStatus__block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = +[SKUIMediaSocialAdminPermissionsCoordinator sharedCoordinator];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __54__SKUICommentDocumentViewController__checkAdminStatus__block_invoke_2;
    v4[3] = &unk_1E6429920;
    v4[4] = *(void *)(a1 + 32);
    [v3 getAuthorsAndWaitWithOptions:0 authorsBlock:v4];
  }
}

void __54__SKUICommentDocumentViewController__checkAdminStatus__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__SKUICommentDocumentViewController__checkAdminStatus__block_invoke_3;
  v5[3] = &unk_1E6421FF8;
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

void __54__SKUICommentDocumentViewController__checkAdminStatus__block_invoke_3(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v2 = objc_opt_new();
  uint64_t v32 = a1;
  if (*(void *)(*(void *)(a1 + 32) + 1048))
  {
    id v3 = [[SKUICommenter alloc] initWithAuthor:*(void *)(*(void *)(a1 + 32) + 1048)];
    [(SKUICommenter *)v3 setIsMySelf:1];
    [v2 addObject:v3];

    a1 = v32;
  }
  id v4 = *(void **)(a1 + 40);
  if (v4)
  {
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id obj = v4;
    uint64_t v5 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v36;
      uint64_t v8 = @"commentAsEntity";
      id v9 = @"commentWithAttribution";
      do
      {
        uint64_t v10 = 0;
        uint64_t v33 = v6;
        do
        {
          if (*(void *)v36 != v7) {
            objc_enumerationMutation(obj);
          }
          CGFloat v11 = *(void **)(*((void *)&v35 + 1) + 8 * v10);
          CGFloat v12 = [v11 permissions];
          int v13 = [v12 containsObject:v8];

          if (v13)
          {
            double v14 = [[SKUICommenter alloc] initWithAuthor:v11];
            [v2 addObject:v14];
          }
          double v15 = [v11 permissions];
          int v16 = [v15 containsObject:v9];

          if (v16)
          {
            v17 = v9;
            uint64_t v18 = v8;
            uint64_t v19 = v7;
            double v20 = v2;
            double v21 = [[SKUICommenter alloc] initWithAuthor:v11];
            [(SKUICommenter *)v21 setIsAttributed:1];
            double v22 = [*(id *)(a1 + 32) clientContext];
            double v23 = v22;
            if (v22) {
              [v22 localizedStringForKey:@"ATTRIBUTION_PERSON_%@_FROM_GROUP_%@"];
            }
            else {
            double v24 = +[SKUIClientContext localizedStringForKey:@"ATTRIBUTION_PERSON_%@_FROM_GROUP_%@" inBundles:0];
            }

            v25 = NSString;
            double v26 = [*(id *)(*(void *)(a1 + 32) + 1048) name];
            uint64_t v27 = [v11 name];
            long long v28 = [v25 stringWithValidatedFormat:v24, @"%@%@", 0, v26, v27 validFormatSpecifiers error];

            a1 = v32;
            [(SKUICommenter *)v21 setAttributedName:v28];
            [v20 addObject:v21];

            id v2 = v20;
            uint64_t v7 = v19;
            uint64_t v8 = v18;
            id v9 = v17;
            uint64_t v6 = v33;
          }
          ++v10;
        }
        while (v6 != v10);
        uint64_t v6 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
      }
      while (v6);
    }
  }
  uint64_t v29 = *(void *)(a1 + 32);
  long long v30 = *(void **)(v29 + 1064);
  *(void *)(v29 + 1064) = v2;
  id v31 = v2;

  [*(id *)(a1 + 32) _preloadCommenterImages];
}

- (id)_getSelectedCommenter
{
  id v3 = [(NSArray *)self->_commenters count];
  if (v3)
  {
    unint64_t selectedCommenter = self->_selectedCommenter;
    if (selectedCommenter >= [(NSArray *)self->_commenters count])
    {
      id v3 = 0;
    }
    else
    {
      id v3 = [(NSArray *)self->_commenters objectAtIndex:self->_selectedCommenter];
    }
  }

  return v3;
}

- (id)_layoutContext
{
  layoutContext = self->_layoutContext;
  if (!layoutContext)
  {
    id v4 = objc_alloc_init(SKUIViewElementLayoutContext);
    uint64_t v5 = self->_layoutContext;
    self->_layoutContext = v4;

    [(SKUIViewElementLayoutContext *)self->_layoutContext setArtworkRequestDelegate:self];
    uint64_t v6 = self->_layoutContext;
    uint64_t v7 = [(SKUIViewController *)self clientContext];
    [(SKUIViewElementLayoutContext *)v6 setClientContext:v7];

    [(SKUIViewElementLayoutContext *)self->_layoutContext setContainerViewElementType:[(SKUICommentTemplateViewElement *)self->_templateElement elementType]];
    [(SKUIViewElementLayoutContext *)self->_layoutContext setParentViewController:self];
    uint64_t v8 = objc_alloc_init(SKUILayoutCache);
    textLayoutCache = self->_textLayoutCache;
    self->_textLayoutCache = v8;

    [(SKUILayoutCache *)self->_textLayoutCache setDelegate:self];
    uint64_t v10 = [[SKUIViewElementTextLayoutCache alloc] initWithLayoutCache:self->_textLayoutCache];
    [(SKUIViewElementLayoutContext *)self->_layoutContext setLabelLayoutCache:v10];
    CGFloat v11 = [SKUIResourceLoader alloc];
    CGFloat v12 = [(SKUIViewController *)self operationQueue];
    int v13 = [(SKUIViewController *)self clientContext];
    double v14 = [(SKUIResourceLoader *)v11 initWithOperationQueue:v12 clientContext:v13];

    [(SKUIViewElementLayoutContext *)self->_layoutContext setResourceLoader:v14];
    layoutContext = self->_layoutContext;
  }

  return layoutContext;
}

- (void)_layoutScrollView:(double)a3
{
  uint64_t v5 = [(SKUICommentDocumentViewController *)self view];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  id v14 = [(SKUIStackDocumentViewController *)self->_childViewController view];
  objc_msgSend(v14, "setFrame:", v7, v9, v11, v13 - a3);
}

- (void)_layoutKeyboard
{
  uint64_t v3 = [(SKUICommentDocumentViewController *)self presentingViewController];
  id v4 = (void *)v3;
  if (v3) {
    uint64_t v5 = (SKUICommentDocumentViewController *)v3;
  }
  else {
    uint64_t v5 = self;
  }
  double v6 = v5;

  postView = self->_postView;
  double v8 = [(SKUICommentDocumentViewController *)self view];
  [v8 bounds];
  -[SKUICommentPostBarView sizeThatFits:](postView, "sizeThatFits:", v9, v10);
  double v12 = v11;
  double v14 = v13;

  double v15 = [(SKUICommentDocumentViewController *)self view];
  [v15 bounds];
  double v17 = v16 - v14;
  uint64_t v18 = [(SKUICommentDocumentViewController *)v6 bottomLayoutGuide];
  [v18 length];
  double v20 = v17 - v19;

  double v21 = self->_postView;

  -[SKUICommentPostBarView setFrame:](v21, "setFrame:", 0.0, v20, v12, v14);
}

- (BOOL)_loadImageForURL:(id)a3 cacheKey:(id)a4 dataConsumer:(id)a5 reason:(int64_t)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  double v13 = [(SKUICommentDocumentViewController *)self _layoutContext];
  double v14 = [v13 resourceLoader];

  double v15 = objc_alloc_init(SKUIArtworkRequest);
  [(SKUIResourceRequest *)v15 setCacheKey:v11];

  [(SKUIArtworkRequest *)v15 setDataConsumer:v10];
  [(SKUIArtworkRequest *)v15 setURL:v12];

  LOBYTE(a6) = [v14 loadResourceWithRequest:v15 reason:a6];
  return a6;
}

- (void)_preloadCommenterImages
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v3 = self->_commenters;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(v3);
        }
        double v7 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        double v8 = [v7 thumbnailImageURL];

        if (v8)
        {
          double v9 = objc_alloc_init(SKUICommentImageDataConsumer);
          -[SKUIStyledImageDataConsumer setImageSize:](v9, "setImageSize:", 25.0, 25.0);
          objc_initWeak(&location, v7);
          v12[0] = MEMORY[0x1E4F143A8];
          v12[1] = 3221225472;
          v12[2] = __60__SKUICommentDocumentViewController__preloadCommenterImages__block_invoke;
          v12[3] = &unk_1E6424128;
          objc_copyWeak(&v13, &location);
          [(SKUICommentImageDataConsumer *)v9 setCompletionBlock:v12];
          id v10 = [v7 thumbnailImageURL];
          id v11 = [v7 thumbnailImageURL];
          [(SKUICommentDocumentViewController *)self _loadImageForURL:v10 cacheKey:v11 dataConsumer:v9 reason:1];

          objc_destroyWeak(&v13);
          objc_destroyWeak(&location);
        }
      }
      uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v4);
  }
}

void __60__SKUICommentDocumentViewController__preloadCommenterImages__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained setThumbnailImage:v5];
  }
}

- (void)_reloadContentSize:(double)a3
{
  id v5 = [(SKUIStackDocumentViewController *)self->_childViewController sectionsViewController];
  id v24 = [v5 collectionView];

  double v6 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v7 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  double v8 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  double v9 = [(SKUICommentDocumentViewController *)self topLayoutGuide];
  [v9 length];
  double v11 = v10;

  if (a3 <= 0.0)
  {
    uint64_t v12 = [(SKUICommentDocumentViewController *)self presentingViewController];
    id v13 = (void *)v12;
    if (v12) {
      double v14 = (SKUICommentDocumentViewController *)v12;
    }
    else {
      double v14 = self;
    }
    long long v15 = v14;

    long long v16 = [(SKUICommentDocumentViewController *)v15 bottomLayoutGuide];

    [v16 length];
    a3 = v17;
  }
  else
  {
    [v24 contentOffset];
    objc_msgSend(v24, "setContentOffset:");
  }
  postView = self->_postView;
  double v19 = [(SKUICommentDocumentViewController *)self view];
  [v19 bounds];
  -[SKUICommentPostBarView sizeThatFits:](postView, "sizeThatFits:", v20, v21);
  double v23 = v7 + a3 + v22;

  objc_msgSend(v24, "setContentInset:", v11, v6, v23, v8);
}

- (void)_setSelectedCommenter:(int64_t)a3
{
  if ([(NSArray *)self->_commenters count]
    && (unint64_t selectedCommenter = self->_selectedCommenter, selectedCommenter < [(NSArray *)self->_commenters count]))
  {
    if (a3
      || ([(SKUICommentTemplateViewElement *)self->_templateElement myselfText],
          double v8 = objc_claimAutoreleasedReturnValue(),
          v8,
          !v8))
    {
      double v6 = [(NSArray *)self->_commenters objectAtIndex:self->_selectedCommenter];
      if ([v6 isAttributed]) {
        [v6 attributedName];
      }
      else {
      id v10 = [v6 name];
      }
    }
    else
    {
      id v10 = [(SKUICommentTemplateViewElement *)self->_templateElement myselfText];
    }
    postView = self->_postView;
    if (self->_keyboardVisible)
    {
      [(SKUICommentPostBarView *)postView setCommenter:v10];
    }
    else
    {
      [(SKUICommentPostBarView *)postView setCommenter:0];
      [(SKUICommentDocumentViewController *)self _layoutKeyboard];
    }
  }
  else
  {
    double v7 = self->_postView;
    [(SKUICommentPostBarView *)v7 setCommenter:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textLayoutCache, 0);
  objc_storeStrong((id *)&self->_templateElement, 0);
  objc_storeStrong((id *)&self->_stackTemplateElement, 0);
  objc_storeStrong((id *)&self->_postView, 0);
  objc_storeStrong((id *)&self->_observedArtworkRequestIDs, 0);
  objc_storeStrong((id *)&self->_layoutContext, 0);
  objc_storeStrong((id *)&self->_commenters, 0);
  objc_storeStrong((id *)&self->_childViewController, 0);

  objc_storeStrong((id *)&self->_authorForActiveAccount, 0);
}

- (void)initWithTemplateElement:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end
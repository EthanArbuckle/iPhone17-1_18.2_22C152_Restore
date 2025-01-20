@interface SKUIEditorDocumentViewController
- (SKUIEditorDocumentViewController)initWithTemplateElement:(id)a3;
- (id)_backgroundColor;
- (id)_layoutContext;
- (id)_locateFirstButtonWithType:(int64_t)a3 inChildrenOfElement:(id)a4;
- (void)_authenticateOnCompletion:(id)a3;
- (void)_doneButtonAction;
- (void)_keyboardWillChangeFrame:(id)a3;
- (void)_keyboardWillHide:(id)a3;
- (void)_keyboardWillShow:(id)a3;
- (void)_layoutEditorView;
- (void)_layoutNavigation;
- (void)_resetButtonAction;
- (void)_resetTextView;
- (void)_sendCancelEventAndDismiss;
- (void)_sendDoneEventAndDismissWithText:(id)a3;
- (void)_updateBiographyWithText:(id)a3 onCompletion:(id)a4;
- (void)_updateEditorViewInset;
- (void)dealloc;
- (void)didChangeTextInEditorTemplateView:(id)a3;
- (void)documentDidUpdate:(id)a3;
- (void)loadView;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation SKUIEditorDocumentViewController

- (SKUIEditorDocumentViewController)initWithTemplateElement:(id)a3
{
  id v5 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIEditorDocumentViewController initWithTemplateElement:]();
  }
  v10.receiver = self;
  v10.super_class = (Class)SKUIEditorDocumentViewController;
  v6 = [(SKUIEditorDocumentViewController *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_templateElement, a3);
    v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 addObserver:v7 selector:sel__keyboardWillShow_ name:*MEMORY[0x1E4FB2C58] object:0];
    [v8 addObserver:v7 selector:sel__keyboardWillChangeFrame_ name:*MEMORY[0x1E4FB2C48] object:0];
    [v8 addObserver:v7 selector:sel__keyboardWillHide_ name:*MEMORY[0x1E4FB2C50] object:0];
  }
  return v7;
}

- (void)dealloc
{
  [(SKUIViewElementLayoutContext *)self->_layoutContext setParentViewController:0];
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB2C58] object:0];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB2C48] object:0];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB2C50] object:0];

  v4.receiver = self;
  v4.super_class = (Class)SKUIEditorDocumentViewController;
  [(SKUIViewController *)&v4 dealloc];
}

- (void)_doneButtonAction
{
  v3 = [(SKUIEditorTemplateView *)self->_editorView text];
  [(SKUIEditorTemplateView *)self->_editorView setDisabled:1];
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__SKUIEditorDocumentViewController__doneButtonAction__block_invoke;
  v5[3] = &unk_1E64287B0;
  objc_copyWeak(&v8, &location);
  id v4 = v3;
  id v6 = v4;
  v7 = self;
  [(SKUIEditorDocumentViewController *)self _updateBiographyWithText:v4 onCompletion:v5];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __53__SKUIEditorDocumentViewController__doneButtonAction__block_invoke(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = WeakRetained;
  if (a2) {
    [WeakRetained _sendDoneEventAndDismissWithText:*(void *)(a1 + 32)];
  }
  else {
    [*(id *)(*(void *)(a1 + 40) + 1056) setDisabled:0];
  }
}

- (void)_keyboardWillShow:(id)a3
{
  id v4 = [a3 userInfo];
  id v10 = [v4 objectForKey:*MEMORY[0x1E4FB2BD8]];

  if (v10)
  {
    id v5 = [(SKUIEditorDocumentViewController *)self view];
    [v10 CGRectValue];
    objc_msgSend(v5, "convertRect:fromView:", 0);
    self->_keyboardFrame.origin.x = v6;
    self->_keyboardFrame.origin.y = v7;
    self->_keyboardFrame.size.width = v8;
    self->_keyboardFrame.size.height = v9;

    [(SKUIEditorDocumentViewController *)self _updateEditorViewInset];
  }
}

- (void)_keyboardWillChangeFrame:(id)a3
{
  id v4 = [a3 userInfo];
  id v10 = [v4 objectForKey:*MEMORY[0x1E4FB2BD8]];

  if (v10)
  {
    id v5 = [(SKUIEditorDocumentViewController *)self view];
    [v10 CGRectValue];
    objc_msgSend(v5, "convertRect:fromView:", 0);
    self->_keyboardFrame.origin.x = v6;
    self->_keyboardFrame.origin.y = v7;
    self->_keyboardFrame.size.width = v8;
    self->_keyboardFrame.size.height = v9;

    [(SKUIEditorDocumentViewController *)self _updateEditorViewInset];
  }
}

- (void)_keyboardWillHide:(id)a3
{
  id v4 = [a3 userInfo];
  id v6 = [v4 objectForKey:*MEMORY[0x1E4FB2BD8]];

  if (v6)
  {
    CGSize v5 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
    self->_keyboardFrame.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
    self->_keyboardFrame.size = v5;
    [(SKUIEditorDocumentViewController *)self _updateEditorViewInset];
  }
}

- (void)documentDidUpdate:(id)a3
{
  id v4 = [a3 templateElement];
  templateElement = self->_templateElement;
  self->_templateElement = v4;

  editorView = self->_editorView;
  if (editorView)
  {
    CGFloat v7 = [(SKUIEditorDocumentViewController *)self _backgroundColor];
    [(SKUIViewReuseView *)editorView setBackgroundColor:v7];
  }

  [(SKUIEditorDocumentViewController *)self _layoutNavigation];
}

- (void)didChangeTextInEditorTemplateView:(id)a3
{
  if (!self->_isTextChanged)
  {
    self->_isTextChanged = 1;
    [(SKUIEditorDocumentViewController *)self _layoutNavigation];
  }
}

- (void)loadView
{
  id v3 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  editorView = self->_editorView;
  id v11 = v3;
  if (!editorView)
  {
    CGSize v5 = objc_alloc_init(SKUIEditorTemplateView);
    id v6 = self->_editorView;
    self->_editorView = v5;

    [(SKUIEditorTemplateView *)self->_editorView setDelegate:self];
    CGFloat v7 = self->_editorView;
    CGFloat v8 = [(SKUIEditorDocumentViewController *)self _backgroundColor];
    [(SKUIViewReuseView *)v7 setBackgroundColor:v8];

    [(SKUIEditorTemplateView *)self->_editorView setPreservesSuperviewLayoutMargins:1];
    CGFloat v9 = self->_editorView;
    templateElement = self->_templateElement;
    [(SKUIViewElementLayoutContext *)self->_layoutContext activePageWidth];
    -[SKUIEditorTemplateView reloadWithViewElement:width:context:](v9, "reloadWithViewElement:width:context:", templateElement, self->_layoutContext);
    id v3 = v11;
    editorView = self->_editorView;
  }
  [v3 addSubview:editorView];
  [(SKUIEditorDocumentViewController *)self setView:v11];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  [(SKUIEditorDocumentViewController *)self _layoutEditorView];
  [(SKUIEditorDocumentViewController *)self _layoutNavigation];
  v5.receiver = self;
  v5.super_class = (Class)SKUIEditorDocumentViewController;
  [(SKUIViewController *)&v5 viewWillAppear:v3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(SKUIEditorTemplateView *)self->_editorView resignFirstResponder];
  v5.receiver = self;
  v5.super_class = (Class)SKUIEditorDocumentViewController;
  [(SKUIEditorDocumentViewController *)&v5 viewWillDisappear:v3];
}

- (void)viewWillLayoutSubviews
{
  [(SKUIEditorDocumentViewController *)self _layoutEditorView];
  [(SKUIEditorDocumentViewController *)self _layoutNavigation];
  v3.receiver = self;
  v3.super_class = (Class)SKUIEditorDocumentViewController;
  [(SKUIEditorDocumentViewController *)&v3 viewWillLayoutSubviews];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)SKUIEditorDocumentViewController;
  -[SKUIEditorDocumentViewController viewWillTransitionToSize:withTransitionCoordinator:](&v4, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
}

- (void)_authenticateOnCompletion:(id)a3
{
  id v3 = a3;
  objc_super v4 = [MEMORY[0x1E4FA8100] defaultStore];
  objc_super v5 = [v4 activeAccount];

  if (v5)
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4FA8260]) initWithAccount:v5];
    [v6 setPromptStyle:1];
    [v6 setShouldCreateNewSession:1];
  }
  else
  {
    id v6 = [MEMORY[0x1E4FA8260] contextForSignIn];
  }
  CGFloat v7 = (void *)[objc_alloc(MEMORY[0x1E4FA8128]) initWithAuthenticationContext:v6];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__SKUIEditorDocumentViewController__authenticateOnCompletion___block_invoke;
  v9[3] = &unk_1E64287D8;
  id v10 = v3;
  id v8 = v3;
  [v7 startWithAuthenticateResponseBlock:v9];
}

void __62__SKUIEditorDocumentViewController__authenticateOnCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __62__SKUIEditorDocumentViewController__authenticateOnCompletion___block_invoke_2;
  v5[3] = &unk_1E6423820;
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

uint64_t __62__SKUIEditorDocumentViewController__authenticateOnCompletion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) authenticateResponseType];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (id)_backgroundColor
{
  v2 = [(SKUIEditorTemplateViewElement *)self->_templateElement style];
  id v3 = [v2 ikBackgroundColor];
  id v4 = [v3 color];

  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    id v5 = [MEMORY[0x1E4FB1618] whiteColor];
  }
  id v6 = v5;

  return v6;
}

- (id)_layoutContext
{
  layoutContext = self->_layoutContext;
  if (!layoutContext)
  {
    id v4 = objc_alloc_init(SKUIViewElementLayoutContext);
    id v5 = self->_layoutContext;
    self->_layoutContext = v4;

    id v6 = self->_layoutContext;
    id v7 = [(SKUIViewController *)self clientContext];
    [(SKUIViewElementLayoutContext *)v6 setClientContext:v7];

    [(SKUIViewElementLayoutContext *)self->_layoutContext setContainerViewElementType:[(SKUIEditorTemplateViewElement *)self->_templateElement elementType]];
    [(SKUIViewElementLayoutContext *)self->_layoutContext setParentViewController:self];
    layoutContext = self->_layoutContext;
  }

  return layoutContext;
}

- (void)_layoutEditorView
{
  editorView = self->_editorView;
  id v3 = [(SKUIEditorDocumentViewController *)self view];
  [v3 bounds];
  -[SKUIEditorTemplateView setFrame:](editorView, "setFrame:");
}

- (void)_layoutNavigation
{
  id v18 = [(SKUIEditorDocumentViewController *)self navigationController];
  id v3 = [v18 navigationBar];
  id v4 = [v3 items];
  id v5 = [v4 lastObject];

  id v6 = [v5 rightBarButtonItem];
  [v6 setEnabled:self->_isTextChanged];
  [v6 setTarget:self];
  [v6 setAction:sel__doneButtonAction];
  id v7 = [v5 leftBarButtonItem];
  [v7 setTarget:self];
  [v7 setAction:sel__cancelButtonAction];
  [v18 setToolbarHidden:!self->_isTextChanged];
  id v8 = [v18 toolbar];
  CGFloat v9 = [v8 items];
  id v10 = [v9 firstObject];

  [v10 setTarget:self];
  [v10 setAction:sel__resetButtonAction];
  p_toolbarFrame = &self->_toolbarFrame;
  if (self->_isTextChanged)
  {
    v12 = [v18 toolbar];
    [v12 frame];
    p_toolbarFrame->origin.x = v13;
    p_toolbarFrame->origin.y = v14;
    p_toolbarFrame->size.width = v15;
    p_toolbarFrame->size.height = v16;
  }
  else
  {
    CGSize v17 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
    p_toolbarFrame->origin = (CGPoint)*MEMORY[0x1E4F1DB28];
    self->_toolbarFrame.size = v17;
  }
}

- (id)_locateFirstButtonWithType:(int64_t)a3 inChildrenOfElement:(id)a4
{
  id v5 = a4;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__66;
  CGFloat v13 = __Block_byref_object_dispose__66;
  id v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __83__SKUIEditorDocumentViewController__locateFirstButtonWithType_inChildrenOfElement___block_invoke;
  v8[3] = &unk_1E6426490;
  v8[4] = &v9;
  v8[5] = a3;
  [v5 enumerateChildrenUsingBlock:v8];
  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __83__SKUIEditorDocumentViewController__locateFirstButtonWithType_inChildrenOfElement___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v9 = a2;
  BOOL v6 = [v9 elementType] == 12;
  id v7 = v9;
  if (v6)
  {
    id v8 = v9;
    if ([v8 buttonViewType] == *(void *)(a1 + 40))
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
      *a3 = 1;
    }

    id v7 = v9;
  }
}

- (void)_resetButtonAction
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v20 = [(SKUIViewElement *)self->_templateElement firstChildForElementType:31];
  v2 = [v20 title];
  id v3 = [v2 text];
  v19 = [v3 string];

  id v4 = [v20 message];
  id v5 = [v4 text];
  id v18 = [v5 string];

  BOOL v6 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v19 message:v18 preferredStyle:1];
  [v20 buttons];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        if ([v10 buttonViewType] == 11)
        {
          objc_initWeak(&location, self);
          uint64_t v11 = (void *)MEMORY[0x1E4FB1410];
          v12 = [v10 buttonText];
          CGFloat v13 = [v12 string];
          v23[0] = MEMORY[0x1E4F143A8];
          v23[1] = 3221225472;
          v23[2] = __54__SKUIEditorDocumentViewController__resetButtonAction__block_invoke;
          v23[3] = &unk_1E6423678;
          objc_copyWeak(&v24, &location);
          id v14 = [v11 actionWithTitle:v13 style:2 handler:v23];

          objc_destroyWeak(&v24);
          objc_destroyWeak(&location);
        }
        else
        {
          CGFloat v15 = (void *)MEMORY[0x1E4FB1410];
          CGFloat v16 = [v10 buttonText];
          CGSize v17 = [v16 string];
          id v14 = [v15 actionWithTitle:v17 style:1 handler:0];
        }
        [v6 addAction:v14];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v7);
  }

  [(SKUIEditorDocumentViewController *)self presentViewController:v6 animated:1 completion:0];
}

void __54__SKUIEditorDocumentViewController__resetButtonAction__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _resetTextView];
}

- (void)_resetTextView
{
  editorView = self->_editorView;
  templateElement = self->_templateElement;
  [(SKUIViewElementLayoutContext *)self->_layoutContext activePageWidth];
  -[SKUIEditorTemplateView reloadWithViewElement:width:context:](editorView, "reloadWithViewElement:width:context:", templateElement, self->_layoutContext);
  self->_isTextChanged = 0;

  [(SKUIEditorDocumentViewController *)self _layoutNavigation];
}

- (void)_sendCancelEventAndDismiss
{
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", @"cancelButton", @"buttonIdentifier", 0);
  templateElement = self->_templateElement;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __62__SKUIEditorDocumentViewController__sendCancelEventAndDismiss__block_invoke;
  v5[3] = &unk_1E6424E80;
  void v5[4] = self;
  [(SKUIEditorTemplateViewElement *)templateElement dispatchEventOfType:14 canBubble:1 isCancelable:1 extraInfo:v3 completionBlock:v5];
}

uint64_t __62__SKUIEditorDocumentViewController__sendCancelEventAndDismiss__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
}

- (void)_sendDoneEventAndDismissWithText:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F1C9E8];
  id v5 = a3;
  BOOL v6 = objc_msgSend([v4 alloc], "initWithObjectsAndKeys:", @"doneButton", @"buttonIdentifier", v5, @"text", 0);

  templateElement = self->_templateElement;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __69__SKUIEditorDocumentViewController__sendDoneEventAndDismissWithText___block_invoke;
  v8[3] = &unk_1E6424E80;
  v8[4] = self;
  [(SKUIEditorTemplateViewElement *)templateElement dispatchEventOfType:14 canBubble:1 isCancelable:1 extraInfo:v6 completionBlock:v8];
}

uint64_t __69__SKUIEditorDocumentViewController__sendDoneEventAndDismissWithText___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
}

- (void)_updateBiographyWithText:(id)a3 onCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  uint64_t v8 = [(SKUIEditorTemplateViewElement *)self->_templateElement contentId];
  if (v8)
  {
    id v9 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    id v10 = [NSNumber numberWithBool:1];
    uint64_t v11 = objc_msgSend(v9, "initWithObjectsAndKeys:", v10, @"SKUIMediaSocialAdminPermissionsOptionIgnoreCache", 0);

    v12 = +[SKUIMediaSocialAdminPermissionsCoordinator sharedCoordinator];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __74__SKUIEditorDocumentViewController__updateBiographyWithText_onCompletion___block_invoke;
    v18[3] = &unk_1E6428800;
    id v19 = v8;
    v20 = &v21;
    [v12 getAuthorsAndWaitWithOptions:v11 authorsBlock:v18];
  }
  if (*((unsigned char *)v22 + 24))
  {
    CGFloat v13 = [SKUIMediaSocialUpdateProfileOperation alloc];
    id v14 = [(SKUIViewController *)self clientContext];
    CGFloat v15 = [(SKUIMediaSocialUpdateProfileOperation *)v13 initWithClientContext:v14];

    [(SKUIMediaSocialUpdateProfileOperation *)v15 setEntityType:@"artist"];
    [(SKUIMediaSocialUpdateProfileOperation *)v15 setIdentifier:v8];
    [(SKUIMediaSocialUpdateProfileOperation *)v15 setValue:v6 forProfileField:@"bio"];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __74__SKUIEditorDocumentViewController__updateBiographyWithText_onCompletion___block_invoke_2;
    v16[3] = &unk_1E64285B8;
    id v17 = v7;
    [(SKUIMediaSocialUpdateProfileOperation *)v15 setOutputBlock:v16];
    [(SKUIMediaSocialUpdateProfileOperation *)v15 main];
  }
  _Block_object_dispose(&v21, 8);
}

void __74__SKUIEditorDocumentViewController__updateBiographyWithText_onCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) longLongValue];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "identifier", (void)v12);
        uint64_t v11 = [v10 longLongValue];

        if (v11 == v4)
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

void __74__SKUIEditorDocumentViewController__updateBiographyWithText_onCompletion___block_invoke_2(uint64_t a1, char a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __74__SKUIEditorDocumentViewController__updateBiographyWithText_onCompletion___block_invoke_3;
  v3[3] = &unk_1E64254E0;
  id v4 = *(id *)(a1 + 32);
  char v5 = a2;
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

uint64_t __74__SKUIEditorDocumentViewController__updateBiographyWithText_onCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 40));
  }
  return result;
}

- (void)_updateEditorViewInset
{
  editorView = self->_editorView;
  double Height = CGRectGetHeight(self->_keyboardFrame);
  double v5 = Height + CGRectGetHeight(self->_toolbarFrame);

  [(SKUIEditorTemplateView *)editorView setBottomInset:v5];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_templateElement, 0);
  objc_storeStrong((id *)&self->_resetButtonElement, 0);
  objc_storeStrong((id *)&self->_layoutContext, 0);
  objc_storeStrong((id *)&self->_editorView, 0);

  objc_storeStrong((id *)&self->_doneButtonElement, 0);
}

- (void)initWithTemplateElement:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIEditorDocumentViewController initWithTemplateElement:]";
}

@end
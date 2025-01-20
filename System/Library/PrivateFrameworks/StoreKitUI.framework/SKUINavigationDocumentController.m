@interface SKUINavigationDocumentController
- (NSArray)documentStackItems;
- (SKUIClientContext)clientContext;
- (SKUINavigationDocumentController)initWithNavigationController:(id)a3;
- (SKUINavigationDocumentDelegate)delegate;
- (UINavigationController)moreNavigationController;
- (UINavigationController)navigationController;
- (UINavigationController)overrideNavigationController;
- (id)_activeNavigationController;
- (id)documents;
- (void)_applyDocumentReplacementForOldStackItem:(id)a3 atOldIndex:(int64_t)a4 withStackItem:(id)a5;
- (void)_ensureStackConsistencyForNavigationControllerOperation:(int64_t)a3 operationDidComplete:(BOOL)a4;
- (void)_handleStackDidChange;
- (void)_scheduleFlushingPendingNavigationStackEnsureConsistencyRequestsWithTransitionCoordinator:(id)a3;
- (void)_unloadAllStackItems;
- (void)ensureStackConsistencyForNavigationControllerOperation:(int64_t)a3 operationDidComplete:(BOOL)a4;
- (void)insertDocument:(id)a3 beforeDocument:(id)a4 options:(id)a5;
- (void)popAllDocuments;
- (void)popDocument;
- (void)popToDocument:(id)a3;
- (void)popToRootDocument;
- (void)pushDocument:(id)a3 options:(id)a4;
- (void)removeDocument:(id)a3;
- (void)replaceDocument:(id)a3 withDocument:(id)a4 options:(id)a5;
- (void)setClientContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMoreNavigationController:(id)a3;
- (void)setOverrideNavigationController:(id)a3;
- (void)setStackItems:(id)a3 animated:(BOOL)a4;
@end

@implementation SKUINavigationDocumentController

- (SKUINavigationDocumentController)initWithNavigationController:(id)a3
{
  id v5 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[SKUINavigationDocumentController initWithNavigationController:]();
  }
  v14.receiver = self;
  v14.super_class = (Class)SKUINavigationDocumentController;
  v6 = [(SKUINavigationDocumentController *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_navigationController, a3);
    uint64_t v8 = storeSemanticContentAttribute();
    v9 = [(UINavigationController *)v7->_navigationController view];
    [v9 setSemanticContentAttribute:v8];

    v10 = [(UINavigationController *)v7->_navigationController navigationBar];
    [v10 setSemanticContentAttribute:v8];

    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    stackItems = v7->_stackItems;
    v7->_stackItems = v11;
  }
  return v7;
}

- (void)ensureStackConsistencyForNavigationControllerOperation:(int64_t)a3 operationDidComplete:(BOOL)a4
{
  BOOL v4 = a4;
  if ([(NSMutableArray *)self->_pendingNavigationStackEnsureConsistencyRequests count])
  {
    v11 = [[SKUINavigationStackEnsureConsistencyRequest alloc] initWithNavigationControllerOperation:a3 operationDidComplete:v4];
    [(NSMutableArray *)self->_pendingNavigationStackEnsureConsistencyRequests addObject:v11];
LABEL_5:

    return;
  }
  uint64_t v7 = [(UINavigationController *)self->_navigationController transitionCoordinator];
  if (v7)
  {
    v11 = (SKUINavigationStackEnsureConsistencyRequest *)v7;
    uint64_t v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    pendingNavigationStackEnsureConsistencyRequests = self->_pendingNavigationStackEnsureConsistencyRequests;
    self->_pendingNavigationStackEnsureConsistencyRequests = v8;

    v10 = [[SKUINavigationStackEnsureConsistencyRequest alloc] initWithNavigationControllerOperation:a3 operationDidComplete:v4];
    [(NSMutableArray *)self->_pendingNavigationStackEnsureConsistencyRequests addObject:v10];
    [(SKUINavigationDocumentController *)self _scheduleFlushingPendingNavigationStackEnsureConsistencyRequestsWithTransitionCoordinator:v11];

    goto LABEL_5;
  }

  [(SKUINavigationDocumentController *)self _ensureStackConsistencyForNavigationControllerOperation:a3 operationDidComplete:v4];
}

- (void)popAllDocuments
{
  [(SKUINavigationDocumentController *)self _unloadAllStackItems];
  moreNavigationController = self->_moreNavigationController;
  if (moreNavigationController || (moreNavigationController = self->_overrideNavigationController) != 0) {
    id v4 = [(UINavigationController *)moreNavigationController popToRootViewControllerAnimated:0];
  }
  else {
    [(UINavigationController *)self->_navigationController setViewControllers:MEMORY[0x1E4F1CBF0] animated:0];
  }

  [(SKUINavigationDocumentController *)self _handleStackDidChange];
}

- (void)setStackItems:(id)a3 animated:(BOOL)a4
{
  BOOL v23 = a4;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  [(SKUINavigationDocumentController *)self _unloadAllStackItems];
  v24 = [(SKUINavigationDocumentController *)self clientContext];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        v13 = [v12 viewController];
        if (v13) {
          goto LABEL_8;
        }
        objc_super v14 = [SKUIDocumentContainerViewController alloc];
        v15 = [v12 document];
        v16 = [v12 presentationOptions];
        v13 = [(SKUIDocumentContainerViewController *)v14 initWithDocument:v15 options:v16 clientContext:v24];

        [v12 setViewController:v13];
        if (v13)
        {
LABEL_8:
          [(NSMutableArray *)self->_stackItems addObject:v12];
          [v6 addObject:v13];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v9);
  }

  moreNavigationController = self->_moreNavigationController;
  if (moreNavigationController || (moreNavigationController = self->_overrideNavigationController) != 0)
  {
    v18 = [(UINavigationController *)moreNavigationController viewControllers];
    v19 = [v18 firstObject];

    if (v19) {
      [v6 insertObject:v19 atIndex:0];
    }
  }
  v20 = [(SKUINavigationDocumentController *)self _activeNavigationController];
  v21 = [v6 firstObject];
  if ([v21 conformsToProtocol:&unk_1F1DC8BE0]) {
    [v20 setTransitioningDelegate:v21];
  }
  v22 = [(SKUINavigationDocumentController *)self _activeNavigationController];
  [v22 setViewControllers:v6 animated:v23];

  [(SKUINavigationDocumentController *)self _handleStackDidChange];
}

- (id)documents
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA48] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = self->_stackItems;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "document", (void)v11);
        if (v9) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void)insertDocument:(id)a3 beforeDocument:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v9) {
    goto LABEL_3;
  }
  stackItems = self->_stackItems;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __74__SKUINavigationDocumentController_insertDocument_beforeDocument_options___block_invoke;
  v25[3] = &unk_1E6427028;
  id v26 = v9;
  uint64_t v12 = [(NSMutableArray *)stackItems indexOfObjectPassingTest:v25];

  if (v12 != 0x7FFFFFFFFFFFFFFFLL)
  {
    long long v13 = [SKUIDocumentContainerViewController alloc];
    long long v14 = [(SKUINavigationDocumentController *)self clientContext];
    v15 = [(SKUIDocumentContainerViewController *)v13 initWithDocument:v8 options:v10 clientContext:v14];

    if (v15)
    {
      uint64_t v16 = [[SKUIDocumentStackItem alloc] initWithDocument:v8 presentationOptions:v10];
      [(SKUIDocumentStackItem *)v16 setViewController:v15];
      v24 = [(SKUINavigationDocumentController *)self _activeNavigationController];
      v17 = [v24 viewControllers];
      v18 = (void *)[v17 mutableCopy];

      BOOL v23 = [(NSMutableArray *)self->_stackItems objectAtIndex:v12];
      v19 = [v23 viewController];
      uint64_t v20 = [v18 indexOfObjectIdenticalTo:v19];

      v21 = self->_stackItems;
      if (v20 == 0x7FFFFFFFFFFFFFFFLL)
      {
        [(NSMutableArray *)v21 addObject:v16];
        v22 = v24;
        objc_msgSend(v24, "pushViewController:animated:", v15, -[SKUIDocumentStackItem isAnimated](v16, "isAnimated"));
      }
      else
      {
        [(NSMutableArray *)v21 insertObject:v16 atIndex:v12];
        [v18 insertObject:v15 atIndex:v20];
        v22 = v24;
        objc_msgSend(v24, "setViewControllers:animated:", v18, -[SKUIDocumentStackItem isAnimated](v16, "isAnimated"));
      }
      [(SKUINavigationDocumentController *)self _handleStackDidChange];
    }
    else
    {
      NSLog(&cfstr_NoViewControll.isa, v8, v10);
    }
  }
  else
  {
LABEL_3:
    [(SKUINavigationDocumentController *)self pushDocument:v8 options:v10];
  }
}

BOOL __74__SKUINavigationDocumentController_insertDocument_beforeDocument_options___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 document];
  BOOL v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (void)popDocument
{
  if ([(NSMutableArray *)self->_stackItems count])
  {
    id v7 = [(NSMutableArray *)self->_stackItems lastObject];
    uint64_t v3 = [v7 isAnimated];
    BOOL v4 = [v7 document];
    [v4 onUnload];

    [(NSMutableArray *)self->_stackItems removeLastObject];
    uint64_t v5 = [(SKUINavigationDocumentController *)self _activeNavigationController];
    id v6 = (id)[v5 popViewControllerAnimated:v3];

    [(SKUINavigationDocumentController *)self _handleStackDidChange];
  }
}

- (void)popToRootDocument
{
  uint64_t v3 = [(NSMutableArray *)self->_stackItems count];
  if (v3 >= 2)
  {
    unint64_t v4 = v3 + 1;
    do
    {
      uint64_t v5 = [(NSMutableArray *)self->_stackItems objectAtIndex:v4 - 2];
      id v6 = [v5 document];
      [v6 onUnload];

      [(NSMutableArray *)self->_stackItems removeObjectAtIndex:v4 - 2];
      --v4;
    }
    while (v4 > 2);
  }
  if ([(NSMutableArray *)self->_stackItems count])
  {
    id v7 = [(NSMutableArray *)self->_stackItems firstObject];
    id v8 = [(SKUINavigationDocumentController *)self _activeNavigationController];
    id v9 = [v7 viewController];
    id v10 = (id)[v8 popToViewController:v9 animated:1];
  }

  [(SKUINavigationDocumentController *)self _handleStackDidChange];
}

- (void)popToDocument:(id)a3
{
  id v4 = a3;
  stackItems = self->_stackItems;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __50__SKUINavigationDocumentController_popToDocument___block_invoke;
  v16[3] = &unk_1E6427028;
  id v6 = v4;
  id v17 = v6;
  uint64_t v7 = [(NSMutableArray *)stackItems indexOfObjectPassingTest:v16];
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = v7;
    for (uint64_t i = [(NSMutableArray *)self->_stackItems count] - 1; i > v8; --i)
    {
      id v10 = [(NSMutableArray *)self->_stackItems objectAtIndex:i];
      long long v11 = [v10 document];
      [v11 onUnload];

      [(NSMutableArray *)self->_stackItems removeObjectAtIndex:i];
    }
    uint64_t v12 = [(NSMutableArray *)self->_stackItems objectAtIndex:v8];
    long long v13 = [(SKUINavigationDocumentController *)self _activeNavigationController];
    long long v14 = [v12 viewController];
    id v15 = (id)objc_msgSend(v13, "popToViewController:animated:", v14, objc_msgSend(v12, "isAnimated"));

    [(SKUINavigationDocumentController *)self _handleStackDidChange];
  }
}

BOOL __50__SKUINavigationDocumentController_popToDocument___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 document];
  BOOL v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (void)pushDocument:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [SKUIDocumentContainerViewController alloc];
  id v9 = [(SKUINavigationDocumentController *)self clientContext];
  id v10 = [(SKUIDocumentContainerViewController *)v8 initWithDocument:v6 options:v7 clientContext:v9];

  if (v10)
  {
    long long v11 = [[SKUIDocumentStackItem alloc] initWithDocument:v6 presentationOptions:v7];
    [(SKUIDocumentStackItem *)v11 setViewController:v10];
    [(NSMutableArray *)self->_stackItems addObject:v11];
    uint64_t v12 = [(SKUINavigationDocumentController *)self _activeNavigationController];
    [(SKUIDocumentContainerViewController *)v10 preferredContentSize];
    if (*MEMORY[0x1E4F1DB30] == v14 && *(double *)(MEMORY[0x1E4F1DB30] + 8) == v13)
    {
      [v12 preferredContentSize];
      -[SKUIDocumentContainerViewController setPreferredContentSize:](v10, "setPreferredContentSize:");
    }
    uint64_t v16 = [v12 viewControllers];
    uint64_t v17 = [v16 count];

    v18 = [v12 transitionCoordinator];
    objc_msgSend(v12, "pushViewController:animated:", v10, -[SKUIDocumentStackItem isAnimated](v11, "isAnimated"));
    if (!v17)
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __57__SKUINavigationDocumentController_pushDocument_options___block_invoke;
      aBlock[3] = &unk_1E6421FF8;
      id v24 = v12;
      long long v25 = v10;
      v19 = (void (**)(void))_Block_copy(aBlock);
      uint64_t v20 = v19;
      if (v18)
      {
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __57__SKUINavigationDocumentController_pushDocument_options___block_invoke_4;
        v21[3] = &unk_1E6427050;
        v22 = v19;
        [v18 animateAlongsideTransition:0 completion:v21];
      }
      else
      {
        v19[2](v19);
      }
    }
    [(SKUINavigationDocumentController *)self _handleStackDidChange];
  }
  else
  {
    NSLog(&cfstr_NoViewControll.isa, v6, v7);
  }
}

void __57__SKUINavigationDocumentController_pushDocument_options___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4FB1438] sharedApplication];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __57__SKUINavigationDocumentController_pushDocument_options___block_invoke_2;
  v3[3] = &unk_1E6421FF8;
  id v4 = *(id *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [v2 _performBlockAfterCATransactionCommits:v3];
}

void __57__SKUINavigationDocumentController_pushDocument_options___block_invoke_2(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4FB1EB0];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __57__SKUINavigationDocumentController_pushDocument_options___block_invoke_3;
  v3[3] = &unk_1E6421FF8;
  id v4 = *(id *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [v2 performWithoutAnimation:v3];
}

uint64_t __57__SKUINavigationDocumentController_pushDocument_options___block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) view];
  [v2 layoutSubviews];

  uint64_t v3 = *(void **)(a1 + 40);

  return [v3 reloadData];
}

uint64_t __57__SKUINavigationDocumentController_pushDocument_options___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removeDocument:(id)a3
{
  id v4 = a3;
  stackItems = self->_stackItems;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __51__SKUINavigationDocumentController_removeDocument___block_invoke;
  v15[3] = &unk_1E6427028;
  id v6 = v4;
  id v16 = v6;
  uint64_t v7 = [(NSMutableArray *)stackItems indexOfObjectPassingTest:v15];
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = v7;
    id v9 = [(NSMutableArray *)self->_stackItems objectAtIndex:v7];
    id v10 = [(SKUINavigationDocumentController *)self _activeNavigationController];
    long long v11 = [v10 viewControllers];
    uint64_t v12 = (void *)[v11 mutableCopy];

    double v13 = [v9 viewController];
    [v12 removeObjectIdenticalTo:v13];

    double v14 = [v9 document];
    [v14 onUnload];

    [(NSMutableArray *)self->_stackItems removeObjectAtIndex:v8];
    [v10 setViewControllers:v12 animated:0];
    [(SKUINavigationDocumentController *)self _handleStackDidChange];
  }
}

BOOL __51__SKUINavigationDocumentController_removeDocument___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 document];
  BOOL v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (void)replaceDocument:(id)a3 withDocument:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8) {
    goto LABEL_3;
  }
  stackItems = self->_stackItems;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __73__SKUINavigationDocumentController_replaceDocument_withDocument_options___block_invoke;
  v31[3] = &unk_1E6427028;
  id v32 = v8;
  uint64_t v12 = [(NSMutableArray *)stackItems indexOfObjectPassingTest:v31];

  if (v12 != 0x7FFFFFFFFFFFFFFFLL)
  {
    double v13 = [SKUIDocumentContainerViewController alloc];
    double v14 = [(SKUINavigationDocumentController *)self clientContext];
    id v15 = [(SKUIDocumentContainerViewController *)v13 initWithDocument:v9 options:v10 clientContext:v14];

    if (v15)
    {
      id v26 = [[SKUIDocumentStackItem alloc] initWithDocument:v9 presentationOptions:v10];
      [(SKUIDocumentStackItem *)v26 setViewController:v15];
      id v16 = [(NSMutableArray *)self->_stackItems objectAtIndex:v12];
      uint64_t v17 = [(SKUINavigationDocumentController *)self _activeNavigationController];
      v18 = [v17 viewControllers];
      v19 = [v16 viewController];
      long long v25 = v18;
      uint64_t v20 = [v18 indexOfObjectIdenticalTo:v19];

      v21 = v17;
      if (v20 == 0x7FFFFFFFFFFFFFFFLL
        && ([v17 transitionCoordinator], (uint64_t v22 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        BOOL v23 = (void *)v22;
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __73__SKUINavigationDocumentController_replaceDocument_withDocument_options___block_invoke_2;
        v27[3] = &unk_1E6427078;
        v27[4] = self;
        id v28 = v16;
        uint64_t v30 = v12;
        id v24 = v26;
        v29 = v26;
        [v23 animateAlongsideTransition:0 completion:v27];
      }
      else
      {
        id v24 = v26;
        [(SKUINavigationDocumentController *)self _applyDocumentReplacementForOldStackItem:v16 atOldIndex:v12 withStackItem:v26];
      }
    }
    else
    {
      NSLog(&cfstr_NoViewControll.isa, v9, v10);
    }
  }
  else
  {
LABEL_3:
    [(SKUINavigationDocumentController *)self pushDocument:v9 options:v10];
  }
}

BOOL __73__SKUINavigationDocumentController_replaceDocument_withDocument_options___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 document];
  BOOL v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

uint64_t __73__SKUINavigationDocumentController_replaceDocument_withDocument_options___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _applyDocumentReplacementForOldStackItem:*(void *)(a1 + 40) atOldIndex:*(void *)(a1 + 56) withStackItem:*(void *)(a1 + 48)];
}

- (id)_activeNavigationController
{
  moreNavigationController = self->_moreNavigationController;
  if (moreNavigationController) {
    return moreNavigationController;
  }
  moreNavigationController = self->_overrideNavigationController;
  if (moreNavigationController) {
    return moreNavigationController;
  }
  else {
    return self->_navigationController;
  }
}

- (void)_applyDocumentReplacementForOldStackItem:(id)a3 atOldIndex:(int64_t)a4 withStackItem:(id)a5
{
  id v16 = a3;
  id v8 = a5;
  id v9 = [(SKUINavigationDocumentController *)self _activeNavigationController];
  id v10 = [v9 viewControllers];
  long long v11 = (void *)[v10 mutableCopy];

  uint64_t v12 = [v16 viewController];
  uint64_t v13 = [v11 indexOfObjectIdenticalTo:v12];

  double v14 = [v8 viewController];
  if (v13 == 0x7FFFFFFFFFFFFFFFLL)
  {
    [(NSMutableArray *)self->_stackItems addObject:v8];
    objc_msgSend(v9, "pushViewController:animated:", v14, objc_msgSend(v8, "isAnimated"));
  }
  else
  {
    id v15 = [v16 document];
    [v15 onUnload];

    [(NSMutableArray *)self->_stackItems replaceObjectAtIndex:a4 withObject:v8];
    [v11 replaceObjectAtIndex:v13 withObject:v14];
    objc_msgSend(v9, "setViewControllers:animated:", v11, objc_msgSend(v8, "isAnimated"));
  }
  [(SKUINavigationDocumentController *)self _handleStackDidChange];
}

- (void)_ensureStackConsistencyForNavigationControllerOperation:(int64_t)a3 operationDidComplete:(BOOL)a4
{
  v35[2] = *MEMORY[0x1E4F143B8];
  BOOL v4 = (a3 & 0xFFFFFFFFFFFFFFFDLL) == 1 && !a4;
  if ((a3 & 0xFFFFFFFFFFFFFFFDLL) == 1 || a4)
  {
    BOOL v6 = a4;
    id v8 = [(SKUINavigationDocumentController *)self _activeNavigationController];
    id v9 = [v8 viewControllers];

    BOOL v28 = v6;
    if (v6)
    {
      uint64_t v10 = [(NSMutableArray *)self->_stackItems count];
      if (v10)
      {
        uint64_t v11 = v10 - 1;
        do
        {
          uint64_t v12 = [(NSMutableArray *)self->_stackItems objectAtIndex:v11];
          uint64_t v13 = [v12 viewController];
          uint64_t v14 = [v9 indexOfObjectIdenticalTo:v13];

          if (v14 == 0x7FFFFFFFFFFFFFFFLL)
          {
            id v15 = [v12 document];
            [v15 onUnload];

            [(NSMutableArray *)self->_stackItems removeObjectAtIndex:v11];
          }

          --v11;
        }
        while (v11 != -1);
      }
    }
    if (v4)
    {
      id v16 = [(SKUINavigationDocumentController *)self delegate];
      if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
      {
        long long v27 = v16;
        uint64_t v29 = [v9 count];
        if (v29)
        {
          unint64_t v17 = 0;
          id v18 = 0;
          do
          {
            v19 = [v9 objectAtIndex:v17];
            if (v17 >= [(NSMutableArray *)self->_stackItems count])
            {
              uint64_t v20 = 0;
            }
            else
            {
              uint64_t v20 = [(NSMutableArray *)self->_stackItems objectAtIndex:v17];
            }
            v21 = [v20 viewController];

            if (v19 != v21)
            {
              uint64_t v22 = [[SKUIDocumentStackItem alloc] initWithDocument:0 presentationOptions:0];
              [(SKUIDocumentStackItem *)v22 setViewController:v19];
              [(NSMutableArray *)self->_stackItems insertObject:v22 atIndex:v17];
              if (!v18) {
                id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              }
              v34[0] = @"stackItem";
              v34[1] = @"viewControllerClass";
              v35[0] = v22;
              BOOL v23 = (objc_class *)objc_opt_class();
              id v24 = NSStringFromClass(v23);
              v35[1] = v24;
              long long v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:2];
              id v26 = (void *)[v25 mutableCopy];
              [v18 addObject:v26];
            }
            ++v17;
          }
          while (v29 != v17);
        }
        else
        {
          id v18 = 0;
        }
        id v16 = v27;
        if ([v18 count])
        {
          v30[0] = MEMORY[0x1E4F143A8];
          v30[1] = 3221225472;
          v30[2] = __113__SKUINavigationDocumentController__ensureStackConsistencyForNavigationControllerOperation_operationDidComplete___block_invoke;
          v30[3] = &unk_1E6426950;
          id v31 = v27;
          id v32 = self;
          id v33 = v18;
          [v31 navigationDocumentController:self requestsAccessToAppContextUsingBlock:v30];
        }
      }
    }
    if (v28) {
      [(SKUINavigationDocumentController *)self _handleStackDidChange];
    }
  }
}

void __113__SKUINavigationDocumentController__ensureStackConsistencyForNavigationControllerOperation_operationDidComplete___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __113__SKUINavigationDocumentController__ensureStackConsistencyForNavigationControllerOperation_operationDidComplete___block_invoke_2;
  v8[3] = &unk_1E6424AF8;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  BOOL v6 = *(void **)(a1 + 48);
  id v9 = v4;
  uint64_t v10 = v5;
  id v11 = v6;
  id v12 = v3;
  id v7 = v3;
  [v7 evaluate:v8 completionBlock:0];
}

void __113__SKUINavigationDocumentController__ensureStackConsistencyForNavigationControllerOperation_operationDidComplete___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = [*(id *)(a1 + 32) jsNavigationDocumentForNavigationDocumentController:*(void *)(a1 + 40) inContext:a2];
  if (v3)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id obj = *(id *)(a1 + 48);
    uint64_t v4 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v18 != v6) {
            objc_enumerationMutation(obj);
          }
          id v8 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          id v9 = [v8 objectForKey:@"viewControllerClass"];
          uint64_t v10 = (void *)[[NSString alloc] initWithFormat:@"<document><nativeViewPlaceholderTemplate viewControllerClass=\"%@\"></nativeViewPlaceholderTemplate></document>", v9];
          id v11 = (void *)[objc_alloc(MEMORY[0x1E4F6F088]) initWithAppContext:*(void *)(a1 + 56) xmlStr:v10 error:0];
          [v11 setNavigationDocument:v3];
          id v12 = (void *)[objc_alloc(MEMORY[0x1E4F6F010]) initWithAppContext:*(void *)(a1 + 56) document:v11 owner:v3];
          [v8 setObject:v12 forKey:@"placeholderTemplateDocument"];
        }
        uint64_t v5 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v5);
    }

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __113__SKUINavigationDocumentController__ensureStackConsistencyForNavigationControllerOperation_operationDidComplete___block_invoke_3;
    v15[3] = &unk_1E6424B48;
    uint64_t v13 = *(void **)(a1 + 56);
    id v16 = *(id *)(a1 + 48);
    [v13 evaluateDelegateBlockSync:v15];
  }
}

void __113__SKUINavigationDocumentController__ensureStackConsistencyForNavigationControllerOperation_operationDidComplete___block_invoke_3(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v1);
        }
        uint64_t v6 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        id v7 = objc_msgSend(v6, "objectForKey:", @"stackItem", (void)v9);
        id v8 = [v6 objectForKey:@"placeholderTemplateDocument"];
        [v7 _setDocument:v8];
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v3);
  }
}

- (void)_handleStackDidChange
{
  id v6 = [(NSMutableArray *)self->_stackItems firstObject];
  uint64_t v3 = [v6 viewController];
  uint64_t v4 = [(UINavigationController *)self->_navigationController tabBarItem];
  [v3 setTabBarItem:v4];

  uint64_t v5 = [(SKUINavigationDocumentController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 navigationDocumentStackDidChange:self];
  }
}

- (void)_scheduleFlushingPendingNavigationStackEnsureConsistencyRequestsWithTransitionCoordinator:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __126__SKUINavigationDocumentController__scheduleFlushingPendingNavigationStackEnsureConsistencyRequestsWithTransitionCoordinator___block_invoke;
  v3[3] = &unk_1E6422278;
  void v3[4] = self;
  [a3 animateAlongsideTransition:0 completion:v3];
}

void __126__SKUINavigationDocumentController__scheduleFlushingPendingNavigationStackEnsureConsistencyRequestsWithTransitionCoordinator___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4FB1438] sharedApplication];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __126__SKUINavigationDocumentController__scheduleFlushingPendingNavigationStackEnsureConsistencyRequestsWithTransitionCoordinator___block_invoke_2;
  v3[3] = &unk_1E6422020;
  void v3[4] = *(void *)(a1 + 32);
  [v2 _performBlockAfterCATransactionCommits:v3];
}

void __126__SKUINavigationDocumentController__scheduleFlushingPendingNavigationStackEnsureConsistencyRequestsWithTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 24) transitionCoordinator];
  uint64_t v3 = *(void **)(a1 + 32);
  id v8 = (id)v2;
  if (v2)
  {
    [v3 _scheduleFlushingPendingNavigationStackEnsureConsistencyRequestsWithTransitionCoordinator:v2];
  }
  else
  {
    for (uint64_t i = (void *)v3[1]; [i count]; uint64_t i = *(void **)(*(void *)(a1 + 32) + 8))
    {
      uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 8) objectAtIndex:0];
      [*(id *)(*(void *)(a1 + 32) + 8) removeObjectAtIndex:0];
      objc_msgSend(*(id *)(a1 + 32), "_ensureStackConsistencyForNavigationControllerOperation:operationDidComplete:", objc_msgSend(v5, "navigationControllerOperation"), objc_msgSend(v5, "operationDidComplete"));
    }
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void **)(v6 + 8);
    *(void *)(v6 + 8) = 0;
  }
}

- (void)_unloadAllStackItems
{
  uint64_t v3 = [(NSMutableArray *)self->_stackItems count];
  if (v3 >= 1)
  {
    unint64_t v4 = v3 + 1;
    do
    {
      uint64_t v5 = [(NSMutableArray *)self->_stackItems objectAtIndex:v4 - 2];
      uint64_t v6 = [v5 document];
      [v6 onUnload];

      --v4;
    }
    while (v4 > 1);
  }
  stackItems = self->_stackItems;

  [(NSMutableArray *)stackItems removeAllObjects];
}

- (NSArray)documentStackItems
{
  return &self->_stackItems->super;
}

- (UINavigationController)navigationController
{
  return self->_navigationController;
}

- (SKUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
}

- (SKUINavigationDocumentDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SKUINavigationDocumentDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UINavigationController)overrideNavigationController
{
  return self->_overrideNavigationController;
}

- (void)setOverrideNavigationController:(id)a3
{
}

- (UINavigationController)moreNavigationController
{
  return self->_moreNavigationController;
}

- (void)setMoreNavigationController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moreNavigationController, 0);
  objc_storeStrong((id *)&self->_overrideNavigationController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_storeStrong((id *)&self->_stackItems, 0);

  objc_storeStrong((id *)&self->_pendingNavigationStackEnsureConsistencyRequests, 0);
}

- (void)initWithNavigationController:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  id v1 = "-[SKUINavigationDocumentController initWithNavigationController:]";
}

@end
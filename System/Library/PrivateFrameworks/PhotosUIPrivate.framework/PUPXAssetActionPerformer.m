@interface PUPXAssetActionPerformer
- (BOOL)actionPerformer:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5;
- (BOOL)actionPerformer:(id)a3 presentViewController:(id)a4;
- (BOOL)prefersAssetInclusionAfterRemovalForActionPerformer:(id)a3;
- (PUPXAssetActionPerformer)initWithActionType:(unint64_t)a3 assets:(id)a4 orAssetsByAssetCollection:(id)a5;
- (PUPXAssetActionPerformer)initWithUnderlyingActionPerformer:(id)a3;
- (PXActionPerformerDelegate)forwardingDelegate;
- (PXAssetActionManager)underlyingActionManager;
- (UIViewController)presentedViewController;
- (id)undoManagerForActionPerformer:(id)a3;
- (unint64_t)state;
- (void)actionPerformer:(id)a3 didChangeState:(unint64_t)a4;
- (void)performWithCompletionHandler:(id)a3;
- (void)setPresentedViewController:(id)a3;
- (void)setUnderlyingActionManager:(id)a3;
@end

@implementation PUPXAssetActionPerformer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingActionManager, 0);
  objc_destroyWeak((id *)&self->_forwardingDelegate);
  objc_storeStrong((id *)&self->presentedViewController, 0);
  objc_storeStrong((id *)&self->_underlyingActionPerformer, 0);
}

- (void)setUnderlyingActionManager:(id)a3
{
}

- (PXAssetActionManager)underlyingActionManager
{
  return self->_underlyingActionManager;
}

- (PXActionPerformerDelegate)forwardingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_forwardingDelegate);
  return (PXActionPerformerDelegate *)WeakRetained;
}

- (void)setPresentedViewController:(id)a3
{
}

- (UIViewController)presentedViewController
{
  return self->presentedViewController;
}

- (BOOL)prefersAssetInclusionAfterRemovalForActionPerformer:(id)a3
{
  v4 = [(PUAssetActionPerformer *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0) {
    return 0;
  }
  v6 = [(PUAssetActionPerformer *)self delegate];
  char v7 = [v6 prefersAssetInclusionAfterRemovalForActionPerformer:self];

  return v7;
}

- (id)undoManagerForActionPerformer:(id)a3
{
  v4 = [(PUAssetActionPerformer *)self delegate];
  char v5 = [v4 undoManagerForAssetActionPerformer:self];

  return v5;
}

- (BOOL)actionPerformer:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = [(PUAssetActionPerformer *)self delegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    id v11 = v7;
    v12 = [(PUAssetActionPerformer *)self delegate];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __84__PUPXAssetActionPerformer_actionPerformer_dismissViewController_completionHandler___block_invoke;
    v16[3] = &unk_1E5F2EBC8;
    id v17 = v11;
    v18 = self;
    id v19 = v8;
    id v13 = v11;
    char v14 = [v12 assetActionPerformer:self dismissViewController:v13 completionHandler:v16];
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

uint64_t __84__PUPXAssetActionPerformer_actionPerformer_dismissViewController_completionHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) presentedViewController];

  if (v2 == v3) {
    [*(id *)(a1 + 40) setPresentedViewController:0];
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    char v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

- (BOOL)actionPerformer:(id)a3 presentViewController:(id)a4
{
  id v5 = a4;
  v6 = [(PUAssetActionPerformer *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = v5;
    v9 = [(PUAssetActionPerformer *)self delegate];
    int v10 = [v9 assetActionPerformer:self presentViewController:v8];

    if (v10) {
      [(PUPXAssetActionPerformer *)self setPresentedViewController:v8];
    }
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (void)actionPerformer:(id)a3 didChangeState:(unint64_t)a4
{
  id v14 = a3;
  v6 = [(PUAssetActionPerformer *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    if ((uint64_t)a4 > 19)
    {
      unint64_t v9 = a4;
      if (a4 != 20)
      {
        if (a4 == 30) {
          unint64_t v9 = 30;
        }
        else {
          unint64_t v9 = 0;
        }
      }
    }
    else
    {
      if (a4 == 10) {
        uint64_t v8 = 10;
      }
      else {
        uint64_t v8 = 0;
      }
      if (a4 == 5) {
        unint64_t v9 = 5;
      }
      else {
        unint64_t v9 = v8;
      }
    }
    int v10 = [(PUAssetActionPerformer *)self delegate];
    [v10 assetActionPerformer:self didChangeState:v9];
  }
  id v11 = [(PUPXAssetActionPerformer *)self forwardingDelegate];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    id v13 = [(PUPXAssetActionPerformer *)self forwardingDelegate];
    [v13 actionPerformer:v14 didChangeState:a4];
  }
}

- (void)performWithCompletionHandler:(id)a3
{
}

- (unint64_t)state
{
  uint64_t v2 = [(PXAssetActionPerformer *)self->_underlyingActionPerformer state];
  if (v2 == 30) {
    unint64_t v3 = 30;
  }
  else {
    unint64_t v3 = 0;
  }
  if (v2 == 20) {
    unint64_t v3 = 20;
  }
  if (v2 == 10) {
    unint64_t v4 = 10;
  }
  else {
    unint64_t v4 = 0;
  }
  if (v2 == 5) {
    unint64_t v4 = 5;
  }
  if (v2 <= 19) {
    return v4;
  }
  else {
    return v3;
  }
}

- (PUPXAssetActionPerformer)initWithUnderlyingActionPerformer:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PUPXAssetActionManager.m", 341, @"Invalid parameter not satisfying: %@", @"actionPerformer" object file lineNumber description];
  }
  char v7 = [v6 actionType];
  uint64_t v8 = PUAssetActionTypeForPXAssetActionType(v7);

  if (v8)
  {
    v17.receiver = self;
    v17.super_class = (Class)PUPXAssetActionPerformer;
    unint64_t v9 = [(PUAssetActionPerformer *)&v17 initWithActionType:v8 assets:0 orAssetsByAssetCollection:0];
    p_isa = (id *)&v9->super.super.isa;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_underlyingActionPerformer, a3);
      id v11 = [v6 delegate];
      objc_storeWeak(p_isa + 11, v11);

      [v6 setDelegate:p_isa];
    }
    self = p_isa;
    char v12 = self;
  }
  else
  {
    id v13 = PXAssertGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v15 = [v6 actionType];
      *(_DWORD *)buf = 138412290;
      id v19 = v15;
      _os_log_error_impl(&dword_1AE9F8000, v13, OS_LOG_TYPE_ERROR, "There is no equivalent PUAssetActionType given for %@", buf, 0xCu);
    }
    char v12 = 0;
  }

  return v12;
}

- (PUPXAssetActionPerformer)initWithActionType:(unint64_t)a3 assets:(id)a4 orAssetsByAssetCollection:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  int v10 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUPXAssetActionManager.m", 337, @"%s is not available as initializer", "-[PUPXAssetActionPerformer initWithActionType:assets:orAssetsByAssetCollection:]");

  abort();
}

@end
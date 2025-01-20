@interface TabCollectionViewSpringLoadingBehavior
+ (void)addSpringLoadedInteractionToTabView:(id)a3;
- (BOOL)shouldAllowInteraction:(id)a3 withContext:(id)a4;
- (TabCollectionView)tabView;
- (TabCollectionViewSpringLoadingBehavior)init;
- (void)interaction:(id)a3 didChangeWithContext:(id)a4;
- (void)interactionDidFinish:(id)a3;
- (void)setTabView:(id)a3;
@end

@implementation TabCollectionViewSpringLoadingBehavior

+ (void)addSpringLoadedInteractionToTabView:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(TabCollectionViewSpringLoadingBehavior);
  [(TabCollectionViewSpringLoadingBehavior *)v4 setTabView:v3];
  objc_initWeak(&location, v3);
  v5 = [v3 view];
  id v6 = objc_alloc(MEMORY[0x1E4FB1C50]);
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  v10 = __78__TabCollectionViewSpringLoadingBehavior_addSpringLoadedInteractionToTabView___block_invoke;
  v11 = &unk_1E6D7F0D0;
  objc_copyWeak(&v12, &location);
  v7 = (void *)[v6 initWithInteractionBehavior:v4 interactionEffect:v4 activationHandler:&v8];
  objc_msgSend(v5, "addInteraction:", v7, v8, v9, v10, v11);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)setTabView:(id)a3
{
}

- (TabCollectionViewSpringLoadingBehavior)init
{
  v8.receiver = self;
  v8.super_class = (Class)TabCollectionViewSpringLoadingBehavior;
  v2 = [(TabCollectionViewSpringLoadingBehavior *)&v8 init];
  uint64_t v3 = [MEMORY[0x1E4FB1C50] _defaultInteractionBehavior];
  behavior = v2->_behavior;
  v2->_behavior = (UISpringLoadedInteractionBehavior *)v3;

  uint64_t v5 = [MEMORY[0x1E4FB1C50] _blinkEffect];
  effect = v2->_effect;
  v2->_effect = (UISpringLoadedInteractionEffect *)v5;

  return v2;
}

void __78__TabCollectionViewSpringLoadingBehavior_addSpringLoadedInteractionToTabView___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = (id *)(a1 + 32);
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(v3);
  uint64_t v5 = [WeakRetained view];
  [v4 locationInView:v5];
  double v7 = v6;
  double v9 = v8;

  v10 = objc_msgSend(WeakRetained, "itemAtPoint:", v7, v9);
  if (v10) {
    [WeakRetained activateItem:v10];
  }
}

- (BOOL)shouldAllowInteraction:(id)a3 withContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tabView);
  if ((objc_opt_respondsToSelector() & 1) != 0 && [WeakRetained presentationState] != 2)
  {
    LOBYTE(self) = 0;
  }
  else
  {
    double v9 = [WeakRetained view];
    [v7 locationInView:v9];
    double v11 = v10;
    double v13 = v12;

    v14 = objc_msgSend(WeakRetained, "itemAtPoint:", v11, v13);
    if ((objc_opt_respondsToSelector() & 1) != 0
      && ![WeakRetained shouldSpringLoadItem:v14])
    {
      LOBYTE(self) = 0;
    }
    else
    {
      [v7 setTargetItem:v14];
      int v15 = [(UISpringLoadedInteractionBehavior *)self->_behavior shouldAllowInteraction:v6 withContext:v7];
      LOBYTE(self) = 0;
      if (v15 && v14) {
        LODWORD(self) = [v14 isPlaceholder] ^ 1;
      }
    }
  }
  return (char)self;
}

- (void)interactionDidFinish:(id)a3
{
}

- (void)interaction:(id)a3 didChangeWithContext:(id)a4
{
  id v10 = a4;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tabView);
  double v8 = [v10 targetItem];
  if (v8)
  {
    double v9 = [WeakRetained viewForItem:v8];
    [v10 setTargetView:v9];
  }
  else
  {
    [v10 setTargetView:0];
  }
  [(UISpringLoadedInteractionEffect *)self->_effect interaction:v6 didChangeWithContext:v10];
}

- (TabCollectionView)tabView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tabView);
  return (TabCollectionView *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tabView);
  objc_storeStrong((id *)&self->_effect, 0);
  objc_storeStrong((id *)&self->_behavior, 0);
}

@end
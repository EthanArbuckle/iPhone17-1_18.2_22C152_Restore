@interface SFUnifiedTabBarItemViewRegistration
- (SFUnifiedTabBarItemViewRegistration)initWithViewProvider:(id)a3 configurationHandler:(id)a4;
- (id)createItemView;
- (id)dequeueOrCreateViewForItem:(id)a3 isPreview:(BOOL)a4;
- (void)configureView:(id)a3 forItem:(id)a4 inArrangement:(id)a5 isPreview:(BOOL)a6;
- (void)enqueueItemView:(id)a3;
@end

@implementation SFUnifiedTabBarItemViewRegistration

- (SFUnifiedTabBarItemViewRegistration)initWithViewProvider:(id)a3 configurationHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)SFUnifiedTabBarItemViewRegistration;
  v8 = [(SFUnifiedTabBarItemViewRegistration *)&v17 init];
  if (v8)
  {
    v9 = _Block_copy(v7);
    id configurationHandler = v8->_configurationHandler;
    v8->_id configurationHandler = v9;

    v11 = _Block_copy(v6);
    id viewProvider = v8->_viewProvider;
    v8->_id viewProvider = v11;

    uint64_t v13 = [MEMORY[0x1E4F1CA48] array];
    viewReuseStack = v8->_viewReuseStack;
    v8->_viewReuseStack = (NSMutableArray *)v13;

    v15 = v8;
  }

  return v8;
}

- (id)dequeueOrCreateViewForItem:(id)a3 isPreview:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = v6;
  if (v4) {
    [v6 reusablePreviewView];
  }
  else {
  v8 = [v6 reusableView];
  }
  if (!v8)
  {
    uint64_t v9 = [(NSMutableArray *)self->_viewReuseStack lastObject];
    if (v9)
    {
      v8 = (void *)v9;
      [(NSMutableArray *)self->_viewReuseStack removeLastObject];
    }
    else
    {
      v8 = (*((void (**)(void))self->_viewProvider + 2))();
    }
    if (v4) {
      [v7 setReusablePreviewView:v8];
    }
    else {
      [v7 setReusableView:v8];
    }
    [v8 setItem:v7];
    [v8 prepareForReuse];
  }
  id v10 = v8;

  return v10;
}

- (id)createItemView
{
  return (id)(*((uint64_t (**)(void))self->_viewProvider + 2))();
}

- (void)enqueueItemView:(id)a3
{
}

- (void)configureView:(id)a3 forItem:(id)a4 inArrangement:(id)a5 isPreview:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = (void *)MEMORY[0x1E4FB1EB0];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __85__SFUnifiedTabBarItemViewRegistration_configureView_forItem_inArrangement_isPreview___block_invoke;
  v17[3] = &unk_1E54E9F30;
  v17[4] = self;
  id v18 = v10;
  id v19 = v11;
  id v20 = v12;
  BOOL v21 = a6;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  [v13 performWithoutAnimation:v17];
}

uint64_t __85__SFUnifiedTabBarItemViewRegistration_configureView_forItem_inArrangement_isPreview___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  if (v2) {
    (*(void (**)(uint64_t, void, void, void, void))(v2 + 16))(v2, *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(unsigned __int8 *)(a1 + 64));
  }
  uint64_t v4 = *(void *)(a1 + 40);
  v3 = *(void **)(a1 + 48);
  uint64_t v5 = *(unsigned __int8 *)(a1 + 64);

  return [v3 configureItemView:v4 isPreview:v5];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewReuseStack, 0);
  objc_storeStrong(&self->_viewProvider, 0);

  objc_storeStrong(&self->_configurationHandler, 0);
}

@end
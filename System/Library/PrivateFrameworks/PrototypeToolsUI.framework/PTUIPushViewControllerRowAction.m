@interface PTUIPushViewControllerRowAction
+ (id)actionWithViewControllerCreator:(id)a3;
- (BOOL)deselectsRowOnSuccess;
- (id)defaultHandler;
- (id)viewControllerCreator;
@end

@implementation PTUIPushViewControllerRowAction

+ (id)actionWithViewControllerCreator:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v5 = [v3 copy];

  v6 = (void *)v4[3];
  v4[3] = v5;

  return v4;
}

- (BOOL)deselectsRowOnSuccess
{
  return 0;
}

- (id)defaultHandler
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __49__PTUIPushViewControllerRowAction_defaultHandler__block_invoke;
  v4[3] = &unk_26425ED70;
  v4[4] = self;
  v2 = (void *)MEMORY[0x2166C6A80](v4, a2);

  return v2;
}

uint64_t __49__PTUIPushViewControllerRowAction_defaultHandler__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 24);
  if (v7
    && ((*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6), (uint64_t v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v9 = (void *)v8;
    v10 = [v6 navigationController];
    uint64_t v11 = 1;
    [v10 pushViewController:v9 animated:1];
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (id)viewControllerCreator
{
  return self->_viewControllerCreator;
}

- (void).cxx_destruct
{
}

@end
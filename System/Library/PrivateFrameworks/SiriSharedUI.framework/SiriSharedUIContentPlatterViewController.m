@interface SiriSharedUIContentPlatterViewController
- (BOOL)_canShowWhileLocked;
- (NSArray)contentViewControllers;
- (SiriSharedUIContentPlatterView)contentPlatterView;
- (void)appendSeparatorToViewControllers:(id)a3 forNextViewController:(id)a4;
- (void)loadView;
- (void)setContentViewControllers:(id)a3;
@end

@implementation SiriSharedUIContentPlatterViewController

- (void)loadView
{
  v3 = objc_alloc_init(SiriSharedUIContentPlatterView);
  [(SiriSharedUIContentPlatterViewController *)self setView:v3];
}

- (void)setContentViewControllers:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  v5 = (NSArray *)a3;
  contentViewControllers = self->_contentViewControllers;
  if (contentViewControllers != v5)
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    v7 = contentViewControllers;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v28 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          [v12 removeFromParentViewController];
          v13 = [v12 view];
          [v13 removeFromSuperview];

          [v12 didMoveToParentViewController:0];
        }
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v9);
    }

    objc_storeStrong((id *)&self->_contentViewControllers, a3);
    v14 = objc_opt_new();
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v15 = self->_contentViewControllers;
    uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v24;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v24 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = *(void **)(*((void *)&v23 + 1) + 8 * j);
          -[SiriSharedUIContentPlatterViewController addChildViewController:](self, "addChildViewController:", v20, (void)v23);
          [v20 didMoveToParentViewController:self];
          v21 = [v20 view];
          [v14 addObject:v21];
        }
        uint64_t v17 = [(NSArray *)v15 countByEnumeratingWithState:&v23 objects:v31 count:16];
      }
      while (v17);
    }

    v22 = [(SiriSharedUIContentPlatterViewController *)self contentPlatterView];
    [v22 setContentViews:v14];
  }
}

- (void)appendSeparatorToViewControllers:(id)a3 forNextViewController:(id)a4
{
  id v12 = a4;
  v5 = (objc_class *)MEMORY[0x263F82E10];
  id v6 = a3;
  id v7 = objc_alloc_init(v5);
  uint64_t v8 = objc_alloc_init(SiriSharedUIContentPlatterSeparatorView);
  uint64_t v9 = [v12 aceObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
  }
  else
  {
    uint64_t v10 = [v12 aceObject];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      goto LABEL_5;
    }
  }
  [(SiriSharedUIContentPlatterSeparatorView *)v8 setSeparatorType:1];
LABEL_5:
  [v7 setView:v8];
  [v6 addObject:v7];
}

- (SiriSharedUIContentPlatterView)contentPlatterView
{
  v2 = [(SiriSharedUIContentPlatterViewController *)self view];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  v4 = v3;

  return v4;
}

- (BOOL)_canShowWhileLocked
{
  v2 = [MEMORY[0x263F75488] sharedInstance];
  char v3 = [v2 isSiriSafeForLockScreen];

  return v3;
}

- (NSArray)contentViewControllers
{
  return self->_contentViewControllers;
}

- (void).cxx_destruct
{
}

@end
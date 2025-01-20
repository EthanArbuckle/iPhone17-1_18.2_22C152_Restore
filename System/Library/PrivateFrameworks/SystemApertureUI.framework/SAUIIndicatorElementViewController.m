@interface SAUIIndicatorElementViewController
+ (void)initialize;
- (BOOL)_canShowWhileLocked;
- (BOOL)handleLongPress:(id)a3;
- (BOOL)handleTap:(id)a3;
- (SAUIIndicatorElementViewController)initWithIndicatorElementViewProvider:(id)a3;
- (SAUIIndicatorElementViewProviding)elementViewProvider;
- (SAUILayoutHosting)layoutHost;
- (int64_t)handleElementLongPress:(id)a3;
- (int64_t)handleElementTap:(id)a3;
- (void)_enumerateObserversRespondingToSelector:(SEL)a3 usingBlock:(id)a4;
- (void)addElementViewControllingObserver:(id)a3;
- (void)removeElementViewControllingObserver:(id)a3;
- (void)setLayoutHost:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation SAUIIndicatorElementViewController

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SAUIIndicatorElementViewController;
  [(SAUIIndicatorElementViewController *)&v5 viewDidAppear:a3];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __52__SAUIIndicatorElementViewController_viewDidAppear___block_invoke;
  v4[3] = &unk_26552BBA0;
  v4[4] = self;
  [(SAUIIndicatorElementViewController *)self _enumerateObserversRespondingToSelector:sel_elementViewControllingDidAppear_ usingBlock:v4];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SAUIIndicatorElementViewController;
  [(SAUIIndicatorElementViewController *)&v5 viewWillAppear:a3];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __53__SAUIIndicatorElementViewController_viewWillAppear___block_invoke;
  v4[3] = &unk_26552BBA0;
  v4[4] = self;
  [(SAUIIndicatorElementViewController *)self _enumerateObserversRespondingToSelector:sel_elementViewControllingWillAppear_ usingBlock:v4];
}

- (void)_enumerateObserversRespondingToSelector:(SEL)a3 usingBlock:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  objc_super v5 = (void (**)(id, void))a4;
  if (v5)
  {
    v6 = self->_observers;
    objc_sync_enter(v6);
    v7 = (void *)[(NSHashTable *)self->_observers copy];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v14;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v12 = *(void *)(*((void *)&v13 + 1) + 8 * v11);
          if (objc_opt_respondsToSelector()) {
            v5[2](v5, v12);
          }
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v9);
    }

    objc_sync_exit(v6);
  }
}

uint64_t __53__SAUIIndicatorElementViewController_viewWillAppear___block_invoke(uint64_t a1, void *a2)
{
  return [a2 elementViewControllingWillAppear:*(void *)(a1 + 32)];
}

uint64_t __52__SAUIIndicatorElementViewController_viewDidAppear___block_invoke(uint64_t a1, void *a2)
{
  return [a2 elementViewControllingDidAppear:*(void *)(a1 + 32)];
}

- (SAUIIndicatorElementViewProviding)elementViewProvider
{
  return self->_elementViewProvider;
}

- (void)addElementViewControllingObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v6 = v4;
    objc_super v5 = self->_observers;
    objc_sync_enter(v5);
    [(NSHashTable *)self->_observers addObject:v6];
    objc_sync_exit(v5);

    id v4 = v6;
  }
}

- (void)setLayoutHost:(id)a3
{
}

- (SAUIIndicatorElementViewController)initWithIndicatorElementViewProvider:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    uint64_t v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"SAUIIndicatorElementViewController.m", 35, @"Invalid parameter not satisfying: %@", @"elementViewProvider" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)SAUIIndicatorElementViewController;
  v7 = [(SAUIIndicatorElementViewController *)&v13 initWithNibName:0 bundle:0];
  id v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_elementViewProvider, a3);
    uint64_t v9 = [MEMORY[0x263F088B0] hashTableWithOptions:517];
    observers = v8->_observers;
    v8->_observers = (NSHashTable *)v9;
  }
  return v8;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)SAUIIndicatorElementViewController;
  [(SAUIIndicatorElementViewController *)&v5 viewDidLoad];
  v3 = [(SAUIIndicatorElementViewController *)self view];
  id v4 = [(SAUIIndicatorElementViewProviding *)self->_elementViewProvider indicatorView];
  [v3 addSubview:v4];
}

- (void)viewWillLayoutSubviews
{
  v22.receiver = self;
  v22.super_class = (Class)SAUIIndicatorElementViewController;
  [(SAUIIndicatorElementViewController *)&v22 viewWillLayoutSubviews];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutHost);
  id v4 = [(SAUIIndicatorElementViewController *)self view];
  [WeakRetained interSensorRegionInContentView:v4];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;

  v23.origin.x = v6;
  v23.origin.y = v8;
  v23.size.width = v10;
  v23.size.height = v12;
  CGRectGetWidth(v23);
  v24.origin.x = v6;
  v24.origin.y = v8;
  v24.size.width = v10;
  v24.size.height = v12;
  CGRectGetHeight(v24);
  UIRectCenteredYInRectScale();
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  v21 = [(SAUIIndicatorElementViewProviding *)self->_elementViewProvider indicatorView];
  objc_msgSend(v21, "setFrame:", v14, v16, v18, v20);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    SAUIRegisterSystemApertureLogging();
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SAUIIndicatorElementViewController;
  [(SAUIIndicatorElementViewController *)&v5 viewWillDisappear:a3];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __56__SAUIIndicatorElementViewController_viewWillDisappear___block_invoke;
  v4[3] = &unk_26552BBA0;
  v4[4] = self;
  [(SAUIIndicatorElementViewController *)self _enumerateObserversRespondingToSelector:sel_elementViewControllingWillDisappear_ usingBlock:v4];
}

uint64_t __56__SAUIIndicatorElementViewController_viewWillDisappear___block_invoke(uint64_t a1, void *a2)
{
  return [a2 elementViewControllingWillDisappear:*(void *)(a1 + 32)];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SAUIIndicatorElementViewController;
  [(SAUIIndicatorElementViewController *)&v5 viewDidDisappear:a3];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __55__SAUIIndicatorElementViewController_viewDidDisappear___block_invoke;
  v4[3] = &unk_26552BBA0;
  v4[4] = self;
  [(SAUIIndicatorElementViewController *)self _enumerateObserversRespondingToSelector:sel_elementViewControllingDidDisappear_ usingBlock:v4];
}

uint64_t __55__SAUIIndicatorElementViewController_viewDidDisappear___block_invoke(uint64_t a1, void *a2)
{
  return [a2 elementViewControllingDidDisappear:*(void *)(a1 + 32)];
}

- (int64_t)handleElementTap:(id)a3
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  if ([(SAUIIndicatorElementViewProviding *)self->_elementViewProvider handleElementViewEvent:0])return 2; {
  return 0;
  }
}

- (int64_t)handleElementLongPress:(id)a3
{
  return 0;
}

- (BOOL)handleTap:(id)a3
{
  return [(SAUIIndicatorElementViewController *)self handleElementTap:a3] != 0;
}

- (BOOL)handleLongPress:(id)a3
{
  return [(SAUIIndicatorElementViewController *)self handleElementLongPress:a3] != 0;
}

- (void)removeElementViewControllingObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v6 = v4;
    objc_super v5 = self->_observers;
    objc_sync_enter(v5);
    [(NSHashTable *)self->_observers removeObject:v6];
    objc_sync_exit(v5);

    id v4 = v6;
  }
}

- (SAUILayoutHosting)layoutHost
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutHost);
  return (SAUILayoutHosting *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_layoutHost);
  objc_storeStrong((id *)&self->_elementViewProvider, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
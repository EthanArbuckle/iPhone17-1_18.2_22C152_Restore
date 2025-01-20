@interface NAUIUIViewControllerNoticationObserver
- (NAUIUIViewControllerNoticationObserver)init;
- (UIViewController)viewController;
- (void)dealloc;
- (void)setViewController:(id)a3;
@end

@implementation NAUIUIViewControllerNoticationObserver

- (NAUIUIViewControllerNoticationObserver)init
{
  v20.receiver = self;
  v20.super_class = (Class)NAUIUIViewControllerNoticationObserver;
  v2 = [(NAUIUIViewControllerNoticationObserver *)&v20 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF980] array];
    observations = v2->_observations;
    v2->_observations = (NSMutableArray *)v3;

    objc_initWeak(&location, v2);
    v5 = [MEMORY[0x263F08A00] defaultCenter];
    v6 = v2->_observations;
    v7 = [MEMORY[0x263F08A48] mainQueue];
    uint64_t v8 = *MEMORY[0x263F1D0D0];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __46__NAUIUIViewControllerNoticationObserver_init__block_invoke;
    v17[3] = &unk_264627D38;
    objc_copyWeak(&v18, &location);
    v9 = [v5 addObserverForName:v8 object:0 queue:v7 usingBlock:v17];
    [(NSMutableArray *)v6 addObject:v9];

    v10 = v2->_observations;
    v11 = [MEMORY[0x263F08A48] mainQueue];
    uint64_t v12 = *MEMORY[0x263F1D050];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __46__NAUIUIViewControllerNoticationObserver_init__block_invoke_2;
    v15[3] = &unk_264627D38;
    objc_copyWeak(&v16, &location);
    v13 = [v5 addObserverForName:v12 object:0 queue:v11 usingBlock:v15];
    [(NSMutableArray *)v10 addObject:v13];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&v18);

    objc_destroyWeak(&location);
  }
  return v2;
}

void __46__NAUIUIViewControllerNoticationObserver_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained viewController];
  objc_msgSend(v1, "naui_applicationWillEnterForeground");
}

void __46__NAUIUIViewControllerNoticationObserver_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained viewController];
  objc_msgSend(v1, "naui_applicationDidEnterBackground");
}

- (void)dealloc
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v3 = self->_observations;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * v7);
        v9 = [MEMORY[0x263F08A00] defaultCenter];
        [v9 removeObserver:v8];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  v10.receiver = self;
  v10.super_class = (Class)NAUIUIViewControllerNoticationObserver;
  [(NAUIUIViewControllerNoticationObserver *)&v10 dealloc];
}

- (UIViewController)viewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  return (UIViewController *)WeakRetained;
}

- (void)setViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_viewController);
  objc_storeStrong((id *)&self->_observations, 0);
}

@end
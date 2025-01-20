@interface ConvertToESIMSpecifierCache
- (BOOL)isViewControllerPopNeeded;
- (ConvertToESIMSpecifierCache)initWithDelegate:(id)a3 isViewControllerPopNeeded:(BOOL)a4 odcFlow:(id)a5 delegate:(id)a6 iccid:(id)a7;
- (NSString)iccid;
- (PSUILocalConvertModelDelegate)delegate;
- (TSSIMSetupFlow)flow;
- (UINavigationController)navigationController;
- (id)getLogger;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setFlow:(id)a3;
- (void)setIccid:(id)a3;
- (void)setIsViewControllerPopNeeded:(BOOL)a3;
- (void)setNavigationController:(id)a3;
- (void)simSetupFlowCompleted:(unint64_t)a3;
@end

@implementation ConvertToESIMSpecifierCache

- (ConvertToESIMSpecifierCache)initWithDelegate:(id)a3 isViewControllerPopNeeded:(BOOL)a4 odcFlow:(id)a5 delegate:(id)a6 iccid:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v16 = [(ConvertToESIMSpecifierCache *)self getLogger];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_221B17000, v16, OS_LOG_TYPE_DEFAULT, "in initWithSpecifer for ConvertToESIMSpecifierCache\n", buf, 2u);
  }

  v20.receiver = self;
  v20.super_class = (Class)ConvertToESIMSpecifierCache;
  v17 = [(ConvertToESIMSpecifierCache *)&v20 init];
  v18 = v17;
  if (v17)
  {
    objc_storeWeak((id *)&v17->_navigationController, v12);
    objc_storeStrong((id *)&v18->_flow, a5);
    v18->_isViewControllerPopNeeded = a4;
    objc_storeStrong((id *)&v18->_iccid, a7);
    objc_storeStrong((id *)&v18->_delegate, a6);
    [(TSSIMSetupFlow *)v18->_flow setDelegate:v18];
  }

  return v18;
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v3 = [(ConvertToESIMSpecifierCache *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    flow = self->_flow;
    *(_DWORD *)buf = 138412290;
    v8 = flow;
    _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "ODC complete releasing SS flow: %@", buf, 0xCu);
  }

  v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 removeObserver:self];

  v6.receiver = self;
  v6.super_class = (Class)ConvertToESIMSpecifierCache;
  [(ConvertToESIMSpecifierCache *)&v6 dealloc];
}

- (void)simSetupFlowCompleted:(unint64_t)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v5 = [(ConvertToESIMSpecifierCache *)self getLogger];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(void *)&uint8_t buf[4] = a3;
    _os_log_impl(&dword_221B17000, v5, OS_LOG_TYPE_DEFAULT, "ConvertToESIMSpecifierCache simSetupFlowCompleted with completionType:%ld", buf, 0xCu);
  }

  *(void *)buf = 0;
  objc_initWeak((id *)buf, self);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__ConvertToESIMSpecifierCache_simSetupFlowCompleted___block_invoke;
  block[3] = &unk_2645E0E18;
  objc_copyWeak(v7, (id *)buf);
  v7[1] = (id)a3;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(v7);
  objc_destroyWeak((id *)buf);
}

void __53__ConvertToESIMSpecifierCache_simSetupFlowCompleted___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = objc_loadWeakRetained(WeakRetained + 4);
    [v4 dismissViewControllerAnimated:1 completion:0];

    uint64_t v5 = *(void *)(a1 + 48);
    if (v5 == 1)
    {
      objc_super v6 = [*(id *)(a1 + 32) getLogger];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_221B17000, v6, OS_LOG_TYPE_DEFAULT, "ConvertToESIMSpecifierCache The odc flow was canceled", buf, 2u);
      }

      [v3[2] odcCanceled:v3[5]];
      uint64_t v5 = *(void *)(a1 + 48);
    }
    if (v5 == 3)
    {
      v7 = [*(id *)(a1 + 32) getLogger];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_221B17000, v7, OS_LOG_TYPE_DEFAULT, "ConvertToESIMSpecifierCache The odc flow failed", v11, 2u);
      }

      [v3[2] odcFailed:v3[5]];
      uint64_t v5 = *(void *)(a1 + 48);
    }
    if (v5 == 2)
    {
      v8 = [*(id *)(a1 + 32) getLogger];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v10[0] = 0;
        _os_log_impl(&dword_221B17000, v8, OS_LOG_TYPE_DEFAULT, "ConvertToESIMSpecifierCache The odc flow succeeded", (uint8_t *)v10, 2u);
      }

      [v3[2] odcSuccess:v3[5] isViewControllerPopNeeded:*((unsigned __int8 *)v3 + 8)];
    }
    id v9 = v3[3];
    v3[3] = 0;

    objc_storeWeak(v3 + 4, 0);
    *((unsigned char *)v3 + 8) = 0;
  }
}

- (id)getLogger
{
  return (id)[MEMORY[0x263F67EB0] loggerWithCategory:@"odc.cache"];
}

- (PSUILocalConvertModelDelegate)delegate
{
  return (PSUILocalConvertModelDelegate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDelegate:(id)a3
{
}

- (TSSIMSetupFlow)flow
{
  return (TSSIMSetupFlow *)objc_getProperty(self, a2, 24, 1);
}

- (void)setFlow:(id)a3
{
}

- (UINavigationController)navigationController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationController);
  return (UINavigationController *)WeakRetained;
}

- (void)setNavigationController:(id)a3
{
}

- (BOOL)isViewControllerPopNeeded
{
  return self->_isViewControllerPopNeeded;
}

- (void)setIsViewControllerPopNeeded:(BOOL)a3
{
  self->_isViewControllerPopNeeded = a3;
}

- (NSString)iccid
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setIccid:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iccid, 0);
  objc_destroyWeak((id *)&self->_navigationController);
  objc_storeStrong((id *)&self->_flow, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end
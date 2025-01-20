@interface CloudTabsForYouDataSource
- (CloudTabsForYouDataSource)initWithTabStore:(id)a3;
- (void)_cloudTabsDidUpdate:(id)a3;
- (void)dealloc;
@end

@implementation CloudTabsForYouDataSource

- (CloudTabsForYouDataSource)initWithTabStore:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CloudTabsForYouDataSource;
  v6 = [(WBSForYouCloudTabsDataSource *)&v11 initWithTabStore:v5];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_cloudTabStore, a3);
    v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 addObserver:v7 selector:sel__cloudTabsDidUpdate_ name:@"CloudTabStoreDidUpdateNotification" object:0];

    v9 = v7;
  }

  return v7;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CloudTabsForYouDataSource;
  [(CloudTabsForYouDataSource *)&v4 dealloc];
}

- (void)_cloudTabsDidUpdate:(id)a3
{
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __49__CloudTabsForYouDataSource__cloudTabsDidUpdate___block_invoke;
  v3[3] = &unk_1E6D78630;
  objc_copyWeak(&v4, &location);
  dispatch_async(MEMORY[0x1E4F14428], v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __49__CloudTabsForYouDataSource__cloudTabsDidUpdate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained notifyContentsDidChangeFromSource:4];
}

- (void).cxx_destruct
{
}

@end
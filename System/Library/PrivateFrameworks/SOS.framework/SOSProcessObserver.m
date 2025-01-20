@interface SOSProcessObserver
+ (BOOL)isApplicationStateRunning:(unsigned int)a3;
- (BKSApplicationStateMonitor)applicationMonitor;
- (BOOL)cachedApplicationRunning;
- (SOSProcessObserver)initWithBundleIdentifier:(id)a3;
- (SOSProcessObserverDelegate)delegate;
- (void)applicationMonitorStateDidChangeForBundleIdentifier:(id)a3;
- (void)dealloc;
- (void)setCachedApplicationRunning:(BOOL)a3;
- (void)setDelegate:(id)a3;
@end

@implementation SOSProcessObserver

- (SOSProcessObserver)initWithBundleIdentifier:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SOSProcessObserver;
  v5 = [(SOSProcessObserver *)&v14 init];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F4E278]);
    v15[0] = v4;
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    uint64_t v8 = [v6 initWithBundleIDs:v7 states:0];
    applicationMonitor = v5->_applicationMonitor;
    v5->_applicationMonitor = (BKSApplicationStateMonitor *)v8;

    objc_initWeak(&location, v5);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __47__SOSProcessObserver_initWithBundleIdentifier___block_invoke;
    v11[3] = &unk_1E6064C08;
    objc_copyWeak(&v12, &location);
    [(BKSApplicationStateMonitor *)v5->_applicationMonitor setHandler:v11];
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

  return v5;
}

void __47__SOSProcessObserver_initWithBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F4E230]];
    [WeakRetained applicationMonitorStateDidChangeForBundleIdentifier:v4];
  }
}

- (void)dealloc
{
  v3 = [(SOSProcessObserver *)self applicationMonitor];
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)SOSProcessObserver;
  [(SOSProcessObserver *)&v4 dealloc];
}

- (void)applicationMonitorStateDidChangeForBundleIdentifier:(id)a3
{
  id v9 = a3;
  objc_super v4 = objc_opt_class();
  id v5 = [(SOSProcessObserver *)self applicationMonitor];
  uint64_t v6 = objc_msgSend(v4, "isApplicationStateRunning:", objc_msgSend(v5, "applicationStateForApplication:", v9));

  if (v6 != [(SOSProcessObserver *)self cachedApplicationRunning])
  {
    [(SOSProcessObserver *)self setCachedApplicationRunning:v6];
    v7 = [(SOSProcessObserver *)self delegate];

    if (v7)
    {
      uint64_t v8 = [(SOSProcessObserver *)self delegate];
      [v8 processObserver:self bundleIdentifier:v9 didUpdateApplicationRunning:v6];
    }
  }
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    if (obj)
    {
      id v5 = objc_opt_class();
      uint64_t v6 = [(SOSProcessObserver *)self applicationMonitor];
      v7 = [(SOSProcessObserver *)self applicationMonitor];
      uint64_t v8 = [v7 interestedBundleIDs];
      id v9 = [v8 firstObject];
      -[SOSProcessObserver setCachedApplicationRunning:](self, "setCachedApplicationRunning:", objc_msgSend(v5, "isApplicationStateRunning:", objc_msgSend(v6, "applicationStateForApplication:", v9)));

      v10 = [(SOSProcessObserver *)self applicationMonitor];
      v11 = v10;
      uint64_t v12 = *MEMORY[0x1E4F4E220];
    }
    else
    {
      v10 = [(SOSProcessObserver *)self applicationMonitor];
      v11 = v10;
      uint64_t v12 = 0;
    }
    [v10 updateInterestedStates:v12];
  }

  MEMORY[0x1F41817F8]();
}

+ (BOOL)isApplicationStateRunning:(unsigned int)a3
{
  return a3 > 4 || (a3 & 0x1F) == 3;
}

- (SOSProcessObserverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SOSProcessObserverDelegate *)WeakRetained;
}

- (BKSApplicationStateMonitor)applicationMonitor
{
  return self->_applicationMonitor;
}

- (BOOL)cachedApplicationRunning
{
  return self->_cachedApplicationRunning;
}

- (void)setCachedApplicationRunning:(BOOL)a3
{
  self->_cachedApplicationRunning = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationMonitor, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end
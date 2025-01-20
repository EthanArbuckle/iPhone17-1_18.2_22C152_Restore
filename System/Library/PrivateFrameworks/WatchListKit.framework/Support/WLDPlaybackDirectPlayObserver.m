@interface WLDPlaybackDirectPlayObserver
- (BOOL)_getAppRunningState;
- (BOOL)appIsRunning;
- (NSString)bundleID;
- (RBSProcessMonitor)stateMonitor;
- (WLDPlaybackDirectPlayObserver)initWithBundleID:(id)a3;
- (WLKTransactionScope)transaction;
- (id)_identifier;
- (id)updateHandler;
- (void)_startObserving;
- (void)_stopObserving;
- (void)dealloc;
- (void)setAppIsRunning:(BOOL)a3;
- (void)setBundleID:(id)a3;
- (void)setStateMonitor:(id)a3;
- (void)setTransaction:(id)a3;
- (void)setUpdateHandler:(id)a3;
@end

@implementation WLDPlaybackDirectPlayObserver

- (WLDPlaybackDirectPlayObserver)initWithBundleID:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WLDPlaybackDirectPlayObserver;
  v5 = [(WLDPlaybackDirectPlayObserver *)&v8 init];
  v6 = v5;
  if (v5)
  {
    [(WLDPlaybackDirectPlayObserver *)v5 setBundleID:v4];
    [(WLDPlaybackDirectPlayObserver *)v6 setAppIsRunning:0];
    [(WLDPlaybackDirectPlayObserver *)v6 _startObserving];
  }

  return v6;
}

- (void)dealloc
{
  [(WLDPlaybackDirectPlayObserver *)self _stopObserving];
  v3.receiver = self;
  v3.super_class = (Class)WLDPlaybackDirectPlayObserver;
  [(WLDPlaybackDirectPlayObserver *)&v3 dealloc];
}

- (void)_startObserving
{
  objc_super v3 = [(WLDPlaybackDirectPlayObserver *)self bundleID];
  NSLog(@"WLDPlaybackDirectPlayObserver: Start Observing (%@)", v3);

  objc_initWeak(&location, self);
  [(WLDPlaybackDirectPlayObserver *)self bundleID];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __48__WLDPlaybackDirectPlayObserver__startObserving__block_invoke;
  v6[3] = &unk_100045A70;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = v4;
  objc_copyWeak(&v9, &location);
  objc_super v8 = self;
  v5 = +[RBSProcessMonitor monitorWithConfiguration:v6];
  [(WLDPlaybackDirectPlayObserver *)self setStateMonitor:v5];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __48__WLDPlaybackDirectPlayObserver__startObserving__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[RBSProcessStateDescriptor descriptor];
  [v4 setValues:1];
  [v3 setStateDescriptor:v4];
  v5 = +[RBSProcessPredicate predicateMatchingBundleIdentifier:*(void *)(a1 + 32)];
  id v9 = v5;
  v6 = +[NSArray arrayWithObjects:&v9 count:1];
  [v3 setPredicates:v6];

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __48__WLDPlaybackDirectPlayObserver__startObserving__block_invoke_2;
  v7[3] = &unk_100045A48;
  objc_copyWeak(&v8, (id *)(a1 + 48));
  v7[4] = *(void *)(a1 + 40);
  [v3 setUpdateHandler:v7];
  objc_destroyWeak(&v8);
}

void __48__WLDPlaybackDirectPlayObserver__startObserving__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    id v3 = [WeakRetained _getAppRunningState];
    CFStringRef v4 = @"NO";
    if (v3) {
      CFStringRef v4 = @"YES";
    }
    NSLog(@"WLDPlaybackDirectPlayObserver: _handleStateChange: appIsRunning: %@", v4);
    [*(id *)(a1 + 32) setAppIsRunning:v3];
    id WeakRetained = v5;
  }
}

- (void)_stopObserving
{
  NSLog(@"WLDPlaybackDirectPlayObserver: Stop Observing", a2);
  id v3 = [(WLDPlaybackDirectPlayObserver *)self stateMonitor];
  [v3 invalidate];

  [(WLDPlaybackDirectPlayObserver *)self setStateMonitor:0];
}

- (void)setAppIsRunning:(BOOL)a3
{
  if (self->_appIsRunning != a3)
  {
    self->_appIsRunning = a3;
    if (a3)
    {
      id v4 = objc_alloc((Class)WLKTransactionScope);
      id v5 = [(WLDPlaybackDirectPlayObserver *)self _identifier];
      id v6 = [v4 initWithIdentifier:v5 delay:10.0];

      [(WLDPlaybackDirectPlayObserver *)self setTransaction:v6];
    }
    else
    {
      [(WLDPlaybackDirectPlayObserver *)self setTransaction:0];
    }
    id v7 = [(WLDPlaybackDirectPlayObserver *)self updateHandler];

    if (v7)
    {
      id v8 = (void (*)(void))*((void *)self->_updateHandler + 2);
      v8();
    }
  }
}

- (BOOL)_getAppRunningState
{
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v3 = [(WLDPlaybackDirectPlayObserver *)self stateMonitor];
  id v4 = [v3 states];

  id obj = v4;
  id v5 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v20;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v20 != v7) {
        objc_enumerationMutation(obj);
      }
      id v9 = *(void **)(*((void *)&v19 + 1) + 8 * v8);
      v10 = [v9 process];
      v11 = [v10 bundle];
      v12 = [v11 identifier];
      v13 = [(WLDPlaybackDirectPlayObserver *)self bundleID];
      unsigned __int8 v14 = [v12 isEqualToString:v13];

      if (v14) {
        break;
      }
      if (v6 == (id)++v8)
      {
        id v6 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v15 = v9;

    if (!v15) {
      goto LABEL_12;
    }
    unsigned __int8 v16 = [v15 isRunning];
  }
  else
  {
LABEL_9:

LABEL_12:
    id v15 = [(WLDPlaybackDirectPlayObserver *)self bundleID];
    NSLog(@"WLDPlaybackDirectPlayObserver: No process state matching %@", v15);
    unsigned __int8 v16 = 0;
  }

  return v16;
}

- (id)_identifier
{
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = [(WLDPlaybackDirectPlayObserver *)self bundleID];
  id v6 = +[NSString stringWithFormat:@"%@-%@", v4, v5];

  return v6;
}

- (id)updateHandler
{
  return self->_updateHandler;
}

- (void)setUpdateHandler:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (RBSProcessMonitor)stateMonitor
{
  return self->_stateMonitor;
}

- (void)setStateMonitor:(id)a3
{
}

- (BOOL)appIsRunning
{
  return self->_appIsRunning;
}

- (WLKTransactionScope)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_stateMonitor, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);

  objc_storeStrong(&self->_updateHandler, 0);
}

@end
@interface NPKWifiObserver
- (BOOL)isWifiEnabled;
- (NPKWiFiObserverDelegate)delegate;
- (NPKWifiObserver)initWithCallbackQueue:(id)a3;
- (void)dealloc;
- (void)setDelegate:(id)a3;
@end

@implementation NPKWifiObserver

- (NPKWifiObserver)initWithCallbackQueue:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NPKWifiObserver;
  v5 = [(NPKWifiObserver *)&v10 init];
  if (v5)
  {
    if (v4)
    {
      v6 = (OS_dispatch_queue *)v4;
    }
    else
    {
      dispatch_get_global_queue(0, 0);
      v6 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
    }
    callbackQueue = v5->_callbackQueue;
    v5->_callbackQueue = v6;

    [(NPKWifiObserver *)v5 _setupInterface];
    v8 = v5;
  }

  return v5;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)NPKWifiObserver;
  [(NPKWifiObserver *)&v2 dealloc];
}

- (BOOL)isWifiEnabled
{
  return 1;
}

- (NPKWiFiObserverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NPKWiFiObserverDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
}

@end
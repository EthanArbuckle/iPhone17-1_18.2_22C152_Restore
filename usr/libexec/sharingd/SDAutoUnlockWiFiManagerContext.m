@interface SDAutoUnlockWiFiManagerContext
- (SDAutoUnlockWiFiManager)wiFiManager;
- (SDAutoUnlockWiFiManagerContext)initWithRequest:(id)a3 wiFiManager:(id)a4;
- (SDAutoUnlockWiFiRequest)request;
@end

@implementation SDAutoUnlockWiFiManagerContext

- (SDAutoUnlockWiFiManagerContext)initWithRequest:(id)a3 wiFiManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SDAutoUnlockWiFiManagerContext;
  v9 = [(SDAutoUnlockWiFiManagerContext *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_request, a3);
    objc_storeWeak((id *)&v10->_wiFiManager, v8);
  }

  return v10;
}

- (SDAutoUnlockWiFiRequest)request
{
  return self->_request;
}

- (SDAutoUnlockWiFiManager)wiFiManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_wiFiManager);

  return (SDAutoUnlockWiFiManager *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_wiFiManager);

  objc_storeStrong((id *)&self->_request, 0);
}

@end
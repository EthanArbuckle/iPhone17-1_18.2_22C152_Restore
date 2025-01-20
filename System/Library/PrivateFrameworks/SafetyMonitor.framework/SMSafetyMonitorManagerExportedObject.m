@interface SMSafetyMonitorManagerExportedObject
- (SMSafetyMonitorManager)safetyMonitorManager;
- (SMSafetyMonitorManagerExportedObject)initWithSafetyMonitorManager:(id)a3;
- (void)onInitiatorSafetyCacheChangeForSessionID:(id)a3 phoneCache:(id)a4 watchCache:(id)a5 cacheExpiryDate:(id)a6 cacheReleaseDate:(id)a7;
- (void)onLocalSessionStateChanged:(id)a3 withError:(id)a4;
- (void)onReceiverSafetyCacheChangeForSessionID:(id)a3 phoneCache:(id)a4 watchCache:(id)a5;
- (void)onReceiverSessionStatusChangeForSessionID:(id)a3 sessionStatus:(id)a4;
- (void)onSessionStateChanged:(id)a3 forActiveDevice:(BOOL)a4 withError:(id)a5;
- (void)setSafetyMonitorManager:(id)a3;
@end

@implementation SMSafetyMonitorManagerExportedObject

- (SMSafetyMonitorManagerExportedObject)initWithSafetyMonitorManager:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SMSafetyMonitorManagerExportedObject;
  v5 = [(SMSafetyMonitorManagerExportedObject *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_safetyMonitorManager, v4);
  }

  return v6;
}

- (void)onSessionStateChanged:(id)a3 forActiveDevice:(BOOL)a4 withError:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = [(SMSafetyMonitorManagerExportedObject *)self safetyMonitorManager];
  [v10 onSessionStateChanged:v9 forActiveDevice:v5 withError:v8];
}

- (void)onLocalSessionStateChanged:(id)a3 withError:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SMSafetyMonitorManagerExportedObject *)self safetyMonitorManager];
  [v8 onLocalSessionStateChanged:v7 withError:v6];
}

- (void)onInitiatorSafetyCacheChangeForSessionID:(id)a3 phoneCache:(id)a4 watchCache:(id)a5 cacheExpiryDate:(id)a6 cacheReleaseDate:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = [(SMSafetyMonitorManagerExportedObject *)self safetyMonitorManager];
  [v17 onInitiatorSafetyCacheChangeForSessionID:v16 phoneCache:v15 watchCache:v14 cacheExpiryDate:v13 cacheReleaseDate:v12];
}

- (void)onReceiverSessionStatusChangeForSessionID:(id)a3 sessionStatus:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SMSafetyMonitorManagerExportedObject *)self safetyMonitorManager];
  [v8 onReceiverSessionStatusChangeForSessionID:v7 sessionStatus:v6];
}

- (void)onReceiverSafetyCacheChangeForSessionID:(id)a3 phoneCache:(id)a4 watchCache:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(SMSafetyMonitorManagerExportedObject *)self safetyMonitorManager];
  [v11 onReceiverSafetyCacheChangeForSessionID:v10 phoneCache:v9 watchCache:v8];
}

- (SMSafetyMonitorManager)safetyMonitorManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_safetyMonitorManager);
  return (SMSafetyMonitorManager *)WeakRetained;
}

- (void)setSafetyMonitorManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
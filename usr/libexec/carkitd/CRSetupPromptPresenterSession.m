@interface CRSetupPromptPresenterSession
- (CRSetupPromptPresenterSession)init;
- (CRSetupPromptPresenterSessionDelegate)sessionDelegate;
- (NSProgress)assetProgress;
- (NSXPCConnection)connection;
- (OS_os_transaction)sessionTransaction;
- (id)dismissHandler;
- (id)presenterRequestsAssetProgressWithCompletion:(id)a3;
- (id)progressPromptCompletion;
- (id)remoteProgressCompletion;
- (void)_cleanupAssetProgress;
- (void)_handleAssetProgressFinished;
- (void)_servicePerform:(id)a3;
- (void)invalidate;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)presentAllowWhileLockedPromptForVehicleName:(id)a3 responseHandler:(id)a4;
- (void)presentAssetProgressForVehicleName:(id)a3 progress:(id)a4 completionHandler:(id)a5 cancelHandler:(id)a6;
- (void)presentAssetReadyForVehicleName:(id)a3 confirmationHandler:(id)a4;
- (void)presentAssetReadySoonForVehicleName:(id)a3 confirmationHandler:(id)a4;
- (void)presentAssetSupportingConnectPromptWithBluetoothOnlyOption:(BOOL)a3 wirelessEnablement:(unint64_t)a4 responseHandler:(id)a5;
- (void)presentAssetSupportingUseWirelessPromptWithWirelessEnablement:(unint64_t)a3 declineVariant:(unint64_t)a4 responseHandler:(id)a5;
- (void)presentBluetoothConfirmationPromptForVehicleName:(id)a3 numericCode:(id)a4 responseHandler:(id)a5;
- (void)presentBluetoothContactsSyncPromptWithResponseHandler:(id)a3;
- (void)presentBluetoothFailedPromptForVehicleName:(id)a3 isTimeout:(BOOL)a4 responseHandler:(id)a5;
- (void)presentConnectPromptWithBluetoothOnlyOption:(BOOL)a3 wirelessEnablement:(unint64_t)a4 responseHandler:(id)a5;
- (void)presentEnhancedIntegrationPromptForVehicleName:(id)a3 responseHandler:(id)a4;
- (void)presentSetupCarKeysPromptForVehicleName:(id)a3 carKeyInfo:(id)a4 cancelHandler:(id)a5;
- (void)presentUseWirelessPromptWithWirelessEnablement:(unint64_t)a3 declineVariant:(unint64_t)a4 responseHandler:(id)a5;
- (void)presentWaitingPrompt;
- (void)presenterDidDismissWithCompletion:(id)a3;
- (void)presenterIsReadyWithCompletion:(id)a3;
- (void)setAssetProgress:(id)a3;
- (void)setConnection:(id)a3;
- (void)setDismissHandler:(id)a3;
- (void)setProgressPromptCompletion:(id)a3;
- (void)setRemoteProgressCompletion:(id)a3;
- (void)setSessionDelegate:(id)a3;
- (void)setSessionTransaction:(id)a3;
@end

@implementation CRSetupPromptPresenterSession

- (CRSetupPromptPresenterSession)init
{
  v5.receiver = self;
  v5.super_class = (Class)CRSetupPromptPresenterSession;
  v2 = [(CRSetupPromptPresenterSession *)&v5 init];
  if (v2)
  {
    v3 = (void *)os_transaction_create();
    [(CRSetupPromptPresenterSession *)v2 setSessionTransaction:v3];
  }
  return v2;
}

- (void)invalidate
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v3 = CarPairingLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100071194(v3);
  }

  [(CRSetupPromptPresenterSession *)self _cleanupAssetProgress];
  [(CRSetupPromptPresenterSession *)self setDismissHandler:0];
  v4 = [(CRSetupPromptPresenterSession *)self connection];
  [v4 invalidate];

  [(CRSetupPromptPresenterSession *)self setConnection:0];
  [(CRSetupPromptPresenterSession *)self setSessionTransaction:0];
}

- (void)_servicePerform:(id)a3
{
  v4 = (void (**)(id, id))a3;
  objc_super v5 = [(CRSetupPromptPresenterSession *)self connection];
  id v6 = [v5 remoteObjectProxyWithErrorHandler:&stru_1000BD7F8];

  v4[2](v4, v6);
}

- (void)presenterIsReadyWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001A9BC;
  block[3] = &unk_1000BD7B8;
  objc_copyWeak(&v8, &location);
  id v7 = v4;
  id v5 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)presenterDidDismissWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001AB58;
  block[3] = &unk_1000BD7B8;
  objc_copyWeak(&v8, &location);
  id v7 = v4;
  id v5 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (id)presenterRequestsAssetProgressWithCompletion:(id)a3
{
  objc_initWeak(&location, self);
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = sub_10001AD44;
  v11 = sub_10001AD54;
  id v12 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001AD5C;
  block[3] = &unk_1000BD820;
  objc_copyWeak(&v6, &location);
  void block[4] = &v7;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
  id v3 = (id)v8[5];
  objc_destroyWeak(&v6);
  _Block_object_dispose(&v7, 8);

  objc_destroyWeak(&location);

  return v3;
}

- (void)presentBluetoothConfirmationPromptForVehicleName:(id)a3 numericCode:(id)a4 responseHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10001AF30;
  v14[3] = &unk_1000BD898;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  [(CRSetupPromptPresenterSession *)self _servicePerform:v14];
}

- (void)presentBluetoothContactsSyncPromptWithResponseHandler:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001B1D4;
  v6[3] = &unk_1000BD8C0;
  id v7 = v4;
  id v5 = v4;
  [(CRSetupPromptPresenterSession *)self _servicePerform:v6];
}

- (void)presentBluetoothFailedPromptForVehicleName:(id)a3 isTimeout:(BOOL)a4 responseHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10001B494;
  v12[3] = &unk_1000BD8E8;
  BOOL v15 = a4;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(CRSetupPromptPresenterSession *)self _servicePerform:v12];
}

- (void)presentWaitingPrompt
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);

  [(CRSetupPromptPresenterSession *)self _servicePerform:&stru_1000BD928];
}

- (void)presentAllowWhileLockedPromptForVehicleName:(id)a3 responseHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001B754;
  v10[3] = &unk_1000BD950;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(CRSetupPromptPresenterSession *)self _servicePerform:v10];
}

- (void)presentConnectPromptWithBluetoothOnlyOption:(BOOL)a3 wirelessEnablement:(unint64_t)a4 responseHandler:(id)a5
{
  id v8 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001B9FC;
  v10[3] = &unk_1000BD978;
  BOOL v13 = a3;
  id v11 = v8;
  unint64_t v12 = a4;
  id v9 = v8;
  [(CRSetupPromptPresenterSession *)self _servicePerform:v10];
}

- (void)presentUseWirelessPromptWithWirelessEnablement:(unint64_t)a3 declineVariant:(unint64_t)a4 responseHandler:(id)a5
{
  id v8 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001BCB4;
  v10[3] = &unk_1000BD9A0;
  unint64_t v12 = a3;
  unint64_t v13 = a4;
  id v11 = v8;
  id v9 = v8;
  [(CRSetupPromptPresenterSession *)self _servicePerform:v10];
}

- (void)presentEnhancedIntegrationPromptForVehicleName:(id)a3 responseHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001BF80;
  v10[3] = &unk_1000BD950;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(CRSetupPromptPresenterSession *)self _servicePerform:v10];
}

- (void)presentAssetSupportingConnectPromptWithBluetoothOnlyOption:(BOOL)a3 wirelessEnablement:(unint64_t)a4 responseHandler:(id)a5
{
  id v8 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001C228;
  v10[3] = &unk_1000BD978;
  BOOL v13 = a3;
  id v11 = v8;
  unint64_t v12 = a4;
  id v9 = v8;
  [(CRSetupPromptPresenterSession *)self _servicePerform:v10];
}

- (void)presentAssetSupportingUseWirelessPromptWithWirelessEnablement:(unint64_t)a3 declineVariant:(unint64_t)a4 responseHandler:(id)a5
{
  id v8 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001C4E0;
  v10[3] = &unk_1000BD9A0;
  unint64_t v12 = a3;
  unint64_t v13 = a4;
  id v11 = v8;
  id v9 = v8;
  [(CRSetupPromptPresenterSession *)self _servicePerform:v10];
}

- (void)presentAssetProgressForVehicleName:(id)a3 progress:(id)a4 completionHandler:(id)a5 cancelHandler:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  [(CRSetupPromptPresenterSession *)self setAssetProgress:v13];
  [(CRSetupPromptPresenterSession *)self setProgressPromptCompletion:v12];

  id v14 = NSStringFromSelector("fractionCompleted");
  [v13 addObserver:self forKeyPath:v14 options:2 context:0];

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10001C87C;
  v19[3] = &unk_1000BDA18;
  v21 = self;
  id v22 = v11;
  id v20 = v10;
  id v15 = v11;
  id v16 = v10;
  [(CRSetupPromptPresenterSession *)self _servicePerform:v19];
  LODWORD(v14) = [v13 isFinished];

  if (v14)
  {
    id v17 = CarPairingLogging();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "asset progress already finished at time of presenting asset progress prompt", v18, 2u);
    }

    [(CRSetupPromptPresenterSession *)self _handleAssetProgressFinished];
  }
}

- (void)_handleAssetProgressFinished
{
  id v3 = CarPairingLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "asset progress completed", v6, 2u);
  }

  uint64_t v4 = [(CRSetupPromptPresenterSession *)self progressPromptCompletion];
  id v5 = (void *)v4;
  if (v4) {
    (*(void (**)(uint64_t))(v4 + 16))(v4);
  }
  [(CRSetupPromptPresenterSession *)self setProgressPromptCompletion:0];
}

- (void)_cleanupAssetProgress
{
  id v3 = [(CRSetupPromptPresenterSession *)self assetProgress];

  if (v3)
  {
    uint64_t v4 = [(CRSetupPromptPresenterSession *)self assetProgress];
    id v5 = NSStringFromSelector("fractionCompleted");
    [v4 removeObserver:self forKeyPath:v5];
  }
  [(CRSetupPromptPresenterSession *)self setAssetProgress:0];
  id v6 = [(CRSetupPromptPresenterSession *)self remoteProgressCompletion];
  if (v6) {
    v6[2]();
  }
  [(CRSetupPromptPresenterSession *)self setRemoteProgressCompletion:0];
  [(CRSetupPromptPresenterSession *)self setProgressPromptCompletion:0];
}

- (void)presentAssetReadyForVehicleName:(id)a3 confirmationHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001CC90;
  v10[3] = &unk_1000BD950;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(CRSetupPromptPresenterSession *)self _servicePerform:v10];
}

- (void)presentAssetReadySoonForVehicleName:(id)a3 confirmationHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001CEF0;
  v10[3] = &unk_1000BD950;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(CRSetupPromptPresenterSession *)self _servicePerform:v10];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001D11C;
  v7[3] = &unk_1000BD3A8;
  v7[4] = self;
  id v8 = a5;
  id v6 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);
}

- (void)presentSetupCarKeysPromptForVehicleName:(id)a3 carKeyInfo:(id)a4 cancelHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10001D354;
  v14[3] = &unk_1000BD898;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  [(CRSetupPromptPresenterSession *)self _servicePerform:v14];
}

- (id)dismissHandler
{
  return self->_dismissHandler;
}

- (void)setDismissHandler:(id)a3
{
}

- (CRSetupPromptPresenterSessionDelegate)sessionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sessionDelegate);

  return (CRSetupPromptPresenterSessionDelegate *)WeakRetained;
}

- (void)setSessionDelegate:(id)a3
{
}

- (NSXPCConnection)connection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);

  return (NSXPCConnection *)WeakRetained;
}

- (void)setConnection:(id)a3
{
}

- (OS_os_transaction)sessionTransaction
{
  return self->_sessionTransaction;
}

- (void)setSessionTransaction:(id)a3
{
}

- (NSProgress)assetProgress
{
  return self->_assetProgress;
}

- (void)setAssetProgress:(id)a3
{
}

- (id)remoteProgressCompletion
{
  return self->_remoteProgressCompletion;
}

- (void)setRemoteProgressCompletion:(id)a3
{
}

- (id)progressPromptCompletion
{
  return self->_progressPromptCompletion;
}

- (void)setProgressPromptCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_progressPromptCompletion, 0);
  objc_storeStrong(&self->_remoteProgressCompletion, 0);
  objc_storeStrong((id *)&self->_assetProgress, 0);
  objc_storeStrong((id *)&self->_sessionTransaction, 0);
  objc_destroyWeak((id *)&self->_connection);
  objc_destroyWeak((id *)&self->_sessionDelegate);

  objc_storeStrong(&self->_dismissHandler, 0);
}

@end
@interface CRHeadUnitPairingPromptServiceSession
- (CRHeadUnitPairingPromptServiceSessionDelegate)delegate;
- (NSString)keyIdentifier;
- (id)pairingPromptCompletion;
- (void)handleReceivedResponse:(BOOL)a3 forKeyIdentifier:(id)a4 completion:(id)a5;
- (void)presentHeadUnitPairingPromptForKeyIdentifier:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setPairingPromptCompletion:(id)a3;
- (void)wantsToPresentHeadUnitPairingPromptForKeyIdentifier:(id)a3 completion:(id)a4;
@end

@implementation CRHeadUnitPairingPromptServiceSession

- (void)wantsToPresentHeadUnitPairingPromptForKeyIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = CarPairingLogging();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_1000702AC(v8);
  }

  objc_initWeak(&location, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000148A4;
  v11[3] = &unk_1000BD508;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)presentHeadUnitPairingPromptForKeyIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = CarPairingLogging();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_1000702F0(v8);
  }

  objc_initWeak(&location, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100014B40;
  v11[3] = &unk_1000BD508;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)handleReceivedResponse:(BOOL)a3 forKeyIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = CarPairingLogging();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_1000703AC(a3, v10);
  }

  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100014E38;
  block[3] = &unk_1000BD558;
  objc_copyWeak(&v16, &location);
  id v14 = v8;
  id v15 = v9;
  BOOL v17 = a3;
  id v11 = v9;
  id v12 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (NSString)keyIdentifier
{
  return self->_keyIdentifier;
}

- (CRHeadUnitPairingPromptServiceSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CRHeadUnitPairingPromptServiceSessionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (id)pairingPromptCompletion
{
  return self->_pairingPromptCompletion;
}

- (void)setPairingPromptCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pairingPromptCompletion, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_keyIdentifier, 0);
}

@end
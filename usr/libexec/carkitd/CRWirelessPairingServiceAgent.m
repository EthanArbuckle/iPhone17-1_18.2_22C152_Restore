@interface CRWirelessPairingServiceAgent
- (BOOL)_shouldAcceptHeadUnitPairingPromptServiceConnection:(id)a3;
- (BOOL)_shouldAcceptPairingServiceConnection:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)shouldPresentHeadUnitPairingPromptSession:(id)a3;
- (CRBluetoothManager)bluetoothManager;
- (CRCarPlayPreferences)carPlayPreferences;
- (CRHeadUnitPairingPresenting)presenter;
- (CRHeadUnitPairingPromptServiceSession)currentPromptSession;
- (CRVehicleStore)vehicleStore;
- (CRWirelessPairingServiceAgent)initWithBluetoothManager:(id)a3 preferences:(id)a4 vehicleStore:(id)a5;
- (CRWirelessPairingServiceSession)currentPairingSession;
- (void)_didCompletePairingFlow:(BOOL)a3 error:(id)a4;
- (void)handleHeadUnitPairingPromptSession:(id)a3 receivedResponse:(BOOL)a4;
- (void)headUnitPairingPresenter:(id)a3 didCompletePairingFlow:(BOOL)a4 forBluetoothAddress:(id)a5 error:(id)a6;
- (void)headUnitPairingPresenter:(id)a3 didReceiveUserConfirmation:(BOOL)a4 forBluetoothAddress:(id)a5;
- (void)pairingServiceSession:(id)a3 didFailPairingAttemptWithError:(id)a4;
- (void)pairingServiceSessionDidFinishPairing:(id)a3;
- (void)presentHeadUnitPairingForPromptSession:(id)a3;
- (void)setCurrentPairingSession:(id)a3;
- (void)setCurrentPromptSession:(id)a3;
- (void)setPresenter:(id)a3;
@end

@implementation CRWirelessPairingServiceAgent

- (CRWirelessPairingServiceAgent)initWithBluetoothManager:(id)a3 preferences:(id)a4 vehicleStore:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CRWirelessPairingServiceAgent;
  v12 = [(CRWirelessPairingServiceAgent *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_bluetoothManager, a3);
    objc_storeStrong((id *)&v13->_carPlayPreferences, a4);
    objc_storeStrong((id *)&v13->_vehicleStore, a5);
  }

  return v13;
}

- (void)setCurrentPairingSession:(id)a3
{
  v4 = (CRWirelessPairingServiceSession *)a3;
  currentPairingSession = self->_currentPairingSession;
  if (currentPairingSession)
  {
    [(CRWirelessPairingServiceSession *)currentPairingSession invalidate];
    v6 = self->_currentPairingSession;
    self->_currentPairingSession = 0;
  }
  v7 = self->_currentPairingSession;
  self->_currentPairingSession = v4;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = [v5 serviceName];
  unsigned int v7 = [v6 isEqualToString:@"com.apple.carkit.pairing.service"];

  if (v7)
  {
    unsigned __int8 v8 = [(CRWirelessPairingServiceAgent *)self _shouldAcceptPairingServiceConnection:v5];
  }
  else
  {
    id v9 = [v5 serviceName];
    unsigned int v10 = [v9 isEqualToString:@"com.apple.carkit.headUnitPairingPrompt.service"];

    if (!v10)
    {
      BOOL v11 = 0;
      goto LABEL_7;
    }
    unsigned __int8 v8 = [(CRWirelessPairingServiceAgent *)self _shouldAcceptHeadUnitPairingPromptServiceConnection:v5];
  }
  BOOL v11 = v8;
LABEL_7:

  return v11;
}

- (BOOL)_shouldAcceptPairingServiceConnection:(id)a3
{
  id v4 = a3;
  id v5 = [v4 valueForEntitlement:@"com.apple.private.carkit.pairing"];
  unsigned __int8 v6 = [v5 BOOLValue];

  if (v6)
  {
    unsigned int v7 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___CRWirelessPairingService];
    [v4 setExportedInterface:v7];
    uint64_t v17 = 0;
    v18 = &v17;
    uint64_t v19 = 0x3032000000;
    v20 = sub_10001DB54;
    v21 = sub_10001DB64;
    id v22 = 0;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001DB6C;
    block[3] = &unk_1000BD768;
    block[4] = self;
    block[5] = &v17;
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
    [v4 setExportedObject:v18[5]];
    objc_initWeak(&location, v4);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10001DC1C;
    v13[3] = &unk_1000BD5C8;
    objc_copyWeak(&v14, &location);
    v13[4] = self;
    [v4 setInterruptionHandler:v13];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10001DDDC;
    v11[3] = &unk_1000BD5C8;
    objc_copyWeak(&v12, &location);
    v11[4] = self;
    [v4 setInvalidationHandler:v11];
    unsigned __int8 v8 = CarPairingLogging();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v4 processIdentifier]);
      *(_DWORD *)buf = 138412290;
      v24 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Receiving pairing service connection from %@", buf, 0xCu);
    }
    [v4 resume];
    objc_destroyWeak(&v12);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
    _Block_object_dispose(&v17, 8);
  }
  else
  {
    unsigned int v7 = CarPairingLogging();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100071294(v4);
    }
  }

  return v6;
}

- (BOOL)_shouldAcceptHeadUnitPairingPromptServiceConnection:(id)a3
{
  id v4 = a3;
  id v5 = [v4 valueForEntitlement:@"com.apple.private.carkit.headUnitPairingPrompt"];
  unsigned __int8 v6 = [v5 BOOLValue];

  if (v6)
  {
    unsigned int v7 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___CRHeadUnitPairingPromptService];
    [v4 setExportedInterface:v7];
    unsigned __int8 v8 = objc_alloc_init(CRHeadUnitPairingPromptServiceSession);
    [(CRWirelessPairingServiceAgent *)self setCurrentPromptSession:v8];
    [(CRHeadUnitPairingPromptServiceSession *)v8 setDelegate:self];
    [v4 setExportedObject:v8];
    objc_initWeak(&location, v4);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10001E264;
    v14[3] = &unk_1000BD740;
    objc_copyWeak(&v15, &location);
    [v4 setInterruptionHandler:v14];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10001E318;
    v12[3] = &unk_1000BD740;
    objc_copyWeak(&v13, &location);
    [v4 setInvalidationHandler:v12];
    id v9 = CarPairingLogging();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v10 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v4 processIdentifier]);
      *(_DWORD *)buf = 138412290;
      v18 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Receiving HUP prompt service connection from %@", buf, 0xCu);
    }
    [v4 resume];
    objc_destroyWeak(&v13);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  else
  {
    unsigned int v7 = CarPairingLogging();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100071350(v4);
    }
  }

  return v6;
}

- (BOOL)shouldPresentHeadUnitPairingPromptSession:(id)a3
{
  id v4 = a3;
  id v5 = [(CRWirelessPairingServiceAgent *)self currentPairingSession];

  if (!v5)
  {
    id v15 = CarPairingLogging();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      v16 = "not presenting head unit pairing prompt, pairing session is not already established";
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v21, 2u);
    }
LABEL_13:

    BOOL v14 = 0;
    goto LABEL_14;
  }
  unsigned __int8 v6 = [(CRWirelessPairingServiceAgent *)self currentPairingSession];
  unsigned __int8 v7 = [v6 isPairingAvailable];

  if ((v7 & 1) == 0)
  {
    id v15 = CarPairingLogging();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1000713CC();
    }
    goto LABEL_13;
  }
  unsigned __int8 v8 = [(CRWirelessPairingServiceAgent *)self currentPairingSession];
  unsigned __int8 v9 = [v8 isActive];

  if ((v9 & 1) == 0)
  {
    id v15 = CarPairingLogging();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      v16 = "not presenting head unit pairing prompt, pairing session is not active / already completed";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  unsigned int v10 = [(CRWirelessPairingServiceAgent *)self currentPairingSession];
  BOOL v11 = [v10 keyIdentifier];
  id v12 = [v4 keyIdentifier];
  unsigned __int8 v13 = [v11 isEqualToString:v12];

  if ((v13 & 1) == 0)
  {
    id v15 = CarPairingLogging();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v18 = [(CRWirelessPairingServiceAgent *)self currentPairingSession];
      uint64_t v19 = [v18 keyIdentifier];
      v20 = [v4 keyIdentifier];
      int v21 = 138478083;
      id v22 = v19;
      __int16 v23 = 2113;
      v24 = v20;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "not presenting head unit pairing prompt, key identifier mismatch: %{private}@ vs %{private}@, ", (uint8_t *)&v21, 0x16u);
    }
    goto LABEL_13;
  }
  BOOL v14 = 1;
LABEL_14:

  return v14;
}

- (void)presentHeadUnitPairingForPromptSession:(id)a3
{
  if ([(CRWirelessPairingServiceAgent *)self shouldPresentHeadUnitPairingPromptSession:a3])
  {
    id v4 = [(CRWirelessPairingServiceAgent *)self currentPairingSession];
    id v5 = [v4 bluetoothAddress];

    unsigned __int8 v6 = +[CRBluetoothManager addressStringForData:v5];
    if (v6)
    {
      unsigned __int8 v7 = [(CRWirelessPairingServiceAgent *)self presenter];
      if (v7 && (objc_opt_respondsToSelector() & 1) != 0) {
        [v7 presentHeadUnitPairingForBluetoothAddress:v6 showBluetoothOnlyOption:0];
      }
      else {
        [(CRWirelessPairingServiceAgent *)self _didCompletePairingFlow:0 error:0];
      }
    }
    else
    {
      unsigned __int8 v8 = CarPairingLogging();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_100071400();
      }

      [(CRWirelessPairingServiceAgent *)self _didCompletePairingFlow:0 error:0];
    }
  }
  else
  {
    [(CRWirelessPairingServiceAgent *)self _didCompletePairingFlow:0 error:0];
  }
}

- (void)handleHeadUnitPairingPromptSession:(id)a3 receivedResponse:(BOOL)a4
{
  BOOL v4 = a4;
  if ([(CRWirelessPairingServiceAgent *)self shouldPresentHeadUnitPairingPromptSession:a3])
  {
    unsigned __int8 v6 = CarPairingLogging();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v7)
      {
        LOWORD(v16) = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "accepted head unit pairing", (uint8_t *)&v16, 2u);
      }

      unsigned __int8 v8 = [(CRWirelessPairingServiceAgent *)self currentPairingSession];
      unsigned __int8 v6 = [v8 bluetoothAddress];

      unsigned __int8 v9 = +[CRBluetoothManager addressStringForData:v6];
      id v10 = objc_alloc_init((Class)CRVehicle);
      [v10 setVehicleName:v9];
      [v10 setBluetoothAddress:v9];
      [v10 setPairingStatus:2];
      BOOL v11 = [(CRWirelessPairingServiceAgent *)self vehicleStore];
      id v12 = [v11 saveVehicle:v10];

      unsigned __int8 v13 = CarPairingLogging();
      BOOL v14 = v13;
      if (v12)
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          int v16 = 138412290;
          uint64_t v17 = v12;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "saved vehicle for head unit pairing: %@", (uint8_t *)&v16, 0xCu);
        }
      }
      else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        sub_100071434(v14);
      }
    }
    else if (v7)
    {
      LOWORD(v16) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "declined head unit pairing", (uint8_t *)&v16, 2u);
    }

    id v15 = [(CRWirelessPairingServiceAgent *)self currentPairingSession];
    [v15 handlePairingPromptResponse:v4];
  }
}

- (void)headUnitPairingPresenter:(id)a3 didReceiveUserConfirmation:(BOOL)a4 forBluetoothAddress:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  unsigned __int8 v8 = CarPairingLogging();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v9 = @"NO";
    if (v5) {
      CFStringRef v9 = @"YES";
    }
    int v16 = 138412290;
    CFStringRef v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "current pairing session approval: %@", (uint8_t *)&v16, 0xCu);
  }

  id v10 = [(CRWirelessPairingServiceAgent *)self currentPairingSession];
  BOOL v11 = [v10 bluetoothAddress];

  id v12 = +[CRBluetoothManager addressStringForData:v11];
  unsigned __int8 v13 = v12;
  if (v12 && ([v12 isEqual:v7] & 1) != 0)
  {
    BOOL v14 = [(CRWirelessPairingServiceAgent *)self currentPairingSession];
    [v14 handlePairingPromptResponse:v5];
  }
  else
  {
    id v15 = CarPairingLogging();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1000714B0();
    }

    [(CRWirelessPairingServiceAgent *)self _didCompletePairingFlow:0 error:0];
  }
}

- (void)headUnitPairingPresenter:(id)a3 didCompletePairingFlow:(BOOL)a4 forBluetoothAddress:(id)a5 error:(id)a6
{
}

- (void)_didCompletePairingFlow:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  id v10 = a4;
  unsigned __int8 v6 = [(CRWirelessPairingServiceAgent *)self currentPromptSession];
  id v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 pairingPromptCompletion];
    CFStringRef v9 = (void *)v8;
    if (v8)
    {
      (*(void (**)(uint64_t, BOOL, id))(v8 + 16))(v8, v4, v10);
      [v7 setPairingPromptCompletion:0];
    }
  }
}

- (void)pairingServiceSessionDidFinishPairing:(id)a3
{
  uint64_t v4 = [(CRWirelessPairingServiceAgent *)self presenter];
  if (v4)
  {
    uint64_t v8 = (void *)v4;
    if (objc_opt_respondsToSelector())
    {
      BOOL v5 = [(CRWirelessPairingServiceAgent *)self currentPairingSession];
      unsigned __int8 v6 = [v5 bluetoothAddress];

      id v7 = +[CRBluetoothManager addressStringForData:v6];
      [v8 didHeadUnitPairWithBluetoothAddress:v7];
    }
  }

  _objc_release_x2();
}

- (void)pairingServiceSession:(id)a3 didFailPairingAttemptWithError:(id)a4
{
  id v9 = a4;
  BOOL v5 = [(CRWirelessPairingServiceAgent *)self presenter];
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    unsigned __int8 v6 = [(CRWirelessPairingServiceAgent *)self currentPairingSession];
    id v7 = [v6 bluetoothAddress];

    uint64_t v8 = +[CRBluetoothManager addressStringForData:v7];
    [v5 didFailToHeadUnitPairWithBluetoothAddress:v8 error:v9];
  }
}

- (CRHeadUnitPairingPresenting)presenter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);

  return (CRHeadUnitPairingPresenting *)WeakRetained;
}

- (void)setPresenter:(id)a3
{
}

- (CRBluetoothManager)bluetoothManager
{
  return self->_bluetoothManager;
}

- (CRCarPlayPreferences)carPlayPreferences
{
  return self->_carPlayPreferences;
}

- (CRVehicleStore)vehicleStore
{
  return self->_vehicleStore;
}

- (CRWirelessPairingServiceSession)currentPairingSession
{
  return self->_currentPairingSession;
}

- (CRHeadUnitPairingPromptServiceSession)currentPromptSession
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentPromptSession);

  return (CRHeadUnitPairingPromptServiceSession *)WeakRetained;
}

- (void)setCurrentPromptSession:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_currentPromptSession);
  objc_storeStrong((id *)&self->_currentPairingSession, 0);
  objc_storeStrong((id *)&self->_vehicleStore, 0);
  objc_storeStrong((id *)&self->_carPlayPreferences, 0);
  objc_storeStrong((id *)&self->_bluetoothManager, 0);

  objc_destroyWeak((id *)&self->_presenter);
}

@end
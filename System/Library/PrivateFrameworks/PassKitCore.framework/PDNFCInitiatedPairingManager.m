@interface PDNFCInitiatedPairingManager
- (BOOL)_canAttemptNativePairing;
- (PDNFCInitiatedPairingManager)initWithFieldDetectorManager:(id)a3 daManager:(id)a4 carKeyRequirementsChecker:(id)a5 remoteInterfacePresenter:(id)a6 assertionManager:(id)a7;
- (void)_nativelyPairToTerminalWithFieldPropertiesIfPossible:(id)a3;
- (void)_probeTerminalForPairingStatusWithCompletion:(id)a3;
- (void)_requestNativePairingWithSupportedTerminal:(id)a3;
- (void)_updateFieldDetectionState;
- (void)dealloc;
- (void)fieldDetectorManager:(id)a3 didEnterFieldWithProperties:(id)a4;
- (void)initiateNativePairingIfPossibleFromTCIs:(id)a3 brandCode:(int64_t)a4;
@end

@implementation PDNFCInitiatedPairingManager

- (PDNFCInitiatedPairingManager)initWithFieldDetectorManager:(id)a3 daManager:(id)a4 carKeyRequirementsChecker:(id)a5 remoteInterfacePresenter:(id)a6 assertionManager:(id)a7
{
  id v22 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v25.receiver = self;
  v25.super_class = (Class)PDNFCInitiatedPairingManager;
  v17 = [(PDNFCInitiatedPairingManager *)&v25 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_daManager, a4);
    objc_storeStrong((id *)&v18->_carKeyRequirementsChecker, a5);
    objc_storeStrong((id *)&v18->_remoteInterfacePresenter, a6);
    objc_storeStrong((id *)&v18->_assertionManager, a7);
    objc_storeStrong((id *)&v18->_fieldDetectorManager, a3);
    sub_10001204C((uint64_t)v18->_fieldDetectorManager, v18);
    v19 = PDUtilityQueue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1003BA104;
    block[3] = &unk_10072E1E8;
    v24 = v18;
    dispatch_block_t v20 = dispatch_block_create(DISPATCH_BLOCK_NO_QOS_CLASS|DISPATCH_BLOCK_DETACHED, block);
    dispatch_async(v19, v20);
  }
  return v18;
}

- (void)dealloc
{
  sub_10000725C((uint64_t)self->_fieldDetectorManager, self);
  v3.receiver = self;
  v3.super_class = (Class)PDNFCInitiatedPairingManager;
  [(PDNFCInitiatedPairingManager *)&v3 dealloc];
}

- (void)initiateNativePairingIfPossibleFromTCIs:(id)a3 brandCode:(int64_t)a4
{
  id v6 = a3;
  if ([(PDCarKeyRequirementsChecker *)self->_carKeyRequirementsChecker deviceSupportsCredentials])
  {
    v7 = [(PDCarKeyRequirementsChecker *)self->_carKeyRequirementsChecker supportedTerminalForTCIs:v6 brandCode:a4];
    if (v7 && [(PDNFCInitiatedPairingManager *)self _canAttemptNativePairing])
    {
      [(PDNFCInitiatedPairingManager *)self _requestNativePairingWithSupportedTerminal:v7];
    }
    else
    {
      v8 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 138412290;
        id v10 = v6;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Pairing is not supported with the terminal with the TCIs: %@", (uint8_t *)&v9, 0xCu);
      }
    }
  }
}

- (void)_nativelyPairToTerminalWithFieldPropertiesIfPossible:(id)a3
{
  id v4 = a3;
  if ([(PDCarKeyRequirementsChecker *)self->_carKeyRequirementsChecker deviceSupportsCredentials])
  {
    v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Checking if pairing is supported for terminal with field: %@", buf, 0xCu);
    }

    id v6 = objc_alloc((Class)NSSet);
    v7 = [v4 TCIs];
    id v8 = [v6 initWithArray:v7];

    if (![v8 count]) {
      goto LABEL_17;
    }
    int v9 = -[PDCarKeyRequirementsChecker supportedTerminalForTCIs:brandCode:](self->_carKeyRequirementsChecker, "supportedTerminalForTCIs:brandCode:", v8, [v4 carKeyBrandCode]);
    if (v9)
    {
      if ([(PDNFCInitiatedPairingManager *)self _canAttemptNativePairing])
      {
        id v10 = [v4 pairingRequested];
        if (v10)
        {
          if (v10 == (id)1) {
            [(PDNFCInitiatedPairingManager *)self _requestNativePairingWithSupportedTerminal:v9];
          }
        }
        else
        {
          v12[0] = _NSConcreteStackBlock;
          v12[1] = 3221225472;
          v12[2] = sub_1003BA4A0;
          v12[3] = &unk_10074E430;
          v12[4] = self;
          id v13 = v8;
          [(PDNFCInitiatedPairingManager *)self _probeTerminalForPairingStatusWithCompletion:v12];
        }
        goto LABEL_16;
      }
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v11 = "Prevented from starting native pairing with terminal.";
        goto LABEL_14;
      }
    }
    else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v11 = "Pairing is not supported with the terminal";
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v11, buf, 2u);
    }

LABEL_16:
LABEL_17:
  }
}

- (BOOL)_canAttemptNativePairing
{
  objc_super v3 = [(PDAssertionManager *)self->_assertionManager assertionsOfType:1];
  id v4 = [v3 count];

  if (v4)
  {
    v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v10 = 0;
      id v6 = "Unable to attempt native pairing - provisioning in progress";
      v7 = (uint8_t *)&v10;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
    }
  }
  else
  {
    if (!sub_100207784((os_unfair_lock_s *)self->_remoteInterfacePresenter)) {
      return 1;
    }
    v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v9 = 0;
      id v6 = "Unable to attempt native pairing - remote interface presented";
      v7 = (uint8_t *)&v9;
      goto LABEL_7;
    }
  }

  return 0;
}

- (void)_requestNativePairingWithSupportedTerminal:(id)a3
{
  id v4 = a3;
  v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Requesting native pairing for supported terminal: %@", buf, 0xCu);
  }

  id v6 = [objc_alloc((Class)PKVehicleInitiatedPairingProxCardRequest) initWithSupportedTerminal:v4 referralSource:2];
  remoteInterfacePresenter = self->_remoteInterfacePresenter;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1003BA790;
  v9[3] = &unk_10072E4F8;
  id v10 = v4;
  id v8 = v4;
  sub_100208CF4((uint64_t)remoteInterfacePresenter, v6, v9);
}

- (void)fieldDetectorManager:(id)a3 didEnterFieldWithProperties:(id)a4
{
  id v5 = a4;
  if ([v5 accessTerminalSubtype] == (id)2 && objc_msgSend(v5, "pairingRequested") != (id)2) {
    [(PDNFCInitiatedPairingManager *)self _nativelyPairToTerminalWithFieldPropertiesIfPossible:v5];
  }
}

- (void)_updateFieldDetectionState
{
  if (![(PDCarKeyRequirementsChecker *)self->_carKeyRequirementsChecker deviceSupportsCredentials])
  {
    id v4 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v8 = 0;
      id v5 = "Requesting to disable persistent field detect - no device support for car key";
      id v6 = (uint8_t *)&v8;
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, v5, v6, 2u);
    }
LABEL_9:

    char v3 = 0;
    goto LABEL_10;
  }
  if (![(PDCarKeyRequirementsChecker *)self->_carKeyRequirementsChecker carAccessFeatureAvailable])
  {
    id v4 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v7 = 0;
      id v5 = "Requesting to disable persistent field detect - feature not available";
      id v6 = (uint8_t *)&v7;
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  char v3 = 1;
LABEL_10:
  PDCarPairingStateSet(v3);
  sub_1001A5650((uint64_t)self->_fieldDetectorManager);
}

- (void)_probeTerminalForPairingStatusWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int16 v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Probing remote device for pairing status...", v7, 2u);
    }

    daManager = self->_daManager;
    if (daManager) {
      [(PKDAManager *)daManager probeTerminalForPairingStatusWithCompletion:v4];
    }
    else {
      (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertionManager, 0);
  objc_storeStrong((id *)&self->_remoteInterfacePresenter, 0);
  objc_storeStrong((id *)&self->_daManager, 0);
  objc_storeStrong((id *)&self->_carKeyRequirementsChecker, 0);
  objc_storeStrong((id *)&self->_fieldDetectorManager, 0);
}

@end
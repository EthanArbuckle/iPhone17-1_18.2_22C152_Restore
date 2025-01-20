@interface CRPairingPromptFlowController
+ (BOOL)_isRequiredStep:(unint64_t)a3;
+ (id)_descriptionForStep:(unint64_t)a3;
- (BOOL)_hasExistingBluetoothPairing;
- (BOOL)_isMessagingBluetoothConnected;
- (BOOL)_needsBluetoothTurnedOn;
- (BOOL)_needsWiFiTurnedOn;
- (BOOL)_supportsCarKeys;
- (BOOL)_supportsEnhancedIntegration;
- (BOOL)_supportsOutOfBandPairing;
- (BOOL)_supportsThemeAssets;
- (BOOL)_supportsUSB;
- (BOOL)showBluetoothOnlyOption;
- (BOOL)startedFromCarKey;
- (CRMessagingServiceVehicleRepresenting)messagingVehicle;
- (CRPairingPromptFlowController)init;
- (CRPairingPromptFlowDelegate)promptDelegate;
- (NSNumber)bluetoothConfirmed;
- (NSNumber)pairingAccepted;
- (NSString)bluetoothDeviceIdentifier;
- (NSString)numericCode;
- (NSString)vehicleName;
- (NSTimer)waitingOnMessagingVehicleTimer;
- (double)waitingOnMessagingVehicleTimeout;
- (id)_carKeyInfo;
- (id)userInfo;
- (unint64_t)_nextStepAfterResponse:(id)a3;
- (unint64_t)_outOfBandPairingDeclineCount;
- (unint64_t)bluetoothFailureReason;
- (unint64_t)currentStep;
- (void)_cancelWithRequiredStepsRemaining:(BOOL)a3;
- (void)_dismiss;
- (void)_handleTimedOutWaitingOnMessagingVehicle:(id)a3;
- (void)_incrementOutOfBandPairingDeclineCount;
- (void)_performPresentationAction:(id)a3;
- (void)_presentAllowWhileLockedPromptWithCompletion:(id)a3;
- (void)_presentAssetProgressPromptWithCompletion:(id)a3;
- (void)_presentAssetReadyPromptWithCompletion:(id)a3;
- (void)_presentAssetReadySoonPromptWithCompletion:(id)a3;
- (void)_presentBluetoothConfirmationPromptWithCompletion:(id)a3;
- (void)_presentBluetoothContactsSyncPromptWithCompletion:(id)a3;
- (void)_presentBluetoothFailedPromptWithCompletion:(id)a3;
- (void)_presentConnectCarPlayFromCarKeyPromptWithCompletion:(id)a3;
- (void)_presentConnectCarPlayPromptWithCompletion:(id)a3;
- (void)_presentEnhancedIntegrationPromptWithCompletion:(id)a3;
- (void)_presentNextStepAfterResponse:(id)a3;
- (void)_presentSetupCarKeysWithCompletion:(id)a3;
- (void)_presentUseWirelessCarPlayPromptWithCompletion:(id)a3;
- (void)_presentWaitingPrompt;
- (void)_startWaitingOnMessagingVehicleTimer;
- (void)_stopWaitingOnMessagingVehicleTimer;
- (void)cancel;
- (void)handleBluetoothPairingConfirmationRequestForDeviceIdentifier:(id)a3 vehicleName:(id)a4 numericCode:(id)a5;
- (void)handleBluetoothPairingFailedForDeviceIdentifier:(id)a3 vehicleName:(id)a4 isTimeout:(BOOL)a5;
- (void)handleBluetoothPairingStartedForDeviceIdentifier:(id)a3 showBluetoothOnlyOption:(BOOL)a4;
- (void)handleCarKeyInitiatedConfirmationForDeviceAddress:(id)a3 showBluetoothOnlyOption:(BOOL)a4;
- (void)handleCarKeyInitiatedPairingFailed;
- (void)handleConnectedMessagingVehicle:(id)a3 pairingAccepted:(id)a4;
- (void)handleDisconnectedMessagingVehicle:(id)a3;
- (void)handleUnsupportedMessagingConnectionForDeviceIdentifier:(id)a3;
- (void)setBluetoothConfirmed:(id)a3;
- (void)setBluetoothDeviceIdentifier:(id)a3;
- (void)setBluetoothFailureReason:(unint64_t)a3;
- (void)setCurrentStep:(unint64_t)a3;
- (void)setMessagingVehicle:(id)a3;
- (void)setNumericCode:(id)a3;
- (void)setPairingAccepted:(id)a3;
- (void)setPromptDelegate:(id)a3;
- (void)setShowBluetoothOnlyOption:(BOOL)a3;
- (void)setStartedFromCarKey:(BOOL)a3;
- (void)setUserInfo:(id)a3;
- (void)setVehicleName:(id)a3;
- (void)setWaitingOnMessagingVehicleTimeout:(double)a3;
- (void)setWaitingOnMessagingVehicleTimer:(id)a3;
@end

@implementation CRPairingPromptFlowController

+ (id)_descriptionForStep:(unint64_t)a3
{
  if (a3 - 1 > 0xE) {
    return @"started";
  }
  else {
    return off_1000BE8B0[a3 - 1];
  }
}

+ (BOOL)_isRequiredStep:(unint64_t)a3
{
  return (a3 > 0xF) | (0xCFu >> a3) & 1;
}

- (CRPairingPromptFlowController)init
{
  v6.receiver = self;
  v6.super_class = (Class)CRPairingPromptFlowController;
  v2 = [(CRPairingPromptFlowController *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_currentStep = 0;
    v2->_bluetoothFailureReason = 0;
    pairingAccepted = v2->_pairingAccepted;
    v2->_pairingAccepted = 0;

    v3->_waitingOnMessagingVehicleTimeout = 30.0;
  }
  return v3;
}

- (void)handleBluetoothPairingStartedForDeviceIdentifier:(id)a3 showBluetoothOnlyOption:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v7 = CarPairingLogging();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "received Bluetooth pairing started", v8, 2u);
  }

  [(CRPairingPromptFlowController *)self setBluetoothDeviceIdentifier:v6];
  [(CRPairingPromptFlowController *)self setShowBluetoothOnlyOption:v4];
}

- (void)handleBluetoothPairingConfirmationRequestForDeviceIdentifier:(id)a3 vehicleName:(id)a4 numericCode:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v11 = CarPairingLogging();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "received Bluetooth pairing confirmation request, continuing prompt flow", v15, 2u);
  }

  v12 = [(CRPairingPromptFlowController *)self bluetoothDeviceIdentifier];
  unsigned __int8 v13 = [v12 isEqualToString:v10];

  if (v13)
  {
    [(CRPairingPromptFlowController *)self setVehicleName:v8];
    [(CRPairingPromptFlowController *)self setNumericCode:v9];
    if (![(CRPairingPromptFlowController *)self currentStep]) {
      [(CRPairingPromptFlowController *)self _presentNextStepAfterResponse:0];
    }
  }
  else
  {
    v14 = CarPairingLogging();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1000744A0();
    }
  }
}

- (void)handleBluetoothPairingFailedForDeviceIdentifier:(id)a3 vehicleName:(id)a4 isTimeout:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  id v10 = CarPairingLogging();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "received Bluetooth failed, adding failed prompt to flow", v16, 2u);
  }

  v11 = [(CRPairingPromptFlowController *)self bluetoothDeviceIdentifier];
  v12 = v11;
  if (v11)
  {
    if (([v11 isEqualToString:v8] & 1) == 0)
    {
      unsigned __int8 v13 = CarPairingLogging();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_1000744D4();
      }

      goto LABEL_15;
    }
  }
  else
  {
    [(CRPairingPromptFlowController *)self setBluetoothDeviceIdentifier:v8];
  }
  [(CRPairingPromptFlowController *)self setVehicleName:v9];
  if (v5) {
    uint64_t v14 = 2;
  }
  else {
    uint64_t v14 = 1;
  }
  [(CRPairingPromptFlowController *)self setBluetoothFailureReason:v14];
  unint64_t v15 = [(CRPairingPromptFlowController *)self currentStep];
  if (v15 <= 5 && ((1 << v15) & 0x25) != 0) {
    [(CRPairingPromptFlowController *)self _presentNextStepAfterResponse:&__kCFBooleanFalse];
  }
LABEL_15:
}

- (void)handleConnectedMessagingVehicle:(id)a3 pairingAccepted:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  id v8 = CarPairingLogging();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "received messaging connection, continuing prompt flow", v11, 2u);
  }

  [(CRPairingPromptFlowController *)self setMessagingVehicle:v7];
  [(CRPairingPromptFlowController *)self setPairingAccepted:v6];

  id v9 = [v7 vehicleName];

  [(CRPairingPromptFlowController *)self setVehicleName:v9];
  unint64_t v10 = [(CRPairingPromptFlowController *)self currentStep];
  if (v10 == 5 || !v10) {
    [(CRPairingPromptFlowController *)self _presentNextStepAfterResponse:&__kCFBooleanTrue];
  }
}

- (void)handleUnsupportedMessagingConnectionForDeviceIdentifier:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  BOOL v5 = [(CRPairingPromptFlowController *)self bluetoothDeviceIdentifier];
  unsigned __int8 v6 = [v5 isEqualToString:v4];

  id v7 = CarPairingLogging();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "received unsupported messaging connection for current prompt flow device, finishing flow", v9, 2u);
    }

    if ((id)[(CRPairingPromptFlowController *)self currentStep] == (id)5) {
      [(CRPairingPromptFlowController *)self _presentNextStepAfterResponse:&__kCFBooleanFalse];
    }
  }
  else
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "received unsupported messaging connection for a device other than current prompt flow device, ignoring", buf, 2u);
    }
  }
}

- (void)handleDisconnectedMessagingVehicle:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  BOOL v5 = CarPairingLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "disconnected messaging connection", buf, 2u);
  }

  unsigned __int8 v6 = [(CRPairingPromptFlowController *)self messagingVehicle];
  unsigned int v7 = [v4 isEqual:v6];

  if (v7)
  {
    if ([v4 transportType] == (id)2)
    {
      BOOL v8 = CarPairingLogging();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v9 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "ignoring disconnection for BT messaging connection", v9, 2u);
      }
    }
    else
    {
      [(CRPairingPromptFlowController *)self cancel];
    }
  }
}

- (void)handleCarKeyInitiatedConfirmationForDeviceAddress:(id)a3 showBluetoothOnlyOption:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  unsigned int v7 = CarPairingLogging();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "received car key initiated confirmation", v8, 2u);
  }

  [(CRPairingPromptFlowController *)self setBluetoothDeviceIdentifier:v6];
  [(CRPairingPromptFlowController *)self setShowBluetoothOnlyOption:v4];
  [(CRPairingPromptFlowController *)self setStartedFromCarKey:1];
  if (![(CRPairingPromptFlowController *)self currentStep]) {
    [(CRPairingPromptFlowController *)self _presentNextStepAfterResponse:0];
  }
}

- (void)handleCarKeyInitiatedPairingFailed
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  [(CRPairingPromptFlowController *)self setBluetoothFailureReason:1];
  if ((id)[(CRPairingPromptFlowController *)self currentStep] == (id)5)
  {
    [(CRPairingPromptFlowController *)self _presentNextStepAfterResponse:&__kCFBooleanFalse];
  }
}

- (void)cancel
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  id v3 = [objc_opt_class() _isRequiredStep:-[CRPairingPromptFlowController currentStep](self, "currentStep")];

  [(CRPairingPromptFlowController *)self _cancelWithRequiredStepsRemaining:v3];
}

- (void)_cancelWithRequiredStepsRemaining:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(CRPairingPromptFlowController *)self promptDelegate];
  if (v5)
  {
    id v6 = (void *)v5;
    if (objc_opt_respondsToSelector()) {
      [v6 pairingPromptFlow:self didCancelWithRequiredStepsRemaining:v3];
    }
  }

  _objc_release_x2();
}

- (BOOL)_isMessagingBluetoothConnected
{
  v2 = [(CRPairingPromptFlowController *)self messagingVehicle];
  BOOL v3 = (((unint64_t)[v2 transportType] - 2) & 0xFFFFFFFFFFFFFFFDLL) == 0;

  return v3;
}

- (BOOL)_supportsUSB
{
  v2 = [(CRPairingPromptFlowController *)self messagingVehicle];
  unsigned __int8 v3 = [v2 supportsUSBCarPlay];

  return v3;
}

- (BOOL)_supportsOutOfBandPairing
{
  v2 = [(CRPairingPromptFlowController *)self messagingVehicle];
  if ([v2 supportsWirelessCarPlay]) {
    unsigned __int8 v3 = [v2 supportsWiredBluetoothPairing];
  }
  else {
    unsigned __int8 v3 = 0;
  }

  return v3;
}

- (BOOL)_hasExistingBluetoothPairing
{
  unsigned __int8 v3 = [(CRPairingPromptFlowController *)self promptDelegate];
  if (v3 && (objc_opt_respondsToSelector() & 1) != 0) {
    unsigned int v4 = [v3 hasExistingBluetoothPairingForPairingPromptFlow:self];
  }
  else {
    unsigned int v4 = 0;
  }
  uint64_t v5 = CarPairingLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    CFStringRef v6 = @"NO";
    if (v4) {
      CFStringRef v6 = @"YES";
    }
    int v8 = 138412290;
    CFStringRef v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "has existing Bluetooth pairing: %@", (uint8_t *)&v8, 0xCu);
  }

  return v4;
}

- (BOOL)_supportsEnhancedIntegration
{
  unsigned __int8 v3 = [(CRPairingPromptFlowController *)self promptDelegate];
  if (v3 && (objc_opt_respondsToSelector() & 1) != 0) {
    unsigned __int8 v4 = [v3 enhancedIntegrationSupportedForPairingPromptFlow:self];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (BOOL)_supportsThemeAssets
{
  unsigned __int8 v3 = [(CRPairingPromptFlowController *)self promptDelegate];
  if (v3 && (objc_opt_respondsToSelector() & 1) != 0) {
    unsigned __int8 v4 = [v3 supportsThemeAssetsForPairingPromptFlow:self];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (BOOL)_needsBluetoothTurnedOn
{
  unsigned __int8 v3 = [(CRPairingPromptFlowController *)self promptDelegate];
  if (v3 && (objc_opt_respondsToSelector() & 1) != 0) {
    unsigned __int8 v4 = [v3 needsBluetoothTurnedOnForPairingPromptFlow:self];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (BOOL)_needsWiFiTurnedOn
{
  unsigned __int8 v3 = [(CRPairingPromptFlowController *)self promptDelegate];
  if (v3 && (objc_opt_respondsToSelector() & 1) != 0) {
    unsigned __int8 v4 = [v3 needsWiFiTurnedOnForPairingPromptFlow:self];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (unint64_t)_outOfBandPairingDeclineCount
{
  unsigned __int8 v3 = [(CRPairingPromptFlowController *)self promptDelegate];
  if (v3 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v4 = [v3 outOfBandPairingDeclineCountForPairingPromptFlow:self];
    uint64_t v5 = CarPairingLogging();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v7 = 134217984;
      id v8 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "OOB pairing decline count: %lu", (uint8_t *)&v7, 0xCu);
    }
  }
  else
  {
    id v4 = 0;
  }

  return (unint64_t)v4;
}

- (void)_incrementOutOfBandPairingDeclineCount
{
  unsigned __int8 v3 = [(CRPairingPromptFlowController *)self promptDelegate];
  if (v3 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [v3 incrementOutOfBandPairingDeclineCountForPairingPromptFlow:self];
    id v4 = CarPairingLogging();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "incremented OOB pairing decline count", v5, 2u);
    }
  }
}

- (id)_carKeyInfo
{
  unsigned __int8 v3 = [(CRPairingPromptFlowController *)self promptDelegate];
  if (v3 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v4 = [v3 carKeyInfoForPairingPromptFlow:self];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (BOOL)_supportsCarKeys
{
  v2 = [(CRPairingPromptFlowController *)self _carKeyInfo];

  unsigned __int8 v3 = CarPairingLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    CFStringRef v4 = @"NO";
    if (v2) {
      CFStringRef v4 = @"YES";
    }
    int v6 = 138412290;
    CFStringRef v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "supports car keys: %@", (uint8_t *)&v6, 0xCu);
  }

  return v2 != 0;
}

- (unint64_t)_nextStepAfterResponse:(id)a3
{
  id v4 = a3;
  switch([(CRPairingPromptFlowController *)self currentStep])
  {
    case 0uLL:
      if ([(CRPairingPromptFlowController *)self bluetoothFailureReason]) {
        goto LABEL_12;
      }
      int v6 = [(CRPairingPromptFlowController *)self messagingVehicle];
      if (v6)
      {
      }
      else
      {
        v16 = [(CRPairingPromptFlowController *)self numericCode];

        if (v16)
        {
          unint64_t v5 = 2;
          goto LABEL_37;
        }
      }
      if ([(CRPairingPromptFlowController *)self startedFromCarKey]) {
        unint64_t v5 = 1;
      }
      else {
        unint64_t v5 = 5;
      }
      goto LABEL_37;
    case 1uLL:
      BOOL v7 = [v4 BOOLValue] == 0;
      uint64_t v8 = 15;
      uint64_t v9 = 5;
      goto LABEL_28;
    case 2uLL:
      if ([(CRPairingPromptFlowController *)self bluetoothFailureReason])
      {
LABEL_12:
        unint64_t v5 = 4;
        goto LABEL_37;
      }
      if (![v4 BOOLValue]) {
        goto LABEL_2;
      }
      BOOL v7 = ![(CRPairingPromptFlowController *)self showBluetoothOnlyOption];
      uint64_t v8 = 5;
      uint64_t v9 = 3;
      goto LABEL_28;
    case 3uLL:
      BOOL v10 = [(CRPairingPromptFlowController *)self bluetoothFailureReason] == 0;
      uint64_t v11 = 4;
      goto LABEL_34;
    case 4uLL:
    case 0xCuLL:
    case 0xDuLL:
    case 0xEuLL:
    case 0xFuLL:
      goto LABEL_2;
    case 5uLL:
      if ([v4 BOOLValue])
      {
        if ([(CRPairingPromptFlowController *)self _isMessagingBluetoothConnected])
        {
          v12 = [(CRPairingPromptFlowController *)self pairingAccepted];

          if (!v12)
          {
            unint64_t v5 = 8;
            goto LABEL_37;
          }
        }
        if ([(CRPairingPromptFlowController *)self _supportsUSB])
        {
          unsigned __int8 v13 = [(CRPairingPromptFlowController *)self pairingAccepted];
          if (v13)
          {
          }
          else if (![(CRPairingPromptFlowController *)self _supportsThemeAssets])
          {
            unint64_t v5 = 6;
            goto LABEL_37;
          }
        }
        if ([(CRPairingPromptFlowController *)self _supportsOutOfBandPairing])
        {
          unint64_t v5 = 7;
        }
        else
        {
          unsigned int v14 = [(CRPairingPromptFlowController *)self startedFromCarKey];
LABEL_27:
          BOOL v7 = v14 == 0;
          uint64_t v8 = 15;
          uint64_t v9 = 9;
LABEL_28:
          if (v7) {
            unint64_t v5 = v8;
          }
          else {
            unint64_t v5 = v9;
          }
        }
      }
      else if ([(CRPairingPromptFlowController *)self bluetoothFailureReason])
      {
        unint64_t v5 = 4;
      }
      else
      {
        unint64_t v5 = 15;
      }
      goto LABEL_37;
    case 6uLL:
      if (![v4 BOOLValue]) {
        goto LABEL_2;
      }
      BOOL v7 = ![(CRPairingPromptFlowController *)self _supportsOutOfBandPairing];
      uint64_t v8 = 9;
      uint64_t v9 = 7;
      goto LABEL_28;
    case 7uLL:
      if ([(CRPairingPromptFlowController *)self _supportsUSB]
        && ![(CRPairingPromptFlowController *)self _supportsThemeAssets]
        || ([v4 BOOLValue] & 1) != 0)
      {
        unint64_t v5 = 9;
        goto LABEL_37;
      }
      [(CRPairingPromptFlowController *)self _cancelWithRequiredStepsRemaining:1];
      goto LABEL_2;
    case 8uLL:
      unsigned int v14 = [v4 BOOLValue];
      goto LABEL_27;
    case 9uLL:
      if ([(CRPairingPromptFlowController *)self _supportsThemeAssets])
      {
        unint64_t v5 = 11;
      }
      else if ([(CRPairingPromptFlowController *)self _supportsEnhancedIntegration])
      {
        unint64_t v5 = 10;
      }
      else
      {
LABEL_43:
        if (![(CRPairingPromptFlowController *)self _supportsCarKeys]
          || [(CRPairingPromptFlowController *)self startedFromCarKey])
        {
LABEL_2:
          unint64_t v5 = 15;
        }
        else
        {
          unint64_t v5 = 14;
        }
      }
LABEL_37:

      return v5;
    case 0xAuLL:
      goto LABEL_43;
    case 0xBuLL:
      BOOL v10 = [v4 BOOLValue] == 0;
      uint64_t v11 = 12;
LABEL_34:
      if (v10) {
        unint64_t v5 = v11 + 1;
      }
      else {
        unint64_t v5 = v11;
      }
      goto LABEL_37;
    default:
      unint64_t v5 = 0;
      goto LABEL_37;
  }
}

- (void)_presentNextStepAfterResponse:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(CRPairingPromptFlowController *)self _nextStepAfterResponse:v4];
  int v6 = CarPairingLogging();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v7 = [(id)objc_opt_class() _descriptionForStep:v5];
    *(_DWORD *)buf = 138543362;
    v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "next pairing step: [%{public}@]", buf, 0xCu);
  }
  [(CRPairingPromptFlowController *)self setCurrentStep:v5];
  objc_initWeak((id *)buf, self);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100041854;
  v13[3] = &unk_1000BE698;
  objc_copyWeak(&v14, (id *)buf);
  uint64_t v8 = objc_retainBlock(v13);
  uint64_t v9 = (void (**)(void, void))v8;
  switch(v5)
  {
    case 0uLL:
      BOOL v10 = CarPairingLogging();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_100074508();
      }

      goto LABEL_7;
    case 1uLL:
      [(CRPairingPromptFlowController *)self _presentConnectCarPlayFromCarKeyPromptWithCompletion:v8];
      break;
    case 2uLL:
      [(CRPairingPromptFlowController *)self _presentBluetoothConfirmationPromptWithCompletion:v8];
      break;
    case 3uLL:
      [(CRPairingPromptFlowController *)self _presentBluetoothContactsSyncPromptWithCompletion:v8];
      break;
    case 4uLL:
      [(CRPairingPromptFlowController *)self _presentBluetoothFailedPromptWithCompletion:v8];
      break;
    case 5uLL:
      uint64_t v11 = [(CRPairingPromptFlowController *)self messagingVehicle];
      BOOL v12 = v11 == 0;

      if (v12) {
        [(CRPairingPromptFlowController *)self _presentWaitingPrompt];
      }
      else {
        ((void (**)(void, void *))v9)[2](v9, &__kCFBooleanTrue);
      }
      break;
    case 6uLL:
      [(CRPairingPromptFlowController *)self _presentAllowWhileLockedPromptWithCompletion:v8];
      break;
    case 7uLL:
      [(CRPairingPromptFlowController *)self _presentUseWirelessCarPlayPromptWithCompletion:v8];
      break;
    case 8uLL:
      [(CRPairingPromptFlowController *)self _presentConnectCarPlayPromptWithCompletion:v8];
      break;
    case 9uLL:
      ((void (*)(void *, void))v8[2])(v8, 0);
      break;
    case 0xAuLL:
      [(CRPairingPromptFlowController *)self _presentEnhancedIntegrationPromptWithCompletion:v8];
      break;
    case 0xBuLL:
      [(CRPairingPromptFlowController *)self _presentAssetProgressPromptWithCompletion:v8];
      break;
    case 0xCuLL:
      [(CRPairingPromptFlowController *)self _presentAssetReadyPromptWithCompletion:v8];
      break;
    case 0xDuLL:
      [(CRPairingPromptFlowController *)self _presentAssetReadySoonPromptWithCompletion:v8];
      break;
    case 0xEuLL:
      [(CRPairingPromptFlowController *)self _presentSetupCarKeysWithCompletion:v8];
      break;
    case 0xFuLL:
LABEL_7:
      [(CRPairingPromptFlowController *)self _dismiss];
      break;
    default:
      break;
  }

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);
}

- (void)_performPresentationAction:(id)a3
{
  id v5 = a3;
  id v4 = [(CRPairingPromptFlowController *)self promptDelegate];
  if (v4 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v4 pairingPromptFlow:self wantsToPerformPresentation:v5];
  }
}

- (void)_dismiss
{
  uint64_t v3 = [(CRPairingPromptFlowController *)self promptDelegate];
  if (v3)
  {
    id v4 = (void *)v3;
    if (objc_opt_respondsToSelector()) {
      [v4 didCompletePairingPromptFlow:self];
    }
  }

  _objc_release_x2();
}

- (void)_presentBluetoothConfirmationPromptWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(CRPairingPromptFlowController *)self bluetoothDeviceIdentifier];
  int v6 = [(CRPairingPromptFlowController *)self vehicleName];
  BOOL v7 = [(CRPairingPromptFlowController *)self numericCode];
  objc_initWeak(&location, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100041BBC;
  v12[3] = &unk_1000BE6C0;
  id v8 = v6;
  id v13 = v8;
  id v9 = v7;
  id v14 = v9;
  objc_copyWeak(&v17, &location);
  id v10 = v5;
  id v15 = v10;
  id v11 = v4;
  id v16 = v11;
  [(CRPairingPromptFlowController *)self _performPresentationAction:v12];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (void)_presentBluetoothContactsSyncPromptWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(CRPairingPromptFlowController *)self bluetoothDeviceIdentifier];
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100041F54;
  v8[3] = &unk_1000BE6E8;
  objc_copyWeak(&v11, &location);
  id v6 = v5;
  id v9 = v6;
  id v7 = v4;
  id v10 = v7;
  [(CRPairingPromptFlowController *)self _performPresentationAction:v8];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)_presentBluetoothFailedPromptWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(CRPairingPromptFlowController *)self vehicleName];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000422B8;
  v8[3] = &unk_1000BE710;
  BOOL v11 = (id)[(CRPairingPromptFlowController *)self bluetoothFailureReason] == (id)2;
  id v9 = v5;
  id v10 = v4;
  id v6 = v4;
  id v7 = v5;
  [(CRPairingPromptFlowController *)self _performPresentationAction:v8];
}

- (void)_presentWaitingPrompt
{
  uint64_t v3 = CarPairingLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "waiting on messaging connection", v4, 2u);
  }

  [(CRPairingPromptFlowController *)self _startWaitingOnMessagingVehicleTimer];
  [(CRPairingPromptFlowController *)self _performPresentationAction:&stru_1000BE750];
}

- (void)_presentAllowWhileLockedPromptWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(CRPairingPromptFlowController *)self vehicleName];
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100042574;
  v8[3] = &unk_1000BE7A0;
  id v6 = v5;
  id v9 = v6;
  objc_copyWeak(&v11, &location);
  id v7 = v4;
  id v10 = v7;
  [(CRPairingPromptFlowController *)self _performPresentationAction:v8];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)_presentUseWirelessCarPlayPromptWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  if ([(CRPairingPromptFlowController *)self _hasExistingBluetoothPairing])
  {
    id v5 = CarPairingLogging();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      id v6 = "already paired, will not present OOB prompt";
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)buf, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  unint64_t v7 = [(CRPairingPromptFlowController *)self _outOfBandPairingDeclineCount];
  if (v7 >= 4)
  {
    id v5 = CarPairingLogging();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      id v6 = "at maximum decline count for OOB prompt, will not present";
      goto LABEL_7;
    }
LABEL_8:

    v4[2](v4, 0);
    goto LABEL_30;
  }
  unint64_t v8 = v7;
  unsigned int v9 = [(CRPairingPromptFlowController *)self _needsBluetoothTurnedOn];
  unsigned int v10 = [(CRPairingPromptFlowController *)self _needsWiFiTurnedOn];
  unsigned int v11 = v10;
  if (v9)
  {
    BOOL v12 = CarPairingLogging();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "OOB prompt will ask to enable Bluetooth", (uint8_t *)buf, 2u);
    }

    uint64_t v13 = 1;
    if (!v11) {
      goto LABEL_18;
    }
    goto LABEL_15;
  }
  uint64_t v13 = 0;
  if (v10)
  {
LABEL_15:
    id v14 = CarPairingLogging();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "OOB prompt will ask to enable Wi-Fi", (uint8_t *)buf, 2u);
    }

    v13 |= 2uLL;
  }
LABEL_18:
  if (v8 < 3)
  {
    unsigned int v17 = [(CRPairingPromptFlowController *)self _supportsUSB];
    id v15 = CarPairingLogging();
    BOOL v18 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    if (v17)
    {
      if (v18)
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "supports USB - OOB prompt will have USB decline variant", (uint8_t *)buf, 2u);
      }
      uint64_t v16 = 0;
    }
    else
    {
      if (v18)
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "OOB prompt will have not now decline variant", (uint8_t *)buf, 2u);
      }
      uint64_t v16 = 1;
    }
  }
  else
  {
    id v15 = CarPairingLogging();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      uint64_t v16 = 2;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "OOB prompt will have don't use decline variant", (uint8_t *)buf, 2u);
    }
    else
    {
      uint64_t v16 = 2;
    }
  }

  objc_initWeak(buf, self);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100042B08;
  v19[3] = &unk_1000BE7F0;
  objc_copyWeak(v21, buf);
  char v22 = v9;
  char v23 = v11;
  v19[4] = self;
  v20 = v4;
  v21[1] = (id)v13;
  v21[2] = (id)v16;
  [(CRPairingPromptFlowController *)self _performPresentationAction:v19];

  objc_destroyWeak(v21);
  objc_destroyWeak(buf);
LABEL_30:
}

- (void)_presentConnectCarPlayPromptWithCompletion:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(CRPairingPromptFlowController *)self showBluetoothOnlyOption];
  unsigned int v6 = [(CRPairingPromptFlowController *)self _needsWiFiTurnedOn];
  char v7 = v6;
  if (v6)
  {
    unint64_t v8 = CarPairingLogging();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "connect prompt will ask to enable Wi-Fi", (uint8_t *)buf, 2u);
    }

    uint64_t v9 = 2;
  }
  else
  {
    uint64_t v9 = 0;
  }
  objc_initWeak(buf, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100042ED0;
  v11[3] = &unk_1000BE840;
  objc_copyWeak(v13, buf);
  char v14 = v7;
  id v10 = v4;
  v11[4] = self;
  id v12 = v10;
  unsigned __int8 v15 = v5;
  v13[1] = (id)v9;
  [(CRPairingPromptFlowController *)self _performPresentationAction:v11];

  objc_destroyWeak(v13);
  objc_destroyWeak(buf);
}

- (void)_presentConnectCarPlayFromCarKeyPromptWithCompletion:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(CRPairingPromptFlowController *)self showBluetoothOnlyOption];
  unsigned int v6 = [(CRPairingPromptFlowController *)self _needsWiFiTurnedOn];
  char v7 = v6;
  if (v6)
  {
    unint64_t v8 = CarPairingLogging();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "connect prompt will ask to enable Wi-Fi", (uint8_t *)buf, 2u);
    }

    uint64_t v9 = 2;
  }
  else
  {
    uint64_t v9 = 0;
  }
  objc_initWeak(buf, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000432C0;
  v11[3] = &unk_1000BE840;
  objc_copyWeak(v13, buf);
  char v14 = v7;
  id v10 = v4;
  v11[4] = self;
  id v12 = v10;
  unsigned __int8 v15 = v5;
  v13[1] = (id)v9;
  [(CRPairingPromptFlowController *)self _performPresentationAction:v11];

  objc_destroyWeak(v13);
  objc_destroyWeak(buf);
}

- (void)_presentEnhancedIntegrationPromptWithCompletion:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(CRPairingPromptFlowController *)self vehicleName];
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100043698;
  v8[3] = &unk_1000BE7A0;
  id v6 = v5;
  id v9 = v6;
  objc_copyWeak(&v11, &location);
  id v7 = v4;
  id v10 = v7;
  [(CRPairingPromptFlowController *)self _performPresentationAction:v8];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)_presentAssetProgressPromptWithCompletion:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(CRPairingPromptFlowController *)self vehicleName];
  id v6 = [(CRPairingPromptFlowController *)self promptDelegate];
  if (v6 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v7 = [v6 assetProgressForPairingPromptFlow:self];
  }
  else
  {
    id v7 = 0;
  }
  objc_initWeak(&location, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100043A2C;
  v11[3] = &unk_1000BE868;
  id v8 = v5;
  id v12 = v8;
  id v9 = v7;
  id v13 = v9;
  id v10 = v4;
  id v14 = v10;
  objc_copyWeak(&v15, &location);
  [(CRPairingPromptFlowController *)self _performPresentationAction:v11];
  objc_destroyWeak(&v15);

  objc_destroyWeak(&location);
}

- (void)_presentAssetReadyPromptWithCompletion:(id)a3
{
  id v4 = a3;
  [(CRPairingPromptFlowController *)self vehicleName];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100043D94;
  v7[3] = &unk_1000BE0F0;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = v4;
  id v5 = v4;
  id v6 = v8;
  [(CRPairingPromptFlowController *)self _performPresentationAction:v7];
}

- (void)_presentAssetReadySoonPromptWithCompletion:(id)a3
{
  id v4 = a3;
  [(CRPairingPromptFlowController *)self vehicleName];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100043F68;
  v7[3] = &unk_1000BE0F0;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = v4;
  id v5 = v4;
  id v6 = v8;
  [(CRPairingPromptFlowController *)self _performPresentationAction:v7];
}

- (void)_presentSetupCarKeysWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(CRPairingPromptFlowController *)self vehicleName];
  [(CRPairingPromptFlowController *)self _carKeyInfo];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100044164;
  v9[3] = &unk_1000BE890;
  id v10 = v5;
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  id v12 = v4;
  id v6 = v4;
  id v7 = v11;
  id v8 = v5;
  [(CRPairingPromptFlowController *)self _performPresentationAction:v9];
}

- (void)_startWaitingOnMessagingVehicleTimer
{
  [(CRPairingPromptFlowController *)self _stopWaitingOnMessagingVehicleTimer];
  uint64_t v3 = CarPairingLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "starting waiting on messaging vehicle timer", v5, 2u);
  }

  [(CRPairingPromptFlowController *)self waitingOnMessagingVehicleTimeout];
  id v4 = +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "_handleTimedOutWaitingOnMessagingVehicle:", 0, 0);
  [(CRPairingPromptFlowController *)self setWaitingOnMessagingVehicleTimer:v4];
}

- (void)_stopWaitingOnMessagingVehicleTimer
{
  uint64_t v3 = [(CRPairingPromptFlowController *)self waitingOnMessagingVehicleTimer];
  id v4 = v3;
  if (v3 && [v3 isValid])
  {
    id v5 = CarPairingLogging();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "stopping waiting on messaging vehicle timer", v6, 2u);
    }

    [v4 invalidate];
    [(CRPairingPromptFlowController *)self setWaitingOnMessagingVehicleTimer:0];
  }
}

- (void)_handleTimedOutWaitingOnMessagingVehicle:(id)a3
{
  if ((id)[(CRPairingPromptFlowController *)self currentStep] == (id)5)
  {
    id v4 = CarPairingLogging();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10007453C();
    }

    [(CRPairingPromptFlowController *)self _presentNextStepAfterResponse:&__kCFBooleanFalse];
  }
}

- (CRMessagingServiceVehicleRepresenting)messagingVehicle
{
  return self->_messagingVehicle;
}

- (void)setMessagingVehicle:(id)a3
{
}

- (NSString)bluetoothDeviceIdentifier
{
  return self->_bluetoothDeviceIdentifier;
}

- (void)setBluetoothDeviceIdentifier:(id)a3
{
}

- (CRPairingPromptFlowDelegate)promptDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_promptDelegate);

  return (CRPairingPromptFlowDelegate *)WeakRetained;
}

- (void)setPromptDelegate:(id)a3
{
}

- (id)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (BOOL)startedFromCarKey
{
  return self->_startedFromCarKey;
}

- (void)setStartedFromCarKey:(BOOL)a3
{
  self->_startedFromCarKey = a3;
}

- (unint64_t)currentStep
{
  return self->_currentStep;
}

- (void)setCurrentStep:(unint64_t)a3
{
  self->_currentStep = a3;
}

- (NSNumber)bluetoothConfirmed
{
  return self->_bluetoothConfirmed;
}

- (void)setBluetoothConfirmed:(id)a3
{
}

- (NSString)vehicleName
{
  return self->_vehicleName;
}

- (void)setVehicleName:(id)a3
{
}

- (NSString)numericCode
{
  return self->_numericCode;
}

- (void)setNumericCode:(id)a3
{
}

- (BOOL)showBluetoothOnlyOption
{
  return self->_showBluetoothOnlyOption;
}

- (void)setShowBluetoothOnlyOption:(BOOL)a3
{
  self->_showBluetoothOnlyOption = a3;
}

- (unint64_t)bluetoothFailureReason
{
  return self->_bluetoothFailureReason;
}

- (void)setBluetoothFailureReason:(unint64_t)a3
{
  self->_bluetoothFailureReason = a3;
}

- (NSTimer)waitingOnMessagingVehicleTimer
{
  return self->_waitingOnMessagingVehicleTimer;
}

- (void)setWaitingOnMessagingVehicleTimer:(id)a3
{
}

- (NSNumber)pairingAccepted
{
  return self->_pairingAccepted;
}

- (void)setPairingAccepted:(id)a3
{
}

- (double)waitingOnMessagingVehicleTimeout
{
  return self->_waitingOnMessagingVehicleTimeout;
}

- (void)setWaitingOnMessagingVehicleTimeout:(double)a3
{
  self->_waitingOnMessagingVehicleTimeout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairingAccepted, 0);
  objc_storeStrong((id *)&self->_waitingOnMessagingVehicleTimer, 0);
  objc_storeStrong((id *)&self->_numericCode, 0);
  objc_storeStrong((id *)&self->_vehicleName, 0);
  objc_storeStrong((id *)&self->_bluetoothConfirmed, 0);
  objc_storeStrong(&self->_userInfo, 0);
  objc_destroyWeak((id *)&self->_promptDelegate);
  objc_storeStrong((id *)&self->_bluetoothDeviceIdentifier, 0);

  objc_storeStrong((id *)&self->_messagingVehicle, 0);
}

@end
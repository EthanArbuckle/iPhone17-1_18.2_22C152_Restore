@interface SBSystemServiceServer
+ (SBSystemServiceServer)sharedInstance;
- (SBSystemServiceServerAppSwitcherDelegate)appSwitcherDelegate;
- (SBSystemServiceServerBiometricsDelegate)biometricsDelegate;
- (SBSystemServiceServerHardwareButtonDelegate)hardwareButtonDelegate;
- (SBSystemServiceServerSoftwareUpdateDelegate)softwareUpdateDelegate;
- (SBSystemServiceServerStateDumpDelegate)stateDumpDelegate;
- (SBSystemServiceServerSystemApertureStateDumpDelegate)systemApertureStateDumpDelegate;
- (SBSystemServiceServerTestAutomationDelegate)testAutomationDelegate;
- (id)_init;
- (void)_handleBiometricsFetchUnlockCredentialSetMessage:(id)a3 fromClient:(id)a4;
- (void)_handleHardwareButtonAcquireAssertionMessage:(id)a3 fromClient:(id)a4;
- (void)_handleHardwareButtonGetHapticType:(id)a3 fromClient:(id)a4;
- (void)_handleHardwareButtonGetHintViewsSupported:(id)a3 fromClient:(id)a4;
- (void)_handleHardwareButtonGetToggleButtonState:(id)a3 fromClient:(id)a4;
- (void)_handleHardwareButtonRegisterAssociatedHintView:(id)a3 fromClient:(id)a4;
- (void)_handleHardwareButtonRequestSystemGlowEffect:(id)a3 fromClient:(id)a4;
- (void)_handleHardwareButtonSetHapticType:(id)a3 fromClient:(id)a4;
- (void)_handleHardwareButtonSetPressEventMask:(id)a3 fromClient:(id)a4;
- (void)_handleHardwareButtonSetRequestsHIDEvents:(id)a3 fromClient:(id)a4;
- (void)_handleHardwareButtonUpdateHintContentVisibility:(id)a3 fromClient:(id)a4;
- (void)_handleHardwareButtonUpdateSystemGlowStyle:(id)a3 fromClient:(id)a4;
- (void)_handleLoadStashedSwitcherModelFromPath:(id)a3 fromClient:(id)a4;
- (void)_handleRequestAppSwitcherAppearanceForHiddenApp:(id)a3 fromClient:(id)a4;
- (void)_handleSoftwareUpdateGetPasscodePolicy:(id)a3 fromClient:(id)a4;
- (void)_handleSoftwareUpdateSetPasscodePolicy:(id)a3 fromClient:(id)a4;
- (void)_handleStashSwitcherModelToPath:(id)a3 fromClient:(id)a4;
- (void)_handleStateDumpServiceClientMessageTypeDisableRemoteStateDump:(id)a3 fromClient:(id)a4;
- (void)_handleStateDumpServiceClientMessageTypeEnableRemoteStateDump:(id)a3 fromClient:(id)a4;
- (void)_handleStateDumpServiceClientMessageTypeStateDump:(id)a3 fromClient:(id)a4;
- (void)_handleStateDumpServiceClientMessageTypeStateDumpToFile:(id)a3 fromClient:(id)a4;
- (void)_handleSystemApertureRequestStateDump:(id)a3 fromClient:(id)a4;
- (void)_handleSystemApertureRequestToWriteStateDumpToFile:(id)a3 fromClient:(id)a4;
- (void)_handleTestAutomationAddSpecificWidgetStackToPageWithSize:(id)a3 fromClient:(id)a4;
- (void)_handleTestAutomationAddSpecificWidgetToPageWithSize:(id)a3 fromClient:(id)a4;
- (void)_handleTestAutomationAddWidgetsToEachPage:(id)a3 fromClient:(id)a4;
- (void)_handleTestAutomationBlockApplicationForScreenTime:(id)a3 fromClient:(id)a4;
- (void)_handleTestAutomationClearAllUserNotifications:(id)a3 fromClient:(id)a4;
- (void)_handleTestAutomationEnterLostMode:(id)a3 fromClient:(id)a4;
- (void)_handleTestAutomationExitLostMode:(id)a3 fromClient:(id)a4;
- (void)_handleTestAutomationGetChamoisPrefersDockHidden:(id)a3 fromClient:(id)a4;
- (void)_handleTestAutomationGetChamoisPrefersStripHidden:(id)a3 fromClient:(id)a4;
- (void)_handleTestAutomationGetChamoisWindowingUIEnabled:(id)a3 fromClient:(id)a4;
- (void)_handleTestAutomationGetDeviceSupportsSystemAperture:(id)a3 fromClient:(id)a4;
- (void)_handleTestAutomationGetScencesForBundleIdentifier:(id)a3 fromClient:(id)a4;
- (void)_handleTestAutomationGetSpringBoardFrameRecording:(id)a3 fromClient:(id)a4;
- (void)_handleTestAutomationGetSystemApertureModelStateDump:(id)a3 fromClient:(id)a4;
- (void)_handleTestAutomationGetSystemApertureStateDump:(id)a3 fromClient:(id)a4;
- (void)_handleTestAutomationGetWidgetControllerStateDump:(id)a3 fromClient:(id)a4;
- (void)_handleTestAutomationRequestHUDHiddenAssertion:(id)a3 fromClient:(id)a4;
- (void)_handleTestAutomationRequestReachabilityEnabledAssertion:(id)a3 fromClient:(id)a4;
- (void)_handleTestAutomationResetToHomeScreen:(id)a3 fromClient:(id)a4;
- (void)_handleTestAutomationSetAccessoryAttachedState:(id)a3 fromClient:(id)a4;
- (void)_handleTestAutomationSetAlertState:(id)a3 fromClient:(id)a4;
- (void)_handleTestAutomationSetAmbientPresentationState:(id)a3 fromClient:(id)a4;
- (void)_handleTestAutomationSetChamoisPrefersDockHidden:(id)a3 fromClient:(id)a4;
- (void)_handleTestAutomationSetChamoisPrefersStripHidden:(id)a3 fromClient:(id)a4;
- (void)_handleTestAutomationSetChamoisWindowingUIEnabled:(id)a3 fromClient:(id)a4;
- (void)_handleTestAutomationSetHiddenFeatureState:(id)a3 fromClient:(id)a4;
- (void)_handleTestAutomationSetIdleTimerState:(id)a3 fromClient:(id)a4;
- (void)_handleTestAutomationSetMallocStackLoggingState:(id)a3 fromClient:(id)a4;
- (void)_handleTestAutomationSetOrientationLockState:(id)a3 fromClient:(id)a4;
- (void)_handleTestAutomationSetReachabilityActiveState:(id)a3 fromClient:(id)a4;
- (void)_handleTestAutomationSetSpringBoardAnimationFrameRecording:(id)a3 fromClient:(id)a4;
- (void)_handleTestAutomationSetSystemApertureUnderAutomationTesting:(id)a3 fromClient:(id)a4;
- (void)_handleTestAutomationSetTestRunnerRecoveryApplicationBundleIdentifier:(id)a3 fromClient:(id)a4;
- (void)_handleTestAutomationSetUserPresenceDetectedSinceWake:(id)a3 fromClient:(id)a4;
- (void)_handleTestAutomationSuspendAllDisplays:(id)a3 fromClient:(id)a4;
- (void)dealloc;
- (void)noteClientDidDisconnect:(id)a3;
- (void)noteDidReceiveMessage:(id)a3 withType:(int64_t)a4 fromClient:(id)a5;
- (void)setAppSwitcherDelegate:(id)a3;
- (void)setBiometricsDelegate:(id)a3;
- (void)setHardwareButtonDelegate:(id)a3;
- (void)setSoftwareUpdateDelegate:(id)a3;
- (void)setStateDumpDelegate:(id)a3;
- (void)setSystemApertureStateDumpDelegate:(id)a3;
- (void)setTestAutomationDelegate:(id)a3;
@end

@implementation SBSystemServiceServer

- (void)noteDidReceiveMessage:(id)a3 withType:(int64_t)a4 fromClient:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  switch(a4)
  {
    case 0:
      [(SBSystemServiceServer *)self _handleRequestAppSwitcherAppearanceForHiddenApp:v8 fromClient:v9];
      break;
    case 1:
      [(SBSystemServiceServer *)self _handleBiometricsFetchUnlockCredentialSetMessage:v8 fromClient:v9];
      break;
    case 2:
      [(SBSystemServiceServer *)self _handleHardwareButtonAcquireAssertionMessage:v8 fromClient:v9];
      break;
    case 3:
      [(SBSystemServiceServer *)self _handleHardwareButtonSetPressEventMask:v8 fromClient:v9];
      break;
    case 4:
      [(SBSystemServiceServer *)self _handleHardwareButtonSetRequestsHIDEvents:v8 fromClient:v9];
      break;
    case 5:
      [(SBSystemServiceServer *)self _handleHardwareButtonGetToggleButtonState:v8 fromClient:v9];
      break;
    case 6:
      [(SBSystemServiceServer *)self _handleHardwareButtonSetHapticType:v8 fromClient:v9];
      break;
    case 7:
      [(SBSystemServiceServer *)self _handleHardwareButtonGetHapticType:v8 fromClient:v9];
      break;
    case 8:
      [(SBSystemServiceServer *)self _handleHardwareButtonGetHintViewsSupported:v8 fromClient:v9];
      break;
    case 9:
      [(SBSystemServiceServer *)self _handleHardwareButtonRegisterAssociatedHintView:v8 fromClient:v9];
      break;
    case 10:
      [(SBSystemServiceServer *)self _handleHardwareButtonUpdateHintContentVisibility:v8 fromClient:v9];
      break;
    case 11:
      [(SBSystemServiceServer *)self _handleHardwareButtonRequestSystemGlowEffect:v8 fromClient:v9];
      break;
    case 12:
      [(SBSystemServiceServer *)self _handleHardwareButtonUpdateSystemGlowStyle:v8 fromClient:v9];
      break;
    case 13:
      [(SBSystemServiceServer *)self _handleSoftwareUpdateSetPasscodePolicy:v8 fromClient:v9];
      break;
    case 14:
      [(SBSystemServiceServer *)self _handleSoftwareUpdateGetPasscodePolicy:v8 fromClient:v9];
      break;
    case 15:
      [(SBSystemServiceServer *)self _handleTestAutomationSuspendAllDisplays:v8 fromClient:v9];
      break;
    case 16:
      [(SBSystemServiceServer *)self _handleTestAutomationClearAllUserNotifications:v8 fromClient:v9];
      break;
    case 17:
      [(SBSystemServiceServer *)self _handleTestAutomationSetAlertState:v8 fromClient:v9];
      break;
    case 18:
      [(SBSystemServiceServer *)self _handleTestAutomationSetHiddenFeatureState:v8 fromClient:v9];
      break;
    case 19:
      [(SBSystemServiceServer *)self _handleTestAutomationSetIdleTimerState:v8 fromClient:v9];
      break;
    case 20:
      [(SBSystemServiceServer *)self _handleTestAutomationSetOrientationLockState:v8 fromClient:v9];
      break;
    case 21:
      [(SBSystemServiceServer *)self _handleTestAutomationSetMallocStackLoggingState:v8 fromClient:v9];
      break;
    case 22:
      [(SBSystemServiceServer *)self _handleTestAutomationSetReachabilityActiveState:v8 fromClient:v9];
      break;
    case 23:
      [(SBSystemServiceServer *)self _handleTestAutomationRequestReachabilityEnabledAssertion:v8 fromClient:v9];
      break;
    case 24:
      [(SBSystemServiceServer *)self _handleTestAutomationSetAmbientPresentationState:v8 fromClient:v9];
      break;
    case 25:
      [(SBSystemServiceServer *)self _handleTestAutomationResetToHomeScreen:v8 fromClient:v9];
      break;
    case 26:
      [(SBSystemServiceServer *)self _handleTestAutomationSetAccessoryAttachedState:v8 fromClient:v9];
      break;
    case 27:
      [(SBSystemServiceServer *)self _handleTestAutomationRequestHUDHiddenAssertion:v8 fromClient:v9];
      break;
    case 28:
      [(SBSystemServiceServer *)self _handleTestAutomationBlockApplicationForScreenTime:v8 fromClient:v9];
      break;
    case 29:
      [(SBSystemServiceServer *)self _handleTestAutomationSetTestRunnerRecoveryApplicationBundleIdentifier:v8 fromClient:v9];
      break;
    case 31:
      [(SBSystemServiceServer *)self _handleStashSwitcherModelToPath:v8 fromClient:v9];
      break;
    case 32:
      [(SBSystemServiceServer *)self _handleLoadStashedSwitcherModelFromPath:v8 fromClient:v9];
      break;
    case 33:
      [(SBSystemServiceServer *)self _handleTestAutomationAddWidgetsToEachPage:v8 fromClient:v9];
      break;
    case 34:
      [(SBSystemServiceServer *)self _handleTestAutomationAddSpecificWidgetToPageWithSize:v8 fromClient:v9];
      break;
    case 35:
      [(SBSystemServiceServer *)self _handleTestAutomationAddSpecificWidgetStackToPageWithSize:v8 fromClient:v9];
      break;
    case 36:
      [(SBSystemServiceServer *)self _handleTestAutomationEnterLostMode:v8 fromClient:v9];
      break;
    case 37:
      [(SBSystemServiceServer *)self _handleTestAutomationExitLostMode:v8 fromClient:v9];
      break;
    case 38:
      [(SBSystemServiceServer *)self _handleTestAutomationGetChamoisWindowingUIEnabled:v8 fromClient:v9];
      break;
    case 39:
      [(SBSystemServiceServer *)self _handleTestAutomationSetChamoisWindowingUIEnabled:v8 fromClient:v9];
      break;
    case 40:
      [(SBSystemServiceServer *)self _handleTestAutomationGetChamoisPrefersDockHidden:v8 fromClient:v9];
      break;
    case 41:
      [(SBSystemServiceServer *)self _handleTestAutomationSetChamoisPrefersDockHidden:v8 fromClient:v9];
      break;
    case 42:
      [(SBSystemServiceServer *)self _handleTestAutomationGetChamoisPrefersStripHidden:v8 fromClient:v9];
      break;
    case 43:
      [(SBSystemServiceServer *)self _handleTestAutomationSetChamoisPrefersStripHidden:v8 fromClient:v9];
      break;
    case 44:
      [(SBSystemServiceServer *)self _handleTestAutomationSetUserPresenceDetectedSinceWake:v8 fromClient:v9];
      break;
    case 45:
      [(SBSystemServiceServer *)self _handleTestAutomationGetDeviceSupportsSystemAperture:v8 fromClient:v9];
      break;
    case 46:
      [(SBSystemServiceServer *)self _handleTestAutomationGetSystemApertureStateDump:v8 fromClient:v9];
      break;
    case 47:
      [(SBSystemServiceServer *)self _handleTestAutomationGetWidgetControllerStateDump:v8 fromClient:v9];
      break;
    case 48:
      [(SBSystemServiceServer *)self _handleTestAutomationSetSpringBoardAnimationFrameRecording:v8 fromClient:v9];
      break;
    case 49:
      [(SBSystemServiceServer *)self _handleTestAutomationGetSpringBoardFrameRecording:v8 fromClient:v9];
      break;
    case 50:
      [(SBSystemServiceServer *)self _handleTestAutomationSetSystemApertureUnderAutomationTesting:v8 fromClient:v9];
      break;
    case 51:
      [(SBSystemServiceServer *)self _handleTestAutomationGetSystemApertureModelStateDump:v8 fromClient:v9];
      break;
    case 52:
      [(SBSystemServiceServer *)self _handleSystemApertureRequestToWriteStateDumpToFile:v8 fromClient:v9];
      break;
    case 53:
      [(SBSystemServiceServer *)self _handleSystemApertureRequestStateDump:v8 fromClient:v9];
      break;
    case 54:
      [(SBSystemServiceServer *)self _handleStateDumpServiceClientMessageTypeStateDump:v8 fromClient:v9];
      break;
    case 55:
      [(SBSystemServiceServer *)self _handleStateDumpServiceClientMessageTypeStateDumpToFile:v8 fromClient:v9];
      break;
    case 56:
      [(SBSystemServiceServer *)self _handleStateDumpServiceClientMessageTypeEnableRemoteStateDump:v8 fromClient:v9];
      break;
    case 57:
      [(SBSystemServiceServer *)self _handleStateDumpServiceClientMessageTypeDisableRemoteStateDump:v8 fromClient:v9];
      break;
    default:
      v10 = SBLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = (objc_class *)objc_opt_class();
        v12 = NSStringFromClass(v11);
        v13 = [v9 processHandle];
        int v14 = 138543618;
        v15 = v12;
        __int16 v16 = 2112;
        v17 = v13;
        _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Client process [%@] sent a message with an unknown format. Ignoring request.", (uint8_t *)&v14, 0x16u);
      }
      break;
  }
}

- (void)_handleHardwareButtonSetPressEventMask:(id)a3 fromClient:(id)a4
{
  id v11 = a4;
  v6 = [a3 payload];
  v7 = v6;
  if (v6 && object_getClass(v6) == (Class)MEMORY[0x1E4F14590])
  {
    id v8 = [(SBSystemServiceServer *)self hardwareButtonDelegate];
    if (v8)
    {
      uint64_t uint64 = xpc_dictionary_get_uint64(v7, (const char *)*MEMORY[0x1E4FA7748]);
      int64_t int64 = xpc_dictionary_get_int64(v7, (const char *)*MEMORY[0x1E4FA7780]);
      objc_msgSend(v8, "systemServiceServer:client:setEventMask:buttonKind:priority:", self, v11, uint64, xpc_dictionary_get_int64(v7, (const char *)*MEMORY[0x1E4FA7738]), int64);
    }
  }
}

- (SBSystemServiceServerHardwareButtonDelegate)hardwareButtonDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hardwareButtonDelegate);
  return (SBSystemServiceServerHardwareButtonDelegate *)WeakRetained;
}

+ (SBSystemServiceServer)sharedInstance
{
  if (sharedInstance_onceToken_37 != -1) {
    dispatch_once(&sharedInstance_onceToken_37, &__block_literal_global_260);
  }
  v2 = (void *)sharedInstance___sharedInstance_19;
  return (SBSystemServiceServer *)v2;
}

void __39__SBSystemServiceServer_sharedInstance__block_invoke()
{
  id v0 = [[SBSystemServiceServer alloc] _init];
  v1 = (void *)sharedInstance___sharedInstance_19;
  sharedInstance___sharedInstance_19 = (uint64_t)v0;
}

- (id)_init
{
  v3 = (void *)MEMORY[0x1E4F62AC8];
  Serial = (void *)BSDispatchQueueCreateSerial();
  v5 = [v3 queueWithDispatchQueue:Serial];

  uint64_t v6 = *MEMORY[0x1E4FA7198];
  v9.receiver = self;
  v9.super_class = (Class)SBSystemServiceServer;
  v7 = [(FBSServiceFacility *)&v9 initWithIdentifier:v6 queue:v5];

  return v7;
}

- (void)dealloc
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"SBSystemServiceServer.m" lineNumber:50 description:@"you can't deallocate the server"];

  v5.receiver = self;
  v5.super_class = (Class)SBSystemServiceServer;
  [(FBSServiceFacility *)&v5 dealloc];
}

- (void)noteClientDidDisconnect:(id)a3
{
  id v4 = a3;
  objc_super v5 = SBLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[SBSystemServiceServer noteClientDidDisconnect:]((uint64_t)v4, v5);
  }

  uint64_t v6 = [(SBSystemServiceServer *)self hardwareButtonDelegate];
  v7 = v6;
  if (v6) {
    [v6 systemServiceServer:self clientDidDisconnect:v4];
  }
}

- (void)_handleRequestAppSwitcherAppearanceForHiddenApp:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 payload];
  objc_super v9 = BSDeserializeStringFromXPCDictionaryWithKey();

  v10 = [v6 payload];
  id v11 = BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey();

  if (_handleRequestAppSwitcherAppearanceForHiddenApp_fromClient__onceToken != -1) {
    dispatch_once(&_handleRequestAppSwitcherAppearanceForHiddenApp_fromClient__onceToken, &__block_literal_global_13_1);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appSwitcherDelegate);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __84__SBSystemServiceServer__handleRequestAppSwitcherAppearanceForHiddenApp_fromClient___block_invoke_2;
  v14[3] = &unk_1E6AF5350;
  id v15 = v6;
  id v13 = v6;
  [WeakRetained systemServiceServer:self requestAppearanceForHiddenAppWithBundleIdentifier:v9 assertionPort:v11 forClient:v7 withCompletion:v14];
}

void __84__SBSystemServiceServer__handleRequestAppSwitcherAppearanceForHiddenApp_fromClient___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F4F768]);
  v1 = (void *)_handleRequestAppSwitcherAppearanceForHiddenApp_fromClient__serverPort;
  _handleRequestAppSwitcherAppearanceForHiddenApp_fromClient__serverPort = (uint64_t)v0;
}

uint64_t __84__SBSystemServiceServer__handleRequestAppSwitcherAppearanceForHiddenApp_fromClient___block_invoke_2(uint64_t a1, char a2)
{
  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __84__SBSystemServiceServer__handleRequestAppSwitcherAppearanceForHiddenApp_fromClient___block_invoke_3;
  v4[3] = &__block_descriptor_33_e33_v16__0__NSObject_OS_xpc_object__8l;
  char v5 = a2;
  return [v2 sendReplyMessageWithPacker:v4];
}

void __84__SBSystemServiceServer__handleRequestAppSwitcherAppearanceForHiddenApp_fromClient___block_invoke_3(uint64_t a1, void *a2)
{
  id v5 = a2;
  xpc_dictionary_set_BOOL(v5, (const char *)*MEMORY[0x1E4FA6E78], *(unsigned char *)(a1 + 32));
  if (*(unsigned char *)(a1 + 32)
    && [(id)_handleRequestAppSwitcherAppearanceForHiddenApp_fromClient__serverPort isUsable])
  {
    id v3 = objc_alloc(MEMORY[0x1E4F4F770]);
    id v4 = (void *)[v3 initFromReceiveRight:_handleRequestAppSwitcherAppearanceForHiddenApp_fromClient__serverPort];
    BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
  }
}

- (void)_handleBiometricsFetchUnlockCredentialSetMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __85__SBSystemServiceServer__handleBiometricsFetchUnlockCredentialSetMessage_fromClient___block_invoke;
  v12[3] = &unk_1E6B078A0;
  id v13 = v6;
  id v8 = v6;
  objc_super v9 = (void (**)(void, void))MEMORY[0x1D948C7A0](v12);
  v10 = [(SBSystemServiceServer *)self biometricsDelegate];
  id v11 = v10;
  if (v10) {
    [v10 systemServiceServer:self client:v7 fetchUnlockCredentialSet:v9];
  }
  else {
    v9[2](v9, 0);
  }
}

void __85__SBSystemServiceServer__handleBiometricsFetchUnlockCredentialSetMessage_fromClient___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __85__SBSystemServiceServer__handleBiometricsFetchUnlockCredentialSetMessage_fromClient___block_invoke_2;
  v6[3] = &unk_1E6AFC038;
  id v7 = v3;
  id v5 = v3;
  [v4 sendReplyMessageWithPacker:v6];
}

uint64_t __85__SBSystemServiceServer__handleBiometricsFetchUnlockCredentialSetMessage_fromClient___block_invoke_2()
{
  return BSSerializeDataToXPCDictionaryWithKey();
}

- (void)_handleHardwareButtonAcquireAssertionMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __81__SBSystemServiceServer__handleHardwareButtonAcquireAssertionMessage_fromClient___block_invoke;
  v15[3] = &unk_1E6B078C8;
  id v8 = v6;
  id v16 = v8;
  objc_super v9 = (void (**)(void, void))MEMORY[0x1D948C7A0](v15);
  v10 = [v8 payload];
  id v11 = v10;
  if (v10 && object_getClass(v10) == (Class)MEMORY[0x1E4F14590])
  {
    v12 = [(SBSystemServiceServer *)self hardwareButtonDelegate];
    if (v12)
    {
      uint64_t uint64 = xpc_dictionary_get_uint64(v11, (const char *)*MEMORY[0x1E4FA7820]);
      int v14 = BSDeserializeStringFromXPCDictionaryWithKey();
      [v12 systemServiceServer:self client:v7 acquireAssertionOfType:uint64 forReason:v14 withCompletion:v9];
    }
    else
    {
      v9[2](v9, 0);
    }
  }
  else
  {
    v9[2](v9, 0);
  }
}

void __81__SBSystemServiceServer__handleHardwareButtonAcquireAssertionMessage_fromClient___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __81__SBSystemServiceServer__handleHardwareButtonAcquireAssertionMessage_fromClient___block_invoke_2;
  v6[3] = &unk_1E6AFC038;
  id v7 = v3;
  id v5 = v3;
  [v4 sendReplyMessageWithPacker:v6];
}

uint64_t __81__SBSystemServiceServer__handleHardwareButtonAcquireAssertionMessage_fromClient___block_invoke_2()
{
  return BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
}

- (void)_handleHardwareButtonGetToggleButtonState:(id)a3 fromClient:(id)a4
{
  id v7 = a3;
  id v4 = [v7 payload];
  id v5 = v4;
  if (v4 && object_getClass(v4) == (Class)MEMORY[0x1E4F14590])
  {
    if (xpc_dictionary_get_int64(v5, (const char *)*MEMORY[0x1E4FA7738]) == 6) {
      id v6 = &__block_literal_global_21_0;
    }
    else {
      id v6 = &__block_literal_global_23_3;
    }
    [v7 sendReplyMessageWithPacker:v6];
  }
}

void __78__SBSystemServiceServer__handleHardwareButtonGetToggleButtonState_fromClient___block_invoke(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  if (SBUIHasHIDRingerSwitch()) {
    int64_t v2 = [(id)SBApp ringerSwitchState] != 0;
  }
  else {
    int64_t v2 = -1;
  }
  xpc_dictionary_set_int64(xdict, (const char *)*MEMORY[0x1E4FA77B0], v2);
}

void __78__SBSystemServiceServer__handleHardwareButtonGetToggleButtonState_fromClient___block_invoke_2(int a1, xpc_object_t xdict)
{
}

- (void)_handleHardwareButtonSetRequestsHIDEvents:(id)a3 fromClient:(id)a4
{
  id v12 = a4;
  id v6 = [a3 payload];
  id v7 = v6;
  if (v6 && object_getClass(v6) == (Class)MEMORY[0x1E4F14590])
  {
    id v8 = [(SBSystemServiceServer *)self hardwareButtonDelegate];
    if (v8)
    {
      BOOL v9 = xpc_dictionary_get_BOOL(v7, (const char *)*MEMORY[0x1E4FA7758]);
      int64_t int64 = xpc_dictionary_get_int64(v7, (const char *)*MEMORY[0x1E4FA7738]);
      objc_opt_class();
      id v11 = BSDeserializeNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey();
      [v8 systemServiceServer:self client:v12 requestsHIDEvents:v9 token:v11 forButtonKind:int64];
    }
  }
}

- (void)_handleHardwareButtonSetHapticType:(id)a3 fromClient:(id)a4
{
  id v10 = a4;
  id v6 = [a3 payload];
  id v7 = v6;
  if (v6 && object_getClass(v6) == (Class)MEMORY[0x1E4F14590])
  {
    id v8 = [(SBSystemServiceServer *)self hardwareButtonDelegate];
    if (v8)
    {
      int64_t int64 = xpc_dictionary_get_int64(v7, (const char *)*MEMORY[0x1E4FA7760]);
      objc_msgSend(v8, "systemServiceServer:client:setHapticType:buttonKind:", self, v10, int64, xpc_dictionary_get_int64(v7, (const char *)*MEMORY[0x1E4FA7738]));
    }
  }
}

- (void)_handleHardwareButtonGetHapticType:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 payload];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __71__SBSystemServiceServer__handleHardwareButtonGetHapticType_fromClient___block_invoke;
  v15[3] = &unk_1E6AF8788;
  id v9 = v6;
  id v16 = v9;
  id v10 = (void (**)(void, void))MEMORY[0x1D948C7A0](v15);
  if (v8 && object_getClass(v8) == (Class)MEMORY[0x1E4F14590])
  {
    id v11 = [(SBSystemServiceServer *)self hardwareButtonDelegate];
    if (v11)
    {
      int64_t int64 = xpc_dictionary_get_int64(v8, (const char *)*MEMORY[0x1E4FA7738]);
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __71__SBSystemServiceServer__handleHardwareButtonGetHapticType_fromClient___block_invoke_3;
      v13[3] = &unk_1E6B03980;
      int v14 = v10;
      [v11 systemServiceServer:self client:v7 fetchHapticTypeForButtonKind:int64 completion:v13];
    }
    else
    {
      v10[2](v10, 0);
    }
  }
  else
  {
    v10[2](v10, 0);
  }
}

uint64_t __71__SBSystemServiceServer__handleHardwareButtonGetHapticType_fromClient___block_invoke(uint64_t a1, uint64_t a2)
{
  int64_t v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __71__SBSystemServiceServer__handleHardwareButtonGetHapticType_fromClient___block_invoke_2;
  v4[3] = &__block_descriptor_40_e33_v16__0__NSObject_OS_xpc_object__8l;
  void v4[4] = a2;
  return [v2 sendReplyMessageWithPacker:v4];
}

void __71__SBSystemServiceServer__handleHardwareButtonGetHapticType_fromClient___block_invoke_2(uint64_t a1, xpc_object_t xdict)
{
}

uint64_t __71__SBSystemServiceServer__handleHardwareButtonGetHapticType_fromClient___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_handleHardwareButtonGetHintViewsSupported:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 payload];
  id v9 = v8;
  if (v8 && object_getClass(v8) == (Class)MEMORY[0x1E4F14590])
  {
    id v10 = [(SBSystemServiceServer *)self hardwareButtonDelegate];
    id v11 = v10;
    if (v10)
    {
      char v12 = [v10 systemServiceServer:self getHintViewsSupportedForClient:v7];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __79__SBSystemServiceServer__handleHardwareButtonGetHintViewsSupported_fromClient___block_invoke;
      v13[3] = &__block_descriptor_33_e33_v16__0__NSObject_OS_xpc_object__8l;
      char v14 = v12;
      [v6 sendReplyMessageWithPacker:v13];
    }
  }
}

void __79__SBSystemServiceServer__handleHardwareButtonGetHintViewsSupported_fromClient___block_invoke(uint64_t a1, xpc_object_t xdict)
{
}

- (void)_handleHardwareButtonRegisterAssociatedHintView:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 payload];
  id v9 = v8;
  if (v8 && object_getClass(v8) == (Class)MEMORY[0x1E4F14590])
  {
    id v10 = [(SBSystemServiceServer *)self hardwareButtonDelegate];
    if (v10)
    {
      uint64_t uint64 = xpc_dictionary_get_uint64(v9, (const char *)*MEMORY[0x1E4FA7788]);
      uint64_t v12 = xpc_dictionary_get_uint64(v9, (const char *)*MEMORY[0x1E4FA7790]);
      BSDeserializeCGSizeFromXPCDictionaryWithKey();
      double v14 = v13;
      double v16 = v15;
      int64_t int64 = xpc_dictionary_get_int64(v9, (const char *)*MEMORY[0x1E4FA7738]);
      uint64_t v18 = BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey();
      char v19 = objc_msgSend(v10, "systemServiceServer:client:registerAssociatedHintViewContextId:renderId:size:buttonKind:clientPort:", self, v7, uint64, v12, int64, v18, v14, v16);
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __84__SBSystemServiceServer__handleHardwareButtonRegisterAssociatedHintView_fromClient___block_invoke;
      v20[3] = &__block_descriptor_33_e33_v16__0__NSObject_OS_xpc_object__8l;
      char v21 = v19;
      [v6 sendReplyMessageWithPacker:v20];
    }
  }
}

void __84__SBSystemServiceServer__handleHardwareButtonRegisterAssociatedHintView_fromClient___block_invoke(uint64_t a1, xpc_object_t xdict)
{
}

- (void)_handleHardwareButtonUpdateHintContentVisibility:(id)a3 fromClient:(id)a4
{
  id v12 = a4;
  id v6 = [a3 payload];
  id v7 = v6;
  if (v6 && object_getClass(v6) == (Class)MEMORY[0x1E4F14590])
  {
    id v8 = [(SBSystemServiceServer *)self hardwareButtonDelegate];
    if (v8)
    {
      int64_t int64 = xpc_dictionary_get_int64(v7, (const char *)*MEMORY[0x1E4FA7770]);
      int64_t v10 = xpc_dictionary_get_int64(v7, (const char *)*MEMORY[0x1E4FA7738]);
      id v11 = BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey();
      [v8 systemServiceServer:self client:v12 updateHintContentVisibility:int64 forButton:v10 animationSettings:v11];
    }
  }
}

- (void)_handleHardwareButtonRequestSystemGlowEffect:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 payload];
  id v9 = v8;
  if (v8 && object_getClass(v8) == (Class)MEMORY[0x1E4F14590])
  {
    int64_t v10 = [(SBSystemServiceServer *)self hardwareButtonDelegate];
    if (v10)
    {
      int64_t int64 = xpc_dictionary_get_int64(v9, (const char *)*MEMORY[0x1E4FA77A8]);
      id v12 = BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey();
      char v13 = [v10 systemServiceServer:self client:v7 requestSystemGlowEffectWithInitialStyle:int64 clientPort:v12];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __81__SBSystemServiceServer__handleHardwareButtonRequestSystemGlowEffect_fromClient___block_invoke;
      v14[3] = &__block_descriptor_33_e33_v16__0__NSObject_OS_xpc_object__8l;
      char v15 = v13;
      [v6 sendReplyMessageWithPacker:v14];
    }
  }
}

void __81__SBSystemServiceServer__handleHardwareButtonRequestSystemGlowEffect_fromClient___block_invoke(uint64_t a1, xpc_object_t xdict)
{
}

- (void)_handleHardwareButtonUpdateSystemGlowStyle:(id)a3 fromClient:(id)a4
{
  id v9 = a4;
  id v6 = [a3 payload];
  id v7 = v6;
  if (v6 && object_getClass(v6) == (Class)MEMORY[0x1E4F14590])
  {
    id v8 = [(SBSystemServiceServer *)self hardwareButtonDelegate];
    if (v8) {
      objc_msgSend(v8, "systemServiceServer:client:updateSystemGlowStyle:", self, v9, xpc_dictionary_get_int64(v7, (const char *)*MEMORY[0x1E4FA77A8]));
    }
  }
}

- (void)_handleSoftwareUpdateSetPasscodePolicy:(id)a3 fromClient:(id)a4
{
  id v9 = a4;
  id v6 = [a3 payload];
  id v7 = v6;
  if (v6 && object_getClass(v6) == (Class)MEMORY[0x1E4F14590])
  {
    id v8 = [(SBSystemServiceServer *)self softwareUpdateDelegate];
    if (v8) {
      objc_msgSend(v8, "systemServiceServer:client:setPasscodePolicy:", self, v9, xpc_dictionary_get_int64(v7, (const char *)*MEMORY[0x1E4FA77C8]));
    }
  }
}

- (void)_handleSoftwareUpdateGetPasscodePolicy:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __75__SBSystemServiceServer__handleSoftwareUpdateGetPasscodePolicy_fromClient___block_invoke;
  v13[3] = &unk_1E6AF8788;
  id v8 = v6;
  id v14 = v8;
  id v9 = (void (**)(void, void))MEMORY[0x1D948C7A0](v13);
  int64_t v10 = [(SBSystemServiceServer *)self softwareUpdateDelegate];
  if (v10)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __75__SBSystemServiceServer__handleSoftwareUpdateGetPasscodePolicy_fromClient___block_invoke_3;
    v11[3] = &unk_1E6B03980;
    id v12 = v9;
    [v10 systemServiceServer:self client:v7 passcodePolicy:v11];
  }
  else
  {
    v9[2](v9, 0);
  }
}

uint64_t __75__SBSystemServiceServer__handleSoftwareUpdateGetPasscodePolicy_fromClient___block_invoke(uint64_t a1, uint64_t a2)
{
  int64_t v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __75__SBSystemServiceServer__handleSoftwareUpdateGetPasscodePolicy_fromClient___block_invoke_2;
  v4[3] = &__block_descriptor_40_e33_v16__0__NSObject_OS_xpc_object__8l;
  void v4[4] = a2;
  return [v2 sendReplyMessageWithPacker:v4];
}

void __75__SBSystemServiceServer__handleSoftwareUpdateGetPasscodePolicy_fromClient___block_invoke_2(uint64_t a1, xpc_object_t xdict)
{
}

uint64_t __75__SBSystemServiceServer__handleSoftwareUpdateGetPasscodePolicy_fromClient___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_handleTestAutomationGetSystemApertureModelStateDump:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_testAutomationDelegate);
  id v9 = [WeakRetained systemServiceServer:self getSystemApertureModelStateDumpForClient:v7];

  if (v9)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __89__SBSystemServiceServer__handleTestAutomationGetSystemApertureModelStateDump_fromClient___block_invoke;
    v10[3] = &unk_1E6AFC038;
    id v11 = v9;
    [v6 sendReplyMessageWithPacker:v10];
  }
}

void __89__SBSystemServiceServer__handleTestAutomationGetSystemApertureModelStateDump_fromClient___block_invoke(uint64_t a1, void *a2)
{
  int64_t v2 = (void *)MEMORY[0x1E4F28D90];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  id v5 = [v2 dataWithJSONObject:v3 options:1 error:0];
  BSSerializeDataToXPCDictionaryWithKey();
}

- (void)_handleTestAutomationSetSpringBoardAnimationFrameRecording:(id)a3 fromClient:(id)a4
{
  id v10 = a4;
  id v6 = [a3 payload];
  id v7 = v6;
  if (v6 && object_getClass(v6) == (Class)MEMORY[0x1E4F14590])
  {
    uint64_t uint64 = xpc_dictionary_get_uint64(v7, (const char *)*MEMORY[0x1E4FA7870]);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_testAutomationDelegate);
    [WeakRetained systemServiceServer:self client:v10 setSpringBoardAnimationFrameRecordingForUpdateTypes:uint64];
  }
}

- (void)_handleTestAutomationGetSpringBoardFrameRecording:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_testAutomationDelegate);
  id v9 = [WeakRetained systemServiceServer:self getAnimationFrameRecordingsForClient:v7];

  if (v9)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __86__SBSystemServiceServer__handleTestAutomationGetSpringBoardFrameRecording_fromClient___block_invoke;
    v10[3] = &unk_1E6AFC038;
    id v11 = v9;
    [v6 sendReplyMessageWithPacker:v10];
  }
}

void __86__SBSystemServiceServer__handleTestAutomationGetSpringBoardFrameRecording_fromClient___block_invoke(uint64_t a1, void *a2)
{
  int64_t v2 = (void *)MEMORY[0x1E4F28DB0];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  id v5 = [v2 archivedDataWithRootObject:v3 requiringSecureCoding:1 error:0];
  BSSerializeDataToXPCDictionaryWithKey();
}

- (void)_handleTestAutomationSetSystemApertureUnderAutomationTesting:(id)a3 fromClient:(id)a4
{
  id v10 = a4;
  id v6 = [a3 payload];
  id v7 = v6;
  if (v6 && object_getClass(v6) == (Class)MEMORY[0x1E4F14590])
  {
    BOOL v8 = xpc_dictionary_get_BOOL(v7, (const char *)*MEMORY[0x1E4FA7868]);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_testAutomationDelegate);
    [WeakRetained systemServiceServer:self client:v10 setSystemApertureUnderAutomationTesting:v8];
  }
}

- (void)_handleSystemApertureRequestStateDump:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [v6 payload];
  id v9 = v8;
  if (v8 && object_getClass(v8) == (Class)MEMORY[0x1E4F14590])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_systemApertureStateDumpDelegate);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __74__SBSystemServiceServer__handleSystemApertureRequestStateDump_fromClient___block_invoke;
    v11[3] = &unk_1E6B07938;
    id v12 = v6;
    [WeakRetained systemServiceServer:self client:v7 requestSystemApertureStateDumpWithCompletion:v11];
  }
}

void __74__SBSystemServiceServer__handleSystemApertureRequestStateDump_fromClient___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __74__SBSystemServiceServer__handleSystemApertureRequestStateDump_fromClient___block_invoke_2;
  v10[3] = &unk_1E6B07910;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  [v7 sendReplyMessageWithPacker:v10];
}

void __74__SBSystemServiceServer__handleSystemApertureRequestStateDump_fromClient___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (const char *)*MEMORY[0x1E4FA7808];
  id v5 = *(void **)(a1 + 32);
  xpc_object_t xdict = v3;
  if (v5)
  {
    uint64_t v6 = [v5 UTF8String];
    id v3 = xdict;
    id v7 = (const char *)v6;
  }
  else
  {
    id v7 = "";
  }
  xpc_dictionary_set_string(v3, v4, v7);
  id v8 = *(void **)(a1 + 40);
  if (v8) {
    xpc_dictionary_set_string(xdict, (const char *)*MEMORY[0x1E4FA7800], (const char *)[v8 UTF8String]);
  }
}

- (void)_handleSystemApertureRequestToWriteStateDumpToFile:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 payload];
  id v9 = v8;
  if (v8 && object_getClass(v8) == (Class)MEMORY[0x1E4F14590])
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __87__SBSystemServiceServer__handleSystemApertureRequestToWriteStateDumpToFile_fromClient___block_invoke;
    v10[3] = &unk_1E6B07910;
    void v10[4] = self;
    id v11 = v7;
    [v6 sendReplyMessageWithPacker:v10];
  }
}

void __87__SBSystemServiceServer__handleSystemApertureRequestToWriteStateDumpToFile_fromClient___block_invoke(uint64_t a1, xpc_object_t xdict)
{
  string = xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x1E4FA77E0]);
  if (string)
  {
    id v5 = [NSString stringWithUTF8String:string];
  }
  else
  {
    id v5 = 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 104));
  [WeakRetained systemServiceServer:*(void *)(a1 + 32) client:*(void *)(a1 + 40) requestToWriteSystemApertureStateDumpToFile:v5];
}

- (void)_handleTestAutomationSuspendAllDisplays:(id)a3 fromClient:(id)a4
{
  p_testAutomationDelegate = &self->_testAutomationDelegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_testAutomationDelegate);
  [WeakRetained systemServiceServer:self suspendAllDisplaysForClient:v6];
}

- (void)_handleTestAutomationClearAllUserNotifications:(id)a3 fromClient:(id)a4
{
  p_testAutomationDelegate = &self->_testAutomationDelegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_testAutomationDelegate);
  [WeakRetained systemServiceServer:self clearAllUserNotificationsForClient:v6];
}

- (void)_handleTestAutomationSetUserPresenceDetectedSinceWake:(id)a3 fromClient:(id)a4
{
  p_testAutomationDelegate = &self->_testAutomationDelegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_testAutomationDelegate);
  [WeakRetained systemServiceServer:self setUserPresenceDetectedSinceWakeForClient:v6];
}

- (void)_handleTestAutomationSetAlertState:(id)a3 fromClient:(id)a4
{
  id v10 = a4;
  id v6 = [a3 payload];
  id v7 = v6;
  if (v6 && object_getClass(v6) == (Class)MEMORY[0x1E4F14590])
  {
    BOOL v8 = xpc_dictionary_get_BOOL(v7, (const char *)*MEMORY[0x1E4FA7868]);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_testAutomationDelegate);
    [WeakRetained systemServiceServer:self client:v10 setAlertsEnabled:v8];
  }
}

- (void)_handleTestAutomationSetHiddenFeatureState:(id)a3 fromClient:(id)a4
{
  id v10 = a4;
  id v6 = [a3 payload];
  id v7 = v6;
  if (v6 && object_getClass(v6) == (Class)MEMORY[0x1E4F14590])
  {
    BOOL v8 = xpc_dictionary_get_BOOL(v7, (const char *)*MEMORY[0x1E4FA7868]);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_testAutomationDelegate);
    [WeakRetained systemServiceServer:self client:v10 setHiddenFeaturesEnabled:v8];
  }
}

- (void)_handleTestAutomationSetIdleTimerState:(id)a3 fromClient:(id)a4
{
  id v10 = a4;
  id v6 = [a3 payload];
  id v7 = v6;
  if (v6 && object_getClass(v6) == (Class)MEMORY[0x1E4F14590])
  {
    BOOL v8 = xpc_dictionary_get_BOOL(v7, (const char *)*MEMORY[0x1E4FA7868]);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_testAutomationDelegate);
    [WeakRetained systemServiceServer:self client:v10 setIdleTimerEnabled:v8];
  }
}

- (void)_handleTestAutomationSetOrientationLockState:(id)a3 fromClient:(id)a4
{
  id v10 = a4;
  id v6 = [a3 payload];
  id v7 = v6;
  if (v6 && object_getClass(v6) == (Class)MEMORY[0x1E4F14590])
  {
    BOOL v8 = xpc_dictionary_get_BOOL(v7, (const char *)*MEMORY[0x1E4FA7868]);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_testAutomationDelegate);
    [WeakRetained systemServiceServer:self client:v10 setOrientationLockEnabled:v8];
  }
}

- (void)_handleTestAutomationSetMallocStackLoggingState:(id)a3 fromClient:(id)a4
{
  id v10 = a4;
  id v6 = [a3 payload];
  id v7 = v6;
  if (v6 && object_getClass(v6) == (Class)MEMORY[0x1E4F14590])
  {
    BOOL v8 = xpc_dictionary_get_BOOL(v7, (const char *)*MEMORY[0x1E4FA7868]);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_testAutomationDelegate);
    [WeakRetained systemServiceServer:self client:v10 setMallocStackLoggingEnabled:v8];
  }
}

- (void)_handleTestAutomationSetReachabilityActiveState:(id)a3 fromClient:(id)a4
{
  id v10 = a4;
  id v6 = [a3 payload];
  id v7 = v6;
  if (v6 && object_getClass(v6) == (Class)MEMORY[0x1E4F14590])
  {
    BOOL v8 = xpc_dictionary_get_BOOL(v7, (const char *)*MEMORY[0x1E4FA7868]);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_testAutomationDelegate);
    [WeakRetained systemServiceServer:self client:v10 setReachabilityActive:v8];
  }
}

- (void)_handleTestAutomationRequestReachabilityEnabledAssertion:(id)a3 fromClient:(id)a4
{
  id v11 = a4;
  id v6 = [a3 payload];
  id v7 = v6;
  if (v6 && object_getClass(v6) == (Class)MEMORY[0x1E4F14590])
  {
    BOOL v8 = xpc_dictionary_get_BOOL(v7, (const char *)*MEMORY[0x1E4FA7868]);
    id v9 = BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey();
    id WeakRetained = objc_loadWeakRetained((id *)&self->_testAutomationDelegate);
    [WeakRetained systemServiceServer:self client:v11 port:v9 acquireAssertionForReachabilityEnabled:v8];
  }
}

- (void)_handleTestAutomationSetAmbientPresentationState:(id)a3 fromClient:(id)a4
{
  id v10 = a4;
  id v6 = [a3 payload];
  id v7 = v6;
  if (v6 && object_getClass(v6) == (Class)MEMORY[0x1E4F14590])
  {
    int64_t int64 = xpc_dictionary_get_int64(v7, (const char *)*MEMORY[0x1E4FA7838]);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_testAutomationDelegate);
    [WeakRetained systemServiceServer:self client:v10 setAmbientPresentationState:int64];
  }
}

- (void)_handleTestAutomationResetToHomeScreen:(id)a3 fromClient:(id)a4
{
  id v10 = a4;
  id v6 = [a3 payload];
  id v7 = v6;
  if (v6 && object_getClass(v6) == (Class)MEMORY[0x1E4F14590])
  {
    BOOL v8 = xpc_dictionary_get_BOOL(v7, (const char *)*MEMORY[0x1E4FA7840]);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_testAutomationDelegate);
    [WeakRetained systemServiceServer:self client:v10 resetToHomeScreenAnimated:v8];
  }
}

- (void)_handleTestAutomationSetAccessoryAttachedState:(id)a3 fromClient:(id)a4
{
  id v11 = a4;
  id v6 = [a3 payload];
  id v7 = v6;
  if (v6 && object_getClass(v6) == (Class)MEMORY[0x1E4F14590])
  {
    int64_t int64 = xpc_dictionary_get_int64(v7, (const char *)*MEMORY[0x1E4FA7830]);
    BOOL v9 = xpc_dictionary_get_BOOL(v7, (const char *)*MEMORY[0x1E4FA7868]);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_testAutomationDelegate);
    [WeakRetained systemServiceServer:self client:v11 setAccessoryType:int64 attached:v9];
  }
}

- (void)_handleTestAutomationBlockApplicationForScreenTime:(id)a3 fromClient:(id)a4
{
  id v11 = a4;
  id v6 = [a3 payload];
  id v7 = v6;
  if (v6 && object_getClass(v6) == (Class)MEMORY[0x1E4F14590])
  {
    BOOL v8 = BSDeserializeStringFromXPCDictionaryWithKey();
    BOOL v9 = xpc_dictionary_get_BOOL(v7, (const char *)*MEMORY[0x1E4FA7848]);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_testAutomationDelegate);
    [WeakRetained systemServiceServer:self client:v11 setApplicationBundleIdentifier:v8 blockedForScreenTime:v9];
  }
}

- (void)_handleTestAutomationRequestHUDHiddenAssertion:(id)a3 fromClient:(id)a4
{
  id v11 = a4;
  id v6 = [a3 payload];
  id v7 = v6;
  if (v6 && object_getClass(v6) == (Class)MEMORY[0x1E4F14590])
  {
    BOOL v8 = BSDeserializeStringFromXPCDictionaryWithKey();
    BOOL v9 = BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey();
    id WeakRetained = objc_loadWeakRetained((id *)&self->_testAutomationDelegate);
    [WeakRetained systemServiceServer:self client:v11 port:v9 acquireHUDHiddenAssertionForIdentifier:v8];
  }
}

- (void)_handleTestAutomationSetTestRunnerRecoveryApplicationBundleIdentifier:(id)a3 fromClient:(id)a4
{
  id v10 = a4;
  id v6 = [a3 payload];
  id v7 = v6;
  if (v6 && object_getClass(v6) == (Class)MEMORY[0x1E4F14590])
  {
    BOOL v8 = BSDeserializeStringFromXPCDictionaryWithKey();
    id WeakRetained = objc_loadWeakRetained((id *)&self->_testAutomationDelegate);
    [WeakRetained systemServiceServer:self client:v10 setTestRunnerRecoveryApplicationBundleIdentifier:v8];
  }
}

- (void)_handleTestAutomationGetScencesForBundleIdentifier:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [v6 payload];
  BOOL v9 = v8;
  if (v8 && object_getClass(v8) == (Class)MEMORY[0x1E4F14590])
  {
    id v10 = BSDeserializeStringFromXPCDictionaryWithKey();
    id WeakRetained = objc_loadWeakRetained((id *)&self->_testAutomationDelegate);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __87__SBSystemServiceServer__handleTestAutomationGetScencesForBundleIdentifier_fromClient___block_invoke;
    v12[3] = &unk_1E6AF5558;
    id v13 = v6;
    [WeakRetained systemServiceServer:self client:v7 countScenesForBundleIdentifier:v10 withCompletion:v12];
  }
}

uint64_t __87__SBSystemServiceServer__handleTestAutomationGetScencesForBundleIdentifier_fromClient___block_invoke(uint64_t a1, int a2)
{
  int64_t v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __87__SBSystemServiceServer__handleTestAutomationGetScencesForBundleIdentifier_fromClient___block_invoke_2;
  v4[3] = &__block_descriptor_36_e33_v16__0__NSObject_OS_xpc_object__8l;
  int v5 = a2;
  return [v2 sendReplyMessageWithPacker:v4];
}

void __87__SBSystemServiceServer__handleTestAutomationGetScencesForBundleIdentifier_fromClient___block_invoke_2(uint64_t a1, xpc_object_t xdict)
{
}

- (void)_handleStashSwitcherModelToPath:(id)a3 fromClient:(id)a4
{
  id v6 = a4;
  id v7 = [a3 payload];
  BSDeserializeStringFromXPCDictionaryWithKey();
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  id WeakRetained = objc_loadWeakRetained((id *)&self->_testAutomationDelegate);
  [WeakRetained systemServiceServer:self client:v6 stashSwitcherModelToPath:v9];
}

- (void)_handleLoadStashedSwitcherModelFromPath:(id)a3 fromClient:(id)a4
{
  id v6 = a4;
  id v7 = [a3 payload];
  BSDeserializeStringFromXPCDictionaryWithKey();
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  id WeakRetained = objc_loadWeakRetained((id *)&self->_testAutomationDelegate);
  [WeakRetained systemServiceServer:self client:v6 loadStashedSwitcherModelFromPath:v9];
}

- (void)_handleTestAutomationAddWidgetsToEachPage:(id)a3 fromClient:(id)a4
{
  p_testAutomationDelegate = &self->_testAutomationDelegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_testAutomationDelegate);
  [WeakRetained systemServiceServer:self addWidgetsToEachPageForClient:v6];
}

- (void)_handleTestAutomationAddSpecificWidgetToPageWithSize:(id)a3 fromClient:(id)a4
{
  id v12 = a4;
  id v6 = [a3 payload];
  id v7 = v6;
  if (v6 && object_getClass(v6) == (Class)MEMORY[0x1E4F14590])
  {
    BOOL v8 = BSDeserializeStringFromXPCDictionaryWithKey();
    int64_t int64 = xpc_dictionary_get_int64(v7, (const char *)*MEMORY[0x1E4FA7880]);
    int64_t v10 = xpc_dictionary_get_int64(v7, (const char *)*MEMORY[0x1E4FA7898]);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_testAutomationDelegate);
    [WeakRetained systemServiceServer:self client:v12 addWidgetWithIdentifier:v8 toPage:int64 withSizing:v10];
  }
}

- (void)_handleTestAutomationAddSpecificWidgetStackToPageWithSize:(id)a3 fromClient:(id)a4
{
  id v12 = a4;
  id v6 = [a3 payload];
  id v7 = v6;
  if (v6 && object_getClass(v6) == (Class)MEMORY[0x1E4F14590])
  {
    BOOL v8 = (void *)BSCreateDeserializedArrayFromXPCDictionaryWithKey();
    int64_t int64 = xpc_dictionary_get_int64(v7, (const char *)*MEMORY[0x1E4FA7880]);
    int64_t v10 = xpc_dictionary_get_int64(v7, (const char *)*MEMORY[0x1E4FA7898]);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_testAutomationDelegate);
    [WeakRetained systemServiceServer:self client:v12 addWidgetStackWithIdentifiers:v8 toPage:int64 withSizing:v10];
  }
}

id __94__SBSystemServiceServer__handleTestAutomationAddSpecificWidgetStackToPageWithSize_fromClient___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = v2;
  if (v2 && object_getClass(v2) == (Class)MEMORY[0x1E4F145F0])
  {
    id v4 = [NSString stringWithUTF8String:xpc_string_get_string_ptr(v3)];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)_handleTestAutomationEnterLostMode:(id)a3 fromClient:(id)a4
{
  p_testAutomationDelegate = &self->_testAutomationDelegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_testAutomationDelegate);
  [WeakRetained systemServiceServer:self enterLostModeForClient:v6];
}

- (void)_handleTestAutomationExitLostMode:(id)a3 fromClient:(id)a4
{
  p_testAutomationDelegate = &self->_testAutomationDelegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_testAutomationDelegate);
  [WeakRetained systemServiceServer:self exitLostModeForClient:v6];
}

- (void)_handleTestAutomationGetChamoisWindowingUIEnabled:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_testAutomationDelegate);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __86__SBSystemServiceServer__handleTestAutomationGetChamoisWindowingUIEnabled_fromClient___block_invoke;
  v10[3] = &unk_1E6AF5350;
  id v11 = v6;
  id v9 = v6;
  [WeakRetained systemServiceServer:self client:v7 getIsChamoisWindowingUIEnabledWithCompletion:v10];
}

uint64_t __86__SBSystemServiceServer__handleTestAutomationGetChamoisWindowingUIEnabled_fromClient___block_invoke(uint64_t a1, char a2)
{
  id v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __86__SBSystemServiceServer__handleTestAutomationGetChamoisWindowingUIEnabled_fromClient___block_invoke_2;
  v4[3] = &__block_descriptor_33_e33_v16__0__NSObject_OS_xpc_object__8l;
  char v5 = a2;
  return [v2 sendReplyMessageWithPacker:v4];
}

void __86__SBSystemServiceServer__handleTestAutomationGetChamoisWindowingUIEnabled_fromClient___block_invoke_2(uint64_t a1, xpc_object_t xdict)
{
}

- (void)_handleTestAutomationSetChamoisWindowingUIEnabled:(id)a3 fromClient:(id)a4
{
  id v10 = a4;
  id v6 = [a3 payload];
  id v7 = v6;
  if (v6 && object_getClass(v6) == (Class)MEMORY[0x1E4F14590])
  {
    BOOL v8 = xpc_dictionary_get_BOOL(v7, (const char *)*MEMORY[0x1E4FA7868]);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_testAutomationDelegate);
    [WeakRetained systemServiceServer:self client:v10 setChamoisWindowingUIEnabled:v8];
  }
}

- (void)_handleTestAutomationGetChamoisPrefersDockHidden:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_testAutomationDelegate);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __85__SBSystemServiceServer__handleTestAutomationGetChamoisPrefersDockHidden_fromClient___block_invoke;
  v10[3] = &unk_1E6AF5350;
  id v11 = v6;
  id v9 = v6;
  [WeakRetained systemServiceServer:self client:v7 getChamoisPrefersDockHiddenWithCompletion:v10];
}

uint64_t __85__SBSystemServiceServer__handleTestAutomationGetChamoisPrefersDockHidden_fromClient___block_invoke(uint64_t a1, char a2)
{
  id v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __85__SBSystemServiceServer__handleTestAutomationGetChamoisPrefersDockHidden_fromClient___block_invoke_2;
  v4[3] = &__block_descriptor_33_e33_v16__0__NSObject_OS_xpc_object__8l;
  char v5 = a2;
  return [v2 sendReplyMessageWithPacker:v4];
}

void __85__SBSystemServiceServer__handleTestAutomationGetChamoisPrefersDockHidden_fromClient___block_invoke_2(uint64_t a1, xpc_object_t xdict)
{
}

- (void)_handleTestAutomationSetChamoisPrefersDockHidden:(id)a3 fromClient:(id)a4
{
  id v10 = a4;
  id v6 = [a3 payload];
  id v7 = v6;
  if (v6 && object_getClass(v6) == (Class)MEMORY[0x1E4F14590])
  {
    BOOL v8 = xpc_dictionary_get_BOOL(v7, (const char *)*MEMORY[0x1E4FA7868]);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_testAutomationDelegate);
    [WeakRetained systemServiceServer:self client:v10 setChamoisPrefersDockHidden:v8];
  }
}

- (void)_handleTestAutomationGetChamoisPrefersStripHidden:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_testAutomationDelegate);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __86__SBSystemServiceServer__handleTestAutomationGetChamoisPrefersStripHidden_fromClient___block_invoke;
  v10[3] = &unk_1E6AF5350;
  id v11 = v6;
  id v9 = v6;
  [WeakRetained systemServiceServer:self client:v7 getChamoisPrefersStripHiddenWithCompletion:v10];
}

uint64_t __86__SBSystemServiceServer__handleTestAutomationGetChamoisPrefersStripHidden_fromClient___block_invoke(uint64_t a1, char a2)
{
  id v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __86__SBSystemServiceServer__handleTestAutomationGetChamoisPrefersStripHidden_fromClient___block_invoke_2;
  v4[3] = &__block_descriptor_33_e33_v16__0__NSObject_OS_xpc_object__8l;
  char v5 = a2;
  return [v2 sendReplyMessageWithPacker:v4];
}

void __86__SBSystemServiceServer__handleTestAutomationGetChamoisPrefersStripHidden_fromClient___block_invoke_2(uint64_t a1, xpc_object_t xdict)
{
}

- (void)_handleTestAutomationSetChamoisPrefersStripHidden:(id)a3 fromClient:(id)a4
{
  id v10 = a4;
  id v6 = [a3 payload];
  id v7 = v6;
  if (v6 && object_getClass(v6) == (Class)MEMORY[0x1E4F14590])
  {
    BOOL v8 = xpc_dictionary_get_BOOL(v7, (const char *)*MEMORY[0x1E4FA7868]);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_testAutomationDelegate);
    [WeakRetained systemServiceServer:self client:v10 setChamoisPrefersStripHidden:v8];
  }
}

- (void)_handleTestAutomationGetDeviceSupportsSystemAperture:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __89__SBSystemServiceServer__handleTestAutomationGetDeviceSupportsSystemAperture_fromClient___block_invoke;
  v14[3] = &unk_1E6AF5350;
  id v15 = v6;
  id v7 = v6;
  id v8 = a4;
  id v9 = (void *)MEMORY[0x1D948C7A0](v14);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_testAutomationDelegate);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __89__SBSystemServiceServer__handleTestAutomationGetDeviceSupportsSystemAperture_fromClient___block_invoke_3;
  v12[3] = &unk_1E6AF5A50;
  id v13 = v9;
  id v11 = v9;
  [WeakRetained systemServiceServer:self client:v8 getDeviceSupportsSystemAperture:v12];
}

uint64_t __89__SBSystemServiceServer__handleTestAutomationGetDeviceSupportsSystemAperture_fromClient___block_invoke(uint64_t a1, char a2)
{
  id v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __89__SBSystemServiceServer__handleTestAutomationGetDeviceSupportsSystemAperture_fromClient___block_invoke_2;
  v4[3] = &__block_descriptor_33_e33_v16__0__NSObject_OS_xpc_object__8l;
  char v5 = a2;
  return [v2 sendReplyMessageWithPacker:v4];
}

void __89__SBSystemServiceServer__handleTestAutomationGetDeviceSupportsSystemAperture_fromClient___block_invoke_2(uint64_t a1, xpc_object_t xdict)
{
}

uint64_t __89__SBSystemServiceServer__handleTestAutomationGetDeviceSupportsSystemAperture_fromClient___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_handleTestAutomationGetSystemApertureStateDump:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_testAutomationDelegate);
  id v9 = [WeakRetained systemServiceServer:self getSystemApertureStateDumpForClient:v7];

  if (v9)
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __84__SBSystemServiceServer__handleTestAutomationGetSystemApertureStateDump_fromClient___block_invoke;
    v12[3] = &unk_1E6B07910;
    id v13 = v9;
    id v14 = v10;
    id v11 = v10;
    [v6 sendReplyMessageWithPacker:v12];
  }
}

void __84__SBSystemServiceServer__handleTestAutomationGetSystemApertureStateDump_fromClient___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v16 = a2;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v18 = a1;
  obuint64_t j = *(id *)(a1 + 32);
  uint64_t v3 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v24 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        id v9 = v7;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v20;
          do
          {
            for (uint64_t j = 0; j != v11; ++j)
            {
              if (*(void *)v20 != v12) {
                objc_enumerationMutation(v9);
              }
              id v14 = *(void **)(*((void *)&v19 + 1) + 8 * j);
              id v15 = [v9 valueForKey:v14];
              [v14 UTF8String];
              BSSerializeStringToXPCDictionaryWithKey();
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v27 count:16];
          }
          while (v11);
        }

        [*(id *)(v18 + 40) addObject:v8];
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v4);
  }

  BSSerializeArrayToXPCDictionaryWithKey();
}

id __84__SBSystemServiceServer__handleTestAutomationGetSystemApertureStateDump_fromClient___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  return v2;
}

- (void)_handleTestAutomationGetWidgetControllerStateDump:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_testAutomationDelegate);
  id v9 = [WeakRetained systemServiceServer:self getWidgetControllerStateDump:v7];

  if (v9)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __86__SBSystemServiceServer__handleTestAutomationGetWidgetControllerStateDump_fromClient___block_invoke;
    v10[3] = &unk_1E6AFC038;
    id v11 = v9;
    [v6 sendReplyMessageWithPacker:v10];
  }
}

void __86__SBSystemServiceServer__handleTestAutomationGetWidgetControllerStateDump_fromClient___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4F28D90];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  id v5 = [v2 dataWithJSONObject:v3 options:1 error:0];
  BSSerializeDataToXPCDictionaryWithKey();
}

- (void)_handleStateDumpServiceClientMessageTypeStateDump:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  xpc_object_t v8 = [v6 payload];
  id v9 = v8;
  if (v8 && object_getClass(v8) == (Class)MEMORY[0x1E4F14590])
  {
    uint64_t uint64 = xpc_dictionary_get_uint64(v9, (const char *)*MEMORY[0x1E4FA77E8]);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_stateDumpDelegate);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __86__SBSystemServiceServer__handleStateDumpServiceClientMessageTypeStateDump_fromClient___block_invoke;
    v12[3] = &unk_1E6AF84B8;
    id v13 = v6;
    [WeakRetained systemServiceServer:self client:v7 requestStateDump:uint64 withCompletion:v12];
  }
}

void __86__SBSystemServiceServer__handleStateDumpServiceClientMessageTypeStateDump_fromClient___block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  id v9 = *(void **)(a1 + 32);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __86__SBSystemServiceServer__handleStateDumpServiceClientMessageTypeStateDump_fromClient___block_invoke_2;
  v12[3] = &unk_1E6B079C0;
  char v15 = a2;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  [v9 sendReplyMessageWithPacker:v12];
}

void __86__SBSystemServiceServer__handleStateDumpServiceClientMessageTypeStateDump_fromClient___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = (const char *)*MEMORY[0x1E4FA77F0];
  char v4 = *(unsigned char *)(a1 + 48);
  xpc_object_t xdict = a2;
  xpc_dictionary_set_BOOL(xdict, v3, v4);
  id v5 = (const char *)*MEMORY[0x1E4FA77D8];
  id v6 = *(void **)(a1 + 32);
  if (v6) {
    id v7 = (const char *)[v6 UTF8String];
  }
  else {
    id v7 = "";
  }
  xpc_dictionary_set_string(xdict, v5, v7);
  xpc_dictionary_set_string(xdict, (const char *)*MEMORY[0x1E4FA77F8], (const char *)[*(id *)(a1 + 40) UTF8String]);
}

- (void)_handleStateDumpServiceClientMessageTypeStateDumpToFile:(id)a3 fromClient:(id)a4
{
  id v12 = a4;
  id v6 = [a3 payload];
  id v7 = v6;
  if (v6 && object_getClass(v6) == (Class)MEMORY[0x1E4F14590])
  {
    uint64_t uint64 = xpc_dictionary_get_uint64(v7, (const char *)*MEMORY[0x1E4FA77E8]);
    string = xpc_dictionary_get_string(v7, (const char *)*MEMORY[0x1E4FA77E0]);
    if (string)
    {
      id v10 = [NSString stringWithUTF8String:string];
    }
    else
    {
      id v10 = 0;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_stateDumpDelegate);
    [WeakRetained systemServiceServer:self client:v12 requestStateDump:uint64 toTextFileAtPath:v10];
  }
}

- (void)_handleStateDumpServiceClientMessageTypeEnableRemoteStateDump:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 payload];
  id v9 = v8;
  if (v8 && object_getClass(v8) == (Class)MEMORY[0x1E4F14590])
  {
    int64_t int64 = xpc_dictionary_get_int64(v9, (const char *)*MEMORY[0x1E4FA77D0]);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_stateDumpDelegate);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __98__SBSystemServiceServer__handleStateDumpServiceClientMessageTypeEnableRemoteStateDump_fromClient___block_invoke;
    v12[3] = &unk_1E6B07A10;
    id v13 = v6;
    [WeakRetained systemServiceServer:self client:v7 enableRemoteStateDumpWithTimeout:int64 completion:v12];
  }
}

void __98__SBSystemServiceServer__handleStateDumpServiceClientMessageTypeEnableRemoteStateDump_fromClient___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __98__SBSystemServiceServer__handleStateDumpServiceClientMessageTypeEnableRemoteStateDump_fromClient___block_invoke_2;
  v8[3] = &unk_1E6B079E8;
  char v10 = a2;
  id v9 = v5;
  id v7 = v5;
  [v6 sendReplyMessageWithPacker:v8];
}

void __98__SBSystemServiceServer__handleStateDumpServiceClientMessageTypeEnableRemoteStateDump_fromClient___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = (const char *)*MEMORY[0x1E4FA77F0];
  char v4 = *(unsigned char *)(a1 + 40);
  xpc_object_t xdict = a2;
  xpc_dictionary_set_BOOL(xdict, v3, v4);
  xpc_dictionary_set_string(xdict, (const char *)*MEMORY[0x1E4FA77F8], (const char *)[*(id *)(a1 + 32) UTF8String]);
}

- (void)_handleStateDumpServiceClientMessageTypeDisableRemoteStateDump:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stateDumpDelegate);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __99__SBSystemServiceServer__handleStateDumpServiceClientMessageTypeDisableRemoteStateDump_fromClient___block_invoke;
  v10[3] = &unk_1E6B07A10;
  id v11 = v6;
  id v9 = v6;
  [WeakRetained systemServiceServer:self client:v7 disableRemoteStateDumpWithCompletion:v10];
}

void __99__SBSystemServiceServer__handleStateDumpServiceClientMessageTypeDisableRemoteStateDump_fromClient___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __99__SBSystemServiceServer__handleStateDumpServiceClientMessageTypeDisableRemoteStateDump_fromClient___block_invoke_2;
  v8[3] = &unk_1E6B079E8;
  char v10 = a2;
  id v9 = v5;
  id v7 = v5;
  [v6 sendReplyMessageWithPacker:v8];
}

void __99__SBSystemServiceServer__handleStateDumpServiceClientMessageTypeDisableRemoteStateDump_fromClient___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = (const char *)*MEMORY[0x1E4FA77F0];
  char v4 = *(unsigned char *)(a1 + 40);
  xpc_object_t xdict = a2;
  xpc_dictionary_set_BOOL(xdict, v3, v4);
  xpc_dictionary_set_string(xdict, (const char *)*MEMORY[0x1E4FA77F8], (const char *)[*(id *)(a1 + 32) UTF8String]);
}

- (SBSystemServiceServerAppSwitcherDelegate)appSwitcherDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appSwitcherDelegate);
  return (SBSystemServiceServerAppSwitcherDelegate *)WeakRetained;
}

- (void)setAppSwitcherDelegate:(id)a3
{
}

- (SBSystemServiceServerBiometricsDelegate)biometricsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_biometricsDelegate);
  return (SBSystemServiceServerBiometricsDelegate *)WeakRetained;
}

- (void)setBiometricsDelegate:(id)a3
{
}

- (void)setHardwareButtonDelegate:(id)a3
{
}

- (SBSystemServiceServerSoftwareUpdateDelegate)softwareUpdateDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_softwareUpdateDelegate);
  return (SBSystemServiceServerSoftwareUpdateDelegate *)WeakRetained;
}

- (void)setSoftwareUpdateDelegate:(id)a3
{
}

- (SBSystemServiceServerTestAutomationDelegate)testAutomationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_testAutomationDelegate);
  return (SBSystemServiceServerTestAutomationDelegate *)WeakRetained;
}

- (void)setTestAutomationDelegate:(id)a3
{
}

- (SBSystemServiceServerStateDumpDelegate)stateDumpDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stateDumpDelegate);
  return (SBSystemServiceServerStateDumpDelegate *)WeakRetained;
}

- (void)setStateDumpDelegate:(id)a3
{
}

- (SBSystemServiceServerSystemApertureStateDumpDelegate)systemApertureStateDumpDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_systemApertureStateDumpDelegate);
  return (SBSystemServiceServerSystemApertureStateDumpDelegate *)WeakRetained;
}

- (void)setSystemApertureStateDumpDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_systemApertureStateDumpDelegate);
  objc_destroyWeak((id *)&self->_stateDumpDelegate);
  objc_destroyWeak((id *)&self->_testAutomationDelegate);
  objc_destroyWeak((id *)&self->_softwareUpdateDelegate);
  objc_destroyWeak((id *)&self->_hardwareButtonDelegate);
  objc_destroyWeak((id *)&self->_biometricsDelegate);
  objc_destroyWeak((id *)&self->_appSwitcherDelegate);
}

- (void)noteClientDidDisconnect:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_DEBUG, "client did disconnect:%{public}@", (uint8_t *)&v2, 0xCu);
}

@end
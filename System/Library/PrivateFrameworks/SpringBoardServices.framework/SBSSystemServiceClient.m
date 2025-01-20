@interface SBSSystemServiceClient
+ (id)serviceFacilityIdentifier;
- (BOOL)chamoisPrefersDockHidden;
- (BOOL)chamoisPrefersStripHidden;
- (BOOL)deviceSupportsSystemAperture;
- (BOOL)getAssociatedHintViewsSupported;
- (BOOL)isChamoisWindowingUIEnabled;
- (BOOL)systemApertureUnderAutomationTesting;
- (NSArray)systemApertureStateDump;
- (NSDictionary)widgetControllerStateDump;
- (NSMutableArray)systemApertureModelStateDump;
- (NSMutableDictionary)animationFrameRecordings;
- (id)acquireAssertionForReachabilityEnabled:(BOOL)a3;
- (id)acquireHUDHiddenAssertionForIdentifier:(id)a3;
- (id)deserializedStringArrayForKey:(const char *)a3 fromPayload:(id)a4;
- (id)registerAssociatedHintViewContextId:(unsigned int)a3 layerRenderId:(unint64_t)a4 layerSize:(CGSize)a5 forButtonKind:(int64_t)a6;
- (int64_t)passcodePolicy;
- (int64_t)toggleStateForButtonKind:(int64_t)a3;
- (void)_handleButtonEventConsumePressMessage:(id)a3;
- (void)acquireAssertionOfType:(int64_t)a3 forReason:(id)a4 withCompletion:(id)a5;
- (void)addWidgetStackWithIdentifiers:(id)a3 toPage:(int)a4 withSizing:(int)a5;
- (void)addWidgetWithIdentifier:(id)a3 toPage:(int)a4 withSizing:(int)a5;
- (void)addWidgetsToEachPage;
- (void)clearAllUserNotifications;
- (void)countScenesForBundleIdentifier:(id)a3 withCompletion:(id)a4;
- (void)disableRemoteStateDumpWithCompletion:(id)a3;
- (void)enableRemoteStateDumpWithTimeout:(int64_t)a3 completion:(id)a4;
- (void)enterLostMode;
- (void)exitLostMode;
- (void)fetchHapticTypeForButtonKind:(int64_t)a3 completion:(id)a4;
- (void)fetchUnlockCredentialSetWithCompletion:(id)a3;
- (void)handleMessage:(id)a3 withType:(int64_t)a4;
- (void)loadStashedSwitcherModelFromPath:(id)a3;
- (void)requestAppSwitcherAppearanceForHiddenApplicationWithBundleIdentifier:(id)a3 reacquiringExistingAssertion:(id)a4 completion:(id)a5;
- (void)requestStateDump:(unint64_t)a3 withCompletion:(id)a4;
- (void)requestSystemApertureStateDumpWithCompletion:(id)a3;
- (void)requestSystemGlowEffectWithInitialStyle:(int64_t)a3 completion:(id)a4;
- (void)resetToHomeScreenAnimated:(BOOL)a3;
- (void)setAccessoryType:(int64_t)a3 attached:(BOOL)a4;
- (void)setAlertsEnabled:(BOOL)a3;
- (void)setAmbientPresentationState:(int64_t)a3;
- (void)setApplicationBundleIdentifier:(id)a3 blockedForScreenTime:(BOOL)a4;
- (void)setButtonEventServiceIsWaitingForServerMessages:(BOOL)a3;
- (void)setChamoisHideStripsEnabled:(BOOL)a3;
- (void)setChamoisPrefersDockHidden:(BOOL)a3;
- (void)setChamoisPrefersStripHidden:(BOOL)a3;
- (void)setChamoisWindowingUIEnabled:(BOOL)a3;
- (void)setEventMask:(unint64_t)a3 forButtonKind:(int64_t)a4 priority:(int64_t)a5;
- (void)setHapticType:(int64_t)a3 forButtonKind:(int64_t)a4;
- (void)setHiddenFeaturesEnabled:(BOOL)a3;
- (void)setIdleTimerEnabled:(BOOL)a3;
- (void)setMallocStackLoggingEnabled:(BOOL)a3;
- (void)setOrientationLockEnabled:(BOOL)a3;
- (void)setPasscodePolicy:(int64_t)a3;
- (void)setReachabilityActive:(BOOL)a3;
- (void)setRequestsHIDEvents:(BOOL)a3 token:(id)a4 forButtonKind:(int64_t)a5;
- (void)setSpringBoardAnimationFrameRecordingEnabledForUpdateTypes:(unint64_t)a3;
- (void)setSystemApertureUnderAutomationTesting:(BOOL)a3;
- (void)setTestRunnerRecoveryApplicationBundleIdentifier:(id)a3;
- (void)setUserPresenceDetectedSinceWake;
- (void)stashSwitcherModelToPath:(id)a3;
- (void)suspendAllDisplays;
- (void)updateHintViewContentVisibility:(int64_t)a3 forButton:(int64_t)a4 animationSettings:(id)a5;
- (void)updateSystemGlowStyle:(int64_t)a3;
- (void)writeStateDump:(unint64_t)a3 toTextFileAtPath:(id)a4;
- (void)writeSystemApertureStateDumpToTextFileAtPath:(id)a3;
@end

@implementation SBSSystemServiceClient

void __62__SBSSystemServiceClient_setEventMask_forButtonKind_priority___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  xpc_object_t xdict = a2;
  xpc_dictionary_set_uint64(xdict, "eventMask", v3);
  xpc_dictionary_set_int64(xdict, "priority", a1[5]);
  xpc_dictionary_set_int64(xdict, "buttonKind", a1[6]);
}

- (void)setEventMask:(unint64_t)a3 forButtonKind:(int64_t)a4 priority:(int64_t)a5
{
  [(SBSSystemServiceClient *)self setButtonEventServiceIsWaitingForServerMessages:a3 != 0];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __62__SBSSystemServiceClient_setEventMask_forButtonKind_priority___block_invoke;
  v10[3] = &__block_descriptor_56_e33_v16__0__NSObject_OS_xpc_object__8l;
  v10[4] = a3;
  v10[5] = a5;
  v10[6] = a4;
  v9 = [MEMORY[0x1E4F62B40] messageWithPacker:v10];
  [(FBSServiceFacilityClient *)self sendMessage:v9 withType:3];
}

- (void)setButtonEventServiceIsWaitingForServerMessages:(BOOL)a3
{
  if (self->_buttonEventServiceIsWaitingForServerMessages != a3)
  {
    v5 = objc_opt_class();
    if (a3) {
      id v6 = (id)[v5 checkOutClientWithClass:v5];
    }
    else {
      [v5 checkInClient:self];
    }
    self->_buttonEventServiceIsWaitingForServerMessages = a3;
  }
}

+ (id)serviceFacilityIdentifier
{
  return @"com.apple.springboardservices.system";
}

- (void)requestAppSwitcherAppearanceForHiddenApplicationWithBundleIdentifier:(id)a3 reacquiringExistingAssertion:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v11)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"SBSSystemServiceClient.m", 42, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  id v12 = [v10 receiveRight];
  if (v12 || (id v12 = objc_alloc_init(MEMORY[0x1E4F4F768]), ([v12 isUsable] & 1) != 0))
  {
    objc_initWeak(&location, v10);
    v13 = (void *)MEMORY[0x1E4F62B40];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __135__SBSSystemServiceClient_requestAppSwitcherAppearanceForHiddenApplicationWithBundleIdentifier_reacquiringExistingAssertion_completion___block_invoke;
    v22[3] = &unk_1E566C788;
    id v14 = v12;
    id v23 = v14;
    id v24 = v9;
    v15 = [v13 messageWithPacker:v22];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __135__SBSSystemServiceClient_requestAppSwitcherAppearanceForHiddenApplicationWithBundleIdentifier_reacquiringExistingAssertion_completion___block_invoke_2;
    v17[3] = &unk_1E566C7D8;
    v17[4] = self;
    objc_copyWeak(&v20, &location);
    BOOL v21 = v10 != 0;
    id v12 = v14;
    id v18 = v12;
    id v19 = v11;
    [(FBSServiceFacilityClient *)self sendMessage:v15 withType:0 replyHandler:v17 waitForReply:v10 != 0 timeout:0.0];

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
  else
  {
    (*((void (**)(id, void, void))v11 + 2))(v11, 0, 0);
  }
}

void __135__SBSSystemServiceClient_requestAppSwitcherAppearanceForHiddenApplicationWithBundleIdentifier_reacquiringExistingAssertion_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (objc_class *)MEMORY[0x1E4F4F770];
  id v4 = a2;
  id v5 = (id)[[v3 alloc] initFromReceiveRight:*(void *)(a1 + 32)];
  BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
  BSSerializeStringToXPCDictionaryWithKey();
}

void __135__SBSSystemServiceClient_requestAppSwitcherAppearanceForHiddenApplicationWithBundleIdentifier_reacquiringExistingAssertion_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 payload];
  id v4 = v3;
  if (v3) {
    BOOL v5 = xpc_dictionary_get_BOOL(v3, SBSAppSwitcherServiceMessageKeySuccessResult);
  }
  else {
    BOOL v5 = 0;
  }
  id v6 = [*(id *)(a1 + 32) calloutQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __135__SBSSystemServiceClient_requestAppSwitcherAppearanceForHiddenApplicationWithBundleIdentifier_reacquiringExistingAssertion_completion___block_invoke_3;
  block[3] = &unk_1E566C7B0;
  objc_copyWeak(&v12, (id *)(a1 + 56));
  BOOL v13 = v5;
  char v14 = *(unsigned char *)(a1 + 64);
  id v9 = *(id *)(a1 + 40);
  id v10 = v4;
  id v11 = *(id *)(a1 + 48);
  id v7 = v4;
  dispatch_async(v6, block);

  objc_destroyWeak(&v12);
}

void __135__SBSSystemServiceClient_requestAppSwitcherAppearanceForHiddenApplicationWithBundleIdentifier_reacquiringExistingAssertion_completion___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v6 = WeakRetained;
  if (*(unsigned char *)(a1 + 64))
  {
    if (*(unsigned char *)(a1 + 65))
    {
      if (![WeakRetained isValid])
      {
        id v4 = 0;
        goto LABEL_11;
      }
      uint64_t v3 = (SBSAssertion *)v6;
    }
    else
    {
      uint64_t v3 = [[SBSAssertion alloc] initWithAssertionName:@"com.apple.springboard.requestAppSwitcherAppearance" reason:@"requestAppSwitcherAppearanceForHiddenApp" receiveRight:*(void *)(a1 + 32)];
    }
    id v4 = v3;
LABEL_11:
    BOOL v5 = BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey();
    goto LABEL_12;
  }
  if (!*(unsigned char *)(a1 + 65)) {
    [*(id *)(a1 + 32) invalidate];
  }
  id v4 = 0;
  BOOL v5 = 0;
LABEL_12:
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)fetchUnlockCredentialSetWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = [MEMORY[0x1E4F62B40] message];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __65__SBSSystemServiceClient_fetchUnlockCredentialSetWithCompletion___block_invoke;
    v6[3] = &unk_1E566C0B8;
    id v7 = v4;
    [(FBSServiceFacilityClient *)self sendMessage:v5 withType:1 replyHandler:v6 waitForReply:0 timeout:0.0];
  }
}

void __65__SBSSystemServiceClient_fetchUnlockCredentialSetWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 payload];
  id v4 = (void *)v3;
  if (v3 && MEMORY[0x192FC1100](v3) == MEMORY[0x1E4F14590])
  {
    uint64_t v5 = BSDeserializeDataFromXPCDictionaryWithKey();
  }
  else
  {
    uint64_t v5 = 0;
  }
  id v6 = (id)v5;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)acquireAssertionOfType:(int64_t)a3 forReason:(id)a4 withCompletion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    id v10 = (void *)MEMORY[0x1E4F62B40];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __74__SBSSystemServiceClient_acquireAssertionOfType_forReason_withCompletion___block_invoke;
    v14[3] = &unk_1E566C170;
    int64_t v16 = a3;
    id v15 = v8;
    id v11 = [v10 messageWithPacker:v14];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __74__SBSSystemServiceClient_acquireAssertionOfType_forReason_withCompletion___block_invoke_2;
    v12[3] = &unk_1E566C0B8;
    id v13 = v9;
    [(FBSServiceFacilityClient *)self sendMessage:v11 withType:2 replyHandler:v12 waitForReply:0 timeout:0.0];
  }
}

void __74__SBSSystemServiceClient_acquireAssertionOfType_forReason_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = a2;
  xpc_dictionary_set_uint64(v3, "assertionType", v2);
  BSSerializeStringToXPCDictionaryWithKey();
}

void __74__SBSSystemServiceClient_acquireAssertionOfType_forReason_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 payload];
  id v4 = (void *)v3;
  if (v3 && MEMORY[0x192FC1100](v3) == MEMORY[0x1E4F14590])
  {
    uint64_t v5 = BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey();
  }
  else
  {
    uint64_t v5 = 0;
  }
  id v6 = (id)v5;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (int64_t)toggleStateForButtonKind:(int64_t)a3
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = -1;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__SBSSystemServiceClient_toggleStateForButtonKind___block_invoke;
  v8[3] = &__block_descriptor_40_e33_v16__0__NSObject_OS_xpc_object__8l;
  v8[4] = a3;
  id v4 = [MEMORY[0x1E4F62B40] messageWithPacker:v8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__SBSSystemServiceClient_toggleStateForButtonKind___block_invoke_2;
  v7[3] = &unk_1E566C148;
  v7[4] = &v9;
  [(FBSServiceFacilityClient *)self sendMessage:v4 withType:5 replyHandler:v7 waitForReply:1 timeout:0.0];

  int64_t v5 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v5;
}

void __51__SBSSystemServiceClient_toggleStateForButtonKind___block_invoke(uint64_t a1, xpc_object_t xdict)
{
}

void __51__SBSSystemServiceClient_toggleStateForButtonKind___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 payload];
  if (v3)
  {
    xpc_object_t xdict = v3;
    BOOL v4 = MEMORY[0x192FC1100]() == MEMORY[0x1E4F14590];
    uint64_t v3 = xdict;
    if (v4)
    {
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = xpc_dictionary_get_int64(xdict, "toggleButtonState");
      uint64_t v3 = xdict;
    }
  }
}

- (void)setRequestsHIDEvents:(BOOL)a3 token:(id)a4 forButtonKind:(int64_t)a5
{
  id v8 = a4;
  uint64_t v9 = (void *)MEMORY[0x1E4F62B40];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __67__SBSSystemServiceClient_setRequestsHIDEvents_token_forButtonKind___block_invoke;
  v12[3] = &unk_1E566C820;
  BOOL v15 = a3;
  id v13 = v8;
  int64_t v14 = a5;
  id v10 = v8;
  uint64_t v11 = [v9 messageWithPacker:v12];
  [(FBSServiceFacilityClient *)self sendMessage:v11 withType:4];
}

void __67__SBSSystemServiceClient_setRequestsHIDEvents_token_forButtonKind___block_invoke(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  xpc_dictionary_set_int64(xdict, "buttonKind", *(void *)(a1 + 40));
  xpc_dictionary_set_BOOL(xdict, "HIDEventsEnabled", *(unsigned char *)(a1 + 48));
  if (*(void *)(a1 + 32)) {
    BSSerializeNSSecureEncodableObjectToXPCDictionaryWithKey();
  }
}

- (void)_handleButtonEventConsumePressMessage:(id)a3
{
  xpc_object_t xdict = [a3 payload];
  int64_t int64 = xpc_dictionary_get_int64(xdict, "eventType");
  int64_t v4 = xpc_dictionary_get_int64(xdict, "priority");
  int64_t v5 = xpc_dictionary_get_int64(xdict, "buttonKind");
  id v6 = +[SBSHardwareButtonService sharedInstance];
  [v6 handleButtonPressMessage:int64 forButtonKind:v5 priority:v4];
}

- (void)setHapticType:(int64_t)a3 forButtonKind:(int64_t)a4
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__SBSSystemServiceClient_setHapticType_forButtonKind___block_invoke;
  v6[3] = &__block_descriptor_48_e33_v16__0__NSObject_OS_xpc_object__8l;
  void v6[4] = a4;
  v6[5] = a3;
  int64_t v5 = [MEMORY[0x1E4F62B40] messageWithPacker:v6];
  [(FBSServiceFacilityClient *)self sendMessage:v5 withType:6];
}

void __54__SBSSystemServiceClient_setHapticType_forButtonKind___block_invoke(uint64_t a1, void *a2)
{
  int64_t v3 = *(void *)(a1 + 32);
  xpc_object_t xdict = a2;
  xpc_dictionary_set_int64(xdict, "buttonKind", v3);
  xpc_dictionary_set_int64(xdict, "hapticType", *(void *)(a1 + 40));
}

- (void)fetchHapticTypeForButtonKind:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __66__SBSSystemServiceClient_fetchHapticTypeForButtonKind_completion___block_invoke;
  v11[3] = &__block_descriptor_40_e33_v16__0__NSObject_OS_xpc_object__8l;
  v11[4] = a3;
  id v7 = [MEMORY[0x1E4F62B40] messageWithPacker:v11];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __66__SBSSystemServiceClient_fetchHapticTypeForButtonKind_completion___block_invoke_2;
  v9[3] = &unk_1E566C0B8;
  id v10 = v6;
  id v8 = v6;
  [(FBSServiceFacilityClient *)self sendMessage:v7 withType:7 replyHandler:v9 waitForReply:0 timeout:0.0];
}

void __66__SBSSystemServiceClient_fetchHapticTypeForButtonKind_completion___block_invoke(uint64_t a1, xpc_object_t xdict)
{
}

void __66__SBSSystemServiceClient_fetchHapticTypeForButtonKind_completion___block_invoke_2(uint64_t a1, void *a2)
{
  xpc_object_t xdict = [a2 payload];
  if (xdict && MEMORY[0x192FC1100]() == MEMORY[0x1E4F14590]) {
    xpc_dictionary_get_int64(xdict, "hapticType");
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)getAssociatedHintViewsSupported
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__SBSSystemServiceClient_getAssociatedHintViewsSupported__block_invoke;
  block[3] = &unk_1E566BCE8;
  void block[4] = self;
  if (getAssociatedHintViewsSupported_onceToken != -1) {
    dispatch_once(&getAssociatedHintViewsSupported_onceToken, block);
  }
  return getAssociatedHintViewsSupported_hintViewsSupported;
}

void __57__SBSSystemServiceClient_getAssociatedHintViewsSupported__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [MEMORY[0x1E4F62B40] message];
  [v1 sendMessage:v2 withType:8 replyHandler:&__block_literal_global_30 waitForReply:1 timeout:0.0];
}

void __57__SBSSystemServiceClient_getAssociatedHintViewsSupported__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 payload];
  if (v2)
  {
    xpc_object_t xdict = v2;
    BOOL v3 = MEMORY[0x192FC1100]() == MEMORY[0x1E4F14590];
    id v2 = xdict;
    if (v3)
    {
      getAssociatedHintViewsSupported_hintViewsSupported = xpc_dictionary_get_BOOL(xdict, "buttonHintViewsSupported");
      id v2 = xdict;
    }
  }
}

- (id)registerAssociatedHintViewContextId:(unsigned int)a3 layerRenderId:(unint64_t)a4 layerSize:(CGSize)a5 forButtonKind:(int64_t)a6
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  id v12 = objc_alloc_init(MEMORY[0x1E4F4F768]);
  if ([v12 isUsable])
  {
    uint64_t v35 = 0;
    v36 = &v35;
    uint64_t v37 = 0x2020000000;
    char v38 = 0;
    id v13 = (void *)MEMORY[0x1E4F62B40];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __100__SBSSystemServiceClient_registerAssociatedHintViewContextId_layerRenderId_layerSize_forButtonKind___block_invoke;
    v28[3] = &unk_1E566C888;
    id v14 = v12;
    unsigned int v34 = a3;
    id v29 = v14;
    unint64_t v30 = a4;
    CGFloat v31 = width;
    CGFloat v32 = height;
    int64_t v33 = a6;
    BOOL v15 = [v13 messageWithPacker:v28];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __100__SBSSystemServiceClient_registerAssociatedHintViewContextId_layerRenderId_layerSize_forButtonKind___block_invoke_2;
    v27[3] = &unk_1E566C148;
    v27[4] = &v35;
    [(FBSServiceFacilityClient *)self sendMessage:v15 withType:9 replyHandler:v27 waitForReply:1 timeout:0.0];

    if (*((unsigned char *)v36 + 24))
    {
      int64_t v16 = [MEMORY[0x1E4F28B50] mainBundle];
      v17 = [v16 bundleIdentifier];
      id v18 = v17;
      if (v17)
      {
        id v19 = v17;
      }
      else
      {
        BOOL v21 = [MEMORY[0x1E4F28B50] mainBundle];
        id v19 = [v21 bundlePath];
      }
      v22 = [NSString stringWithFormat:@"SBSHardwareButtonService request from %@", v19];
      id v23 = [SBSHardwareButtonHintViewAssertion alloc];
      id v24 = [MEMORY[0x1E4F29128] UUID];
      v25 = [v24 UUIDString];
      id v20 = [(SBSHardwareButtonHintViewAssertion *)v23 initWithButtonKind:a6 assertionName:v25 reason:v22 receiveRight:v14];
    }
    else
    {
      id v20 = 0;
    }

    _Block_object_dispose(&v35, 8);
  }
  else
  {
    id v20 = 0;
  }

  return v20;
}

void __100__SBSSystemServiceClient_registerAssociatedHintViewContextId_layerRenderId_layerSize_forButtonKind___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = (objc_class *)MEMORY[0x1E4F4F770];
  id v4 = a2;
  id v5 = (id)[[v3 alloc] initFromReceiveRight:*(void *)(a1 + 32)];
  xpc_dictionary_set_uint64(v4, "sourceContextId", *(unsigned int *)(a1 + 72));
  xpc_dictionary_set_uint64(v4, "sourceLayerRenderId", *(void *)(a1 + 40));
  BSSerializeCGSizeToXPCDictionaryWithKey();
  xpc_dictionary_set_int64(v4, "buttonKind", *(void *)(a1 + 64));
  BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
}

void __100__SBSSystemServiceClient_registerAssociatedHintViewContextId_layerRenderId_layerSize_forButtonKind___block_invoke_2(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 payload];
  if (v3)
  {
    xpc_object_t xdict = v3;
    BOOL v4 = MEMORY[0x192FC1100]() == MEMORY[0x1E4F14590];
    BOOL v3 = xdict;
    if (v4)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = xpc_dictionary_get_BOOL(xdict, "success");
      BOOL v3 = xdict;
    }
  }
}

- (void)updateHintViewContentVisibility:(int64_t)a3 forButton:(int64_t)a4 animationSettings:(id)a5
{
  id v8 = a5;
  uint64_t v9 = (void *)MEMORY[0x1E4F62B40];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __86__SBSSystemServiceClient_updateHintViewContentVisibility_forButton_animationSettings___block_invoke;
  v12[3] = &unk_1E566C8B0;
  int64_t v14 = a3;
  int64_t v15 = a4;
  id v13 = v8;
  id v10 = v8;
  uint64_t v11 = [v9 messageWithPacker:v12];
  [(FBSServiceFacilityClient *)self sendMessage:v11 withType:10];
}

void __86__SBSSystemServiceClient_updateHintViewContentVisibility_forButton_animationSettings___block_invoke(uint64_t a1, void *a2)
{
  int64_t v3 = *(void *)(a1 + 40);
  xpc_object_t xdict = a2;
  xpc_dictionary_set_int64(xdict, "hintContentVisibility", v3);
  xpc_dictionary_set_int64(xdict, "buttonKind", *(void *)(a1 + 48));
  BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
}

- (void)requestSystemGlowEffectWithInitialStyle:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F4F768]);
  if ([v7 isUsable])
  {
    id v8 = (void *)MEMORY[0x1E4F62B40];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __77__SBSSystemServiceClient_requestSystemGlowEffectWithInitialStyle_completion___block_invoke;
    v14[3] = &unk_1E566C170;
    id v9 = v7;
    id v15 = v9;
    int64_t v16 = a3;
    id v10 = [v8 messageWithPacker:v14];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __77__SBSSystemServiceClient_requestSystemGlowEffectWithInitialStyle_completion___block_invoke_2;
    v11[3] = &unk_1E566C8D8;
    id v12 = v9;
    id v13 = v6;
    [(FBSServiceFacilityClient *)self sendMessage:v10 withType:11 replyHandler:v11 waitForReply:0 timeout:0.0];
  }
  else if (v6)
  {
    (*((void (**)(id, void))v6 + 2))(v6, 0);
  }
}

void __77__SBSSystemServiceClient_requestSystemGlowEffectWithInitialStyle_completion___block_invoke(uint64_t a1, void *a2)
{
  int64_t v3 = (objc_class *)MEMORY[0x1E4F4F770];
  id v4 = a2;
  id v5 = (id)[[v3 alloc] initFromReceiveRight:*(void *)(a1 + 32)];
  xpc_dictionary_set_int64(v4, "systemGlowStyle", *(void *)(a1 + 40));
  BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
}

void __77__SBSSystemServiceClient_requestSystemGlowEffectWithInitialStyle_completion___block_invoke_2(uint64_t a1, void *a2)
{
  int64_t v3 = [a2 payload];
  if (v3)
  {
    xpc_object_t xdict = v3;
    BOOL v4 = MEMORY[0x192FC1100]() == MEMORY[0x1E4F14590];
    int64_t v3 = xdict;
    if (v4)
    {
      if (xpc_dictionary_get_BOOL(xdict, "success"))
      {
        id v5 = [MEMORY[0x1E4F28B50] mainBundle];
        id v6 = [v5 bundleIdentifier];
        id v7 = v6;
        if (v6)
        {
          id v8 = v6;
        }
        else
        {
          id v10 = [MEMORY[0x1E4F28B50] mainBundle];
          id v8 = [v10 bundlePath];
        }
        uint64_t v11 = [NSString stringWithFormat:@"SBSHardwareButtonService system glow request from %@", v8];
        id v12 = [SBSHardwareButtonSystemGlowAssertion alloc];
        id v13 = [MEMORY[0x1E4F29128] UUID];
        int64_t v14 = [v13 UUIDString];
        id v9 = [(SBSAssertion *)v12 initWithAssertionName:v14 reason:v11 receiveRight:*(void *)(a1 + 32)];
      }
      else
      {
        id v9 = 0;
      }
      uint64_t v15 = *(void *)(a1 + 40);
      if (v15) {
        (*(void (**)(uint64_t, SBSHardwareButtonSystemGlowAssertion *))(v15 + 16))(v15, v9);
      }

      int64_t v3 = xdict;
    }
  }
}

- (void)updateSystemGlowStyle:(int64_t)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__SBSSystemServiceClient_updateSystemGlowStyle___block_invoke;
  v5[3] = &__block_descriptor_40_e33_v16__0__NSObject_OS_xpc_object__8l;
  v5[4] = a3;
  BOOL v4 = [MEMORY[0x1E4F62B40] messageWithPacker:v5];
  [(FBSServiceFacilityClient *)self sendMessage:v4 withType:12];
}

void __48__SBSSystemServiceClient_updateSystemGlowStyle___block_invoke(uint64_t a1, xpc_object_t xdict)
{
}

- (void)setPasscodePolicy:(int64_t)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__SBSSystemServiceClient_setPasscodePolicy___block_invoke;
  v5[3] = &__block_descriptor_40_e33_v16__0__NSObject_OS_xpc_object__8l;
  v5[4] = a3;
  BOOL v4 = [MEMORY[0x1E4F62B40] messageWithPacker:v5];
  [(FBSServiceFacilityClient *)self sendMessage:v4 withType:13];
}

void __44__SBSSystemServiceClient_setPasscodePolicy___block_invoke(uint64_t a1, xpc_object_t xdict)
{
}

- (int64_t)passcodePolicy
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  int64_t v3 = [MEMORY[0x1E4F62B40] message];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__SBSSystemServiceClient_passcodePolicy__block_invoke;
  v6[3] = &unk_1E566C148;
  void v6[4] = &v7;
  [(FBSServiceFacilityClient *)self sendMessage:v3 withType:14 replyHandler:v6 waitForReply:1 timeout:0.0];

  int64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __40__SBSSystemServiceClient_passcodePolicy__block_invoke(uint64_t a1, void *a2)
{
  int64_t v3 = [a2 payload];
  if (v3)
  {
    xpc_object_t xdict = v3;
    BOOL v4 = MEMORY[0x192FC1100]() == MEMORY[0x1E4F14590];
    int64_t v3 = xdict;
    if (v4)
    {
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = xpc_dictionary_get_int64(xdict, "passcodePolicy");
      int64_t v3 = xdict;
    }
  }
}

- (void)suspendAllDisplays
{
  id v3 = [MEMORY[0x1E4F62B40] message];
  [(FBSServiceFacilityClient *)self sendMessage:v3 withType:15];
}

- (void)clearAllUserNotifications
{
  id v3 = [MEMORY[0x1E4F62B40] message];
  [(FBSServiceFacilityClient *)self sendMessage:v3 withType:16];
}

- (void)setUserPresenceDetectedSinceWake
{
  id v3 = [MEMORY[0x1E4F62B40] message];
  [(FBSServiceFacilityClient *)self sendMessage:v3 withType:44];
}

- (void)setAlertsEnabled:(BOOL)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__SBSSystemServiceClient_setAlertsEnabled___block_invoke;
  v5[3] = &__block_descriptor_33_e33_v16__0__NSObject_OS_xpc_object__8l;
  BOOL v6 = a3;
  BOOL v4 = [MEMORY[0x1E4F62B40] messageWithPacker:v5];
  [(FBSServiceFacilityClient *)self sendMessage:v4 withType:17];
}

void __43__SBSSystemServiceClient_setAlertsEnabled___block_invoke(uint64_t a1, xpc_object_t xdict)
{
}

- (void)setHiddenFeaturesEnabled:(BOOL)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__SBSSystemServiceClient_setHiddenFeaturesEnabled___block_invoke;
  v5[3] = &__block_descriptor_33_e33_v16__0__NSObject_OS_xpc_object__8l;
  BOOL v6 = a3;
  BOOL v4 = [MEMORY[0x1E4F62B40] messageWithPacker:v5];
  [(FBSServiceFacilityClient *)self sendMessage:v4 withType:18];
}

void __51__SBSSystemServiceClient_setHiddenFeaturesEnabled___block_invoke(uint64_t a1, xpc_object_t xdict)
{
}

- (void)setIdleTimerEnabled:(BOOL)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__SBSSystemServiceClient_setIdleTimerEnabled___block_invoke;
  v5[3] = &__block_descriptor_33_e33_v16__0__NSObject_OS_xpc_object__8l;
  BOOL v6 = a3;
  BOOL v4 = [MEMORY[0x1E4F62B40] messageWithPacker:v5];
  [(FBSServiceFacilityClient *)self sendMessage:v4 withType:19];
}

void __46__SBSSystemServiceClient_setIdleTimerEnabled___block_invoke(uint64_t a1, xpc_object_t xdict)
{
}

- (void)setOrientationLockEnabled:(BOOL)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__SBSSystemServiceClient_setOrientationLockEnabled___block_invoke;
  v5[3] = &__block_descriptor_33_e33_v16__0__NSObject_OS_xpc_object__8l;
  BOOL v6 = a3;
  BOOL v4 = [MEMORY[0x1E4F62B40] messageWithPacker:v5];
  [(FBSServiceFacilityClient *)self sendMessage:v4 withType:20];
}

void __52__SBSSystemServiceClient_setOrientationLockEnabled___block_invoke(uint64_t a1, xpc_object_t xdict)
{
}

- (void)setMallocStackLoggingEnabled:(BOOL)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__SBSSystemServiceClient_setMallocStackLoggingEnabled___block_invoke;
  v5[3] = &__block_descriptor_33_e33_v16__0__NSObject_OS_xpc_object__8l;
  BOOL v6 = a3;
  BOOL v4 = [MEMORY[0x1E4F62B40] messageWithPacker:v5];
  [(FBSServiceFacilityClient *)self sendMessage:v4 withType:21];
}

void __55__SBSSystemServiceClient_setMallocStackLoggingEnabled___block_invoke(uint64_t a1, xpc_object_t xdict)
{
}

- (void)setReachabilityActive:(BOOL)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__SBSSystemServiceClient_setReachabilityActive___block_invoke;
  v5[3] = &__block_descriptor_33_e33_v16__0__NSObject_OS_xpc_object__8l;
  BOOL v6 = a3;
  BOOL v4 = [MEMORY[0x1E4F62B40] messageWithPacker:v5];
  [(FBSServiceFacilityClient *)self sendMessage:v4 withType:22];
}

void __48__SBSSystemServiceClient_setReachabilityActive___block_invoke(uint64_t a1, xpc_object_t xdict)
{
}

- (void)setAmbientPresentationState:(int64_t)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__SBSSystemServiceClient_setAmbientPresentationState___block_invoke;
  v5[3] = &__block_descriptor_40_e33_v16__0__NSObject_OS_xpc_object__8l;
  void v5[4] = a3;
  BOOL v4 = [MEMORY[0x1E4F62B40] messageWithPacker:v5];
  [(FBSServiceFacilityClient *)self sendMessage:v4 withType:24];
}

void __54__SBSSystemServiceClient_setAmbientPresentationState___block_invoke(uint64_t a1, xpc_object_t xdict)
{
}

- (id)acquireAssertionForReachabilityEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F4F768]);
  if ([v5 isUsable])
  {
    BOOL v6 = (void *)MEMORY[0x1E4F62B40];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __65__SBSSystemServiceClient_acquireAssertionForReachabilityEnabled___block_invoke;
    v19[3] = &unk_1E566C920;
    id v7 = v5;
    id v20 = v7;
    BOOL v21 = v3;
    id v8 = [v6 messageWithPacker:v19];
    [(FBSServiceFacilityClient *)self sendMessage:v8 withType:23 replyHandler:&__block_literal_global_36_0 waitForReply:1 timeout:0.0];

    uint64_t v9 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v10 = [v9 bundleIdentifier];
    uint64_t v11 = v10;
    if (v10)
    {
      id v12 = v10;
    }
    else
    {
      int64_t v14 = [MEMORY[0x1E4F28B50] mainBundle];
      id v12 = [v14 bundlePath];
    }
    uint64_t v15 = [NSString stringWithFormat:@"SBSTestAutomationService request from %@", v12];
    int64_t v16 = @"disabled";
    if (v3) {
      int64_t v16 = @"enabled";
    }
    v17 = [NSString stringWithFormat:@"Reachability %@", v16];
    id v13 = [[SBSAssertion alloc] initWithAssertionName:v17 reason:v15 receiveRight:v7];
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

void __65__SBSSystemServiceClient_acquireAssertionForReachabilityEnabled___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = (objc_class *)MEMORY[0x1E4F4F770];
  id v4 = a2;
  id v5 = (id)[[v3 alloc] initFromReceiveRight:*(void *)(a1 + 32)];
  xpc_dictionary_set_BOOL(v4, "enabledState", *(unsigned char *)(a1 + 40));
  BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
}

- (void)resetToHomeScreenAnimated:(BOOL)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__SBSSystemServiceClient_resetToHomeScreenAnimated___block_invoke;
  v5[3] = &__block_descriptor_33_e33_v16__0__NSObject_OS_xpc_object__8l;
  BOOL v6 = a3;
  id v4 = [MEMORY[0x1E4F62B40] messageWithPacker:v5];
  [(FBSServiceFacilityClient *)self sendMessage:v4 withType:25];
}

void __52__SBSSystemServiceClient_resetToHomeScreenAnimated___block_invoke(uint64_t a1, xpc_object_t xdict)
{
}

- (void)setAccessoryType:(int64_t)a3 attached:(BOOL)a4
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__SBSSystemServiceClient_setAccessoryType_attached___block_invoke;
  v6[3] = &__block_descriptor_41_e33_v16__0__NSObject_OS_xpc_object__8l;
  void v6[4] = a3;
  BOOL v7 = a4;
  id v5 = [MEMORY[0x1E4F62B40] messageWithPacker:v6];
  [(FBSServiceFacilityClient *)self sendMessage:v5 withType:26];
}

void __52__SBSSystemServiceClient_setAccessoryType_attached___block_invoke(uint64_t a1, void *a2)
{
  int64_t v3 = *(void *)(a1 + 32);
  xpc_object_t xdict = a2;
  xpc_dictionary_set_int64(xdict, "accessoryType", v3);
  xpc_dictionary_set_BOOL(xdict, "enabledState", *(unsigned char *)(a1 + 40));
}

- (void)setApplicationBundleIdentifier:(id)a3 blockedForScreenTime:(BOOL)a4
{
  id v6 = a3;
  BOOL v7 = (void *)MEMORY[0x1E4F62B40];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __78__SBSSystemServiceClient_setApplicationBundleIdentifier_blockedForScreenTime___block_invoke;
  id v13 = &unk_1E566C920;
  id v14 = v6;
  BOOL v15 = a4;
  id v8 = v6;
  uint64_t v9 = [v7 messageWithPacker:&v10];
  -[FBSServiceFacilityClient sendMessage:withType:](self, "sendMessage:withType:", v9, 28, v10, v11, v12, v13);
}

void __78__SBSSystemServiceClient_setApplicationBundleIdentifier_blockedForScreenTime___block_invoke(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  BSSerializeStringToXPCDictionaryWithKey();
  xpc_dictionary_set_BOOL(xdict, "screenTimeBlocked", *(unsigned char *)(a1 + 40));
}

- (void)setTestRunnerRecoveryApplicationBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F62B40];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __75__SBSSystemServiceClient_setTestRunnerRecoveryApplicationBundleIdentifier___block_invoke;
  v8[3] = &unk_1E566C1C0;
  id v9 = v4;
  id v6 = v4;
  BOOL v7 = [v5 messageWithPacker:v8];
  [(FBSServiceFacilityClient *)self sendMessage:v7 withType:29];
}

uint64_t __75__SBSSystemServiceClient_setTestRunnerRecoveryApplicationBundleIdentifier___block_invoke()
{
  return BSSerializeStringToXPCDictionaryWithKey();
}

- (id)acquireHUDHiddenAssertionForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F4F768]);
  if ([v5 isUsable])
  {
    id v6 = (void *)MEMORY[0x1E4F62B40];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __65__SBSSystemServiceClient_acquireHUDHiddenAssertionForIdentifier___block_invoke;
    v18[3] = &unk_1E566C788;
    id v7 = v5;
    id v19 = v7;
    id v8 = v4;
    id v20 = v8;
    id v9 = [v6 messageWithPacker:v18];
    [(FBSServiceFacilityClient *)self sendMessage:v9 withType:27 replyHandler:&__block_literal_global_51_0 waitForReply:1 timeout:0.0];

    uint64_t v10 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v11 = [v10 bundleIdentifier];
    id v12 = v11;
    if (v11)
    {
      id v13 = v11;
    }
    else
    {
      BOOL v15 = [MEMORY[0x1E4F28B50] mainBundle];
      id v13 = [v15 bundlePath];
    }
    int64_t v16 = [NSString stringWithFormat:@"SBSTestAutomationService request from %@", v13];
    id v14 = [[SBSAssertion alloc] initWithAssertionName:v8 reason:v16 receiveRight:v7];
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

void __65__SBSSystemServiceClient_acquireHUDHiddenAssertionForIdentifier___block_invoke(uint64_t a1, void *a2)
{
  int64_t v3 = (objc_class *)MEMORY[0x1E4F4F770];
  id v4 = a2;
  id v5 = (id)[[v3 alloc] initFromReceiveRight:*(void *)(a1 + 32)];
  BSSerializeStringToXPCDictionaryWithKey();
  BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
}

- (void)countScenesForBundleIdentifier:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1E4F62B40];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __72__SBSSystemServiceClient_countScenesForBundleIdentifier_withCompletion___block_invoke;
  v14[3] = &unk_1E566C1C0;
  id v15 = v6;
  id v9 = v6;
  uint64_t v10 = [v8 messageWithPacker:v14];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __72__SBSSystemServiceClient_countScenesForBundleIdentifier_withCompletion___block_invoke_2;
  v12[3] = &unk_1E566C0B8;
  id v13 = v7;
  id v11 = v7;
  [(FBSServiceFacilityClient *)self sendMessage:v10 withType:30 replyHandler:v12 waitForReply:0 timeout:0.0];
}

uint64_t __72__SBSSystemServiceClient_countScenesForBundleIdentifier_withCompletion___block_invoke()
{
  return BSSerializeStringToXPCDictionaryWithKey();
}

void __72__SBSSystemServiceClient_countScenesForBundleIdentifier_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  xpc_object_t xdict = [a2 payload];
  if (xdict && MEMORY[0x192FC1100]() == MEMORY[0x1E4F14590]) {
    xpc_dictionary_get_int64(xdict, "sceneCount");
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)stashSwitcherModelToPath:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F62B40];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__SBSSystemServiceClient_stashSwitcherModelToPath___block_invoke;
  v8[3] = &unk_1E566C1C0;
  id v9 = v4;
  id v6 = v4;
  id v7 = [v5 messageWithPacker:v8];
  [(FBSServiceFacilityClient *)self sendMessage:v7 withType:31];
}

uint64_t __51__SBSSystemServiceClient_stashSwitcherModelToPath___block_invoke()
{
  return BSSerializeStringToXPCDictionaryWithKey();
}

- (void)loadStashedSwitcherModelFromPath:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F62B40];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__SBSSystemServiceClient_loadStashedSwitcherModelFromPath___block_invoke;
  v8[3] = &unk_1E566C1C0;
  id v9 = v4;
  id v6 = v4;
  id v7 = [v5 messageWithPacker:v8];
  [(FBSServiceFacilityClient *)self sendMessage:v7 withType:32];
}

uint64_t __59__SBSSystemServiceClient_loadStashedSwitcherModelFromPath___block_invoke()
{
  return BSSerializeStringToXPCDictionaryWithKey();
}

- (void)addWidgetsToEachPage
{
  id v3 = [MEMORY[0x1E4F62B40] message];
  [(FBSServiceFacilityClient *)self sendMessage:v3 withType:33 replyHandler:&__block_literal_global_53 waitForReply:1 timeout:0.0];
}

- (void)addWidgetWithIdentifier:(id)a3 toPage:(int)a4 withSizing:(int)a5
{
  id v8 = a3;
  id v9 = (void *)MEMORY[0x1E4F62B40];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  id v14 = __68__SBSSystemServiceClient_addWidgetWithIdentifier_toPage_withSizing___block_invoke;
  id v15 = &unk_1E566C170;
  id v16 = v8;
  int v17 = a4;
  int v18 = a5;
  id v10 = v8;
  id v11 = [v9 messageWithPacker:&v12];
  -[FBSServiceFacilityClient sendMessage:withType:replyHandler:waitForReply:timeout:](self, "sendMessage:withType:replyHandler:waitForReply:timeout:", v11, 34, &__block_literal_global_55, 1, 0.0, v12, v13, v14, v15);
}

void __68__SBSSystemServiceClient_addWidgetWithIdentifier_toPage_withSizing___block_invoke(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  BSSerializeStringToXPCDictionaryWithKey();
  xpc_dictionary_set_int64(xdict, "pageInteger", *(int *)(a1 + 40));
  xpc_dictionary_set_int64(xdict, "sizeInteger", *(int *)(a1 + 44));
}

- (void)addWidgetStackWithIdentifiers:(id)a3 toPage:(int)a4 withSizing:(int)a5
{
  id v8 = a3;
  id v9 = (void *)MEMORY[0x1E4F62B40];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  id v14 = __74__SBSSystemServiceClient_addWidgetStackWithIdentifiers_toPage_withSizing___block_invoke;
  id v15 = &unk_1E566C170;
  id v16 = v8;
  int v17 = a4;
  int v18 = a5;
  id v10 = v8;
  id v11 = [v9 messageWithPacker:&v12];
  -[FBSServiceFacilityClient sendMessage:withType:replyHandler:waitForReply:timeout:](self, "sendMessage:withType:replyHandler:waitForReply:timeout:", v11, 35, &__block_literal_global_60_0, 1, 0.0, v12, v13, v14, v15);
}

void __74__SBSSystemServiceClient_addWidgetStackWithIdentifiers_toPage_withSizing___block_invoke(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  BSSerializeArrayToXPCDictionaryWithKey();
  xpc_dictionary_set_int64(xdict, "pageInteger", *(int *)(a1 + 40));
  xpc_dictionary_set_int64(xdict, "sizeInteger", *(int *)(a1 + 44));
}

id __74__SBSSystemServiceClient_addWidgetStackWithIdentifiers_toPage_withSizing___block_invoke_2(int a1, id a2)
{
  xpc_object_t v2 = xpc_string_create((const char *)[a2 UTF8String]);
  return v2;
}

- (void)enterLostMode
{
  id v3 = [MEMORY[0x1E4F62B40] message];
  [(FBSServiceFacilityClient *)self sendMessage:v3 withType:36];
}

- (void)exitLostMode
{
  id v3 = [MEMORY[0x1E4F62B40] message];
  [(FBSServiceFacilityClient *)self sendMessage:v3 withType:37];
}

- (BOOL)isChamoisWindowingUIEnabled
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  id v3 = [MEMORY[0x1E4F62B40] message];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__SBSSystemServiceClient_isChamoisWindowingUIEnabled__block_invoke;
  v5[3] = &unk_1E566C148;
  void v5[4] = &v6;
  [(FBSServiceFacilityClient *)self sendMessage:v3 withType:38 replyHandler:v5 waitForReply:1 timeout:10.0];

  LOBYTE(self) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)self;
}

void __53__SBSSystemServiceClient_isChamoisWindowingUIEnabled__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 payload];
  if (v3)
  {
    xpc_object_t xdict = v3;
    BOOL v4 = MEMORY[0x192FC1100]() == MEMORY[0x1E4F14590];
    id v3 = xdict;
    if (v4)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = xpc_dictionary_get_BOOL(xdict, "enabledState");
      id v3 = xdict;
    }
  }
}

- (void)setChamoisWindowingUIEnabled:(BOOL)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__SBSSystemServiceClient_setChamoisWindowingUIEnabled___block_invoke;
  v5[3] = &__block_descriptor_33_e33_v16__0__NSObject_OS_xpc_object__8l;
  BOOL v6 = a3;
  BOOL v4 = [MEMORY[0x1E4F62B40] messageWithPacker:v5];
  [(FBSServiceFacilityClient *)self sendMessage:v4 withType:39 replyHandler:&__block_literal_global_62 waitForReply:1 timeout:10.0];
}

void __55__SBSSystemServiceClient_setChamoisWindowingUIEnabled___block_invoke(uint64_t a1, xpc_object_t xdict)
{
}

- (BOOL)chamoisPrefersDockHidden
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  id v3 = [MEMORY[0x1E4F62B40] message];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__SBSSystemServiceClient_chamoisPrefersDockHidden__block_invoke;
  v5[3] = &unk_1E566C148;
  void v5[4] = &v6;
  [(FBSServiceFacilityClient *)self sendMessage:v3 withType:40 replyHandler:v5 waitForReply:1 timeout:10.0];

  LOBYTE(self) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)self;
}

void __50__SBSSystemServiceClient_chamoisPrefersDockHidden__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 payload];
  if (v3)
  {
    xpc_object_t xdict = v3;
    BOOL v4 = MEMORY[0x192FC1100]() == MEMORY[0x1E4F14590];
    id v3 = xdict;
    if (v4)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = xpc_dictionary_get_BOOL(xdict, "enabledState");
      id v3 = xdict;
    }
  }
}

- (void)setChamoisPrefersDockHidden:(BOOL)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__SBSSystemServiceClient_setChamoisPrefersDockHidden___block_invoke;
  v5[3] = &__block_descriptor_33_e33_v16__0__NSObject_OS_xpc_object__8l;
  BOOL v6 = a3;
  BOOL v4 = [MEMORY[0x1E4F62B40] messageWithPacker:v5];
  [(FBSServiceFacilityClient *)self sendMessage:v4 withType:41 replyHandler:&__block_literal_global_64 waitForReply:1 timeout:10.0];
}

void __54__SBSSystemServiceClient_setChamoisPrefersDockHidden___block_invoke(uint64_t a1, xpc_object_t xdict)
{
}

- (BOOL)chamoisPrefersStripHidden
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  id v3 = [MEMORY[0x1E4F62B40] message];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__SBSSystemServiceClient_chamoisPrefersStripHidden__block_invoke;
  v5[3] = &unk_1E566C148;
  void v5[4] = &v6;
  [(FBSServiceFacilityClient *)self sendMessage:v3 withType:42 replyHandler:v5 waitForReply:1 timeout:10.0];

  LOBYTE(self) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)self;
}

void __51__SBSSystemServiceClient_chamoisPrefersStripHidden__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 payload];
  if (v3)
  {
    xpc_object_t xdict = v3;
    BOOL v4 = MEMORY[0x192FC1100]() == MEMORY[0x1E4F14590];
    id v3 = xdict;
    if (v4)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = xpc_dictionary_get_BOOL(xdict, "enabledState");
      id v3 = xdict;
    }
  }
}

- (void)setChamoisHideStripsEnabled:(BOOL)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__SBSSystemServiceClient_setChamoisHideStripsEnabled___block_invoke;
  v5[3] = &__block_descriptor_33_e33_v16__0__NSObject_OS_xpc_object__8l;
  BOOL v6 = a3;
  BOOL v4 = [MEMORY[0x1E4F62B40] messageWithPacker:v5];
  [(FBSServiceFacilityClient *)self sendMessage:v4 withType:43 replyHandler:&__block_literal_global_66_0 waitForReply:1 timeout:10.0];
}

void __54__SBSSystemServiceClient_setChamoisHideStripsEnabled___block_invoke(uint64_t a1, xpc_object_t xdict)
{
}

- (BOOL)deviceSupportsSystemAperture
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  id v3 = [MEMORY[0x1E4F62B40] message];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__SBSSystemServiceClient_deviceSupportsSystemAperture__block_invoke;
  v5[3] = &unk_1E566C148;
  void v5[4] = &v6;
  [(FBSServiceFacilityClient *)self sendMessage:v3 withType:45 replyHandler:v5 waitForReply:1 timeout:0.0];

  LOBYTE(self) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)self;
}

void __54__SBSSystemServiceClient_deviceSupportsSystemAperture__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [v5 payload];
  if (v3)
  {
    BOOL v4 = [v5 payload];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = xpc_dictionary_get_BOOL(v4, "deviceSupportsSystemAperture");
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  }
}

- (void)setSpringBoardAnimationFrameRecordingEnabledForUpdateTypes:(unint64_t)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __85__SBSSystemServiceClient_setSpringBoardAnimationFrameRecordingEnabledForUpdateTypes___block_invoke;
  v5[3] = &__block_descriptor_40_e33_v16__0__NSObject_OS_xpc_object__8l;
  void v5[4] = a3;
  BOOL v4 = [MEMORY[0x1E4F62B40] messageWithPacker:v5];
  [(FBSServiceFacilityClient *)self sendMessage:v4 withType:48 replyHandler:&__block_literal_global_68 waitForReply:1 timeout:10.0];
}

void __85__SBSSystemServiceClient_setSpringBoardAnimationFrameRecordingEnabledForUpdateTypes___block_invoke(uint64_t a1, xpc_object_t xdict)
{
}

- (void)setSystemApertureUnderAutomationTesting:(BOOL)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __66__SBSSystemServiceClient_setSystemApertureUnderAutomationTesting___block_invoke;
  v5[3] = &__block_descriptor_33_e33_v16__0__NSObject_OS_xpc_object__8l;
  BOOL v6 = a3;
  BOOL v4 = [MEMORY[0x1E4F62B40] messageWithPacker:v5];
  [(FBSServiceFacilityClient *)self sendMessage:v4 withType:50 replyHandler:&__block_literal_global_70 waitForReply:1 timeout:0.0];
}

void __66__SBSSystemServiceClient_setSystemApertureUnderAutomationTesting___block_invoke(uint64_t a1, xpc_object_t xdict)
{
}

- (NSMutableDictionary)animationFrameRecordings
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__0;
  id v11 = __Block_byref_object_dispose__0;
  id v12 = (id)objc_opt_new();
  id v3 = [MEMORY[0x1E4F62B40] message];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__SBSSystemServiceClient_animationFrameRecordings__block_invoke;
  v6[3] = &unk_1E566C148;
  void v6[4] = &v7;
  [(FBSServiceFacilityClient *)self sendMessage:v3 withType:49 replyHandler:v6 waitForReply:1 timeout:0.0];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSMutableDictionary *)v4;
}

void __50__SBSSystemServiceClient_animationFrameRecordings__block_invoke(uint64_t a1, void *a2)
{
  v13[4] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a2 payload];
  id v4 = (void *)v3;
  if (v3 && MEMORY[0x192FC1100](v3) == MEMORY[0x1E4F14590])
  {
    id v5 = BSDeserializeDataFromXPCDictionaryWithKey();
    BOOL v6 = (void *)MEMORY[0x1E4F28DC0];
    uint64_t v7 = (void *)MEMORY[0x1E4F1CAD0];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    v13[2] = objc_opt_class();
    v13[3] = objc_opt_class();
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:4];
    uint64_t v9 = [v7 setWithArray:v8];
    uint64_t v10 = [v6 unarchivedObjectOfClasses:v9 fromData:v5 error:0];
    uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
}

- (NSArray)systemApertureStateDump
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__0;
  uint64_t v11 = __Block_byref_object_dispose__0;
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v3 = [MEMORY[0x1E4F62B40] message];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__SBSSystemServiceClient_systemApertureStateDump__block_invoke;
  v6[3] = &unk_1E566C148;
  void v6[4] = &v7;
  [(FBSServiceFacilityClient *)self sendMessage:v3 withType:46 replyHandler:v6 waitForReply:1 timeout:0.0];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __49__SBSSystemServiceClient_systemApertureStateDump__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 payload];
  id v4 = (void *)v3;
  if (v3 && MEMORY[0x192FC1100](v3) == MEMORY[0x1E4F14590])
  {
    id v5 = [NSString stringWithFormat:@"%s", "systemApertureElementClientIdentifier"];
    BOOL v6 = [NSString stringWithFormat:@"%s", "systemApertureElementIdentifier"];
    [NSString stringWithFormat:@"%s", "systemApertureElementViewLayoutMode"];
    uint64_t v13 = v5;
    v15 = id v14 = v6;
    id v7 = v15;
    id v8 = v6;
    id v9 = v5;
    uint64_t v10 = BSCreateDeserializedArrayFromXPCDictionaryWithKey();
    uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
}

id __49__SBSSystemServiceClient_systemApertureStateDump__block_invoke_2(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (v3 && MEMORY[0x192FC1100](v3) == MEMORY[0x1E4F14590])
  {
    id v5 = BSDeserializeStringFromXPCDictionaryWithKey();
    [v4 setValue:v5 forKey:a1[4]];

    BOOL v6 = BSDeserializeStringFromXPCDictionaryWithKey();
    [v4 setValue:v6 forKey:a1[5]];

    id v7 = BSDeserializeStringFromXPCDictionaryWithKey();
    [v4 setValue:v7 forKey:a1[6]];
  }
  return v4;
}

- (NSMutableArray)systemApertureModelStateDump
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__0;
  uint64_t v11 = __Block_byref_object_dispose__0;
  id v12 = (id)objc_opt_new();
  id v3 = [MEMORY[0x1E4F62B40] message];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__SBSSystemServiceClient_systemApertureModelStateDump__block_invoke;
  v6[3] = &unk_1E566C148;
  void v6[4] = &v7;
  [(FBSServiceFacilityClient *)self sendMessage:v3 withType:51 replyHandler:v6 waitForReply:1 timeout:0.0];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSMutableArray *)v4;
}

void __54__SBSSystemServiceClient_systemApertureModelStateDump__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 payload];
  if (v3)
  {
    id v9 = v3;
    BOOL v4 = MEMORY[0x192FC1100]() == MEMORY[0x1E4F14590];
    id v3 = v9;
    if (v4)
    {
      id v5 = BSDeserializeDataFromXPCDictionaryWithKey();
      uint64_t v6 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v5 options:4 error:0];
      uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
      id v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v6;

      id v3 = v9;
    }
  }
}

- (NSDictionary)widgetControllerStateDump
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__0;
  uint64_t v11 = __Block_byref_object_dispose__0;
  id v12 = (id)objc_opt_new();
  id v3 = [MEMORY[0x1E4F62B40] message];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__SBSSystemServiceClient_widgetControllerStateDump__block_invoke;
  v6[3] = &unk_1E566C148;
  void v6[4] = &v7;
  [(FBSServiceFacilityClient *)self sendMessage:v3 withType:47 replyHandler:v6 waitForReply:1 timeout:0.0];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

void __51__SBSSystemServiceClient_widgetControllerStateDump__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 payload];
  if (v3)
  {
    id v9 = v3;
    BOOL v4 = MEMORY[0x192FC1100]() == MEMORY[0x1E4F14590];
    id v3 = v9;
    if (v4)
    {
      id v5 = BSDeserializeDataFromXPCDictionaryWithKey();
      uint64_t v6 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v5 options:4 error:0];
      uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
      id v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v6;

      id v3 = v9;
    }
  }
}

- (id)deserializedStringArrayForKey:(const char *)a3 fromPayload:(id)a4
{
  BOOL v4 = (void *)BSCreateDeserializedArrayFromXPCDictionaryWithKey();
  return v4;
}

__CFString *__68__SBSSystemServiceClient_deserializedStringArrayForKey_fromPayload___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = v2;
  if (v2 && MEMORY[0x192FC1100](v2) == MEMORY[0x1E4F145F0])
  {
    BOOL v4 = [NSString stringWithUTF8String:xpc_string_get_string_ptr(v3)];
  }
  else
  {
    BOOL v4 = &stru_1EDF30888;
  }

  return v4;
}

- (void)requestSystemApertureStateDumpWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F62B40] message];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__SBSSystemServiceClient_requestSystemApertureStateDumpWithCompletion___block_invoke;
  v7[3] = &unk_1E566C0B8;
  id v8 = v4;
  id v6 = v4;
  [(FBSServiceFacilityClient *)self sendMessage:v5 withType:53 replyHandler:v7 waitForReply:0 timeout:0.0];
}

void __71__SBSSystemServiceClient_requestSystemApertureStateDumpWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  xpc_object_t xdict = [a2 payload];
  if (xdict && MEMORY[0x192FC1100]() == MEMORY[0x1E4F14590])
  {
    string = (char *)xpc_dictionary_get_string(xdict, "requestSystemApertureStateDump");
    id v4 = (char *)xpc_dictionary_get_string(xdict, "systemApertureErrorDescription");
    if (string) {
      string = (char *)[[NSString alloc] initWithUTF8String:string];
    }
    if (v4) {
      id v4 = (char *)[[NSString alloc] initWithUTF8String:v4];
    }
  }
  else
  {
    string = 0;
    id v4 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)writeSystemApertureStateDumpToTextFileAtPath:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F62B40];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __71__SBSSystemServiceClient_writeSystemApertureStateDumpToTextFileAtPath___block_invoke;
  v8[3] = &unk_1E566C1C0;
  id v9 = v4;
  id v6 = v4;
  uint64_t v7 = [v5 messageWithPacker:v8];
  [(FBSServiceFacilityClient *)self sendMessage:v7 withType:52 replyHandler:&__block_literal_global_89 waitForReply:1 timeout:0.0];
}

void __71__SBSSystemServiceClient_writeSystemApertureStateDumpToTextFileAtPath___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  if (v2)
  {
    id v4 = v2;
    xpc_object_t xdict = a2;
    xpc_dictionary_set_string(xdict, "stateDumpTextFilePath", (const char *)[v4 UTF8String]);
  }
}

- (void)requestStateDump:(unint64_t)a3 withCompletion:(id)a4
{
  id v6 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __58__SBSSystemServiceClient_requestStateDump_withCompletion___block_invoke;
  v11[3] = &__block_descriptor_40_e33_v16__0__NSObject_OS_xpc_object__8l;
  void v11[4] = a3;
  uint64_t v7 = [MEMORY[0x1E4F62B40] messageWithPacker:v11];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__SBSSystemServiceClient_requestStateDump_withCompletion___block_invoke_2;
  v9[3] = &unk_1E566C0B8;
  id v10 = v6;
  id v8 = v6;
  [(FBSServiceFacilityClient *)self sendMessage:v7 withType:54 replyHandler:v9 waitForReply:0 timeout:0.0];
}

void __58__SBSSystemServiceClient_requestStateDump_withCompletion___block_invoke(uint64_t a1, xpc_object_t xdict)
{
}

void __58__SBSSystemServiceClient_requestStateDump_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  xpc_object_t xdict = [a2 payload];
  if (!xdict || MEMORY[0x192FC1100]() != MEMORY[0x1E4F14590])
  {
    id v3 = 0;
LABEL_4:
    id v4 = @"Error, corrupted XPC payload.";
    goto LABEL_5;
  }
  xpc_dictionary_get_BOOL(xdict, "stateDumpSuccess");
  id v3 = [[NSString alloc] initWithUTF8String:xpc_dictionary_get_string(xdict, "stateData")];
  string = xpc_dictionary_get_string(xdict, "stateDumpSuccessDescription");
  if (!string) {
    goto LABEL_4;
  }
  id v4 = (__CFString *)[[NSString alloc] initWithUTF8String:string];
LABEL_5:
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)writeStateDump:(unint64_t)a3 toTextFileAtPath:(id)a4
{
  id v6 = a4;
  uint64_t v7 = (void *)MEMORY[0x1E4F62B40];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __58__SBSSystemServiceClient_writeStateDump_toTextFileAtPath___block_invoke;
  uint64_t v13 = &unk_1E566C170;
  id v14 = v6;
  unint64_t v15 = a3;
  id v8 = v6;
  id v9 = [v7 messageWithPacker:&v10];
  -[FBSServiceFacilityClient sendMessage:withType:replyHandler:waitForReply:timeout:](self, "sendMessage:withType:replyHandler:waitForReply:timeout:", v9, 55, &__block_literal_global_94_0, 1, 0.0, v10, v11, v12, v13);
}

void __58__SBSSystemServiceClient_writeStateDump_toTextFileAtPath___block_invoke(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  xpc_dictionary_set_uint64(xdict, "stateDumpType", *(void *)(a1 + 40));
  id v3 = *(void **)(a1 + 32);
  if (v3) {
    xpc_dictionary_set_string(xdict, "stateDumpTextFilePath", (const char *)[v3 UTF8String]);
  }
}

- (void)enableRemoteStateDumpWithTimeout:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __70__SBSSystemServiceClient_enableRemoteStateDumpWithTimeout_completion___block_invoke;
  v11[3] = &__block_descriptor_40_e33_v16__0__NSObject_OS_xpc_object__8l;
  void v11[4] = a3;
  uint64_t v7 = [MEMORY[0x1E4F62B40] messageWithPacker:v11];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __70__SBSSystemServiceClient_enableRemoteStateDumpWithTimeout_completion___block_invoke_2;
  v9[3] = &unk_1E566C0B8;
  id v10 = v6;
  id v8 = v6;
  [(FBSServiceFacilityClient *)self sendMessage:v7 withType:56 replyHandler:v9 waitForReply:0 timeout:0.0];
}

void __70__SBSSystemServiceClient_enableRemoteStateDumpWithTimeout_completion___block_invoke(uint64_t a1, xpc_object_t xdict)
{
}

void __70__SBSSystemServiceClient_enableRemoteStateDumpWithTimeout_completion___block_invoke_2(uint64_t a1, void *a2)
{
  xpc_object_t xdict = [a2 payload];
  if (xdict
    && MEMORY[0x192FC1100]() == MEMORY[0x1E4F14590]
    && (xpc_dictionary_get_BOOL(xdict, "stateDumpSuccess"),
        (string = xpc_dictionary_get_string(xdict, "stateDumpSuccessDescription")) != 0))
  {
    id v3 = (__CFString *)[[NSString alloc] initWithUTF8String:string];
  }
  else
  {
    id v3 = @"Error, corrupted XPC payload.";
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)disableRemoteStateDumpWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F62B40] message];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__SBSSystemServiceClient_disableRemoteStateDumpWithCompletion___block_invoke;
  v7[3] = &unk_1E566C0B8;
  id v8 = v4;
  id v6 = v4;
  [(FBSServiceFacilityClient *)self sendMessage:v5 withType:57 replyHandler:v7 waitForReply:0 timeout:0.0];
}

void __63__SBSSystemServiceClient_disableRemoteStateDumpWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  xpc_object_t xdict = [a2 payload];
  if (xdict
    && MEMORY[0x192FC1100]() == MEMORY[0x1E4F14590]
    && (xpc_dictionary_get_BOOL(xdict, "stateDumpSuccess"),
        (string = xpc_dictionary_get_string(xdict, "stateDumpSuccessDescription")) != 0))
  {
    id v3 = (__CFString *)[[NSString alloc] initWithUTF8String:string];
  }
  else
  {
    id v3 = @"Error, corrupted XPC payload.";
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)handleMessage:(id)a3 withType:(int64_t)a4
{
  if (!a4) {
    [(SBSSystemServiceClient *)self _handleButtonEventConsumePressMessage:a3];
  }
}

- (void)setChamoisPrefersStripHidden:(BOOL)a3
{
  self->_chamoisPrefersStripHidden = a3;
}

- (BOOL)systemApertureUnderAutomationTesting
{
  return self->_systemApertureUnderAutomationTesting;
}

@end
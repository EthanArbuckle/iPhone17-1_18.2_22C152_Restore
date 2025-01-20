@interface SBHIDEventDispatchController
+ (id)sharedInstance;
+ (id)symbolicDeferringTokenForKeyboardFocus;
+ (id)symbolicDeferringTokenForSystemGesturesInDisplayConfiguration:(id)a3;
+ (id)symbolicDeferringTokenForSystemGesturesOnMainDisplay;
- (SBHIDEventDispatchController)init;
- (id)_keyCommandDispatchingRule;
- (id)configureDispatchRootsForChamoisDisplay:(id)a3;
- (id)configureDispatchRootsForContinuityDisplay:(id)a3;
- (id)dispatchKeyboardUsagesToSystemEnvironment:(id)a3 reason:(id)a4;
- (void)_resetMainDeliveryRoot;
@end

@implementation SBHIDEventDispatchController

+ (id)symbolicDeferringTokenForKeyboardFocus
{
  if (symbolicDeferringTokenForKeyboardFocus_onceToken != -1) {
    dispatch_once(&symbolicDeferringTokenForKeyboardFocus_onceToken, &__block_literal_global_282);
  }
  v2 = (void *)symbolicDeferringTokenForKeyboardFocus_token;
  return v2;
}

void __70__SBHIDEventDispatchController_symbolicDeferringTokenForKeyboardFocus__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F4F290] tokenForString:@"SBKeyboardFocus"];
  v1 = (void *)symbolicDeferringTokenForKeyboardFocus_token;
  symbolicDeferringTokenForKeyboardFocus_token = v0;
}

+ (id)symbolicDeferringTokenForSystemGesturesInDisplayConfiguration:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && ![v4 isMainDisplay])
  {
    v7 = (void *)MEMORY[0x1E4F4F290];
    v8 = [v5 hardwareIdentifier];
    v9 = [@"SBExternalDisplaySystemGestures-" stringByAppendingString:v8];
    v6 = [v7 tokenForString:v9];
  }
  else
  {
    v6 = [a1 symbolicDeferringTokenForSystemGesturesOnMainDisplay];
  }

  return v6;
}

+ (id)symbolicDeferringTokenForSystemGesturesOnMainDisplay
{
  if (symbolicDeferringTokenForSystemGesturesOnMainDisplay_onceToken != -1) {
    dispatch_once(&symbolicDeferringTokenForSystemGesturesOnMainDisplay_onceToken, &__block_literal_global_15_1);
  }
  v2 = (void *)symbolicDeferringTokenForSystemGesturesOnMainDisplay_token;
  return v2;
}

void __84__SBHIDEventDispatchController_symbolicDeferringTokenForSystemGesturesOnMainDisplay__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F4F290] tokenForString:@"SBMainSystemGestures"];
  v1 = (void *)symbolicDeferringTokenForSystemGesturesOnMainDisplay_token;
  symbolicDeferringTokenForSystemGesturesOnMainDisplay_token = v0;
}

- (id)_keyCommandDispatchingRule
{
  v11[3] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F4F2C8];
  id v4 = objc_msgSend(MEMORY[0x1E4FA6B10], "systemKeyCommandOverlayEnvironment", self->_mainSystemDispatchingTarget);
  v5 = [v3 targetForDeferringEnvironment:v4];
  keyboardFocusDispatchingTarget = self->_keyboardFocusDispatchingTarget;
  v11[1] = v5;
  v11[2] = keyboardFocusDispatchingTarget;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:3];

  v8 = (void *)[MEMORY[0x1E4F4F378] new];
  [v8 setDisplays:0];
  v9 = [MEMORY[0x1E4F4F2E8] ruleForDispatchingKeyCommandsMatchingPredicate:v8 toTargets:v7];

  return v9;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_41 != -1) {
    dispatch_once(&sharedInstance_onceToken_41, &__block_literal_global_25_0);
  }
  v2 = (void *)sharedInstance_controller;
  return v2;
}

void __46__SBHIDEventDispatchController_sharedInstance__block_invoke()
{
  uint64_t v0 = objc_alloc_init(SBHIDEventDispatchController);
  v1 = (void *)sharedInstance_controller;
  sharedInstance_controller = (uint64_t)v0;
}

- (SBHIDEventDispatchController)init
{
  v103[10] = *MEMORY[0x1E4F143B8];
  v100.receiver = self;
  v100.super_class = (Class)SBHIDEventDispatchController;
  v2 = [(SBHIDEventDispatchController *)&v100 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F4F2A0] sharedInstance];
    deliveryManager = v2->_deliveryManager;
    v2->_deliveryManager = (BKSHIDEventDeliveryManager *)v3;

    v5 = (void *)MEMORY[0x1E4F4F2C8];
    v6 = +[SBHIDEventDispatchController symbolicDeferringTokenForSystemGesturesOnMainDisplay];
    uint64_t v7 = [v5 systemTargetWithDeferringToken:v6];
    mainSystemDispatchingTarget = v2->_mainSystemDispatchingTarget;
    v2->_mainSystemDispatchingTarget = (BKSHIDEventDispatchingTarget *)v7;

    v9 = (void *)MEMORY[0x1E4F4F2C8];
    v10 = +[SBHIDEventDispatchController symbolicDeferringTokenForKeyboardFocus];
    uint64_t v11 = [v9 keyboardFocusTargetWithDeferringToken:v10];
    keyboardFocusDispatchingTarget = v2->_keyboardFocusDispatchingTarget;
    v2->_keyboardFocusDispatchingTarget = (BKSHIDEventDispatchingTarget *)v11;

    v13 = v2->_mainSystemDispatchingTarget;
    v14 = (void *)MEMORY[0x1E4F4F2C8];
    v15 = (void *)MEMORY[0x1E4F4F280];
    v94 = v2->_keyboardFocusDispatchingTarget;
    v16 = v13;
    v17 = objc_msgSend(v15, "ui_cameraCaptureButtonEnvironment");
    v90 = [v14 targetForDeferringEnvironment:v17];

    id v18 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v19 = [MEMORY[0x1E4F4F2F0] descriptorWithPage:12 usage:179];
    [v18 addObject:v19];

    v20 = [MEMORY[0x1E4F4F2F0] descriptorWithPage:12 usage:226];
    [v18 addObject:v20];

    v21 = [MEMORY[0x1E4F4F2F0] descriptorWithPage:12 usage:177];
    [v18 addObject:v21];

    v22 = [MEMORY[0x1E4F4F2F0] descriptorWithPage:12 usage:176];
    [v18 addObject:v22];

    v23 = [MEMORY[0x1E4F4F2F0] descriptorWithPage:12 usage:205];
    [v18 addObject:v23];

    v24 = [MEMORY[0x1E4F4F2F0] descriptorWithPage:12 usage:185];
    [v18 addObject:v24];

    v25 = [MEMORY[0x1E4F4F2F0] descriptorWithPage:12 usage:188];
    [v18 addObject:v25];

    v26 = [MEMORY[0x1E4F4F2F0] descriptorWithPage:12 usage:180];
    [v18 addObject:v26];

    v27 = [MEMORY[0x1E4F4F2F0] descriptorWithPage:12 usage:181];
    [v18 addObject:v27];

    v28 = [MEMORY[0x1E4F4F2F0] descriptorWithPage:12 usage:182];
    [v18 addObject:v28];

    v29 = [MEMORY[0x1E4F4F2F0] descriptorWithPage:12 usage:183];
    [v18 addObject:v29];

    v30 = [MEMORY[0x1E4F4F2F0] descriptorWithPage:12 usage:203];
    [v18 addObject:v30];

    v31 = [MEMORY[0x1E4F4F2F0] descriptorWithPage:12 usage:202];
    [v18 addObject:v31];

    v32 = [MEMORY[0x1E4F4F2F0] descriptorWithPage:12 usage:190];
    [v18 addObject:v32];

    v92 = _SBHIDDispatchPredicateFromAnyService(v18);

    v99 = [MEMORY[0x1E4F4F2C0] ruleForDispatchingDiscreteEventsMatchingPredicate:v92 toTarget:v16];
    v33 = (void *)MEMORY[0x1E4F1CAD0];
    v34 = [MEMORY[0x1E4F4F2F0] descriptorWithPage:12 usage:547];
    v35 = [v33 setWithObject:v34];

    v91 = _SBHIDDispatchPredicateFromHardwareType(v35, 4);

    v98 = [MEMORY[0x1E4F4F2C0] ruleForDispatchingDiscreteEventsMatchingPredicate:v91 toTarget:v94];
    v36 = (void *)MEMORY[0x1E4F1CAD0];
    v37 = [MEMORY[0x1E4F4F2B0] descriptorWithEventType:42];
    v38 = [v36 setWithObject:v37];

    v89 = _SBHIDDispatchPredicateFromAnyService(v38);

    v97 = [MEMORY[0x1E4F4F2C0] ruleForDispatchingDiscreteEventsMatchingPredicate:v89 toTarget:v16];
    v82 = [MEMORY[0x1E4F4F2C0] ruleForDispatchingDiscreteEventsMatchingPredicate:v89 toTarget:v90];
    v39 = (void *)MEMORY[0x1E4F1CAD0];
    v40 = [MEMORY[0x1E4F4F2D8] descriptorWithGenericGestureType:5];
    v41 = [v39 setWithObject:v40];

    v88 = _SBHIDDispatchPredicateFromAnyService(v41);

    v96 = [MEMORY[0x1E4F4F2C0] ruleForDispatchingDiscreteEventsMatchingPredicate:v88 toTarget:v16];
    v42 = (void *)MEMORY[0x1E4F1CAD0];
    v43 = [MEMORY[0x1E4F4F2F0] descriptorWithPage:11 usage:47];
    v44 = [v42 setWithObject:v43];

    v87 = _SBHIDDispatchPredicateFromAnyService(v44);

    v95 = [MEMORY[0x1E4F4F2C0] ruleForDispatchingDiscreteEventsMatchingPredicate:v87 toTarget:v16];
    v86 = _SBHIDTrackpadPredicate();
    v45 = v16;
    v93 = [MEMORY[0x1E4F4F2C0] ruleForDispatchingDiscreteEventsMatchingPredicate:v86 toTarget:v16];
    v46 = (void *)MEMORY[0x1E4F1CAD0];
    v47 = [MEMORY[0x1E4F4F2D0] builtinDisplay];
    v48 = [MEMORY[0x1E4F4F2D0] nullDisplay];
    v85 = objc_msgSend(v46, "setWithObjects:", v47, v48, 0);

    uint64_t v49 = _SBHIDSendersForDisplays(v85);
    [MEMORY[0x1E4F4F370] defaultSystemPredicate];
    v84 = v83 = (void *)v49;
    [v84 setSenderDescriptors:v49];
    v79 = [MEMORY[0x1E4F4F2C0] ruleForDispatchingDiscreteEventsMatchingPredicate:v84 toTarget:v45];
    v81 = [MEMORY[0x1E4F4F370] defaultFocusPredicate];
    [v81 setSenderDescriptors:v49];
    v78 = [MEMORY[0x1E4F4F2C0] ruleForDispatchingDiscreteEventsMatchingPredicate:v81 toTarget:v94];
    v50 = (void *)MEMORY[0x1E4F1CAD0];
    v51 = [MEMORY[0x1E4F4F2B0] descriptorWithEventType:16];
    v52 = [v50 setWithObject:v51];

    v80 = _SBHIDDispatchPredicateFromHardwareType(v52, 1);

    v77 = [MEMORY[0x1E4F4F2C0] ruleForDispatchingDiscreteEventsMatchingPredicate:v80 toTarget:v45];
    v53 = (void *)MEMORY[0x1E4F1CAD0];
    v54 = [MEMORY[0x1E4F4F310] descriptorWithPage:65280 usage:89];
    v55 = [v53 setWithObject:v54];

    v56 = _SBHIDDispatchPredicateFromHardwareType(v55, 1);

    v57 = [MEMORY[0x1E4F4F2C0] ruleForDispatchingDiscreteEventsMatchingPredicate:v56 toTarget:v45];
    v103[0] = v95;
    v103[1] = v93;
    v103[2] = v99;
    v103[3] = v98;
    v103[4] = v96;
    v103[5] = v97;
    v103[6] = v79;
    v103[7] = v78;
    v103[8] = v77;
    v103[9] = v57;
    uint64_t v58 = [MEMORY[0x1E4F1C978] arrayWithObjects:v103 count:10];
    dispatchingRulesForMainRoot = v2->_dispatchingRulesForMainRoot;
    v2->_dispatchingRulesForMainRoot = (NSArray *)v58;

    [(SBHIDEventDispatchController *)v2 _resetMainDeliveryRoot];
    v60 = v2->_deliveryManager;
    v102 = v82;
    v61 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v102 count:1];
    uint64_t v62 = [(BKSHIDEventDeliveryManager *)v60 dispatchDiscreteEventsForReason:@"SB-CaptureButton" withRules:v61];
    dispatchingAssertionForCaptureButton = v2->_dispatchingAssertionForCaptureButton;
    v2->_dispatchingAssertionForCaptureButton = (BSInvalidatable *)v62;

    v64 = (void *)MEMORY[0x1E4F1CAD0];
    v65 = [MEMORY[0x1E4F4F2F0] descriptorWithPage:12 usage:207];
    v66 = [v64 setWithObject:v65];

    v67 = _SBHIDDispatchPredicateFromHardwareType(v66, 3);

    v68 = [MEMORY[0x1E4F4F2C0] ruleForDispatchingDiscreteEventsMatchingPredicate:v67 toTarget:v94];
    v69 = v2->_deliveryManager;
    v101 = v68;
    v70 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v101 count:1];
    uint64_t v71 = [(BKSHIDEventDeliveryManager *)v69 dispatchDiscreteEventsForReason:@"SB-VoiceCommand" withRules:v70];
    dispatchingAssertionForVoiceCommand = v2->_dispatchingAssertionForVoiceCommand;
    v2->_dispatchingAssertionForVoiceCommand = (BSInvalidatable *)v71;

    v73 = [(SBHIDEventDispatchController *)v2 _keyCommandDispatchingRule];
    uint64_t v74 = [(BKSHIDEventDeliveryManager *)v2->_deliveryManager dispatchKeyCommandsForReason:@"SB-KeyCommands" withRule:v73];
    keyCommandDispatchingAssertion = v2->_keyCommandDispatchingAssertion;
    v2->_keyCommandDispatchingAssertion = (BSInvalidatable *)v74;
  }
  return v2;
}

- (id)configureDispatchRootsForChamoisDisplay:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [v5 hardwareIdentifier];
  if (v6)
  {
    uint64_t v7 = (void *)v6;
    v8 = (void *)MEMORY[0x1E4F4F2C8];
    v9 = +[SBHIDEventDispatchController symbolicDeferringTokenForSystemGesturesInDisplayConfiguration:v5];
    v10 = [v8 systemTargetWithDeferringToken:v9];

    uint64_t v11 = (void *)MEMORY[0x1E4F1CAD0];
    v12 = [MEMORY[0x1E4F4F2D0] displayWithHardwareIdentifier:v7];
    v13 = [v11 setWithObject:v12];

    v14 = _SBHIDSendersForDisplays(v13);
    v15 = _SBHIDTrackpadPredicate();
    [v15 setSenderDescriptors:v14];
    v16 = [MEMORY[0x1E4F4F2C0] ruleForDispatchingDiscreteEventsMatchingPredicate:v15 toTarget:v10];
    chamoisTrackpadRule = self->_chamoisTrackpadRule;
    self->_chamoisTrackpadRule = v16;

    id v18 = (void *)[(NSArray *)self->_dispatchingRulesForMainRoot mutableCopy];
    [v18 insertObject:self->_chamoisTrackpadRule atIndex:0];
    v19 = (NSArray *)[v18 copy];
    dispatchingRulesForMainRoot = self->_dispatchingRulesForMainRoot;
    self->_dispatchingRulesForMainRoot = v19;

    [(SBHIDEventDispatchController *)self _resetMainDeliveryRoot];
    id v21 = objc_alloc(MEMORY[0x1E4F4F838]);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __72__SBHIDEventDispatchController_configureDispatchRootsForChamoisDisplay___block_invoke;
    v25[3] = &unk_1E6AF4940;
    v25[4] = self;
    v22 = (void *)[v21 initWithIdentifier:@"SBChamoisTrackpadRule" forReason:@"trackpad rule for chamois" invalidationBlock:v25];

    return v22;
  }
  else
  {
    v24 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"hardwareIdentifier"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      [(SBHIDEventDispatchController *)a2 configureDispatchRootsForChamoisDisplay:(uint64_t)v24];
    }
    [v24 UTF8String];
    id result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

void __72__SBHIDEventDispatchController_configureDispatchRootsForChamoisDisplay___block_invoke(uint64_t a1)
{
  id v7 = (id)[*(id *)(*(void *)(a1 + 32) + 72) mutableCopy];
  [v7 removeObject:*(void *)(*(void *)(a1 + 32) + 64)];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 64);
  *(void *)(v2 + 64) = 0;

  uint64_t v4 = [v7 copy];
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v4;

  [*(id *)(a1 + 32) _resetMainDeliveryRoot];
}

- (id)configureDispatchRootsForContinuityDisplay:(id)a3
{
  v27[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [v5 hardwareIdentifier];
  if (!v6)
  {
    v24 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"hardwareIdentifier"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      [(SBHIDEventDispatchController *)a2 configureDispatchRootsForContinuityDisplay:(uint64_t)v24];
    }
    [v24 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D8C570FCLL);
  }
  id v7 = (void *)v6;
  v8 = (void *)MEMORY[0x1E4F4F2C8];
  v9 = +[SBHIDEventDispatchController symbolicDeferringTokenForSystemGesturesInDisplayConfiguration:v5];
  v25 = [v8 systemTargetWithDeferringToken:v9];

  v10 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v11 = (void *)MEMORY[0x1E4F4F2D0];
  v12 = self->_keyboardFocusDispatchingTarget;
  v13 = [v11 displayWithHardwareIdentifier:v7];
  v14 = [v10 setWithObject:v13];

  v15 = _SBHIDSendersForDisplays(v14);
  v26 = v5;
  v16 = [MEMORY[0x1E4F4F370] defaultSystemPredicate];
  [v16 setSenderDescriptors:v15];
  v17 = [MEMORY[0x1E4F4F2C0] ruleForDispatchingDiscreteEventsMatchingPredicate:v16 toTarget:v25];
  id v18 = [MEMORY[0x1E4F4F370] defaultFocusPredicate];
  [v18 setSenderDescriptors:v15];
  v19 = [MEMORY[0x1E4F4F2C0] ruleForDispatchingDiscreteEventsMatchingPredicate:v18 toTarget:v12];
  deliveryManager = self->_deliveryManager;
  v27[0] = v17;
  v27[1] = v19;
  id v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
  v22 = [(BKSHIDEventDeliveryManager *)deliveryManager dispatchDiscreteEventsForReason:@"SB-Continuity" withRules:v21];

  return v22;
}

- (id)dispatchKeyboardUsagesToSystemEnvironment:(id)a3 reason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  overrideKeyboardUsagesForSystemEnvironment = self->_overrideKeyboardUsagesForSystemEnvironment;
  if (!overrideKeyboardUsagesForSystemEnvironment)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __81__SBHIDEventDispatchController_dispatchKeyboardUsagesToSystemEnvironment_reason___block_invoke;
    v13[3] = &unk_1E6B05A08;
    v13[4] = self;
    v9 = [MEMORY[0x1E4F4F6E8] assertionWithIdentifier:@"overrideKeyboardUsagesForSystemEnvironment" stateDidChangeHandler:v13];
    v10 = self->_overrideKeyboardUsagesForSystemEnvironment;
    self->_overrideKeyboardUsagesForSystemEnvironment = v9;

    overrideKeyboardUsagesForSystemEnvironment = self->_overrideKeyboardUsagesForSystemEnvironment;
  }
  uint64_t v11 = [(BSCompoundAssertion *)overrideKeyboardUsagesForSystemEnvironment acquireForReason:v7 withContext:v6];

  return v11;
}

uint64_t __81__SBHIDEventDispatchController_dispatchKeyboardUsagesToSystemEnvironment_reason___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _resetMainDeliveryRoot];
}

- (void)_resetMainDeliveryRoot
{
  uint64_t v2 = self;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(BKSHIDEventDeliveryManager *)self->_deliveryManager transactionAssertionWithReason:@"_resetMainDeliveryRoot"];
  [(BSInvalidatable *)v2->_dispatchingAssertion invalidate];
  dispatchingAssertion = v2->_dispatchingAssertion;
  v2->_dispatchingAssertion = 0;

  if (v2->_overrideKeyboardUsagesRule)
  {
    id v5 = (void *)[(NSArray *)v2->_dispatchingRulesForMainRoot mutableCopy];
    [v5 removeObject:v2->_overrideKeyboardUsagesRule];
    uint64_t v6 = [v5 copy];
    dispatchingRulesForMainRoot = v2->_dispatchingRulesForMainRoot;
    v2->_dispatchingRulesForMainRoot = (NSArray *)v6;

    overrideKeyboardUsagesRule = v2->_overrideKeyboardUsagesRule;
    v2->_overrideKeyboardUsagesRule = 0;
  }
  if ([(BSCompoundAssertion *)v2->_overrideKeyboardUsagesForSystemEnvironment isActive])
  {
    id v28 = objc_alloc_init(MEMORY[0x1E4F4F370]);
    [v28 setSenderDescriptors:0];
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    v29 = v2;
    obuint64_t j = [(BSCompoundAssertion *)v2->_overrideKeyboardUsagesForSystemEnvironment orderedContext];
    uint64_t v10 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v36 != v12) {
            objc_enumerationMutation(obj);
          }
          v14 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          long long v31 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          id v15 = v14;
          uint64_t v16 = [v15 countByEnumeratingWithState:&v31 objects:v39 count:16];
          if (v16)
          {
            uint64_t v17 = v16;
            uint64_t v18 = *(void *)v32;
            do
            {
              for (uint64_t j = 0; j != v17; ++j)
              {
                if (*(void *)v32 != v18) {
                  objc_enumerationMutation(v15);
                }
                v20 = objc_msgSend(MEMORY[0x1E4F4F2F0], "descriptorWithPage:usage:", 7, objc_msgSend(*(id *)(*((void *)&v31 + 1) + 8 * j), "unsignedIntValue"));
                [v9 addObject:v20];
              }
              uint64_t v17 = [v15 countByEnumeratingWithState:&v31 objects:v39 count:16];
            }
            while (v17);
          }
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
      }
      while (v11);
    }

    [v28 setDescriptors:v9];
    uint64_t v2 = v29;
    uint64_t v21 = [MEMORY[0x1E4F4F2C0] ruleForDispatchingDiscreteEventsMatchingPredicate:v28 toTarget:v29->_mainSystemDispatchingTarget];
    v22 = v29->_overrideKeyboardUsagesRule;
    v29->_overrideKeyboardUsagesRule = (BKSHIDEventDiscreteDispatchingRule *)v21;

    v23 = (void *)[(NSArray *)v29->_dispatchingRulesForMainRoot mutableCopy];
    [v23 insertObject:v29->_overrideKeyboardUsagesRule atIndex:0];
    uint64_t v24 = [v23 copy];
    v25 = v29->_dispatchingRulesForMainRoot;
    v29->_dispatchingRulesForMainRoot = (NSArray *)v24;
  }
  uint64_t v26 = [(BKSHIDEventDeliveryManager *)v2->_deliveryManager dispatchDiscreteEventsForReason:@"SB-Default" withRules:v2->_dispatchingRulesForMainRoot];
  v27 = v2->_dispatchingAssertion;
  v2->_dispatchingAssertion = (BSInvalidatable *)v26;

  [v3 invalidate];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboardFocusDispatchingTarget, 0);
  objc_storeStrong((id *)&self->_mainSystemDispatchingTarget, 0);
  objc_storeStrong((id *)&self->_deliveryManager, 0);
  objc_storeStrong((id *)&self->_dispatchingRulesForMainRoot, 0);
  objc_storeStrong((id *)&self->_chamoisTrackpadRule, 0);
  objc_storeStrong((id *)&self->_overrideKeyboardUsagesRule, 0);
  objc_storeStrong((id *)&self->_overrideKeyboardUsagesForSystemEnvironment, 0);
  objc_storeStrong((id *)&self->_dispatchingAssertionForCaptureButton, 0);
  objc_storeStrong((id *)&self->_dispatchingAssertionForPrototypingCaptureButton, 0);
  objc_storeStrong((id *)&self->_keyCommandDispatchingAssertion, 0);
  objc_storeStrong((id *)&self->_dispatchingAssertionForVoiceCommand, 0);
  objc_storeStrong((id *)&self->_dispatchingAssertion, 0);
}

- (void)configureDispatchRootsForChamoisDisplay:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = NSStringFromSelector(a1);
  id v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0();
  id v9 = @"SBHIDEventDispatchController.m";
  __int16 v10 = 1024;
  int v11 = 350;
  __int16 v12 = v7;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_1D85BA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v8, 0x3Au);
}

- (void)configureDispatchRootsForContinuityDisplay:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = NSStringFromSelector(a1);
  id v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0();
  id v9 = @"SBHIDEventDispatchController.m";
  __int16 v10 = 1024;
  int v11 = 381;
  __int16 v12 = v7;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_1D85BA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v8, 0x3Au);
}

@end
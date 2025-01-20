uint64_t WCInputSourceTypeIsSupportedOnDevice(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  uint64_t v6;

  if (a1) {
    return 1;
  }
  v3 = (objc_class *)MEMORY[0x263F08C38];
  v4 = a2;
  v5 = (void *)[[v3 alloc] initWithUUIDString:@"1FD8E157-2B7C-45B6-B939-FFB8BE14E27F"];
  v6 = [v4 supportsCapability:v5];

  return v6;
}

id WCAvailableInputSourceTypes()
{
  if (WCAvailableInputSourceTypes_onceToken != -1) {
    dispatch_once(&WCAvailableInputSourceTypes_onceToken, &__block_literal_global);
  }
  v0 = (void *)WCAvailableInputSourceTypes_AvailableInputSourceTypes;
  return v0;
}

void __WCAvailableInputSourceTypes_block_invoke()
{
  v0 = [MEMORY[0x263EFF980] array];
  v1 = [NSNumber numberWithUnsignedInteger:0];
  [v0 addObject:v1];

  v2 = [NSNumber numberWithUnsignedInteger:1];
  [v0 addObject:v2];

  v3 = (void *)WCAvailableInputSourceTypes_AvailableInputSourceTypes;
  WCAvailableInputSourceTypes_AvailableInputSourceTypes = (uint64_t)v0;
}

id WCNameForInputSourceType(uint64_t a1, id a2)
{
  if (a1)
  {
    if (a1 == 1000)
    {
      v3 = @"input.source.digital.crown";
    }
    else
    {
      if (a1 != 1) {
        goto LABEL_8;
      }
      v3 = @"input.source.motion.pointer";
    }
  }
  else
  {
    v3 = @"input.source.grey";
  }
  WCLocalizedString(v3);
  a2 = (id)objc_claimAutoreleasedReturnValue();
LABEL_8:
  return a2;
}

BOOL WCInputSourceTypeDefaultEnabledState(uint64_t a1)
{
  return a1 != 1000 && a1 != 1;
}

uint64_t WatchControlSettingsChanged(uint64_t a1, void *a2)
{
  return [a2 informLocalObservers];
}

void WCSynchronizeDomain(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  id v5 = (id)objc_opt_new();
  [v5 synchronizeNanoDomain:v4 keys:v3];
}

void sub_23C232A48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

id WCNameForActionMenuPosition(unint64_t a1)
{
  if (a1 <= 2)
  {
    a1 = WCLocalizedString(off_264E38A58[a1]);
  }
  return (id)a1;
}

id WCLocalizedString(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  if (([v2 isLoaded] & 1) == 0) {
    [v2 load];
  }
  id v3 = [v2 localizedStringForKey:v1 value:&stru_26EFE1050 table:@"Localizable"];

  return v3;
}

id defaultGreyEventActionCustomizations()
{
  v3[4] = *MEMORY[0x263EF8340];
  v2[0] = &unk_26EFE3500;
  v2[1] = &unk_26EFE3518;
  v3[0] = &unk_26EFE3530;
  v3[1] = &unk_26EFE3548;
  v2[2] = &unk_26EFE34D0;
  v2[3] = &unk_26EFE34E8;
  v3[2] = &unk_26EFE3560;
  v3[3] = &unk_26EFE3578;
  v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:4];
  return v0;
}

id WCNameForMotionPointerMovementTolerance(unint64_t a1)
{
  if (a1 <= 2)
  {
    a1 = WCLocalizedString(off_264E38A70[a1]);
  }
  return (id)a1;
}

id WCNameForMotionPointerEdge(unint64_t a1)
{
  if (a1 <= 3)
  {
    a1 = WCLocalizedString(off_264E38A88[a1]);
  }
  return (id)a1;
}

id defaultMotionPointerEdgeActionCustomizations()
{
  if (defaultMotionPointerEdgeActionCustomizations_onceToken != -1) {
    dispatch_once(&defaultMotionPointerEdgeActionCustomizations_onceToken, &__block_literal_global_522);
  }
  v0 = (void *)defaultMotionPointerEdgeActionCustomizations_DefaultMotionPointerEdgeActions;
  return v0;
}

void __defaultMotionPointerEdgeActionCustomizations_block_invoke()
{
  v7[4] = *MEMORY[0x263EF8340];
  v6[0] = &unk_26EFE34D0;
  v0 = [NSNumber numberWithUnsignedInteger:WCDefaultActionForMotionPointerEdge(0)];
  v7[0] = v0;
  v6[1] = &unk_26EFE34E8;
  uint64_t v1 = [NSNumber numberWithUnsignedInteger:WCDefaultActionForMotionPointerEdge(1uLL)];
  v7[1] = v1;
  v6[2] = &unk_26EFE3500;
  uint64_t v2 = [NSNumber numberWithUnsignedInteger:WCDefaultActionForMotionPointerEdge(2uLL)];
  v7[2] = v2;
  v6[3] = &unk_26EFE3518;
  id v3 = [NSNumber numberWithUnsignedInteger:WCDefaultActionForMotionPointerEdge(3uLL)];
  v7[3] = v3;
  uint64_t v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:4];
  id v5 = (void *)defaultMotionPointerEdgeActionCustomizations_DefaultMotionPointerEdgeActions;
  defaultMotionPointerEdgeActionCustomizations_DefaultMotionPointerEdgeActions = v4;
}

uint64_t AXAssistiveTouchCursorColorForCursorColor(uint64_t result)
{
  if ((unint64_t)(result - 1) >= 7) {
    return 0;
  }
  return result;
}

uint64_t WCNameForCursorColor()
{
  return AXAssistiveTouchScannerColorDescription();
}

id WCNameForFocusMovementStyle(void *a1)
{
  if (a1)
  {
    if (a1 != (void *)1) {
      goto LABEL_6;
    }
    uint64_t v2 = @"focus.movement.style.auto";
  }
  else
  {
    uint64_t v2 = @"focus.movement.style.manual";
  }
  a1 = WCLocalizedString(v2);
LABEL_6:
  return a1;
}

id WCLocalizedStringElton(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  if (([v2 isLoaded] & 1) == 0) {
    [v2 load];
  }
  id v3 = [v2 localizedStringForKey:v1 value:&stru_26EFE1050 table:@"Localizable-elton"];

  return v3;
}

uint64_t WCAXHandGestureEventUsageForGreyEvent(unint64_t a1)
{
  if (a1 < 4) {
    return a1 + 1;
  }
  else {
    return WCAXHandGestureEventUsageUnknown;
  }
}

uint64_t WCGreyEventForAXHandGestureEventUsage(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) >= 4) {
    return WCGreyEventNone;
  }
  else {
    return a1 - 1;
  }
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

id wc_general_log()
{
  if (wc_general_log_onceToken != -1) {
    dispatch_once(&wc_general_log_onceToken, &__block_literal_global_1);
  }
  v0 = (void *)wc_general_log___logger;
  return v0;
}

uint64_t __wc_general_log_block_invoke()
{
  wc_general_log___logger = (uint64_t)os_log_create("com.apple.WatchControl", "general");
  return MEMORY[0x270F9A758]();
}

id wc_action_log()
{
  if (wc_action_log_onceToken != -1) {
    dispatch_once(&wc_action_log_onceToken, &__block_literal_global_4);
  }
  v0 = (void *)wc_action_log___logger;
  return v0;
}

uint64_t __wc_action_log_block_invoke()
{
  wc_action_log___logger = (uint64_t)os_log_create("com.apple.WatchControl", "action");
  return MEMORY[0x270F9A758]();
}

id wc_autoscroll_log()
{
  if (wc_autoscroll_log_onceToken != -1) {
    dispatch_once(&wc_autoscroll_log_onceToken, &__block_literal_global_7);
  }
  v0 = (void *)wc_autoscroll_log___logger;
  return v0;
}

uint64_t __wc_autoscroll_log_block_invoke()
{
  wc_autoscroll_log___logger = (uint64_t)os_log_create("com.apple.WatchControl", "autoscroll");
  return MEMORY[0x270F9A758]();
}

id wc_focus_log()
{
  if (wc_focus_log_onceToken != -1) {
    dispatch_once(&wc_focus_log_onceToken, &__block_literal_global_10);
  }
  v0 = (void *)wc_focus_log___logger;
  return v0;
}

uint64_t __wc_focus_log_block_invoke()
{
  wc_focus_log___logger = (uint64_t)os_log_create("com.apple.WatchControl", "focus");
  return MEMORY[0x270F9A758]();
}

id wc_input_source_log()
{
  if (wc_input_source_log_onceToken != -1) {
    dispatch_once(&wc_input_source_log_onceToken, &__block_literal_global_13);
  }
  v0 = (void *)wc_input_source_log___logger;
  return v0;
}

uint64_t __wc_input_source_log_block_invoke()
{
  wc_input_source_log___logger = (uint64_t)os_log_create("com.apple.WatchControl", "input_source");
  return MEMORY[0x270F9A758]();
}

id wc_motion_pointer_log()
{
  if (wc_motion_pointer_log_onceToken != -1) {
    dispatch_once(&wc_motion_pointer_log_onceToken, &__block_literal_global_16);
  }
  v0 = (void *)wc_motion_pointer_log___logger;
  return v0;
}

uint64_t __wc_motion_pointer_log_block_invoke()
{
  wc_motion_pointer_log___logger = (uint64_t)os_log_create("com.apple.WatchControl", "motion_pointer");
  return MEMORY[0x270F9A758]();
}

id wc_services_log()
{
  if (wc_services_log_onceToken != -1) {
    dispatch_once(&wc_services_log_onceToken, &__block_literal_global_19);
  }
  v0 = (void *)wc_services_log___logger;
  return v0;
}

uint64_t __wc_services_log_block_invoke()
{
  wc_services_log___logger = (uint64_t)os_log_create("com.apple.WatchControl", "services");
  return MEMORY[0x270F9A758]();
}

id wc_shake_gesture_log()
{
  if (wc_shake_gesture_log_onceToken != -1) {
    dispatch_once(&wc_shake_gesture_log_onceToken, &__block_literal_global_22);
  }
  v0 = (void *)wc_shake_gesture_log___logger;
  return v0;
}

uint64_t __wc_shake_gesture_log_block_invoke()
{
  wc_shake_gesture_log___logger = (uint64_t)os_log_create("com.apple.WatchControl", "shake_gesture");
  return MEMORY[0x270F9A758]();
}

id WCLocalizedTitleForCustomAction(uint64_t a1, void *a2)
{
  if (a1 != 1) {
    goto LABEL_4;
  }
  uint64_t v2 = (void *)MEMORY[0x263F22958];
  id v3 = a2;
  uint64_t v4 = [v2 sharedManager];
  id v5 = [v4 shortcutForIdentifier:v3];

  if (v5)
  {
    v6 = [v5 shortcutName];
  }
  else
  {
LABEL_4:
    v6 = 0;
  }
  return v6;
}

id WCImageForCustomAction(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1 == 1)
  {
    uint64_t v4 = [MEMORY[0x263F22958] sharedManager];
    id v5 = [v4 shortcutForIdentifier:v3];

    if (v5)
    {
      uint64_t v6 = [v5 glyphCharacter];
      uint64_t v14 = 0;
      v15 = &v14;
      uint64_t v16 = 0x2020000000;
      v7 = (void (*)(uint64_t))getWFSystemImageNameForGlyphCharacterSymbolLoc_ptr;
      v17 = getWFSystemImageNameForGlyphCharacterSymbolLoc_ptr;
      if (!getWFSystemImageNameForGlyphCharacterSymbolLoc_ptr)
      {
        v13[0] = MEMORY[0x263EF8330];
        v13[1] = 3221225472;
        v13[2] = __getWFSystemImageNameForGlyphCharacterSymbolLoc_block_invoke;
        v13[3] = &unk_264E38AB0;
        v13[4] = &v14;
        __getWFSystemImageNameForGlyphCharacterSymbolLoc_block_invoke((uint64_t)v13);
        v7 = (void (*)(uint64_t))v15[3];
      }
      _Block_object_dispose(&v14, 8);
      if (!v7) {
        WCImageForCustomAction_cold_1();
      }
      v8 = v7(v6);
      if ([v8 length])
      {
        uint64_t v9 = (void *)MEMORY[0x263F1C6B0];
        uint64_t v10 = [MEMORY[0x263F1C6C8] configurationWithTextStyle:*MEMORY[0x263F1D308]];
        v11 = [v9 _systemImageNamed:v8 withConfiguration:v10];
      }
      else
      {
        v11 = 0;
      }
    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void sub_23C238DCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id WCPayloadForCustomAction(uint64_t a1, void *a2)
{
  v10[2] = *MEMORY[0x263EF8340];
  v9[0] = kWCCustomActionTypePayloadTypeKey;
  id v3 = NSNumber;
  id v4 = a2;
  id v5 = [v3 numberWithInteger:a1];
  v9[1] = kWCCustomActionTypePayloadIdentifierKey;
  v10[0] = v5;
  v10[1] = v4;
  uint64_t v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];

  v7 = [MEMORY[0x263F08910] archivedDataWithRootObject:v6 requiringSecureCoding:1 error:0];

  return v7;
}

id WCDictionaryForCustomActionPayload(void *a1, uint64_t a2)
{
  id v3 = a1;
  if (WCDictionaryForCustomActionPayload_onceToken != -1) {
    dispatch_once(&WCDictionaryForCustomActionPayload_onceToken, &__block_literal_global_2);
  }
  id v4 = [MEMORY[0x263F08928] unarchivedObjectOfClasses:WCDictionaryForCustomActionPayload_UnarchiveClasses fromData:v3 error:a2];
  id v5 = v4;
  if (a2) {
    id v6 = 0;
  }
  else {
    id v6 = v4;
  }

  return v6;
}

void __WCDictionaryForCustomActionPayload_block_invoke()
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  id v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v4 count:3];
  uint64_t v2 = objc_msgSend(v0, "setWithArray:", v1, v4, v5);
  id v3 = (void *)WCDictionaryForCustomActionPayload_UnarchiveClasses;
  WCDictionaryForCustomActionPayload_UnarchiveClasses = v2;
}

BOOL WCRetrieveCustomActionFromPayload(void *a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v6 = WCDictionaryForCustomActionPayload(a1, a4);
  uint64_t v7 = v6;
  if (v6)
  {
    v8 = [v6 objectForKeyedSubscript:kWCCustomActionTypePayloadTypeKey];
    *a2 = [v8 integerValue];

    *a3 = [v7 objectForKeyedSubscript:kWCCustomActionTypePayloadIdentifierKey];
  }

  return v7 != 0;
}

void *__getWFSystemImageNameForGlyphCharacterSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v5[0] = 0;
  if (!VoiceShortcutClientLibraryCore_frameworkLibrary)
  {
    v5[1] = MEMORY[0x263EF8330];
    v5[2] = 3221225472;
    v5[3] = __VoiceShortcutClientLibraryCore_block_invoke;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    long long v6 = xmmword_264E38AD0;
    uint64_t v7 = 0;
    VoiceShortcutClientLibraryCore_frameworkLibrary = _sl_dlopen();
    id v3 = (void *)v5[0];
    uint64_t v2 = (void *)VoiceShortcutClientLibraryCore_frameworkLibrary;
    if (VoiceShortcutClientLibraryCore_frameworkLibrary)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      id v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  uint64_t v2 = (void *)VoiceShortcutClientLibraryCore_frameworkLibrary;
LABEL_5:
  result = dlsym(v2, "WFSystemImageNameForGlyphCharacter");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getWFSystemImageNameForGlyphCharacterSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __VoiceShortcutClientLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  VoiceShortcutClientLibraryCore_frameworkLibrary = result;
  return result;
}

id WCAvailableActions()
{
  if (WCAvailableActions_onceToken != -1) {
    dispatch_once(&WCAvailableActions_onceToken, &__block_literal_global_3);
  }
  v0 = (void *)WCAvailableActions_AvailableActions;
  return v0;
}

void __WCAvailableActions_block_invoke()
{
  v0 = [MEMORY[0x263EFF980] array];
  for (uint64_t i = 0; i != 24; ++i)
  {
    uint64_t v2 = [NSNumber numberWithUnsignedInteger:i];
    [v0 addObject:v2];
  }
  id v3 = (void *)WCAvailableActions_AvailableActions;
  WCAvailableActions_AvailableActions = (uint64_t)v0;
}

id WCNameForAction(uint64_t a1)
{
  if (!(!v2 & v1))
  {
    long long v6 = @"action.none";
    switch(a1)
    {
      case 0:
        goto LABEL_49;
      case 1:
        long long v6 = @"action.activate.focused.element";
        goto LABEL_49;
      case 2:
        long long v6 = @"action.motion.pointer.toggle";
        goto LABEL_49;
      case 3:
        long long v6 = @"action.move.focus.forwards";
        goto LABEL_49;
      case 4:
        long long v6 = @"action.move.focus.backwards";
        goto LABEL_49;
      case 5:
        long long v6 = @"action.autoscroll.digital.crown";
        goto LABEL_49;
      case 6:
        long long v6 = @"action.autoscroll.vertical";
        goto LABEL_49;
      case 7:
        long long v6 = @"action.autoscroll.horizontal";
        goto LABEL_49;
      case 8:
        long long v6 = @"action.scroll.to.bottom";
        goto LABEL_49;
      case 9:
        long long v6 = @"action.scroll.to.top";
        goto LABEL_49;
      case 10:
        long long v6 = @"action.digital.crown.press";
        goto LABEL_49;
      case 11:
        long long v6 = @"action.sting.press";
        goto LABEL_49;
      case 12:
        long long v6 = @"action.sting.keycord.press";
        goto LABEL_49;
      case 13:
        long long v6 = @"action.show.dock";
        goto LABEL_49;
      case 14:
        long long v6 = @"action.show.notification.center";
        goto LABEL_49;
      case 15:
        long long v6 = @"action.show.control.center";
        goto LABEL_49;
      case 16:
        goto LABEL_7;
      case 17:
        long long v6 = @"action.show.siri";
        goto LABEL_49;
      case 18:
        long long v6 = @"action.show.wallet";
        goto LABEL_49;
      case 19:
        long long v6 = @"action.show.shutdown.alert";
        goto LABEL_49;
      case 20:
        long long v6 = @"action.gesture.mode";
        goto LABEL_49;
      case 21:
        goto LABEL_8;
      case 22:
        long long v6 = @"action.tap.and.hold";
        goto LABEL_49;
      case 23:
        long long v6 = @"action.side.button.press";
        goto LABEL_49;
      default:
        JUMPOUT(0);
    }
  }
  uint64_t v5 = 0;
  switch(a1)
  {
    case 10000:
      long long v6 = @"action.action.menu.dismiss";
      goto LABEL_49;
    case 10001:
LABEL_8:
      long long v6 = @"action.action.menu";
      goto LABEL_49;
    case 10002:
      long long v6 = @"action.system.state.unlock";
      goto LABEL_49;
    case 10003:
      long long v6 = @"action.motion.pointer.tap.point";
      goto LABEL_49;
    case 10004:
    case 10005:
LABEL_7:
      long long v6 = @"action.show.app.launcher";
      goto LABEL_49;
    case 10006:
      long long v6 = @"action.confirm.apple.pay";
      goto LABEL_49;
    case 10007:
      long long v6 = @"action.confirm.auto.unlock";
      goto LABEL_49;
    case 10008:
      long long v6 = @"action.file.radar";
      goto LABEL_49;
    case 10009:
      long long v6 = @"action.motion.pointer.edge.swipe.top";
      goto LABEL_49;
    case 10010:
      long long v6 = @"action.motion.pointer.edge.swipe.bottom";
      goto LABEL_49;
    case 10011:
      long long v6 = @"action.motion.pointer.edge.swipe.left";
      goto LABEL_49;
    case 10012:
      long long v6 = @"action.motion.pointer.edge.swipe.right";
      goto LABEL_49;
    case 10013:
      long long v6 = @"action.move.focus.to.first";
      goto LABEL_49;
    case 10014:
      long long v6 = @"action.move.focus.to.last";
      goto LABEL_49;
    case 10015:
      long long v6 = @"action.pause.motion.pointer";
      goto LABEL_49;
    case 10016:
      long long v6 = @"action.digital.crown.single.turn.up";
      goto LABEL_49;
    case 10017:
      long long v6 = @"action.digital.crown.single.turn.down";
      goto LABEL_49;
    case 10018:
      long long v6 = @"action.pause.auto.focus.navigation";
      goto LABEL_49;
    case 10019:
      long long v6 = @"action.turn.off.backlight";
      goto LABEL_49;
    case 10021:
      long long v6 = @"action.nearby.device.control";
      goto LABEL_49;
    case 10022:
      long long v6 = @"action.return.to.last.app";
      goto LABEL_49;
    case 10023:
      long long v6 = @"action.digital.crown.dynamic.turn";
      goto LABEL_49;
    case 10024:
      long long v6 = @"action.show.home.screen";
LABEL_49:
      uint64_t v5 = WCLocalizedString(v6);
      break;
    default:
      break;
  }
  return v5;
}

__CFString *WCSymbolNameForAction(uint64_t a1)
{
  uint64_t result = 0;
  switch(a1)
  {
    case 10000:
      uint64_t result = @"xmark.circle.fill";
      break;
    case 10001:
LABEL_11:
      uint64_t result = @"filemenu.and.selection";
      break;
    case 10002:
      uint64_t result = @"lock.open.fill";
      break;
    case 10003:
      uint64_t result = @"dot.circle.and.hand.point.up.left.fill";
      break;
    case 10004:
      uint64_t result = @"list.bullet";
      break;
    case 10005:
LABEL_9:
      uint64_t result = @"circles.hexagongrid.fill";
      break;
    case 10006:
LABEL_10:
      uint64_t result = @"wallet.fill";
      break;
    case 10007:
      uint64_t result = @"lock.circle.fill";
      break;
    case 10008:
      uint64_t result = @"ant.circle.fill";
      break;
    case 10009:
      uint64_t result = @"chevron.up.circle.fill";
      break;
    case 10010:
      uint64_t result = @"chevron.down.circle.fill";
      break;
    case 10011:
      uint64_t result = @"chevron.left.circle.fill";
      break;
    case 10012:
      uint64_t result = @"chevron.right.circle.fill";
      break;
    case 10013:
LABEL_7:
      uint64_t result = @"arrow.up.to.line";
      break;
    case 10014:
LABEL_6:
      uint64_t result = @"arrow.down.to.line";
      break;
    case 10015:
    case 10018:
      uint64_t result = @"pause.circle.fill";
      break;
    case 10016:
    case 10023:
LABEL_5:
      uint64_t result = @"digitalcrown.arrow.clockwise.fill";
      break;
    case 10017:
      uint64_t result = @"digitalcrown.arrow.counterclockwise.fill";
      break;
    case 10019:
      uint64_t result = @"applewatch.case.inset.filled";
      break;
    case 10020:
      return result;
    case 10021:
      uint64_t result = @"wave.3.forward";
      break;
    case 10022:
      uint64_t result = @"square.fill.on.square.fill";
      break;
    case 10024:
      uint64_t result = @"platter.filled.bottom.applewatch.case";
      break;
    default:
      switch(a1)
      {
        case 1:
        case 22:
          uint64_t result = @"hand.tap.fill";
          break;
        case 2:
          uint64_t result = @"smallcircle.fill.circle";
          break;
        case 3:
          uint64_t result = @"chevron.forward.2";
          break;
        case 4:
          uint64_t result = @"chevron.backward.2";
          break;
        case 5:
          goto LABEL_5;
        case 6:
          uint64_t result = @"arrow.up.arrow.down.circle.fill";
          break;
        case 7:
          uint64_t result = @"arrow.left.arrow.right.circle.fill";
          break;
        case 8:
          goto LABEL_6;
        case 9:
          goto LABEL_7;
        case 10:
          uint64_t result = @"digitalcrown.press.fill";
          break;
        case 11:
        case 12:
          uint64_t result = @"applewatch.action.button.arrow.right";
          break;
        case 13:
          uint64_t result = @"watchdock.applewatch.case";
          break;
        case 14:
          uint64_t result = @"bell.badge";
          break;
        case 15:
          uint64_t result = @"controlcenter.applewatch.case";
          break;
        case 16:
          goto LABEL_9;
        case 17:
          uint64_t result = @"siri";
          break;
        case 18:
          goto LABEL_10;
        case 19:
          uint64_t result = @"power";
          break;
        case 20:
          uint64_t result = @"hand.draw.fill";
          break;
        case 21:
          goto LABEL_11;
        case 23:
          uint64_t result = @"applewatch.side.button.arrow.left";
          break;
        default:
          return result;
      }
      break;
  }
  return result;
}

id WCImageForAction(uint64_t a1)
{
  char v1 = (void *)MEMORY[0x263F1C6B0];
  char v2 = WCSymbolNameForAction(a1);
  uint64_t v3 = [MEMORY[0x263F1C6C8] configurationWithTextStyle:*MEMORY[0x263F1D308]];
  uint64_t v4 = [v1 _systemImageNamed:v2 withConfiguration:v3];

  uint64_t v5 = [MEMORY[0x263F1C550] whiteColor];
  long long v6 = [v4 imageWithTintColor:v5 renderingMode:1];

  return v6;
}

BOOL WCActionIsInternalAction(unint64_t a1)
{
  return a1 >> 4 > 0x270;
}

BOOL WCActionIsAutoScrollAction(uint64_t a1)
{
  return (unint64_t)(a1 - 5) < 3;
}

BOOL WCActionIsEdgeSwipeAction(uint64_t a1)
{
  return (unint64_t)(a1 - 10009) < 4;
}

BOOL WCActionRequiresFocusRing(unint64_t a1)
{
  BOOL result = 1;
  if (a1 > 0x15 || ((1 << a1) & 0x20001A) == 0) {
    return a1 - 10000 < 2;
  }
  return result;
}

uint64_t WCActionIsStingSupported()
{
  v0 = [MEMORY[0x263F57730] sharedInstance];
  char v1 = [v0 getActivePairedDevice];

  char v2 = [v1 valueForProperty:*MEMORY[0x263F575B0]];
  int v3 = [v2 BOOLValue];

  uint64_t v4 = [v1 valueForProperty:*MEMORY[0x263F575B8]];
  unsigned int v5 = [v4 BOOLValue];

  long long v6 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"15BF559D-D50B-44FE-AC84-DFBA323EC985"];
  int v7 = [v1 supportsCapability:v6];

  return v7 & ~(v3 | v5);
}

id WCDefaultActionsForActionGroup(uint64_t a1)
{
  if (a1 <= 9999)
  {
    if (a1)
    {
      if (a1 == 1)
      {
        char v1 = &unk_26EFE3980;
      }
      else if (a1 == 2)
      {
        char v1 = &unk_26EFE3968;
      }
      else
      {
LABEL_8:
        char v1 = (void *)MEMORY[0x263EFFA68];
      }
    }
    else
    {
      char v1 = (void *)[&unk_26EFE3998 mutableCopy];
      if (_os_feature_enabled_impl()) {
        [v1 removeObject:&unk_26EFE36E0];
      }
      if (AXIsInternalInstall()) {
        [v1 addObject:&unk_26EFE3770];
      }
      if (WCActionIsStingSupported())
      {
        [v1 insertObject:&unk_26EFE3788 atIndex:3];
        [v1 insertObject:&unk_26EFE37A0 atIndex:3];
      }
    }
  }
  else
  {
    switch(a1)
    {
      case 10000:
        char v1 = &unk_26EFE39B0;
        break;
      case 10001:
        char v1 = &unk_26EFE39C8;
        break;
      case 10003:
        char v1 = &unk_26EFE39E0;
        break;
      default:
        goto LABEL_8;
    }
  }
  return v1;
}

id WCNameForActionGroup(uint64_t a1)
{
  int v3 = 0;
  if (a1 > 9999)
  {
    switch(a1)
    {
      case 10000:
        uint64_t v4 = @"action.group.general.interaction";
        break;
      case 10002:
        uint64_t v4 = @"action.group.siri.shortcuts";
        break;
      case 10003:
        uint64_t v4 = @"action.group.digital.crown";
        break;
      default:
        goto LABEL_15;
    }
  }
  else if (a1)
  {
    if (a1 == 1)
    {
      uint64_t v4 = @"action.group.autoscroll";
    }
    else
    {
      if (a1 != 2) {
        goto LABEL_15;
      }
      uint64_t v4 = @"action.group.accessibility.actions";
    }
  }
  else
  {
    uint64_t v4 = @"action.group.system";
  }
  int v3 = WCLocalizedString(v4);
LABEL_15:
  return v3;
}

__CFString *WCSymbolNameForActionGroup(uint64_t a1)
{
  uint64_t v1 = @"smallcircle.fill.circle.fill";
  char v2 = @"digitalcrown.arrow.clockwise.fill";
  if (a1 != 10003) {
    char v2 = 0;
  }
  if (a1 == 10002) {
    int v3 = @"app.2.stack.3d.fill";
  }
  else {
    int v3 = v2;
  }
  uint64_t v4 = @"applewatch";
  if (a1 != 10000) {
    uint64_t v1 = v3;
  }
  unsigned int v5 = @"hand.tap.fill";
  if (a1 != 2) {
    unsigned int v5 = 0;
  }
  if (a1 == 1) {
    unsigned int v5 = @"arrow.up.and.down.and.sparkles";
  }
  if (a1) {
    uint64_t v4 = v5;
  }
  if (a1 <= 9999) {
    return v4;
  }
  else {
    return v1;
  }
}

id WCImageForActionGroup(uint64_t a1)
{
  uint64_t v1 = (void *)MEMORY[0x263F1C6B0];
  char v2 = WCSymbolNameForActionGroup(a1);
  int v3 = [MEMORY[0x263F1C6C8] configurationWithTextStyle:*MEMORY[0x263F1D308]];
  uint64_t v4 = [v1 _systemImageNamed:v2 withConfiguration:v3];

  unsigned int v5 = [MEMORY[0x263F1C550] whiteColor];
  long long v6 = [v4 imageWithTintColor:v5 renderingMode:1];

  return v6;
}

void *WCAvailableActionGroups()
{
  return &unk_26EFE39F8;
}

id WCAvailableActionGroupsForSettings()
{
  v0 = [&unk_26EFE3A10 arrayByAddingObjectsFromArray:&unk_26EFE39F8];
  uint64_t v1 = [v0 arrayByAddingObjectsFromArray:&unk_26EFE3A28];

  return v1;
}

unint64_t WCDefaultActionForMotionPointerEdge(unint64_t a1)
{
  if (a1 >= 4) {
    return 0;
  }
  else {
    return a1 + 10009;
  }
}

__CFString *greyEventNameForAnalytics(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2) {
    return @"clench";
  }
  else {
    return *(&off_264E38B30 + a1 - 1);
  }
}

__CFString *actionNameForAnalytics(uint64_t a1)
{
  switch(a1)
  {
    case 10000:
      BOOL result = @"DismissActionMenu";
      break;
    case 10001:
      BOOL result = @"ActivateActionMenu";
      break;
    case 10002:
      BOOL result = @"SystemStateUnlock";
      break;
    case 10003:
      BOOL result = @"TapAtMotionPointerPoint";
      break;
    case 10004:
      BOOL result = @"AppLauncherList";
      break;
    case 10005:
      BOOL result = @"AppLauncherFieldOfIcons";
      break;
    case 10006:
      BOOL result = @"ConfirmApplePay";
      break;
    case 10007:
      BOOL result = @"ConfirmAutoUnlock";
      break;
    case 10008:
      BOOL result = @"FileRadar";
      break;
    case 10009:
      BOOL result = @"DwellControlTopEdgeSwipe";
      break;
    case 10010:
      BOOL result = @"DwellControlBottomEdgeSwipe";
      break;
    case 10011:
      BOOL result = @"DwellControlLeftEdgeSwipe";
      break;
    case 10012:
      BOOL result = @"DwellControlRightEdgeSwipe";
      break;
    case 10013:
      BOOL result = @"MoveFocusToFirst";
      break;
    case 10014:
      BOOL result = @"MoveFocusToLast";
      break;
    case 10015:
      BOOL result = @"PauseMotionPointer";
      break;
    case 10016:
      BOOL result = @"DigitalCrownSingleTurnUp";
      break;
    case 10017:
      BOOL result = @"DigitalCrownSingleTurnDown";
      break;
    case 10018:
      BOOL result = @"PauseAutoFocusNavigation";
      break;
    case 10019:
      BOOL result = @"TurnOffBacklight";
      break;
    case 10020:
      BOOL result = @"CustomActionPlaceholder";
      break;
    case 10021:
      BOOL result = @"NearbyDeviceControl";
      break;
    case 10022:
      BOOL result = @"ReturnToLastApp";
      break;
    case 10023:
      BOOL result = @"DigitalCrownDynamicTurn";
      break;
    case 10024:
      BOOL result = @"ShowHomeScreen";
      break;
    default:
      switch(a1)
      {
        case 1:
          BOOL result = @"ActivateFocusedElement";
          break;
        case 2:
          BOOL result = @"MotionPointer";
          break;
        case 3:
          BOOL result = @"MoveFocusForwards";
          break;
        case 4:
          BOOL result = @"MoveFocusBackwards";
          break;
        case 5:
          BOOL result = @"DigitalCrownAutoScroll";
          break;
        case 6:
          BOOL result = @"VerticalAutoScroll";
          break;
        case 7:
          BOOL result = @"HorizontalAutoScroll";
          break;
        case 8:
          BOOL result = @"ScrollToBottom";
          break;
        case 9:
          BOOL result = @"ScrollToTop";
          break;
        case 10:
          BOOL result = @"DigitalCrownPress";
          break;
        case 11:
          BOOL result = @"StingPress";
          break;
        case 12:
          BOOL result = @"StingKeycordPress";
          break;
        case 13:
          BOOL result = @"ShowDock";
          break;
        case 14:
          BOOL result = @"ShowNotificationCenter";
          break;
        case 15:
          BOOL result = @"ShowControlCenter";
          break;
        case 16:
          BOOL result = @"ShowAppLauncher";
          break;
        case 17:
          BOOL result = @"ShowSiri";
          break;
        case 18:
          BOOL result = @"ShowWallet";
          break;
        case 19:
          BOOL result = @"ShowShutdownAlert";
          break;
        case 20:
          BOOL result = @"GestureMode";
          break;
        case 21:
          BOOL result = @"Menu";
          break;
        case 22:
          BOOL result = @"TapAndHoldAtPoint";
          break;
        case 23:
          BOOL result = @"SideButtonPress";
          break;
        default:
          BOOL result = @"None";
          break;
      }
      break;
  }
  return result;
}

__CFString *inputSourceNameForAnalytics(uint64_t a1)
{
  uint64_t v1 = @"Grey";
  if (a1 == 1) {
    uint64_t v1 = @"MotionPointer";
  }
  if (a1 == 1000) {
    return @"DigitalCrown";
  }
  else {
    return v1;
  }
}

__CFString *focusRingColorNameForAnalytics(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 6) {
    return @"Default";
  }
  else {
    return *(&off_264E38B48 + a1 - 1);
  }
}

uint64_t isUsingGrey()
{
  v0 = +[WatchControlSettings sharedInstance];
  uint64_t v1 = [v0 enabledInputSourceTypes];

  char v2 = [v1 objectForKeyedSubscript:&unk_26EFE38F0];
  uint64_t v3 = [v2 BOOLValue];

  return v3;
}

id WCAvailableGreyEvents()
{
  if (WCAvailableGreyEvents_onceToken != -1) {
    dispatch_once(&WCAvailableGreyEvents_onceToken, &__block_literal_global_4);
  }
  v0 = (void *)WCAvailableGreyEvents_AvailableGreyEvents;
  return v0;
}

void __WCAvailableGreyEvents_block_invoke()
{
  v0 = (void *)WCAvailableGreyEvents_AvailableGreyEvents;
  WCAvailableGreyEvents_AvailableGreyEvents = (uint64_t)&unk_26EFE3A40;
}

id WCNameForGreyEvent(uint64_t a1)
{
  switch(a1)
  {
    case 0:
      uint64_t v1 = @"grey.event.clinch";
      goto LABEL_5;
    case 1:
      uint64_t v1 = @"grey.event.double.clinch";
      goto LABEL_5;
    case 2:
      uint64_t v3 = @"grey.event.tap";
      goto LABEL_8;
    case 3:
      uint64_t v3 = @"grey.event.double.tap";
LABEL_8:
      char v2 = WCLocalizedStringElton(v3);
      break;
    default:
      uint64_t v1 = @"grey.event.none";
LABEL_5:
      char v2 = WCLocalizedString(v1);
      break;
  }
  return v2;
}

id WCOnboardingDescriptionForGreyEvent(unint64_t a1)
{
  if (a1 > 3)
  {
    char v2 = 0;
  }
  else
  {
    char v2 = WCLocalizedString(off_264E38B98[a1]);
  }
  return v2;
}

id WCOnboardingInstructionsForGreyEvent(unint64_t a1)
{
  if (a1 > 3)
  {
    char v2 = 0;
  }
  else
  {
    char v2 = WCLocalizedString(off_264E38BB8[a1]);
  }
  return v2;
}

id WCPracticeGestureSuccessTitleForGreyEvent(uint64_t a1)
{
  switch(a1)
  {
    case 0:
      char v2 = @"grey.practice.success.clench.title";
      goto LABEL_7;
    case 1:
      char v2 = @"grey.practice.success.double.clench.title";
LABEL_7:
      uint64_t v3 = WCLocalizedString(v2);
      goto LABEL_11;
    case 2:
      unsigned int v5 = @"grey.practice.success.tap.title";
      goto LABEL_10;
    case 3:
      unsigned int v5 = @"grey.practice.success.double.tap.title";
LABEL_10:
      uint64_t v3 = WCLocalizedStringElton(v5);
LABEL_11:
      break;
    default:
      uint64_t v3 = 0;
      break;
  }
  return v3;
}

id WCPracticeGestureSuccessMessageForGreyEvent(unint64_t a1)
{
  if (a1 > 3)
  {
    char v2 = 0;
  }
  else
  {
    char v2 = WCLocalizedString(off_264E38BD8[a1]);
  }
  return v2;
}

id WCOnboardingImageForGreyEvent(unint64_t a1, char a2)
{
  if (a1 > 3)
  {
    char v2 = 0;
    if (a2) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  char v2 = off_264E38BF8[a1];
  if ((a2 & 1) == 0)
  {
LABEL_5:
    char v2 = [(__CFString *)v2 stringByAppendingString:@"-Pre"];
  }
LABEL_6:
  if (v2)
  {
    uint64_t v3 = soft_WCImageForAssetName(v2);
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

id soft_WCImageForAssetName(void *a1)
{
  id v1 = a1;
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v2 = (void (*)(id))getWCImageForAssetNameSymbolLoc_ptr;
  uint64_t v9 = getWCImageForAssetNameSymbolLoc_ptr;
  if (!getWCImageForAssetNameSymbolLoc_ptr)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __getWCImageForAssetNameSymbolLoc_block_invoke;
    v5[3] = &unk_264E38AB0;
    v5[4] = &v6;
    __getWCImageForAssetNameSymbolLoc_block_invoke((uint64_t)v5);
    char v2 = (void (*)(id))v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (!v2) {
    WCImageForCustomAction_cold_1();
  }
  uint64_t v3 = v2(v1);

  return v3;
}

void sub_23C23B564(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id WCOnboardingAnimationImagesForGreyEvent(unint64_t a1, double *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (a1 > 3)
  {
    unsigned int v5 = 0;
    double v3 = 0.0;
    uint64_t v4 = 1;
  }
  else
  {
    double v3 = dbl_23C23CA68[a1];
    uint64_t v4 = qword_23C23CA88[a1];
    unsigned int v5 = off_264E38C18[a1];
  }
  uint64_t v6 = [MEMORY[0x263EFF980] array];
  uint64_t v7 = 0;
  do
  {
    uint64_t v8 = [NSString stringWithFormat:@"%@_%03lu", v5, v7];
    uint64_t v9 = soft_WCImageForAssetName(v8);
    if (v9)
    {
      [v6 addObject:v9];
    }
    else
    {
      uint64_t v10 = wc_general_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v8;
        _os_log_fault_impl(&dword_23C230000, v10, OS_LOG_TYPE_FAULT, "missing image %@", buf, 0xCu);
      }
    }
    ++v7;
  }
  while (v4 != v7);
  double v11 = 1.0 / (v3 / (float)(unint64_t)[v6 count]);
  if (v11 > 0.0)
  {
    unint64_t v12 = 1;
    do
    {
      v13 = [v6 firstObject];
      [v6 insertObject:v13 atIndex:0];

      double v14 = (double)v12++;
    }
    while (v11 > v14);
    if (v11 > 0.0)
    {
      unint64_t v15 = 1;
      do
      {
        uint64_t v16 = [v6 lastObject];
        [v6 addObject:v16];

        double v17 = (double)v15++;
      }
      while (v11 > v17);
    }
  }
  *a2 = v3 + 1.0 + 1.0;
  return v6;
}

void *__getWCImageForAssetNameSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v5[0] = 0;
  if (!WatchControlAssetsLibraryCore_frameworkLibrary)
  {
    v5[1] = MEMORY[0x263EF8330];
    v5[2] = 3221225472;
    v5[3] = __WatchControlAssetsLibraryCore_block_invoke;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    void v5[5] = v5;
    long long v6 = xmmword_264E38B80;
    uint64_t v7 = 0;
    WatchControlAssetsLibraryCore_frameworkLibrary = _sl_dlopen();
    double v3 = (void *)v5[0];
    char v2 = (void *)WatchControlAssetsLibraryCore_frameworkLibrary;
    if (WatchControlAssetsLibraryCore_frameworkLibrary)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      double v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  char v2 = (void *)WatchControlAssetsLibraryCore_frameworkLibrary;
LABEL_5:
  BOOL result = dlsym(v2, "WCImageForAssetName");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getWCImageForAssetNameSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __WatchControlAssetsLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  WatchControlAssetsLibraryCore_frameworkLibrary = result;
  return result;
}

id WCNameForAutoScrollDirection(unint64_t a1)
{
  if (a1 <= 3)
  {
    a1 = WCLocalizedString(off_264E38C38[a1]);
  }
  return (id)a1;
}

id WCNameForAutoMovementSpeed(unint64_t a1)
{
  if (a1 <= 2)
  {
    a1 = WCLocalizedString(off_264E38C58[a1]);
  }
  return (id)a1;
}

id WCNameForAutoScrollHandlerStatus(unint64_t a1)
{
  if (a1 <= 2)
  {
    a1 = WCLocalizedString(off_264E38C70[a1]);
  }
  return (id)a1;
}

void WCImageForCustomAction_cold_1()
{
}

uint64_t AXAssistiveTouchScannerColorDescription()
{
  return MEMORY[0x270F09EF8]();
}

uint64_t AXIsInternalInstall()
{
  return MEMORY[0x270F09278]();
}

uint64_t AXPerformBlockAsynchronouslyOnMainThread()
{
  return MEMORY[0x270F09428]();
}

uint64_t AXSAssistiveTouchCursorColor()
{
  return MEMORY[0x270F09528]();
}

uint64_t AX_PERFORM_WITH_LOCK()
{
  return MEMORY[0x270F09570]();
}

uint64_t CALayerGetDelegate()
{
  return MEMORY[0x270EFB848]();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x270EE4C90](applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59C8](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x270EE59D8](retstr, t, tx, ty);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x270EE7228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

uint64_t NSStringFromBOOL()
{
  return MEMORY[0x270EF2BF8]();
}

uint64_t _AXSFullKeyboardAccessSetEnabled()
{
  return MEMORY[0x270F90770]();
}

uint64_t _AXSVoiceOverTouchEnabled()
{
  return MEMORY[0x270F90B78]();
}

uint64_t _AXSVoiceOverTouchSetEnabled()
{
  return MEMORY[0x270F90B80]();
}

uint64_t _AXSWatchControlSetEnabled()
{
  return MEMORY[0x270F90BF0]();
}

uint64_t _AXSZoomTouchEnabled()
{
  return MEMORY[0x270F90C10]();
}

uint64_t _AXSZoomTouchSetEnabled()
{
  return MEMORY[0x270F90C18]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t __UIAccessibilityCastAsClass()
{
  return MEMORY[0x270F09600]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

void abort(void)
{
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x270ED9620]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

void free(void *a1)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}
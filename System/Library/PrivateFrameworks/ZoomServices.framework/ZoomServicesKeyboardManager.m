@interface ZoomServicesKeyboardManager
+ (id)sharedInstance;
- (BOOL)inUnitTestMode;
- (int64_t)keyboardCommandForEvent:(id)a3;
- (void)setInUnitTestMode:(BOOL)a3;
@end

@implementation ZoomServicesKeyboardManager

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__ZoomServicesKeyboardManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, block);
  }
  v2 = (void *)sharedInstance_Manager;
  return v2;
}

uint64_t __45__ZoomServicesKeyboardManager_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance_Manager = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x270F9A758]();
}

- (int64_t)keyboardCommandForEvent:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x263F22938] sharedInstance];
  int v6 = [v5 zoomKeyboardShortcutsEnabled];

  if (!v6) {
    goto LABEL_29;
  }
  if (![(ZoomServicesKeyboardManager *)self inUnitTestMode])
  {
    v7 = [v4 keyInfo];
    [v7 translateKeycode];
  }
  v8 = [v4 keyInfo];
  int v9 = [v8 keyDown];

  v10 = [v4 keyInfo];
  int v11 = [v10 modifierState];
  if (!v9)
  {
    int v18 = ZWCommandOptionShiftModifiers;

    if (v11 == v18)
    {
      v19 = [v4 keyInfo];
      int v20 = [v19 keyCode];

      if (v20 != 9)
      {
LABEL_31:
        int64_t v16 = 15;
        goto LABEL_30;
      }
      v17 = [MEMORY[0x263F22938] sharedInstance];
      BOOL v21 = [v17 zoomSwitchZoomModeKbShortcutEnabled] == 0;
      uint64_t v22 = 5;
      goto LABEL_25;
    }
    goto LABEL_23;
  }
  int v12 = ZWCommandOptionModifiers;

  v13 = [v4 keyInfo];
  v14 = v13;
  if (v11 != v12)
  {
    int v23 = [v13 modifierState];
    int v24 = ZWControlOptionModifiers;

    if (v23 == v24)
    {
      v17 = [MEMORY[0x263F22938] sharedInstance];
      BOOL v21 = [v17 zoomTempToggleZoomKbShortcutEnabled] == 0;
      uint64_t v22 = 3;
      goto LABEL_25;
    }
    v25 = [v4 keyInfo];
    int v26 = [v25 modifierState];
    int v27 = ZWCommandOptionControlModifiers;

    if (v26 == v27)
    {
      v28 = [v4 keyInfo];
      int v29 = [v28 keyCode];

      switch(v29)
      {
        case 'O':
          v17 = [MEMORY[0x263F22938] sharedInstance];
          BOOL v21 = [v17 zoomResizeZoomWindowKbShortcutEnabled] == 0;
          uint64_t v22 = 10;
          goto LABEL_25;
        case 'P':
          v17 = [MEMORY[0x263F22938] sharedInstance];
          BOOL v21 = [v17 zoomResizeZoomWindowKbShortcutEnabled] == 0;
          uint64_t v22 = 12;
          goto LABEL_25;
        case 'Q':
          v17 = [MEMORY[0x263F22938] sharedInstance];
          BOOL v21 = [v17 zoomResizeZoomWindowKbShortcutEnabled] == 0;
          uint64_t v22 = 13;
          goto LABEL_25;
        case 'R':
          v17 = [MEMORY[0x263F22938] sharedInstance];
          BOOL v21 = [v17 zoomResizeZoomWindowKbShortcutEnabled] == 0;
          uint64_t v22 = 11;
          goto LABEL_25;
        default:
          goto LABEL_31;
      }
    }
LABEL_23:
    v30 = [v4 keyInfo];
    int v31 = [v30 modifierState];
    int v32 = ZWControlModifier;

    if (v31 == v32)
    {
      v17 = [MEMORY[0x263F22938] sharedInstance];
      BOOL v21 = [v17 zoomScrollWheelKbShortcutEnabled] == 0;
      uint64_t v22 = 14;
      goto LABEL_25;
    }
LABEL_29:
    int64_t v16 = 16;
    goto LABEL_30;
  }
  int v15 = [v13 keyCode];

  int64_t v16 = 15;
  if (v15 > 45)
  {
    switch(v15)
    {
      case 'O':
        v17 = [MEMORY[0x263F22938] sharedInstance];
        BOOL v21 = [v17 zoomPanZoomKbShortcutEnabled] == 0;
        uint64_t v22 = 7;
        goto LABEL_25;
      case 'P':
        v17 = [MEMORY[0x263F22938] sharedInstance];
        BOOL v21 = [v17 zoomPanZoomKbShortcutEnabled] == 0;
        uint64_t v22 = 6;
        goto LABEL_25;
      case 'Q':
        v17 = [MEMORY[0x263F22938] sharedInstance];
        BOOL v21 = [v17 zoomPanZoomKbShortcutEnabled] == 0;
        uint64_t v22 = 9;
        goto LABEL_25;
      case 'R':
        v17 = [MEMORY[0x263F22938] sharedInstance];
        BOOL v21 = [v17 zoomPanZoomKbShortcutEnabled] == 0;
        uint64_t v22 = 8;
        goto LABEL_25;
      default:
        if (v15 != 46) {
          goto LABEL_30;
        }
        v17 = [MEMORY[0x263F22938] sharedInstance];
        if ([v17 zoomAdjustZoomLevelKbShortcutEnabled]) {
          int64_t v16 = 0;
        }
        else {
          int64_t v16 = 16;
        }
        break;
    }
    goto LABEL_28;
  }
  switch(v15)
  {
    case 9:
      v17 = [MEMORY[0x263F22938] sharedInstance];
      BOOL v21 = [v17 zoomSwitchZoomModeKbShortcutEnabled] == 0;
      uint64_t v22 = 4;
      goto LABEL_25;
    case 37:
      v17 = [MEMORY[0x263F22938] sharedInstance];
      BOOL v21 = [v17 zoomToggleZoomKbShortcutEnabled] == 0;
      uint64_t v22 = 2;
LABEL_25:
      if (v21) {
        int64_t v16 = 16;
      }
      else {
        int64_t v16 = v22;
      }
      goto LABEL_28;
    case 45:
      v17 = [MEMORY[0x263F22938] sharedInstance];
      if ([v17 zoomAdjustZoomLevelKbShortcutEnabled]) {
        int64_t v16 = 1;
      }
      else {
        int64_t v16 = 16;
      }
LABEL_28:

      break;
  }
LABEL_30:

  return v16;
}

- (BOOL)inUnitTestMode
{
  return self->_inUnitTestMode;
}

- (void)setInUnitTestMode:(BOOL)a3
{
  self->_inUnitTestMode = a3;
}

@end
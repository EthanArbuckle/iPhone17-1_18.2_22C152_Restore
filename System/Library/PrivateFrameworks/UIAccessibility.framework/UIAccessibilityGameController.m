@interface UIAccessibilityGameController
+ (UIAccessibilityGameController)sharedGameController;
- (GCController)controller;
- (UIAccessibilityGameController)init;
- (UIAccessibilityGamepadEventSource)eventSource;
- (id)identifier;
- (id)productCategory;
- (id)vendorName;
- (void)init;
- (void)pressButton:(id)a3;
- (void)setController:(id)a3;
- (void)setEventSource:(id)a3;
@end

@implementation UIAccessibilityGameController

+ (UIAccessibilityGameController)sharedGameController
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__UIAccessibilityGameController_sharedGameController__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedGameController_onceToken != -1) {
    dispatch_once(&sharedGameController_onceToken, block);
  }
  v2 = (void *)SharedController;

  return (UIAccessibilityGameController *)v2;
}

uint64_t __53__UIAccessibilityGameController_sharedGameController__block_invoke()
{
  SharedController = objc_opt_new();

  return MEMORY[0x1F41817F8]();
}

- (UIAccessibilityGameController)init
{
  v30[2] = *MEMORY[0x1E4F143B8];
  v20.receiver = self;
  v20.super_class = (Class)UIAccessibilityGameController;
  v2 = [(UIAccessibilityGameController *)&v20 init];
  if (v2)
  {
    v3 = objc_opt_new();
    uint64_t v4 = objc_opt_new();
    eventSource = v2->_eventSource;
    v2->_eventSource = (UIAccessibilityGamepadEventSource *)v4;

    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x2050000000;
    v6 = (void *)getGCExtendedGamepadClass_softClass;
    v29 = (void *)getGCExtendedGamepadClass_softClass;
    if (!getGCExtendedGamepadClass_softClass)
    {
      uint64_t v21 = MEMORY[0x1E4F143A8];
      uint64_t v22 = 3221225472;
      v23 = __getGCExtendedGamepadClass_block_invoke;
      v24 = &unk_1E59B89A0;
      v25 = &v26;
      __getGCExtendedGamepadClass_block_invoke((uint64_t)&v21);
      v6 = (void *)v27[3];
    }
    v7 = v6;
    _Block_object_dispose(&v26, 8);
    v8 = (void *)[[v7 alloc] initWithIdentifier:@"Apple Virtual Game Controller"];
    [v8 setGamepadEventSource:v2->_eventSource];
    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x2050000000;
    v9 = (void *)getGCControllerClass_softClass;
    v29 = (void *)getGCControllerClass_softClass;
    if (!getGCControllerClass_softClass)
    {
      uint64_t v21 = MEMORY[0x1E4F143A8];
      uint64_t v22 = 3221225472;
      v23 = __getGCControllerClass_block_invoke;
      v24 = &unk_1E59B89A0;
      v25 = &v26;
      __getGCControllerClass_block_invoke((uint64_t)&v21);
      v9 = (void *)v27[3];
    }
    v10 = v9;
    _Block_object_dispose(&v26, 8);
    id v11 = [v10 alloc];
    v30[0] = v3;
    v30[1] = v8;
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];
    uint64_t v13 = [v11 initWithComponents:v12];
    controller = v2->_controller;
    v2->_controller = (GCController *)v13;

    v15 = v2->_controller;
    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x2020000000;
    v16 = (void (*)(GCController *))get_publishCustomControllerSymbolLoc_ptr;
    v29 = get_publishCustomControllerSymbolLoc_ptr;
    if (!get_publishCustomControllerSymbolLoc_ptr)
    {
      uint64_t v21 = MEMORY[0x1E4F143A8];
      uint64_t v22 = 3221225472;
      v23 = __get_publishCustomControllerSymbolLoc_block_invoke;
      v24 = &unk_1E59B89A0;
      v25 = &v26;
      v17 = (void *)GameControllerLibrary();
      v18 = dlsym(v17, "_publishCustomController");
      *(void *)(v25[1] + 24) = v18;
      get_publishCustomControllerSymbolLoc_ptr = *(_UNKNOWN **)(v25[1] + 24);
      v16 = (void (*)(GCController *))v27[3];
    }
    _Block_object_dispose(&v26, 8);
    if (!v16) {
      -[UIAccessibilityGameController init]();
    }
    v16(v15);
  }
  return v2;
}

- (id)vendorName
{
  return @"Apple";
}

- (id)productCategory
{
  return @"Accessibility Game Controller";
}

- (id)identifier
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"Accessibility game controller %p", self);
}

- (void)pressButton:(id)a3
{
  id v4 = a3;
  get_GCGamepadEventImplClass();
  v5 = objc_opt_new();
  switch([v4 button])
  {
    case 1:
      LODWORD(v6) = 1.0;
      [v5 setButtonAValue:v6];
      break;
    case 2:
      LODWORD(v6) = 1.0;
      [v5 setButtonBValue:v6];
      break;
    case 3:
      LODWORD(v6) = 1.0;
      [v5 setButtonXValue:v6];
      break;
    case 4:
      LODWORD(v6) = 1.0;
      [v5 setButtonYValue:v6];
      break;
    case 5:
      LODWORD(v6) = 1.0;
      [v5 setButtonLeftShoulder:v6];
      break;
    case 6:
      LODWORD(v6) = 1.0;
      [v5 setLeftTrigger:v6];
      break;
    case 7:
      LODWORD(v6) = 1.0;
      [v5 setButtonRightShoulder:v6];
      break;
    case 8:
      LODWORD(v6) = 1.0;
      [v5 setRightTrigger:v6];
      break;
    case 9:
      LODWORD(v6) = 1.0;
      [v5 setDpadUpValue:v6];
      break;
    case 10:
      LODWORD(v6) = 1.0;
      [v5 setDpadDownValue:v6];
      break;
    case 11:
      LODWORD(v6) = 1.0;
      [v5 setDpadLeftValue:v6];
      break;
    case 12:
      LODWORD(v6) = 1.0;
      [v5 setDpadRightValue:v6];
      break;
    case 13:
      [v4 xMagnitude];
      float v8 = v7;
      [v4 yMagnitude];
      float v10 = *(float *)&v9;
      if (v8 <= 0.0)
      {
        *(float *)&double v9 = fabsf(v8);
        [v5 setLeftThumbstickLeft:v9];
      }
      else
      {
        *(float *)&double v9 = v8;
        [v5 setLeftThumbstickRight:v9];
      }
      if (v10 <= 0.0)
      {
        *(float *)&double v11 = fabsf(v10);
        [v5 setLeftThumbstickDown:v11];
      }
      else
      {
        *(float *)&double v11 = v10;
        [v5 setLeftThumbstickUp:v11];
      }
      break;
    case 14:
      [v4 xMagnitude];
      float v13 = v12;
      [v4 yMagnitude];
      float v15 = *(float *)&v14;
      if (v13 <= 0.0)
      {
        *(float *)&double v14 = fabsf(v13);
        [v5 setRightThumbstickLeft:v14];
      }
      else
      {
        *(float *)&double v14 = v13;
        [v5 setRightThumbstickRight:v14];
      }
      if (v15 <= 0.0)
      {
        *(float *)&double v16 = fabsf(v15);
        [v5 setRightThumbstickDown:v16];
      }
      else
      {
        *(float *)&double v16 = v15;
        [v5 setRightThumbstickUp:v16];
      }
      break;
    default:
      break;
  }
  v17 = [(UIAccessibilityGameController *)self eventSource];
  [v17 publishGamepadEvent:v5];
  objc_super v20 = v4;
  uint64_t v21 = v17;
  id v18 = v17;
  id v19 = v4;
  AXPerformBlockOnMainThreadAfterDelay();
}

void __45__UIAccessibilityGameController_pressButton___block_invoke(uint64_t a1)
{
  get_GCGamepadEventImplClass();
  id v2 = (id)objc_opt_new();
  switch([*(id *)(a1 + 32) button])
  {
    case 1:
      [v2 setButtonAValue:0.0];
      break;
    case 2:
      [v2 setButtonBValue:0.0];
      break;
    case 3:
      [v2 setButtonXValue:0.0];
      break;
    case 4:
      [v2 setButtonYValue:0.0];
      break;
    case 5:
      [v2 setButtonLeftShoulder:0.0];
      break;
    case 6:
      [v2 setLeftTrigger:0.0];
      break;
    case 7:
      [v2 setButtonRightShoulder:0.0];
      break;
    case 8:
      [v2 setRightTrigger:0.0];
      break;
    case 9:
      [v2 setDpadUpValue:0.0];
      break;
    case 10:
      [v2 setDpadDownValue:0.0];
      break;
    case 11:
      [v2 setDpadLeftValue:0.0];
      break;
    case 12:
      [v2 setDpadRightValue:0.0];
      break;
    case 13:
      [v2 setLeftThumbstickUp:0.0];
      [v2 setLeftThumbstickDown:0.0];
      [v2 setLeftThumbstickLeft:0.0];
      [v2 setLeftThumbstickRight:0.0];
      break;
    case 14:
      [v2 setRightThumbstickUp:0.0];
      [v2 setRightThumbstickDown:0.0];
      [v2 setRightThumbstickLeft:0.0];
      [v2 setRightThumbstickRight:0.0];
      break;
    default:
      break;
  }
  [*(id *)(a1 + 40) publishGamepadEvent:v2];
}

- (UIAccessibilityGamepadEventSource)eventSource
{
  return self->_eventSource;
}

- (void)setEventSource:(id)a3
{
}

- (GCController)controller
{
  return self->_controller;
}

- (void)setController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controller, 0);

  objc_storeStrong((id *)&self->_eventSource, 0);
}

- (void)init
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"BOOL _publishCustomControllerSoft(GCController *__strong)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"UIAccessibilityGameController.m", 21, @"%s", dlerror());

  __break(1u);
}

@end
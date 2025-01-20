@interface PNPWizardViewController
+ (CGSize)preferredContentSize;
- (BOOL)_canShowWhileLocked;
- (BOOL)didCreateFindMyCoordinator;
- (BOOL)hasScribbleKeyboard;
- (BOOL)showingWhatsNew;
- (FMUIAccessoryOnboardingCoordinator)findMyCoordinator;
- (NSArray)controllerQueue;
- (PKTextInputSettings)textInputSettings;
- (PNPDeviceState)deviceState;
- (PNPWizardViewDelegate)wizardDelegate;
- (UIColor)backgroundColor;
- (id)controllerForType:(int64_t)a3 buttonType:(int64_t)a4;
- (id)createControllerPlanForDeviceType:(int64_t)a3 isWhatsNew:(BOOL)a4;
- (id)createOnboardingControllerWithPencilUUID:(id)a3;
- (id)fullEducationControllerQueueForType:(int64_t)a3;
- (id)welcomeControllerWithType:(int64_t)a3 buttonType:(int64_t)a4 deviceType:(int64_t)a5;
- (id)whatsNewControllerQueueForType:(int64_t)a3;
- (int64_t)controllerIndex;
- (int64_t)deviceType;
- (void)didCompleteAccessoryOnboarding:(id)a3 pairingSuccessful:(BOOL)a4;
- (void)exit;
- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5;
- (void)prepareForPresentation;
- (void)prewarmFMUIController;
- (void)prewarmFMUIControllerIfNecessary;
- (void)processNextController;
- (void)setBackgroundColor:(id)a3;
- (void)setControllerIndex:(int64_t)a3;
- (void)setControllerQueue:(id)a3;
- (void)setDeviceState:(id)a3;
- (void)setDeviceType:(int64_t)a3;
- (void)setDidCreateFindMyCoordinator:(BOOL)a3;
- (void)setFindMyCoordinator:(id)a3;
- (void)setHasScribbleKeyboard:(BOOL)a3;
- (void)setShowingWhatsNew:(BOOL)a3;
- (void)setTextInputSettings:(id)a3;
- (void)setWizardDelegate:(id)a3;
- (void)showFindMyController;
- (void)viewDidLoad;
@end

@implementation PNPWizardViewController

- (void)didCompleteAccessoryOnboarding:(id)a3 pairingSuccessful:(BOOL)a4
{
  -[PNPWizardViewController setFindMyCoordinator:](self, "setFindMyCoordinator:", 0, a4);
  [(PNPWizardViewController *)self processNextController];
}

- (void)viewDidLoad
{
  v3 = os_log_create("com.apple.pencilpairingui", "");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2397CD000, v3, OS_LOG_TYPE_DEFAULT, "Did load wizard view controller", buf, 2u);
  }

  v12.receiver = self;
  v12.super_class = (Class)PNPWizardViewController;
  [(PNPWizardViewController *)&v12 viewDidLoad];
  v4 = [(PNPWizardViewController *)self navigationBar];
  [v4 setBarStyle:4];

  v5 = [(PNPWizardViewController *)self navigationBar];
  id v6 = objc_alloc_init(MEMORY[0x263F1C6B0]);
  [v5 setBackgroundImage:v6 forBarMetrics:0];

  id v7 = objc_alloc_init(MEMORY[0x263F1C6B0]);
  v8 = [(PNPWizardViewController *)self navigationBar];
  [v8 setShadowImage:v7];

  v9 = [(PNPWizardViewController *)self navigationBar];
  [v9 setTranslucent:1];

  [(PNPWizardViewController *)self setDelegate:self];
  v10 = [MEMORY[0x263F14BF0] sharedSettings];
  [(PNPWizardViewController *)self setTextInputSettings:v10];

  v11 = [(PNPWizardViewController *)self textInputSettings];
  -[PNPWizardViewController setHasScribbleKeyboard:](self, "setHasScribbleKeyboard:", [v11 supportedKeyboardLocaleExists]);

  [(PNPWizardViewController *)self setModalPresentationStyle:1];
  [(PNPWizardViewController *)self setControllerIndex:-1];
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v10 = [v7 viewControllers];
    v11 = [v10 lastObject];

    uint64_t v12 = [v11 controllerType];
    v13 = [(PNPWizardViewController *)self controllerQueue];
    v14 = [NSNumber numberWithInteger:v12];
    uint64_t v15 = [v13 indexOfObject:v14];

    v16 = os_log_create("com.apple.pencilpairingui", "");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 134217984;
      uint64_t v18 = v15;
      _os_log_impl(&dword_2397CD000, v16, OS_LOG_TYPE_DEFAULT, "Setting index for PNPWelcomeController: %ld", (uint8_t *)&v17, 0xCu);
    }

    [(PNPWizardViewController *)self setControllerIndex:v15];
  }
}

- (PNPDeviceState)deviceState
{
  v3 = [(PNPWizardViewController *)self wizardDelegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    v5 = [(PNPWizardViewController *)self wizardDelegate];
    id v6 = [v5 deviceState];
  }
  else
  {
    id v6 = 0;
  }
  return (PNPDeviceState *)v6;
}

- (void)prepareForPresentation
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v3 = [(PNPWizardViewController *)self wizardDelegate];
  uint64_t v4 = [v3 shouldShowWhatsNewController];
  if (objc_opt_respondsToSelector()) {
    uint64_t v5 = [v3 deviceType];
  }
  else {
    uint64_t v5 = 2;
  }
  if (objc_opt_respondsToSelector())
  {
    id v6 = [v3 deviceState];
    [(PNPWizardViewController *)self setDeviceState:v6];
  }
  [(PNPWizardViewController *)self setShowingWhatsNew:v4];
  [(PNPWizardViewController *)self setDeviceType:v5];
  id v7 = os_log_create("com.apple.pencilpairingui", "");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 134218240;
    uint64_t v11 = v5;
    __int16 v12 = 1024;
    int v13 = v4;
    _os_log_impl(&dword_2397CD000, v7, OS_LOG_TYPE_DEFAULT, "PNPWizardViewController prepareForPresentation. Device type: %ld, shouldShowWhatsNew: %d", (uint8_t *)&v10, 0x12u);
  }

  id v8 = [(PNPWizardViewController *)self createControllerPlanForDeviceType:v5 isWhatsNew:v4];
  [(PNPWizardViewController *)self setControllerQueue:v8];

  if ([(PNPWizardViewController *)self deviceType] == 4)
  {
    v9 = +[PNPSqueezeThresholdController sharedController];
    [v9 initializeToDefaultThresholdIfUninitialized];
  }
  [(PNPWizardViewController *)self prewarmFMUIControllerIfNecessary];
  [(PNPWizardViewController *)self processNextController];
}

- (void)processNextController
{
  uint64_t v3 = [(PNPWizardViewController *)self controllerIndex];
  uint64_t v4 = [(PNPWizardViewController *)self controllerQueue];
  uint64_t v5 = [v4 count];

  BOOL v7 = v3 < 0 && v5 > 0;
  if (v7)
  {
    id v8 = [(PNPWizardViewController *)self controllerQueue];
    v9 = [v8 objectAtIndexedSubscript:0];
    uint64_t v10 = 0;
LABEL_12:
    uint64_t v11 = [v9 integerValue];

    goto LABEL_13;
  }
  uint64_t v11 = 0;
  uint64_t v10 = -1;
  if ((v3 & 0x8000000000000000) == 0 && v3 < v5 - 1)
  {
    uint64_t v10 = v3 + 1;
    id v8 = [(PNPWizardViewController *)self controllerQueue];
    v9 = [v8 objectAtIndexedSubscript:v10];
    goto LABEL_12;
  }
LABEL_13:
  [(PNPWizardViewController *)self setControllerIndex:v10];
  if (v10 == -1 || v11 == 7)
  {
    [(PNPWizardViewController *)self exit];
  }
  else if (v11 == 5)
  {
    [(PNPWizardViewController *)self showFindMyController];
  }
  else
  {
    if (v10 == v5 - 1) {
      uint64_t v12 = 2;
    }
    else {
      uint64_t v12 = 1;
    }
    int v13 = +[PNPWelcomeController controllerWithType:v11 buttonType:v12 deviceType:[(PNPWizardViewController *)self deviceType] delegate:self];
    uint64_t v14 = [(PNPWizardViewController *)self wizardDelegate];

    if (v14)
    {
      uint64_t v15 = [(PNPWizardViewController *)self wizardDelegate];
      v16 = [v15 backgroundColorForWizardController:self];
      int v17 = [v13 view];
      [v17 setBackgroundColor:v16];
    }
    if (v7)
    {
      uint64_t v18 = (void *)MEMORY[0x263F1CB60];
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __48__PNPWizardViewController_processNextController__block_invoke;
      v19[3] = &unk_264DA5830;
      v19[4] = self;
      id v20 = v13;
      [v18 performWithoutAnimation:v19];
    }
    else
    {
      [(PNPWizardViewController *)self pushViewController:v13 animated:1];
    }
  }
}

void __48__PNPWizardViewController_processNextController__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) pushViewController:*(void *)(a1 + 40) animated:0];
  v2 = [*(id *)(a1 + 40) view];
  [v2 setNeedsLayout];

  id v3 = [*(id *)(a1 + 40) view];
  [v3 layoutIfNeeded];
}

- (void)exit
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = os_log_create("com.apple.pencilpairingui", "");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2397CD000, v3, OS_LOG_TYPE_DEFAULT, "PNPWizardController exit", buf, 2u);
  }

  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.sharingd"];
  *(void *)buf = 0;
  int v13 = buf;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  char v15 = [v4 BOOLForKey:@"hasSeenScribbleEducationPanelsKey"];
  uint64_t v5 = [(PNPWizardViewController *)self controllerQueue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __31__PNPWizardViewController_exit__block_invoke;
  v11[3] = &unk_264DA5BE0;
  v11[4] = buf;
  [v5 enumerateObjectsUsingBlock:v11];

  [v4 setBool:1 forKey:@"hasEverShownEduUI"];
  id v6 = os_log_create("com.apple.pencilpairingui", "");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_2397CD000, v6, OS_LOG_TYPE_DEFAULT, "Setting PPUIHasShownEducationUIKey", v16, 2u);
  }

  [v4 setBool:v13[24] forKey:@"hasSeenScribbleEducationPanelsKey"];
  BOOL v7 = os_log_create("com.apple.pencilpairingui", "");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = v13[24];
    *(_DWORD *)v16 = 67109120;
    int v17 = v8;
    _os_log_impl(&dword_2397CD000, v7, OS_LOG_TYPE_DEFAULT, "Setting PPUIHasSeenScribbleEducationPanelsKey: %d", v16, 8u);
  }

  [v4 setInteger:2 forKey:@"lastSeenWhatsNewVersionKey"];
  v9 = os_log_create("com.apple.pencilpairingui", "");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v16 = 67109120;
    int v17 = 2;
    _os_log_impl(&dword_2397CD000, v9, OS_LOG_TYPE_DEFAULT, "Setting PPUILastSeenWhatsNewVersionKey: %d", v16, 8u);
  }

  [v4 synchronize];
  uint64_t v10 = [(PNPWizardViewController *)self wizardDelegate];
  [v10 wizardViewRequestsDismiss:self];

  _Block_object_dispose(buf, 8);
}

void __31__PNPWizardViewController_exit__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  if (*(unsigned char *)(v4 + 24))
  {
    char v5 = 1;
  }
  else
  {
    id v9 = v3;
    BOOL v6 = [v3 integerValue] == 3;
    id v3 = v9;
    char v5 = v6;
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  }
  *(unsigned char *)(v4 + 24) = v5;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  if (*(unsigned char *)(v7 + 24))
  {
    char v8 = 1;
  }
  else
  {
    id v10 = v3;
    BOOL v6 = [v3 integerValue] == 1;
    id v3 = v10;
    char v8 = v6;
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  }
  *(unsigned char *)(v7 + 24) = v8;
}

- (void)prewarmFMUIControllerIfNecessary
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = [(PNPWizardViewController *)self controllerQueue];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        if ([*(id *)(*((void *)&v8 + 1) + 8 * i) integerValue] == 5)
        {
          [(PNPWizardViewController *)self prewarmFMUIController];
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (void)setFindMyCoordinator:(id)a3
{
  p_findMyCoordinator = &self->_findMyCoordinator;
  objc_storeStrong((id *)&self->_findMyCoordinator, a3);
  BOOL v5 = [(PNPWizardViewController *)self didCreateFindMyCoordinator]
    || *p_findMyCoordinator != 0;
  [(PNPWizardViewController *)self setDidCreateFindMyCoordinator:v5];
}

- (void)prewarmFMUIController
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2397CD000, log, OS_LOG_TYPE_ERROR, "Prewarm Error: nil pencilUUID needed create AccessoryOnboardingCoordinator", v1, 2u);
}

- (id)createOnboardingControllerWithPencilUUID:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)MEMORY[0x263F1C6B0];
  uint64_t v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v7 = [v5 imageNamed:@"PencilFindMyPin" inBundle:v6];

  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2050000000;
  long long v8 = (void *)getFMUIDiscoveredAccessoryClass_softClass;
  uint64_t v23 = getFMUIDiscoveredAccessoryClass_softClass;
  if (!getFMUIDiscoveredAccessoryClass_softClass)
  {
    uint64_t v15 = MEMORY[0x263EF8330];
    uint64_t v16 = 3221225472;
    int v17 = __getFMUIDiscoveredAccessoryClass_block_invoke;
    uint64_t v18 = &unk_264DA5C08;
    uint64_t v19 = &v20;
    __getFMUIDiscoveredAccessoryClass_block_invoke((uint64_t)&v15);
    long long v8 = (void *)v21[3];
  }
  long long v9 = v8;
  _Block_object_dispose(&v20, 8);
  long long v10 = (void *)[[v9 alloc] initWithIdentifier:v4 productType:2 productImage:v7];
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2050000000;
  long long v11 = (void *)getFMUIAccessoryOnboardingCoordinatorClass_softClass;
  uint64_t v23 = getFMUIAccessoryOnboardingCoordinatorClass_softClass;
  if (!getFMUIAccessoryOnboardingCoordinatorClass_softClass)
  {
    uint64_t v15 = MEMORY[0x263EF8330];
    uint64_t v16 = 3221225472;
    int v17 = __getFMUIAccessoryOnboardingCoordinatorClass_block_invoke;
    uint64_t v18 = &unk_264DA5C08;
    uint64_t v19 = &v20;
    __getFMUIAccessoryOnboardingCoordinatorClass_block_invoke((uint64_t)&v15);
    long long v11 = (void *)v21[3];
  }
  uint64_t v12 = v11;
  _Block_object_dispose(&v20, 8);
  uint64_t v13 = (void *)[[v12 alloc] initWithPresenter:self accessory:v10];

  return v13;
}

- (void)showFindMyController
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2397CD000, log, OS_LOG_TYPE_ERROR, "ShowFindMyController Error: nil pencilUUID for FMUIDiscoveredAccessory needed create FMUIAccessoryOnboardingCoordinator", v1, 2u);
}

- (id)controllerForType:(int64_t)a3 buttonType:(int64_t)a4
{
  int64_t v7 = [(PNPWizardViewController *)self deviceType];
  return +[PNPWelcomeController controllerWithType:a3 buttonType:a4 deviceType:v7 delegate:self];
}

- (id)createControllerPlanForDeviceType:(int64_t)a3 isWhatsNew:(BOOL)a4
{
  if (a4) {
    [(PNPWizardViewController *)self whatsNewControllerQueueForType:a3];
  }
  else {
  BOOL v5 = [(PNPWizardViewController *)self fullEducationControllerQueueForType:a3];
  }
  if (![(PNPWizardViewController *)self hasScribbleKeyboard])
  {
    uint64_t v6 = (void *)[v5 mutableCopy];
    [v6 removeObject:&unk_26ECE7828];
    uint64_t v7 = [v6 copy];

    BOOL v5 = (void *)v7;
  }
  return v5;
}

- (id)whatsNewControllerQueueForType:(int64_t)a3
{
  if ((unint64_t)a3 > 4) {
    return 0;
  }
  else {
    return (id)qword_264DA5C60[a3];
  }
}

- (id)fullEducationControllerQueueForType:(int64_t)a3
{
  if ((unint64_t)a3 > 4) {
    return 0;
  }
  else {
    return (id)qword_264DA5C88[a3];
  }
}

+ (CGSize)preferredContentSize
{
  [MEMORY[0x263F5B918] preferredContentSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)welcomeControllerWithType:(int64_t)a3 buttonType:(int64_t)a4 deviceType:(int64_t)a5
{
  uint64_t v6 = +[PNPWelcomeController controllerWithType:a3 buttonType:a4 deviceType:a5 delegate:self];
  uint64_t v7 = [(PNPWizardViewController *)self wizardDelegate];

  if (v7)
  {
    long long v8 = [(PNPWizardViewController *)self wizardDelegate];
    long long v9 = [v8 backgroundColorForWizardController:self];
    long long v10 = [v6 view];
    [v10 setBackgroundColor:v9];
  }
  return v6;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (PNPWizardViewDelegate)wizardDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_wizardDelegate);
  return (PNPWizardViewDelegate *)WeakRetained;
}

- (void)setWizardDelegate:(id)a3
{
}

- (BOOL)showingWhatsNew
{
  return self->_showingWhatsNew;
}

- (void)setShowingWhatsNew:(BOOL)a3
{
  self->_showingWhatsNew = a3;
}

- (int64_t)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(int64_t)a3
{
  self->_deviceType = a3;
}

- (void)setDeviceState:(id)a3
{
}

- (PKTextInputSettings)textInputSettings
{
  return self->_textInputSettings;
}

- (void)setTextInputSettings:(id)a3
{
}

- (NSArray)controllerQueue
{
  return self->_controllerQueue;
}

- (void)setControllerQueue:(id)a3
{
}

- (int64_t)controllerIndex
{
  return self->_controllerIndex;
}

- (void)setControllerIndex:(int64_t)a3
{
  self->_controllerIndex = a3;
}

- (BOOL)hasScribbleKeyboard
{
  return self->_hasScribbleKeyboard;
}

- (void)setHasScribbleKeyboard:(BOOL)a3
{
  self->_hasScribbleKeyboard = a3;
}

- (BOOL)didCreateFindMyCoordinator
{
  return self->_didCreateFindMyCoordinator;
}

- (void)setDidCreateFindMyCoordinator:(BOOL)a3
{
  self->_didCreateFindMyCoordinator = a3;
}

- (FMUIAccessoryOnboardingCoordinator)findMyCoordinator
{
  return self->_findMyCoordinator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_findMyCoordinator, 0);
  objc_storeStrong((id *)&self->_controllerQueue, 0);
  objc_storeStrong((id *)&self->_textInputSettings, 0);
  objc_storeStrong((id *)&self->_deviceState, 0);
  objc_destroyWeak((id *)&self->_wizardDelegate);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end
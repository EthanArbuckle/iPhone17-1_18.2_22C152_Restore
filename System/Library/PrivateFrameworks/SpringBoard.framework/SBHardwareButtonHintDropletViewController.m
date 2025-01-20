@interface SBHardwareButtonHintDropletViewController
- (BOOL)_canShowWhileLocked;
- (SBHardwareButtonHintDropletViewController)init;
- (SBHardwareButtonHintDropletViewControllerDelegate)delegate;
- (id)_configurationForButton:(int64_t)a3 stage:(unint64_t)a4;
- (id)_existingOrNewDropletStateForButton:(int64_t)a3;
- (id)activateHintDropletForButton:(int64_t)a3;
- (id)associateHintView:(id)a3 withButton:(int64_t)a4;
- (id)setDropletLayoutCallback:(id)a3 forButton:(int64_t)a4;
- (unint64_t)keylineStyle;
- (unint64_t)supportedInterfaceOrientations;
- (void)_activateButtonAssertionDidInvalidate:(id)a3 forButton:(int64_t)a4;
- (void)_applyButtonState:(id)a3 animated:(BOOL)a4;
- (void)_applyButtonState:(id)a3 animated:(BOOL)a4 checkForIdle:(BOOL)a5;
- (void)_applyStateForExistingButton:(int64_t)a3 animated:(BOOL)a4 checkForIdle:(BOOL)a5;
- (void)_associateHintViewAssertionDidInvalidate:(id)a3 forView:(id)a4 forButton:(int64_t)a5;
- (void)_displayLinkCallback:(id)a3;
- (void)_dropletLayoutCallbackAssertionDidInvalidate:(id)a3 forCallback:(id)a4 forButton:(int64_t)a5;
- (void)_startIdleTimer;
- (void)_updateDisplayLink;
- (void)_updateSnapshotVisibility;
- (void)dealloc;
- (void)loadView;
- (void)setDelegate:(id)a3;
- (void)setKeylineStyle:(unint64_t)a3;
- (void)updateHintContentVisibility:(int64_t)a3 forButton:(int64_t)a4 animationSettings:(id)a5;
- (void)viewDidLoad;
@end

@implementation SBHardwareButtonHintDropletViewController

- (void)dealloc
{
  [(CADisplayLink *)self->_displayLink invalidate];
  displayLink = self->_displayLink;
  self->_displayLink = 0;

  v4.receiver = self;
  v4.super_class = (Class)SBHardwareButtonHintDropletViewController;
  [(SBHardwareButtonHintDropletViewController *)&v4 dealloc];
}

- (SBHardwareButtonHintDropletViewController)init
{
  v8.receiver = self;
  v8.super_class = (Class)SBHardwareButtonHintDropletViewController;
  v2 = [(SBHardwareButtonHintDropletViewController *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    buttonStates = v2->_buttonStates;
    v2->_buttonStates = (NSMutableDictionary *)v3;

    uint64_t v5 = +[SBButtonBezelGeometryInfo buttonBezelGeometryInfoForCurrentEmbeddedDisplayBezel];
    buttonGeometryInfo = v2->_buttonGeometryInfo;
    v2->_buttonGeometryInfo = (SBButtonBezelGeometryInfo *)v5;

    v2->_keylineStyle = 0;
  }
  return v2;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)loadView
{
  [(SBHardwareButtonHintDropletViewController *)self _defaultInitialViewFrame];
  id v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4FA6028]), "initWithFrame:", v3, v4, v5, v6);
  [v7 setOpaque:0];
  [(SBHardwareButtonHintDropletViewController *)self setView:v7];
}

- (void)viewDidLoad
{
  v19.receiver = self;
  v19.super_class = (Class)SBHardwareButtonHintDropletViewController;
  [(SBHardwareButtonHintDropletViewController *)&v19 viewDidLoad];
  double v3 = [(SBHardwareButtonHintDropletViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  v12 = (DRPDropletContextView *)objc_msgSend(objc_alloc(MEMORY[0x1E4F5FA10]), "initWithFrame:", v5, v7, v9, v11);
  dropletContextView = self->_dropletContextView;
  self->_dropletContextView = v12;

  v14 = [(SBHardwareButtonHintDropletViewController *)self view];
  [v14 addSubview:self->_dropletContextView];

  [(DRPDropletContextView *)self->_dropletContextView setAutoresizingMask:18];
  v15 = (DRPDropletAnimationCoordinator *)objc_alloc_init(MEMORY[0x1E4F5FA08]);
  animator = self->_animator;
  self->_animator = v15;

  v17 = [(SBHardwareButtonHintDropletViewController *)self view];
  [v17 setNeedsLayout];

  v18 = [(SBHardwareButtonHintDropletViewController *)self view];
  [v18 layoutIfNeeded];
}

- (id)activateHintDropletForButton:(int64_t)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (a3 == 10)
  {
    double v3 = 0;
  }
  else
  {
    double v7 = SBLogButtonHintingUI();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      int64_t v23 = a3;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "Hint Droplet Activating: %ld", buf, 0xCu);
    }

    [(NSTimer *)self->_idleTimer invalidate];
    idleTimer = self->_idleTimer;
    self->_idleTimer = 0;

    buttonStates = self->_buttonStates;
    double v10 = [NSNumber numberWithInteger:a3];
    double v11 = [(NSMutableDictionary *)buttonStates objectForKey:v10];

    if (v11)
    {
      id v12 = v11[7];
      v13 = v12;
      if (v12 && [v12 isValid])
      {
        objc_super v19 = objc_msgSend(NSString, "stringWithFormat:", @"activating an already-active button %li", a3);
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          [(SBHardwareButtonHintDropletViewController *)a2 activateHintDropletForButton:(uint64_t)v19];
        }
        [v19 UTF8String];
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x1D8D22D2CLL);
      }
    }
    else
    {
      double v11 = [(SBHardwareButtonHintDropletViewController *)self _existingOrNewDropletStateForButton:a3];
    }
    objc_initWeak((id *)buf, self);
    id v14 = objc_alloc(MEMORY[0x1E4F4F838]);
    v15 = [MEMORY[0x1E4F29128] UUID];
    v16 = [v15 UUIDString];
    id v17 = MEMORY[0x1E4F14428];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __74__SBHardwareButtonHintDropletViewController_activateHintDropletForButton___block_invoke;
    v20[3] = &unk_1E6AF5008;
    objc_copyWeak(v21, (id *)buf);
    v21[1] = (id)a3;
    double v3 = (void *)[v14 initWithIdentifier:v16 forReason:@"activatedButton" queue:MEMORY[0x1E4F14428] invalidationBlock:v20];

    -[SBCameraHardwareButton setForegroundCameraShutterButtonPIDs:]((uint64_t)v11, v3);
    [(SBHardwareButtonHintDropletViewController *)self _applyButtonState:v11 animated:1];
    objc_destroyWeak(v21);
    objc_destroyWeak((id *)buf);
  }
  return v3;
}

void __74__SBHardwareButtonHintDropletViewController_activateHintDropletForButton___block_invoke(uint64_t a1, void *a2)
{
  double v3 = (id *)(a1 + 32);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _activateButtonAssertionDidInvalidate:v4 forButton:*(void *)(a1 + 40)];
}

- (void)_activateButtonAssertionDidInvalidate:(id)a3 forButton:(int64_t)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  buttonStates = self->_buttonStates;
  double v7 = NSNumber;
  id v8 = a3;
  double v9 = [v7 numberWithInteger:a4];
  double v10 = [(NSMutableDictionary *)buttonStates objectForKey:v9];

  if (v10) {
    id v11 = (id)v10[7];
  }
  else {
    id v11 = 0;
  }

  if (v11 && v11 == v8)
  {
    id v12 = SBLogButtonHintingUI();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 134217984;
      int64_t v14 = a4;
      _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "Hint Droplet Deactivating: %ld", (uint8_t *)&v13, 0xCu);
    }

    -[SBCameraHardwareButton setForegroundCameraShutterButtonPIDs:]((uint64_t)v10, 0);
    [(SBHardwareButtonHintDropletViewController *)self _applyButtonState:v10 animated:1];
  }
}

- (id)associateHintView:(id)a3 withButton:(int64_t)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [(NSTimer *)self->_idleTimer invalidate];
  idleTimer = self->_idleTimer;
  self->_idleTimer = 0;

  id v8 = SBLogButtonHintingUI();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    int64_t v38 = a4;
    __int16 v39 = 2112;
    id v40 = v6;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "Hint Droplet: %ld Associating Hint View: %@", buf, 0x16u);
  }

  double v9 = [(SBHardwareButtonHintDropletViewController *)self _existingOrNewDropletStateForButton:a4];
  -[SBCameraHardwareButton setAllCameraShutterButtonPIDs:]((uint64_t)v9, v6);
  double v10 = [(SBHardwareButtonHintDropletViewController *)self view];
  [v10 addSubview:v6];
  unint64_t v11 = [(SBButtonBezelGeometryInfo *)self->_buttonGeometryInfo buttonScreenEdgeForButton:a4];
  buttonGeometryInfo = self->_buttonGeometryInfo;
  int v13 = [MEMORY[0x1E4F42D90] mainScreen];
  [v13 _referenceBounds];
  -[SBButtonBezelGeometryInfo buttonHWRectForButton:onEmbeddedDisplayBounds:](buttonGeometryInfo, "buttonHWRectForButton:onEmbeddedDisplayBounds:", a4);
  double v15 = v14;
  double v17 = v16;

  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  v18 = [v6 centerYAnchor];
  objc_super v19 = [v10 topAnchor];
  v20 = [v18 constraintEqualToAnchor:v19 constant:v15 + v17 * 0.5];
  [v20 setActive:1];

  if (v11 == 8)
  {
    v21 = [v6 leftAnchor];
    v22 = [v10 rightAnchor];
    [v6 bounds];
    uint64_t v24 = [v21 constraintEqualToAnchor:v22 constant:-v25];
  }
  else
  {
    if (v11 != 2) {
      goto LABEL_8;
    }
    v21 = [v6 rightAnchor];
    v22 = [v10 leftAnchor];
    [v6 bounds];
    uint64_t v24 = [v21 constraintEqualToAnchor:v22 constant:v23];
  }
  v26 = v24;
  [v24 setActive:1];

LABEL_8:
  objc_initWeak((id *)buf, self);
  id v27 = objc_alloc(MEMORY[0x1E4F4F838]);
  v28 = [MEMORY[0x1E4F29128] UUID];
  v29 = [v28 UUIDString];
  id v30 = MEMORY[0x1E4F14428];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __74__SBHardwareButtonHintDropletViewController_associateHintView_withButton___block_invoke;
  v34[3] = &unk_1E6B0AA28;
  objc_copyWeak(v36, (id *)buf);
  id v31 = v6;
  id v35 = v31;
  v36[1] = (id)a4;
  v32 = (void *)[v27 initWithIdentifier:v29 forReason:@"associatedHintView" queue:MEMORY[0x1E4F14428] invalidationBlock:v34];

  [(SBHardwareButtonHintDropletViewController *)self _applyButtonState:v9 animated:1];
  objc_destroyWeak(v36);
  objc_destroyWeak((id *)buf);

  return v32;
}

void __74__SBHardwareButtonHintDropletViewController_associateHintView_withButton___block_invoke(uint64_t a1, void *a2)
{
  double v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _associateHintViewAssertionDidInvalidate:v4 forView:*(void *)(a1 + 32) forButton:*(void *)(a1 + 48)];
}

- (void)updateHintContentVisibility:(int64_t)a3 forButton:(int64_t)a4 animationSettings:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  buttonStates = self->_buttonStates;
  double v9 = [NSNumber numberWithInteger:a4];
  uint64_t v10 = [(NSMutableDictionary *)buttonStates objectForKey:v9];

  if (v10)
  {
    id v11 = *(id *)(v10 + 48);
    if (v11)
    {

      goto LABEL_5;
    }
    if (*(void *)(v10 + 40))
    {
LABEL_5:
      if (a3 == 1) {
        uint64_t v12 = 2;
      }
      else {
        uint64_t v12 = 1;
      }
      if (*(void *)(v10 + 64) != v12)
      {
        int v13 = SBLogButtonHintingUI();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          int v15 = 134218240;
          int64_t v16 = a4;
          __int16 v17 = 2048;
          uint64_t v18 = v12;
          _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_DEFAULT, "Hint Droplet: %ld Updated hint presented stage: %ld", (uint8_t *)&v15, 0x16u);
        }

        *(void *)(v10 + 64) = v12;
        [(SBHardwareButtonHintDropletViewController *)self _applyButtonState:v10 animated:1];
      }
      goto LABEL_15;
    }
  }
  double v14 = SBLogButtonHintingUI();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    -[SBHardwareButtonHintDropletViewController updateHintContentVisibility:forButton:animationSettings:](a4, v14);
  }

LABEL_15:
}

- (void)_associateHintViewAssertionDidInvalidate:(id)a3 forView:(id)a4 forButton:(int64_t)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  buttonStates = self->_buttonStates;
  double v9 = [NSNumber numberWithInteger:a5];
  uint64_t v10 = [(NSMutableDictionary *)buttonStates objectForKey:v9];

  if (v10) {
    id v11 = (void *)v10[6];
  }
  else {
    id v11 = 0;
  }
  id v12 = v11;
  int v13 = v12;
  if (v12 && v12 == v7)
  {
    double v14 = SBLogButtonHintingUI();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 134218242;
      int64_t v16 = a5;
      __int16 v17 = 2112;
      id v18 = v7;
      _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_DEFAULT, "Hint Droplet: %ld Disassociating Hint View: %@", (uint8_t *)&v15, 0x16u);
    }

    [v7 removeFromSuperview];
    -[SBCameraHardwareButton setAllCameraShutterButtonPIDs:]((uint64_t)v10, 0);
    if (v10) {
      v10[8] = 1;
    }
    [(SBHardwareButtonHintDropletViewController *)self _applyButtonState:v10 animated:1];
  }
}

- (id)setDropletLayoutCallback:(id)a3 forButton:(int64_t)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [(NSTimer *)self->_idleTimer invalidate];
  idleTimer = self->_idleTimer;
  self->_idleTimer = 0;

  id v8 = SBLogButtonHintingUI();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    int64_t v23 = a4;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "Hint Droplet Setting Layout Callback: %ld", buf, 0xCu);
  }

  double v9 = [(SBHardwareButtonHintDropletViewController *)self _existingOrNewDropletStateForButton:a4];
  id v11 = v9;
  if (v9) {
    objc_setProperty_nonatomic_copy(v9, v10, v6, 40);
  }
  objc_initWeak((id *)buf, self);
  id v12 = objc_alloc(MEMORY[0x1E4F4F838]);
  int v13 = [MEMORY[0x1E4F29128] UUID];
  double v14 = [v13 UUIDString];
  id v15 = MEMORY[0x1E4F14428];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __80__SBHardwareButtonHintDropletViewController_setDropletLayoutCallback_forButton___block_invoke;
  v19[3] = &unk_1E6B0AA50;
  objc_copyWeak(v21, (id *)buf);
  id v16 = v6;
  id v20 = v16;
  v21[1] = (id)a4;
  __int16 v17 = (void *)[v12 initWithIdentifier:v14 forReason:@"setLayoutCallback" queue:MEMORY[0x1E4F14428] invalidationBlock:v19];

  [(SBHardwareButtonHintDropletViewController *)self _applyButtonState:v11 animated:1];
  objc_destroyWeak(v21);
  objc_destroyWeak((id *)buf);

  return v17;
}

void __80__SBHardwareButtonHintDropletViewController_setDropletLayoutCallback_forButton___block_invoke(uint64_t a1, void *a2)
{
  double v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _dropletLayoutCallbackAssertionDidInvalidate:v4 forCallback:*(void *)(a1 + 32) forButton:*(void *)(a1 + 48)];
}

- (void)_dropletLayoutCallbackAssertionDidInvalidate:(id)a3 forCallback:(id)a4 forButton:(int64_t)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  buttonStates = self->_buttonStates;
  id v8 = NSNumber;
  id v9 = a4;
  uint64_t v10 = [v8 numberWithInteger:a5];
  id v11 = [(NSMutableDictionary *)buttonStates objectForKey:v10];

  if (v11) {
    id v12 = (id)v11[5];
  }
  else {
    id v12 = 0;
  }

  if (v12 && v12 == v9)
  {
    int v13 = SBLogButtonHintingUI();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 134217984;
      int64_t v16 = a5;
      _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_DEFAULT, "Hint Droplet Removing Layout Callback: %ld", (uint8_t *)&v15, 0xCu);
    }

    if (v11)
    {
      objc_setProperty_nonatomic_copy(v11, v14, 0, 40);
      v11[8] = 1;
    }
    [(SBHardwareButtonHintDropletViewController *)self _applyButtonState:v11 animated:1];
  }
}

- (id)_existingOrNewDropletStateForButton:(int64_t)a3
{
  buttonStates = self->_buttonStates;
  id v6 = objc_msgSend(NSNumber, "numberWithInteger:");
  id v7 = [(NSMutableDictionary *)buttonStates objectForKey:v6];

  if (v7)
  {
    id v8 = v7;
  }
  else
  {
    if ((unint64_t)(a3 - 3) > 1)
    {
      id v9 = 0;
    }
    else
    {
      id v9 = [(SBHardwareButtonHintDropletViewController *)self _existingOrNewDropletStateForButton:10];
    }
    id v10 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
    id v11 = -[_SBHardwareButtonHintDropletState initWithButton:dropletContextView:contentView:groupState:]((id *)[_SBHardwareButtonHintDropletState alloc], (void *)a3, self->_dropletContextView, v10, v9);
    [(SBHardwareButtonHintDropletViewController *)self _applyButtonState:v11 animated:0 checkForIdle:0];
    id v12 = self->_buttonStates;
    int v13 = [NSNumber numberWithInteger:a3];
    [(NSMutableDictionary *)v12 setObject:v11 forKey:v13];

    id v8 = v11;
  }

  return v8;
}

- (void)_applyStateForExistingButton:(int64_t)a3 animated:(BOOL)a4 checkForIdle:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  buttonStates = self->_buttonStates;
  id v9 = [NSNumber numberWithInteger:a3];
  id v11 = [(NSMutableDictionary *)buttonStates objectForKey:v9];

  id v10 = v11;
  if (v11)
  {
    [(SBHardwareButtonHintDropletViewController *)self _applyButtonState:v11 animated:v6 checkForIdle:v5];
    id v10 = v11;
  }
}

- (void)_applyButtonState:(id)a3 animated:(BOOL)a4
{
}

- (void)_applyButtonState:(id)a3 animated:(BOOL)a4 checkForIdle:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = v8;
  if (v8)
  {
    uint64_t v10 = v8[1];
    if (v10 == 10)
    {
      [(SBHardwareButtonHintDropletViewController *)self _applyStateForExistingButton:3 animated:v6 checkForIdle:0];
      [(SBHardwareButtonHintDropletViewController *)self _applyStateForExistingButton:4 animated:v6 checkForIdle:0];
    }
  }
  else
  {
    uint64_t v10 = 0;
  }
  id v11 = -[_SBHardwareButtonHintDropletState stage](v9);
  id v12 = [(SBHardwareButtonHintDropletViewController *)self _configurationForButton:v10 stage:v11];
  if (v9) {
    int v13 = (void *)v9[3];
  }
  else {
    int v13 = 0;
  }
  id v14 = v13;
  int v15 = v14;
  if (v12 && v14)
  {
    int64_t v16 = SBLogButtonHintingUI();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v26 = NSStringFromSBSHardwareButtonKind();
      int64_t v23 = NSStringFromSBHardwareButtonHintDropletStage((uint64_t)v11);
      uint64_t v24 = NSStringFromSBHardwareButtonHintDropletKeylineStyle(self->_keylineStyle);
      [v12 debugDescription];
      *(_DWORD *)buf = 138413314;
      v33 = v26;
      __int16 v34 = 2112;
      id v35 = v23;
      __int16 v36 = 2112;
      v37 = v24;
      __int16 v38 = 1024;
      BOOL v39 = v6;
      v41 = __int16 v40 = 2112;
      double v25 = (void *)v41;
      _os_log_debug_impl(&dword_1D85BA000, v16, OS_LOG_TYPE_DEBUG, "applying button state for button: %@; stage: %@; keylineStyle: %@; animated:s %{BOOL}u;\nconfiguration: %@",
        buf,
        0x30u);
    }
    [(DRPDropletAnimationCoordinator *)self->_animator applyViewConfiguration:v12 animated:v6 tracking:0 containerView:v15 contextView:self->_dropletContextView];
  }
  if (v9 && v5 && !v9[7] && !v9[6] && !v9[5])
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v17 = [(NSMutableDictionary *)self->_buttonStates objectEnumerator];
    uint64_t v18 = [v17 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v28;
      while (2)
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v28 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          if (!v22 || v22[7] || v22[6] || v22[5])
          {

            goto LABEL_29;
          }
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v27 objects:v31 count:16];
        if (v19) {
          continue;
        }
        break;
      }
    }

    [(SBHardwareButtonHintDropletViewController *)self _startIdleTimer];
  }
LABEL_29:
  [(SBHardwareButtonHintDropletViewController *)self _updateDisplayLink];
  [(SBHardwareButtonHintDropletViewController *)self _updateSnapshotVisibility];
}

- (void)_startIdleTimer
{
  [(NSTimer *)self->_idleTimer invalidate];
  objc_initWeak(&location, self);
  double v3 = (void *)MEMORY[0x1E4F1CB00];
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  id v8 = __60__SBHardwareButtonHintDropletViewController__startIdleTimer__block_invoke;
  id v9 = &unk_1E6AF61A0;
  objc_copyWeak(&v10, &location);
  id v4 = [v3 scheduledTimerWithTimeInterval:0 repeats:&v6 block:3.0];
  idleTimer = self->_idleTimer;
  self->_idleTimer = v4;

  -[NSTimer setTolerance:](self->_idleTimer, "setTolerance:", 0.3, v6, v7, v8, v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __60__SBHardwareButtonHintDropletViewController__startIdleTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    v2 = [WeakRetained delegate];
    [v2 hintDropletViewControllerDidBecomeIdle:v3];

    id WeakRetained = v3;
  }
}

- (void)_updateDisplayLink
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v3 = [(NSMutableDictionary *)self->_buttonStates objectEnumerator];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v19;
    while (2)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v18 + 1) + 8 * v7);
        if (v8)
        {
          id v9 = *(id *)(v8 + 40);
          if (v9)
          {

LABEL_18:
            if (self->_displayLink) {
              return;
            }
            int v13 = SBLogButtonHintingUI();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)uint64_t v17 = 0;
              _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_DEFAULT, "Hint Droplet Starting CADisplayLink", v17, 2u);
            }

            id v14 = [MEMORY[0x1E4F39B68] displayLinkWithTarget:self selector:sel__displayLinkCallback_];
            displayLink = self->_displayLink;
            self->_displayLink = v14;

            int64_t v16 = self->_displayLink;
            id v12 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
            [(CADisplayLink *)v16 addToRunLoop:v12 forMode:*MEMORY[0x1E4F1C4B0]];
            goto LABEL_22;
          }
          if (*(void *)(v8 + 48)) {
            goto LABEL_18;
          }
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v10 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
      uint64_t v5 = v10;
      if (v10) {
        continue;
      }
      break;
    }
  }

  if (self->_displayLink)
  {
    id v11 = SBLogButtonHintingUI();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "Hint Droplet Stopping CADisplayLink", v17, 2u);
    }

    [(CADisplayLink *)self->_displayLink invalidate];
    id v12 = self->_displayLink;
    self->_displayLink = 0;
LABEL_22:
  }
}

- (void)_displayLinkCallback:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (CADisplayLink *)a3;
  if (self->_displayLink == v4)
  {
    v32 = v4;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    uint64_t v5 = [(NSMutableDictionary *)self->_buttonStates objectEnumerator];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (!v6)
    {
      uint64_t v8 = 0;
      goto LABEL_44;
    }
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v40;
    uint64_t v33 = *(void *)v40;
    __int16 v34 = v5;
    while (1)
    {
      uint64_t v10 = 0;
      uint64_t v35 = v7;
      do
      {
        if (*(void *)v40 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v39 + 1) + 8 * v10);
        if (v11)
        {
          uint64_t v12 = *(void *)(v11 + 8);
          unint64_t v13 = (unint64_t)*(id *)(v11 + 40);
          id v14 = *(void **)(v11 + 48);
        }
        else
        {
          unint64_t v13 = 0;
          uint64_t v12 = 0;
          id v14 = 0;
        }
        unint64_t v15 = v14;
        if (!(v13 | v15))
        {
          unint64_t v13 = 0;
          goto LABEL_35;
        }
        if (!v8)
        {
          int64_t v16 = [(SBHardwareButtonHintDropletViewController *)self view];
          uint64_t v8 = [v16 window];
        }
        uint64_t v17 = [(SBButtonBezelGeometryInfo *)self->_buttonGeometryInfo buttonScreenEdgeForButton:v12];
        if (v12 == 10)
        {
          long long v18 = self;
          uint64_t v19 = [(NSMutableDictionary *)self->_buttonStates objectForKey:&unk_1F334B1B0];
          long long v20 = (void *)v19;
          if (v19) {
            long long v21 = *(void **)(v19 + 24);
          }
          else {
            long long v21 = 0;
          }
          id v22 = v21;

          if (v22) {
            double v23 = _offsetOfDropletView(v22, v8, v17);
          }
          else {
            double v23 = 0.0;
          }
          uint64_t v25 = [(NSMutableDictionary *)v18->_buttonStates objectForKey:&unk_1F334B1C8];
          v26 = (void *)v25;
          if (v25) {
            long long v27 = *(void **)(v25 + 24);
          }
          else {
            long long v27 = 0;
          }
          id v28 = v27;

          if (v28) {
            double v29 = _offsetOfDropletView(v28, v8, v17);
          }
          else {
            double v29 = 0.0;
          }
          if (v23 < v29) {
            double v23 = v29;
          }

          self = v18;
          uint64_t v9 = v33;
          uint64_t v5 = v34;
          if (!v13) {
            goto LABEL_32;
          }
LABEL_31:
          (*(void (**)(unint64_t, uint64_t, double))(v13 + 16))(v13, v12, v23);
          goto LABEL_32;
        }
        if (v11) {
          uint64_t v24 = *(void **)(v11 + 24);
        }
        else {
          uint64_t v24 = 0;
        }
        double v23 = _offsetOfDropletView(v24, v8, v17);
        if (v13) {
          goto LABEL_31;
        }
LABEL_32:
        if (v15)
        {
          long long v30 = (void *)MEMORY[0x1E4F42FF0];
          v36[0] = MEMORY[0x1E4F143A8];
          v36[1] = 3221225472;
          id v36[2] = __66__SBHardwareButtonHintDropletViewController__displayLinkCallback___block_invoke;
          v36[3] = &unk_1E6AF4A70;
          id v37 = (id)v15;
          double v38 = v23;
          [v30 performWithoutAnimation:v36];
        }
        uint64_t v7 = v35;
LABEL_35:

        ++v10;
      }
      while (v7 != v10);
      uint64_t v31 = [v5 countByEnumeratingWithState:&v39 objects:v43 count:16];
      uint64_t v7 = v31;
      if (!v31)
      {
LABEL_44:

        uint64_t v4 = v32;
        break;
      }
    }
  }
}

uint64_t __66__SBHardwareButtonHintDropletViewController__displayLinkCallback___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  CGAffineTransformMakeTranslation(&v3, *(CGFloat *)(a1 + 40), 0.0);
  return [v1 setTransform:&v3];
}

- (void)setKeylineStyle:(unint64_t)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_keylineStyle != a3)
  {
    self->_keylineStyle = a3;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v4 = [(NSMutableDictionary *)self->_buttonStates objectEnumerator];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          [(SBHardwareButtonHintDropletViewController *)self _applyButtonState:*(void *)(*((void *)&v9 + 1) + 8 * v8++) animated:1];
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (id)_configurationForButton:(int64_t)a3 stage:(unint64_t)a4
{
  unint64_t v7 = -[SBButtonBezelGeometryInfo buttonScreenEdgeForButton:](self->_buttonGeometryInfo, "buttonScreenEdgeForButton:");
  buttonGeometryInfo = self->_buttonGeometryInfo;
  long long v9 = [(SBHardwareButtonHintDropletViewController *)self view];
  [v9 bounds];
  -[SBButtonBezelGeometryInfo buttonHWRectForButton:onEmbeddedDisplayBounds:](buttonGeometryInfo, "buttonHWRectForButton:onEmbeddedDisplayBounds:", a3);
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  long long v18 = [(SBHardwareButtonHintDropletViewController *)self view];
  [v18 bounds];
  double v20 = v19;
  double v22 = v21;

  unint64_t keylineStyle = self->_keylineStyle;
  uint64_t v24 = (void *)MEMORY[0x1E4F5FA18];
  return (id)objc_msgSend(v24, "hardwareButtonHintForButton:stage:keylineStyle:rectEdge:buttonRect:canvasSize:", a3, a4, keylineStyle, v7, v11, v13, v15, v17, v20, v22);
}

- (void)_updateSnapshotVisibility
{
  CGAffineTransform v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v4 = [v3 BOOLForKey:@"SBHardwareButtonHintDropletsAlwaysVisibleInSnapshots"];

  BOOL v5 = (v4 & 1) == 0 && self->_displayLink == 0;
  uint64_t v6 = [(SBHardwareButtonHintDropletViewController *)self view];
  unint64_t v7 = [v6 layer];

  int v8 = [v7 disableUpdateMask];
  if (v5)
  {
    uint64_t v9 = v8 | 2u;
    if (v8 != v9)
    {
      double v10 = SBLogButtonHintingUI();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v14 = 0;
        double v11 = "Hint Droplet: Hiding droplets from snapshots";
        double v12 = (uint8_t *)&v14;
LABEL_11:
        _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, v11, v12, 2u);
        goto LABEL_12;
      }
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v9 = v8 & 0xFFFFFFFD;
    if (v8 != v9)
    {
      double v10 = SBLogButtonHintingUI();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v13 = 0;
        double v11 = "Hint Droplet: Revealing droplets in snapshots";
        double v12 = (uint8_t *)&v13;
        goto LABEL_11;
      }
LABEL_12:

      [v7 setDisableUpdateMask:v9];
    }
  }
}

- (unint64_t)keylineStyle
{
  return self->_keylineStyle;
}

- (SBHardwareButtonHintDropletViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBHardwareButtonHintDropletViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_buttonStates, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_idleTimer, 0);
  objc_storeStrong((id *)&self->_animator, 0);
  objc_storeStrong((id *)&self->_dropletContextView, 0);
  objc_storeStrong((id *)&self->_buttonGeometryInfo, 0);
}

- (void)activateHintDropletForButton:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  BOOL v5 = NSStringFromSelector(a1);
  uint64_t v6 = (objc_class *)objc_opt_class();
  unint64_t v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  uint64_t v9 = v5;
  __int16 v10 = 2114;
  double v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  double v15 = @"SBHardwareButtonHintDropletViewController.m";
  __int16 v16 = 1024;
  int v17 = 129;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_1D85BA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

- (void)updateHintContentVisibility:(uint64_t)a1 forButton:(NSObject *)a2 animationSettings:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  CGAffineTransform v3 = NSStringFromSBSHardwareButtonKind();
  int v4 = 138543362;
  BOOL v5 = v3;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "We shouldn't be trying to update the hint content appearance state for a button that has no hinting state: %{public}@", (uint8_t *)&v4, 0xCu);
}

@end
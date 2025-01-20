@interface SBPrototypeDumpingGround
- (SBPrototypeDumpingGround)init;
- (SBWindowScene)windowScene;
- (void)_updatePearlDebugUI;
- (void)dealloc;
- (void)setWindowScene:(id)a3;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
@end

@implementation SBPrototypeDumpingGround

- (SBPrototypeDumpingGround)init
{
  v19.receiver = self;
  v19.super_class = (Class)SBPrototypeDumpingGround;
  v2 = [(SBPrototypeDumpingGround *)&v19 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F5E408] rootSettings];
    v4 = [v3 pearlSettings];
    [v4 addKeyObserver:v2];

    [(SBPrototypeDumpingGround *)v2 _updatePearlDebugUI];
    v5 = [MEMORY[0x1E4F5E408] rootSettings];
    v6 = [v5 addNotificationOutlet];
    id v7 = (id)[v6 addAction:&__block_literal_global_244];

    v8 = +[SBMedusaDomain rootSettings];
    v9 = [v8 killSpringBoardOutlet];
    id v10 = (id)[v9 addAction:&__block_literal_global_4_0];

    v11 = +[SBExternalDisplaySettingsDomain rootSettings];
    v12 = [v11 killSpringBoardOutlet];
    id v13 = (id)[v12 addAction:&__block_literal_global_8_2];

    v14 = [MEMORY[0x1E4FA6270] rootSettings];
    v15 = [v14 iconEditingSettings];
    v16 = [v15 resetHomeScreenLayoutOutlet];
    id v17 = (id)[v16 addAction:&__block_literal_global_11_3];
  }
  return v2;
}

void __32__SBPrototypeDumpingGround_init__block_invoke()
{
  id v0 = +[SBExampleUserNotificationCenter sharedInstance];
  [v0 publish];
}

void __32__SBPrototypeDumpingGround_init__block_invoke_2()
{
  id v0 = +[SBPrototypeController sharedInstance];
  [v0 restartSpringBoard];
}

void __32__SBPrototypeDumpingGround_init__block_invoke_3()
{
  id v0 = +[SBPrototypeController sharedInstance];
  [v0 restartSpringBoard];
}

void __32__SBPrototypeDumpingGround_init__block_invoke_4()
{
  id v0 = +[SBIconController sharedInstance];
  [v0 resetHomeScreenLayout];
}

- (void)dealloc
{
  if (self->_appLaunchedNotificationToken)
  {
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 removeObserver:self->_appLaunchedNotificationToken];

    id appLaunchedNotificationToken = self->_appLaunchedNotificationToken;
    self->_id appLaunchedNotificationToken = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)SBPrototypeDumpingGround;
  [(SBPrototypeDumpingGround *)&v5 dealloc];
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  objc_super v5 = (void *)MEMORY[0x1E4F5E408];
  id v6 = a3;
  id v7 = [v5 rootSettings];
  id v8 = [v7 pearlSettings];

  if (v8 == v6)
  {
    [(SBPrototypeDumpingGround *)self _updatePearlDebugUI];
  }
}

- (void)_updatePearlDebugUI
{
  if ([(id)SBApp hasFinishedLaunching])
  {
    v3 = [MEMORY[0x1E4F5E408] rootSettings];
    v4 = [v3 pearlSettings];
    int v5 = [v4 pearlDebugUIEnabled];

    pearlMonitorUI = self->_pearlMonitorUI;
    if (v5)
    {
      if (!pearlMonitorUI)
      {
        id v7 = objc_alloc_init(SBBiometricMonitorUI);
        id v8 = self->_pearlMonitorUI;
        self->_pearlMonitorUI = v7;

        v9 = self->_pearlMonitorUI;
        id v10 = [(SBPrototypeDumpingGround *)self windowScene];
        [(SBBiometricMonitorUI *)v9 setWindowScene:v10];

        v11 = self->_pearlMonitorUI;
        v12 = objc_alloc_init(SBBiometricMonitorPearlDataSource);
        [(SBBiometricMonitorUI *)v11 setDataSource:v12];

        pearlMonitorUI = self->_pearlMonitorUI;
      }
      [(SBBiometricMonitorUI *)pearlMonitorUI enable];
    }
    else
    {
      [(SBBiometricMonitorUI *)pearlMonitorUI disable];
      [(SBBiometricMonitorUI *)self->_pearlMonitorUI setDataSource:0];
      id v17 = self->_pearlMonitorUI;
      self->_pearlMonitorUI = 0;
    }
  }
  else if (!self->_appLaunchedNotificationToken)
  {
    objc_initWeak(&location, self);
    id v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v14 = [MEMORY[0x1E4F28F08] mainQueue];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __47__SBPrototypeDumpingGround__updatePearlDebugUI__block_invoke;
    v18[3] = &unk_1E6B01728;
    objc_copyWeak(&v19, &location);
    v15 = [v13 addObserverForName:@"SBBootCompleteNotification" object:0 queue:v14 usingBlock:v18];
    id appLaunchedNotificationToken = self->_appLaunchedNotificationToken;
    self->_id appLaunchedNotificationToken = v15;

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
}

void __47__SBPrototypeDumpingGround__updatePearlDebugUI__block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v1 removeObserver:WeakRetained[2]];

    v2 = (void *)WeakRetained[2];
    WeakRetained[2] = 0;

    [WeakRetained _updatePearlDebugUI];
  }
}

- (SBWindowScene)windowScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  return (SBWindowScene *)WeakRetained;
}

- (void)setWindowScene:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_windowScene);
  objc_storeStrong(&self->_appLaunchedNotificationToken, 0);
  objc_storeStrong((id *)&self->_pearlMonitorUI, 0);
}

@end
@interface SBBiometricMonitorTestRecipe
- (SBWindowScene)windowScene;
- (id)title;
- (void)handleVolumeDecrease;
- (void)handleVolumeIncrease;
- (void)setWindowScene:(id)a3;
- (void)windowSceneDidUpdate:(id)a3;
@end

@implementation SBBiometricMonitorTestRecipe

- (id)title
{
  return @"Biometric Monitor UI";
}

- (void)handleVolumeIncrease
{
  if (self->_monitorUI)
  {
    dataSource = self->_dataSource;
    [(SBBiometricMonitorTestRecipeDummyDataSource *)dataSource cycleState];
  }
  else
  {
    v4 = objc_alloc_init(SBBiometricMonitorTestRecipeDummyDataSource);
    v5 = self->_dataSource;
    self->_dataSource = v4;

    v6 = objc_alloc_init(SBBiometricMonitorUI);
    monitorUI = self->_monitorUI;
    self->_monitorUI = v6;

    v8 = self->_monitorUI;
    v9 = [(SBBiometricMonitorTestRecipe *)self windowScene];
    [(SBBiometricMonitorUI *)v8 setWindowScene:v9];

    [(SBBiometricMonitorUI *)self->_monitorUI setDataSource:self->_dataSource];
    v10 = self->_monitorUI;
    [(SBBiometricMonitorUI *)v10 enable];
  }
}

- (void)handleVolumeDecrease
{
  [(SBBiometricMonitorUI *)self->_monitorUI disable];
  monitorUI = self->_monitorUI;
  self->_monitorUI = 0;

  dataSource = self->_dataSource;
  self->_dataSource = 0;
}

- (void)windowSceneDidUpdate:(id)a3
{
  id v6 = a3;
  id v4 = [(SBBiometricMonitorTestRecipe *)self windowScene];

  v5 = v6;
  if (v4 != v6)
  {
    [(SBBiometricMonitorTestRecipe *)self setWindowScene:v6];
    v5 = v6;
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
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_monitorUI, 0);
}

@end
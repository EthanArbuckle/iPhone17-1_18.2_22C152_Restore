@interface SHSheetSceneSettingsDiffAction
- (SHSheetSceneSettingsDiffAction)init;
- (SHSheetSceneSettingsDiffActionDelegate)delegate;
- (UIApplicationSceneSettingsDiffInspector)sceneSettingsDisplayDiffInspector;
- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8;
- (void)setDelegate:(id)a3;
- (void)setSceneSettingsDisplayDiffInspector:(id)a3;
@end

@implementation SHSheetSceneSettingsDiffAction

- (SHSheetSceneSettingsDiffAction)init
{
  v6.receiver = self;
  v6.super_class = (Class)SHSheetSceneSettingsDiffAction;
  v2 = [(SHSheetSceneSettingsDiffAction *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    sceneSettingsDisplayDiffInspector = v2->_sceneSettingsDisplayDiffInspector;
    v2->_sceneSettingsDisplayDiffInspector = (UIApplicationSceneSettingsDiffInspector *)v3;

    [(UIApplicationSceneSettingsDiffInspector *)v2->_sceneSettingsDisplayDiffInspector observeInterfaceOrientationWithBlock:&__block_literal_global_4];
    [(UIApplicationSceneSettingsDiffInspector *)v2->_sceneSettingsDisplayDiffInspector observeDisplayConfigurationWithBlock:&__block_literal_global_2];
  }
  return v2;
}

void __38__SHSheetSceneSettingsDiffAction_init__block_invoke(uint64_t a1, unsigned char *a2)
{
  *a2 |= 1u;
}

void __38__SHSheetSceneSettingsDiffAction_init__block_invoke_2(uint64_t a1, unsigned char *a2)
{
  *a2 |= 2u;
}

- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8
{
  char v12 = 0;
  id v9 = a5;
  v10 = [(SHSheetSceneSettingsDiffAction *)self sceneSettingsDisplayDiffInspector];
  [v10 inspectDiff:v9 withContext:&v12];

  if ((v12 & 3) != 0)
  {
    v11 = [(SHSheetSceneSettingsDiffAction *)self delegate];
    [v11 sceneSettingsDidChange:self];
  }
}

- (SHSheetSceneSettingsDiffActionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SHSheetSceneSettingsDiffActionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIApplicationSceneSettingsDiffInspector)sceneSettingsDisplayDiffInspector
{
  return self->_sceneSettingsDisplayDiffInspector;
}

- (void)setSceneSettingsDisplayDiffInspector:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneSettingsDisplayDiffInspector, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
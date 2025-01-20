@interface SBSUIFeaturePolicyHostComponent
- (BOOL)allowsMenuButtonDismissal;
- (BOOL)shouldDisableAlertItems;
- (BOOL)shouldDisableBanners;
- (BOOL)shouldDisableControlCenter;
- (BOOL)shouldDisableInteractiveScreenshotGesture;
- (BOOL)shouldDisableReachability;
- (BOOL)shouldDisableSiri;
- (NSSet)desiredBackgroundActivities;
- (SBSUIFeaturePolicyHostComponentDelegate)delegate;
- (unint64_t)desiredHardwareButtonEvents;
- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6;
- (void)sendActions:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation SBSUIFeaturePolicyHostComponent

- (BOOL)shouldDisableBanners
{
  v2 = [(FBSSceneComponent *)self hostScene];
  v3 = [v2 clientSettings];
  char v4 = [v3 disablesBanners];

  return v4;
}

- (BOOL)shouldDisableAlertItems
{
  v2 = [(FBSSceneComponent *)self hostScene];
  v3 = [v2 clientSettings];
  char v4 = [v3 disablesAlertItems];

  return v4;
}

- (BOOL)shouldDisableControlCenter
{
  v2 = [(FBSSceneComponent *)self hostScene];
  v3 = [v2 clientSettings];
  char v4 = [v3 disablesControlCenter];

  return v4;
}

- (BOOL)shouldDisableSiri
{
  v2 = [(FBSSceneComponent *)self hostScene];
  v3 = [v2 clientSettings];
  char v4 = [v3 disablesSiri];

  return v4;
}

- (BOOL)shouldDisableInteractiveScreenshotGesture
{
  v2 = [(FBSSceneComponent *)self hostScene];
  v3 = [v2 clientSettings];
  char v4 = [v3 disablesInteractiveScreenshotGesture];

  return v4;
}

- (BOOL)shouldDisableReachability
{
  v2 = [(FBSSceneComponent *)self hostScene];
  v3 = [v2 clientSettings];
  char v4 = [v3 disablesReachability];

  return v4;
}

- (BOOL)allowsMenuButtonDismissal
{
  v2 = [(FBSSceneComponent *)self hostScene];
  v3 = [v2 clientSettings];
  char v4 = [v3 allowsMenuButtonDismissal];

  return v4;
}

- (unint64_t)desiredHardwareButtonEvents
{
  v2 = [(FBSSceneComponent *)self hostScene];
  v3 = [v2 clientSettings];
  unint64_t v4 = [v3 desiredHardwareButtonEvents];

  return v4;
}

- (NSSet)desiredBackgroundActivities
{
  v2 = [(FBSSceneComponent *)self hostScene];
  v3 = [v2 clientSettings];
  unint64_t v4 = [v3 desiredBackgroundActivities];

  return (NSSet *)v4;
}

- (void)sendActions:(id)a3
{
  id v4 = a3;
  v5 = [(FBSSceneComponent *)self hostScene];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__SBSUIFeaturePolicyHostComponent_sendActions___block_invoke;
  v7[3] = &unk_1E5CCD818;
  id v8 = v4;
  id v6 = v4;
  [v5 performUpdate:v7];
}

uint64_t __47__SBSUIFeaturePolicyHostComponent_sendActions___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 setActions:*(void *)(a1 + 32)];
}

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ([v8 containsProperty:sel_disablesBanners]) {
    [WeakRetained featurePolicyHostComponentDidChangeShouldDisableBanners:self];
  }
  if ([v8 containsProperty:sel_disablesAlertItems]) {
    [WeakRetained featurePolicyHostComponentDidChangeShouldDisableAlertItems:self];
  }
  if ([v8 containsProperty:sel_disablesControlCenter]) {
    [WeakRetained featurePolicyHostComponentDidChangeShouldDisableControlCenter:self];
  }
  if ([v8 containsProperty:sel_disablesSiri]) {
    [WeakRetained featurePolicyHostComponentDidChangeShouldDisableSiri:self];
  }
  if ([v8 containsProperty:sel_disablesInteractiveScreenshotGesture]) {
    [WeakRetained featurePolicyHostComponentDidChangeShouldDisableInteractiveScreenshotGesture:self];
  }
  if ([v8 containsProperty:sel_disablesReachability]) {
    [WeakRetained featurePolicyHostComponentDidChangeShouldDisableReachability:self];
  }
  if ([v8 containsProperty:sel_allowsMenuButtonDismissal]) {
    [WeakRetained featurePolicyHostComponentDidChangeAllowsMenuButtonDismissal:self];
  }
  if ([v8 containsProperty:sel_desiredHardwareButtonEvents]) {
    [WeakRetained featurePolicyHostComponentDidChangeDesiredHardwareButtonEvents:self];
  }
  if ([v8 containsProperty:sel_desiredBackgroundActivities]) {
    [WeakRetained featurePolicyHostComponentDidChangeDesiredBackgroundActivities:self];
  }
}

- (SBSUIFeaturePolicyHostComponentDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBSUIFeaturePolicyHostComponentDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
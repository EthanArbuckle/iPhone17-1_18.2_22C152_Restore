@interface SBSwitcherTransitionRequest
+ (id)requestForActivatingAppLayout:(id)a3;
+ (id)requestForActivatingAppSwitcher;
+ (id)requestForActivatingFloatingSwitcher;
+ (id)requestForActivatingHomeScreen;
+ (id)requestForDeactivatingFloatingSwitcher;
+ (id)requestForStashingFloatingApplicationWithFloatingConfiguration:(int64_t)a3;
+ (id)requestForTapAppLayoutEvent:(id)a3;
+ (id)requestForTapAppLayoutHeaderEvent:(id)a3;
- (BOOL)fenceSceneUpdate;
- (BOOL)isAppLaunchDuringWindowDragGesture;
- (BOOL)preventSwitcherRecencyModelUpdates;
- (BOOL)retainsSiri;
- (BOOL)sceneUpdatesOnly;
- (NSString)bundleIdentifierForAppExpose;
- (NSString)description;
- (SBAppLayout)appLayout;
- (SBDisplayItem)activatingDisplayItem;
- (SBFFluidBehaviorSettings)animationSettings;
- (SBSwitcherTransitionRequest)init;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)animationDisabled;
- (int64_t)appLayoutEnvironment;
- (int64_t)autoPIPDisabled;
- (int64_t)entityInsertionPolicy;
- (int64_t)floatingConfiguration;
- (int64_t)floatingSwitcherVisible;
- (int64_t)peekConfiguration;
- (int64_t)preferredInterfaceOrientation;
- (int64_t)source;
- (int64_t)unlockedEnvironmentMode;
- (void)setActivatingDisplayItem:(id)a3;
- (void)setAnimationDisabled:(int64_t)a3;
- (void)setAnimationSettings:(id)a3;
- (void)setAppLaunchDuringWindowDragGesture:(BOOL)a3;
- (void)setAppLayout:(id)a3;
- (void)setAppLayoutEnvironment:(int64_t)a3;
- (void)setAutoPIPDisabled:(int64_t)a3;
- (void)setBundleIdentifierForAppExpose:(id)a3;
- (void)setEntityInsertionPolicy:(int64_t)a3;
- (void)setFenceSceneUpdate:(BOOL)a3;
- (void)setFloatingConfiguration:(int64_t)a3;
- (void)setFloatingSwitcherVisible:(int64_t)a3;
- (void)setPeekConfiguration:(int64_t)a3;
- (void)setPreferredInterfaceOrientation:(int64_t)a3;
- (void)setPreventSwitcherRecencyModelUpdates:(BOOL)a3;
- (void)setRetainsSiri:(BOOL)a3;
- (void)setSceneUpdatesOnly:(BOOL)a3;
- (void)setSource:(int64_t)a3;
- (void)setUnlockedEnvironmentMode:(int64_t)a3;
@end

@implementation SBSwitcherTransitionRequest

- (SBSwitcherTransitionRequest)init
{
  v7.receiver = self;
  v7.super_class = (Class)SBSwitcherTransitionRequest;
  v2 = [(SBSwitcherTransitionRequest *)&v7 init];
  v3 = v2;
  if (v2)
  {
    appLayout = v2->_appLayout;
    v2->_appLayout = 0;

    v3->_unlockedEnvironmentMode = 0;
    v3->_preferredInterfaceOrientation = 0;
    v3->_floatingConfiguration = 0;
    *(int64x2_t *)&v3->_floatingSwitcherVisible = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    v3->_autoPIPDisabled = 0x7FFFFFFFFFFFFFFFLL;
    v3->_source = 0;
    bundleIdentifierForAppExpose = v3->_bundleIdentifierForAppExpose;
    v3->_peekConfiguration = 0;
    v3->_bundleIdentifierForAppExpose = 0;

    v3->_entityInsertionPolicy = 0;
  }
  return v3;
}

+ (id)requestForActivatingAppLayout:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)a1);
  [v5 setAppLayout:v4];

  return v5;
}

+ (id)requestForActivatingHomeScreen
{
  id v2 = objc_alloc_init((Class)a1);
  v3 = +[SBAppLayout homeScreenAppLayout];
  [v2 setAppLayout:v3];

  return v2;
}

+ (id)requestForActivatingAppSwitcher
{
  id v2 = objc_alloc_init((Class)a1);
  [v2 setUnlockedEnvironmentMode:2];
  return v2;
}

+ (id)requestForActivatingFloatingSwitcher
{
  id v2 = objc_alloc_init((Class)a1);
  [v2 setFloatingSwitcherVisible:1];
  return v2;
}

+ (id)requestForDeactivatingFloatingSwitcher
{
  id v2 = objc_alloc_init((Class)a1);
  [v2 setFloatingSwitcherVisible:0];
  return v2;
}

+ (id)requestForStashingFloatingApplicationWithFloatingConfiguration:(int64_t)a3
{
  id v4 = objc_alloc_init((Class)a1);
  [v4 setFloatingConfiguration:a3];
  return v4;
}

+ (id)requestForTapAppLayoutEvent:(id)a3
{
  id v4 = a3;
  id v5 = [v4 appLayout];
  uint64_t v6 = [v4 layoutRole];
  id v7 = objc_alloc_init((Class)a1);
  [v7 setAppLayout:v5];
  v8 = [v5 itemForLayoutRole:v6];
  [v7 setActivatingDisplayItem:v8];

  uint64_t v9 = [v4 source];
  if (v9 == 1) {
    [v7 setSource:51];
  }

  return v7;
}

+ (id)requestForTapAppLayoutHeaderEvent:(id)a3
{
  id v4 = a3;
  id v5 = [v4 appLayout];
  uint64_t v6 = [v4 layoutRole];

  id v7 = objc_alloc_init((Class)a1);
  [v7 setAppLayout:v5];
  v8 = [v5 itemForLayoutRole:v6];
  [v7 setActivatingDisplayItem:v8];

  return v7;
}

- (NSString)description
{
  return (NSString *)[(SBSwitcherTransitionRequest *)self descriptionWithMultilinePrefix:0];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(SBSwitcherTransitionRequest *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = [(SBSwitcherTransitionRequest *)self succinctDescriptionBuilder];
  unint64_t unlockedEnvironmentMode = self->_unlockedEnvironmentMode;
  if (unlockedEnvironmentMode)
  {
    uint64_t v6 = SBStringForUnlockedEnvironmentMode(unlockedEnvironmentMode);
    [v4 appendString:v6 withName:@"environmentMode"];
  }
  int64_t preferredInterfaceOrientation = self->_preferredInterfaceOrientation;
  v8 = @"UIInterfaceOrientationPortrait";
  switch(preferredInterfaceOrientation)
  {
    case 0:
      goto LABEL_10;
    case 1:
      goto LABEL_9;
    case 3:
      v8 = @"UIInterfaceOrientationLandscapeRight";
      goto LABEL_9;
    case 4:
      v8 = @"UIInterfaceOrientationLandscapeLeft";
      goto LABEL_9;
    default:
      if (preferredInterfaceOrientation == 2) {
        v8 = @"UIInterfaceOrientationPortraitUpsideDown";
      }
      else {
        v8 = 0;
      }
LABEL_9:
      [v4 appendString:v8 withName:@"preferredOrientation"];
LABEL_10:
      unint64_t floatingConfiguration = self->_floatingConfiguration;
      if (floatingConfiguration)
      {
        v10 = SBStringForFloatingConfiguration(floatingConfiguration);
        [v4 appendString:v10 withName:@"floatingConfiguration"];
      }
      if (self->_floatingSwitcherVisible != 0x7FFFFFFFFFFFFFFFLL)
      {
        v11 = BSSettingFlagDescription();
        [v4 appendString:v11 withName:@"floatingSwitcherVisible"];
      }
      if (self->_animationDisabled != 0x7FFFFFFFFFFFFFFFLL)
      {
        v12 = BSSettingFlagDescription();
        [v4 appendString:v12 withName:@"animationDisabled"];
      }
      if (self->_autoPIPDisabled != 0x7FFFFFFFFFFFFFFFLL)
      {
        v13 = BSSettingFlagDescription();
        [v4 appendString:v13 withName:@"autoPIPDisabled"];
      }
      appLayout = self->_appLayout;
      if (appLayout)
      {
        v15 = [(SBAppLayout *)appLayout succinctDescription];
        id v16 = (id)[v4 appendObject:v15 withName:@"appLayout"];
      }
      activatingDisplayItem = self->_activatingDisplayItem;
      if (activatingDisplayItem)
      {
        v18 = [(SBDisplayItem *)activatingDisplayItem succinctDescription];
        id v19 = (id)[v4 appendObject:v18 withName:@"activatingDisplayItem"];
      }
      unint64_t appLayoutEnvironment = self->_appLayoutEnvironment;
      if (appLayoutEnvironment)
      {
        v21 = SBStringForAppLayoutEnvironment(appLayoutEnvironment);
        [v4 appendString:v21 withName:@"appLayoutEnvironment"];
      }
      unint64_t source = self->_source;
      if (source)
      {
        v23 = SBMainWorkspaceTransitionSourceDescription(source);
        [v4 appendString:v23 withName:@"source"];
      }
      if (SBPeekConfigurationIsValid(self->_peekConfiguration))
      {
        v24 = SBStringForPeekConfiguration(self->_peekConfiguration);
        [v4 appendString:v24 withName:@"peekConfiguration"];
      }
      bundleIdentifierForAppExpose = self->_bundleIdentifierForAppExpose;
      if (bundleIdentifierForAppExpose) {
        [v4 appendString:bundleIdentifierForAppExpose withName:@"bundleIdentifierForAppExpose"];
      }
      id v26 = (id)[v4 appendBool:self->_sceneUpdatesOnly withName:@"sceneUpdatesOnly" ifEqualTo:1];
      id v27 = (id)[v4 appendBool:self->_fenceSceneUpdate withName:@"fenceSceneUpdate" ifEqualTo:1];
      id v28 = (id)[v4 appendBool:self->_appLaunchDuringWindowDragGesture withName:@"appLaunchDuringWindowDragGesture" ifEqualTo:1];
      animationSettings = self->_animationSettings;
      if (animationSettings) {
        id v30 = (id)[v4 appendObject:animationSettings withName:@"animationSettings"];
      }
      id v31 = (id)[v4 appendBool:self->_retainsSiri withName:@"retainsSiri" ifEqualTo:1];
      return v4;
  }
}

- (id)succinctDescription
{
  id v2 = [(SBSwitcherTransitionRequest *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(SBMutableSwitcherTransitionRequest);
  id v5 = [(SBSwitcherTransitionRequest *)self appLayout];
  [(SBSwitcherTransitionRequest *)v4 setAppLayout:v5];

  uint64_t v6 = [(SBSwitcherTransitionRequest *)self activatingDisplayItem];
  [(SBSwitcherTransitionRequest *)v4 setActivatingDisplayItem:v6];

  [(SBSwitcherTransitionRequest *)v4 setAppLayoutEnvironment:[(SBSwitcherTransitionRequest *)self appLayoutEnvironment]];
  [(SBSwitcherTransitionRequest *)v4 setPreferredInterfaceOrientation:[(SBSwitcherTransitionRequest *)self preferredInterfaceOrientation]];
  [(SBSwitcherTransitionRequest *)v4 setUnlockedEnvironmentMode:[(SBSwitcherTransitionRequest *)self unlockedEnvironmentMode]];
  [(SBSwitcherTransitionRequest *)v4 setFloatingConfiguration:[(SBSwitcherTransitionRequest *)self floatingConfiguration]];
  [(SBSwitcherTransitionRequest *)v4 setFloatingSwitcherVisible:[(SBSwitcherTransitionRequest *)self floatingSwitcherVisible]];
  [(SBSwitcherTransitionRequest *)v4 setAnimationDisabled:[(SBSwitcherTransitionRequest *)self animationDisabled]];
  [(SBSwitcherTransitionRequest *)v4 setAutoPIPDisabled:[(SBSwitcherTransitionRequest *)self autoPIPDisabled]];
  [(SBSwitcherTransitionRequest *)v4 setSource:[(SBSwitcherTransitionRequest *)self source]];
  [(SBSwitcherTransitionRequest *)v4 setPeekConfiguration:[(SBSwitcherTransitionRequest *)self peekConfiguration]];
  id v7 = [(SBSwitcherTransitionRequest *)self bundleIdentifierForAppExpose];
  [(SBSwitcherTransitionRequest *)v4 setBundleIdentifierForAppExpose:v7];

  [(SBSwitcherTransitionRequest *)v4 setEntityInsertionPolicy:[(SBSwitcherTransitionRequest *)self entityInsertionPolicy]];
  [(SBSwitcherTransitionRequest *)v4 setSceneUpdatesOnly:[(SBSwitcherTransitionRequest *)self sceneUpdatesOnly]];
  [(SBSwitcherTransitionRequest *)v4 setFenceSceneUpdate:[(SBSwitcherTransitionRequest *)self fenceSceneUpdate]];
  [(SBSwitcherTransitionRequest *)v4 setPreventSwitcherRecencyModelUpdates:[(SBSwitcherTransitionRequest *)self preventSwitcherRecencyModelUpdates]];
  v8 = [(SBSwitcherTransitionRequest *)self animationSettings];
  [(SBSwitcherTransitionRequest *)v4 setAnimationSettings:v8];

  [(SBSwitcherTransitionRequest *)v4 setAppLaunchDuringWindowDragGesture:[(SBSwitcherTransitionRequest *)self isAppLaunchDuringWindowDragGesture]];
  [(SBSwitcherTransitionRequest *)v4 setRetainsSiri:[(SBSwitcherTransitionRequest *)self retainsSiri]];
  return v4;
}

- (SBAppLayout)appLayout
{
  return self->_appLayout;
}

- (void)setAppLayout:(id)a3
{
}

- (SBDisplayItem)activatingDisplayItem
{
  return self->_activatingDisplayItem;
}

- (void)setActivatingDisplayItem:(id)a3
{
}

- (int64_t)appLayoutEnvironment
{
  return self->_appLayoutEnvironment;
}

- (void)setAppLayoutEnvironment:(int64_t)a3
{
  self->_unint64_t appLayoutEnvironment = a3;
}

- (int64_t)unlockedEnvironmentMode
{
  return self->_unlockedEnvironmentMode;
}

- (void)setUnlockedEnvironmentMode:(int64_t)a3
{
  self->_unint64_t unlockedEnvironmentMode = a3;
}

- (int64_t)preferredInterfaceOrientation
{
  return self->_preferredInterfaceOrientation;
}

- (void)setPreferredInterfaceOrientation:(int64_t)a3
{
  self->_int64_t preferredInterfaceOrientation = a3;
}

- (int64_t)floatingConfiguration
{
  return self->_floatingConfiguration;
}

- (void)setFloatingConfiguration:(int64_t)a3
{
  self->_unint64_t floatingConfiguration = a3;
}

- (int64_t)floatingSwitcherVisible
{
  return self->_floatingSwitcherVisible;
}

- (void)setFloatingSwitcherVisible:(int64_t)a3
{
  self->_floatingSwitcherVisible = a3;
}

- (int64_t)animationDisabled
{
  return self->_animationDisabled;
}

- (void)setAnimationDisabled:(int64_t)a3
{
  self->_animationDisabled = a3;
}

- (int64_t)autoPIPDisabled
{
  return self->_autoPIPDisabled;
}

- (void)setAutoPIPDisabled:(int64_t)a3
{
  self->_autoPIPDisabled = a3;
}

- (int64_t)source
{
  return self->_source;
}

- (void)setSource:(int64_t)a3
{
  self->_unint64_t source = a3;
}

- (int64_t)peekConfiguration
{
  return self->_peekConfiguration;
}

- (void)setPeekConfiguration:(int64_t)a3
{
  self->_peekConfiguration = a3;
}

- (NSString)bundleIdentifierForAppExpose
{
  return self->_bundleIdentifierForAppExpose;
}

- (void)setBundleIdentifierForAppExpose:(id)a3
{
}

- (int64_t)entityInsertionPolicy
{
  return self->_entityInsertionPolicy;
}

- (void)setEntityInsertionPolicy:(int64_t)a3
{
  self->_entityInsertionPolicy = a3;
}

- (BOOL)preventSwitcherRecencyModelUpdates
{
  return self->_preventSwitcherRecencyModelUpdates;
}

- (void)setPreventSwitcherRecencyModelUpdates:(BOOL)a3
{
  self->_preventSwitcherRecencyModelUpdates = a3;
}

- (BOOL)sceneUpdatesOnly
{
  return self->_sceneUpdatesOnly;
}

- (void)setSceneUpdatesOnly:(BOOL)a3
{
  self->_sceneUpdatesOnly = a3;
}

- (BOOL)fenceSceneUpdate
{
  return self->_fenceSceneUpdate;
}

- (void)setFenceSceneUpdate:(BOOL)a3
{
  self->_fenceSceneUpdate = a3;
}

- (BOOL)isAppLaunchDuringWindowDragGesture
{
  return self->_appLaunchDuringWindowDragGesture;
}

- (void)setAppLaunchDuringWindowDragGesture:(BOOL)a3
{
  self->_appLaunchDuringWindowDragGesture = a3;
}

- (SBFFluidBehaviorSettings)animationSettings
{
  return self->_animationSettings;
}

- (void)setAnimationSettings:(id)a3
{
}

- (BOOL)retainsSiri
{
  return self->_retainsSiri;
}

- (void)setRetainsSiri:(BOOL)a3
{
  self->_retainsSiri = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animationSettings, 0);
  objc_storeStrong((id *)&self->_bundleIdentifierForAppExpose, 0);
  objc_storeStrong((id *)&self->_activatingDisplayItem, 0);
  objc_storeStrong((id *)&self->_appLayout, 0);
}

@end
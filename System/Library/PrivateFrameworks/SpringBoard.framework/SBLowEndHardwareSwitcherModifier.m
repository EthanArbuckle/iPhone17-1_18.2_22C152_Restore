@interface SBLowEndHardwareSwitcherModifier
- (BOOL)_shouldResignActiveAppsUnderFloatingApp;
- (BOOL)_shouldSimplifyForOpenFolder;
- (BOOL)_shouldSimplifyForWidgetCenterAndLibrary;
- (SBLowEndHardwareSwitcherModifier)initWithSimplificationOptions:(unint64_t)a3;
- (double)homeScreenAlpha;
- (double)homeScreenScale;
- (double)wallpaperScale;
- (id)appLayoutsToResignActive;
- (id)handleTransitionEvent:(id)a3;
- (id)keyboardSuppressionMode;
@end

@implementation SBLowEndHardwareSwitcherModifier

- (id)handleTransitionEvent:(id)a3
{
  id v4 = a3;
  v5 = [v4 toFloatingAppLayout];
  char v6 = [v4 toFloatingSwitcherVisible];
  uint64_t v7 = [v4 toEnvironmentMode];
  v8 = [v4 toAppLayout];
  v9 = v8;
  if (v5) {
    char v10 = 1;
  }
  else {
    char v10 = v6;
  }
  if (v7 == 3 && (v10 & 1) != 0)
  {
    v11 = [v8 allItems];
    self->_floatingAppVisibleOverSplitView = (unint64_t)[v11 count] > 1;

    char v12 = [v4 toAppLayoutWantsExclusiveForeground];
  }
  else
  {
    char v12 = 0;
    self->_floatingAppVisibleOverSplitView = 0;
  }
  self->_floatingAppVisibleOverExclusiveForegroundApp = v12;
  v15.receiver = self;
  v15.super_class = (Class)SBLowEndHardwareSwitcherModifier;
  v13 = [(SBSwitcherModifier *)&v15 handleTransitionEvent:v4];

  return v13;
}

- (double)homeScreenAlpha
{
  if ([(SBLowEndHardwareSwitcherModifier *)self _shouldSimplifyForOpenFolder]
    || [(SBLowEndHardwareSwitcherModifier *)self _shouldSimplifyForWidgetCenterAndLibrary])
  {
    v3 = [(SBLowEndHardwareSwitcherModifier *)self switcherSettings];
    id v4 = [v3 animationSettings];
    [v4 homeScreenAlphaForMode:1];
    double v6 = v5;

    return v6;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBLowEndHardwareSwitcherModifier;
    [(SBLowEndHardwareSwitcherModifier *)&v8 homeScreenAlpha];
  }
  return result;
}

- (double)homeScreenScale
{
  if ([(SBLowEndHardwareSwitcherModifier *)self _shouldSimplifyForOpenFolder]
    || [(SBLowEndHardwareSwitcherModifier *)self _shouldSimplifyForWidgetCenterAndLibrary])
  {
    v3 = [(SBLowEndHardwareSwitcherModifier *)self switcherSettings];
    id v4 = [v3 animationSettings];
    [v4 homeScreenScaleForMode:1];
    double v6 = v5;

    return v6;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBLowEndHardwareSwitcherModifier;
    [(SBLowEndHardwareSwitcherModifier *)&v8 homeScreenScale];
  }
  return result;
}

- (double)wallpaperScale
{
  if ([(SBLowEndHardwareSwitcherModifier *)self _shouldSimplifyForOpenFolder]
    || [(SBLowEndHardwareSwitcherModifier *)self _shouldSimplifyForWidgetCenterAndLibrary])
  {
    v3 = [(SBLowEndHardwareSwitcherModifier *)self switcherSettings];
    id v4 = [v3 animationSettings];
    [v4 wallpaperScaleForMode:1];
    double v6 = v5;

    return v6;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBLowEndHardwareSwitcherModifier;
    [(SBLowEndHardwareSwitcherModifier *)&v8 wallpaperScale];
  }
  return result;
}

- (BOOL)_shouldSimplifyForWidgetCenterAndLibrary
{
  if (self->_options) {
    return [(SBLowEndHardwareSwitcherModifier *)self homeScreenHasWidgetCenterOrLibraryOpen];
  }
  else {
    return 0;
  }
}

- (BOOL)_shouldSimplifyForOpenFolder
{
  if ((self->_options & 2) != 0) {
    return [(SBLowEndHardwareSwitcherModifier *)self homeScreenHasOpenFolder];
  }
  else {
    return 0;
  }
}

- (id)keyboardSuppressionMode
{
  v9.receiver = self;
  v9.super_class = (Class)SBLowEndHardwareSwitcherModifier;
  v3 = [(SBLowEndHardwareSwitcherModifier *)&v9 keyboardSuppressionMode];
  if (([v3 suppressesAllScenes] & 1) != 0
    || ![(SBLowEndHardwareSwitcherModifier *)self _shouldResignActiveAppsUnderFloatingApp])
  {
    id v7 = v3;
  }
  else
  {
    id v4 = (void *)MEMORY[0x1E4F1CAD0];
    double v5 = [(SBLowEndHardwareSwitcherModifier *)self appLayouts];
    double v6 = [v4 setWithArray:v5];
    id v7 = +[SBSwitcherKeyboardSuppressionMode newSuppressionModeForSwitcherScenesFromAppLayouts:v6];
  }
  return v7;
}

- (id)appLayoutsToResignActive
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)SBLowEndHardwareSwitcherModifier;
  v3 = [(SBLowEndHardwareSwitcherModifier *)&v10 appLayoutsToResignActive];
  if ([(SBLowEndHardwareSwitcherModifier *)self _shouldResignActiveAppsUnderFloatingApp])
  {
    v11 = &unk_1F334B6C0;
    id v4 = (void *)MEMORY[0x1E4F1CAD0];
    double v5 = [(SBLowEndHardwareSwitcherModifier *)self appLayouts];
    double v6 = [v4 setWithArray:v5];
    v12[0] = v6;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];

    uint64_t v8 = objc_msgSend(v7, "bs_dictionaryByAddingEntriesFromDictionary:", v3);

    v3 = (void *)v8;
  }
  return v3;
}

- (BOOL)_shouldResignActiveAppsUnderFloatingApp
{
  if (self->_floatingAppVisibleOverExclusiveForegroundApp) {
    return 1;
  }
  if (self->_floatingAppVisibleOverSplitView) {
    return (self->_options & 4) != 0;
  }
  return 0;
}

- (SBLowEndHardwareSwitcherModifier)initWithSimplificationOptions:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBLowEndHardwareSwitcherModifier;
  double result = [(SBSwitcherModifier *)&v5 init];
  if (result) {
    result->_options = a3;
  }
  return result;
}

@end
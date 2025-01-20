@interface _UIWindowRotationAnimationController
- (BOOL)skipCallbacks;
- (BOOL)updateStatusBarIfNecessary;
- (double)duration;
- (double)transitionDuration:(id)a3;
- (id)animations;
- (void)animateTransition:(id)a3;
- (void)dealloc;
- (void)setAnimations:(id)a3;
- (void)setDuration:(double)a3;
- (void)setSkipCallbacks:(BOOL)a3;
- (void)setUpdateStatusBarIfNecessary:(BOOL)a3;
@end

@implementation _UIWindowRotationAnimationController

- (id)animations
{
  return self->_animations;
}

- (void).cxx_destruct
{
}

- (void)setUpdateStatusBarIfNecessary:(BOOL)a3
{
  self->_updateStatusBarIfNecessary = a3;
}

- (void)setSkipCallbacks:(BOOL)a3
{
  self->_skipCallbacks = a3;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (void)dealloc
{
  [(_UIWindowRotationAnimationController *)self setAnimations:0];
  v3.receiver = self;
  v3.super_class = (Class)_UIWindowRotationAnimationController;
  [(_UIWindowRotationAnimationController *)&v3 dealloc];
}

- (void)setAnimations:(id)a3
{
}

- (void)animateTransition:(id)a3
{
  id v4 = a3;
  v5 = [v4 containerView];
  [(_UIWindowRotationAnimationController *)self transitionDuration:v4];
  double v7 = v6;
  BOOL v8 = [(_UIWindowRotationAnimationController *)self skipCallbacks];
  BOOL v9 = [(_UIWindowRotationAnimationController *)self updateStatusBarIfNecessary];
  uint64_t v10 = [v5 _toWindowOrientation];
  uint64_t v11 = [(id)UIApp _safeInterfaceOrientationForWindowIfExists:v5];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __58___UIWindowRotationAnimationController_animateTransition___block_invoke;
  aBlock[3] = &unk_1E52EAAA0;
  aBlock[4] = self;
  id v26 = v4;
  id v12 = v5;
  BOOL v32 = v8;
  id v27 = v12;
  uint64_t v29 = v10;
  uint64_t v30 = v11;
  BOOL v33 = v9;
  id v13 = v26;
  id v28 = v13;
  double v31 = v7;
  v14 = (void (**)(void))_Block_copy(aBlock);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __58___UIWindowRotationAnimationController_animateTransition___block_invoke_4;
  v22[3] = &unk_1E52DAF68;
  v22[4] = self;
  id v15 = v13;
  id v23 = v15;
  id v16 = v12;
  id v24 = v16;
  v17 = (void (**)(void *, uint64_t))_Block_copy(v22);
  if ([v15 isAnimated])
  {
    if (_UIInternalPreferencesRevisionOnce != -1) {
      dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_5_8);
    }
    int v18 = _UIInternalPreferencesRevisionVar;
    if (_UIInternalPreferencesRevisionVar < 1) {
      goto LABEL_5;
    }
    int v19 = _UIInternalPreference_120HzRotationEnabled;
    if (_UIInternalPreferencesRevisionVar == _UIInternalPreference_120HzRotationEnabled) {
      goto LABEL_5;
    }
    while (v18 >= v19)
    {
      _UIInternalPreferenceSync(v18, &_UIInternalPreference_120HzRotationEnabled, @"120HzRotationEnabled", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
      int v19 = _UIInternalPreference_120HzRotationEnabled;
      if (v18 == _UIInternalPreference_120HzRotationEnabled) {
        goto LABEL_5;
      }
    }
    if (byte_1E8FD50C4)
    {
LABEL_5:
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __58___UIWindowRotationAnimationController_animateTransition___block_invoke_6;
      v20[3] = &unk_1E52DA040;
      id v21 = v14;
      v14 = (void (**)(void))_Block_copy(v20);
    }
    +[UIView animateWithDuration:4 delay:v14 options:v17 animations:v7 completion:0.0];
    [v15 _setTransitionIsInFlight:1];
  }
  else
  {
    v14[2](v14);
    v17[2](v17, 1);
  }
}

- (BOOL)skipCallbacks
{
  return self->_skipCallbacks;
}

- (BOOL)updateStatusBarIfNecessary
{
  return self->_updateStatusBarIfNecessary;
}

- (double)transitionDuration:(id)a3
{
  return self->_duration;
}

- (double)duration
{
  return self->_duration;
}

@end
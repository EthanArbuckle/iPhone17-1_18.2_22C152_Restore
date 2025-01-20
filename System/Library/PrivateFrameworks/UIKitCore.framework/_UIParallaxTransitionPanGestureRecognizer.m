@interface _UIParallaxTransitionPanGestureRecognizer
- (BOOL)_isGestureType:(int64_t)a3;
- (BOOL)_needsDynamicDependentRequirementForGestureRecognizer:(id)a3;
- (BOOL)_shouldTryToBeginWithEvent:(id)a3;
- (BOOL)_skipDynamicDependentRequirementOverride;
- (_UIParallaxTransitionPanGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (void)reset;
- (void)set_skipDynamicDependentRequirementOverride:(BOOL)a3;
@end

@implementation _UIParallaxTransitionPanGestureRecognizer

- (void)set_skipDynamicDependentRequirementOverride:(BOOL)a3
{
  self->__skipDynamicDependentRequirementOverride = a3;
}

- (_UIParallaxTransitionPanGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)_UIParallaxTransitionPanGestureRecognizer;
  v4 = [(UIScreenEdgePanGestureRecognizer *)&v7 initWithTarget:a3 action:a4];
  v5 = v4;
  if (v4)
  {
    [(UIPanGestureRecognizer *)v4 setMaximumNumberOfTouches:1];
    [(UIGestureRecognizer *)v5 _setRequiresSystemGesturesToFail:1];
    [(UIScreenEdgePanGestureRecognizer *)v5 _setRecognizesWithoutEdge:_isContentBackSwipeEnabled()];
    [(UIPanGestureRecognizer *)v5 setAllowedScrollTypesMask:2];
  }
  return v5;
}

- (void)reset
{
  [(UIScreenEdgePanGestureRecognizer *)self _resetHystersis];
  v3.receiver = self;
  v3.super_class = (Class)_UIParallaxTransitionPanGestureRecognizer;
  [(UIScreenEdgePanGestureRecognizer *)&v3 reset];
}

- (BOOL)_isGestureType:(int64_t)a3
{
  return a3 == 16;
}

- (BOOL)_shouldTryToBeginWithEvent:(id)a3
{
  id v4 = a3;
  if (![v4 type]
    && [(UIScreenEdgePanGestureRecognizer *)self _rootFeatureState] != 2)
  {
    [(UIScreenEdgePanGestureRecognizer *)self _setHysteresis:15.0];
    v21.receiver = self;
    v21.super_class = (Class)_UIParallaxTransitionPanGestureRecognizer;
    BOOL v17 = [(UIScreenEdgePanGestureRecognizer *)&v21 _shouldTryToBeginWithEvent:v4];
    goto LABEL_32;
  }
  if ([v4 type] == 10) {
    double v5 = 50.0;
  }
  else {
    double v5 = 30.0;
  }
  [(UIScreenEdgePanGestureRecognizer *)self _setHysteresis:v5];
  v6 = [(UIGestureRecognizer *)self view];
  [(UIPanGestureRecognizer *)self translationInView:v6];
  double v8 = v7;
  double v10 = v9;

  double v11 = -v8;
  if (v8 >= 0.0) {
    double v11 = v8;
  }
  double v12 = (v5 + -10.0) / 25.0 * v11 + 10.0;
  if (v12 > 25.0) {
    double v12 = 25.0;
  }
  double v13 = -v10;
  if (v10 >= 0.0) {
    double v13 = v10;
  }
  if (v13 >= v12)
  {
LABEL_29:
    [(UIGestureRecognizer *)self setState:5];
LABEL_30:
    BOOL v17 = 0;
    goto LABEL_32;
  }
  unsigned int v14 = [(UIScreenEdgePanGestureRecognizer *)self edges];
  int v15 = (v8 >= v5) & (v14 >> 1);
  if ((v14 & 8) != 0) {
    int v16 = (v8 >= v5) & (v14 >> 1);
  }
  else {
    int v16 = 1;
  }
  if (!v16) {
    LOBYTE(v15) = v8 <= -v5;
  }
  if ((v15 & 1) == 0)
  {
    BOOL v18 = (v14 & 8) == 0 && v8 <= -v5;
    BOOL v19 = (v14 & 2) != 0 || v8 < v5;
    if (v19 && !v18) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
  BOOL v17 = 1;
LABEL_32:

  return v17;
}

- (BOOL)_needsDynamicDependentRequirementForGestureRecognizer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[UIGestureRecognizer _activeTouchesEvent](self);

  if (v5) {
    LOBYTE(v5) = [(UIScreenEdgePanGestureRecognizer *)self _rootFeatureState] != 2;
  }
  if (-[_UIParallaxTransitionPanGestureRecognizer _skipDynamicDependentRequirementOverride](self, "_skipDynamicDependentRequirementOverride")|| (v5 & 1) != 0|| ![v4 _isGestureType:8])
  {
    v24.receiver = self;
    v24.super_class = (Class)_UIParallaxTransitionPanGestureRecognizer;
    LOBYTE(v7) = [(UIGestureRecognizer *)&v24 _needsDynamicDependentRequirementForGestureRecognizer:v4];
  }
  else
  {
    if (_UIInternalPreferencesRevisionOnce != -1) {
      dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_5_8);
    }
    int v6 = _UIInternalPreferencesRevisionVar;
    if (_UIInternalPreferencesRevisionVar < 1) {
      goto LABEL_9;
    }
    int v23 = _UIInternalPreference_UINavigationBackSwipeAlternate;
    if (_UIInternalPreferencesRevisionVar == _UIInternalPreference_UINavigationBackSwipeAlternate) {
      goto LABEL_9;
    }
    while (v6 >= v23)
    {
      _UIInternalPreferenceSync(v6, &_UIInternalPreference_UINavigationBackSwipeAlternate, @"UINavigationBackSwipeAlternate", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
      LODWORD(v7) = 0;
      int v23 = _UIInternalPreference_UINavigationBackSwipeAlternate;
      if (v6 == _UIInternalPreference_UINavigationBackSwipeAlternate) {
        goto LABEL_10;
      }
    }
    if (!byte_1E8FD50BC) {
LABEL_9:
    }
      LODWORD(v7) = 0;
    else {
      unint64_t v7 = ((unint64_t)[(UIGestureRecognizer *)self modifierFlags] >> 19) & 1;
    }
LABEL_10:
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v8 = [v4 view];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        double v10 = [v4 view];
        if ([v10 isDecelerating] & 1) != 0 || (objc_msgSend(v10, "_isBouncing"))
        {
          LOBYTE(v7) = 0;
        }
        else
        {
          char v16 = [(UIScreenEdgePanGestureRecognizer *)self edges];
          if (![v10 _canScrollX]
            || (v16 & 2) != 0
            && ([v10 contentOffset], double v18 = v17, objc_msgSend(v10, "_minimumContentOffset"), v18 <= v19)
            || (v16 & 8) != 0
            && ([v10 contentOffset], double v21 = v20, objc_msgSend(v10, "_maximumContentOffset"), v21 >= v22))
          {
            LOBYTE(v7) = 1;
          }
        }
        goto LABEL_30;
      }
    }
    if v7 && (objc_opt_class(), (objc_opt_isKindOfClass())
      || (_UISheetInteractionGestureIsForInteractiveDismiss(v4) & 1) != 0)
    {
      LOBYTE(v7) = 1;
    }
    else
    {
      double v12 = [v4 name];
      int v13 = [v12 isEqualToString:@"com.apple.UIKit.UIWindowDraggingPan"];

      if (v13)
      {
        unsigned int v14 = [(UIGestureRecognizer *)self _allActiveTouches];
        double v10 = [v14 anyObject];

        int v15 = [v10 view];
        objc_opt_class();
        LOBYTE(v7) = objc_opt_isKindOfClass();

LABEL_30:
        goto LABEL_16;
      }
      LOBYTE(v7) = 0;
    }
  }
LABEL_16:

  return v7 & 1;
}

- (BOOL)_skipDynamicDependentRequirementOverride
{
  return self->__skipDynamicDependentRequirementOverride;
}

@end
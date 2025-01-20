@interface UIInputViewAnimationStyle
+ (id)animationStyleAnimated:(BOOL)a3 duration:(double)a4;
+ (id)animationStyleDefault;
+ (id)animationStyleImmediate;
- (BOOL)animated;
- (BOOL)canDismissWithScrollView;
- (BOOL)canTakeSnapshot;
- (BOOL)dontMerge;
- (BOOL)forAssertion;
- (BOOL)force;
- (BOOL)interactivelyCancelled;
- (BOOL)isAnimationCompleted;
- (BOOL)isEqual:(id)a3;
- (NSMutableArray)propertyAnimators;
- (double)duration;
- (id)controllerForStartPlacement:(id)a3 endPlacement:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)endPlacementForInputViewSet:(id)a3;
- (id)endPlacementForInputViewSet:(id)a3 windowScene:(id)a4;
- (id)legacyAnimationCopy;
- (id)startPlacementForInputViewSet:(id)a3 currentPlacement:(id)a4;
- (id)startPlacementForInputViewSet:(id)a3 currentPlacement:(id)a4 windowScene:(id)a5;
- (unint64_t)extraOptions;
- (void)addAnimationToCurrentAnimations:(id)a3;
- (void)cancelInterruptibleAnimations;
- (void)launchAnimation:(id)a3 afterStarted:(id)a4 completion:(id)a5 forHost:(id)a6 fromCurrentPosition:(BOOL)a7;
- (void)removePropertyAnimators;
- (void)setAnimated:(BOOL)a3;
- (void)setDontMerge:(BOOL)a3;
- (void)setDuration:(double)a3;
- (void)setExtraOptions:(unint64_t)a3;
- (void)setForAssertion:(BOOL)a3;
- (void)setForce:(BOOL)a3;
- (void)setInteractivelyCancelled:(BOOL)a3;
- (void)setPropertyAnimators:(id)a3;
@end

@implementation UIInputViewAnimationStyle

+ (id)animationStyleImmediate
{
  return (id)[a1 animationStyleAnimated:0 duration:0.0];
}

- (void).cxx_destruct
{
}

+ (id)animationStyleAnimated:(BOOL)a3 duration:(double)a4
{
  BOOL v5 = a3;
  id v6 = objc_alloc_init((Class)a1);
  [v6 setAnimated:v5];
  [v6 setDuration:a4];
  [v6 setExtraOptions:458752];
  return v6;
}

- (void)setExtraOptions:(unint64_t)a3
{
  self->extraOptions = a3;
}

- (void)setDuration:(double)a3
{
  self->duration = a3;
}

- (void)setAnimated:(BOOL)a3
{
  self->animated = a3;
}

+ (id)animationStyleDefault
{
  return (id)[a1 animationStyleAnimated:1 duration:0.25];
}

- (id)endPlacementForInputViewSet:(id)a3 windowScene:(id)a4
{
  return +[UIPeripheralHost endPlacementForInputViewSet:a3 windowScene:a4];
}

- (unint64_t)extraOptions
{
  return self->extraOptions;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (unsigned char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setAnimated:", -[UIInputViewAnimationStyle animated](self, "animated"));
  [(UIInputViewAnimationStyle *)self duration];
  objc_msgSend(v4, "setDuration:");
  objc_msgSend(v4, "setExtraOptions:", -[UIInputViewAnimationStyle extraOptions](self, "extraOptions"));
  objc_msgSend(v4, "setInteractivelyCancelled:", -[UIInputViewAnimationStyle interactivelyCancelled](self, "interactivelyCancelled"));
  v4[33] = self->_isLegacy;
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (unsigned __int8 *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (int v5 = [v4 animated], v5 == -[UIInputViewAnimationStyle animated](self, "animated"))
    && v4[33] == self->_isLegacy)
  {
    if ([(UIInputViewAnimationStyle *)self animated])
    {
      [v4 duration];
      double v7 = v6;
      [(UIInputViewAnimationStyle *)self duration];
      BOOL v9 = v7 == v8;
    }
    else
    {
      BOOL v9 = 1;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)legacyAnimationCopy
{
  v2 = (unsigned char *)[(UIInputViewAnimationStyle *)self copy];
  v2[33] = 1;
  return v2;
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  v10.receiver = self;
  v10.super_class = (Class)UIInputViewAnimationStyle;
  v4 = [(UIInputViewAnimationStyle *)&v10 description];
  int v5 = [v3 stringWithFormat:@"<%@; ", v4];

  [(UIInputViewAnimationStyle *)self animated];
  double v6 = NSStringFromBOOL();
  [v5 appendFormat:@"animated = %@; ", v6];

  [(UIInputViewAnimationStyle *)self duration];
  objc_msgSend(v5, "appendFormat:", @"duration = %2g; ", v7);
  [(UIInputViewAnimationStyle *)self force];
  double v8 = NSStringFromBOOL();
  [v5 appendFormat:@"force = %@", v8];

  [v5 appendString:@">"];
  return v5;
}

- (BOOL)isAnimationCompleted
{
  return 0;
}

- (void)launchAnimation:(id)a3 afterStarted:(id)a4 completion:(id)a5 forHost:(id)a6 fromCurrentPosition:(BOOL)a7
{
  BOOL v7 = a7;
  v12 = (void (**)(void))a3;
  v13 = (void (**)(void))a4;
  id v14 = a5;
  id v15 = a6;
  if ([(UIInputViewAnimationStyle *)self animated])
  {
    unint64_t v16 = [(UIInputViewAnimationStyle *)self extraOptions];
    uint64_t v17 = 2;
    if (v7) {
      uint64_t v17 = 6;
    }
    unint64_t v18 = v16 | v17;
    [v15 syncToExistingAnimations];
    [(UIInputViewAnimationStyle *)self duration];
    double v20 = v19;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __97__UIInputViewAnimationStyle_launchAnimation_afterStarted_completion_forHost_fromCurrentPosition___block_invoke;
    v23[3] = &unk_1E52DA040;
    v24 = v12;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __97__UIInputViewAnimationStyle_launchAnimation_afterStarted_completion_forHost_fromCurrentPosition___block_invoke_2;
    v21[3] = &unk_1E52EDA60;
    v21[4] = self;
    id v22 = v14;
    +[UIView _animateWithDuration:v18 delay:v23 options:v13 animations:v21 start:v20 completion:0.0];
  }
  else
  {
    v12[2](v12);
    if (v13) {
      v13[2](v13);
    }
    if (v14) {
      (*((void (**)(id, uint64_t))v14 + 2))(v14, 1);
    }
    [(UIInputViewAnimationStyle *)self removePropertyAnimators];
  }
}

uint64_t __97__UIInputViewAnimationStyle_launchAnimation_afterStarted_completion_forHost_fromCurrentPosition___block_invoke(uint64_t a1)
{
  CAFrameRateRange v5 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  uint64_t v2 = *(void *)(a1 + 32);
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048619, v2, *(double *)&v5.minimum, *(double *)&v5.maximum, *(double *)&v5.preferred);
}

uint64_t __97__UIInputViewAnimationStyle_launchAnimation_afterStarted_completion_forHost_fromCurrentPosition___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  v3 = *(void **)(a1 + 32);
  return [v3 removePropertyAnimators];
}

- (void)addAnimationToCurrentAnimations:(id)a3
{
  objc_super v10 = (void (**)(void))a3;
  if (+[UIKeyboard inputUIOOP])
  {
    v4 = [(UIInputViewAnimationStyle *)self propertyAnimators];

    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      [(UIInputViewAnimationStyle *)self setPropertyAnimators:v5];
    }
    unint64_t v6 = ([(UIInputViewAnimationStyle *)self extraOptions] >> 16) & 7;
    BOOL v7 = [UIViewPropertyAnimator alloc];
    [(UIInputViewAnimationStyle *)self duration];
    double v8 = -[UIViewPropertyAnimator initWithDuration:curve:animations:](v7, "initWithDuration:curve:animations:", v6, v10);
    BOOL v9 = [(UIInputViewAnimationStyle *)self propertyAnimators];
    [v9 addObject:v8];

    [(UIViewPropertyAnimator *)v8 startAnimation];
  }
  else
  {
    v10[2]();
  }
}

- (void)cancelInterruptibleAnimations
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = [(UIInputViewAnimationStyle *)self propertyAnimators];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if ([v8 isInterruptible]) {
          [v8 stopAnimation:1];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  [(UIInputViewAnimationStyle *)self removePropertyAnimators];
}

- (void)removePropertyAnimators
{
  id v2 = [(UIInputViewAnimationStyle *)self propertyAnimators];
  [v2 removeAllObjects];
}

- (id)controllerForStartPlacement:(id)a3 endPlacement:(id)a4
{
  uint64_t v4 = objc_alloc_init(UIInputViewAnimationControllerBasic);
  return v4;
}

- (id)startPlacementForInputViewSet:(id)a3 currentPlacement:(id)a4
{
  return [(UIInputViewAnimationStyle *)self startPlacementForInputViewSet:a3 currentPlacement:a4 windowScene:0];
}

- (id)endPlacementForInputViewSet:(id)a3
{
  return [(UIInputViewAnimationStyle *)self endPlacementForInputViewSet:a3 windowScene:0];
}

- (id)startPlacementForInputViewSet:(id)a3 currentPlacement:(id)a4 windowScene:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x2020000000;
  char v41 = 0;
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __88__UIInputViewAnimationStyle_startPlacementForInputViewSet_currentPlacement_windowScene___block_invoke;
  v37[3] = &unk_1E52D9900;
  v37[4] = &v38;
  +[UIKeyboardImpl performWithoutFloatingLock:v37];
  if ((*((unsigned char *)v39 + 24) || ([v9 showsInputViews] & 1) == 0)
    && ![v9 isUndocked])
  {
    if (!*((unsigned char *)v39 + 24))
    {
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __88__UIInputViewAnimationStyle_startPlacementForInputViewSet_currentPlacement_windowScene___block_invoke_2;
      v34[3] = &unk_1E52F09A8;
      v34[4] = self;
      id v35 = v8;
      id v36 = v10;
      uint64_t v14 = +[UIInputViewSetPlacement deactivatedKeyboardPlacementWithCurrentPlacement:v34];

      goto LABEL_18;
    }
    v13 = [(UIInputViewAnimationStyle *)self endPlacementForInputViewSet:v8 windowScene:v10];

    if ([v13 isVisible])
    {
      uint64_t v14 = +[UIInputViewSetPlacementInvisibleForFloatingTransition placementWithPlacement:v13];
      id v9 = v13;
      goto LABEL_18;
    }
    id v15 = v13;
    goto LABEL_16;
  }
  if (!+[UIKeyboard usesInputSystemUI]
    && [v8 isInputViewPlaceholder])
  {
    long long v11 = [v8 inputView];
    long long v12 = [v11 fallbackView];
    if (v12)
    {
    }
    else
    {
      unint64_t v16 = [v11 associatedView];

      if (v16) {
        goto LABEL_15;
      }
      long long v11 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
      if (([v11 keyboardActive] & 1) == 0)
      {
        unint64_t v18 = [v8 inputView];
        double v19 = [v18 placeheldView];

        if (!v19)
        {
          if (([v8 isCustomInputView] & 1) != 0
            || (+[UIKeyboardImpl activeInstance],
                double v20 = objc_claimAutoreleasedReturnValue(),
                char v21 = [v20 isMinimized],
                v20,
                double v22 = 0.0,
                (v21 & 1) == 0))
          {
            v23 = +[_UIRemoteKeyboards sharedRemoteKeyboards];
            [v23 intersectionHeightForWindowScene:0];
            double v22 = v24;
          }
          v25 = [v8 inputAccessoryView];

          if (v25)
          {
            v26 = [v8 inputAccessoryView];
            [v26 size];
            double v22 = v22 + v27;
          }
          if (([v9 isUndocked] & 1) == 0)
          {
            v28 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
            char v29 = [v28 updatingHeight];

            if ((v29 & 1) == 0)
            {
              v30 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
              int v31 = [v30 remoteKeyboardUndocked];

              if (!v31)
              {
                id v15 = +[UIInputViewSetPlacementPlaceholder placementWithHeight:v22];
                goto LABEL_17;
              }
              +[UIKeyboardImpl normalizedPersistentOffset];
              if (v33 != 0.0)
              {
                +[UIInputViewSetPlacementPlaceholderUndocked placementWithHeight:undockedOffset:chromeBuffer:](UIInputViewSetPlacementPlaceholderUndocked, "placementWithHeight:undockedOffset:chromeBuffer:", v22, v32, v33, 92.0, 0.0, 0.0, 0.0);
                id v15 = (id)objc_claimAutoreleasedReturnValue();
                goto LABEL_17;
              }
            }
          }
        }
        goto LABEL_15;
      }
    }
  }
LABEL_15:
  id v15 = v9;
LABEL_16:
  id v9 = v15;
LABEL_17:
  uint64_t v14 = v15;
LABEL_18:
  _Block_object_dispose(&v38, 8);

  return v14;
}

BOOL __88__UIInputViewAnimationStyle_startPlacementForInputViewSet_currentPlacement_windowScene___block_invoke(uint64_t a1)
{
  BOOL result = +[UIKeyboardImpl isFloating];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __88__UIInputViewAnimationStyle_startPlacementForInputViewSet_currentPlacement_windowScene___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) endPlacementForInputViewSet:*(void *)(a1 + 40) windowScene:*(void *)(a1 + 48)];
}

- (BOOL)canDismissWithScrollView
{
  return 1;
}

- (BOOL)canTakeSnapshot
{
  return 0;
}

- (BOOL)animated
{
  return self->animated;
}

- (double)duration
{
  return self->duration;
}

- (BOOL)force
{
  return self->force;
}

- (void)setForce:(BOOL)a3
{
  self->force = a3;
}

- (BOOL)interactivelyCancelled
{
  return self->interactivelyCancelled;
}

- (void)setInteractivelyCancelled:(BOOL)a3
{
  self->interactivelyCancelled = a3;
}

- (BOOL)dontMerge
{
  return self->_dontMerge;
}

- (void)setDontMerge:(BOOL)a3
{
  self->_dontMerge = a3;
}

- (NSMutableArray)propertyAnimators
{
  return self->_propertyAnimators;
}

- (void)setPropertyAnimators:(id)a3
{
}

- (BOOL)forAssertion
{
  return self->_forAssertion;
}

- (void)setForAssertion:(BOOL)a3
{
  self->_forAssertion = a3;
}

@end
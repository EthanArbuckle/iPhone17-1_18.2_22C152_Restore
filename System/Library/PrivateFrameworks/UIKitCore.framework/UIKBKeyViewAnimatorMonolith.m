@interface UIKBKeyViewAnimatorMonolith
- (BOOL)shouldAssertCurrentKeyState:(id)a3;
- (BOOL)shouldTransitionKeyView:(id)a3 fromState:(int)a4 toState:(int)a5;
- (Class)keyViewClassForKey:(id)a3 renderTraits:(id)a4 screenTraits:(id)a5;
- (UIKBKeyViewAnimatorMonolith)init;
- (int64_t)_transitionFromState:(int)a3 toState:(int)a4;
- (unint64_t)controlStateForKeyState:(int)a3;
- (void)addTransitionCompletion:(id)a3 forKeyName:(id)a4;
- (void)animateFloatingKeyView:(id)a3 toControlState:(unint64_t)a4;
- (void)floatingContentView:(id)a3 didFinishTransitioningToState:(unint64_t)a4;
- (void)reset;
- (void)transitionFloatingKeyView:(id)a3 toState:(int)a4 completion:(id)a5;
- (void)transitionKeyView:(id)a3 fromState:(int)a4 toState:(int)a5 completion:(id)a6;
- (void)transitionOutKeyView:(id)a3 fromState:(int)a4 toState:(int)a5 completion:(id)a6;
@end

@implementation UIKBKeyViewAnimatorMonolith

- (UIKBKeyViewAnimatorMonolith)init
{
  v8.receiver = self;
  v8.super_class = (Class)UIKBKeyViewAnimatorMonolith;
  v2 = [(UIKBKeyViewAnimatorMonolith *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    selectedKeyTimestamps = v2->_selectedKeyTimestamps;
    v2->_selectedKeyTimestamps = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    transitionCompletions = v2->_transitionCompletions;
    v2->_transitionCompletions = v5;
  }
  return v2;
}

- (Class)keyViewClassForKey:(id)a3 renderTraits:(id)a4 screenTraits:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v8 representedString];
  int v12 = [v11 isEqualToString:@"Recent-Inputs"];

  if (v12) {
    goto LABEL_2;
  }
  if ([v8 interactionType] == 3)
  {
    [v10 isLinear];
LABEL_2:
    objc_opt_class();
    v13 = (objc_class *)objc_claimAutoreleasedReturnValue();
    goto LABEL_3;
  }
  if ([v8 interactionType] == 39) {
    goto LABEL_2;
  }
  if (([v9 blurBlending] & 1) != 0
    || ([v9 variantTraits],
        v16 = objc_claimAutoreleasedReturnValue(),
        int v17 = [v16 blurBlending],
        v16,
        v17))
  {
    [v9 variantTraits];

    goto LABEL_2;
  }
  v18 = [(UIKBKeyViewAnimator *)self _keyViewClassForSpecialtyKey:v8 screenTraits:v10];
  if (!v18) {
    goto LABEL_2;
  }
  v13 = v18;
LABEL_3:
  v14 = v13;

  return v14;
}

- (unint64_t)controlStateForKeyState:(int)a3
{
  uint64_t v3 = 8;
  if (a3 == 12) {
    uint64_t v3 = 9;
  }
  if ((a3 & 0xC) == 0) {
    uint64_t v3 = 0;
  }
  return v3 | (2 * (a3 & 1u)) | (a3 >> 4) & 1;
}

- (void)floatingContentView:(id)a3 didFinishTransitioningToState:(unint64_t)a4
{
  v6 = [a3 superview];
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:a2 object:self file:@"UIKBKeyViewAnimatorMonolith.m" lineNumber:120 description:@"this should be a keyView!"];
    }
    v7 = [v6 key];
    transitionCompletions = self->_transitionCompletions;
    id v9 = [v7 name];
    id v10 = [(NSMutableDictionary *)transitionCompletions objectForKey:v9];

    v11 = (void *)[v10 copy];
    [v10 removeAllObjects];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __81__UIKBKeyViewAnimatorMonolith_floatingContentView_didFinishTransitioningToState___block_invoke;
    v14[3] = &unk_1E52F9F08;
    id v15 = v11;
    id v12 = v11;
    [v12 enumerateObjectsUsingBlock:v14];
  }
}

void __81__UIKBKeyViewAnimatorMonolith_floatingContentView_didFinishTransitioningToState___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v4 = *(void **)(a1 + 32);
  v5 = a2;
  v5[2](v5, [v4 count] - 1 == a3);
}

- (int64_t)_transitionFromState:(int)a3 toState:(int)a4
{
  int64_t result = 0;
  int v5 = a4 | (a3 << 8);
  if (v5 > 1025)
  {
    if (v5 > 2051)
    {
      if (v5 != 2052 && v5 != 4098 && v5 != 5122) {
        return result;
      }
    }
    else if (v5 != 1026)
    {
      if (v5 == 1032) {
        return 1;
      }
      if (v5 != 2050) {
        return result;
      }
    }
    return 2;
  }
  if ((v5 - 513) <= 0x13)
  {
    if (((1 << (a4 - 1)) & 0x88088) != 0) {
      return 1;
    }
    if (v5 == 513) {
      return 2;
    }
  }
  if (v5 == 258) {
    return 1;
  }
  return result;
}

- (void)addTransitionCompletion:(id)a3 forKeyName:(id)a4
{
  id v9 = a4;
  v6 = (void *)[a3 copy];
  v7 = [(NSMutableDictionary *)self->_transitionCompletions objectForKey:v9];
  if (!v7)
  {
    v7 = [MEMORY[0x1E4F1CA48] array];
    [(NSMutableDictionary *)self->_transitionCompletions setObject:v7 forKey:v9];
  }
  id v8 = _Block_copy(v6);
  [v7 addObject:v8];
}

- (void)transitionFloatingKeyView:(id)a3 toState:(int)a4 completion:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = a5;
  unint64_t v10 = [(UIKBKeyViewAnimatorMonolith *)self controlStateForKeyState:v6];
  v11 = [v8 floatingContentView];
  transitionCompletions = self->_transitionCompletions;
  v13 = [v8 key];
  v14 = [v13 name];
  id v15 = [(NSMutableDictionary *)transitionCompletions objectForKey:v14];

  if ([v11 controlState] != v10)
  {
    if ([v15 count])
    {
      uint64_t v24 = MEMORY[0x1E4F143A8];
      uint64_t v25 = 3221225472;
      v26 = __76__UIKBKeyViewAnimatorMonolith_transitionFloatingKeyView_toState_completion___block_invoke;
      v27 = &unk_1E52F9F30;
      v28 = self;
      id v18 = v8;
      int v31 = v6;
      id v29 = v18;
      id v30 = v9;
      id v9 = v9;
      v19 = _Block_copy(&v24);
      v20 = objc_msgSend(v18, "key", v24, v25, v26, v27, v28);
      v21 = [v20 name];
      [(UIKBKeyViewAnimatorMonolith *)self addTransitionCompletion:v19 forKeyName:v21];
    }
    else
    {
      if (!v9) {
        id v9 = &__block_literal_global_323;
      }
      v22 = [v8 key];
      v23 = [v22 name];
      [(UIKBKeyViewAnimatorMonolith *)self addTransitionCompletion:v9 forKeyName:v23];

      [v11 setFloatingContentDelegate:self];
      [v11 setControlState:v10 animated:1];
      [(UIKBKeyViewAnimatorMonolith *)self animateFloatingKeyView:v8 toControlState:v10];
    }
    goto LABEL_11;
  }
  if (v9)
  {
    if ([v15 count])
    {
      v16 = [v8 key];
      int v17 = [v16 name];
      [(UIKBKeyViewAnimatorMonolith *)self addTransitionCompletion:v9 forKeyName:v17];
    }
    else
    {
      (*((void (**)(id, uint64_t))v9 + 2))(v9, 1);
    }
LABEL_11:
  }
}

uint64_t __76__UIKBKeyViewAnimatorMonolith_transitionFloatingKeyView_toState_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) transitionFloatingKeyView:*(void *)(a1 + 40) toState:*(unsigned int *)(a1 + 56) completion:*(void *)(a1 + 48)];
}

- (void)animateFloatingKeyView:(id)a3 toControlState:(unint64_t)a4
{
  id v5 = a3;
  uint64_t v6 = [v5 floatingContentView];
  memset(&v60, 0, sizeof(v60));
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  v53 = v6;
  long long v7 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
  if (a4 == 8)
  {
    *(_OWORD *)&v59.m31 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
    *(_OWORD *)&v59.m33 = v7;
    long long v15 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
    *(_OWORD *)&v59.m41 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
    *(_OWORD *)&v59.m43 = v15;
    long long v16 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
    *(_OWORD *)&v59.m11 = *MEMORY[0x1E4F39B10];
    *(_OWORD *)&v59.m13 = v16;
    long long v17 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
    *(_OWORD *)&v59.m21 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
    *(_OWORD *)&v59.m23 = v17;
    double v14 = 1.0;
    CATransform3DScale(&v60, &v59, 1.1, 1.1, 1.0);
    id v18 = [v6 focusAnimationConfiguration];
    [v18 focusingBaseDuration];
    double v13 = v19;
  }
  else
  {
    *(_OWORD *)&v60.m31 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
    *(_OWORD *)&v60.m33 = v7;
    long long v8 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
    *(_OWORD *)&v60.m41 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
    *(_OWORD *)&v60.m43 = v8;
    long long v9 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
    *(_OWORD *)&v60.m11 = *MEMORY[0x1E4F39B10];
    *(_OWORD *)&v60.m13 = v9;
    long long v10 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
    *(_OWORD *)&v60.m21 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
    *(_OWORD *)&v60.m23 = v10;
    [v6 focusAnimationConfiguration];
    if (a4 == 9) {
      v11 = {;
    }
      [v11 focusingBaseDuration];
      double v13 = v12;

      double v14 = 1.0;
    }
    else {
      v20 = {;
    }
      [v20 unfocusingBaseDuration];
      double v13 = v21;

      double v14 = 0.0;
    }
  }
  v22 = [v5 layerForRenderFlags:4];
  uint64_t v23 = [v22 animationForKey:@"transform"];
  uint64_t v24 = [v22 animationForKey:@"opacity"];
  v52 = (void *)v23;
  if (v23) {
    [v22 removeAnimationForKey:@"transform"];
  }
  if (v24) {
    [v22 removeAnimationForKey:@"opacity"];
  }
  uint64_t v25 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"transform"];
  uint64_t v26 = *MEMORY[0x1E4F39FA0];
  [v25 setFillMode:*MEMORY[0x1E4F39FA0]];
  [v25 setDuration:v13];
  v27 = (void *)MEMORY[0x1E4F29238];
  if (v22) {
    [v22 transform];
  }
  else {
    memset(v58, 0, sizeof(v58));
  }
  v28 = [v27 valueWithCATransform3D:v58];
  [v25 setFromValue:v28];

  CATransform3D v59 = v60;
  id v29 = [MEMORY[0x1E4F29238] valueWithCATransform3D:&v59];
  [v25 setToValue:v29];

  id v30 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"opacity"];
  [v30 setFillMode:v26];
  [v30 setDuration:v13];
  int v31 = NSNumber;
  [v22 opacity];
  v32 = objc_msgSend(v31, "numberWithFloat:");
  [v30 setFromValue:v32];

  v33 = [NSNumber numberWithDouble:v14];
  [v30 setToValue:v33];

  CATransform3D v57 = v60;
  [v22 setTransform:&v57];
  v34 = [v5 layer];
  *(float *)&double v35 = v14;
  [v34 setOpacity:v35];

  if (v13 > 0.0)
  {
    [v22 addAnimation:v25 forKey:@"transform"];
    v36 = [v5 layer];
    [v36 addAnimation:v30 forKey:@"opacity"];
  }
  v37 = [v5 layerForRenderFlags:1];
  uint64_t v38 = [v37 animationForKey:@"transform"];
  v39 = [v37 animationForKey:@"opacity"];
  uint64_t v49 = v38;
  if (v38) {
    objc_msgSend(v37, "removeAnimationForKey:", @"transform", v38);
  }
  if (v39) {
    [v37 removeAnimationForKey:@"opacity"];
  }
  v51 = (void *)v24;
  CATransform3D v59 = v60;
  if (objc_msgSend(v5, "imageOrientationForLayer:", v37, v49) == 1)
  {
    CATransform3D v56 = v59;
    CATransform3DScale(&v59, &v56, 1.0, -1.0, 1.0);
  }
  v40 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"transform"];
  [v40 setFillMode:v26];
  [v40 setDuration:v13];
  v41 = (void *)MEMORY[0x1E4F29238];
  if (v37) {
    [v37 transform];
  }
  else {
    memset(v55, 0, sizeof(v55));
  }
  v42 = [v41 valueWithCATransform3D:v55];
  [v40 setFromValue:v42];

  CATransform3D v56 = v59;
  v43 = [MEMORY[0x1E4F29238] valueWithCATransform3D:&v56];
  [v40 setToValue:v43];

  v44 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"opacity"];
  [v44 setFillMode:v26];
  [v44 setDuration:v13];
  v45 = NSNumber;
  [v37 opacity];
  v46 = objc_msgSend(v45, "numberWithFloat:");
  [v44 setFromValue:v46];

  v47 = [NSNumber numberWithDouble:v14];
  [v44 setToValue:v47];

  CATransform3D v54 = v59;
  [v37 setTransform:&v54];
  *(float *)&double v48 = v14;
  [v37 setOpacity:v48];
  if (v13 > 0.0)
  {
    [v37 addAnimation:v40 forKey:@"transform"];
    [v37 addAnimation:v44 forKey:@"opacity"];
  }
  [MEMORY[0x1E4F39CF8] commit];
}

- (BOOL)shouldAssertCurrentKeyState:(id)a3
{
  return [a3 state] == 8;
}

- (BOOL)shouldTransitionKeyView:(id)a3 fromState:(int)a4 toState:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  long long v9 = [v8 key];
  if ([v9 interactionType] == 3)
  {
    unsigned __int8 v10 = v6 == 0;
  }
  else
  {
    int v11 = [v9 variantType];
    if (v5 == 16 && v6 == 4 && v11)
    {
      unsigned __int8 v10 = 0;
    }
    else
    {
      v13.receiver = self;
      v13.super_class = (Class)UIKBKeyViewAnimatorMonolith;
      unsigned __int8 v10 = [(UIKBKeyViewAnimator *)&v13 shouldTransitionKeyView:v8 fromState:v6 toState:v5];
    }
  }

  return v10;
}

- (void)transitionKeyView:(id)a3 fromState:(int)a4 toState:(int)a5 completion:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = *(void *)&a4;
  id v10 = a3;
  int v11 = (void (**)(id, BOOL))a6;
  double v12 = [v10 key];
  selectedKeyTimestamps = self->_selectedKeyTimestamps;
  double v14 = NSNumber;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  long long v15 = objc_msgSend(v14, "numberWithDouble:");
  long long v16 = [v12 name];
  [(NSMutableDictionary *)selectedKeyTimestamps setObject:v15 forKey:v16];

  long long v17 = [v10 renderConfig];
  LODWORD(v15) = [v17 lightKeyboard];

  if (v15) {
    double v18 = 0.06;
  }
  else {
    double v18 = 0.0;
  }
  transitionCompletions = self->_transitionCompletions;
  v20 = [v12 name];
  double v21 = [(NSMutableDictionary *)transitionCompletions objectForKey:v20];

  id v25 = v10;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v23 = [v25 floatingContentView];
    uint64_t v24 = [v23 focusAnimationConfiguration];
    [v24 setFocusingBaseDuration:v18];

    [(UIKBKeyViewAnimatorMonolith *)self transitionFloatingKeyView:v25 toState:v7 completion:v11];
  }
  else if ([v12 interactionType] == 10 {
         || [(UIKBKeyViewAnimatorMonolith *)self _transitionFromState:v8 toState:v7] != 1)
  }
  {
    if (v11) {
      v11[2](v11, [v21 count] == 0);
    }
  }
  else
  {
    [(UIKBKeyViewAnimator *)self _fadeInKeyView:v25 duration:v11 completion:v18];
  }
}

- (void)transitionOutKeyView:(id)a3 fromState:(int)a4 toState:(int)a5 completion:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = *(void *)&a4;
  id v10 = a3;
  int v11 = (void (**)(id, BOOL))a6;
  double v12 = [v10 key];
  selectedKeyTimestamps = self->_selectedKeyTimestamps;
  double v14 = [v12 name];
  long long v15 = [(NSMutableDictionary *)selectedKeyTimestamps objectForKey:v14];
  [v15 doubleValue];
  double v17 = v16;

  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v19 = v18 - v17;
  double v20 = fmax(v19 * 0.5 + (1.0 - v19) * 0.2, 0.2);
  if (v20 > 0.5) {
    double v20 = 0.5;
  }
  if (v19 >= 3.0) {
    double v21 = 0.2;
  }
  else {
    double v21 = v20;
  }
  v22 = [v10 renderConfig];
  int v23 = [v22 lightKeyboard];

  if (!v23) {
    double v21 = 0.0;
  }
  transitionCompletions = self->_transitionCompletions;
  id v25 = [v12 name];
  uint64_t v26 = [(NSMutableDictionary *)transitionCompletions objectForKey:v25];

  id v30 = v10;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v28 = [v30 floatingContentView];
    id v29 = [v28 focusAnimationConfiguration];
    [v29 setUnfocusingBaseDuration:v21];

    [(UIKBKeyViewAnimatorMonolith *)self transitionFloatingKeyView:v30 toState:v7 completion:v11];
  }
  else if ([v12 interactionType] == 10 {
         || [(UIKBKeyViewAnimatorMonolith *)self _transitionFromState:v8 toState:v7] != 2)
  }
  {
    if (v11) {
      v11[2](v11, [v26 count] == 0);
    }
  }
  else
  {
    [(UIKBKeyViewAnimator *)self _fadeOutKeyView:v30 duration:v11 completion:v21];
  }
}

- (void)reset
{
  [(NSMutableDictionary *)self->_selectedKeyTimestamps removeAllObjects];
  transitionCompletions = self->_transitionCompletions;
  [(NSMutableDictionary *)transitionCompletions removeAllObjects];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionCompletions, 0);
  objc_storeStrong((id *)&self->_selectedKeyTimestamps, 0);
}

@end
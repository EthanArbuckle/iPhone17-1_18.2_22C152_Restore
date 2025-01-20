@interface UIView(NAUIAdditions)
+ (uint64_t)naui_beginDisablingAnimations;
+ (uint64_t)naui_endDisablingAnimations;
+ (void)naui_performAnimateableChangesWithAnimationDuration:()NAUIAdditions setupBlock:animatablesBlock:completion:;
+ (void)naui_prepareToAutolayoutProperDescendantsOfView:()NAUIAdditions inConstraints:;
- (BOOL)naui_canAnimate;
- (id)_naui_constraintsByNameDictionary:()NAUIAdditions;
- (id)_naui_constraintsNamed:()NAUIAdditions;
- (id)naui_dynamicFontTextStyleDescriptor;
- (uint64_t)naui_isProperDescendantOfView:()NAUIAdditions;
- (uint64_t)naui_replaceConstraint:()NAUIAdditions withConstraints:;
- (uint64_t)naui_replaceConstraints:()NAUIAdditions withConstraints:;
- (void)naui_addAutoLayoutSubview:()NAUIAdditions;
- (void)naui_addAutoLayoutSubviews:()NAUIAdditions;
- (void)naui_addConstraint:()NAUIAdditions;
- (void)naui_addConstraints:()NAUIAdditions;
- (void)naui_performAnimateableConstraintChanges:()NAUIAdditions;
- (void)naui_reloadDynamicFontWithTextStyleDescriptor:()NAUIAdditions;
- (void)naui_removeConstraint:()NAUIAdditions;
- (void)naui_removeConstraints:()NAUIAdditions;
- (void)naui_removeConstraintsNamed:()NAUIAdditions;
- (void)naui_removeNamedConstraints;
- (void)naui_setDynamicFontTextStyleDescriptor:()NAUIAdditions;
- (void)naui_setNamedConstraints:()NAUIAdditions forName:;
- (void)naui_showAllViewBoundsRecursively:()NAUIAdditions;
@end

@implementation UIView(NAUIAdditions)

- (void)naui_showAllViewBoundsRecursively:()NAUIAdditions
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v5 = (void *)MEMORY[0x263F1C550];
  double v6 = (double)arc4random_uniform(0xFFu) / 255.0;
  double v7 = (double)arc4random_uniform(0xFFu) / 255.0;
  v8 = [v5 colorWithRed:v6 green:v7 blue:(double)arc4random_uniform(0xFFu) / 255.0 alpha:0.400000006];
  [a1 setBackgroundColor:v8];

  if (a3)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v9 = objc_msgSend(a1, "subviews", 0);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v15;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(v9);
          }
          objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v13++), "naui_showAllViewBoundsRecursively:", 1);
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v11);
    }
  }
}

- (void)naui_setDynamicFontTextStyleDescriptor:()NAUIAdditions
{
  id value = a3;
  v4 = objc_getAssociatedObject(a1, "naui_dynamicFontTextStyleDescriptor");
  if (([v4 isEqual:value] & 1) == 0)
  {
    objc_setAssociatedObject(a1, "naui_dynamicFontTextStyleDescriptor", value, (void *)0x303);
    if (value)
    {
      objc_getAssociatedObject(a1, "naui_dynamicFontObserverKey");
      v5 = (_NAUIAutoUpdatingFontObserver *)objc_claimAutoreleasedReturnValue();
      if (!v5)
      {
        v5 = [[_NAUIAutoUpdatingFontObserver alloc] initWithTarget:a1];
        objc_setAssociatedObject(a1, "naui_dynamicFontObserverKey", v5, (void *)0x301);
      }
      [(_NAUIAutoUpdatingFontObserver *)v5 updateDyamicFontForCurrentContentSize];
    }
    else
    {
      objc_setAssociatedObject(a1, "naui_dynamicFontObserverKey", 0, (void *)0x301);
    }
  }
}

- (id)naui_dynamicFontTextStyleDescriptor
{
  v2 = objc_getAssociatedObject(a1, "naui_dynamicFontTextStyleDescriptor");
  if (!v2)
  {
    if (objc_opt_respondsToSelector())
    {
      v2 = objc_msgSend((id)objc_msgSend(a1, "font"), "naui_dynamicFontTextStyleDescriptor");
    }
    else
    {
      v2 = 0;
    }
  }
  return v2;
}

- (BOOL)naui_canAnimate
{
  if (![MEMORY[0x263F1CB60] areAnimationsEnabled]) {
    return 0;
  }
  v2 = [a1 window];
  BOOL v3 = v2 != 0;

  return v3;
}

+ (uint64_t)naui_beginDisablingAnimations
{
  if (!_animationsDisabledCount++) {
    return [MEMORY[0x263F1CB60] setAnimationsEnabled:0];
  }
  return result;
}

+ (uint64_t)naui_endDisablingAnimations
{
  if (!--_animationsDisabledCount) {
    return [MEMORY[0x263F1CB60] setAnimationsEnabled:1];
  }
  return result;
}

+ (void)naui_performAnimateableChangesWithAnimationDuration:()NAUIAdditions setupBlock:animatablesBlock:completion:
{
  id v11 = a4;
  v9 = a5;
  uint64_t v10 = a6;
  if (v11) {
    [MEMORY[0x263F1CB60] performWithoutAnimation:v11];
  }
  if ([MEMORY[0x263F1CB60] areAnimationsEnabled])
  {
    [MEMORY[0x263F1CB60] animateWithDuration:v9 animations:v10 completion:a1];
  }
  else
  {
    if (v9) {
      v9[2](v9);
    }
    if (v10) {
      v10[2](v10, 1);
    }
  }
}

- (void)naui_performAnimateableConstraintChanges:()NAUIAdditions
{
  v5 = a3;
  double v6 = objc_getAssociatedObject(a1, a2);
  uint64_t v7 = [v6 integerValue];

  if (!v7)
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __66__UIView_NAUIAdditions__naui_performAnimateableConstraintChanges___block_invoke;
    v13[3] = &unk_264627EB8;
    v13[4] = a1;
    [MEMORY[0x263F1CB60] performWithoutAnimation:v13];
  }
  v8 = [NSNumber numberWithInteger:v7 + 1];
  objc_setAssociatedObject(a1, a2, v8, (void *)1);

  v5[2](v5);
  v9 = objc_getAssociatedObject(a1, a2);
  uint64_t v10 = [v9 integerValue];

  uint64_t v11 = v10 - 1;
  if (v10 == 1)
  {
    objc_msgSend(a1, "layoutIfNeeded", v11);
    objc_setAssociatedObject(a1, a2, 0, (void *)1);
  }
  else
  {
    if (v10 <= 0) {
      -[UIView(NAUIAdditions) naui_performAnimateableConstraintChanges:]();
    }
    uint64_t v12 = [NSNumber numberWithInteger:v11];
    objc_setAssociatedObject(a1, a2, v12, (void *)1);
  }
}

- (void)naui_addAutoLayoutSubview:()NAUIAdditions
{
  id v4 = a3;
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  [a1 addSubview:v4];
}

- (void)naui_addAutoLayoutSubviews:()NAUIAdditions
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(a1, "naui_addAutoLayoutSubview:", *(void *)(*((void *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (uint64_t)naui_isProperDescendantOfView:()NAUIAdditions
{
  if (a3 == a1) {
    return 0;
  }
  else {
    return objc_msgSend(a1, "isDescendantOfView:");
  }
}

+ (void)naui_prepareToAutolayoutProperDescendantsOfView:()NAUIAdditions inConstraints:
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = objc_msgSend(MEMORY[0x263F34230], "naui_viewsInConstraints:", a4);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v11, "naui_isProperDescendantOfView:", v5)) {
          [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)naui_reloadDynamicFontWithTextStyleDescriptor:()NAUIAdditions
{
  id v5 = a3;
  if (objc_opt_respondsToSelector())
  {
    id v4 = +[NAUITextStyleDescriptor fontWithTextStyleDescriptor:v5];
    [a1 setFont:v4];
  }
}

- (void)naui_removeConstraint:()NAUIAdditions
{
  if (a3) {
    return objc_msgSend(a1, "removeConstraint:");
  }
  return a1;
}

- (void)naui_removeConstraints:()NAUIAdditions
{
  if (a3) {
    return objc_msgSend(a1, "removeConstraints:");
  }
  return a1;
}

- (void)naui_addConstraint:()NAUIAdditions
{
  if (a3) {
    return objc_msgSend(a1, "addConstraint:");
  }
  return a1;
}

- (void)naui_addConstraints:()NAUIAdditions
{
  if (a3) {
    return objc_msgSend(a1, "addConstraints:");
  }
  return a1;
}

- (uint64_t)naui_replaceConstraint:()NAUIAdditions withConstraints:
{
  id v6 = a3;
  id v7 = a4;
  int v8 = objc_msgSend(v6, "naui_isEqualToConstraint:", v7);
  if ((v8 & 1) == 0)
  {
    objc_msgSend(a1, "naui_removeConstraint:", v6);
    objc_msgSend(a1, "naui_addConstraint:", v7);
  }

  return v8 ^ 1u;
}

- (uint64_t)naui_replaceConstraints:()NAUIAdditions withConstraints:
{
  id v6 = a3;
  id v7 = a4;
  int v8 = objc_msgSend(MEMORY[0x263F34230], "naui_areConstraints:equalToConstraints:", v6, v7);
  if ((v8 & 1) == 0)
  {
    objc_msgSend(a1, "naui_removeConstraints:", v6);
    objc_msgSend(a1, "naui_addConstraints:", v7);
  }

  return v8 ^ 1u;
}

- (id)_naui_constraintsByNameDictionary:()NAUIAdditions
{
  id v5 = objc_getAssociatedObject(a1, "_naui_constraintsByNameStorageKey");
  if (v5) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = a3 == 0;
  }
  if (!v6)
  {
    id v5 = [MEMORY[0x263EFF9A0] dictionary];
    objc_setAssociatedObject(a1, "_naui_constraintsByNameStorageKey", v5, (void *)0x301);
  }
  return v5;
}

- (id)_naui_constraintsNamed:()NAUIAdditions
{
  id v4 = a3;
  id v5 = objc_msgSend(a1, "_naui_constraintsByNameDictionary:", 0);
  BOOL v6 = [v5 objectForKey:v4];

  return v6;
}

- (void)naui_setNamedConstraints:()NAUIAdditions forName:
{
  id v11 = a3;
  id v6 = a4;
  if (v11)
  {
    id v7 = objc_msgSend(a1, "_naui_constraintsNamed:", v6);

    if (v7) {
      objc_msgSend(a1, "naui_removeConstraintsNamed:", v6);
    }
    int v8 = objc_msgSend(a1, "_naui_constraintsByNameDictionary:", 1);
    uint64_t v9 = [v11 constraints];

    if (v9)
    {
      long long v10 = [v11 constraints];
      [a1 addConstraints:v10];
    }
    [v8 setObject:v11 forKey:v6];
  }
  else
  {
    objc_msgSend(a1, "naui_removeConstraintsNamed:", v6);
  }
}

- (void)naui_removeConstraintsNamed:()NAUIAdditions
{
  id v9 = a3;
  id v4 = objc_msgSend(a1, "_naui_constraintsNamed:");
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 constraints];

    if (v6)
    {
      id v7 = [v5 constraints];
      [a1 removeConstraints:v7];
    }
    int v8 = objc_msgSend(a1, "_naui_constraintsByNameDictionary:", 0);
    [v8 removeObjectForKey:v9];
  }
}

- (void)naui_removeNamedConstraints
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = objc_msgSend(a1, "_naui_constraintsByNameDictionary:", 0);
  BOOL v3 = [v2 allKeys];

  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(a1, "naui_removeConstraintsNamed:", *(void *)(*((void *)&v9 + 1) + 8 * v8++), (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)naui_performAnimateableConstraintChanges:()NAUIAdditions .cold.1()
{
  __assert_rtn("-[UIView(NAUIAdditions) naui_performAnimateableConstraintChanges:]", "UIView+NAUIAdditions.m", 138, "nestedCount >= 0");
}

@end
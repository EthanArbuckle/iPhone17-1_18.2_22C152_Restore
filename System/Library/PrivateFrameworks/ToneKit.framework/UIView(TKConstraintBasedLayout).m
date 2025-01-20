@interface UIView(TKConstraintBasedLayout)
+ (id)_tk_viewForItem:()TKConstraintBasedLayout;
- (id)_tk_autolayoutTrace;
- (id)_tk_recursiveAutolayoutTraceAtLevel:()TKConstraintBasedLayout anyDescendantHasAmbiguousLayout:;
- (id)tk_addedConstraintForItem:()TKConstraintBasedLayout layoutAttribute:relatedBy:toItem:attribute:multiplier:constant:;
- (id)tk_constrainLayoutAttribute:()TKConstraintBasedLayout asEqualToConstant:;
- (id)tk_constrainLayoutAttribute:()TKConstraintBasedLayout asEqualToLayoutAttribute:ofItem:;
- (id)tk_constrainLayoutAttribute:()TKConstraintBasedLayout asEqualToLayoutAttribute:ofItem:withMultiplier:;
- (id)tk_constrainLayoutAttribute:()TKConstraintBasedLayout asEqualToLayoutAttribute:ofItem:withOffset:;
- (id)tk_constrainLayoutAttribute:()TKConstraintBasedLayout asEqualToValueOfItem:;
- (id)tk_constrainLayoutAttribute:()TKConstraintBasedLayout asEqualToValueOfItem:withMultiplier:;
- (id)tk_constrainLayoutAttribute:()TKConstraintBasedLayout asEqualToValueOfItem:withOffset:;
- (id)tk_constrainLayoutAttribute:()TKConstraintBasedLayout asGreaterThanOrEqualToValueOfItem:withOffset:;
- (id)tk_constrainLayoutAttribute:()TKConstraintBasedLayout asLessThanOrEqualToValueOfItem:withOffset:;
- (id)tk_constrainLayoutAttribute:()TKConstraintBasedLayout ofItem:asEqualToValueOfItem:;
- (id)tk_constrainLayoutAttribute:()TKConstraintBasedLayout relatedBy:toItem:attribute:multiplier:constant:;
- (id)tk_firstCommonAncestorWithView:()TKConstraintBasedLayout;
- (uint64_t)_tk_depth;
- (uint64_t)tk_addedConstraintForLayoutAttribute:()TKConstraintBasedLayout asEqualToConstant:;
- (uint64_t)tk_addedConstraintForLayoutAttribute:()TKConstraintBasedLayout asEqualToLayoutAttribute:ofItem:;
- (uint64_t)tk_addedConstraintForLayoutAttribute:()TKConstraintBasedLayout asEqualToLayoutAttribute:ofItem:withMultiplier:;
- (uint64_t)tk_addedConstraintForLayoutAttribute:()TKConstraintBasedLayout asEqualToLayoutAttribute:ofItem:withOffset:;
- (uint64_t)tk_addedConstraintForLayoutAttribute:()TKConstraintBasedLayout asEqualToValueOfItem:;
- (uint64_t)tk_addedConstraintForLayoutAttribute:()TKConstraintBasedLayout asEqualToValueOfItem:withMultiplier:;
- (uint64_t)tk_addedConstraintForLayoutAttribute:()TKConstraintBasedLayout asEqualToValueOfItem:withOffset:;
- (uint64_t)tk_addedConstraintForLayoutAttribute:()TKConstraintBasedLayout asGreaterThanOrEqualToValueOfItem:withOffset:;
- (uint64_t)tk_addedConstraintForLayoutAttribute:()TKConstraintBasedLayout asLessThanOrEqualToValueOfItem:withOffset:;
- (uint64_t)tk_addedConstraintForLayoutAttribute:()TKConstraintBasedLayout relatedBy:toItem:attribute:multiplier:constant:;
@end

@implementation UIView(TKConstraintBasedLayout)

- (id)tk_constrainLayoutAttribute:()TKConstraintBasedLayout asEqualToConstant:
{
  return (id)objc_msgSend(a1, "tk_addedConstraintForLayoutAttribute:asEqualToConstant:");
}

- (id)tk_constrainLayoutAttribute:()TKConstraintBasedLayout asEqualToValueOfItem:
{
  return (id)objc_msgSend(a1, "tk_addedConstraintForLayoutAttribute:asEqualToValueOfItem:");
}

- (id)tk_constrainLayoutAttribute:()TKConstraintBasedLayout asEqualToValueOfItem:withOffset:
{
  return (id)objc_msgSend(a1, "tk_addedConstraintForLayoutAttribute:asEqualToValueOfItem:withOffset:");
}

- (id)tk_constrainLayoutAttribute:()TKConstraintBasedLayout asEqualToLayoutAttribute:ofItem:
{
  return (id)objc_msgSend(a1, "tk_addedConstraintForLayoutAttribute:asEqualToLayoutAttribute:ofItem:");
}

- (id)tk_constrainLayoutAttribute:()TKConstraintBasedLayout asEqualToLayoutAttribute:ofItem:withOffset:
{
  return (id)objc_msgSend(a1, "tk_addedConstraintForLayoutAttribute:asEqualToLayoutAttribute:ofItem:withOffset:");
}

- (id)tk_constrainLayoutAttribute:()TKConstraintBasedLayout asEqualToValueOfItem:withMultiplier:
{
  return (id)objc_msgSend(a1, "tk_addedConstraintForLayoutAttribute:asEqualToValueOfItem:withMultiplier:");
}

- (id)tk_constrainLayoutAttribute:()TKConstraintBasedLayout asEqualToLayoutAttribute:ofItem:withMultiplier:
{
  return (id)objc_msgSend(a1, "tk_addedConstraintForLayoutAttribute:asEqualToLayoutAttribute:ofItem:withMultiplier:");
}

- (id)tk_constrainLayoutAttribute:()TKConstraintBasedLayout ofItem:asEqualToValueOfItem:
{
  return (id)objc_msgSend(a1, "tk_addedConstraintForItem:layoutAttribute:relatedBy:toItem:attribute:multiplier:constant:", a4, a3, 0, a5, 1.0, 0.0);
}

- (uint64_t)tk_addedConstraintForLayoutAttribute:()TKConstraintBasedLayout asEqualToConstant:
{
  return objc_msgSend(a1, "tk_addedConstraintForLayoutAttribute:relatedBy:toItem:attribute:multiplier:constant:", a3, 0, 0, 0, 1.0, a4);
}

- (uint64_t)tk_addedConstraintForLayoutAttribute:()TKConstraintBasedLayout asEqualToValueOfItem:
{
  return objc_msgSend(a1, "tk_addedConstraintForLayoutAttribute:asEqualToValueOfItem:withOffset:", 0.0);
}

- (uint64_t)tk_addedConstraintForLayoutAttribute:()TKConstraintBasedLayout asEqualToValueOfItem:withOffset:
{
  return objc_msgSend(a1, "tk_addedConstraintForLayoutAttribute:asEqualToLayoutAttribute:ofItem:withOffset:", a3, a3, a4);
}

- (uint64_t)tk_addedConstraintForLayoutAttribute:()TKConstraintBasedLayout asEqualToLayoutAttribute:ofItem:
{
  return objc_msgSend(a1, "tk_addedConstraintForLayoutAttribute:asEqualToLayoutAttribute:ofItem:withOffset:", 0.0);
}

- (uint64_t)tk_addedConstraintForLayoutAttribute:()TKConstraintBasedLayout asEqualToLayoutAttribute:ofItem:withOffset:
{
  return objc_msgSend(a1, "tk_addedConstraintForLayoutAttribute:relatedBy:toItem:attribute:multiplier:constant:", a3, 0, a5, a4, 1.0, a6);
}

- (uint64_t)tk_addedConstraintForLayoutAttribute:()TKConstraintBasedLayout asEqualToValueOfItem:withMultiplier:
{
  return objc_msgSend(a1, "tk_addedConstraintForLayoutAttribute:asEqualToLayoutAttribute:ofItem:withMultiplier:", a3, a3, a4);
}

- (uint64_t)tk_addedConstraintForLayoutAttribute:()TKConstraintBasedLayout asEqualToLayoutAttribute:ofItem:withMultiplier:
{
  return objc_msgSend(a1, "tk_addedConstraintForLayoutAttribute:relatedBy:toItem:attribute:multiplier:constant:", a3, 0, a5, a4, a6, 0.0);
}

- (id)tk_constrainLayoutAttribute:()TKConstraintBasedLayout asLessThanOrEqualToValueOfItem:withOffset:
{
  return (id)objc_msgSend(a1, "tk_addedConstraintForLayoutAttribute:asLessThanOrEqualToValueOfItem:withOffset:");
}

- (uint64_t)tk_addedConstraintForLayoutAttribute:()TKConstraintBasedLayout asLessThanOrEqualToValueOfItem:withOffset:
{
  return objc_msgSend(a1, "tk_addedConstraintForLayoutAttribute:relatedBy:toItem:attribute:multiplier:constant:", a3, -1, a4, a3, 1.0, a5);
}

- (id)tk_constrainLayoutAttribute:()TKConstraintBasedLayout asGreaterThanOrEqualToValueOfItem:withOffset:
{
  return (id)objc_msgSend(a1, "tk_addedConstraintForLayoutAttribute:asGreaterThanOrEqualToValueOfItem:withOffset:");
}

- (uint64_t)tk_addedConstraintForLayoutAttribute:()TKConstraintBasedLayout asGreaterThanOrEqualToValueOfItem:withOffset:
{
  return objc_msgSend(a1, "tk_addedConstraintForLayoutAttribute:relatedBy:toItem:attribute:multiplier:constant:", a3, 1, a4, a3, 1.0, a5);
}

- (id)tk_constrainLayoutAttribute:()TKConstraintBasedLayout relatedBy:toItem:attribute:multiplier:constant:
{
  return (id)objc_msgSend(a1, "tk_addedConstraintForLayoutAttribute:relatedBy:toItem:attribute:multiplier:constant:");
}

- (uint64_t)tk_addedConstraintForLayoutAttribute:()TKConstraintBasedLayout relatedBy:toItem:attribute:multiplier:constant:
{
  return objc_msgSend(a1, "tk_addedConstraintForItem:layoutAttribute:relatedBy:toItem:attribute:multiplier:constant:", a1, a3, a4, a5, a6);
}

- (id)tk_addedConstraintForItem:()TKConstraintBasedLayout layoutAttribute:relatedBy:toItem:attribute:multiplier:constant:
{
  id v16 = a5;
  id v17 = a8;
  v18 = [MEMORY[0x263F08938] constraintWithItem:v16 attribute:a6 relatedBy:a7 toItem:v17 attribute:a9 multiplier:a2 constant:a3];
  if (v18)
  {
    v19 = objc_msgSend((id)objc_opt_class(), "_tk_viewForItem:", v16);
    uint64_t v20 = objc_msgSend((id)objc_opt_class(), "_tk_viewForItem:", v17);
    v21 = (void *)v20;
    if (v19 && v20)
    {
      v22 = objc_msgSend(v19, "tk_firstCommonAncestorWithView:", v20);
      [v22 addConstraint:v18];
    }
    else
    {
      [a1 addConstraint:v18];
    }
  }

  return v18;
}

- (uint64_t)_tk_depth
{
  id v1 = a1;
  if (!v1) {
    return -1;
  }
  v2 = v1;
  uint64_t v3 = -1;
  do
  {
    uint64_t v4 = [v2 superview];

    ++v3;
    v2 = (void *)v4;
  }
  while (v4);
  return v3;
}

- (id)tk_firstCommonAncestorWithView:()TKConstraintBasedLayout
{
  id v4 = a3;
  id v5 = a1;
  id v6 = v4;
  unint64_t v7 = objc_msgSend(v5, "_tk_depth");
  unint64_t v8 = objc_msgSend(v6, "_tk_depth");
  if (v8 < v7) {
    unint64_t v9 = v8;
  }
  else {
    unint64_t v9 = v7;
  }
  if (v8 < v7) {
    unint64_t v10 = v7;
  }
  else {
    unint64_t v10 = v8;
  }
  if (v8 < v7) {
    v11 = v5;
  }
  else {
    v11 = v6;
  }
  if (v8 < v7) {
    v12 = v6;
  }
  else {
    v12 = v5;
  }
  if (v9 >= v10)
  {
    v13 = v11;
  }
  else
  {
    do
    {
      v13 = [v11 superview];

      --v10;
      v11 = v13;
    }
    while (v9 < v10);
  }
  v14 = 0;
  if (v12 && v13)
  {
    while (v12 != v13)
    {
      v15 = [v12 superview];

      id v16 = [v13 superview];

      v14 = 0;
      if (v15)
      {
        v12 = v15;
        v13 = v16;
        if (v16) {
          continue;
        }
      }
      goto LABEL_25;
    }
    id v16 = v12;
    v15 = v16;
    v14 = v16;
  }
  else
  {
    id v16 = v13;
    v15 = v12;
  }
LABEL_25:

  return v14;
}

+ (id)_tk_viewForItem:()TKConstraintBasedLayout
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
LABEL_5:
    id v5 = v4;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 owningView];
    goto LABEL_5;
  }
  id v5 = 0;
LABEL_7:

  return v5;
}

- (id)_tk_recursiveAutolayoutTraceAtLevel:()TKConstraintBasedLayout anyDescendantHasAmbiguousLayout:
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  unint64_t v7 = [MEMORY[0x263F089D8] stringWithFormat:@"\n"];
  if (a3 >= 1)
  {
    uint64_t v8 = a3;
    do
    {
      [v7 appendString:@"|   "];
      --v8;
    }
    while (v8);
  }
  int v9 = [a1 hasAmbiguousLayout];
  unint64_t v10 = (objc_class *)objc_opt_class();
  uint64_t v11 = NSStringFromClass(v10);
  v12 = (void *)v11;
  v13 = &stru_26D2E1860;
  if (v9) {
    v13 = @" - AMBIGUOUS LAYOUT";
  }
  [v7 appendFormat:@"<%@: %p>%@", v11, a1, v13];

  if (a4 && (v9 & 1) != 0) {
    *a4 = 1;
  }
  v14 = [a1 subviews];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v23;
    uint64_t v18 = a3 + 1;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v20 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * i), "_tk_recursiveAutolayoutTraceAtLevel:anyDescendantHasAmbiguousLayout:", v18, a4);
        [v7 appendString:v20];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v16);
  }

  return v7;
}

- (id)_tk_autolayoutTrace
{
  char v6 = 0;
  id v1 = objc_msgSend(a1, "_tk_recursiveAutolayoutTraceAtLevel:anyDescendantHasAmbiguousLayout:", 0, &v6);
  v2 = v1;
  if (v6) {
    id v3 = @"\nAMBIGUOUS LAYOUT IN SUBTREE";
  }
  else {
    id v3 = @"\nNo views in subtree have an ambiguous layout. Good job!";
  }
  id v4 = [v1 stringByAppendingString:v3];

  return v4;
}

@end
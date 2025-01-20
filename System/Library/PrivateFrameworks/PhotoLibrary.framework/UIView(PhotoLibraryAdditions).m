@interface UIView(PhotoLibraryAdditions)
+ (double)pl_setHiddenAnimationDuration;
- (uint64_t)pl_drawBorderWithColor:()PhotoLibraryAdditions width:;
- (uint64_t)pl_isOnScreen:()PhotoLibraryAdditions;
- (uint64_t)pl_setHidden:()PhotoLibraryAdditions animated:;
- (uint64_t)pl_setHidden:()PhotoLibraryAdditions delay:animated:;
@end

@implementation UIView(PhotoLibraryAdditions)

- (uint64_t)pl_setHidden:()PhotoLibraryAdditions delay:animated:
{
  if (a3) {
    double v7 = 0.0;
  }
  else {
    double v7 = 1.0;
  }
  uint64_t result = [a1 alpha];
  if (v9 != v7)
  {
    if (a4)
    {
      [a1 setHidden:0];
      objc_msgSend((id)objc_opt_class(), "pl_setHiddenAnimationDuration");
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __61__UIView_PhotoLibraryAdditions__pl_setHidden_delay_animated___block_invoke;
      v12[3] = &unk_1E63D2930;
      v12[4] = a1;
      *(double *)&v12[5] = v7;
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __61__UIView_PhotoLibraryAdditions__pl_setHidden_delay_animated___block_invoke_2;
      v10[3] = &unk_1E63D2958;
      v10[4] = a1;
      *(double *)&v10[5] = v7;
      char v11 = a3;
      return objc_msgSend(MEMORY[0x1E4F42FF0], "animateWithDuration:delay:options:animations:completion:", 0, v12, v10);
    }
    else
    {
      objc_msgSend((id)objc_msgSend(a1, "layer"), "removeAnimationForKey:", @"opacity");
      [a1 setHidden:a3];
      return [a1 setAlpha:v7];
    }
  }
  return result;
}

- (uint64_t)pl_setHidden:()PhotoLibraryAdditions animated:
{
  return objc_msgSend(a1, "pl_setHidden:delay:animated:", 0.0);
}

- (uint64_t)pl_drawBorderWithColor:()PhotoLibraryAdditions width:
{
  v6 = (void *)[a1 layer];
  objc_msgSend(v6, "setBorderColor:", objc_msgSend(a4, "CGColor"));
  return [v6 setBorderWidth:a2];
}

- (uint64_t)pl_isOnScreen:()PhotoLibraryAdditions
{
  [a1 bounds];
  objc_msgSend(a1, "convertRect:toView:", 0);
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  [a3 bounds];
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  uint64_t v20 = v19;
  uint64_t result = [a1 window];
  if (result)
  {
    uint64_t v22 = v6;
    uint64_t v23 = v8;
    uint64_t v24 = v10;
    uint64_t v25 = v12;
    uint64_t v26 = v14;
    uint64_t v27 = v16;
    uint64_t v28 = v18;
    uint64_t v29 = v20;
    return CGRectIntersectsRect(*(CGRect *)&v22, *(CGRect *)&v26);
  }
  return result;
}

+ (double)pl_setHiddenAnimationDuration
{
  return 0.25;
}

@end
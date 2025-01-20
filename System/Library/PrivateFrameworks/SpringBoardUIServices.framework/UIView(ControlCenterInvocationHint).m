@interface UIView(ControlCenterInvocationHint)
- (double)SBSUI_sourceRectForControlCenterInvocationHint;
@end

@implementation UIView(ControlCenterInvocationHint)

- (double)SBSUI_sourceRectForControlCenterInvocationHint
{
  v1 = a1;
  v2 = [a1 window];
  v3 = [v1 window];
  [v3 bounds];
  objc_msgSend(v2, "convertRect:toView:", v1);
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  int v12 = __sb__runningInSpringBoard();
  if (v12)
  {
    char v13 = v12;
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      char v14 = 0;
    }
    else
    {
      if (SBFEffectiveHomeButtonType() == 2)
      {
        if (v13) {
          goto LABEL_16;
        }
        goto LABEL_9;
      }
      char v14 = v13 ^ 1;
    }
  }
  else
  {
    v1 = [MEMORY[0x1E4F42948] currentDevice];
    if (![v1 userInterfaceIdiom] && SBFEffectiveHomeButtonType() == 2)
    {
LABEL_9:

      goto LABEL_16;
    }
    char v14 = 1;
  }
  v15 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v16 = [v15 userInterfaceIdiom];

  if (v14) {
  if ((v16 & 0xFFFFFFFFFFFFFFFBLL) != 1)
  }
  {
    v24.origin.x = v5;
    v24.origin.y = v7;
    v24.size.width = v9;
    v24.size.height = v11;
    double MinX = CGRectGetMidX(v24) + -32.0;
    v25.origin.x = v5;
    v25.origin.y = v7;
    v25.size.width = v9;
    v25.size.height = v11;
    CGRectGetMaxY(v25);
    return MinX;
  }
LABEL_16:
  uint64_t v17 = [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection];
  CGFloat v18 = v5;
  CGFloat v19 = v7;
  CGFloat v20 = v9;
  CGFloat v21 = v11;
  if (v17 == 1) {
    double MinX = CGRectGetMinX(*(CGRect *)&v18);
  }
  else {
    double MinX = CGRectGetMaxX(*(CGRect *)&v18) + -64.0;
  }
  v26.origin.x = v5;
  v26.origin.y = v7;
  v26.size.width = v9;
  v26.size.height = v11;
  CGRectGetMinY(v26);
  return MinX;
}

@end
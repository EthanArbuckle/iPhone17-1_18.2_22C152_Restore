@interface IKViewElementStyle(NSLayoutConstraint)
+ (id)positionConstraintsForView:()NSLayoutConstraint insets:position:;
@end

@implementation IKViewElementStyle(NSLayoutConstraint)

+ (id)positionConstraintsForView:()NSLayoutConstraint insets:position:
{
  id v13 = a7;
  v14 = v13;
  if (v13)
  {
    v15 = [v13 superview];
    if (v15)
    {
      if (a8 > 1)
      {
        v17 = 0;
        if (a8 <= 8 && ((1 << a8) & 0x150) != 0)
        {
          v17 = [MEMORY[0x1E4F28DC8] constraintWithItem:v14 attribute:1 relatedBy:0 toItem:v15 attribute:1 multiplier:1.0 constant:a2];
        }
        if (a8 <= 9 && ((1 << a8) & 0x2A0) != 0)
        {
          uint64_t v18 = [MEMORY[0x1E4F28DC8] constraintWithItem:v14 attribute:2 relatedBy:0 toItem:v15 attribute:2 multiplier:1.0 constant:-a4];

          v17 = (void *)v18;
        }
        v19 = 0;
        if (a8 <= 7 && ((1 << a8) & 0xC4) != 0)
        {
          v19 = [MEMORY[0x1E4F28DC8] constraintWithItem:v14 attribute:3 relatedBy:0 toItem:v15 attribute:3 multiplier:1.0 constant:a1];
        }
        if (a8 <= 9 && ((1 << a8) & 0x308) != 0)
        {
          uint64_t v20 = [MEMORY[0x1E4F28DC8] constraintWithItem:v14 attribute:4 relatedBy:0 toItem:v15 attribute:4 multiplier:1.0 constant:-a3];

          v19 = (void *)v20;
        }
        v21 = [MEMORY[0x1E4F1CA48] array];
        v16 = v21;
        if (v17) {
          [v21 addObject:v17];
        }
        if (v19) {
          [v16 addObject:v19];
        }
      }
      else
      {
        v16 = objc_msgSend(MEMORY[0x1E4F28DC8], "constraintsByCenteringView:withView:alongAxes:offset:", v14, v15, 3, *MEMORY[0x1E4FB2E10], *(double *)(MEMORY[0x1E4FB2E10] + 8));
      }
    }
    else
    {
      NSLog(&cfstr_SuperviewCanno.isa);
      v16 = 0;
    }
  }
  else
  {
    NSLog(&cfstr_ViewCannotBeNi.isa);
    v16 = 0;
  }

  return v16;
}

@end
@interface UIView(CACOnboardingAdditions)
- (void)addBottomBorderWithColor:()CACOnboardingAdditions thickness:margins:;
@end

@implementation UIView(CACOnboardingAdditions)

- (void)addBottomBorderWithColor:()CACOnboardingAdditions thickness:margins:
{
  v8 = (objc_class *)MEMORY[0x263F82E00];
  id v9 = a5;
  id v10 = [v8 alloc];
  id v15 = (id)objc_msgSend(v10, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [v15 setBackgroundColor:v9];

  [v15 setTranslatesAutoresizingMaskIntoConstraints:0];
  [a1 addSubview:v15];
  v11 = [MEMORY[0x263F08938] constraintWithItem:v15 attribute:8 relatedBy:0 toItem:0 attribute:8 multiplier:1.0 constant:a2];
  [v15 addConstraint:v11];

  v12 = [MEMORY[0x263F08938] constraintWithItem:v15 attribute:4 relatedBy:0 toItem:a1 attribute:4 multiplier:1.0 constant:0.0];
  [a1 addConstraint:v12];

  v13 = [MEMORY[0x263F08938] constraintWithItem:v15 attribute:4 relatedBy:0 toItem:a1 attribute:4 multiplier:1.0 constant:a3];
  [a1 addConstraint:v13];

  v14 = [MEMORY[0x263F08938] constraintWithItem:v15 attribute:4 relatedBy:0 toItem:a1 attribute:4 multiplier:1.0 constant:a3];
  [a1 addConstraint:v14];
}

@end
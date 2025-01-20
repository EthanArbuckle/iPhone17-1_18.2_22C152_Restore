@interface UIView(SBSystemApertureIDCornerCurve)
- (double)IDCornerRadius;
- (id)sb_cornerCurveFloatAnimatableProperty;
- (void)setIDCornerRadius:()SBSystemApertureIDCornerCurve;
@end

@implementation UIView(SBSystemApertureIDCornerCurve)

- (double)IDCornerRadius
{
  v1 = objc_msgSend(a1, "sb_cornerCurveFloatAnimatableProperty");
  [v1 value];
  double v3 = v2;

  return v3;
}

- (id)sb_cornerCurveFloatAnimatableProperty
{
  v15[1] = *MEMORY[0x1E4F143B8];
  objc_getAssociatedObject(a1, "com.apple.SpringBoardFramework.SBSystemApertureIDCornerCurve.floatAnimatableProperty");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F43000]);
    [v2 setVelocityUsableForVFD:1];
    double v3 = [a1 layer];
    [v3 cornerRadius];
    objc_msgSend(v2, "setValue:");

    objc_setAssociatedObject(a1, "com.apple.SpringBoardFramework.SBSystemApertureIDCornerCurve.floatAnimatableProperty", v2, (void *)1);
    objc_initWeak(&location, v2);
    objc_initWeak(&from, a1);
    v4 = (void *)MEMORY[0x1E4F42FF0];
    v15[0] = v2;
    v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __78__UIView_SBSystemApertureIDCornerCurve__sb_cornerCurveFloatAnimatableProperty__block_invoke;
    v10[3] = &unk_1E6AFFA80;
    objc_copyWeak(&v11, &location);
    objc_copyWeak(&v12, &from);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __78__UIView_SBSystemApertureIDCornerCurve__sb_cornerCurveFloatAnimatableProperty__block_invoke_2;
    v7[3] = &unk_1E6AF4BB0;
    objc_copyWeak(&v8, &location);
    objc_copyWeak(&v9, &from);
    v7[4] = a1;
    [v4 _createTransformerWithInputAnimatableProperties:v5 modelValueSetter:v10 presentationValueSetter:v7];

    objc_destroyWeak(&v9);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)setIDCornerRadius:()SBSystemApertureIDCornerCurve
{
  objc_msgSend(a1, "sb_cornerCurveFloatAnimatableProperty");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 setValue:a2];
}

@end
@interface BSMutableSettings(SBUISystemAperture)
- (void)SBUISA_setCGRect:()SBUISystemAperture forSetting:;
- (void)SBUISA_setCGSize:()SBUISystemAperture forSetting:;
- (void)SBUISA_setContentRole:()SBUISystemAperture forSetting:;
- (void)SBUISA_setContextId:()SBUISystemAperture forSetting:;
- (void)SBUISA_setCustomLayout:()SBUISystemAperture forSetting:;
- (void)SBUISA_setDirectionalEdgeInsets:()SBUISystemAperture forSetting:;
- (void)SBUISA_setLayoutMode:()SBUISystemAperture forSetting:;
- (void)SBUISA_setNullableObject:()SBUISystemAperture forSetting:;
- (void)SBUISA_setPresentationBehaviors:()SBUISystemAperture forSetting:;
- (void)SBUISA_setRenderingid:()SBUISystemAperture forSetting:;
- (void)SBUISA_setUIColor:()SBUISystemAperture forSetting:;
@end

@implementation BSMutableSettings(SBUISystemAperture)

- (void)SBUISA_setCGRect:()SBUISystemAperture forSetting:
{
  objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [a1 setObject:v5 forSetting:a3];
}

- (void)SBUISA_setCGSize:()SBUISystemAperture forSetting:
{
  objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGSize:");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [a1 setObject:v5 forSetting:a3];
}

- (void)SBUISA_setDirectionalEdgeInsets:()SBUISystemAperture forSetting:
{
  objc_msgSend(MEMORY[0x1E4F29238], "valueWithDirectionalEdgeInsets:");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [a1 setObject:v5 forSetting:a3];
}

- (void)SBUISA_setContextId:()SBUISystemAperture forSetting:
{
  objc_msgSend(NSNumber, "numberWithUnsignedInt:");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [a1 setObject:v6 forSetting:a4];
}

- (void)SBUISA_setRenderingid:()SBUISystemAperture forSetting:
{
  objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [a1 setObject:v6 forSetting:a4];
}

- (void)SBUISA_setLayoutMode:()SBUISystemAperture forSetting:
{
  objc_msgSend(NSNumber, "numberWithInteger:");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [a1 setObject:v6 forSetting:a4];
}

- (void)SBUISA_setContentRole:()SBUISystemAperture forSetting:
{
  objc_msgSend(NSNumber, "numberWithInteger:");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [a1 setObject:v6 forSetting:a4];
}

- (void)SBUISA_setPresentationBehaviors:()SBUISystemAperture forSetting:
{
  objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [a1 setObject:v6 forSetting:a4];
}

- (void)SBUISA_setUIColor:()SBUISystemAperture forSetting:
{
  if (a3)
  {
    double v13 = 0.0;
    double v14 = 0.0;
    double v11 = 0.0;
    double v12 = 0.0;
    id v6 = (void *)MEMORY[0x1E4F42F80];
    id v7 = a3;
    v8 = [v6 traitCollectionWithUserInterfaceStyle:2];
    v9 = [v7 resolvedColorWithTraitCollection:v8];

    [v9 getRed:&v14 green:&v13 blue:&v12 alpha:&v11];
    v10 = [MEMORY[0x1E4F4F6E0] colorWithRed:v14 green:v13 blue:v12 alpha:v11];
  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(a1, "SBUISA_setNullableObject:forSetting:", v10, a4, *(void *)&v11, *(void *)&v12, *(void *)&v13, *(void *)&v14);
}

- (void)SBUISA_setCustomLayout:()SBUISystemAperture forSetting:
{
  objc_msgSend(NSNumber, "numberWithInteger:");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [a1 setObject:v6 forSetting:a4];
}

- (void)SBUISA_setNullableObject:()SBUISystemAperture forSetting:
{
  if (a3)
  {
    objc_msgSend(a1, "setObject:forSetting:");
  }
  else
  {
    id v6 = [MEMORY[0x1E4F1CA98] null];
    [a1 setObject:v6 forSetting:a4];
  }
}

@end
@interface SBUISearchUtilities
+ (double)idealSearchPlatterWidth;
- (SBUISearchUtilities)init;
@end

@implementation SBUISearchUtilities

+ (double)idealSearchPlatterWidth
{
  v2 = [MEMORY[0x1E4F42738] sharedApplication];
  uint64_t v3 = [v2 interfaceOrientation];

  v4 = [MEMORY[0x1E4F42D90] mainScreen];
  [v4 _referenceBounds];
  double v6 = v5;
  double v8 = v7;

  if (v6 >= v8) {
    double v9 = v8;
  }
  else {
    double v9 = v6;
  }
  v10 = "SpringBoard";
  if (_os_feature_enabled_impl()) {
    double v11 = 500.0;
  }
  else {
    double v11 = 672.0;
  }
  if (_os_feature_enabled_impl()) {
    double v12 = 425.0;
  }
  else {
    double v12 = 556.0;
  }
  uint64_t v13 = __sb__runningInSpringBoard();
  if (v13)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      int v14 = 0;
      int v15 = 0;
      goto LABEL_20;
    }
  }
  else
  {
    v10 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v10 userInterfaceIdiom] != 1)
    {
      int v15 = 0;
      int v14 = 1;
      goto LABEL_20;
    }
  }
  int v14 = v13 ^ 1;
  int v16 = __sb__runningInSpringBoard();
  if (v16)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    uint64_t v13 = [MEMORY[0x1E4F42D90] mainScreen];
    [(id)v13 _referenceBounds];
  }
  BSSizeRoundForScale();
  if (v17 >= *(double *)(MEMORY[0x1E4FA6E50] + 264))
  {
    if (v16) {
      goto LABEL_24;
    }
    goto LABEL_35;
  }
  int v15 = v16 ^ 1;
LABEL_20:
  double v11 = v9 + -16.0;
  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() == 2) {
      double v11 = v12;
    }
    if ((v15 & 1) == 0) {
      goto LABEL_24;
    }
  }
  else
  {
    v20 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v21 = [v20 userInterfaceIdiom];

    if (v21 == 1) {
      double v11 = v12;
    }
    if (!v15)
    {
LABEL_24:
      if (!v14) {
        goto LABEL_26;
      }
      goto LABEL_25;
    }
  }
LABEL_35:

  if (v14) {
LABEL_25:
  }

LABEL_26:
  if ((unint64_t)(v3 - 1) >= 2) {
    double v18 = v8;
  }
  else {
    double v18 = v6;
  }
  double result = v18 + -16.0;
  if (v11 < result) {
    return v11;
  }
  return result;
}

- (SBUISearchUtilities)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"SBUISearchUtilities.m" lineNumber:34 description:@"Do not instantiate this class"];

  v6.receiver = self;
  v6.super_class = (Class)SBUISearchUtilities;
  return [(SBUISearchUtilities *)&v6 init];
}

@end
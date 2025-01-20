@interface SBAnimationUtilities
+ (double)adjustedRotationAnimationDurationForDuration:(double)a3 fromOrientation:(int64_t)a4 toOrientation:(int64_t)a5;
+ (id)animationSettingsForRotationFromInterfaceOrientation:(int64_t)a3 toInterfaceOrientation:(int64_t)a4;
+ (id)animationSettingsForRotationFromOrientation:(int64_t)a3 toOrientation:(int64_t)a4 withContext:(id)a5;
@end

@implementation SBAnimationUtilities

+ (id)animationSettingsForRotationFromInterfaceOrientation:(int64_t)a3 toInterfaceOrientation:(int64_t)a4
{
  v6 = +[SBMedusaDomain rootSettings];
  v7 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v8 = [v7 userInterfaceIdiom];

  v9 = [v6 medusa1oSettings];
  [v9 rotationSlowdownFactor];
  double v11 = v10;

  BOOL v12 = (unint64_t)(a3 - 1) <= 1 && (unint64_t)(a4 - 1) < 2;
  if ((unint64_t)(a3 - 3) <= 1) {
    BOOL v13 = (unint64_t)(a4 - 3) < 2;
  }
  else {
    BOOL v13 = v12;
  }
  if (a3 != a4 && v13)
  {
    double v14 = dbl_1D8FD1390[(v8 & 0xFFFFFFFFFFFFFFFBLL) == 1] * v11;
    double v15 = v14 + v14;
  }
  else
  {
    double v15 = dbl_1D8FD1390[(v8 & 0xFFFFFFFFFFFFFFFBLL) == 1] * v11;
  }
  v16 = (void *)MEMORY[0x1E4F4F680];
  v17 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
  v18 = [v16 settingsWithDuration:v17 delay:v15 timingFunction:0.0];

  return v18;
}

+ (id)animationSettingsForRotationFromOrientation:(int64_t)a3 toOrientation:(int64_t)a4 withContext:(id)a5
{
  v7 = [a5 animationSettings];
  [v7 duration];
  double v9 = v8;
  double v10 = +[SBMedusaDomain rootSettings];
  double v11 = [v10 medusa1oSettings];
  [v11 rotationSlowdownFactor];
  double v13 = v9 * v12;

  if (a3 != a4)
  {
    if (BSInterfaceOrientationIsLandscape()) {
      int IsLandscape = BSInterfaceOrientationIsLandscape();
    }
    else {
      int IsLandscape = 0;
    }
    int IsPortrait = BSInterfaceOrientationIsPortrait();
    if (IsPortrait) {
      int IsPortrait = BSInterfaceOrientationIsPortrait();
    }
    double v16 = 1.0;
    if (IsLandscape | IsPortrait) {
      double v16 = 2.0;
    }
    double v13 = v13 * v16;
  }
  v17 = (void *)MEMORY[0x1E4F4F680];
  v18 = [v7 timingFunction];
  v19 = [v17 settingsWithDuration:v18 timingFunction:v13];

  return v19;
}

+ (double)adjustedRotationAnimationDurationForDuration:(double)a3 fromOrientation:(int64_t)a4 toOrientation:(int64_t)a5
{
  uint64_t v6 = XBRotationDegreesForInterfaceOrientationRotation();
  if (v6 >= 0) {
    unint64_t v7 = v6;
  }
  else {
    unint64_t v7 = -v6;
  }
  if (v7 >= 0x5B)
  {
    [(id)*MEMORY[0x1E4F43630] windowRotationDuration];
    if (v8 < a3) {
      return a3 * 0.5;
    }
  }
  return a3;
}

@end
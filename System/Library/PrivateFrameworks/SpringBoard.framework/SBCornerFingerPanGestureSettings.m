@interface SBCornerFingerPanGestureSettings
+ (id)settingsControllerModule;
- (double)angleDegreesAscendingLUT:(BOOL)a3;
- (double)distanceMillimetersValues:(BOOL)a3;
- (double)maximumActiveDistance:(BOOL)a3;
- (unint64_t)tuning;
- (unint64_t)vectorCount:(BOOL)a3;
- (void)setDefaultValues;
- (void)setTuning:(unint64_t)a3;
@end

@implementation SBCornerFingerPanGestureSettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)SBCornerFingerPanGestureSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(SBCornerFingerPanGestureSettings *)self setTuning:1];
}

+ (id)settingsControllerModule
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F94110] rowWithTitle:@"Tuning Profile" valueKeyPath:@"tuning"];
  [v2 setPossibleTitles:&unk_1F3348048];
  [v2 setPossibleShortTitles:&unk_1F3348060];
  [v2 setPossibleValues:&unk_1F3348078];
  objc_super v3 = (void *)MEMORY[0x1E4F94168];
  v11[0] = v2;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  v5 = [v3 sectionWithRows:v4 title:@"Tuning Configuration"];

  v6 = (void *)MEMORY[0x1E4F94168];
  v10 = v5;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v10 count:1];
  v8 = [v6 moduleWithTitle:@"Corner Finger Gesture" contents:v7];

  return v8;
}

- (double)angleDegreesAscendingLUT:(BOOL)a3
{
  unint64_t tuning = self->_tuning;
  result = (double *)&LUT_2;
  switch(tuning)
  {
    case 0uLL:
      v5 = (double *)&LUT_LANDSCAPE_0;
      v6 = (double *)&LUT_PORTRAIT_0;
      goto LABEL_5;
    case 1uLL:
      v5 = (double *)&LUT_LANDSCAPE_1;
      v6 = (double *)&LUT_PORTRAIT_1;
LABEL_5:
      if (a3) {
        result = v6;
      }
      else {
        result = v5;
      }
      break;
    case 2uLL:
      return result;
    case 3uLL:
      result = (double *)&LUT_3;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (double)distanceMillimetersValues:(BOOL)a3
{
  unint64_t tuning = self->_tuning;
  result = (double *)&DIST_2;
  switch(tuning)
  {
    case 0uLL:
      v5 = (double *)&DIST_LANDSCAPE_0;
      v6 = (double *)&DIST_PORTRAIT_0;
      goto LABEL_5;
    case 1uLL:
      v5 = (double *)&DIST_LANDSCAPE_1;
      v6 = (double *)&DIST_PORTRAIT_1;
LABEL_5:
      if (a3) {
        result = v6;
      }
      else {
        result = v5;
      }
      break;
    case 2uLL:
      return result;
    case 3uLL:
      result = (double *)&DIST_3;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (unint64_t)vectorCount:(BOOL)a3
{
  unint64_t tuning = self->_tuning;
  if (tuning - 2 < 2) {
    return 17;
  }
  if (tuning == 1)
  {
    BOOL v4 = !a3;
    unint64_t v5 = 15;
  }
  else
  {
    if (tuning) {
      return 0;
    }
    BOOL v4 = !a3;
    unint64_t v5 = 14;
  }
  if (v4) {
    return v5;
  }
  else {
    return 18;
  }
}

- (double)maximumActiveDistance:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = -[SBCornerFingerPanGestureSettings distanceMillimetersValues:](self, "distanceMillimetersValues:");
  if (![(SBCornerFingerPanGestureSettings *)self vectorCount:v3]) {
    return 0.0;
  }
  unint64_t v6 = 0;
  double v7 = 0.0;
  do
    double v7 = fmax(v7, v5[v6++]);
  while (v6 < [(SBCornerFingerPanGestureSettings *)self vectorCount:v3]);
  return v7;
}

- (unint64_t)tuning
{
  return self->_tuning;
}

- (void)setTuning:(unint64_t)a3
{
  self->_unint64_t tuning = a3;
}

@end
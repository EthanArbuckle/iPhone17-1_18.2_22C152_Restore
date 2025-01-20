@interface COSBeamBridgeUserStudyController
+ (id)sharedController;
- (BOOL)continueUserStudyPhase;
- (COSBeamBridgeUserStudyController)init;
- (int64_t)orientation;
- (void)overrideWristAndCrownChoices;
- (void)startNewUserStudy;
@end

@implementation COSBeamBridgeUserStudyController

+ (id)sharedController
{
  if (qword_10029B2F8 != -1) {
    dispatch_once(&qword_10029B2F8, &stru_100247810);
  }
  v2 = (void *)qword_10029B2F0;

  return v2;
}

- (COSBeamBridgeUserStudyController)init
{
  v5.receiver = self;
  v5.super_class = (Class)COSBeamBridgeUserStudyController;
  v2 = [(COSBeamBridgeUserStudyController *)&v5 init];
  v3 = v2;
  if (v2) {
    [(COSBeamBridgeUserStudyController *)v2 startNewUserStudy];
  }
  return v3;
}

- (void)overrideWristAndCrownChoices
{
  unint64_t orientation = self->_orientation;
  if (orientation > 9)
  {
    uint64_t v3 = -1;
    uint64_t v4 = -1;
  }
  else
  {
    uint64_t v3 = qword_1001AB248[orientation];
    uint64_t v4 = qword_1001AB298[orientation];
  }
  objc_super v5 = +[COSInternalUserStudyDataManager sharedManager];
  [v5 setCrownChoice:v3];

  id v6 = +[COSInternalUserStudyDataManager sharedManager];
  [v6 setWristChoice:v4];
}

- (void)startNewUserStudy
{
  self->_unint64_t orientation = 0;
  [(COSBeamBridgeUserStudyController *)self overrideWristAndCrownChoices];
}

- (BOOL)continueUserStudyPhase
{
  ++self->_orientation;
  unsigned int v3 = sub_1000324BC();
  int64_t orientation = self->_orientation;
  if (v3)
  {
    if ((orientation & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      int64_t orientation = 4;
      goto LABEL_6;
    }
    if ((orientation & 0xFFFFFFFFFFFFFFFELL) == 6)
    {
      int64_t orientation = 10;
LABEL_6:
      self->_int64_t orientation = orientation;
    }
  }
  BOOL v5 = orientation < 10;
  [(COSBeamBridgeUserStudyController *)self overrideWristAndCrownChoices];
  return v5;
}

- (int64_t)orientation
{
  return self->_orientation;
}

@end
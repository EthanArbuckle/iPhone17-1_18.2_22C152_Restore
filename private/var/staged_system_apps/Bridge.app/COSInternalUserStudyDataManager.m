@interface COSInternalUserStudyDataManager
+ (id)sharedManager;
- (COSInternalUserStudyDataManager)init;
- (double)confidence;
- (int64_t)crownChoice;
- (int64_t)detectedCrownChoice;
- (int64_t)detectedWristChoice;
- (int64_t)wristChoice;
- (unint64_t)material;
- (unint64_t)size;
- (void)setConfidence:(double)a3;
- (void)setCrownChoice:(int64_t)a3;
- (void)setDetectedCrownChoice:(int64_t)a3;
- (void)setDetectedWristChoice:(int64_t)a3;
- (void)setMaterial:(unint64_t)a3;
- (void)setSize:(unint64_t)a3;
- (void)setWristChoice:(int64_t)a3;
@end

@implementation COSInternalUserStudyDataManager

+ (id)sharedManager
{
  if (qword_10029AEE8 != -1) {
    dispatch_once(&qword_10029AEE8, &stru_100243DB8);
  }
  v2 = (void *)qword_10029AEE0;

  return v2;
}

- (COSInternalUserStudyDataManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)COSInternalUserStudyDataManager;
  result = [(COSInternalUserStudyDataManager *)&v3 init];
  if (result)
  {
    result->_crownChoice = -1;
    result->_wristChoice = -1;
  }
  return result;
}

- (int64_t)crownChoice
{
  return self->_crownChoice;
}

- (void)setCrownChoice:(int64_t)a3
{
  self->_crownChoice = a3;
}

- (int64_t)wristChoice
{
  return self->_wristChoice;
}

- (void)setWristChoice:(int64_t)a3
{
  self->_wristChoice = a3;
}

- (unint64_t)material
{
  return self->_material;
}

- (void)setMaterial:(unint64_t)a3
{
  self->_material = a3;
}

- (unint64_t)size
{
  return self->_size;
}

- (void)setSize:(unint64_t)a3
{
  self->_size = a3;
}

- (int64_t)detectedCrownChoice
{
  return self->_detectedCrownChoice;
}

- (void)setDetectedCrownChoice:(int64_t)a3
{
  self->_detectedCrownChoice = a3;
}

- (int64_t)detectedWristChoice
{
  return self->_detectedWristChoice;
}

- (void)setDetectedWristChoice:(int64_t)a3
{
  self->_detectedWristChoice = a3;
}

- (double)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(double)a3
{
  self->_confidence = a3;
}

@end
@interface PVFace
+ (PVFace)faceWithFace:(id)a3 copyPropertiesOption:(int64_t)a4;
- (BOOL)hasSmile;
- (BOOL)hidden;
- (BOOL)isInTrash;
- (BOOL)isLeftEyeClosed;
- (BOOL)isRightEyeClosed;
- (BOOL)isTooSmall;
- (BOOL)manual;
- (BOOL)setCenterAndSizeFromNormalizedFaceRect:(CGRect)a3;
- (CGRect)absoluteFaceRect;
- (CGRect)absoluteFaceRectForImageSize:(CGSize)a3;
- (CGRect)normalizedFaceRect;
- (NSString)adjustmentVersion;
- (NSString)ageType;
- (NSString)baldType;
- (NSString)eyeMakeupType;
- (NSString)eyesState;
- (NSString)facialHairType;
- (NSString)glassesType;
- (NSString)groupingIdentifier;
- (NSString)hairColorType;
- (NSString)lipMakeupType;
- (NSString)personLocalIdentifier;
- (NSString)sexType;
- (NSString)smileType;
- (PVFaceprint)faceprint;
- (double)blurScore;
- (double)centerX;
- (double)centerY;
- (double)exposureScore;
- (double)leftEyeX;
- (double)leftEyeY;
- (double)mouthX;
- (double)mouthY;
- (double)poseYaw;
- (double)quality;
- (double)rightEyeX;
- (double)rightEyeY;
- (double)roll;
- (double)size;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)trainingType;
- (int64_t)clusterSequenceNumber;
- (int64_t)faceAlgorithmVersion;
- (int64_t)nameSource;
- (int64_t)qualityMeasure;
- (int64_t)sourceHeight;
- (int64_t)sourceWidth;
- (void)_copyPropertiesFrom:(id)a3 copyPropertiesOption:(int64_t)a4;
- (void)setAdjustmentVersion:(id)a3;
- (void)setAgeType:(id)a3;
- (void)setBaldType:(id)a3;
- (void)setBlurScore:(double)a3;
- (void)setCenterX:(double)a3;
- (void)setCenterY:(double)a3;
- (void)setClusterSequenceNumber:(int64_t)a3;
- (void)setCoordinatesAndFeaturesFromFace:(id)a3;
- (void)setExposureScore:(double)a3;
- (void)setEyeMakeupType:(id)a3;
- (void)setEyesState:(id)a3;
- (void)setFaceAlgorithmVersion:(int64_t)a3;
- (void)setFaceprint:(id)a3;
- (void)setFacialHairType:(id)a3;
- (void)setGlassesType:(id)a3;
- (void)setGroupingIdentifier:(id)a3;
- (void)setHairColorType:(id)a3;
- (void)setHasSmile:(BOOL)a3;
- (void)setHidden:(BOOL)a3;
- (void)setIsInTrash:(BOOL)a3;
- (void)setIsLeftEyeClosed:(BOOL)a3;
- (void)setIsRightEyeClosed:(BOOL)a3;
- (void)setIsTooSmall:(BOOL)a3;
- (void)setLeftEyeX:(double)a3;
- (void)setLeftEyeY:(double)a3;
- (void)setLipMakeupType:(id)a3;
- (void)setManual:(BOOL)a3;
- (void)setMouthX:(double)a3;
- (void)setMouthY:(double)a3;
- (void)setNameSource:(int64_t)a3;
- (void)setPersonLocalIdentifier:(id)a3;
- (void)setPoseYaw:(double)a3;
- (void)setQuality:(double)a3;
- (void)setQualityMeasure:(int64_t)a3;
- (void)setRightEyeX:(double)a3;
- (void)setRightEyeY:(double)a3;
- (void)setRoll:(double)a3;
- (void)setSexType:(id)a3;
- (void)setSize:(double)a3;
- (void)setSmileType:(id)a3;
- (void)setSourceHeight:(int64_t)a3;
- (void)setSourceWidth:(int64_t)a3;
- (void)setTrainingType:(int)a3;
@end

@implementation PVFace

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceprint, 0);
  objc_storeStrong((id *)&self->_groupingIdentifier, 0);
  objc_storeStrong((id *)&self->_adjustmentVersion, 0);

  objc_storeStrong((id *)&self->_personLocalIdentifier, 0);
}

- (void)setQuality:(double)a3
{
  self->_quality = a3;
}

- (double)quality
{
  return self->_quality;
}

- (void)setRoll:(double)a3
{
  self->_roll = a3;
}

- (double)roll
{
  return self->_roll;
}

- (void)setFaceprint:(id)a3
{
}

- (PVFaceprint)faceprint
{
  return self->_faceprint;
}

- (void)setGroupingIdentifier:(id)a3
{
}

- (NSString)groupingIdentifier
{
  return self->_groupingIdentifier;
}

- (void)setLipMakeupType:(id)a3
{
  self->_lipMakeupType = (NSString *)a3;
}

- (NSString)lipMakeupType
{
  return self->_lipMakeupType;
}

- (void)setEyeMakeupType:(id)a3
{
  self->_eyeMakeupType = (NSString *)a3;
}

- (NSString)eyeMakeupType
{
  return self->_eyeMakeupType;
}

- (void)setGlassesType:(id)a3
{
  self->_glassesType = (NSString *)a3;
}

- (NSString)glassesType
{
  return self->_glassesType;
}

- (void)setBaldType:(id)a3
{
  self->_baldType = (NSString *)a3;
}

- (NSString)baldType
{
  return self->_baldType;
}

- (void)setHairColorType:(id)a3
{
  self->_hairColorType = (NSString *)a3;
}

- (NSString)hairColorType
{
  return self->_hairColorType;
}

- (void)setFacialHairType:(id)a3
{
  self->_facialHairType = (NSString *)a3;
}

- (NSString)facialHairType
{
  return self->_facialHairType;
}

- (void)setSmileType:(id)a3
{
  self->_smileType = (NSString *)a3;
}

- (NSString)smileType
{
  return self->_smileType;
}

- (void)setEyesState:(id)a3
{
  self->_eyesState = (NSString *)a3;
}

- (NSString)eyesState
{
  return self->_eyesState;
}

- (void)setSexType:(id)a3
{
  self->_sexType = (NSString *)a3;
}

- (NSString)sexType
{
  return self->_sexType;
}

- (void)setAgeType:(id)a3
{
  self->_ageType = (NSString *)a3;
}

- (NSString)ageType
{
  return self->_ageType;
}

- (void)setQualityMeasure:(int64_t)a3
{
  self->_qualityMeasure = a3;
}

- (int64_t)qualityMeasure
{
  return self->_qualityMeasure;
}

- (void)setClusterSequenceNumber:(int64_t)a3
{
  self->_clusterSequenceNumber = a3;
}

- (int64_t)clusterSequenceNumber
{
  return self->_clusterSequenceNumber;
}

- (void)setFaceAlgorithmVersion:(int64_t)a3
{
  self->_faceAlgorithmVersion = a3;
}

- (int64_t)faceAlgorithmVersion
{
  return self->_faceAlgorithmVersion;
}

- (void)setPoseYaw:(double)a3
{
  self->_poseYaw = a3;
}

- (double)poseYaw
{
  return self->_poseYaw;
}

- (void)setTrainingType:(int)a3
{
  self->_trainingType = a3;
}

- (int)trainingType
{
  return self->_trainingType;
}

- (void)setNameSource:(int64_t)a3
{
  self->_nameSource = a3;
}

- (int64_t)nameSource
{
  return self->_nameSource;
}

- (void)setAdjustmentVersion:(id)a3
{
}

- (NSString)adjustmentVersion
{
  return self->_adjustmentVersion;
}

- (void)setIsRightEyeClosed:(BOOL)a3
{
  self->_isRightEyeClosed = a3;
}

- (BOOL)isRightEyeClosed
{
  return self->_isRightEyeClosed;
}

- (void)setIsLeftEyeClosed:(BOOL)a3
{
  self->_isLeftEyeClosed = a3;
}

- (BOOL)isLeftEyeClosed
{
  return self->_isLeftEyeClosed;
}

- (void)setExposureScore:(double)a3
{
  self->_exposureScore = a3;
}

- (double)exposureScore
{
  return self->_exposureScore;
}

- (void)setBlurScore:(double)a3
{
  self->_blurScore = a3;
}

- (double)blurScore
{
  return self->_blurScore;
}

- (void)setHasSmile:(BOOL)a3
{
  self->_hasSmile = a3;
}

- (BOOL)hasSmile
{
  return self->_hasSmile;
}

- (void)setIsTooSmall:(BOOL)a3
{
  self->_isTooSmall = a3;
}

- (BOOL)isTooSmall
{
  return self->_isTooSmall;
}

- (void)setManual:(BOOL)a3
{
  self->_manual = a3;
}

- (BOOL)manual
{
  return self->_manual;
}

- (void)setIsInTrash:(BOOL)a3
{
  self->_isInTrash = a3;
}

- (BOOL)isInTrash
{
  return self->_isInTrash;
}

- (void)setHidden:(BOOL)a3
{
  self->_hidden = a3;
}

- (BOOL)hidden
{
  return self->_hidden;
}

- (void)setMouthY:(double)a3
{
  self->_mouthY = a3;
}

- (double)mouthY
{
  return self->_mouthY;
}

- (void)setMouthX:(double)a3
{
  self->_mouthX = a3;
}

- (double)mouthX
{
  return self->_mouthX;
}

- (void)setRightEyeY:(double)a3
{
  self->_rightEyeY = a3;
}

- (double)rightEyeY
{
  return self->_rightEyeY;
}

- (void)setRightEyeX:(double)a3
{
  self->_rightEyeX = a3;
}

- (double)rightEyeX
{
  return self->_rightEyeX;
}

- (void)setLeftEyeY:(double)a3
{
  self->_leftEyeY = a3;
}

- (double)leftEyeY
{
  return self->_leftEyeY;
}

- (void)setLeftEyeX:(double)a3
{
  self->_leftEyeX = a3;
}

- (double)leftEyeX
{
  return self->_leftEyeX;
}

- (void)setSize:(double)a3
{
  self->_size = a3;
}

- (double)size
{
  return self->_size;
}

- (void)setCenterY:(double)a3
{
  self->_centerY = a3;
}

- (double)centerY
{
  return self->_centerY;
}

- (void)setCenterX:(double)a3
{
  self->_centerX = a3;
}

- (double)centerX
{
  return self->_centerX;
}

- (void)setSourceHeight:(int64_t)a3
{
  self->_sourceHeight = a3;
}

- (int64_t)sourceHeight
{
  return self->_sourceHeight;
}

- (void)setSourceWidth:(int64_t)a3
{
  self->_sourceWidth = a3;
}

- (int64_t)sourceWidth
{
  return self->_sourceWidth;
}

- (void)setPersonLocalIdentifier:(id)a3
{
}

- (NSString)personLocalIdentifier
{
  return self->_personLocalIdentifier;
}

- (CGRect)absoluteFaceRectForImageSize:(CGSize)a3
{
  unint64_t width = (unint64_t)a3.width;
  if ((unint64_t)a3.width <= (unint64_t)a3.height) {
    unint64_t width = (unint64_t)a3.height;
  }
  double v4 = self->_size * (double)width;
  double v5 = -(v4 * 0.5 - self->_centerX * (double)(unint64_t)a3.width);
  double v6 = (double)(unint64_t)a3.height - self->_centerY * (double)(unint64_t)a3.height - v4 * 0.5;
  double v7 = v4;
  result.size.height = v7;
  result.size.unint64_t width = v4;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (CGRect)absoluteFaceRect
{
  unint64_t sourceWidth = self->_sourceWidth;
  unint64_t sourceHeight = self->_sourceHeight;
  if (sourceWidth <= sourceHeight) {
    int64_t v4 = self->_sourceHeight;
  }
  else {
    int64_t v4 = self->_sourceWidth;
  }
  double v5 = self->_size * (double)(unint64_t)v4;
  double v6 = -(v5 * 0.5 - self->_centerX * (double)sourceWidth);
  double v7 = (double)sourceHeight - self->_centerY * (double)sourceHeight - v5 * 0.5;
  double v8 = v5;
  result.size.height = v8;
  result.size.unint64_t width = v5;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (CGRect)normalizedFaceRect
{
  double size = self->_size;
  int64_t sourceWidth = self->_sourceWidth;
  int64_t sourceHeight = self->_sourceHeight;
  if (sourceWidth <= sourceHeight) {
    int64_t v5 = self->_sourceHeight;
  }
  else {
    int64_t v5 = self->_sourceWidth;
  }
  double v6 = size * (double)v5;
  double v7 = v6 / (double)sourceWidth;
  double v8 = v6 / (double)sourceHeight;
  double v9 = 1.0;
  if (size <= 1.0) {
    double v9 = self->_size;
  }
  double v10 = self->_centerX - v7 * 0.5;
  double v11 = self->_centerY - v8 * 0.5;
  if (v10 < 0.0) {
    double v10 = 0.0;
  }
  if (v11 < 0.0) {
    double v11 = 0.0;
  }
  double v12 = v9;
  result.size.height = v12;
  result.size.unint64_t width = v9;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (BOOL)setCenterAndSizeFromNormalizedFaceRect:(CGRect)a3
{
  double v6 = 0.0;
  double v7 = 0.0;
  double v5 = 0.0;
  PVFaceGetCenterAndSizeForNormalizedRect(self->_sourceWidth, self->_sourceHeight, &v7, &v6, &v5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  self->_centerX = v7;
  self->_centerY = v6;
  self->_double size = v5;
  return 1;
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  v7.receiver = self;
  v7.super_class = (Class)PVFace;
  int64_t v4 = [(PVObject *)&v7 description];
  double v5 = [v3 stringWithString:v4];

  objc_msgSend(v5, "appendFormat:", @"  clusterSequenceNumber  : %ld\n", self->_clusterSequenceNumber);
  [v5 appendFormat:@"  personLocalIdentifier  : %@\n", self->_personLocalIdentifier];
  objc_msgSend(v5, "appendFormat:", @"  nameSource             : %ld\n", self->_nameSource);
  objc_msgSend(v5, "appendFormat:", @"  trainingType           : %ld\n", self->_trainingType);
  objc_msgSend(v5, "appendFormat:", @"  manual                 : %d\n", self->_manual);
  objc_msgSend(v5, "appendFormat:", @"  hidden                 : %d\n", self->_hidden);
  objc_msgSend(v5, "appendFormat:", @"  isInTrash              : %d\n", self->_isInTrash);
  objc_msgSend(v5, "appendFormat:", @"  isTooSmall             : %d\n", self->_isTooSmall);
  objc_msgSend(v5, "appendFormat:", @"  faceprint              : %p\n", self->_faceprint);
  [v5 appendFormat:@"  adjustmentVersion      : %@\n", self->_adjustmentVersion];
  objc_msgSend(v5, "appendFormat:", @"  sourceWidth            : %ld\n", self->_sourceWidth);
  objc_msgSend(v5, "appendFormat:", @"  sourceHeight           : %ld\n", self->_sourceHeight);
  objc_msgSend(v5, "appendFormat:", @"  centerX                : %f\n", *(void *)&self->_centerX);
  objc_msgSend(v5, "appendFormat:", @"  centerY                : %f\n", *(void *)&self->_centerY);
  objc_msgSend(v5, "appendFormat:", @"  size                   : %f\n", *(void *)&self->_size);
  objc_msgSend(v5, "appendFormat:", @"  leftEyeX               : %f\n", *(void *)&self->_leftEyeX);
  objc_msgSend(v5, "appendFormat:", @"  leftEyeY               : %f\n", *(void *)&self->_leftEyeY);
  objc_msgSend(v5, "appendFormat:", @"  rightEyeX              : %f\n", *(void *)&self->_rightEyeX);
  objc_msgSend(v5, "appendFormat:", @"  rightEyeY              : %f\n", *(void *)&self->_rightEyeY);
  objc_msgSend(v5, "appendFormat:", @"  mouthX                 : %f\n", *(void *)&self->_mouthX);
  objc_msgSend(v5, "appendFormat:", @"  mouthY                 : %f\n", *(void *)&self->_mouthY);
  objc_msgSend(v5, "appendFormat:", @"  hasSmile               : %d\n", self->_hasSmile);
  objc_msgSend(v5, "appendFormat:", @"  blurScore              : %f\n", *(void *)&self->_blurScore);
  objc_msgSend(v5, "appendFormat:", @"  isLeftEyeClosed        : %d\n", self->_isLeftEyeClosed);
  objc_msgSend(v5, "appendFormat:", @"  isRightEyeClosed       : %d\n", self->_isRightEyeClosed);
  objc_msgSend(v5, "appendFormat:", @"  poseYaw                : %f\n", *(void *)&self->_poseYaw);
  objc_msgSend(v5, "appendFormat:", @"  faceAlgorithmVersion   : %lu\n", self->_faceAlgorithmVersion);
  objc_msgSend(v5, "appendFormat:", @"  qualityMeasure         : %ld\n", self->_qualityMeasure);
  [v5 appendFormat:@"  groupingIdentifier     : %@\n", self->_groupingIdentifier];

  return v5;
}

- (void)setCoordinatesAndFeaturesFromFace:(id)a3
{
  id v4 = a3;
  self->_int64_t sourceWidth = [v4 sourceWidth];
  self->_int64_t sourceHeight = [v4 sourceHeight];
  [v4 centerX];
  self->_centerX = v5;
  [v4 centerY];
  self->_centerY = v6;
  [v4 size];
  self->_double size = v7;
  [v4 leftEyeX];
  self->_leftEyeX = v8;
  [v4 leftEyeY];
  self->_leftEyeY = v9;
  [v4 rightEyeX];
  self->_rightEyeX = v10;
  [v4 rightEyeY];
  self->_rightEyeY = v11;
  [v4 mouthX];
  self->_mouthX = v12;
  [v4 mouthY];
  self->_mouthY = v13;
  self->_hasSmile = [v4 hasSmile];
  [v4 blurScore];
  self->_blurScore = v14;
  self->_isLeftEyeClosed = [v4 isLeftEyeClosed];
  self->_isRightEyeClosed = [v4 isRightEyeClosed];
  [v4 poseYaw];
  self->_poseYaw = v15;
  self->_faceAlgorithmVersion = [v4 faceAlgorithmVersion];
  self->_qualityMeasure = [v4 qualityMeasure];
  self->_isTooSmall = [v4 isTooSmall];
  v16 = [v4 groupingIdentifier];
  groupingIdentifier = self->_groupingIdentifier;
  self->_groupingIdentifier = v16;

  self->_ageType = (NSString *)(id)[v4 ageType];
  self->_sexType = (NSString *)(id)[v4 sexType];
  self->_eyesState = (NSString *)(id)[v4 eyesState];
  self->_smileType = (NSString *)(id)[v4 smileType];
  self->_facialHairType = (NSString *)(id)[v4 facialHairType];
  self->_hairColorType = (NSString *)(id)[v4 hairColorType];
  self->_baldType = (NSString *)(id)[v4 baldType];
  self->_glassesType = (NSString *)(id)[v4 glassesType];
  self->_eyeMakeupType = (NSString *)(id)[v4 eyeMakeupType];
  self->_lipMakeupType = (NSString *)(id)[v4 lipMakeupType];
  [v4 roll];
  self->_roll = v18;
  [v4 quality];
  double v20 = v19;

  self->_quality = v20;
}

- (void)_copyPropertiesFrom:(id)a3 copyPropertiesOption:(int64_t)a4
{
  id v6 = a3;
  double v7 = v6;
  v25 = v6;
  switch(a4)
  {
    case 0:
      double v8 = [v6 personLocalIdentifier];
      personLocalIdentifier = self->_personLocalIdentifier;
      self->_personLocalIdentifier = v8;

      [(PVFace *)self setCoordinatesAndFeaturesFromFace:v25];
      self->_isTooSmall = [v25 isTooSmall];
      self->_hidden = [v25 hidden];
      self->_isInTrash = [v25 isInTrash];
      self->_manual = [v25 manual];
      double v10 = [v25 adjustmentVersion];
      adjustmentVersion = self->_adjustmentVersion;
      self->_adjustmentVersion = v10;

      self->_nameSource = [v25 nameSource];
      self->_trainingType = [v25 trainingType];
      self->_clusterSequenceNumber = [v25 clusterSequenceNumber];
      break;
    case 1:
      double v12 = [v6 personLocalIdentifier];
      double v13 = self->_personLocalIdentifier;
      self->_personLocalIdentifier = v12;

      self->_int64_t sourceWidth = [v25 sourceWidth];
      self->_int64_t sourceHeight = [v25 sourceHeight];
      [v25 centerX];
      self->_centerX = v14;
      [v25 centerY];
      self->_centerY = v15;
      [v25 size];
      self->_double size = v16;
      self->_qualityMeasure = [v25 qualityMeasure];
      self->_clusterSequenceNumber = [v25 clusterSequenceNumber];
      self->_isTooSmall = [v25 isTooSmall];
      self->_hidden = [v25 hidden];
      self->_isInTrash = [v25 isInTrash];
      self->_manual = [v25 manual];
      break;
    case 2:
      [(PVFace *)self setCoordinatesAndFeaturesFromFace:v6];
      self->_isTooSmall = [v25 isTooSmall];
      self->_hidden = [v25 hidden];
      self->_isInTrash = [v25 isInTrash];
      self->_manual = [v25 manual];
      v17 = [v25 adjustmentVersion];
      double v18 = self->_adjustmentVersion;
      self->_adjustmentVersion = v17;

      double v7 = v25;
      goto LABEL_5;
    case 3:
LABEL_5:
      self->_nameSource = [v7 nameSource];
      self->_trainingType = [v25 trainingType];
      double v19 = [v25 personLocalIdentifier];
      double v20 = self->_personLocalIdentifier;
      self->_personLocalIdentifier = v19;

      self->_clusterSequenceNumber = [v25 clusterSequenceNumber];
      v21 = [v25 faceprint];
      faceprint = self->_faceprint;
      self->_faceprint = v21;

      v23 = [v25 groupingIdentifier];
      groupingIdentifier = self->_groupingIdentifier;
      self->_groupingIdentifier = v23;

      break;
    default:
      break;
  }

  MEMORY[0x1F41817F8]();
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PVFace;
  id v4 = [(PVObject *)&v6 copyWithZone:a3];
  [v4 _copyPropertiesFrom:self copyPropertiesOption:0];
  return v4;
}

+ (PVFace)faceWithFace:(id)a3 copyPropertiesOption:(int64_t)a4
{
  id v5 = a3;
  objc_super v6 = [PVFace alloc];
  double v7 = [v5 localIdentifier];
  double v8 = [(PVObject *)v6 initWithLocalIdentifier:v7];

  [(PVFace *)v8 _copyPropertiesFrom:v5 copyPropertiesOption:a4];

  return v8;
}

@end
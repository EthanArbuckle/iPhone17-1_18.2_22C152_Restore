@interface FPDisparityEstimator_CostParameters
- (NSArray)correctionCoefficientsWeights;
- (float)AGCHigh;
- (float)AGCLow;
- (float)backgroundPush;
- (float)circleOfConfusionGain;
- (float)circleOfConfusionOffset;
- (float)costEpsilon;
- (float)costMapAntialiasingStrength;
- (float)foregroundPush;
- (float)lensFieldCurvatureA0;
- (float)lensFieldCurvatureA1;
- (float)lensFieldCurvatureA2;
- (float)lensFieldCurvatureA3;
- (float)lensFieldCurvatureA4;
- (float)microlensSpatialOffset;
- (float)radialExponent;
- (float)radialGain;
- (float)radialMin;
- (id)description;
- (unsigned)nView;
- (unsigned)rigidWindowSupport;
- (void)setAGCHigh:(float)a3;
- (void)setAGCLow:(float)a3;
- (void)setBackgroundPush:(float)a3;
- (void)setCircleOfConfusionGain:(float)a3;
- (void)setCircleOfConfusionOffset:(float)a3;
- (void)setCorrectionCoefficientsWeights:(id)a3;
- (void)setCostEpsilon:(float)a3;
- (void)setCostMapAntialiasingStrength:(float)a3;
- (void)setForegroundPush:(float)a3;
- (void)setLensFieldCurvatureA0:(float)a3;
- (void)setLensFieldCurvatureA1:(float)a3;
- (void)setLensFieldCurvatureA2:(float)a3;
- (void)setLensFieldCurvatureA3:(float)a3;
- (void)setLensFieldCurvatureA4:(float)a3;
- (void)setMicrolensSpatialOffset:(float)a3;
- (void)setNView:(unsigned int)a3;
- (void)setRadialExponent:(float)a3;
- (void)setRadialGain:(float)a3;
- (void)setRadialMin:(float)a3;
- (void)setRigidWindowSupport:(unsigned int)a3;
@end

@implementation FPDisparityEstimator_CostParameters

- (id)description
{
  v3 = objc_msgSend_stringWithFormat_(NSString, a2, @"\r");
  v5 = objc_msgSend_stringWithFormat_(NSString, v4, @"nView:                          %u \r", self->_nView);
  v7 = objc_msgSend_stringByAppendingString_(v3, v6, (uint64_t)v5);

  v9 = objc_msgSend_stringWithFormat_(NSString, v8, @"rigidWindowSupport:             %d \r", self->_rigidWindowSupport);
  v11 = objc_msgSend_stringByAppendingString_(v7, v10, (uint64_t)v9);

  v13 = objc_msgSend_stringWithFormat_(NSString, v12, @"costMapAntialiasingStrength:    %f \r", self->_costMapAntialiasingStrength);
  v15 = objc_msgSend_stringByAppendingString_(v11, v14, (uint64_t)v13);

  v17 = objc_msgSend_stringWithFormat_(NSString, v16, @"costEpsilon:                    %f \r", self->_costEpsilon);
  v19 = objc_msgSend_stringByAppendingString_(v15, v18, (uint64_t)v17);

  return v19;
}

- (unsigned)nView
{
  return self->_nView;
}

- (void)setNView:(unsigned int)a3
{
  self->_nView = a3;
}

- (float)microlensSpatialOffset
{
  return self->_microlensSpatialOffset;
}

- (void)setMicrolensSpatialOffset:(float)a3
{
  self->_microlensSpatialOffset = a3;
}

- (float)foregroundPush
{
  return self->_foregroundPush;
}

- (void)setForegroundPush:(float)a3
{
  self->_foregroundPush = a3;
}

- (float)backgroundPush
{
  return self->_backgroundPush;
}

- (void)setBackgroundPush:(float)a3
{
  self->_backgroundPush = a3;
}

- (unsigned)rigidWindowSupport
{
  return self->_rigidWindowSupport;
}

- (void)setRigidWindowSupport:(unsigned int)a3
{
  self->_rigidWindowSupport = a3;
}

- (float)costMapAntialiasingStrength
{
  return self->_costMapAntialiasingStrength;
}

- (void)setCostMapAntialiasingStrength:(float)a3
{
  self->_costMapAntialiasingStrength = a3;
}

- (float)costEpsilon
{
  return self->_costEpsilon;
}

- (void)setCostEpsilon:(float)a3
{
  self->_costEpsilon = a3;
}

- (float)lensFieldCurvatureA0
{
  return self->_lensFieldCurvatureA0;
}

- (void)setLensFieldCurvatureA0:(float)a3
{
  self->_lensFieldCurvatureA0 = a3;
}

- (float)lensFieldCurvatureA1
{
  return self->_lensFieldCurvatureA1;
}

- (void)setLensFieldCurvatureA1:(float)a3
{
  self->_lensFieldCurvatureA1 = a3;
}

- (float)lensFieldCurvatureA2
{
  return self->_lensFieldCurvatureA2;
}

- (void)setLensFieldCurvatureA2:(float)a3
{
  self->_lensFieldCurvatureA2 = a3;
}

- (float)lensFieldCurvatureA3
{
  return self->_lensFieldCurvatureA3;
}

- (void)setLensFieldCurvatureA3:(float)a3
{
  self->_lensFieldCurvatureA3 = a3;
}

- (float)lensFieldCurvatureA4
{
  return self->_lensFieldCurvatureA4;
}

- (void)setLensFieldCurvatureA4:(float)a3
{
  self->_lensFieldCurvatureA4 = a3;
}

- (float)circleOfConfusionGain
{
  return self->_circleOfConfusionGain;
}

- (void)setCircleOfConfusionGain:(float)a3
{
  self->_circleOfConfusionGain = a3;
}

- (float)circleOfConfusionOffset
{
  return self->_circleOfConfusionOffset;
}

- (void)setCircleOfConfusionOffset:(float)a3
{
  self->_circleOfConfusionOffset = a3;
}

- (float)radialExponent
{
  return self->_radialExponent;
}

- (void)setRadialExponent:(float)a3
{
  self->_radialExponent = a3;
}

- (float)radialGain
{
  return self->_radialGain;
}

- (void)setRadialGain:(float)a3
{
  self->_radialGain = a3;
}

- (float)radialMin
{
  return self->_radialMin;
}

- (void)setRadialMin:(float)a3
{
  self->_radialMin = a3;
}

- (float)AGCLow
{
  return self->_AGCLow;
}

- (void)setAGCLow:(float)a3
{
  self->_AGCLow = a3;
}

- (float)AGCHigh
{
  return self->_AGCHigh;
}

- (void)setAGCHigh:(float)a3
{
  self->_AGCHigh = a3;
}

- (NSArray)correctionCoefficientsWeights
{
  return self->_correctionCoefficientsWeights;
}

- (void)setCorrectionCoefficientsWeights:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
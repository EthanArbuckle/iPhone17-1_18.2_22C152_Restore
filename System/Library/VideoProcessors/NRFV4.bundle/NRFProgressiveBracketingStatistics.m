@interface NRFProgressiveBracketingStatistics
- (BOOL)aeLimitsReached;
- (BOOL)stationary;
- (NSData)aeThumbnail;
- (double)integrationTime;
- (float)aeAverage;
- (float)aeTarget;
- (float)agc;
- (float)bias;
- (float)conversionGain;
- (float)gain;
- (float)ispDGain;
- (float)ispDGainRangeExpansionFactor;
- (float)motionDataBiasErrorEstimate;
- (float)readNoise_1x;
- (float)readNoise_8x;
- (float)sensorDGain;
- (int)aeThumbnailHeight;
- (int)aeThumbnailWidth;
- (int)motionFromAEMatrix;
- (int)numberOfHumanBodies;
- (int)numberOfHumanFaces;
- (void)setAeAverage:(float)a3;
- (void)setAeLimitsReached:(BOOL)a3;
- (void)setAeTarget:(float)a3;
- (void)setAeThumbnail:(id)a3;
- (void)setAeThumbnailHeight:(int)a3;
- (void)setAeThumbnailWidth:(int)a3;
- (void)setAgc:(float)a3;
- (void)setBias:(float)a3;
- (void)setConversionGain:(float)a3;
- (void)setGain:(float)a3;
- (void)setIntegrationTime:(double)a3;
- (void)setIspDGain:(float)a3;
- (void)setIspDGainRangeExpansionFactor:(float)a3;
- (void)setMotionDataBiasErrorEstimate:(float)a3;
- (void)setMotionFromAEMatrix:(int)a3;
- (void)setNumberOfHumanBodies:(int)a3;
- (void)setNumberOfHumanFaces:(int)a3;
- (void)setReadNoise_1x:(float)a3;
- (void)setReadNoise_8x:(float)a3;
- (void)setSensorDGain:(float)a3;
- (void)setStationary:(BOOL)a3;
@end

@implementation NRFProgressiveBracketingStatistics

- (float)conversionGain
{
  return self->_conversionGain;
}

- (void)setConversionGain:(float)a3
{
  self->_conversionGain = a3;
}

- (float)readNoise_1x
{
  return self->_readNoise_1x;
}

- (void)setReadNoise_1x:(float)a3
{
  self->_readNoise_1x = a3;
}

- (float)readNoise_8x
{
  return self->_readNoise_8x;
}

- (void)setReadNoise_8x:(float)a3
{
  self->_readNoise_8x = a3;
}

- (double)integrationTime
{
  return self->_integrationTime;
}

- (void)setIntegrationTime:(double)a3
{
  self->_integrationTime = a3;
}

- (float)agc
{
  return self->_agc;
}

- (void)setAgc:(float)a3
{
  self->_agc = a3;
}

- (float)ispDGain
{
  return self->_ispDGain;
}

- (void)setIspDGain:(float)a3
{
  self->_ispDGain = a3;
}

- (float)sensorDGain
{
  return self->_sensorDGain;
}

- (void)setSensorDGain:(float)a3
{
  self->_sensorDGain = a3;
}

- (float)ispDGainRangeExpansionFactor
{
  return self->_ispDGainRangeExpansionFactor;
}

- (void)setIspDGainRangeExpansionFactor:(float)a3
{
  self->_ispDGainRangeExpansionFactor = a3;
}

- (float)gain
{
  return self->_gain;
}

- (void)setGain:(float)a3
{
  self->_gain = a3;
}

- (float)bias
{
  return self->_bias;
}

- (void)setBias:(float)a3
{
  self->_bias = a3;
}

- (BOOL)aeLimitsReached
{
  return self->_aeLimitsReached;
}

- (void)setAeLimitsReached:(BOOL)a3
{
  self->_aeLimitsReached = a3;
}

- (float)aeAverage
{
  return self->_aeAverage;
}

- (void)setAeAverage:(float)a3
{
  self->_aeAverage = a3;
}

- (float)aeTarget
{
  return self->_aeTarget;
}

- (void)setAeTarget:(float)a3
{
  self->_aeTarget = a3;
}

- (int)motionFromAEMatrix
{
  return self->_motionFromAEMatrix;
}

- (void)setMotionFromAEMatrix:(int)a3
{
  self->_motionFromAEMatrix = a3;
}

- (NSData)aeThumbnail
{
  return self->_aeThumbnail;
}

- (void)setAeThumbnail:(id)a3
{
}

- (int)aeThumbnailWidth
{
  return self->_aeThumbnailWidth;
}

- (void)setAeThumbnailWidth:(int)a3
{
  self->_aeThumbnailWidth = a3;
}

- (int)aeThumbnailHeight
{
  return self->_aeThumbnailHeight;
}

- (void)setAeThumbnailHeight:(int)a3
{
  self->_aeThumbnailHeight = a3;
}

- (BOOL)stationary
{
  return self->_stationary;
}

- (void)setStationary:(BOOL)a3
{
  self->_stationary = a3;
}

- (float)motionDataBiasErrorEstimate
{
  return self->_motionDataBiasErrorEstimate;
}

- (void)setMotionDataBiasErrorEstimate:(float)a3
{
  self->_motionDataBiasErrorEstimate = a3;
}

- (int)numberOfHumanFaces
{
  return self->_numberOfHumanFaces;
}

- (void)setNumberOfHumanFaces:(int)a3
{
  self->_numberOfHumanFaces = a3;
}

- (int)numberOfHumanBodies
{
  return self->_numberOfHumanBodies;
}

- (void)setNumberOfHumanBodies:(int)a3
{
  self->_numberOfHumanBodies = a3;
}

- (void).cxx_destruct
{
}

@end
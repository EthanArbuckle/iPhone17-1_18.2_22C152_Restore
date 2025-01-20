@interface CMISoftwareFlashRenderingCoreAnalyticsV2Configuration
- (CMISoftwareFlashRenderingCoreAnalyticsV2Configuration)init;
- (float)castCorrectionStrengthThreshold_Imperceptible;
- (float)castCorrectionStrengthThreshold_Medium;
- (float)castCorrectionStrengthThreshold_Mild;
- (float)castCorrectionStrengthThreshold_Strong;
- (float)castStrengthMetricMaxDeltaEuv;
- (float)castStrengthMetricMinSampleRatio;
- (float)castStrengthMetricSummaryPercentile;
- (float)foregroundMixFactorThreshold;
- (float)numCorrectionDirectionWhitePointSamples;
- (unsigned)castStrengthMetricNumHistogramBins;
- (unsigned)spatialGridHeight;
- (unsigned)spatialGridWidth;
- (void)setCastCorrectionStrengthThreshold_Imperceptible:(float)a3;
- (void)setCastCorrectionStrengthThreshold_Medium:(float)a3;
- (void)setCastCorrectionStrengthThreshold_Mild:(float)a3;
- (void)setCastCorrectionStrengthThreshold_Strong:(float)a3;
- (void)setCastStrengthMetricMaxDeltaEuv:(float)a3;
- (void)setCastStrengthMetricMinSampleRatio:(float)a3;
- (void)setCastStrengthMetricNumHistogramBins:(unsigned int)a3;
- (void)setCastStrengthMetricSummaryPercentile:(float)a3;
- (void)setForegroundMixFactorThreshold:(float)a3;
- (void)setNumCorrectionDirectionWhitePointSamples:(float)a3;
- (void)setSpatialGridHeight:(unsigned int)a3;
- (void)setSpatialGridWidth:(unsigned int)a3;
@end

@implementation CMISoftwareFlashRenderingCoreAnalyticsV2Configuration

- (CMISoftwareFlashRenderingCoreAnalyticsV2Configuration)init
{
  v3.receiver = self;
  v3.super_class = (Class)CMISoftwareFlashRenderingCoreAnalyticsV2Configuration;
  result = [(CMISoftwareFlashRenderingCoreAnalyticsV2Configuration *)&v3 init];
  if (result)
  {
    *(void *)&result->_spatialGridHeight = 0x8000000060;
    *(void *)&result->_foregroundMixFactorThreshold = 0x41A000003F000000;
    result->_castStrengthMetricNumHistogramBins = 256;
    *(_OWORD *)&result->_castStrengthMetricMaxDeltaEuv = xmmword_26337FE10;
    *(void *)&result->_castCorrectionStrengthThreshold_Mild = 0x40A000003F800000;
    result->_castCorrectionStrengthThreshold_Strong = 10.0;
  }
  return result;
}

- (unsigned)spatialGridHeight
{
  return self->_spatialGridHeight;
}

- (void)setSpatialGridHeight:(unsigned int)a3
{
  self->_spatialGridHeight = a3;
}

- (unsigned)spatialGridWidth
{
  return self->_spatialGridWidth;
}

- (void)setSpatialGridWidth:(unsigned int)a3
{
  self->_spatialGridWidth = a3;
}

- (float)foregroundMixFactorThreshold
{
  return self->_foregroundMixFactorThreshold;
}

- (void)setForegroundMixFactorThreshold:(float)a3
{
  self->_foregroundMixFactorThreshold = a3;
}

- (float)numCorrectionDirectionWhitePointSamples
{
  return self->_numCorrectionDirectionWhitePointSamples;
}

- (void)setNumCorrectionDirectionWhitePointSamples:(float)a3
{
  self->_numCorrectionDirectionWhitePointSamples = a3;
}

- (unsigned)castStrengthMetricNumHistogramBins
{
  return self->_castStrengthMetricNumHistogramBins;
}

- (void)setCastStrengthMetricNumHistogramBins:(unsigned int)a3
{
  self->_castStrengthMetricNumHistogramBins = a3;
}

- (float)castStrengthMetricMaxDeltaEuv
{
  return self->_castStrengthMetricMaxDeltaEuv;
}

- (void)setCastStrengthMetricMaxDeltaEuv:(float)a3
{
  self->_castStrengthMetricMaxDeltaEuv = a3;
}

- (float)castStrengthMetricMinSampleRatio
{
  return self->_castStrengthMetricMinSampleRatio;
}

- (void)setCastStrengthMetricMinSampleRatio:(float)a3
{
  self->_castStrengthMetricMinSampleRatio = a3;
}

- (float)castStrengthMetricSummaryPercentile
{
  return self->_castStrengthMetricSummaryPercentile;
}

- (void)setCastStrengthMetricSummaryPercentile:(float)a3
{
  self->_castStrengthMetricSummaryPercentile = a3;
}

- (float)castCorrectionStrengthThreshold_Imperceptible
{
  return self->_castCorrectionStrengthThreshold_Imperceptible;
}

- (void)setCastCorrectionStrengthThreshold_Imperceptible:(float)a3
{
  self->_castCorrectionStrengthThreshold_Imperceptible = a3;
}

- (float)castCorrectionStrengthThreshold_Mild
{
  return self->_castCorrectionStrengthThreshold_Mild;
}

- (void)setCastCorrectionStrengthThreshold_Mild:(float)a3
{
  self->_castCorrectionStrengthThreshold_Mild = a3;
}

- (float)castCorrectionStrengthThreshold_Medium
{
  return self->_castCorrectionStrengthThreshold_Medium;
}

- (void)setCastCorrectionStrengthThreshold_Medium:(float)a3
{
  self->_castCorrectionStrengthThreshold_Medium = a3;
}

- (float)castCorrectionStrengthThreshold_Strong
{
  return self->_castCorrectionStrengthThreshold_Strong;
}

- (void)setCastCorrectionStrengthThreshold_Strong:(float)a3
{
  self->_castCorrectionStrengthThreshold_Strong = a3;
}

@end
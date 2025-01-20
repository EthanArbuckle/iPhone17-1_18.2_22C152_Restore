@interface PNPersonDeduperProfile
- (BOOL)shouldAdjustThresholdOnAgeType;
- (BOOL)shouldRelaxThreshold;
- (PNPersonDeduperProfile)init;
- (double)fuzzyMaximumDistance;
- (double)normalMaximumDistance;
- (double)strictMaximumDistance;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initForDetectionType:(signed __int16)a3;
- (unint64_t)faceProcessingVersion;
- (void)setFaceProcessingVersion:(unint64_t)a3;
- (void)setFuzzyMaximumDistance:(double)a3;
- (void)setNormalMaximumDistance:(double)a3;
- (void)setShouldRelaxThreshold:(BOOL)a3;
- (void)setStrictMaximumDistance:(double)a3;
@end

@implementation PNPersonDeduperProfile

- (void)setFaceProcessingVersion:(unint64_t)a3
{
  self->_faceProcessingVersion = a3;
}

- (unint64_t)faceProcessingVersion
{
  return self->_faceProcessingVersion;
}

- (void)setShouldRelaxThreshold:(BOOL)a3
{
  self->_shouldRelaxThreshold = a3;
}

- (BOOL)shouldRelaxThreshold
{
  return self->_shouldRelaxThreshold;
}

- (void)setFuzzyMaximumDistance:(double)a3
{
  self->_fuzzyMaximumDistance = a3;
}

- (double)fuzzyMaximumDistance
{
  return self->_fuzzyMaximumDistance;
}

- (void)setNormalMaximumDistance:(double)a3
{
  self->_normalMaximumDistance = a3;
}

- (double)normalMaximumDistance
{
  return self->_normalMaximumDistance;
}

- (void)setStrictMaximumDistance:(double)a3
{
  self->_strictMaximumDistance = a3;
}

- (double)strictMaximumDistance
{
  return self->_strictMaximumDistance;
}

- (BOOL)shouldAdjustThresholdOnAgeType
{
  return [(PNPersonDeduperProfile *)self faceProcessingVersion] < 6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  [(PNPersonDeduperProfile *)self strictMaximumDistance];
  objc_msgSend(v4, "setStrictMaximumDistance:");
  [(PNPersonDeduperProfile *)self normalMaximumDistance];
  objc_msgSend(v4, "setNormalMaximumDistance:");
  [(PNPersonDeduperProfile *)self fuzzyMaximumDistance];
  objc_msgSend(v4, "setFuzzyMaximumDistance:");
  objc_msgSend(v4, "setShouldRelaxThreshold:", -[PNPersonDeduperProfile shouldRelaxThreshold](self, "shouldRelaxThreshold"));
  objc_msgSend(v4, "setFaceProcessingVersion:", -[PNPersonDeduperProfile faceProcessingVersion](self, "faceProcessingVersion"));
  return v4;
}

- (id)initForDetectionType:(signed __int16)a3
{
  int v3 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PNPersonDeduperProfile;
  v4 = [(PNPersonDeduperProfile *)&v12 init];
  v5 = v4;
  double v6 = 0.215;
  int32x2_t v7 = vdup_n_s32(v3 == 1);
  v8.i64[0] = v7.u32[0];
  v8.i64[1] = v7.u32[1];
  *(int8x16_t *)&v4->_strictMaximumDistance = vbslq_s8((int8x16_t)vcltzq_s64(vshlq_n_s64(v8, 0x3FuLL)), (int8x16_t)xmmword_2598983E0, (int8x16_t)xmmword_2598983D0);
  if (v3 != 1) {
    double v6 = 0.125;
  }
  v4->_fuzzyMaximumDistance = v6;
  v4->_shouldRelaxThreshold = 0;
  int v9 = _os_feature_enabled_impl();
  uint64_t v10 = 11;
  if (v9) {
    uint64_t v10 = 15;
  }
  v5->_faceProcessingVersion = v10;
  return v5;
}

- (PNPersonDeduperProfile)init
{
  return (PNPersonDeduperProfile *)[(PNPersonDeduperProfile *)self initForDetectionType:1];
}

@end
@interface NIVisionInput
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)majorRelocalization;
- (BOOL)minorRelocalization;
- (NIVisionInput)initWithCoder:(id)a3;
- (NIVisionInput)initWithTimestamp:(__n128)a3 devicePose:(__n128)a4 trackingState:(__n128)a5 lightEstimate:(__n128)a6 majorRelocalization:(double)a7 minorRelocalization:(uint64_t)a8;
- (double)devicePose;
- (double)lightEstimate;
- (double)timestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)trackingState;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)overrideTimestamp:(double)a3;
@end

@implementation NIVisionInput

- (NIVisionInput)initWithTimestamp:(__n128)a3 devicePose:(__n128)a4 trackingState:(__n128)a5 lightEstimate:(__n128)a6 majorRelocalization:(double)a7 minorRelocalization:(uint64_t)a8
{
  v24.receiver = a1;
  v24.super_class = (Class)NIVisionInput;
  v16 = [(NIVisionInput *)&v24 init];
  v17 = v16;
  if (v16)
  {
    v16->_timestamp = a2;
    *(__n128 *)&v16[1].super.isa = a3;
    *(__n128 *)&v16[1]._timestamp = a4;
    *(__n128 *)&v16[1]._lightEstimate = a5;
    *(__n128 *)&v16[2].super.isa = a6;
    v16->_trackingState = a9;
    v16->_lightEstimate = a7;
    v16->_majorRelocalization = a10;
    v16->_minorRelocalization = a11;
    v18 = v16;
  }

  return v17;
}

- (void)overrideTimestamp:(double)a3
{
  self->_timestamp = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(id)objc_opt_class() allocWithZone:a3];
  double timestamp = self->_timestamp;
  int64_t trackingState = self->_trackingState;
  double lightEstimate = self->_lightEstimate;
  BOOL majorRelocalization = self->_majorRelocalization;
  BOOL minorRelocalization = self->_minorRelocalization;
  long long v10 = *(_OWORD *)&self[1].super.isa;
  long long v11 = *(_OWORD *)&self[1]._timestamp;
  long long v12 = *(_OWORD *)&self[1]._lightEstimate;
  long long v13 = *(_OWORD *)&self[2].super.isa;

  return [v4 initWithTimestamp:trackingState majorRelocalization:minorRelocalization timestamp:timestamp lightEstimate:lightEstimate];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeDouble:@"timestamp" forKey:self->_timestamp];
  [v4 encodeMatrix4x4:@"devicePose" forKey:*(double *)&self[1].super.isa, self[1]._timestamp, self[1]._lightEstimate, *(double *)&self[2].super.isa];
  [v4 encodeInteger:self->_trackingState forKey:@"trackingState"];
  [v4 encodeDouble:@"lightEstimate" forKey:self->_lightEstimate];
  [v4 encodeBool:self->_majorRelocalization forKey:@"majorRelocalization"];
  [v4 encodeBool:self->_minorRelocalization forKey:@"minorRelocalization"];
}

- (NIVisionInput)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)NIVisionInput;
  v5 = [(NIVisionInput *)&v14 init];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"timestamp"];
    v5->_double timestamp = v6;
    [v4 decodeMatrix4x4ForKey:@"devicePose"];
    *(_OWORD *)&v5[1].super.isa = v7;
    *(_OWORD *)&v5[1]._double timestamp = v8;
    *(_OWORD *)&v5[1]._double lightEstimate = v9;
    *(_OWORD *)&v5[2].super.isa = v10;
    v5->_int64_t trackingState = (int64_t)[v4 decodeIntegerForKey:@"trackingState"];
    [v4 decodeDoubleForKey:@"lightEstimate"];
    v5->_double lightEstimate = v11;
    v5->_BOOL majorRelocalization = [v4 decodeBoolForKey:@"majorRelocalization"];
    v5->_BOOL minorRelocalization = [v4 decodeBoolForKey:@"minorRelocalization"];
    long long v12 = v5;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = (NIVisionInput *)v4;
    double v6 = v5;
    if (v5 == self)
    {
      BOOL v23 = 1;
    }
    else
    {
      double timestamp = self->_timestamp;
      [(NIVisionInput *)v5 timestamp];
      double v9 = v8;
      float32x4_t v30 = *(float32x4_t *)&self[1]._timestamp;
      float32x4_t v31 = *(float32x4_t *)&self[1].super.isa;
      float32x4_t v32 = *(float32x4_t *)&self[2].super.isa;
      float32x4_t v33 = *(float32x4_t *)&self[1]._lightEstimate;
      [(NIVisionInput *)v6 devicePose];
      float32x4_t v26 = v11;
      float32x4_t v27 = v10;
      float32x4_t v28 = v13;
      float32x4_t v29 = v12;
      int64_t trackingState = self->_trackingState;
      id v15 = [(NIVisionInput *)v6 trackingState];
      double lightEstimate = self->_lightEstimate;
      [(NIVisionInput *)v6 lightEstimate];
      double v18 = v17;
      int majorRelocalization = self->_majorRelocalization;
      unsigned int v20 = [(NIVisionInput *)v6 majorRelocalization];
      int minorRelocalization = self->_minorRelocalization;
      unsigned int v22 = [(NIVisionInput *)v6 minorRelocalization];
      BOOL v23 = 0;
      if (timestamp == v9
        && (vminvq_u32((uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(v31, v27), (int8x16_t)vceqq_f32(v30, v26)), vandq_s8((int8x16_t)vceqq_f32(v33, v29), (int8x16_t)vceqq_f32(v32, v28)))) & 0x80000000) != 0&& (id)trackingState == v15&& lightEstimate == v18)
      {
        BOOL v23 = majorRelocalization == v20 && minorRelocalization == v22;
      }
    }
  }
  else
  {
    BOOL v23 = 0;
  }

  return v23;
}

- (unint64_t)hash
{
  id v15 = +[NSData dataWithBytes:&self[1] length:64];
  unint64_t v14 = (unint64_t)[v15 hash];
  v3 = +[NSNumber numberWithDouble:self->_timestamp];
  unint64_t v4 = (unint64_t)[v3 hash];
  v5 = +[NSNumber numberWithInteger:self->_trackingState];
  unint64_t v6 = (unint64_t)[v5 hash];
  long long v7 = +[NSNumber numberWithDouble:self->_lightEstimate];
  unint64_t v8 = (unint64_t)[v7 hash];
  double v9 = +[NSNumber numberWithBool:self->_majorRelocalization];
  unint64_t v10 = (unint64_t)[v9 hash];
  float32x4_t v11 = +[NSNumber numberWithBool:self->_minorRelocalization];
  unint64_t v12 = v4 ^ v14 ^ v6 ^ v8 ^ v10 ^ (unint64_t)[v11 hash];

  return v12;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (double)devicePose
{
  objc_copyStruct(&v2, (const void *)(a1 + 48), 64, 1, 0);
  return *(double *)&v2;
}

- (int64_t)trackingState
{
  return self->_trackingState;
}

- (double)lightEstimate
{
  return self->_lightEstimate;
}

- (BOOL)majorRelocalization
{
  return self->_majorRelocalization;
}

- (BOOL)minorRelocalization
{
  return self->_minorRelocalization;
}

@end
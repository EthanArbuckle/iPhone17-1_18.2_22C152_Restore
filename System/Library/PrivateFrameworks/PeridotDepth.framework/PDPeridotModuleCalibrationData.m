@interface PDPeridotModuleCalibrationData
+ (BOOL)isBufferOfExpectedVersion:(id)a3;
- (PDPeridotModuleCalibrationData)initWithCalibrationDictionary:(id)a3;
- (PDPeridotModuleCalibrationData)initWithPeridotCalib:(id)a3;
- (_PeridotCalib)calib;
- (double)setOperationalWideToPeridotTransform:(int8x16_t)a3;
- (float32x2_t)operationalWideToPeridotTransform;
- (id)binaryRepresentation;
@end

@implementation PDPeridotModuleCalibrationData

- (PDPeridotModuleCalibrationData)initWithPeridotCalib:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PDPeridotModuleCalibrationData;
  v5 = [(PDPeridotModuleCalibrationData *)&v9 init];
  if (v5
    && (id v6 = v4,
        (readPeridotCalibFromBuffer((char *)[v6 bytes], objc_msgSend(v6, "length"), &v5->_peridotCalib) & 1) == 0))
  {
    NSLog(&cfstr_FailedToInitia_0.isa);
    v7 = 0;
  }
  else
  {
    v7 = v5;
  }

  return v7;
}

- (_PeridotCalib)calib
{
  return &self->_peridotCalib;
}

- (id)binaryRepresentation
{
  return (id)[MEMORY[0x263EFF8F8] dataWithBytes:&self->_peridotCalib length:402528];
}

- (double)setOperationalWideToPeridotTransform:(int8x16_t)a3
{
  float32x2_t v5 = (float32x2_t)vext_s8((int8x8_t)a5.n128_u64[0], (int8x8_t)*(_OWORD *)&vextq_s8(a2, a2, 8uLL), 4uLL);
  a5.n128_u32[1] = a2.u32[1];
  *(double *)(a1 + 402256) = *(float *)a2.i32;
  *(double *)(a1 + 402264) = *(float *)a3.i32;
  *(double *)(a1 + 402272) = *(float *)a4.i32;
  *(float64x2_t *)(a1 + 402280) = vcvtq_f64_f32((float32x2_t)a5.n128_u64[0]);
  *(float64x2_t *)(a1 + 402296) = vcvtq_f64_f32((float32x2_t)vzip2_s32(*(int32x2_t *)a3.i8, *(int32x2_t *)a4.i8));
  *(float64x2_t *)(a1 + 402312) = vcvtq_f64_f32(v5);
  double result = a5.n128_f32[2];
  *(float64x2_t *)(a1 + 402328) = vcvtq_f64_f32((float32x2_t)vzip1_s32((int32x2_t)*(_OWORD *)&vextq_s8(a3, a3, 8uLL), (int32x2_t)*(_OWORD *)&vextq_s8(a4, a4, 8uLL)));
  *(double *)(a1 + 402344) = a5.n128_f32[2];
  return result;
}

- (float32x2_t)operationalWideToPeridotTransform
{
  float64x2_t v1 = a1[25141];
  v1.f64[1] = a1[25143].f64[0];
  return vcvt_f32_f64(v1);
}

- (PDPeridotModuleCalibrationData)initWithCalibrationDictionary:(id)a3
{
  id v4 = (peridot::CalibManager *)a3;
  v10.receiver = self;
  v10.super_class = (Class)PDPeridotModuleCalibrationData;
  float32x2_t v5 = [(PDPeridotModuleCalibrationData *)&v10 init];
  v7 = v5;
  if (v5 && (peridot::CalibManager::fillPeridotCalib(v4, &v5->_peridotCalib, v6) & 1) == 0)
  {
    NSLog(&cfstr_FailedToInitia_1.isa);
    v8 = 0;
  }
  else
  {
    v8 = v7;
  }

  return v8;
}

+ (BOOL)isBufferOfExpectedVersion:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 length] == 402528 && *(_DWORD *)objc_msgSend(v3, "bytes") == 9;

  return v4;
}

@end
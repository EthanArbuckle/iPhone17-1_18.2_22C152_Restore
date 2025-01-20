@interface DeepFusionCommon
+ (BOOL)fillRawNoiseModelParameters:(DeepFusionRawNoiseModelParameters *)a3 exposureParams:(const exposureParameters *)a4;
+ (float)calculateReadNoise:(const exposureParameters *)a3;
+ (float)getLumaPedestalWithProperties:(const exposureParameters *)a3 plistSource:(id)a4;
+ (int)intermediateVersion;
+ (int)networkVersion;
@end

@implementation DeepFusionCommon

+ (float)calculateReadNoise:(const exposureParameters *)a3
{
  float v3 = a3->read_noise_1x * a3->read_noise_1x;
  float v4 = sqrtf((float)(v3 - (float)(a3->read_noise_8x * a3->read_noise_8x)) / 0.98438);
  float v5 = sqrtf(v3 - (float)(v4 * v4));
  return a3->analog_gain
       * sqrtf((float)((float)(v4 / a3->analog_gain) * (float)(v4 / a3->analog_gain)) + (float)(v5 * v5));
}

+ (BOOL)fillRawNoiseModelParameters:(DeepFusionRawNoiseModelParameters *)a3 exposureParams:(const exposureParameters *)a4
{
  if (a3) {
    BOOL v4 = a4 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  BOOL v5 = !v4;
  if (!v4)
  {
    *(float *)&uint64_t v8 = a4->red_combo_gain;
    HIDWORD(v8) = 1.0;
    LODWORD(a3->var2) = *(void *)&a3->var2;
    *(void *)&a3->var0 = v8;
    a3->var2 = a4->blue_combo_gain;
    *(void *)&a3->var0 = v8;
    *(float *)&a3->var4 = a4->analog_gain;
    objc_msgSend_calculateReadNoise_(DeepFusionCommon, a2, (uint64_t)a4, (uint64_t)a4);
    a3->var5 = v9;
    *(void *)&a3[1].var0 = *(void *)&a4->conversion_gain;
    LOBYTE(a3[1].var2) = 0;
    a3[1].var3 = a4->lsModulationWeight;
    if (a4->hr_enabled)
    {
      p_hr_gain_down_ratio = &a4->hr_gain_down_ratio;
      float32x4_t v11 = vld1q_dup_f32(p_hr_gain_down_ratio);
      *(float32x4_t *)&a3->var0 = vdivq_f32(*(float32x4_t *)&a3->var0, v11);
    }
  }
  return v5;
}

+ (float)getLumaPedestalWithProperties:(const exposureParameters *)a3 plistSource:(id)a4
{
  return sub_262FCDA18((uint64_t)a4, a3->gain) / 1023.0;
}

+ (int)networkVersion
{
  v2 = (void *)FigCaptureCFCreatePropertyList();
  BOOL v5 = objc_msgSend_objectForKeyedSubscript_(v2, v3, @"TuningParameters", v4);
  uint64_t v8 = objc_msgSend_objectForKeyedSubscript_(v5, v6, @"Common", v7);
  float32x4_t v11 = objc_msgSend_objectForKeyedSubscript_(v8, v9, @"DeepFusion", v10);
  v14 = objc_msgSend_objectForKeyedSubscript_(v11, v12, @"Version", v13);
  v18 = v14;
  if (v14) {
    objc_msgSend_intValue(v14, v15, v16, v17);
  }
  int CFPreferenceNumberWithDefault = FigGetCFPreferenceNumberWithDefault();

  return CFPreferenceNumberWithDefault;
}

+ (int)intermediateVersion
{
  return objc_msgSend_networkVersion(DeepFusionCommon, a2, v2, v3);
}

@end
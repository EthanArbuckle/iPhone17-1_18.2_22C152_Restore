@interface tm3dbc69b64cd52a6445a78f9a4745ca65
- (void)updateAllThermalLoad:(BOOL)a3;
@end

@implementation tm3dbc69b64cd52a6445a78f9a4745ca65

- (void)updateAllThermalLoad:(BOOL)a3
{
  [+[SensorDispatcherHelper sharedInstance] getFloatValueFromSMCForKey:@"Te3z"];
  unsigned int v27 = v3;
  [+[SensorDispatcherHelper sharedInstance] getFloatValueFromSMCForKey:@"Ts5z"];
  unsigned int v25 = v4;
  [+[SensorDispatcherHelper sharedInstance] getFloatValueFromSMCForKey:@"Ta1z"];
  unsigned int v26 = v5;
  [+[SensorDispatcherHelper sharedInstance] getFloatValueFromSMCForKey:@"Tp2z"];
  unsigned int v24 = v6;
  [+[SensorDispatcherHelper sharedInstance] getFloatValueFromSMCForKey:@"Tp3z"];
  unsigned int v23 = v7;
  [+[SensorDispatcherHelper sharedInstance] getFloatValueFromSMCForKey:@"Tp4z"];
  unsigned int v22 = v8;
  [+[SensorDispatcherHelper sharedInstance] getFloatValueFromSMCForKey:@"Tp5z"];
  int v10 = (int)(float)(v9 * 100.0);
  [+[SensorDispatcherHelper sharedInstance] getFloatValueFromSMCForKey:@"Tp7z"];
  unsigned int v21 = v11;
  [+[SensorDispatcherHelper sharedInstance] getFloatValueFromSMCForKey:@"Tp8z"];
  unsigned int v20 = v12;
  [+[SensorDispatcherHelper sharedInstance] getFloatValueFromSMCForKey:@"Tp9z"];
  unsigned int v19 = v13;
  [+[SensorDispatcherHelper sharedInstance] getFloatValueFromSMCForKey:@"tGAM"];
  float32x4_t v15 = (float32x4_t)vdupq_n_s32(0x42C80000u);
  qword_1000AACCC = (uint64_t)vmax_s32((int32x2_t)qword_1000AACCC, vcvt_s32_f32(vmul_f32((float32x2_t)__PAIR64__(v25, v27), *(float32x2_t *)v15.f32)));
  qword_1000AACD4 = (uint64_t)vmax_s32((int32x2_t)qword_1000AACD4, vcvt_s32_f32(vmul_f32((float32x2_t)__PAIR64__(v24, v26), *(float32x2_t *)v15.f32)));
  qword_1000AACDC = (uint64_t)vmax_s32((int32x2_t)qword_1000AACDC, vcvt_s32_f32(vmul_f32((float32x2_t)__PAIR64__(v22, v23), *(float32x2_t *)v15.f32)));
  int v16 = dword_1000AACE4;
  if (dword_1000AACE4 <= v10) {
    int v16 = v10;
  }
  v17.i64[0] = __PAIR64__(v20, v21);
  v17.i64[1] = __PAIR64__(v14, v19);
  dword_1000AACE4 = v16;
  *(int32x4_t *)&dword_1000AACE8 = vmaxq_s32(*(int32x4_t *)&dword_1000AACE8, vcvtq_s32_f32(vmulq_f32(v17, v15)));
  v18 = (void *)qword_1000AB158;

  [v18 setPackageLowPowerTarget];
}

@end
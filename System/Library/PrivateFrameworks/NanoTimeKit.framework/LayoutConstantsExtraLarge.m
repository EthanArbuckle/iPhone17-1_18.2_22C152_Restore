@interface LayoutConstantsExtraLarge
@end

@implementation LayoutConstantsExtraLarge

void ___LayoutConstantsExtraLarge_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  _LayoutConstantsModularSmall(v2, (uint64_t)v9);
  _LayoutConstantsExtraLarge___constants = v9[0];
  *(_OWORD *)&qword_1E9FA6CA0 = v9[1];
  qword_1E9FA6CB0 = v10;
  CLKRoundForDevice();
  *(void *)&_LayoutConstantsExtraLarge___constants = v3;
  CLKRoundForDevice();
  qword_1E9FA6CA8 = v4;
  CLKRoundForDevice();
  qword_1E9FA6CA0 = v5;
  CLKRoundForDevice();
  *((void *)&_LayoutConstantsExtraLarge___constants + 1) = v6;
  CLKRoundForDevice();
  uint64_t v8 = v7;

  qword_1E9FA6CB0 = v8;
}

void ___LayoutConstantsExtraLarge_block_invoke_0(uint64_t a1, uint64_t a2)
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F19A40] metricsWithDevice:a2 identitySizeClass:2];
  [v2 setRoundingBehavior:3];
  [v2 scaledValue:3 withOverride:8.0 forSizeClass:10.5];
  _LayoutConstantsExtraLarge___constants_0 = v3;
  v11[0] = &unk_1F16E1188;
  v11[1] = &unk_1F16E11A0;
  v12[0] = &unk_1F16E71A0;
  v12[1] = &unk_1F16E71B0;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  [v2 scaledValue:v4 withOverrides:7.0];
  _LayoutConstantsExtraLarge___constants_1 = v5;

  v9[0] = &unk_1F16E1188;
  v9[1] = &unk_1F16E11A0;
  v10[0] = &unk_1F16E71C0;
  v10[1] = &unk_1F16E71D0;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  [v2 scaledValue:v6 withOverrides:105.0];
  _LayoutConstantsExtraLarge___constants_2 = v7;

  [v2 scaledValue:3 withOverride:1.75 forSizeClass:2.25];
  _LayoutConstantsExtraLarge___constants_3 = v8;
}

void ___LayoutConstantsExtraLarge_block_invoke_1(uint64_t a1, void *a2)
{
  id v2 = a2;
  _LayoutConstantsModularSmall_0(v2, v8);
  _LayoutConstantsExtraLarge___constants_0 = v8[0];
  *(_OWORD *)&qword_1E9FA83B0 = v8[1];
  xmmword_1E9FA83C0 = v8[2];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = ___LayoutConstantsExtraLarge_block_invoke_2;
  aBlock[3] = &unk_1E62C5C80;
  id v7 = v2;
  id v3 = v2;
  uint64_t v4 = (double (**)(void, double, double))_Block_copy(aBlock);
  [v3 screenBounds];
  double Width = CGRectGetWidth(v9);
  *(void *)&_LayoutConstantsExtraLarge___constants_0 = v4[2](v4, Width, *(double *)&_LayoutConstantsExtraLarge___constants_0);
  *((void *)&_LayoutConstantsExtraLarge___constants_0 + 1) = v4[2](v4, Width, *((double *)&_LayoutConstantsExtraLarge___constants_0+ 1));
  qword_1E9FA83B0 = v4[2](v4, Width, *(double *)&qword_1E9FA83B0);
  qword_1E9FA83B8 = v4[2](v4, Width, *(double *)&qword_1E9FA83B8);
  *(void *)&xmmword_1E9FA83C0 = v4[2](v4, Width, *(double *)&xmmword_1E9FA83C0);
  *((void *)&xmmword_1E9FA83C0 + 1) = v4[2](v4, Width, *((double *)&xmmword_1E9FA83C0 + 1));
}

uint64_t ___LayoutConstantsExtraLarge_block_invoke_2()
{
  return CLKRoundForDevice();
}

float64x2_t ___LayoutConstantsExtraLarge_block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  CLKComplicationGraphicExtraLargeCircularScalingFactor();
  double v5 = v3;
  _LayoutConstantsCircular(v2, v6);

  _LayoutConstantsExtraLarge___constantsGraphicExtraLarge = (__int128)vmulq_n_f64(v6[0], v5);
  *(float64x2_t *)algn_1E9FA8690 = vmulq_n_f64(v6[1], v5);
  xmmword_1E9FA86A0 = (__int128)vmulq_n_f64(v6[2], v5);
  xmmword_1E9FA86B0 = (__int128)vmulq_n_f64(v6[3], v5);
  float64x2_t result = vmulq_n_f64(v6[4], v5);
  xmmword_1E9FA86C0 = (__int128)result;
  return result;
}

float64x2_t ___LayoutConstantsExtraLarge_block_invoke_4(uint64_t a1, void *a2)
{
  _LayoutConstantsModularSmall_1(a2, v9);
  _LayoutConstantsExtraLarge_constants = v9[0];
  *(double *)&_LayoutConstantsExtraLarge_constants = *(double *)v9 * 3.0;
  __asm { FMOV            V0.2D, #3.0 }
  float64x2_t v7 = vmulq_f64((float64x2_t)v9[1], _Q0);
  float64x2_t result = vmulq_f64((float64x2_t)v9[2], _Q0);
  xmmword_1E9FA8778 = (__int128)v7;
  xmmword_1E9FA8788 = (__int128)result;
  return result;
}

float64x2_t ___LayoutConstantsExtraLarge_block_invoke_5(uint64_t a1, void *a2)
{
  _LayoutConstantsModularSmall_2(a2, v8);
  __asm { FMOV            V0.2D, #3.0 }
  _LayoutConstantsExtraLarge_constants_0 = (__int128)vmulq_f64(v8[0], _Q0);
  *(float64x2_t *)algn_1E9FA9C70 = vmulq_f64(v8[1], _Q0);
  xmmword_1E9FA9C80 = (__int128)vmulq_f64(v8[2], _Q0);
  xmmword_1E9FA9C90 = (__int128)vmulq_f64(v8[3], _Q0);
  float64x2_t result = vmulq_f64(v8[4], _Q0);
  xmmword_1E9FA9CA0 = (__int128)result;
  return result;
}

@end
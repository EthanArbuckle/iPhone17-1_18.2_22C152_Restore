@interface LayoutConstants
@end

@implementation LayoutConstants

void ___LayoutConstants_block_invoke(uint64_t a1, void *a2)
{
  v16[2] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFD188];
  id v3 = a2;
  v4 = [v2 metricsWithDevice:v3 identitySizeClass:2];
  [v3 screenScale];
  [v4 scaledValue:18.0 / v5];
  _LayoutConstants_constants_0 = v6;
  [v3 screenScale];
  [v4 scaledValue:15.0 / v7];
  _LayoutConstants_constants_1 = v8;
  [v3 screenScale];
  [v4 scaledValue:18.0 / v9];
  _LayoutConstants_constants_2 = v10;
  [v3 screenScale];
  double v12 = v11;

  v15[0] = &unk_26EEA81F8;
  v15[1] = &unk_26EEA8228;
  v16[0] = &unk_26EEA8210;
  v16[1] = &unk_26EEA8210;
  v13 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];
  [v4 constantValue:v13 withOverrides:4.0 / v12];
  _LayoutConstants_constants_3 = v14;
}

void ___LayoutConstants_block_invoke_0(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x263EFD188];
  id v3 = a2;
  id v9 = [v2 metricsWithDevice:v3 identitySizeClass:2];
  [v3 screenScale];
  [v9 scaledValue:18.0 / v4];
  _LayoutConstants_constants_0_0 = v5;
  [v3 screenScale];
  double v7 = v6;

  [v9 scaledValue:30.0 / v7];
  _LayoutConstants_constants_1_0 = v8;
}

void ___LayoutConstants_block_invoke_1(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x263EFD188];
  id v3 = a2;
  id v9 = [v2 metricsWithDevice:v3 identitySizeClass:2];
  [v3 screenScale];
  [v9 scaledValue:18.0 / v4];
  _LayoutConstants_constants_0_1 = v5;
  [v3 screenScale];
  double v7 = v6;

  [v9 scaledValue:26.0 / v7];
  _LayoutConstants_constants_1_1 = v8;
}

void ___LayoutConstants_block_invoke_2(uint64_t a1, void *a2)
{
  v23[2] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFD188];
  id v3 = a2;
  double v4 = [v2 metricsWithDevice:v3 identitySizeClass:2];
  [v3 screenScale];
  [v4 scaledValue:18.0 / v5];
  _LayoutConstants_constants = v6;
  [v3 screenScale];
  [v4 scaledValue:26.0 / v7];
  qword_268A6EE98 = v8;
  [v3 screenScale];
  v22[0] = &unk_26EEA8378;
  v22[1] = &unk_26EEA83A8;
  v23[0] = &unk_26EEA8390;
  v23[1] = &unk_26EEA8390;
  double v10 = 4.0 / v9;
  double v11 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:2];
  [v4 constantValue:v11 withOverrides:v10];
  qword_268A6EEA0 = v12;

  [v3 screenScale];
  v20[0] = &unk_26EEA8378;
  v20[1] = &unk_26EEA83A8;
  v21[0] = &unk_26EEA8390;
  v21[1] = &unk_26EEA8390;
  double v14 = -4.0 / v13;
  v15 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];
  [v4 constantValue:v15 withOverrides:v14];
  qword_268A6EEA8 = v16;

  [v3 screenScale];
  double v18 = v17;

  [v4 scaledValue:20.0 / v18];
  qword_268A6EEB0 = v19;
}

void ___LayoutConstants_block_invoke_3(uint64_t a1, void *a2)
{
  v19[2] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFD188];
  id v3 = a2;
  double v4 = [v2 metricsWithDevice:v3 identitySizeClass:2];
  [v3 screenScale];
  [v4 scaledValue:18.0 / v5];
  *(void *)&_LayoutConstants___constantsGraphicCircular = v6;
  [v3 screenScale];
  [v4 scaledValue:36.0 / v7];
  *((void *)&_LayoutConstants___constantsGraphicCircular + 1) = v8;
  [v3 screenScale];
  [v4 scaledValue:30.0 / v9];
  qword_268A6EF20 = v10;
  [v3 screenScale];
  v18[0] = &unk_26EEA83C0;
  v18[1] = &unk_26EEA83F0;
  v19[0] = &unk_26EEA83D8;
  v19[1] = &unk_26EEA83D8;
  double v12 = 14.0 / v11;
  double v13 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];
  [v4 constantValue:v13 withOverrides:v12];
  qword_268A6EF28 = v14;

  [v3 screenScale];
  [v4 scaledValue:18.0 / v15];
  qword_268A6EF30 = v16;
  _LayoutConstants___constantsGraphicExtraLarge = _LayoutConstants___constantsGraphicCircular;
  *(_OWORD *)algn_268A6EF50 = *(_OWORD *)&qword_268A6EF20;
  qword_268A6EF60 = v16;
  double v17 = NWCExtraLargeScalingFactor(v3);

  _LayoutConstants___constantsGraphicExtraLarge = (__int128)vmulq_n_f64((float64x2_t)_LayoutConstants___constantsGraphicExtraLarge, v17);
  *(float64x2_t *)algn_268A6EF50 = vmulq_n_f64(*(float64x2_t *)algn_268A6EF50, v17);
  *(double *)&qword_268A6EF60 = v17 * *(double *)&qword_268A6EF60;
}

void ___LayoutConstants_block_invoke_4(uint64_t a1, void *a2)
{
  v24[2] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFD188];
  id v3 = a2;
  double v4 = [v2 metricsWithDevice:v3 identitySizeClass:2];
  [v3 screenScale];
  [v4 scaledValue:18.0 / v5];
  _LayoutConstants_constants_0_2 = v6;
  [v3 screenScale];
  v23[0] = &unk_26EEA8408;
  v23[1] = &unk_26EEA8438;
  v24[0] = &unk_26EEA8420;
  v24[1] = &unk_26EEA8420;
  double v8 = 4.0 / v7;
  double v9 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];
  [v4 constantValue:v9 withOverrides:v8];
  _LayoutConstants_constants_1_2 = v10;

  [v3 screenScale];
  v21[0] = &unk_26EEA8408;
  v21[1] = &unk_26EEA8438;
  v22[0] = &unk_26EEA8420;
  v22[1] = &unk_26EEA8420;
  double v12 = 4.0 / v11;
  double v13 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];
  [v4 constantValue:v13 withOverrides:v12];
  _LayoutConstants_constants_2_0 = v14;

  [v3 screenScale];
  double v16 = v15;

  v19[0] = &unk_26EEA8408;
  v19[1] = &unk_26EEA8438;
  v20[0] = &unk_26EEA8420;
  v20[1] = &unk_26EEA8420;
  double v17 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];
  [v4 constantValue:v17 withOverrides:2.0 / v16];
  _LayoutConstants_constants_3_0 = v18;
}

@end
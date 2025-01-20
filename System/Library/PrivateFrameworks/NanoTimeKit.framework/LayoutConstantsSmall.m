@interface LayoutConstantsSmall
@end

@implementation LayoutConstantsSmall

void ___LayoutConstantsSmall_block_invoke(uint64_t a1, uint64_t a2)
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F19A40] metricsWithDevice:a2 identitySizeClass:2];
  [v2 setRoundingBehavior:3];
  v8[0] = &unk_1F16E1188;
  v8[1] = &unk_1F16E11A0;
  v9[0] = &unk_1F16E71E0;
  v9[1] = &unk_1F16E71F0;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];
  [v2 scaledValue:v3 withOverrides:2.5];
  _LayoutConstantsSmall___constants_0 = v4;

  [v2 scaledValue:3 withOverride:2.0 forSizeClass:2.5];
  _LayoutConstantsSmall___constants_1 = v5;
  [v2 scaledValue:0 withOverride:29.0 forSizeClass:26.0];
  _LayoutConstantsSmall___constants_2 = v6;
  [v2 scaledValue:3 withOverride:1.75 forSizeClass:2.25];
  _LayoutConstantsSmall___constants_3 = v7;
}

void ___LayoutConstantsSmall_block_invoke_0(uint64_t a1, uint64_t a2)
{
  v43[2] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F19A40] metricsWithDevice:a2 identitySizeClass:2];
  [v2 scaledValue:3 withOverride:14.5 forSizeClass:16.5];
  qword_1E9FA9B00 = v3;
  v42[0] = &unk_1F16E3F78;
  v42[1] = &unk_1F16E3F90;
  v43[0] = &unk_1F16E80C0;
  v43[1] = &unk_1F16E80D0;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:v42 count:2];
  [v2 scaledValue:v4 withOverrides:23.0];
  *(void *)&xmmword_1E9FA9B08 = v5;

  v40[0] = &unk_1F16E3F78;
  v40[1] = &unk_1F16E3F90;
  v41[0] = &unk_1F16E80D0;
  v41[1] = &unk_1F16E80E0;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:2];
  [v2 scaledValue:v6 withOverrides:32.0];
  *((void *)&xmmword_1E9FA9B08 + 1) = v7;

  [v2 scaledValue:0 withOverride:2.5 forSizeClass:2.0];
  qword_1E9FA9B18 = v8;
  [v2 scaledValue:3 withOverride:22.0 forSizeClass:23.0];
  qword_1E9FA9B20 = v9;
  v38[0] = &unk_1F16E3F78;
  v38[1] = &unk_1F16E3F90;
  v39[0] = &unk_1F16E80F0;
  v39[1] = &unk_1F16E8100;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:2];
  [v2 scaledValue:v10 withOverrides:10.0];
  *(void *)&xmmword_1E9FA9B28 = v11;

  v36[0] = &unk_1F16E3F78;
  v36[1] = &unk_1F16E3F90;
  v37[0] = &unk_1F16E8050;
  v37[1] = &unk_1F16E8110;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:2];
  [v2 scaledValue:v12 withOverrides:29.0];
  *((void *)&xmmword_1E9FA9B28 + 1) = v13;

  v34[0] = &unk_1F16E3F78;
  v34[1] = &unk_1F16E3F90;
  v35[0] = &unk_1F16E8070;
  v35[1] = &unk_1F16E8080;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:2];
  [v2 scaledValue:v14 withOverrides:28.0];
  qword_1E9FA9B38 = v15;

  [v2 scaledValue:0 withOverride:23.0 forSizeClass:20.0];
  qword_1E9FA9B40 = v16;
  [v2 scaledValue:0 withOverride:21.5 forSizeClass:19.0];
  *(void *)&_LayoutConstantsSmall___smallConstants = v17;
  v32[0] = &unk_1F16E3F78;
  v32[1] = &unk_1F16E3F90;
  v33[0] = &unk_1F16E8120;
  v33[1] = &unk_1F16E8130;
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:2];
  [v2 scaledValue:v18 withOverrides:20.5];
  *((void *)&_LayoutConstantsSmall___smallConstants + 1) = v19;

  [v2 scaledValue:0 withOverride:19.0 forSizeClass:16.5];
  qword_1E9FA9AF8 = v20;
  __asm { FMOV            V0.2D, #-7.0 }
  xmmword_1E9FA9B48 = _Q0;
  unk_1E9FA9B58 = _Q0;
  v30[0] = &unk_1F16E3F78;
  v30[1] = &unk_1F16E3F90;
  v31[0] = &unk_1F16E8140;
  v31[1] = &unk_1F16E8090;
  v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:2];
  [v2 scaledValue:v26 withOverrides:17.0];
  *(void *)&xmmword_1E9FA9B68 = v27;

  [v2 scaledValue:0 withOverride:13.0 forSizeClass:11.0];
  *((void *)&xmmword_1E9FA9B68 + 1) = v28;
  [v2 scaledValue:0 withOverride:9.0 forSizeClass:8.5];
  qword_1E9FA9B78 = v29;
}

@end
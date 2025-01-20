@interface LayoutConstantsMedium
@end

@implementation LayoutConstantsMedium

void ___LayoutConstantsMedium_block_invoke(uint64_t a1, void *a2)
{
  v41[2] = *MEMORY[0x1E4F143B8];
  uint64_t v29 = 0;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v26 = 0u;
  memset(v25, 0, sizeof(v25));
  long long v23 = 0u;
  long long v24 = 0u;
  long long v22 = 0u;
  id v2 = a2;
  _LayoutConstantsSmall(v2, (uint64_t)&v22);
  v3 = objc_msgSend(MEMORY[0x1E4F19A40], "metricsWithDevice:identitySizeClass:", v2, 2, v22, v23, v24, *(void *)&v25[0]);
  v40[0] = &unk_1F16E3F78;
  v40[1] = &unk_1F16E3F90;
  v41[0] = &unk_1F16E8010;
  v41[1] = &unk_1F16E8020;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:2];
  [v3 scaledValue:v4 withOverrides:19.0];
  qword_1E9FA9A50 = v5;

  [v3 scaledValue:0 withOverride:30.5 forSizeClass:26.5];
  *(void *)&xmmword_1E9FA9A58 = v6;
  double v7 = NTKCircularMediumComplicationDiameter(v2);

  *((double *)&xmmword_1E9FA9A58 + 1) = v7;
  [v3 scaledValue:3.0];
  qword_1E9FA9A68 = v8;
  unk_1E9FA9A70 = *(_OWORD *)((char *)v25 + 8);
  v38[0] = &unk_1F16E3F78;
  v38[1] = &unk_1F16E3F90;
  v39[0] = &unk_1F16E8030;
  v39[1] = &unk_1F16E8040;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:2];
  [v3 scaledValue:v9 withOverrides:38.0];
  *((void *)&xmmword_1E9FA9A78 + 1) = v10;

  [v3 scaledValue:0 withOverride:38.0 forSizeClass:32.0];
  qword_1E9FA9A88 = v11;
  v36[0] = &unk_1F16E3F78;
  v36[1] = &unk_1F16E3F90;
  v37[0] = &unk_1F16E8050;
  v37[1] = &unk_1F16E8060;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:2];
  [v3 scaledValue:v12 withOverrides:30.0];
  qword_1E9FA9A90 = v13;

  v34[0] = &unk_1F16E3F78;
  v34[1] = &unk_1F16E3F90;
  v35[0] = &unk_1F16E8070;
  v35[1] = &unk_1F16E8080;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:2];
  [v3 scaledValue:v14 withOverrides:27.5];
  *(void *)&_LayoutConstantsMedium___mediumConstants = v15;

  *((void *)&_LayoutConstantsMedium___mediumConstants + 1) = _LayoutConstantsMedium___mediumConstants;
  [v3 scaledValue:0 withOverride:26.0 forSizeClass:22.5];
  qword_1E9FA9A48 = v16;
  xmmword_1E9FA9A98 = v26;
  unk_1E9FA9AA8 = v27;
  v32[0] = &unk_1F16E3F78;
  v32[1] = &unk_1F16E3F90;
  v33[0] = &unk_1F16E8090;
  v33[1] = &unk_1F16E8070;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:2];
  [v3 scaledValue:v17 withOverrides:20.0];
  *(void *)&xmmword_1E9FA9AB8 = v18;

  v30[0] = &unk_1F16E3F78;
  v30[1] = &unk_1F16E3F90;
  v31[0] = &unk_1F16E80A0;
  v31[1] = &unk_1F16E80B0;
  v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:2];
  [v3 scaledValue:v19 withOverrides:15.0];
  *((void *)&xmmword_1E9FA9AB8 + 1) = v20;

  [v3 scaledValue:3 withOverride:11.5 forSizeClass:13.0];
  qword_1E9FA9AC8 = v21;
}

@end
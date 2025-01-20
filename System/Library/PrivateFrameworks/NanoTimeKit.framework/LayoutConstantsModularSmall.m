@interface LayoutConstantsModularSmall
@end

@implementation LayoutConstantsModularSmall

void ___LayoutConstantsModularSmall_block_invoke(uint64_t a1, uint64_t a2)
{
  id v7 = [MEMORY[0x1E4F19A40] metricsWithDevice:a2 identitySizeClass:2];
  [v7 scaledValue:0 withOverride:11.5 forSizeClass:10.5];
  *(void *)&_LayoutConstantsModularSmall___constants = v2;
  [v7 scaledValue:2.5];
  qword_1E9FA6CE8 = v3;
  objc_msgSend(v7, "scaledSize:", 28.0, 28.0);
  *((void *)&_LayoutConstantsModularSmall___constants + 1) = v4;
  unk_1E9FA6CE0 = v5;
  [v7 scaledValue:3 withOverride:21.0 forSizeClass:22.0];
  qword_1E9FA6CF0 = v6;
}

void ___LayoutConstantsModularSmall_block_invoke_0(uint64_t a1, uint64_t a2)
{
  v8[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F19A40] metricsWithDevice:a2 identitySizeClass:2];
  v7[0] = &unk_1F16E1CE0;
  v7[1] = &unk_1F16E1CF8;
  v8[0] = &unk_1F16E7AA0;
  v8[1] = &unk_1F16E7AB0;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];
  [v2 scaledValue:v3 withOverrides:36.0];
  *(void *)&_LayoutConstantsModularSmall___constants_0 = v4;

  [v2 scaledValue:0 withOverride:46.0 forSizeClass:39.5];
  *((void *)&_LayoutConstantsModularSmall___constants_0 + 1) = v5;
  [v2 scaledValue:0 withOverride:48.0 forSizeClass:42.0];
  qword_1E9FA83F8 = v6;
  unk_1E9FA8400 = v6;
  *(void *)&xmmword_1E9FA8408 = v6;
  *((void *)&xmmword_1E9FA8408 + 1) = v6;
}

void ___LayoutConstantsModularSmall_block_invoke_1(uint64_t a1, void *a2)
{
  v26[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E4F19A40];
  id v3 = a2;
  uint64_t v4 = [v2 metricsWithDevice:v3 identitySizeClass:2];
  uint64_t v5 = NTKClockFaceLocalizedString(@"DATE_ALLOW_ALTERNATE_FONT_READABILITY_SMALL_MODULAR", @"See note in strings file for this key");
  int v6 = [v5 BOOLValue];

  CLKValueForDeviceMetrics();
  uint64_t v8 = v7;

  *(void *)&_LayoutConstantsModularSmall_constants = v8;
  if (v6)
  {
    v25[0] = &unk_1F16E1E90;
    v25[1] = &unk_1F16E1EA8;
    v26[0] = &unk_1F16E7BA0;
    v26[1] = &unk_1F16E7BB0;
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:2];
    [v4 scaledValue:v9 withOverrides:13.0];
    *(void *)&_LayoutConstantsModularSmall_constants = v10;
  }
  v11 = (void *)MEMORY[0x1E4FB09D8];
  if (!v6) {
    v11 = (void *)MEMORY[0x1E4FB09D0];
  }
  *((void *)&_LayoutConstantsModularSmall_constants + 1) = *v11;
  v23[0] = &unk_1F16E1E90;
  v23[1] = &unk_1F16E1EC0;
  v24[0] = &unk_1F16E7BC0;
  v24[1] = &unk_1F16E7BD0;
  v23[2] = &unk_1F16E1EA8;
  v24[2] = &unk_1F16E7BE0;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:3];
  [v4 scaledValue:v12 withOverrides:19.5];
  qword_1E9FA87C8 = v13;

  [v4 scaledValue:3 withOverride:24.0 forSizeClass:25.0];
  qword_1E9FA87C0 = v14;
  v21[0] = &unk_1F16E1E90;
  v21[1] = &unk_1F16E1EC0;
  v22[0] = &unk_1F16E7BD0;
  v22[1] = &unk_1F16E7BF0;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
  [v4 scaledValue:v15 withOverrides:20.0];
  *(void *)&xmmword_1E9FA87D0 = v16;

  v19[0] = &unk_1F16E1E90;
  v19[1] = &unk_1F16E1EA8;
  v20[0] = &unk_1F16E7C00;
  v20[1] = &unk_1F16E7C10;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
  [v4 scaledValue:v17 withOverrides:50.0];
  *((void *)&xmmword_1E9FA87D0 + 1) = v18;
}

void ___LayoutConstantsModularSmall_block_invoke_2(uint64_t a1, uint64_t a2)
{
  v32[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F19A40] metricsWithDevice:a2 identitySizeClass:2];
  [v2 scaledValue:3 withOverride:16.5 forSizeClass:16.5];
  *(void *)&_LayoutConstantsModularSmall_constants_0 = v3;
  v31[0] = &unk_1F16E4020;
  v31[1] = &unk_1F16E4038;
  v32[0] = &unk_1F16E81D0;
  v32[1] = &unk_1F16E81E0;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:2];
  [v2 scaledValue:v4 withOverrides:10.5];
  *((void *)&_LayoutConstantsModularSmall_constants_0 + 1) = v5;

  qword_1E9FA9CD8 = 0x3FF0000000000000;
  v29[0] = &unk_1F16E4020;
  v29[1] = &unk_1F16E4038;
  v30[0] = &unk_1F16E81F0;
  v30[1] = &unk_1F16E8200;
  int v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:2];
  [v2 scaledValue:v6 withOverrides:12.0];
  qword_1E9FA9CE0 = v7;

  v27[0] = &unk_1F16E4020;
  v27[1] = &unk_1F16E4050;
  v28[0] = &unk_1F16E8210;
  v28[1] = &unk_1F16E8210;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:2];
  [v2 scaledValue:v8 withOverrides:4.0];
  *(void *)&xmmword_1E9FA9CE8 = v9;

  v25[0] = &unk_1F16E4020;
  v25[1] = &unk_1F16E4038;
  v26[0] = &unk_1F16E8220;
  v26[1] = &unk_1F16E8230;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:2];
  [v2 scaledValue:v10 withOverrides:5.0];
  *((void *)&xmmword_1E9FA9CE8 + 1) = v11;

  v23[0] = &unk_1F16E4020;
  v23[1] = &unk_1F16E4038;
  v24[0] = &unk_1F16E8240;
  v24[1] = &unk_1F16E8250;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];
  [v2 scaledValue:v12 withOverrides:31.0];
  qword_1E9FA9CF8 = v13;

  v21[0] = &unk_1F16E4020;
  v21[1] = &unk_1F16E4038;
  v22[0] = &unk_1F16E8260;
  v22[1] = &unk_1F16E8270;
  uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
  [v2 scaledValue:v14 withOverrides:50.0];
  qword_1E9FA9D00 = v15;

  v19[0] = &unk_1F16E4020;
  v19[1] = &unk_1F16E4038;
  v20[0] = &unk_1F16E8280;
  v20[1] = &unk_1F16E8240;
  uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
  [v2 scaledValue:v16 withOverrides:22.0];
  *(void *)&xmmword_1E9FA9D08 = v17;

  [v2 scaledValue:3 withOverride:17.0 forSizeClass:17.0];
  *((void *)&xmmword_1E9FA9D08 + 1) = v18;
}

@end
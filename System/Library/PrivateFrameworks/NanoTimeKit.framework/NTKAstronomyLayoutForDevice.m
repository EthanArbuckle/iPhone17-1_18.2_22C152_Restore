@interface NTKAstronomyLayoutForDevice
@end

@implementation NTKAstronomyLayoutForDevice

void ___NTKAstronomyLayoutForDevice_block_invoke(uint64_t a1, uint64_t a2)
{
  v25[2] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F19A40] metricsWithDevice:a2 identitySizeClass:3];
  v24[0] = &unk_1F16E4218;
  v24[1] = &unk_1F16E4230;
  v25[0] = &unk_1F16E82E0;
  v25[1] = &unk_1F16E82F0;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:2];
  [v2 constantValue:v3 withOverrides:0.0];
  *(float *)&double v4 = v4;
  _NTKAstronomyLayoutForDevice_constants = LODWORD(v4);

  v22[0] = &unk_1F16E4218;
  v22[1] = &unk_1F16E4248;
  v23[0] = &unk_1F16E8300;
  v23[1] = &unk_1F16E8310;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
  [v2 scaledValue:v5 withOverrides:16.0];
  *(float *)&double v6 = v6;
  dword_1E9FA9EA4 = LODWORD(v6);

  v20 = &unk_1F16E4260;
  v21 = &unk_1F16E82E0;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
  [v2 scaledValue:v7 withOverrides:13.0];
  *(float *)&double v8 = v8;
  dword_1E9FA9EB8 = LODWORD(v8);

  v18[0] = &unk_1F16E4218;
  v18[1] = &unk_1F16E4260;
  v19[0] = &unk_1F16E8320;
  v19[1] = &unk_1F16E8330;
  v18[2] = &unk_1F16E4278;
  v19[2] = &unk_1F16E8340;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:3];
  [v2 scaledValue:v9 withOverrides:8.0];
  *(float *)&double v10 = v10;
  dword_1E9FA9EA8 = LODWORD(v10);

  *(float *)&int v11 = *(float *)&dword_1E9FA9EA8 + *(float *)&dword_1E9FA9EB8 * 2.0;
  dword_1E9FA9EAC = v11;
  [v2 scaledValue:20.0];
  *(float *)&double v12 = v12;
  dword_1E9FA9EB0 = LODWORD(v12);
  [v2 scaledValue:16.0];
  *(float *)&double v13 = v13;
  dword_1E9FA9EB4 = LODWORD(v13);
  v16[0] = &unk_1F16E4218;
  v16[1] = &unk_1F16E4230;
  v17[0] = &unk_1F16E8350;
  v17[1] = &unk_1F16E8350;
  v16[2] = &unk_1F16E4248;
  v16[3] = &unk_1F16E4260;
  v17[2] = &unk_1F16E8360;
  v17[3] = &unk_1F16E8370;
  v16[4] = &unk_1F16E4278;
  v17[4] = &unk_1F16E8380;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:5];
  [v2 scaledValue:v14 withOverrides:6.0];
  qword_1E9FA9EC0 = v15;
}

@end
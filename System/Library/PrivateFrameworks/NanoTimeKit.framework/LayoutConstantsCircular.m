@interface LayoutConstantsCircular
@end

@implementation LayoutConstantsCircular

void ___LayoutConstantsCircular_block_invoke(uint64_t a1, uint64_t a2)
{
  v42[2] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F19A40] metricsWithDevice:a2 identitySizeClass:2];
  v41[0] = &unk_1F16E1DB8;
  v41[1] = &unk_1F16E1DD0;
  v42[0] = &unk_1F16E7B00;
  v42[1] = &unk_1F16E7B00;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:2];
  [v2 scaledValue:v3 withOverrides:9.0];
  *(void *)&_LayoutConstantsCircular___constantsGraphicCircular = v4;

  v39[0] = &unk_1F16E1DB8;
  v39[1] = &unk_1F16E1DD0;
  v40[0] = &unk_1F16E7B00;
  v40[1] = &unk_1F16E7B00;
  v39[2] = &unk_1F16E1DE8;
  v40[2] = &unk_1F16E7B10;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:3];
  [v2 scaledValue:v5 withOverrides:16.0];
  *((void *)&_LayoutConstantsCircular___constantsGraphicCircular + 1) = v6;

  v37[0] = &unk_1F16E1DB8;
  v37[1] = &unk_1F16E1DD0;
  v38[0] = &unk_1F16E7B00;
  v38[1] = &unk_1F16E7B00;
  v37[2] = &unk_1F16E1DE8;
  v38[2] = &unk_1F16E7B20;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:3];
  [v2 scaledValue:v7 withOverrides:32.0];
  qword_1E9FA8628 = v8;

  v35[0] = &unk_1F16E1DB8;
  v35[1] = &unk_1F16E1DD0;
  v36[0] = &unk_1F16E7B00;
  v36[1] = &unk_1F16E7B00;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:2];
  [v2 scaledValue:v9 withOverrides:8.0];
  qword_1E9FA8630 = v10;

  v33[0] = &unk_1F16E1DB8;
  v33[1] = &unk_1F16E1DD0;
  v34[0] = &unk_1F16E7B00;
  v34[1] = &unk_1F16E7B00;
  v33[2] = &unk_1F16E1DE8;
  v34[2] = &unk_1F16E7B30;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:3];
  [v2 scaledValue:v11 withOverrides:6.0];
  *(void *)&xmmword_1E9FA8638 = v12;

  v31[0] = &unk_1F16E1DB8;
  v31[1] = &unk_1F16E1DD0;
  v32[0] = &unk_1F16E7B00;
  v32[1] = &unk_1F16E7B00;
  v31[2] = &unk_1F16E1DE8;
  v32[2] = &unk_1F16E7B40;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:3];
  [v2 scaledValue:v13 withOverrides:40.0];
  *((void *)&xmmword_1E9FA8638 + 1) = v14;

  v29[0] = &unk_1F16E1DB8;
  v29[1] = &unk_1F16E1DD0;
  v30[0] = &unk_1F16E7B00;
  v30[1] = &unk_1F16E7B00;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:2];
  [v2 scaledValue:v15 withOverrides:1.0];
  qword_1E9FA8648 = v16;

  v27[0] = &unk_1F16E1DB8;
  v27[1] = &unk_1F16E1DD0;
  v28[0] = &unk_1F16E7B00;
  v28[1] = &unk_1F16E7B00;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:2];
  [v2 scaledValue:v17 withOverrides:4.0];
  qword_1E9FA8650 = v18;

  v25[0] = &unk_1F16E1DB8;
  v25[1] = &unk_1F16E1DD0;
  v26[0] = &unk_1F16E7B00;
  v26[1] = &unk_1F16E7B00;
  v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:2];
  [v2 scaledValue:v19 withOverrides:1.0];
  *(void *)&xmmword_1E9FA8658 = v20;

  v23[0] = &unk_1F16E1DB8;
  v23[1] = &unk_1F16E1DD0;
  v24[0] = &unk_1F16E7B00;
  v24[1] = &unk_1F16E7B00;
  v23[2] = &unk_1F16E1DE8;
  v24[2] = &unk_1F16E7B50;
  v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:3];
  [v2 scaledValue:v21 withOverrides:2.0];
  *((void *)&xmmword_1E9FA8658 + 1) = v22;
}

@end
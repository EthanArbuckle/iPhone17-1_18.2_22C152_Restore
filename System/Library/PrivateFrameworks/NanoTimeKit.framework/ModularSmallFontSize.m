@interface ModularSmallFontSize
@end

@implementation ModularSmallFontSize

void ___ModularSmallFontSize_block_invoke(uint64_t a1, uint64_t a2)
{
  v22[5] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F19A40] metricsWithDevice:a2 identitySizeClass:2];
  v3 = NSNumber;
  v19[0] = &unk_1F16E1CE0;
  v19[1] = &unk_1F16E1CF8;
  v20[0] = &unk_1F16E7A60;
  v20[1] = &unk_1F16E7A70;
  v21[0] = &unk_1F16E1C68;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
  [v2 scaledValue:v4 withOverrides:41.5];
  v5 = objc_msgSend(v3, "numberWithDouble:");
  v22[0] = v5;
  v21[1] = &unk_1F16E1C80;
  v6 = NSNumber;
  [v2 scaledValue:0 withOverride:33.0 forSizeClass:29.0];
  v7 = objc_msgSend(v6, "numberWithDouble:");
  v22[1] = v7;
  v21[2] = &unk_1F16E1C98;
  v8 = NSNumber;
  v17[0] = &unk_1F16E1CE0;
  v17[1] = &unk_1F16E1CF8;
  v18[0] = &unk_1F16E7A80;
  v18[1] = &unk_1F16E7A90;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
  [v2 scaledValue:v9 withOverrides:24.0];
  v10 = objc_msgSend(v8, "numberWithDouble:");
  v22[2] = v10;
  v21[3] = &unk_1F16E1CB0;
  v11 = NSNumber;
  [v2 scaledValue:0 withOverride:20.0 forSizeClass:17.0];
  v12 = objc_msgSend(v11, "numberWithDouble:");
  v22[3] = v12;
  v21[4] = &unk_1F16E1CC8;
  v13 = NSNumber;
  [v2 scaledValue:16.5];
  v14 = objc_msgSend(v13, "numberWithDouble:");
  v22[4] = v14;
  uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:5];
  v16 = (void *)_ModularSmallFontSize_sizes;
  _ModularSmallFontSize_sizes = v15;
}

@end
@interface FontForModularSmallDynamicSize
@end

@implementation FontForModularSmallDynamicSize

void ___FontForModularSmallDynamicSize_block_invoke(uint64_t a1, void *a2)
{
  v11[5] = *MEMORY[0x1E4F143B8];
  v10[0] = &unk_1F16E1C68;
  id v2 = a2;
  _ModularSmallFontSize(4, v2);
  v3 = ___FontForModularSmallDynamicSize_block_invoke_2();
  v11[0] = v3;
  v10[1] = &unk_1F16E1C80;
  _ModularSmallFontSize(3, v2);
  v4 = ___FontForModularSmallDynamicSize_block_invoke_2();
  v11[1] = v4;
  v10[2] = &unk_1F16E1C98;
  _ModularSmallFontSize(2, v2);
  v5 = ___FontForModularSmallDynamicSize_block_invoke_2();
  v11[2] = v5;
  v10[3] = &unk_1F16E1CB0;
  _ModularSmallFontSize(1, v2);
  v6 = ___FontForModularSmallDynamicSize_block_invoke_2();
  v11[3] = v6;
  v10[4] = &unk_1F16E1CC8;
  _ModularSmallFontSize(0, v2);

  v7 = ___FontForModularSmallDynamicSize_block_invoke_2();
  v11[4] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:5];
  v9 = (void *)_FontForModularSmallDynamicSize_fonts;
  _FontForModularSmallDynamicSize_fonts = v8;
}

id ___FontForModularSmallDynamicSize_block_invoke_2()
{
  v0 = objc_msgSend(MEMORY[0x1E4F19A50], "systemFontOfSize:weight:");
  v1 = [v0 CLKFontWithAlternativePunctuation];

  return v1;
}

@end
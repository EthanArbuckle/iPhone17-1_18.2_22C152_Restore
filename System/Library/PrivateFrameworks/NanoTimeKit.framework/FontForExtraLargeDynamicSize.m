@interface FontForExtraLargeDynamicSize
@end

@implementation FontForExtraLargeDynamicSize

void ___FontForExtraLargeDynamicSize_block_invoke(uint64_t a1, void *a2)
{
  v18[5] = *MEMORY[0x1E4F143B8];
  v17[0] = &unk_1F16E1C68;
  id v2 = a2;
  double v3 = _ModularSmallFontSize(4, v2);
  double v4 = *MEMORY[0x1E4FB09C8];
  v5 = ___FontForExtraLargeDynamicSize_block_invoke_2(v3, 3.5, *MEMORY[0x1E4FB09C8]);
  v18[0] = v5;
  v17[1] = &unk_1F16E1C80;
  double v6 = _ModularSmallFontSize(3, v2);
  v7 = ___FontForExtraLargeDynamicSize_block_invoke_2(v6, 3.5, v4);
  v18[1] = v7;
  v17[2] = &unk_1F16E1C98;
  double v8 = _ModularSmallFontSize(2, v2);
  double v9 = *MEMORY[0x1E4FB09D8];
  v10 = ___FontForExtraLargeDynamicSize_block_invoke_2(v8, 3.5, *MEMORY[0x1E4FB09D8]);
  v18[2] = v10;
  v17[3] = &unk_1F16E1CB0;
  double v11 = _ModularSmallFontSize(1, v2);
  v12 = ___FontForExtraLargeDynamicSize_block_invoke_2(v11, 3.5, v9);
  v18[3] = v12;
  v17[4] = &unk_1F16E1CC8;
  double v13 = _ModularSmallFontSize(0, v2);

  v14 = ___FontForExtraLargeDynamicSize_block_invoke_2(v13, 3.5, v9);
  v18[4] = v14;
  uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:5];
  v16 = (void *)_FontForExtraLargeDynamicSize_fonts;
  _FontForExtraLargeDynamicSize_fonts = v15;
}

id ___FontForExtraLargeDynamicSize_block_invoke_2(double a1, double a2, double a3)
{
  double v3 = [MEMORY[0x1E4F19A50] systemFontOfSize:a1 * a2 weight:a3];
  double v4 = [v3 CLKFontWithAlternativePunctuation];

  return v4;
}

@end
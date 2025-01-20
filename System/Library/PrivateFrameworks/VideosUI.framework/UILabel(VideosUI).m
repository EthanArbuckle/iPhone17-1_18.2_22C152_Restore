@interface UILabel(VideosUI)
- (double)vui_alignmentInsetsForExpectedWidth:()VideosUI;
- (double)vui_heightToBaseline;
- (double)vui_textSizeForSize:()VideosUI;
@end

@implementation UILabel(VideosUI)

- (double)vui_heightToBaseline
{
  v1 = [a1 font];
  [v1 lineHeight];
  double v3 = v2;
  [v1 descender];
  double v5 = v3 + v4;

  return v5;
}

- (double)vui_textSizeForSize:()VideosUI
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __41__UILabel_VideosUI__vui_textSizeForSize___block_invoke;
  aBlock[3] = &unk_1E6DF50D8;
  aBlock[4] = a1;
  v6 = _Block_copy(aBlock);
  objc_msgSend(a1, "tv_sizeThatFits:withSizeCalculation:", v6, a2, a3);
  double v8 = v7;

  return v8;
}

- (double)vui_alignmentInsetsForExpectedWidth:()VideosUI
{
  uint64_t v16 = 0;
  v17 = (double *)&v16;
  uint64_t v18 = 0x4010000000;
  v19 = &unk_1E3ADDC25;
  long long v2 = *(_OWORD *)(MEMORY[0x1E4FB2848] + 16);
  long long v20 = *MEMORY[0x1E4FB2848];
  long long v21 = v2;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  v15[3] = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __57__UILabel_VideosUI__vui_alignmentInsetsForExpectedWidth___block_invoke;
  aBlock[3] = &unk_1E6DF8960;
  aBlock[4] = v15;
  void aBlock[5] = &v16;
  double v3 = _Block_copy(aBlock);
  double v4 = [a1 attributedText];
  if ([v4 length])
  {
    uint64_t v5 = [v4 length];
    uint64_t v6 = *MEMORY[0x1E4FB06F8];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __57__UILabel_VideosUI__vui_alignmentInsetsForExpectedWidth___block_invoke_2;
    v12[3] = &unk_1E6DF8988;
    id v13 = v3;
    objc_msgSend(v4, "enumerateAttribute:inRange:options:usingBlock:", v6, 0, v5, 0, v12);
    double v7 = v13;
  }
  else
  {
    double v7 = [a1 _defaultAttributes];
    double v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4FB06F8]];
    (*((void (**)(void *, void *))v3 + 2))(v3, v8);
  }
  v9 = v17;
  double v10 = floor(v17[4]);
  v17[4] = v10;
  v9[6] = floor(v9[6]);

  _Block_object_dispose(v15, 8);
  _Block_object_dispose(&v16, 8);
  return v10;
}

@end
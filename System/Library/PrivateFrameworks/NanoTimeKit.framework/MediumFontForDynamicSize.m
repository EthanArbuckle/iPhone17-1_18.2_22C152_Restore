@interface MediumFontForDynamicSize
@end

@implementation MediumFontForDynamicSize

void ___MediumFontForDynamicSize_block_invoke(uint64_t a1, void *a2)
{
  v10[3] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = 0;
  memset(v7, 0, sizeof(v7));
  _LayoutConstantsMedium(a2, (uint64_t)v7);
  v9[0] = &unk_1F16E3FA8;
  v2 = _MakeFont(0);
  v10[0] = v2;
  v9[1] = &unk_1F16E3F30;
  v3 = _MakeFont(0);
  v10[1] = v3;
  v9[2] = &unk_1F16E3F48;
  v4 = _MakeFont(0);
  v10[2] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:3];
  v6 = (void *)_MediumFontForDynamicSize__standardFonts;
  _MediumFontForDynamicSize__standardFonts = v5;
}

@end
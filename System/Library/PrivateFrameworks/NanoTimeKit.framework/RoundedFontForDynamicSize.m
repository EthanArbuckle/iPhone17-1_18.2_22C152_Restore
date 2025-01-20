@interface RoundedFontForDynamicSize
@end

@implementation RoundedFontForDynamicSize

void ___RoundedFontForDynamicSize_block_invoke(uint64_t a1, void *a2)
{
  v12[3] = *MEMORY[0x1E4F143B8];
  uint64_t v10 = 0;
  memset(v9, 0, sizeof(v9));
  _LayoutConstantsSmall(a2, (uint64_t)v9);
  v2 = (void *)*MEMORY[0x1E4F19680];
  v11[0] = &unk_1F16E3FA8;
  id v3 = v2;
  v4 = _MakeFont((uint64_t)v3);
  v12[0] = v4;
  v11[1] = &unk_1F16E3F30;
  v5 = _MakeFont((uint64_t)v3);
  v12[1] = v5;
  v11[2] = &unk_1F16E3F48;
  v6 = _MakeFont((uint64_t)v3);
  v12[2] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
  v8 = (void *)_RoundedFontForDynamicSize__roundedFonts;
  _RoundedFontForDynamicSize__roundedFonts = v7;
}

@end
@interface UIFont
@end

@implementation UIFont

void __47__UIFont_VideosUI__uifontWeightFromFontWeight___block_invoke()
{
  v12[9] = *MEMORY[0x1E4F143B8];
  v11[0] = &unk_1F3F3C3E0;
  v0 = [MEMORY[0x1E4F28ED0] numberWithDouble:*MEMORY[0x1E4FB09F8]];
  v12[0] = v0;
  v11[1] = &unk_1F3F3C3F8;
  v1 = [MEMORY[0x1E4F28ED0] numberWithDouble:*MEMORY[0x1E4FB09E8]];
  v12[1] = v1;
  v11[2] = &unk_1F3F3C410;
  v2 = [MEMORY[0x1E4F28ED0] numberWithDouble:*MEMORY[0x1E4FB09C8]];
  v12[2] = v2;
  v11[3] = &unk_1F3F3C428;
  v3 = [MEMORY[0x1E4F28ED0] numberWithDouble:*MEMORY[0x1E4FB09D8]];
  v12[3] = v3;
  v11[4] = &unk_1F3F3C440;
  v4 = [MEMORY[0x1E4F28ED0] numberWithDouble:*MEMORY[0x1E4FB09D0]];
  v12[4] = v4;
  v11[5] = &unk_1F3F3C458;
  v5 = [MEMORY[0x1E4F28ED0] numberWithDouble:*MEMORY[0x1E4FB09E0]];
  v12[5] = v5;
  v11[6] = &unk_1F3F3C470;
  v6 = [MEMORY[0x1E4F28ED0] numberWithDouble:*MEMORY[0x1E4FB09B8]];
  v12[6] = v6;
  v11[7] = &unk_1F3F3C488;
  v7 = [MEMORY[0x1E4F28ED0] numberWithDouble:*MEMORY[0x1E4FB09C0]];
  v12[7] = v7;
  v11[8] = &unk_1F3F3C4A0;
  v8 = [MEMORY[0x1E4F28ED0] numberWithDouble:*MEMORY[0x1E4FB09A8]];
  v12[8] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:9];
  v10 = (void *)uifontWeightFromFontWeight__sFontWeightMap;
  uifontWeightFromFontWeight__sFontWeightMap = v9;
}

void __49__UIFont_VideosUI__uiFontTextStyleFromTextStyle___block_invoke()
{
  v26[25] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4FB2980];
  v25[0] = &unk_1F3F3C4E8;
  v25[1] = &unk_1F3F3C3E0;
  uint64_t v1 = *MEMORY[0x1E4FB2988];
  v26[0] = v0;
  v26[1] = v1;
  uint64_t v2 = *MEMORY[0x1E4FB2990];
  v25[2] = &unk_1F3F3C3F8;
  v25[3] = &unk_1F3F3C410;
  uint64_t v3 = *MEMORY[0x1E4FB2998];
  v26[2] = v2;
  v26[3] = v3;
  uint64_t v4 = *MEMORY[0x1E4F24898];
  v25[4] = &unk_1F3F3C428;
  v25[5] = &unk_1F3F3C440;
  uint64_t v5 = *MEMORY[0x1E4FB2928];
  v26[4] = v4;
  v26[5] = v5;
  uint64_t v6 = *MEMORY[0x1E4FB2908];
  v25[6] = &unk_1F3F3C458;
  v25[7] = &unk_1F3F3C470;
  uint64_t v7 = *MEMORY[0x1E4FB2920];
  v26[6] = v6;
  v26[7] = v7;
  uint64_t v8 = *MEMORY[0x1E4F24840];
  v25[8] = &unk_1F3F3C488;
  v25[9] = &unk_1F3F3C4A0;
  uint64_t v9 = *MEMORY[0x1E4FB2968];
  v26[8] = v8;
  v26[9] = v9;
  uint64_t v10 = *MEMORY[0x1E4FB2970];
  v25[10] = &unk_1F3F3C500;
  v25[11] = &unk_1F3F3C518;
  uint64_t v11 = *MEMORY[0x1E4FB2978];
  v26[10] = v10;
  v26[11] = v11;
  uint64_t v12 = *MEMORY[0x1E4FB28D0];
  v25[12] = &unk_1F3F3C530;
  v25[13] = &unk_1F3F3C548;
  uint64_t v13 = *MEMORY[0x1E4FB28C8];
  v26[12] = v12;
  v26[13] = v13;
  uint64_t v14 = *MEMORY[0x1E4FB2948];
  v25[14] = &unk_1F3F3C560;
  v25[15] = &unk_1F3F3C578;
  uint64_t v15 = *MEMORY[0x1E4FB28F0];
  v26[14] = v14;
  v26[15] = v15;
  uint64_t v16 = *MEMORY[0x1E4FB28D8];
  v25[16] = &unk_1F3F3C590;
  v25[17] = &unk_1F3F3C5A8;
  uint64_t v17 = *MEMORY[0x1E4FB28E0];
  v26[16] = v16;
  v26[17] = v17;
  v25[18] = &unk_1F3F3C5C0;
  v25[19] = &unk_1F3F3C5D8;
  uint64_t v18 = *MEMORY[0x1E4F24860];
  v26[18] = v2;
  v26[19] = v18;
  uint64_t v19 = *MEMORY[0x1E4F24848];
  v25[20] = &unk_1F3F3C5F0;
  v25[21] = &unk_1F3F3C608;
  uint64_t v20 = *MEMORY[0x1E4F24868];
  v26[20] = v19;
  v26[21] = v20;
  uint64_t v21 = *MEMORY[0x1E4F24858];
  v25[22] = &unk_1F3F3C620;
  v25[23] = &unk_1F3F3C638;
  uint64_t v22 = *MEMORY[0x1E4F24850];
  v26[22] = v21;
  v26[23] = v22;
  v25[24] = &unk_1F3F3C650;
  v26[24] = v17;
  uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:25];
  v24 = (void *)uiFontTextStyleFromTextStyle__sTextStyleMap;
  uiFontTextStyleFromTextStyle__sTextStyleMap = v23;
}

@end
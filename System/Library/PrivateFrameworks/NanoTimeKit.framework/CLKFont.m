@interface CLKFont
@end

@implementation CLKFont

void __106__CLKFont_RichComplicationRectangularDailyGraphFont__alternatePunctuationRoundedSemiBoldSystemFontOfSize___block_invoke()
{
  v16[2] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4FB0960];
  v15[0] = *MEMORY[0x1E4FB0968];
  v15[1] = v0;
  v16[0] = &unk_1F16E05E8;
  v16[1] = &unk_1F16E0600;
  v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
  uint64_t v2 = *MEMORY[0x1E4FB0910];
  v12 = v1;
  uint64_t v13 = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
  v14 = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v14 forKeys:&v13 count:1];

  v5 = (void *)MEMORY[0x1E4F19A50];
  [MEMORY[0x1E4FB08E0] systemFontSize];
  v6 = objc_msgSend(v5, "systemFontOfSize:weight:design:", *MEMORY[0x1E4F19680]);
  v7 = [v6 fontDescriptor];
  uint64_t v8 = [v7 fontDescriptorByAddingAttributes:v4];
  v9 = (void *)alternatePunctuationRoundedSemiBoldSystemFontOfSize__baseDescriptor;
  alternatePunctuationRoundedSemiBoldSystemFontOfSize__baseDescriptor = v8;

  uint64_t v10 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:0 valueOptions:512];
  v11 = (void *)alternatePunctuationRoundedSemiBoldSystemFontOfSize__cache;
  alternatePunctuationRoundedSemiBoldSystemFontOfSize__cache = v10;
}

@end
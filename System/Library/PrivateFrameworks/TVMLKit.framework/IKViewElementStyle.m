@interface IKViewElementStyle
@end

@implementation IKViewElementStyle

uint64_t __56__IKViewElementStyle_TVMLKitAdditions__tv_textAlignment__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v1 = (void *)tv_textAlignment_sAlignmentKeysMap;
  tv_textAlignment_sAlignmentKeysMap = (uint64_t)v0;

  [(id)tv_textAlignment_sAlignmentKeysMap setObject:&unk_26E59E908 forKeyedSubscript:@"left"];
  [(id)tv_textAlignment_sAlignmentKeysMap setObject:&unk_26E59E920 forKeyedSubscript:@"center"];
  [(id)tv_textAlignment_sAlignmentKeysMap setObject:&unk_26E59E938 forKeyedSubscript:@"right"];
  [(id)tv_textAlignment_sAlignmentKeysMap setObject:&unk_26E59E950 forKeyedSubscript:@"justified"];
  v2 = (void *)tv_textAlignment_sAlignmentKeysMap;
  return [v2 setObject:&unk_26E59E968 forKeyedSubscript:@"natural"];
}

uint64_t __52__IKViewElementStyle_TVMLKitAdditions__tv_alignment__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v1 = (void *)tv_alignment_sAlignmentKeysMap;
  tv_alignment_sAlignmentKeysMap = (uint64_t)v0;

  [(id)tv_alignment_sAlignmentKeysMap setObject:&unk_26E59E920 forKeyedSubscript:@"left"];
  [(id)tv_alignment_sAlignmentKeysMap setObject:&unk_26E59E938 forKeyedSubscript:@"center"];
  [(id)tv_alignment_sAlignmentKeysMap setObject:&unk_26E59E950 forKeyedSubscript:@"right"];
  [(id)tv_alignment_sAlignmentKeysMap setObject:&unk_26E59E968 forKeyedSubscript:@"leading"];
  v2 = (void *)tv_alignment_sAlignmentKeysMap;
  return [v2 setObject:&unk_26E59E980 forKeyedSubscript:@"trailing"];
}

uint64_t __51__IKViewElementStyle_TVMLKitAdditions__tv_position__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v1 = (void *)tv_position_sPositionKeysMap;
  tv_position_sPositionKeysMap = (uint64_t)v0;

  [(id)tv_position_sPositionKeysMap setObject:&unk_26E59E920 forKeyedSubscript:@"center"];
  [(id)tv_position_sPositionKeysMap setObject:&unk_26E59E938 forKeyedSubscript:@"top"];
  [(id)tv_position_sPositionKeysMap setObject:&unk_26E59E950 forKeyedSubscript:@"bottom"];
  [(id)tv_position_sPositionKeysMap setObject:&unk_26E59E968 forKeyedSubscript:@"left"];
  [(id)tv_position_sPositionKeysMap setObject:&unk_26E59E980 forKeyedSubscript:@"right"];
  [(id)tv_position_sPositionKeysMap setObject:&unk_26E59E998 forKeyedSubscript:@"top-left"];
  [(id)tv_position_sPositionKeysMap setObject:&unk_26E59E9B0 forKeyedSubscript:@"top-right"];
  [(id)tv_position_sPositionKeysMap setObject:&unk_26E59E9C8 forKeyedSubscript:@"bottom-left"];
  [(id)tv_position_sPositionKeysMap setObject:&unk_26E59E9E0 forKeyedSubscript:@"bottom-right"];
  [(id)tv_position_sPositionKeysMap setObject:&unk_26E59E9F8 forKeyedSubscript:@"header"];
  [(id)tv_position_sPositionKeysMap setObject:&unk_26E59EA10 forKeyedSubscript:@"footer"];
  [(id)tv_position_sPositionKeysMap setObject:&unk_26E59EA28 forKeyedSubscript:@"leading"];
  [(id)tv_position_sPositionKeysMap setObject:&unk_26E59EA40 forKeyedSubscript:@"trailing"];
  [(id)tv_position_sPositionKeysMap setObject:&unk_26E59EA58 forKeyedSubscript:@"top-leading"];
  [(id)tv_position_sPositionKeysMap setObject:&unk_26E59EA70 forKeyedSubscript:@"top-trailing"];
  [(id)tv_position_sPositionKeysMap setObject:&unk_26E59EA88 forKeyedSubscript:@"bottom-leading"];
  v2 = (void *)tv_position_sPositionKeysMap;
  return [v2 setObject:&unk_26E59EAA0 forKeyedSubscript:@"bottom-trailing"];
}

uint64_t __59__IKViewElementStyle_TVMLKitAdditions__tv_contentAlignment__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v1 = (void *)tv_contentAlignment_sAlignmentKeysMap;
  tv_contentAlignment_sAlignmentKeysMap = (uint64_t)v0;

  [(id)tv_contentAlignment_sAlignmentKeysMap setObject:&unk_26E59E920 forKeyedSubscript:@"top"];
  [(id)tv_contentAlignment_sAlignmentKeysMap setObject:&unk_26E59E938 forKeyedSubscript:@"center"];
  v2 = (void *)tv_contentAlignment_sAlignmentKeysMap;
  return [v2 setObject:&unk_26E59E950 forKeyedSubscript:@"bottom"];
}

uint64_t __55__IKViewElementStyle_TVMLKitAdditions__tv_symbolWeight__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v1 = (void *)tv_symbolWeight_sSymbolWeightMap;
  tv_symbolWeight_sSymbolWeightMap = (uint64_t)v0;

  [(id)tv_symbolWeight_sSymbolWeightMap setObject:&unk_26E59E920 forKeyedSubscript:@"ultralight"];
  [(id)tv_symbolWeight_sSymbolWeightMap setObject:&unk_26E59E938 forKeyedSubscript:@"thin"];
  [(id)tv_symbolWeight_sSymbolWeightMap setObject:&unk_26E59E950 forKeyedSubscript:@"light"];
  [(id)tv_symbolWeight_sSymbolWeightMap setObject:&unk_26E59E968 forKeyedSubscript:@"regular"];
  [(id)tv_symbolWeight_sSymbolWeightMap setObject:&unk_26E59E980 forKeyedSubscript:@"medium"];
  [(id)tv_symbolWeight_sSymbolWeightMap setObject:&unk_26E59E998 forKeyedSubscript:@"semibold"];
  [(id)tv_symbolWeight_sSymbolWeightMap setObject:&unk_26E59E9B0 forKeyedSubscript:@"bold"];
  [(id)tv_symbolWeight_sSymbolWeightMap setObject:&unk_26E59E9C8 forKeyedSubscript:@"heavy"];
  v2 = (void *)tv_symbolWeight_sSymbolWeightMap;
  return [v2 setObject:&unk_26E59E9E0 forKeyedSubscript:@"black"];
}

uint64_t __54__IKViewElementStyle_TVMLKitAdditions__tv_symbolScale__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v1 = (void *)tv_symbolScale_sSymbolScaleMap;
  tv_symbolScale_sSymbolScaleMap = (uint64_t)v0;

  [(id)tv_symbolScale_sSymbolScaleMap setObject:&unk_26E59EAB8 forKeyedSubscript:@"default"];
  [(id)tv_symbolScale_sSymbolScaleMap setObject:&unk_26E59E908 forKeyedSubscript:@"unspecified"];
  [(id)tv_symbolScale_sSymbolScaleMap setObject:&unk_26E59E920 forKeyedSubscript:@"small"];
  [(id)tv_symbolScale_sSymbolScaleMap setObject:&unk_26E59E938 forKeyedSubscript:@"medium"];
  v2 = (void *)tv_symbolScale_sSymbolScaleMap;
  return [v2 setObject:&unk_26E59E950 forKeyedSubscript:@"large"];
}

uint64_t __58__IKViewElementStyle_TVMLKitAdditions__tv_symbolTextStyle__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v1 = (void *)tv_symbolTextStyle_sSymbolTextStyleMap;
  tv_symbolTextStyle_sSymbolTextStyleMap = (uint64_t)v0;

  [(id)tv_symbolTextStyle_sSymbolTextStyleMap setObject:*MEMORY[0x263F1D2B0] forKeyedSubscript:@"largetitle"];
  [(id)tv_symbolTextStyle_sSymbolTextStyleMap setObject:*MEMORY[0x263F1D2F8] forKeyedSubscript:@"title1"];
  [(id)tv_symbolTextStyle_sSymbolTextStyleMap setObject:*MEMORY[0x263F1D300] forKeyedSubscript:@"title2"];
  [(id)tv_symbolTextStyle_sSymbolTextStyleMap setObject:*MEMORY[0x263F1D308] forKeyedSubscript:@"title3"];
  [(id)tv_symbolTextStyle_sSymbolTextStyleMap setObject:*MEMORY[0x263F1D298] forKeyedSubscript:@"headline"];
  [(id)tv_symbolTextStyle_sSymbolTextStyleMap setObject:*MEMORY[0x263F1D2C0] forKeyedSubscript:@"subheadline"];
  [(id)tv_symbolTextStyle_sSymbolTextStyleMap setObject:*MEMORY[0x263F1D260] forKeyedSubscript:@"body"];
  [(id)tv_symbolTextStyle_sSymbolTextStyleMap setObject:*MEMORY[0x263F1D268] forKeyedSubscript:@"callout"];
  [(id)tv_symbolTextStyle_sSymbolTextStyleMap setObject:*MEMORY[0x263F1D280] forKeyedSubscript:@"footnote"];
  [(id)tv_symbolTextStyle_sSymbolTextStyleMap setObject:*MEMORY[0x263F1D270] forKeyedSubscript:@"caption1"];
  uint64_t v2 = *MEMORY[0x263F1D278];
  v3 = (void *)tv_symbolTextStyle_sSymbolTextStyleMap;
  return [v3 setObject:v2 forKeyedSubscript:@"caption2"];
}

@end
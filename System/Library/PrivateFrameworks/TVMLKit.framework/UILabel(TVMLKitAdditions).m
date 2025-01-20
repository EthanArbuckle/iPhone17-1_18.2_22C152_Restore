@interface UILabel(TVMLKitAdditions)
- (double)tv_alignmentInsetsForExpectedWidth:()TVMLKitAdditions;
- (double)tv_heightToFirstBaseline;
- (double)tv_scaledValueForValue:()TVMLKitAdditions;
- (double)tv_textSizeForSize:()TVMLKitAdditions;
- (uint64_t)tv_textSizeForWidth:()TVMLKitAdditions;
@end

@implementation UILabel(TVMLKitAdditions)

- (double)tv_heightToFirstBaseline
{
  v1 = [a1 font];
  [v1 lineHeight];
  double v3 = v2;
  [v1 descender];
  double v5 = v3 + v4;

  return v5;
}

- (double)tv_scaledValueForValue:()TVMLKitAdditions
{
  double v3 = [a1 font];
  [v3 _scaledValueForValue:a2];
  double v5 = v4;

  return v5;
}

- (uint64_t)tv_textSizeForWidth:()TVMLKitAdditions
{
  return objc_msgSend(a1, "tv_textSizeForSize:", a3, 0.0);
}

- (double)tv_textSizeForSize:()TVMLKitAdditions
{
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __48__UILabel_TVMLKitAdditions__tv_textSizeForSize___block_invoke;
  v13[3] = &unk_264BA66C0;
  v13[4] = a1;
  v6 = (void *)MEMORY[0x230FC9DC0](v13);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __48__UILabel_TVMLKitAdditions__tv_textSizeForSize___block_invoke_2;
  v12[3] = &unk_264BA66C0;
  v12[4] = a1;
  v7 = (void *)MEMORY[0x230FC9DC0](v12);
  if (objc_msgSend(a1, "tv_isPrototypeView")) {
    v8 = v7;
  }
  else {
    v8 = v6;
  }
  objc_msgSend(a1, "tv_sizeThatFits:withSizeCalculation:", v8, a2, a3);
  double v10 = v9;

  return v10;
}

- (double)tv_alignmentInsetsForExpectedWidth:()TVMLKitAdditions
{
  uint64_t v16 = 0;
  v17 = (double *)&v16;
  uint64_t v18 = 0x4010000000;
  v19 = &unk_230C43B61;
  long long v2 = *(_OWORD *)(MEMORY[0x263F1D1C0] + 16);
  long long v20 = *MEMORY[0x263F1D1C0];
  long long v21 = v2;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  v15[3] = 0;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __64__UILabel_TVMLKitAdditions__tv_alignmentInsetsForExpectedWidth___block_invoke;
  v14[3] = &unk_264BA6760;
  v14[4] = v15;
  v14[5] = &v16;
  double v3 = (void (**)(void, void))MEMORY[0x230FC9DC0](v14);
  double v4 = [a1 attributedText];
  if ([v4 length])
  {
    uint64_t v5 = [v4 length];
    uint64_t v6 = *MEMORY[0x263F1C238];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __64__UILabel_TVMLKitAdditions__tv_alignmentInsetsForExpectedWidth___block_invoke_2;
    v12[3] = &unk_264BA6788;
    v13 = v3;
    objc_msgSend(v4, "enumerateAttribute:inRange:options:usingBlock:", v6, 0, v5, 0, v12);
    v7 = v13;
  }
  else
  {
    v7 = [a1 _defaultAttributes];
    v8 = [v7 objectForKeyedSubscript:*MEMORY[0x263F1C238]];
    ((void (**)(void, void *))v3)[2](v3, v8);
  }
  double v9 = v17;
  double v10 = floor(v17[4]);
  v17[4] = v10;
  v9[6] = floor(v9[6]);

  _Block_object_dispose(v15, 8);
  _Block_object_dispose(&v16, 8);
  return v10;
}

@end
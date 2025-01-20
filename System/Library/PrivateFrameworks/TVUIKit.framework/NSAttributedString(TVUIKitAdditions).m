@interface NSAttributedString(TVUIKitAdditions)
- (double)boundingRectWithWidth:()TVUIKitAdditions lines:;
@end

@implementation NSAttributedString(TVUIKitAdditions)

- (double)boundingRectWithWidth:()TVUIKitAdditions lines:
{
  v6 = (void *)[objc_alloc(MEMORY[0x263F816E8]) initWithAttributedString:a1];
  id v7 = objc_alloc_init(MEMORY[0x263F81648]);
  [v6 addLayoutManager:v7];
  v8 = objc_msgSend(objc_alloc(MEMORY[0x263F81680]), "initWithSize:", a2, 1.79769313e308);
  [v7 addTextContainer:v8];
  [v8 setMaximumNumberOfLines:a4];
  uint64_t v15 = 0;
  v16 = (double *)&v15;
  uint64_t v17 = 0x4010000000;
  v18 = &unk_23EFC6766;
  long long v9 = *(_OWORD *)(MEMORY[0x263F001A8] + 16);
  long long v19 = *MEMORY[0x263F001A8];
  long long v20 = v9;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v14[3] = 0;
  uint64_t v10 = [v7 numberOfGlyphs];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __68__NSAttributedString_TVUIKitAdditions__boundingRectWithWidth_lines___block_invoke;
  v13[3] = &unk_26504D430;
  v13[4] = v14;
  v13[5] = &v15;
  v13[6] = a4;
  objc_msgSend(v7, "enumerateLineFragmentsForGlyphRange:usingBlock:", 0, v10, v13);
  double v11 = v16[4];
  _Block_object_dispose(v14, 8);
  _Block_object_dispose(&v15, 8);

  return v11;
}

@end
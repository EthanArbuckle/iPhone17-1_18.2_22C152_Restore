@interface IKTextElement(TVMLKitAdditions)
- (id)tv_attributedString;
- (id)tv_attributedStringReplacingSFSymbols:()TVMLKitAdditions;
- (id)tv_attributedStringWithForegroundColor:()TVMLKitAdditions textAlignment:;
- (id)tv_paragraphStyleForDefaultStyle:()TVMLKitAdditions;
- (id)tv_paragraphStyleForDefaultStyle:()TVMLKitAdditions withTextAlignment:;
- (id)tv_textAttributes;
- (uint64_t)tv_associatedViewElement;
- (uint64_t)tv_textStyle;
@end

@implementation IKTextElement(TVMLKitAdditions)

- (id)tv_attributedString
{
  id v17 = 0;
  v2 = [a1 attributedStringWithFontHandler:&__block_literal_global_2 defaultAttributes:&v17];
  id v3 = v17;
  v4 = (void *)[v2 mutableCopy];
  v5 = objc_msgSend(v4, "tv_currentParagraphStyle");
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [MEMORY[0x263F1C358] defaultParagraphStyle];
  }
  v8 = v7;

  v9 = [a1 style];
  v10 = objc_msgSend(a1, "tv_paragraphStyleForDefaultStyle:withTextAlignment:", v8, objc_msgSend(v9, "tv_textAlignment"));

  uint64_t v11 = *MEMORY[0x263F1C268];
  objc_msgSend(v4, "addAttribute:value:range:", *MEMORY[0x263F1C268], v10, 0, objc_msgSend(v4, "length"));
  v12 = (void *)[v3 mutableCopy];

  [v12 setObject:v10 forKeyedSubscript:v11];
  v13 = (void *)[v4 copy];
  v14 = (void *)[v12 copy];
  objc_msgSend(v13, "tv_setDefaultAttributes:", v14);

  if (+[TVMLUtilities mainBundleSupportsSFSymbols])
  {
    uint64_t v15 = objc_msgSend(a1, "tv_attributedStringReplacingSFSymbols:", v13);

    v13 = (void *)v15;
  }

  return v13;
}

- (id)tv_attributedStringWithForegroundColor:()TVMLKitAdditions textAlignment:
{
  id v19 = 0;
  v6 = [a1 attributedStringWithFontHandler:&__block_literal_global_53_0 foregroundColor:a3 textAlignment:a4 defaultAttributes:&v19];
  id v7 = v19;
  v8 = (void *)[v6 mutableCopy];
  v9 = objc_msgSend(v8, "tv_currentParagraphStyle");
  v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v11 = [MEMORY[0x263F1C358] defaultParagraphStyle];
  }
  v12 = v11;

  v13 = objc_msgSend(a1, "tv_paragraphStyleForDefaultStyle:withTextAlignment:", v12, a4);
  uint64_t v14 = *MEMORY[0x263F1C268];
  objc_msgSend(v8, "addAttribute:value:range:", *MEMORY[0x263F1C268], v13, 0, objc_msgSend(v8, "length"));
  uint64_t v15 = (void *)[v7 mutableCopy];

  [v15 setObject:v13 forKeyedSubscript:v14];
  v16 = (void *)[v8 copy];
  id v17 = (void *)[v15 copy];
  objc_msgSend(v16, "tv_setDefaultAttributes:", v17);

  return v16;
}

- (uint64_t)tv_textStyle
{
  v1 = [a1 elementName];
  if ([v1 isEqualToString:@"title"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"subtitle"])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:@"description"])
  {
    uint64_t v2 = 3;
  }
  else if ([v1 isEqualToString:@"decorationLabel"])
  {
    uint64_t v2 = 4;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

- (id)tv_textAttributes
{
  uint64_t v2 = [MEMORY[0x263EFF9A0] dictionary];
  id v3 = [a1 style];
  v4 = +[TVMLUtilities fontFromStyle:v3];

  [v2 setObject:v4 forKey:*MEMORY[0x263F1C238]];
  v5 = [MEMORY[0x263F1C358] defaultParagraphStyle];
  v6 = objc_msgSend(a1, "tv_paragraphStyleForDefaultStyle:", v5);

  [v2 setObject:v6 forKey:*MEMORY[0x263F1C268]];
  id v7 = [a1 style];
  v8 = objc_msgSend(v7, "tv_color");
  v9 = [v8 color];

  if (v9) {
    [v2 setObject:v9 forKey:*MEMORY[0x263F1C240]];
  }
  v10 = [a1 style];
  id v11 = objc_msgSend(v10, "tv_textShadow");

  if (v11) {
    [v2 setObject:v11 forKey:*MEMORY[0x263F1C280]];
  }
  v12 = (void *)[v2 copy];

  return v12;
}

- (id)tv_paragraphStyleForDefaultStyle:()TVMLKitAdditions
{
  id v4 = a3;
  v5 = [a1 style];
  uint64_t v6 = objc_msgSend(v5, "tv_textAlignment");

  id v7 = objc_msgSend(a1, "tv_paragraphStyleForDefaultStyle:withTextAlignment:", v4, v6);

  return v7;
}

- (id)tv_paragraphStyleForDefaultStyle:()TVMLKitAdditions withTextAlignment:
{
  uint64_t v6 = (void *)[a3 mutableCopy];
  id v7 = [a1 style];
  objc_msgSend(v7, "tv_textHyphenationFactor");
  *(float *)&double v8 = v8;
  [v6 setHyphenationFactor:v8];

  [v6 setLineBreakMode:4];
  [v6 setAlignment:a4];
  v9 = (void *)[v6 copy];

  return v9;
}

- (id)tv_attributedStringReplacingSFSymbols:()TVMLKitAdditions
{
  id v3 = a3;
  if (textImageUnicodeImageMapping_onceToken != -1) {
    dispatch_once(&textImageUnicodeImageMapping_onceToken, &__block_literal_global_75);
  }
  id v4 = (id)textImageUnicodeImageMapping_mapping;
  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v7 = [v3 string];
  uint64_t v8 = [v3 length];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __73__IKTextElement_TVMLKitAdditions__tv_attributedStringReplacingSFSymbols___block_invoke;
  v20[3] = &unk_264BA6828;
  id v9 = v4;
  id v21 = v9;
  id v10 = v5;
  id v22 = v10;
  id v11 = v6;
  id v23 = v11;
  objc_msgSend(v7, "enumerateSubstringsInRange:options:usingBlock:", 0, v8, 2, v20);

  if ([v10 count])
  {
    v12 = (void *)[v3 mutableCopy];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __73__IKTextElement_TVMLKitAdditions__tv_attributedStringReplacingSFSymbols___block_invoke_2;
    v17[3] = &unk_264BA6850;
    id v18 = v10;
    id v13 = v12;
    id v19 = v13;
    [v11 enumerateObjectsWithOptions:2 usingBlock:v17];
    uint64_t v14 = v19;
    id v15 = v13;
  }
  else
  {
    id v15 = v3;
  }

  return v15;
}

- (uint64_t)tv_associatedViewElement
{
  uint64_t v2 = objc_opt_class();
  return objc_msgSend(a1, "tv_associatedViewElementWithDefaultClass:", v2);
}

@end
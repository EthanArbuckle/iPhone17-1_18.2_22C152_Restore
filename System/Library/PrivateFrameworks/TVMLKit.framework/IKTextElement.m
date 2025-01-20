@interface IKTextElement
@end

@implementation IKTextElement

id __54__IKTextElement_TVMLKitAdditions__tv_attributedString__block_invoke(uint64_t a1, uint64_t a2)
{
  return +[TVMLUtilities fontFromStyle:a2];
}

id __88__IKTextElement_TVMLKitAdditions__tv_attributedStringWithForegroundColor_textAlignment___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[TVMLUtilities fontFromStyle:a2];
}

void __73__IKTextElement_TVMLKitAdditions__tv_attributedStringReplacingSFSymbols___block_invoke(id *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v8 = [a1[4] objectForKeyedSubscript:a2];
  if (v8)
  {
    v7 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", a3, a4);
    [a1[5] setObject:v8 forKeyedSubscript:v7];
    [a1[6] addObject:v7];
  }
}

void __73__IKTextElement_TVMLKitAdditions__tv_attributedStringReplacingSFSymbols___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v19 = [v3 objectForKeyedSubscript:v4];
  v5 = *(void **)(a1 + 40);
  uint64_t v6 = *MEMORY[0x263F1C238];
  uint64_t v7 = [v4 rangeValue];
  v9 = objc_msgSend(v5, "attribute:atIndex:longestEffectiveRange:inRange:", v6, 0, 0, v7, v8);
  [v9 pointSize];
  v10 = objc_msgSend(MEMORY[0x263F1C6C8], "configurationWithPointSize:");
  v11 = [MEMORY[0x263F1C6B0] systemImageNamed:v19 withConfiguration:v10];
  id v12 = objc_alloc_init(MEMORY[0x263F1C370]);
  v13 = [v11 imageWithRenderingMode:2];
  [v12 setImage:v13];

  v14 = [MEMORY[0x263F086A0] attributedStringWithAttachment:v12];
  v15 = *(void **)(a1 + 40);
  uint64_t v16 = [v4 rangeValue];
  uint64_t v18 = v17;

  objc_msgSend(v15, "replaceCharactersInRange:withAttributedString:", v16, v18, v14);
}

@end
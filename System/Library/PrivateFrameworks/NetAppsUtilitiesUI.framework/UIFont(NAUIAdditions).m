@interface UIFont(NAUIAdditions)
+ (id)naui_ultraLightMonospacedFontOfSize:()NAUIAdditions;
- (NAUITextStyleDescriptor)naui_dynamicFontTextStyleDescriptor;
@end

@implementation UIFont(NAUIAdditions)

+ (id)naui_ultraLightMonospacedFontOfSize:()NAUIAdditions
{
  v18[1] = *MEMORY[0x263EF8340];
  CTFontRef UIFontForLanguage = CTFontCreateUIFontForLanguage(kCTFontMenuTitleFontType|0x80, a1, 0);
  v2 = [(__CTFont *)UIFontForLanguage fontDescriptor];
  uint64_t v17 = *MEMORY[0x263F81748];
  uint64_t v4 = *MEMORY[0x263F817B0];
  v14[0] = *MEMORY[0x263F817B8];
  uint64_t v3 = v14[0];
  v14[1] = v4;
  v15[0] = &unk_26D4EB1F8;
  v15[1] = &unk_26D4EB210;
  v5 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];
  v16[0] = v5;
  v12[0] = v3;
  v12[1] = v4;
  v13[0] = &unk_26D4EB228;
  v13[1] = &unk_26D4EB240;
  v6 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
  v16[1] = v6;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:2];
  v18[0] = v7;
  v8 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:1];
  v9 = [v2 fontDescriptorByAddingAttributes:v8];

  v10 = [MEMORY[0x263F81708] fontWithDescriptor:v9 size:0.0];

  return v10;
}

- (NAUITextStyleDescriptor)naui_dynamicFontTextStyleDescriptor
{
  v2 = [a1 fontDescriptor];
  uint64_t v3 = [v2 fontAttributes];
  uint64_t v4 = [v3 objectForKeyedSubscript:*MEMORY[0x263F81798]];

  if (v4)
  {
    v5 = [NAUITextStyleDescriptor alloc];
    v6 = [a1 fontDescriptor];
    v7 = -[NAUITextStyleDescriptor initWithTextStyle:symbolicTraits:allowsAccessibilitySizes:allowsSmallSizes:](v5, "initWithTextStyle:symbolicTraits:allowsAccessibilitySizes:allowsSmallSizes:", v4, [v6 symbolicTraits], 1, 1);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
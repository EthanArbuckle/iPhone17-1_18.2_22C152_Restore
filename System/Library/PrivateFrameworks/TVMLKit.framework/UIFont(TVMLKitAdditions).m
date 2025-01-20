@interface UIFont(TVMLKitAdditions)
+ (id)tv_fontFromTextStyle:()TVMLKitAdditions fontWeight:fontSize:symbolicTraits:;
@end

@implementation UIFont(TVMLKitAdditions)

+ (id)tv_fontFromTextStyle:()TVMLKitAdditions fontWeight:fontSize:symbolicTraits:
{
  v30[1] = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v10 = a5;
  if (tv_fontFromTextStyle_fontWeight_fontSize_symbolicTraits__onceToken != -1) {
    dispatch_once(&tv_fontFromTextStyle_fontWeight_fontSize_symbolicTraits__onceToken, &__block_literal_global_5);
  }
  v11 = [(id)tv_fontFromTextStyle_fontWeight_fontSize_symbolicTraits__sTextStyleMap objectForKeyedSubscript:v9];
  if (![v11 length])
  {
    v14 = 0;
    goto LABEL_9;
  }
  unint64_t v12 = 0x263F1C000uLL;
  v13 = [MEMORY[0x263F1C658] preferredFontForTextStyle:v11];
  v14 = v13;
  if (!v13)
  {
LABEL_9:
    v24 = 0;
    goto LABEL_19;
  }
  v15 = [v13 fontDescriptor];
  if ([v10 length]
    && ([(id)tv_fontFromTextStyle_fontWeight_fontSize_symbolicTraits__sTextStyleFontWeightMap objectForKeyedSubscript:v10], (uint64_t v16 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v17 = (void *)v16;
    v18 = (void *)MEMORY[0x263EFF9A0];
    uint64_t v19 = *MEMORY[0x263F1D210];
    v20 = [v15 objectForKey:*MEMORY[0x263F1D210]];
    v21 = [v18 dictionaryWithDictionary:v20];

    [v21 setObject:v17 forKey:*MEMORY[0x263F1D350]];
    uint64_t v29 = v19;
    v30[0] = v21;
    v22 = [NSDictionary dictionaryWithObjects:v30 forKeys:&v29 count:1];
    uint64_t v23 = [v15 fontDescriptorByAddingAttributes:v22];

    unint64_t v12 = 0x263F1C000;
    v15 = (void *)v23;
  }
  else if ([v10 isEqualToString:@"emphasized"])
  {
    v25 = [MEMORY[0x263F1C658] _preferredFontForTextStyle:v11 variant:1024];
    uint64_t v26 = [v25 fontDescriptor];

    v15 = (void *)v26;
  }
  if (a6 && v15)
  {
    uint64_t v27 = objc_msgSend(v15, "fontDescriptorWithSymbolicTraits:", objc_msgSend(v15, "symbolicTraits") | a6);

    v15 = (void *)v27;
  }
  if (v15)
  {
    v24 = [*(id *)(v12 + 1624) fontWithDescriptor:v15 size:a1];
  }
  else
  {
    v24 = 0;
  }

LABEL_19:
  return v24;
}

@end
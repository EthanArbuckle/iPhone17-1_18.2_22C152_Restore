@interface UIFont
@end

@implementation UIFont

void __77__UIFont_PosterUIFoundation__pui_fontWithFallbacks_beforeFontContainingName___block_invoke(uint64_t a1, CTFontDescriptorRef descriptor, uint64_t a3, unsigned char *a4)
{
  id v7 = (id)CTFontDescriptorCopyAttribute(descriptor, (CFStringRef)*MEMORY[0x263F03AE8]);
  if ([v7 rangeOfString:*(void *)(a1 + 32)] != 0x7FFFFFFFFFFFFFFFLL)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
}

void __59__UIFont_PosterUIFoundation__pui_replaceFallbackFontNames___block_invoke(uint64_t a1, CTFontDescriptorRef descriptor, uint64_t a3)
{
  v15[1] = *MEMORY[0x263EF8340];
  v5 = (void *)CTFontDescriptorCopyAttribute(descriptor, (CFStringRef)*MEMORY[0x263F03AE8]);
  uint64_t v6 = [*(id *)(a1 + 32) objectForKey:v5];
  id v7 = (void *)v6;
  if (v6)
  {
    v8 = (void *)MEMORY[0x263F1C660];
    uint64_t v14 = *MEMORY[0x263F1D1F0];
    v15[0] = v6;
    v9 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
    v10 = [v8 fontDescriptorWithFontAttributes:v9];

    MatchingFontDescriptorsWithOptions = (void *)CTFontDescriptorCreateMatchingFontDescriptorsWithOptions();
    v12 = MatchingFontDescriptorsWithOptions;
    if (MatchingFontDescriptorsWithOptions)
    {
      v13 = [MatchingFontDescriptorsWithOptions objectAtIndexedSubscript:0];
      [*(id *)(a1 + 48) setObject:v13 atIndexedSubscript:a3];
    }
  }
}

@end
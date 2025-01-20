@interface SKUIFontDescriptorGetCache
@end

@implementation SKUIFontDescriptorGetCache

uint64_t ___SKUIFontDescriptorGetCache_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1C998]);
  v1 = (void *)_SKUIFontDescriptorGetCache_fontDescriptorCache;
  _SKUIFontDescriptorGetCache_fontDescriptorCache = (uint64_t)v0;

  v2 = (void *)_SKUIFontDescriptorGetCache_fontDescriptorCache;

  return [v2 setName:@"com.apple.StoreKitUI.SKUIFontDescriptor.cache"];
}

@end
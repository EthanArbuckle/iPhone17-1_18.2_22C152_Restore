@interface SUUIFontDescriptorGetCache
@end

@implementation SUUIFontDescriptorGetCache

uint64_t ___SUUIFontDescriptorGetCache_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263EFF8E0]);
  v1 = (void *)_SUUIFontDescriptorGetCache_fontDescriptorCache;
  _SUUIFontDescriptorGetCache_fontDescriptorCache = (uint64_t)v0;

  v2 = (void *)_SUUIFontDescriptorGetCache_fontDescriptorCache;
  return [v2 setName:@"com.apple.iTunesStoreUI.SUUIFontDescriptor.cache"];
}

@end
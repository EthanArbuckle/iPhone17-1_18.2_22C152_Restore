@interface NSLocale
@end

@implementation NSLocale

void __52__NSLocale_VKFoundationUtility___vk_indexForLocale___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CA20] availableLocaleIdentifiers];
  v1 = (void *)+[NSLocale(VKFoundationUtility) _vk_indexForLocale:]::__localeIdentifiers;
  +[NSLocale(VKFoundationUtility) _vk_indexForLocale:]::__localeIdentifiers = v0;
}

@end
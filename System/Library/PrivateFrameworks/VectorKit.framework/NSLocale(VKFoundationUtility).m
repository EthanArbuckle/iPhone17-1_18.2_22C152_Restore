@interface NSLocale(VKFoundationUtility)
+ (uint64_t)_vk_indexForLocale:()VKFoundationUtility;
@end

@implementation NSLocale(VKFoundationUtility)

+ (uint64_t)_vk_indexForLocale:()VKFoundationUtility
{
  id v3 = a3;
  if (v3)
  {
    if (+[NSLocale(VKFoundationUtility) _vk_indexForLocale:]::onceToken != -1) {
      dispatch_once(&+[NSLocale(VKFoundationUtility) _vk_indexForLocale:]::onceToken, &__block_literal_global_20446);
    }
    v4 = (void *)+[NSLocale(VKFoundationUtility) _vk_indexForLocale:]::__localeIdentifiers;
    v5 = [v3 objectForKey:*MEMORY[0x1E4F1C430]];
    uint64_t v6 = [v4 indexOfObject:v5];
  }
  else
  {
    uint64_t v6 = -1;
  }

  return v6;
}

@end
@interface UIDragBadge
@end

@implementation UIDragBadge

uint64_t __45___UIDragBadge__updateLabelTextFromItemCount__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  v1 = (void *)_MergedGlobals_5_6;
  _MergedGlobals_5_6 = (uint64_t)v0;

  v2 = [MEMORY[0x1E4F1CA20] currentLocale];
  [(id)_MergedGlobals_5_6 setLocale:v2];

  v3 = (void *)_MergedGlobals_5_6;
  return [v3 setNumberStyle:1];
}

@end
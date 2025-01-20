@interface WKProcessPool(Embeds)
+ (id)embedProcessPool;
@end

@implementation WKProcessPool(Embeds)

+ (id)embedProcessPool
{
  v0 = (void *)__embedProcessPool;
  if (!__embedProcessPool)
  {
    id v1 = objc_alloc_init(MEMORY[0x263F1FA28]);
    v2 = (void *)__embedProcessPool;
    __embedProcessPool = (uint64_t)v1;

    v3 = [(id)__embedProcessPool _configuration];
    [v3 setAlwaysRunsAtBackgroundPriority:1];

    v0 = (void *)__embedProcessPool;
  }
  return v0;
}

@end
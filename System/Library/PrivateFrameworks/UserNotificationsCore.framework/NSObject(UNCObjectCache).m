@interface NSObject(UNCObjectCache)
+ (UNCObjectCache)unc_objectCache;
- (uint64_t)unc_objectCache;
@end

@implementation NSObject(UNCObjectCache)

+ (UNCObjectCache)unc_objectCache
{
  id v1 = a1;
  objc_sync_enter(v1);
  objc_getAssociatedObject(v1, "UNCObjectCacheForClass");
  v2 = (UNCObjectCache *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v2 = objc_alloc_init(UNCObjectCache);
    objc_setAssociatedObject(v1, "UNCObjectCacheForClass", v2, (void *)0x301);
  }
  objc_sync_exit(v1);

  return v2;
}

- (uint64_t)unc_objectCache
{
  v0 = objc_opt_class();

  return objc_msgSend(v0, "unc_objectCache");
}

@end
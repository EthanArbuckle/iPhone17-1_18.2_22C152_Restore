@interface PHObject(PhotosUICore)
+ (void)_px_initializeUserInterfaceIdentifierCache;
- (id)_px_uniquedUserInterfaceIdentifier:()PhotosUICore;
- (id)px_opaqueIdentifier;
- (uint64_t)px_exportFolderName;
@end

@implementation PHObject(PhotosUICore)

- (id)px_opaqueIdentifier
{
  v2 = [a1 objectID];
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    v5 = [a1 userInterfaceIdentifier];
    objc_msgSend(a1, "_px_uniquedUserInterfaceIdentifier:", v5);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)_px_uniquedUserInterfaceIdentifier:()PhotosUICore
{
  id v3 = a3;
  objc_msgSend((id)objc_opt_class(), "_px_initializeUserInterfaceIdentifierCache");
  id v4 = (id)_PXUserInterfaceIdentifierCache;
  os_unfair_lock_lock((os_unfair_lock_t)&_PXUserInterfaceIdentifierCacheLock);
  id v5 = [v4 objectForKey:v3];
  os_unfair_lock_unlock((os_unfair_lock_t)&_PXUserInterfaceIdentifierCacheLock);
  if (!v5)
  {
    id v5 = v3;
    os_unfair_lock_lock((os_unfair_lock_t)&_PXUserInterfaceIdentifierCacheLock);
    [v4 setObject:v5 forKey:v5];
    os_unfair_lock_unlock((os_unfair_lock_t)&_PXUserInterfaceIdentifierCacheLock);
  }
  id v6 = v5;

  return v6;
}

+ (void)_px_initializeUserInterfaceIdentifierCache
{
  if (_px_initializeUserInterfaceIdentifierCache_onceToken != -1) {
    dispatch_once(&_px_initializeUserInterfaceIdentifierCache_onceToken, &__block_literal_global_182681);
  }
}

- (uint64_t)px_exportFolderName
{
  return 0;
}

@end
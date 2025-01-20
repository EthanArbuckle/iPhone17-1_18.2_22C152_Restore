@interface NSCache(NTKCacheAdditions)
- (id)ntkCachedObjectForKey:()NTKCacheAdditions creationBlock:;
- (id)ntkCachedObjectForKeyProvider:()NTKCacheAdditions creationBlock:;
@end

@implementation NSCache(NTKCacheAdditions)

- (id)ntkCachedObjectForKeyProvider:()NTKCacheAdditions creationBlock:
{
  id v6 = a4;
  v7 = [a3 ntkCacheableKey];
  v8 = [a1 ntkCachedObjectForKey:v7 creationBlock:v6];

  return v8;
}

- (id)ntkCachedObjectForKey:()NTKCacheAdditions creationBlock:
{
  id v6 = a3;
  v7 = a4;
  v8 = [a1 objectForKey:v6];
  v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    v7[2](v7);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    if (v10) {
      [a1 setObject:v10 forKey:v6];
    }
  }

  return v10;
}

@end
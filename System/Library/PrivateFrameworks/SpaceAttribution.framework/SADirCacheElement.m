@interface SADirCacheElement
+ (id)newWithBundleSet:(id)a3 purgeable:(BOOL)a4 cacheFolder:(BOOL)a5;
- (BOOL)cacheFolder;
- (BOOL)purgeable;
- (NSSet)bundlesSet;
- (void)setBundlesSet:(id)a3;
- (void)setCacheFolder:(BOOL)a3;
- (void)setPurgeable:(BOOL)a3;
@end

@implementation SADirCacheElement

+ (id)newWithBundleSet:(id)a3 purgeable:(BOOL)a4 cacheFolder:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v7 = a3;
  v8 = objc_opt_new();
  [v8 setBundlesSet:v7];

  [v8 setPurgeable:v6];
  [v8 setCacheFolder:v5];
  return v8;
}

- (NSSet)bundlesSet
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBundlesSet:(id)a3
{
}

- (BOOL)purgeable
{
  return self->_purgeable;
}

- (void)setPurgeable:(BOOL)a3
{
  self->_purgeable = a3;
}

- (BOOL)cacheFolder
{
  return self->_cacheFolder;
}

- (void)setCacheFolder:(BOOL)a3
{
  self->_cacheFolder = a3;
}

- (void).cxx_destruct
{
}

@end
@interface NSString(_ML3BaseMusicLibraryResourcesManager)
- (id)relativePathFromBasePath:()_ML3BaseMusicLibraryResourcesManager;
@end

@implementation NSString(_ML3BaseMusicLibraryResourcesManager)

- (id)relativePathFromBasePath:()_ML3BaseMusicLibraryResourcesManager
{
  id v4 = a3;
  v5 = [a1 stringByStandardizingPath];
  if ([v5 isAbsolutePath] && objc_msgSend(v5, "hasPrefix:", v4))
  {
    unint64_t v6 = [v4 length];
    if ([v5 length] <= v6) {
      unint64_t v7 = v6;
    }
    else {
      unint64_t v7 = v6 + 1;
    }
    uint64_t v8 = [v5 substringFromIndex:v7];

    v5 = (void *)v8;
  }

  return v5;
}

@end
@interface SBHAllNonDefaultIconGridSizeClassSet
- (BOOL)containsGridSizeClass:(id)a3;
- (BOOL)isAllNonDefaultGridSizeClassSet;
- (BOOL)isEmpty;
- (id)allGridSizeClassesInDomain:(id)a3;
- (id)description;
- (id)gridSizeClassGroups;
- (id)gridSizeClasses;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)count;
@end

@implementation SBHAllNonDefaultIconGridSizeClassSet

- (BOOL)containsGridSizeClass:(id)a3
{
  if (a3) {
    return [a3 isEqualToString:@"SBHIconGridSizeClassDefault"] ^ 1;
  }
  else {
    return 0;
  }
}

- (unint64_t)count
{
  return -1;
}

- (BOOL)isEmpty
{
  return 0;
}

- (id)gridSizeClasses
{
  return (id)[MEMORY[0x1E4F1CAD0] set];
}

- (id)gridSizeClassGroups
{
  return (id)[MEMORY[0x1E4F1CAD0] set];
}

- (BOOL)isAllNonDefaultGridSizeClassSet
{
  return 1;
}

- (id)allGridSizeClassesInDomain:(id)a3
{
  v3 = [a3 allNonDefaultGridSizeClasses];
  v4 = [v3 allGridSizeClasses];

  return v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return objc_alloc_init(SBHMutableAllNonDefaultIconGridSizeClassSet);
}

- (id)description
{
  return @"<SBHIconGridSizeClassSet: all non-default>";
}

@end
@interface SBHAllIconGridSizeClassSet
- (BOOL)containsGridSizeClass:(id)a3;
- (BOOL)isAllGridSizeClassSet;
- (BOOL)isEmpty;
- (id)allGridSizeClassesInDomain:(id)a3;
- (id)description;
- (id)gridSizeClassGroups;
- (id)gridSizeClasses;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)count;
@end

@implementation SBHAllIconGridSizeClassSet

- (BOOL)containsGridSizeClass:(id)a3
{
  return 1;
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

- (BOOL)isAllGridSizeClassSet
{
  return 1;
}

- (id)allGridSizeClassesInDomain:(id)a3
{
  v3 = [a3 allGridSizeClasses];
  v4 = [v3 allGridSizeClasses];

  return v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return objc_alloc_init(SBHMutableAllIconGridSizeClassSet);
}

- (id)description
{
  return @"<SBHIconGridSizeClassSet: all>";
}

@end
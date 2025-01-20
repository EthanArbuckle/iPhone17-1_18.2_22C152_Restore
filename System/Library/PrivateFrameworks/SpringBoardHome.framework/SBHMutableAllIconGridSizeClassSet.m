@interface SBHMutableAllIconGridSizeClassSet
- (BOOL)containsGridSizeClass:(id)a3;
- (id)description;
@end

@implementation SBHMutableAllIconGridSizeClassSet

- (BOOL)containsGridSizeClass:(id)a3
{
  id v4 = a3;
  v5 = [(SBHMutableIconGridSizeClassSet *)self _removedGridSizeClasses];
  char v6 = [v5 containsObject:v4];

  return v6 ^ 1;
}

- (id)description
{
  return @"<SBHMutableIconGridSizeClassSet: all>";
}

@end
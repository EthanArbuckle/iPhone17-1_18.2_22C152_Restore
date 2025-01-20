@interface SBHMutableAllNonDefaultIconGridSizeClassSet
- (BOOL)containsGridSizeClass:(id)a3;
- (id)description;
- (void)addGridSizeClass:(id)a3;
- (void)intersectGridSizeClassSet:(id)a3;
- (void)removeGridSizeClass:(id)a3;
- (void)unionGridSizeClassSet:(id)a3;
@end

@implementation SBHMutableAllNonDefaultIconGridSizeClassSet

- (void)addGridSizeClass:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!*(&self->super._containsAllNonDefaultGridSizeClasses + 1)
    && (!v4 || [v4 isEqualToString:@"SBHIconGridSizeClassDefault"]))
  {
    *(&self->super._containsAllNonDefaultGridSizeClasses + 1) = 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)SBHMutableAllNonDefaultIconGridSizeClassSet;
  [(SBHMutableIconGridSizeClassSet *)&v6 addGridSizeClass:v5];
}

- (void)removeGridSizeClass:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (*(&self->super._containsAllNonDefaultGridSizeClasses + 1)
    && (!v4 || [v4 isEqualToString:@"SBHIconGridSizeClassDefault"]))
  {
    *(&self->super._containsAllNonDefaultGridSizeClasses + 1) = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)SBHMutableAllNonDefaultIconGridSizeClassSet;
  [(SBHMutableIconGridSizeClassSet *)&v6 removeGridSizeClass:v5];
}

- (BOOL)containsGridSizeClass:(id)a3
{
  id v4 = a3;
  v5 = [(SBHMutableIconGridSizeClassSet *)self _removedGridSizeClasses];
  char v6 = [v5 containsObject:v4];

  BOOL v7 = (v6 & 1) == 0
    && (v4 && ![v4 isEqualToString:@"SBHIconGridSizeClassDefault"]
     || *(&self->super._containsAllNonDefaultGridSizeClasses + 1));

  return v7;
}

- (void)intersectGridSizeClassSet:(id)a3
{
  if ([a3 containsGridSizeClass:@"SBHIconGridSizeClassDefault"]) {
    *(&self->super._containsAllNonDefaultGridSizeClasses + 1) = 0;
  }
}

- (void)unionGridSizeClassSet:(id)a3
{
  if ([a3 containsGridSizeClass:@"SBHIconGridSizeClassDefault"]) {
    *(&self->super._containsAllNonDefaultGridSizeClasses + 1) = 1;
  }
}

- (id)description
{
  return @"<SBHMutableIconGridSizeClassSet: all non-default>";
}

@end
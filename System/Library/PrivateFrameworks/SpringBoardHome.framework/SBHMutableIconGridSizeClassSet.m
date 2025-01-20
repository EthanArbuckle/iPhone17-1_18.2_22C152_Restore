@interface SBHMutableIconGridSizeClassSet
- (BOOL)containsGridSizeClass:(id)a3;
- (NSSet)gridSizeClassGroups;
- (NSSet)gridSizeClasses;
- (SBHMutableIconGridSizeClassSet)initWithGridSizeClasses:(id)a3 gridSizeClassGroups:(id)a4;
- (SBHMutableIconGridSizeClassSet)initWithIconGridSizeClassSet:(id)a3;
- (id)_removedGridSizeClasses;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_replaceAllGridSizeClassesWithGridSizeClasses:(id)a3;
- (void)addGridSizeClass:(id)a3;
- (void)addGridSizeClassGroup:(id)a3;
- (void)intersectGridSizeClassSet:(id)a3;
- (void)removeGridSizeClass:(id)a3;
- (void)setGridSizeClassGroups:(id)a3;
- (void)setGridSizeClasses:(id)a3;
- (void)unionGridSizeClassSet:(id)a3;
@end

@implementation SBHMutableIconGridSizeClassSet

- (SBHMutableIconGridSizeClassSet)initWithGridSizeClasses:(id)a3 gridSizeClassGroups:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SBHMutableIconGridSizeClassSet;
  v8 = [(SBHIconGridSizeClassSet *)&v14 initWithGridSizeClasses:v6 gridSizeClassGroups:v7];
  if (v8)
  {
    uint64_t v9 = [v6 mutableCopy];
    gridSizeClasses = v8->_gridSizeClasses;
    v8->_gridSizeClasses = (NSMutableSet *)v9;

    uint64_t v11 = [v7 mutableCopy];
    gridSizeClassGroups = v8->_gridSizeClassGroups;
    v8->_gridSizeClassGroups = (NSMutableSet *)v11;
  }
  return v8;
}

- (SBHMutableIconGridSizeClassSet)initWithIconGridSizeClassSet:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBHMutableIconGridSizeClassSet;
  v5 = [(SBHIconGridSizeClassSet *)&v10 initWithIconGridSizeClassSet:v4];
  if (v5)
  {
    id v6 = [v4 _removedGridSizeClasses];
    uint64_t v7 = [v6 mutableCopy];
    removedGridSizeClasses = v5->_removedGridSizeClasses;
    v5->_removedGridSizeClasses = (NSMutableSet *)v7;
  }
  return v5;
}

- (NSSet)gridSizeClasses
{
  v2 = (void *)[(NSMutableSet *)self->_gridSizeClasses copy];
  return (NSSet *)v2;
}

- (void)setGridSizeClasses:(id)a3
{
  id v6 = a3;
  if ((BSEqualSets() & 1) == 0)
  {
    id v4 = (NSMutableSet *)[v6 mutableCopy];
    gridSizeClasses = self->_gridSizeClasses;
    self->_gridSizeClasses = v4;
  }
}

- (void)addGridSizeClass:(id)a3
{
}

- (void)removeGridSizeClass:(id)a3
{
  id v7 = a3;
  -[NSMutableSet removeObject:](self->_gridSizeClasses, "removeObject:");
  removedGridSizeClasses = self->_removedGridSizeClasses;
  if (!removedGridSizeClasses)
  {
    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v6 = self->_removedGridSizeClasses;
    self->_removedGridSizeClasses = v5;

    removedGridSizeClasses = self->_removedGridSizeClasses;
  }
  [(NSMutableSet *)removedGridSizeClasses addObject:v7];
}

- (NSSet)gridSizeClassGroups
{
  v2 = (void *)[(NSMutableSet *)self->_gridSizeClassGroups copy];
  return (NSSet *)v2;
}

- (void)setGridSizeClassGroups:(id)a3
{
  id v6 = a3;
  if ((BSEqualSets() & 1) == 0)
  {
    id v4 = (NSMutableSet *)[v6 mutableCopy];
    gridSizeClassGroups = self->_gridSizeClassGroups;
    self->_gridSizeClassGroups = v4;
  }
}

- (void)addGridSizeClassGroup:(id)a3
{
}

- (BOOL)containsGridSizeClass:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SBHMutableIconGridSizeClassSet;
  if ([(SBHIconGridSizeClassSet *)&v7 containsGridSizeClass:v4]
    || self->_containsAllGridSizeClasses)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    LOBYTE(v5) = 0;
    if (v4 && self->_containsAllNonDefaultGridSizeClasses) {
      int v5 = [v4 isEqualToString:@"SBHIconGridSizeClassDefault"] ^ 1;
    }
  }

  return v5;
}

- (void)unionGridSizeClassSet:(id)a3
{
  id v8 = a3;
  if ([v8 isAllGridSizeClassSet])
  {
    uint64_t v4 = 32;
LABEL_5:
    *((unsigned char *)&self->super.super.isa + v4) = 1;
    goto LABEL_7;
  }
  if ([v8 isAllNonDefaultGridSizeClassSet])
  {
    uint64_t v4 = 33;
    goto LABEL_5;
  }
  int v5 = [(SBHIconGridSizeClassSet *)self allGridSizeClasses];
  id v6 = [v8 allGridSizeClasses];
  objc_super v7 = (void *)[v5 mutableCopy];
  [v7 unionSet:v6];
  [(SBHMutableIconGridSizeClassSet *)self _replaceAllGridSizeClassesWithGridSizeClasses:v7];

LABEL_7:
}

- (void)intersectGridSizeClassSet:(id)a3
{
  id v7 = a3;
  if (([v7 isAllGridSizeClassSet] & 1) == 0)
  {
    self->_containsAllGridSizeClasses = 0;
    self->_containsAllNonDefaultGridSizeClasses = 0;
    uint64_t v4 = [(SBHIconGridSizeClassSet *)self allGridSizeClasses];
    int v5 = [v7 allGridSizeClasses];
    id v6 = (void *)[v4 mutableCopy];
    if ([v7 isAllNonDefaultGridSizeClassSet]) {
      [v6 removeObject:@"SBHIconGridSizeClassDefault"];
    }
    else {
      [v6 intersectSet:v5];
    }
    [(SBHMutableIconGridSizeClassSet *)self _replaceAllGridSizeClassesWithGridSizeClasses:v6];
  }
}

- (id)_removedGridSizeClasses
{
  return self->_removedGridSizeClasses;
}

- (void)_replaceAllGridSizeClassesWithGridSizeClasses:(id)a3
{
  removedGridSizeClasses = self->_removedGridSizeClasses;
  id v5 = a3;
  [(NSMutableSet *)removedGridSizeClasses removeAllObjects];
  [(NSMutableSet *)self->_gridSizeClassGroups removeAllObjects];
  [(NSMutableSet *)self->_gridSizeClasses setSet:v5];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = +[SBHIconGridSizeClassSet allocWithZone:a3];
  return [(SBHImmutableIconGridSizeClassSet *)v4 initWithIconGridSizeClassSet:self];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gridSizeClassGroups, 0);
  objc_storeStrong((id *)&self->_removedGridSizeClasses, 0);
  objc_storeStrong((id *)&self->_gridSizeClasses, 0);
}

@end
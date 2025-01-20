@interface SBHImmutableIconGridSizeClassSet
- (NSSet)_removedGridSizeClasses;
- (SBHImmutableIconGridSizeClassSet)initWithGridSizeClasses:(id)a3 gridSizeClassGroups:(id)a4;
- (SBHImmutableIconGridSizeClassSet)initWithIconGridSizeClassSet:(id)a3;
- (id)gridSizeClassGroups;
- (id)gridSizeClasses;
@end

@implementation SBHImmutableIconGridSizeClassSet

- (id)gridSizeClasses
{
  return self->_gridSizeClasses;
}

- (id)gridSizeClassGroups
{
  return self->_gridSizeClassGroups;
}

- (NSSet)_removedGridSizeClasses
{
  return self->_removedGridSizeClasses;
}

- (SBHImmutableIconGridSizeClassSet)initWithGridSizeClasses:(id)a3 gridSizeClassGroups:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SBHImmutableIconGridSizeClassSet;
  v8 = [(SBHIconGridSizeClassSet *)&v14 initWithGridSizeClasses:v6 gridSizeClassGroups:v7];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    gridSizeClasses = v8->_gridSizeClasses;
    v8->_gridSizeClasses = (NSSet *)v9;

    uint64_t v11 = [v7 copy];
    gridSizeClassGroups = v8->_gridSizeClassGroups;
    v8->_gridSizeClassGroups = (NSSet *)v11;
  }
  return v8;
}

- (SBHImmutableIconGridSizeClassSet)initWithIconGridSizeClassSet:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBHImmutableIconGridSizeClassSet;
  v5 = [(SBHIconGridSizeClassSet *)&v10 initWithIconGridSizeClassSet:v4];
  if (v5)
  {
    id v6 = [v4 _removedGridSizeClasses];
    uint64_t v7 = [v6 copy];
    removedGridSizeClasses = v5->_removedGridSizeClasses;
    v5->_removedGridSizeClasses = (NSSet *)v7;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removedGridSizeClasses, 0);
  objc_storeStrong((id *)&self->_gridSizeClassGroups, 0);
  objc_storeStrong((id *)&self->_gridSizeClasses, 0);
}

@end
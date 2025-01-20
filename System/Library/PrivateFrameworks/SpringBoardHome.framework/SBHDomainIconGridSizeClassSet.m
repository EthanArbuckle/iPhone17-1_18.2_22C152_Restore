@interface SBHDomainIconGridSizeClassSet
- (BOOL)containsGridSizeClass:(id)a3 inDomain:(id)a4;
- (SBHDomainIconGridSizeClassSet)initWithGridSizeClassDomain:(id)a3;
- (SBHDomainIconGridSizeClassSet)initWithGridSizeClassDomain:(id)a3 filter:(id)a4;
- (SBHIconGridSizeClassDomain)gridSizeClassDomain;
- (id)filter;
- (id)gridSizeClassGroups;
- (id)gridSizeClasses;
@end

@implementation SBHDomainIconGridSizeClassSet

- (SBHDomainIconGridSizeClassSet)initWithGridSizeClassDomain:(id)a3
{
  return [(SBHDomainIconGridSizeClassSet *)self initWithGridSizeClassDomain:a3 filter:0];
}

- (SBHDomainIconGridSizeClassSet)initWithGridSizeClassDomain:(id)a3 filter:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [MEMORY[0x1E4F1CAD0] set];
  v10 = [MEMORY[0x1E4F1CAD0] set];
  v15.receiver = self;
  v15.super_class = (Class)SBHDomainIconGridSizeClassSet;
  v11 = [(SBHIconGridSizeClassSet *)&v15 initWithGridSizeClasses:v9 gridSizeClassGroups:v10];

  if (v11)
  {
    objc_storeStrong((id *)&v11->_gridSizeClassDomain, a3);
    uint64_t v12 = [v8 copy];
    id filter = v11->_filter;
    v11->_id filter = (id)v12;
  }
  return v11;
}

- (id)gridSizeClasses
{
  v3 = [(SBHDomainIconGridSizeClassSet *)self gridSizeClassDomain];
  v4 = [(SBHDomainIconGridSizeClassSet *)self filter];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __48__SBHDomainIconGridSizeClassSet_gridSizeClasses__block_invoke;
  v11[3] = &unk_1E6AB0880;
  id v13 = v4;
  id v6 = v5;
  id v12 = v6;
  id v7 = v4;
  [v3 enumerateGridSizeClassesUsingBlock:v11];
  id v8 = v12;
  id v9 = v6;

  return v9;
}

uint64_t __48__SBHDomainIconGridSizeClassSet_gridSizeClasses__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 40);
  id v7 = v3;
  if (!v4 || (int v5 = (*(uint64_t (**)(uint64_t, id))(v4 + 16))(v4, v3), v3 = v7, v5)) {
    [*(id *)(a1 + 32) addObject:v3];
  }
  return MEMORY[0x1F4181820]();
}

- (id)gridSizeClassGroups
{
  return (id)[MEMORY[0x1E4F1CAD0] set];
}

- (BOOL)containsGridSizeClass:(id)a3 inDomain:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(SBHDomainIconGridSizeClassSet *)self filter];
  id v9 = (void *)v8;
  if (v8 && !(*(unsigned int (**)(uint64_t, id))(v8 + 16))(v8, v6)) {
    char v10 = 0;
  }
  else {
    char v10 = [v7 containsGridSizeClass:v6];
  }

  return v10;
}

- (SBHIconGridSizeClassDomain)gridSizeClassDomain
{
  return self->_gridSizeClassDomain;
}

- (id)filter
{
  return self->_filter;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_filter, 0);
  objc_storeStrong((id *)&self->_gridSizeClassDomain, 0);
}

@end
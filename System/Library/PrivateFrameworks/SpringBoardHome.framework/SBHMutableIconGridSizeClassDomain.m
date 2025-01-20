@interface SBHMutableIconGridSizeClassDomain
- (SBHIconGridSizeClassDomain)fallbackDomain;
- (SBHMutableIconGridSizeClassDomain)initWithGridSizeClasses:(id)a3 order:(id)a4 fallbackDomain:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)registeredGridSizeClassOrder;
- (id)registeredGridSizeClasses;
- (void)registerIconGridSizeClass:(id)a3 info:(id)a4;
- (void)registerIconGridSizeClasses:(id)a3;
- (void)setFallbackDomain:(id)a3;
@end

@implementation SBHMutableIconGridSizeClassDomain

- (id)registeredGridSizeClasses
{
  return self->_registeredClasses;
}

- (SBHIconGridSizeClassDomain)fallbackDomain
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_fallbackDomain);
  return (SBHIconGridSizeClassDomain *)WeakRetained;
}

- (SBHMutableIconGridSizeClassDomain)initWithGridSizeClasses:(id)a3 order:(id)a4 fallbackDomain:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SBHMutableIconGridSizeClassDomain;
  v11 = [(SBHIconGridSizeClassDomain *)&v17 initWithGridSizeClasses:v8 order:v9 fallbackDomain:v10];
  if (v11)
  {
    uint64_t v12 = [v8 mutableCopy];
    registeredClasses = v11->_registeredClasses;
    v11->_registeredClasses = (NSMutableDictionary *)v12;

    uint64_t v14 = [v9 mutableCopy];
    registeredOrder = v11->_registeredOrder;
    v11->_registeredOrder = (NSMutableArray *)v14;

    objc_storeWeak((id *)&v11->_fallbackDomain, v10);
  }

  return v11;
}

- (id)registeredGridSizeClassOrder
{
  return self->_registeredOrder;
}

- (void)registerIconGridSizeClass:(id)a3 info:(id)a4
{
  registeredClasses = self->_registeredClasses;
  id v8 = a3;
  v7 = (void *)[a4 copy];
  [(NSMutableDictionary *)registeredClasses setObject:v7 forKey:v8];

  [(NSMutableArray *)self->_registeredOrder addObject:v8];
}

- (void)registerIconGridSizeClasses:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __65__SBHMutableIconGridSizeClassDomain_registerIconGridSizeClasses___block_invoke;
  v3[3] = &unk_1E6AB0998;
  v3[4] = self;
  [a3 enumerateKeysAndObjectsUsingBlock:v3];
}

uint64_t __65__SBHMutableIconGridSizeClassDomain_registerIconGridSizeClasses___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) registerIconGridSizeClass:a2 info:a3];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [SBHImmutableIconGridSizeClassDomain alloc];
  return [(SBHIconGridSizeClassDomain *)v4 initWithIconGridSizeClassDomain:self];
}

- (void)setFallbackDomain:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_fallbackDomain);
  objc_storeStrong((id *)&self->_registeredClasses, 0);
  objc_storeStrong((id *)&self->_registeredOrder, 0);
}

@end
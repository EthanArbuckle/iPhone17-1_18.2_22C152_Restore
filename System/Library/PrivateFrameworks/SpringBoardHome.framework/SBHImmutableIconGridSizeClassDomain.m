@interface SBHImmutableIconGridSizeClassDomain
- (SBHImmutableIconGridSizeClassDomain)initWithGridSizeClasses:(id)a3 order:(id)a4 fallbackDomain:(id)a5;
- (id)fallbackDomain;
- (id)registeredGridSizeClassOrder;
- (id)registeredGridSizeClasses;
@end

@implementation SBHImmutableIconGridSizeClassDomain

- (id)registeredGridSizeClasses
{
  return self->_registeredClasses;
}

- (SBHImmutableIconGridSizeClassDomain)initWithGridSizeClasses:(id)a3 order:(id)a4 fallbackDomain:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SBHImmutableIconGridSizeClassDomain;
  v11 = [(SBHIconGridSizeClassDomain *)&v17 initWithGridSizeClasses:v8 order:v9 fallbackDomain:v10];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    registeredClasses = v11->_registeredClasses;
    v11->_registeredClasses = (NSDictionary *)v12;

    uint64_t v14 = [v9 copy];
    registeredOrder = v11->_registeredOrder;
    v11->_registeredOrder = (NSArray *)v14;

    objc_storeWeak((id *)&v11->_fallbackDomain, v10);
  }

  return v11;
}

- (id)registeredGridSizeClassOrder
{
  return self->_registeredOrder;
}

- (id)fallbackDomain
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_fallbackDomain);
  return WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_fallbackDomain);
  objc_storeStrong((id *)&self->_registeredClasses, 0);
  objc_storeStrong((id *)&self->_registeredOrder, 0);
}

@end
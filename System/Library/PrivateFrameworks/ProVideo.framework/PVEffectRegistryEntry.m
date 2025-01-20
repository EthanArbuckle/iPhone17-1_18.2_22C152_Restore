@interface PVEffectRegistryEntry
- (Class)effectClass;
- (PVEffectRegistryEntry)initWithClass:(Class)a3 andProperties:(id)a4;
- (id)effectProperties;
- (void)dealloc;
@end

@implementation PVEffectRegistryEntry

- (PVEffectRegistryEntry)initWithClass:(Class)a3 andProperties:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PVEffectRegistryEntry;
  v8 = [(PVEffectRegistryEntry *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_effectClass = a3;
    objc_storeStrong((id *)&v8->_effectProperties, a4);
  }

  return v9;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)PVEffectRegistryEntry;
  [(PVEffectRegistryEntry *)&v2 dealloc];
}

- (Class)effectClass
{
  return self->_effectClass;
}

- (id)effectProperties
{
  return self->_effectProperties;
}

- (void).cxx_destruct
{
}

@end
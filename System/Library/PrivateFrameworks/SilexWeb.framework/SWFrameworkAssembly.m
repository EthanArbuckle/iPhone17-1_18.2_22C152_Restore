@interface SWFrameworkAssembly
- (NSArray)assemblies;
- (SWFrameworkAssembly)init;
@end

@implementation SWFrameworkAssembly

- (NSArray)assemblies
{
  return self->_assemblies;
}

- (void).cxx_destruct
{
}

- (SWFrameworkAssembly)init
{
  v13[6] = *MEMORY[0x263EF8340];
  v12.receiver = self;
  v12.super_class = (Class)SWFrameworkAssembly;
  v2 = [(SWFrameworkAssembly *)&v12 init];
  if (v2)
  {
    SWSetupLogging();
    v3 = objc_alloc_init(SWCoreAssembly);
    v13[0] = v3;
    v4 = objc_alloc_init(SWFactoryAssembly);
    v13[1] = v4;
    v5 = objc_alloc_init(SWManagerAssembly);
    v13[2] = v5;
    v6 = objc_alloc_init(SWProviderAssembly);
    v13[3] = v6;
    v7 = objc_alloc_init(SWSetupAssembly);
    v13[4] = v7;
    v8 = objc_alloc_init(SWViewControllerAssembly);
    v13[5] = v8;
    uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:6];
    assemblies = v2->_assemblies;
    v2->_assemblies = (NSArray *)v9;
  }
  return v2;
}

@end
@interface NUApplicationFrameworkAssembly
- (NSArray)assemblies;
- (NUApplicationFrameworkAssembly)init;
@end

@implementation NUApplicationFrameworkAssembly

- (NSArray)assemblies
{
  return self->_assemblies;
}

- (NUApplicationFrameworkAssembly)init
{
  v11[4] = *MEMORY[0x263EF8340];
  v10.receiver = self;
  v10.super_class = (Class)NUApplicationFrameworkAssembly;
  v2 = [(NUApplicationFrameworkAssembly *)&v10 init];
  if (v2)
  {
    v3 = objc_alloc_init(NUCoreAssembly);
    v11[0] = v3;
    v4 = objc_alloc_init(NUArticleAssembly);
    v11[1] = v4;
    v5 = objc_alloc_init(NUApplicationAssembly);
    v11[2] = v5;
    v6 = objc_alloc_init(NUManagerAssembly);
    v11[3] = v6;
    uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:4];
    assemblies = v2->_assemblies;
    v2->_assemblies = (NSArray *)v7;
  }
  return v2;
}

- (void).cxx_destruct
{
}

@end
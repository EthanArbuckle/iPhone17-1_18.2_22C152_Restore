@interface NUExtensionFrameworkAssembly
- (NSArray)assemblies;
- (NUExtensionFrameworkAssembly)initWithExtensionContextProvider:(id)a3;
@end

@implementation NUExtensionFrameworkAssembly

- (NUExtensionFrameworkAssembly)initWithExtensionContextProvider:(id)a3
{
  v17[4] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)NUExtensionFrameworkAssembly;
  v5 = [(NUExtensionFrameworkAssembly *)&v16 init];
  if (v5)
  {
    v6 = (NSArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    id v7 = objc_alloc_init(MEMORY[0x263F6C5F8]);
    v8 = [v7 assemblies];
    [(NSArray *)v6 addObjectsFromArray:v8];

    v9 = objc_alloc_init(NUCoreAssembly);
    v17[0] = v9;
    v10 = objc_alloc_init(NUArticleAssembly);
    v17[1] = v10;
    v11 = [[NUExtensionAssembly alloc] initWithExtensionContextProvider:v4];
    v17[2] = v11;
    v12 = objc_alloc_init(NUManagerAssembly);
    v17[3] = v12;
    v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:4];
    [(NSArray *)v6 addObjectsFromArray:v13];

    assemblies = v5->_assemblies;
    v5->_assemblies = v6;
  }
  return v5;
}

- (NSArray)assemblies
{
  return self->_assemblies;
}

- (void).cxx_destruct
{
}

@end
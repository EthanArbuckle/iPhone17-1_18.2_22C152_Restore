@interface SNAssembly
- (NSArray)assemblies;
- (SNAssembly)init;
@end

@implementation SNAssembly

- (NSArray)assemblies
{
  return self->_assemblies;
}

- (SNAssembly)init
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)SNAssembly;
  v2 = [(SNAssembly *)&v7 init];
  if (v2)
  {
    v3 = objc_alloc_init(SNTestAssembly);
    v8[0] = v3;
    uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    assemblies = v2->_assemblies;
    v2->_assemblies = (NSArray *)v4;
  }
  return v2;
}

- (void).cxx_destruct
{
}

@end
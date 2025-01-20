@interface PGGraphBelongsToEdgeCollection
+ (Class)edgeClass;
- (void)enumerateImportancesUsingBlock:(id)a3;
@end

@implementation PGGraphBelongsToEdgeCollection

+ (Class)edgeClass
{
  return (Class)objc_opt_class();
}

- (void)enumerateImportancesUsingBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__PGGraphBelongsToEdgeCollection_enumerateImportancesUsingBlock___block_invoke;
  v6[3] = &unk_1E68EEDE0;
  id v7 = v4;
  id v5 = v4;
  [(MAEdgeCollection *)self enumerateDoublePropertyValuesForKey:@"importance" withBlock:v6];
}

uint64_t __65__PGGraphBelongsToEdgeCollection_enumerateImportancesUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end
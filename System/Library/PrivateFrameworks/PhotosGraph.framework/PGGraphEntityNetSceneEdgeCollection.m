@interface PGGraphEntityNetSceneEdgeCollection
+ (Class)edgeClass;
- (unint64_t)numberOfSearchConfidenceAssets;
@end

@implementation PGGraphEntityNetSceneEdgeCollection

+ (Class)edgeClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)numberOfSearchConfidenceAssets
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __69__PGGraphEntityNetSceneEdgeCollection_numberOfSearchConfidenceAssets__block_invoke;
  v4[3] = &unk_1E68EFAB8;
  v4[4] = &v5;
  [(MAEdgeCollection *)self enumerateUnsignedIntegerPropertyValuesForKey:@"numberOfSearchConfidenceAssets" withBlock:v4];
  unint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __69__PGGraphEntityNetSceneEdgeCollection_numberOfSearchConfidenceAssets__block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) += a3;
  return result;
}

@end
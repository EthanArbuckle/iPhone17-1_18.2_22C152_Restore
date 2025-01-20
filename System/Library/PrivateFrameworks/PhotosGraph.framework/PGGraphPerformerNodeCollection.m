@interface PGGraphPerformerNodeCollection
+ (Class)nodeClass;
- (NSSet)performerIdentifiers;
- (PGGraphFeatureNodeCollection)featureNodeCollection;
@end

@implementation PGGraphPerformerNodeCollection

- (PGGraphFeatureNodeCollection)featureNodeCollection
{
  return +[PGGraphFeatureNodeCollection featureNodeCollectionWithCollection:self];
}

- (NSSet)performerIdentifiers
{
  v3 = [MEMORY[0x1E4F1CA80] set];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__PGGraphPerformerNodeCollection_performerIdentifiers__block_invoke;
  v6[3] = &unk_1E68F1988;
  id v4 = v3;
  id v7 = v4;
  [(MANodeCollection *)self enumerateStringPropertyValuesForKey:@"id" withBlock:v6];

  return (NSSet *)v4;
}

uint64_t __54__PGGraphPerformerNodeCollection_performerIdentifiers__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

+ (Class)nodeClass
{
  return (Class)objc_opt_class();
}

@end
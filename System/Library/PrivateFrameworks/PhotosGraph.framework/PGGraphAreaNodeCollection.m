@interface PGGraphAreaNodeCollection
+ (Class)nodeClass;
+ (id)areaNodesForNames:(id)a3 inGraph:(id)a4;
+ (id)areaNodesWithCIDINames:(id)a3 inGraph:(id)a4;
- (PGGraphAddressNodeCollection)addressNodes;
- (PGGraphFeatureNodeCollection)featureNodeCollection;
- (id)names;
- (id)nonBlockedAreaNodes;
- (void)enumerateIdentifiersSortedByPopularityScoreWithBlock:(id)a3;
- (void)enumeratePopularityScoresUsingBlock:(id)a3;
@end

@implementation PGGraphAreaNodeCollection

- (void)enumeratePopularityScoresUsingBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__PGGraphAreaNodeCollection_enumeratePopularityScoresUsingBlock___block_invoke;
  v6[3] = &unk_1E68EEDE0;
  id v7 = v4;
  id v5 = v4;
  [(MANodeCollection *)self enumerateDoublePropertyValuesForKey:@"popularityScore" withBlock:v6];
}

uint64_t __65__PGGraphAreaNodeCollection_enumeratePopularityScoresUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)enumerateIdentifiersSortedByPopularityScoreWithBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __82__PGGraphAreaNodeCollection_enumerateIdentifiersSortedByPopularityScoreWithBlock___block_invoke;
  v6[3] = &unk_1E68EEDB8;
  id v7 = v4;
  id v5 = v4;
  [(MANodeCollection *)self enumerateNodesAsCollectionsSortedByDoublePropertyForName:@"popularityScore" ascending:0 usingBlock:v6];
}

void __82__PGGraphAreaNodeCollection_enumerateIdentifiersSortedByPopularityScoreWithBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = [a2 elementIdentifiers];
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v4, [v5 firstElement], a3);
}

- (id)nonBlockedAreaNodes
{
  v3 = +[PGGraphAreaNode nonBlockedFilter];
  uint64_t v4 = [v3 relation];
  id v5 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v4];

  return v5;
}

- (PGGraphFeatureNodeCollection)featureNodeCollection
{
  return +[PGGraphFeatureNodeCollection featureNodeCollectionWithCollection:self];
}

- (id)names
{
  v3 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", -[MAElementCollection count](self, "count"));
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __34__PGGraphAreaNodeCollection_names__block_invoke;
  v6[3] = &unk_1E68F1988;
  id v4 = v3;
  id v7 = v4;
  [(MANodeCollection *)self enumerateStringPropertyValuesForKey:@"name" withBlock:v6];

  return v4;
}

void __34__PGGraphAreaNodeCollection_names__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if ([v4 length]) {
    [*(id *)(a1 + 32) addObject:v4];
  }
}

- (PGGraphAddressNodeCollection)addressNodes
{
  v3 = +[PGGraphAreaNode addressOfArea];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphAddressNodeCollection *)v4;
}

+ (id)areaNodesWithCIDINames:(id)a3 inGraph:(id)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  v8 = +[PGGraphAreaNode filter];
  v14 = @"name";
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F71E28]) initWithComparator:8 value:v7];

  v15[0] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  v11 = [v8 filterBySettingProperties:v10];

  v12 = [a1 nodesMatchingFilter:v11 inGraph:v6];

  return v12;
}

+ (id)areaNodesForNames:(id)a3 inGraph:(id)a4
{
  id v6 = a4;
  id v7 = +[PGGraphAreaNode filterWithNames:a3];
  v8 = [a1 nodesMatchingFilter:v7 inGraph:v6];

  return v8;
}

+ (Class)nodeClass
{
  return (Class)objc_opt_class();
}

@end
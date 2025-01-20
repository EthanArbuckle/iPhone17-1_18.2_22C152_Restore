@interface PGGraphPetNodeCollection
+ (Class)nodeClass;
+ (id)namedPetNodesInGraph:(id)a3;
+ (id)petNodesForLocalIdentifier:(id)a3 inGraph:(id)a4;
+ (id)petNodesForLocalIdentifiers:(id)a3 inGraph:(id)a4;
+ (id)petNodesForSpecies:(unint64_t)a3 inGraph:(id)a4;
- (NSSet)localIdentifiers;
- (NSSet)names;
- (NSSet)uuids;
- (PGGraphFeatureNodeCollection)featureNodeCollection;
- (PGGraphMomentNodeCollection)momentNodes;
- (PGGraphPersonNodeCollection)ownerNodes;
@end

@implementation PGGraphPetNodeCollection

- (NSSet)names
{
  v3 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", -[MAElementCollection count](self, "count"));
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __33__PGGraphPetNodeCollection_names__block_invoke;
  v6[3] = &unk_1E68F1988;
  id v4 = v3;
  id v7 = v4;
  [(MANodeCollection *)self enumerateStringPropertyValuesForKey:@"name" withBlock:v6];

  return (NSSet *)v4;
}

void __33__PGGraphPetNodeCollection_names__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if ([v4 length]) {
    [*(id *)(a1 + 32) addObject:v4];
  }
}

- (NSSet)uuids
{
  v3 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", -[MAElementCollection count](self, "count"));
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __33__PGGraphPetNodeCollection_uuids__block_invoke;
  v6[3] = &unk_1E68F1988;
  id v4 = v3;
  id v7 = v4;
  [(MANodeCollection *)self enumerateStringPropertyValuesForKey:@"localIdentifier" withBlock:v6];

  return (NSSet *)v4;
}

void __33__PGGraphPetNodeCollection_uuids__block_invoke(uint64_t a1)
{
  objc_msgSend(MEMORY[0x1E4F391F0], "uuidFromLocalIdentifier:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  if ([v2 length]) {
    [*(id *)(a1 + 32) addObject:v2];
  }
}

- (NSSet)localIdentifiers
{
  v3 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", -[MAElementCollection count](self, "count"));
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__PGGraphPetNodeCollection_localIdentifiers__block_invoke;
  v6[3] = &unk_1E68F1988;
  id v4 = v3;
  id v7 = v4;
  [(MANodeCollection *)self enumerateStringPropertyValuesForKey:@"localIdentifier" withBlock:v6];

  return (NSSet *)v4;
}

void __44__PGGraphPetNodeCollection_localIdentifiers__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if ([v4 length]) {
    [*(id *)(a1 + 32) addObject:v4];
  }
}

- (PGGraphFeatureNodeCollection)featureNodeCollection
{
  return +[PGGraphFeatureNodeCollection featureNodeCollectionWithCollection:self];
}

- (PGGraphPersonNodeCollection)ownerNodes
{
  v3 = +[PGGraphPetNode ownerOfPet];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphPersonNodeCollection *)v4;
}

- (PGGraphMomentNodeCollection)momentNodes
{
  v3 = +[PGGraphPetNode momentOfPet];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphMomentNodeCollection *)v4;
}

+ (id)namedPetNodesInGraph:(id)a3
{
  id v3 = a3;
  id v4 = +[PGGraphPetNode filterNameNotEmpty];
  v5 = +[MANodeCollection nodesMatchingFilter:v4 inGraph:v3];

  return v5;
}

+ (id)petNodesForSpecies:(unint64_t)a3 inGraph:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = +[PGGraphPetNode filter];
  v13 = @"anml";
  v8 = [NSNumber numberWithUnsignedInteger:a3];
  v14[0] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
  v10 = [v7 filterBySettingProperties:v9];

  v11 = [a1 nodesMatchingFilter:v10 inGraph:v6];

  return v11;
}

+ (id)petNodesForLocalIdentifier:(id)a3 inGraph:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  id v14 = a3;
  id v7 = (void *)MEMORY[0x1E4F1C978];
  id v8 = a4;
  id v9 = a3;
  v10 = [v7 arrayWithObjects:&v14 count:1];
  v11 = objc_msgSend(v6, "setWithArray:", v10, v14, v15);

  v12 = [a1 petNodesForLocalIdentifiers:v11 inGraph:v8];

  return v12;
}

+ (id)petNodesForLocalIdentifiers:(id)a3 inGraph:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = +[PGGraphPetNode filter];
  v13 = @"localIdentifier";
  v14[0] = v7;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];

  v10 = [v8 filterBySettingProperties:v9];

  v11 = [a1 nodesMatchingFilter:v10 inGraph:v6];

  return v11;
}

+ (Class)nodeClass
{
  return (Class)objc_opt_class();
}

@end
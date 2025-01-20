@interface PGGraphSocialGroupMemberNodeCollection
+ (id)memberNodesForLocalIdentifier:(id)a3 inGraph:(id)a4;
+ (id)memberNodesForLocalIdentifiers:(id)a3 inGraph:(id)a4;
- (NSArray)names;
- (NSSet)localIdentifiers;
- (NSSet)uuids;
- (PGGraphFeatureNodeCollection)featureNodeCollection;
- (PGGraphPersonNodeCollection)personNodes;
- (PGGraphPetNodeCollection)petNodes;
- (PGGraphSocialGroupNodeCollection)socialGroupNodes;
- (id)memberNodeByLocalIdentifier;
- (id)socialGroupOfMember;
@end

@implementation PGGraphSocialGroupMemberNodeCollection

- (id)memberNodeByLocalIdentifier
{
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", -[MAElementCollection count](self, "count"));
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __69__PGGraphSocialGroupMemberNodeCollection_memberNodeByLocalIdentifier__block_invoke;
  v6[3] = &unk_1E68F19B0;
  id v4 = v3;
  id v7 = v4;
  [(MANodeCollection *)self enumerateNodesUsingBlock:v6];

  return v4;
}

void __69__PGGraphSocialGroupMemberNodeCollection_memberNodeByLocalIdentifier__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v3 localIdentifier];
  [v2 setObject:v3 forKeyedSubscript:v4];
}

- (NSArray)names
{
  id v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[MAElementCollection count](self, "count"));
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__PGGraphSocialGroupMemberNodeCollection_names__block_invoke;
  v6[3] = &unk_1E68F1988;
  id v4 = v3;
  id v7 = v4;
  [(MANodeCollection *)self enumerateStringPropertyValuesForKey:@"name" withBlock:v6];

  return (NSArray *)v4;
}

void __47__PGGraphSocialGroupMemberNodeCollection_names__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v5 = a3;
  if ([(__CFString *)v5 length]) {
    id v4 = v5;
  }
  else {
    id v4 = @"Unnamed";
  }
  [*(id *)(a1 + 32) addObject:v4];
}

- (PGGraphPetNodeCollection)petNodes
{
  return (PGGraphPetNodeCollection *)+[PGGraphNodeCollection subsetInCollection:self];
}

- (PGGraphPersonNodeCollection)personNodes
{
  return (PGGraphPersonNodeCollection *)+[PGGraphNodeCollection subsetInCollection:self];
}

- (PGGraphSocialGroupNodeCollection)socialGroupNodes
{
  id v3 = [(PGGraphSocialGroupMemberNodeCollection *)self socialGroupOfMember];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphSocialGroupNodeCollection *)v4;
}

- (NSSet)uuids
{
  id v3 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", -[MAElementCollection count](self, "count"));
  id v4 = [(PGGraphSocialGroupMemberNodeCollection *)self personNodes];
  v5 = [v4 uuids];
  [v3 unionSet:v5];

  v6 = [(PGGraphSocialGroupMemberNodeCollection *)self petNodes];
  id v7 = [v6 uuids];
  [v3 unionSet:v7];

  return (NSSet *)v3;
}

- (NSSet)localIdentifiers
{
  id v3 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", -[MAElementCollection count](self, "count"));
  id v4 = [(PGGraphSocialGroupMemberNodeCollection *)self personNodes];
  v5 = [v4 localIdentifiers];
  [v3 unionSet:v5];

  v6 = [(PGGraphSocialGroupMemberNodeCollection *)self petNodes];
  id v7 = [v6 localIdentifiers];
  [v3 unionSet:v7];

  return (NSSet *)v3;
}

- (id)socialGroupOfMember
{
  v2 = +[PGGraphBelongsToEdge filter];
  id v3 = [v2 outRelation];

  return v3;
}

- (PGGraphFeatureNodeCollection)featureNodeCollection
{
  return +[PGGraphFeatureNodeCollection featureNodeCollectionWithCollection:self];
}

+ (id)memberNodesForLocalIdentifier:(id)a3 inGraph:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v6 = (void *)MEMORY[0x1E4F1CAD0];
  id v14 = a3;
  id v7 = (void *)MEMORY[0x1E4F1C978];
  id v8 = a4;
  id v9 = a3;
  v10 = [v7 arrayWithObjects:&v14 count:1];
  v11 = objc_msgSend(v6, "setWithArray:", v10, v14, v15);

  v12 = [a1 memberNodesForLocalIdentifiers:v11 inGraph:v8];

  return v12;
}

+ (id)memberNodesForLocalIdentifiers:(id)a3 inGraph:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[PGGraphPersonNodeCollection personNodesForLocalIdentifiers:v6 inGraph:v5];
  id v8 = +[PGGraphPetNodeCollection petNodesForLocalIdentifiers:v6 inGraph:v5];

  id v9 = [PGGraphSocialGroupMemberNodeCollection alloc];
  v10 = [v7 elementIdentifiers];
  v11 = [v8 elementIdentifiers];
  v12 = [v10 identifierSetByFormingUnion:v11];
  v13 = [(MAElementCollection *)v9 initWithGraph:v5 elementIdentifiers:v12];

  return v13;
}

@end
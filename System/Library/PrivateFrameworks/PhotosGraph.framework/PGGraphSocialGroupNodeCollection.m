@interface PGGraphSocialGroupNodeCollection
+ (Class)nodeClass;
+ (id)socialGroupNodeForSocialGroupIdentifier:(int64_t)a3 inGraph:(id)a4;
+ (id)socialGroupNodesForPersistedUUIDs:(id)a3 inGraph:(id)a4;
+ (id)userVerifiedSocialGroupNodesInGraph:(id)a3;
- (PGGraphFeatureNodeCollection)featureNodeCollection;
- (PGGraphMomentNodeCollection)momentNodes;
- (PGGraphPersonNodeCollection)personNodes;
- (PGGraphPetNodeCollection)petNodes;
- (PGGraphSocialGroupMemberNodeCollection)memberNodes;
- (void)enumerateImportancesUsingBlock:(id)a3;
- (void)enumerateSocialGroupIdentifiersUsingBlock:(id)a3;
@end

@implementation PGGraphSocialGroupNodeCollection

- (void)enumerateSocialGroupIdentifiersUsingBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __78__PGGraphSocialGroupNodeCollection_enumerateSocialGroupIdentifiersUsingBlock___block_invoke;
  v6[3] = &unk_1E68ED5A0;
  id v7 = v4;
  id v5 = v4;
  [(MANodeCollection *)self enumerateIntegerPropertyValuesForKey:@"id" withBlock:v6];
}

uint64_t __78__PGGraphSocialGroupNodeCollection_enumerateSocialGroupIdentifiersUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)enumerateImportancesUsingBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __67__PGGraphSocialGroupNodeCollection_enumerateImportancesUsingBlock___block_invoke;
  v6[3] = &unk_1E68EEDE0;
  id v7 = v4;
  id v5 = v4;
  [(MANodeCollection *)self enumerateDoublePropertyValuesForKey:@"importance" withBlock:v6];
}

uint64_t __67__PGGraphSocialGroupNodeCollection_enumerateImportancesUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (PGGraphFeatureNodeCollection)featureNodeCollection
{
  return +[PGGraphFeatureNodeCollection featureNodeCollectionWithCollection:self];
}

- (PGGraphPetNodeCollection)petNodes
{
  v3 = [PGGraphPetNodeCollection alloc];
  id v4 = [(MAElementCollection *)self graph];
  id v5 = [(PGGraphSocialGroupNodeCollection *)self memberNodes];
  v6 = +[PGGraphPetNode filter];
  id v7 = [v5 nodesMatchingFilter:v6];
  v8 = [v7 elementIdentifiers];
  v9 = [(MAElementCollection *)v3 initWithGraph:v4 elementIdentifiers:v8];

  return v9;
}

- (PGGraphPersonNodeCollection)personNodes
{
  v3 = [PGGraphPersonNodeCollection alloc];
  id v4 = [(MAElementCollection *)self graph];
  id v5 = [(PGGraphSocialGroupNodeCollection *)self memberNodes];
  v6 = +[PGGraphPersonNode filterIncludingMe];
  id v7 = [v5 nodesMatchingFilter:v6];
  v8 = [v7 elementIdentifiers];
  v9 = [(MAElementCollection *)v3 initWithGraph:v4 elementIdentifiers:v8];

  return v9;
}

- (PGGraphSocialGroupMemberNodeCollection)memberNodes
{
  v3 = +[PGGraphSocialGroupNode memberOfSocialGroup];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphSocialGroupMemberNodeCollection *)v4;
}

- (PGGraphMomentNodeCollection)momentNodes
{
  v3 = +[PGGraphSocialGroupNode momentOfSocialGroup];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphMomentNodeCollection *)v4;
}

+ (id)socialGroupNodesForPersistedUUIDs:(id)a3 inGraph:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  v8 = +[PGGraphSocialGroupNode filter];
  v13 = @"persistedUUID";
  v14[0] = v7;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];

  v10 = [v8 filterBySettingProperties:v9];

  v11 = [a1 nodesMatchingFilter:v10 inGraph:v6];

  return v11;
}

+ (id)userVerifiedSocialGroupNodesInGraph:(id)a3
{
  id v3 = a3;
  id v4 = +[PGGraphSocialGroupNode filterWithIsUserVerified:1];
  id v5 = +[MANodeCollection nodesMatchingFilter:v4 inGraph:v3];

  return v5;
}

+ (id)socialGroupNodeForSocialGroupIdentifier:(int64_t)a3 inGraph:(id)a4
{
  id v5 = a4;
  id v6 = +[PGGraphSocialGroupNode filterWithSocialGroupIdentifier:a3];
  id v7 = +[MANodeCollection nodesMatchingFilter:v6 inGraph:v5];

  return v7;
}

+ (Class)nodeClass
{
  return (Class)objc_opt_class();
}

@end
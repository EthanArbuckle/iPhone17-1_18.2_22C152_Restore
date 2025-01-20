@interface PGGraphPersonNodeCollection
+ (Class)nodeClass;
+ (id)favoritedPersonNodesExcludingMeInGraph:(id)a3;
+ (id)favoritedPersonNodesIncludingMeInGraph:(id)a3;
+ (id)namedPersonNodesInGraph:(id)a3;
+ (id)personNodesExcludingMeInGraph:(id)a3;
+ (id)personNodesForArrayOfLocalIdentifiers:(id)a3 inGraph:(id)a4;
+ (id)personNodesForContactIdentifiers:(id)a3 inGraph:(id)a4;
+ (id)personNodesForLocalIdentifier:(id)a3 inGraph:(id)a4;
+ (id)personNodesForLocalIdentifiers:(id)a3 inGraph:(id)a4;
+ (id)personNodesForShareParticipantIdentifiers:(id)a3 inGraph:(id)a4;
+ (id)personNodesForSharedLibraryParticipantsInGraph:(id)a3;
+ (id)personNodesInAgeCategories:(id)a3 includingMe:(BOOL)a4 inGraph:(id)a5;
+ (id)personNodesIncludingMeInGraph:(id)a3;
+ (id)personNodesWithName:(id)a3 inGraph:(id)a4;
+ (id)personNodesWithNames:(id)a3 inGraph:(id)a4;
+ (id)unnamedPersonNodesInGraph:(id)a3;
- (BOOL)containsMeNode;
- (NSSet)anniversaries;
- (NSSet)birthdays;
- (NSSet)contactIdentifiers;
- (NSSet)localIdentifiers;
- (NSSet)names;
- (NSSet)potentialBirthdays;
- (NSSet)uuids;
- (PGGraphFeatureNodeCollection)featureNodeCollection;
- (PGGraphHomeWorkNodeCollection)homeNodes;
- (PGGraphHomeWorkNodeCollection)homeOrWorkNodes;
- (PGGraphHomeWorkNodeCollection)workNodes;
- (PGGraphMomentNodeCollection)anniversaryMomentNodes;
- (PGGraphMomentNodeCollection)authoredMomentNodes;
- (PGGraphMomentNodeCollection)birthdayMomentNodes;
- (PGGraphMomentNodeCollection)momentNodes;
- (PGGraphMomentNodeCollection)momentNodesWithPresence;
- (PGGraphPersonNodeCollection)acquaintancePersonNodes;
- (PGGraphPersonNodeCollection)brotherPersonNodes;
- (PGGraphPersonNodeCollection)childPersonNodes;
- (PGGraphPersonNodeCollection)coworkerPersonNodes;
- (PGGraphPersonNodeCollection)daughterPersonNodes;
- (PGGraphPersonNodeCollection)familyPersonNodes;
- (PGGraphPersonNodeCollection)fatherPersonNodes;
- (PGGraphPersonNodeCollection)friendPersonNodes;
- (PGGraphPersonNodeCollection)inferredAcquaintancePersonNodes;
- (PGGraphPersonNodeCollection)inferredBrotherPersonNodes;
- (PGGraphPersonNodeCollection)inferredChildPersonNodes;
- (PGGraphPersonNodeCollection)inferredCoworkerPersonNodes;
- (PGGraphPersonNodeCollection)inferredDaughterPersonNodes;
- (PGGraphPersonNodeCollection)inferredFamilyPersonNodes;
- (PGGraphPersonNodeCollection)inferredFatherPersonNodes;
- (PGGraphPersonNodeCollection)inferredFriendPersonNodes;
- (PGGraphPersonNodeCollection)inferredMotherPersonNodes;
- (PGGraphPersonNodeCollection)inferredParentPersonNodes;
- (PGGraphPersonNodeCollection)inferredPartnerPersonNodes;
- (PGGraphPersonNodeCollection)inferredSisterPersonNodes;
- (PGGraphPersonNodeCollection)inferredSonPersonNodes;
- (PGGraphPersonNodeCollection)motherPersonNodes;
- (PGGraphPersonNodeCollection)parentPersonNodes;
- (PGGraphPersonNodeCollection)partnerPersonNodes;
- (PGGraphPersonNodeCollection)relatedPersonNodes;
- (PGGraphPersonNodeCollection)sisterPersonNodes;
- (PGGraphPersonNodeCollection)sonPersonNodes;
- (PGGraphPersonNodeCollection)subsetExcludingMe;
- (PGGraphPersonRelationshipTagNodeCollection)relationshipTagNodes;
- (PGGraphRelationshipEdgeCollection)relationshipEdges;
- (PGGraphRelationshipEdgeCollection)relationshipInEdges;
- (PGGraphRelationshipEdgeCollection)relationshipOutEdges;
- (PGGraphRelationshipTagEdgeCollection)relationshipTagEdges;
- (PGGraphSocialGroupMemberNodeCollection)asSocialGroupMemberNodeCollection;
- (PGGraphSocialGroupNodeCollection)socialGroupNodes;
- (PGGraphStorytellingRelationshipEdgeCollection)storytellingRelationshipEdges;
- (id)ownedPetNodes;
- (id)personNodeByLocalIdentifier;
- (id)relationshipTagNodesWithConfidence:(double)a3;
- (void)enumerateBiologicalSexUsingBlock:(id)a3;
- (void)enumerateLocalIdentifiersUsingBlock:(id)a3;
- (void)enumerateUUIDsUsingBlock:(id)a3;
@end

@implementation PGGraphPersonNodeCollection

- (PGGraphRelationshipTagEdgeCollection)relationshipTagEdges
{
  return (PGGraphRelationshipTagEdgeCollection *)+[PGGraphEdgeCollection edgesOfType:2 onNodes:self];
}

- (id)relationshipTagNodesWithConfidence:(double)a3
{
  v4 = +[PGGraphPersonNode relationshipTagOfPersonWithConfidence:a3];
  v5 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v4];

  return v5;
}

- (PGGraphPersonRelationshipTagNodeCollection)relationshipTagNodes
{
  v3 = +[PGGraphPersonNode relationshipTagOfPerson];
  v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphPersonRelationshipTagNodeCollection *)v4;
}

- (id)ownedPetNodes
{
  v3 = +[PGGraphIsOwnerOfPetEdge filter];
  v4 = [v3 outRelation];
  v5 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v4];

  return v5;
}

- (void)enumerateLocalIdentifiersUsingBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __67__PGGraphPersonNodeCollection_enumerateLocalIdentifiersUsingBlock___block_invoke;
  v6[3] = &unk_1E68EDC50;
  id v7 = v4;
  id v5 = v4;
  [(MANodeCollection *)self enumerateStringPropertyValuesForKey:@"id" withBlock:v6];
}

void __67__PGGraphPersonNodeCollection_enumerateLocalIdentifiersUsingBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if ([v4 length]) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)enumerateUUIDsUsingBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__PGGraphPersonNodeCollection_enumerateUUIDsUsingBlock___block_invoke;
  v6[3] = &unk_1E68EDC50;
  id v7 = v4;
  id v5 = v4;
  [(MANodeCollection *)self enumerateStringPropertyValuesForKey:@"id" withBlock:v6];
}

void __56__PGGraphPersonNodeCollection_enumerateUUIDsUsingBlock___block_invoke(uint64_t a1)
{
  objc_msgSend(MEMORY[0x1E4F391F0], "uuidFromLocalIdentifier:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  if ([v2 length]) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)enumerateBiologicalSexUsingBlock:(id)a3
{
}

- (BOOL)containsMeNode
{
  id v2 = +[PGGraphNodeCollection subsetInCollection:self];
  char v3 = [v2 isEmpty] ^ 1;

  return v3;
}

- (id)personNodeByLocalIdentifier
{
  char v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", -[MAElementCollection count](self, "count"));
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58__PGGraphPersonNodeCollection_personNodeByLocalIdentifier__block_invoke;
  v6[3] = &unk_1E68EF528;
  id v4 = v3;
  id v7 = v4;
  [(MANodeCollection *)self enumerateNodesUsingBlock:v6];

  return v4;
}

void __58__PGGraphPersonNodeCollection_personNodeByLocalIdentifier__block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v3 localIdentifier];
  [v2 setObject:v3 forKeyedSubscript:v4];
}

- (PGGraphFeatureNodeCollection)featureNodeCollection
{
  return +[PGGraphFeatureNodeCollection featureNodeCollectionWithCollection:self];
}

- (PGGraphRelationshipEdgeCollection)relationshipInEdges
{
  return (PGGraphRelationshipEdgeCollection *)+[PGGraphEdgeCollection edgesToNodes:self];
}

- (PGGraphRelationshipEdgeCollection)relationshipOutEdges
{
  return (PGGraphRelationshipEdgeCollection *)+[PGGraphEdgeCollection edgesFromNodes:self];
}

- (PGGraphRelationshipEdgeCollection)relationshipEdges
{
  return (PGGraphRelationshipEdgeCollection *)+[PGGraphEdgeCollection edgesOfType:3 onNodes:self];
}

- (PGGraphStorytellingRelationshipEdgeCollection)storytellingRelationshipEdges
{
  return (PGGraphStorytellingRelationshipEdgeCollection *)+[PGGraphEdgeCollection edgesOfType:1 onNodes:self];
}

- (NSSet)names
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __36__PGGraphPersonNodeCollection_names__block_invoke;
  v6[3] = &unk_1E68F1988;
  id v4 = v3;
  id v7 = v4;
  [(MANodeCollection *)self enumerateStringPropertyValuesForKey:@"name" withBlock:v6];

  return (NSSet *)v4;
}

uint64_t __36__PGGraphPersonNodeCollection_names__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

- (NSSet)anniversaries
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__PGGraphPersonNodeCollection_anniversaries__block_invoke;
  v6[3] = &unk_1E68E9A60;
  id v4 = v3;
  id v7 = v4;
  [(MANodeCollection *)self enumerateDoublePropertyValuesForKey:@"anniv" withBlock:v6];

  return (NSSet *)v4;
}

void __44__PGGraphPersonNodeCollection_anniversaries__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  objc_msgSend(NSNumber, "numberWithDouble:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 addObject:v2];
}

- (NSSet)potentialBirthdays
{
  id v3 = [MEMORY[0x1E4F1CA80] set];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__PGGraphPersonNodeCollection_potentialBirthdays__block_invoke;
  v6[3] = &unk_1E68E9A60;
  id v4 = v3;
  id v7 = v4;
  [(MANodeCollection *)self enumerateDoublePropertyValuesForKey:@"pbday" withBlock:v6];

  return (NSSet *)v4;
}

void __49__PGGraphPersonNodeCollection_potentialBirthdays__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  objc_msgSend(NSNumber, "numberWithDouble:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 addObject:v2];
}

- (NSSet)birthdays
{
  id v3 = [MEMORY[0x1E4F1CA80] set];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__PGGraphPersonNodeCollection_birthdays__block_invoke;
  v6[3] = &unk_1E68E9A60;
  id v4 = v3;
  id v7 = v4;
  [(MANodeCollection *)self enumerateDoublePropertyValuesForKey:@"bday" withBlock:v6];

  return (NSSet *)v4;
}

void __40__PGGraphPersonNodeCollection_birthdays__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  objc_msgSend(NSNumber, "numberWithDouble:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 addObject:v2];
}

- (NSSet)uuids
{
  id v3 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", -[MAElementCollection count](self, "count"));
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __36__PGGraphPersonNodeCollection_uuids__block_invoke;
  v6[3] = &unk_1E68F1988;
  id v4 = v3;
  id v7 = v4;
  [(MANodeCollection *)self enumerateStringPropertyValuesForKey:@"id" withBlock:v6];

  return (NSSet *)v4;
}

void __36__PGGraphPersonNodeCollection_uuids__block_invoke(uint64_t a1)
{
  objc_msgSend(MEMORY[0x1E4F391F0], "uuidFromLocalIdentifier:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  if ([v2 length]) {
    [*(id *)(a1 + 32) addObject:v2];
  }
}

- (NSSet)contactIdentifiers
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__PGGraphPersonNodeCollection_contactIdentifiers__block_invoke;
  v6[3] = &unk_1E68F1988;
  id v4 = v3;
  id v7 = v4;
  [(MANodeCollection *)self enumerateStringPropertyValuesForKey:@"cnid" withBlock:v6];

  return (NSSet *)v4;
}

void __49__PGGraphPersonNodeCollection_contactIdentifiers__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if ([v4 length]) {
    [*(id *)(a1 + 32) addObject:v4];
  }
}

- (NSSet)localIdentifiers
{
  id v3 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", -[MAElementCollection count](self, "count"));
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__PGGraphPersonNodeCollection_localIdentifiers__block_invoke;
  v6[3] = &unk_1E68F1988;
  id v4 = v3;
  id v7 = v4;
  [(MANodeCollection *)self enumerateStringPropertyValuesForKey:@"id" withBlock:v6];

  return (NSSet *)v4;
}

void __47__PGGraphPersonNodeCollection_localIdentifiers__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if ([v4 length]) {
    [*(id *)(a1 + 32) addObject:v4];
  }
}

- (PGGraphPersonNodeCollection)subsetExcludingMe
{
  id v3 = +[PGGraphPersonNode filterExcludingMe];
  id v4 = [v3 relation];
  id v5 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v4];

  return (PGGraphPersonNodeCollection *)v5;
}

- (PGGraphMomentNodeCollection)anniversaryMomentNodes
{
  id v3 = +[PGGraphPersonNode anniversaryMomentOfPerson];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphMomentNodeCollection *)v4;
}

- (PGGraphMomentNodeCollection)birthdayMomentNodes
{
  id v3 = +[PGGraphPersonNode birthdayMomentOfPerson];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphMomentNodeCollection *)v4;
}

- (PGGraphMomentNodeCollection)momentNodesWithPresence
{
  id v3 = +[PGGraphPersonNode momentWithPhysicallyPresentPerson];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphMomentNodeCollection *)v4;
}

- (PGGraphMomentNodeCollection)authoredMomentNodes
{
  id v3 = +[PGGraphPersonNode momentAuthoredByPerson];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphMomentNodeCollection *)v4;
}

- (PGGraphPersonNodeCollection)inferredAcquaintancePersonNodes
{
  id v3 = +[PGGraphPersonNode inferredAcquaintanceOfPerson];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphPersonNodeCollection *)v4;
}

- (PGGraphPersonNodeCollection)acquaintancePersonNodes
{
  id v3 = +[PGGraphPersonNode acquaintanceOfPerson];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphPersonNodeCollection *)v4;
}

- (PGGraphPersonNodeCollection)inferredCoworkerPersonNodes
{
  id v3 = +[PGGraphPersonNode inferredCoworkerOfPerson];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphPersonNodeCollection *)v4;
}

- (PGGraphPersonNodeCollection)coworkerPersonNodes
{
  id v3 = +[PGGraphPersonNode coworkerOfPerson];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphPersonNodeCollection *)v4;
}

- (PGGraphPersonNodeCollection)inferredDaughterPersonNodes
{
  id v3 = +[PGGraphPersonNode inferredDaughterOfPerson];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphPersonNodeCollection *)v4;
}

- (PGGraphPersonNodeCollection)daughterPersonNodes
{
  id v3 = +[PGGraphPersonNode daughterOfPerson];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphPersonNodeCollection *)v4;
}

- (PGGraphPersonNodeCollection)inferredSonPersonNodes
{
  id v3 = +[PGGraphPersonNode inferredSonOfPerson];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphPersonNodeCollection *)v4;
}

- (PGGraphPersonNodeCollection)sonPersonNodes
{
  id v3 = +[PGGraphPersonNode sonOfPerson];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphPersonNodeCollection *)v4;
}

- (PGGraphPersonNodeCollection)inferredChildPersonNodes
{
  id v3 = +[PGGraphPersonNode inferredChildOfPerson];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphPersonNodeCollection *)v4;
}

- (PGGraphPersonNodeCollection)childPersonNodes
{
  id v3 = +[PGGraphPersonNode childOfPerson];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphPersonNodeCollection *)v4;
}

- (PGGraphPersonNodeCollection)inferredBrotherPersonNodes
{
  id v3 = +[PGGraphPersonNode inferredBrotherOfPerson];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphPersonNodeCollection *)v4;
}

- (PGGraphPersonNodeCollection)brotherPersonNodes
{
  id v3 = +[PGGraphPersonNode brotherOfPerson];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphPersonNodeCollection *)v4;
}

- (PGGraphPersonNodeCollection)inferredSisterPersonNodes
{
  id v3 = +[PGGraphPersonNode inferredSisterOfPerson];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphPersonNodeCollection *)v4;
}

- (PGGraphPersonNodeCollection)sisterPersonNodes
{
  id v3 = +[PGGraphPersonNode sisterOfPerson];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphPersonNodeCollection *)v4;
}

- (PGGraphPersonNodeCollection)inferredParentPersonNodes
{
  id v3 = +[PGGraphPersonNode inferredParentOfPerson];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphPersonNodeCollection *)v4;
}

- (PGGraphPersonNodeCollection)parentPersonNodes
{
  id v3 = +[PGGraphPersonNode parentOfPerson];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphPersonNodeCollection *)v4;
}

- (PGGraphPersonNodeCollection)inferredFamilyPersonNodes
{
  id v3 = +[PGGraphPersonNode inferredFamilyOfPerson];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphPersonNodeCollection *)v4;
}

- (PGGraphPersonNodeCollection)familyPersonNodes
{
  id v3 = +[PGGraphPersonNode familyOfPerson];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphPersonNodeCollection *)v4;
}

- (PGGraphPersonNodeCollection)inferredFriendPersonNodes
{
  id v3 = +[PGGraphPersonNode inferredFriendOfPerson];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphPersonNodeCollection *)v4;
}

- (PGGraphPersonNodeCollection)friendPersonNodes
{
  id v3 = +[PGGraphPersonNode friendOfPerson];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphPersonNodeCollection *)v4;
}

- (PGGraphSocialGroupMemberNodeCollection)asSocialGroupMemberNodeCollection
{
  id v3 = [PGGraphSocialGroupMemberNodeCollection alloc];
  id v4 = [(MAElementCollection *)self graph];
  id v5 = [(MAElementCollection *)self elementIdentifiers];
  v6 = [(MAElementCollection *)v3 initWithGraph:v4 elementIdentifiers:v5];

  return v6;
}

- (PGGraphPersonNodeCollection)relatedPersonNodes
{
  id v3 = +[PGGraphRelationshipEdge filter];
  id v4 = [v3 anyDirectionRelation];
  id v5 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v4];

  return (PGGraphPersonNodeCollection *)v5;
}

- (PGGraphPersonNodeCollection)inferredFatherPersonNodes
{
  id v3 = +[PGGraphPersonNode inferredFatherOfPerson];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphPersonNodeCollection *)v4;
}

- (PGGraphPersonNodeCollection)fatherPersonNodes
{
  id v3 = +[PGGraphPersonNode fatherOfPerson];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphPersonNodeCollection *)v4;
}

- (PGGraphPersonNodeCollection)inferredMotherPersonNodes
{
  id v3 = +[PGGraphPersonNode inferredMotherOfPerson];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphPersonNodeCollection *)v4;
}

- (PGGraphPersonNodeCollection)motherPersonNodes
{
  id v3 = +[PGGraphPersonNode motherOfPerson];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphPersonNodeCollection *)v4;
}

- (PGGraphPersonNodeCollection)inferredPartnerPersonNodes
{
  id v3 = +[PGGraphPersonNode inferredPartnerOfPerson];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphPersonNodeCollection *)v4;
}

- (PGGraphPersonNodeCollection)partnerPersonNodes
{
  id v3 = +[PGGraphPersonNode partnerOfPerson];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphPersonNodeCollection *)v4;
}

- (PGGraphHomeWorkNodeCollection)workNodes
{
  id v3 = +[PGGraphPersonNode workOfPerson];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphHomeWorkNodeCollection *)v4;
}

- (PGGraphHomeWorkNodeCollection)homeNodes
{
  id v3 = +[PGGraphPersonNode homeOfPerson];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphHomeWorkNodeCollection *)v4;
}

- (PGGraphHomeWorkNodeCollection)homeOrWorkNodes
{
  id v3 = +[PGGraphPersonNode homeOrWorkOfPerson];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphHomeWorkNodeCollection *)v4;
}

- (PGGraphSocialGroupNodeCollection)socialGroupNodes
{
  id v3 = +[PGGraphPersonNode socialGroupOfPerson];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphSocialGroupNodeCollection *)v4;
}

- (PGGraphMomentNodeCollection)momentNodes
{
  id v3 = +[PGGraphPersonNode momentOfPerson];
  id v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphMomentNodeCollection *)v4;
}

+ (id)favoritedPersonNodesIncludingMeInGraph:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[PGGraphPersonNode filterIncludingMe];
  v10 = @"fav";
  v11[0] = MEMORY[0x1E4F1CC38];
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  id v7 = [v5 filterBySettingProperties:v6];

  v8 = [a1 nodesMatchingFilter:v7 inGraph:v4];

  return v8;
}

+ (id)favoritedPersonNodesExcludingMeInGraph:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[PGGraphPersonNode filterExcludingMe];
  v10 = @"fav";
  v11[0] = MEMORY[0x1E4F1CC38];
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  id v7 = [v5 filterBySettingProperties:v6];

  v8 = [a1 nodesMatchingFilter:v7 inGraph:v4];

  return v8;
}

+ (id)personNodesForSharedLibraryParticipantsInGraph:(id)a3
{
  id v4 = a3;
  id v5 = +[PGGraphPersonNode filterShareParticipantIdentifierNotEmpty];
  v6 = [a1 nodesMatchingFilter:v5 inGraph:v4];

  return v6;
}

+ (id)personNodesForShareParticipantIdentifiers:(id)a3 inGraph:(id)a4
{
  id v6 = a4;
  id v7 = +[PGGraphPersonNode filterWithShareParticipantIdentifiers:a3];
  v8 = [a1 nodesMatchingFilter:v7 inGraph:v6];

  return v8;
}

+ (id)unnamedPersonNodesInGraph:(id)a3
{
  id v3 = a3;
  id v4 = +[PGGraphPersonNode filterNameEmpty];
  id v5 = +[MANodeCollection nodesMatchingFilter:v4 inGraph:v3];

  return v5;
}

+ (id)namedPersonNodesInGraph:(id)a3
{
  id v3 = a3;
  id v4 = +[PGGraphPersonNode filterNameNotEmpty];
  id v5 = +[MANodeCollection nodesMatchingFilter:v4 inGraph:v3];

  return v5;
}

+ (id)personNodesInAgeCategories:(id)a3 includingMe:(BOOL)a4 inGraph:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  v9 = +[PGGraphPersonNode filterForAgeCategories:a3 includingMe:v5];
  v10 = [a1 nodesMatchingFilter:v9 inGraph:v8];

  return v10;
}

+ (id)personNodesForContactIdentifiers:(id)a3 inGraph:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = +[PGGraphPersonNode filterIncludingMe];
  v13 = @"cnid";
  v14[0] = v7;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];

  v10 = [v8 filterBySettingProperties:v9];

  v11 = [a1 nodesMatchingFilter:v10 inGraph:v6];

  return v11;
}

+ (id)personNodesWithNames:(id)a3 inGraph:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = +[PGGraphPersonNode filterIncludingMe];
  v13 = @"name";
  v14[0] = v7;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];

  v10 = [v8 filterBySettingProperties:v9];

  v11 = [a1 nodesMatchingFilter:v10 inGraph:v6];

  return v11;
}

+ (id)personNodesWithName:(id)a3 inGraph:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    v9 = +[PGGraphPersonNode filterIncludingMe];
    v15 = @"name";
    id v16 = v7;
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    v11 = [v9 filterBySettingProperties:v10];

    v12 = [a1 nodesMatchingFilter:v11 inGraph:v8];
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      v14 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      v18 = v14;
      _os_log_fault_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "%@ called with 'nil' name", buf, 0xCu);
    }
    v12 = (void *)[objc_alloc((Class)a1) initWithGraph:v8];
  }

  return v12;
}

+ (id)personNodesForArrayOfLocalIdentifiers:(id)a3 inGraph:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = +[PGGraphPersonNode filterIncludingMe];
  v13 = @"id";
  v14[0] = v7;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];

  v10 = [v8 filterBySettingProperties:v9];

  v11 = [a1 nodesMatchingFilter:v10 inGraph:v6];

  return v11;
}

+ (id)personNodesForLocalIdentifiers:(id)a3 inGraph:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = +[PGGraphPersonNode filterIncludingMe];
  v13 = @"id";
  v14[0] = v7;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];

  v10 = [v8 filterBySettingProperties:v9];

  v11 = [a1 nodesMatchingFilter:v10 inGraph:v6];

  return v11;
}

+ (id)personNodesForLocalIdentifier:(id)a3 inGraph:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if ([v7 length])
  {
    v9 = +[PGGraphPersonNode filterIncludingMe];
    v15 = @"id";
    id v16 = v7;
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    uint64_t v11 = [v9 filterBySettingProperties:v10];

    v12 = [a1 nodesMatchingFilter:v11 inGraph:v8];

    id v8 = (id)v11;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      v14 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      v18 = v14;
      _os_log_fault_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "%@ called with 'empty' personLocalIdentifier", buf, 0xCu);
    }
    v12 = (void *)[objc_alloc((Class)a1) initWithGraph:v8];
  }

  return v12;
}

+ (id)personNodesIncludingMeInGraph:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[PGGraphPersonNode filterIncludingMe];
  id v6 = [a1 nodesMatchingFilter:v5 inGraph:v4];

  return v6;
}

+ (id)personNodesExcludingMeInGraph:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[PGGraphPersonNode filterExcludingMe];
  id v6 = [a1 nodesMatchingFilter:v5 inGraph:v4];

  return v6;
}

+ (Class)nodeClass
{
  return (Class)objc_opt_class();
}

@end
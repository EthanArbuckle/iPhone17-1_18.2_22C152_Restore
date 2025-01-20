@interface PGGraphPersonActivityMeaningNodeCollection
+ (Class)nodeClass;
+ (id)personActivityMeaningNodesForActivityLabel:(id)a3 inGraph:(id)a4;
+ (id)personActivityMeaningNodesForActivityLabel:(id)a3 personLocalIdentifiers:(id)a4 inGraph:(id)a5;
+ (id)personActivityMeaningNodesForActivityLabels:(id)a3 inGraph:(id)a4;
- (PGGraphFeatureNodeCollection)featureNodeCollection;
- (PGGraphMomentNodeCollection)momentNodes;
- (PGGraphPersonNodeCollection)personNodes;
- (id)personLocalIdentifiers;
- (id)subsetWithActivityLabels:(id)a3;
@end

@implementation PGGraphPersonActivityMeaningNodeCollection

- (PGGraphPersonNodeCollection)personNodes
{
  v3 = +[PGGraphPersonActivityMeaningNode personOfPersonActivity];
  v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphPersonNodeCollection *)v4;
}

- (PGGraphMomentNodeCollection)momentNodes
{
  v3 = +[PGGraphPersonActivityMeaningNode momentOfPersonActivity];
  v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphMomentNodeCollection *)v4;
}

- (PGGraphFeatureNodeCollection)featureNodeCollection
{
  return +[PGGraphFeatureNodeCollection featureNodeCollectionWithCollection:self];
}

- (id)personLocalIdentifiers
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__13220;
  v10 = __Block_byref_object_dispose__13221;
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __68__PGGraphPersonActivityMeaningNodeCollection_personLocalIdentifiers__block_invoke;
  v5[3] = &unk_1E68E5FB8;
  v5[4] = &v6;
  [(MANodeCollection *)self enumerateStringPropertyValuesForKey:@"identifier" withBlock:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __68__PGGraphPersonActivityMeaningNodeCollection_personLocalIdentifiers__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "addObject:");
}

- (id)subsetWithActivityLabels:(id)a3
{
  v4 = +[PGGraphPersonActivityMeaningNode filterWithActivityLabels:a3];
  v5 = [v4 relation];
  uint64_t v6 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v5];

  return v6;
}

+ (id)personActivityMeaningNodesForActivityLabels:(id)a3 inGraph:(id)a4
{
  v5 = (objc_class *)MEMORY[0x1E4F71F00];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 alloc];
  v9 = (void *)[v8 initWithLabels:v7 domain:701 properties:MEMORY[0x1E4F1CC08]];

  v10 = +[MANodeCollection nodesMatchingFilter:v9 inGraph:v6];

  return v10;
}

+ (id)personActivityMeaningNodesForActivityLabel:(id)a3 inGraph:(id)a4
{
  v5 = (objc_class *)MEMORY[0x1E4F71F00];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 alloc];
  v9 = (void *)[v8 initWithLabel:v7 domain:701 properties:MEMORY[0x1E4F1CC08]];

  v10 = +[MANodeCollection nodesMatchingFilter:v9 inGraph:v6];

  return v10;
}

+ (id)personActivityMeaningNodesForActivityLabel:(id)a3 personLocalIdentifiers:(id)a4 inGraph:(id)a5
{
  id v7 = a5;
  id v8 = +[PGGraphPersonActivityMeaningNode filterWithPersonLocalIdentifiers:a4 label:a3];
  v9 = +[MANodeCollection nodesMatchingFilter:v8 inGraph:v7];

  return v9;
}

+ (Class)nodeClass
{
  return (Class)objc_opt_class();
}

@end
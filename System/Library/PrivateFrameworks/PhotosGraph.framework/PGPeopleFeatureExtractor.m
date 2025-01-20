@interface PGPeopleFeatureExtractor
+ (id)_fixLabels:(id)a3 toLength:(unint64_t)a4;
+ (id)_labelFromPersonNode:(id)a3;
- (PGPeopleFeatureExtractor)initWithGraph:(id)a3 error:(id *)a4;
- (PGPeopleFeatureExtractor)initWithTopNumberOfPeople:(unint64_t)a3 graph:(id)a4 error:(id *)a5;
@end

@implementation PGPeopleFeatureExtractor

- (PGPeopleFeatureExtractor)initWithTopNumberOfPeople:(unint64_t)a3 graph:(id)a4 error:(id *)a5
{
  id v7 = a4;
  v8 = +[PGGraphMomentNode consolidatedPersonInMoment];
  v9 = +[PGGraphPersonNodeCollection personNodesExcludingMeInGraph:v7];

  v10 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
  v11 = [v8 inverse];
  v12 = [MEMORY[0x1E4F71E88] adjacencyWithSources:v9 relation:v11 targetsClass:objc_opt_class()];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __66__PGPeopleFeatureExtractor_initWithTopNumberOfPeople_graph_error___block_invoke;
  v21[3] = &unk_1E68EEC70;
  id v22 = v12;
  v13 = self;
  v23 = v13;
  id v24 = v10;
  id v14 = v10;
  id v15 = v12;
  [v9 enumerateNodesUsingBlock:v21];
  v16 = [v14 keysSortedByValueUsingComparator:&__block_literal_global_12];
  v17 = [(id)objc_opt_class() _fixLabels:v16 toLength:a3];
  v20.receiver = v13;
  v20.super_class = (Class)PGPeopleFeatureExtractor;
  v18 = [(PGGraphFeatureExtractor *)&v20 initWithName:@"People" featureNames:v17 relation:v8 labelForTargetBlock:&__block_literal_global_14];

  return v18;
}

void __66__PGPeopleFeatureExtractor_initWithTopNumberOfPeople_graph_error___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  objc_msgSend(v3, "targetsForSourceIdentifier:", objc_msgSend(v4, "identifier"));
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = [(id)objc_opt_class() _labelFromPersonNode:v4];

  v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
  [*(id *)(a1 + 48) setObject:v6 forKeyedSubscript:v5];
}

id __66__PGPeopleFeatureExtractor_initWithTopNumberOfPeople_graph_error___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return +[PGPeopleFeatureExtractor _labelFromPersonNode:a2];
}

uint64_t __66__PGPeopleFeatureExtractor_initWithTopNumberOfPeople_graph_error___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2];
}

- (PGPeopleFeatureExtractor)initWithGraph:(id)a3 error:(id *)a4
{
  v5 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v6 = a3;
  id v7 = objc_alloc_init(v5);
  v8 = +[PGGraphPersonNodeCollection personNodesExcludingMeInGraph:v6];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __48__PGPeopleFeatureExtractor_initWithGraph_error___block_invoke;
  v15[3] = &unk_1E68F0820;
  v9 = self;
  v16 = v9;
  id v17 = v7;
  id v10 = v7;
  [v8 enumerateNodesUsingBlock:v15];
  v11 = +[PGGraphMomentNode personInMoment];
  v14.receiver = v9;
  v14.super_class = (Class)PGPeopleFeatureExtractor;
  v12 = [(PGGraphFeatureExtractor *)&v14 initWithName:@"People" featureNames:v10 relation:v11 labelForTargetBlock:&__block_literal_global_58276];

  return v12;
}

void __48__PGPeopleFeatureExtractor_initWithGraph_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [(id)objc_opt_class() _labelFromPersonNode:v3];

  [*(id *)(a1 + 40) addObject:v4];
}

id __48__PGPeopleFeatureExtractor_initWithGraph_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[PGPeopleFeatureExtractor _labelFromPersonNode:a2];
}

+ (id)_fixLabels:(id)a3 toLength:(unint64_t)a4
{
  v5 = [MEMORY[0x1E4F1CA48] arrayWithArray:a3];
  unint64_t v6 = [v5 count];
  unint64_t v7 = [v5 count];
  unint64_t v8 = v7;
  if (v6 <= a4)
  {
    if (v7 < a4)
    {
      do
      {
        v9 = [NSString stringWithFormat:@"%@_%lu", @"Padding", v8];
        [v5 addObject:v9];

        ++v8;
      }
      while (a4 != v8);
    }
  }
  else
  {
    objc_msgSend(v5, "removeObjectsInRange:", a4, v7 - a4);
  }
  return v5;
}

+ (id)_labelFromPersonNode:(id)a3
{
  id v3 = a3;
  id v4 = [v3 localIdentifier];
  v5 = [v3 name];

  if (v5) {
    [NSString stringWithFormat:@"%@-%@", v5, v4];
  }
  else {
  unint64_t v6 = [NSString stringWithFormat:@"Person-%@", v4, v8];
  }

  return v6;
}

@end
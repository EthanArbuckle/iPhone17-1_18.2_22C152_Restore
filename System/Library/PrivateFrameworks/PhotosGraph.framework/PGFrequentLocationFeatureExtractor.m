@interface PGFrequentLocationFeatureExtractor
- (PGFrequentLocationFeatureExtractor)initWithGraph:(id)a3 error:(id *)a4;
- (id)_labelFromFrequentLocationNode:(id)a3;
@end

@implementation PGFrequentLocationFeatureExtractor

- (id)_labelFromFrequentLocationNode:(id)a3
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"FrequentLocation-%u", objc_msgSend(a3, "identifier"));
}

- (PGFrequentLocationFeatureExtractor)initWithGraph:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v7 = +[PGGraphNodeCollection nodesInGraph:v5];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __58__PGFrequentLocationFeatureExtractor_initWithGraph_error___block_invoke;
  v17[3] = &unk_1E68EAAA0;
  v8 = self;
  v18 = v8;
  id v9 = v6;
  id v19 = v9;
  [v7 enumerateNodesUsingBlock:v17];
  objc_initWeak(&location, v8);
  v10 = +[PGGraphMomentNode frequentLocationOfMoment];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __58__PGFrequentLocationFeatureExtractor_initWithGraph_error___block_invoke_2;
  v14[3] = &unk_1E68EAAC8;
  objc_copyWeak(&v15, &location);
  v13.receiver = v8;
  v13.super_class = (Class)PGFrequentLocationFeatureExtractor;
  v11 = [(PGGraphFeatureExtractor *)&v13 initWithName:@"Frequent Location" featureNames:v9 relation:v10 labelForTargetBlock:v14];
  objc_destroyWeak(&v15);

  objc_destroyWeak(&location);
  return v11;
}

void __58__PGFrequentLocationFeatureExtractor_initWithGraph_error___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) _labelFromFrequentLocationNode:a2];
  [*(id *)(a1 + 40) addObject:v3];
}

id __58__PGFrequentLocationFeatureExtractor_initWithGraph_error___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [WeakRetained _labelFromFrequentLocationNode:v3];

  return v5;
}

@end
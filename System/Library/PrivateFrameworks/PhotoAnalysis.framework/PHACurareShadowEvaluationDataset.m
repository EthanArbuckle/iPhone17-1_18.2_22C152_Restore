@interface PHACurareShadowEvaluationDataset
+ (id)prepareDatasetForEvaluationTaskWithRecipeOptions:(id)a3 error:(id *)a4;
@end

@implementation PHACurareShadowEvaluationDataset

+ (id)prepareDatasetForEvaluationTaskWithRecipeOptions:(id)a3 error:(id *)a4
{
  v5 = +[PHAPrivateFederatedLearningRunner datasetBuilderForOptions:error:](PHAPrivateFederatedLearningRunner, "datasetBuilderForOptions:error:", a3);
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v7 = [v5 datasetForEvaluationForLabel:@"positive" error:a4];
  if (v7)
  {
    [v6 setObject:v7 forKeyedSubscript:@"kPositive"];
  }
  else
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
    [v6 setObject:v8 forKeyedSubscript:@"kPositive"];
  }
  v9 = [v5 datasetForEvaluationForLabel:@"negative" error:a4];
  if (v9)
  {
    [v6 setObject:v9 forKeyedSubscript:@"kNegative"];
  }
  else
  {
    v10 = [MEMORY[0x1E4F1CA98] null];
    [v6 setObject:v10 forKeyedSubscript:@"kNegative"];
  }

  return v6;
}

@end
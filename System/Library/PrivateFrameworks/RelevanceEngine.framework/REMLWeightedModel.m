@interface REMLWeightedModel
@end

@implementation REMLWeightedModel

uint64_t __61___REMLWeightedModel_weightedModelWithDescriptor_featureSet___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _configureMode:a2];
}

void __61___REMLWeightedModel_weightedModelWithDescriptor_featureSet___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 name];
  [v3 setMetricsInteraction:v4];
}

void __61___REMLWeightedModel_weightedModelWithDescriptor_featureSet___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id v8 = [v4 name];
  v7 = [v8 stringByAppendingFormat:@"@%@", v5];

  [v6 setMetricsInteraction:v7];
}

@end
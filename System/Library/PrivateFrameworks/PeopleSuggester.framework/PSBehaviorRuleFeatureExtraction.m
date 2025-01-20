@interface PSBehaviorRuleFeatureExtraction
@end

@implementation PSBehaviorRuleFeatureExtraction

BOOL __73___PSBehaviorRuleFeatureExtraction_extractContextMatchFeatures_features___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 type];
  v3 = [v2 identifier];
  v4 = [getBMItemTypeClass_2() interactionPhotoContact];
  v5 = [v4 identifier];
  BOOL v6 = v3 == v5;

  return v6;
}

BOOL __73___PSBehaviorRuleFeatureExtraction_extractContextMatchFeatures_features___block_invoke_148(uint64_t a1, void *a2)
{
  v2 = [a2 type];
  v3 = [v2 identifier];
  v4 = [getBMItemTypeClass_2() interactionPhotoScene];
  v5 = [v4 identifier];
  BOOL v6 = v3 == v5;

  return v6;
}

uint64_t __83___PSBehaviorRuleFeatureExtraction_extractFeaturesGivenRule_contextItems_features___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 type];
  v3 = [v2 identifier];
  v4 = [getBMItemTypeClass_2() interactionPhotoContact];
  v5 = [v4 identifier];
  uint64_t v6 = [v3 isEqualToString:v5];

  return v6;
}

BOOL __83___PSBehaviorRuleFeatureExtraction_extractFeaturesGivenRule_contextItems_features___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 type];
  v3 = [v2 identifier];
  v4 = [getBMItemTypeClass_2() interactionPhotoScene];
  v5 = [v4 identifier];
  BOOL v6 = v3 == v5;

  return v6;
}

BOOL __83___PSBehaviorRuleFeatureExtraction_extractFeaturesGivenRule_contextItems_features___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = [a2 type];
  v3 = [v2 identifier];
  v4 = [getBMItemTypeClass_2() interactionPhotoContact];
  v5 = [v4 identifier];
  BOOL v6 = v3 == v5;

  return v6;
}

BOOL __83___PSBehaviorRuleFeatureExtraction_extractFeaturesGivenRule_contextItems_features___block_invoke_4(uint64_t a1, void *a2)
{
  v2 = [a2 type];
  v3 = [v2 identifier];
  v4 = [getBMItemTypeClass_2() interactionPhotoScene];
  v5 = [v4 identifier];
  BOOL v6 = v3 == v5;

  return v6;
}

@end
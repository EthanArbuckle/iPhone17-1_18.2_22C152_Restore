@interface REDependentRelevanceProvider
+ (id)_dependentConditionWithRelevanceProvider:(id)a3 invertsRelevance:(BOOL)a4;
+ (id)dependentProviderWithProvider:(id)a3;
+ (id)dependentProviderWithProvider:(id)a3 invertsRelevance:(BOOL)a4;
@end

@implementation REDependentRelevanceProvider

+ (id)_dependentConditionWithRelevanceProvider:(id)a3 invertsRelevance:(BOOL)a4
{
  id v5 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __90__REDependentRelevanceProvider__dependentConditionWithRelevanceProvider_invertsRelevance___block_invoke;
  v9[3] = &unk_2644BF2A0;
  id v10 = v5;
  BOOL v11 = a4;
  id v6 = v5;
  v7 = +[RERelevanceCondition conditionWithBlock:v9];

  return v7;
}

float __90__REDependentRelevanceProvider__dependentConditionWithRelevanceProvider_invertsRelevance___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  float v4 = 0.0;
  if ([v3 containsRelevanceProvider:*(void *)(a1 + 32)])
  {
    id v5 = [v3 featuresForRelevanceProvider:*(void *)(a1 + 32)];
    id v6 = [v3 relevancesForRelevanceProvider:*(void *)(a1 + 32)];
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x2020000000;
    uint64_t v25 = 0;
    uint64_t v16 = MEMORY[0x263EF8330];
    uint64_t v17 = 3221225472;
    v18 = __90__REDependentRelevanceProvider__dependentConditionWithRelevanceProvider_invertsRelevance___block_invoke_2;
    v19 = &unk_2644BF278;
    v21 = &v22;
    id v7 = v6;
    id v20 = v7;
    [v5 enumerateObjectsUsingBlock:&v16];
    unint64_t v8 = v23[3];
    if (!v8)
    {
      unint64_t v8 = objc_msgSend(v7, "firstFeatureValue", v16, v17, v18, v19);
      v23[3] = v8;
    }
    switch(REFeatureValueTypeForTaggedPointer(v8))
    {
      case 0:
        int v10 = REBooleanValueForTaggedPointer(v23[3]) ^ 1;
        break;
      case 1:
        int v10 = REIntegerValueForTaggedPointer(v23[3]) == 0;
        break;
      case 2:
        float v11 = REDoubleValueForTaggedPointer((void *)v23[3], v9);
        int v10 = RERelevanceEqualToRelevance(v11, 0.0);
        break;
      case 3:
        v12 = REStringValueForTaggedPointer(v23[3]);
        uint64_t v13 = [v12 length];
        goto LABEL_11;
      case 4:
        v12 = RESetValueForTaggedPointer((void *)v23[3]);
        uint64_t v13 = [v12 count];
LABEL_11:
        int v10 = v13 == 0;

        break;
      default:
        int v10 = 0;
        break;
    }
    int v14 = v10 ^ (*(unsigned char *)(a1 + 40) == 0);

    _Block_object_dispose(&v22, 8);
    if (v14) {
      float v4 = 1.0;
    }
    else {
      float v4 = 0.0;
    }
  }

  return v4;
}

uint64_t __90__REDependentRelevanceProvider__dependentConditionWithRelevanceProvider_invertsRelevance___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 featureType];
  if ((result | 2) == 2)
  {
    uint64_t result = [*(id *)(a1 + 32) featureValueAtIndex:a3];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
    *a4 = 1;
  }
  return result;
}

+ (id)dependentProviderWithProvider:(id)a3
{
  return (id)[a1 dependentProviderWithProvider:a3 invertsRelevance:0];
}

+ (id)dependentProviderWithProvider:(id)a3 invertsRelevance:(BOOL)a4
{
  float v4 = +[REDependentRelevanceProvider _dependentConditionWithRelevanceProvider:a3 invertsRelevance:a4];
  id v5 = [[REConditionalRelevanceProvider alloc] initWithRelevanceCondition:v4];

  return v5;
}

@end
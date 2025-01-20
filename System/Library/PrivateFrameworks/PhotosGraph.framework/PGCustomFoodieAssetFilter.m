@interface PGCustomFoodieAssetFilter
+ (BOOL)supportsSecureCoding;
+ (NSString)name;
- (BOOL)_passesWithAsset:(id)a3 curationContext:(id)a4;
- (BOOL)isEqual:(id)a3;
- (PGCustomFoodieAssetFilter)init;
- (id)filteredAssetsFromAssets:(id)a3 curationContext:(id)a4;
@end

@implementation PGCustomFoodieAssetFilter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_forbiddenScenesHelper, 0);
  objc_storeStrong((id *)&self->_drinkScenesHelper, 0);
  objc_storeStrong((id *)&self->_foodScenesHelper, 0);
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    char isKindOfClass = 1;
  }
  else
  {
    id v3 = a3;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  return isKindOfClass & 1;
}

- (BOOL)_passesWithAsset:(id)a3 curationContext:(id)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 curationModel];
  v9 = [v7 userFeedbackCalculator];
  char v10 = [v8 isUtilityForMemoriesWithAsset:v6 userFeedbackCalculator:v9];

  if ((v10 & 1) != 0
    || ([v6 clsFaceInformationSummary],
        v11 = objc_claimAutoreleasedReturnValue(),
        int v12 = [v11 numberOfFaces],
        v11,
        v12)
    || ![v8 isShowcasingFoodWithAsset:v6])
  {
    char v38 = 0;
    goto LABEL_33;
  }
  v46 = [(CLSSceneConfidenceThresholdHelper *)self->_foodScenesHelper confidenceThresholdBySceneIdentifierWithCurationModel:v8];
  v45 = [(CLSSceneConfidenceThresholdHelper *)self->_drinkScenesHelper confidenceThresholdBySceneIdentifierWithCurationModel:v8];
  v48 = [(CLSSceneConfidenceThresholdHelper *)self->_forbiddenScenesHelper confidenceThresholdBySceneIdentifierWithCurationModel:v8];
  v13 = [v8 junkClassificationModel];
  v44 = [v13 foodOrDrinkNode];

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  v14 = [v6 clsSceneClassifications];
  uint64_t v47 = [v14 countByEnumeratingWithState:&v49 objects:v53 count:16];
  if (!v47)
  {

    char v38 = 0;
    goto LABEL_41;
  }
  v42 = v8;
  id obj = v14;
  id v40 = v6;
  id v41 = v7;
  char v15 = 0;
  BOOL v16 = 0;
  char v17 = 0;
  uint64_t v18 = *(void *)v50;
  unint64_t v19 = 0x1E4F28000uLL;
LABEL_6:
  uint64_t v20 = 0;
  while (1)
  {
    if (*(void *)v50 != v18) {
      objc_enumerationMutation(obj);
    }
    v21 = *(void **)(*((void *)&v49 + 1) + 8 * v20);
    if ([v8 filterForFoodieWithClassification:v21]) {
      goto LABEL_38;
    }
    v22 = objc_msgSend(*(id *)(v19 + 3792), "numberWithUnsignedInteger:", objc_msgSend(v21, "extendedSceneIdentifier"));
    [v21 confidence];
    double v24 = v23;
    v25 = [v48 objectForKeyedSubscript:v22];
    v26 = v25;
    if (v25)
    {
      [v25 doubleValue];
      if (v24 >= v27) {
        break;
      }
    }
    if (v16)
    {
      BOOL v16 = 1;
      if ((v17 & 1) == 0) {
        goto LABEL_14;
      }
    }
    else
    {
      uint64_t v32 = v18;
      v33 = [v46 objectForKeyedSubscript:v22];
      v34 = v33;
      BOOL v16 = 0;
      if (v33)
      {
        [v33 doubleValue];
        if (v24 >= v35) {
          BOOL v16 = 1;
        }
      }

      uint64_t v18 = v32;
      v8 = v42;
      unint64_t v19 = 0x1E4F28000;
      if ((v17 & 1) == 0)
      {
LABEL_14:
        char v17 = [v44 passesHighPrecisionWithSignal:v21];
        if (v15) {
          goto LABEL_26;
        }
        goto LABEL_15;
      }
    }
    char v17 = 1;
    if (v15)
    {
LABEL_26:
      char v36 = 1;
      goto LABEL_27;
    }
LABEL_15:
    v28 = [v45 objectForKeyedSubscript:v22];
    v29 = v28;
    BOOL v31 = 0;
    if (v28)
    {
      [v28 doubleValue];
      if (v24 >= v30) {
        BOOL v31 = 1;
      }
    }

    char v36 = v31;
LABEL_27:
    char v15 = v36;
    char v37 = v16 & v36 & v17;

    if (v37)
    {

      char v15 = 1;
      BOOL v16 = 1;
      goto LABEL_36;
    }
    if (v47 == ++v20)
    {
      uint64_t v47 = [obj countByEnumeratingWithState:&v49 objects:v53 count:16];
      if (v47) {
        goto LABEL_6;
      }

      if ((v17 & 1) == 0) {
        goto LABEL_39;
      }
LABEL_36:
      char v38 = v16 | v15 ^ 1;
      goto LABEL_40;
    }
  }

LABEL_38:
LABEL_39:
  char v38 = 0;
LABEL_40:
  id v6 = v40;
  id v7 = v41;
LABEL_41:

LABEL_33:
  return v38;
}

- (id)filteredAssetsFromAssets:(id)a3 curationContext:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x1E4F1CA48] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        if (-[PGCustomFoodieAssetFilter _passesWithAsset:curationContext:](self, "_passesWithAsset:curationContext:", v14, v7, (void)v16))
        {
          [v8 addObject:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  return v8;
}

- (PGCustomFoodieAssetFilter)init
{
  v10.receiver = self;
  v10.super_class = (Class)PGCustomFoodieAssetFilter;
  v2 = [(PGCustomFoodieAssetFilter *)&v10 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F8E788]) initWithSceneNames:&unk_1F28D47D0 thresholdType:1];
    foodScenesHelper = v2->_foodScenesHelper;
    v2->_foodScenesHelper = (CLSSceneConfidenceThresholdHelper *)v3;

    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F8E788]) initWithSceneNames:&unk_1F28D47E8 thresholdType:1];
    drinkScenesHelper = v2->_drinkScenesHelper;
    v2->_drinkScenesHelper = (CLSSceneConfidenceThresholdHelper *)v5;

    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F8E788]) initWithSceneNames:&unk_1F28D4800 thresholdType:5];
    forbiddenScenesHelper = v2->_forbiddenScenesHelper;
    v2->_forbiddenScenesHelper = (CLSSceneConfidenceThresholdHelper *)v7;
  }
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (NSString)name
{
  return (NSString *)@"CustomFoodie";
}

@end
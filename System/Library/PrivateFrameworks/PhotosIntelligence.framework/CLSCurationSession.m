@interface CLSCurationSession
+ (double)legacyAestheticScoreThresholdToBeAestheticallyPrettyGood;
+ (double)legacyAestheticScoreThresholdToBeAwesome;
+ (double)legacyAestheticScoreThresholdToNotBeJunk;
+ (id)scoringContextWithAssets:(id)a3 aestheticScoreThresholdToBeAwesome:(double)a4;
+ (signed)audioClassificationsToEmphasizeWithAudioClassificationCounts:(id)a3 threshold:(double)a4;
+ (void)addAudioClassifications:(signed __int16)a3 toAudioClassificationCounts:(id)a4;
+ (void)enumerateSignalsFromAsset:(id)a3 fullHierarchyName:(BOOL)a4 usingBlock:(id)a5;
- (CLSCurationSession)init;
- (id)_curationModelWithSpecification:(id)a3;
- (id)curationModelForAsset:(id)a3;
- (id)curationModelForItemInfo:(id)a3 options:(id)a4;
- (id)curationModelWithSpecification:(id)a3;
- (void)prepareAssets:(id)a3;
@end

@implementation CLSCurationSession

- (void).cxx_destruct
{
}

- (void)prepareAssets:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (([v9 hasCurationModel] & 1) == 0)
        {
          v10 = [(CLSCurationSession *)self curationModelForAsset:v9];
          [v9 setCurationModel:v10];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (id)curationModelForItemInfo:(id)a3 options:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [[CLSCurationModelSpecification alloc] initWithItemInfo:v7 options:v6];

  v9 = [(CLSCurationSession *)self curationModelWithSpecification:v8];

  return v9;
}

- (id)curationModelForAsset:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[CLSCurationModelSpecification alloc] initWithAsset:v4];

  id v6 = [(CLSCurationSession *)self curationModelWithSpecification:v5];

  return v6;
}

- (id)curationModelWithSpecification:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_curationModelBySpecificationLock);
  uint64_t v5 = [(NSMutableDictionary *)self->_curationModelBySpecification objectForKeyedSubscript:v4];
  if (!v5)
  {
    id v6 = +[CLSCurationModel baseSpecificationWithSpecification:v4];
    uint64_t v5 = [(NSMutableDictionary *)self->_curationModelBySpecification objectForKeyedSubscript:v6];
    if (!v5)
    {
      uint64_t v5 = [(CLSCurationSession *)self _curationModelWithSpecification:v4];
      [(NSMutableDictionary *)self->_curationModelBySpecification setObject:v5 forKeyedSubscript:v6];
    }
    [(NSMutableDictionary *)self->_curationModelBySpecification setObject:v5 forKeyedSubscript:v4];
  }
  os_unfair_lock_unlock(&self->_curationModelBySpecificationLock);

  return v5;
}

- (id)_curationModelWithSpecification:(id)a3
{
  id v3 = a3;
  id v4 = [[CLSCurationModel alloc] initWithCurationModelSpecification:v3];

  return v4;
}

- (CLSCurationSession)init
{
  v6.receiver = self;
  v6.super_class = (Class)CLSCurationSession;
  v2 = [(CLSCurationSession *)&v6 init];
  if (v2)
  {
    id v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    curationModelBySpecification = v2->_curationModelBySpecification;
    v2->_curationModelBySpecification = v3;

    v2->_curationModelBySpecificationLock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

+ (void)enumerateSignalsFromAsset:(id)a3 fullHierarchyName:(BOOL)a4 usingBlock:(id)a5
{
  BOOL v31 = a4;
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, uint64_t, char *, double, double, double, double, double, double))a5;
  v30 = v6;
  v34 = [v6 curationModel];
  v32 = [v34 sceneModel];
  v8 = [v34 entityNetModel];
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id obj = [v6 clsSceneClassifications];
  uint64_t v36 = [obj countByEnumeratingWithState:&v51 objects:v55 count:16];
  if (v36)
  {
    uint64_t v35 = *(void *)v52;
    do
    {
      for (uint64_t i = 0; i != v36; ++i)
      {
        if (*(void *)v52 != v35) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        uint64_t v45 = 0;
        v46 = &v45;
        uint64_t v47 = 0x3032000000;
        v48 = __Block_byref_object_copy_;
        v49 = __Block_byref_object_dispose_;
        id v50 = 0;
        uint64_t v11 = [v10 extendedSceneIdentifier];
        uint64_t v41 = 0;
        v42 = (double *)&v41;
        uint64_t v43 = 0x2020000000;
        uint64_t v44 = 0;
        if (![v8 isResponsibleForSignalIdentifier:v11])
        {
          v38[0] = MEMORY[0x263EF8330];
          v38[1] = 3221225472;
          v38[2] = __77__CLSCurationSession_enumerateSignalsFromAsset_fullHierarchyName_usingBlock___block_invoke_2;
          v38[3] = &unk_26544EAE0;
          v38[4] = &v45;
          v38[5] = &v41;
          v38[6] = v11;
          [v34 enumerateClassificationBasedSignalModelsUsingBlock:v38];
          goto LABEL_18;
        }
        if ([v32 isResponsibleForSignalIdentifier:v11]) {
          long long v12 = v32;
        }
        else {
          long long v12 = v8;
        }
        id v13 = v12;
        if (![v13 taxonomyNodeRefForSceneIdentifier:v11])
        {
          uint64_t v21 = objc_msgSend(NSString, "stringWithFormat:", @"Unknown (%llu)", v11);
LABEL_16:
          id v16 = (id)v46[5];
          v46[5] = v21;
          goto LABEL_17;
        }
        PFSceneTaxonomyNodeSearchThreshold();
        *((void *)v42 + 3) = v14;
        if (!v31)
        {
          uint64_t v21 = PFSceneTaxonomyNodeName();
          goto LABEL_16;
        }
        id v15 = objc_alloc_init(MEMORY[0x263EFF980]);
        v38[7] = MEMORY[0x263EF8330];
        v38[8] = 3221225472;
        v38[9] = __77__CLSCurationSession_enumerateSignalsFromAsset_fullHierarchyName_usingBlock___block_invoke;
        v38[10] = &unk_26544EAB8;
        id v39 = v13;
        id v16 = v15;
        id v40 = v16;
        PFSceneTaxonomyNodeTraverseParents();
        v17 = [v16 reverseObjectEnumerator];
        v18 = [v17 allObjects];
        uint64_t v19 = [v18 componentsJoinedByString:@"->"];
        v20 = (void *)v46[5];
        v46[5] = v19;

LABEL_17:
LABEL_18:
        char v37 = 0;
        uint64_t v22 = v46[5];
        [v10 confidence];
        double v24 = v23;
        double v25 = v42[3];
        [v10 boundingBox];
        v7[2](v7, v11, v22, &v37, v24, v25, v26, v27, v28, v29);
        LOBYTE(v22) = v37 == 0;
        _Block_object_dispose(&v41, 8);
        _Block_object_dispose(&v45, 8);

        if ((v22 & 1) == 0) {
          goto LABEL_21;
        }
      }
      uint64_t v36 = [obj countByEnumeratingWithState:&v51 objects:v55 count:16];
    }
    while (v36);
  }
LABEL_21:
}

uint64_t __77__CLSCurationSession_enumerateSignalsFromAsset_fullHierarchyName_usingBlock___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) sceneTaxonomy];
  id v3 = PFSceneTaxonomyNodeLocalizedLabel();
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    PFSceneTaxonomyNodeName();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v6 = v5;

  [*(id *)(a1 + 40) addObject:v6];
  return 0;
}

void __77__CLSCurationSession_enumerateSignalsFromAsset_fullHierarchyName_usingBlock___block_invoke_2(void *a1, void *a2)
{
  id v3 = [a2 nodeForSignalIdentifier:a1[6]];
  if (v3)
  {
    id v8 = v3;
    uint64_t v4 = [v3 name];
    uint64_t v5 = *(void *)(a1[4] + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    [v8 operatingPoint];
    id v3 = v8;
    *(void *)(*(void *)(a1[5] + 8) + 24) = v7;
  }
}

+ (signed)audioClassificationsToEmphasizeWithAudioClassificationCounts:(id)a3 threshold:(double)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    int v8 = 0;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        double v12 = (double)(unint64_t)[v5 countForObject:v11];
        if (v12 <= a4) {
          v8 |= objc_msgSend(v11, "integerValue", v12);
        }
      }
      uint64_t v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16, v12);
    }
    while (v7);
  }
  else
  {
    LOWORD(v8) = 0;
  }

  return v8;
}

+ (void)addAudioClassifications:(signed __int16)a3 toAudioClassificationCounts:(id)a4
{
  int v4 = a3;
  id v7 = a4;
  if (v4 >= 1)
  {
    LOWORD(v5) = 1;
    do
    {
      if (((unsigned __int16)v5 & (unsigned __int16)v4) != 0)
      {
        uint64_t v6 = [NSNumber numberWithShort:(__int16)v5];
        [v7 addObject:v6];
      }
      int v5 = (__int16)(2 * v5);
    }
    while (v5 <= v4);
  }
}

+ (id)scoringContextWithAssets:(id)a3 aestheticScoreThresholdToBeAwesome:(double)a4
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  id v5 = a3;
  double v6 = (double)(unint64_t)[v5 count];
  id v56 = objc_alloc_init(MEMORY[0x263F08760]);
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id obj = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v62 objects:v67 count:16];
  double v8 = 0.0;
  if (v7)
  {
    uint64_t v9 = v7;
    unint64_t v52 = 0;
    unint64_t v53 = 0;
    unint64_t v10 = 0;
    unint64_t v54 = 0;
    unint64_t v11 = 0;
    unint64_t v12 = 0;
    uint64_t v13 = *(void *)v63;
    double v14 = 0.0;
    double v15 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v63 != v13) {
          objc_enumerationMutation(obj);
        }
        long long v17 = *(void **)(*((void *)&v62 + 1) + 8 * i);
        uint64_t v18 = objc_msgSend(v17, "clsViewCount", v52);
        uint64_t v19 = [v17 clsPlayCount];
        if ([v17 clsShareCount]) {
          ++v12;
        }
        unsigned int v20 = [v17 hasAdjustments];
        if ([v17 clsIsInterestingLivePhoto])
        {
          ++v10;
          objc_msgSend(a1, "addAudioClassifications:toAudioClassificationCounts:", objc_msgSend(v17, "clsInterestingAudioClassifications"), v56);
        }
        else if ([v17 clsIsInterestingPanorama])
        {
          ++v54;
        }
        else if ([v17 representsBurst])
        {
          ++v53;
        }
        else
        {
          v52 += [v17 clsIsInterestingSDOF];
        }
        double v15 = v15 + (double)v18;
        double v14 = v14 + (double)v19;
        v11 += v20;
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v62 objects:v67 count:16];
    }
    while (v9);
    double v21 = (double)v12;
    double v22 = (double)v11;
    unint64_t v23 = v52;
    unint64_t v24 = v54;
  }
  else
  {
    unint64_t v23 = 0;
    unint64_t v53 = 0;
    unint64_t v10 = 0;
    unint64_t v24 = 0;
    double v22 = 0.0;
    double v21 = 0.0;
    double v14 = 0.0;
    double v15 = 0.0;
  }

  double v25 = v15 / v6;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  double v26 = v14 / v6;
  id v27 = obj;
  uint64_t v28 = [v27 countByEnumeratingWithState:&v58 objects:v66 count:16];
  double v29 = 0.0;
  if (v28)
  {
    uint64_t v30 = v28;
    uint64_t v31 = *(void *)v59;
    double v8 = 0.0;
    do
    {
      for (uint64_t j = 0; j != v30; ++j)
      {
        if (*(void *)v59 != v31) {
          objc_enumerationMutation(v27);
        }
        v33 = *(void **)(*((void *)&v58 + 1) + 8 * j);
        uint64_t v34 = objc_msgSend(v33, "clsViewCount", v52);
        double v29 = v29 + ((double)v34 - v25) * ((double)v34 - v25);
        uint64_t v35 = [v33 clsPlayCount];
        double v8 = v8 + ((double)v35 - v26) * ((double)v35 - v26);
      }
      uint64_t v30 = [v27 countByEnumeratingWithState:&v58 objects:v66 count:16];
    }
    while (v30);
  }

  double v36 = v25 + sqrt(v29 / v6) * 2.0;
  double v37 = v26 + sqrt(v8 / v6) * 2.0;
  v38 = [MEMORY[0x263EFFA40] standardUserDefaults];
  int v39 = [v38 BOOLForKey:@"CLSAssetScoreIgnoreViewPlayCount"];

  if (v39)
  {
    double v37 = 1.79769313e308;
    double v40 = 1.79769313e308;
  }
  else
  {
    double v40 = v36;
  }
  double v41 = sqrt(v6) + -1.0;
  if (v41 < 0.0) {
    double v41 = 0.0;
  }
  double v42 = ceil(v41);
  BOOL v43 = v42 >= v21;
  BOOL v44 = v42 >= v22;
  BOOL v45 = v42 >= (double)v24;
  BOOL v46 = v42 >= (double)v10;
  BOOL v47 = v42 >= (double)v53;
  BOOL v48 = v42 >= (double)v23;
  uint64_t v49 = objc_msgSend(a1, "audioClassificationsToEmphasizeWithAudioClassificationCounts:threshold:", v56);
  id v50 = objc_alloc_init(CLSAssetScoringContext);
  [(CLSAssetScoringContext *)v50 setViewCountThreshold:v40];
  [(CLSAssetScoringContext *)v50 setPlayCountThreshold:v37];
  [(CLSAssetScoringContext *)v50 setShouldEmphasizeShared:v43];
  [(CLSAssetScoringContext *)v50 setShouldEmphasizeAdjusted:v44];
  [(CLSAssetScoringContext *)v50 setShouldEmphasizePanorama:v45];
  [(CLSAssetScoringContext *)v50 setShouldEmphasizeLive:v46];
  [(CLSAssetScoringContext *)v50 setShouldEmphasizeBurst:v47];
  [(CLSAssetScoringContext *)v50 setShouldEmphasizeSDOF:v48];
  [(CLSAssetScoringContext *)v50 setAudioClassificationsToEmphasize:v49];
  [(CLSAssetScoringContext *)v50 setAestheticScoreThresholdToBeAwesome:a4];

  return v50;
}

+ (double)legacyAestheticScoreThresholdToNotBeJunk
{
  [MEMORY[0x263F5E080] legacyAestheticScoreThresholdToNotBeJunk];
  return result;
}

+ (double)legacyAestheticScoreThresholdToBeAestheticallyPrettyGood
{
  [MEMORY[0x263F5E080] legacyAestheticScoreThresholdToBeAestheticallyPrettyGood];
  return result;
}

+ (double)legacyAestheticScoreThresholdToBeAwesome
{
  [MEMORY[0x263F5E080] legacyAestheticScoreThresholdToBeAwesome];
  return result;
}

@end
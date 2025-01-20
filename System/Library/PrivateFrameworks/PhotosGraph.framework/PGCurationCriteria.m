@interface PGCurationCriteria
- (BOOL)_passesForItem:(id)a3 score:(double *)a4 graph:(id)a5 reasonString:(id *)a6;
- (BOOL)filterUtilityAssets;
- (BOOL)isPassingForAsset:(id)a3 score:(double *)a4;
- (BOOL)passesForItem:(id)a3 score:(double *)a4;
- (PGCurationContentOrAestheticScoreTrait)contentOrAestheticScoreTrait;
- (PGCurationCriteria)initWithMinimumAssetsRatio:(double)a3 client:(unint64_t)a4;
- (PGCurationCropScoreTrait)cropScoreTrait;
- (PGCurationPartOfDayTrait)partOfDayTrait;
- (PGCurationSDFoodTrait)sdFoodTrait;
- (PGCurationSceneTrait)compulsoryScenesTrait;
- (PGCurationSceneTrait)scenesTrait;
- (PGCurationSetTrait)peopleTrait;
- (PGCurationSetTrait)socialGroupTrait;
- (double)_scoreForSceneClassifications:(id)a3 withSDFoodTrait:(id)a4 curationModel:(id)a5 traitFailed:(BOOL *)a6;
- (double)_scoreForSceneClassifications:(id)a3 withScenesTrait:(id)a4 curationModel:(id)a5 traitFailed:(BOOL *)a6;
- (double)minimumAssetsRatio;
- (id)niceDescriptionWithGraph:(id)a3;
- (id)passingAssetsInAssets:(id)a3;
- (id)peopleTraitStringWithGraph:(id)a3;
- (unint64_t)client;
- (unint64_t)faceFilter;
- (void)setCompulsoryScenesTrait:(id)a3;
- (void)setContentOrAestheticScoreTrait:(id)a3;
- (void)setCropScoreTrait:(id)a3;
- (void)setFaceFilter:(unint64_t)a3;
- (void)setFilterUtilityAssets:(BOOL)a3;
- (void)setMinimumAssetsRatio:(double)a3;
- (void)setPartOfDayTrait:(id)a3;
- (void)setPeopleTrait:(id)a3;
- (void)setScenesTrait:(id)a3;
- (void)setSdFoodTrait:(id)a3;
- (void)setSocialGroupTrait:(id)a3;
@end

@implementation PGCurationCriteria

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sdFoodTrait, 0);
  objc_storeStrong((id *)&self->_cropScoreTrait, 0);
  objc_storeStrong((id *)&self->_contentOrAestheticScoreTrait, 0);
  objc_storeStrong((id *)&self->_socialGroupTrait, 0);
  objc_storeStrong((id *)&self->_peopleTrait, 0);
  objc_storeStrong((id *)&self->_partOfDayTrait, 0);
  objc_storeStrong((id *)&self->_scenesTrait, 0);
  objc_storeStrong((id *)&self->_compulsoryScenesTrait, 0);
}

- (unint64_t)client
{
  return self->_client;
}

- (void)setFilterUtilityAssets:(BOOL)a3
{
  self->_filterUtilityAssets = a3;
}

- (BOOL)filterUtilityAssets
{
  return self->_filterUtilityAssets;
}

- (void)setSdFoodTrait:(id)a3
{
}

- (PGCurationSDFoodTrait)sdFoodTrait
{
  return self->_sdFoodTrait;
}

- (void)setCropScoreTrait:(id)a3
{
}

- (PGCurationCropScoreTrait)cropScoreTrait
{
  return self->_cropScoreTrait;
}

- (void)setContentOrAestheticScoreTrait:(id)a3
{
}

- (PGCurationContentOrAestheticScoreTrait)contentOrAestheticScoreTrait
{
  return self->_contentOrAestheticScoreTrait;
}

- (void)setSocialGroupTrait:(id)a3
{
}

- (PGCurationSetTrait)socialGroupTrait
{
  return self->_socialGroupTrait;
}

- (void)setPeopleTrait:(id)a3
{
}

- (PGCurationSetTrait)peopleTrait
{
  return self->_peopleTrait;
}

- (void)setFaceFilter:(unint64_t)a3
{
  self->_faceFilter = a3;
}

- (unint64_t)faceFilter
{
  return self->_faceFilter;
}

- (void)setPartOfDayTrait:(id)a3
{
}

- (PGCurationPartOfDayTrait)partOfDayTrait
{
  return self->_partOfDayTrait;
}

- (void)setScenesTrait:(id)a3
{
}

- (PGCurationSceneTrait)scenesTrait
{
  return self->_scenesTrait;
}

- (void)setCompulsoryScenesTrait:(id)a3
{
}

- (PGCurationSceneTrait)compulsoryScenesTrait
{
  return self->_compulsoryScenesTrait;
}

- (void)setMinimumAssetsRatio:(double)a3
{
  self->_minimumAssetsRatio = a3;
}

- (double)minimumAssetsRatio
{
  return self->_minimumAssetsRatio;
}

- (id)peopleTraitStringWithGraph:(id)a3
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v6 = [(PGCurationSetTrait *)self->_peopleTrait items];
  v7 = [v6 allObjects];
  v8 = (void *)[v5 initWithArray:v7];

  v9 = [(PGCurationSetTrait *)self->_peopleTrait negativeItems];
  v10 = [v9 allObjects];
  [v8 addObjectsFromArray:v10];

  v48 = v8;
  v49 = v4;
  v11 = [v4 personNodesForPersonLocalIdentifiers:v8];
  v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v11, "count"));
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id v13 = v11;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v59 objects:v66 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v60;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v60 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = *(void **)(*((void *)&v59 + 1) + 8 * i);
        v19 = [v18 localIdentifier];
        [v12 setObject:v18 forKeyedSubscript:v19];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v59 objects:v66 count:16];
    }
    while (v15);
  }
  v47 = v13;

  v20 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"self" ascending:1];
  v65 = v20;
  uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v65 count:1];

  id v22 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  v46 = self;
  v23 = [(PGCurationSetTrait *)self->_peopleTrait items];
  v50 = (void *)v21;
  v24 = [v23 sortedArrayUsingDescriptors:v21];

  uint64_t v25 = [v24 countByEnumeratingWithState:&v55 objects:v64 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v56;
    do
    {
      for (uint64_t j = 0; j != v26; ++j)
      {
        if (*(void *)v56 != v27) {
          objc_enumerationMutation(v24);
        }
        uint64_t v29 = *(void *)(*((void *)&v55 + 1) + 8 * j);
        v30 = [v12 objectForKeyedSubscript:v29];
        uint64_t v31 = [v30 name];
        v32 = (void *)v31;
        if (v31) {
          uint64_t v33 = v31;
        }
        else {
          uint64_t v33 = v29;
        }
        [v22 appendFormat:@"+ %@", v33];
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v55 objects:v64 count:16];
    }
    while (v26);
  }

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  v34 = [(PGCurationSetTrait *)v46->_peopleTrait negativeItems];
  v35 = [v34 sortedArrayUsingDescriptors:v50];

  uint64_t v36 = [v35 countByEnumeratingWithState:&v51 objects:v63 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = *(void *)v52;
    do
    {
      for (uint64_t k = 0; k != v37; ++k)
      {
        if (*(void *)v52 != v38) {
          objc_enumerationMutation(v35);
        }
        uint64_t v40 = *(void *)(*((void *)&v51 + 1) + 8 * k);
        v41 = [v12 objectForKeyedSubscript:v40];
        uint64_t v42 = [v41 name];
        v43 = (void *)v42;
        if (v42) {
          uint64_t v44 = v42;
        }
        else {
          uint64_t v44 = v40;
        }
        [v22 appendFormat:@"- %@", v44];
      }
      uint64_t v37 = [v35 countByEnumeratingWithState:&v51 objects:v63 count:16];
    }
    while (v37);
  }

  return v22;
}

- (id)niceDescriptionWithGraph:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F28E78] string];
  v6 = v5;
  if (self->_minimumAssetsRatio > 0.0) {
    objc_msgSend(v5, "appendFormat:", @"minimumAssetsRatio = %f\n", *(void *)&self->_minimumAssetsRatio);
  }
  if ([(PGCurationSceneTrait *)self->_compulsoryScenesTrait isActive])
  {
    v7 = [(PGCurationTrait *)self->_compulsoryScenesTrait niceDescription];
    [v6 appendFormat:@"compulsoryScenes = %@\n", v7];
  }
  if ([(PGCurationSceneTrait *)self->_scenesTrait isActive])
  {
    v8 = [(PGCurationTrait *)self->_scenesTrait niceDescription];
    [v6 appendFormat:@"scenes = %@\n", v8];
  }
  if ([(PGCurationPartOfDayTrait *)self->_partOfDayTrait isActive])
  {
    v9 = [(PGCurationPartOfDayTrait *)self->_partOfDayTrait niceDescription];
    [v6 appendFormat:@"partOfDay = %@\n", v9];
  }
  unint64_t faceFilter = self->_faceFilter;
  if (faceFilter)
  {
    if (faceFilter == 1) {
      v11 = @"Faces";
    }
    else {
      v11 = @"No Faces";
    }
    [v6 appendFormat:@"faceRequirement = %@\n", v11];
  }
  if ([(PGCurationSetTrait *)self->_peopleTrait isActive])
  {
    v12 = [(PGCurationCriteria *)self peopleTraitStringWithGraph:v4];
    [v6 appendFormat:@"people = %@\n", v12];
  }
  if ([(PGCurationSetTrait *)self->_socialGroupTrait isActive])
  {
    id v13 = [(PGCurationTrait *)self->_socialGroupTrait niceDescription];
    [v6 appendFormat:@"socialGroup = %@\n", v13];
  }
  if ([(PGCurationContentOrAestheticScoreTrait *)self->_contentOrAestheticScoreTrait isActive])
  {
    [(PGCurationTrait *)self->_contentOrAestheticScoreTrait minimumScore];
    uint64_t v15 = v14;
    [(PGCurationContentOrAestheticScoreTrait *)self->_contentOrAestheticScoreTrait minimumAestheticScore];
    objc_msgSend(v6, "appendFormat:", @"content score >= %.3f or aesthetic score >= %.3f\n", v15, v16);
  }
  if (self->_filterUtilityAssets) {
    [v6 appendFormat:@"filterUtilityAssets = YES\n"];
  }

  return v6;
}

- (double)_scoreForSceneClassifications:(id)a3 withSDFoodTrait:(id)a4 curationModel:(id)a5 traitFailed:(BOOL *)a6
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  *a6 = 1;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
  double v12 = 0.0;
  if (v11)
  {
    uint64_t v13 = v11;
    uint64_t v14 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v10);
        }
        uint64_t v16 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if (objc_msgSend(v16, "extendedSceneIdentifier", (void)v21) == 2147482622)
        {
          v17 = [v9 sdModel];
          v18 = [v17 foodDrinkNode];
          [v16 confidence];
          int v19 = objc_msgSend(v18, "passesWithConfidence:");

          if (v19)
          {
            *a6 = 0;
            double v12 = 1.0;
          }
          goto LABEL_12;
        }
      }
      uint64_t v13 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v12;
}

- (double)_scoreForSceneClassifications:(id)a3 withScenesTrait:(id)a4 curationModel:(id)a5 traitFailed:(BOOL *)a6
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  double v12 = [v10 sceneNames];
  uint64_t v13 = [v12 count];
  if (v13)
  {
    unint64_t v14 = v13;
    v41 = v12;
    id v42 = v11;
    v43 = a6;
    uint64_t v44 = v10;
    uint64_t v15 = [v10 confidenceThresholdBySceneIdentifierWithCurationModel:v11];
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v45 = v9;
    id v16 = v9;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v46 objects:v50 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      unint64_t v19 = 0;
      uint64_t v20 = *(void *)v47;
      while (2)
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v47 != v20) {
            objc_enumerationMutation(v16);
          }
          long long v22 = *(void **)(*((void *)&v46 + 1) + 8 * i);
          uint64_t v23 = [v22 extendedSceneIdentifier];
          long long v24 = [NSNumber numberWithUnsignedLongLong:v23];
          uint64_t v25 = [v15 objectForKeyedSubscript:v24];

          if (v25)
          {
            [v22 confidence];
            double v27 = v26;
            [v25 doubleValue];
            if (v27 >= v28) {
              ++v19;
            }
          }

          if (v19 == v14)
          {
            unint64_t v19 = v14;
            goto LABEL_17;
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v46 objects:v50 count:16];
        if (v18) {
          continue;
        }
        break;
      }
    }
    else
    {
      unint64_t v19 = 0;
    }
LABEL_17:

    id v10 = v44;
    uint64_t v30 = [v44 targetNumberOfMatches];
    if (v30) {
      unint64_t v31 = v30;
    }
    else {
      unint64_t v31 = v14;
    }
    double v32 = (double)v31;
    [v44 minimumScore];
    double v34 = v33;
    int v35 = [v44 isMatchingRequired];
    double v36 = (double)v19 / v32;
    if (v35) {
      double v37 = v34;
    }
    else {
      double v37 = 1.0;
    }
    double v38 = fmin(v36 / v37, 1.0);
    char v39 = v35 & (v36 < v34);
    if (v39) {
      double v29 = 0.0;
    }
    else {
      double v29 = v38;
    }
    if (v43) {
      *v43 &= v39;
    }

    id v9 = v45;
    double v12 = v41;
    id v11 = v42;
  }
  else
  {
    double v29 = 0.0;
  }

  return v29;
}

- (BOOL)_passesForItem:(id)a3 score:(double *)a4 graph:(id)a5 reasonString:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  BOOL v75 = 0;
  if (a6) {
    id v12 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  }
  else {
    id v12 = 0;
  }
  if (self->_filterUtilityAssets)
  {
    [v10 clsContentScore];
    BOOL v14 = v13 < *MEMORY[0x1E4F8E740];
    BOOL v75 = v14;
    if (v14)
    {
      [v12 appendString:@"FAILED: item is utility\n"];
      uint64_t v15 = 0;
      double v16 = 0.0;
      goto LABEL_65;
    }
  }
  if ([(PGCurationSceneTrait *)self->_compulsoryScenesTrait isActive])
  {
    uint64_t v15 = [v10 clsSceneClassifications];
    compulsoryScenesTrait = self->_compulsoryScenesTrait;
    uint64_t v18 = [v10 curationModel];
    [(PGCurationCriteria *)self _scoreForSceneClassifications:v15 withScenesTrait:compulsoryScenesTrait curationModel:v18 traitFailed:&v75];

    if (v75)
    {
      unint64_t v19 = [(PGCurationTrait *)self->_compulsoryScenesTrait niceDescription];
      [v12 appendFormat:@"FAILED: missing compulsory scenes %@", v19];

      double v16 = 0.0;
      if (v75) {
        goto LABEL_65;
      }
    }
    if ([(PGCurationSceneTrait *)self->_scenesTrait isActive])
    {
      if (v15)
      {
LABEL_16:
        scenesTrait = self->_scenesTrait;
        long long v21 = [v10 curationModel];
        [(PGCurationCriteria *)self _scoreForSceneClassifications:v15 withScenesTrait:scenesTrait curationModel:v21 traitFailed:&v75];
        double v23 = v22;

        LODWORD(v21) = v75;
        uint64_t v24 = [(PGCurationTrait *)self->_scenesTrait niceDescription];
        uint64_t v25 = (void *)v24;
        if (v21) {
          [v12 appendFormat:@"FAILED: missing scenes %@", v24, v67];
        }
        else {
          [v12 appendFormat:@" - scored %f on scenes %@\n", *(void *)&v23, v24];
        }
        double v16 = v23 + 0.0;

        unint64_t v26 = 1;
        goto LABEL_22;
      }
LABEL_15:
      uint64_t v15 = [v10 clsSceneClassifications];
      goto LABEL_16;
    }
  }
  else
  {
    if ([(PGCurationSceneTrait *)self->_scenesTrait isActive]) {
      goto LABEL_15;
    }
    uint64_t v15 = 0;
  }
  unint64_t v26 = 0;
  double v16 = 0.0;
LABEL_22:
  if (v75) {
    goto LABEL_60;
  }
  if ([(PGCurationPartOfDayTrait *)self->_partOfDayTrait isActive])
  {
    double v27 = [MEMORY[0x1E4F76D48] partOfDayForItem:v10];
    if (v27)
    {
      unint64_t v72 = v26;
      unint64_t v28 = [(PGCurationPartOfDayTrait *)self->_partOfDayTrait value];
      unint64_t v29 = +[PGGraphPartOfDayNode partOfDayForPartOfDayName:v27];
      if (v29 != 1)
      {
        unint64_t v30 = v29;
        unint64_t v70 = v29 & v28;
        BOOL v31 = [(PGCurationTrait *)self->_partOfDayTrait isMatchingRequired];
        if (v30 == v70) {
          double v32 = 1.0;
        }
        else {
          double v32 = 0.0;
        }
        BOOL v33 = v30 != v70 && v31;
        BOOL v75 = v33;
        ++v72;
        uint64_t v34 = +[PGGraphPartOfDayNode stringValueForPartOfDay:v28];
        int v35 = (void *)v34;
        if (v33) {
          [v12 appendFormat:@"FAILED: not matching part of day (%@ != %@)", v27, v34, v68];
        }
        else {
          [v12 appendFormat:@" - scored %f on part of day (%@, expected %@)\n", *(void *)&v32, v27, v34];
        }
        double v16 = v16 + v32;
      }
      unint64_t v26 = v72;
    }
  }
  if (v75) {
    goto LABEL_60;
  }
  if ([(PGCurationSetTrait *)self->_peopleTrait isActive])
  {
    unint64_t v73 = v26;
    uint64_t v36 = [v10 clsPersonAndPetLocalIdentifiers];
    double v37 = [(PGCurationSetTrait *)self->_peopleTrait items];
    v71 = (void *)v36;
    double v38 = [MEMORY[0x1E4F1CA80] setWithArray:v36];
    [v38 intersectSet:v37];
    if (v12)
    {
      uint64_t v69 = [(PGCurationCriteria *)self peopleTraitStringWithGraph:v11];
    }
    else
    {
      uint64_t v69 = 0;
    }
    if ([v38 isEqualToSet:v37])
    {
      char v39 = [MEMORY[0x1E4F1CA80] setWithArray:v71];
      [v39 minusSet:v38];
      unint64_t v40 = [v39 count];
      if (v40 <= 0xA) {
        double v41 = (double)v40 / -10.0 + 1.0;
      }
      else {
        double v41 = 0.0;
      }
      ++v73;
      if (v75) {
        [v12 appendFormat:@"FAILED: too many people around %@", v69, v67];
      }
      else {
        [v12 appendFormat:@" - scored %f on people %@\n", *(void *)&v41, v69];
      }
      double v16 = v16 + v41;

      id v42 = (void *)v69;
    }
    else
    {
      BOOL v75 = 1;
      id v42 = (void *)v69;
      [v12 appendFormat:@"FAILED: not matching people %@", v69];
    }

    unint64_t v26 = v73;
  }
  if (v75) {
    goto LABEL_60;
  }
  if ([(PGCurationSetTrait *)self->_socialGroupTrait isActive])
  {
    v43 = (void *)MEMORY[0x1E4F1CA80];
    uint64_t v44 = [v10 clsPersonAndPetLocalIdentifiers];
    id v45 = [v43 setWithArray:v44];

    long long v46 = [(PGCurationSetTrait *)self->_socialGroupTrait items];
    [v45 intersectSet:v46];
    unint64_t v47 = [v45 count];
    if (v47)
    {
      ++v26;
      double v16 = v16 + (double)v47 / (double)(unint64_t)[v46 count];
    }
    else
    {
      BOOL v75 = 1;
      [(PGCurationTrait *)self->_socialGroupTrait niceDescription];
      long long v48 = v74 = v26;
      [v12 appendFormat:@"FAILED: not matching any people from social group %@", v48];

      unint64_t v26 = v74;
    }
  }
  if (v75) {
    goto LABEL_60;
  }
  if (![(PGCurationContentOrAestheticScoreTrait *)self->_contentOrAestheticScoreTrait isActive])
  {
LABEL_74:
    if (v75) {
      goto LABEL_60;
    }
    goto LABEL_75;
  }
  [v10 clsContentScore];
  double v52 = v51;
  [(PGCurationTrait *)self->_contentOrAestheticScoreTrait minimumScore];
  BOOL v75 = v52 < v53;
  if (v52 < v53)
  {
    double v54 = v53;
    [v10 clsAestheticScore];
    double v56 = v55;
    [(PGCurationContentOrAestheticScoreTrait *)self->_contentOrAestheticScoreTrait minimumAestheticScore];
    BOOL v75 = v56 < v57;
    if (v56 < v57)
    {
      objc_msgSend(v12, "appendFormat:", @"FAILED: content score %.3f is lower than %.3f and aesthetic score %.3f is lower than %.3f", *(void *)&v52, *(void *)&v54, *(void *)&v56, *(void *)&v57);
      goto LABEL_74;
    }
  }
LABEL_75:
  if ([(PGCurationCropScoreTrait *)self->_cropScoreTrait isActive])
  {
    [v10 clsSquareCropScore];
    double v59 = v58;
    [(PGCurationCropScoreTrait *)self->_cropScoreTrait minimumSquareCropScore];
    BOOL v75 = v59 < v60;
    if (v59 >= v60) {
      goto LABEL_79;
    }
    objc_msgSend(v12, "appendFormat:", @"FAILED: crop score %.3f is lower than %.3f", *(void *)&v59, *(void *)&v60);
  }
  if (!v75)
  {
LABEL_79:
    if ([(PGCurationSDFoodTrait *)self->_sdFoodTrait isActive])
    {
      if (!v15)
      {
        uint64_t v15 = [v10 clsSceneClassifications];
      }
      sdFoodTrait = self->_sdFoodTrait;
      long long v62 = [v10 curationModel];
      [(PGCurationCriteria *)self _scoreForSceneClassifications:v15 withSDFoodTrait:sdFoodTrait curationModel:v62 traitFailed:&v75];
      double v64 = v63;

      ++v26;
      LODWORD(sdFoodTrait) = v75;
      uint64_t v65 = [(PGCurationTrait *)self->_sdFoodTrait niceDescription];
      v66 = (void *)v65;
      if (sdFoodTrait) {
        [v12 appendFormat:@"FAILED: missing SD food classification %@", v65, v67];
      }
      else {
        [v12 appendFormat:@" - scored %f on SD food %@\n", *(void *)&v64, v65];
      }
      double v16 = v16 + v64;
    }
  }
LABEL_60:
  if (!v75 && v26)
  {
    double v16 = v16 / (double)v26;
    BOOL v75 = v16 <= 0.0;
    if (v16 > 0.0) {
      objc_msgSend(v12, "appendFormat:", @"Scored %f for the whole criteria\n", *(void *)&v16);
    }
    else {
      objc_msgSend(v12, "appendFormat:", @"FAILED: total score %f too low", *(void *)&v16);
    }
  }
LABEL_65:
  if (a4) {
    *a4 = v16;
  }
  if (a6) {
    *a6 = v12;
  }
  BOOL v49 = !v75;

  return v49;
}

- (BOOL)passesForItem:(id)a3 score:(double *)a4
{
  return [(PGCurationCriteria *)self _passesForItem:a3 score:a4 graph:0 reasonString:0];
}

- (id)passingAssetsInAssets:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        if (-[PGCurationCriteria passesForItem:score:](self, "passesForItem:score:", v11, 0, (void)v13)) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (BOOL)isPassingForAsset:(id)a3 score:(double *)a4
{
  id v6 = a3;
  uint64_t v7 = v6;
  unsigned __int8 v33 = 0;
  if (self->_filterUtilityAssets)
  {
    [v6 clsContentScore];
    int v9 = v8 < *MEMORY[0x1E4F8E740];
    unsigned __int8 v33 = v8 < *MEMORY[0x1E4F8E740];
  }
  else
  {
    int v9 = 0;
  }
  if ([(PGCurationSceneTrait *)self->_compulsoryScenesTrait isActive])
  {
    id v10 = [v7 clsSceneClassifications];
    compulsoryScenesTrait = self->_compulsoryScenesTrait;
    id v12 = [v7 curationModel];
    [(PGCurationCriteria *)self _scoreForSceneClassifications:v10 withScenesTrait:compulsoryScenesTrait curationModel:v12 traitFailed:&v33];

    int v9 = v33;
  }
  else
  {
    id v10 = 0;
  }
  double v13 = 0.0;
  if (v9) {
    goto LABEL_32;
  }
  if ([(PGCurationSceneTrait *)self->_scenesTrait isActive])
  {
    if (!v10)
    {
      id v10 = [v7 clsSceneClassifications];
    }
    scenesTrait = self->_scenesTrait;
    long long v15 = [v7 curationModel];
    [(PGCurationCriteria *)self _scoreForSceneClassifications:v10 withScenesTrait:scenesTrait curationModel:v15 traitFailed:&v33];
    double v17 = v16;

    double v13 = v17 + 0.0;
    unint64_t v18 = 1;
  }
  else
  {
    unint64_t v18 = 0;
  }
  if (v33) {
    goto LABEL_30;
  }
  if ([(PGCurationPartOfDayTrait *)self->_partOfDayTrait isActive])
  {
    unint64_t v19 = [MEMORY[0x1E4F76D48] partOfDayForItem:v7];
    if (v19)
    {
      unint64_t v20 = [(PGCurationPartOfDayTrait *)self->_partOfDayTrait value];
      unint64_t v21 = +[PGGraphPartOfDayNode partOfDayForPartOfDayName:v19];
      if (v21 != 1)
      {
        if ((v21 & ~v20) != 0) {
          double v22 = 0.0;
        }
        else {
          double v22 = 1.0;
        }
        double v13 = v13 + v22;
        BOOL v23 = [(PGCurationTrait *)self->_partOfDayTrait isMatchingRequired];
        BOOL v24 = v22 == 0.0 && v23;
        v33 |= v24;
        ++v18;
      }
    }
  }
  if (v33 || ![(PGCurationSDFoodTrait *)self->_sdFoodTrait isActive])
  {
LABEL_30:
    if (!v18) {
      goto LABEL_32;
    }
  }
  else
  {
    if (!v10)
    {
      id v10 = [v7 clsSceneClassifications];
    }
    sdFoodTrait = self->_sdFoodTrait;
    unint64_t v26 = [v7 curationModel];
    [(PGCurationCriteria *)self _scoreForSceneClassifications:v10 withSDFoodTrait:sdFoodTrait curationModel:v26 traitFailed:&v33];
    double v28 = v27;

    double v13 = v13 + v28;
    ++v18;
  }
  double v13 = v13 / (double)v18;
LABEL_32:
  BOOL v30 = v13 + -2.22044605e-16 <= 0.0 && v33 != 0;
  unsigned __int8 v33 = v30;
  if (a4) {
    *a4 = v13;
  }
  BOOL v31 = !v30;

  return v31;
}

- (PGCurationCriteria)initWithMinimumAssetsRatio:(double)a3 client:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PGCurationCriteria;
  result = [(PGCurationCriteria *)&v7 init];
  if (result)
  {
    result->_minimumAssetsRatio = a3;
    result->_unint64_t faceFilter = 1;
    result->_filterUtilityAssets = 1;
    result->_client = a4;
  }
  return result;
}

@end
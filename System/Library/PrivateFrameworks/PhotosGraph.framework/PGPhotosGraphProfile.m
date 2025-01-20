@interface PGPhotosGraphProfile
+ (NSString)partOfDayAfternoon;
+ (NSString)partOfDayEvening;
+ (NSString)partOfDayMorning;
+ (NSString)partOfDayNight;
+ (NSString)partOfDayNoon;
+ (NSString)poiActivity;
+ (NSString)poiAmusementPark;
+ (NSString)poiCulture;
+ (NSString)poiDiving;
+ (NSString)poiEntertainment;
+ (NSString)poiHiking;
+ (NSString)poiHospital;
+ (NSString)poiMuseum;
+ (NSString)poiNightlife;
+ (NSString)poiPark;
+ (NSString)poiPerformance;
+ (NSString)poiRestaurant;
+ (NSString)poiStadium;
+ (NSString)poiTravel;
+ (NSString)poiUnknown;
+ (NSString)roiBeach;
+ (NSString)roiMoutain;
+ (NSString)roiNature;
+ (NSString)roiUrban;
+ (NSString)roiWater;
+ (id)_computeBlockedTaxonomyNodeNamesWithSceneTaxonomy:(id)a3;
+ (id)classIdentifier;
+ (id)informantDependenciesIdentifiers;
+ (id)profileDependenciesIdentifiers;
+ (id)supportedMeaningClueKeys;
- (BOOL)isBlockedTaxonomyNodeWithName:(id)a3;
- (PGPhotosGraphProfile)init;
- (PGPhotosGraphProfile)initWithSceneTaxonomy:(id)a3;
- (void)_insertEntityNetScenesForClueCollection:(id)a3 personalTraitsOnly:(BOOL)a4;
- (void)_insertEventCluesForClueCollection:(id)a3 serviceManager:(id)a4 locationCache:(id)a5;
- (void)_insertPlacesForClueCollection:(id)a3;
- (void)_insertScenesForClueCollection:(id)a3;
- (void)processResultsSynchronouslyForInvestigation:(id)a3 withProgressBlock:(id)a4;
@end

@implementation PGPhotosGraphProfile

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personalTraitsSceneNames, 0);
  objc_storeStrong((id *)&self->_blockedTaxonomyNodeNames, 0);
}

- (BOOL)isBlockedTaxonomyNodeWithName:(id)a3
{
  return [(NSSet *)self->_blockedTaxonomyNodeNames containsObject:a3];
}

- (void)processResultsSynchronouslyForInvestigation:(id)a3 withProgressBlock:(id)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = (void (**)(void *, unsigned char *, double))_Block_copy(v7);
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x2020000000;
  char v49 = 0;
  uint64_t v42 = 0;
  v43 = (double *)&v42;
  uint64_t v44 = 0x2020000000;
  uint64_t v45 = 0;
  v9 = [v6 clueCollection];
  if ((CLSDeviceIs2GBOrLess() & 1) == 0)
  {
    v10 = [v6 helper];
    v11 = [v10 serviceManager];
    v12 = [v6 helper];
    v13 = [v12 locationCache];
    [(PGPhotosGraphProfile *)self _insertEventCluesForClueCollection:v9 serviceManager:v11 locationCache:v13];
  }
  if (v8)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    if (Current - v43[3] >= 0.01)
    {
      v43[3] = Current;
      char v41 = 0;
      v8[2](v8, &v41, 0.1);
      char v15 = *((unsigned char *)v47 + 24) | v41;
      *((unsigned char *)v47 + 24) = v15;
      if (v15)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          int v51 = 228;
          __int16 v52 = 2080;
          v53 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Profil"
                "e/PGPhotosGraphProfile.m";
          v16 = MEMORY[0x1E4F14500];
LABEL_30:
          _os_log_impl(&dword_1D1805000, v16, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          goto LABEL_46;
        }
        goto LABEL_46;
      }
    }
  }
  [(PGPhotosGraphProfile *)self _insertPlacesForClueCollection:v9];
  if (!v8
    || (double v17 = CFAbsoluteTimeGetCurrent(), v17 - v43[3] < 0.01)
    || (v43[3] = v17, v41 = 0, v8[2](v8, &v41, 0.2), char v18 = *((unsigned char *)v47 + 24) | v41, (*((unsigned char *)v47 + 24) = v18) == 0))
  {
    [(PGPhotosGraphProfile *)self _insertScenesForClueCollection:v9];
    if (v8)
    {
      double v19 = CFAbsoluteTimeGetCurrent();
      if (v19 - v43[3] >= 0.01)
      {
        v43[3] = v19;
        char v41 = 0;
        v8[2](v8, &v41, 0.3);
        char v20 = *((unsigned char *)v47 + 24) | v41;
        *((unsigned char *)v47 + 24) = v20;
        if (v20)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            int v51 = 234;
            __int16 v52 = 2080;
            v53 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Prof"
                  "ile/PGPhotosGraphProfile.m";
            v16 = MEMORY[0x1E4F14500];
            goto LABEL_30;
          }
          goto LABEL_46;
        }
      }
    }
    if (_os_feature_enabled_impl())
    {
      [(PGPhotosGraphProfile *)self _insertEntityNetScenesForClueCollection:v9 personalTraitsOnly:0];
      if (v8)
      {
        double v21 = CFAbsoluteTimeGetCurrent();
        if (v21 - v43[3] >= 0.01)
        {
          v43[3] = v21;
          char v41 = 0;
          v8[2](v8, &v41, 0.4);
          char v22 = *((unsigned char *)v47 + 24) | v41;
          *((unsigned char *)v47 + 24) = v22;
          if (v22)
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              int v51 = 238;
              __int16 v52 = 2080;
              v53 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Pr"
                    "ofile/PGPhotosGraphProfile.m";
              v16 = MEMORY[0x1E4F14500];
              goto LABEL_30;
            }
            goto LABEL_46;
          }
        }
      }
    }
    else if (_os_feature_enabled_impl())
    {
      [(PGPhotosGraphProfile *)self _insertEntityNetScenesForClueCollection:v9 personalTraitsOnly:1];
      if (v8)
      {
        double v23 = CFAbsoluteTimeGetCurrent();
        if (v23 - v43[3] >= 0.01)
        {
          v43[3] = v23;
          char v41 = 0;
          v8[2](v8, &v41, 0.45);
          char v24 = *((unsigned char *)v47 + 24) | v41;
          *((unsigned char *)v47 + 24) = v24;
          if (v24)
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              int v51 = 243;
              __int16 v52 = 2080;
              v53 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Pr"
                    "ofile/PGPhotosGraphProfile.m";
              v16 = MEMORY[0x1E4F14500];
              goto LABEL_30;
            }
            goto LABEL_46;
          }
        }
      }
    }
    if (![v9 numberOfLocations]) {
      goto LABEL_46;
    }
    v25 = [v6 helper];
    v26 = [v25 locationCache];

    v27 = [v9 mePerson];
    v28 = v27;
    if (v27)
    {
      [v27 prefetchPersonAddressesIfNeededWithLocationCache:v26];
      if (!v8) {
        goto LABEL_45;
      }
      double v29 = CFAbsoluteTimeGetCurrent();
      if (v29 - v43[3] >= 0.01)
      {
        v43[3] = v29;
        char v41 = 0;
        v8[2](v8, &v41, 0.5);
        char v30 = *((unsigned char *)v47 + 24) | v41;
        *((unsigned char *)v47 + 24) = v30;
        if (v30)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            int v51 = 253;
            __int16 v52 = 2080;
            v53 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Prof"
                  "ile/PGPhotosGraphProfile.m";
            v31 = MEMORY[0x1E4F14500];
LABEL_43:
            _os_log_impl(&dword_1D1805000, v31, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            goto LABEL_44;
          }
          goto LABEL_44;
        }
      }
    }
    else if (!v8)
    {
      goto LABEL_45;
    }
    double v32 = CFAbsoluteTimeGetCurrent();
    if (v32 - v43[3] >= 0.01)
    {
      v43[3] = v32;
      char v41 = 0;
      v8[2](v8, &v41, 0.6);
      char v33 = *((unsigned char *)v47 + 24) | v41;
      *((unsigned char *)v47 + 24) = v33;
      if (v33)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          int v51 = 256;
          __int16 v52 = 2080;
          v53 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Profil"
                "e/PGPhotosGraphProfile.m";
          v31 = MEMORY[0x1E4F14500];
          goto LABEL_43;
        }
LABEL_44:

        goto LABEL_46;
      }
    }
LABEL_45:
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __86__PGPhotosGraphProfile_processResultsSynchronouslyForInvestigation_withProgressBlock___block_invoke;
    v35[3] = &unk_1E68E4BC8;
    id v34 = v26;
    id v36 = v34;
    v37 = v8;
    v38 = &v42;
    v39 = &v46;
    uint64_t v40 = 0x3F847AE147AE147BLL;
    [v9 enumeratePeopleClues:v35];

    goto LABEL_46;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    int v51 = 231;
    __int16 v52 = 2080;
    v53 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Profile/PGPh"
          "otosGraphProfile.m";
    v16 = MEMORY[0x1E4F14500];
    goto LABEL_30;
  }
LABEL_46:

  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v46, 8);
}

void __86__PGPhotosGraphProfile_processResultsSynchronouslyForInvestigation_withProgressBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = [a2 person];
  id v7 = v6;
  if (v6)
  {
    [v6 prefetchPersonAddressesIfNeededWithLocationCache:*(void *)(a1 + 32)];
    if (*(void *)(a1 + 40))
    {
      double Current = CFAbsoluteTimeGetCurrent();
      uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
      if (Current - *(double *)(v9 + 24) >= *(double *)(a1 + 64))
      {
        *(double *)(v9 + 24) = Current;
        (*(void (**)(double))(*(void *)(a1 + 40) + 16))(0.7);
        *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                              + 24);
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
          *a4 = 1;
        }
      }
    }
  }
}

- (void)_insertEntityNetScenesForClueCollection:(id)a3 personalTraitsOnly:(BOOL)a4
{
  id v6 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v7 = a3;
  id v8 = objc_alloc_init(v6);
  uint64_t v9 = [v7 outputCluesForKey:*MEMORY[0x1E4F76DC8]];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __83__PGPhotosGraphProfile__insertEntityNetScenesForClueCollection_personalTraitsOnly___block_invoke;
  v11[3] = &unk_1E68E4BA0;
  BOOL v13 = a4;
  v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  [v9 enumerateObjectsUsingBlock:v11];
  [v7 mergeClues:v10];
}

void __83__PGPhotosGraphProfile__insertEntityNetScenesForClueCollection_personalTraitsOnly___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  v3 = [v10 value];
  if (v3
    && (!*(unsigned char *)(a1 + 48) || [*(id *)(*(void *)(a1 + 32) + 24) containsObject:v3]))
  {
    v4 = (void *)MEMORY[0x1E4F76D10];
    [v10 confidence];
    double v6 = v5;
    [v10 relevance];
    id v8 = [v4 clueWithValue:v3 forKey:@"EntityNetScene" confidence:v6 relevance:v7];
    uint64_t v9 = [v10 extraParameters];
    [v8 setExtraParameters:v9];

    [*(id *)(a1 + 40) addObject:v8];
  }
}

- (void)_insertScenesForClueCollection:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  double v7 = [v5 outputCluesForKey:*MEMORY[0x1E4F76DD0]];
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  v11 = __55__PGPhotosGraphProfile__insertScenesForClueCollection___block_invoke;
  id v12 = &unk_1E68E4B78;
  BOOL v13 = self;
  id v14 = v6;
  id v8 = v6;
  [v7 enumerateObjectsUsingBlock:&v9];
  objc_msgSend(v5, "mergeClues:", v8, v9, v10, v11, v12, v13);
}

void __55__PGPhotosGraphProfile__insertScenesForClueCollection___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  v3 = [v10 value];
  if (v3 && ([*(id *)(a1 + 32) isBlockedTaxonomyNodeWithName:v3] & 1) == 0)
  {
    v4 = (void *)MEMORY[0x1E4F76D10];
    [v10 confidence];
    double v6 = v5;
    [v10 relevance];
    id v8 = [v4 clueWithValue:v3 forKey:@"Scene" confidence:v6 relevance:v7];
    uint64_t v9 = [v10 extraParameters];
    [v8 setExtraParameters:v9];

    [*(id *)(a1 + 40) addObject:v8];
  }
}

- (void)_insertPlacesForClueCollection:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CA80];
  id v4 = a3;
  double v5 = [v3 set];
  double v6 = [v4 outputCluesForKey:*MEMORY[0x1E4F76B50]];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __55__PGPhotosGraphProfile__insertPlacesForClueCollection___block_invoke;
  v16[3] = &unk_1E68E4B50;
  id v7 = v5;
  id v17 = v7;
  [v6 enumerateObjectsUsingBlock:v16];
  id v8 = [v4 outputCluesForKey:*MEMORY[0x1E4F76AC8]];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  BOOL v13 = __55__PGPhotosGraphProfile__insertPlacesForClueCollection___block_invoke_2;
  id v14 = &unk_1E68E4B50;
  id v15 = v7;
  id v9 = v7;
  [v8 enumerateObjectsUsingBlock:&v11];
  id v10 = objc_msgSend(v9, "allObjects", v11, v12, v13, v14);
  [v4 mergeClues:v10];
}

void __55__PGPhotosGraphProfile__insertPlacesForClueCollection___block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)MEMORY[0x1E4F76D10];
  id v4 = a2;
  double v5 = [v4 value];
  [v4 confidence];
  double v7 = v6;
  [v4 relevance];
  id v11 = [v3 clueWithValue:v5 forKey:@"ROI" confidence:v7 relevance:v8];

  id v9 = [v4 relatedInputLocationClues];

  id v10 = [v9 firstObject];
  [v11 setRelatedData:v10];

  [*(id *)(a1 + 32) addObject:v11];
}

void __55__PGPhotosGraphProfile__insertPlacesForClueCollection___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = (void *)MEMORY[0x1E4F76D10];
  id v4 = a2;
  double v5 = [v4 value];
  [v4 confidence];
  double v7 = v6;
  [v4 relevance];
  id v11 = [v3 clueWithValue:v5 forKey:@"POI" confidence:v7 relevance:v8];

  id v9 = [v4 relatedInputLocationClues];

  id v10 = [v9 firstObject];
  [v11 setRelatedData:v10];

  [*(id *)(a1 + 32) addObject:v11];
}

- (void)_insertEventCluesForClueCollection:(id)a3 serviceManager:(id)a4 locationCache:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v8 eventsForClueCollection:v7];
  id v11 = [MEMORY[0x1E4F1CA48] array];
  [v10 count];
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  char v18 = __88__PGPhotosGraphProfile__insertEventCluesForClueCollection_serviceManager_locationCache___block_invoke;
  double v19 = &unk_1E68E4B28;
  id v20 = v7;
  id v21 = v9;
  id v22 = v8;
  id v23 = v11;
  id v12 = v11;
  id v13 = v8;
  id v14 = v9;
  id v15 = v7;
  [v10 enumerateObjectsUsingBlock:&v16];
  objc_msgSend(v15, "mergeClues:", v12, v16, v17, v18, v19);
}

void __88__PGPhotosGraphProfile__insertEventCluesForClueCollection_serviceManager_locationCache___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 location];
  double v32 = v3;
  if (v4)
  {
    double v5 = [v3 location];
    [v5 coordinate];
    double v7 = v6;
    double v9 = v8;
    double v43 = v6;
    double v44 = v8;

    if (objc_msgSend(MEMORY[0x1E4F8A930], "canUseCoordinate:", v7, v9))
    {
      [*(id *)(a1 + 32) locations];
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v11 = [v10 countByEnumeratingWithState:&v39 objects:v47 count:16];
      id v12 = v10;
      if (v11)
      {
        uint64_t v13 = v11;
        uint64_t v14 = *(void *)v40;
        while (2)
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v40 != v14) {
              objc_enumerationMutation(v10);
            }
            uint64_t v16 = *(void **)(*((void *)&v39 + 1) + 8 * i);
            if (([MEMORY[0x1E4F8A930] locationIsCoarse:v16] & 1) == 0)
            {
              [v16 coordinate];
              uint64_t v37 = v17;
              uint64_t v38 = v18;
              CLLocationCoordinate2DGetDistanceFrom();
              if (v19 < 1500.0)
              {

                id v12 = [MEMORY[0x1E4F76CC0] clueWithLocation:v4 locationCache:*(void *)(a1 + 40)];
                id v20 = (void *)MEMORY[0x1E4F76CD0];
                id v21 = [v3 startDate];
                v46[0] = v21;
                id v22 = [v3 endDate];
                v46[1] = v22;
                id v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:2];
                char v24 = [v20 clueWithDates:v23 serviceManager:*(void *)(a1 + 48)];

                id v3 = v32;
                [*(id *)(a1 + 56) addObject:v12];
                [*(id *)(a1 + 56) addObject:v24];

                goto LABEL_14;
              }
            }
          }
          uint64_t v13 = [v10 countByEnumeratingWithState:&v39 objects:v47 count:16];
          if (v13) {
            continue;
          }
          break;
        }
        id v12 = v10;
      }
LABEL_14:
    }
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v25 = [v3 attendees];
  uint64_t v26 = [v25 countByEnumeratingWithState:&v33 objects:v45 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v34;
    do
    {
      for (uint64_t j = 0; j != v27; ++j)
      {
        if (*(void *)v34 != v28) {
          objc_enumerationMutation(v25);
        }
        char v30 = [*(id *)(*((void *)&v33 + 1) + 8 * j) objectForKeyedSubscript:@"name"];
        if (v30)
        {
          v31 = [MEMORY[0x1E4F76CC8] clueWithPeople:v30 serviceManager:*(void *)(a1 + 48)];
          [*(id *)(a1 + 56) addObject:v31];
        }
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v33 objects:v45 count:16];
    }
    while (v27);
  }
}

- (PGPhotosGraphProfile)initWithSceneTaxonomy:(id)a3
{
  id v4 = a3;
  double v5 = [(PGPhotosGraphProfile *)self init];
  if (v5)
  {
    uint64_t v6 = [(id)objc_opt_class() _computeBlockedTaxonomyNodeNamesWithSceneTaxonomy:v4];
    blockedTaxonomyNodeNames = v5->_blockedTaxonomyNodeNames;
    v5->_blockedTaxonomyNodeNames = (NSSet *)v6;
  }
  return v5;
}

- (PGPhotosGraphProfile)init
{
  v8.receiver = self;
  v8.super_class = (Class)PGPhotosGraphProfile;
  v2 = [(CLSProfile *)&v8 init];
  if (v2)
  {
    if (_os_feature_enabled_impl())
    {
      id v3 = (NSSet *)objc_alloc_init(MEMORY[0x1E4F8E848]);
      uint64_t v4 = [(NSSet *)v3 sceneNames];
      personalTraitsSceneNames = v2->_personalTraitsSceneNames;
      v2->_personalTraitsSceneNames = (NSSet *)v4;
    }
    else
    {
      uint64_t v6 = (NSSet *)objc_alloc_init(MEMORY[0x1E4F1CAD0]);
      id v3 = v2->_personalTraitsSceneNames;
      v2->_personalTraitsSceneNames = v6;
    }
  }
  return v2;
}

+ (NSString)partOfDayNight
{
  return (NSString *)(id)*MEMORY[0x1E4F76BB0];
}

+ (NSString)partOfDayEvening
{
  return (NSString *)(id)*MEMORY[0x1E4F76BA0];
}

+ (NSString)partOfDayAfternoon
{
  return (NSString *)(id)*MEMORY[0x1E4F76B98];
}

+ (NSString)partOfDayNoon
{
  return (NSString *)(id)*MEMORY[0x1E4F76BB8];
}

+ (NSString)partOfDayMorning
{
  return (NSString *)(id)*MEMORY[0x1E4F76BA8];
}

+ (NSString)roiMoutain
{
  return (NSString *)(id)*MEMORY[0x1E4F76B60];
}

+ (NSString)roiWater
{
  return (NSString *)(id)*MEMORY[0x1E4F76B78];
}

+ (NSString)roiNature
{
  return (NSString *)(id)*MEMORY[0x1E4F76B68];
}

+ (NSString)roiBeach
{
  return (NSString *)(id)*MEMORY[0x1E4F76B58];
}

+ (NSString)roiUrban
{
  return (NSString *)(id)*MEMORY[0x1E4F76B70];
}

+ (NSString)poiHospital
{
  return (NSString *)(id)*MEMORY[0x1E4F76B08];
}

+ (NSString)poiHiking
{
  return (NSString *)(id)*MEMORY[0x1E4F76B00];
}

+ (NSString)poiDiving
{
  return (NSString *)(id)*MEMORY[0x1E4F76AE8];
}

+ (NSString)poiActivity
{
  return (NSString *)(id)*MEMORY[0x1E4F76AD0];
}

+ (NSString)poiStadium
{
  return (NSString *)(id)*MEMORY[0x1E4F76B40];
}

+ (NSString)poiPerformance
{
  return (NSString *)(id)*MEMORY[0x1E4F76B28];
}

+ (NSString)poiPark
{
  return (NSString *)(id)*MEMORY[0x1E4F76B20];
}

+ (NSString)poiAmusementPark
{
  return (NSString *)(id)*MEMORY[0x1E4F76AD8];
}

+ (NSString)poiEntertainment
{
  return (NSString *)(id)*MEMORY[0x1E4F76AF0];
}

+ (NSString)poiMuseum
{
  return (NSString *)(id)*MEMORY[0x1E4F76B10];
}

+ (NSString)poiCulture
{
  return (NSString *)(id)*MEMORY[0x1E4F76AE0];
}

+ (NSString)poiTravel
{
  return (NSString *)(id)*MEMORY[0x1E4F76B48];
}

+ (NSString)poiNightlife
{
  return (NSString *)(id)*MEMORY[0x1E4F76B18];
}

+ (NSString)poiRestaurant
{
  return (NSString *)(id)*MEMORY[0x1E4F76B30];
}

+ (NSString)poiUnknown
{
  return (NSString *)@"Unknown";
}

+ (id)_computeBlockedTaxonomyNodeNamesWithSceneTaxonomy:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [MEMORY[0x1E4F1CA80] set];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v14 = a1;
  uint64_t v6 = [a1 _blockedNamesToTraverse];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [v4 nodeForName:*(void *)(*((void *)&v17 + 1) + 8 * i)];
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __74__PGPhotosGraphProfile__computeBlockedTaxonomyNodeNamesWithSceneTaxonomy___block_invoke;
        v15[3] = &unk_1E68EE820;
        id v16 = v5;
        [v11 traverseChildrenUsingNameBlock:v15];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  id v12 = [v14 _blockedNames];
  [v5 addObjectsFromArray:v12];

  return v5;
}

uint64_t __74__PGPhotosGraphProfile__computeBlockedTaxonomyNodeNamesWithSceneTaxonomy___block_invoke(uint64_t a1, uint64_t a2)
{
  return 0;
}

+ (id)supportedMeaningClueKeys
{
  return 0;
}

+ (id)profileDependenciesIdentifiers
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)informantDependenciesIdentifiers
{
  v5[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F76BE0];
  v5[0] = *MEMORY[0x1E4F76BE8];
  v5[1] = v2;
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:2];
  return v3;
}

+ (id)classIdentifier
{
  return @"photosgraph";
}

@end
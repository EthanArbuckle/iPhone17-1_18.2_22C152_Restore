@interface PGAssetDebugInformation
+ (id)_personDescriptionStringsInAsset:(id)a3;
+ (id)_sceneprintDistanceStringFromAsset:(id)a3 toAsset:(id)a4;
+ (id)debugInformationForAsset:(id)a3 curationContext:(id)a4;
@end

@implementation PGAssetDebugInformation

+ (id)_personDescriptionStringsInAsset:(id)a3
{
  v76[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 photoLibrary];
  v5 = [v4 librarySpecificFetchOptions];
  v6 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"verifiedType" ascending:0];
  v76[0] = v6;
  v7 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:1];
  v76[1] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v76 count:2];
  [v5 setSortDescriptors:v8];

  [v5 setIncludedDetectionTypes:&unk_1F28D45D8];
  [v5 setPersonContext:5];
  v61 = v5;
  v9 = [MEMORY[0x1E4F391F0] fetchPersonsInAsset:v3 options:v5];
  if ([v9 count])
  {
    v59 = v4;
    v10 = [v4 librarySpecificFetchOptions];
    [v10 setIncludedDetectionTypes:&unk_1F28D45F0];
    [v10 setIncludeTorsoAndFaceDetectionData:1];
    id v60 = v3;
    v57 = v10;
    v11 = [MEMORY[0x1E4F39050] fetchFacesInAsset:v3 options:v10];
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v11, "count"));
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    id v13 = v11;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v70 objects:v75 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v71;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v71 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = *(void **)(*((void *)&v70 + 1) + 8 * i);
          v19 = [v18 personLocalIdentifier];
          if (v19) {
            [v12 setObject:v18 forKeyedSubscript:v19];
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v70 objects:v75 count:16];
      }
      while (v15);
    }
    v56 = v13;

    id v64 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    v58 = v9;
    obuint64_t j = v9;
    uint64_t v65 = [obj countByEnumeratingWithState:&v66 objects:v74 count:16];
    if (v65)
    {
      uint64_t v63 = *(void *)v67;
      unint64_t v20 = 0x1E4F29000uLL;
      do
      {
        for (uint64_t j = 0; j != v65; ++j)
        {
          if (*(void *)v67 != v63) {
            objc_enumerationMutation(obj);
          }
          v22 = *(void **)(*((void *)&v66 + 1) + 8 * j);
          v23 = [v22 name];
          if (![v23 length])
          {
            v24 = [v22 uuid];
            v25 = *(void **)(v20 + 24);
            v26 = [v24 substringToIndex:19];
            v27 = [v24 substringFromIndex:19];
            uint64_t v28 = [v25 stringWithFormat:@"%@\n%@", v26, v27];

            unint64_t v20 = 0x1E4F29000;
            v23 = (void *)v28;
          }
          uint64_t v29 = [v22 verifiedType];
          v30 = @"Unvrfd";
          if (v29 == 2) {
            v30 = @"Graph";
          }
          if (v29 == 1) {
            v30 = @"User";
          }
          v31 = v30;
          id v32 = objc_alloc_init(MEMORY[0x1E4F28E78]);
          int v33 = [v22 detectionType];
          v34 = @"🐶 ";
          if (v33 == 3 || (int v35 = objc_msgSend(v22, "detectionType", @"🐶 "), v34 = @"🐱 ", v35 == 4)) {
            [v32 appendString:v34];
          }
          [v32 appendFormat:@"%@ (%@):\n", v23, v31];
          [v22 mergeCandidateConfidence];
          if (v36 > 0.0)
          {
            double v37 = v36;
            v38 = [MEMORY[0x1E4F391F0] fetchMergeCandidateWithConfidencePersonsForPerson:v22 options:v61];
            v39 = [v38 firstObject];

            v40 = [v39 name];
            if (![v40 length])
            {
              v41 = [v39 uuid];
              uint64_t v42 = [v41 substringToIndex:8];

              v40 = (void *)v42;
            }
            [v32 appendFormat:@"\t-> %@ (%.2f)\n", v40, *(void *)&v37];

            unint64_t v20 = 0x1E4F29000uLL;
          }
          v43 = [v22 localIdentifier];
          v44 = [v12 objectForKeyedSubscript:v43];

          if (v44)
          {
            v45 = @"🙈";
            if ([v44 eyesState] == 2)
            {
              unsigned int v46 = [v44 faceExpressionType];
              v45 = @"⁉️";
              if (v46 <= 6) {
                v45 = off_1E68EADF8[v46];
              }
            }
            v47 = *(void **)(v20 + 24);
            [v44 size];
            uint64_t v49 = v48;
            [v44 quality];
            if (v50 >= 0.0)
            {
              v52 = *(void **)(v20 + 24);
              [v44 quality];
              v54 = objc_msgSend(v52, "stringWithFormat:", @"%.3f", v53);
              v51 = [v47 stringWithFormat:@"s=%.2f, e=%@, q=%@", v49, v45, v54];
            }
            else
            {
              v51 = [v47 stringWithFormat:@"s=%.2f, e=%@, q=%@", v49, v45, @"-"];
            }
            [v32 appendFormat:@"\t%@", v51];
          }
          else
          {
            [v32 appendFormat:@"\tno face"];
          }
          [v64 addObject:v32];
        }
        uint64_t v65 = [obj countByEnumeratingWithState:&v66 objects:v74 count:16];
      }
      while (v65);
    }

    v4 = v59;
    id v3 = v60;
    v9 = v58;
  }
  else
  {
    id v64 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v64;
}

+ (id)_sceneprintDistanceStringFromAsset:(id)a3 toAsset:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F76DA0]) initWithSimilarityModelClass:objc_opt_class()];
  [v7 distanceBetweenItem:v5 andItem:v6];
  double v9 = v8;
  if (v8 >= 1.79769313e308)
  {
    uint64_t v16 = [v6 clsSceneprint];
    if (v16)
    {
      v17 = [v5 sceneAnalysisProperties];
      int v18 = [v17 sceneAnalysisVersion];

      v19 = [v6 sceneAnalysisProperties];
      int v20 = [v19 sceneAnalysisVersion];

      if (v18 == v20)
      {
        v21 = @"Error in computation";
      }
      else
      {
        uint64_t v23 = v18;
        uint64_t v24 = v20;
        v21 = @"%hd != %hd";
      }
      objc_msgSend(NSString, "stringWithFormat:", v21, v23, v24);
      uint64_t v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v15 = @"No sceneprint";
    }
  }
  else
  {
    uint64_t v10 = [v5 clsSimilarityModelVersion];
    [v7 distanceThresholdForSimilarity:0 withSimilarityModelVersion:v10];
    double v12 = v11;
    [v7 distanceThresholdForSimilarity:2 withSimilarityModelVersion:v10];
    id v13 = @"-";
    if (v9 <= v14) {
      id v13 = @"Sem.";
    }
    if (v9 <= v12) {
      id v13 = @"Id.";
    }
    uint64_t v15 = [NSString stringWithFormat:@"%0.5f (%@)", *(void *)&v9, v13];
  }

  return v15;
}

+ (id)debugInformationForAsset:(id)a3 curationContext:(id)a4
{
  v221[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a3;
  v181 = [v6 photoLibrary];
  v7 = [v181 librarySpecificFetchOptions];
  double v8 = +[PGWallpaperSuggestionUtilities assetFetchPropertySetsIncludingGating:1];
  [v7 setFetchPropertySets:v8];

  [v7 setIncludeGuestAssets:1];
  double v9 = (void *)MEMORY[0x1E4F38EB8];
  uint64_t v10 = [v6 localIdentifier];

  v221[0] = v10;
  double v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v221 count:1];
  double v12 = [v9 fetchAssetsWithLocalIdentifiers:v11 options:v7];

  id v13 = [MEMORY[0x1E4F38EB8] clsAllAssetsFromFetchResult:v12 prefetchOptions:31 curationContext:v5];
  double v14 = [v13 firstObject];

  uint64_t v15 = objc_opt_new();
  uint64_t v16 = (void *)MEMORY[0x1E4F8E778];
  v212[0] = MEMORY[0x1E4F143A8];
  v212[1] = 3221225472;
  v212[2] = __68__PGAssetDebugInformation_debugInformationForAsset_curationContext___block_invoke;
  v212[3] = &unk_1E68EADD8;
  id v188 = v15;
  id v213 = v188;
  [v16 enumerateSignalsFromAsset:v14 fullHierarchyName:1 usingBlock:v212];
  v219[0] = @"latest";
  v17 = [NSNumber numberWithInt:*MEMORY[0x1E4F74588]];
  v219[1] = @"current";
  v220[0] = v17;
  int v18 = objc_msgSend(NSNumber, "numberWithShort:", objc_msgSend(v14, "faceAnalysisVersion"));
  v220[1] = v18;
  v187 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v220 forKeys:v219 count:2];

  v217[0] = @"latest";
  v19 = [NSNumber numberWithInt:*MEMORY[0x1E4F74590]];
  v217[1] = @"current";
  v218[0] = v19;
  int v20 = NSNumber;
  v21 = [v14 sceneAnalysisProperties];
  v22 = objc_msgSend(v20, "numberWithShort:", objc_msgSend(v21, "sceneAnalysisVersion"));
  v218[1] = v22;
  v186 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v218 forKeys:v217 count:2];

  uint64_t v23 = [v14 curationModel];
  [v23 scoreWithAsset:v14 inContext:0];
  double v25 = v24;

  v26 = [v14 photoLibrary];
  +[PGGraphBuilder topTierAestheticScoreForRatio:v26 inPhotoLibrary:0.01];
  double v28 = v27;

  uint64_t v29 = (void *)MEMORY[0x1D25FED50]();
  v30 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsContainingAsset:v14 withType:3 options:0];
  v31 = [v30 firstObject];

  id v32 = +[PGCurationManager assetPropertySetsForCuration];
  [v7 setFetchPropertySets:v32];

  int v33 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:1];
  v216[0] = v33;
  v34 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:1];
  v216[1] = v34;
  int v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v216 count:2];
  [v7 setSortDescriptors:v35];

  v180 = v7;
  double v36 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:v31 options:v7];
  double v37 = [v36 fetchedObjects];

  v182 = v5;
  v38 = [v5 curationSession];
  [v38 prepareAssets:v37];

  v39 = [MEMORY[0x1E4F8E778] scoringContextWithAssets:v37 aestheticScoreThresholdToBeAwesome:v28];
  v40 = [v14 curationModel];
  [v40 scoreWithAsset:v14 inContext:v39];
  double v42 = v41;

  v43 = +[PGMemoryGenerationHelper scoringContextForMemoriesWithAssets:v37 withTopTierAestheticScore:v28];
  v44 = [v14 curationModel];
  [v44 scoreWithAsset:v14 inContext:v43];
  double v46 = v45;

  v47 = [v14 clsSceneprint];
  if (v47)
  {
    uint64_t v48 = [v37 indexOfObject:v14];
    unint64_t v49 = v48;
    if (v48)
    {
      double v50 = [v37 objectAtIndexedSubscript:v48 - 1];
      v185 = [a1 _sceneprintDistanceStringFromAsset:v14 toAsset:v50];
    }
    else
    {
      v185 = @"No asset";
    }
    if (v49 >= [v37 count] - 1)
    {
      v184 = @"No asset";
    }
    else
    {
      v51 = [v37 objectAtIndexedSubscript:v49 + 1];
      v184 = [a1 _sceneprintDistanceStringFromAsset:v14 toAsset:v51];
    }
  }
  else
  {
    v184 = @"-";
    v185 = @"-";
  }

  v52 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v53 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v14, "clsIsBlurry"));
  [v52 setObject:v53 forKeyedSubscript:@"isBlurryMedia"];

  v54 = NSNumber;
  v55 = [v14 curationModel];
  v56 = [v55 mediaPreAnalysisModel];
  v57 = [v56 sharpnessNode];
  [v57 highRecallOperatingPoint];
  v58 = objc_msgSend(v54, "numberWithDouble:");
  [v52 setObject:v58 forKeyedSubscript:@"sharpnessThreshold"];

  [v52 setObject:v187 forKeyedSubscript:@"faceAnalysisVersions"];
  [v52 setObject:v186 forKeyedSubscript:@"sceneAnalysisVersions"];
  v59 = [v14 curationModel];
  id v60 = [v59 sceneModel];
  v61 = [v60 identifier];
  [v52 setObject:v61 forKeyedSubscript:@"sceneTaxonomyDigest"];

  [v52 setObject:v188 forKeyedSubscript:@"classification"];
  v62 = [NSNumber numberWithDouble:v42];
  [v52 setObject:v62 forKeyedSubscript:@"curationScoreWithContext"];

  uint64_t v63 = [NSNumber numberWithDouble:v25];
  [v52 setObject:v63 forKeyedSubscript:@"curationScoreWithoutContext"];

  id v64 = [NSNumber numberWithDouble:v46];
  [v52 setObject:v64 forKeyedSubscript:@"curationScoreForMemories"];

  uint64_t v65 = [NSNumber numberWithDouble:v28];
  [v52 setObject:v65 forKeyedSubscript:@"libraryTopTierAestheticScore"];

  long long v66 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v14, "clsIsUtility"));
  [v52 setObject:v66 forKeyedSubscript:@"isUtility"];

  long long v67 = NSNumber;
  long long v68 = [v14 curationModel];
  long long v69 = [v182 userFeedbackCalculator];
  long long v70 = objc_msgSend(v67, "numberWithBool:", objc_msgSend(v68, "isUtilityForMemoriesWithAsset:userFeedbackCalculator:", v14, v69));
  [v52 setObject:v70 forKeyedSubscript:@"isUtilityForMemories"];

  long long v71 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v14, "clsIsTragicFailure"));
  [v52 setObject:v71 forKeyedSubscript:@"isTragicFailure"];

  id v211 = 0;
  uint64_t v72 = [v14 clsAvoidIfPossibleAsKeyItemForMemories:0 allowGuestAsset:0 reason:&v211];
  long long v73 = (__CFString *)v211;
  v74 = [NSNumber numberWithBool:v72];
  [v52 setObject:v74 forKeyedSubscript:@"avoidForKeyAsset"];

  if (v72)
  {
    if (v73) {
      v75 = v73;
    }
    else {
      v75 = @"Unknown";
    }
    [v52 setObject:v75 forKeyedSubscript:@"avoidForKeyAssetReason"];
  }
  v76 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v14, "clsAvoidIfPossibleAsKeyItemForMemories:allowGuestAsset:", 1, 0));
  [v52 setObject:v76 forKeyedSubscript:@"avoidForMemoryKeyAsset"];

  v77 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(MEMORY[0x1E4F8E7A8], "assetIsSafeForWidgetDisplay:", v14));
  [v52 setObject:v77 forKeyedSubscript:@"isSafeForWidgetDisplay"];

  v78 = [a1 _personDescriptionStringsInAsset:v14];
  [v52 setObject:v78 forKeyedSubscript:@"peopleNames"];

  [v52 setObject:v185 forKeyedSubscript:@"sceneprintDistanceToPreviousAsset"];
  [v52 setObject:v184 forKeyedSubscript:@"sceneprintDistanceToNextAsset"];
  v79 = NSNumber;
  [v14 clsSquareCropScore];
  v80 = objc_msgSend(v79, "numberWithDouble:");
  [v52 setObject:v80 forKeyedSubscript:@"squareCropScore"];

  [v14 cropScoreForTargetAspectRatio:1 forFaces:0.75];
  v81 = objc_msgSend(NSNumber, "numberWithDouble:");
  [v52 setObject:v81 forKeyedSubscript:@"3x4CropScore"];

  [v14 cropScoreForTargetAspectRatio:1 forFaces:1.5];
  v82 = objc_msgSend(NSNumber, "numberWithDouble:");
  [v52 setObject:v82 forKeyedSubscript:@"3x2CropScore"];

  v83 = NSNumber;
  v210 = v73;
  BOOL v84 = +[PGPeopleWallpaperSuggester passesFilteringWithAsset:v14 curationContext:v182 orientation:1 reason:&v210];
  v85 = v210;

  v86 = [v83 numberWithBool:v84];
  [v52 setObject:v86 forKeyedSubscript:@"WSTopPeoplePortraitPass"];

  [v52 setObject:v85 forKeyedSubscript:@"WSTopPeoplePortraitReason"];
  v87 = NSNumber;
  v209 = v85;
  BOOL v88 = +[PGPeopleWallpaperSuggester passesFilteringWithAsset:v14 curationContext:v182 orientation:2 reason:&v209];
  v89 = v209;

  v90 = [v87 numberWithBool:v88];
  [v52 setObject:v90 forKeyedSubscript:@"WSTopPeopleLandscapePass"];

  [v52 setObject:v89 forKeyedSubscript:@"WSTopPeopleLandscapeReason"];
  v91 = NSNumber;
  v208 = v89;
  BOOL v92 = +[PGPetWallpaperSuggester passesFilteringWithAsset:v14 curationContext:v182 orientation:1 reason:&v208];
  v93 = v208;

  v94 = [v91 numberWithBool:v92];
  [v52 setObject:v94 forKeyedSubscript:@"WSTopPetPortraitPass"];

  [v52 setObject:v93 forKeyedSubscript:@"WSTopPetPortraitReason"];
  v95 = NSNumber;
  v207 = v93;
  BOOL v96 = +[PGPetWallpaperSuggester passesFilteringWithAsset:v14 curationContext:v182 orientation:2 reason:&v207];
  v97 = v207;

  v98 = [v95 numberWithBool:v96];
  [v52 setObject:v98 forKeyedSubscript:@"WSTopPetLandscapePass"];

  [v52 setObject:v97 forKeyedSubscript:@"WSTopPetLandscapeReason"];
  v99 = NSNumber;
  id v206 = v97;
  BOOL v100 = +[PGLandscapeWallpaperSuggester passesFilteringWithAsset:v14 curationContext:v182 orientation:1 reason:&v206];
  id v101 = v206;

  v102 = [v99 numberWithBool:v100];
  [v52 setObject:v102 forKeyedSubscript:@"WSTopNaturePortraitPass"];

  [v52 setObject:v101 forKeyedSubscript:@"WSTopNaturePortraitReason"];
  v103 = NSNumber;
  id v205 = v101;
  BOOL v104 = +[PGLandscapeWallpaperSuggester passesFilteringWithAsset:v14 curationContext:v182 orientation:2 reason:&v205];
  id v105 = v205;

  v106 = [v103 numberWithBool:v104];
  [v52 setObject:v106 forKeyedSubscript:@"WSTopNatureLandscapePass"];

  [v52 setObject:v105 forKeyedSubscript:@"WSTopNatureLandscapeReason"];
  v107 = NSNumber;
  id v204 = v105;
  BOOL v108 = +[PGCityscapeWallpaperSuggester passesFilteringWithAsset:v14 curationContext:v182 orientation:1 reason:&v204];
  id v109 = v204;

  v110 = [v107 numberWithBool:v108];
  [v52 setObject:v110 forKeyedSubscript:@"WSTopCityscapePortraitPass"];

  [v52 setObject:v109 forKeyedSubscript:@"WSTopCityscapePortraitReason"];
  v111 = NSNumber;
  id v203 = v109;
  BOOL v112 = +[PGCityscapeWallpaperSuggester passesFilteringWithAsset:v14 curationContext:v182 orientation:2 reason:&v203];
  id v113 = v203;

  v114 = [v111 numberWithBool:v112];
  [v52 setObject:v114 forKeyedSubscript:@"WSTopCityscapeLandscapePass"];

  [v52 setObject:v113 forKeyedSubscript:@"WSTopCityscapeLandscapeReason"];
  v115 = NSNumber;
  id v202 = v113;
  BOOL v116 = +[PGPeopleWallpaperSuggester passesFilteringWithAsset:v14 curationContext:v182 orientation:1 reason:&v202];
  id v117 = v202;

  v118 = [v115 numberWithBool:v116];
  [v52 setObject:v118 forKeyedSubscript:@"WSPeoplePortraitPass"];

  [v52 setObject:v117 forKeyedSubscript:@"WSPeoplePortraitReason"];
  v119 = NSNumber;
  id v201 = v117;
  BOOL v120 = +[PGPeopleWallpaperSuggester passesFilteringWithAsset:v14 curationContext:v182 orientation:2 reason:&v201];
  id v121 = v201;

  v122 = [v119 numberWithBool:v120];
  [v52 setObject:v122 forKeyedSubscript:@"WSPeopleLandscapePass"];

  [v52 setObject:v121 forKeyedSubscript:@"WSPeopleLandscapeReason"];
  v123 = NSNumber;
  id v200 = v121;
  BOOL v124 = +[PGPetWallpaperSuggester passesFilteringWithAsset:v14 curationContext:v182 orientation:1 reason:&v200];
  id v125 = v200;

  v126 = [v123 numberWithBool:v124];
  [v52 setObject:v126 forKeyedSubscript:@"WSPetPortraitPass"];

  [v52 setObject:v125 forKeyedSubscript:@"WSPetPortraitReason"];
  v127 = NSNumber;
  id v199 = v125;
  BOOL v128 = +[PGPetWallpaperSuggester passesFilteringWithAsset:v14 curationContext:v182 orientation:2 reason:&v199];
  id v129 = v199;

  v130 = [v127 numberWithBool:v128];
  [v52 setObject:v130 forKeyedSubscript:@"WSPetLandscapePass"];

  [v52 setObject:v129 forKeyedSubscript:@"WSPetLandscapeReason"];
  v131 = NSNumber;
  id v198 = v129;
  BOOL v132 = +[PGLandscapeWallpaperSuggester passesFilteringWithAsset:v14 curationContext:v182 orientation:1 reason:&v198];
  id v133 = v198;

  v134 = [v131 numberWithBool:v132];
  [v52 setObject:v134 forKeyedSubscript:@"WSNaturePortraitPass"];

  [v52 setObject:v133 forKeyedSubscript:@"WSNaturePortraitReason"];
  v135 = NSNumber;
  id v197 = v133;
  BOOL v136 = +[PGLandscapeWallpaperSuggester passesFilteringWithAsset:v14 curationContext:v182 orientation:2 reason:&v197];
  id v137 = v197;

  v138 = [v135 numberWithBool:v136];
  [v52 setObject:v138 forKeyedSubscript:@"WSNatureLandscapePass"];

  [v52 setObject:v137 forKeyedSubscript:@"WSNatureLandscapeReason"];
  v139 = NSNumber;
  id v196 = v137;
  BOOL v140 = +[PGCityscapeWallpaperSuggester passesFilteringWithAsset:v14 curationContext:v182 orientation:1 reason:&v196];
  id v141 = v196;

  v142 = [v139 numberWithBool:v140];
  [v52 setObject:v142 forKeyedSubscript:@"WSCityscapePortraitPass"];

  [v52 setObject:v141 forKeyedSubscript:@"WSCityscapePortraitReason"];
  v143 = NSNumber;
  id v195 = v141;
  BOOL v144 = +[PGCityscapeWallpaperSuggester passesFilteringWithAsset:v14 curationContext:v182 orientation:2 reason:&v195];
  id v145 = v195;

  v146 = [v143 numberWithBool:v144];
  [v52 setObject:v146 forKeyedSubscript:@"WSCityscapeLandscapePass"];

  [v52 setObject:v145 forKeyedSubscript:@"WSCityscapeLandscapeReason"];
  v147 = NSNumber;
  id v194 = v145;
  BOOL v148 = +[PGSettlingEffectWallpaperSuggester passesFilteringWithAsset:v14 curationContext:v182 orientation:1 reason:&v194];
  id v149 = v194;

  v150 = [v147 numberWithBool:v148];
  [v52 setObject:v150 forKeyedSubscript:@"WSSettlingEffectPortraitPass"];

  [v52 setObject:v149 forKeyedSubscript:@"WSSettlingEffectPortraitReason"];
  v151 = NSNumber;
  id v193 = v149;
  BOOL v152 = +[PGSettlingEffectWallpaperSuggester passesFilteringWithAsset:v14 curationContext:v182 orientation:2 reason:&v193];
  id v153 = v193;

  v154 = [v151 numberWithBool:v152];
  [v52 setObject:v154 forKeyedSubscript:@"WSSettlingEffectLandscapePass"];

  [v52 setObject:v153 forKeyedSubscript:@"WSSettlingEffectLandscapeReason"];
  v155 = NSNumber;
  id v192 = v153;
  BOOL v156 = +[PGPeopleWallpaperSuggester passesFilteringWithAsset:v14 curationContext:v182 orientation:1 reason:&v192];
  id v157 = v192;

  v158 = [v155 numberWithBool:v156];
  [v52 setObject:v158 forKeyedSubscript:@"WSMePortraitPass"];

  [v52 setObject:v157 forKeyedSubscript:@"WSMePortraitReason"];
  v159 = NSNumber;
  id v191 = v157;
  BOOL v160 = +[PGPeopleWallpaperSuggester passesFilteringWithAsset:v14 curationContext:v182 orientation:2 reason:&v191];
  id v161 = v191;

  v162 = [v159 numberWithBool:v160];
  [v52 setObject:v162 forKeyedSubscript:@"WSMeLandscapePass"];

  [v52 setObject:v161 forKeyedSubscript:@"WSMeLandscapeReason"];
  v163 = [v14 photoAnalysisWallpaperProperties];
  v214[0] = @"current";
  v164 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", +[PGWallpaperSuggestionAssetGater currentWallpaperPropertiesVersion](PGWallpaperSuggestionAssetGater, "currentWallpaperPropertiesVersion"));
  v214[1] = @"persisted";
  v215[0] = v164;
  v165 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v163, "wallpaperPropertiesVersion"));
  v215[1] = v165;
  v166 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v215 forKeys:v214 count:2];
  [v52 setObject:v166 forKeyedSubscript:@"NSWallpaperPropertiesVersions"];

  v167 = [v163 wallpaperPropertiesTimestamp];
  if (v167)
  {
    v168 = (void *)MEMORY[0x1E4F28C10];
    v169 = [v163 wallpaperPropertiesTimestamp];
    v170 = [v168 localizedStringFromDate:v169 dateStyle:1 timeStyle:1];
    [v52 setObject:v170 forKeyedSubscript:@"NSWallpaperPropertiesTimestamp"];
  }
  else
  {
    [v52 setObject:@"Never computed" forKeyedSubscript:@"NSWallpaperPropertiesTimestamp"];
  }

  v171 = [v163 wallpaperPropertiesData];

  if (v171)
  {
    v172 = (void *)MEMORY[0x1E4F28F98];
    v173 = [v163 wallpaperPropertiesData];
    v190 = 0;
    v174 = [v172 propertyListWithData:v173 options:0 format:0 error:&v190];
    v175 = v190;
  }
  else
  {
    v176 = [PGWallpaperSuggestionAssetGater alloc];
    v173 = [(PGWallpaperSuggestionAssetGater *)v176 initWithType:1 loggingConnection:MEMORY[0x1E4F14500]];
    [(PGWallpaperSuggestionAssetGater *)v173 setIsUserInitiated:1];
    v189 = 0;
    v174 = [(PGWallpaperSuggestionAssetGater *)v173 requestWallpaperPropertiesForAsset:v14 progressBlock:&__block_literal_global_48595 error:&v189];
    v175 = v189;
  }
  id v177 = v175;

  if (v174)
  {
    [v52 setObject:v174 forKeyedSubscript:@"NSWallpaperProperties"];
  }
  else
  {
    v178 = [v177 description];
    [v52 setObject:v178 forKeyedSubscript:@"NSWallpaperProperties"];
  }
  return v52;
}

void __68__PGAssetDebugInformation_debugInformationForAsset_curationContext___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5, double a6, double a7, uint64_t a8, void *a9)
{
  id v16 = a9;
  id v26 = v16;
  if (a6 * a7 <= 0.0)
  {
    id v22 = v16;
    if (a3 > 0.0)
    {
      uint64_t v23 = @"<";
      if (a2 >= a3) {
        uint64_t v23 = @"≥";
      }
      double v24 = v23;
      id v25 = v26;
      int v20 = v24;
      goto LABEL_15;
    }
LABEL_13:
    v21 = [NSString stringWithFormat:@"%@:\r\t\t confidence: (%.2f)", v22, *(void *)&a2];
    goto LABEL_17;
  }
  uint64_t v17 = [NSString stringWithFormat:@"[%.2f, %.2f  %.2f x %.2f]", a6 * a7, *(void *)&a4, *(void *)&a5, *(void *)&a6, *(void *)&a7];
  int v18 = (void *)v17;
  if (a3 <= 0.0)
  {
    id v22 = v26;
    if (v17)
    {
      v21 = [NSString stringWithFormat:@"%@:\r\t\t confidence: (%.2f),\r\t\t boundingBox: %@", v26, *(void *)&a2, v17];

      goto LABEL_17;
    }
    goto LABEL_13;
  }
  v19 = @"<";
  if (a2 >= a3) {
    v19 = @"≥";
  }
  int v20 = v19;
  if (!v18)
  {
    id v25 = v26;
LABEL_15:
    v21 = [NSString stringWithFormat:@"%@:\r\t\t confidence: (%.2f%@%.2f)", v25, *(void *)&a2, v20, *(void *)&a3];
    goto LABEL_16;
  }
  v21 = [NSString stringWithFormat:@"%@:\r\t\t confidence: (%.2f%@%.2f),\r\t\t boundingBox: %@", v26, *(void *)&a2, v20, *(void *)&a3, v18];

LABEL_16:
LABEL_17:
  [*(id *)(a1 + 32) addObject:v21];
}

@end
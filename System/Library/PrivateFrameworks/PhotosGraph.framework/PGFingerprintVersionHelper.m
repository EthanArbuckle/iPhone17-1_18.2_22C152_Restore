@interface PGFingerprintVersionHelper
+ (BOOL)_generateError:(id *)a3 errorCode:(int64_t)a4 errorMessage:(id)a5 underlyingError:(id)a6;
+ (BOOL)isAssetFingerprintVersion:(int64_t)a3;
+ (BOOL)isMemoryFingerprintVersion:(int64_t)a3;
+ (BOOL)isMemoryNodeFingerprintVersion:(int64_t)a3;
+ (BOOL)isMomentFingerprintVersion:(int64_t)a3;
+ (BOOL)isMomentNodeFingerprintVersion:(int64_t)a3;
+ (id)_assetPrintFeatureExtractorForAssetPrintType:(int64_t)a3 transformers:(id)a4 error:(id *)a5;
+ (id)_clipprintFeatureExtractorInstance;
+ (id)_featureExtractor:(id)a3 withTransformers:(id)a4;
+ (id)_featureExtractor:(id)a3 withTransformers:(id)a4 parentFeatureExtractorName:(id)a5;
+ (id)_featureExtractors:(id)a3 withTransformers:(id)a4;
+ (id)_featureExtractors:(id)a3 withTransformers:(id)a4 parentFeatureExtractorName:(id)a5;
+ (id)_multiModalFeatureExtractorForMutliModalType:(int64_t)a3 assetFeatureExtractor:(id)a4 personaVectorFeatureExtractor:(id)a5 graph:(id)a6 transformers:(id)a7 error:(id *)a8;
+ (id)_personaVectorFeatureExtractorForPersonaVectorType:(int64_t)a3 fetchOptionPropertySet:(id)a4 graph:(id)a5 transformers:(id)a6 error:(id *)a7;
+ (id)_sceneprintFeatureExtractorInstance;
+ (id)featureExtractorForFingerprintVersion:(int64_t)a3 withGraph:(id)a4 withTransformers:(id)a5 error:(id *)a6;
+ (id)fetchOptionPropertySetForFingerprintVersion:(int64_t)a3;
+ (id)nameForFingerprintVersion:(int64_t)a3;
+ (int64_t)fingerprintVersionForName:(id)a3;
+ (void)resetPreCalculatedFeatures;
@end

@implementation PGFingerprintVersionHelper

+ (id)_clipprintFeatureExtractorInstance
{
  v2 = objc_alloc_init(PGFeatureExtractorCLIPprint);
  return v2;
}

+ (id)_sceneprintFeatureExtractorInstance
{
  v2 = objc_alloc_init(PGFeatureExtractorSceneprint);
  return v2;
}

+ (BOOL)_generateError:(id *)a3 errorCode:(int64_t)a4 errorMessage:(id)a5 underlyingError:(id)a6
{
  id v9 = a6;
  if (a3)
  {
    v10 = (objc_class *)MEMORY[0x1E4F1CA60];
    id v11 = a5;
    id v12 = objc_alloc_init(v10);
    [v12 setObject:v11 forKey:*MEMORY[0x1E4F28568]];

    if (v9) {
      [v12 setObject:v9 forKey:*MEMORY[0x1E4F28A50]];
    }
    *a3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.PhotosGraph.PGFingerprintVersion" code:a4 userInfo:v12];
  }
  return 0;
}

+ (id)_featureExtractor:(id)a3 withTransformers:(id)a4 parentFeatureExtractorName:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [v7 name];
  if (v9)
  {
    uint64_t v11 = [NSString stringWithFormat:@"%@-%@", v9, v10];

    v10 = (void *)v11;
  }
  if (v8
    && ([v8 featureTransformersForFeatureExtractorName:v10],
        (uint64_t v12 = objc_claimAutoreleasedReturnValue()) != 0)
    && (v13 = (void *)v12,
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v13,
        (isKindOfClass & 1) == 0))
  {
    v16 = [v8 featureTransformersForFeatureExtractorName:v10];
    v15 = [[PGSequentialFeatureExtractor alloc] initWithFeatureExtractor:v7 featureTransformers:v16];
  }
  else
  {
    v15 = (PGSequentialFeatureExtractor *)v7;
  }

  return v15;
}

+ (id)_featureExtractor:(id)a3 withTransformers:(id)a4
{
  return (id)[a1 _featureExtractor:a3 withTransformers:a4 parentFeatureExtractorName:0];
}

+ (id)_featureExtractors:(id)a3 withTransformers:(id)a4 parentFeatureExtractorName:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v8, "count"));
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v12 = v8;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = objc_msgSend(a1, "_featureExtractor:withTransformers:parentFeatureExtractorName:", *(void *)(*((void *)&v19 + 1) + 8 * i), v9, v10, (void)v19);
        [v11 addObject:v17];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v14);
  }

  return v11;
}

+ (id)_featureExtractors:(id)a3 withTransformers:(id)a4
{
  id v6 = a3;
  id v7 = v6;
  if (a4)
  {
    id v8 = [a1 _featureExtractors:v6 withTransformers:a4 parentFeatureExtractorName:0];
  }
  else
  {
    id v8 = v6;
  }
  id v9 = v8;

  return v9;
}

+ (id)_personaVectorFeatureExtractorForPersonaVectorType:(int64_t)a3 fetchOptionPropertySet:(id)a4 graph:(id)a5 transformers:(id)a6 error:(id *)a7
{
  v189[18] = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  switch(a3)
  {
    case 0:
      id v15 = objc_alloc(MEMORY[0x1E4F71EC0]);
      a3 = [v15 initWithName:&stru_1F283BC78 featureExtractors:MEMORY[0x1E4F1CBF0]];
      break;
    case 1:
      v16 = objc_alloc_init(PGFeatureExtractorPCAPrint);
      a3 = [a1 _featureExtractor:v16 withTransformers:v14];

      break;
    case 2:
      if (!v13) {
        goto LABEL_9;
      }
      v174 = [[PGMeaningFeatureExtractor alloc] initWithVersion:1 error:a7];
      v189[0] = v174;
      v170 = [[PGInvariantFamilyFeatureExtractor alloc] initWithError:a7];
      v189[1] = v170;
      v166 = [[PGInvariantCoworkerFeatureExtractor alloc] initWithError:a7];
      v189[2] = v166;
      v162 = [[PGInvariantPartnerFeatureExtractor alloc] initWithError:a7];
      v189[3] = v162;
      v158 = [[PGPublicEventCategoryFeatureExtractor alloc] initWithVersion:1 error:a7];
      v189[4] = v158;
      v154 = [[PGBusinessCategoryFeatureExtractor alloc] initWithVersion:1 error:a7];
      v189[5] = v154;
      v150 = [[PGInvariantPetFeatureExtractor alloc] initWithVersion:1 error:a7];
      v189[6] = v150;
      v146 = [[PGBabyFeatureExtractor alloc] initWithError:a7];
      v189[7] = v146;
      v142 = [[PGSceneFeatureExtractor alloc] initWithVersion:1 error:a7];
      v189[8] = v142;
      v138 = [[PGMyHomeFeatureExtractor alloc] initWithError:a7];
      v189[9] = v138;
      id v180 = v12;
      v17 = [[PGMyWorkFeatureExtractor alloc] initWithError:a7];
      v189[10] = v17;
      id v182 = v14;
      v18 = [[PGMobilityFeatureExtractor alloc] initWithError:a7];
      v189[11] = v18;
      long long v19 = [[PGPartOfDayFeatureExtractor alloc] initWithError:a7];
      v189[12] = v19;
      long long v20 = [[PGSeasonFeatureExtractor alloc] initWithError:a7];
      v189[13] = v20;
      long long v21 = [[PGWeekendFeatureExtractor alloc] initWithError:a7];
      v189[14] = v21;
      long long v22 = [[PGWeekdayFeatureExtractor alloc] initWithError:a7];
      v189[15] = v22;
      id v184 = v13;
      v23 = [[PGPOIFeatureExtractor alloc] initWithVersion:1 error:a7];
      v189[16] = v23;
      id v24 = a1;
      id v178 = a1;
      v25 = [[PGROIFeatureExtractor alloc] initWithError:a7];
      v189[17] = v25;
      v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v189 count:18];

      uint64_t v96 = [v24 _featureExtractors:v26 withTransformers:v182 parentFeatureExtractorName:@"PersonaVector"];

      v175 = objc_alloc_init(PGFeatureExtractorCartesianLocation);
      v188[0] = v175;
      v171 = objc_alloc_init(PGFeatureExtractorExposureScore);
      v188[1] = v171;
      v167 = objc_alloc_init(PGFeatureExtractorFaceCountScore);
      v188[2] = v167;
      v163 = objc_alloc_init(PGFeatureExtractorActivityScore);
      v188[3] = v163;
      v159 = objc_alloc_init(PGFeatureExtractorVideoScore);
      v188[4] = v159;
      v155 = objc_alloc_init(PGFeatureExtractorBlurrinessScore);
      v188[5] = v155;
      v151 = objc_alloc_init(PGFeatureExtractorAudioClassification);
      v188[6] = v151;
      v147 = objc_alloc_init(PGFeatureExtractorIsFavoriteScore);
      v188[7] = v147;
      v143 = objc_alloc_init(PGFeatureExtractorHasAdjustmentsScore);
      v188[8] = v143;
      v139 = objc_alloc_init(PGFeatureExtractorDurationInSecond);
      v188[9] = v139;
      v135 = objc_alloc_init(PGFeatureExtractorImageAspectRatio);
      v188[10] = v135;
      v132 = objc_alloc_init(PGFeatureExtractorIsScreenRecording);
      v188[11] = v132;
      v130 = objc_alloc_init(PGFeatureExtractorPlayCount);
      v188[12] = v130;
      v128 = objc_alloc_init(PGFeatureExtractorShareCount);
      v188[13] = v128;
      v126 = objc_alloc_init(PGFeatureExtractorViewCount);
      v188[14] = v126;
      v124 = objc_alloc_init(PGFeatureExtractorAutoplaySuggestionScore);
      v188[15] = v124;
      v122 = objc_alloc_init(PGFeatureExtractorTastefullyBlurredScore);
      v188[16] = v122;
      v120 = objc_alloc_init(PGFeatureExtractorFailureScore);
      v188[17] = v120;
      v118 = objc_alloc_init(PGFeatureExtractorAestheticScore);
      v188[18] = v118;
      v116 = objc_alloc_init(PGFeatureExtractorPleasantLightingScore);
      v188[19] = v116;
      v114 = objc_alloc_init(PGFeatureExtractorWellFramedSubjectScore);
      v188[20] = v114;
      v112 = objc_alloc_init(PGFeatureExtractorWellChosenSubjectScore);
      v188[21] = v112;
      v110 = objc_alloc_init(PGFeatureExtractorWellTimedShotScore);
      v188[22] = v110;
      v108 = objc_alloc_init(PGFeatureExtractorSharplyFocusedSubjectScore);
      v188[23] = v108;
      v106 = objc_alloc_init(PGFeatureExtractorHarmoniousColorScore);
      v188[24] = v106;
      v104 = objc_alloc_init(PGFeatureExtractorPleasantReflectionsScore);
      v188[25] = v104;
      v102 = objc_alloc_init(PGFeatureExtractorLivelyColorScore);
      v188[26] = v102;
      v100 = objc_alloc_init(PGFeatureExtractorPleasantSymmetryScore);
      v188[27] = v100;
      v98 = objc_alloc_init(PGFeatureExtractorPleasantPatternScore);
      v188[28] = v98;
      v94 = objc_alloc_init(PGFeatureExtractorImmersivenessScore);
      v188[29] = v94;
      v92 = objc_alloc_init(PGFeatureExtractorPleasantPerspectiveScore);
      v188[30] = v92;
      v90 = objc_alloc_init(PGFeatureExtractorPleasantPostProcessingScore);
      v188[31] = v90;
      v88 = objc_alloc_init(PGFeatureExtractorNoiseScore);
      v188[32] = v88;
      v86 = objc_alloc_init(PGFeatureExtractorPleasantCompositionScore);
      v188[33] = v86;
      v84 = objc_alloc_init(PGFeatureExtractorInterestingSubjectScore);
      v188[34] = v84;
      v82 = objc_alloc_init(PGFeatureExtractorIntrusiveObjectPresenceScore);
      v188[35] = v82;
      v78 = objc_alloc_init(PGFeatureExtractorPleasantCameraTiltScore);
      v188[36] = v78;
      v76 = objc_alloc_init(PGFeatureExtractorLowLightScore);
      v188[37] = v76;
      v74 = objc_alloc_init(PGFeatureExtractorAssetPlaybackStyle);
      v188[38] = v74;
      v72 = objc_alloc_init(PGFeatureExtractorAssetMediaType);
      v188[39] = v72;
      v70 = objc_alloc_init(PGFeatureExtractorAssetMediaSubtype);
      v188[40] = v70;
      v68 = objc_alloc_init(PGFeatureExtractorAssetBurstSelectionType);
      v188[41] = v68;
      v27 = objc_alloc_init(PGFeatureExtractorAssetSourceType);
      v188[42] = v27;
      v28 = objc_alloc_init(PGFeatureExtractorAssetResolution);
      v188[43] = v28;
      v29 = objc_alloc_init(PGFeatureExtractorAssetFormat);
      v188[44] = v29;
      v30 = objc_alloc_init(PGFeatureExtractorAssetImportSource);
      v188[45] = v30;
      v31 = objc_alloc_init(PGFeatureExtractorStandardAspectRatio);
      v188[46] = v31;
      v32 = objc_alloc_init(PGFeatureExtractorLocale);
      v188[47] = v32;
      v33 = objc_alloc_init(PGFeatureExtractorTaboo);
      v188[48] = v33;
      v34 = objc_alloc_init(PGFeatureExtractorPotentialLandmark);
      v188[49] = v34;
      v35 = [PGFeatureExtractorGraphRelations alloc];
      v36 = (void *)[objc_alloc(MEMORY[0x1E4F71EC0]) initWithName:@"GraphRelations" featureExtractors:v96];
      v37 = [(PGFeatureExtractorGraphRelations *)v35 initWithGraph:v184 featureExtractor:v36];
      v188[50] = v37;
      v80 = [MEMORY[0x1E4F1C978] arrayWithObjects:v188 count:51];

      id v14 = v182;
      id v12 = v180;

      v38 = [v178 _featureExtractors:v80 withTransformers:v182 parentFeatureExtractorName:@"PersonaVector"];

      v39 = (void *)[objc_alloc(MEMORY[0x1E4F71EC0]) initWithName:@"PersonaVectorMultiModal-V1.0" featureExtractors:v38];
      v40 = [[PGFeatureExtractorPhotoLibraryAverage alloc] initWithAssetFeatureExtractor:v39 assetFetchOptionPropertySet:v180];
      a3 = [[PGFeatureExtractorAssetPhotoLibrary alloc] initWithPhotoLibraryFeatureExtractor:v40];

      id v13 = v184;
      v41 = (void *)v96;
      goto LABEL_8;
    case 3:
      if (v13)
      {
        v176 = [[PGMeaningFeatureExtractor alloc] initWithVersion:1 error:a7];
        v187[0] = v176;
        v172 = [[PGPeopleFeatureExtractor alloc] initWithGraph:v13 error:a7];
        v187[1] = v172;
        v168 = [[PGInvariantFamilyFeatureExtractor alloc] initWithError:a7];
        v187[2] = v168;
        v164 = [[PGInvariantCoworkerFeatureExtractor alloc] initWithError:a7];
        v187[3] = v164;
        v160 = [[PGInvariantPartnerFeatureExtractor alloc] initWithError:a7];
        v187[4] = v160;
        v156 = [[PGPublicEventCategoryFeatureExtractor alloc] initWithVersion:1 error:a7];
        v187[5] = v156;
        v152 = [[PGBusinessCategoryFeatureExtractor alloc] initWithVersion:1 error:a7];
        v187[6] = v152;
        v148 = [[PGInvariantPetFeatureExtractor alloc] initWithVersion:1 error:a7];
        v187[7] = v148;
        v144 = [[PGBabyFeatureExtractor alloc] initWithError:a7];
        v187[8] = v144;
        v140 = [[PGSceneFeatureExtractor alloc] initWithVersion:1 error:a7];
        v187[9] = v140;
        v136 = [[PGFrequentLocationFeatureExtractor alloc] initWithGraph:v13 error:a7];
        v187[10] = v136;
        v133 = [[PGMyHomeFeatureExtractor alloc] initWithError:a7];
        v187[11] = v133;
        v42 = [[PGMyWorkFeatureExtractor alloc] initWithError:a7];
        v187[12] = v42;
        v43 = [[PGMobilityFeatureExtractor alloc] initWithError:a7];
        v187[13] = v43;
        v44 = [[PGPartOfDayFeatureExtractor alloc] initWithError:a7];
        v187[14] = v44;
        v45 = [[PGSeasonFeatureExtractor alloc] initWithError:a7];
        v187[15] = v45;
        id v181 = v12;
        v46 = [[PGWeekendFeatureExtractor alloc] initWithError:a7];
        v187[16] = v46;
        id v183 = v14;
        v47 = [[PGWeekdayFeatureExtractor alloc] initWithError:a7];
        v187[17] = v47;
        id v185 = v13;
        v48 = [[PGPOIFeatureExtractor alloc] initWithVersion:1 error:a7];
        v187[18] = v48;
        id v49 = a1;
        id v179 = a1;
        v50 = [[PGROIFeatureExtractor alloc] initWithError:a7];
        v187[19] = v50;
        v51 = [MEMORY[0x1E4F1C978] arrayWithObjects:v187 count:20];

        uint64_t v95 = [v49 _featureExtractors:v51 withTransformers:v183 parentFeatureExtractorName:@"PersonaVector"];

        v177 = objc_alloc_init(PGFeatureExtractorCartesianLocation);
        v186[0] = v177;
        v173 = [[PGFeatureExtractorFrequentPeople alloc] initWithNumberOfFrequentPeopleToExtract:25];
        v186[1] = v173;
        v169 = objc_alloc_init(PGFeatureExtractorExposureScore);
        v186[2] = v169;
        v165 = objc_alloc_init(PGFeatureExtractorFaceCountScore);
        v186[3] = v165;
        v161 = objc_alloc_init(PGFeatureExtractorActivityScore);
        v186[4] = v161;
        v157 = objc_alloc_init(PGFeatureExtractorVideoScore);
        v186[5] = v157;
        v153 = objc_alloc_init(PGFeatureExtractorBlurrinessScore);
        v186[6] = v153;
        v149 = objc_alloc_init(PGFeatureExtractorAudioClassification);
        v186[7] = v149;
        v145 = objc_alloc_init(PGFeatureExtractorIsFavoriteScore);
        v186[8] = v145;
        v141 = objc_alloc_init(PGFeatureExtractorHasAdjustmentsScore);
        v186[9] = v141;
        v137 = objc_alloc_init(PGFeatureExtractorDurationInSecond);
        v186[10] = v137;
        v134 = objc_alloc_init(PGFeatureExtractorImageAspectRatio);
        v186[11] = v134;
        v131 = objc_alloc_init(PGFeatureExtractorIsScreenRecording);
        v186[12] = v131;
        v129 = objc_alloc_init(PGFeatureExtractorPlayCount);
        v186[13] = v129;
        v127 = objc_alloc_init(PGFeatureExtractorShareCount);
        v186[14] = v127;
        v125 = objc_alloc_init(PGFeatureExtractorViewCount);
        v186[15] = v125;
        v123 = objc_alloc_init(PGFeatureExtractorAutoplaySuggestionScore);
        v186[16] = v123;
        v121 = objc_alloc_init(PGFeatureExtractorTastefullyBlurredScore);
        v186[17] = v121;
        v119 = objc_alloc_init(PGFeatureExtractorFailureScore);
        v186[18] = v119;
        v117 = objc_alloc_init(PGFeatureExtractorAestheticScore);
        v186[19] = v117;
        v115 = objc_alloc_init(PGFeatureExtractorPleasantLightingScore);
        v186[20] = v115;
        v113 = objc_alloc_init(PGFeatureExtractorWellFramedSubjectScore);
        v186[21] = v113;
        v111 = objc_alloc_init(PGFeatureExtractorWellChosenSubjectScore);
        v186[22] = v111;
        v109 = objc_alloc_init(PGFeatureExtractorWellTimedShotScore);
        v186[23] = v109;
        v107 = objc_alloc_init(PGFeatureExtractorSharplyFocusedSubjectScore);
        v186[24] = v107;
        v105 = objc_alloc_init(PGFeatureExtractorHarmoniousColorScore);
        v186[25] = v105;
        v103 = objc_alloc_init(PGFeatureExtractorPleasantReflectionsScore);
        v186[26] = v103;
        v101 = objc_alloc_init(PGFeatureExtractorLivelyColorScore);
        v186[27] = v101;
        v99 = objc_alloc_init(PGFeatureExtractorPleasantSymmetryScore);
        v186[28] = v99;
        v97 = objc_alloc_init(PGFeatureExtractorPleasantPatternScore);
        v186[29] = v97;
        v93 = objc_alloc_init(PGFeatureExtractorImmersivenessScore);
        v186[30] = v93;
        v91 = objc_alloc_init(PGFeatureExtractorPleasantPerspectiveScore);
        v186[31] = v91;
        v89 = objc_alloc_init(PGFeatureExtractorPleasantPostProcessingScore);
        v186[32] = v89;
        v87 = objc_alloc_init(PGFeatureExtractorNoiseScore);
        v186[33] = v87;
        v85 = objc_alloc_init(PGFeatureExtractorPleasantCompositionScore);
        v186[34] = v85;
        v83 = objc_alloc_init(PGFeatureExtractorInterestingSubjectScore);
        v186[35] = v83;
        v81 = objc_alloc_init(PGFeatureExtractorIntrusiveObjectPresenceScore);
        v186[36] = v81;
        v77 = objc_alloc_init(PGFeatureExtractorPleasantCameraTiltScore);
        v186[37] = v77;
        v75 = objc_alloc_init(PGFeatureExtractorLowLightScore);
        v186[38] = v75;
        v73 = objc_alloc_init(PGFeatureExtractorAssetPlaybackStyle);
        v186[39] = v73;
        v71 = objc_alloc_init(PGFeatureExtractorAssetMediaType);
        v186[40] = v71;
        v69 = objc_alloc_init(PGFeatureExtractorAssetMediaSubtype);
        v186[41] = v69;
        v67 = objc_alloc_init(PGFeatureExtractorAssetBurstSelectionType);
        v186[42] = v67;
        v52 = objc_alloc_init(PGFeatureExtractorAssetSourceType);
        v186[43] = v52;
        v53 = objc_alloc_init(PGFeatureExtractorAssetResolution);
        v186[44] = v53;
        v54 = objc_alloc_init(PGFeatureExtractorAssetFormat);
        v186[45] = v54;
        v55 = objc_alloc_init(PGFeatureExtractorAssetImportSource);
        v186[46] = v55;
        v56 = objc_alloc_init(PGFeatureExtractorStandardAspectRatio);
        v186[47] = v56;
        v57 = objc_alloc_init(PGFeatureExtractorLocale);
        v186[48] = v57;
        v58 = objc_alloc_init(PGFeatureExtractorTaboo);
        v186[49] = v58;
        v59 = objc_alloc_init(PGFeatureExtractorPotentialLandmark);
        v186[50] = v59;
        v60 = [PGFeatureExtractorGraphRelations alloc];
        v61 = (void *)[objc_alloc(MEMORY[0x1E4F71EC0]) initWithName:@"GraphRelations" featureExtractors:v95];
        v62 = [(PGFeatureExtractorGraphRelations *)v60 initWithGraph:v185 featureExtractor:v61];
        v186[51] = v62;
        v79 = [MEMORY[0x1E4F1C978] arrayWithObjects:v186 count:52];

        id v14 = v183;
        id v12 = v181;

        v63 = [v179 _featureExtractors:v79 withTransformers:v183 parentFeatureExtractorName:@"PersonaVector"];

        v64 = (void *)[objc_alloc(MEMORY[0x1E4F71EC0]) initWithName:@"PersonaVectorLibrarySpecificMultiModal-V1.0" featureExtractors:v63];
        v65 = [[PGFeatureExtractorPhotoLibraryAverage alloc] initWithAssetFeatureExtractor:v64 assetFetchOptionPropertySet:v181];
        a3 = [[PGFeatureExtractorAssetPhotoLibrary alloc] initWithPhotoLibraryFeatureExtractor:v65];

        id v13 = v185;
        v41 = (void *)v95;
LABEL_8:
      }
      else
      {
LABEL_9:
        [a1 _generateError:a7 errorCode:0 errorMessage:@"Requested fingerprint version requires a valid PGGraph object." underlyingError:0];
        a3 = 0;
      }
      break;
    default:
      break;
  }

  return (id)a3;
}

+ (id)_multiModalFeatureExtractorForMutliModalType:(int64_t)a3 assetFeatureExtractor:(id)a4 personaVectorFeatureExtractor:(id)a5 graph:(id)a6 transformers:(id)a7 error:(id *)a8
{
  v385[2] = *MEMORY[0x1E4F143B8];
  id v372 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  switch(a3)
  {
    case 0:
      id v17 = objc_alloc(MEMORY[0x1E4F71EC0]);
      v385[0] = v372;
      v385[1] = v14;
      v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v385 count:2];
      a3 = [v17 initWithName:&stru_1F283BC78 featureExtractors:v18];

      goto LABEL_19;
    case 1:
      if (!v15) {
        goto LABEL_18;
      }
      v347 = [[PGMeaningFeatureExtractor alloc] initWithVersion:1 error:a8];
      v384[0] = v347;
      v341 = [[PGInvariantFamilyFeatureExtractor alloc] initWithError:a8];
      v384[1] = v341;
      v333 = [[PGInvariantCoworkerFeatureExtractor alloc] initWithError:a8];
      v384[2] = v333;
      v325 = [[PGInvariantPartnerFeatureExtractor alloc] initWithError:a8];
      v384[3] = v325;
      v317 = [[PGPublicEventCategoryFeatureExtractor alloc] initWithVersion:1 error:a8];
      v384[4] = v317;
      v310 = [[PGBusinessCategoryFeatureExtractor alloc] initWithVersion:1 error:a8];
      v384[5] = v310;
      v303 = [[PGInvariantPetFeatureExtractor alloc] initWithVersion:1 error:a8];
      v384[6] = v303;
      v296 = [[PGBabyFeatureExtractor alloc] initWithError:a8];
      v384[7] = v296;
      v289 = [[PGSceneFeatureExtractor alloc] initWithVersion:1 error:a8];
      v384[8] = v289;
      uint64_t v95 = [[PGMyHomeFeatureExtractor alloc] initWithError:a8];
      v384[9] = v95;
      uint64_t v96 = [[PGMyWorkFeatureExtractor alloc] initWithError:a8];
      v384[10] = v96;
      id v358 = v16;
      v97 = [[PGMobilityFeatureExtractor alloc] initWithError:a8];
      v384[11] = v97;
      id v364 = v14;
      v98 = [[PGPartOfDayFeatureExtractor alloc] initWithError:a8];
      v384[12] = v98;
      id v370 = a1;
      v99 = [[PGSeasonFeatureExtractor alloc] initWithError:a8];
      v384[13] = v99;
      v100 = [[PGWeekendFeatureExtractor alloc] initWithError:a8];
      v384[14] = v100;
      v101 = [[PGWeekdayFeatureExtractor alloc] initWithError:a8];
      v384[15] = v101;
      id v352 = v15;
      v102 = [[PGPOIFeatureExtractor alloc] initWithVersion:1 error:a8];
      v384[16] = v102;
      v103 = [[PGROIFeatureExtractor alloc] initWithError:a8];
      v384[17] = v103;
      v104 = [MEMORY[0x1E4F1C978] arrayWithObjects:v384 count:18];

      v344 = [v370 _featureExtractors:v104 withTransformers:v358];

      v105 = objc_alloc_init(PGFeatureExtractorFaceSize);
      v383[0] = v105;
      v106 = objc_alloc_init(PGFeatureExtractorFaceQuality);
      v383[1] = v106;
      v107 = objc_alloc_init(PGFeatureExtractorFaceSmileType);
      v383[2] = v107;
      v108 = objc_alloc_init(PGFeatureExtractorFaceEyesState);
      v383[3] = v108;
      v109 = objc_alloc_init(PGFeatureExtractorFaceAgeType);
      v383[4] = v109;
      v110 = [MEMORY[0x1E4F1C978] arrayWithObjects:v383 count:5];

      uint64_t v337 = [v370 _featureExtractors:v110 withTransformers:v358];

      v382[0] = v372;
      v334 = objc_alloc_init(PGFeatureExtractorCartesianLocation);
      v382[1] = v334;
      v326 = [[PGFeatureExtractorFrequentPeople alloc] initWithNumberOfFrequentPeopleToExtract:25];
      v382[2] = v326;
      v318 = objc_alloc_init(PGFeatureExtractorExposureScore);
      v382[3] = v318;
      v311 = objc_alloc_init(PGFeatureExtractorFaceCountScore);
      v382[4] = v311;
      v304 = objc_alloc_init(PGFeatureExtractorActivityScore);
      v382[5] = v304;
      v297 = objc_alloc_init(PGFeatureExtractorVideoScore);
      v382[6] = v297;
      v290 = objc_alloc_init(PGFeatureExtractorBlurrinessScore);
      v382[7] = v290;
      v283 = objc_alloc_init(PGFeatureExtractorAudioClassification);
      v382[8] = v283;
      v277 = objc_alloc_init(PGFeatureExtractorIsFavoriteScore);
      v382[9] = v277;
      v271 = objc_alloc_init(PGFeatureExtractorHasAdjustmentsScore);
      v382[10] = v271;
      v266 = objc_alloc_init(PGFeatureExtractorDurationInSecond);
      v382[11] = v266;
      v261 = objc_alloc_init(PGFeatureExtractorImageAspectRatio);
      v382[12] = v261;
      v256 = objc_alloc_init(PGFeatureExtractorIsScreenRecording);
      v382[13] = v256;
      v251 = objc_alloc_init(PGFeatureExtractorPlayCount);
      v382[14] = v251;
      v247 = objc_alloc_init(PGFeatureExtractorShareCount);
      v382[15] = v247;
      v243 = objc_alloc_init(PGFeatureExtractorViewCount);
      v382[16] = v243;
      v239 = objc_alloc_init(PGFeatureExtractorAutoplaySuggestionScore);
      v382[17] = v239;
      v235 = objc_alloc_init(PGFeatureExtractorTastefullyBlurredScore);
      v382[18] = v235;
      v232 = objc_alloc_init(PGFeatureExtractorFailureScore);
      v382[19] = v232;
      v229 = objc_alloc_init(PGFeatureExtractorAestheticScore);
      v382[20] = v229;
      v226 = objc_alloc_init(PGFeatureExtractorPleasantLightingScore);
      v382[21] = v226;
      v223 = objc_alloc_init(PGFeatureExtractorWellFramedSubjectScore);
      v382[22] = v223;
      v220 = objc_alloc_init(PGFeatureExtractorWellChosenSubjectScore);
      v382[23] = v220;
      v217 = objc_alloc_init(PGFeatureExtractorWellTimedShotScore);
      v382[24] = v217;
      v214 = objc_alloc_init(PGFeatureExtractorSharplyFocusedSubjectScore);
      v382[25] = v214;
      v211 = objc_alloc_init(PGFeatureExtractorHarmoniousColorScore);
      v382[26] = v211;
      v208 = objc_alloc_init(PGFeatureExtractorPleasantReflectionsScore);
      v382[27] = v208;
      v205 = objc_alloc_init(PGFeatureExtractorLivelyColorScore);
      v382[28] = v205;
      v202 = objc_alloc_init(PGFeatureExtractorPleasantSymmetryScore);
      v382[29] = v202;
      v199 = objc_alloc_init(PGFeatureExtractorPleasantPatternScore);
      v382[30] = v199;
      v196 = objc_alloc_init(PGFeatureExtractorImmersivenessScore);
      v382[31] = v196;
      v193 = objc_alloc_init(PGFeatureExtractorPleasantPerspectiveScore);
      v382[32] = v193;
      v190 = objc_alloc_init(PGFeatureExtractorPleasantPostProcessingScore);
      v382[33] = v190;
      v187 = objc_alloc_init(PGFeatureExtractorNoiseScore);
      v382[34] = v187;
      id v184 = objc_alloc_init(PGFeatureExtractorPleasantCompositionScore);
      v382[35] = v184;
      id v181 = objc_alloc_init(PGFeatureExtractorInterestingSubjectScore);
      v382[36] = v181;
      id v178 = objc_alloc_init(PGFeatureExtractorIntrusiveObjectPresenceScore);
      v382[37] = v178;
      v175 = objc_alloc_init(PGFeatureExtractorPleasantCameraTiltScore);
      v382[38] = v175;
      v172 = objc_alloc_init(PGFeatureExtractorLowLightScore);
      v382[39] = v172;
      v169 = objc_alloc_init(PGFeatureExtractorAssetPlaybackStyle);
      v382[40] = v169;
      v166 = objc_alloc_init(PGFeatureExtractorAssetMediaType);
      v382[41] = v166;
      v160 = objc_alloc_init(PGFeatureExtractorAssetMediaSubtype);
      v382[42] = v160;
      v157 = objc_alloc_init(PGFeatureExtractorAssetBurstSelectionType);
      v382[43] = v157;
      v154 = objc_alloc_init(PGFeatureExtractorAssetSourceType);
      v382[44] = v154;
      v151 = objc_alloc_init(PGFeatureExtractorAssetResolution);
      v382[45] = v151;
      v148 = objc_alloc_init(PGFeatureExtractorAssetFormat);
      v382[46] = v148;
      v145 = objc_alloc_init(PGFeatureExtractorAssetImportSource);
      v382[47] = v145;
      v111 = objc_alloc_init(PGFeatureExtractorStandardAspectRatio);
      v382[48] = v111;
      v112 = objc_alloc_init(PGFeatureExtractorLocale);
      v382[49] = v112;
      v113 = objc_alloc_init(PGFeatureExtractorTaboo);
      v382[50] = v113;
      v114 = objc_alloc_init(PGFeatureExtractorPotentialLandmark);
      v382[51] = v114;
      v115 = [PGFeatureExtractorAssetPhotoLibrary alloc];
      v116 = objc_alloc_init(PGFeatureExtractorPhotoLibrarySize);
      v117 = [(PGFeatureExtractorAssetPhotoLibrary *)v115 initWithPhotoLibraryFeatureExtractor:v116];
      v382[52] = v117;
      v382[53] = v364;
      v118 = [PGFeatureExtractorFacesFromAssetAverage alloc];
      v119 = (void *)[objc_alloc(MEMORY[0x1E4F71EC0]) initWithName:@"FacesAverage" featureExtractors:v337];
      v120 = [(PGFeatureExtractorFacesFromAssetAverage *)v118 initWithFaceFeatureExtractor:v119 name:@"FacesAverage"];
      v382[54] = v120;
      v121 = [PGFeatureExtractorGraphRelations alloc];
      v122 = (void *)[objc_alloc(MEMORY[0x1E4F71EC0]) initWithName:@"GraphRelations" featureExtractors:v344];
      v123 = [(PGFeatureExtractorGraphRelations *)v121 initWithGraph:v352 featureExtractor:v122];
      v382[55] = v123;
      v163 = [MEMORY[0x1E4F1C978] arrayWithObjects:v382 count:56];

      id v16 = v358;
      id v14 = v364;

      id v15 = v352;
      v48 = [v370 _featureExtractors:v163 withTransformers:v358];

      id v49 = objc_alloc(MEMORY[0x1E4F71EC0]);
      v50 = @"MultiModal-V1.0";
      goto LABEL_11;
    case 2:
      if (!v15) {
        goto LABEL_18;
      }
      v343 = [[PGMeaningFeatureExtractor alloc] initWithVersion:1 error:a8];
      v381[0] = v343;
      v336 = [[PGPeopleFeatureExtractor alloc] initWithGraph:v15 error:a8];
      v381[1] = v336;
      v328 = [[PGInvariantFamilyFeatureExtractor alloc] initWithError:a8];
      v381[2] = v328;
      v320 = [[PGInvariantCoworkerFeatureExtractor alloc] initWithError:a8];
      v381[3] = v320;
      v313 = [[PGInvariantPartnerFeatureExtractor alloc] initWithError:a8];
      v381[4] = v313;
      v306 = [[PGPublicEventCategoryFeatureExtractor alloc] initWithVersion:1 error:a8];
      v381[5] = v306;
      v299 = [[PGBusinessCategoryFeatureExtractor alloc] initWithVersion:1 error:a8];
      v381[6] = v299;
      v292 = [[PGInvariantPetFeatureExtractor alloc] initWithVersion:1 error:a8];
      v381[7] = v292;
      v285 = [[PGBabyFeatureExtractor alloc] initWithError:a8];
      v381[8] = v285;
      v279 = [[PGSceneFeatureExtractor alloc] initWithVersion:1 error:a8];
      v381[9] = v279;
      v273 = [[PGFrequentLocationFeatureExtractor alloc] initWithGraph:v15 error:a8];
      v381[10] = v273;
      id v355 = v16;
      long long v19 = [[PGMyHomeFeatureExtractor alloc] initWithError:a8];
      v381[11] = v19;
      id v367 = a1;
      long long v20 = [[PGMyWorkFeatureExtractor alloc] initWithError:a8];
      v381[12] = v20;
      long long v21 = [[PGMobilityFeatureExtractor alloc] initWithError:a8];
      v381[13] = v21;
      id v361 = v14;
      long long v22 = [[PGPartOfDayFeatureExtractor alloc] initWithError:a8];
      v381[14] = v22;
      v23 = [[PGSeasonFeatureExtractor alloc] initWithError:a8];
      v381[15] = v23;
      id v24 = [[PGWeekendFeatureExtractor alloc] initWithError:a8];
      v381[16] = v24;
      v25 = [[PGWeekdayFeatureExtractor alloc] initWithError:a8];
      v381[17] = v25;
      id v349 = v15;
      v26 = [[PGPOIFeatureExtractor alloc] initWithVersion:1 error:a8];
      v381[18] = v26;
      v27 = [[PGROIFeatureExtractor alloc] initWithError:a8];
      v381[19] = v27;
      v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v381 count:20];

      v344 = [v367 _featureExtractors:v28 withTransformers:v355];

      v29 = objc_alloc_init(PGFeatureExtractorFaceSize);
      v380[0] = v29;
      v30 = objc_alloc_init(PGFeatureExtractorFaceQuality);
      v380[1] = v30;
      v31 = objc_alloc_init(PGFeatureExtractorFaceSmileType);
      v380[2] = v31;
      v32 = objc_alloc_init(PGFeatureExtractorFaceEyesState);
      v380[3] = v32;
      v33 = objc_alloc_init(PGFeatureExtractorFaceAgeType);
      v380[4] = v33;
      v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v380 count:5];

      uint64_t v337 = [v367 _featureExtractors:v34 withTransformers:v355];

      v379[0] = v372;
      v329 = objc_alloc_init(PGFeatureExtractorCartesianLocation);
      v379[1] = v329;
      v321 = [[PGFeatureExtractorFrequentPeople alloc] initWithNumberOfFrequentPeopleToExtract:25];
      v379[2] = v321;
      v314 = objc_alloc_init(PGFeatureExtractorExposureScore);
      v379[3] = v314;
      v307 = objc_alloc_init(PGFeatureExtractorFaceCountScore);
      v379[4] = v307;
      v300 = objc_alloc_init(PGFeatureExtractorActivityScore);
      v379[5] = v300;
      v293 = objc_alloc_init(PGFeatureExtractorVideoScore);
      v379[6] = v293;
      v286 = objc_alloc_init(PGFeatureExtractorBlurrinessScore);
      v379[7] = v286;
      v280 = objc_alloc_init(PGFeatureExtractorAudioClassification);
      v379[8] = v280;
      v274 = objc_alloc_init(PGFeatureExtractorIsFavoriteScore);
      v379[9] = v274;
      v268 = objc_alloc_init(PGFeatureExtractorHasAdjustmentsScore);
      v379[10] = v268;
      v263 = objc_alloc_init(PGFeatureExtractorDurationInSecond);
      v379[11] = v263;
      v258 = objc_alloc_init(PGFeatureExtractorImageAspectRatio);
      v379[12] = v258;
      v253 = objc_alloc_init(PGFeatureExtractorIsScreenRecording);
      v379[13] = v253;
      v248 = objc_alloc_init(PGFeatureExtractorPlayCount);
      v379[14] = v248;
      v244 = objc_alloc_init(PGFeatureExtractorShareCount);
      v379[15] = v244;
      v240 = objc_alloc_init(PGFeatureExtractorViewCount);
      v379[16] = v240;
      v236 = objc_alloc_init(PGFeatureExtractorAutoplaySuggestionScore);
      v379[17] = v236;
      v233 = objc_alloc_init(PGFeatureExtractorTastefullyBlurredScore);
      v379[18] = v233;
      v230 = objc_alloc_init(PGFeatureExtractorFailureScore);
      v379[19] = v230;
      v227 = objc_alloc_init(PGFeatureExtractorAestheticScore);
      v379[20] = v227;
      v224 = objc_alloc_init(PGFeatureExtractorPleasantLightingScore);
      v379[21] = v224;
      v221 = objc_alloc_init(PGFeatureExtractorWellFramedSubjectScore);
      v379[22] = v221;
      v218 = objc_alloc_init(PGFeatureExtractorWellChosenSubjectScore);
      v379[23] = v218;
      v215 = objc_alloc_init(PGFeatureExtractorWellTimedShotScore);
      v379[24] = v215;
      v212 = objc_alloc_init(PGFeatureExtractorSharplyFocusedSubjectScore);
      v379[25] = v212;
      v209 = objc_alloc_init(PGFeatureExtractorHarmoniousColorScore);
      v379[26] = v209;
      v206 = objc_alloc_init(PGFeatureExtractorPleasantReflectionsScore);
      v379[27] = v206;
      v203 = objc_alloc_init(PGFeatureExtractorLivelyColorScore);
      v379[28] = v203;
      v200 = objc_alloc_init(PGFeatureExtractorPleasantSymmetryScore);
      v379[29] = v200;
      v197 = objc_alloc_init(PGFeatureExtractorPleasantPatternScore);
      v379[30] = v197;
      v194 = objc_alloc_init(PGFeatureExtractorImmersivenessScore);
      v379[31] = v194;
      v191 = objc_alloc_init(PGFeatureExtractorPleasantPerspectiveScore);
      v379[32] = v191;
      v188 = objc_alloc_init(PGFeatureExtractorPleasantPostProcessingScore);
      v379[33] = v188;
      id v185 = objc_alloc_init(PGFeatureExtractorNoiseScore);
      v379[34] = v185;
      id v182 = objc_alloc_init(PGFeatureExtractorPleasantCompositionScore);
      v379[35] = v182;
      id v179 = objc_alloc_init(PGFeatureExtractorInterestingSubjectScore);
      v379[36] = v179;
      v176 = objc_alloc_init(PGFeatureExtractorIntrusiveObjectPresenceScore);
      v379[37] = v176;
      v173 = objc_alloc_init(PGFeatureExtractorPleasantCameraTiltScore);
      v379[38] = v173;
      v170 = objc_alloc_init(PGFeatureExtractorLowLightScore);
      v379[39] = v170;
      v167 = objc_alloc_init(PGFeatureExtractorAssetPlaybackStyle);
      v379[40] = v167;
      v164 = objc_alloc_init(PGFeatureExtractorAssetMediaType);
      v379[41] = v164;
      v158 = objc_alloc_init(PGFeatureExtractorAssetMediaSubtype);
      v379[42] = v158;
      v155 = objc_alloc_init(PGFeatureExtractorAssetBurstSelectionType);
      v379[43] = v155;
      v152 = objc_alloc_init(PGFeatureExtractorAssetSourceType);
      v379[44] = v152;
      v149 = objc_alloc_init(PGFeatureExtractorAssetResolution);
      v379[45] = v149;
      v146 = objc_alloc_init(PGFeatureExtractorAssetFormat);
      v379[46] = v146;
      v143 = objc_alloc_init(PGFeatureExtractorAssetImportSource);
      v379[47] = v143;
      v35 = objc_alloc_init(PGFeatureExtractorStandardAspectRatio);
      v379[48] = v35;
      v36 = objc_alloc_init(PGFeatureExtractorLocale);
      v379[49] = v36;
      v37 = objc_alloc_init(PGFeatureExtractorTaboo);
      v379[50] = v37;
      v38 = objc_alloc_init(PGFeatureExtractorPotentialLandmark);
      v379[51] = v38;
      v39 = [PGFeatureExtractorAssetPhotoLibrary alloc];
      v40 = objc_alloc_init(PGFeatureExtractorPhotoLibrarySize);
      v41 = [(PGFeatureExtractorAssetPhotoLibrary *)v39 initWithPhotoLibraryFeatureExtractor:v40];
      v379[52] = v41;
      v379[53] = v361;
      v42 = [PGFeatureExtractorFacesFromAssetAverage alloc];
      v43 = (void *)[objc_alloc(MEMORY[0x1E4F71EC0]) initWithName:@"FacesAverage" featureExtractors:v337];
      v44 = [(PGFeatureExtractorFacesFromAssetAverage *)v42 initWithFaceFeatureExtractor:v43 name:@"FacesAverage"];
      v379[54] = v44;
      v45 = [PGFeatureExtractorGraphRelations alloc];
      v46 = (void *)[objc_alloc(MEMORY[0x1E4F71EC0]) initWithName:@"GraphRelations" featureExtractors:v344];
      v47 = [(PGFeatureExtractorGraphRelations *)v45 initWithGraph:v349 featureExtractor:v46];
      v379[55] = v47;
      v161 = [MEMORY[0x1E4F1C978] arrayWithObjects:v379 count:56];

      id v16 = v355;
      id v14 = v361;

      id v15 = v349;
      v48 = [v367 _featureExtractors:v161 withTransformers:v355];

      id v49 = objc_alloc(MEMORY[0x1E4F71EC0]);
      v50 = @"LibrarySpecific-MultiModal-V1.0";
LABEL_11:
      a3 = [v49 initWithName:v50 featureExtractors:v48];

      v81 = (void *)v337;
      goto LABEL_12;
    case 3:
      if (!v15) {
        goto LABEL_18;
      }
      v345 = [[PGMeaningFeatureExtractor alloc] initWithVersion:2 error:a8];
      v378[0] = v345;
      v338 = [[PGPersonActivityMeaningFeatureExtractor alloc] initWithVersion:1 error:a8];
      v378[1] = v338;
      v330 = [[PGInvariantFamilyFeatureExtractor alloc] initWithError:a8];
      v378[2] = v330;
      v322 = [[PGInvariantCoworkerFeatureExtractor alloc] initWithError:a8];
      v378[3] = v322;
      v315 = [[PGInvariantPartnerFeatureExtractor alloc] initWithError:a8];
      v378[4] = v315;
      v308 = [[PGInvariantBrotherFeatureExtractor alloc] initWithError:a8];
      v378[5] = v308;
      v301 = [[PGInvariantSisterFeatureExtractor alloc] initWithError:a8];
      v378[6] = v301;
      v294 = [[PGInvariantMotherFeatureExtractor alloc] initWithError:a8];
      v378[7] = v294;
      v287 = [[PGInvariantFatherFeatureExtractor alloc] initWithError:a8];
      v378[8] = v287;
      v281 = [[PGInvariantSonFeatureExtractor alloc] initWithError:a8];
      v378[9] = v281;
      v275 = [[PGInvariantDaughterFeatureExtractor alloc] initWithError:a8];
      v378[10] = v275;
      v269 = [[PGPublicEventCategoryFeatureExtractor alloc] initWithVersion:2 error:a8];
      v378[11] = v269;
      v264 = [[PGBusinessCategoryFeatureExtractor alloc] initWithVersion:2 error:a8];
      v378[12] = v264;
      v259 = [[PGInvariantPetFeatureExtractor alloc] initWithVersion:2 error:a8];
      v378[13] = v259;
      v254 = [[PGBabyFeatureExtractor alloc] initWithError:a8];
      v378[14] = v254;
      v249 = [[PGSceneFeatureExtractor alloc] initWithVersion:2 error:a8];
      v378[15] = v249;
      v245 = [[PGMyHomeFeatureExtractor alloc] initWithError:a8];
      v378[16] = v245;
      v241 = [[PGMyWorkFeatureExtractor alloc] initWithError:a8];
      v378[17] = v241;
      v237 = [[PGMobilityFeatureExtractor alloc] initWithError:a8];
      v378[18] = v237;
      v51 = [[PGPartOfDayFeatureExtractor alloc] initWithError:a8];
      v378[19] = v51;
      id v368 = a1;
      v52 = [[PGSeasonFeatureExtractor alloc] initWithError:a8];
      v378[20] = v52;
      v53 = [[PGWeekendFeatureExtractor alloc] initWithError:a8];
      v378[21] = v53;
      id v362 = v14;
      v54 = [[PGWeekdayFeatureExtractor alloc] initWithError:a8];
      v378[22] = v54;
      v55 = [[PGPOIFeatureExtractor alloc] initWithVersion:2 error:a8];
      v378[23] = v55;
      v56 = [[PGROIFeatureExtractor alloc] initWithError:a8];
      v378[24] = v56;
      id v356 = v16;
      v57 = [[PGInfrequentCountryFeatureExtractor alloc] initWithVersion:1 graph:v15 error:a8];
      v378[25] = v57;
      v58 = [[PGCityFeatureExtractor alloc] initWithVersion:1 error:a8];
      v378[26] = v58;
      id v350 = v15;
      v59 = [[PGCelebratedHolidayFeatureExtractor alloc] initWithVersion:1 error:a8];
      v378[27] = v59;
      v60 = [MEMORY[0x1E4F1C978] arrayWithObjects:v378 count:28];

      v344 = [v368 _featureExtractors:v60 withTransformers:v356];

      v61 = objc_alloc_init(PGFeatureExtractorFaceSize);
      v377[0] = v61;
      v62 = objc_alloc_init(PGFeatureExtractorFaceQuality);
      v377[1] = v62;
      v63 = objc_alloc_init(PGFeatureExtractorFaceSmileType);
      v377[2] = v63;
      v64 = objc_alloc_init(PGFeatureExtractorFaceEyesState);
      v377[3] = v64;
      v65 = objc_alloc_init(PGFeatureExtractorFaceAgeType);
      v377[4] = v65;
      v66 = [MEMORY[0x1E4F1C978] arrayWithObjects:v377 count:5];

      uint64_t v183 = [v368 _featureExtractors:v66 withTransformers:v356];

      v376[0] = v372;
      v339 = objc_alloc_init(PGFeatureExtractorCartesianLocation);
      v376[1] = v339;
      v331 = [[PGFeatureExtractorFrequentPeople alloc] initWithNumberOfFrequentPeopleToExtract:25];
      v376[2] = v331;
      v323 = objc_alloc_init(PGFeatureExtractorExposureScore);
      v376[3] = v323;
      v316 = objc_alloc_init(PGFeatureExtractorFaceCountScore);
      v376[4] = v316;
      v309 = objc_alloc_init(PGFeatureExtractorActivityScore);
      v376[5] = v309;
      v302 = objc_alloc_init(PGFeatureExtractorVideoScore);
      v376[6] = v302;
      v295 = objc_alloc_init(PGFeatureExtractorBlurrinessScore);
      v376[7] = v295;
      v288 = objc_alloc_init(PGFeatureExtractorAudioClassification);
      v376[8] = v288;
      v282 = objc_alloc_init(PGFeatureExtractorIsFavoriteScore);
      v376[9] = v282;
      v276 = objc_alloc_init(PGFeatureExtractorHasAdjustmentsScore);
      v376[10] = v276;
      v270 = objc_alloc_init(PGFeatureExtractorDurationInSecond);
      v376[11] = v270;
      v265 = objc_alloc_init(PGFeatureExtractorImageAspectRatio);
      v376[12] = v265;
      v260 = objc_alloc_init(PGFeatureExtractorIsScreenRecording);
      v376[13] = v260;
      v255 = objc_alloc_init(PGFeatureExtractorPlayCount);
      v376[14] = v255;
      v250 = objc_alloc_init(PGFeatureExtractorShareCount);
      v376[15] = v250;
      v246 = objc_alloc_init(PGFeatureExtractorViewCount);
      v376[16] = v246;
      v242 = objc_alloc_init(PGFeatureExtractorAutoplaySuggestionScore);
      v376[17] = v242;
      v238 = objc_alloc_init(PGFeatureExtractorTastefullyBlurredScore);
      v376[18] = v238;
      v234 = objc_alloc_init(PGFeatureExtractorFailureScore);
      v376[19] = v234;
      v231 = objc_alloc_init(PGFeatureExtractorAestheticScore);
      v376[20] = v231;
      v228 = objc_alloc_init(PGFeatureExtractorPleasantLightingScore);
      v376[21] = v228;
      v225 = objc_alloc_init(PGFeatureExtractorWellFramedSubjectScore);
      v376[22] = v225;
      v222 = objc_alloc_init(PGFeatureExtractorWellChosenSubjectScore);
      v376[23] = v222;
      v219 = objc_alloc_init(PGFeatureExtractorWellTimedShotScore);
      v376[24] = v219;
      v216 = objc_alloc_init(PGFeatureExtractorSharplyFocusedSubjectScore);
      v376[25] = v216;
      v213 = objc_alloc_init(PGFeatureExtractorHarmoniousColorScore);
      v376[26] = v213;
      v210 = objc_alloc_init(PGFeatureExtractorPleasantReflectionsScore);
      v376[27] = v210;
      v207 = objc_alloc_init(PGFeatureExtractorLivelyColorScore);
      v376[28] = v207;
      v204 = objc_alloc_init(PGFeatureExtractorPleasantSymmetryScore);
      v376[29] = v204;
      v201 = objc_alloc_init(PGFeatureExtractorPleasantPatternScore);
      v376[30] = v201;
      v198 = objc_alloc_init(PGFeatureExtractorImmersivenessScore);
      v376[31] = v198;
      v195 = objc_alloc_init(PGFeatureExtractorPleasantPerspectiveScore);
      v376[32] = v195;
      v192 = objc_alloc_init(PGFeatureExtractorPleasantPostProcessingScore);
      v376[33] = v192;
      v189 = objc_alloc_init(PGFeatureExtractorNoiseScore);
      v376[34] = v189;
      v186 = objc_alloc_init(PGFeatureExtractorPleasantCompositionScore);
      v376[35] = v186;
      id v180 = objc_alloc_init(PGFeatureExtractorInterestingSubjectScore);
      v376[36] = v180;
      v177 = objc_alloc_init(PGFeatureExtractorIntrusiveObjectPresenceScore);
      v376[37] = v177;
      v174 = objc_alloc_init(PGFeatureExtractorPleasantCameraTiltScore);
      v376[38] = v174;
      v171 = objc_alloc_init(PGFeatureExtractorLowLightScore);
      v376[39] = v171;
      v168 = objc_alloc_init(PGFeatureExtractorAssetPlaybackStyle);
      v376[40] = v168;
      v165 = objc_alloc_init(PGFeatureExtractorAssetMediaType);
      v376[41] = v165;
      v162 = objc_alloc_init(PGFeatureExtractorAssetMediaSubtype);
      v376[42] = v162;
      v156 = objc_alloc_init(PGFeatureExtractorAssetBurstSelectionType);
      v376[43] = v156;
      v153 = objc_alloc_init(PGFeatureExtractorAssetSourceType);
      v376[44] = v153;
      v150 = objc_alloc_init(PGFeatureExtractorAssetResolution);
      v376[45] = v150;
      v147 = objc_alloc_init(PGFeatureExtractorAssetFormat);
      v376[46] = v147;
      v144 = objc_alloc_init(PGFeatureExtractorAssetImportSource);
      v376[47] = v144;
      v142 = objc_alloc_init(PGFeatureExtractorStandardAspectRatio);
      v376[48] = v142;
      v67 = objc_alloc_init(PGFeatureExtractorLocale);
      v376[49] = v67;
      v68 = objc_alloc_init(PGFeatureExtractorTaboo);
      v376[50] = v68;
      v69 = objc_alloc_init(PGFeatureExtractorPotentialLandmark);
      v376[51] = v69;
      v70 = [PGFeatureExtractorAssetPhotoLibrary alloc];
      v71 = objc_alloc_init(PGFeatureExtractorPhotoLibrarySize);
      v72 = [(PGFeatureExtractorAssetPhotoLibrary *)v70 initWithPhotoLibraryFeatureExtractor:v71];
      v376[52] = v72;
      v73 = [[PGFeatureExtractorAssetSpecialPOI alloc] initWithGraph:v350];
      v376[53] = v73;
      v74 = [PGFeatureExtractorFacesFromAssetAverage alloc];
      v75 = (void *)[objc_alloc(MEMORY[0x1E4F71EC0]) initWithName:@"FacesAverage" featureExtractors:v183];
      v76 = [(PGFeatureExtractorFacesFromAssetAverage *)v74 initWithFaceFeatureExtractor:v75 name:@"FacesAverage"];
      v376[54] = v76;
      v77 = [PGFeatureExtractorGraphRelations alloc];
      v78 = (void *)[objc_alloc(MEMORY[0x1E4F71EC0]) initWithName:@"GraphRelations" featureExtractors:v344];
      v79 = [(PGFeatureExtractorGraphRelations *)v77 initWithGraph:v350 featureExtractor:v78];
      v376[55] = v79;
      v376[56] = v362;
      v159 = [MEMORY[0x1E4F1C978] arrayWithObjects:v376 count:57];

      id v16 = v356;
      id v14 = v362;

      id v15 = v350;
      v80 = [v368 _featureExtractors:v159 withTransformers:v356];

      a3 = [objc_alloc(MEMORY[0x1E4F71EC0]) initWithName:@"MultiModal-V2.0" featureExtractors:v80];
      v81 = (void *)v183;
LABEL_12:

      goto LABEL_19;
    case 4:
      if (!v15) {
        goto LABEL_18;
      }
      v363 = [[PGMeaningFeatureExtractor alloc] initWithVersion:2 error:a8];
      v375[0] = v363;
      v357 = [[PGPersonActivityMeaningFeatureExtractor alloc] initWithVersion:1 error:a8];
      v375[1] = v357;
      v351 = [[PGInvariantFamilyFeatureExtractor alloc] initWithError:a8];
      v375[2] = v351;
      v346 = [[PGSocialGroupFeatureExtractor alloc] initWithError:a8];
      v375[3] = v346;
      v340 = [[PGInvariantPetFeatureExtractor alloc] initWithVersion:2 error:a8];
      v375[4] = v340;
      v332 = [[PGSceneFeatureExtractor alloc] initWithVersion:4 error:a8];
      v375[5] = v332;
      v324 = [[PGMyHomeFeatureExtractor alloc] initWithError:a8];
      v375[6] = v324;
      v82 = [[PGMyWorkFeatureExtractor alloc] initWithError:a8];
      v375[7] = v82;
      v83 = [[PGROIFeatureExtractor alloc] initWithError:a8];
      v375[8] = v83;
      v84 = [[PGInfrequentCountryFeatureExtractor alloc] initWithVersion:1 graph:v15 error:a8];
      v375[9] = v84;
      v85 = [[PGInfrequentCityFeatureExtractor alloc] initWithVersion:1 graph:v15 error:a8];
      v375[10] = v85;
      id v86 = v16;
      id v87 = v14;
      v88 = [[PGCelebratedHolidayFeatureExtractor alloc] initWithVersion:1 error:a8];
      v375[11] = v88;
      id v369 = a1;
      id v89 = v15;
      v90 = objc_alloc_init(PGFeatureExtractorMomentNodeSpecialPOI);
      v375[12] = v90;
      v91 = [MEMORY[0x1E4F1C978] arrayWithObjects:v375 count:13];

      id v15 = v89;
      id v14 = v87;
      id v16 = v86;

      v92 = [v369 _featureExtractors:v91 withTransformers:v86];
      id v93 = objc_alloc(MEMORY[0x1E4F71EC0]);
      v94 = @"MultiModal-MomentNode-Music-V1.0";
      goto LABEL_17;
    case 5:
      if (!v15) {
        goto LABEL_18;
      }
      v359 = [[PGMeaningFeatureExtractor alloc] initWithVersion:2 error:a8];
      v374[0] = v359;
      v353 = [[PGMyHomeFeatureExtractor alloc] initWithError:a8];
      v374[1] = v353;
      v124 = [[PGMyWorkFeatureExtractor alloc] initWithError:a8];
      v374[2] = v124;
      id v365 = v14;
      v125 = [[PGSocialGroupFeatureExtractor alloc] initWithError:a8];
      v374[3] = v125;
      id v126 = v16;
      v127 = [[PGROIFeatureExtractor alloc] initWithError:a8];
      v374[4] = v127;
      id v128 = a1;
      v129 = [[PGInfrequentCountryFeatureExtractor alloc] initWithVersion:1 graph:v15 error:a8];
      v374[5] = v129;
      v130 = [[PGInfrequentCityFeatureExtractor alloc] initWithVersion:1 graph:v15 error:a8];
      v374[6] = v130;
      v131 = objc_alloc_init(PGFeatureExtractorMomentNodeSpecialPOI);
      v374[7] = v131;
      v91 = [MEMORY[0x1E4F1C978] arrayWithObjects:v374 count:8];

      id v16 = v126;
      id v14 = v365;

      v92 = [v128 _featureExtractors:v91 withTransformers:v126];
      id v93 = objc_alloc(MEMORY[0x1E4F71EC0]);
      v94 = @"MultiModal-MomentNode-Music-V2.0";
      goto LABEL_17;
    case 6:
      if (v15)
      {
        v360 = [[PGMeaningMemoryNodeFeatureExtractor alloc] initWithVersion:2 error:a8];
        v373[0] = v360;
        v354 = [[PGInvariantFamilyMemoryNodeFeatureExtractor alloc] initWithError:a8];
        v373[1] = v354;
        v348 = [[PGInvariantCoworkerMemoryNodeFeatureExtractor alloc] initWithError:a8];
        v373[2] = v348;
        v342 = [[PGInvariantPartnerMemoryNodeFeatureExtractor alloc] initWithError:a8];
        v373[3] = v342;
        v335 = [[PGInvariantPartnerBiologicalSexMaleMemoryNodeFeatureExtractor alloc] initWithError:a8];
        v373[4] = v335;
        v327 = [[PGInvariantPartnerBiologicalSexFemaleMemoryNodeFeatureExtractor alloc] initWithError:a8];
        v373[5] = v327;
        v319 = [[PGInvariantPetMemoryNodeFeatureExtractor alloc] initWithVersion:2 error:a8];
        v373[6] = v319;
        v312 = [[PGBabyMemoryNodeFeatureExtractor alloc] initWithError:a8];
        v373[7] = v312;
        v305 = [[PGInvariantMotherMemoryNodeFeatureExtractor alloc] initWithError:a8];
        v373[8] = v305;
        v298 = [[PGInvariantFatherMemoryNodeFeatureExtractor alloc] initWithError:a8];
        v373[9] = v298;
        v291 = [[PGInvariantDaughterMemoryNodeFeatureExtractor alloc] initWithError:a8];
        v373[10] = v291;
        v284 = [[PGInvariantSonMemoryNodeFeatureExtractor alloc] initWithError:a8];
        v373[11] = v284;
        v278 = [[PGInvariantSisterMemoryNodeFeatureExtractor alloc] initWithError:a8];
        v373[12] = v278;
        v272 = [[PGInvariantBrotherMemoryNodeFeatureExtractor alloc] initWithError:a8];
        v373[13] = v272;
        v267 = [[PGInvariantMyFriendMemoryNodeFeatureExtractor alloc] initWithError:a8];
        v373[14] = v267;
        v262 = [[PGChildMemoryNodeFeatureExtractor alloc] initWithError:a8];
        v373[15] = v262;
        v257 = [[PGSocialGroupMemoryNodeFeatureExtractor alloc] initWithError:a8];
        v373[16] = v257;
        v252 = [[PGOverTheYearsMemoryNodeFeatureExtractor alloc] initWithVersion:1 error:a8];
        v373[17] = v252;
        v132 = [[PGCelebratedHolidayMemoryNodeFeatureExtractor alloc] initWithVersion:1 error:a8];
        v373[18] = v132;
        id v366 = v14;
        v133 = [[PGSceneMemoryNodeFeatureExtractor alloc] initWithVersion:4 error:a8];
        v373[19] = v133;
        v134 = [[PGROIMemoryNodeFeatureExtractor alloc] initWithError:a8];
        v373[20] = v134;
        v135 = [[PGCityMemoryNodeFeatureExtractor alloc] initWithVersion:1 error:a8];
        v373[21] = v135;
        id v136 = v16;
        v137 = [[PGCountryMemoryNodeFeatureExtractor alloc] initWithVersion:1 graph:v15 error:a8];
        v373[22] = v137;
        v138 = [[PGAOIMemoryNodeFeatureExtractor alloc] initWithError:a8];
        v373[23] = v138;
        id v371 = a1;
        id v139 = v15;
        v140 = [[PGAudioMemoryNodeFeatureExtractor alloc] initWithVersion:1 error:a8];
        v373[24] = v140;
        v91 = [MEMORY[0x1E4F1C978] arrayWithObjects:v373 count:25];

        id v15 = v139;
        id v16 = v136;

        id v14 = v366;
        v92 = [v371 _featureExtractors:v91 withTransformers:v136];
        id v93 = objc_alloc(MEMORY[0x1E4F71EC0]);
        v94 = @"MultiModal-MemoryNode-Music-V1.0";
LABEL_17:
        a3 = [v93 initWithName:v94 featureExtractors:v92];
      }
      else
      {
LABEL_18:
        [a1 _generateError:a8 errorCode:0 errorMessage:@"Requested fingerprint version requires a valid PGGraph object." underlyingError:0];
        a3 = 0;
      }
LABEL_19:

      return (id)a3;
    default:
      goto LABEL_19;
  }
}

+ (id)_assetPrintFeatureExtractorForAssetPrintType:(int64_t)a3 transformers:(id)a4 error:(id *)a5
{
  id v7 = a4;
  switch(a3)
  {
    case 0:
      id v8 = objc_alloc(MEMORY[0x1E4F71EC0]);
      a1 = (id)[v8 initWithName:&stru_1F283BC78 featureExtractors:MEMORY[0x1E4F1CBF0]];
      break;
    case 1:
      id v9 = [a1 _sceneprintFeatureExtractorInstance];
      goto LABEL_6;
    case 2:
      id v9 = objc_alloc_init(PGFeatureExtractorPCAPrint);
      goto LABEL_6;
    case 3:
      id v9 = [a1 _clipprintFeatureExtractorInstance];
LABEL_6:
      id v10 = v9;
      a1 = [a1 _featureExtractor:v9 withTransformers:v7];

      break;
    default:
      break;
  }

  return a1;
}

+ (void)resetPreCalculatedFeatures
{
  +[PGFeatureExtractorPhotoLibraryAverage resetPreCalculatedFeatureVector];
  +[PGFeatureExtractorPhotoLibrarySize resetPreCalculatedPhotoLibrarySize];
}

+ (BOOL)isMemoryNodeFingerprintVersion:(int64_t)a3
{
  return a3 == 228;
}

+ (BOOL)isMomentNodeFingerprintVersion:(int64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) == 226;
}

+ (BOOL)isMemoryFingerprintVersion:(int64_t)a3
{
  return ((unint64_t)(a3 - 201) < 0x19) & (0x1003FFFu >> (a3 + 55));
}

+ (BOOL)isMomentFingerprintVersion:(int64_t)a3
{
  return ((unint64_t)(a3 - 101) < 0x19) & (0x1003FFFu >> (a3 - 101));
}

+ (BOOL)isAssetFingerprintVersion:(int64_t)a3
{
  return ((unint64_t)(a3 - 201) > 0x1B || ((1 << (a3 + 55)) & 0xF003FFF) == 0)
      && ((unint64_t)(a3 - 101) > 0x18 || ((1 << (a3 - 101)) & 0x1003FFF) == 0)
      && a3 != 0;
}

+ (id)fetchOptionPropertySetForFingerprintVersion:(int64_t)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  char v3 = a3 + 55;
  if ((unint64_t)(a3 - 201) <= 0x1C)
  {
    if (((1 << v3) & 0x11003FFC) != 0) {
      goto LABEL_11;
    }
    if (((1 << v3) & 3) != 0) {
      goto LABEL_17;
    }
  }
  if ((unint64_t)a3 > 0x19) {
    goto LABEL_3;
  }
  if (((1 << a3) & 0x200F7F8) != 0)
  {
LABEL_11:
    uint64_t v6 = *MEMORY[0x1E4F39458];
    uint64_t v13 = *MEMORY[0x1E4F39550];
    uint64_t v14 = v6;
    uint64_t v7 = *MEMORY[0x1E4F394E0];
    uint64_t v15 = *MEMORY[0x1E4F39568];
    uint64_t v16 = v7;
    uint64_t v8 = *MEMORY[0x1E4F394B8];
    uint64_t v17 = *MEMORY[0x1E4F39420];
    uint64_t v18 = v8;
    id v9 = (void *)MEMORY[0x1E4F1C978];
    id v10 = &v13;
    uint64_t v11 = 6;
LABEL_12:
    v4 = objc_msgSend(v9, "arrayWithObjects:count:", v10, v11, v13, v14, v15, v16, v17, v18, v19, v20);
    goto LABEL_13;
  }
  if (((1 << a3) & 6) != 0) {
    goto LABEL_17;
  }
LABEL_3:
  v4 = 0;
  char v5 = a3 - 101;
  if ((unint64_t)(a3 - 101) > 0x18) {
    goto LABEL_13;
  }
  if (((1 << v5) & 0x1003FFC) != 0) {
    goto LABEL_11;
  }
  if (((1 << v5) & 3) != 0)
  {
LABEL_17:
    uint64_t v19 = *MEMORY[0x1E4F39550];
    id v9 = (void *)MEMORY[0x1E4F1C978];
    id v10 = &v19;
    uint64_t v11 = 1;
    goto LABEL_12;
  }
LABEL_13:
  return v4;
}

+ (id)featureExtractorForFingerprintVersion:(int64_t)a3 withGraph:(id)a4 withTransformers:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = 0;
  if (!(!v14 & v13))
  {
    uint64_t v16 = 0;
    uint64_t v17 = 0;
    switch(a3)
    {
      case 201:
        goto LABEL_8;
      case 202:
        goto LABEL_9;
      case 203:
        goto LABEL_10;
      case 204:
        goto LABEL_11;
      case 205:
        goto LABEL_12;
      case 206:
        goto LABEL_13;
      case 207:
        goto LABEL_14;
      case 208:
        goto LABEL_16;
      case 209:
        goto LABEL_17;
      case 210:
        goto LABEL_19;
      case 211:
        goto LABEL_21;
      case 212:
        goto LABEL_23;
      case 213:
        goto LABEL_24;
      case 214:
        goto LABEL_25;
      case 215:
      case 216:
      case 217:
      case 218:
      case 219:
      case 220:
      case 221:
      case 222:
      case 223:
      case 224:
        goto LABEL_28;
      case 225:
        goto LABEL_43;
      case 226:
        uint64_t v12 = 0;
        uint64_t v17 = 0;
        uint64_t v16 = 4;
        goto LABEL_28;
      case 227:
        uint64_t v12 = 0;
        uint64_t v17 = 0;
        uint64_t v16 = 5;
        goto LABEL_28;
      case 228:
        uint64_t v12 = 0;
        uint64_t v17 = 0;
        uint64_t v16 = 6;
        goto LABEL_28;
      case 229:
        uint64_t v12 = 0;
        uint64_t v16 = 0;
        uint64_t v17 = 3;
        goto LABEL_28;
      default:
        JUMPOUT(0);
    }
  }
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  switch(a3)
  {
    case 0:
      [a1 _generateError:a6 errorCode:2 errorMessage:@"Cannot produce feature extractor for PGFingerprintVersionUnknown." underlyingError:0];
      uint64_t v15 = 0;
      goto LABEL_40;
    case 1:
LABEL_8:
      uint64_t v12 = 0;
      uint64_t v16 = 0;
      goto LABEL_27;
    case 2:
LABEL_9:
      uint64_t v12 = 0;
      uint64_t v16 = 0;
      goto LABEL_18;
    case 3:
LABEL_10:
      uint64_t v12 = 0;
      goto LABEL_15;
    case 4:
LABEL_11:
      uint64_t v12 = 0;
      uint64_t v17 = 1;
      goto LABEL_20;
    case 5:
LABEL_12:
      uint64_t v12 = 0;
      uint64_t v17 = 2;
      goto LABEL_22;
    case 6:
LABEL_13:
      uint64_t v12 = 0;
      goto LABEL_26;
    case 7:
LABEL_14:
      uint64_t v12 = 1;
LABEL_15:
      uint64_t v16 = 1;
      goto LABEL_18;
    case 8:
LABEL_16:
      uint64_t v16 = 1;
      uint64_t v12 = 2;
      goto LABEL_18;
    case 9:
LABEL_17:
      uint64_t v16 = 2;
      uint64_t v12 = 1;
LABEL_18:
      uint64_t v17 = 1;
      break;
    case 10:
LABEL_19:
      uint64_t v17 = 1;
      uint64_t v12 = 2;
LABEL_20:
      uint64_t v16 = 2;
      break;
    case 11:
    case 16:
    case 17:
    case 18:
    case 19:
    case 20:
    case 21:
    case 22:
    case 23:
    case 24:
      break;
    case 12:
LABEL_21:
      uint64_t v17 = 2;
      uint64_t v12 = 1;
LABEL_22:
      uint64_t v16 = 1;
      break;
    case 13:
LABEL_23:
      uint64_t v16 = 1;
      uint64_t v12 = 2;
      goto LABEL_27;
    case 14:
LABEL_24:
      uint64_t v16 = 2;
      uint64_t v12 = 1;
      goto LABEL_27;
    case 15:
LABEL_25:
      uint64_t v12 = 2;
LABEL_26:
      uint64_t v16 = 2;
LABEL_27:
      uint64_t v17 = 2;
      break;
    case 25:
LABEL_43:
      uint64_t v12 = 0;
      uint64_t v17 = 2;
      uint64_t v16 = 3;
      break;
    default:
      uint64_t v16 = 0;
      uint64_t v17 = 0;
      switch(a3)
      {
        case 'e':
          goto LABEL_8;
        case 'f':
          goto LABEL_9;
        case 'g':
          goto LABEL_10;
        case 'h':
          goto LABEL_11;
        case 'i':
          goto LABEL_12;
        case 'j':
          goto LABEL_13;
        case 'k':
          goto LABEL_14;
        case 'l':
          goto LABEL_16;
        case 'm':
          goto LABEL_17;
        case 'n':
          goto LABEL_19;
        case 'o':
          goto LABEL_21;
        case 'p':
          goto LABEL_23;
        case 'q':
          goto LABEL_24;
        case 'r':
          goto LABEL_25;
        case '}':
          goto LABEL_43;
        default:
          goto LABEL_28;
      }
  }
LABEL_28:
  uint64_t v18 = [a1 _assetPrintFeatureExtractorForAssetPrintType:v17 transformers:v11 error:a6];
  if (v18)
  {
    uint64_t v19 = [a1 fetchOptionPropertySetForFingerprintVersion:a3];
    uint64_t v20 = [a1 _personaVectorFeatureExtractorForPersonaVectorType:v12 fetchOptionPropertySet:v19 graph:v10 transformers:v11 error:a6];
    if (v20)
    {
      uint64_t v15 = [a1 _multiModalFeatureExtractorForMutliModalType:v16 assetFeatureExtractor:v18 personaVectorFeatureExtractor:v20 graph:v10 transformers:v11 error:a6];
      if (v15)
      {
        if ([a1 isMomentNodeFingerprintVersion:a3])
        {
          uint64_t v21 = [a1 _featureExtractor:v15 withTransformers:v11];

          uint64_t v15 = (void *)v21;
        }
        if (([a1 isMomentFingerprintVersion:a3] & 1) != 0
          || [a1 isMemoryFingerprintVersion:a3])
        {
          long long v22 = [a1 nameForFingerprintVersion:a3];
          v23 = [[PGFeatureExtractorAssetCollectionAverage alloc] initWithAssetFeatureExtractor:v15 assetFetchOptionPropertySet:v19 name:v22];
          uint64_t v24 = [a1 _featureExtractor:v23 withTransformers:v11];

          uint64_t v15 = (void *)v24;
        }
      }
    }
    else
    {
      uint64_t v15 = 0;
    }
  }
  else
  {
    uint64_t v15 = 0;
  }

LABEL_40:
  return v15;
}

+ (int64_t)fingerprintVersionForName:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    if ([@"sceneprint-pca-256_DEPRECATED" isEqualToString:v3])
    {
      int64_t v4 = 1;
    }
    else if ([@"sceneprint-2048_DEPRECATED" isEqualToString:v3])
    {
      int64_t v4 = 2;
    }
    else if ([@"Asset-Scene2048-MultiModal-V1.0_DEPRECATED" isEqualToString:v3])
    {
      int64_t v4 = 3;
    }
    else if ([@"Asset-Scene2048-LibrarySpecific-MultiModal-V1.0_DEPRECATED" isEqualToString:v3])
    {
      int64_t v4 = 4;
    }
    else if ([@"Asset-ScenePCA256-MultiModal-V1.0_DEPRECATED" isEqualToString:v3])
    {
      int64_t v4 = 5;
    }
    else if ([@"Asset-ScenePCA256-LibrarySpecific-MultiModal-V1.0_DEPRECATED" isEqualToString:v3])
    {
      int64_t v4 = 6;
    }
    else if ([@"moment-average-sceneprint-pca-256_DEPRECATED" isEqualToString:v3])
    {
      int64_t v4 = 101;
    }
    else if ([@"moment-average-sceneprint-2048_DEPRECATED" isEqualToString:v3])
    {
      int64_t v4 = 102;
    }
    else if ([@"MomentAverage-Scene2048-MultiModal-V1.0_DEPRECATED" isEqualToString:v3])
    {
      int64_t v4 = 103;
    }
    else if ([@"MomentAverage-Scene2048-LibrarySpecific-MultiModal-V1.0_DEPRECATED" isEqualToString:v3])
    {
      int64_t v4 = 104;
    }
    else if ([@"MomentAverage-ScenePCA256-MultiModal-V1.0_DEPRECATED" isEqualToString:v3])
    {
      int64_t v4 = 105;
    }
    else if ([@"MomentAverage-ScenePCA256-LibrarySpecific-MultiModal-V1.0_DEPRECATED" isEqualToString:v3])
    {
      int64_t v4 = 106;
    }
    else if ([@"memory-average-sceneprint-pca-256_DEPRECATED" isEqualToString:v3])
    {
      int64_t v4 = 201;
    }
    else if ([@"memory-average-sceneprint-2048_DEPRECATED" isEqualToString:v3])
    {
      int64_t v4 = 202;
    }
    else if ([@"MemoryAverage-Scene2048-MultiModal-V1.0_DEPRECATED" isEqualToString:v3])
    {
      int64_t v4 = 203;
    }
    else if ([@"MemoryAverage-Scene2048-MultiModal-V1.0_DEPRECATED" isEqualToString:v3])
    {
      int64_t v4 = 204;
    }
    else if ([@"MemoryAverage-ScenePCA256-MultiModal-V1.0_DEPRECATED" isEqualToString:v3])
    {
      int64_t v4 = 205;
    }
    else if ([@"MemoryAverage-ScenePCA256-MultiModal-V1.0_DEPRECATED" isEqualToString:v3])
    {
      int64_t v4 = 206;
    }
    else if ([@"Asset-Scene2048-MultiModal-V1.0-PersonaVectorPCA256_DEPRECATED" isEqualToString:v3])
    {
      int64_t v4 = 7;
    }
    else if ([@"Asset-Scene2048-MultiModal-V1.0-PersonaVectorMultiModal-V1.0_DEPRECATED" isEqualToString:v3])
    {
      int64_t v4 = 8;
    }
    else if ([@"Asset-Scene2048-LibrarySpecific-MultiModal-V1.0-PersonaVectorPCA256_DEPRECATED" isEqualToString:v3])
    {
      int64_t v4 = 9;
    }
    else if ([@"Asset-Scene2048-LibrarySpecific-MultiModal-V1.0-PersonaVectorMultiModal-V1.0_DEPRECATED" isEqualToString:v3])
    {
      int64_t v4 = 10;
    }
    else if ([@"Asset-ScenePCA256-MultiModal-V1.0-PersonaVectorPCA256_DEPRECATED" isEqualToString:v3])
    {
      int64_t v4 = 12;
    }
    else if ([@"Asset-ScenePCA256-MultiModal-V1.0-PersonaVectorMultiModal-V1.0_DEPRECATED" isEqualToString:v3])
    {
      int64_t v4 = 13;
    }
    else if ([@"Asset-ScenePCA256-LibrarySpecific-MultiModal-V1.0-PersonaVectorPCA256_DEPRECATED" isEqualToString:v3])
    {
      int64_t v4 = 14;
    }
    else if ([@"Asset-ScenePCA256-LibrarySpecific-MultiModal-V1.0-PersonaVectorMultiModal-V1.0_DEPRECATED" isEqualToString:v3])
    {
      int64_t v4 = 15;
    }
    else if ([@"MomentAverage-Scene2048-MultiModal-V1.0-PersonaVectorPCA256_DEPRECATED" isEqualToString:v3])
    {
      int64_t v4 = 107;
    }
    else if ([@"MomentAverage-Scene2048-MultiModal-V1.0-PersonaVectorMultiModal-V1.0_DEPRECATED" isEqualToString:v3])
    {
      int64_t v4 = 108;
    }
    else if ([@"MomentAverage-Scene2048-LibrarySpecific-MultiModal-V1.0-PersonaVectorPCA256_DEPRECATED" isEqualToString:v3])
    {
      int64_t v4 = 109;
    }
    else if ([@"MomentAverage-Scene2048-LibrarySpecific-MultiModal-V1.0-PersonaVectorMultiModal-V1.0_DEPRECATED" isEqualToString:v3])
    {
      int64_t v4 = 110;
    }
    else if ([@"MomentAverage-ScenePCA256-MultiModal-V1.0-PersonaVectorPCA256_DEPRECATED" isEqualToString:v3])
    {
      int64_t v4 = 111;
    }
    else if ([@"MomentAverage-ScenePCA256-MultiModal-V1.0-PersonaVectorMultiModal-V1.0_DEPRECATED" isEqualToString:v3])
    {
      int64_t v4 = 112;
    }
    else if ([@"MomentAverage-ScenePCA256-LibrarySpecific-MultiModal-V1.0-PersonaVectorPCA256_DEPRECATED" isEqualToString:v3])
    {
      int64_t v4 = 113;
    }
    else if ([@"MomentAverage-ScenePCA256-LibrarySpecific-MultiModal-V1.0-PersonaVectorMultiModal-V1.0_DEPRECATED" isEqualToString:v3])
    {
      int64_t v4 = 114;
    }
    else if ([@"MemoryAverage-Scene2048-MultiModal-V1.0-PersonaVectorPCA256_DEPRECATED" isEqualToString:v3])
    {
      int64_t v4 = 207;
    }
    else if ([@"MemoryAverage-Scene2048-MultiModal-V1.0-PersonaVectorMultiModal-V1.0_DEPRECATED" isEqualToString:v3])
    {
      int64_t v4 = 208;
    }
    else if ([@"MemoryAverage-Scene2048-MultiModal-V1.0-PersonaVectorPCA256_DEPRECATED" isEqualToString:v3])
    {
      int64_t v4 = 209;
    }
    else if ([@"MemoryAverage-Scene2048-MultiModal-V1.0-PersonaVectorMultiModal-V1.0_DEPRECATED" isEqualToString:v3])
    {
      int64_t v4 = 210;
    }
    else if ([@"MemoryAverage-ScenePCA256-MultiModal-V1.0-PersonaVectorPCA256_DEPRECATED" isEqualToString:v3])
    {
      int64_t v4 = 211;
    }
    else if ([@"MemoryAverage-ScenePCA256-MultiModal-V1.0-PersonaVectorMultiModal-V1.0_DEPRECATED" isEqualToString:v3])
    {
      int64_t v4 = 212;
    }
    else if ([@"MemoryAverage-ScenePCA256-MultiModal-V1.0-PersonaVectorPCA256_DEPRECATED" isEqualToString:v3])
    {
      int64_t v4 = 213;
    }
    else if ([@"MemoryAverage-ScenePCA256-MultiModal-V1.0-PersonaVectorMultiModal-V1.0_DEPRECATED" isEqualToString:v3])
    {
      int64_t v4 = 214;
    }
    else if ([@"Asset-ScenePCA256-MultiModal-V2.0_DEPRECATED" isEqualToString:v3])
    {
      int64_t v4 = 25;
    }
    else if ([@"MomentAverage-ScenePCA256-MultiModal-V2.0_DEPRECATED" isEqualToString:v3])
    {
      int64_t v4 = 125;
    }
    else if ([@"MemoryAverage-ScenePCA256-MultiModal-V2.0_DEPRECATED" isEqualToString:v3])
    {
      int64_t v4 = 225;
    }
    else if ([@"MomentNode-MultiModalMusic-V1.0" isEqualToString:v3])
    {
      int64_t v4 = 226;
    }
    else if ([@"MomentNode-MultiModalMusic-V2.0" isEqualToString:v3])
    {
      int64_t v4 = 227;
    }
    else if ([@"sceneprint-clip-768" isEqualToString:v3])
    {
      int64_t v4 = 229;
    }
    else
    {
      int64_t v4 = 0;
    }
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

+ (id)nameForFingerprintVersion:(int64_t)a3
{
  id result = 0;
  if (!v4 & v3)
  {
    switch(a3)
    {
      case 1:
        id result = @"sceneprint-pca-256_DEPRECATED";
        break;
      case 2:
        id result = @"sceneprint-2048_DEPRECATED";
        break;
      case 3:
        id result = @"Asset-Scene2048-MultiModal-V1.0_DEPRECATED";
        break;
      case 4:
        id result = @"Asset-Scene2048-LibrarySpecific-MultiModal-V1.0_DEPRECATED";
        break;
      case 5:
        id result = @"Asset-ScenePCA256-MultiModal-V1.0_DEPRECATED";
        break;
      case 6:
        id result = @"Asset-ScenePCA256-LibrarySpecific-MultiModal-V1.0_DEPRECATED";
        break;
      case 7:
        id result = @"Asset-Scene2048-MultiModal-V1.0-PersonaVectorPCA256_DEPRECATED";
        break;
      case 8:
        id result = @"Asset-Scene2048-MultiModal-V1.0-PersonaVectorMultiModal-V1.0_DEPRECATED";
        break;
      case 9:
        id result = @"Asset-Scene2048-LibrarySpecific-MultiModal-V1.0-PersonaVectorPCA256_DEPRECATED";
        break;
      case 10:
        id result = @"Asset-Scene2048-LibrarySpecific-MultiModal-V1.0-PersonaVectorMultiModal-V1.0_DEPRECATED";
        break;
      case 11:
      case 16:
      case 17:
      case 18:
      case 19:
      case 20:
      case 21:
      case 22:
      case 23:
      case 24:
        return result;
      case 12:
        id result = @"Asset-ScenePCA256-MultiModal-V1.0-PersonaVectorPCA256_DEPRECATED";
        break;
      case 13:
        id result = @"Asset-ScenePCA256-MultiModal-V1.0-PersonaVectorMultiModal-V1.0_DEPRECATED";
        break;
      case 14:
        id result = @"Asset-ScenePCA256-LibrarySpecific-MultiModal-V1.0-PersonaVectorPCA256_DEPRECATED";
        break;
      case 15:
        id result = @"Asset-ScenePCA256-LibrarySpecific-MultiModal-V1.0-PersonaVectorMultiModal-V1.0_DEPRECATED";
        break;
      case 25:
        id result = @"Asset-ScenePCA256-MultiModal-V2.0_DEPRECATED";
        break;
      default:
        switch(a3)
        {
          case 'e':
            id result = @"moment-average-sceneprint-pca-256_DEPRECATED";
            break;
          case 'f':
            id result = @"moment-average-sceneprint-2048_DEPRECATED";
            break;
          case 'g':
            id result = @"MomentAverage-Scene2048-MultiModal-V1.0_DEPRECATED";
            break;
          case 'h':
            id result = @"MomentAverage-Scene2048-LibrarySpecific-MultiModal-V1.0_DEPRECATED";
            break;
          case 'i':
            id result = @"MomentAverage-ScenePCA256-MultiModal-V1.0_DEPRECATED";
            break;
          case 'j':
            id result = @"MomentAverage-ScenePCA256-LibrarySpecific-MultiModal-V1.0_DEPRECATED";
            break;
          case 'k':
            id result = @"MomentAverage-Scene2048-MultiModal-V1.0-PersonaVectorPCA256_DEPRECATED";
            break;
          case 'l':
            id result = @"MomentAverage-Scene2048-MultiModal-V1.0-PersonaVectorMultiModal-V1.0_DEPRECATED";
            break;
          case 'm':
            id result = @"MomentAverage-Scene2048-LibrarySpecific-MultiModal-V1.0-PersonaVectorPCA256_DEPRECATED";
            break;
          case 'n':
            id result = @"MomentAverage-Scene2048-LibrarySpecific-MultiModal-V1.0-PersonaVectorMultiModal-V1.0_DEPRECATED";
            break;
          case 'o':
            id result = @"MomentAverage-ScenePCA256-MultiModal-V1.0-PersonaVectorPCA256_DEPRECATED";
            break;
          case 'p':
            id result = @"MomentAverage-ScenePCA256-MultiModal-V1.0-PersonaVectorMultiModal-V1.0_DEPRECATED";
            break;
          case 'q':
            id result = @"MomentAverage-ScenePCA256-LibrarySpecific-MultiModal-V1.0-PersonaVectorPCA256_DEPRECATED";
            break;
          case 'r':
            id result = @"MomentAverage-ScenePCA256-LibrarySpecific-MultiModal-V1.0-PersonaVectorMultiModal-V1.0_DEPRECATED";
            break;
          case '}':
            id result = @"MomentAverage-ScenePCA256-MultiModal-V2.0_DEPRECATED";
            break;
          default:
            return result;
        }
        break;
    }
  }
  else
  {
    switch(a3)
    {
      case 201:
        id result = @"memory-average-sceneprint-pca-256_DEPRECATED";
        break;
      case 202:
        id result = @"memory-average-sceneprint-2048_DEPRECATED";
        break;
      case 203:
      case 204:
        id result = @"MemoryAverage-Scene2048-MultiModal-V1.0_DEPRECATED";
        break;
      case 205:
      case 206:
        id result = @"MemoryAverage-ScenePCA256-MultiModal-V1.0_DEPRECATED";
        break;
      case 207:
      case 209:
        id result = @"MemoryAverage-Scene2048-MultiModal-V1.0-PersonaVectorPCA256_DEPRECATED";
        break;
      case 208:
      case 210:
        id result = @"MemoryAverage-Scene2048-MultiModal-V1.0-PersonaVectorMultiModal-V1.0_DEPRECATED";
        break;
      case 211:
      case 213:
        id result = @"MemoryAverage-ScenePCA256-MultiModal-V1.0-PersonaVectorPCA256_DEPRECATED";
        break;
      case 212:
      case 214:
        id result = @"MemoryAverage-ScenePCA256-MultiModal-V1.0-PersonaVectorMultiModal-V1.0_DEPRECATED";
        break;
      case 215:
      case 216:
      case 217:
      case 218:
      case 219:
      case 220:
      case 221:
      case 222:
      case 223:
      case 224:
        return result;
      case 225:
        id result = @"MemoryAverage-ScenePCA256-MultiModal-V2.0_DEPRECATED";
        break;
      case 226:
        id result = @"MomentNode-MultiModalMusic-V1.0";
        break;
      case 227:
        id result = @"MomentNode-MultiModalMusic-V2.0";
        break;
      case 228:
        id result = @"MemoryNode-MultiModalMusic-V1.0";
        break;
      case 229:
        id result = @"sceneprint-clip-768";
        break;
      default:
        JUMPOUT(0);
    }
  }
  return result;
}

@end
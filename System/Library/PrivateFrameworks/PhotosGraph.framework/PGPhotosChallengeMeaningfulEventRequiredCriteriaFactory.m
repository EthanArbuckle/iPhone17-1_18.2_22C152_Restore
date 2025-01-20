@interface PGPhotosChallengeMeaningfulEventRequiredCriteriaFactory
+ (id)_amusementParkCriteriaArrayWithGraph:(id)a3 sceneTaxonomy:(id)a4;
+ (id)_anniversaryCriteriaWithGraph:(id)a3;
+ (id)_beachingCriteriaWithGraph:(id)a3 sceneTaxonomy:(id)a4;
+ (id)_beachingSceneNodesWithGraph:(id)a3;
+ (id)_celebrationCriteriaWithGraph:(id)a3;
+ (id)_climbingCriteriaWithGraph:(id)a3 sceneTaxonomy:(id)a4;
+ (id)_concertCriteriaArrayForInferenceType:(unint64_t)a3 graph:(id)a4;
+ (id)_concertCriteriaArrayForMeaningInferenceWithGraph:(id)a3;
+ (id)_concertCriteriaArrayForPublicEventInferenceWithGraph:(id)a3;
+ (id)_concertSceneNodesInGraph:(id)a3;
+ (id)_danceCriteriaWithGraph:(id)a3;
+ (id)_divingCriteriaWithGraph:(id)a3 sceneTaxonomy:(id)a4;
+ (id)_divingSceneNodesWithGraph:(id)a3;
+ (id)_entertainmentCriteriaWithGraph:(id)a3;
+ (id)_festivalCriteriaArrayWithGraph:(id)a3;
+ (id)_hikingCriteriaWithGraph:(id)a3 sceneTaxonomy:(id)a4;
+ (id)_hikingSceneNodesWithGraph:(id)a3;
+ (id)_museumCriteriaArrayForInferenceType:(unint64_t)a3 graph:(id)a4;
+ (id)_museumCriteriaArrayForMeaningInferenceWithGraph:(id)a3;
+ (id)_museumCriteriaArrayForPublicEventInferenceWithGraph:(id)a3;
+ (id)_museumSceneNodesInGraph:(id)a3;
+ (id)_museumSceneTraitInGraph:(id)a3 minimumNumberOfHighConfidenceAssets:(unint64_t)a4;
+ (id)_negativeHikingSceneNodesWithGraph:(id)a3;
+ (id)_negativeMuseumSceneNodesInGraph:(id)a3;
+ (id)_negativeSceneNodesForBeachingWithGraph:(id)a3;
+ (id)_nightOutCriteriaArrayWithGraph:(id)a3 sceneTaxonomy:(id)a4;
+ (id)_performanceCriteriaWithGraph:(id)a3;
+ (id)_publicEventCriteriaForCategoryWithName:(id)a3 inGraph:(id)a4;
+ (id)_requiredCriteriaForIdentifiers:(id)a3 inferenceType:(unint64_t)a4 graph:(id)a5 sceneTaxonomy:(id)a6 params:(id)a7;
+ (id)_restaurantCriteriaByCriteriaForIdentifiers:(id)a3 withGraph:(id)a4 sceneTaxonomy:(id)a5 params:(id)a6;
+ (id)_socialGroupGatheringCriteriaWithGraph:(id)a3;
+ (id)_specialAmusementParkCriteriaWithGraph:(id)a3;
+ (id)_sportEventCriteriaArrayForInferenceType:(unint64_t)a3 graph:(id)a4;
+ (id)_sportEventCriteriaArrayForMeaningInferenceWithGraph:(id)a3;
+ (id)_sportEventCriteriaArrayForPublicEventInferenceWithGraph:(id)a3;
+ (id)_sportEventScenesTraitWithGraph:(id)a3;
+ (id)_theaterCriteriaWithGraph:(id)a3;
+ (id)_weddingCriteriaWithGraph:(id)a3 sceneTaxonomy:(id)a4;
+ (id)_weddingSceneNodesWithGraph:(id)a3 includeWedding:(BOOL)a4 sceneTaxonomy:(id)a5;
+ (id)_winterSportCriteriaWithGraph:(id)a3 sceneTaxonomy:(id)a4;
+ (id)_winterSportSceneNodesWithGraph:(id)a3 sceneTaxonomy:(id)a4;
+ (id)requiredCriteriaForIdentifiers:(id)a3 inferenceType:(unint64_t)a4 graph:(id)a5 sceneTaxonomy:(id)a6 params:(id)a7;
+ (void)_birthdayCriteriaWithGraph:(id)a3 strongBirthdayCriteria:(id *)a4 weakBirthdayCriteria:(id *)a5 sceneTaxonomy:(id)a6;
@end

@implementation PGPhotosChallengeMeaningfulEventRequiredCriteriaFactory

+ (id)_publicEventCriteriaForCategoryWithName:(id)a3 inGraph:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = [v6 anyNodeForLabel:v5 domain:901];
  if (!v7)
  {
    v12 = 0;
    goto LABEL_19;
  }
  v8 = [MEMORY[0x1E4F76D68] artsAndMuseums];
  char v9 = [v5 isEqualToString:v8];

  double v10 = 0.4;
  if (v9)
  {
    v11 = kPGGraphNodeMeaningMuseum;
  }
  else
  {
    v13 = [MEMORY[0x1E4F76D68] dance];
    char v14 = [v5 isEqualToString:v13];

    if (v14)
    {
      v11 = kPGGraphNodeMeaningDance;
    }
    else
    {
      v15 = [MEMORY[0x1E4F76D68] festivalsAndFairs];
      char v16 = [v5 isEqualToString:v15];

      if (v16)
      {
        v11 = kPGGraphNodeMeaningFestival;
      }
      else
      {
        v17 = [MEMORY[0x1E4F76D68] musicConcerts];
        char v18 = [v5 isEqualToString:v17];

        if (v18)
        {
          v11 = kPGGraphNodeMeaningConcert;
        }
        else
        {
          v19 = [MEMORY[0x1E4F76D68] nightLife];
          char v20 = [v5 isEqualToString:v19];

          if (v20)
          {
            v11 = kPGGraphNodeMeaningNightOut;
            double v10 = 0.6;
          }
          else
          {
            v21 = [MEMORY[0x1E4F76D68] sports];
            char v22 = [v5 isEqualToString:v21];

            if (v22)
            {
              v11 = kPGGraphNodeMeaningSportEvent;
            }
            else
            {
              v23 = [MEMORY[0x1E4F76D68] theater];
              char v24 = [v5 isEqualToString:v23];

              if ((v24 & 1) == 0)
              {
                v30 = +[PGLogging sharedLogging];
                v25 = [v30 loggingConnection];

                if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
                {
                  int v31 = 138412290;
                  id v32 = v5;
                  _os_log_error_impl(&dword_1D1805000, v25, OS_LOG_TYPE_ERROR, "Not handling category with name %@", (uint8_t *)&v31, 0xCu);
                }
                v12 = 0;
                goto LABEL_18;
              }
              v11 = kPGGraphNodeMeaningTheater;
            }
          }
        }
      }
    }
  }
  v25 = *v11;
  v12 = [[PGMeaningfulEventRequiredCriteria alloc] initWithIdentifier:v25 minimumScore:v6 graph:v10];
  v26 = [PGMeaningfulEventCollectionTrait alloc];
  v27 = [v7 collection];
  v28 = [(PGMeaningfulEventCollectionTrait *)v26 initWithNodes:v27];

  [(PGMeaningfulEventTrait *)v28 setMinimumScore:1.0];
  [(PGMeaningfulEventCriteria *)v12 setPublicEventCategoriesTrait:v28];

LABEL_18:
LABEL_19:

  return v12;
}

+ (id)_negativeMuseumSceneNodesInGraph:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = a3;
  id v5 = objc_msgSend(v3, "setWithObjects:", @"food", 0);
  id v6 = [v4 sceneNodesForSceneNames:v5];

  return v6;
}

+ (id)_museumSceneNodesInGraph:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = a3;
  id v5 = objc_msgSend(v3, "setWithObjects:", @"illustrations", @"painting", @"museum", 0);
  id v6 = [v4 sceneNodesForSceneNames:v5];

  return v6;
}

+ (id)_museumSceneTraitInGraph:(id)a3 minimumNumberOfHighConfidenceAssets:(unint64_t)a4
{
  id v6 = a3;
  v7 = [a1 _museumSceneNodesInGraph:v6];
  uint64_t v8 = [v7 count];
  if (v8)
  {
    unint64_t v9 = v8;
    double v10 = [a1 _negativeMuseumSceneNodesInGraph:v6];
    v11 = [[PGMeaningfulEventSceneCollectionTrait alloc] initWithNodes:v7 negativeNodes:v10];
    [(PGMeaningfulEventTrait *)v11 setMinimumScore:1.0 / (double)v9];
    [(PGMeaningfulEventSceneCollectionTrait *)v11 setMinimumNumberOfHighConfidenceAssets:a4];
    unint64_t v12 = vcvtas_u32_f32((float)a4 * 0.5);
    if (v12 <= 1) {
      uint64_t v13 = 1;
    }
    else {
      uint64_t v13 = v12;
    }
    [(PGMeaningfulEventSceneCollectionTrait *)v11 setMinimumNumberOfNegativeHighConfidenceAssets:v13];
    [(PGMeaningfulEventSceneCollectionTrait *)v11 setAccumulateHighConfidenceAssetCounts:1];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)_concertSceneNodesInGraph:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = a3;
  id v5 = objc_msgSend(v3, "setWithObjects:", @"concert", @"singer", @"deejay", @"orchestra", @"musical_instrument", @"speakers_music", @"microphone", 0);
  id v6 = [v4 sceneNodesForSceneNames:v5];

  return v6;
}

+ (id)_weddingSceneNodesWithGraph:(id)a3 includeWedding:(BOOL)a4 sceneTaxonomy:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  uint64_t v8 = (void *)MEMORY[0x1E4F1CA80];
  id v9 = a3;
  double v10 = [v8 set];
  v11 = v10;
  if (v5) {
    [v10 addObject:@"wedding"];
  }
  unint64_t v12 = [v7 nodeForName:@"wedding"];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __116__PGPhotosChallengeMeaningfulEventRequiredCriteriaFactory__weddingSceneNodesWithGraph_includeWedding_sceneTaxonomy___block_invoke;
  v16[3] = &unk_1E68EE820;
  id v17 = v11;
  id v13 = v11;
  [v12 visitChildrenUsingNameBlock:v16];
  char v14 = [v9 sceneNodesForSceneNames:v13];

  return v14;
}

uint64_t __116__PGPhotosChallengeMeaningfulEventRequiredCriteriaFactory__weddingSceneNodesWithGraph_includeWedding_sceneTaxonomy___block_invoke(uint64_t a1, uint64_t a2)
{
  return 0;
}

+ (id)_negativeHikingSceneNodesWithGraph:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = a3;
  BOOL v5 = objc_msgSend(v3, "setWithObjects:", @"hiking", @"canyon", @"volcano", @"cliff", @"waterfall", 0);
  id v6 = [v4 sceneNodesForSceneNames:v5];

  return v6;
}

+ (id)_hikingSceneNodesWithGraph:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = a3;
  BOOL v5 = objc_msgSend(v3, "setWithObjects:", @"hiking", @"mountain", @"canyon", @"volcano", @"glacier", @"cliff", @"waterfall", @"forest", @"desert", @"hill", @"trail", 0);
  id v6 = [v4 sceneNodesForSceneNames:v5];

  return v6;
}

+ (id)_divingSceneNodesWithGraph:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = a3;
  BOOL v5 = objc_msgSend(v3, "setWithObjects:", @"diving", @"underwater", @"submarine_water", @"scuba", @"wetsuit", @"coral_reef", 0);
  id v6 = [v4 sceneNodesForSceneNames:v5];

  return v6;
}

+ (id)_negativeSceneNodesForBeachingWithGraph:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = a3;
  BOOL v5 = objc_msgSend(v3, "setWithObjects:", @"snow", @"blizzard", @"snowball", @"snowman", 0);
  id v6 = [v4 sceneNodesForSceneNames:v5];

  return v6;
}

+ (id)_beachingSceneNodesWithGraph:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = a3;
  BOOL v5 = objc_msgSend(v3, "setWithObjects:", @"beach", @"surfing", @"surfboard", @"mollusk", @"shore", @"folding_chair", @"jetski", @"windsurfing", @"barnacle", @"sand", @"skating", @"lighthouse", @"swimsuit", @"sandcastle", @"sunbathing", @"watersport", 0);
  id v6 = [v4 sceneNodesForSceneNames:v5];

  return v6;
}

+ (id)_winterSportSceneNodesWithGraph:(id)a3 sceneTaxonomy:(id)a4
{
  id v5 = a3;
  id v6 = [a4 nodeForName:@"winter_sport"];
  if (v6)
  {
    id v7 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithObjects:", @"winter_sport", @"ski_boot", @"snowshoe", @"ski_equipment", @"snowboard", @"snowmobile", 0);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __105__PGPhotosChallengeMeaningfulEventRequiredCriteriaFactory__winterSportSceneNodesWithGraph_sceneTaxonomy___block_invoke;
    v11[3] = &unk_1E68EE820;
    id v12 = v7;
    id v8 = v7;
    [v6 traverseChildrenUsingNameBlock:v11];
    id v9 = [v5 sceneNodesForSceneNames:v8];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

uint64_t __105__PGPhotosChallengeMeaningfulEventRequiredCriteriaFactory__winterSportSceneNodesWithGraph_sceneTaxonomy___block_invoke(uint64_t a1, uint64_t a2)
{
  return 0;
}

+ (id)_sportEventScenesTraitWithGraph:(id)a3
{
  id v3 = a3;
  objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"sumo", @"badminton", @"softball", @"soccer", @"cricket_sport", @"rugby", @"scoreboard", @"tennis", @"cheerleading", @"polo", @"hockey", @"football", @"grand_prix", @"jockey_horse", @"wrestling", @"baseball", @"motorsport",
    @"basketball",
    @"rink",
    @"arena",
    @"motocross",
    @"stadium",
    @"ballgames",
  id v4 = 0);
  id v5 = [v3 sceneNodesForSceneNames:v4];
  if ([v5 count])
  {
    id v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"amusement_park", @"graduation", 0);
    id v7 = [v3 sceneNodesForSceneNames:v6];

    id v8 = [[PGMeaningfulEventSceneCollectionTrait alloc] initWithNodes:v5 negativeNodes:v7];
    -[PGMeaningfulEventTrait setMinimumScore:](v8, "setMinimumScore:", 1.0 / (double)(unint64_t)[v5 count]);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (id)_socialGroupGatheringCriteriaWithGraph:(id)a3
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v36 = a3;
  id v3 = [v36 meNode];
  id v32 = v3;
  if (v3)
  {
    id v4 = objc_msgSend(v3, "localIdentifier", v3);
    if ([v4 length]) {
      uint64_t v5 = 2;
    }
    else {
      uint64_t v5 = 3;
    }
  }
  else
  {
    uint64_t v5 = 3;
  }
  id v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", v32);
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __98__PGPhotosChallengeMeaningfulEventRequiredCriteriaFactory__socialGroupGatheringCriteriaWithGraph___block_invoke;
  v54[3] = &unk_1E68E7468;
  uint64_t v56 = v5;
  id v34 = v6;
  id v55 = v34;
  [v36 enumerateNodesWithLabel:@"SocialGroup" domain:302 usingBlock:v54];
  unint64_t v7 = [v34 count];
  if (v7 >= 2)
  {
    uint64_t v50 = 0;
    v51 = (double *)&v50;
    uint64_t v52 = 0x2020000000;
    uint64_t v53 = 0;
    if (v7 > 3)
    {
      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __98__PGPhotosChallengeMeaningfulEventRequiredCriteriaFactory__socialGroupGatheringCriteriaWithGraph___block_invoke_3;
      v45[3] = &unk_1E68E74B0;
      v45[4] = &v50;
      v15 = v34;
      [MEMORY[0x1E4F76C60] calculateStandardDeviationForItems:v34 valueBlock:&__block_literal_global_550 result:v45];
    }
    else
    {
      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      id v9 = v34;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v46 objects:v59 count:16];
      if (v10)
      {
        unint64_t v11 = 0;
        uint64_t v12 = *(void *)v47;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v47 != v12) {
              objc_enumerationMutation(v9);
            }
            v11 += [*(id *)(*((void *)&v46 + 1) + 8 * i) numberOfMomentNodes];
          }
          uint64_t v10 = [v9 countByEnumeratingWithState:&v46 objects:v59 count:16];
        }
        while (v10);
        double v14 = (double)v11 * 0.65;
      }
      else
      {
        double v14 = 0.0;
      }

      v51[3] = ceil(v14);
      v15 = v34;
    }
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    char v16 = (void *)[v15 copy];
    uint64_t v17 = [v16 countByEnumeratingWithState:&v41 objects:v58 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v42;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v42 != v18) {
            objc_enumerationMutation(v16);
          }
          char v20 = *(void **)(*((void *)&v41 + 1) + 8 * j);
          double v21 = (double)(unint64_t)[v20 numberOfMomentNodes];
          if (v51[3] <= v21) {
            [v34 removeObject:v20];
          }
        }
        uint64_t v17 = [v16 countByEnumeratingWithState:&v41 objects:v58 count:16];
      }
      while (v17);
    }

    _Block_object_dispose(&v50, 8);
    id v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v34, "count"));
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    obuint64_t j = v34;
    uint64_t v22 = [obj countByEnumeratingWithState:&v37 objects:v57 count:16];
    if (v22)
    {
      uint64_t v23 = *(void *)v38;
      do
      {
        for (uint64_t k = 0; k != v22; ++k)
        {
          if (*(void *)v38 != v23) {
            objc_enumerationMutation(obj);
          }
          v25 = *(void **)(*((void *)&v37 + 1) + 8 * k);
          v26 = [[PGMeaningfulEventRequiredCriteria alloc] initWithIdentifier:@"Gathering" minimumScore:v36 graph:0.01];
          v27 = [PGMeaningfulEventCollectionTrait alloc];
          v28 = [v25 collection];
          v29 = [(PGMeaningfulEventCollectionTrait *)v27 initWithNodes:v28];
          [(PGMeaningfulEventCriteria *)v26 setSocialGroupsTrait:v29];

          v30 = [(PGMeaningfulEventCriteria *)v26 socialGroupsTrait];
          [v30 setMinimumScore:1.0];

          [(PGMeaningfulEventRequiredCriteria *)v26 setMustBeInteresting:1];
          [v8 addObject:v26];
        }
        uint64_t v22 = [obj countByEnumeratingWithState:&v37 objects:v57 count:16];
      }
      while (v22);
    }
  }
  else
  {
    id v8 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v8;
}

void __98__PGPhotosChallengeMeaningfulEventRequiredCriteriaFactory__socialGroupGatheringCriteriaWithGraph___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((unint64_t)[v3 numberOfMemberNodes] >= *(void *)(a1 + 40)) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

double __98__PGPhotosChallengeMeaningfulEventRequiredCriteriaFactory__socialGroupGatheringCriteriaWithGraph___block_invoke_3(uint64_t a1, double a2, double a3)
{
  double result = a2 + a3;
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

double __98__PGPhotosChallengeMeaningfulEventRequiredCriteriaFactory__socialGroupGatheringCriteriaWithGraph___block_invoke_2(uint64_t a1, void *a2)
{
  return (double)(unint64_t)[a2 numberOfMomentNodes];
}

+ (id)_specialAmusementParkCriteriaWithGraph:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v10[0] = @"AmusementPark";
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  uint64_t v5 = +[PGGraphPOINodeCollection poiNodesForLabels:v4 inGraph:v3];

  if ([v5 count])
  {
    id v6 = [[PGMeaningfulEventRequiredCriteria alloc] initWithIdentifier:@"AmusementPark" minimumScore:v3 graph:0.4];
    unint64_t v7 = [[PGMeaningfulEventCollectionTrait alloc] initWithNodes:v5];
    [(PGMeaningfulEventTrait *)v7 setMinimumScore:0.7];
    [(PGMeaningfulEventCollectionTrait *)v7 setAdditionalMatchingBlock:&__block_literal_global_543];
    [(PGMeaningfulEventCriteria *)v6 setPoisTrait:v7];
    id v8 = +[PGMeaningfulEventRequiredCriteriaFactory locationsTraitNotMatchingPeopleHomeWorkLocationsForGraph:v3];
    [(PGMeaningfulEventCriteria *)v6 setLocationsTrait:v8];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

BOOL __98__PGPhotosChallengeMeaningfulEventRequiredCriteriaFactory__specialAmusementParkCriteriaWithGraph___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  uint64_t v5 = [a3 collection];
  id v6 = +[PGGraphPOIEdge filterSpecial];
  unint64_t v7 = +[MAEdgeCollection edgesFromNodes:v5 toNodes:v4 matchingFilter:v6];

  BOOL v8 = [v7 count] != 0;
  return v8;
}

+ (id)_amusementParkCriteriaArrayWithGraph:(id)a3 sceneTaxonomy:(id)a4
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  unint64_t v7 = (void *)MEMORY[0x1E4F1CA48];
  id v8 = a4;
  id v9 = [v7 array];
  uint64_t v10 = [a1 _specialAmusementParkCriteriaWithGraph:v6];
  if (v10) {
    [v9 addObject:v10];
  }
  unint64_t v11 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v12 = [v8 nodeForName:@"amusement_park"];

  if (v12)
  {
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __110__PGPhotosChallengeMeaningfulEventRequiredCriteriaFactory__amusementParkCriteriaArrayWithGraph_sceneTaxonomy___block_invoke;
    v25[3] = &unk_1E68EE820;
    id v26 = v11;
    [v12 traverseChildrenUsingNameBlock:v25];
  }
  id v13 = [v6 sceneNodesForSceneNames:v11];
  v27[0] = @"AmusementPark";
  double v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
  v15 = +[PGGraphPOINodeCollection poiNodesForLabels:v14 inGraph:v6];

  if ([v13 count] && objc_msgSend(v15, "count"))
  {
    char v16 = [[PGMeaningfulEventRequiredCriteria alloc] initWithIdentifier:@"AmusementPark" minimumScore:v6 graph:0.4];
    char v24 = [[PGMeaningfulEventSceneCollectionTrait alloc] initWithNodes:v13];
    -[PGMeaningfulEventTrait setMinimumScore:](v24, "setMinimumScore:", 1.0 / (double)(unint64_t)[v13 count]);
    [(PGMeaningfulEventCriteria *)v16 setScenesTrait:v24];
    uint64_t v17 = [[PGMeaningfulEventCollectionTrait alloc] initWithNodes:v15];
    [(PGMeaningfulEventTrait *)v17 setMinimumScore:0.7];
    [(PGMeaningfulEventCriteria *)v16 setPoisTrait:v17];
    +[PGMeaningfulEventRequiredCriteriaFactory locationsTraitNotMatchingPeopleHomeWorkLocationsForGraph:v6];
    uint64_t v18 = v12;
    v19 = v11;
    char v20 = v10;
    uint64_t v22 = v21 = v9;
    [(PGMeaningfulEventCriteria *)v16 setLocationsTrait:v22];
    [v21 addObject:v16];

    id v9 = v21;
    uint64_t v10 = v20;
    unint64_t v11 = v19;
    uint64_t v12 = v18;
  }
  return v9;
}

uint64_t __110__PGPhotosChallengeMeaningfulEventRequiredCriteriaFactory__amusementParkCriteriaArrayWithGraph_sceneTaxonomy___block_invoke(uint64_t a1, uint64_t a2)
{
  return 0;
}

+ (id)_entertainmentCriteriaWithGraph:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"zoo", @"aquarium", @"underwater", 0);
  uint64_t v5 = [v3 sceneNodesForSceneNames:v4];
  v13[0] = @"Entertainment";
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  unint64_t v7 = +[PGGraphPOINodeCollection poiNodesForLabels:v6 inGraph:v3];

  if ([v5 count] && objc_msgSend(v7, "count"))
  {
    id v8 = [[PGMeaningfulEventRequiredCriteria alloc] initWithIdentifier:@"Entertainment" minimumScore:v3 graph:0.4];
    id v9 = [[PGMeaningfulEventSceneCollectionTrait alloc] initWithNodes:v5];
    -[PGMeaningfulEventTrait setMinimumScore:](v9, "setMinimumScore:", 1.0 / (double)(unint64_t)[v5 count]);
    [(PGMeaningfulEventCriteria *)v8 setScenesTrait:v9];
    uint64_t v10 = [[PGMeaningfulEventCollectionTrait alloc] initWithNodes:v7];
    [(PGMeaningfulEventTrait *)v10 setMinimumScore:0.7];
    [(PGMeaningfulEventCriteria *)v8 setPoisTrait:v10];
    unint64_t v11 = +[PGMeaningfulEventRequiredCriteriaFactory locationsTraitNotMatchingPeopleHomeWorkLocationsForGraph:v3];
    [(PGMeaningfulEventCriteria *)v8 setLocationsTrait:v11];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (id)_beachingCriteriaWithGraph:(id)a3 sceneTaxonomy:(id)a4
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [a1 _beachingSceneNodesWithGraph:v6];
  v21[0] = @"Beach";
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
  uint64_t v10 = +[PGGraphROINodeCollection roiNodesForLabels:v9 inGraph:v6];

  if ([v8 count] && objc_msgSend(v10, "count"))
  {
    unint64_t v11 = [a1 _winterSportSceneNodesWithGraph:v6 sceneTaxonomy:v7];
    uint64_t v12 = [a1 _negativeHikingSceneNodesWithGraph:v6];
    id v13 = [v11 collectionByFormingUnionWith:v12];

    double v14 = [a1 _negativeSceneNodesForBeachingWithGraph:v6];
    v15 = [v13 collectionByFormingUnionWith:v14];

    char v16 = [[PGMeaningfulEventRequiredCriteria alloc] initWithIdentifier:@"Beaching" minimumScore:v6 graph:0.4];
    uint64_t v17 = [[PGMeaningfulEventSceneCollectionTrait alloc] initWithNodes:v8 negativeNodes:v15];
    -[PGMeaningfulEventTrait setMinimumScore:](v17, "setMinimumScore:", 1.0 / (double)(unint64_t)[v8 count]);
    [(PGMeaningfulEventSceneCollectionTrait *)v17 setMinimumNumberOfHighConfidenceAssets:2];
    [(PGMeaningfulEventSceneCollectionTrait *)v17 setMinimumNumberOfNegativeHighConfidenceAssets:4];
    [(PGMeaningfulEventCriteria *)v16 setScenesTrait:v17];
    uint64_t v18 = [[PGMeaningfulEventCollectionTrait alloc] initWithNodes:v10];
    [(PGMeaningfulEventTrait *)v18 setMinimumScore:1.0];
    [(PGMeaningfulEventCriteria *)v16 setRoisTrait:v18];
    v19 = +[PGMeaningfulEventRequiredCriteriaFactory locationsTraitNotMatchingFrequentLocationsForGraph:v6];
    [(PGMeaningfulEventCriteria *)v16 setLocationsTrait:v19];
    [(PGMeaningfulEventRequiredCriteria *)v16 setMustBeInteresting:1];
  }
  else
  {
    char v16 = 0;
  }

  return v16;
}

+ (id)_climbingCriteriaWithGraph:(id)a3 sceneTaxonomy:(id)a4
{
  v21[4] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F1CAD0] setWithObject:@"rock_climbing"];
  id v9 = [v6 sceneNodesForSceneNames:v8];

  v21[0] = @"Mountain";
  v21[1] = @"Nature";
  void v21[2] = @"Beach";
  v21[3] = @"Water";
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:4];
  unint64_t v11 = +[PGGraphROINodeCollection roiNodesForLabels:v10 inGraph:v6];

  if ([v9 count] && objc_msgSend(v11, "count"))
  {
    uint64_t v12 = [[PGMeaningfulEventRequiredCriteria alloc] initWithIdentifier:@"Climbing" minimumScore:v6 graph:0.4];
    id v13 = [[PGMeaningfulEventCollectionTrait alloc] initWithNodes:v11];
    [(PGMeaningfulEventTrait *)v13 setMinimumScore:0.25];
    [(PGMeaningfulEventCriteria *)v12 setRoisTrait:v13];
    char v20 = +[PGMeaningfulEventRequiredCriteriaFactory locationsTraitNotMatchingFrequentLocationsForGraph:v6];
    [(PGMeaningfulEventCriteria *)v12 setLocationsTrait:v20];
    double v14 = [[PGMeaningfulEventNumberTrait alloc] initWithNumberValue:1.0];
    [(PGMeaningfulEventTrait *)v14 setMinimumScore:1.0];
    [(PGMeaningfulEventCriteria *)v12 setNumberOfPeopleTrait:v14];
    v15 = [a1 _winterSportSceneNodesWithGraph:v6 sceneTaxonomy:v7];
    char v16 = [a1 _divingSceneNodesWithGraph:v6];
    uint64_t v17 = [v15 collectionByFormingUnionWith:v16];

    uint64_t v18 = [[PGMeaningfulEventSceneCollectionTrait alloc] initWithNodes:v9 negativeNodes:v17];
    [(PGMeaningfulEventSceneCollectionTrait *)v18 setMinimumNumberOfHighConfidenceAssets:4];
    [(PGMeaningfulEventTrait *)v18 setMinimumScore:1.0];
    [(PGMeaningfulEventSceneCollectionTrait *)v18 setMinimumRatioOfHighConfidenceAssets:0.5];
    [(PGMeaningfulEventCriteria *)v12 setScenesTrait:v18];
    [(PGMeaningfulEventRequiredCriteria *)v12 setMustBeInteresting:1];
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

+ (id)_hikingCriteriaWithGraph:(id)a3 sceneTaxonomy:(id)a4
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [a1 _hikingSceneNodesWithGraph:v6];
  v35[0] = @"Hiking";
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:1];
  uint64_t v10 = +[PGGraphPOINodeCollection poiNodesForLabels:v9 inGraph:v6];

  v34[0] = @"Mountain";
  v34[1] = @"Nature";
  unint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:2];
  uint64_t v12 = +[PGGraphROINodeCollection roiNodesForLabels:v11 inGraph:v6];

  if ([v8 count] && (objc_msgSend(v10, "count") || objc_msgSend(v12, "count")))
  {
    v29 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"gown", @"suit", @"necktie", @"vineyard", @"cycling", @"bicycle", @"golf", @"skydiving", @"sport", 0);
    id v13 = [v6 sceneNodesForSceneNames:v29];
    double v14 = [a1 _winterSportSceneNodesWithGraph:v6 sceneTaxonomy:v7];
    [v13 collectionByFormingUnionWith:v14];
    v15 = id v32 = v10;

    char v16 = [a1 _beachingSceneNodesWithGraph:v6];
    uint64_t v17 = [v15 collectionByFormingUnionWith:v16];

    uint64_t v18 = [a1 _divingSceneNodesWithGraph:v6];
    v28 = [v17 collectionByFormingUnionWith:v18];

    id v31 = v7;
    v19 = [[PGMeaningfulEventRequiredCriteria alloc] initWithIdentifier:@"Hiking" minimumScore:v6 graph:0.4];
    char v20 = [[PGMeaningfulEventSceneCollectionTrait alloc] initWithNodes:v8 negativeNodes:v28];
    -[PGMeaningfulEventTrait setMinimumScore:](v20, "setMinimumScore:", 1.0 / (double)(unint64_t)[v8 count]);
    [(PGMeaningfulEventCriteria *)v19 setScenesTrait:v20];
    v30 = v12;
    double v21 = [[PGMeaningfulEventCollectionTrait alloc] initWithNodes:v12];
    [(PGMeaningfulEventTrait *)v21 setMinimumScore:0.5];
    [(PGMeaningfulEventCriteria *)v19 setRoisTrait:v21];
    uint64_t v22 = [[PGMeaningfulEventLocationMobilityTrait alloc] initWithMobility:1];
    [(PGMeaningfulEventTrait *)v22 setMinimumScore:0.9];
    [(PGMeaningfulEventCriteria *)v19 setLocationMobilityTrait:v22];
    uint64_t v23 = +[PGMeaningfulEventRequiredCriteriaFactory locationsTraitNotMatchingFrequentLocationsForGraph:v6];
    [(PGMeaningfulEventCriteria *)v19 setLocationsTrait:v23];
    [(PGMeaningfulEventRequiredCriteria *)v19 setMustBeInteresting:1];
    char v24 = [[PGMeaningfulEventRequiredCriteria alloc] initWithIdentifier:@"Hiking" minimumScore:v6 graph:0.4];
    -[PGMeaningfulEventTrait setMinimumScore:](v20, "setMinimumScore:", 1.0 / (double)(unint64_t)[v8 count]);
    [(PGMeaningfulEventCriteria *)v24 setScenesTrait:v20];
    v25 = [[PGMeaningfulEventCollectionTrait alloc] initWithNodes:v32];
    [(PGMeaningfulEventTrait *)v25 setMinimumScore:0.5];
    [(PGMeaningfulEventCriteria *)v24 setPoisTrait:v25];
    [(PGMeaningfulEventTrait *)v22 setMinimumScore:0.9];
    [(PGMeaningfulEventCriteria *)v24 setLocationMobilityTrait:v22];
    [(PGMeaningfulEventCriteria *)v24 setLocationsTrait:v23];
    [(PGMeaningfulEventRequiredCriteria *)v24 setMustBeInteresting:1];
    v33[0] = v19;
    v33[1] = v24;
    id v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:2];

    id v7 = v31;
    uint64_t v10 = v32;

    uint64_t v12 = v30;
  }
  else
  {
    id v26 = 0;
  }

  return v26;
}

+ (id)_restaurantCriteriaByCriteriaForIdentifiers:(id)a3 withGraph:(id)a4 sceneTaxonomy:(id)a5 params:(id)a6
{
  v152[2] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  uint64_t v12 = [a5 nodeForName:@"tableware"];
  uint64_t v13 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithObjects:", @"restaurant", @"food", 0);
  double v14 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithObjects:", @"wine_bottle", @"wine", 0);
  v133[0] = MEMORY[0x1E4F143A8];
  v133[1] = 3221225472;
  v133[2] = __134__PGPhotosChallengeMeaningfulEventRequiredCriteriaFactory__restaurantCriteriaByCriteriaForIdentifiers_withGraph_sceneTaxonomy_params___block_invoke;
  v133[3] = &unk_1E68EE820;
  id v15 = v14;
  id v134 = v15;
  v108 = v12;
  [v12 traverseChildrenUsingNameBlock:v133];
  v107 = (void *)v13;
  char v16 = [v10 sceneNodesForSceneNames:v13];
  [v10 sceneNodesForSceneNames:v15];
  v106 = v121 = v16;
  uint64_t v17 = objc_msgSend(v16, "collectionByFormingUnionWith:");
  v105 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"aquarium", @"underwater", 0);
  v112 = objc_msgSend(v10, "sceneNodesForSceneNames:");
  v152[0] = @"Nightlife";
  v152[1] = @"Restaurant";
  uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v152 count:2];
  v19 = +[PGGraphPOINodeCollection poiNodesForLabels:v18 inGraph:v10];

  v151 = @"Museum";
  char v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v151 count:1];
  v118 = v10;
  v109 = +[PGGraphPOINodeCollection poiNodesForLabels:v20 inGraph:v10];

  v117 = v17;
  if (![v17 count] || !objc_msgSend(v19, "count"))
  {
    id v113 = (id)MEMORY[0x1E4F1CC08];
    long long v41 = (void *)v13;
    long long v40 = v108;
    goto LABEL_58;
  }
  v111 = v19;
  id v103 = v15;
  id v116 = v9;
  v110 = +[PGMeaningfulEventRequiredCriteriaFactory locationsTraitNotMatchingPeopleHomeWorkLocationsForGraph:v10];
  id v127 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v148[0] = @"label";
  v148[1] = @"significantPartsOfDay";
  v149[0] = @"Lunch";
  v149[1] = &unk_1F28D1578;
  v148[2] = @"forbiddenPartOfDay";
  v148[3] = @"minimumNumberOfHighConfidenceScenes";
  v149[2] = &unk_1F28D1590;
  v149[3] = &unk_1F28D1530;
  uint64_t v21 = MEMORY[0x1E4F1CC38];
  v148[4] = @"usePOIs";
  v148[5] = @"useNegativePOIs";
  v149[4] = MEMORY[0x1E4F1CC38];
  v149[5] = MEMORY[0x1E4F1CC38];
  v125 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v149 forKeys:v148 count:6];
  v150[0] = v125;
  v146[0] = @"label";
  v146[1] = @"significantPartsOfDay";
  v147[0] = @"Lunch";
  v147[1] = &unk_1F28D1578;
  v146[2] = @"forbiddenPartOfDay";
  v146[3] = @"minimumNumberOfHighConfidenceScenes";
  v147[2] = &unk_1F28D1590;
  v147[3] = &unk_1F28D15A8;
  v146[4] = @"usePOIs";
  v146[5] = @"useNegativePOIs";
  v147[4] = v21;
  v147[5] = MEMORY[0x1E4F1CC28];
  v123 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v147 forKeys:v146 count:6];
  id v115 = v11;
  v150[1] = v123;
  v144[0] = @"label";
  v144[1] = @"forbiddenPartOfDay";
  v145[0] = @"Breakfast";
  v145[1] = &unk_1F28D15C0;
  v144[2] = @"significantPartsOfDay";
  v144[3] = @"minimumNumberOfHighConfidenceScenes";
  v145[2] = &unk_1F28D15D8;
  v145[3] = &unk_1F28D1530;
  v144[4] = @"usePOIs";
  v144[5] = @"useNegativePOIs";
  v145[4] = v21;
  v145[5] = v21;
  uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v145 forKeys:v144 count:6];
  v150[2] = v22;
  v142[0] = @"label";
  v142[1] = @"forbiddenPartOfDay";
  v143[0] = @"Breakfast";
  v143[1] = &unk_1F28D15C0;
  v142[2] = @"significantPartsOfDay";
  v142[3] = @"minimumNumberOfHighConfidenceScenes";
  v143[2] = &unk_1F28D15D8;
  uint64_t v23 = v21;
  v143[3] = &unk_1F28D15A8;
  v142[4] = @"usePOIs";
  v142[5] = @"useNegativePOIs";
  v143[4] = v21;
  v143[5] = MEMORY[0x1E4F1CC28];
  char v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v143 forKeys:v142 count:6];
  v150[3] = v24;
  v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v150 count:4];
  uint64_t v26 = [v127 initWithArray:v25];

  v27 = [v11 objectForKeyedSubscript:@"DinnerKeyMinimumDurationCriterion1"];
  [v27 doubleValue];
  double v29 = v28;

  v30 = [v11 objectForKeyedSubscript:@"DinnerKeyMinimumNumberOfHighConfidenceScenesCriterion1"];
  uint64_t v31 = [v30 intValue];

  v140[0] = @"label";
  v140[1] = @"significantPartsOfDay";
  v141[0] = @"Dinner";
  v141[1] = &unk_1F28D1590;
  v140[2] = @"forbiddenPartOfDay";
  v140[3] = @"allPartsOfDay";
  v141[2] = &unk_1F28D15F0;
  v141[3] = &unk_1F28D1608;
  v140[4] = @"minimumDuration";
  id v32 = [NSNumber numberWithDouble:v29 * 60.0];
  v141[4] = v32;
  v140[5] = @"minimumNumberOfHighConfidenceScenes";
  uint64_t v33 = [NSNumber numberWithInt:v31];
  v141[5] = v33;
  v141[6] = v23;
  v140[6] = @"usePOIs";
  v140[7] = @"useNegativePOIs";
  v141[7] = MEMORY[0x1E4F1CC28];
  uint64_t v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v141 forKeys:v140 count:8];

  v35 = [v11 objectForKeyedSubscript:@"DinnerKeyMinimumDurationCriterion2"];

  if (v35)
  {
    id v36 = [v11 objectForKeyedSubscript:@"DinnerKeyMinimumDurationCriterion2"];
    [v36 doubleValue];
    double v38 = v37;

    double v39 = v38 * 60.0;
  }
  else
  {
    double v39 = INFINITY;
  }
  long long v42 = [v11 objectForKeyedSubscript:@"DinnerKeyMinimumNumberOfHighConfidenceScenesCriterion2"];

  long long v43 = (void *)v26;
  if (v42)
  {
    long long v44 = [v11 objectForKeyedSubscript:@"DinnerKeyMinimumNumberOfHighConfidenceScenesCriterion2"];
    uint64_t v45 = [v44 intValue];
  }
  else
  {
    uint64_t v45 = 0x7FFFFFFFLL;
  }
  v138[0] = @"label";
  v138[1] = @"significantPartsOfDay";
  v139[0] = @"Dinner";
  v139[1] = &unk_1F28D1590;
  v138[2] = @"forbiddenPartOfDay";
  v138[3] = @"allPartsOfDay";
  v139[2] = &unk_1F28D15F0;
  v139[3] = &unk_1F28D1608;
  v138[4] = @"minimumDuration";
  long long v46 = [NSNumber numberWithDouble:v39];
  v139[4] = v46;
  v138[5] = @"minimumNumberOfHighConfidenceScenes";
  long long v47 = [NSNumber numberWithInt:v45];
  v139[5] = v47;
  v139[6] = MEMORY[0x1E4F1CC38];
  v138[6] = @"usePOIs";
  v138[7] = @"useNegativePOIs";
  v139[7] = MEMORY[0x1E4F1CC28];
  uint64_t v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v139 forKeys:v138 count:8];

  long long v49 = [v11 objectForKeyedSubscript:@"DinnerKeyMinimumDurationCriterion3"];

  if (v49)
  {
    uint64_t v50 = [v11 objectForKeyedSubscript:@"DinnerKeyMinimumDurationCriterion3"];
    [v50 doubleValue];
    double v52 = v51;

    double v53 = v52 * 60.0;
  }
  else
  {
    double v53 = INFINITY;
  }
  v54 = [v11 objectForKeyedSubscript:@"DinnerKeyMinimumNumberOfHighConfidenceScenesCriterion3"];

  if (v54)
  {
    id v55 = [v11 objectForKeyedSubscript:@"DinnerKeyMinimumNumberOfHighConfidenceScenesCriterion3"];
    uint64_t v56 = [v55 intValue];
  }
  else
  {
    uint64_t v56 = 0x7FFFFFFFLL;
  }
  v136[0] = @"label";
  v136[1] = @"significantPartsOfDay";
  v137[0] = @"Dinner";
  v137[1] = &unk_1F28D1590;
  v136[2] = @"forbiddenPartOfDay";
  v136[3] = @"allPartsOfDay";
  v137[2] = &unk_1F28D15F0;
  v137[3] = &unk_1F28D1608;
  v136[4] = @"minimumDuration";
  v57 = [NSNumber numberWithDouble:v53];
  v137[4] = v57;
  v136[5] = @"minimumNumberOfHighConfidenceScenes";
  v58 = [NSNumber numberWithInt:v56];
  v137[5] = v58;
  v137[6] = MEMORY[0x1E4F1CC28];
  v136[6] = @"usePOIs";
  v136[7] = @"useNegativePOIs";
  v137[7] = MEMORY[0x1E4F1CC28];
  uint64_t v59 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v137 forKeys:v136 count:8];

  uint64_t v60 = [v11 objectForKeyedSubscript:@"DinnerCriteriaDefinitions"];
  v102 = (void *)v34;
  v104 = (void *)v59;
  if ([v60 isEqualToString:@"ThreeCriteria"])
  {
    [v43 addObject:v34];
    uint64_t v61 = v48;
    v62 = (void *)v59;
    id v9 = v116;
  }
  else
  {
    char v63 = [v60 isEqualToString:@"TwoCriteria"];
    uint64_t v61 = v34;
    v62 = (void *)v48;
    id v9 = v116;
    if ((v63 & 1) == 0)
    {
      v62 = (void *)v34;
      if (([v60 isEqualToString:@"Criterion1"] & 1) == 0)
      {
        v62 = (void *)v48;
        if (([v60 isEqualToString:@"Criterion2"] & 1) == 0)
        {
          v62 = v104;
          if (([v60 isEqualToString:@"Criterion3"] & 1) == 0) {
            goto LABEL_21;
          }
        }
      }
      goto LABEL_20;
    }
  }
  [v43 addObject:v61];
LABEL_20:
  [v43 addObject:v62];
LABEL_21:
  v100 = v60;
  v101 = (void *)v48;
  objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
  id v113 = (id)objc_claimAutoreleasedReturnValue();
  long long v129 = 0u;
  long long v130 = 0u;
  long long v131 = 0u;
  long long v132 = 0u;
  obuint64_t j = v43;
  uint64_t v64 = [obj countByEnumeratingWithState:&v129 objects:v135 count:16];
  if (v64)
  {
    uint64_t v65 = v64;
    uint64_t v66 = *(void *)v130;
    uint64_t v114 = *(void *)v130;
    do
    {
      uint64_t v67 = 0;
      uint64_t v119 = v65;
      do
      {
        if (*(void *)v130 != v66) {
          objc_enumerationMutation(obj);
        }
        v68 = *(void **)(*((void *)&v129 + 1) + 8 * v67);
        v69 = [v68 objectForKeyedSubscript:@"label"];
        if ([v9 containsObject:v69])
        {
          v128 = [v68 objectForKeyedSubscript:@"significantPartsOfDay"];
          v126 = [v68 objectForKeyedSubscript:@"forbiddenPartOfDay"];
          v124 = [v68 objectForKeyedSubscript:@"allPartsOfDay"];
          v122 = [v68 objectForKeyedSubscript:@"minimumDuration"];
          v70 = [v68 objectForKeyedSubscript:@"minimumNumberOfHighConfidenceScenes"];
          unint64_t v71 = [v70 unsignedIntegerValue];

          if (v71 <= 1) {
            uint64_t v72 = 1;
          }
          else {
            uint64_t v72 = v71;
          }
          v73 = [v68 objectForKeyedSubscript:@"usePOIs"];
          int v74 = [v73 BOOLValue];

          v75 = [v68 objectForKeyedSubscript:@"useNegativePOIs"];
          char v76 = [v75 BOOLValue];

          v77 = [[PGMeaningfulEventRequiredCriteria alloc] initWithIdentifier:v69 minimumScore:v118 graph:0.6];
          v78 = v121;
          if (!v74) {
            v78 = v117;
          }
          id v79 = v78;
          [v11 objectForKeyedSubscript:@"DinnerSceneNodesCritererion3"];
          v81 = v80 = v11;

          if (v81)
          {
            v82 = [v80 objectForKeyedSubscript:@"DinnerSceneNodesCritererion3"];
            if ([v82 isEqualToString:@"POISceneNodes"])
            {
              id v83 = v121;

              id v79 = v83;
            }
            v84 = v122;
          }
          else
          {
            v84 = v122;
          }
          uint64_t v85 = [v79 count];
          if (v85)
          {
            unint64_t v86 = v85;
            if (v74)
            {
              v87 = [PGMeaningfulEventCollectionTrait alloc];
              if (v76) {
                v88 = [(PGMeaningfulEventCollectionTrait *)v87 initWithNodes:v111 negativeNodes:v109];
              }
              else {
                v88 = [(PGMeaningfulEventCollectionTrait *)v87 initWithNodes:v111];
              }
              v90 = v88;
              [(PGMeaningfulEventTrait *)v88 setMinimumScore:0.7];
              [(PGMeaningfulEventCriteria *)v77 setPoisTrait:v90];
              double v89 = 1.0 / (double)v86;
            }
            else
            {
              [(PGMeaningfulEventCriteria *)v77 setLocationsTrait:v110];
              double v89 = 2.0 / (double)v86;
              [(PGMeaningfulEventRequiredCriteria *)v77 setMustBeInteresting:1];
            }
            v91 = [[PGMeaningfulEventSceneCollectionTrait alloc] initWithNodes:v79 negativeNodes:v112];
            [(PGMeaningfulEventTrait *)v91 setMinimumScore:v89];
            [(PGMeaningfulEventSceneCollectionTrait *)v91 setMinimumNumberOfHighConfidenceAssets:v72];
            [(PGMeaningfulEventSceneCollectionTrait *)v91 setAccumulateHighConfidenceAssetCounts:1];
            [(PGMeaningfulEventCriteria *)v77 setScenesTrait:v91];
            uint64_t v92 = [v128 unsignedIntegerValue];
            if (v126) {
              uint64_t v93 = [v126 unsignedIntegerValue];
            }
            else {
              uint64_t v93 = 1;
            }
            v94 = [[PGMeaningfulEventPartOfDayTrait alloc] initWithPartOfDay:v92 forbiddenPartOfDay:v93];
            [(PGMeaningfulEventTrait *)v94 setMinimumScore:0.75];
            [(PGMeaningfulEventCriteria *)v77 setSignificantPartsOfDayTrait:v94];
            if (v124)
            {
              v95 = -[PGMeaningfulEventPartOfDayTrait initWithPartOfDay:forbiddenPartOfDay:]([PGMeaningfulEventPartOfDayTrait alloc], "initWithPartOfDay:forbiddenPartOfDay:", [v124 unsignedIntegerValue], 1);
              [(PGMeaningfulEventTrait *)v95 setMinimumScore:0.75];
              [(PGMeaningfulEventCriteria *)v77 setAllPartsOfDayTrait:v95];
            }
            v84 = v122;
            if (v122)
            {
              v96 = [PGMeaningfulEventNumberTrait alloc];
              [v122 doubleValue];
              v97 = -[PGMeaningfulEventNumberTrait initWithNumberValue:](v96, "initWithNumberValue:");
              [(PGMeaningfulEventTrait *)v97 setMinimumScore:1.0];
              [(PGMeaningfulEventCriteria *)v77 setMinimumDurationTrait:v97];
            }
            v98 = [v113 objectForKeyedSubscript:v69];
            if (!v98)
            {
              v98 = [MEMORY[0x1E4F1CA48] array];
              [v113 setObject:v98 forKeyedSubscript:v69];
            }
            [v98 addObject:v77];
          }
          id v11 = v115;
          id v9 = v116;
          uint64_t v65 = v119;
          uint64_t v66 = v114;
        }

        ++v67;
      }
      while (v65 != v67);
      uint64_t v65 = [obj countByEnumeratingWithState:&v129 objects:v135 count:16];
    }
    while (v65);
  }

  long long v41 = v107;
  long long v40 = v108;
  id v15 = v103;
  v19 = v111;
LABEL_58:

  return v113;
}

uint64_t __134__PGPhotosChallengeMeaningfulEventRequiredCriteriaFactory__restaurantCriteriaByCriteriaForIdentifiers_withGraph_sceneTaxonomy_params___block_invoke(uint64_t a1, uint64_t a2)
{
  return 0;
}

+ (id)_anniversaryCriteriaWithGraph:(id)a3
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = +[PGGraphNodeCollection nodesInGraph:v3];
  if ([v4 count])
  {
    uint64_t v5 = [v4 anyNode];
    id v6 = [v5 anniversaryDateComponents];
    if (v6)
    {
      id v7 = +[PGGraphNodeCollection nodesInGraph:v3];
      if ([v7 count])
      {
        id v8 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:0 ascending:0 comparator:&__block_literal_global_21484];
        v27[0] = v8;
        id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
        id v10 = [v7 sortedArrayUsingDescriptors:v9];

        id v11 = [v10 firstObject];
        uint64_t v12 = [v11 collection];
        uint64_t v13 = [v12 personNodes];

        double v14 = [MEMORY[0x1E4F1CA48] array];
        uint64_t v15 = [v6 year];
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        void v21[2] = __89__PGPhotosChallengeMeaningfulEventRequiredCriteriaFactory__anniversaryCriteriaWithGraph___block_invoke_2;
        v21[3] = &unk_1E68E7358;
        uint64_t v26 = v15;
        id v22 = v6;
        id v23 = v3;
        id v24 = v13;
        id v16 = v14;
        id v25 = v16;
        id v17 = v13;
        [v23 enumerateNodesWithLabel:@"Year" domain:400 usingBlock:v21];
        uint64_t v18 = v25;
        id v19 = v16;
      }
      else
      {
        id v19 = (id)MEMORY[0x1E4F1CBF0];
      }
    }
    else
    {
      id v19 = (id)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    id v19 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v19;
}

void __89__PGPhotosChallengeMeaningfulEventRequiredCriteriaFactory__anniversaryCriteriaWithGraph___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 calendarUnitValue];
  if (*(void *)(a1 + 64) != v3)
  {
    [*(id *)(a1 + 32) setYear:v3];
    id v13 = [MEMORY[0x1E4F76C68] dateFromComponents:*(void *)(a1 + 32) inTimeZone:0];
    id v4 = objc_msgSend(*(id *)(a1 + 40), "dateNodeForLocalDate:");
    if (v4)
    {
      uint64_t v5 = [[PGMeaningfulEventRequiredCriteria alloc] initWithIdentifier:@"Anniversary" minimumScore:*(void *)(a1 + 40) graph:0.5];
      id v6 = [[PGMeaningfulEventCollectionTrait alloc] initWithNodes:*(void *)(a1 + 48)];
      [(PGMeaningfulEventCriteria *)v5 setPeopleTrait:v6];

      double v7 = 1.0 / (double)(unint64_t)[*(id *)(a1 + 48) count];
      id v8 = [(PGMeaningfulEventCriteria *)v5 peopleTrait];
      [v8 setMinimumScore:v7];

      id v9 = [PGMeaningfulEventCollectionTrait alloc];
      id v10 = [v4 collection];
      id v11 = [(PGMeaningfulEventCollectionTrait *)v9 initWithNodes:v10];
      [(PGMeaningfulEventCriteria *)v5 setDatesTrait:v11];

      uint64_t v12 = [(PGMeaningfulEventCriteria *)v5 datesTrait];
      [v12 setMinimumScore:1.0];

      [*(id *)(a1 + 56) addObject:v5];
    }
  }
}

uint64_t __89__PGPhotosChallengeMeaningfulEventRequiredCriteriaFactory__anniversaryCriteriaWithGraph___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 numberOfMomentNodes];
  uint64_t v6 = [v4 numberOfMomentNodes];

  double v7 = [NSNumber numberWithUnsignedInteger:v5];
  id v8 = [NSNumber numberWithUnsignedInteger:v6];
  uint64_t v9 = [v7 compare:v8];

  return v9;
}

+ (id)_nightOutCriteriaArrayWithGraph:(id)a3 sceneTaxonomy:(id)a4
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v9 = [[PGMeaningfulEventPartOfDayTrait alloc] initWithPartOfDay:32];
  [(PGMeaningfulEventTrait *)v9 setMinimumScore:0.6];
  id v10 = [MEMORY[0x1E4F76D68] nightLife];
  double v51 = v6;
  id v11 = [a1 _publicEventCriteriaForCategoryWithName:v10 inGraph:v6];

  if (v11)
  {
    [v11 setSignificantPartsOfDayTrait:v9];
    [v8 addObject:v11];
  }
  long long v43 = v11;
  long long v44 = v9;
  id v50 = v8;
  long long v49 = [[PGMeaningfulEventPartOfDayTrait alloc] initWithPartOfDay:48 forbiddenPartOfDay:12];
  [(PGMeaningfulEventTrait *)v49 setMinimumScore:0.3];
  uint64_t v12 = [MEMORY[0x1E4F1CA80] setWithArray:&unk_1F28D3E40];
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  uint64_t v13 = [&unk_1F28D3E28 countByEnumeratingWithState:&v58 objects:v71 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v59;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v59 != v15) {
          objc_enumerationMutation(&unk_1F28D3E28);
        }
        id v17 = [v7 nodeForName:*(void *)(*((void *)&v58 + 1) + 8 * i)];
        v56[0] = MEMORY[0x1E4F143A8];
        v56[1] = 3221225472;
        v56[2] = __105__PGPhotosChallengeMeaningfulEventRequiredCriteriaFactory__nightOutCriteriaArrayWithGraph_sceneTaxonomy___block_invoke;
        v56[3] = &unk_1E68EE820;
        id v57 = v12;
        [v17 traverseChildrenUsingNameBlock:v56];
      }
      uint64_t v14 = [&unk_1F28D3E28 countByEnumeratingWithState:&v58 objects:v71 count:16];
    }
    while (v14);
  }
  uint64_t v18 = [v51 sceneNodesForSceneNames:v12];
  v70[0] = @"Nightlife";
  v70[1] = @"Restaurant";
  id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v70 count:2];
  char v20 = +[PGGraphPOINodeCollection poiNodesForLabels:v19 inGraph:v51];

  if ([v18 count] && objc_msgSend(v20, "count"))
  {
    uint64_t v45 = v20;
    v67[0] = @"minimumDuration";
    v67[1] = @"minimumNumberOfHighConfidenceScenes";
    v68[1] = &unk_1F28D1530;
    v67[2] = @"usePOIs";
    v68[0] = &unk_1F28D56B8;
    v68[2] = MEMORY[0x1E4F1CC38];
    uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v68 forKeys:v67 count:3];
    v69[0] = v21;
    v65[0] = @"minimumDuration";
    v65[1] = @"minimumNumberOfHighConfidenceScenes";
    v66[0] = &unk_1F28D56B8;
    v66[1] = &unk_1F28D1548;
    v65[2] = @"usePOIs";
    v66[2] = MEMORY[0x1E4F1CC28];
    id v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v66 forKeys:v65 count:3];
    v69[1] = v22;
    v63[0] = @"minimumDuration";
    v63[1] = @"minimumNumberOfHighConfidenceScenes";
    v64[0] = &unk_1F28D56C8;
    v64[1] = &unk_1F28D1560;
    v63[2] = @"usePOIs";
    v64[2] = MEMORY[0x1E4F1CC38];
    id v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v64 forKeys:v63 count:3];
    v69[2] = v23;
    id v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v69 count:3];

    uint64_t v48 = +[PGMeaningfulEventRequiredCriteriaFactory locationsTraitNotMatchingPeopleHomeWorkLocationsForGraph:v51];
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    obuint64_t j = v24;
    uint64_t v25 = [obj countByEnumeratingWithState:&v52 objects:v62 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v47 = *(void *)v53;
      do
      {
        for (uint64_t j = 0; j != v26; ++j)
        {
          if (*(void *)v53 != v47) {
            objc_enumerationMutation(obj);
          }
          double v28 = *(void **)(*((void *)&v52 + 1) + 8 * j);
          double v29 = [v28 objectForKeyedSubscript:@"minimumDuration"];
          [v29 doubleValue];
          double v31 = v30;

          id v32 = [v28 objectForKeyedSubscript:@"minimumNumberOfHighConfidenceScenes"];
          unint64_t v33 = [v32 unsignedIntegerValue];

          if (v33 <= 1) {
            uint64_t v34 = 1;
          }
          else {
            uint64_t v34 = v33;
          }
          v35 = [v28 objectForKeyedSubscript:@"usePOIs"];
          int v36 = [v35 BOOLValue];

          double v37 = [[PGMeaningfulEventRequiredCriteria alloc] initWithIdentifier:@"NightOut" minimumScore:v51 graph:0.6];
          [(PGMeaningfulEventCriteria *)v37 setLocationsTrait:v48];
          double v38 = [[PGMeaningfulEventNumberTrait alloc] initWithNumberValue:3.0];
          [(PGMeaningfulEventCriteria *)v37 setNumberOfPeopleTrait:v38];

          double v39 = [[PGMeaningfulEventSceneCollectionTrait alloc] initWithNodes:v18];
          -[PGMeaningfulEventTrait setMinimumScore:](v39, "setMinimumScore:", 1.0 / (double)(unint64_t)[v18 count]);
          [(PGMeaningfulEventSceneCollectionTrait *)v39 setMinimumNumberOfHighConfidenceAssets:v34];
          [(PGMeaningfulEventCriteria *)v37 setScenesTrait:v39];
          if (v36)
          {
            long long v40 = [[PGMeaningfulEventCollectionTrait alloc] initWithNodes:v45];
            [(PGMeaningfulEventTrait *)v40 setMinimumScore:0.4];
            [(PGMeaningfulEventCriteria *)v37 setPoisTrait:v40];
          }
          [(PGMeaningfulEventRequiredCriteria *)v37 setMustBeInteresting:1];
          long long v41 = [[PGMeaningfulEventNumberTrait alloc] initWithNumberValue:v31];
          [(PGMeaningfulEventTrait *)v41 setMinimumScore:1.0];
          [(PGMeaningfulEventCriteria *)v37 setMinimumDurationTrait:v41];
          [(PGMeaningfulEventCriteria *)v37 setSignificantPartsOfDayTrait:v49];
          [v50 addObject:v37];
        }
        uint64_t v26 = [obj countByEnumeratingWithState:&v52 objects:v62 count:16];
      }
      while (v26);
    }

    char v20 = v45;
  }

  return v50;
}

uint64_t __105__PGPhotosChallengeMeaningfulEventRequiredCriteriaFactory__nightOutCriteriaArrayWithGraph_sceneTaxonomy___block_invoke(uint64_t a1, uint64_t a2)
{
  return 0;
}

+ (id)_museumCriteriaArrayForMeaningInferenceWithGraph:(id)a3
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  id v6 = [MEMORY[0x1E4F76D68] artsAndMuseums];
  id v7 = [a1 _publicEventCriteriaForCategoryWithName:v6 inGraph:v4];

  if (v7) {
    [v5 addObject:v7];
  }
  id v8 = [a1 _museumSceneTraitInGraph:v4 minimumNumberOfHighConfidenceAssets:12];
  v17[0] = @"Museum";
  v17[1] = @"Culture";
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  id v10 = +[PGGraphPOINodeCollection poiNodesForLabels:v9 inGraph:v4];

  if (v8 && [v10 count])
  {
    id v11 = [[PGMeaningfulEventRequiredCriteria alloc] initWithIdentifier:@"Museum" minimumScore:v4 graph:0.4];
    uint64_t v12 = [[PGMeaningfulEventCollectionTrait alloc] initWithNodes:v10];
    [(PGMeaningfulEventTrait *)v12 setMinimumScore:0.1];
    [(PGMeaningfulEventCriteria *)v11 setPoisTrait:v12];
    [(PGMeaningfulEventCriteria *)v11 setScenesTrait:v8];
    uint64_t v13 = [[PGMeaningfulEventPartOfDayTrait alloc] initWithPartOfDay:14];
    [(PGMeaningfulEventTrait *)v13 setMinimumScore:0.2];
    [(PGMeaningfulEventCriteria *)v11 setSignificantPartsOfDayTrait:v13];
    uint64_t v14 = [[PGMeaningfulEventNumberTrait alloc] initWithNumberValue:3600.0];
    [(PGMeaningfulEventTrait *)v14 setMinimumScore:1.0];
    [(PGMeaningfulEventCriteria *)v11 setMinimumDurationTrait:v14];
    uint64_t v15 = +[PGMeaningfulEventRequiredCriteriaFactory locationsTraitNotMatchingPeopleHomeWorkLocationsForGraph:v4];
    [(PGMeaningfulEventCriteria *)v11 setLocationsTrait:v15];
    [v5 addObject:v11];
  }
  return v5;
}

+ (id)_museumCriteriaArrayForPublicEventInferenceWithGraph:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [a1 _museumSceneTraitInGraph:v4 minimumNumberOfHighConfidenceAssets:8];
  if (v5)
  {
    id v6 = [[PGMeaningfulEventRequiredCriteria alloc] initWithIdentifier:@"Museum" minimumScore:v4 graph:0.4];
    [(PGMeaningfulEventCriteria *)v6 setScenesTrait:v5];
    id v7 = [[PGMeaningfulEventPartOfDayTrait alloc] initWithPartOfDay:14];
    [(PGMeaningfulEventTrait *)v7 setMinimumScore:0.2];
    [(PGMeaningfulEventCriteria *)v6 setSignificantPartsOfDayTrait:v7];
    v10[0] = v6;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  }
  else
  {
    id v8 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v8;
}

+ (id)_museumCriteriaArrayForInferenceType:(unint64_t)a3 graph:(id)a4
{
  id v6 = a4;
  if (a3 == 1)
  {
    uint64_t v7 = [a1 _museumCriteriaArrayForPublicEventInferenceWithGraph:v6];
    goto LABEL_5;
  }
  if (!a3)
  {
    uint64_t v7 = [a1 _museumCriteriaArrayForMeaningInferenceWithGraph:v6];
LABEL_5:
    id v8 = (void *)v7;
    goto LABEL_7;
  }
  id v8 = 0;
LABEL_7:
  if (v8) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v10 = v9;

  return v10;
}

+ (id)_festivalCriteriaArrayWithGraph:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  id v6 = [MEMORY[0x1E4F76D68] festivalsAndFairs];
  uint64_t v7 = [a1 _publicEventCriteriaForCategoryWithName:v6 inGraph:v4];

  if (v7) {
    [v5 addObject:v7];
  }
  id v8 = [a1 _concertSceneNodesInGraph:v4];
  uint64_t v9 = [v8 count];
  if (v9)
  {
    unint64_t v10 = v9;
    id v11 = [[PGMeaningfulEventRequiredCriteria alloc] initWithIdentifier:@"Festival" minimumScore:v4 graph:0.4];
    uint64_t v12 = [[PGMeaningfulEventNumberTrait alloc] initWithNumberValue:5.0];
    [(PGMeaningfulEventCriteria *)v11 setNumberOfPeopleTrait:v12];

    uint64_t v13 = [[PGMeaningfulEventSceneCollectionTrait alloc] initWithNodes:v8];
    [(PGMeaningfulEventTrait *)v13 setMinimumScore:1.0 / (double)v10];
    [(PGMeaningfulEventSceneCollectionTrait *)v13 setMinimumNumberOfHighConfidenceAssets:10];
    [(PGMeaningfulEventCriteria *)v11 setScenesTrait:v13];
    uint64_t v14 = [[PGMeaningfulEventNumberTrait alloc] initWithNumberValue:57600.0];
    [(PGMeaningfulEventTrait *)v14 setMinimumScore:1.0];
    [(PGMeaningfulEventCriteria *)v11 setMinimumDurationTrait:v14];
    uint64_t v15 = +[PGMeaningfulEventRequiredCriteriaFactory locationsTraitNotMatchingPeopleHomeWorkLocationsForGraph:v4];
    [(PGMeaningfulEventCriteria *)v11 setLocationsTrait:v15];
    [v5 addObject:v11];
  }
  return v5;
}

+ (id)_concertCriteriaArrayForPublicEventInferenceWithGraph:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  id v6 = [a1 _concertSceneNodesInGraph:v4];
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"performance", @"nightclub", 0);
  id v8 = [v4 sceneNodesForSceneNames:v7];
  uint64_t v9 = [v6 collectionByFormingUnionWith:v8];

  uint64_t v10 = [v9 count];
  if (v10)
  {
    unint64_t v11 = v10;
    uint64_t v12 = [[PGMeaningfulEventRequiredCriteria alloc] initWithIdentifier:@"Concert" minimumScore:v4 graph:0.4];
    uint64_t v13 = [[PGMeaningfulEventSceneCollectionTrait alloc] initWithNodes:v9];
    [(PGMeaningfulEventTrait *)v13 setMinimumScore:1.0 / (double)v11];
    [(PGMeaningfulEventSceneCollectionTrait *)v13 setMinimumNumberOfHighConfidenceAssets:7];
    [(PGMeaningfulEventCriteria *)v12 setScenesTrait:v13];
    uint64_t v14 = [[PGMeaningfulEventPartOfDayTrait alloc] initWithPartOfDay:48];
    [(PGMeaningfulEventTrait *)v14 setMinimumScore:0.4];
    [(PGMeaningfulEventCriteria *)v12 setSignificantPartsOfDayTrait:v14];
    [v5 addObject:v12];
  }
  return v5;
}

+ (id)_concertCriteriaArrayForMeaningInferenceWithGraph:(id)a3
{
  v20[5] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  id v6 = [MEMORY[0x1E4F76D68] musicConcerts];
  uint64_t v7 = [a1 _publicEventCriteriaForCategoryWithName:v6 inGraph:v4];

  if (v7) {
    [v5 addObject:v7];
  }
  id v8 = [a1 _concertSceneNodesInGraph:v4];
  v20[0] = @"Nightlife";
  v20[1] = @"Culture";
  v20[2] = @"Entertainment";
  v20[3] = @"Stadium";
  v20[4] = @"Performance";
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:5];
  uint64_t v10 = +[PGGraphPOINodeCollection poiNodesForLabels:v9 inGraph:v4];

  uint64_t v11 = [v8 count];
  if (v11)
  {
    unint64_t v12 = v11;
    if ([v10 count])
    {
      uint64_t v13 = [[PGMeaningfulEventRequiredCriteria alloc] initWithIdentifier:@"Concert" minimumScore:v4 graph:0.4];
      uint64_t v14 = [[PGMeaningfulEventNumberTrait alloc] initWithNumberValue:2.0];
      [(PGMeaningfulEventCriteria *)v13 setNumberOfPeopleTrait:v14];

      uint64_t v15 = [[PGMeaningfulEventCollectionTrait alloc] initWithNodes:v10];
      [(PGMeaningfulEventTrait *)v15 setMinimumScore:0.1];
      [(PGMeaningfulEventCriteria *)v13 setPoisTrait:v15];
      id v16 = [[PGMeaningfulEventSceneCollectionTrait alloc] initWithNodes:v8];
      [(PGMeaningfulEventTrait *)v16 setMinimumScore:1.0 / (double)v12];
      [(PGMeaningfulEventSceneCollectionTrait *)v16 setMinimumNumberOfHighConfidenceAssets:2];
      [(PGMeaningfulEventCriteria *)v13 setScenesTrait:v16];
      id v17 = [[PGMeaningfulEventNumberTrait alloc] initWithNumberValue:300.0];
      [(PGMeaningfulEventTrait *)v17 setMinimumScore:1.0];
      [(PGMeaningfulEventCriteria *)v13 setMinimumDurationTrait:v17];
      uint64_t v18 = +[PGMeaningfulEventRequiredCriteriaFactory locationsTraitNotMatchingPeopleHomeWorkLocationsForGraph:v4];
      [(PGMeaningfulEventCriteria *)v13 setLocationsTrait:v18];
      [v5 addObject:v13];
    }
  }

  return v5;
}

+ (id)_concertCriteriaArrayForInferenceType:(unint64_t)a3 graph:(id)a4
{
  id v6 = a4;
  if (a3 == 1)
  {
    uint64_t v7 = [a1 _concertCriteriaArrayForPublicEventInferenceWithGraph:v6];
    goto LABEL_5;
  }
  if (!a3)
  {
    uint64_t v7 = [a1 _concertCriteriaArrayForMeaningInferenceWithGraph:v6];
LABEL_5:
    id v8 = (void *)v7;
    goto LABEL_7;
  }
  id v8 = 0;
LABEL_7:
  if (v8) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v10 = v9;

  return v10;
}

+ (id)_performanceCriteriaWithGraph:(id)a3
{
  void v16[4] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"performance", @"clown", @"ballet_dancer", @"acrobat", @"ballet", @"breakdancing", @"bellydance", @"magic", @"circus", @"orchestra", 0);
  uint64_t v5 = [v3 sceneNodesForSceneNames:v4];
  v16[0] = @"Nightlife";
  v16[1] = @"Culture";
  v16[2] = @"Entertainment";
  v16[3] = @"Performance";
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:4];
  uint64_t v7 = +[PGGraphPOINodeCollection poiNodesForLabels:v6 inGraph:v3];

  if ([v5 count] && objc_msgSend(v7, "count"))
  {
    id v8 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"toy", 0);
    uint64_t v9 = [v3 sceneNodesForSceneNames:v8];

    id v10 = [[PGMeaningfulEventRequiredCriteria alloc] initWithIdentifier:@"Performance" minimumScore:v3 graph:0.4];
    uint64_t v11 = [[PGMeaningfulEventNumberTrait alloc] initWithNumberValue:2.0];
    [(PGMeaningfulEventCriteria *)v10 setNumberOfPeopleTrait:v11];

    unint64_t v12 = [[PGMeaningfulEventCollectionTrait alloc] initWithNodes:v7];
    [(PGMeaningfulEventTrait *)v12 setMinimumScore:0.1];
    [(PGMeaningfulEventCriteria *)v10 setPoisTrait:v12];
    uint64_t v13 = [[PGMeaningfulEventSceneCollectionTrait alloc] initWithNodes:v5 negativeNodes:v9];
    -[PGMeaningfulEventTrait setMinimumScore:](v13, "setMinimumScore:", 1.0 / (double)(unint64_t)[v5 count]);
    [(PGMeaningfulEventSceneCollectionTrait *)v13 setMinimumNumberOfHighConfidenceAssets:4];
    [(PGMeaningfulEventCriteria *)v10 setScenesTrait:v13];
    uint64_t v14 = +[PGMeaningfulEventRequiredCriteriaFactory locationsTraitNotMatchingPeopleHomeWorkLocationsForGraph:v3];
    [(PGMeaningfulEventCriteria *)v10 setLocationsTrait:v14];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

+ (id)_danceCriteriaWithGraph:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F76D68];
  id v5 = a3;
  id v6 = [v4 dance];
  uint64_t v7 = [a1 _publicEventCriteriaForCategoryWithName:v6 inGraph:v5];

  return v7;
}

+ (id)_theaterCriteriaWithGraph:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F76D68];
  id v5 = a3;
  id v6 = [v4 theater];
  uint64_t v7 = [a1 _publicEventCriteriaForCategoryWithName:v6 inGraph:v5];

  return v7;
}

+ (id)_winterSportCriteriaWithGraph:(id)a3 sceneTaxonomy:(id)a4
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [a1 _winterSportSceneNodesWithGraph:v6 sceneTaxonomy:a4];
  v18[0] = @"Mountain";
  v18[1] = @"Nature";
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  uint64_t v9 = +[PGGraphROINodeCollection roiNodesForLabels:v8 inGraph:v6];

  if ([v7 count] && objc_msgSend(v9, "count"))
  {
    id v10 = [a1 _beachingSceneNodesWithGraph:v6];
    uint64_t v11 = [a1 _negativeHikingSceneNodesWithGraph:v6];
    unint64_t v12 = [v10 collectionByFormingUnionWith:v11];

    uint64_t v13 = [[PGMeaningfulEventRequiredCriteria alloc] initWithIdentifier:@"WinterSport" minimumScore:v6 graph:0.6];
    uint64_t v14 = [[PGMeaningfulEventSceneCollectionTrait alloc] initWithNodes:v7 negativeNodes:v12];
    -[PGMeaningfulEventTrait setMinimumScore:](v14, "setMinimumScore:", 1.0 / (double)(unint64_t)[v7 count]);
    [(PGMeaningfulEventCriteria *)v13 setScenesTrait:v14];
    uint64_t v15 = [[PGMeaningfulEventCollectionTrait alloc] initWithNodes:v9];
    [(PGMeaningfulEventTrait *)v15 setMinimumScore:0.25];
    [(PGMeaningfulEventCriteria *)v13 setRoisTrait:v15];
    [(PGMeaningfulEventRequiredCriteria *)v13 setMustBeInteresting:1];
    id v16 = +[PGMeaningfulEventRequiredCriteriaFactory locationsTraitNotMatchingPeopleHomeWorkLocationsForGraph:v6];
    [(PGMeaningfulEventCriteria *)v13 setLocationsTrait:v16];
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

+ (id)_divingCriteriaWithGraph:(id)a3 sceneTaxonomy:(id)a4
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [a1 _divingSceneNodesWithGraph:v6];
  v22[0] = @"Water";
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
  id v10 = +[PGGraphROINodeCollection roiNodesForLabels:v9 inGraph:v6];

  if ([v8 count] && objc_msgSend(v10, "count"))
  {
    uint64_t v11 = [a1 _winterSportSceneNodesWithGraph:v6 sceneTaxonomy:v7];
    unint64_t v12 = [a1 _negativeHikingSceneNodesWithGraph:v6];
    uint64_t v13 = [v11 collectionByFormingUnionWith:v12];

    uint64_t v14 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"surfing", @"surfboard", @"watersport", @"jetski", @"kiteboarding", @"wakeboarding", 0);
    uint64_t v15 = [v6 sceneNodesForSceneNames:v14];
    id v16 = [v13 collectionByFormingUnionWith:v15];

    id v17 = [[PGMeaningfulEventRequiredCriteria alloc] initWithIdentifier:@"Diving" minimumScore:v6 graph:0.7];
    uint64_t v18 = [[PGMeaningfulEventSceneCollectionTrait alloc] initWithNodes:v8 negativeNodes:v16];
    -[PGMeaningfulEventTrait setMinimumScore:](v18, "setMinimumScore:", 1.0 / (double)(unint64_t)[v8 count]);
    [(PGMeaningfulEventCriteria *)v17 setScenesTrait:v18];
    id v19 = [[PGMeaningfulEventCollectionTrait alloc] initWithNodes:v10];
    [(PGMeaningfulEventTrait *)v19 setMinimumScore:0.25];
    [(PGMeaningfulEventCriteria *)v17 setRoisTrait:v19];
    [(PGMeaningfulEventRequiredCriteria *)v17 setMustBeInteresting:1];
    char v20 = +[PGMeaningfulEventRequiredCriteriaFactory locationsTraitNotMatchingFrequentLocationsForGraph:v6];
    [(PGMeaningfulEventCriteria *)v17 setLocationsTrait:v20];
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

+ (id)_sportEventCriteriaArrayForPublicEventInferenceWithGraph:(id)a3
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [a1 _sportEventScenesTraitWithGraph:v4];
  id v6 = v5;
  if (v5)
  {
    [v5 setMinimumNumberOfHighConfidenceAssets:2];
    id v7 = [[PGMeaningfulEventRequiredCriteria alloc] initWithIdentifier:@"SportEvent" minimumScore:v4 graph:0.4];
    [(PGMeaningfulEventCriteria *)v7 setScenesTrait:v6];
    id v8 = [a1 _sportEventScenesTraitWithGraph:v4];
    [v8 setMinimumNumberOfHighConfidenceAssets:7];
    uint64_t v9 = [[PGMeaningfulEventRequiredCriteria alloc] initWithIdentifier:@"SportEvent" minimumScore:v4 graph:0.4];
    [(PGMeaningfulEventCriteria *)v9 setScenesTrait:v8];
    v12[0] = v7;
    v12[1] = v9;
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  }
  else
  {
    id v10 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v10;
}

+ (id)_sportEventCriteriaArrayForMeaningInferenceWithGraph:(id)a3
{
  v24[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  id v6 = [MEMORY[0x1E4F76D68] sports];
  id v7 = [a1 _publicEventCriteriaForCategoryWithName:v6 inGraph:v4];

  if (v7) {
    [v5 addObject:v7];
  }
  id v8 = [a1 _sportEventScenesTraitWithGraph:v4];
  v24[0] = @"Entertainment";
  v24[1] = @"Stadium";
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
  id v10 = +[PGGraphPOINodeCollection poiNodesForLabels:v9 inGraph:v4];

  uint64_t v11 = [v4 anyNodeForLabel:@"Park" domain:501 properties:0];
  if (v8 && [v10 count])
  {
    unint64_t v12 = [[PGMeaningfulEventRequiredCriteria alloc] initWithIdentifier:@"SportEvent" minimumScore:v4 graph:0.4];
    [(PGMeaningfulEventCriteria *)v12 setScenesTrait:v8];
    uint64_t v13 = [[PGMeaningfulEventNumberTrait alloc] initWithNumberValue:2.0];
    [(PGMeaningfulEventTrait *)v13 setMinimumScore:1.0];
    [(PGMeaningfulEventCriteria *)v12 setNumberOfPeopleTrait:v13];
    uint64_t v14 = [[PGMeaningfulEventCollectionTrait alloc] initWithNodes:v10];
    [(PGMeaningfulEventTrait *)v14 setMinimumScore:0.25];
    [(PGMeaningfulEventCriteria *)v12 setPoisTrait:v14];
    uint64_t v15 = +[PGMeaningfulEventRequiredCriteriaFactory locationsTraitNotMatchingPeopleHomeWorkLocationsForGraph:v4];
    [(PGMeaningfulEventCriteria *)v12 setLocationsTrait:v15];
    if (v11)
    {
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      void v22[2] = __112__PGPhotosChallengeMeaningfulEventRequiredCriteriaFactory__sportEventCriteriaArrayForMeaningInferenceWithGraph___block_invoke;
      v22[3] = &unk_1E68E7420;
      id v23 = v11;
      [(PGMeaningfulEventCriteria *)v12 poisTrait];
      uint64_t v21 = v11;
      id v16 = v7;
      id v17 = v13;
      v19 = uint64_t v18 = v5;
      [v19 setAdditionalMatchingBlock:v22];

      id v5 = v18;
      uint64_t v13 = v17;
      id v7 = v16;
      uint64_t v11 = v21;
    }
    [v5 addObject:v12];
  }
  return v5;
}

BOOL __112__PGPhotosChallengeMeaningfulEventRequiredCriteriaFactory__sportEventCriteriaArrayForMeaningInferenceWithGraph___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  if ([v5 containsNode:*(void *)(a1 + 32)])
  {
    id v7 = [MEMORY[0x1E4F1CA80] set];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __112__PGPhotosChallengeMeaningfulEventRequiredCriteriaFactory__sportEventCriteriaArrayForMeaningInferenceWithGraph___block_invoke_2;
    v11[3] = &unk_1E68E73F8;
    id v8 = v7;
    id v12 = v8;
    uint64_t v13 = &v14;
    [v6 enumeratePreciseAddressNodesUsingBlock:v11];
  }
  BOOL v9 = *((unsigned char *)v15 + 24) == 0;
  _Block_object_dispose(&v14, 8);

  return v9;
}

void __112__PGPhotosChallengeMeaningfulEventRequiredCriteriaFactory__sportEventCriteriaArrayForMeaningInferenceWithGraph___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = [a2 collection];
  id v6 = [v5 areaNodes];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __112__PGPhotosChallengeMeaningfulEventRequiredCriteriaFactory__sportEventCriteriaArrayForMeaningInferenceWithGraph___block_invoke_3;
  v9[3] = &unk_1E68E73D0;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  id v10 = v7;
  uint64_t v11 = v8;
  uint64_t v12 = a3;
  [v6 enumerateNodesUsingBlock:v9];
}

void __112__PGPhotosChallengeMeaningfulEventRequiredCriteriaFactory__sportEventCriteriaArrayForMeaningInferenceWithGraph___block_invoke_3(uint64_t a1, void *a2, unsigned char *a3)
{
  id v7 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0)
  {
    [*(id *)(a1 + 32) containsObject:v7];
    char v5 = [v7 diameterIsLargerThanDiameter:4000.0];
    id v6 = *(unsigned char **)(a1 + 48);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v5;
    *id v6 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    *a3 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
}

+ (id)_sportEventCriteriaArrayForInferenceType:(unint64_t)a3 graph:(id)a4
{
  id v6 = a4;
  if (a3 == 1)
  {
    uint64_t v7 = [a1 _sportEventCriteriaArrayForPublicEventInferenceWithGraph:v6];
    goto LABEL_5;
  }
  if (!a3)
  {
    uint64_t v7 = [a1 _sportEventCriteriaArrayForMeaningInferenceWithGraph:v6];
LABEL_5:
    uint64_t v8 = (void *)v7;
    goto LABEL_7;
  }
  uint64_t v8 = 0;
LABEL_7:

  return v8;
}

+ (id)_celebrationCriteriaWithGraph:(id)a3
{
  id v3 = a3;
  id v4 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"graduation", @"disco_ball", @"ceremony", @"wedding", 0);
  char v5 = [v3 sceneNodesForSceneNames:v4];
  if ([v5 count])
  {
    id v6 = [[PGMeaningfulEventRequiredCriteria alloc] initWithIdentifier:@"Celebration" minimumScore:v3 graph:0.4];
    uint64_t v7 = [[PGMeaningfulEventNumberTrait alloc] initWithNumberValue:4.0];
    [(PGMeaningfulEventTrait *)v7 setMinimumScore:1.0];
    [(PGMeaningfulEventCriteria *)v6 setNumberOfPeopleTrait:v7];
    uint64_t v8 = [[PGMeaningfulEventSceneCollectionTrait alloc] initWithNodes:v5];
    -[PGMeaningfulEventTrait setMinimumScore:](v8, "setMinimumScore:", 1.0 / (double)(unint64_t)[v5 count]);
    [(PGMeaningfulEventSceneCollectionTrait *)v8 setMinimumNumberOfHighConfidenceAssets:10];
    [(PGMeaningfulEventCriteria *)v6 setScenesTrait:v8];
    BOOL v9 = [[PGMeaningfulEventNumberTrait alloc] initWithNumberValue:10800.0];
    [(PGMeaningfulEventTrait *)v9 setMinimumScore:1.0];
    [(PGMeaningfulEventCriteria *)v6 setMinimumDurationTrait:v9];
    [(PGMeaningfulEventRequiredCriteria *)v6 setMustBeInteresting:1];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (id)_weddingCriteriaWithGraph:(id)a3 sceneTaxonomy:(id)a4
{
  v20[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [a1 _weddingSceneNodesWithGraph:v6 includeWedding:1 sceneTaxonomy:a4];
  if ([v7 count])
  {
    uint64_t v8 = [[PGMeaningfulEventRequiredCriteria alloc] initWithIdentifier:@"Wedding" minimumScore:v6 graph:0.4];
    BOOL v9 = +[PGMeaningfulEventRequiredCriteriaFactory locationsTraitNotMatchingPeopleWorkLocationsForGraph:v6];
    [v9 setSkipNegativeRequirementForMissingLocation:1];
    [(PGMeaningfulEventCriteria *)v8 setLocationsTrait:v9];
    id v10 = [[PGMeaningfulEventNumberTrait alloc] initWithNumberValue:10.0];
    [(PGMeaningfulEventTrait *)v10 setMinimumScore:1.0];
    [(PGMeaningfulEventCriteria *)v8 setNumberOfPeopleTrait:v10];
    uint64_t v11 = [[PGMeaningfulEventSceneCollectionTrait alloc] initWithNodes:v7];
    -[PGMeaningfulEventTrait setMinimumScore:](v11, "setMinimumScore:", 2.0 / (double)(unint64_t)[v7 count]);
    [(PGMeaningfulEventSceneCollectionTrait *)v11 setMinimumNumberOfHighConfidenceAssets:5];
    [(PGMeaningfulEventCriteria *)v8 setScenesTrait:v11];
    uint64_t v12 = [[PGMeaningfulEventNumberTrait alloc] initWithNumberValue:12600.0];
    [(PGMeaningfulEventTrait *)v12 setMinimumScore:1.0];
    [(PGMeaningfulEventCriteria *)v8 setMinimumDurationTrait:v12];
    uint64_t v13 = [[PGMeaningfulEventPartOfDayTrait alloc] initWithPartOfDay:28];
    [(PGMeaningfulEventTrait *)v13 setMinimumScore:0.1];
    [(PGMeaningfulEventCriteria *)v8 setAllPartsOfDayTrait:v13];
    [(PGMeaningfulEventRequiredCriteria *)v8 setMustBeInteresting:1];
    uint64_t v14 = [[PGMeaningfulEventRequiredCriteria alloc] initWithIdentifier:@"Wedding" minimumScore:v6 graph:0.4];
    uint64_t v15 = [[PGMeaningfulEventNumberTrait alloc] initWithNumberValue:30.0];

    [(PGMeaningfulEventTrait *)v15 setMinimumScore:1.0];
    [(PGMeaningfulEventCriteria *)v14 setNumberOfPeopleTrait:v15];
    uint64_t v16 = [[PGMeaningfulEventSceneCollectionTrait alloc] initWithNodes:v7];

    -[PGMeaningfulEventTrait setMinimumScore:](v16, "setMinimumScore:", 1.0 / (double)(unint64_t)[v7 count]);
    [(PGMeaningfulEventSceneCollectionTrait *)v16 setMinimumNumberOfHighConfidenceAssets:18];
    [(PGMeaningfulEventCriteria *)v14 setScenesTrait:v16];
    char v17 = [[PGMeaningfulEventNumberTrait alloc] initWithNumberValue:3600.0];

    [(PGMeaningfulEventTrait *)v17 setMinimumScore:1.0];
    [(PGMeaningfulEventCriteria *)v14 setMinimumDurationTrait:v17];
    [(PGMeaningfulEventCriteria *)v14 setAllPartsOfDayTrait:v13];
    [(PGMeaningfulEventRequiredCriteria *)v14 setMustBeInteresting:1];
    [(PGMeaningfulEventCriteria *)v14 setLocationsTrait:v9];
    v20[0] = v8;
    v20[1] = v14;
    uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
  }
  else
  {
    uint64_t v18 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v18;
}

+ (void)_birthdayCriteriaWithGraph:(id)a3 strongBirthdayCriteria:(id *)a4 weakBirthdayCriteria:(id *)a5 sceneTaxonomy:(id)a6
{
  id v9 = a3;
  id v10 = (void *)MEMORY[0x1E4F1CAD0];
  id v11 = a6;
  double v31 = objc_msgSend(v10, "setWithObjects:", @"celebration", @"birthday_cake", @"sparkling_wine", @"cake", @"pinata", 0);
  uint64_t v12 = objc_msgSend(v9, "sceneNodesForSceneNames:");
  uint64_t v13 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"restaurant", @"bar", 0);
  uint64_t v14 = [v9 sceneNodesForSceneNames:v13];

  uint64_t v15 = [v14 collectionByFormingUnionWith:v12];

  uint64_t v16 = [a1 _weddingSceneNodesWithGraph:v9 includeWedding:1 sceneTaxonomy:v11];

  char v17 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"grave", 0);
  uint64_t v18 = [v9 sceneNodesForSceneNames:v17];
  id v19 = [v18 collectionByFormingUnionWith:v16];

  char v20 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v21 = [MEMORY[0x1E4F1CA48] array];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __144__PGPhotosChallengeMeaningfulEventRequiredCriteriaFactory__birthdayCriteriaWithGraph_strongBirthdayCriteria_weakBirthdayCriteria_sceneTaxonomy___block_invoke;
  aBlock[3] = &unk_1E68E73A8;
  id v22 = v9;
  id v35 = v22;
  id v36 = v15;
  id v37 = v19;
  id v38 = v12;
  id v23 = v20;
  id v39 = v23;
  id v24 = v21;
  id v40 = v24;
  id v25 = v12;
  id v26 = v19;
  id v27 = v15;
  double v28 = _Block_copy(aBlock);
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __144__PGPhotosChallengeMeaningfulEventRequiredCriteriaFactory__birthdayCriteriaWithGraph_strongBirthdayCriteria_weakBirthdayCriteria_sceneTaxonomy___block_invoke_5;
  v32[3] = &unk_1E68EBB60;
  id v33 = v28;
  id v29 = v28;
  [v22 enumeratePersonNodesIncludingMe:1 withBlock:v32];
  if (a4) {
    *a4 = v23;
  }
  if (a5) {
    *a5 = v24;
  }
}

void __144__PGPhotosChallengeMeaningfulEventRequiredCriteriaFactory__birthdayCriteriaWithGraph_strongBirthdayCriteria_weakBirthdayCriteria_sceneTaxonomy___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 birthdayDateComponents];
  uint64_t v5 = [v3 potentialBirthdayDateComponents];
  id v6 = (void *)v5;
  if (v4 | v5)
  {
    if (v4) {
      uint64_t v7 = (void *)v4;
    }
    else {
      uint64_t v7 = (void *)v5;
    }
    id v8 = v7;
    uint64_t v9 = [v8 year];
    id v10 = [MEMORY[0x1E4F1CA80] set];
    id v11 = [MEMORY[0x1E4F1CA80] set];
    id v12 = a1[4];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __144__PGPhotosChallengeMeaningfulEventRequiredCriteriaFactory__birthdayCriteriaWithGraph_strongBirthdayCriteria_weakBirthdayCriteria_sceneTaxonomy___block_invoke_2;
    v26[3] = &unk_1E68E7358;
    uint64_t v31 = v9;
    id v13 = v8;
    id v27 = v13;
    id v28 = a1[4];
    id v14 = v10;
    id v29 = v14;
    id v15 = v11;
    id v30 = v15;
    [v12 enumerateNodesWithLabel:@"Year" domain:400 usingBlock:v26];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __144__PGPhotosChallengeMeaningfulEventRequiredCriteriaFactory__birthdayCriteriaWithGraph_strongBirthdayCriteria_weakBirthdayCriteria_sceneTaxonomy___block_invoke_4;
    aBlock[3] = &unk_1E68E7380;
    id v21 = a1[4];
    id v22 = v3;
    id v23 = a1[5];
    id v24 = a1[6];
    id v25 = a1[7];
    uint64_t v16 = (void (**)(void *, BOOL, id, void))_Block_copy(aBlock);
    if ([v14 count])
    {
      char v17 = v16[2](v16, v4 != 0, v14, 0);
      if (v17) {
        [a1[8] addObject:v17];
      }
      uint64_t v18 = v16[2](v16, v4 != 0, v14, 1);

      if (v18) {
        [a1[9] addObject:v18];
      }
    }
    if ([v15 count])
    {
      id v19 = v16[2](v16, 0, v15, 0);
      if (v19) {
        [a1[8] addObject:v19];
      }
    }
  }
}

uint64_t __144__PGPhotosChallengeMeaningfulEventRequiredCriteriaFactory__birthdayCriteriaWithGraph_strongBirthdayCriteria_weakBirthdayCriteria_sceneTaxonomy___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __144__PGPhotosChallengeMeaningfulEventRequiredCriteriaFactory__birthdayCriteriaWithGraph_strongBirthdayCriteria_weakBirthdayCriteria_sceneTaxonomy___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x1D25FED50]();
  uint64_t v5 = [v3 calendarUnitValue];
  if (v5 > *(void *)(a1 + 64))
  {
    [*(id *)(a1 + 32) setYear:v5];
    id v6 = [MEMORY[0x1E4F76C68] dateFromComponents:*(void *)(a1 + 32) inTimeZone:0];
    uint64_t v7 = [*(id *)(a1 + 40) dateNodeForLocalDate:v6];
    if (v7) {
      [*(id *)(a1 + 48) addObject:v7];
    }
    if (([MEMORY[0x1E4F76C80] isWeekendDate:v6] & 1) == 0)
    {
      id v22 = 0;
      double v23 = 0.0;
      int v8 = [MEMORY[0x1E4F76C80] nextWeekendLocalStartDate:&v22 interval:&v23 options:0 afterDate:v6];
      id v9 = v22;
      id v10 = v9;
      if (v8)
      {
        id v11 = [v9 dateByAddingTimeInterval:v23];
        uint64_t v16 = v10;
        id v12 = v10;
        if ([v12 compare:v11] == 1)
        {
          id v13 = v12;
        }
        else
        {
          do
          {
            id v14 = objc_msgSend(*(id *)(a1 + 40), "dateNodeForLocalDate:", v12, v16);
            id v15 = v14;
            if (v14 && (!v7 || ([v14 isSameNodeAsNode:v7] & 1) == 0))
            {
              uint64_t v18 = 0;
              id v19 = &v18;
              uint64_t v20 = 0x2020000000;
              char v21 = 0;
              v17[0] = MEMORY[0x1E4F143A8];
              v17[1] = 3221225472;
              v17[2] = __144__PGPhotosChallengeMeaningfulEventRequiredCriteriaFactory__birthdayCriteriaWithGraph_strongBirthdayCriteria_weakBirthdayCriteria_sceneTaxonomy___block_invoke_3;
              void v17[3] = &unk_1E68EBA98;
              v17[4] = &v18;
              [v15 enumerateHolidayNodesUsingBlock:v17];
              if (!*((unsigned char *)v19 + 24)) {
                [*(id *)(a1 + 56) addObject:v15];
              }
              _Block_object_dispose(&v18, 8);
            }
            id v13 = [MEMORY[0x1E4F76C68] dateByAddingDays:1 toDate:v12];

            id v12 = v13;
          }
          while ([v13 compare:v11] != 1);
        }

        id v10 = v16;
      }
    }
  }
}

PGMeaningfulEventRequiredCriteria *__144__PGPhotosChallengeMeaningfulEventRequiredCriteriaFactory__birthdayCriteriaWithGraph_strongBirthdayCriteria_weakBirthdayCriteria_sceneTaxonomy___block_invoke_4(uint64_t a1, int a2, void *a3, int a4)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  int v8 = @"Birthday";
  if (a4) {
    int v8 = @"WeakBirthday";
  }
  id v9 = v8;
  id v10 = [[PGMeaningfulEventRequiredCriteria alloc] initWithIdentifier:v9 minimumScore:*(void *)(a1 + 32) graph:0.4];
  id v11 = [PGMeaningfulEventCollectionTrait alloc];
  id v12 = [*(id *)(a1 + 40) collection];
  id v13 = [(PGMeaningfulEventCollectionTrait *)v11 initWithNodes:v12];
  [(PGMeaningfulEventCriteria *)v10 setPeopleTrait:v13];

  id v14 = [PGMeaningfulEventCollectionTrait alloc];
  id v15 = [(MAElementCollection *)[PGGraphDateNodeCollection alloc] initWithSet:v7 graph:*(void *)(a1 + 32)];
  uint64_t v16 = [(PGMeaningfulEventCollectionTrait *)v14 initWithNodes:v15];
  [(PGMeaningfulEventCriteria *)v10 setDatesTrait:v16];

  char v17 = [(PGMeaningfulEventCriteria *)v10 peopleTrait];
  [v17 setMinimumScore:1.0];

  uint64_t v18 = [(PGMeaningfulEventCriteria *)v10 datesTrait];
  [v18 setMinimumScore:1.0];

  if (a2)
  {
    uint64_t v34 = v9;
    [(PGMeaningfulEventRequiredCriteria *)v10 setAdditionalInfoForKey:@"birthday.isOnDate" value:MEMORY[0x1E4F1CC38]];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v19 = v7;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v36;
LABEL_6:
      uint64_t v23 = 0;
      while (1)
      {
        if (*(void *)v36 != v22) {
          objc_enumerationMutation(v19);
        }
        id v24 = [*(id *)(*((void *)&v35 + 1) + 8 * v23) localDate];
        char v25 = [MEMORY[0x1E4F76C80] isWeekendDate:v24];

        if (v25) {
          break;
        }
        if (v21 == ++v23)
        {
          uint64_t v21 = [v19 countByEnumeratingWithState:&v35 objects:v39 count:16];
          if (v21) {
            goto LABEL_6;
          }
          goto LABEL_12;
        }
      }

      id v9 = v34;
      if (a4) {
        goto LABEL_20;
      }
      uint64_t v29 = [*(id *)(a1 + 48) count];
      id v30 = [[PGMeaningfulEventSceneCollectionTrait alloc] initWithNodes:*(void *)(a1 + 48) negativeNodes:*(void *)(a1 + 56)];
      -[PGMeaningfulEventTrait setMinimumScore:](v30, "setMinimumScore:", 1.0 / (double)(unint64_t)[*(id *)(a1 + 48) count]);
      [(PGMeaningfulEventCriteria *)v10 setScenesTrait:v30];

      if (v29) {
        goto LABEL_20;
      }
      goto LABEL_18;
    }
LABEL_12:

    if (a4)
    {
      id v26 = 0;
      id v9 = v34;
      goto LABEL_23;
    }
    uint64_t v31 = [[PGMeaningfulEventPartOfDayTrait alloc] initWithPartOfDay:56];
    [(PGMeaningfulEventTrait *)v31 setMinimumScore:0.2];
    [(PGMeaningfulEventCriteria *)v10 setSignificantPartsOfDayTrait:v31];

    id v9 = v34;
  }
  else
  {
    if (![*(id *)(a1 + 64) count])
    {
LABEL_18:
      id v26 = 0;
      goto LABEL_23;
    }
    id v27 = [[PGMeaningfulEventSceneCollectionTrait alloc] initWithNodes:*(void *)(a1 + 64) negativeNodes:*(void *)(a1 + 56)];
    -[PGMeaningfulEventTrait setMinimumScore:](v27, "setMinimumScore:", 1.0 / (double)(unint64_t)[*(id *)(a1 + 64) count]);
    [(PGMeaningfulEventSceneCollectionTrait *)v27 setMinimumNumberOfHighConfidenceAssets:2];
    [(PGMeaningfulEventCriteria *)v10 setScenesTrait:v27];
    id v28 = [[PGMeaningfulEventNumberTrait alloc] initWithNumberValue:5.0];
    [(PGMeaningfulEventTrait *)v28 setMinimumScore:1.0];
    [(PGMeaningfulEventCriteria *)v10 setNumberOfPeopleTrait:v28];
  }
LABEL_20:
  id v32 = [*(id *)(a1 + 40) localIdentifier];
  if ([v32 length]) {
    [(PGMeaningfulEventRequiredCriteria *)v10 setAdditionalInfoForKey:@"personLocalIdentifier" value:v32];
  }
  id v26 = v10;

LABEL_23:
  return v26;
}

unint64_t __144__PGPhotosChallengeMeaningfulEventRequiredCriteriaFactory__birthdayCriteriaWithGraph_strongBirthdayCriteria_weakBirthdayCriteria_sceneTaxonomy___block_invoke_3(uint64_t a1, void *a2, unsigned char *a3)
{
  unint64_t result = [a2 category];
  if (result <= 4 && ((1 << result) & 0x16) != 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

+ (id)_requiredCriteriaForIdentifiers:(id)a3 inferenceType:(unint64_t)a4 graph:(id)a5 sceneTaxonomy:(id)a6 params:(id)a7
{
  v58[3] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  uint64_t v16 = [MEMORY[0x1E4F1CA60] dictionary];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __132__PGPhotosChallengeMeaningfulEventRequiredCriteriaFactory__requiredCriteriaForIdentifiers_inferenceType_graph_sceneTaxonomy_params___block_invoke;
  aBlock[3] = &unk_1E68E7330;
  id v17 = v16;
  id v57 = v17;
  uint64_t v18 = (void (**)(void *, __CFString *, void *))_Block_copy(aBlock);
  if (v12)
  {
    if ([v12 containsObject:@"Wedding"])
    {
      id v19 = [a1 _weddingCriteriaWithGraph:v13 sceneTaxonomy:v14];
      [v17 setObject:v19 forKeyedSubscript:@"Wedding"];
    }
    if (([v12 containsObject:@"Birthday"] & 1) == 0
      && ([v12 containsObject:@"WeakBirthday"] & 1) == 0)
    {
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v20 = [a1 _weddingCriteriaWithGraph:v13 sceneTaxonomy:v14];
    [v17 setObject:v20 forKeyedSubscript:@"Wedding"];
  }
  id v54 = 0;
  id v55 = 0;
  [a1 _birthdayCriteriaWithGraph:v13 strongBirthdayCriteria:&v55 weakBirthdayCriteria:&v54 sceneTaxonomy:v14];
  id v21 = v55;
  id v22 = v54;
  if (v12)
  {
    if ([v12 containsObject:@"Birthday"]) {
      [v17 setObject:v21 forKeyedSubscript:@"Birthday"];
    }
    if (([v12 containsObject:@"WeakBirthday"] & 1) == 0)
    {

      goto LABEL_15;
    }
  }
  else
  {
    [v17 setObject:v21 forKeyedSubscript:@"Birthday"];
  }
  [v17 setObject:v22 forKeyedSubscript:@"WeakBirthday"];

  if (!v12)
  {
    id v24 = [a1 _anniversaryCriteriaWithGraph:v13];
    [v17 setObject:v24 forKeyedSubscript:@"Anniversary"];

    goto LABEL_20;
  }
LABEL_15:
  if ([v12 containsObject:@"Anniversary"])
  {
    uint64_t v23 = [a1 _anniversaryCriteriaWithGraph:v13];
    [v17 setObject:v23 forKeyedSubscript:@"Anniversary"];
  }
  if (([v12 containsObject:@"Celebration"] & 1) == 0)
  {
LABEL_21:
    if ([v12 containsObject:@"Performance"])
    {
      id v26 = [a1 _performanceCriteriaWithGraph:v13];
      v18[2](v18, @"Performance", v26);
    }
    if (([v12 containsObject:@"Concert"] & 1) == 0) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }
LABEL_20:
  char v25 = [a1 _celebrationCriteriaWithGraph:v13];
  v18[2](v18, @"Celebration", v25);

  if (v12) {
    goto LABEL_21;
  }
  id v27 = [a1 _performanceCriteriaWithGraph:v13];
  v18[2](v18, @"Performance", v27);

LABEL_26:
  id v28 = [a1 _concertCriteriaArrayForInferenceType:a4 graph:v13];
  [v17 setObject:v28 forKeyedSubscript:@"Concert"];

  if (!v12)
  {
    id v30 = [a1 _festivalCriteriaArrayWithGraph:v13];
    [v17 setObject:v30 forKeyedSubscript:@"Festival"];

    goto LABEL_32;
  }
LABEL_27:
  if ([v12 containsObject:@"Festival"])
  {
    uint64_t v29 = [a1 _festivalCriteriaArrayWithGraph:v13];
    [v17 setObject:v29 forKeyedSubscript:@"Festival"];
  }
  if (([v12 containsObject:@"Theater"] & 1) == 0)
  {
LABEL_33:
    if ([v12 containsObject:@"Dance"])
    {
      id v32 = [a1 _danceCriteriaWithGraph:v13];
      v18[2](v18, @"Dance", v32);
    }
    if (([v12 containsObject:@"Hiking"] & 1) == 0) {
      goto LABEL_39;
    }
    goto LABEL_38;
  }
LABEL_32:
  uint64_t v31 = [a1 _theaterCriteriaWithGraph:v13];
  v18[2](v18, @"Theater", v31);

  if (v12) {
    goto LABEL_33;
  }
  id v33 = [a1 _danceCriteriaWithGraph:v13];
  v18[2](v18, @"Dance", v33);

LABEL_38:
  uint64_t v34 = [a1 _hikingCriteriaWithGraph:v13 sceneTaxonomy:v14];
  [v17 setObject:v34 forKeyedSubscript:@"Hiking"];

  if (!v12)
  {
    long long v36 = [a1 _climbingCriteriaWithGraph:v13 sceneTaxonomy:v14];
    v18[2](v18, @"Climbing", v36);

    goto LABEL_44;
  }
LABEL_39:
  if ([v12 containsObject:@"Climbing"])
  {
    long long v35 = [a1 _climbingCriteriaWithGraph:v13 sceneTaxonomy:v14];
    v18[2](v18, @"Climbing", v35);
  }
  if (([v12 containsObject:@"Beaching"] & 1) == 0)
  {
LABEL_45:
    if ([v12 containsObject:@"SportEvent"])
    {
      long long v38 = [a1 _sportEventCriteriaArrayForInferenceType:a4 graph:v13];
      [v17 setObject:v38 forKeyedSubscript:@"SportEvent"];
    }
    if (([v12 containsObject:@"WinterSport"] & 1) == 0) {
      goto LABEL_51;
    }
    goto LABEL_50;
  }
LABEL_44:
  long long v37 = [a1 _beachingCriteriaWithGraph:v13 sceneTaxonomy:v14];
  v18[2](v18, @"Beaching", v37);

  if (v12) {
    goto LABEL_45;
  }
  id v39 = [a1 _sportEventCriteriaArrayForInferenceType:a4 graph:v13];
  [v17 setObject:v39 forKeyedSubscript:@"SportEvent"];

LABEL_50:
  uint64_t v40 = [a1 _winterSportCriteriaWithGraph:v13 sceneTaxonomy:v14];
  v18[2](v18, @"WinterSport", v40);

  if (!v12)
  {
    long long v43 = [a1 _divingCriteriaWithGraph:v13 sceneTaxonomy:v14];
    v18[2](v18, @"Diving", v43);

    v58[0] = @"Lunch";
    v58[1] = @"Dinner";
    v58[2] = @"Breakfast";
    long long v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:3];
    goto LABEL_60;
  }
LABEL_51:
  if ([v12 containsObject:@"Diving"])
  {
    long long v41 = [a1 _divingCriteriaWithGraph:v13 sceneTaxonomy:v14];
    v18[2](v18, @"Diving", v41);
  }
  long long v42 = [MEMORY[0x1E4F1CA48] array];
  if ([v12 containsObject:@"Lunch"]) {
    [v42 addObject:@"Lunch"];
  }
  if ([v12 containsObject:@"Dinner"]) {
    [v42 addObject:@"Dinner"];
  }
  if ([v12 containsObject:@"Breakfast"]) {
    [v42 addObject:@"Breakfast"];
  }
LABEL_60:
  if ([v42 count])
  {
    long long v44 = [a1 _restaurantCriteriaByCriteriaForIdentifiers:v42 withGraph:v13 sceneTaxonomy:v14 params:v15];
    [v17 addEntriesFromDictionary:v44];
  }
  if (v12)
  {
    if ([v12 containsObject:@"NightOut"])
    {
      uint64_t v45 = [a1 _nightOutCriteriaArrayWithGraph:v13 sceneTaxonomy:v14];
      [v17 setObject:v45 forKeyedSubscript:@"NightOut"];
    }
    if (([v12 containsObject:@"Entertainment"] & 1) == 0)
    {
LABEL_69:
      if ([v12 containsObject:@"AmusementPark"])
      {
        uint64_t v48 = [a1 _amusementParkCriteriaArrayWithGraph:v13 sceneTaxonomy:v14];
        [v17 setObject:v48 forKeyedSubscript:@"AmusementPark"];
      }
      if (([v12 containsObject:@"Museum"] & 1) == 0) {
        goto LABEL_75;
      }
      goto LABEL_74;
    }
  }
  else
  {
    long long v46 = [a1 _nightOutCriteriaArrayWithGraph:v13 sceneTaxonomy:v14];
    [v17 setObject:v46 forKeyedSubscript:@"NightOut"];
  }
  uint64_t v47 = [a1 _entertainmentCriteriaWithGraph:v13];
  v18[2](v18, @"Entertainment", v47);

  if (v12) {
    goto LABEL_69;
  }
  long long v49 = [a1 _amusementParkCriteriaArrayWithGraph:v13 sceneTaxonomy:v14];
  [v17 setObject:v49 forKeyedSubscript:@"AmusementPark"];

LABEL_74:
  id v50 = [a1 _museumCriteriaArrayForInferenceType:a4 graph:v13];
  [v17 setObject:v50 forKeyedSubscript:@"Museum"];

  if (!v12)
  {
LABEL_76:
    double v51 = [a1 _socialGroupGatheringCriteriaWithGraph:v13];
    [v17 setObject:v51 forKeyedSubscript:@"Gathering"];

    goto LABEL_77;
  }
LABEL_75:
  if ([v12 containsObject:@"Gathering"]) {
    goto LABEL_76;
  }
LABEL_77:
  id v52 = v17;

  return v52;
}

void __132__PGPhotosChallengeMeaningfulEventRequiredCriteriaFactory__requiredCriteriaForIdentifiers_inferenceType_graph_sceneTaxonomy_params___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v9 = a3;
    uint64_t v5 = (void *)MEMORY[0x1E4F1C978];
    id v6 = a3;
    id v7 = a2;
    int v8 = [v5 arrayWithObjects:&v9 count:1];
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, v7, v9, v10);
  }
}

+ (id)requiredCriteriaForIdentifiers:(id)a3 inferenceType:(unint64_t)a4 graph:(id)a5 sceneTaxonomy:(id)a6 params:(id)a7
{
  id v12 = (void *)MEMORY[0x1E4F1CAD0];
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  uint64_t v16 = [v12 setWithArray:a3];
  id v17 = [a1 _requiredCriteriaForIdentifiers:v16 inferenceType:a4 graph:v15 sceneTaxonomy:v14 params:v13];

  return v17;
}

@end
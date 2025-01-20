@interface PGMeaningfulEventLooseRequiredCriteriaFactory
+ (id)_amusementParkCriteriaArrayWithGraph:(id)a3 sceneTaxonomy:(id)a4;
+ (id)_anniversaryCriteriaWithGraph:(id)a3;
+ (id)_beachingCriteriaWithGraph:(id)a3 sceneTaxonomy:(id)a4;
+ (id)_beachingSceneNodesWithGraph:(id)a3;
+ (id)_celebrationCriteriaWithGraph:(id)a3;
+ (id)_climbingCriteriaWithGraph:(id)a3 sceneTaxonomy:(id)a4;
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
+ (id)_requiredCriteriaForIdentifiers:(id)a3 graph:(id)a4 sceneTaxonomy:(id)a5;
+ (id)_restaurantCriteriaByCriteriaForIdentifiers:(id)a3 withGraph:(id)a4 sceneTaxonomy:(id)a5;
+ (id)_socialGroupGatheringCriteriaWithGraph:(id)a3;
+ (id)_specialAmusementParkCriteriaWithGraph:(id)a3;
+ (id)_sportEventCriteriaArrayForMeaningInferenceWithGraph:(id)a3;
+ (id)_sportEventCriteriaArrayForPublicEventInferenceWithGraph:(id)a3;
+ (id)_sportEventScenesTraitWithGraph:(id)a3;
+ (id)_theaterCriteriaWithGraph:(id)a3;
+ (id)_weddingCriteriaWithGraph:(id)a3 sceneTaxonomy:(id)a4;
+ (id)_weddingSceneNodesWithGraph:(id)a3 includeWedding:(BOOL)a4 sceneTaxonomy:(id)a5;
+ (id)_winterSportCriteriaWithGraph:(id)a3 sceneTaxonomy:(id)a4;
+ (id)_winterSportSceneNodesWithGraph:(id)a3 sceneTaxonomy:(id)a4;
+ (id)requiredCriteriaForIdentifiers:(id)a3 graph:(id)a4 sceneTaxonomy:(id)a5;
+ (void)_birthdayCriteriaWithGraph:(id)a3 strongBirthdayCriteria:(id *)a4 weakBirthdayCriteria:(id *)a5 sceneTaxonomy:(id)a6;
@end

@implementation PGMeaningfulEventLooseRequiredCriteriaFactory

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
  id v5 = [a1 _museumSceneNodesInGraph:a3];
  uint64_t v6 = [v5 count];
  if (v6)
  {
    unint64_t v7 = v6;
    v8 = [[PGMeaningfulEventSceneCollectionTrait alloc] initWithNodes:v5];
    [(PGMeaningfulEventTrait *)v8 setMinimumScore:1.0 / (double)v7];
    [(PGMeaningfulEventSceneCollectionTrait *)v8 setMinimumNumberOfHighConfidenceAssets:a4];
    unint64_t v9 = vcvtas_u32_f32((float)a4 * 0.5);
    if (v9 <= 1) {
      uint64_t v10 = 1;
    }
    else {
      uint64_t v10 = v9;
    }
    [(PGMeaningfulEventSceneCollectionTrait *)v8 setMinimumNumberOfNegativeHighConfidenceAssets:v10];
    [(PGMeaningfulEventSceneCollectionTrait *)v8 setAccumulateHighConfidenceAssetCounts:1];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)_concertSceneNodesInGraph:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = a3;
  id v5 = objc_msgSend(v3, "setWithObjects:", @"concert", @"singer", @"deejay", @"orchestra", @"musical_instrument", @"speakers_music", @"microphone", 0);
  uint64_t v6 = [v4 sceneNodesForSceneNames:v5];

  return v6;
}

+ (id)_weddingSceneNodesWithGraph:(id)a3 includeWedding:(BOOL)a4 sceneTaxonomy:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  v8 = (void *)MEMORY[0x1E4F1CA80];
  id v9 = a3;
  uint64_t v10 = [v8 set];
  v11 = v10;
  if (v5) {
    [v10 addObject:@"wedding"];
  }
  v12 = [v7 nodeForName:@"wedding"];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __106__PGMeaningfulEventLooseRequiredCriteriaFactory__weddingSceneNodesWithGraph_includeWedding_sceneTaxonomy___block_invoke;
  v16[3] = &unk_1E68EE820;
  id v17 = v11;
  id v13 = v11;
  [v12 visitChildrenUsingNameBlock:v16];
  char v14 = [v9 sceneNodesForSceneNames:v13];

  return v14;
}

uint64_t __106__PGMeaningfulEventLooseRequiredCriteriaFactory__weddingSceneNodesWithGraph_includeWedding_sceneTaxonomy___block_invoke(uint64_t a1, uint64_t a2)
{
  return 0;
}

+ (id)_negativeHikingSceneNodesWithGraph:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = a3;
  BOOL v5 = objc_msgSend(v3, "setWithObjects:", @"hiking", @"canyon", @"volcano", @"cliff", @"waterfall", 0);
  uint64_t v6 = [v4 sceneNodesForSceneNames:v5];

  return v6;
}

+ (id)_hikingSceneNodesWithGraph:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = a3;
  BOOL v5 = objc_msgSend(v3, "setWithObjects:", @"hiking", @"mountain", @"canyon", @"volcano", @"glacier", @"cliff", @"waterfall", @"forest", @"desert", @"hill", @"trail", 0);
  uint64_t v6 = [v4 sceneNodesForSceneNames:v5];

  return v6;
}

+ (id)_divingSceneNodesWithGraph:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = a3;
  BOOL v5 = objc_msgSend(v3, "setWithObjects:", @"diving", @"underwater", @"submarine_water", @"scuba", @"wetsuit", @"coral_reef", 0);
  uint64_t v6 = [v4 sceneNodesForSceneNames:v5];

  return v6;
}

+ (id)_negativeSceneNodesForBeachingWithGraph:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = a3;
  BOOL v5 = objc_msgSend(v3, "setWithObjects:", @"snow", @"blizzard", @"snowball", @"snowman", 0);
  uint64_t v6 = [v4 sceneNodesForSceneNames:v5];

  return v6;
}

+ (id)_beachingSceneNodesWithGraph:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = a3;
  BOOL v5 = objc_msgSend(v3, "setWithObjects:", @"beach", @"surfing", @"surfboard", @"mollusk", @"shore", @"folding_chair", @"jetski", @"windsurfing", @"barnacle", @"sand", @"skating", @"lighthouse", @"swimsuit", @"sandcastle", @"sunbathing", @"watersport", 0);
  uint64_t v6 = [v4 sceneNodesForSceneNames:v5];

  return v6;
}

+ (id)_winterSportSceneNodesWithGraph:(id)a3 sceneTaxonomy:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [a4 nodeForName:@"winter_sport"];
  if (v6)
  {
    id v7 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithObjects:", @"winter_sport", @"ski_boot", @"snowshoe", @"ski_equipment", @"snowboard", @"snowmobile", 0);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __95__PGMeaningfulEventLooseRequiredCriteriaFactory__winterSportSceneNodesWithGraph_sceneTaxonomy___block_invoke;
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

uint64_t __95__PGMeaningfulEventLooseRequiredCriteriaFactory__winterSportSceneNodesWithGraph_sceneTaxonomy___block_invoke(uint64_t a1, uint64_t a2)
{
  return 0;
}

+ (id)_sportEventScenesTraitWithGraph:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = a3;
  objc_msgSend(v3, "setWithObjects:", @"sumo", @"badminton", @"softball", @"soccer", @"cricket_sport", @"rugby", @"scoreboard", @"tennis", @"cheerleading", @"polo", @"hockey", @"football", @"grand_prix", @"jockey_horse", @"wrestling", @"baseball", @"motorsport",
    @"basketball",
    @"rink",
    @"arena",
    @"motocross",
    @"stadium",
    @"ballgames",
  id v5 = 0);
  uint64_t v6 = [v4 sceneNodesForSceneNames:v5];

  if ([v6 count])
  {
    id v7 = [[PGMeaningfulEventSceneCollectionTrait alloc] initWithNodes:v6];
    -[PGMeaningfulEventTrait setMinimumScore:](v7, "setMinimumScore:", 1.0 / (double)(unint64_t)[v6 count]);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)_socialGroupGatheringCriteriaWithGraph:(id)a3
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v36 = a3;
  v3 = [v36 meNode];
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
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", v32);
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __88__PGMeaningfulEventLooseRequiredCriteriaFactory__socialGroupGatheringCriteriaWithGraph___block_invoke;
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
      v45[2] = __88__PGMeaningfulEventLooseRequiredCriteriaFactory__socialGroupGatheringCriteriaWithGraph___block_invoke_3;
      v45[3] = &unk_1E68E74B0;
      v45[4] = &v50;
      v15 = v34;
      [MEMORY[0x1E4F76C60] calculateStandardDeviationForItems:v34 valueBlock:&__block_literal_global_535 result:v45];
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

void __88__PGMeaningfulEventLooseRequiredCriteriaFactory__socialGroupGatheringCriteriaWithGraph___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((unint64_t)[v3 numberOfMemberNodes] >= *(void *)(a1 + 40)) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

double __88__PGMeaningfulEventLooseRequiredCriteriaFactory__socialGroupGatheringCriteriaWithGraph___block_invoke_3(uint64_t a1, double a2, double a3)
{
  double result = a2 + a3;
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

double __88__PGMeaningfulEventLooseRequiredCriteriaFactory__socialGroupGatheringCriteriaWithGraph___block_invoke_2(uint64_t a1, void *a2)
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
    uint64_t v6 = [[PGMeaningfulEventRequiredCriteria alloc] initWithIdentifier:@"AmusementPark" minimumScore:v3 graph:0.4];
    unint64_t v7 = [[PGMeaningfulEventCollectionTrait alloc] initWithNodes:v5];
    [(PGMeaningfulEventTrait *)v7 setMinimumScore:0.7];
    [(PGMeaningfulEventCollectionTrait *)v7 setAdditionalMatchingBlock:&__block_literal_global_18453];
    [(PGMeaningfulEventCriteria *)v6 setPoisTrait:v7];
    id v8 = +[PGMeaningfulEventRequiredCriteriaFactory locationsTraitNotMatchingPeopleHomeWorkLocationsForGraph:v3];
    [(PGMeaningfulEventCriteria *)v6 setLocationsTrait:v8];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

BOOL __88__PGMeaningfulEventLooseRequiredCriteriaFactory__specialAmusementParkCriteriaWithGraph___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  uint64_t v5 = [a3 collection];
  uint64_t v6 = +[PGGraphPOIEdge filterSpecial];
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
    v25[2] = __100__PGMeaningfulEventLooseRequiredCriteriaFactory__amusementParkCriteriaArrayWithGraph_sceneTaxonomy___block_invoke;
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

uint64_t __100__PGMeaningfulEventLooseRequiredCriteriaFactory__amusementParkCriteriaArrayWithGraph_sceneTaxonomy___block_invoke(uint64_t a1, uint64_t a2)
{
  return 0;
}

+ (id)_entertainmentCriteriaWithGraph:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"zoo", @"aquarium", @"underwater", 0);
  uint64_t v5 = [v3 sceneNodesForSceneNames:v4];
  v12[0] = @"Entertainment";
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  unint64_t v7 = +[PGGraphPOINodeCollection poiNodesForLabels:v6 inGraph:v3];

  if ([v7 count])
  {
    id v8 = [[PGMeaningfulEventRequiredCriteria alloc] initWithIdentifier:@"Entertainment" minimumScore:v3 graph:0.4];
    if ([v5 count])
    {
      id v9 = [[PGMeaningfulEventSceneCollectionTrait alloc] initWithNodes:v5];
      -[PGMeaningfulEventTrait setMinimumScore:](v9, "setMinimumScore:", 1.0 / (double)(unint64_t)[v5 count]);
      [(PGMeaningfulEventCriteria *)v8 setScenesTrait:v9];
    }
    uint64_t v10 = [[PGMeaningfulEventCollectionTrait alloc] initWithNodes:v7];
    [(PGMeaningfulEventTrait *)v10 setMinimumScore:0.7];
    [(PGMeaningfulEventCriteria *)v8 setPoisTrait:v10];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (id)_beachingCriteriaWithGraph:(id)a3 sceneTaxonomy:(id)a4
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [a1 _beachingSceneNodesWithGraph:v6];
  if ([v8 count])
  {
    v20[0] = @"Beach";
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
    uint64_t v10 = +[PGGraphROINodeCollection roiNodesForLabels:v9 inGraph:v6];

    unint64_t v11 = [a1 _winterSportSceneNodesWithGraph:v6 sceneTaxonomy:v7];
    uint64_t v12 = [a1 _negativeHikingSceneNodesWithGraph:v6];
    id v13 = [v11 collectionByFormingUnionWith:v12];

    double v14 = [a1 _negativeSceneNodesForBeachingWithGraph:v6];
    v15 = [v13 collectionByFormingUnionWith:v14];

    char v16 = [[PGMeaningfulEventRequiredCriteria alloc] initWithIdentifier:@"Beaching" minimumScore:v6 graph:0.4];
    uint64_t v17 = [[PGMeaningfulEventSceneCollectionTrait alloc] initWithNodes:v8 negativeNodes:v15];
    -[PGMeaningfulEventTrait setMinimumScore:](v17, "setMinimumScore:", 1.0 / (double)(unint64_t)[v8 count]);
    [(PGMeaningfulEventSceneCollectionTrait *)v17 setMinimumNumberOfHighConfidenceAssets:1];
    [(PGMeaningfulEventSceneCollectionTrait *)v17 setMinimumNumberOfNegativeHighConfidenceAssets:4];
    [(PGMeaningfulEventCriteria *)v16 setScenesTrait:v17];
    if ([v10 count])
    {
      uint64_t v18 = [[PGMeaningfulEventCollectionTrait alloc] initWithNodes:v10];
      [(PGMeaningfulEventTrait *)v18 setMinimumScore:1.0];
      [(PGMeaningfulEventCriteria *)v16 setRoisTrait:v18];
    }
    [(PGMeaningfulEventRequiredCriteria *)v16 setMustBeInteresting:0];
  }
  else
  {
    char v16 = 0;
  }

  return v16;
}

+ (id)_climbingCriteriaWithGraph:(id)a3 sceneTaxonomy:(id)a4
{
  void v16[4] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F1CAD0] setWithObject:@"rock_climbing"];
  id v7 = [v5 sceneNodesForSceneNames:v6];

  if ([v7 count])
  {
    v16[0] = @"Mountain";
    v16[1] = @"Nature";
    v16[2] = @"Beach";
    v16[3] = @"Water";
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:4];
    id v9 = +[PGGraphROINodeCollection roiNodesForLabels:v8 inGraph:v5];

    uint64_t v10 = [[PGMeaningfulEventRequiredCriteria alloc] initWithIdentifier:@"Climbing" minimumScore:v5 graph:0.4];
    if ([v9 count])
    {
      unint64_t v11 = [[PGMeaningfulEventCollectionTrait alloc] initWithNodes:v9];
      [(PGMeaningfulEventTrait *)v11 setMinimumScore:0.25];
      [(PGMeaningfulEventCriteria *)v10 setRoisTrait:v11];
    }
    uint64_t v12 = [[PGMeaningfulEventNumberTrait alloc] initWithNumberValue:1.0];
    [(PGMeaningfulEventTrait *)v12 setMinimumScore:1.0];
    [(PGMeaningfulEventCriteria *)v10 setNumberOfPeopleTrait:v12];
    id v13 = [a1 _divingSceneNodesWithGraph:v5];
    double v14 = [[PGMeaningfulEventSceneCollectionTrait alloc] initWithNodes:v7 negativeNodes:v13];
    [(PGMeaningfulEventSceneCollectionTrait *)v14 setMinimumNumberOfHighConfidenceAssets:2];
    [(PGMeaningfulEventTrait *)v14 setMinimumScore:1.0];
    [(PGMeaningfulEventSceneCollectionTrait *)v14 setMinimumRatioOfHighConfidenceAssets:0.5];
    [(PGMeaningfulEventCriteria *)v10 setScenesTrait:v14];
    [(PGMeaningfulEventRequiredCriteria *)v10 setMustBeInteresting:0];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

+ (id)_hikingCriteriaWithGraph:(id)a3 sceneTaxonomy:(id)a4
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [a1 _hikingSceneNodesWithGraph:v5];
  v30[0] = @"Hiking";
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
  id v8 = +[PGGraphPOINodeCollection poiNodesForLabels:v7 inGraph:v5];

  v29[0] = @"Mountain";
  v29[1] = @"Nature";
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
  uint64_t v10 = +[PGGraphROINodeCollection roiNodesForLabels:v9 inGraph:v5];

  if ([v6 count] && (objc_msgSend(v8, "count") || objc_msgSend(v10, "count")))
  {
    v25 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"gown", @"suit", @"necktie", @"vineyard", @"cycling", @"bicycle", @"golf", @"skydiving", @"sport", 0);
    unint64_t v11 = [v5 sceneNodesForSceneNames:v25];
    uint64_t v12 = [a1 _beachingSceneNodesWithGraph:v5];
    id v13 = [v11 collectionByFormingUnionWith:v12];

    double v14 = [a1 _divingSceneNodesWithGraph:v5];
    char v24 = [v13 collectionByFormingUnionWith:v14];

    v27 = v8;
    v15 = [[PGMeaningfulEventRequiredCriteria alloc] initWithIdentifier:@"Hiking" minimumScore:v5 graph:0.4];
    char v16 = [[PGMeaningfulEventSceneCollectionTrait alloc] initWithNodes:v6 negativeNodes:v24];
    -[PGMeaningfulEventTrait setMinimumScore:](v16, "setMinimumScore:", 1.0 / (double)(unint64_t)[v6 count]);
    [(PGMeaningfulEventCriteria *)v15 setScenesTrait:v16];
    id v26 = v10;
    uint64_t v17 = [[PGMeaningfulEventCollectionTrait alloc] initWithNodes:v10];
    [(PGMeaningfulEventTrait *)v17 setMinimumScore:0.5];
    [(PGMeaningfulEventCriteria *)v15 setRoisTrait:v17];
    uint64_t v18 = [[PGMeaningfulEventLocationMobilityTrait alloc] initWithMobility:1];
    [(PGMeaningfulEventTrait *)v18 setMinimumScore:0.9];
    [(PGMeaningfulEventCriteria *)v15 setLocationMobilityTrait:v18];
    v19 = +[PGMeaningfulEventRequiredCriteriaFactory locationsTraitNotMatchingFrequentLocationsForGraph:v5];
    [(PGMeaningfulEventCriteria *)v15 setLocationsTrait:v19];
    [(PGMeaningfulEventRequiredCriteria *)v15 setMustBeInteresting:1];
    char v20 = [[PGMeaningfulEventRequiredCriteria alloc] initWithIdentifier:@"Hiking" minimumScore:v5 graph:0.4];
    -[PGMeaningfulEventTrait setMinimumScore:](v16, "setMinimumScore:", 1.0 / (double)(unint64_t)[v6 count]);
    [(PGMeaningfulEventCriteria *)v20 setScenesTrait:v16];
    double v21 = [[PGMeaningfulEventCollectionTrait alloc] initWithNodes:v8];
    [(PGMeaningfulEventTrait *)v21 setMinimumScore:0.5];
    [(PGMeaningfulEventCriteria *)v20 setPoisTrait:v21];
    [(PGMeaningfulEventTrait *)v18 setMinimumScore:0.9];
    [(PGMeaningfulEventCriteria *)v20 setLocationMobilityTrait:v18];
    [(PGMeaningfulEventCriteria *)v20 setLocationsTrait:v19];
    [(PGMeaningfulEventRequiredCriteria *)v20 setMustBeInteresting:1];
    v28[0] = v15;
    v28[1] = v20;
    uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];

    id v8 = v27;
    uint64_t v10 = v26;
  }
  else
  {
    uint64_t v22 = 0;
  }

  return v22;
}

+ (id)_restaurantCriteriaByCriteriaForIdentifiers:(id)a3 withGraph:(id)a4 sceneTaxonomy:(id)a5
{
  v102[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = [a5 nodeForName:@"tableware"];
  uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithObjects:", @"restaurant", @"food", 0);
  unint64_t v11 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithObjects:", @"wine_bottle", @"wine", 0);
  v85[0] = MEMORY[0x1E4F143A8];
  v85[1] = 3221225472;
  v85[2] = __117__PGMeaningfulEventLooseRequiredCriteriaFactory__restaurantCriteriaByCriteriaForIdentifiers_withGraph_sceneTaxonomy___block_invoke;
  v85[3] = &unk_1E68EE820;
  id v12 = v11;
  id v86 = v12;
  v64 = v9;
  [v9 traverseChildrenUsingNameBlock:v85];
  v63 = (void *)v10;
  id v13 = [v8 sceneNodesForSceneNames:v10];
  double v14 = [v8 sceneNodesForSceneNames:v12];
  v72 = v13;
  v15 = [v13 collectionByFormingUnionWith:v14];
  v62 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"aquarium", @"underwater", 0);
  v67 = objc_msgSend(v8, "sceneNodesForSceneNames:");
  v102[0] = @"Nightlife";
  v102[1] = @"Restaurant";
  char v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v102 count:2];
  uint64_t v17 = +[PGGraphPOINodeCollection poiNodesForLabels:v16 inGraph:v8];

  v101 = @"Museum";
  uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v101 count:1];
  v73 = v8;
  v65 = +[PGGraphPOINodeCollection poiNodesForLabels:v18 inGraph:v8];

  v71 = v15;
  if ([v15 count] && objc_msgSend(v17, "count"))
  {
    v66 = v17;
    uint64_t v60 = v14;
    id v61 = v12;
    v98[0] = @"label";
    v98[1] = @"significantPartsOfDay";
    v99[0] = @"Lunch";
    v99[1] = &unk_1F28D12F0;
    v70 = v7;
    v98[2] = @"forbiddenPartOfDay";
    v98[3] = @"minimumNumberOfHighConfidenceScenes";
    v99[2] = &unk_1F28D1308;
    v99[3] = &unk_1F28D12C0;
    uint64_t v19 = MEMORY[0x1E4F1CC28];
    v98[4] = @"usePOIs";
    v98[5] = @"useNegativePOIs";
    v99[4] = MEMORY[0x1E4F1CC28];
    v99[5] = MEMORY[0x1E4F1CC28];
    v79 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v99 forKeys:v98 count:6];
    v100[0] = v79;
    v96[0] = @"label";
    v96[1] = @"significantPartsOfDay";
    v97[0] = @"Lunch";
    v97[1] = &unk_1F28D12F0;
    v96[2] = @"forbiddenPartOfDay";
    v96[3] = @"minimumNumberOfHighConfidenceScenes";
    uint64_t v20 = MEMORY[0x1E4F1CC38];
    v97[2] = &unk_1F28D1308;
    v97[3] = &unk_1F28D1320;
    v96[4] = @"usePOIs";
    v96[5] = @"useNegativePOIs";
    v97[4] = MEMORY[0x1E4F1CC38];
    v97[5] = v19;
    v77 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v97 forKeys:v96 count:6];
    v100[1] = v77;
    v94[0] = @"label";
    v94[1] = @"significantPartsOfDay";
    v95[0] = @"Dinner";
    v95[1] = &unk_1F28D1308;
    v94[2] = @"forbiddenPartOfDay";
    v94[3] = @"allPartsOfDay";
    v95[2] = &unk_1F28D1338;
    v95[3] = &unk_1F28D1350;
    v94[4] = @"minimumDuration";
    v94[5] = @"minimumNumberOfHighConfidenceScenes";
    v95[4] = &unk_1F28D5658;
    v95[5] = &unk_1F28D12C0;
    v94[6] = @"usePOIs";
    v94[7] = @"useNegativePOIs";
    v95[6] = v20;
    v95[7] = v19;
    id obja = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v95 forKeys:v94 count:8];
    v100[2] = obja;
    v92[0] = @"label";
    v92[1] = @"significantPartsOfDay";
    v93[0] = @"Dinner";
    v93[1] = &unk_1F28D1308;
    v92[2] = @"forbiddenPartOfDay";
    v92[3] = @"allPartsOfDay";
    v93[2] = &unk_1F28D1338;
    v93[3] = &unk_1F28D1350;
    v92[4] = @"minimumDuration";
    v92[5] = @"minimumNumberOfHighConfidenceScenes";
    v93[4] = &unk_1F28D5658;
    v93[5] = &unk_1F28D12C0;
    v92[6] = @"usePOIs";
    v92[7] = @"useNegativePOIs";
    v93[6] = v19;
    v93[7] = v19;
    double v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v93 forKeys:v92 count:8];
    v100[3] = v21;
    v90[0] = @"label";
    v90[1] = @"forbiddenPartOfDay";
    v91[0] = @"Breakfast";
    v91[1] = &unk_1F28D1368;
    v90[2] = @"significantPartsOfDay";
    v90[3] = @"minimumNumberOfHighConfidenceScenes";
    v91[2] = &unk_1F28D1380;
    v91[3] = &unk_1F28D1320;
    v90[4] = @"usePOIs";
    v90[5] = @"useNegativePOIs";
    v91[4] = MEMORY[0x1E4F1CC38];
    v91[5] = v19;
    uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v91 forKeys:v90 count:6];
    v100[4] = v22;
    v88[0] = @"label";
    v88[1] = @"forbiddenPartOfDay";
    v89[0] = @"Breakfast";
    v89[1] = &unk_1F28D1368;
    v88[2] = @"significantPartsOfDay";
    v88[3] = @"minimumNumberOfHighConfidenceScenes";
    v89[2] = &unk_1F28D1380;
    v89[3] = &unk_1F28D12C0;
    v88[4] = @"usePOIs";
    v88[5] = @"useNegativePOIs";
    v89[4] = v19;
    v89[5] = v19;
    uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v89 forKeys:v88 count:6];
    v100[5] = v23;
    char v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v100 count:6];

    id v7 = v70;
    objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v70, "count"));
    id v68 = (id)objc_claimAutoreleasedReturnValue();
    long long v81 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    obuint64_t j = v24;
    uint64_t v25 = [obj countByEnumeratingWithState:&v81 objects:v87 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v82;
      uint64_t v69 = *(void *)v82;
      do
      {
        uint64_t v28 = 0;
        uint64_t v74 = v26;
        do
        {
          if (*(void *)v82 != v27) {
            objc_enumerationMutation(obj);
          }
          v29 = *(void **)(*((void *)&v81 + 1) + 8 * v28);
          v30 = [v29 objectForKeyedSubscript:@"label"];
          if ([v7 containsObject:v30])
          {
            v80 = [v29 objectForKeyedSubscript:@"significantPartsOfDay"];
            v78 = [v29 objectForKeyedSubscript:@"forbiddenPartOfDay"];
            int v31 = [v29 objectForKeyedSubscript:@"allPartsOfDay"];
            id v32 = [v29 objectForKeyedSubscript:@"minimumDuration"];
            uint64_t v33 = [v29 objectForKeyedSubscript:@"minimumNumberOfHighConfidenceScenes"];
            unint64_t v34 = [v33 unsignedIntegerValue];

            if (v34 <= 1) {
              uint64_t v35 = 1;
            }
            else {
              uint64_t v35 = v34;
            }
            id v36 = [v29 objectForKeyedSubscript:@"usePOIs"];
            int v37 = [v36 BOOLValue];

            long long v38 = [v29 objectForKeyedSubscript:@"useNegativePOIs"];
            char v39 = [v38 BOOLValue];

            long long v40 = [[PGMeaningfulEventRequiredCriteria alloc] initWithIdentifier:v30 minimumScore:v73 graph:0.6];
            long long v41 = v72;
            if (!v37) {
              long long v41 = v71;
            }
            id v42 = v41;
            uint64_t v43 = [v42 count];
            if (v43)
            {
              unint64_t v44 = v43;
              if (v37)
              {
                v45 = [PGMeaningfulEventCollectionTrait alloc];
                if (v39) {
                  long long v46 = [(PGMeaningfulEventCollectionTrait *)v45 initWithNodes:v66 negativeNodes:v65];
                }
                else {
                  long long v46 = [(PGMeaningfulEventCollectionTrait *)v45 initWithNodes:v66];
                }
                long long v47 = v46;
                [(PGMeaningfulEventTrait *)v46 setMinimumScore:0.7];
                [(PGMeaningfulEventCriteria *)v40 setPoisTrait:v47];
              }
              double v48 = 1.0 / (double)v44;
              long long v49 = [[PGMeaningfulEventSceneCollectionTrait alloc] initWithNodes:v42 negativeNodes:v67];
              [(PGMeaningfulEventTrait *)v49 setMinimumScore:v48];
              [(PGMeaningfulEventSceneCollectionTrait *)v49 setMinimumNumberOfHighConfidenceAssets:v35];
              [(PGMeaningfulEventSceneCollectionTrait *)v49 setAccumulateHighConfidenceAssetCounts:1];
              [(PGMeaningfulEventCriteria *)v40 setScenesTrait:v49];
              uint64_t v50 = [v80 unsignedIntegerValue];
              if (v78) {
                uint64_t v51 = [v78 unsignedIntegerValue];
              }
              else {
                uint64_t v51 = 1;
              }
              uint64_t v52 = [[PGMeaningfulEventPartOfDayTrait alloc] initWithPartOfDay:v50 forbiddenPartOfDay:v51];
              [(PGMeaningfulEventTrait *)v52 setMinimumScore:0.75];
              [(PGMeaningfulEventCriteria *)v40 setSignificantPartsOfDayTrait:v52];
              if (v31)
              {
                uint64_t v53 = -[PGMeaningfulEventPartOfDayTrait initWithPartOfDay:forbiddenPartOfDay:]([PGMeaningfulEventPartOfDayTrait alloc], "initWithPartOfDay:forbiddenPartOfDay:", [v31 unsignedIntegerValue], 1);
                [(PGMeaningfulEventTrait *)v53 setMinimumScore:0.75];
                [(PGMeaningfulEventCriteria *)v40 setAllPartsOfDayTrait:v53];
              }
              if (v32)
              {
                v54 = [PGMeaningfulEventNumberTrait alloc];
                [v32 doubleValue];
                id v55 = -[PGMeaningfulEventNumberTrait initWithNumberValue:](v54, "initWithNumberValue:");
                [(PGMeaningfulEventTrait *)v55 setMinimumScore:1.0];
                [(PGMeaningfulEventCriteria *)v40 setMinimumDurationTrait:v55];
              }
              uint64_t v56 = [v68 objectForKeyedSubscript:v30];
              if (!v56)
              {
                uint64_t v56 = [MEMORY[0x1E4F1CA48] array];
                [v68 setObject:v56 forKeyedSubscript:v30];
              }
              [v56 addObject:v40];
            }
            uint64_t v27 = v69;
            id v7 = v70;
            uint64_t v26 = v74;
          }

          ++v28;
        }
        while (v26 != v28);
        uint64_t v26 = [obj countByEnumeratingWithState:&v81 objects:v87 count:16];
      }
      while (v26);
    }

    v58 = v63;
    v57 = v64;
    double v14 = v60;
    id v12 = v61;
    uint64_t v17 = v66;
  }
  else
  {
    id v68 = (id)MEMORY[0x1E4F1CC08];
    v58 = (void *)v10;
    v57 = v64;
  }

  return v68;
}

uint64_t __117__PGMeaningfulEventLooseRequiredCriteriaFactory__restaurantCriteriaByCriteriaForIdentifiers_withGraph_sceneTaxonomy___block_invoke(uint64_t a1, uint64_t a2)
{
  return 0;
}

+ (id)_anniversaryCriteriaWithGraph:(id)a3
{
  id v3 = a3;
  id v4 = +[PGGraphNodeCollection nodesInGraph:v3];
  if ([v4 count])
  {
    id v5 = [v4 anyNode];
    id v6 = [v5 anniversaryDateComponents];
    if (v6)
    {
      id v7 = [MEMORY[0x1E4F1CA48] array];
      uint64_t v8 = [v6 year];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __79__PGMeaningfulEventLooseRequiredCriteriaFactory__anniversaryCriteriaWithGraph___block_invoke;
      v13[3] = &unk_1E68E6B68;
      uint64_t v17 = v8;
      id v14 = v6;
      id v15 = v3;
      id v9 = v7;
      id v16 = v9;
      [v15 enumerateNodesWithLabel:@"Year" domain:400 usingBlock:v13];
      uint64_t v10 = v16;
      id v11 = v9;
    }
    else
    {
      id v11 = (id)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    id v11 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v11;
}

void __79__PGMeaningfulEventLooseRequiredCriteriaFactory__anniversaryCriteriaWithGraph___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 calendarUnitValue];
  if (*(void *)(a1 + 56) != v3)
  {
    [*(id *)(a1 + 32) setYear:v3];
    id v10 = [MEMORY[0x1E4F76C68] dateFromComponents:*(void *)(a1 + 32) inTimeZone:0];
    id v4 = objc_msgSend(*(id *)(a1 + 40), "dateNodeForLocalDate:");
    if (v4)
    {
      id v5 = [[PGMeaningfulEventRequiredCriteria alloc] initWithIdentifier:@"Anniversary" minimumScore:*(void *)(a1 + 40) graph:0.5];
      id v6 = [PGMeaningfulEventCollectionTrait alloc];
      id v7 = [v4 collection];
      uint64_t v8 = [(PGMeaningfulEventCollectionTrait *)v6 initWithNodes:v7];
      [(PGMeaningfulEventCriteria *)v5 setDatesTrait:v8];

      id v9 = [(PGMeaningfulEventCriteria *)v5 datesTrait];
      [v9 setMinimumScore:1.0];

      [*(id *)(a1 + 48) addObject:v5];
    }
  }
}

+ (id)_nightOutCriteriaArrayWithGraph:(id)a3 sceneTaxonomy:(id)a4
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
  id v9 = [[PGMeaningfulEventPartOfDayTrait alloc] initWithPartOfDay:48];
  [(PGMeaningfulEventTrait *)v9 setMinimumScore:0.6];
  id v10 = [MEMORY[0x1E4F76D68] nightLife];
  id v11 = [a1 _publicEventCriteriaForCategoryWithName:v10 inGraph:v6];

  if (v11)
  {
    [v11 setSignificantPartsOfDayTrait:v9];
    [v8 addObject:v11];
  }
  uint64_t v43 = v11;
  unint64_t v44 = v9;
  id v50 = v8;
  long long v49 = [[PGMeaningfulEventPartOfDayTrait alloc] initWithPartOfDay:48 forbiddenPartOfDay:12];
  [(PGMeaningfulEventTrait *)v49 setMinimumScore:0.3];
  uint64_t v51 = [MEMORY[0x1E4F1CA80] setWithArray:&unk_1F28D3DB0];
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  uint64_t v12 = [&unk_1F28D3D98 countByEnumeratingWithState:&v58 objects:v71 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v59;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v59 != v14) {
          objc_enumerationMutation(&unk_1F28D3D98);
        }
        id v16 = [v7 nodeForName:*(void *)(*((void *)&v58 + 1) + 8 * i)];
        v56[0] = MEMORY[0x1E4F143A8];
        v56[1] = 3221225472;
        v56[2] = __95__PGMeaningfulEventLooseRequiredCriteriaFactory__nightOutCriteriaArrayWithGraph_sceneTaxonomy___block_invoke;
        v56[3] = &unk_1E68EE820;
        id v57 = v51;
        [v16 traverseChildrenUsingNameBlock:v56];
      }
      uint64_t v13 = [&unk_1F28D3D98 countByEnumeratingWithState:&v58 objects:v71 count:16];
    }
    while (v13);
  }
  v45 = v7;
  uint64_t v17 = [v6 sceneNodesForSceneNames:v51];
  v70[0] = @"Nightlife";
  v70[1] = @"Restaurant";
  uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v70 count:2];
  uint64_t v19 = +[PGGraphPOINodeCollection poiNodesForLabels:v18 inGraph:v6];

  if ([v17 count])
  {
    v67[0] = @"minimumDuration";
    v67[1] = @"minimumNumberOfHighConfidenceScenes";
    v68[1] = &unk_1F28D12C0;
    v67[2] = @"usePOIs";
    v68[0] = &unk_1F28D5638;
    v68[2] = MEMORY[0x1E4F1CC38];
    uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v68 forKeys:v67 count:3];
    v69[0] = v20;
    v65[0] = @"minimumDuration";
    v65[1] = @"minimumNumberOfHighConfidenceScenes";
    v66[0] = &unk_1F28D5638;
    v66[1] = &unk_1F28D12D8;
    v65[2] = @"usePOIs";
    v66[2] = MEMORY[0x1E4F1CC28];
    double v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v66 forKeys:v65 count:3];
    v69[1] = v21;
    v63[0] = @"minimumDuration";
    v63[1] = @"minimumNumberOfHighConfidenceScenes";
    v64[0] = &unk_1F28D5648;
    v64[1] = &unk_1F28D12D8;
    v63[2] = @"usePOIs";
    v64[2] = MEMORY[0x1E4F1CC38];
    uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v64 forKeys:v63 count:3];
    v69[2] = v22;
    uint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v69 count:3];

    id v48 = v6;
    long long v47 = +[PGMeaningfulEventRequiredCriteriaFactory locationsTraitNotMatchingPeopleHomeWorkLocationsForGraph:v6];
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    obuint64_t j = v23;
    uint64_t v24 = [obj countByEnumeratingWithState:&v52 objects:v62 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v53;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v53 != v26) {
            objc_enumerationMutation(obj);
          }
          uint64_t v28 = *(void **)(*((void *)&v52 + 1) + 8 * j);
          v29 = [v28 objectForKeyedSubscript:@"minimumDuration"];
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
          uint64_t v35 = [v28 objectForKeyedSubscript:@"usePOIs"];
          int v36 = [v35 BOOLValue];

          int v37 = [[PGMeaningfulEventRequiredCriteria alloc] initWithIdentifier:@"NightOut" minimumScore:v48 graph:0.6];
          [(PGMeaningfulEventCriteria *)v37 setLocationsTrait:v47];
          long long v38 = [[PGMeaningfulEventNumberTrait alloc] initWithNumberValue:3.0];
          [(PGMeaningfulEventCriteria *)v37 setNumberOfPeopleTrait:v38];

          char v39 = [[PGMeaningfulEventSceneCollectionTrait alloc] initWithNodes:v17];
          -[PGMeaningfulEventTrait setMinimumScore:](v39, "setMinimumScore:", 1.0 / (double)(unint64_t)[v17 count]);
          [(PGMeaningfulEventSceneCollectionTrait *)v39 setMinimumNumberOfHighConfidenceAssets:v34];
          [(PGMeaningfulEventCriteria *)v37 setScenesTrait:v39];
          if ([v19 count] && v36)
          {
            long long v40 = [[PGMeaningfulEventCollectionTrait alloc] initWithNodes:v19];
            [(PGMeaningfulEventTrait *)v40 setMinimumScore:0.4];
            [(PGMeaningfulEventCriteria *)v37 setPoisTrait:v40];
          }
          [(PGMeaningfulEventRequiredCriteria *)v37 setMustBeInteresting:0];
          long long v41 = [[PGMeaningfulEventNumberTrait alloc] initWithNumberValue:v31];
          [(PGMeaningfulEventTrait *)v41 setMinimumScore:1.0];
          [(PGMeaningfulEventCriteria *)v37 setMinimumDurationTrait:v41];
          [(PGMeaningfulEventCriteria *)v37 setSignificantPartsOfDayTrait:v49];
          [v50 addObject:v37];
        }
        uint64_t v25 = [obj countByEnumeratingWithState:&v52 objects:v62 count:16];
      }
      while (v25);
    }

    id v6 = v48;
  }

  return v50;
}

uint64_t __95__PGMeaningfulEventLooseRequiredCriteriaFactory__nightOutCriteriaArrayWithGraph_sceneTaxonomy___block_invoke(uint64_t a1, uint64_t a2)
{
  return 0;
}

+ (id)_museumCriteriaArrayForMeaningInferenceWithGraph:(id)a3
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  id v6 = [MEMORY[0x1E4F76D68] artsAndMuseums];
  id v7 = [a1 _publicEventCriteriaForCategoryWithName:v6 inGraph:v4];

  if (v7) {
    [v5 addObject:v7];
  }
  uint64_t v8 = [a1 _museumSceneTraitInGraph:v4 minimumNumberOfHighConfidenceAssets:6];
  v17[0] = @"Museum";
  v17[1] = @"Culture";
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  id v10 = +[PGGraphPOINodeCollection poiNodesForLabels:v9 inGraph:v4];

  if (v8 && [v10 count])
  {
    id v11 = [[PGMeaningfulEventRequiredCriteria alloc] initWithIdentifier:@"Museum" minimumScore:v4 graph:0.4];
    uint64_t v12 = [[PGMeaningfulEventCollectionTrait alloc] initWithNodes:v10];
    [(PGMeaningfulEventTrait *)v12 setMinimumScore:0.1];
    [(PGMeaningfulEventCriteria *)v11 setPoisTrait:v12];
    [(PGMeaningfulEventCriteria *)v11 setScenesTrait:v8];
    uint64_t v13 = [[PGMeaningfulEventPartOfDayTrait alloc] initWithPartOfDay:62];
    [(PGMeaningfulEventTrait *)v13 setMinimumScore:0.2];
    [(PGMeaningfulEventCriteria *)v11 setSignificantPartsOfDayTrait:v13];
    uint64_t v14 = [[PGMeaningfulEventNumberTrait alloc] initWithNumberValue:1800.0];
    [(PGMeaningfulEventTrait *)v14 setMinimumScore:1.0];
    [(PGMeaningfulEventCriteria *)v11 setMinimumDurationTrait:v14];
    id v15 = +[PGMeaningfulEventRequiredCriteriaFactory locationsTraitNotMatchingPeopleHomeWorkLocationsForGraph:v4];
    [(PGMeaningfulEventCriteria *)v11 setLocationsTrait:v15];
    [v5 addObject:v11];
  }
  return v5;
}

+ (id)_museumCriteriaArrayForPublicEventInferenceWithGraph:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [a1 _museumSceneTraitInGraph:v4 minimumNumberOfHighConfidenceAssets:3];
  if (v5)
  {
    id v6 = [[PGMeaningfulEventRequiredCriteria alloc] initWithIdentifier:@"Museum" minimumScore:v4 graph:0.4];
    [(PGMeaningfulEventCriteria *)v6 setScenesTrait:v5];
    id v7 = [[PGMeaningfulEventPartOfDayTrait alloc] initWithPartOfDay:62];
    [(PGMeaningfulEventTrait *)v7 setMinimumScore:0.2];
    [(PGMeaningfulEventCriteria *)v6 setSignificantPartsOfDayTrait:v7];
    v10[0] = v6;
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  }
  else
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v8;
}

+ (id)_festivalCriteriaArrayWithGraph:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  id v6 = [MEMORY[0x1E4F76D68] festivalsAndFairs];
  id v7 = [a1 _publicEventCriteriaForCategoryWithName:v6 inGraph:v4];

  if (v7) {
    [v5 addObject:v7];
  }
  uint64_t v8 = [a1 _concertSceneNodesInGraph:v4];
  uint64_t v9 = [v8 count];
  if (v9)
  {
    unint64_t v10 = v9;
    id v11 = [[PGMeaningfulEventRequiredCriteria alloc] initWithIdentifier:@"Festival" minimumScore:v4 graph:0.4];
    uint64_t v12 = [[PGMeaningfulEventNumberTrait alloc] initWithNumberValue:5.0];
    [(PGMeaningfulEventCriteria *)v11 setNumberOfPeopleTrait:v12];

    uint64_t v13 = [[PGMeaningfulEventSceneCollectionTrait alloc] initWithNodes:v8];
    [(PGMeaningfulEventTrait *)v13 setMinimumScore:1.0 / (double)v10];
    [(PGMeaningfulEventSceneCollectionTrait *)v13 setMinimumNumberOfHighConfidenceAssets:5];
    [(PGMeaningfulEventCriteria *)v11 setScenesTrait:v13];
    uint64_t v14 = [[PGMeaningfulEventNumberTrait alloc] initWithNumberValue:10800.0];
    [(PGMeaningfulEventTrait *)v14 setMinimumScore:1.0];
    [(PGMeaningfulEventCriteria *)v11 setMinimumDurationTrait:v14];
    [v5 addObject:v11];
  }
  return v5;
}

+ (id)_concertCriteriaArrayForPublicEventInferenceWithGraph:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  id v6 = [a1 _concertSceneNodesInGraph:v4];
  id v7 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"performance", @"nightclub", 0);
  uint64_t v8 = [v4 sceneNodesForSceneNames:v7];
  uint64_t v9 = [v6 collectionByFormingUnionWith:v8];

  uint64_t v10 = [v9 count];
  if (v10)
  {
    unint64_t v11 = v10;
    uint64_t v12 = [[PGMeaningfulEventRequiredCriteria alloc] initWithIdentifier:@"Concert" minimumScore:v4 graph:0.4];
    uint64_t v13 = [[PGMeaningfulEventSceneCollectionTrait alloc] initWithNodes:v9];
    [(PGMeaningfulEventTrait *)v13 setMinimumScore:1.0 / (double)v11];
    [(PGMeaningfulEventSceneCollectionTrait *)v13 setMinimumNumberOfHighConfidenceAssets:2];
    [(PGMeaningfulEventCriteria *)v12 setScenesTrait:v13];
    uint64_t v14 = [[PGMeaningfulEventPartOfDayTrait alloc] initWithPartOfDay:60];
    [(PGMeaningfulEventTrait *)v14 setMinimumScore:0.4];
    [(PGMeaningfulEventCriteria *)v12 setSignificantPartsOfDayTrait:v14];
    [v5 addObject:v12];
  }
  return v5;
}

+ (id)_concertCriteriaArrayForMeaningInferenceWithGraph:(id)a3
{
  v19[5] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  id v6 = [MEMORY[0x1E4F76D68] musicConcerts];
  id v7 = [a1 _publicEventCriteriaForCategoryWithName:v6 inGraph:v4];

  if (v7) {
    [v5 addObject:v7];
  }
  uint64_t v8 = [a1 _concertSceneNodesInGraph:v4];
  v19[0] = @"Nightlife";
  v19[1] = @"Culture";
  v19[2] = @"Entertainment";
  v19[3] = @"Stadium";
  v19[4] = @"Performance";
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:5];
  uint64_t v10 = +[PGGraphPOINodeCollection poiNodesForLabels:v9 inGraph:v4];

  uint64_t v11 = [v8 count];
  if (v11)
  {
    unint64_t v12 = v11;
    uint64_t v13 = [[PGMeaningfulEventRequiredCriteria alloc] initWithIdentifier:@"Concert" minimumScore:v4 graph:0.4];
    uint64_t v14 = [[PGMeaningfulEventNumberTrait alloc] initWithNumberValue:1.0];
    [(PGMeaningfulEventCriteria *)v13 setNumberOfPeopleTrait:v14];

    if ([v10 count])
    {
      id v15 = [[PGMeaningfulEventCollectionTrait alloc] initWithNodes:v10];
      [(PGMeaningfulEventTrait *)v15 setMinimumScore:0.1];
      [(PGMeaningfulEventCriteria *)v13 setPoisTrait:v15];
    }
    id v16 = [[PGMeaningfulEventSceneCollectionTrait alloc] initWithNodes:v8];
    [(PGMeaningfulEventTrait *)v16 setMinimumScore:1.0 / (double)v12];
    [(PGMeaningfulEventSceneCollectionTrait *)v16 setMinimumNumberOfHighConfidenceAssets:1];
    [(PGMeaningfulEventCriteria *)v13 setScenesTrait:v16];
    uint64_t v17 = [[PGMeaningfulEventNumberTrait alloc] initWithNumberValue:300.0];
    [(PGMeaningfulEventTrait *)v17 setMinimumScore:1.0];
    [(PGMeaningfulEventCriteria *)v13 setMinimumDurationTrait:v17];
    [v5 addObject:v13];
  }
  return v5;
}

+ (id)_performanceCriteriaWithGraph:(id)a3
{
  void v13[4] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"entertainer", @"ballet_dancer", @"acrobat", @"clown", @"deejay", @"singer", @"rodeo", @"dancing", @"swing_dancing", @"hula", @"bellydance", @"breakdancing", @"samba", @"karaoke", @"airshow", @"concert", @"orchestra",
    @"juggling",
    @"magic",
    @"circus",
    @"ballet",
    @"parade",
    @"performance",
  id v4 = 0);
  id v5 = [v3 sceneNodesForSceneNames:v4];
  if ([v5 count])
  {
    v13[0] = @"Nightlife";
    v13[1] = @"Culture";
    v13[2] = @"Entertainment";
    v13[3] = @"Performance";
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:4];
    id v7 = +[PGGraphPOINodeCollection poiNodesForLabels:v6 inGraph:v3];

    uint64_t v8 = [[PGMeaningfulEventRequiredCriteria alloc] initWithIdentifier:@"Performance" minimumScore:v3 graph:0.4];
    uint64_t v9 = [[PGMeaningfulEventNumberTrait alloc] initWithNumberValue:2.0];
    [(PGMeaningfulEventCriteria *)v8 setNumberOfPeopleTrait:v9];

    if ([v7 count])
    {
      uint64_t v10 = [[PGMeaningfulEventCollectionTrait alloc] initWithNodes:v7];
      [(PGMeaningfulEventTrait *)v10 setMinimumScore:0.1];
      [(PGMeaningfulEventCriteria *)v8 setPoisTrait:v10];
    }
    uint64_t v11 = [[PGMeaningfulEventSceneCollectionTrait alloc] initWithNodes:v5];
    -[PGMeaningfulEventTrait setMinimumScore:](v11, "setMinimumScore:", 1.0 / (double)(unint64_t)[v5 count]);
    [(PGMeaningfulEventSceneCollectionTrait *)v11 setMinimumNumberOfHighConfidenceAssets:1];
    [(PGMeaningfulEventCriteria *)v8 setScenesTrait:v11];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

+ (id)_danceCriteriaWithGraph:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F76D68];
  id v5 = a3;
  id v6 = [v4 dance];
  id v7 = [a1 _publicEventCriteriaForCategoryWithName:v6 inGraph:v5];

  return v7;
}

+ (id)_theaterCriteriaWithGraph:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F76D68];
  id v5 = a3;
  id v6 = [v4 theater];
  id v7 = [a1 _publicEventCriteriaForCategoryWithName:v6 inGraph:v5];

  return v7;
}

+ (id)_winterSportCriteriaWithGraph:(id)a3 sceneTaxonomy:(id)a4
{
  v14[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [a1 _winterSportSceneNodesWithGraph:v6 sceneTaxonomy:a4];
  if ([v7 count])
  {
    v14[0] = @"Mountain";
    v14[1] = @"Nature";
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
    uint64_t v9 = +[PGGraphROINodeCollection roiNodesForLabels:v8 inGraph:v6];

    uint64_t v10 = [[PGMeaningfulEventRequiredCriteria alloc] initWithIdentifier:@"WinterSport" minimumScore:v6 graph:0.6];
    uint64_t v11 = [[PGMeaningfulEventSceneCollectionTrait alloc] initWithNodes:v7];
    -[PGMeaningfulEventTrait setMinimumScore:](v11, "setMinimumScore:", 1.0 / (double)(unint64_t)[v7 count]);
    [(PGMeaningfulEventCriteria *)v10 setScenesTrait:v11];
    if ([v9 count])
    {
      unint64_t v12 = [[PGMeaningfulEventCollectionTrait alloc] initWithNodes:v9];
      [(PGMeaningfulEventTrait *)v12 setMinimumScore:0.25];
      [(PGMeaningfulEventCriteria *)v10 setRoisTrait:v12];
    }
    [(PGMeaningfulEventRequiredCriteria *)v10 setMustBeInteresting:0];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

+ (id)_divingCriteriaWithGraph:(id)a3 sceneTaxonomy:(id)a4
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [a1 _divingSceneNodesWithGraph:v6];
  v21[0] = @"Water";
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
  uint64_t v10 = +[PGGraphROINodeCollection roiNodesForLabels:v9 inGraph:v6];

  if ([v8 count] && objc_msgSend(v10, "count"))
  {
    uint64_t v11 = [a1 _winterSportSceneNodesWithGraph:v6 sceneTaxonomy:v7];
    unint64_t v12 = [a1 _negativeHikingSceneNodesWithGraph:v6];
    uint64_t v13 = [v11 collectionByFormingUnionWith:v12];

    uint64_t v14 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"surfing", @"surfboard", @"watersport", @"jetski", @"kiteboarding", @"wakeboarding", 0);
    id v15 = [v6 sceneNodesForSceneNames:v14];
    id v16 = [v13 collectionByFormingUnionWith:v15];

    uint64_t v17 = [[PGMeaningfulEventRequiredCriteria alloc] initWithIdentifier:@"Diving" minimumScore:v6 graph:0.7];
    uint64_t v18 = [[PGMeaningfulEventSceneCollectionTrait alloc] initWithNodes:v8 negativeNodes:v16];
    -[PGMeaningfulEventTrait setMinimumScore:](v18, "setMinimumScore:", 1.0 / (double)(unint64_t)[v8 count]);
    [(PGMeaningfulEventCriteria *)v17 setScenesTrait:v18];
    uint64_t v19 = [[PGMeaningfulEventCollectionTrait alloc] initWithNodes:v10];
    [(PGMeaningfulEventTrait *)v19 setMinimumScore:0.25];
    [(PGMeaningfulEventCriteria *)v17 setRoisTrait:v19];
    [(PGMeaningfulEventRequiredCriteria *)v17 setMustBeInteresting:0];
  }
  else
  {
    uint64_t v17 = 0;
  }

  return v17;
}

+ (id)_sportEventCriteriaArrayForPublicEventInferenceWithGraph:(id)a3
{
  void v12[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [a1 _sportEventScenesTraitWithGraph:v4];
  id v6 = v5;
  if (v5)
  {
    [v5 setMinimumNumberOfHighConfidenceAssets:2];
    id v7 = [[PGMeaningfulEventRequiredCriteria alloc] initWithIdentifier:@"SportEvent" minimumScore:v4 graph:0.4];
    [(PGMeaningfulEventCriteria *)v7 setScenesTrait:v6];
    uint64_t v8 = [a1 _sportEventScenesTraitWithGraph:v4];
    [v8 setMinimumNumberOfHighConfidenceAssets:7];
    uint64_t v9 = [[PGMeaningfulEventRequiredCriteria alloc] initWithIdentifier:@"SportEvent" minimumScore:v4 graph:0.4];
    [(PGMeaningfulEventCriteria *)v9 setScenesTrait:v8];
    v12[0] = v7;
    v12[1] = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v10;
}

+ (id)_sportEventCriteriaArrayForMeaningInferenceWithGraph:(id)a3
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  id v6 = [MEMORY[0x1E4F76D68] sports];
  id v7 = [a1 _publicEventCriteriaForCategoryWithName:v6 inGraph:v4];

  if (v7) {
    [v5 addObject:v7];
  }
  uint64_t v8 = [a1 _sportEventScenesTraitWithGraph:v4];
  v19[0] = @"Entertainment";
  v19[1] = @"Stadium";
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
  uint64_t v10 = +[PGGraphPOINodeCollection poiNodesForLabels:v9 inGraph:v4];

  uint64_t v11 = [v4 anyNodeForLabel:@"Park" domain:501 properties:0];
  if (v8 && [v10 count])
  {
    unint64_t v12 = [[PGMeaningfulEventRequiredCriteria alloc] initWithIdentifier:@"SportEvent" minimumScore:v4 graph:0.4];
    [(PGMeaningfulEventCriteria *)v12 setScenesTrait:v8];
    uint64_t v13 = [[PGMeaningfulEventNumberTrait alloc] initWithNumberValue:1.0];
    [(PGMeaningfulEventTrait *)v13 setMinimumScore:1.0];
    [(PGMeaningfulEventCriteria *)v12 setNumberOfPeopleTrait:v13];
    uint64_t v14 = [[PGMeaningfulEventCollectionTrait alloc] initWithNodes:v10];
    [(PGMeaningfulEventTrait *)v14 setMinimumScore:0.25];
    [(PGMeaningfulEventCriteria *)v12 setPoisTrait:v14];
    if (v11)
    {
      uint64_t v17 = MEMORY[0x1E4F143A8];
      id v18 = v11;
      id v15 = [(PGMeaningfulEventCriteria *)v12 poisTrait];
      [v15 setAdditionalMatchingBlock:&v17];
    }
    [v5 addObject:v12];
  }
  return v5;
}

BOOL __102__PGMeaningfulEventLooseRequiredCriteriaFactory__sportEventCriteriaArrayForMeaningInferenceWithGraph___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  if ([v5 containsNode:*(void *)(a1 + 32)])
  {
    id v7 = [MEMORY[0x1E4F1CA80] set];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __102__PGMeaningfulEventLooseRequiredCriteriaFactory__sportEventCriteriaArrayForMeaningInferenceWithGraph___block_invoke_2;
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

void __102__PGMeaningfulEventLooseRequiredCriteriaFactory__sportEventCriteriaArrayForMeaningInferenceWithGraph___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = [a2 collection];
  id v6 = [v5 areaNodes];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __102__PGMeaningfulEventLooseRequiredCriteriaFactory__sportEventCriteriaArrayForMeaningInferenceWithGraph___block_invoke_3;
  v9[3] = &unk_1E68E73D0;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  id v10 = v7;
  uint64_t v11 = v8;
  uint64_t v12 = a3;
  [v6 enumerateNodesUsingBlock:v9];
}

void __102__PGMeaningfulEventLooseRequiredCriteriaFactory__sportEventCriteriaArrayForMeaningInferenceWithGraph___block_invoke_3(uint64_t a1, void *a2, unsigned char *a3)
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

+ (id)_celebrationCriteriaWithGraph:(id)a3
{
  id v3 = a3;
  id v4 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"graduation", @"disco_ball", @"ceremony", @"wedding", 0);
  char v5 = [v3 sceneNodesForSceneNames:v4];
  if ([v5 count])
  {
    id v6 = [[PGMeaningfulEventRequiredCriteria alloc] initWithIdentifier:@"Celebration" minimumScore:v3 graph:0.4];
    id v7 = [[PGMeaningfulEventNumberTrait alloc] initWithNumberValue:2.0];
    [(PGMeaningfulEventTrait *)v7 setMinimumScore:1.0];
    [(PGMeaningfulEventCriteria *)v6 setNumberOfPeopleTrait:v7];
    uint64_t v8 = [[PGMeaningfulEventSceneCollectionTrait alloc] initWithNodes:v5];
    -[PGMeaningfulEventTrait setMinimumScore:](v8, "setMinimumScore:", 1.0 / (double)(unint64_t)[v5 count]);
    [(PGMeaningfulEventSceneCollectionTrait *)v8 setMinimumNumberOfHighConfidenceAssets:5];
    [(PGMeaningfulEventCriteria *)v6 setScenesTrait:v8];
    BOOL v9 = [[PGMeaningfulEventNumberTrait alloc] initWithNumberValue:5400.0];
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
  v19[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [a1 _weddingSceneNodesWithGraph:v6 includeWedding:1 sceneTaxonomy:a4];
  if ([v7 count])
  {
    uint64_t v8 = [[PGMeaningfulEventRequiredCriteria alloc] initWithIdentifier:@"Wedding" minimumScore:v6 graph:0.4];
    BOOL v9 = [[PGMeaningfulEventNumberTrait alloc] initWithNumberValue:2.0];
    [(PGMeaningfulEventTrait *)v9 setMinimumScore:1.0];
    [(PGMeaningfulEventCriteria *)v8 setNumberOfPeopleTrait:v9];
    id v10 = [[PGMeaningfulEventSceneCollectionTrait alloc] initWithNodes:v7];
    -[PGMeaningfulEventTrait setMinimumScore:](v10, "setMinimumScore:", 2.0 / (double)(unint64_t)[v7 count]);
    [(PGMeaningfulEventSceneCollectionTrait *)v10 setMinimumNumberOfHighConfidenceAssets:2];
    [(PGMeaningfulEventCriteria *)v8 setScenesTrait:v10];
    uint64_t v11 = [[PGMeaningfulEventNumberTrait alloc] initWithNumberValue:3600.0];
    [(PGMeaningfulEventTrait *)v11 setMinimumScore:1.0];
    [(PGMeaningfulEventCriteria *)v8 setMinimumDurationTrait:v11];
    uint64_t v12 = [[PGMeaningfulEventPartOfDayTrait alloc] initWithPartOfDay:28];
    [(PGMeaningfulEventTrait *)v12 setMinimumScore:0.1];
    [(PGMeaningfulEventCriteria *)v8 setAllPartsOfDayTrait:v12];
    [(PGMeaningfulEventRequiredCriteria *)v8 setMustBeInteresting:0];
    uint64_t v13 = [[PGMeaningfulEventRequiredCriteria alloc] initWithIdentifier:@"Wedding" minimumScore:v6 graph:0.4];
    uint64_t v14 = [[PGMeaningfulEventNumberTrait alloc] initWithNumberValue:10.0];

    [(PGMeaningfulEventTrait *)v14 setMinimumScore:1.0];
    [(PGMeaningfulEventCriteria *)v13 setNumberOfPeopleTrait:v14];
    id v15 = [[PGMeaningfulEventSceneCollectionTrait alloc] initWithNodes:v7];

    -[PGMeaningfulEventTrait setMinimumScore:](v15, "setMinimumScore:", 1.0 / (double)(unint64_t)[v7 count]);
    [(PGMeaningfulEventSceneCollectionTrait *)v15 setMinimumNumberOfHighConfidenceAssets:9];
    [(PGMeaningfulEventCriteria *)v13 setScenesTrait:v15];
    uint64_t v16 = [[PGMeaningfulEventNumberTrait alloc] initWithNumberValue:1800.0];

    [(PGMeaningfulEventTrait *)v16 setMinimumScore:1.0];
    [(PGMeaningfulEventCriteria *)v13 setMinimumDurationTrait:v16];
    [(PGMeaningfulEventCriteria *)v13 setAllPartsOfDayTrait:v12];
    [(PGMeaningfulEventRequiredCriteria *)v13 setMustBeInteresting:0];
    v19[0] = v8;
    v19[1] = v13;
    char v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
  }
  else
  {
    char v17 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v17;
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

  id v15 = [v14 collectionByFormingUnionWith:v12];

  uint64_t v16 = [a1 _weddingSceneNodesWithGraph:v9 includeWedding:1 sceneTaxonomy:v11];

  char v17 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"grave", 0);
  id v18 = [v9 sceneNodesForSceneNames:v17];
  uint64_t v19 = [v18 collectionByFormingUnionWith:v16];

  uint64_t v20 = [MEMORY[0x1E4F1CA48] array];
  double v21 = [MEMORY[0x1E4F1CA48] array];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __134__PGMeaningfulEventLooseRequiredCriteriaFactory__birthdayCriteriaWithGraph_strongBirthdayCriteria_weakBirthdayCriteria_sceneTaxonomy___block_invoke;
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
  uint64_t v28 = _Block_copy(aBlock);
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __134__PGMeaningfulEventLooseRequiredCriteriaFactory__birthdayCriteriaWithGraph_strongBirthdayCriteria_weakBirthdayCriteria_sceneTaxonomy___block_invoke_5;
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

void __134__PGMeaningfulEventLooseRequiredCriteriaFactory__birthdayCriteriaWithGraph_strongBirthdayCriteria_weakBirthdayCriteria_sceneTaxonomy___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 birthdayDateComponents];
  uint64_t v5 = [v3 potentialBirthdayDateComponents];
  id v6 = (void *)v5;
  if (v4 | v5)
  {
    if (v4) {
      id v7 = (void *)v4;
    }
    else {
      id v7 = (void *)v5;
    }
    id v8 = v7;
    uint64_t v9 = [v8 year];
    id v10 = [MEMORY[0x1E4F1CA80] set];
    id v11 = [MEMORY[0x1E4F1CA80] set];
    id v12 = a1[4];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __134__PGMeaningfulEventLooseRequiredCriteriaFactory__birthdayCriteriaWithGraph_strongBirthdayCriteria_weakBirthdayCriteria_sceneTaxonomy___block_invoke_2;
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
    aBlock[2] = __134__PGMeaningfulEventLooseRequiredCriteriaFactory__birthdayCriteriaWithGraph_strongBirthdayCriteria_weakBirthdayCriteria_sceneTaxonomy___block_invoke_4;
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
      id v18 = v16[2](v16, v4 != 0, v14, 1);

      if (v18) {
        [a1[9] addObject:v18];
      }
    }
    if ([v15 count])
    {
      uint64_t v19 = v16[2](v16, 0, v15, 0);
      if (v19) {
        [a1[8] addObject:v19];
      }
    }
  }
}

uint64_t __134__PGMeaningfulEventLooseRequiredCriteriaFactory__birthdayCriteriaWithGraph_strongBirthdayCriteria_weakBirthdayCriteria_sceneTaxonomy___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __134__PGMeaningfulEventLooseRequiredCriteriaFactory__birthdayCriteriaWithGraph_strongBirthdayCriteria_weakBirthdayCriteria_sceneTaxonomy___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x1D25FED50]();
  uint64_t v5 = [v3 calendarUnitValue];
  if (v5 > *(void *)(a1 + 64))
  {
    [*(id *)(a1 + 32) setYear:v5];
    id v6 = [MEMORY[0x1E4F76C68] dateFromComponents:*(void *)(a1 + 32) inTimeZone:0];
    id v7 = [*(id *)(a1 + 40) dateNodeForLocalDate:v6];
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
              uint64_t v19 = &v18;
              uint64_t v20 = 0x2020000000;
              char v21 = 0;
              v17[0] = MEMORY[0x1E4F143A8];
              v17[1] = 3221225472;
              v17[2] = __134__PGMeaningfulEventLooseRequiredCriteriaFactory__birthdayCriteriaWithGraph_strongBirthdayCriteria_weakBirthdayCriteria_sceneTaxonomy___block_invoke_3;
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

PGMeaningfulEventRequiredCriteria *__134__PGMeaningfulEventLooseRequiredCriteriaFactory__birthdayCriteriaWithGraph_strongBirthdayCriteria_weakBirthdayCriteria_sceneTaxonomy___block_invoke_4(uint64_t a1, int a2, void *a3, int a4)
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
    uint64_t v31 = [[PGMeaningfulEventPartOfDayTrait alloc] initWithPartOfDay:58];
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
    [(PGMeaningfulEventSceneCollectionTrait *)v27 setMinimumNumberOfHighConfidenceAssets:1];
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

unint64_t __134__PGMeaningfulEventLooseRequiredCriteriaFactory__birthdayCriteriaWithGraph_strongBirthdayCriteria_weakBirthdayCriteria_sceneTaxonomy___block_invoke_3(uint64_t a1, void *a2, unsigned char *a3)
{
  unint64_t result = [a2 category];
  if (result <= 4 && ((1 << result) & 0x16) != 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

+ (id)_requiredCriteriaForIdentifiers:(id)a3 graph:(id)a4 sceneTaxonomy:(id)a5
{
  v62[3] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [MEMORY[0x1E4F1CA60] dictionary];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __101__PGMeaningfulEventLooseRequiredCriteriaFactory__requiredCriteriaForIdentifiers_graph_sceneTaxonomy___block_invoke;
  aBlock[3] = &unk_1E68E7330;
  id v12 = v11;
  id v61 = v12;
  id v13 = (void (**)(void *, __CFString *, void *))_Block_copy(aBlock);
  uint64_t v14 = MEMORY[0x1E4F1CBF0];
  if (v8)
  {
    if ([v8 containsObject:@"Wedding"])
    {
      id v15 = [a1 _weddingCriteriaWithGraph:v9 sceneTaxonomy:v10];
      [v12 setObject:v15 forKeyedSubscript:@"Wedding"];
    }
    if (([v8 containsObject:@"Birthday"] & 1) == 0
      && ([v8 containsObject:@"WeakBirthday"] & 1) == 0)
    {
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v16 = [a1 _weddingCriteriaWithGraph:v9 sceneTaxonomy:v10];
    [v12 setObject:v16 forKeyedSubscript:@"Wedding"];
  }
  id v58 = 0;
  id v59 = 0;
  [a1 _birthdayCriteriaWithGraph:v9 strongBirthdayCriteria:&v59 weakBirthdayCriteria:&v58 sceneTaxonomy:v10];
  id v17 = v59;
  id v18 = v58;
  if (v8)
  {
    if ([v8 containsObject:@"Birthday"]) {
      [v12 setObject:v17 forKeyedSubscript:@"Birthday"];
    }
    if (([v8 containsObject:@"WeakBirthday"] & 1) == 0)
    {

      goto LABEL_15;
    }
  }
  else
  {
    [v12 setObject:v17 forKeyedSubscript:@"Birthday"];
  }
  [v12 setObject:v18 forKeyedSubscript:@"WeakBirthday"];

  if (!v8)
  {
    uint64_t v20 = [a1 _anniversaryCriteriaWithGraph:v9];
    [v12 setObject:v20 forKeyedSubscript:@"Anniversary"];

    goto LABEL_20;
  }
LABEL_15:
  if ([v8 containsObject:@"Anniversary"])
  {
    id v19 = [a1 _anniversaryCriteriaWithGraph:v9];
    [v12 setObject:v19 forKeyedSubscript:@"Anniversary"];
  }
  if (([v8 containsObject:@"Celebration"] & 1) == 0)
  {
LABEL_21:
    if ([v8 containsObject:@"Performance"])
    {
      uint64_t v22 = [a1 _performanceCriteriaWithGraph:v9];
      v13[2](v13, @"Performance", v22);
    }
    if (([v8 containsObject:@"Concert"] & 1) == 0) {
      goto LABEL_30;
    }
    goto LABEL_26;
  }
LABEL_20:
  uint64_t v21 = [a1 _celebrationCriteriaWithGraph:v9];
  v13[2](v13, @"Celebration", v21);

  if (v8) {
    goto LABEL_21;
  }
  uint64_t v23 = [a1 _performanceCriteriaWithGraph:v9];
  v13[2](v13, @"Performance", v23);

LABEL_26:
  uint64_t v24 = [a1 _concertCriteriaArrayForMeaningInferenceWithGraph:v9];
  char v25 = (void *)v24;
  if (v24) {
    uint64_t v26 = v24;
  }
  else {
    uint64_t v26 = v14;
  }
  [v12 setObject:v26 forKeyedSubscript:@"Concert"];

  if (!v8)
  {
    id v28 = [a1 _festivalCriteriaArrayWithGraph:v9];
    [v12 setObject:v28 forKeyedSubscript:@"Festival"];

    goto LABEL_35;
  }
LABEL_30:
  if ([v8 containsObject:@"Festival"])
  {
    id v27 = [a1 _festivalCriteriaArrayWithGraph:v9];
    [v12 setObject:v27 forKeyedSubscript:@"Festival"];
  }
  if (([v8 containsObject:@"Theater"] & 1) == 0)
  {
LABEL_36:
    if ([v8 containsObject:@"Dance"])
    {
      id v30 = [a1 _danceCriteriaWithGraph:v9];
      v13[2](v13, @"Dance", v30);
    }
    if (([v8 containsObject:@"Hiking"] & 1) == 0) {
      goto LABEL_42;
    }
    goto LABEL_41;
  }
LABEL_35:
  uint64_t v29 = [a1 _theaterCriteriaWithGraph:v9];
  v13[2](v13, @"Theater", v29);

  if (v8) {
    goto LABEL_36;
  }
  uint64_t v31 = [a1 _danceCriteriaWithGraph:v9];
  v13[2](v13, @"Dance", v31);

LABEL_41:
  id v32 = [a1 _hikingCriteriaWithGraph:v9 sceneTaxonomy:v10];
  [v12 setObject:v32 forKeyedSubscript:@"Hiking"];

  if (!v8)
  {
    uint64_t v34 = [a1 _climbingCriteriaWithGraph:v9 sceneTaxonomy:v10];
    v13[2](v13, @"Climbing", v34);

    goto LABEL_47;
  }
LABEL_42:
  if ([v8 containsObject:@"Climbing"])
  {
    id v33 = [a1 _climbingCriteriaWithGraph:v9 sceneTaxonomy:v10];
    v13[2](v13, @"Climbing", v33);
  }
  if (([v8 containsObject:@"Beaching"] & 1) == 0)
  {
LABEL_48:
    if ([v8 containsObject:@"SportEvent"])
    {
      uint64_t v36 = [a1 _sportEventCriteriaArrayForMeaningInferenceWithGraph:v9];
      long long v37 = (void *)v36;
      if (v36) {
        uint64_t v38 = v36;
      }
      else {
        uint64_t v38 = v14;
      }
      [v12 setObject:v38 forKeyedSubscript:@"SportEvent"];
    }
    if (([v8 containsObject:@"WinterSport"] & 1) == 0) {
      goto LABEL_60;
    }
    goto LABEL_59;
  }
LABEL_47:
  long long v35 = [a1 _beachingCriteriaWithGraph:v9 sceneTaxonomy:v10];
  v13[2](v13, @"Beaching", v35);

  if (v8) {
    goto LABEL_48;
  }
  uint64_t v39 = [a1 _sportEventCriteriaArrayForMeaningInferenceWithGraph:v9];
  uint64_t v40 = (void *)v39;
  if (v39) {
    uint64_t v41 = v39;
  }
  else {
    uint64_t v41 = v14;
  }
  [v12 setObject:v41 forKeyedSubscript:@"SportEvent"];

LABEL_59:
  id v42 = [a1 _winterSportCriteriaWithGraph:v9 sceneTaxonomy:v10];
  v13[2](v13, @"WinterSport", v42);

  if (!v8)
  {
    v45 = [a1 _divingCriteriaWithGraph:v9 sceneTaxonomy:v10];
    v13[2](v13, @"Diving", v45);

    v62[0] = @"Lunch";
    v62[1] = @"Dinner";
    v62[2] = @"Breakfast";
    unint64_t v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:v62 count:3];
    goto LABEL_69;
  }
LABEL_60:
  if ([v8 containsObject:@"Diving"])
  {
    uint64_t v43 = [a1 _divingCriteriaWithGraph:v9 sceneTaxonomy:v10];
    v13[2](v13, @"Diving", v43);
  }
  unint64_t v44 = [MEMORY[0x1E4F1CA48] array];
  if ([v8 containsObject:@"Lunch"]) {
    [v44 addObject:@"Lunch"];
  }
  if ([v8 containsObject:@"Dinner"]) {
    [v44 addObject:@"Dinner"];
  }
  if ([v8 containsObject:@"Breakfast"]) {
    [v44 addObject:@"Breakfast"];
  }
LABEL_69:
  if ([v44 count])
  {
    long long v46 = [a1 _restaurantCriteriaByCriteriaForIdentifiers:v44 withGraph:v9 sceneTaxonomy:v10];
    [v12 addEntriesFromDictionary:v46];
  }
  if (v8)
  {
    if ([v8 containsObject:@"NightOut"])
    {
      long long v47 = [a1 _nightOutCriteriaArrayWithGraph:v9 sceneTaxonomy:v10];
      [v12 setObject:v47 forKeyedSubscript:@"NightOut"];
    }
    if (([v8 containsObject:@"Entertainment"] & 1) == 0)
    {
LABEL_78:
      if ([v8 containsObject:@"AmusementPark"])
      {
        id v50 = [a1 _amusementParkCriteriaArrayWithGraph:v9 sceneTaxonomy:v10];
        [v12 setObject:v50 forKeyedSubscript:@"AmusementPark"];
      }
      if (([v8 containsObject:@"Museum"] & 1) == 0) {
        goto LABEL_87;
      }
      goto LABEL_83;
    }
  }
  else
  {
    id v48 = [a1 _nightOutCriteriaArrayWithGraph:v9 sceneTaxonomy:v10];
    [v12 setObject:v48 forKeyedSubscript:@"NightOut"];
  }
  long long v49 = [a1 _entertainmentCriteriaWithGraph:v9];
  v13[2](v13, @"Entertainment", v49);

  if (v8) {
    goto LABEL_78;
  }
  uint64_t v51 = [a1 _amusementParkCriteriaArrayWithGraph:v9 sceneTaxonomy:v10];
  [v12 setObject:v51 forKeyedSubscript:@"AmusementPark"];

LABEL_83:
  uint64_t v52 = [a1 _museumCriteriaArrayForMeaningInferenceWithGraph:v9];
  long long v53 = (void *)v52;
  if (v52) {
    uint64_t v54 = v52;
  }
  else {
    uint64_t v54 = v14;
  }
  [v12 setObject:v54 forKeyedSubscript:@"Museum"];

  if (!v8) {
    goto LABEL_88;
  }
LABEL_87:
  if ([v8 containsObject:@"Gathering"])
  {
LABEL_88:
    long long v55 = [a1 _socialGroupGatheringCriteriaWithGraph:v9];
    [v12 setObject:v55 forKeyedSubscript:@"Gathering"];
  }
  id v56 = v12;

  return v56;
}

void __101__PGMeaningfulEventLooseRequiredCriteriaFactory__requiredCriteriaForIdentifiers_graph_sceneTaxonomy___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v9 = a3;
    uint64_t v5 = (void *)MEMORY[0x1E4F1C978];
    id v6 = a3;
    id v7 = a2;
    id v8 = [v5 arrayWithObjects:&v9 count:1];
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, v7, v9, v10);
  }
}

+ (id)requiredCriteriaForIdentifiers:(id)a3 graph:(id)a4 sceneTaxonomy:(id)a5
{
  id v8 = (void *)MEMORY[0x1E4F1CAD0];
  id v9 = a5;
  id v10 = a4;
  id v11 = [v8 setWithArray:a3];
  id v12 = [a1 _requiredCriteriaForIdentifiers:v11 graph:v10 sceneTaxonomy:v9];

  return v12;
}

@end
@interface PGMeaningfulEventRequiredCriteriaFactory
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
+ (id)_requiredCriteriaForIdentifiers:(id)a3 inferenceType:(unint64_t)a4 graph:(id)a5 sceneTaxonomy:(id)a6;
+ (id)_restaurantCriteriaByCriteriaForIdentifiers:(id)a3 withGraph:(id)a4 sceneTaxonomy:(id)a5;
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
+ (id)availableMeaningLabels;
+ (id)availablePersonActivityMeaningLabels;
+ (id)locationsTraitNotMatchingFrequentLocationsForGraph:(id)a3;
+ (id)locationsTraitNotMatchingPeopleHomeWorkLocationsForGraph:(id)a3;
+ (id)locationsTraitNotMatchingPeopleWorkLocationsForGraph:(id)a3;
+ (id)requiredCriteriaByIdentifierWithGraph:(id)a3 inferenceType:(unint64_t)a4 sceneTaxonomy:(id)a5;
+ (id)requiredCriteriaForIdentifiers:(id)a3 inferenceType:(unint64_t)a4 graph:(id)a5 sceneTaxonomy:(id)a6;
+ (void)_birthdayCriteriaWithGraph:(id)a3 strongBirthdayCriteria:(id *)a4 weakBirthdayCriteria:(id *)a5 sceneTaxonomy:(id)a6;
@end

@implementation PGMeaningfulEventRequiredCriteriaFactory

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

+ (id)locationsTraitNotMatchingPeopleWorkLocationsForGraph:(id)a3
{
  v3 = +[PGGraphHomeWorkNodeCollection workNodesInGraph:a3];
  v4 = [v3 addressNodes];

  id v5 = [[PGMeaningfulEventLocationCollectionTrait alloc] initWithNodes:0 negativeNodes:v4];
  [(PGMeaningfulEventTrait *)v5 setMinimumScore:1.0];
  [(PGMeaningfulEventLocationCollectionTrait *)v5 setUseStrictNegativeNodesMatching:1];

  return v5;
}

+ (id)locationsTraitNotMatchingPeopleHomeWorkLocationsForGraph:(id)a3
{
  v3 = +[PGGraphNodeCollection nodesInGraph:a3];
  v4 = [v3 addressNodes];

  id v5 = [[PGMeaningfulEventLocationCollectionTrait alloc] initWithNodes:0 negativeNodes:v4];
  [(PGMeaningfulEventTrait *)v5 setMinimumScore:1.0];
  [(PGMeaningfulEventLocationCollectionTrait *)v5 setUseStrictNegativeNodesMatching:1];

  return v5;
}

+ (id)locationsTraitNotMatchingFrequentLocationsForGraph:(id)a3
{
  id v3 = a3;
  v4 = [v3 largeFrequentLocationNodes];
  id v5 = [(MAElementCollection *)[PGGraphFrequentLocationNodeCollection alloc] initWithSet:v4 graph:v3];

  id v6 = [PGMeaningfulEventLocationCollectionTrait alloc];
  v7 = [(PGGraphFrequentLocationNodeCollection *)v5 addressNodes];
  v8 = [(PGMeaningfulEventLocationCollectionTrait *)v6 initWithNodes:0 negativeNodes:v7];

  [(PGMeaningfulEventTrait *)v8 setMinimumScore:1.0];
  [(PGMeaningfulEventLocationCollectionTrait *)v8 setUseStrictNegativeNodesMatching:1];

  return v8;
}

+ (id)_negativeMuseumSceneNodesInGraph:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = a3;
  id v5 = objc_msgSend(v3, "setWithObjects:", @"food", 0);
  id v6 = [v4 sceneNodesForSceneNames:v5];

  return v6;
}

+ (id)_museumSceneNodesInGraph:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
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
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
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
  v16[2] = __101__PGMeaningfulEventRequiredCriteriaFactory__weddingSceneNodesWithGraph_includeWedding_sceneTaxonomy___block_invoke;
  v16[3] = &unk_1E68EE820;
  id v17 = v11;
  id v13 = v11;
  [v12 visitChildrenUsingNameBlock:v16];
  char v14 = [v9 sceneNodesForSceneNames:v13];

  return v14;
}

uint64_t __101__PGMeaningfulEventRequiredCriteriaFactory__weddingSceneNodesWithGraph_includeWedding_sceneTaxonomy___block_invoke(uint64_t a1, uint64_t a2)
{
  return 0;
}

+ (id)_negativeHikingSceneNodesWithGraph:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = a3;
  BOOL v5 = objc_msgSend(v3, "setWithObjects:", @"hiking", @"canyon", @"volcano", @"cliff", @"waterfall", 0);
  id v6 = [v4 sceneNodesForSceneNames:v5];

  return v6;
}

+ (id)_hikingSceneNodesWithGraph:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = a3;
  BOOL v5 = objc_msgSend(v3, "setWithObjects:", @"hiking", @"mountain", @"canyon", @"volcano", @"glacier", @"cliff", @"waterfall", @"forest", @"desert", @"hill", @"trail", 0);
  id v6 = [v4 sceneNodesForSceneNames:v5];

  return v6;
}

+ (id)_divingSceneNodesWithGraph:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = a3;
  BOOL v5 = objc_msgSend(v3, "setWithObjects:", @"diving", @"underwater", @"submarine_water", @"scuba", @"wetsuit", @"coral_reef", 0);
  id v6 = [v4 sceneNodesForSceneNames:v5];

  return v6;
}

+ (id)_negativeSceneNodesForBeachingWithGraph:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = a3;
  BOOL v5 = objc_msgSend(v3, "setWithObjects:", @"snow", @"blizzard", @"snowball", @"snowman", 0);
  id v6 = [v4 sceneNodesForSceneNames:v5];

  return v6;
}

+ (id)_beachingSceneNodesWithGraph:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
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
    v11[2] = __90__PGMeaningfulEventRequiredCriteriaFactory__winterSportSceneNodesWithGraph_sceneTaxonomy___block_invoke;
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

uint64_t __90__PGMeaningfulEventRequiredCriteriaFactory__winterSportSceneNodesWithGraph_sceneTaxonomy___block_invoke(uint64_t a1, uint64_t a2)
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
  v54[2] = __83__PGMeaningfulEventRequiredCriteriaFactory__socialGroupGatheringCriteriaWithGraph___block_invoke;
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
      v45[2] = __83__PGMeaningfulEventRequiredCriteriaFactory__socialGroupGatheringCriteriaWithGraph___block_invoke_3;
      v45[3] = &unk_1E68E74B0;
      v45[4] = &v50;
      v15 = v34;
      [MEMORY[0x1E4F76C60] calculateStandardDeviationForItems:v34 valueBlock:&__block_literal_global_516 result:v45];
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

void __83__PGMeaningfulEventRequiredCriteriaFactory__socialGroupGatheringCriteriaWithGraph___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((unint64_t)[v3 numberOfMemberNodes] >= *(void *)(a1 + 40)) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

double __83__PGMeaningfulEventRequiredCriteriaFactory__socialGroupGatheringCriteriaWithGraph___block_invoke_3(uint64_t a1, double a2, double a3)
{
  double result = a2 + a3;
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

double __83__PGMeaningfulEventRequiredCriteriaFactory__socialGroupGatheringCriteriaWithGraph___block_invoke_2(uint64_t a1, void *a2)
{
  return (double)(unint64_t)[a2 numberOfMomentNodes];
}

+ (id)_specialAmusementParkCriteriaWithGraph:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v11[0] = @"AmusementPark";
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  id v6 = +[PGGraphPOINodeCollection poiNodesForLabels:v5 inGraph:v4];

  if ([v6 count])
  {
    unint64_t v7 = [[PGMeaningfulEventRequiredCriteria alloc] initWithIdentifier:@"AmusementPark" minimumScore:v4 graph:0.4];
    id v8 = [[PGMeaningfulEventCollectionTrait alloc] initWithNodes:v6];
    [(PGMeaningfulEventTrait *)v8 setMinimumScore:0.7];
    [(PGMeaningfulEventCollectionTrait *)v8 setAdditionalMatchingBlock:&__block_literal_global_509];
    [(PGMeaningfulEventCriteria *)v7 setPoisTrait:v8];
    id v9 = [a1 locationsTraitNotMatchingPeopleHomeWorkLocationsForGraph:v4];
    [(PGMeaningfulEventCriteria *)v7 setLocationsTrait:v9];
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

BOOL __83__PGMeaningfulEventRequiredCriteriaFactory__specialAmusementParkCriteriaWithGraph___block_invoke(uint64_t a1, void *a2, void *a3)
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
    v25[2] = __95__PGMeaningfulEventRequiredCriteriaFactory__amusementParkCriteriaArrayWithGraph_sceneTaxonomy___block_invoke;
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
    uint64_t v17 = [[PGMeaningfulEventSceneCollectionTrait alloc] initWithNodes:v13];
    -[PGMeaningfulEventTrait setMinimumScore:](v17, "setMinimumScore:", 1.0 / (double)(unint64_t)[v13 count]);
    [(PGMeaningfulEventCriteria *)v16 setScenesTrait:v17];
    char v24 = v12;
    uint64_t v18 = [[PGMeaningfulEventCollectionTrait alloc] initWithNodes:v15];
    [(PGMeaningfulEventTrait *)v18 setMinimumScore:0.7];
    [(PGMeaningfulEventCriteria *)v16 setPoisTrait:v18];
    [a1 locationsTraitNotMatchingPeopleHomeWorkLocationsForGraph:v6];
    v19 = v11;
    char v20 = v10;
    uint64_t v22 = v21 = v9;
    [(PGMeaningfulEventCriteria *)v16 setLocationsTrait:v22];
    [v21 addObject:v16];

    id v9 = v21;
    uint64_t v10 = v20;
    unint64_t v11 = v19;

    uint64_t v12 = v24;
  }

  return v9;
}

uint64_t __95__PGMeaningfulEventRequiredCriteriaFactory__amusementParkCriteriaArrayWithGraph_sceneTaxonomy___block_invoke(uint64_t a1, uint64_t a2)
{
  return 0;
}

+ (id)_entertainmentCriteriaWithGraph:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"zoo", @"aquarium", @"underwater", 0);
  id v6 = [v4 sceneNodesForSceneNames:v5];
  v14[0] = @"Entertainment";
  unint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  id v8 = +[PGGraphPOINodeCollection poiNodesForLabels:v7 inGraph:v4];

  if ([v6 count] && objc_msgSend(v8, "count"))
  {
    id v9 = [[PGMeaningfulEventRequiredCriteria alloc] initWithIdentifier:@"Entertainment" minimumScore:v4 graph:0.4];
    uint64_t v10 = [[PGMeaningfulEventSceneCollectionTrait alloc] initWithNodes:v6];
    -[PGMeaningfulEventTrait setMinimumScore:](v10, "setMinimumScore:", 1.0 / (double)(unint64_t)[v6 count]);
    [(PGMeaningfulEventCriteria *)v9 setScenesTrait:v10];
    unint64_t v11 = [[PGMeaningfulEventCollectionTrait alloc] initWithNodes:v8];
    [(PGMeaningfulEventTrait *)v11 setMinimumScore:0.7];
    [(PGMeaningfulEventCriteria *)v9 setPoisTrait:v11];
    uint64_t v12 = [a1 locationsTraitNotMatchingPeopleHomeWorkLocationsForGraph:v4];
    [(PGMeaningfulEventCriteria *)v9 setLocationsTrait:v12];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
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
    v19 = [a1 locationsTraitNotMatchingFrequentLocationsForGraph:v6];
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
    char v20 = [a1 locationsTraitNotMatchingFrequentLocationsForGraph:v6];
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
    double v21 = [[PGMeaningfulEventCollectionTrait alloc] initWithNodes:v12];
    [(PGMeaningfulEventTrait *)v21 setMinimumScore:0.5];
    [(PGMeaningfulEventCriteria *)v19 setRoisTrait:v21];
    uint64_t v22 = [[PGMeaningfulEventLocationMobilityTrait alloc] initWithMobility:1];
    [(PGMeaningfulEventTrait *)v22 setMinimumScore:0.9];
    [(PGMeaningfulEventCriteria *)v19 setLocationMobilityTrait:v22];
    uint64_t v23 = [a1 locationsTraitNotMatchingFrequentLocationsForGraph:v6];
    [(PGMeaningfulEventCriteria *)v19 setLocationsTrait:v23];
    [(PGMeaningfulEventRequiredCriteria *)v19 setMustBeInteresting:1];
    v30 = v12;
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
    uint64_t v12 = v30;

    uint64_t v10 = v32;
  }
  else
  {
    id v26 = 0;
  }

  return v26;
}

+ (id)_restaurantCriteriaByCriteriaForIdentifiers:(id)a3 withGraph:(id)a4 sceneTaxonomy:(id)a5
{
  v108[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = [a5 nodeForName:@"tableware"];
  uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithObjects:", @"restaurant", @"food", 0);
  unint64_t v11 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithObjects:", @"wine_bottle", @"wine", 0);
  v89[0] = MEMORY[0x1E4F143A8];
  v89[1] = 3221225472;
  v89[2] = __112__PGMeaningfulEventRequiredCriteriaFactory__restaurantCriteriaByCriteriaForIdentifiers_withGraph_sceneTaxonomy___block_invoke;
  v89[3] = &unk_1E68EE820;
  id v12 = v11;
  id v90 = v12;
  v65 = v9;
  [v9 traverseChildrenUsingNameBlock:v89];
  v64 = (void *)v10;
  id v13 = [v8 sceneNodesForSceneNames:v10];
  double v14 = [v8 sceneNodesForSceneNames:v12];
  v74 = v13;
  v15 = [v13 collectionByFormingUnionWith:v14];
  v63 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"aquarium", @"underwater", 0);
  v69 = objc_msgSend(v8, "sceneNodesForSceneNames:");
  v108[0] = @"Nightlife";
  v108[1] = @"Restaurant";
  char v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v108 count:2];
  uint64_t v17 = +[PGGraphPOINodeCollection poiNodesForLabels:v16 inGraph:v8];

  v107 = @"Museum";
  uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v107 count:1];
  v75 = v8;
  v66 = +[PGGraphPOINodeCollection poiNodesForLabels:v18 inGraph:v8];

  v73 = v15;
  if ([v15 count] && objc_msgSend(v17, "count"))
  {
    v68 = v17;
    v61 = v14;
    id v62 = v12;
    v67 = [a1 locationsTraitNotMatchingPeopleHomeWorkLocationsForGraph:v8];
    v104[0] = @"label";
    v104[1] = @"significantPartsOfDay";
    v105[0] = @"Lunch";
    v105[1] = &unk_1F28D1410;
    v72 = v7;
    v104[2] = @"forbiddenPartOfDay";
    v104[3] = @"minimumNumberOfHighConfidenceScenes";
    v105[2] = &unk_1F28D1428;
    v105[3] = &unk_1F28D13C8;
    uint64_t v19 = MEMORY[0x1E4F1CC38];
    v104[4] = @"usePOIs";
    v104[5] = @"useNegativePOIs";
    v105[4] = MEMORY[0x1E4F1CC38];
    v105[5] = MEMORY[0x1E4F1CC38];
    v83 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v105 forKeys:v104 count:6];
    v106[0] = v83;
    v102[0] = @"label";
    v102[1] = @"significantPartsOfDay";
    v103[0] = @"Lunch";
    v103[1] = &unk_1F28D1410;
    v102[2] = @"forbiddenPartOfDay";
    v102[3] = @"minimumNumberOfHighConfidenceScenes";
    v103[2] = &unk_1F28D1428;
    v103[3] = &unk_1F28D1440;
    v102[4] = @"usePOIs";
    v102[5] = @"useNegativePOIs";
    v103[4] = v19;
    v103[5] = MEMORY[0x1E4F1CC28];
    v80 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v103 forKeys:v102 count:6];
    v106[1] = v80;
    v100[0] = @"label";
    v100[1] = @"significantPartsOfDay";
    v101[0] = @"Dinner";
    v101[1] = &unk_1F28D1428;
    v100[2] = @"forbiddenPartOfDay";
    v100[3] = @"allPartsOfDay";
    v101[2] = &unk_1F28D1458;
    v101[3] = &unk_1F28D1470;
    v100[4] = @"minimumDuration";
    v100[5] = @"minimumNumberOfHighConfidenceScenes";
    v101[4] = &unk_1F28D5688;
    v101[5] = &unk_1F28D13C8;
    v100[6] = @"usePOIs";
    v100[7] = @"useNegativePOIs";
    v101[6] = v19;
    v101[7] = MEMORY[0x1E4F1CC28];
    id obja = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v101 forKeys:v100 count:8];
    v106[2] = obja;
    v98[0] = @"label";
    v98[1] = @"significantPartsOfDay";
    v99[0] = @"Dinner";
    v99[1] = &unk_1F28D1428;
    v98[2] = @"forbiddenPartOfDay";
    v98[3] = @"allPartsOfDay";
    v99[2] = &unk_1F28D1458;
    v99[3] = &unk_1F28D1470;
    v98[4] = @"minimumDuration";
    v98[5] = @"minimumNumberOfHighConfidenceScenes";
    v99[4] = &unk_1F28D5698;
    v99[5] = &unk_1F28D1440;
    v98[6] = @"usePOIs";
    v98[7] = @"useNegativePOIs";
    v99[6] = v19;
    v99[7] = MEMORY[0x1E4F1CC28];
    v76 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v99 forKeys:v98 count:8];
    v106[3] = v76;
    v96[0] = @"label";
    v96[1] = @"significantPartsOfDay";
    v97[0] = @"Dinner";
    v97[1] = &unk_1F28D1428;
    v96[2] = @"forbiddenPartOfDay";
    v96[3] = @"allPartsOfDay";
    v97[2] = &unk_1F28D1458;
    v97[3] = &unk_1F28D1470;
    v96[4] = @"minimumDuration";
    v96[5] = @"minimumNumberOfHighConfidenceScenes";
    v97[4] = &unk_1F28D56A8;
    v97[5] = &unk_1F28D1440;
    v96[6] = @"usePOIs";
    v96[7] = @"useNegativePOIs";
    v97[6] = MEMORY[0x1E4F1CC28];
    v97[7] = MEMORY[0x1E4F1CC28];
    char v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v97 forKeys:v96 count:8];
    v106[4] = v20;
    v94[0] = @"label";
    v94[1] = @"forbiddenPartOfDay";
    v95[0] = @"Breakfast";
    v95[1] = &unk_1F28D1488;
    v94[2] = @"significantPartsOfDay";
    v94[3] = @"minimumNumberOfHighConfidenceScenes";
    v95[2] = &unk_1F28D14A0;
    v95[3] = &unk_1F28D13C8;
    v94[4] = @"usePOIs";
    v94[5] = @"useNegativePOIs";
    v95[4] = MEMORY[0x1E4F1CC38];
    v95[5] = MEMORY[0x1E4F1CC38];
    uint64_t v21 = MEMORY[0x1E4F1CC38];
    uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v95 forKeys:v94 count:6];
    v106[5] = v22;
    v92[0] = @"label";
    v92[1] = @"forbiddenPartOfDay";
    v93[0] = @"Breakfast";
    v93[1] = &unk_1F28D1488;
    v92[2] = @"significantPartsOfDay";
    v92[3] = @"minimumNumberOfHighConfidenceScenes";
    v93[2] = &unk_1F28D14A0;
    v93[3] = &unk_1F28D1440;
    v92[4] = @"usePOIs";
    v92[5] = @"useNegativePOIs";
    v93[4] = v21;
    v93[5] = MEMORY[0x1E4F1CC28];
    uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v93 forKeys:v92 count:6];
    v106[6] = v23;
    char v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v106 count:7];

    id v7 = v72;
    objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v72, "count"));
    id v70 = (id)objc_claimAutoreleasedReturnValue();
    long long v85 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    obuint64_t j = v24;
    uint64_t v25 = [obj countByEnumeratingWithState:&v85 objects:v91 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v86;
      uint64_t v71 = *(void *)v86;
      do
      {
        uint64_t v28 = 0;
        uint64_t v77 = v26;
        do
        {
          if (*(void *)v86 != v27) {
            objc_enumerationMutation(obj);
          }
          v29 = *(void **)(*((void *)&v85 + 1) + 8 * v28);
          v30 = [v29 objectForKeyedSubscript:@"label"];
          if ([v7 containsObject:v30])
          {
            v84 = [v29 objectForKeyedSubscript:@"significantPartsOfDay"];
            v81 = [v29 objectForKeyedSubscript:@"forbiddenPartOfDay"];
            id v31 = [v29 objectForKeyedSubscript:@"allPartsOfDay"];
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

            long long v40 = [[PGMeaningfulEventRequiredCriteria alloc] initWithIdentifier:v30 minimumScore:v75 graph:0.6];
            long long v41 = v74;
            if (!v37) {
              long long v41 = v73;
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
                  long long v46 = [(PGMeaningfulEventCollectionTrait *)v45 initWithNodes:v68 negativeNodes:v66];
                }
                else {
                  long long v46 = [(PGMeaningfulEventCollectionTrait *)v45 initWithNodes:v68];
                }
                long long v49 = v46;
                long long v48 = off_1E68E2000;
                [(PGMeaningfulEventTrait *)v46 setMinimumScore:0.7];
                [(PGMeaningfulEventCriteria *)v40 setPoisTrait:v49];
                double v47 = 1.0 / (double)v44;
              }
              else
              {
                [(PGMeaningfulEventCriteria *)v40 setLocationsTrait:v67];
                double v47 = 2.0 / (double)v44;
                [(PGMeaningfulEventRequiredCriteria *)v40 setMustBeInteresting:1];
                long long v48 = off_1E68E2000;
              }
              uint64_t v50 = [[PGMeaningfulEventSceneCollectionTrait alloc] initWithNodes:v42 negativeNodes:v69];
              [(PGMeaningfulEventTrait *)v50 setMinimumScore:v47];
              [(PGMeaningfulEventSceneCollectionTrait *)v50 setMinimumNumberOfHighConfidenceAssets:v35];
              [(PGMeaningfulEventSceneCollectionTrait *)v50 setAccumulateHighConfidenceAssetCounts:1];
              [(PGMeaningfulEventCriteria *)v40 setScenesTrait:v50];
              uint64_t v51 = [v84 unsignedIntegerValue];
              if (v81) {
                uint64_t v52 = [v81 unsignedIntegerValue];
              }
              else {
                uint64_t v52 = 1;
              }
              uint64_t v53 = (void *)[objc_alloc(v48[254]) initWithPartOfDay:v51 forbiddenPartOfDay:v52];
              [v53 setMinimumScore:0.75];
              [(PGMeaningfulEventCriteria *)v40 setSignificantPartsOfDayTrait:v53];
              if (v31)
              {
                v54 = objc_msgSend(objc_alloc(v48[254]), "initWithPartOfDay:forbiddenPartOfDay:", objc_msgSend(v31, "unsignedIntegerValue"), 1);
                [v54 setMinimumScore:0.75];
                [(PGMeaningfulEventCriteria *)v40 setAllPartsOfDayTrait:v54];
              }
              if (v32)
              {
                id v55 = [PGMeaningfulEventNumberTrait alloc];
                [v32 doubleValue];
                uint64_t v56 = -[PGMeaningfulEventNumberTrait initWithNumberValue:](v55, "initWithNumberValue:");
                [(PGMeaningfulEventTrait *)v56 setMinimumScore:1.0];
                [(PGMeaningfulEventCriteria *)v40 setMinimumDurationTrait:v56];
              }
              v57 = [v70 objectForKeyedSubscript:v30];
              if (!v57)
              {
                v57 = [MEMORY[0x1E4F1CA48] array];
                [v70 setObject:v57 forKeyedSubscript:v30];
              }
              [v57 addObject:v40];
            }
            uint64_t v27 = v71;
            id v7 = v72;
            uint64_t v26 = v77;
          }

          ++v28;
        }
        while (v26 != v28);
        uint64_t v26 = [obj countByEnumeratingWithState:&v85 objects:v91 count:16];
      }
      while (v26);
    }

    v59 = v64;
    v58 = v65;
    double v14 = v61;
    id v12 = v62;
    uint64_t v17 = v68;
  }
  else
  {
    id v70 = (id)MEMORY[0x1E4F1CC08];
    v59 = v64;
    v58 = v65;
  }

  return v70;
}

uint64_t __112__PGMeaningfulEventRequiredCriteriaFactory__restaurantCriteriaByCriteriaForIdentifiers_withGraph_sceneTaxonomy___block_invoke(uint64_t a1, uint64_t a2)
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
        id v8 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:0 ascending:0 comparator:&__block_literal_global_20543];
        v27[0] = v8;
        id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
        uint64_t v10 = [v7 sortedArrayUsingDescriptors:v9];

        unint64_t v11 = [v10 firstObject];
        id v12 = [v11 collection];
        id v13 = [v12 personNodes];

        double v14 = [MEMORY[0x1E4F1CA48] array];
        uint64_t v15 = [v6 year];
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        void v21[2] = __74__PGMeaningfulEventRequiredCriteriaFactory__anniversaryCriteriaWithGraph___block_invoke_2;
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

void __74__PGMeaningfulEventRequiredCriteriaFactory__anniversaryCriteriaWithGraph___block_invoke_2(uint64_t a1, void *a2)
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
      uint64_t v10 = [v4 collection];
      unint64_t v11 = [(PGMeaningfulEventCollectionTrait *)v9 initWithNodes:v10];
      [(PGMeaningfulEventCriteria *)v5 setDatesTrait:v11];

      id v12 = [(PGMeaningfulEventCriteria *)v5 datesTrait];
      [v12 setMinimumScore:1.0];

      [*(id *)(a1 + 56) addObject:v5];
    }
  }
}

uint64_t __74__PGMeaningfulEventRequiredCriteriaFactory__anniversaryCriteriaWithGraph___block_invoke(uint64_t a1, void *a2, void *a3)
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
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v9 = [[PGMeaningfulEventPartOfDayTrait alloc] initWithPartOfDay:32];
  [(PGMeaningfulEventTrait *)v9 setMinimumScore:0.6];
  uint64_t v10 = [MEMORY[0x1E4F76D68] nightLife];
  id v48 = a1;
  uint64_t v52 = v6;
  unint64_t v11 = [a1 _publicEventCriteriaForCategoryWithName:v10 inGraph:v6];

  if (v11)
  {
    [v11 setSignificantPartsOfDayTrait:v9];
    [v8 addObject:v11];
  }
  uint64_t v43 = v11;
  unint64_t v44 = v9;
  id v51 = v8;
  uint64_t v50 = [[PGMeaningfulEventPartOfDayTrait alloc] initWithPartOfDay:48 forbiddenPartOfDay:12];
  [(PGMeaningfulEventTrait *)v50 setMinimumScore:0.3];
  id v12 = [MEMORY[0x1E4F1CA80] setWithArray:&unk_1F28D3DF8];
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  uint64_t v13 = [&unk_1F28D3DE0 countByEnumeratingWithState:&v59 objects:v72 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v60;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v60 != v15) {
          objc_enumerationMutation(&unk_1F28D3DE0);
        }
        id v17 = [v7 nodeForName:*(void *)(*((void *)&v59 + 1) + 8 * i)];
        v57[0] = MEMORY[0x1E4F143A8];
        v57[1] = 3221225472;
        v57[2] = __90__PGMeaningfulEventRequiredCriteriaFactory__nightOutCriteriaArrayWithGraph_sceneTaxonomy___block_invoke;
        v57[3] = &unk_1E68EE820;
        id v58 = v12;
        [v17 traverseChildrenUsingNameBlock:v57];
      }
      uint64_t v14 = [&unk_1F28D3DE0 countByEnumeratingWithState:&v59 objects:v72 count:16];
    }
    while (v14);
  }
  uint64_t v18 = [v52 sceneNodesForSceneNames:v12];
  v71[0] = @"Nightlife";
  v71[1] = @"Restaurant";
  id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v71 count:2];
  char v20 = +[PGGraphPOINodeCollection poiNodesForLabels:v19 inGraph:v52];

  if ([v18 count] && objc_msgSend(v20, "count"))
  {
    v45 = v20;
    v68[0] = @"minimumDuration";
    v68[1] = @"minimumNumberOfHighConfidenceScenes";
    v69[1] = &unk_1F28D13C8;
    v68[2] = @"usePOIs";
    v69[0] = &unk_1F28D5668;
    v69[2] = MEMORY[0x1E4F1CC38];
    uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v69 forKeys:v68 count:3];
    v70[0] = v21;
    v66[0] = @"minimumDuration";
    v66[1] = @"minimumNumberOfHighConfidenceScenes";
    v67[0] = &unk_1F28D5668;
    v67[1] = &unk_1F28D13E0;
    v66[2] = @"usePOIs";
    v67[2] = MEMORY[0x1E4F1CC28];
    id v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v67 forKeys:v66 count:3];
    v70[1] = v22;
    v64[0] = @"minimumDuration";
    v64[1] = @"minimumNumberOfHighConfidenceScenes";
    v65[0] = &unk_1F28D5678;
    v65[1] = &unk_1F28D13F8;
    v64[2] = @"usePOIs";
    v65[2] = MEMORY[0x1E4F1CC38];
    id v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v65 forKeys:v64 count:3];
    v70[2] = v23;
    id v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v70 count:3];

    long long v49 = [v48 locationsTraitNotMatchingPeopleHomeWorkLocationsForGraph:v52];
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    obuint64_t j = v24;
    uint64_t v25 = [obj countByEnumeratingWithState:&v53 objects:v63 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v47 = *(void *)v54;
      do
      {
        for (uint64_t j = 0; j != v26; ++j)
        {
          if (*(void *)v54 != v47) {
            objc_enumerationMutation(obj);
          }
          uint64_t v28 = *(void **)(*((void *)&v53 + 1) + 8 * j);
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

          int v37 = [[PGMeaningfulEventRequiredCriteria alloc] initWithIdentifier:@"NightOut" minimumScore:v52 graph:0.6];
          [(PGMeaningfulEventCriteria *)v37 setLocationsTrait:v49];
          long long v38 = [[PGMeaningfulEventNumberTrait alloc] initWithNumberValue:3.0];
          [(PGMeaningfulEventCriteria *)v37 setNumberOfPeopleTrait:v38];

          char v39 = [[PGMeaningfulEventSceneCollectionTrait alloc] initWithNodes:v18];
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
          [(PGMeaningfulEventCriteria *)v37 setSignificantPartsOfDayTrait:v50];
          [v51 addObject:v37];
        }
        uint64_t v26 = [obj countByEnumeratingWithState:&v53 objects:v63 count:16];
      }
      while (v26);
    }

    char v20 = v45;
  }

  return v51;
}

uint64_t __90__PGMeaningfulEventRequiredCriteriaFactory__nightOutCriteriaArrayWithGraph_sceneTaxonomy___block_invoke(uint64_t a1, uint64_t a2)
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
  uint64_t v10 = +[PGGraphPOINodeCollection poiNodesForLabels:v9 inGraph:v4];

  if (v8 && [v10 count])
  {
    unint64_t v11 = [[PGMeaningfulEventRequiredCriteria alloc] initWithIdentifier:@"Museum" minimumScore:v4 graph:0.4];
    id v12 = [[PGMeaningfulEventCollectionTrait alloc] initWithNodes:v10];
    [(PGMeaningfulEventTrait *)v12 setMinimumScore:0.1];
    [(PGMeaningfulEventCriteria *)v11 setPoisTrait:v12];
    [(PGMeaningfulEventCriteria *)v11 setScenesTrait:v8];
    uint64_t v13 = [[PGMeaningfulEventPartOfDayTrait alloc] initWithPartOfDay:14];
    [(PGMeaningfulEventTrait *)v13 setMinimumScore:0.2];
    [(PGMeaningfulEventCriteria *)v11 setSignificantPartsOfDayTrait:v13];
    uint64_t v14 = [[PGMeaningfulEventNumberTrait alloc] initWithNumberValue:3600.0];
    [(PGMeaningfulEventTrait *)v14 setMinimumScore:1.0];
    [(PGMeaningfulEventCriteria *)v11 setMinimumDurationTrait:v14];
    uint64_t v15 = [a1 locationsTraitNotMatchingPeopleHomeWorkLocationsForGraph:v4];
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
    unint64_t v11 = [[PGMeaningfulEventRequiredCriteria alloc] initWithIdentifier:@"Festival" minimumScore:v4 graph:0.4];
    id v12 = [[PGMeaningfulEventNumberTrait alloc] initWithNumberValue:5.0];
    [(PGMeaningfulEventCriteria *)v11 setNumberOfPeopleTrait:v12];

    uint64_t v13 = [[PGMeaningfulEventSceneCollectionTrait alloc] initWithNodes:v8];
    [(PGMeaningfulEventTrait *)v13 setMinimumScore:1.0 / (double)v10];
    [(PGMeaningfulEventSceneCollectionTrait *)v13 setMinimumNumberOfHighConfidenceAssets:10];
    [(PGMeaningfulEventCriteria *)v11 setScenesTrait:v13];
    uint64_t v14 = [[PGMeaningfulEventNumberTrait alloc] initWithNumberValue:57600.0];
    [(PGMeaningfulEventTrait *)v14 setMinimumScore:1.0];
    [(PGMeaningfulEventCriteria *)v11 setMinimumDurationTrait:v14];
    uint64_t v15 = [a1 locationsTraitNotMatchingPeopleHomeWorkLocationsForGraph:v4];
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
    id v12 = [[PGMeaningfulEventRequiredCriteria alloc] initWithIdentifier:@"Concert" minimumScore:v4 graph:0.4];
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
      uint64_t v18 = [a1 locationsTraitNotMatchingPeopleHomeWorkLocationsForGraph:v4];
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
  v17[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"performance", @"clown", @"ballet_dancer", @"acrobat", @"ballet", @"breakdancing", @"bellydance", @"magic", @"circus", @"orchestra", 0);
  id v6 = [v4 sceneNodesForSceneNames:v5];
  v17[0] = @"Nightlife";
  v17[1] = @"Culture";
  v17[2] = @"Entertainment";
  void v17[3] = @"Performance";
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:4];
  id v8 = +[PGGraphPOINodeCollection poiNodesForLabels:v7 inGraph:v4];

  if ([v6 count] && objc_msgSend(v8, "count"))
  {
    uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"toy", 0);
    id v10 = [v4 sceneNodesForSceneNames:v9];

    uint64_t v11 = [[PGMeaningfulEventRequiredCriteria alloc] initWithIdentifier:@"Performance" minimumScore:v4 graph:0.4];
    unint64_t v12 = [[PGMeaningfulEventNumberTrait alloc] initWithNumberValue:2.0];
    [(PGMeaningfulEventCriteria *)v11 setNumberOfPeopleTrait:v12];

    uint64_t v13 = [[PGMeaningfulEventCollectionTrait alloc] initWithNodes:v8];
    [(PGMeaningfulEventTrait *)v13 setMinimumScore:0.1];
    [(PGMeaningfulEventCriteria *)v11 setPoisTrait:v13];
    uint64_t v14 = [[PGMeaningfulEventSceneCollectionTrait alloc] initWithNodes:v6 negativeNodes:v10];
    -[PGMeaningfulEventTrait setMinimumScore:](v14, "setMinimumScore:", 1.0 / (double)(unint64_t)[v6 count]);
    [(PGMeaningfulEventSceneCollectionTrait *)v14 setMinimumNumberOfHighConfidenceAssets:4];
    [(PGMeaningfulEventCriteria *)v11 setScenesTrait:v14];
    uint64_t v15 = [a1 locationsTraitNotMatchingPeopleHomeWorkLocationsForGraph:v4];
    [(PGMeaningfulEventCriteria *)v11 setLocationsTrait:v15];
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
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
    id v16 = [a1 locationsTraitNotMatchingPeopleHomeWorkLocationsForGraph:v6];
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
    char v20 = [a1 locationsTraitNotMatchingFrequentLocationsForGraph:v6];
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
    uint64_t v15 = [a1 locationsTraitNotMatchingPeopleHomeWorkLocationsForGraph:v4];
    [(PGMeaningfulEventCriteria *)v12 setLocationsTrait:v15];
    if (v11)
    {
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      void v22[2] = __97__PGMeaningfulEventRequiredCriteriaFactory__sportEventCriteriaArrayForMeaningInferenceWithGraph___block_invoke;
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

BOOL __97__PGMeaningfulEventRequiredCriteriaFactory__sportEventCriteriaArrayForMeaningInferenceWithGraph___block_invoke(uint64_t a1, void *a2, void *a3)
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
    void v11[2] = __97__PGMeaningfulEventRequiredCriteriaFactory__sportEventCriteriaArrayForMeaningInferenceWithGraph___block_invoke_2;
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

void __97__PGMeaningfulEventRequiredCriteriaFactory__sportEventCriteriaArrayForMeaningInferenceWithGraph___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = [a2 collection];
  id v6 = [v5 areaNodes];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __97__PGMeaningfulEventRequiredCriteriaFactory__sportEventCriteriaArrayForMeaningInferenceWithGraph___block_invoke_3;
  v9[3] = &unk_1E68E73D0;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  id v10 = v7;
  uint64_t v11 = v8;
  uint64_t v12 = a3;
  [v6 enumerateNodesUsingBlock:v9];
}

void __97__PGMeaningfulEventRequiredCriteriaFactory__sportEventCriteriaArrayForMeaningInferenceWithGraph___block_invoke_3(uint64_t a1, void *a2, unsigned char *a3)
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
    BOOL v9 = [a1 locationsTraitNotMatchingPeopleWorkLocationsForGraph:v6];
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
  aBlock[2] = __129__PGMeaningfulEventRequiredCriteriaFactory__birthdayCriteriaWithGraph_strongBirthdayCriteria_weakBirthdayCriteria_sceneTaxonomy___block_invoke;
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
  v32[2] = __129__PGMeaningfulEventRequiredCriteriaFactory__birthdayCriteriaWithGraph_strongBirthdayCriteria_weakBirthdayCriteria_sceneTaxonomy___block_invoke_5;
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

void __129__PGMeaningfulEventRequiredCriteriaFactory__birthdayCriteriaWithGraph_strongBirthdayCriteria_weakBirthdayCriteria_sceneTaxonomy___block_invoke(id *a1, void *a2)
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
    v26[2] = __129__PGMeaningfulEventRequiredCriteriaFactory__birthdayCriteriaWithGraph_strongBirthdayCriteria_weakBirthdayCriteria_sceneTaxonomy___block_invoke_2;
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
    aBlock[2] = __129__PGMeaningfulEventRequiredCriteriaFactory__birthdayCriteriaWithGraph_strongBirthdayCriteria_weakBirthdayCriteria_sceneTaxonomy___block_invoke_4;
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

uint64_t __129__PGMeaningfulEventRequiredCriteriaFactory__birthdayCriteriaWithGraph_strongBirthdayCriteria_weakBirthdayCriteria_sceneTaxonomy___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __129__PGMeaningfulEventRequiredCriteriaFactory__birthdayCriteriaWithGraph_strongBirthdayCriteria_weakBirthdayCriteria_sceneTaxonomy___block_invoke_2(uint64_t a1, void *a2)
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
              v17[2] = __129__PGMeaningfulEventRequiredCriteriaFactory__birthdayCriteriaWithGraph_strongBirthdayCriteria_weakBirthdayCriteria_sceneTaxonomy___block_invoke_3;
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

PGMeaningfulEventRequiredCriteria *__129__PGMeaningfulEventRequiredCriteriaFactory__birthdayCriteriaWithGraph_strongBirthdayCriteria_weakBirthdayCriteria_sceneTaxonomy___block_invoke_4(uint64_t a1, int a2, void *a3, int a4)
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

unint64_t __129__PGMeaningfulEventRequiredCriteriaFactory__birthdayCriteriaWithGraph_strongBirthdayCriteria_weakBirthdayCriteria_sceneTaxonomy___block_invoke_3(uint64_t a1, void *a2, unsigned char *a3)
{
  unint64_t result = [a2 category];
  if (result <= 4 && ((1 << result) & 0x16) != 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

+ (id)availablePersonActivityMeaningLabels
{
  v4[6] = *MEMORY[0x1E4F143B8];
  v4[0] = @"PersonBeachWater";
  v4[1] = @"PersonToys";
  v4[2] = @"PersonPlayground";
  v4[3] = @"PersonActionSwimming";
  v4[4] = @"PersonActionPlayingOnASwing";
  v4[5] = @"PersonActionPlayingOnASlide";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:6];
  return v2;
}

+ (id)availableMeaningLabels
{
  v4[25] = *MEMORY[0x1E4F143B8];
  v4[0] = @"Wedding";
  v4[1] = @"Birthday";
  v4[2] = @"Anniversary";
  v4[3] = @"Celebration";
  v4[4] = @"Concert";
  v4[5] = @"Festival";
  v4[6] = @"Theater";
  void v4[7] = @"Dance";
  v4[8] = @"Museum";
  v4[9] = @"AmusementPark";
  v4[10] = @"Performance";
  v4[11] = @"Hiking";
  v4[12] = @"Climbing";
  v4[13] = @"Beaching";
  v4[14] = @"SportEvent";
  v4[15] = @"WinterSport";
  v4[16] = @"Diving";
  v4[17] = @"Activity";
  v4[18] = @"Lunch";
  v4[19] = @"Dinner";
  v4[20] = @"Restaurant";
  v4[21] = @"NightOut";
  v4[22] = @"Entertainment";
  v4[23] = @"HolidayEvent";
  v4[24] = @"Gathering";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:25];
  return v2;
}

+ (id)requiredCriteriaByIdentifierWithGraph:(id)a3 inferenceType:(unint64_t)a4 sceneTaxonomy:(id)a5
{
  return (id)[a1 _requiredCriteriaForIdentifiers:0 inferenceType:a4 graph:a3 sceneTaxonomy:a5];
}

+ (id)_requiredCriteriaForIdentifiers:(id)a3 inferenceType:(unint64_t)a4 graph:(id)a5 sceneTaxonomy:(id)a6
{
  v55[3] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = [MEMORY[0x1E4F1CA60] dictionary];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __110__PGMeaningfulEventRequiredCriteriaFactory__requiredCriteriaForIdentifiers_inferenceType_graph_sceneTaxonomy___block_invoke;
  aBlock[3] = &unk_1E68E7330;
  id v14 = v13;
  id v54 = v14;
  id v15 = (void (**)(void *, __CFString *, void *))_Block_copy(aBlock);
  if (v10)
  {
    if ([v10 containsObject:@"Wedding"])
    {
      uint64_t v16 = [a1 _weddingCriteriaWithGraph:v11 sceneTaxonomy:v12];
      [v14 setObject:v16 forKeyedSubscript:@"Wedding"];
    }
    if (([v10 containsObject:@"Birthday"] & 1) == 0
      && ([v10 containsObject:@"WeakBirthday"] & 1) == 0)
    {
      goto LABEL_15;
    }
  }
  else
  {
    char v17 = [a1 _weddingCriteriaWithGraph:v11 sceneTaxonomy:v12];
    [v14 setObject:v17 forKeyedSubscript:@"Wedding"];
  }
  id v51 = 0;
  id v52 = 0;
  [a1 _birthdayCriteriaWithGraph:v11 strongBirthdayCriteria:&v52 weakBirthdayCriteria:&v51 sceneTaxonomy:v12];
  id v18 = v52;
  id v19 = v51;
  if (v10)
  {
    if ([v10 containsObject:@"Birthday"]) {
      [v14 setObject:v18 forKeyedSubscript:@"Birthday"];
    }
    if (([v10 containsObject:@"WeakBirthday"] & 1) == 0)
    {

      goto LABEL_15;
    }
  }
  else
  {
    [v14 setObject:v18 forKeyedSubscript:@"Birthday"];
  }
  [v14 setObject:v19 forKeyedSubscript:@"WeakBirthday"];

  if (!v10)
  {
    uint64_t v21 = [a1 _anniversaryCriteriaWithGraph:v11];
    [v14 setObject:v21 forKeyedSubscript:@"Anniversary"];

    goto LABEL_20;
  }
LABEL_15:
  if ([v10 containsObject:@"Anniversary"])
  {
    uint64_t v20 = [a1 _anniversaryCriteriaWithGraph:v11];
    [v14 setObject:v20 forKeyedSubscript:@"Anniversary"];
  }
  if (([v10 containsObject:@"Celebration"] & 1) == 0)
  {
LABEL_21:
    if ([v10 containsObject:@"Performance"])
    {
      uint64_t v23 = [a1 _performanceCriteriaWithGraph:v11];
      v15[2](v15, @"Performance", v23);
    }
    if (([v10 containsObject:@"Concert"] & 1) == 0) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }
LABEL_20:
  uint64_t v22 = [a1 _celebrationCriteriaWithGraph:v11];
  v15[2](v15, @"Celebration", v22);

  if (v10) {
    goto LABEL_21;
  }
  id v24 = [a1 _performanceCriteriaWithGraph:v11];
  v15[2](v15, @"Performance", v24);

LABEL_26:
  char v25 = [a1 _concertCriteriaArrayForInferenceType:a4 graph:v11];
  [v14 setObject:v25 forKeyedSubscript:@"Concert"];

  if (!v10)
  {
    id v27 = [a1 _festivalCriteriaArrayWithGraph:v11];
    [v14 setObject:v27 forKeyedSubscript:@"Festival"];

    goto LABEL_32;
  }
LABEL_27:
  if ([v10 containsObject:@"Festival"])
  {
    id v26 = [a1 _festivalCriteriaArrayWithGraph:v11];
    [v14 setObject:v26 forKeyedSubscript:@"Festival"];
  }
  if (([v10 containsObject:@"Theater"] & 1) == 0)
  {
LABEL_33:
    if ([v10 containsObject:@"Dance"])
    {
      uint64_t v29 = [a1 _danceCriteriaWithGraph:v11];
      v15[2](v15, @"Dance", v29);
    }
    if (([v10 containsObject:@"Hiking"] & 1) == 0) {
      goto LABEL_39;
    }
    goto LABEL_38;
  }
LABEL_32:
  id v28 = [a1 _theaterCriteriaWithGraph:v11];
  v15[2](v15, @"Theater", v28);

  if (v10) {
    goto LABEL_33;
  }
  id v30 = [a1 _danceCriteriaWithGraph:v11];
  v15[2](v15, @"Dance", v30);

LABEL_38:
  uint64_t v31 = [a1 _hikingCriteriaWithGraph:v11 sceneTaxonomy:v12];
  [v14 setObject:v31 forKeyedSubscript:@"Hiking"];

  if (!v10)
  {
    id v33 = [a1 _climbingCriteriaWithGraph:v11 sceneTaxonomy:v12];
    v15[2](v15, @"Climbing", v33);

    goto LABEL_44;
  }
LABEL_39:
  if ([v10 containsObject:@"Climbing"])
  {
    id v32 = [a1 _climbingCriteriaWithGraph:v11 sceneTaxonomy:v12];
    v15[2](v15, @"Climbing", v32);
  }
  if (([v10 containsObject:@"Beaching"] & 1) == 0)
  {
LABEL_45:
    if ([v10 containsObject:@"SportEvent"])
    {
      long long v35 = [a1 _sportEventCriteriaArrayForInferenceType:a4 graph:v11];
      [v14 setObject:v35 forKeyedSubscript:@"SportEvent"];
    }
    if (([v10 containsObject:@"WinterSport"] & 1) == 0) {
      goto LABEL_51;
    }
    goto LABEL_50;
  }
LABEL_44:
  uint64_t v34 = [a1 _beachingCriteriaWithGraph:v11 sceneTaxonomy:v12];
  v15[2](v15, @"Beaching", v34);

  if (v10) {
    goto LABEL_45;
  }
  long long v36 = [a1 _sportEventCriteriaArrayForInferenceType:a4 graph:v11];
  [v14 setObject:v36 forKeyedSubscript:@"SportEvent"];

LABEL_50:
  long long v37 = [a1 _winterSportCriteriaWithGraph:v11 sceneTaxonomy:v12];
  v15[2](v15, @"WinterSport", v37);

  if (!v10)
  {
    uint64_t v40 = [a1 _divingCriteriaWithGraph:v11 sceneTaxonomy:v12];
    v15[2](v15, @"Diving", v40);

    v55[0] = @"Lunch";
    v55[1] = @"Dinner";
    v55[2] = @"Breakfast";
    id v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:3];
    goto LABEL_60;
  }
LABEL_51:
  if ([v10 containsObject:@"Diving"])
  {
    long long v38 = [a1 _divingCriteriaWithGraph:v11 sceneTaxonomy:v12];
    v15[2](v15, @"Diving", v38);
  }
  id v39 = [MEMORY[0x1E4F1CA48] array];
  if ([v10 containsObject:@"Lunch"]) {
    [v39 addObject:@"Lunch"];
  }
  if ([v10 containsObject:@"Dinner"]) {
    [v39 addObject:@"Dinner"];
  }
  if ([v10 containsObject:@"Breakfast"]) {
    [v39 addObject:@"Breakfast"];
  }
LABEL_60:
  if ([v39 count])
  {
    long long v41 = [a1 _restaurantCriteriaByCriteriaForIdentifiers:v39 withGraph:v11 sceneTaxonomy:v12];
    [v14 addEntriesFromDictionary:v41];
  }
  if (v10)
  {
    if ([v10 containsObject:@"NightOut"])
    {
      id v42 = [a1 _nightOutCriteriaArrayWithGraph:v11 sceneTaxonomy:v12];
      [v14 setObject:v42 forKeyedSubscript:@"NightOut"];
    }
    if (([v10 containsObject:@"Entertainment"] & 1) == 0)
    {
LABEL_69:
      if ([v10 containsObject:@"AmusementPark"])
      {
        v45 = [a1 _amusementParkCriteriaArrayWithGraph:v11 sceneTaxonomy:v12];
        [v14 setObject:v45 forKeyedSubscript:@"AmusementPark"];
      }
      if (([v10 containsObject:@"Museum"] & 1) == 0) {
        goto LABEL_75;
      }
      goto LABEL_74;
    }
  }
  else
  {
    uint64_t v43 = [a1 _nightOutCriteriaArrayWithGraph:v11 sceneTaxonomy:v12];
    [v14 setObject:v43 forKeyedSubscript:@"NightOut"];
  }
  unint64_t v44 = [a1 _entertainmentCriteriaWithGraph:v11];
  v15[2](v15, @"Entertainment", v44);

  if (v10) {
    goto LABEL_69;
  }
  long long v46 = [a1 _amusementParkCriteriaArrayWithGraph:v11 sceneTaxonomy:v12];
  [v14 setObject:v46 forKeyedSubscript:@"AmusementPark"];

LABEL_74:
  uint64_t v47 = [a1 _museumCriteriaArrayForInferenceType:a4 graph:v11];
  [v14 setObject:v47 forKeyedSubscript:@"Museum"];

  if (!v10)
  {
LABEL_76:
    id v48 = [a1 _socialGroupGatheringCriteriaWithGraph:v11];
    [v14 setObject:v48 forKeyedSubscript:@"Gathering"];

    goto LABEL_77;
  }
LABEL_75:
  if ([v10 containsObject:@"Gathering"]) {
    goto LABEL_76;
  }
LABEL_77:
  id v49 = v14;

  return v49;
}

void __110__PGMeaningfulEventRequiredCriteriaFactory__requiredCriteriaForIdentifiers_inferenceType_graph_sceneTaxonomy___block_invoke(uint64_t a1, void *a2, void *a3)
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

+ (id)requiredCriteriaForIdentifiers:(id)a3 inferenceType:(unint64_t)a4 graph:(id)a5 sceneTaxonomy:(id)a6
{
  uint64_t v10 = (void *)MEMORY[0x1E4F1CAD0];
  id v11 = a6;
  id v12 = a5;
  id v13 = [v10 setWithArray:a3];
  id v14 = [a1 _requiredCriteriaForIdentifiers:v13 inferenceType:a4 graph:v12 sceneTaxonomy:v11];

  return v14;
}

@end
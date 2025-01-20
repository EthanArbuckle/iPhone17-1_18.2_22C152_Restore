@interface PGCurationCriteriaFactory
- (PGCurationCriteriaFactory)init;
- (id)_anniversaryCriteriaWithPersonLocalIdentifier:(id)a3 client:(unint64_t)a4;
- (id)_beachingCriteriaWithClient:(unint64_t)a3;
- (id)_birthdayCriteriaWithPersonLocalIdentifiers:(id)a3 client:(unint64_t)a4;
- (id)_breakfastCriteriaWithClient:(unint64_t)a3;
- (id)_climbingCriteriaWithClient:(unint64_t)a3;
- (id)_compulsoryRequiredTraitsFromBaseSceneNames:(id)a3 leafSceneNames:(id)a4;
- (id)_concertCriteriaWithClient:(unint64_t)a3;
- (id)_dinnerCriteriaWithClient:(unint64_t)a3;
- (id)_divingCriteriaWithClient:(unint64_t)a3;
- (id)_entertainmentCriteriaWithClient:(unint64_t)a3;
- (id)_festivalCriteriaWithClient:(unint64_t)a3;
- (id)_hikingCriteriaWithClient:(unint64_t)a3;
- (id)_holidayEventCriteriaWithGraph:(id)a3 featureNodes:(id)a4 client:(unint64_t)a5;
- (id)_longTripCriteriaWithClient:(unint64_t)a3;
- (id)_lunchCriteriaWithClient:(unint64_t)a3;
- (id)_memoriesRestaurantScenesTrait;
- (id)_museumCriteriaWithClient:(unint64_t)a3;
- (id)_nightOutCriteriaWithClient:(unint64_t)a3;
- (id)_performanceCriteriaWithClient:(unint64_t)a3;
- (id)_sceneNamesFromBaseSceneNames:(id)a3 leafSceneNames:(id)a4;
- (id)_searchFallCriteria;
- (id)_searchRestaurantCompulsoryScenesTrait;
- (id)_searchRestaurantScenesTrait;
- (id)_searchSpringCriteria;
- (id)_searchSummerCriteria;
- (id)_searchWinterCriteria;
- (id)_shortTripCriteriaWithClient:(unint64_t)a3;
- (id)_sportEventCriteriaWithClient:(unint64_t)a3;
- (id)_tripScenesTrait;
- (id)_weddingCriteriaWithClient:(unint64_t)a3;
- (id)_winterSportCriteriaWithClient:(unint64_t)a3;
- (id)curationCriteriaWithCollection:(id)a3 meaningLabel:(id)a4 inGraph:(id)a5 client:(unint64_t)a6;
- (id)curationCriteriaWithMeaningLabel:(id)a3 featureNodes:(id)a4 inGraph:(id)a5 client:(unint64_t)a6;
- (id)curationCriteriaWithSeasonName:(id)a3 client:(unint64_t)a4;
- (id)foodieCurationCriteriaWithClient:(unint64_t)a3;
- (id)foodieCurationCriteriaWithPersonLocalIdentifier:(id)a3 client:(unint64_t)a4;
- (id)holidayServiceWithGraph:(id)a3;
- (id)petCurationCriteriaWithCollection:(id)a3 client:(unint64_t)a4 curationContext:(id)a5;
- (id)tripCurationCriteriaWithCollection:(id)a3 client:(unint64_t)a4;
@end

@implementation PGCurationCriteriaFactory

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneTaxonomy, 0);
  objc_storeStrong((id *)&self->_holidayServiceByLocale, 0);
}

- (id)_sceneNamesFromBaseSceneNames:(id)a3 leafSceneNames:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v15 = a4;
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithArray:v15];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = [(CLSSceneTaxonomyHierarchy *)self->_sceneTaxonomy nodeForName:*(void *)(*((void *)&v18 + 1) + 8 * i)];
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __74__PGCurationCriteriaFactory__sceneNamesFromBaseSceneNames_leafSceneNames___block_invoke;
        v16[3] = &unk_1E68EE820;
        id v17 = v7;
        [v13 traverseChildrenUsingNameBlock:v16];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  return v7;
}

uint64_t __74__PGCurationCriteriaFactory__sceneNamesFromBaseSceneNames_leafSceneNames___block_invoke(uint64_t a1, uint64_t a2)
{
  return 0;
}

- (id)_tripScenesTrait
{
  v2 = [(PGCurationCriteriaFactory *)self _sceneNamesFromBaseSceneNames:&unk_1F28D4BC0 leafSceneNames:MEMORY[0x1E4F1CBF0]];
  v3 = [[PGCurationSceneTrait alloc] initWithSceneNames:v2];

  return v3;
}

- (id)_searchRestaurantCompulsoryScenesTrait
{
  v2 = [(PGCurationCriteriaFactory *)self _sceneNamesFromBaseSceneNames:MEMORY[0x1E4F1CBF0] leafSceneNames:&unk_1F28D4BA8];
  v3 = [[PGCurationSceneTrait alloc] initWithSceneNames:v2];

  return v3;
}

- (id)_searchRestaurantScenesTrait
{
  v2 = [(PGCurationCriteriaFactory *)self _sceneNamesFromBaseSceneNames:&unk_1F28D4B90 leafSceneNames:MEMORY[0x1E4F1CBF0]];
  v3 = [[PGCurationSceneTrait alloc] initWithSceneNames:v2];

  return v3;
}

- (id)_memoriesRestaurantScenesTrait
{
  v2 = [(PGCurationCriteriaFactory *)self _sceneNamesFromBaseSceneNames:&unk_1F28D4B60 leafSceneNames:&unk_1F28D4B78];
  v3 = [[PGCurationSceneTrait alloc] initWithSceneNames:v2];

  return v3;
}

- (id)_searchFallCriteria
{
  v3 = [[PGCurationCriteria alloc] initWithMinimumAssetsRatio:2 client:0.1];
  uint64_t v4 = MEMORY[0x1E4F1CBF0];
  v5 = [(PGCurationCriteriaFactory *)self _compulsoryRequiredTraitsFromBaseSceneNames:&unk_1F28D4B30 leafSceneNames:MEMORY[0x1E4F1CBF0]];
  [(PGCurationCriteria *)v3 setCompulsoryScenesTrait:v5];

  id v6 = [(PGCurationCriteriaFactory *)self _sceneNamesFromBaseSceneNames:&unk_1F28D4B48 leafSceneNames:v4];
  v7 = [[PGCurationSceneTrait alloc] initWithSceneNames:v6];
  [(PGCurationCriteria *)v3 setScenesTrait:v7];

  return v3;
}

- (id)_searchSummerCriteria
{
  v3 = [[PGCurationCriteria alloc] initWithMinimumAssetsRatio:2 client:0.1];
  uint64_t v4 = MEMORY[0x1E4F1CBF0];
  v5 = [(PGCurationCriteriaFactory *)self _compulsoryRequiredTraitsFromBaseSceneNames:&unk_1F28D4B00 leafSceneNames:MEMORY[0x1E4F1CBF0]];
  [(PGCurationCriteria *)v3 setCompulsoryScenesTrait:v5];

  id v6 = [(PGCurationCriteriaFactory *)self _sceneNamesFromBaseSceneNames:&unk_1F28D4B18 leafSceneNames:v4];
  v7 = [[PGCurationSceneTrait alloc] initWithSceneNames:v6];
  [(PGCurationCriteria *)v3 setScenesTrait:v7];

  return v3;
}

- (id)_searchSpringCriteria
{
  v3 = [[PGCurationCriteria alloc] initWithMinimumAssetsRatio:2 client:0.1];
  uint64_t v4 = MEMORY[0x1E4F1CBF0];
  v5 = [(PGCurationCriteriaFactory *)self _compulsoryRequiredTraitsFromBaseSceneNames:&unk_1F28D4AD0 leafSceneNames:MEMORY[0x1E4F1CBF0]];
  [(PGCurationCriteria *)v3 setCompulsoryScenesTrait:v5];

  id v6 = [(PGCurationCriteriaFactory *)self _sceneNamesFromBaseSceneNames:&unk_1F28D4AE8 leafSceneNames:v4];
  v7 = [[PGCurationSceneTrait alloc] initWithSceneNames:v6];
  [(PGCurationCriteria *)v3 setScenesTrait:v7];

  return v3;
}

- (id)_searchWinterCriteria
{
  v3 = [[PGCurationCriteria alloc] initWithMinimumAssetsRatio:2 client:0.1];
  uint64_t v4 = MEMORY[0x1E4F1CBF0];
  v5 = [(PGCurationCriteriaFactory *)self _compulsoryRequiredTraitsFromBaseSceneNames:&unk_1F28D4AA0 leafSceneNames:MEMORY[0x1E4F1CBF0]];
  [(PGCurationCriteria *)v3 setCompulsoryScenesTrait:v5];

  id v6 = [(PGCurationCriteriaFactory *)self _sceneNamesFromBaseSceneNames:&unk_1F28D4AB8 leafSceneNames:v4];
  v7 = [[PGCurationSceneTrait alloc] initWithSceneNames:v6];
  [(PGCurationCriteria *)v3 setScenesTrait:v7];

  return v3;
}

- (id)_compulsoryRequiredTraitsFromBaseSceneNames:(id)a3 leafSceneNames:(id)a4
{
  uint64_t v4 = [(PGCurationCriteriaFactory *)self _sceneNamesFromBaseSceneNames:a3 leafSceneNames:MEMORY[0x1E4F1CBF0]];
  v5 = [[PGCurationSceneTrait alloc] initWithSceneNames:v4];
  [(PGCurationTrait *)v5 setMinimumScore:0.1];

  return v5;
}

- (id)_longTripCriteriaWithClient:(unint64_t)a3
{
  uint64_t v4 = [[PGCurationCriteria alloc] initWithMinimumAssetsRatio:a3 client:0.05];
  v5 = [(PGCurationCriteriaFactory *)self _tripScenesTrait];
  [(PGCurationCriteria *)v4 setScenesTrait:v5];

  [(PGCurationCriteria *)v4 setFaceFilter:0];
  return v4;
}

- (id)_shortTripCriteriaWithClient:(unint64_t)a3
{
  uint64_t v4 = [[PGCurationCriteria alloc] initWithMinimumAssetsRatio:a3 client:0.05];
  v5 = [(PGCurationCriteriaFactory *)self _tripScenesTrait];
  [(PGCurationCriteria *)v4 setScenesTrait:v5];

  return v4;
}

- (id)_dinnerCriteriaWithClient:(unint64_t)a3
{
  v5 = [[PGCurationCriteria alloc] initWithMinimumAssetsRatio:a3 client:0.1];
  if (a3) {
    uint64_t v6 = 16;
  }
  else {
    uint64_t v6 = 48;
  }
  v7 = [[PGCurationPartOfDayTrait alloc] initWithPartOfDay:v6];
  [(PGCurationTrait *)v7 setMinimumScore:0.1];
  [(PGCurationCriteria *)v5 setPartOfDayTrait:v7];
  if (a3 >= 2)
  {
    if (a3 == 2)
    {
      uint64_t v9 = [(PGCurationCriteriaFactory *)self _searchRestaurantCompulsoryScenesTrait];
      [(PGCurationCriteria *)v5 setCompulsoryScenesTrait:v9];

      uint64_t v10 = [(PGCurationCriteriaFactory *)self _searchRestaurantScenesTrait];
      [(PGCurationCriteria *)v5 setScenesTrait:v10];

      [(PGCurationCriteria *)v5 setFaceFilter:0];
    }
  }
  else
  {
    id v8 = [(PGCurationCriteriaFactory *)self _memoriesRestaurantScenesTrait];
    [(PGCurationCriteria *)v5 setScenesTrait:v8];
  }
  return v5;
}

- (id)_lunchCriteriaWithClient:(unint64_t)a3
{
  v5 = [[PGCurationCriteria alloc] initWithMinimumAssetsRatio:a3 client:0.1];
  uint64_t v6 = [[PGCurationPartOfDayTrait alloc] initWithPartOfDay:4];
  [(PGCurationTrait *)v6 setMinimumScore:0.1];
  [(PGCurationCriteria *)v5 setPartOfDayTrait:v6];
  if (a3 >= 2)
  {
    if (a3 == 2)
    {
      id v8 = [(PGCurationCriteriaFactory *)self _searchRestaurantCompulsoryScenesTrait];
      [(PGCurationCriteria *)v5 setCompulsoryScenesTrait:v8];

      uint64_t v9 = [(PGCurationCriteriaFactory *)self _searchRestaurantScenesTrait];
      [(PGCurationCriteria *)v5 setScenesTrait:v9];

      [(PGCurationCriteria *)v5 setFaceFilter:0];
    }
  }
  else
  {
    v7 = [(PGCurationCriteriaFactory *)self _memoriesRestaurantScenesTrait];
    [(PGCurationCriteria *)v5 setScenesTrait:v7];
  }
  return v5;
}

- (id)_breakfastCriteriaWithClient:(unint64_t)a3
{
  v5 = [[PGCurationCriteria alloc] initWithMinimumAssetsRatio:a3 client:0.1];
  uint64_t v6 = [[PGCurationPartOfDayTrait alloc] initWithPartOfDay:2];
  [(PGCurationTrait *)v6 setMinimumScore:0.1];
  [(PGCurationCriteria *)v5 setPartOfDayTrait:v6];
  if (a3 >= 2)
  {
    if (a3 == 2)
    {
      id v8 = [(PGCurationCriteriaFactory *)self _searchRestaurantCompulsoryScenesTrait];
      [(PGCurationCriteria *)v5 setCompulsoryScenesTrait:v8];

      uint64_t v9 = [(PGCurationCriteriaFactory *)self _searchRestaurantScenesTrait];
      [(PGCurationCriteria *)v5 setScenesTrait:v9];

      [(PGCurationCriteria *)v5 setFaceFilter:0];
    }
  }
  else
  {
    v7 = [(PGCurationCriteriaFactory *)self _memoriesRestaurantScenesTrait];
    [(PGCurationCriteria *)v5 setScenesTrait:v7];
  }
  return v5;
}

- (id)_nightOutCriteriaWithClient:(unint64_t)a3
{
  v5 = [[PGCurationCriteria alloc] initWithMinimumAssetsRatio:a3 client:0.1];
  uint64_t v6 = [(PGCurationCriteriaFactory *)self _sceneNamesFromBaseSceneNames:&unk_1F28D4A88 leafSceneNames:MEMORY[0x1E4F1CBF0]];
  v7 = [[PGCurationSceneTrait alloc] initWithSceneNames:v6];
  [(PGCurationCriteria *)v5 setScenesTrait:v7];

  id v8 = [[PGCurationPartOfDayTrait alloc] initWithPartOfDay:48];
  [(PGCurationTrait *)v8 setMinimumScore:0.1];
  [(PGCurationCriteria *)v5 setPartOfDayTrait:v8];
  if (a3 == 2) {
    [(PGCurationCriteria *)v5 setFaceFilter:0];
  }

  return v5;
}

- (id)_sportEventCriteriaWithClient:(unint64_t)a3
{
  v5 = [[PGCurationCriteria alloc] initWithMinimumAssetsRatio:a3 client:0.1];
  uint64_t v6 = [(PGCurationCriteriaFactory *)self _sceneNamesFromBaseSceneNames:&unk_1F28D4A70 leafSceneNames:MEMORY[0x1E4F1CBF0]];
  v7 = [[PGCurationSceneTrait alloc] initWithSceneNames:v6];
  [(PGCurationCriteria *)v5 setScenesTrait:v7];

  if (a3 == 2) {
    [(PGCurationCriteria *)v5 setFaceFilter:0];
  }

  return v5;
}

- (id)_museumCriteriaWithClient:(unint64_t)a3
{
  uint64_t v4 = [[PGCurationCriteria alloc] initWithMinimumAssetsRatio:a3 client:0.1];
  v5 = [(PGCurationCriteriaFactory *)self _sceneNamesFromBaseSceneNames:MEMORY[0x1E4F1CBF0] leafSceneNames:&unk_1F28D4A58];
  uint64_t v6 = [[PGCurationSceneTrait alloc] initWithSceneNames:v5];
  [(PGCurationCriteria *)v4 setScenesTrait:v6];

  [(PGCurationCriteria *)v4 setFaceFilter:0];
  return v4;
}

- (id)_performanceCriteriaWithClient:(unint64_t)a3
{
  uint64_t v4 = [[PGCurationCriteria alloc] initWithMinimumAssetsRatio:a3 client:0.1];
  v5 = [(PGCurationCriteriaFactory *)self _sceneNamesFromBaseSceneNames:&unk_1F28D4A40 leafSceneNames:MEMORY[0x1E4F1CBF0]];
  uint64_t v6 = [[PGCurationSceneTrait alloc] initWithSceneNames:v5];
  [(PGCurationCriteria *)v4 setScenesTrait:v6];

  return v4;
}

- (id)_festivalCriteriaWithClient:(unint64_t)a3
{
  uint64_t v4 = [[PGCurationCriteria alloc] initWithMinimumAssetsRatio:a3 client:0.1];
  v5 = [(PGCurationCriteriaFactory *)self _sceneNamesFromBaseSceneNames:&unk_1F28D4A28 leafSceneNames:MEMORY[0x1E4F1CBF0]];
  uint64_t v6 = [[PGCurationSceneTrait alloc] initWithSceneNames:v5];
  [(PGCurationCriteria *)v4 setScenesTrait:v6];

  [(PGCurationCriteria *)v4 setFaceFilter:0];
  return v4;
}

- (id)_concertCriteriaWithClient:(unint64_t)a3
{
  uint64_t v4 = [[PGCurationCriteria alloc] initWithMinimumAssetsRatio:a3 client:0.1];
  v5 = [(PGCurationCriteriaFactory *)self _sceneNamesFromBaseSceneNames:&unk_1F28D4A10 leafSceneNames:MEMORY[0x1E4F1CBF0]];
  uint64_t v6 = [[PGCurationSceneTrait alloc] initWithSceneNames:v5];
  [(PGCurationCriteria *)v4 setScenesTrait:v6];

  [(PGCurationCriteria *)v4 setFaceFilter:0];
  return v4;
}

- (id)_entertainmentCriteriaWithClient:(unint64_t)a3
{
  uint64_t v4 = [[PGCurationCriteria alloc] initWithMinimumAssetsRatio:a3 client:0.1];
  v5 = [(PGCurationCriteriaFactory *)self _sceneNamesFromBaseSceneNames:&unk_1F28D49F8 leafSceneNames:MEMORY[0x1E4F1CBF0]];
  uint64_t v6 = [[PGCurationSceneTrait alloc] initWithSceneNames:v5];
  [(PGCurationCriteria *)v4 setScenesTrait:v6];

  return v4;
}

- (id)_climbingCriteriaWithClient:(unint64_t)a3
{
  v5 = [[PGCurationCriteria alloc] initWithMinimumAssetsRatio:a3 client:0.1];
  uint64_t v6 = [(PGCurationCriteriaFactory *)self _sceneNamesFromBaseSceneNames:&unk_1F28D49E0 leafSceneNames:MEMORY[0x1E4F1CBF0]];
  v7 = [[PGCurationSceneTrait alloc] initWithSceneNames:v6];
  [(PGCurationCriteria *)v5 setScenesTrait:v7];

  if (a3 == 2) {
    [(PGCurationCriteria *)v5 setFaceFilter:0];
  }

  return v5;
}

- (id)_beachingCriteriaWithClient:(unint64_t)a3
{
  v5 = [[PGCurationCriteria alloc] initWithMinimumAssetsRatio:a3 client:0.1];
  uint64_t v6 = [(PGCurationCriteriaFactory *)self _sceneNamesFromBaseSceneNames:&unk_1F28D49C8 leafSceneNames:MEMORY[0x1E4F1CBF0]];
  v7 = [[PGCurationSceneTrait alloc] initWithSceneNames:v6];
  [(PGCurationCriteria *)v5 setScenesTrait:v7];

  if (a3 == 2) {
    [(PGCurationCriteria *)v5 setFaceFilter:0];
  }

  return v5;
}

- (id)_winterSportCriteriaWithClient:(unint64_t)a3
{
  v5 = [[PGCurationCriteria alloc] initWithMinimumAssetsRatio:a3 client:0.1];
  uint64_t v6 = [(PGCurationCriteriaFactory *)self _sceneNamesFromBaseSceneNames:&unk_1F28D49B0 leafSceneNames:MEMORY[0x1E4F1CBF0]];
  v7 = [[PGCurationSceneTrait alloc] initWithSceneNames:v6];
  [(PGCurationCriteria *)v5 setScenesTrait:v7];

  if (a3 == 2) {
    [(PGCurationCriteria *)v5 setFaceFilter:0];
  }

  return v5;
}

- (id)_divingCriteriaWithClient:(unint64_t)a3
{
  uint64_t v4 = [[PGCurationCriteria alloc] initWithMinimumAssetsRatio:a3 client:0.1];
  v5 = [(PGCurationCriteriaFactory *)self _sceneNamesFromBaseSceneNames:&unk_1F28D4998 leafSceneNames:MEMORY[0x1E4F1CBF0]];
  uint64_t v6 = [[PGCurationSceneTrait alloc] initWithSceneNames:v5];
  [(PGCurationCriteria *)v4 setScenesTrait:v6];

  [(PGCurationCriteria *)v4 setFaceFilter:0];
  return v4;
}

- (id)_hikingCriteriaWithClient:(unint64_t)a3
{
  v5 = [[PGCurationCriteria alloc] initWithMinimumAssetsRatio:a3 client:0.1];
  uint64_t v6 = [(PGCurationCriteriaFactory *)self _sceneNamesFromBaseSceneNames:&unk_1F28D4980 leafSceneNames:MEMORY[0x1E4F1CBF0]];
  v7 = [[PGCurationSceneTrait alloc] initWithSceneNames:v6];
  [(PGCurationCriteria *)v5 setScenesTrait:v7];

  if (a3 == 2) {
    [(PGCurationCriteria *)v5 setFaceFilter:0];
  }

  return v5;
}

- (id)_holidayEventCriteriaWithGraph:(id)a3 featureNodes:(id)a4 client:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [[PGCurationCriteria alloc] initWithMinimumAssetsRatio:a5 client:0.1];
  if ([v9 count])
  {
    uint64_t v11 = [(PGCurationCriteriaFactory *)self holidayServiceWithGraph:v8];
    v12 = +[PGGraphNodeCollection subsetInCollection:v9];
    v13 = [v12 anyNode];
    v14 = [v13 name];

    id v15 = [v11 sceneNamesForHolidayName:v14];
    v16 = [(PGCurationCriteriaFactory *)self _sceneNamesFromBaseSceneNames:v15 leafSceneNames:MEMORY[0x1E4F1CBF0]];
    id v17 = [[PGCurationSceneTrait alloc] initWithSceneNames:v16];
    [(PGCurationCriteria *)v10 setScenesTrait:v17];

    uint64_t v18 = [v11 peopleTraitForHolidayName:v14];
    long long v19 = +[PGGraphNodeCollection subsetInCollection:v9];
    long long v20 = v19;
    switch(v18)
    {
      case 1:
        id v27 = v8;
        long long v21 = [v19 personNodes];
        v22 = [v21 partnerPersonNodes];
        break;
      case 32:
        id v27 = v8;
        long long v21 = [v19 personNodes];
        v22 = [v21 motherPersonNodes];
        break;
      case 64:
        id v27 = v8;
        long long v21 = [v19 personNodes];
        v22 = [v21 fatherPersonNodes];
        break;
      default:
LABEL_9:

        goto LABEL_10;
    }
    uint64_t v23 = v22;
    v24 = [v22 localIdentifiers];

    v25 = [[PGCurationSetTrait alloc] initWithItems:v24];
    [(PGCurationCriteria *)v10 setPeopleTrait:v25];

    id v8 = v27;
    goto LABEL_9;
  }
LABEL_10:

  return v10;
}

- (id)_anniversaryCriteriaWithPersonLocalIdentifier:(id)a3 client:(unint64_t)a4
{
  id v5 = a3;
  if ([v5 length])
  {
    uint64_t v6 = [MEMORY[0x1E4F1CAD0] setWithObject:v5];
    v7 = [[PGCurationCriteria alloc] initWithMinimumAssetsRatio:a4 client:0.1];
    id v8 = [[PGCurationSetTrait alloc] initWithItems:v6];
    [(PGCurationCriteria *)v7 setPeopleTrait:v8];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_birthdayCriteriaWithPersonLocalIdentifiers:(id)a3 client:(unint64_t)a4
{
  id v6 = a3;
  if ([v6 count])
  {
    v7 = [[PGCurationCriteria alloc] initWithMinimumAssetsRatio:a4 client:0.1];
    id v8 = [(PGCurationCriteriaFactory *)self _sceneNamesFromBaseSceneNames:&unk_1F28D4968 leafSceneNames:MEMORY[0x1E4F1CBF0]];
    id v9 = [[PGCurationSceneTrait alloc] initWithSceneNames:v8];
    [(PGCurationCriteria *)v7 setScenesTrait:v9];

    uint64_t v10 = [[PGCurationSetTrait alloc] initWithItems:v6];
    [(PGCurationCriteria *)v7 setPeopleTrait:v10];

    uint64_t v11 = [(PGCurationCriteria *)v7 peopleTrait];
    [v11 setMinimumScore:1.0];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_weddingCriteriaWithClient:(unint64_t)a3
{
  uint64_t v4 = [[PGCurationCriteria alloc] initWithMinimumAssetsRatio:a3 client:0.07];
  id v5 = [(PGCurationCriteriaFactory *)self _sceneNamesFromBaseSceneNames:&unk_1F28D4950 leafSceneNames:MEMORY[0x1E4F1CBF0]];
  id v6 = [[PGCurationSceneTrait alloc] initWithSceneNames:v5];
  [(PGCurationCriteria *)v4 setScenesTrait:v6];

  return v4;
}

- (id)foodieCurationCriteriaWithPersonLocalIdentifier:(id)a3 client:(unint64_t)a4
{
  id v5 = a3;
  id v6 = [[PGCurationCriteria alloc] initWithMinimumAssetsRatio:a4 client:0.1];
  v7 = [PGCurationSetTrait alloc];
  id v8 = [MEMORY[0x1E4F1CAD0] setWithObject:v5];

  id v9 = [(PGCurationSetTrait *)v7 initWithItems:v8];
  [(PGCurationCriteria *)v6 setPeopleTrait:v9];

  uint64_t v10 = [(PGCurationCriteria *)v6 peopleTrait];
  [v10 setMinimumScore:1.0];

  return v6;
}

- (id)foodieCurationCriteriaWithClient:(unint64_t)a3
{
  v3 = [[PGCurationCriteria alloc] initWithMinimumAssetsRatio:a3 client:0.1];
  uint64_t v4 = objc_alloc_init(PGCurationSDFoodTrait);
  [(PGCurationCriteria *)v3 setSdFoodTrait:v4];

  id v5 = [[PGCurationCropScoreTrait alloc] initWithMinimumSquareCropScore:0.7];
  [(PGCurationCriteria *)v3 setCropScoreTrait:v5];

  return v3;
}

- (id)curationCriteriaWithSeasonName:(id)a3 client:(unint64_t)a4
{
  id v6 = a3;
  v7 = v6;
  if (a4 != 1)
  {
    if ([v6 isEqualToString:*MEMORY[0x1E4F76BD8]])
    {
      uint64_t v11 = [(PGCurationCriteriaFactory *)self _searchWinterCriteria];
    }
    else if ([v7 isEqualToString:*MEMORY[0x1E4F76BC8]])
    {
      uint64_t v11 = [(PGCurationCriteriaFactory *)self _searchSpringCriteria];
    }
    else if ([v7 isEqualToString:*MEMORY[0x1E4F76BD0]])
    {
      uint64_t v11 = [(PGCurationCriteriaFactory *)self _searchSummerCriteria];
    }
    else
    {
      if (![v7 isEqualToString:*MEMORY[0x1E4F76BC0]])
      {
        uint64_t v10 = 0;
        goto LABEL_14;
      }
      uint64_t v11 = [(PGCurationCriteriaFactory *)self _searchFallCriteria];
    }
    uint64_t v10 = (void *)v11;
LABEL_14:
    [v10 setFaceFilter:2];
    goto LABEL_15;
  }
  id v8 = +[PGLogging sharedLogging];
  id v9 = [v8 loggingConnection];

  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v13 = 0;
    _os_log_error_impl(&dword_1D1805000, v9, OS_LOG_TYPE_ERROR, "Curation criteria are not defined for client PGCriteriaClientMemories", v13, 2u);
  }

  uint64_t v10 = 0;
LABEL_15:

  return v10;
}

- (id)tripCurationCriteriaWithCollection:(id)a3 client:(unint64_t)a4
{
  if ([a3 isShortTrip]) {
    [(PGCurationCriteriaFactory *)self _shortTripCriteriaWithClient:a4];
  }
  else {
  id v6 = [(PGCurationCriteriaFactory *)self _longTripCriteriaWithClient:a4];
  }
  return v6;
}

- (id)petCurationCriteriaWithCollection:(id)a3 client:(unint64_t)a4 curationContext:(id)a5
{
  id v7 = a5;
  id v8 = [a3 eventEnrichmentMomentNodes];
  id v9 = [v8 petNodes];

  if ([v9 count])
  {
    uint64_t v10 = [v9 uuids];
    uint64_t v11 = (void *)[v10 mutableCopy];

    v12 = [v7 hiddenOrBlockedPersonUUIDs];
    [v11 minusSet:v12];

    v13 = [MEMORY[0x1E4F391F0] localIdentifiersWithUUIDs:v11];
    if ([v13 count])
    {
      v14 = [[PGCurationCriteria alloc] initWithMinimumAssetsRatio:a4 client:0.1];
      id v15 = [[PGCurationSetTrait alloc] initWithItems:v13];
      [(PGCurationCriteria *)v14 setPeopleTrait:v15];

      v16 = [(PGCurationCriteria *)v14 peopleTrait];
      [v16 setMinimumScore:1.0];
    }
    else
    {
      v14 = 0;
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)curationCriteriaWithCollection:(id)a3 meaningLabel:(id)a4 inGraph:(id)a5 client:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([v11 isEqualToString:@"Birthday"])
  {
    uint64_t v13 = [v10 birthdayPersonNodes];
LABEL_5:
    v14 = (void *)v13;
    goto LABEL_7;
  }
  if ([v11 isEqualToString:@"Anniversary"])
  {
    uint64_t v13 = [v10 anniversaryPersonNodes];
    goto LABEL_5;
  }
  v14 = 0;
LABEL_7:
  id v15 = [v14 featureNodeCollection];
  v16 = [(PGCurationCriteriaFactory *)self curationCriteriaWithMeaningLabel:v11 featureNodes:v15 inGraph:v12 client:a6];

  return v16;
}

- (id)curationCriteriaWithMeaningLabel:(id)a3 featureNodes:(id)a4 inGraph:(id)a5 client:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([v10 isEqualToString:@"Wedding"])
  {
    uint64_t v13 = [(PGCurationCriteriaFactory *)self _weddingCriteriaWithClient:a6];
LABEL_3:
    v14 = (void *)v13;
    if (!v11) {
      goto LABEL_31;
    }
    goto LABEL_28;
  }
  if (![v10 isEqualToString:@"Birthday"])
  {
    if (![v10 isEqualToString:@"Anniversary"])
    {
      if ([v10 isEqualToString:@"HolidayEvent"])
      {
        uint64_t v13 = [(PGCurationCriteriaFactory *)self _holidayEventCriteriaWithGraph:v12 featureNodes:v11 client:a6];
      }
      else if (([v10 isEqualToString:@"Entertainment"] & 1) != 0 {
             || [v10 isEqualToString:@"AmusementPark"])
      }
      {
        uint64_t v13 = [(PGCurationCriteriaFactory *)self _entertainmentCriteriaWithClient:a6];
      }
      else if ([v10 isEqualToString:@"Concert"])
      {
        uint64_t v13 = [(PGCurationCriteriaFactory *)self _concertCriteriaWithClient:a6];
      }
      else if ([v10 isEqualToString:@"Festival"])
      {
        uint64_t v13 = [(PGCurationCriteriaFactory *)self _festivalCriteriaWithClient:a6];
      }
      else if ([v10 isEqualToString:@"SportEvent"])
      {
        uint64_t v13 = [(PGCurationCriteriaFactory *)self _sportEventCriteriaWithClient:a6];
      }
      else if ([v10 isEqualToString:@"NightOut"])
      {
        uint64_t v13 = [(PGCurationCriteriaFactory *)self _nightOutCriteriaWithClient:a6];
      }
      else if ([v10 isEqualToString:@"Performance"])
      {
        uint64_t v13 = [(PGCurationCriteriaFactory *)self _performanceCriteriaWithClient:a6];
      }
      else if ([v10 isEqualToString:@"Museum"])
      {
        uint64_t v13 = [(PGCurationCriteriaFactory *)self _museumCriteriaWithClient:a6];
      }
      else if ([v10 isEqualToString:@"Diving"])
      {
        uint64_t v13 = [(PGCurationCriteriaFactory *)self _divingCriteriaWithClient:a6];
      }
      else if ([v10 isEqualToString:@"Hiking"])
      {
        uint64_t v13 = [(PGCurationCriteriaFactory *)self _hikingCriteriaWithClient:a6];
      }
      else if ([v10 isEqualToString:@"WinterSport"])
      {
        uint64_t v13 = [(PGCurationCriteriaFactory *)self _winterSportCriteriaWithClient:a6];
      }
      else if ([v10 isEqualToString:@"Beaching"])
      {
        uint64_t v13 = [(PGCurationCriteriaFactory *)self _beachingCriteriaWithClient:a6];
      }
      else if ([v10 isEqualToString:@"Climbing"])
      {
        uint64_t v13 = [(PGCurationCriteriaFactory *)self _climbingCriteriaWithClient:a6];
      }
      else if ([v10 isEqualToString:@"Breakfast"])
      {
        uint64_t v13 = [(PGCurationCriteriaFactory *)self _breakfastCriteriaWithClient:a6];
      }
      else if ([v10 isEqualToString:@"Lunch"])
      {
        uint64_t v13 = [(PGCurationCriteriaFactory *)self _lunchCriteriaWithClient:a6];
      }
      else
      {
        if (![v10 isEqualToString:@"Dinner"])
        {
          v14 = 0;
          if (!v11) {
            goto LABEL_31;
          }
          goto LABEL_28;
        }
        uint64_t v13 = [(PGCurationCriteriaFactory *)self _dinnerCriteriaWithClient:a6];
      }
      goto LABEL_3;
    }
    if (v11)
    {
      id v15 = +[PGGraphNodeCollection subsetInCollection:v11];
      if ([v15 count])
      {
        v16 = [v15 localIdentifiers];
        id v17 = [v16 anyObject];
        v14 = [(PGCurationCriteriaFactory *)self _anniversaryCriteriaWithPersonLocalIdentifier:v17 client:a6];

        goto LABEL_13;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        long long v21 = MEMORY[0x1E4F14500];
        v22 = "Asking for Anniversary meaning criteria with no associated featured person";
        uint64_t v23 = buf;
        goto LABEL_45;
      }
LABEL_26:
      v14 = 0;
      goto LABEL_27;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      __int16 v30 = 0;
      uint64_t v18 = MEMORY[0x1E4F14500];
      long long v19 = "Asking for Anniversary meaning criteria with no associated feature node";
      long long v20 = (uint8_t *)&v30;
      goto LABEL_41;
    }
LABEL_24:
    v14 = 0;
    goto LABEL_31;
  }
  if (!v11)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      __int16 v32 = 0;
      uint64_t v18 = MEMORY[0x1E4F14500];
      long long v19 = "Asking for Birthday meaning criteria with no associated feature node";
      long long v20 = (uint8_t *)&v32;
LABEL_41:
      _os_log_error_impl(&dword_1D1805000, v18, OS_LOG_TYPE_ERROR, v19, v20, 2u);
      goto LABEL_24;
    }
    goto LABEL_24;
  }
  id v15 = +[PGGraphNodeCollection subsetInCollection:v11];
  if (![v15 count])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      __int16 v33 = 0;
      long long v21 = MEMORY[0x1E4F14500];
      v22 = "Asking for Birthday meaning criteria with no associated featured person";
      uint64_t v23 = (uint8_t *)&v33;
LABEL_45:
      _os_log_error_impl(&dword_1D1805000, v21, OS_LOG_TYPE_ERROR, v22, v23, 2u);
      goto LABEL_26;
    }
    goto LABEL_26;
  }
  v16 = [v15 localIdentifiers];
  v14 = [(PGCurationCriteriaFactory *)self _birthdayCriteriaWithPersonLocalIdentifiers:v16 client:a6];
LABEL_13:

LABEL_27:
LABEL_28:
  v24 = +[PGGraphNodeCollection subsetInCollection:v11];
  if ([v24 count])
  {
    v25 = [PGCurationSetTrait alloc];
    v26 = [v24 memberNodes];
    id v27 = [v26 localIdentifiers];
    v28 = [(PGCurationSetTrait *)v25 initWithItems:v27];
    [v14 setSocialGroupTrait:v28];
  }
LABEL_31:

  return v14;
}

- (id)holidayServiceWithGraph:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  id v6 = [v4 infoNode];
  id v7 = [v6 locale];

  id v8 = [(NSMutableDictionary *)v5->_holidayServiceByLocale objectForKeyedSubscript:v7];
  if (!v8) {
    id v8 = (void *)[objc_alloc(MEMORY[0x1E4F76CB8]) initWithLocale:v7];
  }

  objc_sync_exit(v5);
  return v8;
}

- (PGCurationCriteriaFactory)init
{
  v6.receiver = self;
  v6.super_class = (Class)PGCurationCriteriaFactory;
  v2 = [(PGCurationCriteriaFactory *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F8E790]) initForSceneNetOnly:1];
    sceneTaxonomy = v2->_sceneTaxonomy;
    v2->_sceneTaxonomy = (CLSSceneTaxonomyHierarchy *)v3;
  }
  return v2;
}

@end
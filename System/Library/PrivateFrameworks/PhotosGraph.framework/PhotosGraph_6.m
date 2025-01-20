void sub_1D1BAA550(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x258], 8);
  _Unwind_Resume(a1);
}

void __bestAssetIdentifiersForMeaningNodes_block_invoke(uint64_t a1, void *a2)
{
  id v13 = a2;
  ++*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
  v3 = [v13 UUID];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v5 = [v13 UUID];
  [v4 addObject:v5];

  v6 = [v13 eventCollection];
  v7 = [v6 eventMomentNodes];
  v8 = [v7 uuids];
  [v4 unionSet:v8];

  if (*(unsigned char *)(a1 + 80) && [*(id *)(a1 + 32) intersectsSet:v4]) {
    v9 = (id *)(a1 + 40);
  }
  else {
    v9 = (id *)(a1 + 48);
  }
  [*v9 addObject:v13];
  v10 = [*(id *)(a1 + 56) objectForKeyedSubscript:v3];
  v11 = v10;
  if (v10)
  {
    [v10 addObject:*(void *)(a1 + 64)];
  }
  else
  {
    v12 = [MEMORY[0x1E4F1CA80] setWithObject:*(void *)(a1 + 64)];
    [*(id *)(a1 + 56) setObject:v12 forKeyedSubscript:v3];
  }
}

id bestEventNodeForEventNodes(void *a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  v2 = [v1 anyObject];
  v3 = [(id)objc_opt_class() scoreSortDescriptors];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = v1;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    v7 = 0;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v4);
        }
        v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (!v7 || compareWithSortDescriptors(*(void **)(*((void *)&v13 + 1) + 8 * i), v7, v3) == -1)
        {
          id v11 = v10;

          v7 = v11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t displayInfoFromZeroKeyword(void *a1, const char *a2)
{
  return [a1 objectForKeyedSubscript:*MEMORY[0x1E4F8B450]];
}

id zeroKeywordForSocialGroupWithIdentifier(void *a1, void *a2, void *a3)
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  if (v5) {
    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F8ACC8]) initWithIdentifier:v5 userCategory:5];
  }
  else {
    uint64_t v8 = 0;
  }
  if (![v6 count])
  {

    id v6 = (id)MEMORY[0x1E4F1CBF0];
  }
  if (![v7 count])
  {

    id v7 = (id)MEMORY[0x1E4F1CBF0];
  }
  uint64_t v9 = *MEMORY[0x1E4F8B490];
  v15[0] = *MEMORY[0x1E4F8B460];
  v15[1] = v9;
  v16[0] = v7;
  v16[1] = v6;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
  if (v8)
  {
    id v11 = _zeroKeywordWithToken(1, 0, v10, v8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v13 = 138412290;
      id v14 = v5;
      _os_log_error_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Nil social group query token with searchIdentifier %@", (uint8_t *)&v13, 0xCu);
    }
    id v11 = 0;
  }

  return v11;
}

id zeroKeywordForLocationOrAreaWithName(void *a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  v34[3] = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a1;
  int v13 = [v10 domain];
  if (v13 == 201)
  {
    long long v16 = [v10 stateOrBiggerParentLocationNode];
  }
  else if (v13 == 200)
  {
    id v14 = [v10 locationNodeCollection];
    long long v15 = [v14 parentLocationNodes];
    long long v16 = [v15 anyNode];
  }
  else
  {
    long long v16 = 0;
  }
  int v17 = _os_feature_enabled_impl();
  uint64_t v18 = *MEMORY[0x1E4F8B478];
  if (v17)
  {
    v34[0] = v9;
    uint64_t v19 = *MEMORY[0x1E4F8B458];
    v33[0] = v18;
    v33[1] = v19;
    v20 = [NSNumber numberWithBool:a5];
    v33[2] = *MEMORY[0x1E4F8B460];
    v34[1] = v20;
    v34[2] = v11;
    v21 = (void *)MEMORY[0x1E4F1C9E8];
    v22 = v34;
    v23 = v33;
    uint64_t v24 = 3;
  }
  else
  {
    uint64_t v25 = *MEMORY[0x1E4F8B458];
    v31[0] = *MEMORY[0x1E4F8B478];
    v31[1] = v25;
    v32[0] = v9;
    v20 = [NSNumber numberWithBool:a5];
    v32[1] = v20;
    v21 = (void *)MEMORY[0x1E4F1C9E8];
    v22 = v32;
    v23 = v31;
    uint64_t v24 = 2;
  }
  v26 = [v21 dictionaryWithObjects:v22 forKeys:v23 count:v24];

  if (v16)
  {
    v27 = _locationNameByCategoryForLocation(v16);
  }
  else
  {
    v27 = 0;
  }
  v28 = (void *)[objc_alloc(MEMORY[0x1E4F8ACC0]) initWithText:v12 locationNameByCategory:v27];
  [v28 setUserControlledCategoriesUseWildcard:0];
  v29 = _zeroKeywordWithToken(2, v12, v26, v28);

  return v29;
}

id zeroKeywordLocalizationKeyForMeaningLabel(void *a1)
{
  uint64_t v1 = zeroKeywordLocalizationKeyForMeaningLabel_onceToken;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&zeroKeywordLocalizationKeyForMeaningLabel_onceToken, &__block_literal_global_294);
  }
  v3 = [(id)zeroKeywordLocalizationKeyForMeaningLabel_localizationKeysForMeaningLabel objectForKeyedSubscript:v2];

  return v3;
}

void __zeroKeywordLocalizationKeyForMeaningLabel_block_invoke()
{
  v3[9] = *MEMORY[0x1E4F143B8];
  v2[0] = @"AmusementPark";
  v2[1] = @"Concert";
  v3[0] = @"PGMeaningAmusementParkZeroKeywordText";
  v3[1] = @"PGMeaningConcertZeroKeywordText";
  v2[2] = @"Festival";
  v2[3] = @"SportEvent";
  v3[2] = @"PGMeaningFestivalZeroKeywordText";
  v3[3] = @"PGMeaningSportEventZeroKeywordText";
  v2[4] = @"Museum";
  v2[5] = @"Birthday";
  v3[4] = @"PGMeaningMuseumZeroKeywordText";
  v3[5] = @"PGMeaningBirthdayZeroKeywordText";
  v2[6] = @"Anniversary";
  v2[7] = @"Wedding";
  v3[6] = @"PGMeaningAnniversaryZeroKeywordText";
  v3[7] = @"PGMeaningWeddingZeroKeywordText";
  v2[8] = @"Restaurant";
  v3[8] = @"PGMeaningRestaurantZeroKeywordText";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:9];
  uint64_t v1 = (void *)zeroKeywordLocalizationKeyForMeaningLabel_localizationKeysForMeaningLabel;
  zeroKeywordLocalizationKeyForMeaningLabel_localizationKeysForMeaningLabel = v0;
}

id localizationKeyForMeaningLabel(void *a1)
{
  uint64_t v1 = localizationKeyForMeaningLabel_onceToken;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&localizationKeyForMeaningLabel_onceToken, &__block_literal_global_323);
  }
  v3 = [(id)localizationKeyForMeaningLabel_localizationKeysForMeaningLabel objectForKeyedSubscript:v2];

  return v3;
}

void __localizationKeyForMeaningLabel_block_invoke()
{
  v3[26] = *MEMORY[0x1E4F143B8];
  v2[0] = @"Activity";
  v2[1] = @"Hiking";
  v3[0] = @"PGMeaningActivitySearchableText";
  v3[1] = @"PGMeaningHikingSearchableText";
  v2[2] = @"Beaching";
  v2[3] = @"Diving";
  v3[2] = @"PGMeaningBeachingSearchableText";
  v3[3] = @"PGMeaningDivingSearchableText";
  v2[4] = @"WinterSport";
  v2[5] = @"Climbing";
  v3[4] = @"PGMeaningWinterSportSearchableText";
  v3[5] = @"PGMeaningClimbingSearchableText";
  v2[6] = @"Entertainment";
  v2[7] = @"AmusementPark";
  v3[6] = @"PGMeaningEntertainmentSearchableText";
  v3[7] = @"PGMeaningAmusementParkSearchableText";
  v2[8] = @"Performance";
  void v2[9] = @"Concert";
  v3[8] = @"PGMeaningPerformanceSearchableText";
  v3[9] = @"PGMeaningConcertSearchableText";
  v2[10] = @"Festival";
  v2[11] = @"Theater";
  void v3[10] = @"PGMeaningFestivalSearchableText";
  v3[11] = @"PGMeaningTheaterSearchableText";
  v2[12] = @"Dance";
  v2[13] = @"SportEvent";
  v3[12] = @"PGMeaningDanceSearchableText";
  v3[13] = @"PGMeaningSportEventSearchableText";
  v2[14] = @"NightOut";
  v2[15] = @"Museum";
  v3[14] = @"PGMeaningNightOutSearchableText";
  v3[15] = @"PGMeaningMuseumSearchableText";
  v2[16] = @"Celebration";
  v2[17] = @"Birthday";
  v3[16] = @"PGMeaningCelebrationSearchableText";
  v3[17] = @"PGMeaningBirthdaySearchableText";
  v2[18] = @"Anniversary";
  v2[19] = @"Wedding";
  v3[18] = @"PGMeaningAnniversarySearchableText";
  v3[19] = @"PGMeaningWeddingSearchableText";
  v2[20] = @"HolidayEvent";
  v2[21] = @"Gathering";
  v3[20] = @"PGMeaningHolidayEventSearchableText";
  v3[21] = @"PGMeaningGatheringSearchableText";
  v2[22] = @"Restaurant";
  v2[23] = @"Breakfast";
  v3[22] = @"PGMeaningRestaurantSearchableText";
  v3[23] = @"PGMeaningBreakfastSearchableText";
  v2[24] = @"Lunch";
  v2[25] = @"Dinner";
  v3[24] = @"PGMeaningLunchSearchableText";
  v3[25] = @"PGMeaningDinnerSearchableText";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:26];
  uint64_t v1 = (void *)localizationKeyForMeaningLabel_localizationKeysForMeaningLabel;
  localizationKeyForMeaningLabel_localizationKeysForMeaningLabel = v0;
}

uint64_t zeroKeywordLocalizationKeyForSceneLabel(uint64_t a1)
{
  return [NSString stringWithFormat:@"PGScene%@ZeroKeywordText", a1];
}

id localizationKeyForPOILabel(void *a1)
{
  uint64_t v1 = localizationKeyForPOILabel_onceToken;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&localizationKeyForPOILabel_onceToken, &__block_literal_global_407);
  }
  v3 = [(id)localizationKeyForPOILabel_localizationKeyForPOILabel objectForKeyedSubscript:v2];

  return v3;
}

void __localizationKeyForPOILabel_block_invoke()
{
  v3[14] = *MEMORY[0x1E4F143B8];
  v2[0] = @"Restaurant";
  v2[1] = @"Nightlife";
  v3[0] = @"PGPlaceRestaurantSearchableText";
  v3[1] = @"PGPlaceNightlifeSearchableText";
  v2[2] = @"Travel";
  v2[3] = @"Culture";
  v3[2] = @"PGPlaceTravelSearchableText";
  v3[3] = @"PGPlaceCultureSearchableText";
  v2[4] = @"Museum";
  v2[5] = @"Entertainment";
  v3[4] = @"PGPlaceMuseumSearchableText";
  v3[5] = @"PGPlaceEntertainmentSearchableText";
  v2[6] = @"AmusementPark";
  v2[7] = @"Park";
  v3[6] = @"PGPlaceAmusementParkSearchableText";
  v3[7] = @"PGPlaceParkSearchableText";
  v2[8] = @"Performance";
  void v2[9] = @"Stadium";
  v3[8] = @"PGPlacePerformanceSearchableText";
  v3[9] = @"PGPlaceStadiumSearchableText";
  v2[10] = @"Activity";
  v2[11] = @"Diving";
  void v3[10] = @"PGPlaceActivitySearchableText";
  v3[11] = @"PGPlaceDivingSearchableText";
  v2[12] = @"Hiking";
  v2[13] = @"Hospital";
  v3[12] = @"PGPlaceHikingSearchableText";
  v3[13] = @"PGPlaceHospitalSearchableText";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:14];
  uint64_t v1 = (void *)localizationKeyForPOILabel_localizationKeyForPOILabel;
  localizationKeyForPOILabel_localizationKeyForPOILabel = v0;
}

id localizationKeyForROILabel(void *a1)
{
  uint64_t v1 = localizationKeyForROILabel_onceToken;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&localizationKeyForROILabel_onceToken, &__block_literal_global_451);
  }
  v3 = [(id)localizationKeyForROILabel_localizationKeyForROILabel objectForKeyedSubscript:v2];

  return v3;
}

void __localizationKeyForROILabel_block_invoke()
{
  v3[5] = *MEMORY[0x1E4F143B8];
  v2[0] = @"Urban";
  v2[1] = @"Beach";
  v3[0] = @"PGPlaceUrbanSearchableText";
  v3[1] = @"PGPlaceBeachSearchableText";
  v2[2] = @"Mountain";
  v2[3] = @"Nature";
  v3[2] = @"PGPlaceMountainSearchableText";
  v3[3] = @"PGPlaceNatureSearchableText";
  v2[4] = @"Water";
  v3[4] = @"PGPlaceWaterSearchableText";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:5];
  uint64_t v1 = (void *)localizationKeyForROILabel_localizationKeyForROILabel;
  localizationKeyForROILabel_localizationKeyForROILabel = v0;
}

id identifierForSeasonLabel(void *a1)
{
  uint64_t v1 = identifierForSeasonLabel_onceToken[0];
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(identifierForSeasonLabel_onceToken, &__block_literal_global_468);
  }
  v3 = [(id)identifierForSeasonLabel_identifiersForSeasonLabel objectForKeyedSubscript:v2];

  id v4 = [v3 stringValue];

  return v4;
}

void __identifierForSeasonLabel_block_invoke()
{
  v5[4] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F76BD0];
  v4[0] = *MEMORY[0x1E4F76BC8];
  v4[1] = v0;
  v5[0] = &unk_1F28D08E8;
  v5[1] = &unk_1F28D0900;
  uint64_t v1 = *MEMORY[0x1E4F76BD8];
  v4[2] = *MEMORY[0x1E4F76BC0];
  v4[3] = v1;
  v5[2] = &unk_1F28D0918;
  v5[3] = &unk_1F28D0930;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:4];
  v3 = (void *)identifierForSeasonLabel_identifiersForSeasonLabel;
  identifierForSeasonLabel_identifiersForSeasonLabel = v2;
}

id identifierForMeaningLabel(void *a1)
{
  uint64_t v1 = identifierForMeaningLabel_onceToken;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&identifierForMeaningLabel_onceToken, &__block_literal_global_476);
  }
  v3 = [(id)identifierForMeaningLabel_identifiersForMeaningLabel objectForKeyedSubscript:v2];

  id v4 = [v3 stringValue];

  return v4;
}

void __identifierForMeaningLabel_block_invoke()
{
  v3[38] = *MEMORY[0x1E4F143B8];
  v2[0] = @"Activity";
  v2[1] = @"Hiking";
  v3[0] = &unk_1F28D08E8;
  v3[1] = &unk_1F28D0900;
  v2[2] = @"Climbing";
  v2[3] = @"Beaching";
  v3[2] = &unk_1F28D0918;
  v3[3] = &unk_1F28D0930;
  v2[4] = @"Diving";
  void v2[5] = @"WinterSport";
  v3[4] = &unk_1F28D0948;
  v3[5] = &unk_1F28D0960;
  v2[6] = @"Entertainment";
  v2[7] = @"AmusementPark";
  void v3[6] = &unk_1F28D0978;
  v3[7] = &unk_1F28D0990;
  v2[8] = @"Performance";
  void v2[9] = @"Concert";
  v3[8] = &unk_1F28D09A8;
  v3[9] = &unk_1F28D09C0;
  v2[10] = @"Festival";
  v2[11] = @"Theater";
  void v3[10] = &unk_1F28D09D8;
  v3[11] = &unk_1F28D09F0;
  v2[12] = @"Dance";
  v2[13] = @"SportEvent";
  v3[12] = &unk_1F28D0A08;
  v3[13] = &unk_1F28D0A20;
  void v2[14] = @"NightOut";
  v2[15] = @"Museum";
  v3[14] = &unk_1F28D0A38;
  void v3[15] = &unk_1F28D0A50;
  v2[16] = @"Celebration";
  v2[17] = @"Birthday";
  v3[16] = &unk_1F28D0A68;
  v3[17] = &unk_1F28D0A80;
  v2[18] = @"Anniversary";
  v2[19] = @"Wedding";
  v3[18] = &unk_1F28D0A98;
  v3[19] = &unk_1F28D0AB0;
  v2[20] = @"HolidayEvent";
  v2[21] = @"Gathering";
  v3[20] = &unk_1F28D0AC8;
  v3[21] = &unk_1F28D0AE0;
  v2[22] = @"PersonToys";
  v2[23] = @"PersonBeachWater";
  v3[22] = &unk_1F28D0AF8;
  v3[23] = &unk_1F28D0B10;
  v2[24] = @"PersonPlayground";
  v2[25] = @"PersonSoccer";
  v3[24] = &unk_1F28D0B28;
  v3[25] = &unk_1F28D0B40;
  void v2[26] = @"PersonMartialArts";
  v2[27] = @"PersonActionSwimming";
  v3[26] = &unk_1F28D0B58;
  void v3[27] = &unk_1F28D0B70;
  v2[28] = @"PersonActionPlayingOnASwing";
  v2[29] = @"PersonActionPlayingOnASlide";
  v3[28] = &unk_1F28D0B88;
  v3[29] = &unk_1F28D0BA0;
  v2[30] = @"PersonActionHugging";
  v2[31] = @"PersonActionKissing";
  v3[30] = &unk_1F28D0BB8;
  v3[31] = &unk_1F28D0BD0;
  v2[32] = @"PersonActionJumpingOrLeaping";
  v2[33] = @"PersonActionRunningOrJogging";
  v3[32] = &unk_1F28D0BE8;
  v3[33] = &unk_1F28D0C00;
  v2[34] = @"Restaurant";
  v2[35] = @"Breakfast";
  v3[34] = &unk_1F28D0C18;
  v3[35] = &unk_1F28D0C30;
  v2[36] = @"Lunch";
  v2[37] = @"Dinner";
  v3[36] = &unk_1F28D0C48;
  v3[37] = &unk_1F28D0C60;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:38];
  uint64_t v1 = (void *)identifierForMeaningLabel_identifiersForMeaningLabel;
  identifierForMeaningLabel_identifiersForMeaningLabel = v0;
}

void sub_1D1BAC2C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7138(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7139(uint64_t a1)
{
}

uint64_t _moodFromMoodAsNumber(void *a1)
{
  id v1 = a1;
  id v2 = v1;
  if (!v1) {
    goto LABEL_6;
  }
  uint64_t v3 = [v1 unsignedLongLongValue];
  uint64_t v4 = v3;
  if (v3 <= 127)
  {
    if (((unint64_t)(v3 - 4) > 0x3C || ((1 << (v3 - 4)) & 0x1000000010001011) == 0)
      && (unint64_t)v3 >= 3)
    {
      goto LABEL_6;
    }
  }
  else if (v3 != 128 && v3 != 256 && v3 != 512)
  {
LABEL_6:
    uint64_t v4 = 16;
  }

  return v4;
}

void sub_1D1BAECC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7575(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7576(uint64_t a1)
{
}

void sub_1D1BAF38C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
}

uint64_t PGManagerPersonNodeComparisonBlock_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = [v4 name];
  uint64_t v7 = [v6 length];

  uint64_t v8 = [v5 name];
  uint64_t v9 = [v8 length];

  if (v7 || !v9)
  {
    if (!v9 && v7) {
      goto LABEL_9;
    }
    [v4 personScore];
    double v12 = v11;
    [v5 personScore];
    if (v12 == v13)
    {
      double v12 = (double)(unint64_t)[v4 edgesCount];
      double v13 = (double)(unint64_t)[v5 edgesCount];
    }
    if (v12 > v13)
    {
LABEL_9:
      uint64_t v10 = -1;
      goto LABEL_10;
    }
    if (v12 >= v13)
    {
      long long v15 = [v4 localIdentifier];
      long long v16 = [v5 localIdentifier];
      uint64_t v10 = [v15 compare:v16];

      goto LABEL_10;
    }
  }
  uint64_t v10 = 1;
LABEL_10:

  return v10;
}

void *PGRelationshipTypeFromRelationshipLabel(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"FAMILY"])
  {
    id v2 = &unk_1F28D0D20;
  }
  else if ([v1 isEqualToString:@"PARENT"])
  {
    id v2 = &unk_1F28D0D38;
  }
  else if ([v1 isEqualToString:@"MOTHER"])
  {
    id v2 = &unk_1F28D0D50;
  }
  else if ([v1 isEqualToString:@"FATHER"])
  {
    id v2 = &unk_1F28D0D68;
  }
  else if ([v1 isEqualToString:@"SISTER"])
  {
    id v2 = &unk_1F28D0D80;
  }
  else if ([v1 isEqualToString:@"BROTHER"])
  {
    id v2 = &unk_1F28D0D98;
  }
  else if ([v1 isEqualToString:@"CHILD"])
  {
    id v2 = &unk_1F28D0DB0;
  }
  else if ([v1 isEqualToString:@"DAUGHTER"])
  {
    id v2 = &unk_1F28D0DC8;
  }
  else if ([v1 isEqualToString:@"SON"])
  {
    id v2 = &unk_1F28D0DE0;
  }
  else if ([v1 isEqualToString:@"PARTNER"])
  {
    id v2 = &unk_1F28D0DF8;
  }
  else if ([v1 isEqualToString:@"FRIEND"])
  {
    id v2 = &unk_1F28D0E10;
  }
  else if ([v1 isEqualToString:@"COWORKER"])
  {
    id v2 = &unk_1F28D0E28;
  }
  else
  {
    id v2 = &unk_1F28D0E40;
  }

  return v2;
}

void sub_1D1BB170C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1BB1D24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
}

uint64_t __Block_byref_object_copy__7687(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7688(uint64_t a1)
{
}

void sub_1D1BB1FD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1BB2260(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1BB2458(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1BB267C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1BB33F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va1, a13);
  va_start(va, a13);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  uint64_t v19 = va_arg(va1, void);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1D1BB4344(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_1D1BB79BC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t PGIsAppleInternal()
{
  if (PGIsAppleInternal_onceToken != -1) {
    dispatch_once(&PGIsAppleInternal_onceToken, &__block_literal_global_8452);
  }
  return PGIsAppleInternal_isAppleInternal;
}

uint64_t __PGIsAppleInternal_block_invoke()
{
  uint64_t result = os_variant_has_internal_diagnostics();
  PGIsAppleInternal_isAppleInternal = result;
  return result;
}

id PGFullMethodName(void *a1, const char *a2)
{
  id v3 = a1;
  uint64_t v4 = objc_opt_class();

  id v5 = NSString;
  id v6 = NSStringFromSelector(a2);
  uint64_t v7 = 45;
  if ((id)v4 == v3) {
    uint64_t v7 = 43;
  }
  uint64_t v8 = [v5 stringWithFormat:@"%c[%@ %@]", v7, v4, v6];

  return v8;
}

id PGAbstractMethodException(void *a1, const char *a2)
{
  id v3 = a1;
  uint64_t v4 = PGFullMethodName(v3, a2);
  id v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3C8];
  uint64_t v7 = [NSString stringWithFormat:@"%@: must override selector sent to %p", v4, v3];

  uint64_t v8 = [v5 exceptionWithName:v6 reason:v7 userInfo:0];

  return v8;
}

id PGMethodNotImplentedException(void *a1, const char *a2)
{
  id v3 = a1;
  uint64_t v4 = PGFullMethodName(v3, a2);
  id v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3C8];
  uint64_t v7 = [NSString stringWithFormat:@"%@:  method not implemented sent to %p", v4, v3];

  uint64_t v8 = [v5 exceptionWithName:v6 reason:v7 userInfo:0];

  return v8;
}

id PGMethodForbiddenException(void *a1, const char *a2)
{
  id v3 = a1;
  uint64_t v4 = PGFullMethodName(v3, a2);
  id v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3C8];
  uint64_t v7 = [NSString stringWithFormat:@"%@:  forbidden method sent to %p", v4, v3];

  uint64_t v8 = [v5 exceptionWithName:v6 reason:v7 userInfo:0];

  return v8;
}

void sub_1D1BBA25C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
}

void sub_1D1BBAFF4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 256), 8);
  _Block_object_dispose((const void *)(v1 - 224), 8);
  _Unwind_Resume(a1);
}

void sub_1D1BBC0A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57)
{
}

void sub_1D1BBE2CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void PGBenchmarkGetHostMemory(void *a1, void *a2)
{
  long long v13 = 0u;
  memset(v14, 0, sizeof(v14));
  long long v11 = 0u;
  *(_OWORD *)host_info_out = 0u;
  *(_OWORD *)uint64_t v9 = 0u;
  long long v10 = 0u;
  mach_msg_type_number_t host_info_outCnt = 15;
  host_t v4 = MEMORY[0x1D25FEC70]();
  mach_error_t v5 = host_statistics(v4, 2, host_info_out, &host_info_outCnt);
  if (v5) {
    mach_error("can't get host_vm_info???\n", v5);
  }
  mach_msg_type_number_t host_info_outCnt = 12;
  host_t v6 = MEMORY[0x1D25FEC70]();
  mach_error_t v7 = host_info(v6, 1, v9, &host_info_outCnt);
  if (v7) {
    mach_error("can't get host_basic_info???\n", v7);
  }
  *a2 = *MEMORY[0x1E4F14B00] * host_info_out[0];
  *a1 = *((void *)&v11 + 1);
}

uint64_t PGBenchmarkGetAppMemory()
{
  long long v4 = 0u;
  long long v5 = 0u;
  *(_OWORD *)task_info_out = 0u;
  mach_msg_type_number_t task_info_outCnt = 12;
  mach_error_t v0 = task_info(*MEMORY[0x1E4F14960], 0x14u, task_info_out, &task_info_outCnt);
  if (v0) {
    mach_error("can't get task_basic_info???\n", v0);
  }
  return *(void *)&task_info_out[2];
}

uint64_t PGBenchmarkGetAppMallocMemory()
{
  return 0;
}

void sub_1D1BC068C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __isRecognizedROITopic_block_invoke()
{
  v6[5] = *MEMORY[0x1E4F143B8];
  mach_error_t v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = *MEMORY[0x1E4F76B58];
  v6[0] = *MEMORY[0x1E4F76B70];
  v6[1] = v1;
  uint64_t v2 = *MEMORY[0x1E4F76B68];
  v6[2] = *MEMORY[0x1E4F76B60];
  v6[3] = v2;
  v6[4] = *MEMORY[0x1E4F76B78];
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:5];
  uint64_t v4 = [v0 setWithArray:v3];
  long long v5 = (void *)isRecognizedROITopic_recognizedROITopics;
  isRecognizedROITopic_recognizedROITopics = v4;
}

void __namedEntityCategoryFromPublicEventCategory_block_invoke()
{
  v14[11] = *MEMORY[0x1E4F143B8];
  double v12 = [MEMORY[0x1E4F76D68] musicConcerts];
  v13[0] = v12;
  v14[0] = &unk_1F28D0EA0;
  mach_error_t v0 = [MEMORY[0x1E4F76D68] nightLife];
  v13[1] = v0;
  v14[1] = &unk_1F28D0EB8;
  uint64_t v1 = [MEMORY[0x1E4F76D68] theater];
  v13[2] = v1;
  v14[2] = &unk_1F28D0EA0;
  uint64_t v2 = [MEMORY[0x1E4F76D68] dance];
  v13[3] = v2;
  v14[3] = &unk_1F28D0EA0;
  id v3 = [MEMORY[0x1E4F76D68] festivalsAndFairs];
  v13[4] = v3;
  v14[4] = &unk_1F28D0EB8;
  uint64_t v4 = [MEMORY[0x1E4F76D68] artsAndMuseums];
  v13[5] = v4;
  v14[5] = &unk_1F28D0ED0;
  long long v5 = [MEMORY[0x1E4F76D68] businessAndTechnology];
  v13[6] = v5;
  v14[6] = &unk_1F28D0ED0;
  host_t v6 = [MEMORY[0x1E4F76D68] community];
  v13[7] = v6;
  _DWORD v14[7] = &unk_1F28D0ED0;
  mach_error_t v7 = [MEMORY[0x1E4F76D68] educational];
  v13[8] = v7;
  v14[8] = &unk_1F28D0ED0;
  uint64_t v8 = [MEMORY[0x1E4F76D68] familyEvents];
  v13[9] = v8;
  v14[9] = &unk_1F28D0EE8;
  uint64_t v9 = [MEMORY[0x1E4F76D68] tours];
  v13[10] = v9;
  v14[10] = &unk_1F28D0F00;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:11];
  long long v11 = (void *)namedEntityCategoryFromPublicEventCategory_namedEntityCategoryByPublicEventCategory;
  namedEntityCategoryFromPublicEventCategory_namedEntityCategoryByPublicEventCategory = v10;
}

void sub_1D1BC5B30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53)
{
}

void sub_1D1BC80AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
}

void sub_1D1BCA464(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1BCA630(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1BCB7F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61)
{
}

void sub_1D1BCD348(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1D1BD0060(_Unwind_Exception *a1)
{
}

uint64_t __Block_byref_object_copy__10726(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4malloc_zone_pressure_relief(0, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4malloc_zone_pressure_relief(0, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__10727(uint64_t a1)
{
}

void sub_1D1BD07F4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D1BD0B6C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D1BD1E44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__10822(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4malloc_zone_pressure_relief(0, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4malloc_zone_pressure_relief(0, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__10823(uint64_t a1)
{
}

void sub_1D1BD2018(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1BD349C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_1D1BDB240(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v31 - 160), 8);
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

void sub_1D1BE2570(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1BE4E9C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 224), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__12445(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4malloc_zone_pressure_relief(0, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4malloc_zone_pressure_relief(0, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__12446(uint64_t a1)
{
}

void sub_1D1BE5674(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D1BE5A4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1BE5FC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__12687(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4malloc_zone_pressure_relief(0, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4malloc_zone_pressure_relief(0, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__12688(uint64_t a1)
{
}

void sub_1D1BE77B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1BE8014(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1BEB0E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1BEB6B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__13104(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4malloc_zone_pressure_relief(0, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4malloc_zone_pressure_relief(0, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__13105(uint64_t a1)
{
}

void sub_1D1BEBC08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__13220(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4malloc_zone_pressure_relief(0, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4malloc_zone_pressure_relief(0, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__13221(uint64_t a1)
{
}

void sub_1D1BEFBD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  _Block_object_dispose((const void *)(v39 - 160), 8);
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose(&a39, 8);
  _Unwind_Resume(a1);
}

void sub_1D1BF4EB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1BF4FE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1BF51F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1BF8FD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53)
{
}

void sub_1D1BF93EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1BF9F48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_1D1BFCD34(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, __int16 a9)
{
  if (a2 == 1)
  {
    id v9 = objc_begin_catch(exception_object);
    uint64_t v10 = +[PGLogging sharedLogging];
    long long v11 = [v10 loggingConnection];

    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      a9 = 0;
      _os_log_impl(&dword_1D1805000, v11, OS_LOG_TYPE_INFO, "Exception getting feature name, probably using a copied node", (uint8_t *)&a9, 2u);
    }

    objc_end_catch();
    JUMPOUT(0x1D1BFCBBCLL);
  }
  _Unwind_Resume(exception_object);
}

void sub_1D1BFF0EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
}

void sub_1D1BFFF18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va1, a13);
  va_start(va, a13);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1D1C03264(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va1, a13);
  va_start(va, a13);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  uint64_t v19 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v13 - 144), 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__16212(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4malloc_zone_pressure_relief(0, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4malloc_zone_pressure_relief(0, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__16213(uint64_t a1)
{
}

void sub_1D1C03850(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
}

void sub_1D1C04304(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1D1C04DC0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Block_object_dispose(&STACK[0x200], 8);
  _Block_object_dispose(&STACK[0x220], 8);
  _Block_object_dispose(&STACK[0x240], 8);
  _Unwind_Resume(a1);
}

void sub_1D1C05948(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  _Block_object_dispose(&a24, 8);
  _Block_object_dispose(&a28, 8);
  _Block_object_dispose((const void *)(v41 - 176), 8);
  _Block_object_dispose(&a41, 8);
  _Block_object_dispose((const void *)(v41 - 240), 8);
  _Unwind_Resume(a1);
}

void sub_1D1C0782C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 192), 8);
  _Block_object_dispose((const void *)(v31 - 144), 8);
  _Block_object_dispose((const void *)(v31 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__16599(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4malloc_zone_pressure_relief(0, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4malloc_zone_pressure_relief(0, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__16600(uint64_t a1)
{
}

void sub_1D1C080AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
}

void sub_1D1C08494(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1D1C09108(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1D1C09D50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51)
{
  _Block_object_dispose(&a43, 8);
  _Block_object_dispose((const void *)(v51 - 192), 8);
  _Block_object_dispose(&a47, 8);
  _Block_object_dispose(&a51, 8);
  _Unwind_Resume(a1);
}

void sub_1D1C0C764(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__16988(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4malloc_zone_pressure_relief(0, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4malloc_zone_pressure_relief(0, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__16989(uint64_t a1)
{
}

void sub_1D1C0E928(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&STACK[0x250], 8);
  _Block_object_dispose(&a71, 8);
  _Block_object_dispose(&STACK[0x210], 8);
  _Unwind_Resume(a1);
}

void sub_1D1C0EC00(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1D1C105EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53)
{
}

void sub_1D1C1336C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__17336(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4malloc_zone_pressure_relief(0, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4malloc_zone_pressure_relief(0, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__17337(uint64_t a1)
{
}

void sub_1D1C1489C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1C16664(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__17518(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4malloc_zone_pressure_relief(0, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4malloc_zone_pressure_relief(0, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__17519(uint64_t a1)
{
}

void sub_1D1C18978(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
}

void sub_1D1C18D50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1D1C199D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__17684(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4malloc_zone_pressure_relief(0, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4malloc_zone_pressure_relief(0, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__17685(uint64_t a1)
{
}

void sub_1D1C1D0A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__17838(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4malloc_zone_pressure_relief(0, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4malloc_zone_pressure_relief(0, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__17839(uint64_t a1)
{
}

void sub_1D1C1F6F4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D1C1F8F8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D1C1FCAC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D1C231CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
}

void sub_1D1C26E2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1C27CDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1C29E8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1C2A3B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1C2A610(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1C2A7E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1D1C2ABD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_1D1C2B514(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
}

uint64_t __Block_byref_object_copy__18775(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4malloc_zone_pressure_relief(0, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4malloc_zone_pressure_relief(0, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__18776(uint64_t a1)
{
}

void sub_1D1C2F340(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a49, 8);
  _Block_object_dispose(&a53, 8);
  _Block_object_dispose(&STACK[0x240], 8);
  _Block_object_dispose(&a65, 8);
  _Block_object_dispose((const void *)(v69 - 160), 8);
  _Block_object_dispose(&a69, 8);
  _Block_object_dispose(&STACK[0x200], 8);
  _Unwind_Resume(a1);
}

void sub_1D1C3072C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Block_object_dispose((const void *)(v1 - 256), 8);
  _Block_object_dispose((const void *)(v1 - 224), 8);
  _Unwind_Resume(a1);
}

void sub_1D1C33A94(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 240), 8);
  _Block_object_dispose((const void *)(v1 - 208), 8);
  _Unwind_Resume(a1);
}

void sub_1D1C358F0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 208), 8);
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1D1C362A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
  objc_sync_exit(v19);
  _Unwind_Resume(a1);
}

void sub_1D1C3641C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D1C39B3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 144), 8);
  _Block_object_dispose((const void *)(v29 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1D1C3B7A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va1, a13);
  va_start(va, a13);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1D1C3BBCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 192), 8);
  _Block_object_dispose((const void *)(v29 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__20120(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4malloc_zone_pressure_relief(0, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4malloc_zone_pressure_relief(0, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__20121(uint64_t a1)
{
}

void sub_1D1C3C69C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose((const void *)(v45 - 192), 8);
  _Block_object_dispose(&a45, 8);
  _Unwind_Resume(a1);
}

void sub_1D1C3DAE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *PGGraphUpdateManagerExecutionContextAsString(unint64_t a1)
{
  if (a1 > 2) {
    return @"Unknown Execution Context";
  }
  else {
    return off_1E68E71B8[a1];
  }
}

void sub_1D1C42C88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
}

void sub_1D1C46F68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1C47ED8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1C4D004(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose((const void *)(v67 - 160), 8);
  _Block_object_dispose(&a67, 8);
  _Unwind_Resume(a1);
}

void sub_1D1C4E430(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__20853(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4malloc_zone_pressure_relief(0, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4malloc_zone_pressure_relief(0, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__20854(uint64_t a1)
{
}

void sub_1D1C4E71C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va1, a8);
  va_start(va, a8);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1D1C4EAFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v6 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1D1C4FBD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44,uint64_t a45,uint64_t a46,uint64_t a47,char a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,char a54,uint64_t a55,uint64_t a56,uint64_t a57,char a58,uint64_t a59,uint64_t a60,uint64_t a61,char a62)
{
  _Block_object_dispose(&a44, 8);
  _Block_object_dispose(&a48, 8);
  _Block_object_dispose(&a54, 8);
  _Block_object_dispose(&a58, 8);
  _Block_object_dispose(&a62, 8);
  _Block_object_dispose(&STACK[0x248], 8);
  _Block_object_dispose((const void *)(v62 - 248), 8);
  _Block_object_dispose((const void *)(v62 - 216), 8);
  _Block_object_dispose((const void *)(v62 - 184), 8);
  _Block_object_dispose((const void *)(v62 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1D1C4FDF8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1D1C50634(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1C52298(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
  _Block_object_dispose(&a47, 8);
  _Block_object_dispose(&a53, 8);
  _Block_object_dispose(&a59, 8);
  _Block_object_dispose(&a63, 8);
  _Block_object_dispose((const void *)(v71 - 192), 8);
  _Block_object_dispose(&a67, 8);
  _Block_object_dispose(&a71, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__20918(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4malloc_zone_pressure_relief(0, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4malloc_zone_pressure_relief(0, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__20919(uint64_t a1)
{
}

void sub_1D1C528DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_1D1C53070(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1D1C5336C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id location)
{
}

void sub_1D1C534F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1C551FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va1, a13);
  va_start(va, a13);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1D1C566D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
}

void sub_1D1C5AE08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1C5BD7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1C62840(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__22221(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4malloc_zone_pressure_relief(0, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4malloc_zone_pressure_relief(0, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__22222(uint64_t a1)
{
}

void sub_1D1C62B14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1D1C64EE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1C6517C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1C6B8B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38)
{
}

void sub_1D1C6C2C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
}

void sub_1D1C6CB30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

void sub_1D1C6D6F4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 208), 8);
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1D1C6E138(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
}

void sub_1D1C723A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
}

id PGMomentsForAssetCollection(uint64_t a1)
{
  uint64_t v1 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:a1 options:0];
  uint64_t v2 = (void *)MEMORY[0x1E4F38EE8];
  id v3 = [v1 fetchedObjects];
  uint64_t v4 = [v2 fetchAssetCollectionsContainingAssets:v3 withType:3 options:0];

  long long v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = [v4 fetchedObjects];
  mach_error_t v7 = [v5 setWithArray:v6];

  return v7;
}

void sub_1D1C7338C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1C734B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1C735E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1C73710(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1C73880(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1D1C763A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,char a42,uint64_t a43,uint64_t a44,uint64_t a45,char a46)
{
  _Block_object_dispose(&a42, 8);
  _Block_object_dispose(&a46, 8);
  _Block_object_dispose((const void *)(v46 - 232), 8);
  _Block_object_dispose((const void *)(v46 - 200), 8);
  _Block_object_dispose((const void *)(v46 - 168), 8);
  _Block_object_dispose((const void *)(v46 - 136), 8);
  _Unwind_Resume(a1);
}

__CFString *PGGraphDomainToString(int a1)
{
  if (a1 <= 401)
  {
    if (a1 > 299)
    {
      switch(a1)
      {
        case 300:
          uint64_t v2 = @"People";
          break;
        case 301:
          uint64_t v2 = @"PeopleEvent";
          break;
        case 302:
          uint64_t v2 = @"PeopleSocialGroup";
          break;
        case 303:
          uint64_t v2 = @"PeopleContactSuggestion";
          break;
        case 304:
          uint64_t v2 = @"PeopleIndistinct";
          break;
        case 305:
          uint64_t v2 = @"PeopleRelationshipTag";
          break;
        default:
          if (a1 == 400)
          {
            uint64_t v2 = @"Time";
          }
          else
          {
            if (a1 != 401) {
              goto LABEL_143;
            }
            uint64_t v2 = @"TimeEvent";
          }
          break;
      }
    }
    else
    {
      switch(a1)
      {
        case 200:
          uint64_t v2 = @"Location";
          break;
        case 201:
          uint64_t v2 = @"LocationArea";
          break;
        case 202:
          uint64_t v2 = @"LocationHomeWork";
          break;
        case 203:
          uint64_t v2 = @"LocationMobility";
          break;
        case 204:
          uint64_t v2 = @"LocationFrequent";
          break;
        case 205:
          uint64_t v2 = @"LocationLanguage";
          break;
        default:
          switch(a1)
          {
            case 'd':
              uint64_t v2 = @"Event";
              break;
            case 'e':
              uint64_t v2 = @"EventNext";
              break;
            case 'f':
              uint64_t v2 = @"EventHighlight";
              break;
            case 'g':
              uint64_t v2 = @"EventHighlightType";
              break;
            default:
              if (a1 != 21) {
                goto LABEL_143;
              }
              uint64_t v2 = @"Info";
              break;
          }
          break;
      }
    }
    return v2;
  }
  if (a1 <= 700)
  {
    if (a1 > 599)
    {
      switch(a1)
      {
        case 600:
          uint64_t v2 = @"Scene";
          break;
        case 601:
          uint64_t v2 = @"SceneFeature";
          break;
        case 700:
          uint64_t v2 = @"Meaning";
          break;
        default:
          goto LABEL_143;
      }
    }
    else
    {
      switch(a1)
      {
        case 500:
          uint64_t v2 = @"Place";
          break;
        case 501:
          uint64_t v2 = @"PlacePOI";
          break;
        case 502:
          uint64_t v2 = @"PlaceROI";
          break;
        case 503:
          uint64_t v2 = @"PlaceBusiness";
          break;
        case 504:
          uint64_t v2 = @"PlaceBusinessCategories";
          break;
        default:
          if (a1 != 402) {
            goto LABEL_143;
          }
          uint64_t v2 = @"TimeFeature";
          break;
      }
    }
  }
  else if (a1 > 999)
  {
    if (a1 <= 1099)
    {
      if (a1 == 1000)
      {
        uint64_t v2 = @"Music";
      }
      else
      {
        if (a1 != 1001) {
          goto LABEL_143;
        }
        uint64_t v2 = @"MusicGenre";
      }
    }
    else
    {
      switch(a1)
      {
        case 1100:
          uint64_t v2 = @"Memory";
          break;
        case 1200:
          uint64_t v2 = @"Feature";
          break;
        case 1201:
          uint64_t v2 = @"FeatureAudio";
          break;
        default:
          goto LABEL_143;
      }
    }
  }
  else if (a1 <= 899)
  {
    if (a1 == 701)
    {
      uint64_t v2 = @"PersonActivityMeaning";
    }
    else
    {
      if (a1 != 702) {
        goto LABEL_143;
      }
      uint64_t v2 = @"AlternativeMeaning";
    }
  }
  else
  {
    switch(a1)
    {
      case 900:
        uint64_t v2 = @"PublicEvent";
        break;
      case 901:
        uint64_t v2 = @"PublicEventCategory";
        break;
      case 902:
        uint64_t v2 = @"PublicEventLocalizedCategory";
        return v2;
      default:
LABEL_143:
        objc_msgSend(NSString, "stringWithFormat:", @"domain_%d", a1);
        uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
        return v2;
    }
  }
  return v2;
}

void sub_1D1C7D69C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_1D1C7FA30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1C7FD34(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1D1C85B68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,char a48,uint64_t a49,uint64_t a50,uint64_t a51,char a52)
{
  _Block_object_dispose((const void *)(v52 - 208), 8);
  _Block_object_dispose(&a48, 8);
  _Block_object_dispose(&a52, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__26469(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4malloc_zone_pressure_relief(0, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4malloc_zone_pressure_relief(0, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__26470(uint64_t a1)
{
}

void sub_1D1C86264(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose((const void *)(v31 - 176), 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

void sub_1D1C86DD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_1D1C87A8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

void sub_1D1C88564(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1C88E80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

void sub_1D1C89DBC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D1C89E48(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D1C89F0C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D1C89F6C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D1C89FD0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D1C8A06C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D1C8B3E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1C8B834(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1C8C540(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__26916(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4malloc_zone_pressure_relief(0, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4malloc_zone_pressure_relief(0, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__26917(uint64_t a1)
{
}

void sub_1D1C8D4E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1C8F37C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1D1C90A14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a64, 8);
  _Block_object_dispose(&a68, 8);
  _Block_object_dispose((const void *)(v68 - 248), 8);
  _Block_object_dispose((const void *)(v68 - 216), 8);
  _Block_object_dispose((const void *)(v68 - 184), 8);
  _Unwind_Resume(a1);
}

void __searchIndexProcessorIsInterestedInChangedPersonProperties_block_invoke()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"name", @"displayName", @"personUri", 0);
  uint64_t v1 = (void *)searchIndexProcessorIsInterestedInChangedPersonProperties_personPropertiesOfInterest;
  searchIndexProcessorIsInterestedInChangedPersonProperties_personPropertiesOfInterest = v0;
}

id PGGraphIVarLayoutDescriptionForClass(objc_class *a1)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F28E78] string];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (a1)
  {
    Superclass = a1;
    do
    {
      [v3 addObject:Superclass];
      Superclass = class_getSuperclass(Superclass);
    }
    while (Superclass);
  }
  aClass = a1;
  uint64_t v25 = v3;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = [v3 reverseObjectEnumerator];
  uint64_t v28 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
  uint64_t v5 = 0;
  if (v28)
  {
    ptrdiff_t v6 = 0;
    uint64_t v27 = *(void *)v36;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v36 != v27) {
          objc_enumerationMutation(obj);
        }
        uint64_t v30 = v7;
        int v31 = v5;
        uint64_t v8 = *(objc_class **)(*((void *)&v35 + 1) + 8 * v7);
        unsigned int outCount = 0;
        uint64_t v9 = class_copyIvarList(v8, &outCount);
        unsigned int v29 = outCount;
        if (outCount)
        {
          uint64_t v10 = v9;
          unint64_t v11 = 0;
          BOOL v12 = 0;
          do
          {
            Name = ivar_getName(v10[v11]);
            ptrdiff_t Offset = ivar_getOffset(v10[v11]);
            TypeEncoding = ivar_getTypeEncoding(v10[v11]);
            uint64_t v16 = TypeEncoding;
            NSUInteger alignp = 0;
            NSUInteger sizep = 0;
            int v17 = *(unsigned __int8 *)TypeEncoding;
            BOOL v18 = v17 == 98;
            if (v17 != 98)
            {
              NSGetSizeAndAlignment(TypeEncoding, &sizep, &alignp);
              if (v12) {
                v6 += 4;
              }
            }
            if (!v12 && Offset != v6) {
              objc_msgSend(v2, "appendFormat:", @"\t%d: PADDING (%d)\n", v6, Offset - v6);
            }
            [v2 appendFormat:@"\t%d: %s (%s, %d, %d)\n", Offset, Name, v16, sizep, alignp];
            ptrdiff_t v6 = (int)sizep + Offset;
            ++v11;
            BOOL v12 = v18;
          }
          while (v11 < outCount);
        }
        uint64_t v5 = v29 + v31;
        uint64_t v7 = v30 + 1;
      }
      while (v30 + 1 != v28);
      uint64_t v28 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v28);
  }

  uint64_t v19 = NSString;
  v20 = NSStringFromClass(aClass);
  v21 = [v19 stringWithFormat:@"%@: size = %d, count = %d\n", v20, class_getInstanceSize(aClass), v5];

  v22 = [v21 stringByAppendingString:v2];

  return v22;
}

void sub_1D1C98434(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__28096(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4malloc_zone_pressure_relief(0, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4malloc_zone_pressure_relief(0, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__28097(uint64_t a1)
{
}

id -[PGSearchMetadataComputer _blockedMeaningsByMeaning](PGSearchMetadataComputer *self, SEL a2)
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"Concert", @"Festival", @"SportEvent", 0);
  uint64_t v5 = [(MAGraph *)self->_graph anyNodeForLabel:@"Performance" domain:700 properties:0];
  ptrdiff_t v6 = [v5 localizedName];
  graph = self->_graph;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __53__PGSearchMetadataComputer__blockedMeaningsByMeaning__block_invoke;
  v14[3] = &unk_1E68E8060;
  id v15 = v6;
  id v16 = v4;
  id v8 = v3;
  id v17 = v8;
  id v9 = v4;
  id v10 = v6;
  [(MAGraph *)graph enumerateNodesInDomain:700 usingBlock:v14];
  unint64_t v11 = v17;
  id v12 = v8;

  return v12;
}

void sub_1D1C99370(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1D1C99778(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1D1C9E1F4(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x2B0], 8);
  _Block_object_dispose((const void *)(v1 - 208), 8);
  _Unwind_Resume(a1);
}

void sub_1D1C9F35C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 208), 8);
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1D1C9F900(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1CA0628(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1CA2D34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__29258(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4malloc_zone_pressure_relief(0, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4malloc_zone_pressure_relief(0, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__29259(uint64_t a1)
{
}

void sub_1D1CA3BD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1CA4230(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1CA459C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1CA87B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1CA93A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1D1CA9D74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose((const void *)(v29 - 160), 8);
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void sub_1D1CAAACC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 208), 8);
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1D1CABD8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

void sub_1D1CACFAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__30423(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4malloc_zone_pressure_relief(0, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4malloc_zone_pressure_relief(0, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__30424(uint64_t a1)
{
}

void sub_1D1CAD214(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1D1CAD4B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1D1CAD774(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1D1CAD940(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1CADB48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1CAEBC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1CAFB78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1CB0600(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D1CB06E4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D1CB2880(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1CB5860(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1D1CB8210(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose((const void *)(v39 - 208), 8);
  _Unwind_Resume(a1);
}

void sub_1D1CB88CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,char a56,uint64_t a57,uint64_t a58,uint64_t a59,char a60)
{
}

void sub_1D1CB9850(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1CB9FE4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Block_object_dispose((const void *)(v1 - 256), 8);
  _Block_object_dispose((const void *)(v1 - 224), 8);
  _Unwind_Resume(a1);
}

void sub_1D1CBBEC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__31371(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4malloc_zone_pressure_relief(0, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4malloc_zone_pressure_relief(0, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__31372(uint64_t a1)
{
}

void sub_1D1CBCDA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1D1CBD534(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose((const void *)(v31 - 144), 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

void sub_1D1CC0804(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__31552(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4malloc_zone_pressure_relief(0, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4malloc_zone_pressure_relief(0, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__31553(uint64_t a1)
{
}

void sub_1D1CC27F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__31958(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4malloc_zone_pressure_relief(0, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4malloc_zone_pressure_relief(0, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__31959(uint64_t a1)
{
}

void sub_1D1CC2AC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va1, a8);
  va_start(va, a8);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1D1CC2EA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va1, a6);
  va_start(va, a6);
  uint64_t v7 = va_arg(va1, void);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1D1CC3F3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,char a42,uint64_t a43,uint64_t a44,uint64_t a45,char a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,char a52,uint64_t a53,uint64_t a54,uint64_t a55,char a56,uint64_t a57,uint64_t a58,uint64_t a59,char a60)
{
  _Block_object_dispose(&a42, 8);
  _Block_object_dispose(&a46, 8);
  _Block_object_dispose(&a52, 8);
  _Block_object_dispose(&a56, 8);
  _Block_object_dispose(&a60, 8);
  _Block_object_dispose(&STACK[0x238], 8);
  _Block_object_dispose((const void *)(v60 - 248), 8);
  _Block_object_dispose((const void *)(v60 - 216), 8);
  _Block_object_dispose((const void *)(v60 - 184), 8);
  _Block_object_dispose((const void *)(v60 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1D1CC4164(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1D1CC4900(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1CC4F64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
}

void sub_1D1CC6324(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

double _locationScore(double a1, double a2)
{
  return a2 * 0.4 + a1 * 0.6;
}

void sub_1D1CC7AF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose((const void *)(v37 - 160), 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose(&a37, 8);
  _Unwind_Resume(a1);
}

void sub_1D1CC8D04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1CC8E7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1CCBE94(_Unwind_Exception *a1)
{
}

void sub_1D1CCC3DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__32402(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4malloc_zone_pressure_relief(0, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4malloc_zone_pressure_relief(0, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__32403(uint64_t a1)
{
}

void sub_1D1CCC630(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1CCC914(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1CCCBD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1CCCEB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1CCD150(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1CCD884(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_1D1CCE810(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D1CCFB24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__32666(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4malloc_zone_pressure_relief(0, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4malloc_zone_pressure_relief(0, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__32667(uint64_t a1)
{
}

void sub_1D1CD0244(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose((const void *)(v39 - 240), 8);
  _Unwind_Resume(a1);
}

void sub_1D1CD12D8(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, long long buf)
{
  if (a2 == 1)
  {
    id v14 = objc_begin_catch(a1);
    uint64_t v15 = *(id *)(v13 + 32);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = [v11 localIdentifier];
      LODWORD(buf) = 138412546;
      *(void *)((char *)&buf + 4) = v16;
      WORD6(buf) = 2112;
      *(void *)((char *)&buf + 14) = v14;
      _os_log_error_impl(&dword_1D1805000, v15, OS_LOG_TYPE_ERROR, "[PGWallpaperSuggestionAssetGater] Got an exception while deserializing wallpaper properties on asset %@: %@", (uint8_t *)&buf, 0x16u);
    }
    objc_end_catch();
    JUMPOUT(0x1D1CD1278);
  }
  _Unwind_Resume(a1);
}

void sub_1D1CD5718(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__33076(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4malloc_zone_pressure_relief(0, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4malloc_zone_pressure_relief(0, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__33077(uint64_t a1)
{
}

void sub_1D1CD8CA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__33564(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4malloc_zone_pressure_relief(0, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4malloc_zone_pressure_relief(0, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__33565(uint64_t a1)
{
}

void sub_1D1CD9790(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57)
{
}

void sub_1D1CDA050(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51)
{
}

void sub_1D1CDBEA0(_Unwind_Exception *a1)
{
}

void sub_1D1CDCC1C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Block_object_dispose((const void *)(v1 - 256), 8);
  _Block_object_dispose((const void *)(v1 - 224), 8);
  _Unwind_Resume(a1);
}

void sub_1D1CDDE2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_1D1CDE08C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__33695(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4malloc_zone_pressure_relief(0, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4malloc_zone_pressure_relief(0, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__33696(uint64_t a1)
{
}

void sub_1D1CE0088(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
}

void sub_1D1CE0B24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40)
{
}

void sub_1D1CE1550(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38)
{
  _Block_object_dispose(&a38, 8);
  _Block_object_dispose((const void *)(v38 - 200), 8);
  _Unwind_Resume(a1);
}

void sub_1D1CE2114(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49)
{
}

void sub_1D1CE2A50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

void sub_1D1CE32AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v33 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1D1CE3DC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,char a56,uint64_t a57,uint64_t a58,uint64_t a59,char a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose(&a43, 8);
  _Block_object_dispose(&a69, 8);
  _Block_object_dispose(&a56, 8);
  _Block_object_dispose(&a60, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__33983(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4malloc_zone_pressure_relief(0, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4malloc_zone_pressure_relief(0, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__33984(uint64_t a1)
{
}

void sub_1D1CE4818(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1D1CE69E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_1D1CE7114(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1D1CE72C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1CE7408(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1CE9064(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
}

void sub_1D1CE947C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D1CE9624(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D1CE974C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D1CE9838(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D1CE9934(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D1CE9AD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D1CE9E6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

double beta_sample(double a1, double a2)
{
  return (double)arc4random() / 4294967300.0;
}

void sub_1D1CF1B00(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_1D1CF2748(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
}

void sub_1D1CF3B1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1CF4FF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
}

uint64_t PGMeaningForMeaningLabel(void *a1)
{
  id v1 = a1;
  if (([v1 isEqualToString:@"Activity"] & 1) != 0
    || ([v1 isEqualToString:@"Hiking"] & 1) != 0
    || ([v1 isEqualToString:@"Climbing"] & 1) != 0
    || ([v1 isEqualToString:@"WinterSport"] & 1) != 0
    || ([v1 isEqualToString:@"Beaching"] & 1) != 0
    || ([v1 isEqualToString:@"Diving"] & 1) != 0)
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"Celebration"])
  {
    uint64_t v2 = 10;
  }
  else if ([v1 isEqualToString:@"HolidayEvent"])
  {
    uint64_t v2 = 13;
  }
  else if ([v1 isEqualToString:@"Wedding"])
  {
    uint64_t v2 = 14;
  }
  else if ([v1 isEqualToString:@"Birthday"])
  {
    uint64_t v2 = 12;
  }
  else if ([v1 isEqualToString:@"Anniversary"])
  {
    uint64_t v2 = 11;
  }
  else if ([v1 isEqualToString:@"Entertainment"])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:@"AmusementPark"])
  {
    uint64_t v2 = 4;
  }
  else if ([v1 isEqualToString:@"Performance"])
  {
    uint64_t v2 = 5;
  }
  else if ([v1 isEqualToString:@"Concert"])
  {
    uint64_t v2 = 6;
  }
  else if ([v1 isEqualToString:@"Festival"])
  {
    uint64_t v2 = 7;
  }
  else if ([v1 isEqualToString:@"NightOut"])
  {
    uint64_t v2 = 8;
  }
  else if ([v1 isEqualToString:@"SportEvent"])
  {
    uint64_t v2 = 3;
  }
  else if ([v1 isEqualToString:@"Museum"])
  {
    uint64_t v2 = 9;
  }
  else if ([v1 isEqualToString:@"Gathering"])
  {
    uint64_t v2 = 16;
  }
  else if (([v1 isEqualToString:@"Restaurant"] & 1) != 0 {
         || ([v1 isEqualToString:@"Breakfast"] & 1) != 0
  }
         || ([v1 isEqualToString:@"Lunch"] & 1) != 0
         || [v1 isEqualToString:@"Dinner"])
  {
    uint64_t v2 = 15;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

__CFString *PGMeaningLabelForMeaning(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0xF)
  {
    uint64_t v2 = 0;
  }
  else
  {
    uint64_t v2 = *off_1E68E9658[a1 - 1];
  }
  return v2;
}

void sub_1D1CF979C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
}

void sub_1D1CFC940(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1D1CFCEEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

void sub_1D1CFDC8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v33 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1D1CFE4A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v33 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1D1CFEFC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59)
{
}

void sub_1D1D01034(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__36851(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4malloc_zone_pressure_relief(0, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4malloc_zone_pressure_relief(0, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__36852(uint64_t a1)
{
}

void sub_1D1D01C6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1D04424(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1D04608(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1D047F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1D04A00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1D04C48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__37156(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4malloc_zone_pressure_relief(0, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4malloc_zone_pressure_relief(0, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__37157(uint64_t a1)
{
}

void sub_1D1D08824(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1D08AF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1D0A318(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44,uint64_t a45,uint64_t a46,uint64_t a47,char a48,uint64_t a49,uint64_t a50,uint64_t a51,char a52,uint64_t a53,uint64_t a54,uint64_t a55,char a56,uint64_t a57,uint64_t a58,uint64_t a59,char a60)
{
}

void sub_1D1D0C798(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  _Block_object_dispose((const void *)(v41 - 192), 8);
  _Block_object_dispose((const void *)(v41 - 160), 8);
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose(&a41, 8);
  _Unwind_Resume(a1);
}

void sub_1D1D0D2AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose((const void *)(v33 - 160), 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a33, 8);
  _Unwind_Resume(a1);
}

id CreateSearchLog()
{
  if (CreateSearchLog_onceToken[0] != -1) {
    dispatch_once(CreateSearchLog_onceToken, &__block_literal_global_38529);
  }
  uint64_t v0 = (void *)CreateSearchLog_log;
  return v0;
}

void __CreateSearchLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.PhotosGraph", "Search");
  uint64_t v1 = (void *)CreateSearchLog_log;
  CreateSearchLog_log = (uint64_t)v0;
}

void sub_1D1D0F284(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose((const void *)(v29 - 160), 8);
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void sub_1D1D10930(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
}

void sub_1D1D1138C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__38614(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4malloc_zone_pressure_relief(0, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4malloc_zone_pressure_relief(0, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__38615(uint64_t a1)
{
}

uint64_t PGGraphRelationshipStatusWithConfidence(double a1)
{
  uint64_t v1 = 2;
  if (a1 > 0.0) {
    uint64_t v1 = 1;
  }
  if (a1 == 1.0) {
    return 0;
  }
  else {
    return v1;
  }
}

void sub_1D1D15280(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Block_object_dispose(&STACK[0x230], 8);
  _Block_object_dispose(&STACK[0x250], 8);
  _Unwind_Resume(a1);
}

void sub_1D1D155E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__39104(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4malloc_zone_pressure_relief(0, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4malloc_zone_pressure_relief(0, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__39105(uint64_t a1)
{
}

void sub_1D1D17FFC(_Unwind_Exception *a1)
{
}

void sub_1D1D18AC0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1D1D19DE4(_Unwind_Exception *a1)
{
}

void sub_1D1D1D098(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__40063(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4malloc_zone_pressure_relief(0, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4malloc_zone_pressure_relief(0, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__40064(uint64_t a1)
{
}

void sub_1D1D1DA84(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t PGUpNextMemoryCategoriesNotAllowed()
{
  return [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F28D4128];
}

void sub_1D1D2012C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__40289(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4malloc_zone_pressure_relief(0, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4malloc_zone_pressure_relief(0, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__40290(uint64_t a1)
{
}

void sub_1D1D2040C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1D22718(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v33 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_1D1D22F28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_1D1D231CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1D23FD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose((const void *)(v71 - 208), 8);
  _Block_object_dispose(&a71, 8);
  _Block_object_dispose(&STACK[0x210], 8);
  _Unwind_Resume(a1);
}

void sub_1D1D27DA8(_Unwind_Exception *a1)
{
}

void sub_1D1D29BF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_1D1D2D594(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59)
{
}

void sub_1D1D2E69C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a61, 8);
  _Block_object_dispose(&a65, 8);
  _Block_object_dispose(&a69, 8);
  _Block_object_dispose(&STACK[0x200], 8);
  _Unwind_Resume(a1);
}

void sub_1D1D3139C(_Unwind_Exception *a1)
{
}

void sub_1D1D32428(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
}

void sub_1D1D32BF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_1D1D33560(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,os_activity_scope_state_s state,char a32)
{
  os_activity_scope_leave(&state);
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose((const void *)(v32 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1D1D33D30(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D1D344DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1D359B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1D1D36180(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
}

BOOL ContentScoreLevelIsBetterThanOtherContentScoreLevel_block_invoke(double a1, double a2)
{
  double v2 = *MEMORY[0x1E4F8E738];
  if (*MEMORY[0x1E4F8E738] <= a2) {
    return 0;
  }
  if (*MEMORY[0x1E4F8E748] > a2 && (double v2 = *MEMORY[0x1E4F8E740], *MEMORY[0x1E4F8E740] <= a2)) {
    BOOL v3 = *MEMORY[0x1E4F8E748] > a1;
  }
  else {
    BOOL v3 = v2 > a1;
  }
  return !v3;
}

BOOL ItemScoreIsBetterThanOtherItemScore_block_invoke_2(double a1, double a2, double a3, double a4, double a5, double a6)
{
  double v6 = a5;
  double v8 = a1;
  BOOL v9 = a2 <= a5;
  if (a2 > a5)
  {
    a1 = a4;
    double v10 = a3;
  }
  else
  {
    a5 = a2;
    double v10 = a6;
  }
  if (v9) {
    double v11 = v6;
  }
  else {
    double v11 = a2;
  }
  if (v9) {
    double v8 = a4;
  }
  else {
    a3 = a6;
  }
  BOOL v12 = a5 < v11 * 0.75 || a1 <= v8;
  if (!v12 || a5 == v11 && a1 == v8 && a3 == v10) {
    BOOL v13 = 1;
  }
  else {
    BOOL v13 = a5 >= v11 * 0.5
  }
       && (*((BOOL (**)(double, double))ContentScoreLevelIsBetterThanOtherContentScoreLevel + 2))(a1, v8);
  return v13 != a2 > v6;
}

void sub_1D1D3B7D8(_Unwind_Exception *a1)
{
}

__CFString *PGSuggestionStringWithNotificationQuality(unsigned int a1)
{
  if (a1 > 4) {
    return @"Unknown";
  }
  else {
    return off_1E68EA2A8[a1];
  }
}

__CFString *PGSuggestionStringWithCollisionReason(unint64_t a1)
{
  if (a1 > 3) {
    return @"Unknown";
  }
  else {
    return off_1E68EA2D0[a1];
  }
}

void sub_1D1D3FC58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1D444CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55)
{
  _Block_object_dispose(&a51, 8);
  _Block_object_dispose((const void *)(v55 - 176), 8);
  _Block_object_dispose(&a55, 8);
  _Block_object_dispose((const void *)(v55 - 240), 8);
  _Unwind_Resume(a1);
}

void sub_1D1D44C74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose((const void *)(v31 - 160), 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

void sub_1D1D45704(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose((const void *)(v35 - 160), 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a35, 8);
  _Unwind_Resume(a1);
}

void sub_1D1D46944(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose((const void *)(v27 - 160), 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1D1D47244(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

uint64_t __Block_byref_object_copy__43066(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4malloc_zone_pressure_relief(0, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4malloc_zone_pressure_relief(0, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__43067(uint64_t a1)
{
}

void sub_1D1D485A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
}

void sub_1D1D48B28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1D1D4909C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1D4C064(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
}

void sub_1D1D4CC58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__43600(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4malloc_zone_pressure_relief(0, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4malloc_zone_pressure_relief(0, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__43601(uint64_t a1)
{
}

void sub_1D1D4D334(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1D1D50618(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

unint64_t GCD(unint64_t a1, unint64_t a2)
{
  while (1)
  {
    do
    {
      unint64_t v2 = a2;
      a2 = a1;
      a1 = v2;
    }
    while (a2 < v2);
    if (!v2) {
      break;
    }
    a2 %= v2;
    a1 = v2;
  }
  return a2;
}

void sub_1D1D55DD8(_Unwind_Exception *a1)
{
}

void sub_1D1D5D7AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
}

uint64_t __Block_byref_object_copy__45050(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4malloc_zone_pressure_relief(0, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4malloc_zone_pressure_relief(0, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__45051(uint64_t a1)
{
}

void sub_1D1D5DF1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_1D1D60200(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
}

__CFString *PGSharingSuggestionOptionsStringFromSharingStream(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2) {
    return &stru_1F283BC78;
  }
  else {
    return off_1E68EAA28[a1 - 1];
  }
}

void sub_1D1D64590(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *PGStringFromFailureReason(unint64_t a1)
{
  if (a1 > 8) {
    return @"PGEnrichedMemoryFailureReasonUnknown";
  }
  else {
    return off_1E68EAAF0[a1];
  }
}

void sub_1D1D668C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1D672D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_1D1D681EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
}

void sub_1D1D6A6E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
  _Block_object_dispose(&a43, 8);
  _Block_object_dispose((const void *)(v43 - 160), 8);
  _Block_object_dispose((const void *)(v43 - 256), 8);
  _Block_object_dispose((const void *)(v43 - 224), 8);
  _Unwind_Resume(a1);
}

void sub_1D1D6CAA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1D1D6E894(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va1, a12);
  va_start(va, a12);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1D1D6FF2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

void sub_1D1D727BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1D72CF4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D1D73040(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D1D73248(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D1D7AA04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v39 - 176), 8);
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose(&a39, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__48805(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4malloc_zone_pressure_relief(0, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4malloc_zone_pressure_relief(0, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__48806(uint64_t a1)
{
}

id PGSummarizedFeatureConsolidatedDateIntervals(void *a1)
{
  void v31[2] = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  id v25 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  unint64_t v2 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:1];
  v31[0] = v2;
  BOOL v3 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"endDate" ascending:1];
  v31[1] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:2];
  uint64_t v5 = [v1 sortedArrayUsingDescriptors:v4];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    id v24 = v1;
    id v9 = 0;
    uint64_t v10 = 0;
    uint64_t v11 = *(void *)v27;
    do
    {
      uint64_t v12 = 0;
      uint64_t v13 = v9;
      do
      {
        if (*(void *)v27 != v11) {
          objc_enumerationMutation(v6);
        }
        uint64_t v14 = *(void **)(*((void *)&v26 + 1) + 8 * v12);
        uint64_t v15 = objc_msgSend(v14, "startDate", v24);
        uint64_t v16 = [v15 dateByAddingTimeInterval:-0.001];

        uint64_t v17 = [v14 endDate];
        uint64_t v18 = [v17 dateByAddingTimeInterval:0.001];

        if (v13 && [v16 compare:v13] != 1)
        {
          id v9 = [v13 laterDate:v18];
        }
        else
        {
          if (v10)
          {
            uint64_t v19 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v10 endDate:v13];
            [v25 addObject:v19];
          }
          id v20 = v16;

          id v9 = v18;
          uint64_t v10 = v20;
        }

        ++v12;
        uint64_t v13 = v9;
      }
      while (v8 != v12);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v8);

    if (!v10)
    {
      id v1 = v24;
      goto LABEL_19;
    }
    v21 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v10 endDate:v9];
    [v25 addObject:v21];
    id v1 = v24;
  }
  else
  {
    uint64_t v10 = 0;
    id v9 = 0;
    v21 = v6;
  }

LABEL_19:
  id v22 = v25;

  return v22;
}

__CFString *PGSummarizedFeatureTypeToString(unsigned int a1)
{
  if (a1 > 5) {
    return @"Undefined";
  }
  else {
    return off_1E68EAEB0[a1];
  }
}

__CFString *PGLocationSummarizedFeatureSubtypeToString(unsigned int a1)
{
  if (a1 > 5) {
    return @"Undefined";
  }
  else {
    return off_1E68EAE80[a1];
  }
}

__CFString *PGSummarizedFeatureToTypeString(void *a1)
{
  id v1 = a1;
  if ([v1 type] == 1)
  {
    unsigned int v2 = [v1 subtype];

    if (v2 < 6)
    {
      BOOL v3 = off_1E68EAE80;
      return v3[v2];
    }
  }
  else
  {
    unsigned int v2 = [v1 type];

    if (v2 <= 5)
    {
      BOOL v3 = off_1E68EAEB0;
      return v3[v2];
    }
  }
  return @"Undefined";
}

void sub_1D1D7C680(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__49134(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4malloc_zone_pressure_relief(0, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4malloc_zone_pressure_relief(0, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__49135(uint64_t a1)
{
}

void sub_1D1D7DCC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1D7E144(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_1D1D7E310(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__49263(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4malloc_zone_pressure_relief(0, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4malloc_zone_pressure_relief(0, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__49264(uint64_t a1)
{
}

void sub_1D1D80018(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__49680(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4malloc_zone_pressure_relief(0, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4malloc_zone_pressure_relief(0, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__49681(uint64_t a1)
{
}

void sub_1D1D815D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
}

uint64_t __Block_byref_object_copy__49852(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4malloc_zone_pressure_relief(0, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4malloc_zone_pressure_relief(0, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__49853(uint64_t a1)
{
}

void sub_1D1D819C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
}

void sub_1D1D839D4(_Unwind_Exception *a1)
{
}

void sub_1D1D840A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
}

void sub_1D1D86F44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53)
{
}

uint64_t __Block_byref_object_copy__50095(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4malloc_zone_pressure_relief(0, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4malloc_zone_pressure_relief(0, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__50096(uint64_t a1)
{
}

id +[PGMemoryFeatureBlocking _blockablePetFeatureForFeatureNodes:momentNodes:](id a1, SEL a2, id a3, id a4)
{
  uint64_t v4 = +[PGGraphNodeCollection subsetInCollection:](PGGraphPetNodeCollection, "subsetInCollection:", a3, a4);
  uint64_t v5 = v4;
  if (v4 && [v4 count] == 1)
  {
    id v6 = (void *)MEMORY[0x1E4F39178];
    uint64_t v7 = [v5 anyNode];
    uint64_t v8 = [v7 localIdentifier];
    id v9 = [v6 peopleMemoryFeatureWithPersonLocalIdentifier:v8];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

void sub_1D1D8744C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id +[PGMemoryFeatureBlocking _blockablePersonFeatureForFeatureNodes:momentNodes:](id a1, SEL a2, id a3, id a4)
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [a1 _blockablePetFeatureForFeatureNodes:v6 momentNodes:v7];
  id v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v11 = +[PGGraphNodeCollection subsetInCollection:v6];
    if (![v11 count] && objc_msgSend(v7, "count") == 1)
    {
      uint64_t v12 = [v7 personNodes];
      if ([v12 count] == 1)
      {
        id v13 = v11;
        id v11 = v12;
      }
      else
      {
        uint64_t v14 = [a1 _prominentPersonNodeAsCollectionInMomentNodeAsCollection:v7 withPersonNodes:v12 maximumNumberOfPersonsAllowed:3 minimumPresenceThreshold:0.8 maximumOthersPresenceThreshold:0.2];
        if (v14)
        {
          id v13 = v14;

          id v11 = v13;
        }
        else
        {
          id v13 = 0;
        }
      }
    }
    uint64_t v15 = [v7 graph];
    uint64_t v16 = +[PGGraphNodeCollection nodesInGraph:v15];

    uint64_t v17 = [v11 collectionBySubtracting:v16];

    if ([v17 count] == 1)
    {
      uint64_t v18 = (void *)MEMORY[0x1E4F39178];
      uint64_t v19 = [v17 localIdentifiers];
      id v20 = [v19 anyObject];
      id v10 = [v18 peopleMemoryFeatureWithPersonLocalIdentifier:v20];
    }
    else
    {
      id v10 = 0;
    }
  }
  return v10;
}

void sub_1D1D87878(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

id +[PGMemoryFeatureBlocking _blockableLocationFeatureForMomentNodes:](id a1, SEL a2, id a3)
{
  id v4 = a3;
  if ([v4 count] != 1)
  {
    uint64_t v12 = 0;
    goto LABEL_13;
  }
  uint64_t v5 = [a1 _bestAddressNodeAsCollectionInMomentNodeAsCollection:v4];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 areaNodes];
    uint64_t v8 = [v7 nonBlockedAreaNodes];

    if ([v8 count] == 1)
    {
      uint64_t v9 = (void *)MEMORY[0x1E4F39178];
      id v10 = [v8 anyNode];
      id v11 = [v10 name];
      uint64_t v12 = [v9 locationMemoryFeatureWithAreaForName:v11];
    }
    else
    {
      id v10 = v6;
      if ([v10 count] != 1)
      {
        uint64_t v12 = 0;
        goto LABEL_11;
      }
      id v13 = (void *)MEMORY[0x1E4F39178];
      id v11 = [v10 locations];
      uint64_t v14 = [v11 firstObject];
      uint64_t v12 = [v13 locationMemoryFeatureWithLocation:v14];
    }
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v12 = 0;
LABEL_12:

LABEL_13:
  return v12;
}

id +[PGMemoryFeatureBlocking _blockableLocationFeatureForFeatureNodes:](id a1, SEL a2, id a3)
{
  id v3 = a3;
  id v4 = +[PGGraphNodeCollection subsetInCollection:v3];
  if ([v4 count] == 1)
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F39178];
    id v6 = [v4 anyNode];
    id v7 = [v6 name];
    uint64_t v8 = [v5 locationMemoryFeatureWithAreaForName:v7];
LABEL_5:

    goto LABEL_7;
  }
  id v6 = +[PGGraphNodeCollection subsetInCollection:v3];
  if ([v6 count] == 1)
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F39178];
    id v7 = [v6 locations];
    id v10 = [v7 firstObject];
    uint64_t v8 = [v9 locationMemoryFeatureWithLocation:v10];

    goto LABEL_5;
  }
  uint64_t v8 = 0;
LABEL_7:

  return v8;
}

id +[PGMemoryFeatureBlocking _blockableLocationFeatureForFeatureNodes:momentNodes:](id a1, SEL a2, id a3, id a4)
{
  id v6 = a4;
  id v7 = [a1 _blockableLocationFeatureForFeatureNodes:a3];
  if (!v7)
  {
    id v7 = [a1 _blockableLocationFeatureForMomentNodes:v6];
  }
  id v8 = v7;

  return v8;
}

id +[PGMemoryFeatureBlocking _blockableDateIntervalFeatureForFeatureNodes:momentNodes:memoryCategory:](id a1, SEL a2, id a3, id a4, unint64_t a5)
{
  id v6 = a4;
  unint64_t v7 = PGMemorySourceTypeFromCategory(a5);
  if (v7 <= 4 && ((1 << v7) & 0x19) != 0)
  {
    id v8 = 0;
  }
  else
  {
    uint64_t v9 = [v6 universalDateInterval];
    id v8 = [MEMORY[0x1E4F39178] timeMemoryFeatureWithDateInterval:v9];
  }
  return v8;
}

id +[PGMemoryFeatureBlocking _blockableDateFeatureForFeatureNodes:momentNodes:](id a1, SEL a2, id a3, id a4)
{
  id v4 = objc_msgSend(a4, "dateNodes", a3);
  if ([v4 count] == 1)
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F39178];
    id v6 = [v4 anyNode];
    unint64_t v7 = [v6 localDate];
    id v8 = [v5 timeMemoryFeatureWithDate:v7];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

id +[PGMemoryFeatureBlocking _blockableHolidayFeatureForFeatureNodes:momentNodes:](id a1, SEL a2, id a3, id a4)
{
  id v5 = a4;
  id v6 = +[PGGraphNodeCollection subsetInCollection:a3];
  if (![v6 count] && objc_msgSend(v5, "count") == 1)
  {
    uint64_t v7 = [v5 celebratedHolidayNodes];

    id v6 = (void *)v7;
  }
  if ([v6 count] == 1)
  {
    id v8 = (void *)MEMORY[0x1E4F39178];
    uint64_t v9 = [v6 anyNode];
    id v10 = [v9 name];
    id v11 = [v8 timeMemoryFeatureWithHolidayForName:v10];
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

void sub_1D1D88698(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
}

void sub_1D1D8EA4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__50808(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4malloc_zone_pressure_relief(0, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4malloc_zone_pressure_relief(0, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__50809(uint64_t a1)
{
}

void sub_1D1D8EC34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1D90750(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D1D90860(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D1D90A34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1D1D94730(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose((const void *)(v37 - 160), 8);
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose((const void *)(v37 - 224), 8);
  _Unwind_Resume(a1);
}

void sub_1D1D9574C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  _Block_object_dispose((const void *)(v41 - 160), 8);
  _Block_object_dispose(&a41, 8);
  _Block_object_dispose((const void *)(v41 - 224), 8);
  _Unwind_Resume(a1);
}

uint64_t std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<E5RT::IOPort>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::IOPort>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::IOPort>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<E5RT::IOPort>>>>::~__hash_table(uint64_t a1)
{
  std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<E5RT::IOPort>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::IOPort>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::IOPort>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<E5RT::IOPort>>>>::__deallocate_node(*(void **)(a1 + 16));
  unsigned int v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void std::__shared_weak_count::__release_shared[abi:ne180100](std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::shared_ptr<E5RT::BufferObject>>,0>(uint64_t a1)
{
  unsigned int v2 = *(std::__shared_weak_count **)(a1 + 32);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  if (*(char *)(a1 + 23) < 0)
  {
    id v3 = *(void **)a1;
    operator delete(v3);
  }
}

void std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<E5RT::IOPort>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::IOPort>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::IOPort>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<E5RT::IOPort>>>>::__deallocate_node(void *a1)
{
  if (a1)
  {
    id v1 = a1;
    do
    {
      unsigned int v2 = (void *)*v1;
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::shared_ptr<E5RT::BufferObject>>,0>((uint64_t)(v1 + 2));
      operator delete(v1);
      id v1 = v2;
    }
    while (v2);
  }
}

void sub_1D1D99BD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
  _Block_object_dispose(&a17, 8);
  _Block_object_dispose((const void *)(v24 - 80), 8);

  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__51873(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4malloc_zone_pressure_relief(0, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4malloc_zone_pressure_relief(0, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__51874(uint64_t a1)
{
}

void sub_1D1D99D34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_1D1D9A020(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19)
{
  if (a2 == 1)
  {
    id v20 = (E5RT::E5RTError *)__cxa_begin_catch(a1);
    if (a13)
    {
      uint64_t Status = E5RT::E5RTError::GetStatus(v20);
      MEMORY[0x1D25FE5E0](&a18, Status);
      E5RT::Status::GetErrorCode((E5RT::Status *)&a18);
      id v22 = NSString;
      E5RT::GetErrorCodeString();
      E5RT::Status::GetErrorMessage((E5RT::Status *)&a18);
      v23 = [v22 stringWithFormat:@"[PGEventLabelerE5Model] Model computation failed with E5RT error %s (%d): %s"];
      *a13 = [MEMORY[0x1E4F28C58] errorWithDescription:v23];

      E5RT::Status::~Status((E5RT::Status *)&a18);
    }

    __cxa_end_catch();
    JUMPOUT(0x1D1D99FC0);
  }

  _Unwind_Resume(a1);
}

std::string *std::pair<std::string const,std::shared_ptr<E5RT::IOPort>>::pair[abi:ne180100](std::string *this, long long *a2)
{
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v4 = *a2;
    this->__r_.__value_.__r.__words[2] = *((void *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v4;
  }
  std::string::size_type v5 = *((void *)a2 + 4);
  this[1].__r_.__value_.__r.__words[0] = *((void *)a2 + 3);
  this[1].__r_.__value_.__l.__size_ = v5;
  if (v5) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v5 + 8), 1uLL, memory_order_relaxed);
  }
  return this;
}

uint64_t std::pair<std::string const,std::shared_ptr<E5RT::IOPort>>::~pair(uint64_t a1)
{
  unsigned int v2 = *(std::__shared_weak_count **)(a1 + 32);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  if (*(char *)(a1 + 23) < 0) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void __clang_call_terminate(void *a1)
{
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  std::string::size_type v5 = this;
  if (__sz > 0x16)
  {
    if (__sz >= 0x7FFFFFFFFFFFFFF8) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    std::string::size_type v6 = (__sz & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__sz | 7) != 0x17) {
      std::string::size_type v6 = __sz | 7;
    }
    std::string::size_type v7 = v6 + 1;
    id v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    std::string::size_type v5 = v8;
  }
  else
  {
    *((unsigned char *)&this->__r_.__value_.__s + 23) = __sz;
  }
  memmove(v5, __s, __sz + 1);
}

void std::string::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100]()
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception);
  __cxa_throw(exception, (struct type_info *)off_1E68E3C38, MEMORY[0x1E4FBA1C8]);
}

void sub_1D1D9A3BC(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1)
{
  uint64_t result = std::logic_error::logic_error(a1, "basic_string");
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E4FBA4D0] + 16);
  return result;
}

void sub_1D1D9A54C(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  id v13 = v9;

  if (v8) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
  if (a2 == 1)
  {
    uint64_t v15 = (E5RT::E5RTError *)__cxa_begin_catch(a1);
    if (v7)
    {
      uint64_t Status = E5RT::E5RTError::GetStatus(v15);
      MEMORY[0x1D25FE5E0](va, Status);
      E5RT::Status::GetErrorCode((E5RT::Status *)va);
      uint64_t v17 = *(void **)(v11 + 24);
      E5RT::GetErrorCodeString();
      E5RT::Status::GetErrorMessage((E5RT::Status *)va);
      uint64_t v18 = [v17 stringWithFormat:@"[PGEventLabelerE5Model] Model inspection failed with E5RT error %s (%d): %s"];
      void *v7 = [MEMORY[0x1E4F28C58] errorWithDescription:v18];

      E5RT::Status::~Status((E5RT::Status *)va);
    }
    __cxa_end_catch();
    JUMPOUT(0x1D1D9A518);
  }

  _Unwind_Resume(a1);
}

void sub_1D1D9A720(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D1D9AFF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *__p,uint64_t a25,int a26,__int16 a27,char a28,char a29,void *a30,uint64_t a31,int a32,__int16 a33,char a34,char a35)
{
  uint64_t v39 = *(void *)(v36 - 136);
  *(void *)(v36 - 136) = 0;
  if (v39) {
    (*(void (**)(uint64_t))(*(void *)v39 + 8))(v39);
  }
  if (a29 < 0) {
    operator delete(__p);
  }
  if (a35 < 0) {
    operator delete(a30);
  }
  if (*(char *)(v36 - 89) < 0) {
    operator delete(*(void **)(v36 - 112));
  }
  if (a2 == 2)
  {
    uint64_t v40 = (E5RT::E5RTError *)__cxa_begin_catch(a1);
    if (a13)
    {
      uint64_t Status = E5RT::E5RTError::GetStatus(v40);
      MEMORY[0x1D25FE5E0](&a30, Status);
      E5RT::Status::GetErrorCode((E5RT::Status *)&a30);
      v42 = NSString;
      E5RT::GetErrorCodeString();
      E5RT::Status::GetErrorMessage((E5RT::Status *)&a30);
      uint64_t v43 = [v42 stringWithFormat:@"[PGEventLabelerE5Model] Model initialization failed with E5RT error %s (%d): %s"];
      *a13 = [MEMORY[0x1E4F28C58] errorWithDescription:v43];

      E5RT::Status::~Status((E5RT::Status *)&a30);
    }
  }
  else
  {
    if (a2 != 1)
    {

      _Unwind_Resume(a1);
    }
    v44 = __cxa_begin_catch(a1);
    if (a13)
    {
      uint64_t v45 = NSString;
      (*(void (**)(void *))(*(void *)v44 + 16))(v44);
      uint64_t v46 = [v45 stringWithFormat:@"[PGEventLabelerE5Model] Model initialization failed due to missing port: %s"];
      *a13 = [MEMORY[0x1E4F28C58] errorWithDescription:v46];
    }
  }

  __cxa_end_catch();
  JUMPOUT(0x1D1D9AFC4);
}

void sub_1D1D9B36C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  E5RT::Status::~Status((E5RT::Status *)&a27);
  __cxa_end_catch();
  JUMPOUT(0x1D1D9B090);
}

void *std::string::basic_string[abi:ne180100]<0>(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    std::string::size_type v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    std::string::size_type v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

void std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<E5RT::IOPort>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::IOPort>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::IOPort>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<E5RT::IOPort>>>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<std::__hash_value_type<std::string,std::shared_ptr<E5RT::IOPort>>,void *> *>>(void *a1, uint64_t *a2)
{
  unsigned int v2 = a2;
  uint64_t v4 = a1[1];
  if (v4)
  {
    for (uint64_t i = 0; i != v4; ++i)
      *(void *)(*a1 + 8 * i) = 0;
    uint64_t v6 = a1[2];
    a1[2] = 0;
    a1[3] = 0;
    if (v6) {
      BOOL v7 = a2 == 0;
    }
    else {
      BOOL v7 = 1;
    }
    if (v7)
    {
      uint64_t v8 = (void *)v6;
    }
    else
    {
      do
      {
        std::string::operator=((std::string *)(v6 + 16), (const std::string *)(v2 + 2));
        uint64_t v10 = v2[5];
        uint64_t v9 = v2[6];
        if (v9) {
          atomic_fetch_add_explicit((atomic_ullong *volatile)(v9 + 8), 1uLL, memory_order_relaxed);
        }
        uint64_t v11 = *(std::__shared_weak_count **)(v6 + 48);
        *(void *)(v6 + 4malloc_zone_pressure_relief(0, 0) = v10;
        *(void *)(v6 + 4_Block_object_dispose(&STACK[0x3A0], 8) = v9;
        if (v11) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v11);
        }
        uint64_t v8 = *(void **)v6;
        std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<E5RT::IOPort>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::IOPort>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::IOPort>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<E5RT::IOPort>>>>::__node_insert_multi((uint64_t)a1, v6);
        unsigned int v2 = (uint64_t *)*v2;
        if (!v8) {
          break;
        }
        uint64_t v6 = (uint64_t)v8;
      }
      while (v2);
    }
    std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<E5RT::IOPort>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::IOPort>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::IOPort>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<E5RT::IOPort>>>>::__deallocate_node(v8);
  }
  for (; v2; unsigned int v2 = (uint64_t *)*v2)
  {
    uint64_t v12 = (char *)operator new(0x38uLL);
    v14[0] = v12;
    v14[1] = a1 + 2;
    char v15 = 0;
    *(void *)uint64_t v12 = 0;
    *((void *)v12 + 1) = 0;
    id v13 = std::pair<std::string const,std::shared_ptr<E5RT::IOPort>>::pair[abi:ne180100]((std::string *)(v12 + 16), (long long *)v2 + 1);
    char v15 = 1;
    *((void *)v12 + 1) = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)v13);
    std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<E5RT::IOPort>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::IOPort>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::IOPort>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<E5RT::IOPort>>>>::__node_insert_multi((uint64_t)a1, (uint64_t)v12);
    v14[0] = 0;
    std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>,void *>>>>::reset[abi:ne180100]((uint64_t)v14);
  }
}

void sub_1D1D9B59C(void *a1)
{
  __cxa_begin_catch(a1);
  std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<E5RT::IOPort>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::IOPort>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::IOPort>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<E5RT::IOPort>>>>::__deallocate_node(v1);
  __cxa_rethrow();
}

void sub_1D1D9B5B4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>,void *>>>>::reset[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

unint64_t std::__string_hash<char>::operator()[abi:ne180100](uint64_t a1)
{
  int v1 = *(char *)(a1 + 23);
  unint64_t v2 = *(void *)(a1 + 8);
  BOOL v3 = v1 < 0;
  if (v1 >= 0) {
    uint64_t v4 = (uint64_t *)a1;
  }
  else {
    uint64_t v4 = *(uint64_t **)a1;
  }
  if (!v3) {
    unint64_t v2 = *(unsigned __int8 *)(a1 + 23);
  }
  if (v2 > 0x20)
  {
    if (v2 > 0x40)
    {
      unint64_t v34 = 0x9DDFEA08EB382D69;
      uint64_t v44 = *(uint64_t *)((char *)v4 + v2 - 48);
      uint64_t v43 = *(uint64_t *)((char *)v4 + v2 - 40);
      uint64_t v45 = *(uint64_t *)((char *)v4 + v2 - 24);
      uint64_t v47 = *(uint64_t *)((char *)v4 + v2 - 64);
      uint64_t v46 = *(uint64_t *)((char *)v4 + v2 - 56);
      uint64_t v48 = *(uint64_t *)((char *)v4 + v2 - 16);
      uint64_t v49 = *(uint64_t *)((char *)v4 + v2 - 8);
      unint64_t v50 = v46 + v48;
      unint64_t v51 = 0x9DDFEA08EB382D69
          * (v45 ^ ((0x9DDFEA08EB382D69 * (v45 ^ (v44 + v2))) >> 47) ^ (0x9DDFEA08EB382D69 * (v45 ^ (v44 + v2))));
      unint64_t v52 = 0x9DDFEA08EB382D69 * (v51 ^ (v51 >> 47));
      unint64_t v53 = v47 + v2 + v46 + v44;
      uint64_t v54 = v53 + v43;
      unint64_t v55 = __ROR8__(v53, 44) + v47 + v2 + __ROR8__(v43 + v47 + v2 - 0x622015F714C7D297 * (v51 ^ (v51 >> 47)), 21);
      uint64_t v56 = v46 + v48 + *(uint64_t *)((char *)v4 + v2 - 32) - 0x4B6D499041670D8DLL;
      uint64_t v57 = v56 + v45 + v48;
      uint64_t v58 = __ROR8__(v57, 44);
      uint64_t v59 = v57 + v49;
      uint64_t v60 = v58 + v56 + __ROR8__(v56 + v43 + v49, 21);
      uint64_t v62 = *v4;
      v61 = v4 + 4;
      unint64_t v63 = v62 - 0x4B6D499041670D8DLL * v43;
      uint64_t v64 = -(uint64_t)((v2 - 1) & 0xFFFFFFFFFFFFFFC0);
      do
      {
        uint64_t v65 = *(v61 - 3);
        uint64_t v66 = v63 + v54 + v50 + v65;
        uint64_t v67 = v61[2];
        uint64_t v68 = v61[3];
        uint64_t v69 = v61[1];
        unint64_t v50 = v69 + v54 - 0x4B6D499041670D8DLL * __ROR8__(v50 + v55 + v67, 42);
        uint64_t v70 = v52 + v59;
        uint64_t v71 = *(v61 - 2);
        uint64_t v72 = *(v61 - 1);
        uint64_t v73 = *(v61 - 4) - 0x4B6D499041670D8DLL * v55;
        uint64_t v74 = v73 + v59 + v72;
        uint64_t v75 = v73 + v65 + v71;
        uint64_t v54 = v75 + v72;
        uint64_t v76 = __ROR8__(v75, 44) + v73;
        unint64_t v77 = (0xB492B66FBE98F273 * __ROR8__(v66, 37)) ^ v60;
        unint64_t v63 = 0xB492B66FBE98F273 * __ROR8__(v70, 33);
        unint64_t v55 = v76 + __ROR8__(v74 + v77, 21);
        unint64_t v78 = v63 + v60 + *v61;
        uint64_t v59 = v78 + v69 + v67 + v68;
        uint64_t v60 = __ROR8__(v78 + v69 + v67, 44) + v78 + __ROR8__(v50 + v71 + v78 + v68, 21);
        v61 += 8;
        unint64_t v52 = v77;
        v64 += 64;
      }
      while (v64);
      unint64_t v79 = 0x9DDFEA08EB382D69
          * (v59 ^ ((0x9DDFEA08EB382D69 * (v59 ^ v54)) >> 47) ^ (0x9DDFEA08EB382D69 * (v59 ^ v54)));
      unint64_t v80 = v63
          - 0x622015F714C7D297
          * ((0x9DDFEA08EB382D69
            * (v60 ^ ((0x9DDFEA08EB382D69 * (v60 ^ v55)) >> 47) ^ (0x9DDFEA08EB382D69 * (v60 ^ v55)))) ^ ((0x9DDFEA08EB382D69 * (v60 ^ ((0x9DDFEA08EB382D69 * (v60 ^ v55)) >> 47) ^ (0x9DDFEA08EB382D69 * (v60 ^ v55)))) >> 47));
      unint64_t v81 = 0x9DDFEA08EB382D69
          * (v80 ^ (v77 - 0x4B6D499041670D8DLL * (v50 ^ (v50 >> 47)) - 0x622015F714C7D297 * (v79 ^ (v79 >> 47))));
      unint64_t v35 = 0x9DDFEA08EB382D69 * (v80 ^ (v81 >> 47) ^ v81);
    }
    else
    {
      uint64_t v9 = (char *)v4 + v2;
      uint64_t v10 = *(uint64_t *)((char *)v4 + v2 - 16);
      uint64_t v11 = *(uint64_t *)((char *)v4 + v2 - 8);
      uint64_t v12 = v4[1];
      uint64_t v13 = *v4 - 0x3C5A37A36834CED9 * (v10 + v2);
      uint64_t v16 = v4 + 2;
      uint64_t v14 = v4[2];
      uint64_t v15 = v16[1];
      uint64_t v17 = __ROR8__(v13 + v15, 52);
      uint64_t v18 = __ROR8__(v13, 37);
      uint64_t v19 = v13 + v12;
      uint64_t v20 = __ROR8__(v19, 7);
      uint64_t v21 = v19 + v14;
      uint64_t v22 = v20 + v18;
      uint64_t v23 = *((void *)v9 - 4) + v14;
      uint64_t v24 = v11 + v15;
      uint64_t v25 = __ROR8__(v24 + v23, 52);
      uint64_t v26 = v22 + v17;
      uint64_t v27 = __ROR8__(v23, 37);
      uint64_t v28 = *((void *)v9 - 3) + v23;
      uint64_t v29 = __ROR8__(v28, 7);
      uint64_t v30 = v26 + __ROR8__(v21, 31);
      uint64_t v31 = v28 + v10;
      uint64_t v32 = v31 + v24;
      uint64_t v33 = v21 + v15 + v27 + v29 + v25 + __ROR8__(v31, 31);
      unint64_t v34 = 0x9AE16A3B2F90404FLL;
      unint64_t v35 = v30
          - 0x3C5A37A36834CED9
          * ((0xC3A5C85C97CB3127 * (v32 + v30) - 0x651E95C4D06FBFB1 * v33) ^ ((0xC3A5C85C97CB3127 * (v32 + v30)
                                                                                 - 0x651E95C4D06FBFB1 * v33) >> 47));
    }
    return (v35 ^ (v35 >> 47)) * v34;
  }
  else
  {
    if (v2 > 0x10)
    {
      uint64_t v36 = v4[1];
      unint64_t v37 = 0xB492B66FBE98F273 * *v4;
      unint64_t v38 = 0x9AE16A3B2F90404FLL * *(uint64_t *)((char *)v4 + v2 - 8);
      uint64_t v39 = __ROR8__(v38, 30) + __ROR8__(v37 - v36, 43);
      unint64_t v40 = v37 + v2 + __ROR8__(v36 ^ 0xC949D7C7509E6557, 20) - v38;
      unint64_t v41 = 0x9DDFEA08EB382D69 * (v40 ^ (v39 - 0x3C5A37A36834CED9 * *(uint64_t *)((char *)v4 + v2 - 16)));
      unint64_t v42 = v40 ^ (v41 >> 47) ^ v41;
      return 0x9DDFEA08EB382D69 * ((0x9DDFEA08EB382D69 * v42) ^ ((0x9DDFEA08EB382D69 * v42) >> 47));
    }
    if (v2 >= 9)
    {
      uint64_t v5 = *v4;
      uint64_t v6 = *(uint64_t *)((char *)v4 + v2 - 8);
      uint64_t v7 = __ROR8__(v6 + v2, v2);
      return (0x9DDFEA08EB382D69
            * ((0x9DDFEA08EB382D69
              * (v7 ^ ((0x9DDFEA08EB382D69 * (v7 ^ v5)) >> 47) ^ (0x9DDFEA08EB382D69 * (v7 ^ v5)))) ^ ((0x9DDFEA08EB382D69 * (v7 ^ ((0x9DDFEA08EB382D69 * (v7 ^ v5)) >> 47) ^ (0x9DDFEA08EB382D69 * (v7 ^ v5)))) >> 47))) ^ v6;
    }
    if (v2 >= 4)
    {
      int v82 = *(_DWORD *)v4;
      uint64_t v83 = *(unsigned int *)((char *)v4 + v2 - 4);
      unint64_t v84 = 0x9DDFEA08EB382D69 * ((v2 + (8 * v82)) ^ v83);
      unint64_t v42 = v83 ^ (v84 >> 47) ^ v84;
      return 0x9DDFEA08EB382D69 * ((0x9DDFEA08EB382D69 * v42) ^ ((0x9DDFEA08EB382D69 * v42) >> 47));
    }
    unint64_t result = 0x9AE16A3B2F90404FLL;
    if (v2)
    {
      unint64_t v85 = (0xC949D7C7509E6557 * (v2 + 4 * *((unsigned __int8 *)v4 + v2 - 1))) ^ (0x9AE16A3B2F90404FLL
                                                                                     * (*(unsigned __int8 *)v4 | ((unint64_t)*((unsigned __int8 *)v4 + (v2 >> 1)) << 8)));
      return 0x9AE16A3B2F90404FLL * (v85 ^ (v85 >> 47));
    }
  }
  return result;
}

BOOL std::equal_to<std::string>::operator()[abi:ne180100](unsigned __int8 *a1, unsigned __int8 *a2)
{
  uint64_t v2 = a1[23];
  if ((v2 & 0x80u) == 0) {
    uint64_t v3 = a1[23];
  }
  else {
    uint64_t v3 = *((void *)a1 + 1);
  }
  uint64_t v4 = a2[23];
  int v5 = (char)v4;
  if ((v4 & 0x80u) != 0) {
    uint64_t v4 = *((void *)a2 + 1);
  }
  if (v3 != v4) {
    return 0;
  }
  if (v5 < 0) {
    a2 = *(unsigned __int8 **)a2;
  }
  if ((v2 & 0x80) != 0) {
    return memcmp(*(const void **)a1, a2, *((void *)a1 + 1)) == 0;
  }
  if (!a1[23]) {
    return 1;
  }
  uint64_t v6 = v2 - 1;
  do
  {
    int v8 = *a1++;
    int v7 = v8;
    int v10 = *a2++;
    int v9 = v10;
    BOOL v12 = v6-- != 0;
    BOOL v13 = v7 == v9;
    BOOL v14 = v7 == v9;
  }
  while (v13 && v12);
  return v14;
}

void std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>,void *>>>>::reset[abi:ne180100](uint64_t a1)
{
  int v1 = *(void **)a1;
  *(void *)a1 = 0;
  if (v1)
  {
    if (*(unsigned char *)(a1 + 16)) {
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::shared_ptr<E5RT::BufferObject>>,0>((uint64_t)v1 + 16);
    }
    operator delete(v1);
  }
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  int v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x1E4FBA350], MEMORY[0x1E4FBA1F8]);
}

uint64_t std::__shared_ptr_pointer<E5RT::BufferObject  *>::__get_deleter(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), 0x80000001D1F4FB36)) {
    return a1 + 24;
  }
  else {
    return 0;
  }
}

BOOL std::type_info::operator==[abi:ne180100](uint64_t a1, uint64_t a2)
{
  if (a1 == a2) {
    return 1;
  }
  if ((a2 & a1) < 0 != __OFSUB__(a1, a2)) {
    return strcmp((const char *)(a1 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(a2 & 0x7FFFFFFFFFFFFFFFLL)) == 0;
  }
  return 0;
}

uint64_t std::__shared_ptr_pointer<E5RT::BufferObject  *>::__on_zero_shared(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

void std::__shared_ptr_pointer<E5RT::BufferObject  *>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1D25FE710);
}

void std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<E5RT::IOPort>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::IOPort>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::IOPort>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<E5RT::IOPort>>>>::__node_insert_multi(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = (void *)a2;
  uint64_t v4 = (unsigned __int8 *)(a2 + 16);
  unint64_t v43 = std::__string_hash<char>::operator()[abi:ne180100](a2 + 16);
  v2[1] = v43;
  unint64_t v5 = *(void *)(a1 + 8);
  float v6 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v7 = *(float *)(a1 + 32);
  if (!v5 || (float)(v7 * (float)v5) < v6)
  {
    BOOL v8 = 1;
    if (v5 >= 3) {
      BOOL v8 = (v5 & (v5 - 1)) != 0;
    }
    unint64_t v9 = v8 | (2 * v5);
    unint64_t v10 = vcvtps_u32_f32(v6 / v7);
    if (v9 <= v10) {
      int8x8_t prime = (int8x8_t)v10;
    }
    else {
      int8x8_t prime = (int8x8_t)v9;
    }
    if (*(void *)&prime == 1)
    {
      int8x8_t prime = (int8x8_t)2;
    }
    else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
      unint64_t v5 = *(void *)(a1 + 8);
    }
    if (*(void *)&prime > v5) {
      goto LABEL_99;
    }
    if (*(void *)&prime >= v5) {
      goto LABEL_60;
    }
    unint64_t v19 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (v5 < 3 || (uint8x8_t v20 = (uint8x8_t)vcnt_s8((int8x8_t)v5), v20.i16[0] = vaddlv_u8(v20), v20.u32[0] > 1uLL))
    {
      unint64_t v19 = std::__next_prime(v19);
    }
    else
    {
      uint64_t v21 = 1 << -(char)__clz(v19 - 1);
      if (v19 >= 2) {
        unint64_t v19 = v21;
      }
    }
    if (*(void *)&prime <= v19) {
      int8x8_t prime = (int8x8_t)v19;
    }
    if (*(void *)&prime >= v5)
    {
      unint64_t v5 = *(void *)(a1 + 8);
      goto LABEL_60;
    }
    if (prime)
    {
LABEL_99:
      if (*(void *)&prime >> 61) {
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
      BOOL v12 = operator new(8 * *(void *)&prime);
      BOOL v13 = *(void **)a1;
      *(void *)a1 = v12;
      if (v13) {
        operator delete(v13);
      }
      unint64_t v41 = v4;
      uint64_t v14 = 0;
      *(int8x8_t *)(a1 + _Block_object_dispose(&STACK[0x3A0], 8) = prime;
      do
        *(void *)(*(void *)a1 + 8 * v14++) = 0;
      while (*(void *)&prime != v14);
      uint64_t v15 = *(uint64_t **)(a1 + 16);
      if (v15)
      {
        unint64_t v16 = v15[1];
        uint8x8_t v17 = (uint8x8_t)vcnt_s8(prime);
        v17.i16[0] = vaddlv_u8(v17);
        unint64_t v18 = v17.u32[0];
        unint64_t v40 = v2;
        if (v17.u32[0] > 1uLL)
        {
          if (v16 >= *(void *)&prime) {
            v16 %= *(void *)&prime;
          }
        }
        else
        {
          v16 &= *(void *)&prime - 1;
        }
        *(void *)(*(void *)a1 + 8 * v16) = a1 + 16;
        uint64_t v22 = *v15;
        if (*v15)
        {
          unint64_t v42 = v17.u32[0];
          do
          {
            unint64_t v23 = *(void *)(v22 + 8);
            if (v18 > 1)
            {
              if (v23 >= *(void *)&prime) {
                v23 %= *(void *)&prime;
              }
            }
            else
            {
              v23 &= *(void *)&prime - 1;
            }
            if (v23 == v16)
            {
              uint64_t v15 = (uint64_t *)v22;
            }
            else if (*(void *)(*(void *)a1 + 8 * v23))
            {
              uint64_t v24 = *(void **)v22;
              if (*(void *)v22)
              {
                uint64_t v25 = (void *)v22;
                while (1)
                {
                  uint64_t v26 = v24;
                  if (!std::equal_to<std::string>::operator()[abi:ne180100]((unsigned __int8 *)(v22 + 16), (unsigned __int8 *)v24 + 16))break; {
                  uint64_t v24 = (void *)*v26;
                  }
                  uint64_t v25 = v26;
                  if (!*v26) {
                    goto LABEL_47;
                  }
                }
                uint64_t v24 = v26;
                uint64_t v26 = v25;
LABEL_47:
                unint64_t v18 = v42;
              }
              else
              {
                uint64_t v26 = (void *)v22;
              }
              *uint64_t v15 = (uint64_t)v24;
              void *v26 = **(void **)(*(void *)a1 + 8 * v23);
              **(void **)(*(void *)a1 + 8 * v23) = v22;
            }
            else
            {
              *(void *)(*(void *)a1 + 8 * v23) = v15;
              uint64_t v15 = (uint64_t *)v22;
              unint64_t v16 = v23;
            }
            uint64_t v22 = *v15;
          }
          while (*v15);
        }
        unint64_t v5 = (unint64_t)prime;
        uint64_t v2 = v40;
        uint64_t v4 = v41;
      }
      else
      {
        unint64_t v5 = (unint64_t)prime;
        uint64_t v4 = v41;
      }
    }
    else
    {
      uint64_t v27 = *(void **)a1;
      *(void *)a1 = 0;
      if (v27) {
        operator delete(v27);
      }
      unint64_t v5 = 0;
      *(void *)(a1 + _Block_object_dispose(&STACK[0x3A0], 8) = 0;
    }
  }
LABEL_60:
  uint8x8_t v28 = (uint8x8_t)vcnt_s8((int8x8_t)v5);
  v28.i16[0] = vaddlv_u8(v28);
  unint64_t v29 = v28.u32[0];
  if (v28.u32[0] > 1uLL)
  {
    unint64_t v30 = v43;
    if (v5 <= v43) {
      unint64_t v30 = v43 % v5;
    }
  }
  else
  {
    unint64_t v30 = (v5 - 1) & v43;
  }
  uint64_t v31 = *(unsigned __int8 **)(*(void *)a1 + 8 * v30);
  if (v31)
  {
    uint64_t v32 = *(unsigned __int8 **)v31;
    if (*(void *)v31)
    {
      int v33 = 0;
      do
      {
        unint64_t v34 = v32;
        unint64_t v35 = *((void *)v32 + 1);
        if (v29 > 1)
        {
          unint64_t v36 = v35;
          if (v35 >= v5) {
            unint64_t v36 = v35 % v5;
          }
        }
        else
        {
          unint64_t v36 = v35 & (v5 - 1);
        }
        if (v36 != v30) {
          break;
        }
        BOOL v37 = v35 == v43 && std::equal_to<std::string>::operator()[abi:ne180100](v34 + 16, v4);
        if (v33 & !v37) {
          break;
        }
        v33 |= v37;
        uint64_t v32 = *(unsigned __int8 **)v34;
        uint64_t v31 = v34;
      }
      while (*(void *)v34);
    }
  }
  unint64_t v38 = v2[1];
  if (v29 > 1)
  {
    if (v38 >= v5) {
      v38 %= v5;
    }
  }
  else
  {
    v38 &= v5 - 1;
  }
  if (!v31)
  {
    void *v2 = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v2;
    *(void *)(*(void *)a1 + 8 * v3_Block_object_dispose(&STACK[0x3A0], 8) = a1 + 16;
    if (!*v2) {
      goto LABEL_95;
    }
    unint64_t v39 = *(void *)(*v2 + 8);
    if (v29 > 1)
    {
      if (v39 >= v5) {
        v39 %= v5;
      }
    }
    else
    {
      v39 &= v5 - 1;
    }
LABEL_94:
    *(void *)(*(void *)a1 + 8 * v39) = v2;
    goto LABEL_95;
  }
  void *v2 = *(void *)v31;
  *(void *)uint64_t v31 = v2;
  if (*v2)
  {
    unint64_t v39 = *(void *)(*v2 + 8);
    if (v29 > 1)
    {
      if (v39 >= v5) {
        v39 %= v5;
      }
    }
    else
    {
      v39 &= v5 - 1;
    }
    if (v39 != v38) {
      goto LABEL_94;
    }
  }
LABEL_95:
  ++*(void *)(a1 + 24);
}

uint64_t std::__shared_ptr_pointer<E5RT::ExecutionStreamOperation  *>::__get_deleter(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), 0x80000001D1F4FA97)) {
    return a1 + 24;
  }
  else {
    return 0;
  }
}

uint64_t std::__shared_ptr_pointer<E5RT::ExecutionStreamOperation  *>::__on_zero_shared(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

void std::__shared_ptr_pointer<E5RT::ExecutionStreamOperation  *>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1D25FE710);
}

__CFString *_stringForGraphChangeType(unint64_t a1)
{
  if (a1 > 0xC) {
    return 0;
  }
  else {
    return off_1E68EB498[a1];
  }
}

id _stringForGraphMomentUpdateTypes(char a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v3 = v2;
  if (a1)
  {
    [v2 addObject:@"Content"];
    if ((a1 & 2) == 0)
    {
LABEL_3:
      if ((a1 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((a1 & 2) == 0)
  {
    goto LABEL_3;
  }
  [v3 addObject:@"Date"];
  if ((a1 & 4) == 0)
  {
LABEL_4:
    if ((a1 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  [v3 addObject:@"Location"];
  if ((a1 & 8) == 0)
  {
LABEL_5:
    if ((a1 & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  [v3 addObject:@"Person"];
  if ((a1 & 0x10) != 0) {
LABEL_6:
  }
    [v3 addObject:@"AssetCount"];
LABEL_7:
  uint64_t v4 = [v3 componentsJoinedByString:@", "];

  return v4;
}

__CFString *PGGraphChangeStringFromMomentUpdateType(uint64_t a1)
{
  uint64_t result = 0;
  if (a1 > 15)
  {
    uint64_t v3 = @"PGGraphMomentUpdateTypeChangesRelatedToCurationContent";
    uint64_t v4 = @"PGGraphMomentUpdateTypeAll";
    if (a1 != 31) {
      uint64_t v4 = 0;
    }
    if (a1 != 25) {
      uint64_t v3 = v4;
    }
    unint64_t v5 = @"PGGraphMomentUpdateTypeAssetCount";
    float v6 = @"PGGraphMomentUpdateTypeAssetChangesRelatedToPersonChanges";
    if (a1 != 24) {
      float v6 = 0;
    }
    if (a1 != 16) {
      unint64_t v5 = v6;
    }
    if (a1 <= 24) {
      return v5;
    }
    else {
      return v3;
    }
  }
  else
  {
    switch(a1)
    {
      case 1:
        uint64_t result = @"PGGraphMomentUpdateTypeContent";
        break;
      case 2:
        uint64_t result = @"PGGraphMomentUpdateTypeDate";
        break;
      case 4:
        uint64_t result = @"PGGraphMomentUpdateTypeLocation";
        break;
      case 8:
        uint64_t result = @"PGGraphMomentUpdateTypePerson";
        break;
      default:
        return result;
    }
  }
  return result;
}

__CFString *PGGraphChangeStringFromHighlightUpdateType(uint64_t a1)
{
  uint64_t result = 0;
  if (a1 > 15)
  {
    uint64_t v3 = @"PGGraphHighlightUpdateTypeSearchSpecific";
    uint64_t v4 = @"PGGraphHighlightUpdateTypeAll";
    if (a1 != 127) {
      uint64_t v4 = 0;
    }
    if (a1 != 64) {
      uint64_t v3 = v4;
    }
    unint64_t v5 = @"PGGraphHighlightUpdateTypeAssetCount";
    float v6 = @"PGGraphHighlightUpdateTypeLocation";
    if (a1 != 32) {
      float v6 = 0;
    }
    if (a1 != 16) {
      unint64_t v5 = v6;
    }
    if (a1 <= 63) {
      return v5;
    }
    else {
      return v3;
    }
  }
  else
  {
    switch(a1)
    {
      case 0:
        uint64_t result = @"PGGraphHighlightUpdateTypeNone";
        break;
      case 1:
        uint64_t result = @"PGGraphHighlightUpdateTypeContent";
        break;
      case 2:
        uint64_t result = @"PGGraphHighlightUpdateTypePropertyDate";
        break;
      case 4:
        uint64_t result = @"PGGraphHighlightUpdateTypePropertyType";
        break;
      case 8:
        uint64_t result = @"PGGraphHighlightUpdateTypeChild";
        break;
      default:
        return result;
    }
  }
  return result;
}

void sub_1D1DA008C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__52371(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4malloc_zone_pressure_relief(0, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4malloc_zone_pressure_relief(0, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__52372(uint64_t a1)
{
}

void sub_1D1DA0C74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va1, a13);
  va_start(va, a13);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1D1DA1948(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__52448(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4malloc_zone_pressure_relief(0, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4malloc_zone_pressure_relief(0, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__52449(uint64_t a1)
{
}

void sub_1D1DA4618(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
}

void sub_1D1DA5B90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49)
{
}

void sub_1D1DA8330(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1DA9348(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_1D1DABD50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a57, 8);
  _Block_object_dispose(&a71, 8);
  _Block_object_dispose(&STACK[0x220], 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__52615(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4malloc_zone_pressure_relief(0, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4malloc_zone_pressure_relief(0, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__52616(uint64_t a1)
{
}

void sub_1D1DAD0B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1DAECB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
}

void sub_1D1DAF5D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38,uint64_t a39,uint64_t a40,uint64_t a41,char a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,char a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,char a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,char a60)
{
}

void sub_1D1DB2364(_Unwind_Exception *a1)
{
}

void sub_1D1DB6AFC(_Unwind_Exception *a1)
{
}

void sub_1D1DB8344(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1DB8580(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1DB87D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1DB8A40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1DB8C78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1DB98CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1D1DBA98C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
}

void sub_1D1DBD994(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 240), 8);
  _Unwind_Resume(a1);
}

void sub_1D1DBE820(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

__CFString *PGGraphAddressNodeStringFromLocationMode(unint64_t a1)
{
  if (a1 > 3) {
    return @"Unknown";
  }
  else {
    return off_1E68EBEC8[a1];
  }
}

void sub_1D1DC174C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va1, a10);
  va_start(va, a10);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__53671(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4malloc_zone_pressure_relief(0, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4malloc_zone_pressure_relief(0, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__53672(uint64_t a1)
{
}

void sub_1D1DC360C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D1DC3698(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D1DC375C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D1DC37BC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D1DC3820(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D1DC38BC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D1DC4D70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1DC5CD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v6 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__54860(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4malloc_zone_pressure_relief(0, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4malloc_zone_pressure_relief(0, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__54861(uint64_t a1)
{
}

void sub_1D1DC674C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_1D1DC735C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1D1DCA70C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a64, 8);
  _Block_object_dispose(&STACK[0x5E0], 8);
  _Unwind_Resume(a1);
}

void sub_1D1DCAC8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1D1DCFA10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1DCFE84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1DD0BC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
}

void sub_1D1DD31B0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1D1DD3600(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D1DD6BB8(_Unwind_Exception *a1)
{
}

void sub_1D1DD9324(_Unwind_Exception *a1)
{
}

void sub_1D1DDA86C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__55580(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4malloc_zone_pressure_relief(0, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4malloc_zone_pressure_relief(0, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__55581(uint64_t a1)
{
}

void sub_1D1DDD31C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__55893(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4malloc_zone_pressure_relief(0, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4malloc_zone_pressure_relief(0, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__55894(uint64_t a1)
{
}

void sub_1D1DDE090(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,char a56)
{
}

void sub_1D1DE08F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1D1DE2CEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
}

void sub_1D1DE54E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

uint64_t __Block_byref_object_copy__56849(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4malloc_zone_pressure_relief(0, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4malloc_zone_pressure_relief(0, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__56850(uint64_t a1)
{
}

void sub_1D1DE5C90(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x1D1DE5C5CLL);
  }
  _Unwind_Resume(a1);
}

void sub_1D1DE6674(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1DE6A60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__57053(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4malloc_zone_pressure_relief(0, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4malloc_zone_pressure_relief(0, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__57054(uint64_t a1)
{
}

void sub_1D1DE6D98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1DE8D9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
}

void sub_1D1DE9D2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose((const void *)(v39 - 240), 8);
  _Unwind_Resume(a1);
}

void sub_1D1DEBE84(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1D1DEC208(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__57624(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4malloc_zone_pressure_relief(0, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4malloc_zone_pressure_relief(0, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__57625(uint64_t a1)
{
}

void sub_1D1DEC7D0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1D1DECB2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1DECC80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1DED0A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1DEDF20(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1D1DF0C6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 176), 8);
  _Unwind_Resume(a1);
}

__CFString *PGStringForMemoryNotificationLevel(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3) {
    return @"PGMemoryNotificationLevelUndefined";
  }
  else {
    return off_1E68ED150[a1 - 1];
  }
}

__CFString *PGStringForMemorySourceType(unint64_t a1)
{
  if (a1 > 4) {
    return @"Unsupported Source Type";
  }
  else {
    return off_1E68ED170[a1];
  }
}

uint64_t PGMemorySourceTypeFromCategory(uint64_t a1)
{
  uint64_t result = 1;
  if (a1 > 101)
  {
    if (a1 > 300)
    {
      if ((unint64_t)(a1 - 301) < 2) {
        return 3;
      }
      else {
        return 0;
      }
    }
    else
    {
      switch(a1)
      {
        case 201:
        case 211:
        case 215:
        case 216:
        case 217:
        case 219:
          return 3;
        case 202:
        case 203:
        case 204:
        case 205:
        case 206:
        case 207:
        case 208:
        case 209:
        case 210:
        case 212:
        case 213:
        case 214:
          return result;
        case 218:
        case 220:
LABEL_3:
          uint64_t result = 4;
          break;
        case 221:
LABEL_7:
          uint64_t result = 2;
          break;
        default:
          if (a1 != 102) {
            return 0;
          }
          break;
      }
    }
  }
  else
  {
    switch(a1)
    {
      case 0:
      case 22:
      case 32:
        return 0;
      case 1:
      case 16:
        return result;
      case 2:
      case 3:
      case 5:
      case 6:
      case 9:
      case 10:
      case 11:
      case 25:
      case 26:
      case 27:
      case 28:
      case 29:
      case 30:
        goto LABEL_3;
      case 4:
      case 8:
      case 12:
      case 13:
      case 14:
      case 15:
      case 17:
      case 18:
      case 20:
      case 21:
      case 23:
        return 3;
      case 7:
      case 19:
      case 24:
      case 31:
        goto LABEL_7;
      default:
        if (a1 == 101) {
          return 3;
        }
        return 0;
    }
  }
  return result;
}

BOOL PGMemorySourceTypeIsAggregation(uint64_t a1)
{
  return (unint64_t)(a1 - 3) < 2;
}

uint64_t PGCurrentPhotosGraphVersion()
{
  return PLPhotosGraphVersionFromAlgorithmsVersions();
}

__CFString *PGStringForMemoryCategorySubcategory(uint64_t a1)
{
  if (a1 <= 9000)
  {
    if (a1 > 6000)
    {
      if (a1 > 7000)
      {
        switch(a1)
        {
          case 7001:
            uint64_t result = @"PetYear";
            break;
          case 7002:
            uint64_t result = @"PetSeason";
            break;
          case 7003:
            uint64_t result = @"PetOverTheYears";
            break;
          case 7004:
            uint64_t result = @"PetWithPersonOverTheYears";
            break;
          case 7005:
            uint64_t result = @"PetOutdoorYear";
            break;
          case 7006:
            uint64_t result = @"PetOutdoorOverTheYears";
            break;
          default:
            if (a1 == 8001)
            {
              uint64_t result = @"BabyYear";
            }
            else
            {
              if (a1 != 8002) {
                return @"Unknown";
              }
              uint64_t result = @"BabyOverTheYears";
            }
            break;
        }
      }
      else
      {
        switch(a1)
        {
          case 6001:
            uint64_t result = @"FoodieGenericYear";
            break;
          case 6002:
            uint64_t result = @"FoodieGenericOverTheYears";
            break;
          case 6003:
            uint64_t result = @"FoodiePersonYear";
            break;
          case 6004:
            uint64_t result = @"FoodiePersonOverTheYears";
            break;
          case 6005:
            uint64_t result = @"FoodieCityYear";
            break;
          case 6006:
            uint64_t result = @"FoodieCityOverTheYears";
            break;
          case 6007:
            uint64_t result = @"FoodieRestaurantYear";
            break;
          case 6008:
            uint64_t result = @"FoodieRestaurantOverTheYears";
            break;
          case 6009:
            uint64_t result = @"FoodieHomeYear";
            break;
          case 6010:
            uint64_t result = @"FoodieHomeOverTheYears";
            break;
          case 6011:
            uint64_t result = @"FoodieTrip";
            break;
          default:
            return @"Unknown";
        }
      }
      return result;
    }
    if (a1 > 3000)
    {
      if (a1 <= 4000)
      {
        if (a1 == 3001) {
          return @"SocialGroupYear";
        }
        if (a1 == 3002) {
          return @"SocialGroupOverTheYears";
        }
      }
      else
      {
        switch(a1)
        {
          case 4001:
            return @"HomeLastMonth";
          case 5001:
            return @"InReviewYear";
          case 5002:
            return @"InReviewRecents";
        }
      }
    }
    else
    {
      if (a1 > 2000)
      {
        switch(a1)
        {
          case 2001:
            uint64_t result = @"PersonYear";
            break;
          case 2002:
            uint64_t result = @"PersonSeason";
            break;
          case 2003:
            uint64_t result = @"PersonOverTheYears";
            break;
          case 2004:
            uint64_t result = @"PersonEarlyMoments";
            break;
          case 2005:
            uint64_t result = @"PersonExcitingMomentsYear";
            break;
          case 2006:
            uint64_t result = @"PersonExcitingMomentsOverTheYears";
            break;
          default:
            return @"Unknown";
        }
        return result;
      }
      switch(a1)
      {
        case 0:
          return @"None";
        case 1001:
          return @"MomentsSingleMoment";
        case 1002:
          return @"MomentsDayInHistoryAggregation";
      }
    }
    return @"Unknown";
  }
  if (a1 > 12002)
  {
    if (a1 <= 15000)
    {
      switch(a1)
      {
        case 12003:
          return @"TripOngoingTrip";
        case 13001:
          return @"SupersetPast";
        case 14001:
          return @"SeasonSingleSeason";
      }
      return @"Unknown";
    }
    switch(a1)
    {
      case 16001:
        uint64_t result = @"TrendsGenericYear";
        break;
      case 16002:
        uint64_t result = @"TrendsGenericOverTheYears";
        break;
      case 16003:
        uint64_t result = @"TrendsPersonYear";
        break;
      case 16004:
        uint64_t result = @"TrendsPersonOverTheYears";
        break;
      case 16005:
        uint64_t result = @"TrendsCityYear";
        break;
      case 16006:
        uint64_t result = @"TrendsCityOverTheYears";
        break;
      default:
        if (a1 != 17001) {
          return @"Unknown";
        }
        uint64_t result = @"ContentCreationToolOverTime";
        break;
    }
  }
  else if (a1 <= 11000)
  {
    switch(a1)
    {
      case 9001:
        uint64_t result = @"LocationCityYear";
        break;
      case 9002:
        uint64_t result = @"LocationCityOverTheYears";
        break;
      case 9003:
        uint64_t result = @"LocationAreaYear";
        break;
      case 9004:
        uint64_t result = @"LocationAreaOverTheYears";
        break;
      default:
        if (a1 == 10001)
        {
          uint64_t result = @"ROIYear";
        }
        else
        {
          if (a1 != 10002) {
            return @"Unknown";
          }
          uint64_t result = @"ROIOverTheYears";
        }
        break;
    }
  }
  else
  {
    switch(a1)
    {
      case 11001:
        uint64_t result = @"MeaningfulEventSingleEvent";
        break;
      case 11002:
        uint64_t result = @"MeaningfulEventGenericYear";
        break;
      case 11003:
        uint64_t result = @"MeaningfulEventGenericOverTheYears";
        break;
      case 11004:
        uint64_t result = @"MeaningfulEventSocialGroupYear";
        break;
      case 11005:
        uint64_t result = @"MeaningfulEventSocialGroupOverTheYears";
        break;
      case 11006:
        uint64_t result = @"MeaningfulEventAreaYear";
        break;
      case 11007:
        uint64_t result = @"MeaningfulEventAreaOverTheYears";
        break;
      case 11008:
        uint64_t result = @"MeaningfulEventCityYear";
        break;
      case 11009:
        uint64_t result = @"MeaningfulEventCityOverTheYears";
        break;
      default:
        if (a1 == 12001)
        {
          uint64_t result = @"TripTrip";
        }
        else
        {
          if (a1 != 12002) {
            return @"Unknown";
          }
          uint64_t result = @"TripRecurrent";
        }
        break;
    }
  }
  return result;
}

uint64_t PGMemoryCategorySubcategoryForLabel(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"None"])
  {
    uint64_t v2 = 0;
  }
  else if ([v1 isEqualToString:@"MomentsSingleMoment"])
  {
    uint64_t v2 = 1001;
  }
  else if ([v1 isEqualToString:@"MomentsDayInHistoryAggregation"])
  {
    uint64_t v2 = 1002;
  }
  else if ([v1 isEqualToString:@"PersonYear"])
  {
    uint64_t v2 = 2001;
  }
  else if ([v1 isEqualToString:@"PersonSeason"])
  {
    uint64_t v2 = 2002;
  }
  else if ([v1 isEqualToString:@"PersonOverTheYears"])
  {
    uint64_t v2 = 2003;
  }
  else if ([v1 isEqualToString:@"PersonEarlyMoments"])
  {
    uint64_t v2 = 2004;
  }
  else if ([v1 isEqualToString:@"PersonExcitingMomentsYear"])
  {
    uint64_t v2 = 2005;
  }
  else if ([v1 isEqualToString:@"PersonExcitingMomentsOverTheYears"])
  {
    uint64_t v2 = 2006;
  }
  else if ([v1 isEqualToString:@"SocialGroupYear"])
  {
    uint64_t v2 = 3001;
  }
  else if ([v1 isEqualToString:@"SocialGroupOverTheYears"])
  {
    uint64_t v2 = 3002;
  }
  else if ([v1 isEqualToString:@"HomeLastMonth"])
  {
    uint64_t v2 = 4001;
  }
  else if ([v1 isEqualToString:@"InReviewYear"])
  {
    uint64_t v2 = 5001;
  }
  else if ([v1 isEqualToString:@"InReviewRecents"])
  {
    uint64_t v2 = 5002;
  }
  else if ([v1 isEqualToString:@"FoodieGenericYear"])
  {
    uint64_t v2 = 6001;
  }
  else if ([v1 isEqualToString:@"FoodieGenericOverTheYears"])
  {
    uint64_t v2 = 6002;
  }
  else if ([v1 isEqualToString:@"FoodiePersonYear"])
  {
    uint64_t v2 = 6003;
  }
  else if ([v1 isEqualToString:@"FoodiePersonOverTheYears"])
  {
    uint64_t v2 = 6004;
  }
  else if ([v1 isEqualToString:@"FoodieCityYear"])
  {
    uint64_t v2 = 6005;
  }
  else if ([v1 isEqualToString:@"FoodieCityOverTheYears"])
  {
    uint64_t v2 = 6006;
  }
  else if ([v1 isEqualToString:@"FoodieRestaurantYear"])
  {
    uint64_t v2 = 6007;
  }
  else if ([v1 isEqualToString:@"FoodieRestaurantOverTheYears"])
  {
    uint64_t v2 = 6008;
  }
  else if ([v1 isEqualToString:@"FoodieHomeYear"])
  {
    uint64_t v2 = 6009;
  }
  else if ([v1 isEqualToString:@"FoodieHomeOverTheYears"])
  {
    uint64_t v2 = 6010;
  }
  else if ([v1 isEqualToString:@"FoodieTrip"])
  {
    uint64_t v2 = 6011;
  }
  else if ([v1 isEqualToString:@"PetYear"])
  {
    uint64_t v2 = 7001;
  }
  else if ([v1 isEqualToString:@"PetSeason"])
  {
    uint64_t v2 = 7002;
  }
  else if ([v1 isEqualToString:@"PetOverTheYears"])
  {
    uint64_t v2 = 7003;
  }
  else if ([v1 isEqualToString:@"PetWithPersonOverTheYears"])
  {
    uint64_t v2 = 7004;
  }
  else if ([v1 isEqualToString:@"PetOutdoorYear"])
  {
    uint64_t v2 = 7005;
  }
  else if ([v1 isEqualToString:@"PetOutdoorOverTheYears"])
  {
    uint64_t v2 = 7006;
  }
  else if ([v1 isEqualToString:@"BabyYear"])
  {
    uint64_t v2 = 8001;
  }
  else if ([v1 isEqualToString:@"BabyOverTheYears"])
  {
    uint64_t v2 = 8002;
  }
  else if ([v1 isEqualToString:@"LocationCityYear"])
  {
    uint64_t v2 = 9001;
  }
  else if ([v1 isEqualToString:@"LocationCityOverTheYears"])
  {
    uint64_t v2 = 9002;
  }
  else if ([v1 isEqualToString:@"LocationAreaYear"])
  {
    uint64_t v2 = 9003;
  }
  else if ([v1 isEqualToString:@"LocationAreaOverTheYears"])
  {
    uint64_t v2 = 9004;
  }
  else if ([v1 isEqualToString:@"ROIYear"])
  {
    uint64_t v2 = 10001;
  }
  else if ([v1 isEqualToString:@"ROIOverTheYears"])
  {
    uint64_t v2 = 10002;
  }
  else if ([v1 isEqualToString:@"MeaningfulEventSingleEvent"])
  {
    uint64_t v2 = 11001;
  }
  else if ([v1 isEqualToString:@"MeaningfulEventGenericYear"])
  {
    uint64_t v2 = 11002;
  }
  else if ([v1 isEqualToString:@"MeaningfulEventGenericOverTheYears"])
  {
    uint64_t v2 = 11003;
  }
  else if ([v1 isEqualToString:@"MeaningfulEventSocialGroupYear"])
  {
    uint64_t v2 = 11004;
  }
  else if ([v1 isEqualToString:@"MeaningfulEventSocialGroupOverTheYears"])
  {
    uint64_t v2 = 11005;
  }
  else if ([v1 isEqualToString:@"MeaningfulEventAreaYear"])
  {
    uint64_t v2 = 11006;
  }
  else if ([v1 isEqualToString:@"MeaningfulEventAreaOverTheYears"])
  {
    uint64_t v2 = 11007;
  }
  else if ([v1 isEqualToString:@"MeaningfulEventCityYear"])
  {
    uint64_t v2 = 11008;
  }
  else if ([v1 isEqualToString:@"MeaningfulEventCityOverTheYears"])
  {
    uint64_t v2 = 11009;
  }
  else if ([v1 isEqualToString:@"TripTrip"])
  {
    uint64_t v2 = 12001;
  }
  else if ([v1 isEqualToString:@"TripRecurrent"])
  {
    uint64_t v2 = 12002;
  }
  else if ([v1 isEqualToString:@"TripOngoingTrip"])
  {
    uint64_t v2 = 12003;
  }
  else if ([v1 isEqualToString:@"SupersetPast"])
  {
    uint64_t v2 = 13001;
  }
  else if ([v1 isEqualToString:@"SeasonSingleSeason"])
  {
    uint64_t v2 = 14001;
  }
  else if ([v1 isEqualToString:@"ChildActivityYear"])
  {
    uint64_t v2 = 15001;
  }
  else if ([v1 isEqualToString:@"ChildActivityOverTheYears"])
  {
    uint64_t v2 = 15002;
  }
  else if ([v1 isEqualToString:@"ChildWithPersonYear"])
  {
    uint64_t v2 = 15003;
  }
  else if ([v1 isEqualToString:@"ChildWithPersonOverTheYears"])
  {
    uint64_t v2 = 15004;
  }
  else if ([v1 isEqualToString:@"ChildOutdoorYear"])
  {
    uint64_t v2 = 15005;
  }
  else if ([v1 isEqualToString:@"ChildOutdoorOverTheYears"])
  {
    uint64_t v2 = 15006;
  }
  else if ([v1 isEqualToString:@"TrendsGenericYear"])
  {
    uint64_t v2 = 16001;
  }
  else if ([v1 isEqualToString:@"TrendsGenericOverTheYears"])
  {
    uint64_t v2 = 16002;
  }
  else if ([v1 isEqualToString:@"TrendsPersonYear"])
  {
    uint64_t v2 = 16003;
  }
  else if ([v1 isEqualToString:@"TrendsPersonOverTheYears"])
  {
    uint64_t v2 = 16004;
  }
  else if ([v1 isEqualToString:@"TrendsCityYear"])
  {
    uint64_t v2 = 16005;
  }
  else if ([v1 isEqualToString:@"TrendsCityOverTheYears"])
  {
    uint64_t v2 = 16006;
  }
  else if ([v1 isEqualToString:@"ContentCreationToolOverTime"])
  {
    uint64_t v2 = 17001;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

void sub_1D1DF65A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
  _Block_object_dispose((const void *)(v45 - 192), 8);
  _Block_object_dispose(&a45, 8);
  _Block_object_dispose((const void *)(v45 - 256), 8);
  _Unwind_Resume(a1);
}

void sub_1D1DF7544(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51)
{
  _Block_object_dispose((const void *)(v51 - 176), 8);
  _Block_object_dispose(&a51, 8);
  _Block_object_dispose((const void *)(v51 - 240), 8);
  _Unwind_Resume(a1);
}

void sub_1D1DF8A88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_1D1E02124(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1E049CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1E0548C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1E06438(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1D1E06644(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__60764(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4malloc_zone_pressure_relief(0, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4malloc_zone_pressure_relief(0, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__60765(uint64_t a1)
{
}

void sub_1D1E0783C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1E0791C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1E079F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1E07DD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v6 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1D1E0865C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v6 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1D1E08AF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v8 - 88), 8);
  _Unwind_Resume(a1);
}

void sub_1D1E09318(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1E131A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1D1E13F2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose((const void *)(v27 - 144), 8);
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1D1E1458C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49)
{
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose(&a41, 8);
  _Block_object_dispose(&a45, 8);
  _Block_object_dispose(&a49, 8);
  _Block_object_dispose((const void *)(v49 - 240), 8);
  _Unwind_Resume(a1);
}

void sub_1D1E15B00(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 208), 8);
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1D1E16800(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1D1E179D0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 208), 8);
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1D1E18F50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a61, 8);
  _Block_object_dispose(&a65, 8);
  _Unwind_Resume(a1);
}

void __tombstonedLocalIdentifiersFrom_block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 localIdentifier];
  [*(id *)(a1 + 32) addObject:v3];
}

id momentChangesForLocalIdentifiers(void *a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  uint64_t v7 = a3;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v9 = [v5 count];
  if (v7 && v9)
  {
    id v21 = v6;
    uint64_t v10 = [v6 librarySpecificFetchOptions];
    [v10 setPersonContext:1];
    [v10 setIncludedDetectionTypes:&unk_1F28D48F0];
    uint64_t v11 = v7[2](v7, v5, v10);
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v23 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          uint64_t v17 = [PGGraphMomentChange alloc];
          uint64_t v18 = [v16 uuid];
          unint64_t v19 = [(PGGraphMomentChange *)v17 initWithMomentUUID:v18 updateTypes:8];

          [v8 addObject:v19];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v13);
    }

    id v6 = v21;
  }

  return v8;
}

void sub_1D1E1C280(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1E1DEB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose(&a18, 8);
  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose((const void *)(v37 - 208), 8);
  _Block_object_dispose((const void *)(v37 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_1D1E243DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1E27048(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1E27268(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1E27B48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1E27DC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1E294D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&STACK[0x2D0], 8);
  _Block_object_dispose(&a71, 8);
  _Block_object_dispose(&STACK[0x210], 8);
  _Unwind_Resume(a1);
}

void sub_1D1E29A4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1E2ABBC(_Unwind_Exception *a1)
{
}

void sub_1D1E2B2C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

void sub_1D1E2C864(_Unwind_Exception *a1)
{
}

void sub_1D1E2DB3C(_Unwind_Exception *a1)
{
}

void sub_1D1E2EABC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 224), 8);
  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_1D1E30210(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__63969(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4malloc_zone_pressure_relief(0, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4malloc_zone_pressure_relief(0, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__63970(uint64_t a1)
{
}

void sub_1D1E3147C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_1D1E35850(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__64389(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4malloc_zone_pressure_relief(0, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4malloc_zone_pressure_relief(0, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__64390(uint64_t a1)
{
}

void sub_1D1E36CA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__64467(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4malloc_zone_pressure_relief(0, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4malloc_zone_pressure_relief(0, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__64468(uint64_t a1)
{
}

void sub_1D1E38018(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

uint64_t __Block_byref_object_copy__64720(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4malloc_zone_pressure_relief(0, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4malloc_zone_pressure_relief(0, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__64721(uint64_t a1)
{
}

void sub_1D1E3AA80(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D1E3B650(_Unwind_Exception *a1)
{
}

void sub_1D1E3E164(_Unwind_Exception *a1)
{
}

void sub_1D1E3ED84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44)
{
}

void sub_1D1E41454(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  _Block_object_dispose((const void *)(v41 - 208), 8);
  _Block_object_dispose(&a41, 8);
  _Unwind_Resume(a1);
}

void sub_1D1E41E84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va1, a13);
  va_start(va, a13);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1D1E431E0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 224), 8);
  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_1D1E439F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1D1E47DC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61)
{
}

void sub_1D1E49220(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1E4B1E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a71, 8);
  _Unwind_Resume(a1);
}

__CFString *PGGraphDataModelEnrichmentContextAsString(unint64_t a1)
{
  if (a1 > 3) {
    return @"Unknown Enrichment Context";
  }
  else {
    return off_1E68EEE88[a1];
  }
}

void sub_1D1E4E608(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
  _Block_object_dispose(&a63, 8);
  _Block_object_dispose(&a69, 8);
  _Block_object_dispose(&STACK[0x260], 8);
  _Block_object_dispose(&STACK[0x290], 8);
  _Block_object_dispose(&STACK[0x2C0], 8);
  _Block_object_dispose(&STACK[0x2E0], 8);
  _Block_object_dispose(&STACK[0x300], 8);
  _Block_object_dispose(&STACK[0x320], 8);
  _Block_object_dispose(&STACK[0x340], 8);
  _Block_object_dispose(&STACK[0x360], 8);
  _Block_object_dispose(&STACK[0x380], 8);
  _Block_object_dispose(&STACK[0x3A0], 8);
  _Block_object_dispose(&STACK[0x3C0], 8);
  _Block_object_dispose(&STACK[0x3E0], 8);
  _Block_object_dispose(&STACK[0x400], 8);
  _Block_object_dispose(&STACK[0x420], 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__66680(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4malloc_zone_pressure_relief(0, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4malloc_zone_pressure_relief(0, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__66681(uint64_t a1)
{
}

void sub_1D1E52E28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__67168(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4malloc_zone_pressure_relief(0, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4malloc_zone_pressure_relief(0, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__67169(uint64_t a1)
{
}

void sub_1D1E55DC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59)
{
}

void sub_1D1E5797C(_Unwind_Exception *a1)
{
}

void sub_1D1E59598(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1E5977C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1E5995C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1E60B4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__68249(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4malloc_zone_pressure_relief(0, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4malloc_zone_pressure_relief(0, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__68250(uint64_t a1)
{
}

void sub_1D1E61F0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose((const void *)(v27 - 160), 8);
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1D1E65028(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_1D1E66108(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23)
{
}

void sub_1D1E684E0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 224), 8);
  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_1D1E6986C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a28, 8);
  _Block_object_dispose((const void *)(v28 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1D1E6A9EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__69020(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4malloc_zone_pressure_relief(0, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4malloc_zone_pressure_relief(0, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__69021(uint64_t a1)
{
}

uint64_t shouldLocationRemoveParenthesesForCountryCode(void *a1)
{
  id v1 = a1;
  if (([v1 isEqualToString:@"CN"] & 1) != 0
    || ([v1 isEqualToString:@"TW"] & 1) != 0
    || ([v1 isEqualToString:@"MO"] & 1) != 0)
  {
    uint64_t v2 = 0;
  }
  else
  {
    uint64_t v2 = [v1 isEqualToString:@"HK"] ^ 1;
  }

  return v2;
}

void sub_1D1E6BF08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
}

void sub_1D1E6CEB8(_Unwind_Exception *a1)
{
}

void sub_1D1E71314(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a67, 8);
  _Unwind_Resume(a1);
}

void sub_1D1E72034(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1E72A74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
}

void sub_1D1E72CB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1E73FAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1E740C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1E75E08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
}

uint64_t __Block_byref_object_copy__69598(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4malloc_zone_pressure_relief(0, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4malloc_zone_pressure_relief(0, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__69599(uint64_t a1)
{
}

void sub_1D1E76E4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__69969(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4malloc_zone_pressure_relief(0, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4malloc_zone_pressure_relief(0, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__69970(uint64_t a1)
{
}

void sub_1D1E7757C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

void sub_1D1E7840C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1E789DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose((const void *)(v29 - 160), 8);
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void sub_1D1E80F98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__71000(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4malloc_zone_pressure_relief(0, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4malloc_zone_pressure_relief(0, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__71001(uint64_t a1)
{
}

void sub_1D1E816EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_1D1E820D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
}

void sub_1D1E83A90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__71063(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4malloc_zone_pressure_relief(0, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4malloc_zone_pressure_relief(0, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__71064(uint64_t a1)
{
}

void sub_1D1E84084(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
}

void sub_1D1E84208(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1E845F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_1D1E84920(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
}

void sub_1D1E86E2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

void sub_1D1E87714(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44,uint64_t a45,uint64_t a46,uint64_t a47,char a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53)
{
  _Block_object_dispose(&a44, 8);
  _Block_object_dispose(&a48, 8);
  _Block_object_dispose((const void *)(v53 - 192), 8);
  _Block_object_dispose(&a53, 8);
  _Block_object_dispose((const void *)(v53 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1D1E8858C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v33 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1D1E88F84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose((const void *)(v33 - 160), 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a33, 8);
  _Unwind_Resume(a1);
}

void sub_1D1E8A718(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a69, 8);
  _Block_object_dispose(&STACK[0x200], 8);
  _Unwind_Resume(a1);
}

void sub_1D1E8B668(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_1D1E8C69C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61)
{
}

void sub_1D1E8E47C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D1E8E6AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1E8EA5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1E92D30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__72187(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4malloc_zone_pressure_relief(0, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4malloc_zone_pressure_relief(0, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__72188(uint64_t a1)
{
}

void sub_1D1E935E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1E93E44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1E94B40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_1D1E95648(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a67, 8);
  _Unwind_Resume(a1);
}

void sub_1D1E97A48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_1D1E98094(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_1D1E98A10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose((const void *)(v17 - 176), 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1E99558(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1E9C29C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__72429(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4malloc_zone_pressure_relief(0, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4malloc_zone_pressure_relief(0, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__72430(uint64_t a1)
{
}

void sub_1D1E9EA30(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_1D1E9F498(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1D1EA3458(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_1D1EA54B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_1D1EA5CDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

void sub_1D1EA6DA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

void sub_1D1EA76E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1EA7940(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1EA8738(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

void sub_1D1EA96A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

void sub_1D1EAA244(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

void sub_1D1EAB7B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47)
{
}

void sub_1D1EB2208(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_1D1EB25A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose((const void *)(v27 - 128), 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1D1EB2F68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
}

void sub_1D1EB3594(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_1D1EB3B3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1EB48E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v37 - 160), 8);
  _Block_object_dispose(&a37, 8);
  _Unwind_Resume(a1);
}

void sub_1D1EB7AD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__74330(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4malloc_zone_pressure_relief(0, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4malloc_zone_pressure_relief(0, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__74331(uint64_t a1)
{
}

void sub_1D1EB82F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__74450(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4malloc_zone_pressure_relief(0, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4malloc_zone_pressure_relief(0, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__74451(uint64_t a1)
{
}

uint64_t sub_1D1EBC110()
{
  return MEMORY[0x1F40E2D48]();
}

uint64_t sub_1D1EBC120()
{
  return MEMORY[0x1F40E2D60]();
}

uint64_t sub_1D1EBC130()
{
  return MEMORY[0x1F40E2DF0]();
}

uint64_t sub_1D1EBC140()
{
  return MEMORY[0x1F40E2E10]();
}

uint64_t sub_1D1EBC150()
{
  return MEMORY[0x1F40E2E98]();
}

uint64_t sub_1D1EBC160()
{
  return MEMORY[0x1F40E2EA8]();
}

uint64_t sub_1D1EBC170()
{
  return MEMORY[0x1F40E2EE8]();
}

uint64_t sub_1D1EBC180()
{
  return MEMORY[0x1F40E2F00]();
}

uint64_t sub_1D1EBC190()
{
  return MEMORY[0x1F40E2F60]();
}

uint64_t sub_1D1EBC1A0()
{
  return MEMORY[0x1F40E3000]();
}

uint64_t sub_1D1EBC1B0()
{
  return MEMORY[0x1F40E3008]();
}

uint64_t sub_1D1EBC1C0()
{
  return MEMORY[0x1F40E3018]();
}

uint64_t sub_1D1EBC1D0()
{
  return MEMORY[0x1F40E3020]();
}

uint64_t sub_1D1EBC1E0()
{
  return MEMORY[0x1F40E3038]();
}

uint64_t sub_1D1EBC1F0()
{
  return MEMORY[0x1F40E3060]();
}

uint64_t sub_1D1EBC200()
{
  return MEMORY[0x1F40E3070]();
}

uint64_t sub_1D1EBC210()
{
  return MEMORY[0x1F40E30E0]();
}

uint64_t sub_1D1EBC220()
{
  return MEMORY[0x1F40E30F8]();
}

uint64_t sub_1D1EBC230()
{
  return MEMORY[0x1F40E3128]();
}

uint64_t sub_1D1EBC240()
{
  return MEMORY[0x1F40E3150]();
}

uint64_t sub_1D1EBC250()
{
  return MEMORY[0x1F40E3160]();
}

uint64_t sub_1D1EBC260()
{
  return MEMORY[0x1F40E3368]();
}

uint64_t sub_1D1EBC270()
{
  return MEMORY[0x1F40E3420]();
}

uint64_t sub_1D1EBC280()
{
  return MEMORY[0x1F40E3470]();
}

uint64_t sub_1D1EBC290()
{
  return MEMORY[0x1F40E3480]();
}

uint64_t sub_1D1EBC2A0()
{
  return MEMORY[0x1F40E34A0]();
}

uint64_t sub_1D1EBC2B0()
{
  return MEMORY[0x1F40E34C0]();
}

uint64_t sub_1D1EBC2C0()
{
  return MEMORY[0x1F40E34D0]();
}

uint64_t sub_1D1EBC2D0()
{
  return MEMORY[0x1F40E34E8]();
}

uint64_t sub_1D1EBC2E0()
{
  return MEMORY[0x1F40E34F0]();
}

uint64_t sub_1D1EBC2F0()
{
  return MEMORY[0x1F40E34F8]();
}

uint64_t sub_1D1EBC300()
{
  return MEMORY[0x1F40E3508]();
}

uint64_t sub_1D1EBC310()
{
  return MEMORY[0x1F40E3518]();
}

uint64_t sub_1D1EBC320()
{
  return MEMORY[0x1F40E3530]();
}

uint64_t sub_1D1EBC330()
{
  return MEMORY[0x1F40E35B0]();
}

uint64_t sub_1D1EBC340()
{
  return MEMORY[0x1F40E35D8]();
}

uint64_t sub_1D1EBC350()
{
  return MEMORY[0x1F40E3600]();
}

uint64_t sub_1D1EBC360()
{
  return MEMORY[0x1F40E3618]();
}

uint64_t sub_1D1EBC370()
{
  return MEMORY[0x1F40E3620]();
}

uint64_t sub_1D1EBC380()
{
  return MEMORY[0x1F40E3670]();
}

uint64_t sub_1D1EBC390()
{
  return MEMORY[0x1F40E36D8]();
}

uint64_t sub_1D1EBC3A0()
{
  return MEMORY[0x1F40E36F8]();
}

uint64_t sub_1D1EBC3B0()
{
  return MEMORY[0x1F40E3718]();
}

uint64_t sub_1D1EBC3C0()
{
  return MEMORY[0x1F40E3760]();
}

uint64_t sub_1D1EBC3D0()
{
  return MEMORY[0x1F40E37A8]();
}

uint64_t sub_1D1EBC3E0()
{
  return MEMORY[0x1F40E37B8]();
}

uint64_t sub_1D1EBC3F0()
{
  return MEMORY[0x1F40E37D0]();
}

uint64_t sub_1D1EBC400()
{
  return MEMORY[0x1F40E37E0]();
}

uint64_t sub_1D1EBC410()
{
  return MEMORY[0x1F40E3800]();
}

uint64_t sub_1D1EBC420()
{
  return MEMORY[0x1F40E3818]();
}

uint64_t sub_1D1EBC430()
{
  return MEMORY[0x1F40E3830]();
}

uint64_t sub_1D1EBC440()
{
  return MEMORY[0x1F40E38E8]();
}

uint64_t sub_1D1EBC450()
{
  return MEMORY[0x1F40E38F8]();
}

uint64_t sub_1D1EBC460()
{
  return MEMORY[0x1F40E3948]();
}

uint64_t sub_1D1EBC470()
{
  return MEMORY[0x1F40E3958]();
}

uint64_t sub_1D1EBC480()
{
  return MEMORY[0x1F40E3970]();
}

uint64_t sub_1D1EBC490()
{
  return MEMORY[0x1F40E3978]();
}

uint64_t sub_1D1EBC4A0()
{
  return MEMORY[0x1F40E3988]();
}

uint64_t sub_1D1EBC4B0()
{
  return MEMORY[0x1F40E39B0]();
}

uint64_t sub_1D1EBC4C0()
{
  return MEMORY[0x1F40E39B8]();
}

uint64_t sub_1D1EBC4D0()
{
  return MEMORY[0x1F40E39F8]();
}

uint64_t sub_1D1EBC4E0()
{
  return MEMORY[0x1F40E3A10]();
}

uint64_t sub_1D1EBC4F0()
{
  return MEMORY[0x1F40E3A50]();
}

uint64_t sub_1D1EBC500()
{
  return MEMORY[0x1F40E3A58]();
}

uint64_t sub_1D1EBC510()
{
  return MEMORY[0x1F40E3A90]();
}

uint64_t sub_1D1EBC520()
{
  return MEMORY[0x1F40E3A98]();
}

uint64_t sub_1D1EBC530()
{
  return MEMORY[0x1F40E3AB0]();
}

uint64_t sub_1D1EBC540()
{
  return MEMORY[0x1F40E3AC0]();
}

uint64_t sub_1D1EBC550()
{
  return MEMORY[0x1F40E3F78]();
}

uint64_t sub_1D1EBC560()
{
  return MEMORY[0x1F40E4008]();
}

uint64_t sub_1D1EBC570()
{
  return MEMORY[0x1F40E4138]();
}

uint64_t sub_1D1EBC580()
{
  return MEMORY[0x1F40E41E0]();
}

uint64_t sub_1D1EBC590()
{
  return MEMORY[0x1F40E4210]();
}

uint64_t sub_1D1EBC5A0()
{
  return MEMORY[0x1F40E4220]();
}

uint64_t sub_1D1EBC5B0()
{
  return MEMORY[0x1F40E4228]();
}

uint64_t sub_1D1EBC5C0()
{
  return MEMORY[0x1F40E4240]();
}

uint64_t sub_1D1EBC5D0()
{
  return MEMORY[0x1F40E4260]();
}

uint64_t sub_1D1EBC5E0()
{
  return MEMORY[0x1F40E4270]();
}

uint64_t sub_1D1EBC5F0()
{
  return MEMORY[0x1F40E4540]();
}

uint64_t sub_1D1EBC600()
{
  return MEMORY[0x1F40E4550]();
}

uint64_t sub_1D1EBC610()
{
  return MEMORY[0x1F40E46D0]();
}

uint64_t sub_1D1EBC620()
{
  return MEMORY[0x1F40E48D8]();
}

uint64_t sub_1D1EBC630()
{
  return MEMORY[0x1F40E48F8]();
}

uint64_t sub_1D1EBC640()
{
  return MEMORY[0x1F40E4918]();
}

uint64_t sub_1D1EBC650()
{
  return MEMORY[0x1F40E4930]();
}

uint64_t sub_1D1EBC660()
{
  return MEMORY[0x1F40E4938]();
}

uint64_t sub_1D1EBC670()
{
  return MEMORY[0x1F40E4970]();
}

uint64_t sub_1D1EBC680()
{
  return MEMORY[0x1F40E49A0]();
}

uint64_t sub_1D1EBC690()
{
  return MEMORY[0x1F40E49D0]();
}

uint64_t sub_1D1EBC6A0()
{
  return MEMORY[0x1F40E49E8]();
}

uint64_t sub_1D1EBC6B0()
{
  return MEMORY[0x1F40E49F8]();
}

uint64_t sub_1D1EBC6C0()
{
  return MEMORY[0x1F40E4A70]();
}

uint64_t sub_1D1EBC6D0()
{
  return MEMORY[0x1F40E4AA8]();
}

uint64_t sub_1D1EBC6E0()
{
  return MEMORY[0x1F40E4AC0]();
}

uint64_t sub_1D1EBC6F0()
{
  return MEMORY[0x1F40E4B68]();
}

uint64_t sub_1D1EBC700()
{
  return MEMORY[0x1F40E4B80]();
}

uint64_t sub_1D1EBC710()
{
  return MEMORY[0x1F40E4BE0]();
}

uint64_t sub_1D1EBC720()
{
  return MEMORY[0x1F40E4C78]();
}

uint64_t sub_1D1EBC730()
{
  return MEMORY[0x1F40E4C80]();
}

uint64_t sub_1D1EBC740()
{
  return MEMORY[0x1F40E4CD8]();
}

uint64_t sub_1D1EBC750()
{
  return MEMORY[0x1F40E4CF8]();
}

uint64_t sub_1D1EBC760()
{
  return MEMORY[0x1F40E4D38]();
}

uint64_t sub_1D1EBC770()
{
  return MEMORY[0x1F40E4D48]();
}

uint64_t sub_1D1EBC780()
{
  return MEMORY[0x1F40E4D58]();
}

uint64_t sub_1D1EBC790()
{
  return MEMORY[0x1F40E4DA8]();
}

uint64_t sub_1D1EBC7A0()
{
  return MEMORY[0x1F40E4E10]();
}

uint64_t sub_1D1EBC7B0()
{
  return MEMORY[0x1F40E4E30]();
}

uint64_t sub_1D1EBC7C0()
{
  return MEMORY[0x1F40E5078]();
}

uint64_t sub_1D1EBC7D0()
{
  return MEMORY[0x1F40E5088]();
}

uint64_t sub_1D1EBC7E0()
{
  return MEMORY[0x1F40E5098]();
}

uint64_t sub_1D1EBC7F0()
{
  return MEMORY[0x1F40E50A8]();
}

uint64_t sub_1D1EBC800()
{
  return MEMORY[0x1F40E50C8]();
}

uint64_t sub_1D1EBC810()
{
  return MEMORY[0x1F40E50E0]();
}

uint64_t sub_1D1EBC820()
{
  return MEMORY[0x1F40E5158]();
}

uint64_t sub_1D1EBC830()
{
  return MEMORY[0x1F40E5188]();
}

uint64_t sub_1D1EBC840()
{
  return MEMORY[0x1F40E5198]();
}

uint64_t sub_1D1EBC850()
{
  return MEMORY[0x1F40E51A8]();
}

uint64_t sub_1D1EBC860()
{
  return MEMORY[0x1F40E51D0]();
}

uint64_t sub_1D1EBC870()
{
  return MEMORY[0x1F40E51D8]();
}

uint64_t sub_1D1EBC880()
{
  return MEMORY[0x1F40E51F0]();
}

uint64_t sub_1D1EBC890()
{
  return MEMORY[0x1F40E52A0]();
}

uint64_t sub_1D1EBC8A0()
{
  return MEMORY[0x1F40E52B0]();
}

uint64_t sub_1D1EBC8B0()
{
  return MEMORY[0x1F40E52C0]();
}

uint64_t sub_1D1EBC8C0()
{
  return MEMORY[0x1F40E52E0]();
}

uint64_t sub_1D1EBC8D0()
{
  return MEMORY[0x1F40E52F0]();
}

uint64_t sub_1D1EBC8E0()
{
  return MEMORY[0x1F40E5320]();
}

uint64_t sub_1D1EBC8F0()
{
  return MEMORY[0x1F40E5338]();
}

uint64_t sub_1D1EBC900()
{
  return MEMORY[0x1F40E5378]();
}

uint64_t sub_1D1EBC910()
{
  return MEMORY[0x1F40E5388]();
}

uint64_t sub_1D1EBC920()
{
  return MEMORY[0x1F40E53B0]();
}

uint64_t sub_1D1EBC930()
{
  return MEMORY[0x1F40E53F8]();
}

uint64_t sub_1D1EBC940()
{
  return MEMORY[0x1F40E5438]();
}

uint64_t sub_1D1EBC950()
{
  return MEMORY[0x1F40E5448]();
}

uint64_t sub_1D1EBC960()
{
  return MEMORY[0x1F40E5500]();
}

uint64_t sub_1D1EBC970()
{
  return MEMORY[0x1F40E5510]();
}

uint64_t sub_1D1EBC980()
{
  return MEMORY[0x1F40E5540]();
}

uint64_t sub_1D1EBC990()
{
  return MEMORY[0x1F40E5578]();
}

uint64_t sub_1D1EBC9A0()
{
  return MEMORY[0x1F40E55D0]();
}

uint64_t sub_1D1EBC9B0()
{
  return MEMORY[0x1F40E5648]();
}

uint64_t sub_1D1EBC9C0()
{
  return MEMORY[0x1F40E5698]();
}

uint64_t sub_1D1EBC9D0()
{
  return MEMORY[0x1F40E56B0]();
}

uint64_t sub_1D1EBC9E0()
{
  return MEMORY[0x1F40E56C8]();
}

uint64_t sub_1D1EBC9F0()
{
  return MEMORY[0x1F40E5718]();
}

uint64_t sub_1D1EBCA00()
{
  return MEMORY[0x1F40E5728]();
}

uint64_t sub_1D1EBCA10()
{
  return MEMORY[0x1F40E57F8]();
}

uint64_t sub_1D1EBCA20()
{
  return MEMORY[0x1F40E5840]();
}

uint64_t sub_1D1EBCA30()
{
  return MEMORY[0x1F40E5868]();
}

uint64_t sub_1D1EBCA40()
{
  return MEMORY[0x1F40E5890]();
}

uint64_t sub_1D1EBCA50()
{
  return MEMORY[0x1F40E58A8]();
}

uint64_t sub_1D1EBCA60()
{
  return MEMORY[0x1F40E58B0]();
}

uint64_t sub_1D1EBCA70()
{
  return MEMORY[0x1F40E58C8]();
}

uint64_t sub_1D1EBCA80()
{
  return MEMORY[0x1F40E58D0]();
}

uint64_t sub_1D1EBCA90()
{
  return MEMORY[0x1F40E58F0]();
}

uint64_t sub_1D1EBCAA0()
{
  return MEMORY[0x1F40E58F8]();
}

uint64_t sub_1D1EBCAB0()
{
  return MEMORY[0x1F40E5938]();
}

uint64_t sub_1D1EBCAC0()
{
  return MEMORY[0x1F40E5950]();
}

uint64_t sub_1D1EBCAD0()
{
  return MEMORY[0x1F40E5960]();
}

uint64_t sub_1D1EBCAE0()
{
  return MEMORY[0x1F40E5978]();
}

uint64_t sub_1D1EBCAF0()
{
  return MEMORY[0x1F40E59A0]();
}

uint64_t sub_1D1EBCB00()
{
  return MEMORY[0x1F40E59B0]();
}

uint64_t sub_1D1EBCB10()
{
  return MEMORY[0x1F4140AB0]();
}

uint64_t sub_1D1EBCB20()
{
  return MEMORY[0x1F4140AB8]();
}

uint64_t sub_1D1EBCB30()
{
  return MEMORY[0x1F4140AC0]();
}

uint64_t sub_1D1EBCB40()
{
  return MEMORY[0x1F4140AC8]();
}

uint64_t sub_1D1EBCB50()
{
  return MEMORY[0x1F40E59D0]();
}

uint64_t sub_1D1EBCB60()
{
  return MEMORY[0x1F40E59E0]();
}

uint64_t sub_1D1EBCB70()
{
  return MEMORY[0x1F40E59F8]();
}

uint64_t sub_1D1EBCB80()
{
  return MEMORY[0x1F40E5A18]();
}

uint64_t sub_1D1EBCB90()
{
  return MEMORY[0x1F40E5A30]();
}

uint64_t sub_1D1EBCBA0()
{
  return MEMORY[0x1F40E5A40]();
}

uint64_t sub_1D1EBCBB0()
{
  return MEMORY[0x1F40E5A48]();
}

uint64_t sub_1D1EBCBC0()
{
  return MEMORY[0x1F40E5A58]();
}

uint64_t sub_1D1EBCBD0()
{
  return MEMORY[0x1F40E5AA0]();
}

uint64_t sub_1D1EBCBE0()
{
  return MEMORY[0x1F40E5AB8]();
}

uint64_t sub_1D1EBCBF0()
{
  return MEMORY[0x1F40E5AE0]();
}

uint64_t sub_1D1EBCC00()
{
  return MEMORY[0x1F40E5AF0]();
}

uint64_t sub_1D1EBCC10()
{
  return MEMORY[0x1F40E5B00]();
}

uint64_t sub_1D1EBCC20()
{
  return MEMORY[0x1F40E5B18]();
}

uint64_t sub_1D1EBCC30()
{
  return MEMORY[0x1F40E5CC0]();
}

uint64_t sub_1D1EBCC40()
{
  return MEMORY[0x1F40E5CF8]();
}

uint64_t sub_1D1EBCC50()
{
  return MEMORY[0x1F40E5D08]();
}

uint64_t sub_1D1EBCC60()
{
  return MEMORY[0x1F40E5D20]();
}

uint64_t sub_1D1EBCC70()
{
  return MEMORY[0x1F40E5D28]();
}

uint64_t sub_1D1EBCC80()
{
  return MEMORY[0x1F40E5D50]();
}

uint64_t sub_1D1EBCC90()
{
  return MEMORY[0x1F40E5D70]();
}

uint64_t sub_1D1EBCCA0()
{
  return MEMORY[0x1F4119150]();
}

uint64_t sub_1D1EBCCC0()
{
  return MEMORY[0x1F4186968]();
}

uint64_t sub_1D1EBCCD0()
{
  return MEMORY[0x1F4186978]();
}

uint64_t sub_1D1EBCCE0()
{
  return MEMORY[0x1F4129E58]();
}

uint64_t sub_1D1EBCCF0()
{
  return MEMORY[0x1F4129E60]();
}

uint64_t sub_1D1EBCD10()
{
  return MEMORY[0x1F4129E70]();
}

uint64_t sub_1D1EBCD40()
{
  return MEMORY[0x1F4129E88]();
}

uint64_t sub_1D1EBCD50()
{
  return MEMORY[0x1F4129E90]();
}

uint64_t sub_1D1EBCD60()
{
  return MEMORY[0x1F4129E98]();
}

uint64_t sub_1D1EBCD70()
{
  return MEMORY[0x1F4129EA0]();
}

uint64_t sub_1D1EBCD80()
{
  return MEMORY[0x1F4129EA8]();
}

uint64_t sub_1D1EBCD90()
{
  return MEMORY[0x1F4129EB0]();
}

uint64_t sub_1D1EBCDA0()
{
  return MEMORY[0x1F4129EB8]();
}

uint64_t sub_1D1EBCDB0()
{
  return MEMORY[0x1F4129EC0]();
}

uint64_t sub_1D1EBCDC0()
{
  return MEMORY[0x1F4129EC8]();
}

uint64_t sub_1D1EBCDD0()
{
  return MEMORY[0x1F4129ED0]();
}

uint64_t sub_1D1EBCDE0()
{
  return MEMORY[0x1F4129ED8]();
}

uint64_t sub_1D1EBCDF0()
{
  return MEMORY[0x1F4129EE0]();
}

uint64_t sub_1D1EBCE00()
{
  return MEMORY[0x1F4129EE8]();
}

uint64_t sub_1D1EBCE10()
{
  return MEMORY[0x1F4129EF0]();
}

uint64_t sub_1D1EBCE20()
{
  return MEMORY[0x1F4129EF8]();
}

uint64_t sub_1D1EBCE30()
{
  return MEMORY[0x1F4129F00]();
}

uint64_t sub_1D1EBCE40()
{
  return MEMORY[0x1F4129F08]();
}

uint64_t sub_1D1EBCE50()
{
  return MEMORY[0x1F4129F10]();
}

uint64_t sub_1D1EBCE60()
{
  return MEMORY[0x1F4129F18]();
}

uint64_t sub_1D1EBCE70()
{
  return MEMORY[0x1F4129F20]();
}

uint64_t sub_1D1EBCE80()
{
  return MEMORY[0x1F4129F28]();
}

uint64_t sub_1D1EBCE90()
{
  return MEMORY[0x1F4129F30]();
}

uint64_t sub_1D1EBCEA0()
{
  return MEMORY[0x1F4129F38]();
}

uint64_t sub_1D1EBCEB0()
{
  return MEMORY[0x1F4129F40]();
}

uint64_t sub_1D1EBCEC0()
{
  return MEMORY[0x1F4129F48]();
}

uint64_t sub_1D1EBCED0()
{
  return MEMORY[0x1F4129F50]();
}

uint64_t sub_1D1EBCEE0()
{
  return MEMORY[0x1F4129F58]();
}

uint64_t sub_1D1EBCEF0()
{
  return MEMORY[0x1F4129F60]();
}

uint64_t sub_1D1EBCF00()
{
  return MEMORY[0x1F4129F68]();
}

uint64_t sub_1D1EBCF10()
{
  return MEMORY[0x1F4129F70]();
}

uint64_t sub_1D1EBCF20()
{
  return MEMORY[0x1F4129F78]();
}

uint64_t sub_1D1EBCF30()
{
  return MEMORY[0x1F4129F80]();
}

uint64_t sub_1D1EBCF40()
{
  return MEMORY[0x1F4129F88]();
}

uint64_t sub_1D1EBCF50()
{
  return MEMORY[0x1F4129F90]();
}

uint64_t sub_1D1EBCF60()
{
  return MEMORY[0x1F4129F98]();
}

uint64_t sub_1D1EBCF70()
{
  return MEMORY[0x1F4129FA0]();
}

uint64_t sub_1D1EBCF80()
{
  return MEMORY[0x1F4129FA8]();
}

uint64_t sub_1D1EBCF90()
{
  return MEMORY[0x1F4129FB0]();
}

uint64_t sub_1D1EBCFA0()
{
  return MEMORY[0x1F4129FB8]();
}

uint64_t sub_1D1EBCFB0()
{
  return MEMORY[0x1F4140AF8]();
}

uint64_t sub_1D1EBCFC0()
{
  return MEMORY[0x1F4140B18]();
}

uint64_t sub_1D1EBCFD0()
{
  return MEMORY[0x1F4140B20]();
}

uint64_t sub_1D1EBCFE0()
{
  return MEMORY[0x1F4140B28]();
}

uint64_t sub_1D1EBCFF0()
{
  return MEMORY[0x1F4140B38]();
}

uint64_t sub_1D1EBD000()
{
  return MEMORY[0x1F4140B40]();
}

uint64_t sub_1D1EBD010()
{
  return MEMORY[0x1F4140B48]();
}

uint64_t sub_1D1EBD020()
{
  return MEMORY[0x1F4140B70]();
}

uint64_t sub_1D1EBD030()
{
  return MEMORY[0x1F4140B88]();
}

uint64_t sub_1D1EBD040()
{
  return MEMORY[0x1F4140B90]();
}

uint64_t sub_1D1EBD050()
{
  return MEMORY[0x1F4140B98]();
}

uint64_t sub_1D1EBD060()
{
  return MEMORY[0x1F4140BA0]();
}

uint64_t sub_1D1EBD070()
{
  return MEMORY[0x1F4140BA8]();
}

uint64_t sub_1D1EBD080()
{
  return MEMORY[0x1F4140BB0]();
}

uint64_t sub_1D1EBD090()
{
  return MEMORY[0x1F4140BB8]();
}

uint64_t sub_1D1EBD0A0()
{
  return MEMORY[0x1F4140BC0]();
}

uint64_t sub_1D1EBD0B0()
{
  return MEMORY[0x1F4140BC8]();
}

uint64_t sub_1D1EBD0C0()
{
  return MEMORY[0x1F4140BD0]();
}

uint64_t sub_1D1EBD0D0()
{
  return MEMORY[0x1F4140BD8]();
}

uint64_t sub_1D1EBD0E0()
{
  return MEMORY[0x1F4140BE0]();
}

uint64_t sub_1D1EBD0F0()
{
  return MEMORY[0x1F4140BE8]();
}

uint64_t sub_1D1EBD100()
{
  return MEMORY[0x1F4140BF0]();
}

uint64_t sub_1D1EBD110()
{
  return MEMORY[0x1F4140BF8]();
}

uint64_t sub_1D1EBD120()
{
  return MEMORY[0x1F4140C00]();
}

uint64_t sub_1D1EBD130()
{
  return MEMORY[0x1F4140C60]();
}

uint64_t sub_1D1EBD140()
{
  return MEMORY[0x1F4140C70]();
}

uint64_t sub_1D1EBD150()
{
  return MEMORY[0x1F4140D18]();
}

uint64_t sub_1D1EBD160()
{
  return MEMORY[0x1F4140D20]();
}

uint64_t sub_1D1EBD170()
{
  return MEMORY[0x1F4140D28]();
}

uint64_t sub_1D1EBD180()
{
  return MEMORY[0x1F4140D38]();
}

uint64_t sub_1D1EBD190()
{
  return MEMORY[0x1F4140D48]();
}

uint64_t sub_1D1EBD1A0()
{
  return MEMORY[0x1F4140D58]();
}

uint64_t sub_1D1EBD1B0()
{
  return MEMORY[0x1F4140D60]();
}

uint64_t sub_1D1EBD1C0()
{
  return MEMORY[0x1F4140D68]();
}

uint64_t sub_1D1EBD1D0()
{
  return MEMORY[0x1F4140D70]();
}

uint64_t sub_1D1EBD1E0()
{
  return MEMORY[0x1F4140D78]();
}

uint64_t sub_1D1EBD1F0()
{
  return MEMORY[0x1F4140D88]();
}

uint64_t sub_1D1EBD200()
{
  return MEMORY[0x1F4140DA8]();
}

uint64_t sub_1D1EBD210()
{
  return MEMORY[0x1F4140DB0]();
}

uint64_t sub_1D1EBD220()
{
  return MEMORY[0x1F4140DE0]();
}

uint64_t sub_1D1EBD230()
{
  return MEMORY[0x1F4140E28]();
}

uint64_t sub_1D1EBD240()
{
  return MEMORY[0x1F4140E30]();
}

uint64_t sub_1D1EBD250()
{
  return MEMORY[0x1F4140E38]();
}

uint64_t sub_1D1EBD260()
{
  return MEMORY[0x1F4140E40]();
}

uint64_t sub_1D1EBD270()
{
  return MEMORY[0x1F4140E48]();
}

uint64_t sub_1D1EBD280()
{
  return MEMORY[0x1F4140ED0]();
}

uint64_t sub_1D1EBD290()
{
  return MEMORY[0x1F4140ED8]();
}

uint64_t sub_1D1EBD2A0()
{
  return MEMORY[0x1F4140EE0]();
}

uint64_t sub_1D1EBD2B0()
{
  return MEMORY[0x1F4140F08]();
}

uint64_t sub_1D1EBD2C0()
{
  return MEMORY[0x1F4140F10]();
}

uint64_t sub_1D1EBD2D0()
{
  return MEMORY[0x1F4140FC0]();
}

uint64_t sub_1D1EBD2E0()
{
  return MEMORY[0x1F4140FC8]();
}

uint64_t sub_1D1EBD2F0()
{
  return MEMORY[0x1F4140FD0]();
}

uint64_t sub_1D1EBD300()
{
  return MEMORY[0x1F4140FE0]();
}

uint64_t sub_1D1EBD310()
{
  return MEMORY[0x1F4140FF0]();
}

uint64_t sub_1D1EBD320()
{
  return MEMORY[0x1F4140FF8]();
}

uint64_t sub_1D1EBD330()
{
  return MEMORY[0x1F4141010]();
}

uint64_t sub_1D1EBD340()
{
  return MEMORY[0x1F4141018]();
}

uint64_t sub_1D1EBD350()
{
  return MEMORY[0x1F4141020]();
}

uint64_t sub_1D1EBD360()
{
  return MEMORY[0x1F4141060]();
}

uint64_t sub_1D1EBD370()
{
  return MEMORY[0x1F4141068]();
}

uint64_t sub_1D1EBD380()
{
  return MEMORY[0x1F41410E0]();
}

uint64_t sub_1D1EBD390()
{
  return MEMORY[0x1F41410E8]();
}

uint64_t sub_1D1EBD3A0()
{
  return MEMORY[0x1F41410F0]();
}

uint64_t sub_1D1EBD3B0()
{
  return MEMORY[0x1F41410F8]();
}

uint64_t sub_1D1EBD3C0()
{
  return MEMORY[0x1F4141100]();
}

uint64_t sub_1D1EBD3D0()
{
  return MEMORY[0x1F4141108]();
}

uint64_t sub_1D1EBD3E0()
{
  return MEMORY[0x1F4141110]();
}

uint64_t sub_1D1EBD3F0()
{
  return MEMORY[0x1F4141118]();
}

uint64_t sub_1D1EBD400()
{
  return MEMORY[0x1F4141120]();
}

uint64_t sub_1D1EBD410()
{
  return MEMORY[0x1F4141138]();
}

uint64_t sub_1D1EBD420()
{
  return MEMORY[0x1F4141140]();
}

uint64_t sub_1D1EBD430()
{
  return MEMORY[0x1F4141148]();
}

uint64_t sub_1D1EBD440()
{
  return MEMORY[0x1F4141158]();
}

uint64_t sub_1D1EBD450()
{
  return MEMORY[0x1F4141160]();
}

uint64_t sub_1D1EBD460()
{
  return MEMORY[0x1F4141168]();
}

uint64_t sub_1D1EBD470()
{
  return MEMORY[0x1F4141180]();
}

uint64_t sub_1D1EBD480()
{
  return MEMORY[0x1F4141188]();
}

uint64_t sub_1D1EBD490()
{
  return MEMORY[0x1F4141190]();
}

uint64_t sub_1D1EBD4A0()
{
  return MEMORY[0x1F4141198]();
}

uint64_t sub_1D1EBD4B0()
{
  return MEMORY[0x1F41411A0]();
}

uint64_t sub_1D1EBD4C0()
{
  return MEMORY[0x1F41411B0]();
}

uint64_t sub_1D1EBD4D0()
{
  return MEMORY[0x1F41411C0]();
}

uint64_t sub_1D1EBD4E0()
{
  return MEMORY[0x1F41411C8]();
}

uint64_t sub_1D1EBD4F0()
{
  return MEMORY[0x1F41411D0]();
}

uint64_t sub_1D1EBD500()
{
  return MEMORY[0x1F4141200]();
}

uint64_t sub_1D1EBD510()
{
  return MEMORY[0x1F4141208]();
}

uint64_t sub_1D1EBD520()
{
  return MEMORY[0x1F4141210]();
}

uint64_t sub_1D1EBD530()
{
  return MEMORY[0x1F4141218]();
}

uint64_t sub_1D1EBD540()
{
  return MEMORY[0x1F4141220]();
}

uint64_t sub_1D1EBD550()
{
  return MEMORY[0x1F4141228]();
}

uint64_t sub_1D1EBD560()
{
  return MEMORY[0x1F4141230]();
}

uint64_t sub_1D1EBD570()
{
  return MEMORY[0x1F4141238]();
}

uint64_t sub_1D1EBD580()
{
  return MEMORY[0x1F4141240]();
}

uint64_t sub_1D1EBD590()
{
  return MEMORY[0x1F4141248]();
}

uint64_t sub_1D1EBD5A0()
{
  return MEMORY[0x1F4141270]();
}

uint64_t sub_1D1EBD5B0()
{
  return MEMORY[0x1F4141278]();
}

uint64_t sub_1D1EBD5C0()
{
  return MEMORY[0x1F41412F0]();
}

uint64_t sub_1D1EBD5D0()
{
  return MEMORY[0x1F41412F8]();
}

uint64_t sub_1D1EBD5E0()
{
  return MEMORY[0x1F4141300]();
}

uint64_t sub_1D1EBD5F0()
{
  return MEMORY[0x1F4141308]();
}

uint64_t sub_1D1EBD600()
{
  return MEMORY[0x1F4141318]();
}

uint64_t sub_1D1EBD610()
{
  return MEMORY[0x1F4141338]();
}

uint64_t sub_1D1EBD620()
{
  return MEMORY[0x1F4141358]();
}

uint64_t sub_1D1EBD630()
{
  return MEMORY[0x1F4141388]();
}

uint64_t sub_1D1EBD640()
{
  return MEMORY[0x1F4141390]();
}

uint64_t sub_1D1EBD650()
{
  return MEMORY[0x1F4141398]();
}

uint64_t sub_1D1EBD660()
{
  return MEMORY[0x1F41413A0]();
}

uint64_t sub_1D1EBD670()
{
  return MEMORY[0x1F41413C8]();
}

uint64_t sub_1D1EBD680()
{
  return MEMORY[0x1F41413D0]();
}

uint64_t sub_1D1EBD690()
{
  return MEMORY[0x1F4141420]();
}

uint64_t sub_1D1EBD6A0()
{
  return MEMORY[0x1F4141438]();
}

uint64_t sub_1D1EBD6B0()
{
  return MEMORY[0x1F4141470]();
}

uint64_t sub_1D1EBD6C0()
{
  return MEMORY[0x1F4141480]();
}

uint64_t sub_1D1EBD6D0()
{
  return MEMORY[0x1F4141488]();
}

uint64_t sub_1D1EBD6E0()
{
  return MEMORY[0x1F41414D0]();
}

uint64_t sub_1D1EBD6F0()
{
  return MEMORY[0x1F41414D8]();
}

uint64_t sub_1D1EBD700()
{
  return MEMORY[0x1F41414F0]();
}

uint64_t sub_1D1EBD710()
{
  return MEMORY[0x1F41414F8]();
}

uint64_t sub_1D1EBD720()
{
  return MEMORY[0x1F4141500]();
}

uint64_t sub_1D1EBD730()
{
  return MEMORY[0x1F4141570]();
}

uint64_t sub_1D1EBD740()
{
  return MEMORY[0x1F4141580]();
}

uint64_t sub_1D1EBD750()
{
  return MEMORY[0x1F4141590]();
}

uint64_t sub_1D1EBD760()
{
  return MEMORY[0x1F41415C0]();
}

uint64_t sub_1D1EBD770()
{
  return MEMORY[0x1F4141608]();
}

uint64_t sub_1D1EBD780()
{
  return MEMORY[0x1F4141610]();
}

uint64_t sub_1D1EBD790()
{
  return MEMORY[0x1F41416D8]();
}

uint64_t sub_1D1EBD7A0()
{
  return MEMORY[0x1F41416E0]();
}

uint64_t sub_1D1EBD7B0()
{
  return MEMORY[0x1F4141738]();
}

uint64_t sub_1D1EBD7C0()
{
  return MEMORY[0x1F4141740]();
}

uint64_t sub_1D1EBD7D0()
{
  return MEMORY[0x1F4141878]();
}

uint64_t sub_1D1EBD7E0()
{
  return MEMORY[0x1F4141880]();
}

uint64_t sub_1D1EBD7F0()
{
  return MEMORY[0x1F4141888]();
}

uint64_t sub_1D1EBD800()
{
  return MEMORY[0x1F4141890]();
}

uint64_t sub_1D1EBD810()
{
  return MEMORY[0x1F4141908]();
}

uint64_t sub_1D1EBD820()
{
  return MEMORY[0x1F4141910]();
}

uint64_t sub_1D1EBD830()
{
  return MEMORY[0x1F4141918]();
}

uint64_t sub_1D1EBD840()
{
  return MEMORY[0x1F4141920]();
}

uint64_t sub_1D1EBD860()
{
  return MEMORY[0x1F4141A38]();
}

uint64_t sub_1D1EBD870()
{
  return MEMORY[0x1F4141A98]();
}

uint64_t sub_1D1EBD880()
{
  return MEMORY[0x1F4141AA0]();
}

uint64_t sub_1D1EBD890()
{
  return MEMORY[0x1F4141AA8]();
}

uint64_t sub_1D1EBD8A0()
{
  return MEMORY[0x1F4141AB0]();
}

uint64_t sub_1D1EBD8B0()
{
  return MEMORY[0x1F4141B08]();
}

uint64_t sub_1D1EBD8C0()
{
  return MEMORY[0x1F4141B18]();
}

uint64_t sub_1D1EBD8D0()
{
  return MEMORY[0x1F4141B20]();
}

uint64_t sub_1D1EBD8E0()
{
  return MEMORY[0x1F4141B28]();
}

uint64_t sub_1D1EBD8F0()
{
  return MEMORY[0x1F4141B38]();
}

uint64_t sub_1D1EBD900()
{
  return MEMORY[0x1F4141B78]();
}

uint64_t sub_1D1EBD910()
{
  return MEMORY[0x1F4141BB0]();
}

uint64_t sub_1D1EBD920()
{
  return MEMORY[0x1F4141BB8]();
}

uint64_t sub_1D1EBD930()
{
  return MEMORY[0x1F4141BF0]();
}

uint64_t sub_1D1EBD940()
{
  return MEMORY[0x1F4141BF8]();
}

uint64_t sub_1D1EBD950()
{
  return MEMORY[0x1F4141C00]();
}

uint64_t sub_1D1EBD960()
{
  return MEMORY[0x1F4141C08]();
}

uint64_t sub_1D1EBD970()
{
  return MEMORY[0x1F4141C10]();
}

uint64_t sub_1D1EBD980()
{
  return MEMORY[0x1F4141C18]();
}

uint64_t sub_1D1EBD990()
{
  return MEMORY[0x1F4141C20]();
}

uint64_t sub_1D1EBD9A0()
{
  return MEMORY[0x1F4141C28]();
}

uint64_t sub_1D1EBD9B0()
{
  return MEMORY[0x1F4125958]();
}

uint64_t sub_1D1EBD9C0()
{
  return MEMORY[0x1F41259F8]();
}

uint64_t sub_1D1EBD9D0()
{
  return MEMORY[0x1F4125A20]();
}

uint64_t sub_1D1EBD9E0()
{
  return MEMORY[0x1F41263F0]();
}

uint64_t sub_1D1EBD9F0()
{
  return MEMORY[0x1F4126430]();
}

uint64_t sub_1D1EBDA00()
{
  return MEMORY[0x1F41265F8]();
}

uint64_t sub_1D1EBDA10()
{
  return MEMORY[0x1F4126600]();
}

uint64_t sub_1D1EBDA20()
{
  return MEMORY[0x1F4126608]();
}

uint64_t sub_1D1EBDA30()
{
  return MEMORY[0x1F4126950]();
}

uint64_t sub_1D1EBDA40()
{
  return MEMORY[0x1F4126958]();
}

uint64_t sub_1D1EBDA50()
{
  return MEMORY[0x1F4126998]();
}

uint64_t sub_1D1EBDA60()
{
  return MEMORY[0x1F41269A0]();
}

uint64_t sub_1D1EBDA70()
{
  return MEMORY[0x1F41269A8]();
}

uint64_t sub_1D1EBDA80()
{
  return MEMORY[0x1F41269B0]();
}

uint64_t sub_1D1EBDA90()
{
  return MEMORY[0x1F41269B8]();
}

uint64_t sub_1D1EBDAA0()
{
  return MEMORY[0x1F4141CB0]();
}

uint64_t sub_1D1EBDAB0()
{
  return MEMORY[0x1F4141CB8]();
}

uint64_t sub_1D1EBDAC0()
{
  return MEMORY[0x1F4141CC0]();
}

uint64_t sub_1D1EBDAD0()
{
  return MEMORY[0x1F4141CC8]();
}

uint64_t sub_1D1EBDAE0()
{
  return MEMORY[0x1F4188500]();
}

uint64_t sub_1D1EBDAF0()
{
  return MEMORY[0x1F4188510]();
}

uint64_t sub_1D1EBDB00()
{
  return MEMORY[0x1F4188568]();
}

uint64_t sub_1D1EBDB10()
{
  return MEMORY[0x1F4188570]();
}

uint64_t sub_1D1EBDB20()
{
  return MEMORY[0x1F4188578]();
}

uint64_t sub_1D1EBDB30()
{
  return MEMORY[0x1F4188580]();
}

uint64_t sub_1D1EBDB40()
{
  return MEMORY[0x1F41885B0]();
}

uint64_t sub_1D1EBDB50()
{
  return MEMORY[0x1F41885D0]();
}

uint64_t sub_1D1EBDB60()
{
  return MEMORY[0x1F41885E0]();
}

uint64_t sub_1D1EBDB70()
{
  return MEMORY[0x1F4188650]();
}

uint64_t sub_1D1EBDB80()
{
  return MEMORY[0x1F4188658]();
}

uint64_t sub_1D1EBDB90()
{
  return MEMORY[0x1F4188660]();
}

uint64_t sub_1D1EBDBA0()
{
  return MEMORY[0x1F4188668]();
}

uint64_t sub_1D1EBDBB0()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_1D1EBDBC0()
{
  return MEMORY[0x1F4188680]();
}

uint64_t sub_1D1EBDBD0()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_1D1EBDBE0()
{
  return MEMORY[0x1F41886B0]();
}

uint64_t sub_1D1EBDBF0()
{
  return MEMORY[0x1F4186C60]();
}

uint64_t sub_1D1EBDC00()
{
  return MEMORY[0x1F4186CB0]();
}

uint64_t sub_1D1EBDC10()
{
  return MEMORY[0x1F4186CE8]();
}

uint64_t sub_1D1EBDC20()
{
  return MEMORY[0x1F4186CF8]();
}

uint64_t sub_1D1EBDC30()
{
  return MEMORY[0x1F4186D08]();
}

uint64_t sub_1D1EBDC40()
{
  return MEMORY[0x1F4186D60]();
}

uint64_t sub_1D1EBDC50()
{
  return MEMORY[0x1F4186E28]();
}

uint64_t sub_1D1EBDC60()
{
  return MEMORY[0x1F4186E38]();
}

uint64_t sub_1D1EBDC70()
{
  return MEMORY[0x1F4186E60]();
}

uint64_t sub_1D1EBDC80()
{
  return MEMORY[0x1F4186F08]();
}

uint64_t sub_1D1EBDC90()
{
  return MEMORY[0x1F4183270]();
}

uint64_t sub_1D1EBDCA0()
{
  return MEMORY[0x1F4183280]();
}

uint64_t sub_1D1EBDCC0()
{
  return MEMORY[0x1F40E6000]();
}

uint64_t sub_1D1EBDCD0()
{
  return MEMORY[0x1F40E6018]();
}

uint64_t sub_1D1EBDCE0()
{
  return MEMORY[0x1F40E6030]();
}

uint64_t sub_1D1EBDCF0()
{
  return MEMORY[0x1F4183318]();
}

uint64_t sub_1D1EBDD00()
{
  return MEMORY[0x1F4183358]();
}

uint64_t sub_1D1EBDD10()
{
  return MEMORY[0x1F4183398]();
}

uint64_t sub_1D1EBDD20()
{
  return MEMORY[0x1F4183408]();
}

uint64_t sub_1D1EBDD30()
{
  return MEMORY[0x1F41834A8]();
}

uint64_t sub_1D1EBDD40()
{
  return MEMORY[0x1F41834C8]();
}

uint64_t sub_1D1EBDD50()
{
  return MEMORY[0x1F41834E8]();
}

uint64_t sub_1D1EBDD60()
{
  return MEMORY[0x1F41834F8]();
}

uint64_t sub_1D1EBDD70()
{
  return MEMORY[0x1F4183500]();
}

uint64_t sub_1D1EBDD80()
{
  return MEMORY[0x1F41835B0]();
}

uint64_t sub_1D1EBDD90()
{
  return MEMORY[0x1F41835C0]();
}

uint64_t sub_1D1EBDDA0()
{
  return MEMORY[0x1F41835C8]();
}

uint64_t sub_1D1EBDDB0()
{
  return MEMORY[0x1F4183678]();
}

uint64_t sub_1D1EBDDC0()
{
  return MEMORY[0x1F4188420]();
}

uint64_t sub_1D1EBDDD0()
{
  return MEMORY[0x1F41836E0]();
}

uint64_t sub_1D1EBDDE0()
{
  return MEMORY[0x1F4183730]();
}

uint64_t sub_1D1EBDDF0()
{
  return MEMORY[0x1F4183740]();
}

uint64_t sub_1D1EBDE00()
{
  return MEMORY[0x1F4183748]();
}

uint64_t sub_1D1EBDE10()
{
  return MEMORY[0x1F4183750]();
}

uint64_t sub_1D1EBDE20()
{
  return MEMORY[0x1F4183838]();
}

uint64_t sub_1D1EBDE30()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1D1EBDE40()
{
  return MEMORY[0x1F40E61B8]();
}

uint64_t sub_1D1EBDE50()
{
  return MEMORY[0x1F40E61C8]();
}

uint64_t sub_1D1EBDE60()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1D1EBDE70()
{
  return MEMORY[0x1F40E61E8]();
}

uint64_t sub_1D1EBDE80()
{
  return MEMORY[0x1F40E61F8]();
}

uint64_t sub_1D1EBDE90()
{
  return MEMORY[0x1F40E6228]();
}

uint64_t sub_1D1EBDEA0()
{
  return MEMORY[0x1F40E6238]();
}

uint64_t sub_1D1EBDEB0()
{
  return MEMORY[0x1F40E6268]();
}

uint64_t sub_1D1EBDEC0()
{
  return MEMORY[0x1F40E62A0]();
}

uint64_t sub_1D1EBDED0()
{
  return MEMORY[0x1F4183880]();
}

uint64_t sub_1D1EBDEE0()
{
  return MEMORY[0x1F4183898]();
}

uint64_t sub_1D1EBDEF0()
{
  return MEMORY[0x1F41838A0]();
}

uint64_t sub_1D1EBDF00()
{
  return MEMORY[0x1F41838B8]();
}

uint64_t sub_1D1EBDF10()
{
  return MEMORY[0x1F41838D8]();
}

uint64_t sub_1D1EBDF20()
{
  return MEMORY[0x1F4183908]();
}

uint64_t sub_1D1EBDF30()
{
  return MEMORY[0x1F4183958]();
}

uint64_t sub_1D1EBDF40()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1D1EBDF50()
{
  return MEMORY[0x1F41839F0]();
}

uint64_t sub_1D1EBDF60()
{
  return MEMORY[0x1F41839F8]();
}

uint64_t sub_1D1EBDF70()
{
  return MEMORY[0x1F4183A08]();
}

uint64_t sub_1D1EBDF80()
{
  return MEMORY[0x1F4183A28]();
}

uint64_t sub_1D1EBDF90()
{
  return MEMORY[0x1F4183A30]();
}

uint64_t sub_1D1EBDFA0()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1D1EBDFB0()
{
  return MEMORY[0x1F4183A60]();
}

uint64_t sub_1D1EBDFC0()
{
  return MEMORY[0x1F4183A78]();
}

uint64_t sub_1D1EBDFD0()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_1D1EBDFE0()
{
  return MEMORY[0x1F4183A88]();
}

uint64_t sub_1D1EBDFF0()
{
  return MEMORY[0x1F4183AA0]();
}

uint64_t sub_1D1EBE010()
{
  return MEMORY[0x1F4183AB0]();
}

uint64_t sub_1D1EBE020()
{
  return MEMORY[0x1F4183B10]();
}

uint64_t sub_1D1EBE030()
{
  return MEMORY[0x1F4183B30]();
}

uint64_t sub_1D1EBE040()
{
  return MEMORY[0x1F4183B38]();
}

uint64_t sub_1D1EBE050()
{
  return MEMORY[0x1F4183B50]();
}

uint64_t sub_1D1EBE060()
{
  return MEMORY[0x1F4183B58]();
}

uint64_t sub_1D1EBE070()
{
  return MEMORY[0x1F4183B88]();
}

uint64_t sub_1D1EBE080()
{
  return MEMORY[0x1F4183B90]();
}

uint64_t sub_1D1EBE090()
{
  return MEMORY[0x1F4183BA0]();
}

uint64_t sub_1D1EBE0A0()
{
  return MEMORY[0x1F4183BE8]();
}

uint64_t sub_1D1EBE0B0()
{
  return MEMORY[0x1F4183BF0]();
}

uint64_t sub_1D1EBE0C0()
{
  return MEMORY[0x1F4183C18]();
}

uint64_t sub_1D1EBE0D0()
{
  return MEMORY[0x1F4183C60]();
}

uint64_t sub_1D1EBE0E0()
{
  return MEMORY[0x1F4183C70]();
}

uint64_t sub_1D1EBE0F0()
{
  return MEMORY[0x1F4183C98]();
}

uint64_t sub_1D1EBE100()
{
  return MEMORY[0x1F4183CE0]();
}

uint64_t sub_1D1EBE110()
{
  return MEMORY[0x1F4183CE8]();
}

uint64_t sub_1D1EBE120()
{
  return MEMORY[0x1F4183CF0]();
}

uint64_t sub_1D1EBE130()
{
  return MEMORY[0x1F4183D80]();
}

uint64_t sub_1D1EBE140()
{
  return MEMORY[0x1F4183D98]();
}

uint64_t sub_1D1EBE150()
{
  return MEMORY[0x1F4183E10]();
}

uint64_t sub_1D1EBE180()
{
  return MEMORY[0x1F4183E80]();
}

uint64_t sub_1D1EBE190()
{
  return MEMORY[0x1F40E6338]();
}

uint64_t sub_1D1EBE1A0()
{
  return MEMORY[0x1F40E6360]();
}

uint64_t sub_1D1EBE1B0()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t sub_1D1EBE1C0()
{
  return MEMORY[0x1F4183E90]();
}

uint64_t sub_1D1EBE1D0()
{
  return MEMORY[0x1F4183E98]();
}

uint64_t sub_1D1EBE1E0()
{
  return MEMORY[0x1F4183EA0]();
}

uint64_t sub_1D1EBE1F0()
{
  return MEMORY[0x1F4183EA8]();
}

uint64_t sub_1D1EBE200()
{
  return MEMORY[0x1F4183EC8]();
}

uint64_t sub_1D1EBE210()
{
  return MEMORY[0x1F4183ED8]();
}

uint64_t sub_1D1EBE220()
{
  return MEMORY[0x1F4183EE8]();
}

uint64_t sub_1D1EBE230()
{
  return MEMORY[0x1F4183EF0]();
}

uint64_t sub_1D1EBE240()
{
  return MEMORY[0x1F4183F08]();
}

uint64_t sub_1D1EBE250()
{
  return MEMORY[0x1F4183F18]();
}

uint64_t sub_1D1EBE260()
{
  return MEMORY[0x1F4183F38]();
}

uint64_t sub_1D1EBE270()
{
  return MEMORY[0x1F4183F40]();
}

uint64_t sub_1D1EBE280()
{
  return MEMORY[0x1F4183F60]();
}

uint64_t sub_1D1EBE290()
{
  return MEMORY[0x1F4183F70]();
}

uint64_t sub_1D1EBE2A0()
{
  return MEMORY[0x1F4183F78]();
}

uint64_t sub_1D1EBE2B0()
{
  return MEMORY[0x1F4183FA8]();
}

uint64_t sub_1D1EBE2C0()
{
  return MEMORY[0x1F4183FD8]();
}

uint64_t sub_1D1EBE2D0()
{
  return MEMORY[0x1F4183FE0]();
}

uint64_t sub_1D1EBE2E0()
{
  return MEMORY[0x1F4183FF0]();
}

uint64_t sub_1D1EBE2F0()
{
  return MEMORY[0x1F40E6388]();
}

uint64_t sub_1D1EBE300()
{
  return MEMORY[0x1F4187BF0]();
}

uint64_t sub_1D1EBE310()
{
  return MEMORY[0x1F4187C00]();
}

uint64_t sub_1D1EBE320()
{
  return MEMORY[0x1F4187C08]();
}

uint64_t sub_1D1EBE330()
{
  return MEMORY[0x1F4187C18]();
}

uint64_t sub_1D1EBE340()
{
  return MEMORY[0x1F4187CF8]();
}

uint64_t sub_1D1EBE350()
{
  return MEMORY[0x1F4187D00]();
}

uint64_t sub_1D1EBE360()
{
  return MEMORY[0x1F4187E28]();
}

uint64_t sub_1D1EBE380()
{
  return MEMORY[0x1F40E63C8]();
}

uint64_t sub_1D1EBE390()
{
  return MEMORY[0x1F4184008]();
}

uint64_t sub_1D1EBE3A0()
{
  return MEMORY[0x1F4141C38]();
}

uint64_t sub_1D1EBE3B0()
{
  return MEMORY[0x1F4141C48]();
}

uint64_t sub_1D1EBE3C0()
{
  return MEMORY[0x1F4141C60]();
}

uint64_t sub_1D1EBE3D0()
{
  return MEMORY[0x1F4184048]();
}

uint64_t sub_1D1EBE3E0()
{
  return MEMORY[0x1F40E63F0]();
}

uint64_t sub_1D1EBE3F0()
{
  return MEMORY[0x1F4184098]();
}

uint64_t sub_1D1EBE400()
{
  return MEMORY[0x1F41840C0]();
}

uint64_t sub_1D1EBE410()
{
  return MEMORY[0x1F41840D0]();
}

uint64_t sub_1D1EBE420()
{
  return MEMORY[0x1F40E6430]();
}

uint64_t sub_1D1EBE430()
{
  return MEMORY[0x1F40E6458]();
}

uint64_t sub_1D1EBE440()
{
  return MEMORY[0x1F4184100]();
}

uint64_t sub_1D1EBE450()
{
  return MEMORY[0x1F4184128]();
}

uint64_t sub_1D1EBE460()
{
  return MEMORY[0x1F4184138]();
}

uint64_t sub_1D1EBE470()
{
  return MEMORY[0x1F4184178]();
}

uint64_t sub_1D1EBE480()
{
  return MEMORY[0x1F4184188]();
}

uint64_t sub_1D1EBE490()
{
  return MEMORY[0x1F41841D0]();
}

uint64_t sub_1D1EBE4A0()
{
  return MEMORY[0x1F4184218]();
}

uint64_t sub_1D1EBE4B0()
{
  return MEMORY[0x1F4184230]();
}

uint64_t sub_1D1EBE4C0()
{
  return MEMORY[0x1F4184250]();
}

uint64_t sub_1D1EBE4D0()
{
  return MEMORY[0x1F40E6478]();
}

uint64_t sub_1D1EBE4E0()
{
  return MEMORY[0x1F41842D0]();
}

uint64_t sub_1D1EBE4F0()
{
  return MEMORY[0x1F41842F8]();
}

uint64_t sub_1D1EBE500()
{
  return MEMORY[0x1F4184338]();
}

uint64_t sub_1D1EBE510()
{
  return MEMORY[0x1F4184398]();
}

uint64_t sub_1D1EBE520()
{
  return MEMORY[0x1F41843C0]();
}

uint64_t sub_1D1EBE530()
{
  return MEMORY[0x1F4184440]();
}

uint64_t sub_1D1EBE540()
{
  return MEMORY[0x1F4129FC0]();
}

uint64_t sub_1D1EBE550()
{
  return MEMORY[0x1F4129FC8]();
}

uint64_t sub_1D1EBE560()
{
  return MEMORY[0x1F4129FD0]();
}

uint64_t sub_1D1EBE570()
{
  return MEMORY[0x1F4129FD8]();
}

uint64_t sub_1D1EBE580()
{
  return MEMORY[0x1F40E6508]();
}

uint64_t sub_1D1EBE590()
{
  return MEMORY[0x1F40E6590]();
}

uint64_t sub_1D1EBE5A0()
{
  return MEMORY[0x1F40E6598]();
}

uint64_t sub_1D1EBE5B0()
{
  return MEMORY[0x1F40E65B8]();
}

uint64_t sub_1D1EBE5C0()
{
  return MEMORY[0x1F4141C88]();
}

uint64_t sub_1D1EBE5D0()
{
  return MEMORY[0x1F40E6628]();
}

uint64_t sub_1D1EBE5E0()
{
  return MEMORY[0x1F41886C0]();
}

uint64_t sub_1D1EBE5F0()
{
  return MEMORY[0x1F41886D0]();
}

uint64_t sub_1D1EBE600()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_1D1EBE610()
{
  return MEMORY[0x1F4188700]();
}

uint64_t sub_1D1EBE620()
{
  return MEMORY[0x1F40E66C8]();
}

uint64_t sub_1D1EBE630()
{
  return MEMORY[0x1F4186F90]();
}

uint64_t sub_1D1EBE640()
{
  return MEMORY[0x1F4186FA0]();
}

uint64_t sub_1D1EBE650()
{
  return MEMORY[0x1F4186FD8]();
}

uint64_t sub_1D1EBE660()
{
  return MEMORY[0x1F41870A0]();
}

uint64_t sub_1D1EBE670()
{
  return MEMORY[0x1F41870E0]();
}

uint64_t sub_1D1EBE680()
{
  return MEMORY[0x1F4187100]();
}

uint64_t sub_1D1EBE690()
{
  return MEMORY[0x1F4129FE0]();
}

uint64_t sub_1D1EBE6A0()
{
  return MEMORY[0x1F4129FE8]();
}

uint64_t sub_1D1EBE6B0()
{
  return MEMORY[0x1F4129FF0]();
}

uint64_t sub_1D1EBE6C0()
{
  return MEMORY[0x1F4129FF8]();
}

uint64_t sub_1D1EBE6D0()
{
  return MEMORY[0x1F412A000]();
}

uint64_t sub_1D1EBE6E0()
{
  return MEMORY[0x1F412A008]();
}

uint64_t sub_1D1EBE6F0()
{
  return MEMORY[0x1F412A010]();
}

uint64_t sub_1D1EBE700()
{
  return MEMORY[0x1F412A018]();
}

uint64_t sub_1D1EBE710()
{
  return MEMORY[0x1F412A020]();
}

uint64_t sub_1D1EBE720()
{
  return MEMORY[0x1F412A028]();
}

uint64_t sub_1D1EBE730()
{
  return MEMORY[0x1F412A030]();
}

uint64_t sub_1D1EBE740()
{
  return MEMORY[0x1F412A038]();
}

uint64_t sub_1D1EBE750()
{
  return MEMORY[0x1F4188708]();
}

uint64_t sub_1D1EBE760()
{
  return MEMORY[0x1F4188710]();
}

uint64_t sub_1D1EBE770()
{
  return MEMORY[0x1F412A040]();
}

uint64_t sub_1D1EBE780()
{
  return MEMORY[0x1F412A048]();
}

uint64_t sub_1D1EBE790()
{
  return MEMORY[0x1F412A050]();
}

uint64_t sub_1D1EBE7A0()
{
  return MEMORY[0x1F4187278]();
}

uint64_t sub_1D1EBE7B0()
{
  return MEMORY[0x1F4187288]();
}

uint64_t sub_1D1EBE7C0()
{
  return MEMORY[0x1F40D7060]();
}

uint64_t sub_1D1EBE7D0()
{
  return MEMORY[0x1F40D7078]();
}

uint64_t sub_1D1EBE7E0()
{
  return MEMORY[0x1F40E67E8]();
}

uint64_t sub_1D1EBE7F0()
{
  return MEMORY[0x1F40E68E8]();
}

uint64_t sub_1D1EBE800()
{
  return MEMORY[0x1F40E68F8]();
}

uint64_t sub_1D1EBE810()
{
  return MEMORY[0x1F40E6910]();
}

uint64_t sub_1D1EBE820()
{
  return MEMORY[0x1F41874A8]();
}

uint64_t sub_1D1EBE830()
{
  return MEMORY[0x1F41874C0]();
}

uint64_t sub_1D1EBE840()
{
  return MEMORY[0x1F41874D0]();
}

uint64_t sub_1D1EBE850()
{
  return MEMORY[0x1F4188720]();
}

uint64_t sub_1D1EBE860()
{
  return MEMORY[0x1F4188728]();
}

uint64_t sub_1D1EBE870()
{
  return MEMORY[0x1F4188758]();
}

uint64_t sub_1D1EBE880()
{
  return MEMORY[0x1F4184638]();
}

uint64_t sub_1D1EBE890()
{
  return MEMORY[0x1F4184640]();
}

uint64_t sub_1D1EBE8A0()
{
  return MEMORY[0x1F4184770]();
}

uint64_t sub_1D1EBE8B0()
{
  return MEMORY[0x1F41847A0]();
}

uint64_t sub_1D1EBE8C0()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_1D1EBE8D0()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_1D1EBE8E0()
{
  return MEMORY[0x1F40E6BB0]();
}

uint64_t sub_1D1EBE8F0()
{
  return MEMORY[0x1F40E6BF0]();
}

uint64_t sub_1D1EBE900()
{
  return MEMORY[0x1F40E6C68]();
}

uint64_t sub_1D1EBE910()
{
  return MEMORY[0x1F40E6C80]();
}

uint64_t sub_1D1EBE920()
{
  return MEMORY[0x1F40E6D28]();
}

uint64_t sub_1D1EBE930()
{
  return MEMORY[0x1F40E6D40]();
}

uint64_t sub_1D1EBE940()
{
  return MEMORY[0x1F40E6D88]();
}

uint64_t sub_1D1EBE950()
{
  return MEMORY[0x1F4184978]();
}

uint64_t sub_1D1EBE960()
{
  return MEMORY[0x1F41849B8]();
}

uint64_t sub_1D1EBE970()
{
  return MEMORY[0x1F41849C0]();
}

uint64_t sub_1D1EBE980()
{
  return MEMORY[0x1F41849F8]();
}

uint64_t sub_1D1EBE990()
{
  return MEMORY[0x1F4184A18]();
}

uint64_t sub_1D1EBE9B0()
{
  return MEMORY[0x1F4184B18]();
}

uint64_t sub_1D1EBE9C0()
{
  return MEMORY[0x1F4184B20]();
}

uint64_t sub_1D1EBE9D0()
{
  return MEMORY[0x1F4184B30]();
}

uint64_t sub_1D1EBE9E0()
{
  return MEMORY[0x1F4184B58]();
}

uint64_t sub_1D1EBE9F0()
{
  return MEMORY[0x1F4184B60]();
}

uint64_t sub_1D1EBEA00()
{
  return MEMORY[0x1F4184B68]();
}

uint64_t sub_1D1EBEA10()
{
  return MEMORY[0x1F4184B78]();
}

uint64_t sub_1D1EBEA20()
{
  return MEMORY[0x1F4184B80]();
}

uint64_t sub_1D1EBEA30()
{
  return MEMORY[0x1F4184B88]();
}

uint64_t sub_1D1EBEA40()
{
  return MEMORY[0x1F4184B90]();
}

uint64_t sub_1D1EBEA50()
{
  return MEMORY[0x1F4184BA8]();
}

uint64_t sub_1D1EBEA60()
{
  return MEMORY[0x1F4184BB0]();
}

uint64_t sub_1D1EBEA80()
{
  return MEMORY[0x1F4184BC0]();
}

uint64_t sub_1D1EBEA90()
{
  return MEMORY[0x1F4184BC8]();
}

uint64_t sub_1D1EBEAA0()
{
  return MEMORY[0x1F4184BD0]();
}

uint64_t sub_1D1EBEAB0()
{
  return MEMORY[0x1F4184BD8]();
}

uint64_t sub_1D1EBEAC0()
{
  return MEMORY[0x1F4184C18]();
}

uint64_t sub_1D1EBEAD0()
{
  return MEMORY[0x1F4184C20]();
}

uint64_t sub_1D1EBEAE0()
{
  return MEMORY[0x1F4184C38]();
}

uint64_t sub_1D1EBEAF0()
{
  return MEMORY[0x1F4184C90]();
}

uint64_t sub_1D1EBEB00()
{
  return MEMORY[0x1F4184C98]();
}

uint64_t sub_1D1EBEB10()
{
  return MEMORY[0x1F4184CA0]();
}

uint64_t sub_1D1EBEB20()
{
  return MEMORY[0x1F4184CA8]();
}

uint64_t sub_1D1EBEB30()
{
  return MEMORY[0x1F4184CC0]();
}

uint64_t sub_1D1EBEB40()
{
  return MEMORY[0x1F4184CE8]();
}

uint64_t sub_1D1EBEB50()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_1D1EBEB60()
{
  return MEMORY[0x1F4184D20]();
}

uint64_t sub_1D1EBEB70()
{
  return MEMORY[0x1F4184D70]();
}

uint64_t sub_1D1EBEB80()
{
  return MEMORY[0x1F4184D78]();
}

uint64_t sub_1D1EBEB90()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_1D1EBEBA0()
{
  return MEMORY[0x1F4184D88]();
}

uint64_t sub_1D1EBEBB0()
{
  return MEMORY[0x1F4184DD0]();
}

uint64_t sub_1D1EBEBC0()
{
  return MEMORY[0x1F4184DF0]();
}

uint64_t sub_1D1EBEBD0()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1D1EBEBE0()
{
  return MEMORY[0x1F4184EA8]();
}

uint64_t sub_1D1EBEBF0()
{
  return MEMORY[0x1F4184EC8]();
}

uint64_t sub_1D1EBEC00()
{
  return MEMORY[0x1F4184ED8]();
}

uint64_t sub_1D1EBEC10()
{
  return MEMORY[0x1F4184EE8]();
}

uint64_t sub_1D1EBEC20()
{
  return MEMORY[0x1F4184EF0]();
}

uint64_t sub_1D1EBEC30()
{
  return MEMORY[0x1F4184F28]();
}

uint64_t sub_1D1EBEC40()
{
  return MEMORY[0x1F4184F30]();
}

uint64_t sub_1D1EBEC50()
{
  return MEMORY[0x1F4184F48]();
}

uint64_t sub_1D1EBEC60()
{
  return MEMORY[0x1F4184F68]();
}

uint64_t sub_1D1EBEC70()
{
  return MEMORY[0x1F4184F70]();
}

uint64_t sub_1D1EBEC80()
{
  return MEMORY[0x1F4184F90]();
}

uint64_t sub_1D1EBEC90()
{
  return MEMORY[0x1F4184FF8]();
}

uint64_t sub_1D1EBECA0()
{
  return MEMORY[0x1F4185050]();
}

uint64_t sub_1D1EBECB0()
{
  return MEMORY[0x1F41851A0]();
}

uint64_t sub_1D1EBECC0()
{
  return MEMORY[0x1F41851C8]();
}

uint64_t sub_1D1EBECD0()
{
  return MEMORY[0x1F41851E0]();
}

uint64_t sub_1D1EBECE0()
{
  return MEMORY[0x1F41851F8]();
}

uint64_t sub_1D1EBECF0()
{
  return MEMORY[0x1F4185238]();
}

uint64_t sub_1D1EBED00()
{
  return MEMORY[0x1F4185260]();
}

uint64_t sub_1D1EBED10()
{
  return MEMORY[0x1F4185270]();
}

uint64_t sub_1D1EBED20()
{
  return MEMORY[0x1F4185278]();
}

uint64_t sub_1D1EBED30()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_1D1EBED40()
{
  return MEMORY[0x1F41852A0]();
}

uint64_t sub_1D1EBED50()
{
  return MEMORY[0x1F41852B0]();
}

uint64_t sub_1D1EBED60()
{
  return MEMORY[0x1F41852E8]();
}

uint64_t sub_1D1EBED70()
{
  return MEMORY[0x1F41852F0]();
}

uint64_t sub_1D1EBED80()
{
  return MEMORY[0x1F41852F8]();
}

uint64_t sub_1D1EBED90()
{
  return MEMORY[0x1F4185300]();
}

uint64_t sub_1D1EBEDA0()
{
  return MEMORY[0x1F4185350]();
}

uint64_t sub_1D1EBEDB0()
{
  return MEMORY[0x1F4185358]();
}

uint64_t sub_1D1EBEDC0()
{
  return MEMORY[0x1F4185368]();
}

uint64_t sub_1D1EBEDD0()
{
  return MEMORY[0x1F4185370]();
}

uint64_t sub_1D1EBEDE0()
{
  return MEMORY[0x1F4185378]();
}

uint64_t sub_1D1EBEDF0()
{
  return MEMORY[0x1F4185380]();
}

uint64_t sub_1D1EBEE00()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_1D1EBEE10()
{
  return MEMORY[0x1F41853A8]();
}

uint64_t sub_1D1EBEE30()
{
  return MEMORY[0x1F41854C8]();
}

uint64_t sub_1D1EBEE50()
{
  return MEMORY[0x1F41854F8]();
}

uint64_t sub_1D1EBEE60()
{
  return MEMORY[0x1F4185500]();
}

uint64_t sub_1D1EBEE70()
{
  return MEMORY[0x1F4185508]();
}

uint64_t sub_1D1EBEE80()
{
  return MEMORY[0x1F4185510]();
}

uint64_t sub_1D1EBEE90()
{
  return MEMORY[0x1F4185518]();
}

uint64_t sub_1D1EBEEA0()
{
  return MEMORY[0x1F4185528]();
}

uint64_t sub_1D1EBEEB0()
{
  return MEMORY[0x1F4185568]();
}

uint64_t sub_1D1EBEEC0()
{
  return MEMORY[0x1F4185570]();
}

uint64_t sub_1D1EBEED0()
{
  return MEMORY[0x1F4185578]();
}

uint64_t sub_1D1EBEEE0()
{
  return MEMORY[0x1F4185580]();
}

uint64_t sub_1D1EBEEF0()
{
  return MEMORY[0x1F4185588]();
}

uint64_t sub_1D1EBEF00()
{
  return MEMORY[0x1F4185590]();
}

uint64_t sub_1D1EBEF10()
{
  return MEMORY[0x1F4185598]();
}

uint64_t sub_1D1EBEF20()
{
  return MEMORY[0x1F4185628]();
}

uint64_t sub_1D1EBEF30()
{
  return MEMORY[0x1F4185630]();
}

uint64_t sub_1D1EBEF40()
{
  return MEMORY[0x1F4185638]();
}

uint64_t sub_1D1EBEF50()
{
  return MEMORY[0x1F4185640]();
}

uint64_t sub_1D1EBEF60()
{
  return MEMORY[0x1F4185648]();
}

uint64_t sub_1D1EBEF70()
{
  return MEMORY[0x1F4185658]();
}

uint64_t sub_1D1EBEF80()
{
  return MEMORY[0x1F4185690]();
}

uint64_t sub_1D1EBEF90()
{
  return MEMORY[0x1F4185698]();
}

uint64_t sub_1D1EBEFA0()
{
  return MEMORY[0x1F41856A0]();
}

uint64_t sub_1D1EBEFB0()
{
  return MEMORY[0x1F41856A8]();
}

uint64_t sub_1D1EBEFC0()
{
  return MEMORY[0x1F41856B0]();
}

uint64_t sub_1D1EBEFD0()
{
  return MEMORY[0x1F41856B8]();
}

uint64_t sub_1D1EBEFE0()
{
  return MEMORY[0x1F41856C0]();
}

uint64_t sub_1D1EBEFF0()
{
  return MEMORY[0x1F4185730]();
}

uint64_t sub_1D1EBF000()
{
  return MEMORY[0x1F4185740]();
}

uint64_t sub_1D1EBF010()
{
  return MEMORY[0x1F4185758]();
}

uint64_t sub_1D1EBF030()
{
  return MEMORY[0x1F4185A30]();
}

uint64_t sub_1D1EBF040()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1D1EBF050()
{
  return MEMORY[0x1F4185B90]();
}

uint64_t sub_1D1EBF060()
{
  return MEMORY[0x1F4185B98]();
}

uint64_t sub_1D1EBF070()
{
  return MEMORY[0x1F4185D10]();
}

uint64_t sub_1D1EBF090()
{
  return MEMORY[0x1F4185D40]();
}

uint64_t sub_1D1EBF0A0()
{
  return MEMORY[0x1F4185D68]();
}

uint64_t sub_1D1EBF0B0()
{
  return MEMORY[0x1F4185DD8]();
}

uint64_t sub_1D1EBF0C0()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t sub_1D1EBF0F0()
{
  return MEMORY[0x1F40E6E30]();
}

uint64_t sub_1D1EBF100()
{
  return MEMORY[0x1F4185E00]();
}

uint64_t sub_1D1EBF110()
{
  return MEMORY[0x1F4185E08]();
}

uint64_t sub_1D1EBF120()
{
  return MEMORY[0x1F4185E10]();
}

uint64_t sub_1D1EBF130()
{
  return MEMORY[0x1F4185E18]();
}

uint64_t sub_1D1EBF140()
{
  return MEMORY[0x1F40E6E40]();
}

uint64_t sub_1D1EBF150()
{
  return MEMORY[0x1F4185E90]();
}

uint64_t sub_1D1EBF160()
{
  return MEMORY[0x1F4185EA8]();
}

uint64_t sub_1D1EBF170()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1D1EBF180()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_1D1EBF190()
{
  return MEMORY[0x1F4185ED0]();
}

uint64_t sub_1D1EBF1A0()
{
  return MEMORY[0x1F4185ED8]();
}

uint64_t sub_1D1EBF1B0()
{
  return MEMORY[0x1F4185EE0]();
}

uint64_t sub_1D1EBF1C0()
{
  return MEMORY[0x1F4185EE8]();
}

uint64_t sub_1D1EBF1D0()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t sub_1D1EBF1E0()
{
  return MEMORY[0x1F4185F68]();
}

uint64_t sub_1D1EBF1F0()
{
  return MEMORY[0x1F4185FC8]();
}

uint64_t sub_1D1EBF200()
{
  return MEMORY[0x1F4185FF0]();
}

uint64_t sub_1D1EBF230()
{
  return MEMORY[0x1F4186318]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x1F41138A0]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x1F40F4A90]();
  return result;
}

CCCryptorStatus CCCrypt(CCOperation op, CCAlgorithm alg, CCOptions options, const void *key, size_t keyLength, const void *iv, const void *dataIn, size_t dataInLength, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return MEMORY[0x1F40C94A8](*(void *)&op, *(void *)&alg, *(void *)&options, key, keyLength, iv, dataIn, dataInLength);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

uint64_t CLLocationCoordinate2DGetDistanceFrom()
{
  return MEMORY[0x1F40DB590]();
}

BOOL CLLocationCoordinate2DIsValid(CLLocationCoordinate2D coord)
{
  return MEMORY[0x1F40DB598]((__n128)coord, *(__n128 *)&coord.longitude);
}

CLLocationCoordinate2D CLLocationCoordinate2DMake(CLLocationDegrees latitude, CLLocationDegrees longitude)
{
  MEMORY[0x1F40DB5A0](latitude, longitude);
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

uint64_t CLSCentroidForCoordinates()
{
  return MEMORY[0x1F412DAB0]();
}

uint64_t CLSDeviceIs2GBOrLess()
{
  return MEMORY[0x1F412DAB8]();
}

MKCoordinateRegion MKCoordinateRegionForMapRect(MKMapRect rect)
{
  MEMORY[0x1F40ECE18]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.span.longitudeDelta = v4;
  result.span.latitudeDelta = v3;
  result.center.longitude = v2;
  result.center.latitude = v1;
  return result;
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

uint64_t NSDateComponentsEqualToDateComponents()
{
  return MEMORY[0x1F412DAC0]();
}

const char *__cdecl NSGetSizeAndAlignment(const char *typePtr, NSUInteger *sizep, NSUInteger *alignp)
{
  return (const char *)MEMORY[0x1F40D8B10](typePtr, sizep, alignp);
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x1F40E7140](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

BOOL NSIsEmptyRect(NSRect aRect)
{
  return MEMORY[0x1F40E7160]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E72C8]();
}

NSRange NSUnionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x1F40E72E0](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

uint64_t PFCanAccessLocationWithAuthorizationStatus()
{
  return MEMORY[0x1F4140650]();
}

uint64_t PFDeviceScreenSize()
{
  return MEMORY[0x1F4140678]();
}

uint64_t PFLocalizedStringWithValidatedFormat()
{
  return MEMORY[0x1F413F330]();
}

uint64_t PFOSVariantHasInternalDiagnostics()
{
  return MEMORY[0x1F413F348]();
}

uint64_t PFPosterSettlingEffectGatingStatisticsAnalyticsPayload()
{
  return MEMORY[0x1F4140780]();
}

uint64_t PFSceneTaxonomyNodeIsIndexed()
{
  return MEMORY[0x1F41407C8]();
}

uint64_t PFShuffledArrayWithRandomNumberGenerator()
{
  return MEMORY[0x1F4140828]();
}

uint64_t PFStoryColorGradeCategoryFromValenceArousal()
{
  return MEMORY[0x1F4140830]();
}

uint64_t PFStoryColorGradeCategoryNamed()
{
  return MEMORY[0x1F4140840]();
}

uint64_t PFStoryColorGradeKindDefaultForColorGradeCategory()
{
  return MEMORY[0x1F4140848]();
}

uint64_t PFStringWithValidatedFormat()
{
  return MEMORY[0x1F413F390]();
}

uint64_t PHAssetMediaAnalysisSyndicationProcessingValueDescription()
{
  return MEMORY[0x1F40F4750]();
}

uint64_t PHAssetSyndicationProcessingCurrentVersionForAsset()
{
  return MEMORY[0x1F40F4790]();
}

uint64_t PHDescriptionForSharingFilter()
{
  return MEMORY[0x1F40F47A8]();
}

uint64_t PHMemoryMoodForString()
{
  return MEMORY[0x1F40F47C0]();
}

uint64_t PHMomentDescriptionForProcessedLocationType()
{
  return MEMORY[0x1F40F47D8]();
}

uint64_t PHPhotosHighlightTypeConsideredTrip()
{
  return MEMORY[0x1F40F47E0]();
}

uint64_t PHPhotosHighlightVisibilityStateIsVisibleInMonth()
{
  return MEMORY[0x1F40F47E8]();
}

uint64_t PHShortDescriptionForPhotosHighlightEnrichmentState()
{
  return MEMORY[0x1F40F4800]();
}

uint64_t PHStringForMemoryMood()
{
  return MEMORY[0x1F40F4820]();
}

uint64_t PHSuggestionNotificationStateStringWithNotificationState()
{
  return MEMORY[0x1F40F4830]();
}

uint64_t PHSuggestionStringWithSubtype()
{
  return MEMORY[0x1F40F4840]();
}

uint64_t PHSuggestionStringWithType()
{
  return MEMORY[0x1F40F4848]();
}

uint64_t PLLibraryScopeConditionStringFromCriteria()
{
  return MEMORY[0x1F413F5E0]();
}

uint64_t PLLibraryScopeConditionStringFromType()
{
  return MEMORY[0x1F413F5E8]();
}

uint64_t PLManagedAssetPredicateToFetchAssetsToEvaluateSuggestionsForLibraryScope()
{
  return MEMORY[0x1F413F630]();
}

uint64_t PLMemoriesAlgorithmsVersionFromPhotosGraphVersion()
{
  return MEMORY[0x1F413F640]();
}

uint64_t PLPhotosGraphVersionFromAlgorithmsVersions()
{
  return MEMORY[0x1F413F6B0]();
}

uint64_t PLPhysicalDeviceIsIPad()
{
  return MEMORY[0x1F4140130]();
}

uint64_t PLSearchLocalizedHomeString()
{
  return MEMORY[0x1F413F838]();
}

uint64_t PLSearchSeasonStringsForDate()
{
  return MEMORY[0x1F413F860]();
}

uint64_t PLSearchSocialGroupLookupIdentifier()
{
  return MEMORY[0x1F413F870]();
}

uint64_t PLStoryGetLog()
{
  return MEMORY[0x1F41403E0]();
}

uint64_t TCCAccessCopyInformationForBundleId()
{
  return MEMORY[0x1F415CB90]();
}

uint64_t VCPMAGetRevisionForMediaAnalysisType()
{
  return MEMORY[0x1F412C6A0]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _PFAssertFailHandler()
{
  return MEMORY[0x1F413F3B0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t E5RT::BufferObject::GetDataSpan(E5RT::BufferObject *this)
{
  return MEMORY[0x1F4117D50](this);
}

uint64_t E5RT::MemoryObject::TryAsBuffer(E5RT::MemoryObject *this)
{
  return MEMORY[0x1F4117D58](this);
}

uint64_t E5RT::ExecutionStream::EncodeOperation()
{
  return MEMORY[0x1F4117D88]();
}

uint64_t E5RT::ExecutionStream::ExecuteStreamSync(E5RT::ExecutionStream *this)
{
  return MEMORY[0x1F4117D90](this);
}

uint64_t E5RT::ExecutionStream::CreateExecutionStream(E5RT::ExecutionStream *this)
{
  return MEMORY[0x1F4117D98](this);
}

uint64_t E5RT::GetErrorCodeString()
{
  return MEMORY[0x1F4117DE0]();
}

uint64_t E5RT::ExecutionStreamOperation::CreatePreCompiledComputeOp()
{
  return MEMORY[0x1F4117E20]();
}

uint64_t E5RT::IOPort::GetMemoryObject(E5RT::IOPort *this)
{
  return MEMORY[0x1F4117E38](this);
}

uint64_t E5RT::IOPort::BindMemoryObject()
{
  return MEMORY[0x1F4117E40]();
}

uint64_t E5RT::Status::Status()
{
  return MEMORY[0x1F4117E48]();
}

void E5RT::Status::~Status(E5RT::Status *this)
{
}

uint64_t E5RT::TensorDescriptor::AllocateMemory()
{
  return MEMORY[0x1F4117F30]();
}

uint64_t E5RT::TensorDescriptor::GetTensorShape(E5RT::TensorDescriptor *this)
{
  return MEMORY[0x1F4117F40](this);
}

uint64_t E5RT::OperandDescriptor::TensorDescriptor(E5RT::OperandDescriptor *this)
{
  return MEMORY[0x1F4117F68](this);
}

uint64_t E5RT::ExecutionStreamOperation::GetInputPorts(E5RT::ExecutionStreamOperation *this)
{
  return MEMORY[0x1F4117F88](this);
}

uint64_t E5RT::ExecutionStreamOperation::GetOutputPorts(E5RT::ExecutionStreamOperation *this)
{
  return MEMORY[0x1F4117F90](this);
}

uint64_t E5RT::IOPort::GetPortDescriptor(E5RT::IOPort *this)
{
  return MEMORY[0x1F4117F98](this);
}

uint64_t E5RT::Status::GetErrorCode(E5RT::Status *this)
{
  return MEMORY[0x1F4117FA8](this);
}

uint64_t E5RT::Status::GetErrorMessage(E5RT::Status *this)
{
  return MEMORY[0x1F4117FB0](this);
}

uint64_t E5RT::E5RTError::GetStatus(E5RT::E5RTError *this)
{
  return MEMORY[0x1F4117FB8](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1F417E448](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1F417E530](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1F417E588](__n);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x1F417E670](this, __str);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

void std::terminate(void)
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1F417EF30](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1F417EF48](a1);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_rethrow(void)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

double __exp10(double a1)
{
  MEMORY[0x1F40C9B90](a1);
  return result;
}

__float2 __sincosf_stret(float a1)
{
  MEMORY[0x1F40C9C88](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

{
  return MEMORY[0x1F41813D0]();
}

{
  return MEMORY[0x1F41813F0]();
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x1F40C9F70](dso, description, activity, *(void *)&flags);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_isClassOrObjCExistentialType()
{
  return MEMORY[0x1F4186340]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1F4186370]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

uint64_t _swift_stdlib_strtod_clocale()
{
  return MEMORY[0x1F4186398]();
}

uint64_t _swift_stdlib_strtof_clocale()
{
  return MEMORY[0x1F41863A0]();
}

void abort(void)
{
}

uint32_t arc4random(void)
{
  return MEMORY[0x1F40CA3A8]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1F40CA3C0](*(void *)&__upper_bound);
}

long double atan(long double __x)
{
  MEMORY[0x1F40CA450](__x);
  return result;
}

void bzero(void *a1, size_t a2)
{
}

Ivar *__cdecl class_copyIvarList(Class cls, unsigned int *outCount)
{
  return (Ivar *)MEMORY[0x1F41814E8](cls, outCount);
}

objc_property_t *__cdecl class_copyPropertyList(Class cls, unsigned int *outCount)
{
  return (objc_property_t *)MEMORY[0x1F4181500](cls, outCount);
}

size_t class_getInstanceSize(Class cls)
{
  return MEMORY[0x1F4181530](cls);
}

Class class_getSuperclass(Class cls)
{
  return (Class)MEMORY[0x1F4181558](cls);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_apply(size_t iterations, dispatch_queue_t queue, void *block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1F40CB9C0](flags, block);
}

intptr_t dispatch_block_wait(dispatch_block_t block, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CB9F8](block, timeout);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return (void *)MEMORY[0x1F40CBA68](key);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBAC0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_initially_inactive(dispatch_queue_attr_t attr)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA0](attr);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

void dispatch_set_qos_class_floor(dispatch_object_t object, dispatch_qos_class_t qos_class, int relative_priority)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

double erand48(unsigned __int16 a1[3])
{
  MEMORY[0x1F40CBF48](a1);
  return result;
}

long double erfc(long double __x)
{
  MEMORY[0x1F40CBF58](__x);
  return result;
}

int fclose(FILE *a1)
{
  return MEMORY[0x1F40CC050](a1);
}

float fmodf(float a1, float a2)
{
  MEMORY[0x1F40CC1A8](a1, a2);
  return result;
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1F40CC1C0](__filename, __mode);
}

void free(void *a1)
{
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return MEMORY[0x1F40CC290](a1, a2, *(void *)&a3);
}

ssize_t getline(char **__linep, size_t *__linecapp, FILE *__stream)
{
  return MEMORY[0x1F40CC428](__linep, __linecapp, __stream);
}

kern_return_t host_info(host_t host, host_flavor_t flavor, host_info_t host_info_out, mach_msg_type_number_t *host_info_outCnt)
{
  return MEMORY[0x1F40CC608](*(void *)&host, *(void *)&flavor, host_info_out, host_info_outCnt);
}

kern_return_t host_statistics(host_t host_priv, host_flavor_t flavor, host_info_t host_info_out, mach_msg_type_number_t *host_info_outCnt)
{
  return MEMORY[0x1F40CC620](*(void *)&host_priv, *(void *)&flavor, host_info_out, host_info_outCnt);
}

const char *__cdecl ivar_getName(Ivar v)
{
  return (const char *)MEMORY[0x1F41815B8](v);
}

ptrdiff_t ivar_getOffset(Ivar v)
{
  return MEMORY[0x1F41815C0](v);
}

const char *__cdecl ivar_getTypeEncoding(Ivar v)
{
  return (const char *)MEMORY[0x1F41815C8](v);
}

long double log(long double __x)
{
  MEMORY[0x1F40CC878](__x);
  return result;
}

long double log2(long double __x)
{
  MEMORY[0x1F40CC8A8](__x);
  return result;
}

float logf(float a1)
{
  MEMORY[0x1F40CC8C0](a1);
  return result;
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1F40CC910]();
}

void mach_error(const char *str, mach_error_t error_value)
{
}

mach_port_t mach_host_self(void)
{
  return MEMORY[0x1F40CC950]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1F40CCA60](info);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1F40CCB10](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

size_t malloc_zone_pressure_relief(malloc_zone_t *zone, size_t goal)
{
  return MEMORY[0x1F40CCC28](zone, goal);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1F40CCCE8](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1F4181718](object, key);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1F40CD550](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1F40CD558](log);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1F40CD650]();
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x1F40CD818](__x, __y);
  return result;
}

const char *__cdecl property_getName(objc_property_t property)
{
  return (const char *)MEMORY[0x1F4181AD0](property);
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x1F40CDBD8]();
}

int rand(void)
{
  return MEMORY[0x1F40CDC08]();
}

void srand(unsigned int a1)
{
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1F41863D0]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x1F41863E0]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x1F41863F0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1F4186410]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1F4186418]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1F4186420]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1F4186428]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1F4186430]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1F4186448]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1F4186458]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x1F4186460]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x1F41881F0]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1F4186488]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1F41864A0]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x1F4188218]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x1F4188220]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x1F41864C0]();
}

uint64_t swift_dynamicCastMetatype()
{
  return MEMORY[0x1F41864D0]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1F41864E0]();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return MEMORY[0x1F41864F0]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1F4186518]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1F4186528]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1F4186530]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x1F4186538]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x1F4186540]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x1F4186568]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1F4186570]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1F4186580]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1F41865E0]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x1F41865F0]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1F41865F8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1F4186608]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1F4186610]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1F4186628]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1F4186650]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1F4186670]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1F4186688]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1F41866A8]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1F41866B8]();
}

uint64_t swift_isClassType()
{
  return MEMORY[0x1F41866C0]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1F41866C8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x1F41866F8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1F4186700]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x1F4186710]();
}

uint64_t swift_once()
{
  return MEMORY[0x1F4186728]();
}

uint64_t swift_projectBox()
{
  return MEMORY[0x1F4186730]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1F4186760]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x1F4186778]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1F4186790]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1F41867A0]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x1F41867A8]();
}

uint64_t swift_stdlib_random()
{
  return MEMORY[0x1F41867B0]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1F41867B8]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1F4188250]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1F4188258]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1F4188260]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x1F41867D8]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x1F41867E8]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x1F41867F8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1F4186898]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1F41868E0]();
}

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x1F41868E8]();
}

long double tanh(long double __x)
{
  MEMORY[0x1F40CE430](__x);
  return result;
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x1F40CE470](*(void *)&target_task, *(void *)&flavor, task_info_out, task_info_outCnt);
}
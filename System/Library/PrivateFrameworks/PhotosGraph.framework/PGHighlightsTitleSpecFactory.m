@interface PGHighlightsTitleSpecFactory
+ (id)orderedHighlightTitleSpecTypesForMeaningLabel:(id)a3;
+ (id)specCollectionForMeaningLabel:(id)a3 allowAllCities:(BOOL)a4;
+ (id)specPoolForAOILocation;
+ (id)specPoolForBusinessItem;
+ (id)specPoolForGenericLocation:(BOOL)a3;
+ (id)specPoolForPublicEvent;
+ (id)specPoolForPublicEventWithBusiness;
+ (id)specPoolsForBirthdayIncludingLocationIfPossible:(BOOL)a3 allowAllCities:(BOOL)a4;
+ (id)specPoolsForHolidayEventIncludingLocationIfPossible:(BOOL)a3 allowAllCities:(BOOL)a4;
+ (id)titleSpecForGenericLocation:(BOOL)a3;
+ (id)titleSpecForHolidayEventIncludingLocationIfPossible:(BOOL)a3;
@end

@implementation PGHighlightsTitleSpecFactory

+ (id)orderedHighlightTitleSpecTypesForMeaningLabel:(id)a3
{
  uint64_t v3 = orderedHighlightTitleSpecTypesForMeaningLabel__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&orderedHighlightTitleSpecTypesForMeaningLabel__onceToken, &__block_literal_global_34924);
  }
  v5 = [(id)orderedHighlightTitleSpecTypesForMeaningLabel__specTypesByMeaningLabel objectForKeyedSubscript:v4];

  return v5;
}

void __78__PGHighlightsTitleSpecFactory_orderedHighlightTitleSpecTypesForMeaningLabel___block_invoke()
{
  v4[27] = *MEMORY[0x1E4F143B8];
  v3[0] = @"Activity";
  v3[1] = @"Hiking";
  v4[0] = &unk_1F28D3FC0;
  v4[1] = &unk_1F28D3FC0;
  v3[2] = @"Climbing";
  v3[3] = @"Beaching";
  v4[2] = &unk_1F28D3FC0;
  v4[3] = &unk_1F28D3FC0;
  v3[4] = @"Diving";
  v3[5] = @"WinterSport";
  v4[4] = &unk_1F28D3FC0;
  v4[5] = &unk_1F28D3FC0;
  v3[6] = @"Entertainment";
  v3[7] = @"Theater";
  v4[6] = &unk_1F28D3FD8;
  v4[7] = &unk_1F28D3FD8;
  v3[8] = @"Dance";
  v3[9] = @"AmusementPark";
  v4[8] = &unk_1F28D3FD8;
  v4[9] = &unk_1F28D3FD8;
  v3[10] = @"SportEvent";
  v3[11] = @"Performance";
  v4[10] = &unk_1F28D3FD8;
  v4[11] = &unk_1F28D3FD8;
  v3[12] = @"Concert";
  v3[13] = @"Festival";
  v4[12] = &unk_1F28D3FD8;
  v4[13] = &unk_1F28D3FD8;
  v3[14] = @"NightOut";
  v3[15] = @"Museum";
  v4[14] = &unk_1F28D3FF0;
  v4[15] = &unk_1F28D3FD8;
  v3[16] = @"Celebration";
  v3[17] = @"Birthday";
  v4[16] = &unk_1F28D3FA8;
  v4[17] = &unk_1F28D4038;
  v3[18] = @"Anniversary";
  v3[19] = @"Wedding";
  v4[18] = &unk_1F28D3FA8;
  v4[19] = &unk_1F28D3FA8;
  v3[20] = @"HolidayEvent";
  v3[21] = @"Restaurant";
  v4[20] = &unk_1F28D4050;
  v4[21] = &unk_1F28D4008;
  v3[22] = @"Breakfast";
  v3[23] = @"Lunch";
  v4[22] = &unk_1F28D4008;
  v4[23] = &unk_1F28D4008;
  v3[24] = @"Dinner";
  v3[25] = @"Gathering";
  v4[24] = &unk_1F28D4008;
  v4[25] = &unk_1F28D3FA8;
  v0 = [MEMORY[0x1E4F76D68] appleEvents];
  v3[26] = v0;
  v4[26] = &unk_1F28D4020;
  uint64_t v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:27];
  v2 = (void *)orderedHighlightTitleSpecTypesForMeaningLabel__specTypesByMeaningLabel;
  orderedHighlightTitleSpecTypesForMeaningLabel__specTypesByMeaningLabel = v1;
}

+ (id)titleSpecForHolidayEventIncludingLocationIfPossible:(BOOL)a3
{
  BOOL v3 = a3;
  v15[2] = *MEMORY[0x1E4F143B8];
  id v4 = +[PGTitleSpecTimeArgument argumentWithTimeType:3];
  v5 = [PGTitleSpec alloc];
  v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v7 = v6;
  if (v3)
  {
    v8 = [v6 localizedStringForKey:@"PGLocalizedHolidayLocation %@ holidayEventName %@" value:@"PGLocalizedHolidayLocation %@ holidayEventName %@" table:@"Localizable"];
    v9 = [(PGTitleSpec *)v5 initWithFormat:v8 titleCategory:0];

    v10 = +[PGTitleSpecLocationArgument argumentWithLocationType:1 filterLocations:1];
    v15[0] = v10;
    v15[1] = v4;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
    [(PGTitleSpec *)v9 setArguments:v11];
  }
  else
  {
    v12 = [v6 localizedStringForKey:@"PGLocalizedHolidayEventName %@" value:@"PGLocalizedHolidayEventName %@" table:@"Localizable"];
    v9 = [(PGTitleSpec *)v5 initWithFormat:v12 titleCategory:0];

    v14 = v4;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
    [(PGTitleSpec *)v9 setArguments:v10];
  }

  return v9;
}

+ (id)specPoolsForHolidayEventIncludingLocationIfPossible:(BOOL)a3 allowAllCities:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v22[1] = *MEMORY[0x1E4F143B8];
  v7 = objc_msgSend(a1, "titleSpecForHolidayEventIncludingLocationIfPossible:");
  v22[0] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
  v9 = +[PGTitleSpecPool poolWithSpecs:v8];

  v10 = [a1 titleSpecForGenericLocation:v4];
  v21 = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
  v12 = +[PGTitleSpecPool poolWithSpecs:v11];

  if (v5)
  {
    v13 = [a1 titleSpecForHolidayEventIncludingLocationIfPossible:0];
    v20 = v13;
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
    v15 = +[PGTitleSpecPool poolWithSpecs:v14];

    v19[0] = v9;
    v19[1] = v15;
    v19[2] = v12;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:3];
  }
  else
  {
    v18[0] = v9;
    v18[1] = v12;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  }

  return v16;
}

+ (id)specPoolsForBirthdayIncludingLocationIfPossible:(BOOL)a3 allowAllCities:(BOOL)a4
{
  BOOL v42 = a4;
  BOOL v44 = a3;
  v58[2] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = +[PGTitleSpecPeopleArgument argumentWithPeopleType:4];
  uint64_t v6 = +[PGTitleSpecTimeArgument argumentWithTimeType:0];
  v7 = [PGTitleSpec alloc];
  v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v9 = [v8 localizedStringForKey:@"PGPeopleBirthdayTitleFormatWithName %@ ordinalYearsString %@" value:@"PGPeopleBirthdayTitleFormatWithName %@ ordinalYearsString %@" table:@"Localizable"];
  v10 = [(PGTitleSpec *)v7 initWithFormat:v9 titleCategory:3];

  v11 = [PGTitleSpec alloc];
  v12 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v13 = (void *)v6;
  v14 = [v12 localizedStringForKey:@"PGPeopleBirthdayTitleFormatWithName %@" value:@"PGPeopleBirthdayTitleFormatWithName %@" table:@"Localizable"];
  v15 = [(PGTitleSpec *)v11 initWithFormat:v14 titleCategory:3];

  v16 = (void *)v5;
  v58[0] = v5;
  v58[1] = v13;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:2];
  [(PGTitleSpec *)v10 setArguments:v17];

  uint64_t v57 = v5;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v57 count:1];
  [(PGTitleSpec *)v15 setArguments:v18];

  v46 = v10;
  v56 = v10;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v56 count:1];
  v20 = +[PGTitleSpecPool poolWithSpecs:v19];

  v45 = v15;
  v55 = v15;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v55 count:1];
  v47 = +[PGTitleSpecPool poolWithSpecs:v21];

  v22 = [a1 titleSpecForGenericLocation:v42];
  v54 = v22;
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v54 count:1];
  v24 = +[PGTitleSpecPool poolWithSpecs:v23];

  if (v44)
  {
    v25 = [PGTitleSpec alloc];
    v26 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    [v26 localizedStringForKey:@"PGPeopleBirthdayTitleFormatWithLocation %@ name %@ ordinalYearsString %@" value:@"PGPeopleBirthdayTitleFormatWithLocation %@ name %@ ordinalYearsString %@" table:@"Localizable"];
    v27 = v43 = v20;
    v41 = [(PGTitleSpec *)v25 initWithFormat:v27 titleCategory:3];

    v28 = [PGTitleSpec alloc];
    v29 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v30 = [v29 localizedStringForKey:@"PGPeopleBirthdayTitleFormatWithLocation %@ andName %@" value:@"PGPeopleBirthdayTitleFormatWithLocation %@ andName %@" table:@"Localizable"];
    v31 = [(PGTitleSpec *)v28 initWithFormat:v30 titleCategory:4];

    v32 = +[PGTitleSpecLocationArgument argumentWithLocationType:1 filterLocations:1];
    v53[0] = v32;
    v53[1] = v5;
    v53[2] = v13;
    v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:3];
    [(PGTitleSpec *)v41 setArguments:v33];

    v52[0] = v32;
    v52[1] = v5;
    v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:2];
    [(PGTitleSpec *)v31 setArguments:v34];

    v51 = v41;
    v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v51 count:1];
    v36 = +[PGTitleSpecPool poolWithSpecs:v35];

    v50 = v31;
    v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v50 count:1];
    v38 = +[PGTitleSpecPool poolWithSpecs:v37];

    v16 = (void *)v5;
    v49[0] = v36;
    v49[1] = v38;
    v49[2] = v43;
    v49[3] = v47;
    v49[4] = v24;
    v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:5];

    v20 = v43;
  }
  else
  {
    v48[0] = v20;
    v48[1] = v47;
    v48[2] = v24;
    v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:3];
  }

  return v39;
}

+ (id)specPoolForAOILocation
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v2 = [[PGTitleSpec alloc] initWithFormat:@"%@" titleCategory:4];
  BOOL v3 = +[PGTitleSpecLocationArgument argumentWithLocationType:8 filterLocations:1];
  [v3 setLineBreakBehavior:2];
  v9[0] = v3;
  BOOL v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  [(PGTitleSpec *)v2 setArguments:v4];

  [(PGTitleSpec *)v2 setHasSpecArgumentHandlingLineBreakBehavior:1];
  v8 = v2;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v8 count:1];
  uint64_t v6 = +[PGTitleSpecPool poolWithSpecs:v5];

  return v6;
}

+ (id)titleSpecForGenericLocation:(BOOL)a3
{
  BOOL v3 = a3;
  v9[1] = *MEMORY[0x1E4F143B8];
  BOOL v4 = [[PGTitleSpec alloc] initWithFormat:@"%@" titleCategory:4];
  if (v3) {
    uint64_t v5 = 481;
  }
  else {
    uint64_t v5 = 353;
  }
  uint64_t v6 = +[PGTitleSpecLocationArgument argumentWithLocationType:v5 filterLocations:1];
  [v6 setLineBreakBehavior:2];
  v9[0] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  [(PGTitleSpec *)v4 setArguments:v7];

  [(PGTitleSpec *)v4 setHasSpecArgumentHandlingLineBreakBehavior:1];
  return v4;
}

+ (id)specPoolForGenericLocation:(BOOL)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [a1 titleSpecForGenericLocation:a3];
  v7[0] = v3;
  BOOL v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  uint64_t v5 = +[PGTitleSpecPool poolWithSpecs:v4];

  return v5;
}

+ (id)specPoolForBusinessItem
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v2 = [[PGTitleSpec alloc] initWithFormat:@"%@" titleCategory:4];
  BOOL v3 = +[PGTitleSpecLocationArgument argumentWithLocationType:2 filterLocations:1];
  [v3 setLineBreakBehavior:2];
  v9[0] = v3;
  BOOL v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  [(PGTitleSpec *)v2 setArguments:v4];

  [(PGTitleSpec *)v2 setHasSpecArgumentHandlingLineBreakBehavior:1];
  v8 = v2;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v8 count:1];
  uint64_t v6 = +[PGTitleSpecPool poolWithSpecs:v5];

  return v6;
}

+ (id)specPoolForPublicEvent
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v2 = [[PGTitleSpec alloc] initWithFormat:@"%@" titleCategory:0];
  BOOL v3 = +[PGTitleSpecPublicEventArgument argumentWithPublicEventType:0 shouldUseLongPublicEventTitle:1];
  v9[0] = v3;
  BOOL v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  [(PGTitleSpec *)v2 setArguments:v4];

  v8 = v2;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v8 count:1];
  uint64_t v6 = +[PGTitleSpecPool poolWithSpecs:v5];

  return v6;
}

+ (id)specPoolForPublicEventWithBusiness
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v2 = [[PGTitleSpec alloc] initWithFormat:@"%@ - %@" titleCategory:0];
  BOOL v3 = +[PGTitleSpecPublicEventArgument argumentWithPublicEventType:0];
  BOOL v4 = +[PGTitleSpecPublicEventArgument argumentWithPublicEventType:1];
  v10[0] = v4;
  v10[1] = v3;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  [(PGTitleSpec *)v2 setArguments:v5];

  v9 = v2;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v9 count:1];
  v7 = +[PGTitleSpecPool poolWithSpecs:v6];

  return v7;
}

+ (id)specCollectionForMeaningLabel:(id)a3 allowAllCities:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [MEMORY[0x1E4F1CA48] array];
  v8 = [a1 orderedHighlightTitleSpecTypesForMeaningLabel:v6];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
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
        switch([*(id *)(*((void *)&v18 + 1) + 8 * i) unsignedIntegerValue])
        {
          case 0:
            uint64_t v13 = [a1 specPoolForPublicEvent];
            goto LABEL_12;
          case 1:
            uint64_t v13 = [a1 specPoolForPublicEventWithBusiness];
            goto LABEL_12;
          case 2:
            uint64_t v13 = [a1 specPoolForBusinessItem];
            goto LABEL_12;
          case 3:
            uint64_t v13 = [a1 specPoolForGenericLocation:v4];
            goto LABEL_12;
          case 4:
            uint64_t v13 = [a1 specPoolForAOILocation];
LABEL_12:
            v14 = (void *)v13;
            [v7 addObject:v13];
            goto LABEL_16;
          case 5:
            uint64_t v15 = [a1 specPoolsForBirthdayIncludingLocationIfPossible:0 allowAllCities:v4];
            goto LABEL_15;
          case 6:
            uint64_t v15 = [a1 specPoolsForHolidayEventIncludingLocationIfPossible:1 allowAllCities:v4];
LABEL_15:
            v14 = (void *)v15;
            [v7 addObjectsFromArray:v15];
LABEL_16:

            break;
          default:
            continue;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }
  v16 = +[PGTitleSpecCollection collectionWithSpecPools:v7];

  return v16;
}

@end
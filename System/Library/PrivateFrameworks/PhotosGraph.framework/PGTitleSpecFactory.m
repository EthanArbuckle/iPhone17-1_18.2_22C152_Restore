@interface PGTitleSpecFactory
+ (id)_publicEventSpecCategoryNameAtBusiness;
+ (id)_publicEventSpecEventName;
+ (id)_publicEventSpecPerformerNames;
+ (id)_specForActivity;
+ (id)_specForAnniversary;
+ (id)_specForBaby;
+ (id)_specForBabyGrowingUp;
+ (id)_specForBeaching;
+ (id)_specForBirthday;
+ (id)_specForBreakfast;
+ (id)_specForCelebration;
+ (id)_specForClimbing;
+ (id)_specForDinner;
+ (id)_specForDiving;
+ (id)_specForEarlyMomentsWithPersonNodes:(id)a3;
+ (id)_specForEntertainment;
+ (id)_specForFoodieWithPersonNodes:(id)a3 locationName:(id)a4 tripTitleLocationType:(unint64_t)a5 allowInspiredTastesTitle:(BOOL)a6 genericOnly:(BOOL)a7;
+ (id)_specForGathering;
+ (id)_specForHiking;
+ (id)_specForLunch;
+ (id)_specForNightOut;
+ (id)_specForPeopleVisiting;
+ (id)_specForPerformance;
+ (id)_specForPet;
+ (id)_specForSportEvent;
+ (id)_specForThrowbackThursday;
+ (id)_specForWedding;
+ (id)_specForWinterSport;
+ (id)specCollectionForMeaningLabel:(id)a3;
+ (id)specCollectionForMemoryCategory:(unint64_t)a3 subcategory:(unint64_t)a4;
+ (id)specCollectionForMemoryCategory:(unint64_t)a3 subcategory:(unint64_t)a4 personNodes:(id)a5;
@end

@implementation PGTitleSpecFactory

+ (id)_publicEventSpecCategoryNameAtBusiness
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v2 = [PGTitleSpec alloc];
  v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"PGMeaningfulEventMemoryTitleTypePublicEvent %@ atBusiness %@" value:@"PGMeaningfulEventMemoryTitleTypePublicEvent %@ atBusiness %@" table:@"Localizable"];
  v5 = [(PGTitleSpec *)v2 initWithFormat:v4 titleCategory:0];

  v6 = +[PGTitleSpecPublicEventArgument argumentWithPublicEventType:3];
  v10[0] = v6;
  v7 = +[PGTitleSpecLocationArgument argumentWithLocationType:2 filterLocations:1];
  v10[1] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  [(PGTitleSpec *)v5 setArguments:v8];

  [(PGTitleSpec *)v5 setHasLineBreak:1];
  return v5;
}

+ (id)_publicEventSpecPerformerNames
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v2 = [[PGTitleSpec alloc] initWithFormat:@"%@" titleCategory:0];
  v3 = +[PGTitleSpecPublicEventArgument argumentWithPublicEventType:2];
  v6[0] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  [(PGTitleSpec *)v2 setArguments:v4];

  return v2;
}

+ (id)_publicEventSpecEventName
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v2 = [[PGTitleSpec alloc] initWithFormat:@"%@" titleCategory:0];
  v3 = +[PGTitleSpecPublicEventArgument argumentWithPublicEventType:0];
  v6[0] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  [(PGTitleSpec *)v2 setArguments:v4];

  return v2;
}

+ (id)_specForFoodieWithPersonNodes:(id)a3 locationName:(id)a4 tripTitleLocationType:(unint64_t)a5 allowInspiredTastesTitle:(BOOL)a6 genericOnly:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v63 = a6;
  v81[3] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v67 = a4;
  v10 = [PGTitleSpec alloc];
  v11 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v12 = [v11 localizedStringForKey:@"PGFoodieMemoryTitleGeneric" value:@"PGFoodieMemoryTitleGeneric" table:@"Localizable"];
  v13 = [(PGTitleSpec *)v10 initWithFormat:v12 titleCategory:0];

  v14 = [PGTitleSpec alloc];
  v15 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v16 = [v15 localizedStringForKey:@"PGFoodieMemoryTitleGeneric2" value:@"PGFoodieMemoryTitleGeneric2" table:@"Localizable"];
  uint64_t v17 = [(PGTitleSpec *)v14 initWithFormat:v16 titleCategory:0];

  v18 = [PGTitleSpec alloc];
  v19 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v20 = [v19 localizedStringForKey:@"PGFoodieMemoryTitleGeneric3" value:@"PGFoodieMemoryTitleGeneric3" table:@"Localizable"];
  v21 = [(PGTitleSpec *)v18 initWithFormat:v20 titleCategory:0];

  v81[0] = v13;
  v81[1] = v17;
  v65 = (void *)v17;
  v81[2] = v21;
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v81 count:3];
  v23 = +[PGTitleSpecPool poolWithSpecs:v22];

  v66 = v9;
  if (v7)
  {
    v80 = v23;
    v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v80 count:1];
    v25 = +[PGTitleSpecCollection collectionWithSpecPools:v24];
  }
  else
  {
    if ([v9 count])
    {
      id v26 = v9;
      v27 = [PGTitleSpec alloc];
      v28 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v29 = [v28 localizedStringForKey:@"PGFoodieMemoryTitleWithPerson %@" value:@"PGFoodieMemoryTitleWithPerson %@" table:@"Localizable"];
      v24 = [(PGTitleSpec *)v27 initWithFormat:v29 titleCategory:3];

      v30 = +[PGTitleSpecPeopleArgument argumentWithPeopleType:0 personNodes:v26];
      v79 = v30;
      v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v79 count:1];
      [(PGTitleSpec *)v24 setArguments:v31];

      [(PGTitleSpec *)v24 setHasLineBreak:1];
      v78 = v24;
      v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v78 count:1];
      v33 = +[PGTitleSpecPool poolWithSpecs:v32];

      v77[0] = v33;
      v77[1] = v23;
      v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v77 count:2];
      v25 = +[PGTitleSpecCollection collectionWithSpecPools:v34];
    }
    else
    {
      uint64_t v35 = [v67 length];
      v36 = [PGTitleSpec alloc];
      v37 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v38 = [v37 localizedStringForKey:@"PGFoodieMemoryTitleWithLocationName %@" value:@"PGFoodieMemoryTitleWithLocationName %@" table:@"Localizable"];
      v24 = [(PGTitleSpec *)v36 initWithFormat:v38 titleCategory:4];

      if (v35)
      {
        v39 = +[PGTitleSpecLocationArgument argumentWithLocationTypeLocationForLocationName:v67];
        v76 = v39;
        v40 = &v76;
      }
      else
      {
        v39 = +[PGTitleSpecLocationArgument argumentWithLocationType:1 filterLocations:1];
        v75 = v39;
        v40 = &v75;
      }
      v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:1];
      [(PGTitleSpec *)v24 setArguments:v41];

      v42 = [PGTitleSpec alloc];
      v43 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v44 = [v43 localizedStringForKey:@"PGFoodieMemoryTitleWithLocationName2 %@" value:@"PGFoodieMemoryTitleWithLocationName2 %@" table:@"Localizable"];
      v33 = [(PGTitleSpec *)v42 initWithFormat:v44 titleCategory:4];

      if (v35)
      {
        v45 = +[PGTitleSpecLocationArgument argumentWithLocationTypeLocationForLocationName:v67];
        v74 = v45;
        v46 = &v74;
      }
      else
      {
        v45 = +[PGTitleSpecLocationArgument argumentWithLocationType:1 filterLocations:1];
        v73 = v45;
        v46 = &v73;
      }
      v47 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v46, 1, v35);
      [(PGTitleSpec *)v33 setArguments:v47];

      if (v63)
      {
        switch(a5)
        {
          case 0uLL:
          case 1uLL:
            v48 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
            v49 = v48;
            v50 = @"PGFoodieMemoryTitleWithCityLocationName %@";
            goto LABEL_19;
          case 2uLL:
            v48 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
            v49 = v48;
            v50 = @"PGFoodieMemoryTitleWithStateLocationName %@";
            goto LABEL_19;
          case 3uLL:
            v48 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
            v49 = v48;
            v50 = @"PGFoodieMemoryTitleWithCountryLocationName %@";
            goto LABEL_19;
          case 4uLL:
            v48 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
            v49 = v48;
            v50 = @"PGFoodieMemoryTitleWithAOIName %@";
LABEL_19:
            uint64_t v52 = [v48 localizedStringForKey:v50 value:v50 table:@"Localizable"];

            break;
          default:
            uint64_t v52 = 0;
            break;
        }
        v53 = [[PGTitleSpec alloc] initWithFormat:v52 titleCategory:4];
        v64 = (void *)v52;
        if (v61)
        {
          v54 = +[PGTitleSpecLocationArgument argumentWithLocationTypeLocationForLocationName:v67];
          v72 = v54;
          v55 = &v72;
        }
        else
        {
          v54 = +[PGTitleSpecLocationArgument argumentWithLocationType:1 filterLocations:1];
          v71 = v54;
          v55 = &v71;
        }
        v56 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:1];
        [(PGTitleSpec *)v53 setArguments:v56];

        v70[0] = v24;
        v70[1] = v33;
        v70[2] = v53;
        v57 = [MEMORY[0x1E4F1C978] arrayWithObjects:v70 count:3];
        v34 = +[PGTitleSpecPool poolWithSpecs:v57];

        v51 = v64;
      }
      else
      {
        v69[0] = v24;
        v69[1] = v33;
        v51 = [MEMORY[0x1E4F1C978] arrayWithObjects:v69 count:2];
        v34 = +[PGTitleSpecPool poolWithSpecs:v51];
      }

      v68[0] = v34;
      v68[1] = v23;
      v58 = [MEMORY[0x1E4F1C978] arrayWithObjects:v68 count:2];
      v25 = +[PGTitleSpecCollection collectionWithSpecPools:v58];
    }
  }

  id v59 = v25;
  return v59;
}

+ (id)_specForThrowbackThursday
{
  v20[1] = *MEMORY[0x1E4F143B8];
  v2 = [[PGTitleSpec alloc] initWithFormat:@"%@" titleCategory:5];
  v3 = +[PGTitleSpecTimeArgument argumentWithTimeType:2];
  v20[0] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  [(PGTitleSpec *)v2 setArguments:v4];

  [(PGTitleSpec *)v2 setHasLineBreak:1];
  v5 = [PGTitleSpec alloc];
  v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  BOOL v7 = [v6 localizedStringForKey:@"PGThrowbackThursdayTitleFormat2" value:@"PGThrowbackThursdayTitleFormat2" table:@"Localizable"];
  v8 = [(PGTitleSpec *)v5 initWithFormat:v7 titleCategory:5];

  id v9 = [PGTitleSpec alloc];
  v10 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v11 = [v10 localizedStringForKey:@"PGThrowbackThursdayTitleFormat3" value:@"PGThrowbackThursdayTitleFormat3" table:@"Localizable"];
  v12 = [(PGTitleSpec *)v9 initWithFormat:v11 titleCategory:5];

  v19[0] = v2;
  v19[1] = v8;
  v19[2] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:3];
  v14 = +[PGTitleSpecPool poolWithSpecs:v13];

  v18 = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
  v16 = +[PGTitleSpecCollection collectionWithSpecPools:v15];

  return v16;
}

+ (id)_specForPeopleVisiting
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"PGPeopleVisitingMemoryTitleStringVisiting" value:@"PGPeopleVisitingMemoryTitleStringVisiting" table:@"Localizable"];
  v4 = +[PGTitleSpec specWithFormat:v3 titleCategory:0];

  v11[0] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  v6 = +[PGTitleSpecPool poolWithSpecs:v5];

  v10 = v6;
  BOOL v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v10 count:1];
  v8 = +[PGTitleSpecCollection collectionWithSpecPools:v7];

  return v8;
}

+ (id)_specForEarlyMomentsWithPersonNodes:(id)a3
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [PGTitleSpec alloc];
  v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:@"PGEarlyMomentsWithPeopleTitleFormatOnePersonWithName %@" value:@"PGEarlyMomentsWithPeopleTitleFormatOnePersonWithName %@" table:@"Localizable"];
  BOOL v7 = [(PGTitleSpec *)v4 initWithFormat:v6 titleCategory:0];

  v8 = +[PGTitleSpecPeopleArgument argumentWithPeopleType:0 personNodes:v3];

  v24[0] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
  [(PGTitleSpec *)v7 setArguments:v9];

  [(PGTitleSpec *)v7 setHasLineBreak:1];
  v10 = [PGTitleSpec alloc];
  v11 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v12 = [v11 localizedStringForKey:@"PGEarlyMomentsWithPeopleTitleFormatWithUnnamedPerson" value:@"PGEarlyMomentsWithPeopleTitleFormatWithUnnamedPerson" table:@"Localizable"];
  v13 = [(PGTitleSpec *)v10 initWithFormat:v12 titleCategory:3];

  [(PGTitleSpec *)v13 setHasLineBreak:1];
  v23 = v7;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
  v15 = +[PGTitleSpecPool poolWithSpecs:v14];

  v22 = v13;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
  uint64_t v17 = +[PGTitleSpecPool poolWithSpecs:v16];

  v21[0] = v15;
  v21[1] = v17;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
  v19 = +[PGTitleSpecCollection collectionWithSpecPools:v18];

  return v19;
}

+ (id)_specForBabyGrowingUp
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"PGBabyMemoryTypeFormat1" value:@"PGBabyMemoryTypeFormat1" table:@"Localizable"];
  v4 = +[PGTitleSpec specWithFormat:v3 titleCategory:0];

  v11[0] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  v6 = +[PGTitleSpecPool poolWithSpecs:v5];

  v10 = v6;
  BOOL v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v10 count:1];
  v8 = +[PGTitleSpecCollection collectionWithSpecPools:v7];

  return v8;
}

+ (id)_specForBaby
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"PGBabyMemoryTypeFormat2" value:@"PGBabyMemoryTypeFormat2" table:@"Localizable"];
  v4 = +[PGTitleSpec specWithFormat:v3 titleCategory:0];

  v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:@"PGBabyMemoryTypeFormat3" value:@"PGBabyMemoryTypeFormat3" table:@"Localizable"];
  BOOL v7 = +[PGTitleSpec specWithFormat:v6 titleCategory:0];

  v14[0] = v4;
  v14[1] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  id v9 = +[PGTitleSpecPool poolWithSpecs:v8];

  v13 = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
  v11 = +[PGTitleSpecCollection collectionWithSpecPools:v10];

  return v11;
}

+ (id)_specForPet
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"PGPetMemoryTypeFormatPet" value:@"PGPetMemoryTypeFormatPet" table:@"Localizable"];
  v4 = +[PGTitleSpec specWithFormat:v3 titleCategory:0];

  v11[0] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  v6 = +[PGTitleSpecPool poolWithSpecs:v5];

  v10 = v6;
  BOOL v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v10 count:1];
  v8 = +[PGTitleSpecCollection collectionWithSpecPools:v7];

  return v8;
}

+ (id)_specForGathering
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v2 = [[PGTitleSpec alloc] initWithFormat:@"%@" titleCategory:4];
  id v3 = +[PGTitleSpecLocationArgument argumentWithLocationType:1 filterLocations:0];
  v12[0] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  [(PGTitleSpec *)v2 setArguments:v4];

  v11 = v2;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
  v6 = +[PGTitleSpecPool poolWithSpecs:v5];

  v10 = v6;
  BOOL v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v10 count:1];
  v8 = +[PGTitleSpecCollection collectionWithSpecPools:v7];

  return v8;
}

+ (id)_specForDinner
{
  v38[1] = *MEMORY[0x1E4F143B8];
  v2 = [PGTitleSpec alloc];
  id v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"PGMeaningfulEventMemoryTitleTypeDinnerWithLocationName %@" value:@"PGMeaningfulEventMemoryTitleTypeDinnerWithLocationName %@" table:@"Localizable"];
  v34 = [(PGTitleSpec *)v2 initWithFormat:v4 titleCategory:4];

  v5 = +[PGTitleSpecLocationArgument argumentWithLocationType:1 filterLocations:1];
  v38[0] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:1];
  [(PGTitleSpec *)v34 setArguments:v6];

  BOOL v7 = [PGTitleSpec alloc];
  v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v9 = [v8 localizedStringForKey:@"PGMeaningfulEventMemoryTitleTypeFridayDinner" value:@"PGMeaningfulEventMemoryTitleTypeFridayDinner" table:@"Localizable"];
  v10 = [(PGTitleSpec *)v7 initWithFormat:v9 titleCategory:1];

  [(PGTitleSpec *)v10 setWeekdayCriteria:1];
  v11 = [PGTitleSpec alloc];
  v12 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v13 = [v12 localizedStringForKey:@"PGMeaningfulEventMemoryTitleTypeSaturdayDinner" value:@"PGMeaningfulEventMemoryTitleTypeSaturdayDinner" table:@"Localizable"];
  v14 = [(PGTitleSpec *)v11 initWithFormat:v13 titleCategory:1];

  [(PGTitleSpec *)v14 setWeekdayCriteria:2];
  v15 = [PGTitleSpec alloc];
  v16 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v17 = [v16 localizedStringForKey:@"PGMeaningfulEventMemoryTitleTypeSundayDinner" value:@"PGMeaningfulEventMemoryTitleTypeSundayDinner" table:@"Localizable"];
  v18 = [(PGTitleSpec *)v15 initWithFormat:v17 titleCategory:1];

  [(PGTitleSpec *)v18 setWeekdayCriteria:3];
  v19 = [PGTitleSpec alloc];
  v20 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v21 = [v20 localizedStringForKey:@"PGMeaningfulEventMemoryTitleTypeFamilyDinner" value:@"PGMeaningfulEventMemoryTitleTypeFamilyDinner" table:@"Localizable"];
  v22 = [(PGTitleSpec *)v19 initWithFormat:v21 titleCategory:3];

  v23 = +[PGTitleSpecPeopleArgument argumentWithPeopleType:3];
  v37 = v23;
  v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v37 count:1];
  [(PGTitleSpec *)v22 setArguments:v24];

  v25 = [PGTitleSpec alloc];
  id v26 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v27 = [v26 localizedStringForKey:@"PGMeaningfulEventMemoryTitleTypeDinnerGeneric" value:@"PGMeaningfulEventMemoryTitleTypeDinnerGeneric" table:@"Localizable"];
  v28 = [(PGTitleSpec *)v25 initWithFormat:v27 titleCategory:1];

  [(PGTitleSpec *)v28 setHasLineBreak:1];
  v36[0] = v34;
  v36[1] = v10;
  v36[2] = v14;
  v36[3] = v18;
  v36[4] = v22;
  v36[5] = v28;
  v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:6];
  v30 = +[PGTitleSpecPool poolWithSpecs:v29];

  uint64_t v35 = v30;
  v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
  v32 = +[PGTitleSpecCollection collectionWithSpecPools:v31];

  return v32;
}

+ (id)_specForLunch
{
  v30[1] = *MEMORY[0x1E4F143B8];
  v2 = [PGTitleSpec alloc];
  id v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"PGMeaningfulEventMemoryTitleTypeLunchWithLocationName %@" value:@"PGMeaningfulEventMemoryTitleTypeLunchWithLocationName %@" table:@"Localizable"];
  v5 = [(PGTitleSpec *)v2 initWithFormat:v4 titleCategory:4];

  v6 = +[PGTitleSpecLocationArgument argumentWithLocationType:1 filterLocations:1];
  v30[0] = v6;
  BOOL v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
  [(PGTitleSpec *)v5 setArguments:v7];

  v8 = [PGTitleSpec alloc];
  id v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v10 = [v9 localizedStringForKey:@"PGMeaningfulEventMemoryTitleTypeSaturdayBrunch" value:@"PGMeaningfulEventMemoryTitleTypeSaturdayBrunch" table:@"Localizable"];
  v11 = [(PGTitleSpec *)v8 initWithFormat:v10 titleCategory:1];

  [(PGTitleSpec *)v11 setWeekdayCriteria:2];
  v12 = [PGTitleSpec alloc];
  v13 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v14 = [v13 localizedStringForKey:@"PGMeaningfulEventMemoryTitleTypeSundayBrunch" value:@"PGMeaningfulEventMemoryTitleTypeSundayBrunch" table:@"Localizable"];
  v15 = [(PGTitleSpec *)v12 initWithFormat:v14 titleCategory:1];

  [(PGTitleSpec *)v15 setWeekdayCriteria:3];
  v16 = [PGTitleSpec alloc];
  uint64_t v17 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v18 = [v17 localizedStringForKey:@"PGMeaningfulEventMemoryTitleTypeFamilyLunch" value:@"PGMeaningfulEventMemoryTitleTypeFamilyLunch" table:@"Localizable"];
  v19 = [(PGTitleSpec *)v16 initWithFormat:v18 titleCategory:3];

  v20 = +[PGTitleSpecPeopleArgument argumentWithPeopleType:3];
  v29 = v20;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
  [(PGTitleSpec *)v19 setArguments:v21];

  v28[0] = v5;
  v28[1] = v11;
  v28[2] = v15;
  v28[3] = v19;
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:4];
  v23 = +[PGTitleSpecPool poolWithSpecs:v22];

  v27 = v23;
  v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
  v25 = +[PGTitleSpecCollection collectionWithSpecPools:v24];

  return v25;
}

+ (id)_specForBreakfast
{
  v23[1] = *MEMORY[0x1E4F143B8];
  v2 = [PGTitleSpec alloc];
  id v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"PGMeaningfulEventMemoryTitleTypeBreakfastWithLocationName %@" value:@"PGMeaningfulEventMemoryTitleTypeBreakfastWithLocationName %@" table:@"Localizable"];
  v5 = [(PGTitleSpec *)v2 initWithFormat:v4 titleCategory:4];

  v6 = +[PGTitleSpecLocationArgument argumentWithLocationType:1 filterLocations:1];
  v23[0] = v6;
  BOOL v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
  [(PGTitleSpec *)v5 setArguments:v7];

  v8 = [PGTitleSpec alloc];
  id v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v10 = [v9 localizedStringForKey:@"PGMeaningfulEventMemoryTitleTypeSaturdayBrunch" value:@"PGMeaningfulEventMemoryTitleTypeSaturdayBrunch" table:@"Localizable"];
  v11 = [(PGTitleSpec *)v8 initWithFormat:v10 titleCategory:1];

  [(PGTitleSpec *)v11 setWeekdayCriteria:2];
  v12 = [PGTitleSpec alloc];
  v13 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v14 = [v13 localizedStringForKey:@"PGMeaningfulEventMemoryTitleTypeSundayBrunch" value:@"PGMeaningfulEventMemoryTitleTypeSundayBrunch" table:@"Localizable"];
  v15 = [(PGTitleSpec *)v12 initWithFormat:v14 titleCategory:1];

  [(PGTitleSpec *)v15 setWeekdayCriteria:3];
  v22[0] = v5;
  v22[1] = v11;
  v22[2] = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:3];
  uint64_t v17 = +[PGTitleSpecPool poolWithSpecs:v16];

  v21 = v17;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
  v19 = +[PGTitleSpecCollection collectionWithSpecPools:v18];

  return v19;
}

+ (id)_specForDiving
{
  v33[1] = *MEMORY[0x1E4F143B8];
  v2 = [PGTitleSpec alloc];
  id v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"PGMeaningfulEventMemoryTitleTypeDiving1WithLocationName %@" value:@"PGMeaningfulEventMemoryTitleTypeDiving1WithLocationName %@" table:@"Localizable"];
  v5 = [(PGTitleSpec *)v2 initWithFormat:v4 titleCategory:4];

  v6 = +[PGTitleSpecLocationArgument argumentWithLocationType:5 filterLocations:1];
  v33[0] = v6;
  BOOL v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1];
  [(PGTitleSpec *)v5 setArguments:v7];

  [(PGTitleSpec *)v5 setHasLineBreak:1];
  v8 = [PGTitleSpec alloc];
  id v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v10 = [v9 localizedStringForKey:@"PGMeaningfulEventMemoryTitleTypeDiving2WithLocationName %@" value:@"PGMeaningfulEventMemoryTitleTypeDiving2WithLocationName %@" table:@"Localizable"];
  v11 = [(PGTitleSpec *)v8 initWithFormat:v10 titleCategory:4];

  v12 = +[PGTitleSpecLocationArgument argumentWithLocationType:5 filterLocations:1];
  v32 = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
  [(PGTitleSpec *)v11 setArguments:v13];

  [(PGTitleSpec *)v11 setHasLineBreak:1];
  v14 = [PGTitleSpec alloc];
  v15 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v16 = [v15 localizedStringForKey:@"PGMeaningfulEventMemoryTitleTypeDiving3" value:@"PGMeaningfulEventMemoryTitleTypeDiving3" table:@"Localizable"];
  uint64_t v17 = [(PGTitleSpec *)v14 initWithFormat:v16 titleCategory:1];

  v18 = [PGTitleSpec alloc];
  v19 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v20 = [v19 localizedStringForKey:@"PGMeaningfulEventMemoryTitleTypeDiving4" value:@"PGMeaningfulEventMemoryTitleTypeDiving4" table:@"Localizable"];
  v21 = [(PGTitleSpec *)v18 initWithFormat:v20 titleCategory:1];

  v31[0] = v5;
  v31[1] = v11;
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:2];
  v23 = +[PGTitleSpecPool poolWithSpecs:v22];

  v30[0] = v17;
  v30[1] = v21;
  v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];
  v25 = +[PGTitleSpecPool poolWithSpecs:v24];

  v29[0] = v23;
  v29[1] = v25;
  id v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
  v27 = +[PGTitleSpecCollection collectionWithSpecPools:v26];

  return v27;
}

+ (id)_specForClimbing
{
  v22[1] = *MEMORY[0x1E4F143B8];
  v2 = [PGTitleSpec alloc];
  id v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"PGMeaningfulEventMemoryTitleTypeClimbing1WithLocationName %@" value:@"PGMeaningfulEventMemoryTitleTypeClimbing1WithLocationName %@" table:@"Localizable"];
  v5 = [(PGTitleSpec *)v2 initWithFormat:v4 titleCategory:4];

  v6 = +[PGTitleSpecLocationArgument argumentWithLocationType:5 filterLocations:1];
  v22[0] = v6;
  BOOL v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
  [(PGTitleSpec *)v5 setArguments:v7];

  [(PGTitleSpec *)v5 setHasLineBreak:1];
  v8 = [PGTitleSpec alloc];
  id v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v10 = [v9 localizedStringForKey:@"PGMeaningfulEventMemoryTitleTypeClimbing2" value:@"PGMeaningfulEventMemoryTitleTypeClimbing2" table:@"Localizable"];
  v11 = [(PGTitleSpec *)v8 initWithFormat:v10 titleCategory:1];

  v21 = v5;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
  v13 = +[PGTitleSpecPool poolWithSpecs:v12];

  v20 = v11;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
  v15 = +[PGTitleSpecPool poolWithSpecs:v14];

  v19[0] = v13;
  v19[1] = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
  uint64_t v17 = +[PGTitleSpecCollection collectionWithSpecPools:v16];

  return v17;
}

+ (id)_specForHiking
{
  v19[1] = *MEMORY[0x1E4F143B8];
  v2 = [PGTitleSpec alloc];
  id v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"PGMeaningfulEventMemoryTitleTypeHiking1WithLocationName %@" value:@"PGMeaningfulEventMemoryTitleTypeHiking1WithLocationName %@" table:@"Localizable"];
  v5 = [(PGTitleSpec *)v2 initWithFormat:v4 titleCategory:4];

  v6 = +[PGTitleSpecLocationArgument argumentWithLocationType:5 filterLocations:1];
  v19[0] = v6;
  BOOL v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  [(PGTitleSpec *)v5 setArguments:v7];

  v8 = [PGTitleSpec alloc];
  id v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v10 = [v9 localizedStringForKey:@"PGMeaningfulEventMemoryTitleTypeHiking2" value:@"PGMeaningfulEventMemoryTitleTypeHiking2" table:@"Localizable"];
  v11 = [(PGTitleSpec *)v8 initWithFormat:v10 titleCategory:1];

  v18[0] = v5;
  v18[1] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  v13 = +[PGTitleSpecPool poolWithSpecs:v12];

  uint64_t v17 = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
  v15 = +[PGTitleSpecCollection collectionWithSpecPools:v14];

  return v15;
}

+ (id)_specForBeaching
{
  v36[1] = *MEMORY[0x1E4F143B8];
  v2 = [PGTitleSpec alloc];
  id v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"PGMeaningfulEventMemoryTitleTypeBeaching1WithLocationName %@" value:@"PGMeaningfulEventMemoryTitleTypeBeaching1WithLocationName %@" table:@"Localizable"];
  v5 = [(PGTitleSpec *)v2 initWithFormat:v4 titleCategory:4];

  v6 = +[PGTitleSpecLocationArgument argumentWithLocationType:1 filterLocations:1];
  v36[0] = v6;
  BOOL v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:1];
  [(PGTitleSpec *)v5 setArguments:v7];

  [(PGTitleSpec *)v5 setHasLineBreak:1];
  v8 = [PGTitleSpec alloc];
  id v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v10 = [v9 localizedStringForKey:@"PGMeaningfulEventMemoryTitleTypeBeaching2WithLocationName %@" value:@"PGMeaningfulEventMemoryTitleTypeBeaching2WithLocationName %@" table:@"Localizable"];
  v11 = [(PGTitleSpec *)v8 initWithFormat:v10 titleCategory:4];

  v12 = +[PGTitleSpecLocationArgument argumentWithLocationType:1 filterLocations:1];
  uint64_t v35 = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
  [(PGTitleSpec *)v11 setArguments:v13];

  [(PGTitleSpec *)v11 setHasLineBreak:1];
  v14 = [PGTitleSpec alloc];
  v15 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v16 = [v15 localizedStringForKey:@"PGMeaningfulEventMemoryTitleTypeBeaching3WithLocationName %@" value:@"PGMeaningfulEventMemoryTitleTypeBeaching3WithLocationName %@" table:@"Localizable"];
  uint64_t v17 = [(PGTitleSpec *)v14 initWithFormat:v16 titleCategory:4];

  v18 = +[PGTitleSpecLocationArgument argumentWithLocationType:1 filterLocations:1];
  v34 = v18;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
  [(PGTitleSpec *)v17 setArguments:v19];

  [(PGTitleSpec *)v17 setHasLineBreak:1];
  v20 = [PGTitleSpec alloc];
  v21 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v22 = [v21 localizedStringForKey:@"PGMeaningfulEventMemoryTitleTypeBeaching4" value:@"PGMeaningfulEventMemoryTitleTypeBeaching4" table:@"Localizable"];
  v23 = [(PGTitleSpec *)v20 initWithFormat:v22 titleCategory:1];

  v33[0] = v5;
  v33[1] = v11;
  void v33[2] = v17;
  v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:3];
  v25 = +[PGTitleSpecPool poolWithSpecs:v24];

  v32 = v23;
  id v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
  v27 = +[PGTitleSpecPool poolWithSpecs:v26];

  v31[0] = v25;
  v31[1] = v27;
  v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:2];
  v29 = +[PGTitleSpecCollection collectionWithSpecPools:v28];

  return v29;
}

+ (id)_specForWinterSport
{
  v19[1] = *MEMORY[0x1E4F143B8];
  v2 = [PGTitleSpec alloc];
  id v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"PGMeaningfulEventMemoryTitleTypeWinterSport1WithLocationName %@" value:@"PGMeaningfulEventMemoryTitleTypeWinterSport1WithLocationName %@" table:@"Localizable"];
  v5 = [(PGTitleSpec *)v2 initWithFormat:v4 titleCategory:4];

  v6 = +[PGTitleSpecLocationArgument argumentWithLocationType:5 filterLocations:1];
  v19[0] = v6;
  BOOL v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  [(PGTitleSpec *)v5 setArguments:v7];

  [(PGTitleSpec *)v5 setHasLineBreak:1];
  v8 = [PGTitleSpec alloc];
  id v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v10 = [v9 localizedStringForKey:@"PGMeaningfulEventMemoryTitleTypeWinterSport2" value:@"PGMeaningfulEventMemoryTitleTypeWinterSport2" table:@"Localizable"];
  v11 = [(PGTitleSpec *)v8 initWithFormat:v10 titleCategory:1];

  v18[0] = v5;
  v18[1] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  v13 = +[PGTitleSpecPool poolWithSpecs:v12];

  uint64_t v17 = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
  v15 = +[PGTitleSpecCollection collectionWithSpecPools:v14];

  return v15;
}

+ (id)_specForActivity
{
  v19[1] = *MEMORY[0x1E4F143B8];
  v2 = [PGTitleSpec alloc];
  id v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"PGMeaningfulEventMemoryTitleTypeActivity1WithLocationName %@" value:@"PGMeaningfulEventMemoryTitleTypeActivity1WithLocationName %@" table:@"Localizable"];
  v5 = [(PGTitleSpec *)v2 initWithFormat:v4 titleCategory:4];

  v6 = +[PGTitleSpecLocationArgument argumentWithLocationType:1 filterLocations:1];
  v19[0] = v6;
  BOOL v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  [(PGTitleSpec *)v5 setArguments:v7];

  [(PGTitleSpec *)v5 setHasLineBreak:1];
  v8 = [PGTitleSpec alloc];
  id v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v10 = [v9 localizedStringForKey:@"PGMeaningfulEventMemoryTitleTypeActivity2" value:@"PGMeaningfulEventMemoryTitleTypeActivity2" table:@"Localizable"];
  v11 = [(PGTitleSpec *)v8 initWithFormat:v10 titleCategory:0];

  v18[0] = v5;
  v18[1] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  v13 = +[PGTitleSpecPool poolWithSpecs:v12];

  uint64_t v17 = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
  v15 = +[PGTitleSpecCollection collectionWithSpecPools:v14];

  return v15;
}

+ (id)_specForPerformance
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v3 = [PGTitleSpec alloc];
  v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v5 = [v4 localizedStringForKey:@"PGMeaningfulEventMemoryTitleTypePerformance1WithLocationName %@" value:@"PGMeaningfulEventMemoryTitleTypePerformance1WithLocationName %@" table:@"Localizable"];
  v6 = [(PGTitleSpec *)v3 initWithFormat:v5 titleCategory:4];

  BOOL v7 = +[PGTitleSpecLocationArgument argumentWithLocationType:5 filterLocations:1];
  v27[0] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
  [(PGTitleSpec *)v6 setArguments:v8];

  [(PGTitleSpec *)v6 setHasLineBreak:1];
  id v9 = [PGTitleSpec alloc];
  v10 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v11 = [v10 localizedStringForKey:@"PGMeaningfulEventMemoryTitleTypePerformance2" value:@"PGMeaningfulEventMemoryTitleTypePerformance2" table:@"Localizable"];
  v12 = [(PGTitleSpec *)v9 initWithFormat:v11 titleCategory:1];

  v13 = [a1 _publicEventSpecEventName];
  id v26 = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
  v15 = +[PGTitleSpecPool poolWithSpecs:v14];

  v25 = v6;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
  uint64_t v17 = +[PGTitleSpecPool poolWithSpecs:v16];

  v24 = v12;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
  v19 = +[PGTitleSpecPool poolWithSpecs:v18];

  v23[0] = v15;
  v23[1] = v17;
  void v23[2] = v19;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:3];
  v21 = +[PGTitleSpecCollection collectionWithSpecPools:v20];

  return v21;
}

+ (id)_specForSportEvent
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v3 = [PGTitleSpec alloc];
  v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v5 = [v4 localizedStringForKey:@"PGMeaningfulEventMemoryTitleTypeSportEvent1WithLocationName %@" value:@"PGMeaningfulEventMemoryTitleTypeSportEvent1WithLocationName %@" table:@"Localizable"];
  v6 = [(PGTitleSpec *)v3 initWithFormat:v5 titleCategory:4];

  BOOL v7 = +[PGTitleSpecLocationArgument argumentWithLocationType:5 filterLocations:1];
  v24[0] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
  [(PGTitleSpec *)v6 setArguments:v8];

  [(PGTitleSpec *)v6 setHasLineBreak:1];
  id v9 = [PGTitleSpec alloc];
  v10 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v11 = [v10 localizedStringForKey:@"PGMeaningfulEventMemoryTitleTypeSportEvent2" value:@"PGMeaningfulEventMemoryTitleTypeSportEvent2" table:@"Localizable"];
  v12 = [(PGTitleSpec *)v9 initWithFormat:v11 titleCategory:1];

  v13 = [a1 _publicEventSpecEventName];
  v23 = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
  v15 = +[PGTitleSpecPool poolWithSpecs:v14];

  v22[0] = v6;
  v22[1] = v12;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
  uint64_t v17 = +[PGTitleSpecPool poolWithSpecs:v16];

  v21[0] = v15;
  v21[1] = v17;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
  v19 = +[PGTitleSpecCollection collectionWithSpecPools:v18];

  return v19;
}

+ (id)_specForNightOut
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v3 = [PGTitleSpec alloc];
  v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v5 = [v4 localizedStringForKey:@"PGMeaningfulEventMemoryTitleTypeNightOut1WithLocationName %@" value:@"PGMeaningfulEventMemoryTitleTypeNightOut1WithLocationName %@" table:@"Localizable"];
  v6 = [(PGTitleSpec *)v3 initWithFormat:v5 titleCategory:4];

  BOOL v7 = +[PGTitleSpecLocationArgument argumentWithLocationType:1 filterLocations:1];
  v34[0] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:1];
  [(PGTitleSpec *)v6 setArguments:v8];

  id v9 = [PGTitleSpec alloc];
  v10 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v11 = [v10 localizedStringForKey:@"PGMeaningfulEventMemoryTitleTypeNightOut2WithLocationName %@" value:@"PGMeaningfulEventMemoryTitleTypeNightOut2WithLocationName %@" table:@"Localizable"];
  v12 = [(PGTitleSpec *)v9 initWithFormat:v11 titleCategory:4];

  v13 = +[PGTitleSpecLocationArgument argumentWithLocationType:1 filterLocations:1];
  v33 = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
  [(PGTitleSpec *)v12 setArguments:v14];

  v15 = [PGTitleSpec alloc];
  v16 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v17 = [v16 localizedStringForKey:@"PGMeaningfulEventMemoryTitleTypeNightOut3" value:@"PGMeaningfulEventMemoryTitleTypeNightOut3" table:@"Localizable"];
  v18 = [(PGTitleSpec *)v15 initWithFormat:v17 titleCategory:1];

  v19 = [a1 _publicEventSpecEventName];
  v32 = v19;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
  v21 = +[PGTitleSpecPool poolWithSpecs:v20];

  v31[0] = v6;
  v31[1] = v12;
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:2];
  v23 = +[PGTitleSpecPool poolWithSpecs:v22];

  v30 = v18;
  v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
  v25 = +[PGTitleSpecPool poolWithSpecs:v24];

  v29[0] = v21;
  v29[1] = v23;
  void v29[2] = v25;
  id v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:3];
  v27 = +[PGTitleSpecCollection collectionWithSpecPools:v26];

  return v27;
}

+ (id)_specForEntertainment
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v3 = [[PGTitleSpec alloc] initWithFormat:@"%@" titleCategory:4];
  v4 = +[PGTitleSpecLocationArgument argumentWithLocationType:4 filterLocations:1];
  v34[0] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:1];
  [(PGTitleSpec *)v3 setArguments:v5];

  v6 = [PGTitleSpec alloc];
  BOOL v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v8 = [v7 localizedStringForKey:@"PGMeaningfulEventMemoryTitleTypeEntertainment1WithLocationName %@" value:@"PGMeaningfulEventMemoryTitleTypeEntertainment1WithLocationName %@" table:@"Localizable"];
  id v9 = [(PGTitleSpec *)v6 initWithFormat:v8 titleCategory:4];

  v10 = +[PGTitleSpecLocationArgument argumentWithLocationType:1 filterLocations:1];
  v33 = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
  [(PGTitleSpec *)v9 setArguments:v11];

  v12 = [PGTitleSpec alloc];
  v13 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v14 = [v13 localizedStringForKey:@"PGMeaningfulEventMemoryTitleTypeEntertainment2WithLocationName %@" value:@"PGMeaningfulEventMemoryTitleTypeEntertainment2WithLocationName %@" table:@"Localizable"];
  v15 = [(PGTitleSpec *)v12 initWithFormat:v14 titleCategory:4];

  v16 = +[PGTitleSpecLocationArgument argumentWithLocationType:1 filterLocations:1];
  v32 = v16;
  uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
  [(PGTitleSpec *)v15 setArguments:v17];

  v18 = [a1 _publicEventSpecEventName];
  v31 = v18;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
  v20 = +[PGTitleSpecPool poolWithSpecs:v19];

  v30 = v3;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
  v22 = +[PGTitleSpecPool poolWithSpecs:v21];

  v29[0] = v9;
  v29[1] = v15;
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
  v24 = +[PGTitleSpecPool poolWithSpecs:v23];

  v28[0] = v20;
  v28[1] = v22;
  v28[2] = v24;
  v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:3];
  id v26 = +[PGTitleSpecCollection collectionWithSpecPools:v25];

  return v26;
}

+ (id)_specForAnniversary
{
  v15[1] = *MEMORY[0x1E4F143B8];
  v2 = [PGTitleSpec alloc];
  id v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"PGMeaningfulEventMemoryTitleTypeAnniversary1WithYearOrdinal %@" value:@"PGMeaningfulEventMemoryTitleTypeAnniversary1WithYearOrdinal %@" table:@"Localizable"];
  v5 = [(PGTitleSpec *)v2 initWithFormat:v4 titleCategory:1];

  v6 = +[PGTitleSpecTimeArgument argumentWithTimeType:1];
  v15[0] = v6;
  BOOL v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  [(PGTitleSpec *)v5 setArguments:v7];

  [(PGTitleSpec *)v5 setHasLineBreak:1];
  v14 = v5;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
  id v9 = +[PGTitleSpecPool poolWithSpecs:v8];

  v13 = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
  v11 = +[PGTitleSpecCollection collectionWithSpecPools:v10];

  return v11;
}

+ (id)_specForBirthday
{
  v25[2] = *MEMORY[0x1E4F143B8];
  v2 = [PGTitleSpec alloc];
  id v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"PGPeopleBirthdayTitleFormatWithName %@ ordinalYearsString %@" value:@"PGPeopleBirthdayTitleFormatWithName %@ ordinalYearsString %@" table:@"Localizable"];
  v5 = [(PGTitleSpec *)v2 initWithFormat:v4 titleCategory:3];

  v6 = +[PGTitleSpecPeopleArgument argumentWithPeopleType:4];
  BOOL v7 = +[PGTitleSpecTimeArgument argumentWithTimeType:0];
  v25[0] = v6;
  v25[1] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
  [(PGTitleSpec *)v5 setArguments:v8];

  id v9 = [PGTitleSpec alloc];
  v10 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v11 = [v10 localizedStringForKey:@"PGPeopleBirthdayTitleFormatWithName %@" value:@"PGPeopleBirthdayTitleFormatWithName %@" table:@"Localizable"];
  v12 = [(PGTitleSpec *)v9 initWithFormat:v11 titleCategory:3];

  v24 = v6;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
  [(PGTitleSpec *)v12 setArguments:v13];

  v23 = v5;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
  v15 = +[PGTitleSpecPool poolWithSpecs:v14];

  v22 = v12;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
  uint64_t v17 = +[PGTitleSpecPool poolWithSpecs:v16];

  v21[0] = v15;
  v21[1] = v17;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
  v19 = +[PGTitleSpecCollection collectionWithSpecPools:v18];

  return v19;
}

+ (id)_specForWedding
{
  v18[1] = *MEMORY[0x1E4F143B8];
  v2 = [PGTitleSpec alloc];
  id v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"PGMeaningfulEventMemoryTitleTypeWedding1WithLocationName %@" value:@"PGMeaningfulEventMemoryTitleTypeWedding1WithLocationName %@" table:@"Localizable"];
  v5 = [(PGTitleSpec *)v2 initWithFormat:v4 titleCategory:4];

  v6 = +[PGTitleSpecLocationArgument argumentWithLocationType:1 filterLocations:1];
  v18[0] = v6;
  BOOL v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  [(PGTitleSpec *)v5 setArguments:v7];

  v17[0] = v5;
  v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v9 = [v8 localizedStringForKey:@"PGMeaningfulEventMemoryTitleTypeWedding2" value:@"PGMeaningfulEventMemoryTitleTypeWedding2" table:@"Localizable"];
  v10 = +[PGTitleSpec specWithFormat:v9 titleCategory:1];
  v17[1] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];

  v12 = +[PGTitleSpecPool poolWithSpecs:v11];
  v16 = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
  v14 = +[PGTitleSpecCollection collectionWithSpecPools:v13];

  return v14;
}

+ (id)_specForCelebration
{
  v20[4] = *MEMORY[0x1E4F143B8];
  v18 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v17 = [v18 localizedStringForKey:@"PGMeaningfulEventMemoryTitleTypeCelebration1" value:@"PGMeaningfulEventMemoryTitleTypeCelebration1" table:@"Localizable"];
  v16 = +[PGTitleSpec specWithFormat:v17 titleCategory:1];
  v20[0] = v16;
  v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"PGMeaningfulEventMemoryTitleTypeCelebration2" value:@"PGMeaningfulEventMemoryTitleTypeCelebration2" table:@"Localizable"];
  v4 = +[PGTitleSpec specWithFormat:v3 titleCategory:1];
  v20[1] = v4;
  v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:@"PGMeaningfulEventMemoryTitleTypeCelebration3" value:@"PGMeaningfulEventMemoryTitleTypeCelebration3" table:@"Localizable"];
  BOOL v7 = +[PGTitleSpec specWithFormat:v6 titleCategory:1];
  void v20[2] = v7;
  v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v9 = [v8 localizedStringForKey:@"PGMeaningfulEventMemoryTitleTypeCelebration4" value:@"PGMeaningfulEventMemoryTitleTypeCelebration4" table:@"Localizable"];
  v10 = +[PGTitleSpec specWithFormat:v9 titleCategory:1];
  v20[3] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:4];

  v12 = +[PGTitleSpecPool poolWithSpecs:v11];
  v19 = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
  v14 = +[PGTitleSpecCollection collectionWithSpecPools:v13];

  return v14;
}

+ (id)specCollectionForMeaningLabel:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isEqualToString:@"Celebration"])
  {
    uint64_t v5 = [a1 _specForCelebration];
LABEL_37:
    v6 = (void *)v5;
    goto LABEL_38;
  }
  if ([v4 isEqualToString:@"Wedding"])
  {
    uint64_t v5 = [a1 _specForWedding];
    goto LABEL_37;
  }
  if ([v4 isEqualToString:@"Birthday"])
  {
    uint64_t v5 = [a1 _specForBirthday];
    goto LABEL_37;
  }
  if ([v4 isEqualToString:@"Anniversary"])
  {
    uint64_t v5 = [a1 _specForAnniversary];
    goto LABEL_37;
  }
  if ([v4 isEqualToString:@"Entertainment"])
  {
    uint64_t v5 = [a1 _specForEntertainment];
    goto LABEL_37;
  }
  if ([v4 isEqualToString:@"NightOut"])
  {
    uint64_t v5 = [a1 _specForNightOut];
    goto LABEL_37;
  }
  if ([v4 isEqualToString:@"SportEvent"])
  {
    uint64_t v5 = [a1 _specForSportEvent];
    goto LABEL_37;
  }
  if ([v4 isEqualToString:@"Performance"])
  {
    uint64_t v5 = [a1 _specForPerformance];
    goto LABEL_37;
  }
  if ([v4 isEqualToString:@"Activity"])
  {
    uint64_t v5 = [a1 _specForActivity];
    goto LABEL_37;
  }
  if ([v4 isEqualToString:@"WinterSport"])
  {
    uint64_t v5 = [a1 _specForWinterSport];
    goto LABEL_37;
  }
  if ([v4 isEqualToString:@"Beaching"])
  {
    uint64_t v5 = [a1 _specForBeaching];
    goto LABEL_37;
  }
  if ([v4 isEqualToString:@"Hiking"])
  {
    uint64_t v5 = [a1 _specForHiking];
    goto LABEL_37;
  }
  if ([v4 isEqualToString:@"Climbing"])
  {
    uint64_t v5 = [a1 _specForClimbing];
    goto LABEL_37;
  }
  if ([v4 isEqualToString:@"Diving"])
  {
    uint64_t v5 = [a1 _specForDiving];
    goto LABEL_37;
  }
  if ([v4 isEqualToString:@"Breakfast"])
  {
    uint64_t v5 = [a1 _specForBreakfast];
    goto LABEL_37;
  }
  if ([v4 isEqualToString:@"Lunch"])
  {
    uint64_t v5 = [a1 _specForLunch];
    goto LABEL_37;
  }
  if ([v4 isEqualToString:@"Dinner"])
  {
    uint64_t v5 = [a1 _specForDinner];
    goto LABEL_37;
  }
  if ([v4 isEqualToString:@"Gathering"])
  {
    uint64_t v5 = [a1 _specForGathering];
    goto LABEL_37;
  }
  v8 = +[PGLogging sharedLogging];
  id v9 = [v8 loggingConnection];

  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v10 = 138412290;
    id v11 = v4;
    _os_log_impl(&dword_1D1805000, v9, OS_LOG_TYPE_INFO, "No spec for %@", (uint8_t *)&v10, 0xCu);
  }

  v6 = 0;
LABEL_38:

  return v6;
}

+ (id)specCollectionForMemoryCategory:(unint64_t)a3 subcategory:(unint64_t)a4 personNodes:(id)a5
{
  id v8 = a5;
  switch(a4)
  {
    case 0xD4uLL:
      uint64_t v9 = [a1 _specForPet];
      goto LABEL_14;
    case 0xD8uLL:
      uint64_t v9 = [a1 _specForPeopleVisiting];
      goto LABEL_14;
    case 0xD9uLL:
      if (a3 == 219)
      {
        uint64_t v9 = [a1 _specForBaby];
      }
      else
      {
        if (a3 != 220) {
          goto LABEL_11;
        }
        uint64_t v9 = [a1 _specForBabyGrowingUp];
      }
      goto LABEL_14;
    case 0xDAuLL:
      uint64_t v9 = [a1 _specForFoodieWithPersonNodes:v8 locationName:0 tripTitleLocationType:0 allowInspiredTastesTitle:0 genericOnly:0];
      goto LABEL_14;
    default:
      if (a3 == 214)
      {
        uint64_t v9 = [a1 _specForThrowbackThursday];
      }
      else
      {
        if (a3 != 219)
        {
LABEL_11:
          int v10 = 0;
          goto LABEL_15;
        }
        uint64_t v9 = [a1 _specForEarlyMomentsWithPersonNodes:v8];
      }
LABEL_14:
      int v10 = (void *)v9;
LABEL_15:

      return v10;
  }
}

+ (id)specCollectionForMemoryCategory:(unint64_t)a3 subcategory:(unint64_t)a4
{
  return (id)[a1 specCollectionForMemoryCategory:a3 subcategory:a4 personNodes:0];
}

@end
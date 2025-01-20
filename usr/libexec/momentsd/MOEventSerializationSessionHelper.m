@interface MOEventSerializationSessionHelper
- (MOEventSerializationSessionHelper)initWithRandomization:(BOOL)a3;
- (id)serializeEvent:(id)a3;
- (id)serializeEventBundle:(id)a3;
- (void)_savePropertyToDictionary:(id)a3 withKey:(id)a4 andValue:(id)a5;
@end

@implementation MOEventSerializationSessionHelper

- (MOEventSerializationSessionHelper)initWithRandomization:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)MOEventSerializationSessionHelper;
  v4 = [(MOEventSerializationSessionHelper *)&v10 init];
  if (v4)
  {
    +[NSSet setWithObjects:](NSSet, "setWithObjects:", @"eventPlaceName", @"eventLocationLatitude", @"eventLocationLongitude", @"eventMediaTitle", @"eventMediaArtist", @"localIdentifier", @"name", @"eventContactGivenName", @"eventContactFamilyName", @"eventLocalizedFullName", @"eventItemURL", @"eventPhotoMemoryTitle", @"eventMediaPlaySessionsTitle", @"eventMediaPlaySessionsAlbum", @"eventMediaPlaySessionsGenre", @"eventMediaPlaySessionsArtist", @"bundlePlaceName",
      @"bundleLocationLatitude",
      @"bundleLocationLongitude",
      @"bundleResourceName",
      @"bundleResourceAssets",
      @"bundlePromptLanguage",
      @"bundleConcurrentMediaActionName",
      @"bundleEnclosingArea",
      @"media",
      @"media_name",
      @"city",
      @"place",
      @"Place",
      @"place_string",
      @"person",
      @"person_string",
      @"default_label",
      @"person_",
      @"me_person",
      @"me_person_identified",
      @"header",
      @"title",
      @"place_",
      @"Place_",
      @"media_type",
      @"media_album",
      @"unique_action_type_count",
      @"unique_activity_count",
      @"unique_place_count",
      @"unique_action_",
      @"unique_place_",
      @"Unique_place_",
      @"unique_city_",
      @"reflective_interval",
      @"valence_classification",
      @"state_of_mind_label_count",
      @"state_of_mind_label_1",
      @"state_of_mind_label_2",
      @"no_savoring_prompt",
      @"no_reappraisal_prompt",
    uint64_t v5 = 0);
    randomizedKeys = v4->_randomizedKeys;
    v4->_randomizedKeys = (NSSet *)v5;

    v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    randomMapping = v4->_randomMapping;
    v4->_randomMapping = v7;

    v4->_shouldAvoidRandomization = !a3;
  }
  return v4;
}

- (id)serializeEvent:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = objc_opt_new();
    v6 = [v4 eventIdentifier];
    v7 = [v6 UUIDString];
    [(MOEventSerializationSessionHelper *)self _savePropertyToDictionary:v5 withKey:@"eventID" andValue:v7];

    v8 = [v4 startDate];
    [v8 timeIntervalSinceReferenceDate];
    v9 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [(MOEventSerializationSessionHelper *)self _savePropertyToDictionary:v5 withKey:@"eventStartDate" andValue:v9];

    objc_super v10 = [v4 endDate];
    [v10 timeIntervalSinceReferenceDate];
    v11 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [(MOEventSerializationSessionHelper *)self _savePropertyToDictionary:v5 withKey:@"eventEndDate" andValue:v11];

    v12 = [v4 creationDate];
    [v12 timeIntervalSinceReferenceDate];
    v13 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [(MOEventSerializationSessionHelper *)self _savePropertyToDictionary:v5 withKey:@"eventCreationDate" andValue:v13];

    v14 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v4 provider]);
    [(MOEventSerializationSessionHelper *)self _savePropertyToDictionary:v5 withKey:@"eventProvider" andValue:v14];

    v15 = [v4 workoutType];
    [(MOEventSerializationSessionHelper *)self _savePropertyToDictionary:v5 withKey:@"eventWorkoutType" andValue:v15];

    v16 = [v4 workoutTotalDistance];
    [(MOEventSerializationSessionHelper *)self _savePropertyToDictionary:v5 withKey:@"eventWorkoutTotalDistance" andValue:v16];

    v17 = [v4 workoutTotalEnergyBurned];
    [(MOEventSerializationSessionHelper *)self _savePropertyToDictionary:v5 withKey:@"eventWorkoutTotalEnergyBurned" andValue:v17];

    v18 = [v4 workoutDuration];
    [(MOEventSerializationSessionHelper *)self _savePropertyToDictionary:v5 withKey:@"eventWorkoutDuration" andValue:v18];

    v19 = [v4 motionStepCount];
    [(MOEventSerializationSessionHelper *)self _savePropertyToDictionary:v5 withKey:@"eventMotionStepCount" andValue:v19];

    v20 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 isFitnessPlusSession]);
    [(MOEventSerializationSessionHelper *)self _savePropertyToDictionary:v5 withKey:@"eventIsFitnessPlusSession" andValue:v20];

    v21 = [v4 placeName];
    [(MOEventSerializationSessionHelper *)self _savePropertyToDictionary:v5 withKey:@"eventPlaceName" andValue:v21];

    v22 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v4 placeType]);
    [(MOEventSerializationSessionHelper *)self _savePropertyToDictionary:v5 withKey:@"eventPlaceType" andValue:v22];

    v23 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v4 placeUserType]);
    [(MOEventSerializationSessionHelper *)self _savePropertyToDictionary:v5 withKey:@"eventPlaceUserType" andValue:v23];

    v24 = [v4 poiCategory];
    [(MOEventSerializationSessionHelper *)self _savePropertyToDictionary:v5 withKey:@"eventPOICategory" andValue:v24];

    v25 = [v4 location];

    if (v25)
    {
      v26 = [v4 location];
      [v26 latitude];
      v27 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      [(MOEventSerializationSessionHelper *)self _savePropertyToDictionary:v5 withKey:@"eventLocationLatitude" andValue:v27];

      v28 = [v4 location];
      [v28 longitude];
      v29 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      [(MOEventSerializationSessionHelper *)self _savePropertyToDictionary:v5 withKey:@"eventLocationLongitude" andValue:v29];
    }
    v30 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v4 placeDiscovery]);
    [(MOEventSerializationSessionHelper *)self _savePropertyToDictionary:v5 withKey:@"eventPlaceDiscovery" andValue:v30];

    v31 = [v4 mediaTitle];
    [(MOEventSerializationSessionHelper *)self _savePropertyToDictionary:v5 withKey:@"eventMediaTitle" andValue:v31];

    v32 = [v4 mediaArtist];
    [(MOEventSerializationSessionHelper *)self _savePropertyToDictionary:v5 withKey:@"eventMediaArtist" andValue:v32];

    v33 = [v4 mediaSumTimePlayed];
    [(MOEventSerializationSessionHelper *)self _savePropertyToDictionary:v5 withKey:@"eventMediaSumTimePlayed" andValue:v33];

    v34 = [v4 mediaRepetitions];
    [(MOEventSerializationSessionHelper *)self _savePropertyToDictionary:v5 withKey:@"eventMediaRepititions" andValue:v34];

    v35 = [v4 mediaEvent];
    v36 = [v35 mediaFirstPartyTimePlayedRatio];
    [(MOEventSerializationSessionHelper *)self _savePropertyToDictionary:v5 withKey:@"eventMediaFirstPartyTimePlayedRatio" andValue:v36];

    v37 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v4 category]);
    [(MOEventSerializationSessionHelper *)self _savePropertyToDictionary:v5 withKey:@"eventCategory" andValue:v37];

    v38 = [v4 pCount];
    [(MOEventSerializationSessionHelper *)self _savePropertyToDictionary:v5 withKey:@"peopleCount" andValue:v38];

    v39 = [v4 densityScore];
    [(MOEventSerializationSessionHelper *)self _savePropertyToDictionary:v5 withKey:@"peopleDensity" andValue:v39];

    v40 = [v4 densityScanDuration];
    [(MOEventSerializationSessionHelper *)self _savePropertyToDictionary:v5 withKey:@"peopleDensityScanDuration" andValue:v40];

    v41 = objc_opt_new();
    v42 = [v4 mediaPlaySessions];
    v127[0] = _NSConcreteStackBlock;
    v127[1] = 3221225472;
    v127[2] = __52__MOEventSerializationSessionHelper_serializeEvent___block_invoke;
    v127[3] = &unk_1002CBA30;
    v127[4] = self;
    id v43 = v41;
    id v128 = v43;
    [v42 enumerateObjectsUsingBlock:v127];

    v119 = v43;
    [(MOEventSerializationSessionHelper *)self _savePropertyToDictionary:v5 withKey:@"eventMediaPlaySessions" andValue:v43];
    uint64_t v44 = objc_opt_new();
    v45 = objc_opt_new();
    v46 = [v4 extendedAttributes];
    v47 = [v46 photoMomentPersons];
    v125[0] = _NSConcreteStackBlock;
    v125[1] = 3221225472;
    v125[2] = __52__MOEventSerializationSessionHelper_serializeEvent___block_invoke_2;
    v125[3] = &unk_1002CBA58;
    v125[4] = self;
    id v48 = v45;
    id v126 = v48;
    [v47 enumerateObjectsUsingBlock:v125];

    if ([v48 count]) {
      [(MOEventSerializationSessionHelper *)self _savePropertyToDictionary:v44 withKey:@"persons" andValue:v48];
    }
    v117 = v48;
    v49 = [v4 extendedAttributes];
    v50 = [v49 photoMomentLocalIdentifier];
    [(MOEventSerializationSessionHelper *)self _savePropertyToDictionary:v44 withKey:@"localIdentifier" andValue:v50];

    v51 = [v4 extendedAttributes];
    v52 = [v51 photoMomentInferences];
    [(MOEventSerializationSessionHelper *)self _savePropertyToDictionary:v44 withKey:@"inferences" andValue:v52];

    v118 = (void *)v44;
    [(MOEventSerializationSessionHelper *)self _savePropertyToDictionary:v5 withKey:@"eventExtendedAttributes" andValue:v44];
    v53 = [v4 interactionContactScore];
    [(MOEventSerializationSessionHelper *)self _savePropertyToDictionary:v5 withKey:@"eventContactScore" andValue:v53];

    v54 = [v4 interactionScoredContact];
    [v54 score];
    v55 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [(MOEventSerializationSessionHelper *)self _savePropertyToDictionary:v5 withKey:@"eventScoredContactScore" andValue:v55];

    v56 = [v4 interactionScoredContact];
    v57 = [v56 contact];
    v58 = [v57 givenName];
    [(MOEventSerializationSessionHelper *)self _savePropertyToDictionary:v5 withKey:@"eventContactGivenName" andValue:v58];

    v59 = [v4 interactionScoredContact];
    v60 = [v59 contact];
    v61 = [v60 familyName];
    [(MOEventSerializationSessionHelper *)self _savePropertyToDictionary:v5 withKey:@"eventContactFamilyName" andValue:v61];

    v62 = [v4 interactionScoredContact];
    v63 = [v62 contact];
    v64 = [v63 localizedFullName];
    [(MOEventSerializationSessionHelper *)self _savePropertyToDictionary:v5 withKey:@"eventLocalizedFullName" andValue:v64];

    v65 = objc_opt_new();
    v66 = [v4 interactionContacts];
    v122[0] = _NSConcreteStackBlock;
    v122[1] = 3221225472;
    v122[2] = __52__MOEventSerializationSessionHelper_serializeEvent___block_invoke_3;
    v122[3] = &unk_1002CBA80;
    v122[4] = self;
    id v67 = v4;
    id v123 = v67;
    id v68 = v65;
    id v124 = v68;
    [v66 enumerateObjectsUsingBlock:v122];

    v116 = v68;
    [(MOEventSerializationSessionHelper *)self _savePropertyToDictionary:v5 withKey:@"eventInteractionContacts" andValue:v68];
    v69 = objc_opt_new();
    v70 = [v67 interactions];
    v120[0] = _NSConcreteStackBlock;
    v120[1] = 3221225472;
    v120[2] = __52__MOEventSerializationSessionHelper_serializeEvent___block_invoke_4;
    v120[3] = &unk_1002CBAA8;
    v120[4] = self;
    id v71 = v69;
    id v121 = v71;
    [v70 enumerateObjectsUsingBlock:v120];

    v115 = v71;
    [(MOEventSerializationSessionHelper *)self _savePropertyToDictionary:v5 withKey:@"eventInteractions" andValue:v71];
    v72 = [v67 itemURL];
    v73 = [v72 absoluteString];

    [(MOEventSerializationSessionHelper *)self _savePropertyToDictionary:v5 withKey:@"eventItemURL" andValue:v73];
    if (!self->_shouldAvoidRandomization && v73)
    {
      if ([v73 hasPrefix:@"https://apple.news"])
      {
        v74 = [v73 componentsSeparatedByString:@"https://apple.news"];
        v75 = [v5 objectForKeyedSubscript:@"eventItemURL"];
        if (v75 && [v74 count] == (id)2)
        {
          v76 = [@"https://apple.news" stringByAppendingString:v75];
          [v5 setObject:v76 forKeyedSubscript:@"eventItemURL"];
        }
      }
      if ([v73 hasPrefix:@"https://music.apple.com"])
      {
        v77 = [v73 componentsSeparatedByString:@"https://music.apple.com"];
        v78 = [v5 objectForKeyedSubscript:@"eventItemURL"];
        if (v78 && [v77 count] == (id)2)
        {
          v79 = [@"https://music.apple.com" stringByAppendingString:v78];
          [v5 setObject:v79 forKeyedSubscript:@"eventItemURL"];
        }
      }
      if ([v73 hasPrefix:@"https://podcasts.apple.com"])
      {
        v80 = [v73 componentsSeparatedByString:@"https://podcasts.apple.com"];
        v81 = [v5 objectForKeyedSubscript:@"eventItemURL"];
        if (v81 && [v80 count] == (id)2)
        {
          v82 = [@"https://podcasts.apple.com" stringByAppendingString:v81];
          [v5 setObject:v82 forKeyedSubscript:@"eventItemURL"];
        }
      }
      if ([v73 hasPrefix:@"https://tv.apple.com"])
      {
        v83 = [v73 componentsSeparatedByString:@"https://tv.apple.com"];
        v84 = [v5 objectForKeyedSubscript:@"eventItemURL"];
        if (v84 && [v83 count] == (id)2)
        {
          v85 = [@"https://tv.apple.com" stringByAppendingString:v84];
          [v5 setObject:v85 forKeyedSubscript:@"eventItemURL"];
        }
      }
    }
    v86 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v67 itemShareDirection]);
    [(MOEventSerializationSessionHelper *)self _savePropertyToDictionary:v5 withKey:@"eventItemShareDirection" andValue:v86];

    v87 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v67 itemIsPinned]);
    [(MOEventSerializationSessionHelper *)self _savePropertyToDictionary:v5 withKey:@"eventItemIsPinned" andValue:v87];

    v88 = [v67 itemAttributionsCount];
    [(MOEventSerializationSessionHelper *)self _savePropertyToDictionary:v5 withKey:@"eventItemAttributionsCount" andValue:v88];

    v89 = [v67 appBundle];
    [(MOEventSerializationSessionHelper *)self _savePropertyToDictionary:v5 withKey:@"eventAppBundle" andValue:v89];

    v90 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v67 fromFirstParty]);
    [(MOEventSerializationSessionHelper *)self _savePropertyToDictionary:v5 withKey:@"eventFromFirstParty" andValue:v90];

    v91 = [v67 patterns];
    [(MOEventSerializationSessionHelper *)self _savePropertyToDictionary:v5 withKey:@"eventPatterns" andValue:v91];

    v92 = [v67 photoMemoryTitle];
    [(MOEventSerializationSessionHelper *)self _savePropertyToDictionary:v5 withKey:@"eventPhotoMemoryTitle" andValue:v92];

    v93 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v67 photoMemoryCategory]);
    [(MOEventSerializationSessionHelper *)self _savePropertyToDictionary:v5 withKey:@"eventPhotoMemoryCategory" andValue:v93];

    v94 = [v67 photoEvent];
    v95 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v94 photoMemorySubCategory]);
    [(MOEventSerializationSessionHelper *)self _savePropertyToDictionary:v5 withKey:@"eventPhotoMemorySubCategory" andValue:v95];

    v96 = [v67 photoMemoryTitle];
    [(MOEventSerializationSessionHelper *)self _savePropertyToDictionary:v5 withKey:@"eventPhotoMemoryTitle" andValue:v96];

    v97 = [v67 photoEvent];
    [v97 photoMemoryRelevanceScore];
    v98 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [(MOEventSerializationSessionHelper *)self _savePropertyToDictionary:v5 withKey:@"eventPhotoMemoryRelevanceScore" andValue:v98];

    v99 = [v67 photoEvent];
    v100 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v99 photoMemoryIsFavorite]);
    [(MOEventSerializationSessionHelper *)self _savePropertyToDictionary:v5 withKey:@"eventPhotoMemoryIsFavorite" andValue:v100];

    v101 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v67 timeAtHomeSubType]);
    [(MOEventSerializationSessionHelper *)self _savePropertyToDictionary:v5 withKey:@"eventTimeAtHomeSubtype" andValue:v101];

    v102 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v67 motionType]);
    [(MOEventSerializationSessionHelper *)self _savePropertyToDictionary:v5 withKey:@"eventMotionType" andValue:v102];

    [v67 familiarityIndexLOI];
    v103 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [(MOEventSerializationSessionHelper *)self _savePropertyToDictionary:v5 withKey:@"eventFamiliarityIndexLOI" andValue:v103];

    [v67 placeNameConfidence];
    v104 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [(MOEventSerializationSessionHelper *)self _savePropertyToDictionary:v5 withKey:@"eventPlaceNameConfidence" andValue:v104];

    [v67 confidenceScore];
    v105 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [(MOEventSerializationSessionHelper *)self _savePropertyToDictionary:v5 withKey:@"eventConfidenceScore" andValue:v105];

    v106 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v67 lifeEventCategory]);
    [(MOEventSerializationSessionHelper *)self _savePropertyToDictionary:v5 withKey:@"eventLifeEventCategory" andValue:v106];

    v107 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v67 mode]);
    [(MOEventSerializationSessionHelper *)self _savePropertyToDictionary:v5 withKey:@"eventLocationMode" andValue:v107];

    v108 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v67 placeSource]);
    [(MOEventSerializationSessionHelper *)self _savePropertyToDictionary:v5 withKey:@"eventPlaceSource" andValue:v108];

    v109 = [v67 routineEvent];

    if (v109)
    {
      v110 = [v67 routineEvent];
      v111 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v110 isPreOnboardedVisit]);
      [(MOEventSerializationSessionHelper *)self _savePropertyToDictionary:v5 withKey:@"eventRoutineIsPreOnboardedVisit" andValue:v111];

      v112 = [v67 routineEvent];
      v113 = [v112 poiCategory];
      [(MOEventSerializationSessionHelper *)self _savePropertyToDictionary:v5 withKey:@"eventRoutineEventPOICategory" andValue:v113];
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

void __52__MOEventSerializationSessionHelper_serializeEvent___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = a2;
    id v22 = (id)objc_opt_new();
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = [v3 title];
    [v4 _savePropertyToDictionary:v22 withKey:@"eventMediaPlaySessionsTitle" andValue:v5];

    v6 = *(void **)(a1 + 32);
    v7 = [v3 album];
    [v6 _savePropertyToDictionary:v22 withKey:@"eventMediaPlaySessionsAlbum" andValue:v7];

    v8 = *(void **)(a1 + 32);
    v9 = [v3 bundleId];
    [v8 _savePropertyToDictionary:v22 withKey:@"eventMediaPlaySessionsBundleId" andValue:v9];

    objc_super v10 = *(void **)(a1 + 32);
    v11 = [v3 genre];
    [v10 _savePropertyToDictionary:v22 withKey:@"eventMediaPlaySessionsGenre" andValue:v11];

    v12 = *(void **)(a1 + 32);
    v13 = [v3 mediaType];
    [v12 _savePropertyToDictionary:v22 withKey:@"eventMediaPlaySessionsMediaType" andValue:v13];

    v14 = *(void **)(a1 + 32);
    v15 = [v3 artist];
    [v14 _savePropertyToDictionary:v22 withKey:@"eventMediaPlaySessionsArtist" andValue:v15];

    v16 = *(void **)(a1 + 32);
    v17 = [v3 startDate];
    [v17 timeIntervalSinceReferenceDate];
    v18 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v16 _savePropertyToDictionary:v22 withKey:@"eventMediaPlaySessionsStartDate" andValue:v18];

    v19 = *(void **)(a1 + 32);
    v20 = [v3 endDate];

    [v20 timeIntervalSinceReferenceDate];
    v21 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v19 _savePropertyToDictionary:v22 withKey:@"eventMediaPlaySessionsEndDate" andValue:v21];

    [*(id *)(a1 + 40) addObject:v22];
  }
}

void __52__MOEventSerializationSessionHelper_serializeEvent___block_invoke_2(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = a2;
    id v9 = (id)objc_opt_new();
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = [v3 name];
    [v4 _savePropertyToDictionary:v9 withKey:@"name" andValue:v5];

    v6 = *(void **)(a1 + 32);
    v7 = [v3 family];

    [v6 _savePropertyToDictionary:v9 withKey:@"family" andValue:v7];
    v8 = v9;
    if (v9)
    {
      [*(id *)(a1 + 40) addObject:v9];
      v8 = v9;
    }
  }
}

void __52__MOEventSerializationSessionHelper_serializeEvent___block_invoke_3(id *a1, void *a2)
{
  if (a2)
  {
    id v3 = a2;
    id v17 = (id)objc_opt_new();
    id v4 = a1[4];
    [v3 score];
    uint64_t v5 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v4 _savePropertyToDictionary:v17 withKey:@"eventScoredContactScore" andValue:v5];

    id v6 = a1[4];
    v7 = [v3 contact];
    v8 = [v7 givenName];
    [v6 _savePropertyToDictionary:v17 withKey:@"eventContactGivenName" andValue:v8];

    id v9 = a1[4];
    objc_super v10 = [v3 contact];
    v11 = [v10 familyName];
    [v9 _savePropertyToDictionary:v17 withKey:@"eventContactFamilyName" andValue:v11];

    id v12 = a1[4];
    v13 = [v3 contact];
    v14 = [v13 localizedFullName];
    [v12 _savePropertyToDictionary:v17 withKey:@"eventLocalizedFullName" andValue:v14];

    v15 = [a1[5] contactClassificationMap];
    v16 = [v15 objectForKey:v3];

    if (v16) {
      [a1[4] _savePropertyToDictionary:v17 withKey:@"eventContactClassification" andValue:v16];
    }
    [a1[6] addObject:v17];
  }
}

void __52__MOEventSerializationSessionHelper_serializeEvent___block_invoke_4(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = a2;
    id v15 = (id)objc_opt_new();
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = [v3 startDate];
    [v5 timeIntervalSinceReferenceDate];
    id v6 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v4 _savePropertyToDictionary:v15 withKey:@"eventInteractionsStartDate" andValue:v6];

    v7 = *(void **)(a1 + 32);
    v8 = [v3 endDate];
    [v8 timeIntervalSinceReferenceDate];
    id v9 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v7 _savePropertyToDictionary:v15 withKey:@"eventInteractionsEndDate" andValue:v9];

    objc_super v10 = *(void **)(a1 + 32);
    v11 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v3 mechanism]);
    [v10 _savePropertyToDictionary:v15 withKey:@"eventInteractionsMechanism" andValue:v11];

    id v12 = *(void **)(a1 + 32);
    id v13 = [v3 direction];

    v14 = +[NSNumber numberWithInteger:v13];
    [v12 _savePropertyToDictionary:v15 withKey:@"eventInteractionsDirection" andValue:v14];

    [*(id *)(a1 + 40) addObject:v15];
  }
}

- (id)serializeEventBundle:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = objc_opt_new();
    [v4 buildResources];
    id v6 = [v4 bundleIdentifier];
    v7 = [v6 UUIDString];
    [(MOEventSerializationSessionHelper *)self _savePropertyToDictionary:v5 withKey:@"bundleID" andValue:v7];

    v8 = [v4 suggestionID];
    id v9 = [v8 UUIDString];
    [(MOEventSerializationSessionHelper *)self _savePropertyToDictionary:v5 withKey:@"SuggestionID" andValue:v9];

    objc_super v10 = [v4 startDate];
    [v10 timeIntervalSinceReferenceDate];
    v11 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [(MOEventSerializationSessionHelper *)self _savePropertyToDictionary:v5 withKey:@"bundleStartDate" andValue:v11];

    id v12 = [v4 endDate];
    [v12 timeIntervalSinceReferenceDate];
    id v13 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [(MOEventSerializationSessionHelper *)self _savePropertyToDictionary:v5 withKey:@"bundleEndDate" andValue:v13];

    v14 = [v4 creationDate];
    [v14 timeIntervalSinceReferenceDate];
    id v15 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [(MOEventSerializationSessionHelper *)self _savePropertyToDictionary:v5 withKey:@"bundleCreationDate" andValue:v15];

    v16 = [v4 firstCreationDate];
    [v16 timeIntervalSinceReferenceDate];
    id v17 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [(MOEventSerializationSessionHelper *)self _savePropertyToDictionary:v5 withKey:@"bundleFirstCreationDate" andValue:v17];

    v18 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 filtered]);
    [(MOEventSerializationSessionHelper *)self _savePropertyToDictionary:v5 withKey:@"bundleFiltered" andValue:v18];

    v19 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v4 bundleSubType]);
    [(MOEventSerializationSessionHelper *)self _savePropertyToDictionary:v5 withKey:@"bundleSubType" andValue:v19];

    v20 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v4 bundleSuperType]);
    [(MOEventSerializationSessionHelper *)self _savePropertyToDictionary:v5 withKey:@"bundleSuperType" andValue:v20];

    v21 = objc_opt_new();
    id v22 = [v4 events];
    v245[0] = _NSConcreteStackBlock;
    v245[1] = 3221225472;
    v245[2] = __58__MOEventSerializationSessionHelper_serializeEventBundle___block_invoke;
    v245[3] = &unk_1002CBAD0;
    id v23 = v21;
    id v246 = v23;
    [v22 enumerateObjectsUsingBlock:v245];

    v220 = v23;
    [(MOEventSerializationSessionHelper *)self _savePropertyToDictionary:v5 withKey:@"bundleEvents" andValue:v23];
    v24 = [v4 subBundleIDs];
    [(MOEventSerializationSessionHelper *)self _savePropertyToDictionary:v5 withKey:@"subBundleIDs" andValue:v24];

    v25 = [v4 subSuggestionIDs];
    v228 = self;
    v222 = (void *)v5;
    [(MOEventSerializationSessionHelper *)self _savePropertyToDictionary:v5 withKey:@"subSuggestionIDs" andValue:v25];

    uint64_t v26 = objc_opt_new();
    long long v241 = 0u;
    long long v242 = 0u;
    long long v243 = 0u;
    long long v244 = 0u;
    v227 = v4;
    v27 = [v4 metaData];
    id v28 = [v27 countByEnumeratingWithState:&v241 objects:v248 count:16];
    if (v28)
    {
      id v29 = v28;
      uint64_t v30 = *(void *)v242;
      do
      {
        for (i = 0; i != v29; i = (char *)i + 1)
        {
          if (*(void *)v242 != v30) {
            objc_enumerationMutation(v27);
          }
          id v32 = *(id *)(*((void *)&v241 + 1) + 8 * i);
          objc_opt_class();
          v33 = v32;
          if (objc_opt_isKindOfClass())
          {
            v33 = [v32 stringValue];
          }
          v34 = [v227 metaData];
          v35 = [v34 objectForKey:v32];
          [(MOEventSerializationSessionHelper *)v228 _savePropertyToDictionary:v26 withKey:v33 andValue:v35];
        }
        id v29 = [v27 countByEnumeratingWithState:&v241 objects:v248 count:16];
      }
      while (v29);
    }

    v36 = v228;
    v219 = (void *)v26;
    [(MOEventSerializationSessionHelper *)v228 _savePropertyToDictionary:v222 withKey:@"bundleMetadata" andValue:v26];
    id v4 = v227;
    if (v228->_shouldAvoidRandomization)
    {
      v37 = [v227 labels];
      [(MOEventSerializationSessionHelper *)v228 _savePropertyToDictionary:v222 withKey:@"bundleLabels" andValue:v37];
    }
    v38 = [v227 promptLanguages];
    [(MOEventSerializationSessionHelper *)v228 _savePropertyToDictionary:v222 withKey:@"bundlePromptLanguages" andValue:v38];

    v39 = [v227 promptLanguage];
    [(MOEventSerializationSessionHelper *)v228 _savePropertyToDictionary:v222 withKey:@"bundlePromptLanguage" andValue:v39];

    v40 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v227 interfaceType]);
    [(MOEventSerializationSessionHelper *)v228 _savePropertyToDictionary:v222 withKey:@"bundleInterfaceType" andValue:v40];

    v41 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v227 summarizationGranularity]);
    [(MOEventSerializationSessionHelper *)v228 _savePropertyToDictionary:v222 withKey:@"bundleSummarizationGranularity" andValue:v41];

    v42 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v227 isAggregatedAndSuppressed]);
    [(MOEventSerializationSessionHelper *)v228 _savePropertyToDictionary:v222 withKey:@"bundleIsAggregatedAndSuppressed" andValue:v42];

    uint64_t v43 = objc_opt_new();
    uint64_t v44 = [v227 action];

    v221 = (void *)v43;
    if (v44)
    {
      v45 = [v227 action];
      v46 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v45 actionType]);
      [(MOEventSerializationSessionHelper *)v228 _savePropertyToDictionary:v43 withKey:@"bundleActionType" andValue:v46];

      v47 = [v227 action];
      id v48 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v47 actionSubtype]);
      [(MOEventSerializationSessionHelper *)v228 _savePropertyToDictionary:v43 withKey:@"bundleActionSubType" andValue:v48];

      v49 = [v227 action];
      [v49 actionNameConfidence];
      v50 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      [(MOEventSerializationSessionHelper *)v228 _savePropertyToDictionary:v43 withKey:@"bundleActionNameConfidence" andValue:v50];

      if ([v227 interfaceType] == (id)10 && !v228->_shouldAvoidRandomization)
      {
        [(MOEventSerializationSessionHelper *)v228 _savePropertyToDictionary:v43 withKey:@"bundleActionName" andValue:@"PhotoMemory"];
        id v4 = v227;
      }
      else
      {
        id v4 = v227;
        v51 = [v227 action];
        v52 = [v51 actionName];
        [(MOEventSerializationSessionHelper *)v228 _savePropertyToDictionary:v43 withKey:@"bundleActionName" andValue:v52];
      }
    }
    [(MOEventSerializationSessionHelper *)v228 _savePropertyToDictionary:v222 withKey:@"bundleAction" andValue:v43];
    uint64_t v53 = objc_opt_new();
    v54 = [v4 concurrentMediaAction];

    if (v54)
    {
      v55 = [v4 concurrentMediaAction];
      v56 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v55 actionType]);
      [(MOEventSerializationSessionHelper *)v228 _savePropertyToDictionary:v53 withKey:@"bundleActionType" andValue:v56];

      v57 = [v4 concurrentMediaAction];
      v58 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v57 actionSubtype]);
      [(MOEventSerializationSessionHelper *)v228 _savePropertyToDictionary:v53 withKey:@"bundleActionSubType" andValue:v58];

      v59 = [v4 concurrentMediaAction];
      v60 = [v59 actionName];
      [(MOEventSerializationSessionHelper *)v228 _savePropertyToDictionary:v53 withKey:@"bundleConcurrentMediaActionName" andValue:v60];

      v61 = [v4 concurrentMediaAction];
      [v61 actionNameConfidence];
      v62 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      [(MOEventSerializationSessionHelper *)v228 _savePropertyToDictionary:v53 withKey:@"bundleActionNameConfidence" andValue:v62];
    }
    v63 = v222;
    v218 = (void *)v53;
    [(MOEventSerializationSessionHelper *)v228 _savePropertyToDictionary:v222 withKey:@"bundleConcurrentMediaAction" andValue:v53];
    v64 = objc_opt_new();
    v65 = [v4 actions];
    v239[0] = _NSConcreteStackBlock;
    v239[1] = 3221225472;
    v239[2] = __58__MOEventSerializationSessionHelper_serializeEventBundle___block_invoke_2;
    v239[3] = &unk_1002CBAF8;
    v239[4] = v228;
    id v66 = v64;
    id v240 = v66;
    [v65 enumerateObjectsUsingBlock:v239];

    v217 = v66;
    [(MOEventSerializationSessionHelper *)v228 _savePropertyToDictionary:v222 withKey:@"bundleBackgroundAction" andValue:v66];
    id v67 = objc_opt_new();
    id v68 = [v4 persons];
    v237[0] = _NSConcreteStackBlock;
    v237[1] = 3221225472;
    v237[2] = __58__MOEventSerializationSessionHelper_serializeEventBundle___block_invoke_3;
    v237[3] = &unk_1002CBA58;
    v237[4] = v228;
    id v69 = v67;
    id v238 = v69;
    [v68 enumerateObjectsUsingBlock:v237];

    v216 = v69;
    [(MOEventSerializationSessionHelper *)v228 _savePropertyToDictionary:v222 withKey:@"bundlePersons" andValue:v69];
    uint64_t v70 = objc_opt_new();
    id v71 = [v4 place];

    if (v71)
    {
      v72 = [v4 place];
      v73 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v72 placeUserType]);
      [(MOEventSerializationSessionHelper *)v228 _savePropertyToDictionary:v70 withKey:@"bundlePlaceUserType" andValue:v73];

      v74 = [v4 place];
      v75 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v74 placeType]);
      [(MOEventSerializationSessionHelper *)v228 _savePropertyToDictionary:v70 withKey:@"bundlePlaceType" andValue:v75];

      v76 = [v4 place];
      v77 = [v76 placeName];
      [(MOEventSerializationSessionHelper *)v228 _savePropertyToDictionary:v70 withKey:@"bundlePlaceName" andValue:v77];

      v78 = [v4 place];
      v79 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v78 proposition]);
      [(MOEventSerializationSessionHelper *)v228 _savePropertyToDictionary:v70 withKey:@"bundlePlaceProposition" andValue:v79];

      v80 = [v4 place];
      [v80 placeNameConfidence];
      v81 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      [(MOEventSerializationSessionHelper *)v228 _savePropertyToDictionary:v70 withKey:@"bundlePlaceNameConfidence" andValue:v81];

      v82 = [v4 place];
      v83 = [v82 location];
      [v83 latitude];
      v84 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      [(MOEventSerializationSessionHelper *)v228 _savePropertyToDictionary:v70 withKey:@"bundleLocationLatitude" andValue:v84];

      v85 = [v4 place];
      v86 = [v85 location];
      [v86 longitude];
      v87 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      [(MOEventSerializationSessionHelper *)v228 _savePropertyToDictionary:v70 withKey:@"bundleLocationLongitude" andValue:v87];

      v36 = v228;
      v88 = [v4 place];
      v89 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v88 locationMode]);
      [(MOEventSerializationSessionHelper *)v228 _savePropertyToDictionary:v70 withKey:@"bundleLocationMode" andValue:v89];

      v90 = [v4 place];
      v91 = [v90 poiCategory];
      [(MOEventSerializationSessionHelper *)v228 _savePropertyToDictionary:v70 withKey:@"bundlePoiCategory" andValue:v91];

      v92 = [v4 place];
      [v92 distanceToHomeInMiles];
      v93 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      [(MOEventSerializationSessionHelper *)v228 _savePropertyToDictionary:v70 withKey:@"bundleDistanceToHomeInMiles" andValue:v93];

      v94 = [v4 place];
      [v94 familiarityIndexLOI];
      v95 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      [(MOEventSerializationSessionHelper *)v228 _savePropertyToDictionary:v70 withKey:@"familiarityIndexLOI" andValue:v95];

      v96 = [v4 place];
      v97 = [v96 enclosingArea];
      [(MOEventSerializationSessionHelper *)v228 _savePropertyToDictionary:v70 withKey:@"bundleEnclosingArea" andValue:v97];

      v98 = [v4 place];
      v99 = [v98 startDate];
      [v99 timeIntervalSinceReferenceDate];
      v100 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      [(MOEventSerializationSessionHelper *)v228 _savePropertyToDictionary:v70 withKey:@"bundleStartDate" andValue:v100];

      v101 = [v4 place];
      v102 = [v101 endDate];
      [v102 timeIntervalSinceReferenceDate];
      v103 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      [(MOEventSerializationSessionHelper *)v228 _savePropertyToDictionary:v70 withKey:@"bundleEndDate" andValue:v103];

      v104 = [v4 place];
      [v104 priorityScore];
      v105 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      [(MOEventSerializationSessionHelper *)v228 _savePropertyToDictionary:v70 withKey:@"bundlePlacePriorityScore" andValue:v105];
    }
    v215 = (void *)v70;
    [(MOEventSerializationSessionHelper *)v36 _savePropertyToDictionary:v222 withKey:@"bundlePlace" andValue:v70];
    v106 = objc_opt_new();
    v107 = [v4 places];
    v235[0] = _NSConcreteStackBlock;
    v235[1] = 3221225472;
    v235[2] = __58__MOEventSerializationSessionHelper_serializeEventBundle___block_invoke_4;
    v235[3] = &unk_1002CBB20;
    v235[4] = v36;
    id v108 = v106;
    id v236 = v108;
    [v107 enumerateObjectsUsingBlock:v235];

    v214 = v108;
    [(MOEventSerializationSessionHelper *)v36 _savePropertyToDictionary:v222 withKey:@"bundlePlaces" andValue:v108];
    uint64_t v109 = objc_opt_new();
    v110 = [v4 time];

    v111 = v221;
    if (v110)
    {
      v112 = [v4 time];
      [v112 timestamp];
      v113 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      [(MOEventSerializationSessionHelper *)v36 _savePropertyToDictionary:v109 withKey:@"bundleTimestamp" andValue:v113];

      v114 = [v4 time];
      v115 = [v114 timeString];

      if (v115)
      {
        v116 = [v4 time];
        v117 = [v116 timeString];
        [(MOEventSerializationSessionHelper *)v36 _savePropertyToDictionary:v109 withKey:@"bundleTimestring" andValue:v117];
      }
      v118 = [v4 time];
      v119 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v118 timeTag]);
      [(MOEventSerializationSessionHelper *)v36 _savePropertyToDictionary:v109 withKey:@"bundleTimetag" andValue:v119];

      v120 = [v4 time];
      id v121 = [v120 timeZone];
      [(MOEventSerializationSessionHelper *)v36 _savePropertyToDictionary:v109 withKey:@"bundleTimezone" andValue:v121];
    }
    [(MOEventSerializationSessionHelper *)v36 _savePropertyToDictionary:v222 withKey:@"bundleTime" andValue:v109];
    v122 = objc_opt_new();
    id v123 = [v4 resources];
    v233[0] = _NSConcreteStackBlock;
    v233[1] = 3221225472;
    v233[2] = __58__MOEventSerializationSessionHelper_serializeEventBundle___block_invoke_5;
    v233[3] = &unk_1002CBB48;
    v233[4] = v36;
    id v124 = v122;
    id v234 = v124;
    [v123 enumerateObjectsUsingBlock:v233];

    v212 = v124;
    [(MOEventSerializationSessionHelper *)v36 _savePropertyToDictionary:v222 withKey:@"bundleResources" andValue:v124];
    v125 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v4 photoSource]);
    [(MOEventSerializationSessionHelper *)v36 _savePropertyToDictionary:v222 withKey:@"bundlePhotoSource" andValue:v125];

    id v126 = [v4 visitEventsRejectedByWatchLocation];
    [(MOEventSerializationSessionHelper *)v36 _savePropertyToDictionary:v222 withKey:@"bundleVisitEventsRejectedByWatchLocation" andValue:v126];

    v127 = [v4 suggestionEngagementEvents];

    if (v127)
    {
      id v128 = [v4 suggestionEngagementEvents];
      v129 = [v128 allObjects];

      [(MOEventSerializationSessionHelper *)v36 _savePropertyToDictionary:v222 withKey:@"bundleSuggestionEngagementEvents" andValue:v129];
    }
    [v4 suggestionEngagementViewCount];
    v130 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v4 suggestionEngagementViewCount]);
    [(MOEventSerializationSessionHelper *)v36 _savePropertyToDictionary:v222 withKey:@"bundleSuggestionEngagementViewCount" andValue:v130];

    v131 = [v4 appEntryEngagementEvents];

    if (v131)
    {
      v132 = [v4 appEntryEngagementEvents];
      v133 = [v132 allObjects];

      [(MOEventSerializationSessionHelper *)v36 _savePropertyToDictionary:v222 withKey:@"bundleAppEntryEngagementEvents" andValue:v133];
    }
    v134 = [v4 rankingDictionary];

    if (v134)
    {
      v135 = [v4 rankingDictionary];
      [(MOEventSerializationSessionHelper *)v36 _savePropertyToDictionary:v222 withKey:@"bundleRanking" andValue:v135];
    }
    v136 = [v4 metaDataForRank];

    if (v136)
    {
      v137 = [v4 metaDataForRank];
      id v138 = [v137 mutableCopy];

      if (!v36->_shouldAvoidRandomization)
      {
        [v138 removeObjectForKey:@"StateOfMindLabels"];
        [v138 removeObjectForKey:@"StateOfMindDomains"];
        [v138 removeObjectForKey:@"StateOfMindValence"];
        [v138 removeObjectForKey:@"StateOfMindValenceClassification"];
        [v138 removeObjectForKey:@"StateOfMindReflectiveInterval"];
        [v138 removeObjectForKey:@"StateOfMindLoggedIn3pApp"];
        [v138 removeObjectForKey:@"StateOfMindLoggedInJournalApp"];
      }
      [(MOEventSerializationSessionHelper *)v36 _savePropertyToDictionary:v222 withKey:@"bundleMetaDataForRanking" andValue:v138];
    }
    v213 = (void *)v109;
    v139 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v4 timeAtHomeSubType]);
    [(MOEventSerializationSessionHelper *)v36 _savePropertyToDictionary:v222 withKey:@"bundleTimeAtHomeSubtype" andValue:v139];

    v140 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 includedInSummaryBundleOnly]);
    [(MOEventSerializationSessionHelper *)v36 _savePropertyToDictionary:v222 withKey:@"bundleIncludedInSummaryBundleOnly" andValue:v140];

    v223 = objc_opt_new();
    v141 = [v4 clusterMetadata];

    if (v141)
    {
      v142 = [v4 clusterMetadata];
      v143 = [v142 identifier];
      v144 = [v143 UUIDString];
      [(MOEventSerializationSessionHelper *)v36 _savePropertyToDictionary:v223 withKey:@"outlierMetadataidentifier" andValue:v144];

      v145 = [v4 clusterMetadata];
      v146 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v145 isFiltered]);
      [(MOEventSerializationSessionHelper *)v36 _savePropertyToDictionary:v223 withKey:@"isFiltered" andValue:v146];

      v147 = [v4 clusterMetadata];
      v148 = [v147 phenotype];
      [(MOEventSerializationSessionHelper *)v36 _savePropertyToDictionary:v223 withKey:@"phenotype" andValue:v148];

      v149 = [v4 clusterMetadata];
      v150 = [v149 topLevelActivityHistogram];
      [(MOEventSerializationSessionHelper *)v36 _savePropertyToDictionary:v223 withKey:@"topLevelActivityHistogram" andValue:v150];

      v151 = [v4 clusterMetadata];
      v152 = [v151 secondLevelActivityHistogram];
      [(MOEventSerializationSessionHelper *)v36 _savePropertyToDictionary:v223 withKey:@"secondLevelActivityHistogram" andValue:v152];

      v153 = [v4 clusterMetadata];
      v154 = [v153 activityTypeFromPhotoTraitsHistogram];
      [(MOEventSerializationSessionHelper *)v36 _savePropertyToDictionary:v223 withKey:@"activityTypeFromPhotoTraitsHistogram" andValue:v154];

      v155 = [v4 clusterMetadata];
      v156 = [v155 timeTagHistogram];
      [(MOEventSerializationSessionHelper *)v36 _savePropertyToDictionary:v223 withKey:@"timeTagHistogram" andValue:v156];

      v157 = [v4 clusterMetadata];
      v158 = [v157 dayOfWeekHistogram];
      [(MOEventSerializationSessionHelper *)v36 _savePropertyToDictionary:v223 withKey:@"dayOfWeekHistogram" andValue:v158];

      v159 = [v4 clusterMetadata];
      v160 = [v159 weekOfYearHistogram];
      [(MOEventSerializationSessionHelper *)v36 _savePropertyToDictionary:v223 withKey:@"weekOfYearHistogram" andValue:v160];

      v161 = [v4 clusterMetadata];
      v162 = [v161 timeContextFromPhotoTraitsHistogram];
      [(MOEventSerializationSessionHelper *)v36 _savePropertyToDictionary:v223 withKey:@"timeContextFromPhotoTraitsHistogram" andValue:v162];

      v163 = [v4 clusterMetadata];
      v164 = [v163 placeNameHistogram];
      [(MOEventSerializationSessionHelper *)v36 _savePropertyToDictionary:v223 withKey:@"placeNameHistogram" andValue:v164];

      v165 = [v4 clusterMetadata];
      v166 = [v165 combinedPlaceTypeHistogram];
      [(MOEventSerializationSessionHelper *)v36 _savePropertyToDictionary:v223 withKey:@"combinedPlaceTypeHistogram" andValue:v166];

      v167 = [v4 clusterMetadata];
      v168 = [v167 enclosingPlaceNameHistogram];
      [(MOEventSerializationSessionHelper *)v36 _savePropertyToDictionary:v223 withKey:@"enclosingPlaceNameHistogram" andValue:v168];

      v169 = [v4 clusterMetadata];
      v170 = [v169 placeTypeFromPhotoTraitsHistogram];
      [(MOEventSerializationSessionHelper *)v36 _savePropertyToDictionary:v223 withKey:@"placeTypeFromPhotoTraitsHistogram" andValue:v170];

      v171 = [v4 clusterMetadata];
      v172 = [v171 contactNamesHistogram];
      [(MOEventSerializationSessionHelper *)v36 _savePropertyToDictionary:v223 withKey:@"contactNamesHistogram" andValue:v172];

      v173 = [v4 clusterMetadata];
      v174 = [v173 personRelationshipHistogram];
      [(MOEventSerializationSessionHelper *)v36 _savePropertyToDictionary:v223 withKey:@"personRelationshipHistogram" andValue:v174];

      v175 = [v4 clusterMetadata];
      v176 = [v175 socialEventFromPhotoTraitsHistogram];
      [(MOEventSerializationSessionHelper *)v36 _savePropertyToDictionary:v223 withKey:@"socialEventFromPhotoTraitsHistogram" andValue:v176];

      v177 = [v4 clusterMetadata];
      v178 = [v177 otherSubjectFromPhotoTraitsHistogram];
      [(MOEventSerializationSessionHelper *)v36 _savePropertyToDictionary:v223 withKey:@"otherSubjectFromPhotoTraitsHistogram" andValue:v178];

      v179 = [v4 clusterMetadata];
      v180 = [v179 subBundleGoodnessScores];
      [(MOEventSerializationSessionHelper *)v36 _savePropertyToDictionary:v223 withKey:@"subBundleGoodnessScores" andValue:v180];

      [(MOEventSerializationSessionHelper *)v36 _savePropertyToDictionary:v222 withKey:@"clusterMetadata" andValue:v223];
    }
    v181 = objc_opt_new();
    v182 = [v4 outlierMetadata];

    if (v182)
    {
      v183 = [v4 outlierMetadata];
      [v183 identifier];
      v185 = v184 = v181;
      v186 = [v185 UUIDString];
      [(MOEventSerializationSessionHelper *)v36 _savePropertyToDictionary:v184 withKey:@"outlierMetadataidentifier" andValue:v186];

      v187 = [v4 outlierMetadata];
      v188 = [v187 updatedDate];
      [v188 timeIntervalSinceReferenceDate];
      v189 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      [(MOEventSerializationSessionHelper *)v36 _savePropertyToDictionary:v184 withKey:@"updatedDate" andValue:v189];

      v190 = [v4 outlierMetadata];
      v191 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v190 isSignificant]);
      [(MOEventSerializationSessionHelper *)v36 _savePropertyToDictionary:v184 withKey:@"isSignificant" andValue:v191];

      v192 = [v4 outlierMetadata];
      [v192 outlierScore];
      v193 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      [(MOEventSerializationSessionHelper *)v36 _savePropertyToDictionary:v184 withKey:@"outlierScore" andValue:v193];

      v194 = [v4 outlierMetadata];
      [v194 outlierScoreThreshold];
      v195 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      [(MOEventSerializationSessionHelper *)v36 _savePropertyToDictionary:v184 withKey:@"outlierScoreThreshold" andValue:v195];

      v196 = [v4 outlierMetadata];
      [v196 bundleGoodnessScore];
      v197 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      [(MOEventSerializationSessionHelper *)v36 _savePropertyToDictionary:v184 withKey:@"bundleGoodnessScore" andValue:v197];

      v198 = [v4 outlierMetadata];
      [v198 bundleGoodnessScoreThreshold];
      v199 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      [(MOEventSerializationSessionHelper *)v36 _savePropertyToDictionary:v184 withKey:@"bundleGoodnessScoreThreshold" andValue:v199];

      v181 = v184;
      [(MOEventSerializationSessionHelper *)v36 _savePropertyToDictionary:v222 withKey:@"outlierMetadata" andValue:v184];
    }
    v200 = [v4 photoTraits];
    id v201 = [v200 count];

    if (v201)
    {
      v225 = objc_opt_new();
      long long v229 = 0u;
      long long v230 = 0u;
      long long v231 = 0u;
      long long v232 = 0u;
      id obj = [v4 photoTraits];
      id v202 = [obj countByEnumeratingWithState:&v229 objects:v247 count:16];
      if (v202)
      {
        id v203 = v202;
        uint64_t v226 = *(void *)v230;
        do
        {
          for (j = 0; j != v203; j = (char *)j + 1)
          {
            if (*(void *)v230 != v226) {
              objc_enumerationMutation(obj);
            }
            v205 = *(void **)(*((void *)&v229 + 1) + 8 * (void)j);
            v206 = objc_opt_new();
            v207 = [v205 identifier];
            v208 = [v207 UUIDString];
            [(MOEventSerializationSessionHelper *)v228 _savePropertyToDictionary:v206 withKey:@"identifier" andValue:v208];

            v209 = [v205 name];
            [(MOEventSerializationSessionHelper *)v228 _savePropertyToDictionary:v206 withKey:@"name" andValue:v209];

            v210 = [v205 relevantAssetUUIDs];
            [(MOEventSerializationSessionHelper *)v228 _savePropertyToDictionary:v206 withKey:@"relevantAssetUUIDs" andValue:v210];

            if ([v206 count]) {
              [v225 addObject:v206];
            }
          }
          id v203 = [obj countByEnumeratingWithState:&v229 objects:v247 count:16];
        }
        while (v203);
      }

      v63 = v222;
      if ([v225 count]) {
        [(MOEventSerializationSessionHelper *)v228 _savePropertyToDictionary:v222 withKey:@"photoTraits" andValue:v225];
      }

      id v4 = v227;
      v111 = v221;
    }
  }
  else
  {
    v63 = 0;
  }

  return v63;
}

void __58__MOEventSerializationSessionHelper_serializeEventBundle___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 eventIdentifier];
  id v4 = [v3 UUIDString];

  [*(id *)(a1 + 32) addObject:v4];
}

void __58__MOEventSerializationSessionHelper_serializeEventBundle___block_invoke_2(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = a2;
    id v14 = (id)objc_opt_new();
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v3 actionType]);
    [v4 _savePropertyToDictionary:v14 withKey:@"bundleActionType" andValue:v5];

    id v6 = *(void **)(a1 + 32);
    v7 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v3 actionSubtype]);
    [v6 _savePropertyToDictionary:v14 withKey:@"bundleActionSubType" andValue:v7];

    v8 = *(void **)(a1 + 32);
    id v9 = [v3 actionName];
    [v8 _savePropertyToDictionary:v14 withKey:@"bundleActionName" andValue:v9];

    objc_super v10 = *(void **)(a1 + 32);
    [v3 actionNameConfidence];
    double v12 = v11;

    id v13 = +[NSNumber numberWithDouble:v12];
    [v10 _savePropertyToDictionary:v14 withKey:@"bundleActionNameConfidence" andValue:v13];

    [*(id *)(a1 + 40) addObject:v14];
  }
}

void __58__MOEventSerializationSessionHelper_serializeEventBundle___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = objc_opt_new();
    uint64_t v5 = *(void **)(a1 + 32);
    id v6 = [v3 name];
    [v5 _savePropertyToDictionary:v4 withKey:@"name" andValue:v6];

    v7 = *(void **)(a1 + 32);
    v8 = [v3 family];
    [v7 _savePropertyToDictionary:v4 withKey:@"family" andValue:v8];

    id v9 = *(void **)(a1 + 32);
    objc_super v10 = [v3 contactIdentifier];
    [v9 _savePropertyToDictionary:v4 withKey:@"contactIdentifier" andValue:v10];

    double v11 = *(void **)(a1 + 32);
    [v3 significanceScore];
    double v12 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v11 _savePropertyToDictionary:v4 withKey:@"significanceScore" andValue:v12];

    id v13 = *(void **)(a1 + 32);
    [v3 priorityScore];
    id v14 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v13 _savePropertyToDictionary:v4 withKey:@"priorityScore" andValue:v14];

    id v15 = *(void **)(a1 + 32);
    v16 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 isPHPersonTypeImportant]);
    [v15 _savePropertyToDictionary:v4 withKey:@"isPHPersonTypeImportant" andValue:v16];

    id v17 = *(void **)(a1 + 32);
    v18 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 isMePerson]);
    [v17 _savePropertyToDictionary:v4 withKey:@"isMePerson" andValue:v18];

    v19 = [v3 personRelationships];
    id v20 = [v19 count];

    if (v20)
    {
      v33 = v4;
      v21 = objc_opt_new();
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      id v34 = v3;
      id obj = [v3 personRelationships];
      id v22 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
      if (v22)
      {
        id v23 = v22;
        uint64_t v36 = *(void *)v38;
        do
        {
          for (i = 0; i != v23; i = (char *)i + 1)
          {
            if (*(void *)v38 != v36) {
              objc_enumerationMutation(obj);
            }
            v25 = *(void **)(*((void *)&v37 + 1) + 8 * i);
            uint64_t v26 = objc_opt_new();
            v27 = *(void **)(a1 + 32);
            id v28 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v25 relationship]);
            [v27 _savePropertyToDictionary:v26 withKey:@"personRelationshipTag" andValue:v28];

            id v29 = *(void **)(a1 + 32);
            [v25 score];
            uint64_t v30 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
            [v29 _savePropertyToDictionary:v26 withKey:@"personRelationshipScore" andValue:v30];

            v31 = *(void **)(a1 + 32);
            id v32 = [v25 source];
            [v31 _savePropertyToDictionary:v26 withKey:@"personRelationshipSource" andValue:v32];

            [v21 addObject:v26];
          }
          id v23 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
        }
        while (v23);
      }

      id v4 = v33;
      if ([v21 count]) {
        [*(id *)(a1 + 32) _savePropertyToDictionary:v33 withKey:@"personRelationships" andValue:v21];
      }

      id v3 = v34;
    }
    [*(id *)(a1 + 40) addObject:v4, v33];
  }
}

void __58__MOEventSerializationSessionHelper_serializeEventBundle___block_invoke_4(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = a2;
    id v40 = (id)objc_opt_new();
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v3 placeUserType]);
    [v4 _savePropertyToDictionary:v40 withKey:@"bundlePlaceUserType" andValue:v5];

    id v6 = *(void **)(a1 + 32);
    v7 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v3 placeType]);
    [v6 _savePropertyToDictionary:v40 withKey:@"bundlePlaceType" andValue:v7];

    v8 = *(void **)(a1 + 32);
    id v9 = [v3 placeName];
    [v8 _savePropertyToDictionary:v40 withKey:@"bundlePlaceName" andValue:v9];

    objc_super v10 = *(void **)(a1 + 32);
    double v11 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v3 proposition]);
    [v10 _savePropertyToDictionary:v40 withKey:@"bundlePlaceProposition" andValue:v11];

    double v12 = *(void **)(a1 + 32);
    [v3 placeNameConfidence];
    id v13 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v12 _savePropertyToDictionary:v40 withKey:@"bundlePlaceNameConfidence" andValue:v13];

    id v14 = *(void **)(a1 + 32);
    id v15 = [v3 location];
    [v15 latitude];
    v16 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v14 _savePropertyToDictionary:v40 withKey:@"bundleLocationLatitude" andValue:v16];

    id v17 = *(void **)(a1 + 32);
    v18 = [v3 location];
    [v18 longitude];
    v19 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v17 _savePropertyToDictionary:v40 withKey:@"bundleLocationLongitude" andValue:v19];

    id v20 = *(void **)(a1 + 32);
    v21 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v3 locationMode]);
    [v20 _savePropertyToDictionary:v40 withKey:@"bundleLocationMode" andValue:v21];

    id v22 = *(void **)(a1 + 32);
    id v23 = [v3 poiCategory];
    [v22 _savePropertyToDictionary:v40 withKey:@"bundlePoiCategory" andValue:v23];

    v24 = *(void **)(a1 + 32);
    [v3 distanceToHomeInMiles];
    v25 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v24 _savePropertyToDictionary:v40 withKey:@"bundleDistanceToHomeInMiles" andValue:v25];

    uint64_t v26 = *(void **)(a1 + 32);
    [v3 familiarityIndexLOI];
    v27 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v26 _savePropertyToDictionary:v40 withKey:@"familiarityIndexLOI" andValue:v27];

    id v28 = *(void **)(a1 + 32);
    id v29 = [v3 enclosingArea];
    [v28 _savePropertyToDictionary:v40 withKey:@"bundleEnclosingArea" andValue:v29];

    uint64_t v30 = *(void **)(a1 + 32);
    v31 = [v3 startDate];
    [v31 timeIntervalSinceReferenceDate];
    id v32 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v30 _savePropertyToDictionary:v40 withKey:@"bundleStartDate" andValue:v32];

    v33 = *(void **)(a1 + 32);
    id v34 = [v3 endDate];
    [v34 timeIntervalSinceReferenceDate];
    v35 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v33 _savePropertyToDictionary:v40 withKey:@"bundleEndDate" andValue:v35];

    uint64_t v36 = *(void **)(a1 + 32);
    [v3 priorityScore];
    double v38 = v37;

    long long v39 = +[NSNumber numberWithDouble:v38];
    [v36 _savePropertyToDictionary:v40 withKey:@"bundlePlacePriorityScore" andValue:v39];

    [*(id *)(a1 + 40) addObject:v40];
  }
}

void __58__MOEventSerializationSessionHelper_serializeEventBundle___block_invoke_5(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = a2;
    id v4 = objc_opt_new();
    uint64_t v5 = *(void **)(a1 + 32);
    [v3 value];
    id v6 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v5 _savePropertyToDictionary:v4 withKey:@"bundleResourceValue" andValue:v6];

    v7 = *(void **)(a1 + 32);
    v8 = [v3 name];
    [v7 _savePropertyToDictionary:v4 withKey:@"bundleResourceName" andValue:v8];

    id v9 = *(void **)(a1 + 32);
    objc_super v10 = [v3 assets];
    [v9 _savePropertyToDictionary:v4 withKey:@"bundleResourceAssets" andValue:v10];

    double v11 = *(void **)(a1 + 32);
    double v12 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v3 type]);
    [v11 _savePropertyToDictionary:v4 withKey:@"bundleResourceType" andValue:v12];

    id v13 = *(void **)(a1 + 32);
    [v3 priorityScore];
    id v14 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v13 _savePropertyToDictionary:v4 withKey:@"bundleResourcePriorityScore" andValue:v14];

    id v15 = *(void **)(a1 + 32);
    v16 = [v3 photoCurationScore];
    [v15 _savePropertyToDictionary:v4 withKey:@"bundleResourcePhotoCurationScore" andValue:v16];

    id v17 = *(void **)(a1 + 32);
    v18 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v3 photoFaceCount]);
    [v17 _savePropertyToDictionary:v4 withKey:@"bundleResourcePhotoFaceCount" andValue:v18];

    v19 = *(void **)(a1 + 32);
    id v20 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v3 photoAssetMediaType]);
    [v19 _savePropertyToDictionary:v4 withKey:@"bundleResourcePhotoAssetMediaType" andValue:v20];

    v21 = [v3 data];

    id v22 = +[MODictionaryEncoder decodeToDictionary:v21];

    uint64_t v23 = [v22 objectForKeyedSubscript:@"MOWorkoutMetaDataKeyActivityType"];
    v24 = (void *)v23;
    if (v23)
    {
      CFStringRef v26 = @"MOWorkoutMetaDataKeyActivityType";
      uint64_t v27 = v23;
      v25 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
      [*(id *)(a1 + 32) _savePropertyToDictionary:v4 withKey:@"bundleResourceMetadata" andValue:v25];
    }
    [*(id *)(a1 + 40) addObject:v4];
  }
}

- (void)_savePropertyToDictionary:(id)a3 withKey:(id)a4 andValue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = v10;
  if (v9 && v10)
  {
    if (self->_shouldAvoidRandomization || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
LABEL_5:
      [v8 setObject:v11 forKey:v9];
      goto LABEL_6;
    }
    if (![(NSSet *)self->_randomizedKeys containsObject:v9])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v21 = 0u;
        long long v22 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        double v12 = self->_randomizedKeys;
        id v13 = [(NSSet *)v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v13)
        {
          id v14 = v13;
          uint64_t v15 = *(void *)v20;
          while (2)
          {
            for (i = 0; i != v14; i = (char *)i + 1)
            {
              if (*(void *)v20 != v15) {
                objc_enumerationMutation(v12);
              }
              if (objc_msgSend(v9, "containsString:", *(void *)(*((void *)&v19 + 1) + 8 * i), (void)v19))
              {

                goto LABEL_19;
              }
            }
            id v14 = [(NSSet *)v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
            if (v14) {
              continue;
            }
            break;
          }
        }
      }
      goto LABEL_5;
    }
LABEL_19:
    id v17 = [(NSMutableDictionary *)self->_randomMapping objectForKey:v11];
    if (!v17)
    {
      v18 = +[NSUUID UUID];
      id v17 = [v18 UUIDString];

      [(NSMutableDictionary *)self->_randomMapping setObject:v17 forKey:v11];
    }
    [v8 setObject:v17 forKey:v9];
  }
LABEL_6:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_randomMapping, 0);

  objc_storeStrong((id *)&self->_randomizedKeys, 0);
}

@end
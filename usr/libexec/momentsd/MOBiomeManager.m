@interface MOBiomeManager
- (BMStream)engagementStream;
- (BMStream)stream;
- (BOOL)setDefault;
- (MOBiomeDonationUtility)biomeDonationUtility;
- (MOBiomeManager)initWithEventManager:(id)a3 setDefaultValues:(BOOL)a4;
- (MOEventManager)eventManager;
- (NSNumber)age;
- (NSNumber)ageBucketed;
- (NSNumber)biologicalSex;
- (NSNumber)stateIHA;
- (OS_dispatch_queue)queue;
- (id)appEntryTypeToString:(int)a3;
- (id)generateBiomeEventsFromBundle:(id)a3 andOnboardingStatus:(id)a4;
- (id)generateBiomeEventsFromEvent:(id)a3 andOnboardingStatus:(id)a4;
- (id)generateBiomeEventsFromMomentsEventDataBundle:(id)a3 withBundleEngagement:(id)a4;
- (id)suggestionTypeToString:(int)a3;
- (void)_fetchAndSetDemographicsWithCompletionHandler:(id)a3;
- (void)_updateDataStreamWithEngagement;
- (void)donateEvents:(id)a3 andBundles:(id)a4 andOnboardingStatus:(id)a5;
- (void)fetchMomentsEngagementForBundles:(id)a3 CompletionHandler:(id)a4;
- (void)fetchMomentsEventDataBetweenStartDate:(id)a3 EndDate:(id)a4 CompletionHandler:(id)a5;
- (void)setAge:(id)a3;
- (void)setAgeBucketed:(id)a3;
- (void)setBiologicalSex:(id)a3;
- (void)setBiomeDonationUtility:(id)a3;
- (void)setEventManager:(id)a3;
- (void)setSetDefault:(BOOL)a3;
- (void)setStateIHA:(id)a3;
@end

@implementation MOBiomeManager

- (MOBiomeManager)initWithEventManager:(id)a3 setDefaultValues:(BOOL)a4
{
  id v8 = a3;
  if (v8)
  {
    if (initWithEventManager_setDefaultValues__onceToken != -1) {
      dispatch_once(&initWithEventManager_setDefaultValues__onceToken, &__block_literal_global_34);
    }
    v31.receiver = self;
    v31.super_class = (Class)MOBiomeManager;
    v9 = [(MOBiomeManager *)&v31 init];
    v10 = v9;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_queue, (id)initWithEventManager_setDefaultValues__sharedQueue);
      v11 = BiomeLibrary();
      v12 = [v11 Moments];
      v13 = [v12 Stats];
      uint64_t v14 = [v13 EventData];
      stream = v10->_stream;
      v10->_stream = (BMStream *)v14;

      v16 = BiomeLibrary();
      v17 = [v16 Moments];
      v18 = [v17 Events];
      uint64_t v19 = [v18 Engagement];
      engagementStream = v10->_engagementStream;
      v10->_engagementStream = (BMStream *)v19;

      objc_storeStrong((id *)&v10->_eventManager, a3);
      stateIHA = v10->_stateIHA;
      v10->_stateIHA = (NSNumber *)&__kCFBooleanFalse;

      age = v10->_age;
      v10->_age = (NSNumber *)&off_1002F6B30;

      ageBucketed = v10->_ageBucketed;
      v10->_ageBucketed = (NSNumber *)&off_1002F6B30;

      biologicalSex = v10->_biologicalSex;
      v10->_biologicalSex = (NSNumber *)&off_1002F6B30;

      v10->_setDefault = a4;
      v25 = objc_alloc_init(MOBiomeDonationUtility);
      biomeDonationUtility = v10->_biomeDonationUtility;
      v10->_biomeDonationUtility = v25;
    }
    self = v10;
    v27 = self;
  }
  else
  {
    v28 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      -[MOBiomeManager initWithEventManager:setDefaultValues:](v28);
    }

    v29 = +[NSAssertionHandler currentHandler];
    [v29 handleFailureInMethod:a2 object:self file:@"MOBiomeManager.m" lineNumber:143 description:@"Invalid parameter not satisfying: eventManager"];

    v27 = 0;
  }

  return v27;
}

void __56__MOBiomeManager_initWithEventManager_setDefaultValues___block_invoke(id a1)
{
  v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create("MOBiomeManager", v3);
  v2 = (void *)initWithEventManager_setDefaultValues__sharedQueue;
  initWithEventManager_setDefaultValues__sharedQueue = (uint64_t)v1;
}

- (id)suggestionTypeToString:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v8[0] = &off_1002F6B48;
  v8[1] = &off_1002F6B60;
  v9[0] = @"Unknown";
  v9[1] = @"Selected";
  v8[2] = &off_1002F6B78;
  v8[3] = &off_1002F6B90;
  v9[2] = @"Shared";
  v9[3] = @"Liked";
  v8[4] = &off_1002F6BA8;
  v8[5] = &off_1002F6BC0;
  v9[4] = @"Disliked";
  v9[5] = @"Dismissed";
  v8[6] = &off_1002F6BD8;
  v8[7] = &off_1002F6BF0;
  v9[6] = @"Deleted";
  v9[7] = @"Hidden";
  v8[8] = &off_1002F6C08;
  v8[9] = &off_1002F6C20;
  v9[8] = @"QuickAddEntry";
  v9[9] = @"Viewed";
  v8[10] = &off_1002F6C38;
  v8[11] = &off_1002F6C50;
  v9[10] = @"ThumbsDown";
  v9[11] = @"Favorite";
  v8[12] = &off_1002F6C68;
  v8[13] = &off_1002F6C80;
  v9[12] = @"ThumbsUp";
  v9[13] = @"EntryCreated";
  v8[14] = &off_1002F6C98;
  v8[15] = &off_1002F6CB0;
  v9[14] = @"EntryEdited";
  v9[15] = @"EntryDeleted";
  v8[16] = &off_1002F6CC8;
  v8[17] = &off_1002F6CE0;
  v9[16] = @"EntryCancelled";
  v9[17] = @"Annotated";
  v8[18] = &off_1002F6CF8;
  v8[19] = &off_1002F6D10;
  v9[18] = @"Positive";
  v9[19] = @"Negative";
  v8[20] = &off_1002F6D28;
  v8[21] = &off_1002F6D40;
  v9[20] = @"Neutral";
  v9[21] = @"Rejected";
  v8[22] = &off_1002F6D58;
  v8[23] = &off_1002F6D70;
  v9[22] = @"Accepted";
  v9[23] = @"Posted";
  v8[24] = &off_1002F6D88;
  v8[25] = &off_1002F6DA0;
  v9[24] = @"Filtered";
  v9[25] = @"EntryCreatedWithUpdates";
  v8[26] = &off_1002F6DB8;
  v8[27] = &off_1002F6DD0;
  v9[26] = @"NotificationQueued";
  v9[27] = @"NotificationDequeued";
  v8[28] = &off_1002F6DE8;
  v8[29] = &off_1002F6E00;
  v9[28] = @"NotificationTapped";
  v9[29] = @"NotificationDismissed";
  v8[30] = &off_1002F6E18;
  v8[31] = &off_1002F6E30;
  v9[30] = @"NotificationPosted";
  v9[31] = @"NotificationOverride";
  v4 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:32];
  v5 = +[NSNumber numberWithInt:v3];
  v6 = [v4 objectForKeyedSubscript:v5];

  return v6;
}

- (id)appEntryTypeToString:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v8[0] = &off_1002F6B48;
  v8[1] = &off_1002F6B60;
  v9[0] = @"Unknown";
  v9[1] = @"EntryCreated";
  v8[2] = &off_1002F6B78;
  v8[3] = &off_1002F6B90;
  v9[2] = @"EntryEdited";
  v9[3] = @"EntryDeleted";
  v8[4] = &off_1002F6BA8;
  v9[4] = @"EntryCancelled";
  v4 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:5];
  v5 = +[NSNumber numberWithInt:v3];
  v6 = [v4 objectForKeyedSubscript:v5];

  return v6;
}

- (id)generateBiomeEventsFromEvent:(id)a3 andOnboardingStatus:(id)a4
{
  id v6 = a4;
  biomeDonationUtility = self->_biomeDonationUtility;
  id v8 = a3;
  v33 = [(MOBiomeDonationUtility *)biomeDonationUtility convertEvent:v8];
  v9 = [v6 objectForKeyedSubscript:@"onboardingStatus"];

  if (v9)
  {
    v10 = [v6 objectForKeyedSubscript:@"onboardingStatus"];
    unsigned int v31 = +[MOBiomeDonationUtility mapOnboardingFlowCompletion:](MOBiomeDonationUtility, "mapOnboardingFlowCompletion:", (int)[v10 intValue]);
  }
  else
  {
    unsigned int v31 = 0;
  }
  id v11 = objc_alloc((Class)BMMomentsEventData);
  stateIHA = self->_stateIHA;
  id v28 = v11;
  age = self->_age;
  unsigned int v27 = [(NSNumber *)self->_ageBucketed intValue];
  unsigned int v26 = [(NSNumber *)self->_biologicalSex intValue];
  v37 = [v8 startDate];
  v25 = [v8 endDate];
  v24 = [v8 describeCategory];

  v36 = [v6 objectForKeyedSubscript:@"journalIsInstalled"];
  v35 = [v6 objectForKeyedSubscript:@"journalConfigLockJournal"];
  v34 = [v6 objectForKeyedSubscript:@"journalConfigSkipSuggestions"];
  v23 = [v6 objectForKeyedSubscript:@"settingSwitchActivity"];
  v12 = [v6 objectForKeyedSubscript:@"settingSwitchCommunication"];
  v22 = [v6 objectForKeyedSubscript:@"settingSwitchLocation"];
  v13 = [v6 objectForKeyedSubscript:@"settingSwitchMedia"];
  v21 = [v6 objectForKeyedSubscript:@"settingSwitchPeople"];
  uint64_t v14 = [v6 objectForKeyedSubscript:@"settingSwitchPhoto"];
  v15 = [v6 objectForKeyedSubscript:@"settingSwitchStateOfMind"];
  v16 = [v6 objectForKeyedSubscript:@"settingSwitchReflection"];
  v17 = [v6 objectForKeyedSubscript:@"settingBroaderSwitchLocation"];
  LODWORD(v20) = v31;
  LODWORD(v19) = v26;
  id v32 = objc_msgSend(v28, "initWithEvent:bundle:isBundle:IHAState:age:ageRange:biologicalSex:startDate:endDate:categoryOfEvent:bundleInterface:bundleEvergreenType:sugSeetEngType:appEntryEngType:megaSignalTypeUsed:viewVisibleSuggestionsCount:viewTotalSuggestionsCount:onboardingFlowCompletionState:isJournalAppInstalled:isJournalAppLocked:isJournalSuggestionSkipped:isActivitySettingsSwitchEnabled:isCommunicationSettingsSwitchEnabled:isSignificantLocationSettingsSwitchEnabled:isMediaSettingsSwitchEnabled:isNearbyPeopleSettingsSwitchEnabled:isPhotoSettingsSwitchEnabled:isStateOfMindSettingsSwitchEnabled:isReflectionSettingsSwitchEnabled:isBroadSystemLocationSettingsSwitchEnabled:", v33, 0, &__kCFBooleanFalse, stateIHA, age, v27, v19, v37, v25, v24, 0, 0,
          0,
          0,
          0,
          0,
          0,
          v20,
          v36,
          v35,
          v34,
          v23,
          v12,
          v22,
          v13,
          v21,
          v14,
          v15,
          v16,
          v17);

  return v32;
}

- (id)generateBiomeEventsFromBundle:(id)a3 andOnboardingStatus:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v44 = [(MOBiomeDonationUtility *)self->_biomeDonationUtility convertEventBundle:v6];
  v49[0] = @"shopping";
  v49[1] = @"eating out";
  v49[2] = @"flight";
  id v8 = +[NSArray arrayWithObjects:v49 count:3];
  v9 = v6;
  v10 = [v6 action];
  id v11 = [v10 actionName];
  v43 = v8;
  LODWORD(v8) = [v8 containsObject:v11];

  if (v8)
  {
    v12 = [v9 action];
    v42 = [v12 actionName];
  }
  else
  {
    v42 = 0;
  }
  v41 = [v9 getBundleType];
  if ([v9 interfaceType] == (id)11
    && ([v9 resources],
        v13 = objc_claimAutoreleasedReturnValue(),
        id v14 = [v13 count],
        v13,
        v14))
  {
    v15 = [v9 resources];
    v16 = [v15 objectAtIndexedSubscript:0];
    v40 = [v16 name];
  }
  else
  {
    v40 = 0;
  }
  v17 = [v7 objectForKeyedSubscript:@"onboardingStatus"];

  if (v17)
  {
    v18 = [v7 objectForKeyedSubscript:@"onboardingStatus"];
    unsigned int v38 = +[MOBiomeDonationUtility mapOnboardingFlowCompletion:](MOBiomeDonationUtility, "mapOnboardingFlowCompletion:", (int)[v18 intValue]);
  }
  else
  {
    unsigned int v38 = 0;
  }
  id v19 = objc_alloc((Class)BMMomentsEventData);
  stateIHA = self->_stateIHA;
  id v35 = v19;
  age = self->_age;
  unsigned int v34 = [(NSNumber *)self->_ageBucketed intValue];
  unsigned int v33 = [(NSNumber *)self->_biologicalSex intValue];
  id v32 = [v9 startDate];
  v48 = [v9 endDate];
  v47 = [v7 objectForKeyedSubscript:@"journalIsInstalled"];
  v46 = [v7 objectForKeyedSubscript:@"journalConfigLockJournal"];
  v45 = [v7 objectForKeyedSubscript:@"journalConfigSkipSuggestions"];
  unsigned int v31 = [v7 objectForKeyedSubscript:@"settingSwitchActivity"];
  v30 = [v7 objectForKeyedSubscript:@"settingSwitchCommunication"];
  v29 = [v7 objectForKeyedSubscript:@"settingSwitchLocation"];
  id v28 = [v7 objectForKeyedSubscript:@"settingSwitchMedia"];
  unsigned int v27 = [v7 objectForKeyedSubscript:@"settingSwitchPeople"];
  uint64_t v20 = [v7 objectForKeyedSubscript:@"settingSwitchPhoto"];
  v21 = [v7 objectForKeyedSubscript:@"settingSwitchStateOfMind"];
  v22 = [v7 objectForKeyedSubscript:@"settingSwitchReflection"];
  v23 = [v7 objectForKeyedSubscript:@"settingBroaderSwitchLocation"];
  LODWORD(v26) = v38;
  LODWORD(v25) = v33;
  id v39 = objc_msgSend(v35, "initWithEvent:bundle:isBundle:IHAState:age:ageRange:biologicalSex:startDate:endDate:categoryOfEvent:bundleInterface:bundleEvergreenType:sugSeetEngType:appEntryEngType:megaSignalTypeUsed:viewVisibleSuggestionsCount:viewTotalSuggestionsCount:onboardingFlowCompletionState:isJournalAppInstalled:isJournalAppLocked:isJournalSuggestionSkipped:isActivitySettingsSwitchEnabled:isCommunicationSettingsSwitchEnabled:isSignificantLocationSettingsSwitchEnabled:isMediaSettingsSwitchEnabled:isNearbyPeopleSettingsSwitchEnabled:isPhotoSettingsSwitchEnabled:isStateOfMindSettingsSwitchEnabled:isReflectionSettingsSwitchEnabled:isBroadSystemLocationSettingsSwitchEnabled:", 0, v44, &__kCFBooleanTrue, stateIHA, age, v34, v25, v32, v48, 0, v41, v40,
          0,
          0,
          v42,
          0,
          0,
          v26,
          v47,
          v46,
          v45,
          v31,
          v30,
          v29,
          v28,
          v27,
          v20,
          v21,
          v22,
          v23);

  return v39;
}

- (void)donateEvents:(id)a3 andBundles:(id)a4 andOnboardingStatus:(id)a5
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __62__MOBiomeManager_donateEvents_andBundles_andOnboardingStatus___block_invoke;
  v11[3] = &unk_1002CFD40;
  id v12 = a3;
  id v13 = a4;
  id v14 = self;
  id v15 = a5;
  id v8 = v15;
  id v9 = v13;
  id v10 = v12;
  [(MOBiomeManager *)self _fetchAndSetDemographicsWithCompletionHandler:v11];
}

void __62__MOBiomeManager_donateEvents_andBundles_andOnboardingStatus___block_invoke(uint64_t a1, void *a2, void *a3)
{
  unint64_t v5 = a2;
  unint64_t v6 = a3;
  id v7 = _mo_log_facility_get_os_log(&MOLogFacilityBiomeManager);
  id v8 = v7;
  if (v5 | v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __62__MOBiomeManager_donateEvents_andBundles_andOnboardingStatus___block_invoke_cold_1();
    }
  }
  else
  {
    unint64_t v32 = v5;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "moving onto biome donation", buf, 2u);
    }

    id v8 = +[NSDate distantFuture];
    id v9 = +[NSDate distantPast];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v10 = *(id *)(a1 + 32);
    id v11 = [v10 countByEnumeratingWithState:&v41 objects:v47 count:16];
    id v31 = (id)v6;
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v42;
      do
      {
        id v14 = 0;
        id v15 = v9;
        v16 = v8;
        do
        {
          if (*(void *)v42 != v13) {
            objc_enumerationMutation(v10);
          }
          v17 = *(void **)(*((void *)&v41 + 1) + 8 * (void)v14);
          v18 = [v17 startDate:v31];
          id v8 = [v18 earlierDate:v16];

          id v19 = [v17 endDate];
          id v9 = [v19 laterDate:v15];

          id v14 = (char *)v14 + 1;
          id v15 = v9;
          v16 = v8;
        }
        while (v12 != v14);
        id v12 = [v10 countByEnumeratingWithState:&v41 objects:v47 count:16];
      }
      while (v12);
    }

    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v20 = *(id *)(a1 + 40);
    id v21 = [v20 countByEnumeratingWithState:&v37 objects:v46 count:16];
    if (v21)
    {
      id v22 = v21;
      uint64_t v23 = *(void *)v38;
      do
      {
        v24 = 0;
        uint64_t v25 = v9;
        uint64_t v26 = v8;
        do
        {
          if (*(void *)v38 != v23) {
            objc_enumerationMutation(v20);
          }
          unsigned int v27 = *(void **)(*((void *)&v37 + 1) + 8 * (void)v24);
          id v28 = [v27 startDate:v31];
          id v8 = [v28 earlierDate:v26];

          v29 = [v27 endDate];
          id v9 = [v29 laterDate:v25];

          v24 = (char *)v24 + 1;
          uint64_t v25 = v9;
          uint64_t v26 = v8;
        }
        while (v22 != v24);
        id v22 = [v20 countByEnumeratingWithState:&v37 objects:v46 count:16];
      }
      while (v22);
    }

    v30 = *(void **)(a1 + 48);
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = __62__MOBiomeManager_donateEvents_andBundles_andOnboardingStatus___block_invoke_628;
    v33[3] = &unk_1002CFD18;
    v33[4] = v30;
    id v34 = *(id *)(a1 + 32);
    id v35 = *(id *)(a1 + 56);
    id v36 = *(id *)(a1 + 40);
    [v30 fetchMomentsEventDataBetweenStartDate:v8 EndDate:v9 CompletionHandler:v33];

    unint64_t v6 = (unint64_t)v31;
    unint64_t v5 = v32;
  }
}

void __62__MOBiomeManager_donateEvents_andBundles_andOnboardingStatus___block_invoke_628(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = objc_opt_new();
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v25;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if ([v10 isBundle])
        {
          id v11 = [v10 bundle];

          if (v11)
          {
            id v12 = [v10 bundle];
            uint64_t v13 = [v12 bundleIdentifier];
LABEL_12:
            id v15 = (void *)v13;
            [v4 addObject:v13];

            continue;
          }
        }
        if (([v10 isBundle] & 1) == 0)
        {
          id v14 = [v10 event];

          if (v14)
          {
            id v12 = [v10 event];
            uint64_t v13 = [v12 eventIdentifier];
            goto LABEL_12;
          }
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v7);
  }

  v16 = [*(id *)(a1 + 32) queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __62__MOBiomeManager_donateEvents_andBundles_andOnboardingStatus___block_invoke_2;
  block[3] = &unk_1002CFCF0;
  v17 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v20 = v17;
  id v21 = v4;
  id v22 = *(id *)(a1 + 48);
  id v23 = *(id *)(a1 + 56);
  id v18 = v4;
  dispatch_async(v16, block);
}

void __62__MOBiomeManager_donateEvents_andBundles_andOnboardingStatus___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) stream];
  long long v27 = [v2 source];

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v3 = *(id *)(a1 + 40);
  id v4 = [v3 countByEnumeratingWithState:&v32 objects:v41 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v26 = 0;
    uint64_t v6 = *(void *)v33;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v33 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        id v10 = *(void **)(a1 + 48);
        id v11 = [v8 eventIdentifier];
        id v12 = [v11 UUIDString];
        LOBYTE(v10) = [v10 containsObject:v12];

        if ((v10 & 1) == 0)
        {
          uint64_t v13 = [*(id *)(a1 + 32) generateBiomeEventsFromEvent:v8 andOnboardingStatus:*(void *)(a1 + 56)];
          [v27 sendEvent:v13];
          ++v26;
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v32 objects:v41 count:16];
    }
    while (v5);
  }
  else
  {
    uint64_t v26 = 0;
  }

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v14 = *(id *)(a1 + 64);
  id v15 = [v14 countByEnumeratingWithState:&v28 objects:v40 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = 0;
    uint64_t v18 = *(void *)v29;
    do
    {
      for (j = 0; j != v16; j = (char *)j + 1)
      {
        if (*(void *)v29 != v18) {
          objc_enumerationMutation(v14);
        }
        id v20 = *(void **)(*((void *)&v28 + 1) + 8 * (void)j);
        id v21 = *(void **)(a1 + 48);
        id v22 = [v20 bundleIdentifier:v26];
        id v23 = [v22 UUIDString];
        LOBYTE(v21) = [v21 containsObject:v23];

        if ((v21 & 1) == 0)
        {
          long long v24 = [*(id *)(a1 + 32) generateBiomeEventsFromBundle:v20 andOnboardingStatus:*(void *)(a1 + 56)];
          [v27 sendEvent:v24];
          ++v17;
        }
      }
      id v16 = [v14 countByEnumeratingWithState:&v28 objects:v40 count:16];
    }
    while (v16);
  }
  else
  {
    uint64_t v17 = 0;
  }

  long long v25 = _mo_log_facility_get_os_log(&MOLogFacilityBiomeManager);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    uint64_t v37 = v26;
    __int16 v38 = 2048;
    uint64_t v39 = v17;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "biome donation, event count: %lu, bundle count: %lu", buf, 0x16u);
  }
}

- (id)generateBiomeEventsFromMomentsEventDataBundle:(id)a3 withBundleEngagement:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v6 bundle];
  id v81 = objc_alloc((Class)BMMomentsEventDataEventBundle);
  v116 = [v7 bundleIdentifier];
  v114 = [v7 bundleStartDate];
  v112 = [v7 bundleEndDate];
  v110 = [v7 bundleCreationDate];
  v108 = [v7 bundleExpirationDate];
  unsigned int v55 = [v7 bundleInterfaceType];
  v106 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v7 bundleSourceHealthExists]);
  v104 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v7 bundleSourcePhotoExists]);
  v102 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v7 bundleSourceProactiveExists]);
  v100 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v7 bundleSourceRoutineExists]);
  v98 = [v7 bundlePromptLanguageFormat];
  unsigned int v54 = [v7 bundlePlaceType];
  unsigned int v53 = [v7 bundlePlaceUserType];
  unsigned int v52 = [v7 bundleBaseEventCateory];
  v94 = [v7 bundleEventIDs];
  v96 = [v7 bundleActionType];
  v87 = [v7 backgroundActions];
  unsigned int v51 = [v7 bundleTimeTag];
  unsigned int v50 = [v5 type];
  v88 = [v5 timestamp];
  v92 = [v5 clientIdentifier];
  v89 = [v5 viewContainerName];
  [v5 viewVisibleTime];
  v83 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  unsigned int v49 = [v5 typeAppEntry];
  v85 = [v5 clientIdentifierAppEntry];
  v78 = [v5 timestampAppEntry];
  v80 = [v5 startTimeAppEntry];
  v76 = [v5 endTimeAppEntry];
  v74 = [v5 totalCharactersAppEntry];
  v67 = [v5 addedCharactersAppEntry];
  v72 = [v7 suggestionIdentifier];
  unsigned int v48 = [v7 photoSourceType];
  v66 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v7 bundleSourcePostAnalyticsExists]);
  v70 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v7 bundleSourcePDExists]);
  v65 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v7 bundleSourceMotionExists]);
  v68 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v7 bundleSourceBooksExists]);
  v64 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v7 bundleSourceScreenTimeExists]);
  v47 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v7 bundlePCount]);
  unsigned int v46 = [v7 labelConfidenceScore];
  LODWORD(v45) = [v7 timeCorrelationScore];
  HIDWORD(v45) = [v7 callDuration];
  unsigned int v44 = [v7 interactionCount];
  unsigned int v42 = [v7 interactionType];
  unsigned int v43 = [v7 callPlace];
  unsigned int v41 = [v7 distanceFromHome];
  LODWORD(v40) = [v7 homeAvailability];
  HIDWORD(v40) = [v7 workAvailability];
  unsigned int v39 = [v7 bundleVisitMapItemSource];
  unsigned int v37 = [v7 bundleVisitPlaceType];
  unsigned int v38 = [v7 bundleVisitPlaceLabelGranularity];
  unsigned int v36 = [v7 bundleIncludesAnomalousEvent];
  v63 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v7 isFiltered]);
  [v7 bundleSuperType];
  [v7 bundleSubType];
  v62 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v7 isAggregatedAndSuppressed]);
  [v7 summarizationGranularity];
  v61 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v7 includedInSummaryBundleOnly]);
  v60 = [v7 subBundleIDs];
  long long v35 = [v7 subSuggestionIDs];
  v59 = [v7 firstCreationDate];
  long long v34 = [v7 resources];
  v58 = [v7 persons];
  long long v33 = [v7 mainPlace];
  v57 = [v7 otherPlaces];
  long long v32 = [v7 photoTraits];
  long long v30 = [v7 clusterMetadata];
  long long v31 = [v7 outlierMetadata];
  [v7 bundleGoodnessScore];
  long long v29 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v7 distinctnessScore];
  long long v28 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v7 richnessScore];
  long long v27 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v7 engagementScore];
  uint64_t v26 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v7 heuristicsScore];
  uint64_t v8 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v7 metadataForRank];
  HIDWORD(v24) = v46;
  long long v25 = LODWORD(v22) = v49;
  LODWORD(v24) = 0;
  LODWORD(v23) = 0;
  LODWORD(v21) = v50;
  LODWORD(v20) = 0;
  LODWORD(v19) = v51;
  LODWORD(v17) = v52;
  id v82 = objc_msgSend(v81, "initWithBundleIdentifier:bundleStartDate:bundleEndDate:bundleCreationDate:bundleExpirationDate:bundleInterfaceType:bundleSourceHealthExists:bundleSourcePhotoExists:bundleSourceProactiveExists:bundleSourceRoutineExists:bundlePromptLanguageFormat:bundlePromptToneID:bundlePromptParametersAvailability:bundlePlaceType:bundlePlaceUserType:bundleBaseEventCateory:bundleEventIDs:bundleActionType:backgroundActions:bundleIsFamilyIncluded:bundleTimeTag:isBundleResourceTypeUnknown:isBundleResourceTypeValueIncluded:isBundleResourceTypePhotoAssetsIncluded:isBundleResourceTypeMediaIncluded:isBundleResourceTypeWebLinkIncluded:isBundleResourceTypeInterenceTagIncluded:bundlEngagement:bundleVersion:rankingVersion:suggestionType:suggestionTimestamp:suggestionClientIdentifier:suggestionViewContainerName:suggestionViewVisibleTime:appEntryEventType:appEntryEventClientIdentifier:appEntryEventTimestamp:appEntryEventStartTime:appEntryEventEndTime:appEntryEventTotalCharacters:appEntryEventAddedCharacters:clientActivityEventType:clientActivityEventClientIdentifier:clientActivityEventTimestamp:suggestionIdentifier:photoSourceType:photoLibraryType:bundleSourcePostAnalyticsExists:bundleSourcePDExists:bundleSourceMotionExists:bundleSourceBooksExists:bundleSourceScreenTimeExists:gaPRArray:bundlePCount:ranking:labelConfidenceScore:timeCorrelationScore:callDuration:interactionCount:interactionType:callPlace:distanceFromHome:homeAvailability:workAvailability:bundleVisitMapItemSource:bundleVisitPlaceType:bundleVisitPlaceLabelGranularity:bundleIncludesAnomalousEvent:isFiltered:bundleSuperType:bundleSubType:isAggregatedAndSuppressed:summarizationGranularity:includedInSummaryBundleOnly:subBundleIDs:subSuggestionIDs:firstCreationDate:resources:persons:mainPlace:otherPlaces:photoTraits:clusterMetadata:outlierMetadata:bundleGoodnessScore:distinctnessScore:richnessScore:engagementScore:heuristicsScore:metadataForRank:",
          v116,
          v114,
          v112,
          v110,
          v108,
          v55,
          v106,
          v104,
          v102,
          v100,
          v98,
          0,
          0,
          __PAIR64__(v53, v54),
          v17,
          v94,
          v96,
          v87,
          0,
          v19,
          0,
          0,
          0,
          0,
          0,
          0,
          v20,
          0,
          0,
          v21,
          v88,
          v92,
          v89,
          v83,
          v22,
          v85,
          v78,
          v80,
          v76,
          v74,
          v67,
          v23,
          0,
          0,
          v72,
          v48,
          v66,
          v70,
          v65,
          v68,
          v64,
          &__NSArray0__struct,
          v47,
          v24,
          v45,
          __PAIR64__(v42, v44),
          __PAIR64__(v41, v43),
          v40,
          __PAIR64__(v37, v39),
          __PAIR64__(v36, v38),
          v63);

  id v90 = objc_alloc((Class)BMMomentsEventData);
  v117 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v6 IHAState]);
  v115 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v6 age]);
  LODWORD(v88) = [v6 ageRange];
  LODWORD(v87) = [v6 biologicalSex];
  v95 = [v6 bundle];
  v111 = [v95 bundleStartDate];
  v93 = [v6 bundle];
  v113 = [v93 bundleEndDate];
  v109 = [v6 bundleInterface];
  v107 = [v6 bundleEvergreenType];
  v105 = -[MOBiomeManager suggestionTypeToString:](self, "suggestionTypeToString:", [v5 type]);
  id v9 = [v5 typeAppEntry];

  v103 = [(MOBiomeManager *)self appEntryTypeToString:v9];
  v86 = [v6 megaSignalTypeUsed];
  v84 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v6 viewVisibleSuggestionsCount]);
  v101 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v6 viewTotalSuggestionsCount]);
  LODWORD(v80) = [v6 onboardingFlowCompletionState];
  v79 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v6 isJournalAppInstalled]);
  v99 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v6 isJournalAppLocked]);
  v77 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v6 isJournalSuggestionSkipped]);
  v97 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v6 isActivitySettingsSwitchEnabled]);
  v73 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v6 isCommunicationSettingsSwitchEnabled]);
  v71 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v6 isSignificantLocationSettingsSwitchEnabled]);
  v75 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v6 isMediaSettingsSwitchEnabled]);
  v69 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v6 isNearbyPeopleSettingsSwitchEnabled]);
  id v10 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v6 isPhotoSettingsSwitchEnabled]);
  id v11 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v6 isStateOfMindSettingsSwitchEnabled]);
  id v12 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v6 isReflectionSettingsSwitchEnabled]);
  id v13 = [v6 isBroadSystemLocationSettingsSwitchEnabled];

  id v14 = +[NSNumber numberWithBool:v13];
  LODWORD(v18) = v80;
  LODWORD(v16) = v87;
  id v91 = objc_msgSend(v90, "initWithEvent:bundle:isBundle:IHAState:age:ageRange:biologicalSex:startDate:endDate:categoryOfEvent:bundleInterface:bundleEvergreenType:sugSeetEngType:appEntryEngType:megaSignalTypeUsed:viewVisibleSuggestionsCount:viewTotalSuggestionsCount:onboardingFlowCompletionState:isJournalAppInstalled:isJournalAppLocked:isJournalSuggestionSkipped:isActivitySettingsSwitchEnabled:isCommunicationSettingsSwitchEnabled:isSignificantLocationSettingsSwitchEnabled:isMediaSettingsSwitchEnabled:isNearbyPeopleSettingsSwitchEnabled:isPhotoSettingsSwitchEnabled:isStateOfMindSettingsSwitchEnabled:isReflectionSettingsSwitchEnabled:isBroadSystemLocationSettingsSwitchEnabled:", 0, v82, &__kCFBooleanTrue, v117, v115, v88, v16, v111, v113, 0, v109, v107,
          v105,
          v103,
          v86,
          v84,
          v101,
          v18,
          v79,
          v99,
          v77,
          v97,
          v73,
          v71,
          v75,
          v69,
          v10,
          v11,
          v12,
          v14);

  return v91;
}

- (void)_updateDataStreamWithEngagement
{
  id v3 = _mo_log_facility_get_os_log(&MOLogFacilityBiomeManager);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "update biome data stream with latest engagement.", buf, 2u);
  }

  id v4 = [(MOBiomeManager *)self stream];
  id v5 = [v4 source];

  id v6 = [(MOBiomeManager *)self stream];
  id v7 = [v6 pruner];

  uint64_t v8 = +[NSDate distantPast];
  id v9 = +[NSDate distantFuture];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = __49__MOBiomeManager__updateDataStreamWithEngagement__block_invoke;
  v12[3] = &unk_1002CFDB8;
  v12[4] = self;
  id v13 = v7;
  id v14 = v5;
  id v10 = v5;
  id v11 = v7;
  [(MOBiomeManager *)self fetchMomentsEventDataBetweenStartDate:v8 EndDate:v9 CompletionHandler:v12];
}

void __49__MOBiomeManager__updateDataStreamWithEngagement__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_opt_new();
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v25;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if ([v10 isBundle])
        {
          id v11 = [v10 bundle];
          id v12 = [v11 bundleIdentifier];
          [v4 setValue:v10 forKey:v12];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v7);
  }

  id v13 = [v4 allKeys];
  id v14 = +[NSSet setWithArray:v13];

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = __49__MOBiomeManager__updateDataStreamWithEngagement__block_invoke_2;
  v19[3] = &unk_1002CFD90;
  id v20 = v4;
  id v15 = *(void **)(a1 + 32);
  id v16 = *(id *)(a1 + 40);
  uint64_t v17 = *(void *)(a1 + 32);
  id v21 = v16;
  uint64_t v22 = v17;
  id v23 = *(id *)(a1 + 48);
  id v18 = v4;
  [v15 fetchMomentsEngagementForBundles:v14 CompletionHandler:v19];
}

void __49__MOBiomeManager__updateDataStreamWithEngagement__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = _mo_log_facility_get_os_log(&MOLogFacilityBiomeManager);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = [v2 count];
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "number of engagement biome events %lu.", (uint8_t *)&buf, 0xCu);
  }

  unsigned int v52 = objc_opt_new();
  long long v83 = 0u;
  long long v84 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  id obj = v2;
  id v54 = [obj countByEnumeratingWithState:&v81 objects:v93 count:16];
  if (v54)
  {
    uint64_t v53 = *(void *)v82;
    do
    {
      for (i = 0; i != v54; i = (char *)i + 1)
      {
        if (*(void *)v82 != v53) {
          objc_enumerationMutation(obj);
        }
        uint64_t v71 = *(void *)(*((void *)&v81 + 1) + 8 * i);
        v72 = [*(id *)(a1 + 32) objectForKeyedSubscript:];
        v68 = +[NSPredicate predicateWithFormat:@"engagementSource == %lu", 1];
        id v4 = [obj objectForKeyedSubscript:v71];
        v67 = [v4 filteredArrayUsingPredicate:v68];

        id v5 = +[NSSortDescriptor sortDescriptorWithKey:@"timestamp" ascending:0];
        v92 = v5;
        id v6 = +[NSArray arrayWithObjects:&v92 count:1];
        v66 = [v67 sortedArrayUsingDescriptors:v6];

        v73 = [v66 firstObject];
        v65 = +[NSPredicate predicateWithFormat:@"engagementSource == %lu", 2];
        id v7 = [obj objectForKeyedSubscript:v71];
        v64 = [v7 filteredArrayUsingPredicate:v65];

        uint64_t v8 = +[NSSortDescriptor sortDescriptorWithKey:@"timestamp" ascending:0];
        id v91 = v8;
        id v9 = +[NSArray arrayWithObjects:&v91 count:1];
        v63 = [v64 sortedArrayUsingDescriptors:v9];

        id v10 = [v63 firstObject];
        id v11 = [v72 bundle];
        unsigned int v12 = [v11 suggestionType];
        if (v12 == [v73 type])
        {
          id v13 = [v72 bundle];
          id v14 = [v13 suggestionTimestamp];
          id v15 = [v73 timestamp];
          unsigned int v16 = [v14 isEqualToDate:v15];

          int v17 = v16 ^ 1;
        }
        else
        {
          int v17 = 1;
        }

        id v18 = [v72 bundle];
        unsigned int v19 = [v18 appEntryEventType];
        if (v19 != [v10 typeAppEntry])
        {

LABEL_15:
          v56 = [MOBundleEngagement alloc];
          unsigned int v55 = [v73 type];
          v61 = [v73 timestamp];
          v60 = [v73 clientIdentifier];
          v59 = [v73 viewContainerName];
          [v73 viewVisibleTime];
          double v25 = v24;
          v58 = [v73 suggestionType];
          v57 = [v73 viewVisibleSuggestionsCount];
          long long v26 = [v73 viewTotalSuggestionsCount];
          unsigned int v27 = [v10 typeAppEntry];
          long long v28 = [v10 typeAppEntryStr];
          long long v29 = [v10 timestampAppEntry];
          long long v30 = [v10 startTimeAppEntry];
          long long v31 = [v10 endTimeAppEntry];
          long long v32 = [v10 clientIdentifierAppEntry];
          long long v33 = [v10 totalCharactersAppEntry];
          long long v34 = [v10 addedCharactersAppEntry];
          LODWORD(v51) = v27;
          long long v35 = -[MOBundleEngagement initWithType:timestamp:clientIdentifier:viewContainerName:viewVisibleTime:suggestionType:viewVisibleSuggestionsCount:viewTotalSuggestionsCount:typeAppEntry:typeAppEntryStr:timestampAppEntry:startTimeAppEntry:endTimeAppEntry:clientIdentifierAppEntry:totalCharactersAppEntry:addedCharactersAppEntry:engagementSource:](v56, "initWithType:timestamp:clientIdentifier:viewContainerName:viewVisibleTime:suggestionType:viewVisibleSuggestionsCount:viewTotalSuggestionsCount:typeAppEntry:typeAppEntryStr:timestampAppEntry:startTimeAppEntry:endTimeAppEntry:clientIdentifierAppEntry:totalCharactersAppEntry:addedCharactersAppEntry:engagementSource:", v55, v61, v60, v59, v58, v57, v25, v26, v51, v28, v29, v30, v31, v32, v33,
                  v34,
                  0);

          [v52 setValue:v35 forKey:v71];
          goto LABEL_16;
        }
        id v20 = [v72 bundle];
        id v21 = [v20 appEntryEventTimestamp];
        uint64_t v22 = [v10 timestampAppEntry];
        unsigned int v23 = [v21 isEqualToDate:v22];

        if ((v17 | v23 ^ 1) == 1) {
          goto LABEL_15;
        }
LABEL_16:
      }
      id v54 = [obj countByEnumeratingWithState:&v81 objects:v93 count:16];
    }
    while (v54);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v89 = 0x2020000000;
  uint64_t v90 = 0;
  unsigned int v36 = *(void **)(a1 + 40);
  v78[0] = _NSConcreteStackBlock;
  v78[1] = 3221225472;
  v78[2] = __49__MOBiomeManager__updateDataStreamWithEngagement__block_invoke_644;
  v78[3] = &unk_1002CFD68;
  id v37 = v52;
  id v79 = v37;
  p_long long buf = &buf;
  [v36 deleteEventsPassingTest:v78];
  unsigned int v38 = _mo_log_facility_get_os_log(&MOLogFacilityBiomeManager);
  if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
  {
    uint64_t v39 = *(void *)(*((void *)&buf + 1) + 24);
    *(_DWORD *)v86 = 134217984;
    uint64_t v87 = v39;
    _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "deleted %lu obsolete data events from biome.", v86, 0xCu);
  }

  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  id v40 = v37;
  uint64_t v41 = 0;
  id v42 = [v40 countByEnumeratingWithState:&v74 objects:v85 count:16];
  if (v42)
  {
    uint64_t v43 = *(void *)v75;
    do
    {
      unsigned int v44 = 0;
      v41 += (uint64_t)v42;
      do
      {
        if (*(void *)v75 != v43) {
          objc_enumerationMutation(v40);
        }
        uint64_t v45 = *(void *)(*((void *)&v74 + 1) + 8 * (void)v44);
        unsigned int v46 = [*(id *)(a1 + 32) objectForKeyedSubscript:v45];
        v47 = [v40 objectForKeyedSubscript:v45];
        unsigned int v48 = [*(id *)(a1 + 48) generateBiomeEventsFromMomentsEventDataBundle:v46 withBundleEngagement:v47];
        [*(id *)(a1 + 56) sendEvent:v48];

        unsigned int v44 = (char *)v44 + 1;
      }
      while (v42 != v44);
      id v42 = [v40 countByEnumeratingWithState:&v74 objects:v85 count:16];
    }
    while (v42);
  }

  unsigned int v49 = _mo_log_facility_get_os_log(&MOLogFacilityBiomeManager);
  if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v86 = 134217984;
    uint64_t v87 = v41;
    _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_INFO, "recreate %lu biome events with updated engagement.", v86, 0xCu);
  }

  unsigned int v50 = _mo_log_facility_get_os_log(&MOLogFacilityBiomeManager);
  if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v86 = 0;
    _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_INFO, "update biome stream with latest engagement done.", v86, 2u);
  }

  _Block_object_dispose(&buf, 8);
}

uint64_t __49__MOBiomeManager__updateDataStreamWithEngagement__block_invoke_644(uint64_t a1, void *a2)
{
  id v3 = [a2 eventBody];
  if (![v3 isBundle]) {
    goto LABEL_4;
  }
  id v4 = [*(id *)(a1 + 32) allKeys];
  id v5 = [v3 bundle];
  id v6 = [v5 bundleIdentifier];
  unsigned int v7 = [v4 containsObject:v6];

  if (v7)
  {
    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    uint64_t v8 = 1;
  }
  else
  {
LABEL_4:
    uint64_t v8 = 0;
  }

  return v8;
}

- (void)fetchMomentsEngagementForBundles:(id)a3 CompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6 && [v6 count])
  {
    uint64_t v8 = [(MOBiomeManager *)self queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __69__MOBiomeManager_fetchMomentsEngagementForBundles_CompletionHandler___block_invoke;
    block[3] = &unk_1002CB8C0;
    block[4] = self;
    id v12 = v7;
    id v11 = v6;
    dispatch_async(v8, block);
  }
  else
  {
    id v9 = _mo_log_facility_get_os_log(&MOLogFacilityBiomeManager);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "No bundle identifier is passed in to return any engagements.", buf, 2u);
    }

    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

void __69__MOBiomeManager_fetchMomentsEngagementForBundles_CompletionHandler___block_invoke(id *a1)
{
  id v2 = objc_opt_new();
  id v3 = [a1[4] engagementStream];
  id v4 = [v3 publisher];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = __69__MOBiomeManager_fetchMomentsEngagementForBundles_CompletionHandler___block_invoke_2;
  v10[3] = &unk_1002CFDE0;
  id v11 = v2;
  id v12 = a1[6];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __69__MOBiomeManager_fetchMomentsEngagementForBundles_CompletionHandler___block_invoke_648;
  v7[3] = &unk_1002CFE08;
  id v8 = a1[5];
  id v9 = v11;
  id v5 = v11;
  id v6 = [v4 sinkWithCompletion:v10 receiveInput:v7];
}

void __69__MOBiomeManager_fetchMomentsEngagementForBundles_CompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 state])
  {
    if ([v3 state] == (id)1)
    {
      id v4 = _mo_log_facility_get_os_log(&MOLogFacilityBiomeManager);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        __69__MOBiomeManager_fetchMomentsEngagementForBundles_CompletionHandler___block_invoke_2_cold_1(v3);
      }

      [*(id *)(a1 + 32) removeAllObjects];
    }
  }
  else
  {
    id v5 = _mo_log_facility_get_os_log(&MOLogFacilityBiomeManager);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = [*(id *)(a1 + 32) count];
      int v7 = 134217984;
      id v8 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Successfully fetched %ld engagement from MomentsEngagement.", (uint8_t *)&v7, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __69__MOBiomeManager_fetchMomentsEngagementForBundles_CompletionHandler___block_invoke_648(uint64_t a1, void *a2)
{
  id v3 = [a2 eventBody];
  id v4 = [MOBundleEngagement alloc];
  v66 = [v3 suggestionEvent];
  id v5 = [v66 type];
  v64 = [v3 suggestionEvent];
  id v6 = [v64 timestamp];
  v62 = [v3 suggestionEvent];
  v56 = [v62 clientIdentifier];
  v60 = [v3 suggestionEvent];
  int v7 = [v60 viewContainerName];
  v58 = [v3 suggestionEvent];
  [v58 viewVisibleTime];
  double v9 = v8;
  id v54 = [v3 suggestionEvent];
  unsigned int v50 = [v54 suggestionType];
  unsigned int v52 = [v3 suggestionEvent];
  id v10 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v52 viewVisibleSuggestionsCount]);
  id v11 = [v3 suggestionEvent];
  id v12 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v11 viewTotalSuggestionsCount]);
  LODWORD(v45) = 0;
  id v13 = -[MOBundleEngagement initWithType:timestamp:clientIdentifier:viewContainerName:viewVisibleTime:suggestionType:viewVisibleSuggestionsCount:viewTotalSuggestionsCount:typeAppEntry:typeAppEntryStr:timestampAppEntry:startTimeAppEntry:endTimeAppEntry:clientIdentifierAppEntry:totalCharactersAppEntry:addedCharactersAppEntry:engagementSource:](v4, "initWithType:timestamp:clientIdentifier:viewContainerName:viewVisibleTime:suggestionType:viewVisibleSuggestionsCount:viewTotalSuggestionsCount:typeAppEntry:typeAppEntryStr:timestampAppEntry:startTimeAppEntry:endTimeAppEntry:clientIdentifierAppEntry:totalCharactersAppEntry:addedCharactersAppEntry:engagementSource:", v5, v6, v56, v7, v50, v10, v9, v12, v45, 0, 0, 0, 0, 0, 0,
          0,
          1);

  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  id v14 = [v3 suggestionEvent];
  id v15 = [v14 fullBundleOrderedSet];

  id v16 = [v15 countByEnumeratingWithState:&v73 objects:v78 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v74;
    do
    {
      unsigned int v19 = 0;
      do
      {
        if (*(void *)v74 != v18) {
          objc_enumerationMutation(v15);
        }
        id v20 = [*(id *)(*((void *)&v73 + 1) + 8 * (void)v19) identifier];
        id v21 = [v20 bundleId];

        if ([*(id *)(a1 + 32) containsObject:v21])
        {
          uint64_t v22 = [*(id *)(a1 + 40) allKeys];
          unsigned __int8 v23 = [v22 containsObject:v21];

          if ((v23 & 1) == 0)
          {
            double v24 = *(void **)(a1 + 40);
            double v25 = objc_opt_new();
            [v24 setObject:v25 forKey:v21];
          }
          long long v26 = [*(id *)(a1 + 40) objectForKeyedSubscript:v21];
          [v26 addObject:v13];
        }
        unsigned int v19 = (char *)v19 + 1;
      }
      while (v17 != v19);
      id v17 = [v15 countByEnumeratingWithState:&v73 objects:v78 count:16];
    }
    while (v17);
  }

  v57 = [MOBundleEngagement alloc];
  v65 = [v3 entryEvent];
  unsigned int v55 = [v65 type];
  v63 = [v3 entryEvent];
  uint64_t v51 = [v63 appEntryEventType];
  v61 = [v3 entryEvent];
  v67 = [v61 timestamp];
  v59 = [v3 entryEvent];
  v47 = [v59 startTime];
  uint64_t v53 = [v3 entryEvent];
  unsigned int v27 = [v53 endTime];
  unsigned int v49 = [v3 entryEvent];
  long long v28 = [v49 clientIdentifier];
  unsigned int v48 = [v3 entryEvent];
  long long v29 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v48 totalCharacters]);
  long long v30 = [v3 entryEvent];
  long long v31 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v30 addedCharacters]);
  LODWORD(v46) = v55;
  long long v32 = -[MOBundleEngagement initWithType:timestamp:clientIdentifier:viewContainerName:viewVisibleTime:suggestionType:viewVisibleSuggestionsCount:viewTotalSuggestionsCount:typeAppEntry:typeAppEntryStr:timestampAppEntry:startTimeAppEntry:endTimeAppEntry:clientIdentifierAppEntry:totalCharactersAppEntry:addedCharactersAppEntry:engagementSource:](v57, "initWithType:timestamp:clientIdentifier:viewContainerName:viewVisibleTime:suggestionType:viewVisibleSuggestionsCount:viewTotalSuggestionsCount:typeAppEntry:typeAppEntryStr:timestampAppEntry:startTimeAppEntry:endTimeAppEntry:clientIdentifierAppEntry:totalCharactersAppEntry:addedCharactersAppEntry:engagementSource:", 0, 0, 0, 0, 0, 0, 0.0, 0, v46, v51, v67, v47, v27, v28, v29,
          v31,
          2);

  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  v68 = v3;
  long long v33 = [v3 entryEvent];
  long long v34 = [v33 identifier];

  id v35 = [v34 countByEnumeratingWithState:&v69 objects:v77 count:16];
  if (v35)
  {
    id v36 = v35;
    uint64_t v37 = *(void *)v70;
    do
    {
      unsigned int v38 = 0;
      do
      {
        if (*(void *)v70 != v37) {
          objc_enumerationMutation(v34);
        }
        uint64_t v39 = [*(id *)(*((void *)&v69 + 1) + 8 * (void)v38) bundleId];
        if ([*(id *)(a1 + 32) containsObject:v39])
        {
          id v40 = [*(id *)(a1 + 40) allKeys];
          unsigned __int8 v41 = [v40 containsObject:v39];

          if ((v41 & 1) == 0)
          {
            id v42 = *(void **)(a1 + 40);
            uint64_t v43 = objc_opt_new();
            [v42 setObject:v43 forKey:v39];
          }
          unsigned int v44 = [*(id *)(a1 + 40) objectForKeyedSubscript:v39];
          [v44 addObject:v32];
        }
        unsigned int v38 = (char *)v38 + 1;
      }
      while (v36 != v38);
      id v36 = [v34 countByEnumeratingWithState:&v69 objects:v77 count:16];
    }
    while (v36);
  }
}

- (void)fetchMomentsEventDataBetweenStartDate:(id)a3 EndDate:(id)a4 CompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void))a5;
  id v11 = [v8 earlierDate:v9];
  unsigned int v12 = [v11 isEqualToDate:v9];

  if (v12)
  {
    id v13 = _mo_log_facility_get_os_log(&MOLogFacilityBiomeManager);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[MOBiomeManager fetchMomentsEventDataBetweenStartDate:EndDate:CompletionHandler:]();
    }

    v10[2](v10, 0);
  }
  else
  {
    id v14 = [(MOBiomeManager *)self queue];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = __82__MOBiomeManager_fetchMomentsEventDataBetweenStartDate_EndDate_CompletionHandler___block_invoke;
    v15[3] = &unk_1002CB898;
    v15[4] = self;
    uint64_t v18 = v10;
    id v16 = v9;
    id v17 = v8;
    dispatch_async(v14, v15);
  }
}

void __82__MOBiomeManager_fetchMomentsEventDataBetweenStartDate_EndDate_CompletionHandler___block_invoke(id *a1)
{
  id v2 = objc_opt_new();
  id v3 = [a1[4] stream];
  id v4 = [v3 publisher];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = __82__MOBiomeManager_fetchMomentsEventDataBetweenStartDate_EndDate_CompletionHandler___block_invoke_2;
  v13[3] = &unk_1002CFE30;
  id v5 = v2;
  id v6 = a1[4];
  id v14 = v5;
  id v15 = v6;
  id v16 = a1[7];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __82__MOBiomeManager_fetchMomentsEventDataBetweenStartDate_EndDate_CompletionHandler___block_invoke_2_652;
  v9[3] = &unk_1002CFE58;
  id v10 = a1[5];
  id v11 = a1[6];
  id v12 = v5;
  id v7 = v5;
  id v8 = [v4 sinkWithCompletion:v13 receiveInput:v9];
}

void __82__MOBiomeManager_fetchMomentsEventDataBetweenStartDate_EndDate_CompletionHandler___block_invoke_2(id *a1, void *a2)
{
  id v3 = a2;
  if ([v3 state])
  {
    if ([v3 state] == (id)1)
    {
      id v4 = _mo_log_facility_get_os_log(&MOLogFacilityBiomeManager);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        __82__MOBiomeManager_fetchMomentsEventDataBetweenStartDate_EndDate_CompletionHandler___block_invoke_2_cold_1(v3);
      }

      [a1[4] removeAllObjects];
    }
  }
  else
  {
    id v5 = _mo_log_facility_get_os_log(&MOLogFacilityBiomeManager);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = [a1[4] count];
      *(_DWORD *)long long buf = 134217984;
      id v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Successfully fetched %ld MomentsEventData from Biome", buf, 0xCu);
    }
  }
  id v7 = [a1[5] queue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __82__MOBiomeManager_fetchMomentsEventDataBetweenStartDate_EndDate_CompletionHandler___block_invoke_651;
  v8[3] = &unk_1002CEFD0;
  id v10 = a1[6];
  id v9 = a1[4];
  dispatch_async(v7, v8);
}

uint64_t __82__MOBiomeManager_fetchMomentsEventDataBetweenStartDate_EndDate_CompletionHandler___block_invoke_651(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __82__MOBiomeManager_fetchMomentsEventDataBetweenStartDate_EndDate_CompletionHandler___block_invoke_2_652(uint64_t a1, void *a2)
{
  id v3 = [a2 eventBody];
  if (v3)
  {
    id v11 = v3;
    if ([v3 isBundle])
    {
      id v4 = [v11 bundle];
      [v4 bundleStartDate];
    }
    else
    {
      id v4 = [v11 event];
      [v4 startDate];
    id v5 = };

    if ([v11 isBundle])
    {
      id v6 = [v11 bundle];
      [v6 bundleEndDate];
    }
    else
    {
      id v6 = [v11 event];
      [v6 endDate];
    id v7 = };

    id v8 = [v5 earlierDate:*(void *)(a1 + 32)];
    if ([v8 isEqualToDate:*(void *)(a1 + 32)])
    {
    }
    else
    {
      id v9 = [v7 laterDate:*(void *)(a1 + 40)];
      unsigned __int8 v10 = [v9 isEqualToDate:*(void *)(a1 + 40)];

      if ((v10 & 1) == 0) {
        [*(id *)(a1 + 48) addObject:v11];
      }
    }

    id v3 = v11;
  }
}

- (void)_fetchAndSetDemographicsWithCompletionHandler:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v6 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[MOBiomeManager _fetchAndSetDemographicsWithCompletionHandler:](v6);
    }

    id v7 = +[NSAssertionHandler currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"MOBiomeManager.m" lineNumber:714 description:@"Invalid parameter not satisfying: completion (in %s:%d)", "-[MOBiomeManager _fetchAndSetDemographicsWithCompletionHandler:]", 714];
  }
  if (self->_eventManager
    && objc_opt_class()
    && (+[MCProfileConnection sharedConnection],
        id v8 = objc_claimAutoreleasedReturnValue(),
        unsigned int v9 = [v8 isHealthDataSubmissionAllowed],
        v8,
        v9))
  {
    unsigned __int8 v10 = [(MOBiomeManager *)self queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __64__MOBiomeManager__fetchAndSetDemographicsWithCompletionHandler___block_invoke;
    block[3] = &unk_1002CCDC0;
    block[4] = self;
    id v14 = v5;
    dispatch_async(v10, block);
  }
  else
  {
    id v11 = _mo_log_facility_get_os_log(&MOLogFacilityBiomeManager);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "no IHA permission", buf, 2u);
    }

    (*((void (**)(id, void, void))v5 + 2))(v5, 0, 0);
  }
}

void __64__MOBiomeManager__fetchAndSetDemographicsWithCompletionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setStateIHA:&__kCFBooleanTrue];
  id v2 = _mo_log_facility_get_os_log(&MOLogFacilityBiomeManager);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Fetching age/biologicalSex with IHA permission.", buf, 2u);
  }

  *(void *)long long buf = 0;
  v68 = buf;
  uint64_t v69 = 0x3032000000;
  long long v70 = __Block_byref_object_copy__27;
  long long v71 = __Block_byref_object_dispose__27;
  id v72 = 0;
  uint64_t v64 = 0;
  v65[0] = &v64;
  v65[1] = 0x3032000000;
  v65[2] = __Block_byref_object_copy__27;
  v65[3] = __Block_byref_object_dispose__27;
  id v66 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  id v4 = [*(id *)(a1 + 32) eventManager];
  id v5 = [v4 getHealthKitManager];

  v60[0] = _NSConcreteStackBlock;
  v60[1] = 3221225472;
  v60[2] = __64__MOBiomeManager__fetchAndSetDemographicsWithCompletionHandler___block_invoke_657;
  v60[3] = &unk_1002CCDE8;
  id v6 = v3;
  v61 = v6;
  v62 = buf;
  v63 = &v64;
  [v5 fetchUserBiologicalSexWithHandler:v60];
  id v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ - [%s] - %d - %s", @"MOSemaphoreWait", "/Library/Caches/com.apple.xbs/Sources/Moments/momentsd/PromptEngine/Biome/MOBiomeManager.m", 736, "-[MOBiomeManager _fetchAndSetDemographicsWithCompletionHandler:]_block_invoke_2");
  id v59 = 0;
  BOOL v8 = MOSemaphoreWaitAndFaultIfTimeoutDefaultTimeout_Internal(v6, &v59, v7);
  id v9 = v59;
  id v10 = v59;
  if (!v8)
  {
    id v11 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke_cold_3();
    }
  }
  if (*(void *)(v65[0] + 40))
  {
    id v12 = _mo_log_facility_get_os_log(&MOLogFacilityBiomeManager);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke_cold_5((uint64_t)v65, v12, v13, v14, v15, v16, v17, v18);
    }
  }
  if (v10)
  {
    unsigned int v19 = _mo_log_facility_get_os_log(&MOLogFacilityBiomeManager);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      __64__MOBiomeManager__fetchAndSetDemographicsWithCompletionHandler___block_invoke_cold_4();
    }

    objc_storeStrong((id *)(v65[0] + 40), v9);
  }
  id v20 = (void *)*((void *)v68 + 5);
  if (v20)
  {
    id v21 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v20 biologicalSex]);
    [*(id *)(a1 + 32) setBiologicalSex:v21];
  }
  uint64_t v53 = 0;
  id v54 = &v53;
  uint64_t v55 = 0x3032000000;
  v56 = __Block_byref_object_copy__27;
  v57 = __Block_byref_object_dispose__27;
  id v58 = 0;
  uint64_t v50 = 0;
  v51[0] = &v50;
  v51[1] = 0x3032000000;
  v51[2] = __Block_byref_object_copy__27;
  v51[3] = __Block_byref_object_dispose__27;
  id v52 = 0;
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = __64__MOBiomeManager__fetchAndSetDemographicsWithCompletionHandler___block_invoke_667;
  v46[3] = &unk_1002CCE10;
  uint64_t v22 = dispatch_semaphore_create(0);
  v47 = v22;
  unsigned int v48 = &v53;
  unsigned int v49 = &v50;
  [v5 fetchUserAgeWithHandler:v46];
  unsigned __int8 v23 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ - [%s] - %d - %s", @"MOSemaphoreWait", "/Library/Caches/com.apple.xbs/Sources/Moments/momentsd/PromptEngine/Biome/MOBiomeManager.m", 765, "-[MOBiomeManager _fetchAndSetDemographicsWithCompletionHandler:]_block_invoke_2");
  id v45 = 0;
  BOOL v24 = MOSemaphoreWaitAndFaultIfTimeoutDefaultTimeout_Internal(v22, &v45, v23);
  id v25 = v45;
  id v26 = v45;
  if (!v24)
  {
    unsigned int v27 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke_cold_3();
    }
  }
  if (*(void *)(v51[0] + 40))
  {
    long long v28 = _mo_log_facility_get_os_log(&MOLogFacilityBiomeManager);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      __50__MOUserData__fetchUserDataWithCompletionHandler___block_invoke_cold_2((uint64_t)v51, v28, v29, v30, v31, v32, v33, v34);
    }
  }
  if (v26)
  {
    id v35 = _mo_log_facility_get_os_log(&MOLogFacilityBiomeManager);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      __64__MOBiomeManager__fetchAndSetDemographicsWithCompletionHandler___block_invoke_cold_1();
    }

    objc_storeStrong((id *)(v51[0] + 40), v25);
  }
  id v36 = (void *)v54[5];
  if (v36)
  {
    id v37 = [v36 copy];
    [*(id *)(a1 + 32) setAge:v37];
  }
  unsigned int v38 = [*(id *)(a1 + 32) age];
  uint64_t v39 = +[MOMetric binForNumber:v38 bins:&off_1002F9170];
  [*(id *)(a1 + 32) setAgeBucketed:v39];

  id v40 = [*(id *)(a1 + 32) queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __64__MOBiomeManager__fetchAndSetDemographicsWithCompletionHandler___block_invoke_682;
  block[3] = &unk_1002CFE80;
  id v42 = *(id *)(a1 + 40);
  uint64_t v43 = &v64;
  unsigned int v44 = &v50;
  dispatch_async(v40, block);

  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(&v53, 8);

  _Block_object_dispose(&v64, 8);
  _Block_object_dispose(buf, 8);
}

void __64__MOBiomeManager__fetchAndSetDemographicsWithCompletionHandler___block_invoke_657(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  if (!a3)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = 0;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __64__MOBiomeManager__fetchAndSetDemographicsWithCompletionHandler___block_invoke_667(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  if (!a3)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = 0;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __64__MOBiomeManager__fetchAndSetDemographicsWithCompletionHandler___block_invoke_682(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[4] + 16))(a1[4], *(void *)(*(void *)(a1[5] + 8) + 40), *(void *)(*(void *)(a1[6] + 8) + 40));
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (BMStream)stream
{
  return self->_stream;
}

- (BMStream)engagementStream
{
  return self->_engagementStream;
}

- (MOEventManager)eventManager
{
  return self->_eventManager;
}

- (void)setEventManager:(id)a3
{
}

- (MOBiomeDonationUtility)biomeDonationUtility
{
  return self->_biomeDonationUtility;
}

- (void)setBiomeDonationUtility:(id)a3
{
}

- (NSNumber)stateIHA
{
  return self->_stateIHA;
}

- (void)setStateIHA:(id)a3
{
}

- (NSNumber)age
{
  return self->_age;
}

- (void)setAge:(id)a3
{
}

- (NSNumber)ageBucketed
{
  return self->_ageBucketed;
}

- (void)setAgeBucketed:(id)a3
{
}

- (NSNumber)biologicalSex
{
  return self->_biologicalSex;
}

- (void)setBiologicalSex:(id)a3
{
}

- (BOOL)setDefault
{
  return self->_setDefault;
}

- (void)setSetDefault:(BOOL)a3
{
  self->_setDefault = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_biologicalSex, 0);
  objc_storeStrong((id *)&self->_ageBucketed, 0);
  objc_storeStrong((id *)&self->_age, 0);
  objc_storeStrong((id *)&self->_stateIHA, 0);
  objc_storeStrong((id *)&self->_biomeDonationUtility, 0);
  objc_storeStrong((id *)&self->_eventManager, 0);
  objc_storeStrong((id *)&self->_engagementStream, 0);
  objc_storeStrong((id *)&self->_stream, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)initWithEventManager:(os_log_t)log setDefaultValues:.cold.1(os_log_t log)
{
  *(_WORD *)dispatch_queue_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: eventManager", v1, 2u);
}

void __62__MOBiomeManager_donateEvents_andBundles_andOnboardingStatus___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_8();
  OUTLINED_FUNCTION_4_2((void *)&_mh_execute_header, v0, v1, "fetching age/gender hit an error. biologicalSexFetchError: %@, ageFetchError: %@");
}

void __69__MOBiomeManager_fetchMomentsEngagementForBundles_CompletionHandler___block_invoke_2_cold_1(void *a1)
{
  os_log_t v1 = [a1 error];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5_1((void *)&_mh_execute_header, v2, v3, "returning no engagement due to biome query error: %@", v4, v5, v6, v7, v8);
}

- (void)fetchMomentsEventDataBetweenStartDate:EndDate:CompletionHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_8();
  OUTLINED_FUNCTION_4_2((void *)&_mh_execute_header, v0, v1, "bad biome fetch parameters. startDate is after endDate. startDate: %@, endDate: %@");
}

void __82__MOBiomeManager_fetchMomentsEventDataBetweenStartDate_EndDate_CompletionHandler___block_invoke_2_cold_1(void *a1)
{
  os_log_t v1 = [a1 error];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5_1((void *)&_mh_execute_header, v2, v3, "completionHandler not called due to biome query error: %@", v4, v5, v6, v7, v8);
}

- (void)_fetchAndSetDemographicsWithCompletionHandler:(os_log_t)log .cold.1(os_log_t log)
{
  int v1 = 136315394;
  uint64_t v2 = "-[MOBiomeManager _fetchAndSetDemographicsWithCompletionHandler:]";
  __int16 v3 = 1024;
  int v4 = 714;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completion (in %s:%d)", (uint8_t *)&v1, 0x12u);
}

void __64__MOBiomeManager__fetchAndSetDemographicsWithCompletionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "sema error occurred during fetching age from health kit, %@", v2, v3, v4, v5, v6);
}

void __64__MOBiomeManager__fetchAndSetDemographicsWithCompletionHandler___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "sema error occurred during fetching gender from health kit, %@", v2, v3, v4, v5, v6);
}

@end
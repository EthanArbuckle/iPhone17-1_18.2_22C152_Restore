@interface MOEngagementHistoryManager
+ (id)appEntryEventToString:(id)a3;
+ (id)suggestionEventToLabel:(unint64_t)a3;
+ (unint64_t)appEntryEventToEnum:(id)a3;
+ (unint64_t)clientEventToEnum:(id)a3;
+ (unint64_t)getEngagmentTypeForEvent:(id)a3;
+ (unint64_t)suggestionEventToEnum:(id)a3;
- (BMBookmarkablePublisher)stream_publisher;
- (BMSource)stream_source;
- (BOOL)isInternalBuild;
- (MOEngagementHistoryManager)initWithUniverse:(id)a3;
- (NSArray)suggestionEngagementTypesEligibleForRawExternalAnalytics;
- (id)_convertStringArrayIntoCombinedHashedString:(id)a3;
- (id)fetchAppEntryEngagementEventsFromStartDate:(id)a3 toEndDate:(id)a4 withError:(id *)a5;
- (id)fetchAppEntryEngagementEventsWithTypes:(id)a3 fromStartDate:(id)a4 toEndDate:(id)a5 withError:(id *)a6;
- (id)fetchSuggestionEngagementEventsFromStartDate:(id)a3 toEndDate:(id)a4 withError:(id *)a5;
- (id)fetchSuggestionEngagementEventsWithTypes:(id)a3 fromStartDate:(id)a4 toEndDate:(id)a5 withError:(id *)a6;
- (id)getBMBundleSumaryForBundle:(id)a3;
- (id)getEngagementBundleSumarySetForBundles:(id)a3;
- (id)getEngagementStreamAsJson;
- (id)getEvergreenCountForSuggestionsSelectedOnlyFromStartDate:(id)a3 toEndDate:(id)a4;
- (id)getEvergreenTypeCountForAppEntryEvent:(id)a3 withMinAddedCharacterCount:(int64_t)a4 andMaxAddedCharacterCount:(int64_t)a5 fromStartDate:(id)a6 toEndDate:(id)a7 onceForEachBundle:(BOOL)a8 skipForEvents:(id)a9;
- (id)getEvergreenTypeCountForAppEntryEvent:(id)a3 withMinimumAddedCharacters:(int64_t)a4;
- (id)getEvergreenTypeCountForSuggestionEngagmentEvent:(id)a3;
- (id)getEvergreenTypeCountForSuggestionEngagmentEvent:(id)a3 from:(id)a4 to:(id)a5 onceForEachBundle:(BOOL)a6 skipForEvents:(id)a7;
- (id)getEvergreenTypeCountForSuggestionsDeletedFromStartDate:(id)a3 toEndDate:(id)a4;
- (id)getEvergreenTypeCountForSuggestionsQuickAddEntryFromStartDate:(id)a3 toEndDate:(id)a4;
- (id)getEvergreenTypeCountForSuggestionsViewedFromStartDate:(id)a3 toEndDate:(id)a4;
- (id)getEvergreenTypeCountForSuggestionsWithJournalCreatedButNoWritingFromStartDate:(id)a3 toEndDate:(id)a4;
- (id)getEvergreenTypeCountForSuggestionsWithJournalCreatedFromStartDate:(id)a3 toEndDate:(id)a4 withMinimumAddedCharacters:(int64_t)a5;
- (id)getInterfaceTypeCountForAppEntryEvent:(id)a3 withMinAddedCharacterCount:(int64_t)a4 andMaxAddedCharacterCount:(int64_t)a5 fromStartDate:(id)a6 toEndDate:(id)a7 onceForEachBundle:(BOOL)a8 skipForEvents:(id)a9;
- (id)getInterfaceTypeCountForAppEntryEvent:(id)a3 withMinimumAddedCharacters:(int64_t)a4;
- (id)getInterfaceTypeCountForSuggestionEngagmentEvent:(id)a3;
- (id)getInterfaceTypeCountForSuggestionEngagmentEvent:(id)a3 from:(id)a4 to:(id)a5 onceForEachBundle:(BOOL)a6 skipForEvents:(id)a7;
- (id)getInterfaceTypeCountForUniqueSuggestionsDeletedFromStartDate:(id)a3 toEndDate:(id)a4;
- (id)getInterfaceTypeCountForUniqueSuggestionsQuickAddEntryFromStartDate:(id)a3 toEndDate:(id)a4;
- (id)getInterfaceTypeCountForUniqueSuggestionsSelectedOnlyFromStartDate:(id)a3 toEndDate:(id)a4;
- (id)getInterfaceTypeCountForUniqueSuggestionsViewedButNotEngagedFromStartDate:(id)a3 toEndDate:(id)a4;
- (id)getInterfaceTypeCountForUniqueSuggestionsViewedFromStartDate:(id)a3 toEndDate:(id)a4;
- (id)getInterfaceTypeCountForUniqueSuggestionsWithJournalCreatedButNoWritingFromStartDate:(id)a3 toEndDate:(id)a4;
- (id)getInterfaceTypeCountForUniqueSuggestionsWithJournalCreatedFromStartDate:(id)a3 toEndDate:(id)a4 withMinimumAddedCharacters:(int64_t)a5;
- (id)getPhotoAssetsForBundle:(id)a3;
- (id)getSuggestionAssetsForBundle:(id)a3;
- (unint64_t)determineAddedCharacterBinRange:(int64_t)a3;
- (void)didAppEntryEventPosted:(unint64_t)a3 withBundles:(id)a4 timestamp:(id)a5 duringInterval:(id)a6 withInfo:(id)a7 withTrialExperimentIDs:(id)a8 withOnboardingStatus:(id)a9;
- (void)didEngagementEventPosted:(id)a3 withBundles:(id)a4 timestamp:(id)a5 withContext:(id)a6 withTrialExperimentIDs:(id)a7 withOnboardingStatus:(id)a8;
- (void)eventBundleStore:(id)a3 needsEngagementInfoForBundles:(id)a4;
- (void)submitAppEntryEngagementEventAnalytics:(id)a3 appEntryEngagementType:(unint64_t)a4 timestamp:(id)a5 withInfo:(id)a6 withTrialExperimentIDs:(id)a7;
- (void)submitSuggestionEngagementEventAnalytics:(id)a3 suggestionEngagementType:(unint64_t)a4 timestamp:(id)a5 withContext:(id)a6 withTrialExperimentIDs:(id)a7;
- (void)updateBundle:(id)a3 forAppEntryEvent:(id)a4;
- (void)updateBundle:(id)a3 forSuggestionEvent:(id)a4 withSummary:(id)a5;
@end

@implementation MOEngagementHistoryManager

- (MOEngagementHistoryManager)initWithUniverse:(id)a3
{
  id v5 = a3;
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  v8 = [v5 getService:v7];

  if (v8)
  {
    v27.receiver = self;
    v27.super_class = (Class)MOEngagementHistoryManager;
    v9 = [(MOEngagementHistoryManager *)&v27 init];
    if (v9)
    {
      v10 = BiomeLibrary();
      v11 = [v10 Moments];
      v12 = [v11 Events];
      v13 = [v12 Engagement];
      uint64_t v14 = [v13 source];
      stream_source = v9->_stream_source;
      v9->_stream_source = (BMSource *)v14;

      v16 = BiomeLibrary();
      v17 = [v16 Moments];
      v18 = [v17 Events];
      v19 = [v18 Engagement];
      uint64_t v20 = [v19 publisher];
      stream_publisher = v9->_stream_publisher;
      v9->_stream_publisher = (BMBookmarkablePublisher *)v20;

      v9->_isInternalBuild = +[MOPlatformInfo isInternalBuild];
      suggestionEngagementTypesEligibleForRawExternalAnalytics = v9->_suggestionEngagementTypesEligibleForRawExternalAnalytics;
      v9->_suggestionEngagementTypesEligibleForRawExternalAnalytics = (NSArray *)&off_1002F9188;

      [v8 setEngagementDelegate:v9];
    }
    self = v9;
    v23 = self;
  }
  else
  {
    v24 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[MOEngagementHistoryManager initWithUniverse:]();
    }

    v25 = +[NSAssertionHandler currentHandler];
    [v25 handleFailureInMethod:a2 object:self file:@"MOEngagementHistoryManager.m" lineNumber:57 description:@"Invalid parameter not satisfying: bundleStore"];

    v23 = 0;
  }

  return v23;
}

+ (unint64_t)suggestionEventToEnum:(id)a3
{
  id v3 = a3;
  if (suggestionEventToEnum__onceToken != -1) {
    dispatch_once(&suggestionEventToEnum__onceToken, &__block_literal_global_36);
  }
  v4 = [(id)suggestionEventToEnum__eventMapping objectForKeyedSubscript:v3];
  id v5 = v4;
  if (v4) {
    unint64_t v6 = [v4 unsignedIntValue];
  }
  else {
    unint64_t v6 = 0;
  }

  return v6;
}

void __52__MOEngagementHistoryManager_suggestionEventToEnum___block_invoke(id a1)
{
  v27[0] = @"suggestionsUnknown";
  v26 = +[NSNumber numberWithUnsignedInt:0];
  v28[0] = v26;
  v27[1] = @"suggestionsSelected";
  v25 = +[NSNumber numberWithUnsignedInt:1];
  v28[1] = v25;
  v27[2] = @"suggestionsShared";
  v24 = +[NSNumber numberWithUnsignedInt:2];
  v28[2] = v24;
  v27[3] = @"suggestionsLiked";
  v23 = +[NSNumber numberWithUnsignedInt:3];
  v28[3] = v23;
  v27[4] = @"suggestionsDisliked";
  v22 = +[NSNumber numberWithUnsignedInt:4];
  v28[4] = v22;
  v27[5] = @"suggestionsDismissed";
  v21 = +[NSNumber numberWithUnsignedInt:5];
  v28[5] = v21;
  v27[6] = @"suggestionsDeleted";
  uint64_t v20 = +[NSNumber numberWithUnsignedInt:6];
  v28[6] = v20;
  v27[7] = @"suggestionsHidden";
  v19 = +[NSNumber numberWithUnsignedInt:7];
  v28[7] = v19;
  v27[8] = @"suggestionsQuickAddEntry";
  v18 = +[NSNumber numberWithUnsignedInt:8];
  v28[8] = v18;
  v27[9] = @"suggestionsFavorite";
  v17 = +[NSNumber numberWithUnsignedInt:11];
  v28[9] = v17;
  v27[10] = @"suggestionEntryCreated";
  v16 = +[NSNumber numberWithUnsignedInt:13];
  v28[10] = v16;
  v27[11] = @"suggestionEntryEdited";
  v15 = +[NSNumber numberWithUnsignedInt:14];
  v28[11] = v15;
  v27[12] = @"suggestionEntryDeleted";
  uint64_t v14 = +[NSNumber numberWithUnsignedInt:15];
  v28[12] = v14;
  v27[13] = @"suggestionEntryCancelled";
  v13 = +[NSNumber numberWithUnsignedInt:16];
  v28[13] = v13;
  v27[14] = @"suggestionEntryCreatedWithUpdates";
  v1 = +[NSNumber numberWithUnsignedInt:25];
  v28[14] = v1;
  v27[15] = @"suggestionsViewed";
  v2 = +[NSNumber numberWithUnsignedInt:9];
  v28[15] = v2;
  v27[16] = @"suggestionsThumbsUp";
  id v3 = +[NSNumber numberWithUnsignedInt:12];
  v28[16] = v3;
  v27[17] = @"suggestionsAnnotated";
  v4 = +[NSNumber numberWithUnsignedInt:17];
  v28[17] = v4;
  v27[18] = @"suggestionNotificationQueued";
  id v5 = +[NSNumber numberWithUnsignedInt:26];
  v28[18] = v5;
  v27[19] = @"suggestionNotificationDequeued";
  unint64_t v6 = +[NSNumber numberWithUnsignedInt:27];
  v28[19] = v6;
  v27[20] = @"suggestionNotificationTapped";
  v7 = +[NSNumber numberWithUnsignedInt:28];
  v28[20] = v7;
  v27[21] = @"suggestionNotificationDismissed";
  v8 = +[NSNumber numberWithUnsignedInt:29];
  v28[21] = v8;
  v27[22] = @"suggestionNotificationPosted";
  v9 = +[NSNumber numberWithUnsignedInt:30];
  v28[22] = v9;
  v27[23] = @"suggestionNotificationOverriden";
  v10 = +[NSNumber numberWithUnsignedInt:31];
  v28[23] = v10;
  uint64_t v11 = +[NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:24];
  v12 = (void *)suggestionEventToEnum__eventMapping;
  suggestionEventToEnum__eventMapping = v11;
}

+ (id)suggestionEventToLabel:(unint64_t)a3
{
  if (suggestionEventToLabel__onceToken != -1) {
    dispatch_once(&suggestionEventToLabel__onceToken, &__block_literal_global_350);
  }
  v4 = (void *)suggestionEventToLabel__eventMapping;
  id v5 = +[NSNumber numberWithUnsignedInt:a3];
  unint64_t v6 = [v4 objectForKeyedSubscript:v5];

  if (!v6) {
    unint64_t v6 = @"suggestionsUnknown";
  }

  return v6;
}

void __53__MOEngagementHistoryManager_suggestionEventToLabel___block_invoke(id a1)
{
  v26 = +[NSNumber numberWithUnsignedInt:0];
  v27[0] = v26;
  v28[0] = @"suggestionsUnknown";
  v25 = +[NSNumber numberWithUnsignedInt:1];
  v27[1] = v25;
  v28[1] = @"suggestionsSelected";
  v24 = +[NSNumber numberWithUnsignedInt:2];
  v27[2] = v24;
  v28[2] = @"suggestionsShared";
  v23 = +[NSNumber numberWithUnsignedInt:3];
  v27[3] = v23;
  v28[3] = @"suggestionsLiked";
  v22 = +[NSNumber numberWithUnsignedInt:4];
  v27[4] = v22;
  v28[4] = @"suggestionsDisliked";
  v21 = +[NSNumber numberWithUnsignedInt:5];
  v27[5] = v21;
  v28[5] = @"suggestionsDismissed";
  uint64_t v20 = +[NSNumber numberWithUnsignedInt:6];
  v27[6] = v20;
  v28[6] = @"suggestionsDeleted";
  v19 = +[NSNumber numberWithUnsignedInt:7];
  v27[7] = v19;
  v28[7] = @"suggestionsHidden";
  v18 = +[NSNumber numberWithUnsignedInt:8];
  v27[8] = v18;
  v28[8] = @"suggestionsQuickAddEntry";
  v17 = +[NSNumber numberWithUnsignedInt:11];
  v27[9] = v17;
  v28[9] = @"suggestionsFavorite";
  v16 = +[NSNumber numberWithUnsignedInt:13];
  v27[10] = v16;
  v28[10] = @"suggestionEntryCreated";
  v15 = +[NSNumber numberWithUnsignedInt:14];
  v27[11] = v15;
  v28[11] = @"suggestionEntryEdited";
  uint64_t v14 = +[NSNumber numberWithUnsignedInt:15];
  v27[12] = v14;
  v28[12] = @"suggestionEntryDeleted";
  v13 = +[NSNumber numberWithUnsignedInt:16];
  v27[13] = v13;
  v28[13] = @"suggestionEntryCancelled";
  v1 = +[NSNumber numberWithUnsignedInt:25];
  v27[14] = v1;
  v28[14] = @"suggestionEntryCreatedWithUpdates";
  v2 = +[NSNumber numberWithUnsignedInt:9];
  v27[15] = v2;
  v28[15] = @"suggestionsViewed";
  id v3 = +[NSNumber numberWithUnsignedInt:12];
  v27[16] = v3;
  v28[16] = @"suggestionsThumbsUp";
  v4 = +[NSNumber numberWithUnsignedInt:17];
  v27[17] = v4;
  v28[17] = @"suggestionsAnnotated";
  id v5 = +[NSNumber numberWithUnsignedInt:26];
  v27[18] = v5;
  v28[18] = @"suggestionNotificationQueued";
  unint64_t v6 = +[NSNumber numberWithUnsignedInt:27];
  v27[19] = v6;
  v28[19] = @"suggestionNotificationDequeued";
  v7 = +[NSNumber numberWithUnsignedInt:28];
  v27[20] = v7;
  v28[20] = @"suggestionNotificationTapped";
  v8 = +[NSNumber numberWithUnsignedInt:29];
  v27[21] = v8;
  v28[21] = @"suggestionNotificationDismissed";
  v9 = +[NSNumber numberWithUnsignedInt:30];
  v27[22] = v9;
  v28[22] = @"suggestionNotificationPosted";
  v10 = +[NSNumber numberWithUnsignedInt:31];
  v27[23] = v10;
  v28[23] = @"suggestionNotificationOverriden";
  uint64_t v11 = +[NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:24];
  v12 = (void *)suggestionEventToLabel__eventMapping;
  suggestionEventToLabel__eventMapping = v11;
}

+ (unint64_t)appEntryEventToEnum:(id)a3
{
  id v3 = a3;
  if (appEntryEventToEnum__onceToken != -1) {
    dispatch_once(&appEntryEventToEnum__onceToken, &__block_literal_global_352);
  }
  v4 = [(id)appEntryEventToEnum__eventMapping objectForKeyedSubscript:v3];
  id v5 = v4;
  if (v4) {
    unint64_t v6 = [v4 unsignedIntValue];
  }
  else {
    unint64_t v6 = 0;
  }

  return v6;
}

void __50__MOEngagementHistoryManager_appEntryEventToEnum___block_invoke(id a1)
{
  v8[0] = @"appUnknown";
  v1 = +[NSNumber numberWithUnsignedInt:0];
  v9[0] = v1;
  v8[1] = @"appEntryCreated";
  v2 = +[NSNumber numberWithUnsignedInt:1];
  v9[1] = v2;
  v8[2] = @"appEntryEdited";
  id v3 = +[NSNumber numberWithUnsignedInt:2];
  v9[2] = v3;
  v8[3] = @"appEntryDeleted";
  v4 = +[NSNumber numberWithUnsignedInt:3];
  v9[3] = v4;
  v8[4] = @"appEntryCancelled";
  id v5 = +[NSNumber numberWithUnsignedInt:4];
  v9[4] = v5;
  uint64_t v6 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:5];
  v7 = (void *)appEntryEventToEnum__eventMapping;
  appEntryEventToEnum__eventMapping = v6;
}

+ (id)appEntryEventToString:(id)a3
{
  id v3 = (__CFString *)a3;
  if (@"appUnknown" == v3)
  {
    CFStringRef v4 = @"unknown";
  }
  else if (@"appEntryCreated" == v3)
  {
    CFStringRef v4 = @"entryCreated";
  }
  else if (@"appEntryEdited" == v3)
  {
    CFStringRef v4 = @"entryEdited";
  }
  else if (@"appEntryDeleted" == v3)
  {
    CFStringRef v4 = @"entryDeleted";
  }
  else if (@"appEntryCancelled" == v3)
  {
    CFStringRef v4 = @"entryCancelled";
  }
  else
  {
    CFStringRef v4 = @"other";
  }

  return (id)v4;
}

+ (unint64_t)clientEventToEnum:(id)a3
{
  id v3 = a3;
  if (clientEventToEnum__onceToken != -1) {
    dispatch_once(&clientEventToEnum__onceToken, &__block_literal_global_372);
  }
  CFStringRef v4 = [(id)clientEventToEnum__eventMapping objectForKeyedSubscript:v3];
  id v5 = v4;
  if (v4) {
    unint64_t v6 = [v4 unsignedIntValue];
  }
  else {
    unint64_t v6 = 0;
  }

  return v6;
}

void __48__MOEngagementHistoryManager_clientEventToEnum___block_invoke(id a1)
{
  v8[0] = @"clientUnknown";
  v1 = +[NSNumber numberWithUnsignedInt:0];
  v9[0] = v1;
  v8[1] = @"clientAppVisible";
  v2 = +[NSNumber numberWithUnsignedInt:1];
  v9[1] = v2;
  v8[2] = @"clientAppDismissed";
  id v3 = +[NSNumber numberWithUnsignedInt:2];
  v9[2] = v3;
  v8[3] = @"clientSheetVisible";
  CFStringRef v4 = +[NSNumber numberWithUnsignedInt:3];
  v9[3] = v4;
  v8[4] = @"clientSheetDismissed";
  id v5 = +[NSNumber numberWithUnsignedInt:4];
  v9[4] = v5;
  uint64_t v6 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:5];
  v7 = (void *)clientEventToEnum__eventMapping;
  clientEventToEnum__eventMapping = v6;
}

+ (unint64_t)getEngagmentTypeForEvent:(id)a3
{
  id v3 = a3;
  if (+[MOEngagementHistoryManager suggestionEventToEnum:v3])
  {
    unint64_t v4 = 1;
  }
  else if (+[MOEngagementHistoryManager appEntryEventToEnum:v3])
  {
    unint64_t v4 = 2;
  }
  else if (+[MOEngagementHistoryManager clientEventToEnum:v3])
  {
    unint64_t v4 = 3;
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (unint64_t)determineAddedCharacterBinRange:(int64_t)a3
{
  unint64_t v3 = 1;
  uint64_t v4 = 2;
  if ((unint64_t)(a3 - 201) >= 0x190) {
    uint64_t v4 = 3;
  }
  if ((unint64_t)a3 >= 0xC9) {
    unint64_t v3 = v4;
  }
  if (a3) {
    return v3;
  }
  else {
    return 0;
  }
}

- (id)getPhotoAssetsForBundle:(id)a3
{
  return &__NSArray0__struct;
}

- (id)getSuggestionAssetsForBundle:(id)a3
{
  return &__NSArray0__struct;
}

- (id)getEngagementBundleSumarySetForBundles:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = -[MOEngagementHistoryManager getBMBundleSumaryForBundle:](self, "getBMBundleSumaryForBundle:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        if (v11) {
          [v5 addObject:v11];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)getBMBundleSumaryForBundle:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 bundleIdentifier];
  if (v5)
  {
    id v6 = (void *)v5;
    id v7 = [v4 suggestionID];

    if (v7)
    {
      id v8 = self;
      id v9 = objc_alloc((Class)BMMomentsEngagementSuggestionIdentifier);
      v10 = [v4 bundleIdentifier];
      uint64_t v11 = [v10 UUIDString];
      v12 = [v4 suggestionID];
      long long v13 = [v12 UUIDString];
      id v14 = [v9 initWithBundleId:v11 suggestionId:v13];

      long long v15 = [v4 rankingDictionary];

      if (v15)
      {
        long long v16 = [v4 rankingDictionary];
        v17 = [v16 objectForKeyedSubscript:@"rankingScore"];

        if (v17)
        {
          v18 = [v4 rankingDictionary];
          v49 = [v18 objectForKeyedSubscript:@"rankingScore"];
        }
        else
        {
          v49 = 0;
        }
        v21 = [v4 rankingDictionary];
        v22 = [v21 objectForKeyedSubscript:@"bundleGoodnessScore"];

        if (v22)
        {
          v23 = [v4 rankingDictionary];
          v52 = [v23 objectForKeyedSubscript:@"bundleGoodnessScore"];
        }
        else
        {
          v52 = 0;
        }
        v24 = [v4 rankingDictionary];
        v25 = [v24 objectForKeyedSubscript:@"ordinalRankInRecommendedTab"];

        if (v25)
        {
          v26 = [v4 rankingDictionary];
          v48 = [v26 objectForKeyedSubscript:@"ordinalRankInRecommendedTab"];
        }
        else
        {
          v48 = 0;
        }
        objc_super v27 = [v4 rankingDictionary];
        v28 = [v27 objectForKeyedSubscript:@"visibilityCategoryForUI"];

        if (v28)
        {
          v29 = [v4 rankingDictionary];
          v30 = [v29 objectForKeyedSubscript:@"visibilityCategoryForUI"];
          unsigned int v31 = [v30 intValue];

          goto LABEL_20;
        }
      }
      else
      {
        v48 = 0;
        v49 = 0;
        v52 = 0;
      }
      unsigned int v31 = 0;
LABEL_20:
      v32 = v8;
      [v4 getBundleType];
      v51 = v53 = v14;
      if ([v4 interfaceType] == (id)11
        && ([v4 resources],
            v33 = objc_claimAutoreleasedReturnValue(),
            id v34 = [v33 count],
            v33,
            v34))
      {
        v35 = [v4 resources];
        [v35 objectAtIndexedSubscript:0];
        v37 = unsigned int v36 = v31;
        v47 = [v37 name];

        unsigned int v31 = v36;
      }
      else
      {
        v47 = 0;
      }
      id v50 = objc_alloc((Class)BMMomentsEngagementBundleSummary);
      v38 = [v4 startDate];
      v39 = [v4 endDate];
      id v40 = [v4 interfaceType];
      v41 = [(MOEngagementHistoryManager *)v32 getPhotoAssetsForBundle:v4];
      unsigned int v42 = [v4 bundleSubType];
      unsigned int v43 = [v4 bundleSuperType];
      v44 = [(MOEngagementHistoryManager *)v32 getSuggestionAssetsForBundle:v4];
      LODWORD(v46) = v31;
      id v20 = [v50 initWithIdentifier:v53 startDate:v38 endDate:v39 interfaceType:v40 rankingScore:v49 attachedPhotoAssets:v41 bundleInterfaceType:v51 bundleEvergreenType:v47 bundleSubType:__PAIR64__(v43 bundleSuperType:v42) bundleGoodnessScore:v52 ordinalRankInRecommendedTab:v48 visibilityCategoryForUI:v46 assets:v44];

      goto LABEL_25;
    }
  }
  v19 = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
    -[MOEngagementHistoryManager getBMBundleSumaryForBundle:]();
  }

  id v20 = 0;
LABEL_25:

  return v20;
}

- (void)didEngagementEventPosted:(id)a3 withBundles:(id)a4 timestamp:(id)a5 withContext:(id)a6 withTrialExperimentIDs:(id)a7 withOnboardingStatus:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = [v17 objectForKeyedSubscript:@"clientIdentifier"];
  if (v20)
  {
    v21 = [(MOEngagementHistoryManager *)self getEngagementBundleSumarySetForBundles:v15];
    v96 = v19;
    id v90 = v18;
    v86 = v20;
    if ([v20 isEqualToString:@"com.apple.momentsd.MOUserNotifications"])
    {
      id v22 = objc_alloc((Class)BMMomentsEngagementNotificationInfo);
      v23 = [v17 objectForKeyedSubscript:@"postingDate"];
      v24 = [v17 objectForKeyedSubscript:@"numSuggestionInNotification"];
      id v88 = [v22 initWithNotificationEventTimestamp:v16 notificationPostingTimestamp:v23 notificationSuggestionCount:v24];
    }
    else
    {
      id v88 = 0;
    }
    unint64_t v26 = +[MOEngagementHistoryManager getEngagmentTypeForEvent:v14];
    id v92 = v14;
    v93 = v17;
    v89 = self;
    id v87 = v15;
    id v91 = v16;
    v85 = v21;
    switch(v26)
    {
      case 3uLL:
        id v35 = objc_alloc((Class)BMMomentsEngagementClientActivityEvent);
        unint64_t v36 = +[MOEngagementHistoryManager clientEventToEnum:v14];
        v37 = [v17 objectForKeyedSubscript:@"clientIdentifier"];
        id v33 = [v35 initWithType:v36 clientIdentifier:v37 timestamp:v16];

        break;
      case 2uLL:
        v38 = objc_opt_new();
        v39 = objc_opt_new();
        id v40 = objc_opt_new();
        long long v101 = 0u;
        long long v102 = 0u;
        long long v103 = 0u;
        long long v104 = 0u;
        id v41 = v21;
        id v42 = [v41 countByEnumeratingWithState:&v101 objects:v105 count:16];
        if (v42)
        {
          id v43 = v42;
          uint64_t v44 = *(void *)v102;
          do
          {
            for (i = 0; i != v43; i = (char *)i + 1)
            {
              if (*(void *)v102 != v44) {
                objc_enumerationMutation(v41);
              }
              uint64_t v46 = *(void **)(*((void *)&v101 + 1) + 8 * i);
              v47 = [v46 identifier];

              if (v47)
              {
                v48 = [v46 identifier];
                [v38 addObject:v48];
              }
              v49 = [v46 bundleInterfaceType];

              if (v49)
              {
                id v50 = [v46 bundleInterfaceType];
                [v39 addObject:v50];
              }
              v51 = [v46 bundleEvergreenType];

              if (v51)
              {
                v52 = [v46 bundleEvergreenType];
                [v40 addObject:v52];
              }
            }
            id v43 = [v41 countByEnumeratingWithState:&v101 objects:v105 count:16];
          }
          while (v43);
        }

        v99 = [v41 objectAtIndexedSubscript:0];
        uint64_t v53 = [v93 objectForKeyedSubscript:@"entryPhotoAssets"];
        if (v53)
        {
          v54 = (void *)v53;
          v55 = [v93 objectForKeyedSubscript:@"entryPhotoAssets"];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          id v57 = v92;
          if (isKindOfClass)
          {
            v97 = [v93 objectForKeyedSubscript:@"entryPhotoAssets"];
          }
          else
          {
            v97 = &__NSArray0__struct;
          }
        }
        else
        {
          v97 = &__NSArray0__struct;
          id v57 = v92;
        }
        id v82 = objc_alloc((Class)BMMomentsEngagementAppEntryEvent);
        unint64_t v80 = +[MOEngagementHistoryManager appEntryEventToEnum:v57];
        v78 = [v93 objectForKeyedSubscript:@"clientIdentifier"];
        v95 = [v93 objectForKeyedSubscript:@"entryStartTime"];
        v59 = [v93 objectForKeyedSubscript:@"entryStartTime"];
        v76 = [v93 objectForKeyedSubscript:@"entryTotalCharacters"];
        v60 = [v93 objectForKeyedSubscript:@"entryPhotoAssets"];
        v61 = +[MOEngagementHistoryManager appEntryEventToString:v57];
        id v34 = [v82 initWithType:v80 clientIdentifier:v78 timestamp:v91 identifier:v38 startTime:v95 endTime:v59 totalCharacters:v76 addedCharacters:v60 usedPhotoAssets:v97 appEntryEventType:v61 bundleInterfaceTypes:v39 bundleEvergreenTypes:v40 bundleSummary:v99 assets:&__NSArray0__struct];

        id v33 = 0;
        goto LABEL_35;
      case 1uLL:
        unint64_t v27 = +[MOEngagementHistoryManager suggestionEventToEnum:v14];
        id v28 = objc_alloc((Class)BMMomentsEngagementSuggestionEvent);
        v29 = [v17 objectForKeyedSubscript:@"clientIdentifier"];
        [v17 objectForKeyedSubscript:@"viewContainerName"];
        unsigned int v31 = v30 = v21;
        v32 = [v17 objectForKeyedSubscript:@"viewVisibleTime"];
        v94 = [v28 initWithType:v27 timestamp:v16 fullBundleOrderedSet:v30 clientIdentifier:v29 viewContainerName:v31 viewVisibleTime:v32 suggestionType:0 viewVisibleSuggestionsCount:0 viewTotalSuggestionsCount:0 notificationInfo:v88];

        [(MOEngagementHistoryManager *)v89 submitSuggestionEngagementEventAnalytics:v15 suggestionEngagementType:v27 timestamp:v16 withContext:v17 withTrialExperimentIDs:v90];
        id v33 = 0;
        id v34 = 0;
LABEL_36:
        v62 = [v96 objectForKeyedSubscript:@"onboardingStatus"];

        v98 = v33;
        v100 = v34;
        if (v62)
        {
          v63 = [v96 objectForKeyedSubscript:@"onboardingStatus"];
          unsigned int v83 = +[MOBiomeDonationUtility mapOnboardingFlowCompletion:](MOBiomeDonationUtility, "mapOnboardingFlowCompletion:", (int)[v63 intValue]);
        }
        else
        {
          unsigned int v83 = 0;
        }
        id v81 = objc_alloc((Class)BMMomentsEngagement);
        v79 = [v96 objectForKeyedSubscript:@"journalIsInstalled"];
        v77 = [v96 objectForKeyedSubscript:@"journalConfigLockJournal"];
        v75 = [v96 objectForKeyedSubscript:@"journalConfigSkipSuggestions"];
        v64 = [v96 objectForKeyedSubscript:@"settingSwitchActivity"];
        v74 = [v96 objectForKeyedSubscript:@"settingSwitchCommunication"];
        v65 = [v96 objectForKeyedSubscript:@"settingSwitchLocation"];
        v66 = [v96 objectForKeyedSubscript:@"settingSwitchMedia"];
        v67 = [v96 objectForKeyedSubscript:@"settingSwitchPeople"];
        v68 = [v96 objectForKeyedSubscript:@"settingSwitchPhoto"];
        v69 = [v96 objectForKeyedSubscript:@"settingSwitchStateOfMind"];
        v70 = [v96 objectForKeyedSubscript:@"settingSwitchReflection"];
        v71 = [v96 objectForKeyedSubscript:@"settingBroaderSwitchLocation"];
        id v84 = objc_msgSend(v81, "initWithSuggestionEvent:entryEvent:clientActivityEvent:onboardingFlowCompletionState:isJournalAppInstalled:isJournalAppLocked:isJournalSuggestionSkipped:isActivitySettingsSwitchEnabled:isCommunicationSettingsSwitchEnabled:isSignificantLocationSettingsSwitchEnabled:isMediaSettingsSwitchEnabled:isNearbyPeopleSettingsSwitchEnabled:isPhotoSettingsSwitchEnabled:isStateOfMindSettingsSwitchEnabled:isReflectionSettingsSwitchEnabled:isBroadSystemLocationSettingsSwitchEnabled:", v94, v100, v98, v83, v79, v77, v75, v64, v74, v65, v66, v67, v68,
                v69,
                v70,
                v71);

        v72 = [(MOEngagementHistoryManager *)v89 stream_source];
        [v72 sendEvent:v84];

        v73 = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
        id v14 = v92;
        if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG)) {
          -[MOEngagementHistoryManager didEngagementEventPosted:withBundles:timestamp:withContext:withTrialExperimentIDs:withOnboardingStatus:]();
        }

        id v20 = v86;
        id v15 = v87;
        id v18 = v90;
        id v16 = v91;
        id v17 = v93;
        v25 = v94;
        id v19 = v96;
        goto LABEL_42;
      default:
        v58 = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
        if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR)) {
          -[MOEngagementHistoryManager didEngagementEventPosted:withBundles:timestamp:withContext:withTrialExperimentIDs:withOnboardingStatus:]();
        }

        id v33 = 0;
        break;
    }
    id v34 = 0;
LABEL_35:
    v94 = 0;
    goto LABEL_36;
  }
  v25 = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
    -[MOEngagementHistoryManager didEngagementEventPosted:withBundles:timestamp:withContext:withTrialExperimentIDs:withOnboardingStatus:]();
  }
LABEL_42:
}

- (void)didAppEntryEventPosted:(unint64_t)a3 withBundles:(id)a4 timestamp:(id)a5 duringInterval:(id)a6 withInfo:(id)a7 withTrialExperimentIDs:(id)a8 withOnboardingStatus:(id)a9
{
  id v13 = a4;
  id v64 = a5;
  id v63 = a6;
  id v62 = a7;
  id v57 = a8;
  id v14 = a9;
  v70 = objc_opt_new();
  v68 = objc_opt_new();
  v67 = objc_opt_new();
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  id obj = v13;
  id v15 = [obj countByEnumeratingWithState:&v75 objects:v79 count:16];
  v61 = v14;
  if (v15)
  {
    id v16 = v15;
    v71 = 0;
    uint64_t v17 = *(void *)v76;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v76 != v17) {
          objc_enumerationMutation(obj);
        }
        id v19 = *(void **)(*((void *)&v75 + 1) + 8 * i);
        uint64_t v20 = [v19 bundleIdentifier];
        if (v20
          && (v21 = (void *)v20,
              [v19 suggestionID],
              id v22 = objc_claimAutoreleasedReturnValue(),
              v22,
              v21,
              v22))
        {
          id v23 = objc_alloc((Class)BMMomentsEngagementSuggestionIdentifier);
          v24 = [v19 bundleIdentifier];
          v25 = [v24 UUIDString];
          unint64_t v26 = [v19 suggestionID];
          unint64_t v27 = [v26 UUIDString];
          id v28 = [v23 initWithBundleId:v25 suggestionId:v27];

          if (v28)
          {
            [v70 addObject:v28];
            uint64_t v29 = [(MOEngagementHistoryManager *)self getBMBundleSumaryForBundle:v19];

            v30 = [v19 getBundleType];

            if (v30)
            {
              unsigned int v31 = [v19 getBundleType];
              [v68 addObject:v31];
            }
            if ([v19 interfaceType] == (id)11)
            {
              v32 = [v19 resources];
              id v33 = [v32 objectAtIndexedSubscript:0];
              id v34 = [v33 name];

              if (v34) {
                [v67 addObject:v34];
              }
            }
            v71 = (void *)v29;
          }
        }
        else
        {
          id v28 = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
            -[MOEngagementHistoryManager didAppEntryEventPosted:withBundles:timestamp:duringInterval:withInfo:withTrialExperimentIDs:withOnboardingStatus:](&buf, v74, v28);
          }
        }
      }
      id v16 = [obj countByEnumeratingWithState:&v75 objects:v79 count:16];
    }
    while (v16);
  }
  else
  {
    v71 = 0;
  }

  id v35 = objc_alloc((Class)BMMomentsEngagementAppEntryEvent);
  unint64_t v36 = [v63 startDate];
  v37 = [v63 endDate];
  v38 = [v62 objectForKeyedSubscript:@"entryTotalCharacters"];
  v39 = [v62 objectForKeyedSubscript:@"entryAddedCharacters"];
  id v40 = [v35 initWithType:a3 clientIdentifier:0 timestamp:v64 identifier:v70 startTime:v36 endTime:v37 totalCharacters:v38 addedCharacters:v39 usedPhotoAssets:&__NSArray0__struct appEntryEventType:0 bundleInterfaceTypes:v68 bundleEvergreenTypes:v67 bundleSummary:v71 assets:&__NSArray0__struct];

  id v41 = [v61 objectForKeyedSubscript:@"onboardingStatus"];

  v66 = v40;
  if (v41)
  {
    id v42 = [v61 objectForKeyedSubscript:@"onboardingStatus"];
    unsigned int v56 = +[MOBiomeDonationUtility mapOnboardingFlowCompletion:](MOBiomeDonationUtility, "mapOnboardingFlowCompletion:", (int)[v42 intValue]);
  }
  else
  {
    unsigned int v56 = 0;
  }
  id v55 = objc_alloc((Class)BMMomentsEngagement);
  v60 = [v61 objectForKeyedSubscript:@"journalIsInstalled"];
  v59 = [v61 objectForKeyedSubscript:@"journalConfigLockJournal"];
  v58 = [v61 objectForKeyedSubscript:@"journalConfigSkipSuggestions"];
  v54 = [v61 objectForKeyedSubscript:@"settingSwitchActivity"];
  id v43 = [v61 objectForKeyedSubscript:@"settingSwitchCommunication"];
  uint64_t v44 = [v61 objectForKeyedSubscript:@"settingSwitchLocation"];
  v45 = [v61 objectForKeyedSubscript:@"settingSwitchMedia"];
  uint64_t v46 = [v61 objectForKeyedSubscript:@"settingSwitchPeople"];
  v47 = [v61 objectForKeyedSubscript:@"settingSwitchPhoto"];
  v48 = [v61 objectForKeyedSubscript:@"settingSwitchStateOfMind"];
  v49 = [v61 objectForKeyedSubscript:@"settingSwitchReflection"];
  id v50 = [v61 objectForKeyedSubscript:@"settingBroaderSwitchLocation"];
  id v51 = objc_msgSend(v55, "initWithSuggestionEvent:entryEvent:clientActivityEvent:onboardingFlowCompletionState:isJournalAppInstalled:isJournalAppLocked:isJournalSuggestionSkipped:isActivitySettingsSwitchEnabled:isCommunicationSettingsSwitchEnabled:isSignificantLocationSettingsSwitchEnabled:isMediaSettingsSwitchEnabled:isNearbyPeopleSettingsSwitchEnabled:isPhotoSettingsSwitchEnabled:isStateOfMindSettingsSwitchEnabled:isReflectionSettingsSwitchEnabled:isBroadSystemLocationSettingsSwitchEnabled:", 0, v66, 0, v56, v60, v59, v58, v54, v43, v44, v45, v46, v47,
          v48,
          v49,
          v50);

  v52 = [(MOEngagementHistoryManager *)self stream_source];
  [v52 sendEvent:v51];

  uint64_t v53 = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG)) {
    -[MOEngagementHistoryManager didAppEntryEventPosted:withBundles:timestamp:duringInterval:withInfo:withTrialExperimentIDs:withOnboardingStatus:]();
  }

  [(MOEngagementHistoryManager *)self submitAppEntryEngagementEventAnalytics:obj appEntryEngagementType:a3 timestamp:v64 withInfo:v62 withTrialExperimentIDs:v57];
}

- (void)submitSuggestionEngagementEventAnalytics:(id)a3 suggestionEngagementType:(unint64_t)a4 timestamp:(id)a5 withContext:(id)a6 withTrialExperimentIDs:(id)a7
{
  id v11 = a3;
  id v72 = a5;
  id v73 = a6;
  id v12 = a7;
  if (self->_isInternalBuild
    || (suggestionEngagementTypesEligibleForRawExternalAnalytics = self->_suggestionEngagementTypesEligibleForRawExternalAnalytics,
        +[NSNumber numberWithUnsignedInteger:a4],
        id v14 = objc_claimAutoreleasedReturnValue(),
        LODWORD(suggestionEngagementTypesEligibleForRawExternalAnalytics) = [(NSArray *)suggestionEngagementTypesEligibleForRawExternalAnalytics containsObject:v14], v14, suggestionEngagementTypesEligibleForRawExternalAnalytics))
  {
    uint64_t v15 = +[NSDate now];
    v65 = +[NSCalendar currentCalendar];
    long long v77 = v15;
    v71 = [v65 components:764 fromDate:v15];
    long long v76 = +[MOMetric binsFromStart:&off_1002F6F38 toEnd:&off_1002F98F0 gap:&off_1002F9900];
    long long v75 = [v73 objectForKeyedSubscript:@"rankingDictionaries"];
    long long v78 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    id v66 = v11;
    id obj = v11;
    id v74 = [obj countByEnumeratingWithState:&v78 objects:v84 count:16];
    if (v74)
    {
      uint64_t v68 = *(void *)v79;
      id v69 = v12;
      do
      {
        id v16 = 0;
        do
        {
          if (*(void *)v79 != v68) {
            objc_enumerationMutation(obj);
          }
          uint64_t v17 = *(void **)(*((void *)&v78 + 1) + 8 * (void)v16);
          id v18 = objc_opt_new();
          id v19 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v71 year]);
          [v18 setObject:v19 forKeyedSubscript:@"submissionTimeYear"];

          uint64_t v20 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v71 month]);
          [v18 setObject:v20 forKeyedSubscript:@"submissionTimeMonth"];

          v21 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v71 day]);
          [v18 setObject:v21 forKeyedSubscript:@"submissionTimeDay"];

          id v22 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v71 hour]);
          [v18 setObject:v22 forKeyedSubscript:@"submissionTimeHour"];

          id v23 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v71 minute]);
          [v18 setObject:v23 forKeyedSubscript:@"submissionTimeMinute"];

          [v18 setObject:&off_1002F94E0 forKeyedSubscript:@"scalingFactorForAnalytics"];
          if (v12)
          {
            v24 = [v12 experimentId];
            [v18 setObject:v24 forKeyedSubscript:@"trialExperimentId"];

            v25 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v12 deploymentId]);
            unint64_t v26 = [v25 stringValue];
            [v18 setObject:v26 forKeyedSubscript:@"trialDeploymentId"];

            unint64_t v27 = [v12 treatmentId];
            [v18 setObject:v27 forKeyedSubscript:@"trialTreatmentId"];
          }
          [v77 timeIntervalSinceDate:v72];
          id v28 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          uint64_t v29 = +[MOMetric binForNumber:v28 bins:v76];
          [v18 setObject:v29 forKeyedSubscript:@"engagementTimeBucketed"];

          [v18 setObject:&off_1002F6ED8 forKeyedSubscript:@"engagementType"];
          v30 = +[NSNumber numberWithUnsignedInteger:a4];
          [v18 setObject:v30 forKeyedSubscript:@"suggestionEngagementSubType"];

          unsigned int v31 = [v17 bundleIdentifier];
          v32 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v31 hash]);
          [v18 setObject:v32 forKeyedSubscript:@"bundleId"];

          id v33 = [v17 suggestionID];
          id v34 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v33 hash]);
          [v18 setObject:v34 forKeyedSubscript:@"suggestionId"];

          if (a4 != 9)
          {
            id v35 = [v17 subSuggestionIDs];
            unint64_t v36 = [(MOEngagementHistoryManager *)self _convertStringArrayIntoCombinedHashedString:v35];

            if (v36) {
              [v18 setObject:v36 forKeyedSubscript:@"subSuggestionIds"];
            }
            v37 = [v17 subBundleIDs];
            v38 = [(MOEngagementHistoryManager *)self _convertStringArrayIntoCombinedHashedString:v37];

            if (v38) {
              [v18 setObject:v38 forKeyedSubscript:@"subBundleIds"];
            }
          }
          v39 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v17 interfaceType]);
          [v18 setObject:v39 forKeyedSubscript:@"interfaceType"];

          id v40 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v17 bundleSubType]);
          [v18 setObject:v40 forKeyedSubscript:@"bundleSubType"];

          id v41 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v17 bundleSuperType]);
          [v18 setObject:v41 forKeyedSubscript:@"bundleSuperType"];

          id v42 = [v17 startDate];
          [v77 timeIntervalSinceDate:v42];
          id v43 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          uint64_t v44 = +[MOMetric binForNumber:v43 bins:v76];
          [v18 setObject:v44 forKeyedSubscript:@"bundleStartTimeBucketed"];

          v45 = [v17 endDate];
          [v77 timeIntervalSinceDate:v45];
          uint64_t v46 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          v47 = +[MOMetric binForNumber:v46 bins:v76];
          [v18 setObject:v47 forKeyedSubscript:@"bundleEndTimeBucketed"];

          if ([v17 interfaceType] == (id)11) {
            v48 = &off_1002F6F50;
          }
          else {
            v48 = &off_1002F6F68;
          }
          [v18 setObject:v48 forKeyedSubscript:@"engagementEntryType"];
          if (v75)
          {
            v49 = [v17 bundleIdentifier];
            id v50 = [v75 objectForKeyedSubscript:v49];

            if (v50)
            {
              id v51 = [v50 objectForKeyedSubscript:@"ordinalRankInRecommendedTab"];
              [v18 setObject:v51 forKeyedSubscript:@"ordinalRank"];

              v52 = [v50 objectForKeyedSubscript:@"rankingScore"];
              [v52 floatValue];
              *(float *)&double v54 = v53 * 10000.0;
              id v55 = +[NSNumber numberWithFloat:v54];
              [v18 setObject:v55 forKeyedSubscript:@"rankingScore"];

              unsigned int v56 = [v50 objectForKeyedSubscript:@"bundleGoodnessScore"];
              [v56 floatValue];
              *(float *)&double v58 = v57 * 10000.0;
              v59 = +[NSNumber numberWithFloat:v58];
              [v18 setObject:v59 forKeyedSubscript:@"bundleGoodnessScore"];

              v60 = [v50 objectForKeyedSubscript:@"visibilityCategoryForUI"];
              v61 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v60 intValue]);
              [v18 setObject:v61 forKeyedSubscript:@"visibilityStateForUI"];
            }
          }
          id v62 = [v73 objectForKeyedSubscript:@"viewContainerName"];
          [v18 setObject:v62 forKeyedSubscript:@"viewContainerName"];

          id v63 = [v73 objectForKeyedSubscript:@"viewVisibleTime"];
          [v18 setObject:v63 forKeyedSubscript:@"viewVisibleTime"];

          AnalyticsSendEvent();
          id v64 = _mo_log_facility_get_os_log(&MOLogFacilityAnalytics);
          if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)uint8_t buf = 138477827;
            unsigned int v83 = v18;
            _os_log_debug_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEBUG, "Suggestion engagement signal analytics submitted: %{private}@", buf, 0xCu);
          }

          id v16 = (char *)v16 + 1;
          id v12 = v69;
        }
        while (v74 != v16);
        id v74 = [obj countByEnumeratingWithState:&v78 objects:v84 count:16];
      }
      while (v74);
    }

    id v11 = v66;
  }
  else
  {
    long long v77 = _mo_log_facility_get_os_log(&MOLogFacilityAnalytics);
    if (os_log_type_enabled(v77, OS_LOG_TYPE_DEBUG)) {
      -[MOEngagementHistoryManager submitSuggestionEngagementEventAnalytics:suggestionEngagementType:timestamp:withContext:withTrialExperimentIDs:]((unsigned __int8 *)&self->_isInternalBuild, a4, v77);
    }
  }
}

- (void)submitAppEntryEngagementEventAnalytics:(id)a3 appEntryEngagementType:(unint64_t)a4 timestamp:(id)a5 withInfo:(id)a6 withTrialExperimentIDs:(id)a7
{
  id v10 = a3;
  id v87 = a5;
  id v11 = a6;
  id v12 = a7;
  uint64_t v13 = +[NSDate now];
  id v14 = +[NSCalendar currentCalendar];
  id v91 = (void *)v13;
  v86 = [v14 components:764 fromDate:v13];
  id v90 = +[MOMetric binsFromStart:&off_1002F6F38 toEnd:&off_1002F98F0 gap:&off_1002F9910];
  if (v10 && [v10 count])
  {
    long long v95 = 0u;
    long long v96 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    id v15 = v10;
    id v88 = [v15 countByEnumeratingWithState:&v93 objects:v99 count:16];
    if (v88)
    {
      long long v79 = v14;
      id v80 = v10;
      uint64_t v82 = *(void *)v94;
      unsigned int v83 = v11;
      id v84 = v12;
      id obj = v15;
      do
      {
        for (i = 0; i != v88; i = (char *)i + 1)
        {
          if (*(void *)v94 != v82) {
            objc_enumerationMutation(obj);
          }
          uint64_t v17 = *(void **)(*((void *)&v93 + 1) + 8 * i);
          id v18 = objc_opt_new();
          id v19 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v86 year]);
          [v18 setObject:v19 forKeyedSubscript:@"submissionTimeYear"];

          uint64_t v20 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v86 month]);
          [v18 setObject:v20 forKeyedSubscript:@"submissionTimeMonth"];

          v21 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v86 day]);
          [v18 setObject:v21 forKeyedSubscript:@"submissionTimeDay"];

          id v22 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v86 hour]);
          [v18 setObject:v22 forKeyedSubscript:@"submissionTimeHour"];

          id v23 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v86 minute]);
          [v18 setObject:v23 forKeyedSubscript:@"submissionTimeMinute"];

          [v18 setObject:&off_1002F94E0 forKeyedSubscript:@"scalingFactorForAnalytics"];
          if (v12)
          {
            v24 = [v12 experimentId];
            [v18 setObject:v24 forKeyedSubscript:@"trialExperimentId"];

            v25 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v12 deploymentId]);
            unint64_t v26 = [v25 stringValue];
            [v18 setObject:v26 forKeyedSubscript:@"trialDeploymentId"];

            unint64_t v27 = [v12 treatmentId];
            [v18 setObject:v27 forKeyedSubscript:@"trialTreatmentId"];
          }
          [v91 timeIntervalSinceDate:v87, v79, v80];
          id v28 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          uint64_t v29 = +[MOMetric binForNumber:v28 bins:v90];
          [v18 setObject:v29 forKeyedSubscript:@"engagementTimeBucketed"];

          [v18 setObject:&off_1002F6F50 forKeyedSubscript:@"engagementType"];
          v30 = +[NSNumber numberWithUnsignedInteger:a4];
          [v18 setObject:v30 forKeyedSubscript:@"appEntryEngagementSubType"];

          unsigned int v31 = [v17 bundleIdentifier];
          v32 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v31 hash]);
          [v18 setObject:v32 forKeyedSubscript:@"bundleId"];

          id v33 = [v17 suggestionID];
          id v34 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v33 hash]);
          [v18 setObject:v34 forKeyedSubscript:@"suggestionId"];

          id v35 = [v17 subSuggestionIDs];
          uint64_t v36 = [(MOEngagementHistoryManager *)self _convertStringArrayIntoCombinedHashedString:v35];

          if (v36) {
            [v18 setObject:v36 forKeyedSubscript:@"subSuggestionIds"];
          }
          v89 = (void *)v36;
          v37 = [v17 subBundleIDs];
          v38 = [(MOEngagementHistoryManager *)self _convertStringArrayIntoCombinedHashedString:v37];

          if (v38) {
            [v18 setObject:v38 forKeyedSubscript:@"subBundleIds"];
          }
          v39 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v17 interfaceType]);
          [v18 setObject:v39 forKeyedSubscript:@"interfaceType"];

          id v40 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v17 bundleSubType]);
          [v18 setObject:v40 forKeyedSubscript:@"bundleSubType"];

          id v41 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v17 bundleSuperType]);
          [v18 setObject:v41 forKeyedSubscript:@"bundleSuperType"];

          id v42 = [v17 startDate];
          [v91 timeIntervalSinceDate:v42];
          id v43 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          uint64_t v44 = +[MOMetric binForNumber:v43 bins:v90];
          [v18 setObject:v44 forKeyedSubscript:@"bundleStartTimeBucketed"];

          v45 = [v17 endDate];
          [v91 timeIntervalSinceDate:v45];
          uint64_t v46 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          v47 = +[MOMetric binForNumber:v46 bins:v90];
          [v18 setObject:v47 forKeyedSubscript:@"bundleEndTimeBucketed"];

          if ([v17 interfaceType] == (id)11) {
            v48 = &off_1002F6F50;
          }
          else {
            v48 = &off_1002F6F68;
          }
          [v18 setObject:v48 forKeyedSubscript:@"engagementEntryType"];
          id v11 = v83;
          v49 = [v83 objectForKeyedSubscript:@"entryTotalCharacters"];

          if (v49)
          {
            id v50 = [v83 objectForKeyedSubscript:@"entryTotalCharacters"];
            [v18 setObject:v50 forKeyedSubscript:@"totalCharacters"];
          }
          id v51 = [v83 objectForKeyedSubscript:@"entryAddedCharacters"];

          if (v51)
          {
            v52 = [v83 objectForKeyedSubscript:@"entryAddedCharacters"];
            [v18 setObject:v52 forKeyedSubscript:@"addedCharacters"];
          }
          float v53 = [v83 objectForKeyedSubscript:@"entryAddedCharacters"];

          id v12 = v84;
          if (v53)
          {
            double v54 = [v83 objectForKeyedSubscript:@"entryAddedCharacters"];
            signed int v55 = [v54 intValue];

            unsigned int v56 = +[NSNumber numberWithUnsignedInteger:[(MOEngagementHistoryManager *)self determineAddedCharacterBinRange:v55]];
            [v18 setObject:v56 forKeyedSubscript:@"addedCharactersBinned"];
          }
          AnalyticsSendEvent();
          float v57 = _mo_log_facility_get_os_log(&MOLogFacilityAnalytics);
          if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)uint8_t buf = 138477827;
            v98 = v18;
            _os_log_debug_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEBUG, "App entry engagement signal analytics submitted: %{private}@", buf, 0xCu);
          }
        }
        id v15 = obj;
        id v88 = [obj countByEnumeratingWithState:&v93 objects:v99 count:16];
      }
      while (v88);
      id v14 = v79;
      id v10 = v80;
    }
  }
  else
  {
    id v15 = (id)objc_opt_new();
    double v58 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v86 year]);
    [v15 setObject:v58 forKeyedSubscript:@"submissionTimeYear"];

    v59 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v86 month]);
    [v15 setObject:v59 forKeyedSubscript:@"submissionTimeMonth"];

    v60 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v86 day]);
    [v15 setObject:v60 forKeyedSubscript:@"submissionTimeDay"];

    v61 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v86 hour]);
    [v15 setObject:v61 forKeyedSubscript:@"submissionTimeHour"];

    id v62 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v86 minute]);
    [v15 setObject:v62 forKeyedSubscript:@"submissionTimeMinute"];

    [v15 setObject:&off_1002F94E0 forKeyedSubscript:@"scalingFactorForAnalytics"];
    if (v12)
    {
      id v63 = [v12 experimentId];
      [v15 setObject:v63 forKeyedSubscript:@"trialExperimentId"];

      id v64 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v12 deploymentId]);
      v65 = [v64 stringValue];
      [v15 setObject:v65 forKeyedSubscript:@"trialDeploymentId"];

      id v66 = [v12 treatmentId];
      [v15 setObject:v66 forKeyedSubscript:@"trialTreatmentId"];
    }
    [v91 timeIntervalSinceDate:v87];
    v67 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    uint64_t v68 = +[MOMetric binForNumber:v67 bins:v90];
    [v15 setObject:v68 forKeyedSubscript:@"engagementTimeBucketed"];

    [v15 setObject:&off_1002F6F50 forKeyedSubscript:@"engagementType"];
    id v69 = +[NSNumber numberWithUnsignedInteger:a4];
    [v15 setObject:v69 forKeyedSubscript:@"appEntryEngagementSubType"];

    v70 = [v11 objectForKeyedSubscript:@"entryTotalCharacters"];

    if (v70)
    {
      v71 = [v11 objectForKeyedSubscript:@"entryTotalCharacters"];
      [v15 setObject:v71 forKeyedSubscript:@"totalCharacters"];
    }
    id v72 = [v11 objectForKeyedSubscript:@"entryAddedCharacters"];

    if (v72)
    {
      id v73 = [v11 objectForKeyedSubscript:@"entryAddedCharacters"];
      [v15 setObject:v73 forKeyedSubscript:@"addedCharacters"];
    }
    id v74 = [v11 objectForKeyedSubscript:@"entryAddedCharacters"];

    if (v74)
    {
      long long v75 = [v11 objectForKeyedSubscript:@"entryAddedCharacters"];
      signed int v76 = [v75 intValue];

      long long v77 = +[NSNumber numberWithUnsignedInteger:[(MOEngagementHistoryManager *)self determineAddedCharacterBinRange:v76]];
      [v15 setObject:v77 forKeyedSubscript:@"addedCharactersBinned"];
    }
    [v15 setObject:&off_1002F6ED8 forKeyedSubscript:@"engagementEntryType"];
    AnalyticsSendEvent();
    long long v78 = _mo_log_facility_get_os_log(&MOLogFacilityAnalytics);
    if (os_log_type_enabled(v78, OS_LOG_TYPE_DEBUG)) {
      -[MOEngagementHistoryManager submitAppEntryEngagementEventAnalytics:appEntryEngagementType:timestamp:withInfo:withTrialExperimentIDs:]();
    }
  }
}

- (void)updateBundle:(id)a3 forSuggestionEvent:(id)a4 withSummary:(id)a5
{
  id v6 = a3;
  id v7 = a4;
  switch([v7 type])
  {
    case 0u:
      if (([v6 hasSuggestionEngagementEvent:@"suggestionsUnknown"] & 1) == 0)
      {
        [v6 setSuggestionEngagementEvent:@"suggestionsUnknown"];
        id v8 = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_76;
        }
        goto LABEL_75;
      }
      break;
    case 1u:
      if (([v6 hasSuggestionEngagementEvent:@"suggestionsSelected"] & 1) == 0)
      {
        [v6 setSuggestionEngagementEvent:@"suggestionsSelected"];
        id v8 = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_76;
        }
        goto LABEL_75;
      }
      break;
    case 2u:
      if (([v6 hasSuggestionEngagementEvent:@"suggestionsShared"] & 1) == 0)
      {
        [v6 setSuggestionEngagementEvent:@"suggestionsShared"];
        id v8 = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_76;
        }
        goto LABEL_75;
      }
      break;
    case 3u:
      if (([v6 hasSuggestionEngagementEvent:@"suggestionsLiked"] & 1) == 0)
      {
        [v6 setSuggestionEngagementEvent:@"suggestionsLiked"];
        id v8 = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_76;
        }
        goto LABEL_75;
      }
      break;
    case 4u:
      if (([v6 hasSuggestionEngagementEvent:@"suggestionsDisliked"] & 1) == 0)
      {
        [v6 setSuggestionEngagementEvent:@"suggestionsDisliked"];
        id v8 = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_76;
        }
        goto LABEL_75;
      }
      break;
    case 5u:
      if (([v6 hasSuggestionEngagementEvent:@"suggestionsDismissed"] & 1) == 0)
      {
        [v6 setSuggestionEngagementEvent:@"suggestionsDismissed"];
        id v8 = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_76;
        }
        goto LABEL_75;
      }
      break;
    case 6u:
      if (([v6 hasSuggestionEngagementEvent:@"suggestionsDeleted"] & 1) == 0)
      {
        [v6 setSuggestionEngagementEvent:@"suggestionsDeleted"];
        id v8 = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_76;
        }
        goto LABEL_75;
      }
      break;
    case 7u:
      if (([v6 hasSuggestionEngagementEvent:@"suggestionsHidden"] & 1) == 0)
      {
        [v6 setSuggestionEngagementEvent:@"suggestionsHidden"];
        id v8 = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_76;
        }
        goto LABEL_75;
      }
      break;
    case 8u:
      if (([v6 hasSuggestionEngagementEvent:@"suggestionsQuickAddEntry"] & 1) == 0)
      {
        [v6 setSuggestionEngagementEvent:@"suggestionsQuickAddEntry"];
        id v8 = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_76;
        }
        goto LABEL_75;
      }
      break;
    case 9u:
      if (([v6 hasSuggestionEngagementEvent:@"suggestionsViewed"] & 1) == 0)
      {
        [v6 setSuggestionEngagementEvent:@"suggestionsViewed"];
        id v8 = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_76;
        }
        goto LABEL_75;
      }
      break;
    case 0xBu:
      if (([v6 hasSuggestionEngagementEvent:@"suggestionsFavorite"] & 1) == 0)
      {
        [v6 setSuggestionEngagementEvent:@"suggestionsFavorite"];
        id v8 = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_76;
        }
        goto LABEL_75;
      }
      break;
    case 0xCu:
      if (([v6 hasSuggestionEngagementEvent:@"suggestionsThumbsUp"] & 1) == 0)
      {
        [v6 setSuggestionEngagementEvent:@"suggestionsThumbsUp"];
        id v8 = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_76;
        }
        goto LABEL_75;
      }
      break;
    case 0xDu:
      if (([v6 hasSuggestionEngagementEvent:@"suggestionEntryCreated"] & 1) == 0)
      {
        [v6 setSuggestionEngagementEvent:@"suggestionEntryCreated"];
        id v8 = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_76;
        }
        goto LABEL_75;
      }
      break;
    case 0xEu:
      if (([v6 hasSuggestionEngagementEvent:@"suggestionEntryEdited"] & 1) == 0)
      {
        [v6 setSuggestionEngagementEvent:@"suggestionEntryEdited"];
        id v8 = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_76;
        }
        goto LABEL_75;
      }
      break;
    case 0xFu:
      if (([v6 hasSuggestionEngagementEvent:@"suggestionEntryDeleted"] & 1) == 0)
      {
        [v6 setSuggestionEngagementEvent:@"suggestionEntryDeleted"];
        id v8 = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_76;
        }
        goto LABEL_75;
      }
      break;
    case 0x10u:
      if (([v6 hasSuggestionEngagementEvent:@"suggestionEntryCancelled"] & 1) == 0)
      {
        [v6 setSuggestionEngagementEvent:@"suggestionEntryCancelled"];
        id v8 = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_76;
        }
        goto LABEL_75;
      }
      break;
    case 0x11u:
      if (([v6 hasSuggestionEngagementEvent:@"suggestionsAnnotated"] & 1) == 0)
      {
        [v6 setSuggestionEngagementEvent:@"suggestionsAnnotated"];
        id v8 = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_76;
        }
        goto LABEL_75;
      }
      break;
    case 0x19u:
      if (([v6 hasSuggestionEngagementEvent:@"suggestionEntryCreatedWithUpdates"] & 1) == 0)
      {
        [v6 setSuggestionEngagementEvent:@"suggestionEntryCreatedWithUpdates"];
        id v8 = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_76;
        }
        goto LABEL_75;
      }
      break;
    case 0x1Au:
      if (([v6 hasSuggestionEngagementEvent:@"suggestionNotificationQueued"] & 1) == 0)
      {
        [v6 setSuggestionEngagementEvent:@"suggestionNotificationQueued"];
        id v8 = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_76;
        }
        goto LABEL_75;
      }
      break;
    case 0x1Bu:
      if (([v6 hasSuggestionEngagementEvent:@"suggestionNotificationDequeued"] & 1) == 0)
      {
        [v6 setSuggestionEngagementEvent:@"suggestionNotificationDequeued"];
        id v8 = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_76;
        }
        goto LABEL_75;
      }
      break;
    case 0x1Cu:
      if (([v6 hasSuggestionEngagementEvent:@"suggestionNotificationTapped"] & 1) == 0)
      {
        [v6 setSuggestionEngagementEvent:@"suggestionNotificationTapped"];
        id v8 = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_76;
        }
        goto LABEL_75;
      }
      break;
    case 0x1Du:
      if (([v6 hasSuggestionEngagementEvent:@"suggestionNotificationDismissed"] & 1) == 0)
      {
        [v6 setSuggestionEngagementEvent:@"suggestionNotificationDismissed"];
        id v8 = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_76;
        }
        goto LABEL_75;
      }
      break;
    case 0x1Eu:
      if (([v6 hasSuggestionEngagementEvent:@"suggestionNotificationPosted"] & 1) == 0)
      {
        [v6 setSuggestionEngagementEvent:@"suggestionNotificationPosted"];
        id v8 = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_76;
        }
        goto LABEL_75;
      }
      break;
    case 0x1Fu:
      if (([v6 hasSuggestionEngagementEvent:@"suggestionNotificationOverriden"] & 1) == 0)
      {
        [v6 setSuggestionEngagementEvent:@"suggestionNotificationOverriden"];
        id v8 = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
LABEL_75:
        }
          -[MOEngagementHistoryManager updateBundle:forSuggestionEvent:withSummary:]();
        goto LABEL_76;
      }
      break;
    default:
      id v8 = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        -[MOEngagementHistoryManager updateBundle:forSuggestionEvent:withSummary:](v7);
      }
LABEL_76:

      if ([v7 type] == 9) {
        [v6 setSuggestionEngagementViewCount:((char *)[v6 suggestionEngagementViewCount]) + 1];
      }
      break;
  }
}

- (void)updateBundle:(id)a3 forAppEntryEvent:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  switch([v6 type])
  {
    case 0u:
      if (([v5 hasAppEntryEngagementEvent:@"appUnknown"] & 1) == 0)
      {
        [v5 setAppEntryEngagementEvent:@"appUnknown"];
        id v7 = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_19;
        }
        goto LABEL_18;
      }
      break;
    case 1u:
      if (([v5 hasAppEntryEngagementEvent:@"appEntryCreated"] & 1) == 0)
      {
        [v5 setAppEntryEngagementEvent:@"appEntryCreated"];
        id v7 = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_19;
        }
        goto LABEL_18;
      }
      break;
    case 2u:
      if (([v5 hasAppEntryEngagementEvent:@"appEntryEdited"] & 1) == 0)
      {
        [v5 setAppEntryEngagementEvent:@"appEntryEdited"];
        id v7 = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_19;
        }
        goto LABEL_18;
      }
      break;
    case 3u:
      if (([v5 hasAppEntryEngagementEvent:@"appEntryDeleted"] & 1) == 0)
      {
        [v5 setAppEntryEngagementEvent:@"appEntryDeleted"];
        id v7 = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_19;
        }
        goto LABEL_18;
      }
      break;
    case 4u:
      if (([v5 hasAppEntryEngagementEvent:@"appEntryCancelled"] & 1) == 0)
      {
        [v5 setAppEntryEngagementEvent:@"appEntryCancelled"];
        id v7 = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
LABEL_18:
        }
          -[MOEngagementHistoryManager updateBundle:forAppEntryEvent:]();
        goto LABEL_19;
      }
      break;
    default:
      id v7 = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        -[MOEngagementHistoryManager updateBundle:forAppEntryEvent:](v6);
      }
LABEL_19:

      break;
  }
}

- (id)getInterfaceTypeCountForSuggestionEngagmentEvent:(id)a3 from:(id)a4 to:(id)a5 onceForEachBundle:(BOOL)a6 skipForEvents:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  uint64_t v46 = objc_opt_new();
  if (v8) {
    id v16 = objc_opt_new();
  }
  else {
    id v16 = 0;
  }
  unsigned int v45 = +[MOEngagementHistoryManager suggestionEventToEnum:v12];
  if ([v15 count])
  {
    id v42 = self;
    id v43 = v12;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    id v44 = v15;
    id v17 = v15;
    id v18 = [v17 countByEnumeratingWithState:&v66 objects:v70 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v67;
      do
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v67 != v20) {
            objc_enumerationMutation(v17);
          }
          if (+[MOEngagementHistoryManager suggestionEventToEnum:](MOEngagementHistoryManager, "suggestionEventToEnum:", *(void *)(*((void *)&v66 + 1) + 8 * i), v42, v43, v44))
          {
            id v22 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:");
            [0 addObject:v22];
          }
        }
        id v19 = [v17 countByEnumeratingWithState:&v66 objects:v70 count:16];
      }
      while (v19);
    }

    id v12 = v43;
    id v15 = v44;
    self = v42;
  }
  if (objc_msgSend(0, "count", v42, v43, v44))
  {
    id v23 = [(MOEngagementHistoryManager *)self stream_publisher];
    v62[0] = _NSConcreteStackBlock;
    v62[1] = 3221225472;
    v62[2] = __119__MOEngagementHistoryManager_getInterfaceTypeCountForSuggestionEngagmentEvent_from_to_onceForEachBundle_skipForEvents___block_invoke;
    v62[3] = &unk_1002CFF68;
    id v63 = 0;
    id v64 = v13;
    id v65 = v14;
    v24 = [v23 filterWithIsIncluded:v62];

    v25 = objc_opt_new();
    unint64_t v26 = [v24 reduceWithInitial:v25 nextPartialResult:&__block_literal_global_403];

    v60[0] = _NSConcreteStackBlock;
    v60[1] = 3221225472;
    v60[2] = __119__MOEngagementHistoryManager_getInterfaceTypeCountForSuggestionEngagmentEvent_from_to_onceForEachBundle_skipForEvents___block_invoke_3;
    v60[3] = &unk_1002CFFD0;
    id v61 = v15;
    v58[0] = _NSConcreteStackBlock;
    v58[1] = 3221225472;
    v58[2] = __119__MOEngagementHistoryManager_getInterfaceTypeCountForSuggestionEngagmentEvent_from_to_onceForEachBundle_skipForEvents___block_invoke_405;
    v58[3] = &unk_1002CFFF8;
    id v59 = v16;
    id v27 = [v26 sinkWithCompletion:v60 receiveInput:v58];
  }
  id v28 = [(MOEngagementHistoryManager *)self stream_publisher];
  v54[0] = _NSConcreteStackBlock;
  v54[1] = 3221225472;
  v54[2] = __119__MOEngagementHistoryManager_getInterfaceTypeCountForSuggestionEngagmentEvent_from_to_onceForEachBundle_skipForEvents___block_invoke_2_407;
  v54[3] = &unk_1002D0020;
  unsigned int v57 = v45;
  id v55 = v13;
  id v56 = v14;
  id v29 = v14;
  id v30 = v13;
  unsigned int v31 = [v28 filterWithIsIncluded:v54];

  v32 = objc_opt_new();
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472;
  v51[2] = __119__MOEngagementHistoryManager_getInterfaceTypeCountForSuggestionEngagmentEvent_from_to_onceForEachBundle_skipForEvents___block_invoke_3_409;
  v51[3] = &unk_1002D0048;
  id v52 = v16;
  BOOL v53 = v8;
  id v33 = v16;
  id v34 = [v31 reduceWithInitial:v32 nextPartialResult:v51];

  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = __119__MOEngagementHistoryManager_getInterfaceTypeCountForSuggestionEngagmentEvent_from_to_onceForEachBundle_skipForEvents___block_invoke_4;
  v49[3] = &unk_1002CFFD0;
  id v50 = v12;
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = __119__MOEngagementHistoryManager_getInterfaceTypeCountForSuggestionEngagmentEvent_from_to_onceForEachBundle_skipForEvents___block_invoke_411;
  v47[3] = &unk_1002D0070;
  id v35 = v46;
  id v48 = v35;
  id v36 = v12;
  id v37 = [v34 sinkWithCompletion:v49 receiveInput:v47];
  v38 = v15;
  v39 = v48;
  id v40 = v35;

  return v40;
}

id __119__MOEngagementHistoryManager_getInterfaceTypeCountForSuggestionEngagmentEvent_from_to_onceForEachBundle_skipForEvents___block_invoke(void *a1, void *a2)
{
  unint64_t v3 = [a2 eventBody];
  id v4 = [v3 suggestionEvent];

  if (v4)
  {
    id v5 = (void *)a1[4];
    id v6 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v4 type]);
    if ([v5 containsObject:v6])
    {
      id v7 = [v4 timestamp];
      if ([v7 isOnOrAfter:a1[5]])
      {
        BOOL v8 = [v4 timestamp];
        id v9 = [v8 isOnOrBefore:a1[6]];
      }
      else
      {
        id v9 = 0;
      }
    }
    else
    {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

NSMutableSet *__cdecl __119__MOEngagementHistoryManager_getInterfaceTypeCountForSuggestionEngagmentEvent_from_to_onceForEachBundle_skipForEvents___block_invoke_2(id a1, NSMutableSet *a2, BMStoreEvent *a3)
{
  id v4 = a2;
  id v5 = [(BMStoreEvent *)a3 eventBody];
  id v6 = [v5 suggestionEvent];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = [v6 fullBundleOrderedSet];
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = [*(id *)(*((void *)&v15 + 1) + 8 * i) identifier];
        id v13 = [v12 suggestionId];

        if (v13) {
          [(NSMutableSet *)v4 addObject:v13];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  return v4;
}

void __119__MOEngagementHistoryManager_getInterfaceTypeCountForSuggestionEngagmentEvent_from_to_onceForEachBundle_skipForEvents___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = [a2 error];

  if (v2)
  {
    unint64_t v3 = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __119__MOEngagementHistoryManager_getInterfaceTypeCountForSuggestionEngagmentEvent_from_to_onceForEachBundle_skipForEvents___block_invoke_3_cold_1();
    }
  }
}

void __119__MOEngagementHistoryManager_getInterfaceTypeCountForSuggestionEngagmentEvent_from_to_onceForEachBundle_skipForEvents___block_invoke_405(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([v5 count])
  {
    unint64_t v3 = *(void **)(a1 + 32);
    id v4 = [v5 allObjects];
    [v3 addObjectsFromArray:v4];
  }
}

id __119__MOEngagementHistoryManager_getInterfaceTypeCountForSuggestionEngagmentEvent_from_to_onceForEachBundle_skipForEvents___block_invoke_2_407(uint64_t a1, void *a2)
{
  unint64_t v3 = [a2 eventBody];
  id v4 = [v3 suggestionEvent];

  if (v4 && [v4 type] == *(_DWORD *)(a1 + 48))
  {
    id v5 = [v4 timestamp];
    if ([v5 isOnOrAfter:*(void *)(a1 + 32)])
    {
      id v6 = [v4 timestamp];
      id v7 = [v6 isOnOrBefore:*(void *)(a1 + 40)];
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

id __119__MOEngagementHistoryManager_getInterfaceTypeCountForSuggestionEngagmentEvent_from_to_onceForEachBundle_skipForEvents___block_invoke_3_409(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = [a3 eventBody];
  id v7 = [v6 suggestionEvent];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v18 = v7;
  id v8 = [v7 fullBundleOrderedSet];
  id v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        id v14 = [v13 identifier];
        long long v15 = [v14 suggestionId];

        if (([*(id *)(a1 + 32) containsObject:v15] & 1) == 0)
        {
          if (*(unsigned char *)(a1 + 40) && v15) {
            [*(id *)(a1 + 32) addObject:v15];
          }
          long long v16 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v13 interfaceType]);
          [v5 addObject:v16];
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }

  return v5;
}

void __119__MOEngagementHistoryManager_getInterfaceTypeCountForSuggestionEngagmentEvent_from_to_onceForEachBundle_skipForEvents___block_invoke_4(uint64_t a1, void *a2)
{
  v2 = [a2 error];

  if (v2)
  {
    unint64_t v3 = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __119__MOEngagementHistoryManager_getInterfaceTypeCountForSuggestionEngagmentEvent_from_to_onceForEachBundle_skipForEvents___block_invoke_4_cold_1();
    }
  }
}

void __119__MOEngagementHistoryManager_getInterfaceTypeCountForSuggestionEngagmentEvent_from_to_onceForEachBundle_skipForEvents___block_invoke_411(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        id v9 = +[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", [v3 countForObject:v8]);
        [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:v8];
      }
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (id)getInterfaceTypeCountForSuggestionEngagmentEvent:(id)a3
{
  id v4 = a3;
  id v5 = +[NSDate distantPast];
  uint64_t v6 = +[NSDate distantFuture];
  id v7 = [(MOEngagementHistoryManager *)self getInterfaceTypeCountForSuggestionEngagmentEvent:v4 from:v5 to:v6 onceForEachBundle:1 skipForEvents:0];

  return v7;
}

- (id)getInterfaceTypeCountForUniqueSuggestionsViewedFromStartDate:(id)a3 toEndDate:(id)a4
{
  return [(MOEngagementHistoryManager *)self getInterfaceTypeCountForSuggestionEngagmentEvent:@"suggestionsViewed" from:a3 to:a4 onceForEachBundle:1 skipForEvents:0];
}

- (id)getInterfaceTypeCountForUniqueSuggestionsViewedButNotEngagedFromStartDate:(id)a3 toEndDate:(id)a4
{
  CFStringRef v11 = @"suggestionsSelected";
  CFStringRef v12 = @"suggestionsQuickAddEntry";
  CFStringRef v13 = @"suggestionsDeleted";
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = +[NSArray arrayWithObjects:&v11 count:3];
  id v9 = [(MOEngagementHistoryManager *)self getInterfaceTypeCountForSuggestionEngagmentEvent:@"suggestionsViewed", v7, v6, 1, v8, v11, v12, v13 from to onceForEachBundle skipForEvents];

  return v9;
}

- (id)getInterfaceTypeCountForUniqueSuggestionsSelectedOnlyFromStartDate:(id)a3 toEndDate:(id)a4
{
  v11[0] = @"suggestionsQuickAddEntry";
  v11[1] = @"suggestionsDeleted";
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = +[NSArray arrayWithObjects:v11 count:2];
  id v9 = [(MOEngagementHistoryManager *)self getInterfaceTypeCountForSuggestionEngagmentEvent:@"suggestionsSelected" from:v7 to:v6 onceForEachBundle:1 skipForEvents:v8];

  return v9;
}

- (id)getInterfaceTypeCountForUniqueSuggestionsQuickAddEntryFromStartDate:(id)a3 toEndDate:(id)a4
{
  CFStringRef v11 = @"suggestionsDeleted";
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = +[NSArray arrayWithObjects:&v11 count:1];
  id v9 = [(MOEngagementHistoryManager *)self getInterfaceTypeCountForSuggestionEngagmentEvent:@"suggestionsQuickAddEntry", v7, v6, 1, v8, v11 from to onceForEachBundle skipForEvents];

  return v9;
}

- (id)getInterfaceTypeCountForUniqueSuggestionsDeletedFromStartDate:(id)a3 toEndDate:(id)a4
{
  return [(MOEngagementHistoryManager *)self getInterfaceTypeCountForSuggestionEngagmentEvent:@"suggestionsDeleted" from:a3 to:a4 onceForEachBundle:1 skipForEvents:0];
}

- (id)getEngagementStreamAsJson
{
  id v3 = objc_opt_new();
  id v4 = [(MOEngagementHistoryManager *)self stream_publisher];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __55__MOEngagementHistoryManager_getEngagementStreamAsJson__block_invoke_2;
  v9[3] = &unk_1002D00D8;
  id v5 = v3;
  id v10 = v5;
  id v6 = [v4 sinkWithCompletion:&__block_literal_global_414 receiveInput:v9];

  if (+[NSJSONSerialization isValidJSONObject:v5]) {
    id v7 = v5;
  }
  else {
    id v7 = 0;
  }

  return v7;
}

void __55__MOEngagementHistoryManager_getEngagementStreamAsJson__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 eventBody];
  id v5 = [v3 jsonDictionary];

  id v4 = v5;
  if (v5)
  {
    [*(id *)(a1 + 32) addObject:v5];
    id v4 = v5;
  }
}

- (id)getEvergreenTypeCountForSuggestionEngagmentEvent:(id)a3 from:(id)a4 to:(id)a5 onceForEachBundle:(BOOL)a6 skipForEvents:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v49 = a5;
  id v14 = a7;
  long long v15 = objc_opt_new();
  BOOL v50 = v8;
  if (v8) {
    long long v16 = objc_opt_new();
  }
  else {
    long long v16 = 0;
  }
  unsigned int v48 = +[MOEngagementHistoryManager suggestionEventToEnum:v12];
  long long v17 = self;
  if ([v14 count])
  {
    unsigned int v45 = v16;
    uint64_t v46 = v15;
    long long v72 = 0u;
    long long v73 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    id v47 = v14;
    id v18 = v14;
    id v19 = [v18 countByEnumeratingWithState:&v70 objects:v74 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v71;
      do
      {
        for (i = 0; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v71 != v21) {
            objc_enumerationMutation(v18);
          }
          if (+[MOEngagementHistoryManager suggestionEventToEnum:](MOEngagementHistoryManager, "suggestionEventToEnum:", *(void *)(*((void *)&v70 + 1) + 8 * i), v45, v46, v47))
          {
            id v23 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:");
            [0 addObject:v23];

            self = v17;
          }
        }
        id v20 = [v18 countByEnumeratingWithState:&v70 objects:v74 count:16];
      }
      while (v20);
    }

    long long v15 = v46;
    id v14 = v47;
    long long v16 = v45;
  }
  v24 = v13;
  if (objc_msgSend(0, "count", v45, v46, v47))
  {
    v25 = [(MOEngagementHistoryManager *)self stream_publisher];
    v66[0] = _NSConcreteStackBlock;
    v66[1] = 3221225472;
    v66[2] = __119__MOEngagementHistoryManager_getEvergreenTypeCountForSuggestionEngagmentEvent_from_to_onceForEachBundle_skipForEvents___block_invoke;
    v66[3] = &unk_1002CFF68;
    id v67 = 0;
    id v68 = v13;
    id v69 = v49;
    [v25 filterWithIsIncluded:v66];
    id v27 = v26 = v14;

    id v28 = objc_opt_new();
    id v29 = [v27 reduceWithInitial:v28 nextPartialResult:&__block_literal_global_418];

    self = v17;
    v64[0] = _NSConcreteStackBlock;
    v64[1] = 3221225472;
    v64[2] = __119__MOEngagementHistoryManager_getEvergreenTypeCountForSuggestionEngagmentEvent_from_to_onceForEachBundle_skipForEvents___block_invoke_3;
    v64[3] = &unk_1002CFFD0;
    id v65 = v12;
    v62[0] = _NSConcreteStackBlock;
    v62[1] = 3221225472;
    v62[2] = __119__MOEngagementHistoryManager_getEvergreenTypeCountForSuggestionEngagmentEvent_from_to_onceForEachBundle_skipForEvents___block_invoke_419;
    v62[3] = &unk_1002CFFF8;
    id v63 = v16;
    id v30 = [v29 sinkWithCompletion:v64 receiveInput:v62];

    id v14 = v26;
  }
  unsigned int v31 = [(MOEngagementHistoryManager *)self stream_publisher];
  v58[0] = _NSConcreteStackBlock;
  v58[1] = 3221225472;
  v58[2] = __119__MOEngagementHistoryManager_getEvergreenTypeCountForSuggestionEngagmentEvent_from_to_onceForEachBundle_skipForEvents___block_invoke_2_420;
  v58[3] = &unk_1002D0020;
  unsigned int v61 = v48;
  id v59 = v13;
  id v60 = v49;
  id v32 = v49;
  id v33 = v24;
  [v31 filterWithIsIncluded:v58];
  v35 = id v34 = v16;

  id v36 = objc_opt_new();
  v55[0] = _NSConcreteStackBlock;
  v55[1] = 3221225472;
  v55[2] = __119__MOEngagementHistoryManager_getEvergreenTypeCountForSuggestionEngagmentEvent_from_to_onceForEachBundle_skipForEvents___block_invoke_3_421;
  v55[3] = &unk_1002D0048;
  id v56 = v34;
  BOOL v57 = v50;
  id v37 = v34;
  v38 = [v35 reduceWithInitial:v36 nextPartialResult:v55];

  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472;
  v53[2] = __119__MOEngagementHistoryManager_getEvergreenTypeCountForSuggestionEngagmentEvent_from_to_onceForEachBundle_skipForEvents___block_invoke_4;
  v53[3] = &unk_1002CFFD0;
  id v54 = v12;
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472;
  v51[2] = __119__MOEngagementHistoryManager_getEvergreenTypeCountForSuggestionEngagmentEvent_from_to_onceForEachBundle_skipForEvents___block_invoke_422;
  v51[3] = &unk_1002D0070;
  id v39 = v15;
  id v52 = v39;
  id v40 = v12;
  id v41 = [v38 sinkWithCompletion:v53 receiveInput:v51];
  id v42 = v52;
  id v43 = v39;

  return v43;
}

id __119__MOEngagementHistoryManager_getEvergreenTypeCountForSuggestionEngagmentEvent_from_to_onceForEachBundle_skipForEvents___block_invoke(void *a1, void *a2)
{
  id v3 = [a2 eventBody];
  id v4 = [v3 suggestionEvent];

  if (v4)
  {
    id v5 = (void *)a1[4];
    id v6 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v4 type]);
    if ([v5 containsObject:v6])
    {
      id v7 = [v4 timestamp];
      if ([v7 isOnOrAfter:a1[5]])
      {
        BOOL v8 = [v4 timestamp];
        id v9 = [v8 isOnOrBefore:a1[6]];
      }
      else
      {
        id v9 = 0;
      }
    }
    else
    {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

NSMutableSet *__cdecl __119__MOEngagementHistoryManager_getEvergreenTypeCountForSuggestionEngagmentEvent_from_to_onceForEachBundle_skipForEvents___block_invoke_2(id a1, NSMutableSet *a2, BMStoreEvent *a3)
{
  id v4 = a2;
  id v5 = [(BMStoreEvent *)a3 eventBody];
  id v6 = [v5 suggestionEvent];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = [v6 fullBundleOrderedSet];
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = [*(id *)(*((void *)&v15 + 1) + 8 * i) identifier];
        id v13 = [v12 bundleId];

        if (v13) {
          [(NSMutableSet *)v4 addObject:v13];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  return v4;
}

void __119__MOEngagementHistoryManager_getEvergreenTypeCountForSuggestionEngagmentEvent_from_to_onceForEachBundle_skipForEvents___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = [a2 error];

  if (v2)
  {
    id v3 = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __119__MOEngagementHistoryManager_getEvergreenTypeCountForSuggestionEngagmentEvent_from_to_onceForEachBundle_skipForEvents___block_invoke_3_cold_1();
    }
  }
}

void __119__MOEngagementHistoryManager_getEvergreenTypeCountForSuggestionEngagmentEvent_from_to_onceForEachBundle_skipForEvents___block_invoke_419(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([v5 count])
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = [v5 allObjects];
    [v3 addObjectsFromArray:v4];
  }
}

id __119__MOEngagementHistoryManager_getEvergreenTypeCountForSuggestionEngagmentEvent_from_to_onceForEachBundle_skipForEvents___block_invoke_2_420(uint64_t a1, void *a2)
{
  id v3 = [a2 eventBody];
  id v4 = [v3 suggestionEvent];

  if (v4 && [v4 type] == *(_DWORD *)(a1 + 48))
  {
    id v5 = [v4 timestamp];
    if ([v5 isOnOrAfter:*(void *)(a1 + 32)])
    {
      id v6 = [v4 timestamp];
      id v7 = [v6 isOnOrBefore:*(void *)(a1 + 40)];
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

id __119__MOEngagementHistoryManager_getEvergreenTypeCountForSuggestionEngagmentEvent_from_to_onceForEachBundle_skipForEvents___block_invoke_3_421(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = [a3 eventBody];
  id v7 = [v6 suggestionEvent];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = [v7 fullBundleOrderedSet];
  id v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v14 = [v13 identifier];
        long long v15 = [v14 bundleId];

        if (([*(id *)(a1 + 32) containsObject:v15] & 1) == 0)
        {
          if (*(unsigned char *)(a1 + 40) && v15) {
            [*(id *)(a1 + 32) addObject:v15];
          }
          long long v16 = [v13 bundleEvergreenType];
          if (v16) {
            [v5 addObject:v16];
          }
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  return v5;
}

void __119__MOEngagementHistoryManager_getEvergreenTypeCountForSuggestionEngagmentEvent_from_to_onceForEachBundle_skipForEvents___block_invoke_4(uint64_t a1, void *a2)
{
  v2 = [a2 error];

  if (v2)
  {
    id v3 = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __119__MOEngagementHistoryManager_getEvergreenTypeCountForSuggestionEngagmentEvent_from_to_onceForEachBundle_skipForEvents___block_invoke_4_cold_1();
    }
  }
}

void __119__MOEngagementHistoryManager_getEvergreenTypeCountForSuggestionEngagmentEvent_from_to_onceForEachBundle_skipForEvents___block_invoke_422(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        id v9 = +[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", [v3 countForObject:v8]);
        [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:v8];
      }
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (id)getEvergreenTypeCountForSuggestionEngagmentEvent:(id)a3
{
  id v4 = a3;
  id v5 = +[NSDate distantPast];
  uint64_t v6 = +[NSDate distantFuture];
  id v7 = [(MOEngagementHistoryManager *)self getEvergreenTypeCountForSuggestionEngagmentEvent:v4 from:v5 to:v6 onceForEachBundle:1 skipForEvents:0];

  return v7;
}

- (id)getEvergreenCountForSuggestionsSelectedOnlyFromStartDate:(id)a3 toEndDate:(id)a4
{
  v11[0] = @"suggestionsQuickAddEntry";
  v11[1] = @"suggestionsDeleted";
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = +[NSArray arrayWithObjects:v11 count:2];
  id v9 = [(MOEngagementHistoryManager *)self getEvergreenTypeCountForSuggestionEngagmentEvent:@"suggestionsSelected" from:v7 to:v6 onceForEachBundle:0 skipForEvents:v8];

  return v9;
}

- (id)getEvergreenTypeCountForSuggestionsQuickAddEntryFromStartDate:(id)a3 toEndDate:(id)a4
{
  CFStringRef v11 = @"suggestionsDeleted";
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = +[NSArray arrayWithObjects:&v11 count:1];
  id v9 = [(MOEngagementHistoryManager *)self getEvergreenTypeCountForSuggestionEngagmentEvent:@"suggestionsQuickAddEntry", v7, v6, 0, v8, v11 from to onceForEachBundle skipForEvents];

  return v9;
}

- (id)getEvergreenTypeCountForSuggestionsViewedFromStartDate:(id)a3 toEndDate:(id)a4
{
  return [(MOEngagementHistoryManager *)self getEvergreenTypeCountForSuggestionEngagmentEvent:@"suggestionsViewed" from:a3 to:a4 onceForEachBundle:0 skipForEvents:0];
}

- (id)getEvergreenTypeCountForSuggestionsDeletedFromStartDate:(id)a3 toEndDate:(id)a4
{
  return [(MOEngagementHistoryManager *)self getEvergreenTypeCountForSuggestionEngagmentEvent:@"suggestionsDeleted" from:a3 to:a4 onceForEachBundle:0 skipForEvents:0];
}

- (id)getInterfaceTypeCountForAppEntryEvent:(id)a3 withMinAddedCharacterCount:(int64_t)a4 andMaxAddedCharacterCount:(int64_t)a5 fromStartDate:(id)a6 toEndDate:(id)a7 onceForEachBundle:(BOOL)a8 skipForEvents:(id)a9
{
  BOOL v9 = a8;
  id v14 = a3;
  id v15 = a6;
  id v16 = a7;
  id v17 = a9;
  id v55 = objc_opt_new();
  if (v9) {
    long long v18 = objc_opt_new();
  }
  else {
    long long v18 = 0;
  }
  unsigned int v53 = +[MOEngagementHistoryManager appEntryEventToEnum:v14];
  id v56 = v15;
  if ([v17 count])
  {
    BOOL v50 = self;
    id v51 = v18;
    int64_t v52 = a5;
    long long v84 = 0u;
    long long v85 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    id v19 = v17;
    id v20 = [v19 countByEnumeratingWithState:&v82 objects:v86 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v83;
      do
      {
        for (i = 0; i != v21; i = (char *)i + 1)
        {
          if (*(void *)v83 != v22) {
            objc_enumerationMutation(v19);
          }
          if (+[MOEngagementHistoryManager appEntryEventToEnum:*(void *)(*((void *)&v82 + 1) + 8 * i)])
          {
            v24 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:");
            [0 addObject:v24];
          }
        }
        id v21 = [v19 countByEnumeratingWithState:&v82 objects:v86 count:16];
      }
      while (v21);
    }

    long long v18 = v51;
    a5 = v52;
    id v15 = v56;
    self = v50;
  }
  v25 = "no stored events to check for creating new workout events" + 57;
  if ([0 count])
  {
    id v26 = [(MOEngagementHistoryManager *)self stream_publisher];
    v78[0] = _NSConcreteStackBlock;
    v78[1] = 3221225472;
    v78[2] = __177__MOEngagementHistoryManager_getInterfaceTypeCountForAppEntryEvent_withMinAddedCharacterCount_andMaxAddedCharacterCount_fromStartDate_toEndDate_onceForEachBundle_skipForEvents___block_invoke;
    v78[3] = &unk_1002CFF68;
    id v79 = 0;
    id v80 = v15;
    id v81 = v16;
    id v27 = [v26 filterWithIsIncluded:v78];

    id v28 = objc_opt_new();
    [v27 reduceWithInitial:v28 nextPartialResult:&__block_literal_global_424_0];
    id v29 = v17;
    id v30 = v16;
    v32 = unsigned int v31 = self;

    v25 = "";
    v76[0] = _NSConcreteStackBlock;
    v76[1] = 3221225472;
    v76[2] = __177__MOEngagementHistoryManager_getInterfaceTypeCountForAppEntryEvent_withMinAddedCharacterCount_andMaxAddedCharacterCount_fromStartDate_toEndDate_onceForEachBundle_skipForEvents___block_invoke_3;
    v76[3] = &unk_1002CFFD0;
    id v77 = v14;
    v74[0] = _NSConcreteStackBlock;
    v74[1] = 3221225472;
    v74[2] = __177__MOEngagementHistoryManager_getInterfaceTypeCountForAppEntryEvent_withMinAddedCharacterCount_andMaxAddedCharacterCount_fromStartDate_toEndDate_onceForEachBundle_skipForEvents___block_invoke_425;
    v74[3] = &unk_1002CFFF8;
    id v75 = v18;
    id v33 = [v32 sinkWithCompletion:v76 receiveInput:v74];

    self = v31;
    id v16 = v30;
    id v17 = v29;

    id v15 = v56;
  }
  [(MOEngagementHistoryManager *)self stream_publisher];
  v35 = id v34 = v18;
  id v65 = _NSConcreteStackBlock;
  uint64_t v66 = *((void *)v25 + 287);
  uint64_t v36 = v66;
  id v67 = __177__MOEngagementHistoryManager_getInterfaceTypeCountForAppEntryEvent_withMinAddedCharacterCount_andMaxAddedCharacterCount_fromStartDate_toEndDate_onceForEachBundle_skipForEvents___block_invoke_2_426;
  id v68 = &unk_1002D0140;
  unsigned int v73 = v53;
  id v69 = v15;
  id v70 = v16;
  int64_t v71 = a4;
  int64_t v72 = a5;
  id v37 = v16;
  id v38 = v15;
  id v39 = [v35 filterWithIsIncluded:&v65];

  id v40 = objc_opt_new();
  v62[0] = _NSConcreteStackBlock;
  v62[1] = v36;
  v62[2] = __177__MOEngagementHistoryManager_getInterfaceTypeCountForAppEntryEvent_withMinAddedCharacterCount_andMaxAddedCharacterCount_fromStartDate_toEndDate_onceForEachBundle_skipForEvents___block_invoke_3_427;
  v62[3] = &unk_1002D0048;
  id v63 = v34;
  BOOL v64 = v9;
  id v41 = v34;
  id v42 = [v39 reduceWithInitial:v40 nextPartialResult:v62];

  v59[0] = _NSConcreteStackBlock;
  v59[1] = v36;
  v59[2] = __177__MOEngagementHistoryManager_getInterfaceTypeCountForAppEntryEvent_withMinAddedCharacterCount_andMaxAddedCharacterCount_fromStartDate_toEndDate_onceForEachBundle_skipForEvents___block_invoke_4;
  v59[3] = &unk_1002D0168;
  id v60 = v14;
  id v61 = v17;
  v57[0] = _NSConcreteStackBlock;
  v57[1] = v36;
  v57[2] = __177__MOEngagementHistoryManager_getInterfaceTypeCountForAppEntryEvent_withMinAddedCharacterCount_andMaxAddedCharacterCount_fromStartDate_toEndDate_onceForEachBundle_skipForEvents___block_invoke_428;
  v57[3] = &unk_1002D0070;
  id v43 = v55;
  id v58 = v43;
  id v44 = v17;
  id v45 = v14;
  id v46 = [v42 sinkWithCompletion:v59 receiveInput:v57];
  id v47 = v58;
  id v48 = v43;

  return v48;
}

id __177__MOEngagementHistoryManager_getInterfaceTypeCountForAppEntryEvent_withMinAddedCharacterCount_andMaxAddedCharacterCount_fromStartDate_toEndDate_onceForEachBundle_skipForEvents___block_invoke(void *a1, void *a2)
{
  id v3 = [a2 eventBody];
  id v4 = [v3 entryEvent];

  if (v4)
  {
    id v5 = (void *)a1[4];
    id v6 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v4 type]);
    if ([v5 containsObject:v6])
    {
      id v7 = [v4 timestamp];
      if ([v7 isOnOrAfter:a1[5]])
      {
        uint64_t v8 = [v4 timestamp];
        id v9 = [v8 isOnOrBefore:a1[6]];
      }
      else
      {
        id v9 = 0;
      }
    }
    else
    {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

NSMutableSet *__cdecl __177__MOEngagementHistoryManager_getInterfaceTypeCountForAppEntryEvent_withMinAddedCharacterCount_andMaxAddedCharacterCount_fromStartDate_toEndDate_onceForEachBundle_skipForEvents___block_invoke_2(id a1, NSMutableSet *a2, BMStoreEvent *a3)
{
  id v4 = a2;
  id v5 = [(BMStoreEvent *)a3 eventBody];
  id v6 = [v5 entryEvent];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = [v6 identifier];
  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        long long v13 = [v12 suggestionId];

        if (v13)
        {
          id v14 = [v12 suggestionId];
          [(NSMutableSet *)v4 addObject:v14];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  return v4;
}

void __177__MOEngagementHistoryManager_getInterfaceTypeCountForAppEntryEvent_withMinAddedCharacterCount_andMaxAddedCharacterCount_fromStartDate_toEndDate_onceForEachBundle_skipForEvents___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = [a2 error];

  if (v2)
  {
    id v3 = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __119__MOEngagementHistoryManager_getEvergreenTypeCountForSuggestionEngagmentEvent_from_to_onceForEachBundle_skipForEvents___block_invoke_3_cold_1();
    }
  }
}

void __177__MOEngagementHistoryManager_getInterfaceTypeCountForAppEntryEvent_withMinAddedCharacterCount_andMaxAddedCharacterCount_fromStartDate_toEndDate_onceForEachBundle_skipForEvents___block_invoke_425(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([v5 count])
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = [v5 allObjects];
    [v3 addObjectsFromArray:v4];
  }
}

BOOL __177__MOEngagementHistoryManager_getInterfaceTypeCountForAppEntryEvent_withMinAddedCharacterCount_andMaxAddedCharacterCount_fromStartDate_toEndDate_onceForEachBundle_skipForEvents___block_invoke_2_426(uint64_t a1, void *a2)
{
  id v3 = [a2 eventBody];
  id v4 = [v3 entryEvent];

  if (v4 && [v4 type] == *(_DWORD *)(a1 + 64))
  {
    id v5 = [v4 timestamp];
    if ([v5 isOnOrAfter:*(void *)(a1 + 32)])
    {
      id v6 = [v4 timestamp];
      BOOL v7 = [v6 isOnOrBefore:*(void *)(a1 + 40)]
        && *(void *)(a1 + 48) <= (int)[v4 addedCharacters]
        && *(void *)(a1 + 56) >= (int)[v4 addedCharacters];
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

id __177__MOEngagementHistoryManager_getInterfaceTypeCountForAppEntryEvent_withMinAddedCharacterCount_andMaxAddedCharacterCount_fromStartDate_toEndDate_onceForEachBundle_skipForEvents___block_invoke_3_427(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = [a3 eventBody];
  BOOL v7 = [v6 entryEvent];

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v25 = v7;
  id obj = [v7 identifier];
  id v8 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v32;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v32 != v10) {
          objc_enumerationMutation(obj);
        }
        long long v12 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        long long v13 = *(void **)(a1 + 32);
        id v14 = [v12 suggestionId];
        LOBYTE(v13) = [v13 containsObject:v14];

        if ((v13 & 1) == 0)
        {
          if (*(unsigned char *)(a1 + 40))
          {
            id v15 = [v12 suggestionId];

            if (v15)
            {
              long long v16 = *(void **)(a1 + 32);
              long long v17 = [v12 suggestionId];
              [v16 addObject:v17];
            }
          }
          long long v29 = 0u;
          long long v30 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          long long v18 = [v25 bundleInterfaceTypes];
          id v19 = [v18 countByEnumeratingWithState:&v27 objects:v35 count:16];
          if (v19)
          {
            id v20 = v19;
            uint64_t v21 = *(void *)v28;
            do
            {
              for (j = 0; j != v20; j = (char *)j + 1)
              {
                if (*(void *)v28 != v21) {
                  objc_enumerationMutation(v18);
                }
                id v23 = *(void **)(*((void *)&v27 + 1) + 8 * (void)j);
                if ([v23 length]) {
                  [v5 addObject:v23];
                }
              }
              id v20 = [v18 countByEnumeratingWithState:&v27 objects:v35 count:16];
            }
            while (v20);
          }
        }
      }
      id v9 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v9);
  }

  return v5;
}

void __177__MOEngagementHistoryManager_getInterfaceTypeCountForAppEntryEvent_withMinAddedCharacterCount_andMaxAddedCharacterCount_fromStartDate_toEndDate_onceForEachBundle_skipForEvents___block_invoke_4(uint64_t a1, void *a2)
{
  v2 = [a2 error];

  if (v2)
  {
    id v3 = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __177__MOEngagementHistoryManager_getInterfaceTypeCountForAppEntryEvent_withMinAddedCharacterCount_andMaxAddedCharacterCount_fromStartDate_toEndDate_onceForEachBundle_skipForEvents___block_invoke_4_cold_1();
    }
  }
}

void __177__MOEngagementHistoryManager_getInterfaceTypeCountForAppEntryEvent_withMinAddedCharacterCount_andMaxAddedCharacterCount_fromStartDate_toEndDate_onceForEachBundle_skipForEvents___block_invoke_428(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      BOOL v7 = 0;
      do
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 8 * (void)v7);
        id v9 = [MOEventBundle alloc];
        id v10 = [(MOEventBundle *)v9 getInterfaceTypeEnum:v8];

        CFStringRef v11 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v3 countForObject:v8]);
        long long v12 = *(void **)(a1 + 32);
        long long v13 = +[NSNumber numberWithUnsignedInteger:v10];
        [v12 setObject:v11 forKeyedSubscript:v13];

        BOOL v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }
}

- (id)getInterfaceTypeCountForAppEntryEvent:(id)a3 withMinimumAddedCharacters:(int64_t)a4
{
  id v6 = a3;
  BOOL v7 = +[NSDate distantPast];
  uint64_t v8 = +[NSDate distantFuture];
  id v9 = [(MOEngagementHistoryManager *)self getInterfaceTypeCountForAppEntryEvent:v6 withMinAddedCharacterCount:a4 andMaxAddedCharacterCount:0x7FFFFFFFFFFFFFFFLL fromStartDate:v7 toEndDate:v8 onceForEachBundle:1 skipForEvents:0];

  return v9;
}

- (id)getInterfaceTypeCountForUniqueSuggestionsWithJournalCreatedFromStartDate:(id)a3 toEndDate:(id)a4 withMinimumAddedCharacters:(int64_t)a5
{
  CFStringRef v13 = @"appEntryDeleted";
  id v8 = a4;
  id v9 = a3;
  id v10 = +[NSArray arrayWithObjects:&v13 count:1];
  CFStringRef v11 = [(MOEngagementHistoryManager *)self getInterfaceTypeCountForAppEntryEvent:@"appEntryCreated" withMinAddedCharacterCount:a5 andMaxAddedCharacterCount:0x7FFFFFFFFFFFFFFFLL fromStartDate:v9 toEndDate:v8 onceForEachBundle:1 skipForEvents:v10];

  return v11;
}

- (id)getInterfaceTypeCountForUniqueSuggestionsWithJournalCreatedButNoWritingFromStartDate:(id)a3 toEndDate:(id)a4
{
  CFStringRef v11 = @"appEntryDeleted";
  CFStringRef v12 = @"appEntryEdited";
  id v6 = a4;
  id v7 = a3;
  id v8 = +[NSArray arrayWithObjects:&v11 count:2];
  id v9 = [(MOEngagementHistoryManager *)self getInterfaceTypeCountForAppEntryEvent:@"appEntryCreated", 0, 0, v7, v6, 1, v8, v11, v12 withMinAddedCharacterCount andMaxAddedCharacterCount fromStartDate toEndDate onceForEachBundle skipForEvents];

  return v9;
}

- (id)getEvergreenTypeCountForAppEntryEvent:(id)a3 withMinAddedCharacterCount:(int64_t)a4 andMaxAddedCharacterCount:(int64_t)a5 fromStartDate:(id)a6 toEndDate:(id)a7 onceForEachBundle:(BOOL)a8 skipForEvents:(id)a9
{
  BOOL v9 = a8;
  id v14 = a3;
  id v15 = a6;
  id v16 = a7;
  id v17 = a9;
  id v55 = objc_opt_new();
  if (v9) {
    long long v18 = objc_opt_new();
  }
  else {
    long long v18 = 0;
  }
  unsigned int v53 = +[MOEngagementHistoryManager appEntryEventToEnum:v14];
  id v56 = v15;
  if ([v17 count])
  {
    BOOL v50 = self;
    id v51 = v18;
    int64_t v52 = a5;
    long long v84 = 0u;
    long long v85 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    id v19 = v17;
    id v20 = [v19 countByEnumeratingWithState:&v82 objects:v86 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v83;
      do
      {
        for (i = 0; i != v21; i = (char *)i + 1)
        {
          if (*(void *)v83 != v22) {
            objc_enumerationMutation(v19);
          }
          if (+[MOEngagementHistoryManager appEntryEventToEnum:*(void *)(*((void *)&v82 + 1) + 8 * i)])
          {
            v24 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:");
            [0 addObject:v24];
          }
        }
        id v21 = [v19 countByEnumeratingWithState:&v82 objects:v86 count:16];
      }
      while (v21);
    }

    long long v18 = v51;
    a5 = v52;
    id v15 = v56;
    self = v50;
  }
  v25 = "no stored events to check for creating new workout events" + 57;
  if ([0 count])
  {
    id v26 = [(MOEngagementHistoryManager *)self stream_publisher];
    v78[0] = _NSConcreteStackBlock;
    v78[1] = 3221225472;
    v78[2] = __177__MOEngagementHistoryManager_getEvergreenTypeCountForAppEntryEvent_withMinAddedCharacterCount_andMaxAddedCharacterCount_fromStartDate_toEndDate_onceForEachBundle_skipForEvents___block_invoke;
    v78[3] = &unk_1002CFF68;
    id v79 = 0;
    id v80 = v15;
    id v81 = v16;
    long long v27 = [v26 filterWithIsIncluded:v78];

    long long v28 = objc_opt_new();
    [v27 reduceWithInitial:v28 nextPartialResult:&__block_literal_global_431];
    id v29 = v17;
    id v30 = v16;
    v32 = long long v31 = self;

    v25 = "";
    v76[0] = _NSConcreteStackBlock;
    v76[1] = 3221225472;
    v76[2] = __177__MOEngagementHistoryManager_getEvergreenTypeCountForAppEntryEvent_withMinAddedCharacterCount_andMaxAddedCharacterCount_fromStartDate_toEndDate_onceForEachBundle_skipForEvents___block_invoke_3;
    v76[3] = &unk_1002CFFD0;
    id v77 = v14;
    v74[0] = _NSConcreteStackBlock;
    v74[1] = 3221225472;
    v74[2] = __177__MOEngagementHistoryManager_getEvergreenTypeCountForAppEntryEvent_withMinAddedCharacterCount_andMaxAddedCharacterCount_fromStartDate_toEndDate_onceForEachBundle_skipForEvents___block_invoke_432;
    v74[3] = &unk_1002CFFF8;
    id v75 = v18;
    id v33 = [v32 sinkWithCompletion:v76 receiveInput:v74];

    self = v31;
    id v16 = v30;
    id v17 = v29;

    id v15 = v56;
  }
  [(MOEngagementHistoryManager *)self stream_publisher];
  v35 = long long v34 = v18;
  id v65 = _NSConcreteStackBlock;
  uint64_t v66 = *((void *)v25 + 287);
  uint64_t v36 = v66;
  id v67 = __177__MOEngagementHistoryManager_getEvergreenTypeCountForAppEntryEvent_withMinAddedCharacterCount_andMaxAddedCharacterCount_fromStartDate_toEndDate_onceForEachBundle_skipForEvents___block_invoke_2_433;
  id v68 = &unk_1002D0140;
  unsigned int v73 = v53;
  id v69 = v15;
  id v70 = v16;
  int64_t v71 = a4;
  int64_t v72 = a5;
  id v37 = v16;
  id v38 = v15;
  id v39 = [v35 filterWithIsIncluded:&v65];

  id v40 = objc_opt_new();
  v62[0] = _NSConcreteStackBlock;
  v62[1] = v36;
  v62[2] = __177__MOEngagementHistoryManager_getEvergreenTypeCountForAppEntryEvent_withMinAddedCharacterCount_andMaxAddedCharacterCount_fromStartDate_toEndDate_onceForEachBundle_skipForEvents___block_invoke_3_434;
  v62[3] = &unk_1002D0048;
  id v63 = v34;
  BOOL v64 = v9;
  id v41 = v34;
  id v42 = [v39 reduceWithInitial:v40 nextPartialResult:v62];

  v59[0] = _NSConcreteStackBlock;
  v59[1] = v36;
  v59[2] = __177__MOEngagementHistoryManager_getEvergreenTypeCountForAppEntryEvent_withMinAddedCharacterCount_andMaxAddedCharacterCount_fromStartDate_toEndDate_onceForEachBundle_skipForEvents___block_invoke_4;
  v59[3] = &unk_1002D0168;
  id v60 = v14;
  id v61 = v17;
  v57[0] = _NSConcreteStackBlock;
  v57[1] = v36;
  v57[2] = __177__MOEngagementHistoryManager_getEvergreenTypeCountForAppEntryEvent_withMinAddedCharacterCount_andMaxAddedCharacterCount_fromStartDate_toEndDate_onceForEachBundle_skipForEvents___block_invoke_435;
  v57[3] = &unk_1002D0070;
  id v43 = v55;
  id v58 = v43;
  id v44 = v17;
  id v45 = v14;
  id v46 = [v42 sinkWithCompletion:v59 receiveInput:v57];
  id v47 = v58;
  id v48 = v43;

  return v48;
}

id __177__MOEngagementHistoryManager_getEvergreenTypeCountForAppEntryEvent_withMinAddedCharacterCount_andMaxAddedCharacterCount_fromStartDate_toEndDate_onceForEachBundle_skipForEvents___block_invoke(void *a1, void *a2)
{
  id v3 = [a2 eventBody];
  id v4 = [v3 entryEvent];

  if (v4)
  {
    id v5 = (void *)a1[4];
    id v6 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v4 type]);
    if ([v5 containsObject:v6])
    {
      id v7 = [v4 timestamp];
      if ([v7 isOnOrAfter:a1[5]])
      {
        id v8 = [v4 timestamp];
        id v9 = [v8 isOnOrBefore:a1[6]];
      }
      else
      {
        id v9 = 0;
      }
    }
    else
    {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

NSMutableSet *__cdecl __177__MOEngagementHistoryManager_getEvergreenTypeCountForAppEntryEvent_withMinAddedCharacterCount_andMaxAddedCharacterCount_fromStartDate_toEndDate_onceForEachBundle_skipForEvents___block_invoke_2(id a1, NSMutableSet *a2, BMStoreEvent *a3)
{
  id v4 = a2;
  id v5 = [(BMStoreEvent *)a3 eventBody];
  id v6 = [v5 entryEvent];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = [v6 identifier];
  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        CFStringRef v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        CFStringRef v13 = [v12 suggestionId];

        if (v13)
        {
          id v14 = [v12 suggestionId];
          [(NSMutableSet *)v4 addObject:v14];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  return v4;
}

void __177__MOEngagementHistoryManager_getEvergreenTypeCountForAppEntryEvent_withMinAddedCharacterCount_andMaxAddedCharacterCount_fromStartDate_toEndDate_onceForEachBundle_skipForEvents___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = [a2 error];

  if (v2)
  {
    id v3 = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __177__MOEngagementHistoryManager_getEvergreenTypeCountForAppEntryEvent_withMinAddedCharacterCount_andMaxAddedCharacterCount_fromStartDate_toEndDate_onceForEachBundle_skipForEvents___block_invoke_3_cold_1();
    }
  }
}

void __177__MOEngagementHistoryManager_getEvergreenTypeCountForAppEntryEvent_withMinAddedCharacterCount_andMaxAddedCharacterCount_fromStartDate_toEndDate_onceForEachBundle_skipForEvents___block_invoke_432(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([v5 count])
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = [v5 allObjects];
    [v3 addObjectsFromArray:v4];
  }
}

BOOL __177__MOEngagementHistoryManager_getEvergreenTypeCountForAppEntryEvent_withMinAddedCharacterCount_andMaxAddedCharacterCount_fromStartDate_toEndDate_onceForEachBundle_skipForEvents___block_invoke_2_433(uint64_t a1, void *a2)
{
  id v3 = [a2 eventBody];
  id v4 = [v3 entryEvent];

  if (v4 && [v4 type] == *(_DWORD *)(a1 + 64))
  {
    id v5 = [v4 timestamp];
    if ([v5 isOnOrAfter:*(void *)(a1 + 32)])
    {
      id v6 = [v4 timestamp];
      BOOL v7 = [v6 isOnOrBefore:*(void *)(a1 + 40)]
        && *(void *)(a1 + 48) <= (int)[v4 addedCharacters]
        && *(void *)(a1 + 56) >= (int)[v4 addedCharacters];
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

id __177__MOEngagementHistoryManager_getEvergreenTypeCountForAppEntryEvent_withMinAddedCharacterCount_andMaxAddedCharacterCount_fromStartDate_toEndDate_onceForEachBundle_skipForEvents___block_invoke_3_434(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = [a3 eventBody];
  BOOL v7 = [v6 entryEvent];

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v25 = v7;
  id obj = [v7 identifier];
  id v8 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v32;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v32 != v10) {
          objc_enumerationMutation(obj);
        }
        CFStringRef v12 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        CFStringRef v13 = *(void **)(a1 + 32);
        id v14 = [v12 suggestionId];
        LOBYTE(v13) = [v13 containsObject:v14];

        if ((v13 & 1) == 0)
        {
          if (*(unsigned char *)(a1 + 40))
          {
            id v15 = [v12 suggestionId];

            if (v15)
            {
              long long v16 = *(void **)(a1 + 32);
              long long v17 = [v12 suggestionId];
              [v16 addObject:v17];
            }
          }
          long long v29 = 0u;
          long long v30 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          long long v18 = [v25 bundleEvergreenTypes];
          id v19 = [v18 countByEnumeratingWithState:&v27 objects:v35 count:16];
          if (v19)
          {
            id v20 = v19;
            uint64_t v21 = *(void *)v28;
            do
            {
              for (j = 0; j != v20; j = (char *)j + 1)
              {
                if (*(void *)v28 != v21) {
                  objc_enumerationMutation(v18);
                }
                id v23 = *(void **)(*((void *)&v27 + 1) + 8 * (void)j);
                if ([v23 length]) {
                  [v5 addObject:v23];
                }
              }
              id v20 = [v18 countByEnumeratingWithState:&v27 objects:v35 count:16];
            }
            while (v20);
          }
        }
      }
      id v9 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v9);
  }

  return v5;
}

void __177__MOEngagementHistoryManager_getEvergreenTypeCountForAppEntryEvent_withMinAddedCharacterCount_andMaxAddedCharacterCount_fromStartDate_toEndDate_onceForEachBundle_skipForEvents___block_invoke_4(uint64_t a1, void *a2)
{
  v2 = [a2 error];

  if (v2)
  {
    id v3 = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __177__MOEngagementHistoryManager_getEvergreenTypeCountForAppEntryEvent_withMinAddedCharacterCount_andMaxAddedCharacterCount_fromStartDate_toEndDate_onceForEachBundle_skipForEvents___block_invoke_4_cold_1();
    }
  }
}

void __177__MOEngagementHistoryManager_getEvergreenTypeCountForAppEntryEvent_withMinAddedCharacterCount_andMaxAddedCharacterCount_fromStartDate_toEndDate_onceForEachBundle_skipForEvents___block_invoke_435(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        id v9 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v3 countForObject:v8]);
        [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:v8];
      }
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (id)getEvergreenTypeCountForAppEntryEvent:(id)a3 withMinimumAddedCharacters:(int64_t)a4
{
  id v6 = a3;
  BOOL v7 = +[NSDate distantPast];
  uint64_t v8 = +[NSDate distantFuture];
  id v9 = [(MOEngagementHistoryManager *)self getEvergreenTypeCountForAppEntryEvent:v6 withMinAddedCharacterCount:a4 andMaxAddedCharacterCount:0x7FFFFFFFFFFFFFFFLL fromStartDate:v7 toEndDate:v8 onceForEachBundle:0 skipForEvents:0];

  return v9;
}

- (id)getEvergreenTypeCountForSuggestionsWithJournalCreatedFromStartDate:(id)a3 toEndDate:(id)a4 withMinimumAddedCharacters:(int64_t)a5
{
  CFStringRef v13 = @"appEntryDeleted";
  id v8 = a4;
  id v9 = a3;
  long long v10 = +[NSArray arrayWithObjects:&v13 count:1];
  long long v11 = [(MOEngagementHistoryManager *)self getEvergreenTypeCountForAppEntryEvent:@"appEntryCreated" withMinAddedCharacterCount:a5 andMaxAddedCharacterCount:0x7FFFFFFFFFFFFFFFLL fromStartDate:v9 toEndDate:v8 onceForEachBundle:0 skipForEvents:v10];

  return v11;
}

- (id)getEvergreenTypeCountForSuggestionsWithJournalCreatedButNoWritingFromStartDate:(id)a3 toEndDate:(id)a4
{
  CFStringRef v11 = @"appEntryDeleted";
  CFStringRef v12 = @"appEntryEdited";
  id v6 = a4;
  id v7 = a3;
  id v8 = +[NSArray arrayWithObjects:&v11 count:2];
  id v9 = [(MOEngagementHistoryManager *)self getEvergreenTypeCountForAppEntryEvent:@"appEntryCreated", 0, 0, v7, v6, 0, v8, v11, v12 withMinAddedCharacterCount andMaxAddedCharacterCount fromStartDate toEndDate onceForEachBundle skipForEvents];

  return v9;
}

- (void)eventBundleStore:(id)a3 needsEngagementInfoForBundles:(id)a4
{
  long long v28 = self;
  id v4 = a4;
  id v5 = objc_opt_new();
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v36 objects:v43 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v37;
    long long v10 = &MOLogFacilityEngagement;
    id v29 = v6;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v37 != v9) {
          objc_enumerationMutation(v6);
        }
        CFStringRef v12 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        CFStringRef v13 = [v12 suggestionID:v28];
        id v14 = v13;
        if (v13)
        {
          id v15 = [v13 UUIDString];
          if (v15)
          {
            long long v16 = [v5 objectForKeyedSubscript:v15];

            if (v16)
            {
              long long v17 = [v5 objectForKeyedSubscript:v15];
              [v17 addObject:v12];
            }
            else
            {
              long long v18 = v10;
              id v41 = v12;
              long long v17 = +[NSArray arrayWithObjects:&v41 count:1];
              id v19 = +[NSMutableArray arrayWithArray:v17];
              [v5 setObject:v19 forKeyedSubscript:v15];

              long long v10 = v18;
              id v6 = v29;
            }
          }
          else
          {
            long long v17 = _mo_log_facility_get_os_log(v10);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
              -[MOEngagementHistoryManager eventBundleStore:needsEngagementInfoForBundles:]((uint64_t)v40, (uint64_t)v12);
            }
          }
        }
        else
        {
          id v15 = _mo_log_facility_get_os_log(v10);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
            -[MOEngagementHistoryManager eventBundleStore:needsEngagementInfoForBundles:]((uint64_t)v42, (uint64_t)v12);
          }
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v36 objects:v43 count:16];
    }
    while (v8);
  }

  id v20 = [(MOEngagementHistoryManager *)v28 stream_publisher];
  uint64_t v21 = [v20 filterWithIsIncluded:&__block_literal_global_437];
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = __77__MOEngagementHistoryManager_eventBundleStore_needsEngagementInfoForBundles___block_invoke_440;
  v33[3] = &unk_1002CFE08;
  id v22 = v5;
  id v34 = v22;
  id v35 = v28;
  id v23 = [v21 sinkWithCompletion:&__block_literal_global_439 receiveInput:v33];

  v24 = [(MOEngagementHistoryManager *)v28 stream_publisher];
  v25 = [v24 filterWithIsIncluded:&__block_literal_global_443];
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = __77__MOEngagementHistoryManager_eventBundleStore_needsEngagementInfoForBundles___block_invoke_446;
  v30[3] = &unk_1002CFE08;
  id v31 = v22;
  long long v32 = v28;
  id v26 = v22;
  id v27 = [v25 sinkWithCompletion:&__block_literal_global_445 receiveInput:v30];
}

BOOL __77__MOEngagementHistoryManager_eventBundleStore_needsEngagementInfoForBundles___block_invoke(id a1, BMStoreEvent *a2)
{
  v2 = [(BMStoreEvent *)a2 eventBody];
  id v3 = [v2 suggestionEvent];
  id v4 = [v3 clientIdentifier];
  BOOL v5 = v4 != 0;

  return v5;
}

void __77__MOEngagementHistoryManager_eventBundleStore_needsEngagementInfoForBundles___block_invoke_2(id a1, BPSCompletion *a2)
{
  v2 = [(BPSCompletion *)a2 error];

  if (v2)
  {
    id v3 = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __77__MOEngagementHistoryManager_eventBundleStore_needsEngagementInfoForBundles___block_invoke_2_cold_1();
    }
  }
}

void __77__MOEngagementHistoryManager_eventBundleStore_needsEngagementInfoForBundles___block_invoke_440(uint64_t a1, void *a2)
{
  id v3 = [a2 eventBody];
  id v4 = [v3 suggestionEvent];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = [v4 fullBundleOrderedSet];
  id v5 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v17 = *(void *)v23;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v9 = [v8 identifier];
        long long v10 = [v9 suggestionId];

        if (v10)
        {
          long long v20 = 0u;
          long long v21 = 0u;
          long long v18 = 0u;
          long long v19 = 0u;
          CFStringRef v11 = [*(id *)(a1 + 32) objectForKeyedSubscript:v10];
          id v12 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
          if (v12)
          {
            id v13 = v12;
            uint64_t v14 = *(void *)v19;
            do
            {
              for (j = 0; j != v13; j = (char *)j + 1)
              {
                if (*(void *)v19 != v14) {
                  objc_enumerationMutation(v11);
                }
                [*(id *)(a1 + 40) updateBundle:*(void *)(*((void *)&v18 + 1) + 8 * (void)j) forSuggestionEvent:v4 withSummary:v8];
              }
              id v13 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
            }
            while (v13);
          }
        }
      }
      id v6 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v6);
  }
}

BOOL __77__MOEngagementHistoryManager_eventBundleStore_needsEngagementInfoForBundles___block_invoke_2_441(id a1, BMStoreEvent *a2)
{
  v2 = [(BMStoreEvent *)a2 eventBody];
  id v3 = [v2 entryEvent];
  BOOL v4 = v3 != 0;

  return v4;
}

void __77__MOEngagementHistoryManager_eventBundleStore_needsEngagementInfoForBundles___block_invoke_3(id a1, BPSCompletion *a2)
{
  v2 = [(BPSCompletion *)a2 error];

  if (v2)
  {
    id v3 = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __77__MOEngagementHistoryManager_eventBundleStore_needsEngagementInfoForBundles___block_invoke_3_cold_1();
    }
  }
}

void __77__MOEngagementHistoryManager_eventBundleStore_needsEngagementInfoForBundles___block_invoke_446(uint64_t a1, void *a2)
{
  id v3 = [a2 eventBody];
  BOOL v4 = [v3 entryEvent];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = [v4 identifier];
  id v5 = [obj countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = [*(id *)(*((void *)&v20 + 1) + 8 * (void)v8) suggestionId];
        if (v9)
        {
          long long v18 = 0u;
          long long v19 = 0u;
          long long v16 = 0u;
          long long v17 = 0u;
          long long v10 = [*(id *)(a1 + 32) objectForKeyedSubscript:v9];
          id v11 = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
          if (v11)
          {
            id v12 = v11;
            uint64_t v13 = *(void *)v17;
            do
            {
              uint64_t v14 = 0;
              do
              {
                if (*(void *)v17 != v13) {
                  objc_enumerationMutation(v10);
                }
                [*(id *)(a1 + 40) updateBundle:*(void *)(*((void *)&v16 + 1) + 8 * (void)v14) forAppEntryEvent:v4];
                uint64_t v14 = (char *)v14 + 1;
              }
              while (v12 != v14);
              id v12 = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
            }
            while (v12);
          }
        }
        id v8 = (char *)v8 + 1;
      }
      while (v8 != v6);
      id v6 = [obj countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v6);
  }
}

- (id)_convertStringArrayIntoCombinedHashedString:(id)a3
{
  id v3 = a3;
  BOOL v4 = v3;
  if (v3 && [v3 count])
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v18 = v4;
    id v5 = v4;
    id v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v6)
    {
      id v7 = v6;
      id v8 = 0;
      id v9 = 0;
      uint64_t v10 = *(void *)v20;
      do
      {
        id v11 = 0;
        id v12 = v8;
        do
        {
          if (*(void *)v20 != v10) {
            objc_enumerationMutation(v5);
          }
          uint64_t v13 = *(void **)(*((void *)&v19 + 1) + 8 * (void)v11);
          id v15 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v13 hash]);
          id v8 = [v15 stringValue];

          if (v9)
          {
            uint64_t v16 = [v9 stringByAppendingFormat:@";%@", v8];

            id v9 = (id)v16;
          }
          else
          {
            id v9 = v8;
          }
          id v11 = (char *)v11 + 1;
          id v12 = v8;
        }
        while (v7 != v11);
        id v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v7);
    }
    else
    {
      id v8 = 0;
      id v9 = 0;
    }

    BOOL v4 = v18;
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)fetchSuggestionEngagementEventsFromStartDate:(id)a3 toEndDate:(id)a4 withError:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = objc_opt_new();
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000;
  id v29 = __Block_byref_object_copy__28;
  long long v30 = __Block_byref_object_dispose__28;
  id v31 = 0;
  id v11 = [(MOEngagementHistoryManager *)self stream_publisher];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = __95__MOEngagementHistoryManager_fetchSuggestionEngagementEventsFromStartDate_toEndDate_withError___block_invoke;
  v23[3] = &unk_1002D0250;
  id v12 = v8;
  id v24 = v12;
  id v13 = v9;
  id v25 = v13;
  uint64_t v14 = [v11 filterWithIsIncluded:v23];

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = __95__MOEngagementHistoryManager_fetchSuggestionEngagementEventsFromStartDate_toEndDate_withError___block_invoke_2;
  v22[3] = &unk_1002D0278;
  v22[4] = &v26;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = __95__MOEngagementHistoryManager_fetchSuggestionEngagementEventsFromStartDate_toEndDate_withError___block_invoke_450;
  v20[3] = &unk_1002D00D8;
  id v15 = v10;
  id v21 = v15;
  id v16 = [v14 sinkWithCompletion:v22 receiveInput:v20];
  if (a5) {
    *a5 = (id) v27[5];
  }
  long long v17 = v21;
  id v18 = v15;

  _Block_object_dispose(&v26, 8);

  return v18;
}

id __95__MOEngagementHistoryManager_fetchSuggestionEngagementEventsFromStartDate_toEndDate_withError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 eventBody];
  BOOL v4 = [v3 suggestionEvent];

  if (v4)
  {
    id v5 = [v4 timestamp];
    if ([v5 isOnOrAfter:*(void *)(a1 + 32)])
    {
      id v6 = [v4 timestamp];
      id v7 = [v6 isOnOrBefore:*(void *)(a1 + 40)];
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

void __95__MOEngagementHistoryManager_fetchSuggestionEngagementEventsFromStartDate_toEndDate_withError___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 error];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  id v7 = [v3 error];

  if (v7)
  {
    id v8 = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __95__MOEngagementHistoryManager_fetchSuggestionEngagementEventsFromStartDate_toEndDate_withError___block_invoke_2_cold_1();
    }
  }
}

void __95__MOEngagementHistoryManager_fetchSuggestionEngagementEventsFromStartDate_toEndDate_withError___block_invoke_450(uint64_t a1, void *a2)
{
  id v3 = [a2 eventBody];
  id v5 = [v3 jsonDictionary];

  uint64_t v4 = v5;
  if (v5)
  {
    [*(id *)(a1 + 32) addObject:v5];
    uint64_t v4 = v5;
  }
}

- (id)fetchAppEntryEngagementEventsFromStartDate:(id)a3 toEndDate:(id)a4 withError:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = objc_opt_new();
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000;
  id v29 = __Block_byref_object_copy__28;
  long long v30 = __Block_byref_object_dispose__28;
  id v31 = 0;
  id v11 = [(MOEngagementHistoryManager *)self stream_publisher];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = __93__MOEngagementHistoryManager_fetchAppEntryEngagementEventsFromStartDate_toEndDate_withError___block_invoke;
  v23[3] = &unk_1002D0250;
  id v12 = v8;
  id v24 = v12;
  id v13 = v9;
  id v25 = v13;
  uint64_t v14 = [v11 filterWithIsIncluded:v23];

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = __93__MOEngagementHistoryManager_fetchAppEntryEngagementEventsFromStartDate_toEndDate_withError___block_invoke_2;
  v22[3] = &unk_1002D0278;
  v22[4] = &v26;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = __93__MOEngagementHistoryManager_fetchAppEntryEngagementEventsFromStartDate_toEndDate_withError___block_invoke_451;
  v20[3] = &unk_1002D00D8;
  id v15 = v10;
  id v21 = v15;
  id v16 = [v14 sinkWithCompletion:v22 receiveInput:v20];
  if (a5) {
    *a5 = (id) v27[5];
  }
  long long v17 = v21;
  id v18 = v15;

  _Block_object_dispose(&v26, 8);

  return v18;
}

id __93__MOEngagementHistoryManager_fetchAppEntryEngagementEventsFromStartDate_toEndDate_withError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 eventBody];
  uint64_t v4 = [v3 entryEvent];

  if (v4)
  {
    id v5 = [v4 timestamp];
    if ([v5 isOnOrAfter:*(void *)(a1 + 32)])
    {
      id v6 = [v4 timestamp];
      id v7 = [v6 isOnOrBefore:*(void *)(a1 + 40)];
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

void __93__MOEngagementHistoryManager_fetchAppEntryEngagementEventsFromStartDate_toEndDate_withError___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 error];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  id v7 = [v3 error];

  if (v7)
  {
    id v8 = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __93__MOEngagementHistoryManager_fetchAppEntryEngagementEventsFromStartDate_toEndDate_withError___block_invoke_2_cold_1();
    }
  }
}

void __93__MOEngagementHistoryManager_fetchAppEntryEngagementEventsFromStartDate_toEndDate_withError___block_invoke_451(uint64_t a1, void *a2)
{
  id v3 = [a2 eventBody];
  id v5 = [v3 jsonDictionary];

  uint64_t v4 = v5;
  if (v5)
  {
    [*(id *)(a1 + 32) addObject:v5];
    uint64_t v4 = v5;
  }
}

- (id)fetchSuggestionEngagementEventsWithTypes:(id)a3 fromStartDate:(id)a4 toEndDate:(id)a5 withError:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = objc_opt_new();
  uint64_t v31 = 0;
  long long v32 = &v31;
  uint64_t v33 = 0x3032000000;
  id v34 = __Block_byref_object_copy__28;
  id v35 = __Block_byref_object_dispose__28;
  id v36 = 0;
  uint64_t v14 = [(MOEngagementHistoryManager *)self stream_publisher];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = __105__MOEngagementHistoryManager_fetchSuggestionEngagementEventsWithTypes_fromStartDate_toEndDate_withError___block_invoke;
  v27[3] = &unk_1002CFF68;
  id v15 = v10;
  id v28 = v15;
  id v16 = v11;
  id v29 = v16;
  id v17 = v12;
  id v30 = v17;
  id v18 = [v14 filterWithIsIncluded:v27];

  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = __105__MOEngagementHistoryManager_fetchSuggestionEngagementEventsWithTypes_fromStartDate_toEndDate_withError___block_invoke_2;
  v26[3] = &unk_1002D0278;
  v26[4] = &v31;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = __105__MOEngagementHistoryManager_fetchSuggestionEngagementEventsWithTypes_fromStartDate_toEndDate_withError___block_invoke_452;
  v24[3] = &unk_1002D00D8;
  id v19 = v13;
  id v25 = v19;
  id v20 = [v18 sinkWithCompletion:v26 receiveInput:v24];
  if (a6) {
    *a6 = (id) v32[5];
  }
  id v21 = v25;
  id v22 = v19;

  _Block_object_dispose(&v31, 8);

  return v22;
}

id __105__MOEngagementHistoryManager_fetchSuggestionEngagementEventsWithTypes_fromStartDate_toEndDate_withError___block_invoke(void *a1, void *a2)
{
  id v3 = [a2 eventBody];
  uint64_t v4 = [v3 suggestionEvent];

  if (v4)
  {
    id v5 = (void *)a1[4];
    id v6 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v4 type]);
    if ([v5 containsObject:v6])
    {
      id v7 = [v4 timestamp];
      if ([v7 isOnOrAfter:a1[5]])
      {
        id v8 = [v4 timestamp];
        id v9 = [v8 isOnOrBefore:a1[6]];
      }
      else
      {
        id v9 = 0;
      }
    }
    else
    {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

void __105__MOEngagementHistoryManager_fetchSuggestionEngagementEventsWithTypes_fromStartDate_toEndDate_withError___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 error];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  id v7 = [v3 error];

  if (v7)
  {
    id v8 = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __105__MOEngagementHistoryManager_fetchSuggestionEngagementEventsWithTypes_fromStartDate_toEndDate_withError___block_invoke_2_cold_1();
    }
  }
}

void __105__MOEngagementHistoryManager_fetchSuggestionEngagementEventsWithTypes_fromStartDate_toEndDate_withError___block_invoke_452(uint64_t a1, void *a2)
{
  id v3 = [a2 eventBody];
  id v5 = [v3 jsonDictionary];

  uint64_t v4 = v5;
  if (v5)
  {
    [*(id *)(a1 + 32) addObject:v5];
    uint64_t v4 = v5;
  }
}

- (id)fetchAppEntryEngagementEventsWithTypes:(id)a3 fromStartDate:(id)a4 toEndDate:(id)a5 withError:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = objc_opt_new();
  uint64_t v31 = 0;
  long long v32 = &v31;
  uint64_t v33 = 0x3032000000;
  id v34 = __Block_byref_object_copy__28;
  id v35 = __Block_byref_object_dispose__28;
  id v36 = 0;
  uint64_t v14 = [(MOEngagementHistoryManager *)self stream_publisher];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = __103__MOEngagementHistoryManager_fetchAppEntryEngagementEventsWithTypes_fromStartDate_toEndDate_withError___block_invoke;
  v27[3] = &unk_1002CFF68;
  id v15 = v10;
  id v28 = v15;
  id v16 = v11;
  id v29 = v16;
  id v17 = v12;
  id v30 = v17;
  id v18 = [v14 filterWithIsIncluded:v27];

  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = __103__MOEngagementHistoryManager_fetchAppEntryEngagementEventsWithTypes_fromStartDate_toEndDate_withError___block_invoke_2;
  v26[3] = &unk_1002D0278;
  v26[4] = &v31;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = __103__MOEngagementHistoryManager_fetchAppEntryEngagementEventsWithTypes_fromStartDate_toEndDate_withError___block_invoke_453;
  v24[3] = &unk_1002D00D8;
  id v19 = v13;
  id v25 = v19;
  id v20 = [v18 sinkWithCompletion:v26 receiveInput:v24];
  if (a6) {
    *a6 = (id) v32[5];
  }
  id v21 = v25;
  id v22 = v19;

  _Block_object_dispose(&v31, 8);

  return v22;
}

id __103__MOEngagementHistoryManager_fetchAppEntryEngagementEventsWithTypes_fromStartDate_toEndDate_withError___block_invoke(void *a1, void *a2)
{
  id v3 = [a2 eventBody];
  uint64_t v4 = [v3 entryEvent];

  if (v4)
  {
    id v5 = (void *)a1[4];
    id v6 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v4 type]);
    if ([v5 containsObject:v6])
    {
      id v7 = [v4 timestamp];
      if ([v7 isOnOrAfter:a1[5]])
      {
        id v8 = [v4 timestamp];
        id v9 = [v8 isOnOrBefore:a1[6]];
      }
      else
      {
        id v9 = 0;
      }
    }
    else
    {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

void __103__MOEngagementHistoryManager_fetchAppEntryEngagementEventsWithTypes_fromStartDate_toEndDate_withError___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 error];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  id v7 = [v3 error];

  if (v7)
  {
    id v8 = _mo_log_facility_get_os_log(&MOLogFacilityEngagement);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __103__MOEngagementHistoryManager_fetchAppEntryEngagementEventsWithTypes_fromStartDate_toEndDate_withError___block_invoke_2_cold_1();
    }
  }
}

void __103__MOEngagementHistoryManager_fetchAppEntryEngagementEventsWithTypes_fromStartDate_toEndDate_withError___block_invoke_453(uint64_t a1, void *a2)
{
  id v3 = [a2 eventBody];
  id v5 = [v3 jsonDictionary];

  uint64_t v4 = v5;
  if (v5)
  {
    [*(id *)(a1 + 32) addObject:v5];
    uint64_t v4 = v5;
  }
}

- (BMSource)stream_source
{
  return self->_stream_source;
}

- (BMBookmarkablePublisher)stream_publisher
{
  return self->_stream_publisher;
}

- (BOOL)isInternalBuild
{
  return self->_isInternalBuild;
}

- (NSArray)suggestionEngagementTypesEligibleForRawExternalAnalytics
{
  return self->_suggestionEngagementTypesEligibleForRawExternalAnalytics;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionEngagementTypesEligibleForRawExternalAnalytics, 0);
  objc_storeStrong((id *)&self->_stream_publisher, 0);

  objc_storeStrong((id *)&self->_stream_source, 0);
}

- (void)initWithUniverse:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: bundleStore", v2, v3, v4, v5, v6);
}

- (void)getBMBundleSumaryForBundle:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "getBMBundleSumaryForBundle: Ignoring invalid bundle (no id)", v2, v3, v4, v5, v6);
}

- (void)didEngagementEventPosted:withBundles:timestamp:withContext:withTrialExperimentIDs:withOnboardingStatus:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Ignoring engagement, needs clientIdentifier", v1, 2u);
}

- (void)didEngagementEventPosted:withBundles:timestamp:withContext:withTrialExperimentIDs:withOnboardingStatus:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Engagement event '%@' posted", v2, v3, v4, v5, v6);
}

- (void)didEngagementEventPosted:withBundles:timestamp:withContext:withTrialExperimentIDs:withOnboardingStatus:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "Invalid engagement event: %@", v2, v3, v4, v5, v6);
}

- (void)didAppEntryEventPosted:withBundles:timestamp:duringInterval:withInfo:withTrialExperimentIDs:withOnboardingStatus:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "MOAppEntryUpdateEvent event '%lu' posted", v2, v3, v4, v5, v6);
}

- (void)didAppEntryEventPosted:(os_log_t)log withBundles:timestamp:duringInterval:withInfo:withTrialExperimentIDs:withOnboardingStatus:.cold.2(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *uint8_t buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "didAppEntryEventPosted: Ignoring invalid bundle (no id)", buf, 2u);
}

- (void)submitSuggestionEngagementEventAnalytics:(NSObject *)a3 suggestionEngagementType:timestamp:withContext:withTrialExperimentIDs:.cold.1(unsigned __int8 *a1, uint64_t a2, NSObject *a3)
{
  int v4 = *a1;
  uint64_t v5 = +[NSNumber numberWithUnsignedInteger:a2];
  v6[0] = 67109378;
  v6[1] = v4;
  __int16 v7 = 2112;
  id v8 = v5;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "Suggestion engagement signal analytics was suppressed: isInternalBuild=%d, suggestionEngagementType=%@", (uint8_t *)v6, 0x12u);
}

- (void)submitAppEntryEngagementEventAnalytics:appEntryEngagementType:timestamp:withInfo:withTrialExperimentIDs:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "App entry engagement signal analytics submitted: %{private}@", v2, v3, v4, v5, v6);
}

- (void)updateBundle:(void *)a1 forSuggestionEvent:withSummary:.cold.1(void *a1)
{
  [a1 type];
  OUTLINED_FUNCTION_14((void *)&_mh_execute_header, v1, v2, "Ignoring suggestion engagement event with type: %d", v3, v4, v5, v6, 0);
}

- (void)updateBundle:forSuggestionEvent:withSummary:.cold.2()
{
  OUTLINED_FUNCTION_6();
  [OUTLINED_FUNCTION_4_3(v1, v2) suggestionID];
  objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [(id)OUTLINED_FUNCTION_3_5() bundleIdentifier];
  OUTLINED_FUNCTION_0_14();
  OUTLINED_FUNCTION_1_9((void *)&_mh_execute_header, v4, v5, "Annotated suggestion sheet engagement signal %@ to bundle %@ (%@)", v6, v7, v8, v9, v10);
}

- (void)updateBundle:(void *)a1 forAppEntryEvent:.cold.1(void *a1)
{
  [a1 type];
  OUTLINED_FUNCTION_14((void *)&_mh_execute_header, v1, v2, "Ignoring app entry engagement event with type: %d", v3, v4, v5, v6, 0);
}

- (void)updateBundle:forAppEntryEvent:.cold.2()
{
  OUTLINED_FUNCTION_6();
  [OUTLINED_FUNCTION_4_3(v1, v2) suggestionID];
  objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [(id)OUTLINED_FUNCTION_3_5() bundleIdentifier];
  OUTLINED_FUNCTION_0_14();
  OUTLINED_FUNCTION_1_9((void *)&_mh_execute_header, v4, v5, "Annotated app entry engagement signal %@ to bundle %@ (%@)", v6, v7, v8, v9, v10);
}

void __119__MOEngagementHistoryManager_getInterfaceTypeCountForSuggestionEngagmentEvent_from_to_onceForEachBundle_skipForEvents___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_9_0(__stack_chk_guard);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "Couldn't sink suggestionIDs for suggestion sheet events %@'", v2, v3, v4, v5, v6);
}

void __119__MOEngagementHistoryManager_getInterfaceTypeCountForSuggestionEngagmentEvent_from_to_onceForEachBundle_skipForEvents___block_invoke_4_cold_1()
{
  OUTLINED_FUNCTION_9_0(__stack_chk_guard);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "Couldn't count engagement by inteface type for '%@'", v2, v3, v4, v5, v6);
}

void __119__MOEngagementHistoryManager_getEvergreenTypeCountForSuggestionEngagmentEvent_from_to_onceForEachBundle_skipForEvents___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_9_0(__stack_chk_guard);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "Couldn't count engagement for inteface type for '%@'", v2, v3, v4, v5, v6);
}

void __119__MOEngagementHistoryManager_getEvergreenTypeCountForSuggestionEngagmentEvent_from_to_onceForEachBundle_skipForEvents___block_invoke_4_cold_1()
{
  OUTLINED_FUNCTION_9_0(__stack_chk_guard);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "Couldn't count engagement by evergreen type for '%@'", v2, v3, v4, v5, v6);
}

void __177__MOEngagementHistoryManager_getInterfaceTypeCountForAppEntryEvent_withMinAddedCharacterCount_andMaxAddedCharacterCount_fromStartDate_toEndDate_onceForEachBundle_skipForEvents___block_invoke_4_cold_1()
{
  OUTLINED_FUNCTION_10();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Couldn't count inteface type for app entry event '%@' with skipEvent setting %@", v1, 0x16u);
}

void __177__MOEngagementHistoryManager_getEvergreenTypeCountForAppEntryEvent_withMinAddedCharacterCount_andMaxAddedCharacterCount_fromStartDate_toEndDate_onceForEachBundle_skipForEvents___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_9_0(__stack_chk_guard);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "Couldn't count evergreen type for app entry engagement type '%@'", v2, v3, v4, v5, v6);
}

void __177__MOEngagementHistoryManager_getEvergreenTypeCountForAppEntryEvent_withMinAddedCharacterCount_andMaxAddedCharacterCount_fromStartDate_toEndDate_onceForEachBundle_skipForEvents___block_invoke_4_cold_1()
{
  OUTLINED_FUNCTION_10();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Couldn't count evergreen type for app entry event '%@' with skipEvent setting %@", v1, 0x16u);
}

- (void)eventBundleStore:(uint64_t)a1 needsEngagementInfoForBundles:(uint64_t)a2 .cold.1(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [[OUTLINED_FUNCTION_2_1(a1, a2) bundleIdentifier];
  *uint64_t v3 = 138412290;
  void *v2 = v4;
  OUTLINED_FUNCTION_1_7((void *)&_mh_execute_header, v5, v6, "No suggestionID for bundleIdentifier '%@'");
}

- (void)eventBundleStore:(uint64_t)a1 needsEngagementInfoForBundles:(uint64_t)a2 .cold.2(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [[OUTLINED_FUNCTION_2_1(a1, a2) bundleIdentifier];
  *uint64_t v3 = 138412290;
  void *v2 = v4;
  OUTLINED_FUNCTION_1_7((void *)&_mh_execute_header, v5, v6, "Invalid suggestionID for bundleIdentifier '%@'");
}

void __77__MOEngagementHistoryManager_eventBundleStore_needsEngagementInfoForBundles___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "Failed Biome stream publisher completion, can't update suggestion engagements to bundle store", v2, v3, v4, v5, v6);
}

void __77__MOEngagementHistoryManager_eventBundleStore_needsEngagementInfoForBundles___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "Failed Biome stream publisher completion, can't update app entry engagements to bundle store", v2, v3, v4, v5, v6);
}

void __95__MOEngagementHistoryManager_fetchSuggestionEngagementEventsFromStartDate_toEndDate_withError___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "[fetchSuggestionEngagementEventsFromStartDate:toEndDate:withErrror] Biome sink completion result with error:%@", v2, v3, v4, v5, v6);
}

void __93__MOEngagementHistoryManager_fetchAppEntryEngagementEventsFromStartDate_toEndDate_withError___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "[fetchAppEntryEngagementEventsFromStartDate:toEndDate:withError] Biome sink completion result with error:%@", v2, v3, v4, v5, v6);
}

void __105__MOEngagementHistoryManager_fetchSuggestionEngagementEventsWithTypes_fromStartDate_toEndDate_withError___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "[fetchAllSuggestionEngagementEventsForType] Biome sink completion result with error:%@", v2, v3, v4, v5, v6);
}

void __103__MOEngagementHistoryManager_fetchAppEntryEngagementEventsWithTypes_fromStartDate_toEndDate_withError___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "[fetchAllAppEntryEngagementEventsForType] Biome sink completion result with error:%@", v2, v3, v4, v5, v6);
}

@end
@interface PRSAnonymousPipelineManager
+ (BOOL)_dataCollectionAllowedForBundle:(id)a3;
+ (id)allowedBundles;
+ (id)candidateLogsBasePath;
+ (id)candidateLogsURLForBundle:(id)a3;
+ (id)dateFormatter;
+ (id)dateFromFileURL:(id)a3;
+ (id)engagementCountForDateKeyForBundle:(id)a3;
+ (id)engagementCountKeyForBundle:(id)a3;
+ (id)engagementDateKeyForBundle:(id)a3;
+ (id)logURLForCurrentTimeAndBundle:(id)a3 forEngagement:(BOOL)a4;
+ (id)relativePositionKey;
+ (id)sharedManager;
+ (id)submittedLogsURL;
+ (id)submittedLogsURLForUser:(id)a3;
+ (id)submitttedSpotlightReportsError:(id *)a3;
- (BOOL)_shouldDataCollectForEngagementReservoirSamplingForClientBundle:(id)a3;
- (BOOL)_shouldDataCollectWithEngagedBundle:(id)a3 withQueryId:(id)a4 forClientBundle:(id)a5;
- (BOOL)dateIsExpired:(id)a3;
- (BOOL)isInternalDevice;
- (BOOL)submissionEnabled;
- (NSArray)lastTopHitQueryItems;
- (NSString)lastTopHitQueryString;
- (NSUserDefaults)userDefaults;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)topHitDataCollectionTimer;
- (PRSAnonymousPipelineManager)init;
- (SPCustomFeedbackSender)delegate;
- (id)_abandonedItemsFromItems:(id)a3 withIndexOfEngagedItem:(unint64_t)a4;
- (id)_relativePositionForItem:(id)a3 inItems:(id)a4 withIndexOfEngagedItem:(int64_t)a5 forClientBundle:(id)a6;
- (id)retrieveFeedbackURLToSendInDirectory:(id)a3;
- (void)_addQueryInfoToJSONWriter:(json_writer *)a3 withQuery:(id)a4 cepData:(id)a5 forClient:(id)a6 debugInfoAllowed:(BOOL)a7 keyboardPrimaryLanguage:(id)a8;
- (void)_addRelativePositionToFeatureDict:(id)a3 relativePosition:(id)a4 forItem:(id)a5 debugInfoEnabled:(BOOL)a6;
- (void)_extractTrainingSamplesForQuery:(id)a3 withIndexOfEngagedItem:(unint64_t)a4 withItems:(id)a5 withRanker:(id)a6 withCEPData:(id)a7 forClientBundle:(id)a8 debugInfoEnabled:(BOOL)a9 keyboardPrimaryLanguage:(id)a10;
- (void)_increaseUserDefaultsEngagementCountForBundle:(id)a3;
- (void)_increaseUserDefaultsEngagementCountForDateWithClientBundle:(id)a3;
- (void)_updateUserDefaultsWithEngagedBundle:(id)a3 andQueryID:(id)a4 forClientBundle:(id)a5;
- (void)_writeResult:(json_writer *)a3 item:(id)a4;
- (void)cleanUp;
- (void)deleteCandidateLogs;
- (void)deleteExpiredSubmittedLogs;
- (void)extractTrainingDataWithItemAtIndex:(unint64_t)a3 withItems:(id)a4 withRanker:(id)a5 forQuery:(id)a6 dataCollectAllowed:(BOOL)a7 forClientBundle:(id)a8 keyboardPrimaryLanguage:(id)a9 clientID:(id)a10;
- (void)extractTrainingDataWithItemAtIndex:(unint64_t)a3 withItems:(id)a4 withRanker:(id)a5 forQuery:(id)a6 dataCollectAllowed:(BOOL)a7 queryID:(id)a8 withCEPData:(id)a9 forClientBundle:(id)a10 debugInfoEnabled:(BOOL)a11 keyboardPrimaryLanguage:(id)a12 clientID:(id)a13;
- (void)queryWillFinishWithItems:(id)a3 forClient:(id)a4 forQuery:(id)a5 anonymousDataCollectionAllowed:(BOOL)a6;
- (void)registerXPCActivity;
- (void)sendMLFeedbackActivity:(id)a3 clientID:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setIsInternalDevice:(BOOL)a3;
- (void)setLastTopHitQueryItems:(id)a3;
- (void)setLastTopHitQueryString:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSubmissionEnabled:(BOOL)a3;
- (void)setTopHitDataCollectionTimer:(id)a3;
- (void)setUserDefaults:(id)a3;
- (void)userEngagedItemWithIdentifier:(id)a3 forBundle:(id)a4 forQuery:(id)a5;
@end

@implementation PRSAnonymousPipelineManager

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_13);
  }
  v2 = (void *)sharedAnonManager;
  return v2;
}

void __44__PRSAnonymousPipelineManager_sharedManager__block_invoke()
{
  v8[65] = *MEMORY[0x1E4F143B8];
  v0 = (void *)sNSNotFound;
  sNSNotFound = (uint64_t)&unk_1F18610B8;

  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedAnonManager;
  sharedAnonManager = v1;

  v8[0] = @"kMDItemSpecialCondition1";
  v8[1] = @"kMDItemSpecialCondition2";
  v8[2] = @"kMDItemSpecialCondition3";
  v8[3] = @"kMDItemSpecialCondition4";
  v8[4] = @"kMDItemSpecialCondition5";
  v8[5] = @"ItemIsFlagged";
  v8[6] = @"PortraitImportantPeople";
  v8[7] = @"PhoneFavoritesInReceivers";
  v8[8] = @"PhoneFavoritesInSender";
  v8[9] = @"VIPInEmails";
  v8[10] = @"receiver_is_vip2";
  v8[11] = @"sender_is_vip2";
  v8[12] = @"kMDItemNamedLocationExactWord";
  v8[13] = @"kMDItemNamedLocationExactPrefix";
  v8[14] = @"kMDItemNamedLocationExact";
  v8[15] = @"kMDItemArtistPrefixTokenized";
  v8[16] = @"kMDItemArtistPrefixWord";
  v8[17] = @"kMDItemArtistExactWord";
  v8[18] = @"kMDItemArtistExactPrefix";
  v8[19] = @"kMDItemAuthorsPrefixTokenized";
  v8[20] = @"kMDItemRecipientsPrefixTokenized";
  v8[21] = @"kMDItemAuthorsPrefixWord";
  v8[22] = @"kMDItemRecipientsPrefixWord";
  v8[23] = @"kMDItemAuthorsExactPrefix";
  v8[24] = @"kMDItemRecipientsExactPrefix";
  v8[25] = @"kMDItemAuthorsExact";
  v8[26] = @"kMDItemRecipientsExact";
  v8[27] = @"kMDItemDisplayNamePrefixWord";
  v8[28] = @"kMDItemSubjectPrefixWord";
  v8[29] = @"kMDItemTitlePrefixWord";
  v8[30] = @"kMDItemRankingTagMatch";
  v8[31] = @"kMDItemUserIsSender";
  v8[32] = @"kMDItemContentCreationRecent";
  v8[33] = @"kMDItemEscapedWord";
  v8[34] = @"kMDItemCreationDateThisYear";
  v8[35] = @"kMDItemLastUsedDateThisYear";
  v8[36] = @"kMDItemContentCreationThisMonth";
  v8[37] = @"kMDItemLastUsedDateThisMonth";
  v8[38] = @"kMDItemContentCreationThisWeek";
  v8[39] = @"kMDItemLastUsedDateThisWeek";
  v8[40] = @"kMDItemEventTodayToNextYear";
  v8[41] = @"kMDItemEventLastMonthToToday";
  v8[42] = @"kMDItemEventTodayToNextMonth";
  v8[43] = @"kMDItemEventTodayToNextWeek";
  v8[44] = @"kMDItemEventTodayToLastWeek";
  v8[45] = @"kMDItemEventYesterdayToToday";
  v8[46] = @"kMDItemEventToday";
  v8[47] = @"kMDItemTextContentTokenizedMatch";
  v8[48] = @"kMDItemTextContentMatch";
  v8[49] = @"kMDItemAuthorsOrRecipientsTokenizedPrefixMatch";
  v8[50] = @"kMDItemDescriptionTokenizedPrefixMatch";
  v8[51] = @"kMDItemAlbumTokenizedPrefixMatch";
  v8[52] = @"kMDItemAuthorsOrRecipientsNonTokenizedPrefixMatch";
  v8[53] = @"kMDItemDescriptionPrefixWordMatch";
  v8[54] = @"kMDItemComposerPrefixWordMatch";
  v8[55] = @"kMDItemAlbumPrefixWordMatch";
  v8[56] = @"kMDItemComposerNonTokenizedPrefixMatch";
  v8[57] = @"kMDItemComposerNonTokenizedWordMatch";
  v8[58] = @"kMDItemAppSBLaunchedDateLastWeek";
  v8[59] = @"kMDItemAuthorsOrRecipientsPrefixWordMatch";
  v8[60] = @"kMDItemDescriptionExactPrefixMatch";
  v8[61] = @"kMDItemAlbumNonTokenizedPrefixMatch";
  v8[62] = @"kMDItemAuthorsOrRecipientsExactMatch";
  v8[63] = @"kMDItemDescriptionNonTokenizedWordMatch";
  v8[64] = @"kMDItemAlbumNonTokenizedWordMatch";
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:65];
  v4 = (void *)sScoreMappingLSB;
  sScoreMappingLSB = v3;

  v7[0] = @"kMDItemUserActivity";
  v7[1] = @"kMDItemAlternateNameNonTokenizedWordMatch";
  v7[2] = @"kMDItemAlternateNamePrefixWordMatch";
  v7[3] = @"kMDItemAlternateNameExactMatch";
  v7[4] = @"kMDItemShortcutRecent";
  v7[5] = @"kMDItemDueDateInLastOneToNextTwentyFourHours";
  v7[6] = @"kMDItemDueDateInLastOneToNextOneHour";
  v7[7] = @"kMDItemDisplayNameCorrections";
  v7[8] = @"kMDItemDisplayNameOrSubjectOrTitleTokenizedPrefixMatch";
  v7[9] = @"kMDItemContentCreationDateToday";
  v7[10] = @"kMDItemBoostedVIPFavorites";
  v7[11] = @"kMDItemBoostedVIPFavoritesRecent";
  v7[12] = @"kMDItemLastSpaceAndTotalMatchAndDisplayNameOrSubjectOrTitleWordMatch";
  v7[13] = @"kMDItemDisplayNameOrSubjectOrTitleNonTokenizedWordMatch";
  v7[14] = @"kMDItemDisplayNameOrSubjectOrTitleNonTokenizedPrefixMatch";
  v7[15] = @"kMDItemDisplayNameOrSubjectOrTitleExactMatch";
  v7[16] = @"PRSRankingRecency365Days";
  v7[17] = @"PRSRankingRecency270Days";
  v7[18] = @"PRSRankingRecency180Days";
  v7[19] = @"PRSRankingRecency90Days";
  v7[20] = @"PRSRankingRecency30Days";
  v7[21] = @"PRSRankingRecency15Days";
  v7[22] = @"PRSRankingRecency7Days";
  v7[23] = @"PRSRankingRecency1Days";
  v7[24] = @"kMDItemPolicyPrefixMatch_0_3";
  v7[25] = @"kMDItemPolicyPrefixMatch_1_3";
  v7[26] = @"kMDItemPolicyPrefixMatch_2_3";
  v7[27] = @"kMDItemPolicyExactWordMatch_0_3";
  v7[28] = @"kMDItemPolicyExactWordMatch_1_3";
  v7[29] = @"kMDItemPolicyExactWordMatch_2_3";
  v7[30] = @"PRSRankingMostlyExactMultiFieldsDomainTCMatch";
  v7[31] = @"PRSRankingTCNearMatch";
  v7[32] = @"PRSRankingOneTwoTermsMultiPhraseTCNearMatch";
  v7[33] = @"PRSRankingTCOrderedMatch";
  v7[34] = @"PRSRankingOneTwoTermsMultiPhraseTCOrderedMatch";
  v7[35] = @"PRSRankingTCOrderedPhraseMatch";
  v7[36] = @"PRSRankingOneTwoTermsMultiPhraseTCOrderedPhraseMatch";
  v7[37] = @"PRSRankingMostlyExactMultiFieldsTCMatch";
  v7[38] = @"PRSRankingMostlyExactMultiFieldsTCNearMatch";
  v7[39] = @"PRSRankingTCMostlyExactOrderedPhraseMatch";
  v7[40] = @"PRSRankingOneTermMultiPhraseTCMostlyExactOrderedPhraseMatch";
  v7[41] = @"PRSRankingTwoTermsMultiPhraseTCMostlyExactOrderedPhraseMatch";
  v7[42] = @"PRSRankingExactMultiFieldsTCNearMatch";
  v7[43] = @"PRSRankingTCExactNearMatch";
  v7[44] = @"PRSRankingOneTermMultiPhraseTCExactNearMatch";
  v7[45] = @"PRSRankingTwoTermsMultiPhraseTCExactNearMatch";
  v7[46] = @"PRSRankingTCExactOrderedMatch";
  v7[47] = @"PRSRankingOneTermMultiPhraseTCExactOrderedMatch";
  v7[48] = @"PRSRankingTwoTermsMultiPhraseTCExactOrderedMatch";
  v7[49] = @"PRSRankingTCExactOrderedPhraseMatch";
  v7[50] = @"PRSRankingOneTermMultiPhraseTCExactOrderedPhraseMatch";
  v7[51] = @"PRSRankingTwoTermsMultiPhraseTCExactOrderedPhraseMatch";
  v7[52] = @"PRSPolicyFieldsPrefixMatch";
  v7[53] = @"PRSPolicyFieldsPhraseMatchBit";
  v7[54] = @"PRSPolicyFieldsMostlyExactPhraseMatchBit";
  v7[55] = @"exact_policy_flag_bit";
  v7[56] = @"PRSPolicyFieldsExactPhraseMatchBit";
  v7[57] = @"kMDItemShortcutWithinBagParamValue";
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:58];
  v6 = (void *)sScoreMappingMSB;
  sScoreMappingMSB = v5;
}

+ (id)relativePositionKey
{
  return @"rel_pos";
}

+ (id)logURLForCurrentTimeAndBundle:(id)a3 forEngagement:(BOOL)a4
{
  v4 = (__CFString *)a3;
  uint64_t v5 = +[PRSAnonymousPipelineManager candidateLogsURLForBundle:v4];
  uint64_t v6 = [(__CFString *)v4 length];
  v7 = @"searchd";
  if (v6) {
    v7 = v4;
  }
  v8 = NSString;
  v9 = v7;
  v10 = +[PRSAnonymousPipelineManager dateFormatter];
  v11 = [MEMORY[0x1E4F1C9C8] date];
  v12 = [v10 stringFromDate:v11];
  v13 = [v8 stringWithFormat:@"%@-%@", v9, v12];

  v14 = [v5 URLByAppendingPathComponent:v13];
  v15 = [v14 URLByAppendingPathExtension:@"json"];

  return v15;
}

+ (id)submittedLogsURLForUser:(id)a3
{
  uint64_t v3 = NSHomeDirectoryForUser((NSString *)a3);
  v4 = [v3 stringByAppendingString:@"/Library/Spotlight/Diagnostics/SubmittedReports"];

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__PRSAnonymousPipelineManager_submittedLogsURLForUser___block_invoke;
  block[3] = &unk_1E634C270;
  id v10 = v4;
  uint64_t v5 = submittedLogsURLForUser__onceToken;
  id v6 = v4;
  if (v5 != -1) {
    dispatch_once(&submittedLogsURLForUser__onceToken, block);
  }
  v7 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v6 isDirectory:1 relativeToURL:0];

  return v7;
}

void __55__PRSAnonymousPipelineManager_submittedLogsURLForUser___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  if (([v2 fileExistsAtPath:*(void *)(a1 + 32)] & 1) == 0) {
    [v2 createDirectoryAtPath:*(void *)(a1 + 32) withIntermediateDirectories:1 attributes:0 error:0];
  }
}

+ (id)submittedLogsURL
{
  id v2 = NSUserName();
  uint64_t v3 = +[PRSAnonymousPipelineManager submittedLogsURLForUser:v2];

  return v3;
}

+ (id)candidateLogsBasePath
{
  id v2 = NSHomeDirectory();
  uint64_t v3 = [v2 stringByAppendingString:@"/Library/Spotlight/Diagnostics/CandidateReports"];

  return v3;
}

+ (id)candidateLogsURLForBundle:(id)a3
{
  uint64_t v3 = (__CFString *)a3;
  v4 = +[PRSAnonymousPipelineManager candidateLogsBasePath];
  if ([(__CFString *)v3 length]) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = @"com.apple.searchd";
  }
  id v6 = [v4 stringByAppendingPathComponent:v5];
  v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  if (([v7 fileExistsAtPath:v6] & 1) == 0) {
    [v7 createDirectoryAtPath:v6 withIntermediateDirectories:1 attributes:0 error:0];
  }
  v8 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v6 isDirectory:1 relativeToURL:0];

  return v8;
}

+ (id)dateFormatter
{
  id v2 = objc_opt_new();
  [v2 setDateFormat:@"yyyy-MM-dd"];
  uint64_t v3 = [MEMORY[0x1E4F1CAF0] timeZoneWithAbbreviation:@"GMT"];
  [v2 setTimeZone:v3];

  return v2;
}

+ (id)dateFromFileURL:(id)a3
{
  uint64_t v3 = [a3 lastPathComponent];
  v4 = [v3 stringByDeletingPathExtension];

  [v4 rangeOfString:@"com.apple.searchd.suggestions"];
  if (v5 || ([v4 rangeOfString:@"com.apple.searchd"], v5))
  {
    uint64_t v6 = v5 + 1;
    if (v5 + 1 < (unint64_t)[v4 length])
    {
      uint64_t v7 = [v4 substringFromIndex:v6];

      if (v7)
      {
LABEL_9:
        id v10 = +[PRSAnonymousPipelineManager dateFormatter];
        v11 = [v10 dateFromString:v7];
        v4 = (void *)v7;

        goto LABEL_12;
      }
      v4 = 0;
    }
  }
  [v4 rangeOfString:@"com.apple.mobilemail"];
  if (v8)
  {
    uint64_t v9 = v8 + 1;
    if (v8 + 1 < (unint64_t)[v4 length])
    {
      uint64_t v7 = [v4 substringFromIndex:v9];

      if (v7) {
        goto LABEL_9;
      }
      v4 = 0;
    }
  }
  v11 = 0;
LABEL_12:

  return v11;
}

+ (id)allowedBundles
{
  v4[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"com.apple.mobilemail";
  v4[1] = @"com.apple.searchd";
  v4[2] = @"com.apple.searchd.suggestions";
  id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:3];
  return v2;
}

+ (BOOL)_dataCollectionAllowedForBundle:(id)a3
{
  id v3 = a3;
  v4 = +[PRSAnonymousPipelineManager allowedBundles];
  char v5 = [v4 containsObject:v3];

  return v5;
}

+ (id)engagementCountKeyForBundle:(id)a3
{
  return (id)[NSString stringWithFormat:@"engagementCount-%@", a3];
}

+ (id)engagementDateKeyForBundle:(id)a3
{
  return (id)[NSString stringWithFormat:@"engagementDate-%@", a3];
}

+ (id)engagementCountForDateKeyForBundle:(id)a3
{
  return (id)[NSString stringWithFormat:@"engagementCountForDate-%@", a3];
}

- (PRSAnonymousPipelineManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)PRSAnonymousPipelineManager;
  id v2 = [(PRSAnonymousPipelineManager *)&v7 init];
  if (v2)
  {
    [(PRSAnonymousPipelineManager *)v2 setSubmissionEnabled:DiagnosticLogSubmissionEnabled()];
    id v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.searchd"];
    [(PRSAnonymousPipelineManager *)v2 setUserDefaults:v3];

    [(PRSAnonymousPipelineManager *)v2 setIsInternalDevice:os_variant_has_internal_diagnostics()];
    v4 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.spotlight.dataCollection", v4);
    [(PRSAnonymousPipelineManager *)v2 setQueue:v5];

    [(PRSAnonymousPipelineManager *)v2 registerXPCActivity];
  }
  return v2;
}

- (void)sendMLFeedbackActivity:(id)a3 clientID:(id)a4
{
  uint64_t v6 = a3;
  id v7 = a4;
  if ([(PRSAnonymousPipelineManager *)self submissionEnabled])
  {
    if (v6) {
      dispatch_group_enter(v6);
    }
    uint64_t v8 = [(PRSAnonymousPipelineManager *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __63__PRSAnonymousPipelineManager_sendMLFeedbackActivity_clientID___block_invoke;
    block[3] = &unk_1E634C298;
    void block[4] = self;
    id v10 = v7;
    v11 = v6;
    dispatch_async(v8, block);
  }
}

void __63__PRSAnonymousPipelineManager_sendMLFeedbackActivity_clientID___block_invoke(uint64_t a1)
{
  v46[1] = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v3 = (void *)MEMORY[0x1E4F1CB10];
  v4 = +[PRSAnonymousPipelineManager candidateLogsBasePath];
  dispatch_queue_t v5 = [v3 fileURLWithPath:v4];
  v46[0] = *MEMORY[0x1E4F1D738];
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:1];
  id v42 = 0;
  v32 = v2;
  id v7 = [v2 contentsOfDirectoryAtURL:v5 includingPropertiesForKeys:v6 options:0 error:&v42];
  id v8 = v42;

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v38 objects:v45 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v39;
    unint64_t v13 = 0x1E4F1C000uLL;
    id v34 = v9;
    uint64_t v35 = a1;
    uint64_t v33 = *(void *)v39;
    do
    {
      uint64_t v14 = 0;
      v15 = v8;
      uint64_t v36 = v11;
      do
      {
        if (*(void *)v39 != v12) {
          objc_enumerationMutation(v9);
        }
        v16 = [*(id *)(a1 + 32) retrieveFeedbackURLToSendInDirectory:*(void *)(*((void *)&v38 + 1) + 8 * v14)];
        if (v16)
        {
          id v17 = objc_alloc(*(Class *)(v13 + 2488));
          id v37 = v15;
          v18 = (void *)[v17 initWithContentsOfURL:v16 options:8 error:&v37];
          id v8 = v37;

          if (v8)
          {
            v19 = PRSLogCategoryAnonymousPipeline();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v44 = (uint64_t)v8;
              _os_log_error_impl(&dword_1BDB2A000, v19, OS_LOG_TYPE_ERROR, "Error reading file for submission %@", buf, 0xCu);
            }
          }
          else
          {
            v19 = [objc_alloc(MEMORY[0x1E4F9A028]) initWithType:3 data:v18];
            v20 = [*(id *)(a1 + 32) delegate];
            [v20 sendCustomFeedback:v19 clientID:*(void *)(a1 + 40)];

            v21 = PRSLogCategoryAnonymousPipeline();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v22 = [v18 length];
              *(_DWORD *)buf = 134217984;
              uint64_t v44 = v22;
              _os_log_impl(&dword_1BDB2A000, v21, OS_LOG_TYPE_DEFAULT, "Sending custom feedback len %lu", buf, 0xCu);
            }

            v23 = [v16 lastPathComponent];
            id v24 = [v16 path];
            v25 = (const std::__fs::filesystem::path *)[v24 UTF8String];

            v26 = +[PRSAnonymousPipelineManager submittedLogsURL];
            v27 = [v26 URLByAppendingPathComponent:v23];
            id v28 = [v27 path];
            v29 = (const std::__fs::filesystem::path *)[v28 UTF8String];

            if (v25 && v29) {
              rename(v25, v29, v30);
            }

            id v9 = v34;
            a1 = v35;
            uint64_t v11 = v36;
            id v8 = 0;
            uint64_t v12 = v33;
            unint64_t v13 = 0x1E4F1C000;
          }

          v15 = v8;
        }
        else
        {
          id v8 = v15;
        }

        ++v14;
      }
      while (v11 != v14);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v38 objects:v45 count:16];
    }
    while (v11);
  }

  [*(id *)(a1 + 32) cleanUp];
  v31 = *(NSObject **)(a1 + 48);
  if (v31) {
    dispatch_group_leave(v31);
  }
}

- (void)registerXPCActivity
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id location = 0;
  objc_initWeak(&location, self);
  id v2 = PRSLogCategoryAnonymousPipeline();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v7 = "com.apple.searchd.sendmlfeedback";
    _os_log_impl(&dword_1BDB2A000, v2, OS_LOG_TYPE_DEFAULT, "Registering XPC activity:%s", buf, 0xCu);
  }

  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __50__PRSAnonymousPipelineManager_registerXPCActivity__block_invoke;
  v3[3] = &unk_1E634C8E8;
  objc_copyWeak(&v4, &location);
  xpc_activity_register("com.apple.searchd.sendmlfeedback", (xpc_object_t)*MEMORY[0x1E4F14158], v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __50__PRSAnonymousPipelineManager_registerXPCActivity__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1C1885190]();
  xpc_activity_state_t state = xpc_activity_get_state(v3);
  if (state == 2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained)
    {
      id v7 = PRSLogCategoryAnonymousPipeline();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v14 = "com.apple.searchd.sendmlfeedback";
        _os_log_impl(&dword_1BDB2A000, v7, OS_LOG_TYPE_INFO, "Performing XPC activity:%s", buf, 0xCu);
      }

      xpc_activity_set_state(v3, 4);
      uint64_t v8 = dispatch_group_create();
      [WeakRetained sendMLFeedbackActivity:v8 clientID:0];
      id v9 = dispatch_get_global_queue(9, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __50__PRSAnonymousPipelineManager_registerXPCActivity__block_invoke_187;
      block[3] = &unk_1E634C270;
      uint64_t v12 = v3;
      dispatch_group_notify(v8, v9, block);
    }
    else
    {
      xpc_activity_set_state(v3, 5);
    }
LABEL_12:

    goto LABEL_13;
  }
  xpc_activity_state_t v10 = state;
  if (xpc_activity_should_defer(v3) && xpc_activity_should_defer(v3) && xpc_activity_set_state(v3, 3))
  {
    WeakRetained = PRSLogCategoryAnonymousPipeline();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v14 = "com.apple.searchd.sendmlfeedback";
      __int16 v15 = 2048;
      xpc_activity_state_t v16 = v10;
      _os_log_impl(&dword_1BDB2A000, WeakRetained, OS_LOG_TYPE_INFO, "Deferring XPC activity:%s, state:%ld", buf, 0x16u);
    }
    goto LABEL_12;
  }
LABEL_13:
}

void __50__PRSAnonymousPipelineManager_registerXPCActivity__block_invoke_187(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  xpc_activity_set_state(*(xpc_activity_t *)(a1 + 32), 5);
  uint64_t v1 = PRSLogCategoryAnonymousPipeline();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
  {
    int v2 = 136315138;
    id v3 = "com.apple.searchd.sendmlfeedback";
    _os_log_impl(&dword_1BDB2A000, v1, OS_LOG_TYPE_INFO, "Marked XPC activity:%s as done", (uint8_t *)&v2, 0xCu);
  }
}

- (id)_abandonedItemsFromItems:(id)a3 withIndexOfEngagedItem:(unint64_t)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = objc_opt_new();
  if (a4)
  {
    unint64_t v7 = a4 - 48;
    if (a4 > 0x30)
    {
      if (a4 == 49) {
        goto LABEL_28;
      }
      v25 = [v5 objectAtIndexedSubscript:0];
      [v6 addObject:v25];

      uint64_t v8 = v5;
      uint64_t v9 = v7;
      unint64_t v10 = 48;
    }
    else
    {
      uint64_t v8 = v5;
      uint64_t v9 = 0;
      unint64_t v10 = a4;
    }
LABEL_24:
    v26 = objc_msgSend(v8, "subarrayWithRange:", v9, v10);
    [v6 addObjectsFromArray:v26];

    goto LABEL_28;
  }
  if ((unint64_t)[v5 count] < 0x33)
  {
    if ((unint64_t)[v5 count] < 2) {
      goto LABEL_28;
    }
    unint64_t v10 = [v5 count] - 1;
    uint64_t v8 = v5;
    uint64_t v9 = 1;
    goto LABEL_24;
  }
  uint64_t v11 = [v5 objectAtIndexedSubscript:0];
  uint64_t v12 = [v11 dataCollectionBundle];

  unint64_t v13 = objc_opt_new();
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v32 = v5;
  id v14 = v5;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (!v15) {
    goto LABEL_18;
  }
  uint64_t v16 = v15;
  uint64_t v17 = *(void *)v34;
  do
  {
    for (uint64_t i = 0; i != v16; ++i)
    {
      if (*(void *)v34 != v17) {
        objc_enumerationMutation(v14);
      }
      v19 = *(void **)(*((void *)&v33 + 1) + 8 * i);
      v20 = [v19 dataCollectionBundle];
      if (![v20 isEqualToString:v12])
      {

LABEL_14:
        unint64_t v23 = [v6 count];
        uint64_t v22 = v6;
        if (v23 > 0x31) {
          continue;
        }
        goto LABEL_15;
      }
      unint64_t v21 = [v13 count];

      uint64_t v22 = v13;
      if (v21 >= 0x32) {
        goto LABEL_14;
      }
LABEL_15:
      [v22 addObject:v19];
    }
    uint64_t v16 = [v14 countByEnumeratingWithState:&v33 objects:v37 count:16];
  }
  while (v16);
LABEL_18:

  uint64_t v24 = [v6 count];
  if ((unint64_t)([v13 count] + v24) > 0x32)
  {
    uint64_t v27 = 50 - [v13 count];
    unint64_t v28 = [v6 count] - v27;
    v29 = objc_msgSend(v13, "subarrayWithRange:", 0, v28);
    objc_msgSend(v6, "replaceObjectsInRange:withObjectsFromArray:", v27, v28, v29);

    if ([v13 count] > v28)
    {
      v30 = objc_msgSend(v13, "subarrayWithRange:", v28, objc_msgSend(v13, "count") - v28);
      [v6 addObjectsFromArray:v30];
    }
  }
  else
  {
    [v6 addObjectsFromArray:v13];
  }

  id v5 = v32;
LABEL_28:

  return v6;
}

- (id)_relativePositionForItem:(id)a3 inItems:(id)a4 withIndexOfEngagedItem:(int64_t)a5 forClientBundle:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  uint64_t v11 = [v9 indexOfObject:a3];
  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v12 = (id)sNSNotFound;
  }
  else
  {
    int64_t v13 = v11;
    if ([v10 isEqualToString:@"com.apple.searchd.suggestions"])
    {
      uint64_t v14 = 0;
    }
    else
    {
      if (v13 >= a5) {
        unint64_t v15 = a5;
      }
      else {
        unint64_t v15 = v13;
      }
      if (v13 <= a5) {
        unint64_t v16 = a5;
      }
      else {
        unint64_t v16 = v13;
      }
      if (v15 >= v16)
      {
        uint64_t v17 = 0;
      }
      else
      {
        uint64_t v17 = 0;
        do
        {
          v18 = [v9 objectAtIndex:v15];
          v17 += ((unint64_t)[v18 bundleIDType] >> 19) & 1;

          ++v15;
        }
        while (v16 != v15);
      }
      if (v13 < a5) {
        uint64_t v14 = v17;
      }
      else {
        uint64_t v14 = -v17;
      }
    }
    id v12 = [MEMORY[0x1E4F28ED0] numberWithInteger:v13 - a5 + v14];
  }
  v19 = v12;

  return v19;
}

- (void)_addRelativePositionToFeatureDict:(id)a3 relativePosition:(id)a4 forItem:(id)a5 debugInfoEnabled:(BOOL)a6
{
  BOOL v6 = a6;
  id v13 = a3;
  id v9 = a5;
  id v10 = a4;
  uint64_t v11 = [(id)objc_opt_class() relativePositionKey];
  [v13 setObject:v10 forKeyedSubscript:v11];

  if (v6)
  {
    id v12 = [v9 identifier];
    [v13 setObject:v12 forKeyedSubscript:@"identifier"];
  }
}

- (void)_addQueryInfoToJSONWriter:(json_writer *)a3 withQuery:(id)a4 cepData:(id)a5 forClient:(id)a6 debugInfoAllowed:(BOOL)a7 keyboardPrimaryLanguage:(id)a8
{
  BOOL v8 = a7;
  id v11 = a4;
  id v12 = PRSLogCategoryAnonymousPipeline();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v31 = 0;
    _os_log_impl(&dword_1BDB2A000, v12, OS_LOG_TYPE_DEFAULT, "[Logging] Writing query info to json writer.", v31, 2u);
  }

  if (v8)
  {
    json_writer_add_key((uint64_t)a3, "query", 5uLL, 1);
    json_writer_add_string(a3, (char *)[v11 UTF8String], 0xFFFFFFFFFFFFFFFFLL, 0);
  }
  id v13 = [MEMORY[0x1E4F1CA20] currentLocale];
  if (!v13)
  {
    id v13 = [MEMORY[0x1E4F1CA20] systemLocale];
  }
  uint64_t v14 = [v13 countryCode];
  unint64_t v15 = [v13 languageCode];
  json_writer_add_key((uint64_t)a3, "country_code", 0xCuLL, 1);
  id v16 = v14;
  uint64_t v17 = [v16 UTF8String];
  if (v17) {
    v18 = (char *)v17;
  }
  else {
    v18 = "";
  }
  json_writer_add_string(a3, v18, 0xFFFFFFFFFFFFFFFFLL, 0);
  json_writer_add_key((uint64_t)a3, "language_code", 0xDuLL, 1);
  id v19 = v15;
  uint64_t v20 = [v19 UTF8String];
  if (v20) {
    unint64_t v21 = (char *)v20;
  }
  else {
    unint64_t v21 = "";
  }
  json_writer_add_string(a3, v21, 0xFFFFFFFFFFFFFFFFLL, 0);
  json_writer_add_key((uint64_t)a3, "is_internal", 0xBuLL, 1);
  if ([(PRSAnonymousPipelineManager *)self isInternalDevice]) {
    uint64_t v22 = "1";
  }
  else {
    uint64_t v22 = "0";
  }
  json_writer_add_raw_value((uint64_t)a3, v22, 1uLL);
  unint64_t v23 = (void *)MGCopyAnswer();
  uint64_t v24 = (void *)MGCopyAnswer();
  json_writer_add_key((uint64_t)a3, "device_type", 0xBuLL, 1);
  id v25 = v23;
  uint64_t v26 = [v25 UTF8String];
  if (v26) {
    uint64_t v27 = (char *)v26;
  }
  else {
    uint64_t v27 = "";
  }
  json_writer_add_string(a3, v27, 0xFFFFFFFFFFFFFFFFLL, 0);
  json_writer_add_key((uint64_t)a3, "device_build_number", 0x13uLL, 1);
  id v28 = v24;
  uint64_t v29 = [v28 UTF8String];
  if (v29) {
    v30 = (char *)v29;
  }
  else {
    v30 = "";
  }
  json_writer_add_string(a3, v30, 0xFFFFFFFFFFFFFFFFLL, 0);
}

- (void)_increaseUserDefaultsEngagementCountForBundle:(id)a3
{
  id v4 = a3;
  id v12 = [(PRSAnonymousPipelineManager *)self userDefaults];
  id v5 = +[PRSAnonymousPipelineManager engagementCountKeyForBundle:v4];

  uint64_t v6 = [v12 objectForKey:v5];
  unint64_t v7 = (void *)v6;
  BOOL v8 = &unk_1F18610D0;
  if (v6) {
    BOOL v8 = (void *)v6;
  }
  id v9 = v8;

  uint64_t v10 = [v9 integerValue];
  id v11 = [MEMORY[0x1E4F28ED0] numberWithInteger:v10 + 1];
  [v12 setObject:v11 forKey:v5];
}

- (void)_updateUserDefaultsWithEngagedBundle:(id)a3 andQueryID:(id)a4 forClientBundle:(id)a5
{
  id v9 = a3;
  id v7 = a4;
  if ([a5 isEqualToString:@"com.apple.searchd"])
  {
    BOOL v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.searchd"];
    [v8 setObject:v9 forKey:@"collectedBundleID"];
    if ([v7 integerValue] != -1) {
      [v8 setObject:v7 forKey:@"lastQueryID"];
    }
  }
}

- (void)_increaseUserDefaultsEngagementCountForDateWithClientBundle:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PRSAnonymousPipelineManager *)self userDefaults];
  uint64_t v6 = +[PRSAnonymousPipelineManager engagementCountForDateKeyForBundle:v4];
  id v7 = +[PRSAnonymousPipelineManager engagementDateKeyForBundle:v4];

  BOOL v8 = [v5 objectForKey:v6];
  id v9 = [v5 objectForKey:v7];
  uint64_t v10 = +[PRSAnonymousPipelineManager dateFormatter];
  id v11 = [MEMORY[0x1E4F1C9C8] date];
  id v12 = [v10 stringFromDate:v11];

  if (v9 && [v9 isEqualToString:v12]) {
    uint64_t v13 = [v8 integerValue] + 1;
  }
  else {
    uint64_t v13 = 1;
  }
  [v5 setObject:v12 forKey:v7];
  uint64_t v14 = [MEMORY[0x1E4F28ED0] numberWithInteger:v13];
  [v5 setObject:v14 forKey:v6];

  unint64_t v15 = PRSLogCategoryAnonymousPipeline();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    int v16 = 134218754;
    uint64_t v17 = [v8 integerValue];
    __int16 v18 = 2112;
    id v19 = v9;
    __int16 v20 = 2048;
    uint64_t v21 = v13;
    __int16 v22 = 2112;
    unint64_t v23 = v12;
    _os_log_debug_impl(&dword_1BDB2A000, v15, OS_LOG_TYPE_DEBUG, "[Sampling] Previous count:%lu previous date:%@ new count:%lu new date:%@", (uint8_t *)&v16, 0x2Au);
  }
}

- (BOOL)_shouldDataCollectForEngagementReservoirSamplingForClientBundle:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isEqualToString:@"com.apple.searchd"])
  {
    id v5 = [(PRSAnonymousPipelineManager *)self userDefaults];
    uint64_t v6 = +[PRSAnonymousPipelineManager engagementCountForDateKeyForBundle:v4];
    id v7 = +[PRSAnonymousPipelineManager engagementDateKeyForBundle:v4];
    BOOL v8 = [v5 objectForKey:v6];
    id v9 = [v5 objectForKey:v7];
    if ([v8 integerValue] < 1)
    {
      BOOL v11 = 0;
    }
    else
    {
      uint32_t v10 = arc4random_uniform([v8 integerValue]);
      BOOL v11 = v10 == 0;
      id v12 = PRSLogCategoryAnonymousPipeline();
      BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
      if (v10)
      {
        if (v13)
        {
          int v15 = 134218498;
          uint64_t v16 = [v8 integerValue];
          __int16 v17 = 2048;
          uint64_t v18 = v10;
          __int16 v19 = 2112;
          __int16 v20 = v9;
          _os_log_debug_impl(&dword_1BDB2A000, v12, OS_LOG_TYPE_DEBUG, "[Sampling] Skipping this sample. Engagement count:%lu random num:%lu date:%@", (uint8_t *)&v15, 0x20u);
        }
      }
      else if (v13)
      {
        [(PRSAnonymousPipelineManager *)v8 _shouldDataCollectForEngagementReservoirSamplingForClientBundle:v12];
      }
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)_shouldDataCollectWithEngagedBundle:(id)a3 withQueryId:(id)a4 forClientBundle:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v9 isEqualToString:@"com.apple.searchd"])
  {
    uint32_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.searchd"];
    BOOL v11 = +[PRSAnonymousPipelineManager engagementCountKeyForBundle:v9];
    id v12 = [v10 objectForKey:v11];

    BOOL v13 = [v10 objectForKey:@"lastQueryID"];
    if ([v8 integerValue] == -1
      || (uint64_t v14 = [v13 unsignedLongLongValue], v14 != objc_msgSend(v8, "unsignedLongLongValue")))
    {
      uint64_t v26 = v12;
      uint64_t v16 = [v12 integerValue];
      __int16 v17 = [v10 objectForKey:@"collectedBundleID"];
      uint64_t v18 = +[PRSBagHandler sharedHandler];
      __int16 v19 = [v18 anonymousMetadataUndesiredBundleIDs];
      __int16 v20 = (void *)[v19 copy];

      int v21 = [v20 containsObject:v17];
      int v22 = [v20 containsObject:v7];
      char v23 = v22;
      if (!v21 || !v22) {
        goto LABEL_12;
      }
      if (v16 <= 2) {
        uint64_t v16 = 2;
      }
      if (arc4random() % (unint64_t)v16)
      {
        char v15 = 0;
      }
      else
      {
LABEL_12:
        if (v17) {
          char v24 = v21;
        }
        else {
          char v24 = 1;
        }
        char v15 = v24 | v23 ^ 1;
      }

      id v12 = v26;
    }
    else
    {
      char v15 = 1;
    }
  }
  else
  {
    char v15 = 1;
  }

  return v15;
}

- (void)extractTrainingDataWithItemAtIndex:(unint64_t)a3 withItems:(id)a4 withRanker:(id)a5 forQuery:(id)a6 dataCollectAllowed:(BOOL)a7 queryID:(id)a8 withCEPData:(id)a9 forClientBundle:(id)a10 debugInfoEnabled:(BOOL)a11 keyboardPrimaryLanguage:(id)a12 clientID:(id)a13
{
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  id v23 = a12;
  id v24 = a13;
  id v25 = [(PRSAnonymousPipelineManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __201__PRSAnonymousPipelineManager_extractTrainingDataWithItemAtIndex_withItems_withRanker_forQuery_dataCollectAllowed_queryID_withCEPData_forClientBundle_debugInfoEnabled_keyboardPrimaryLanguage_clientID___block_invoke;
  block[3] = &unk_1E634C910;
  void block[4] = self;
  id v37 = v22;
  BOOL v46 = a7;
  id v38 = v17;
  id v39 = v19;
  id v40 = v18;
  id v41 = v21;
  BOOL v47 = a11;
  id v42 = v23;
  id v43 = v20;
  id v44 = v24;
  unint64_t v45 = a3;
  id v35 = v24;
  id v26 = v20;
  id v27 = v23;
  id v28 = v21;
  id v29 = v18;
  id v30 = v19;
  id v31 = v17;
  id v32 = v22;
  dispatch_async(v25, block);
}

void __201__PRSAnonymousPipelineManager_extractTrainingDataWithItemAtIndex_withItems_withRanker_forQuery_dataCollectAllowed_queryID_withCEPData_forClientBundle_debugInfoEnabled_keyboardPrimaryLanguage_clientID___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _increaseUserDefaultsEngagementCountForBundle:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _increaseUserDefaultsEngagementCountForDateWithClientBundle:*(void *)(a1 + 40)];
  if (*(unsigned char *)(a1 + 112)
    && ([*(id *)(a1 + 40) isEqualToString:@"com.apple.searchd.suggestions"] & 1) == 0)
  {
    unint64_t v2 = *(void *)(a1 + 104);
    if (v2 >= [*(id *)(a1 + 48) count])
    {
      id v5 = PRSLogCategoryAnonymousPipeline();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        __201__PRSAnonymousPipelineManager_extractTrainingDataWithItemAtIndex_withItems_withRanker_forQuery_dataCollectAllowed_queryID_withCEPData_forClientBundle_debugInfoEnabled_keyboardPrimaryLanguage_clientID___block_invoke_cold_1(a1 + 104, v5, v7, v8, v9, v10, v11, v12);
      }
    }
    else
    {
      if (![*(id *)(a1 + 32) _shouldDataCollectForEngagementReservoirSamplingForClientBundle:*(void *)(a1 + 40)])return; {
      id v3 = PRSLogCategoryAnonymousPipeline();
      }
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v4 = [*(id *)(a1 + 48) count];
        *(_DWORD *)buf = 134217984;
        uint64_t v15 = v4;
        _os_log_impl(&dword_1BDB2A000, v3, OS_LOG_TYPE_DEFAULT, "[Logging] Extracting dataCollection for %lu items", buf, 0xCu);
      }

      id v5 = [*(id *)(a1 + 48) objectAtIndexedSubscript:*(void *)(a1 + 104)];
      uint64_t v6 = [v5 dataCollectionBundle];
      LOBYTE(v13) = *(unsigned char *)(a1 + 113);
      [*(id *)(a1 + 32) _extractTrainingSamplesForQuery:*(void *)(a1 + 56) withIndexOfEngagedItem:*(void *)(a1 + 104) withItems:*(void *)(a1 + 48) withRanker:*(void *)(a1 + 64) withCEPData:*(void *)(a1 + 72) forClientBundle:*(void *)(a1 + 40) debugInfoEnabled:v13 keyboardPrimaryLanguage:*(void *)(a1 + 80)];
      [*(id *)(a1 + 32) _updateUserDefaultsWithEngagedBundle:v6 andQueryID:*(void *)(a1 + 88) forClientBundle:*(void *)(a1 + 40)];
      if ([*(id *)(a1 + 32) isInternalDevice]) {
        [*(id *)(a1 + 32) sendMLFeedbackActivity:0 clientID:*(void *)(a1 + 96)];
      }
    }
  }
}

- (void)extractTrainingDataWithItemAtIndex:(unint64_t)a3 withItems:(id)a4 withRanker:(id)a5 forQuery:(id)a6 dataCollectAllowed:(BOOL)a7 forClientBundle:(id)a8 keyboardPrimaryLanguage:(id)a9 clientID:(id)a10
{
  LOBYTE(v10) = 0;
  [(PRSAnonymousPipelineManager *)self extractTrainingDataWithItemAtIndex:a3 withItems:a4 withRanker:a5 forQuery:a6 dataCollectAllowed:a7 queryID:&unk_1F18610E8 withCEPData:0 forClientBundle:a8 debugInfoEnabled:v10 keyboardPrimaryLanguage:a9 clientID:a10];
}

- (void)_writeResult:(json_writer *)a3 item:(id)a4
{
  id object = a4;
  json_writer_add_key((uint64_t)a3, "_identifier", 0xBuLL, 1);
  id v5 = [object identifier];
  json_writer_add_string(a3, (char *)[v5 UTF8String], 0xFFFFFFFFFFFFFFFFLL, 0);

  uint64_t v6 = PRSModelManagerAssociatedObjectKeyForType(1);
  uint64_t v7 = PRSModelManagerAssociatedObjectKeyForType(2);
  uint64_t v8 = PRSModelManagerAssociatedObjectKeyForType(3);
  uint64_t v9 = objc_getAssociatedObject(object, v6);
  uint64_t v10 = objc_getAssociatedObject(object, v7);
  uint64_t v11 = objc_getAssociatedObject(object, v8);
  json_writer_add_key((uint64_t)a3, "_l2_score", 9uLL, 1);
  v66 = v11;
  [v11 doubleValue];
  json_writer_add_double(a3, v12);
  json_writer_add_key((uint64_t)a3, "_l2_inputs", 0xAuLL, 1);
  json_writer_begin_dictionary((uint64_t)a3);
  if ([v10 unsignedIntegerValue])
  {
    unint64_t v13 = 0;
    do
    {
      objc_msgSend(NSString, "stringWithFormat:", @"%li", v13);
      id v14 = objc_claimAutoreleasedReturnValue();
      uint64_t v15 = (char *)[v14 UTF8String];

      size_t v16 = strlen(v15);
      json_writer_add_key((uint64_t)a3, v15, v16, 1);
      id v17 = [v9 objectAtIndexedSubscript:v13];
      [v17 floatValue];
      json_writer_add_double(a3, v18);

      ++v13;
    }
    while (v13 < [v10 unsignedIntegerValue]);
  }
  json_writer_end_dictionary((uint64_t)a3);
  id v19 = PRSModelManagerAssociatedObjectKeyForType(4);
  id v20 = PRSModelManagerAssociatedObjectKeyForType(5);
  id v21 = PRSModelManagerAssociatedObjectKeyForType(6);
  id v22 = objc_getAssociatedObject(object, v19);
  id v23 = objc_getAssociatedObject(object, v20);
  id v24 = objc_getAssociatedObject(object, v21);
  json_writer_add_key((uint64_t)a3, "_l2e_score", 0xAuLL, 1);
  v65 = v24;
  [v24 doubleValue];
  json_writer_add_double(a3, v25);
  json_writer_add_key((uint64_t)a3, "_l2e_inputs", 0xBuLL, 1);
  json_writer_begin_dictionary((uint64_t)a3);
  if ([v23 unsignedIntegerValue])
  {
    unint64_t v26 = 0;
    do
    {
      objc_msgSend(NSString, "stringWithFormat:", @"%li", v26);
      id v27 = objc_claimAutoreleasedReturnValue();
      id v28 = (char *)[v27 UTF8String];

      size_t v29 = strlen(v28);
      json_writer_add_key((uint64_t)a3, v28, v29, 1);
      id v30 = [v22 objectAtIndexedSubscript:v26];
      [v30 floatValue];
      json_writer_add_double(a3, v31);

      ++v26;
    }
    while (v26 < [v23 unsignedIntegerValue]);
  }
  json_writer_end_dictionary((uint64_t)a3);
  id v32 = [object sectionBundleIdentifier];
  if ([v32 isEqualToString:@"com.apple.mobilemail"])
  {
    v62 = v32;
    v63 = v10;
    v64 = v9;
    long long v33 = PRSModelManagerAssociatedObjectKeyForType(7);
    long long v34 = PRSModelManagerAssociatedObjectKeyForType(8);
    id v35 = PRSModelManagerAssociatedObjectKeyForType(9);
    long long v36 = objc_getAssociatedObject(object, v33);
    id v37 = objc_getAssociatedObject(object, v34);
    id v38 = objc_getAssociatedObject(object, v35);
    json_writer_add_key((uint64_t)a3, "_within_bundle_l2_score", 0x17uLL, 1);
    v59 = v38;
    [v38 doubleValue];
    json_writer_add_double(a3, v39);
    json_writer_add_key((uint64_t)a3, "_within_bundle_l2_inputs", 0x18uLL, 1);
    json_writer_begin_dictionary((uint64_t)a3);
    if ([v37 unsignedIntegerValue])
    {
      unint64_t v40 = 0;
      do
      {
        objc_msgSend(NSString, "stringWithFormat:", @"%li", v40);
        id v41 = objc_claimAutoreleasedReturnValue();
        id v42 = (char *)[v41 UTF8String];

        size_t v43 = strlen(v42);
        json_writer_add_key((uint64_t)a3, v42, v43, 1);
        id v44 = [v36 objectAtIndexedSubscript:v40];
        [v44 floatValue];
        json_writer_add_double(a3, v45);

        ++v40;
      }
      while (v40 < [v37 unsignedIntegerValue]);
    }
    v60 = v37;
    v61 = v36;
    json_writer_end_dictionary((uint64_t)a3);
    BOOL v46 = PRSModelManagerAssociatedObjectKeyForType(10);
    BOOL v47 = PRSModelManagerAssociatedObjectKeyForType(11);
    v48 = PRSModelManagerAssociatedObjectKeyForType(12);
    v49 = objc_getAssociatedObject(object, v46);
    v50 = objc_getAssociatedObject(object, v47);
    v51 = objc_getAssociatedObject(object, v48);
    json_writer_add_key((uint64_t)a3, "_within_bundle_l2e_score", 0x18uLL, 1);
    [v51 doubleValue];
    json_writer_add_double(a3, v52);
    json_writer_add_key((uint64_t)a3, "_within_bundle_l2e_inputs", 0x19uLL, 1);
    json_writer_begin_dictionary((uint64_t)a3);
    if ([v50 unsignedIntegerValue])
    {
      unint64_t v53 = 0;
      do
      {
        objc_msgSend(NSString, "stringWithFormat:", @"%li", v53);
        id v54 = objc_claimAutoreleasedReturnValue();
        v55 = (char *)[v54 UTF8String];

        size_t v56 = strlen(v55);
        json_writer_add_key((uint64_t)a3, v55, v56, 1);
        v57 = [v49 objectAtIndexedSubscript:v53];
        [v57 floatValue];
        json_writer_add_double(a3, v58);

        ++v53;
      }
      while (v53 < [v50 unsignedIntegerValue]);
    }
    json_writer_end_dictionary((uint64_t)a3);

    uint64_t v10 = v63;
    uint64_t v9 = v64;
    id v32 = v62;
  }
}

- (void)_extractTrainingSamplesForQuery:(id)a3 withIndexOfEngagedItem:(unint64_t)a4 withItems:(id)a5 withRanker:(id)a6 withCEPData:(id)a7 forClientBundle:(id)a8 debugInfoEnabled:(BOOL)a9 keyboardPrimaryLanguage:(id)a10
{
  id v16 = a3;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a10;
  PRSRankingSDEnabledFlagState();
  id v22 = [(PRSAnonymousPipelineManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __176__PRSAnonymousPipelineManager__extractTrainingSamplesForQuery_withIndexOfEngagedItem_withItems_withRanker_withCEPData_forClientBundle_debugInfoEnabled_keyboardPrimaryLanguage___block_invoke;
  block[3] = &unk_1E634C938;
  id v30 = v17;
  float v31 = self;
  id v32 = v20;
  id v33 = v18;
  id v34 = v16;
  id v35 = v19;
  BOOL v38 = a9;
  id v36 = v21;
  unint64_t v37 = a4;
  id v23 = v21;
  id v24 = v19;
  id v25 = v16;
  id v26 = v18;
  id v27 = v20;
  id v28 = v17;
  dispatch_async(v22, block);
}

void __176__PRSAnonymousPipelineManager__extractTrainingSamplesForQuery_withIndexOfEngagedItem_withItems_withRanker_withCEPData_forClientBundle_debugInfoEnabled_keyboardPrimaryLanguage___block_invoke(uint64_t a1)
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1 + 88;
  unint64_t v1 = *(void *)(a1 + 88);
  if (v1 == 0x7FFFFFFFFFFFFFFFLL || v1 >= [*(id *)(a1 + 32) count])
  {
    id v5 = PRSLogCategoryAnonymousPipeline();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __201__PRSAnonymousPipelineManager_extractTrainingDataWithItemAtIndex_withItems_withRanker_forQuery_dataCollectAllowed_queryID_withCEPData_forClientBundle_debugInfoEnabled_keyboardPrimaryLanguage_clientID___block_invoke_cold_1(v2, v5, v48, v49, v50, v51, v52, v53);
    }
  }
  else
  {
    uint64_t v4 = [*(id *)(a1 + 40) _abandonedItemsFromItems:*(void *)(a1 + 32) withIndexOfEngagedItem:*(void *)(a1 + 88)];
    id v5 = [v4 mutableCopy];

    if ((unint64_t)[v5 count] >= 0x10)
    {
      uint64_t v6 = 0;
      uint64_t v7 = 0;
      do
      {
        [v5 exchangeObjectAtIndex:v7 withObjectAtIndex:v7 + arc4random_uniform([v5 count] + v6)];
        ++v7;
        --v6;
      }
      while (v6 != -15);
    }
    unint64_t v8 = [v5 count];
    if (v8 >= 0xF) {
      uint64_t v9 = 15;
    }
    else {
      uint64_t v9 = v8;
    }
    uint64_t v10 = -[NSObject subarrayWithRange:](v5, "subarrayWithRange:", 0, v9);
    uint64_t v11 = [v10 count];
    uint64_t v12 = v11 + 1;
    unint64_t v13 = 14 - v11;
    uint64_t v14 = [*(id *)(a1 + 32) count];
    if (v13 >= v14 - v12) {
      unint64_t v15 = v14 - v12;
    }
    else {
      unint64_t v15 = v13;
    }
    id v16 = objc_opt_new();
    if (v15)
    {
      id v17 = objc_msgSend(*(id *)(a1 + 32), "subarrayWithRange:", v12, v15);
      [v16 addObjectsFromArray:v17];
    }
    id v18 = [(id)objc_opt_class() logURLForCurrentTimeAndBundle:*(void *)(a1 + 48) forEngagement:1];
    id v19 = [v18 path];
    id v20 = [v19 stringByAppendingString:@".tmp"];
    id v21 = (int *)json_writer_create_with_path((const char *)[v20 UTF8String], 0x10000);
    if (v21)
    {
      id v22 = v21;
      v60 = v18;
      json_writer_begin_dictionary((uint64_t)v21);
      id v23 = *(void **)(a1 + 56);
      if (v23) {
        [v23 serializeAnonymousQueryLogFeaturesToJSONWithWriter:v22];
      }
      id v58 = v20;
      id v59 = v19;
      [*(id *)(a1 + 40) _addQueryInfoToJSONWriter:v22 withQuery:*(void *)(a1 + 64) cepData:*(void *)(a1 + 72) forClient:*(void *)(a1 + 48) debugInfoAllowed:*(unsigned __int8 *)(a1 + 96) keyboardPrimaryLanguage:*(void *)(a1 + 80)];
      id v24 = [*(id *)(a1 + 32) objectAtIndexedSubscript:*(void *)(a1 + 88)];
      json_writer_add_key((uint64_t)v22, "ENGAGED_RESULT", 0xEuLL, 1);
      json_writer_begin_dictionary((uint64_t)v22);
      id v25 = +[PRSL2FeatureVector allowedAttributeSetForAnonPipeline];
      v57 = v24;
      [v24 serializeAnonymousLogFeaturesToJSONWithWriter:v22 allowedAttributeSet:v25];

      json_writer_add_key((uint64_t)v22, "item_pos", 8uLL, 1);
      json_writer_add_uint64((uint64_t)v22, *(void *)(a1 + 88));
      if (*(unsigned char *)(a1 + 96))
      {
        json_writer_add_key((uint64_t)v22, "identifier", 0xAuLL, 1);
        json_writer_add_string(v22, (char *)[*(id *)(a1 + 64) UTF8String], 0xFFFFFFFFFFFFFFFFLL, 0);
      }
      json_writer_end_dictionary((uint64_t)v22);
      json_writer_add_key((uint64_t)v22, "ABANDONED_RESULTS", 0x11uLL, 1);
      json_writer_begin_array((uint64_t)v22);
      char v26 = [*(id *)(a1 + 48) isEqualToString:@"com.apple.searchd.suggestions"];
      long long v66 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      v61 = v10;
      id v27 = v10;
      uint64_t v28 = [v27 countByEnumeratingWithState:&v66 objects:v71 count:16];
      if (v28)
      {
        uint64_t v29 = v28;
        uint64_t v30 = *(void *)v67;
        do
        {
          for (uint64_t i = 0; i != v29; ++i)
          {
            if (*(void *)v67 != v30) {
              objc_enumerationMutation(v27);
            }
            id v32 = *(id *)(*((void *)&v66 + 1) + 8 * i);
            id v33 = v32;
            if ((v26 & 1) != 0 || ([v32 bundleIDType] & 0x80000) == 0)
            {
              json_writer_begin_dictionary((uint64_t)v22);
              id v34 = +[PRSL2FeatureVector allowedAttributeSetForAnonPipeline];
              [v33 serializeAnonymousLogFeaturesToJSONWithWriter:v22 allowedAttributeSet:v34];

              json_writer_end_dictionary((uint64_t)v22);
            }
          }
          uint64_t v29 = [v27 countByEnumeratingWithState:&v66 objects:v71 count:16];
        }
        while (v29);
      }

      json_writer_end_array((uint64_t)v22);
      json_writer_add_key((uint64_t)v22, "OTHER_RESULTS", 0xDuLL, 1);
      json_writer_begin_array((uint64_t)v22);
      long long v64 = 0u;
      long long v65 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      id v35 = v16;
      uint64_t v36 = [v35 countByEnumeratingWithState:&v62 objects:v70 count:16];
      if (v36)
      {
        uint64_t v37 = v36;
        uint64_t v38 = *(void *)v63;
        do
        {
          for (uint64_t j = 0; j != v37; ++j)
          {
            if (*(void *)v63 != v38) {
              objc_enumerationMutation(v35);
            }
            id v40 = *(id *)(*((void *)&v62 + 1) + 8 * j);
            id v41 = v40;
            if ((v26 & 1) != 0 || ([v40 bundleIDType] & 0x80000) == 0)
            {
              json_writer_begin_dictionary((uint64_t)v22);
              id v42 = +[PRSL2FeatureVector allowedAttributeSetForAnonPipeline];
              [v41 serializeAnonymousLogFeaturesToJSONWithWriter:v22 allowedAttributeSet:v42];

              json_writer_end_dictionary((uint64_t)v22);
            }
          }
          uint64_t v37 = [v35 countByEnumeratingWithState:&v62 objects:v70 count:16];
        }
        while (v37);
      }

      json_writer_end_array((uint64_t)v22);
      json_writer_end_dictionary((uint64_t)v22);
      json_writer_flush((ssize_t)v22);
      int err = json_writer_get_err((uint64_t)v22);
      json_writer_dispose(v22);
      id v20 = v58;
      id v44 = v58;
      [v44 UTF8String];
      int v45 = compress_file_in_place();
      if (err | v45)
      {
        int v46 = v45;
        BOOL v47 = PRSLogCategoryAnonymousPipeline();
        id v19 = v59;
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
          __176__PRSAnonymousPipelineManager__extractTrainingSamplesForQuery_withIndexOfEngagedItem_withItems_withRanker_withCEPData_forClientBundle_debugInfoEnabled_keyboardPrimaryLanguage___block_invoke_cold_2(err, v46, v47);
        }

        unlink((const char *)[v44 UTF8String]);
        uint64_t v10 = v61;
      }
      else
      {
        id v54 = (const std::__fs::filesystem::path *)[v44 UTF8String];
        id v19 = v59;
        v55 = (const std::__fs::filesystem::path *)[v59 UTF8String];
        rename(v54, v55, v56);
        uint64_t v10 = v61;
      }

      id v18 = v60;
    }
  }
}

- (BOOL)dateIsExpired:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1C9C8];
  id v4 = a3;
  id v5 = [v3 dateWithTimeIntervalSinceNow:-604800.0];
  id v6 = [v4 earlierDate:v5];

  return v6 == v4;
}

- (void)deleteCandidateLogs
{
  id v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v2 = +[PRSAnonymousPipelineManager candidateLogsBasePath];
  [v3 removeItemAtPath:v2 error:0];
}

- (void)deleteExpiredSubmittedLogs
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v4 = +[PRSAnonymousPipelineManager submittedLogsURL];
  v24[0] = *MEMORY[0x1E4F1D738];
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
  id v22 = 0;
  id v16 = (void *)v4;
  id v6 = [v3 contentsOfDirectoryAtURL:v4 includingPropertiesForKeys:v5 options:0 error:&v22];
  id v7 = v22;

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v23 count:16];
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
        uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v14 = +[PRSAnonymousPipelineManager dateFromFileURL:v13];
        if ([(PRSAnonymousPipelineManager *)self dateIsExpired:v14])
        {
          id v17 = v7;
          [v3 removeItemAtURL:v13 error:&v17];
          id v15 = v17;

          id v7 = v15;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v10);
  }
}

- (id)retrieveFeedbackURLToSendInDirectory:(id)a3
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  v30[0] = *MEMORY[0x1E4F1D738];
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
  id v28 = 0;
  id v6 = [v4 contentsOfDirectoryAtURL:v3 includingPropertiesForKeys:v5 options:0 error:&v28];
  id v7 = v28;

  if (v7)
  {
    id v8 = PRSLogCategoryAnonymousPipeline();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[PRSAnonymousPipelineManager retrieveFeedbackURLToSendInDirectory:]((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14);
    }
    goto LABEL_4;
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v8 = v6;
  uint64_t v16 = [v8 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (!v16)
  {
LABEL_4:
    id v15 = 0;
    goto LABEL_16;
  }
  uint64_t v17 = v16;
  id v23 = v6;
  uint64_t v18 = *(void *)v25;
  while (2)
  {
    for (uint64_t i = 0; i != v17; ++i)
    {
      if (*(void *)v25 != v18) {
        objc_enumerationMutation(v8);
      }
      long long v20 = *(void **)(*((void *)&v24 + 1) + 8 * i);
      long long v21 = [v20 path];
      if ([v21 hasSuffix:@".json"])
      {
        id v15 = v20;

        goto LABEL_15;
      }
    }
    uint64_t v17 = [v8 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v17) {
      continue;
    }
    break;
  }
  id v15 = 0;
LABEL_15:
  id v6 = v23;
LABEL_16:

  return v15;
}

- (void)cleanUp
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = [(PRSAnonymousPipelineManager *)self userDefaults];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = +[PRSAnonymousPipelineManager allowedBundles];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = +[PRSAnonymousPipelineManager engagementCountKeyForBundle:*(void *)(*((void *)&v10 + 1) + 8 * v8)];
        [v3 setObject:&unk_1F18610D0 forKey:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  [v3 removeObjectForKey:@"collectedBundleID"];
  [v3 removeObjectForKey:@"lastQueryID"];
  [(PRSAnonymousPipelineManager *)self deleteCandidateLogs];
  [(PRSAnonymousPipelineManager *)self deleteExpiredSubmittedLogs];
}

+ (id)submitttedSpotlightReportsError:(id *)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v5 = +[PRSAnonymousPipelineManager submittedLogsURL];
  v11[0] = *MEMORY[0x1E4F1D738];
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  id v10 = 0;
  uint64_t v7 = [v4 contentsOfDirectoryAtURL:v5 includingPropertiesForKeys:v6 options:0 error:&v10];
  id v8 = v10;

  if (a3 && v8) {
    *a3 = v8;
  }

  return v7;
}

- (void)queryWillFinishWithItems:(id)a3 forClient:(id)a4 forQuery:(id)a5 anonymousDataCollectionAllowed:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  long long v13 = [(PRSAnonymousPipelineManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __106__PRSAnonymousPipelineManager_queryWillFinishWithItems_forClient_forQuery_anonymousDataCollectionAllowed___block_invoke;
  block[3] = &unk_1E634C960;
  void block[4] = self;
  id v18 = v11;
  BOOL v21 = a6;
  id v19 = v10;
  id v20 = v12;
  id v14 = v12;
  id v15 = v10;
  id v16 = v11;
  dispatch_async(v13, block);
}

void __106__PRSAnonymousPipelineManager_queryWillFinishWithItems_forClient_forQuery_anonymousDataCollectionAllowed___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) submissionEnabled]
    && +[PRSAnonymousPipelineManager _dataCollectionAllowedForBundle:*(void *)(a1 + 40)]&& *(unsigned char *)(a1 + 64))
  {
    uint64_t v2 = PRSLogCategoryAnonymousPipeline();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = [*(id *)(a1 + 48) count];
      uint64_t v4 = *(void *)(a1 + 40);
      uint64_t v5 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 134218498;
      uint64_t v13 = v3;
      __int16 v14 = 2112;
      uint64_t v15 = v4;
      __int16 v16 = 2112;
      uint64_t v17 = v5;
      _os_log_impl(&dword_1BDB2A000, v2, OS_LOG_TYPE_INFO, "QueryWillFinish with %lu items client:%@ query:%@", buf, 0x20u);
    }

    [*(id *)(a1 + 32) setLastTopHitQueryString:*(void *)(a1 + 56)];
    [*(id *)(a1 + 32) setLastTopHitQueryItems:*(void *)(a1 + 48)];
    uint64_t v6 = [*(id *)(a1 + 32) topHitDataCollectionTimer];

    if (v6)
    {
      uint64_t v7 = [*(id *)(a1 + 32) topHitDataCollectionTimer];
      dispatch_source_cancel(v7);
    }
    id v8 = [*(id *)(a1 + 32) queue];
    uint64_t v9 = dispatch_source_create(MEMORY[0x1E4F14490], 1uLL, 0, v8);

    dispatch_time_t v10 = dispatch_time(0, 15000000000);
    dispatch_source_set_timer(v9, v10, 0xFFFFFFFFFFFFFFFFLL, 0);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __106__PRSAnonymousPipelineManager_queryWillFinishWithItems_forClient_forQuery_anonymousDataCollectionAllowed___block_invoke_243;
    handler[3] = &unk_1E634C270;
    handler[4] = *(void *)(a1 + 32);
    dispatch_source_set_event_handler(v9, handler);
    [*(id *)(a1 + 32) setTopHitDataCollectionTimer:v9];
    dispatch_resume(v9);
  }
}

uint64_t __106__PRSAnonymousPipelineManager_queryWillFinishWithItems_forClient_forQuery_anonymousDataCollectionAllowed___block_invoke_243(uint64_t a1)
{
  [*(id *)(a1 + 32) setLastTopHitQueryItems:0];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 setLastTopHitQueryString:0];
}

- (void)userEngagedItemWithIdentifier:(id)a3 forBundle:(id)a4 forQuery:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = PRSLogCategoryAnonymousPipeline();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v23 = v8;
    __int16 v24 = 2112;
    id v25 = v9;
    __int16 v26 = 2112;
    id v27 = v10;
    _os_log_impl(&dword_1BDB2A000, v11, OS_LOG_TYPE_DEFAULT, "UserEngagedItem id:%@ bundle:%@ query:%@", buf, 0x20u);
  }

  id v12 = v10;
  uint64_t v13 = [(PRSAnonymousPipelineManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__PRSAnonymousPipelineManager_userEngagedItemWithIdentifier_forBundle_forQuery___block_invoke;
  block[3] = &unk_1E634C2E8;
  void block[4] = self;
  id v14 = v12;
  id v18 = v14;
  id v19 = v9;
  id v20 = v8;
  id v21 = v14;
  id v15 = v8;
  id v16 = v9;
  dispatch_async(v13, block);
}

void __80__PRSAnonymousPipelineManager_userEngagedItemWithIdentifier_forBundle_forQuery___block_invoke(uint64_t a1)
{
  id v13 = [*(id *)(a1 + 32) lastTopHitQueryString];
  if (![v13 isEqualToString:*(void *)(a1 + 40)])
  {
LABEL_11:

    return;
  }
  BOOL v2 = +[PRSAnonymousPipelineManager _dataCollectionAllowedForBundle:*(void *)(a1 + 48)];

  if (v2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) lastTopHitQueryItems];
    uint64_t v4 = [v3 count];

    if (v4)
    {
      unint64_t v5 = 0;
      while (1)
      {
        uint64_t v6 = [*(id *)(a1 + 32) lastTopHitQueryItems];
        uint64_t v7 = [v6 objectAtIndexedSubscript:v5];

        id v8 = [v7 identifier];
        char v9 = [v8 isEqualToString:*(void *)(a1 + 56)];

        if (v9) {
          break;
        }
        ++v5;
        id v10 = [*(id *)(a1 + 32) lastTopHitQueryItems];
        unint64_t v11 = [v10 count];

        if (v5 >= v11) {
          return;
        }
      }
      if (v5 != 0x7FFFFFFFFFFFFFFFLL)
      {
        id v12 = *(void **)(a1 + 32);
        id v13 = [v12 lastTopHitQueryItems];
        objc_msgSend(v12, "extractTrainingDataWithItemAtIndex:withItems:withRanker:forQuery:dataCollectAllowed:forClientBundle:keyboardPrimaryLanguage:clientID:", v5, 0, 0);
        goto LABEL_11;
      }
    }
  }
}

- (NSUserDefaults)userDefaults
{
  return (NSUserDefaults *)objc_getProperty(self, a2, 16, 1);
}

- (void)setUserDefaults:(id)a3
{
}

- (BOOL)isInternalDevice
{
  return self->_isInternalDevice;
}

- (void)setIsInternalDevice:(BOOL)a3
{
  self->_isInternalDevice = a3;
}

- (NSString)lastTopHitQueryString
{
  return self->_lastTopHitQueryString;
}

- (void)setLastTopHitQueryString:(id)a3
{
}

- (NSArray)lastTopHitQueryItems
{
  return self->_lastTopHitQueryItems;
}

- (void)setLastTopHitQueryItems:(id)a3
{
}

- (OS_dispatch_source)topHitDataCollectionTimer
{
  return self->_topHitDataCollectionTimer;
}

- (void)setTopHitDataCollectionTimer:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (BOOL)submissionEnabled
{
  return self->_submissionEnabled;
}

- (void)setSubmissionEnabled:(BOOL)a3
{
  self->_submissionEnabled = a3;
}

- (SPCustomFeedbackSender)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_topHitDataCollectionTimer, 0);
  objc_storeStrong((id *)&self->_lastTopHitQueryItems, 0);
  objc_storeStrong((id *)&self->_lastTopHitQueryString, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
}

- (void)_shouldDataCollectForEngagementReservoirSamplingForClientBundle:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v5 = 134218498;
  uint64_t v6 = [a1 integerValue];
  __int16 v7 = 2048;
  uint64_t v8 = 0;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  _os_log_debug_impl(&dword_1BDB2A000, a3, OS_LOG_TYPE_DEBUG, "[Sampling] Logging this sample. Engagement count:%lu random num:%lu date:%@", (uint8_t *)&v5, 0x20u);
}

void __201__PRSAnonymousPipelineManager_extractTrainingDataWithItemAtIndex_withItems_withRanker_forQuery_dataCollectAllowed_queryID_withCEPData_forClientBundle_debugInfoEnabled_keyboardPrimaryLanguage_clientID___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __176__PRSAnonymousPipelineManager__extractTrainingSamplesForQuery_withIndexOfEngagedItem_withItems_withRanker_withCEPData_forClientBundle_debugInfoEnabled_keyboardPrimaryLanguage___block_invoke_cold_2(int a1, int a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 67109376;
  v3[1] = a1;
  __int16 v4 = 1024;
  int v5 = a2;
  _os_log_error_impl(&dword_1BDB2A000, log, OS_LOG_TYPE_ERROR, "Json serialization err %d %d", (uint8_t *)v3, 0xEu);
}

- (void)retrieveFeedbackURLToSendInDirectory:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end
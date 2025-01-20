@interface PRSRankingItem
+ (BOOL)supportsSecureCoding;
+ (float)inAppEngagementScoreWithEvaluator:(id)a3 currentTime:(double)a4 queriesInApp:(id)a5 datesInApp:(id)a6 topicalityScore:(float)a7;
+ (float)matchScoreLaunchString:(id)a3 withEvaluator:(id)a4;
+ (float)outOfSpotlightEngagementScore:(double)a3 datesOutOfSpotlight:(id)a4 topicalityScore:(float)a5 alternativeOutOfSpotlightCount:(float)a6;
+ (id)bundlesExcludedFromRankCategory;
+ (id)rankingDescriptorForBundleFeature:(unint64_t)a3;
+ (id)tokenizeContactsEmailAddress:(id)a3 removeTLD:(BOOL)a4 usernameTokenCount:(unint64_t *)a5 usernameLength:(unint64_t *)a6 domainLength:(unint64_t *)a7 username:(id *)a8;
+ (id)tokenizeContactsName:(id)a3 tokenCount:(unint64_t *)a4;
+ (id)tokenizeTitleString:(id)a3;
+ (id)tokenizeTitleString:(id)a3 matchOption:(unsigned __int8)a4;
+ (id)tokenizeURLString:(id)a3 removeTLD:(BOOL)a4 hostTokenCount:(unint64_t *)a5 hostLength:(unint64_t *)a6 pathLength:(unint64_t *)a7 queryLength:(unint64_t *)a8 fragmentLength:(unint64_t *)a9;
+ (unint64_t)requiredAttributesCount;
+ (unsigned)featureFromVirtualIdx:(unint64_t)a3;
+ (void)initialize;
+ (void)matchScoreTokensFromText:(id)a3 withEvaluator:(id)a4 withHandler:(id)a5;
- ($97A5064B8639E9CA0767BE93C2545605)attributes;
- (BOOL)_isWalletPass:(id)a3;
- (BOOL)_isWalletTransaction:(id)a3;
- (BOOL)didMatchRankingDescriptor:(id)a3;
- (BOOL)displayNameInitialsFirstWordAndMoreMatchOnly;
- (BOOL)displayNameInitialsPrefixMatchOnly;
- (BOOL)eligibleForDemotion;
- (BOOL)exactMatchedLaunchString;
- (BOOL)hasPolicyMultipleTermsNearMatch;
- (BOOL)hasPolicyMultipleTermsPhraseMatch;
- (BOOL)hasPolicySingleTermPhraseMatch;
- (BOOL)hasShortCut;
- (BOOL)isAppEntity;
- (BOOL)isAssociatedWithTophitContactsFromItems:(id)a3;
- (BOOL)isBundleDemotedForBullseyeCommittedSearch;
- (BOOL)isCCCD;
- (BOOL)isCalendarFlightEventType;
- (BOOL)isCalendarHotelEventType;
- (BOOL)isCalendarOtherReservationEventType;
- (BOOL)isCalendarRestaurantEventType;
- (BOOL)isGoodMatchAlternateName:(id)a3 withEvaluator:(id)a4;
- (BOOL)isGoodPhotosMatch;
- (BOOL)isInSectionWithRankCategory:(id)a3;
- (BOOL)isKeywordMatch;
- (BOOL)isLocalTopHitCandidate;
- (BOOL)isMailCategoryDefault;
- (BOOL)isMailCategoryHighImpact;
- (BOOL)isMailCategoryPromotions;
- (BOOL)isMailCategoryTransactions;
- (BOOL)isMailCategoryUpdates;
- (BOOL)isNotExecutable;
- (BOOL)isPerfectMatch;
- (BOOL)isPromotedInstantAnswer;
- (BOOL)isSafariTopHit;
- (BOOL)isSearchResultPage:(id)a3;
- (BOOL)isServerAlternativeResult;
- (BOOL)isTopHit;
- (BOOL)matchedQUIntent;
- (BOOL)matchedQueryTerms;
- (BOOL)photosExactMatch;
- (BOOL)photosMatch;
- (BOOL)quIntentAvailable;
- (BOOL)recentForAboveThresholdTopHit;
- (BOOL)recentForTopHit;
- (BOOL)serializeToJSON:(void *)a3 valuesOnly:(BOOL)a4;
- (BOOL)shouldHideUnderShowMore;
- (BOOL)shouldHideUnderShowMoreIfNotTophit;
- (BOOL)spellCorrectedApp;
- (BOOL)vendorNameIsDisplayNamePrefix;
- (BOOL)wasEngaged;
- (BOOL)wasEngagedInSpotlight;
- (BOOL)wordMatchedKeyword;
- (NSArray)recentSimilarIntentEngagementDates;
- (NSData)l2Signals;
- (NSData)localSuggestionsData;
- (NSData)serverFeaturesJSON;
- (NSData)serverSuggestionsData;
- (NSDate)interestingDate;
- (NSDate)lastAccessDate;
- (NSDate)lastUsedDate;
- (NSDate)mailDate;
- (NSDictionary)l2Features;
- (NSDictionary)matchInfo;
- (NSNumber)retrievalType;
- (NSString)description;
- (NSString)displayNameInitials;
- (NSString)exactMatchedKeyword;
- (NSString)firstMatchedAltName;
- (NSString)identifier;
- (NSString)preExtractedCardType;
- (NSString)sectionBundleIdentifier;
- (PRSL2FeatureVector)L2FeatureVector;
- (PRSRankingItem)initWithAttrs:(id *)a3;
- (PRSRankingItem)initWithAttrs:(id *)a3 isServerAlternativeResult:(BOOL)a4;
- (PRSRankingItem)initWithCoder:(id)a3;
- (double)closestUpComingDate;
- (double)engagementScore;
- (double)finalTopicality;
- (double)freshnessScore;
- (double)likelihood;
- (double)mostRecentUseInMinutes;
- (double)mostRecentUsedDate;
- (double)suggestionScore;
- (double)topicalityScore;
- (float)calibratedEmbeddingSimilarity;
- (float)computeCalibratedSparseScore;
- (float)embeddingSimilarity;
- (float)engagementScoreWithEvaluator:(id)a3 currentTime:(double)a4 launchString:(id)a5 topicalityScore:(float)a6;
- (float)feedbackScore;
- (float)inSpotlightEngagementScoreWithEvaluator:(id)a3 currentTime:(double)a4 queriesInSpotlight:(id)a5 datesInSpotlight:(id)a6 queriesInSpotlightNonUnique:(id)a7 datesInSpotlightNonUnique:(id)a8 launchString:(id)a9 lastUsedDate:(id)a10 topicalityScore:(float)a11;
- (float)keywordMatchScore;
- (float)l2Score;
- (float)matchScoreAppName:(id)a3 withEvaluator:(id)a4;
- (float)matchScoreAppName:(id)a3 withEvaluator:(id)a4 matchOption:(unsigned __int8)a5;
- (float)matchScoreContactsEmailAddress:(id)a3 withEvaluator:(id)a4;
- (float)matchScoreContactsName:(id)a3 withEvaluator:(id)a4;
- (float)matchScoreFileName:(id)a3 withEvaluator:(id)a4 isSearchToolClient:(BOOL)a5;
- (float)matchScoreForAppEntityWithEvaluator:(id)a3 quParsedEvaluator:(id)a4 isSearchToolClient:(BOOL)a5;
- (float)matchScoreForApplicationsWithEvaluator:(id)a3;
- (float)matchScoreForBooksWithEvaluator:(id)a3 quParsedEvaluator:(id)a4 isSearchToolClient:(BOOL)a5;
- (float)matchScoreForCalendarWithEvaluator:(id)a3 quParsedEvaluator:(id)a4 isSearchToolClient:(BOOL)a5;
- (float)matchScoreForContactsWithEvaluator:(id)a3 quParsedEvaluator:(id)a4;
- (float)matchScoreForDictionaryWithEvaluator:(id)a3;
- (float)matchScoreForFilesWithEvaluator:(id)a3 quParsedEvaluator:(id)a4 isSearchToolClient:(BOOL)a5;
- (float)matchScoreForHelpWithEvaluator:(id)a3;
- (float)matchScoreForMailWithEvaluator:(id)a3 isSearchToolClient:(BOOL)a4;
- (float)matchScoreForMessagesWithEvaluator:(id)a3 isSearchToolClient:(BOOL)a4;
- (float)matchScoreForMusicWithEvaluator:(id)a3 quParsedEvaluator:(id)a4 isSearchToolClient:(BOOL)a5;
- (float)matchScoreForNotesWithEvaluator:(id)a3 isSearchToolClient:(BOOL)a4;
- (float)matchScoreForPeopleItemsWithEvaluator:(id)a3;
- (float)matchScoreForPreferencesWithEvaluator:(id)a3;
- (float)matchScoreForPreferencesWithEvaluator:(id)a3 subject:(id)a4 isFirstParty:(BOOL)a5 preferencePriority:(int)a6;
- (float)matchScoreForPreferencesWithEvaluator:(id)a3 subject:(id)a4 preferenceType:(id)a5 preferenceId:(id)a6;
- (float)matchScoreForSafariWithEvaluator:(id)a3 quParsedEvaluator:(id)a4 isSearchToolClient:(BOOL)a5;
- (float)matchScoreForShortcutsAppWithEvaluator:(id)a3;
- (float)matchScoreForShortcutsSettingWithEvaluator:(id)a3 name:(id)a4 preferencePriority:(int)a5;
- (float)matchScoreForShortcutsWithEvaluator:(id)a3;
- (float)matchScoreForTipsWithEvaluator:(id)a3;
- (float)matchScoreForWalletWithEvaluator:(id)a3 quParsedEvaluator:(id)a4 isSearchToolClient:(BOOL)a5;
- (float)matchScoreGeneric:(id)a3 quParsedEvaluator:(id)a4 isSearchToolClient:(BOOL)a5;
- (float)matchScoreSettings:(id)a3 withEvaluator:(id)a4 matchOption:(unsigned __int8)a5;
- (float)matchScoreTitle:(id)a3 withEvaluator:(id)a4;
- (float)matchScoreTitle:(id)a3 withEvaluator:(id)a4 matchOption:(unsigned __int8)a5;
- (float)matchScoreURLString:(id)a3 withEvaluator:(id)a4;
- (float)mostRecentTimeToQueryInMinutesWithCurrentTime:(double)a3 topicality:(float)a4;
- (float)pommesCalibratedL1Score;
- (float)pommesL1Score;
- (float)quIntentScore;
- (float)rawScore;
- (float)safariMatchScoreContentURL;
- (float)safariMatchScoreTitle;
- (float)score;
- (float)staleDemotionWithCurrentTime:(double)a3 topicality:(float)a4;
- (float)topicalityScoreWithEvaluator:(id)a3 quParsedEvaluator:(id)a4 isSearchToolClient:(BOOL)a5 quParsedPersonEvaluator:(id)a6 quParsedArgSearchTermsEvaluator:(id)a7;
- (float)withinBundleScore;
- (id)contentType;
- (id)dataCollectionBundle;
- (id)displayName;
- (id)dueDate;
- (id)getBundleSpecificValue:(id)a3 forPropertyName:(id)a4 withQueryString:(id)a5 isCJK:(BOOL)a6 isBullseyeSearch:(BOOL)a7 withEvaluator:(id)a8 keyboardLanguage:(id)a9 seenAuthorEmail:(BOOL)a10 seenPrimaryRecipientEmail:(BOOL)a11;
- (id)getMatchInfoDictionaryWithKeyboardLanguage:(id)a3;
- (id)initForParsecResultWithBundleID:(id)a3;
- (id)likelyDisplayTitle;
- (id)mailFreshnessDate;
- (id)moreRecentDateFromDate1:(id)a3 date2:(id)a4;
- (id)rankingFeedbackBundleID;
- (int)preferencePriorityFromIdentity:(id)a3;
- (int)preferencePriorityFromIdentityWithPrefixPrefs:(id)a3;
- (int)preferencePriorityFromIdentityWithPrefixSettingsNavigation:(id)a3;
- (int)settingsPreferencePriority;
- (int)shortcutPriorityFromIdentifier:(id)a3;
- (int)topHitReason;
- (int64_t)compare:(id)a3 currentTime:(double)a4;
- (int64_t)compareAppsTopHitCandidate:(id)a3;
- (int64_t)compareContactsTopHitCandidate:(id)a3;
- (int64_t)compareLocalTopHitCandidate:(id)a3;
- (int64_t)compareParsecTopHitCandidate:(id)a3;
- (int64_t)comparePeopleItemTopHitCandidate:(id)a3;
- (int64_t)compareSafariTopHitCandidate:(id)a3;
- (int64_t)compareShortcutTopHitCandidate:(id)a3;
- (int64_t)compareWithCCCDTopHitCandidate:(id)a3;
- (int64_t)contentCreationDateToNowInSeconds;
- (int64_t)itemDenseMatchStrengthType;
- (int64_t)itemSparseMatchStrengthType;
- (int64_t)itemSparseMatchStrengthTypeForMailWithEvaluator:(id)a3 attributeMatchesForToken:(id)a4;
- (int64_t)itemSparseMatchStrengthTypeForMessagesAndCalendarWithEvaluator:(id)a3 attributeMatchesForToken:(id)a4;
- (int64_t)itemSparseMatchStrengthTypeForNotesAndFilesWithEvaluator:(id)a3 attributeMatchesForToken:(id)a4;
- (int64_t)itemSparseMatchStrengthTypeForSafariWithEvaluator:(id)a3 attributeMatchesForToken:(id)a4;
- (int64_t)itemSparseMatchStrengthTypeWithEvaluator:(id)a3;
- (int64_t)mostRecentTimeToQueryInDaysForFreshness;
- (int64_t)startDueDateToNowInSeconds;
- (uint64_t)attrCountPrefix:(uint64_t)a3 queryTermCount:;
- (uint64_t)attrCountPrefixLast:(uint64_t)a3 queryTermCount:;
- (uint64_t)attrCountWord:(uint64_t)a3 queryTermCount:;
- (uint64_t)attrCountsPrefix;
- (uint64_t)comparePhotosOnlyWithDates:(double)a3 currentTime:;
- (uint64_t)compareWithDates:(double)a3 currentTime:;
- (uint64_t)compareWithDatesPlus:(int)a3 currentTime:(uint64_t)a4 hasCategory:(uint64_t)a5 topBit:(char)a6 upperBit:(double)a7 lowerBit:;
- (uint64_t)emailAddresses;
- (uint64_t)embedding;
- (uint64_t)importantPropertiesPrefixMatched;
- (uint64_t)importantPropertiesWordMatched;
- (uint64_t)indexScore;
- (uint64_t)inputToModelScore;
- (uint64_t)matchedRecipients;
- (uint64_t)matchedSenders;
- (uint64_t)matchedVipSenders;
- (uint64_t)recencyTestForAboveThresholdTopHitWithCurrentTime:(void *)a1;
- (uint64_t)recencyTestForTopHitWithCurrentTime:(uint64_t)a1;
- (uint64_t)recencyTestForVisibilityWithCurrentTime:(uint64_t)a1;
- (uint64_t)setImportantPropertiesPrefixMatched:(uint64_t)result;
- (uint64_t)setImportantPropertiesWordMatched:(uint64_t)result;
- (uint64_t)test_indexScore;
- (uint64_t)test_inputToModelScore;
- (unint64_t)attrCountPrefix2:(unint64_t)a3;
- (unint64_t)attrCountPrefix3:(unint64_t)a3;
- (unint64_t)attrCountPrefix:(unint64_t)a3;
- (unint64_t)attrCountPrefixLast2:(unint64_t)a3;
- (unint64_t)attrCountPrefixLast3:(unint64_t)a3;
- (unint64_t)attrCountPrefixLast:(unint64_t)a3;
- (unint64_t)attrCountWord2:(unint64_t)a3;
- (unint64_t)attrCountWord3:(unint64_t)a3;
- (unint64_t)attrCountWord:(unint64_t)a3;
- (unint64_t)attrType:(id)a3 seenAuthorEmail:(BOOL)a4 seenPrimaryRecipientEmail:(BOOL)a5;
- (unint64_t)bundleIDType;
- (unint64_t)detectedEventType;
- (void)calculateFreshnessForSearchTool:(double)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)extractDocumentSignals;
- (void)inferDateBinsFromDates:(id)a3 intoBins:(int *)a4;
- (void)parsePreferenceIdentity:(id)a3 withHandler:(id)a4;
- (void)populateAnonymousLogFeaturesWithEvaluator:(id)a3 currentTime:(double)a4 allowedAttributeSet:(id)a5;
- (void)populateBundleSpecificFeatures:(PRSL2FeatureScoreInfo *)a3 currentTime:(double)a4 isSearchToolClient:(BOOL)a5;
- (void)populateContactFeatures:(PRSL2FeatureScoreInfo *)a3 currentTime:(double)a4;
- (void)populateCrossAttributeDerivedFeaturesWithContext:(prs_feature_population_ctx_t *)a3 featureScoreInfo:(PRSL2FeatureScoreInfo *)a4;
- (void)populateFeaturesWithEvaluator:(uint64_t)a1 updatingBundleFeatures:(uint64_t)a2 withContext:(uint64_t)a3 keyboardLanguage:(uint64_t)a4 isCJK:(uint64_t)a5 currentTime:(uint64_t)a6 withRanker:(uint64_t)a7 attributeHolder:(uint64_t)a8 quParsedEvaluator:(void *)a9 isSearchToolClient:(unsigned __int8)a10 quParsedPersonEvaluator:(void *)a11 quParsedArgSearchTermsEvaluator:(void *)a12;
- (void)populateFeaturesWithEvaluator:(uint64_t)a3 withContext:(uint64_t)a4 keyboardLanguage:(uint64_t)a5 isCJK:(uint64_t)a6 currentTime:(uint64_t)a7 forParsecResult:(uint64_t)a8;
- (void)populateMailFeatures:(PRSL2FeatureScoreInfo *)a3;
- (void)populateOnlyPommesFeaturesForBundleID:(id)a3 queryID:(int64_t)a4 isSearchToolClient:(BOOL)a5;
- (void)populateOnlyPommesL1RankingFeaturesWithQueryID:(int64_t)a3 isSearchToolClient:(BOOL)a4;
- (void)populateOtherFeatures:(PRSL2FeatureScoreInfo *)a3 withEvaluator:(id)a4 currentTime:(double)a5 quParsedEvaluator:(id)a6 queryID:(int64_t)a7 isSearchToolClient:(BOOL)a8 quParsedPersonEvaluator:(id)a9 quParsedArgSearchTermsEvaluator:(id)a10;
- (void)populateParsecAlbumFeatures:(PRSL2FeatureScoreInfo *)a3 currentTime:(double)a4 forParsecResult:(id)a5;
- (void)populateParsecAnyFeatures:(PRSL2FeatureScoreInfo *)a3 currentTime:(double)a4 forParsecResult:(id)a5;
- (void)populateParsecAppFeatures:(PRSL2FeatureScoreInfo *)a3 currentTime:(double)a4 forParsecResult:(id)a5;
- (void)populateParsecBundleSpecificFeatures:(PRSL2FeatureScoreInfo *)a3 currentTime:(double)a4 forParsecResult:(id)a5;
- (void)populateParsecEPubBookFeatures:(PRSL2FeatureScoreInfo *)a3 currentTime:(double)a4 forParsecResult:(id)a5;
- (void)populateParsecMovieFeatures:(PRSL2FeatureScoreInfo *)a3 currentTime:(double)a4 forParsecResult:(id)a5;
- (void)populateParsecPodcastFeatures:(PRSL2FeatureScoreInfo *)a3 currentTime:(double)a4 forParsecResult:(id)a5;
- (void)populateParsecProfileFeatures:(PRSL2FeatureScoreInfo *)a3 currentTime:(double)a4 forParsecResult:(id)a5;
- (void)populateParsecRemainingFeatures;
- (void)populateParsecRoundTripFeatures:(id)a3 forParsecResult:(id)a4;
- (void)populateParsecSongFeatures:(PRSL2FeatureScoreInfo *)a3 currentTime:(double)a4 forParsecResult:(id)a5;
- (void)populateParsecTvShowFeatures:(PRSL2FeatureScoreInfo *)a3 currentTime:(double)a4 forParsecResult:(id)a5;
- (void)populateParsecWebVideoFeatures:(PRSL2FeatureScoreInfo *)a3 currentTime:(double)a4 forParsecResult:(id)a5;
- (void)populateRemainingFeaturesWithRanker:(id)a3;
- (void)populateSMSFeatures:(PRSL2FeatureScoreInfo *)a3;
- (void)populateTextContentDistanceMeasures:(PRSL2FeatureScoreInfo *)a3;
- (void)populateTextFeatureValuesForProperty:(id)a3 updatingBundleFeatureValues:(float *)(a4 propertyIndex:withEvaluator:withContext:featureScoreInfo:propertyCanFuzzyMatch:keyboardLanguage:isCJK:featureList:propertyName:seenAuthorEmail:seenPrimaryRecipientEmail:;
- (void)populateTextFeatureValuesForProperty:(id)a3 updatingBundleFeatureValues:(float *)(a4 propertyIndex:withEvaluator:withContext:featureScoreInfo:propertyCanFuzzyMatch:keyboardLanguage:isCJK:propertyName:seenAuthorEmail:seenPrimaryRecipientEmail:;
- (void)resetScoreForShortcutsSetting:(id)a3;
- (void)serializeAnonymousLogFeaturesToJSONWithWriter:(void *)a3 allowedAttributeSet:(id)a4;
- (void)setAttributes:(id *)a3;
- (void)setBundleIDType:(unint64_t)a3;
- (void)setCalibratedEmbeddingSimilarity:(float)a3;
- (void)setClosestUpComingDate:(double)a3;
- (void)setContentCreationDateToNowInSeconds:(int64_t)a3;
- (void)setDetectedEventType:(unint64_t)a3;
- (void)setDisplayNameInitials:(id)a3;
- (void)setDisplayNameInitialsFirstWordAndMoreMatchOnly:(BOOL)a3;
- (void)setDisplayNameInitialsPrefixMatchOnly:(BOOL)a3;
- (void)setEligibleForDemotion:(BOOL)a3;
- (void)setEmbeddingSimilarity:(float)a3;
- (void)setEngagementScore:(double)a3;
- (void)setExactMatchedKeyword:(id)a3;
- (void)setExactMatchedLaunchString:(BOOL)a3;
- (void)setFeedbackScore:(float)a3;
- (void)setFinalTopicality:(double)a3;
- (void)setFirstMatchedAltName:(id)a3;
- (void)setFreshnessScore:(double)a3;
- (void)setHasPolicyMultipleTermsNearMatch:(BOOL)a3;
- (void)setHasPolicyMultipleTermsPhraseMatch:(BOOL)a3;
- (void)setHasPolicySingleTermPhraseMatch:(BOOL)a3;
- (void)setHasShortCut:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setIsAppEntity:(BOOL)a3;
- (void)setIsBundleDemotedForBullseyeCommittedSearch:(BOOL)a3;
- (void)setIsCalendarFlightEventType:(BOOL)a3;
- (void)setIsCalendarHotelEventType:(BOOL)a3;
- (void)setIsCalendarOtherReservationEventType:(BOOL)a3;
- (void)setIsCalendarRestaurantEventType:(BOOL)a3;
- (void)setIsKeywordMatch:(BOOL)a3;
- (void)setIsLocalTopHitCandidate:(BOOL)a3;
- (void)setIsMailCategoryDefault:(BOOL)a3;
- (void)setIsMailCategoryHighImpact:(BOOL)a3;
- (void)setIsMailCategoryPromotions:(BOOL)a3;
- (void)setIsMailCategoryTransactions:(BOOL)a3;
- (void)setIsMailCategoryUpdates:(BOOL)a3;
- (void)setIsNotExecutable:(BOOL)a3;
- (void)setIsPromotedInstantAnswer:(BOOL)a3;
- (void)setIsSafariTopHit:(BOOL)a3;
- (void)setIsServerAlternativeResult:(BOOL)a3;
- (void)setItemDenseMatchStrengthType:(int64_t)a3;
- (void)setItemSparseMatchStrengthType:(int64_t)a3;
- (void)setKeywordMatchScore:(float)a3;
- (void)setL2FeatureVector:(id)a3;
- (void)setL2Features:(id)a3;
- (void)setL2Score:(float)a3;
- (void)setL2Signals:(id)a3;
- (void)setLastUsedDate:(id)a3;
- (void)setLikelihood:(double)a3;
- (void)setLocalSuggestionsData:(id)a3;
- (void)setMailDate:(id)a3;
- (void)setMatchedQUIntent:(BOOL)a3;
- (void)setMatchedQueryTerms:(BOOL)a3;
- (void)setMostRecentTimeToQueryInDaysForFreshness:(int64_t)a3;
- (void)setMostRecentUseInMinutes:(double)a3;
- (void)setMostRecentUsedDate:(double)a3;
- (void)setPhotosExactMatch:(BOOL)a3;
- (void)setPhotosMatch:(BOOL)a3;
- (void)setPommesCalibratedL1Score:(float)a3;
- (void)setPommesL1Score:(float)a3;
- (void)setPreExtractedCardType:(id)a3;
- (void)setQuIntentAvailable:(BOOL)a3;
- (void)setQuIntentScore:(float)a3;
- (void)setRawScore:(float)a3;
- (void)setRecentForAboveThresholdTopHit:(BOOL)a3;
- (void)setRecentForTopHit:(BOOL)a3;
- (void)setRecentSimilarIntentEngagementDates:(id)a3;
- (void)setRetrievalType:(id)a3;
- (void)setSafariMatchScoreContentURL:(float)a3;
- (void)setSafariMatchScoreTitle:(float)a3;
- (void)setScore:(float)a3;
- (void)setSectionBundleIdentifier:(id)a3;
- (void)setServerFeaturesJSON:(id)a3;
- (void)setServerSuggestionsData:(id)a3;
- (void)setSettingsPreferencePriority:(int)a3;
- (void)setShouldHideUnderShowMore:(BOOL)a3;
- (void)setShouldHideUnderShowMoreIfNotTophit:(BOOL)a3;
- (void)setSpellCorrectedApp:(BOOL)a3;
- (void)setStartDueDateToNowInSeconds:(int64_t)a3;
- (void)setSuggestionBundleIDType;
- (void)setSuggestionScore:(double)a3;
- (void)setTest_indexScore:(PRSRankingItem *)self;
- (void)setTest_inputToModelScore:(PRSRankingItem *)self;
- (void)setTopHitReason:(int)a3;
- (void)setTopicalityScore:(double)a3;
- (void)setVendorNameIsDisplayNamePrefix:(BOOL)a3;
- (void)setWasEngaged:(BOOL)a3;
- (void)setWasEngagedInSpotlight:(BOOL)a3;
- (void)setWithinBundleScore:(float)a3;
- (void)setWordMatchedKeyword:(BOOL)a3;
- (void)updateAccumulatedBundleFeatures:(float *)a3 values:(float *)a4 feature:(unint64_t)a5;
- (void)updateAttrCountsPrefix2:(unsigned __int16 *)a3 queryTermCount:(unint64_t)a4 attrType:(unint64_t)a5;
- (void)updateAttrCountsPrefix3:(unsigned __int16 *)a3 queryTermCount:(unint64_t)a4 attrType:(unint64_t)a5;
- (void)updateAttrCountsPrefix:(unsigned __int16 *)a3 queryTermCount:(unint64_t)a4 attrType:(unint64_t)a5;
- (void)updateAttrCountsPrefixLast2:(unsigned __int16 *)a3 termsDidMatchPrefix:(unsigned __int16 *)a4 queryTermCount:(unint64_t)a5 attrType:(unint64_t)a6;
- (void)updateAttrCountsPrefixLast3:(unsigned __int16 *)a3 termsDidMatchPrefix:(unsigned __int16 *)a4 queryTermCount:(unint64_t)a5 attrType:(unint64_t)a6;
- (void)updateAttrCountsPrefixLast:(unsigned __int16 *)a3 termsDidMatchPrefix:(unsigned __int16 *)a4 queryTermCount:(unint64_t)a5 attrType:(unint64_t)a6;
- (void)updateAttrCountsWord2:(unsigned __int16 *)a3 queryTermCount:(unint64_t)a4 attrType:(unint64_t)a5;
- (void)updateAttrCountsWord3:(unsigned __int16 *)a3 queryTermCount:(unint64_t)a4 attrType:(unint64_t)a5;
- (void)updateAttrCountsWord:(unsigned __int16 *)a3 queryTermCount:(unint64_t)a4 attrType:(unint64_t)a5;
- (void)updateBundleFeatures:(float *)a3 withArrValues:(float *)(a4 featureScoreInfo:;
- (void)updateNumScoreDescriptorBundleFeatures:(float *)a3 feature:(unint64_t)a4 featureScoreInfo:(PRSL2FeatureScoreInfo *)a5;
- (void)updateScoreDescriptorBundleFeatures:(float *)a3 feature:(unint64_t)a4;
@end

@implementation PRSRankingItem

- (float)staleDemotionWithCurrentTime:(double)a3 topicality:(float)a4
{
  -[PRSRankingItem mostRecentTimeToQueryInMinutesWithCurrentTime:topicality:](self, "mostRecentTimeToQueryInMinutesWithCurrentTime:topicality:", a3);
  float v6 = v5;
  [(PRSRankingItem *)self setMostRecentTimeToQueryInDaysForFreshness:(uint64_t)(float)(v5 / 1440.0)];
  return timeDecay(&unk_1F1864718, v6);
}

- (float)mostRecentTimeToQueryInMinutesWithCurrentTime:(double)a3 topicality:(float)a4
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  v7 = SSCompactRankingAttrsGetValue((int8x8_t *)[(PRSRankingItem *)self attributes], 9uLL);
  v8 = SSCompactRankingAttrsGetValue((int8x8_t *)[(PRSRankingItem *)self attributes], 0x20uLL);
  v9 = SSCompactRankingAttrsGetValue((int8x8_t *)[(PRSRankingItem *)self attributes], 0x6CuLL);
  v10 = SSCompactRankingAttrsGetValue((int8x8_t *)[(PRSRankingItem *)self attributes], 0x72uLL);
  [(PRSRankingItem *)self setStartDueDateToNowInSeconds:0];
  [(PRSRankingItem *)self setContentCreationDateToNowInSeconds:0];
  if (v8)
  {
    [v8 timeIntervalSinceReferenceDate];
    [(PRSRankingItem *)self setContentCreationDateToNowInSeconds:(uint64_t)(a3 - v11)];
  }
  if ([v9 count])
  {
    v12 = [v9 valueForKeyPath:@"@max.self"];
  }
  else
  {
    v12 = 0;
  }
  if ([v10 count])
  {
    v13 = [v10 valueForKeyPath:@"@max.self"];
  }
  else
  {
    v13 = 0;
  }
  v14 = [(PRSRankingItem *)self moreRecentDateFromDate1:v7 date2:v12];

  uint64_t v15 = [(PRSRankingItem *)self moreRecentDateFromDate1:v14 date2:v13];

  if (v15) {
    [(PRSRankingItem *)self setLastUsedDate:v15];
  }
  if (([(PRSRankingItem *)self bundleIDType] & 0x100) != 0)
  {
    uint64_t v18 = SSCompactRankingAttrsGetValue((int8x8_t *)[(PRSRankingItem *)self attributes], 0x15DuLL);
    if (v15 | v18)
    {
      id v19 = [(PRSRankingItem *)self moreRecentDateFromDate1:v15 date2:v18];
    }
    else
    {
      if (!v8 || ([v8 timeIntervalSinceReferenceDate], (a3 - v20) / 60.0 >= 5.0))
      {
        id v21 = 0;
        goto LABEL_35;
      }
      id v19 = v8;
    }
    id v21 = v19;
    goto LABEL_35;
  }
  if (([(PRSRankingItem *)self bundleIDType] & 4) != 0) {
    goto LABEL_28;
  }
  if (([(PRSRankingItem *)self bundleIDType] & 0x100000) != 0)
  {
    if (!v15)
    {
      SSCompactRankingAttrsGetValue((int8x8_t *)[(PRSRankingItem *)self attributes], 0x15EuLL);
      id v17 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_80;
    }
LABEL_45:
    id v21 = (id)v15;
    goto LABEL_46;
  }
  if (([(PRSRankingItem *)self bundleIDType] & 0x80) != 0
    || ([(PRSRankingItem *)self bundleIDType] & 0x10) != 0)
  {
LABEL_28:
    if (!v15) {
      goto LABEL_36;
    }
    goto LABEL_45;
  }
  if (([(PRSRankingItem *)self bundleIDType] & 2) != 0
    || ([(PRSRankingItem *)self bundleIDType] & 0x800) != 0)
  {
    if (v15) {
      id v36 = (id)v15;
    }
    uint64_t v18 = SSCompactRankingAttrsGetValue((int8x8_t *)[(PRSRankingItem *)self attributes], 0x19uLL);
    v37 = [(PRSRankingItem *)self moreRecentDateFromDate1:v15 date2:v8];

    id v21 = [(PRSRankingItem *)self moreRecentDateFromDate1:v37 date2:v18];

LABEL_35:
    if (!v21) {
      goto LABEL_36;
    }
    goto LABEL_46;
  }
  if (([(PRSRankingItem *)self bundleIDType] & 0x40) != 0)
  {
    v52 = SSCompactRankingAttrsGetValue((int8x8_t *)[(PRSRankingItem *)self attributes], 0x1DuLL);
    if (!v52)
    {
      [(PRSRankingItem *)self setStartDueDateToNowInSeconds:0x7FFFFFFFFFFFFFFFLL];
      goto LABEL_36;
    }
    id v21 = v52;
    [v52 timeIntervalSinceReferenceDate];
    [(PRSRankingItem *)self setStartDueDateToNowInSeconds:(uint64_t)(v53 - a3)];
    goto LABEL_46;
  }
  if (([(PRSRankingItem *)self bundleIDType] & 0x20) != 0)
  {
    SSCompactRankingAttrsGetValue((int8x8_t *)[(PRSRankingItem *)self attributes], 0x12uLL);
    id v21 = (id)objc_claimAutoreleasedReturnValue();
    v54 = SSCompactRankingAttrsGetValue((int8x8_t *)[(PRSRankingItem *)self attributes], 0x11uLL);
    uint64_t v18 = (uint64_t)v54;
    if (v54)
    {
      [v54 timeIntervalSinceReferenceDate];
      uint64_t v56 = (uint64_t)(v55 - a3);
    }
    else
    {
      uint64_t v56 = 0x7FFFFFFFFFFFFFFFLL;
    }
    [(PRSRankingItem *)self setStartDueDateToNowInSeconds:v56];
    goto LABEL_35;
  }
  if (([(PRSRankingItem *)self bundleIDType] & 0x20000000000000) == 0)
  {
    if (([(PRSRankingItem *)self bundleIDType] & 0x10000000000) != 0
      && ([(PRSRankingItem *)self lastUsedDate],
          v16 = objc_claimAutoreleasedReturnValue(),
          v16,
          v16)
      || ([(PRSRankingItem *)self bundleIDType] & 0x200000) != 0)
    {
      id v17 = [(PRSRankingItem *)self lastUsedDate];
    }
    else if (([(PRSRankingItem *)self bundleIDType] & 0x200) != 0)
    {
      id v17 = v8;
    }
    else
    {
      id v17 = [(PRSRankingItem *)self interestingDate];
    }
LABEL_80:
    id v21 = v17;
    if (!v17) {
      goto LABEL_36;
    }
LABEL_46:
    [v21 timeIntervalSinceReferenceDate];
    float v22 = (a3 - v23) / 60.0;
    [(PRSRankingItem *)self setMostRecentUseInMinutes:v22];
    if (([(PRSRankingItem *)self bundleIDType] & 0x100) != 0)
    {
      if (v22 <= 259200.0)
      {
        if (v22 > 1440.0)
        {
          float v68 = 0.0;
          SSCompactRankingAttrsGetFloat((uint64_t)[(PRSRankingItem *)self attributes], 0x154uLL, &v68);
          if (v68 < 5.0) {
            float v22 = 216000.0;
          }
        }
      }
      else
      {
        float v22 = 257760.0;
      }
      goto LABEL_105;
    }
    if (([(PRSRankingItem *)self bundleIDType] & 4) != 0)
    {
      if (v22 > 777600.0) {
        float v22 = 777600.0;
      }
      if (v22 < 0.0)
      {
        v24 = SSCompactRankingAttrsGetValue((int8x8_t *)[(PRSRankingItem *)self attributes], 0x3CuLL);
        if ([v24 count])
        {
          v63 = v13;
          long long v66 = 0u;
          long long v67 = 0u;
          long long v64 = 0u;
          long long v65 = 0u;
          v62 = v24;
          id v25 = v24;
          uint64_t v26 = [v25 countByEnumeratingWithState:&v64 objects:v69 count:16];
          if (v26)
          {
            uint64_t v27 = v26;
            uint64_t v28 = *(void *)v65;
            float v22 = 43200.0;
            do
            {
              for (uint64_t i = 0; i != v27; ++i)
              {
                if (*(void *)v65 != v28) {
                  objc_enumerationMutation(v25);
                }
                [*(id *)(*((void *)&v64 + 1) + 8 * i) timeIntervalSinceReferenceDate];
                float v31 = (a3 - v30) / 60.0;
                if (v22 > v31 && v31 > 0.0) {
                  float v22 = v31;
                }
              }
              uint64_t v27 = [v25 countByEnumeratingWithState:&v64 objects:v69 count:16];
            }
            while (v27);
          }
          else
          {
            float v22 = 43200.0;
          }

          v13 = v63;
          v24 = v62;
        }
      }
      goto LABEL_105;
    }
    if (([(PRSRankingItem *)self bundleIDType] & 0x80) == 0)
    {
      if (([(PRSRankingItem *)self bundleIDType] & 0x20) == 0)
      {
        if (([(PRSRankingItem *)self bundleIDType] & 0x40) != 0)
        {
          v38 = SSCompactRankingAttrsGetValue((int8x8_t *)[(PRSRankingItem *)self attributes], 0x1CuLL);
          v39 = SSCompactRankingAttrsGetValue((int8x8_t *)[(PRSRankingItem *)self attributes], 0x1DuLL);
          v40 = v39;
          if (v38)
          {
            [v38 timeIntervalSinceReferenceDate];
            if ((a3 - v41) / 60.0 > 1440.0) {
              float v22 = v22 + 129600.0;
            }
          }
          else if (v39)
          {
            [v39 timeIntervalSinceReferenceDate];
            float v44 = (v43 - a3) / 60.0;
            float v45 = v22 >= v44 ? v44 : v22;
            if (v44 < 1440.0 && v44 > 0.0) {
              float v22 = v45;
            }
          }

          goto LABEL_105;
        }
        if (([(PRSRankingItem *)self bundleIDType] & 0x100000) == 0)
        {
          if (([(PRSRankingItem *)self bundleIDType] & 0x300460000000200) != 0)
          {
            float v22 = fminf(v22, 259200.0);
          }
          else if (([(PRSRankingItem *)self bundleIDType] & 0x1080000000000) != 0)
          {
            float v22 = 259200.0;
          }
          goto LABEL_105;
        }
        float v68 = 0.0;
        SSCompactRankingAttrsGetFloat((uint64_t)[(PRSRankingItem *)self attributes], 0x162uLL, &v68);
        float v22 = dbl_1BDC5DA60[v68 > 0.0] + v22;
        if (v22 >= 1576800.0) {
          goto LABEL_105;
        }
        if (v22 <= 777600.0)
        {
          if (v22 <= 525600.0)
          {
            if (v22 <= 129600.0)
            {
              float v35 = 43200.0;
              if (v22 <= 43200.0) {
                goto LABEL_105;
              }
            }
            else
            {
              float v35 = 172800.0;
            }
          }
          else
          {
            float v35 = 345600.0;
          }
          goto LABEL_104;
        }
        goto LABEL_94;
      }
      if (v22 > 10080.0)
      {
        float v35 = 777600.0;
LABEL_104:
        float v22 = v22 + v35;
        goto LABEL_105;
      }
      if (v22 > 1440.0)
      {
LABEL_94:
        float v35 = 518400.0;
        goto LABEL_104;
      }
      if (v22 <= 0.0)
      {
        if (v22 < 0.0) {
          float v22 = -v22;
        }
        goto LABEL_105;
      }
    }
    float v35 = 43200.0;
    goto LABEL_104;
  }
  v57 = SSCompactRankingAttrsGetValue((int8x8_t *)[(PRSRankingItem *)self attributes], 0x11uLL);
  v58 = v57;
  if (v57)
  {
    [v57 timeIntervalSinceReferenceDate];
    uint64_t v60 = (uint64_t)(v59 - a3);
  }
  else
  {
    uint64_t v60 = 0x7FFFFFFFFFFFFFFFLL;
  }
  [(PRSRankingItem *)self setStartDueDateToNowInSeconds:v60];

LABEL_36:
  if (([(PRSRankingItem *)self bundleIDType] & 0x100) != 0)
  {
    id v21 = 0;
    float v22 = 129600.0;
    goto LABEL_105;
  }
  if (([(PRSRankingItem *)self bundleIDType] & 4) != 0)
  {
    id v21 = 0;
    if (a4 > 0.96)
    {
      float v22 = 259200.0;
      goto LABEL_105;
    }
    BOOL v33 = a4 < 0.9;
    v34 = (float *)&unk_1BDC5D920;
LABEL_84:
    float v22 = v34[v33];
    goto LABEL_105;
  }
  if (([(PRSRankingItem *)self bundleIDType] & 0x10) != 0)
  {
    id v21 = 0;
    BOOL v33 = a4 > 0.6;
    v34 = (float *)&unk_1BDC5D928;
    goto LABEL_84;
  }
  float v22 = 259200.0;
  if (([(PRSRankingItem *)self bundleIDType] & 0x80) == 0
    && ([(PRSRankingItem *)self bundleIDType] & 0x200) == 0
    && ([(PRSRankingItem *)self bundleIDType] & 0x3816F0000000001) == 0)
  {
    if (([(PRSRankingItem *)self bundleIDType] & 0x100000000000) != 0)
    {
      id v21 = 0;
      float v22 = 302400.0;
      goto LABEL_105;
    }
    v47 = [(PRSRankingItem *)self sectionBundleIdentifier];
    char v48 = [v47 hasPrefix:@"com.apple.parsec"];

    if ((v48 & 1) == 0)
    {
      if (([(PRSRankingItem *)self bundleIDType] & 0x200000) != 0)
      {
        v61 = SSCompactRankingAttrsGetValue((int8x8_t *)[(PRSRankingItem *)self attributes], 0x48uLL);
        v50 = v61;
        if (a4 > 0.6
          && objc_msgSend(v61, "length", a4)
          && ([v50 isEqualToString:@"com.apple.Preferences"] & 1) != 0)
        {
          float v22 = 43200.0;
        }
        else
        {
          float v22 = 129600.0;
        }
      }
      else
      {
        if (([(PRSRankingItem *)self bundleIDType] & 0x40) != 0)
        {
          id v21 = 0;
          float v22 = 518400.0;
          goto LABEL_105;
        }
        if (([(PRSRankingItem *)self bundleIDType] & 0x1800000) == 0)
        {
          id v21 = 0;
          float v22 = 777600.0;
          goto LABEL_105;
        }
        v49 = SSCompactRankingAttrsGetValue((int8x8_t *)[(PRSRankingItem *)self attributes], 0x24uLL);
        v50 = v49;
        if (v49)
        {
          [v49 timeIntervalSinceReferenceDate];
          float v22 = (v51 - a3) / 60.0 + 259200.0;
        }
        else
        {
          float v22 = 777600.0;
        }
      }
    }
  }
  id v21 = 0;
LABEL_105:

  return v22;
}

- (void)calculateFreshnessForSearchTool:(double)a3
{
  if (([(PRSRankingItem *)self bundleIDType] & 0x100000) != 0)
  {
    float v5 = SSCompactRankingAttrsGetValue((int8x8_t *)[(PRSRankingItem *)self attributes], 0x15EuLL);
    id v10 = v5;
    if (v5)
    {
      [v5 timeIntervalSinceReferenceDate];
      float v7 = fmax((a3 - v6) / 86400.0, 0.0);
    }
    else
    {
      float v7 = 545.0;
    }
    float v8 = flt_1BDC5D938[v7 < 365.0];
    if (v7 >= 365.0) {
      double v9 = 34.6271935;
    }
    else {
      double v9 = 1.0;
    }
    [(PRSRankingItem *)self setMostRecentTimeToQueryInDaysForFreshness:(uint64_t)v7];
    [(PRSRankingItem *)self setFreshnessScore:(double)(v9 * exp((float)-(float)(v8 * v7)))];
  }
}

- (float)inSpotlightEngagementScoreWithEvaluator:(id)a3 currentTime:(double)a4 queriesInSpotlight:(id)a5 datesInSpotlight:(id)a6 queriesInSpotlightNonUnique:(id)a7 datesInSpotlightNonUnique:(id)a8 launchString:(id)a9 lastUsedDate:(id)a10 topicalityScore:(float)a11
{
  id v18 = a3;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v75 = a9;
  id v23 = a10;
  v78 = v20;
  uint64_t v24 = [v20 count];
  uint64_t v25 = [v19 count];
  uint64_t v26 = [v22 count];
  v76 = v21;
  uint64_t v27 = [v21 count];
  if (v24 && v25 && v24 == v25 && v26 == v27)
  {
    id v73 = v23;
    uint64_t v28 = 0;
    float v29 = 0.0;
    while (1)
    {
      double v30 = objc_msgSend(v19, "objectAtIndexedSubscript:", v28, v73);
      +[PRSRankingItem matchScoreLaunchString:v30 withEvaluator:v18];
      float v32 = v31;

      if (v32 == 1.0) {
        [(PRSRankingItem *)self setExactMatchedLaunchString:1];
      }
      double v33 = v32;
      if (v32 < 0.01)
      {
        id v34 = objc_alloc(MEMORY[0x1E4F237B8]);
        float v35 = [v19 objectAtIndexedSubscript:v28];
        id v36 = [v18 language];
        v37 = (void *)[v34 initWithQuery:v35 language:v36 fuzzyThreshold:0 options:0];

        v38 = [v18 queryString];
        +[PRSRankingItem matchScoreLaunchString:v38 withEvaluator:v37];
        float v40 = v39;

        if (v40 > 0.9) {
          float v32 = v40;
        }
      }
      if (v32 == 0.0) {
        goto LABEL_17;
      }
      double v41 = objc_msgSend(v20, "objectAtIndexedSubscript:", v28, v33);
      [v41 timeIntervalSinceReferenceDate];
      float v43 = (a4 - v42) / 60.0;

      if (v43 > 0.0) {
        break;
      }
LABEL_19:
      if (v24 == ++v28)
      {
        float v44 = [MEMORY[0x1E4F1CA48] array];
        if (v26)
        {
          uint64_t v45 = 0;
          unint64_t v46 = 0x1E4F1C000uLL;
          id v74 = v22;
          do
          {
            v47 = [v22 objectAtIndexedSubscript:v45];
            objc_opt_class();
            char isKindOfClass = objc_opt_isKindOfClass();

            if (isKindOfClass)
            {
              v49 = [v22 objectAtIndexedSubscript:v45];
              [v49 timeIntervalSinceReferenceDate];
              double v51 = (a4 - v50) / 60.0;

              if (v51 < 10080.0)
              {
                v52 = [v76 objectAtIndexedSubscript:v45];
                +[PRSRankingItem matchScoreLaunchString:v52 withEvaluator:v18];
                float v54 = v53;

                double v55 = v54;
                if (v54 < 0.01)
                {
                  id v56 = objc_alloc(MEMORY[0x1E4F237B8]);
                  v57 = [v76 objectAtIndexedSubscript:v45];
                  [v18 language];
                  uint64_t v58 = v26;
                  unint64_t v59 = v46;
                  v61 = uint64_t v60 = v44;
                  v62 = (void *)[v56 initWithQuery:v57 language:v61 fuzzyThreshold:0 options:0];

                  v63 = [v18 queryString];
                  +[PRSRankingItem matchScoreLaunchString:v63 withEvaluator:v62];
                  float v65 = v64;

                  float v44 = v60;
                  unint64_t v46 = v59;
                  uint64_t v26 = v58;
                  id v22 = v74;

                  double v55 = v65;
                }
                if (v55 > 0.9)
                {
                  long long v66 = [v22 objectAtIndexedSubscript:v45];
                  [v44 addObject:v66];
                }
              }
            }
            ++v45;
          }
          while (v26 != v45);
        }
        if ((unint64_t)[v44 count] > 1)
        {
          [v44 sortWithOptions:1 usingComparator:&__block_literal_global_104];
          if ((unint64_t)[v44 count] >= 3) {
            objc_msgSend(v44, "removeObjectsInRange:", 2, objc_msgSend(v44, "count") - 2);
          }
        }
        long long v67 = [MEMORY[0x1E4F1C978] arrayWithArray:v44];
        [(PRSRankingItem *)self setRecentSimilarIntentEngagementDates:v67];

        float v68 = v75;
        id v23 = v73;
        goto LABEL_42;
      }
    }
    if (v32 <= a11) {
      float v32 = a11;
    }
    float v32 = v32 * timeDecay(&unk_1F1864730, v43);
LABEL_17:
    if (v32 >= v29) {
      float v29 = v32;
    }
    goto LABEL_19;
  }
  float v68 = v75;
  if ([v75 length])
  {
    +[PRSRankingItem matchScoreLaunchString:v75 withEvaluator:v18];
    float v29 = v69;
    if (v69 == 1.0) {
      [(PRSRankingItem *)self setExactMatchedLaunchString:1];
    }
    if (v29 <= a11) {
      float v29 = a11;
    }
    if (v23)
    {
      [v23 timeIntervalSinceReferenceDate];
      float v71 = (a4 - v70) / 60.0;
      if (v71 > 0.0) {
        float v29 = v29 * timeDecay(&unk_1F1864730, v71);
      }
    }
  }
  else
  {
    float v29 = 0.0;
  }
LABEL_42:

  return v29;
}

uint64_t __211__PRSRankingItem_Scoring__inSpotlightEngagementScoreWithEvaluator_currentTime_queriesInSpotlight_datesInSpotlight_queriesInSpotlightNonUnique_datesInSpotlightNonUnique_launchString_lastUsedDate_topicalityScore___block_invoke(uint64_t a1, void *a2)
{
  return -objc_msgSend(a2, "compare:");
}

+ (float)inAppEngagementScoreWithEvaluator:(id)a3 currentTime:(double)a4 queriesInApp:(id)a5 datesInApp:(id)a6 topicalityScore:(float)a7
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [v13 count];
  uint64_t v15 = [v12 count];
  float v16 = 0.0;
  if (v14 && v15 && v14 == v15)
  {
    uint64_t v17 = 0;
    while (1)
    {
      id v18 = [v12 objectAtIndexedSubscript:v17];
      +[PRSRankingItem matchScoreLaunchString:v18 withEvaluator:v11];
      float v20 = v19;

      if (v20 <= 0.0) {
        goto LABEL_10;
      }
      id v21 = [v13 objectAtIndexedSubscript:v17];
      [v21 timeIntervalSinceReferenceDate];
      float v23 = (a4 - v22) / 60.0;

      if (v23 > 0.0) {
        break;
      }
LABEL_12:
      if (v14 == ++v17) {
        goto LABEL_13;
      }
    }
    if (v20 <= a7) {
      float v20 = a7;
    }
    float v20 = v20 * timeDecay(&unk_1F1864730, v23);
LABEL_10:
    if (v20 >= v16) {
      float v16 = v20;
    }
    goto LABEL_12;
  }
LABEL_13:

  return v16;
}

+ (float)outOfSpotlightEngagementScore:(double)a3 datesOutOfSpotlight:(id)a4 topicalityScore:(float)a5 alternativeOutOfSpotlightCount:(float)a6
{
  id v9 = a4;
  uint64_t v10 = [v9 count];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = 0;
    if (a5 >= 1.0) {
      float v13 = a5;
    }
    else {
      float v13 = 1.0;
    }
    float v14 = 0.0;
    do
    {
      uint64_t v15 = [v9 objectAtIndexedSubscript:v12];
      [v15 timeIntervalSinceReferenceDate];
      float v17 = (a3 - v16) / 60.0;

      if (v17 > 0.0)
      {
        float v18 = v13 * timeDecay(&unk_1F1864730, v17);
        if (v18 >= v14) {
          float v14 = v18;
        }
      }
      ++v12;
    }
    while (v11 != v12);
  }
  else
  {
    float v19 = 1.0;
    if (a6 < 5.0) {
      float v19 = 0.5;
    }
    if (a6 == 0.0) {
      float v14 = 0.0;
    }
    else {
      float v14 = v19;
    }
  }

  return v14;
}

- (float)engagementScoreWithEvaluator:(id)a3 currentTime:(double)a4 launchString:(id)a5 topicalityScore:(float)a6
{
  id v10 = a5;
  id v11 = a3;
  uint64_t v12 = SSCompactRankingAttrsGetValue((int8x8_t *)[(PRSRankingItem *)self attributes], 0x6CuLL);
  float v13 = SSCompactRankingAttrsGetValue((int8x8_t *)[(PRSRankingItem *)self attributes], 0x6DuLL);
  id v34 = SSCompactRankingAttrsGetValue((int8x8_t *)[(PRSRankingItem *)self attributes], 0x6FuLL);
  double v33 = SSCompactRankingAttrsGetValue((int8x8_t *)[(PRSRankingItem *)self attributes], 0x70uLL);
  float v14 = SSCompactRankingAttrsGetValue((int8x8_t *)[(PRSRankingItem *)self attributes], 0x72uLL);
  uint64_t v15 = SSCompactRankingAttrsGetValue((int8x8_t *)[(PRSRankingItem *)self attributes], 0x73uLL);
  double v16 = SSCompactRankingAttrsGetValue((int8x8_t *)[(PRSRankingItem *)self attributes], 0x74uLL);
  float v17 = SSCompactRankingAttrsGetValue((int8x8_t *)[(PRSRankingItem *)self attributes], 9uLL);
  if ([v10 length]
    || [v12 count]
    && [v13 count]
    && (uint64_t v32 = [v12 count], v32 == objc_msgSend(v13, "count")))
  {
    [(PRSRankingItem *)self setWasEngaged:1];
    [(PRSRankingItem *)self setWasEngagedInSpotlight:1];
  }
  *(float *)&double v18 = a6;
  [(PRSRankingItem *)self inSpotlightEngagementScoreWithEvaluator:v11 currentTime:v13 queriesInSpotlight:v12 datesInSpotlight:v33 queriesInSpotlightNonUnique:v34 datesInSpotlightNonUnique:v10 launchString:a4 lastUsedDate:v18 topicalityScore:v17];
  float v20 = v19;
  *(float *)&double v21 = a6;
  +[PRSRankingItem inAppEngagementScoreWithEvaluator:v11 currentTime:v15 queriesInApp:v14 datesInApp:a4 topicalityScore:v21];
  float v23 = v22;

  if (SSEnableSpotlightPersonalizedRanking2024())
  {
    int v35 = 0;
    unint64_t v24 = [(PRSRankingItem *)self bundleIDType];
    double v26 = 0.0;
    if ((v24 & 0x200000) != 0)
    {
      SSCompactRankingAttrsGetFloat((uint64_t)[(PRSRankingItem *)self attributes], 0x75uLL, &v35);
      LODWORD(v26) = v35;
    }
    *(float *)&double v25 = a6;
    +[PRSRankingItem outOfSpotlightEngagementScore:v16 datesOutOfSpotlight:a4 topicalityScore:v25 alternativeOutOfSpotlightCount:v26];
    float v28 = 1.0;
    if (v20 > 0.0) {
      float v28 = 0.5;
    }
    double v29 = v20 + v23 * 0.2 + (float)(v28 * v27);
  }
  else
  {
    double v29 = v20 + v23 * 0.2;
  }
  float v30 = fmin(v29, 1.0);

  return v30;
}

- (int64_t)itemSparseMatchStrengthTypeWithEvaluator:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v24 = a3;
  v4 = [v24 language];
  float v23 = self;
  float v5 = [(PRSRankingItem *)self getMatchInfoDictionaryWithKeyboardLanguage:v4];

  double v6 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = v5;
  uint64_t v26 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v26)
  {
    uint64_t v25 = *(void *)v34;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v34 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v28 = v7;
        uint64_t v8 = *(void *)(*((void *)&v33 + 1) + 8 * v7);
        id v9 = [obj objectForKeyedSubscript:v8];
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v29 objects:v37 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v30;
          do
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v30 != v12) {
                objc_enumerationMutation(v9);
              }
              float v14 = *(void **)(*((void *)&v29 + 1) + 8 * i);
              uint64_t v15 = [v14 original];
              double v16 = [v6 objectForKey:v15];

              if (v16)
              {
                [v16 addObject:v8];
              }
              else
              {
                double v16 = [MEMORY[0x1E4F1CA80] setWithObject:v8];
                float v17 = [v14 original];
                [v6 setObject:v16 forKey:v17];
              }
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v29 objects:v37 count:16];
          }
          while (v11);
        }

        uint64_t v7 = v28 + 1;
      }
      while (v28 + 1 != v26);
      uint64_t v26 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v26);
  }

  if (([(PRSRankingItem *)v23 bundleIDType] & 0x80) != 0)
  {
    float v20 = (void *)[v6 copy];
    double v18 = v24;
    uint64_t v21 = [(PRSRankingItem *)v23 itemSparseMatchStrengthTypeForSafariWithEvaluator:v24 attributeMatchesForToken:v20];
LABEL_33:
    int64_t v19 = v21;

    goto LABEL_34;
  }
  double v18 = v24;
  if (([(PRSRankingItem *)v23 bundleIDType] & 2) != 0)
  {
    float v20 = (void *)[v6 copy];
    uint64_t v21 = [(PRSRankingItem *)v23 itemSparseMatchStrengthTypeForNotesWithEvaluator:v24 attributeMatchesForToken:v20];
    goto LABEL_33;
  }
  if (([(PRSRankingItem *)v23 bundleIDType] & 0x800) != 0)
  {
    float v20 = (void *)[v6 copy];
    uint64_t v21 = [(PRSRankingItem *)v23 itemSparseMatchStrengthTypeForFilesWithEvaluator:v24 attributeMatchesForToken:v20];
    goto LABEL_33;
  }
  if (([(PRSRankingItem *)v23 bundleIDType] & 0x20) != 0)
  {
    float v20 = (void *)[v6 copy];
    uint64_t v21 = [(PRSRankingItem *)v23 itemSparseMatchStrengthTypeForCalendarWithEvaluator:v24 attributeMatchesForToken:v20];
    goto LABEL_33;
  }
  if (([(PRSRankingItem *)v23 bundleIDType] & 0x40) != 0)
  {
    float v20 = (void *)[v6 copy];
    uint64_t v21 = [(PRSRankingItem *)v23 itemSparseMatchStrengthTypeForRemindersWithEvaluator:v24 attributeMatchesForToken:v20];
    goto LABEL_33;
  }
  if (([(PRSRankingItem *)v23 bundleIDType] & 0x100000) != 0)
  {
    float v20 = (void *)[v6 copy];
    uint64_t v21 = [(PRSRankingItem *)v23 itemSparseMatchStrengthTypeForMailWithEvaluator:v24 attributeMatchesForToken:v20];
    goto LABEL_33;
  }
  if (([(PRSRankingItem *)v23 bundleIDType] & 8) != 0)
  {
    float v20 = (void *)[v6 copy];
    uint64_t v21 = [(PRSRankingItem *)v23 itemSparseMatchStrengthTypeForMessagesWithEvaluator:v24 attributeMatchesForToken:v20];
    goto LABEL_33;
  }
  int64_t v19 = 3;
LABEL_34:

  return v19;
}

- (int64_t)itemSparseMatchStrengthTypeForSafariWithEvaluator:(id)a3 attributeMatchesForToken:(id)a4
{
  return 3;
}

- (int64_t)itemSparseMatchStrengthTypeForMailWithEvaluator:(id)a3 attributeMatchesForToken:(id)a4
{
  uint64_t v115 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v109 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  id v86 = v5;
  id obj = [v5 itemQPQUOutputTokenInfo];
  uint64_t v7 = [obj countByEnumeratingWithState:&v109 objects:v114 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    long long v103 = 0uLL;
    uint64_t v101 = 0;
    uint64_t v102 = 0;
    uint64_t v99 = 0;
    uint64_t v100 = 0;
    uint64_t v98 = 0;
    uint64_t v104 = 0;
    uint64_t v9 = *(void *)v110;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v110 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v109 + 1) + 8 * i);
        uint64_t v12 = [v11 objectForKeyedSubscript:@"kQPQUOutputToken"];
        float v13 = [v11 objectForKeyedSubscript:@"kQPQUOutputTokenArgScores"];
        float v14 = [v11 objectForKeyedSubscript:@"kQPQUOutputTokenArgLabels"];
        uint64_t v15 = [v6 objectForKey:v12];
        HIDWORD(v104) += [v14 isEqualToString:@"ARG_MEDIA_TYPE"];
        if (v15)
        {
          int v16 = [v14 isEqualToString:@"ARG_UNSPECIFIED"] ^ 1;
          int v17 = [v15 containsObject:@"kMDItemSubject"];
          HIDWORD(v100) += v17;
          if (v17) {
            int v18 = v16;
          }
          else {
            int v18 = 0;
          }
          LODWORD(v104) = v18 + v104;
          int v19 = [v15 containsObject:@"kMDItemTextContent"];
          if (v19) {
            int v20 = v16;
          }
          else {
            int v20 = 0;
          }
          HIDWORD(v103) += v20;
          HIDWORD(v99) += v19;
          int v21 = [v15 containsObject:@"kMDItemAuthors"];
          if (v21) {
            int v22 = v16;
          }
          else {
            int v22 = 0;
          }
          DWORD2(v103) += v22;
          LODWORD(v100) = v100 + v21;
          if ([v15 containsObject:@"kMDItemAuthorEmailAddresses"]) {
            int v23 = v16;
          }
          else {
            int v23 = 0;
          }
          DWORD1(v103) += v23;
          int v24 = [v15 containsObject:@"kMDItemRecipients"];
          if (v24) {
            int v25 = v16;
          }
          else {
            int v25 = 0;
          }
          HIDWORD(v101) += v25;
          HIDWORD(v98) += v24;
          if ([v15 containsObject:@"kMDItemRecipientEmailAddresses"]) {
            int v26 = v16;
          }
          else {
            int v26 = 0;
          }
          HIDWORD(v102) += v26;
          if ([v15 containsObject:@"kMDItemEmailAddresses"]) {
            int v27 = v16;
          }
          else {
            int v27 = 0;
          }
          LODWORD(v102) = v27 + v102;
          int v28 = [v15 containsObject:@"kMDItemAttachmentNames"];
          if (v28) {
            int v29 = v16;
          }
          else {
            int v29 = 0;
          }
          LODWORD(v101) = v29 + v101;
          LODWORD(v98) = v98 + v28;
          int v30 = [v15 containsObject:@"kMDItemAttachmentTypes"];
          if (v30) {
            int v31 = v16;
          }
          else {
            int v31 = 0;
          }
          LODWORD(v103) = v31 + v103;
          LODWORD(v99) = v99 + v30;
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v109 objects:v114 count:16];
    }
    while (v8);
  }
  else
  {
    long long v103 = 0uLL;
    uint64_t v101 = 0;
    uint64_t v102 = 0;
    uint64_t v99 = 0;
    uint64_t v100 = 0;
    uint64_t v98 = 0;
    uint64_t v104 = 0;
  }

  id obja = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"\\S+" options:1 error:0];
  long long v105 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  id v32 = v6;
  uint64_t v33 = [v32 countByEnumeratingWithState:&v105 objects:v113 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    unint64_t v94 = 0;
    unint64_t v95 = 0;
    uint64_t v92 = 0;
    unint64_t v93 = 0;
    uint64_t v91 = 0;
    int v35 = 0;
    int v90 = 0;
    uint64_t v89 = *(void *)v106;
    long long v36 = v86;
    id v85 = v32;
    do
    {
      uint64_t v37 = 0;
      uint64_t v87 = v34;
      do
      {
        if (*(void *)v106 != v89) {
          objc_enumerationMutation(v32);
        }
        v38 = *(void **)(*((void *)&v105 + 1) + 8 * v37);
        unint64_t v39 = objc_msgSend(obja, "numberOfMatchesInString:options:range:", v38, 0, 0, objc_msgSend(v38, "length", v85));
        float v40 = [v36 queryString];
        int v41 = [v40 localizedCaseInsensitiveContainsString:v38];

        if (v41) {
          BOOL v42 = v39 >= 2;
        }
        else {
          BOOL v42 = 0;
        }
        if (v42)
        {
          float v43 = [v32 objectForKey:v38];
          int v44 = [v43 containsObject:@"kMDItemSubject"];
          int v45 = [v43 containsObject:@"kMDItemTextContent"];
          int v46 = [v43 containsObject:@"kMDItemAuthors"];
          int v47 = [v43 containsObject:@"kMDItemRecipients"];
          int v48 = v35;
          int v49 = [v43 containsObject:@"kMDItemAttachmentNames"];
          int v50 = [v43 containsObject:@"kMDItemAttachmentTypes"];
          BOOL v51 = v39 == 2;
          unsigned int v53 = v95;
          unsigned int v52 = HIDWORD(v95);
          int v54 = v44;
          unsigned int v55 = HIDWORD(v95) + v44;
          int v56 = HIDWORD(v92);
          unsigned int v57 = v93;
          unsigned int v58 = v93 + v45;
          unsigned int v60 = v94;
          unsigned int v59 = HIDWORD(v94);
          unsigned int v61 = v94 + v46;
          int v63 = HIDWORD(v91);
          int v62 = v92;
          int v64 = HIDWORD(v91) + v47;
          int v66 = v90;
          int v65 = v91;
          int v67 = v90 + v49;
          int v88 = HIDWORD(v92) + v50;
          unsigned int v68 = HIDWORD(v94) + v45;
          unsigned int v69 = HIDWORD(v93);
          unsigned int v70 = HIDWORD(v93) + v46;
          int v71 = v92 + v47;
          id v32 = v85;
          long long v36 = v86;
          int v72 = v48 + v49;
          int v35 = v48;
          uint64_t v34 = v87;
          int v73 = v91 + v50;
          if (v51) {
            unsigned int v53 = v95 + v54;
          }
          if (!v51) {
            unsigned int v52 = v55;
          }
          unint64_t v95 = __PAIR64__(v52, v53);
          if (v51) {
            unsigned int v59 = v68;
          }
          if (v51) {
            unsigned int v69 = v70;
          }
          else {
            unsigned int v57 = v58;
          }
          unint64_t v93 = __PAIR64__(v69, v57);
          if (!v51) {
            unsigned int v60 = v61;
          }
          unint64_t v94 = __PAIR64__(v59, v60);
          if (v51) {
            int v62 = v71;
          }
          if (!v51) {
            int v63 = v64;
          }
          HIDWORD(v91) = v63;
          LODWORD(v92) = v62;
          if (v51) {
            int v35 = v72;
          }
          if (v51) {
            int v65 = v73;
          }
          else {
            int v66 = v67;
          }
          int v90 = v66;
          LODWORD(v91) = v65;
          if (!v51) {
            int v56 = v88;
          }
          HIDWORD(v92) = v56;
        }
        ++v37;
      }
      while (v34 != v37);
      uint64_t v34 = [v32 countByEnumeratingWithState:&v105 objects:v113 count:16];
    }
    while (v34);
  }
  else
  {
    unint64_t v94 = 0;
    unint64_t v95 = 0;
    uint64_t v92 = 0;
    unint64_t v93 = 0;
    uint64_t v91 = 0;
    int v35 = 0;
    int v90 = 0;
    long long v36 = v86;
  }

  if ([v36 countQPUSpecialToken] != 1 || (int64_t v74 = 0, !v104) && !*(void *)((char *)&v103 + 4))
  {
    unsigned int v75 = v101
        + HIDWORD(v101)
        + DWORD2(v103)
        + DWORD1(v103)
        + HIDWORD(v102)
        + v102
        + v103
        + HIDWORD(v103)
        + v104
        + HIDWORD(v104);
    if ([v36 countQPUSpecialToken])
    {
      int64_t v74 = 0;
      if (DWORD2(v103)) {
        goto LABEL_105;
      }
      if (v104 > 1) {
        goto LABEL_105;
      }
      if (HIDWORD(v103) > 2) {
        goto LABEL_105;
      }
      int64_t v74 = 0;
      if (HIDWORD(v104) + (int)v104 + HIDWORD(v103) >= v75
        || HIDWORD(v104) + (int)v104 >= v75
        || HIDWORD(v104) + HIDWORD(v103) >= v75
        || HIDWORD(v95))
      {
        goto LABEL_105;
      }
    }
    else if (HIDWORD(v95))
    {
      goto LABEL_104;
    }
    int64_t v74 = 0;
    if (v95 || v94 || v93 || HIDWORD(v94) > 1) {
      goto LABEL_105;
    }
    if (HIDWORD(v100) && v100) {
      goto LABEL_104;
    }
    BOOL v76 = v100 != 0;
    if (v100)
    {
      if (HIDWORD(v94)) {
        goto LABEL_104;
      }
    }
    int v77 = HIDWORD(v91) + v92 + v35 + v90 + v91;
    if (!(v77 + HIDWORD(v92))) {
      BOOL v76 = 0;
    }
    if (v76)
    {
LABEL_104:
      int64_t v74 = 0;
      goto LABEL_105;
    }
    int64_t v74 = 1;
    if (HIDWORD(v103) <= 1 && HIDWORD(v94) != 1)
    {
      if (HIDWORD(v100) && HIDWORD(v99))
      {
        int64_t v74 = 1;
      }
      else
      {
        int v79 = v98 + HIDWORD(v98);
        if (HIDWORD(v99)) {
          BOOL v80 = v100 != 0;
        }
        else {
          BOOL v80 = 0;
        }
        if (v79 + v99) {
          BOOL v81 = HIDWORD(v100) != 0;
        }
        else {
          BOOL v81 = 0;
        }
        if (v79 + v99) {
          BOOL v82 = v100 != 0;
        }
        else {
          BOOL v82 = 0;
        }
        if (v79 + v99) {
          BOOL v83 = HIDWORD(v99) > 1;
        }
        else {
          BOOL v83 = 0;
        }
        int64_t v74 = 1;
        if (!v81 && !v80 && !v82 && v77 == -HIDWORD(v92) && !v83)
        {
          if (v104
            || (unsigned int v84 = v101 + HIDWORD(v101) + v103, HIDWORD(v103) == 1) && v84
            || v84 && v84 >= v75
            || HIDWORD(v99)
            || v79 != -(int)v99)
          {
            int64_t v74 = 2;
          }
          else
          {
            int64_t v74 = 3;
          }
        }
      }
    }
  }
LABEL_105:

  return v74;
}

- (int64_t)itemSparseMatchStrengthTypeForMessagesAndCalendarWithEvaluator:(id)a3 attributeMatchesForToken:(id)a4
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v54 = a4;
  id v56 = v5;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id obj = [v5 itemQPQUOutputTokenInfo];
  uint64_t v6 = [obj countByEnumeratingWithState:&v66 objects:v71 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v59 = 0;
    uint64_t v60 = 0;
    uint64_t v58 = 0;
    uint64_t v53 = 0;
    int v57 = 0;
    int v8 = 0;
    uint64_t v9 = *(void *)v67;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v67 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v66 + 1) + 8 * i);
        uint64_t v12 = [v11 objectForKeyedSubscript:@"kQPQUOutputToken"];
        float v13 = [v11 objectForKeyedSubscript:@"kQPQUOutputTokenArgScores"];
        float v14 = [v11 objectForKeyedSubscript:@"kQPQUOutputTokenArgLabels"];
        uint64_t v15 = [v54 objectForKey:v12];
        int v16 = [v14 isEqualToString:@"ARG_MEDIA_TYPE"];
        if (v15)
        {
          int v17 = [v14 isEqualToString:@"ARG_UNSPECIFIED"] ^ 1;
          if ((([(PRSRankingItem *)self bundleIDType] & 8) != 0
             || ([(PRSRankingItem *)self bundleIDType] & 0x40) != 0)
            && ([v15 containsObject:@"kMDItemTextContent"] & 1) != 0
            || ([(PRSRankingItem *)self bundleIDType] & 0x20) != 0
            && [v15 containsObject:@"kMDItemTitle"])
          {
            HIDWORD(v53) += v17;
            LODWORD(v53) = v53 + 1;
          }
          int v18 = [v15 containsObject:@"kMDItemAuthors"];
          if (v18) {
            int v19 = v17;
          }
          else {
            int v19 = 0;
          }
          HIDWORD(v60) += v19;
          HIDWORD(v59) += v18;
          if ([v15 containsObject:@"kMDItemAuthorEmailAddresses"]) {
            int v20 = v17;
          }
          else {
            int v20 = 0;
          }
          LODWORD(v60) = v20 + v60;
          int v21 = [v15 containsObject:@"kMDItemRecipients"];
          if (v21) {
            int v22 = v17;
          }
          else {
            int v22 = 0;
          }
          LODWORD(v59) = v22 + v59;
          LODWORD(v58) = v58 + v21;
          int v23 = [v15 containsObject:@"kMDItemRecipientEmailAddresses"];
          if (v23) {
            int v24 = v17;
          }
          else {
            int v24 = 0;
          }
          HIDWORD(v58) += v24;
          v57 += v23;
        }
        v8 += v16;
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v66 objects:v71 count:16];
    }
    while (v7);
  }
  else
  {
    uint64_t v59 = 0;
    uint64_t v60 = 0;
    uint64_t v58 = 0;
    uint64_t v53 = 0;
    int v57 = 0;
    int v8 = 0;
  }

  int v25 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"\\S+" options:1 error:0];
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id v26 = v54;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v62 objects:v70 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v49 = 0;
    uint64_t v50 = 0;
    int obja = 0;
    int v55 = 0;
    uint64_t v29 = *(void *)v63;
    int v30 = v56;
    do
    {
      for (uint64_t j = 0; j != v28; ++j)
      {
        if (*(void *)v63 != v29) {
          objc_enumerationMutation(v26);
        }
        id v32 = *(void **)(*((void *)&v62 + 1) + 8 * j);
        unint64_t v33 = objc_msgSend(v25, "numberOfMatchesInString:options:range:", v32, 0, 0, objc_msgSend(v32, "length"));
        uint64_t v34 = [v30 queryString];
        int v35 = [v34 localizedCaseInsensitiveContainsString:v32];

        if (v35) {
          BOOL v36 = v33 >= 2;
        }
        else {
          BOOL v36 = 0;
        }
        if (v36)
        {
          uint64_t v37 = [v26 objectForKey:v32];
          char v38 = [(PRSRankingItem *)self bundleIDType];
          unint64_t v39 = @"kMDItemTitle";
          if (v33 == 2)
          {
            int v30 = v56;
            if ((v38 & 0x20) != 0
              || (char v40 = [(PRSRankingItem *)self bundleIDType],
                  unint64_t v39 = @"kMDItemTitle",
                  (v40 & 0x40) != 0)
              || (char v41 = [(PRSRankingItem *)self bundleIDType],
                  unint64_t v39 = @"kMDItemTextContent",
                  (v41 & 8) != 0))
            {
              LODWORD(v49) = v49 + [v37 containsObject:v39];
            }
            obja += [v37 containsObject:@"kMDItemAuthors"];
            LODWORD(v50) = v50 + [v37 containsObject:@"kMDItemRecipients"];
          }
          else
          {
            int v30 = v56;
            if ((v38 & 0x20) != 0
              || (char v42 = [(PRSRankingItem *)self bundleIDType],
                  unint64_t v39 = @"kMDItemTitle",
                  (v42 & 0x40) != 0)
              || (char v43 = [(PRSRankingItem *)self bundleIDType],
                  unint64_t v39 = @"kMDItemTextContent",
                  (v43 & 8) != 0))
            {
              HIDWORD(v49) += [v37 containsObject:v39];
            }
            v55 += [v37 containsObject:@"kMDItemAuthors"];
            HIDWORD(v50) += [v37 containsObject:@"kMDItemRecipients"];
          }
        }
        else
        {
          int v30 = v56;
        }
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v62 objects:v70 count:16];
    }
    while (v28);
  }
  else
  {
    uint64_t v49 = 0;
    uint64_t v50 = 0;
    int obja = 0;
    int v55 = 0;
    int v30 = v56;
  }

  if ([v30 countQPUSpecialToken] == 1)
  {
    int64_t v44 = 0;
    if (HIDWORD(v53) || v60) {
      goto LABEL_74;
    }
    if (![v30 countQPUSpecialToken]) {
      goto LABEL_72;
    }
LABEL_63:
    if (([(PRSRankingItem *)self bundleIDType] & 0x20) != 0 && HIDWORD(v53) > 1
      || ([(PRSRankingItem *)self bundleIDType] & 8) != 0 && HIDWORD(v53) > 2)
    {
      goto LABEL_73;
    }
    int64_t v44 = 0;
    unsigned int v45 = v8 + v60 + v59 + HIDWORD(v58) + HIDWORD(v60) + HIDWORD(v53);
    if (v8 + HIDWORD(v53) >= v45) {
      goto LABEL_74;
    }
    if (v8 + (int)v60 >= v45) {
      goto LABEL_74;
    }
    int64_t v44 = 0;
    if (v8 + HIDWORD(v53) + (int)v60 >= v45 || HIDWORD(v49)) {
      goto LABEL_74;
    }
    goto LABEL_75;
  }
  if ([v30 countQPUSpecialToken])
  {
    if (HIDWORD(v60))
    {
LABEL_73:
      int64_t v44 = 0;
      goto LABEL_74;
    }
    goto LABEL_63;
  }
LABEL_72:
  if (HIDWORD(v49)) {
    goto LABEL_73;
  }
LABEL_75:
  int64_t v44 = 0;
  if (!v49 && !v55 && !obja)
  {
    if (v53 && HIDWORD(v59)) {
      goto LABEL_73;
    }
    int v47 = -HIDWORD(v50);
    if (v53 | HIDWORD(v59))
    {
      if (v50 != v47) {
        goto LABEL_73;
      }
    }
    if (([(PRSRankingItem *)self bundleIDType] & 0x20) != 0 && HIDWORD(v53))
    {
      int64_t v44 = 1;
    }
    else
    {
      int64_t v44 = 1;
      if (((HIDWORD(v53) > 1) & ([(PRSRankingItem *)self bundleIDType] >> 3)) == 0
        && v53 <= 1
        && !HIDWORD(v59))
      {
        BOOL v48 = !(v58 + v57) || v53 == 0;
        int64_t v44 = 1;
        if (v48 && v50 == v47)
        {
          if (((HIDWORD(v53) != 0) & ([(PRSRankingItem *)self bundleIDType] >> 3)) != 0
            || v59 != -HIDWORD(v58)
            || ([v30 countQPUSpecialToken], v53)
            || v58 != -v57)
          {
            int64_t v44 = 2;
          }
          else
          {
            int64_t v44 = 3;
          }
        }
      }
    }
  }
LABEL_74:

  return v44;
}

- (int64_t)itemSparseMatchStrengthTypeForNotesAndFilesWithEvaluator:(id)a3 attributeMatchesForToken:(id)a4
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v52 = a4;
  id v53 = v5;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  *((void *)&v50 + 1) = [v5 itemQPQUOutputTokenInfo];
  uint64_t v54 = [*((id *)&v50 + 1) countByEnumeratingWithState:&v69 objects:v74 count:16];
  if (v54)
  {
    uint64_t v61 = 0;
    uint64_t v62 = 0;
    int v63 = 0;
    int v55 = 0;
    unsigned int v56 = 0;
    unsigned int v60 = 0;
    unsigned int v6 = 0;
    int v7 = 0;
    int v8 = 0;
    uint64_t v51 = *(void *)v70;
    do
    {
      for (uint64_t i = 0; i != v54; ++i)
      {
        if (*(void *)v70 != v51) {
          objc_enumerationMutation(*((id *)&v50 + 1));
        }
        uint64_t v10 = *(void **)(*((void *)&v69 + 1) + 8 * i);
        uint64_t v11 = [v10 objectForKeyedSubscript:@"kQPQUOutputToken"];
        uint64_t v12 = [v10 objectForKeyedSubscript:@"kQPQUOutputTokenArgScores"];
        float v13 = [v10 objectForKeyedSubscript:@"kQPQUOutputTokenArgLabels"];
        float v14 = [v52 objectForKey:v11];
        int v15 = [v13 isEqualToString:@"ARG_MEDIA_TYPE"];
        if (v14)
        {
          int v57 = v15;
          uint64_t v58 = v12;
          int v64 = v8;
          int v16 = v7;
          unsigned int v59 = v6;
          int v17 = [v13 isEqualToString:@"ARG_UNSPECIFIED"] ^ 1;
          int v18 = [v14 containsObject:@"kMDItemTextContent"];
          if (v18) {
            int v19 = v17;
          }
          else {
            int v19 = 0;
          }
          int v20 = [v14 containsObject:@"kMDItemTitle"];
          if (v20) {
            int v21 = v17;
          }
          else {
            int v21 = 0;
          }
          if (([v14 containsObject:@"kMDItemDisplayName"] & 1) != 0
            || ([v14 containsObject:@"kMDItemFileName"] & 1) != 0
            || ([v14 containsObject:@"kMDItemAlternateNames"] & 1) != 0
            || [v14 containsObject:@"FPFilename"])
          {
            v56 += v17;
            ++v55;
          }
          v60 += v18;
          HIDWORD(v62) += v19;
          LODWORD(v61) = v61 + v20;
          int v7 = v21 + v16;
          int v22 = [v14 containsObject:@"kMDItemAuthors"];
          if (v22) {
            int v23 = v17;
          }
          else {
            int v23 = 0;
          }
          v63 += v23;
          HIDWORD(v61) += v22;
          int v24 = [v14 containsObject:@"kMDItemLastEditorName"];
          if (v24) {
            int v25 = v17;
          }
          else {
            int v25 = 0;
          }
          LODWORD(v62) = v25 + v62;
          unsigned int v6 = v59 + v24;
          int v8 = v64;
          uint64_t v12 = v58;
          int v15 = v57;
        }
        v8 += v15;
      }
      uint64_t v54 = [*((id *)&v50 + 1) countByEnumeratingWithState:&v69 objects:v74 count:16];
    }
    while (v54);
  }
  else
  {
    uint64_t v61 = 0;
    uint64_t v62 = 0;
    int v63 = 0;
    int v55 = 0;
    unsigned int v56 = 0;
    unsigned int v60 = 0;
    unsigned int v6 = 0;
    int v7 = 0;
    int v8 = 0;
  }
  int v64 = v8;
  LODWORD(v48) = v7;

  id v26 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"\\S+" options:1 error:0];
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id v27 = v52;
  uint64_t v28 = [v27 countByEnumeratingWithState:&v65 objects:v73 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    memset(&v50, 0, 12);
    HIDWORD(v48) = 0;
    int v57 = 0;
    LODWORD(v58) = 0;
    unsigned int v59 = 0;
    LODWORD(v54) = 0;
    LODWORD(v51) = 0;
    LODWORD(v52) = 0;
    uint64_t v30 = *(void *)v66;
    do
    {
      uint64_t v31 = 0;
      do
      {
        if (*(void *)v66 != v30) {
          objc_enumerationMutation(v27);
        }
        id v32 = *(void **)(*((void *)&v65 + 1) + 8 * v31);
        unint64_t v33 = objc_msgSend(v26, "numberOfMatchesInString:options:range:", v32, 0, 0, objc_msgSend(v32, "length", v48));
        uint64_t v34 = [v53 queryString];
        int v35 = [v34 localizedCaseInsensitiveContainsString:v32];

        if (v35) {
          BOOL v36 = v33 >= 2;
        }
        else {
          BOOL v36 = 0;
        }
        if (v36)
        {
          uint64_t v37 = [v27 objectForKey:v32];
          int v38 = [v37 containsObject:@"kMDItemTextContent"];
          int v39 = [v37 containsObject:@"kMDItemTitle"];
          char v40 = [v37 containsObject:@"kMDItemDisplayName"];
          if (v33 == 2)
          {
            if ((v40 & 1) != 0
              || ([v37 containsObject:@"kMDItemFileName"] & 1) != 0
              || ([v37 containsObject:@"kMDItemAlternateNames"] & 1) != 0)
            {
              int v41 = 1;
            }
            else
            {
              int v41 = [v37 containsObject:@"FPFilename"];
            }
            LODWORD(v50) = v50 + v38;
            LODWORD(v58) = v58 + v39;
            LODWORD(v54) = v54 + v41;
            LODWORD(v51) = v51 + [v37 containsObject:@"kMDItemAuthors"];
            DWORD1(v50) += [v37 containsObject:@"kMDItemLastEditorName"];
          }
          else
          {
            if ((v40 & 1) != 0
              || ([v37 containsObject:@"kMDItemFileName"] & 1) != 0
              || ([v37 containsObject:@"kMDItemAlternateNames"] & 1) != 0)
            {
              int v42 = 1;
            }
            else
            {
              int v42 = [v37 containsObject:@"FPFilename"];
            }
            HIDWORD(v48) += v38;
            v59 += v39;
            v57 += v42;
            LODWORD(v52) = v52 + [v37 containsObject:@"kMDItemAuthors"];
            DWORD2(v50) += [v37 containsObject:@"kMDItemLastEditorName"];
          }
        }
        ++v31;
      }
      while (v29 != v31);
      uint64_t v43 = [v27 countByEnumeratingWithState:&v65 objects:v73 count:16];
      uint64_t v29 = v43;
    }
    while (v43);
  }
  else
  {
    memset(&v50, 0, 12);
    HIDWORD(v48) = 0;
    int v57 = 0;
    LODWORD(v58) = 0;
    unsigned int v59 = 0;
    LODWORD(v54) = 0;
    LODWORD(v51) = 0;
    LODWORD(v52) = 0;
  }

  unsigned int v44 = v48;
  if ([v53 countQPUSpecialToken] != 1 || (int64_t v45 = 0, !v48) && !v56 && !v63)
  {
    if (objc_msgSend(v53, "countQPUSpecialToken", v48))
    {
      int64_t v45 = 0;
      unsigned int v46 = v64 + v63 + v62 + v56 + v44 + HIDWORD(v62);
      if (v64 + v44 >= v46) {
        goto LABEL_83;
      }
      if (v64 + v56 >= v46) {
        goto LABEL_83;
      }
      int64_t v45 = 0;
      if (v64 + v63 >= v46 || v44 > 1 || v56 > 1 || HIDWORD(v62) > 2 || v59) {
        goto LABEL_83;
      }
    }
    else if (v59)
    {
      goto LABEL_82;
    }
    int64_t v45 = 0;
    if (v58
      || v57
      || v54
      || v52
      || v51
      || *(void *)((char *)&v50 + 4)
      || v49
      || v50 > 1)
    {
      goto LABEL_83;
    }
    if (v61 | v55 && HIDWORD(v61))
    {
LABEL_82:
      int64_t v45 = 0;
      goto LABEL_83;
    }
    if (!(v55 | v61) || (int64_t v45 = 0, !v50) && v60 <= 1)
    {
      int64_t v45 = 1;
      if (!v44
        && !v56
        && !v63
        && !v62
        && !(v55 | v61 | HIDWORD(v62))
        && !HIDWORD(v61)
        && v6 <= 1
        && HIDWORD(v62) <= 1)
      {
        if (v6) {
          int64_t v45 = 2;
        }
        else {
          int64_t v45 = 3;
        }
      }
    }
  }
LABEL_83:

  return v45;
}

- (float)computeCalibratedSparseScore
{
  [(PRSRankingItem *)self pommesL1Score];
  float v4 = v3;
  int v5 = [(PRSRankingItem *)self bundleIDType];
  int64_t v6 = [(PRSRankingItem *)self itemSparseMatchStrengthType];
  if (v4 <= 0.00000011921) {
    return 0.0;
  }
  switch(v6)
  {
    case 0:
      float v10 = 1.5;
      float v7 = 1.0;
      float v8 = 0.8;
      if ((v5 & 0x100000) != 0)
      {
        float v11 = 0.4;
      }
      else
      {
        float v11 = 0.5;
        if ((v5 & 0x862) == 0)
        {
          if ((v5 & 8) != 0) {
            float v11 = 0.5;
          }
          else {
            float v11 = 0.0;
          }
          float v10 = 1.5;
          float v7 = 1.0;
          if ((v5 & 8) == 0) {
            float v10 = 1.0;
          }
        }
      }
      return v8
           + (float)(sqrtf((float)(fminf(fmaxf(v4, v11), v10) - v11) / (float)((float)(v10 - v11) + 0.00000011921))
                   * (float)(v7 - v8));
    case 1:
      float v8 = 0.5;
      float v7 = 0.78;
      if ((v5 & 0x100000) != 0) {
        goto LABEL_26;
      }
      break;
    case 2:
      float v7 = 0.48;
      float v8 = 0.1;
      if ((v5 & 0x100000) != 0)
      {
LABEL_26:
        if (v6 != 1)
        {
          if (v6 == 2)
          {
            float v10 = 0.5;
            float v11 = 0.2;
            return v8
                 + (float)(sqrtf((float)(fminf(fmaxf(v4, v11), v10) - v11) / (float)((float)(v10 - v11) + 0.00000011921))
                         * (float)(v7 - v8));
          }
LABEL_36:
          float v10 = 1.0;
          float v11 = 0.0;
          return v8
               + (float)(sqrtf((float)(fminf(fmaxf(v4, v11), v10) - v11) / (float)((float)(v10 - v11) + 0.00000011921))
                       * (float)(v7 - v8));
        }
        goto LABEL_37;
      }
      break;
    default:
      float v7 = 1.0;
      float v8 = 0.0;
      if ((v5 & 0x100000) != 0) {
        goto LABEL_26;
      }
      break;
  }
  if ((v5 & 0x20) != 0)
  {
    if (v6 != 1)
    {
      if (v6 != 2) {
        goto LABEL_36;
      }
      float v10 = 0.6;
LABEL_35:
      float v11 = 0.1;
      return v8
           + (float)(sqrtf((float)(fminf(fmaxf(v4, v11), v10) - v11) / (float)((float)(v10 - v11) + 0.00000011921))
                   * (float)(v7 - v8));
    }
    goto LABEL_39;
  }
  if ((v5 & 2) != 0 || (v5 & 0x40) != 0 || (v5 & 0x800) != 0)
  {
    if (v6 != 1)
    {
      if (v6 != 2) {
        goto LABEL_36;
      }
LABEL_34:
      float v10 = 0.5;
      goto LABEL_35;
    }
LABEL_39:
    float v10 = 1.2;
    goto LABEL_40;
  }
  float v10 = 1.0;
  float v11 = 0.0;
  if ((v5 & 8) != 0)
  {
    if (v6 == 1)
    {
LABEL_37:
      float v10 = 0.75;
LABEL_40:
      float v11 = 0.3;
      return v8
           + (float)(sqrtf((float)(fminf(fmaxf(v4, v11), v10) - v11) / (float)((float)(v10 - v11) + 0.00000011921))
                   * (float)(v7 - v8));
    }
    if (v6 != 2) {
      return v8
    }
           + (float)(sqrtf((float)(fminf(fmaxf(v4, v11), v10) - v11) / (float)((float)(v10 - v11) + 0.00000011921))
                   * (float)(v7 - v8));
    goto LABEL_34;
  }
  return v8
       + (float)(sqrtf((float)(fminf(fmaxf(v4, v11), v10) - v11) / (float)((float)(v10 - v11) + 0.00000011921))
               * (float)(v7 - v8));
}

- (float)topicalityScoreWithEvaluator:(id)a3 quParsedEvaluator:(id)a4 isSearchToolClient:(BOOL)a5 quParsedPersonEvaluator:(id)a6 quParsedArgSearchTermsEvaluator:(id)a7
{
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  int v16 = SSCompactRankingAttrsGetValue((int8x8_t *)[(PRSRankingItem *)self attributes], 0x10DuLL);
  int v17 = SSCompactRankingAttrsGetValue((int8x8_t *)[(PRSRankingItem *)self attributes], 0x10EuLL);
  BOOL v18 = [v16 length] && objc_msgSend(v17, "length");
  [(PRSRankingItem *)self setIsAppEntity:v18];
  if (([(PRSRankingItem *)self bundleIDType] & 0x80) != 0)
  {
    [(PRSRankingItem *)self matchScoreForSafariWithEvaluator:v12 quParsedEvaluator:v13 isSearchToolClient:v9];
  }
  else if (([(PRSRankingItem *)self bundleIDType] & 0x100) != 0)
  {
    [(PRSRankingItem *)self matchScoreForApplicationsWithEvaluator:v12];
  }
  else if (([(PRSRankingItem *)self bundleIDType] & 4) != 0)
  {
    [(PRSRankingItem *)self matchScoreForContactsWithEvaluator:v12 quParsedEvaluator:v14];
  }
  else if (([(PRSRankingItem *)self bundleIDType] & 0x10) != 0)
  {
    [(PRSRankingItem *)self matchScoreForPreferencesWithEvaluator:v12];
  }
  else
  {
    if (([(PRSRankingItem *)self bundleIDType] & 2) == 0)
    {
      if (([(PRSRankingItem *)self bundleIDType] & 0x800) != 0)
      {
        if (v9)
        {
          id v20 = v15;
          uint64_t v21 = 1;
        }
        else
        {
          id v20 = v13;
          uint64_t v21 = 0;
        }
        [(PRSRankingItem *)self matchScoreForFilesWithEvaluator:v12 quParsedEvaluator:v20 isSearchToolClient:v21];
        goto LABEL_32;
      }
      if (([(PRSRankingItem *)self bundleIDType] & 0x20) != 0)
      {
        [(PRSRankingItem *)self matchScoreForCalendarWithEvaluator:v12 quParsedEvaluator:v13 isSearchToolClient:v9];
        goto LABEL_32;
      }
      if (([(PRSRankingItem *)self bundleIDType] & 0x40) == 0)
      {
        if (([(PRSRankingItem *)self bundleIDType] & 0x100000) != 0)
        {
          [(PRSRankingItem *)self matchScoreForMailWithEvaluator:v12 isSearchToolClient:v9];
        }
        else if (([(PRSRankingItem *)self bundleIDType] & 8) != 0)
        {
          [(PRSRankingItem *)self matchScoreForMessagesWithEvaluator:v12 isSearchToolClient:v9];
        }
        else if (([(PRSRankingItem *)self bundleIDType] & 0x200000) != 0)
        {
          [(PRSRankingItem *)self matchScoreForShortcutsWithEvaluator:v12];
        }
        else if (([(PRSRankingItem *)self bundleIDType] & 0x800000000000) != 0)
        {
          [(PRSRankingItem *)self matchScoreForDictionaryWithEvaluator:v12];
        }
        else if (([(PRSRankingItem *)self bundleIDType] & 0x2000000000000) != 0)
        {
          [(PRSRankingItem *)self matchScoreForBooksWithEvaluator:v12 quParsedEvaluator:v13 isSearchToolClient:v9];
        }
        else if (([(PRSRankingItem *)self bundleIDType] & 0x4000000000000) != 0)
        {
          [(PRSRankingItem *)self matchScoreForTipsWithEvaluator:v12];
        }
        else if (([(PRSRankingItem *)self bundleIDType] & 0x8000000000000) != 0)
        {
          [(PRSRankingItem *)self matchScoreForHelpWithEvaluator:v12];
        }
        else if (([(PRSRankingItem *)self bundleIDType] & 0x40000000000200) != 0)
        {
          [(PRSRankingItem *)self matchScoreForMusicWithEvaluator:v12 quParsedEvaluator:v13 isSearchToolClient:v9];
        }
        else if (([(PRSRankingItem *)self bundleIDType] & 0x1800000) != 0)
        {
          [(PRSRankingItem *)self matchScoreForPeopleItemsWithEvaluator:v12];
        }
        else if (([(PRSRankingItem *)self bundleIDType] & 0x200000000) != 0)
        {
          [(PRSRankingItem *)self matchScoreForWalletWithEvaluator:v12 quParsedEvaluator:v13 isSearchToolClient:v9];
        }
        else if (([(PRSRankingItem *)self bundleIDType] & 0x1C00000000000000) != 0 {
               || [(PRSRankingItem *)self isAppEntity])
        }
        {
          [(PRSRankingItem *)self matchScoreForAppEntityWithEvaluator:v12 quParsedEvaluator:v13 isSearchToolClient:v9];
        }
        else
        {
          [(PRSRankingItem *)self matchScoreGeneric:v12 quParsedEvaluator:v13 isSearchToolClient:v9];
        }
        goto LABEL_32;
      }
    }
    [(PRSRankingItem *)self matchScoreForNotesWithEvaluator:v12 isSearchToolClient:v9];
  }
LABEL_32:
  float v22 = v19;
  if (SSEnableSpotlightFullPageRanking() && v22 > 0.05) {
    [(PRSRankingItem *)self setShouldHideUnderShowMore:0];
  }

  return v22;
}

+ (id)tokenizeURLString:(id)a3 removeTLD:(BOOL)a4 hostTokenCount:(unint64_t *)a5 hostLength:(unint64_t *)a6 pathLength:(unint64_t *)a7 queryLength:(unint64_t *)a8 fragmentLength:(unint64_t *)a9
{
  BOOL v13 = a4;
  id v14 = a3;
  if (tokenizeURLString_removeTLD_hostTokenCount_hostLength_pathLength_queryLength_fragmentLength__onceToken != -1) {
    dispatch_once(&tokenizeURLString_removeTLD_hostTokenCount_hostLength_pathLength_queryLength_fragmentLength__onceToken, &__block_literal_global_172_0);
  }
  *a5 = 0;
  *a6 = 0;
  *a7 = 0;
  *a8 = 0;
  *a9 = 0;
  if (![v14 length])
  {
    id v27 = &stru_1F1824018;
    goto LABEL_23;
  }
  uint64_t v15 = [v14 lowercaseString];

  int v16 = [MEMORY[0x1E4F1CB10] URLWithString:v15];
  int v17 = v16;
  if (v16)
  {
    BOOL v18 = [v16 host];
    if (v18)
    {
      float v19 = v18;
      uint64_t v44 = v15;
      id v20 = [v18 componentsSeparatedByString:@"."];
      uint64_t v21 = (void *)[v20 mutableCopy];

      if ((unint64_t)[v21 count] < 3) {
        goto LABEL_16;
      }
      BOOL v41 = v13;
      float v22 = [v21 objectAtIndexedSubscript:0];
      unint64_t v23 = [v22 length];

      if (v23 > 4)
      {
        BOOL v13 = v41;
      }
      else
      {
        int v24 = [v21 objectAtIndexedSubscript:0];
        if ([v24 hasPrefix:@"www"])
        {
LABEL_11:

          BOOL v13 = v41;
LABEL_12:
          [v21 removeObjectAtIndex:0];
          uint64_t v26 = [v21 componentsJoinedByString:@"."];

          float v19 = (void *)v26;
          goto LABEL_16;
        }
        int v25 = [v21 objectAtIndexedSubscript:0];
        if ([v25 isEqualToString:@"m"])
        {

          goto LABEL_11;
        }
        [v21 objectAtIndexedSubscript:0];
        v38 = unsigned int v46 = v19;
        char v40 = [v38 isEqualToString:@"ww"];

        float v19 = v46;
        BOOL v13 = v41;
        if (v40) {
          goto LABEL_12;
        }
      }
LABEL_16:
      uint64_t v43 = v21;
      int64_t v45 = v19;
      uint64_t v28 = [v19 componentsSeparatedByCharactersInSet:tokenizeURLString_removeTLD_hostTokenCount_hostLength_pathLength_queryLength_fragmentLength__removeCharsHost];
      uint64_t v29 = (void *)[v28 mutableCopy];

      [v29 removeObject:&stru_1F1824018];
      if (v13 && (unint64_t)[v29 count] >= 2) {
        [v29 removeLastObject];
      }
      *a5 = [v29 count];
      uint64_t v30 = [v17 path];
      int v42 = [v17 query];
      int v39 = [v17 fragment];
      uint64_t v31 = [v30 stringByDeletingPathExtension];

      id v32 = [v31 componentsSeparatedByCharactersInSet:tokenizeURLString_removeTLD_hostTokenCount_hostLength_pathLength_queryLength_fragmentLength__removeCharsPath];
      unint64_t v33 = [v32 componentsJoinedByString:@" "];

      uint64_t v34 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
      int v35 = [v33 stringByTrimmingCharactersInSet:v34];

      id v27 = [v29 componentsJoinedByString:@" "];
      *a6 = [(__CFString *)v27 length];
      *a7 = [v35 length];
      *a8 = [v42 length];
      *a9 = [v39 length];
      if ([v35 length])
      {
        uint64_t v36 = [NSString stringWithFormat:@"%@ %@", v27, v35];

        id v27 = (__CFString *)v36;
      }

      uint64_t v15 = v44;
      goto LABEL_22;
    }
  }
  id v27 = &stru_1F1824018;
LABEL_22:

  id v14 = (id)v15;
LABEL_23:

  return v27;
}

uint64_t __119__PRSRankingItem_Scoring__tokenizeURLString_removeTLD_hostTokenCount_hostLength_pathLength_queryLength_fragmentLength___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@".-"];
  v1 = (void *)tokenizeURLString_removeTLD_hostTokenCount_hostLength_pathLength_queryLength_fragmentLength__removeCharsHost;
  tokenizeURLString_removeTLD_hostTokenCount_hostLength_pathLength_queryLength_fragmentLength__removeCharsHost = v0;

  tokenizeURLString_removeTLD_hostTokenCount_hostLength_pathLength_queryLength_fragmentLength__removeCharsPath = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"/.-_"];
  return MEMORY[0x1F41817F8]();
}

+ (id)tokenizeContactsEmailAddress:(id)a3 removeTLD:(BOOL)a4 usernameTokenCount:(unint64_t *)a5 usernameLength:(unint64_t *)a6 domainLength:(unint64_t *)a7 username:(id *)a8
{
  id v13 = a3;
  if (tokenizeContactsEmailAddress_removeTLD_usernameTokenCount_usernameLength_domainLength_username__onceToken != -1) {
    dispatch_once(&tokenizeContactsEmailAddress_removeTLD_usernameTokenCount_usernameLength_domainLength_username__onceToken, &__block_literal_global_204);
  }
  id v14 = &stru_1F1824018;
  *a8 = &stru_1F1824018;
  uint64_t v15 = objc_msgSend((id)tokenizeContactsEmailAddress_removeTLD_usernameTokenCount_usernameLength_domainLength_username__emailAddressRegularExpression, "firstMatchInString:options:range:", v13, 0, 0, objc_msgSend(v13, "length"));
  int v16 = v15;
  if (v15)
  {
    uint64_t v17 = [v15 rangeAtIndex:1];
    float v19 = objc_msgSend(v13, "substringWithRange:", v17, v18);
    *a8 = [v19 lowercaseString];

    id v20 = [*a8 componentsSeparatedByCharactersInSet:tokenizeContactsEmailAddress_removeTLD_usernameTokenCount_usernameLength_domainLength_username__removeCharsUsername];
    *a5 = [v20 count];
    [v20 componentsJoinedByString:@" "];
    v22 = uint64_t v21 = a7;
    *a6 = [*a8 length];
    uint64_t v23 = [v16 rangeAtIndex:2];
    int v25 = objc_msgSend(v13, "substringWithRange:", v23, v24);
    uint64_t v26 = [v25 lowercaseString];

    id v27 = [v26 componentsSeparatedByCharactersInSet:tokenizeContactsEmailAddress_removeTLD_usernameTokenCount_usernameLength_domainLength_username__removeCharsDomain];
    uint64_t v28 = [v27 componentsJoinedByString:@" "];

    *uint64_t v21 = [v26 length];
    uint64_t v29 = (void *)v22;
    id v14 = [NSString stringWithFormat:@"%@ %@", v22, v28];
    uint64_t v30 = [v16 rangeAtIndex:3];
    id v32 = objc_msgSend(v13, "substringWithRange:", v30, v31);
    unint64_t v33 = [v32 lowercaseString];

    if (!a4)
    {
      uint64_t v34 = [NSString stringWithFormat:@"%@ %@", v14, v33];

      id v14 = (__CFString *)v34;
    }
  }
  return v14;
}

uint64_t __122__PRSRankingItem_Scoring__tokenizeContactsEmailAddress_removeTLD_usernameTokenCount_usernameLength_domainLength_username___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"(.+)@(.+)\\.(.+)" options:1 error:0];
  v1 = (void *)tokenizeContactsEmailAddress_removeTLD_usernameTokenCount_usernameLength_domainLength_username__emailAddressRegularExpression;
  tokenizeContactsEmailAddress_removeTLD_usernameTokenCount_usernameLength_domainLength_username__emailAddressRegularExpression = v0;

  uint64_t v2 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@".-_~+"];
  float v3 = (void *)tokenizeContactsEmailAddress_removeTLD_usernameTokenCount_usernameLength_domainLength_username__removeCharsUsername;
  tokenizeContactsEmailAddress_removeTLD_usernameTokenCount_usernameLength_domainLength_username__removeCharsUsername = v2;

  tokenizeContactsEmailAddress_removeTLD_usernameTokenCount_usernameLength_domainLength_username__removeCharsDomain = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@".-_"];
  return MEMORY[0x1F41817F8]();
}

+ (id)tokenizeContactsName:(id)a3 tokenCount:(unint64_t *)a4
{
  id v5 = a3;
  if (tokenizeContactsName_tokenCount__onceToken != -1) {
    dispatch_once(&tokenizeContactsName_tokenCount__onceToken, &__block_literal_global_215);
  }
  *a4 = 0;
  if ([v5 length])
  {
    int64_t v6 = [v5 componentsSeparatedByCharactersInSet:tokenizeContactsName_tokenCount__removeCharsContactsName];
    id v7 = [v6 componentsJoinedByString:&stru_1F1824018];

    float v8 = [v7 componentsSeparatedByCharactersInSet:tokenizeContactsName_tokenCount__replaceCharsContactsName];
    *a4 = [v8 count];
    BOOL v9 = [v8 componentsJoinedByString:@" "];
    float v10 = [v9 lowercaseString];
  }
  else
  {
    id v7 = v5;
    float v10 = v7;
  }

  return v10;
}

uint64_t __59__PRSRankingItem_Scoring__tokenizeContactsName_tokenCount___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"|/\\:. ()~*"];
  v1 = (void *)tokenizeContactsName_tokenCount__replaceCharsContactsName;
  tokenizeContactsName_tokenCount__replaceCharsContactsName = v0;

  tokenizeContactsName_tokenCount__removeCharsContactsName = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"-"];
  return MEMORY[0x1F41817F8]();
}

+ (id)tokenizeTitleString:(id)a3 matchOption:(unsigned __int8)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a4 & 8) == 0)
  {
    id v6 = +[PRSRankingItem tokenizeTitleString:v5];
LABEL_18:
    uint64_t v21 = v6;
    goto LABEL_19;
  }
  if (tokenizeTitleString_matchOption__onceToken != -1) {
    dispatch_once(&tokenizeTitleString_matchOption__onceToken, &__block_literal_global_223);
  }
  if (![v5 length])
  {
    id v6 = v5;
    goto LABEL_18;
  }
  id v23 = v5;
  id v7 = [v5 componentsSeparatedByCharactersInSet:removeCharsTitle];
  float v8 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:patternForTokenizingCamelCase options:0 error:0];
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = v7;
  uint64_t v10 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v29 != v12) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        uint64_t v16 = [v14 length];
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __59__PRSRankingItem_Scoring__tokenizeTitleString_matchOption___block_invoke_2;
        v25[3] = &unk_1E634D670;
        id v17 = v15;
        id v26 = v17;
        id v27 = v14;
        objc_msgSend(v8, "enumerateMatchesInString:options:range:usingBlock:", v14, 0, 0, v16, v25);
        if ([v17 count])
        {
          [v9 addObjectsFromArray:v17];
        }
        else
        {
          uint64_t v18 = [v14 lowercaseString];
          id v32 = v18;
          float v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
          [v9 addObjectsFromArray:v19];
        }
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v11);
  }

  id v20 = [v9 componentsJoinedByString:@" "];
  uint64_t v21 = [v20 lowercaseString];

  id v5 = v23;
LABEL_19:

  return v21;
}

void __59__PRSRankingItem_Scoring__tokenizeTitleString_matchOption___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"|/\\:. -()~*&_"];
  v1 = (void *)removeCharsTitle;
  removeCharsTitle = v0;

  uint64_t v2 = (void *)patternForTokenizingCamelCase;
  patternForTokenizingCamelCase = @"([A-Z][a-z]+|[A-Z]+(?=[A-Z][a-z]|\\d|\\W|$)|\\d+)";
}

void __59__PRSRankingItem_Scoring__tokenizeTitleString_matchOption___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  float v3 = *(void **)(a1 + 40);
  uint64_t v4 = [a2 range];
  objc_msgSend(v3, "substringWithRange:", v4, v5);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [v7 lowercaseString];
  [v2 addObject:v6];
}

+ (id)tokenizeTitleString:(id)a3
{
  id v3 = a3;
  if (tokenizeTitleString__onceToken != -1) {
    dispatch_once(&tokenizeTitleString__onceToken, &__block_literal_global_232);
  }
  if ([v3 length])
  {
    uint64_t v4 = [v3 componentsSeparatedByCharactersInSet:removeCharsTitle];
    uint64_t v5 = [v4 componentsJoinedByString:@" "];

    id v6 = [v5 lowercaseString];
  }
  else
  {
    id v6 = v3;
  }

  return v6;
}

uint64_t __47__PRSRankingItem_Scoring__tokenizeTitleString___block_invoke()
{
  removeCharsTitle = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"|/\\:. -()~*&_"];
  return MEMORY[0x1F41817F8]();
}

- (float)matchScoreURLString:(id)a3 withEvaluator:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v89 = [v6 queryTerms];
  unint64_t v7 = [v89 count];
  float v8 = 0.0;
  if (![v5 length] || !v7) {
    goto LABEL_114;
  }
  int v88 = v5;
  uint64_t v107 = 0;
  long long v108 = &v107;
  uint64_t v109 = 0x3032000000;
  long long v110 = __Block_byref_object_copy__8;
  long long v111 = __Block_byref_object_dispose__8;
  id v112 = 0;
  id v112 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v7];
  uint64_t v101 = 0;
  uint64_t v102 = &v101;
  uint64_t v103 = 0x3032000000;
  uint64_t v104 = __Block_byref_object_copy__8;
  long long v105 = __Block_byref_object_dispose__8;
  id v106 = 0;
  [MEMORY[0x1E4F1CA48] arrayWithCapacity:v7];
  uint64_t v9 = 0;
  id v106 = (id)objc_claimAutoreleasedReturnValue();
  do
  {
    [(id)v108[5] insertObject:&unk_1F1861A48 atIndex:v9];
    [(id)v102[5] insertObject:&unk_1F1864140 atIndex:v9++];
  }
  while (v7 != v9);
  unint64_t v99 = 0;
  unint64_t v100 = 0;
  uint64_t v97 = 0;
  unint64_t v98 = 0;
  uint64_t v96 = 0;
  uint64_t v10 = +[PRSRankingItem tokenizeURLString:v5 removeTLD:1 hostTokenCount:&v100 hostLength:&v98 pathLength:&v99 queryLength:&v97 fragmentLength:&v96];
  float v8 = 0.0;
  if (!v98 || !v100) {
    goto LABEL_113;
  }
  v90[0] = MEMORY[0x1E4F143A8];
  v90[1] = 3221225472;
  v90[2] = __61__PRSRankingItem_Scoring__matchScoreURLString_withEvaluator___block_invoke;
  v90[3] = &unk_1E634D698;
  unint64_t v94 = v7;
  id v11 = v89;
  id v91 = v11;
  uint64_t v92 = &v107;
  unint64_t v95 = v100;
  unint64_t v93 = &v101;
  [v6 evaluateAttribute:v10 ignoreSubtokens:1 strongCompounds:1 skipTranscriptions:0 withHandler:v90];
  uint64_t v12 = [(id)v108[5] objectAtIndexedSubscript:0];
  int v13 = [v12 intValue];
  id v86 = v10;

  unint64_t v14 = v13 != -1;
  unint64_t v15 = v100;
  unint64_t v16 = v13 < (int)v100 && v13 != -1;
  uint64_t v87 = v6;
  if (v7 < 2)
  {
    char v84 = 0;
  }
  else
  {
    unint64_t v17 = 1;
    char v18 = 1;
    while (v17 < [(id)v108[5] count])
    {
      float v19 = [(id)v108[5] objectAtIndexedSubscript:v17];
      int v20 = [v19 intValue];

      if (v20 == -1 || v13 != -1 && v20 - v13 != 1) {
        char v18 = 0;
      }
      v14 += v20 >= 0;
      if (v20 < (int)v100) {
        ++v16;
      }
      ++v17;
      int v13 = v20;
    }
    char v84 = v18 & 1;
    unint64_t v15 = v100;
  }
  uint64_t v21 = 0;
  char v22 = 0;
  char v23 = 0;
  float v24 = (double)v98 + (double)v99 * 0.6;
  float v25 = (float)v98 / v24;
  float v26 = (float)v16 / (float)v15;
  float v27 = 0.0;
  do
  {
    long long v28 = [(id)v102[5] objectAtIndexedSubscript:v21];
    [v28 floatValue];
    float v30 = v29;

    long long v31 = [(id)v108[5] objectAtIndexedSubscript:v21];
    int v32 = [v31 intValue];

    unint64_t v33 = [v11 objectAtIndexedSubscript:v21];
    unint64_t v34 = [v33 composedLength];

    if ((v32 & 0x80000000) == 0 && v32 < (int)v100)
    {
      if (!v32 && (v34 > 2 || v100 == 1))
      {
        double v35 = v30;
        if (v30 > 0.94) {
          goto LABEL_29;
        }
        BOOL v37 = v35 > 0.27 && v34 > 2;
        if (v37 || (v35 > 0.24 ? (BOOL v38 = v34 > 3) : (BOOL v38 = 0), v38 || v35 > 0.2 && v34 > 4 || v35 > 0.1 && v34 >= 6))
        {
          float v30 = (v35 + 1.0) * 0.95 * 0.5;
          goto LABEL_29;
        }
      }
      if ((v23 & 1) == 0)
      {
        char v23 = 0;
        *(float *)&double v35 = v26 * v30;
LABEL_41:
        float v30 = v25 * *(float *)&v35;
        char v22 = 1;
        goto LABEL_42;
      }
LABEL_29:
      double v35 = v30 * 0.9;
      *(float *)&double v35 = v35;
      if (v100 <= 1) {
        *(float *)&double v35 = v30;
      }
      if ((float)((float)(v99 + v98) / (float)(v96 + v97 + v99 + v98)) < 0.2 || v96 + v97 + v99 >= 0x29)
      {
        double v35 = *(float *)&v35 * 0.3;
        *(float *)&double v35 = v35;
      }
      char v23 = 1;
      goto LABEL_41;
    }
    if (v32 >= (int)v100 && v99 != 0)
    {
      *(float *)&double v35 = (float)v34 / (float)v99;
      float v30 = v30 * *(float *)&v35;
    }
LABEL_42:
    float v27 = v27 + v30;
    ++v21;
  }
  while (v7 != v21);
  float v39 = (float)v7;
  if (v84)
  {
    if ((float)(v27 + v27) >= v39) {
      float v40 = (float)v7;
    }
    else {
      float v40 = v27 + v27;
    }
    BOOL v41 = [v87 queryString];
    unint64_t v42 = [v41 composedLength];
    float v43 = (float)v42 / (float)(unint64_t)[v86 length];

    LODWORD(v35) = 1.0;
    if (v43 <= 1.0) {
      *(float *)&double v35 = v43;
    }
    float v27 = v40 * *(float *)&v35;
  }
  else if ((v22 & 1) == 0)
  {
    double v35 = v27 * 0.4;
    float v27 = v35;
  }
  unint64_t v44 = v98;
  unint64_t v45 = v99;
  uint64_t v47 = v96;
  uint64_t v46 = v97;
  float v48 = v27 / v39;
  if (v14 >= v7)
  {
    double v35 = v48;
    if (v48 >= 0.2)
    {
      uint64_t v10 = v86;
      id v6 = v87;
      goto LABEL_111;
    }
  }
  int v49 = objc_msgSend(v87, "queryString", v35);
  long long v50 = [v49 lowercaseString];

  uint64_t v51 = [v86 lowercaseString];
  float v52 = (float)v44 / (float)(v45 + v44 + v46 + v47);
  id v6 = v87;
  uint64_t v10 = v86;
  if ([v50 rangeOfString:@" "] == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_73:
    id v85 = v51;
    int v55 = [MEMORY[0x1E4F1CB10] URLWithString:v88];
    unsigned int v56 = [v55 host];

    if ([v56 hasCommonSubDomainPrefix])
    {
      int v57 = [v87 queryString];
      char v58 = [v57 hasCommonSubDomainPrefix];

      if ((v58 & 1) == 0)
      {
        unsigned int v59 = [v56 componentsSeparatedByString:@"."];
        unsigned int v60 = (void *)[v59 mutableCopy];

        if ((unint64_t)[v60 count] >= 3)
        {
          uint64_t v61 = [v60 objectAtIndexedSubscript:0];
          unint64_t v62 = [v61 length];

          if (v62 <= 4)
          {
            [v60 removeObjectAtIndex:0];
            uint64_t v63 = [v60 componentsJoinedByString:@"."];

            unsigned int v56 = (void *)v63;
          }
        }
      }
    }
    uint64_t v65 = [v56 rangeOfString:v50];
    if (v65 == 0x7FFFFFFFFFFFFFFFLL || (unint64_t v66 = v64, ![v56 length]))
    {
      long long v69 = [v88 lowercaseString];
      if ([v69 rangeOfString:v50] == 0x7FFFFFFFFFFFFFFFLL || (unint64_t v71 = v70, !objc_msgSend(v69, "length")))
      {
        int64_t v74 = +[PRSRankingItem tokenizeURLString:v88 removeTLD:0 hostTokenCount:&v100 hostLength:&v98 pathLength:&v99 queryLength:&v97 fragmentLength:&v96];
        if ([v74 rangeOfString:v50] == 0x7FFFFFFFFFFFFFFFLL
          || (unint64_t v76 = v75, ![v74 length]))
        {
          BOOL v73 = v14 < v7;
          float v8 = 0.0;
        }
        else
        {
          unint64_t v77 = [v74 length];
          if ((float)((float)v76 / (float)v77) <= 0.3) {
            float v8 = (float)v76 / (float)v77;
          }
          else {
            float v8 = 1.0;
          }
          BOOL v73 = 1;
        }
      }
      else
      {
        unint64_t v72 = [v69 length];
        if ((float)((float)v71 / (float)v72) <= 0.6) {
          float v8 = (float)v71 / (float)v72;
        }
        else {
          float v8 = 1.0;
        }
        BOOL v73 = 1;
      }
    }
    else
    {
      float v67 = (float)v66 / (float)(unint64_t)[v56 length];
      if (v65 || (float v68 = 1.0, v67 <= 0.5) && [v50 rangeOfString:@"."] == 0x7FFFFFFFFFFFFFFFLL) {
        float v68 = v67 * 0.3;
      }
      if (v52 >= 0.3) {
        float v82 = v25;
      }
      else {
        float v82 = v52;
      }
      float v48 = v82 * v68;
      BOOL v73 = 1;
      float v8 = v82 * v68;
    }

    if (!v73) {
LABEL_111:
    }
      float v8 = v48;
  }
  else
  {
    id v53 = [v50 stringByReplacingOccurrencesOfString:@" " withString:&stru_1F1824018];
    if ([v51 rangeOfString:v53])
    {

      goto LABEL_73;
    }
    uint64_t v78 = v54;
    uint64_t v79 = [v51 length];
    float v80 = 0.95;
    if (v78 == v79) {
      float v80 = 1.0;
    }
    if (v52 >= 0.3) {
      float v81 = v25;
    }
    else {
      float v81 = v52;
    }
    float v8 = v81 * v80;
  }
  id v5 = v88;
LABEL_113:

  _Block_object_dispose(&v101, 8);
  _Block_object_dispose(&v107, 8);

LABEL_114:
  return v8;
}

void __61__PRSRankingItem_Scoring__matchScoreURLString_withEvaluator___block_invoke(uint64_t a1, char a2, uint64_t a3, unint64_t a4, uint64_t a5, unint64_t a6, unint64_t a7)
{
  unint64_t v10 = *(void *)(a1 + 56) - 1;
  if ((a2 & 7) != 1 || v10 != a6)
  {
    if ((a2 & 7) != 3 || v10 <= a6) {
      return;
    }
    uint64_t v12 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) objectAtIndexedSubscript:a6];
    int v13 = [v12 intValue];

    if (v13 == -1)
    {
      uint64_t v36 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a7];
      [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v36 atIndexedSubscript:a6];

      if (*(void *)(a1 + 64) <= a7)
      {
        float v19 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        BOOL v37 = &unk_1F1864150;
        goto LABEL_35;
      }
      float v19 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      if (a7)
      {
        BOOL v37 = &unk_1F18640C0;
LABEL_35:
        [v19 setObject:v37 atIndexedSubscript:a6];
        return;
      }
    }
    else
    {
      if (!a6) {
        return;
      }
      unint64_t v14 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) objectAtIndexedSubscript:a6];
      int v15 = [v14 intValue];
      unint64_t v16 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) objectAtIndexedSubscript:a6 - 1];
      int v17 = v15 - [v16 intValue];

      if (v17 == 1) {
        return;
      }
      char v18 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a7];
      [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v18 atIndexedSubscript:a6];

      float v19 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    }
    BOOL v37 = &unk_1F1864160;
    goto LABEL_35;
  }
  if (a4)
  {
    uint64_t v21 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a6];
    float v22 = (float)(unint64_t)[v21 composedLength] / (float)a4;

    if (v22 > 1.0) {
      float v22 = 1.0;
    }
  }
  else
  {
    float v22 = 0.0;
  }
  char v23 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) objectAtIndexedSubscript:a6];
  int v24 = [v23 intValue];

  if (v24 != -1)
  {
    if (!a6) {
      return;
    }
    float v25 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) objectAtIndexedSubscript:a6];
    int v26 = [v25 intValue];
    float v27 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) objectAtIndexedSubscript:a6 - 1];
    int v28 = v26 - [v27 intValue];

    if (v28 == 1) {
      return;
    }
    unint64_t v34 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a7];
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v34 atIndexedSubscript:a6];

    long long v31 = (void *)MEMORY[0x1E4F28ED0];
    goto LABEL_24;
  }
  float v29 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a7];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v29 atIndexedSubscript:a6];

  if (*(void *)(a1 + 64) <= a7)
  {
    long long v31 = (void *)MEMORY[0x1E4F28ED0];
    double v32 = v22;
    double v33 = 0.7;
    goto LABEL_29;
  }
  long long v31 = (void *)MEMORY[0x1E4F28ED0];
  if (a7)
  {
    double v32 = v22;
    double v33 = 0.95;
LABEL_29:
    uint64_t v35 = [v31 numberWithDouble:v32 * v33];
    goto LABEL_30;
  }
LABEL_24:
  *(float *)&double v30 = v22;
  uint64_t v35 = [v31 numberWithFloat:v30];
LABEL_30:
  id v38 = (id)v35;
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setObject:v35 atIndexedSubscript:a6];
}

+ (float)matchScoreLaunchString:(id)a3 withEvaluator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  float v8 = [v7 queryTerms];
  uint64_t v9 = [v8 count];
  float v10 = 0.0;
  if ([v6 length])
  {
    if (v9)
    {
      if (![v6 length]) {
        goto LABEL_6;
      }
      uint64_t v11 = [v7 queryString];
      if (!v11
        || (uint64_t v12 = (void *)v11,
            [v7 queryString],
            int v13 = objc_claimAutoreleasedReturnValue(),
            char v14 = [v6 isEqualToString:v13],
            v13,
            v12,
            float v10 = 1.0,
            (v14 & 1) == 0))
      {
LABEL_6:
        uint64_t v20 = 0;
        uint64_t v21 = (float *)&v20;
        uint64_t v22 = 0x2020000000;
        int v23 = 0;
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __64__PRSRankingItem_Scoring__matchScoreLaunchString_withEvaluator___block_invoke;
        v16[3] = &unk_1E634D6C0;
        char v18 = &v20;
        uint64_t v19 = v9;
        id v17 = v8;
        [a1 matchScoreTokensFromText:v6 withEvaluator:v7 withHandler:v16];
        float v10 = fminf(v21[6], 1.0);

        _Block_object_dispose(&v20, 8);
      }
    }
  }

  return v10;
}

void __64__PRSRankingItem_Scoring__matchScoreLaunchString_withEvaluator___block_invoke(uint64_t a1, void *a2, unint64_t a3, int a4, float a5, uint64_t a6, uint64_t a7, unint64_t a8)
{
  id v13 = a2;
  if (*(void *)(a1 + 48) > a8)
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    goto LABEL_21;
  }
  id v29 = v13;
  if ([v13 count])
  {
    uint64_t v14 = 0;
    while (1)
    {
      int v15 = [v29 objectAtIndexedSubscript:v14];
      int v16 = [v15 intValue];

      if (v14 != v16) {
        break;
      }
      if (++v14 >= (unint64_t)[v29 count]) {
        goto LABEL_7;
      }
    }
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    goto LABEL_20;
  }
LABEL_7:
  uint64_t v17 = *(void *)(a1 + 48);
  if (v17 == a3 && vabds_f32(a5, (float)a3) < 2.2204e-16)
  {
    uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 8);
    int v19 = 1065353216;
LABEL_18:
    *(_DWORD *)(v18 + 24) = v19;
LABEL_20:
    id v13 = v29;
    goto LABEL_21;
  }
  if (a3 == 1 && v17 == 1)
  {
    uint64_t v20 = [*(id *)(a1 + 32) objectAtIndexedSubscript:0];
    unint64_t v21 = [v20 composedLength];

    if (a5 >= 0.75 || a5 >= 0.5 && v21 || (double v22 = a5, a5 >= 0.4) && v21 >= 2)
    {
      uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 8);
      int v19 = 1065017672;
      goto LABEL_18;
    }
    if (v22 >= 0.1)
    {
      int v23 = [*(id *)(a1 + 32) objectAtIndexedSubscript:0];
      unint64_t v24 = [v23 composedLength];

      if (v24 >= 3)
      {
        float v25 = fmin((v22 + 1.0) * 0.5, 0.98);
        *(float *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v25;
        goto LABEL_20;
      }
    }
  }
  unint64_t v26 = *(void *)(a1 + 48);
  if (v26 <= a3) {
    unint64_t v26 = a3;
  }
  *(float *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a5 / (float)v26;
  id v13 = v29;
  if (a4)
  {
    uint64_t v27 = *(void *)(*(void *)(a1 + 40) + 8);
    float v28 = *(float *)(v27 + 24) + *(float *)(v27 + 24);
    if (v28 >= 0.99) {
      float v28 = 0.99;
    }
    *(float *)(v27 + 24) = v28;
  }
LABEL_21:
}

- (float)matchScoreAppName:(id)a3 withEvaluator:(id)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [(PRSRankingItem *)self matchScoreAppName:v6 withEvaluator:v7 matchOption:2];
  float v9 = v8;
  double v10 = v8;
  if (v8 < 0.95)
  {
    [(PRSRankingItem *)self matchScoreAppName:v6 withEvaluator:v7 matchOption:0];
    if (v9 < v11) {
      float v9 = v11;
    }
    double v10 = v9;
  }
  if (v10 < 0.8)
  {
    uint64_t v12 = [v7 queryString];
    uint64_t v13 = [v12 rangeOfString:@" "];

    if (v13 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v14 = [v7 queryString];
      int v15 = [v14 lowercaseString];
      int v16 = [v15 stringByReplacingOccurrencesOfString:@" " withString:&stru_1F1824018];

      id v17 = objc_alloc(MEMORY[0x1E4F237B8]);
      uint64_t v18 = [v7 language];
      int v19 = (void *)[v17 initWithQuery:v16 language:v18 fuzzyThreshold:0 options:0];

      [(PRSRankingItem *)self matchScoreAppName:v6 withEvaluator:v19 matchOption:2];
      if (v9 < v20) {
        float v9 = v20;
      }
      double v10 = v9;
      if (v9 < 0.95)
      {
        [(PRSRankingItem *)self matchScoreAppName:v6 withEvaluator:v19 matchOption:0];
        if (v9 < v21) {
          float v9 = v21;
        }
        double v10 = v9;
      }
    }
  }
  if (v10 < 0.8)
  {
    double v22 = +[PRSRankingItem tokenizeTitleString:v6];
    if ([v22 rangeOfString:@" "] != 0x7FFFFFFFFFFFFFFFLL)
    {
      int v23 = [v22 componentsSeparatedByString:@" "];
      if ((unint64_t)[v23 count] >= 2)
      {
        unint64_t v24 = [v23 componentsJoinedByString:&stru_1F1824018];
        [(PRSRankingItem *)self matchScoreAppName:v24 withEvaluator:v7 matchOption:0];
        if (v9 < v25) {
          float v9 = v25;
        }

        double v10 = v9;
      }
    }
  }
  if (v10 < 0.8)
  {
    unint64_t v26 = [v6 componentsSeparatedByString:@" "];
    uint64_t v27 = [v7 queryString];
    float v28 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
    id v29 = [v27 stringByTrimmingCharactersInSet:v28];

    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v30 = v26;
    uint64_t v31 = [v30 countByEnumeratingWithState:&v43 objects:v47 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v44;
      while (2)
      {
        for (uint64_t i = 0; i != v32; ++i)
        {
          if (*(void *)v44 != v33) {
            objc_enumerationMutation(v30);
          }
          uint64_t v35 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          float v36 = (float)(unint64_t)objc_msgSend(v29, "length", (void)v43);
          if ((float)(v36 / (float)(unint64_t)[v6 length]) <= 0.38)
          {
            if (![v35 localizedCaseInsensitiveContainsString:v29]) {
              continue;
            }
            float v37 = (float)(unint64_t)[v29 length];
            if ((float)(v37 / (float)(unint64_t)[v35 length]) <= 0.38
              && ![v35 hasSpecialAppPrefix])
            {
              continue;
            }
          }
          [(PRSRankingItem *)self matchScoreAppName:v6 withEvaluator:v7 matchOption:8];
          if (v9 < v38) {
            float v9 = v38;
          }
          double v10 = v9;
          goto LABEL_38;
        }
        uint64_t v32 = [v30 countByEnumeratingWithState:&v43 objects:v47 count:16];
        if (v32) {
          continue;
        }
        break;
      }
    }
LABEL_38:
  }
  if (v10 < 0.8 && (unint64_t)[v6 length] >= 3)
  {
    if ([v6 containsString:@"&"])
    {
      float v39 = [v6 stringByReplacingOccurrencesOfString:@"&" withString:&stru_1F1824018];
      [(PRSRankingItem *)self matchScoreAppName:v39 withEvaluator:v7 matchOption:8];
      float v41 = v40;

      if (v9 < v41) {
        float v9 = v41;
      }
    }
  }

  return v9;
}

- (float)matchScoreAppName:(id)a3 withEvaluator:(id)a4 matchOption:(unsigned __int8)a5
{
  id v7 = a3;
  id v8 = a4;
  float v9 = [v8 queryTerms];
  uint64_t v10 = [v9 count];
  id v11 = v7;
  uint64_t v12 = v11;
  uint64_t v13 = v11;
  if ((a5 & 8) == 0)
  {
    uint64_t v13 = [v11 lowercaseString];
  }
  if ((a5 & 2) != 0)
  {
    uint64_t v14 = +[PRSRankingItem tokenizeTitleString:v13];

    uint64_t v13 = (void *)v14;
  }
  float v15 = 0.0;
  if ([v13 length] && v10)
  {
    uint64_t v22 = 0;
    int v23 = (float *)&v22;
    uint64_t v24 = 0x2020000000;
    int v25 = 0;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __71__PRSRankingItem_Scoring__matchScoreAppName_withEvaluator_matchOption___block_invoke;
    v17[3] = &unk_1E634D6E8;
    float v20 = &v22;
    uint64_t v21 = v10;
    id v18 = v12;
    id v19 = v8;
    +[PRSRankingItem matchScoreTokensFromText:v13 withEvaluator:v19 withHandler:v17];
    float v15 = v23[6];

    _Block_object_dispose(&v22, 8);
  }

  return v15;
}

void __71__PRSRankingItem_Scoring__matchScoreAppName_withEvaluator_matchOption___block_invoke(uint64_t a1, void *a2, unint64_t a3, int a4, int a5, int a6, unint64_t a7, float a8)
{
  id v15 = a2;
  unint64_t v16 = *(void *)(a1 + 56);
  if (v16 > a7)
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    goto LABEL_26;
  }
  if (v16 == 1)
  {
    if (a5)
    {
      if (a3 == 1 && a8 == 1.0)
      {
        *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1065353216;
        goto LABEL_26;
      }
      id v28 = v15;
      uint64_t v22 = *(void **)(a1 + 32);
      int v23 = [*(id *)(a1 + 40) queryString];
      uint64_t v24 = [v22 rangeOfString:v23 options:393];
      uint64_t v26 = v25;

      if (v24 || !v26) {
        int v27 = 1064849900;
      }
      else {
        int v27 = 1065017672;
      }
      *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v27;
      id v15 = v28;
    }
    else
    {
      if (a6) {
        int v21 = 1063675494;
      }
      else {
        int v21 = 1060320051;
      }
      *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v21;
    }
    if (a3 >= 8)
    {
      uint64_t v19 = *(void *)(*(void *)(a1 + 48) + 8);
      float v20 = *(float *)(v19 + 24) / (float)(a3 - 7);
      goto LABEL_25;
    }
  }
  else
  {
    if (v16 <= a3) {
      unint64_t v16 = a3;
    }
    *(float *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a8 / (float)v16;
    if (a5)
    {
      uint64_t v17 = *(void *)(*(void *)(a1 + 48) + 8);
      float v18 = fmin(*(float *)(v17 + 24) + 0.2, 1.0);
      *(float *)(v17 + 24) = v18;
    }
    if (a4)
    {
      uint64_t v19 = *(void *)(*(void *)(a1 + 48) + 8);
      float v20 = fmin(*(float *)(v19 + 24) * 1.5, 1.0);
LABEL_25:
      *(float *)(v19 + 24) = v20;
    }
  }
LABEL_26:
}

- (float)matchScoreContactsName:(id)a3 withEvaluator:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 queryTerms];
  uint64_t v8 = [v7 count];
  uint64_t v21 = 0;
  float v9 = +[PRSRankingItem tokenizeContactsName:v5 tokenCount:&v21];
  float v10 = 0.0;
  if ([v9 length]) {
    BOOL v11 = v8 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (!v11)
  {
    uint64_t v17 = 0;
    float v18 = (float *)&v17;
    uint64_t v19 = 0x2020000000;
    int v20 = 0;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __64__PRSRankingItem_Scoring__matchScoreContactsName_withEvaluator___block_invoke;
    v13[3] = &unk_1E634D6C0;
    id v15 = &v17;
    uint64_t v16 = v8;
    id v14 = v7;
    +[PRSRankingItem matchScoreTokensFromText:v9 withEvaluator:v6 withHandler:v13];
    float v10 = fminf(v18[6], 1.0);

    _Block_object_dispose(&v17, 8);
  }

  return v10;
}

void __64__PRSRankingItem_Scoring__matchScoreContactsName_withEvaluator___block_invoke(uint64_t a1, void *a2, unint64_t a3, int a4, int a5, int a6, unint64_t a7, float a8)
{
  id v15 = a2;
  unint64_t v16 = *(void *)(a1 + 48);
  if (v16 > a7)
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    goto LABEL_36;
  }
  if (vabds_f32(a8, (float)a3) < 2.2204e-16)
  {
    uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 8);
    int v18 = 1065353216;
LABEL_5:
    *(_DWORD *)(v17 + 24) = v18;
    goto LABEL_36;
  }
  if (a7 < 2)
  {
    if ((a5 & 1) == 0 && !a6) {
      goto LABEL_22;
    }
    if (a8 <= 0.4) {
      goto LABEL_17;
    }
    id v31 = v15;
    uint64_t v19 = [*(id *)(a1 + 32) objectAtIndexedSubscript:0];
    unint64_t v20 = [v19 composedLength];
    uint64_t v21 = [*(id *)(a1 + 32) objectAtIndexedSubscript:0];
    unint64_t v22 = [v21 containsCJK] ? 2 : 4;

    id v15 = v31;
    if (v20 >= v22)
    {
      if (a8 == 1.0) {
        int v28 = 1065017672;
      }
      else {
        int v28 = 1064849900;
      }
      *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v28;
      if (!a6) {
        goto LABEL_34;
      }
    }
    else
    {
LABEL_17:
      float v23 = a8 * 0.95;
      *(float *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v23;
      if (!a6)
      {
LABEL_34:
        uint64_t v24 = *(void *)(*(void *)(a1 + 40) + 8);
        float v25 = fminf(*(float *)(v24 + 24), 1.0);
LABEL_35:
        *(float *)(v24 + 24) = v25;
        goto LABEL_36;
      }
    }
    if ((a5 & 1) == 0)
    {
      uint64_t v29 = *(void *)(*(void *)(a1 + 40) + 8);
      float v30 = *(float *)(v29 + 24) + -0.001;
      *(float *)(v29 + 24) = v30;
    }
    goto LABEL_34;
  }
  if (a5 && a6)
  {
    uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 8);
    int v18 = 1065185444;
    goto LABEL_5;
  }
  if ((a5 | a6) == 1 && v16 <= 3)
  {
    uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 8);
    int v18 = 1065017672;
    goto LABEL_5;
  }
LABEL_22:
  if (v16 <= a3) {
    unint64_t v16 = a3;
  }
  *(float *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a8 / (float)v16;
  if (a4)
  {
    uint64_t v24 = *(void *)(*(void *)(a1 + 40) + 8);
    float v25 = *(float *)(v24 + 24);
    double v26 = fmin((float)(v25 + v25), 0.99);
    if (v26 > v25)
    {
      float v27 = v26;
      float v25 = v27;
    }
    goto LABEL_35;
  }
LABEL_36:
}

- (float)matchScoreContactsEmailAddress:(id)a3 withEvaluator:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 queryTerms];
  unint64_t v8 = [v7 count];
  float v9 = 0.0;
  if (![v5 length] || !v8) {
    goto LABEL_95;
  }
  uint64_t v78 = v7;
  uint64_t v98 = 0;
  unint64_t v99 = &v98;
  uint64_t v100 = 0x3032000000;
  uint64_t v101 = __Block_byref_object_copy__8;
  uint64_t v102 = __Block_byref_object_dispose__8;
  id v103 = 0;
  id v103 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v8];
  uint64_t v92 = 0;
  unint64_t v93 = &v92;
  uint64_t v94 = 0x3032000000;
  unint64_t v95 = __Block_byref_object_copy__8;
  uint64_t v96 = __Block_byref_object_dispose__8;
  id v97 = 0;
  [MEMORY[0x1E4F1CA48] arrayWithCapacity:v8];
  uint64_t v10 = 0;
  id v97 = (id)objc_claimAutoreleasedReturnValue();
  do
  {
    [(id)v99[5] insertObject:&unk_1F1861A48 atIndex:v10];
    [(id)v93[5] insertObject:&unk_1F1864140 atIndex:v10++];
  }
  while (v8 != v10);
  unint64_t v90 = 0;
  unint64_t v91 = 0;
  id v88 = 0;
  unint64_t v89 = 0;
  uint64_t v79 = +[PRSRankingItem tokenizeContactsEmailAddress:v5 removeTLD:1 usernameTokenCount:&v91 usernameLength:&v90 domainLength:&v89 username:&v88];
  id v11 = v88;
  uint64_t v12 = [v5 length];
  uint64_t v13 = [v11 length];
  unint64_t v77 = v11;
  float v9 = 0.0;
  if (!v90 || !v91) {
    goto LABEL_94;
  }
  id v14 = v7;
  uint64_t v15 = v12 + ~v13;
  v81[0] = MEMORY[0x1E4F143A8];
  v81[1] = 3221225472;
  v81[2] = __72__PRSRankingItem_Scoring__matchScoreContactsEmailAddress_withEvaluator___block_invoke;
  v81[3] = &unk_1E634D710;
  unint64_t v85 = v8;
  id v16 = v14;
  id v82 = v16;
  BOOL v83 = &v98;
  unint64_t v86 = v91;
  uint64_t v87 = v15;
  char v84 = &v92;
  [v6 evaluateAttribute:v79 ignoreSubtokens:1 strongCompounds:1 skipTranscriptions:0 withHandler:v81];
  uint64_t v17 = [(id)v99[5] objectAtIndexedSubscript:0];
  int v18 = [v17 intValue];
  unint64_t v75 = v6;

  unint64_t v19 = v18 != -1;
  unint64_t v20 = v91;
  unint64_t v21 = v18 < (int)v91 && v18 != -1;
  if (v8 < 2)
  {
    char v74 = 0;
  }
  else
  {
    unint64_t v22 = 1;
    char v23 = 1;
    while (v22 < [(id)v99[5] count])
    {
      uint64_t v24 = [(id)v99[5] objectAtIndexedSubscript:v22];
      int v25 = [v24 intValue];

      if (v25 == -1 || v18 != -1 && v25 - v18 != 1) {
        char v23 = 0;
      }
      v19 += v25 >= 0;
      if (v25 < (int)v91) {
        ++v21;
      }
      ++v22;
      int v18 = v25;
    }
    char v74 = v23 & 1;
    unint64_t v20 = v91;
  }
  uint64_t v26 = 0;
  char v27 = 0;
  double v73 = 0.7;
  float v28 = (double)v90 + (double)v89 * 0.7;
  float v29 = (float)v90 / v28;
  float v30 = (float)v21 / (float)v20;
  float v31 = 0.0;
  do
  {
    uint64_t v32 = objc_msgSend((id)v93[5], "objectAtIndexedSubscript:", v26, *(void *)&v73);
    [v32 floatValue];
    float v34 = v33;

    uint64_t v35 = [(id)v99[5] objectAtIndexedSubscript:v26];
    int v36 = [v35 intValue];

    float v37 = [v16 objectAtIndexedSubscript:v26];
    unint64_t v38 = [v37 composedLength];

    if ((v36 & 0x80000000) == 0 && v36 < (int)v91)
    {
      if (!v36)
      {
        double v39 = v34;
        if (v34 > 0.94) {
          goto LABEL_51;
        }
        BOOL v41 = v39 > 0.39 && v38 > 1;
        if (v41
          || (v39 > 0.27 ? (BOOL v42 = v38 > 2) : (BOOL v42 = 0),
              v42 || (v39 > 0.24 ? (BOOL v43 = v38 > 3) : (BOOL v43 = 0), v43 || v39 > 0.2 && v38 > 4 || v39 > 0.1 && v38 >= 6)))
        {
          double v39 = (v39 + 1.0) * 0.95 * 0.5;
          float v34 = v39;
          goto LABEL_51;
        }
      }
      if ((v27 & 1) == 0)
      {
        char v27 = 0;
        float v34 = v30 * v34;
LABEL_54:
        float v44 = (float)v38 / (float)v90;
        if (v44 >= 0.5) {
          float v44 = 1.0;
        }
        *(float *)&double v39 = v44 * v34;
        float v34 = v29 * *(float *)&v39;
        goto LABEL_57;
      }
LABEL_51:
      if (v91 >= 2)
      {
        double v39 = v34 * 0.9;
        float v34 = v39;
      }
      char v27 = 1;
      goto LABEL_54;
    }
    if (v36 >= (int)v91 && v89 != 0)
    {
      *(float *)&double v39 = (float)v38 / (float)v89;
      float v34 = v34 * *(float *)&v39;
    }
LABEL_57:
    float v31 = v31 + v34;
    ++v26;
  }
  while (v8 != v26);
  if (v74)
  {
    float v45 = (float)v8;
    if ((float)(v31 + v31) >= (float)v8) {
      float v46 = (float)v8;
    }
    else {
      float v46 = v31 + v31;
    }
    id v6 = v75;
    uint64_t v47 = [v75 queryString];
    unint64_t v48 = [v47 composedLength];
    float v49 = (float)v48 / (float)(unint64_t)[v79 length];

    LODWORD(v39) = 1.0;
    if (v49 <= 1.0) {
      *(float *)&double v39 = v49;
    }
    float v31 = v46 * *(float *)&v39;
  }
  else
  {
    float v45 = (float)v8;
    id v6 = v75;
  }
  float v50 = v31 / v45;
  if (v19 >= v8)
  {
    double v39 = v50;
    if (v50 >= 0.05)
    {
LABEL_68:
      float v9 = v50;
      goto LABEL_93;
    }
  }
  uint64_t v51 = objc_msgSend(v6, "queryString", v39);
  float v52 = [v51 lowercaseString];

  unint64_t v76 = [v79 lowercaseString];
  if ([v52 rangeOfString:@" "] == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_72:
    if ([v77 rangeOfString:v52] != 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v56 = v55;
      if ([v77 length])
      {
        float v9 = (float)((float)v56 / (float)(unint64_t)[v77 length]) * 0.4 * v29;
        goto LABEL_92;
      }
    }
    int v57 = [v5 lowercaseString];
    unint64_t v59 = [v57 rangeOfString:v52];
    if (v59 == 0x7FFFFFFFFFFFFFFFLL || (unint64_t v60 = v58, ![v57 length]))
    {
      id v80 = v77;
      unint64_t v64 = +[PRSRankingItem tokenizeContactsEmailAddress:v5 removeTLD:0 usernameTokenCount:&v91 usernameLength:&v90 domainLength:&v89 username:&v80];
      id v65 = v80;

      unint64_t v67 = [v64 rangeOfString:v52];
      if (v67 == 0x7FFFFFFFFFFFFFFFLL || (unint64_t v68 = v66, ![v64 length]))
      {
        BOOL v63 = v19 < v8;
        float v9 = 0.0;
      }
      else
      {
        float v69 = (float)(unint64_t)[v64 length];
        if (v67 > [v65 length])
        {
          uint64_t v70 = [v64 length];
          float v69 = v69 + (float)(unint64_t)(v70 + ~[v65 length]);
        }
        float v9 = (float)v68 / v69;
        BOOL v63 = 1;
      }

      unint64_t v77 = v65;
    }
    else
    {
      float v61 = (float)(unint64_t)[v57 length];
      if (v59 > [v77 length])
      {
        uint64_t v62 = [v57 length];
        float v61 = v61 + (float)(unint64_t)(v62 + ~[v77 length]);
      }
      float v9 = (float)v60 / v61;
      BOOL v63 = 1;
    }

    if (!v63) {
      goto LABEL_68;
    }
  }
  else
  {
    id v53 = [v52 stringByReplacingOccurrencesOfString:@" " withString:&stru_1F1824018];
    if ([v76 rangeOfString:v53])
    {

      goto LABEL_72;
    }
    float v9 = 1.0;
    if (v54 != [v76 length])
    {
      unint64_t v71 = [v53 length];
      float v9 = v29 * v73 * fmin((float)((float)v71 / (float)v90), 1.0);
    }

LABEL_92:
  }
LABEL_93:

  id v7 = v78;
LABEL_94:

  _Block_object_dispose(&v92, 8);
  _Block_object_dispose(&v98, 8);

LABEL_95:
  return v9;
}

void __72__PRSRankingItem_Scoring__matchScoreContactsEmailAddress_withEvaluator___block_invoke(uint64_t a1, char a2, uint64_t a3, unint64_t a4, uint64_t a5, unint64_t a6, unint64_t a7)
{
  unint64_t v10 = *(void *)(a1 + 56) - 1;
  if ((a2 & 7) != 1 || v10 != a6)
  {
    if ((a2 & 7) != 3 || v10 <= a6) {
      return;
    }
    uint64_t v12 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) objectAtIndexedSubscript:a6];
    int v13 = [v12 intValue];

    if (v13 != -1)
    {
      if (!a6) {
        return;
      }
      id v14 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) objectAtIndexedSubscript:a6];
      int v15 = [v14 intValue];
      id v16 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) objectAtIndexedSubscript:a6 - 1];
      int v17 = v15 - [v16 intValue];

      if (v17 == 1) {
        return;
      }
      int v18 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a7];
      [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v18 atIndexedSubscript:a6];

      unint64_t v19 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      unint64_t v20 = &unk_1F1864160;
      goto LABEL_30;
    }
    float v37 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a7];
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v37 atIndexedSubscript:a6];

    if (*(void *)(a1 + 64) > a7)
    {
      if (a7) {
        unint64_t v20 = &unk_1F18640C0;
      }
      else {
        unint64_t v20 = &unk_1F1864160;
      }
      unint64_t v19 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
LABEL_30:
      [v19 setObject:v20 atIndexedSubscript:a6];
      return;
    }
    if (*(void *)(a1 + 72))
    {
      float v40 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a6];
      float v41 = (float)(unint64_t)[v40 composedLength]
          / (float)(unint64_t)(2 * *(void *)(a1 + 72));

      float v42 = 1.0;
      if (v41 <= 1.0) {
        float v42 = v41;
      }
      double v39 = v42 * 0.5;
    }
    else
    {
      double v39 = 0.0;
    }
    uint64_t v32 = (void *)MEMORY[0x1E4F28ED0];
    goto LABEL_44;
  }
  if (a4)
  {
    unint64_t v22 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a6];
    float v23 = (float)(unint64_t)[v22 composedLength] / (float)a4;

    if (v23 > 1.0) {
      float v23 = 1.0;
    }
  }
  else
  {
    float v23 = 0.0;
  }
  uint64_t v24 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) objectAtIndexedSubscript:a6];
  int v25 = [v24 intValue];

  if (v25 != -1)
  {
    if (!a6) {
      return;
    }
    uint64_t v26 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) objectAtIndexedSubscript:a6];
    int v27 = [v26 intValue];
    float v28 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) objectAtIndexedSubscript:a6 - 1];
    int v29 = v27 - [v28 intValue];

    if (v29 == 1) {
      return;
    }
    uint64_t v35 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a7];
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v35 atIndexedSubscript:a6];

    uint64_t v32 = (void *)MEMORY[0x1E4F28ED0];
    goto LABEL_24;
  }
  float v30 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a7];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v30 atIndexedSubscript:a6];

  if (*(void *)(a1 + 64) <= a7)
  {
    if (*(void *)(a1 + 72))
    {
      unint64_t v38 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a6];
      float v23 = (float)(unint64_t)[v38 composedLength]
          / (float)(unint64_t)(2 * *(void *)(a1 + 72));

      if (v23 > 1.0) {
        float v23 = 1.0;
      }
    }
    uint64_t v32 = (void *)MEMORY[0x1E4F28ED0];
    double v33 = v23;
    double v34 = 0.5;
    goto LABEL_37;
  }
  uint64_t v32 = (void *)MEMORY[0x1E4F28ED0];
  if (a7)
  {
    double v33 = v23;
    double v34 = 0.95;
LABEL_37:
    double v39 = v33 * v34;
LABEL_44:
    uint64_t v36 = [v32 numberWithDouble:v39];
    goto LABEL_45;
  }
LABEL_24:
  *(float *)&double v31 = v23;
  uint64_t v36 = [v32 numberWithFloat:v31];
LABEL_45:
  id v43 = (id)v36;
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setObject:v36 atIndexedSubscript:a6];
}

- (float)matchScoreFileName:(id)a3 withEvaluator:(id)a4 isSearchToolClient:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  float v9 = [v8 queryTerms];
  uint64_t v10 = [v9 count];
  if (([v9 containsObject:@"keynote"] & 1) != 0
    || ([v9 containsObject:@"document"] & 1) != 0
    || ([v9 containsObject:@"file"] & 1) != 0
    || ([v9 containsObject:@"keynotes"] & 1) != 0
    || ([v9 containsObject:@"documents"] & 1) != 0
    || [v9 containsObject:@"files"])
  {
    --v10;
  }
  float v11 = 0.0;
  if ([v7 length] && v10)
  {
    if (v5) {
      +[PRSRankingItem tokenizeTitleString:v7 matchOption:8];
    }
    else {
    uint64_t v12 = +[PRSRankingItem tokenizeTitleString:v7];
    }
    uint64_t v23 = 0;
    uint64_t v24 = (float *)&v23;
    uint64_t v25 = 0x2020000000;
    int v26 = 0;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __79__PRSRankingItem_Scoring__matchScoreFileName_withEvaluator_isSearchToolClient___block_invoke;
    v22[3] = &unk_1E634D738;
    v22[4] = &v23;
    v22[5] = v10;
    +[PRSRankingItem matchScoreTokensFromText:v12 withEvaluator:v8 withHandler:v22];
    float v11 = v24[6];
    if (fabs(v11 + -1.0) >= 2.22044605e-16)
    {
      int v13 = [v7 stringByDeletingPathExtension];
      if (v5) {
        +[PRSRankingItem tokenizeTitleString:v13 matchOption:8];
      }
      else {
      id v14 = +[PRSRankingItem tokenizeTitleString:v13];
      }

      if ([v14 isEqualToString:v12])
      {
        float v11 = v24[6];
      }
      else
      {
        uint64_t v18 = 0;
        unint64_t v19 = (float *)&v18;
        uint64_t v20 = 0x2020000000;
        int v21 = 0;
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __79__PRSRankingItem_Scoring__matchScoreFileName_withEvaluator_isSearchToolClient___block_invoke_2;
        v17[3] = &unk_1E634D738;
        void v17[4] = &v18;
        v17[5] = v10;
        +[PRSRankingItem matchScoreTokensFromText:v14 withEvaluator:v8 withHandler:v17];
        double v15 = v19[6] * 0.9;
        if (v15 <= v24[6]) {
          float v11 = v24[6];
        }
        else {
          float v11 = v15;
        }
        _Block_object_dispose(&v18, 8);
      }
    }
    _Block_object_dispose(&v23, 8);
  }
  return v11;
}

float __79__PRSRankingItem_Scoring__matchScoreFileName_withEvaluator_isSearchToolClient___block_invoke(uint64_t a1, float result, uint64_t a3, unint64_t a4, int a5, uint64_t a6, uint64_t a7, unint64_t a8)
{
  unint64_t v8 = *(void *)(a1 + 40);
  if (v8 <= a8)
  {
    double v9 = result;
    double v10 = fmin((double)a4, 4.0);
    if (v10 <= (double)v8) {
      double v10 = (double)v8;
    }
    result = v9 / v10;
    *(float *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (a5)
    {
      uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
      result = fmin(*(float *)(v11 + 24) * 1.2, 1.0);
      *(float *)(v11 + 24) = result;
    }
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  }
  return result;
}

float __79__PRSRankingItem_Scoring__matchScoreFileName_withEvaluator_isSearchToolClient___block_invoke_2(uint64_t a1, float result, uint64_t a3, unint64_t a4, int a5, uint64_t a6, uint64_t a7, unint64_t a8)
{
  unint64_t v8 = *(void *)(a1 + 40);
  if (v8 <= a8)
  {
    double v9 = result;
    double v10 = fmin((double)a4, 4.0);
    if (v10 <= (double)v8) {
      double v10 = (double)v8;
    }
    result = v9 / v10;
    *(float *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (a5)
    {
      uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
      result = fmin(*(float *)(v11 + 24) * 1.2, 1.0);
      *(float *)(v11 + 24) = result;
    }
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  }
  return result;
}

- (float)matchScoreTitle:(id)a3 withEvaluator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(PRSRankingItem *)self matchScoreTitle:v6 withEvaluator:v7 matchOption:2];
  float v9 = v8;
  if (v8 < 0.1)
  {
    double v10 = [v7 queryString];
    uint64_t v11 = [v10 rangeOfCharacterFromSet:removeCharsTitle];

    if (v11 != 0x7FFFFFFFFFFFFFFFLL)
    {
      [(PRSRankingItem *)self matchScoreTitle:v6 withEvaluator:v7 matchOption:0];
      if (v9 < v12) {
        float v9 = v12;
      }
    }
  }

  return v9;
}

- (float)matchScoreTitle:(id)a3 withEvaluator:(id)a4 matchOption:(unsigned __int8)a5
{
  id v7 = a3;
  id v8 = a4;
  float v9 = [v8 queryTerms];
  uint64_t v10 = [v9 count];
  id v11 = v7;
  float v12 = v11;
  if ((a5 & 2) != 0)
  {
    float v12 = +[PRSRankingItem tokenizeTitleString:v11];
  }
  float v13 = 0.0;
  if ([v12 length] && v10)
  {
    uint64_t v20 = 0;
    int v21 = (float *)&v20;
    uint64_t v22 = 0x2020000000;
    int v23 = 0;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __69__PRSRankingItem_Scoring__matchScoreTitle_withEvaluator_matchOption___block_invoke;
    v15[3] = &unk_1E634D760;
    int v17 = &v20;
    uint64_t v18 = v10;
    unsigned __int8 v19 = a5;
    id v16 = v12;
    +[PRSRankingItem matchScoreTokensFromText:v16 withEvaluator:v8 withHandler:v15];
    float v13 = v21[6];

    _Block_object_dispose(&v20, 8);
  }

  return v13;
}

void __69__PRSRankingItem_Scoring__matchScoreTitle_withEvaluator_matchOption___block_invoke(uint64_t a1, void *a2, unint64_t a3, int a4, float a5, uint64_t a6, uint64_t a7, unint64_t a8)
{
  id v13 = a2;
  unint64_t v14 = *(void *)(a1 + 48);
  if (v14 > a8)
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    goto LABEL_17;
  }
  if (a3 > 0xA || (*(unsigned char *)(a1 + 56) & 4) != 0)
  {
    if (v14 <= a3) {
      unint64_t v14 = a3;
    }
    float v15 = a5 / (float)v14;
    goto LABEL_15;
  }
  if ((*(unsigned char *)(a1 + 56) & 2) != 0) {
    goto LABEL_12;
  }
  id v19 = v13;
  if ((unint64_t)[*(id *)(a1 + 32) composedLength] <= 0x32)
  {
    unint64_t v14 = *(void *)(a1 + 48);
    id v13 = v19;
LABEL_12:
    double v16 = fmin((double)a3, 4.0);
    if (v16 <= (double)v14) {
      double v16 = (double)v14;
    }
    float v15 = a5 / v16;
    goto LABEL_15;
  }
  float v15 = a5 * 0.1;
  id v13 = v19;
LABEL_15:
  *(float *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v15;
  if (a4)
  {
    uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 8);
    float v18 = fmin(*(float *)(v17 + 24) * 1.4, 1.0);
    *(float *)(v17 + 24) = v18;
  }
LABEL_17:
}

- (float)matchScoreSettings:(id)a3 withEvaluator:(id)a4 matchOption:(unsigned __int8)a5
{
  id v7 = a3;
  id v8 = a4;
  float v9 = [v8 queryTerms];
  uint64_t v10 = [v9 count];
  float v11 = 0.0;
  if ([v7 length] && v10)
  {
    id v12 = v7;
    if ((a5 & 2) != 0)
    {
      uint64_t v13 = +[PRSRankingItem tokenizeTitleString:v12];

      id v12 = (id)v13;
    }
    if ([v12 length])
    {
      uint64_t v21 = 0;
      uint64_t v22 = (float *)&v21;
      uint64_t v23 = 0x2020000000;
      int v24 = 0;
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __72__PRSRankingItem_Scoring__matchScoreSettings_withEvaluator_matchOption___block_invoke;
      v15[3] = &unk_1E634D788;
      id v19 = &v21;
      uint64_t v20 = v10;
      id v16 = v8;
      id v17 = v12;
      id v18 = v9;
      +[PRSRankingItem matchScoreTokensFromText:v17 withEvaluator:v16 withHandler:v15];
      float v11 = v22[6];

      _Block_object_dispose(&v21, 8);
    }
  }
  return v11;
}

void __72__PRSRankingItem_Scoring__matchScoreSettings_withEvaluator_matchOption___block_invoke(uint64_t a1, void *a2, unint64_t a3, int a4, int a5, int a6, unint64_t a7, float a8)
{
  id v14 = a2;
  unint64_t v15 = *(void *)(a1 + 64);
  if (v15 <= a3) {
    unint64_t v16 = a3;
  }
  else {
    unint64_t v16 = *(void *)(a1 + 64);
  }
  *(float *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = a8 / (float)v16;
  id v36 = v14;
  if (v15 > a7 || *(float *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) < 0.1)
  {
    id v17 = [*(id *)(a1 + 32) queryString];
    id v18 = [v17 lowercaseString];

    [*(id *)(a1 + 40) rangeOfString:v18];
    unint64_t v20 = v19;
    if ([*(id *)(a1 + 40) rangeOfString:@" "] == 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v21 = 0;
      uint64_t v22 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      uint64_t v23 = [*(id *)(a1 + 40) stringByReplacingOccurrencesOfString:@" " withString:&stru_1F1824018];
      uint64_t v22 = [v23 rangeOfString:v18];
      unint64_t v21 = v24;
    }
    if (v22 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if ([v18 rangeOfString:@" "] == 0x7FFFFFFFFFFFFFFFLL)
      {
LABEL_15:

        unint64_t v15 = *(void *)(a1 + 64);
        id v14 = v36;
        goto LABEL_16;
      }
      uint64_t v25 = [v18 stringByReplacingOccurrencesOfString:@" " withString:&stru_1F1824018];
      uint64_t v22 = [*(id *)(a1 + 40) rangeOfString:v25];
      unint64_t v21 = v26;
    }
    if (!v22 && v21 > v20)
    {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1062836634;

      id v14 = v36;
      goto LABEL_42;
    }
    goto LABEL_15;
  }
LABEL_16:
  if (v15 == 1 && *(float *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) < 1.0)
  {
    int v27 = [*(id *)(a1 + 48) objectAtIndexedSubscript:0];
    unint64_t v28 = [v27 composedLength];

    if (a8 < 0.2 && v28 <= 2)
    {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
LABEL_39:
      id v14 = v36;
      goto LABEL_40;
    }
    if (!a5)
    {
      uint64_t v30 = *(void *)(*(void *)(a1 + 56) + 8);
      if (a6)
      {
        if (v28 < 4) {
          int v31 = 1050253722;
        }
        else {
          int v31 = 1058642330;
        }
      }
      else if (v28 < 4)
      {
        int v31 = 1045220557;
      }
      else
      {
        int v31 = 1056964608;
      }
      goto LABEL_38;
    }
    if (a3 == 1 && v28 >= 3)
    {
      uint64_t v30 = *(void *)(*(void *)(a1 + 56) + 8);
      int v31 = 1060320051;
LABEL_38:
      *(_DWORD *)(v30 + 24) = v31;
      goto LABEL_39;
    }
    id v14 = v36;
    if (v28 < 4) {
      int v32 = 1053609165;
    }
    else {
      int v32 = 1059984507;
    }
    *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v32;
  }
LABEL_40:
  if (a4)
  {
    uint64_t v33 = *(void *)(*(void *)(a1 + 56) + 8);
    float v34 = fmin(*(float *)(v33 + 24) * 1.2, 1.0);
    *(float *)(v33 + 24) = v34;
  }
LABEL_42:
}

+ (void)matchScoreTokensFromText:(id)a3 withEvaluator:(id)a4 withHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v35 = a5;
  float v34 = [v8 queryTerms];
  unint64_t v9 = [v34 count];
  uint64_t v49 = 0;
  float v50 = (float *)&v49;
  uint64_t v51 = 0x2020000000;
  int v52 = 0;
  uint64_t v43 = 0;
  float v44 = &v43;
  uint64_t v45 = 0x3032000000;
  float v46 = __Block_byref_object_copy__8;
  uint64_t v47 = __Block_byref_object_dispose__8;
  id v48 = 0;
  id v48 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v9];
  if (v9)
  {
    for (uint64_t i = 0; i != v9; ++i)
      [(id)v44[5] insertObject:&unk_1F1861A48 atIndex:i];
  }
  if ([v7 length] && v9)
  {
    uint64_t v33 = v7;
    float v11 = [v8 language];
    if (v11)
    {
      id v12 = [v8 language];
      if ([v12 hasPrefix:@"zh"])
      {
        uint64_t v13 = 0;
      }
      else
      {
        id v14 = [v8 language];
        if ([v14 hasPrefix:@"ja"])
        {
          uint64_t v13 = 0;
        }
        else
        {
          unint64_t v15 = [v8 language];
          uint64_t v13 = [v15 hasPrefix:@"ko"] ^ 1;
        }
      }
    }
    else
    {
      uint64_t v13 = 1;
    }

    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __78__PRSRankingItem_Scoring__matchScoreTokensFromText_withEvaluator_withHandler___block_invoke;
    v36[3] = &unk_1E634D7B0;
    unint64_t v42 = v9;
    float v40 = &v43;
    id v37 = v8;
    id v38 = v33;
    float v41 = &v49;
    id v39 = v34;
    uint64_t v16 = [v37 evaluateAttribute:v38 ignoreSubtokens:v13 strongCompounds:1 skipTranscriptions:0 withHandler:v36];
    uint64_t v17 = 0;
    char v18 = 0;
    char v19 = 0;
    do
    {
      unint64_t v20 = [(id)v44[5] objectAtIndexedSubscript:v17];
      BOOL v21 = [v20 intValue] == 0;

      uint64_t v22 = [(id)v44[5] objectAtIndexedSubscript:v17];
      v19 |= v21;
      BOOL v23 = [v22 intValue] + 1 == v16;

      v18 |= v23;
      ++v17;
    }
    while (v9 != v17);
    [(id)v44[5] objectAtIndexedSubscript:0];
    v24 = id v7 = v33;
    int v25 = [v24 intValue];

    uint64_t v26 = v25 != -1;
    if (v9 < 2)
    {
      uint64_t v31 = 0;
    }
    else
    {
      id v32 = v8;
      uint64_t v27 = 1;
      char v28 = 1;
      do
      {
        int v29 = [(id)v44[5] objectAtIndexedSubscript:v27];
        int v30 = [v29 intValue];

        if (v30 == -1 || v25 != -1 && v30 - v25 != 1) {
          char v28 = 0;
        }
        v26 += v30 >= 0;
        ++v27;
        int v25 = v30;
      }
      while (v9 != v27);
      uint64_t v31 = v28 & 1;
      id v8 = v32;
      id v7 = v33;
    }
    (*((void (**)(id, uint64_t, uint64_t, uint64_t, void, void, uint64_t, float))v35 + 2))(v35, v44[5], v16, v31, v19 & 1, v18 & 1, v26, v50[6]);
  }
  else
  {
    (*((void (**)(id, uint64_t, void, void, void, void, void, float))v35 + 2))(v35, v44[5], 0, 0, 0, 0, 0, v50[6]);
  }
  _Block_object_dispose(&v43, 8);

  _Block_object_dispose(&v49, 8);
}

void __78__PRSRankingItem_Scoring__matchScoreTokensFromText_withEvaluator_withHandler___block_invoke(uint64_t a1, char a2, uint64_t a3, unint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7)
{
  unint64_t v10 = *(void *)(a1 + 72) - 1;
  if ((a2 & 7) == 1 && v10 == a6)
  {
    char v18 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) objectAtIndexedSubscript:a6];
    int v19 = [v18 intValue];

    if (v19 == -1)
    {
      int v25 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a7];
      [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setObject:v25 atIndexedSubscript:a6];

      uint64_t v26 = [*(id *)(a1 + 32) queryString];
      int v27 = [v26 containsCJK];
      int v28 = [*(id *)(a1 + 40) containsCJK];

      if (v27 == v28)
      {
        uint64_t v31 = [*(id *)(a1 + 48) objectAtIndexedSubscript:a6];
        float v32 = (float)(unint64_t)[v31 composedLength];
        float v33 = (float)a4;
      }
      else
      {
        int v29 = [*(id *)(a1 + 32) queryString];
        int v30 = [v29 containsCJK];

        if (v30)
        {
          uint64_t v31 = [*(id *)(a1 + 48) objectAtIndexedSubscript:a6];
          float v32 = (float)(unint64_t)[v31 composedLength];
          float v33 = (float)a4 / 3.6;
        }
        else
        {
          if (![*(id *)(a1 + 40) containsCJK]) {
            return;
          }
          uint64_t v31 = [*(id *)(a1 + 48) objectAtIndexedSubscript:a6];
          float v32 = (float)(unint64_t)[v31 composedLength];
          float v33 = (float)a4 * 3.6;
        }
      }
      float v34 = v32 / v33;

      double v35 = v34;
      if (v34 > 1.0) {
        double v35 = 1.0;
      }
      uint64_t v15 = *(void *)(*(void *)(a1 + 64) + 8);
      float v16 = v35 + *(float *)(v15 + 24);
      goto LABEL_26;
    }
  }
  else
  {
    if ((a2 & 7) != 3 || v10 <= a6) {
      return;
    }
    id v12 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) objectAtIndexedSubscript:a6];
    int v13 = [v12 intValue];

    if (v13 == -1)
    {
      id v14 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a7];
      [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setObject:v14 atIndexedSubscript:a6];

      uint64_t v15 = *(void *)(*(void *)(a1 + 64) + 8);
      float v16 = *(float *)(v15 + 24) + 1.0;
LABEL_26:
      *(float *)(v15 + 24) = v16;
      return;
    }
  }
  id v36 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) objectAtIndexedSubscript:a6];
  int v20 = [v36 intValue];
  if (a6 && v20 != -1)
  {
    BOOL v21 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) objectAtIndexedSubscript:a6];
    int v22 = [v21 intValue];
    BOOL v23 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) objectAtIndexedSubscript:a6 - 1];
    int v24 = v22 - [v23 intValue];

    if (v24 == 1) {
      return;
    }
    id v36 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a7];
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setObject:v36 atIndexedSubscript:a6];
  }
}

- (float)matchScoreForApplicationsWithEvaluator:(id)a3
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = SSCompactRankingAttrsGetValue((int8x8_t *)[(PRSRankingItem *)self attributes], 7uLL);
  float v6 = 0.0;
  float v7 = 0.0;
  if ([v5 length])
  {
    [(PRSRankingItem *)self matchScoreAppName:v5 withEvaluator:v4];
    float v7 = v8;
  }
  unint64_t v9 = [(PRSRankingItem *)self firstMatchedAltName];
  uint64_t v10 = [v9 length];

  if (v10)
  {
    float v11 = [v4 queryString];
    float v12 = (float)(unint64_t)[v11 length];
    int v13 = [(PRSRankingItem *)self firstMatchedAltName];
    double v14 = (float)(v12 / (float)(unint64_t)[v13 length]);

    uint64_t v15 = [(PRSRankingItem *)self firstMatchedAltName];
    if (v14 <= 0.1) {
      [(PRSRankingItem *)self matchScoreTitle:v15 withEvaluator:v4 matchOption:0];
    }
    else {
      [(PRSRankingItem *)self matchScoreAppName:v15 withEvaluator:v4];
    }
    float v6 = v16;

    char v18 = SSCompactRankingAttrsGetValue((int8x8_t *)[(PRSRankingItem *)self attributes], 0x176uLL);
    float v17 = 0.6;
    if ([v5 length])
    {
      if ([v5 startCJK])
      {
        if ([v18 length])
        {
          int v19 = [v4 queryString];
          unint64_t v20 = [v19 composedLength];

          if (v20 >= 4)
          {
            [(PRSRankingItem *)self matchScoreTitle:v18 withEvaluator:v4 matchOption:0];
            double v22 = v21;
            double v23 = v22 * 0.4 + 0.600000024;
            if (v23 > 1.0) {
              double v23 = 1.0;
            }
            float v24 = v23;
            if (v22 >= 0.1) {
              float v17 = v24;
            }
            else {
              float v17 = 0.6;
            }
          }
        }
      }
    }
  }
  else
  {
    float v17 = 0.6;
  }
  int v25 = [v4 isCJK];
  if (v25) {
    float v26 = 0.59;
  }
  else {
    float v26 = 0.2;
  }
  if ((v25 & (v17 < 0.91)) != 0) {
    float v17 = 0.91;
  }
  int v27 = SSCompactRankingAttrsGetValue((int8x8_t *)[(PRSRankingItem *)self attributes], 0x3FuLL);
  float v28 = 0.0;
  if (v27)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v29 = v27;
      if ((unint64_t)[v29 composedLength] >= 2)
      {
        int v30 = [v29 componentsSeparatedByString:@","];
        if ([v30 count])
        {
          unint64_t v31 = [v30 count];
          uint64_t v32 = v31 >= 0x1E ? 30 : v31;
          if (v32)
          {
            uint64_t v33 = 0;
            while (1)
            {
              float v34 = [v30 objectAtIndexedSubscript:v33];
              if ((unint64_t)[v34 composedLength] >= 2
                && (!v5 || ([v5 localizedCaseInsensitiveContainsString:v34] & 1) == 0))
              {
                [(PRSRankingItem *)self matchScoreAppName:v34 withEvaluator:v4 matchOption:0];
                if (v35 >= 1.0) {
                  break;
                }
              }

              if (v32 == ++v33) {
                goto LABEL_39;
              }
            }

            float v28 = 1.0;
          }
        }
LABEL_39:
      }
    }
  }
  float v36 = v6 * v17;
  if (v7 >= (float)(v6 * v17)) {
    float v36 = v7;
  }
  if (v36 >= (float)(v26 * v28)) {
    float v37 = v36;
  }
  else {
    float v37 = v26 * v28;
  }
  if (SSEnableAppSearchV2())
  {
    id v38 = [v4 queryString];
    if ((isAppPrefixMatch() & 1) == 0 && v37 < 0.5)
    {
      id v39 = [v5 lowercaseString];
      [v4 isCJK];
      appErrorScore();
      float v41 = v40;

      if (v41 > 0.9)
      {
        -[PRSRankingItem setSpellCorrectedApp:](self, "setSpellCorrectedApp:", 1, v41);
        float v42 = v41 + -0.5;
        if (v37 < v42) {
          float v37 = v42;
        }
        uint64_t v43 = SSGeneralLog();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          float v44 = SSRedactString(v38, 1);
          uint64_t v45 = SSRedactString(v5, 1);
          *(_DWORD *)buf = 138413058;
          unint64_t v55 = v44;
          __int16 v56 = 2112;
          int v57 = v45;
          __int16 v58 = 2048;
          double v59 = v42;
          __int16 v60 = 2048;
          double v61 = v37;
          _os_log_impl(&dword_1BDB2A000, v43, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] <AppSpellCorrection> query: %@, app name: %@, matchScore: %f, finalScore = %f", buf, 0x2Au);
        }
      }
    }
  }
  double v46 = v37;
  if (v37 < 0.1)
  {
    uint64_t v47 = SSCompactRankingAttrsGetValue((int8x8_t *)[(PRSRankingItem *)self attributes], 0x47uLL);
    if (v47)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v48 = v47;
        if ([v48 length] && objc_msgSend(v5, "length"))
        {
          uint64_t v49 = [NSString stringWithFormat:@"%@ %@", v5, v48];
          [(PRSRankingItem *)self matchScoreAppName:v49 withEvaluator:v4 matchOption:2];
          if (v50 > 0.9) {
            float v37 = v50;
          }
        }
      }
    }
  }
  *(float *)&double v46 = v37;
  [(PRSRankingItem *)self setKeywordMatchScore:v46];
  [(PRSRankingItem *)self keywordMatchScore];
  float v52 = v51;

  return v52;
}

- (float)matchScoreForContactsWithEvaluator:(id)a3 quParsedEvaluator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  float v8 = SSCompactRankingAttrsGetValue((int8x8_t *)[(PRSRankingItem *)self attributes], 7uLL);
  float v9 = 0.0;
  float v10 = 0.0;
  if ([v8 length])
  {
    [(PRSRankingItem *)self matchScoreContactsName:v8 withEvaluator:v6];
    float v10 = v11;
    if (v11 < 2.2204e-16)
    {
      [(PRSRankingItem *)self matchScoreContactsName:v8 withEvaluator:v7];
      float v10 = v12;
    }
  }
  int v13 = [(PRSRankingItem *)self firstMatchedAltName];
  uint64_t v14 = [v13 length];

  if (v14)
  {
    uint64_t v15 = [(PRSRankingItem *)self firstMatchedAltName];
    [(PRSRankingItem *)self matchScoreContactsName:v15 withEvaluator:v6];
    float v9 = v16;

    if (v9 < 2.2204e-16)
    {
      float v17 = [(PRSRankingItem *)self firstMatchedAltName];
      [(PRSRankingItem *)self matchScoreContactsName:v17 withEvaluator:v7];
      float v9 = v18;
    }
  }
  double v19 = v9 * 0.95;
  if (v19 <= v10) {
    *(float *)&double v19 = v10;
  }
  else {
    *(float *)&double v19 = v19;
  }
  [(PRSRankingItem *)self setKeywordMatchScore:v19];
  [(PRSRankingItem *)self keywordMatchScore];
  float v21 = v20;

  return v21;
}

- (float)matchScoreForSafariWithEvaluator:(id)a3 quParsedEvaluator:(id)a4 isSearchToolClient:(BOOL)a5
{
  unsigned int v5 = a5;
  id v8 = a3;
  id v9 = a4;
  uint64_t v26 = 0;
  SSCompactRankingAttrsGetFloat((uint64_t)[(PRSRankingItem *)self attributes], 0x14BuLL, (_DWORD *)&v26 + 1);
  SSCompactRankingAttrsGetFloat((uint64_t)[(PRSRankingItem *)self attributes], 0x41uLL, &v26);
  float v10 = *((float *)&v26 + 1);
  if (*((float *)&v26 + 1) < *(float *)&v26) {
    float v10 = *(float *)&v26;
  }
  if (v10 > 0.0
    || ([(PRSRankingItem *)self contentType],
        float v11 = objc_claimAutoreleasedReturnValue(),
        int v12 = [v11 isEqualToString:@"com.apple.safari.bookmark"],
        v11,
        float v13 = 0.0,
        v12))
  {
    uint64_t v14 = SSCompactRankingAttrsGetValue((int8x8_t *)[(PRSRankingItem *)self attributes], 0xDuLL);
    uint64_t v15 = SSCompactRankingAttrsGetValue((int8x8_t *)[(PRSRankingItem *)self attributes], 0xCuLL);
    float v16 = 0.0;
    float v13 = 0.0;
    if ([v14 length])
    {
      if ([(PRSRankingItem *)self isSearchResultPage:v14])
      {
LABEL_18:

        goto LABEL_19;
      }
      [(PRSRankingItem *)self matchScoreURLString:v14 withEvaluator:v8];
      float v13 = *(float *)&v17;
      if (*(float *)&v17 < 2.2204e-16)
      {
        [(PRSRankingItem *)self matchScoreURLString:v14 withEvaluator:v9];
        float v13 = *(float *)&v17;
      }
      *(float *)&double v17 = v13;
      [(PRSRankingItem *)self setSafariMatchScoreContentURL:v17];
    }
    if ([v15 length])
    {
      [(PRSRankingItem *)self matchScoreTitle:v15 withEvaluator:v8];
      float v16 = *(float *)&v19;
      if (*(float *)&v19 < 2.2204e-16)
      {
        [(PRSRankingItem *)self matchScoreTitle:v15 withEvaluator:v9];
        float v16 = *(float *)&v19;
      }
      *(float *)&double v19 = v16;
      [(PRSRankingItem *)self setSafariMatchScoreTitle:v19];
    }
    if (v13 >= v16) {
      *(float *)&double v18 = v13;
    }
    else {
      *(float *)&double v18 = v16;
    }
    [(PRSRankingItem *)self setKeywordMatchScore:v18];
    [(PRSRankingItem *)self keywordMatchScore];
    [(PRSRankingItem *)self embeddingSimilarity];
    [(PRSRankingItem *)self pommesL1Score];
    uint64_t v20 = [(PRSRankingItem *)self bundleIDType];
    float v21 = [v8 queryString];
    double v22 = [v8 language];
    chooseTopicality(v20, 0, v5);
    float v24 = v23;

    float v13 = v24 * 0.8;
    goto LABEL_18;
  }
LABEL_19:

  return v13;
}

- (float)matchScoreForNotesWithEvaluator:(id)a3 isSearchToolClient:(BOOL)a4
{
  unsigned int v4 = a4;
  id v6 = a3;
  id v7 = SSCompactRankingAttrsGetValue((int8x8_t *)[(PRSRankingItem *)self attributes], 7uLL);
  if ([v7 length]) {
    [(PRSRankingItem *)self matchScoreTitle:v7 withEvaluator:v6];
  }
  else {
    double v8 = 0.0;
  }
  [(PRSRankingItem *)self setKeywordMatchScore:v8];
  [(PRSRankingItem *)self keywordMatchScore];
  [(PRSRankingItem *)self embeddingSimilarity];
  [(PRSRankingItem *)self pommesL1Score];
  uint64_t v9 = [(PRSRankingItem *)self bundleIDType];
  float v10 = [v6 queryString];
  float v11 = [v6 language];
  chooseTopicality(v9, 0, v4);
  float v13 = v12;

  double v14 = v13;
  if (v14 < 0.4) {
    goto LABEL_9;
  }
  uint64_t v15 = [v6 queryTerms];
  uint64_t v16 = [v15 count];

  if (v16 != 2)
  {
    double v18 = [v6 queryTerms];
    unint64_t v19 = [v18 count];

    if (v19 > 2)
    {
      double v17 = 0.9;
      goto LABEL_10;
    }
LABEL_9:
    double v17 = 0.6;
    goto LABEL_10;
  }
  double v17 = 0.8;
LABEL_10:
  float v20 = v17 * v14;

  return v20;
}

- (float)matchScoreForFilesWithEvaluator:(id)a3 quParsedEvaluator:(id)a4 isSearchToolClient:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  float v10 = SSCompactRankingAttrsGetValue((int8x8_t *)[(PRSRankingItem *)self attributes], 0x35uLL);
  if (![v10 length])
  {
    uint64_t v11 = SSCompactRankingAttrsGetValue((int8x8_t *)[(PRSRankingItem *)self attributes], 7uLL);

    float v10 = (void *)v11;
  }
  if (v5)
  {
    [(PRSRankingItem *)self matchScoreFileName:v10 withEvaluator:v9 isSearchToolClient:1];
    float v13 = v12;
    -[PRSRankingItem setKeywordMatchScore:](self, "setKeywordMatchScore:");
  }
  else
  {
    [(PRSRankingItem *)self matchScoreFileName:v10 withEvaluator:v8 isSearchToolClient:0];
    float v15 = v14;
    if (v14 < 2.2204e-16)
    {
      [(PRSRankingItem *)self matchScoreTitle:v10 withEvaluator:v8 matchOption:0];
      float v15 = v16;
      if (v9)
      {
        if (v16 == 0.0)
        {
          [(PRSRankingItem *)self matchScoreTitle:v10 withEvaluator:v9 matchOption:0];
          float v15 = v17;
        }
      }
    }
    double v18 = [(PRSRankingItem *)self contentType];
    int v19 = [v18 isEqualToString:@"public.folder"];

    double v20 = 0.8;
    double v21 = v15 * 0.8;
    *(float *)&double v21 = v21;
    if (!v19) {
      *(float *)&double v21 = v15;
    }
    [(PRSRankingItem *)self setKeywordMatchScore:v21];
    [(PRSRankingItem *)self keywordMatchScore];
    float v23 = v22;
    [(PRSRankingItem *)self embeddingSimilarity];
    [(PRSRankingItem *)self pommesL1Score];
    float v25 = v24;
    unint64_t v26 = [(PRSRankingItem *)self bundleIDType];
    int v27 = [v8 queryString];
    float v28 = [v8 language];
    _os_feature_enabled_impl();
    SSEnableSearchToolCleanSlate(0);
    _os_feature_enabled_impl();
    _os_feature_enabled_impl();
    if (_os_feature_enabled_impl())
    {
      if ((v26 & 0x200000080) != 0)
      {
        if (v25 >= v23) {
          float v29 = v25;
        }
        else {
          float v29 = v23;
        }
      }
      else if (v23 <= 0.0 || (float v29 = v23, v25 >= 2.2204e-16))
      {
        if (v23 <= 0.0)
        {
          float v29 = v25;
        }
        else
        {
          float v29 = v25;
          if ((v26 & 0x20) != 0) {
            float v29 = v25 * 0.2 + v23 * 0.8;
          }
        }
      }
    }
    else
    {
      float v29 = v23;
    }

    if (v29 >= 0.4)
    {
      int v30 = [v8 queryTerms];
      uint64_t v31 = [v30 count];

      if (v31 != 2)
      {
        uint64_t v32 = [v8 queryTerms];
        BOOL v33 = (unint64_t)[v32 count] > 2;

        double v20 = dbl_1BDC5DA70[v33];
      }
    }
    else
    {
      double v20 = 0.6;
    }
    float v13 = v20 * v29;
  }

  return v13;
}

- (float)matchScoreForCalendarWithEvaluator:(id)a3 quParsedEvaluator:(id)a4 isSearchToolClient:(BOOL)a5
{
  unsigned int v5 = a5;
  id v8 = a3;
  id v9 = a4;
  float v10 = SSCompactRankingAttrsGetValue((int8x8_t *)[(PRSRankingItem *)self attributes], 0xCuLL);
  uint64_t v11 = SSCompactRankingAttrsGetValue((int8x8_t *)[(PRSRankingItem *)self attributes], 5uLL);
  float v12 = extractStringFromArray(v11);

  if (![v10 length])
  {
    float v14 = 0.0;
LABEL_8:
    float v16 = SSCompactRankingAttrsGetValue((int8x8_t *)[(PRSRankingItem *)self attributes], 0x14uLL);
    if ([v16 length])
    {
      uint64_t v17 = [v10 stringByAppendingFormat:@" %@", v16];

      [(PRSRankingItem *)self matchScoreTitle:v17 withEvaluator:v8];
      float v14 = v18;
      float v10 = (void *)v17;
    }
    if (v9 && v14 < 2.2204e-16)
    {
      [(PRSRankingItem *)self matchScoreTitle:v10 withEvaluator:v9];
      float v14 = v19;
    }
    float v14 = v14 * 0.5;

    goto LABEL_14;
  }
  [(PRSRankingItem *)self matchScoreTitle:v10 withEvaluator:v8];
  float v14 = v13;
  if (v9 && v13 < 2.2204e-16)
  {
    [(PRSRankingItem *)self matchScoreTitle:v10 withEvaluator:v9];
    float v14 = v15;
  }
  if (v14 < 2.2204e-16) {
    goto LABEL_8;
  }
LABEL_14:
  if ([v12 length])
  {
    [(PRSRankingItem *)self matchScoreContactsName:v12 withEvaluator:v8];
    double v21 = v20;
  }
  else
  {
    double v21 = 0.0;
  }
  double v22 = v14;
  if ([v10 containsCJK])
  {
    if (v22 < 0.4)
    {
      double v23 = 0.7;
    }
    else
    {
      float v24 = [v8 queryTerms];
      unint64_t v25 = [v24 count];

      if (v25 <= 2)
      {
        float v28 = [v8 queryTerms];
        uint64_t v29 = [v28 count];

        double v23 = 0.85;
        if (v29 != 2) {
          double v23 = 0.75;
        }
      }
      else
      {
        double v23 = 0.95;
      }
    }
  }
  else if (v22 < 0.4)
  {
    double v23 = 0.6;
  }
  else
  {
    unint64_t v26 = [v8 queryTerms];
    unint64_t v27 = [v26 count];

    if (v27 <= 2)
    {
      int v30 = [v8 queryTerms];
      BOOL v31 = [v30 count] == 2;

      double v23 = dbl_1BDC5DA80[v31];
    }
    else
    {
      double v23 = 0.9;
    }
  }
  float v32 = v23 * v22;
  double v33 = fmin(v32 + v21 * 0.2, 1.0);
  *(float *)&double v33 = v33;
  [(PRSRankingItem *)self setKeywordMatchScore:v33];
  [(PRSRankingItem *)self keywordMatchScore];
  [(PRSRankingItem *)self embeddingSimilarity];
  [(PRSRankingItem *)self pommesL1Score];
  uint64_t v34 = [(PRSRankingItem *)self bundleIDType];
  float v35 = [v8 queryString];
  float v36 = [v8 language];
  chooseTopicality(v34, 0, v5);
  float v38 = v37;

  return v38;
}

- (float)matchScoreForMailWithEvaluator:(id)a3 isSearchToolClient:(BOOL)a4
{
  unsigned int v4 = a4;
  id v6 = a3;
  id v7 = SSCompactRankingAttrsGetValue((int8x8_t *)[(PRSRankingItem *)self attributes], 4uLL);
  double v8 = 0.0;
  double v9 = 0.0;
  if ([v7 length])
  {
    [(PRSRankingItem *)self matchScoreTitle:v7 withEvaluator:v6 matchOption:6];
    double v9 = v10 * 0.55;
  }
  uint64_t v11 = SSCompactRankingAttrsGetValue((int8x8_t *)[(PRSRankingItem *)self attributes], 5uLL);
  float v12 = extractStringFromArray(v11);

  if ([v12 length])
  {
    [(PRSRankingItem *)self matchScoreContactsName:v12 withEvaluator:v6];
    double v8 = v13 * 0.3;
  }
  float v14 = SSCompactRankingAttrsGetValue((int8x8_t *)[(PRSRankingItem *)self attributes], 0x23uLL);
  float v15 = extractStringFromArray(v14);

  if ([v15 length])
  {
    [(PRSRankingItem *)self matchScoreContactsEmailAddress:v15 withEvaluator:v6];
    double v17 = v16 * 0.55;
  }
  else
  {
    double v17 = 0.0;
  }
  if (v9 >= v8) {
    double v18 = v9;
  }
  else {
    double v18 = v8;
  }
  if (v17 < v18) {
    double v17 = v18;
  }
  double v19 = fmin(v17, 1.0);
  *(float *)&double v19 = v19;
  [(PRSRankingItem *)self setKeywordMatchScore:v19];
  [(PRSRankingItem *)self keywordMatchScore];
  [(PRSRankingItem *)self embeddingSimilarity];
  [(PRSRankingItem *)self pommesL1Score];
  uint64_t v20 = [(PRSRankingItem *)self bundleIDType];
  double v21 = [v6 queryString];
  double v22 = [v6 language];
  chooseTopicality(v20, 0, v4);
  float v24 = v23;

  unint64_t v25 = [v6 queryTerms];
  unint64_t v26 = [v25 count];

  if (v26 >= 2)
  {
    float v28 = [v6 queryTerms];
    uint64_t v29 = [v28 count];

    float v27 = 0.8;
    if (v29 != 2) {
      float v27 = 1.0;
    }
  }
  else
  {
    float v27 = 0.6;
  }
  float v30 = fminf(v24 * v27, 1.0);

  return v30;
}

- (float)matchScoreForMessagesWithEvaluator:(id)a3 isSearchToolClient:(BOOL)a4
{
  unsigned int v4 = a4;
  id v6 = a3;
  [(PRSRankingItem *)self setKeywordMatchScore:0.0];
  [(PRSRankingItem *)self keywordMatchScore];
  [(PRSRankingItem *)self embeddingSimilarity];
  [(PRSRankingItem *)self pommesL1Score];
  uint64_t v7 = [(PRSRankingItem *)self bundleIDType];
  double v8 = [v6 queryString];
  double v9 = [v6 language];
  chooseTopicality(v7, 0, v4);
  float v11 = v10;

  float v12 = [v6 queryTerms];
  unint64_t v13 = [v12 count];

  if (v13 >= 2)
  {
    float v15 = [v6 queryTerms];
    uint64_t v16 = [v15 count];

    float v14 = 0.8;
    if (v16 != 2) {
      float v14 = 1.0;
    }
  }
  else
  {
    float v14 = 0.6;
  }
  float v17 = fminf(v11 * v14, 1.0);

  return v17;
}

- (void)parsePreferenceIdentity:(id)a3 withHandler:(id)a4
{
  id v14 = a3;
  unsigned int v5 = (void (**)(id, __CFString *, __CFString *))a4;
  if ((unint64_t)[v14 length] > 0xB)
  {
    double v8 = [v14 substringFromIndex:6];
    double v9 = [v8 componentsSeparatedByString:@"root="];

    if ([v9 count] == 2
      && ([v9 objectAtIndexedSubscript:1],
          float v10 = objc_claimAutoreleasedReturnValue(),
          uint64_t v11 = [v10 length],
          v10,
          v11))
    {
      float v12 = [v9 objectAtIndexedSubscript:1];
      unint64_t v13 = [v12 componentsSeparatedByString:@"&path="];

      if ([v13 count])
      {
        id v6 = [v13 objectAtIndexedSubscript:0];
        if ((unint64_t)[v13 count] < 2)
        {
          uint64_t v7 = &stru_1F1824018;
        }
        else
        {
          uint64_t v7 = [v13 objectAtIndexedSubscript:1];
        }
        v5[2](v5, v6, v7);
      }
      else
      {
        id v6 = &stru_1F1824018;
        v5[2](v5, &stru_1F1824018, &stru_1F1824018);
        uint64_t v7 = &stru_1F1824018;
      }
    }
    else
    {
      id v6 = &stru_1F1824018;
      v5[2](v5, &stru_1F1824018, &stru_1F1824018);
      uint64_t v7 = &stru_1F1824018;
    }
  }
  else
  {
    id v6 = &stru_1F1824018;
    v5[2](v5, &stru_1F1824018, &stru_1F1824018);
    uint64_t v7 = &stru_1F1824018;
  }
}

- (int)preferencePriorityFromIdentity:(id)a3
{
  id v4 = a3;
  if (preferencePriorityFromIdentity__onceToken[0] != -1) {
    dispatch_once(preferencePriorityFromIdentity__onceToken, &__block_literal_global_290);
  }
  if ([v4 hasPrefix:preferencePriorityFromIdentity__prefsString])
  {
    int v5 = [(PRSRankingItem *)self preferencePriorityFromIdentityWithPrefixPrefs:v4];
  }
  else
  {
    if (![v4 hasPrefix:preferencePriorityFromIdentity__settingsNavigationString])
    {
      int v6 = 6;
      goto LABEL_9;
    }
    int v5 = [(PRSRankingItem *)self preferencePriorityFromIdentityWithPrefixSettingsNavigation:v4];
  }
  int v6 = v5;
LABEL_9:

  return v6;
}

void __58__PRSRankingItem_Scoring__preferencePriorityFromIdentity___block_invoke()
{
  uint64_t v0 = (void *)preferencePriorityFromIdentity__prefsString;
  preferencePriorityFromIdentity__prefsString = @"prefs:";

  v1 = (void *)preferencePriorityFromIdentity__settingsNavigationString;
  preferencePriorityFromIdentity__settingsNavigationString = @"settings-navigation://";
}

- (int)preferencePriorityFromIdentityWithPrefixPrefs:(id)a3
{
  id v4 = a3;
  if (preferencePriorityFromIdentityWithPrefixPrefs__onceToken != -1) {
    dispatch_once(&preferencePriorityFromIdentityWithPrefixPrefs__onceToken, &__block_literal_global_298);
  }
  uint64_t v8 = 0;
  double v9 = &v8;
  uint64_t v10 = 0x2020000000;
  int v11 = 6;
  if ([v4 length])
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __73__PRSRankingItem_Scoring__preferencePriorityFromIdentityWithPrefixPrefs___block_invoke_2;
    v7[3] = &unk_1E634D7D8;
    v7[4] = &v8;
    [(PRSRankingItem *)self parsePreferenceIdentity:v4 withHandler:v7];
  }
  int v5 = *((_DWORD *)v9 + 6);
  _Block_object_dispose(&v8, 8);

  return v5;
}

uint64_t __73__PRSRankingItem_Scoring__preferencePriorityFromIdentityWithPrefixPrefs___block_invoke()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"MOBILE_DATA_SETTINGS_ID", @"DO_NOT_DISTURB", @"ControlCenter", @"BATTERY_USAGE", @"DISPLAY", @"Phone", 0);
  v1 = (void *)preferencePriorityFromIdentityWithPrefixPrefs__setOfImportantFirstPrioritySettingRoots;
  preferencePriorityFromIdentityWithPrefixPrefs__setOfImportantFirstPrioritySettingRoots = v0;

  preferencePriorityFromIdentityWithPrefixPrefs__setOfDemotedFirstPrioritySettingRoots = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"IBOOKS", @"SHORTCUTS", @"SOUND", 0);
  return MEMORY[0x1F41817F8]();
}

void __73__PRSRankingItem_Scoring__preferencePriorityFromIdentityWithPrefixPrefs___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v16 = a2;
  id v5 = a3;
  if ([v16 length])
  {
    if ([v5 length])
    {
      if (([v16 isEqualToString:@"General"] & 1) != 0
        || [v16 isEqualToString:@"APPLE_ACCOUNT"])
      {
        if (([v5 containsString:@"#"] & 1) == 0
          && ![v5 containsString:@"/"]
          && ([v5 isEqualToString:@"REGULATORY"] & 1) == 0
          && ![v5 isEqualToString:@"LEGAL_AND_REGULATORY"])
        {
          uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
LABEL_33:
          int v11 = 1;
          goto LABEL_17;
        }
        goto LABEL_16;
      }
      if ([v5 containsString:@"#"])
      {
        int v12 = [v5 containsString:@"/"];
        uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
        if (v12) {
          int v11 = 6;
        }
        else {
          int v11 = 5;
        }
        goto LABEL_17;
      }
      int v13 = [(id)preferencePriorityFromIdentityWithPrefixPrefs__setOfImportantFirstPrioritySettingRoots containsObject:v16];
      uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
      if (v13)
      {
        int v11 = 2;
        goto LABEL_17;
      }
    }
    else
    {
      if ([v16 containsString:@"#"])
      {
        uint64_t v7 = [v16 componentsSeparatedByString:@"#"];
        uint64_t v8 = [v7 firstObject];

        if ([v8 isEqualToString:@"ROOT"])
        {
          uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
          int v10 = 1;
        }
        else if ([(id)preferencePriorityFromIdentityWithPrefixPrefs__setOfImportantFirstPrioritySettingRoots containsObject:v8])
        {
          uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
          int v10 = 2;
        }
        else
        {
          int v14 = [(id)preferencePriorityFromIdentityWithPrefixPrefs__setOfDemotedFirstPrioritySettingRoots containsObject:v8];
          uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
          if (v14) {
            int v10 = 4;
          }
          else {
            int v10 = 3;
          }
        }
        *(_DWORD *)(v9 + 24) = v10;
        id v16 = v8;
        goto LABEL_18;
      }
      if (([v16 isEqualToString:@"STORE"] & 1) != 0
        || ([v16 isEqualToString:@"GAMECENTER"] & 1) != 0
        || [v16 isEqualToString:@"WEATHER"])
      {
LABEL_16:
        uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
        int v11 = 3;
LABEL_17:
        *(_DWORD *)(v6 + 24) = v11;
        goto LABEL_18;
      }
      int v15 = [v16 isEqualToString:@"EXPOSURE_NOTIFICATION"];
      uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
      if (!v15) {
        goto LABEL_33;
      }
    }
    int v11 = 4;
    goto LABEL_17;
  }
LABEL_18:
}

- (int)preferencePriorityFromIdentityWithPrefixSettingsNavigation:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (preferencePriorityFromIdentityWithPrefixSettingsNavigation__onceToken != -1) {
    dispatch_once(&preferencePriorityFromIdentityWithPrefixSettingsNavigation__onceToken, &__block_literal_global_362);
  }
  if ([v3 length])
  {
    id v4 = [MEMORY[0x1E4F1CB10] URLWithString:v3];
    id v5 = v4;
    if (v4
      && ([v4 scheme], (uint64_t v6 = objc_claimAutoreleasedReturnValue()) != 0)
      && (uint64_t v7 = (void *)v6,
          [v5 host],
          uint64_t v8 = objc_claimAutoreleasedReturnValue(),
          v8,
          v7,
          v8))
    {
      uint64_t v9 = [v5 host];
      if ([v9 hasPrefix:preferencePriorityFromIdentityWithPrefixSettingsNavigation__settingsURLPrefix]&& (unint64_t v10 = objc_msgSend(v9, "length"), v10 > objc_msgSend((id)preferencePriorityFromIdentityWithPrefixSettingsNavigation__settingsURLPrefix, "length")))
      {
        int v11 = [(id)preferencePriorityFromIdentityWithPrefixSettingsNavigation__hostPriorityOverrides objectForKey:v9];
        unsigned int v12 = [v11 intValue];
        if (v12 <= 1) {
          int v13 = 1;
        }
        else {
          int v13 = v12;
        }

        int v14 = [v5 pathComponents];
        int v15 = [v14 count];

        int v16 = v15 - 2;
        if (v15 >= 2)
        {
          float v17 = [v5 host];
          int v18 = [v17 isEqualToString:preferencePriorityFromIdentityWithPrefixSettingsNavigation__appSettingsPrefix];

          if (v18)
          {
            double v19 = (void *)preferencePriorityFromIdentityWithPrefixSettingsNavigation__appPriorityOverrides;
            uint64_t v20 = [v5 pathComponents];
            double v21 = [v20 objectAtIndexedSubscript:1];
            double v22 = [v19 objectForKey:v21];
            int v23 = [v22 intValue];
            if (preferencePriorityFromIdentityWithPrefixSettingsNavigation__defaultAppPriority) {
              int v24 = 2;
            }
            else {
              int v24 = 0;
            }
            if (v23) {
              int v13 = v23;
            }
            else {
              int v13 = v24;
            }
          }
          else
          {
            int v16 = v15 - 1;
          }
          long long v39 = 0u;
          long long v40 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          unint64_t v26 = objc_msgSend(v5, "pathComponents", 0);
          uint64_t v27 = [v26 countByEnumeratingWithState:&v37 objects:v41 count:16];
          if (v27)
          {
            uint64_t v28 = v27;
            uint64_t v29 = *(void *)v38;
            do
            {
              for (uint64_t i = 0; i != v28; ++i)
              {
                if (*(void *)v38 != v29) {
                  objc_enumerationMutation(v26);
                }
                v16 -= [*(id *)(*((void *)&v37 + 1) + 8 * i) isEqualToString:@"root"];
              }
              uint64_t v28 = [v26 countByEnumeratingWithState:&v37 objects:v41 count:16];
            }
            while (v28);
          }

          v13 += v16 & ~(v16 >> 31);
        }
        uint64_t v31 = [v5 fragment];
        if (v31)
        {
          float v32 = (void *)v31;
          double v33 = [v5 fragment];
          int v34 = [v33 isEqualToString:@"root"] ^ 1;

          v13 += v34;
        }
        float v35 = [v5 query];

        if (v35) {
          int v25 = v13 + 1;
        }
        else {
          int v25 = v13;
        }
      }
      else if (preferencePriorityFromIdentityWithPrefixSettingsNavigation__defaultPriority)
      {
        int v25 = 6;
      }
      else
      {
        int v25 = 0;
      }
    }
    else if (preferencePriorityFromIdentityWithPrefixSettingsNavigation__defaultPriority)
    {
      int v25 = 6;
    }
    else
    {
      int v25 = 0;
    }
  }
  else if (preferencePriorityFromIdentityWithPrefixSettingsNavigation__defaultPriority)
  {
    int v25 = 6;
  }
  else
  {
    int v25 = 0;
  }

  return v25;
}

void __86__PRSRankingItem_Scoring__preferencePriorityFromIdentityWithPrefixSettingsNavigation___block_invoke()
{
  preferencePriorityFromIdentityWithPrefixSettingsNavigation__defaultPriority = 1;
  preferencePriorityFromIdentityWithPrefixSettingsNavigation__defaultAppPriority = 1;
  uint64_t v0 = (void *)preferencePriorityFromIdentityWithPrefixSettingsNavigation__settingsURLPrefix;
  preferencePriorityFromIdentityWithPrefixSettingsNavigation__settingsURLPrefix = @"com.apple.Settings.";

  v1 = (void *)preferencePriorityFromIdentityWithPrefixSettingsNavigation__appSettingsPrefix;
  preferencePriorityFromIdentityWithPrefixSettingsNavigation__appSettingsPrefix = @"com.apple.Settings.Apps";

  uint64_t v2 = (void *)preferencePriorityFromIdentityWithPrefixSettingsNavigation__appPriorityOverrides;
  uint64_t v3 = MEMORY[0x1E4F1CC08];
  preferencePriorityFromIdentityWithPrefixSettingsNavigation__appPriorityOverrides = MEMORY[0x1E4F1CC08];

  id v4 = (void *)preferencePriorityFromIdentityWithPrefixSettingsNavigation__hostPriorityOverrides;
  preferencePriorityFromIdentityWithPrefixSettingsNavigation__hostPriorityOverrides = v3;
}

- (float)matchScoreForPreferencesWithEvaluator:(id)a3
{
  id v4 = a3;
  id v5 = SSCompactRankingAttrsGetValue((int8x8_t *)[(PRSRankingItem *)self attributes], 4uLL);
  uint64_t v6 = SSCompactRankingAttrsGetValue((int8x8_t *)[(PRSRankingItem *)self attributes], 0);
  uint64_t v7 = SSCompactRankingAttrsGetValue((int8x8_t *)[(PRSRankingItem *)self attributes], 1uLL);
  int v9 = 0;
  if ([v5 length] && objc_msgSend(v7, "length"))
  {
    if ([v6 isEqualToString:@"com.apple.systempreference.prefpane"])
    {
      unint64_t v10 = [(PRSRankingItem *)self identifier];

      if (v10)
      {
        uint64_t v11 = [(PRSRankingItem *)self identifier];

        uint64_t v7 = (void *)v11;
      }
    }
    [(PRSRankingItem *)self matchScoreForPreferencesWithEvaluator:v4 subject:v5 preferenceType:v6 preferenceId:v7];
    int v9 = LODWORD(v8);
  }
  LODWORD(v8) = v9;
  [(PRSRankingItem *)self setKeywordMatchScore:v8];
  [(PRSRankingItem *)self keywordMatchScore];
  float v13 = v12;

  return v13;
}

- (float)matchScoreForPreferencesWithEvaluator:(id)a3 subject:(id)a4 isFirstParty:(BOOL)a5 preferencePriority:(int)a6
{
  id v10 = a3;
  id v11 = a4;
  if ([v11 length])
  {
    float v12 = [v10 queryString];
    float v13 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"-&"];
    BOOL v14 = [v12 rangeOfCharacterFromSet:v13] == 0x7FFFFFFFFFFFFFFFLL;

    [(PRSRankingItem *)self matchScoreSettings:v11 withEvaluator:v10 matchOption:(2 * v14)];
    float v16 = v15;
    if (v15 != 0.0)
    {
      if (a5)
      {
        switch(a6)
        {
          case 1:
            double v17 = v15;
            double v18 = 0.96;
            goto LABEL_18;
          case 2:
            double v17 = v15;
            double v18 = 0.8;
            goto LABEL_18;
          case 3:
            double v17 = v15;
            if (v16 <= 0.95) {
              goto LABEL_15;
            }
            double v18 = 0.61;
            goto LABEL_18;
          case 4:
            double v17 = v15;
            if (v16 <= 0.95)
            {
              double v18 = 0.4;
LABEL_18:
              float v16 = v17 * v18;
            }
            else
            {
LABEL_15:
              float v16 = v16 * 0.5;
            }
LABEL_19:
            double v19 = [v10 queryString];
            unint64_t v20 = [v19 length];

            if (v20 < 2) {
              float v16 = v16 * 0.25;
            }
            break;
          case 5:
            double v17 = v15;
            if (v16 <= 0.95) {
              double v18 = 0.3;
            }
            else {
              double v18 = 0.45;
            }
            goto LABEL_18;
          default:
            float v16 = v15 / (float)a6;
            goto LABEL_19;
        }
      }
      else
      {
        float v16 = v15 * 0.25;
      }
    }
  }
  else
  {
    float v16 = 0.0;
  }

  return v16;
}

- (float)matchScoreForPreferencesWithEvaluator:(id)a3 subject:(id)a4 preferenceType:(id)a5 preferenceId:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  if ([v10 isEqualToString:@"com.apple.Preferences.firstParty"]) {
    uint64_t v14 = 1;
  }
  else {
    uint64_t v14 = [v10 isEqualToString:@"com.apple.systempreference.prefpane"];
  }
  [(PRSRankingItem *)self setSettingsPreferencePriority:[(PRSRankingItem *)self preferencePriorityFromIdentity:v11]];
  [(PRSRankingItem *)self matchScoreForPreferencesWithEvaluator:v13 subject:v12 isFirstParty:v14 preferencePriority:[(PRSRankingItem *)self settingsPreferencePriority]];
  float v16 = v15;

  return v16;
}

- (int)shortcutPriorityFromIdentifier:(id)a3
{
  uint64_t v3 = shortcutPriorityFromIdentifier__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&shortcutPriorityFromIdentifier__onceToken, &__block_literal_global_382);
  }
  if ([0 containsObject:v4]) {
    int v5 = -1;
  }
  else {
    int v5 = 2;
  }
  int v6 = [(id)shortcutPriorityFromIdentifier__setOfFirstPriority containsObject:v4];

  if (v6) {
    return 1;
  }
  else {
    return v5;
  }
}

uint64_t __58__PRSRankingItem_Scoring__shortcutPriorityFromIdentifier___block_invoke()
{
  shortcutPriorityFromIdentifier__setOfFirstPriority = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"is.workflow.actions.dnd.set.com.apple.donotdisturb.mode.default.toggle", 0);
  return MEMORY[0x1F41817F8]();
}

- (float)matchScoreForShortcutsSettingWithEvaluator:(id)a3 name:(id)a4 preferencePriority:(int)a5
{
  id v8 = a3;
  id v9 = a4;
  float v10 = 0.0;
  if ([v9 length])
  {
    id v11 = [v8 queryString];
    id v12 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"-&"];
    BOOL v13 = [v11 rangeOfCharacterFromSet:v12] == 0x7FFFFFFFFFFFFFFFLL;

    [(PRSRankingItem *)self matchScoreSettings:v9 withEvaluator:v8 matchOption:(2 * v13)];
    float v10 = v14;
    if (v14 >= 2.2204e-16)
    {
      if (a5 == -1)
      {
        float v10 = 0.0;
      }
      else if (a5 != 2)
      {
        if (a5 == 1)
        {
          double v15 = v14 * 1.1;
          if (v15 > 1.0) {
            double v15 = 1.0;
          }
          float v10 = v15;
        }
        else
        {
          float v10 = v14 * 0.5;
        }
      }
    }
  }

  return v10;
}

- (float)matchScoreForShortcutsAppWithEvaluator:(id)a3
{
  id v4 = a3;
  int v5 = SSCompactRankingAttrsGetValue((int8x8_t *)[(PRSRankingItem *)self attributes], 7uLL);
  float v6 = 0.0;
  float v7 = 0.0;
  if ([v5 length])
  {
    [(PRSRankingItem *)self matchScoreTitle:v5 withEvaluator:v4];
    float v7 = v8;
  }
  id v9 = [(PRSRankingItem *)self firstMatchedAltName];
  uint64_t v10 = [v9 length];

  if (v10)
  {
    id v11 = [(PRSRankingItem *)self firstMatchedAltName];
    [(PRSRankingItem *)self matchScoreTitle:v11 withEvaluator:v4];
    float v6 = v12;
  }
  if (v7 >= (float)(v6 * 0.6)) {
    float v13 = v7;
  }
  else {
    float v13 = v6 * 0.6;
  }
  if (v7 < 1.0 && v6 < 1.0)
  {
    float v14 = objc_msgSend(v4, "queryString", 1.0, v6);
    unint64_t v15 = [v14 composedLength];

    float v16 = 0.2;
    if (v13 < 0.2) {
      float v16 = v13;
    }
    if (v15 < 4) {
      float v13 = v16;
    }
  }

  return v13;
}

- (float)matchScoreForShortcutsWithEvaluator:(id)a3
{
  id v4 = a3;
  int v5 = SSCompactRankingAttrsGetValue((int8x8_t *)[(PRSRankingItem *)self attributes], 0x48uLL);
  float v6 = SSCompactRankingAttrsGetValue((int8x8_t *)[(PRSRankingItem *)self attributes], 0x32uLL);
  if (matchScoreForShortcutsWithEvaluator__onceToken != -1) {
    dispatch_once(&matchScoreForShortcutsWithEvaluator__onceToken, &__block_literal_global_387);
  }
  if ([v5 isEqualToString:@"com.apple.Preferences"])
  {
    float v7 = SSCompactRankingAttrsGetValue((int8x8_t *)[(PRSRankingItem *)self attributes], 7uLL);
    float v8 = [(PRSRankingItem *)self identifier];
    uint64_t v9 = [(PRSRankingItem *)self shortcutPriorityFromIdentifier:v8];

    if ([v7 length])
    {
      [(PRSRankingItem *)self matchScoreForShortcutsSettingWithEvaluator:v4 name:v7 preferencePriority:v9];
LABEL_9:
      float v11 = v10;
      float v12 = 1.0;
LABEL_11:

      goto LABEL_12;
    }
    goto LABEL_10;
  }
  if ([(id)matchScoreForShortcutsWithEvaluator__appPrefixActionBundleIDs containsObject:v5])
  {
    float v7 = SSCompactRankingAttrsGetValue((int8x8_t *)[(PRSRankingItem *)self attributes], 0xACuLL);
    if ([v7 length])
    {
      [(PRSRankingItem *)self matchScoreTitle:v7 withEvaluator:v4];
      goto LABEL_9;
    }
LABEL_10:
    float v12 = 0.0;
    float v11 = 0.0;
    goto LABEL_11;
  }
  int v17 = [v6 isEqualToString:@"app-shortcut"];
  [(PRSRankingItem *)self matchScoreForShortcutsAppWithEvaluator:v4];
  float v11 = v18;
  uint64_t v19 = [v5 length];
  if (v17)
  {
    if (!v19 || ([v5 hasPrefix:@"com.apple."] & 1) == 0)
    {
      double v13 = v11;
      if (v11 <= 1.0)
      {
        unint64_t v20 = objc_msgSend(v4, "queryString", v13);
        unint64_t v21 = [v20 composedLength];

        float v12 = 0.25;
        if (v21 < 8) {
          goto LABEL_12;
        }
      }
    }
    double v22 = SSCompactRankingAttrsGetValue((int8x8_t *)[(PRSRankingItem *)self attributes], 0xA4uLL);
    int v23 = v22;
    if (!v22 || v11 >= 1.0) {
      goto LABEL_35;
    }
    int v24 = [v22 intValue];
    if (v24 == 1)
    {
      double v25 = 1.2;
    }
    else
    {
      if (v24) {
        goto LABEL_33;
      }
      double v25 = 1.4;
    }
    float v11 = v11 * v25;
LABEL_33:
    if (v11 > 0.98) {
      float v11 = 0.98;
    }
LABEL_35:

    float v12 = 1.0;
    goto LABEL_12;
  }
  if (v19 && ([v5 hasPrefix:@"com.apple."] & 1) != 0
    || (double v13 = v11, v11 > 1.0)
    || (objc_msgSend(v4, "queryString", v13),
        unint64_t v26 = objc_claimAutoreleasedReturnValue(),
        unint64_t v27 = [v26 composedLength],
        v26,
        v27 >= 8))
  {
    float v12 = 0.8;
  }
  else
  {
    float v12 = 0.2;
  }
LABEL_12:
  *(float *)&double v13 = v12 * v11;
  if ((float)(v12 * v11) > 1.0) {
    *(float *)&double v13 = 1.0;
  }
  [(PRSRankingItem *)self setKeywordMatchScore:v13];
  [(PRSRankingItem *)self keywordMatchScore];
  float v15 = v14;

  return v15;
}

void __63__PRSRankingItem_Scoring__matchScoreForShortcutsWithEvaluator___block_invoke()
{
  v4[1] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = @"com.apple.facetime";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  uint64_t v2 = [v0 setWithArray:v1];
  uint64_t v3 = (void *)matchScoreForShortcutsWithEvaluator__appPrefixActionBundleIDs;
  matchScoreForShortcutsWithEvaluator__appPrefixActionBundleIDs = v2;
}

- (float)matchScoreForAppEntityWithEvaluator:(id)a3 quParsedEvaluator:(id)a4 isSearchToolClient:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  float v10 = SSCompactRankingAttrsGetValue((int8x8_t *)[(PRSRankingItem *)self attributes], 0xCuLL);
  if (![v10 length])
  {
    uint64_t v11 = SSCompactRankingAttrsGetValue((int8x8_t *)[(PRSRankingItem *)self attributes], 7uLL);

    float v10 = (void *)v11;
  }
  if (![v10 length])
  {
    float v13 = 0.0;
LABEL_13:
    float v14 = SSCompactRankingAttrsGetValue((int8x8_t *)[(PRSRankingItem *)self attributes], 4uLL);
    float v15 = SSCompactRankingAttrsGetValue((int8x8_t *)[(PRSRankingItem *)self attributes], 0x1FuLL);
    float v16 = SSCompactRankingAttrsGetValue((int8x8_t *)[(PRSRankingItem *)self attributes], 6uLL);
    if ([v14 length] || objc_msgSend(v15, "length") || objc_msgSend(v16, "length"))
    {
      if ([v10 length])
      {
        int v17 = [&stru_1F1824018 stringByAppendingString:v10];
      }
      else
      {
        int v17 = &stru_1F1824018;
      }
      if ([v14 length])
      {
        if ([(__CFString *)v17 length])
        {
          uint64_t v18 = [(__CFString *)v17 stringByAppendingString:@" "];

          int v17 = (__CFString *)v18;
        }
        uint64_t v19 = [(__CFString *)v17 stringByAppendingString:v14];

        int v17 = (__CFString *)v19;
      }
      if ([v15 length])
      {
        if ([(__CFString *)v17 length])
        {
          uint64_t v20 = [(__CFString *)v17 stringByAppendingString:@" "];

          int v17 = (__CFString *)v20;
        }
        uint64_t v21 = [(__CFString *)v17 stringByAppendingString:v15];

        int v17 = (__CFString *)v21;
      }
      if ([v16 length])
      {
        if ([(__CFString *)v17 length])
        {
          uint64_t v22 = [(__CFString *)v17 stringByAppendingString:@" "];

          int v17 = (__CFString *)v22;
        }
        uint64_t v23 = [(__CFString *)v17 stringByAppendingString:v16];

        int v17 = (__CFString *)v23;
      }
      [(PRSRankingItem *)self matchScoreTitle:v17 withEvaluator:v8];
      float v25 = v24;
      if (v9 && v24 < 2.2204e-16)
      {
        [(PRSRankingItem *)self matchScoreTitle:v16 withEvaluator:v9];
        float v25 = v26;
      }
      if (!v5 && ([(PRSRankingItem *)self bundleIDType] & 0x400000000000000) != 0) {
        float v13 = v25 * 0.8;
      }
      else {
        float v13 = v25 * 0.5;
      }
    }
    goto LABEL_40;
  }
  [(PRSRankingItem *)self matchScoreTitle:v10 withEvaluator:v8];
  float v13 = *(float *)&v12;
  if (v9 && *(float *)&v12 < 2.2204e-16)
  {
    [(PRSRankingItem *)self matchScoreTitle:v10 withEvaluator:v9];
    float v13 = *(float *)&v12;
  }
  if (!v5 && ([(PRSRankingItem *)self bundleIDType] & 0x400000000000000) != 0) {
    float v13 = v13 * 0.5;
  }
  if (v13 < 2.2204e-16) {
    goto LABEL_13;
  }
LABEL_40:
  *(float *)&double v12 = v13;
  [(PRSRankingItem *)self setKeywordMatchScore:v12];
  [(PRSRankingItem *)self keywordMatchScore];
  [(PRSRankingItem *)self embeddingSimilarity];
  [(PRSRankingItem *)self pommesL1Score];
  uint64_t v27 = [(PRSRankingItem *)self bundleIDType];
  uint64_t v28 = [v8 queryString];
  uint64_t v29 = [v8 language];
  chooseTopicality(v27, v5, v5);
  float v31 = v30;

  if (v5) {
    double v32 = 0.25;
  }
  else {
    double v32 = 0.75;
  }
  if (v13 < 1.0)
  {
    double v33 = objc_msgSend(v8, "queryString", v13);
    unint64_t v34 = [v33 composedLength];

    if (v34 < 5) {
      double v32 = v32 / 10.0;
    }
  }

  return v32 * v31;
}

- (float)matchScoreForDictionaryWithEvaluator:(id)a3
{
  id v4 = [a3 queryTerms];
  float v6 = 0.0;
  if ([(PRSRankingItem *)self hasPolicyMultipleTermsPhraseMatch]
    && (unint64_t)[v4 count] >= 2)
  {
    float v7 = SSCompactRankingAttrsGetValue((int8x8_t *)[(PRSRankingItem *)self attributes], 7uLL);
    if ((unint64_t)[v7 composedLength] > 1) {
      float v6 = 0.98;
    }
    else {
      float v6 = (float)((float)(unint64_t)[v7 composedLength] * 0.5) * 0.98;
    }
  }
  *(float *)&double v5 = v6;
  [(PRSRankingItem *)self setKeywordMatchScore:v5];
  [(PRSRankingItem *)self keywordMatchScore];
  float v9 = v8;

  return v9;
}

- (float)matchScoreForBooksWithEvaluator:(id)a3 quParsedEvaluator:(id)a4 isSearchToolClient:(BOOL)a5
{
  unsigned int v5 = a5;
  id v8 = a3;
  id v9 = a4;
  float v10 = SSCompactRankingAttrsGetValue((int8x8_t *)[(PRSRankingItem *)self attributes], 7uLL);
  uint64_t v11 = SSCompactRankingAttrsGetValue((int8x8_t *)[(PRSRankingItem *)self attributes], 0x5BuLL);
  if ([v10 composedLength])
  {
    [(PRSRankingItem *)self matchScoreTitle:v10 withEvaluator:v8];
    float v13 = v12;
    if (v9 && v12 < 0.00000011921)
    {
      [(PRSRankingItem *)self matchScoreTitle:v10 withEvaluator:v9];
      float v13 = v14;
    }
    if (v13 < 1.0) {
      float v13 = v13 * 0.8;
    }
  }
  else
  {
    float v13 = 0.0;
  }
  if ([v11 composedLength])
  {
    [(PRSRankingItem *)self matchScoreTitle:v11 withEvaluator:v8];
    if (v9 && *(float *)&v15 < 0.00000011921) {
      [(PRSRankingItem *)self matchScoreTitle:v11 withEvaluator:v9];
    }
    float v16 = *(float *)&v15 * 0.4;
    if (v16 >= v13) {
      float v13 = v16;
    }
  }
  *(float *)&double v15 = fminf(v13, 1.0);
  [(PRSRankingItem *)self setKeywordMatchScore:v15];
  [(PRSRankingItem *)self keywordMatchScore];
  [(PRSRankingItem *)self embeddingSimilarity];
  [(PRSRankingItem *)self pommesL1Score];
  uint64_t v17 = [(PRSRankingItem *)self bundleIDType];
  uint64_t v18 = [v8 queryString];
  uint64_t v19 = [v8 language];
  chooseTopicality(v17, 0, v5);
  float v21 = v20;

  uint64_t v22 = [v8 queryTerms];
  unint64_t v23 = [v22 count];

  if (v23 <= 3)
  {
    float v24 = [v8 queryTerms];
    float v21 = ((double)(unint64_t)[v24 count] * 0.599999994 * 0.25 + 0.400000006) * v21;
  }
  return v21;
}

- (float)matchScoreForTipsWithEvaluator:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 queryString];
  unint64_t v6 = [v5 composedLength];

  float v7 = 0.0;
  if (v6 >= 4)
  {
    id v8 = SSCompactRankingAttrsGetValue((int8x8_t *)[(PRSRankingItem *)self attributes], 7uLL);
    if ([v8 composedLength])
    {
      [(PRSRankingItem *)self matchScoreTitle:v8 withEvaluator:v4];
      float v7 = v9;
      if (v9 < 1.0)
      {
        float v10 = [v4 queryString];
        unint64_t v11 = [v10 composedLength];

        float v12 = v7 * 0.1;
        if (v11 >= 0xA) {
          float v12 = v7;
        }
        float v7 = v12 * 0.6;
      }
    }
    float v13 = [v4 queryTerms];
    unint64_t v14 = [v13 count];

    if (v14 <= 3)
    {
      float v16 = [v4 queryTerms];
      float v7 = (double)(unint64_t)[v16 count] * 0.25 * v7;
    }
    *(float *)&double v15 = v7;
    [(PRSRankingItem *)self setKeywordMatchScore:v15];
    [(PRSRankingItem *)self keywordMatchScore];
    float v7 = v17;
  }
  return v7;
}

- (float)matchScoreForHelpWithEvaluator:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 queryString];
  unint64_t v6 = [v5 composedLength];

  float v7 = 0.0;
  if (v6 >= 4)
  {
    id v8 = SSCompactRankingAttrsGetValue((int8x8_t *)[(PRSRankingItem *)self attributes], 7uLL);
    if ([v8 composedLength])
    {
      [(PRSRankingItem *)self matchScoreTitle:v8 withEvaluator:v4];
      float v7 = v9;
      if (v9 < 1.0)
      {
        float v10 = [v4 queryString];
        unint64_t v11 = [v10 composedLength];

        float v12 = v7 * 0.1;
        if (v11 >= 0xA) {
          float v12 = v7;
        }
        float v7 = v12 * 0.6;
      }
    }
    float v13 = [v4 queryTerms];
    unint64_t v14 = [v13 count];

    if (v14 <= 3)
    {
      float v16 = [v4 queryTerms];
      float v7 = (double)(unint64_t)[v16 count] * 0.25 * v7;
    }
    *(float *)&double v15 = v7;
    [(PRSRankingItem *)self setKeywordMatchScore:v15];
    [(PRSRankingItem *)self keywordMatchScore];
    float v7 = v17;
  }
  return v7;
}

- (BOOL)_isWalletTransaction:(id)a3
{
  id v3 = a3;
  if (_isWalletTransaction__onceToken != -1) {
    dispatch_once(&_isWalletTransaction__onceToken, &__block_literal_global_392);
  }
  if ([v3 length]) {
    char v4 = [(id)_isWalletTransaction__transactionContentTypes containsObject:v3];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

uint64_t __48__PRSRankingItem_Scoring___isWalletTransaction___block_invoke()
{
  _isWalletTransaction__transactionContentTypes = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F1864748];
  return MEMORY[0x1F41817F8]();
}

- (BOOL)_isWalletPass:(id)a3
{
  id v3 = a3;
  if (_isWalletPass__onceToken != -1) {
    dispatch_once(&_isWalletPass__onceToken, &__block_literal_global_406);
  }
  if ([v3 length]) {
    char v4 = [(id)_isWalletPass__walletPassContentTypes containsObject:v3];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

uint64_t __41__PRSRankingItem_Scoring___isWalletPass___block_invoke()
{
  _isWalletPass__walletPassContentTypes = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F1864760];
  return MEMORY[0x1F41817F8]();
}

- (float)matchScoreForWalletWithEvaluator:(id)a3 quParsedEvaluator:(id)a4 isSearchToolClient:(BOOL)a5
{
  unsigned int v5 = a5;
  id v8 = a3;
  id v9 = a4;
  float v10 = SSCompactRankingAttrsGetValue((int8x8_t *)[(PRSRankingItem *)self attributes], 0);
  if (v5)
  {
    BOOL v11 = 0;
    unint64_t v12 = 4;
  }
  else
  {
    BOOL v11 = [(PRSRankingItem *)self _isWalletPass:v10];
    if (v11) {
      unint64_t v12 = 3;
    }
    else {
      unint64_t v12 = 4;
    }
  }
  float v13 = [v8 queryString];
  unint64_t v14 = [v13 composedLength];

  float v15 = 0.0;
  if (v14 >= v12)
  {
    BOOL v16 = [(PRSRankingItem *)self _isWalletTransaction:v10];
    float v17 = SSCompactRankingAttrsGetValue((int8x8_t *)[(PRSRankingItem *)self attributes], 7uLL);
    if (v16)
    {
      uint64_t v18 = SSCompactRankingAttrsGetValue((int8x8_t *)[(PRSRankingItem *)self attributes], 0x1FuLL);
      if ([v17 length] && objc_msgSend(v18, "length"))
      {
        uint64_t v19 = [v17 stringByAppendingString:v18];

        float v17 = (void *)v19;
      }
    }
    if (v11)
    {
      [(PRSRankingItem *)self matchScoreTitle:v17 withEvaluator:v8];
      float v15 = v20;
      if (v20 < 0.00000011921)
      {
        float v21 = SSCompactRankingAttrsGetValue((int8x8_t *)[(PRSRankingItem *)self attributes], 0xD4uLL);
        if ([v17 length] && objc_msgSend(v21, "length"))
        {
          uint64_t v22 = [NSString stringWithFormat:@"%@ %@", v17, v21];

          float v17 = (void *)v22;
        }
        [(PRSRankingItem *)self matchScoreTitle:v17 withEvaluator:v8];
        float v15 = v23;
      }
      if (v9 && v15 < 0.00000011921)
      {
        [(PRSRankingItem *)self matchScoreTitle:v17 withEvaluator:v9];
        float v15 = v24;
      }
      double v25 = v15;
      if (v15 < 1.0)
      {
        float v26 = objc_msgSend(v8, "queryString", v25);
        unint64_t v27 = [v26 composedLength];

        if (v27 < 0xA) {
          float v15 = v15 * 0.6;
        }
      }
    }
    else if ([v17 composedLength])
    {
      [(PRSRankingItem *)self matchScoreTitle:v17 withEvaluator:v8];
      float v15 = *(float *)&v25;
      if (v9)
      {
        HIDWORD(v25) = 872415232;
        if (*(float *)&v25 < 0.00000011921)
        {
          [(PRSRankingItem *)self matchScoreTitle:v17 withEvaluator:v9];
          float v15 = *(float *)&v25;
        }
      }
      if (v16
        || (double v25 = v15, v15 < 1.0)
        && (objc_msgSend(v8, "queryString", v25),
            uint64_t v28 = objc_claimAutoreleasedReturnValue(),
            unint64_t v29 = [v28 composedLength],
            v28,
            v29 <= 9))
      {
        float v15 = v15 * 0.1;
      }
    }
    *(float *)&double v25 = fminf(v15, 1.0);
    [(PRSRankingItem *)self setKeywordMatchScore:v25];
    [(PRSRankingItem *)self keywordMatchScore];
    [(PRSRankingItem *)self embeddingSimilarity];
    [(PRSRankingItem *)self pommesL1Score];
    uint64_t v30 = [(PRSRankingItem *)self bundleIDType];
    float v31 = [v8 queryString];
    double v32 = [v8 language];
    chooseTopicality(v30, 0, v5);
    float v34 = v33;

    float v15 = v34 * 0.6;
  }

  return v15;
}

- (float)matchScoreForMusicWithEvaluator:(id)a3 quParsedEvaluator:(id)a4 isSearchToolClient:(BOOL)a5
{
  unsigned int v5 = a5;
  id v8 = a3;
  id v9 = a4;
  float v10 = SSCompactRankingAttrsGetValue((int8x8_t *)[(PRSRankingItem *)self attributes], 7uLL);
  BOOL v11 = SSCompactRankingAttrsGetValue((int8x8_t *)[(PRSRankingItem *)self attributes], 0x25uLL);
  if ([v10 composedLength])
  {
    [(PRSRankingItem *)self matchScoreTitle:v10 withEvaluator:v8];
    float v13 = v12;
    if (v9 && v12 < 0.00000011921)
    {
      [(PRSRankingItem *)self matchScoreTitle:v10 withEvaluator:v9];
      float v13 = v14;
    }
  }
  else
  {
    float v13 = 0.0;
  }
  if ([v11 composedLength])
  {
    [(PRSRankingItem *)self matchScoreTitle:v11 withEvaluator:v8];
    if (v9 && v15 < 0.00000011921) {
      [(PRSRankingItem *)self matchScoreTitle:v11 withEvaluator:v9];
    }
    float v16 = v15 * 0.25;
    if (v16 >= v13) {
      float v13 = v16;
    }
  }
  double v17 = v13 * 0.7;
  *(float *)&double v17 = v17;
  if (v13 >= 1.0) {
    *(float *)&double v17 = v13;
  }
  *(float *)&double v17 = fminf(*(float *)&v17, 1.0);
  [(PRSRankingItem *)self setKeywordMatchScore:v17];
  [(PRSRankingItem *)self keywordMatchScore];
  [(PRSRankingItem *)self embeddingSimilarity];
  [(PRSRankingItem *)self pommesL1Score];
  uint64_t v18 = [(PRSRankingItem *)self bundleIDType];
  uint64_t v19 = [v8 queryString];
  float v20 = [v8 language];
  chooseTopicality(v18, 0, v5);
  float v22 = v21;

  return v22 * 0.61;
}

- (float)matchScoreForPeopleItemsWithEvaluator:(id)a3
{
  id v4 = a3;
  unsigned int v5 = SSCompactRankingAttrsGetValue((int8x8_t *)[(PRSRankingItem *)self attributes], 0xCuLL);
  if ([v5 composedLength])
  {
    [(PRSRankingItem *)self matchScoreTitle:v5 withEvaluator:v4];
    double v7 = v6;
    if (v7 >= 1.0) {
      double v8 = 0.51;
    }
    else {
      double v8 = 0.35;
    }
    double v9 = v7 * v8;
    *(float *)&double v9 = v9;
  }
  else
  {
    double v9 = 0.0;
  }
  [(PRSRankingItem *)self setKeywordMatchScore:v9];
  [(PRSRankingItem *)self keywordMatchScore];
  float v11 = v10;

  return v11;
}

- (float)matchScoreGeneric:(id)a3 quParsedEvaluator:(id)a4 isSearchToolClient:(BOOL)a5
{
  unsigned int v5 = a5;
  id v8 = a3;
  id v9 = a4;
  float v10 = SSCompactRankingAttrsGetValue((int8x8_t *)[(PRSRankingItem *)self attributes], 0xCuLL);
  if ([v10 length])
  {
    [(PRSRankingItem *)self matchScoreTitle:v10 withEvaluator:v8];
    float v12 = v11;
    if (v9 && v11 < 2.2204e-16)
    {
      [(PRSRankingItem *)self matchScoreTitle:v10 withEvaluator:v9];
      float v12 = v13;
    }
  }
  else
  {
    float v12 = 0.0;
  }
  double v14 = v12;
  if ([v10 containsCJK])
  {
    if (v14 < 0.4)
    {
      double v15 = 0.7;
    }
    else
    {
      float v16 = [v8 queryTerms];
      unint64_t v17 = [v16 count];

      if (v17 <= 2)
      {
        float v20 = [v8 queryTerms];
        uint64_t v21 = [v20 count];

        double v15 = 0.85;
        if (v21 != 2) {
          double v15 = 0.75;
        }
      }
      else
      {
        double v15 = 0.95;
      }
    }
  }
  else if (v14 < 0.4)
  {
    double v15 = 0.6;
  }
  else
  {
    uint64_t v18 = [v8 queryTerms];
    unint64_t v19 = [v18 count];

    if (v19 <= 2)
    {
      float v22 = [v8 queryTerms];
      BOOL v23 = [v22 count] == 2;

      double v15 = dbl_1BDC5DA80[v23];
    }
    else
    {
      double v15 = 0.9;
    }
  }
  double v24 = v15 * v14;
  *(float *)&double v24 = v24;
  *(float *)&double v24 = fminf(*(float *)&v24, 1.0);
  [(PRSRankingItem *)self setKeywordMatchScore:v24];
  [(PRSRankingItem *)self keywordMatchScore];
  [(PRSRankingItem *)self embeddingSimilarity];
  [(PRSRankingItem *)self pommesL1Score];
  uint64_t v25 = [(PRSRankingItem *)self bundleIDType];
  float v26 = [v8 queryString];
  unint64_t v27 = [v8 language];
  chooseTopicality(v25, 0, v5);
  float v29 = v28;

  return v29;
}

- (int64_t)compareShortcutTopHitCandidate:(id)a3
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = [(PRSRankingItem *)self recentSimilarIntentEngagementDates];
  uint64_t v9 = [v8 count];

  float v10 = [v7 recentSimilarIntentEngagementDates];
  uint64_t v11 = [v10 count];

  if (!(v9 | v11)) {
    goto LABEL_19;
  }
  if (v9 != 2) {
    goto LABEL_8;
  }
  if (!v11) {
    goto LABEL_6;
  }
  float v10 = [(PRSRankingItem *)self recentSimilarIntentEngagementDates];
  id v3 = [v10 lastObject];
  id v4 = [v7 recentSimilarIntentEngagementDates];
  unsigned int v5 = [v4 firstObject];
  if ([v3 compare:v5] == 1)
  {
LABEL_6:
    float v12 = [(PRSRankingItem *)self sectionBundleIdentifier];
    char IsSyndicatedPhotos = SSSectionIsSyndicatedPhotos(v12);

    if (v11)
    {

      if (IsSyndicatedPhotos) {
        goto LABEL_8;
      }
    }
    else if (IsSyndicatedPhotos)
    {
      goto LABEL_19;
    }
    unint64_t v27 = PRSLogCategoryDefault();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v47 = [(PRSRankingItem *)self sectionBundleIdentifier];
      uint64_t v45 = [(PRSRankingItem *)self recentSimilarIntentEngagementDates];
      uint64_t v41 = [v45 count];
      uint64_t v43 = [(PRSRankingItem *)self recentSimilarIntentEngagementDates];
      float v28 = [v43 lastObject];
      [(PRSRankingItem *)self likelihood];
      uint64_t v30 = v29;
      float v31 = [v7 sectionBundleIdentifier];
      double v32 = [v7 recentSimilarIntentEngagementDates];
      uint64_t v33 = [v32 count];
      float v34 = [v7 recentSimilarIntentEngagementDates];
      uint64_t v35 = [v34 count];
      if (v35)
      {
        float v10 = [v7 recentSimilarIntentEngagementDates];
        float v36 = [v10 firstObject];
      }
      else
      {
        float v36 = @"nil";
      }
      [v7 likelihood];
      *(_DWORD *)buf = 138414082;
      uint64_t v49 = v47;
      __int16 v50 = 2048;
      uint64_t v51 = v41;
      __int16 v52 = 2112;
      id v53 = v28;
      __int16 v54 = 2048;
      uint64_t v55 = v30;
      __int16 v56 = 2112;
      int v57 = v31;
      __int16 v58 = 2048;
      uint64_t v59 = v33;
      __int16 v60 = 2112;
      double v61 = v36;
      __int16 v62 = 2048;
      uint64_t v63 = v37;
      _os_log_impl(&dword_1BDB2A000, v27, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] <Engagement_Debug> Rule: %@ (%lu, %@, %f) overtakes %@ (%lu, %@, %f)", buf, 0x52u);
      if (v35)
      {
      }
    }

    int64_t v25 = 1;
    goto LABEL_20;
  }

LABEL_8:
  if (v11 != 2)
  {
LABEL_19:
    int64_t v25 = 0;
    goto LABEL_20;
  }
  if (v9)
  {
    uint64_t v11 = [v7 recentSimilarIntentEngagementDates];
    float v10 = [(id)v11 lastObject];
    id v3 = [(PRSRankingItem *)self recentSimilarIntentEngagementDates];
    id v4 = [v3 firstObject];
    if ([v10 compare:v4] != 1)
    {

      goto LABEL_19;
    }
  }
  double v14 = [v7 sectionBundleIdentifier];
  char v15 = SSSectionIsSyndicatedPhotos(v14);

  if (v9)
  {
  }
  if (v15) {
    goto LABEL_19;
  }
  float v16 = PRSLogCategoryDefault();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    float v44 = [v7 sectionBundleIdentifier];
    uint64_t v42 = [v7 recentSimilarIntentEngagementDates];
    uint64_t v39 = [v42 count];
    long long v40 = [v7 recentSimilarIntentEngagementDates];
    double v46 = [v40 lastObject];
    [v7 likelihood];
    uint64_t v18 = v17;
    unint64_t v19 = [(PRSRankingItem *)self sectionBundleIdentifier];
    float v20 = [(PRSRankingItem *)self recentSimilarIntentEngagementDates];
    uint64_t v21 = [v20 count];
    float v22 = [(PRSRankingItem *)self recentSimilarIntentEngagementDates];
    uint64_t v23 = [v22 count];
    if (v23)
    {
      uint64_t v11 = [(PRSRankingItem *)self recentSimilarIntentEngagementDates];
      double v24 = [(id)v11 firstObject];
    }
    else
    {
      double v24 = @"nil";
    }
    [(PRSRankingItem *)self likelihood];
    *(_DWORD *)buf = 138414082;
    uint64_t v49 = v44;
    __int16 v50 = 2048;
    uint64_t v51 = v39;
    __int16 v52 = 2112;
    id v53 = v46;
    __int16 v54 = 2048;
    uint64_t v55 = v18;
    __int16 v56 = 2112;
    int v57 = v19;
    __int16 v58 = 2048;
    uint64_t v59 = v21;
    __int16 v60 = 2112;
    double v61 = v24;
    __int16 v62 = 2048;
    uint64_t v63 = v38;
    _os_log_impl(&dword_1BDB2A000, v16, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] <Engagement_Debug> Rule: %@ (%lu, %@, %f) overtakes %@ (%lu, %@, %f)", buf, 0x52u);
    if (v23)
    {
    }
  }

  int64_t v25 = -1;
LABEL_20:

  return v25;
}

- (int64_t)compareWithCCCDTopHitCandidate:(id)a3
{
  id v4 = a3;
  if (![(PRSRankingItem *)self isLocalTopHitCandidate]
    || ![v4 isLocalTopHitCandidate])
  {
    goto LABEL_11;
  }
  if (![v4 isCCCD]
    || ([(PRSRankingItem *)self bundleIDType],
        [(PRSRankingItem *)self topicalityScore],
        v5 <= 0.8)
    && ([(PRSRankingItem *)self engagementScore], v6 <= 0.8))
  {
    if ([(PRSRankingItem *)self isCCCD])
    {
      [v4 bundleIDType];
      [v4 topicalityScore];
      if (v8 > 0.8 || ([v4 engagementScore], v9 > 0.8))
      {
        int64_t v7 = -1;
        goto LABEL_12;
      }
    }
LABEL_11:
    int64_t v7 = 0;
    goto LABEL_12;
  }
  int64_t v7 = 1;
LABEL_12:

  return v7;
}

- (int64_t)compareAppsTopHitCandidate:(id)a3
{
  id v4 = a3;
  if (!v4
    || [(PRSRankingItem *)self isLocalTopHitCandidate]
    && ![v4 isLocalTopHitCandidate])
  {
    goto LABEL_18;
  }
  if (![(PRSRankingItem *)self isLocalTopHitCandidate]
    && ([v4 isLocalTopHitCandidate] & 1) != 0)
  {
    goto LABEL_20;
  }
  if ((![(PRSRankingItem *)self isLocalTopHitCandidate]
     || ([v4 isLocalTopHitCandidate] & 1) == 0)
    && ([(PRSRankingItem *)self isLocalTopHitCandidate]
     || ([v4 isLocalTopHitCandidate] & 1) != 0))
  {
    goto LABEL_10;
  }
  int64_t v15 = [(PRSRankingItem *)self compareShortcutTopHitCandidate:v4];
  if (!v15)
  {
    [(PRSRankingItem *)self likelihood];
    double v17 = v16;
    [v4 likelihood];
    if (v17 > v18)
    {
LABEL_18:
      int64_t v15 = 1;
      goto LABEL_42;
    }
    [(PRSRankingItem *)self likelihood];
    double v20 = v19;
    [v4 likelihood];
    if (v20 >= v21)
    {
      [(PRSRankingItem *)self likelihood];
      if (v25 != 1.0) {
        goto LABEL_30;
      }
      if ([(PRSRankingItem *)self wasEngagedInSpotlight]
        && ![v4 wasEngagedInSpotlight])
      {
        goto LABEL_18;
      }
      if ([(PRSRankingItem *)self wasEngagedInSpotlight]
        || ([v4 wasEngagedInSpotlight] & 1) == 0)
      {
LABEL_30:
        [(PRSRankingItem *)self likelihood];
        if (v26 > 0.0)
        {
          [v4 likelihood];
          if (v27 > 0.0)
          {
            [(PRSRankingItem *)self likelihood];
            double v29 = v28;
            [v4 likelihood];
            if (vabdd_f64(v29, v30) < 0.00000011920929)
            {
              uint64_t v11 = SSCompactRankingAttrsGetValue((int8x8_t *)[(PRSRankingItem *)self attributes], 9uLL);
              uint64_t v31 = SSCompactRankingAttrsGetValue((int8x8_t *)[v4 attributes], 9uLL);
              float v13 = (void *)v31;
              if (!v11 || !v31)
              {
                if (v11) {
                  int64_t v15 = 1;
                }
                else {
                  int64_t v15 = -1;
                }
                goto LABEL_41;
              }
              uint64_t v14 = [v11 compare:v31];
              if (v14) {
                goto LABEL_15;
              }
            }
          }
        }
LABEL_10:
        [(PRSRankingItem *)self topicalityScore];
        double v6 = v5;
        [v4 topicalityScore];
        if (v6 <= v7)
        {
          [(PRSRankingItem *)self topicalityScore];
          double v9 = v8;
          [v4 topicalityScore];
          if (v9 >= v10)
          {
            uint64_t v11 = SSCompactRankingAttrsGetValue((int8x8_t *)[(PRSRankingItem *)self attributes], 0x15DuLL);
            uint64_t v12 = SSCompactRankingAttrsGetValue((int8x8_t *)[v4 attributes], 0x15DuLL);
            float v13 = (void *)v12;
            if (v11 && v12)
            {
              uint64_t v14 = [v11 compare:v12];
LABEL_15:
              int64_t v15 = v14;
LABEL_41:

              goto LABEL_42;
            }
            float v22 = SSCompactRankingAttrsGetValue((int8x8_t *)[(PRSRankingItem *)self attributes], 7uLL);
            uint64_t v23 = SSCompactRankingAttrsGetValue((int8x8_t *)[v4 attributes], 7uLL);
            if ([v22 length] && objc_msgSend(v23, "length"))
            {
              unint64_t v24 = [v22 length];
              if (v24 < [v23 length])
              {
                int64_t v15 = 1;
LABEL_40:

                goto LABEL_41;
              }
              unint64_t v32 = [v22 length];
              if (v32 > [v23 length])
              {
                int64_t v15 = -1;
                goto LABEL_40;
              }
            }
            int64_t v15 = -[v22 compare:v23];
            goto LABEL_40;
          }
          goto LABEL_20;
        }
        goto LABEL_18;
      }
    }
LABEL_20:
    int64_t v15 = -1;
  }
LABEL_42:

  return v15;
}

- (int64_t)compareContactsTopHitCandidate:(id)a3
{
  id v4 = a3;
  if (!v4
    || [(PRSRankingItem *)self isLocalTopHitCandidate]
    && ![v4 isLocalTopHitCandidate])
  {
    goto LABEL_22;
  }
  if (![(PRSRankingItem *)self isLocalTopHitCandidate]
    && ([v4 isLocalTopHitCandidate] & 1) != 0)
  {
    goto LABEL_24;
  }
  if ((![(PRSRankingItem *)self isLocalTopHitCandidate]
     || ([v4 isLocalTopHitCandidate] & 1) == 0)
    && ([(PRSRankingItem *)self isLocalTopHitCandidate]
     || ([v4 isLocalTopHitCandidate] & 1) != 0))
  {
    [(PRSRankingItem *)self topicalityScore];
    double v6 = v5;
    double v7 = [&unk_1F1864718 objectAtIndexedSubscript:3];
    [v7 floatValue];
    if (v6 >= v8)
    {
      [v4 topicalityScore];
      double v17 = v16;
      double v18 = [&unk_1F1864718 objectAtIndexedSubscript:3];
      [v18 floatValue];
      double v20 = v19;

      if (v17 >= v20)
      {
        if ([(PRSRankingItem *)self wasEngagedInSpotlight]
          && ![v4 wasEngagedInSpotlight])
        {
          goto LABEL_22;
        }
        if (![(PRSRankingItem *)self wasEngagedInSpotlight]
          && ([v4 wasEngagedInSpotlight] & 1) != 0)
        {
          goto LABEL_24;
        }
      }
    }
    else
    {
    }
    goto LABEL_21;
  }
  int64_t v9 = [(PRSRankingItem *)self compareShortcutTopHitCandidate:v4];
  if (!v9)
  {
    [(PRSRankingItem *)self likelihood];
    double v11 = v10;
    [v4 likelihood];
    if (v11 > v12)
    {
LABEL_22:
      int64_t v9 = 1;
      goto LABEL_25;
    }
    [(PRSRankingItem *)self likelihood];
    double v14 = v13;
    [v4 likelihood];
    if (v14 < v15)
    {
LABEL_24:
      int64_t v9 = -1;
      goto LABEL_25;
    }
LABEL_21:
    [(PRSRankingItem *)self topicalityScore];
    double v22 = v21;
    [v4 topicalityScore];
    if (v22 > v23) {
      goto LABEL_22;
    }
    [(PRSRankingItem *)self topicalityScore];
    double v25 = v24;
    [v4 topicalityScore];
    if (v25 >= v26)
    {
      double v28 = SSCompactRankingAttrsGetValue((int8x8_t *)[(PRSRankingItem *)self attributes], 7uLL);
      double v29 = SSCompactRankingAttrsGetValue((int8x8_t *)[v4 attributes], 7uLL);
      int64_t v9 = -[v28 compare:v29];

      goto LABEL_25;
    }
    goto LABEL_24;
  }
LABEL_25:

  return v9;
}

- (int64_t)comparePeopleItemTopHitCandidate:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    int64_t v7 = 1;
    goto LABEL_12;
  }
  double v5 = SSCompactRankingAttrsGetValue((int8x8_t *)[(PRSRankingItem *)self attributes], 0x99uLL);
  double v6 = SSCompactRankingAttrsGetValue((int8x8_t *)[v4 attributes], 0x99uLL);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_9;
  }
  [v4 bundleIDType];
  if ([v5 intValue] == 1 && objc_msgSend(v6, "intValue") != 1)
  {
    int64_t v7 = 1;
    goto LABEL_10;
  }
  if ([v5 intValue] != 1 && objc_msgSend(v6, "intValue") == 1) {
    int64_t v7 = -1;
  }
  else {
LABEL_9:
  }
    int64_t v7 = [(PRSRankingItem *)self compareLocalTopHitCandidate:v4];
LABEL_10:

LABEL_12:
  return v7;
}

- (int64_t)compareSafariTopHitCandidate:(id)a3
{
  id v4 = a3;
  if (!v4
    || [(PRSRankingItem *)self isLocalTopHitCandidate]
    && ![v4 isLocalTopHitCandidate])
  {
    goto LABEL_17;
  }
  if (![(PRSRankingItem *)self isLocalTopHitCandidate]
    && ([v4 isLocalTopHitCandidate] & 1) != 0)
  {
    goto LABEL_6;
  }
  if ((![(PRSRankingItem *)self isLocalTopHitCandidate]
     || ([v4 isLocalTopHitCandidate] & 1) == 0)
    && ([(PRSRankingItem *)self isLocalTopHitCandidate]
     || ([v4 isLocalTopHitCandidate] & 1) != 0))
  {
    goto LABEL_23;
  }
  int64_t v5 = [(PRSRankingItem *)self compareShortcutTopHitCandidate:v4];
  if (v5) {
    goto LABEL_20;
  }
  [(PRSRankingItem *)self likelihood];
  double v7 = v6;
  [v4 likelihood];
  if (v7 > v8)
  {
LABEL_17:
    int64_t v5 = 1;
    goto LABEL_20;
  }
  [(PRSRankingItem *)self likelihood];
  double v10 = v9;
  [v4 likelihood];
  if (v10 >= v11)
  {
LABEL_23:
    if (!-[PRSRankingItem wasEngaged](self, "wasEngaged") || ![v4 wasEngaged]) {
      goto LABEL_19;
    }
    [(PRSRankingItem *)self topicalityScore];
    double v13 = v12;
    [v4 topicalityScore];
    if (v13 > v14) {
      goto LABEL_17;
    }
    [(PRSRankingItem *)self topicalityScore];
    double v16 = v15;
    [v4 topicalityScore];
    if (v16 >= v17)
    {
LABEL_19:
      int64_t v5 = 0;
      goto LABEL_20;
    }
  }
LABEL_6:
  int64_t v5 = -1;
LABEL_20:

  return v5;
}

- (int64_t)compareLocalTopHitCandidate:(id)a3
{
  id v4 = a3;
  if (!v4
    || [(PRSRankingItem *)self isLocalTopHitCandidate]
    && ![v4 isLocalTopHitCandidate])
  {
    goto LABEL_14;
  }
  if (![(PRSRankingItem *)self isLocalTopHitCandidate]
    && ([v4 isLocalTopHitCandidate] & 1) != 0)
  {
    goto LABEL_6;
  }
  if ((![(PRSRankingItem *)self isLocalTopHitCandidate]
     || ([v4 isLocalTopHitCandidate] & 1) == 0)
    && ([(PRSRankingItem *)self isLocalTopHitCandidate]
     || ([v4 isLocalTopHitCandidate] & 1) != 0))
  {
LABEL_11:
    int64_t v5 = 0;
    goto LABEL_15;
  }
  int64_t v5 = [(PRSRankingItem *)self compareShortcutTopHitCandidate:v4];
  if (v5) {
    goto LABEL_15;
  }
  [(PRSRankingItem *)self likelihood];
  double v7 = v6;
  [v4 likelihood];
  if (v7 > v8)
  {
LABEL_14:
    int64_t v5 = 1;
    goto LABEL_15;
  }
  [(PRSRankingItem *)self likelihood];
  double v11 = v10;
  [v4 likelihood];
  if (v11 >= v12)
  {
    [(PRSRankingItem *)self likelihood];
    if (v13 == 1.0)
    {
      if ([(PRSRankingItem *)self wasEngagedInSpotlight]
        && ![v4 wasEngagedInSpotlight])
      {
        goto LABEL_14;
      }
      if ([(PRSRankingItem *)self wasEngagedInSpotlight]
        || ([v4 wasEngagedInSpotlight] & 1) == 0)
      {
        goto LABEL_11;
      }
    }
    else
    {
      [(PRSRankingItem *)self freshnessScore];
      double v15 = v14;
      [v4 freshnessScore];
      if (v15 > v16) {
        goto LABEL_14;
      }
      [(PRSRankingItem *)self freshnessScore];
      double v18 = v17;
      [v4 freshnessScore];
      if (v18 >= v19) {
        goto LABEL_11;
      }
    }
  }
LABEL_6:
  int64_t v5 = -1;
LABEL_15:

  return v5;
}

- (int64_t)compareParsecTopHitCandidate:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    int64_t v5 = [(PRSRankingItem *)self compareShortcutTopHitCandidate:v4];
    if (!v5)
    {
      [(PRSRankingItem *)self engagementScore];
      float v7 = v6;
      [v4 engagementScore];
      float v9 = v8;
      if (v7 >= v9) {
        uint64_t v10 = 0;
      }
      else {
        uint64_t v10 = -1;
      }
      if (v7 > v9) {
        int64_t v5 = 1;
      }
      else {
        int64_t v5 = v10;
      }
    }
  }
  else
  {
    int64_t v5 = 1;
  }

  return v5;
}

- (BOOL)isPerfectMatch
{
  [(PRSRankingItem *)self topicalityScore];
  return fabs(v2 + -1.0) < 2.22044605e-16;
}

- (BOOL)isAssociatedWithTophitContactsFromItems:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([(PRSRankingItem *)self bundleIDType] & 0x20) == 0
    && ([(PRSRankingItem *)self bundleIDType] & 8) == 0
    && ([(PRSRankingItem *)self bundleIDType] & 0x100000) == 0
    || ![v4 count])
  {
    BOOL v23 = 0;
    goto LABEL_42;
  }
  int64_t v5 = SSCompactRankingAttrsGetValue((int8x8_t *)[(PRSRankingItem *)self attributes], 5uLL);
  double v6 = SSCompactRankingAttrsGetValue((int8x8_t *)[(PRSRankingItem *)self attributes], 0x14CuLL);
  if (![v5 count] && !objc_msgSend(v6, "count"))
  {
    BOOL v23 = 0;
    goto LABEL_41;
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (!v8)
  {
    BOOL v23 = 0;
    goto LABEL_40;
  }
  uint64_t v9 = v8;
  uint64_t v10 = *(void *)v36;
  double v25 = v6;
  double v26 = v5;
  while (2)
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v36 != v10) {
        objc_enumerationMutation(v7);
      }
      double v12 = *(void **)(*((void *)&v35 + 1) + 8 * i);
      if ((objc_msgSend(v12, "bundleIDType", v25) & 0x8000) != 0 && (objc_msgSend(v12, "bundleIDType") & 4) != 0)
      {
        double v13 = SSCompactRankingAttrsGetValue((int8x8_t *)[v12 attributes], 7uLL);
        if ([v13 length])
        {
          long long v33 = 0u;
          long long v34 = 0u;
          long long v31 = 0u;
          long long v32 = 0u;
          id v14 = v5;
          uint64_t v15 = [v14 countByEnumeratingWithState:&v31 objects:v40 count:16];
          if (v15)
          {
            uint64_t v16 = v15;
            uint64_t v17 = *(void *)v32;
LABEL_17:
            uint64_t v18 = 0;
            while (1)
            {
              if (*(void *)v32 != v17) {
                objc_enumerationMutation(v14);
              }
              if ([v13 isEqualToString:*(void *)(*((void *)&v31 + 1) + 8 * v18)]) {
                goto LABEL_38;
              }
              if (v16 == ++v18)
              {
                uint64_t v16 = [v14 countByEnumeratingWithState:&v31 objects:v40 count:16];
                if (v16) {
                  goto LABEL_17;
                }
                break;
              }
            }
          }

          double v6 = v25;
          int64_t v5 = v26;
          if ((unint64_t)[v25 count] <= 3)
          {
            long long v29 = 0u;
            long long v30 = 0u;
            long long v27 = 0u;
            long long v28 = 0u;
            id v14 = v25;
            uint64_t v19 = [v14 countByEnumeratingWithState:&v27 objects:v39 count:16];
            if (v19)
            {
              uint64_t v20 = v19;
              uint64_t v21 = *(void *)v28;
LABEL_26:
              uint64_t v22 = 0;
              while (1)
              {
                if (*(void *)v28 != v21) {
                  objc_enumerationMutation(v14);
                }
                if ([v13 isEqualToString:*(void *)(*((void *)&v27 + 1) + 8 * v22)]) {
                  break;
                }
                if (v20 == ++v22)
                {
                  uint64_t v20 = [v14 countByEnumeratingWithState:&v27 objects:v39 count:16];
                  if (v20) {
                    goto LABEL_26;
                  }
                  goto LABEL_32;
                }
              }
LABEL_38:

              BOOL v23 = 1;
              double v6 = v25;
              int64_t v5 = v26;
              goto LABEL_40;
            }
LABEL_32:

            double v6 = v25;
            int64_t v5 = v26;
          }
        }
      }
    }
    uint64_t v9 = [v7 countByEnumeratingWithState:&v35 objects:v41 count:16];
    BOOL v23 = 0;
    if (v9) {
      continue;
    }
    break;
  }
LABEL_40:

LABEL_41:
LABEL_42:

  return v23;
}

- (BOOL)isGoodPhotosMatch
{
  [(PRSRankingItem *)self l2Score];
  return v2 > 44.0;
}

- (BOOL)isGoodMatchAlternateName:(id)a3 withEvaluator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(PRSRankingItem *)self matchScoreAppName:v6 withEvaluator:v7];
  double v9 = v8;
  if (v8 > 0.99 || v9 > 0.97 && ([v7 isCJK] & 1) != 0) {
    goto LABEL_2;
  }
  if (v9 <= 0.95) {
    goto LABEL_14;
  }
  double v12 = [v7 queryString];
  if ((unint64_t)[v12 length] < 2 || (unint64_t)objc_msgSend(v6, "length") > 5) {
    goto LABEL_13;
  }
  uint64_t v13 = [v6 length];
  id v14 = [v7 queryString];
  if ((unint64_t)(v13 - [v14 length]) >= 2)
  {

LABEL_13:
    goto LABEL_14;
  }
  uint64_t v15 = [v6 localizedUppercaseString];
  char v16 = [v15 isEqualToString:v6];

  if (v16) {
    goto LABEL_2;
  }
LABEL_14:
  [(PRSRankingItem *)self matchScoreTitle:v6 withEvaluator:v7];
  float v18 = v17;
  if (v9 > 0.9)
  {
    uint64_t v19 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
    uint64_t v20 = [v6 rangeOfCharacterFromSet:v19];

    if (v20 != 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_26;
    }
    if (v9 > 0.95)
    {
      uint64_t v21 = [v7 queryString];
      unint64_t v22 = [v21 length];

      if (v22 > 3) {
        goto LABEL_2;
      }
    }
    if ([v6 containsCJK])
    {
LABEL_26:
      if (v18 <= 0.35)
      {
        BOOL v23 = objc_msgSend(v7, "queryString", v18);
        unint64_t v24 = [v23 length];

        if (v24 <= 2) {
          goto LABEL_21;
        }
      }
LABEL_2:
      BOOL v10 = 1;
      goto LABEL_3;
    }
  }
LABEL_21:
  if (v18 >= 0.6)
  {
    double v25 = objc_msgSend(v7, "queryString", v18);
    BOOL v10 = (unint64_t)[v25 length] > 2;
  }
  else
  {
    BOOL v10 = 0;
  }
LABEL_3:

  return v10;
}

- (BOOL)isCCCD
{
  id v3 = [(PRSRankingItem *)self sectionBundleIdentifier];
  if ([v3 isEqualToString:@"com.apple.conversion"])
  {
    char v4 = 1;
  }
  else
  {
    int64_t v5 = [(PRSRankingItem *)self sectionBundleIdentifier];
    if ([v5 isEqualToString:@"com.apple.calculation"])
    {
      char v4 = 1;
    }
    else
    {
      id v6 = [(PRSRankingItem *)self sectionBundleIdentifier];
      if ([v6 isEqualToString:@"com.apple.worldclock"])
      {
        char v4 = 1;
      }
      else
      {
        id v7 = [(PRSRankingItem *)self sectionBundleIdentifier];
        char v4 = [v7 isEqualToString:@"com.apple.datadetector.quick_actions"];
      }
    }
  }
  return v4;
}

- (BOOL)isSearchResultPage:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = isSearchResultPage__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&isSearchResultPage__onceToken, &__block_literal_global_417);
  }
  int64_t v5 = [v4 lowercaseString];

  id v6 = [MEMORY[0x1E4F1CB10] URLWithString:v5];
  id v7 = v6;
  if (!v6)
  {
    BOOL v28 = 0;
    goto LABEL_51;
  }
  float v8 = [v6 host];
  if (!v8)
  {
    BOOL v28 = 0;
    goto LABEL_50;
  }
  double v9 = [v7 path];
  BOOL v10 = [v7 query];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obj = (id)isSearchResultPage__searchProviders;
  uint64_t v33 = [obj countByEnumeratingWithState:&v43 objects:v50 count:16];
  if (!v33)
  {
    BOOL v28 = 0;
    goto LABEL_49;
  }
  uint64_t v34 = *(void *)v44;
  long long v30 = v5;
  long long v31 = v10;
  while (2)
  {
    for (uint64_t i = 0; i != v33; ++i)
    {
      if (*(void *)v44 != v34) {
        objc_enumerationMutation(obj);
      }
      uint64_t v12 = *(void *)(*((void *)&v43 + 1) + 8 * i);
      uint64_t v13 = [(id)isSearchResultPage__searchProvidersAlternateHostChecks objectForKey:v12];
      if (!v13)
      {
        uint64_t v49 = v12;
        uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v49 count:1];
      }
      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      id v14 = v13;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v39 objects:v48 count:16];
      id v16 = v14;
      if (!v15) {
        goto LABEL_39;
      }
      uint64_t v17 = v15;
      int v18 = 0;
      uint64_t v19 = *(void *)v40;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v40 != v19) {
            objc_enumerationMutation(v14);
          }
          v18 |= [v8 containsString:*(void *)(*((void *)&v39 + 1) + 8 * j)];
        }
        uint64_t v17 = [v14 countByEnumeratingWithState:&v39 objects:v48 count:16];
      }
      while (v17);

      if (v18)
      {
        uint64_t v21 = [(id)isSearchResultPage__searchProvidersPaths objectForKey:v12];
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        id v16 = v21;
        uint64_t v22 = [v16 countByEnumeratingWithState:&v35 objects:v47 count:16];
        if (v22)
        {
          uint64_t v23 = v22;
          uint64_t v24 = *(void *)v36;
          while (2)
          {
            for (uint64_t k = 0; k != v23; ++k)
            {
              if (*(void *)v36 != v24) {
                objc_enumerationMutation(v16);
              }
              if (*(void *)(*((void *)&v35 + 1) + 8 * k)) {
                BOOL v26 = v9 == 0;
              }
              else {
                BOOL v26 = 1;
              }
              if (!v26 && (objc_msgSend(v9, "isEqualToString:") & 1) != 0)
              {
                long long v27 = v16;
                goto LABEL_45;
              }
            }
            uint64_t v23 = [v16 countByEnumeratingWithState:&v35 objects:v47 count:16];
            if (v23) {
              continue;
            }
            break;
          }
        }

        if (![v16 count] && (unint64_t)objc_msgSend(v9, "length") > 1)
        {
          BOOL v28 = 0;
          goto LABEL_46;
        }
        long long v27 = [(id)isSearchResultPage__searchProvidersQueryPrefix objectForKey:v12];
        if (![v16 count] && v27 && v31 && (objc_msgSend(v31, "hasPrefix:", v27) & 1) != 0)
        {
LABEL_45:

          BOOL v28 = 1;
LABEL_46:
          int64_t v5 = v30;
          BOOL v10 = v31;

          goto LABEL_49;
        }

LABEL_39:
      }
    }
    BOOL v28 = 0;
    int64_t v5 = v30;
    BOOL v10 = v31;
    uint64_t v33 = [obj countByEnumeratingWithState:&v43 objects:v50 count:16];
    if (v33) {
      continue;
    }
    break;
  }
LABEL_49:

LABEL_50:
LABEL_51:

  return v28;
}

void __46__PRSRankingItem_Scoring__isSearchResultPage___block_invoke()
{
  v16[9] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = (void *)MEMORY[0x1E4F1CAD0];
  v16[0] = @"baidu";
  v16[1] = @"bing";
  v16[2] = @"duckduckgo";
  v16[3] = @"ecosia";
  void v16[4] = @"google";
  v16[5] = @"qihoo";
  v16[6] = @"sogou";
  v16[7] = @"yahoo";
  v16[8] = @"yandex";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:9];
  uint64_t v2 = [v0 setWithArray:v1];
  uint64_t v3 = (void *)isSearchResultPage__searchProviders;
  isSearchResultPage__searchProviders = v2;

  v14[0] = @"baidu";
  v14[1] = @"bing";
  v15[0] = &unk_1F1864778;
  v15[1] = &unk_1F1864790;
  v14[2] = @"ecosia";
  v14[3] = @"google";
  v15[2] = &unk_1F18647A8;
  v15[3] = &unk_1F18647C0;
  v14[4] = @"qihoo";
  v14[5] = @"sogou";
  void v15[4] = &unk_1F18647D8;
  v15[5] = &unk_1F18647F0;
  v14[6] = @"yahoo";
  v14[7] = @"yandex";
  v15[6] = &unk_1F1864808;
  v15[7] = &unk_1F1864820;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:8];
  int64_t v5 = (void *)isSearchResultPage__searchProvidersPaths;
  isSearchResultPage__searchProvidersPaths = v4;

  uint64_t v12 = @"duckduckgo";
  uint64_t v13 = @"q=";
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  id v7 = (void *)isSearchResultPage__searchProvidersQueryPrefix;
  isSearchResultPage__searchProvidersQueryPrefix = v6;

  v10[0] = @"duckduckgo";
  v10[1] = @"qihoo";
  v11[0] = &unk_1F1864838;
  v11[1] = &unk_1F1864850;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  double v9 = (void *)isSearchResultPage__searchProvidersAlternateHostChecks;
  isSearchResultPage__searchProvidersAlternateHostChecks = v8;
}

- (void)resetScoreForShortcutsSetting:(id)a3
{
  id v24 = a3;
  uint64_t v4 = SSCompactRankingAttrsGetValue((int8x8_t *)[(PRSRankingItem *)self attributes], 0x48uLL);
  if ([v4 isEqualToString:@"com.apple.Preferences"])
  {
    int64_t v5 = SSCompactRankingAttrsGetValue((int8x8_t *)[(PRSRankingItem *)self attributes], 0xA7uLL);
    if (v24)
    {
      uint64_t v6 = [v24 objectForKeyedSubscript:v5];
      if (v6)
      {
        [(PRSRankingItem *)self topicalityScore];
        double v8 = v7;
        [v6 topicalityScore];
        double v10 = v9 + 0.01;
        if (v10 > 1.0) {
          double v10 = 1.0;
        }
        if (v8 >= v10) {
          double v10 = v8;
        }
        [(PRSRankingItem *)self setTopicalityScore:v10];
        [(PRSRankingItem *)self topicalityScore];
        *(float *)&double v11 = v11;
        [(PRSRankingItem *)self setKeywordMatchScore:v11];
        [(PRSRankingItem *)self engagementScore];
        double v13 = v12;
        [v6 engagementScore];
        double v15 = v14 + 0.01;
        if (v15 > 1.0) {
          double v15 = 1.0;
        }
        if (v13 >= v15) {
          double v15 = v13;
        }
        [(PRSRankingItem *)self setEngagementScore:v15];
        [(PRSRankingItem *)self freshnessScore];
        double v17 = v16;
        [v6 freshnessScore];
        double v19 = v18 + 0.01;
        if (v19 > 1.0) {
          double v19 = 1.0;
        }
        if (v17 >= v19) {
          double v19 = v17;
        }
        [(PRSRankingItem *)self setFreshnessScore:v19];
        [(PRSRankingItem *)self likelihood];
        double v21 = v20;
        [v6 likelihood];
        double v23 = v22 + 0.01;
        if (v23 > 1.0) {
          double v23 = 1.0;
        }
        if (v21 >= v23) {
          double v23 = v21;
        }
        [(PRSRankingItem *)self setLikelihood:v23];
      }
    }
  }
}

- (void)extractDocumentSignals
{
  [(PRSRankingItem *)self setDetectedEventType:0];
  SSCompactRankingAttrsGetValue((int8x8_t *)[(PRSRankingItem *)self attributes], 0x121uLL);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = SSCompactRankingAttrsGetValue((int8x8_t *)[(PRSRankingItem *)self attributes], 0xE5uLL);
  uint64_t v4 = (void *)MEMORY[0x1E4F228C8];
  int64_t v5 = (void *)MEMORY[0x1E4F228D0];
  uint64_t v6 = (void *)MEMORY[0x1E4F228E0];
  double v7 = (void *)MEMORY[0x1E4F228E8];
  double v8 = (void *)MEMORY[0x1E4F228B8];
  double v9 = (void *)MEMORY[0x1E4F228D8];
  double v10 = (void *)MEMORY[0x1E4F228F0];
  double v11 = (void *)MEMORY[0x1E4F228C0];
  if (v12)
  {
    if ([v12 containsObject:*MEMORY[0x1E4F228C8]]) {
      [(PRSRankingItem *)self setDetectedEventType:[(PRSRankingItem *)self detectedEventType] | 0x8000];
    }
    if ([v12 containsObject:*v5]) {
      [(PRSRankingItem *)self setDetectedEventType:[(PRSRankingItem *)self detectedEventType] | 0x4000];
    }
    if ([v12 containsObject:*v6]) {
      [(PRSRankingItem *)self setDetectedEventType:[(PRSRankingItem *)self detectedEventType] | 0x10000];
    }
    if ([v12 containsObject:*v7]) {
      [(PRSRankingItem *)self setDetectedEventType:[(PRSRankingItem *)self detectedEventType] | 0x40000];
    }
    if ([v12 containsObject:*v8]) {
      [(PRSRankingItem *)self setDetectedEventType:[(PRSRankingItem *)self detectedEventType] | 0x80000];
    }
    if ([v12 containsObject:*v9]) {
      [(PRSRankingItem *)self setDetectedEventType:[(PRSRankingItem *)self detectedEventType] | 0x100000];
    }
    if ([v12 containsObject:*v10]) {
      [(PRSRankingItem *)self setDetectedEventType:[(PRSRankingItem *)self detectedEventType] | 0x200000];
    }
    if ([v12 containsObject:*v11]) {
      [(PRSRankingItem *)self setDetectedEventType:[(PRSRankingItem *)self detectedEventType] | 0x400000];
    }
  }
  if (v3)
  {
    if ([v3 isEqualToString:*v4]) {
      [(PRSRankingItem *)self setDetectedEventType:[(PRSRankingItem *)self detectedEventType] | 0x8000];
    }
    if ([v3 isEqualToString:*v5]) {
      [(PRSRankingItem *)self setDetectedEventType:[(PRSRankingItem *)self detectedEventType] | 0x4000];
    }
    if ([v3 isEqualToString:*v6]) {
      [(PRSRankingItem *)self setDetectedEventType:[(PRSRankingItem *)self detectedEventType] | 0x10000];
    }
    if ([v3 isEqualToString:*v7]) {
      [(PRSRankingItem *)self setDetectedEventType:[(PRSRankingItem *)self detectedEventType] | 0x40000];
    }
    if ([v3 isEqualToString:*v8]) {
      [(PRSRankingItem *)self setDetectedEventType:[(PRSRankingItem *)self detectedEventType] | 0x80000];
    }
    if ([v3 isEqualToString:*v9]) {
      [(PRSRankingItem *)self setDetectedEventType:[(PRSRankingItem *)self detectedEventType] | 0x100000];
    }
    if ([v3 isEqualToString:*v10]) {
      [(PRSRankingItem *)self setDetectedEventType:[(PRSRankingItem *)self detectedEventType] | 0x200000];
    }
    if ([v3 isEqualToString:*v11]) {
      [(PRSRankingItem *)self setDetectedEventType:[(PRSRankingItem *)self detectedEventType] | 0x400000];
    }
  }
}

- (uint64_t)test_inputToModelScore
{
  if (result) {
    return *(void *)(result + 592);
  }
  return result;
}

- (uint64_t)inputToModelScore
{
  if (result) {
    return *(void *)(result + 592);
  }
  return result;
}

- (uint64_t)test_indexScore
{
  if (result) {
    return *(void *)(result + 608);
  }
  return result;
}

- (uint64_t)indexScore
{
  if (result) {
    return *(void *)(result + 608);
  }
  return result;
}

- (void)setTest_inputToModelScore:(PRSRankingItem *)self
{
  if (self)
  {
    *(void *)self->_inputToModelScore = v2;
    *(void *)&self->_inputToModelScore[8] = v3;
  }
}

- (void)setTest_indexScore:(PRSRankingItem *)self
{
  if (self)
  {
    *(void *)self->_indexScore = v2;
    *(void *)&self->_indexScore[8] = v3;
  }
}

+ (void)initialize
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)bundlesExcludedFromRankCategory
{
  if (bundlesExcludedFromRankCategory_onceToken != -1) {
    dispatch_once(&bundlesExcludedFromRankCategory_onceToken, &__block_literal_global_203_0);
  }
  uint64_t v2 = (void *)bundlesExcludedFromRankCategory_sDictionary;
  return v2;
}

void __49__PRSRankingItem_bundlesExcludedFromRankCategory__block_invoke()
{
  v3[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = @"public.image";
  v3[0] = @"com.apple.mobilemail";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:&v2 count:1];
  v1 = (void *)bundlesExcludedFromRankCategory_sDictionary;
  bundlesExcludedFromRankCategory_sDictionary = v0;
}

- (PRSRankingItem)initWithAttrs:(id *)a3
{
  return [(PRSRankingItem *)self initWithAttrs:a3 isServerAlternativeResult:0];
}

- (PRSRankingItem)initWithAttrs:(id *)a3 isServerAlternativeResult:(BOOL)a4
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  v65.receiver = self;
  v65.super_class = (Class)PRSRankingItem;
  uint64_t v6 = [(PRSRankingItem *)&v65 init];
  double v7 = v6;
  if (!v6) {
    return v7;
  }
  BOOL v56 = a4;
  *(_OWORD *)v6->_indexScore = 0u;
  v6->_suggestionScore = 0.0;
  serverSuggestionsData = v6->_serverSuggestionsData;
  v6->_serverSuggestionsData = 0;

  localSuggestionsData = v7->_localSuggestionsData;
  v7->_localSuggestionsData = 0;

  v7->_attributes = a3;
  double v10 = objc_alloc_init(PRSL2FeatureVector);
  L2FeatureVector = v7->_L2FeatureVector;
  v7->_L2FeatureVector = v10;

  [(PRSL2FeatureVector *)v7->_L2FeatureVector setRankingItem:v7];
  uint64_t v12 = objc_opt_new();
  spanCalculator = v7->_spanCalculator;
  v7->_spanCalculator = (PRSRankingSpanCalculator *)v12;

  v7->_itemSparseMatchStrengthType = 3;
  uint64_t v14 = SSCompactRankingAttrsGetValue((int8x8_t *)v7->_attributes, 2uLL);
  identifier = v7->_identifier;
  v7->_identifier = (NSString *)v14;

  uint64_t v16 = SSCompactRankingAttrsGetValue((int8x8_t *)v7->_attributes, 0);
  contentType = v7->_contentType;
  v7->_contentType = (NSString *)v16;

  SSCompactRankingAttrsGetInt128((uint64_t)v7->_attributes, 8uLL, v7->_indexScore);
  uint64_t v18 = 0;
  unint64_t v19 = *(void *)&v7->_indexScore[8];
  unint64_t v60 = *(void *)v7->_indexScore;
  memset(v68, 0, sizeof(v68));
  int v69 = 0;
  v67[0] = 0x780077F077E077DLL;
  *(void *)((char *)v67 + 6) = 0x783078207810780;
  int64x2_t v20 = (int64x2_t)xmmword_1BDC5D810;
  double v21 = (float *)v68 + 1;
  uint64x2_t v57 = (uint64x2_t)vdupq_n_s64(7uLL);
  unint64_t v22 = v19;
  uint64_t v23 = 2 * v19;
  do
  {
    if (vmovn_s64((int64x2_t)vcgtq_u64(v57, (uint64x2_t)v20)).u8[0])
    {
      if ((v18 & 0x40) != 0) {
        unint64_t v24 = v19 >> v18;
      }
      else {
        unint64_t v24 = (v23 << ~(_BYTE)v18) | (v60 >> v18);
      }
      if ((v18 & 0x40) != 0) {
        unint64_t v25 = 0;
      }
      else {
        unint64_t v25 = v19 >> v18;
      }
      *(v21 - 1) = (float)*(unsigned long long *)&v24;
    }
    if (vmovn_s64((int64x2_t)vcgtq_u64((uint64x2_t)vdupq_n_s64(7uLL), *(uint64x2_t *)&v20)).i32[1])
    {
      if (((v18 + 24) & 0x40) != 0) {
        unint64_t v26 = v19 >> (v18 + 24);
      }
      else {
        unint64_t v26 = (v23 << ~(v18 + 24)) | (v60 >> (v18 + 24));
      }
      if (((v18 + 24) & 0x40) != 0) {
        unint64_t v27 = 0;
      }
      else {
        unint64_t v27 = v19 >> (v18 + 24);
      }
      *double v21 = (float)*(unsigned long long *)&v26;
    }
    int64x2_t v20 = vaddq_s64(v20, vdupq_n_s64(2uLL));
    v18 += 48;
    v21 += 2;
  }
  while (v18 != 192);
  [(PRSL2FeatureVector *)v7->_L2FeatureVector setScores:v68 forFeatures:v67 count:7];
  __int16 v58 = v7;
  -[PRSL2FeatureVector setIndexScore:](v7->_L2FeatureVector, "setIndexScore:", *(void *)v7->_indexScore, *(void *)&v7->_indexScore[8]);
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id obj = (id)sModelScoreBitMapRepresentation;
  uint64_t v28 = [obj countByEnumeratingWithState:&v61 objects:v66 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = 0;
    uint64_t v31 = 0;
    char v32 = 0;
    uint64_t v33 = *(void *)v62;
    do
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v62 != v33) {
          objc_enumerationMutation(obj);
        }
        char v35 = v32 + i;
        char v36 = [*(id *)(*((void *)&v61 + 1) + 8 * i) unsignedIntegerValue];
        uint64_t v37 = (v23 << ~v36) | (v60 >> v36);
        if ((v36 & 0x40) != 0) {
          uint64_t v37 = v22 >> v36;
        }
        uint64_t v38 = v37 << 63 >> 63;
        uint64_t v39 = 1 << v35;
        if (((v32 + (_BYTE)i) & 0x40) != 0) {
          uint64_t v40 = 0;
        }
        else {
          uint64_t v40 = 1 << v35;
        }
        if (((v32 + (_BYTE)i) & 0x40) == 0) {
          uint64_t v39 = 0;
        }
        uint64_t v41 = v38 & v39;
        uint64_t v42 = v38 & v40;
        BOOL v43 = __CFADD__(v42, v30);
        v30 += v42;
        v31 += v43 + v41;
      }
      v32 += v29;
      uint64_t v29 = [obj countByEnumeratingWithState:&v61 objects:v66 count:16];
    }
    while (v29);
  }
  else
  {
    uint64_t v30 = 0;
    uint64_t v31 = 0;
  }

  double v7 = v58;
  *(void *)&v58->_inputToModelScore[8] = v31;
  *(void *)v58->_inputToModelScore = v30;
  uint64_t v44 = SSCompactRankingAttrsGetValue((int8x8_t *)v58->_attributes, 0xAuLL);
  sectionBundleIdentifier = v58->_sectionBundleIdentifier;
  v58->_sectionBundleIdentifier = (NSString *)v44;

  firstMatchedAltName = v58->_firstMatchedAltName;
  v58->_firstMatchedAltName = 0;

  exactMatchedKeyword = v58->_exactMatchedKeyword;
  v58->_exactMatchedKeyword = 0;

  displayNameInitials = v58->_displayNameInitials;
  v58->_displayNameInitials = 0;

  v58->_importantPropertiesPrefixMatched = 0;
  v58->_importantPropertiesWordMatched = 0;
  uint64_t v49 = v58->_sectionBundleIdentifier;
  if ([(NSString *)v49 isEqualToString:@"com.apple.mobilenotes"])
  {
    uint64_t v50 = 2;
    goto LABEL_66;
  }
  if ([(NSString *)v49 isEqualToString:@"com.apple.MobileAddressBook"])
  {
    uint64_t v50 = 4;
    goto LABEL_66;
  }
  if ([(NSString *)v49 isEqualToString:@"com.apple.MobileSMS"])
  {
    uint64_t v50 = 8;
    goto LABEL_66;
  }
  if ([(NSString *)v49 isEqualToString:@"com.apple.Preferences"])
  {
    uint64_t v50 = 16;
    goto LABEL_66;
  }
  if ([(NSString *)v49 isEqualToString:@"com.apple.mobilecal"])
  {
    uint64_t v50 = 32;
    goto LABEL_66;
  }
  if ([(NSString *)v49 isEqualToString:@"com.apple.spotlight.events"])
  {
    uint64_t v50 = 0x20000000000000;
    goto LABEL_66;
  }
  if ([(NSString *)v49 isEqualToString:@"com.apple.reminders"])
  {
    uint64_t v50 = 64;
    goto LABEL_66;
  }
  if ([(NSString *)v49 isEqualToString:@"com.apple.mobilesafari"])
  {
    uint64_t v50 = 128;
    goto LABEL_66;
  }
  if ([(NSString *)v49 isEqualToString:@"com.apple.application"])
  {
    uint64_t v50 = 256;
    goto LABEL_66;
  }
  if ([(NSString *)v49 isEqualToString:@"com.apple.Music"])
  {
    uint64_t v50 = 512;
    goto LABEL_66;
  }
  if ([(NSString *)v49 isEqualToString:@"com.apple.weather"])
  {
    uint64_t v50 = 1024;
    goto LABEL_66;
  }
  if ([(NSString *)v49 isEqualToString:@"com.apple.CloudDocs.iCloudDriveFileProvider"]
    || [(NSString *)v49 isEqualToString:@"com.apple.CloudDocs.iCloudDriveFileProviderManaged"])
  {
    uint64_t v50 = 2048;
    goto LABEL_66;
  }
  if ([(NSString *)v49 isEqualToString:@"com.apple.DocumentsApp"]
    || [(NSString *)v49 isEqualToString:@"com.apple.FileProvider.LocalStorage"]
    || [(NSString *)v49 isEqualToString:@"com.apple.CloudDocs.MobileDocumentsFileProvider"])
  {
    uint64_t v50 = 2048;
LABEL_65:
    double v7 = v58;
    goto LABEL_66;
  }
  if ([(NSString *)v49 isEqualToString:@"com.apple.calculation"])
  {
    uint64_t v50 = 4096;
    goto LABEL_65;
  }
  if ([(NSString *)v49 isEqualToString:@"com.apple.worldclock"])
  {
    uint64_t v50 = 0x40000000;
    goto LABEL_65;
  }
  if ([(NSString *)v49 isEqualToString:@"com.apple.datadetector.quick_actions"])
  {
    uint64_t v50 = 0x80000000;
    goto LABEL_65;
  }
  if ([(NSString *)v49 isEqualToString:@"com.apple.conversion"])
  {
    uint64_t v50 = 0x2000;
    goto LABEL_65;
  }
  if ([(NSString *)v49 isEqualToString:@"com.apple.app-clips"])
  {
    uint64_t v50 = 0x10000;
    goto LABEL_65;
  }
  if ([(NSString *)v49 isEqualToString:@"com.apple.photos"])
  {
    uint64_t v50 = 0x20000;
    goto LABEL_65;
  }
  if ([(NSString *)v49 isEqualToString:@"com.apple.mobileslideshow"])
  {
    uint64_t v50 = 0x40000;
    goto LABEL_65;
  }
  if ([(NSString *)v49 isEqualToString:@"com.apple.shortcuts"])
  {
    uint64_t v50 = 0x200000;
    goto LABEL_65;
  }
  if ([(NSString *)v49 isEqualToString:@"com.apple.mobiletimer"])
  {
    uint64_t v50 = 0x100000000;
    goto LABEL_65;
  }
  if ([(NSString *)v49 isEqualToString:@"com.apple.Passbook"])
  {
    uint64_t v50 = 0x200000000;
    goto LABEL_65;
  }
  if ([(NSString *)v49 isEqualToString:@"com.apple.people.findMy"])
  {
    uint64_t v50 = 0x400000;
    goto LABEL_65;
  }
  if ([(NSString *)v49 isEqualToString:@"com.apple.people.askToBuyRequest"])
  {
    uint64_t v50 = 0x800000;
    goto LABEL_65;
  }
  if ([(NSString *)v49 isEqualToString:@"com.apple.people.screenTimeRequest"])
  {
    uint64_t v50 = 0x1000000;
    goto LABEL_65;
  }
  if ([(NSString *)v49 isEqualToString:@"com.apple.searchd.syndicatedPhotos"])
  {
    uint64_t v50 = 0x2000000;
    goto LABEL_65;
  }
  if ([(NSString *)v49 isEqualToString:@"com.apple.mobilemail"])
  {
    uint64_t v50 = 0x100000;
    goto LABEL_65;
  }
  if ([(NSString *)v49 isEqualToString:@"com.apple.dictionary"])
  {
    uint64_t v50 = 0x800000000000;
    goto LABEL_65;
  }
  if ([(NSString *)v49 isEqualToString:@"com.apple.iBooks"])
  {
    uint64_t v50 = 0x2000000000000;
    goto LABEL_65;
  }
  if ([(NSString *)v49 isEqualToString:@"com.apple.tips"])
  {
    uint64_t v50 = 0x4000000000000;
    goto LABEL_65;
  }
  if ([(NSString *)v49 isEqualToString:@"com.apple.podcasts"])
  {
    uint64_t v50 = 0x40000000000000;
    goto LABEL_65;
  }
  if ([(NSString *)v49 isEqualToString:@"com.apple.VoiceMemos"])
  {
    uint64_t v50 = 0x400000000000000;
    goto LABEL_65;
  }
  if ([(NSString *)v49 isEqualToString:@"com.apple.mobilephone"])
  {
    uint64_t v50 = 0x800000000000000;
    goto LABEL_65;
  }
  double v7 = v58;
  if (![(NSString *)v49 isEqualToString:@"com.apple.freeform"]) {
    goto LABEL_67;
  }
  uint64_t v50 = 0x1000000000000000;
LABEL_66:
  v7->_bundleIDType |= v50;
LABEL_67:
  if ([(NSString *)v7->_identifier hasPrefix:@"com.apple.coreduet."]) {
    v7->_bundleIDType |= 0x4000uLL;
  }
  v7->_isPrepared = 0;
  *(void *)&v7->_hasPolicyMultipleTermsNearMatch = 0;
  *(void *)&v7->_eligibleForDemotion = 0;
  *(void *)&v7->_displayNameInitialsPrefixMatchOnly = 0;
  v7->_isServerAlternativeResult = v56;
  v7->_topHitReason = 0;
  [@"com.apple.searchd" UTF8String];
  v7->_isInternal = os_variant_has_internal_diagnostics();
  v7->_queryTermCount = -1;
  *(_OWORD *)&v7->_attrCountsPrefix = 0u;
  *(_OWORD *)&v7->_attrCountsPrefixLast = 0u;
  *(_OWORD *)&v7->_attrCountsWord2 = 0u;
  *(_OWORD *)&v7->_attrCountsPrefix3 = 0u;
  *(_OWORD *)&v7->_attrCountsPrefixLast3 = 0u;
  *(_OWORD *)&v7->_attrStrong = 0u;
  *(void *)&v7->_maxCoverage = 0x4F00000000000000;
  lastUsedDate = v7->_lastUsedDate;
  v7->_lastUsedDate = 0;

  recentSimilarIntentEngagementDates = v7->_recentSimilarIntentEngagementDates;
  v7->_recentSimilarIntentEngagementDates = 0;

  v7->_mostRecentUseInMinutes = 0.0;
  interestingDate = v7->_interestingDate;
  v7->_interestingDate = 0;

  v7->_cachedFeatures = 0;
  __int16 v54 = requiredTextFeatureAttributes();
  sRequiredAttributesCount = [v54 count];

  v7->_isAppEntity = 0;
  return v7;
}

- (id)initForParsecResultWithBundleID:(id)a3
{
  id v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)PRSRankingItem;
  uint64_t v6 = [(PRSRankingItem *)&v24 init];
  double v7 = v6;
  if (v6)
  {
    *(_OWORD *)v6->_indexScore = 0u;
    v6->_suggestionScore = 0.0;
    localSuggestionsData = v6->_localSuggestionsData;
    v6->_localSuggestionsData = 0;

    serverSuggestionsData = v7->_serverSuggestionsData;
    v7->_serverSuggestionsData = 0;

    double v10 = objc_alloc_init(PRSL2FeatureVector);
    L2FeatureVector = v7->_L2FeatureVector;
    v7->_L2FeatureVector = v10;

    uint64_t v12 = objc_opt_new();
    spanCalculator = v7->_spanCalculator;
    v7->_spanCalculator = (PRSRankingSpanCalculator *)v12;

    objc_storeStrong((id *)&v7->_sectionBundleIdentifier, a3);
    uint64_t v14 = v7->_sectionBundleIdentifier;
    firstMatchedAltName = v7->_firstMatchedAltName;
    v7->_firstMatchedAltName = 0;

    exactMatchedKeyword = v7->_exactMatchedKeyword;
    v7->_exactMatchedKeyword = 0;

    displayNameInitials = v7->_displayNameInitials;
    v7->_displayNameInitials = 0;

    v7->_isPrepared = 0;
    v7->_topHitReason = 0;
    *(void *)&v7->_eligibleForDemotion = 0;
    *(void *)&v7->_displayNameInitialsFirstWordAndMoreMatchOnly = 0;
    *(void *)&v7->_hasPolicyMultipleTermsNearMatch = 0;
    v7->_importantPropertiesPrefixMatched = 0;
    v7->_importantPropertiesWordMatched = 0;
    [@"com.apple.searchd" UTF8String];
    v7->_isInternal = os_variant_has_internal_diagnostics();
    v7->_queryTermCount = -1;
    *(_OWORD *)&v7->_attrCountsPrefix = 0u;
    *(_OWORD *)&v7->_attrCountsPrefixLast = 0u;
    *(_OWORD *)&v7->_attrCountsWord2 = 0u;
    *(_OWORD *)&v7->_attrCountsPrefix3 = 0u;
    *(_OWORD *)&v7->_attrCountsPrefixLast3 = 0u;
    *(_OWORD *)&v7->_attrStrong = 0u;
    *(void *)&v7->_maxCoverage = 0x4F00000000000000;
    lastUsedDate = v7->_lastUsedDate;
    v7->_lastUsedDate = 0;

    recentSimilarIntentEngagementDates = v7->_recentSimilarIntentEngagementDates;
    v7->_recentSimilarIntentEngagementDates = 0;

    v7->_mostRecentUseInMinutes = 0.0;
    interestingDate = v7->_interestingDate;
    v7->_interestingDate = 0;

    v7->_cachedFeatures = 0;
    double v21 = requiredTextFeatureAttributes();
    sRequiredAttributesCount = [v21 count];

    if ([(NSString *)v14 isEqualToString:@"com.apple.parsec.web_index"])
    {
      uint64_t v22 = 0x200000000000;
    }
    else if ([(NSString *)v14 isEqualToString:@"com.apple.parsec.maps"])
    {
      uint64_t v22 = 0x10000000000;
    }
    else if ([(NSString *)v14 isEqualToString:@"com.apple.parsec.stocks"])
    {
      uint64_t v22 = 0x20000000000;
    }
    else if ([(NSString *)v14 isEqualToString:@"com.apple.parsec.sports"])
    {
      uint64_t v22 = 0x40000000000;
    }
    else if ([(NSString *)v14 isEqualToString:@"com.apple.parsec.itunes.iosSoftware"] {
           || [(NSString *)v14 isEqualToString:@"com.apple.parsec.itunes.iosSoftware"]
    }
           || [(NSString *)v14 isEqualToString:@"com.apple.parsec.app_distr"])
    {
      uint64_t v22 = 0x80000000000;
    }
    else if ([(NSString *)v14 isEqualToString:@"com.apple.parsec.kg"])
    {
      uint64_t v22 = 0x100000000000;
    }
    else if ([(NSString *)v14 isEqualToString:@"com.apple.parsec.movies"] {
           || [(NSString *)v14 hasPrefix:@"com.apple.parsec.itunes."])
    }
    {
      uint64_t v22 = 0x400000000000;
    }
    else if ([(NSString *)v14 isEqualToString:@"com.apple.parsec.dictionary"])
    {
      uint64_t v22 = 0x1000000000000;
    }
    else if ([(NSString *)v14 isEqualToString:@"com.apple.parsec.weather"])
    {
      uint64_t v22 = 1;
    }
    else if ([(NSString *)v14 isEqualToString:@"com.apple.parsec.web_answer.passage"])
    {
      uint64_t v22 = 0x80000000000000;
    }
    else if ([(NSString *)v14 hasPrefix:@"com.apple.parsec.tv."])
    {
      uint64_t v22 = 0x200000000000000;
    }
    else if ([(NSString *)v14 isEqualToString:@"com.apple.parsec.flights"])
    {
      uint64_t v22 = 0x100000000000000;
    }
    else if ([(NSString *)v14 isEqualToString:@"com.apple.VoiceMemos"])
    {
      uint64_t v22 = 0x400000000000000;
    }
    else if ([(NSString *)v14 isEqualToString:@"com.apple.mobilephone"])
    {
      uint64_t v22 = 0x800000000000000;
    }
    else
    {
      if (![(NSString *)v14 isEqualToString:@"com.apple.freeform"]) {
        goto LABEL_15;
      }
      uint64_t v22 = 0x1000000000000000;
    }
    v7->_bundleIDType |= v22;
LABEL_15:
  }
  return v7;
}

- (PRSRankingItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PRSRankingItem;
  id v5 = [(PRSRankingItem *)&v13 init];
  if (v5)
  {
    [v4 decodeFloatForKey:@"_freshnessScore"];
    v5->_freshnessScore = v6;
    [v4 decodeFloatForKey:@"_engagementScore"];
    v5->_engagementScore = v7;
    [v4 decodeFloatForKey:@"_keywordMatchScore"];
    v5->_keywordMatchScore = v8;
    [v4 decodeFloatForKey:@"_embeddingSimilarity"];
    v5->_embeddingSimilarity = v9;
    [v4 decodeFloatForKey:@"_pommesL1Score"];
    v5->_pommesL1Score = v10;
    [v4 decodeFloatForKey:@"_likelihood"];
    v5->_likelihood = v11;
    v5->_isMailCategoryHighImpact = [v4 decodeBoolForKey:@"_isMailCategoryHighImpact"];
    v5->_isMailCategoryDefault = [v4 decodeBoolForKey:@"_isMailCategoryDefault"];
    v5->_isMailCategoryTransactions = [v4 decodeBoolForKey:@"_isMailCategoryTransactions"];
    v5->_isMailCategoryUpdates = [v4 decodeBoolForKey:@"_isMailCategoryUpdates"];
    v5->_isMailCategoryPromotions = [v4 decodeBoolForKey:@"_isMailCategoryPromotions"];
    v5->_isCalendarFlightEventType = [v4 decodeBoolForKey:@"_isCalendarFlightEventType"];
    v5->_isCalendarHotelEventType = [v4 decodeBoolForKey:@"_isCalendarHotelEventType"];
    v5->_isCalendarRestaurantEventType = [v4 decodeBoolForKey:@"_isCalendarRestaurantEventType"];
    v5->_isCalendarOtherReservationEventType = [v4 decodeBoolForKey:@"_isCalendarOtherReservationEventType"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  if (self->_freshnessScore > 2.22507386e-308) {
    objc_msgSend(v4, "encodeDouble:forKey:", @"_freshnessScore");
  }
  if (self->_engagementScore > 2.22507386e-308) {
    objc_msgSend(v4, "encodeDouble:forKey:", @"_engagementScore");
  }
  if (self->_keywordMatchScore > 2.22507386e-308) {
    objc_msgSend(v4, "encodeDouble:forKey:", @"_keywordMatchScore");
  }
  if (self->_embeddingSimilarity > 2.22507386e-308) {
    objc_msgSend(v4, "encodeDouble:forKey:", @"_embeddingSimilarity");
  }
  if (self->_pommesL1Score > 2.22507386e-308) {
    objc_msgSend(v4, "encodeDouble:forKey:", @"_pommesL1Score");
  }
  if (self->_likelihood > 2.22507386e-308) {
    objc_msgSend(v4, "encodeDouble:forKey:", @"_likelihood");
  }
  [v4 encodeBool:self->_isMailCategoryHighImpact forKey:@"_isMailCategoryHighImpact"];
  [v4 encodeBool:self->_isMailCategoryDefault forKey:@"_isMailCategoryDefault"];
  [v4 encodeBool:self->_isMailCategoryTransactions forKey:@"_isMailCategoryTransactions"];
  [v4 encodeBool:self->_isMailCategoryUpdates forKey:@"_isMailCategoryUpdates"];
  [v4 encodeBool:self->_isMailCategoryPromotions forKey:@"_isMailCategoryPromotions"];
  [v4 encodeBool:self->_isCalendarFlightEventType forKey:@"_isCalendarFlightEventType"];
  [v4 encodeBool:self->_isCalendarHotelEventType forKey:@"_isCalendarHotelEventType"];
  [v4 encodeBool:self->_isCalendarRestaurantEventType forKey:@"_isCalendarRestaurantEventType"];
  [v4 encodeBool:self->_isCalendarOtherReservationEventType forKey:@"_isCalendarOtherReservationEventType"];
}

- (void)dealloc
{
  SSCompactRankingAttrsDealloc((char *)self->_attributes);
  attrCountsPrefix = self->_attrCountsPrefix;
  if (attrCountsPrefix) {
    free(attrCountsPrefix);
  }
  attrCountsWord = self->_attrCountsWord;
  if (attrCountsWord) {
    free(attrCountsWord);
  }
  attrCountsPrefixLast = self->_attrCountsPrefixLast;
  if (attrCountsPrefixLast) {
    free(attrCountsPrefixLast);
  }
  attrCountsPrefix2 = self->_attrCountsPrefix2;
  if (attrCountsPrefix2) {
    free(attrCountsPrefix2);
  }
  attrCountsWord2 = self->_attrCountsWord2;
  if (attrCountsWord2) {
    free(attrCountsWord2);
  }
  attrCountsPrefixLast2 = self->_attrCountsPrefixLast2;
  if (attrCountsPrefixLast2) {
    free(attrCountsPrefixLast2);
  }
  attrCountsPrefix3 = self->_attrCountsPrefix3;
  if (attrCountsPrefix3) {
    free(attrCountsPrefix3);
  }
  attrCountsWord3 = self->_attrCountsWord3;
  if (attrCountsWord3) {
    free(attrCountsWord3);
  }
  attrCountsPrefixLast3 = self->_attrCountsPrefixLast3;
  if (attrCountsPrefixLast3) {
    free(attrCountsPrefixLast3);
  }
  cachedFeatures = self->_cachedFeatures;
  if (cachedFeatures) {
    free(cachedFeatures);
  }
  v13.receiver = self;
  v13.super_class = (Class)PRSRankingItem;
  [(PRSRankingItem *)&v13 dealloc];
}

+ (unint64_t)requiredAttributesCount
{
  return sRequiredAttributesCount;
}

- (BOOL)didMatchRankingDescriptor:(id)a3
{
  id v4 = a3;
  id v5 = [(id)sRankingQueryIndexDictionary objectForKey:v4];
  unint64_t v6 = [v5 unsignedLongLongValue];

  if (v6 >= 0x81) {
    -[PRSRankingItem didMatchRankingDescriptor:]();
  }
  unint64_t v7 = *(void *)&self->_indexScore[8];
  uint64_t v8 = (2 * v7) << ~(_BYTE)v6;
  unint64_t v9 = v7 >> v6;
  if ((v6 & 0x40) != 0) {
    LOBYTE(v10) = v9;
  }
  else {
    uint64_t v10 = v8 | (*(void *)self->_indexScore >> v6);
  }

  return v10 & 1;
}

- (void)populateContactFeatures:(PRSL2FeatureScoreInfo *)a3 currentTime:(double)a4
{
  uint64_t v252 = *MEMORY[0x1E4F143B8];
  unint64_t v7 = requiredContactAttributes();
  uint64_t v8 = [v7 count];

  if (v8)
  {
    uint64_t v9 = 0;
    int v10 = 0;
    v236 = self;
    do
    {
      *(void *)&long long __dst = 0;
      *(void *)&long long v247 = 0;
      *(void *)&long long v245 = 0;
      *(void *)&long long v243 = 0;
      float v11 = SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, requiredContactAttributesIndexes_attrs[v9]);
      uint64_t v12 = v11;
      if (v11)
      {
        long long v239 = 0u;
        long long v240 = 0u;
        long long v237 = 0u;
        long long v238 = 0u;
        id v13 = v11;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v237 objects:v251 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v238;
          while (2)
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v238 != v16) {
                objc_enumerationMutation(v13);
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {

                goto LABEL_14;
              }
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v237 objects:v251 count:16];
            if (v15) {
              continue;
            }
            break;
          }
        }

        +[PRSRankingUtilities computeDateCountsForDates:v13 countLastYear:&__dst countLastMonth:&v247 countLastWeek:&v245 countLastDay:&v243 currentTime:a4];
LABEL_14:
        self = v236;
      }
      float v18 = (float)(unint64_t)__dst;
      a3->var0[a3->var2] = sContactsFeatureList[v10];
      var1 = a3->var1;
      unint64_t var2 = a3->var2;
      a3->unint64_t var2 = var2 + 1;
      var1[var2] = v18;
      float v21 = (float)(unint64_t)v247;
      a3->var0[var2 + 1] = sContactsFeatureList[v10 | 1];
      uint64_t v22 = a3->var1;
      unint64_t v23 = a3->var2;
      a3->unint64_t var2 = v23 + 1;
      v22[v23] = v21;
      LODWORD(v22) = v10 | 3;
      float v24 = (float)(unint64_t)v245;
      a3->var0[v23 + 1] = sContactsFeatureList[v10 | 2];
      unint64_t v25 = a3->var1;
      unint64_t v26 = a3->var2;
      a3->unint64_t var2 = v26 + 1;
      v25[v26] = v24;
      v10 += 4;
      float v27 = (float)(unint64_t)v243;
      a3->var0[v26 + 1] = sContactsFeatureList[v22];
      uint64_t v28 = a3->var1;
      unint64_t v29 = a3->var2;
      a3->unint64_t var2 = v29 + 1;
      v28[v29] = v27;

      ++v9;
    }
    while (v9 != v8);
  }
  long long __dst = 0u;
  long long v250 = 0u;
  if (SSCompactRankingAttrsGetArrayInt64((uint64_t)self->_attributes, 0x155uLL, &__dst, 4))
  {
    float v30 = (float)(uint64_t)__dst;
    a3->var0[a3->var2] = 307;
    uint64_t v31 = a3->var1;
    unint64_t v32 = a3->var2;
    a3->unint64_t var2 = v32 + 1;
    v31[v32] = v30;
    float v33 = v30 + (float)*((uint64_t *)&__dst + 1);
    a3->var0[v32 + 1] = 306;
    uint64_t v34 = a3->var1;
    unint64_t v35 = a3->var2;
    a3->unint64_t var2 = v35 + 1;
    v34[v35] = v33;
    float v36 = v33 + (float)(uint64_t)v250;
    a3->var0[v35 + 1] = 305;
    uint64_t v37 = a3->var1;
    unint64_t v38 = a3->var2;
    a3->unint64_t var2 = v38 + 1;
    v37[v38] = v36;
    float v39 = v36 + (float)*((uint64_t *)&v250 + 1);
    a3->var0[v38 + 1] = 304;
    uint64_t v40 = a3->var1;
    unint64_t v41 = a3->var2;
    a3->unint64_t var2 = v41 + 1;
    v40[v41] = v39;
  }
  else
  {
    a3->var0[a3->var2] = 307;
    uint64_t v42 = a3->var1;
    unint64_t v43 = a3->var2;
    a3->unint64_t var2 = v43 + 1;
    v42[v43] = 0.0;
    a3->var0[v43 + 1] = 306;
    uint64_t v44 = a3->var1;
    unint64_t v45 = a3->var2;
    a3->unint64_t var2 = v45 + 1;
    v44[v45] = 0.0;
    a3->var0[v45 + 1] = 305;
    long long v46 = a3->var1;
    unint64_t v47 = a3->var2;
    a3->unint64_t var2 = v47 + 1;
    v46[v47] = 0.0;
    a3->var0[v47 + 1] = 304;
    id v48 = a3->var1;
    unint64_t v49 = a3->var2;
    a3->unint64_t var2 = v49 + 1;
    v48[v49] = 0.0;
  }
  int ArrayInt64 = SSCompactRankingAttrsGetArrayInt64((uint64_t)self->_attributes, 0x156uLL, &__dst, 4);
  var0 = a3->var0;
  unint64_t v52 = a3->var2;
  if (ArrayInt64)
  {
    var0[v52] = 327;
    id v53 = a3->var1;
    unint64_t v54 = a3->var2;
    a3->unint64_t var2 = v54 + 1;
    v53[v54] = 1.0;
    float v55 = (float)(uint64_t)__dst;
    a3->var0[v54 + 1] = 303;
    BOOL v56 = a3->var1;
    unint64_t v57 = a3->var2;
    a3->unint64_t var2 = v57 + 1;
    v56[v57] = v55;
    float v58 = v55 + (float)*((uint64_t *)&__dst + 1);
    a3->var0[v57 + 1] = 302;
    uint64_t v59 = a3->var1;
    unint64_t v60 = a3->var2;
    a3->unint64_t var2 = v60 + 1;
    v59[v60] = v58;
    float v61 = v58 + (float)(uint64_t)v250;
    a3->var0[v60 + 1] = 301;
    long long v62 = a3->var1;
    unint64_t v63 = a3->var2;
    a3->unint64_t var2 = v63 + 1;
    v62[v63] = v61;
    float v64 = v61 + (float)*((uint64_t *)&v250 + 1);
    a3->var0[v63 + 1] = 300;
    objc_super v65 = a3->var1;
    unint64_t v66 = a3->var2;
    a3->unint64_t var2 = v66 + 1;
    v65[v66] = v64;
  }
  else
  {
    var0[v52] = 303;
    unint64_t v67 = a3->var1;
    unint64_t v68 = a3->var2;
    a3->unint64_t var2 = v68 + 1;
    v67[v68] = 0.0;
    a3->var0[v68 + 1] = 302;
    int v69 = a3->var1;
    unint64_t v70 = a3->var2;
    a3->unint64_t var2 = v70 + 1;
    v69[v70] = 0.0;
    a3->var0[v70 + 1] = 301;
    unint64_t v71 = a3->var1;
    unint64_t v72 = a3->var2;
    a3->unint64_t var2 = v72 + 1;
    v71[v72] = 0.0;
    a3->var0[v72 + 1] = 300;
    double v73 = a3->var1;
    unint64_t v74 = a3->var2;
    a3->unint64_t var2 = v74 + 1;
    v73[v74] = 0.0;
  }
  long long v247 = 0u;
  long long v248 = 0u;
  if (SSCompactRankingAttrsGetArrayInt64((uint64_t)self->_attributes, 0x16EuLL, &v247, 4))
  {
    float v75 = (float)(uint64_t)v247;
    a3->var0[a3->var2] = 1990;
    unint64_t v76 = a3->var1;
    unint64_t v77 = a3->var2;
    a3->unint64_t var2 = v77 + 1;
    v76[v77] = v75;
    float v78 = v75 + (float)*((uint64_t *)&v247 + 1);
    a3->var0[v77 + 1] = 1989;
    uint64_t v79 = a3->var1;
    unint64_t v80 = a3->var2;
    a3->unint64_t var2 = v80 + 1;
    v79[v80] = v78;
    float v81 = v78 + (float)(uint64_t)v248;
    a3->var0[v80 + 1] = 1988;
    id v82 = a3->var1;
    unint64_t v83 = a3->var2;
    a3->unint64_t var2 = v83 + 1;
    v82[v83] = v81;
    float v84 = v81 + (float)*((uint64_t *)&v248 + 1);
    a3->var0[v83 + 1] = 1987;
    unint64_t v85 = a3->var1;
    unint64_t v86 = a3->var2;
    a3->unint64_t var2 = v86 + 1;
    v85[v86] = v84;
  }
  else
  {
    a3->var0[a3->var2] = 1990;
    uint64_t v87 = a3->var1;
    unint64_t v88 = a3->var2;
    a3->unint64_t var2 = v88 + 1;
    v87[v88] = 0.0;
    a3->var0[v88 + 1] = 1989;
    unint64_t v89 = a3->var1;
    unint64_t v90 = a3->var2;
    a3->unint64_t var2 = v90 + 1;
    v89[v90] = 0.0;
    a3->var0[v90 + 1] = 1988;
    unint64_t v91 = a3->var1;
    unint64_t v92 = a3->var2;
    a3->unint64_t var2 = v92 + 1;
    v91[v92] = 0.0;
    a3->var0[v92 + 1] = 1987;
    unint64_t v93 = a3->var1;
    unint64_t v94 = a3->var2;
    a3->unint64_t var2 = v94 + 1;
    v93[v94] = 0.0;
  }
  SSCompactRankingAttrsGetArrayInt64((uint64_t)self->_attributes, 0x16FuLL, &v247, 4);
  if (ArrayInt64)
  {
    float v95 = (float)(uint64_t)v247;
    a3->var0[a3->var2] = 1986;
    uint64_t v96 = a3->var1;
    unint64_t v97 = a3->var2;
    a3->unint64_t var2 = v97 + 1;
    v96[v97] = v95;
    float v98 = v95 + (float)*((uint64_t *)&v247 + 1);
    a3->var0[v97 + 1] = 1985;
    unint64_t v99 = a3->var1;
    unint64_t v100 = a3->var2;
    a3->unint64_t var2 = v100 + 1;
    v99[v100] = v98;
    float v101 = v98 + (float)(uint64_t)v248;
    a3->var0[v100 + 1] = 1984;
    uint64_t v102 = a3->var1;
    unint64_t v103 = a3->var2;
    a3->unint64_t var2 = v103 + 1;
    v102[v103] = v101;
    float v104 = v101 + (float)*((uint64_t *)&v248 + 1);
    a3->var0[v103 + 1] = 1983;
    long long v105 = a3->var1;
    unint64_t v106 = a3->var2;
    a3->unint64_t var2 = v106 + 1;
    v105[v106] = v104;
  }
  else
  {
    a3->var0[a3->var2] = 1986;
    uint64_t v107 = a3->var1;
    unint64_t v108 = a3->var2;
    a3->unint64_t var2 = v108 + 1;
    v107[v108] = 0.0;
    a3->var0[v108 + 1] = 1985;
    uint64_t v109 = a3->var1;
    unint64_t v110 = a3->var2;
    a3->unint64_t var2 = v110 + 1;
    v109[v110] = 0.0;
    a3->var0[v110 + 1] = 1984;
    long long v111 = a3->var1;
    unint64_t v112 = a3->var2;
    a3->unint64_t var2 = v112 + 1;
    v111[v112] = 0.0;
    a3->var0[v112 + 1] = 1983;
    v113 = a3->var1;
    unint64_t v114 = a3->var2;
    a3->unint64_t var2 = v114 + 1;
    v113[v114] = 0.0;
  }
  long long v245 = 0u;
  long long v246 = 0u;
  if (SSCompactRankingAttrsGetArrayInt64((uint64_t)self->_attributes, 0x170uLL, &v245, 4))
  {
    float v115 = (float)(uint64_t)v245;
    a3->var0[a3->var2] = 1998;
    v116 = a3->var1;
    unint64_t v117 = a3->var2;
    a3->unint64_t var2 = v117 + 1;
    v116[v117] = v115;
    float v118 = v115 + (float)*((uint64_t *)&v245 + 1);
    a3->var0[v117 + 1] = 1997;
    v119 = a3->var1;
    unint64_t v120 = a3->var2;
    a3->unint64_t var2 = v120 + 1;
    v119[v120] = v118;
    float v121 = v118 + (float)(uint64_t)v246;
    a3->var0[v120 + 1] = 1996;
    v122 = a3->var1;
    unint64_t v123 = a3->var2;
    a3->unint64_t var2 = v123 + 1;
    v122[v123] = v121;
    float v124 = v121 + (float)*((uint64_t *)&v246 + 1);
    a3->var0[v123 + 1] = 1995;
    v125 = a3->var1;
    unint64_t v126 = a3->var2;
    a3->unint64_t var2 = v126 + 1;
    v125[v126] = v124;
  }
  else
  {
    a3->var0[a3->var2] = 1998;
    v127 = a3->var1;
    unint64_t v128 = a3->var2;
    a3->unint64_t var2 = v128 + 1;
    v127[v128] = 0.0;
    a3->var0[v128 + 1] = 1997;
    v129 = a3->var1;
    unint64_t v130 = a3->var2;
    a3->unint64_t var2 = v130 + 1;
    v129[v130] = 0.0;
    a3->var0[v130 + 1] = 1996;
    v131 = a3->var1;
    unint64_t v132 = a3->var2;
    a3->unint64_t var2 = v132 + 1;
    v131[v132] = 0.0;
    a3->var0[v132 + 1] = 1995;
    v133 = a3->var1;
    unint64_t v134 = a3->var2;
    a3->unint64_t var2 = v134 + 1;
    v133[v134] = 0.0;
  }
  SSCompactRankingAttrsGetArrayInt64((uint64_t)self->_attributes, 0x171uLL, &v245, 4);
  if (ArrayInt64)
  {
    float v135 = (float)(uint64_t)v245;
    a3->var0[a3->var2] = 1994;
    v136 = a3->var1;
    unint64_t v137 = a3->var2;
    a3->unint64_t var2 = v137 + 1;
    v136[v137] = v135;
    float v138 = v135 + (float)*((uint64_t *)&v245 + 1);
    a3->var0[v137 + 1] = 1993;
    v139 = a3->var1;
    unint64_t v140 = a3->var2;
    a3->unint64_t var2 = v140 + 1;
    v139[v140] = v138;
    float v141 = v138 + (float)(uint64_t)v246;
    a3->var0[v140 + 1] = 1992;
    v142 = a3->var1;
    unint64_t v143 = a3->var2;
    a3->unint64_t var2 = v143 + 1;
    v142[v143] = v141;
    float v144 = v141 + (float)*((uint64_t *)&v246 + 1);
    a3->var0[v143 + 1] = 1991;
    v145 = a3->var1;
    unint64_t v146 = a3->var2;
    a3->unint64_t var2 = v146 + 1;
    v145[v146] = v144;
  }
  else
  {
    a3->var0[a3->var2] = 1994;
    v147 = a3->var1;
    unint64_t v148 = a3->var2;
    a3->unint64_t var2 = v148 + 1;
    v147[v148] = 0.0;
    a3->var0[v148 + 1] = 1993;
    v149 = a3->var1;
    unint64_t v150 = a3->var2;
    a3->unint64_t var2 = v150 + 1;
    v149[v150] = 0.0;
    a3->var0[v150 + 1] = 1992;
    v151 = a3->var1;
    unint64_t v152 = a3->var2;
    a3->unint64_t var2 = v152 + 1;
    v151[v152] = 0.0;
    a3->var0[v152 + 1] = 1991;
    v153 = a3->var1;
    unint64_t v154 = a3->var2;
    a3->unint64_t var2 = v154 + 1;
    v153[v154] = 0.0;
  }
  long long v243 = 0u;
  long long v244 = 0u;
  if (SSCompactRankingAttrsGetArrayInt64((uint64_t)self->_attributes, 0x172uLL, &v243, 4))
  {
    float v155 = (float)(uint64_t)v243;
    a3->var0[a3->var2] = 2006;
    v156 = a3->var1;
    unint64_t v157 = a3->var2;
    a3->unint64_t var2 = v157 + 1;
    v156[v157] = v155;
    float v158 = v155 + (float)*((uint64_t *)&v243 + 1);
    a3->var0[v157 + 1] = 2005;
    v159 = a3->var1;
    unint64_t v160 = a3->var2;
    a3->unint64_t var2 = v160 + 1;
    v159[v160] = v158;
    float v161 = v158 + (float)(uint64_t)v244;
    a3->var0[v160 + 1] = 2004;
    v162 = a3->var1;
    unint64_t v163 = a3->var2;
    a3->unint64_t var2 = v163 + 1;
    v162[v163] = v161;
    float v164 = v161 + (float)*((uint64_t *)&v244 + 1);
    a3->var0[v163 + 1] = 2003;
    v165 = a3->var1;
    unint64_t v166 = a3->var2;
    a3->unint64_t var2 = v166 + 1;
    v165[v166] = v164;
  }
  else
  {
    a3->var0[a3->var2] = 2006;
    v167 = a3->var1;
    unint64_t v168 = a3->var2;
    a3->unint64_t var2 = v168 + 1;
    v167[v168] = 0.0;
    a3->var0[v168 + 1] = 2005;
    v169 = a3->var1;
    unint64_t v170 = a3->var2;
    a3->unint64_t var2 = v170 + 1;
    v169[v170] = 0.0;
    a3->var0[v170 + 1] = 2004;
    v171 = a3->var1;
    unint64_t v172 = a3->var2;
    a3->unint64_t var2 = v172 + 1;
    v171[v172] = 0.0;
    a3->var0[v172 + 1] = 2003;
    v173 = a3->var1;
    unint64_t v174 = a3->var2;
    a3->unint64_t var2 = v174 + 1;
    v173[v174] = 0.0;
  }
  SSCompactRankingAttrsGetArrayInt64((uint64_t)self->_attributes, 0x173uLL, &v245, 4);
  if (ArrayInt64)
  {
    float v175 = (float)(uint64_t)v243;
    a3->var0[a3->var2] = 2002;
    v176 = a3->var1;
    unint64_t v177 = a3->var2;
    a3->unint64_t var2 = v177 + 1;
    v176[v177] = v175;
    float v178 = v175 + (float)*((uint64_t *)&v243 + 1);
    a3->var0[v177 + 1] = 2001;
    v179 = a3->var1;
    unint64_t v180 = a3->var2;
    a3->unint64_t var2 = v180 + 1;
    v179[v180] = v178;
    float v181 = v178 + (float)(uint64_t)v244;
    a3->var0[v180 + 1] = 2000;
    v182 = a3->var1;
    unint64_t v183 = a3->var2;
    a3->unint64_t var2 = v183 + 1;
    v182[v183] = v181;
    float v184 = v181 + (float)*((uint64_t *)&v244 + 1);
    a3->var0[v183 + 1] = 1999;
    v185 = a3->var1;
    unint64_t v186 = a3->var2;
    a3->unint64_t var2 = v186 + 1;
    v185[v186] = v184;
  }
  else
  {
    a3->var0[a3->var2] = 2002;
    v187 = a3->var1;
    unint64_t v188 = a3->var2;
    a3->unint64_t var2 = v188 + 1;
    v187[v188] = 0.0;
    a3->var0[v188 + 1] = 2001;
    v189 = a3->var1;
    unint64_t v190 = a3->var2;
    a3->unint64_t var2 = v190 + 1;
    v189[v190] = 0.0;
    a3->var0[v190 + 1] = 2000;
    v191 = a3->var1;
    unint64_t v192 = a3->var2;
    a3->unint64_t var2 = v192 + 1;
    v191[v192] = 0.0;
    a3->var0[v192 + 1] = 1999;
    v193 = a3->var1;
    unint64_t v194 = a3->var2;
    a3->unint64_t var2 = v194 + 1;
    v193[v194] = 0.0;
  }
  long long v241 = 0u;
  long long v242 = 0u;
  if (SSCompactRankingAttrsGetArrayInt64((uint64_t)self->_attributes, 0x174uLL, &v241, 4))
  {
    float v195 = (float)(uint64_t)v241;
    a3->var0[a3->var2] = 2014;
    v196 = a3->var1;
    unint64_t v197 = a3->var2;
    a3->unint64_t var2 = v197 + 1;
    v196[v197] = v195;
    float v198 = v195 + (float)*((uint64_t *)&v241 + 1);
    a3->var0[v197 + 1] = 2013;
    v199 = a3->var1;
    unint64_t v200 = a3->var2;
    a3->unint64_t var2 = v200 + 1;
    v199[v200] = v198;
    float v201 = v198 + (float)(uint64_t)v242;
    a3->var0[v200 + 1] = 2012;
    v202 = a3->var1;
    unint64_t v203 = a3->var2;
    a3->unint64_t var2 = v203 + 1;
    v202[v203] = v201;
    float v204 = v201 + (float)*((uint64_t *)&v242 + 1);
    a3->var0[v203 + 1] = 2011;
    v205 = a3->var1;
    unint64_t v206 = a3->var2;
    a3->unint64_t var2 = v206 + 1;
    v205[v206] = v204;
  }
  else
  {
    a3->var0[a3->var2] = 2014;
    v207 = a3->var1;
    unint64_t v208 = a3->var2;
    a3->unint64_t var2 = v208 + 1;
    v207[v208] = 0.0;
    a3->var0[v208 + 1] = 2013;
    v209 = a3->var1;
    unint64_t v210 = a3->var2;
    a3->unint64_t var2 = v210 + 1;
    v209[v210] = 0.0;
    a3->var0[v210 + 1] = 2012;
    v211 = a3->var1;
    unint64_t v212 = a3->var2;
    a3->unint64_t var2 = v212 + 1;
    v211[v212] = 0.0;
    a3->var0[v212 + 1] = 2011;
    v213 = a3->var1;
    unint64_t v214 = a3->var2;
    a3->unint64_t var2 = v214 + 1;
    v213[v214] = 0.0;
  }
  SSCompactRankingAttrsGetArrayInt64((uint64_t)self->_attributes, 0x175uLL, &v245, 4);
  if (ArrayInt64)
  {
    float v215 = (float)(uint64_t)v241;
    a3->var0[a3->var2] = 2010;
    v216 = a3->var1;
    unint64_t v217 = a3->var2;
    a3->unint64_t var2 = v217 + 1;
    v216[v217] = v215;
    float v218 = v215 + (float)*((uint64_t *)&v241 + 1);
    a3->var0[v217 + 1] = 2009;
    v219 = a3->var1;
    unint64_t v220 = a3->var2;
    a3->unint64_t var2 = v220 + 1;
    v219[v220] = v218;
    float v221 = v218 + (float)(uint64_t)v242;
    a3->var0[v220 + 1] = 2008;
    v222 = a3->var1;
    unint64_t v223 = a3->var2;
    a3->unint64_t var2 = v223 + 1;
    v222[v223] = v221;
    float v224 = v221 + (float)*((uint64_t *)&v242 + 1);
    a3->var0[v223 + 1] = 2007;
    v225 = a3->var1;
    unint64_t v226 = a3->var2;
    a3->unint64_t var2 = v226 + 1;
    v225[v226] = v224;
  }
  else
  {
    a3->var0[a3->var2] = 2010;
    v227 = a3->var1;
    unint64_t v228 = a3->var2;
    a3->unint64_t var2 = v228 + 1;
    v227[v228] = 0.0;
    a3->var0[v228 + 1] = 2009;
    v229 = a3->var1;
    unint64_t v230 = a3->var2;
    a3->unint64_t var2 = v230 + 1;
    v229[v230] = 0.0;
    a3->var0[v230 + 1] = 2008;
    v231 = a3->var1;
    unint64_t v232 = a3->var2;
    a3->unint64_t var2 = v232 + 1;
    v231[v232] = 0.0;
    a3->var0[v232 + 1] = 2007;
    v233 = a3->var1;
    unint64_t v234 = a3->var2;
    a3->unint64_t var2 = v234 + 1;
    v233[v234] = 0.0;
  }
  v235 = SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x28uLL);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_storeStrong((id *)&self->_emailAddresses, v235);
  }
}

- (void)populateParsecAlbumFeatures:(PRSL2FeatureScoreInfo *)a3 currentTime:(double)a4 forParsecResult:(id)a5
{
  id v7 = a5;
  objc_msgSend(v7, "PRSRankingItemAdditions_albumStarRating");
  a3->var0[a3->var2] = 2298;
  unint64_t var2 = a3->var2;
  var0 = a3->var0;
  a3->var1[var2++] = v10;
  a3->unint64_t var2 = var2;
  var0[var2] = 2297;
  var1 = a3->var1;
  unint64_t v12 = a3->var2;
  a3->unint64_t var2 = v12 + 1;
  var1[v12] = v10;
  objc_msgSend(v7, "PRSRankingItemAdditions_albumNumYearsAgo:", a4);
  LODWORD(a4) = v13;

  a3->var0[a3->var2] = 2309;
  unint64_t v14 = a3->var2;
  uint64_t v15 = a3->var0;
  a3->var1[v14++] = *(float *)&a4;
  a3->unint64_t var2 = v14;
  v15[v14] = 2308;
  uint64_t v16 = a3->var1;
  unint64_t v17 = a3->var2;
  a3->unint64_t var2 = v17 + 1;
  v16[v17] = *(float *)&a4;
}

- (void)populateParsecSongFeatures:(PRSL2FeatureScoreInfo *)a3 currentTime:(double)a4 forParsecResult:(id)a5
{
  objc_msgSend(a5, "PRSRankingItemAdditions_songNumYearsAgo:", a4);
  a3->var0[a3->var2] = 2311;
  unint64_t var2 = a3->var2;
  var0 = a3->var0;
  a3->var1[var2++] = v8;
  a3->unint64_t var2 = var2;
  var0[var2] = 2308;
  var1 = a3->var1;
  unint64_t v10 = a3->var2;
  a3->unint64_t var2 = v10 + 1;
  var1[v10] = v8;
}

- (void)populateParsecAppFeatures:(PRSL2FeatureScoreInfo *)a3 currentTime:(double)a4 forParsecResult:(id)a5
{
  id v6 = a5;
  objc_msgSend(v6, "PRSRankingItemAdditions_appNumReviews");
  float v8 = v7;
  a3->var0[a3->var2] = 2304;
  var1 = a3->var1;
  unint64_t var2 = a3->var2;
  a3->unint64_t var2 = var2 + 1;
  var1[var2] = v7;
  objc_msgSend(v6, "PRSRankingItemAdditions_appStarRating");
  float v12 = v11;

  a3->var0[a3->var2] = 2299;
  unint64_t v13 = a3->var2;
  var0 = a3->var0;
  a3->var1[v13++] = v12;
  a3->unint64_t var2 = v13;
  var0[v13] = 2297;
  unint64_t v15 = a3->var2;
  uint64_t v16 = a3->var0;
  a3->var1[v15++] = v12;
  a3->unint64_t var2 = v15;
  v16[v15] = 2303;
  unint64_t v17 = a3->var1;
  unint64_t v18 = a3->var2;
  a3->unint64_t var2 = v18 + 1;
  v17[v18] = v8;
}

- (void)populateParsecPodcastFeatures:(PRSL2FeatureScoreInfo *)a3 currentTime:(double)a4 forParsecResult:(id)a5
{
  objc_msgSend(a5, "PRSRankingItemAdditions_podcastStarRating", a4);
  a3->var0[a3->var2] = 2301;
  unint64_t var2 = a3->var2;
  var0 = a3->var0;
  a3->var1[var2++] = v8;
  a3->unint64_t var2 = var2;
  var0[var2] = 2297;
  var1 = a3->var1;
  unint64_t v10 = a3->var2;
  a3->unint64_t var2 = v10 + 1;
  var1[v10] = v8;
}

- (void)populateParsecMovieFeatures:(PRSL2FeatureScoreInfo *)a3 currentTime:(double)a4 forParsecResult:(id)a5
{
  id v7 = a5;
  objc_msgSend(v7, "PRSRankingItemAdditions_movieReviewRating");
  a3->var0[a3->var2] = 2302;
  var1 = a3->var1;
  unint64_t var2 = a3->var2;
  a3->unint64_t var2 = var2 + 1;
  var1[var2] = v10;
  objc_msgSend(v7, "PRSRankingItemAdditions_movieStarRating");
  a3->var0[a3->var2] = 2297;
  float v11 = a3->var1;
  unint64_t v12 = a3->var2;
  a3->unint64_t var2 = v12 + 1;
  v11[v12] = v13;
  objc_msgSend(v7, "PRSRankingItemAdditions_movieNumYearsAgo:", a4);
  LODWORD(a4) = v14;

  a3->var0[a3->var2] = 2310;
  unint64_t v15 = a3->var2;
  var0 = a3->var0;
  a3->var1[v15++] = *(float *)&a4;
  a3->unint64_t var2 = v15;
  var0[v15] = 2308;
  unint64_t v17 = a3->var1;
  unint64_t v18 = a3->var2;
  a3->unint64_t var2 = v18 + 1;
  v17[v18] = *(float *)&a4;
}

- (void)populateParsecEPubBookFeatures:(PRSL2FeatureScoreInfo *)a3 currentTime:(double)a4 forParsecResult:(id)a5
{
  id v7 = a5;
  objc_msgSend(v7, "PRSRankingItemAdditions_epubBookNumYearsAgo:", a4);
  a3->var0[a3->var2] = 2314;
  unint64_t var2 = a3->var2;
  var0 = a3->var0;
  a3->var1[var2++] = v10;
  a3->unint64_t var2 = var2;
  var0[var2] = 2308;
  var1 = a3->var1;
  unint64_t v12 = a3->var2;
  a3->unint64_t var2 = v12 + 1;
  var1[v12] = v10;
  objc_msgSend(v7, "PRSRankingItemAdditions_epubBookStarRating");
  *(float *)&a4 = v13;
  a3->var0[a3->var2] = 2300;
  int v14 = a3->var1;
  unint64_t v15 = a3->var2;
  a3->unint64_t var2 = v15 + 1;
  v14[v15] = v13;
  objc_msgSend(v7, "PRSRankingItemAdditions_epubBookNumReviews");
  float v17 = v16;

  a3->var0[a3->var2] = 2305;
  unint64_t v18 = a3->var2;
  unint64_t v19 = a3->var0;
  a3->var1[v18++] = v17;
  a3->unint64_t var2 = v18;
  v19[v18] = 2297;
  unint64_t v20 = a3->var2;
  float v21 = a3->var0;
  a3->var1[v20++] = *(float *)&a4;
  a3->unint64_t var2 = v20;
  v21[v20] = 2303;
  uint64_t v22 = a3->var1;
  unint64_t v23 = a3->var2;
  a3->unint64_t var2 = v23 + 1;
  v22[v23] = v17;
}

- (void)populateParsecProfileFeatures:(PRSL2FeatureScoreInfo *)a3 currentTime:(double)a4 forParsecResult:(id)a5
{
  objc_msgSend(a5, "PRSRankingItemAdditions_profileNumFollowers", a4);
  a3->var0[a3->var2] = 2306;
  unint64_t var2 = a3->var2;
  var0 = a3->var0;
  a3->var1[var2++] = v8;
  a3->unint64_t var2 = var2;
  var0[var2] = 2303;
  var1 = a3->var1;
  unint64_t v10 = a3->var2;
  a3->unint64_t var2 = v10 + 1;
  var1[v10] = v8;
}

- (void)populateParsecTvShowFeatures:(PRSL2FeatureScoreInfo *)a3 currentTime:(double)a4 forParsecResult:(id)a5
{
  objc_msgSend(a5, "PRSRankingItemAdditions_tvshowNumYearsAgo:", a4);
  a3->var0[a3->var2] = 2312;
  unint64_t var2 = a3->var2;
  var0 = a3->var0;
  a3->var1[var2++] = v8;
  a3->unint64_t var2 = var2;
  var0[var2] = 2308;
  var1 = a3->var1;
  unint64_t v10 = a3->var2;
  a3->unint64_t var2 = v10 + 1;
  var1[v10] = v8;
}

- (void)populateParsecWebVideoFeatures:(PRSL2FeatureScoreInfo *)a3 currentTime:(double)a4 forParsecResult:(id)a5
{
  id v7 = a5;
  objc_msgSend(v7, "PRSRankingItemAdditions_webVideoNumViews");
  a3->var0[a3->var2] = 2307;
  unint64_t var2 = a3->var2;
  var0 = a3->var0;
  a3->var1[var2++] = v10;
  a3->unint64_t var2 = var2;
  var0[var2] = 2303;
  var1 = a3->var1;
  unint64_t v12 = a3->var2;
  a3->unint64_t var2 = v12 + 1;
  var1[v12] = v10;
  objc_msgSend(v7, "PRSRankingItemAdditions_webVideoNumYearsAgo:", a4);
  LODWORD(a4) = v13;

  a3->var0[a3->var2] = 2313;
  unint64_t v14 = a3->var2;
  unint64_t v15 = a3->var0;
  a3->var1[v14++] = *(float *)&a4;
  a3->unint64_t var2 = v14;
  v15[v14] = 2308;
  float v16 = a3->var1;
  unint64_t v17 = a3->var2;
  a3->unint64_t var2 = v17 + 1;
  v16[v17] = *(float *)&a4;
}

- (void)populateParsecAnyFeatures:(PRSL2FeatureScoreInfo *)a3 currentTime:(double)a4 forParsecResult:(id)a5
{
  id v6 = a5;
  objc_msgSend(v6, "PRSRankingItemAdditions_anyTophitMustBe");
  a3->var0[a3->var2] = 2315;
  var1 = a3->var1;
  unint64_t var2 = a3->var2;
  a3->unint64_t var2 = var2 + 1;
  var1[var2] = v9;
  objc_msgSend(v6, "PRSRankingItemAdditions_anyTophitNo");
  float v11 = v10;

  a3->var0[a3->var2] = 2316;
  unint64_t v12 = a3->var1;
  unint64_t v13 = a3->var2;
  a3->unint64_t var2 = v13 + 1;
  v12[v13] = v11;
}

- (void)updateNumScoreDescriptorBundleFeatures:(float *)a3 feature:(unint64_t)a4 featureScoreInfo:(PRSL2FeatureScoreInfo *)a5
{
  if (updateNumScoreDescriptorBundleFeatures_feature_featureScoreInfo__onceToken != -1) {
    dispatch_once(&updateNumScoreDescriptorBundleFeatures_feature_featureScoreInfo__onceToken, &__block_literal_global_271);
  }
  unint64_t v9 = a4 - 36;
  if (a4 - 36 >= 8 || ((0x9Fu >> v9) & 1) == 0) {
    -[PRSRankingItem updateNumScoreDescriptorBundleFeatures:feature:featureScoreInfo:]();
  }
  uint64_t v10 = 0;
  unsigned __int16 v11 = word_1BDC5DC80[v9];
  unint64_t v12 = off_1E635A670[v9];
  uint64_t v13 = *v12;
  unint64_t v14 = *(void *)&self->_indexScore[8] & v12[1];
  unint64_t v15 = *(void *)self->_indexScore & v13;
  float v16 = 0.0;
  do
  {
    uint64_t v17 = ((2 * v14) << ~(_BYTE)v10) | (v15 >> v10);
    if ((v10 & 0x40) != 0) {
      uint64_t v17 = v14 >> v10;
    }
    if (v17) {
      float v16 = v16 + 1.0;
    }
    ++v10;
  }
  while (v10 != 128);
  a5->var0[a5->var2] = v11;
  var1 = a5->var1;
  unint64_t var2 = a5->var2;
  a5->unint64_t var2 = var2 + 1;
  var1[var2] = v16;
  if (off_1F1823808(a3[a4], v16)) {
    a3[a4] = v16;
  }
}

void __82__PRSRankingItem_updateNumScoreDescriptorBundleFeatures_feature_featureScoreInfo___block_invoke()
{
  v11[8] = *MEMORY[0x1E4F143B8];
  v11[0] = @"kMDItemAuthorsOrRecipientsTokenizedPrefixMatch";
  v11[1] = @"kMDItemDescriptionTokenizedPrefixMatch";
  void v11[2] = @"kMDItemAlbumTokenizedPrefixMatch";
  v11[3] = @"kMDItemComposerTokenizedPrefixMatch";
  v11[4] = @"kMDItemDisplayNameOrSubjectOrTitleTokenizedPrefixMatch";
  v11[5] = @"kMDItemArtistPrefixTokenized";
  v11[6] = @"kMDItemAuthorsPrefixTokenized";
  v11[7] = @"kMDItemRecipientsPrefixTokenized";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:8];
  updateNumScoreDescriptorBundleFeatures_feature_featureScoreInfo__prefixTokenizedMatchMasuint64_t k = maskFromRankingDescriptors(v0);
  *(void *)algn_1EBA21A18 = 0;

  v10[0] = @"kMDItemLastSpaceAndTotalMatchAndDisplayNameOrSubjectOrTitleWordMatch";
  v10[1] = @"kMDItemAlbumPrefixWordMatch";
  void v10[2] = @"kMDItemComposerPrefixWordMatch";
  v10[3] = @"kMDItemDescriptionPrefixWordMatch";
  v10[4] = @"kMDItemAuthorsOrRecipientsNonTokenizedPrefixMatch";
  v10[5] = @"kMDItemArtistPrefixWord";
  v10[6] = @"kMDItemAuthorsPrefixWord";
  v10[7] = @"kMDItemRecipientsPrefixWord";
  v10[8] = @"kMDItemDisplayNamePrefixWord";
  v10[9] = @"kMDItemSubjectPrefixWord";
  v10[10] = @"kMDItemTitlePrefixWord";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:11];
  updateNumScoreDescriptorBundleFeatures_feature_featureScoreInfo__prefixWordMatchMasuint64_t k = maskFromRankingDescriptors(v1);
  *(void *)algn_1EBA21A28 = 0;

  v9[0] = @"kMDItemAuthorsOrRecipientsExactMatch";
  v9[1] = @"kMDItemDescriptionNonTokenizedWordMatch";
  v9[2] = @"kMDItemAlbumNonTokenizedWordMatch";
  v9[3] = @"kMDItemComposerNonTokenizedWordMatch";
  v9[4] = @"kMDItemAlternateNameNonTokenizedWordMatch";
  v9[5] = @"kMDItemDisplayNameOrSubjectOrTitleNonTokenizedWordMatch";
  v9[6] = @"kMDItemNamedLocationExactWord";
  v9[7] = @"kMDItemArtistExactWord";
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:8];
  updateNumScoreDescriptorBundleFeatures_feature_featureScoreInfo__wordMatchMasuint64_t k = maskFromRankingDescriptors(v2);
  *(void *)algn_1EBA21A48 = 0;

  v8[0] = @"kMDItemAuthorsOrRecipientsPrefixWordMatch";
  v8[1] = @"kMDItemDescriptionExactPrefixMatch";
  v8[2] = @"kMDItemAlbumNonTokenizedPrefixMatch";
  v8[3] = @"kMDItemComposerNonTokenizedPrefixMatch";
  v8[4] = @"kMDItemAlternateNamePrefixWordMatch";
  v8[5] = @"kMDItemDisplayNameOrSubjectOrTitleNonTokenizedPrefixMatch";
  v8[6] = @"kMDItemNamedLocationExactPrefix";
  v8[7] = @"kMDItemArtistExactPrefix";
  v8[8] = @"kMDItemAuthorsExactPrefix";
  v8[9] = @"kMDItemRecipientsExactPrefix";
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:10];
  updateNumScoreDescriptorBundleFeatures_feature_featureScoreInfo__exactPrefixMatchMasuint64_t k = maskFromRankingDescriptors(v3);
  *(void *)algn_1EBA219F8 = 0;

  v7[0] = @"kMDItemAlternateNameExactMatch";
  v7[1] = @"kMDItemDisplayNameOrSubjectOrTitleExactMatch";
  v7[2] = @"kMDItemNamedLocationExact";
  v7[3] = @"kMDItemAuthorsExact";
  v7[4] = @"kMDItemRecipientsExact";
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:5];
  updateNumScoreDescriptorBundleFeatures_feature_featureScoreInfo__exactMatchMasuint64_t k = maskFromRankingDescriptors(v4);
  *(void *)algn_1EBA219E8 = 0;

  id v6 = @"kMDItemTextContentTokenizedMatch";
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v6 count:1];
  updateNumScoreDescriptorBundleFeatures_feature_featureScoreInfo__textContentMatchMasuint64_t k = maskFromRankingDescriptors(v5);
  *(void *)algn_1EBA21A38 = 0;
}

+ (id)rankingDescriptorForBundleFeature:(unint64_t)a3
{
  unint64_t v3 = a3 - 24;
  if (a3 - 24 >= 0x17 || ((0x6601FFu >> v3) & 1) == 0) {
    +[PRSRankingItem rankingDescriptorForBundleFeature:]();
  }
  id v4 = *off_1E635A6B0[v3];
  return v4;
}

- (void)updateScoreDescriptorBundleFeatures:(float *)a3 feature:(unint64_t)a4
{
  if (a3[a4] == 0.0)
  {
    uint64_t v13 = +[PRSRankingItem rankingDescriptorForBundleFeature:a4];
    unint64_t v7 = *(void *)&self->_indexScore[8];
    unint64_t v8 = *(void *)self->_indexScore;
    unint64_t v9 = [(id)sRankingQueryIndexDictionary objectForKeyedSubscript:v13];
    char v10 = [v9 unsignedIntegerValue];

    uint64_t v11 = ((2 * v7) << ~v10) | (v8 >> v10);
    if ((v10 & 0x40) != 0) {
      uint64_t v11 = v7 >> v10;
    }
    if (v11)
    {
      a3[a4] = 1.0;
      BOOL v12 = v13 == @"kMDItemShortcutRecent" || v13 == @"kMDItemShortcutWithinBagParamValue";
      if (v12 && ![(PRSRankingItem *)self hasShortCut]) {
        a3[a4] = 0.0;
      }
    }
    MEMORY[0x1F41817F8]();
  }
}

- (void)updateAccumulatedBundleFeatures:(float *)a3 values:(float *)a4 feature:(unint64_t)a5
{
  unint64_t v5 = a5 - 1;
  if (a5 - 1 >= 0x16) {
    -[PRSRankingItem updateAccumulatedBundleFeatures:values:feature:]();
  }
  unint64_t v9 = off_1E635A818[v5];
  uint64_t v13 = (double (**)(id, float *))MEMORY[0x1C1885400](*off_1E635A768[v5], a2);
  char v10 = (unsigned int (**)(void, float, float))MEMORY[0x1C1885400](*v9);
  double v11 = v13[2](v13, a4);
  float v12 = *(float *)&v11;
  if (v10[2](v10, a3[a5], *(float *)&v11)) {
    a3[a5] = v12;
  }
}

- (void)updateBundleFeatures:(float *)a3 withArrValues:(float *)(a4 featureScoreInfo:
{
  uint64_t v9 = 0;
  uint64_t v10 = sRequiredAttributesCount;
  do
  {
    switch(v9)
    {
      case 0:
      case 33:
      case 34:
      case 35:
      case 44:
        break;
      case 1:
      case 2:
      case 3:
      case 4:
      case 5:
      case 6:
      case 7:
      case 8:
      case 9:
      case 10:
      case 11:
      case 12:
      case 13:
      case 14:
      case 15:
      case 16:
      case 17:
      case 18:
      case 19:
      case 20:
      case 21:
      case 22:
        [(PRSRankingItem *)self updateAccumulatedBundleFeatures:a3 values:(char *)a4 + 4 * v9 * v10 feature:v9];
        break;
      case 23:
        if (updateBundleFeatures_withArrValues_featureScoreInfo__onceToken != -1) {
          dispatch_once(&updateBundleFeatures_withArrValues_featureScoreInfo__onceToken, &__block_literal_global_273);
        }
        uint64_t v11 = 0;
        unint64_t v12 = *(void *)algn_1EBA219C8 & *(void *)&self->_indexScore[8];
        float v13 = 0.0;
        do
        {
          unint64_t v14 = ((2 * v12) << ~(_BYTE)v11) | (((unint64_t)updateBundleFeatures_withArrValues_featureScoreInfo__exactMask & *(void *)self->_indexScore) >> v11);
          if ((v11 & 0x40) != 0) {
            unint64_t v14 = v12 >> v11;
          }
          if (v14) {
            float v13 = v13 + 1.0;
          }
          ++v11;
        }
        while (v11 != 128);
        if (off_1F1823808(a3[23], v13)) {
          a3[23] = v13;
        }
        break;
      case 24:
      case 25:
      case 26:
      case 27:
      case 28:
      case 29:
      case 30:
      case 31:
      case 32:
      case 41:
      case 42:
      case 45:
        [(PRSRankingItem *)self updateScoreDescriptorBundleFeatures:a3 feature:v9];
        break;
      case 36:
      case 37:
      case 38:
      case 39:
      case 40:
      case 43:
        [(PRSRankingItem *)self updateNumScoreDescriptorBundleFeatures:a3 feature:v9 featureScoreInfo:a5];
        break;
      default:
        -[PRSRankingItem updateBundleFeatures:withArrValues:featureScoreInfo:]();
    }
    ++v9;
  }
  while (v9 != 46);
}

void __70__PRSRankingItem_updateBundleFeatures_withArrValues_featureScoreInfo___block_invoke()
{
  void v14[8] = *MEMORY[0x1E4F143B8];
  v14[0] = @"kMDItemAuthorsExact";
  v14[1] = @"kMDItemRecipientsExact";
  v14[2] = @"kMDItemArtistExactWord";
  v14[3] = @"kMDItemNamedLocationExact";
  v14[4] = @"kMDItemNamedLocationExactWord";
  v14[5] = @"kMDItemDisplayNameOrSubjectOrTitleExactMatch";
  v14[6] = @"kMDItemAlternateNameExactMatch";
  v14[7] = @"kMDItemAuthorsOrRecipientsExactMatch";
  [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v0 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v3 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v10 != v3) {
          objc_enumerationMutation(v0);
        }
        unint64_t v5 = objc_msgSend((id)sRankingQueryIndexDictionary, "objectForKeyedSubscript:", *(void *)(*((void *)&v9 + 1) + 8 * i), (void)v9);
        char v6 = [v5 unsignedIntegerValue];
        uint64_t v7 = 1 << v6;
        if ((v6 & 0x40) != 0) {
          uint64_t v8 = 1 << v6;
        }
        else {
          uint64_t v8 = 0;
        }
        if ((v6 & 0x40) != 0) {
          uint64_t v7 = 0;
        }
        *(_OWORD *)&updateBundleFeatures_withArrValues_featureScoreInfo__exactMask += __PAIR128__(v8, v7);
      }
      uint64_t v2 = [v0 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v2);
  }
}

- (void)populateCrossAttributeDerivedFeaturesWithContext:(prs_feature_population_ctx_t *)a3 featureScoreInfo:(PRSL2FeatureScoreInfo *)a4
{
  uint64_t v7 = 0;
  var4 = a3->var4;
  do
  {
    unsigned __int16 v9 = +[PRSRankingItem featureFromVirtualIdx:v7];
    float v10 = var4[v7];
    a4->var0[a4->var2] = v9;
    var1 = a4->var1;
    unint64_t var2 = a4->var2;
    a4->unint64_t var2 = var2 + 1;
    var1[var2] = v10;
    ++v7;
  }
  while (v7 != 28);
  float var7 = a3->var7;
  a4->var0[var2 + 1] = 406;
  unint64_t v14 = a4->var2;
  var0 = a4->var0;
  a4->var1[v14++] = var7;
  a4->unint64_t var2 = v14;
  float var5 = a3->var5;
  var0[v14] = 408;
  unint64_t v17 = a4->var2;
  unint64_t v18 = a4->var0;
  a4->var1[v17++] = var5;
  a4->unint64_t var2 = v17;
  float var8 = a3->var8;
  v18[v17] = 407;
  unint64_t v20 = a4->var2;
  float v21 = a4->var0;
  a4->var1[v20++] = var8;
  a4->unint64_t var2 = v20;
  float var6 = a3->var6;
  v21[v20] = 409;
  unint64_t v23 = a4->var1;
  unint64_t v24 = a4->var2;
  a4->unint64_t var2 = v24 + 1;
  v23[v24] = var6;
  self->_importantPropertiesWordMatched = a3->var11;
  self->_importantPropertiesPrefixMatched = a3->var10;
}

- (id)mailFreshnessDate
{
  uint64_t v3 = SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x15EuLL);
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    char v6 = SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x17AuLL);
    objc_opt_class();
    if (((objc_opt_isKindOfClass() & 1) != 0
       || (SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x17BuLL),
           uint64_t v7 = objc_claimAutoreleasedReturnValue(),
           v6,
           objc_opt_class(),
           char v6 = v7,
           (objc_opt_isKindOfClass() & 1) != 0))
      && (v8 = v6, (uint64_t v7 = v8) != 0))
    {
      id v5 = [v8 lastObject];
    }
    else
    {
      SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x20uLL);
      id v5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  return v5;
}

- (void)populateOnlyPommesL1RankingFeaturesWithQueryID:(int64_t)a3 isSearchToolClient:(BOOL)a4
{
  float v9 = 0.0;
  if (SSCompactRankingAttrsGetFloat((uint64_t)self->_attributes, 0xA0uLL, &v9)) {
    self->_pommesL1Score = v9;
  }
  retrievalType = self->_retrievalType;
  if (!retrievalType)
  {
    SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x69uLL);
    char v6 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = self->_retrievalType;
    self->_retrievalType = v6;

    retrievalType = self->_retrievalType;
  }
  if (([(NSNumber *)retrievalType integerValue] & 2) != 0)
  {
    id v8 = SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x68uLL);
    self->_embeddingSimilarity = sqDistancesToCosine(v8);
  }
}

- (void)populateOnlyPommesFeaturesForBundleID:(id)a3 queryID:(int64_t)a4 isSearchToolClient:(BOOL)a5
{
  id v6 = a3;
  [(PRSL2FeatureVector *)self->_L2FeatureVector setBundleID:v6];
  float v14 = 0.0;
  if (SSCompactRankingAttrsGetFloat((uint64_t)self->_attributes, 0xA0uLL, &v14)) {
    self->_pommesL1Score = v14;
  }
  retrievalType = self->_retrievalType;
  if (!retrievalType)
  {
    SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x69uLL);
    id v8 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    float v9 = self->_retrievalType;
    self->_retrievalType = v8;

    retrievalType = self->_retrievalType;
  }
  if (([(NSNumber *)retrievalType integerValue] & 2) != 0)
  {
    float v10 = SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x68uLL);
    self->_embeddingSimilarity = sqDistancesToCosine(v10);
  }
  if ([v6 isEqualToString:@"com.apple.mobilesafari"])
  {
    id v11 = [(PRSRankingItem *)self interestingDate];
  }
  else
  {
    long long v12 = [(PRSRankingItem *)self mailFreshnessDate];
    mailDate = self->_mailDate;
    self->_mailDate = v12;
  }
}

- (void)populateBundleSpecificFeatures:(PRSL2FeatureScoreInfo *)a3 currentTime:(double)a4 isSearchToolClient:(BOOL)a5
{
  BOOL v5 = a5;
  float v9 = self->_sectionBundleIdentifier;
  [(PRSL2FeatureVector *)self->_L2FeatureVector setBundleID:v9];
  if (SSPommesRankingIsEnabled(v9, v5))
  {
    float v29 = 0.0;
    if (SSCompactRankingAttrsGetFloat((uint64_t)self->_attributes, 0xA0uLL, &v29)) {
      self->_pommesL1Score = v29;
    }
  }
  if ([(NSString *)v9 isEqualToString:@"com.apple.MobileAddressBook"])
  {
    [(PRSRankingItem *)self populateContactFeatures:a3 currentTime:a4];
  }
  else if ([(NSString *)v9 isEqualToString:@"com.apple.application"])
  {
    a3->var0[a3->var2] = 326;
    var1 = a3->var1;
    unint64_t var2 = a3->var2;
    a3->unint64_t var2 = var2 + 1;
    var1[var2] = 1.0;
    float v28 = 0.0;
    int Float = SSCompactRankingAttrsGetFloat((uint64_t)self->_attributes, 0x151uLL, &v28);
    float v13 = v28;
    if (!Float) {
      float v13 = 0.0;
    }
    a3->var0[a3->var2] = 75;
    float v14 = a3->var1;
    unint64_t v15 = a3->var2;
    a3->unint64_t var2 = v15 + 1;
    v14[v15] = v13;
    int v16 = SSCompactRankingAttrsGetFloat((uint64_t)self->_attributes, 0x152uLL, &v28);
    float v17 = v28;
    if (!v16) {
      float v17 = 0.0;
    }
    a3->var0[a3->var2] = 74;
    unint64_t v18 = a3->var1;
    unint64_t v19 = a3->var2;
    a3->unint64_t var2 = v19 + 1;
    v18[v19] = v17;
    int v20 = SSCompactRankingAttrsGetFloat((uint64_t)self->_attributes, 0x153uLL, &v28);
    float v21 = v28;
    if (!v20) {
      float v21 = 0.0;
    }
    a3->var0[a3->var2] = 73;
    uint64_t v22 = a3->var1;
    unint64_t v23 = a3->var2;
    a3->unint64_t var2 = v23 + 1;
    v22[v23] = v21;
    int v24 = SSCompactRankingAttrsGetFloat((uint64_t)self->_attributes, 0x154uLL, &v28);
    float v25 = v28;
    if (!v24) {
      float v25 = 0.0;
    }
    a3->var0[a3->var2] = 72;
    unint64_t v26 = a3->var1;
    unint64_t v27 = a3->var2;
    a3->unint64_t var2 = v27 + 1;
    v26[v27] = v25;
  }
  else if ([(NSString *)v9 isEqualToString:@"com.apple.mobilemail"] {
         || [(NSString *)v9 isEqualToString:@"com.apple.pommesctl"])
  }
  {
    [(PRSRankingItem *)self populateMailFeatures:a3];
  }
  else if ([(NSString *)v9 isEqualToString:@"com.apple.MobileSMS"])
  {
    [(PRSRankingItem *)self populateSMSFeatures:a3];
  }
}

- (void)populateParsecBundleSpecificFeatures:(PRSL2FeatureScoreInfo *)a3 currentTime:(double)a4 forParsecResult:(id)a5
{
  id v9 = a5;
  id v8 = [v9 sectionBundleIdentifier];
  [(PRSL2FeatureVector *)self->_L2FeatureVector setBundleID:v8];
  if ([v8 isEqualToString:@"com.apple.parsec.itunes.album"])
  {
    [(PRSRankingItem *)self populateParsecAlbumFeatures:a3 currentTime:v9 forParsecResult:a4];
  }
  else if ([v8 isEqualToString:@"com.apple.parsec.itunes.iosSoftware"])
  {
    [(PRSRankingItem *)self populateParsecAppFeatures:a3 currentTime:v9 forParsecResult:a4];
  }
  else if ([v8 isEqualToString:@"com.apple.parsec.itunes.epubBook"])
  {
    [(PRSRankingItem *)self populateParsecEPubBookFeatures:a3 currentTime:v9 forParsecResult:a4];
  }
  else if ([v8 isEqualToString:@"com.apple.parsec.ondemandmovies.movie"])
  {
    [(PRSRankingItem *)self populateParsecMovieFeatures:a3 currentTime:v9 forParsecResult:a4];
  }
  else if ([v8 isEqualToString:@"com.apple.parsec.itunes.podcast"])
  {
    [(PRSRankingItem *)self populateParsecPodcastFeatures:a3 currentTime:v9 forParsecResult:a4];
  }
  else if ([v8 isEqualToString:@"com.apple.parsec.profiles.profile"])
  {
    [(PRSRankingItem *)self populateParsecProfileFeatures:a3 currentTime:v9 forParsecResult:a4];
  }
  else if ([v8 isEqualToString:@"com.apple.parsec.itunes.song"])
  {
    [(PRSRankingItem *)self populateParsecSongFeatures:a3 currentTime:v9 forParsecResult:a4];
  }
  else if ([v8 isEqualToString:@"com.apple.parsec.tv.tvShow"])
  {
    [(PRSRankingItem *)self populateParsecTvShowFeatures:a3 currentTime:v9 forParsecResult:a4];
  }
  else if ([v8 isEqualToString:@"com.apple.parsec.web_video"])
  {
    [(PRSRankingItem *)self populateParsecWebVideoFeatures:a3 currentTime:v9 forParsecResult:a4];
  }
  [(PRSRankingItem *)self populateParsecAnyFeatures:a3 currentTime:v9 forParsecResult:a4];
}

- (void)populateParsecRoundTripFeatures:(id)a3 forParsecResult:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (populateParsecRoundTripFeatures_forParsecResult__onceToken != -1) {
      dispatch_once(&populateParsecRoundTripFeatures_forParsecResult__onceToken, &__block_literal_global_279);
    }
    if (populateParsecRoundTripFeatures_forParsecResult__useServerFeatures)
    {
      uint64_t v7 = [v6 performSelector:sel_serverFeatures];
      id v8 = v7;
      if (v7 && [v7 count])
      {
        id v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v8, "count"));
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        id obj = [v8 allKeys];
        uint64_t v10 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v21;
LABEL_9:
          uint64_t v13 = 0;
          while (1)
          {
            if (*(void *)v21 != v12) {
              objc_enumerationMutation(obj);
            }
            float v14 = *(void **)(*((void *)&v20 + 1) + 8 * v13);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0 || ![v14 length]) {
              break;
            }
            unint64_t v15 = [@"roundtrip_" stringByAppendingString:v14];
            int v16 = [v8 objectForKey:v15];

            if (v16) {
              goto LABEL_21;
            }
            float v17 = [v8 objectForKey:v14];
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {

LABEL_21:
              break;
            }
            unint64_t v18 = (void *)[v17 copy];
            [v9 setObject:v18 forKey:v15];

            if (v11 == ++v13)
            {
              uint64_t v11 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
              if (v11) {
                goto LABEL_9;
              }
              break;
            }
          }
        }

        if (v9 && [v9 count]) {
          [v5 setRoundTripFeatures:v9];
        }
      }
    }
    else
    {
      id v8 = 0;
    }
  }
}

uint64_t __66__PRSRankingItem_populateParsecRoundTripFeatures_forParsecResult___block_invoke()
{
  uint64_t result = [(id)objc_opt_class() instancesRespondToSelector:sel_serverFeatures];
  if (result) {
    uint64_t result = [(id)objc_opt_class() instancesRespondToSelector:sel_setServerFeatures_];
  }
  populateParsecRoundTripFeatures_forParsecResult__useServerFeatures = result;
  return result;
}

- (void)populateMailFeatures:(PRSL2FeatureScoreInfo *)a3
{
  uint64_t v279 = *MEMORY[0x1E4F143B8];
  pthread_mutex_lock(&sVIPLock);
  id v5 = (id)sVipList;
  id v248 = (id)sVipEmails;
  id v6 = (id)sMeEmailAddresses;
  pthread_mutex_unlock(&sVIPLock);
  float v273 = 0.0;
  if (SSCompactRankingAttrsGetFloat((uint64_t)self->_attributes, 0x161uLL, &v273))
  {
    float v7 = v273;
    a3->var0[a3->var2] = 1855;
    var1 = a3->var1;
    unint64_t var2 = a3->var2;
    a3->unint64_t var2 = var2 + 1;
    var1[var2] = v7;
  }
  id v244 = v6;
  long long v240 = v5;
  long long v246 = self;
  uint64_t v10 = SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x160uLL);
  uint64_t v11 = v10;
  if (v10
    && (unint64_t)[v10 count] <= 4
    && [v11 containsObject:*MEMORY[0x1E4F22990]])
  {
    a3->var0[a3->var2] = 1856;
    uint64_t v12 = a3->var1;
    unint64_t v13 = a3->var2;
    a3->unint64_t var2 = v13 + 1;
    v12[v13] = 1.0;
  }
  long long v241 = a3;
  long long v239 = v11;
  float v14 = SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x23uLL);
  unint64_t v15 = *(void *)&self->_indexScore[8];
  unint64_t v16 = *(void *)self->_indexScore;
  long long v269 = 0u;
  long long v270 = 0u;
  long long v271 = 0u;
  long long v272 = 0u;
  id v17 = v14;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v269 objects:v278 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    char v20 = 0;
    char v245 = 0;
    uint64_t v21 = *(void *)v270;
    do
    {
      long long v22 = v17;
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v270 != v21) {
          objc_enumerationMutation(v22);
        }
        uint64_t v24 = *(void *)(*((void *)&v269 + 1) + 8 * i);
        if ([v248 containsObject:v24])
        {
          matchedSenders = v246->_matchedSenders;
          if (matchedSenders)
          {
            [(NSMutableArray *)matchedSenders addObject:v24];
          }
          else
          {
            uint64_t v26 = [MEMORY[0x1E4F1CA48] arrayWithObject:v24];
            unint64_t v27 = v246->_matchedSenders;
            v246->_matchedSenders = (NSMutableArray *)v26;
          }
          float v28 = [(id)sRankingQueryIndexDictionary objectForKeyedSubscript:@"kMDItemAuthorsPrefixWord"];
          char v29 = [v28 unsignedIntegerValue];
          uint64_t v30 = ((2 * v15) << ~v29) | (v16 >> v29);
          if ((v29 & 0x40) != 0) {
            uint64_t v30 = v15 >> v29;
          }
          char v245 = v30 & 1;

          char v20 = 1;
        }
      }
      id v17 = v22;
      uint64_t v19 = [v22 countByEnumeratingWithState:&v269 objects:v278 count:16];
    }
    while (v19);
  }
  else
  {
    char v20 = 0;
    char v245 = 0;
  }

  uint64_t v31 = [(id)sRankingQueryIndexDictionary objectForKeyedSubscript:@"kMDItemUserIsSender"];
  char v32 = [v31 unsignedIntegerValue];
  uint64_t v33 = 1 << v32;
  if ((v32 & 0x40) != 0) {
    uint64_t v34 = 0;
  }
  else {
    uint64_t v34 = 1 << v32;
  }
  if ((v32 & 0x40) == 0) {
    uint64_t v33 = 0;
  }
  *(void *)&long long v235 = v34 & v16;
  *((void *)&v235 + 1) = v33 & v15;
  uint64_t v35 = v34 & v16 | v33 & v15;

  if (v35)
  {
    SSCompactRankingAttrsGetValue((int8x8_t *)v246->_attributes, 0x166uLL);
    long long v265 = 0u;
    long long v266 = 0u;
    long long v267 = 0u;
    long long v268 = 0u;
    id v36 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v37 = [v36 countByEnumeratingWithState:&v265 objects:v277 count:16];
    unint64_t v38 = v244;
    if (v37)
    {
      uint64_t v39 = *(void *)v266;
      uint64_t v40 = v241;
      while (2)
      {
        for (uint64_t j = 0; j != v37; ++j)
        {
          if (*(void *)v266 != v39) {
            objc_enumerationMutation(v36);
          }
          uint64_t v42 = *(void *)(*((void *)&v265 + 1) + 8 * j);
          if ([v248 containsObject:v42])
          {
            matchedRecipients = v246->_matchedRecipients;
            if (matchedRecipients)
            {
              [(NSMutableArray *)matchedRecipients addObject:v42];
            }
            else
            {
              uint64_t v45 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v42, 0);
              long long v46 = v246->_matchedRecipients;
              v246->_matchedRecipients = (NSMutableArray *)v45;
            }
            LODWORD(v37) = 1;
            goto LABEL_44;
          }
        }
        uint64_t v37 = [v36 countByEnumeratingWithState:&v265 objects:v277 count:16];
        if (v37) {
          continue;
        }
        break;
      }
    }
    else
    {
      uint64_t v40 = v241;
    }
LABEL_44:
    char v44 = v20;
  }
  else
  {
    char v44 = v20;
    LODWORD(v37) = 0;
    unint64_t v38 = v244;
    uint64_t v40 = v241;
  }
  unint64_t v47 = v246;
  id v48 = SSCompactRankingAttrsGetValue((int8x8_t *)v246->_attributes, 0x164uLL);
  unint64_t v49 = SSCompactRankingAttrsGetValue((int8x8_t *)v246->_attributes, 0x15EuLL);
  long long v238 = SSCompactRankingAttrsGetValue((int8x8_t *)v246->_attributes, 0x20uLL);
  SSCompactRankingAttrsGetValue((int8x8_t *)v246->_attributes, 0x166uLL);
  long long v247 = (char *)objc_claimAutoreleasedReturnValue();
  uint64_t v50 = SSCompactRankingAttrsGetValue((int8x8_t *)v47->_attributes, 0x167uLL);
  uint64_t v51 = SSCompactRankingAttrsGetValue((int8x8_t *)v47->_attributes, 0x168uLL);
  long long v243 = SSCompactRankingAttrsGetValue((int8x8_t *)v47->_attributes, 0x169uLL);
  uint64_t v263 = 0;
  uint64_t v264 = 0;
  uint64_t v262 = 0;
  float v261 = 0.0;
  uint64_t v52 = [(PRSRankingItem *)v47 mailFreshnessDate];
  mailDate = v47->_mailDate;
  v47->_mailDate = (NSDate *)v52;

  if (SSCompactRankingAttrsGetFloat((uint64_t)v47->_attributes, 0x162uLL, (_DWORD *)&v264 + 1))
  {
    float v54 = *((float *)&v264 + 1);
    v40->var0[v40->var2] = 1901;
    float v55 = v40->var1;
    unint64_t v56 = v40->var2;
    v40->unint64_t var2 = v56 + 1;
    v55[v56] = v54;
  }
  if (SSCompactRankingAttrsGetFloat((uint64_t)v47->_attributes, 0x161uLL, &v264))
  {
    float v57 = *(float *)&v264;
    v40->var0[v40->var2] = 1902;
    float v58 = v40->var1;
    unint64_t v59 = v40->var2;
    v40->unint64_t var2 = v59 + 1;
    v58[v59] = v57;
  }
  if (SSCompactRankingAttrsGetFloat((uint64_t)v47->_attributes, 0x163uLL, (_DWORD *)&v263 + 1))
  {
    float v60 = *((float *)&v263 + 1);
    v40->var0[v40->var2] = 1903;
    float v61 = v40->var1;
    unint64_t v62 = v40->var2;
    v40->unint64_t var2 = v62 + 1;
    v61[v62] = v60;
  }
  if (SSCompactRankingAttrsGetFloat((uint64_t)v47->_attributes, 0x16CuLL, &v261))
  {
    float v63 = v261;
    v40->var0[v40->var2] = 1906;
    float v64 = v40->var1;
    unint64_t v65 = v40->var2;
    v40->unint64_t var2 = v65 + 1;
    v64[v65] = v63;
  }
  if (SSCompactRankingAttrsGetFloat((uint64_t)v47->_attributes, 0x16AuLL, (_DWORD *)&v262 + 1))
  {
    float v66 = *((float *)&v262 + 1);
    v40->var0[v40->var2] = 1904;
    unint64_t v67 = v40->var1;
    unint64_t v68 = v40->var2;
    v40->unint64_t var2 = v68 + 1;
    v67[v68] = v66;
  }
  if (SSCompactRankingAttrsGetFloat((uint64_t)v47->_attributes, 0x16BuLL, &v262))
  {
    float v69 = *(float *)&v262;
    v40->var0[v40->var2] = 1905;
    unint64_t v70 = v40->var1;
    unint64_t v71 = v40->var2;
    v40->unint64_t var2 = v71 + 1;
    v70[v71] = v69;
  }
  if (SSCompactRankingAttrsGetFloat((uint64_t)v47->_attributes, 0x15CuLL, &v263))
  {
    float v72 = *(float *)&v263;
    v40->var0[v40->var2] = 1900;
    double v73 = v40->var1;
    unint64_t v74 = v40->var2;
    unint64_t v75 = v74 + 1;
    v40->unint64_t var2 = v74 + 1;
    v73[v74] = v72;
  }
  else
  {
    unint64_t v75 = v40->var2;
  }
  double v76 = 0.0;
  if (v44) {
    float v77 = 1.0;
  }
  else {
    float v77 = 0.0;
  }
  v40->var0[v75] = 1852;
  float v78 = v40->var1;
  unint64_t v79 = v40->var2;
  v40->unint64_t var2 = v79 + 1;
  v78[v79] = v77;
  if (v37) {
    *(float *)&double v76 = 1.0;
  }
  v40->var0[v79 + 1] = 1854;
  unint64_t v80 = v40->var1;
  unint64_t v81 = v40->var2;
  v40->unint64_t var2 = v81 + 1;
  v80[v81] = *(float *)&v76;
  v40->var0[v81 + 1] = 1852;
  id v82 = v40->var1;
  unint64_t v83 = v40->var2;
  v40->unint64_t var2 = v83 + 1;
  v82[v83] = v77;
  v40->var0[v83 + 1] = 1854;
  float v84 = v40->var1;
  unint64_t v85 = v40->var2;
  v40->unint64_t var2 = v85 + 1;
  v84[v85] = *(float *)&v76;
  if (v48 && v49)
  {
    [v48 timeIntervalSinceDate:v49];
    *(float *)&double v86 = v86;
    +[PRSRankingUtilities floatValue:2 withSigFigs:v86];
    v40->var0[v40->var2] = 1891;
    uint64_t v87 = v40->var1;
    unint64_t v88 = v40->var2;
    v40->unint64_t var2 = v88 + 1;
    v87[v88] = *(float *)&v76;
  }
  long long v242 = v49;
  unint64_t v89 = v247;
  v236 = (void *)v51;
  long long v237 = v48;
  if (v247 && [v247 count] && !v50 && !v51)
  {
    id v90 = v17;
    uint64_t v91 = [v247 count];
    char v234 = 0;
    BOOL v92 = 0;
    BOOL v93 = 0;
    double v76 = 0.0;
    if (v91 == 1) {
      *(float *)&double v76 = 1.0;
    }
    v40->var0[v40->var2] = 1892;
    unint64_t v94 = v40->var1;
    unint64_t v95 = v40->var2;
    unint64_t v96 = v95 + 1;
    v40->unint64_t var2 = v95 + 1;
    v94[v95] = *(float *)&v76;
    goto LABEL_89;
  }
  BOOL v92 = v51 != 0;
  if (v51)
  {
    v40->var0[v40->var2] = 1893;
    unint64_t v97 = v40->var1;
    unint64_t v98 = v40->var2;
    v40->unint64_t var2 = v98 + 1;
    v97[v98] = 1.0;
    if (v38)
    {
      unint64_t v99 = [MEMORY[0x1E4F1CAD0] setWithArray:v51];
      unint64_t v100 = [MEMORY[0x1E4F1CAD0] setWithArray:v38];
      int v101 = [v99 intersectsSet:v100];

      id v90 = v17;
      if (v101)
      {
        v40->var0[v40->var2] = 1894;
        uint64_t v102 = v40->var1;
        unint64_t v103 = v40->var2;
        v40->unint64_t var2 = v103 + 1;
        v102[v103] = 1.0;
        LODWORD(v51) = 1;
      }
      else
      {
        LODWORD(v51) = 0;
      }
      unint64_t v38 = v244;
      unint64_t v49 = v242;
      unint64_t v89 = v247;
    }
    else
    {
      id v90 = v17;
      LODWORD(v51) = 0;
    }
  }
  else
  {
    id v90 = v17;
  }
  BOOL v93 = v50 != 0;
  if (v50
    && (v40->var0[v40->var2] = 1895, float v104 = v40->var1, v105 = v40->var2, v40->var2 = v105 + 1, v104[v105] = 1.0, v38))
  {
    unint64_t v106 = [MEMORY[0x1E4F1CAD0] setWithArray:v50];
    uint64_t v107 = [MEMORY[0x1E4F1CAD0] setWithArray:v38];
    int v108 = [v106 intersectsSet:v107];

    if (v108)
    {
      v40->var0[v40->var2] = 1896;
      uint64_t v109 = v40->var1;
      unint64_t v110 = v40->var2;
      v40->unint64_t var2 = v110 + 1;
      v109[v110] = 1.0;
      LODWORD(v51) = v51 + 1;
      char v234 = 1;
    }
    else
    {
      char v234 = 0;
    }
    unint64_t v38 = v244;
    unint64_t v49 = v242;
    unint64_t v89 = v247;
    if (!v247) {
      goto LABEL_97;
    }
  }
  else
  {
    char v234 = 0;
    if (!v89)
    {
LABEL_97:
      char v118 = 0;
      goto LABEL_98;
    }
  }
  unint64_t v96 = v40->var2;
LABEL_89:
  v40->var0[v96] = 1897;
  long long v111 = v40->var1;
  unint64_t v112 = v40->var2;
  v40->unint64_t var2 = v112 + 1;
  v111[v112] = 1.0;
  if (v38)
  {
    v113 = [MEMORY[0x1E4F1CAD0] setWithArray:v89];
    unint64_t v114 = [MEMORY[0x1E4F1CAD0] setWithArray:v38];
    int v115 = [v113 intersectsSet:v114];

    if (v115)
    {
      v40->var0[v40->var2] = 1898;
      v116 = v40->var1;
      unint64_t v117 = v40->var2;
      v40->unint64_t var2 = v117 + 1;
      v116[v117] = 1.0;
      LODWORD(v51) = v51 + 1;
      char v118 = 1;
    }
    else
    {
      char v118 = 0;
    }
    unint64_t v38 = v244;
    unint64_t v49 = v242;
    unint64_t v89 = v247;
  }
  else
  {
    char v118 = 0;
    unint64_t v49 = v242;
  }
LABEL_98:
  int v119 = *((float *)&v262 + 1) != 0.0;
  LODWORD(v76) = v262;
  if (*(float *)&v262 != 0.0) {
    int v119 = 1;
  }
  char v120 = (v89 == 0) & ~(v92 || v93);
  if (!v49) {
    char v120 = 0;
  }
  if ((v120 & 1) != 0 || v51 == v119 << 31 >> 31)
  {
    v40->var0[v40->var2] = 1894;
    float v121 = v40->var1;
    unint64_t v122 = v40->var2;
    v40->unint64_t var2 = v122 + 1;
    v121[v122] = 1.0;
  }
  uint64_t v123 = objc_msgSend(v243, "count", v76);
  unint64_t v124 = v40->var2;
  if (v123)
  {
    v40->var0[v124] = 1899;
    v125 = v40->var1;
    unint64_t v126 = v40->var2;
    unint64_t v124 = v126 + 1;
    v40->unint64_t var2 = v126 + 1;
    v125[v126] = 1.0;
  }
  float v127 = 0.0;
  if (v245) {
    float v127 = 1.0;
  }
  v40->var0[v124] = 1853;
  unint64_t v128 = v40->var1;
  unint64_t v129 = v40->var2;
  v40->unint64_t var2 = v129 + 1;
  v128[v129] = v127;
  if (v235 != 0)
  {
    if (v89 && [v89 count])
    {
LABEL_115:
      if ([v89 count])
      {
        unint64_t v89 = (char *)[v89 count];
        if (!v93) {
          goto LABEL_141;
        }
      }
      else
      {
        unint64_t v89 = 0;
        if (!v93)
        {
LABEL_141:
          v133 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v89];
          long long v257 = 0u;
          long long v258 = 0u;
          long long v259 = 0u;
          long long v260 = 0u;
          float v184 = v247;
          uint64_t v185 = [v184 countByEnumeratingWithState:&v257 objects:v276 count:16];
          unint64_t v130 = v90;
          v131 = v237;
          if (v185)
          {
            uint64_t v186 = v185;
            uint64_t v187 = *(void *)v258;
            do
            {
              for (uint64_t k = 0; k != v186; ++k)
              {
                if (*(void *)v258 != v187) {
                  objc_enumerationMutation(v184);
                }
                v189 = (void *)_SICreateContactMailCounts();
                if (v189) {
                  [v133 addObject:v189];
                }
              }
              uint64_t v186 = [v184 countByEnumeratingWithState:&v257 objects:v276 count:16];
            }
            while (v186);
          }

          long long v255 = 0u;
          long long v256 = 0u;
          long long v253 = 0u;
          long long v254 = 0u;
          id v190 = v50;
          uint64_t v191 = [v190 countByEnumeratingWithState:&v253 objects:v275 count:16];
          if (v191)
          {
            uint64_t v192 = v191;
            uint64_t v193 = *(void *)v254;
            do
            {
              for (uint64_t m = 0; m != v192; ++m)
              {
                if (*(void *)v254 != v193) {
                  objc_enumerationMutation(v190);
                }
                float v195 = (void *)_SICreateContactMailCounts();
                if (v195) {
                  [v133 addObject:v195];
                }
              }
              uint64_t v192 = [v190 countByEnumeratingWithState:&v253 objects:v275 count:16];
            }
            while (v192);
          }

          v196 = [v133 sortedArrayWithOptions:1 usingComparator:&__block_literal_global_296];
          float v141 = v196;
          if (!v196 || ![v196 count]) {
            goto LABEL_163;
          }
          unint64_t v197 = [v141 objectAtIndexedSubscript:0];
          float v198 = [v197 objectAtIndexedSubscript:0];
          [v198 floatValue];
          float v144 = v241;
          v241->var0[v241->var2] = 2030;
          v199 = v241->var1;
          unint64_t v200 = v241->var2;
          v241->unint64_t var2 = v200 + 1;
          v199[v200] = v201;

          v202 = [v141 objectAtIndexedSubscript:0];
          unint64_t v203 = [v202 objectAtIndexedSubscript:1];
          [v203 floatValue];
          v241->var0[v241->var2] = 2029;
          float v204 = v241->var1;
          unint64_t v205 = v241->var2;
          v241->unint64_t var2 = v205 + 1;
          v204[v205] = v206;

          v207 = [v141 objectAtIndexedSubscript:0];
          unint64_t v208 = [v207 objectAtIndexedSubscript:2];
          [v208 floatValue];
          v241->var0[v241->var2] = 2028;
          v209 = v241->var1;
          unint64_t v210 = v241->var2;
          v241->unint64_t var2 = v210 + 1;
          v209[v210] = v211;

          unint64_t v212 = [v141 objectAtIndexedSubscript:0];
          v213 = [v212 objectAtIndexedSubscript:3];
          [v213 floatValue];
          v241->var0[v241->var2] = 2027;
          unint64_t v214 = v241->var1;
          unint64_t v215 = v241->var2;
          v241->unint64_t var2 = v215 + 1;
          v214[v215] = v216;

          unint64_t v217 = [v141 objectAtIndexedSubscript:0];
          float v218 = [v217 objectAtIndexedSubscript:4];
          [v218 floatValue];
          v241->var0[v241->var2] = 2026;
          v219 = v241->var1;
          unint64_t v220 = v241->var2;
          v241->unint64_t var2 = v220 + 1;
          v219[v220] = v221;

          v222 = [v141 objectAtIndexedSubscript:0];
          unint64_t v223 = [v222 objectAtIndexedSubscript:5];
          [v223 floatValue];
          v241->var0[v241->var2] = 2025;
          float v224 = v241->var1;
          unint64_t v225 = v241->var2;
          v241->unint64_t var2 = v225 + 1;
          v224[v225] = v226;

          v227 = [v141 objectAtIndexedSubscript:0];
          unint64_t v228 = [v227 objectAtIndexedSubscript:6];
          [v228 floatValue];
          v241->var0[v241->var2] = 2024;
          v229 = v241->var1;
          unint64_t v230 = v241->var2;
          v241->unint64_t var2 = v230 + 1;
          v229[v230] = v231;

          float v178 = [v141 objectAtIndexedSubscript:0];
          v179 = [v178 objectAtIndexedSubscript:7];
          [v179 floatValue];
          var0 = v241->var0;
          unint64_t v182 = v241->var2;
          __int16 v183 = 2023;
LABEL_162:
          var0[v182] = v183;
          unint64_t v232 = v144->var1;
          unint64_t v233 = v144->var2;
          v144->unint64_t var2 = v233 + 1;
          v232[v233] = v180;

LABEL_163:
          unint64_t v38 = v244;
          unint64_t v49 = v242;
          unint64_t v89 = v247;
          goto LABEL_164;
        }
      }
LABEL_139:
      if ([v50 count]) {
        v89 += [v50 count];
      }
      goto LABEL_141;
    }
    if (v93 && [v50 count])
    {
      if (!v89) {
        goto LABEL_139;
      }
      goto LABEL_115;
    }
  }
  if (v118)
  {
    unint64_t v130 = v90;
    v131 = v237;
    if (!v130) {
      goto LABEL_164;
    }
  }
  else
  {
    unint64_t v130 = v90;
    if (v90) {
      char v132 = v234;
    }
    else {
      char v132 = 0;
    }
    v131 = v237;
    if ((v132 & 1) == 0) {
      goto LABEL_164;
    }
  }
  if ([v130 count])
  {
    v133 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v130, "count"));
    long long v249 = 0u;
    long long v250 = 0u;
    long long v251 = 0u;
    long long v252 = 0u;
    id v134 = v130;
    uint64_t v135 = [v134 countByEnumeratingWithState:&v249 objects:v274 count:16];
    if (v135)
    {
      uint64_t v136 = v135;
      uint64_t v137 = *(void *)v250;
      do
      {
        for (uint64_t n = 0; n != v136; ++n)
        {
          if (*(void *)v250 != v137) {
            objc_enumerationMutation(v134);
          }
          v139 = (void *)_SICreateContactMailCounts();
          if (v139) {
            [v133 addObject:v139];
          }
        }
        uint64_t v136 = [v134 countByEnumeratingWithState:&v249 objects:v274 count:16];
      }
      while (v136);
    }

    unint64_t v140 = [v133 sortedArrayWithOptions:1 usingComparator:&__block_literal_global_298_0];
    float v141 = v140;
    if (!v140 || ![v140 count]) {
      goto LABEL_163;
    }
    v142 = [v141 objectAtIndexedSubscript:0];
    unint64_t v143 = [v142 objectAtIndexedSubscript:0];
    [v143 floatValue];
    float v144 = v241;
    v241->var0[v241->var2] = 2022;
    v145 = v241->var1;
    unint64_t v146 = v241->var2;
    v241->unint64_t var2 = v146 + 1;
    v145[v146] = v147;

    unint64_t v148 = [v141 objectAtIndexedSubscript:0];
    v149 = [v148 objectAtIndexedSubscript:1];
    [v149 floatValue];
    v241->var0[v241->var2] = 2021;
    unint64_t v150 = v241->var1;
    unint64_t v151 = v241->var2;
    v241->unint64_t var2 = v151 + 1;
    v150[v151] = v152;

    v153 = [v141 objectAtIndexedSubscript:0];
    unint64_t v154 = [v153 objectAtIndexedSubscript:2];
    [v154 floatValue];
    v241->var0[v241->var2] = 2020;
    float v155 = v241->var1;
    unint64_t v156 = v241->var2;
    v241->unint64_t var2 = v156 + 1;
    v155[v156] = v157;

    float v158 = [v141 objectAtIndexedSubscript:0];
    v159 = [v158 objectAtIndexedSubscript:3];
    [v159 floatValue];
    v241->var0[v241->var2] = 2019;
    unint64_t v160 = v241->var1;
    unint64_t v161 = v241->var2;
    v241->unint64_t var2 = v161 + 1;
    v160[v161] = v162;

    unint64_t v163 = [v141 objectAtIndexedSubscript:0];
    float v164 = [v163 objectAtIndexedSubscript:4];
    [v164 floatValue];
    v241->var0[v241->var2] = 2018;
    v165 = v241->var1;
    unint64_t v166 = v241->var2;
    v241->unint64_t var2 = v166 + 1;
    v165[v166] = v167;

    unint64_t v168 = [v141 objectAtIndexedSubscript:0];
    v169 = [v168 objectAtIndexedSubscript:5];
    [v169 floatValue];
    v241->var0[v241->var2] = 2017;
    unint64_t v170 = v241->var1;
    unint64_t v171 = v241->var2;
    v241->unint64_t var2 = v171 + 1;
    v170[v171] = v172;

    v173 = [v141 objectAtIndexedSubscript:0];
    unint64_t v174 = [v173 objectAtIndexedSubscript:6];
    [v174 floatValue];
    v241->var0[v241->var2] = 2016;
    float v175 = v241->var1;
    unint64_t v176 = v241->var2;
    v241->unint64_t var2 = v176 + 1;
    v175[v176] = v177;

    float v178 = [v141 objectAtIndexedSubscript:0];
    v179 = [v178 objectAtIndexedSubscript:7];
    [v179 floatValue];
    var0 = v241->var0;
    unint64_t v182 = v241->var2;
    __int16 v183 = 2015;
    goto LABEL_162;
  }
LABEL_164:
}

uint64_t __39__PRSRankingItem_populateMailFeatures___block_invoke(uint64_t a1, void *a2, void *a3)
{
  return -(*((uint64_t (**)(uint64_t, void *, void *))countsArrayComparator + 2))((uint64_t)countsArrayComparator, a2, a3);
}

uint64_t __39__PRSRankingItem_populateMailFeatures___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  return -(*((uint64_t (**)(uint64_t, void *, void *))countsArrayComparator + 2))((uint64_t)countsArrayComparator, a2, a3);
}

- (void)populateSMSFeatures:(PRSL2FeatureScoreInfo *)a3
{
  uint64_t v125 = *MEMORY[0x1E4F143B8];
  id v5 = SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x2FuLL);
  id v6 = v5;
  if (v5 && [v5 count] && (unint64_t)objc_msgSend(v6, "count") <= 4)
  {
    float v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v6, "count"));
    long long v119 = 0u;
    long long v120 = 0u;
    long long v121 = 0u;
    long long v122 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v119 objects:v124 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v120;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v120 != v11) {
            objc_enumerationMutation(v8);
          }
          unint64_t v13 = (void *)_SICreateContactSMSCounts();
          if (v13) {
            [v7 addObject:v13];
          }

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v119 objects:v124 count:16];
      }
      while (v10);
    }

    float v14 = [v7 sortedArrayWithOptions:1 usingComparator:&__block_literal_global_300_0];
    unint64_t v15 = v14;
    if (v14 && [v14 count])
    {
      unint64_t v16 = [v15 objectAtIndexedSubscript:0];
      id v17 = [v16 objectAtIndexedSubscript:0];
      [v17 floatValue];
      a3->var0[a3->var2] = 2038;
      var1 = a3->var1;
      unint64_t var2 = a3->var2;
      a3->unint64_t var2 = var2 + 1;
      var1[var2] = v20;

      uint64_t v21 = [v15 objectAtIndexedSubscript:0];
      long long v22 = [v21 objectAtIndexedSubscript:1];
      [v22 floatValue];
      a3->var0[a3->var2] = 2037;
      long long v23 = a3->var1;
      unint64_t v24 = a3->var2;
      a3->unint64_t var2 = v24 + 1;
      v23[v24] = v25;

      uint64_t v26 = [v15 objectAtIndexedSubscript:0];
      unint64_t v27 = [v26 objectAtIndexedSubscript:2];
      [v27 floatValue];
      a3->var0[a3->var2] = 2036;
      float v28 = a3->var1;
      unint64_t v29 = a3->var2;
      a3->unint64_t var2 = v29 + 1;
      v28[v29] = v30;

      uint64_t v31 = [v15 objectAtIndexedSubscript:0];
      char v32 = [v31 objectAtIndexedSubscript:3];
      [v32 floatValue];
      a3->var0[a3->var2] = 2035;
      uint64_t v33 = a3->var1;
      unint64_t v34 = a3->var2;
      a3->unint64_t var2 = v34 + 1;
      v33[v34] = v35;

      id v36 = [v15 objectAtIndexedSubscript:0];
      uint64_t v37 = [v36 objectAtIndexedSubscript:4];
      [v37 floatValue];
      a3->var0[a3->var2] = 2034;
      unint64_t v38 = a3->var1;
      unint64_t v39 = a3->var2;
      a3->unint64_t var2 = v39 + 1;
      v38[v39] = v40;

      unint64_t v41 = [v15 objectAtIndexedSubscript:0];
      uint64_t v42 = [v41 objectAtIndexedSubscript:5];
      [v42 floatValue];
      a3->var0[a3->var2] = 2033;
      unint64_t v43 = a3->var1;
      unint64_t v44 = a3->var2;
      a3->unint64_t var2 = v44 + 1;
      v43[v44] = v45;

      long long v46 = [v15 objectAtIndexedSubscript:0];
      unint64_t v47 = [v46 objectAtIndexedSubscript:6];
      [v47 floatValue];
      a3->var0[a3->var2] = 2032;
      id v48 = a3->var1;
      unint64_t v49 = a3->var2;
      a3->unint64_t var2 = v49 + 1;
      v48[v49] = v50;

      uint64_t v51 = [v15 objectAtIndexedSubscript:0];
      uint64_t v52 = [v51 objectAtIndexedSubscript:7];
      [v52 floatValue];
      a3->var0[a3->var2] = 2031;
      id v53 = a3->var1;
      unint64_t v54 = a3->var2;
      a3->unint64_t var2 = v54 + 1;
      v53[v54] = v55;
    }
  }
  unint64_t v56 = SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x30uLL);
  float v57 = v56;
  if (v56 && [v56 count] && (unint64_t)objc_msgSend(v57, "count") <= 4)
  {
    float v58 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v57, "count"));
    long long v115 = 0u;
    long long v116 = 0u;
    long long v117 = 0u;
    long long v118 = 0u;
    id v59 = v57;
    uint64_t v60 = [v59 countByEnumeratingWithState:&v115 objects:v123 count:16];
    if (v60)
    {
      uint64_t v61 = v60;
      uint64_t v62 = *(void *)v116;
      do
      {
        uint64_t v63 = 0;
        do
        {
          if (*(void *)v116 != v62) {
            objc_enumerationMutation(v59);
          }
          float v64 = (void *)_SICreateContactSMSCounts();
          if (v64) {
            objc_msgSend(v58, "addObject:", v64, v115);
          }

          ++v63;
        }
        while (v61 != v63);
        uint64_t v61 = [v59 countByEnumeratingWithState:&v115 objects:v123 count:16];
      }
      while (v61);
    }

    unint64_t v65 = [v58 sortedArrayWithOptions:1 usingComparator:&__block_literal_global_302];
    float v66 = v65;
    if (v65 && [v65 count])
    {
      unint64_t v67 = [v66 objectAtIndexedSubscript:0];
      unint64_t v68 = [v67 objectAtIndexedSubscript:0];
      [v68 floatValue];
      a3->var0[a3->var2] = 2046;
      float v69 = a3->var1;
      unint64_t v70 = a3->var2;
      a3->unint64_t var2 = v70 + 1;
      v69[v70] = v71;

      float v72 = [v66 objectAtIndexedSubscript:0];
      double v73 = [v72 objectAtIndexedSubscript:1];
      [v73 floatValue];
      a3->var0[a3->var2] = 2045;
      unint64_t v74 = a3->var1;
      unint64_t v75 = a3->var2;
      a3->unint64_t var2 = v75 + 1;
      v74[v75] = v76;

      float v77 = [v66 objectAtIndexedSubscript:0];
      float v78 = [v77 objectAtIndexedSubscript:2];
      [v78 floatValue];
      a3->var0[a3->var2] = 2044;
      unint64_t v79 = a3->var1;
      unint64_t v80 = a3->var2;
      a3->unint64_t var2 = v80 + 1;
      v79[v80] = v81;

      id v82 = [v66 objectAtIndexedSubscript:0];
      unint64_t v83 = [v82 objectAtIndexedSubscript:3];
      [v83 floatValue];
      a3->var0[a3->var2] = 2043;
      float v84 = a3->var1;
      unint64_t v85 = a3->var2;
      a3->unint64_t var2 = v85 + 1;
      v84[v85] = v86;

      uint64_t v87 = [v66 objectAtIndexedSubscript:0];
      unint64_t v88 = [v87 objectAtIndexedSubscript:4];
      [v88 floatValue];
      a3->var0[a3->var2] = 2042;
      unint64_t v89 = a3->var1;
      unint64_t v90 = a3->var2;
      a3->unint64_t var2 = v90 + 1;
      v89[v90] = v91;

      BOOL v92 = [v66 objectAtIndexedSubscript:0];
      BOOL v93 = [v92 objectAtIndexedSubscript:5];
      [v93 floatValue];
      a3->var0[a3->var2] = 2041;
      unint64_t v94 = a3->var1;
      unint64_t v95 = a3->var2;
      a3->unint64_t var2 = v95 + 1;
      v94[v95] = v96;

      unint64_t v97 = [v66 objectAtIndexedSubscript:0];
      unint64_t v98 = [v97 objectAtIndexedSubscript:6];
      [v98 floatValue];
      a3->var0[a3->var2] = 2040;
      unint64_t v99 = a3->var1;
      unint64_t v100 = a3->var2;
      a3->unint64_t var2 = v100 + 1;
      v99[v100] = v101;

      uint64_t v102 = [v66 objectAtIndexedSubscript:0];
      unint64_t v103 = [v102 objectAtIndexedSubscript:7];
      [v103 floatValue];
      a3->var0[a3->var2] = 2039;
      float v104 = a3->var1;
      unint64_t v105 = a3->var2;
      a3->unint64_t var2 = v105 + 1;
      v104[v105] = v106;
    }
  }
  uint64_t v107 = SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x66uLL);
  int v108 = v107;
  if (v107)
  {
    [v107 floatValue];
    a3->var0[a3->var2] = 2385;
    uint64_t v109 = a3->var1;
    unint64_t v110 = a3->var2;
    a3->unint64_t var2 = v110 + 1;
    v109[v110] = v111;
  }
  unint64_t v112 = SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x32uLL);
  if ([v112 isEqualToString:@"attachmentDomain"])
  {
    a3->var0[a3->var2] = 2386;
    v113 = a3->var1;
    unint64_t v114 = a3->var2;
    a3->unint64_t var2 = v114 + 1;
    v113[v114] = 1.0;
  }
}

uint64_t __38__PRSRankingItem_populateSMSFeatures___block_invoke(uint64_t a1, void *a2, void *a3)
{
  return -(*((uint64_t (**)(uint64_t, void *, void *))countsArrayComparator + 2))((uint64_t)countsArrayComparator, a2, a3);
}

uint64_t __38__PRSRankingItem_populateSMSFeatures___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  return -(*((uint64_t (**)(uint64_t, void *, void *))countsArrayComparator + 2))((uint64_t)countsArrayComparator, a2, a3);
}

- (void)inferDateBinsFromDates:(id)a3 intoBins:(int *)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  double Current = CFAbsoluteTimeGetCurrent();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v11), "timeIntervalSinceReferenceDate", (void)v16);
        double v13 = Current - v12;
        float v14 = a4;
        if (v13 >= 86400.0)
        {
          float v14 = a4 + 1;
          if (v13 >= 604800.0)
          {
            if (v13 >= 2592000.0) {
              uint64_t v15 = 3;
            }
            else {
              uint64_t v15 = 2;
            }
            float v14 = &a4[v15];
          }
        }
        ++*v14;
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }
}

- (void)populateTextContentDistanceMeasures:(PRSL2FeatureScoreInfo *)a3
{
  id v4 = SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x67uLL);
  if (v4)
  {
    id v22 = v4;
    uint64_t v5 = [v4 count];
    id v4 = v22;
    if (v5 >= 1)
    {
      id v6 = [v22 objectAtIndexedSubscript:0];
      a3->var0[a3->var2] = 2381;
      [v6 floatValue];
      var1 = a3->var1;
      unint64_t var2 = a3->var2;
      a3->unint64_t var2 = var2 + 1;
      var1[var2] = v9;

      id v4 = v22;
      if (v5 != 1)
      {
        uint64_t v10 = [v22 objectAtIndexedSubscript:1];
        a3->var0[a3->var2] = 2382;
        [v10 floatValue];
        uint64_t v11 = a3->var1;
        unint64_t v12 = a3->var2;
        a3->unint64_t var2 = v12 + 1;
        v11[v12] = v13;

        id v4 = v22;
        if ((unint64_t)v5 >= 3)
        {
          float v14 = [v22 objectAtIndexedSubscript:2];
          a3->var0[a3->var2] = 2383;
          [v14 floatValue];
          uint64_t v15 = a3->var1;
          unint64_t v16 = a3->var2;
          a3->unint64_t var2 = v16 + 1;
          v15[v16] = v17;

          id v4 = v22;
          if (v5 != 3)
          {
            long long v18 = [v22 objectAtIndexedSubscript:3];
            a3->var0[a3->var2] = 2384;
            [v18 floatValue];
            long long v19 = a3->var1;
            unint64_t v20 = a3->var2;
            a3->unint64_t var2 = v20 + 1;
            v19[v20] = v21;

            id v4 = v22;
          }
        }
      }
    }
  }
}

- (id)getMatchInfoDictionaryWithKeyboardLanguage:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v32 = a3;
  unint64_t v27 = self;
  id v4 = SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x4DuLL);
  uint64_t v5 = objc_opt_new();
  uint64_t v31 = objc_opt_new();
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v34;
    id v29 = v6;
    float v30 = v5;
    uint64_t v28 = *(void *)v34;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v34 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v33 + 1) + 8 * v10);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v12 = v11;
          if ((unint64_t)[v12 count] >= 2)
          {
            float v13 = [v12 objectAtIndexedSubscript:0];
            uint64_t v14 = [v5 objectForKeyedSubscript:v13];
            if (v14)
            {
              uint64_t v15 = (void *)v14;
              unint64_t v16 = [v31 objectForKeyedSubscript:v13];
            }
            else
            {
              uint64_t v15 = objc_opt_new();
              unint64_t v16 = objc_opt_new();
              [v5 setObject:v15 forKeyedSubscript:v13];
              [v31 setObject:v16 forKeyedSubscript:v13];
            }
            if ((unint64_t)objc_msgSend(v12, "count", v27) >= 2)
            {
              unint64_t v17 = 1;
              do
              {
                long long v18 = [v12 objectAtIndexedSubscript:v17];
                uint64_t v19 = [v18 length];

                unint64_t v20 = [v12 objectAtIndexedSubscript:v17];
                float v21 = [v20 substringToIndex:v19];

                if (v21 && ([v15 containsObject:v21] & 1) == 0)
                {
                  [v15 addObject:v21];
                  id v22 = [[SSTokenizedString alloc] initWithString:v21 locale:v32];
                  [v16 addObject:v22];
                }
                ++v17;
              }
              while (v17 < [v12 count]);
            }

            id v6 = v29;
            uint64_t v5 = v30;
            uint64_t v9 = v28;
          }
        }
        ++v10;
      }
      while (v10 != v8);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v8);
  }

  uint64_t v23 = [v31 copy];
  matchInfo = v27->_matchInfo;
  v27->_matchInfo = (NSDictionary *)v23;

  float v25 = v27->_matchInfo;
  return v25;
}

- (void)serializeAnonymousLogFeaturesToJSONWithWriter:(void *)a3 allowedAttributeSet:(id)a4
{
  uint64_t v147 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v7 setDateFormat:@"yyyy-MM-dd HH"];
  uint64_t v8 = [MEMORY[0x1E4F1CAF0] localTimeZone];
  long long v120 = v7;
  [v7 setTimeZone:v8];

  long long v140 = 0u;
  long long v141 = 0u;
  long long v138 = 0u;
  long long v139 = 0u;
  uint64_t v9 = [(PRSL2FeatureVector *)self->_L2FeatureVector topicalityAnonFeatDict];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v138 objects:v146 count:16];
  long long v121 = self;
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v139;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v139 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v138 + 1) + 8 * i);
        if ([v6 containsObject:v14])
        {
          [(PRSL2FeatureVector *)self->_L2FeatureVector topicalityAnonFeatDict];
          v16 = id v15 = v6;
          unint64_t v17 = [v16 objectForKeyedSubscript:v14];

          id v6 = v15;
          self = v121;
          id v18 = [NSString stringWithFormat:@"%@_MatchCounts", v14];
          json_writer_add_key((uint64_t)a3, (char *)[v18 UTF8String], 0xFFFFFFFFFFFFFFFFLL, 1);

          json_writer_begin_array((uint64_t)a3);
          json_writer_add_int64((uint64_t)a3, [v17 countAttributeQUTokenMatch]);
          json_writer_add_int64((uint64_t)a3, [v17 countAttributeUnigramMatch]);
          json_writer_add_int64((uint64_t)a3, [v17 countAttributeBigramMatch]);
          json_writer_add_int64((uint64_t)a3, [v17 countAttributeNgramMatch]);
          json_writer_add_int64((uint64_t)a3, [v17 countAttributeQUPrefixMatch]);
          json_writer_add_int64((uint64_t)a3, [v17 countAttributeUnigramPrefixMatch]);
          json_writer_add_int64((uint64_t)a3, [v17 countAttributeBigramPrefixMatch]);
          json_writer_add_int64((uint64_t)a3, [v17 countAttributeNgramPrefixMatch]);
          json_writer_end_array((uint64_t)a3);
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v138 objects:v146 count:16];
    }
    while (v11);
  }

  if (self->_embeddingSimilarity > 0.00000011921)
  {
    json_writer_add_key((uint64_t)a3, "EmbeddingSimilarity", 0xFFFFFFFFFFFFFFFFLL, 1);
    objc_msgSend(NSString, "stringWithFormat:", @"%0.4f", self->_embeddingSimilarity);
    id v19 = objc_claimAutoreleasedReturnValue();
    json_writer_add_string(a3, (char *)[v19 UTF8String], 0xFFFFFFFFFFFFFFFFLL, 1);
  }
  unint64_t v20 = [(PRSL2FeatureVector *)self->_L2FeatureVector bundleId];

  if (v20)
  {
    json_writer_add_key((uint64_t)a3, "bundleID", 0xFFFFFFFFFFFFFFFFLL, 1);
    id v21 = [(PRSL2FeatureVector *)self->_L2FeatureVector bundleId];
    json_writer_add_string(a3, (char *)[v21 UTF8String], 0xFFFFFFFFFFFFFFFFLL, 1);
  }
  if ([(PRSL2FeatureVector *)self->_L2FeatureVector textChunkTokenLength])
  {
    json_writer_add_key((uint64_t)a3, "textChunkTokenLength", 0xFFFFFFFFFFFFFFFFLL, 1);
    json_writer_add_int64((uint64_t)a3, [(PRSL2FeatureVector *)self->_L2FeatureVector textChunkTokenLength]);
  }
  [(PRSL2FeatureVector *)self->_L2FeatureVector kMDMailRead];
  if (v22 > 0.00000011921)
  {
    json_writer_add_key((uint64_t)a3, "MailRead", 0xFFFFFFFFFFFFFFFFLL, 1);
    uint64_t v23 = NSString;
    [(PRSL2FeatureVector *)self->_L2FeatureVector kMDMailRead];
    objc_msgSend(v23, "stringWithFormat:", @"%0.4f", v24);
    id v25 = objc_claimAutoreleasedReturnValue();
    json_writer_add_string(a3, (char *)[v25 UTF8String], 0xFFFFFFFFFFFFFFFFLL, 1);
  }
  [(PRSL2FeatureVector *)self->_L2FeatureVector kMDMailRepliedTo];
  if (v26 > 0.00000011921)
  {
    json_writer_add_key((uint64_t)a3, "MailRepliedTo", 0xFFFFFFFFFFFFFFFFLL, 1);
    unint64_t v27 = NSString;
    [(PRSL2FeatureVector *)self->_L2FeatureVector kMDMailRepliedTo];
    objc_msgSend(v27, "stringWithFormat:", @"%0.4f", v28);
    id v29 = objc_claimAutoreleasedReturnValue();
    json_writer_add_string(a3, (char *)[v29 UTF8String], 0xFFFFFFFFFFFFFFFFLL, 1);
  }
  [(PRSL2FeatureVector *)self->_L2FeatureVector kMDMailFlagged];
  if (v30 > 0.00000011921)
  {
    json_writer_add_key((uint64_t)a3, "MailFlagged", 0xFFFFFFFFFFFFFFFFLL, 1);
    uint64_t v31 = NSString;
    [(PRSL2FeatureVector *)self->_L2FeatureVector kMDMailFlagged];
    objc_msgSend(v31, "stringWithFormat:", @"%0.4f", v32);
    id v33 = objc_claimAutoreleasedReturnValue();
    json_writer_add_string(a3, (char *)[v33 UTF8String], 0xFFFFFFFFFFFFFFFFLL, 1);
  }
  if (self->_isMailCategoryHighImpact)
  {
    json_writer_add_key((uint64_t)a3, "MailCategoryHighImpact", 0xFFFFFFFFFFFFFFFFLL, 1);
    json_writer_add_uint32((uint64_t)a3, self->_isMailCategoryHighImpact);
  }
  if (self->_isMailCategoryDefault)
  {
    json_writer_add_key((uint64_t)a3, "MailCategoryDefault", 0xFFFFFFFFFFFFFFFFLL, 1);
    json_writer_add_uint32((uint64_t)a3, self->_isMailCategoryDefault);
  }
  if (self->_isMailCategoryTransactions)
  {
    json_writer_add_key((uint64_t)a3, "MailCategoryTransactions", 0xFFFFFFFFFFFFFFFFLL, 1);
    json_writer_add_uint32((uint64_t)a3, self->_isMailCategoryTransactions);
  }
  if (self->_isMailCategoryUpdates)
  {
    json_writer_add_key((uint64_t)a3, "MailCategoryUpdates", 0xFFFFFFFFFFFFFFFFLL, 1);
    json_writer_add_uint32((uint64_t)a3, self->_isMailCategoryUpdates);
  }
  if (self->_isMailCategoryPromotions)
  {
    json_writer_add_key((uint64_t)a3, "MailCategoryPromotions", 0xFFFFFFFFFFFFFFFFLL, 1);
    json_writer_add_uint32((uint64_t)a3, self->_isMailCategoryPromotions);
  }
  long long v34 = [(PRSL2FeatureVector *)self->_L2FeatureVector kMDMailReceivedDate];

  if (v34)
  {
    long long v35 = [(PRSL2FeatureVector *)self->_L2FeatureVector kMDMailReceivedDate];
    long long v36 = [v120 stringFromDate:v35];

    json_writer_add_key((uint64_t)a3, "MailReceivedDate", 0xFFFFFFFFFFFFFFFFLL, 1);
    id v37 = v36;
    json_writer_add_string(a3, (char *)[v37 UTF8String], 0xFFFFFFFFFFFFFFFFLL, 1);
  }
  uint64_t v38 = [(PRSL2FeatureVector *)self->_L2FeatureVector kMDMailLastViewedDate];

  if (v38)
  {
    unint64_t v39 = [(PRSL2FeatureVector *)self->_L2FeatureVector kMDMailLastViewedDate];
    float v40 = [v120 stringFromDate:v39];

    json_writer_add_key((uint64_t)a3, "MailLastViewedDate", 0xFFFFFFFFFFFFFFFFLL, 1);
    id v41 = v40;
    json_writer_add_string(a3, (char *)[v41 UTF8String], 0xFFFFFFFFFFFFFFFFLL, 1);
  }
  uint64_t v42 = [(PRSL2FeatureVector *)self->_L2FeatureVector kMDMailFreshnessDate];

  if (v42)
  {
    unint64_t v43 = [(PRSL2FeatureVector *)self->_L2FeatureVector kMDMailFreshnessDate];
    unint64_t v44 = [v120 stringFromDate:v43];

    json_writer_add_key((uint64_t)a3, "MailFreshnessDate", 0xFFFFFFFFFFFFFFFFLL, 1);
    id v45 = v44;
    json_writer_add_string(a3, (char *)[v45 UTF8String], 0xFFFFFFFFFFFFFFFFLL, 1);
  }
  long long v46 = [(PRSL2FeatureVector *)self->_L2FeatureVector kMDItemContentCreationDate];

  if (v46)
  {
    unint64_t v47 = [(PRSL2FeatureVector *)self->_L2FeatureVector kMDItemContentCreationDate];
    id v48 = [v120 stringFromDate:v47];

    json_writer_add_key((uint64_t)a3, "ItemContentCreationDate", 0xFFFFFFFFFFFFFFFFLL, 1);
    id v49 = v48;
    json_writer_add_string(a3, (char *)[v49 UTF8String], 0xFFFFFFFFFFFFFFFFLL, 1);
  }
  float v50 = [(PRSL2FeatureVector *)self->_L2FeatureVector kMDItemLastUsedDate];

  if (v50)
  {
    uint64_t v51 = [(PRSL2FeatureVector *)self->_L2FeatureVector kMDItemLastUsedDate];
    uint64_t v52 = [v120 stringFromDate:v51];

    json_writer_add_key((uint64_t)a3, "ItemLastUsedDate", 0xFFFFFFFFFFFFFFFFLL, 1);
    id v53 = v52;
    json_writer_add_string(a3, (char *)[v53 UTF8String], 0xFFFFFFFFFFFFFFFFLL, 1);
  }
  unint64_t v54 = [(PRSL2FeatureVector *)self->_L2FeatureVector kMDItemApplicationLastLaunchedDate];

  if (v54)
  {
    float v55 = [(PRSL2FeatureVector *)self->_L2FeatureVector kMDItemApplicationLastLaunchedDate];
    unint64_t v56 = [v120 stringFromDate:v55];

    json_writer_add_key((uint64_t)a3, "ItemApplicationLastLaunchedDate", 0xFFFFFFFFFFFFFFFFLL, 1);
    id v57 = v56;
    json_writer_add_string(a3, (char *)[v57 UTF8String], 0xFFFFFFFFFFFFFFFFLL, 1);
  }
  float v58 = [(PRSL2FeatureVector *)self->_L2FeatureVector kMDItemContentModificationDate];

  if (v58)
  {
    id v59 = [(PRSL2FeatureVector *)self->_L2FeatureVector kMDItemContentModificationDate];
    uint64_t v60 = [v120 stringFromDate:v59];

    json_writer_add_key((uint64_t)a3, "ItemContentModificationDate", 0xFFFFFFFFFFFFFFFFLL, 1);
    id v61 = v60;
    json_writer_add_string(a3, (char *)[v61 UTF8String], 0xFFFFFFFFFFFFFFFFLL, 1);
  }
  uint64_t v62 = [(PRSL2FeatureVector *)self->_L2FeatureVector kMDItemDueDate];

  if (v62)
  {
    uint64_t v63 = [(PRSL2FeatureVector *)self->_L2FeatureVector kMDItemDueDate];
    float v64 = [v120 stringFromDate:v63];

    json_writer_add_key((uint64_t)a3, "ItemDueDate", 0xFFFFFFFFFFFFFFFFLL, 1);
    id v65 = v64;
    json_writer_add_string(a3, (char *)[v65 UTF8String], 0xFFFFFFFFFFFFFFFFLL, 1);
  }
  float v66 = [(PRSL2FeatureVector *)self->_L2FeatureVector kMDItemCompletionDate];

  if (v66)
  {
    unint64_t v67 = [(PRSL2FeatureVector *)self->_L2FeatureVector kMDItemCompletionDate];
    unint64_t v68 = [v120 stringFromDate:v67];

    json_writer_add_key((uint64_t)a3, "ItemCompletionDate", 0xFFFFFFFFFFFFFFFFLL, 1);
    id v69 = v68;
    json_writer_add_string(a3, (char *)[v69 UTF8String], 0xFFFFFFFFFFFFFFFFLL, 1);
  }
  unint64_t v70 = [(PRSL2FeatureVector *)self->_L2FeatureVector kMDItemExpirationDate];

  if (v70)
  {
    float v71 = [(PRSL2FeatureVector *)self->_L2FeatureVector kMDItemExpirationDate];
    float v72 = [v120 stringFromDate:v71];

    json_writer_add_key((uint64_t)a3, "ItemExpirationDate", 0xFFFFFFFFFFFFFFFFLL, 1);
    id v73 = v72;
    json_writer_add_string(a3, (char *)[v73 UTF8String], 0xFFFFFFFFFFFFFFFFLL, 1);
  }
  unint64_t v74 = [(PRSL2FeatureVector *)self->_L2FeatureVector kMDItemStartDate];

  if (v74)
  {
    unint64_t v75 = [(PRSL2FeatureVector *)self->_L2FeatureVector kMDItemStartDate];
    float v76 = [v120 stringFromDate:v75];

    json_writer_add_key((uint64_t)a3, "ItemStartDate", 0xFFFFFFFFFFFFFFFFLL, 1);
    id v77 = v76;
    json_writer_add_string(a3, (char *)[v77 UTF8String], 0xFFFFFFFFFFFFFFFFLL, 1);
  }
  float v78 = [(PRSL2FeatureVector *)self->_L2FeatureVector kMDItemEndDate];

  if (v78)
  {
    unint64_t v79 = [(PRSL2FeatureVector *)self->_L2FeatureVector kMDItemEndDate];
    unint64_t v80 = [v120 stringFromDate:v79];

    json_writer_add_key((uint64_t)a3, "ItemEndDate", 0xFFFFFFFFFFFFFFFFLL, 1);
    id v81 = v80;
    json_writer_add_string(a3, (char *)[v81 UTF8String], 0xFFFFFFFFFFFFFFFFLL, 1);
  }
  id v82 = [(PRSL2FeatureVector *)self->_L2FeatureVector kMDItemContentType];

  if (v82)
  {
    json_writer_add_key((uint64_t)a3, "ItemContentType", 0xFFFFFFFFFFFFFFFFLL, 1);
    id v83 = [(PRSL2FeatureVector *)self->_L2FeatureVector kMDItemContentType];
    json_writer_add_string(a3, (char *)[v83 UTF8String], 0xFFFFFFFFFFFFFFFFLL, 1);
  }
  float v84 = [(PRSL2FeatureVector *)self->_L2FeatureVector kMDItemUsedDates];
  uint64_t v85 = [v84 count];

  if (v85)
  {
    json_writer_add_key((uint64_t)a3, "ItemUsedDates", 0xFFFFFFFFFFFFFFFFLL, 1);
    json_writer_begin_array((uint64_t)a3);
    long long v136 = 0u;
    long long v137 = 0u;
    long long v134 = 0u;
    long long v135 = 0u;
    float v86 = [(PRSL2FeatureVector *)self->_L2FeatureVector kMDItemUsedDates];
    uint64_t v87 = [v86 countByEnumeratingWithState:&v134 objects:v145 count:16];
    if (v87)
    {
      uint64_t v88 = v87;
      uint64_t v89 = 0;
      uint64_t v90 = *(void *)v135;
LABEL_61:
      uint64_t v91 = 0;
      while (1)
      {
        if (*(void *)v135 != v90) {
          objc_enumerationMutation(v86);
        }
        id v92 = [v120 stringFromDate:*(void *)(*((void *)&v134 + 1) + 8 * v91)];
        json_writer_add_string(a3, (char *)[v92 UTF8String], 0xFFFFFFFFFFFFFFFFLL, 1);

        if ((unint64_t)(v89 + v91 + 1) > 0x13) {
          break;
        }
        if (v88 == ++v91)
        {
          uint64_t v88 = [v86 countByEnumeratingWithState:&v134 objects:v145 count:16];
          v89 += v91;
          if (v88) {
            goto LABEL_61;
          }
          break;
        }
      }
    }

    json_writer_end_array((uint64_t)a3);
    self = v121;
  }
  BOOL v93 = [(PRSL2FeatureVector *)self->_L2FeatureVector kMDItemRecentSpotlightEngagementDatesNonUnique];
  uint64_t v94 = [v93 count];

  if (v94)
  {
    json_writer_add_key((uint64_t)a3, "ItemRecentSpotlightEngagementDatesNonUnique", 0xFFFFFFFFFFFFFFFFLL, 1);
    json_writer_begin_array((uint64_t)a3);
    long long v132 = 0u;
    long long v133 = 0u;
    long long v130 = 0u;
    long long v131 = 0u;
    unint64_t v95 = [(PRSL2FeatureVector *)self->_L2FeatureVector kMDItemRecentSpotlightEngagementDatesNonUnique];
    uint64_t v96 = [v95 countByEnumeratingWithState:&v130 objects:v144 count:16];
    if (v96)
    {
      uint64_t v97 = v96;
      uint64_t v98 = 0;
      uint64_t v99 = *(void *)v131;
LABEL_71:
      uint64_t v100 = 0;
      while (1)
      {
        if (*(void *)v131 != v99) {
          objc_enumerationMutation(v95);
        }
        id v101 = [v120 stringFromDate:*(void *)(*((void *)&v130 + 1) + 8 * v100)];
        json_writer_add_string(a3, (char *)[v101 UTF8String], 0xFFFFFFFFFFFFFFFFLL, 0);

        if ((unint64_t)(v98 + v100 + 1) > 0x13) {
          break;
        }
        if (v97 == ++v100)
        {
          uint64_t v97 = [v95 countByEnumeratingWithState:&v130 objects:v144 count:16];
          v98 += v100;
          if (v97) {
            goto LABEL_71;
          }
          break;
        }
      }
    }

    json_writer_end_array((uint64_t)a3);
    self = v121;
  }
  uint64_t v102 = [(PRSL2FeatureVector *)self->_L2FeatureVector kMDItemRecentOutOfSpotlightEngagementDates];
  uint64_t v103 = [v102 count];

  if (v103)
  {
    json_writer_add_key((uint64_t)a3, "ItemRecentOutOfSpotlightEngagementDates", 0xFFFFFFFFFFFFFFFFLL, 1);
    json_writer_begin_array((uint64_t)a3);
    long long v128 = 0u;
    long long v129 = 0u;
    long long v126 = 0u;
    long long v127 = 0u;
    float v104 = [(PRSL2FeatureVector *)self->_L2FeatureVector kMDItemRecentOutOfSpotlightEngagementDates];
    uint64_t v105 = [v104 countByEnumeratingWithState:&v126 objects:v143 count:16];
    if (v105)
    {
      uint64_t v106 = v105;
      uint64_t v107 = 0;
      uint64_t v108 = *(void *)v127;
LABEL_81:
      uint64_t v109 = 0;
      while (1)
      {
        if (*(void *)v127 != v108) {
          objc_enumerationMutation(v104);
        }
        id v110 = [v120 stringFromDate:*(void *)(*((void *)&v126 + 1) + 8 * v109)];
        json_writer_add_string(a3, (char *)[v110 UTF8String], 0xFFFFFFFFFFFFFFFFLL, 1);

        if ((unint64_t)(v107 + v109 + 1) > 0x13) {
          break;
        }
        if (v106 == ++v109)
        {
          uint64_t v106 = [v104 countByEnumeratingWithState:&v126 objects:v143 count:16];
          v107 += v109;
          if (v106) {
            goto LABEL_81;
          }
          break;
        }
      }
    }

    json_writer_end_array((uint64_t)a3);
    self = v121;
  }
  float v111 = [(PRSL2FeatureVector *)self->_L2FeatureVector kMDItemRecentAppSearchEngagementDates];
  uint64_t v112 = [v111 count];

  if (v112)
  {
    json_writer_add_key((uint64_t)a3, "ItemRecentAppSearchEngagementDates", 0xFFFFFFFFFFFFFFFFLL, 1);
    json_writer_begin_array((uint64_t)a3);
    long long v124 = 0u;
    long long v125 = 0u;
    long long v122 = 0u;
    long long v123 = 0u;
    v113 = [(PRSL2FeatureVector *)self->_L2FeatureVector kMDItemRecentAppSearchEngagementDates];
    uint64_t v114 = [v113 countByEnumeratingWithState:&v122 objects:v142 count:16];
    if (v114)
    {
      uint64_t v115 = v114;
      uint64_t v116 = 0;
      uint64_t v117 = *(void *)v123;
LABEL_91:
      uint64_t v118 = 0;
      while (1)
      {
        if (*(void *)v123 != v117) {
          objc_enumerationMutation(v113);
        }
        id v119 = [v120 stringFromDate:*(void *)(*((void *)&v122 + 1) + 8 * v118)];
        json_writer_add_string(a3, (char *)[v119 UTF8String], 0xFFFFFFFFFFFFFFFFLL, 1);

        if ((unint64_t)(v116 + v118 + 1) > 0x13) {
          break;
        }
        if (v115 == ++v118)
        {
          uint64_t v115 = [v113 countByEnumeratingWithState:&v122 objects:v142 count:16];
          v116 += v118;
          if (v115) {
            goto LABEL_91;
          }
          break;
        }
      }
    }

    json_writer_end_array((uint64_t)a3);
  }
}

- (void)populateAnonymousLogFeaturesWithEvaluator:(id)a3 currentTime:(double)a4 allowedAttributeSet:(id)a5
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = [v7 language];
  uint64_t v10 = [(PRSRankingItem *)self getMatchInfoDictionaryWithKeyboardLanguage:v9];

  uint64_t v11 = [v7 itemQPQUOutputTokenInfo];
  id v81 = [v11 valueForKey:@"kQPQUOutputToken"];

  uint64_t v12 = [v7 itemQPQUOutputTokenInfo];
  unint64_t v79 = [v12 valueForKey:@"kQPQUOutputTokenArgLabels"];

  float v72 = v7;
  float v13 = [v7 itemQPQUOutputTokenInfo];
  uint64_t v70 = [v13 valueForKey:@"kQPQUOutputTokenArgScores"];

  long long v89 = 0u;
  long long v90 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  id v14 = v10;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v87 objects:v92 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v88;
    unint64_t v75 = self;
    id v76 = v8;
    uint64_t v73 = *(void *)v88;
    id v74 = v14;
    do
    {
      uint64_t v18 = 0;
      uint64_t v77 = v16;
      do
      {
        if (*(void *)v88 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v87 + 1) + 8 * v18);
        if (v19 && objc_msgSend(v8, "containsObject:", *(void *)(*((void *)&v87 + 1) + 8 * v18), v70))
        {
          uint64_t v78 = v18;
          unint64_t v20 = [(PRSL2FeatureVector *)self->_L2FeatureVector topicalityAnonFeatDict];
          id v21 = [v20 objectForKeyedSubscript:v19];

          if (!v21)
          {
            id v21 = objc_alloc_init(TopicalityAnonymousFeaturesForAttribute);
            float v22 = [(PRSL2FeatureVector *)self->_L2FeatureVector topicalityAnonFeatDict];
            [v22 setObject:v21 forKeyedSubscript:v19];
          }
          uint64_t v23 = [v14 objectForKeyedSubscript:v19];
          long long v83 = 0u;
          long long v84 = 0u;
          long long v85 = 0u;
          long long v86 = 0u;
          id obj = v23;
          uint64_t v24 = [obj countByEnumeratingWithState:&v83 objects:v91 count:16];
          if (v24)
          {
            uint64_t v25 = v24;
            uint64_t v26 = *(void *)v84;
            do
            {
              for (uint64_t i = 0; i != v25; ++i)
              {
                if (*(void *)v84 != v26) {
                  objc_enumerationMutation(obj);
                }
                float v28 = *(void **)(*((void *)&v83 + 1) + 8 * i);
                id v29 = [v28 original];
                uint64_t v30 = [v29 length];
                if (v30)
                {
                  unint64_t v31 = v30;
                  unint64_t v32 = 0;
                  unint64_t v33 = v30 - 1;
                  do
                  {
                    while (1)
                    {
                      int v34 = [v29 characterAtIndex:v32];
                      if (v32 >= v33 || v34 != 92) {
                        break;
                      }
                      v32 += 2;
                      if (v32 >= v31) {
                        goto LABEL_24;
                      }
                    }
                    int v35 = [v29 characterAtIndex:v32++];
                  }
                  while (v32 < v31);
                  int v36 = v35;

                  if (v36 != 42)
                  {
                    BOOL v38 = 0;
                    goto LABEL_26;
                  }
                  id v37 = [v28 original];
                  BOOL v38 = (unint64_t)[v37 length] > 1;
                }
                else
                {
LABEL_24:
                  BOOL v38 = 0;
                  id v37 = v29;
                }

LABEL_26:
                id v39 = (id)[v28 tokenize];
                if (v38
                  && ([v28 tokens],
                      float v40 = objc_claimAutoreleasedReturnValue(),
                      unint64_t v41 = [v40 count],
                      v40,
                      v41 >= 2))
                {
                  uint64_t v42 = [v28 tokens];
                  unint64_t v43 = [v42 count] - 1;
                }
                else
                {
                  uint64_t v42 = [v28 tokens];
                  unint64_t v43 = [v42 count];
                }

                if (v43 == 2)
                {
                  if (v38) {
                    [(TopicalityAnonymousFeaturesForAttribute *)v21 setCountAttributeBigramPrefixMatch:[(TopicalityAnonymousFeaturesForAttribute *)v21 countAttributeBigramPrefixMatch]+ 1];
                  }
                  else {
                    [(TopicalityAnonymousFeaturesForAttribute *)v21 setCountAttributeBigramMatch:[(TopicalityAnonymousFeaturesForAttribute *)v21 countAttributeBigramMatch]+ 1];
                  }
                }
                else if (v43 == 1)
                {
                  if (v38)
                  {
                    [(TopicalityAnonymousFeaturesForAttribute *)v21 setCountAttributeUnigramPrefixMatch:[(TopicalityAnonymousFeaturesForAttribute *)v21 countAttributeUnigramPrefixMatch]+ 1];
                    if (!v81) {
                      continue;
                    }
                    unint64_t v44 = [v28 original];
                    id v45 = [v28 original];
                    long long v46 = objc_msgSend(v44, "substringToIndex:", objc_msgSend(v45, "length") - 1);
                  }
                  else
                  {
                    [(TopicalityAnonymousFeaturesForAttribute *)v21 setCountAttributeUnigramMatch:[(TopicalityAnonymousFeaturesForAttribute *)v21 countAttributeUnigramMatch]+ 1];
                    if (!v81) {
                      continue;
                    }
                    long long v46 = [v28 original];
                  }
                  unint64_t v47 = [v81 indexOfObject:v46];
                  if (v47 != 0x7FFFFFFFFFFFFFFFLL)
                  {
                    unint64_t v48 = v47;
                    if ([v79 count] > v47)
                    {
                      id v49 = [v79 objectAtIndexedSubscript:v48];
                      char v50 = [v49 isEqualToString:@"ARG_UNSPECIFIED"];

                      if ((v50 & 1) == 0)
                      {
                        if (v38) {
                          [(TopicalityAnonymousFeaturesForAttribute *)v21 setCountAttributeQUPrefixMatch:[(TopicalityAnonymousFeaturesForAttribute *)v21 countAttributeQUPrefixMatch]+ 1];
                        }
                        else {
                          [(TopicalityAnonymousFeaturesForAttribute *)v21 setCountAttributeQUTokenMatch:[(TopicalityAnonymousFeaturesForAttribute *)v21 countAttributeQUTokenMatch]+ 1];
                        }
                      }
                    }
                  }
                }
                else if (v43 >= 3)
                {
                  if (v38) {
                    [(TopicalityAnonymousFeaturesForAttribute *)v21 setCountAttributeNgramPrefixMatch:[(TopicalityAnonymousFeaturesForAttribute *)v21 countAttributeNgramPrefixMatch]+ 1];
                  }
                  else {
                    [(TopicalityAnonymousFeaturesForAttribute *)v21 setCountAttributeNgramMatch:[(TopicalityAnonymousFeaturesForAttribute *)v21 countAttributeNgramMatch]+ 1];
                  }
                }
              }
              uint64_t v25 = [obj countByEnumeratingWithState:&v83 objects:v91 count:16];
            }
            while (v25);
          }

          self = v75;
          id v8 = v76;
          uint64_t v17 = v73;
          id v14 = v74;
          uint64_t v16 = v77;
          uint64_t v18 = v78;
        }
        ++v18;
      }
      while (v18 != v16);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v87 objects:v92 count:16];
    }
    while (v16);
  }

  [(PRSL2FeatureVector *)self->_L2FeatureVector setTextChunkTokenLength:0];
  uint64_t v51 = SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x110uLL);
  if (v51)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PRSL2FeatureVector setTextChunkTokenLength:](self->_L2FeatureVector, "setTextChunkTokenLength:", [v51 integerValue]);
    }
  }
  int v82 = 0;
  -[PRSL2FeatureVector setKMDMailRead:](self->_L2FeatureVector, "setKMDMailRead:", 0.0, v70);
  if (SSCompactRankingAttrsGetFloat((uint64_t)self->_attributes, 0x162uLL, &v82))
  {
    LODWORD(v52) = v82;
    [(PRSL2FeatureVector *)self->_L2FeatureVector setKMDMailRead:v52];
  }
  [(PRSL2FeatureVector *)self->_L2FeatureVector setKMDMailRepliedTo:0.0];
  if (SSCompactRankingAttrsGetFloat((uint64_t)self->_attributes, 0x163uLL, &v82))
  {
    LODWORD(v53) = v82;
    [(PRSL2FeatureVector *)self->_L2FeatureVector setKMDMailRepliedTo:v53];
  }
  [(PRSL2FeatureVector *)self->_L2FeatureVector setKMDMailFlagged:0.0];
  if (SSCompactRankingAttrsGetFloat((uint64_t)self->_attributes, 0x161uLL, &v82))
  {
    LODWORD(v54) = v82;
    [(PRSL2FeatureVector *)self->_L2FeatureVector setKMDMailFlagged:v54];
  }
  float v55 = SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x15EuLL);
  [(PRSL2FeatureVector *)self->_L2FeatureVector setKMDMailReceivedDate:v55];

  unint64_t v56 = SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x15FuLL);
  [(PRSL2FeatureVector *)self->_L2FeatureVector setKMDMailLastViewedDate:v56];

  id v57 = [(PRSRankingItem *)self mailFreshnessDate];
  [(PRSL2FeatureVector *)self->_L2FeatureVector setKMDMailFreshnessDate:v57];

  float v58 = SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x20uLL);
  [(PRSL2FeatureVector *)self->_L2FeatureVector setKMDItemContentCreationDate:v58];

  id v59 = SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 9uLL);
  [(PRSL2FeatureVector *)self->_L2FeatureVector setKMDItemLastUsedDate:v59];

  uint64_t v60 = SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x15DuLL);
  [(PRSL2FeatureVector *)self->_L2FeatureVector setKMDItemApplicationLastLaunchedDate:v60];

  id v61 = SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x19uLL);
  [(PRSL2FeatureVector *)self->_L2FeatureVector setKMDItemContentModificationDate:v61];

  uint64_t v62 = SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x1DuLL);
  [(PRSL2FeatureVector *)self->_L2FeatureVector setKMDItemDueDate:v62];

  uint64_t v63 = SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x1CuLL);
  [(PRSL2FeatureVector *)self->_L2FeatureVector setKMDItemCompletionDate:v63];

  float v64 = SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x24uLL);
  [(PRSL2FeatureVector *)self->_L2FeatureVector setKMDItemExpirationDate:v64];

  id v65 = SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x11uLL);
  [(PRSL2FeatureVector *)self->_L2FeatureVector setKMDItemStartDate:v65];

  float v66 = SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x12uLL);
  [(PRSL2FeatureVector *)self->_L2FeatureVector setKMDItemEndDate:v66];

  unint64_t v67 = SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0);
  [(PRSL2FeatureVector *)self->_L2FeatureVector setKMDItemContentType:v67];

  unint64_t v68 = SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x3CuLL);
  [(PRSL2FeatureVector *)self->_L2FeatureVector setKMDItemUsedDates:v68];

  id v69 = SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x6FuLL);
  [(PRSL2FeatureVector *)self->_L2FeatureVector setKMDItemRecentSpotlightEngagementDatesNonUnique:v69];
}

- (void)populateOtherFeatures:(PRSL2FeatureScoreInfo *)a3 withEvaluator:(id)a4 currentTime:(double)a5 quParsedEvaluator:(id)a6 queryID:(int64_t)a7 isSearchToolClient:(BOOL)a8 quParsedPersonEvaluator:(id)a9 quParsedArgSearchTermsEvaluator:(id)a10
{
  unsigned int v11 = a8;
  v425[7] = *MEMORY[0x1E4F143B8];
  id v15 = a4;
  id v16 = a6;
  id v17 = a9;
  id v18 = a10;
  uint64_t v19 = self->_sectionBundleIdentifier;
  v389 = v19;
  if (v19)
  {
    unint64_t v20 = v19;
  }
  else
  {
    SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0xAuLL);
    unint64_t v20 = (NSString *)(id)objc_claimAutoreleasedReturnValue();
  }
  [(PRSL2FeatureVector *)self->_L2FeatureVector setBundleId:v20];
  id v21 = +[PRSL2FeatureVector allowedAttributeSetForAnonPipeline];
  [(PRSRankingItem *)self populateAnonymousLogFeaturesWithEvaluator:v15 currentTime:v21 allowedAttributeSet:a5];

  if (!self->_retrievalType)
  {
    SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x69uLL);
    float v22 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    retrievalType = self->_retrievalType;
    self->_retrievalType = v22;
  }
  self->_itemSparseMatchStrengthType = [(PRSRankingItem *)self itemSparseMatchStrengthTypeWithEvaluator:v15];
  [(PRSRankingItem *)self computeCalibratedSparseScore];
  self->_pommesCalibratedL1Score = v24;
  if (([(NSNumber *)self->_retrievalType integerValue] & 2) != 0)
  {
    uint64_t v25 = SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x68uLL);
    self->_embeddingSimilarity = sqDistancesToCosine(v25);
    if ((SSSectionIsSyndicatedPhotos(self->_sectionBundleIdentifier) & 1) == 0
      && SSEnableSearchToolCleanSlate(v11)
      && SSEnableTextSemanticSearchCalibration())
    {
      uint64_t v26 = SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x111uLL);
      unint64_t v27 = (_CSEmbedding *)[objc_alloc(MEMORY[0x1E4F238A8]) initWithDictionaries:v26];
      embedding = self->_embedding;
      self->_embedding = v27;
    }
  }
  unsigned int v387 = v11;
  v397 = v20;
  if (self->_isInternal)
  {
    id v29 = SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0xAuLL);
    if (!v29) {
      goto LABEL_29;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      getpid();
      SimulateCrash();
    }
    if ([(NSString *)self->_sectionBundleIdentifier isEqualToString:v29]) {
      goto LABEL_29;
    }
    v425[0] = @"com.apple.CloudDocs.MobileDocumentsFileProvider";
    v425[1] = @"com.apple.FileProvider.LocalStorage";
    v425[2] = @"com.apple.DocumentsApp";
    v425[3] = @"com.apple.searchd.syndicatedLinks";
    v425[4] = @"com.apple.shortcuts";
    v425[5] = @"com.apple.MobileSMS";
    v425[6] = @"com.apple.mobilemail";
    uint64_t v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v425 count:7];
    if ([v30 containsObject:self->_sectionBundleIdentifier]) {
      goto LABEL_28;
    }
    if (SSSectionIsSyndicatedPhotos(self->_sectionBundleIdentifier))
    {
      if (([v29 isEqualToString:@"com.apple.MobileSMS"] & 1) != 0
        || ([v29 isEqualToString:@"com.apple.mobilenotes"] & 1) != 0
        || ([v29 isEqualToString:@"com.apple.DocumentsApp"] & 1) != 0
        || ([v29 isEqualToString:@"com.apple.FileProvider.LocalStorage"] & 1) != 0
        || ([v29 isEqualToString:@"com.apple.CloudDocs.MobileDocumentsFileProvider"] & 1) != 0)
      {
        goto LABEL_28;
      }
      char v384 = [v29 isEqualToString:@"com.apple.mobileslideshow"];

      if (v384) {
        goto LABEL_29;
      }
    }
    else
    {
    }
    getpid();
    uint64_t v30 = [NSString stringWithFormat:@"section bundle not equal to compact value %@ and %@", self->_sectionBundleIdentifier, v29];
    SimulateCrash();
LABEL_28:

LABEL_29:
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ![(NSString *)v397 isEqualToString:@"com.apple.application"])
  {
    id v31 = v18;
    unint64_t v32 = SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0xBuLL);
    unint64_t v33 = SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0xEuLL);
    int v34 = SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0);
    int v35 = v34;
    if (v32 && v33 && ([v34 hasPrefix:@"com.apple.siri."] & 1) == 0)
    {
      id v36 = v15;
      id v37 = v17;
      a3->var0[a3->var2] = 325;
      var1 = a3->var1;
      unint64_t var2 = a3->var2;
      a3->unint64_t var2 = var2 + 1;
      var1[var2] = 1.0;
      float v40 = SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x43uLL);
      if (v40)
      {
        *(void *)buf = 0;
        *(void *)&buf[8] = 0;
        [(PRSRankingItem *)self inferDateBinsFromDates:v40 intoBins:buf];
        float v41 = (float)*(int *)buf;
        a3->var0[a3->var2] = 71;
        uint64_t v42 = a3->var1;
        unint64_t v43 = a3->var2;
        a3->unint64_t var2 = v43 + 1;
        v42[v43] = v41;
        float v44 = (float)*(int *)&buf[4];
        a3->var0[v43 + 1] = 70;
        id v45 = a3->var1;
        unint64_t v46 = a3->var2;
        a3->unint64_t var2 = v46 + 1;
        v45[v46] = v44;
        float v47 = (float)*(int *)&buf[8];
        a3->var0[v46 + 1] = 69;
        unint64_t v48 = a3->var1;
        unint64_t v49 = a3->var2;
        a3->unint64_t var2 = v49 + 1;
        v48[v49] = v47;
        float v50 = (float)*(int *)&buf[12];
        a3->var0[v49 + 1] = 68;
        uint64_t v51 = a3->var1;
        unint64_t v52 = a3->var2;
        a3->unint64_t var2 = v52 + 1;
        v51[v52] = v50;
      }

      id v17 = v37;
      id v15 = v36;
    }

    id v18 = v31;
  }
  a3->var0[a3->var2] = 372;
  double v53 = a3->var1;
  unint64_t v54 = a3->var2;
  unint64_t v55 = v54 + 1;
  a3->unint64_t var2 = v54 + 1;
  v53[v54] = 0.0;
  uint64_t v56 = *(void *)self->_inputToModelScore;
  uint64_t v57 = *(void *)&self->_inputToModelScore[8];
  int v58 = 0;
  int v59 = 0;
  a3->var0[v55] = 391;
  uint64_t v60 = a3->var1;
  unint64_t v61 = a3->var2;
  float v62 = 0.0;
  unint64_t v63 = v61 + 1;
  a3->unint64_t var2 = v61 + 1;
  float v64 = 0.0;
  float v65 = 0.0;
  v60[v61] = (float)*(unsigned long long *)&v56;
  float v66 = 0.0;
  float v67 = 0.0;
  float v68 = 0.0;
  unint64_t v69 = *(void *)&self->_indexScore[8];
  float v70 = 0.0;
  float v71 = 0.0;
  float v72 = 0.0;
  float v73 = 0.0;
  float v74 = 0.0;
  float v75 = 0.0;
  unint64_t v76 = *(void *)self->_indexScore;
  float v394 = 0.0;
  float v395 = 0.0;
  float v392 = 0.0;
  float v77 = 0.0;
  float v78 = 0.0;
  float v79 = 0.0;
  float v80 = 0.0;
  do
  {
    if ((v58 - 89) >= 6)
    {
      if ((v58 & 0x40) != 0) {
        unint64_t v81 = v69 >> v58;
      }
      else {
        unint64_t v81 = ((2 * v69) << ~(_BYTE)v58) | (v76 >> v58);
      }
      if (v81) {
        float v82 = 1.0;
      }
      else {
        float v82 = 0.0;
      }
      if (v58 <= 73)
      {
        float v83 = v82;
        switch(v58)
        {
          case ' ':
            break;
          case '""':
            float v83 = v77;
            float v392 = v82;
            break;
          case '#':
            float v80 = v82;
            goto LABEL_60;
          case '$':
            float v83 = v77;
            float v395 = v82;
            break;
          case '%':
            float v79 = v82;
            goto LABEL_60;
          case '&':
            float v83 = v77;
            float v75 = v82;
            break;
          case '\'':
            float v78 = v82;
            goto LABEL_60;
          case '/':
            float v83 = v77;
            float v394 = v82;
            break;
          default:
LABEL_60:
            float v83 = v77;
            break;
        }
      }
      else
      {
        switch(v58)
        {
          case 'J':
            float v83 = v77;
            float v74 = v82;
            break;
          case 'K':
          case 'L':
          case 'M':
          case 'N':
          case 'O':
          case 'P':
            goto LABEL_60;
          case 'Q':
            float v83 = v77;
            float v73 = v82;
            break;
          case 'R':
            float v83 = v77;
            float v72 = v82;
            break;
          case 'S':
            float v83 = v77;
            float v71 = v82;
            break;
          case 'T':
            float v83 = v77;
            float v70 = v82;
            break;
          case 'U':
            float v83 = v77;
            float v68 = v82;
            break;
          case 'V':
            float v83 = v77;
            float v67 = v82;
            break;
          case 'W':
            float v83 = v77;
            float v66 = v82;
            break;
          case 'X':
            float v83 = v77;
            float v65 = v82;
            break;
          default:
            if (v58 == 104)
            {
              float v83 = v77;
              float v64 = v82;
            }
            else
            {
              if (v58 != 114) {
                goto LABEL_60;
              }
              float v83 = v77;
              float v62 = v82;
            }
            break;
        }
      }
      a3->var0[v63] = sRankingBitsFeatures[v59];
      long long v84 = a3->var1;
      unint64_t v85 = a3->var2;
      unint64_t v63 = v85 + 1;
      a3->unint64_t var2 = v85 + 1;
      v84[v85] = v82;
      ++v59;
      float v77 = v83;
    }
    ++v58;
  }
  while (v58 != 123);
  float v86 = 1.0;
  if ((v69 & 0x800000000000000) == 0) {
    float v86 = 0.0;
  }
  a3->var0[v63] = 2392;
  long long v87 = a3->var1;
  unint64_t v88 = a3->var2;
  a3->unint64_t var2 = v88 + 1;
  v87[v88] = v86;
  unint64_t bundleIDType = self->_bundleIDType;
  if ((bundleIDType & 0x10) != 0)
  {
    a3->var0[v88 + 1] = 6;
    long long v90 = a3->var1;
    unint64_t v91 = a3->var2;
    a3->unint64_t var2 = v91 + 1;
    v90[v91] = 0.0;
    a3->var0[v91 + 1] = 8;
    id v92 = a3->var1;
    unint64_t v93 = a3->var2;
    a3->unint64_t var2 = v93 + 1;
    v92[v93] = 0.0;
    a3->var0[v93 + 1] = 10;
    uint64_t v94 = a3->var1;
    unint64_t v95 = a3->var2;
    a3->unint64_t var2 = v95 + 1;
    v94[v95] = 0.0;
    a3->var0[v95 + 1] = 2338;
    uint64_t v96 = a3->var1;
    unint64_t v97 = a3->var2;
    a3->unint64_t var2 = v97 + 1;
    v96[v97] = v78;
    a3->var0[v97 + 1] = 2339;
    uint64_t v98 = a3->var1;
    unint64_t v99 = a3->var2;
    a3->unint64_t var2 = v99 + 1;
    v98[v99] = v79;
    a3->var0[v99 + 1] = 2340;
    uint64_t v100 = a3->var1;
    unint64_t v101 = a3->var2;
    a3->unint64_t var2 = v101 + 1;
    v100[v101] = v80;
    a3->var0[v101 + 1] = 1972;
    uint64_t v102 = a3->var1;
    unint64_t v103 = a3->var2;
    a3->unint64_t var2 = v103 + 1;
    v102[v103] = 0.0;
    a3->var0[v103 + 1] = 1973;
    float v104 = a3->var1;
    unint64_t v105 = a3->var2;
    a3->unint64_t var2 = v105 + 1;
    v104[v105] = 0.0;
    a3->var0[v105 + 1] = 1974;
    uint64_t v106 = a3->var1;
    unint64_t v107 = a3->var2;
    a3->unint64_t var2 = v107 + 1;
    v106[v107] = 0.0;
    a3->var0[v107 + 1] = 1975;
    uint64_t v108 = a3->var1;
    unint64_t v109 = a3->var2;
    a3->unint64_t var2 = v109 + 1;
    v108[v109] = 0.0;
    a3->var0[v109 + 1] = 1976;
    id v110 = a3->var1;
    unint64_t v111 = a3->var2;
    a3->unint64_t var2 = v111 + 1;
    v110[v111] = 0.0;
    a3->var0[v111 + 1] = 1977;
    uint64_t v112 = a3->var1;
    unint64_t v113 = a3->var2;
    a3->unint64_t var2 = v113 + 1;
    v112[v113] = 0.0;
    a3->var0[v113 + 1] = 1978;
    uint64_t v114 = a3->var1;
    unint64_t v115 = a3->var2;
    a3->unint64_t var2 = v115 + 1;
    v114[v115] = 0.0;
    a3->var0[v115 + 1] = 1979;
    uint64_t v116 = a3->var1;
    unint64_t v117 = a3->var2;
    a3->unint64_t var2 = v117 + 1;
    v116[v117] = 0.0;
    a3->var0[v117 + 1] = 2346;
    uint64_t v118 = a3->var1;
    unint64_t v119 = a3->var2;
    a3->unint64_t var2 = v119 + 1;
    v118[v119] = v73;
    a3->var0[v119 + 1] = 2347;
    long long v120 = a3->var1;
    unint64_t v121 = a3->var2;
    a3->unint64_t var2 = v121 + 1;
    v120[v121] = v72;
    a3->var0[v121 + 1] = 2348;
    long long v122 = a3->var1;
    unint64_t v123 = a3->var2;
    a3->unint64_t var2 = v123 + 1;
    v122[v123] = v71;
    a3->var0[v123 + 1] = 2349;
    long long v124 = a3->var1;
    unint64_t v125 = a3->var2;
    a3->unint64_t var2 = v125 + 1;
    v124[v125] = v70;
    a3->var0[v125 + 1] = 2350;
    long long v126 = a3->var1;
    unint64_t v127 = a3->var2;
    a3->unint64_t var2 = v127 + 1;
    v126[v127] = v68;
    a3->var0[v127 + 1] = 2351;
    long long v128 = a3->var1;
    unint64_t v129 = a3->var2;
    a3->unint64_t var2 = v129 + 1;
    v128[v129] = v67;
    a3->var0[v129 + 1] = 2352;
    long long v130 = a3->var1;
    unint64_t v131 = a3->var2;
    a3->unint64_t var2 = v131 + 1;
    v130[v131] = v66;
    a3->var0[v131 + 1] = 2353;
    long long v132 = a3->var1;
    unint64_t v133 = a3->var2;
    a3->unint64_t var2 = v133 + 1;
    v132[v133] = v65;
    unint64_t bundleIDType = self->_bundleIDType;
  }
  float v134 = v75;
  float v390 = v74;
  if ((bundleIDType & 2) != 0)
  {
    long long v135 = SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x19uLL);
    long long v136 = v135;
    if (v135)
    {
      [v135 timeIntervalSinceReferenceDate];
      BOOL v138 = v137 - a5 > -604800.0;
      [v136 timeIntervalSinceReferenceDate];
      BOOL v140 = v139 - a5 > -2678400.0;
      [v136 timeIntervalSinceReferenceDate];
      BOOL v142 = v141 - a5 > -31536000.0;
    }
    else
    {
      BOOL v138 = 0;
      BOOL v140 = 0;
      BOOL v142 = 0;
    }
    if (v390 == 0.0 && v134 == 0.0 && v77 == 0.0 && !v138)
    {
      int v143 = v395 != 0.0 || v140;
      if (v143 != 1)
      {
        if (v392 != 0.0) {
          BOOL v142 = 1;
        }
        if (!v142) {
          goto LABEL_93;
        }
        a3->var0[a3->var2] = 6;
        v338 = a3->var1;
        unint64_t v339 = a3->var2;
        unint64_t v159 = v339 + 1;
        a3->unint64_t var2 = v339 + 1;
        v338[v339] = 1.0;
LABEL_92:
        a3->var0[v159] = 2340;
        unint64_t v160 = a3->var1;
        unint64_t v161 = a3->var2;
        a3->unint64_t var2 = v161 + 1;
        v160[v161] = v80;
LABEL_93:

        float v74 = v390;
        float v75 = v134;
        unint64_t bundleIDType = self->_bundleIDType;
        goto LABEL_94;
      }
      a3->var0[a3->var2] = 8;
      float v144 = a3->var1;
      unint64_t v145 = a3->var2;
      a3->unint64_t var2 = v145 + 1;
      v144[v145] = 1.0;
      a3->var0[v145 + 1] = 6;
      unint64_t v146 = a3->var1;
      unint64_t v147 = a3->var2;
      unint64_t v148 = v147 + 1;
      a3->unint64_t var2 = v147 + 1;
      v146[v147] = 1.0;
    }
    else
    {
      a3->var0[a3->var2] = 10;
      v149 = a3->var1;
      unint64_t v150 = a3->var2;
      a3->unint64_t var2 = v150 + 1;
      v149[v150] = 1.0;
      a3->var0[v150 + 1] = 8;
      unint64_t v151 = a3->var1;
      unint64_t v152 = a3->var2;
      a3->unint64_t var2 = v152 + 1;
      v151[v152] = 1.0;
      a3->var0[v152 + 1] = 6;
      v153 = a3->var1;
      unint64_t v154 = a3->var2;
      a3->unint64_t var2 = v154 + 1;
      v153[v154] = 1.0;
      a3->var0[v154 + 1] = 2338;
      float v155 = a3->var1;
      unint64_t v156 = a3->var2;
      unint64_t v148 = v156 + 1;
      a3->unint64_t var2 = v156 + 1;
      v155[v156] = v78;
    }
    a3->var0[v148] = 2339;
    float v157 = a3->var1;
    unint64_t v158 = a3->var2;
    unint64_t v159 = v158 + 1;
    a3->unint64_t var2 = v158 + 1;
    v157[v158] = v79;
    goto LABEL_92;
  }
LABEL_94:
  if ((bundleIDType & 4) == 0) {
    goto LABEL_103;
  }
  if (v74 != 0.0 || v75 != 0.0 || v77 != 0.0)
  {
    a3->var0[a3->var2] = 10;
    float v167 = a3->var1;
    unint64_t v168 = a3->var2;
    a3->unint64_t var2 = v168 + 1;
    v167[v168] = 1.0;
    a3->var0[v168 + 1] = 8;
    v169 = a3->var1;
    unint64_t v170 = a3->var2;
    a3->unint64_t var2 = v170 + 1;
    v169[v170] = 1.0;
    a3->var0[v170 + 1] = 6;
    unint64_t v171 = a3->var1;
    unint64_t v172 = a3->var2;
    a3->unint64_t var2 = v172 + 1;
    v171[v172] = 1.0;
    a3->var0[v172 + 1] = 2338;
    v173 = a3->var1;
    unint64_t v174 = a3->var2;
    unint64_t v166 = v174 + 1;
    a3->unint64_t var2 = v174 + 1;
    v173[v174] = v78;
    goto LABEL_101;
  }
  if (v395 != 0.0)
  {
    a3->var0[a3->var2] = 8;
    float v162 = a3->var1;
    unint64_t v163 = a3->var2;
    a3->unint64_t var2 = v163 + 1;
    v162[v163] = 1.0;
    a3->var0[v163 + 1] = 6;
    float v164 = a3->var1;
    unint64_t v165 = a3->var2;
    unint64_t v166 = v165 + 1;
    a3->unint64_t var2 = v165 + 1;
    v164[v165] = 1.0;
LABEL_101:
    a3->var0[v166] = 2339;
    float v175 = a3->var1;
    unint64_t v176 = a3->var2;
    unint64_t v177 = v176 + 1;
    a3->unint64_t var2 = v176 + 1;
    v175[v176] = v79;
LABEL_102:
    a3->var0[v177] = 2340;
    float v178 = a3->var1;
    unint64_t v179 = a3->var2;
    a3->unint64_t var2 = v179 + 1;
    v178[v179] = v80;
    goto LABEL_103;
  }
  if (v392 != 0.0)
  {
    a3->var0[a3->var2] = 6;
    v340 = a3->var1;
    unint64_t v341 = a3->var2;
    unint64_t v177 = v341 + 1;
    a3->unint64_t var2 = v341 + 1;
    v340[v341] = 1.0;
    goto LABEL_102;
  }
LABEL_103:
  if ((self->_bundleIDType & 0x200000000) == 0) {
    goto LABEL_112;
  }
  float v180 = SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x177uLL);
  float v181 = v180;
  if (v180)
  {
    float v385 = v62;
    [v180 timeIntervalSinceReferenceDate];
    double v183 = v182 - a5;
    [v181 timeIntervalSinceReferenceDate];
    double v185 = v184;
    [v181 timeIntervalSinceReferenceDate];
    double v187 = v186;
    [v181 timeIntervalSinceReferenceDate];
    double v189 = v188;
    [v181 timeIntervalSinceReferenceDate];
    if (v183 <= -86400.0)
    {
      if (v185 - a5 <= -604800.0)
      {
        if (v187 - a5 <= -1296000.0)
        {
          float v62 = v385;
          if (v189 - a5 <= -2678400.0)
          {
            if (v190 - a5 <= -31536000.0) {
              goto LABEL_111;
            }
            a3->var0[a3->var2] = 5;
            v380 = a3->var1;
            unint64_t v381 = a3->var2;
            unint64_t v379 = v381 + 1;
            a3->unint64_t var2 = v381 + 1;
            v380[v381] = 1.0;
          }
          else
          {
            a3->var0[a3->var2] = 7;
            v373 = a3->var1;
            unint64_t v374 = a3->var2;
            a3->unint64_t var2 = v374 + 1;
            v373[v374] = 1.0;
            a3->var0[v374 + 1] = 5;
            v375 = a3->var1;
            unint64_t v376 = a3->var2;
            a3->unint64_t var2 = v376 + 1;
            v375[v376] = 1.0;
            a3->var0[v376 + 1] = 2344;
            v377 = a3->var1;
            unint64_t v378 = a3->var2;
            unint64_t v379 = v378 + 1;
            a3->unint64_t var2 = v378 + 1;
            v377[v378] = v395;
          }
          a3->var0[v379] = 2345;
          v382 = a3->var1;
          unint64_t v383 = a3->var2;
          a3->unint64_t var2 = v383 + 1;
          unint64_t v220 = &v382[v383];
        }
        else
        {
          a3->var0[a3->var2] = 3;
          v342 = a3->var1;
          unint64_t v343 = a3->var2;
          a3->unint64_t var2 = v343 + 1;
          v342[v343] = 1.0;
          a3->var0[v343 + 1] = 7;
          v344 = a3->var1;
          unint64_t v345 = a3->var2;
          a3->unint64_t var2 = v345 + 1;
          v344[v345] = 1.0;
          a3->var0[v345 + 1] = 5;
          v346 = a3->var1;
          unint64_t v347 = a3->var2;
          a3->unint64_t var2 = v347 + 1;
          v346[v347] = 1.0;
          a3->var0[v347 + 1] = 2343;
          v348 = a3->var1;
          unint64_t v349 = a3->var2;
          a3->unint64_t var2 = v349 + 1;
          v348[v349] = v77;
          a3->var0[v349 + 1] = 2344;
          v350 = a3->var1;
          unint64_t v351 = a3->var2;
          a3->unint64_t var2 = v351 + 1;
          v350[v351] = v395;
          a3->var0[v351 + 1] = 2345;
          v352 = a3->var1;
          unint64_t v353 = a3->var2;
          a3->unint64_t var2 = v353 + 1;
          unint64_t v220 = &v352[v353];
          float v62 = v385;
        }
        goto LABEL_110;
      }
      a3->var0[a3->var2] = 9;
      float v204 = a3->var1;
      unint64_t v205 = a3->var2;
      a3->unint64_t var2 = v205 + 1;
      v204[v205] = 1.0;
      a3->var0[v205 + 1] = 3;
      float v206 = a3->var1;
      unint64_t v207 = a3->var2;
      a3->unint64_t var2 = v207 + 1;
      v206[v207] = 1.0;
      a3->var0[v207 + 1] = 7;
      unint64_t v208 = a3->var1;
      unint64_t v209 = a3->var2;
      a3->unint64_t var2 = v209 + 1;
      v208[v209] = 1.0;
      a3->var0[v209 + 1] = 5;
      unint64_t v210 = a3->var1;
      unint64_t v211 = a3->var2;
      unint64_t v203 = v211 + 1;
      a3->unint64_t var2 = v211 + 1;
      v210[v211] = 1.0;
    }
    else
    {
      a3->var0[a3->var2] = 1874;
      uint64_t v191 = a3->var1;
      unint64_t v192 = a3->var2;
      a3->unint64_t var2 = v192 + 1;
      v191[v192] = 1.0;
      a3->var0[v192 + 1] = 9;
      uint64_t v193 = a3->var1;
      unint64_t v194 = a3->var2;
      a3->unint64_t var2 = v194 + 1;
      v193[v194] = 1.0;
      a3->var0[v194 + 1] = 3;
      float v195 = a3->var1;
      unint64_t v196 = a3->var2;
      a3->unint64_t var2 = v196 + 1;
      v195[v196] = 1.0;
      a3->var0[v196 + 1] = 7;
      unint64_t v197 = a3->var1;
      unint64_t v198 = a3->var2;
      a3->unint64_t var2 = v198 + 1;
      v197[v198] = 1.0;
      a3->var0[v198 + 1] = 5;
      v199 = a3->var1;
      unint64_t v200 = a3->var2;
      a3->unint64_t var2 = v200 + 1;
      v199[v200] = 1.0;
      a3->var0[v200 + 1] = 2341;
      float v201 = a3->var1;
      unint64_t v202 = a3->var2;
      unint64_t v203 = v202 + 1;
      a3->unint64_t var2 = v202 + 1;
      v201[v202] = v390;
    }
    a3->var0[v203] = 2342;
    unint64_t v212 = a3->var1;
    unint64_t v213 = a3->var2;
    a3->unint64_t var2 = v213 + 1;
    v212[v213] = v134;
    a3->var0[v213 + 1] = 2343;
    unint64_t v214 = a3->var1;
    unint64_t v215 = a3->var2;
    a3->unint64_t var2 = v215 + 1;
    v214[v215] = v77;
    a3->var0[v215 + 1] = 2344;
    float v216 = a3->var1;
    unint64_t v217 = a3->var2;
    a3->unint64_t var2 = v217 + 1;
    v216[v217] = v395;
    a3->var0[v217 + 1] = 2345;
    float v218 = a3->var1;
    unint64_t v219 = a3->var2;
    a3->unint64_t var2 = v219 + 1;
    unint64_t v220 = &v218[v219];
    float v62 = v385;
LABEL_110:
    *unint64_t v220 = v392;
  }
LABEL_111:

LABEL_112:
  uint64_t v402 = 0;
  uint64_t v403 = 0;
  uint64_t v401 = 0;
  if (SSCompactRankingAttrsGetFloat((uint64_t)self->_attributes, 0x75uLL, (_DWORD *)&v403 + 1))
  {
    float v221 = *((float *)&v403 + 1);
    a3->var0[a3->var2] = 1881;
    v222 = a3->var1;
    unint64_t v223 = a3->var2;
    a3->unint64_t var2 = v223 + 1;
    v222[v223] = v221;
  }
  float v224 = v62;
  if (SSCompactRankingAttrsGetFloat((uint64_t)self->_attributes, 0x10uLL, &v403))
  {
    float v225 = *(float *)&v403;
    a3->var0[a3->var2] = 1882;
    float v226 = a3->var1;
    unint64_t v227 = a3->var2;
    a3->unint64_t var2 = v227 + 1;
    v226[v227] = v225;
  }
  if (SSCompactRankingAttrsGetFloat((uint64_t)self->_attributes, 0x157uLL, (_DWORD *)&v402 + 1))
  {
    float v228 = *((float *)&v402 + 1);
    a3->var0[a3->var2] = 1883;
    v229 = a3->var1;
    unint64_t v230 = a3->var2;
    a3->unint64_t var2 = v230 + 1;
    v229[v230] = v228;
  }
  if (SSCompactRankingAttrsGetFloat((uint64_t)self->_attributes, 0x159uLL, &v402))
  {
    float v231 = *(float *)&v402;
    a3->var0[a3->var2] = 1884;
    unint64_t v232 = a3->var1;
    unint64_t v233 = a3->var2;
    a3->unint64_t var2 = v233 + 1;
    v232[v233] = v231;
  }
  if (SSCompactRankingAttrsGetFloat((uint64_t)self->_attributes, 0x158uLL, &v402))
  {
    float v234 = *(float *)&v402;
    a3->var0[a3->var2] = 1885;
    long long v235 = a3->var1;
    unint64_t v236 = a3->var2;
    a3->unint64_t var2 = v236 + 1;
    v235[v236] = v234;
  }
  if (SSCompactRankingAttrsGetFloat((uint64_t)self->_attributes, 0x15AuLL, &v402))
  {
    float v237 = *(float *)&v402;
    a3->var0[a3->var2] = 1886;
    long long v238 = a3->var1;
    unint64_t v239 = a3->var2;
    a3->unint64_t var2 = v239 + 1;
    v238[v239] = v237;
  }
  if (SSCompactRankingAttrsGetFloat((uint64_t)self->_attributes, 0x15BuLL, (_DWORD *)&v401 + 1))
  {
    float v240 = *((float *)&v401 + 1);
    a3->var0[a3->var2] = 1887;
    long long v241 = a3->var1;
    unint64_t v242 = a3->var2;
    a3->unint64_t var2 = v242 + 1;
    v241[v242] = v240;
  }
  if (SSCompactRankingAttrsGetFloat((uint64_t)self->_attributes, 0x15CuLL, &v401))
  {
    float v243 = *(float *)&v401;
    a3->var0[a3->var2] = 1926;
    id v244 = a3->var1;
    unint64_t v245 = a3->var2;
    a3->unint64_t var2 = v245 + 1;
    v244[v245] = v243;
  }
  unint64_t v246 = self->_bundleIDType;
  if ((v246 & 4) != 0)
  {
    long long v247 = +[PRSRankingItemRanker phoneFavoritesCopy];
    id v248 = SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 2uLL);
    float v249 = 0.0;
    if (v248)
    {
      if (v247)
      {
        int v250 = objc_msgSend(v247, "containsObject:", v248, 0.0);
        float v249 = 0.0;
        if (v250) {
          float v249 = 1.0;
        }
      }
    }
    a3->var0[a3->var2] = 1877;
    long long v251 = a3->var1;
    unint64_t v252 = a3->var2;
    a3->unint64_t var2 = v252 + 1;
    v251[v252] = v249;

    unint64_t v246 = self->_bundleIDType;
  }
  a3->var0[a3->var2] = 1982;
  unint64_t v253 = a3->var2;
  unint64_t v254 = v246 & 0x4000;
  float v255 = 1.0;
  if (!v254) {
    float v255 = 0.0;
  }
  a3->var1[v253] = v255;
  a3->unint64_t var2 = v253 + 1;
  self->_isNonProgrammedSiriActiouint64_t n = v254 >> 14;
  BOOL v256 = [(NSString *)self->_identifier hasPrefix:@"com.apple.siri.interaction."];
  L2FeatureVector = self->_L2FeatureVector;
  if (v256)
  {
    [(PRSL2FeatureVector *)L2FeatureVector setIsSiriAction:1];
    self->_shouldHideUnderShowMore = 1;
    *(_WORD *)&self->_recentForTopHit = 0;
  }
  else
  {
    [(PRSL2FeatureVector *)L2FeatureVector setIsSiriAction:0];
  }
  long long v258 = SSCompactRankingAttrsGetValue((int8x8_t *)[(PRSRankingItem *)self attributes], 0x3AuLL);
  if (v258)
  {
    long long v259 = [v15 queryString];

    if (v259)
    {
      long long v260 = [v15 queryString];
      uint64_t v261 = [v258 rangeOfString:v260 options:393];
      id v262 = v18;
      uint64_t v264 = v263;

      BOOL v265 = v264 == [v258 length];
      id v18 = v262;
      if (v265 && !v261) {
        [(PRSRankingItem *)self setHasShortCut:1];
      }
    }
  }
  float v400 = 0.0;
  if (SSCompactRankingAttrsGetFloat((uint64_t)self->_attributes, 0x179uLL, &v400))
  {
    float v266 = v400;
    a3->var0[a3->var2] = 2395;
    long long v267 = a3->var1;
    unint64_t v268 = a3->var2;
    a3->unint64_t var2 = v268 + 1;
    v267[v268] = v266;
  }
  long long v269 = [(PRSRankingItem *)self interestingDate];
  long long v270 = v269;
  if (v269)
  {
    [v269 timeIntervalSinceReferenceDate];
    unint64_t v272 = (uint64_t)((v271 - a5) / 60.0);
    a3->var0[a3->var2] = 2396;
    float v273 = a3->var1;
    unint64_t v274 = a3->var2;
    a3->unint64_t var2 = v274 + 1;
    v273[v274] = (float)(uint64_t)v272;
    if ((v272 & 0x8000000000000000) != 0) {
      unint64_t v272 = -(uint64_t)v272;
    }
    float v275 = 0.0;
    if (v272 >= 0x5A1) {
      float v276 = 0.0;
    }
    else {
      float v276 = 1.0;
    }
    a3->var0[v274 + 1] = 3100;
    v277 = a3->var1;
    unint64_t v278 = a3->var2;
    a3->unint64_t var2 = v278 + 1;
    v277[v278] = v276;
    if (v272 >= 0x10E1) {
      float v279 = 0.0;
    }
    else {
      float v279 = 1.0;
    }
    a3->var0[v278 + 1] = 3099;
    v280 = a3->var1;
    unint64_t v281 = a3->var2;
    a3->unint64_t var2 = v281 + 1;
    v280[v281] = v279;
    if (v272 >= 0x2761) {
      float v282 = 0.0;
    }
    else {
      float v282 = 1.0;
    }
    a3->var0[v281 + 1] = 3098;
    v283 = a3->var1;
    unint64_t v284 = a3->var2;
    a3->unint64_t var2 = v284 + 1;
    v283[v284] = v282;
    if (v272 >= 0x5461) {
      float v285 = 0.0;
    }
    else {
      float v285 = 1.0;
    }
    a3->var0[v284 + 1] = 3097;
    v286 = a3->var1;
    unint64_t v287 = a3->var2;
    a3->unint64_t var2 = v287 + 1;
    v286[v287] = v285;
    if (v272 >= 0xA8C1) {
      float v288 = 0.0;
    }
    else {
      float v288 = 1.0;
    }
    a3->var0[v287 + 1] = 3096;
    v289 = a3->var1;
    unint64_t v290 = a3->var2;
    a3->unint64_t var2 = v290 + 1;
    v289[v290] = v288;
    if (v272 >= 0x15181) {
      float v291 = 0.0;
    }
    else {
      float v291 = 1.0;
    }
    a3->var0[v290 + 1] = 3095;
    v292 = a3->var1;
    unint64_t v293 = a3->var2;
    a3->unint64_t var2 = v293 + 1;
    v292[v293] = v291;
    if (v272 >= 0x1FA41) {
      float v294 = 0.0;
    }
    else {
      float v294 = 1.0;
    }
    a3->var0[v293 + 1] = 3094;
    v295 = a3->var1;
    unint64_t v296 = a3->var2;
    a3->unint64_t var2 = v296 + 1;
    v295[v296] = v294;
    if (v272 >= 0x2A301) {
      float v297 = 0.0;
    }
    else {
      float v297 = 1.0;
    }
    a3->var0[v296 + 1] = 3093;
    v298 = a3->var1;
    unint64_t v299 = a3->var2;
    a3->unint64_t var2 = v299 + 1;
    v298[v299] = v297;
    if (v272 >= 0x3F481) {
      float v300 = 0.0;
    }
    else {
      float v300 = 1.0;
    }
    a3->var0[v299 + 1] = 3092;
    v301 = a3->var1;
    unint64_t v302 = a3->var2;
    a3->unint64_t var2 = v302 + 1;
    v301[v302] = v300;
    if (v272 >= 0x54601) {
      float v303 = 0.0;
    }
    else {
      float v303 = 1.0;
    }
    a3->var0[v302 + 1] = 3091;
    v304 = a3->var1;
    unint64_t v305 = a3->var2;
    a3->unint64_t var2 = v305 + 1;
    v304[v305] = v303;
    if (v272 >= 0x5EEC1) {
      float v306 = 0.0;
    }
    else {
      float v306 = 1.0;
    }
    a3->var0[v305 + 1] = 3090;
    v307 = a3->var1;
    unint64_t v308 = a3->var2;
    a3->unint64_t var2 = v308 + 1;
    v307[v308] = v306;
    if (v272 >= 0x80521) {
      float v309 = 0.0;
    }
    else {
      float v309 = 1.0;
    }
    a3->var0[v308 + 1] = 3089;
    v310 = a3->var1;
    unint64_t v311 = a3->var2;
    a3->unint64_t var2 = v311 + 1;
    v310[v311] = v309;
    if (v272 >= 0xA8C01) {
      float v312 = 0.0;
    }
    else {
      float v312 = 1.0;
    }
    a3->var0[v311 + 1] = 3088;
    v313 = a3->var1;
    unint64_t v314 = a3->var2;
    a3->unint64_t var2 = v314 + 1;
    v313[v314] = v312;
    if (v272 >= 0x100A41) {
      float v315 = 0.0;
    }
    else {
      float v315 = 1.0;
    }
    a3->var0[v314 + 1] = 3087;
    v316 = a3->var1;
    unint64_t v317 = a3->var2;
    a3->unint64_t var2 = v317 + 1;
    v316[v317] = v315;
    if (v272 < 0x151801) {
      float v275 = 1.0;
    }
    a3->var0[v317 + 1] = 3086;
    v318 = a3->var1;
    unint64_t v319 = a3->var2;
    a3->unint64_t var2 = v319 + 1;
    v318[v319] = v275;
  }
  if (SSEnableSpotlightTopHitPersonalizedRanking())
  {
    double Current = CFAbsoluteTimeGetCurrent();
    *(_DWORD *)buf = 0;
    SSCompactRankingAttrsGetFloat((uint64_t)self->_attributes, 0x41uLL, buf);
    LODWORD(v321) = *(_DWORD *)buf;
    if (*(float *)buf > 0.0) {
      -[PRSRankingItem setWasEngaged:](self, "setWasEngaged:", 1, v321);
    }
    -[PRSRankingItem topicalityScoreWithEvaluator:quParsedEvaluator:isSearchToolClient:quParsedPersonEvaluator:quParsedArgSearchTermsEvaluator:](self, "topicalityScoreWithEvaluator:quParsedEvaluator:isSearchToolClient:quParsedPersonEvaluator:quParsedArgSearchTermsEvaluator:", v15, v16, v387, v17, v18, v321);
    float v323 = v322;
    *(float *)&double v324 = v322;
    [(PRSRankingItem *)self engagementScoreWithEvaluator:v15 currentTime:v258 launchString:Current topicalityScore:v324];
    float v326 = v325;
    [(PRSRankingItem *)self setEngagementScore:v325];
    [(PRSRankingItem *)self setTopicalityScore:v323];
    a3->var0[a3->var2] = 3225;
    v327 = a3->var1;
    unint64_t v328 = a3->var2;
    a3->unint64_t var2 = v328 + 1;
    v327[v328] = v326;
    a3->var0[v328 + 1] = 3226;
    v329 = a3->var1;
    unint64_t v330 = a3->var2;
    a3->unint64_t var2 = v330 + 1;
    v329[v330] = v323;
  }
  [(PRSRankingItem *)self extractDocumentSignals];
  v331 = SSGeneralLog();
  if (os_log_type_enabled(v331, OS_LOG_TYPE_DEBUG))
  {
    v399 = [v15 queryString];
    SSRedactString(v399, 1);
    id v393 = v18;
    id v354 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v388 = [v15 queryID];
    [(PRSRankingItem *)self identifier];
    v356 = id v355 = v16;
    [(PRSRankingItem *)self retrievalType];
    id v396 = v15;
    id v391 = v17;
    v358 = id v357 = v355;
    uint64_t v386 = [v358 integerValue];
    int64_t v359 = [(PRSRankingItem *)self itemSparseMatchStrengthType];
    [(PRSRankingItem *)self pommesCalibratedL1Score];
    double v361 = v360;
    [(PRSRankingItem *)self pommesL1Score];
    double v363 = v362;
    [(PRSRankingItem *)self calibratedEmbeddingSimilarity];
    double v365 = v364;
    [(PRSRankingItem *)self embeddingSimilarity];
    double v367 = v366;
    [(PRSRankingItem *)self keywordMatchScore];
    float v368 = v64;
    double v370 = v369;
    [(PRSRankingItem *)self topicalityScore];
    *(_DWORD *)buf = 138415106;
    *(void *)&uint8_t buf[4] = v354;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v388;
    __int16 v405 = 2112;
    v406 = v356;
    __int16 v407 = 2112;
    v408 = v397;
    __int16 v409 = 2048;
    uint64_t v410 = v386;
    __int16 v411 = 2048;
    int64_t v412 = v359;
    __int16 v413 = 2048;
    double v414 = v361;
    __int16 v415 = 2048;
    double v416 = v363;
    __int16 v417 = 2048;
    double v418 = v365;
    __int16 v419 = 2048;
    double v420 = v367;
    __int16 v421 = 2048;
    double v422 = v370;
    float v64 = v368;
    __int16 v423 = 2048;
    uint64_t v424 = v371;
    _os_log_debug_impl(&dword_1BDB2A000, v331, OS_LOG_TYPE_DEBUG, "[SpotlightRanking]<CalibrationEval> query:%@, query_id:%ld, itemID:%@, bundleID:%@, retrievalType:%ld, SparseMatchStrength:%ld, pommesCalibratedL1Score:%f, pommesL1Score:%f, calibratedDenseScore:%f, originalDenseScore:%f, keywordMatchScore:%f, topicalityScore:%f", buf, 0x7Au);

    v372 = v357;
    id v17 = v391;
    id v15 = v396;

    id v16 = v372;
    id v18 = v393;
  }

  if ((self->_bundleIDType & 0x2040000) != 0)
  {
    *(_DWORD *)buf = 0;
    if (SSCompactRankingAttrsGetFloat((uint64_t)self->_attributes, 0x90uLL, buf))
    {
      float v332 = *(float *)buf;
      a3->var0[a3->var2] = 2388;
      v333 = a3->var1;
      unint64_t v334 = a3->var2;
      a3->unint64_t var2 = v334 + 1;
      v333[v334] = v332;
    }
    if (SSCompactRankingAttrsGetFloat((uint64_t)self->_attributes, 0x91uLL, buf))
    {
      float v335 = *(float *)buf;
      a3->var0[a3->var2] = 2389;
      v336 = a3->var1;
      unint64_t v337 = a3->var2;
      a3->unint64_t var2 = v337 + 1;
      v336[v337] = v335;
    }
    if (v394 == 1.0 || v224 == 1.0 || v64 == 1.0) {
      self->_photosMatch = 1;
    }
  }
}

- (void)populateRemainingFeaturesWithRanker:(id)a3
{
  uint64_t v3 = ((uint64_t (*)(PRSRankingItem *, SEL, id))MEMORY[0x1F4188790])(self, a2, a3);
  uint64_t v220 = *MEMORY[0x1E4F143B8];
  id v5 = v4;
  bzero(v219, 0x328CuLL);
  bzero(v218, 0x1946uLL);
  id v6 = *(id *)(v3 + 224);
  id v215 = v6;
  if (v6)
  {
    id v7 = v6;
  }
  else
  {
    SSCompactRankingAttrsGetValue(*(int8x8_t **)(v3 + 304), 0xAuLL);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  if ((objc_msgSend((id)v3, "bundleIDType", v215) & 0x100) != 0)
  {
    unint64_t v9 = [v5 queryTermCount];
    uint64_t v10 = [(id)v3 L2FeatureVector];
    [v10 scoreForFeature:33];
    float v12 = v11;

    float v13 = [(id)v3 L2FeatureVector];
    [v13 scoreForFeature:1614];
    float v15 = v14;

    id v16 = [(id)v3 L2FeatureVector];
    [v16 scoreForFeature:189];
    float v18 = v17;

    BOOL v19 = v18 != 2147500000.0 && v15 == 0.0;
    BOOL v20 = v18 != -1.0 && v19;
    id v21 = [(id)v3 L2FeatureVector];
    [v21 scoreForFeature:165];
    float v23 = v22;

    BOOL v24 = v23 != 0.0 || *(unsigned char *)(v3 + 58) == 0;
    int v25 = !v24;
    uint64_t v26 = [(id)v3 L2FeatureVector];
    [v26 scoreForFeature:41];
    float v28 = v27;

    if (!+[PRSRankingItemRanker isKeywordsHidingEnabled])
    {
      [*(id *)(v3 + 256) scoreForFeature:297];
      if (v9)
      {
        if (v29 < 2147500000.0)
        {
          float v30 = ((double)v9 + 1.0) / (double)v9;
          if (v29 <= v30 && v29 > 0.0) {
            *(unsigned char *)(v3 + 60) = 1;
          }
        }
      }
    }
    if (v28 == 0.0)
    {
      float v31 = 1.0;
      int v32 = v12 == 1.0 || v20;
      if (((v32 | v25) & 1) == 0 && !*(void *)(v3 + 232) && !*(unsigned char *)(v3 + 60)) {
        float v31 = 0.0;
      }
      v218[0] = 2327;
      *(float *)unint64_t v219 = v31;
      [*(id *)(v3 + 256) scoreForFeature:272];
      float v34 = 0.0;
      if (v9 >= 2)
      {
        if (v33 > 0.0)
        {
          float v35 = ((double)v9 + 1.0) / (double)v9;
          BOOL v36 = v33 > v35;
        }
        else
        {
          BOOL v36 = 1;
        }
        BOOL v37 = !v36 && v33 < 2147500000.0;
        float v34 = 1.0;
        if (!v37) {
          float v34 = 0.0;
        }
      }
      v218[1] = 2328;
      *(float *)&v219[1] = v34;
      uint64_t v8 = 2;
    }
    else
    {
      v218[0] = 2327;
      v219[0] = 0;
      uint64_t v8 = 1;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  if (([(id)v3 bundleIDType] & 4) != 0)
  {
    unint64_t v38 = [v5 queryTermCount];
    id v39 = [(id)v3 L2FeatureVector];
    [v39 scoreForFeature:33];
    float v41 = v40;

    uint64_t v42 = [(id)v3 L2FeatureVector];
    [v42 scoreForFeature:41];
    float v44 = v43;

    BOOL v45 = v41 == 1.0 && v44 == 0.0;
    v218[v8] = 2327;
    if (v45) {
      float v46 = 1.0;
    }
    else {
      float v46 = 0.0;
    }
    uint64_t v47 = v8 + 1;
    *(float *)&v219[v8] = v46;
    if (v44 == 0.0)
    {
      [*(id *)(v3 + 256) scoreForFeature:272];
      if (v48 > 0.0)
      {
        float v49 = ((double)v38 + 1.0) / (double)v38;
        BOOL v50 = v48 > v49;
      }
      else
      {
        BOOL v50 = 1;
      }
      if (!v50 && v48 < 2147500000.0) {
        float v52 = 1.0;
      }
      else {
        float v52 = 0.0;
      }
      if (v38 < 2) {
        float v52 = 0.0;
      }
      v218[v47] = 2328;
      v8 += 2;
      *(float *)&v219[v47] = v52;
    }
    else
    {
      ++v8;
    }
  }
  if ([v7 hasPrefix:@"com.apple."]
    && ([v7 isEqualToString:@"com.apple.CoreSuggestions"] & 1) == 0)
  {
    double v53 = [(id)v3 L2FeatureVector];
    [v53 scoreForFeature:41];
    float v55 = v54;

    if (([(id)v3 bundleIDType] & 4) != 0 && v55 == 0.0)
    {
      uint64_t v56 = [(id)v3 L2FeatureVector];
      [v56 scoreForFeature:33];
      float v58 = v57;

      int v59 = [(id)v3 L2FeatureVector];
      [v59 scoreForFeature:189];
      float v61 = v60;

      if (v61 == 0.0 && v58 == 1.0) {
        float v55 = 1.0;
      }
      if (v55 == 0.0)
      {
        unint64_t v63 = [(id)v3 L2FeatureVector];
        [v63 scoreForFeature:33];
        float v65 = v64;

        if (v65 == 1.0) {
          float v55 = 1.0;
        }
      }
    }
    BOOL v24 = (*(void *)(v3 + 440) & 0x2040000) == 0;
    float v66 = 0.0;
    v218[v8] = 2329;
    if (v24) {
      float v66 = v55;
    }
    *(float *)&v219[v8++] = v66;
  }
  if (([(id)v3 bundleIDType] & 0x20000) != 0)
  {
    float v73 = [(id)v3 L2FeatureVector];
    [v73 scoreForFeature:191];
    float v75 = v74;

    if (v75 != 2147500000.0) {
      *(unsigned char *)(v3 + 62) = 1;
    }
  }
  else if (([(id)v3 bundleIDType] & 0x100) != 0)
  {
    float v67 = [(id)v3 L2FeatureVector];
    [v67 scoreForFeature:130];
    float v69 = v68;

    if (v69 == 1.0)
    {
      float v70 = [(id)v3 L2FeatureVector];
      [v70 scoreForFeature:2329];
      float v72 = v71;

      if (v72 == 0.0)
      {
        v218[v8] = 2329;
        v219[v8++] = 1065353216;
      }
    }
  }
  if (![v7 hasPrefix:@"com.apple."]
    || ([v7 isEqualToString:@"com.apple.Preferences"] & 1) != 0
    || ([v7 isEqualToString:@"com.apple.CoreSuggestions"] & 1) != 0)
  {
    unint64_t v76 = [(id)v3 L2FeatureVector];
    __int16 v77 = 1911;
    [v76 scoreForFeature:1911];
    int v79 = v78;

    v218[v8] = 2355;
    uint64_t v80 = v8 + 1;
    v219[v8] = v79;
    float v81 = -1.0;
    uint64_t v82 = 2;
LABEL_90:
    v218[v80] = v77;
    v8 += v82;
    *(float *)&v219[v80] = v81;
    goto LABEL_91;
  }
  if (([v7 isEqualToString:@"com.apple.reminders"] & 1) == 0
    && ([v7 isEqualToString:@"com.apple.Music"] & 1) == 0)
  {
    float v201 = [(id)v3 L2FeatureVector];
    [v201 scoreForFeature:131];
    float v81 = v202;

    __int16 v77 = 2330;
    uint64_t v82 = 1;
    uint64_t v80 = v8;
    goto LABEL_90;
  }
LABEL_91:
  if (([(id)v3 bundleIDType] & 0x20) != 0)
  {
    float v83 = [(id)v3 L2FeatureVector];
    [v83 scoreForFeature:42];
    int v85 = v84;

    v218[v8] = 2354;
    v219[v8] = v85;
    uint64_t v86 = v8 + 1;
    v218[v8 + 1] = 42;
    v8 += 2;
    v219[v86] = 0;
  }
  if (([(id)v3 bundleIDType] & 2) != 0 || (objc_msgSend((id)v3, "bundleIDType") & 4) != 0)
  {
    long long v87 = [(id)v3 L2FeatureVector];
    [v87 scoreForFeature:42];
    int v89 = v88;

    v218[v8] = 2354;
    v219[v8] = v89;
    uint64_t v90 = v8 + 1;
    v218[v8 + 1] = 42;
    v8 += 2;
    v219[v90] = 0;
  }
  unint64_t v91 = [(id)v3 L2FeatureVector];
  [v91 scoreForFeature:35];
  float v93 = v92;

  if (v93 == 1.0 && ([(id)v3 hasShortCut] & 1) == 0)
  {
    v218[v8] = 35;
    v219[v8++] = 0;
  }
  uint64_t v94 = [(id)v3 L2FeatureVector];
  [v94 scoreForFeature:48];
  float v96 = v95;

  int v97 = [(id)v3 hasShortCut];
  if (v96 == 1.0)
  {
    if ((v97 & 1) == 0)
    {
      v218[v8] = 48;
      v219[v8++] = 0;
    }
  }
  else if (v97)
  {
    [(id)v3 setHasShortCut:0];
  }
  if (([(id)v3 bundleIDType] & 0x10) != 0 || (objc_msgSend((id)v3, "bundleIDType") & 0x800) != 0)
  {
    uint64_t v98 = [(id)v3 L2FeatureVector];
    [v98 scoreForFeature:42];
    float v100 = v99;

    if (v100 == 1.0)
    {
      *(_DWORD *)&v218[v8] = 2754866;
      uint64_t v101 = v8;
      v8 += 2;
      *(void *)&v219[v101] = 1065353216;
    }
  }
  if (([(id)v3 bundleIDType] & 0x100) != 0)
  {
    uint64_t v106 = [(id)v3 L2FeatureVector];
    [v106 scoreForFeature:42];
    float v108 = v107;

    if (v108 == 1.0)
    {
      *(_DWORD *)&v218[v8] = 2754866;
      uint64_t v109 = v8;
      v8 += 2;
      *(void *)&v219[v109] = 1065353216;
    }
  }
  else
  {
    if (([(id)v3 bundleIDType] & 0x10) != 0)
    {
      id v110 = [(id)v3 L2FeatureVector];
      [v110 scoreForFeature:1887];
      int v104 = v111;

      __int16 v105 = 2337;
      goto LABEL_116;
    }
    if (([(id)v3 bundleIDType] & 0x80) != 0)
    {
      unint64_t v203 = [(id)v3 L2FeatureVector];
      [v203 scoreForFeature:91];
      int v205 = v204;

      float v206 = &v219[v8];
      *float v206 = v205;
      unint64_t v207 = [(id)v3 L2FeatureVector];
      [v207 scoreForFeature:109];
      int v209 = v208;

      v206[1] = v209;
      unint64_t v210 = [(id)v3 L2FeatureVector];
      [v210 scoreForFeature:127];
      int v212 = v211;

      uint64_t v213 = v8 + 3;
      v206[2] = v212;
      int v214 = [*(id *)(v3 + 424) isEqualToString:@"com.apple.safari.bookmark"];
      *(void *)&v218[v8] = 0x9590920091F091ELL;
      v8 += 4;
      if (v214) {
        v219[v213] = 1065353216;
      }
      else {
        v219[v213] = 0;
      }
    }
    else if (([(id)v3 bundleIDType] & 8) != 0)
    {
      uint64_t v102 = [(id)v3 L2FeatureVector];
      [v102 scoreForFeature:126];
      int v104 = v103;

      __int16 v105 = 2333;
LABEL_116:
      v218[v8] = v105;
      v219[v8++] = v104;
    }
  }
  if ((*(_WORD *)(v3 + 442) & 0x204) != 0)
  {
    uint64_t v112 = [(id)v3 L2FeatureVector];
    [v112 scoreForFeature:308];
    float v114 = v113;

    if (v114 == 1.0)
    {
      v218[v8] = 2329;
      v219[v8++] = 1065353216;
    }
  }
  if ((*(_DWORD *)(v3 + 440) & 0x100008) != 0)
  {
    [*(id *)(v3 + 256) scoreForFeature:2367];
    float v116 = v115;
    [*(id *)(v3 + 256) scoreForFeature:2368];
    float v118 = v117;
    [*(id *)(v3 + 256) scoreForFeature:2372];
    float v120 = v119;
    [*(id *)(v3 + 256) scoreForFeature:2373];
    float v122 = v121;
    [*(id *)(v3 + 256) scoreForFeature:2375];
    float v124 = v123;
    [*(id *)(v3 + 256) scoreForFeature:2376];
    float v126 = 2.0;
    if (v120 != 0.0 || v122 != 0.0 || (float v126 = 1.5, v116 != 0.0) || v118 != 0.0 || v124 != 0.0 || v125 != 0.0)
    {
      v218[v8] = 216;
      *(float *)&v219[v8++] = v126;
    }
  }
  if ([v5 isNLSearch])
  {
    unint64_t v127 = [v5 rankCategories];
    long long v128 = [v127 firstObject];

    int v129 = [(id)v3 isInSectionWithRankCategory:v128];
    v218[v8] = 2390;
    uint64_t v130 = v8 + 1;
    if (v129)
    {
      v219[v8] = 1065353216;
      unint64_t v131 = +[PRSRankingItem bundlesExcludedFromRankCategory];
      long long v132 = [v131 valueForKey:v128];
      int v133 = [v132 isEqualToString:*(void *)(v3 + 224)];
      float v134 = 0.0;
      if (v133) {
        float v134 = 1.0;
      }
      v218[v130] = 2391;
      *(float *)&v219[v130] = v134;
      uint64_t v130 = v8 + 2;
    }
    else
    {
      v219[v8] = 0;
    }
    v218[v130] = 365;
    v219[v130] = 1065353216;

    uint64_t v8 = v130;
  }
  else
  {
    v218[v8] = 365;
    v219[v8] = 0;
  }
  uint64_t v135 = v8 + 1;
  uint64_t v136 = *(void *)(v3 + 440);
  if ((v136 & 0x2040000) != 0)
  {
    [*(id *)(v3 + 256) scoreForFeature:2728];
    v219[v135] = v137;
    [*(id *)(v3 + 256) scoreForFeature:2733];
    BOOL v138 = &v219[v8];
    v138[2] = v139;
    [*(id *)(v3 + 256) scoreForFeature:2778];
    v138[3] = v140;
    [*(id *)(v3 + 256) scoreForFeature:2783];
    v138[4] = v141;
    [*(id *)(v3 + 256) scoreForFeature:2678];
    v138[5] = v142;
    [*(id *)(v3 + 256) scoreForFeature:2683];
    v138[6] = v143;
    [*(id *)(v3 + 256) scoreForFeature:2733];
    v138[7] = v144;
    *(_OWORD *)&v218[v135] = xmmword_1BDC5DC40;
    uint64_t v135 = v8 + 9;
    v138[8] = -1082130432;
    uint64_t v136 = *(void *)(v3 + 440);
  }
  if ((v136 & 0x2000000) != 0)
  {
    int v217 = 0;
    if (SSCompactRankingAttrsGetFloat(*(void *)(v3 + 304), 0x90uLL, &v217))
    {
      v218[v135] = 2388;
      v219[v135++] = v217;
    }
    if (SSCompactRankingAttrsGetFloat(*(void *)(v3 + 304), 0x91uLL, &v217))
    {
      v218[v135] = 2389;
      v219[v135++] = v217;
    }
    [*(id *)(v3 + 256) scoreForFeature:2367];
    float v146 = v145;
    [*(id *)(v3 + 256) scoreForFeature:2362];
    float v148 = v147;
    [*(id *)(v3 + 256) scoreForFeature:2366];
    if (v146 == 1.0 || v149 == 1.0 || v148 == 1.0) {
      *(unsigned char *)(v3 + 62) = 1;
    }
  }
  unint64_t v150 = SSCompactRankingAttrsGetValue(*(int8x8_t **)(v3 + 304), 0xAFuLL);
  unint64_t v151 = v150;
  if (v150)
  {
    uint64_t v152 = [v150 integerValue];
    LODWORD(v153) = 1.0;
    if (v152 > 0)
    {
LABEL_149:
      v218[v135] = 3101;
      v219[v135++] = LODWORD(v153);
      goto LABEL_151;
    }
    if (!objc_msgSend(v151, "integerValue", v153))
    {
      LODWORD(v153) = 0;
      goto LABEL_149;
    }
  }
LABEL_151:
  if (([(id)v3 bundleIDType] & 0x10) != 0)
  {
    unint64_t v154 = [(id)v3 L2FeatureVector];
    [v154 scoreForFeature:127];
    int v156 = v155;

    v218[v135] = 3229;
    uint64_t v157 = v135 + 1;
    v219[v135] = v156;
    unint64_t v158 = [(id)v3 L2FeatureVector];
    [v158 scoreForFeature:91];
    int v160 = v159;

    v218[v157] = 3230;
    uint64_t v161 = v135 + 2;
    v219[v157] = v160;
    float v162 = [(id)v3 L2FeatureVector];
    [v162 scoreForFeature:2469];
    int v164 = v163;

    v218[v161] = 3231;
    uint64_t v165 = v135 + 3;
    v219[v161] = v164;
    unint64_t v166 = [(id)v3 L2FeatureVector];
    [v166 scoreForFeature:2470];
    int v168 = v167;

    v218[v165] = 3232;
    v135 += 4;
    v219[v165] = v168;
  }
  [*(id *)(v3 + 256) setScores:v219 forFeatures:v218 count:v135];
  if ((*(_WORD *)(v3 + 442) & 0x204) != 0)
  {
    if (!*(void *)(v3 + 568)) {
      *(void *)(v3 + 568) = malloc_type_calloc(0x22uLL, 4uLL, 0x100004052888210uLL);
    }
    [*(id *)(v3 + 256) scoreForFeature:158];
    **(_DWORD **)(v3 + 568) = v169;
    [*(id *)(v3 + 256) scoreForFeature:1373];
    *(_DWORD *)(*(void *)(v3 + 568) + 4) = v170;
    [*(id *)(v3 + 256) scoreForFeature:1086];
    *(_DWORD *)(*(void *)(v3 + 568) + 8) = v171;
    [*(id *)(v3 + 256) scoreForFeature:132];
    *(_DWORD *)(*(void *)(v3 + 568) + 12) = v172;
    [*(id *)(v3 + 256) scoreForFeature:156];
    *(_DWORD *)(*(void *)(v3 + 568) + 16) = v173;
    [*(id *)(v3 + 256) scoreForFeature:1537];
    *(_DWORD *)(*(void *)(v3 + 568) + 20) = v174;
    [*(id *)(v3 + 256) scoreForFeature:1496];
    *(_DWORD *)(*(void *)(v3 + 568) + 24) = v175;
    [*(id *)(v3 + 256) scoreForFeature:1578];
    *(_DWORD *)(*(void *)(v3 + 568) + 28) = v176;
    [*(id *)(v3 + 256) scoreForFeature:1332];
    *(_DWORD *)(*(void *)(v3 + 568) + 32) = v177;
    [*(id *)(v3 + 256) scoreForFeature:1250];
    *(_DWORD *)(*(void *)(v3 + 568) + 36) = v178;
    [*(id *)(v3 + 256) scoreForFeature:1127];
    *(_DWORD *)(*(void *)(v3 + 568) + 40) = v179;
    [*(id *)(v3 + 256) scoreForFeature:1414];
    *(_DWORD *)(*(void *)(v3 + 568) + 44) = v180;
    [*(id *)(v3 + 256) scoreForFeature:1455];
    *(_DWORD *)(*(void *)(v3 + 568) + 48) = v181;
    [*(id *)(v3 + 256) scoreForFeature:1291];
    *(_DWORD *)(*(void *)(v3 + 568) + 52) = v182;
    [*(id *)(v3 + 256) scoreForFeature:1168];
    *(_DWORD *)(*(void *)(v3 + 568) + 56) = v183;
    [*(id *)(v3 + 256) scoreForFeature:1209];
    *(_DWORD *)(*(void *)(v3 + 568) + 60) = v184;
    [*(id *)(v3 + 256) scoreForFeature:159];
    *(_DWORD *)(*(void *)(v3 + 568) + 64) = v185;
    [*(id *)(v3 + 256) scoreForFeature:1366];
    *(_DWORD *)(*(void *)(v3 + 568) + 68) = v186;
    [*(id *)(v3 + 256) scoreForFeature:1079];
    *(_DWORD *)(*(void *)(v3 + 568) + 72) = v187;
    [*(id *)(v3 + 256) scoreForFeature:133];
    *(_DWORD *)(*(void *)(v3 + 568) + 76) = v188;
    [*(id *)(v3 + 256) scoreForFeature:157];
    *(_DWORD *)(*(void *)(v3 + 568) + 80) = v189;
    [*(id *)(v3 + 256) scoreForFeature:1530];
    *(_DWORD *)(*(void *)(v3 + 568) + 84) = v190;
    [*(id *)(v3 + 256) scoreForFeature:1489];
    *(_DWORD *)(*(void *)(v3 + 568) + 88) = v191;
    [*(id *)(v3 + 256) scoreForFeature:1571];
    *(_DWORD *)(*(void *)(v3 + 568) + 92) = v192;
    [*(id *)(v3 + 256) scoreForFeature:1325];
    *(_DWORD *)(*(void *)(v3 + 568) + 96) = v193;
    [*(id *)(v3 + 256) scoreForFeature:1243];
    *(_DWORD *)(*(void *)(v3 + 568) + 100) = v194;
    [*(id *)(v3 + 256) scoreForFeature:1120];
    *(_DWORD *)(*(void *)(v3 + 568) + 104) = v195;
    [*(id *)(v3 + 256) scoreForFeature:1407];
    *(_DWORD *)(*(void *)(v3 + 568) + 108) = v196;
    [*(id *)(v3 + 256) scoreForFeature:1448];
    *(_DWORD *)(*(void *)(v3 + 568) + 112) = v197;
    [*(id *)(v3 + 256) scoreForFeature:1284];
    *(_DWORD *)(*(void *)(v3 + 568) + 116) = v198;
    [*(id *)(v3 + 256) scoreForFeature:1161];
    *(_DWORD *)(*(void *)(v3 + 568) + 120) = v199;
    [*(id *)(v3 + 256) scoreForFeature:1202];
    *(_DWORD *)(*(void *)(v3 + 568) + 124) = v200;
  }
}

- (void)populateParsecRemainingFeatures
{
  uint64_t v2 = (id *)((uint64_t (*)(PRSRankingItem *, SEL))MEMORY[0x1F4188790])(self, a2);
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  bzero(v26, 0x328CuLL);
  bzero(v25, 0x1946uLL);
  uint64_t v3 = [v2 L2FeatureVector];
  id v4 = [v3 bundleID];

  if ([v4 isEqualToString:@"com.apple.parsec.web_index"])
  {
    id v5 = [v2 L2FeatureVector];
    [v5 scoreForFeature:2178];
    int v7 = v6;

    v25[0] = 2331;
    v26[0] = v7;
    uint64_t v8 = 1;
  }
  else
  {
    uint64_t v8 = 0;
  }
  if ([v4 isEqualToString:@"com.apple.parsec.bing"])
  {
    unint64_t v9 = [v2 L2FeatureVector];
    [v9 scoreForFeature:2178];
    int v11 = v10;

    v25[v8] = 2332;
    v26[v8++] = v11;
  }
  if ([v4 isEqualToString:@"com.apple.parsec.news"])
  {
    float v12 = [v2[32] roundTripFeatures];
    uint64_t v13 = [v12 objectForKey:@"roundtrip_result_age"];
    if (!v13)
    {
      uint64_t v13 = [v12 objectForKey:@"roundtrip_news_result_age"];
      if (!v13) {
        goto LABEL_28;
      }
    }
    float v14 = (void *)v13;
    __int16 v15 = 2320;
    goto LABEL_26;
  }
  if ([v4 isEqualToString:@"com.apple.parsec.maps"])
  {
    float v12 = [v2[32] roundTripFeatures];
    id v16 = [v12 objectForKey:@"roundtrip_distance"];
    if (!v16)
    {
      id v16 = [v12 objectForKey:@"roundtrip_maps_distance"];
      if (!v16) {
        goto LABEL_22;
      }
    }
    [v16 floatValue];
    __int16 v18 = 2321;
  }
  else
  {
    if (![v4 isEqualToString:@"com.apple.parsec.itunes.iosSoftware"])
    {
      if (![v4 isEqualToString:@"com.apple.parsec.kg"]) {
        goto LABEL_29;
      }
      float v12 = [v2[32] roundTripFeatures];
      float v14 = [v12 objectForKey:@"roundtrip_prediction_score"];
      if (!v14) {
        goto LABEL_27;
      }
      __int16 v15 = 2326;
      goto LABEL_26;
    }
    float v12 = [v2[32] roundTripFeatures];
    BOOL v19 = [v12 objectForKey:@"roundtrip_user_rating_count"];
    if (v19
      || ([v12 objectForKey:@"roundtrip_apps_user_rating_count"],
          (BOOL v19 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      [v19 floatValue];
      v25[v8] = 2322;
      v26[v8] = v20;

      ++v8;
    }
    id v16 = [v12 objectForKey:@"roundtrip_user_rating_value"];
    if (!v16)
    {
      id v16 = [v12 objectForKey:@"roundtrip_apps_user_rating_value"];
      if (!v16) {
        goto LABEL_22;
      }
    }
    [v16 floatValue];
    __int16 v18 = 2323;
  }
  v25[v8] = v18;
  v26[v8] = v17;

  ++v8;
LABEL_22:
  id v21 = [v12 objectForKey:@"roundtrip_num_engaged"];
  float v22 = v21;
  if (v21)
  {
    [v21 floatValue];
    v25[v8] = 2324;
    v26[v8++] = v23;
  }
  float v14 = [v12 objectForKey:@"roundtrip_num_shown"];

  if (!v14) {
    goto LABEL_27;
  }
  __int16 v15 = 2325;
LABEL_26:
  [v14 floatValue];
  v25[v8] = v15;
  v26[v8++] = v24;
LABEL_27:

LABEL_28:
LABEL_29:
  [v2[32] setScores:v26 forFeatures:v25 count:v8];
}

- (id)getBundleSpecificValue:(id)a3 forPropertyName:(id)a4 withQueryString:(id)a5 isCJK:(BOOL)a6 isBullseyeSearch:(BOOL)a7 withEvaluator:(id)a8 keyboardLanguage:(id)a9 seenAuthorEmail:(BOOL)a10 seenPrimaryRecipientEmail:(BOOL)a11
{
  unint64_t v12 = a7;
  uint64_t v16 = a10;
  uint64_t v17 = (uint64_t)a9;
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  id v177 = a8;
  id v21 = a9;
  uint64_t v188 = 0;
  int v189 = (id *)&v188;
  uint64_t v190 = 0x3032000000;
  int v191 = __Block_byref_object_copy__10;
  int v192 = __Block_byref_object_dispose__10;
  id v193 = 0;
  id v22 = v18;
  id v193 = v22;
  unint64_t bundleIDType = self->_bundleIDType;
  if ((bundleIDType & 0x200000) != 0)
  {
    if ([v19 isEqualToString:*MEMORY[0x1E4F23658]]) {
      goto LABEL_6;
    }
    unint64_t bundleIDType = self->_bundleIDType;
  }
  if (bundleIDType & 0x2040000) != 0 && ([v19 isEqualToString:*MEMORY[0x1E4F235C0]]) {
    goto LABEL_6;
  }
  if (!v22)
  {
    unint64_t v40 = self->_bundleIDType;
    if ((v40 & 0x10) != 0)
    {
      if ([v19 isEqualToString:*MEMORY[0x1E4F22CE8]]) {
        goto LABEL_8;
      }
      unint64_t v40 = self->_bundleIDType;
    }
    if ((v40 & 0x200000) != 0)
    {
      if ([v19 isEqualToString:*MEMORY[0x1E4F22CE8]]) {
        goto LABEL_8;
      }
      unint64_t v40 = self->_bundleIDType;
    }
    if ((v40 & 0x20) == 0 || ![v19 isEqualToString:*MEMORY[0x1E4F22CE8]])
    {
LABEL_6:
      id v24 = 0;
      goto LABEL_36;
    }
  }
LABEL_8:
  if (([(PRSRankingItem *)self bundleIDType] & 0x20) != 0
    && [v19 isEqualToString:*MEMORY[0x1E4F23658]])
  {
    id v25 = v21;
    for (uint64_t i = 0; i != 3; ++i)
    {
      uint64_t v27 = sSeparatorList[i];
      if (([v20 containsString:v27] & 1) == 0)
      {
        uint64_t v28 = [v189[5] stringByReplacingOccurrencesOfString:v27 withString:@" "];
        id v29 = v189[5];
        v189[5] = (id)v28;
      }
    }
    id v21 = v25;
    goto LABEL_35;
  }
  if (([(PRSRankingItem *)self bundleIDType] & 0x20) != 0)
  {
    int v30 = [v19 isEqualToString:*MEMORY[0x1E4F22CE8]] ^ 1;
    if (v22) {
      LOBYTE(v30) = 1;
    }
    if ((v30 & 1) == 0)
    {
      float v31 = SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0xCuLL);
      objc_opt_class();
      id v32 = v21;
      if (objc_opt_isKindOfClass()) {
        objc_storeStrong(v189 + 5, v31);
      }
      unint64_t v33 = (unint64_t)v31;
      for (uint64_t j = 0; j != 3; ++j)
      {
        float v35 = sSeparatorList[j];
        if (([v20 containsString:v35] & 1) == 0)
        {
          uint64_t v36 = [v189[5] stringByReplacingOccurrencesOfString:v35 withString:@" "];
          id v37 = v189[5];
          v189[5] = (id)v36;
        }
      }
      id v21 = v32;
      goto LABEL_26;
    }
  }
  if (([(PRSRankingItem *)self bundleIDType] & 2) != 0
    && ([v19 isEqualToString:*MEMORY[0x1E4F22CE8]] & 1) != 0
    || ([(PRSRankingItem *)self bundleIDType] & 0x40) != 0
    && [v19 isEqualToString:*MEMORY[0x1E4F22CE8]])
  {
    if (([v20 containsString:@","] & 1) == 0)
    {
      uint64_t v38 = [v189[5] stringByReplacingOccurrencesOfString:@"," withString:@" "];
LABEL_33:
      unint64_t v12 = (unint64_t)v189[5];
      v189[5] = (id)v38;
      goto LABEL_34;
    }
    goto LABEL_35;
  }
  if ((self->_bundleIDType & 0x100) != 0 && [v19 isEqualToString:*MEMORY[0x1E4F22CE8]])
  {
    float v41 = [v189[5] lowercaseString];
    uint64_t v42 = [v20 lowercaseString];
    char v43 = [v41 hasPrefix:v42];

    if (v43) {
      goto LABEL_35;
    }
    unint64_t v12 = SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x176uLL);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v44 = v12;
      BOOL v45 = [v189[5] componentsSeparatedByString:@" "];
      float v46 = [(id)v12 componentsSeparatedByString:@" "];
      if ([v46 count])
      {
        if ((unint64_t)[v45 count] >= 2)
        {
          int v174 = [v45 objectAtIndex:0];
          uint64_t v47 = [v46 objectAtIndex:0];
          int v48 = [v174 isEqualToString:v47];

          if (v48)
          {
            float v49 = objc_msgSend(v45, "subarrayWithRange:", 1, objc_msgSend(v45, "count") - 1);
            uint64_t v50 = [v49 componentsJoinedByString:@" "];
            id v51 = v189[5];
            v189[5] = (id)v50;

            self->_vendorNameIsDisplayNamePrefix = 1;
          }
        }
      }

      unint64_t v12 = v44;
    }
    goto LABEL_34;
  }
  if (([(PRSRankingItem *)self bundleIDType] & 2) == 0
    || ([v19 isEqualToString:*MEMORY[0x1E4F22CD0]] & v12) != 1)
  {
    if (([(PRSRankingItem *)self bundleIDType] & 4) != 0)
    {
      if (![v19 isEqualToString:*MEMORY[0x1E4F22CE8]]
        || !+[PRSRankingUtilities somePotentialPhoneNumbersInString:](PRSRankingUtilities, "somePotentialPhoneNumbersInString:", v20)|| +[PRSRankingUtilities somePotentialPhoneNumbersInString:v189[5]])
      {
        goto LABEL_35;
      }
      uint64_t v60 = +[PRSRankingUtilities onlyPotentialPhoneNumbersInString:v20];

      if (!v60)
      {
        id v20 = 0;
        goto LABEL_35;
      }
      unint64_t v12 = SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x27uLL);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v20 = (id)v60;
        goto LABEL_34;
      }
      uint64_t v61 = [(id)v12 count];
      float v62 = (void *)v12;
      *(void *)&long long v185 = 0;
      *((void *)&v185 + 1) = &v185;
      uint64_t v186 = 0x2020000000;
      char v187 = 0;
      int v173 = (void *)[objc_alloc(MEMORY[0x1E4F237B8]) initWithQuery:v60 language:v21 fuzzyThreshold:0 options:0];
      [v177 setMatchOncePerTerm:0];
      int v170 = (void *)v60;
      id v176 = v21;
      if (v61)
      {
        uint64_t v63 = 0;
        while (1)
        {
          float v64 = [v62 objectAtIndex:v63];
          float v65 = +[PRSRankingUtilities onlyPotentialPhoneNumbersInString:v64];

          if (v65)
          {
            v181[0] = MEMORY[0x1E4F143A8];
            v181[1] = 3221225472;
            v181[2] = __169__PRSRankingItem_getBundleSpecificValue_forPropertyName_withQueryString_isCJK_isBullseyeSearch_withEvaluator_keyboardLanguage_seenAuthorEmail_seenPrimaryRecipientEmail___block_invoke;
            v181[3] = &unk_1E635A608;
            int v183 = &v188;
            id v66 = v65;
            id v182 = v66;
            int v184 = &v185;
            [v173 evaluateAttribute:v66 ignoreSubtokens:0 strongCompounds:1 skipTranscriptions:1 withHandler:v181];
            int v67 = *(unsigned __int8 *)(*((void *)&v185 + 1) + 24);

            if (v67) {
              break;
            }
          }

          if (v61 == ++v63) {
            goto LABEL_211;
          }
        }
      }
LABEL_211:

      _Block_object_dispose(&v185, 8);
      id v20 = v170;
      id v21 = v176;
      unint64_t v12 = (unint64_t)v62;
      goto LABEL_34;
    }
    unint64_t v52 = self->_bundleIDType;
    if ((v52 & 0x2040000) != 0)
    {
      if ([v19 isEqualToString:*MEMORY[0x1E4F235C0]])
      {
        int v175 = v21;
        id v53 = v189[5];
        v189[5] = 0;

        uint64_t v54 = [v177 queryTerms];
        uint64_t v172 = [(id)v54 count];

        *(void *)((char *)&v185 + 6) = 0;
        *(void *)&long long v185 = 0;
        memset(v180, 0, 14);
        memset(v179, 0, 14);
        memset(v178, 0, 14);
        int v169 = SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x1FuLL);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          unint64_t v12 = (unint64_t)v169;
          uint64_t v54 = v169;
          (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts + 2))((uint64_t)updateMatchCounts, v177, v21, (void *)v54, &v185);
          if ((*((BOOL (**)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int))hasMatchWithCounts
                + 2))((uint64_t)hasMatchWithCounts, v172, v185, DWORD2(v185) | ((unint64_t)WORD6(v185) << 32), 1, 0, 1))
          {
            id v55 = v189[5];
            v189[5] = (id)v54;

            uint64_t v56 = 0;
            unint64_t v158 = 0;
            int v159 = 0;
            float v162 = 0;
            int v163 = 0;
            int v164 = 0;
            float v57 = 0;
            float v58 = 0;
            uint64_t v16 = 0;
            int v167 = 0;
            int v168 = 0;
            id obj = 0;
            uint64_t v161 = 0;
            int v59 = 0;

LABEL_265:
LABEL_34:

            goto LABEL_35;
          }
        }
        int v168 = SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x80uLL);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v79 = [v168 count];
          uint64_t v54 = 14 * v79;
          uint64_t v16 = (uint64_t)malloc_type_malloc(14 * v79, 0x100004018756113uLL);
          bzero((void *)v16, 14 * v79);
          double v153 = (unint64_t *)v16;
          if (v79)
          {
            unint64_t v12 = 0;
            while (1)
            {
              uint64_t v54 = [v168 objectAtIndex:v12];
              (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts + 2))((uint64_t)updateMatchCounts, v177, v21, (void *)v54, (_WORD *)v16);
              uint64_t v17 = v17 & 0xFFFF000000000000 | *(unsigned int *)(v16 + 8) | ((unint64_t)*(unsigned __int16 *)(v16 + 12) << 32);
              if ((*((BOOL (**)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int))hasMatchWithCounts
                    + 2))((uint64_t)hasMatchWithCounts, v172, *(void *)v16, v17, 1, 0, 1))
              {
                break;
              }

              ++v12;
              v16 += 14;
              if (v79 == v12) {
                goto LABEL_114;
              }
            }
            unint64_t v158 = 0;
            int v144 = 0;
            float v145 = 0;
            int v155 = 0;
            id v160 = 0;
            uint64_t v161 = 0;
            float v148 = 0;
            float v149 = 0;
            int v163 = 0;
            int v164 = 0;
            uint64_t v165 = 0;
            id obj = 0;
            unint64_t v151 = 0;
            uint64_t v152 = 0;
            int v167 = 0;
            float v81 = 0;
            uint64_t v16 = 0;
            float v57 = 0;
            unint64_t v150 = 0;
            float v146 = 0;
            float v147 = 0;
            float v162 = 0;
            int v159 = 0;
            int v143 = 0;
            unint64_t v154 = 0;
            id v83 = v189[5];
            v189[5] = (id)v54;
LABEL_124:

            unint64_t v12 = (unint64_t)v169;
            int v85 = v152;
            int v84 = v153;
            goto LABEL_241;
          }
        }
        else
        {
          double v153 = 0;
        }
LABEL_114:
        SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x79uLL);
        uint64_t v157 = (unint64_t *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v16 = (uint64_t)v157;
          uint64_t v54 = v157;
          (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts + 2))((uint64_t)updateMatchCounts, v177, v21, (void *)v54, v180);
          if ((*((BOOL (**)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int))hasMatchWithCounts
                + 2))((uint64_t)hasMatchWithCounts, v172, v180[0], LODWORD(v180[1]) | ((unint64_t)WORD2(v180[1]) << 32), 1, 0, 1))
          {
            unint64_t v154 = 0;
            int v143 = 0;
            int v144 = 0;
            unint64_t v158 = 0;
            int v159 = 0;
            float v146 = 0;
            float v147 = 0;
            float v162 = 0;
            int v163 = 0;
            int v164 = 0;
            uint64_t v165 = 0;
            unint64_t v150 = 0;
            unint64_t v151 = 0;
            float v57 = 0;
            uint64_t v152 = 0;
            unint64_t v12 = 0;
            id v80 = 0;
            float v81 = 0;
            int v167 = 0;
            float v148 = 0;
            float v149 = 0;
            uint64_t v161 = 0;
            int v155 = 0;
            float v145 = 0;
            id v82 = v189[5];
            v189[5] = (id)v54;
LABEL_130:
            int v84 = v153;
LABEL_239:

            id v160 = (id)v12;
            id obj = v80;
            goto LABEL_240;
          }
        }
        SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0xCuLL);
        id obj = (id)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v80 = obj;
          (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts + 2))((uint64_t)updateMatchCounts, v177, v21, v80, v178);
          if ((*((BOOL (**)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int))hasMatchWithCounts
                + 2))((uint64_t)hasMatchWithCounts, v172, v178[0], LODWORD(v178[1]) | ((unint64_t)WORD2(v178[1]) << 32), 1, 0, 1))
          {
            unint64_t v154 = 0;
            int v155 = 0;
            int v143 = 0;
            int v144 = 0;
            unint64_t v158 = 0;
            int v159 = 0;
            float v146 = 0;
            float v147 = 0;
            float v162 = 0;
            int v163 = 0;
            int v164 = 0;
            uint64_t v165 = 0;
            unint64_t v150 = 0;
            unint64_t v151 = 0;
            float v57 = 0;
            uint64_t v152 = 0;
            unint64_t v12 = 0;
            float v81 = 0;
            int v167 = 0;
            float v148 = 0;
            float v149 = 0;
            uint64_t v161 = 0;
            float v145 = 0;
            id v82 = v189[5];
            v189[5] = v80;
LABEL_129:
            uint64_t v16 = (uint64_t)v157;
            goto LABEL_130;
          }
        }
        SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 6uLL);
        id v160 = (id)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          unint64_t v12 = (unint64_t)v160;
          (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts + 2))((uint64_t)updateMatchCounts, v177, v21, (void *)v12, v179);
          if ((*((BOOL (**)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int))hasMatchWithCounts
                + 2))((uint64_t)hasMatchWithCounts, v172, v179[0], LODWORD(v179[1]) | ((unint64_t)WORD2(v179[1]) << 32), 1, 0, 1))
          {
            unint64_t v154 = 0;
            int v155 = 0;
            int v143 = 0;
            int v144 = 0;
            unint64_t v158 = 0;
            int v159 = 0;
            float v146 = 0;
            float v147 = 0;
            float v162 = 0;
            int v163 = 0;
            int v164 = 0;
            uint64_t v165 = 0;
            unint64_t v150 = 0;
            unint64_t v151 = 0;
            float v57 = 0;
            uint64_t v152 = 0;
            float v81 = 0;
            int v167 = 0;
            float v148 = 0;
            float v149 = 0;
            uint64_t v161 = 0;
            float v145 = 0;
            id v82 = v189[5];
            v189[5] = (id)v12;
            id v80 = obj;
            goto LABEL_129;
          }
        }
        int v167 = SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x87uLL);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v86 = [v167 count];
          uint64_t v54 = 14 * v86;
          uint64_t v16 = (uint64_t)malloc_type_malloc(14 * v86, 0x100004018756113uLL);
          bzero((void *)v16, 14 * v86);
          int v142 = (unint64_t *)v16;
          if (v86)
          {
            unint64_t v12 = 0;
            while (1)
            {
              uint64_t v54 = [v167 objectAtIndex:v12];
              (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts + 2))((uint64_t)updateMatchCounts, v177, v21, (void *)v54, (_WORD *)v16);
              uint64_t v17 = v17 & 0xFFFF000000000000 | *(unsigned int *)(v16 + 8) | ((unint64_t)*(unsigned __int16 *)(v16 + 12) << 32);
              if ((*((BOOL (**)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int))hasMatchWithCounts
                    + 2))((uint64_t)hasMatchWithCounts, v172, *(void *)v16, v17, 1, 0, 1))
              {
                break;
              }

              ++v12;
              v16 += 14;
              if (v86 == v12) {
                goto LABEL_139;
              }
            }
            unint64_t v154 = 0;
            int v155 = 0;
            int v143 = 0;
            int v144 = 0;
            unint64_t v158 = 0;
            int v159 = 0;
            float v146 = 0;
            float v147 = 0;
            float v162 = 0;
            int v163 = 0;
            int v164 = 0;
            uint64_t v165 = 0;
            unint64_t v150 = 0;
            unint64_t v151 = 0;
            float v57 = 0;
            uint64_t v152 = 0;
            float v148 = 0;
            float v149 = 0;
            uint64_t v161 = 0;
            float v145 = 0;
            id v82 = v189[5];
            v189[5] = (id)v54;
            unint64_t v12 = (unint64_t)v160;
            id v80 = obj;
            uint64_t v16 = (uint64_t)v157;
            goto LABEL_238;
          }
        }
        else
        {
          int v142 = 0;
        }
LABEL_139:
        int v156 = SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x86uLL);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v87 = [v156 count];
          uint64_t v54 = 14 * v87;
          uint64_t v16 = (uint64_t)malloc_type_malloc(14 * v87, 0x100004018756113uLL);
          bzero((void *)v16, 14 * v87);
          uint64_t v152 = (void *)v16;
          if (v87)
          {
            unint64_t v12 = 0;
            while (1)
            {
              uint64_t v54 = [v156 objectAtIndex:v12];
              (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts + 2))((uint64_t)updateMatchCounts, v177, v21, (void *)v54, (_WORD *)v16);
              uint64_t v17 = v17 & 0xFFFF000000000000 | *(unsigned int *)(v16 + 8) | ((unint64_t)*(unsigned __int16 *)(v16 + 12) << 32);
              if ((*((BOOL (**)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int))hasMatchWithCounts
                    + 2))((uint64_t)hasMatchWithCounts, v172, *(void *)v16, v17, 1, 0, 1))
              {
                break;
              }

              ++v12;
              v16 += 14;
              if (v87 == v12) {
                goto LABEL_146;
              }
            }
            unint64_t v154 = 0;
            int v143 = 0;
            int v159 = 0;
            float v146 = 0;
            float v147 = 0;
            float v162 = 0;
            int v164 = 0;
            uint64_t v165 = 0;
            unint64_t v150 = 0;
            unint64_t v151 = 0;
            goto LABEL_213;
          }
        }
        else
        {
          uint64_t v152 = 0;
        }
LABEL_146:
        uint64_t v165 = SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x88uLL);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v88 = [v165 count];
          uint64_t v54 = 14 * v88;
          uint64_t v16 = (uint64_t)malloc_type_malloc(14 * v88, 0x100004018756113uLL);
          bzero((void *)v16, 14 * v88);
          unint64_t v151 = (unint64_t *)v16;
          if (v88)
          {
            unint64_t v12 = 0;
            while (1)
            {
              uint64_t v54 = [v165 objectAtIndex:v12];
              (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts + 2))((uint64_t)updateMatchCounts, v177, v21, (void *)v54, (_WORD *)v16);
              uint64_t v17 = v17 & 0xFFFF000000000000 | *(unsigned int *)(v16 + 8) | ((unint64_t)*(unsigned __int16 *)(v16 + 12) << 32);
              if ((*((BOOL (**)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int))hasMatchWithCounts
                    + 2))((uint64_t)hasMatchWithCounts, v172, *(void *)v16, v17, 1, 0, 1))
              {
                break;
              }

              ++v12;
              v16 += 14;
              if (v88 == v12) {
                goto LABEL_153;
              }
            }
            unint64_t v154 = 0;
            int v143 = 0;
            int v159 = 0;
            float v146 = 0;
            float v147 = 0;
            float v162 = 0;
            int v164 = 0;
            unint64_t v150 = 0;
LABEL_213:
            float v148 = 0;
            float v149 = 0;
            int v163 = 0;
            uint64_t v161 = 0;
            int v144 = 0;
            float v145 = 0;
            int v155 = 0;
            unint64_t v158 = 0;
            id v82 = v189[5];
            v189[5] = (id)v54;
LABEL_234:
            unint64_t v12 = (unint64_t)v160;
LABEL_235:
            id v80 = obj;
LABEL_236:
            id v21 = v175;
LABEL_237:
            float v57 = v156;
            uint64_t v16 = (uint64_t)v157;
LABEL_238:
            int v84 = v153;
            float v81 = v142;
            goto LABEL_239;
          }
        }
        else
        {
          unint64_t v151 = 0;
        }
LABEL_153:
        int v164 = SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x7FuLL);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v89 = [v164 count];
          uint64_t v54 = 14 * v89;
          uint64_t v16 = (uint64_t)malloc_type_malloc(14 * v89, 0x100004018756113uLL);
          bzero((void *)v16, 14 * v89);
          unint64_t v150 = (unint64_t *)v16;
          if (v89)
          {
            unint64_t v12 = 0;
            uint64_t v54 = (uint64_t)&_SpotlightDefineRankingTypes_[364];
            while (1)
            {
              uint64_t v90 = [v164 objectAtIndex:v12];
              (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts + 2))((uint64_t)updateMatchCounts, v177, v175, v90, (_WORD *)v16);
              uint64_t v17 = v17 & 0xFFFF000000000000 | *(unsigned int *)(v16 + 8) | ((unint64_t)*(unsigned __int16 *)(v16 + 12) << 32);
              if ((*((BOOL (**)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int))hasMatchWithCounts
                    + 2))((uint64_t)hasMatchWithCounts, v172, *(void *)v16, v17, 1, 0, 1))
              {
                break;
              }

              ++v12;
              v16 += 14;
              if (v89 == v12) {
                goto LABEL_163;
              }
            }
            objc_storeStrong(v189 + 5, v90);
            id v82 = v90;
            unint64_t v154 = 0;
            int v143 = 0;
            int v159 = 0;
            float v146 = 0;
            float v147 = 0;
            float v162 = 0;
            int v163 = 0;
            float v148 = 0;
            goto LABEL_231;
          }
        }
        else
        {
          unint64_t v150 = 0;
        }
LABEL_163:
        int v163 = SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x7DuLL);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v92 = [v163 count];
          uint64_t v54 = 14 * v92;
          uint64_t v16 = (uint64_t)malloc_type_malloc(14 * v92, 0x100004018756113uLL);
          bzero((void *)v16, 14 * v92);
          float v148 = (unint64_t *)v16;
          if (v92)
          {
            unint64_t v12 = 0;
            uint64_t v54 = (uint64_t)&_SpotlightDefineRankingTypes_[364];
            while (1)
            {
              float v93 = [v163 objectAtIndex:v12];
              (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts + 2))((uint64_t)updateMatchCounts, v177, v175, v93, (_WORD *)v16);
              uint64_t v17 = v17 & 0xFFFF000000000000 | *(unsigned int *)(v16 + 8) | ((unint64_t)*(unsigned __int16 *)(v16 + 12) << 32);
              if ((*((BOOL (**)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int))hasMatchWithCounts
                    + 2))((uint64_t)hasMatchWithCounts, v172, *(void *)v16, v17, 1, 0, 1))
              {
                break;
              }

              ++v12;
              v16 += 14;
              if (v92 == v12) {
                goto LABEL_171;
              }
            }
            objc_storeStrong(v189 + 5, v93);
            id v82 = v93;
            unint64_t v154 = 0;
            int v143 = 0;
            int v159 = 0;
            float v146 = 0;
            float v147 = 0;
            float v162 = 0;
            goto LABEL_231;
          }
        }
        else
        {
          float v148 = 0;
        }
LABEL_171:
        float v162 = SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x7AuLL);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v96 = [v162 count];
          uint64_t v54 = 14 * v96;
          uint64_t v16 = (uint64_t)malloc_type_malloc(14 * v96, 0x100004018756113uLL);
          bzero((void *)v16, 14 * v96);
          float v146 = (unint64_t *)v16;
          if (v96)
          {
            unint64_t v12 = 0;
            uint64_t v54 = (uint64_t)&_SpotlightDefineRankingTypes_[364];
            while (1)
            {
              int v97 = [v162 objectAtIndex:v12];
              (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts + 2))((uint64_t)updateMatchCounts, v177, v175, v97, (_WORD *)v16);
              uint64_t v17 = v17 & 0xFFFF000000000000 | *(unsigned int *)(v16 + 8) | ((unint64_t)*(unsigned __int16 *)(v16 + 12) << 32);
              if ((*((BOOL (**)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int))hasMatchWithCounts
                    + 2))((uint64_t)hasMatchWithCounts, v172, *(void *)v16, v17, 1, 0, 1))
              {
                break;
              }

              ++v12;
              v16 += 14;
              if (v96 == v12) {
                goto LABEL_178;
              }
            }
            objc_storeStrong(v189 + 5, v97);
            id v82 = v97;
            unint64_t v154 = 0;
            int v143 = 0;
            int v159 = 0;
            float v147 = 0;
LABEL_231:
            float v149 = 0;
            uint64_t v161 = 0;
LABEL_232:
            int v144 = 0;
            int v155 = 0;
LABEL_233:
            float v145 = 0;
            unint64_t v158 = 0;
            goto LABEL_234;
          }
        }
        else
        {
          float v146 = 0;
        }
LABEL_178:
        uint64_t v161 = SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x81uLL);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v98 = [v161 count];
          uint64_t v54 = 14 * v98;
          uint64_t v16 = (uint64_t)malloc_type_malloc(14 * v98, 0x100004018756113uLL);
          bzero((void *)v16, 14 * v98);
          float v149 = (unint64_t *)v16;
          if (v98)
          {
            unint64_t v12 = 0;
            uint64_t v54 = (uint64_t)&_SpotlightDefineRankingTypes_[364];
            while (1)
            {
              float v99 = [v161 objectAtIndex:v12];
              (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts + 2))((uint64_t)updateMatchCounts, v177, v175, v99, (_WORD *)v16);
              uint64_t v17 = v17 & 0xFFFF000000000000 | *(unsigned int *)(v16 + 8) | ((unint64_t)*(unsigned __int16 *)(v16 + 12) << 32);
              if ((*((BOOL (**)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int))hasMatchWithCounts
                    + 2))((uint64_t)hasMatchWithCounts, v172, *(void *)v16, v17, 1, 0, 1))
              {
                break;
              }

              ++v12;
              v16 += 14;
              if (v98 == v12) {
                goto LABEL_185;
              }
            }
            objc_storeStrong(v189 + 5, v99);
            id v82 = v99;
            unint64_t v154 = 0;
            int v143 = 0;
            int v159 = 0;
            float v147 = 0;
            goto LABEL_232;
          }
        }
        else
        {
          float v149 = 0;
        }
LABEL_185:
        int v159 = SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x85uLL);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v100 = [v159 count];
          uint64_t v54 = 14 * v100;
          uint64_t v16 = (uint64_t)malloc_type_malloc(14 * v100, 0x100004018756113uLL);
          bzero((void *)v16, 14 * v100);
          float v147 = (unint64_t *)v16;
          if (v100)
          {
            unint64_t v12 = 0;
            uint64_t v54 = (uint64_t)&_SpotlightDefineRankingTypes_[364];
            while (1)
            {
              uint64_t v101 = [v159 objectAtIndex:v12];
              (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts + 2))((uint64_t)updateMatchCounts, v177, v175, v101, (_WORD *)v16);
              uint64_t v17 = v17 & 0xFFFF000000000000 | *(unsigned int *)(v16 + 8) | ((unint64_t)*(unsigned __int16 *)(v16 + 12) << 32);
              if ((*((BOOL (**)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int))hasMatchWithCounts
                    + 2))((uint64_t)hasMatchWithCounts, v172, *(void *)v16, v17, 1, 0, 1))
              {
                break;
              }

              ++v12;
              v16 += 14;
              if (v100 == v12) {
                goto LABEL_196;
              }
            }
            objc_storeStrong(v189 + 5, v101);
            id v82 = v101;
            unint64_t v154 = 0;
            int v143 = 0;
            goto LABEL_232;
          }
        }
        else
        {
          float v147 = 0;
        }
LABEL_196:
        int v155 = SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x7EuLL);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v103 = [v155 count];
          uint64_t v54 = 14 * v103;
          uint64_t v16 = (uint64_t)malloc_type_malloc(14 * v103, 0x100004018756113uLL);
          bzero((void *)v16, 14 * v103);
          int v144 = (unint64_t *)v16;
          if (v103)
          {
            unint64_t v12 = 0;
            uint64_t v54 = (uint64_t)&_SpotlightDefineRankingTypes_[364];
            while (1)
            {
              int v104 = [v155 objectAtIndex:v12];
              (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts + 2))((uint64_t)updateMatchCounts, v177, v175, v104, (_WORD *)v16);
              uint64_t v17 = v17 & 0xFFFF000000000000 | *(unsigned int *)(v16 + 8) | ((unint64_t)*(unsigned __int16 *)(v16 + 12) << 32);
              if ((*((BOOL (**)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int))hasMatchWithCounts
                    + 2))((uint64_t)hasMatchWithCounts, v172, *(void *)v16, v17, 1, 0, 1))
              {
                break;
              }

              ++v12;
              v16 += 14;
              if (v103 == v12) {
                goto LABEL_204;
              }
            }
            objc_storeStrong(v189 + 5, v104);
            id v82 = v104;
            unint64_t v154 = 0;
            int v143 = 0;
            goto LABEL_233;
          }
        }
        else
        {
          int v144 = 0;
        }
LABEL_204:
        unint64_t v154 = SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x7BuLL);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v105 = [v154 count];
          uint64_t v54 = 14 * v105;
          uint64_t v16 = (uint64_t)malloc_type_malloc(14 * v105, 0x100004018756113uLL);
          bzero((void *)v16, 14 * v105);
          int v143 = (void *)v16;
          if (v105)
          {
            unint64_t v12 = 0;
            uint64_t v54 = (uint64_t)&_SpotlightDefineRankingTypes_[364];
            while (1)
            {
              uint64_t v106 = [v154 objectAtIndex:v12];
              (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts + 2))((uint64_t)updateMatchCounts, v177, v175, v106, (_WORD *)v16);
              uint64_t v17 = v17 & 0xFFFF000000000000 | *(unsigned int *)(v16 + 8) | ((unint64_t)*(unsigned __int16 *)(v16 + 12) << 32);
              if ((*((BOOL (**)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int))hasMatchWithCounts
                    + 2))((uint64_t)hasMatchWithCounts, v172, *(void *)v16, v17, 1, 0, 1))
              {
                break;
              }

              ++v12;
              v16 += 14;
              if (v105 == v12) {
                goto LABEL_215;
              }
            }
            objc_storeStrong(v189 + 5, v106);
            id v82 = v106;
            goto LABEL_233;
          }
        }
        else
        {
          int v143 = 0;
        }
LABEL_215:
        unint64_t v158 = SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x7CuLL);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v107 = [v158 count];
          uint64_t v54 = 14 * v107;
          uint64_t v16 = (uint64_t)malloc_type_malloc(14 * v107, 0x100004018756113uLL);
          bzero((void *)v16, 14 * v107);
          float v145 = (unint64_t *)v16;
          if (v107)
          {
            unint64_t v12 = 0;
            uint64_t v54 = (uint64_t)&_SpotlightDefineRankingTypes_[364];
            while (1)
            {
              float v108 = [v158 objectAtIndex:v12];
              (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts + 2))((uint64_t)updateMatchCounts, v177, v175, v108, (_WORD *)v16);
              uint64_t v17 = v17 & 0xFFFF000000000000 | *(unsigned int *)(v16 + 8) | ((unint64_t)*(unsigned __int16 *)(v16 + 12) << 32);
              if ((*((BOOL (**)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int))hasMatchWithCounts
                    + 2))((uint64_t)hasMatchWithCounts, v172, *(void *)v16, v17, 1, 0, 1))
              {
                break;
              }

              ++v12;
              v16 += 14;
              if (v107 == v12) {
                goto LABEL_223;
              }
            }
LABEL_487:
            objc_storeStrong(v189 + 5, v108);
            id v82 = v108;
            self->_topHitReasouint64_t n = 16;
            goto LABEL_234;
          }
        }
        else
        {
          float v145 = 0;
        }
LABEL_223:
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          int v141 = v169;
          if (!WORD6(v185)) {
            (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts + 2))((uint64_t)updateMatchCounts, v177, v175, v141, &v185);
          }
          if ((*((BOOL (**)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int))hasMatchWithCounts
                + 2))((uint64_t)hasMatchWithCounts, v172, v185, DWORD2(v185) | ((unint64_t)WORD6(v185) << 32), 1, 1, 0))
          {
            uint64_t v109 = v189 + 5;
            id v110 = v169;
LABEL_228:
            objc_storeStrong(v109, v110);
            unint64_t v12 = (unint64_t)v160;
            id v80 = obj;
            id v21 = v175;
            uint64_t v16 = (uint64_t)v157;
LABEL_283:
            int v84 = v153;
            id v82 = v141;
            float v81 = v142;
            float v57 = v156;
            goto LABEL_239;
          }
        }
        objc_opt_class();
        id v21 = v175;
        if (objc_opt_isKindOfClass())
        {
          unint64_t v12 = 0;
          uint64_t v54 = (uint64_t)&_SpotlightDefineRankingTypes_[364];
          uint64_t v17 = (uint64_t)v153;
          while (v12 < objc_msgSend(v168, "count", v141))
          {
            id v83 = [v168 objectAtIndex:v12];
            if (!*(_WORD *)(v17 + 12)) {
              (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts + 2))((uint64_t)updateMatchCounts, v177, v175, v83, (_WORD *)v17);
            }
            uint64_t v16 = v16 & 0xFFFF000000000000 | *(unsigned int *)(v17 + 8) | ((unint64_t)*(unsigned __int16 *)(v17 + 12) << 32);
            if ((*((BOOL (**)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int))hasMatchWithCounts
                  + 2))((uint64_t)hasMatchWithCounts, v172, *(void *)v17, v16, 1, 1, 0))
            {
              objc_storeStrong(v189 + 5, v83);
LABEL_286:
              float v57 = v156;
              uint64_t v16 = (uint64_t)v157;
              float v81 = v142;
              goto LABEL_124;
            }

            ++v12;
            v17 += 14;
          }
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v16 = (uint64_t)v157;
          int v141 = v157;
          if (!WORD2(v180[1])) {
            (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts + 2))((uint64_t)updateMatchCounts, v177, v175, v141, v180);
          }
          if ((*((BOOL (**)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int))hasMatchWithCounts
                + 2))((uint64_t)hasMatchWithCounts, v172, v180[0], LODWORD(v180[1]) | ((unint64_t)WORD2(v180[1]) << 32), 1, 1, 0))
          {
            int v111 = v189 + 5;
LABEL_282:
            objc_storeStrong(v111, (id)v16);
            unint64_t v12 = (unint64_t)v160;
            id v80 = obj;
            id v21 = v175;
            goto LABEL_283;
          }
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v112 = obj;
          if (!WORD2(v178[1])) {
            (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts + 2))((uint64_t)updateMatchCounts, v177, v175, v112, v178);
          }
          if ((*((BOOL (**)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int))hasMatchWithCounts
                + 2))((uint64_t)hasMatchWithCounts, v172, v178[0], LODWORD(v178[1]) | ((unint64_t)WORD2(v178[1]) << 32), 1, 1, 0))
          {
            goto LABEL_292;
          }
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v113 = v160;
          if (!WORD2(v179[1])) {
            (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts + 2))((uint64_t)updateMatchCounts, v177, v175, v113, v179);
          }
          if ((*((BOOL (**)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int))hasMatchWithCounts
                + 2))((uint64_t)hasMatchWithCounts, v172, v179[0], LODWORD(v179[1]) | ((unint64_t)WORD2(v179[1]) << 32), 1, 1, 0))
          {
            objc_storeStrong(v189 + 5, v160);
            id v82 = v113;
            unint64_t v12 = (unint64_t)v113;
            goto LABEL_235;
          }
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && (v141 = (unint64_t *)[v167 count], id v21 = v175, v141))
        {
          float v114 = 0;
          uint64_t v17 = (uint64_t)&_SpotlightDefineRankingTypes_[364];
          uint64_t v16 = (uint64_t)v142;
          while (1)
          {
            unint64_t v12 = objc_msgSend(v167, "objectAtIndex:", v114, v141);
            if (!*(_WORD *)(v16 + 12)) {
              (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts + 2))((uint64_t)updateMatchCounts, v177, v175, (void *)v12, (_WORD *)v16);
            }
            uint64_t v54 = v54 & 0xFFFF000000000000 | *(unsigned int *)(v16 + 8) | ((unint64_t)*(unsigned __int16 *)(v16 + 12) << 32);
            if ((*((BOOL (**)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int))hasMatchWithCounts
                  + 2))((uint64_t)hasMatchWithCounts, v172, *(void *)v16, v54, 1, 1, 0))
            {
              break;
            }

            float v114 = (unint64_t *)((char *)v114 + 1);
            v16 += 14;
            if (v141 == v114) {
              goto LABEL_307;
            }
          }
        }
        else
        {
LABEL_307:
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            && (v141 = (unint64_t *)[v156 count], id v21 = v175, v141))
          {
            float v115 = 0;
            uint64_t v17 = (uint64_t)&_SpotlightDefineRankingTypes_[364];
            uint64_t v16 = (uint64_t)v152;
            while (1)
            {
              unint64_t v12 = objc_msgSend(v156, "objectAtIndex:", v115, v141);
              if (!*(_WORD *)(v16 + 12)) {
                (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts + 2))((uint64_t)updateMatchCounts, v177, v175, (void *)v12, (_WORD *)v16);
              }
              uint64_t v54 = v54 & 0xFFFF000000000000 | *(unsigned int *)(v16 + 8) | ((unint64_t)*(unsigned __int16 *)(v16 + 12) << 32);
              if ((*((BOOL (**)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int))hasMatchWithCounts
                    + 2))((uint64_t)hasMatchWithCounts, v172, *(void *)v16, v54, 1, 1, 0))
              {
                break;
              }

              float v115 = (unint64_t *)((char *)v115 + 1);
              v16 += 14;
              if (v141 == v115) {
                goto LABEL_314;
              }
            }
          }
          else
          {
LABEL_314:
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0
              && (v141 = (unint64_t *)[v165 count], id v21 = v175, v141))
            {
              float v116 = 0;
              uint64_t v17 = (uint64_t)&_SpotlightDefineRankingTypes_[364];
              uint64_t v16 = (uint64_t)v151;
              while (1)
              {
                unint64_t v12 = objc_msgSend(v165, "objectAtIndex:", v116, v141);
                if (!*(_WORD *)(v16 + 12)) {
                  (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts + 2))((uint64_t)updateMatchCounts, v177, v175, (void *)v12, (_WORD *)v16);
                }
                uint64_t v54 = v54 & 0xFFFF000000000000 | *(unsigned int *)(v16 + 8) | ((unint64_t)*(unsigned __int16 *)(v16 + 12) << 32);
                if ((*((BOOL (**)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int))hasMatchWithCounts
                      + 2))((uint64_t)hasMatchWithCounts, v172, *(void *)v16, v54, 1, 1, 0))
                {
                  break;
                }

                float v116 = (unint64_t *)((char *)v116 + 1);
                v16 += 14;
                if (v141 == v116) {
                  goto LABEL_321;
                }
              }
            }
            else
            {
LABEL_321:
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0
                && (v141 = (unint64_t *)[v164 count], id v21 = v175, v141))
              {
                float v117 = 0;
                uint64_t v17 = (uint64_t)&_SpotlightDefineRankingTypes_[364];
                uint64_t v16 = (uint64_t)v150;
                while (1)
                {
                  unint64_t v12 = objc_msgSend(v164, "objectAtIndex:", v117, v141);
                  if (!*(_WORD *)(v16 + 12)) {
                    (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts + 2))((uint64_t)updateMatchCounts, v177, v175, (void *)v12, (_WORD *)v16);
                  }
                  uint64_t v54 = v54 & 0xFFFF000000000000 | *(unsigned int *)(v16 + 8) | ((unint64_t)*(unsigned __int16 *)(v16 + 12) << 32);
                  if ((*((BOOL (**)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int))hasMatchWithCounts
                        + 2))((uint64_t)hasMatchWithCounts, v172, *(void *)v16, v54, 1, 1, 0))
                  {
                    break;
                  }

                  float v117 = (unint64_t *)((char *)v117 + 1);
                  v16 += 14;
                  if (v141 == v117) {
                    goto LABEL_328;
                  }
                }
              }
              else
              {
LABEL_328:
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0
                  && (v141 = (unint64_t *)[v163 count], id v21 = v175, v141))
                {
                  float v118 = 0;
                  uint64_t v17 = (uint64_t)&_SpotlightDefineRankingTypes_[364];
                  uint64_t v16 = (uint64_t)v148;
                  while (1)
                  {
                    unint64_t v12 = objc_msgSend(v163, "objectAtIndex:", v118, v141);
                    if (!*(_WORD *)(v16 + 12)) {
                      (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts + 2))((uint64_t)updateMatchCounts, v177, v175, (void *)v12, (_WORD *)v16);
                    }
                    uint64_t v54 = v54 & 0xFFFF000000000000 | *(unsigned int *)(v16 + 8) | ((unint64_t)*(unsigned __int16 *)(v16 + 12) << 32);
                    if ((*((BOOL (**)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int))hasMatchWithCounts
                          + 2))((uint64_t)hasMatchWithCounts, v172, *(void *)v16, v54, 1, 1, 0))
                    {
                      break;
                    }

                    float v118 = (unint64_t *)((char *)v118 + 1);
                    v16 += 14;
                    if (v141 == v118) {
                      goto LABEL_335;
                    }
                  }
                }
                else
                {
LABEL_335:
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0
                    || (v141 = (unint64_t *)[v162 count], id v21 = v175, !v141))
                  {
LABEL_342:
                    objc_opt_class();
                    id v21 = v175;
                    if (objc_opt_isKindOfClass())
                    {
                      unint64_t v120 = 0;
                      uint64_t v17 = (uint64_t)&_SpotlightDefineRankingTypes_[364];
                      float v121 = v149;
                      while (v120 < objc_msgSend(v161, "count", v141))
                      {
                        unint64_t v12 = [v161 objectAtIndex:v120];
                        if (!*((_WORD *)v121 + 6)) {
                          (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts + 2))((uint64_t)updateMatchCounts, v177, v175, (void *)v12, v121);
                        }
                        uint64_t v16 = v16 & 0xFFFF000000000000 | *((unsigned int *)v121 + 2) | ((unint64_t)*((unsigned __int16 *)v121 + 6) << 32);
                        if ((*((BOOL (**)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int))hasMatchWithCounts
                              + 2))((uint64_t)hasMatchWithCounts, v172, *v121, v16, 1, 1, 0))
                        {
                          goto LABEL_356;
                        }

                        ++v120;
                        float v121 = (unint64_t *)((char *)v121 + 14);
                      }
                    }
                    objc_opt_class();
                    id v21 = v175;
                    if (objc_opt_isKindOfClass())
                    {
                      unint64_t v122 = 0;
                      uint64_t v17 = (uint64_t)&_SpotlightDefineRankingTypes_[364];
                      float v123 = v147;
                      while (v122 < objc_msgSend(v159, "count", v141))
                      {
                        unint64_t v12 = [v159 objectAtIndex:v122];
                        if (!*((_WORD *)v123 + 6)) {
                          (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts + 2))((uint64_t)updateMatchCounts, v177, v175, (void *)v12, v123);
                        }
                        uint64_t v16 = v16 & 0xFFFF000000000000 | *((unsigned int *)v123 + 2) | ((unint64_t)*((unsigned __int16 *)v123 + 6) << 32);
                        if ((*((BOOL (**)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int))hasMatchWithCounts
                              + 2))((uint64_t)hasMatchWithCounts, v172, *v123, v16, 1, 1, 0))
                        {
                          goto LABEL_356;
                        }

                        ++v122;
                        float v123 = (unint64_t *)((char *)v123 + 14);
                      }
                    }
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0
                      && (int v141 = (unint64_t *)[v155 count]) != 0)
                    {
                      float v124 = 0;
                      uint64_t v17 = (uint64_t)&_SpotlightDefineRankingTypes_[364];
                      uint64_t v16 = (uint64_t)v144;
                      while (1)
                      {
                        float v125 = objc_msgSend(v155, "objectAtIndex:", v124, v141);
                        if (!*(_WORD *)(v16 + 12)) {
                          (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts + 2))((uint64_t)updateMatchCounts, v177, v175, v125, (_WORD *)v16);
                        }
                        unint64_t v12 = v12 & 0xFFFF000000000000 | *(unsigned int *)(v16 + 8) | ((unint64_t)*(unsigned __int16 *)(v16 + 12) << 32);
                        if ((*((BOOL (**)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int))hasMatchWithCounts
                              + 2))((uint64_t)hasMatchWithCounts, v172, *(void *)v16, v12, 1, 1, 0))
                        {
                          break;
                        }

                        float v124 = (unint64_t *)((char *)v124 + 1);
                        v16 += 14;
                        if (v141 == v124) {
                          goto LABEL_364;
                        }
                      }
                    }
                    else
                    {
LABEL_364:
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0
                        || (int v141 = (unint64_t *)[v154 count]) == 0)
                      {
LABEL_371:
                        objc_opt_class();
                        if (objc_opt_isKindOfClass())
                        {
                          unint64_t v12 = 0;
                          uint64_t v17 = (uint64_t)&_SpotlightDefineRankingTypes_[364];
                          unint64_t v127 = v145;
                          while (v12 < objc_msgSend(v158, "count", v141))
                          {
                            float v108 = [v158 objectAtIndex:v12];
                            if (!*((_WORD *)v127 + 6)) {
                              (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts + 2))((uint64_t)updateMatchCounts, v177, v175, v108, v127);
                            }
                            uint64_t v16 = v16 & 0xFFFF000000000000 | *((unsigned int *)v127 + 2) | ((unint64_t)*((unsigned __int16 *)v127 + 6) << 32);
                            if ((*((BOOL (**)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int))hasMatchWithCounts
                                  + 2))((uint64_t)hasMatchWithCounts, v172, *v127, v16, 1, 1, 0))
                            {
                              goto LABEL_487;
                            }

                            ++v12;
                            unint64_t v127 = (unint64_t *)((char *)v127 + 14);
                          }
                        }
                        objc_opt_class();
                        if (objc_opt_isKindOfClass())
                        {
                          int v141 = v169;
                          if (!WORD6(v185)) {
                            (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts + 2))((uint64_t)updateMatchCounts, v177, v175, v141, &v185);
                          }
                          if ((*((unsigned int (**)(uint64_t, uint64_t, uint64_t, int))hasAsTypedMatchWithCounts
                                + 2))((uint64_t)hasAsTypedMatchWithCounts, v172, v185, SDWORD2(v185)))
                          {
                            uint64_t v109 = v189 + 5;
                            id v110 = v169;
                            goto LABEL_228;
                          }
                        }
                        objc_opt_class();
                        if (objc_opt_isKindOfClass())
                        {
                          unint64_t v12 = 0;
                          uint64_t v16 = (uint64_t)v153;
                          while (v12 < objc_msgSend(v168, "count", v141))
                          {
                            id v83 = [v168 objectAtIndex:v12];
                            if (!*(_WORD *)(v16 + 12)) {
                              (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts + 2))((uint64_t)updateMatchCounts, v177, v175, v83, (_WORD *)v16);
                            }
                            uint64_t v17 = v17 & 0xFFFF000000000000 | *(unsigned int *)(v16 + 8) | ((unint64_t)*(unsigned __int16 *)(v16 + 12) << 32);
                            if ((*((unsigned int (**)(uint64_t, uint64_t, uint64_t, int))hasAsTypedMatchWithCounts
                                  + 2))((uint64_t)hasAsTypedMatchWithCounts, v172, *(void *)v16, v17))
                            {
                              objc_storeStrong(v189 + 5, v83);
                              id v21 = v175;
                              goto LABEL_286;
                            }

                            ++v12;
                            v16 += 14;
                          }
                        }
                        objc_opt_class();
                        if (objc_opt_isKindOfClass())
                        {
                          int v141 = v157;
                          if (!WORD2(v180[1])) {
                            (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts + 2))((uint64_t)updateMatchCounts, v177, v175, v141, v180);
                          }
                          if ((*((unsigned int (**)(uint64_t, uint64_t, uint64_t, int))hasAsTypedMatchWithCounts
                                + 2))((uint64_t)hasAsTypedMatchWithCounts, v172, v180[0], v180[1]))
                          {
                            int v111 = v189 + 5;
                            uint64_t v16 = (uint64_t)v157;
                            goto LABEL_282;
                          }
                        }
                        objc_opt_class();
                        if (objc_opt_isKindOfClass())
                        {
                          id v112 = obj;
                          if (!WORD2(v178[1])) {
                            (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts + 2))((uint64_t)updateMatchCounts, v177, v175, v112, v178);
                          }
                          if ((*((unsigned int (**)(uint64_t, uint64_t, uint64_t, int))hasAsTypedMatchWithCounts
                                + 2))((uint64_t)hasAsTypedMatchWithCounts, v172, v178[0], v178[1]))
                          {
LABEL_292:
                            objc_storeStrong(v189 + 5, obj);
                            unint64_t v12 = (unint64_t)v160;
                            id v82 = v112;
                            id v80 = v112;
                            goto LABEL_236;
                          }
                        }
                        objc_opt_class();
                        if (objc_opt_isKindOfClass())
                        {
                          unint64_t v12 = (unint64_t)v160;
                          if (!WORD2(v179[1])) {
                            (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts + 2))((uint64_t)updateMatchCounts, v177, v175, (void *)v12, v179);
                          }
                          if ((*((unsigned int (**)(uint64_t, uint64_t, uint64_t, int))hasAsTypedMatchWithCounts
                                + 2))((uint64_t)hasAsTypedMatchWithCounts, v172, v179[0], v179[1]))
                          {
                            objc_storeStrong(v189 + 5, v160);
                            id v82 = (id)v12;
                            goto LABEL_235;
                          }
                        }
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0
                          && (int v141 = (unint64_t *)[v167 count]) != 0)
                        {
                          long long v128 = 0;
                          uint64_t v16 = (uint64_t)v142;
                          while (1)
                          {
                            int v129 = objc_msgSend(v167, "objectAtIndex:", v128, v141);
                            if (!*(_WORD *)(v16 + 12)) {
                              (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts + 2))((uint64_t)updateMatchCounts, v177, v175, v129, (_WORD *)v16);
                            }
                            unint64_t v12 = v12 & 0xFFFF000000000000 | *(unsigned int *)(v16 + 8) | ((unint64_t)*(unsigned __int16 *)(v16 + 12) << 32);
                            if ((*((unsigned int (**)(uint64_t, uint64_t, uint64_t, int))hasAsTypedMatchWithCounts
                                  + 2))((uint64_t)hasAsTypedMatchWithCounts, v172, *(void *)v16, v12))
                            {
                              break;
                            }

                            long long v128 = (unint64_t *)((char *)v128 + 1);
                            v16 += 14;
                            if (v141 == v128) {
                              goto LABEL_416;
                            }
                          }
                        }
                        else
                        {
LABEL_416:
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0
                            && (int v141 = (unint64_t *)[v156 count]) != 0)
                          {
                            uint64_t v130 = 0;
                            uint64_t v16 = (uint64_t)v152;
                            while (1)
                            {
                              int v129 = objc_msgSend(v156, "objectAtIndex:", v130, v141);
                              if (!*(_WORD *)(v16 + 12)) {
                                (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts + 2))((uint64_t)updateMatchCounts, v177, v175, v129, (_WORD *)v16);
                              }
                              unint64_t v12 = v12 & 0xFFFF000000000000 | *(unsigned int *)(v16 + 8) | ((unint64_t)*(unsigned __int16 *)(v16 + 12) << 32);
                              if ((*((unsigned int (**)(uint64_t, uint64_t, uint64_t, int))hasAsTypedMatchWithCounts
                                    + 2))((uint64_t)hasAsTypedMatchWithCounts, v172, *(void *)v16, v12))
                              {
                                break;
                              }

                              uint64_t v130 = (unint64_t *)((char *)v130 + 1);
                              v16 += 14;
                              if (v141 == v130) {
                                goto LABEL_423;
                              }
                            }
                          }
                          else
                          {
LABEL_423:
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0
                              && (int v141 = (unint64_t *)[v165 count]) != 0)
                            {
                              unint64_t v131 = 0;
                              uint64_t v16 = (uint64_t)v151;
                              while (1)
                              {
                                int v129 = objc_msgSend(v165, "objectAtIndex:", v131, v141);
                                if (!*(_WORD *)(v16 + 12)) {
                                  (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts
                                }
                                   + 2))((uint64_t)updateMatchCounts, v177, v175, v129, (_WORD *)v16);
                                unint64_t v12 = v12 & 0xFFFF000000000000 | *(unsigned int *)(v16 + 8) | ((unint64_t)*(unsigned __int16 *)(v16 + 12) << 32);
                                if ((*((unsigned int (**)(uint64_t, uint64_t, uint64_t, int))hasAsTypedMatchWithCounts
                                      + 2))((uint64_t)hasAsTypedMatchWithCounts, v172, *(void *)v16, v12))
                                {
                                  break;
                                }

                                unint64_t v131 = (unint64_t *)((char *)v131 + 1);
                                v16 += 14;
                                if (v141 == v131) {
                                  goto LABEL_430;
                                }
                              }
                            }
                            else
                            {
LABEL_430:
                              objc_opt_class();
                              if ((objc_opt_isKindOfClass() & 1) != 0
                                && (int v141 = (unint64_t *)[v164 count]) != 0)
                              {
                                long long v132 = 0;
                                uint64_t v16 = (uint64_t)v150;
                                while (1)
                                {
                                  int v129 = objc_msgSend(v164, "objectAtIndex:", v132, v141);
                                  if (!*(_WORD *)(v16 + 12)) {
                                    (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts
                                  }
                                     + 2))((uint64_t)updateMatchCounts, v177, v175, v129, (_WORD *)v16);
                                  unint64_t v12 = v12 & 0xFFFF000000000000 | *(unsigned int *)(v16 + 8) | ((unint64_t)*(unsigned __int16 *)(v16 + 12) << 32);
                                  if ((*((unsigned int (**)(uint64_t, uint64_t, uint64_t, int))hasAsTypedMatchWithCounts
                                        + 2))((uint64_t)hasAsTypedMatchWithCounts, v172, *(void *)v16, v12))
                                  {
                                    break;
                                  }

                                  long long v132 = (unint64_t *)((char *)v132 + 1);
                                  v16 += 14;
                                  if (v141 == v132) {
                                    goto LABEL_437;
                                  }
                                }
                              }
                              else
                              {
LABEL_437:
                                objc_opt_class();
                                if ((objc_opt_isKindOfClass() & 1) != 0
                                  && (int v141 = (unint64_t *)[v163 count]) != 0)
                                {
                                  int v133 = 0;
                                  uint64_t v16 = (uint64_t)v148;
                                  while (1)
                                  {
                                    int v129 = objc_msgSend(v163, "objectAtIndex:", v133, v141);
                                    if (!*(_WORD *)(v16 + 12)) {
                                      (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts
                                    }
                                       + 2))((uint64_t)updateMatchCounts, v177, v175, v129, (_WORD *)v16);
                                    unint64_t v12 = v12 & 0xFFFF000000000000 | *(unsigned int *)(v16 + 8) | ((unint64_t)*(unsigned __int16 *)(v16 + 12) << 32);
                                    if ((*((unsigned int (**)(uint64_t, uint64_t, uint64_t, int))hasAsTypedMatchWithCounts
                                          + 2))((uint64_t)hasAsTypedMatchWithCounts, v172, *(void *)v16, v12))
                                    {
                                      break;
                                    }

                                    int v133 = (unint64_t *)((char *)v133 + 1);
                                    v16 += 14;
                                    if (v141 == v133) {
                                      goto LABEL_444;
                                    }
                                  }
                                }
                                else
                                {
LABEL_444:
                                  objc_opt_class();
                                  if ((objc_opt_isKindOfClass() & 1) != 0
                                    && (int v141 = (unint64_t *)[v162 count]) != 0)
                                  {
                                    float v134 = 0;
                                    uint64_t v16 = (uint64_t)v146;
                                    while (1)
                                    {
                                      int v129 = objc_msgSend(v162, "objectAtIndex:", v134, v141);
                                      if (!*(_WORD *)(v16 + 12)) {
                                        (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts
                                      }
                                         + 2))((uint64_t)updateMatchCounts, v177, v175, v129, (_WORD *)v16);
                                      unint64_t v12 = v12 & 0xFFFF000000000000 | *(unsigned int *)(v16 + 8) | ((unint64_t)*(unsigned __int16 *)(v16 + 12) << 32);
                                      if ((*((unsigned int (**)(uint64_t, uint64_t, uint64_t, int))hasAsTypedMatchWithCounts
                                            + 2))((uint64_t)hasAsTypedMatchWithCounts, v172, *(void *)v16, v12))
                                      {
                                        break;
                                      }

                                      float v134 = (unint64_t *)((char *)v134 + 1);
                                      v16 += 14;
                                      if (v141 == v134) {
                                        goto LABEL_451;
                                      }
                                    }
                                  }
                                  else
                                  {
LABEL_451:
                                    objc_opt_class();
                                    if (objc_opt_isKindOfClass())
                                    {
                                      unint64_t v12 = 0;
                                      uint64_t v135 = (uint64_t *)v149;
                                      while (v12 < objc_msgSend(v161, "count", v141))
                                      {
                                        float v125 = [v161 objectAtIndex:v12];
                                        if (!*((_WORD *)v135 + 6)) {
                                          (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts
                                        }
                                           + 2))((uint64_t)updateMatchCounts, v177, v175, v125, v135);
                                        uint64_t v16 = v16 & 0xFFFF000000000000 | *((unsigned int *)v135 + 2) | ((unint64_t)*((unsigned __int16 *)v135 + 6) << 32);
                                        if ((*((unsigned int (**)(uint64_t, uint64_t, uint64_t, int))hasAsTypedMatchWithCounts
                                              + 2))((uint64_t)hasAsTypedMatchWithCounts, v172, *v135, v16))
                                        {
                                          goto LABEL_465;
                                        }

                                        ++v12;
                                        uint64_t v135 = (uint64_t *)((char *)v135 + 14);
                                      }
                                    }
                                    objc_opt_class();
                                    if (objc_opt_isKindOfClass())
                                    {
                                      unint64_t v12 = 0;
                                      uint64_t v136 = (uint64_t *)v147;
                                      while (v12 < objc_msgSend(v159, "count", v141))
                                      {
                                        float v125 = [v159 objectAtIndex:v12];
                                        if (!*((_WORD *)v136 + 6)) {
                                          (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts
                                        }
                                           + 2))((uint64_t)updateMatchCounts, v177, v175, v125, v136);
                                        uint64_t v16 = v16 & 0xFFFF000000000000 | *((unsigned int *)v136 + 2) | ((unint64_t)*((unsigned __int16 *)v136 + 6) << 32);
                                        if ((*((unsigned int (**)(uint64_t, uint64_t, uint64_t, int))hasAsTypedMatchWithCounts
                                              + 2))((uint64_t)hasAsTypedMatchWithCounts, v172, *v136, v16))
                                        {
                                          goto LABEL_465;
                                        }

                                        ++v12;
                                        uint64_t v136 = (uint64_t *)((char *)v136 + 14);
                                      }
                                    }
                                    objc_opt_class();
                                    if ((objc_opt_isKindOfClass() & 1) != 0
                                      && (int v141 = (unint64_t *)[v155 count]) != 0)
                                    {
                                      int v137 = 0;
                                      uint64_t v16 = (uint64_t)v144;
                                      while (1)
                                      {
                                        int v129 = objc_msgSend(v155, "objectAtIndex:", v137, v141);
                                        if (!*(_WORD *)(v16 + 12)) {
                                          (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts
                                        }
                                           + 2))((uint64_t)updateMatchCounts, v177, v175, v129, (_WORD *)v16);
                                        unint64_t v12 = v12 & 0xFFFF000000000000 | *(unsigned int *)(v16 + 8) | ((unint64_t)*(unsigned __int16 *)(v16 + 12) << 32);
                                        if ((*((unsigned int (**)(uint64_t, uint64_t, uint64_t, int))hasAsTypedMatchWithCounts
                                              + 2))((uint64_t)hasAsTypedMatchWithCounts, v172, *(void *)v16, v12))
                                        {
                                          break;
                                        }

                                        int v137 = (unint64_t *)((char *)v137 + 1);
                                        v16 += 14;
                                        if (v141 == v137) {
                                          goto LABEL_473;
                                        }
                                      }
                                    }
                                    else
                                    {
LABEL_473:
                                      objc_opt_class();
                                      if ((objc_opt_isKindOfClass() & 1) == 0
                                        || (int v141 = (unint64_t *)[v154 count]) == 0)
                                      {
LABEL_480:
                                        objc_opt_class();
                                        if (objc_opt_isKindOfClass())
                                        {
                                          unint64_t v139 = 0;
                                          int v140 = (uint64_t *)v145;
                                          while (v139 < objc_msgSend(v158, "count", v141))
                                          {
                                            float v108 = [v158 objectAtIndex:v139];
                                            if (!*((_WORD *)v140 + 6)) {
                                              (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts
                                            }
                                               + 2))((uint64_t)updateMatchCounts, v177, v175, v108, v140);
                                            uint64_t v16 = v16 & 0xFFFF000000000000 | *((unsigned int *)v140 + 2) | ((unint64_t)*((unsigned __int16 *)v140 + 6) << 32);
                                            if ((*((unsigned int (**)(uint64_t, uint64_t, uint64_t, int))hasAsTypedMatchWithCounts
                                                  + 2))((uint64_t)hasAsTypedMatchWithCounts, v172, *v140, v16))
                                            {
                                              goto LABEL_487;
                                            }

                                            ++v139;
                                            int v140 = (uint64_t *)((char *)v140 + 14);
                                          }
                                        }
                                        id v21 = v175;
                                        float v57 = v156;
                                        uint64_t v16 = (uint64_t)v157;
                                        int v84 = v153;
                                        float v81 = v142;
LABEL_240:
                                        unint64_t v12 = (unint64_t)v169;
                                        int v85 = v152;
                                        if (!v84)
                                        {
LABEL_242:
                                          if (v149) {
                                            free(v149);
                                          }
                                          float v58 = v160;
                                          if (v147) {
                                            free(v147);
                                          }
                                          if (v145) {
                                            free(v145);
                                          }
                                          if (v146) {
                                            free(v146);
                                          }
                                          if (v143) {
                                            free(v143);
                                          }
                                          if (v148) {
                                            free(v148);
                                          }
                                          if (v144) {
                                            free(v144);
                                          }
                                          if (v150) {
                                            free(v150);
                                          }
                                          if (v85) {
                                            free(v85);
                                          }
                                          if (v81) {
                                            free(v81);
                                          }
                                          int v59 = v155;
                                          if (v151) {
                                            free(v151);
                                          }
                                          uint64_t v56 = v154;

                                          goto LABEL_265;
                                        }
LABEL_241:
                                        free(v84);
                                        goto LABEL_242;
                                      }
                                      BOOL v138 = 0;
                                      uint64_t v16 = (uint64_t)v143;
                                      while (1)
                                      {
                                        int v129 = objc_msgSend(v154, "objectAtIndex:", v138, v141);
                                        if (!*(_WORD *)(v16 + 12)) {
                                          (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts
                                        }
                                           + 2))((uint64_t)updateMatchCounts, v177, v175, v129, (_WORD *)v16);
                                        unint64_t v12 = v12 & 0xFFFF000000000000 | *(unsigned int *)(v16 + 8) | ((unint64_t)*(unsigned __int16 *)(v16 + 12) << 32);
                                        if ((*((unsigned int (**)(uint64_t, uint64_t, uint64_t, int))hasAsTypedMatchWithCounts
                                              + 2))((uint64_t)hasAsTypedMatchWithCounts, v172, *(void *)v16, v12))
                                        {
                                          break;
                                        }

                                        BOOL v138 = (unint64_t *)((char *)v138 + 1);
                                        v16 += 14;
                                        if (v141 == v138) {
                                          goto LABEL_480;
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                        objc_storeStrong(v189 + 5, v129);
                        id v82 = v129;
                        goto LABEL_234;
                      }
                      float v126 = 0;
                      uint64_t v17 = (uint64_t)&_SpotlightDefineRankingTypes_[364];
                      uint64_t v16 = (uint64_t)v143;
                      while (1)
                      {
                        float v125 = objc_msgSend(v154, "objectAtIndex:", v126, v141);
                        if (!*(_WORD *)(v16 + 12)) {
                          (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts + 2))((uint64_t)updateMatchCounts, v177, v175, v125, (_WORD *)v16);
                        }
                        unint64_t v12 = v12 & 0xFFFF000000000000 | *(unsigned int *)(v16 + 8) | ((unint64_t)*(unsigned __int16 *)(v16 + 12) << 32);
                        if ((*((BOOL (**)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int))hasMatchWithCounts
                              + 2))((uint64_t)hasMatchWithCounts, v172, *(void *)v16, v12, 1, 1, 0))
                        {
                          break;
                        }

                        float v126 = (unint64_t *)((char *)v126 + 1);
                        v16 += 14;
                        if (v141 == v126) {
                          goto LABEL_371;
                        }
                      }
                    }
LABEL_465:
                    objc_storeStrong(v189 + 5, v125);
                    id v82 = v125;
                    goto LABEL_234;
                  }
                  float v119 = 0;
                  uint64_t v17 = (uint64_t)&_SpotlightDefineRankingTypes_[364];
                  uint64_t v16 = (uint64_t)v146;
                  while (1)
                  {
                    unint64_t v12 = objc_msgSend(v162, "objectAtIndex:", v119, v141);
                    if (!*(_WORD *)(v16 + 12)) {
                      (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts + 2))((uint64_t)updateMatchCounts, v177, v175, (void *)v12, (_WORD *)v16);
                    }
                    uint64_t v54 = v54 & 0xFFFF000000000000 | *(unsigned int *)(v16 + 8) | ((unint64_t)*(unsigned __int16 *)(v16 + 12) << 32);
                    if ((*((BOOL (**)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int))hasMatchWithCounts
                          + 2))((uint64_t)hasMatchWithCounts, v172, *(void *)v16, v54, 1, 1, 0))
                    {
                      break;
                    }

                    float v119 = (unint64_t *)((char *)v119 + 1);
                    v16 += 14;
                    if (v141 == v119) {
                      goto LABEL_342;
                    }
                  }
                }
              }
            }
          }
        }
LABEL_356:
        objc_storeStrong(v189 + 5, (id)v12);
        id v82 = (id)v12;
        unint64_t v12 = (unint64_t)v160;
        id v80 = obj;
        goto LABEL_237;
      }
      unint64_t v52 = self->_bundleIDType;
    }
    if ((v52 & 0x100000) == 0)
    {
LABEL_80:
      if (v189[5]
        || (self->_bundleIDType & 0x200000) == 0
        || ![v19 isEqualToString:*MEMORY[0x1E4F22CE8]])
      {
        goto LABEL_35;
      }
      unint64_t v12 = SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0xCuLL);
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_storeStrong(v189 + 5, (id)v12);
      }
      goto LABEL_34;
    }
    if ([v19 isEqualToString:*MEMORY[0x1E4F22B18]])
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_35;
      }
      unint64_t v12 = [v189[5] componentsSeparatedByString:@" "];
      if (![(id)v12 count]) {
        goto LABEL_34;
      }
      float v68 = [(id)v12 firstObject];
      unint64_t v33 = v12;
      float v69 = [v68 componentsSeparatedByString:@"@"];
      float v70 = v68;
      if (a10)
      {
        if ((unint64_t)[v69 count] < 2)
        {
          unint64_t v91 = &stru_1F1824018;
          goto LABEL_192;
        }
        uint64_t v71 = [v69 objectAtIndex:1];
      }
      else
      {
        unint64_t v91 = v70;
        if (![v69 count])
        {
LABEL_193:
          id v102 = v189[5];
          v189[5] = v91;

LABEL_26:
          unint64_t v12 = v33;
          goto LABEL_34;
        }
        uint64_t v71 = [v69 firstObject];
      }
      unint64_t v91 = (__CFString *)v71;
LABEL_192:

      goto LABEL_193;
    }
    if ((self->_bundleIDType & 0x100000) == 0
      || ![v19 isEqualToString:*MEMORY[0x1E4F233C8]])
    {
      goto LABEL_80;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_35;
    }
    int v171 = [v189[5] componentsSeparatedByString:@" "];
    float v72 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v171, "count"));
    for (unint64_t k = 0; ; ++k)
    {
      if (k >= [v171 count])
      {
        uint64_t v94 = [v72 componentsJoinedByString:@" "];
        id v95 = v189[5];
        v189[5] = (id)v94;

        unint64_t v12 = (unint64_t)v171;
        goto LABEL_34;
      }
      float v74 = [v171 objectAtIndex:k];
      float v75 = [v74 componentsSeparatedByString:@"@"];
      id v76 = v74;
      if (a11)
      {
        if ((unint64_t)[v75 count] < 2)
        {

          int v78 = 0;
          goto LABEL_105;
        }
        uint64_t v77 = [v75 objectAtIndex:1];
      }
      else
      {
        int v78 = v76;
        if (![v75 count]) {
          goto LABEL_102;
        }
        uint64_t v77 = [v75 firstObject];
      }
      int v78 = (void *)v77;

LABEL_102:
      if (v78) {
        [v72 addObject:v78];
      }
LABEL_105:
    }
  }
  if ((unint64_t)[v189[5] length] >= 0x51)
  {
    uint64_t v38 = [v189[5] substringToIndex:80];
    goto LABEL_33;
  }
LABEL_35:
  id v24 = v189[5];
LABEL_36:
  _Block_object_dispose(&v188, 8);

  return v24;
}

void __169__PRSRankingItem_getBundleSpecificValue_forPropertyName_withQueryString_isCJK_isBullseyeSearch_withEvaluator_keyboardLanguage_seenAuthorEmail_seenPrimaryRecipientEmail___block_invoke(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unsigned char *a8)
{
  if ((a2 & 7) == 1)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(a1 + 32));
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    *a8 = 1;
  }
}

- (void)populateFeaturesWithEvaluator:(uint64_t)a1 updatingBundleFeatures:(uint64_t)a2 withContext:(uint64_t)a3 keyboardLanguage:(uint64_t)a4 isCJK:(uint64_t)a5 currentTime:(uint64_t)a6 withRanker:(uint64_t)a7 attributeHolder:(uint64_t)a8 quParsedEvaluator:(void *)a9 isSearchToolClient:(unsigned __int8)a10 quParsedPersonEvaluator:(void *)a11 quParsedArgSearchTermsEvaluator:(void *)a12
{
  uint64_t v12 = MEMORY[0x1F4188790](a1, a2, a3, a4, a5, a6, a7, a8);
  float v14 = v13;
  uint64_t v16 = v15;
  double v18 = v17;
  unsigned int v303 = v19;
  id v21 = v20;
  uint64_t v305 = v22;
  uint64_t v24 = v23;
  id v25 = (void *)v12;
  *(void *)&v341[12940] = *MEMORY[0x1E4F143B8];
  id v317 = v26;
  id v314 = v21;
  id v310 = v16;
  id v279 = v14;
  id v282 = a9;
  id v283 = a11;
  id v27 = a12;
  if (!v25) {
    goto LABEL_350;
  }
  uint64_t v28 = v25;
  objc_sync_enter(v28);
  if (v28[79])
  {
    objc_sync_exit(v28);

    goto LABEL_350;
  }
  uint64_t v268 = v24;
  id v270 = v27;
  unsigned int v271 = a10;
  v28[79] = 1;
  objc_sync_exit(v28);
  v318 = v28;

  BOOL v300 = SSEnableSpotlightTopHitPersonalizedRanking();
  uint64_t v29 = v305;
  *(_DWORD *)(v305 + 156) = 0;
  *(_OWORD *)(v29 + 140) = xmmword_1BDC5DC50;
  int64x2_t v30 = (int64x2_t)xmmword_1BDC5D800;
  int64x2_t v31 = (int64x2_t)xmmword_1BDC5D810;
  uint64_t v32 = 28;
  int64x2_t v33 = vdupq_n_s64(0xFFFFFFFFFFFFFFEELL);
  uint64x2_t v34 = (uint64x2_t)vdupq_n_s64(0xAuLL);
  v35.i64[0] = 0x4F0000004F000000;
  v35.i64[1] = 0x4F0000004F000000;
  int64x2_t v36 = vdupq_n_s64(4uLL);
  do
  {
    *(int8x16_t *)(v29 + v32) = vandq_s8(v35, (int8x16_t)vuzp1q_s32((int32x4_t)vcgtq_u64(v34, (uint64x2_t)vaddq_s64(v31, v33)), (int32x4_t)vcgtq_u64(v34, (uint64x2_t)vaddq_s64(v30, v33))));
    int64x2_t v30 = vaddq_s64(v30, v36);
    int64x2_t v31 = vaddq_s64(v31, v36);
    v32 += 16;
  }
  while (v32 != 140);
  *(void *)(v29 + 160) = 0;
  *(void *)(v29 + 168) = 0;
  bzero(v341, 0x328CuLL);
  bzero(v340, 0x1946uLL);
  float v335 = v340;
  v336 = v341;
  long long v337 = xmmword_1BDC5DC60;
  requiredTextFeatureAttributes();
  id v301 = (id)objc_claimAutoreleasedReturnValue();
  long long v267 = &v259;
  uint64_t v37 = sRequiredAttributesCount;
  MEMORY[0x1F4188790](v301, 184 * sRequiredAttributesCount + 184, v38, v39, v40, v41, v42, v43);
  float v288 = (char *)&v259 - v44;
  bzero((char *)&v259 - v44, v45);
  size_t v315 = [v310 queryTermCount];
  v334[1] = 0;
  v334[0] = 0;
  (*((void (**)(uint64_t, uint64_t, uint64_t))initQueryTermMatchCounts + 2))((uint64_t)initQueryTermMatchCounts, v315, (uint64_t)v334);
  unint64_t v46 = 0;
  unint64_t v47 = sRequiredAttributesCount;
  uint64_t v48 = 4 * v37 + 4;
  size_t v49 = 4 * sRequiredAttributesCount + 4;
  uint64_t v50 = v288;
  do
  {
    if (v47 != -1) {
      memset_pattern16(v50, &unk_1BDC5DC70, v49);
    }
    if (v46 <= 0x16 && ((1 << v46) & 0x7F9860) != 0) {
      _DWORD *v50 = 1325400064;
    }
    ++v46;
    uint64_t v50 = (_DWORD *)((char *)v50 + v48);
  }
  while (v46 != 46);
  if (!v47) {
    goto LABEL_321;
  }
  uint64_t v51 = 0;
  int v309 = 0;
  int v312 = 0;
  float v273 = (id *)(v318 + 248);
  size_t v277 = 2 * v315;
  unint64_t v274 = v322;
  v280 = v318 + 544;
  unint64_t v284 = v318 + 552;
  float v285 = v318 + 560;
  long long v269 = (id *)(v318 + 232);
  uint64_t v261 = v320;
  unint64_t v296 = 0x834 / v47;
  uint64_t v306 = *MEMORY[0x1E4F22CE8];
  uint64_t v52 = *MEMORY[0x1E4F22A78];
  uint64_t v292 = *MEMORY[0x1E4F230C8];
  uint64_t v293 = v52;
  uint64_t v53 = *MEMORY[0x1E4F232A0];
  uint64_t v263 = *MEMORY[0x1E4F232B0];
  uint64_t v264 = v53;
  uint64_t v262 = *MEMORY[0x1E4F23340];
  float v276 = @"com.apple.CoreSuggestions";
  uint64_t v299 = *MEMORY[0x1E4F22B18];
  uint64_t v291 = *MEMORY[0x1E4F233C8];
  uint64_t v295 = 1;
  do
  {
    uint64_t v311 = v51;
    objc_msgSend(v301, "objectAtIndexedSubscript:");
    v316 = (__CFString *)objc_claimAutoreleasedReturnValue();
    uint64_t v54 = SSCompactRankingAttrsGetValue(*((int8x8_t **)v318 + 38), requiredTextFeatureAttributesIndexes_attrs[v311]);
    id v55 = v318;
    if (v318[441])
    {
      int v56 = [(__CFString *)v316 isEqualToString:v306];
      id v55 = v318;
      if (v56)
      {
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        id v55 = v318;
        if (isKindOfClass)
        {
          id v289 = (id)_MDStringCopyAbbreviations();
          if ([v289 count])
          {
            id v304 = [v317 queryString];
            BOOL v58 = +[PRSRankingUtilities userQueryHasOnlySingleCharacterTerms:v304];
            id v294 = [v304 stringByReplacingOccurrencesOfString:@" " withString:&stru_1F1824018];
            int v59 = [v294 lowercaseString];
            long long v332 = 0u;
            long long v333 = 0u;
            long long v330 = 0u;
            long long v331 = 0u;
            id v60 = v289;
            uint64_t v61 = [v60 countByEnumeratingWithState:&v330 objects:v339 count:16];
            if (v61)
            {
              uint64_t v62 = *(void *)v331;
              while (2)
              {
                for (uint64_t i = 0; i != v61; ++i)
                {
                  if (*(void *)v331 != v62) {
                    objc_enumerationMutation(v60);
                  }
                  float v64 = *(void **)(*((void *)&v330 + 1) + 8 * i);
                  if (+[PRSRankingUtilities caseAndDiacriticInsensitiveLocalizedString:isEqualToString:](PRSRankingUtilities, "caseAndDiacriticInsensitiveLocalizedString:isEqualToString:", v304, v64)|| v58&& +[PRSRankingUtilities caseAndDiacriticInsensitiveLocalizedString:v294 isEqualToString:v64])
                  {
                    objc_storeStrong(v273, v64);
                    goto LABEL_31;
                  }
                }
                uint64_t v61 = [v60 countByEnumeratingWithState:&v330 objects:v339 count:16];
                if (v61) {
                  continue;
                }
                break;
              }
            }
LABEL_31:

            if (!*v273)
            {
              float v65 = [v304 lowercaseString];
              long long v328 = 0u;
              long long v329 = 0u;
              long long v326 = 0u;
              long long v327 = 0u;
              id v66 = v60;
              uint64_t v67 = [v66 countByEnumeratingWithState:&v326 objects:v338 count:16];
              if (v67)
              {
                uint64_t v68 = *(void *)v327;
                do
                {
                  for (uint64_t j = 0; j != v67; ++j)
                  {
                    if (*(void *)v327 != v68) {
                      objc_enumerationMutation(v66);
                    }
                    float v70 = [*(id *)(*((void *)&v326 + 1) + 8 * j) lowercaseString];
                    uint64_t v71 = v70;
                    if (v65 && ([v70 hasPrefix:v65] & 1) != 0
                      || v59 && [v71 hasPrefix:v59])
                    {
                      v318[56] = 1;
                    }
                  }
                  uint64_t v67 = [v66 countByEnumeratingWithState:&v326 objects:v338 count:16];
                }
                while (v67);
              }
            }
          }

          id v55 = v318;
        }
      }
    }
    if ((v55[441] & 1) == 0) {
      goto LABEL_65;
    }
    int v72 = [(__CFString *)v316 isEqualToString:v292];
    id v55 = v318;
    if (!v72) {
      goto LABEL_65;
    }
    BOOL v73 = +[PRSRankingItemRanker isKeywordsHidingEnabled];
    id v55 = v318;
    if (v73) {
      goto LABEL_65;
    }
    objc_opt_class();
    char v74 = objc_opt_isKindOfClass();
    id v55 = v318;
    if ((v74 & 1) == 0) {
      goto LABEL_65;
    }
    id v75 = v54;
    id v76 = [v75 componentsSeparatedByString:@","];
    MEMORY[0x1F4188790](v76, v277, v77, v78, v79, v80, v81, v82);
    int v84 = (char *)&v259 - ((v83 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v84, v83);
    if (![v76 count]) {
      goto LABEL_64;
    }
    uint64_t v85 = 0;
    while (1)
    {
      uint64_t v86 = [v76 objectAtIndex:v85];
      uint64_t v87 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
      uint64_t v88 = [v86 stringByTrimmingCharactersInSet:v87];

      if (!+[PRSRankingUtilities aToZInString:v88]) {
        break;
      }
LABEL_61:

      if (++v85 >= (unint64_t)[v76 count]) {
        goto LABEL_64;
      }
    }
    bzero(v84, v277);
    *(void *)&long long v323 = 0;
    *((void *)&v323 + 1) = &v323;
    uint64_t v324 = 0x2020000000;
    float v325 = v84;
    v321[0] = MEMORY[0x1E4F143A8];
    v321[1] = 3221225472;
    v322[0] = __238__PRSRankingItem_populateFeaturesWithEvaluator_updatingBundleFeatures_withContext_keyboardLanguage_isCJK_currentTime_withRanker_attributeHolder_quParsedEvaluator_isSearchToolClient_quParsedPersonEvaluator_quParsedArgSearchTermsEvaluator___block_invoke;
    v322[1] = &unk_1E634D240;
    v322[2] = &v323;
    uint64_t v89 = [v317 evaluateAttribute:v88 ignoreSubtokens:0 strongCompounds:1 skipTranscriptions:0 withHandler:v321];
    if (v89 != v315) {
      goto LABEL_60;
    }
    if (v315)
    {
      uint64_t v90 = *(unsigned __int16 **)(*((void *)&v323 + 1) + 24);
      size_t v91 = v315;
      while (*v90++)
      {
        if (!--v91) {
          goto LABEL_63;
        }
      }
LABEL_60:
      _Block_object_dispose(&v323, 8);
      goto LABEL_61;
    }
LABEL_63:
    [v318 setWordMatchedKeyword:1];
    _Block_object_dispose(&v323, 8);

LABEL_64:
    id v55 = v318;
LABEL_65:
    uint64_t v93 = [v55 attrType:v316 seenAuthorEmail:v309 & 1 seenPrimaryRecipientEmail:v312 & 1];
    uint64_t v94 = v318;
    if ((*((_WORD *)v318 + 221) & 0x204) != 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || ([(__CFString *)v316 isEqualToString:v306] & 1) != 0)
      {
        goto LABEL_68;
      }
      *(void *)((char *)&v323 + 6) = 0;
      *(void *)&long long v323 = 0;
      (*((void (**)(uint64_t, void *, void *, void *, _WORD *, uint64_t))updateMatchCountsQueryMatchCounts + 2))((uint64_t)updateMatchCountsQueryMatchCounts, v317, v314, v54, &v323, (uint64_t)v334);
      id v95 = (BOOL (*)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int))*((void *)hasMatchWithCounts
                                                                                              + 2);
      unint64_t v281 = v281 & 0xFFFF000000000000 | DWORD2(v323) | ((unint64_t)WORD6(v323) << 32);
      if (v95((uint64_t)hasMatchWithCounts, v315, v323, v281, 1, 0, 1))
      {
        uint64_t v94 = v318;
        if ((v93 & 0x10000000000) == 0) {
          v318[63] = 1;
        }
        uint64_t v96 = v93 & 0x10000000000;
        *v280 |= v93;
        if ((v93 & 0x10000000000) == 0) {
LABEL_73:
        }
          v94[62] = 1;
LABEL_74:
        *v284 |= v93;
        if (!v96) {
LABEL_75:
        }
          v94[62] = 1;
LABEL_76:
        *v285 |= v93;
      }
      else
      {
        if (!WORD6(v323)) {
          (*((void (**)(uint64_t, void *, void *, void *, _WORD *, uint64_t))updateMatchCountsQueryMatchCounts
        }
           + 2))((uint64_t)updateMatchCountsQueryMatchCounts, v317, v314, v54, &v323, (uint64_t)v334);
        unint64_t v120 = (BOOL (*)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int))*((void *)hasMatchWithCounts
                                                                                                 + 2);
        unint64_t v272 = v272 & 0xFFFF000000000000 | DWORD2(v323) | ((unint64_t)WORD6(v323) << 32);
        if (v120((uint64_t)hasMatchWithCounts, v315, v323, v272, 1, 1, 0))
        {
          uint64_t v96 = v93 & 0x10000000000;
          uint64_t v94 = v318;
          if ((v93 & 0x10000000000) == 0) {
            goto LABEL_73;
          }
          goto LABEL_74;
        }
        unint64_t v124 = v265;
        if (!WORD6(v323))
        {
          (*((void (**)(uint64_t, void *, void *, void *, _WORD *, uint64_t))updateMatchCountsQueryMatchCounts
           + 2))((uint64_t)updateMatchCountsQueryMatchCounts, v317, v314, v54, &v323, (uint64_t)v334);
          unint64_t v124 = v265;
        }
        float v125 = (unsigned int (*)(uint64_t, uint64_t, uint64_t, int))*((void *)hasAsTypedMatchWithCounts + 2);
        unint64_t v265 = v124 & 0xFFFF000000000000 | DWORD2(v323) | ((unint64_t)WORD6(v323) << 32);
        if (v125((uint64_t)hasAsTypedMatchWithCounts, v315, v323, SDWORD2(v323)))
        {
          uint64_t v94 = v318;
          if ((v93 & 0x10000000000) == 0) {
            goto LABEL_75;
          }
          goto LABEL_76;
        }
LABEL_68:
        uint64_t v94 = v318;
      }
    }
    if ((*((_WORD *)v94 + 221) & 0x204) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        *(void *)((char *)&v323 + 6) = 0;
        *(void *)&long long v323 = 0;
        (*((void (**)(uint64_t, void *, void *, void *, _WORD *, uint64_t))updateMatchCountsQueryMatchCounts + 2))((uint64_t)updateMatchCountsQueryMatchCounts, v317, v314, v54, &v323, (uint64_t)v334);
        int v97 = (BOOL (*)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int))*((void *)hasMatchWithCounts
                                                                                                + 2);
        unint64_t v287 = v287 & 0xFFFF000000000000 | DWORD2(v323) | ((unint64_t)WORD6(v323) << 32);
        if (v97((uint64_t)hasMatchWithCounts, v315, v323, v287, 1, 0, 1))
        {
          *v280 |= v93;
          goto LABEL_84;
        }
        if (!WORD6(v323)) {
          (*((void (**)(uint64_t, void *, void *, void *, _WORD *, uint64_t))updateMatchCountsQueryMatchCounts
        }
           + 2))((uint64_t)updateMatchCountsQueryMatchCounts, v317, v314, v54, &v323, (uint64_t)v334);
        uint64_t v98 = (BOOL (*)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int))*((void *)hasMatchWithCounts
                                                                                                + 2);
        unint64_t v275 = v275 & 0xFFFF000000000000 | DWORD2(v323) | ((unint64_t)WORD6(v323) << 32);
        if (v98((uint64_t)hasMatchWithCounts, v315, v323, v275, 1, 1, 0))
        {
LABEL_84:
          *v284 |= v93;
          goto LABEL_85;
        }
        if (!WORD6(v323)) {
          (*((void (**)(uint64_t, void *, void *, void *, _WORD *, uint64_t))updateMatchCountsQueryMatchCounts
        }
           + 2))((uint64_t)updateMatchCountsQueryMatchCounts, v317, v314, v54, &v323, (uint64_t)v334);
        float v123 = (unsigned int (*)(uint64_t, uint64_t, uint64_t, int))*((void *)hasAsTypedMatchWithCounts + 2);
        unint64_t v266 = v266 & 0xFFFF000000000000 | DWORD2(v323) | ((unint64_t)WORD6(v323) << 32);
        if (v123((uint64_t)hasAsTypedMatchWithCounts, v315, v323, SDWORD2(v323))) {
LABEL_85:
        }
          *v285 |= v93;
      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v100 = v54;
      goto LABEL_294;
    }
    uint64_t v99 = *((void *)v318 + 55);
    if ((v99 & 0x2040000) != 0)
    {
      if ((v99 & 0x100) == 0) {
        goto LABEL_89;
      }
LABEL_136:
      if ([(__CFString *)v316 isEqualToString:v293])
      {
        size_t v126 = 14 * [v54 count];
        unint64_t v127 = malloc_type_malloc(v126, 0x100004018756113uLL);
        bzero(v127, v126);
        if (![v54 count]) {
          goto LABEL_209;
        }
        unint64_t v128 = 0;
        int v129 = (unint64_t *)v127;
        while (1)
        {
          uint64_t v130 = [v54 objectAtIndex:v128];
          if (v300)
          {
            if (v128 > 0xA) {
              goto LABEL_208;
            }
            if ([v318 isGoodMatchAlternateName:v130 withEvaluator:v317])
            {
LABEL_207:
              objc_storeStrong(v269, v130);
LABEL_208:

LABEL_209:
              if ([v54 count])
              {
                id v177 = [v318 firstMatchedAltName];
                BOOL v178 = v177 == 0;

                if (v178)
                {
                  int v179 = SSCompactRankingAttrsGetValue(*((int8x8_t **)v318 + 38), 0x176uLL);
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    id v304 = v179;
                    int v180 = [v317 queryString];
                    uint64_t v181 = [v304 rangeOfString:v180 options:393];
                    uint64_t v183 = v182;

                    int v184 = [v317 queryString];
                    BOOL v186 = v183 == [v184 length] && v181 == 0;

                    if (v186 && [v54 count])
                    {
                      uint64_t v187 = 0;
                      while (1)
                      {
                        uint64_t v188 = [v54 objectAtIndex:v187];
                        int v189 = [v317 queryString];
                        uint64_t v190 = [v188 rangeOfString:v189 options:385];
                        uint64_t v192 = v191;

                        id v193 = [v317 queryString];
                        BOOL v194 = v192 != [v193 length] || v190 == 0x7FFFFFFFFFFFFFFFLL;
                        BOOL v195 = v194;

                        if (!v195) {
                          break;
                        }

                        if (++v187 >= (unint64_t)[v54 count]) {
                          goto LABEL_266;
                        }
                      }
                      [v318 setFirstMatchedAltName:v188];
                    }
LABEL_266:
                    if ([v54 count])
                    {
                      float v206 = [v318 firstMatchedAltName];
                      if (v206)
                      {
                      }
                      else
                      {
                        char v214 = v315 < 2 || v186;
                        if ((v214 & 1) == 0)
                        {
                          size_t v215 = v277;
                          MEMORY[0x1F4188790](0, v207, v208, v209, v210, v211, v212, v213);
                          bzero((char *)&v259 - ((v215 + 15) & 0xFFFFFFFFFFFFFFF0), v215);
                          bzero((char *)&v259 - ((v215 + 15) & 0xFFFFFFFFFFFFFFF0), v215);
                          *(void *)&long long v323 = 0;
                          *((void *)&v323 + 1) = &v323;
                          uint64_t v324 = 0x2020000000;
                          float v325 = (char *)&v259 - ((v215 + 15) & 0xFFFFFFFFFFFFFFF0);
                          v319[0] = MEMORY[0x1E4F143A8];
                          v319[1] = 3221225472;
                          v320[0] = __238__PRSRankingItem_populateFeaturesWithEvaluator_updatingBundleFeatures_withContext_keyboardLanguage_isCJK_currentTime_withRanker_attributeHolder_quParsedEvaluator_isSearchToolClient_quParsedPersonEvaluator_quParsedArgSearchTermsEvaluator___block_invoke_2;
                          v320[1] = &unk_1E634D240;
                          v320[2] = &v323;
                          if ([v317 evaluateAttribute:v304 ignoreSubtokens:1 strongCompounds:1 skipTranscriptions:0 withHandler:v319]&& **(_WORD **)(*((void *)&v323 + 1) + 24))
                          {
                            unint64_t v216 = 0;
                            for (unint64_t k = (unint64_t *)v127; ; unint64_t k = (unint64_t *)((char *)k + 14))
                            {
                              unint64_t v218 = [v54 count];
                              unint64_t v219 = v260;
                              if (v216 >= v218) {
                                goto LABEL_283;
                              }
                              uint64_t v220 = [v54 objectAtIndex:v216];
                              if (!*((_WORD *)k + 6)) {
                                (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts + 2))((uint64_t)updateMatchCounts, v317, v314, v220, k);
                              }
                              unint64_t v221 = v219 & 0xFFFF000000000000 | *((unsigned int *)k + 2) | ((unint64_t)*((unsigned __int16 *)k + 6) << 32);
                              BOOL v222 = (*((BOOL (**)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int))hasMatchWithCounts
                                      + 2))((uint64_t)hasMatchWithCounts, v315, *k, v221, 0, 1, 0);
                              unint64_t v260 = v221;
                              if (v222) {
                                break;
                              }

                              ++v216;
                            }
                            [v318 setFirstMatchedAltName:v220];
                          }
LABEL_283:
                          _Block_object_dispose(&v323, 8);
                        }
                      }
                    }
                  }
                }
              }
              unint64_t v223 = [v318 firstMatchedAltName];
              BOOL v224 = v223 == 0;

              if (v224)
              {
                if (![v54 count])
                {
                  id v100 = 0;
                  goto LABEL_291;
                }
                uint64_t v225 = [v54 stringRepresentation];
              }
              else
              {
                uint64_t v225 = [v318 firstMatchedAltName];
              }
              id v100 = (id)v225;
              goto LABEL_291;
            }
          }
          else
          {
            (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts + 2))((uint64_t)updateMatchCounts, v317, v314, v130, v129);
            unint64_t v131 = (BOOL (*)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int))*((void *)hasMatchWithCounts + 2);
            unint64_t v132 = *v129;
            unint64_t v298 = v298 & 0xFFFF000000000000 | *((unsigned int *)v129 + 2) | ((unint64_t)*((unsigned __int16 *)v129
                                                                                                  + 6) << 32);
            if (v131((uint64_t)hasMatchWithCounts, v315, v132, v298, 1, 1, 0)) {
              goto LABEL_207;
            }
          }

          ++v128;
          int v129 = (unint64_t *)((char *)v129 + 14);
          if (v128 >= [v54 count]) {
            goto LABEL_209;
          }
        }
      }
      uint64_t v99 = *((void *)v318 + 55);
      if ((v99 & 4) != 0) {
        goto LABEL_147;
      }
LABEL_90:
      if ((v99 & 0x200000) == 0)
      {
LABEL_177:
        if ((v99 & 0x2040000) == 0)
        {
          id v100 = [v54 stringRepresentation];

          goto LABEL_294;
        }
        uint64_t v155 = [v54 count];
        int v156 = (unsigned __int16 *)malloc_type_malloc(14 * v155, 0x100004018756113uLL);
        bzero(v156, 14 * v155);
        if (v155)
        {
          unint64_t v157 = 0;
          unint64_t v158 = 0;
          int v159 = (unint64_t *)v156;
          while (1)
          {
            id v160 = [v54 objectAtIndex:v157];

            (*((void (**)(uint64_t, void *, void *, void *, _WORD *, uint64_t))updateMatchCountsQueryMatchCounts
             + 2))((uint64_t)updateMatchCountsQueryMatchCounts, v317, v314, v160, v159, (uint64_t)v334);
            uint64_t v161 = (BOOL (*)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int))*((void *)hasMatchWithCounts + 2);
            unint64_t v162 = *v159;
            unint64_t v308 = v308 & 0xFFFF000000000000 | *((unsigned int *)v159 + 2) | ((unint64_t)*((unsigned __int16 *)v159
                                                                                                  + 6) << 32);
            if (v161((uint64_t)hasMatchWithCounts, v315, v162, v308, 1, 0, 1)) {
              break;
            }
            int v159 = (unint64_t *)((char *)v159 + 14);
            ++v157;
            unint64_t v158 = v160;
            if (v155 == v157)
            {
              unint64_t v157 = 0;
              int v163 = v156;
              int v164 = v160;
              do
              {
                id v160 = [v54 objectAtIndex:v157];

                if (!v163[6]) {
                  (*((void (**)(uint64_t, void *, void *, void *, _WORD *, uint64_t))updateMatchCountsQueryMatchCounts
                }
                   + 2))((uint64_t)updateMatchCountsQueryMatchCounts, v317, v314, v160, v163, (uint64_t)v334);
                uint64_t v165 = (BOOL (*)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int))*((void *)hasMatchWithCounts + 2);
                unint64_t v166 = *(void *)v163;
                unint64_t v297 = v297 & 0xFFFF000000000000 | *((unsigned int *)v163 + 2) | ((unint64_t)(unsigned __int16)v163[6] << 32);
                if (v165((uint64_t)hasMatchWithCounts, v315, v166, v297, 1, 1, 0))
                {
                  v318[62] = 1;
                  if (v93 == 0x2000000000 || v93 == 0x200000)
                  {
                    unint64_t v172 = [v160 length];
                    int v173 = v284;
                    goto LABEL_249;
                  }
                  int v173 = v284;
                  goto LABEL_250;
                }
                ++v157;
                v163 += 7;
                int v164 = v160;
              }
              while (v155 != v157);
              unint64_t v157 = 0;
              int v167 = v156;
              int v168 = v160;
              while (1)
              {
                id v160 = [v54 objectAtIndex:v157];

                if (!v167[6]) {
                  (*((void (**)(uint64_t, void *, void *, void *, _WORD *, uint64_t))updateMatchCountsQueryMatchCounts
                }
                   + 2))((uint64_t)updateMatchCountsQueryMatchCounts, v317, v314, v160, v167, (uint64_t)v334);
                int v169 = (unsigned int (*)(uint64_t, uint64_t, uint64_t, int))*((void *)hasAsTypedMatchWithCounts
                                                                                    + 2);
                uint64_t v170 = *(void *)v167;
                unsigned int v171 = *((_DWORD *)v167 + 2);
                unint64_t v278 = v278 & 0xFFFF000000000000 | v171 | ((unint64_t)v167[6] << 32);
                if (v169((uint64_t)hasAsTypedMatchWithCounts, v315, v170, v171)) {
                  break;
                }
                ++v157;
                v167 += 7;
                int v168 = v160;
                if (v155 == v157) {
                  goto LABEL_195;
                }
              }
              v318[62] = 1;
              if (v93 == 0x2000000000 || v93 == 0x200000)
              {
                unint64_t v172 = [v160 length];
                int v173 = v285;
                goto LABEL_249;
              }
              int v173 = v285;
              goto LABEL_250;
            }
          }
          v318[63] = 1;
          if (v93 != 0x200000 && v93 != 0x200000000000 && v93 != 0x2000000000)
          {
            int v173 = v280;
LABEL_250:
            *v173 |= v93;
            goto LABEL_251;
          }
          unint64_t v172 = [v160 length];
          int v173 = v280;
LABEL_249:
          if (v172 > 2) {
            goto LABEL_250;
          }
LABEL_251:
          id v100 = v160;

          if ([(__CFString *)v316 isEqualToString:v264]
            || [(__CFString *)v316 isEqualToString:v263])
          {
            id v200 = v100;
            float v201 = (void *)*((void *)v318 + 30);
            *((void *)v318 + 30) = v200;
            goto LABEL_254;
          }
          if ([(__CFString *)v316 isEqualToString:v262])
          {
            float v201 = SSCompactRankingAttrsGetValue(*((int8x8_t **)v318 + 38), 0x84uLL);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 && v157 < [v201 count])
            {
              float v202 = [v201 objectAtIndex:v157];
              unint64_t v203 = v202;
              if (v202)
              {
                [v202 floatValue];
                *(_WORD *)&v335[2 * v337] = 2394;
                uint64_t v204 = v337;
                *(void *)&long long v337 = v337 + 1;
                *(_DWORD *)&v336[4 * v204] = v205;
              }
            }
LABEL_254:
          }
          id v160 = v100;
LABEL_256:
          free(v156);
        }
        else
        {
          id v160 = 0;
LABEL_195:
          id v100 = [v54 stringRepresentation];

          if (v156) {
            goto LABEL_256;
          }
        }

        goto LABEL_294;
      }
LABEL_166:
      if (([(__CFString *)v316 isEqualToString:v293] & 1) == 0)
      {
        uint64_t v99 = *((void *)v318 + 55);
        goto LABEL_177;
      }
      size_t v148 = 14 * [v54 count];
      float v149 = malloc_type_malloc(v148, 0x100004018756113uLL);
      bzero(v149, v148);
      if ([v54 count])
      {
        unint64_t v150 = 0;
        unint64_t v151 = (unint64_t *)v149;
        while (1)
        {
          uint64_t v152 = [v54 objectAtIndex:v150];
          if (v150 == 11) {
            break;
          }
          if (v315 < 2)
          {
            (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts + 2))((uint64_t)updateMatchCounts, v317, v314, v152, v151);
            double v153 = (BOOL (*)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int))*((void *)hasMatchWithCounts + 2);
            unint64_t v154 = *v151;
            unint64_t v290 = v290 & 0xFFFF000000000000 | *((unsigned int *)v151 + 2) | ((unint64_t)*((unsigned __int16 *)v151
                                                                                                  + 6) << 32);
            if (v153((uint64_t)hasMatchWithCounts, v315, v154, v290, 1, 1, 0))
            {
LABEL_230:
              objc_storeStrong(v269, v152);
              break;
            }
          }
          else if ([v318 isGoodMatchAlternateName:v152 withEvaluator:v317])
          {
            goto LABEL_230;
          }

          ++v150;
          unint64_t v151 = (unint64_t *)((char *)v151 + 14);
          if (v150 >= [v54 count]) {
            goto LABEL_232;
          }
        }
      }
LABEL_232:
      int v196 = [v318 firstMatchedAltName];
      BOOL v197 = v196 == 0;

      if (!v197)
      {
        uint64_t v198 = [v318 firstMatchedAltName];
        goto LABEL_236;
      }
      if ([v54 count])
      {
        uint64_t v198 = [v54 stringRepresentation];
LABEL_236:
        id v100 = (id)v198;
      }
      else
      {
        id v100 = 0;
      }

      if (v149)
      {
        int v199 = v149;
        goto LABEL_293;
      }
      goto LABEL_294;
    }
    uint64_t v101 = [v54 count];
    id v102 = (unsigned __int16 *)malloc_type_malloc(14 * v101, 0x100004018756113uLL);
    bzero(v102, 14 * v101);
    if (v101)
    {
      uint64_t v103 = 0;
      int v104 = 0;
      uint64_t v105 = (unint64_t *)v102;
      while (1)
      {
        uint64_t v106 = [v54 objectAtIndex:v103];

        int v104 = v106;
        (*((void (**)(uint64_t, void *, void *, void *, _WORD *, uint64_t))updateMatchCountsQueryMatchCounts + 2))((uint64_t)updateMatchCountsQueryMatchCounts, v317, v314, v106, v105, (uint64_t)v334);
        uint64_t v107 = (BOOL (*)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int))*((void *)hasMatchWithCounts
                                                                                                 + 2);
        unint64_t v108 = *v105;
        unint64_t v313 = v313 & 0xFFFF000000000000 | *((unsigned int *)v105 + 2) | ((unint64_t)*((unsigned __int16 *)v105
                                                                                              + 6) << 32);
        if (v107((uint64_t)hasMatchWithCounts, v315, v108, v313, 1, 0, 1)) {
          break;
        }
        uint64_t v105 = (unint64_t *)((char *)v105 + 14);
        if (v101 == ++v103)
        {
          uint64_t v109 = 0;
          id v110 = v102;
          do
          {
            int v111 = [v54 objectAtIndex:v109];

            int v104 = v111;
            if (!v110[6]) {
              (*((void (**)(uint64_t, void *, void *, void *, _WORD *, uint64_t))updateMatchCountsQueryMatchCounts
            }
               + 2))((uint64_t)updateMatchCountsQueryMatchCounts, v317, v314, v111, v110, (uint64_t)v334);
            id v112 = (BOOL (*)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int))*((void *)hasMatchWithCounts + 2);
            unint64_t v113 = *(void *)v110;
            unint64_t v302 = v302 & 0xFFFF000000000000 | *((unsigned int *)v110 + 2) | ((unint64_t)(unsigned __int16)v110[6] << 32);
            if (v112((uint64_t)hasMatchWithCounts, v315, v113, v302, 1, 1, 0))
            {
              if (v93 == 0x200000)
              {
                unint64_t v121 = [v111 length];
                unint64_t v122 = v284;
                goto LABEL_132;
              }
              unint64_t v122 = v284;
              goto LABEL_133;
            }
            ++v109;
            v110 += 7;
          }
          while (v101 != v109);
          uint64_t v114 = 0;
          float v115 = v102;
          while (1)
          {
            float v116 = [v54 objectAtIndex:v114];

            int v104 = v116;
            if (!v115[6]) {
              (*((void (**)(uint64_t, void *, void *, void *, _WORD *, uint64_t))updateMatchCountsQueryMatchCounts
            }
               + 2))((uint64_t)updateMatchCountsQueryMatchCounts, v317, v314, v116, v115, (uint64_t)v334);
            float v117 = (unsigned int (*)(uint64_t, uint64_t, uint64_t, int))*((void *)hasAsTypedMatchWithCounts + 2);
            uint64_t v118 = *(void *)v115;
            unsigned int v119 = *((_DWORD *)v115 + 2);
            unint64_t v286 = v286 & 0xFFFF000000000000 | v119 | ((unint64_t)v115[6] << 32);
            if (v117((uint64_t)hasAsTypedMatchWithCounts, v315, v118, v119)) {
              break;
            }
            ++v114;
            v115 += 7;
            if (v101 == v114) {
              goto LABEL_134;
            }
          }
          if (v93 == 0x200000)
          {
            unint64_t v121 = [v116 length];
            unint64_t v122 = v285;
            goto LABEL_132;
          }
          unint64_t v122 = v285;
          goto LABEL_133;
        }
      }
      if (v93 != 0x200000)
      {
        unint64_t v122 = v280;
LABEL_133:
        *v122 |= v93;
        goto LABEL_134;
      }
      unint64_t v121 = [v106 length];
      unint64_t v122 = v280;
LABEL_132:
      if (v121 > 2) {
        goto LABEL_133;
      }
LABEL_134:
      free(v102);
    }
    else if (v102)
    {
      int v104 = 0;
      goto LABEL_134;
    }
    uint64_t v99 = *((void *)v318 + 55);
    if ((v99 & 0x100) != 0) {
      goto LABEL_136;
    }
LABEL_89:
    if ((v99 & 4) == 0) {
      goto LABEL_90;
    }
LABEL_147:
    if (([(__CFString *)v316 isEqualToString:v293] & 1) == 0)
    {
      uint64_t v99 = *((void *)v318 + 55);
      if ((v99 & 0x200000) == 0) {
        goto LABEL_177;
      }
      goto LABEL_166;
    }
    size_t v133 = 14 * [v54 count];
    unint64_t v127 = malloc_type_malloc(v133, 0x100004018756113uLL);
    bzero(v127, v133);
    if (![v54 count]) {
      goto LABEL_202;
    }
    uint64_t v134 = 0;
    uint64_t v135 = (unint64_t *)v127;
    while (2)
    {
      uint64_t v136 = [v54 objectAtIndex:v134];
      (*((void (**)(uint64_t, void *, void *, void *, _WORD *))updateMatchCounts + 2))((uint64_t)updateMatchCounts, v317, v314, v136, v135);
      int v137 = (BOOL (*)(uint64_t, uint64_t, unint64_t, uint64_t, int, char, int))*((void *)hasMatchWithCounts
                                                                                               + 2);
      unint64_t v138 = *v135;
      unint64_t v307 = v307 & 0xFFFF000000000000 | *((unsigned int *)v135 + 2) | ((unint64_t)*((unsigned __int16 *)v135
                                                                                            + 6) << 32);
      BOOL v139 = v137((uint64_t)hasMatchWithCounts, v315, v138, v307, 1, 1, 0);
      if (v134)
      {
        if (v139) {
          break;
        }
        goto LABEL_163;
      }
      if (!v139) {
        goto LABEL_163;
      }
      int v140 = +[PRSRankingUtilities hyphensCharacterSet];
      unint64_t v141 = [v136 rangeOfCharacterFromSet:v140];

      if (v141)
      {
        if (v141 != 0x7FFFFFFFFFFFFFFFLL)
        {
          int v142 = [v317 queryString];
          uint64_t v143 = [v136 length];
          int v144 = [MEMORY[0x1E4F1CA20] currentLocale];
          unint64_t v145 = objc_msgSend(v136, "rangeOfString:options:range:locale:", v142, 129, 0, v143, v144);

          BOOL v146 = v145 != 0x7FFFFFFFFFFFFFFFLL && v145 > v141;
          BOOL v147 = !v146;

          if (!v147)
          {
LABEL_163:

            uint64_t v135 = (unint64_t *)((char *)v135 + 14);
            if (++v134 >= (unint64_t)[v54 count]) {
              goto LABEL_202;
            }
            continue;
          }
        }
      }
      break;
    }
    objc_storeStrong(v269, v136);

LABEL_202:
    int v174 = [v318 firstMatchedAltName];
    BOOL v175 = v174 == 0;

    if (!v175)
    {
      uint64_t v176 = [v318 firstMatchedAltName];
      goto LABEL_206;
    }
    if ([v54 count])
    {
      uint64_t v176 = [v54 stringRepresentation];
LABEL_206:
      id v100 = (id)v176;
    }
    else
    {
      id v100 = 0;
    }
LABEL_291:

    if (v127)
    {
      int v199 = v127;
LABEL_293:
      free(v199);
    }
LABEL_294:
    BOOL v226 = [v310 queryKind] == 2 || (unint64_t)(objc_msgSend(v310, "queryKind") - 5) < 4;
    unint64_t v227 = [v317 queryString];
    float v228 = [v310 keyboardLanguage];
    BYTE1(v258) = v312 & 1;
    LOBYTE(v258) = v309 & 1;
    v229 = objc_msgSend(v318, "getBundleSpecificValue:forPropertyName:withQueryString:isCJK:isBullseyeSearch:withEvaluator:keyboardLanguage:seenAuthorEmail:seenPrimaryRecipientEmail:", v100, v316, v227, v303, v226, v317, v228, v258);

    if ((v318[440] & 8) == 0
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && [v229 length]
      || ![(__CFString *)v316 isEqualToString:v306])
    {
      unint64_t v232 = v229;
    }
    else
    {
      unint64_t v230 = SSCompactRankingAttrsGetValue(*((int8x8_t **)v318 + 38), 5uLL);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v231 = v230;
        goto LABEL_317;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v231 = [v230 stringRepresentation];
LABEL_317:
        unint64_t v232 = v231;
      }
      else
      {
        unint64_t v232 = v229;
      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && [v232 length]
      && (![(__CFString *)v316 isEqualToString:v306]
       || ([*((id *)v318 + 28) isEqualToString:v276] & 1) == 0))
    {
      prs_feature_population_ctx_reset_for_property(v305, v316, (*((void *)v318 + 55) & 0x4000) == 0);
      char v235 = [(__CFString *)v316 isEqualToString:v306];
      BYTE1(v257) = v312 & 1;
      LOBYTE(v257) = v309 & 1;
      LOBYTE(v256) = v303;
      LOBYTE(v255) = v235;
      objc_msgSend(v318, "populateTextFeatureValuesForProperty:updatingBundleFeatureValues:propertyIndex:withEvaluator:withContext:featureScoreInfo:propertyCanFuzzyMatch:keyboardLanguage:isCJK:propertyName:seenAuthorEmail:seenPrimaryRecipientEmail:", v232, v288, v295++, v317, v305, &v335, v255, v314, v256, v316, v257);
    }
    else
    {
      uint64_t v233 = v305;
      *(_WORD *)&v335[2 * v337] = sFeatureList[*(_DWORD *)(v305 + 156) + 2];
      uint64_t v234 = v337;
      *(void *)&long long v337 = v337 + 1;
      *(_DWORD *)&v336[4 * v234] = 0;
      *(_DWORD *)(v233 + 156) += v296;
    }
    if ([(__CFString *)v316 isEqualToString:v299])
    {
      int v309 = 1;
    }
    else
    {
      int v236 = [(__CFString *)v316 isEqualToString:v291];
      v312 |= v236;
    }

    uint64_t v51 = v311 + 1;
  }
  while (sRequiredAttributesCount > (unint64_t)(v311 + 1));
LABEL_321:
  float v237 = v318;
  if (v315)
  {
    if (!*((void *)v318 + 59))
    {
      long long v238 = malloc_type_calloc(v315, 8uLL, 0x100004000313F17uLL);
      float v237 = v318;
      *((void *)v318 + 59) = v238;
    }
    if (!*((void *)v237 + 62))
    {
      unint64_t v239 = malloc_type_calloc(v315, 8uLL, 0x100004000313F17uLL);
      float v237 = v318;
      *((void *)v318 + 62) = v239;
    }
    if (!*((void *)v237 + 65))
    {
      float v240 = malloc_type_calloc(v315, 8uLL, 0x100004000313F17uLL);
      float v237 = v318;
      *((void *)v318 + 65) = v240;
    }
    if (!*((void *)v237 + 60))
    {
      long long v241 = malloc_type_calloc(v315, 8uLL, 0x100004000313F17uLL);
      float v237 = v318;
      *((void *)v318 + 60) = v241;
    }
    if (!*((void *)v237 + 63))
    {
      unint64_t v242 = malloc_type_calloc(v315, 8uLL, 0x100004000313F17uLL);
      float v237 = v318;
      *((void *)v318 + 63) = v242;
    }
    if (!*((void *)v237 + 66))
    {
      float v243 = malloc_type_calloc(v315, 8uLL, 0x100004000313F17uLL);
      float v237 = v318;
      *((void *)v318 + 66) = v243;
    }
    if (!*((void *)v237 + 61))
    {
      id v244 = malloc_type_calloc(v315, 8uLL, 0x100004000313F17uLL);
      float v237 = v318;
      *((void *)v318 + 61) = v244;
    }
    if (!*((void *)v237 + 64))
    {
      unint64_t v245 = malloc_type_calloc(v315, 8uLL, 0x100004000313F17uLL);
      float v237 = v318;
      *((void *)v318 + 64) = v245;
    }
    if (!*((void *)v237 + 67))
    {
      unint64_t v246 = malloc_type_calloc(v315, 8uLL, 0x100004000313F17uLL);
      float v237 = v318;
      *((void *)v318 + 67) = v246;
    }
    if ((*((void *)v237 + 58) & 0x8000000000000000) != 0) {
      *((void *)v237 + 58) = v315;
    }
  }
  if ((*((_WORD *)v237 + 221) & 0x204) != 0
    && !v237[62]
    && !v237[63]
    && (*((BOOL (**)(uint64_t, uint64_t, unsigned __int16 **))hasAllQueryTermMatchCounts + 2))((uint64_t)hasAllQueryTermMatchCounts, v315, (unsigned __int16 **)v334))
  {
    v318[62] = 1;
  }
  (*((void (**)(uint64_t, uint64_t, void **))destroyQueryTermMatchCounts + 2))((uint64_t)destroyQueryTermMatchCounts, v315, v334);
  [v318 populateTextContentDistanceMeasures:&v335];
  [v318 populateCrossAttributeDerivedFeaturesWithContext:v305 featureScoreInfo:&v335];
  [v318 populateBundleSpecificFeatures:&v335 currentTime:v271 isSearchToolClient:v18];
  uint64_t v247 = [v317 queryID];
  [v318 populateOtherFeatures:&v335 withEvaluator:v317 currentTime:v282 quParsedEvaluator:v247 queryID:v271 isSearchToolClient:v283 quParsedPersonEvaluator:v18 quParsedArgSearchTermsEvaluator:v270];
  [v318 updateBundleFeatures:v268 withArrValues:v288 featureScoreInfo:&v335];
  id v248 = [v317 queryTerms];
  unint64_t v249 = [v248 count];
  *(_WORD *)&v335[2 * v337] = 363;
  uint64_t v250 = v337;
  *(void *)&long long v337 = v337 + 1;
  *(float *)&v336[4 * v250] = (float)v249;

  int v251 = [v310 isPeopleSearch];
  *(_WORD *)&v335[2 * v337] = 364;
  uint64_t v252 = v337;
  float v253 = 0.0;
  if (v251) {
    float v253 = 1.0;
  }
  *(float *)&v336[4 * v337] = v253;
  *(void *)&long long v337 = v252 + 1;
  objc_msgSend(*((id *)v318 + 32), "setScores:forFeatures:count:");
  unint64_t v254 = (void *)*((void *)v318 + 52);
  *((void *)v318 + 52) = 0;

  [v318 populateRemainingFeaturesWithRanker:v310];
  id v27 = v270;
LABEL_350:
}

uint64_t __238__PRSRankingItem_populateFeaturesWithEvaluator_updatingBundleFeatures_withContext_keyboardLanguage_isCJK_currentTime_withRanker_attributeHolder_quParsedEvaluator_isSearchToolClient_quParsedPersonEvaluator_quParsedArgSearchTermsEvaluator___block_invoke(uint64_t result, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if ((a2 & 6) == 2)
  {
    uint64_t v6 = *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24);
    ++*(_WORD *)(v6 + 2 * a6);
  }
  return result;
}

uint64_t __238__PRSRankingItem_populateFeaturesWithEvaluator_updatingBundleFeatures_withContext_keyboardLanguage_isCJK_currentTime_withRanker_attributeHolder_quParsedEvaluator_isSearchToolClient_quParsedPersonEvaluator_quParsedArgSearchTermsEvaluator___block_invoke_2(uint64_t result, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7)
{
  if ((a2 & 2) != 0 && !(a2 & 4 | a7))
  {
    uint64_t v7 = *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24);
    ++*(_WORD *)(v7 + 2 * a6);
  }
  return result;
}

- (void)populateTextFeatureValuesForProperty:(id)a3 updatingBundleFeatureValues:(float *)(a4 propertyIndex:withEvaluator:withContext:featureScoreInfo:propertyCanFuzzyMatch:keyboardLanguage:isCJK:propertyName:seenAuthorEmail:seenPrimaryRecipientEmail:
{
  LOWORD(v16) = __PAIR16__(a14, a13);
  LOBYTE(v15) = a11;
  LOBYTE(v14) = a9;
  -[PRSRankingItem populateTextFeatureValuesForProperty:updatingBundleFeatureValues:propertyIndex:withEvaluator:withContext:featureScoreInfo:propertyCanFuzzyMatch:keyboardLanguage:isCJK:featureList:propertyName:seenAuthorEmail:seenPrimaryRecipientEmail:](self, "populateTextFeatureValuesForProperty:updatingBundleFeatureValues:propertyIndex:withEvaluator:withContext:featureScoreInfo:propertyCanFuzzyMatch:keyboardLanguage:isCJK:featureList:propertyName:seenAuthorEmail:seenPrimaryRecipientEmail:", a3, a4, a5, a6, a7, a8, v14, a10, v15, &sFeatureList, a12, v16);
}

- (void)populateTextFeatureValuesForProperty:(id)a3 updatingBundleFeatureValues:(float *)(a4 propertyIndex:withEvaluator:withContext:featureScoreInfo:propertyCanFuzzyMatch:keyboardLanguage:isCJK:featureList:propertyName:seenAuthorEmail:seenPrimaryRecipientEmail:
{
  unint64_t v427 = a5;
  v428 = a7;
  v429 = a4;
  uint64_t v486 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  id v422 = a6;
  unsigned int v19 = (char *)a10;
  id v20 = a13;
  if (!self->_spanCalculator) {
    -[PRSRankingItem populateTextFeatureValuesForProperty:updatingBundleFeatureValues:propertyIndex:withEvaluator:withContext:featureScoreInfo:propertyCanFuzzyMatch:keyboardLanguage:isCJK:featureList:propertyName:seenAuthorEmail:seenPrimaryRecipientEmail:]();
  }
  id v21 = v20;
  uint64_t v426 = sRequiredAttributesCount;
  __int16 v423 = self;
  uint64_t v424 = v19;
  id v420 = v20;
  if ((unint64_t)[v18 length] < 0x65) {
    goto LABEL_8;
  }
  uint64_t v22 = v428;
  if ((+[PRSRankingItemRanker isKeywordsHidingEnabled]
     || (self->_bundleIDType & 0x100) == 0
     || ([v21 isEqualToString:*MEMORY[0x1E4F230C8]] & 1) == 0)
    && ([v21 isEqualToString:*MEMORY[0x1E4F22C58]] & 1) == 0)
  {
    uint64_t v23 = [v18 substringToIndex:100];

    id v18 = (id)v23;
LABEL_8:
    uint64_t v22 = v428;
  }
  unint64_t var3 = v22->var3;
  id v25 = v22->var0;
  __int16 v419 = &v415;
  MEMORY[0x1F4188790](v25, v26, v27, v28, v29, v30, v31, v32);
  uint64x2_t v34 = (char *)&v415 - v33;
  bzero((char *)&v415 - v33, 4 * var3);
  bzero(v34, 4 * var3);
  uint64_t v480 = 0;
  v481 = &v480;
  uint64_t v482 = 0x2020000000;
  v483 = v34;
  MEMORY[0x1F4188790](v35, v36, v37, v38, v39, v40, v41, v42);
  uint64_t v43 = (2 * (int)var3 + 15) & 0x3F0;
  bzero((char *)&v415 - v43, 2 * var3);
  bzero((char *)&v415 - v43, 2 * var3);
  MEMORY[0x1F4188790](v44, v45, v46, v47, v48, v49, v50, v51);
  bzero((char *)&v415 - v43, 2 * var3);
  uint64_t v421 = 2 * var3;
  bzero((char *)&v415 - v43, 2 * var3);
  uint64_t v476 = 0;
  v477 = &v476;
  uint64_t v478 = 0x2020000000;
  v479 = (char *)&v415 - v43;
  uint64_t v472 = 0;
  v473 = &v472;
  uint64_t v474 = 0x2020000000;
  v475 = (char *)&v415 - v43;
  uint64_t v52 = v22->var1;
  unint64_t v425 = var3;
  if (var3)
  {
    uint64_t v53 = *MEMORY[0x1E4F1D260];
    unint64_t v54 = v425;
    do
    {
      [(__CFArray *)v25 addObject:v53];
      [(__CFArray *)v52 addObject:v53];
      --v54;
    }
    while (v54);
  }
  id v55 = v422;
  int v56 = [v422 queryTerms];
  float v57 = v428;
  unint64_t var13 = v428->var13;
  uint64_t v468 = 0;
  v469 = (float *)&v468;
  uint64_t v470 = 0x2020000000;
  int v471 = 0;
  uint64_t v464 = 0;
  v465 = (float *)&v464;
  uint64_t v466 = 0x2020000000;
  int v467 = 0;
  uint64_t v460 = 0;
  v461 = (float *)&v460;
  uint64_t v462 = 0x2020000000;
  int v463 = 0;
  v444[0] = MEMORY[0x1E4F143A8];
  v444[1] = 3221225472;
  v444[2] = __252__PRSRankingItem_populateTextFeatureValuesForProperty_updatingBundleFeatureValues_propertyIndex_withEvaluator_withContext_featureScoreInfo_propertyCanFuzzyMatch_keyboardLanguage_isCJK_featureList_propertyName_seenAuthorEmail_seenPrimaryRecipientEmail___block_invoke;
  v444[3] = &unk_1E635A630;
  unint64_t v59 = v425;
  unint64_t v457 = var13;
  unint64_t v458 = v425;
  id v60 = v25;
  v445 = v60;
  id v420 = v420;
  id v446 = v420;
  id v61 = v18;
  id v447 = v61;
  __int16 v417 = v424;
  v448 = v417;
  v451 = &v468;
  v452 = &v464;
  id v418 = v56;
  id v449 = v418;
  v453 = &v476;
  v454 = &v480;
  v459 = v57;
  uint64_t v62 = v52;
  v450 = v62;
  v455 = &v460;
  v456 = &v472;
  id v416 = v61;
  uint64_t v424 = (char *)[v55 evaluateAttribute:v61 ignoreSubtokens:0 strongCompounds:1 skipTranscriptions:0 withHandler:v444];
  uint64_t v63 = (uint64_t *)MEMORY[0x1E4F1D260];
  if (v59)
  {
    float v64 = (unsigned __int16 *)v477[3];
    float v65 = (unsigned __int16 *)v473[3];
    LOBYTE(v66) = 1;
    unint64_t v67 = v59;
    LOBYTE(v68) = 1;
    do
    {
      int v69 = *v64++;
      int v68 = v68 & (v69 != 0);
      int v70 = *v65++;
      int v66 = (v70 != 0) & v66;
      if ((v68 & 1) == 0 && (v66 & 1) == 0)
      {
        float v71 = 0.0;
        float v72 = 0.0;
        goto LABEL_27;
      }
      --v67;
    }
    while (v67);
    if (v68) {
      goto LABEL_20;
    }
LABEL_21:
    float v71 = 0.0;
    float v72 = 0.0;
    if (!v66) {
      goto LABEL_27;
    }
    goto LABEL_25;
  }
  int v66 = 1;
LABEL_20:
  if ([(__CFArray *)v60 containsObject:*MEMORY[0x1E4F1D260]]) {
    goto LABEL_21;
  }
  float v71 = (float)v59 / (float)(unint64_t)v424;
  float v72 = 0.0;
  if ((v66 & 1) == 0) {
    goto LABEL_27;
  }
LABEL_25:
  if (([(__CFArray *)v62 containsObject:*v63] & 1) == 0) {
    float v72 = (float)v59 / (float)(unint64_t)v424;
  }
LABEL_27:
  long long v442 = 0u;
  long long v443 = 0u;
  long long v440 = 0u;
  long long v441 = 0u;
  BOOL v73 = v60;
  uint64_t v74 = 0;
  uint64_t v75 = [(__CFArray *)v73 countByEnumeratingWithState:&v440 objects:v485 count:16];
  if (v75)
  {
    uint64_t v76 = *(void *)v441;
    uint64_t v77 = *v63;
    do
    {
      for (uint64_t i = 0; i != v75; ++i)
      {
        if (*(void *)v441 != v76) {
          objc_enumerationMutation(v73);
        }
        v74 += [*(id *)(*((void *)&v440 + 1) + 8 * i) isEqual:v77];
      }
      uint64_t v75 = [(__CFArray *)v73 countByEnumeratingWithState:&v440 objects:v485 count:16];
    }
    while (v75);
  }

  long long v438 = 0u;
  long long v439 = 0u;
  long long v436 = 0u;
  long long v437 = 0u;
  uint64_t v79 = v62;
  uint64_t v80 = 0;
  uint64_t v81 = [(__CFArray *)v79 countByEnumeratingWithState:&v436 objects:v484 count:16];
  if (v81)
  {
    uint64_t v82 = *(void *)v437;
    uint64_t v83 = *MEMORY[0x1E4F1D260];
    do
    {
      for (uint64_t j = 0; j != v81; ++j)
      {
        if (*(void *)v437 != v82) {
          objc_enumerationMutation(v79);
        }
        v80 += [*(id *)(*((void *)&v436 + 1) + 8 * j) isEqual:v83];
      }
      uint64_t v81 = [(__CFArray *)v79 countByEnumeratingWithState:&v436 objects:v484 count:16];
    }
    while (v81);
  }
  BOOL v85 = v429 == 0;

  uint64_t v86 = v423;
  unint64_t v87 = v425;
  float v88 = (float)(v87 - v74) / (float)v87;
  float v89 = (float)(v87 - v80) / (float)v87;
  uint64_t v90 = v428;
  unsigned int var9 = v428->var9;
  p_unsigned int var9 = &v428->var9;
  v428->unsigned int var9 = var9 + 1;
  a8->var0[a8->var2] = a12[var9];
  var1 = a8->var1;
  unint64_t var2 = a8->var2;
  a8->unint64_t var2 = var2 + 1;
  var1[var2] = v88;
  uint64_t v95 = *p_var9;
  unsigned int *p_var9 = v95 + 1;
  a8->var0[var2 + 1] = a12[v95];
  uint64_t v96 = a8->var1;
  unint64_t v97 = a8->var2;
  a8->unint64_t var2 = v97 + 1;
  v96[v97] = v89;
  if (!v85)
  {
    if (v90->var4[16] < v88) {
      v90->var4[16] = v88;
    }
    if (v90->var4[17] < v89) {
      v90->var4[17] = v89;
    }
  }
  uint64_t v98 = *p_var9;
  unsigned int *p_var9 = v98 + 1;
  a8->var0[v97 + 1] = a12[v98];
  uint64_t v99 = a8->var1;
  unint64_t v100 = a8->var2;
  a8->unint64_t var2 = v100 + 1;
  v99[v100] = 1.0;
  -[PRSRankingSpanCalculator updateWithTermPositions:queryTermCount:tokenCount:](v86->_spanCalculator, "updateWithTermPositions:queryTermCount:tokenCount:", v73);
  uint64_t v101 = *p_var9;
  unsigned int *p_var9 = v101 + 1;
  unsigned __int16 v102 = a12[v101];
  [(PRSRankingSpanCalculator *)v86->_spanCalculator unordered];
  a8->var0[a8->var2] = v102;
  uint64_t v103 = a8->var1;
  unint64_t v104 = a8->var2;
  a8->unint64_t var2 = v104 + 1;
  v103[v104] = v105;
  uint64_t v106 = *p_var9;
  unsigned int *p_var9 = v106 + 1;
  unsigned __int16 v107 = a12[v106];
  [(PRSRankingSpanCalculator *)v86->_spanCalculator ordered];
  a8->var0[a8->var2] = v107;
  unint64_t v108 = a8->var1;
  unint64_t v109 = a8->var2;
  a8->unint64_t var2 = v109 + 1;
  v108[v109] = v110;
  if ([(PRSRankingSpanCalculator *)v86->_spanCalculator pathExists])
  {
    if (v71 > 0.0)
    {
      float var5 = v428->var5;
      if (v71 >= var5) {
        float var5 = v71;
      }
      v428->float var5 = var5;
      float maxCoverage = v86->_maxCoverage;
      if (v71 <= maxCoverage)
      {
        if (v71 != maxCoverage) {
          goto LABEL_59;
        }
        [(PRSRankingSpanCalculator *)v86->_spanCalculator firstTermPosition];
        if (v117 >= v86->_firstPosition) {
          goto LABEL_59;
        }
        [(PRSRankingSpanCalculator *)v86->_spanCalculator firstTermPosition];
      }
      else
      {
        v86->_float maxCoverage = v71;
        [(PRSRankingSpanCalculator *)v86->_spanCalculator firstTermPosition];
      }
      v86->_firstPositiouint64_t n = v113;
    }
LABEL_59:
    if (v429) {
      *((float *)v429 + 13 * v426 + v427) = v71;
    }
    uint64_t v118 = *p_var9;
    unsigned int *p_var9 = v118 + 1;
    a8->var0[a8->var2] = a12[v118];
    unsigned int v119 = a8->var1;
    unint64_t v120 = a8->var2;
    a8->unint64_t var2 = v120 + 1;
    v119[v120] = v71;
    goto LABEL_62;
  }
  if (v429) {
    *((_DWORD *)v429 + 13 * v426 + v427) = 0;
  }
  uint64_t v114 = *p_var9;
  unsigned int *p_var9 = v114 + 1;
  a8->var0[a8->var2] = a12[v114];
  float v115 = a8->var1;
  unint64_t v116 = a8->var2;
  a8->unint64_t var2 = v116 + 1;
  v115[v116] = 0.0;
LABEL_62:
  uint64_t v121 = *p_var9;
  unsigned int *p_var9 = v121 + 1;
  unsigned __int16 v122 = a12[v121];
  [(PRSRankingSpanCalculator *)v86->_spanCalculator pairDist];
  a8->var0[a8->var2] = v122;
  float v123 = a8->var1;
  unint64_t v124 = a8->var2;
  a8->unint64_t var2 = v124 + 1;
  v123[v124] = v125;
  uint64_t v126 = *p_var9;
  unsigned int *p_var9 = v126 + 1;
  unsigned __int16 v127 = a12[v126];
  [(PRSRankingSpanCalculator *)v86->_spanCalculator firstTermPosition];
  a8->var0[a8->var2] = v127;
  unint64_t v128 = a8->var1;
  unint64_t v129 = a8->var2;
  a8->unint64_t var2 = v129 + 1;
  v128[v129] = v130;
  [(PRSRankingSpanCalculator *)v86->_spanCalculator firstTermPosition];
  if (v131 < v428->var7)
  {
    [(PRSRankingSpanCalculator *)v86->_spanCalculator firstTermPosition];
    v428->float var7 = v132;
  }
  if (v429)
  {
    [(PRSRankingSpanCalculator *)v86->_spanCalculator unordered];
    *((_DWORD *)v429 + 17 * v426 + v427) = v133;
    [(PRSRankingSpanCalculator *)v86->_spanCalculator ordered];
    *((_DWORD *)v429 + 19 * v426 + v427) = v134;
    [(PRSRankingSpanCalculator *)v86->_spanCalculator pairDist];
    *((_DWORD *)v429 + 21 * v426 + v427) = v135;
    [(PRSRankingSpanCalculator *)v86->_spanCalculator firstTermPosition];
    *((_DWORD *)v429 + 15 * v426 + v427) = v136;
  }
  uint64_t v137 = *p_var9;
  unsigned int *p_var9 = v137 + 1;
  float v138 = v469[6];
  a8->var0[a8->var2] = a12[v137];
  BOOL v139 = a8->var1;
  unint64_t v140 = a8->var2;
  a8->unint64_t var2 = v140 + 1;
  v139[v140] = v138;
  uint64_t v141 = *p_var9;
  unsigned int *p_var9 = v141 + 1;
  float v142 = v465[6];
  a8->var0[v140 + 1] = a12[v141];
  uint64_t v143 = a8->var1;
  unint64_t v144 = a8->var2;
  a8->unint64_t var2 = v144 + 1;
  v143[v144] = v142;
  uint64_t v145 = *p_var9;
  unsigned int *p_var9 = v145 + 1;
  unsigned __int16 v146 = a12[v145];
  unsigned int v147 = [(PRSRankingSpanCalculator *)v86->_spanCalculator n2Exists];
  a8->var0[a8->var2] = v146;
  size_t v148 = a8->var1;
  unint64_t v149 = a8->var2;
  a8->unint64_t var2 = v149 + 1;
  v148[v149] = (float)v147;
  uint64_t v150 = *p_var9;
  unsigned int *p_var9 = v150 + 1;
  unsigned __int16 v151 = a12[v150];
  float v152 = (float)[(PRSRankingSpanCalculator *)v86->_spanCalculator n3Exists];
  a8->var0[a8->var2] = v151;
  double v153 = a8->var1;
  unint64_t v154 = a8->var2;
  a8->unint64_t var2 = v154 + 1;
  v153[v154] = v152;
  if (v429)
  {
    [(PRSRankingSpanCalculator *)v86->_spanCalculator unordered];
    if (v428->var4[22] > v155) {
      v428->var4[22] = v155;
    }
    [(PRSRankingSpanCalculator *)v86->_spanCalculator ordered];
    if (v428->var4[24] > v156) {
      v428->var4[24] = v156;
    }
    [(PRSRankingSpanCalculator *)v86->_spanCalculator pairDist];
    if (v428->var4[26] > v157) {
      v428->var4[26] = v157;
    }
  }
  unint64_t v158 = (void *)[(__CFArray *)v79 mutableCopy];
  if ([v158 count])
  {
    uint64_t v159 = [v158 count];
    if (v159 == [(__CFArray *)v73 count])
    {
      [v158 removeLastObject];
      id v160 = [(__CFArray *)v73 lastObject];
      [v158 addObject:v160];
    }
  }
  [(PRSRankingSpanCalculator *)v86->_spanCalculator updateWithTermPositions:v158 queryTermCount:v425 tokenCount:v424];
  uint64_t v161 = *p_var9;
  unsigned int *p_var9 = v161 + 1;
  unsigned __int16 v162 = a12[v161];
  unsigned int v163 = [(PRSRankingSpanCalculator *)v86->_spanCalculator n2Exists];
  a8->var0[a8->var2] = v162;
  int v164 = a8->var1;
  unint64_t v165 = a8->var2;
  a8->unint64_t var2 = v165 + 1;
  v164[v165] = (float)v163;
  uint64_t v166 = *p_var9;
  unsigned int *p_var9 = v166 + 1;
  unsigned __int16 v167 = a12[v166];
  unsigned int v168 = [(PRSRankingSpanCalculator *)v86->_spanCalculator n3Exists];
  a8->var0[a8->var2] = v167;
  int v169 = a8->var1;
  unint64_t v170 = a8->var2;
  a8->unint64_t var2 = v170 + 1;
  v169[v170] = (float)v168;
  [(PRSRankingSpanCalculator *)v86->_spanCalculator updateWithTermPositions:v79 queryTermCount:v425 tokenCount:v424];
  uint64_t v171 = *p_var9;
  unsigned int *p_var9 = v171 + 1;
  unsigned __int16 v172 = a12[v171];
  [(PRSRankingSpanCalculator *)v86->_spanCalculator unordered];
  a8->var0[a8->var2] = v172;
  int v173 = a8->var1;
  unint64_t v174 = a8->var2;
  a8->unint64_t var2 = v174 + 1;
  v173[v174] = v175;
  uint64_t v176 = *p_var9;
  unsigned int *p_var9 = v176 + 1;
  unsigned __int16 v177 = a12[v176];
  [(PRSRankingSpanCalculator *)v86->_spanCalculator ordered];
  a8->var0[a8->var2] = v177;
  BOOL v178 = a8->var1;
  unint64_t v179 = a8->var2;
  a8->unint64_t var2 = v179 + 1;
  v178[v179] = v180;
  if ([(PRSRankingSpanCalculator *)v86->_spanCalculator pathExists])
  {
    if (v72 > 0.0)
    {
      float var6 = v428->var6;
      if (v72 >= var6) {
        float var6 = v72;
      }
      v428->float var6 = var6;
    }
    if (v429) {
      *((float *)v429 + 14 * v426 + v427) = v72;
    }
    uint64_t v182 = *p_var9;
    unsigned int *p_var9 = v182 + 1;
    a8->var0[a8->var2] = a12[v182];
    uint64_t v183 = a8->var1;
    unint64_t v184 = a8->var2;
    a8->unint64_t var2 = v184 + 1;
    v183[v184] = v72;
  }
  else
  {
    if (v429) {
      *((_DWORD *)v429 + 14 * v426 + v427) = 0;
    }
    uint64_t v185 = *p_var9;
    unsigned int *p_var9 = v185 + 1;
    a8->var0[a8->var2] = a12[v185];
    BOOL v186 = a8->var1;
    unint64_t v187 = a8->var2;
    a8->unint64_t var2 = v187 + 1;
    v186[v187] = 0.0;
  }
  uint64_t v188 = *p_var9;
  unsigned int *p_var9 = v188 + 1;
  unsigned __int16 v189 = a12[v188];
  [(PRSRankingSpanCalculator *)v86->_spanCalculator pairDist];
  a8->var0[a8->var2] = v189;
  uint64_t v190 = a8->var1;
  unint64_t v191 = a8->var2;
  a8->unint64_t var2 = v191 + 1;
  v190[v191] = v192;
  uint64_t v193 = *p_var9;
  unsigned int *p_var9 = v193 + 1;
  unsigned __int16 v194 = a12[v193];
  [(PRSRankingSpanCalculator *)v86->_spanCalculator firstTermPosition];
  a8->var0[a8->var2] = v194;
  BOOL v195 = a8->var1;
  unint64_t v196 = a8->var2;
  a8->unint64_t var2 = v196 + 1;
  v195[v196] = v197;
  [(PRSRankingSpanCalculator *)v86->_spanCalculator firstTermPosition];
  if (v198 < v428->var8)
  {
    [(PRSRankingSpanCalculator *)v86->_spanCalculator firstTermPosition];
    v428->float var8 = v199;
  }
  if (v429)
  {
    [(PRSRankingSpanCalculator *)v86->_spanCalculator unordered];
    *((_DWORD *)v429 + 18 * v426 + v427) = v200;
    [(PRSRankingSpanCalculator *)v86->_spanCalculator ordered];
    *((_DWORD *)v429 + 20 * v426 + v427) = v201;
    [(PRSRankingSpanCalculator *)v86->_spanCalculator pairDist];
    *((_DWORD *)v429 + 22 * v426 + v427) = v202;
    [(PRSRankingSpanCalculator *)v86->_spanCalculator firstTermPosition];
    *((_DWORD *)v429 + 16 * v426 + v427) = v203;
  }
  uint64_t v204 = *p_var9;
  unsigned int *p_var9 = v204 + 1;
  float v205 = v461[6];
  a8->var0[a8->var2] = a12[v204];
  float v206 = a8->var1;
  unint64_t v207 = a8->var2;
  a8->unint64_t var2 = v207 + 1;
  v206[v207] = v205;
  uint64_t v208 = *p_var9;
  unsigned int *p_var9 = v208 + 1;
  unsigned __int16 v209 = a12[v208];
  unsigned int v210 = [(PRSRankingSpanCalculator *)v86->_spanCalculator n2Exists];
  a8->var0[a8->var2] = v209;
  uint64_t v211 = a8->var1;
  unint64_t v212 = a8->var2;
  a8->unint64_t var2 = v212 + 1;
  v211[v212] = (float)v210;
  uint64_t v213 = *p_var9;
  unsigned int *p_var9 = v213 + 1;
  unsigned __int16 v214 = a12[v213];
  *(float *)&double v215 = (float)[(PRSRankingSpanCalculator *)v86->_spanCalculator n3Exists];
  a8->var0[a8->var2] = v214;
  BOOL v222 = a8->var1;
  unint64_t v223 = a8->var2;
  a8->unint64_t var2 = v223 + 1;
  v222[v223] = *(float *)&v215;
  if (v429)
  {
    [(PRSRankingSpanCalculator *)v86->_spanCalculator unordered];
    if (v428->var4[23] > v224) {
      v428->var4[23] = v224;
    }
    [(PRSRankingSpanCalculator *)v86->_spanCalculator ordered];
    if (v428->var4[25] > v225) {
      v428->var4[25] = v225;
    }
    [(PRSRankingSpanCalculator *)v86->_spanCalculator pairDist];
    *(float *)&double v216 = v428->var4[27];
    if (*(float *)&v216 > *(float *)&v215) {
      v428->var4[27] = *(float *)&v215;
    }
  }
  uint64_t v434 = 0;
  uint64_t v435 = 0;
  float v433 = 0.0;
  unint64_t v226 = v425;
  statisticsFromValues(v477[3], v425, (float *)&v435 + 1, (float *)&v435, (float *)&v434 + 1, (float *)&v434, &v433, 0, v215, v216, v217, v218, v219, v220, v221);
  uint64_t v229 = *p_var9;
  unsigned int *p_var9 = v229 + 1;
  LODWORD(v230) = HIDWORD(v435);
  LODWORD(v231) = v435;
  a8->var0[a8->var2] = a12[v229];
  unint64_t v232 = a8->var1;
  unint64_t v233 = a8->var2;
  a8->unint64_t var2 = v233 + 1;
  v232[v233] = *(float *)&v230;
  uint64_t v234 = *p_var9;
  unsigned int *p_var9 = v234 + 1;
  a8->var0[v233 + 1] = a12[v234];
  char v235 = a8->var1;
  unint64_t v236 = a8->var2;
  a8->unint64_t var2 = v236 + 1;
  v235[v236] = *(float *)&v231;
  uint64_t v237 = *p_var9;
  unsigned int *p_var9 = v237 + 1;
  LODWORD(v238) = HIDWORD(v434);
  float v239 = *(float *)&v434;
  a8->var0[v236 + 1] = a12[v237];
  float v240 = a8->var1;
  unint64_t v241 = a8->var2;
  a8->unint64_t var2 = v241 + 1;
  v240[v241] = *(float *)&v238;
  uint64_t v242 = *p_var9;
  unsigned int *p_var9 = v242 + 1;
  a8->var0[v241 + 1] = a12[v242];
  float v243 = a8->var1;
  unint64_t v244 = a8->var2;
  a8->unint64_t var2 = v244 + 1;
  v243[v244] = v239;
  uint64_t v245 = *p_var9;
  unsigned int *p_var9 = v245 + 1;
  *(float *)&double v246 = v433;
  a8->var0[v244 + 1] = a12[v245];
  uint64_t v247 = a8->var1;
  unint64_t v248 = a8->var2;
  unint64_t v249 = v248 + 1;
  a8->unint64_t var2 = v248 + 1;
  v247[v248] = *(float *)&v246;
  uint64_t v250 = v429;
  if (v429)
  {
    uint64_t v252 = v426;
    unint64_t v251 = v427;
    *((_DWORD *)v429 + v426 + v427) = LODWORD(v231);
    *((_DWORD *)v250 + 2 * v252 + v251) = LODWORD(v230);
    *((_DWORD *)v250 + 5 * v252 + v251) = LODWORD(v238);
    float v253 = (float *)v428;
    *(float *)&double v227 = v428->var4[0];
    if (*(float *)&v227 < *(float *)&v230) {
      v428->var4[0] = *(float *)&v230;
    }
    if (v253[9] < *(float *)&v231) {
      v253[9] = *(float *)&v231;
    }
    if (v253[13] < *(float *)&v246) {
      v253[13] = *(float *)&v246;
    }
    if (v253[25] > *(float *)&v238) {
      v253[25] = *(float *)&v238;
    }
    *(float *)&double v230 = v253[11];
    if (*(float *)&v230 < v239) {
      v428->var4[4] = v239;
    }
  }
  statisticsFromValues(v481[3], v226, (float *)&v435 + 1, (float *)&v435, (float *)&v434 + 1, (float *)&v434, &v433, 1, v230, v231, v238, v239, v246, v227, v228);
  uint64_t v254 = *p_var9;
  unsigned int *p_var9 = v254 + 1;
  float v255 = *((float *)&v435 + 1);
  a8->var0[v249] = a12[v254];
  uint64_t v256 = a8->var1;
  unint64_t v257 = a8->var2;
  a8->unint64_t var2 = v257 + 1;
  v256[v257] = v255;
  uint64_t v258 = *p_var9;
  unsigned int *p_var9 = v258 + 1;
  float v259 = *(float *)&v435;
  a8->var0[v257 + 1] = a12[v258];
  unint64_t v260 = a8->var1;
  unint64_t v261 = a8->var2;
  a8->unint64_t var2 = v261 + 1;
  v260[v261] = v259;
  uint64_t v262 = *p_var9;
  unsigned int *p_var9 = v262 + 1;
  float v263 = *((float *)&v434 + 1);
  a8->var0[v261 + 1] = a12[v262];
  uint64_t v264 = a8->var1;
  unint64_t v265 = a8->var2;
  a8->unint64_t var2 = v265 + 1;
  v264[v265] = v263;
  uint64_t v266 = *p_var9;
  unsigned int *p_var9 = v266 + 1;
  float v267 = *(float *)&v434;
  a8->var0[v265 + 1] = a12[v266];
  uint64_t v268 = a8->var1;
  unint64_t v269 = a8->var2;
  a8->unint64_t var2 = v269 + 1;
  v268[v269] = v267;
  uint64_t v270 = *p_var9;
  unsigned int *p_var9 = v270 + 1;
  *(float *)&double v271 = v433;
  a8->var0[v269 + 1] = a12[v270];
  unint64_t v272 = a8->var1;
  unint64_t v273 = a8->var2;
  unint64_t v274 = v226;
  unint64_t v275 = v273 + 1;
  a8->unint64_t var2 = v273 + 1;
  v272[v273] = *(float *)&v271;
  uint64_t v282 = statisticsFromValues(v473[3], v274, (float *)&v435 + 1, (float *)&v435, (float *)&v434 + 1, (float *)&v434, &v433, 0, v271, v276, v277, v278, v279, v280, v281);
  uint64_t v289 = *p_var9;
  unsigned int *p_var9 = v289 + 1;
  uint64_t v290 = v435;
  a8->var0[v275] = a12[v289];
  uint64_t v291 = a8->var1;
  unint64_t v292 = a8->var2;
  a8->unint64_t var2 = v292 + 1;
  v291[v292] = *((float *)&v290 + 1);
  uint64_t v293 = *p_var9;
  unsigned int *p_var9 = v293 + 1;
  a8->var0[v292 + 1] = a12[v293];
  id v294 = a8->var1;
  unint64_t v295 = a8->var2;
  a8->unint64_t var2 = v295 + 1;
  LODWORD(v294[v295]) = v290;
  uint64_t v296 = *p_var9;
  unsigned int *p_var9 = v296 + 1;
  uint64_t v297 = v434;
  a8->var0[v295 + 1] = a12[v296];
  unint64_t v298 = a8->var1;
  unint64_t v299 = a8->var2;
  a8->unint64_t var2 = v299 + 1;
  v298[v299] = *((float *)&v297 + 1);
  uint64_t v300 = *p_var9;
  unsigned int *p_var9 = v300 + 1;
  a8->var0[v299 + 1] = a12[v300];
  id v301 = a8->var1;
  unint64_t v302 = a8->var2;
  a8->unint64_t var2 = v302 + 1;
  LODWORD(v301[v302]) = v297;
  uint64_t v303 = *p_var9;
  unsigned int *p_var9 = v303 + 1;
  float v304 = v433;
  a8->var0[v302 + 1] = a12[v303];
  uint64_t v305 = a8->var1;
  unint64_t v306 = a8->var2;
  unint64_t v307 = v250;
  unint64_t v308 = v306 + 1;
  a8->unint64_t var2 = v306 + 1;
  v305[v306] = v304;
  if (v307)
  {
    int v309 = v429;
    uint64_t v311 = v426;
    unint64_t v310 = v427;
    *((_DWORD *)v429 + 3 * v426 + v427) = v290;
    *((_DWORD *)v309 + 4 * v311 + v310) = HIDWORD(v290);
    *((_DWORD *)v309 + 6 * v311 + v310) = HIDWORD(v297);
    int v312 = v428;
    if (v428->var4[1] < *((float *)&v290 + 1)) {
      v428->var4[1] = *((float *)&v290 + 1);
    }
    if (v312->var4[3] < *(float *)&v290) {
      LODWORD(v312->var4[3]) = v290;
    }
    if (v312->var4[7] < v304) {
      v312->var4[7] = v304;
    }
    if (v312->var4[19] > *((float *)&v297 + 1)) {
      v312->var4[19] = *((float *)&v297 + 1);
    }
    if (v312->var4[5] < *(float *)&v297) {
      LODWORD(v428->var4[5]) = v297;
    }
  }
  id v415 = v158;
  MEMORY[0x1F4188790](v282, v421, v283, v284, v285, v286, v287, v288);
  uint64_t v424 = (char *)&v415 - v313;
  bzero((char *)&v415 - v313, v314);
  unint64_t v322 = v425;
  if (v425)
  {
    long long v323 = (unsigned __int16 *)v473[3];
    uint64_t v324 = v424;
    unint64_t v325 = v425;
    do
    {
      int v326 = *v323++;
      *(_WORD *)uint64_t v324 = v326 != 0;
      v324 += 2;
      --v325;
    }
    while (v325);
  }
  statisticsFromValues((uint64_t)v424, v322, (float *)&v435 + 1, (float *)&v435, (float *)&v434 + 1, (float *)&v434, &v433, 0, v315, v316, v317, v318, v319, v320, v321);
  uint64_t v327 = *p_var9;
  unsigned int *p_var9 = v327 + 1;
  uint64_t v328 = v435;
  a8->var0[v308] = a12[v327];
  long long v329 = a8->var1;
  unint64_t v330 = a8->var2;
  a8->unint64_t var2 = v330 + 1;
  v329[v330] = *((float *)&v328 + 1);
  uint64_t v331 = *p_var9;
  unsigned int *p_var9 = v331 + 1;
  a8->var0[v330 + 1] = a12[v331];
  long long v332 = a8->var1;
  unint64_t v333 = a8->var2;
  a8->unint64_t var2 = v333 + 1;
  LODWORD(v332[v333]) = v328;
  uint64_t v334 = *p_var9;
  unsigned int *p_var9 = v334 + 1;
  uint64_t v335 = v434;
  a8->var0[v333 + 1] = a12[v334];
  v336 = a8->var1;
  unint64_t v337 = a8->var2;
  a8->unint64_t var2 = v337 + 1;
  v336[v337] = *((float *)&v335 + 1);
  uint64_t v338 = *p_var9;
  unsigned int *p_var9 = v338 + 1;
  a8->var0[v337 + 1] = a12[v338];
  unint64_t v339 = a8->var1;
  unint64_t v340 = a8->var2;
  a8->unint64_t var2 = v340 + 1;
  LODWORD(v339[v340]) = v335;
  uint64_t v341 = *p_var9;
  unsigned int *p_var9 = v341 + 1;
  float v342 = v433;
  a8->var0[v340 + 1] = a12[v341];
  unint64_t v343 = a8->var1;
  unint64_t v344 = a8->var2;
  a8->unint64_t var2 = v344 + 1;
  v343[v344] = v342;
  unint64_t v345 = v423;
  v346 = v428;
  unint64_t v347 = v429;
  if (v429)
  {
    if (v428->var4[9] < *((float *)&v328 + 1)) {
      v428->var4[9] = *((float *)&v328 + 1);
    }
    if (v346->var4[11] < *(float *)&v328) {
      LODWORD(v346->var4[11]) = v328;
    }
    if (v346->var4[15] < v342) {
      v346->var4[15] = v342;
    }
    if (v346->var4[13] < *(float *)&v335) {
      LODWORD(v346->var4[13]) = v335;
    }
    if (v346->var4[21] > *((float *)&v335 + 1)) {
      v346->var4[21] = *((float *)&v335 + 1);
    }
    uint64_t v349 = v426;
    unint64_t v348 = v427;
    *((_DWORD *)v347 + 8 * v426 + v427) = v328;
    *((_DWORD *)v347 + 10 * v349 + v348) = HIDWORD(v328);
    *((_DWORD *)v347 + 12 * v349 + v348) = HIDWORD(v335);
  }
  uint64_t v350 = [(PRSRankingItem *)v345 attrType:v420 seenAuthorEmail:a14 seenPrimaryRecipientEmail:a15];
  v352 = v424;
  unint64_t v351 = v425;
  uint64_t v353 = v350;
  [(PRSRankingItem *)v345 updateAttrCountsWord:v424 queryTermCount:v425 attrType:v350];
  [(PRSRankingItem *)v345 updateAttrCountsWord2:v352 queryTermCount:v351 attrType:v353];
  uint64_t v354 = [(PRSRankingItem *)v345 updateAttrCountsWord3:v352 queryTermCount:v351 attrType:v353];
  MEMORY[0x1F4188790](v354, v421, v355, v356, v357, v358, v359, v360);
  float v362 = (char *)&v415 - v361;
  bzero((char *)&v415 - v361, v363);
  if (v351)
  {
    uint64_t v371 = (unsigned __int16 *)v477[3];
    v372 = v362;
    unint64_t v373 = v351;
    do
    {
      int v374 = *v371++;
      *(_WORD *)v372 = v374 != 0;
      v372 += 2;
      --v373;
    }
    while (v373);
  }
  float v432 = 0.0;
  uint64_t v430 = 0;
  uint64_t v431 = 0;
  statisticsFromValues((uint64_t)v362, v351, &v432, (float *)&v431 + 1, (float *)&v431, (float *)&v430 + 1, (float *)&v430, 0, v364, v365, v366, v367, v368, v369, v370);
  uint64_t v375 = *p_var9;
  unsigned int *p_var9 = v375 + 1;
  float v377 = *((float *)&v431 + 1);
  float v376 = v432;
  a8->var0[a8->var2] = a12[v375];
  unint64_t v378 = a8->var1;
  unint64_t v379 = a8->var2;
  a8->unint64_t var2 = v379 + 1;
  v378[v379] = v376;
  uint64_t v380 = *p_var9;
  unsigned int *p_var9 = v380 + 1;
  a8->var0[v379 + 1] = a12[v380];
  unint64_t v381 = a8->var1;
  unint64_t v382 = a8->var2;
  a8->unint64_t var2 = v382 + 1;
  v381[v382] = v377;
  uint64_t v383 = *p_var9;
  unsigned int *p_var9 = v383 + 1;
  float v385 = *((float *)&v430 + 1);
  float v384 = *(float *)&v431;
  a8->var0[v382 + 1] = a12[v383];
  uint64_t v386 = a8->var1;
  unint64_t v387 = a8->var2;
  a8->unint64_t var2 = v387 + 1;
  v386[v387] = v384;
  uint64_t v388 = *p_var9;
  unsigned int *p_var9 = v388 + 1;
  a8->var0[v387 + 1] = a12[v388];
  v389 = a8->var1;
  unint64_t v390 = a8->var2;
  a8->unint64_t var2 = v390 + 1;
  v389[v390] = v385;
  uint64_t v391 = *p_var9;
  unsigned int *p_var9 = v391 + 1;
  float v392 = *(float *)&v430;
  a8->var0[v390 + 1] = a12[v391];
  id v393 = a8->var1;
  unint64_t v394 = a8->var2;
  a8->unint64_t var2 = v394 + 1;
  v393[v394] = v392;
  if (v429)
  {
    float v395 = (float *)v428;
    if (v428->var4[8] < v376) {
      v428->var4[8] = v376;
    }
    if (v395[17] < v377) {
      v395[17] = v377;
    }
    if (v395[21] < v392) {
      v395[21] = v392;
    }
    if (v395[19] < v385) {
      v395[19] = v385;
    }
    if (v395[27] > v384) {
      v395[27] = v384;
    }
    id v396 = v429;
    uint64_t v398 = v426;
    unint64_t v397 = v427;
    *((float *)v429 + 7 * v426 + v427) = v377;
    *((float *)v396 + 9 * v398 + v397) = v376;
    *((float *)v396 + 11 * v398 + v397) = v384;
  }
  v399 = v423;
  unint64_t v400 = v425;
  [(PRSRankingItem *)v423 updateAttrCountsPrefix:v362 queryTermCount:v425 attrType:v353];
  [(PRSRankingItem *)v399 updateAttrCountsPrefix2:v362 queryTermCount:v400 attrType:v353];
  [(PRSRankingItem *)v399 updateAttrCountsPrefix3:v362 queryTermCount:v400 attrType:v353];
  [(PRSRankingItem *)v399 updateAttrCountsPrefixLast:v424 termsDidMatchPrefix:v362 queryTermCount:v400 attrType:v353];
  [(PRSRankingItem *)v399 updateAttrCountsPrefixLast2:v424 termsDidMatchPrefix:v362 queryTermCount:v400 attrType:v353];
  [(PRSRankingItem *)v399 updateAttrCountsPrefixLast3:v424 termsDidMatchPrefix:v362 queryTermCount:v400 attrType:v353];
  unint64_t attrExact = v399->_attrExact;
  uint64_t v402 = *p_var9;
  unsigned int *p_var9 = v402 + 1;
  a8->var0[a8->var2] = a12[v402];
  unint64_t v403 = a8->var2;
  float v404 = 1.0;
  if ((attrExact & v353) != 0) {
    float v405 = 1.0;
  }
  else {
    float v405 = 0.0;
  }
  a8->var1[v403] = v405;
  unint64_t v406 = v403 + 1;
  a8->unint64_t var2 = v403 + 1;
  unint64_t attrStrong = v399->_attrStrong;
  uint64_t v408 = *p_var9;
  unsigned int *p_var9 = v408 + 1;
  a8->var0[v406] = a12[v408];
  unint64_t v409 = a8->var2;
  if ((attrStrong & v353) != 0) {
    float v410 = 1.0;
  }
  else {
    float v410 = 0.0;
  }
  a8->var1[v409] = v410;
  unint64_t v411 = v409 + 1;
  a8->unint64_t var2 = v409 + 1;
  unint64_t attrAsTyped = v399->_attrAsTyped;
  uint64_t v413 = *p_var9;
  unsigned int *p_var9 = v413 + 1;
  a8->var0[v411] = a12[v413];
  unint64_t v414 = a8->var2;
  if ((attrAsTyped & v353) == 0) {
    float v404 = 0.0;
  }
  a8->var1[v414] = v404;
  a8->unint64_t var2 = v414 + 1;

  _Block_object_dispose(&v460, 8);
  _Block_object_dispose(&v464, 8);
  _Block_object_dispose(&v468, 8);

  _Block_object_dispose(&v472, 8);
  _Block_object_dispose(&v476, 8);
  _Block_object_dispose(&v480, 8);
}

void __252__PRSRankingItem_populateTextFeatureValuesForProperty_updatingBundleFeatureValues_propertyIndex_withEvaluator_withContext_featureScoreInfo_propertyCanFuzzyMatch_keyboardLanguage_isCJK_featureList_propertyName_seenAuthorEmail_seenPrimaryRecipientEmail___block_invoke(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, uint64_t a7)
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  uint64_t v15 = *(void *)(a1 + 128);
  uint64_t v14 = *(NSObject **)(a1 + 136);
  if ((a2 & 7) == 1)
  {
    if ([*(id *)(a1 + 32) count] <= a6)
    {
      char v42 = v15;
      char v43 = (char)v14;
      uint64_t v14 = PRSLogCategoryDefault();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        uint64_t v33 = [*(id *)(a1 + 32) count];
        uint64_t v34 = *(void *)(a1 + 136);
        uint64_t v41 = *(void *)(a1 + 40);
        uint64_t v35 = [*(id *)(a1 + 48) length];
        uint64_t v36 = *(void *)(a1 + 56);
        *(_DWORD *)buf = 134220546;
        unint64_t v46 = a6;
        __int16 v47 = 2048;
        uint64_t v48 = v33;
        __int16 v49 = 2048;
        uint64_t v50 = v34;
        __int16 v51 = 2112;
        uint64_t v52 = v41;
        __int16 v53 = 2048;
        uint64_t v54 = v35;
        __int16 v55 = 2112;
        uint64_t v56 = v36;
        __int16 v57 = 2048;
        unint64_t v58 = a2;
        __int16 v59 = 2048;
        unint64_t v60 = a3;
        __int16 v61 = 2048;
        unint64_t v62 = a4;
        __int16 v63 = 2048;
        unint64_t v64 = a5;
        __int16 v65 = 2048;
        uint64_t v66 = a7;
        _os_log_error_impl(&dword_1BDB2A000, v14, OS_LOG_TYPE_ERROR, "matchedQueryTermIndex (%lu) >= prefixMatchIndicies.count (%lu), queryTermCount = %lu, propertyName = %@, propertyValue.length = %lu, keyboardLanguage = %@, matchedType = %lu, attributeRange.locatiouint64_t n = %lu, attributeRange.length = %lu, tokenType = %lu, matchedTokenIndex: %lu", buf, 0x70u);
      }

      getpid();
      uint64_t v16 = [NSString stringWithFormat:@"matchedQueryTermIndex (%lu) >= prefixMatchIndicies.count (%lu), queryTermCount = %lu, propertyName = %@, propertyValue.length = %lu, keyboardLanguage = %@, matchedType = %lu, attributeRange.location = %lu, attributeRange.length = %lu, tokenType = %lu, matchedTokenIndex: %lu", a6, objc_msgSend(*(id *)(a1 + 32), "count"), *(void *)(a1 + 136), *(void *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "length"), *(void *)(a1 + 56), a2, a3, a4, a5, a7];
      SimulateCrash();

      LOBYTE(v15) = v42;
      LOBYTE(v14) = v43;
    }
    if ([*(id *)(a1 + 32) count] && objc_msgSend(*(id *)(a1 + 32), "count") > a6)
    {
      double v17 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a6];
      if (v17 == (void *)*MEMORY[0x1E4F1D260])
      {
        unint64_t v18 = a4;
        uint64_t v19 = objc_opt_new();

        [*(id *)(a1 + 32) setObject:v19 atIndexedSubscript:a6];
        double v17 = (void *)v19;
        a4 = v18;
      }
      id v20 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a7];
      [v17 addObject:v20];

      *(float *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = *(float *)(*(void *)(*(void *)(a1 + 80) + 8)
                                                                            + 24)
                                                                 + 1.0;
      id v21 = [*(id *)(a1 + 64) objectAtIndexedSubscript:a6];
      *(float *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = (float)((float)(unint64_t)[v21 length]
                                                                         / (float)a4)
                                                                 + *(float *)(*(void *)(*(void *)(a1 + 88) + 8)
                                                                            + 24);

      uint64_t v22 = *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24);
      ++*(_WORD *)(v22 + 2 * a6);
      uint64_t v23 = [*(id *)(a1 + 64) objectAtIndexedSubscript:a6];
      unint64_t v24 = [v23 length];
      uint64_t v25 = *(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 24);
      *(float *)(v25 + 4 * a6) = (float)((float)v24 / (float)a4) + *(float *)(v25 + 4 * a6);

      if (*(void *)(a1 + 128) == 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_24;
      }
      uint64_t v26 = (void *)(*(void *)(a1 + 144) + 160);
LABEL_23:
      *v26 |= 1 << (a6 + v14 * v15);
LABEL_24:
    }
  }
  else if ((a2 & 6) == 2)
  {
    if ([*(id *)(a1 + 72) count] <= a6)
    {
      char v44 = (char)v14;
      uint64_t v14 = PRSLogCategoryDefault();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        uint64_t v37 = [*(id *)(a1 + 72) count];
        uint64_t v38 = *(void *)(a1 + 136);
        uint64_t v39 = *(void *)(a1 + 40);
        uint64_t v40 = *(void *)(a1 + 56);
        *(_DWORD *)buf = 134220290;
        unint64_t v46 = a6;
        __int16 v47 = 2048;
        uint64_t v48 = v37;
        __int16 v49 = 2048;
        uint64_t v50 = v38;
        __int16 v51 = 2112;
        uint64_t v52 = v39;
        __int16 v53 = 2112;
        uint64_t v54 = v40;
        __int16 v55 = 2048;
        uint64_t v56 = a2;
        __int16 v57 = 2048;
        unint64_t v58 = a3;
        __int16 v59 = 2048;
        unint64_t v60 = a4;
        __int16 v61 = 2048;
        unint64_t v62 = a5;
        __int16 v63 = 2048;
        unint64_t v64 = a7;
        _os_log_error_impl(&dword_1BDB2A000, v14, OS_LOG_TYPE_ERROR, "matchedQueryTermIndex %lu >= wordMatchIndices.count %lu, queryTermCount = %lu, propertyName = %@, keyboardLanguage = %@, matchedType = %lu, attributeRange.locatiouint64_t n = %lu, attributeRange.length = %lu, tokenType = %lu, matchedTokenIndex: %lu", buf, 0x66u);
      }

      getpid();
      [NSString stringWithFormat:@"matchedQueryTermIndex %lu >= wordMatchIndices.count %lu, queryTermCount = %lu, propertyName = %@, keyboardLanguage = %@, matchedType = %lu, attributeRange.locatiouint64_t n = %lu, attributeRange.length = %lu, tokenType = %lu, matchedTokenIndex: %lu", a6, objc_msgSend(*(id *)(a1 + 72), "count"), *(void *)(a1 + 136), *(void *)(a1 + 40), *(void *)(a1 + 56), a2, a3, a4, a5, a7];
      v28 = uint64_t v27 = a7;
      SimulateCrash();

      a7 = v27;
      LOBYTE(v14) = v44;
    }
    if ([*(id *)(a1 + 72) count] && objc_msgSend(*(id *)(a1 + 72), "count") > a6)
    {
      double v17 = [*(id *)(a1 + 72) objectAtIndexedSubscript:a6];
      if (v17 == (void *)*MEMORY[0x1E4F1D260])
      {
        uint64_t v29 = a7;
        uint64_t v30 = objc_opt_new();

        [*(id *)(a1 + 72) setObject:v30 atIndexedSubscript:a6];
        double v17 = (void *)v30;
        a7 = v29;
      }
      uint64_t v31 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a7];
      [v17 addObject:v31];

      *(float *)(*(void *)(*(void *)(a1 + 112) + 8) + 24) = *(float *)(*(void *)(*(void *)(a1 + 112) + 8)
                                                                             + 24)
                                                                  + 1.0;
      uint64_t v32 = *(void *)(*(void *)(*(void *)(a1 + 120) + 8) + 24);
      ++*(_WORD *)(v32 + 2 * a6);
      if (*(void *)(a1 + 128) == 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_24;
      }
      uint64_t v26 = (void *)(*(void *)(a1 + 144) + 168);
      goto LABEL_23;
    }
  }
}

- (void)populateFeaturesWithEvaluator:(uint64_t)a3 withContext:(uint64_t)a4 keyboardLanguage:(uint64_t)a5 isCJK:(uint64_t)a6 currentTime:(uint64_t)a7 forParsecResult:(uint64_t)a8
{
  uint64_t v8 = MEMORY[0x1F4188790](a1, a2, a3, a4, a5, a6, a7, a8);
  int v10 = v9;
  double v12 = v11;
  char v45 = v13;
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  unint64_t v18 = (void *)v8;
  *(void *)&v52[12940] = *MEMORY[0x1E4F143B8];
  id v47 = v19;
  id v46 = v15;
  id v20 = v10;
  if (v18)
  {
    id v21 = v18;
    objc_sync_enter(v21);
    if (*((unsigned char *)v21 + 79))
    {
      objc_sync_exit(v21);
    }
    else
    {
      *((unsigned char *)v21 + 79) = 1;
      objc_sync_exit(v21);

      *(_DWORD *)(v17 + 156) = 0;
      *(_OWORD *)(v17 + 140) = xmmword_1BDC5DC50;
      int64x2_t v22 = (int64x2_t)xmmword_1BDC5D800;
      int64x2_t v23 = (int64x2_t)xmmword_1BDC5D810;
      uint64_t v24 = 28;
      int64x2_t v25 = vdupq_n_s64(0xFFFFFFFFFFFFFFEELL);
      uint64x2_t v26 = (uint64x2_t)vdupq_n_s64(0xAuLL);
      v27.i64[0] = 0x4F0000004F000000;
      v27.i64[1] = 0x4F0000004F000000;
      int64x2_t v28 = vdupq_n_s64(4uLL);
      do
      {
        *(int8x16_t *)(v17 + v24) = vandq_s8(v27, (int8x16_t)vuzp1q_s32((int32x4_t)vcgtq_u64(v26, (uint64x2_t)vaddq_s64(v23, v25)), (int32x4_t)vcgtq_u64(v26, (uint64x2_t)vaddq_s64(v22, v25))));
        int64x2_t v22 = vaddq_s64(v22, v28);
        int64x2_t v23 = vaddq_s64(v23, v28);
        v24 += 16;
      }
      while (v24 != 140);
      *(void *)(v17 + 160) = 0;
      *(void *)(v17 + 168) = 0;
      bzero(v52, 0x328CuLL);
      bzero(v51, 0x1946uLL);
      uint64_t v48 = v51;
      __int16 v49 = v52;
      long long v50 = xmmword_1BDC5DC60;
      if (requiredParsecTextFeatureAttributes_onceToken != -1) {
        dispatch_once(&requiredParsecTextFeatureAttributes_onceToken, &__block_literal_global_1182);
      }
      id v29 = (id)requiredParsecTextFeatureAttributes_attrs;
      unint64_t v30 = [v29 count];
      if (v30)
      {
        unint64_t v31 = v30;
        uint64_t v32 = 0;
        uint64_t v33 = 1;
        unint64_t v34 = 0xFA / v30;
        do
        {
          uint64_t v35 = [v29 objectAtIndexedSubscript:v32];
          uint64_t v36 = getResultPropertyValue(v20, sParsecTextTypesList[v32]);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && [v36 length])
          {
            prs_feature_population_ctx_reset_for_property(v17, v35, 1);
            LOWORD(v44) = 0;
            LOBYTE(v43) = v45;
            LOBYTE(v42) = 0;
            objc_msgSend(v21, "populateTextFeatureValuesForProperty:updatingBundleFeatureValues:propertyIndex:withEvaluator:withContext:featureScoreInfo:propertyCanFuzzyMatch:keyboardLanguage:isCJK:featureList:propertyName:seenAuthorEmail:seenPrimaryRecipientEmail:", v36, 0, v33++, v47, v17, &v48, v42, v46, v43, sParsecFeatureList, v35, v44);
          }
          else
          {
            *(_WORD *)&v48[2 * v50] = sParsecFeatureList[*(_DWORD *)(v17 + 156) + 2];
            uint64_t v37 = v50;
            *(void *)&long long v50 = v50 + 1;
            *(_DWORD *)&v49[4 * v37] = 0;
            *(_DWORD *)(v17 + 156) += v34;
          }

          ++v32;
        }
        while (v31 != v32);
      }
      [v21 populateParsecBundleSpecificFeatures:&v48 currentTime:v20 forParsecResult:v12];
      [v21 populateParsecRoundTripFeatures:v21[32] forParsecResult:v20];
      uint64_t v38 = [v47 queryTerms];
      unint64_t v39 = [v38 count];
      *(_WORD *)&v48[2 * v50] = 2296;
      uint64_t v40 = v50;
      *(void *)&long long v50 = v50 + 1;
      *(float *)&v49[4 * v40] = (float)v39;

      [v21[32] setScores:v49 forFeatures:v48 count:(void)v50];
      id v41 = v21[52];
      v21[52] = 0;

      [v21 populateParsecRemainingFeatures];
    }
  }
}

+ (unsigned)featureFromVirtualIdx:(unint64_t)a3
{
  if (a3 >= 0x1C) {
    +[PRSRankingItem featureFromVirtualIdx:]();
  }
  return word_1BDC5F114[a3];
}

- (id)dueDate
{
  return SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x1DuLL);
}

- (NSDate)interestingDate
{
  interestingDate = self->_interestingDate;
  if (interestingDate)
  {
    uint64_t v3 = interestingDate;
    goto LABEL_20;
  }
  id v5 = SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 9uLL);
  uint64_t v6 = SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x52uLL);
  if (v5)
  {
    uint64_t v7 = [(PRSRankingItem *)self moreRecentDateFromDate1:v5 date2:v6];

    uint64_t v6 = (void *)v7;
  }
  p_interestingDate = &self->_interestingDate;
  if (v6 && (self->_bundleIDType & 0x100008) == 0)
  {
    uint64_t v14 = SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x20uLL);
    uint64_t v15 = SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x19uLL);
    uint64_t v16 = [(PRSRankingItem *)self moreRecentDateFromDate1:v14 date2:v15];
    if (v16)
    {
      uint64_t v17 = [(PRSRankingItem *)self moreRecentDateFromDate1:v16 date2:v6];

      uint64_t v6 = (void *)v17;
    }
    objc_storeStrong((id *)p_interestingDate, v6);
    char v13 = v6;

    uint64_t v3 = v13;
    goto LABEL_19;
  }
  unint64_t v9 = SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x11uLL);

  if (v9 || (unint64_t v10 = self->_bundleIDType, (v10 & 0x20) != 0))
  {
    double v12 = v9;
  }
  else
  {
    if ((v10 & 0x20000000000000) != 0)
    {
      uint64_t v3 = 0;
      char v13 = *p_interestingDate;
      *p_interestingDate = 0;
      goto LABEL_19;
    }
    double v11 = SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x1CuLL);
    if (!v11)
    {
      double v11 = SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x1DuLL);
      if (!v11)
      {
        if (([(PRSRankingItem *)self bundleIDType] & 0x100) == 0
          || (SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x15DuLL),
              (double v11 = objc_claimAutoreleasedReturnValue()) == 0))
        {
          id v19 = SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x20uLL);
          unint64_t bundleIDType = self->_bundleIDType;
          if ((bundleIDType & 0x200842) != 0)
          {
            id v21 = SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x19uLL);
            int64x2_t v22 = v21;
            if (v21)
            {
              id v23 = v21;

              id v19 = v23;
            }

            unint64_t bundleIDType = self->_bundleIDType;
          }
          if (v19)
          {
            if ((bundleIDType & 0x100000) == 0) {
              goto LABEL_31;
            }
LABEL_39:
            uint64x2_t v26 = SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x17AuLL);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              int8x16_t v27 = v26;
            }
            else
            {
              int8x16_t v27 = SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x17BuLL);

              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                goto LABEL_44;
              }
            }
            id v28 = v27;
            int8x16_t v27 = v28;
            if (v28)
            {
              uint64_t v29 = [v28 lastObject];

              id v19 = (void *)v29;
            }
LABEL_44:

            if (!v19) {
              goto LABEL_45;
            }
            goto LABEL_48;
          }
          if ((bundleIDType & 0x200000000) != 0)
          {
            uint64_t v24 = SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x177uLL);
            id v19 = v24;
            if (v24) {
              id v25 = v24;
            }

            if ((self->_bundleIDType & 0x100000) != 0) {
              goto LABEL_39;
            }
          }
          else
          {
            id v19 = 0;
            if ((bundleIDType & 0x100000) != 0) {
              goto LABEL_39;
            }
          }
LABEL_31:
          if (!v19)
          {
LABEL_45:
            if ((self->_bundleIDType & 0x80) != 0)
            {
              id v19 = SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x21uLL);
            }
            else
            {
              id v19 = 0;
            }
          }
LABEL_48:
          double v12 = v19;
          goto LABEL_14;
        }
      }
    }
    double v12 = v11;
  }
LABEL_14:
  uint64_t v3 = v12;
  char v13 = *p_interestingDate;
  *p_interestingDate = v12;
LABEL_19:

LABEL_20:
  return v3;
}

- (NSDate)lastAccessDate
{
  uint64_t v3 = SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 9uLL);
  id v4 = SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x52uLL);
  if (v3)
  {
    uint64_t v5 = [(PRSRankingItem *)self moreRecentDateFromDate1:v3 date2:v4];

    id v4 = (void *)v5;
  }
  if (!v4 || (self->_bundleIDType & 0x100008) != 0)
  {
    if (([(PRSRankingItem *)self bundleIDType] & 0x100) != 0)
    {
      uint64_t v6 = SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x15DuLL);

      if (v6) {
        goto LABEL_25;
      }
      id v4 = 0;
    }
    uint64_t v6 = SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x20uLL);

    unint64_t bundleIDType = self->_bundleIDType;
    if ((bundleIDType & 0x842) != 0)
    {
      uint64_t v8 = SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x19uLL);
      unint64_t v9 = v8;
      if (v8)
      {
        id v10 = v8;

        uint64_t v6 = v10;
      }

      unint64_t bundleIDType = self->_bundleIDType;
    }
    if (!v6)
    {
      if ((bundleIDType & 0x200000000) != 0)
      {
        id v21 = SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x177uLL);
        uint64_t v6 = v21;
        if (v21) {
          id v22 = v21;
        }

        if ((self->_bundleIDType & 0x100000) == 0) {
          goto LABEL_25;
        }
LABEL_16:
        double v11 = SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x17AuLL);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          double v12 = v11;
        }
        else
        {
          double v12 = SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x17BuLL);

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
LABEL_24:

            goto LABEL_25;
          }
        }
        id v18 = v12;
        double v12 = v18;
        if (v18)
        {
          uint64_t v19 = [v18 lastObject];

          uint64_t v6 = (void *)v19;
        }
        goto LABEL_24;
      }
      uint64_t v6 = 0;
    }
    if ((bundleIDType & 0x100000) != 0) {
      goto LABEL_16;
    }
LABEL_25:
    id v17 = v6;
    goto LABEL_26;
  }
  char v13 = SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x20uLL);
  uint64_t v14 = SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x19uLL);
  uint64_t v15 = [(PRSRankingItem *)self moreRecentDateFromDate1:v13 date2:v14];
  if (v15)
  {
    uint64_t v16 = [(PRSRankingItem *)self moreRecentDateFromDate1:v15 date2:v4];

    id v4 = (void *)v16;
  }
  id v17 = v4;

LABEL_26:
  return (NSDate *)v17;
}

- (id)moreRecentDateFromDate1:(id)a3 date2:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_opt_class();
  char v8 = objc_opt_isKindOfClass();
  char v9 = v8;
  if (isKindOfClass)
  {
    id v10 = v5;
    if (v9)
    {
      if ([v5 compare:v6] == 1) {
        id v10 = v5;
      }
      else {
        id v10 = v6;
      }
    }
  }
  else if (v8)
  {
    id v10 = v6;
  }
  else
  {
    id v10 = 0;
  }
  id v11 = v10;

  return v11;
}

- (uint64_t)compareWithDatesPlus:(int)a3 currentTime:(uint64_t)a4 hasCategory:(uint64_t)a5 topBit:(char)a6 upperBit:(double)a7 lowerBit:
{
  char v13 = a2;
  uint64_t v14 = v13;
  if (!a1) {
    goto LABEL_93;
  }
  if (a3)
  {
    uint64_t v15 = *(void *)(a1 + 616) & 0x800000000000000;
    uint64_t v16 = 0;
    float v17 = (float)*(unsigned long long *)(&v15 - 1);
    if (v14)
    {
      uint64_t v18 = v14[77] & 0x800000000000000;
      uint64_t v19 = 0;
      float v20 = (float)*(unsigned long long *)(&v18 - 1);
    }
    else
    {
      float v20 = 0.0;
    }
    if (v20 >= v17)
    {
      if (v20 <= v17) {
        goto LABEL_80;
      }
LABEL_75:
      a1 = -1;
      goto LABEL_93;
    }
LABEL_73:
    a1 = 1;
    goto LABEL_93;
  }
  if ((*(unsigned char *)(a1 + 442) & 0x10) == 0 && ([v13 bundleIDType] & 0x100000) == 0)
  {
    a1 = -[PRSRankingItem compareWithDates:currentTime:](a1, v14, a7);
    goto LABEL_93;
  }
  uint64_t v21 = -1 << a4;
  unint64_t v22 = (-1 << a4) | (0x7FFFFFFFFFFFFFFFuLL >> ~(_BYTE)a4);
  if ((a4 & 0x40) != 0)
  {
    unint64_t v22 = -1 << a4;
    uint64_t v21 = 0;
  }
  if (a4 >= 0) {
    uint64_t v23 = ~v22;
  }
  else {
    uint64_t v23 = -1;
  }
  if (a4 >= 0) {
    uint64_t v24 = ~v21;
  }
  else {
    uint64_t v24 = -1;
  }
  uint64_t v25 = *(void *)(a1 + 616);
  uint64_t v26 = *(void *)(a1 + 608);
  if (a5 < 0)
  {
    unint64_t v60 = (-1 << a6) | (0x7FFFFFFFFFFFFFFFuLL >> ~a6);
    if ((a6 & 0x40) != 0)
    {
      unint64_t v60 = -1 << a6;
      uint64_t v61 = 0;
    }
    else
    {
      uint64_t v61 = -1 << a6;
    }
    unint64_t v62 = v60 & v23;
    uint64_t v63 = v61 & v24;
    unint64_t v64 = v25 & v62;
    uint64_t v65 = v26 & v61 & v24;
    if (v14)
    {
      uint64_t v66 = v14[77];
      uint64_t v67 = v14[76];
    }
    else
    {
      uint64_t v67 = 0;
      uint64_t v66 = 0;
    }
    unint64_t v68 = v66 & v62;
    uint64_t v69 = v67 & v63;
    if (__PAIR128__(v68, v69) < __PAIR128__(v64, v65)) {
      goto LABEL_73;
    }
    if (__PAIR128__(v64, v65) < __PAIR128__(v68, v69)) {
      goto LABEL_75;
    }
  }
  else
  {
    unint64_t v27 = (-1 << a5) | (0x7FFFFFFFFFFFFFFFuLL >> ~(_BYTE)a5);
    if ((a5 & 0x40) != 0)
    {
      unint64_t v27 = -1 << a5;
      uint64_t v28 = 0;
    }
    else
    {
      uint64_t v28 = -1 << a5;
    }
    unint64_t v29 = v27 & v23;
    uint64_t v30 = v28 & v24;
    unint64_t v31 = v25 & v29;
    uint64_t v32 = v26 & v28 & v24;
    if (v14)
    {
      uint64_t v33 = v14[77];
      uint64_t v34 = v14[76];
    }
    else
    {
      uint64_t v34 = 0;
      uint64_t v33 = 0;
    }
    unint64_t v35 = v33 & v29;
    uint64_t v36 = v34 & v30;
    if (__PAIR128__(v35, v36) < __PAIR128__(v31, v32)) {
      goto LABEL_73;
    }
    if (__PAIR128__(v31, v32) < __PAIR128__(v35, v36)) {
      goto LABEL_75;
    }
    uint64_t v37 = PRSRankingQueryIndexDictionary();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __88__PRSRankingItem_compareWithDatesPlus_currentTime_hasCategory_topBit_upperBit_lowerBit___block_invoke;
    block[3] = &unk_1E634C270;
    id v38 = v37;
    id v81 = v38;
    if (compareWithDatesPlus_currentTime_hasCategory_topBit_upperBit_lowerBit__onceToken != -1) {
      dispatch_once(&compareWithDatesPlus_currentTime_hasCategory_topBit_upperBit_lowerBit__onceToken, block);
    }
    unint64_t v39 = *(void *)(a1 + 608);
    unint64_t v40 = *(void *)(a1 + 616);
    if ((compareWithDatesPlus_currentTime_hasCategory_topBit_upperBit_lowerBit__bit2 & 0x40) != 0) {
      uint64_t v41 = 0;
    }
    else {
      uint64_t v41 = 1 << compareWithDatesPlus_currentTime_hasCategory_topBit_upperBit_lowerBit__bit2;
    }
    if ((compareWithDatesPlus_currentTime_hasCategory_topBit_upperBit_lowerBit__bit2 & 0x40) != 0) {
      uint64_t v42 = 1 << compareWithDatesPlus_currentTime_hasCategory_topBit_upperBit_lowerBit__bit2;
    }
    else {
      uint64_t v42 = 0;
    }
    if ((compareWithDatesPlus_currentTime_hasCategory_topBit_upperBit_lowerBit__bit3 & 0x40) != 0) {
      uint64_t v43 = 0;
    }
    else {
      uint64_t v43 = 1 << compareWithDatesPlus_currentTime_hasCategory_topBit_upperBit_lowerBit__bit3;
    }
    if ((compareWithDatesPlus_currentTime_hasCategory_topBit_upperBit_lowerBit__bit3 & 0x40) != 0) {
      uint64_t v44 = 1 << compareWithDatesPlus_currentTime_hasCategory_topBit_upperBit_lowerBit__bit3;
    }
    else {
      uint64_t v44 = 0;
    }
    uint64_t v45 = 1 << compareWithDatesPlus_currentTime_hasCategory_topBit_upperBit_lowerBit__bit4;
    if ((compareWithDatesPlus_currentTime_hasCategory_topBit_upperBit_lowerBit__bit4 & 0x40) != 0) {
      uint64_t v46 = 0;
    }
    else {
      uint64_t v46 = 1 << compareWithDatesPlus_currentTime_hasCategory_topBit_upperBit_lowerBit__bit4;
    }
    if ((compareWithDatesPlus_currentTime_hasCategory_topBit_upperBit_lowerBit__bit4 & 0x40) == 0) {
      uint64_t v45 = 0;
    }
    if ((compareWithDatesPlus_currentTime_hasCategory_topBit_upperBit_lowerBit__bit5 & 0x40) != 0) {
      uint64_t v47 = 0;
    }
    else {
      uint64_t v47 = 1 << compareWithDatesPlus_currentTime_hasCategory_topBit_upperBit_lowerBit__bit5;
    }
    if ((compareWithDatesPlus_currentTime_hasCategory_topBit_upperBit_lowerBit__bit5 & 0x40) != 0) {
      uint64_t v48 = 1 << compareWithDatesPlus_currentTime_hasCategory_topBit_upperBit_lowerBit__bit5;
    }
    else {
      uint64_t v48 = 0;
    }
    if ((compareWithDatesPlus_currentTime_hasCategory_topBit_upperBit_lowerBit__bit1 & 0x40) != 0) {
      unint64_t v49 = v40 >> compareWithDatesPlus_currentTime_hasCategory_topBit_upperBit_lowerBit__bit1;
    }
    else {
      unint64_t v49 = ((2 * v40) << ~(_BYTE)compareWithDatesPlus_currentTime_hasCategory_topBit_upperBit_lowerBit__bit1) | (v39 >> compareWithDatesPlus_currentTime_hasCategory_topBit_upperBit_lowerBit__bit1);
    }
    if ((v49 & 1) == 0
      && !(v41 & v39 | v42 & v40)
      && !(v43 & v39 | v44 & v40)
      && !(v46 & v39 | v45 & v40)
      && !(v47 & v39 | v48 & v40))
    {
      unint64_t v50 = (-1 << a6) | (0x7FFFFFFFFFFFFFFFuLL >> ~a6);
      if ((a6 & 0x40) != 0)
      {
        unint64_t v50 = -1 << a6;
        uint64_t v51 = 0;
      }
      else
      {
        uint64_t v51 = -1 << a6;
      }
      unint64_t v52 = v50 & v23;
      uint64_t v53 = v51 & v24;
      unint64_t v54 = v40 & v52;
      uint64_t v55 = v39 & v51 & v24;
      if (v14)
      {
        uint64_t v56 = v14[77];
        uint64_t v57 = v14[76];
      }
      else
      {
        uint64_t v57 = 0;
        uint64_t v56 = 0;
      }
      unint64_t v58 = v56 & v52;
      uint64_t v59 = v57 & v53;
      if (__PAIR128__(v58, v59) < __PAIR128__(v54, v55))
      {
        a1 = 1;
LABEL_78:

        goto LABEL_93;
      }
      if (__PAIR128__(v54, v55) < __PAIR128__(v58, v59))
      {
        a1 = -1;
        goto LABEL_78;
      }
    }
  }
LABEL_80:
  int v70 = [(id)a1 interestingDate];
  float v71 = [v14 interestingDate];
  [v70 timeIntervalSinceReferenceDate];
  double v73 = v72 - a7;
  [v71 timeIntervalSinceReferenceDate];
  double v75 = v74 - a7;
  if (v73 <= v75)
  {
    if (v73 >= v75)
    {
      if (v14)
      {
        unint64_t v76 = v14[77];
        unint64_t v77 = v14[76];
      }
      else
      {
        unint64_t v77 = 0;
        unint64_t v76 = 0;
      }
      if (*(_OWORD *)(a1 + 608) >= __PAIR128__(v76, v77)) {
        uint64_t v78 = 0;
      }
      else {
        uint64_t v78 = -1;
      }
      if (__PAIR128__(v76, v77) < *(_OWORD *)(a1 + 608)) {
        a1 = 1;
      }
      else {
        a1 = v78;
      }
    }
    else
    {
      a1 = -1;
    }
  }
  else
  {
    a1 = 1;
  }

LABEL_93:
  return a1;
}

- (uint64_t)compareWithDates:(double)a3 currentTime:
{
  id v5 = a2;
  id v6 = v5;
  if (!a1)
  {
    uint64_t v12 = 0;
    goto LABEL_207;
  }
  uint64_t v7 = (int8x8_t *)[v5 attributes];
  if ([*(id *)(a1 + 256) isSiriAction])
  {
    unsigned int v8 = 2;
  }
  else if (*(unsigned char *)(a1 + 80))
  {
    unsigned int v8 = 4;
  }
  else
  {
    unsigned int v8 = 8;
  }
  char v9 = [v6 L2FeatureVector];
  char v10 = [v9 isSiriAction];

  if (v10)
  {
    unsigned int v11 = 2;
  }
  else
  {
    unsigned int v11 = 8;
    if (v6)
    {
      if (*((unsigned char *)v6 + 80)) {
        unsigned int v11 = 4;
      }
      else {
        unsigned int v11 = 8;
      }
    }
  }
  if (v8 > v11)
  {
    uint64_t v12 = 1;
    goto LABEL_207;
  }
  if (v8 < v11)
  {
    uint64_t v12 = -1;
    goto LABEL_207;
  }
  if ((*(unsigned char *)(a1 + 440) & 0x10) != 0 && ([v6 bundleIDType] & 0x10) != 0)
  {
    uint64_t v12 = (*((uint64_t (**)(uint64_t, void *, void *))comparePreferences + 2))((uint64_t)comparePreferences, (void *)a1, v6);
    if (v12) {
      goto LABEL_207;
    }
  }
  if ((*(unsigned char *)(a1 + 440) & 0x80) != 0 && ([v6 bundleIDType] & 0x80) != 0)
  {
    uint64_t v12 = (*((uint64_t (**)(uint64_t, void *, void *))compareSafariResults + 2))((uint64_t)compareSafariResults, (void *)a1, v6);
    if (v12) {
      goto LABEL_207;
    }
  }
  if ((*(unsigned char *)(a1 + 440) & 8) != 0
    || ([v6 bundleIDType] & 8) != 0
    || (*(unsigned char *)(a1 + 442) & 0x10) != 0
    || ([v6 bundleIDType] & 0x100000) != 0)
  {
    goto LABEL_34;
  }
  uint64_t v13 = *(void *)(a1 + 440);
  if ((v13 & 0x800) != 0)
  {
    if (([v6 bundleIDType] & 0x800) != 0) {
      goto LABEL_34;
    }
    uint64_t v13 = *(void *)(a1 + 440);
  }
  if ((v13 & 0x800000) != 0)
  {
    if (([v6 bundleIDType] & 0x800000) != 0) {
      goto LABEL_34;
    }
    uint64_t v13 = *(void *)(a1 + 440);
  }
  if ((v13 & 0x1000006) == 0)
  {
    if ((v13 & 0x40000) != 0)
    {
      if (([v6 bundleIDType] & 0x40000) != 0) {
        goto LABEL_34;
      }
      uint64_t v13 = *(void *)(a1 + 440);
      if ((v13 & 0x40000) != 0)
      {
        if (([v6 bundleIDType] & 0x2000000) != 0) {
          goto LABEL_34;
        }
        uint64_t v13 = *(void *)(a1 + 440);
      }
    }
    if ((v13 & 0x2000000) == 0
      || ([v6 bundleIDType] & 0x40000) == 0
      && ((*(unsigned char *)(a1 + 443) & 2) == 0 || ([v6 bundleIDType] & 0x2000000) == 0))
    {
      uint64_t v27 = SSCompactRankingAttrsGetValue(*(int8x8_t **)(a1 + 304), 0x15DuLL);
      uint64_t v28 = SSCompactRankingAttrsGetValue(v7, 0x15DuLL);
      uint64_t v29 = SSCompactRankingAttrsGetValue(*(int8x8_t **)(a1 + 304), 0x15EuLL);
      uint64_t v30 = SSCompactRankingAttrsGetValue(*(int8x8_t **)(a1 + 304), 9uLL);
      id v420 = (void *)v29;
      unint64_t v31 = [(id)a1 moreRecentDateFromDate1:v29 date2:v30];
      __int16 v423 = (void *)v27;
      uint64_t v32 = [(id)a1 moreRecentDateFromDate1:v31 date2:v27];

      uint64_t v33 = SSCompactRankingAttrsGetValue(v7, 0x15EuLL);
      uint64_t v34 = SSCompactRankingAttrsGetValue(v7, 9uLL);
      unint64_t v35 = [(id)a1 moreRecentDateFromDate1:v33 date2:v34];
      uint64_t v421 = (void *)v28;
      uint64_t v36 = [(id)a1 moreRecentDateFromDate1:v35 date2:v28];

      if (v32 && v36)
      {
        uint64_t v14 = [v32 compare:v36];
        BOOL v37 = 0;
      }
      else if (v32)
      {
        BOOL v37 = 0;
        uint64_t v14 = 1;
      }
      else
      {
        BOOL v37 = v36 == 0;
        if (v36) {
          uint64_t v14 = -1;
        }
        else {
          uint64_t v14 = 0;
        }
      }

      uint64_t v12 = v14;
      if (!v37) {
        goto LABEL_207;
      }
      goto LABEL_35;
    }
  }
LABEL_34:
  uint64_t v14 = 0;
LABEL_35:
  if ((*(unsigned char *)(a1 + 441) & 1) == 0
    || ([v6 bundleIDType] & 0x100) == 0
    || (uint64_t v12 = (*((uint64_t (**)(uint64_t, void *, void *))compareApplications + 2))((uint64_t)compareApplications, (void *)a1, v6)) == 0)
  {
    uint64_t v15 = SSCompactRankingAttrsGetValue(*(int8x8_t **)(a1 + 304), 0x1CuLL);
    uint64_t v16 = SSCompactRankingAttrsGetValue(v7, 0x1CuLL);
    float v17 = (void *)v16;
    if (v15)
    {
      if (v16)
      {
        uint64_t v12 = [v15 compare:v16];
        if (v12) {
          goto LABEL_206;
        }
      }
    }
    uint64_t v18 = [(id)a1 interestingDate];
    uint64_t v19 = [v6 interestingDate];
    float v20 = (void *)v19;
    if (v18 && v19)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if ((*(unsigned char *)(a1 + 440) & 0x20) != 0 && ([v6 bundleIDType] & 0x20) != 0)
          {
            uint64_t v21 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:a3];
            id v22 = objc_alloc(MEMORY[0x1E4F1C9A8]);
            uint64_t v23 = (void *)[v22 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
            if ([v23 isDate:v18 inSameDayAsDate:v21]
              && ![v23 isDate:v20 inSameDayAsDate:v21])
            {
LABEL_54:
              uint64_t v12 = 1;
LABEL_135:

              goto LABEL_205;
            }
            if ([v23 isDate:v20 inSameDayAsDate:v21]
              && ![v23 isDate:v18 inSameDayAsDate:v21])
            {
              uint64_t v12 = -1;
              goto LABEL_135;
            }
            if ([v23 isDate:v18 inSameDayAsDate:v21]
              && [v23 isDate:v20 inSameDayAsDate:v21])
            {
              [v18 timeIntervalSinceReferenceDate];
              double v25 = v24;
              [v20 timeIntervalSinceReferenceDate];
              if (v25 >= v26)
              {
                [v18 timeIntervalSinceReferenceDate];
                double v67 = v66;
                [v20 timeIntervalSinceReferenceDate];
                if (v67 <= v68) {
                  uint64_t v12 = 0;
                }
                else {
                  uint64_t v12 = -1;
                }
                goto LABEL_135;
              }
              goto LABEL_54;
            }
          }
          uint64_t v38 = *(void *)(a1 + 440);
          if ((v38 & 0x40000) != 0)
          {
            if (([v6 bundleIDType] & 0x40000) != 0) {
              goto LABEL_92;
            }
            uint64_t v38 = *(void *)(a1 + 440);
            if ((v38 & 0x40000) != 0)
            {
              if (([v6 bundleIDType] & 0x2000000) != 0) {
                goto LABEL_92;
              }
              uint64_t v38 = *(void *)(a1 + 440);
            }
          }
          if ((v38 & 0x2000000) == 0
            || ([v6 bundleIDType] & 0x40000) == 0
            && ((*(unsigned char *)(a1 + 443) & 2) == 0 || ([v6 bundleIDType] & 0x2000000) == 0))
          {
LABEL_69:
            if ((*(unsigned char *)(a1 + 442) & 0x80) != 0 && ([v6 bundleIDType] & 0x800000) != 0)
            {
              unint64_t v39 = SSCompactRankingAttrsGetValue(*(int8x8_t **)(a1 + 304), 0x99uLL);
              unint64_t v40 = SSCompactRankingAttrsGetValue((int8x8_t *)[v6 attributes], 0x99uLL);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  int v41 = [v39 unsignedIntValue];
                  int v42 = [v40 unsignedIntValue];
                  if (v41 == 1 && v42 != 1) {
                    goto LABEL_84;
                  }
                  if (v42 == 1 && v41 != 1) {
                    goto LABEL_143;
                  }
                }
              }
            }
            if ((*(unsigned char *)(a1 + 443) & 1) != 0 && ([v6 bundleIDType] & 0x1000000) != 0)
            {
              unint64_t v39 = SSCompactRankingAttrsGetValue(*(int8x8_t **)(a1 + 304), 0x99uLL);
              unint64_t v40 = SSCompactRankingAttrsGetValue((int8x8_t *)[v6 attributes], 0x99uLL);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  int v43 = [v39 unsignedIntValue];
                  int v44 = [v40 unsignedIntValue];
                  if (v43 == 1 && v44 != 1)
                  {
LABEL_84:
                    uint64_t v12 = 1;
LABEL_144:

LABEL_179:
                    goto LABEL_205;
                  }
                  if (v44 == 1 && v43 != 1)
                  {
LABEL_143:
                    uint64_t v12 = -1;
                    goto LABEL_144;
                  }
                }
              }
            }
            if ((*(unsigned char *)(a1 + 442) & 0x20) != 0 && ([v6 bundleIDType] & 0x200000) != 0)
            {
              uint64_t v12 = (*((uint64_t (**)(uint64_t, void *, void *))compareShortcutsNames + 2))((uint64_t)compareShortcutsNames, (void *)a1, v6);
              if (v12) {
                goto LABEL_205;
              }
            }
            [v18 timeIntervalSinceReferenceDate];
            double v70 = v69 - a3;
            [v20 timeIntervalSinceReferenceDate];
            double v72 = v71 - a3;
            if ((v70 < 0.0 || v72 < 0.0) && (v70 > 0.0 || v72 > 0.0)) {
              goto LABEL_208;
            }
            uint64_t v73 = *(void *)(a1 + 440);
            if ((v73 & 0x40000) != 0)
            {
              if (([v6 bundleIDType] & 0x40000) != 0) {
                goto LABEL_163;
              }
              uint64_t v73 = *(void *)(a1 + 440);
              if ((v73 & 0x40000) != 0)
              {
                if (([v6 bundleIDType] & 0x2000000) != 0) {
                  goto LABEL_163;
                }
                uint64_t v73 = *(void *)(a1 + 440);
              }
            }
            if ((v73 & 0x2000000) == 0
              || ([v6 bundleIDType] & 0x40000) == 0
              && ((*(unsigned char *)(a1 + 443) & 2) == 0 || ([v6 bundleIDType] & 0x2000000) == 0))
            {
LABEL_194:
              double v70 = fabs(v70);
              double v72 = fabs(v72);
              if (v70 >= v72)
              {
                if (v70 <= v72)
                {
                  if (v70 == v72) {
                    goto LABEL_197;
                  }
LABEL_208:
                  if (v72 >= 0.0 || v70 <= 0.0) {
                    uint64_t v12 = -1;
                  }
                  else {
                    uint64_t v12 = 1;
                  }
                  goto LABEL_205;
                }
                goto LABEL_60;
              }
LABEL_57:
              uint64_t v12 = 1;
LABEL_205:

LABEL_206:
              goto LABEL_207;
            }
LABEL_163:
            id v74 = objc_alloc(MEMORY[0x1E4F1C9A8]);
            unint64_t v39 = (void *)[v74 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
            if (![v39 isDate:v18 inSameDayAsDate:v20]) {
              goto LABEL_193;
            }
            if (v6 && (uint64_t v75 = *(void *)(a1 + 568)) != 0 && (v76 = *((void *)v6 + 71)) != 0)
            {
              float v77 = *(float *)(v75 + 128);
              float v78 = *(float *)(v76 + 128);
            }
            else
            {
              uint64_t v79 = [(id)a1 L2FeatureVector];
              [v79 scoreForFeature:2388];
              float v77 = v80;

              id v81 = [v6 L2FeatureVector];
              [v81 scoreForFeature:2388];
              float v78 = v82;
            }
            if (v77 > 0.0 && v78 > 0.0)
            {
              if (v77 > v78) {
                goto LABEL_175;
              }
              if (v77 < v78) {
                goto LABEL_178;
              }
            }
            if (v77 > 0.0 && v78 <= 0.0) {
              goto LABEL_175;
            }
            if (v77 <= 0.0 && v78 > 0.0)
            {
LABEL_178:
              uint64_t v12 = -1;
              goto LABEL_179;
            }
            if (v6 && (uint64_t v83 = *(void *)(a1 + 568)) != 0 && (v84 = *((void *)v6 + 71)) != 0)
            {
              float v85 = *(float *)(v83 + 132);
              float v86 = *(float *)(v84 + 132);
            }
            else
            {
              unint64_t v87 = [(id)a1 L2FeatureVector];
              [v87 scoreForFeature:2389];
              float v85 = v88;

              float v89 = [v6 L2FeatureVector];
              [v89 scoreForFeature:2389];
              float v86 = v90;
            }
            if (v85 > 0.0 && v86 > 0.0)
            {
              if (v85 > v86) {
                goto LABEL_175;
              }
              if (v85 < v86) {
                goto LABEL_178;
              }
            }
            if (v85 <= 0.0 || v86 > 0.0)
            {
              if (v85 <= 0.0 && v86 > 0.0) {
                goto LABEL_178;
              }
LABEL_193:

              goto LABEL_194;
            }
LABEL_175:
            uint64_t v12 = 1;
            goto LABEL_179;
          }
LABEL_92:
          uint64_t v45 = *(void *)(a1 + 616) & 0x800000000000000;
          uint64_t v46 = 0;
          float v47 = (float)*(unsigned long long *)(&v45 - 1);
          if (v6) {
            uint64_t v48 = *((void *)v6 + 77);
          }
          else {
            uint64_t v48 = 0;
          }
          uint64_t v49 = v48 & 0x800000000000000;
          uint64_t v50 = 0;
          if (v47 > (float)*(unsigned long long *)&v50) {
            goto LABEL_57;
          }
          if (v47 < (float)*(unsigned long long *)&v50) {
            goto LABEL_60;
          }
          if (*(void *)(a1 + 544))
          {
            if (!v6) {
              goto LABEL_57;
            }
            uint64_t v51 = *((void *)v6 + 68);
          }
          else
          {
            if (!v6)
            {
              if (*(void *)(a1 + 552)) {
                goto LABEL_57;
              }
              if (*(void *)(a1 + 560)) {
                goto LABEL_57;
              }
              float v52 = *(float *)(a1 + 144);
              float v53 = 0.0;
              if (v52 > 0.0) {
                goto LABEL_57;
              }
              goto LABEL_101;
            }
            if (*((void *)v6 + 68)) {
              goto LABEL_60;
            }
            uint64_t v51 = *((void *)v6 + 69);
            if (!*(void *)(a1 + 552))
            {
              if (v51) {
                goto LABEL_60;
              }
              uint64_t v51 = *((void *)v6 + 70);
              if (!*(void *)(a1 + 560))
              {
                if (v51) {
                  goto LABEL_60;
                }
                goto LABEL_100;
              }
            }
          }
          if (!v51) {
            goto LABEL_57;
          }
LABEL_100:
          float v52 = *(float *)(a1 + 144);
          float v53 = *((float *)v6 + 36);
          if (v52 > v53) {
            goto LABEL_57;
          }
LABEL_101:
          if (v52 >= v53)
          {
            unint64_t v54 = PRSRankingQueryIndexDictionary();
            v430[0] = MEMORY[0x1E4F143A8];
            v430[1] = 3221225472;
            v430[2] = __47__PRSRankingItem_compareWithDates_currentTime___block_invoke;
            v430[3] = &unk_1E634C270;
            id v424 = v54;
            id v431 = v424;
            uint64_t v55 = v430;
            if (compareWithDates_currentTime__onceToken1 != -1) {
              dispatch_once(&compareWithDates_currentTime__onceToken1, v55);
            }

            uint64_t v56 = *(void *)(a1 + 608);
            if ((compareWithDates_currentTime__policyFieldsExactPhraseMatchBit & 0x40) != 0) {
              uint64_t v57 = 1 << compareWithDates_currentTime__policyFieldsExactPhraseMatchBit;
            }
            else {
              uint64_t v57 = 0;
            }
            if ((compareWithDates_currentTime__policyFieldsExactPhraseMatchBit & 0x40) != 0) {
              uint64_t v58 = 0;
            }
            else {
              uint64_t v58 = 1 << compareWithDates_currentTime__policyFieldsExactPhraseMatchBit;
            }
            uint64_t v59 = v58 & v56;
            uint64_t v60 = v57 & *(void *)(a1 + 616);
            float v61 = (float)*(unsigned long long *)&v59;
            if (v6)
            {
              uint64_t v62 = *((void *)v6 + 77);
              uint64_t v63 = *((void *)v6 + 76);
            }
            else
            {
              uint64_t v63 = 0;
              uint64_t v62 = 0;
            }
            uint64_t v64 = v63 & v58;
            uint64_t v65 = v62 & v57;
            if (v61 > (float)*(unsigned long long *)&v64) {
              goto LABEL_113;
            }
            if (v61 < (float)*(unsigned long long *)&v64)
            {
LABEL_215:
              uint64_t v12 = -1;
              goto LABEL_216;
            }
            if ((compareWithDates_currentTime__policyFieldsMostlyExactPhraseMatchBit & 0x40) != 0) {
              uint64_t v94 = 1 << compareWithDates_currentTime__policyFieldsMostlyExactPhraseMatchBit;
            }
            else {
              uint64_t v94 = 0;
            }
            if ((compareWithDates_currentTime__policyFieldsMostlyExactPhraseMatchBit & 0x40) != 0) {
              uint64_t v95 = 0;
            }
            else {
              uint64_t v95 = 1 << compareWithDates_currentTime__policyFieldsMostlyExactPhraseMatchBit;
            }
            uint64_t v96 = v95 & v56;
            uint64_t v97 = v94 & *(void *)(a1 + 616);
            float v98 = (float)*(unsigned long long *)&v96;
            if (v6)
            {
              uint64_t v99 = *((void *)v6 + 77);
              uint64_t v100 = *((void *)v6 + 76);
            }
            else
            {
              uint64_t v100 = 0;
              uint64_t v99 = 0;
            }
            uint64_t v101 = v100 & v95;
            uint64_t v102 = v99 & v94;
            if (v98 > (float)*(unsigned long long *)&v101) {
              goto LABEL_113;
            }
            if (v98 < (float)*(unsigned long long *)&v101) {
              goto LABEL_215;
            }
            if (v6 && (uint64_t v103 = *(float **)(a1 + 568)) != 0 && (v104 = (float *)*((void *)v6 + 71)) != 0)
            {
              float v105 = *v103;
              float v106 = *v104;
            }
            else
            {
              unsigned __int16 v107 = [(id)a1 L2FeatureVector];
              [v107 scoreForFeature:158];
              float v105 = v108;

              unint64_t v109 = [v6 L2FeatureVector];
              [v109 scoreForFeature:158];
              float v106 = v110;
            }
            if (v105 > 0.0 && v105 > v106) {
              goto LABEL_113;
            }
            if (v106 > 0.0 && v106 > v105) {
              goto LABEL_215;
            }
            if (v6 && (uint64_t v111 = *(void *)(a1 + 568)) != 0 && (v112 = *((void *)v6 + 71)) != 0)
            {
              float v113 = *(float *)(v111 + 4);
              float v114 = *(float *)(v112 + 4);
            }
            else
            {
              float v115 = [(id)a1 L2FeatureVector];
              [v115 scoreForFeature:1373];
              float v113 = v116;

              float v117 = [v6 L2FeatureVector];
              [v117 scoreForFeature:1373];
              float v114 = v118;
            }
            if (v113 > 0.0 && v113 > v114) {
              goto LABEL_113;
            }
            if (v114 > 0.0 && v114 > v113) {
              goto LABEL_215;
            }
            if (v6 && (v119 = *(void *)(a1 + 568)) != 0 && (uint64_t v120 = *((void *)v6 + 71)) != 0)
            {
              float v121 = *(float *)(v119 + 8);
              float v122 = *(float *)(v120 + 8);
            }
            else
            {
              float v123 = [(id)a1 L2FeatureVector];
              [v123 scoreForFeature:1086];
              float v121 = v124;

              float v125 = [v6 L2FeatureVector];
              [v125 scoreForFeature:1086];
              float v122 = v126;
            }
            if (v121 > 0.0 && v121 > v122) {
              goto LABEL_113;
            }
            if (v122 > 0.0 && v122 > v121) {
              goto LABEL_215;
            }
            if (v6 && (v127 = *(void *)(a1 + 568)) != 0 && (uint64_t v128 = *((void *)v6 + 71)) != 0)
            {
              float v129 = *(float *)(v127 + 12);
              float v130 = *(float *)(v128 + 12);
            }
            else
            {
              float v131 = [(id)a1 L2FeatureVector];
              [v131 scoreForFeature:132];
              float v129 = v132;

              int v133 = [v6 L2FeatureVector];
              [v133 scoreForFeature:132];
              float v130 = v134;
            }
            if (v129 > 0.0 && v129 > v130) {
              goto LABEL_113;
            }
            if (v130 > 0.0 && v130 > v129) {
              goto LABEL_215;
            }
            if (v6 && (uint64_t v135 = *(void *)(a1 + 568)) != 0 && (v136 = *((void *)v6 + 71)) != 0)
            {
              float v137 = *(float *)(v135 + 16);
              float v138 = *(float *)(v136 + 16);
            }
            else
            {
              BOOL v139 = [(id)a1 L2FeatureVector];
              [v139 scoreForFeature:156];
              float v137 = v140;

              uint64_t v141 = [v6 L2FeatureVector];
              [v141 scoreForFeature:156];
              float v138 = v142;
            }
            if (v137 > 0.0 && v137 > v138) {
              goto LABEL_113;
            }
            if (v138 > 0.0 && v138 > v137) {
              goto LABEL_215;
            }
            if (v6 && (uint64_t v143 = *(void *)(a1 + 568)) != 0 && (v144 = *((void *)v6 + 71)) != 0)
            {
              float v145 = *(float *)(v143 + 20);
              float v146 = *(float *)(v144 + 20);
            }
            else
            {
              unsigned int v147 = [(id)a1 L2FeatureVector];
              [v147 scoreForFeature:1537];
              float v145 = v148;

              unint64_t v149 = [v6 L2FeatureVector];
              [v149 scoreForFeature:1537];
              float v146 = v150;
            }
            if (v145 > 0.0 && v145 > v146) {
              goto LABEL_113;
            }
            if (v146 > 0.0 && v146 > v145) {
              goto LABEL_215;
            }
            if (v6 && (v151 = *(void *)(a1 + 568)) != 0 && (uint64_t v152 = *((void *)v6 + 71)) != 0)
            {
              float v153 = *(float *)(v151 + 24);
              float v154 = *(float *)(v152 + 24);
            }
            else
            {
              float v155 = [(id)a1 L2FeatureVector];
              [v155 scoreForFeature:1496];
              float v153 = v156;

              float v157 = [v6 L2FeatureVector];
              [v157 scoreForFeature:1496];
              float v154 = v158;
            }
            if (v153 > 0.0 && v153 > v154) {
              goto LABEL_113;
            }
            if (v154 > 0.0 && v154 > v153) {
              goto LABEL_215;
            }
            if (v6 && (v159 = *(void *)(a1 + 568)) != 0 && (uint64_t v160 = *((void *)v6 + 71)) != 0)
            {
              float v161 = *(float *)(v159 + 28);
              float v162 = *(float *)(v160 + 28);
            }
            else
            {
              unsigned int v163 = [(id)a1 L2FeatureVector];
              [v163 scoreForFeature:1578];
              float v161 = v164;

              unint64_t v165 = [v6 L2FeatureVector];
              [v165 scoreForFeature:1578];
              float v162 = v166;
            }
            if (v161 > 0.0 && v161 > v162) {
              goto LABEL_113;
            }
            if (v162 > 0.0 && v162 > v161) {
              goto LABEL_215;
            }
            if (v6 && (v167 = *(void *)(a1 + 568)) != 0 && (uint64_t v168 = *((void *)v6 + 71)) != 0)
            {
              float v169 = *(float *)(v167 + 32);
              float v170 = *(float *)(v168 + 32);
            }
            else
            {
              uint64_t v171 = [(id)a1 L2FeatureVector];
              [v171 scoreForFeature:1332];
              float v169 = v172;

              int v173 = [v6 L2FeatureVector];
              [v173 scoreForFeature:1332];
              float v170 = v174;
            }
            if (v169 > 0.0 && v169 > v170) {
              goto LABEL_113;
            }
            if (v170 > 0.0 && v170 > v169) {
              goto LABEL_215;
            }
            if (v6 && (uint64_t v175 = *(void *)(a1 + 568)) != 0 && (v176 = *((void *)v6 + 71)) != 0)
            {
              float v177 = *(float *)(v175 + 36);
              float v178 = *(float *)(v176 + 36);
            }
            else
            {
              unint64_t v179 = [(id)a1 L2FeatureVector];
              [v179 scoreForFeature:1250];
              float v177 = v180;

              uint64_t v181 = [v6 L2FeatureVector];
              [v181 scoreForFeature:1250];
              float v178 = v182;
            }
            if (v177 > 0.0 && v177 > v178) {
              goto LABEL_113;
            }
            if (v178 > 0.0 && v178 > v177) {
              goto LABEL_215;
            }
            if (v6 && (uint64_t v183 = *(void *)(a1 + 568)) != 0 && (v184 = *((void *)v6 + 71)) != 0)
            {
              float v185 = *(float *)(v183 + 40);
              float v186 = *(float *)(v184 + 40);
            }
            else
            {
              unint64_t v187 = [(id)a1 L2FeatureVector];
              [v187 scoreForFeature:1127];
              float v185 = v188;

              unsigned __int16 v189 = [v6 L2FeatureVector];
              [v189 scoreForFeature:1127];
              float v186 = v190;
            }
            if (v185 > 0.0 && v185 > v186) {
              goto LABEL_113;
            }
            if (v186 > 0.0 && v186 > v185) {
              goto LABEL_215;
            }
            if (v6 && (v191 = *(void *)(a1 + 568)) != 0 && (uint64_t v192 = *((void *)v6 + 71)) != 0)
            {
              float v193 = *(float *)(v191 + 44);
              float v194 = *(float *)(v192 + 44);
            }
            else
            {
              BOOL v195 = [(id)a1 L2FeatureVector];
              [v195 scoreForFeature:1414];
              float v193 = v196;

              float v197 = [v6 L2FeatureVector];
              [v197 scoreForFeature:1414];
              float v194 = v198;
            }
            if (v193 > 0.0 && v193 > v194) {
              goto LABEL_113;
            }
            if (v194 > 0.0 && v194 > v193) {
              goto LABEL_215;
            }
            if (v6 && (v199 = *(void *)(a1 + 568)) != 0 && (uint64_t v200 = *((void *)v6 + 71)) != 0)
            {
              float v201 = *(float *)(v199 + 48);
              float v202 = *(float *)(v200 + 48);
            }
            else
            {
              int v203 = [(id)a1 L2FeatureVector];
              [v203 scoreForFeature:1455];
              float v201 = v204;

              float v205 = [v6 L2FeatureVector];
              [v205 scoreForFeature:1455];
              float v202 = v206;
            }
            if (v201 > 0.0 && v201 > v202) {
              goto LABEL_113;
            }
            if (v202 > 0.0 && v202 > v201) {
              goto LABEL_215;
            }
            if (v6 && (v207 = *(void *)(a1 + 568)) != 0 && (uint64_t v208 = *((void *)v6 + 71)) != 0)
            {
              float v209 = *(float *)(v207 + 52);
              float v210 = *(float *)(v208 + 52);
            }
            else
            {
              uint64_t v211 = [(id)a1 L2FeatureVector];
              [v211 scoreForFeature:1291];
              float v209 = v212;

              uint64_t v213 = [v6 L2FeatureVector];
              [v213 scoreForFeature:1291];
              float v210 = v214;
            }
            if (v209 > 0.0 && v209 > v210) {
              goto LABEL_113;
            }
            if (v210 > 0.0 && v210 > v209) {
              goto LABEL_215;
            }
            if (v6 && (uint64_t v215 = *(void *)(a1 + 568)) != 0 && (v216 = *((void *)v6 + 71)) != 0)
            {
              float v217 = *(float *)(v215 + 56);
              float v218 = *(float *)(v216 + 56);
            }
            else
            {
              double v219 = [(id)a1 L2FeatureVector];
              [v219 scoreForFeature:1168];
              float v217 = v220;

              double v221 = [v6 L2FeatureVector];
              [v221 scoreForFeature:1168];
              float v218 = v222;
            }
            if (v217 > 0.0 && v217 > v218) {
              goto LABEL_113;
            }
            if (v218 > 0.0 && v218 > v217) {
              goto LABEL_215;
            }
            if (v6 && (uint64_t v223 = *(void *)(a1 + 568)) != 0 && (v224 = *((void *)v6 + 71)) != 0)
            {
              float v225 = *(float *)(v223 + 60);
              float v226 = *(float *)(v224 + 60);
            }
            else
            {
              double v227 = [(id)a1 L2FeatureVector];
              [v227 scoreForFeature:1209];
              float v225 = v228;

              uint64_t v229 = [v6 L2FeatureVector];
              [v229 scoreForFeature:1209];
              float v226 = v230;
            }
            if (v225 > 0.0 && v225 > v226)
            {
LABEL_113:
              uint64_t v12 = 1;
LABEL_216:

              goto LABEL_205;
            }
            if (v226 > 0.0 && v226 > v225) {
              goto LABEL_215;
            }
            v428[0] = MEMORY[0x1E4F143A8];
            v428[1] = 3221225472;
            v428[2] = __47__PRSRankingItem_compareWithDates_currentTime___block_invoke_2;
            v428[3] = &unk_1E634C270;
            id v425 = v424;
            id v429 = v425;
            double v231 = v428;
            if (compareWithDates_currentTime__onceToken2 != -1) {
              dispatch_once(&compareWithDates_currentTime__onceToken2, v231);
            }

            uint64_t v232 = *(void *)(a1 + 608);
            if ((compareWithDates_currentTime__tcExactOrderedPhraseMatch & 0x40) != 0) {
              uint64_t v233 = 1 << compareWithDates_currentTime__tcExactOrderedPhraseMatch;
            }
            else {
              uint64_t v233 = 0;
            }
            if ((compareWithDates_currentTime__tcExactOrderedPhraseMatch & 0x40) != 0) {
              uint64_t v234 = 0;
            }
            else {
              uint64_t v234 = 1 << compareWithDates_currentTime__tcExactOrderedPhraseMatch;
            }
            uint64_t v235 = v234 & v232;
            uint64_t v422 = *(void *)(a1 + 616);
            uint64_t v236 = v233 & v422;
            float v237 = (float)*(unsigned long long *)&v235;
            if (v6)
            {
              uint64_t v238 = *((void *)v6 + 77);
              uint64_t v239 = *((void *)v6 + 76);
            }
            else
            {
              uint64_t v239 = 0;
              uint64_t v238 = 0;
            }
            uint64_t v240 = v239 & v234;
            uint64_t v241 = v238 & v233;
            if (v237 > (float)*(unsigned long long *)&v240)
            {
              BOOL v242 = 1;
              uint64_t v12 = 1;
              goto LABEL_423;
            }
            if (v237 < (float)*(unsigned long long *)&v240) {
              goto LABEL_392;
            }
            if ((compareWithDates_currentTime__tcMostlyExactOrderedPhraseMatch & 0x40) != 0) {
              uint64_t v243 = 1 << compareWithDates_currentTime__tcMostlyExactOrderedPhraseMatch;
            }
            else {
              uint64_t v243 = 0;
            }
            if ((compareWithDates_currentTime__tcMostlyExactOrderedPhraseMatch & 0x40) != 0) {
              uint64_t v244 = 0;
            }
            else {
              uint64_t v244 = 1 << compareWithDates_currentTime__tcMostlyExactOrderedPhraseMatch;
            }
            uint64_t v245 = v244 & v232;
            uint64_t v246 = v243 & v422;
            float v247 = (float)*(unsigned long long *)&v245;
            if (v6)
            {
              uint64_t v248 = *((void *)v6 + 77);
              uint64_t v249 = *((void *)v6 + 76);
            }
            else
            {
              uint64_t v249 = 0;
              uint64_t v248 = 0;
            }
            uint64_t v250 = v249 & v244;
            uint64_t v251 = v248 & v243;
            if (v247 > (float)*(unsigned long long *)&v250) {
              goto LABEL_422;
            }
            if (v247 >= (float)*(unsigned long long *)&v250)
            {
              if ((compareWithDates_currentTime__tcExactOrderedMatch & 0x40) != 0) {
                uint64_t v252 = 1 << compareWithDates_currentTime__tcExactOrderedMatch;
              }
              else {
                uint64_t v252 = 0;
              }
              if ((compareWithDates_currentTime__tcExactOrderedMatch & 0x40) != 0) {
                uint64_t v253 = 0;
              }
              else {
                uint64_t v253 = 1 << compareWithDates_currentTime__tcExactOrderedMatch;
              }
              uint64_t v254 = v253 & v232;
              uint64_t v255 = v252 & v422;
              float v256 = (float)*(unsigned long long *)&v254;
              if (v6)
              {
                uint64_t v257 = *((void *)v6 + 77);
                uint64_t v258 = *((void *)v6 + 76);
              }
              else
              {
                uint64_t v258 = 0;
                uint64_t v257 = 0;
              }
              uint64_t v259 = v258 & v253;
              uint64_t v260 = v257 & v252;
              if (v256 > (float)*(unsigned long long *)&v259) {
                goto LABEL_422;
              }
              if (v256 >= (float)*(unsigned long long *)&v259)
              {
                if ((compareWithDates_currentTime__policyFieldsPhraseMatchBit & 0x40) != 0) {
                  uint64_t v261 = 1 << compareWithDates_currentTime__policyFieldsPhraseMatchBit;
                }
                else {
                  uint64_t v261 = 0;
                }
                if ((compareWithDates_currentTime__policyFieldsPhraseMatchBit & 0x40) != 0) {
                  uint64_t v262 = 0;
                }
                else {
                  uint64_t v262 = 1 << compareWithDates_currentTime__policyFieldsPhraseMatchBit;
                }
                uint64_t v263 = v262 & v232;
                uint64_t v264 = v261 & v422;
                float v265 = (float)*(unsigned long long *)&v263;
                if (v6)
                {
                  uint64_t v266 = *((void *)v6 + 77);
                  uint64_t v267 = *((void *)v6 + 76);
                }
                else
                {
                  uint64_t v267 = 0;
                  uint64_t v266 = 0;
                }
                uint64_t v268 = v267 & v262;
                uint64_t v269 = v266 & v261;
                if (v265 > (float)*(unsigned long long *)&v268)
                {
LABEL_422:
                  uint64_t v12 = 1;
                  BOOL v242 = 1;
                  goto LABEL_423;
                }
                if (v265 >= (float)*(unsigned long long *)&v268)
                {
                  if (v6 && (uint64_t v270 = *(void *)(a1 + 568)) != 0 && (v271 = *((void *)v6 + 71)) != 0)
                  {
                    float v272 = *(float *)(v270 + 64);
                    float v273 = *(float *)(v271 + 64);
                  }
                  else
                  {
                    unint64_t v274 = [(id)a1 L2FeatureVector];
                    [v274 scoreForFeature:159];
                    float v272 = v275;

                    double v276 = [v6 L2FeatureVector];
                    [v276 scoreForFeature:159];
                    float v273 = v277;
                  }
                  if (v272 > 0.0 && v272 > v273) {
                    goto LABEL_422;
                  }
                  if (v273 <= 0.0 || v273 <= v272)
                  {
                    if (v6 && (v278 = *(void *)(a1 + 568)) != 0 && (uint64_t v279 = *((void *)v6 + 71)) != 0)
                    {
                      float v280 = *(float *)(v278 + 68);
                      float v281 = *(float *)(v279 + 68);
                    }
                    else
                    {
                      uint64_t v282 = [(id)a1 L2FeatureVector];
                      [v282 scoreForFeature:1366];
                      float v280 = v283;

                      uint64_t v284 = [v6 L2FeatureVector];
                      [v284 scoreForFeature:1366];
                      float v281 = v285;
                    }
                    if (v280 > 0.0 && v280 > v281) {
                      goto LABEL_422;
                    }
                    if (v281 <= 0.0 || v281 <= v280)
                    {
                      if (v6 && (v286 = *(void *)(a1 + 568)) != 0 && (uint64_t v287 = *((void *)v6 + 71)) != 0)
                      {
                        float v288 = *(float *)(v286 + 72);
                        float v289 = *(float *)(v287 + 72);
                      }
                      else
                      {
                        uint64_t v290 = [(id)a1 L2FeatureVector];
                        [v290 scoreForFeature:1079];
                        float v288 = v291;

                        unint64_t v292 = [v6 L2FeatureVector];
                        [v292 scoreForFeature:1079];
                        float v289 = v293;
                      }
                      if (v288 > 0.0 && v288 > v289) {
                        goto LABEL_422;
                      }
                      if (v289 <= 0.0 || v289 <= v288)
                      {
                        if (v6 && (uint64_t v294 = *(void *)(a1 + 568)) != 0 && (v295 = *((void *)v6 + 71)) != 0)
                        {
                          float v296 = *(float *)(v294 + 76);
                          float v297 = *(float *)(v295 + 76);
                        }
                        else
                        {
                          unint64_t v298 = [(id)a1 L2FeatureVector];
                          [v298 scoreForFeature:133];
                          float v296 = v299;

                          uint64_t v300 = [v6 L2FeatureVector];
                          [v300 scoreForFeature:133];
                          float v297 = v301;
                        }
                        if (v296 > 0.0 && v296 > v297) {
                          goto LABEL_422;
                        }
                        if (v297 <= 0.0 || v297 <= v296)
                        {
                          if (v6 && (uint64_t v302 = *(void *)(a1 + 568)) != 0 && (v303 = *((void *)v6 + 71)) != 0)
                          {
                            float v304 = *(float *)(v302 + 80);
                            float v305 = *(float *)(v303 + 80);
                          }
                          else
                          {
                            unint64_t v306 = [(id)a1 L2FeatureVector];
                            [v306 scoreForFeature:157];
                            float v304 = v307;

                            unint64_t v308 = [v6 L2FeatureVector];
                            [v308 scoreForFeature:157];
                            float v305 = v309;
                          }
                          if (v304 > 0.0 && v304 > v305) {
                            goto LABEL_422;
                          }
                          if (v305 <= 0.0 || v305 <= v304)
                          {
                            if (v6 && (v310 = *(void *)(a1 + 568)) != 0 && (uint64_t v311 = *((void *)v6 + 71)) != 0)
                            {
                              float v312 = *(float *)(v310 + 84);
                              float v313 = *(float *)(v311 + 84);
                            }
                            else
                            {
                              size_t v314 = [(id)a1 L2FeatureVector];
                              [v314 scoreForFeature:1530];
                              float v312 = v315;

                              double v316 = [v6 L2FeatureVector];
                              [v316 scoreForFeature:1530];
                              float v313 = v317;
                            }
                            if (v312 > 0.0 && v312 > v313) {
                              goto LABEL_422;
                            }
                            if (v313 <= 0.0 || v313 <= v312)
                            {
                              if (v6 && (v318 = *(void *)(a1 + 568)) != 0 && (uint64_t v319 = *((void *)v6 + 71)) != 0)
                              {
                                float v320 = *(float *)(v318 + 88);
                                float v321 = *(float *)(v319 + 88);
                              }
                              else
                              {
                                unint64_t v322 = [(id)a1 L2FeatureVector];
                                [v322 scoreForFeature:1489];
                                float v320 = v323;

                                uint64_t v324 = [v6 L2FeatureVector];
                                [v324 scoreForFeature:1489];
                                float v321 = v325;
                              }
                              if (v320 > 0.0 && v320 > v321) {
                                goto LABEL_422;
                              }
                              if (v321 <= 0.0 || v321 <= v320)
                              {
                                if (v6 && (uint64_t v326 = *(void *)(a1 + 568)) != 0 && (v327 = *((void *)v6 + 71)) != 0)
                                {
                                  float v328 = *(float *)(v326 + 92);
                                  float v329 = *(float *)(v327 + 92);
                                }
                                else
                                {
                                  unint64_t v330 = [(id)a1 L2FeatureVector];
                                  [v330 scoreForFeature:1571];
                                  float v328 = v331;

                                  long long v332 = [v6 L2FeatureVector];
                                  [v332 scoreForFeature:1571];
                                  float v329 = v333;
                                }
                                if (v328 > 0.0 && v328 > v329) {
                                  goto LABEL_422;
                                }
                                if (v329 <= 0.0 || v329 <= v328)
                                {
                                  if (v6 && (uint64_t v334 = *(void *)(a1 + 568)) != 0 && (v335 = *((void *)v6 + 71)) != 0)
                                  {
                                    float v336 = *(float *)(v334 + 96);
                                    float v337 = *(float *)(v335 + 96);
                                  }
                                  else
                                  {
                                    uint64_t v338 = [(id)a1 L2FeatureVector];
                                    [v338 scoreForFeature:1325];
                                    float v336 = v339;

                                    unint64_t v340 = [v6 L2FeatureVector];
                                    [v340 scoreForFeature:1325];
                                    float v337 = v341;
                                  }
                                  if (v336 > 0.0 && v336 > v337) {
                                    goto LABEL_422;
                                  }
                                  if (v337 <= 0.0 || v337 <= v336)
                                  {
                                    if (v6 && (v342 = *(void *)(a1 + 568)) != 0 && (uint64_t v343 = *((void *)v6 + 71)) != 0)
                                    {
                                      float v344 = *(float *)(v342 + 100);
                                      float v345 = *(float *)(v343 + 100);
                                    }
                                    else
                                    {
                                      v346 = [(id)a1 L2FeatureVector];
                                      [v346 scoreForFeature:1243];
                                      float v344 = v347;

                                      unint64_t v348 = [v6 L2FeatureVector];
                                      [v348 scoreForFeature:1243];
                                      float v345 = v349;
                                    }
                                    if (v344 > 0.0 && v344 > v345) {
                                      goto LABEL_422;
                                    }
                                    if (v345 <= 0.0 || v345 <= v344)
                                    {
                                      if (v6
                                        && (uint64_t v350 = *(void *)(a1 + 568)) != 0
                                        && (uint64_t v351 = *((void *)v6 + 71)) != 0)
                                      {
                                        float v352 = *(float *)(v350 + 104);
                                        float v353 = *(float *)(v351 + 104);
                                      }
                                      else
                                      {
                                        uint64_t v354 = [(id)a1 L2FeatureVector];
                                        [v354 scoreForFeature:1120];
                                        float v352 = v355;

                                        uint64_t v356 = [v6 L2FeatureVector];
                                        [v356 scoreForFeature:1120];
                                        float v353 = v357;
                                      }
                                      if (v352 > 0.0 && v352 > v353) {
                                        goto LABEL_422;
                                      }
                                      if (v353 <= 0.0 || v353 <= v352)
                                      {
                                        if (v6
                                          && (uint64_t v358 = *(void *)(a1 + 568)) != 0
                                          && (uint64_t v359 = *((void *)v6 + 71)) != 0)
                                        {
                                          float v360 = *(float *)(v358 + 108);
                                          float v361 = *(float *)(v359 + 108);
                                        }
                                        else
                                        {
                                          float v362 = [(id)a1 L2FeatureVector];
                                          [v362 scoreForFeature:1407];
                                          float v360 = v363;

                                          double v364 = [v6 L2FeatureVector];
                                          [v364 scoreForFeature:1407];
                                          float v361 = v365;
                                        }
                                        if (v360 > 0.0 && v360 > v361) {
                                          goto LABEL_422;
                                        }
                                        if (v361 <= 0.0 || v361 <= v360)
                                        {
                                          if (v6
                                            && (uint64_t v366 = *(void *)(a1 + 568)) != 0
                                            && (uint64_t v367 = *((void *)v6 + 71)) != 0)
                                          {
                                            float v368 = *(float *)(v366 + 112);
                                            float v369 = *(float *)(v367 + 112);
                                          }
                                          else
                                          {
                                            double v370 = [(id)a1 L2FeatureVector];
                                            [v370 scoreForFeature:1448];
                                            float v368 = v371;

                                            v372 = [v6 L2FeatureVector];
                                            [v372 scoreForFeature:1448];
                                            float v369 = v373;
                                          }
                                          if (v368 > 0.0 && v368 > v369) {
                                            goto LABEL_422;
                                          }
                                          if (v369 <= 0.0 || v369 <= v368)
                                          {
                                            if (v6
                                              && (uint64_t v374 = *(void *)(a1 + 568)) != 0
                                              && (uint64_t v375 = *((void *)v6 + 71)) != 0)
                                            {
                                              float v376 = *(float *)(v374 + 116);
                                              float v377 = *(float *)(v375 + 116);
                                            }
                                            else
                                            {
                                              unint64_t v378 = [(id)a1 L2FeatureVector];
                                              [v378 scoreForFeature:1284];
                                              float v376 = v379;

                                              uint64_t v380 = [v6 L2FeatureVector];
                                              [v380 scoreForFeature:1284];
                                              float v377 = v381;
                                            }
                                            if (v376 > 0.0 && v376 > v377) {
                                              goto LABEL_422;
                                            }
                                            if (v377 <= 0.0 || v377 <= v376)
                                            {
                                              if (v6
                                                && (uint64_t v382 = *(void *)(a1 + 568)) != 0
                                                && (uint64_t v383 = *((void *)v6 + 71)) != 0)
                                              {
                                                float v384 = *(float *)(v382 + 120);
                                                float v385 = *(float *)(v383 + 120);
                                              }
                                              else
                                              {
                                                uint64_t v386 = [(id)a1 L2FeatureVector];
                                                [v386 scoreForFeature:1161];
                                                float v384 = v387;

                                                uint64_t v388 = [v6 L2FeatureVector];
                                                [v388 scoreForFeature:1161];
                                                float v385 = v389;
                                              }
                                              if (v384 > 0.0 && v384 > v385) {
                                                goto LABEL_422;
                                              }
                                              if (v385 <= 0.0 || v385 <= v384)
                                              {
                                                if (v6
                                                  && (uint64_t v390 = *(void *)(a1 + 568)) != 0
                                                  && (uint64_t v391 = *((void *)v6 + 71)) != 0)
                                                {
                                                  float v392 = *(float *)(v390 + 124);
                                                  float v393 = *(float *)(v391 + 124);
                                                }
                                                else
                                                {
                                                  unint64_t v394 = [(id)a1 L2FeatureVector];
                                                  [v394 scoreForFeature:1202];
                                                  float v392 = v395;

                                                  id v396 = [v6 L2FeatureVector];
                                                  [v396 scoreForFeature:1202];
                                                  float v393 = v397;
                                                }
                                                if (v392 > 0.0 && v392 > v393) {
                                                  goto LABEL_422;
                                                }
                                                if (v393 <= 0.0 || v393 <= v392)
                                                {
                                                  v426[0] = MEMORY[0x1E4F143A8];
                                                  v426[1] = 3221225472;
                                                  v426[2] = __47__PRSRankingItem_compareWithDates_currentTime___block_invoke_3;
                                                  v426[3] = &unk_1E634C270;
                                                  id v427 = v425;
                                                  uint64_t v398 = v426;
                                                  if (compareWithDates_currentTime__onceToken3[0] != -1) {
                                                    dispatch_once(compareWithDates_currentTime__onceToken3, v398);
                                                  }

                                                  uint64_t v399 = *(void *)(a1 + 608);
                                                  if ((compareWithDates_currentTime__tcOrderedPhraseMatch & 0x40) != 0) {
                                                    uint64_t v400 = 1 << compareWithDates_currentTime__tcOrderedPhraseMatch;
                                                  }
                                                  else {
                                                    uint64_t v400 = 0;
                                                  }
                                                  if ((compareWithDates_currentTime__tcOrderedPhraseMatch & 0x40) != 0) {
                                                    uint64_t v401 = 0;
                                                  }
                                                  else {
                                                    uint64_t v401 = 1 << compareWithDates_currentTime__tcOrderedPhraseMatch;
                                                  }
                                                  uint64_t v402 = v401 & v399;
                                                  uint64_t v403 = v400 & *(void *)(a1 + 616);
                                                  float v404 = (float)*(unsigned long long *)&v402;
                                                  if (v6)
                                                  {
                                                    uint64_t v405 = *((void *)v6 + 77);
                                                    uint64_t v406 = *((void *)v6 + 76);
                                                  }
                                                  else
                                                  {
                                                    uint64_t v406 = 0;
                                                    uint64_t v405 = 0;
                                                  }
                                                  uint64_t v407 = v406 & v401;
                                                  uint64_t v408 = v405 & v400;
                                                  if (v404 <= (float)*(unsigned long long *)&v407)
                                                  {
                                                    if (v404 >= (float)*(unsigned long long *)&v407)
                                                    {
                                                      if ((compareWithDates_currentTime__tcOrderedMatch & 0x40) != 0) {
                                                        uint64_t v409 = 1 << compareWithDates_currentTime__tcOrderedMatch;
                                                      }
                                                      else {
                                                        uint64_t v409 = 0;
                                                      }
                                                      if ((compareWithDates_currentTime__tcOrderedMatch & 0x40) != 0) {
                                                        uint64_t v410 = 0;
                                                      }
                                                      else {
                                                        uint64_t v410 = 1 << compareWithDates_currentTime__tcOrderedMatch;
                                                      }
                                                      uint64_t v411 = v410 & v399;
                                                      uint64_t v412 = v409 & *(void *)(a1 + 616);
                                                      float v413 = (float)*(unsigned long long *)&v411;
                                                      if (v6)
                                                      {
                                                        uint64_t v414 = *((void *)v6 + 77);
                                                        uint64_t v415 = *((void *)v6 + 76);
                                                      }
                                                      else
                                                      {
                                                        uint64_t v415 = 0;
                                                        uint64_t v414 = 0;
                                                      }
                                                      uint64_t v416 = v415 & v410;
                                                      uint64_t v417 = v414 & v409;
                                                      float v418 = (float)*(unsigned long long *)&v416;
                                                      if (v413 < (float)*(unsigned long long *)&v416) {
                                                        uint64_t v419 = -1;
                                                      }
                                                      else {
                                                        uint64_t v419 = v14;
                                                      }
                                                      BOOL v242 = v413 > v418 || v413 < v418;
                                                      if (v413 > v418) {
                                                        uint64_t v12 = 1;
                                                      }
                                                      else {
                                                        uint64_t v12 = v419;
                                                      }
                                                    }
                                                    else
                                                    {
                                                      uint64_t v12 = -1;
                                                      BOOL v242 = 1;
                                                    }
                                                  }
                                                  else
                                                  {
                                                    uint64_t v12 = 1;
                                                    BOOL v242 = 1;
                                                  }

LABEL_423:
                                                  if (v242) {
                                                    goto LABEL_205;
                                                  }
                                                  goto LABEL_69;
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
LABEL_392:
            uint64_t v12 = -1;
            BOOL v242 = 1;
            goto LABEL_423;
          }
LABEL_60:
          uint64_t v12 = -1;
          goto LABEL_205;
        }
      }
    }
    else
    {
      if (v18 && !v19) {
        goto LABEL_57;
      }
      if (!v18 && v19) {
        goto LABEL_60;
      }
    }
LABEL_197:
    uint64_t v91 = *(void *)(a1 + 440);
    if ((v91 & 0x200000) != 0)
    {
      if (([v6 bundleIDType] & 0x200000) != 0)
      {
        uint64_t v12 = (*((uint64_t (**)(uint64_t, void *, void *))compareShortcuts + 2))((uint64_t)compareShortcuts, (void *)a1, v6);
        goto LABEL_205;
      }
      uint64_t v91 = *(void *)(a1 + 440);
    }
    if ((v91 & 0x10) == 0
      || ([v6 bundleIDType] & 0x10) == 0
      || (uint64_t v12 = (*((uint64_t (**)(uint64_t, void *, void *))comparePreferences + 2))((uint64_t)comparePreferences, (void *)a1, v6)) == 0)
    {
      uint64_t v12 = 0;
    }
    goto LABEL_205;
  }
LABEL_207:

  return v12;
}

void __88__PRSRankingItem_compareWithDatesPlus_currentTime_hasCategory_topBit_upperBit_lowerBit___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) objectForKey:@"PRSPolicyFieldsExactPhraseMatchBit"];
  compareWithDatesPlus_currentTime_hasCategory_topBit_upperBit_lowerBit__bit1 = [v2 integerValue];

  uint64_t v3 = [*(id *)(a1 + 32) objectForKey:@"PRSPolicyFieldsMostlyExactPhraseMatchBit"];
  compareWithDatesPlus_currentTime_hasCategory_topBit_upperBit_lowerBit__bit2 = [v3 integerValue];

  id v4 = [*(id *)(a1 + 32) objectForKey:@"exact_policy_flag_bit"];
  compareWithDatesPlus_currentTime_hasCategory_topBit_upperBit_lowerBit__bit3 = [v4 integerValue];

  id v5 = [*(id *)(a1 + 32) objectForKey:@"PRSPolicyFieldsPhraseMatchBit"];
  compareWithDatesPlus_currentTime_hasCategory_topBit_upperBit_lowerBit__bit4 = [v5 integerValue];

  id v6 = [*(id *)(a1 + 32) objectForKey:@"PRSPolicyFieldsPrefixMatch"];
  compareWithDatesPlus_currentTime_hasCategory_topBit_upperBit_lowerBit__bit5 = [v6 integerValue];
}

- (uint64_t)comparePhotosOnlyWithDates:(double)a3 currentTime:
{
  id v5 = a2;
  if (!a1)
  {
    uint64_t v10 = 0;
    goto LABEL_39;
  }
  if ([*(id *)(a1 + 256) isSiriAction])
  {
    unsigned int v6 = 2;
  }
  else if (*(unsigned char *)(a1 + 80))
  {
    unsigned int v6 = 4;
  }
  else
  {
    unsigned int v6 = 8;
  }
  uint64_t v7 = [v5 L2FeatureVector];
  char v8 = [v7 isSiriAction];

  if (v8)
  {
    unsigned int v9 = 2;
  }
  else
  {
    unsigned int v9 = 8;
    if (v5)
    {
      if (v5[80]) {
        unsigned int v9 = 4;
      }
      else {
        unsigned int v9 = 8;
      }
    }
  }
  if (v6 <= v9)
  {
    if (v6 < v9)
    {
      uint64_t v10 = -1;
      goto LABEL_39;
    }
    unsigned int v11 = [(id)a1 interestingDate];
    uint64_t v12 = [v5 interestingDate];
    uint64_t v13 = (void *)v12;
    if (v11 && v12)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v11 timeIntervalSinceReferenceDate];
          double v15 = v14 - a3;
          [v13 timeIntervalSinceReferenceDate];
          double v17 = v16 - a3;
          if ((v15 < 0.0 || v17 < 0.0) && (v15 > 0.0 || v17 > 0.0)) {
            goto LABEL_42;
          }
          double v15 = fabs(v15);
          double v17 = fabs(v17);
          if (v15 >= v17)
          {
            if (v15 > v17)
            {
              uint64_t v10 = -1;
LABEL_38:

              goto LABEL_39;
            }
            if (v15 == v17)
            {
              uint64_t v10 = 0;
              goto LABEL_38;
            }
LABEL_42:
            if (v17 >= 0.0 || v15 <= 0.0) {
              uint64_t v10 = -1;
            }
            else {
              uint64_t v10 = 1;
            }
            goto LABEL_38;
          }
LABEL_30:
          uint64_t v10 = 1;
          goto LABEL_38;
        }
      }
    }
    else if (v11 && !v12)
    {
      goto LABEL_30;
    }
    if (v11) {
      BOOL v18 = 1;
    }
    else {
      BOOL v18 = v13 == 0;
    }
    uint64_t v19 = !v18;
    uint64_t v10 = v19 << 63 >> 63;
    goto LABEL_38;
  }
  uint64_t v10 = 1;
LABEL_39:

  return v10;
}

void __47__PRSRankingItem_compareWithDates_currentTime___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) objectForKey:@"PRSPolicyFieldsExactPhraseMatchBit"];
  compareWithDates_currentTime__policyFieldsExactPhraseMatchBit = [v2 integerValue];

  id v3 = [*(id *)(a1 + 32) objectForKey:@"PRSPolicyFieldsMostlyExactPhraseMatchBit"];
  compareWithDates_currentTime__policyFieldsMostlyExactPhraseMatchBit = [v3 integerValue];
}

void __47__PRSRankingItem_compareWithDates_currentTime___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) objectForKey:@"PRSRankingTCExactOrderedPhraseMatch"];
  compareWithDates_currentTime__tcExactOrderedPhraseMatch = [v2 integerValue];

  id v3 = [*(id *)(a1 + 32) objectForKey:@"PRSRankingTCMostlyExactOrderedPhraseMatch"];
  compareWithDates_currentTime__tcMostlyExactOrderedPhraseMatch = [v3 integerValue];

  id v4 = [*(id *)(a1 + 32) objectForKey:@"PRSRankingTCExactOrderedMatch"];
  compareWithDates_currentTime__tcExactOrderedMatch = [v4 integerValue];

  id v5 = [*(id *)(a1 + 32) objectForKey:@"PRSPolicyFieldsPhraseMatchBit"];
  compareWithDates_currentTime__policyFieldsPhraseMatchBit = [v5 integerValue];
}

void __47__PRSRankingItem_compareWithDates_currentTime___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) objectForKey:@"PRSRankingTCOrderedPhraseMatch"];
  compareWithDates_currentTime__tcOrderedPhraseMatch = [v2 integerValue];

  id v3 = [*(id *)(a1 + 32) objectForKey:@"PRSRankingTCOrderedMatch"];
  compareWithDates_currentTime__tcOrderedMatch = [v3 integerValue];
}

- (int64_t)compare:(id)a3 currentTime:(double)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  unsigned int v6 = a3;
  uint64_t v7 = self->_sectionBundleIdentifier;
  char v8 = [v6 sectionBundleIdentifier];
  if (![(NSString *)v7 isEqualToString:v8]
    && (!SSSectionIsSyndicatedPhotos(v7) || !SSSectionIsSyndicatedPhotos(v8)))
  {
    double v16 = [v6 L2FeatureVector];
    [v16 originalL2Score];
    float v10 = v17;

    [(PRSL2FeatureVector *)self->_L2FeatureVector originalL2Score];
    float withinBundleScore = v18;
    goto LABEL_12;
  }
  [v6 withinBundleScore];
  float v10 = v9;
  float withinBundleScore = self->_withinBundleScore;
  if ((self->_bundleIDType & 0x80) == 0) {
    goto LABEL_12;
  }
  uint64_t v12 = SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0xDuLL);
  uint64_t v13 = SSCompactRankingAttrsGetValue((int8x8_t *)[v6 attributes], 0xDuLL);
  double v14 = (void *)v13;
  if (v12 && v13)
  {
    if ([v12 hasPrefix:v13])
    {
      int64_t v15 = -1;
LABEL_27:

      goto LABEL_28;
    }
    if ([v14 hasPrefix:v12])
    {
      int64_t v15 = 1;
      goto LABEL_27;
    }
  }
  else
  {
    NSLog(&cfstr_ErrorCouldnTCo.isa, v12, v13);
  }

LABEL_12:
  if (withinBundleScore > v10)
  {
LABEL_13:
    int64_t v15 = 1;
    goto LABEL_28;
  }
  if (withinBundleScore < v10) {
    goto LABEL_16;
  }
  uint64_t v19 = -[PRSRankingItem compareWithDates:currentTime:]((uint64_t)self, v6, a4);
  int64_t v15 = v19;
  if (v19) {
    goto LABEL_28;
  }
  memset(__dst, 0, sizeof(__dst));
  memset(v33, 0, sizeof(v33));
  int ArrayInt64 = SSCompactRankingAttrsGetArrayInt64((uint64_t)self->_attributes, 0x156uLL, __dst, 4);
  int v21 = SSCompactRankingAttrsGetArrayInt64([v6 attributes], 0x156uLL, v33, 4);
  if (!ArrayInt64 || !v21)
  {
    char v26 = ArrayInt64 | v21;
    if (ArrayInt64) {
      int64_t v15 = 1;
    }
    else {
      int64_t v15 = -1;
    }
    if (v26) {
      goto LABEL_28;
    }
    unint64_t v27 = *(void *)&self->_indexScore[8];
    unint64_t v28 = *(void *)self->_indexScore;
    if (v6)
    {
      unint64_t v29 = v6[77];
      unint64_t v30 = v6[76];
    }
    else
    {
      unint64_t v30 = 0;
      unint64_t v29 = 0;
    }
    if (__PAIR128__(v29, v30) < __PAIR128__(v27, v28)) {
      goto LABEL_13;
    }
    if (__PAIR128__(v27, v28) >= __PAIR128__(v29, v30))
    {
      unint64_t v31 = [(PRSRankingItem *)self likelyDisplayTitle];
      uint64_t v32 = [v6 likelyDisplayTitle];
      if ([v31 length] && objc_msgSend(v32, "length"))
      {
        int64_t v15 = [v31 compare:v32];
      }
      else if ([v31 length])
      {
        int64_t v15 = 1;
      }
      else if ([v32 length])
      {
        int64_t v15 = -1;
      }
      else
      {
        int64_t v15 = 0;
      }

      goto LABEL_28;
    }
LABEL_16:
    int64_t v15 = -1;
    goto LABEL_28;
  }
  uint64_t v22 = 0;
  int64_t v15 = 1;
  while (1)
  {
    uint64_t v23 = *(void *)((char *)__dst + v22);
    uint64_t v24 = *(void *)((char *)v33 + v22);
    if (v23 > v24) {
      break;
    }
    if (v23 < v24) {
      goto LABEL_16;
    }
    v22 += 8;
    if (v22 == 32)
    {
      int64_t v15 = 0;
      break;
    }
  }
LABEL_28:

  return v15;
}

- (id)displayName
{
  return SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 7uLL);
}

- (id)likelyDisplayTitle
{
  id v3 = SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 7uLL);
  if ([v3 length])
  {
    id v4 = v3;
LABEL_5:
    id v6 = v4;
    goto LABEL_6;
  }
  id v5 = SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0xCuLL);

  if ([v5 length])
  {
    id v4 = v5;
    goto LABEL_5;
  }
  char v8 = SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 5uLL);
  float v9 = [v8 componentsJoinedByString:@" "];

  id v6 = v9;
LABEL_6:

  return v6;
}

- (NSString)description
{
  id v3 = SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 2uLL);
  id v4 = NSString;
  v14.receiver = self;
  v14.super_class = (Class)PRSRankingItem;
  id v5 = [(PRSRankingItem *)&v14 description];
  sectionBundleIdentifier = self->_sectionBundleIdentifier;
  double pommesL1Score = self->_pommesL1Score;
  double l2Score = self->_l2Score;
  float v9 = [(PRSRankingItem *)self likelyDisplayTitle];
  float v10 = [(PRSRankingItem *)self interestingDate];
  [(PRSL2FeatureVector *)self->_L2FeatureVector originalL2Score];
  uint64_t v12 = [v4 stringWithFormat:@"%@ %@ identifier:%@ L1:%f L2:%f displayTitle:\"%@\" interestingDate:\"%@\" (originalL2=%f, score=%f)", v5, sectionBundleIdentifier, v3, *(void *)&pommesL1Score, *(void *)&l2Score, v9, v10, v11, self->_score];

  return (NSString *)v12;
}

- (id)dataCollectionBundle
{
  return self->_sectionBundleIdentifier;
}

- (id)contentType
{
  return self->_contentType;
}

- (BOOL)serializeToJSON:(void *)a3 valuesOnly:(BOOL)a4
{
  L2FeatureVector = self->_L2FeatureVector;
  if (!L2FeatureVector)
  {
    NSUInteger v7 = [(NSData *)self->_serverFeaturesJSON length];
    if (!v7) {
      return v7;
    }
    size_t v9 = v7;
    float v10 = [(NSData *)self->_serverFeaturesJSON bytes];
    float v11 = v10;
    if (a4)
    {
      uint64_t v12 = &v10[v9];
      size_t v13 = v9 - 1;
      uint64_t v14 = MEMORY[0x1E4F14390];
      int64_t v15 = v10;
      do
      {
        unsigned int v16 = *v15;
        if ((v16 & 0x80000000) != 0) {
          int v17 = __maskrune(*v15, 0x4000uLL);
        }
        else {
          int v17 = *(_DWORD *)(v14 + 4 * v16 + 60) & 0x4000;
        }
        unint64_t v18 = (unint64_t)(v15 + 1);
        --v13;
        if (v17) {
          BOOL v19 = v15 >= v12;
        }
        else {
          BOOL v19 = 1;
        }
        ++v15;
      }
      while (!v19);
      if (v16 != 123) {
        goto LABEL_27;
      }
      float v20 = &v11[v9 - 1];
      do
      {
        int v21 = v20;
        size_t v9 = v13;
        if ((unint64_t)(v20 + 1) <= v18) {
          break;
        }
        unsigned int v22 = *v20;
        int v23 = (v22 & 0x80000000) != 0 ? __maskrune(v22, 0x4000uLL) : *(_DWORD *)(v14 + 4 * v22 + 60) & 0x4000;
        float v20 = v21 - 1;
        --v13;
      }
      while (v23);
      if (*v21 != 125 || (unint64_t)v21 <= v18)
      {
LABEL_27:
        LOBYTE(v7) = 0;
        return v7;
      }
      double v25 = a3;
      char v26 = (char *)v18;
    }
    else
    {
      double v25 = a3;
      char v26 = v11;
    }
    json_writer_add_raw_value((uint64_t)v25, v26, v9);
    LOBYTE(v7) = 1;
    return v7;
  }
  LOBYTE(v7) = [(PRSL2FeatureVector *)L2FeatureVector serializeToJSON:a3 options:1];
  return v7;
}

- (uint64_t)recencyTestForVisibilityWithCurrentTime:(uint64_t)a1
{
  uint64_t v2 = a1;
  if (a1)
  {
    id v4 = *(id *)(a1 + 224);
    id v5 = @"public.message";
    uint64_t v6 = *(void *)(v2 + 440);
    if ((v6 & 0x30900) != 0 || (v6 & 0x2040000) != 0 && (*(unsigned char *)(v2 + 62) || *(unsigned char *)(v2 + 63)))
    {
      uint64_t v2 = 1;
LABEL_4:

      return v2;
    }
    char v8 = [(id)v2 interestingDate];
    if (!v8)
    {
      uint64_t v12 = *(void *)(v2 + 440);
      uint64_t v13 = -1;
      if ((v12 & 0x40) != 0) {
        uint64_t v13 = 1;
      }
      if ((v12 & 0x20) != 0) {
        uint64_t v2 = 0;
      }
      else {
        uint64_t v2 = v13;
      }
      goto LABEL_24;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v2 = -1;
LABEL_24:

      goto LABEL_4;
    }
    if ((*(unsigned char *)(v2 + 441) & 0x40) != 0)
    {
      uint64_t v14 = [MEMORY[0x1E4F28ED0] numberWithDouble:14.0];
      uint64_t v11 = +[SSRankingManager getRecencyIntervalForBundleType:intervalType:indexRequired:]((uint64_t)SSRankingManager, v14, 3, 0xFFFFFFFFFFFFFFFFLL);
    }
    else
    {
      size_t v9 = @"public.contact";
      if ([*(id *)(v2 + 424) isEqualToString:@"public.contact"]
        || (size_t v9 = @"public.email-message",
            [*(id *)(v2 + 424) isEqualToString:@"public.email-message"]))
      {
        float v10 = v9;
      }
      else if ([*(id *)(v2 + 424) isEqualToString:v5])
      {
        float v10 = v5;
      }
      else
      {
        if ([*(id *)(v2 + 424) isEqualToString:@"public.to-do-item"])
        {
          uint64_t v16 = [(id)v2 dueDate];
          int v17 = (void *)v16;
          if (v16) {
            BOOL v18 = v16 == (void)v8;
          }
          else {
            BOOL v18 = 0;
          }
          unint64_t v19 = !v18;
          uint64_t v11 = +[SSRankingManager getRecencyIntervalForBundleId:intervalType:indexRequired:]((uint64_t)SSRankingManager, @"public.to-do-item", 3, v19);

          goto LABEL_23;
        }
        if ([*(id *)(v2 + 424) isEqualToString:@"public.calendar-event"]) {
          float v10 = @"public.calendar-event";
        }
        else {
          float v10 = @"default";
        }
      }
      uint64_t v11 = +[SSRankingManager getRecencyIntervalForBundleId:intervalType:indexRequired:]((uint64_t)SSRankingManager, v10, 3, 0xFFFFFFFFFFFFFFFFLL);
    }
LABEL_23:
    [v8 timeIntervalSinceReferenceDate];
    uint64_t v2 = v15 - a2 > (double)v11;
    goto LABEL_24;
  }
  return v2;
}

- (uint64_t)recencyTestForTopHitWithCurrentTime:(uint64_t)a1
{
  uint64_t v2 = a1;
  if (a1)
  {
    id v4 = *(id *)(a1 + 224);
    if ([v4 isEqualToString:@"com.apple.application"])
    {
      uint64_t v2 = 1;
LABEL_17:

      return v2;
    }
    id v5 = [(id)v2 interestingDate];
    if (!v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      uint64_t v2 = 0;
      goto LABEL_16;
    }
    uint64_t v6 = @"public.contact";
    if ([*(id *)(v2 + 424) isEqualToString:@"public.contact"]
      || (uint64_t v6 = @"public.email-message",
          [*(id *)(v2 + 424) isEqualToString:@"public.email-message"])
      || [*(id *)(v2 + 424) isEqualToString:@"public.message"]
      || [*(id *)(v2 + 424) isEqualToString:@"public.to-do-item"]
      || [*(id *)(v2 + 424) isEqualToString:@"public.calendar-event"]
      || [v4 isEqualToString:@"com.apple.Preferences"])
    {
      NSUInteger v7 = v6;
    }
    else
    {
      if ((*(unsigned char *)(v2 + 441) & 2) != 0)
      {
        uint64_t v11 = [(id)v2 L2FeatureVector];
        [v11 scoreForFeature:1881];
        float v13 = v12;

        if (v13 <= 10.0)
        {
          uint64_t v14 = [MEMORY[0x1E4F28ED0] numberWithDouble:9.0];
          double v15 = v14;
          if (v13 <= 1.0) {
            unint64_t v16 = 2;
          }
          else {
            unint64_t v16 = 1;
          }
        }
        else
        {
          uint64_t v14 = [MEMORY[0x1E4F28ED0] numberWithDouble:9.0];
          double v15 = v14;
          unint64_t v16 = 0;
        }
        uint64_t v8 = +[SSRankingManager getRecencyIntervalForBundleType:intervalType:indexRequired:]((uint64_t)SSRankingManager, v15, 2, v16);

        goto LABEL_14;
      }
      NSUInteger v7 = @"default";
    }
    uint64_t v8 = +[SSRankingManager getRecencyIntervalForBundleId:intervalType:indexRequired:]((uint64_t)SSRankingManager, v7, 2, 0xFFFFFFFFFFFFFFFFLL);
LABEL_14:
    [v5 timeIntervalSinceReferenceDate];
    uint64_t v2 = v9 - a2 > (double)v8;
LABEL_16:

    goto LABEL_17;
  }
  return v2;
}

- (uint64_t)recencyTestForAboveThresholdTopHitWithCurrentTime:(void *)a1
{
  BOOL v2 = (BOOL)a1;
  if (!a1) {
    return v2;
  }
  uint64_t v4 = a1[55];
  if ((v4 & 0x200) != 0)
  {
    uint64_t v6 = [a1 interestingDate];
    NSUInteger v7 = [(id)v2 L2FeatureVector];
    [v7 scoreForFeature:1881];
    uint64_t v9 = (uint64_t)v8;

    if (v9 < 51)
    {
      float v10 = [MEMORY[0x1E4F28ED0] numberWithDouble:9.0];
      uint64_t v11 = v10;
      if (v9 < 6) {
        unint64_t v12 = 2;
      }
      else {
        unint64_t v12 = 1;
      }
    }
    else
    {
      float v10 = [MEMORY[0x1E4F28ED0] numberWithDouble:9.0];
      uint64_t v11 = v10;
      unint64_t v12 = 0;
    }
    uint64_t v18 = +[SSRankingManager getRecencyIntervalForBundleType:intervalType:indexRequired:]((uint64_t)SSRankingManager, v11, 0, v12);

    double v14 = (double)v18;
    goto LABEL_17;
  }
  if ((v4 & 8) != 0)
  {
    uint64_t v6 = [a1 interestingDate];
    float v13 = [MEMORY[0x1E4F28ED0] numberWithDouble:3.0];
    double v14 = (double)+[SSRankingManager getRecencyIntervalForBundleType:intervalType:indexRequired:]((uint64_t)SSRankingManager, v13, 0, 0xFFFFFFFFFFFFFFFFLL);

LABEL_17:
    [v6 timeIntervalSinceReferenceDate];
    BOOL v2 = v19 - a2 > v14;

    return v2;
  }
  if ((v4 & 0x800) != 0)
  {
    uint64_t v6 = [a1 interestingDate];
    unint64_t v15 = sIsiPad == 0;
    unint64_t v16 = [MEMORY[0x1E4F28ED0] numberWithDouble:11.0];
    uint64_t v17 = +[SSRankingManager getRecencyIntervalForBundleType:intervalType:indexRequired:]((uint64_t)SSRankingManager, v16, 0, v15);

    double v14 = (double)v17;
    goto LABEL_17;
  }
  if ((v4 & 0x100) != 0)
  {
    [a1 mostRecentUsedDate];
    double v21 = v20;
    unsigned int v22 = [(id)v2 L2FeatureVector];
    [v22 scoreForFeature:326];
    uint64_t v24 = (uint64_t)v23;

    if (v24 <= 10)
    {
      double v25 = [MEMORY[0x1E4F28ED0] numberWithDouble:8.0];
      char v26 = v25;
      unint64_t v27 = v24 < 2 ? 2 : 1;
    }
    else
    {
      double v25 = [MEMORY[0x1E4F28ED0] numberWithDouble:8.0];
      char v26 = v25;
      unint64_t v27 = 0;
    }
    uint64_t v28 = +[SSRankingManager getRecencyIntervalForBundleType:intervalType:indexRequired:]((uint64_t)SSRankingManager, v26, 0, v27);

    if (v21 - a2 > (double)v28) {
      return 1;
    }
    unint64_t v29 = objc_msgSend((id)v2, "interestingDate", (double)v28, v21 - a2);
    unint64_t v30 = [MEMORY[0x1E4F28ED0] numberWithDouble:8.0];
    double v31 = (double)+[SSRankingManager getRecencyIntervalForBundleType:intervalType:indexRequired:]((uint64_t)SSRankingManager, v30, 0, 3uLL);

    [v29 timeIntervalSinceReferenceDate];
    double v33 = v32 - a2;

    if (v33 > v31) {
      return 1;
    }
  }
  return -[PRSRankingItem recencyTestForVisibilityWithCurrentTime:](v2, a2);
}

- (void)setSuggestionBundleIDType
{
  self->_bundleIDType |= 0x80000uLL;
}

- (BOOL)isInSectionWithRankCategory:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    if ([v4 hasPrefix:@"__bundle_id__"])
    {
      uint64_t v6 = [v5 substringFromIndex:objc_msgSend(@"__bundle_id__", "length")];

      int v7 = [v6 isEqualToString:@"com.apple.mobileslideshow"];
      sectionBundleIdentifier = self->_sectionBundleIdentifier;
      if (v7) {
        char IsSyndicatedPhotos = SSSectionIsSyndicatedPhotos(sectionBundleIdentifier);
      }
      else {
        char IsSyndicatedPhotos = [(NSString *)sectionBundleIdentifier isEqualToString:v6];
      }
      LOBYTE(v10) = IsSyndicatedPhotos;
      id v5 = v6;
    }
    else if ([(NSString *)self->_contentType isEqualToString:v5])
    {
      LOBYTE(v10) = 1;
    }
    else
    {
      uint64_t v11 = SSCompactRankingAttrsGetValue((int8x8_t *)self->_attributes, 0x1BuLL);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && [v11 count])
      {
        unint64_t v12 = 0;
        do
        {
          float v13 = [v11 objectAtIndex:v12];
          int v10 = [v13 isEqualToString:v5];

          if (v10) {
            break;
          }
          ++v12;
        }
        while (v12 < [v11 count]);
      }
      else
      {
        LOBYTE(v10) = 0;
      }
    }
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (id)rankingFeedbackBundleID
{
  p_isa = self->_sectionBundleIdentifier;
  if ([(NSString *)p_isa isEqualToString:@"com.apple.DocumentsApp"])
  {
    id v4 = @"com.apple.CloudDocs.MobileDocumentsFileProvider";

    p_isa = &v4->isa;
  }
  if ([(NSString *)p_isa hasPrefix:@"com.apple.searchd.syndicated"]
    && ![(NSString *)p_isa isEqualToString:@"com.apple.searchd.syndicatedLinks"])
  {
    unint64_t bundleIDType = self->_bundleIDType;
    if ((bundleIDType & 0x40000) == 0)
    {
      if ((bundleIDType & 0x4000000) != 0)
      {
        uint64_t v6 = PRSRankingMessagesBundleString;
        goto LABEL_14;
      }
      if ((bundleIDType & 0x8000000) != 0)
      {
        uint64_t v6 = PRSRankingNotesBundleString;
        goto LABEL_14;
      }
      if ((bundleIDType & 0x10000000) != 0)
      {
        uint64_t v6 = PRSRankingFilesBundleString;
        goto LABEL_14;
      }
      if ((bundleIDType & 0x2000000) == 0) {
        goto LABEL_15;
      }
    }
    uint64_t v6 = PRSRankingPhotosAppBundleString;
LABEL_14:
    int v7 = *v6;

    p_isa = &v7->isa;
  }
LABEL_15:
  return p_isa;
}

- (BOOL)isTopHit
{
  return BYTE1(self->_bundleIDType) >> 7;
}

- (unint64_t)attrType:(id)a3 seenAuthorEmail:(BOOL)a4 seenPrimaryRecipientEmail:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v7 = a3;
  if ([v7 isEqualToString:*MEMORY[0x1E4F22CE8]])
  {
    unint64_t v8 = 2;
    goto LABEL_44;
  }
  if ([v7 isEqualToString:*MEMORY[0x1E4F23658]])
  {
    unint64_t v8 = 0x200000000;
    goto LABEL_44;
  }
  if ([v7 isEqualToString:*MEMORY[0x1E4F235C0]])
  {
    unint64_t v8 = 4;
    goto LABEL_44;
  }
  if ([v7 isEqualToString:*MEMORY[0x1E4F22B30]])
  {
    unint64_t v8 = 8;
    goto LABEL_44;
  }
  if ([v7 isEqualToString:*MEMORY[0x1E4F22AD8]])
  {
    unint64_t v8 = 16;
    goto LABEL_44;
  }
  if ([v7 isEqualToString:*MEMORY[0x1E4F234B0]])
  {
    unint64_t v8 = 32;
    goto LABEL_44;
  }
  if ([v7 isEqualToString:*MEMORY[0x1E4F22A68]])
  {
    unint64_t v8 = 64;
    goto LABEL_44;
  }
  if ([v7 isEqualToString:*MEMORY[0x1E4F23160]])
  {
    unint64_t v8 = 0x100000;
    goto LABEL_44;
  }
  if ([v7 isEqualToString:*MEMORY[0x1E4F22A78]])
  {
    unint64_t v8 = 128;
    goto LABEL_44;
  }
  if ([v7 isEqualToString:*MEMORY[0x1E4F22C58]])
  {
    unint64_t v8 = 0x100000000;
    goto LABEL_44;
  }
  if ([v7 isEqualToString:*MEMORY[0x1E4F22CD0]])
  {
    unint64_t v8 = 0x1000000000;
    goto LABEL_44;
  }
  if ([v7 isEqualToString:*MEMORY[0x1E4F23190]])
  {
    unint64_t v8 = 256;
    goto LABEL_44;
  }
  if ([v7 isEqualToString:*MEMORY[0x1E4F230C8]])
  {
    unint64_t v8 = 0x200000;
    goto LABEL_44;
  }
  if ([v7 isEqualToString:*MEMORY[0x1E4F22C08]])
  {
    unint64_t v8 = 1024;
    goto LABEL_44;
  }
  if ([v7 isEqualToString:*MEMORY[0x1E4F23060]])
  {
    unint64_t v8 = 2048;
    goto LABEL_44;
  }
  if ([v7 isEqualToString:*MEMORY[0x1E4F22FD0]])
  {
    unint64_t v8 = 4096;
    goto LABEL_44;
  }
  if ([v7 isEqualToString:*MEMORY[0x1E4F23158]])
  {
    unint64_t v8 = 0x2000;
    goto LABEL_44;
  }
  if ([v7 isEqualToString:*MEMORY[0x1E4F22AE0]])
  {
    unint64_t v8 = 0x4000;
    goto LABEL_44;
  }
  if ([v7 isEqualToString:*MEMORY[0x1E4F22B18]])
  {
    BOOL v9 = !v6;
    uint64_t v10 = 0x8000;
    uint64_t v11 = 0x10000;
    goto LABEL_41;
  }
  if ([v7 isEqualToString:*MEMORY[0x1E4F233C8]])
  {
    BOOL v9 = !v5;
    uint64_t v10 = 0x20000;
    uint64_t v11 = 0x40000;
LABEL_41:
    if (v9) {
      unint64_t v8 = v10;
    }
    else {
      unint64_t v8 = v11;
    }
    goto LABEL_44;
  }
  if ([v7 isEqualToString:*MEMORY[0x1E4F232E0]]) {
    goto LABEL_46;
  }
  if ([v7 isEqualToString:*MEMORY[0x1E4F23250]])
  {
    unint64_t v8 = 0x4000000;
    goto LABEL_44;
  }
  if ([v7 isEqualToString:*MEMORY[0x1E4F23248]])
  {
    unint64_t v8 = 0x800000;
    goto LABEL_44;
  }
  if ([v7 isEqualToString:*MEMORY[0x1E4F232D8]])
  {
LABEL_46:
    unint64_t v8 = 0x400000000;
  }
  else if ([v7 isEqualToString:*MEMORY[0x1E4F23278]])
  {
    unint64_t v8 = 0x8000000;
  }
  else if ([v7 isEqualToString:*MEMORY[0x1E4F23270]])
  {
    unint64_t v8 = 0x1000000;
  }
  else if ([v7 isEqualToString:*MEMORY[0x1E4F23280]])
  {
    unint64_t v8 = 0x10000000;
  }
  else if ([v7 isEqualToString:*MEMORY[0x1E4F232F8]])
  {
    unint64_t v8 = 0x800000000;
  }
  else if ([v7 isEqualToString:*MEMORY[0x1E4F23340]])
  {
    unint64_t v8 = 0x2000000;
  }
  else if ([v7 isEqualToString:*MEMORY[0x1E4F23350]])
  {
    unint64_t v8 = 0x80000;
  }
  else if ([v7 isEqualToString:*MEMORY[0x1E4F23370]])
  {
    unint64_t v8 = 0x40000000;
  }
  else if ([v7 isEqualToString:*MEMORY[0x1E4F23298]])
  {
    unint64_t v8 = 0x80000000;
  }
  else if ([v7 isEqualToString:*MEMORY[0x1E4F232C0]])
  {
    unint64_t v8 = 0x20000000;
  }
  else if ([v7 isEqualToString:*MEMORY[0x1E4F232A0]])
  {
    unint64_t v8 = 0x2000000000;
  }
  else if ([v7 isEqualToString:*MEMORY[0x1E4F232B0]])
  {
    unint64_t v8 = 0x200000000000;
  }
  else if ([v7 isEqualToString:*MEMORY[0x1E4F23378]])
  {
    unint64_t v8 = 0x4000000000;
  }
  else if ([v7 isEqualToString:*MEMORY[0x1E4F23260]])
  {
    unint64_t v8 = 0x8000000000;
  }
  else
  {
    uint64_t v13 = *MEMORY[0x1E4F22A20];
    if ([v7 isEqualToString:*MEMORY[0x1E4F22A20]])
    {
      unint64_t v8 = 0x10000000000;
    }
    else if ([v7 isEqualToString:v13])
    {
      unint64_t v8 = 0x20000000000;
    }
    else if ([v7 isEqualToString:*MEMORY[0x1E4F22FC0]])
    {
      unint64_t v8 = 0x40000000000;
    }
    else if ([v7 isEqualToString:*MEMORY[0x1E4F22D18]])
    {
      unint64_t v8 = 0x80000000000;
    }
    else if ([v7 isEqualToString:*MEMORY[0x1E4F22D00]])
    {
      unint64_t v8 = 0x100000000000;
    }
    else if ([v7 isEqualToString:*MEMORY[0x1E4F236D8]])
    {
      unint64_t v8 = 512;
    }
    else
    {
      unint64_t v8 = 0;
    }
  }
LABEL_44:

  return v8;
}

- (void)updateAttrCountsPrefix:(unsigned __int16 *)a3 queryTermCount:(unint64_t)a4 attrType:(unint64_t)a5
{
  if (!a4 || !a5) {
    return;
  }
  attrCountsPrefix = self->_attrCountsPrefix;
  if (attrCountsPrefix)
  {
    int64_t queryTermCount = self->_queryTermCount;
  }
  else
  {
    attrCountsPrefix = (unint64_t *)malloc_type_calloc(a4, 8uLL, 0x100004000313F17uLL);
    self->_attrCountsPrefix = attrCountsPrefix;
    int64_t queryTermCount = self->_queryTermCount;
    if (queryTermCount < 0)
    {
      p_int64_t queryTermCount = &self->_queryTermCount;
      goto LABEL_11;
    }
  }
  if (queryTermCount == a4) {
    goto LABEL_12;
  }
  p_int64_t queryTermCount = &self->_queryTermCount;
  if (attrCountsPrefix) {
    free(attrCountsPrefix);
  }
  self->_attrCountsPrefix = (unint64_t *)malloc_type_calloc(a4, 8uLL, 0x100004000313F17uLL);
LABEL_11:
  *p_int64_t queryTermCount = a4;
LABEL_12:
  if (a3)
  {
    uint64_t v12 = 0;
    do
    {
      if (a3[v12]) {
        self->_attrCountsPrefix[v12] |= a5;
      }
      ++v12;
    }
    while (a4 != v12);
  }
}

- (void)updateAttrCountsWord:(unsigned __int16 *)a3 queryTermCount:(unint64_t)a4 attrType:(unint64_t)a5
{
  if (!a4 || !a5) {
    return;
  }
  attrCountsWord = self->_attrCountsWord;
  if (attrCountsWord)
  {
    int64_t queryTermCount = self->_queryTermCount;
  }
  else
  {
    attrCountsWord = (unint64_t *)malloc_type_calloc(a4, 8uLL, 0x100004000313F17uLL);
    self->_attrCountsWord = attrCountsWord;
    int64_t queryTermCount = self->_queryTermCount;
    if (queryTermCount < 0)
    {
      p_int64_t queryTermCount = &self->_queryTermCount;
      goto LABEL_11;
    }
  }
  if (queryTermCount == a4) {
    goto LABEL_12;
  }
  p_int64_t queryTermCount = &self->_queryTermCount;
  if (attrCountsWord) {
    free(attrCountsWord);
  }
  self->_attrCountsWord = (unint64_t *)malloc_type_calloc(a4, 8uLL, 0x100004000313F17uLL);
LABEL_11:
  *p_int64_t queryTermCount = a4;
LABEL_12:
  if (a3)
  {
    uint64_t v12 = 0;
    do
    {
      if (a3[v12]) {
        self->_attrCountsWord[v12] |= a5;
      }
      ++v12;
    }
    while (a4 != v12);
  }
}

- (void)updateAttrCountsPrefixLast:(unsigned __int16 *)a3 termsDidMatchPrefix:(unsigned __int16 *)a4 queryTermCount:(unint64_t)a5 attrType:(unint64_t)a6
{
  if (!a5 || !a6) {
    return;
  }
  attrCountsPrefixLast = self->_attrCountsPrefixLast;
  if (attrCountsPrefixLast)
  {
    int64_t queryTermCount = self->_queryTermCount;
  }
  else
  {
    attrCountsPrefixLast = (unint64_t *)malloc_type_calloc(a5, 8uLL, 0x100004000313F17uLL);
    self->_attrCountsPrefixLast = attrCountsPrefixLast;
    int64_t queryTermCount = self->_queryTermCount;
    if (queryTermCount < 0)
    {
      p_int64_t queryTermCount = &self->_queryTermCount;
LABEL_11:
      *p_int64_t queryTermCount = a5;
      goto LABEL_12;
    }
  }
  if (queryTermCount != a5)
  {
    p_int64_t queryTermCount = &self->_queryTermCount;
    if (attrCountsPrefixLast) {
      free(attrCountsPrefixLast);
    }
    self->_attrCountsPrefixLast = (unint64_t *)malloc_type_calloc(a5, 8uLL, 0x100004000313F17uLL);
    goto LABEL_11;
  }
LABEL_12:
  if (a3)
  {
    uint64_t v14 = 0;
    do
    {
      if (a3[v14]) {
        self->_attrCountsPrefixLast[v14] |= a6;
      }
      ++v14;
    }
    while (a5 != v14);
  }
  if (a4)
  {
    if (a4[a5 - 1]) {
      self->_attrCountsPrefixLast[a5 - 1] |= a6;
    }
  }
}

- (void)updateAttrCountsPrefix2:(unsigned __int16 *)a3 queryTermCount:(unint64_t)a4 attrType:(unint64_t)a5
{
  if (a4 < 2 || !a5) {
    return;
  }
  attrCountsPrefix2 = self->_attrCountsPrefix2;
  if (attrCountsPrefix2)
  {
    int64_t queryTermCount = self->_queryTermCount;
  }
  else
  {
    attrCountsPrefix2 = (unint64_t *)malloc_type_calloc(a4, 8uLL, 0x100004000313F17uLL);
    self->_attrCountsPrefix2 = attrCountsPrefix2;
    int64_t queryTermCount = self->_queryTermCount;
    if (queryTermCount < 0)
    {
      p_int64_t queryTermCount = &self->_queryTermCount;
      goto LABEL_11;
    }
  }
  if (queryTermCount == a4) {
    goto LABEL_12;
  }
  p_int64_t queryTermCount = &self->_queryTermCount;
  if (attrCountsPrefix2) {
    free(attrCountsPrefix2);
  }
  self->_attrCountsPrefix2 = (unint64_t *)malloc_type_calloc(a4, 8uLL, 0x100004000313F17uLL);
LABEL_11:
  *p_int64_t queryTermCount = a4;
LABEL_12:
  if (a3)
  {
    uint64_t v12 = 0;
    do
    {
      if (v12 && a3[v12 - 1])
      {
        if (a3[v12]) {
          self->_attrCountsPrefix2[v12 - 1] |= a5;
        }
      }
      ++v12;
    }
    while (a4 != v12);
  }
}

- (void)updateAttrCountsWord2:(unsigned __int16 *)a3 queryTermCount:(unint64_t)a4 attrType:(unint64_t)a5
{
  if (a4 < 2 || !a5) {
    return;
  }
  attrCountsWord2 = self->_attrCountsWord2;
  if (attrCountsWord2)
  {
    int64_t queryTermCount = self->_queryTermCount;
  }
  else
  {
    attrCountsWord2 = (unint64_t *)malloc_type_calloc(a4, 8uLL, 0x100004000313F17uLL);
    self->_attrCountsWord2 = attrCountsWord2;
    int64_t queryTermCount = self->_queryTermCount;
    if (queryTermCount < 0)
    {
      p_int64_t queryTermCount = &self->_queryTermCount;
      goto LABEL_11;
    }
  }
  if (queryTermCount == a4) {
    goto LABEL_12;
  }
  p_int64_t queryTermCount = &self->_queryTermCount;
  if (attrCountsWord2) {
    free(attrCountsWord2);
  }
  self->_attrCountsWord2 = (unint64_t *)malloc_type_calloc(a4, 8uLL, 0x100004000313F17uLL);
LABEL_11:
  *p_int64_t queryTermCount = a4;
LABEL_12:
  if (a3)
  {
    uint64_t v12 = 0;
    do
    {
      if (v12 && a3[v12 - 1])
      {
        if (a3[v12]) {
          self->_attrCountsWord2[v12 - 1] |= a5;
        }
      }
      ++v12;
    }
    while (a4 != v12);
  }
}

- (void)updateAttrCountsPrefixLast2:(unsigned __int16 *)a3 termsDidMatchPrefix:(unsigned __int16 *)a4 queryTermCount:(unint64_t)a5 attrType:(unint64_t)a6
{
  unint64_t v6 = a5 - 2;
  if (a5 < 2 || !a6) {
    return;
  }
  attrCountsPrefixLast2 = self->_attrCountsPrefixLast2;
  if (attrCountsPrefixLast2)
  {
    int64_t queryTermCount = self->_queryTermCount;
  }
  else
  {
    attrCountsPrefixLast2 = (unint64_t *)malloc_type_calloc(a5, 8uLL, 0x100004000313F17uLL);
    self->_attrCountsPrefixLast2 = attrCountsPrefixLast2;
    int64_t queryTermCount = self->_queryTermCount;
    if (queryTermCount < 0)
    {
      p_int64_t queryTermCount = &self->_queryTermCount;
LABEL_11:
      *p_int64_t queryTermCount = a5;
      goto LABEL_12;
    }
  }
  if (queryTermCount != a5)
  {
    p_int64_t queryTermCount = &self->_queryTermCount;
    if (attrCountsPrefixLast2) {
      free(attrCountsPrefixLast2);
    }
    self->_attrCountsPrefixLast2 = (unint64_t *)malloc_type_calloc(a5, 8uLL, 0x100004000313F17uLL);
    goto LABEL_11;
  }
LABEL_12:
  if (a3)
  {
    uint64_t v15 = 0;
    do
    {
      if (v15 && a3[v15] && a3[v15 - 1]) {
        self->_attrCountsPrefixLast2[v15 - 1] |= a6;
      }
      ++v15;
    }
    while (a5 != v15);
  }
  if (a4 && a4[a5 - 1])
  {
    if (a3[v6]) {
      self->_attrCountsPrefixLast2[v6] |= a6;
    }
  }
}

- (void)updateAttrCountsPrefix3:(unsigned __int16 *)a3 queryTermCount:(unint64_t)a4 attrType:(unint64_t)a5
{
  if (a4 < 3 || !a5) {
    return;
  }
  attrCountsPrefix3 = self->_attrCountsPrefix3;
  if (attrCountsPrefix3)
  {
    int64_t queryTermCount = self->_queryTermCount;
  }
  else
  {
    attrCountsPrefix3 = (unint64_t *)malloc_type_calloc(a4, 8uLL, 0x100004000313F17uLL);
    self->_attrCountsPrefix3 = attrCountsPrefix3;
    int64_t queryTermCount = self->_queryTermCount;
    if (queryTermCount < 0)
    {
      p_int64_t queryTermCount = &self->_queryTermCount;
      goto LABEL_11;
    }
  }
  if (queryTermCount == a4) {
    goto LABEL_12;
  }
  p_int64_t queryTermCount = &self->_queryTermCount;
  if (attrCountsPrefix3) {
    free(attrCountsPrefix3);
  }
  self->_attrCountsPrefix3 = (unint64_t *)malloc_type_calloc(a4, 8uLL, 0x100004000313F17uLL);
LABEL_11:
  *p_int64_t queryTermCount = a4;
LABEL_12:
  if (a3)
  {
    unint64_t v12 = 0;
    do
    {
      if (v12 >= 2)
      {
        uint64_t v13 = &a3[v12];
        if (*(v13 - 2))
        {
          if (*(v13 - 1))
          {
            if (a3[v12]) {
              self->_attrCountsPrefix3[v12 - 2] |= a5;
            }
          }
        }
      }
      ++v12;
    }
    while (a4 != v12);
  }
}

- (void)updateAttrCountsWord3:(unsigned __int16 *)a3 queryTermCount:(unint64_t)a4 attrType:(unint64_t)a5
{
  if (a4 < 3 || !a5) {
    return;
  }
  attrCountsWord3 = self->_attrCountsWord3;
  if (attrCountsWord3)
  {
    int64_t queryTermCount = self->_queryTermCount;
  }
  else
  {
    attrCountsWord3 = (unint64_t *)malloc_type_calloc(a4, 8uLL, 0x100004000313F17uLL);
    self->_attrCountsWord3 = attrCountsWord3;
    int64_t queryTermCount = self->_queryTermCount;
    if (queryTermCount < 0)
    {
      p_int64_t queryTermCount = &self->_queryTermCount;
      goto LABEL_11;
    }
  }
  if (queryTermCount == a4) {
    goto LABEL_12;
  }
  p_int64_t queryTermCount = &self->_queryTermCount;
  if (attrCountsWord3) {
    free(attrCountsWord3);
  }
  self->_attrCountsWord3 = (unint64_t *)malloc_type_calloc(a4, 8uLL, 0x100004000313F17uLL);
LABEL_11:
  *p_int64_t queryTermCount = a4;
LABEL_12:
  if (a3)
  {
    unint64_t v12 = 0;
    do
    {
      if (v12 >= 2)
      {
        uint64_t v13 = &a3[v12];
        if (*(v13 - 2))
        {
          if (*(v13 - 1))
          {
            if (a3[v12]) {
              self->_attrCountsWord3[v12 - 2] |= a5;
            }
          }
        }
      }
      ++v12;
    }
    while (a4 != v12);
  }
}

- (void)updateAttrCountsPrefixLast3:(unsigned __int16 *)a3 termsDidMatchPrefix:(unsigned __int16 *)a4 queryTermCount:(unint64_t)a5 attrType:(unint64_t)a6
{
  unint64_t v6 = a5 - 3;
  if (a5 < 3 || !a6) {
    return;
  }
  attrCountsPrefixLast3 = self->_attrCountsPrefixLast3;
  if (attrCountsPrefixLast3)
  {
    int64_t queryTermCount = self->_queryTermCount;
  }
  else
  {
    attrCountsPrefixLast3 = (unint64_t *)malloc_type_calloc(a5, 8uLL, 0x100004000313F17uLL);
    self->_attrCountsPrefixLast3 = attrCountsPrefixLast3;
    int64_t queryTermCount = self->_queryTermCount;
    if (queryTermCount < 0)
    {
      p_int64_t queryTermCount = &self->_queryTermCount;
LABEL_11:
      *p_int64_t queryTermCount = a5;
      goto LABEL_12;
    }
  }
  if (queryTermCount != a5)
  {
    p_int64_t queryTermCount = &self->_queryTermCount;
    if (attrCountsPrefixLast3) {
      free(attrCountsPrefixLast3);
    }
    self->_attrCountsPrefixLast3 = (unint64_t *)malloc_type_calloc(a5, 8uLL, 0x100004000313F17uLL);
    goto LABEL_11;
  }
LABEL_12:
  if (a3)
  {
    unint64_t v15 = 0;
    do
    {
      if (v15 >= 2)
      {
        if (a3[v15])
        {
          unint64_t v16 = &a3[v15];
          if (*(v16 - 2))
          {
            if (*(v16 - 1)) {
              self->_attrCountsPrefixLast3[v15 - 2] |= a6;
            }
          }
        }
      }
      ++v15;
    }
    while (a5 != v15);
  }
  if (a4 && a4[a5 - 1] && a3[v6])
  {
    if (a3[a5 - 2]) {
      self->_attrCountsPrefixLast3[v6] |= a6;
    }
  }
}

- (unint64_t)attrCountWord:(unint64_t)a3
{
  attrCountsWord = self->_attrCountsWord;
  if (attrCountsWord && self->_queryTermCount > (int64_t)a3) {
    return attrCountsWord[a3];
  }
  else {
    return 0;
  }
}

- (unint64_t)attrCountPrefix:(unint64_t)a3
{
  attrCountsPrefix = self->_attrCountsPrefix;
  if (attrCountsPrefix && self->_queryTermCount > (int64_t)a3) {
    return attrCountsPrefix[a3];
  }
  else {
    return 0;
  }
}

- (unint64_t)attrCountPrefixLast:(unint64_t)a3
{
  attrCountsPrefixLast = self->_attrCountsPrefixLast;
  if (attrCountsPrefixLast && self->_queryTermCount > (int64_t)a3) {
    return attrCountsPrefixLast[a3];
  }
  else {
    return 0;
  }
}

- (unint64_t)attrCountWord2:(unint64_t)a3
{
  attrCountsWord2 = self->_attrCountsWord2;
  if (attrCountsWord2 && self->_queryTermCount > (int64_t)a3) {
    return attrCountsWord2[a3];
  }
  else {
    return 0;
  }
}

- (unint64_t)attrCountPrefix2:(unint64_t)a3
{
  attrCountsPrefix2 = self->_attrCountsPrefix2;
  if (attrCountsPrefix2 && self->_queryTermCount > (int64_t)a3) {
    return attrCountsPrefix2[a3];
  }
  else {
    return 0;
  }
}

- (unint64_t)attrCountPrefixLast2:(unint64_t)a3
{
  attrCountsPrefixLast2 = self->_attrCountsPrefixLast2;
  if (attrCountsPrefixLast2 && self->_queryTermCount > (int64_t)a3) {
    return attrCountsPrefixLast2[a3];
  }
  else {
    return 0;
  }
}

- (unint64_t)attrCountWord3:(unint64_t)a3
{
  attrCountsWord3 = self->_attrCountsWord3;
  if (attrCountsWord3 && self->_queryTermCount > (int64_t)a3) {
    return attrCountsWord3[a3];
  }
  else {
    return 0;
  }
}

- (unint64_t)attrCountPrefix3:(unint64_t)a3
{
  attrCountsPrefix3 = self->_attrCountsPrefix3;
  if (attrCountsPrefix3 && self->_queryTermCount > (int64_t)a3) {
    return attrCountsPrefix3[a3];
  }
  else {
    return 0;
  }
}

- (unint64_t)attrCountPrefixLast3:(unint64_t)a3
{
  attrCountsPrefixLast3 = self->_attrCountsPrefixLast3;
  if (attrCountsPrefixLast3 && self->_queryTermCount > (int64_t)a3) {
    return attrCountsPrefixLast3[a3];
  }
  else {
    return 0;
  }
}

- (uint64_t)attrCountWord:(uint64_t)a3 queryTermCount:
{
  uint64_t result = 0;
  if (a1 && a2)
  {
    BOOL v5 = *(uint64_t **)(a1 + 480);
    if (!v5) {
      return 0;
    }
    uint64_t v6 = *(void *)(a1 + 464);
    if (v6 <= 0 || v6 >= a3) {
      uint64_t v6 = a3;
    }
    if (v6)
    {
      uint64_t result = 0;
      do
      {
        uint64_t v8 = *v5++;
        if ((v8 & a2) != 0) {
          ++result;
        }
        --v6;
      }
      while (v6);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (uint64_t)attrCountPrefix:(uint64_t)a3 queryTermCount:
{
  uint64_t result = 0;
  if (a1 && a2)
  {
    BOOL v5 = *(uint64_t **)(a1 + 472);
    if (!v5) {
      return 0;
    }
    uint64_t v6 = *(void *)(a1 + 464);
    if (v6 <= 0 || v6 >= a3) {
      uint64_t v6 = a3;
    }
    if (v6)
    {
      uint64_t result = 0;
      do
      {
        uint64_t v8 = *v5++;
        if ((v8 & a2) != 0) {
          ++result;
        }
        --v6;
      }
      while (v6);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (uint64_t)attrCountPrefixLast:(uint64_t)a3 queryTermCount:
{
  uint64_t result = 0;
  if (a1 && a2)
  {
    BOOL v5 = *(uint64_t **)(a1 + 488);
    if (!v5) {
      return 0;
    }
    uint64_t v6 = *(void *)(a1 + 464);
    if (v6 <= 0 || v6 >= a3) {
      uint64_t v6 = a3;
    }
    if (v6)
    {
      uint64_t result = 0;
      do
      {
        uint64_t v8 = *v5++;
        if ((v8 & a2) != 0) {
          ++result;
        }
        --v6;
      }
      while (v6);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (void)setBundleIDType:(unint64_t)a3
{
  self->_unint64_t bundleIDType = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (float)rawScore
{
  return self->_rawScore;
}

- (void)setRawScore:(float)a3
{
  self->_rawScore = a3;
}

- (float)feedbackScore
{
  return self->_feedbackScore;
}

- (void)setFeedbackScore:(float)a3
{
  self->_feedbackScore = a3;
}

- (float)score
{
  return self->_score;
}

- (void)setScore:(float)a3
{
  self->_score = a3;
}

- (float)withinBundleScore
{
  return self->_withinBundleScore;
}

- (void)setWithinBundleScore:(float)a3
{
  self->_float withinBundleScore = a3;
}

- (double)suggestionScore
{
  return self->_suggestionScore;
}

- (void)setSuggestionScore:(double)a3
{
  self->_suggestionScore = a3;
}

- (double)engagementScore
{
  return self->_engagementScore;
}

- (void)setEngagementScore:(double)a3
{
  self->_engagementScore = a3;
}

- (double)topicalityScore
{
  return self->_topicalityScore;
}

- (void)setTopicalityScore:(double)a3
{
  self->_topicalityScore = a3;
}

- (double)freshnessScore
{
  return self->_freshnessScore;
}

- (void)setFreshnessScore:(double)a3
{
  self->_freshnessScore = a3;
}

- (double)likelihood
{
  return self->_likelihood;
}

- (void)setLikelihood:(double)a3
{
  self->_likelihood = a3;
}

- (double)finalTopicality
{
  return self->_finalTopicality;
}

- (void)setFinalTopicality:(double)a3
{
  self->_finalTopicality = a3;
}

- (float)keywordMatchScore
{
  return self->_keywordMatchScore;
}

- (void)setKeywordMatchScore:(float)a3
{
  self->_keywordMatchScore = a3;
}

- (BOOL)exactMatchedLaunchString
{
  return self->_exactMatchedLaunchString;
}

- (void)setExactMatchedLaunchString:(BOOL)a3
{
  self->_exactMatchedLaunchString = a3;
}

- (NSArray)recentSimilarIntentEngagementDates
{
  return self->_recentSimilarIntentEngagementDates;
}

- (void)setRecentSimilarIntentEngagementDates:(id)a3
{
}

- (double)mostRecentUseInMinutes
{
  return self->_mostRecentUseInMinutes;
}

- (void)setMostRecentUseInMinutes:(double)a3
{
  self->_mostRecentUseInMinutes = a3;
}

- (NSString)sectionBundleIdentifier
{
  return self->_sectionBundleIdentifier;
}

- (void)setSectionBundleIdentifier:(id)a3
{
}

- (NSString)firstMatchedAltName
{
  return self->_firstMatchedAltName;
}

- (void)setFirstMatchedAltName:(id)a3
{
}

- (NSString)exactMatchedKeyword
{
  return self->_exactMatchedKeyword;
}

- (void)setExactMatchedKeyword:(id)a3
{
}

- (NSString)displayNameInitials
{
  return self->_displayNameInitials;
}

- (void)setDisplayNameInitials:(id)a3
{
}

- (PRSL2FeatureVector)L2FeatureVector
{
  return self->_L2FeatureVector;
}

- (void)setL2FeatureVector:(id)a3
{
}

- (NSData)serverFeaturesJSON
{
  return self->_serverFeaturesJSON;
}

- (void)setServerFeaturesJSON:(id)a3
{
}

- (NSData)serverSuggestionsData
{
  return self->_serverSuggestionsData;
}

- (void)setServerSuggestionsData:(id)a3
{
}

- (NSData)localSuggestionsData
{
  return self->_localSuggestionsData;
}

- (void)setLocalSuggestionsData:(id)a3
{
}

- (BOOL)eligibleForDemotion
{
  return self->_eligibleForDemotion;
}

- (void)setEligibleForDemotion:(BOOL)a3
{
  self->_eligibleForDemotiouint64_t n = a3;
}

- (BOOL)shouldHideUnderShowMore
{
  return self->_shouldHideUnderShowMore;
}

- (void)setShouldHideUnderShowMore:(BOOL)a3
{
  self->_shouldHideUnderShowMore = a3;
}

- (BOOL)shouldHideUnderShowMoreIfNotTophit
{
  return self->_shouldHideUnderShowMoreIfNotTophit;
}

- (void)setShouldHideUnderShowMoreIfNotTophit:(BOOL)a3
{
  self->_shouldHideUnderShowMoreIfNotTophit = a3;
}

- (BOOL)recentForTopHit
{
  return self->_recentForTopHit;
}

- (void)setRecentForTopHit:(BOOL)a3
{
  self->_recentForTopHit = a3;
}

- (BOOL)recentForAboveThresholdTopHit
{
  return self->_recentForAboveThresholdTopHit;
}

- (void)setRecentForAboveThresholdTopHit:(BOOL)a3
{
  self->_recentForAboveThresholdTopHit = a3;
}

- (BOOL)matchedQueryTerms
{
  return self->_matchedQueryTerms;
}

- (void)setMatchedQueryTerms:(BOOL)a3
{
  self->_matchedQueryTerms = a3;
}

- (BOOL)hasPolicyMultipleTermsPhraseMatch
{
  return self->_hasPolicyMultipleTermsPhraseMatch;
}

- (void)setHasPolicyMultipleTermsPhraseMatch:(BOOL)a3
{
  self->_hasPolicyMultipleTermsPhraseMatch = a3;
}

- (BOOL)hasPolicySingleTermPhraseMatch
{
  return self->_hasPolicySingleTermPhraseMatch;
}

- (void)setHasPolicySingleTermPhraseMatch:(BOOL)a3
{
  self->_hasPolicySingleTermPhraseMatch = a3;
}

- (BOOL)hasPolicyMultipleTermsNearMatch
{
  return self->_hasPolicyMultipleTermsNearMatch;
}

- (void)setHasPolicyMultipleTermsNearMatch:(BOOL)a3
{
  self->_hasPolicyMultipleTermsNearMatch = a3;
}

- (BOOL)isSafariTopHit
{
  return self->_isSafariTopHit;
}

- (void)setIsSafariTopHit:(BOOL)a3
{
  self->_isSafariTopHit = a3;
}

- (BOOL)isBundleDemotedForBullseyeCommittedSearch
{
  return self->_isBundleDemotedForBullseyeCommittedSearch;
}

- (void)setIsBundleDemotedForBullseyeCommittedSearch:(BOOL)a3
{
  self->_isBundleDemotedForBullseyeCommittedSearch = a3;
}

- (BOOL)hasShortCut
{
  return self->_hasShortCut;
}

- (void)setHasShortCut:(BOOL)a3
{
  self->_hasShortCut = a3;
}

- (BOOL)wasEngaged
{
  return self->_wasEngaged;
}

- (void)setWasEngaged:(BOOL)a3
{
  self->_wasEngaged = a3;
}

- (BOOL)wasEngagedInSpotlight
{
  return self->_wasEngagedInSpotlight;
}

- (void)setWasEngagedInSpotlight:(BOOL)a3
{
  self->_wasEngagedInSpotlight = a3;
}

- (BOOL)isLocalTopHitCandidate
{
  return self->_isLocalTopHitCandidate;
}

- (void)setIsLocalTopHitCandidate:(BOOL)a3
{
  self->_isLocalTopHitCandidate = a3;
}

- (BOOL)displayNameInitialsPrefixMatchOnly
{
  return self->_displayNameInitialsPrefixMatchOnly;
}

- (void)setDisplayNameInitialsPrefixMatchOnly:(BOOL)a3
{
  self->_displayNameInitialsPrefixMatchOnly = a3;
}

- (BOOL)displayNameInitialsFirstWordAndMoreMatchOnly
{
  return self->_displayNameInitialsFirstWordAndMoreMatchOnly;
}

- (void)setDisplayNameInitialsFirstWordAndMoreMatchOnly:(BOOL)a3
{
  self->_displayNameInitialsFirstWordAndMoreMatchOnly = a3;
}

- (BOOL)vendorNameIsDisplayNamePrefix
{
  return self->_vendorNameIsDisplayNamePrefix;
}

- (void)setVendorNameIsDisplayNamePrefix:(BOOL)a3
{
  self->_vendorNameIsDisplayNamePrefix = a3;
}

- (BOOL)isNotExecutable
{
  return self->_isNotExecutable;
}

- (void)setIsNotExecutable:(BOOL)a3
{
  self->_isNotExecutable = a3;
}

- (BOOL)isKeywordMatch
{
  return self->_isKeywordMatch;
}

- (void)setIsKeywordMatch:(BOOL)a3
{
  self->_isKeywordMatch = a3;
}

- (BOOL)wordMatchedKeyword
{
  return self->_wordMatchedKeyword;
}

- (void)setWordMatchedKeyword:(BOOL)a3
{
  self->_wordMatchedKeyword = a3;
}

- (BOOL)photosMatch
{
  return self->_photosMatch;
}

- (void)setPhotosMatch:(BOOL)a3
{
  self->_photosMatch = a3;
}

- (BOOL)photosExactMatch
{
  return self->_photosExactMatch;
}

- (void)setPhotosExactMatch:(BOOL)a3
{
  self->_photosExactMatch = a3;
}

- (BOOL)isServerAlternativeResult
{
  return self->_isServerAlternativeResult;
}

- (void)setIsServerAlternativeResult:(BOOL)a3
{
  self->_isServerAlternativeResult = a3;
}

- (float)safariMatchScoreContentURL
{
  return self->_safariMatchScoreContentURL;
}

- (void)setSafariMatchScoreContentURL:(float)a3
{
  self->_safariMatchScoreContentURL = a3;
}

- (float)safariMatchScoreTitle
{
  return self->_safariMatchScoreTitle;
}

- (void)setSafariMatchScoreTitle:(float)a3
{
  self->_safariMatchScoreTitle = a3;
}

- (BOOL)spellCorrectedApp
{
  return self->_spellCorrectedApp;
}

- (void)setSpellCorrectedApp:(BOOL)a3
{
  self->_spellCorrectedApp = a3;
}

- (BOOL)matchedQUIntent
{
  return self->_matchedQUIntent;
}

- (void)setMatchedQUIntent:(BOOL)a3
{
  self->_matchedQUIntent = a3;
}

- (BOOL)quIntentAvailable
{
  return self->_quIntentAvailable;
}

- (void)setQuIntentAvailable:(BOOL)a3
{
  self->_quIntentAvailable = a3;
}

- (float)quIntentScore
{
  return self->_quIntentScore;
}

- (void)setQuIntentScore:(float)a3
{
  self->_quIntentScore = a3;
}

- (int)settingsPreferencePriority
{
  return self->_settingsPreferencePriority;
}

- (void)setSettingsPreferencePriority:(int)a3
{
  self->_settingsPreferencePriority = a3;
}

- (BOOL)isMailCategoryHighImpact
{
  return self->_isMailCategoryHighImpact;
}

- (void)setIsMailCategoryHighImpact:(BOOL)a3
{
  self->_isMailCategoryHighImpact = a3;
}

- (BOOL)isMailCategoryDefault
{
  return self->_isMailCategoryDefault;
}

- (void)setIsMailCategoryDefault:(BOOL)a3
{
  self->_isMailCategoryDefault = a3;
}

- (BOOL)isMailCategoryTransactions
{
  return self->_isMailCategoryTransactions;
}

- (void)setIsMailCategoryTransactions:(BOOL)a3
{
  self->_isMailCategoryTransactions = a3;
}

- (BOOL)isMailCategoryUpdates
{
  return self->_isMailCategoryUpdates;
}

- (void)setIsMailCategoryUpdates:(BOOL)a3
{
  self->_isMailCategoryUpdates = a3;
}

- (BOOL)isMailCategoryPromotions
{
  return self->_isMailCategoryPromotions;
}

- (void)setIsMailCategoryPromotions:(BOOL)a3
{
  self->_isMailCategoryPromotions = a3;
}

- (BOOL)isCalendarFlightEventType
{
  return self->_isCalendarFlightEventType;
}

- (void)setIsCalendarFlightEventType:(BOOL)a3
{
  self->_isCalendarFlightEventType = a3;
}

- (BOOL)isCalendarHotelEventType
{
  return self->_isCalendarHotelEventType;
}

- (void)setIsCalendarHotelEventType:(BOOL)a3
{
  self->_isCalendarHotelEventType = a3;
}

- (BOOL)isCalendarRestaurantEventType
{
  return self->_isCalendarRestaurantEventType;
}

- (void)setIsCalendarRestaurantEventType:(BOOL)a3
{
  self->_isCalendarRestaurantEventType = a3;
}

- (BOOL)isCalendarOtherReservationEventType
{
  return self->_isCalendarOtherReservationEventType;
}

- (void)setIsCalendarOtherReservationEventType:(BOOL)a3
{
  self->_isCalendarOtherReservationEventType = a3;
}

- (double)mostRecentUsedDate
{
  return self->_mostRecentUsedDate;
}

- (void)setMostRecentUsedDate:(double)a3
{
  self->_mostRecentUsedDate = a3;
}

- (double)closestUpComingDate
{
  return self->_closestUpComingDate;
}

- (void)setClosestUpComingDate:(double)a3
{
  self->_closestUpComingDate = a3;
}

- (int)topHitReason
{
  return self->_topHitReason;
}

- (void)setTopHitReason:(int)a3
{
  self->_topHitReasouint64_t n = a3;
}

- ($97A5064B8639E9CA0767BE93C2545605)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(id *)a3
{
  self->_attributes = a3;
}

- (float)embeddingSimilarity
{
  return self->_embeddingSimilarity;
}

- (void)setEmbeddingSimilarity:(float)a3
{
  self->_embeddingSimilarity = a3;
}

- (float)calibratedEmbeddingSimilarity
{
  return self->_calibratedEmbeddingSimilarity;
}

- (void)setCalibratedEmbeddingSimilarity:(float)a3
{
  self->_calibratedEmbeddingSimilarity = a3;
}

- (NSDictionary)matchInfo
{
  return self->_matchInfo;
}

- (NSDate)mailDate
{
  return self->_mailDate;
}

- (void)setMailDate:(id)a3
{
}

- (float)pommesL1Score
{
  return self->_pommesL1Score;
}

- (void)setPommesL1Score:(float)a3
{
  self->_double pommesL1Score = a3;
}

- (float)pommesCalibratedL1Score
{
  return self->_pommesCalibratedL1Score;
}

- (void)setPommesCalibratedL1Score:(float)a3
{
  self->_pommesCalibratedL1Score = a3;
}

- (int64_t)itemSparseMatchStrengthType
{
  return self->_itemSparseMatchStrengthType;
}

- (void)setItemSparseMatchStrengthType:(int64_t)a3
{
  self->_itemSparseMatchStrengthType = a3;
}

- (NSNumber)retrievalType
{
  return self->_retrievalType;
}

- (void)setRetrievalType:(id)a3
{
}

- (NSDictionary)l2Features
{
  return self->_l2Features;
}

- (void)setL2Features:(id)a3
{
}

- (float)l2Score
{
  return self->_l2Score;
}

- (void)setL2Score:(float)a3
{
  self->_double l2Score = a3;
}

- (NSData)l2Signals
{
  return self->_l2Signals;
}

- (void)setL2Signals:(id)a3
{
}

- (NSDate)lastUsedDate
{
  return self->_lastUsedDate;
}

- (void)setLastUsedDate:(id)a3
{
}

- (int64_t)startDueDateToNowInSeconds
{
  return self->_startDueDateToNowInSeconds;
}

- (void)setStartDueDateToNowInSeconds:(int64_t)a3
{
  self->_startDueDateToNowInSeconds = a3;
}

- (int64_t)contentCreationDateToNowInSeconds
{
  return self->_contentCreationDateToNowInSeconds;
}

- (void)setContentCreationDateToNowInSeconds:(int64_t)a3
{
  self->_contentCreationDateToNowInSeconds = a3;
}

- (BOOL)isAppEntity
{
  return self->_isAppEntity;
}

- (void)setIsAppEntity:(BOOL)a3
{
  self->_isAppEntity = a3;
}

- (unint64_t)detectedEventType
{
  return self->_detectedEventType;
}

- (void)setDetectedEventType:(unint64_t)a3
{
  self->_detectedEventType = a3;
}

- (int64_t)mostRecentTimeToQueryInDaysForFreshness
{
  return self->_mostRecentTimeToQueryInDaysForFreshness;
}

- (void)setMostRecentTimeToQueryInDaysForFreshness:(int64_t)a3
{
  self->_mostRecentTimeToQueryInDaysForFreshness = a3;
}

- (BOOL)isPromotedInstantAnswer
{
  return self->_isPromotedInstantAnswer;
}

- (void)setIsPromotedInstantAnswer:(BOOL)a3
{
  self->_isPromotedInstantAnswer = a3;
}

- (NSString)preExtractedCardType
{
  return self->_preExtractedCardType;
}

- (void)setPreExtractedCardType:(id)a3
{
}

- (int64_t)itemDenseMatchStrengthType
{
  return self->_itemDenseMatchStrengthType;
}

- (void)setItemDenseMatchStrengthType:(int64_t)a3
{
  self->_itemDenseMatchStrengthType = a3;
}

- (unint64_t)bundleIDType
{
  return self->_bundleIDType;
}

- (uint64_t)importantPropertiesPrefixMatched
{
  if (result) {
    return *(void *)(result + 448);
  }
  return result;
}

- (uint64_t)setImportantPropertiesPrefixMatched:(uint64_t)result
{
  if (result) {
    *(void *)(result + 448) = a2;
  }
  return result;
}

- (uint64_t)importantPropertiesWordMatched
{
  if (result) {
    return *(void *)(result + 456);
  }
  return result;
}

- (uint64_t)setImportantPropertiesWordMatched:(uint64_t)result
{
  if (result) {
    *(void *)(result + 456) = a2;
  }
  return result;
}

- (uint64_t)attrCountsPrefix
{
  if (result) {
    return *(void *)(result + 472);
  }
  return result;
}

- (uint64_t)embedding
{
  if (result) {
    return *(void *)(result + 576);
  }
  return result;
}

- (uint64_t)matchedSenders
{
  if (result) {
    return *(void *)(result + 16);
  }
  return result;
}

- (uint64_t)matchedVipSenders
{
  if (result) {
    return *(void *)(result + 24);
  }
  return result;
}

- (uint64_t)matchedRecipients
{
  if (result) {
    return *(void *)(result + 32);
  }
  return result;
}

- (uint64_t)emailAddresses
{
  if (result) {
    return *(void *)(result + 584);
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emailAddresses, 0);
  objc_storeStrong((id *)&self->_embedding, 0);
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_spanCalculator, 0);
  objc_storeStrong((id *)&self->_preExtractedCardType, 0);
  objc_storeStrong((id *)&self->_interestingDate, 0);
  objc_storeStrong((id *)&self->_lastUsedDate, 0);
  objc_storeStrong((id *)&self->_l2Signals, 0);
  objc_storeStrong((id *)&self->_l2Features, 0);
  objc_storeStrong((id *)&self->_retrievalType, 0);
  objc_storeStrong((id *)&self->_mailDate, 0);
  objc_storeStrong((id *)&self->_matchInfo, 0);
  objc_storeStrong((id *)&self->_localSuggestionsData, 0);
  objc_storeStrong((id *)&self->_serverSuggestionsData, 0);
  objc_storeStrong((id *)&self->_serverFeaturesJSON, 0);
  objc_storeStrong((id *)&self->_L2FeatureVector, 0);
  objc_storeStrong((id *)&self->_displayNameInitials, 0);
  objc_storeStrong((id *)&self->_exactMatchedKeyword, 0);
  objc_storeStrong((id *)&self->_firstMatchedAltName, 0);
  objc_storeStrong((id *)&self->_sectionBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_recentSimilarIntentEngagementDates, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_matchedRecipients, 0);
  objc_storeStrong((id *)&self->_matchedVipSenders, 0);
  objc_storeStrong((id *)&self->_matchedSenders, 0);
}

- (void)didMatchRankingDescriptor:.cold.1()
{
}

- (void)updateNumScoreDescriptorBundleFeatures:feature:featureScoreInfo:.cold.1()
{
}

+ (void)rankingDescriptorForBundleFeature:.cold.1()
{
}

- (void)updateAccumulatedBundleFeatures:values:feature:.cold.1()
{
}

- (void)updateBundleFeatures:withArrValues:featureScoreInfo:.cold.1()
{
}

- (void)populateTextFeatureValuesForProperty:updatingBundleFeatureValues:propertyIndex:withEvaluator:withContext:featureScoreInfo:propertyCanFuzzyMatch:keyboardLanguage:isCJK:featureList:propertyName:seenAuthorEmail:seenPrimaryRecipientEmail:.cold.1()
{
}

+ (void)featureFromVirtualIdx:.cold.1()
{
}

@end
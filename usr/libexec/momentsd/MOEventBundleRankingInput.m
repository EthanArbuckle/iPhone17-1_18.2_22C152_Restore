@interface MOEventBundleRankingInput
- (BOOL)evergreenPromptExists;
- (BOOL)groupConversationFeature;
- (BOOL)isBundleAggregated;
- (BOOL)isRepetitiveContact;
- (BOOL)isSensitivePOI;
- (BOOL)isShortVisit;
- (BOOL)isSignificantContactWithHighSignificanceScore;
- (BOOL)isWorkVisit;
- (BOOL)itemFromMeFeature;
- (BOOL)journalEntryIsCancelled;
- (BOOL)journalEntryIsCreated;
- (BOOL)journalEntryIsDeleted;
- (BOOL)journalEntryIsEdited;
- (BOOL)multipleInteractionTypesFeature;
- (BOOL)suggestionIsDeleted;
- (BOOL)suggestionIsSelected;
- (BOOL)suggestionQuickAddEntry;
- (NSArray)events;
- (NSArray)subSuggestionIDs;
- (NSDate)bundleEndDate;
- (NSDate)bundleStartDate;
- (NSDictionary)bundleRichnessDict;
- (NSSet)allContactIdentifiers;
- (NSSet)allPlaceNames;
- (NSSet)allStateOfMindIdentifiers;
- (NSSet)workoutTypes;
- (NSString)evergreenType;
- (NSUUID)bundleIdentifier;
- (NSUUID)suggestionIdentifier;
- (float)avgSubBundleGoodnessScores;
- (float)bundleRecencyDaysElapsed;
- (float)burstyInteractionCountFeatureNormalized;
- (float)callDurationFeatureNormalized;
- (float)distanceToHomeFeatureNormalized;
- (float)familiarityIndexFeature;
- (float)interestingPOIFeature;
- (float)isBundleActionSpecific;
- (float)isBundlePlaceTypeSpecific;
- (float)isBundleTimeTagSpecific;
- (float)isCoworkerContact;
- (float)isFamilyContact;
- (float)labelConfidenceScoreFeature;
- (float)labelQualityScore;
- (float)labelSpecificityNormalized;
- (float)mediaScoreFeatureNormalized;
- (float)numAnomalyEventsNormalized;
- (float)numAppTypeResourcesNormalized;
- (float)numCoworkersNormalized;
- (float)numFamilyNormalized;
- (float)numFriendsNormalized;
- (float)numInterfaceTagTypeResourcesNormalized;
- (float)numKidsNormalized;
- (float)numMapItemTypeResourcesNormalized;
- (float)numMediaTypeResourcesNormalized;
- (float)numOtherPersonsNormalized;
- (float)numPetsNormalized;
- (float)numPhotoAssetsResourcesNormalized;
- (float)numRoutineEventsNormalized;
- (float)numStateOfMindEventsNormalized;
- (float)numTopicTypeResourcesNormalized;
- (float)numTrendEventsNormalized;
- (float)numUniqueResourceTypesNormalized;
- (float)numValueTypeResourcesNormalized;
- (float)numWebLinkTypeResourcesNormalized;
- (float)numWorkoutIconAssetsNormalized;
- (float)numWorkoutRingAssetsNormalized;
- (float)numWorkoutRouteMapAssetsNormalized;
- (float)peopleCountMaxNormalized;
- (float)peopleCountWeightedAverageNormalized;
- (float)peopleCountWeightedSumNormalized;
- (float)peopleDensityMaxNormalized;
- (float)peopleDensityWeightedAverageNormalized;
- (float)placeNameConfidence;
- (float)shareCountFeatureNormalized;
- (float)stateOfMindDomainCountNormalized;
- (float)stateOfMindLabelCountNormalized;
- (float)stateOfMindLoggedIn3pApp;
- (float)stateOfMindLoggedInJournalApp;
- (float)timeAtHomeDuration;
- (float)timeCorrelationScoreFeature;
- (float)viewCountNormalized;
- (float)workoutDurationFeatureNormalized;
- (id)dictionary;
- (int)contactLocationWorkFeature;
- (unint64_t)bundleInterfaceType;
- (unint64_t)bundleSubType;
- (unint64_t)bundleSuperType;
- (unint64_t)summarizationGranularity;
- (void)_saveToDictionary:(id)a3 object:(id)a4 forKey:(id)a5;
- (void)setAllContactIdentifiers:(id)a3;
- (void)setAllPlaceNames:(id)a3;
- (void)setAllStateOfMindIdentifiers:(id)a3;
- (void)setAvgSubBundleGoodnessScores:(float)a3;
- (void)setBundleEndDate:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setBundleInterfaceType:(unint64_t)a3;
- (void)setBundleRecencyDaysElapsed:(float)a3;
- (void)setBundleRichnessDict:(id)a3;
- (void)setBundleStartDate:(id)a3;
- (void)setBundleSubType:(unint64_t)a3;
- (void)setBundleSuperType:(unint64_t)a3;
- (void)setBurstyInteractionCountFeatureNormalized:(float)a3;
- (void)setCallDurationFeatureNormalized:(float)a3;
- (void)setContactLocationWorkFeature:(int)a3;
- (void)setDistanceToHomeFeatureNormalized:(float)a3;
- (void)setEvents:(id)a3;
- (void)setEvergreenPromptExists:(BOOL)a3;
- (void)setEvergreenType:(id)a3;
- (void)setFamiliarityIndexFeature:(float)a3;
- (void)setGroupConversationFeature:(BOOL)a3;
- (void)setInterestingPOIFeature:(float)a3;
- (void)setIsBundleActionSpecific:(float)a3;
- (void)setIsBundleAggregated:(BOOL)a3;
- (void)setIsBundlePlaceTypeSpecific:(float)a3;
- (void)setIsBundleTimeTagSpecific:(float)a3;
- (void)setIsCoworkerContact:(float)a3;
- (void)setIsFamilyContact:(float)a3;
- (void)setIsRepetitiveContact:(BOOL)a3;
- (void)setIsSensitivePOI:(BOOL)a3;
- (void)setIsShortVisit:(BOOL)a3;
- (void)setIsSignificantContactWithHighSignificanceScore:(BOOL)a3;
- (void)setIsWorkVisit:(BOOL)a3;
- (void)setItemFromMeFeature:(BOOL)a3;
- (void)setJournalEntryIsCancelled:(BOOL)a3;
- (void)setJournalEntryIsCreated:(BOOL)a3;
- (void)setJournalEntryIsDeleted:(BOOL)a3;
- (void)setJournalEntryIsEdited:(BOOL)a3;
- (void)setLabelConfidenceScoreFeature:(float)a3;
- (void)setLabelQualityScore:(float)a3;
- (void)setLabelSpecificityNormalized:(float)a3;
- (void)setMediaScoreFeatureNormalized:(float)a3;
- (void)setMultipleInteractionTypesFeature:(BOOL)a3;
- (void)setNumAnomalyEventsNormalized:(float)a3;
- (void)setNumAppTypeResourcesNormalized:(float)a3;
- (void)setNumCoworkersNormalized:(float)a3;
- (void)setNumFamilyNormalized:(float)a3;
- (void)setNumFriendsNormalized:(float)a3;
- (void)setNumInterfaceTagTypeResourcesNormalized:(float)a3;
- (void)setNumKidsNormalized:(float)a3;
- (void)setNumMapItemTypeResourcesNormalized:(float)a3;
- (void)setNumMediaTypeResourcesNormalized:(float)a3;
- (void)setNumOtherPersonsNormalized:(float)a3;
- (void)setNumPetsNormalized:(float)a3;
- (void)setNumPhotoAssetsResourcesNormalized:(float)a3;
- (void)setNumRoutineEventsNormalized:(float)a3;
- (void)setNumStateOfMindEventsNormalized:(float)a3;
- (void)setNumTopicTypeResourcesNormalized:(float)a3;
- (void)setNumTrendEventsNormalized:(float)a3;
- (void)setNumUniqueResourceTypesNormalized:(float)a3;
- (void)setNumValueTypeResourcesNormalized:(float)a3;
- (void)setNumWebLinkTypeResourcesNormalized:(float)a3;
- (void)setNumWorkoutIconAssetsNormalized:(float)a3;
- (void)setNumWorkoutRingAssetsNormalized:(float)a3;
- (void)setNumWorkoutRouteMapAssetsNormalized:(float)a3;
- (void)setPeopleCountMaxNormalized:(float)a3;
- (void)setPeopleCountWeightedAverageNormalized:(float)a3;
- (void)setPeopleCountWeightedSumNormalized:(float)a3;
- (void)setPeopleDensityMaxNormalized:(float)a3;
- (void)setPeopleDensityWeightedAverageNormalized:(float)a3;
- (void)setPlaceNameConfidence:(float)a3;
- (void)setShareCountFeatureNormalized:(float)a3;
- (void)setStateOfMindDomainCountNormalized:(float)a3;
- (void)setStateOfMindLabelCountNormalized:(float)a3;
- (void)setStateOfMindLoggedIn3pApp:(float)a3;
- (void)setStateOfMindLoggedInJournalApp:(float)a3;
- (void)setSubSuggestionIDs:(id)a3;
- (void)setSuggestionIdentifier:(id)a3;
- (void)setSuggestionIsDeleted:(BOOL)a3;
- (void)setSuggestionIsSelected:(BOOL)a3;
- (void)setSuggestionQuickAddEntry:(BOOL)a3;
- (void)setSummarizationGranularity:(unint64_t)a3;
- (void)setTimeAtHomeDuration:(float)a3;
- (void)setTimeCorrelationScoreFeature:(float)a3;
- (void)setViewCountNormalized:(float)a3;
- (void)setWorkoutDurationFeatureNormalized:(float)a3;
- (void)setWorkoutTypes:(id)a3;
@end

@implementation MOEventBundleRankingInput

- (id)dictionary
{
  v3 = objc_opt_new();
  v4 = [(MOEventBundleRankingInput *)self bundleIdentifier];
  v5 = [v4 UUIDString];
  [(MOEventBundleRankingInput *)self _saveToDictionary:v3 object:v5 forKey:@"bundleID"];

  v6 = [(MOEventBundleRankingInput *)self suggestionIdentifier];
  v7 = [v6 UUIDString];
  [(MOEventBundleRankingInput *)self _saveToDictionary:v3 object:v7 forKey:@"suggestionID"];

  [(MOEventBundleRankingInput *)self bundleRecencyDaysElapsed];
  v8 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  [(MOEventBundleRankingInput *)self _saveToDictionary:v3 object:v8 forKey:@"bundleRecencyDaysElapsed"];

  [(MOEventBundleRankingInput *)self numAnomalyEventsNormalized];
  v9 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  [(MOEventBundleRankingInput *)self _saveToDictionary:v3 object:v9 forKey:@"numAnomalyEventsNormalized"];

  [(MOEventBundleRankingInput *)self numTrendEventsNormalized];
  v10 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  [(MOEventBundleRankingInput *)self _saveToDictionary:v3 object:v10 forKey:@"numTrendEventsNormalized"];

  [(MOEventBundleRankingInput *)self numRoutineEventsNormalized];
  v11 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  [(MOEventBundleRankingInput *)self _saveToDictionary:v3 object:v11 forKey:@"numRoutineEventsNormalized"];

  [(MOEventBundleRankingInput *)self numStateOfMindEventsNormalized];
  v12 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  [(MOEventBundleRankingInput *)self _saveToDictionary:v3 object:v12 forKey:@"numStateOfMindEventsNormalized"];

  v13 = +[NSNumber numberWithUnsignedInteger:[(MOEventBundleRankingInput *)self bundleInterfaceType]];
  [(MOEventBundleRankingInput *)self _saveToDictionary:v3 object:v13 forKey:@"bundleInterfaceType"];

  v14 = +[NSNumber numberWithUnsignedInteger:[(MOEventBundleRankingInput *)self bundleSubType]];
  [(MOEventBundleRankingInput *)self _saveToDictionary:v3 object:v14 forKey:@"bundleSubType"];

  v15 = +[NSNumber numberWithUnsignedInteger:[(MOEventBundleRankingInput *)self bundleSuperType]];
  [(MOEventBundleRankingInput *)self _saveToDictionary:v3 object:v15 forKey:@"bundleSuperType"];

  v16 = [(MOEventBundleRankingInput *)self bundleRichnessDict];
  [(MOEventBundleRankingInput *)self _saveToDictionary:v3 object:v16 forKey:@"bundleRichnessDict"];

  [(MOEventBundleRankingInput *)self isBundleActionSpecific];
  v17 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  [(MOEventBundleRankingInput *)self _saveToDictionary:v3 object:v17 forKey:@"isBundleActionSpecific"];

  [(MOEventBundleRankingInput *)self isBundlePlaceTypeSpecific];
  v18 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  [(MOEventBundleRankingInput *)self _saveToDictionary:v3 object:v18 forKey:@"isBundlePlaceTypeSpecific"];

  [(MOEventBundleRankingInput *)self isBundleTimeTagSpecific];
  v19 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  [(MOEventBundleRankingInput *)self _saveToDictionary:v3 object:v19 forKey:@"isBundleTimeTagSpecific"];

  [(MOEventBundleRankingInput *)self labelSpecificityNormalized];
  v20 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  [(MOEventBundleRankingInput *)self _saveToDictionary:v3 object:v20 forKey:@"labelSpecificityNormalized"];

  [(MOEventBundleRankingInput *)self interestingPOIFeature];
  v21 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  [(MOEventBundleRankingInput *)self _saveToDictionary:v3 object:v21 forKey:@"interestingPOIFeature"];

  [(MOEventBundleRankingInput *)self distanceToHomeFeatureNormalized];
  v22 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  [(MOEventBundleRankingInput *)self _saveToDictionary:v3 object:v22 forKey:@"distanceToHomeFeatureNormalized"];

  [(MOEventBundleRankingInput *)self familiarityIndexFeature];
  v23 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  [(MOEventBundleRankingInput *)self _saveToDictionary:v3 object:v23 forKey:@"familiarityIndexFeature"];

  [(MOEventBundleRankingInput *)self callDurationFeatureNormalized];
  v24 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  [(MOEventBundleRankingInput *)self _saveToDictionary:v3 object:v24 forKey:@"callDurationFeatureNormalized"];

  [(MOEventBundleRankingInput *)self burstyInteractionCountFeatureNormalized];
  v25 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  [(MOEventBundleRankingInput *)self _saveToDictionary:v3 object:v25 forKey:@"burstyInteractionCountFeatureNormalized"];

  v26 = +[NSNumber numberWithBool:[(MOEventBundleRankingInput *)self multipleInteractionTypesFeature]];
  [(MOEventBundleRankingInput *)self _saveToDictionary:v3 object:v26 forKey:@"multipleInteractionTypesFeature"];

  v27 = +[NSNumber numberWithInt:[(MOEventBundleRankingInput *)self contactLocationWorkFeature]];
  [(MOEventBundleRankingInput *)self _saveToDictionary:v3 object:v27 forKey:@"contactLocationWorkFeature"];

  v28 = +[NSNumber numberWithBool:[(MOEventBundleRankingInput *)self groupConversationFeature]];
  [(MOEventBundleRankingInput *)self _saveToDictionary:v3 object:v28 forKey:@"groupConversationFeature"];

  [(MOEventBundleRankingInput *)self timeCorrelationScoreFeature];
  v29 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  [(MOEventBundleRankingInput *)self _saveToDictionary:v3 object:v29 forKey:@"timeCorrelationScoreFeature"];

  [(MOEventBundleRankingInput *)self labelQualityScore];
  v30 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  [(MOEventBundleRankingInput *)self _saveToDictionary:v3 object:v30 forKey:@"labelQualityScore"];

  [(MOEventBundleRankingInput *)self labelConfidenceScoreFeature];
  v31 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  [(MOEventBundleRankingInput *)self _saveToDictionary:v3 object:v31 forKey:@"labelConfidenceScoreFeature"];

  [(MOEventBundleRankingInput *)self mediaScoreFeatureNormalized];
  v32 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  [(MOEventBundleRankingInput *)self _saveToDictionary:v3 object:v32 forKey:@"mediaScoreFeatureNormalized"];

  [(MOEventBundleRankingInput *)self workoutDurationFeatureNormalized];
  v33 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  [(MOEventBundleRankingInput *)self _saveToDictionary:v3 object:v33 forKey:@"workoutDurationFeatureNormalized"];

  [(MOEventBundleRankingInput *)self shareCountFeatureNormalized];
  v34 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  [(MOEventBundleRankingInput *)self _saveToDictionary:v3 object:v34 forKey:@"shareCountFeatureNormalized"];

  v35 = +[NSNumber numberWithBool:[(MOEventBundleRankingInput *)self itemFromMeFeature]];
  [(MOEventBundleRankingInput *)self _saveToDictionary:v3 object:v35 forKey:@"itemFromMeFeature"];

  [(MOEventBundleRankingInput *)self isFamilyContact];
  v36 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  [(MOEventBundleRankingInput *)self _saveToDictionary:v3 object:v36 forKey:@"isFamilyContact"];

  [(MOEventBundleRankingInput *)self isCoworkerContact];
  v37 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  [(MOEventBundleRankingInput *)self _saveToDictionary:v3 object:v37 forKey:@"isCoworkerContact"];

  v38 = +[NSNumber numberWithBool:[(MOEventBundleRankingInput *)self isRepetitiveContact]];
  [(MOEventBundleRankingInput *)self _saveToDictionary:v3 object:v38 forKey:@"isRepetitiveContact"];

  [(MOEventBundleRankingInput *)self peopleDensityWeightedAverageNormalized];
  v39 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  [(MOEventBundleRankingInput *)self _saveToDictionary:v3 object:v39 forKey:@"pDensityWeightedAverageNormalized"];

  [(MOEventBundleRankingInput *)self peopleDensityMaxNormalized];
  v40 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  [(MOEventBundleRankingInput *)self _saveToDictionary:v3 object:v40 forKey:@"pDensityMaxNormalized"];

  [(MOEventBundleRankingInput *)self peopleCountWeightedSumNormalized];
  v41 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  [(MOEventBundleRankingInput *)self _saveToDictionary:v3 object:v41 forKey:@"pCountWeightedSumNormalized"];

  [(MOEventBundleRankingInput *)self peopleCountWeightedAverageNormalized];
  v42 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  [(MOEventBundleRankingInput *)self _saveToDictionary:v3 object:v42 forKey:@"pCountWeightedAverageNormalized"];

  [(MOEventBundleRankingInput *)self peopleCountMaxNormalized];
  v43 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  [(MOEventBundleRankingInput *)self _saveToDictionary:v3 object:v43 forKey:@"pCountMaxNormalized"];

  [(MOEventBundleRankingInput *)self numFamilyNormalized];
  v44 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  [(MOEventBundleRankingInput *)self _saveToDictionary:v3 object:v44 forKey:@"numFamilyNormalized"];

  [(MOEventBundleRankingInput *)self numFriendsNormalized];
  v45 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  [(MOEventBundleRankingInput *)self _saveToDictionary:v3 object:v45 forKey:@"numFriendsNormalized"];

  [(MOEventBundleRankingInput *)self numKidsNormalized];
  v46 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  [(MOEventBundleRankingInput *)self _saveToDictionary:v3 object:v46 forKey:@"numKidsNormalized"];

  [(MOEventBundleRankingInput *)self numCoworkersNormalized];
  v47 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  [(MOEventBundleRankingInput *)self _saveToDictionary:v3 object:v47 forKey:@"numCoworkersNormalized"];

  [(MOEventBundleRankingInput *)self numPetsNormalized];
  v48 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  [(MOEventBundleRankingInput *)self _saveToDictionary:v3 object:v48 forKey:@"numPetsNormalized"];

  [(MOEventBundleRankingInput *)self numOtherPersonsNormalized];
  v49 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  [(MOEventBundleRankingInput *)self _saveToDictionary:v3 object:v49 forKey:@"numOtherPersonsNormalized"];

  [(MOEventBundleRankingInput *)self viewCountNormalized];
  v50 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  [(MOEventBundleRankingInput *)self _saveToDictionary:v3 object:v50 forKey:@"suggestionViewCountNormalized"];

  v51 = +[NSNumber numberWithBool:[(MOEventBundleRankingInput *)self suggestionIsDeleted]];
  [(MOEventBundleRankingInput *)self _saveToDictionary:v3 object:v51 forKey:@"suggestionIsDeleted"];

  v52 = +[NSNumber numberWithBool:[(MOEventBundleRankingInput *)self suggestionIsSelected]];
  [(MOEventBundleRankingInput *)self _saveToDictionary:v3 object:v52 forKey:@"suggestionIsSelected"];

  v53 = +[NSNumber numberWithBool:[(MOEventBundleRankingInput *)self suggestionQuickAddEntry]];
  [(MOEventBundleRankingInput *)self _saveToDictionary:v3 object:v53 forKey:@"suggestionQuickAddEntry"];

  v54 = +[NSNumber numberWithBool:[(MOEventBundleRankingInput *)self journalEntryIsCreated]];
  [(MOEventBundleRankingInput *)self _saveToDictionary:v3 object:v54 forKey:@"journalEntryIsCreated"];

  v55 = +[NSNumber numberWithBool:[(MOEventBundleRankingInput *)self journalEntryIsEdited]];
  [(MOEventBundleRankingInput *)self _saveToDictionary:v3 object:v55 forKey:@"journalEntryIsEdited"];

  v56 = +[NSNumber numberWithBool:[(MOEventBundleRankingInput *)self journalEntryIsCancelled]];
  [(MOEventBundleRankingInput *)self _saveToDictionary:v3 object:v56 forKey:@"journalEntryIsCancelled"];

  v57 = +[NSNumber numberWithBool:[(MOEventBundleRankingInput *)self journalEntryIsDeleted]];
  [(MOEventBundleRankingInput *)self _saveToDictionary:v3 object:v57 forKey:@"journalEntryIsDeleted"];

  [(MOEventBundleRankingInput *)self placeNameConfidence];
  v58 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  [(MOEventBundleRankingInput *)self _saveToDictionary:v3 object:v58 forKey:@"placeNameConfidence"];

  [(MOEventBundleRankingInput *)self timeAtHomeDuration];
  v59 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  [(MOEventBundleRankingInput *)self _saveToDictionary:v3 object:v59 forKey:@"timeAtHomeDuration"];

  v60 = [(MOEventBundleRankingInput *)self evergreenType];
  [(MOEventBundleRankingInput *)self _saveToDictionary:v3 object:v60 forKey:@"evergreenType"];

  v61 = +[NSNumber numberWithBool:[(MOEventBundleRankingInput *)self isBundleAggregated]];
  [(MOEventBundleRankingInput *)self _saveToDictionary:v3 object:v61 forKey:@"isBundleAggregated"];

  v62 = +[NSNumber numberWithUnsignedInteger:[(MOEventBundleRankingInput *)self summarizationGranularity]];
  [(MOEventBundleRankingInput *)self _saveToDictionary:v3 object:v62 forKey:@"summarizationGranularity"];

  v63 = +[NSNumber numberWithBool:[(MOEventBundleRankingInput *)self isWorkVisit]];
  [(MOEventBundleRankingInput *)self _saveToDictionary:v3 object:v63 forKey:@"isWorkVisit"];

  v64 = +[NSNumber numberWithBool:[(MOEventBundleRankingInput *)self isShortVisit]];
  [(MOEventBundleRankingInput *)self _saveToDictionary:v3 object:v64 forKey:@"isShortVisit"];

  v65 = +[NSNumber numberWithBool:[(MOEventBundleRankingInput *)self isSignificantContactWithHighSignificanceScore]];
  [(MOEventBundleRankingInput *)self _saveToDictionary:v3 object:v65 forKey:@"isSignificantContactWithHighSignificanceScore"];

  return v3;
}

- (void)_saveToDictionary:(id)a3 object:(id)a4 forKey:(id)a5
{
  if (a4)
  {
    if (a5) {
      [a3 setObject:a4 forKey:a5];
    }
  }
}

- (NSUUID)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSUUID)suggestionIdentifier
{
  return self->_suggestionIdentifier;
}

- (void)setSuggestionIdentifier:(id)a3
{
}

- (NSArray)events
{
  return self->_events;
}

- (void)setEvents:(id)a3
{
}

- (float)bundleRecencyDaysElapsed
{
  return self->_bundleRecencyDaysElapsed;
}

- (void)setBundleRecencyDaysElapsed:(float)a3
{
  self->_bundleRecencyDaysElapsed = a3;
}

- (float)numAnomalyEventsNormalized
{
  return self->_numAnomalyEventsNormalized;
}

- (void)setNumAnomalyEventsNormalized:(float)a3
{
  self->_numAnomalyEventsNormalized = a3;
}

- (float)numTrendEventsNormalized
{
  return self->_numTrendEventsNormalized;
}

- (void)setNumTrendEventsNormalized:(float)a3
{
  self->_numTrendEventsNormalized = a3;
}

- (float)numRoutineEventsNormalized
{
  return self->_numRoutineEventsNormalized;
}

- (void)setNumRoutineEventsNormalized:(float)a3
{
  self->_numRoutineEventsNormalized = a3;
}

- (float)numStateOfMindEventsNormalized
{
  return self->_numStateOfMindEventsNormalized;
}

- (void)setNumStateOfMindEventsNormalized:(float)a3
{
  self->_numStateOfMindEventsNormalized = a3;
}

- (unint64_t)bundleInterfaceType
{
  return self->_bundleInterfaceType;
}

- (void)setBundleInterfaceType:(unint64_t)a3
{
  self->_bundleInterfaceType = a3;
}

- (unint64_t)bundleSubType
{
  return self->_bundleSubType;
}

- (void)setBundleSubType:(unint64_t)a3
{
  self->_bundleSubType = a3;
}

- (unint64_t)bundleSuperType
{
  return self->_bundleSuperType;
}

- (void)setBundleSuperType:(unint64_t)a3
{
  self->_bundleSuperType = a3;
}

- (NSDictionary)bundleRichnessDict
{
  return self->_bundleRichnessDict;
}

- (void)setBundleRichnessDict:(id)a3
{
}

- (float)numUniqueResourceTypesNormalized
{
  return self->_numUniqueResourceTypesNormalized;
}

- (void)setNumUniqueResourceTypesNormalized:(float)a3
{
  self->_numUniqueResourceTypesNormalized = a3;
}

- (float)numValueTypeResourcesNormalized
{
  return self->_numValueTypeResourcesNormalized;
}

- (void)setNumValueTypeResourcesNormalized:(float)a3
{
  self->_numValueTypeResourcesNormalized = a3;
}

- (float)numPhotoAssetsResourcesNormalized
{
  return self->_numPhotoAssetsResourcesNormalized;
}

- (void)setNumPhotoAssetsResourcesNormalized:(float)a3
{
  self->_numPhotoAssetsResourcesNormalized = a3;
}

- (float)numMediaTypeResourcesNormalized
{
  return self->_numMediaTypeResourcesNormalized;
}

- (void)setNumMediaTypeResourcesNormalized:(float)a3
{
  self->_numMediaTypeResourcesNormalized = a3;
}

- (float)numWebLinkTypeResourcesNormalized
{
  return self->_numWebLinkTypeResourcesNormalized;
}

- (void)setNumWebLinkTypeResourcesNormalized:(float)a3
{
  self->_numWebLinkTypeResourcesNormalized = a3;
}

- (float)numInterfaceTagTypeResourcesNormalized
{
  return self->_numInterfaceTagTypeResourcesNormalized;
}

- (void)setNumInterfaceTagTypeResourcesNormalized:(float)a3
{
  self->_numInterfaceTagTypeResourcesNormalized = a3;
}

- (float)numMapItemTypeResourcesNormalized
{
  return self->_numMapItemTypeResourcesNormalized;
}

- (void)setNumMapItemTypeResourcesNormalized:(float)a3
{
  self->_numMapItemTypeResourcesNormalized = a3;
}

- (float)numAppTypeResourcesNormalized
{
  return self->_numAppTypeResourcesNormalized;
}

- (void)setNumAppTypeResourcesNormalized:(float)a3
{
  self->_numAppTypeResourcesNormalized = a3;
}

- (float)numTopicTypeResourcesNormalized
{
  return self->_numTopicTypeResourcesNormalized;
}

- (void)setNumTopicTypeResourcesNormalized:(float)a3
{
  self->_numTopicTypeResourcesNormalized = a3;
}

- (float)numWorkoutRingAssetsNormalized
{
  return self->_numWorkoutRingAssetsNormalized;
}

- (void)setNumWorkoutRingAssetsNormalized:(float)a3
{
  self->_numWorkoutRingAssetsNormalized = a3;
}

- (float)numWorkoutIconAssetsNormalized
{
  return self->_numWorkoutIconAssetsNormalized;
}

- (void)setNumWorkoutIconAssetsNormalized:(float)a3
{
  self->_numWorkoutIconAssetsNormalized = a3;
}

- (float)numWorkoutRouteMapAssetsNormalized
{
  return self->_numWorkoutRouteMapAssetsNormalized;
}

- (void)setNumWorkoutRouteMapAssetsNormalized:(float)a3
{
  self->_numWorkoutRouteMapAssetsNormalized = a3;
}

- (float)numFamilyNormalized
{
  return self->_numFamilyNormalized;
}

- (void)setNumFamilyNormalized:(float)a3
{
  self->_numFamilyNormalized = a3;
}

- (float)numKidsNormalized
{
  return self->_numKidsNormalized;
}

- (void)setNumKidsNormalized:(float)a3
{
  self->_numKidsNormalized = a3;
}

- (float)numFriendsNormalized
{
  return self->_numFriendsNormalized;
}

- (void)setNumFriendsNormalized:(float)a3
{
  self->_numFriendsNormalized = a3;
}

- (float)numCoworkersNormalized
{
  return self->_numCoworkersNormalized;
}

- (void)setNumCoworkersNormalized:(float)a3
{
  self->_numCoworkersNormalized = a3;
}

- (float)numPetsNormalized
{
  return self->_numPetsNormalized;
}

- (void)setNumPetsNormalized:(float)a3
{
  self->_numPetsNormalized = a3;
}

- (float)numOtherPersonsNormalized
{
  return self->_numOtherPersonsNormalized;
}

- (void)setNumOtherPersonsNormalized:(float)a3
{
  self->_numOtherPersonsNormalized = a3;
}

- (float)isBundleActionSpecific
{
  return self->_isBundleActionSpecific;
}

- (void)setIsBundleActionSpecific:(float)a3
{
  self->_isBundleActionSpecific = a3;
}

- (float)isBundlePlaceTypeSpecific
{
  return self->_isBundlePlaceTypeSpecific;
}

- (void)setIsBundlePlaceTypeSpecific:(float)a3
{
  self->_isBundlePlaceTypeSpecific = a3;
}

- (float)isBundleTimeTagSpecific
{
  return self->_isBundleTimeTagSpecific;
}

- (void)setIsBundleTimeTagSpecific:(float)a3
{
  self->_isBundleTimeTagSpecific = a3;
}

- (float)labelSpecificityNormalized
{
  return self->_labelSpecificityNormalized;
}

- (void)setLabelSpecificityNormalized:(float)a3
{
  self->_labelSpecificityNormalized = a3;
}

- (float)interestingPOIFeature
{
  return self->_interestingPOIFeature;
}

- (void)setInterestingPOIFeature:(float)a3
{
  self->_interestingPOIFeature = a3;
}

- (BOOL)isSensitivePOI
{
  return self->_isSensitivePOI;
}

- (void)setIsSensitivePOI:(BOOL)a3
{
  self->_isSensitivePOI = a3;
}

- (float)distanceToHomeFeatureNormalized
{
  return self->_distanceToHomeFeatureNormalized;
}

- (void)setDistanceToHomeFeatureNormalized:(float)a3
{
  self->_distanceToHomeFeatureNormalized = a3;
}

- (float)familiarityIndexFeature
{
  return self->_familiarityIndexFeature;
}

- (void)setFamiliarityIndexFeature:(float)a3
{
  self->_familiarityIndexFeature = a3;
}

- (float)callDurationFeatureNormalized
{
  return self->_callDurationFeatureNormalized;
}

- (void)setCallDurationFeatureNormalized:(float)a3
{
  self->_callDurationFeatureNormalized = a3;
}

- (float)burstyInteractionCountFeatureNormalized
{
  return self->_burstyInteractionCountFeatureNormalized;
}

- (void)setBurstyInteractionCountFeatureNormalized:(float)a3
{
  self->_burstyInteractionCountFeatureNormalized = a3;
}

- (BOOL)multipleInteractionTypesFeature
{
  return self->_multipleInteractionTypesFeature;
}

- (void)setMultipleInteractionTypesFeature:(BOOL)a3
{
  self->_multipleInteractionTypesFeature = a3;
}

- (int)contactLocationWorkFeature
{
  return self->_contactLocationWorkFeature;
}

- (void)setContactLocationWorkFeature:(int)a3
{
  self->_contactLocationWorkFeature = a3;
}

- (BOOL)groupConversationFeature
{
  return self->_groupConversationFeature;
}

- (void)setGroupConversationFeature:(BOOL)a3
{
  self->_groupConversationFeature = a3;
}

- (float)timeCorrelationScoreFeature
{
  return self->_timeCorrelationScoreFeature;
}

- (void)setTimeCorrelationScoreFeature:(float)a3
{
  self->_timeCorrelationScoreFeature = a3;
}

- (float)labelQualityScore
{
  return self->_labelQualityScore;
}

- (void)setLabelQualityScore:(float)a3
{
  self->_labelQualityScore = a3;
}

- (float)labelConfidenceScoreFeature
{
  return self->_labelConfidenceScoreFeature;
}

- (void)setLabelConfidenceScoreFeature:(float)a3
{
  self->_labelConfidenceScoreFeature = a3;
}

- (float)mediaScoreFeatureNormalized
{
  return self->_mediaScoreFeatureNormalized;
}

- (void)setMediaScoreFeatureNormalized:(float)a3
{
  self->_mediaScoreFeatureNormalized = a3;
}

- (float)workoutDurationFeatureNormalized
{
  return self->_workoutDurationFeatureNormalized;
}

- (void)setWorkoutDurationFeatureNormalized:(float)a3
{
  self->_workoutDurationFeatureNormalized = a3;
}

- (float)shareCountFeatureNormalized
{
  return self->_shareCountFeatureNormalized;
}

- (void)setShareCountFeatureNormalized:(float)a3
{
  self->_shareCountFeatureNormalized = a3;
}

- (BOOL)itemFromMeFeature
{
  return self->_itemFromMeFeature;
}

- (void)setItemFromMeFeature:(BOOL)a3
{
  self->_itemFromMeFeature = a3;
}

- (float)isFamilyContact
{
  return self->_isFamilyContact;
}

- (void)setIsFamilyContact:(float)a3
{
  self->_isFamilyContact = a3;
}

- (float)isCoworkerContact
{
  return self->_isCoworkerContact;
}

- (void)setIsCoworkerContact:(float)a3
{
  self->_isCoworkerContact = a3;
}

- (BOOL)isRepetitiveContact
{
  return self->_isRepetitiveContact;
}

- (void)setIsRepetitiveContact:(BOOL)a3
{
  self->_isRepetitiveContact = a3;
}

- (float)peopleDensityWeightedAverageNormalized
{
  return self->_peopleDensityWeightedAverageNormalized;
}

- (void)setPeopleDensityWeightedAverageNormalized:(float)a3
{
  self->_peopleDensityWeightedAverageNormalized = a3;
}

- (float)peopleDensityMaxNormalized
{
  return self->_peopleDensityMaxNormalized;
}

- (void)setPeopleDensityMaxNormalized:(float)a3
{
  self->_peopleDensityMaxNormalized = a3;
}

- (float)stateOfMindLabelCountNormalized
{
  return self->_stateOfMindLabelCountNormalized;
}

- (void)setStateOfMindLabelCountNormalized:(float)a3
{
  self->_stateOfMindLabelCountNormalized = a3;
}

- (float)stateOfMindDomainCountNormalized
{
  return self->_stateOfMindDomainCountNormalized;
}

- (void)setStateOfMindDomainCountNormalized:(float)a3
{
  self->_stateOfMindDomainCountNormalized = a3;
}

- (float)stateOfMindLoggedIn3pApp
{
  return self->_stateOfMindLoggedIn3pApp;
}

- (void)setStateOfMindLoggedIn3pApp:(float)a3
{
  self->_stateOfMindLoggedIn3pApp = a3;
}

- (float)stateOfMindLoggedInJournalApp
{
  return self->_stateOfMindLoggedInJournalApp;
}

- (void)setStateOfMindLoggedInJournalApp:(float)a3
{
  self->_stateOfMindLoggedInJournalApp = a3;
}

- (float)avgSubBundleGoodnessScores
{
  return self->_avgSubBundleGoodnessScores;
}

- (void)setAvgSubBundleGoodnessScores:(float)a3
{
  self->_avgSubBundleGoodnessScores = a3;
}

- (float)peopleCountWeightedSumNormalized
{
  return self->_peopleCountWeightedSumNormalized;
}

- (void)setPeopleCountWeightedSumNormalized:(float)a3
{
  self->_peopleCountWeightedSumNormalized = a3;
}

- (float)peopleCountWeightedAverageNormalized
{
  return self->_peopleCountWeightedAverageNormalized;
}

- (void)setPeopleCountWeightedAverageNormalized:(float)a3
{
  self->_peopleCountWeightedAverageNormalized = a3;
}

- (float)peopleCountMaxNormalized
{
  return self->_peopleCountMaxNormalized;
}

- (void)setPeopleCountMaxNormalized:(float)a3
{
  self->_peopleCountMaxNormalized = a3;
}

- (float)viewCountNormalized
{
  return self->_viewCountNormalized;
}

- (void)setViewCountNormalized:(float)a3
{
  self->_viewCountNormalized = a3;
}

- (BOOL)suggestionIsDeleted
{
  return self->_suggestionIsDeleted;
}

- (void)setSuggestionIsDeleted:(BOOL)a3
{
  self->_suggestionIsDeleted = a3;
}

- (BOOL)suggestionIsSelected
{
  return self->_suggestionIsSelected;
}

- (void)setSuggestionIsSelected:(BOOL)a3
{
  self->_suggestionIsSelected = a3;
}

- (BOOL)suggestionQuickAddEntry
{
  return self->_suggestionQuickAddEntry;
}

- (void)setSuggestionQuickAddEntry:(BOOL)a3
{
  self->_suggestionQuickAddEntry = a3;
}

- (BOOL)journalEntryIsCreated
{
  return self->_journalEntryIsCreated;
}

- (void)setJournalEntryIsCreated:(BOOL)a3
{
  self->_journalEntryIsCreated = a3;
}

- (BOOL)journalEntryIsEdited
{
  return self->_journalEntryIsEdited;
}

- (void)setJournalEntryIsEdited:(BOOL)a3
{
  self->_journalEntryIsEdited = a3;
}

- (BOOL)journalEntryIsCancelled
{
  return self->_journalEntryIsCancelled;
}

- (void)setJournalEntryIsCancelled:(BOOL)a3
{
  self->_journalEntryIsCancelled = a3;
}

- (BOOL)journalEntryIsDeleted
{
  return self->_journalEntryIsDeleted;
}

- (void)setJournalEntryIsDeleted:(BOOL)a3
{
  self->_journalEntryIsDeleted = a3;
}

- (float)placeNameConfidence
{
  return self->_placeNameConfidence;
}

- (void)setPlaceNameConfidence:(float)a3
{
  self->_placeNameConfidence = a3;
}

- (float)timeAtHomeDuration
{
  return self->_timeAtHomeDuration;
}

- (void)setTimeAtHomeDuration:(float)a3
{
  self->_timeAtHomeDuration = a3;
}

- (NSString)evergreenType
{
  return self->_evergreenType;
}

- (void)setEvergreenType:(id)a3
{
}

- (BOOL)evergreenPromptExists
{
  return self->_evergreenPromptExists;
}

- (void)setEvergreenPromptExists:(BOOL)a3
{
  self->_evergreenPromptExists = a3;
}

- (BOOL)isBundleAggregated
{
  return self->_isBundleAggregated;
}

- (void)setIsBundleAggregated:(BOOL)a3
{
  self->_isBundleAggregated = a3;
}

- (unint64_t)summarizationGranularity
{
  return self->_summarizationGranularity;
}

- (void)setSummarizationGranularity:(unint64_t)a3
{
  self->_summarizationGranularity = a3;
}

- (NSArray)subSuggestionIDs
{
  return self->_subSuggestionIDs;
}

- (void)setSubSuggestionIDs:(id)a3
{
}

- (BOOL)isWorkVisit
{
  return self->_isWorkVisit;
}

- (void)setIsWorkVisit:(BOOL)a3
{
  self->_isWorkVisit = a3;
}

- (BOOL)isShortVisit
{
  return self->_isShortVisit;
}

- (void)setIsShortVisit:(BOOL)a3
{
  self->_isShortVisit = a3;
}

- (BOOL)isSignificantContactWithHighSignificanceScore
{
  return self->_isSignificantContactWithHighSignificanceScore;
}

- (void)setIsSignificantContactWithHighSignificanceScore:(BOOL)a3
{
  self->_isSignificantContactWithHighSignificanceScore = a3;
}

- (NSSet)allPlaceNames
{
  return self->_allPlaceNames;
}

- (void)setAllPlaceNames:(id)a3
{
}

- (NSSet)workoutTypes
{
  return self->_workoutTypes;
}

- (void)setWorkoutTypes:(id)a3
{
}

- (NSDate)bundleStartDate
{
  return self->_bundleStartDate;
}

- (void)setBundleStartDate:(id)a3
{
}

- (NSDate)bundleEndDate
{
  return self->_bundleEndDate;
}

- (void)setBundleEndDate:(id)a3
{
}

- (NSSet)allContactIdentifiers
{
  return self->_allContactIdentifiers;
}

- (void)setAllContactIdentifiers:(id)a3
{
}

- (NSSet)allStateOfMindIdentifiers
{
  return self->_allStateOfMindIdentifiers;
}

- (void)setAllStateOfMindIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allStateOfMindIdentifiers, 0);
  objc_storeStrong((id *)&self->_allContactIdentifiers, 0);
  objc_storeStrong((id *)&self->_bundleEndDate, 0);
  objc_storeStrong((id *)&self->_bundleStartDate, 0);
  objc_storeStrong((id *)&self->_workoutTypes, 0);
  objc_storeStrong((id *)&self->_allPlaceNames, 0);
  objc_storeStrong((id *)&self->_subSuggestionIDs, 0);
  objc_storeStrong((id *)&self->_evergreenType, 0);
  objc_storeStrong((id *)&self->_bundleRichnessDict, 0);
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong((id *)&self->_suggestionIdentifier, 0);

  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
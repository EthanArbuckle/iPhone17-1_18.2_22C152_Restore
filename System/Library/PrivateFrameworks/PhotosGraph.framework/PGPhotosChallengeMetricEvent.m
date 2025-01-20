@interface PGPhotosChallengeMetricEvent
+ (BOOL)_isHighPrecisionCityscapeAsset:(id)a3;
+ (BOOL)_isHighPrecisionLandscapeAsset:(id)a3;
+ (id)_isVIPStringForResult:(BOOL)a3;
+ (id)_passedFilteringStringForResult:(BOOL)a3;
+ (id)_passedHighPrecisionStringForResult:(BOOL)a3;
+ (id)allMetricEventsWithGraphManager:(id)a3;
+ (id)meaningLabelFromMeaningQuestionMetricType:(unsigned __int16)a3;
+ (id)personActivityMeaningLabelFromMeaningQuestionMetricType:(unsigned __int16)a3;
+ (id)questionEntityTypesFromQuestionMetricType:(unsigned __int16)a3;
+ (id)relationshipLabelFromRelationshipQuestionMetricType:(unsigned __int16)a3;
+ (id)stringFromQuestionMetricType:(unsigned __int16)a3;
+ (unint64_t)algorithmVersionFromQuestionMetricType:(unsigned __int16)a3 withEventLabelingConfiguration:(id)a4;
+ (unint64_t)meaningInferenceAlgorithmForQuestionMetricType:(unsigned __int16)a3 withEventLabelingConfiguration:(id)a4;
+ (unsigned)questionTypeFromQuestionMetricType:(unsigned __int16)a3;
+ (unsigned)wallpaperSuggestionSubtypeForQuestionMetricType:(unsigned __int16)a3;
- (BOOL)_relationshipInferenceResultForPersonNode:(id)a3 questionMetricType:(unsigned __int16)a4 useGraphInference:(BOOL)a5;
- (BOOL)_relationshipTagInferenceResultForPersonNode:(id)a3 questionMetricType:(unsigned __int16)a4;
- (BOOL)_relatonshipInferenceResultForPersonNode:(id)a3 questionMetricType:(unsigned __int16)a4;
- (BOOL)shouldReportMetrics;
- (CLSCurationContext)curationContext;
- (CLSCurationSession)curationSession;
- (NSString)photoLibrarySize;
- (NSString)questionTypeString;
- (PGPhotosChallengeMetricEvent)initWithWorkingContext:(id)a3 questionMetricType:(unsigned __int16)a4 metricEventFetchHelper:(id)a5;
- (PGPhotosChallengeMetricEventFetchHelper)metricsCache;
- (PGPrecisionRecallEvaluation)evaluation;
- (id)_ageCategoryInferenceResultsForAgeCategoryByPersonUUIDs:(id)a3;
- (id)_businessInferenceResultsForBusinessIdByAssetIds:(id)a3;
- (id)_currentPetInferenceResultsForPetUUIDs:(id)a3;
- (id)_featuredPhotoInferenceResultsForAnswerDateByAssetIds:(id)a3 questionMetricType:(unsigned __int16)a4;
- (id)_fetchPersonFromAsset:(id)a3 detectionType:(signed __int16)a4;
- (id)_frequentLocationInferenceResultsForLocationByAssetIds:(id)a3 locationType:(id)a4;
- (id)_getInferredReasonFromMatchedConditions:(id)a3 withFallbackReason:(id)a4;
- (id)_groundTruthByAssetIdentifiersFromQuestions:(id)a3;
- (id)_groundTruthByPersonUUIDFromQuestions:(id)a3;
- (id)_groundTruthForAgeCategoryFromQuestions:(id)a3;
- (id)_groundTruthForBusinessFromQuestions:(id)a3;
- (id)_groundTruthForCurrentPetInferenceFromQuestions:(id)a3;
- (id)_groundTruthForFeaturedPhotoFromQuestions:(id)a3;
- (id)_groundTruthForFrequentLocationFromQuestions:(id)a3;
- (id)_groundTruthForHolidayFromQuestions:(id)a3;
- (id)_groundTruthForMusicQualityQuestions:(id)a3;
- (id)_groundTruthForNamingFromQuestions:(id)a3;
- (id)_groundTruthForPublicEventFromQuestions:(id)a3;
- (id)_groundTruthForStoryPromptSuggestionsQuestions:(id)a3;
- (id)_groundTruthForTitlingQuestions:(id)a3 questionType:(unsigned __int16)a4;
- (id)_groundTruthForTripTitlingQuestions:(id)a3;
- (id)_holidayInferenceResultsForHolidayNameByAssetIds:(id)a3;
- (id)_inferredReasonForLocationRepresentativeAssets:(id)a3;
- (id)_inferredResultsForEntityIdentifiers:(id)a3 withDefaultBoolValue:(BOOL)a4;
- (id)_inferredResultsForLocationRepresentativeAssets:(id)a3;
- (id)_locationRepresentativeAssetFromQuestion:(id)a3;
- (id)_locationRepresentativeAssetsGroundTruthByAssetIdentifiersFromQuestions:(id)a3;
- (id)_meaningInferenceResultsForMeaningLabel:(id)a3 assetIds:(id)a4;
- (id)_meaningInferenceResultsForMeaningLabel:(id)a3 momentUUIDs:(id)a4 isEventLabelingMetricEvent:(BOOL)a5;
- (id)_meaningLabelsOfMomentNode:(id)a3 forMeaningLabel:(id)a4 isEventLabelingMetricEvent:(BOOL)a5;
- (id)_namingInferenceResultsForContactIdentifierByPersonUUIDs:(id)a3;
- (id)_personActivityMeaningInferenceResultsForPersonActivityMeaningLabel:(id)a3 assetIds:(id)a4;
- (id)_publicEventInferenceResultsForPublicEventIdByAssetIds:(id)a3;
- (id)_reasonResultByAssetEntityIdentifierForMusicQualityQuestions:(id)a3;
- (id)_reasonResultByAssetEntityIdentifierForStoryPromptSuggestionsQuestions:(id)a3;
- (id)_reasonResultByAssetEntityIdentifierForTitlingQuestions:(id)a3 questionType:(unsigned __int16)a4;
- (id)_reasonResultByAssetSyndicationIdentifierForQuestions:(id)a3;
- (id)_reasonResultsForQuestions:(id)a3 inferenceResults:(id)a4 inferenceReasons:(id)a5;
- (id)_relationshipInferenceResultsForQuestionMetricType:(unsigned __int16)a3 personUUIDs:(id)a4 useGraphInference:(BOOL)a5;
- (id)_syndicatedAssetFromQuestion:(id)a3;
- (id)_syndicatedAssetsGroundTruthByAssetIdentifiersFromQuestions:(id)a3;
- (id)_syndicatedAssetsInferenceResultsForAssetSyndicationIdentifiers:(id)a3;
- (id)_tripTitlingReasonResultByAssetEntityIdentifierForQuestions:(id)a3;
- (id)_vipPersonIdentifiersWithCurationContext:(id)a3;
- (id)_vipPetIdentifiersWithCurationContext:(id)a3;
- (id)groundTruthByMomentUUIDFromExhaustiveMomentLabelingQuestions:(id)a3 meaningLabel:(id)a4 withMetricsCache:(id)a5;
- (id)identifier;
- (id)memoryCategorySubCategoryByQuestionMetricType;
- (id)payload;
- (id)payloadForVerification;
- (id)preparePayloadForPrecisionRecallEval:(id)a3 withEvaluations:(id)a4;
- (unint64_t)_relationshipTagFromQuestionMetricType:(unsigned __int16)a3;
- (unint64_t)algorithmVersion;
- (unint64_t)graphSchemaVersion;
- (unint64_t)photosModelVersion;
- (unint64_t)questionVersion;
- (unsigned)questionMetricType;
- (void)_deleteOutdatedPetQuestionsWithValidPetUUIDs:(id)a3;
- (void)_gatherDeferredSuggestionInferencesForQuestions:(id)a3 momentUUIDS:(id)a4 inferenceResults:(id)a5 reasonResultByAssetIdentifier:(id)a6 progressBlock:(id)a7;
- (void)_gatherMetricsForAgeCategoryQuestions:(id)a3 progressBlock:(id)a4;
- (void)_gatherMetricsForBusinessQuestions:(id)a3 progressBlock:(id)a4;
- (void)_gatherMetricsForCameraLibrarySwitchQuestions:(id)a3 progressBlock:(id)a4;
- (void)_gatherMetricsForExhaustiveMomentLabelingQuestions:(id)a3 questionMetricType:(unsigned __int16)a4 isEventLabelingMetricEvent:(BOOL)a5 progressBlock:(id)a6;
- (void)_gatherMetricsForExternalAssetRelevanceQuestions:(id)a3 questionMetricType:(unsigned __int16)a4 progressBlock:(id)a5;
- (void)_gatherMetricsForFeaturedPhotoQuestions:(id)a3 questionMetricType:(unsigned __int16)a4 progressBlock:(id)a5;
- (void)_gatherMetricsForFrequentLocationQuestions:(id)a3 questionMetricType:(unsigned __int16)a4 progressBlock:(id)a5;
- (void)_gatherMetricsForHighlightTitlingQuestions:(id)a3 progressBlock:(id)a4;
- (void)_gatherMetricsForHolidayQuestions:(id)a3 progressBlock:(id)a4;
- (void)_gatherMetricsForLocationRepresentativeAssetQuestions:(id)a3 questionMetricType:(unsigned __int16)a4 progressBlock:(id)a5;
- (void)_gatherMetricsForMeaningQuestions:(id)a3 questionMetricType:(unsigned __int16)a4 progressBlock:(id)a5;
- (void)_gatherMetricsForMemoryMusicQuestions:(id)a3 progressBlock:(id)a4;
- (void)_gatherMetricsForMemoryQuestions:(id)a3 questionMetricType:(unsigned __int16)a4 progressBlock:(id)a5;
- (void)_gatherMetricsForNamingQuestions:(id)a3 progressBlock:(id)a4;
- (void)_gatherMetricsForPersonActivityMeaningQuestions:(id)a3 questionMetricType:(unsigned __int16)a4 progressBlock:(id)a5;
- (void)_gatherMetricsForPetKnowledgeQuestions:(id)a3 progressBlock:(id)a4;
- (void)_gatherMetricsForPetQuestions:(id)a3 progressBlock:(id)a4;
- (void)_gatherMetricsForPublicEventQuestions:(id)a3 progressBlock:(id)a4;
- (void)_gatherMetricsForRelationshipQuestions:(id)a3 questionMetricType:(unsigned __int16)a4 progressBlock:(id)a5 useGraphInference:(BOOL)a6;
- (void)_gatherMetricsForSharedLibraryAssetsQuestions:(id)a3 progressBlock:(id)a4;
- (void)_gatherMetricsForSharedLibraryStartQuestions:(id)a3 progressBlock:(id)a4;
- (void)_gatherMetricsForStoryPromptSuggestionsQuestions:(id)a3 progressBlock:(id)a4;
- (void)_gatherMetricsForSyndicatedAssetsQuestions:(id)a3 progressBlock:(id)a4;
- (void)_gatherMetricsForTripKeyQuestions:(id)a3 progressBlock:(id)a4;
- (void)_gatherMetricsForTripTitlingQuestions:(id)a3 progressBlock:(id)a4;
- (void)_gatherMetricsForWallpaperQuestions:(id)a3 questionMetricType:(unsigned __int16)a4 progressBlock:(id)a5;
- (void)_gatherNearLiveSuggestionInferencesForQuestions:(id)a3 inferenceResults:(id)a4 reasonResultByAssetIdentifier:(id)a5 progressBlock:(id)a6;
- (void)gatherMetricsWithProgressBlock:(id)a3;
- (void)setAlgorithmVersion:(unint64_t)a3;
- (void)setCurationContext:(id)a3;
- (void)setCurationSession:(id)a3;
- (void)setEvaluation:(id)a3;
- (void)setGraphSchemaVersion:(unint64_t)a3;
- (void)setMetricsCache:(id)a3;
- (void)setPhotosModelVersion:(unint64_t)a3;
- (void)setQuestionMetricType:(unsigned __int16)a3;
- (void)setQuestionTypeString:(id)a3;
- (void)setQuestionVersion:(unint64_t)a3;
- (void)setSubMetricEvent:(id)a3;
@end

@implementation PGPhotosChallengeMetricEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_curationContext, 0);
  objc_storeStrong((id *)&self->_curationSession, 0);
  objc_storeStrong((id *)&self->_evaluation, 0);
  objc_storeStrong((id *)&self->_questionTypeString, 0);
  objc_storeStrong((id *)&self->_photoLibrarySize, 0);
  objc_storeStrong((id *)&self->_metricsCache, 0);
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_eventLabelingConfiguration, 0);
  objc_storeStrong((id *)&self->_subMetricEvent, 0);
  objc_storeStrong((id *)&self->_workingContext, 0);
}

- (void)setCurationContext:(id)a3
{
}

- (CLSCurationContext)curationContext
{
  return self->_curationContext;
}

- (void)setCurationSession:(id)a3
{
}

- (CLSCurationSession)curationSession
{
  return self->_curationSession;
}

- (void)setEvaluation:(id)a3
{
}

- (PGPrecisionRecallEvaluation)evaluation
{
  return self->_evaluation;
}

- (void)setQuestionVersion:(unint64_t)a3
{
  self->_questionVersion = a3;
}

- (unint64_t)questionVersion
{
  return self->_questionVersion;
}

- (void)setQuestionTypeString:(id)a3
{
}

- (NSString)questionTypeString
{
  return self->_questionTypeString;
}

- (void)setQuestionMetricType:(unsigned __int16)a3
{
  self->_questionMetricType = a3;
}

- (unsigned)questionMetricType
{
  return self->_questionMetricType;
}

- (void)setPhotosModelVersion:(unint64_t)a3
{
  self->_photosModelVersion = a3;
}

- (unint64_t)photosModelVersion
{
  return self->_photosModelVersion;
}

- (NSString)photoLibrarySize
{
  return self->_photoLibrarySize;
}

- (void)setGraphSchemaVersion:(unint64_t)a3
{
  self->_graphSchemaVersion = a3;
}

- (unint64_t)graphSchemaVersion
{
  return self->_graphSchemaVersion;
}

- (void)setAlgorithmVersion:(unint64_t)a3
{
  self->_algorithmVersion = a3;
}

- (unint64_t)algorithmVersion
{
  return self->_algorithmVersion;
}

- (void)setMetricsCache:(id)a3
{
}

- (PGPhotosChallengeMetricEventFetchHelper)metricsCache
{
  return self->_metricsCache;
}

- (id)preparePayloadForPrecisionRecallEval:(id)a3 withEvaluations:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v22 = a3;
  id v5 = a4;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = [v5 evaluationByReason];
  uint64_t v7 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        v12 = [v5 evaluationByReason];
        v13 = [v12 objectForKeyedSubscript:v11];

        v14 = [v22 payload];
        v15 = (void *)[v14 mutableCopy];

        [v15 setObject:v11 forKeyedSubscript:@"questionInfo"];
        v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v13, "falseNegatives"));
        [v15 setObject:v16 forKeyedSubscript:@"falseNegativeCount"];

        v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v13, "falsePositives"));
        [v15 setObject:v17 forKeyedSubscript:@"falsePositiveCount"];

        v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v13, "trueNegatives"));
        [v15 setObject:v18 forKeyedSubscript:@"trueNegativeCount"];

        v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v13, "truePositives"));
        [v15 setObject:v19 forKeyedSubscript:@"truePositiveCount"];

        [v6 addObject:v15];
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v8);
  }

  return v6;
}

- (id)memoryCategorySubCategoryByQuestionMetricType
{
  v5[73] = *MEMORY[0x1E4F143B8];
  v4[0] = &unk_1F28D2E20;
  v4[1] = &unk_1F28D2E68;
  v5[0] = &unk_1F28D4DB8;
  v5[1] = &unk_1F28D4DD0;
  v4[2] = &unk_1F28D2EB0;
  v4[3] = &unk_1F28D2EC8;
  v5[2] = &unk_1F28D4DE8;
  v5[3] = &unk_1F28D4E00;
  v4[4] = &unk_1F28D2EF8;
  v4[5] = &unk_1F28D2F40;
  v5[4] = &unk_1F28D4E18;
  v5[5] = &unk_1F28D4E30;
  v4[6] = &unk_1F28D2F70;
  v4[7] = &unk_1F28D2F88;
  v5[6] = &unk_1F28D4E48;
  v5[7] = &unk_1F28D4E60;
  v4[8] = &unk_1F28D2FB8;
  v4[9] = &unk_1F28D2FE8;
  v5[8] = &unk_1F28D4E78;
  v5[9] = &unk_1F28D4E90;
  v4[10] = &unk_1F28D3018;
  v4[11] = &unk_1F28D3030;
  v5[10] = &unk_1F28D4EA8;
  v5[11] = &unk_1F28D4EC0;
  v4[12] = &unk_1F28D3060;
  v4[13] = &unk_1F28D3090;
  v5[12] = &unk_1F28D4ED8;
  v5[13] = &unk_1F28D4EF0;
  v4[14] = &unk_1F28D30A8;
  v4[15] = &unk_1F28D30D8;
  v5[14] = &unk_1F28D4F08;
  v5[15] = &unk_1F28D4F20;
  v4[16] = &unk_1F28D30F0;
  v4[17] = &unk_1F28D3120;
  v5[16] = &unk_1F28D4F38;
  v5[17] = &unk_1F28D4F50;
  v4[18] = &unk_1F28D3138;
  v4[19] = &unk_1F28D3168;
  v5[18] = &unk_1F28D4F68;
  v5[19] = &unk_1F28D4F80;
  v4[20] = &unk_1F28D3198;
  v4[21] = &unk_1F28D31B0;
  v5[20] = &unk_1F28D4F98;
  v5[21] = &unk_1F28D4FB0;
  v4[22] = &unk_1F28D31C8;
  v4[23] = &unk_1F28D31F8;
  v5[22] = &unk_1F28D4FC8;
  v5[23] = &unk_1F28D4FE0;
  v4[24] = &unk_1F28D3228;
  v4[25] = &unk_1F28D3240;
  v5[24] = &unk_1F28D4FF8;
  v5[25] = &unk_1F28D5010;
  v4[26] = &unk_1F28D3270;
  v4[27] = &unk_1F28D32A0;
  v5[26] = &unk_1F28D5028;
  v5[27] = &unk_1F28D5040;
  v4[28] = &unk_1F28D32B8;
  v4[29] = &unk_1F28D32D0;
  v5[28] = &unk_1F28D5058;
  v5[29] = &unk_1F28D5070;
  v4[30] = &unk_1F28D3300;
  v4[31] = &unk_1F28D3330;
  v5[30] = &unk_1F28D5088;
  v5[31] = &unk_1F28D50A0;
  v4[32] = &unk_1F28D3348;
  v4[33] = &unk_1F28D3360;
  v5[32] = &unk_1F28D50B8;
  v5[33] = &unk_1F28D50D0;
  v4[34] = &unk_1F28D3378;
  v4[35] = &unk_1F28D3390;
  v5[34] = &unk_1F28D50E8;
  v5[35] = &unk_1F28D5100;
  v4[36] = &unk_1F28D33C0;
  v4[37] = &unk_1F28D33D8;
  v5[36] = &unk_1F28D5118;
  v5[37] = &unk_1F28D5130;
  v4[38] = &unk_1F28D33F0;
  v4[39] = &unk_1F28D3420;
  v5[38] = &unk_1F28D5148;
  v5[39] = &unk_1F28D5160;
  v4[40] = &unk_1F28D3450;
  v4[41] = &unk_1F28D3480;
  v5[40] = &unk_1F28D5178;
  v5[41] = &unk_1F28D5190;
  v4[42] = &unk_1F28D34B0;
  v4[43] = &unk_1F28D34F8;
  v5[42] = &unk_1F28D51A8;
  v5[43] = &unk_1F28D51C0;
  v4[44] = &unk_1F28D3528;
  v4[45] = &unk_1F28D3540;
  v5[44] = &unk_1F28D51D8;
  v5[45] = &unk_1F28D51F0;
  v4[46] = &unk_1F28D3558;
  v4[47] = &unk_1F28D3570;
  v5[46] = &unk_1F28D5208;
  v5[47] = &unk_1F28D5220;
  v4[48] = &unk_1F28D3588;
  v4[49] = &unk_1F28D35A0;
  v5[48] = &unk_1F28D5238;
  v5[49] = &unk_1F28D5250;
  v4[50] = &unk_1F28D35B8;
  v4[51] = &unk_1F28D35D0;
  v5[50] = &unk_1F28D5268;
  v5[51] = &unk_1F28D5280;
  v4[52] = &unk_1F28D35E8;
  v4[53] = &unk_1F28D3600;
  v5[52] = &unk_1F28D5298;
  v5[53] = &unk_1F28D52B0;
  v4[54] = &unk_1F28D3618;
  v4[55] = &unk_1F28D3630;
  v5[54] = &unk_1F28D52C8;
  v5[55] = &unk_1F28D52E0;
  v4[56] = &unk_1F28D3648;
  v4[57] = &unk_1F28D3660;
  v5[56] = &unk_1F28D52F8;
  v5[57] = &unk_1F28D5310;
  v4[58] = &unk_1F28D3678;
  v4[59] = &unk_1F28D3690;
  v5[58] = &unk_1F28D5328;
  v5[59] = &unk_1F28D5340;
  v4[60] = &unk_1F28D36A8;
  v4[61] = &unk_1F28D36C0;
  v5[60] = &unk_1F28D5358;
  v5[61] = &unk_1F28D5370;
  v4[62] = &unk_1F28D36D8;
  v4[63] = &unk_1F28D36F0;
  v5[62] = &unk_1F28D5388;
  v5[63] = &unk_1F28D53A0;
  v4[64] = &unk_1F28D3708;
  v5[64] = &unk_1F28D53B8;
  v4[65] = &unk_1F28D3720;
  v5[65] = &unk_1F28D53D0;
  v4[66] = &unk_1F28D3738;
  v5[66] = &unk_1F28D53E8;
  v4[67] = &unk_1F28D3768;
  v5[67] = &unk_1F28D5400;
  v4[68] = &unk_1F28D3780;
  v5[68] = &unk_1F28D5418;
  v4[69] = &unk_1F28D3798;
  v5[69] = &unk_1F28D5430;
  v4[70] = &unk_1F28D37B0;
  v5[70] = &unk_1F28D5448;
  v4[71] = &unk_1F28D37C8;
  v5[71] = &unk_1F28D5460;
  v4[72] = &unk_1F28D37E0;
  v5[72] = &unk_1F28D5478;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:73];
  return v2;
}

- (id)_reasonResultByAssetEntityIdentifierForStoryPromptSuggestionsQuestions:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v33 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = v3;
  uint64_t v34 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v34)
  {
    uint64_t v32 = *(void *)v36;
    uint64_t v30 = *MEMORY[0x1E4F8EA68];
    uint64_t v31 = *MEMORY[0x1E4F8EA70];
    uint64_t v4 = *MEMORY[0x1E4F8EA78];
    uint64_t v28 = *MEMORY[0x1E4F8EA80];
    uint64_t v27 = *MEMORY[0x1E4F8E920];
    uint64_t v29 = *MEMORY[0x1E4F8EA78];
    do
    {
      for (uint64_t i = 0; i != v34; ++i)
      {
        if (*(void *)v36 != v32) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        uint64_t v7 = [v6 additionalInfo];
        uint64_t v8 = [v7 objectForKeyedSubscript:v31];
        uint64_t v9 = [v7 objectForKeyedSubscript:v30];
        uint64_t v10 = [v9 integerValue];

        uint64_t v11 = [v7 objectForKeyedSubscript:v4];
        if (v11)
        {
          v12 = [v7 objectForKeyedSubscript:v4];
          uint64_t v13 = [v12 integerValue];
        }
        else
        {
          uint64_t v13 = -1;
        }

        uint64_t v14 = [v7 objectForKeyedSubscript:v28];
        v15 = (void *)v14;
        v16 = @"no prompt text";
        if (v14) {
          v16 = (__CFString *)v14;
        }
        v17 = v16;

        v18 = [v6 additionalInfo];
        uint64_t v19 = [v18 objectForKeyedSubscript:v27];
        v20 = (void *)v19;
        v21 = @"<none>";
        if (v19) {
          v21 = (__CFString *)v19;
        }
        id v22 = v21;

        long long v23 = [NSString stringWithFormat:@"[isValidated:%@]-[DislikeReason:%@]-[AssetCount:%d]-[MCAvailable:%d]-[PromptText:%@]", v8, v22, v10, v13, v17];

        long long v24 = [v6 entityIdentifier];
        [v33 setObject:v23 forKeyedSubscript:v24];

        uint64_t v4 = v29;
      }
      uint64_t v34 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v34);
  }

  return v33;
}

- (id)_groundTruthForStoryPromptSuggestionsQuestions:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    uint64_t v9 = (void *)MEMORY[0x1E4F1CC28];
    uint64_t v10 = (void *)MEMORY[0x1E4F1CC38];
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v12, "state", (void)v17) == 2) {
          uint64_t v13 = v10;
        }
        else {
          uint64_t v13 = v9;
        }
        id v14 = v13;
        v15 = [v12 entityIdentifier];
        [v4 setObject:v14 forKeyedSubscript:v15];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void)_gatherMetricsForStoryPromptSuggestionsQuestions:(id)a3 progressBlock:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(void *, unsigned char *, double))_Block_copy(a4);
  double v8 = 0.0;
  if (v7)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    if (Current >= 0.01)
    {
      char v22 = 0;
      v7[2](v7, &v22, 0.0);
      if (v22)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          int v24 = 3067;
          __int16 v25 = 2080;
          long long v26 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metric"
                "s/MetricEvents/PGPhotosChallengeMetricEvent.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        goto LABEL_13;
      }
      double v8 = Current;
    }
  }
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  long long v19 = __95__PGPhotosChallengeMetricEvent__gatherMetricsForStoryPromptSuggestionsQuestions_progressBlock___block_invoke;
  long long v20 = &unk_1E68F0C98;
  id v11 = v10;
  id v21 = v11;
  [v6 enumerateObjectsUsingBlock:&v17];
  v12 = -[PGPhotosChallengeMetricEvent _groundTruthForStoryPromptSuggestionsQuestions:](self, "_groundTruthForStoryPromptSuggestionsQuestions:", v11, v17, v18, v19, v20);
  uint64_t v13 = [v12 allKeys];
  id v14 = [(PGPhotosChallengeMetricEvent *)self _inferredResultsForEntityIdentifiers:v13 withDefaultBoolValue:1];

  v15 = [(PGPhotosChallengeMetricEvent *)self _reasonResultByAssetEntityIdentifierForStoryPromptSuggestionsQuestions:v11];
  v16 = [[PGAssetsWithReasonPrecisionRecallEvaluation alloc] initWithIdentifier:@"storyPromptSuggestions" category:@"storyPromptSuggestions"];
  [(PGAssetsWithReasonPrecisionRecallEvaluation *)v16 evaluateWithGroundTruthResults:v12 inferenceResults:v14 reasonResultByAssetIdentifier:v15];
  [(PGPhotosChallengeMetricEvent *)self setEvaluation:v16];
  if (v7)
  {
    if (CFAbsoluteTimeGetCurrent() - v8 >= 0.01)
    {
      char v22 = 0;
      v7[2](v7, &v22, 1.0);
      if (v22)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          int v24 = 3083;
          __int16 v25 = 2080;
          long long v26 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metric"
                "s/MetricEvents/PGPhotosChallengeMetricEvent.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
      }
    }
  }

LABEL_13:
}

void __95__PGPhotosChallengeMetricEvent__gatherMetricsForStoryPromptSuggestionsQuestions_progressBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 type] == 30) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (void)_gatherMetricsForExternalAssetRelevanceQuestions:(id)a3 questionMetricType:(unsigned __int16)a4 progressBlock:(id)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  double v8 = (void (**)(void *, unsigned char *, double))_Block_copy(a5);
  double v9 = 0.0;
  if (!v8 || (double v10 = CFAbsoluteTimeGetCurrent(), v10 < 0.01))
  {
LABEL_7:
    uint64_t v29 = self;
    uint64_t v30 = v8;
    id v33 = [MEMORY[0x1E4F1CA60] dictionary];
    [MEMORY[0x1E4F1CA60] dictionary];
    v32 = id v31 = v7;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v11 = v7;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v35;
      uint64_t v15 = *MEMORY[0x1E4F8E958];
      uint64_t v16 = MEMORY[0x1E4F1CC28];
      uint64_t v17 = MEMORY[0x1E4F1CC38];
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v35 != v14) {
            objc_enumerationMutation(v11);
          }
          long long v19 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          if ([v19 type] == 29)
          {
            long long v20 = [v19 entityIdentifier];
            if ([v19 state] == 2) {
              uint64_t v21 = v17;
            }
            else {
              uint64_t v21 = v16;
            }
            [v33 setObject:v21 forKeyedSubscript:v20];
            char v22 = [v19 additionalInfo];
            long long v23 = [v22 objectForKeyedSubscript:v15];

            [v32 setObject:v23 forKeyedSubscript:v20];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v34 objects:v39 count:16];
      }
      while (v13);
    }

    double v8 = v30;
    if (v30)
    {
      double Current = CFAbsoluteTimeGetCurrent();
      __int16 v25 = (double *)&unk_1D1F48000;
      long long v26 = v29;
      if (Current - v9 >= 0.01)
      {
        char v38 = 0;
        v30[2](v30, &v38, 0.9);
        if (v38)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            int v41 = 3056;
            __int16 v42 = 2080;
            v43 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metr"
                  "ics/MetricEvents/PGPhotosChallengeMetricEvent.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          id v7 = v31;
LABEL_32:

          goto LABEL_33;
        }
        double v9 = Current;
      }
    }
    else
    {
      __int16 v25 = (double *)&unk_1D1F48000;
      long long v26 = v29;
    }
    uint64_t v27 = [[PGPrecisionRecallEvaluation alloc] initWithIdentifier:@"externalAssetRelevance" category:@"externalAssetRelevance"];
    [(PGPhotosChallengeMetricEvent *)v26 setEvaluation:v27];

    uint64_t v28 = [(PGPhotosChallengeMetricEvent *)v26 evaluation];
    [v28 evaluateWithGroundTruthResults:v33 andInferenceResults:v32];

    id v7 = v31;
    if (v30)
    {
      if (CFAbsoluteTimeGetCurrent() - v9 >= v25[87])
      {
        char v38 = 0;
        v30[2](v30, &v38, 1.0);
        if (v38)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            int v41 = 3060;
            __int16 v42 = 2080;
            v43 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metr"
                  "ics/MetricEvents/PGPhotosChallengeMetricEvent.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
        }
      }
    }
    goto LABEL_32;
  }
  char v38 = 0;
  v8[2](v8, &v38, 0.0);
  if (!v38)
  {
    double v9 = v10;
    goto LABEL_7;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    int v41 = 3040;
    __int16 v42 = 2080;
    v43 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/Metr"
          "icEvents/PGPhotosChallengeMetricEvent.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_33:
}

- (id)_locationRepresentativeAssetFromQuestion:(id)a3
{
  id v4 = a3;
  id v5 = [(PGPhotosChallengeMetricEvent *)self metricsCache];
  id v6 = [v5 assetByAssetIdentifier];
  id v7 = [v4 entityIdentifier];

  double v8 = [v6 objectForKeyedSubscript:v7];

  return v8;
}

- (id)_locationRepresentativeAssetsGroundTruthByAssetIdentifiersFromQuestions:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v12 = -[PGPhotosChallengeMetricEvent _locationRepresentativeAssetFromQuestion:](self, "_locationRepresentativeAssetFromQuestion:", v11, (void)v15);
        if (v12) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  uint64_t v13 = [(PGPhotosChallengeMetricEvent *)self _groundTruthByAssetIdentifiersFromQuestions:v5];

  return v13;
}

- (id)_inferredResultsForLocationRepresentativeAssets:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "iconicScoreProperties", (void)v20);
        [v11 iconicScore];
        double v13 = v12;

        uint64_t v14 = [v10 curationModel];
        long long v15 = [v14 iconicScoreModel];

        [v15 minimumMeaningfulIconicScore];
        long long v17 = [NSNumber numberWithBool:v13 >= v16];
        long long v18 = [v10 uuid];
        [v4 setObject:v17 forKeyedSubscript:v18];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)_inferredReasonForLocationRepresentativeAssets:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = v3;
  uint64_t v40 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (v40)
  {
    id v5 = 0;
    uint64_t v39 = *(void *)v42;
    uint64_t v38 = *MEMORY[0x1E4F8E908];
    id v36 = v4;
    while (1)
    {
      for (uint64_t i = 0; i != v40; ++i)
      {
        if (*(void *)v42 != v39) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        uint64_t v8 = (void *)MEMORY[0x1D25FED50]();
        uint64_t v9 = [v7 iconicScoreProperties];
        [v9 iconicScore];
        double v11 = v10;

        double v12 = [v7 curationModel];
        double v13 = [v12 iconicScoreModel];

        [v13 highIconicScore];
        double v15 = v14;
        [v13 mediumIconicScore];
        double v17 = v16;
        [v13 minimumMeaningfulIconicScore];
        double v19 = v18;
        long long v20 = (void *)MEMORY[0x1E4F38F48];
        long long v21 = [v7 location];
        [v21 coordinate];
        double v23 = v22;
        int v24 = [v7 location];
        [v24 coordinate];
        uint64_t v25 = objc_msgSend(v20, "poiGeoHashWithGeoHashSize:latitude:longitude:", v38, v23);

        if (v11 > v15)
        {
          long long v26 = NSString;
          uint64_t v27 = [NSNumber numberWithDouble:v15];
          [v26 stringWithFormat:@"iconicScore>%@", v27];
          uint64_t v28 = LABEL_8:;
          goto LABEL_15;
        }
        if (v11 <= v17)
        {
          if (v11 <= v19)
          {
            uint64_t v29 = NSString;
            uint64_t v27 = [NSNumber numberWithDouble:v19];
            [v29 stringWithFormat:@"iconicScore<%@", v27];
            goto LABEL_8;
          }
          uint64_t v30 = NSString;
          uint64_t v27 = [NSNumber numberWithDouble:v19];
          id v31 = NSNumber;
          double v32 = v17;
        }
        else
        {
          uint64_t v30 = NSString;
          uint64_t v27 = [NSNumber numberWithDouble:v17];
          id v31 = NSNumber;
          double v32 = v15;
        }
        uint64_t v33 = [v31 numberWithDouble:v32];
        uint64_t v28 = [v30 stringWithFormat:@"iconicScore:%@-%@", v27, v33];

        id v5 = (void *)v33;
        id v4 = v36;
LABEL_15:

        id v5 = [NSString stringWithFormat:@"%@:%@", v25, v28];

        long long v34 = [v7 uuid];
        [v4 setObject:v5 forKeyedSubscript:v34];
      }
      uint64_t v40 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
      if (!v40)
      {

        break;
      }
    }
  }

  return v4;
}

- (id)_reasonResultsForQuestions:(id)a3 inferenceResults:(id)a4 inferenceReasons:(id)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v34 = a4;
  id v32 = a5;
  id v33 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = v7;
  uint64_t v8 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v31 = *(void *)v36;
    uint64_t v30 = *MEMORY[0x1E4F8E920];
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v36 != v31) {
          objc_enumerationMutation(obj);
        }
        double v11 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        double v12 = [v11 entityIdentifier];
        if ([v11 state] == 2) {
          double v13 = @"YES";
        }
        else {
          double v13 = @"NO";
        }
        double v14 = v13;
        double v15 = [v11 additionalInfo];
        uint64_t v16 = [v15 objectForKeyedSubscript:v30];
        double v17 = (void *)v16;
        if (v16) {
          double v18 = (__CFString *)v16;
        }
        else {
          double v18 = @"None";
        }
        double v19 = v18;

        long long v20 = [v34 objectForKeyedSubscript:v12];
        if ([v20 isEqual:&unk_1F28D2E08]) {
          long long v21 = @"YES";
        }
        else {
          long long v21 = @"NO";
        }
        double v22 = v21;

        uint64_t v23 = [v32 objectForKeyedSubscript:v12];
        int v24 = (void *)v23;
        if (v23) {
          uint64_t v25 = (__CFString *)v23;
        }
        else {
          uint64_t v25 = @"None";
        }
        long long v26 = v25;

        uint64_t v27 = [NSString stringWithFormat:@"[%@->%@]-[%@->%@]", v14, v19, v22, v26];

        [v33 setObject:v27 forKeyedSubscript:v12];
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v9);
  }

  return v33;
}

- (void)_gatherMetricsForLocationRepresentativeAssetQuestions:(id)a3 questionMetricType:(unsigned __int16)a4 progressBlock:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = (void (**)(void *, unsigned char *, double))_Block_copy(a5);
  if (!v8)
  {
    double v12 = [(PGPhotosChallengeMetricEvent *)self _locationRepresentativeAssetsGroundTruthByAssetIdentifiersFromQuestions:v7];
    double v10 = 0.0;
    goto LABEL_13;
  }
  double Current = CFAbsoluteTimeGetCurrent();
  double v10 = 0.0;
  if (Current < 0.01)
  {
LABEL_8:
    double v12 = [(PGPhotosChallengeMetricEvent *)self _locationRepresentativeAssetsGroundTruthByAssetIdentifiersFromQuestions:v7];
    double v13 = CFAbsoluteTimeGetCurrent();
    if (v13 - v10 >= 0.01)
    {
      char v23 = 0;
      v8[2](v8, &v23, 0.3);
      if (v23)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          int v25 = 2951;
          __int16 v26 = 2080;
          uint64_t v27 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metric"
                "s/MetricEvents/PGPhotosChallengeMetricEvent.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        goto LABEL_33;
      }
      double v10 = v13;
    }
LABEL_13:
    double v14 = [(PGPhotosChallengeMetricEvent *)self metricsCache];
    double v15 = [v14 assetByAssetIdentifier];
    uint64_t v16 = [v15 allValues];

    [(CLSCurationSession *)self->_curationSession prepareAssets:v16];
    double v17 = [(PGPhotosChallengeMetricEvent *)self _inferredResultsForLocationRepresentativeAssets:v16];
    if (v8)
    {
      double v18 = CFAbsoluteTimeGetCurrent();
      if (v18 - v10 >= 0.01)
      {
        char v23 = 0;
        v8[2](v8, &v23, 0.6);
        if (v23)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            int v25 = 2956;
            __int16 v26 = 2080;
            uint64_t v27 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metr"
                  "ics/MetricEvents/PGPhotosChallengeMetricEvent.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          goto LABEL_32;
        }
        double v10 = v18;
      }
    }
    double v19 = [(PGPhotosChallengeMetricEvent *)self _inferredReasonForLocationRepresentativeAssets:v16];
    long long v20 = [(PGPhotosChallengeMetricEvent *)self _reasonResultsForQuestions:v7 inferenceResults:v17 inferenceReasons:v19];
    if (v8)
    {
      double v21 = CFAbsoluteTimeGetCurrent();
      if (v21 - v10 >= 0.01)
      {
        char v23 = 0;
        v8[2](v8, &v23, 0.9);
        if (v23)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            int v25 = 2960;
            __int16 v26 = 2080;
            uint64_t v27 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metr"
                  "ics/MetricEvents/PGPhotosChallengeMetricEvent.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
LABEL_31:

LABEL_32:
LABEL_33:

          goto LABEL_34;
        }
        double v10 = v21;
      }
    }
    double v22 = [[PGAssetsWithReasonPrecisionRecallEvaluation alloc] initWithIdentifier:@"locationRepresentativeAssets" category:@"locationRepresentativeAssets"];
    [(PGAssetsWithReasonPrecisionRecallEvaluation *)v22 evaluateWithGroundTruthResults:v12 inferenceResults:v17 reasonResultByAssetIdentifier:v20];
    [(PGPhotosChallengeMetricEvent *)self setEvaluation:v22];
    if (v8)
    {
      if (CFAbsoluteTimeGetCurrent() - v10 >= 0.01)
      {
        char v23 = 0;
        v8[2](v8, &v23, 1.0);
        if (v23)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            int v25 = 2965;
            __int16 v26 = 2080;
            uint64_t v27 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metr"
                  "ics/MetricEvents/PGPhotosChallengeMetricEvent.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
        }
      }
    }

    goto LABEL_31;
  }
  double v11 = Current;
  char v23 = 0;
  v8[2](v8, &v23, 0.0);
  if (!v23)
  {
    double v10 = v11;
    goto LABEL_8;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    int v25 = 2949;
    __int16 v26 = 2080;
    uint64_t v27 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/Metr"
          "icEvents/PGPhotosChallengeMetricEvent.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_34:
}

- (id)_fetchPersonFromAsset:(id)a3 detectionType:(signed __int16)a4
{
  uint64_t v4 = a4;
  v20[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(PGManagerWorkingContext *)self->_workingContext photoLibrary];
  uint64_t v8 = [v7 librarySpecificFetchOptions];

  uint64_t v9 = [NSNumber numberWithShort:v4];
  v20[0] = v9;
  double v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  [v8 setIncludedDetectionTypes:v10];

  double v11 = [MEMORY[0x1E4F391F0] fetchPersonsInAsset:v6 options:v8];
  double v12 = [v11 firstObject];

  if (!v12)
  {
    double v13 = +[PGLogging sharedLogging];
    double v14 = [v13 loggingConnection];

    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = [v6 uuid];
      v17[0] = 67109378;
      v17[1] = v4;
      __int16 v18 = 2112;
      double v19 = v16;
      _os_log_error_impl(&dword_1D1805000, v14, OS_LOG_TYPE_ERROR, "Cannot find PHPerson with detectionType %d in asset %@", (uint8_t *)v17, 0x12u);
    }
  }

  return v12;
}

- (id)_vipPetIdentifiersWithCurationContext:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = +[PGGraphPetIdentityProcessor fetchInterestingEligiblePetsForWallpaperWithWorkingContext:self->_workingContext curationContext:a3];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "localIdentifier", (void)v12);
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)_vipPersonIdentifiersWithCurationContext:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  __int16 v18 = __Block_byref_object_copy__72429;
  double v19 = __Block_byref_object_dispose__72430;
  id v20 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v5 = [MEMORY[0x1E4F8E858] primaryOrientation];
  workingContext = self->_workingContext;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __73__PGPhotosChallengeMetricEvent__vipPersonIdentifiersWithCurationContext___block_invoke;
  v10[3] = &unk_1E68F0C70;
  uint64_t v14 = v5;
  id v7 = v4;
  id v11 = v7;
  long long v12 = self;
  long long v13 = &v15;
  [(PGManagerWorkingContext *)workingContext performSynchronousConcurrentGraphReadUsingBlock:v10];
  id v8 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v8;
}

void __73__PGPhotosChallengeMetricEvent__vipPersonIdentifiersWithCurationContext___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = [[PGPeopleWallpaperSuggesterFilteringContext alloc] initForPeopleInOrientation:a1[7]];
  uint64_t v5 = [PGPeopleWallpaperSuggesterPersonImportanceAnalyzer alloc];
  uint64_t v6 = [v3 graph];

  uint64_t v7 = a1[4];
  id v8 = [*(id *)(a1[5] + 8) loggingConnection];
  uint64_t v9 = [(PGPeopleWallpaperSuggesterPersonImportanceAnalyzer *)v5 initWithGraph:v6 curationContext:v7 loggingConnection:v8];

  [v4 normalizedDeviationForVeryImportantPersons];
  -[PGPeopleWallpaperSuggesterPersonImportanceAnalyzer setNormalizedDeviationForVeryImportantPersons:](v9, "setNormalizedDeviationForVeryImportantPersons:");
  [v4 normalizedDeviationForImportantPersons];
  -[PGPeopleWallpaperSuggesterPersonImportanceAnalyzer setNormalizedDeviationForImportantPersons:](v9, "setNormalizedDeviationForImportantPersons:");
  -[PGPeopleWallpaperSuggesterPersonImportanceAnalyzer setFavoritePersonsAreVIPs:](v9, "setFavoritePersonsAreVIPs:", [v4 favoritePersonsAreVIPs]);
  double v10 = [(PGPeopleWallpaperSuggesterPersonImportanceAnalyzer *)v9 personInformationsWithProgress:&__block_literal_global_72434];
  uint64_t v11 = [v4 minimumPersonImportance];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __73__PGPhotosChallengeMetricEvent__vipPersonIdentifiersWithCurationContext___block_invoke_3;
  v12[3] = &unk_1E68F0C48;
  v12[4] = a1[6];
  v12[5] = v11;
  [v10 enumerateObjectsUsingBlock:v12];
}

void __73__PGPhotosChallengeMetricEvent__vipPersonIdentifiersWithCurationContext___block_invoke_3(uint64_t a1, void *a2)
{
  id v7 = a2;
  if ([v7 importance] >= *(void *)(a1 + 40) && objc_msgSend(v7, "importance") != 3)
  {
    id v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    id v4 = [v7 personLocalIdentifier];
    [v3 addObject:v4];

    uint64_t v5 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    uint64_t v6 = [v7 dupedPersonLocalIdentifiers];
    [v5 unionSet:v6];
  }
}

- (void)_gatherMetricsForWallpaperQuestions:(id)a3 questionMetricType:(unsigned __int16)a4 progressBlock:(id)a5
{
  unsigned int v99 = a4;
  uint64_t v116 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = (void (**)(void *, unsigned char *, double))_Block_copy(a5);
  if (!v8)
  {
    double v10 = 0.0;
    if (![v7 count]) {
      goto LABEL_76;
    }
    goto LABEL_10;
  }
  double Current = CFAbsoluteTimeGetCurrent();
  double v10 = 0.0;
  if (Current >= 0.01)
  {
    double v11 = Current;
    char v108 = 0;
    v8[2](v8, &v108, 0.0);
    if (v108)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        int v113 = 2761;
        __int16 v114 = 2080;
        v115 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics"
               "/MetricEvents/PGPhotosChallengeMetricEvent.m";
        long long v12 = MEMORY[0x1E4F14500];
LABEL_29:
        _os_log_impl(&dword_1D1805000, v12, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        goto LABEL_76;
      }
      goto LABEL_76;
    }
    double v10 = v11;
  }
  if ([v7 count])
  {
LABEL_10:
    v85 = v8;
    id v93 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v104 = 0u;
    long long v105 = 0u;
    long long v106 = 0u;
    long long v107 = 0u;
    id v84 = v7;
    id v13 = v7;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v104 objects:v111 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v105;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v105 != v16) {
            objc_enumerationMutation(v13);
          }
          __int16 v18 = *(void **)(*((void *)&v104 + 1) + 8 * i);
          double v19 = [v18 additionalInfo];
          id v20 = [v19 objectForKeyedSubscript:@"suggestionSubtype"];
          unsigned __int16 v21 = [v20 integerValue];

          if ([(id)objc_opt_class() wallpaperSuggestionSubtypeForQuestionMetricType:v99] == v21) {
            [v93 addObject:v18];
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v104 objects:v111 count:16];
      }
      while (v15);
    }

    double v22 = [(PGPhotosChallengeMetricEvent *)self _groundTruthByAssetIdentifiersFromQuestions:v93];
    id v8 = v85;
    if (v85)
    {
      double v23 = CFAbsoluteTimeGetCurrent();
      if (v23 - v10 >= 0.01)
      {
        char v108 = 0;
        v85[2](v85, &v108, 0.5);
        if (v108)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            int v113 = 2778;
            __int16 v114 = 2080;
            v115 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Met"
                   "rics/MetricEvents/PGPhotosChallengeMetricEvent.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          id v7 = v84;
          goto LABEL_75;
        }
        double v10 = v23;
      }
    }
    v83 = v22;
    id v90 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v89 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    int v24 = [(PGManagerWorkingContext *)self->_workingContext photoLibrary];
    int v25 = [(PGPhotosChallengeMetricEvent *)self curationContext];
    v87 = [(PGPhotosChallengeMetricEvent *)self _vipPersonIdentifiersWithCurationContext:v25];

    __int16 v26 = [(PGPhotosChallengeMetricEvent *)self curationContext];
    v86 = [(PGPhotosChallengeMetricEvent *)self _vipPetIdentifiersWithCurationContext:v26];

    v82 = v24;
    uint64_t v27 = [v24 librarySpecificFetchOptions];
    uint64_t v28 = +[PGCurationManager assetPropertySetsForCuration];
    v97 = v27;
    [v27 setFetchPropertySets:v28];

    long long v102 = 0u;
    long long v103 = 0u;
    long long v100 = 0u;
    long long v101 = 0u;
    id obj = v93;
    uint64_t v98 = [obj countByEnumeratingWithState:&v100 objects:v110 count:16];
    if (v98)
    {
      unint64_t v29 = 0x1E4F38000uLL;
      uint64_t v96 = *(void *)v101;
      uint64_t v88 = *MEMORY[0x1E4F8E920];
      v91 = self;
      do
      {
        for (uint64_t j = 0; j != v98; ++j)
        {
          if (*(void *)v101 != v96) {
            objc_enumerationMutation(obj);
          }
          uint64_t v31 = *(void **)(*((void *)&v100 + 1) + 8 * j);
          id v32 = [v31 additionalInfo];
          id v33 = [v32 objectForKeyedSubscript:@"suggestionSubtype"];
          unsigned __int16 v34 = [v33 integerValue];

          long long v35 = [v31 entityIdentifier];
          long long v36 = *(void **)(v29 + 3768);
          v109 = v35;
          long long v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v109 count:1];
          long long v38 = [v36 fetchAssetsWithUUIDs:v37 options:v97];

          if ([v38 count])
          {
            uint64_t v39 = *(void **)(v29 + 3768);
            uint64_t v40 = [(PGPhotosChallengeMetricEvent *)self curationContext];
            long long v41 = [v39 clsAllAssetsFromFetchResult:v38 prefetchOptions:31 curationContext:v40];
            long long v42 = [v41 firstObject];

            int v43 = v34;
            uint64_t v44 = [MEMORY[0x1E4F8E858] primaryOrientation];
            switch(v34)
            {
              case 0x28Cu:
                uint64_t v45 = [(PGPhotosChallengeMetricEvent *)self _fetchPersonFromAsset:v42 detectionType:1];
                if (v45)
                {
                  uint64_t v46 = (void *)v45;
                  v47 = [(PGPhotosChallengeMetricEvent *)self curationContext];
                  v95 = v42;
                  BOOL v48 = +[PGPeopleWallpaperSuggester passesFilteringWithAsset:v42 curationContext:v47 orientation:v44 reason:0];

                  v49 = [v46 localIdentifier];
                  uint64_t v50 = [v87 containsObject:v49];

                  unsigned int v94 = v50 & v48;
                  v51 = NSString;
                  v52 = [(id)objc_opt_class() _passedFilteringStringForResult:v48];
                  v53 = [(id)objc_opt_class() _isVIPStringForResult:v50];
                  [v51 stringWithFormat:@"%@|%@", v52, v53];
                  goto LABEL_42;
                }
                goto LABEL_58;
              case 0x28Du:
                uint64_t v54 = [(PGPhotosChallengeMetricEvent *)self _fetchPersonFromAsset:v42 detectionType:2];
                if (v54)
                {
                  uint64_t v46 = (void *)v54;
                  v55 = [(PGPhotosChallengeMetricEvent *)self curationContext];
                  v95 = v42;
                  BOOL v56 = +[PGPetWallpaperSuggester passesFilteringWithAsset:v42 curationContext:v55 orientation:v44 reason:0];

                  v57 = [v46 localIdentifier];
                  uint64_t v58 = [v86 containsObject:v57];

                  unsigned int v94 = v58 & v56;
                  v59 = NSString;
                  v52 = [(id)objc_opt_class() _passedFilteringStringForResult:v56];
                  v53 = [(id)objc_opt_class() _isVIPStringForResult:v58];
                  [v59 stringWithFormat:@"%@|%@", v52, v53];
                  v60 = LABEL_42:;

                  goto LABEL_46;
                }
                goto LABEL_58;
              case 0x28Eu:
                v61 = [(PGPhotosChallengeMetricEvent *)self curationContext];
                BOOL v62 = +[PGLandscapeWallpaperSuggester passesFilteringWithAsset:v42 curationContext:v61 orientation:v44 reason:0];

                v95 = v42;
                uint64_t v63 = [(id)objc_opt_class() _isHighPrecisionLandscapeAsset:v42];
                goto LABEL_45;
              case 0x28Fu:
                v64 = [(PGPhotosChallengeMetricEvent *)self curationContext];
                BOOL v62 = +[PGCityscapeWallpaperSuggester passesFilteringWithAsset:v42 curationContext:v64 orientation:v44 reason:0];

                v95 = v42;
                uint64_t v63 = [(id)objc_opt_class() _isHighPrecisionCityscapeAsset:v42];
LABEL_45:
                uint64_t v65 = v63;
                unsigned int v94 = v62 & v63;
                v66 = NSString;
                uint64_t v46 = [(id)objc_opt_class() _passedFilteringStringForResult:v62];
                v52 = [(id)objc_opt_class() _passedHighPrecisionStringForResult:v65];
                v60 = [v66 stringWithFormat:@"%@|%@", v46, v52];
LABEL_46:

                if ([v31 state] == 2) {
                  v67 = @"YES";
                }
                else {
                  v67 = @"NO";
                }
                v68 = v67;
                v69 = [v31 additionalInfo];
                uint64_t v70 = [v69 objectForKeyedSubscript:v88];
                v71 = (void *)v70;
                v72 = @"None";
                if (v70) {
                  v72 = (__CFString *)v70;
                }
                v73 = v72;

                if (v94) {
                  v74 = @"YES";
                }
                else {
                  v74 = @"NO";
                }
                v75 = [NSString stringWithFormat:@"[%@->%@]-[%@->%@]", v68, v73, v74, v60];

                v76 = [NSNumber numberWithBool:v94];
                [v90 setObject:v76 forKeyedSubscript:v35];

                [v89 setObject:v75 forKeyedSubscript:v35];
                self = v91;
                long long v42 = v95;
                goto LABEL_57;
              default:
                v77 = +[PGLogging sharedLogging];
                v60 = [v77 loggingConnection];

                if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
                {
                  v78 = [v31 uuid];
                  *(_DWORD *)buf = 67109378;
                  int v113 = v43;
                  __int16 v114 = 2112;
                  v115 = v78;
                  _os_log_error_impl(&dword_1D1805000, v60, OS_LOG_TYPE_ERROR, "Unsupported Wallpaper Subtype %d for question %@", buf, 0x12u);
                }
LABEL_57:

LABEL_58:
                unint64_t v29 = 0x1E4F38000;
                break;
            }
          }
        }
        uint64_t v98 = [obj countByEnumeratingWithState:&v100 objects:v110 count:16];
      }
      while (v98);
    }

    id v8 = v85;
    if (v85)
    {
      double v79 = CFAbsoluteTimeGetCurrent();
      double v22 = v83;
      id v7 = v84;
      if (v79 - v10 >= 0.01)
      {
        char v108 = 0;
        v85[2](v85, &v108, 0.9);
        if (v108)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            int v113 = 2850;
            __int16 v114 = 2080;
            v115 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Met"
                   "rics/MetricEvents/PGPhotosChallengeMetricEvent.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
LABEL_74:

LABEL_75:
          goto LABEL_76;
        }
        double v10 = v79;
      }
    }
    else
    {
      double v22 = v83;
      id v7 = v84;
    }
    v80 = [(id)objc_opt_class() stringFromQuestionMetricType:v99];
    v81 = [[PGAssetsWithReasonPrecisionRecallEvaluation alloc] initWithIdentifier:@"wallpaper" category:v80];
    [(PGAssetsWithReasonPrecisionRecallEvaluation *)v81 evaluateWithGroundTruthResults:v22 inferenceResults:v90 reasonResultByAssetIdentifier:v89];
    [(PGPhotosChallengeMetricEvent *)self setEvaluation:v81];
    if (v85)
    {
      if (CFAbsoluteTimeGetCurrent() - v10 >= 0.01)
      {
        char v108 = 0;
        v85[2](v85, &v108, 1.0);
        if (v108)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            int v113 = 2858;
            __int16 v114 = 2080;
            v115 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Met"
                   "rics/MetricEvents/PGPhotosChallengeMetricEvent.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
        }
      }
    }

    goto LABEL_74;
  }
  if (CFAbsoluteTimeGetCurrent() - v10 >= 0.01)
  {
    char v108 = 0;
    v8[2](v8, &v108, 1.0);
    if (v108)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        int v113 = 2764;
        __int16 v114 = 2080;
        v115 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics"
               "/MetricEvents/PGPhotosChallengeMetricEvent.m";
        long long v12 = MEMORY[0x1E4F14500];
        goto LABEL_29;
      }
    }
  }
LABEL_76:
}

- (void)_gatherMetricsForCameraLibrarySwitchQuestions:(id)a3 progressBlock:(id)a4
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(void *, unsigned char *, double))_Block_copy(a4);
  double v8 = 0.0;
  if (!v7 || (double v9 = CFAbsoluteTimeGetCurrent(), v9 < 0.01))
  {
LABEL_7:
    double v10 = [(PGPhotosChallengeMetricEvent *)self _groundTruthByAssetIdentifiersFromQuestions:v6];
    if (![v10 count])
    {
      id v13 = +[PGLogging sharedLogging];
      uint64_t v14 = [v13 loggingConnection];

      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        int v59 = [v10 count];
        *(_DWORD *)buf = 67109120;
        int v85 = v59;
        _os_log_error_impl(&dword_1D1805000, v14, OS_LOG_TYPE_ERROR, "Camera library switch: ground truth, %d is empty", buf, 8u);
      }

      uint64_t v15 = [[PGAssetsWithReasonPrecisionRecallEvaluation alloc] initWithIdentifier:@"cameraLibrarySwitch" category:@"sharedLibraryAssets"];
      [(PGAssetsWithReasonPrecisionRecallEvaluation *)v15 evaluateWithGroundTruthResults:v10 inferenceResults:MEMORY[0x1E4F1CC08] reasonResultByAssetIdentifier:MEMORY[0x1E4F1CC08]];
      [(PGPhotosChallengeMetricEvent *)self setEvaluation:v15];
      if (v7)
      {
        if (CFAbsoluteTimeGetCurrent() - v8 >= 0.01)
        {
          char v81 = 0;
          v7[2](v7, &v81, 1.0);
          if (v81)
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              int v85 = 2675;
              __int16 v86 = 2080;
              v87 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Me"
                    "trics/MetricEvents/PGPhotosChallengeMetricEvent.m";
              _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
          }
        }
      }

      goto LABEL_79;
    }
    if (v7)
    {
      double Current = CFAbsoluteTimeGetCurrent();
      if (Current - v8 >= 0.01)
      {
        char v81 = 0;
        v7[2](v7, &v81, 0.2);
        if (v81)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            int v85 = 2679;
            __int16 v86 = 2080;
            v87 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metr"
                  "ics/MetricEvents/PGPhotosChallengeMetricEvent.m";
            long long v12 = MEMORY[0x1E4F14500];
LABEL_45:
            _os_log_impl(&dword_1D1805000, v12, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            goto LABEL_79;
          }
          goto LABEL_79;
        }
        double v8 = Current;
      }
    }
    long long v79 = 0u;
    long long v80 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    uint64_t v16 = v6;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v77 objects:v83 count:16];
    v60 = self;
    v61 = v10;
    id v62 = v6;
    uint64_t v63 = v7;
    if (v17)
    {
      uint64_t v18 = v17;
      char v19 = 0;
      uint64_t v20 = *(void *)v78;
      unsigned __int16 v21 = @"libraryScopeUUID";
      v71 = v16;
      while (2)
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v78 != v20) {
            objc_enumerationMutation(v16);
          }
          double v23 = *(void **)(*((void *)&v77 + 1) + 8 * i);
          int v24 = [v23 additionalInfo];
          int v25 = [v24 objectForKeyedSubscript:v21];

          if (!v25)
          {
            __int16 v26 = [v23 additionalInfo];
            uint64_t v27 = [v26 objectForKeyedSubscript:@"previousCameraLibrarySwitchState"];
            if ([v27 isEqualToString:@"auto on"])
            {

LABEL_39:
              int v69 = 0;
              uint64_t v16 = v71;
              unsigned __int16 v34 = v71;
              id v6 = v62;
              id v7 = v63;
              double v10 = v61;
              goto LABEL_40;
            }
            uint64_t v28 = v20;
            unint64_t v29 = v21;
            uint64_t v30 = [v23 additionalInfo];
            uint64_t v31 = [v30 objectForKeyedSubscript:@"currentCameraLibrarySwitchState"];
            int v32 = [v31 isEqualToString:@"auto on"];

            if (v32) {
              goto LABEL_39;
            }
            char v19 = 1;
            uint64_t v16 = v71;
            unsigned __int16 v21 = v29;
            uint64_t v20 = v28;
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v77 objects:v83 count:16];
        if (v18) {
          continue;
        }
        break;
      }

      if ((v19 & 1) == 0)
      {
        int v69 = 1;
        id v6 = v62;
        id v7 = v63;
        double v10 = v61;
        if (!v63) {
          goto LABEL_47;
        }
        goto LABEL_41;
      }
      id v33 = +[PGLogging sharedLogging];
      unsigned __int16 v34 = [v33 loggingConnection];

      id v7 = v63;
      double v10 = v61;
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D1805000, v34, OS_LOG_TYPE_ERROR, "Excluding questions without library scope from Camera library switch challenge evaluation", buf, 2u);
      }
      int v69 = 1;
      id v6 = v62;
    }
    else
    {
      int v69 = 1;
      unsigned __int16 v34 = v16;
    }
LABEL_40:

    if (!v7) {
      goto LABEL_47;
    }
LABEL_41:
    double v35 = CFAbsoluteTimeGetCurrent();
    if (v35 - v8 >= 0.01)
    {
      char v81 = 0;
      v7[2](v7, &v81, 0.3);
      if (v81)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          int v85 = 2705;
          __int16 v86 = 2080;
          v87 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metric"
                "s/MetricEvents/PGPhotosChallengeMetricEvent.m";
          long long v12 = MEMORY[0x1E4F14500];
          goto LABEL_45;
        }
LABEL_79:

        goto LABEL_80;
      }
      double v8 = v35;
    }
LABEL_47:
    id v67 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v66 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v73 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    id obj = v16;
    uint64_t v70 = [obj countByEnumeratingWithState:&v73 objects:v82 count:16];
    if (v70)
    {
      uint64_t v68 = *(void *)v74;
      uint64_t v65 = *MEMORY[0x1E4F8E920];
      do
      {
        for (uint64_t j = 0; j != v70; ++j)
        {
          if (*(void *)v74 != v68) {
            objc_enumerationMutation(obj);
          }
          long long v37 = *(void **)(*((void *)&v73 + 1) + 8 * j);
          long long v38 = [v37 additionalInfo];
          uint64_t v39 = v38;
          if (!v69
            || ([v38 objectForKeyedSubscript:@"libraryScopeUUID"],
                uint64_t v40 = objc_claimAutoreleasedReturnValue(),
                v40,
                v40))
          {
            int v41 = [v37 state];
            long long v42 = @"NO";
            if (v41 == 2) {
              long long v42 = @"YES";
            }
            int v43 = v42;
            uint64_t v44 = [v39 objectForKeyedSubscript:v65];
            uint64_t v45 = (void *)v44;
            uint64_t v46 = @"None";
            if (v44) {
              uint64_t v46 = (__CFString *)v44;
            }
            v47 = v46;

            uint64_t v48 = [v39 objectForKeyedSubscript:@"previousCameraLibrarySwitchState"];
            v49 = [v39 objectForKeyedSubscript:@"currentCameraLibrarySwitchState"];
            if (([v49 isEqualToString:@"auto on"] & 1) != 0
              || [v49 isEqualToString:@"user on"])
            {
              uint64_t v50 = 1;
              v51 = @"YES";
            }
            else
            {
              uint64_t v50 = 0;
              v51 = @"NO";
            }
            [NSString stringWithFormat:@"%@ to %@", v48, v49];
            v52 = v72 = (void *)v48;
            v53 = [NSString stringWithFormat:@"[%@->%@]-[%@->%@]", v43, v47, v51, v52];

            uint64_t v54 = [v37 entityIdentifier];
            [v66 setObject:v53 forKeyedSubscript:v54];
            v55 = [NSNumber numberWithBool:v50];
            [v67 setObject:v55 forKeyedSubscript:v54];
          }
        }
        uint64_t v70 = [obj countByEnumeratingWithState:&v73 objects:v82 count:16];
      }
      while (v70);
    }

    id v7 = v63;
    if (v63)
    {
      double v56 = CFAbsoluteTimeGetCurrent();
      double v10 = v61;
      id v6 = v62;
      v57 = v60;
      if (v56 - v8 >= 0.01)
      {
        char v81 = 0;
        v63[2](v63, &v81, 0.9);
        if (v81)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            int v85 = 2732;
            __int16 v86 = 2080;
            v87 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metr"
                  "ics/MetricEvents/PGPhotosChallengeMetricEvent.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
LABEL_78:

          goto LABEL_79;
        }
        double v8 = v56;
      }
    }
    else
    {
      double v10 = v61;
      id v6 = v62;
      v57 = v60;
    }
    uint64_t v58 = [[PGAssetsWithReasonPrecisionRecallEvaluation alloc] initWithIdentifier:@"cameraLibrarySwitch" category:@"sharedLibraryAssets"];
    [(PGAssetsWithReasonPrecisionRecallEvaluation *)v58 evaluateWithGroundTruthResults:v10 inferenceResults:v67 reasonResultByAssetIdentifier:v66];
    [(PGPhotosChallengeMetricEvent *)v57 setEvaluation:v58];
    if (v63)
    {
      if (CFAbsoluteTimeGetCurrent() - v8 >= 0.01)
      {
        char v81 = 0;
        v63[2](v63, &v81, 1.0);
        if (v81)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            int v85 = 2737;
            __int16 v86 = 2080;
            v87 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metr"
                  "ics/MetricEvents/PGPhotosChallengeMetricEvent.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
        }
      }
    }

    goto LABEL_78;
  }
  char v81 = 0;
  v7[2](v7, &v81, 0.0);
  if (!v81)
  {
    double v8 = v9;
    goto LABEL_7;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    int v85 = 2665;
    __int16 v86 = 2080;
    v87 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/Metr"
          "icEvents/PGPhotosChallengeMetricEvent.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_80:
}

- (void)_gatherMetricsForSharedLibraryStartQuestions:(id)a3 progressBlock:(id)a4
{
  *(void *)&v35[5] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(void *, unsigned char *, double))_Block_copy(a4);
  if (v7)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    double v9 = 0.0;
    if (Current >= 0.01)
    {
      double v10 = Current;
      char v33 = 0;
      v7[2](v7, &v33, 0.0);
      if (v33)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          v35[0] = 2617;
          LOWORD(v35[1]) = 2080;
          *(void *)((char *)&v35[1] + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis"
                                             "/PhotosGraph/Framework/Metrics/MetricEvents/PGPhotosChallengeMetricEvent.m";
          double v11 = MEMORY[0x1E4F14500];
LABEL_30:
          _os_log_impl(&dword_1D1805000, v11, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          goto LABEL_56;
        }
        goto LABEL_56;
      }
      double v9 = v10;
    }
    if (![v6 count])
    {
      if (CFAbsoluteTimeGetCurrent() - v9 >= 0.01)
      {
        char v33 = 0;
        v7[2](v7, &v33, 1.0);
        if (v33)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v35[0] = 2620;
            LOWORD(v35[1]) = 2080;
            *(void *)((char *)&v35[1] + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalys"
                                               "is/PhotosGraph/Framework/Metrics/MetricEvents/PGPhotosChallengeMetricEvent.m";
            double v11 = MEMORY[0x1E4F14500];
            goto LABEL_30;
          }
        }
      }
      goto LABEL_56;
    }
  }
  else
  {
    double v9 = 0.0;
    if (![v6 count]) {
      goto LABEL_56;
    }
  }
  if ((unint64_t)[v6 count] < 2)
  {
    metricsCache = self->_metricsCache;
    id v32 = 0;
    BOOL v15 = [(PGPhotosChallengeMetricEventFetchHelper *)metricsCache suggestsToStartSharedLibraryWithError:&v32];
    id v16 = v32;
    if (v16)
    {
      uint64_t v17 = +[PGLogging sharedLogging];
      uint64_t v18 = [v17 loggingConnection];

      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)double v35 = v16;
        _os_log_error_impl(&dword_1D1805000, v18, OS_LOG_TYPE_ERROR, "Error getting startSharedLibrarySuggestion: %@", buf, 0xCu);
      }

      if (v7)
      {
        if (CFAbsoluteTimeGetCurrent() - v9 >= 0.01)
        {
          char v33 = 0;
          v7[2](v7, &v33, 1.0);
          if (v33)
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              v35[0] = 2634;
              LOWORD(v35[1]) = 2080;
              *(void *)((char *)&v35[1] + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanal"
                                                 "ysis/PhotosGraph/Framework/Metrics/MetricEvents/PGPhotosChallengeMetricEvent.m";
              _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
          }
        }
      }
    }
    else
    {
      char v19 = [v6 firstObject];
      int v20 = [v19 state];
      uint64_t v21 = 1;
      BOOL v22 = v20 == 2;
      if (v20 == 3) {
        BOOL v22 = 0;
      }
      else {
        uint64_t v21 = 0;
      }
      uint64_t v23 = 1;
      BOOL v24 = v20 == 2;
      if (v20 == 3) {
        BOOL v24 = 0;
      }
      else {
        uint64_t v23 = 0;
      }
      BOOL v25 = !v15;
      BOOL v26 = v15 && v24;
      if (v25) {
        uint64_t v27 = 0;
      }
      else {
        uint64_t v27 = v23;
      }
      if (v25) {
        uint64_t v28 = v21;
      }
      else {
        uint64_t v28 = 0;
      }
      BOOL v29 = v25 && v22;
      uint64_t v30 = [[PGPrecisionRecallEvaluation alloc] initWithIdentifier:@"sharedLibraryStart" category:@"sharedLibraryStart" truePositives:v26 falsePositives:v27 falseNegatives:v29 trueNegatives:v28];
      [(PGPhotosChallengeMetricEvent *)self setEvaluation:v30];

      if (v7)
      {
        if (CFAbsoluteTimeGetCurrent() - v9 >= 0.01)
        {
          char v33 = 0;
          v7[2](v7, &v33, 1.0);
          if (v33)
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              v35[0] = 2659;
              LOWORD(v35[1]) = 2080;
              *(void *)((char *)&v35[1] + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanal"
                                                 "ysis/PhotosGraph/Framework/Metrics/MetricEvents/PGPhotosChallengeMetricEvent.m";
              _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
          }
        }
      }
    }
  }
  else
  {
    long long v12 = +[PGLogging sharedLogging];
    id v13 = [v12 loggingConnection];

    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v31 = [v6 count];
      *(_DWORD *)buf = 67109120;
      v35[0] = v31;
      _os_log_error_impl(&dword_1D1805000, v13, OS_LOG_TYPE_ERROR, "Expected 1 shared library start question, found %d", buf, 8u);
    }

    if (v7)
    {
      if (CFAbsoluteTimeGetCurrent() - v9 >= 0.01)
      {
        char v33 = 0;
        v7[2](v7, &v33, 1.0);
        if (v33)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v35[0] = 2626;
            LOWORD(v35[1]) = 2080;
            *(void *)((char *)&v35[1] + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalys"
                                               "is/PhotosGraph/Framework/Metrics/MetricEvents/PGPhotosChallengeMetricEvent.m";
            double v11 = MEMORY[0x1E4F14500];
            goto LABEL_30;
          }
        }
      }
    }
  }
LABEL_56:
}

- (id)_getInferredReasonFromMatchedConditions:(id)a3 withFallbackReason:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  id v8 = v6;
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v20;
    id v8 = v6;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v5);
        }
        long long v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if ([v12 criteria])
        {
          id v13 = PLLibraryScopeConditionStringFromCriteria();
          [v12 type];
          uint64_t v14 = PLLibraryScopeConditionStringFromType();
          BOOL v15 = [v13 stringByAppendingFormat:@" %@", v14];
          id v16 = v15;
          if (v8 == v6)
          {
            id v17 = v15;
            id v8 = v6;
          }
          else
          {
            id v17 = [v8 stringByAppendingFormat:@" | %@", v15];
          }

          id v8 = v17;
        }
      }
      uint64_t v9 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v9);
  }

  return v8;
}

- (void)_gatherNearLiveSuggestionInferencesForQuestions:(id)a3 inferenceResults:(id)a4 reasonResultByAssetIdentifier:(id)a5 progressBlock:(id)a6
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v39 = a3;
  id v10 = a4;
  id v38 = a5;
  id v36 = a6;
  double v11 = 0.0;
  uint64_t v40 = (void (**)(void *, unsigned char *, double))_Block_copy(v36);
  if (!v40 || (double v12 = CFAbsoluteTimeGetCurrent(), v12 < 0.01))
  {
LABEL_7:
    *(void *)buf = 0;
    *(void *)&long long v61 = buf;
    *((void *)&v61 + 1) = 0x3032000000;
    id v62 = __Block_byref_object_copy__72429;
    uint64_t v63 = __Block_byref_object_dispose__72430;
    id v64 = 0;
    id v13 = [(PGManagerWorkingContext *)self->_workingContext photoLibrary];
    uint64_t v14 = [v13 managedObjectContext];
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __141__PGPhotosChallengeMetricEvent__gatherNearLiveSuggestionInferencesForQuestions_inferenceResults_reasonResultByAssetIdentifier_progressBlock___block_invoke;
    v53[3] = &unk_1E68F0BB8;
    v53[4] = self;
    v53[5] = buf;
    [v14 performBlockAndWait:v53];
    long long v37 = self;

    BOOL v15 = [(PGPhotosChallengeMetricEvent *)self metricsCache];
    int v41 = [v15 assetByAssetIdentifier];

    id v42 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v17 = v39;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v49 objects:v59 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v50;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v50 != v19) {
            objc_enumerationMutation(v17);
          }
          long long v21 = *(void **)(*((void *)&v49 + 1) + 8 * i);
          long long v22 = [v21 entityIdentifier];
          uint64_t v23 = [v10 objectForKeyedSubscript:v22];
          char v24 = [v23 BOOLValue];

          if ((v24 & 1) == 0)
          {
            BOOL v25 = [v21 entityIdentifier];
            BOOL v26 = [v41 objectForKeyedSubscript:v25];
            uint64_t v27 = [v26 objectID];

            [v42 addObject:v27];
            [v16 setObject:v21 forKeyedSubscript:v27];
          }
        }
        uint64_t v18 = [v17 countByEnumeratingWithState:&v49 objects:v59 count:16];
      }
      while (v18);
    }

    if (v40)
    {
      double Current = CFAbsoluteTimeGetCurrent();
      if (Current - v11 >= 0.01)
      {
        char v48 = 0;
        v40[2](v40, &v48, 0.4);
        if (v48)
        {
          if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
LABEL_30:

            _Block_object_dispose(buf, 8);
            goto LABEL_31;
          }
          *(_DWORD *)v55 = 67109378;
          int v56 = 2560;
          __int16 v57 = 2080;
          uint64_t v58 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metric"
                "s/MetricEvents/PGPhotosChallengeMetricEvent.m";
          BOOL v29 = MEMORY[0x1E4F14500];
LABEL_29:
          _os_log_impl(&dword_1D1805000, v29, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v55, 0x12u);
          goto LABEL_30;
        }
        double v11 = Current;
      }
    }
    if ([v42 count])
    {
      uint64_t v30 = (void *)MEMORY[0x1E4F28BA0];
      int v31 = PLManagedAssetPredicateToFetchAssetsToEvaluateSuggestionsForLibraryScope();
      v54[0] = v31;
      id v32 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"(%K & %d) != 0", @"libraryScopeShareState", 2, v36);
      v54[1] = v32;
      char v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:2];
      unsigned __int16 v34 = [v30 orPredicateWithSubpredicates:v33];

      double v35 = *(void **)(v61 + 40);
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __141__PGPhotosChallengeMetricEvent__gatherNearLiveSuggestionInferencesForQuestions_inferenceResults_reasonResultByAssetIdentifier_progressBlock___block_invoke_582;
      v43[3] = &unk_1E68F0BE0;
      id v44 = v16;
      uint64_t v45 = v37;
      id v46 = v10;
      id v47 = v38;
      [v35 evaluateAssetObjectIDs:v42 simulate:1 predicateToFetchAssetsToEvaluate:v34 withResultEnumerationBlock:v43];
    }
    if (!v40) {
      goto LABEL_30;
    }
    if (CFAbsoluteTimeGetCurrent() - v11 < 0.01) {
      goto LABEL_30;
    }
    char v48 = 0;
    v40[2](v40, &v48, 1.0);
    if (!v48 || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
      goto LABEL_30;
    }
    *(_DWORD *)v55 = 67109378;
    int v56 = 2588;
    __int16 v57 = 2080;
    uint64_t v58 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/Metr"
          "icEvents/PGPhotosChallengeMetricEvent.m";
    BOOL v29 = MEMORY[0x1E4F14500];
    goto LABEL_29;
  }
  v55[0] = 0;
  v40[2](v40, v55, 0.0);
  if (!v55[0])
  {
    double v11 = v12;
    goto LABEL_7;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&uint8_t buf[4] = 2538;
    LOWORD(v61) = 2080;
    *(void *)((char *)&v61 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Metrics/MetricEvents/PGPhotosChallengeMetricEvent.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_31:
}

void __141__PGPhotosChallengeMetricEvent__gatherNearLiveSuggestionInferencesForQuestions_inferenceResults_reasonResultByAssetIdentifier_progressBlock___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F8A8D8];
  id v3 = [*(id *)(*(void *)(a1 + 32) + 8) photoLibrary];
  id v4 = [v3 managedObjectContext];
  id v8 = [v2 activeLibraryScopeInManagedObjectContext:v4];

  uint64_t v5 = [objc_alloc(MEMORY[0x1E4F8A908]) initWithLibraryScope:v8];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void __141__PGPhotosChallengeMetricEvent__gatherNearLiveSuggestionInferencesForQuestions_inferenceResults_reasonResultByAssetIdentifier_progressBlock___block_invoke_582(id *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v19 = a4;
  uint64_t v6 = [a1[4] objectForKeyedSubscript:a2];
  uint64_t v7 = v6;
  if (v6)
  {
    id v8 = [v6 entityIdentifier];
    int v9 = [v7 state];
    id v10 = @"NO";
    if (v9 == 2) {
      id v10 = @"YES";
    }
    double v11 = v10;
    double v12 = [v7 additionalInfo];
    uint64_t v13 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F8E920]];
    uint64_t v14 = (void *)v13;
    BOOL v15 = @"None";
    if (v13) {
      BOOL v15 = (__CFString *)v13;
    }
    id v16 = v15;

    id v17 = [a1[5] _getInferredReasonFromMatchedConditions:v19 withFallbackReason:@"Near-live"];
    [a1[6] setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v8];
    uint64_t v18 = [NSString stringWithFormat:@"[%@->%@]-[%@->%@]", v11, v16, @"YES", v17];

    [a1[7] setObject:v18 forKeyedSubscript:v8];
  }
}

- (void)_gatherDeferredSuggestionInferencesForQuestions:(id)a3 momentUUIDS:(id)a4 inferenceResults:(id)a5 reasonResultByAssetIdentifier:(id)a6 progressBlock:(id)a7
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  id v55 = a3;
  id v56 = a4;
  id v61 = a5;
  id v60 = a6;
  id v54 = a7;
  double v11 = 0.0;
  uint64_t v58 = (void (**)(void *, unsigned char *, double))_Block_copy(v54);
  if (!v58 || (double v12 = CFAbsoluteTimeGetCurrent(), v12 < 0.01))
  {
LABEL_7:
    uint64_t v13 = [(PGManagerWorkingContext *)self->_workingContext photoLibrary];
    __int16 v57 = +[PGSharedLibrarySuggestionsProcessor libraryScopeToUseWithPhotoLibrary:v13];

    if (!v57)
    {
      long long v21 = [(PGManagerWorkingContext *)self->_workingContext loggingConnection];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1805000, v21, OS_LOG_TYPE_DEFAULT, "[PGSharedLibrarySuggestionsProcessor] Cannot instanciate without a valid library scope", buf, 2u);
      }
      goto LABEL_47;
    }
    uint64_t v14 = [[PGSharedLibrarySuggestionsProcessor alloc] initWithWorkingContext:self->_workingContext libraryScope:v57];
    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    *(void *)buf = 0;
    *(void *)&long long v90 = buf;
    *((void *)&v90 + 1) = 0x2020000000;
    char v91 = 0;
    workingContext = self->_workingContext;
    v76[0] = MEMORY[0x1E4F143A8];
    v76[1] = 3221225472;
    v76[2] = __153__PGPhotosChallengeMetricEvent__gatherDeferredSuggestionInferencesForQuestions_momentUUIDS_inferenceResults_reasonResultByAssetIdentifier_progressBlock___block_invoke;
    v76[3] = &unk_1E68F0B90;
    uint64_t v18 = v14;
    long long v77 = v18;
    v82 = buf;
    id v78 = v56;
    long long v79 = self;
    id v66 = v16;
    id v80 = v66;
    id v65 = v15;
    id v81 = v65;
    [(PGManagerWorkingContext *)workingContext performSynchronousConcurrentGraphReadUsingBlock:v76];
    p_super = &v18->super;
    if (v58)
    {
      double Current = CFAbsoluteTimeGetCurrent();
      if (Current - v11 >= 0.01)
      {
        char v75 = 0;
        v58[2](v58, &v75, 0.8);
        if (v75)
        {
          if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
LABEL_46:

            _Block_object_dispose(buf, 8);
            long long v21 = p_super;
LABEL_47:

            goto LABEL_48;
          }
          *(_DWORD *)int v85 = 67109378;
          int v86 = 2491;
          __int16 v87 = 2080;
          uint64_t v88 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metric"
                "s/MetricEvents/PGPhotosChallengeMetricEvent.m";
          long long v20 = MEMORY[0x1E4F14500];
LABEL_45:
          _os_log_impl(&dword_1D1805000, v20, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v85, 0x12u);
          goto LABEL_46;
        }
        double v11 = Current;
      }
    }
    if (!*(unsigned char *)(v90 + 24))
    {
LABEL_40:
      if (!v58) {
        goto LABEL_46;
      }
      if (CFAbsoluteTimeGetCurrent() - v11 < 0.01) {
        goto LABEL_46;
      }
      char v75 = 0;
      v58[2](v58, &v75, 1.0);
      if (!v75 || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
        goto LABEL_46;
      }
      *(_DWORD *)int v85 = 67109378;
      int v86 = 2532;
      __int16 v87 = 2080;
      uint64_t v88 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/Me"
            "tricEvents/PGPhotosChallengeMetricEvent.m";
      long long v20 = MEMORY[0x1E4F14500];
      goto LABEL_45;
    }
    long long v22 = [(PGPhotosChallengeMetricEvent *)self metricsCache];
    id v64 = [v22 momentUUIDByAssetIdentifier];

    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    id obj = v55;
    uint64_t v23 = [obj countByEnumeratingWithState:&v71 objects:v84 count:16];
    if (!v23) {
      goto LABEL_39;
    }
    uint64_t v62 = *MEMORY[0x1E4F8E920];
    uint64_t v63 = *(void *)v72;
LABEL_19:
    uint64_t v24 = 0;
    uint64_t v67 = v23;
    while (1)
    {
      if (*(void *)v72 != v63) {
        objc_enumerationMutation(obj);
      }
      BOOL v25 = *(void **)(*((void *)&v71 + 1) + 8 * v24);
      context = (void *)MEMORY[0x1D25FED50]();
      BOOL v26 = [v25 entityIdentifier];
      uint64_t v27 = [v64 objectForKeyedSubscript:v26];
      int v28 = [v25 state];
      BOOL v29 = @"NO";
      if (v28 == 2) {
        BOOL v29 = @"YES";
      }
      uint64_t v30 = v29;
      int v31 = [v25 additionalInfo];
      uint64_t v32 = [v31 objectForKeyedSubscript:v62];
      char v33 = (void *)v32;
      unsigned __int16 v34 = @"None";
      if (v32) {
        unsigned __int16 v34 = (__CFString *)v32;
      }
      double v35 = v34;

      uint64_t v36 = [v66 objectForKeyedSubscript:v27];
      long long v37 = (void *)v36;
      id v38 = @"None";
      if (v36) {
        id v38 = (__CFString *)v36;
      }
      id v39 = v38;

      if (![v65 containsObject:v27]) {
        break;
      }
      uint64_t v40 = [(PGPhotosChallengeMetricEvent *)self metricsCache];
      int v41 = [v40 assetByAssetIdentifier];
      id v42 = [v41 objectForKeyedSubscript:v26];

      if (v42)
      {
        curationSession = self->_curationSession;
        v83 = v42;
        id v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v83 count:1];
        [(CLSCurationSession *)curationSession prepareAssets:v44];

        uint64_t v45 = [(PGPhotosChallengeMetricEvent *)self curationContext];
        id v70 = 0;
        BOOL v46 = +[PGSharedLibrarySuggestionsProcessor shouldIncludeAsset:v42 curationContext:v45 rejectionReason:&v70];
        id v47 = v70;

        if (v47)
        {
          char v48 = (__CFString *)v47;

          id v39 = v48;
        }

        goto LABEL_34;
      }
LABEL_37:

      if (v67 == ++v24)
      {
        uint64_t v23 = [obj countByEnumeratingWithState:&v71 objects:v84 count:16];
        if (!v23)
        {
LABEL_39:

          goto LABEL_40;
        }
        goto LABEL_19;
      }
    }
    BOOL v46 = 0;
LABEL_34:
    long long v49 = [NSNumber numberWithBool:v46];
    [v61 setObject:v49 forKeyedSubscript:v26];

    long long v50 = @"NO";
    if (v46) {
      long long v50 = @"YES";
    }
    long long v51 = v50;
    long long v52 = [NSString stringWithFormat:@"[%@->%@]-[%@->%@]", v30, v35, v51, v39];
    [v60 setObject:v52 forKeyedSubscript:v26];

    goto LABEL_37;
  }
  v85[0] = 0;
  v58[2](v58, v85, 0.0);
  if (!v85[0])
  {
    double v11 = v12;
    goto LABEL_7;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&uint8_t buf[4] = 2435;
    LOWORD(v90) = 2080;
    *(void *)((char *)&v90 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Metrics/MetricEvents/PGPhotosChallengeMetricEvent.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_48:
}

void __153__PGPhotosChallengeMetricEvent__gatherDeferredSuggestionInferencesForQuestions_momentUUIDS_inferenceResults_reasonResultByAssetIdentifier_progressBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v3 = [a2 graph];
  id v4 = [*(id *)(a1 + 32) evaluatorWithGraph:v3];
  if (v4)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
    int v31 = +[PGGraphMomentNodeCollection momentNodesForUUIDs:*(void *)(a1 + 40) inGraph:v3];
    uint64_t v5 = [v31 temporarySet];
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __153__PGPhotosChallengeMetricEvent__gatherDeferredSuggestionInferencesForQuestions_momentUUIDS_inferenceResults_reasonResultByAssetIdentifier_progressBlock___block_invoke_565;
    v41[3] = &unk_1E68F0B68;
    uint64_t v6 = *(void **)(a1 + 56);
    v41[4] = *(void *)(a1 + 48);
    id v42 = v6;
    uint64_t v32 = v4;
    uint64_t v7 = [v4 evaluateObjects:v5 withResultEnumerationBlock:v41];

    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v37 objects:v45 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v38 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(a1 + 64);
          uint64_t v14 = [*(id *)(*((void *)&v37 + 1) + 8 * i) UUID];
          [v13 addObject:v14];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v37 objects:v45 count:16];
      }
      while (v10);
    }

    uint64_t v30 = +[PGGraphHighlightTypeNodeCollection tripTypeNodesInGraph:v3];
    id v15 = [v30 highlightGroupNodes];
    int v28 = [(MAElementCollection *)[PGGraphMomentNodeCollection alloc] initWithSet:v8 graph:v3];
    id v16 = [(PGGraphMomentNodeCollection *)v28 highlightNodes];
    id v17 = [v16 highlightGroupNodes];

    BOOL v29 = v15;
    uint64_t v18 = [v15 collectionByIntersecting:v17];
    id v19 = [v18 momentNodes];
    long long v20 = [v19 uuids];

    [*(id *)(a1 + 64) unionSet:v20];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v21 = v20;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v33 objects:v44 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v34;
      do
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v34 != v24) {
            objc_enumerationMutation(v21);
          }
          [*(id *)(a1 + 56) setObject:@"Trip with Participant" forKeyedSubscript:*(void *)(*((void *)&v33 + 1) + 8 * j)];
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v33 objects:v44 count:16];
      }
      while (v23);
    }

    BOOL v26 = v31;
    id v4 = v32;
  }
  else
  {
    uint64_t v27 = +[PGLogging sharedLogging];
    BOOL v26 = [v27 loggingConnection];

    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1805000, v26, OS_LOG_TYPE_DEFAULT, "Shared library inference: evaluator is nil", buf, 2u);
    }
  }
}

void __153__PGPhotosChallengeMetricEvent__gatherDeferredSuggestionInferencesForQuestions_momentUUIDS_inferenceResults_reasonResultByAssetIdentifier_progressBlock___block_invoke_565(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v13 = a2;
  uint64_t v6 = [*(id *)(a1 + 32) _getInferredReasonFromMatchedConditions:a4 withFallbackReason:0];
  if ([v6 length])
  {
    uint64_t v7 = *(void **)(a1 + 40);
    id v8 = [v13 UUID];
    uint64_t v9 = [v7 objectForKeyedSubscript:v8];

    if (v9)
    {
      uint64_t v10 = [v6 stringByAppendingFormat:@"|%@", v9];

      uint64_t v6 = (void *)v10;
    }
    uint64_t v11 = *(void **)(a1 + 40);
    double v12 = [v13 UUID];
    [v11 setObject:v6 forKeyedSubscript:v12];
  }
}

- (void)_gatherMetricsForSharedLibraryAssetsQuestions:(id)a3 progressBlock:(id)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void (**)(void *, unsigned char *, double))_Block_copy(v7);
  double v9 = 0.0;
  if (!v8 || (double v10 = CFAbsoluteTimeGetCurrent(), v10 < 0.01))
  {
LABEL_7:
    int v41 = v8;
    id v39 = v7;
    long long v40 = [(PGPhotosChallengeMetricEvent *)self _groundTruthByAssetIdentifiersFromQuestions:v6];
    long long v38 = self;
    uint64_t v11 = [(PGPhotosChallengeMetricEvent *)self metricsCache];
    double v12 = [v11 momentUUIDByAssetIdentifier];

    id v42 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v37 = v6;
    id v13 = v6;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v43 objects:v48 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v44 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          id v19 = [v18 entityIdentifier];
          long long v20 = [v12 objectForKeyedSubscript:v19];

          if (v20)
          {
            [v42 addObject:v20];
          }
          else
          {
            id v21 = +[PGLogging sharedLogging];
            uint64_t v22 = [v21 loggingConnection];

            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              uint64_t v23 = [v18 entityIdentifier];
              *(_DWORD *)buf = 138412290;
              *(void *)long long v50 = v23;
              _os_log_error_impl(&dword_1D1805000, v22, OS_LOG_TYPE_ERROR, "Shared library: Failed to find moment UUID for asset uuid: %@", buf, 0xCu);
            }
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v43 objects:v48 count:16];
      }
      while (v15);
    }

    uint64_t v24 = v40;
    if (![v40 count] || !objc_msgSend(v42, "count"))
    {
      uint64_t v27 = +[PGLogging sharedLogging];
      int v28 = [v27 loggingConnection];

      id v7 = v39;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        int v34 = [v40 count];
        int v35 = [v42 count];
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)long long v50 = v34;
        *(_WORD *)&v50[4] = 1024;
        *(_DWORD *)&v50[6] = v35;
        _os_log_error_impl(&dword_1D1805000, v28, OS_LOG_TYPE_ERROR, "Shared library: ground truth, %d, or moment UUIDs, %d, is empty", buf, 0xEu);
      }

      BOOL v29 = [[PGAssetsWithReasonPrecisionRecallEvaluation alloc] initWithIdentifier:@"sharedLibraryAssets" category:@"sharedLibraryAssets"];
      [(PGAssetsWithReasonPrecisionRecallEvaluation *)v29 evaluateWithGroundTruthResults:v40 inferenceResults:MEMORY[0x1E4F1CC08] reasonResultByAssetIdentifier:MEMORY[0x1E4F1CC08]];
      [(PGPhotosChallengeMetricEvent *)v38 setEvaluation:v29];
      id v6 = v37;
      id v8 = v41;
      if (v41)
      {
        if (CFAbsoluteTimeGetCurrent() - v9 >= 0.01)
        {
          char v47 = 0;
          v41[2](v41, &v47, 1.0);
          if (v47)
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)long long v50 = 2401;
              *(_WORD *)&v50[4] = 2080;
              *(void *)&v50[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGra"
                                   "ph/Framework/Metrics/MetricEvents/PGPhotosChallengeMetricEvent.m";
              _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
          }
        }
      }

      goto LABEL_59;
    }
    id v7 = v39;
    id v8 = v41;
    if (v41)
    {
      double Current = CFAbsoluteTimeGetCurrent();
      p_isa = (id *)&v38->super.super.isa;
      if (Current - v9 >= 0.01)
      {
        char v47 = 0;
        v41[2](v41, &v47, 0.3);
        if (v47)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)long long v50 = 2405;
            *(_WORD *)&v50[4] = 2080;
            *(void *)&v50[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Metrics/MetricEvents/PGPhotosChallengeMetricEvent.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          id v6 = v37;
          goto LABEL_59;
        }
        double v9 = Current;
      }
    }
    else
    {
      p_isa = (id *)&v38->super.super.isa;
    }
    id v30 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v8 = v41;
    id v31 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [p_isa _gatherDeferredSuggestionInferencesForQuestions:v13 momentUUIDS:v42 inferenceResults:v30 reasonResultByAssetIdentifier:v31 progressBlock:v39];
    if (v41)
    {
      double v32 = CFAbsoluteTimeGetCurrent();
      if (v32 - v9 >= 0.01)
      {
        char v47 = 0;
        v41[2](v41, &v47, 0.6);
        if (v47)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)long long v50 = 2413;
            *(_WORD *)&v50[4] = 2080;
            *(void *)&v50[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Metrics/MetricEvents/PGPhotosChallengeMetricEvent.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          id v6 = v37;
LABEL_58:

          uint64_t v24 = v40;
LABEL_59:

          goto LABEL_60;
        }
        double v9 = v32;
      }
      [p_isa _gatherNearLiveSuggestionInferencesForQuestions:v13 inferenceResults:v30 reasonResultByAssetIdentifier:v31 progressBlock:v39];
      double v33 = CFAbsoluteTimeGetCurrent();
      id v6 = v37;
      if (v33 - v9 >= 0.01)
      {
        char v47 = 0;
        v41[2](v41, &v47, 0.9);
        if (v47)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)long long v50 = 2417;
            *(_WORD *)&v50[4] = 2080;
            *(void *)&v50[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Metrics/MetricEvents/PGPhotosChallengeMetricEvent.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          goto LABEL_58;
        }
        double v9 = v33;
      }
    }
    else
    {
      [p_isa _gatherNearLiveSuggestionInferencesForQuestions:v13 inferenceResults:v30 reasonResultByAssetIdentifier:v31 progressBlock:v39];
      id v6 = v37;
    }
    long long v36 = [[PGAssetsWithReasonPrecisionRecallEvaluation alloc] initWithIdentifier:@"sharedLibraryAssets" category:@"sharedLibraryAssets"];
    [(PGAssetsWithReasonPrecisionRecallEvaluation *)v36 evaluateWithGroundTruthResults:v40 inferenceResults:v30 reasonResultByAssetIdentifier:v31];
    [p_isa setEvaluation:v36];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [p_isa[2] setResultsByAssetIdentifier:v31];
    }
    id v8 = v41;
    if (v41)
    {
      if (CFAbsoluteTimeGetCurrent() - v9 >= 0.01)
      {
        char v47 = 0;
        v41[2](v41, &v47, 1.0);
        if (v47)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)long long v50 = 2429;
            *(_WORD *)&v50[4] = 2080;
            *(void *)&v50[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Metrics/MetricEvents/PGPhotosChallengeMetricEvent.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
        }
      }
    }

    goto LABEL_58;
  }
  char v47 = 0;
  v8[2](v8, &v47, 0.0);
  if (!v47)
  {
    double v9 = v10;
    goto LABEL_7;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)long long v50 = 2376;
    *(_WORD *)&v50[4] = 2080;
    *(void *)&v50[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framewo"
                         "rk/Metrics/MetricEvents/PGPhotosChallengeMetricEvent.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_60:
}

- (id)_inferredResultsForEntityIdentifiers:(id)a3 withDefaultBoolValue:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        id v13 = objc_msgSend(NSNumber, "numberWithBool:", v4, (void)v15);
        [v6 setObject:v13 forKeyedSubscript:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  return v6;
}

- (void)setSubMetricEvent:(id)a3
{
}

- (id)payloadForVerification
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  BOOL v4 = [(id)objc_opt_class() stringFromQuestionMetricType:self->_questionMetricType];
  long long v18 = [v4 substringToIndex:1];
  id v5 = [v18 lowercaseString];
  id v6 = objc_msgSend(v4, "stringByReplacingCharactersInRange:withString:", 0, 1, v5);
  id v7 = [NSNumber numberWithUnsignedInteger:self->_algorithmVersion];
  uint64_t v8 = [NSString stringWithFormat:@"%@AlgorithmVersion", v6];
  [v3 setObject:v7 forKeyedSubscript:v8];

  uint64_t v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PGPrecisionRecallEvaluation falseNegatives](self->_evaluation, "falseNegatives"));
  uint64_t v10 = [NSString stringWithFormat:@"%@NumFalseNegatives", v6];
  [v3 setObject:v9 forKeyedSubscript:v10];

  uint64_t v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PGPrecisionRecallEvaluation falsePositives](self->_evaluation, "falsePositives"));
  uint64_t v12 = [NSString stringWithFormat:@"%@NumFalsePositives", v6];
  [v3 setObject:v11 forKeyedSubscript:v12];

  id v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PGPrecisionRecallEvaluation trueNegatives](self->_evaluation, "trueNegatives"));
  uint64_t v14 = [NSString stringWithFormat:@"%@NumTrueNegatives", v6];
  [v3 setObject:v13 forKeyedSubscript:v14];

  long long v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PGPrecisionRecallEvaluation truePositives](self->_evaluation, "truePositives"));
  long long v16 = [NSString stringWithFormat:@"%@NumTruePositives", v6];
  [v3 setObject:v15 forKeyedSubscript:v16];

  return v3;
}

- (id)payload
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  BOOL v4 = [NSNumber numberWithUnsignedInteger:self->_graphSchemaVersion];
  [v3 setObject:v4 forKeyedSubscript:@"graphSchemaVersion"];

  id v5 = [NSNumber numberWithUnsignedInteger:self->_questionVersion];
  [v3 setObject:v5 forKeyedSubscript:@"questionVersion"];

  id v6 = [NSNumber numberWithUnsignedInteger:self->_algorithmVersion];
  [v3 setObject:v6 forKeyedSubscript:@"algorithmVersion"];

  id v7 = [NSNumber numberWithUnsignedInteger:self->_photosModelVersion];
  [v3 setObject:v7 forKeyedSubscript:@"photosModelVersion"];

  uint64_t v8 = [NSNumber numberWithUnsignedInteger:self->_questionVersion];
  [v3 setObject:v8 forKeyedSubscript:@"questionVersion"];

  [v3 setObject:self->_questionTypeString forKeyedSubscript:@"questionType"];
  [v3 setObject:self->_photoLibrarySize forKeyedSubscript:@"photosLibrarySize"];
  uint64_t v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PGPrecisionRecallEvaluation falseNegatives](self->_evaluation, "falseNegatives"));
  [v3 setObject:v9 forKeyedSubscript:@"falseNegativeCount"];

  uint64_t v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PGPrecisionRecallEvaluation falsePositives](self->_evaluation, "falsePositives"));
  [v3 setObject:v10 forKeyedSubscript:@"falsePositiveCount"];

  uint64_t v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PGPrecisionRecallEvaluation trueNegatives](self->_evaluation, "trueNegatives"));
  [v3 setObject:v11 forKeyedSubscript:@"trueNegativeCount"];

  uint64_t v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PGPrecisionRecallEvaluation truePositives](self->_evaluation, "truePositives"));
  [v3 setObject:v12 forKeyedSubscript:@"truePositiveCount"];

  return v3;
}

- (id)_groundTruthByPersonUUIDFromQuestions:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  workingContext = self->_workingContext;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __70__PGPhotosChallengeMetricEvent__groundTruthByPersonUUIDFromQuestions___block_invoke;
  v12[3] = &unk_1E68F0960;
  v12[4] = self;
  id v13 = v4;
  id v7 = v5;
  id v14 = v7;
  id v8 = v4;
  [(PGManagerWorkingContext *)workingContext performSynchronousConcurrentGraphReadUsingBlock:v12];
  uint64_t v9 = v14;
  id v10 = v7;

  return v10;
}

void __70__PGPhotosChallengeMetricEvent__groundTruthByPersonUUIDFromQuestions___block_invoke(id *a1, void *a2)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v3 = [a2 graph];
  id v4 = [a1[4] metricsCache];
  id v5 = [v4 activePersonUUIDByPersonUUID];

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = a1[5];
  uint64_t v35 = [obj countByEnumeratingWithState:&v36 objects:v42 count:16];
  if (v35)
  {
    uint64_t v34 = *(void *)v37;
    uint64_t v30 = *MEMORY[0x1E4F8EA28];
    uint64_t v29 = *MEMORY[0x1E4F8E920];
    uint64_t v28 = *MEMORY[0x1E4F8E930];
    id v31 = v5;
    double v32 = v3;
    do
    {
      for (uint64_t i = 0; i != v35; ++i)
      {
        if (*(void *)v37 != v34) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        id v8 = objc_msgSend(v7, "entityIdentifier", v28);
        uint64_t v9 = (void *)MEMORY[0x1E4F391F0];
        id v10 = [v5 objectForKeyedSubscript:v8];
        uint64_t v11 = [v9 localIdentifierWithUUID:v10];

        uint64_t v12 = [v3 personNodeForPersonLocalIdentifier:v11];
        if (v12)
        {
          int v13 = [v7 state];
          id v14 = (void *)MEMORY[0x1E4F1CC28];
          if (v13 == 2) {
            id v14 = (void *)MEMORY[0x1E4F1CC38];
          }
          long long v15 = v14;
          if ([v7 type] == 5)
          {
            long long v16 = a1;
            long long v17 = [v7 additionalInfo];
            long long v18 = [v17 objectForKeyedSubscript:v30];
            int v19 = [v18 isEqualToString:@"CHILD"];

            if (v19)
            {
              uint64_t v20 = [v7 additionalInfo];
              id v21 = [v20 objectForKeyedSubscript:v29];

              int v22 = [v7 state];
              uint64_t v23 = (void *)MEMORY[0x1E4F1CC28];
              a1 = v16;
              if (v22 == 2)
              {
                int v24 = [v21 isEqualToString:v28];
                uint64_t v23 = (void *)MEMORY[0x1E4F1CC28];
                if (v24) {
                  uint64_t v23 = (void *)MEMORY[0x1E4F1CC38];
                }
              }
              BOOL v25 = v23;

              long long v15 = v25;
              id v3 = v32;
            }
            else
            {
              id v3 = v32;
              a1 = v16;
            }
            id v5 = v31;
          }
          [a1[6] setObject:v15 forKeyedSubscript:v8];
        }
        else
        {
          BOOL v26 = +[PGLogging sharedLogging];
          long long v15 = [v26 loggingConnection];

          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            uint64_t v27 = [v7 entityIdentifier];
            *(_DWORD *)buf = 138412290;
            int v41 = v27;
            _os_log_impl(&dword_1D1805000, v15, OS_LOG_TYPE_INFO, "Failed to find person node for entity identifier: '%@'", buf, 0xCu);
          }
        }
      }
      uint64_t v35 = [obj countByEnumeratingWithState:&v36 objects:v42 count:16];
    }
    while (v35);
  }
}

- (id)_groundTruthByAssetIdentifiersFromQuestions:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v31;
    *(void *)&long long v7 = 138412290;
    long long v26 = v7;
    uint64_t v27 = *(void *)v31;
    uint64_t v28 = self;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v31 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v30 + 1) + 8 * v10);
        uint64_t v12 = objc_msgSend(v11, "entityIdentifier", v26);
        int v13 = [(PGPhotosChallengeMetricEvent *)self metricsCache];
        id v14 = [v13 assetByAssetIdentifier];
        long long v15 = [v14 objectForKeyedSubscript:v12];
        if (v15)
        {

LABEL_9:
          if ([v11 state] == 2) {
            uint64_t v21 = MEMORY[0x1E4F1CC38];
          }
          else {
            uint64_t v21 = MEMORY[0x1E4F1CC28];
          }
          [v5 setObject:v21 forKeyedSubscript:v12];
          goto LABEL_13;
        }
        [(PGPhotosChallengeMetricEvent *)self metricsCache];
        long long v17 = v16 = v5;
        [v17 assetByAssetSyndicationIdentifier];
        int v19 = v18 = v8;
        uint64_t v20 = [v19 objectForKeyedSubscript:v12];

        uint64_t v8 = v18;
        id v5 = v16;
        uint64_t v9 = v27;
        self = v28;

        if (v20) {
          goto LABEL_9;
        }
        int v22 = +[PGLogging sharedLogging];
        uint64_t v23 = [v22 loggingConnection];

        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v26;
          uint64_t v35 = v12;
          _os_log_error_impl(&dword_1D1805000, v23, OS_LOG_TYPE_ERROR, "Failed to find asset with uuid: '%@'", buf, 0xCu);
        }

LABEL_13:
        ++v10;
      }
      while (v8 != v10);
      uint64_t v24 = [obj countByEnumeratingWithState:&v30 objects:v36 count:16];
      uint64_t v8 = v24;
    }
    while (v24);
  }

  return v5;
}

- (id)groundTruthByMomentUUIDFromExhaustiveMomentLabelingQuestions:(id)a3 meaningLabel:(id)a4 withMetricsCache:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v30 = a4;
  id v8 = a5;
  id v29 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (v10)
  {
    uint64_t v12 = v10;
    uint64_t v13 = *(void *)v33;
    uint64_t v31 = *MEMORY[0x1E4F8E920];
    *(void *)&long long v11 = 138412290;
    long long v28 = v11;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v33 != v13) {
          objc_enumerationMutation(v9);
        }
        long long v15 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        if (objc_msgSend(v15, "state", v28) == 2)
        {
          long long v16 = [v15 entityIdentifier];
          long long v17 = [v8 momentUUIDsForExhaustiveMomentLabelingQuestion];
          char v18 = [v17 containsObject:v16];

          if (v18)
          {
            int v19 = [v15 additionalInfo];
            uint64_t v20 = [v19 objectForKeyedSubscript:v31];

            uint64_t v21 = (void *)MEMORY[0x1E4F1CAD0];
            int v22 = [v20 componentsSeparatedByString:@","];
            uint64_t v23 = [v21 setWithArray:v22];

            if ([v23 count])
            {
              uint64_t v24 = [v23 containsObject:v30];
              BOOL v25 = [NSNumber numberWithBool:v24];
              [v29 setObject:v25 forKeyedSubscript:v16];
            }
          }
          else
          {
            long long v26 = +[PGLogging sharedLogging];
            uint64_t v20 = [v26 loggingConnection];

            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v28;
              uint64_t v37 = v16;
              _os_log_error_impl(&dword_1D1805000, v20, OS_LOG_TYPE_ERROR, "Failed to find moment with uuid in the photoLibrary: '%@'", buf, 0xCu);
            }
          }
        }
      }
      uint64_t v12 = [v9 countByEnumeratingWithState:&v32 objects:v38 count:16];
    }
    while (v12);
  }

  return v29;
}

- (id)_reasonResultByAssetEntityIdentifierForTitlingQuestions:(id)a3 questionType:(unsigned __int16)a4
{
  int v4 = a4;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v23 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v25;
    uint64_t v10 = *MEMORY[0x1E4F8E920];
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if ([v12 type] == v4)
        {
          int v13 = [v12 state];
          id v14 = @"NO";
          if (v13 == 2) {
            id v14 = @"YES";
          }
          long long v15 = v14;
          long long v16 = [v12 additionalInfo];
          long long v17 = [v16 objectForKeyedSubscript:v10];

          if (v17)
          {
            char v18 = [v12 additionalInfo];
            int v19 = [v18 objectForKeyedSubscript:v10];
          }
          else
          {
            int v19 = @"SAME";
          }
          uint64_t v20 = [NSString stringWithFormat:@"[New->%@]-[Legacy->%@]", v15, v19];
          uint64_t v21 = [v12 entityIdentifier];
          [v23 setObject:v20 forKeyedSubscript:v21];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v8);
  }

  return v23;
}

- (id)_groundTruthForTitlingQuestions:(id)a3 questionType:(unsigned __int16)a4
{
  int v4 = a4;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v18 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if (objc_msgSend(v11, "type", v18) == v4)
        {
          uint64_t v12 = [v11 entityIdentifier];
          int v13 = [(PGPhotosChallengeMetricEvent *)self metricsCache];
          id v14 = [v13 dayHighlightAssetIdentifiers];
          int v15 = [v14 containsObject:v12];

          if (v15)
          {
            if ([v11 state] == 2) {
              uint64_t v16 = MEMORY[0x1E4F1CC38];
            }
            else {
              uint64_t v16 = MEMORY[0x1E4F1CC28];
            }
            [v18 setObject:v16 forKeyedSubscript:v12];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v8);
  }

  return v18;
}

- (void)_gatherMetricsForHighlightTitlingQuestions:(id)a3 progressBlock:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(void *, unsigned char *, double))_Block_copy(a4);
  double v8 = 0.0;
  if (!v7 || (double v9 = CFAbsoluteTimeGetCurrent(), v9 < 0.01))
  {
LABEL_7:
    uint64_t v10 = [(PGPhotosChallengeMetricEvent *)self _groundTruthForTitlingQuestions:v6 questionType:28];
    long long v11 = [v10 allKeys];
    uint64_t v12 = [(PGPhotosChallengeMetricEvent *)self _inferredResultsForEntityIdentifiers:v11 withDefaultBoolValue:1];

    int v13 = [(PGPhotosChallengeMetricEvent *)self _reasonResultByAssetEntityIdentifierForTitlingQuestions:v6 questionType:28];
    if (v7)
    {
      double Current = CFAbsoluteTimeGetCurrent();
      if (Current - v8 >= 0.01)
      {
        char v18 = 0;
        v7[2](v7, &v18, 0.5);
        if (v18)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            int v20 = 2189;
            __int16 v21 = 2080;
            long long v22 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metr"
                  "ics/MetricEvents/PGPhotosChallengeMetricEvent.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          goto LABEL_26;
        }
        double v8 = Current;
      }
    }
    int v15 = [[PGAssetsWithReasonPrecisionRecallEvaluation alloc] initWithIdentifier:@"highlightTitling" category:@"dayHighlightTitling"];
    [(PGAssetsWithReasonPrecisionRecallEvaluation *)v15 evaluateWithGroundTruthResults:v10 inferenceResults:v12 reasonResultByAssetIdentifier:v13];
    if (v7)
    {
      double v16 = CFAbsoluteTimeGetCurrent();
      if (v16 - v8 >= 0.01)
      {
        char v18 = 0;
        v7[2](v7, &v18, 0.9);
        if (v18)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            int v20 = 2193;
            __int16 v21 = 2080;
            long long v22 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metr"
                  "ics/MetricEvents/PGPhotosChallengeMetricEvent.m";
            long long v17 = MEMORY[0x1E4F14500];
LABEL_24:
            _os_log_impl(&dword_1D1805000, v17, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
LABEL_25:

LABEL_26:
          goto LABEL_27;
        }
        double v8 = v16;
      }
      [(PGPhotosChallengeMetricEvent *)self setEvaluation:v15];
      if (CFAbsoluteTimeGetCurrent() - v8 < 0.01) {
        goto LABEL_25;
      }
      char v18 = 0;
      v7[2](v7, &v18, 1.0);
      if (!v18 || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
        goto LABEL_25;
      }
      *(_DWORD *)buf = 67109378;
      int v20 = 2196;
      __int16 v21 = 2080;
      long long v22 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/Me"
            "tricEvents/PGPhotosChallengeMetricEvent.m";
      long long v17 = MEMORY[0x1E4F14500];
      goto LABEL_24;
    }
    [(PGPhotosChallengeMetricEvent *)self setEvaluation:v15];
    goto LABEL_25;
  }
  char v18 = 0;
  v7[2](v7, &v18, 0.0);
  if (!v18)
  {
    double v8 = v9;
    goto LABEL_7;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    int v20 = 2183;
    __int16 v21 = 2080;
    long long v22 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/Metr"
          "icEvents/PGPhotosChallengeMetricEvent.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_27:
}

- (id)_tripTitlingReasonResultByAssetEntityIdentifierForQuestions:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v22 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v24;
    uint64_t v8 = *MEMORY[0x1E4F8EAA8];
    uint64_t v9 = *MEMORY[0x1E4F8E920];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if ([v11 type] == 26 && v8 <= (int)objc_msgSend(v11, "questionVersion"))
        {
          int v12 = [v11 state];
          int v13 = @"NO";
          if (v12 == 2) {
            int v13 = @"YES";
          }
          id v14 = v13;
          int v15 = [v11 additionalInfo];
          double v16 = [v15 objectForKeyedSubscript:v9];

          if (v16)
          {
            long long v17 = [v11 additionalInfo];
            char v18 = [v17 objectForKeyedSubscript:v9];
          }
          else
          {
            char v18 = @"SAME";
          }
          int v19 = [NSString stringWithFormat:@"[New->%@]-[Legacy->%@]", v14, v18];
          int v20 = [v11 entityIdentifier];
          [v22 setObject:v19 forKeyedSubscript:v20];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v6);
  }

  return v22;
}

- (id)_groundTruthForTripTitlingQuestions:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    uint64_t v9 = MEMORY[0x1E4F1CC28];
    uint64_t v10 = MEMORY[0x1E4F1CC38];
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        int v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v12, "type", (void)v16) == 26)
        {
          int v13 = [v12 entityIdentifier];
          if ([v12 state] == 2) {
            uint64_t v14 = v10;
          }
          else {
            uint64_t v14 = v9;
          }
          [v4 setObject:v14 forKeyedSubscript:v13];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void)_gatherMetricsForTripTitlingQuestions:(id)a3 progressBlock:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(void *, unsigned char *, double))_Block_copy(a4);
  double v8 = 0.0;
  if (!v7 || (double v9 = CFAbsoluteTimeGetCurrent(), v9 < 0.01))
  {
LABEL_7:
    uint64_t v10 = [(PGPhotosChallengeMetricEvent *)self _groundTruthForTripTitlingQuestions:v6];
    long long v11 = [v10 allKeys];
    int v12 = [(PGPhotosChallengeMetricEvent *)self _inferredResultsForEntityIdentifiers:v11 withDefaultBoolValue:1];

    int v13 = [(PGPhotosChallengeMetricEvent *)self _tripTitlingReasonResultByAssetEntityIdentifierForQuestions:v6];
    if (v7)
    {
      double Current = CFAbsoluteTimeGetCurrent();
      if (Current - v8 >= 0.01)
      {
        char v18 = 0;
        v7[2](v7, &v18, 0.5);
        if (v18)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            int v20 = 2134;
            __int16 v21 = 2080;
            id v22 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metr"
                  "ics/MetricEvents/PGPhotosChallengeMetricEvent.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          goto LABEL_26;
        }
        double v8 = Current;
      }
    }
    int v15 = [[PGAssetsWithReasonPrecisionRecallEvaluation alloc] initWithIdentifier:@"tripTitling" category:@"tripTitling"];
    [(PGAssetsWithReasonPrecisionRecallEvaluation *)v15 evaluateWithGroundTruthResults:v10 inferenceResults:v12 reasonResultByAssetIdentifier:v13];
    if (v7)
    {
      double v16 = CFAbsoluteTimeGetCurrent();
      if (v16 - v8 >= 0.01)
      {
        char v18 = 0;
        v7[2](v7, &v18, 0.9);
        if (v18)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            int v20 = 2138;
            __int16 v21 = 2080;
            id v22 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metr"
                  "ics/MetricEvents/PGPhotosChallengeMetricEvent.m";
            long long v17 = MEMORY[0x1E4F14500];
LABEL_24:
            _os_log_impl(&dword_1D1805000, v17, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
LABEL_25:

LABEL_26:
          goto LABEL_27;
        }
        double v8 = v16;
      }
      [(PGPhotosChallengeMetricEvent *)self setEvaluation:v15];
      if (CFAbsoluteTimeGetCurrent() - v8 < 0.01) {
        goto LABEL_25;
      }
      char v18 = 0;
      v7[2](v7, &v18, 1.0);
      if (!v18 || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
        goto LABEL_25;
      }
      *(_DWORD *)buf = 67109378;
      int v20 = 2141;
      __int16 v21 = 2080;
      id v22 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/Me"
            "tricEvents/PGPhotosChallengeMetricEvent.m";
      long long v17 = MEMORY[0x1E4F14500];
      goto LABEL_24;
    }
    [(PGPhotosChallengeMetricEvent *)self setEvaluation:v15];
    goto LABEL_25;
  }
  char v18 = 0;
  v7[2](v7, &v18, 0.0);
  if (!v18)
  {
    double v8 = v9;
    goto LABEL_7;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    int v20 = 2127;
    __int16 v21 = 2080;
    id v22 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/Metr"
          "icEvents/PGPhotosChallengeMetricEvent.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_27:
}

- (id)_syndicatedAssetFromQuestion:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PGPhotosChallengeMetricEvent *)self metricsCache];
  id v6 = [v5 assetByAssetSyndicationIdentifier];
  uint64_t v7 = [v4 entityIdentifier];
  double v8 = [v6 objectForKeyedSubscript:v7];

  if (!v8)
  {
    double v16 = +[PGLogging sharedLogging];
    uint64_t v10 = [v16 loggingConnection];

    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    uint64_t v14 = [v4 entityIdentifier];
    int v22 = 138412290;
    uint64_t v23 = v14;
    _os_log_error_impl(&dword_1D1805000, v10, OS_LOG_TYPE_ERROR, "Failed to find asset with syndication uuid: '%@'", (uint8_t *)&v22, 0xCu);
LABEL_7:

LABEL_13:
    id v19 = 0;
    goto LABEL_14;
  }
  double v9 = [v8 curationProperties];
  uint64_t v10 = [v9 syndicationIdentifier];

  if (!v10)
  {
    long long v17 = +[PGLogging sharedLogging];
    char v18 = [v17 loggingConnection];

    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      __int16 v21 = [v8 uuid];
      int v22 = 138412290;
      uint64_t v23 = v21;
      _os_log_error_impl(&dword_1D1805000, v18, OS_LOG_TYPE_ERROR, "Syndication identifier is nil for asset %@", (uint8_t *)&v22, 0xCu);
    }
    uint64_t v10 = 0;
    goto LABEL_13;
  }
  long long v11 = [v8 mediaAnalysisProperties];
  uint64_t v12 = [v11 syndicationProcessingVersion];

  if (v12 != *MEMORY[0x1E4F39580] && v12 != *MEMORY[0x1E4F39588])
  {
    int v13 = +[PGLogging sharedLogging];
    uint64_t v14 = [v13 loggingConnection];

    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      int v15 = [v8 uuid];
      int v22 = 138412290;
      uint64_t v23 = v15;
      _os_log_impl(&dword_1D1805000, v14, OS_LOG_TYPE_INFO, "Syndicated asset not yet inferred: %@", (uint8_t *)&v22, 0xCu);
    }
    goto LABEL_7;
  }
  id v19 = v8;
LABEL_14:

  return v19;
}

- (id)_reasonResultByAssetSyndicationIdentifierForQuestions:(id)a3
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v49 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v51 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v46 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v56 objects:v61 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v57;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v57 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v56 + 1) + 8 * i);
        long long v11 = [(PGPhotosChallengeMetricEvent *)self _syndicatedAssetFromQuestion:v10];
        uint64_t v12 = v11;
        if (v11)
        {
          int v13 = [v11 mediaAnalysisProperties];
          __int16 v14 = [v13 syndicationProcessingValue];

          if ((v14 & 0x1000) == 0)
          {
            [v51 setObject:v12 forKeyedSubscript:v10];
            if ((v14 & 0x7EF0) == 0)
            {
              int v15 = [v12 localIdentifier];
              [v46 setObject:v12 forKeyedSubscript:v15];
            }
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v56 objects:v61 count:16];
    }
    while (v7);
  }

  uint64_t v16 = [v46 allValues];
  long long v17 = [(PGPhotosChallengeMetricEvent *)self curationSession];
  [v17 prepareAssets:v16];

  long long v45 = (void *)v16;
  [MEMORY[0x1E4F38EB8] prefetchScenesOnAssets:v16];
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id obj = v5;
  uint64_t v18 = [obj countByEnumeratingWithState:&v52 objects:v60 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v50 = *(void *)v53;
    uint64_t v48 = *MEMORY[0x1E4F8E920];
    double v20 = *MEMORY[0x1E4F8ACF8];
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v53 != v50) {
          objc_enumerationMutation(obj);
        }
        int v22 = *(void **)(*((void *)&v52 + 1) + 8 * j);
        uint64_t v23 = [v51 objectForKeyedSubscript:v22];
        uint64_t v24 = v23;
        if (v23)
        {
          long long v25 = [v23 mediaAnalysisProperties];
          __int16 v26 = [v25 syndicationProcessingValue];

          if ([v22 state] == 2) {
            long long v27 = @"YES";
          }
          else {
            long long v27 = @"NO";
          }
          uint64_t v28 = v27;
          uint64_t v29 = [v22 additionalInfo];
          uint64_t v30 = [v29 objectForKeyedSubscript:v48];
          uint64_t v31 = (void *)v30;
          long long v32 = @"None";
          if (v30) {
            long long v32 = (__CFString *)v30;
          }
          long long v33 = v32;

          int v34 = v26 & 0x7EF0;
          if ((v26 & 0x7EF0) != 0) {
            long long v35 = @"YES";
          }
          else {
            long long v35 = @"NO";
          }
          long long v36 = v35;
          uint64_t v37 = PHAssetMediaAnalysisSyndicationProcessingValueDescription();
          if (!v34)
          {
            long long v38 = [v24 curationModel];
            uint64_t v39 = @"Meme/Document/Screenshot";
            if (([v38 isMemeWithAsset:v24] & 1) != 0
              || (uint64_t v39 = @"NSFW", ([v38 isVeryPreciselyIVSNSFWExplicitWithAsset:v24] & 1) != 0)
              || ([v24 curationScore], uint64_t v39 = @"Low curation score", v40 < v20))
            {

              uint64_t v37 = v39;
            }
          }
          int v41 = [NSString stringWithFormat:@"[%@->%@]-[%@->%@]", v28, v33, v36, v37];
          id v42 = [v24 curationProperties];
          uint64_t v43 = [v42 syndicationIdentifier];

          [v49 setObject:v41 forKeyedSubscript:v43];
        }
      }
      uint64_t v19 = [obj countByEnumeratingWithState:&v52 objects:v60 count:16];
    }
    while (v19);
  }

  return v49;
}

- (id)_syndicatedAssetsInferenceResultsForAssetSyndicationIdentifiers:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        long long v11 = [(PGPhotosChallengeMetricEvent *)self metricsCache];
        uint64_t v12 = [v11 assetByAssetSyndicationIdentifier];
        int v13 = [v12 objectForKeyedSubscript:v10];

        __int16 v14 = [v13 mediaAnalysisProperties];
        BOOL v15 = ([v14 syndicationProcessingValue] & 0x7EF0) != 0;

        uint64_t v16 = [NSNumber numberWithBool:v15];
        [v5 setObject:v16 forKeyedSubscript:v10];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v7);
  }

  return v5;
}

- (id)_syndicatedAssetsGroundTruthByAssetIdentifiersFromQuestions:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v12 = -[PGPhotosChallengeMetricEvent _syndicatedAssetFromQuestion:](self, "_syndicatedAssetFromQuestion:", v11, (void)v15);
        if (v12) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  int v13 = [(PGPhotosChallengeMetricEvent *)self _groundTruthByAssetIdentifiersFromQuestions:v5];

  return v13;
}

- (void)_gatherMetricsForSyndicatedAssetsQuestions:(id)a3 progressBlock:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(void *, unsigned char *, double))_Block_copy(a4);
  double v8 = 0.0;
  if (!v7 || (double v9 = CFAbsoluteTimeGetCurrent(), v9 < 0.01))
  {
LABEL_7:
    uint64_t v10 = [(PGPhotosChallengeMetricEvent *)self _syndicatedAssetsGroundTruthByAssetIdentifiersFromQuestions:v6];
    uint64_t v11 = [v10 allKeys];
    if (v7)
    {
      double Current = CFAbsoluteTimeGetCurrent();
      if (Current - v8 >= 0.01)
      {
        char v18 = 0;
        v7[2](v7, &v18, 0.3);
        if (v18)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            int v20 = 2005;
            __int16 v21 = 2080;
            long long v22 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metr"
                  "ics/MetricEvents/PGPhotosChallengeMetricEvent.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          goto LABEL_32;
        }
        double v8 = Current;
      }
      int v13 = [(PGPhotosChallengeMetricEvent *)self _syndicatedAssetsInferenceResultsForAssetSyndicationIdentifiers:v11];
      double v15 = CFAbsoluteTimeGetCurrent();
      if (v15 - v8 >= 0.01)
      {
        char v18 = 0;
        v7[2](v7, &v18, 0.6);
        if (v18)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            int v20 = 2008;
            __int16 v21 = 2080;
            long long v22 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metr"
                  "ics/MetricEvents/PGPhotosChallengeMetricEvent.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          goto LABEL_31;
        }
        double v8 = v15;
      }
      __int16 v14 = [(PGPhotosChallengeMetricEvent *)self _reasonResultByAssetSyndicationIdentifierForQuestions:v6];
      double v16 = CFAbsoluteTimeGetCurrent();
      if (v16 - v8 >= 0.01)
      {
        char v18 = 0;
        v7[2](v7, &v18, 0.9);
        if (v18)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            int v20 = 2011;
            __int16 v21 = 2080;
            long long v22 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metr"
                  "ics/MetricEvents/PGPhotosChallengeMetricEvent.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
LABEL_30:

LABEL_31:
LABEL_32:

          goto LABEL_33;
        }
        double v8 = v16;
      }
    }
    else
    {
      int v13 = [(PGPhotosChallengeMetricEvent *)self _syndicatedAssetsInferenceResultsForAssetSyndicationIdentifiers:v11];
      __int16 v14 = [(PGPhotosChallengeMetricEvent *)self _reasonResultByAssetSyndicationIdentifierForQuestions:v6];
    }
    long long v17 = [[PGAssetsWithReasonPrecisionRecallEvaluation alloc] initWithIdentifier:@"syndicatedAssets" category:@"syndicatedAssets"];
    [(PGAssetsWithReasonPrecisionRecallEvaluation *)v17 evaluateWithGroundTruthResults:v10 inferenceResults:v13 reasonResultByAssetIdentifier:v14];
    [(PGPhotosChallengeMetricEvent *)self setEvaluation:v17];
    if (v7)
    {
      if (CFAbsoluteTimeGetCurrent() - v8 >= 0.01)
      {
        char v18 = 0;
        v7[2](v7, &v18, 1.0);
        if (v18)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            int v20 = 2016;
            __int16 v21 = 2080;
            long long v22 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metr"
                  "ics/MetricEvents/PGPhotosChallengeMetricEvent.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
        }
      }
    }

    goto LABEL_30;
  }
  char v18 = 0;
  v7[2](v7, &v18, 0.0);
  if (!v18)
  {
    double v8 = v9;
    goto LABEL_7;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    int v20 = 2001;
    __int16 v21 = 2080;
    long long v22 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/Metr"
          "icEvents/PGPhotosChallengeMetricEvent.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_33:
}

- (id)_featuredPhotoInferenceResultsForAnswerDateByAssetIds:(id)a3 questionMetricType:(unsigned __int16)a4
{
  int v34 = a4;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  long long v35 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, objc_opt_class(), 0);
  uint64_t v11 = [PGLongTailSuggester alloc];
  uint64_t v12 = [(PGPhotosChallengeMetricEvent *)self metricsCache];
  int v13 = [v12 featuredPhotosSuggestionSession];
  uint64_t v30 = [(PGAbstractSuggester *)v11 initWithSession:v13];

  id v32 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obj = v5;
  uint64_t v14 = [obj countByEnumeratingWithState:&v44 objects:v48 count:16];
  if (v14)
  {
    uint64_t v33 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v45 != v33) {
          objc_enumerationMutation(obj);
        }
        double v16 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        long long v17 = (void *)MEMORY[0x1D25FED50]();
        char v18 = [v16 allKeys];
        long long v19 = [v18 firstObject];

        int v20 = [v16 objectForKeyedSubscript:v19];
        __int16 v21 = [(PGPhotosChallengeMetricEvent *)self metricsCache];
        long long v22 = [v21 assetByAssetIdentifier];
        uint64_t v23 = [v22 objectForKeyedSubscript:v19];

        uint64_t v40 = 0;
        int v41 = &v40;
        uint64_t v42 = 0x2020000000;
        char v43 = 0;
        v36[0] = MEMORY[0x1E4F143A8];
        v36[1] = 3221225472;
        v36[2] = __105__PGPhotosChallengeMetricEvent__featuredPhotoInferenceResultsForAnswerDateByAssetIds_questionMetricType___block_invoke;
        v36[3] = &unk_1E68F0B40;
        v36[4] = self;
        uint64_t v39 = &v40;
        id v24 = v23;
        id v37 = v24;
        id v25 = v20;
        id v38 = v25;
        [v35 enumerateObjectsUsingBlock:v36];
        if (v34 != 119)
        {
          int v26 = *((unsigned __int8 *)v41 + 24);
LABEL_13:
          uint64_t v28 = [NSNumber numberWithBool:v26 != 0];
          [v32 setObject:v28 forKeyedSubscript:v16];

          goto LABEL_14;
        }
        int v26 = [(PGLongTailSuggester *)v30 canGenerateSuggestionWithAsset:v24 onDate:v25];
        if (*((unsigned char *)v41 + 24)) {
          char v27 = v26;
        }
        else {
          char v27 = 1;
        }
        if (v27) {
          goto LABEL_13;
        }
LABEL_14:

        _Block_object_dispose(&v40, 8);
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v44 objects:v48 count:16];
    }
    while (v14);
  }

  return v32;
}

void __105__PGPhotosChallengeMetricEvent__featuredPhotoInferenceResultsForAnswerDateByAssetIds_questionMetricType___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = [*(id *)(a1 + 32) metricsCache];
  uint64_t v7 = [v6 featuredPhotosSuggestionSession];
  id v9 = [a2 suggesterWithSession:v7];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v9 canGenerateSuggestionWithAsset:*(void *)(a1 + 40) onDate:*(void *)(a1 + 48)];
  uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
  if (*(unsigned char *)(v8 + 24))
  {
    *(unsigned char *)(v8 + 24) = 1;
    *a3 = 1;
  }
}

- (id)_groundTruthForFeaturedPhotoFromQuestions:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v24 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v27;
    uint64_t v9 = *MEMORY[0x1E4F8E960];
    *(void *)&long long v6 = 138412290;
    long long v23 = v6;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v11, "entityIdentifier", v23);
        int v13 = [(PGPhotosChallengeMetricEvent *)self metricsCache];
        uint64_t v14 = [v13 assetByAssetIdentifier];
        double v15 = [v14 objectForKeyedSubscript:v12];

        if (v15)
        {
          double v16 = [v11 additionalInfo];
          long long v17 = [v16 objectForKeyedSubscript:v9];

          if (v17)
          {
            uint64_t v30 = v12;
            uint64_t v31 = v17;
            char v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
            if ([v11 state] == 2) {
              uint64_t v19 = MEMORY[0x1E4F1CC38];
            }
            else {
              uint64_t v19 = MEMORY[0x1E4F1CC28];
            }
            [v24 setObject:v19 forKeyedSubscript:v18];
          }
          else
          {
            __int16 v21 = +[PGLogging sharedLogging];
            char v18 = [v21 loggingConnection];

            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_1D1805000, v18, OS_LOG_TYPE_ERROR, "Featured photo question doesn't have the date when it was answered", buf, 2u);
            }
          }
        }
        else
        {
          int v20 = +[PGLogging sharedLogging];
          long long v17 = [v20 loggingConnection];

          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v23;
            uint64_t v33 = v12;
            _os_log_error_impl(&dword_1D1805000, v17, OS_LOG_TYPE_ERROR, "Failed to find asset with uuid: '%@'", buf, 0xCu);
          }
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v7);
  }

  return v24;
}

- (void)_gatherMetricsForFeaturedPhotoQuestions:(id)a3 questionMetricType:(unsigned __int16)a4 progressBlock:(id)a5
{
  uint64_t v6 = a4;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = (void (**)(void *, unsigned char *, double))_Block_copy(a5);
  double v10 = 0.0;
  if (!v9 || (double v11 = CFAbsoluteTimeGetCurrent(), v11 < 0.01))
  {
LABEL_7:
    uint64_t v12 = [(PGPhotosChallengeMetricEvent *)self _groundTruthForFeaturedPhotoFromQuestions:v8];
    int v13 = [v12 allKeys];
    if (v9)
    {
      double Current = CFAbsoluteTimeGetCurrent();
      if (Current - v10 >= 0.01)
      {
        char v20 = 0;
        v9[2](v9, &v20, 0.5);
        if (v20)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            int v22 = 1916;
            __int16 v23 = 2080;
            id v24 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metr"
                  "ics/MetricEvents/PGPhotosChallengeMetricEvent.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          goto LABEL_26;
        }
        double v10 = Current;
      }
      double v15 = [(PGPhotosChallengeMetricEvent *)self _featuredPhotoInferenceResultsForAnswerDateByAssetIds:v13 questionMetricType:v6];
      double v16 = CFAbsoluteTimeGetCurrent();
      if (v16 - v10 >= 0.01)
      {
        char v20 = 0;
        v9[2](v9, &v20, 0.9);
        if (v20)
        {
          if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
LABEL_25:

LABEL_26:
            goto LABEL_27;
          }
          *(_DWORD *)buf = 67109378;
          int v22 = 1919;
          __int16 v23 = 2080;
          id v24 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metric"
                "s/MetricEvents/PGPhotosChallengeMetricEvent.m";
          long long v17 = MEMORY[0x1E4F14500];
LABEL_24:
          _os_log_impl(&dword_1D1805000, v17, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          goto LABEL_25;
        }
        double v10 = v16;
      }
    }
    else
    {
      double v15 = [(PGPhotosChallengeMetricEvent *)self _featuredPhotoInferenceResultsForAnswerDateByAssetIds:v13 questionMetricType:v6];
    }
    char v18 = [[PGPrecisionRecallEvaluation alloc] initWithIdentifier:@"featuredPhoto" category:@"featuredPhoto"];
    [(PGPhotosChallengeMetricEvent *)self setEvaluation:v18];

    uint64_t v19 = [(PGPhotosChallengeMetricEvent *)self evaluation];
    [v19 evaluateWithGroundTruthResults:v12 andInferenceResults:v15];

    if (!v9) {
      goto LABEL_25;
    }
    if (CFAbsoluteTimeGetCurrent() - v10 < 0.01) {
      goto LABEL_25;
    }
    char v20 = 0;
    v9[2](v9, &v20, 1.0);
    if (!v20 || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
      goto LABEL_25;
    }
    *(_DWORD *)buf = 67109378;
    int v22 = 1923;
    __int16 v23 = 2080;
    id v24 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/Metr"
          "icEvents/PGPhotosChallengeMetricEvent.m";
    long long v17 = MEMORY[0x1E4F14500];
    goto LABEL_24;
  }
  char v20 = 0;
  v9[2](v9, &v20, 0.0);
  if (!v20)
  {
    double v10 = v11;
    goto LABEL_7;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    int v22 = 1912;
    __int16 v23 = 2080;
    id v24 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/Metr"
          "icEvents/PGPhotosChallengeMetricEvent.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_27:
}

- (id)_reasonResultByAssetEntityIdentifierForMusicQualityQuestions:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v31 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = v3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v34;
    uint64_t v7 = *MEMORY[0x1E4F8E920];
    uint64_t v29 = *MEMORY[0x1E4F8EA08];
    uint64_t v8 = *MEMORY[0x1E4F8EA00];
    uint64_t v30 = *MEMORY[0x1E4F8E920];
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v34 != v6) {
          objc_enumerationMutation(obj);
        }
        double v10 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        if ([v10 type] == 15)
        {
          int v11 = [v10 state];
          uint64_t v12 = @"NO";
          if (v11 == 2) {
            uint64_t v12 = @"YES";
          }
          int v13 = v12;
          uint64_t v14 = [v10 additionalInfo];
          double v15 = [v14 objectForKeyedSubscript:v7];

          if (v15)
          {
            double v16 = [v10 additionalInfo];
            long long v17 = [v16 objectForKeyedSubscript:v7];
          }
          else
          {
            long long v17 = @"NA";
          }
          char v18 = [v10 additionalInfo];
          uint64_t v19 = [v18 objectForKeyedSubscript:v29];

          if (v19)
          {
            char v20 = [v10 additionalInfo];
            __int16 v21 = [v20 objectForKeyedSubscript:v29];
          }
          else
          {
            __int16 v21 = @"0";
          }
          int v22 = [v10 additionalInfo];
          __int16 v23 = [v22 objectForKeyedSubscript:v8];

          if (v23)
          {
            id v24 = [v10 additionalInfo];
            uint64_t v25 = [v24 objectForKeyedSubscript:v8];
          }
          else
          {
            uint64_t v25 = @"Unknown";
          }
          long long v26 = [NSString stringWithFormat:@"[LikedSong:%@:%@->%@]-[Reason->%@]", v25, v21, v13, v17];
          long long v27 = [v10 entityIdentifier];
          [v31 setObject:v26 forKeyedSubscript:v27];

          uint64_t v7 = v30;
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v5);
  }

  return v31;
}

- (id)_groundTruthForMusicQualityQuestions:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    uint64_t v9 = MEMORY[0x1E4F1CC28];
    uint64_t v10 = MEMORY[0x1E4F1CC38];
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v12, "type", (void)v16) == 15)
        {
          int v13 = [v12 entityIdentifier];
          if ([v12 state] == 2) {
            uint64_t v14 = v10;
          }
          else {
            uint64_t v14 = v9;
          }
          [v4 setObject:v14 forKeyedSubscript:v13];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void)_gatherMetricsForMemoryMusicQuestions:(id)a3 progressBlock:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(void *, unsigned char *, double))_Block_copy(a4);
  double v8 = 0.0;
  if (!v7 || (double v9 = CFAbsoluteTimeGetCurrent(), v9 < 0.01))
  {
LABEL_7:
    uint64_t v10 = [(PGPhotosChallengeMetricEvent *)self _groundTruthForMusicQualityQuestions:v6];
    int v11 = [v10 allKeys];
    uint64_t v12 = [(PGPhotosChallengeMetricEvent *)self _inferredResultsForEntityIdentifiers:v11 withDefaultBoolValue:1];

    int v13 = [(PGPhotosChallengeMetricEvent *)self _reasonResultByAssetEntityIdentifierForMusicQualityQuestions:v6];
    if (v7)
    {
      double Current = CFAbsoluteTimeGetCurrent();
      if (Current - v8 >= 0.01)
      {
        char v18 = 0;
        v7[2](v7, &v18, 0.5);
        if (v18)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            int v20 = 1852;
            __int16 v21 = 2080;
            int v22 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metr"
                  "ics/MetricEvents/PGPhotosChallengeMetricEvent.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          goto LABEL_26;
        }
        double v8 = Current;
      }
    }
    double v15 = [[PGAssetsWithReasonPrecisionRecallEvaluation alloc] initWithIdentifier:@"memoryMusicQuality" category:@"memoryMusicQuality"];
    [(PGAssetsWithReasonPrecisionRecallEvaluation *)v15 evaluateWithGroundTruthResults:v10 inferenceResults:v12 reasonResultByAssetIdentifier:v13];
    if (v7)
    {
      double v16 = CFAbsoluteTimeGetCurrent();
      if (v16 - v8 >= 0.01)
      {
        char v18 = 0;
        v7[2](v7, &v18, 0.9);
        if (v18)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            int v20 = 1856;
            __int16 v21 = 2080;
            int v22 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metr"
                  "ics/MetricEvents/PGPhotosChallengeMetricEvent.m";
            long long v17 = MEMORY[0x1E4F14500];
LABEL_24:
            _os_log_impl(&dword_1D1805000, v17, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
LABEL_25:

LABEL_26:
          goto LABEL_27;
        }
        double v8 = v16;
      }
      [(PGPhotosChallengeMetricEvent *)self setEvaluation:v15];
      if (CFAbsoluteTimeGetCurrent() - v8 < 0.01) {
        goto LABEL_25;
      }
      char v18 = 0;
      v7[2](v7, &v18, 1.0);
      if (!v18 || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
        goto LABEL_25;
      }
      *(_DWORD *)buf = 67109378;
      int v20 = 1859;
      __int16 v21 = 2080;
      int v22 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/Me"
            "tricEvents/PGPhotosChallengeMetricEvent.m";
      long long v17 = MEMORY[0x1E4F14500];
      goto LABEL_24;
    }
    [(PGPhotosChallengeMetricEvent *)self setEvaluation:v15];
    goto LABEL_25;
  }
  char v18 = 0;
  v7[2](v7, &v18, 0.0);
  if (!v18)
  {
    double v8 = v9;
    goto LABEL_7;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    int v20 = 1846;
    __int16 v21 = 2080;
    int v22 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/Metr"
          "icEvents/PGPhotosChallengeMetricEvent.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_27:
}

- (void)_gatherMetricsForMemoryQuestions:(id)a3 questionMetricType:(unsigned __int16)a4 progressBlock:(id)a5
{
  unsigned int v43 = a4;
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  double v8 = (void (**)(void *, unsigned char *, double))_Block_copy(a5);
  double v9 = 0.0;
  if (v8)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    if (Current >= 0.01)
    {
      char v53 = 0;
      v8[2](v8, &v53, 0.0);
      if (v53)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)long long v56 = 1782;
          *(_WORD *)&v56[4] = 2080;
          *(void *)&v56[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/F"
                               "ramework/Metrics/MetricEvents/PGPhotosChallengeMetricEvent.m";
          int v11 = MEMORY[0x1E4F14500];
LABEL_48:
          _os_log_impl(&dword_1D1805000, v11, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          goto LABEL_49;
        }
        goto LABEL_49;
      }
      double v9 = Current;
    }
  }
  unint64_t v12 = [v7 count];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v40 = v7;
  id obj = v7;
  uint64_t v48 = [obj countByEnumeratingWithState:&v49 objects:v54 count:16];
  if (v48)
  {
    uint64_t v44 = 0;
    uint64_t v45 = 0;
    double v14 = 1.0 / (double)v12;
    uint64_t v15 = *(void *)v50;
    double v16 = 0.0;
    *(void *)&long long v13 = 67109120;
    long long v39 = v13;
    uint64_t v17 = v43;
    uint64_t v41 = *(void *)v50;
    uint64_t v42 = self;
    while (2)
    {
      for (uint64_t i = 0; i != v48; ++i)
      {
        if (*(void *)v50 != v15) {
          objc_enumerationMutation(obj);
        }
        long long v19 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        double v16 = v14 + v16;
        if (v8)
        {
          double v20 = CFAbsoluteTimeGetCurrent();
          if (v20 - v9 >= 0.01)
          {
            char v53 = 0;
            v8[2](v8, &v53, v16);
            if (v53)
            {
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)long long v56 = 1791;
                *(_WORD *)&v56[4] = 2080;
                *(void *)&v56[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosG"
                                     "raph/Framework/Metrics/MetricEvents/PGPhotosChallengeMetricEvent.m";
                _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
              }

              id v7 = v40;
              goto LABEL_49;
            }
            double v9 = v20;
          }
        }
        __int16 v21 = objc_msgSend(v19, "entityIdentifier", v39);
        int v22 = [(PGPhotosChallengeMetricEvent *)self metricsCache];
        uint64_t v23 = [v22 memoryByMemoryIdentifier];
        id v24 = [v23 objectForKeyedSubscript:v21];

        if (v24)
        {
          if (v17 == 116)
          {
            if ([v19 state] == 2) {
              ++v44;
            }
            else {
              ++v45;
            }
          }
          else
          {
            long long v27 = v8;
            uint64_t v28 = [v24 category];
            uint64_t v46 = [v24 subcategory];
            uint64_t v29 = [(PGPhotosChallengeMetricEvent *)self memoryCategorySubCategoryByQuestionMetricType];
            uint64_t v30 = [NSNumber numberWithUnsignedShort:v17];
            id v31 = [v29 objectForKeyedSubscript:v30];

            if (!v31)
            {
              id v32 = +[PGLogging sharedLogging];
              long long v33 = [v32 loggingConnection];

              if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v39;
                *(_DWORD *)long long v56 = v17;
                _os_log_error_impl(&dword_1D1805000, v33, OS_LOG_TYPE_ERROR, "QuestionMetricType %d has no MemoryCategory/SubCategory pairs", buf, 8u);
              }
            }
            long long v34 = [v31 firstObject];
            uint64_t v35 = [v34 unsignedIntegerValue];

            long long v36 = [v31 lastObject];
            uint64_t v37 = [v36 unsignedIntegerValue];

            if (v28 == v35)
            {
              double v8 = v27;
              uint64_t v15 = v41;
              if (v46 == v37)
              {
                uint64_t v17 = v43;
                if ([v19 state] == 2) {
                  ++v44;
                }
                else {
                  ++v45;
                }
              }
              else
              {
                uint64_t v17 = v43;
              }
            }
            else
            {
              double v8 = v27;
              uint64_t v17 = v43;
              uint64_t v15 = v41;
            }

            self = v42;
          }
        }
        else
        {
          uint64_t v25 = +[PGLogging sharedLogging];
          long long v26 = [v25 loggingConnection];

          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)long long v56 = v21;
            _os_log_error_impl(&dword_1D1805000, v26, OS_LOG_TYPE_ERROR, "No memory found for uuid %@ when collecting metrics for memory quality question.", buf, 0xCu);
          }
        }
      }
      uint64_t v48 = [obj countByEnumeratingWithState:&v49 objects:v54 count:16];
      if (v48) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v44 = 0;
    uint64_t v45 = 0;
  }

  uint64_t v38 = [[PGPrecisionRecallEvaluation alloc] initWithIdentifier:@"memoryQuality" category:@"memoryQuality" truePositives:v44 falsePositives:v45 falseNegatives:0 trueNegatives:0];
  [(PGPhotosChallengeMetricEvent *)self setEvaluation:v38];

  id v7 = v40;
  if (v8)
  {
    if (CFAbsoluteTimeGetCurrent() - v9 >= 0.01)
    {
      char v53 = 0;
      v8[2](v8, &v53, 1.0);
      if (v53)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)long long v56 = 1839;
          *(_WORD *)&v56[4] = 2080;
          *(void *)&v56[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/F"
                               "ramework/Metrics/MetricEvents/PGPhotosChallengeMetricEvent.m";
          int v11 = MEMORY[0x1E4F14500];
          goto LABEL_48;
        }
      }
    }
  }
LABEL_49:
}

- (void)_gatherMetricsForPetKnowledgeQuestions:(id)a3 progressBlock:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(void *, unsigned char *, double))_Block_copy(a4);
  double v8 = 0.0;
  if (v7)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    if (Current >= 0.01)
    {
      char v29 = 0;
      v7[2](v7, &v29, 0.0);
      if (v29)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          int v32 = 1754;
          __int16 v33 = 2080;
          long long v34 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metric"
                "s/MetricEvents/PGPhotosChallengeMetricEvent.m";
          uint64_t v10 = MEMORY[0x1E4F14500];
LABEL_32:
          _os_log_impl(&dword_1D1805000, v10, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          goto LABEL_33;
        }
        goto LABEL_33;
      }
      double v8 = Current;
    }
  }
  id v24 = self;
  unint64_t v11 = [v6 count];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v12 = v6;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    double v17 = 1.0 / (double)v11;
    uint64_t v18 = *(void *)v26;
    double v19 = 0.0;
    while (2)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v26 != v18) {
          objc_enumerationMutation(v12);
        }
        __int16 v21 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        double v19 = v17 + v19;
        if (v7)
        {
          double v22 = CFAbsoluteTimeGetCurrent();
          if (v22 - v8 >= 0.01)
          {
            char v29 = 0;
            v7[2](v7, &v29, v19);
            if (v29)
            {
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 67109378;
                int v32 = 1763;
                __int16 v33 = 2080;
                long long v34 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/"
                      "Metrics/MetricEvents/PGPhotosChallengeMetricEvent.m";
                _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
              }

              goto LABEL_33;
            }
            double v8 = v22;
          }
        }
        if ([v21 state] == 2)
        {
          ++v15;
        }
        else if ([v21 state] == 3)
        {
          ++v16;
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v25 objects:v30 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v15 = 0;
    uint64_t v16 = 0;
  }

  uint64_t v23 = [[PGPrecisionRecallEvaluation alloc] initWithIdentifier:@"petKnowledge" category:@"petKnowledge" truePositives:v15 falsePositives:v16 falseNegatives:0 trueNegatives:0];
  [(PGPhotosChallengeMetricEvent *)v24 setEvaluation:v23];

  if (v7)
  {
    if (CFAbsoluteTimeGetCurrent() - v8 >= 0.01)
    {
      char v29 = 0;
      v7[2](v7, &v29, 0.0);
      if (v29)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          int v32 = 1775;
          __int16 v33 = 2080;
          long long v34 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metric"
                "s/MetricEvents/PGPhotosChallengeMetricEvent.m";
          uint64_t v10 = MEMORY[0x1E4F14500];
          goto LABEL_32;
        }
      }
    }
  }
LABEL_33:
}

- (void)_deleteOutdatedPetQuestionsWithValidPetUUIDs:(id)a3
{
  v23[3] = *MEMORY[0x1E4F143B8];
  workingContext = self->_workingContext;
  id v4 = a3;
  id v5 = [(PGManagerWorkingContext *)workingContext photoLibrary];
  id v6 = [v5 librarySpecificFetchOptions];
  id v7 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"type", 13);
  double v8 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != %d", @"displayType", 6);
  double v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"NOT (%K IN %@)", @"entityIdentifier", v4];

  uint64_t v10 = (void *)MEMORY[0x1E4F28BA0];
  v23[0] = v7;
  v23[1] = v8;
  v23[2] = v9;
  unint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:3];
  id v12 = [v10 andPredicateWithSubpredicates:v11];
  [v6 setPredicate:v12];

  uint64_t v13 = [MEMORY[0x1E4F39250] fetchQuestionsWithOptions:v6 validQuestionsOnly:0];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __77__PGPhotosChallengeMetricEvent__deleteOutdatedPetQuestionsWithValidPetUUIDs___block_invoke;
  v19[3] = &unk_1E68F0B18;
  id v14 = v13;
  id v20 = v14;
  id v18 = 0;
  [v5 performChangesAndWait:v19 error:&v18];
  id v15 = v18;
  if (v15)
  {
    uint64_t v16 = +[PGLogging sharedLogging];
    double v17 = [v16 loggingConnection];

    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v15;
      _os_log_error_impl(&dword_1D1805000, v17, OS_LOG_TYPE_ERROR, "Error deleting outdated pet questions: %@", buf, 0xCu);
    }
  }
}

uint64_t __77__PGPhotosChallengeMetricEvent__deleteOutdatedPetQuestionsWithValidPetUUIDs___block_invoke(uint64_t a1)
{
  return [MEMORY[0x1E4F39258] deleteQuestions:*(void *)(a1 + 32)];
}

- (id)_currentPetInferenceResultsForPetUUIDs:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  workingContext = self->_workingContext;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __71__PGPhotosChallengeMetricEvent__currentPetInferenceResultsForPetUUIDs___block_invoke;
  v12[3] = &unk_1E68F0AF0;
  id v13 = v4;
  id v7 = v5;
  id v14 = v7;
  id v8 = v4;
  [(PGManagerWorkingContext *)workingContext performSynchronousConcurrentGraphReadUsingBlock:v12];
  double v9 = v14;
  id v10 = v7;

  return v10;
}

void __71__PGPhotosChallengeMetricEvent__currentPetInferenceResultsForPetUUIDs___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v15 = a2;
  uint64_t v16 = [v15 graph];
  id v18 = [v16 meNode];
  uint64_t v24 = 0;
  long long v25 = &v24;
  uint64_t v26 = 0x3032000000;
  long long v27 = __Block_byref_object_copy__72429;
  long long v28 = __Block_byref_object_dispose__72430;
  id v29 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v3 = +[PGGraphNodeCollection nodesInGraph:v16];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __71__PGPhotosChallengeMetricEvent__currentPetInferenceResultsForPetUUIDs___block_invoke_2;
  v23[3] = &unk_1E68F0AC8;
  void v23[4] = &v24;
  [v3 enumerateNodesUsingBlock:v23];
  id v14 = v3;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v4 = [obj countByEnumeratingWithState:&v19 objects:v30 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v20 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        id v8 = [MEMORY[0x1E4F391F0] localIdentifierWithUUID:v7];
        double v9 = [(id)v25[5] objectForKeyedSubscript:v8];
        id v10 = [v9 collection];
        unint64_t v11 = [v10 ownerNodes];
        uint64_t v12 = [v11 containsNode:v18];

        id v13 = [NSNumber numberWithBool:v12];
        [*(id *)(a1 + 40) setObject:v13 forKeyedSubscript:v7];
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v19 objects:v30 count:16];
    }
    while (v4);
  }

  _Block_object_dispose(&v24, 8);
}

void __71__PGPhotosChallengeMetricEvent__currentPetInferenceResultsForPetUUIDs___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v3 = a2;
  id v4 = [v3 localIdentifier];
  [v2 setObject:v3 forKeyedSubscript:v4];
}

- (id)_groundTruthForCurrentPetInferenceFromQuestions:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v23;
    uint64_t v8 = *MEMORY[0x1E4F8E920];
    uint64_t v9 = *MEMORY[0x1E4F8EA18];
    id v10 = (void *)MEMORY[0x1E4F1CC28];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        id v13 = [v12 additionalInfo];
        id v14 = [v13 objectForKeyedSubscript:v8];

        int v15 = [v12 state];
        uint64_t v16 = v10;
        if (v15 == 2)
        {
          int v17 = [v14 isEqualToString:v9];
          uint64_t v16 = (void *)MEMORY[0x1E4F1CC38];
          if (!v17) {
            uint64_t v16 = v10;
          }
        }
        id v18 = v16;
        long long v19 = [v12 entityIdentifier];
        [v4 setObject:v18 forKeyedSubscript:v19];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v6);
  }

  return v4;
}

- (void)_gatherMetricsForPetQuestions:(id)a3 progressBlock:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void (**)(void *, unsigned char *, double))_Block_copy(v7);
  double v9 = 0.0;
  if (!v8 || (double v10 = CFAbsoluteTimeGetCurrent(), v10 < 0.01))
  {
LABEL_7:
    uint64_t buf = 0;
    *(void *)&long long v37 = &buf;
    *((void *)&v37 + 1) = 0x3032000000;
    uint64_t v38 = __Block_byref_object_copy__72429;
    long long v39 = __Block_byref_object_dispose__72430;
    id v40 = (id)MEMORY[0x1E4F1CBF0];
    workingContext = self->_workingContext;
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __76__PGPhotosChallengeMetricEvent__gatherMetricsForPetQuestions_progressBlock___block_invoke;
    v31[3] = &unk_1E68F0A78;
    v31[4] = &buf;
    [(PGManagerWorkingContext *)workingContext performSynchronousConcurrentGraphReadUsingBlock:v31];
    uint64_t v25 = 0;
    uint64_t v26 = &v25;
    uint64_t v27 = 0x3032000000;
    long long v28 = __Block_byref_object_copy__72429;
    id v29 = __Block_byref_object_dispose__72430;
    id v30 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v12 = *(void **)(v37 + 40);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __76__PGPhotosChallengeMetricEvent__gatherMetricsForPetQuestions_progressBlock___block_invoke_2;
    v24[3] = &unk_1E68F0AA0;
    v24[4] = &v25;
    [v12 enumerateObjectsUsingBlock:v24];
    id v13 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"entityIdentifier", v26[5]];
    id v14 = [v6 filteredArrayUsingPredicate:v13];

    [(PGPhotosChallengeMetricEvent *)self _deleteOutdatedPetQuestionsWithValidPetUUIDs:v26[5]];
    int v15 = [(PGPhotosChallengeMetricEvent *)self _groundTruthForCurrentPetInferenceFromQuestions:v14];
    if (v8)
    {
      double Current = CFAbsoluteTimeGetCurrent();
      if (Current - v9 >= 0.01)
      {
        char v23 = 0;
        v8[2](v8, &v23, 0.5);
        if (v23)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            int v32 = 67109378;
            int v33 = 1674;
            __int16 v34 = 2080;
            uint64_t v35 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metr"
                  "ics/MetricEvents/PGPhotosChallengeMetricEvent.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&v32, 0x12u);
          }
          goto LABEL_26;
        }
        double v9 = Current;
      }
    }
    int v17 = [v15 allKeys];
    id v18 = [(PGPhotosChallengeMetricEvent *)self _currentPetInferenceResultsForPetUUIDs:v17];

    if (v8)
    {
      double v19 = CFAbsoluteTimeGetCurrent();
      if (v19 - v9 >= 0.01)
      {
        char v23 = 0;
        v8[2](v8, &v23, 0.9);
        if (v23)
        {
          if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
LABEL_25:

LABEL_26:
            _Block_object_dispose(&v25, 8);

            _Block_object_dispose(&buf, 8);
            goto LABEL_27;
          }
          int v32 = 67109378;
          int v33 = 1677;
          __int16 v34 = 2080;
          uint64_t v35 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metric"
                "s/MetricEvents/PGPhotosChallengeMetricEvent.m";
          long long v20 = MEMORY[0x1E4F14500];
LABEL_24:
          _os_log_impl(&dword_1D1805000, v20, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&v32, 0x12u);
          goto LABEL_25;
        }
        double v9 = v19;
      }
    }
    long long v21 = [[PGPrecisionRecallEvaluation alloc] initWithIdentifier:@"pet" category:@"pet"];
    [(PGPhotosChallengeMetricEvent *)self setEvaluation:v21];

    long long v22 = [(PGPhotosChallengeMetricEvent *)self evaluation];
    [v22 evaluateWithGroundTruthResults:v15 andInferenceResults:v18];

    if (!v8) {
      goto LABEL_25;
    }
    if (CFAbsoluteTimeGetCurrent() - v9 < 0.01) {
      goto LABEL_25;
    }
    char v23 = 0;
    v8[2](v8, &v23, 1.0);
    if (!v23 || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
      goto LABEL_25;
    }
    int v32 = 67109378;
    int v33 = 1681;
    __int16 v34 = 2080;
    uint64_t v35 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/Metr"
          "icEvents/PGPhotosChallengeMetricEvent.m";
    long long v20 = MEMORY[0x1E4F14500];
    goto LABEL_24;
  }
  LOBYTE(v25) = 0;
  ((void (**)(void *, uint64_t *, double))v8)[2](v8, &v25, 0.0);
  if (!(_BYTE)v25)
  {
    double v9 = v10;
    goto LABEL_7;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    uint64_t buf = 0x67704000202;
    LOWORD(v37) = 2080;
    *(void *)((char *)&v37 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Metrics/MetricEvents/PGPhotosChallengeMetricEvent.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
  }
LABEL_27:
}

void __76__PGPhotosChallengeMetricEvent__gatherMetricsForPetQuestions_progressBlock___block_invoke(uint64_t a1, void *a2)
{
  id v8 = [a2 graph];
  id v3 = +[PGGraphNodeCollection nodesInGraph:v8];
  id v4 = [v3 localIdentifiers];
  uint64_t v5 = [v4 allObjects];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void __76__PGPhotosChallengeMetricEvent__gatherMetricsForPetQuestions_progressBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v3 = [MEMORY[0x1E4F391F0] uuidFromLocalIdentifier:a2];
  [v2 addObject:v3];
}

- (id)_ageCategoryInferenceResultsForAgeCategoryByPersonUUIDs:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
  workingContext = self->_workingContext;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __88__PGPhotosChallengeMetricEvent__ageCategoryInferenceResultsForAgeCategoryByPersonUUIDs___block_invoke;
  v12[3] = &unk_1E68F0960;
  void v12[4] = self;
  id v13 = v4;
  id v7 = v5;
  id v14 = v7;
  id v8 = v4;
  [(PGManagerWorkingContext *)workingContext performSynchronousConcurrentGraphReadUsingBlock:v12];
  double v9 = v14;
  id v10 = v7;

  return v10;
}

void __88__PGPhotosChallengeMetricEvent__ageCategoryInferenceResultsForAgeCategoryByPersonUUIDs___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v26 = [a2 graph];
  id v3 = [*(id *)(a1 + 32) metricsCache];
  uint64_t v25 = [v3 activePersonUUIDByPersonUUID];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v24 = a1;
  id obj = *(id *)(a1 + 40);
  uint64_t v4 = [obj countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v28;
    *(void *)&long long v5 = 138412290;
    long long v22 = v5;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v28 != v7) {
          objc_enumerationMutation(obj);
        }
        double v9 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        id v10 = objc_msgSend(v9, "allKeys", v22);
        unint64_t v11 = [v10 firstObject];

        uint64_t v12 = [v9 objectForKeyedSubscript:v11];
        uint64_t v13 = [v12 unsignedIntegerValue];
        id v14 = (void *)MEMORY[0x1E4F391F0];
        int v15 = [v25 objectForKeyedSubscript:v11];
        uint64_t v16 = [v14 localIdentifierWithUUID:v15];

        int v17 = [v26 personNodeForPersonLocalIdentifier:v16];
        id v18 = v17;
        if (v17)
        {
          BOOL v19 = [v17 ageCategory] == v13;
          long long v20 = [NSNumber numberWithBool:v19];
          [*(id *)(v24 + 48) setObject:v20 forKeyedSubscript:v9];
        }
        else
        {
          long long v21 = +[PGLogging sharedLogging];
          long long v20 = [v21 loggingConnection];

          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)uint64_t buf = v22;
            int v32 = v16;
            _os_log_error_impl(&dword_1D1805000, v20, OS_LOG_TYPE_ERROR, "Failed to find person node for person local identifier: '%@'", buf, 0xCu);
          }
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v27 objects:v33 count:16];
    }
    while (v6);
  }
}

- (id)_groundTruthForAgeCategoryFromQuestions:(id)a3
{
  id v4 = a3;
  long long v5 = [MEMORY[0x1E4F1CA60] dictionary];
  workingContext = self->_workingContext;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __72__PGPhotosChallengeMetricEvent__groundTruthForAgeCategoryFromQuestions___block_invoke;
  v12[3] = &unk_1E68F0960;
  void v12[4] = self;
  id v13 = v4;
  id v7 = v5;
  id v14 = v7;
  id v8 = v4;
  [(PGManagerWorkingContext *)workingContext performSynchronousConcurrentGraphReadUsingBlock:v12];
  double v9 = v14;
  id v10 = v7;

  return v10;
}

void __72__PGPhotosChallengeMetricEvent__groundTruthForAgeCategoryFromQuestions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v24 = [a2 graph];
  id v3 = [*(id *)(a1 + 32) metricsCache];
  id v4 = [v3 activePersonUUIDByPersonUUID];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v23 = a1;
  id obj = *(id *)(a1 + 40);
  uint64_t v5 = [obj countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v26;
    *(void *)&long long v6 = 138412290;
    long long v21 = v6;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        unint64_t v11 = objc_msgSend(v10, "entityIdentifier", v21);
        uint64_t v12 = (void *)MEMORY[0x1E4F391F0];
        id v13 = [v4 objectForKeyedSubscript:v11];
        id v14 = [v12 localIdentifierWithUUID:v13];

        int v15 = [v24 personNodeForPersonLocalIdentifier:v14];
        if (v15)
        {
          uint64_t v16 = [v10 additionalInfo];
          int v17 = [v16 objectForKeyedSubscript:@"ageCategory"];

          long long v29 = v11;
          long long v30 = v17;
          id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
          if ([v10 state] == 2) {
            uint64_t v19 = MEMORY[0x1E4F1CC38];
          }
          else {
            uint64_t v19 = MEMORY[0x1E4F1CC28];
          }
          [*(id *)(v23 + 48) setObject:v19 forKeyedSubscript:v18];
        }
        else
        {
          long long v20 = +[PGLogging sharedLogging];
          int v17 = [v20 loggingConnection];

          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)uint64_t buf = v21;
            int v32 = v11;
            _os_log_error_impl(&dword_1D1805000, v17, OS_LOG_TYPE_ERROR, "Failed to find person node for uuid: '%@'", buf, 0xCu);
          }
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v7);
  }
}

- (void)_gatherMetricsForAgeCategoryQuestions:(id)a3 progressBlock:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(void *, unsigned char *, double))_Block_copy(a4);
  double v8 = 0.0;
  if (!v7 || (double v9 = CFAbsoluteTimeGetCurrent(), v9 < 0.01))
  {
LABEL_7:
    id v10 = [(PGPhotosChallengeMetricEvent *)self _groundTruthForAgeCategoryFromQuestions:v6];
    unint64_t v11 = [v10 allKeys];
    if (v7)
    {
      double Current = CFAbsoluteTimeGetCurrent();
      if (Current - v8 >= 0.01)
      {
        char v18 = 0;
        v7[2](v7, &v18, 0.5);
        if (v18)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)uint64_t buf = 67109378;
            int v20 = 1586;
            __int16 v21 = 2080;
            long long v22 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metr"
                  "ics/MetricEvents/PGPhotosChallengeMetricEvent.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          goto LABEL_26;
        }
        double v8 = Current;
      }
      id v13 = [(PGPhotosChallengeMetricEvent *)self _ageCategoryInferenceResultsForAgeCategoryByPersonUUIDs:v11];
      double v14 = CFAbsoluteTimeGetCurrent();
      if (v14 - v8 >= 0.01)
      {
        char v18 = 0;
        v7[2](v7, &v18, 0.9);
        if (v18)
        {
          if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
LABEL_25:

LABEL_26:
            goto LABEL_27;
          }
          *(_DWORD *)uint64_t buf = 67109378;
          int v20 = 1589;
          __int16 v21 = 2080;
          long long v22 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metric"
                "s/MetricEvents/PGPhotosChallengeMetricEvent.m";
          int v15 = MEMORY[0x1E4F14500];
LABEL_24:
          _os_log_impl(&dword_1D1805000, v15, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          goto LABEL_25;
        }
        double v8 = v14;
      }
    }
    else
    {
      id v13 = [(PGPhotosChallengeMetricEvent *)self _ageCategoryInferenceResultsForAgeCategoryByPersonUUIDs:v11];
    }
    uint64_t v16 = [[PGPrecisionRecallEvaluation alloc] initWithIdentifier:@"ageCategory" category:@"ageCategory"];
    [(PGPhotosChallengeMetricEvent *)self setEvaluation:v16];

    int v17 = [(PGPhotosChallengeMetricEvent *)self evaluation];
    [v17 evaluateWithGroundTruthResults:v10 andInferenceResults:v13];

    if (!v7) {
      goto LABEL_25;
    }
    if (CFAbsoluteTimeGetCurrent() - v8 < 0.01) {
      goto LABEL_25;
    }
    char v18 = 0;
    v7[2](v7, &v18, 1.0);
    if (!v18 || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
      goto LABEL_25;
    }
    *(_DWORD *)uint64_t buf = 67109378;
    int v20 = 1593;
    __int16 v21 = 2080;
    long long v22 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/Metr"
          "icEvents/PGPhotosChallengeMetricEvent.m";
    int v15 = MEMORY[0x1E4F14500];
    goto LABEL_24;
  }
  char v18 = 0;
  v7[2](v7, &v18, 0.0);
  if (!v18)
  {
    double v8 = v9;
    goto LABEL_7;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)uint64_t buf = 67109378;
    int v20 = 1582;
    __int16 v21 = 2080;
    long long v22 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/Metr"
          "icEvents/PGPhotosChallengeMetricEvent.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_27:
}

- (id)_namingInferenceResultsForContactIdentifierByPersonUUIDs:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
  workingContext = self->_workingContext;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __89__PGPhotosChallengeMetricEvent__namingInferenceResultsForContactIdentifierByPersonUUIDs___block_invoke;
  v12[3] = &unk_1E68F0960;
  void v12[4] = self;
  id v13 = v4;
  id v7 = v5;
  id v14 = v7;
  id v8 = v4;
  [(PGManagerWorkingContext *)workingContext performSynchronousConcurrentGraphReadUsingBlock:v12];
  double v9 = v14;
  id v10 = v7;

  return v10;
}

void __89__PGPhotosChallengeMetricEvent__namingInferenceResultsForContactIdentifierByPersonUUIDs___block_invoke(id *a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v19 = a2;
  long long v22 = [v19 graph];
  v2 = [a1[4] metricsCache];
  id v3 = [v2 activePersonUUIDByPersonUUID];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = a1[5];
  uint64_t v4 = [obj countByEnumeratingWithState:&v26 objects:v33 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v27 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        id v8 = [v7 allKeys];
        double v9 = [v8 firstObject];

        id v10 = [v7 objectForKeyedSubscript:v9];
        if (v10)
        {
          unint64_t v11 = (void *)MEMORY[0x1E4F391F0];
          uint64_t v12 = [v3 objectForKeyedSubscript:v9];
          id v13 = [v11 localIdentifierWithUUID:v12];

          id v14 = [v22 personNodeForPersonLocalIdentifier:v13];
          if (v14)
          {
            *(void *)&long long buf = 0;
            *((void *)&buf + 1) = &buf;
            uint64_t v31 = 0x2020000000;
            char v32 = 0;
            v23[0] = MEMORY[0x1E4F143A8];
            v23[1] = 3221225472;
            v23[2] = __89__PGPhotosChallengeMetricEvent__namingInferenceResultsForContactIdentifierByPersonUUIDs___block_invoke_400;
            v23[3] = &unk_1E68F0A50;
            p_long long buf = &buf;
            id v24 = v10;
            [v14 enumerateContactSuggestionsSortedByConfidenceMatchingQuery:1 usingBlock:v23];
            int v15 = [NSNumber numberWithBool:*(unsigned __int8 *)(*((void *)&buf + 1) + 24)];
            [a1[6] setObject:v15 forKeyedSubscript:v7];

            _Block_object_dispose(&buf, 8);
          }
          else
          {
            int v17 = +[PGLogging sharedLogging];
            char v18 = [v17 loggingConnection];

            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              LODWORD(buf) = 138412290;
              *(void *)((char *)&buf + 4) = v9;
              _os_log_error_impl(&dword_1D1805000, v18, OS_LOG_TYPE_ERROR, "Failed to find person node for person uuid: '%@'", (uint8_t *)&buf, 0xCu);
            }
          }
        }
        else
        {
          uint64_t v16 = +[PGLogging sharedLogging];
          id v13 = [v16 loggingConnection];

          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            LODWORD(buf) = 138412290;
            *(void *)((char *)&buf + 4) = v9;
            _os_log_error_impl(&dword_1D1805000, v13, OS_LOG_TYPE_ERROR, "Contact identifier for person: %@ is nil", (uint8_t *)&buf, 0xCu);
          }
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v26 objects:v33 count:16];
    }
    while (v4);
  }
}

void __89__PGPhotosChallengeMetricEvent__namingInferenceResultsForContactIdentifierByPersonUUIDs___block_invoke_400(uint64_t a1, void *a2)
{
  id v3 = [a2 contactIdentifier];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= [v3 isEqualToString:*(void *)(a1 + 32)];
}

- (id)_groundTruthForNamingFromQuestions:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
  workingContext = self->_workingContext;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __67__PGPhotosChallengeMetricEvent__groundTruthForNamingFromQuestions___block_invoke;
  v12[3] = &unk_1E68F0960;
  void v12[4] = self;
  id v13 = v4;
  id v7 = v5;
  id v14 = v7;
  id v8 = v4;
  [(PGManagerWorkingContext *)workingContext performSynchronousConcurrentGraphReadUsingBlock:v12];
  double v9 = v14;
  id v10 = v7;

  return v10;
}

void __67__PGPhotosChallengeMetricEvent__groundTruthForNamingFromQuestions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v24 = [a2 graph];
  id v3 = [*(id *)(a1 + 32) metricsCache];
  id v4 = [v3 activePersonUUIDByPersonUUID];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v23 = a1;
  id obj = *(id *)(a1 + 40);
  uint64_t v5 = [obj countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v26;
    *(void *)&long long v6 = 138412290;
    long long v21 = v6;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        unint64_t v11 = objc_msgSend(v10, "entityIdentifier", v21);
        uint64_t v12 = (void *)MEMORY[0x1E4F391F0];
        id v13 = [v4 objectForKeyedSubscript:v11];
        id v14 = [v12 localIdentifierWithUUID:v13];

        int v15 = [v24 personNodeForPersonLocalIdentifier:v14];
        if (v15)
        {
          uint64_t v16 = [v10 additionalInfo];
          int v17 = [v16 objectForKeyedSubscript:@"contactIdentifier"];

          long long v29 = v11;
          long long v30 = v17;
          char v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
          if ([v10 state] == 2) {
            uint64_t v19 = MEMORY[0x1E4F1CC38];
          }
          else {
            uint64_t v19 = MEMORY[0x1E4F1CC28];
          }
          [*(id *)(v23 + 48) setObject:v19 forKeyedSubscript:v18];
        }
        else
        {
          int v20 = +[PGLogging sharedLogging];
          int v17 = [v20 loggingConnection];

          if (!os_log_type_enabled(v17, OS_LOG_TYPE_INFO)) {
            goto LABEL_14;
          }
          char v18 = [v10 entityIdentifier];
          *(_DWORD *)long long buf = v21;
          char v32 = v18;
          _os_log_impl(&dword_1D1805000, v17, OS_LOG_TYPE_INFO, "Failed to find person node for entity identifier: '%@'", buf, 0xCu);
        }

LABEL_14:
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v7);
  }
}

- (void)_gatherMetricsForNamingQuestions:(id)a3 progressBlock:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(void *, unsigned char *, double))_Block_copy(a4);
  double v8 = 0.0;
  if (!v7 || (double v9 = CFAbsoluteTimeGetCurrent(), v9 < 0.01))
  {
LABEL_7:
    id v10 = [(PGPhotosChallengeMetricEvent *)self _groundTruthForNamingFromQuestions:v6];
    unint64_t v11 = [v10 allKeys];
    if (v7)
    {
      double Current = CFAbsoluteTimeGetCurrent();
      if (Current - v8 >= 0.01)
      {
        char v18 = 0;
        v7[2](v7, &v18, 0.5);
        if (v18)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = 67109378;
            int v20 = 1508;
            __int16 v21 = 2080;
            long long v22 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metr"
                  "ics/MetricEvents/PGPhotosChallengeMetricEvent.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          goto LABEL_26;
        }
        double v8 = Current;
      }
      id v13 = [(PGPhotosChallengeMetricEvent *)self _namingInferenceResultsForContactIdentifierByPersonUUIDs:v11];
      double v14 = CFAbsoluteTimeGetCurrent();
      if (v14 - v8 >= 0.01)
      {
        char v18 = 0;
        v7[2](v7, &v18, 0.9);
        if (v18)
        {
          if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
LABEL_25:

LABEL_26:
            goto LABEL_27;
          }
          *(_DWORD *)long long buf = 67109378;
          int v20 = 1511;
          __int16 v21 = 2080;
          long long v22 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metric"
                "s/MetricEvents/PGPhotosChallengeMetricEvent.m";
          int v15 = MEMORY[0x1E4F14500];
LABEL_24:
          _os_log_impl(&dword_1D1805000, v15, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          goto LABEL_25;
        }
        double v8 = v14;
      }
    }
    else
    {
      id v13 = [(PGPhotosChallengeMetricEvent *)self _namingInferenceResultsForContactIdentifierByPersonUUIDs:v11];
    }
    uint64_t v16 = [[PGPrecisionRecallEvaluation alloc] initWithIdentifier:@"naming" category:@"naming"];
    [(PGPhotosChallengeMetricEvent *)self setEvaluation:v16];

    int v17 = [(PGPhotosChallengeMetricEvent *)self evaluation];
    [v17 evaluateWithGroundTruthResults:v10 andInferenceResults:v13];

    if (!v7) {
      goto LABEL_25;
    }
    if (CFAbsoluteTimeGetCurrent() - v8 < 0.01) {
      goto LABEL_25;
    }
    char v18 = 0;
    v7[2](v7, &v18, 1.0);
    if (!v18 || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
      goto LABEL_25;
    }
    *(_DWORD *)long long buf = 67109378;
    int v20 = 1515;
    __int16 v21 = 2080;
    long long v22 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/Metr"
          "icEvents/PGPhotosChallengeMetricEvent.m";
    int v15 = MEMORY[0x1E4F14500];
    goto LABEL_24;
  }
  char v18 = 0;
  v7[2](v7, &v18, 0.0);
  if (!v18)
  {
    double v8 = v9;
    goto LABEL_7;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 67109378;
    int v20 = 1504;
    __int16 v21 = 2080;
    long long v22 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/Metr"
          "icEvents/PGPhotosChallengeMetricEvent.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_27:
}

- (id)_frequentLocationInferenceResultsForLocationByAssetIds:(id)a3 locationType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  char v18 = __Block_byref_object_copy__72429;
  uint64_t v19 = __Block_byref_object_dispose__72430;
  id v20 = [MEMORY[0x1E4F1CA60] dictionary];
  workingContext = self->_workingContext;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __100__PGPhotosChallengeMetricEvent__frequentLocationInferenceResultsForLocationByAssetIds_locationType___block_invoke;
  v12[3] = &unk_1E68F0A28;
  id v9 = v6;
  id v13 = v9;
  double v14 = &v15;
  [(PGManagerWorkingContext *)workingContext performSynchronousConcurrentGraphReadUsingBlock:v12];
  id v10 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v10;
}

void __100__PGPhotosChallengeMetricEvent__frequentLocationInferenceResultsForLocationByAssetIds_locationType___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v13 = a2;
  double v14 = [v13 graph];
  v2 = +[PGGraphNodeCollection nodesInGraph:v14];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v3 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v23 != v4) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        id v7 = [v6 allKeys];
        double v8 = [v7 firstObject];

        id v9 = [v6 objectForKeyedSubscript:v8];
        [v9 coordinate];
        uint64_t v18 = 0;
        uint64_t v19 = &v18;
        uint64_t v20 = 0x2020000000;
        char v21 = 0;
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        _DWORD v17[2] = __100__PGPhotosChallengeMetricEvent__frequentLocationInferenceResultsForLocationByAssetIds_locationType___block_invoke_2;
        v17[3] = &unk_1E68F0A00;
        v17[5] = v10;
        v17[6] = v11;
        v17[4] = &v18;
        [v2 enumerateIdentifiersAsCollectionsWithBlock:v17];
        uint64_t v12 = [NSNumber numberWithBool:*((unsigned __int8 *)v19 + 24)];
        [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v12 forKeyedSubscript:v6];

        _Block_object_dispose(&v18, 8);
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v3);
  }
}

void __100__PGPhotosChallengeMetricEvent__frequentLocationInferenceResultsForLocationByAssetIds_locationType___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = [a3 addressNodes];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __100__PGPhotosChallengeMetricEvent__frequentLocationInferenceResultsForLocationByAssetIds_locationType___block_invoke_3;
  v5[3] = &unk_1E68F09D8;
  long long v6 = *(_OWORD *)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  [v4 enumerateNodesUsingBlock:v5];
}

uint64_t __100__PGPhotosChallengeMetricEvent__frequentLocationInferenceResultsForLocationByAssetIds_locationType___block_invoke_3(uint64_t a1, void *a2, unsigned char *a3)
{
  [a2 coordinate];
  uint64_t result = CLLocationCoordinate2DGetDistanceFrom();
  if (v6 < *MEMORY[0x1E4F8B7E0])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

- (id)_groundTruthForFrequentLocationFromQuestions:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v38 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = v3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v41 objects:v49 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v42;
    uint64_t v8 = *MEMORY[0x1E4F8E920];
    uint64_t v37 = *MEMORY[0x1E4F8E978];
    uint64_t v35 = *MEMORY[0x1E4F8E998];
    uint64_t v36 = *MEMORY[0x1E4F8E980];
    uint64_t v34 = *MEMORY[0x1E4F8E9A8];
    *(void *)&long long v5 = 138412290;
    long long v33 = v5;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v42 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        if (objc_msgSend(v10, "state", v33) == 2)
        {
          uint64_t v11 = [v10 additionalInfo];
          uint64_t v12 = [v11 objectForKeyedSubscript:v8];

          if (v12)
          {
            id v13 = [v10 entityIdentifier];
            double v14 = [(PGPhotosChallengeMetricEvent *)self metricsCache];
            uint64_t v15 = [v14 assetByAssetIdentifier];
            uint64_t v16 = [v15 objectForKeyedSubscript:v13];

            if (v16)
            {
              uint64_t v17 = [v10 additionalInfo];
              uint64_t v18 = [v17 objectForKeyedSubscript:v8];

              uint64_t v19 = [v10 additionalInfo];
              uint64_t v20 = [v19 objectForKeyedSubscript:v37];

              char v21 = [v10 additionalInfo];
              long long v22 = [v21 objectForKeyedSubscript:v36];

              id v23 = objc_alloc(MEMORY[0x1E4F1E5F0]);
              [v20 doubleValue];
              double v25 = v24;
              [v22 doubleValue];
              uint64_t v27 = (void *)[v23 initWithLatitude:v25 longitude:v26];
              uint64_t v45 = v13;
              uint64_t v46 = v27;
              long long v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v46 forKeys:&v45 count:1];
              if (([v18 isEqualToString:v35] & 1) != 0
                || (int v29 = [v18 isEqualToString:v34], v30 = MEMORY[0x1E4F1CC28], v29))
              {
                uint64_t v30 = MEMORY[0x1E4F1CC38];
              }
              [v38 setObject:v30 forKeyedSubscript:v28];
            }
            else
            {
              uint64_t v31 = +[PGLogging sharedLogging];
              uint64_t v18 = [v31 loggingConnection];

              if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)long long buf = v33;
                uint64_t v48 = v13;
                _os_log_error_impl(&dword_1D1805000, v18, OS_LOG_TYPE_ERROR, "Failed to find asset with uuid: '%@'", buf, 0xCu);
              }
            }
          }
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v41 objects:v49 count:16];
    }
    while (v6);
  }

  return v38;
}

- (void)_gatherMetricsForFrequentLocationQuestions:(id)a3 questionMetricType:(unsigned __int16)a4 progressBlock:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = (void (**)(void *, unsigned char *, double))_Block_copy(a5);
  if (!v8)
  {
    double v10 = 0.0;
    goto LABEL_14;
  }
  double Current = CFAbsoluteTimeGetCurrent();
  double v10 = 0.0;
  if (Current >= 0.01)
  {
    double v11 = Current;
    char v22 = 0;
    v8[2](v8, &v22, 0.0);
    if (v22)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 67109378;
        int v24 = 1409;
        __int16 v25 = 2080;
        double v26 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/"
              "MetricEvents/PGPhotosChallengeMetricEvent.m";
        uint64_t v12 = MEMORY[0x1E4F14500];
LABEL_12:
        _os_log_impl(&dword_1D1805000, v12, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        goto LABEL_34;
      }
      goto LABEL_34;
    }
    double v10 = v11;
  }
  double v13 = CFAbsoluteTimeGetCurrent();
  if (v13 - v10 < 0.01)
  {
LABEL_14:
    double v14 = [(PGPhotosChallengeMetricEvent *)self _groundTruthForFrequentLocationFromQuestions:v7];
    uint64_t v15 = [v14 allKeys];
    if (v8)
    {
      double v16 = CFAbsoluteTimeGetCurrent();
      if (v16 - v10 >= 0.01)
      {
        char v22 = 0;
        v8[2](v8, &v22, 0.5);
        if (v22)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = 67109378;
            int v24 = 1417;
            __int16 v25 = 2080;
            double v26 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metr"
                  "ics/MetricEvents/PGPhotosChallengeMetricEvent.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          goto LABEL_33;
        }
        double v10 = v16;
      }
      uint64_t v17 = [(PGPhotosChallengeMetricEvent *)self _frequentLocationInferenceResultsForLocationByAssetIds:v15 locationType:0];
      double v18 = CFAbsoluteTimeGetCurrent();
      if (v18 - v10 >= 0.01)
      {
        char v22 = 0;
        v8[2](v8, &v22, 0.9);
        if (v22)
        {
          if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
LABEL_32:

LABEL_33:
            goto LABEL_34;
          }
          *(_DWORD *)long long buf = 67109378;
          int v24 = 1420;
          __int16 v25 = 2080;
          double v26 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metric"
                "s/MetricEvents/PGPhotosChallengeMetricEvent.m";
          uint64_t v19 = MEMORY[0x1E4F14500];
LABEL_31:
          _os_log_impl(&dword_1D1805000, v19, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          goto LABEL_32;
        }
        double v10 = v18;
      }
    }
    else
    {
      uint64_t v17 = [(PGPhotosChallengeMetricEvent *)self _frequentLocationInferenceResultsForLocationByAssetIds:v15 locationType:0];
    }
    uint64_t v20 = [[PGPrecisionRecallEvaluation alloc] initWithIdentifier:@"frequentlocation" category:@"locationType"];
    [(PGPhotosChallengeMetricEvent *)self setEvaluation:v20];

    char v21 = [(PGPhotosChallengeMetricEvent *)self evaluation];
    [v21 evaluateWithGroundTruthResults:v14 andInferenceResults:v17];

    if (!v8) {
      goto LABEL_32;
    }
    if (CFAbsoluteTimeGetCurrent() - v10 < 0.01) {
      goto LABEL_32;
    }
    char v22 = 0;
    v8[2](v8, &v22, 1.0);
    if (!v22 || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
      goto LABEL_32;
    }
    *(_DWORD *)long long buf = 67109378;
    int v24 = 1424;
    __int16 v25 = 2080;
    double v26 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/Metr"
          "icEvents/PGPhotosChallengeMetricEvent.m";
    uint64_t v19 = MEMORY[0x1E4F14500];
    goto LABEL_31;
  }
  char v22 = 0;
  v8[2](v8, &v22, 0.1);
  if (!v22)
  {
    double v10 = v13;
    goto LABEL_14;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 67109378;
    int v24 = 1413;
    __int16 v25 = 2080;
    double v26 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/Metr"
          "icEvents/PGPhotosChallengeMetricEvent.m";
    uint64_t v12 = MEMORY[0x1E4F14500];
    goto LABEL_12;
  }
LABEL_34:
}

- (id)_holidayInferenceResultsForHolidayNameByAssetIds:(id)a3
{
  id v4 = a3;
  long long v5 = [MEMORY[0x1E4F1CA60] dictionary];
  workingContext = self->_workingContext;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __81__PGPhotosChallengeMetricEvent__holidayInferenceResultsForHolidayNameByAssetIds___block_invoke;
  v12[3] = &unk_1E68F0960;
  void v12[4] = self;
  id v13 = v4;
  id v7 = v5;
  id v14 = v7;
  id v8 = v4;
  [(PGManagerWorkingContext *)workingContext performSynchronousConcurrentGraphReadUsingBlock:v12];
  id v9 = v14;
  id v10 = v7;

  return v10;
}

void __81__PGPhotosChallengeMetricEvent__holidayInferenceResultsForHolidayNameByAssetIds___block_invoke(id *a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v18 = a2;
  uint64_t v20 = [v18 graph];
  v2 = [a1[4] metricsCache];
  id v23 = [v2 momentUUIDByAssetIdentifier];

  uint64_t v19 = [v23 allValues];
  id v3 = +[PGGraphMomentNodeCollection momentNodeAsCollectionByMomentUUIDForArrayOfMomentUUIDs:v19 inGraph:v20];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = a1[5];
  uint64_t v4 = [obj countByEnumeratingWithState:&v27 objects:v34 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v28 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        id v8 = [v7 allKeys];
        id v9 = [v8 firstObject];

        id v10 = [v7 objectForKeyedSubscript:v9];
        if (v10)
        {
          double v11 = [v23 objectForKeyedSubscript:v9];
          uint64_t v12 = [v3 objectForKeyedSubscript:v11];
          if ([v12 count])
          {
            *(void *)&long long buf = 0;
            *((void *)&buf + 1) = &buf;
            uint64_t v32 = 0x2020000000;
            char v33 = 0;
            id v13 = [v12 celebratedHolidayNodes];
            v24[0] = MEMORY[0x1E4F143A8];
            v24[1] = 3221225472;
            v24[2] = __81__PGPhotosChallengeMetricEvent__holidayInferenceResultsForHolidayNameByAssetIds___block_invoke_382;
            v24[3] = &unk_1E68F09B0;
            id v25 = v10;
            p_long long buf = &buf;
            [v13 enumerateNodesUsingBlock:v24];

            id v14 = [NSNumber numberWithBool:*(unsigned __int8 *)(*((void *)&buf + 1) + 24)];
            [a1[6] setObject:v14 forKeyedSubscript:v7];

            _Block_object_dispose(&buf, 8);
          }
          else
          {
            double v16 = +[PGLogging sharedLogging];
            uint64_t v17 = [v16 loggingConnection];

            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              LODWORD(buf) = 138412290;
              *(void *)((char *)&buf + 4) = v9;
              _os_log_error_impl(&dword_1D1805000, v17, OS_LOG_TYPE_ERROR, "Failed to find moment node for asset with local identifier: '%@'", (uint8_t *)&buf, 0xCu);
            }
          }
        }
        else
        {
          uint64_t v15 = +[PGLogging sharedLogging];
          double v11 = [v15 loggingConnection];

          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            LODWORD(buf) = 138412290;
            *(void *)((char *)&buf + 4) = v9;
            _os_log_error_impl(&dword_1D1805000, v11, OS_LOG_TYPE_ERROR, "Holiday Name for asset: %@ is NULL", (uint8_t *)&buf, 0xCu);
          }
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v27 objects:v34 count:16];
    }
    while (v4);
  }
}

void __81__PGPhotosChallengeMetricEvent__holidayInferenceResultsForHolidayNameByAssetIds___block_invoke_382(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v5 = [a2 name];
  int v6 = [v5 isEqualToString:*(void *)(a1 + 32)];

  if (v6)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
}

- (id)_groundTruthForHolidayFromQuestions:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v25;
    *(void *)&long long v7 = 138412290;
    long long v22 = v7;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(obj);
        }
        double v11 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v11, "entityIdentifier", v22);
        id v13 = [(PGPhotosChallengeMetricEvent *)self metricsCache];
        id v14 = [v13 assetByAssetIdentifier];
        uint64_t v15 = [v14 objectForKeyedSubscript:v12];

        if (v15)
        {
          double v16 = [v11 additionalInfo];
          uint64_t v17 = [v16 objectForKeyedSubscript:@"holidayName"];

          long long v28 = v12;
          long long v29 = v17;
          id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
          if ([v11 state] == 2) {
            uint64_t v19 = MEMORY[0x1E4F1CC38];
          }
          else {
            uint64_t v19 = MEMORY[0x1E4F1CC28];
          }
          [v5 setObject:v19 forKeyedSubscript:v18];
        }
        else
        {
          uint64_t v20 = +[PGLogging sharedLogging];
          uint64_t v17 = [v20 loggingConnection];

          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = v22;
            uint64_t v31 = v12;
            _os_log_error_impl(&dword_1D1805000, v17, OS_LOG_TYPE_ERROR, "Failed to find asset with uuid: '%@'", buf, 0xCu);
          }
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v8);
  }

  return v5;
}

- (void)_gatherMetricsForHolidayQuestions:(id)a3 progressBlock:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v7 = (void (**)(void *, unsigned char *, double))_Block_copy(a4);
  double v8 = 0.0;
  if (!v7 || (double v9 = CFAbsoluteTimeGetCurrent(), v9 < 0.01))
  {
LABEL_7:
    id v10 = [(PGPhotosChallengeMetricEvent *)self _groundTruthForHolidayFromQuestions:v6];
    double v11 = [v10 allKeys];
    if (v7)
    {
      double Current = CFAbsoluteTimeGetCurrent();
      if (Current - v8 >= 0.01)
      {
        char v18 = 0;
        v7[2](v7, &v18, 0.5);
        if (v18)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = 67109378;
            int v20 = 1336;
            __int16 v21 = 2080;
            long long v22 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metr"
                  "ics/MetricEvents/PGPhotosChallengeMetricEvent.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          goto LABEL_26;
        }
        double v8 = Current;
      }
      id v13 = [(PGPhotosChallengeMetricEvent *)self _holidayInferenceResultsForHolidayNameByAssetIds:v11];
      double v14 = CFAbsoluteTimeGetCurrent();
      if (v14 - v8 >= 0.01)
      {
        char v18 = 0;
        v7[2](v7, &v18, 0.9);
        if (v18)
        {
          if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
LABEL_25:

LABEL_26:
            goto LABEL_27;
          }
          *(_DWORD *)long long buf = 67109378;
          int v20 = 1339;
          __int16 v21 = 2080;
          long long v22 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metric"
                "s/MetricEvents/PGPhotosChallengeMetricEvent.m";
          uint64_t v15 = MEMORY[0x1E4F14500];
LABEL_24:
          _os_log_impl(&dword_1D1805000, v15, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          goto LABEL_25;
        }
        double v8 = v14;
      }
    }
    else
    {
      id v13 = [(PGPhotosChallengeMetricEvent *)self _holidayInferenceResultsForHolidayNameByAssetIds:v11];
    }
    double v16 = [[PGPrecisionRecallEvaluation alloc] initWithIdentifier:@"holiday" category:@"holiday"];
    [(PGPhotosChallengeMetricEvent *)self setEvaluation:v16];

    uint64_t v17 = [(PGPhotosChallengeMetricEvent *)self evaluation];
    [v17 evaluateWithGroundTruthResults:v10 andInferenceResults:v13];

    if (!v7) {
      goto LABEL_25;
    }
    if (CFAbsoluteTimeGetCurrent() - v8 < 0.01) {
      goto LABEL_25;
    }
    char v18 = 0;
    v7[2](v7, &v18, 1.0);
    if (!v18 || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
      goto LABEL_25;
    }
    *(_DWORD *)long long buf = 67109378;
    int v20 = 1343;
    __int16 v21 = 2080;
    long long v22 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/Metr"
          "icEvents/PGPhotosChallengeMetricEvent.m";
    uint64_t v15 = MEMORY[0x1E4F14500];
    goto LABEL_24;
  }
  char v18 = 0;
  v7[2](v7, &v18, 0.0);
  if (!v18)
  {
    double v8 = v9;
    goto LABEL_7;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 67109378;
    int v20 = 1332;
    __int16 v21 = 2080;
    long long v22 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/Metr"
          "icEvents/PGPhotosChallengeMetricEvent.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_27:
}

- (void)_gatherMetricsForTripKeyQuestions:(id)a3 progressBlock:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v7 = (void (**)(void *, unsigned char *, double))_Block_copy(a4);
  double v8 = 0.0;
  if (v7)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    if (Current >= 0.01)
    {
      unsigned __int8 v38 = 0;
      v7[2](v7, &v38, 0.0);
      if (v38)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 67109378;
          int v41 = 1302;
          __int16 v42 = 2080;
          long long v43 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metric"
                "s/MetricEvents/PGPhotosChallengeMetricEvent.m";
          id v10 = MEMORY[0x1E4F14500];
LABEL_33:
          _os_log_impl(&dword_1D1805000, v10, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          goto LABEL_34;
        }
        goto LABEL_34;
      }
      double v8 = Current;
    }
  }
  unint64_t v11 = [v6 count];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = v6;
  uint64_t v12 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v31 = 0;
    uint64_t v32 = 0;
    double v14 = 1.0 / (double)v11;
    uint64_t v15 = *(void *)v35;
    id v30 = v6;
    double v16 = 0.0;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v35 != v15) {
          objc_enumerationMutation(obj);
        }
        char v18 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        double v16 = v14 + v16;
        if (v7)
        {
          double v19 = CFAbsoluteTimeGetCurrent();
          if (v19 - v8 >= 0.01)
          {
            buf[0] = 0;
            v7[2](v7, buf, v16);
            if (buf[0])
            {
              int v26 = 1;
              double v8 = v19;
              goto LABEL_26;
            }
            double v8 = v19;
          }
        }
        int v20 = [(PGPhotosChallengeMetricEvent *)self metricsCache];
        __int16 v21 = [v20 tripKeyAssetIdentifiers];
        long long v22 = [v18 entityIdentifier];
        int v23 = [v21 containsObject:v22];

        if (v23)
        {
          if ([v18 state] == 2)
          {
            ++v32;
          }
          else
          {
            int v24 = [v18 state];
            uint64_t v25 = v31;
            if (v24 == 3) {
              uint64_t v25 = v31 + 1;
            }
            uint64_t v31 = v25;
          }
        }
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
      if (v13) {
        continue;
      }
      break;
    }
    int v26 = 0;
LABEL_26:
    id v6 = v30;
    uint64_t v28 = v31;
    uint64_t v27 = v32;
  }
  else
  {
    uint64_t v27 = 0;
    uint64_t v28 = 0;
    int v26 = 0;
  }

  long long v29 = [[PGPrecisionRecallEvaluation alloc] initWithIdentifier:@"tripKeyAsset" category:@"tripKeyAsset" truePositives:v27 falsePositives:v28 falseNegatives:0 trueNegatives:0];
  [(PGPhotosChallengeMetricEvent *)self setEvaluation:v29];

  if (v7)
  {
    if (CFAbsoluteTimeGetCurrent() - v8 >= 0.01)
    {
      unsigned __int8 v38 = 0;
      v7[2](v7, &v38, 1.0);
      if (v38 | v26)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 67109378;
          int v41 = 1325;
          __int16 v42 = 2080;
          long long v43 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metric"
                "s/MetricEvents/PGPhotosChallengeMetricEvent.m";
          id v10 = MEMORY[0x1E4F14500];
          goto LABEL_33;
        }
      }
    }
  }
LABEL_34:
}

- (id)_publicEventInferenceResultsForPublicEventIdByAssetIds:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
  workingContext = self->_workingContext;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __87__PGPhotosChallengeMetricEvent__publicEventInferenceResultsForPublicEventIdByAssetIds___block_invoke;
  v12[3] = &unk_1E68F0960;
  void v12[4] = self;
  id v13 = v4;
  id v7 = v5;
  id v14 = v7;
  id v8 = v4;
  [(PGManagerWorkingContext *)workingContext performSynchronousConcurrentGraphReadUsingBlock:v12];
  double v9 = v14;
  id v10 = v7;

  return v10;
}

void __87__PGPhotosChallengeMetricEvent__publicEventInferenceResultsForPublicEventIdByAssetIds___block_invoke(id *a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v18 = a2;
  int v20 = [v18 graph];
  v2 = [a1[4] metricsCache];
  int v23 = [v2 momentUUIDByAssetIdentifier];

  double v19 = [v23 allValues];
  id v3 = +[PGGraphMomentNodeCollection momentNodeAsCollectionByMomentUUIDForArrayOfMomentUUIDs:v19 inGraph:v20];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = a1[5];
  uint64_t v4 = [obj countByEnumeratingWithState:&v27 objects:v34 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v28 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        id v8 = [v7 allKeys];
        double v9 = [v8 firstObject];

        id v10 = [v7 objectForKeyedSubscript:v9];
        if (v10)
        {
          unint64_t v11 = [v23 objectForKeyedSubscript:v9];
          uint64_t v12 = [v3 objectForKeyedSubscript:v11];
          if ([v12 count])
          {
            *(void *)&long long buf = 0;
            *((void *)&buf + 1) = &buf;
            uint64_t v32 = 0x2020000000;
            char v33 = 0;
            id v13 = [v12 publicEventNodes];
            v24[0] = MEMORY[0x1E4F143A8];
            v24[1] = 3221225472;
            v24[2] = __87__PGPhotosChallengeMetricEvent__publicEventInferenceResultsForPublicEventIdByAssetIds___block_invoke_371;
            v24[3] = &unk_1E68F0988;
            id v25 = v10;
            p_long long buf = &buf;
            [v13 enumerateNodesUsingBlock:v24];

            id v14 = [NSNumber numberWithBool:*(unsigned __int8 *)(*((void *)&buf + 1) + 24)];
            [a1[6] setObject:v14 forKeyedSubscript:v7];

            _Block_object_dispose(&buf, 8);
          }
          else
          {
            double v16 = +[PGLogging sharedLogging];
            uint64_t v17 = [v16 loggingConnection];

            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              LODWORD(buf) = 138412290;
              *(void *)((char *)&buf + 4) = v9;
              _os_log_error_impl(&dword_1D1805000, v17, OS_LOG_TYPE_ERROR, "Failed to find moment node for asset with local identifier: '%@'", (uint8_t *)&buf, 0xCu);
            }
          }
        }
        else
        {
          uint64_t v15 = +[PGLogging sharedLogging];
          unint64_t v11 = [v15 loggingConnection];

          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            LODWORD(buf) = 138412290;
            *(void *)((char *)&buf + 4) = v9;
            _os_log_error_impl(&dword_1D1805000, v11, OS_LOG_TYPE_ERROR, "Public Event Identifier for asset: %@ is NULL", (uint8_t *)&buf, 0xCu);
          }
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v27 objects:v34 count:16];
    }
    while (v4);
  }
}

uint64_t __87__PGPhotosChallengeMetricEvent__publicEventInferenceResultsForPublicEventIdByAssetIds___block_invoke_371(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v5 = [a2 muid];
  uint64_t result = [*(id *)(a1 + 32) unsignedIntegerValue];
  if (v5 == result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

- (id)_groundTruthForPublicEventFromQuestions:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v25 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v27;
    *(void *)&long long v6 = 138412290;
    long long v23 = v6;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        unint64_t v11 = objc_msgSend(v10, "entityIdentifier", v23);
        uint64_t v12 = [(PGPhotosChallengeMetricEvent *)self metricsCache];
        id v13 = [v12 assetByAssetIdentifier];
        id v14 = [v13 objectForKeyedSubscript:v11];

        if (v14)
        {
          uint64_t v15 = NSNumber;
          double v16 = [v10 additionalInfo];
          uint64_t v17 = [v16 objectForKeyedSubscript:@"publicEventMUID"];
          id v18 = objc_msgSend(v15, "numberWithUnsignedInteger:", objc_msgSend(v17, "unsignedIntegerValue"));

          long long v30 = v11;
          uint64_t v31 = v18;
          double v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
          if ([v10 state] == 2) {
            uint64_t v20 = MEMORY[0x1E4F1CC38];
          }
          else {
            uint64_t v20 = MEMORY[0x1E4F1CC28];
          }
          [v25 setObject:v20 forKeyedSubscript:v19];
        }
        else
        {
          __int16 v21 = +[PGLogging sharedLogging];
          id v18 = [v21 loggingConnection];

          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = v23;
            char v33 = v11;
            _os_log_error_impl(&dword_1D1805000, v18, OS_LOG_TYPE_ERROR, "Failed to find asset with uuid: '%@'", buf, 0xCu);
          }
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v7);
  }

  return v25;
}

- (void)_gatherMetricsForPublicEventQuestions:(id)a3 progressBlock:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(void *, unsigned char *, double))_Block_copy(a4);
  double v8 = 0.0;
  if (!v7 || (double v9 = CFAbsoluteTimeGetCurrent(), v9 < 0.01))
  {
LABEL_7:
    id v10 = [(PGPhotosChallengeMetricEvent *)self _groundTruthForPublicEventFromQuestions:v6];
    unint64_t v11 = [v10 allKeys];
    if (v7)
    {
      double Current = CFAbsoluteTimeGetCurrent();
      if (Current - v8 >= 0.01)
      {
        char v18 = 0;
        v7[2](v7, &v18, 0.5);
        if (v18)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = 67109378;
            int v20 = 1228;
            __int16 v21 = 2080;
            long long v22 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metr"
                  "ics/MetricEvents/PGPhotosChallengeMetricEvent.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          goto LABEL_26;
        }
        double v8 = Current;
      }
      id v13 = [(PGPhotosChallengeMetricEvent *)self _publicEventInferenceResultsForPublicEventIdByAssetIds:v11];
      double v14 = CFAbsoluteTimeGetCurrent();
      if (v14 - v8 >= 0.01)
      {
        char v18 = 0;
        v7[2](v7, &v18, 0.9);
        if (v18)
        {
          if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
LABEL_25:

LABEL_26:
            goto LABEL_27;
          }
          *(_DWORD *)long long buf = 67109378;
          int v20 = 1231;
          __int16 v21 = 2080;
          long long v22 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metric"
                "s/MetricEvents/PGPhotosChallengeMetricEvent.m";
          uint64_t v15 = MEMORY[0x1E4F14500];
LABEL_24:
          _os_log_impl(&dword_1D1805000, v15, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          goto LABEL_25;
        }
        double v8 = v14;
      }
    }
    else
    {
      id v13 = [(PGPhotosChallengeMetricEvent *)self _publicEventInferenceResultsForPublicEventIdByAssetIds:v11];
    }
    double v16 = [[PGPrecisionRecallEvaluation alloc] initWithIdentifier:@"publicEvent" category:@"publicEvent"];
    [(PGPhotosChallengeMetricEvent *)self setEvaluation:v16];

    uint64_t v17 = [(PGPhotosChallengeMetricEvent *)self evaluation];
    [v17 evaluateWithGroundTruthResults:v10 andInferenceResults:v13];

    if (!v7) {
      goto LABEL_25;
    }
    if (CFAbsoluteTimeGetCurrent() - v8 < 0.01) {
      goto LABEL_25;
    }
    char v18 = 0;
    v7[2](v7, &v18, 1.0);
    if (!v18 || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
      goto LABEL_25;
    }
    *(_DWORD *)long long buf = 67109378;
    int v20 = 1235;
    __int16 v21 = 2080;
    long long v22 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/Metr"
          "icEvents/PGPhotosChallengeMetricEvent.m";
    uint64_t v15 = MEMORY[0x1E4F14500];
    goto LABEL_24;
  }
  char v18 = 0;
  v7[2](v7, &v18, 0.0);
  if (!v18)
  {
    double v8 = v9;
    goto LABEL_7;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 67109378;
    int v20 = 1224;
    __int16 v21 = 2080;
    long long v22 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/Metr"
          "icEvents/PGPhotosChallengeMetricEvent.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_27:
}

- (id)_businessInferenceResultsForBusinessIdByAssetIds:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
  workingContext = self->_workingContext;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __81__PGPhotosChallengeMetricEvent__businessInferenceResultsForBusinessIdByAssetIds___block_invoke;
  v12[3] = &unk_1E68F0960;
  void v12[4] = self;
  id v13 = v4;
  id v7 = v5;
  id v14 = v7;
  id v8 = v4;
  [(PGManagerWorkingContext *)workingContext performSynchronousConcurrentGraphReadUsingBlock:v12];
  double v9 = v14;
  id v10 = v7;

  return v10;
}

void __81__PGPhotosChallengeMetricEvent__businessInferenceResultsForBusinessIdByAssetIds___block_invoke(id *a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v18 = a2;
  int v20 = [v18 graph];
  v2 = [a1[4] metricsCache];
  uint64_t v23 = [v2 momentUUIDByAssetIdentifier];

  double v19 = [v23 allValues];
  id v3 = +[PGGraphMomentNodeCollection momentNodeAsCollectionByMomentUUIDForArrayOfMomentUUIDs:v19 inGraph:v20];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = a1[5];
  uint64_t v4 = [obj countByEnumeratingWithState:&v27 objects:v34 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v28 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        id v8 = [v7 allKeys];
        double v9 = [v8 firstObject];

        id v10 = [v7 objectForKeyedSubscript:v9];
        if (v10)
        {
          unint64_t v11 = [v23 objectForKeyedSubscript:v9];
          uint64_t v12 = [v3 objectForKeyedSubscript:v11];
          if ([v12 count])
          {
            *(void *)&long long buf = 0;
            *((void *)&buf + 1) = &buf;
            uint64_t v32 = 0x2020000000;
            char v33 = 0;
            id v13 = [v12 businessNodes];
            v24[0] = MEMORY[0x1E4F143A8];
            v24[1] = 3221225472;
            v24[2] = __81__PGPhotosChallengeMetricEvent__businessInferenceResultsForBusinessIdByAssetIds___block_invoke_363;
            v24[3] = &unk_1E68F0938;
            id v25 = v10;
            p_long long buf = &buf;
            [v13 enumerateNodesUsingBlock:v24];

            id v14 = [NSNumber numberWithBool:*(unsigned __int8 *)(*((void *)&buf + 1) + 24)];
            [a1[6] setObject:v14 forKeyedSubscript:v7];

            _Block_object_dispose(&buf, 8);
          }
          else
          {
            double v16 = +[PGLogging sharedLogging];
            uint64_t v17 = [v16 loggingConnection];

            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              LODWORD(buf) = 138412290;
              *(void *)((char *)&buf + 4) = v9;
              _os_log_error_impl(&dword_1D1805000, v17, OS_LOG_TYPE_ERROR, "Failed to find moment node for asset with local identifier: '%@'", (uint8_t *)&buf, 0xCu);
            }
          }
        }
        else
        {
          uint64_t v15 = +[PGLogging sharedLogging];
          unint64_t v11 = [v15 loggingConnection];

          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            LODWORD(buf) = 138412290;
            *(void *)((char *)&buf + 4) = v9;
            _os_log_error_impl(&dword_1D1805000, v11, OS_LOG_TYPE_ERROR, "Business Identifier for asset: %@ is NULL", (uint8_t *)&buf, 0xCu);
          }
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v27 objects:v34 count:16];
    }
    while (v4);
  }
}

void __81__PGPhotosChallengeMetricEvent__businessInferenceResultsForBusinessIdByAssetIds___block_invoke_363(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v5 = [a2 UUID];
  int v6 = [v5 isEqualToString:*(void *)(a1 + 32)];

  if (v6)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
}

- (id)_groundTruthForBusinessFromQuestions:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v25;
    *(void *)&long long v7 = 138412290;
    long long v22 = v7;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(obj);
        }
        unint64_t v11 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v11, "entityIdentifier", v22);
        id v13 = [(PGPhotosChallengeMetricEvent *)self metricsCache];
        id v14 = [v13 assetByAssetIdentifier];
        uint64_t v15 = [v14 objectForKeyedSubscript:v12];

        if (v15)
        {
          double v16 = [v11 additionalInfo];
          uint64_t v17 = [v16 objectForKeyedSubscript:@"businessUUID"];

          long long v28 = v12;
          long long v29 = v17;
          id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
          if ([v11 state] == 2) {
            uint64_t v19 = MEMORY[0x1E4F1CC38];
          }
          else {
            uint64_t v19 = MEMORY[0x1E4F1CC28];
          }
          [v5 setObject:v19 forKeyedSubscript:v18];
        }
        else
        {
          int v20 = +[PGLogging sharedLogging];
          uint64_t v17 = [v20 loggingConnection];

          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = v22;
            uint64_t v31 = v12;
            _os_log_error_impl(&dword_1D1805000, v17, OS_LOG_TYPE_ERROR, "Failed to find asset with uuid: '%@'", buf, 0xCu);
          }
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v8);
  }

  return v5;
}

- (void)_gatherMetricsForBusinessQuestions:(id)a3 progressBlock:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v7 = (void (**)(void *, unsigned char *, double))_Block_copy(a4);
  double v8 = 0.0;
  if (!v7 || (double v9 = CFAbsoluteTimeGetCurrent(), v9 < 0.01))
  {
LABEL_7:
    id v10 = [(PGPhotosChallengeMetricEvent *)self _groundTruthForBusinessFromQuestions:v6];
    unint64_t v11 = [v10 allKeys];
    if (v7)
    {
      double Current = CFAbsoluteTimeGetCurrent();
      if (Current - v8 >= 0.01)
      {
        char v18 = 0;
        v7[2](v7, &v18, 0.5);
        if (v18)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = 67109378;
            int v20 = 1150;
            __int16 v21 = 2080;
            long long v22 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metr"
                  "ics/MetricEvents/PGPhotosChallengeMetricEvent.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          goto LABEL_26;
        }
        double v8 = Current;
      }
      id v13 = [(PGPhotosChallengeMetricEvent *)self _businessInferenceResultsForBusinessIdByAssetIds:v11];
      double v14 = CFAbsoluteTimeGetCurrent();
      if (v14 - v8 >= 0.01)
      {
        char v18 = 0;
        v7[2](v7, &v18, 0.9);
        if (v18)
        {
          if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
LABEL_25:

LABEL_26:
            goto LABEL_27;
          }
          *(_DWORD *)long long buf = 67109378;
          int v20 = 1153;
          __int16 v21 = 2080;
          long long v22 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metric"
                "s/MetricEvents/PGPhotosChallengeMetricEvent.m";
          uint64_t v15 = MEMORY[0x1E4F14500];
LABEL_24:
          _os_log_impl(&dword_1D1805000, v15, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          goto LABEL_25;
        }
        double v8 = v14;
      }
    }
    else
    {
      id v13 = [(PGPhotosChallengeMetricEvent *)self _businessInferenceResultsForBusinessIdByAssetIds:v11];
    }
    double v16 = [[PGPrecisionRecallEvaluation alloc] initWithIdentifier:@"business" category:@"business"];
    [(PGPhotosChallengeMetricEvent *)self setEvaluation:v16];

    uint64_t v17 = [(PGPhotosChallengeMetricEvent *)self evaluation];
    [v17 evaluateWithGroundTruthResults:v10 andInferenceResults:v13];

    if (!v7) {
      goto LABEL_25;
    }
    if (CFAbsoluteTimeGetCurrent() - v8 < 0.01) {
      goto LABEL_25;
    }
    char v18 = 0;
    v7[2](v7, &v18, 1.0);
    if (!v18 || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
      goto LABEL_25;
    }
    *(_DWORD *)long long buf = 67109378;
    int v20 = 1157;
    __int16 v21 = 2080;
    long long v22 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/Metr"
          "icEvents/PGPhotosChallengeMetricEvent.m";
    uint64_t v15 = MEMORY[0x1E4F14500];
    goto LABEL_24;
  }
  char v18 = 0;
  v7[2](v7, &v18, 0.0);
  if (!v18)
  {
    double v8 = v9;
    goto LABEL_7;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 67109378;
    int v20 = 1146;
    __int16 v21 = 2080;
    long long v22 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/Metr"
          "icEvents/PGPhotosChallengeMetricEvent.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_27:
}

- (id)_relationshipInferenceResultsForQuestionMetricType:(unsigned __int16)a3 personUUIDs:(id)a4 useGraphInference:(BOOL)a5
{
  id v8 = a4;
  double v9 = [MEMORY[0x1E4F1CA60] dictionary];
  workingContext = self->_workingContext;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __113__PGPhotosChallengeMetricEvent__relationshipInferenceResultsForQuestionMetricType_personUUIDs_useGraphInference___block_invoke;
  v16[3] = &unk_1E68F0910;
  v16[4] = self;
  id v17 = v8;
  unsigned __int16 v19 = a3;
  BOOL v20 = a5;
  id v11 = v9;
  id v18 = v11;
  id v12 = v8;
  [(PGManagerWorkingContext *)workingContext performSynchronousConcurrentGraphReadUsingBlock:v16];
  id v13 = v18;
  id v14 = v11;

  return v14;
}

void __113__PGPhotosChallengeMetricEvent__relationshipInferenceResultsForQuestionMetricType_personUUIDs_useGraphInference___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = [a2 graph];
  id v4 = [*(id *)(a1 + 32) metricsCache];
  uint64_t v5 = [v4 activePersonUUIDByPersonUUID];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v24 = a1;
  id obj = *(id *)(a1 + 40);
  uint64_t v25 = [obj countByEnumeratingWithState:&v26 objects:v32 count:16];
  if (v25)
  {
    uint64_t v7 = *(void *)v27;
    unint64_t v8 = 0x1E4F39000uLL;
    *(void *)&long long v6 = 138412290;
    long long v22 = v6;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v27 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        id v11 = *(void **)(v8 + 496);
        id v12 = objc_msgSend(v5, "objectForKeyedSubscript:", v10, v22);
        id v13 = [v11 localIdentifierWithUUID:v12];

        id v14 = [v3 personNodeForPersonLocalIdentifier:v13];
        if (v14)
        {
          uint64_t v15 = [*(id *)(v24 + 32) _relationshipInferenceResultForPersonNode:v14 questionMetricType:*(unsigned __int16 *)(v24 + 56) useGraphInference:*(unsigned __int8 *)(v24 + 58)];
          double v16 = [NSNumber numberWithBool:v15];
          [*(id *)(v24 + 48) setObject:v16 forKeyedSubscript:v10];
        }
        else
        {
          unint64_t v17 = v8;
          uint64_t v18 = v7;
          unsigned __int16 v19 = v5;
          BOOL v20 = v3;
          __int16 v21 = +[PGLogging sharedLogging];
          double v16 = [v21 loggingConnection];

          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = v22;
            uint64_t v31 = v10;
            _os_log_error_impl(&dword_1D1805000, v16, OS_LOG_TYPE_ERROR, "Failed to find person node for person with UUID: '%@'", buf, 0xCu);
          }
          id v3 = v20;
          uint64_t v5 = v19;
          uint64_t v7 = v18;
          unint64_t v8 = v17;
        }
      }
      uint64_t v25 = [obj countByEnumeratingWithState:&v26 objects:v32 count:16];
    }
    while (v25);
  }
}

- (BOOL)_relatonshipInferenceResultForPersonNode:(id)a3 questionMetricType:(unsigned __int16)a4
{
  int v4 = a4;
  id v5 = a3;
  long long v6 = v5;
  switch(v4)
  {
    case 'N':
      char v7 = [v5 isInferredMemberOfMyFamily];
      goto LABEL_17;
    case 'O':
      char v7 = [v5 isMyInferredFriend];
      goto LABEL_17;
    case 'P':
      char v7 = [v5 isMyInferredCoworker];
      goto LABEL_17;
    case 'Q':
      char v7 = [v5 isMyInferredPartner];
      goto LABEL_17;
    case 'R':
      char v7 = [v5 isMyInferredParent];
      goto LABEL_17;
    case 'S':
      char v7 = [v5 isMyInferredSibling];
      goto LABEL_17;
    case 'T':
      char v7 = [v5 isMyInferredChild];
      goto LABEL_17;
    case 'U':
      double v9 = [v5 graph];
      uint64_t v10 = [v9 meNodeWithFallbackInferredMeNode];
      char v8 = [v6 isEqualToNode:v10];

      break;
    case 'V':
      char v7 = [v5 isMyInferredMother];
      goto LABEL_17;
    case 'W':
      char v7 = [v5 isMyInferredFather];
      goto LABEL_17;
    case 'X':
      char v7 = [v5 isMyInferredSon];
      goto LABEL_17;
    case 'Y':
      char v7 = [v5 isMyInferredDaughter];
      goto LABEL_17;
    case 'Z':
      char v7 = [v5 isMyInferredBrother];
      goto LABEL_17;
    case '[':
      char v7 = [v5 isMyInferredSister];
LABEL_17:
      char v8 = v7;
      break;
    default:
      char v8 = 0;
      break;
  }

  return v8;
}

- (BOOL)_relationshipTagInferenceResultForPersonNode:(id)a3 questionMetricType:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  unint64_t v7 = [(PGPhotosChallengeMetricEvent *)self _relationshipTagFromQuestionMetricType:v4];
  if (v7) {
    char v8 = [v6 isTaggedWithRelationship:v7 withConfidence:0.5];
  }
  else {
    char v8 = 0;
  }

  return v8;
}

- (BOOL)_relationshipInferenceResultForPersonNode:(id)a3 questionMetricType:(unsigned __int16)a4 useGraphInference:(BOOL)a5
{
  if (a5) {
    return [(PGPhotosChallengeMetricEvent *)self _relatonshipInferenceResultForPersonNode:a3 questionMetricType:a4];
  }
  else {
    return [(PGPhotosChallengeMetricEvent *)self _relationshipTagInferenceResultForPersonNode:a3 questionMetricType:a4];
  }
}

- (unint64_t)_relationshipTagFromQuestionMetricType:(unsigned __int16)a3
{
  if ((a3 - 93) > 0xC) {
    return 0;
  }
  else {
    return qword_1D1F50238[(unsigned __int16)(a3 - 93)];
  }
}

- (void)_gatherMetricsForRelationshipQuestions:(id)a3 questionMetricType:(unsigned __int16)a4 progressBlock:(id)a5 useGraphInference:(BOOL)a6
{
  BOOL v40 = a6;
  unsigned int v42 = a4;
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v43 = a3;
  id v41 = a5;
  double v7 = 0.0;
  uint64_t v45 = (void (**)(void *, void *, double))_Block_copy(v41);
  if (!v45 || (double v8 = CFAbsoluteTimeGetCurrent(), v8 < 0.01))
  {
LABEL_7:
    long long v47 = [(id)objc_opt_class() relationshipLabelFromRelationshipQuestionMetricType:v42];
    if (!v47)
    {
      unsigned __int16 v19 = +[PGLogging sharedLogging];
      oslog = [v19 loggingConnection];

      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 67109120;
        HIDWORD(buf) = v42;
        _os_log_error_impl(&dword_1D1805000, oslog, OS_LOG_TYPE_ERROR, "Unhandled Relationship Type: %d", (uint8_t *)&buf, 8u);
      }
      goto LABEL_62;
    }
    oslog = [MEMORY[0x1E4F1CA48] array];
    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    id v9 = v43;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v63 objects:v76 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v64;
      uint64_t v12 = *MEMORY[0x1E4F8EA28];
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v64 != v11) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(void **)(*((void *)&v63 + 1) + 8 * i);
          uint64_t v15 = [v14 additionalInfo];
          double v16 = [v15 objectForKeyedSubscript:v12];
          int v17 = [v16 isEqualToString:v47];

          if (v17)
          {
            if ([v14 entityType] == 4)
            {
              BOOL v18 = [v14 state] == 3;
              goto LABEL_22;
            }
            [oslog addObject:v14];
          }
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v63 objects:v76 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
    BOOL v18 = 0;
LABEL_22:

    if (v45)
    {
      double Current = CFAbsoluteTimeGetCurrent();
      if (Current - v7 >= 0.01)
      {
        LOBYTE(v57) = 0;
        v45[2](v45, &v57, 0.1);
        if ((_BYTE)v57)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            uint64_t buf = 0x3CD04000202;
            LOWORD(v72) = 2080;
            *(void *)((char *)&v72 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/"
                                            "PhotosGraph/Framework/Metrics/MetricEvents/PGPhotosChallengeMetricEvent.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
          }
          goto LABEL_62;
        }
        double v7 = Current;
      }
    }
    uint64_t buf = 0;
    *(void *)&long long v72 = &buf;
    *((void *)&v72 + 1) = 0x3032000000;
    long long v73 = __Block_byref_object_copy__72429;
    long long v74 = __Block_byref_object_dispose__72430;
    id v75 = 0;
    uint64_t v57 = 0;
    long long v58 = &v57;
    uint64_t v59 = 0x3032000000;
    id v60 = __Block_byref_object_copy__72429;
    id v61 = __Block_byref_object_dispose__72430;
    id v62 = 0;
    if (v18)
    {
      id v21 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v22 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      workingContext = self->_workingContext;
      v49[0] = MEMORY[0x1E4F143A8];
      v49[1] = 3221225472;
      v49[2] = __122__PGPhotosChallengeMetricEvent__gatherMetricsForRelationshipQuestions_questionMetricType_progressBlock_useGraphInference___block_invoke;
      v49[3] = &unk_1E68F08E8;
      id v24 = v21;
      id v50 = v24;
      long long v51 = self;
      __int16 v55 = v42;
      BOOL v56 = v40;
      id v25 = v22;
      id v52 = v25;
      p_uint64_t buf = &buf;
      long long v54 = &v57;
      [(PGManagerWorkingContext *)workingContext performSynchronousConcurrentGraphReadUsingBlock:v49];
      if (v45 && (double v26 = CFAbsoluteTimeGetCurrent(), v26 - v7 >= 0.01))
      {
        unsigned __int8 v48 = 0;
        ((void (**)(void *, unsigned __int8 *, double))v45)[2](v45, &v48, 0.5);
        if (v48)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            int v67 = 67109378;
            int v68 = 998;
            __int16 v69 = 2080;
            id v70 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metr"
                  "ics/MetricEvents/PGPhotosChallengeMetricEvent.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&v67, 0x12u);
          }
          char v28 = 0;
          int v27 = 1;
        }
        else
        {
          int v27 = 0;
          char v28 = 1;
        }
      }
      else
      {
        int v27 = 0;
        char v28 = 1;
        double v26 = v7;
      }

      if ((v28 & 1) == 0) {
        goto LABEL_61;
      }
      goto LABEL_52;
    }
    uint64_t v29 = [(PGPhotosChallengeMetricEvent *)self _groundTruthByPersonUUIDFromQuestions:oslog];
    long long v30 = *(void **)(v72 + 40);
    *(void *)(v72 + 40) = v29;

    uint64_t v31 = [*(id *)(v72 + 40) allKeys];
    if (v45)
    {
      double v32 = CFAbsoluteTimeGetCurrent();
      if (v32 - v7 >= 0.01)
      {
        unsigned __int8 v48 = 0;
        ((void (**)(void *, unsigned __int8 *, double))v45)[2](v45, &v48, 0.5);
        if (v48)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            int v67 = 67109378;
            int v68 = 1003;
            __int16 v69 = 2080;
            id v70 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metr"
                  "ics/MetricEvents/PGPhotosChallengeMetricEvent.m";
            uint64_t v33 = MEMORY[0x1E4F14500];
LABEL_59:
            _os_log_impl(&dword_1D1805000, v33, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&v67, 0x12u);
            goto LABEL_60;
          }
          goto LABEL_60;
        }
        double v7 = v32;
      }
    }
    uint64_t v34 = [(PGPhotosChallengeMetricEvent *)self _relationshipInferenceResultsForQuestionMetricType:v42 personUUIDs:v31 useGraphInference:v40];
    uint64_t v35 = (void *)v58[5];
    v58[5] = v34;

    if (v45)
    {
      double v36 = CFAbsoluteTimeGetCurrent();
      if (v36 - v7 >= 0.01)
      {
        unsigned __int8 v48 = 0;
        ((void (**)(void *, unsigned __int8 *, double))v45)[2](v45, &v48, 0.9);
        if (v48)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            int v67 = 67109378;
            int v68 = 1007;
            __int16 v69 = 2080;
            id v70 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metr"
                  "ics/MetricEvents/PGPhotosChallengeMetricEvent.m";
            uint64_t v33 = MEMORY[0x1E4F14500];
            goto LABEL_59;
          }
LABEL_60:

LABEL_61:
          _Block_object_dispose(&v57, 8);

          _Block_object_dispose(&buf, 8);
LABEL_62:

          goto LABEL_63;
        }
        double v7 = v36;
      }
    }

    int v27 = 0;
    double v26 = v7;
LABEL_52:
    long long v37 = @"relationshipTag";
    if (v40) {
      long long v37 = @"relationship";
    }
    uint64_t v31 = v37;
    unsigned __int8 v38 = [[PGPrecisionRecallEvaluation alloc] initWithIdentifier:v31 category:v47];
    [(PGPhotosChallengeMetricEvent *)self setEvaluation:v38];

    long long v39 = [(PGPhotosChallengeMetricEvent *)self evaluation];
    [v39 evaluateWithGroundTruthResults:*(void *)(v72 + 40) andInferenceResults:v58[5]];

    if (!v45) {
      goto LABEL_60;
    }
    if (CFAbsoluteTimeGetCurrent() - v26 < 0.01) {
      goto LABEL_60;
    }
    unsigned __int8 v48 = 0;
    ((void (**)(void *, unsigned __int8 *, double))v45)[2](v45, &v48, 1.0);
    if (!(v48 | v27) || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
      goto LABEL_60;
    }
    int v67 = 67109378;
    int v68 = 1013;
    __int16 v69 = 2080;
    id v70 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/Metr"
          "icEvents/PGPhotosChallengeMetricEvent.m";
    uint64_t v33 = MEMORY[0x1E4F14500];
    goto LABEL_59;
  }
  LOBYTE(v57) = 0;
  v45[2](v45, &v57, 0.0);
  if (!(_BYTE)v57)
  {
    double v7 = v8;
    goto LABEL_7;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    uint64_t buf = 0x3B604000202;
    LOWORD(v72) = 2080;
    *(void *)((char *)&v72 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Metrics/MetricEvents/PGPhotosChallengeMetricEvent.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
  }
LABEL_63:
}

void __122__PGPhotosChallengeMetricEvent__gatherMetricsForRelationshipQuestions_questionMetricType_progressBlock_useGraphInference___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 graph];
  uint64_t v4 = +[PGGraphPersonNodeCollection personNodesExcludingMeInGraph:v3];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __122__PGPhotosChallengeMetricEvent__gatherMetricsForRelationshipQuestions_questionMetricType_progressBlock_useGraphInference___block_invoke_2;
  v8[3] = &unk_1E68F08C0;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  double v7 = *(void **)(a1 + 48);
  id v9 = v5;
  uint64_t v10 = v6;
  __int16 v12 = *(_WORD *)(a1 + 72);
  char v13 = *(unsigned char *)(a1 + 74);
  id v11 = v7;
  [v4 enumerateNodesUsingBlock:v8];
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), *(id *)(a1 + 32));
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), *(id *)(a1 + 48));
}

void __122__PGPhotosChallengeMetricEvent__gatherMetricsForRelationshipQuestions_questionMetricType_progressBlock_useGraphInference___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x1E4F391F0];
  id v9 = v3;
  id v5 = [v3 localIdentifier];
  uint64_t v6 = [v4 uuidFromLocalIdentifier:v5];

  if (v6)
  {
    [*(id *)(a1 + 32) setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:v6];
    uint64_t v7 = [*(id *)(a1 + 40) _relationshipInferenceResultForPersonNode:v9 questionMetricType:*(unsigned __int16 *)(a1 + 56) useGraphInference:*(unsigned __int8 *)(a1 + 58)];
    double v8 = [NSNumber numberWithBool:v7];
    [*(id *)(a1 + 48) setObject:v8 forKeyedSubscript:v6];
  }
}

- (id)_personActivityMeaningInferenceResultsForPersonActivityMeaningLabel:(id)a3 assetIds:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [MEMORY[0x1E4F1CA60] dictionary];
  workingContext = self->_workingContext;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __109__PGPhotosChallengeMetricEvent__personActivityMeaningInferenceResultsForPersonActivityMeaningLabel_assetIds___block_invoke;
  v16[3] = &unk_1E68F0898;
  v16[4] = self;
  id v17 = v7;
  id v18 = v6;
  id v10 = v8;
  id v19 = v10;
  id v11 = v6;
  id v12 = v7;
  [(PGManagerWorkingContext *)workingContext performSynchronousConcurrentGraphReadUsingBlock:v16];
  char v13 = v19;
  id v14 = v10;

  return v14;
}

void __109__PGPhotosChallengeMetricEvent__personActivityMeaningInferenceResultsForPersonActivityMeaningLabel_assetIds___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a2 graph];
  uint64_t v4 = [*(id *)(a1 + 32) metricsCache];
  id v5 = [v4 momentUUIDByAssetIdentifier];

  char v28 = v5;
  id v6 = [v5 allValues];
  id v24 = (void *)v3;
  id v7 = +[PGGraphMomentNodeCollection momentNodesForArrayOfUUIDs:v6 inGraph:v3];

  uint64_t v23 = v7;
  [v7 momentNodeByMomentUUID];
  v27 = uint64_t v26 = a1;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = *(id *)(a1 + 40);
  uint64_t v8 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v30 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        char v13 = [v28 objectForKeyedSubscript:v12];
        id v14 = [v27 objectForKeyedSubscript:v13];
        uint64_t v15 = v14;
        if (v14)
        {
          double v16 = [v14 collection];
          id v17 = +[PGGraphMomentNode personActivityMeaningOfMoment];
          id v18 = +[MANodeCollection nodesRelatedToNodes:v16 withRelation:v17];
          id v19 = [v18 personActivityMeaningLabels];

          uint64_t v20 = [v19 containsObject:*(void *)(v26 + 48)];
          id v21 = [NSNumber numberWithBool:v20];
          [*(id *)(v26 + 56) setObject:v21 forKeyedSubscript:v12];
        }
        else
        {
          id v22 = +[PGLogging sharedLogging];
          id v19 = [v22 loggingConnection];

          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)uint64_t buf = 138412290;
            uint64_t v34 = v12;
            _os_log_error_impl(&dword_1D1805000, v19, OS_LOG_TYPE_ERROR, "Failed to find moment node for asset with local identifier: '%@'", buf, 0xCu);
          }
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v9);
  }
}

- (void)_gatherMetricsForPersonActivityMeaningQuestions:(id)a3 questionMetricType:(unsigned __int16)a4 progressBlock:(id)a5
{
  uint64_t v6 = a4;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = (void (**)(void *, unsigned char *, double))_Block_copy(a5);
  double v10 = 0.0;
  if (!v9 || (double v11 = CFAbsoluteTimeGetCurrent(), v11 < 0.01))
  {
LABEL_7:
    uint64_t v12 = [(id)objc_opt_class() personActivityMeaningLabelFromMeaningQuestionMetricType:v6];
    if (!v12)
    {
      id v24 = +[PGLogging sharedLogging];
      id v25 = [v24 loggingConnection];

      os_log_t log = v25;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)uint64_t buf = 67109120;
        int v45 = v6;
        _os_log_error_impl(&dword_1D1805000, v25, OS_LOG_TYPE_ERROR, "Unhandled Person Activity Meaning Type: %d", buf, 8u);
      }
      goto LABEL_47;
    }
    uint64_t v34 = self;
    uint64_t v35 = v9;
    [MEMORY[0x1E4F1CA48] array];
    id v36 = v8;
    os_log_t log = (os_log_t)objc_claimAutoreleasedReturnValue();
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v13 = v8;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v38 objects:v43 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v39 != v16) {
            objc_enumerationMutation(v13);
          }
          id v18 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          id v19 = [v18 additionalInfo];
          uint64_t v20 = [v19 objectForKeyedSubscript:@"personActivityMeaningLabel"];
          int v21 = [v20 isEqualToString:v12];

          if (v21) {
            [log addObject:v18];
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v38 objects:v43 count:16];
      }
      while (v15);
    }

    uint64_t v9 = v35;
    if (v35)
    {
      double Current = CFAbsoluteTimeGetCurrent();
      uint64_t v23 = v34;
      if (Current - v10 >= 0.01)
      {
        char v42 = 0;
        v35[2](v35, &v42, 0.1);
        if (v42)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)uint64_t buf = 67109378;
            int v45 = 902;
            __int16 v46 = 2080;
            long long v47 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metr"
                  "ics/MetricEvents/PGPhotosChallengeMetricEvent.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          id v8 = v36;
          goto LABEL_47;
        }
        double v10 = Current;
      }
    }
    else
    {
      uint64_t v23 = v34;
    }
    uint64_t v26 = [(PGPhotosChallengeMetricEvent *)v23 _groundTruthByAssetIdentifiersFromQuestions:log];
    int v27 = [v26 allKeys];
    if (v35)
    {
      double v28 = CFAbsoluteTimeGetCurrent();
      id v8 = v36;
      if (v28 - v10 >= 0.01)
      {
        char v42 = 0;
        v35[2](v35, &v42, 0.5);
        if (v42)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)uint64_t buf = 67109378;
            int v45 = 906;
            __int16 v46 = 2080;
            long long v47 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metr"
                  "ics/MetricEvents/PGPhotosChallengeMetricEvent.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          goto LABEL_46;
        }
        double v10 = v28;
      }
      long long v29 = [(PGPhotosChallengeMetricEvent *)v23 _personActivityMeaningInferenceResultsForPersonActivityMeaningLabel:v12 assetIds:v27];
      double v30 = CFAbsoluteTimeGetCurrent();
      if (v30 - v10 >= 0.01)
      {
        char v42 = 0;
        v35[2](v35, &v42, 0.9);
        if (v42)
        {
          if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
LABEL_45:

LABEL_46:
LABEL_47:

            goto LABEL_48;
          }
          *(_DWORD *)uint64_t buf = 67109378;
          int v45 = 909;
          __int16 v46 = 2080;
          long long v47 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metric"
                "s/MetricEvents/PGPhotosChallengeMetricEvent.m";
          long long v31 = MEMORY[0x1E4F14500];
LABEL_44:
          _os_log_impl(&dword_1D1805000, v31, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          goto LABEL_45;
        }
        double v10 = v30;
      }
    }
    else
    {
      long long v29 = [(PGPhotosChallengeMetricEvent *)v23 _personActivityMeaningInferenceResultsForPersonActivityMeaningLabel:v12 assetIds:v27];
      id v8 = v36;
    }
    long long v32 = [[PGPrecisionRecallEvaluation alloc] initWithIdentifier:@"personActivityMeaning" category:v12];
    [(PGPhotosChallengeMetricEvent *)v23 setEvaluation:v32];

    uint64_t v33 = [(PGPhotosChallengeMetricEvent *)v23 evaluation];
    [v33 evaluateWithGroundTruthResults:v26 andInferenceResults:v29];

    if (!v35) {
      goto LABEL_45;
    }
    if (CFAbsoluteTimeGetCurrent() - v10 < 0.01) {
      goto LABEL_45;
    }
    char v42 = 0;
    v35[2](v35, &v42, 1.0);
    if (!v42 || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
      goto LABEL_45;
    }
    *(_DWORD *)uint64_t buf = 67109378;
    int v45 = 913;
    __int16 v46 = 2080;
    long long v47 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/Metr"
          "icEvents/PGPhotosChallengeMetricEvent.m";
    long long v31 = MEMORY[0x1E4F14500];
    goto LABEL_44;
  }
  char v42 = 0;
  v9[2](v9, &v42, 0.0);
  if (!v42)
  {
    double v10 = v11;
    goto LABEL_7;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)uint64_t buf = 67109378;
    int v45 = 885;
    __int16 v46 = 2080;
    long long v47 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/Metr"
          "icEvents/PGPhotosChallengeMetricEvent.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_48:
}

- (id)_meaningInferenceResultsForMeaningLabel:(id)a3 assetIds:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F1CA60] dictionary];
  workingContext = self->_workingContext;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __81__PGPhotosChallengeMetricEvent__meaningInferenceResultsForMeaningLabel_assetIds___block_invoke;
  v16[3] = &unk_1E68F0898;
  v16[4] = self;
  id v17 = v7;
  id v18 = v6;
  id v10 = v8;
  id v19 = v10;
  id v11 = v6;
  id v12 = v7;
  [(PGManagerWorkingContext *)workingContext performSynchronousConcurrentGraphReadUsingBlock:v16];
  id v13 = v19;
  id v14 = v10;

  return v14;
}

void __81__PGPhotosChallengeMetricEvent__meaningInferenceResultsForMeaningLabel_assetIds___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a2 graph];
  uint64_t v4 = [*(id *)(a1 + 32) metricsCache];
  id v5 = [v4 momentUUIDByAssetIdentifier];

  id v24 = v5;
  id v6 = [v5 allValues];
  id v22 = (void *)v3;
  id v7 = +[PGGraphMomentNodeCollection momentNodesForArrayOfUUIDs:v6 inGraph:v3];

  int v21 = v7;
  id v8 = [v7 momentNodeByMomentUUID];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = *(id *)(a1 + 40);
  uint64_t v9 = [obj countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        id v14 = [v24 objectForKeyedSubscript:v13];
        uint64_t v15 = [v8 objectForKeyedSubscript:v14];
        uint64_t v16 = v15;
        if (v15)
        {
          id v17 = [v15 meaningLabelsIncludingParents];
          uint64_t v18 = [v17 containsObject:*(void *)(a1 + 48)];
          id v19 = [NSNumber numberWithBool:v18];
          [*(id *)(a1 + 56) setObject:v19 forKeyedSubscript:v13];
        }
        else
        {
          uint64_t v20 = +[PGLogging sharedLogging];
          id v17 = [v20 loggingConnection];

          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)uint64_t buf = 138412290;
            uint64_t v30 = v13;
            _os_log_error_impl(&dword_1D1805000, v17, OS_LOG_TYPE_ERROR, "Failed to find moment node for asset with local identifier: '%@'", buf, 0xCu);
          }
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v25 objects:v31 count:16];
    }
    while (v10);
  }
}

- (void)_gatherMetricsForMeaningQuestions:(id)a3 questionMetricType:(unsigned __int16)a4 progressBlock:(id)a5
{
  uint64_t v6 = a4;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = (void (**)(void *, unsigned char *, double))_Block_copy(a5);
  double v10 = 0.0;
  if (!v9 || (double v11 = CFAbsoluteTimeGetCurrent(), v11 < 0.01))
  {
LABEL_7:
    id v12 = [(id)objc_opt_class() meaningLabelFromMeaningQuestionMetricType:v6];
    if (!v12)
    {
      long long v25 = +[PGLogging sharedLogging];
      long long v26 = [v25 loggingConnection];

      os_log_t log = v26;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)uint64_t buf = 67109120;
        int v46 = v6;
        _os_log_error_impl(&dword_1D1805000, v26, OS_LOG_TYPE_ERROR, "Unhandled Meaning Type: %d", buf, 8u);
      }
      goto LABEL_47;
    }
    uint64_t v35 = self;
    id v36 = v9;
    [MEMORY[0x1E4F1CA48] array];
    id v37 = v8;
    os_log_t log = (os_log_t)objc_claimAutoreleasedReturnValue();
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v13 = v8;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v39 objects:v44 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v40;
      uint64_t v17 = *MEMORY[0x1E4F8E9B0];
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v40 != v16) {
            objc_enumerationMutation(v13);
          }
          id v19 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          uint64_t v20 = [v19 additionalInfo];
          int v21 = [v20 objectForKeyedSubscript:v17];
          int v22 = [v21 isEqualToString:v12];

          if (v22) {
            [log addObject:v19];
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v39 objects:v44 count:16];
      }
      while (v15);
    }

    uint64_t v9 = v36;
    if (v36)
    {
      double Current = CFAbsoluteTimeGetCurrent();
      id v24 = v35;
      if (Current - v10 >= 0.01)
      {
        char v43 = 0;
        v36[2](v36, &v43, 0.1);
        if (v43)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)uint64_t buf = 67109378;
            int v46 = 839;
            __int16 v47 = 2080;
            uint64_t v48 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metr"
                  "ics/MetricEvents/PGPhotosChallengeMetricEvent.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          id v8 = v37;
          goto LABEL_47;
        }
        double v10 = Current;
      }
    }
    else
    {
      id v24 = v35;
    }
    long long v27 = [(PGPhotosChallengeMetricEvent *)v24 _groundTruthByAssetIdentifiersFromQuestions:log];
    long long v28 = [v27 allKeys];
    if (v36)
    {
      double v29 = CFAbsoluteTimeGetCurrent();
      id v8 = v37;
      if (v29 - v10 >= 0.01)
      {
        char v43 = 0;
        v36[2](v36, &v43, 0.5);
        if (v43)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)uint64_t buf = 67109378;
            int v46 = 843;
            __int16 v47 = 2080;
            uint64_t v48 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metr"
                  "ics/MetricEvents/PGPhotosChallengeMetricEvent.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          goto LABEL_46;
        }
        double v10 = v29;
      }
      uint64_t v30 = [(PGPhotosChallengeMetricEvent *)v24 _meaningInferenceResultsForMeaningLabel:v12 assetIds:v28];
      double v31 = CFAbsoluteTimeGetCurrent();
      if (v31 - v10 >= 0.01)
      {
        char v43 = 0;
        v36[2](v36, &v43, 0.9);
        if (v43)
        {
          if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
LABEL_45:

LABEL_46:
LABEL_47:

            goto LABEL_48;
          }
          *(_DWORD *)uint64_t buf = 67109378;
          int v46 = 846;
          __int16 v47 = 2080;
          uint64_t v48 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metric"
                "s/MetricEvents/PGPhotosChallengeMetricEvent.m";
          uint64_t v32 = MEMORY[0x1E4F14500];
LABEL_44:
          _os_log_impl(&dword_1D1805000, v32, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          goto LABEL_45;
        }
        double v10 = v31;
      }
    }
    else
    {
      uint64_t v30 = [(PGPhotosChallengeMetricEvent *)v24 _meaningInferenceResultsForMeaningLabel:v12 assetIds:v28];
      id v8 = v37;
    }
    uint64_t v33 = [[PGPrecisionRecallEvaluation alloc] initWithIdentifier:@"meaning" category:v12];
    [(PGPhotosChallengeMetricEvent *)v24 setEvaluation:v33];

    uint64_t v34 = [(PGPhotosChallengeMetricEvent *)v24 evaluation];
    [v34 evaluateWithGroundTruthResults:v27 andInferenceResults:v30];

    if (!v36) {
      goto LABEL_45;
    }
    if (CFAbsoluteTimeGetCurrent() - v10 < 0.01) {
      goto LABEL_45;
    }
    char v43 = 0;
    v36[2](v36, &v43, 1.0);
    if (!v43 || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
      goto LABEL_45;
    }
    *(_DWORD *)uint64_t buf = 67109378;
    int v46 = 850;
    __int16 v47 = 2080;
    uint64_t v48 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/Metr"
          "icEvents/PGPhotosChallengeMetricEvent.m";
    uint64_t v32 = MEMORY[0x1E4F14500];
    goto LABEL_44;
  }
  char v43 = 0;
  v9[2](v9, &v43, 0.0);
  if (!v43)
  {
    double v10 = v11;
    goto LABEL_7;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)uint64_t buf = 67109378;
    int v46 = 822;
    __int16 v47 = 2080;
    uint64_t v48 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/Metr"
          "icEvents/PGPhotosChallengeMetricEvent.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_48:
}

- (id)_meaningLabelsOfMomentNode:(id)a3 forMeaningLabel:(id)a4 isEventLabelingMetricEvent:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if (!v5)
  {
    if (!+[PGEventLabelingConfiguration isEventLabelingEnabled](PGEventLabelingConfiguration, "isEventLabelingEnabled")|| !+[PGEventLabelingConfiguration usePrimaryMeaningDomainForEventLabelingMeanings])
    {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  if ([(PGEventLabelingConfiguration *)self->_eventLabelingConfiguration useEventLabelingToInferWithMeaningLabel:v9])
  {
    if (+[PGEventLabelingConfiguration usePrimaryMeaningDomainForEventLabelingMeanings])
    {
LABEL_8:
      uint64_t v10 = [v8 meaningLabelsIncludingParents];
      goto LABEL_9;
    }
LABEL_7:
    uint64_t v10 = [v8 alternativeMeaningLabelsIncludingParents];
LABEL_9:
    double v11 = (void *)v10;
    goto LABEL_11;
  }
  double v11 = 0;
LABEL_11:

  return v11;
}

- (id)_meaningInferenceResultsForMeaningLabel:(id)a3 momentUUIDs:(id)a4 isEventLabelingMetricEvent:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionary];
  if (!v5
    || +[PGEventLabelingConfiguration isEventLabelingEnabled])
  {
    workingContext = self->_workingContext;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __111__PGPhotosChallengeMetricEvent__meaningInferenceResultsForMeaningLabel_momentUUIDs_isEventLabelingMetricEvent___block_invoke;
    v16[3] = &unk_1E68F0870;
    id v17 = v9;
    uint64_t v18 = self;
    id v19 = v8;
    BOOL v21 = v5;
    id v12 = v10;
    id v20 = v12;
    [(PGManagerWorkingContext *)workingContext performSynchronousConcurrentGraphReadUsingBlock:v16];
    id v13 = v20;
    id v14 = v12;
  }
  return v10;
}

void __111__PGPhotosChallengeMetricEvent__meaningInferenceResultsForMeaningLabel_momentUUIDs_isEventLabelingMetricEvent___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v17 = a2;
  uint64_t v16 = [v17 graph];
  uint64_t v15 = +[PGGraphMomentNodeCollection momentNodesForArrayOfUUIDs:inGraph:](PGGraphMomentNodeCollection, "momentNodesForArrayOfUUIDs:inGraph:", *(void *)(a1 + 32));
  uint64_t v3 = [v15 momentNodeByMomentUUID];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v4 = [obj countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v20;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v19 + 1) + 8 * v7);
        id v9 = (void *)MEMORY[0x1D25FED50]();
        uint64_t v10 = [v3 objectForKeyedSubscript:v8];
        if (v10)
        {
          double v11 = [*(id *)(a1 + 40) _meaningLabelsOfMomentNode:v10 forMeaningLabel:*(void *)(a1 + 48) isEventLabelingMetricEvent:*(unsigned __int8 *)(a1 + 64)];
          uint64_t v12 = [v11 containsObject:*(void *)(a1 + 48)];
          if ([*(id *)(a1 + 48) isEqualToString:PGExhaustiveMomentLabellingNoneOfTheseAnswerString])uint64_t v12 = -[NSObject count](v11, "count") == 0; {
          id v13 = [NSNumber numberWithBool:v12];
          }
          [*(id *)(a1 + 56) setObject:v13 forKeyedSubscript:v8];
        }
        else
        {
          id v14 = +[PGLogging sharedLogging];
          double v11 = [v14 loggingConnection];

          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)uint64_t buf = 138412290;
            uint64_t v24 = v8;
            _os_log_error_impl(&dword_1D1805000, v11, OS_LOG_TYPE_ERROR, "Failed to find moment node for moment with uuid: '%@'", buf, 0xCu);
          }
        }

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [obj countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v5);
  }
}

- (void)_gatherMetricsForExhaustiveMomentLabelingQuestions:(id)a3 questionMetricType:(unsigned __int16)a4 isEventLabelingMetricEvent:(BOOL)a5 progressBlock:(id)a6
{
  BOOL v7 = a5;
  uint64_t v8 = a4;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  double v11 = (void (**)(void *, unsigned char *, double))_Block_copy(a6);
  double v12 = 0.0;
  if (!v11 || (double v13 = CFAbsoluteTimeGetCurrent(), v13 < 0.01))
  {
LABEL_7:
    id v14 = [(id)objc_opt_class() meaningLabelFromMeaningQuestionMetricType:v8];
    if (!v14)
    {
      long long v19 = +[PGLogging sharedLogging];
      uint64_t v16 = [v19 loggingConnection];

      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)uint64_t buf = 67109120;
        int v29 = v8;
        _os_log_error_impl(&dword_1D1805000, v16, OS_LOG_TYPE_ERROR, "Unhandled Meaning Type: %d", buf, 8u);
      }
      goto LABEL_32;
    }
    uint64_t v15 = [(PGPhotosChallengeMetricEvent *)self metricsCache];
    uint64_t v16 = [(PGPhotosChallengeMetricEvent *)self groundTruthByMomentUUIDFromExhaustiveMomentLabelingQuestions:v10 meaningLabel:v14 withMetricsCache:v15];

    id v17 = [v16 allKeys];
    if (v11)
    {
      double Current = CFAbsoluteTimeGetCurrent();
      if (Current - v12 >= 0.01)
      {
        char v27 = 0;
        v11[2](v11, &v27, 0.5);
        if (v27)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)uint64_t buf = 67109378;
            int v29 = 729;
            __int16 v30 = 2080;
            double v31 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metr"
                  "ics/MetricEvents/PGPhotosChallengeMetricEvent.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          goto LABEL_31;
        }
        double v12 = Current;
      }
      long long v20 = [(PGPhotosChallengeMetricEvent *)self _meaningInferenceResultsForMeaningLabel:v14 momentUUIDs:v17 isEventLabelingMetricEvent:v7];
      double v21 = CFAbsoluteTimeGetCurrent();
      if (v21 - v12 >= 0.01)
      {
        char v27 = 0;
        v11[2](v11, &v27, 0.9);
        if (v27)
        {
          if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
LABEL_30:

LABEL_31:
LABEL_32:

            goto LABEL_33;
          }
          *(_DWORD *)uint64_t buf = 67109378;
          int v29 = 732;
          __int16 v30 = 2080;
          double v31 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metric"
                "s/MetricEvents/PGPhotosChallengeMetricEvent.m";
          long long v22 = MEMORY[0x1E4F14500];
LABEL_29:
          _os_log_impl(&dword_1D1805000, v22, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          goto LABEL_30;
        }
        double v12 = v21;
      }
    }
    else
    {
      long long v20 = [(PGPhotosChallengeMetricEvent *)self _meaningInferenceResultsForMeaningLabel:v14 momentUUIDs:v17 isEventLabelingMetricEvent:v7];
    }
    uint64_t v23 = @"exhaustiveMomentLabeling";
    if (v7) {
      uint64_t v23 = @"exhaustiveMomentLabelingForEventLabeling";
    }
    uint64_t v24 = v23;
    long long v25 = [[PGPrecisionRecallEvaluation alloc] initWithIdentifier:v24 category:v14];

    [(PGPhotosChallengeMetricEvent *)self setEvaluation:v25];
    uint64_t v26 = [(PGPhotosChallengeMetricEvent *)self evaluation];
    [v26 evaluateWithGroundTruthResults:v16 andInferenceResults:v20];

    if (!v11) {
      goto LABEL_30;
    }
    if (CFAbsoluteTimeGetCurrent() - v12 < 0.01) {
      goto LABEL_30;
    }
    char v27 = 0;
    v11[2](v11, &v27, 1.0);
    if (!v27 || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
      goto LABEL_30;
    }
    *(_DWORD *)uint64_t buf = 67109378;
    int v29 = 737;
    __int16 v30 = 2080;
    double v31 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/Metr"
          "icEvents/PGPhotosChallengeMetricEvent.m";
    long long v22 = MEMORY[0x1E4F14500];
    goto LABEL_29;
  }
  char v27 = 0;
  v11[2](v11, &v27, 0.0);
  if (!v27)
  {
    double v12 = v13;
    goto LABEL_7;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)uint64_t buf = 67109378;
    int v29 = 719;
    __int16 v30 = 2080;
    double v31 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metrics/Metr"
          "icEvents/PGPhotosChallengeMetricEvent.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_33:
}

- (void)gatherMetricsWithProgressBlock:(id)a3
{
  id v9 = a3;
  uint64_t v4 = [(PGPhotosChallengeMetricEventFetchHelper *)self->_metricsCache questionsForQuestionMetricType:self->_questionMetricType];
  if ([v4 count])
  {
    switch(self->_questionMetricType)
    {
      case 1u:
      case 2u:
      case 3u:
      case 4u:
      case 5u:
      case 6u:
      case 7u:
      case 8u:
      case 9u:
      case 0xAu:
      case 0xBu:
      case 0xCu:
      case 0xDu:
      case 0xEu:
      case 0xFu:
      case 0x10u:
      case 0x11u:
      case 0x12u:
      case 0x13u:
      case 0x14u:
      case 0x15u:
      case 0x16u:
      case 0x17u:
      case 0x18u:
      case 0x19u:
        -[PGPhotosChallengeMetricEvent _gatherMetricsForMeaningQuestions:questionMetricType:progressBlock:](self, "_gatherMetricsForMeaningQuestions:questionMetricType:progressBlock:", v4);
        break;
      case 0x1Au:
      case 0x1Bu:
      case 0x1Cu:
      case 0x1Du:
      case 0x1Eu:
      case 0x1Fu:
      case 0x20u:
      case 0x21u:
      case 0x22u:
      case 0x23u:
      case 0x24u:
      case 0x25u:
      case 0x26u:
      case 0x27u:
      case 0x28u:
      case 0x29u:
      case 0x2Au:
      case 0x2Bu:
      case 0x2Cu:
      case 0x2Du:
      case 0x2Eu:
      case 0x2Fu:
      case 0x30u:
      case 0x31u:
      case 0x32u:
      case 0x33u:
        uint64_t v5 = self;
        uint64_t v6 = v4;
        goto LABEL_6;
      case 0x34u:
      case 0x35u:
      case 0x36u:
      case 0x37u:
      case 0x38u:
      case 0x39u:
      case 0x3Au:
      case 0x3Bu:
      case 0x3Cu:
      case 0x3Du:
      case 0x3Eu:
      case 0x3Fu:
      case 0x40u:
      case 0x41u:
      case 0x42u:
      case 0x43u:
      case 0x44u:
      case 0x45u:
      case 0x46u:
      case 0x47u:
      case 0x48u:
      case 0x49u:
      case 0x4Au:
      case 0x4Bu:
      case 0x4Cu:
      case 0x4Du:
        uint64_t v5 = self;
        uint64_t v6 = v4;
LABEL_6:
        -[PGPhotosChallengeMetricEvent _gatherMetricsForExhaustiveMomentLabelingQuestions:questionMetricType:isEventLabelingMetricEvent:progressBlock:](v5, "_gatherMetricsForExhaustiveMomentLabelingQuestions:questionMetricType:isEventLabelingMetricEvent:progressBlock:", v6);
        break;
      case 0x4Eu:
      case 0x4Fu:
      case 0x50u:
      case 0x51u:
      case 0x52u:
      case 0x53u:
      case 0x54u:
      case 0x55u:
      case 0x56u:
      case 0x57u:
      case 0x58u:
      case 0x59u:
      case 0x5Au:
      case 0x5Bu:
      case 0x5Cu:
        BOOL v7 = self;
        uint64_t v8 = v4;
        goto LABEL_10;
      case 0x5Du:
      case 0x5Eu:
      case 0x5Fu:
      case 0x60u:
      case 0x61u:
      case 0x62u:
      case 0x63u:
      case 0x64u:
      case 0x65u:
      case 0x66u:
      case 0x67u:
      case 0x68u:
      case 0x69u:
      case 0x6Au:
        BOOL v7 = self;
        uint64_t v8 = v4;
LABEL_10:
        -[PGPhotosChallengeMetricEvent _gatherMetricsForRelationshipQuestions:questionMetricType:progressBlock:useGraphInference:](v7, "_gatherMetricsForRelationshipQuestions:questionMetricType:progressBlock:useGraphInference:", v8);
        break;
      case 0x6Bu:
        [(PGPhotosChallengeMetricEvent *)self _gatherMetricsForBusinessQuestions:v4 progressBlock:v9];
        break;
      case 0x6Cu:
        [(PGPhotosChallengeMetricEvent *)self _gatherMetricsForPublicEventQuestions:v4 progressBlock:v9];
        break;
      case 0x6Du:
        [(PGPhotosChallengeMetricEvent *)self _gatherMetricsForTripKeyQuestions:v4 progressBlock:v9];
        break;
      case 0x6Eu:
        [(PGPhotosChallengeMetricEvent *)self _gatherMetricsForHolidayQuestions:v4 progressBlock:v9];
        break;
      case 0x6Fu:
        [(PGPhotosChallengeMetricEvent *)self _gatherMetricsForFrequentLocationQuestions:v4 questionMetricType:111 progressBlock:v9];
        break;
      case 0x70u:
        [(PGPhotosChallengeMetricEvent *)self _gatherMetricsForNamingQuestions:v4 progressBlock:v9];
        break;
      case 0x71u:
        [(PGPhotosChallengeMetricEvent *)self _gatherMetricsForAgeCategoryQuestions:v4 progressBlock:v9];
        break;
      case 0x72u:
        [(PGPhotosChallengeMetricEvent *)self _gatherMetricsForPetQuestions:v4 progressBlock:v9];
        break;
      case 0x73u:
        [(PGPhotosChallengeMetricEvent *)self _gatherMetricsForPetKnowledgeQuestions:v4 progressBlock:v9];
        break;
      case 0x74u:
      case 0x78u:
      case 0x79u:
      case 0x7Au:
      case 0x7Bu:
      case 0x7Cu:
      case 0x7Du:
      case 0x7Eu:
      case 0x7Fu:
      case 0x80u:
      case 0x81u:
      case 0x82u:
      case 0x83u:
      case 0x84u:
      case 0x85u:
      case 0x86u:
      case 0x87u:
      case 0x88u:
      case 0x89u:
      case 0x8Au:
      case 0x8Bu:
      case 0x8Cu:
      case 0x8Du:
      case 0x8Eu:
      case 0x8Fu:
      case 0x90u:
      case 0x91u:
      case 0x92u:
      case 0x93u:
      case 0x94u:
      case 0x95u:
      case 0x96u:
      case 0x97u:
      case 0x98u:
      case 0x99u:
      case 0x9Au:
      case 0x9Bu:
      case 0x9Cu:
      case 0x9Du:
      case 0x9Eu:
      case 0x9Fu:
      case 0xA0u:
      case 0xA1u:
      case 0xA2u:
      case 0xA3u:
      case 0xA4u:
      case 0xA5u:
      case 0xA6u:
      case 0xA7u:
      case 0xA8u:
      case 0xA9u:
      case 0xAAu:
      case 0xABu:
      case 0xACu:
      case 0xADu:
      case 0xAEu:
      case 0xAFu:
      case 0xB0u:
      case 0xB1u:
      case 0xB2u:
      case 0xB3u:
      case 0xB4u:
      case 0xB5u:
      case 0xB6u:
      case 0xB7u:
      case 0xB8u:
      case 0xB9u:
      case 0xBAu:
      case 0xBBu:
      case 0xBCu:
      case 0xBDu:
      case 0xBEu:
      case 0xBFu:
      case 0xC0u:
      case 0xC1u:
      case 0xC2u:
      case 0xC3u:
        -[PGPhotosChallengeMetricEvent _gatherMetricsForMemoryQuestions:questionMetricType:progressBlock:](self, "_gatherMetricsForMemoryQuestions:questionMetricType:progressBlock:", v4);
        break;
      case 0x75u:
        [(PGPhotosChallengeMetricEvent *)self _gatherMetricsForMemoryMusicQuestions:v4 progressBlock:v9];
        break;
      case 0xC4u:
        [(PGPhotosChallengeMetricEvent *)self _gatherMetricsForSyndicatedAssetsQuestions:v4 progressBlock:v9];
        break;
      case 0xC5u:
      case 0xC6u:
      case 0xC7u:
      case 0xC8u:
      case 0xC9u:
      case 0xCAu:
        -[PGPhotosChallengeMetricEvent _gatherMetricsForPersonActivityMeaningQuestions:questionMetricType:progressBlock:](self, "_gatherMetricsForPersonActivityMeaningQuestions:questionMetricType:progressBlock:", v4);
        break;
      case 0xCBu:
        [(PGPhotosChallengeMetricEvent *)self _gatherMetricsForSharedLibraryAssetsQuestions:v4 progressBlock:v9];
        break;
      case 0xCCu:
        [(PGPhotosChallengeMetricEvent *)self _gatherMetricsForSharedLibraryStartQuestions:v4 progressBlock:v9];
        break;
      case 0xCDu:
        [(PGPhotosChallengeMetricEvent *)self _gatherMetricsForCameraLibrarySwitchQuestions:v4 progressBlock:v9];
        break;
      case 0xCEu:
      case 0xCFu:
      case 0xD0u:
      case 0xD1u:
        -[PGPhotosChallengeMetricEvent _gatherMetricsForWallpaperQuestions:questionMetricType:progressBlock:](self, "_gatherMetricsForWallpaperQuestions:questionMetricType:progressBlock:", v4);
        break;
      case 0xD2u:
        [(PGPhotosChallengeMetricEvent *)self _gatherMetricsForTripTitlingQuestions:v4 progressBlock:v9];
        break;
      case 0xD3u:
        [(PGPhotosChallengeMetricEvent *)self _gatherMetricsForHighlightTitlingQuestions:v4 progressBlock:v9];
        break;
      case 0xD4u:
        [(PGPhotosChallengeMetricEvent *)self _gatherMetricsForLocationRepresentativeAssetQuestions:v4 questionMetricType:212 progressBlock:v9];
        break;
      case 0xD5u:
        [(PGPhotosChallengeMetricEvent *)self _gatherMetricsForExternalAssetRelevanceQuestions:v4 questionMetricType:213 progressBlock:v9];
        break;
      case 0xD6u:
        [(PGPhotosChallengeMetricEvent *)self _gatherMetricsForStoryPromptSuggestionsQuestions:v4 progressBlock:v9];
        break;
      default:
        break;
    }
  }
}

- (BOOL)shouldReportMetrics
{
  return [(PGManagerWorkingContext *)self->_workingContext isGraphReady];
}

- (id)identifier
{
  return @"com.apple.Photos.Intelligence.PhotosChallenge";
}

- (PGPhotosChallengeMetricEvent)initWithWorkingContext:(id)a3 questionMetricType:(unsigned __int16)a4 metricEventFetchHelper:(id)a5
{
  uint64_t v6 = a4;
  id v9 = a3;
  id v10 = a5;
  v29.receiver = self;
  v29.super_class = (Class)PGPhotosChallengeMetricEvent;
  double v11 = [(PGPhotosChallengeMetricEvent *)&v29 init];
  double v12 = v11;
  if (v11)
  {
    p_workingContext = (id *)&v11->_workingContext;
    objc_storeStrong((id *)&v11->_workingContext, a3);
    id v14 = *p_workingContext;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __97__PGPhotosChallengeMetricEvent_initWithWorkingContext_questionMetricType_metricEventFetchHelper___block_invoke;
    v27[3] = &unk_1E68F0848;
    uint64_t v15 = v12;
    long long v28 = v15;
    [v14 performSynchronousConcurrentGraphReadUsingBlock:v27];
    uint64_t v16 = objc_alloc_init(PGEventLabelingConfiguration);
    eventLabelingConfiguration = v15->_eventLabelingConfiguration;
    v15->_eventLabelingConfiguration = v16;

    uint64_t v18 = (CLSCurationSession *)objc_alloc_init(MEMORY[0x1E4F8E778]);
    curationSession = v15->_curationSession;
    v15->_curationSession = v18;

    id v20 = objc_alloc(MEMORY[0x1E4F8E768]);
    double v21 = [*p_workingContext photoLibrary];
    uint64_t v22 = [v20 initWithPhotoLibrary:v21 curationSession:v15->_curationSession];
    curationContext = v15->_curationContext;
    v15->_curationContext = (CLSCurationContext *)v22;

    uint64_t v24 = +[PGPhotosChallengeMetricEvent stringFromQuestionMetricType:v6];
    questionTypeString = v15->_questionTypeString;
    v15->_questionTypeString = (NSString *)v24;

    v15->_questionMetricType = v6;
    objc_storeStrong((id *)&v15->_metricsCache, a5);
    v15->_graphSchemaVersion = 617;
    v15->_questionVersion = 10;
    v15->_algorithmVersion = [(id)objc_opt_class() algorithmVersionFromQuestionMetricType:v6 withEventLabelingConfiguration:v15->_eventLabelingConfiguration];
  }
  return v12;
}

void __97__PGPhotosChallengeMetricEvent_initWithWorkingContext_questionMetricType_metricEventFetchHelper___block_invoke(uint64_t a1, void *a2)
{
  id v6 = [a2 graph];
  uint64_t v3 = +[PGCuratedLibraryIntelligenceMetricEvent librarySizeRangeDescriptionForLibrarySizeRange:](PGCuratedLibraryIntelligenceMetricEvent, "librarySizeRangeDescriptionForLibrarySizeRange:", [v6 librarySizeRange]);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 72);
  *(void *)(v4 + 72) = v3;
}

+ (id)stringFromQuestionMetricType:(unsigned __int16)a3
{
  if (a3 > 0xD7u) {
    return 0;
  }
  else {
    return off_1E68F1070[a3];
  }
}

+ (id)questionEntityTypesFromQuestionMetricType:(unsigned __int16)a3
{
  int v3 = a3;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id result = &unk_1F28D5490;
  switch(a3)
  {
    case 0u:
    case 0xD7u:
      uint64_t v5 = +[PGLogging sharedLogging];
      id v6 = [v5 loggingConnection];

      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        int v9 = 67109120;
        int v10 = v3;
        _os_log_impl(&dword_1D1805000, v6, OS_LOG_TYPE_INFO, "Unhandled MetricType %d", (uint8_t *)&v9, 8u);
      }

      id result = &unk_1F28D55C8;
      break;
    case 1u:
    case 2u:
    case 3u:
    case 4u:
    case 5u:
    case 6u:
    case 7u:
    case 8u:
    case 9u:
    case 0xAu:
    case 0xBu:
    case 0xCu:
    case 0xDu:
    case 0xEu:
    case 0xFu:
    case 0x10u:
    case 0x11u:
    case 0x12u:
    case 0x13u:
    case 0x14u:
    case 0x15u:
    case 0x16u:
    case 0x17u:
    case 0x18u:
    case 0x19u:
    case 0x6Bu:
    case 0x6Cu:
    case 0x6Eu:
    case 0x6Fu:
    case 0x76u:
    case 0x77u:
    case 0xC5u:
    case 0xC6u:
    case 0xC7u:
    case 0xC8u:
    case 0xC9u:
    case 0xCAu:
    case 0xCEu:
    case 0xCFu:
    case 0xD0u:
    case 0xD1u:
    case 0xD4u:
      return result;
    case 0x1Au:
    case 0x1Bu:
    case 0x1Cu:
    case 0x1Du:
    case 0x1Eu:
    case 0x1Fu:
    case 0x20u:
    case 0x21u:
    case 0x22u:
    case 0x23u:
    case 0x24u:
    case 0x25u:
    case 0x26u:
    case 0x27u:
    case 0x28u:
    case 0x29u:
    case 0x2Au:
    case 0x2Bu:
    case 0x2Cu:
    case 0x2Du:
    case 0x2Eu:
    case 0x2Fu:
    case 0x30u:
    case 0x31u:
    case 0x32u:
    case 0x33u:
    case 0x34u:
    case 0x35u:
    case 0x36u:
    case 0x37u:
    case 0x38u:
    case 0x39u:
    case 0x3Au:
    case 0x3Bu:
    case 0x3Cu:
    case 0x3Du:
    case 0x3Eu:
    case 0x3Fu:
    case 0x40u:
    case 0x41u:
    case 0x42u:
    case 0x43u:
    case 0x44u:
    case 0x45u:
    case 0x46u:
    case 0x47u:
    case 0x48u:
    case 0x49u:
    case 0x4Au:
    case 0x4Bu:
    case 0x4Cu:
    case 0x4Du:
      id result = &unk_1F28D54A8;
      break;
    case 0x4Eu:
    case 0x4Fu:
    case 0x50u:
    case 0x51u:
    case 0x52u:
    case 0x53u:
    case 0x54u:
    case 0x55u:
    case 0x56u:
    case 0x57u:
    case 0x58u:
    case 0x59u:
    case 0x5Au:
    case 0x5Bu:
    case 0x5Cu:
    case 0x5Du:
    case 0x5Eu:
    case 0x5Fu:
    case 0x60u:
    case 0x61u:
    case 0x62u:
    case 0x63u:
    case 0x64u:
    case 0x65u:
    case 0x66u:
    case 0x67u:
    case 0x68u:
    case 0x69u:
    case 0x6Au:
      id result = &unk_1F28D54C0;
      break;
    case 0x6Du:
    case 0xD2u:
      id result = &unk_1F28D54F0;
      break;
    case 0x70u:
    case 0x71u:
    case 0x72u:
      id result = &unk_1F28D54D8;
      break;
    case 0x73u:
      id result = &unk_1F28D5508;
      break;
    case 0x74u:
    case 0x75u:
    case 0x78u:
    case 0x79u:
    case 0x7Au:
    case 0x7Bu:
    case 0x7Cu:
    case 0x7Du:
    case 0x7Eu:
    case 0x7Fu:
    case 0x80u:
    case 0x81u:
    case 0x82u:
    case 0x83u:
    case 0x84u:
    case 0x85u:
    case 0x86u:
    case 0x87u:
    case 0x88u:
    case 0x89u:
    case 0x8Au:
    case 0x8Bu:
    case 0x8Cu:
    case 0x8Du:
    case 0x8Eu:
    case 0x8Fu:
    case 0x90u:
    case 0x91u:
    case 0x92u:
    case 0x93u:
    case 0x94u:
    case 0x95u:
    case 0x96u:
    case 0x97u:
    case 0x98u:
    case 0x99u:
    case 0x9Au:
    case 0x9Bu:
    case 0x9Cu:
    case 0x9Du:
    case 0x9Eu:
    case 0x9Fu:
    case 0xA0u:
    case 0xA1u:
    case 0xA2u:
    case 0xA3u:
    case 0xA4u:
    case 0xA5u:
    case 0xA6u:
    case 0xA7u:
    case 0xA8u:
    case 0xA9u:
    case 0xAAu:
    case 0xABu:
    case 0xACu:
    case 0xADu:
    case 0xAEu:
    case 0xAFu:
    case 0xB0u:
    case 0xB1u:
    case 0xB2u:
    case 0xB3u:
    case 0xB4u:
    case 0xB5u:
    case 0xB6u:
    case 0xB7u:
    case 0xB8u:
    case 0xB9u:
    case 0xBAu:
    case 0xBBu:
    case 0xBCu:
    case 0xBDu:
    case 0xBEu:
    case 0xBFu:
    case 0xC0u:
    case 0xC1u:
    case 0xC2u:
    case 0xC3u:
      id result = &unk_1F28D5520;
      break;
    case 0xC4u:
    case 0xD5u:
      id result = &unk_1F28D5538;
      break;
    case 0xCBu:
      id result = &unk_1F28D5550;
      break;
    case 0xCCu:
      id result = &unk_1F28D5568;
      break;
    case 0xCDu:
      id result = &unk_1F28D5580;
      break;
    case 0xD3u:
      id result = &unk_1F28D5598;
      break;
    case 0xD6u:
      id result = &unk_1F28D55B0;
      break;
    default:
      BOOL v7 = +[PGLogging sharedLogging];
      uint64_t v8 = [v7 loggingConnection];

      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        int v9 = 67109120;
        int v10 = v3;
        _os_log_error_impl(&dword_1D1805000, v8, OS_LOG_TYPE_ERROR, "Unexpected MetricType %d", (uint8_t *)&v9, 8u);
      }

      id result = &unk_1F28D55E0;
      break;
  }
  return result;
}

+ (unsigned)questionTypeFromQuestionMetricType:(unsigned __int16)a3
{
  if ((a3 - 1) > 0xD5) {
    return 0;
  }
  else {
    return word_1D1F502A0[(unsigned __int16)(a3 - 1)];
  }
}

+ (unint64_t)algorithmVersionFromQuestionMetricType:(unsigned __int16)a3 withEventLabelingConfiguration:(id)a4
{
  int v4 = a3;
  id v5 = a4;
  id v6 = v5;
  switch(v4)
  {
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
    case 23:
    case 24:
    case 25:
    case 26:
    case 27:
    case 28:
    case 29:
    case 30:
    case 31:
    case 32:
    case 33:
    case 34:
    case 35:
    case 36:
    case 37:
    case 38:
    case 39:
    case 40:
    case 41:
    case 42:
    case 43:
    case 44:
    case 45:
    case 46:
    case 47:
    case 48:
    case 49:
    case 50:
    case 51:
    case 210:
      unint64_t v7 = 5;
      break;
    case 52:
    case 53:
    case 54:
    case 55:
    case 56:
    case 57:
    case 58:
    case 59:
    case 60:
    case 61:
    case 62:
    case 63:
    case 64:
    case 65:
    case 66:
    case 67:
    case 68:
    case 69:
    case 70:
    case 71:
    case 72:
    case 73:
    case 74:
    case 75:
    case 76:
    case 77:
      unint64_t v7 = [v5 modelVersion];
      break;
    case 78:
    case 79:
    case 80:
    case 81:
    case 82:
    case 83:
    case 84:
    case 85:
    case 86:
    case 87:
    case 88:
    case 89:
    case 90:
    case 91:
    case 92:
      unint64_t v7 = 4;
      break;
    case 93:
    case 94:
    case 95:
    case 96:
    case 97:
    case 98:
    case 99:
    case 100:
    case 101:
    case 102:
    case 103:
    case 104:
    case 105:
    case 106:
    case 107:
    case 108:
    case 109:
    case 112:
    case 113:
    case 116:
    case 117:
    case 118:
    case 119:
    case 120:
    case 121:
    case 122:
    case 123:
    case 124:
    case 125:
    case 126:
    case 127:
    case 128:
    case 129:
    case 130:
    case 131:
    case 132:
    case 133:
    case 134:
    case 135:
    case 136:
    case 137:
    case 138:
    case 139:
    case 140:
    case 141:
    case 142:
    case 143:
    case 144:
    case 145:
    case 146:
    case 147:
    case 148:
    case 149:
    case 150:
    case 151:
    case 152:
    case 153:
    case 154:
    case 155:
    case 156:
    case 157:
    case 158:
    case 159:
    case 160:
    case 161:
    case 162:
    case 163:
    case 164:
    case 165:
    case 166:
    case 167:
    case 168:
    case 169:
    case 170:
    case 171:
    case 172:
    case 173:
    case 174:
    case 175:
    case 176:
    case 177:
    case 178:
    case 179:
    case 180:
    case 181:
    case 182:
    case 183:
    case 184:
    case 185:
    case 186:
    case 187:
    case 188:
    case 189:
    case 190:
    case 191:
    case 192:
    case 193:
    case 194:
    case 195:
    case 197:
    case 198:
    case 199:
    case 200:
    case 201:
    case 202:
    case 203:
    case 204:
    case 206:
    case 207:
    case 208:
    case 209:
    case 211:
      unint64_t v7 = 1;
      break;
    case 110:
    case 111:
    case 205:
    case 212:
      unint64_t v7 = 2;
      break;
    case 114:
    case 115:
      unint64_t v7 = 201;
      break;
    case 196:
      uint64_t v8 = (unint64_t *)MEMORY[0x1E4F39580];
      goto LABEL_11;
    case 213:
      uint64_t v8 = (unint64_t *)MEMORY[0x1E4F8E890];
LABEL_11:
      unint64_t v7 = *v8;
      break;
    default:
      unint64_t v7 = 0;
      break;
  }

  return v7;
}

+ (id)relationshipLabelFromRelationshipQuestionMetricType:(unsigned __int16)a3
{
  if ((a3 - 78) > 0x1C)
  {
    int v4 = 0;
  }
  else
  {
    int v4 = *off_1E68F0F88[(unsigned __int16)(a3 - 78)];
  }
  return v4;
}

+ (id)personActivityMeaningLabelFromMeaningQuestionMetricType:(unsigned __int16)a3
{
  if ((a3 - 197) > 5)
  {
    int v4 = 0;
  }
  else
  {
    int v4 = *off_1E68F0F58[(unsigned __int16)(a3 - 197)];
  }
  return v4;
}

+ (id)meaningLabelFromMeaningQuestionMetricType:(unsigned __int16)a3
{
  if ((a3 - 1) > 0x4C)
  {
    int v4 = 0;
  }
  else
  {
    int v4 = *off_1E68F0CF0[(unsigned __int16)(a3 - 1)];
  }
  return v4;
}

+ (BOOL)_isHighPrecisionCityscapeAsset:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  [v3 sceneClassifications];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = (void *)[v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v8, "extendedSceneIdentifier", (void)v12) == 2147481598)
        {
          id v5 = [v3 curationModel];
          int v9 = [v5 cityNatureModel];

          int v10 = [v9 cityNode];
          LOBYTE(v5) = [v10 passesHighPrecisionWithSignal:v8];

          goto LABEL_11;
        }
      }
      id v5 = (void *)[v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v5;
}

+ (BOOL)_isHighPrecisionLandscapeAsset:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  [v3 sceneClassifications];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = (void *)[v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v8, "extendedSceneIdentifier", (void)v12) == 2147481597)
        {
          id v5 = [v3 curationModel];
          int v9 = [v5 cityNatureModel];

          int v10 = [v9 natureNode];
          LOBYTE(v5) = [v10 passesHighPrecisionWithSignal:v8];

          goto LABEL_11;
        }
      }
      id v5 = (void *)[v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v5;
}

+ (id)_isVIPStringForResult:(BOOL)a3
{
  if (a3) {
    return @"IsVIP";
  }
  else {
    return @"NotVIP";
  }
}

+ (id)_passedFilteringStringForResult:(BOOL)a3
{
  if (a3) {
    return @"PassedFiltering";
  }
  else {
    return @"FailedFiltering";
  }
}

+ (id)_passedHighPrecisionStringForResult:(BOOL)a3
{
  if (a3) {
    return @"PassedHighPrecision";
  }
  else {
    return @"FailedHighPrecision";
  }
}

+ (unsigned)wallpaperSuggestionSubtypeForQuestionMetricType:(unsigned __int16)a3
{
  if (((a3 - 206) & 0xFFFC) != 0) {
    return 0;
  }
  else {
    return a3 + 446;
  }
}

+ (unint64_t)meaningInferenceAlgorithmForQuestionMetricType:(unsigned __int16)a3 withEventLabelingConfiguration:(id)a4
{
  uint64_t v4 = a3;
  id v5 = a4;
  if (+[PGEventLabelingConfiguration isEventLabelingEnabled])
  {
    uint64_t v6 = [(id)objc_opt_class() meaningLabelFromMeaningQuestionMetricType:v4];
    if ([v5 useEventLabelingToInferWithMeaningLabel:v6]) {
      unint64_t v7 = 3;
    }
    else {
      unint64_t v7 = 1;
    }
  }
  else
  {
    unint64_t v7 = 1;
  }

  return v7;
}

+ (id)allMetricEventsWithGraphManager:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
  id v5 = [[PGPhotosChallengeMetricEventFetchHelper alloc] initWithGraphManager:v3];
  unsigned __int16 v6 = 1;
  unint64_t v7 = off_1E68E2000;
  uint64_t v8 = off_1E68E2000;
  do
  {
    switch((char)v6)
    {
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
      case 23:
      case 24:
      case 25:
      case 26:
      case 27:
      case 28:
      case 29:
      case 30:
      case 31:
      case 32:
      case 33:
      case 34:
      case 35:
      case 36:
      case 37:
      case 38:
      case 39:
      case 40:
      case 41:
      case 42:
      case 43:
      case 44:
      case 45:
      case 46:
      case 47:
      case 48:
      case 49:
      case 50:
      case 51:
      case 52:
      case 53:
      case 54:
      case 55:
      case 56:
      case 57:
      case 58:
      case 59:
      case 60:
      case 61:
      case 62:
      case 63:
      case 64:
      case 65:
      case 66:
      case 67:
      case 68:
      case 69:
      case 70:
      case 71:
      case 72:
      case 73:
      case 74:
      case 75:
      case 76:
      case 77:
      case 78:
      case 79:
      case 80:
      case 81:
      case 82:
      case 83:
      case 84:
      case 85:
      case 86:
      case 87:
      case 88:
      case 89:
      case 90:
      case 91:
      case 92:
      case 93:
      case 94:
      case 95:
      case 96:
      case 97:
      case 98:
      case 99:
      case 100:
      case 101:
      case 102:
      case 103:
      case 104:
      case 105:
      case 106:
      case 107:
      case 108:
      case 109:
      case 110:
      case 111:
      case 112:
      case 113:
      case 114:
      case 115:
      case 116:
      case 118:
      case 119:
      case 120:
      case 121:
      case 122:
      case 123:
      case 124:
      case 125:
      case 126:
      case 127:
      case -128:
      case -127:
      case -126:
      case -125:
      case -124:
      case -123:
      case -122:
      case -121:
      case -120:
      case -119:
      case -118:
      case -117:
      case -116:
      case -115:
      case -114:
      case -113:
      case -112:
      case -111:
      case -110:
      case -109:
      case -108:
      case -107:
      case -106:
      case -105:
      case -104:
      case -103:
      case -102:
      case -101:
      case -100:
      case -99:
      case -98:
      case -97:
      case -96:
      case -95:
      case -94:
      case -93:
      case -92:
      case -91:
      case -90:
      case -89:
      case -88:
      case -87:
      case -86:
      case -85:
      case -84:
      case -83:
      case -82:
      case -81:
      case -80:
      case -79:
      case -78:
      case -77:
      case -76:
      case -75:
      case -74:
      case -73:
      case -72:
      case -71:
      case -70:
      case -69:
      case -68:
      case -67:
      case -66:
      case -65:
      case -64:
      case -63:
      case -62:
      case -61:
      case -59:
      case -58:
      case -57:
      case -56:
      case -55:
      case -54:
      case -52:
      case -43:
        int v9 = PGPhotosChallengeMetricEvent;
        goto LABEL_4;
      case 117:
      case -60:
      case -50:
      case -49:
      case -48:
      case -47:
      case -46:
      case -45:
      case -44:
      case -42:
        int v9 = PGPhotosChallengePrecisionRecallByReasonMetricEvent;
LABEL_4:
        id v10 = [v9 alloc];
        uint64_t v11 = [v3 workingContext];
        long long v12 = (void *)[v10 initWithWorkingContext:v11 questionMetricType:v6 metricEventFetchHelper:v5];

        [v4 addObject:v12];
        goto LABEL_5;
      case -53:
        long long v12 = [v3 workingContext];
        long long v14 = v7[496];
        long long v15 = [v12 photoLibrary];
        LODWORD(v14) = [(__objc2_class *)v14 isSharedLibraryQuestionsEnabledForPhotoLibrary:v15];

        if (v14)
        {
          uint64_t v16 = [(PGPhotosChallengeMetricEvent *)[PGPhotosChallengePrecisionRecallByReasonMetricEvent alloc] initWithWorkingContext:v12 questionMetricType:v6 metricEventFetchHelper:v5];
          [v4 addObject:v16];
          uint64_t v17 = (void *)[objc_alloc(v8[494]) initWithWorkingContext:v12 questionMetricType:v6 metricEventFetchHelper:v5];
          [(PGPhotosChallengeMetricEvent *)v16 setSubMetricEvent:v17];
          [v4 addObject:v17];
        }
        unint64_t v7 = off_1E68E2000;
        goto LABEL_5;
      case -51:
        uint64_t v18 = v7;
        long long v12 = [v3 workingContext];
        long long v19 = [v12 photoLibrary];
        BOOL v20 = +[PGCameraLibrarySwitchQuestionFactory isSharedLibraryQuestionsEnabledForPhotoLibrary:v19];

        if (v20)
        {
          double v21 = [(PGPhotosChallengeMetricEvent *)[PGPhotosChallengePrecisionRecallByReasonMetricEvent alloc] initWithWorkingContext:v12 questionMetricType:v6 metricEventFetchHelper:v5];
          [v4 addObject:v21];
        }
        unint64_t v7 = v18;
        uint64_t v8 = off_1E68E2000;
LABEL_5:

        break;
      default:
        break;
    }
    unsigned int v13 = v6++;
  }
  while (v13 < 0xD6);

  return v4;
}

@end
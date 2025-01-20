@interface PSPETMessageBuilder
@end

@implementation PSPETMessageBuilder

void __127___PSPETMessageBuilder_initWithInteractionsStatistics_andConfig_andContext_andDeviceIdentifier_andTrialIdentifier_andDefaults___block_invoke(uint64_t a1, void *a2)
{
  id v36 = a2;
  v3 = objc_opt_new();
  v4 = [*(id *)(a1 + 32) privatizedConversationId:v36];
  [v3 setPrivatizedIdentifier:v4];

  v5 = [*(id *)(a1 + 32) bundleIdForConversationId:v36];
  uint64_t v6 = [*(id *)(a1 + 40) objectForKeyedSubscript:v5];
  v7 = (void *)v6;
  if (v5 && !v6)
  {
    v7 = objc_msgSend([NSString alloc], "initWithFormat:", @"%du", arc4random());
    [*(id *)(a1 + 40) setObject:v7 forKeyedSubscript:v5];
  }
  v8 = objc_opt_new();
  v9 = [*(id *)(a1 + 32) valueOrDefaultValueForFeature:@"feedback" forConversationId:v36];
  objc_msgSend(v8, "setFeedbackType:", objc_msgSend(v9, "integerValue"));

  v10 = [v3 privatizedIdentifier];
  [v8 setPrivatizedCandidateIdentifier:v10];

  [v8 setPrivatizedTransportBundleId:v7];
  v11 = *(void **)(a1 + 48);
  v12 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v8, "feedbackType"));
  v13 = [v11 objectForKeyedSubscript:v12];
  [v13 addObject:v8];

  v14 = [*(id *)(a1 + 56) privacyMitigatedFeatureValueFromName:@"timeSinceLastOutgoingInteraction" forConversationId:v36];
  [v3 setTimeSinceLastOutgoingInteraction:v14];

  v15 = [*(id *)(a1 + 56) privacyMitigatedFeatureValueFromName:@"timeSinceOutgoingInteractionNumber10" forConversationId:v36];
  [v3 setTimeSinceOutgoingInteractionNumber10:v15];

  v16 = [*(id *)(a1 + 56) privacyMitigatedFeatureValueFromName:@"timeSinceLastIncomingInteraction" forConversationId:v36];
  [v3 setTimeSinceLastIncomingInteraction:v16];

  v17 = [*(id *)(a1 + 56) privacyMitigatedFeatureValueFromName:@"numberOfSharesWithConversation" forConversationId:v36];
  [v3 setNumberOfSharesWithConversation:v17];

  v18 = [*(id *)(a1 + 56) privacyMitigatedFeatureValueFromName:@"numberOfSharesFromCurrentAppWithConversation" forConversationId:v36];
  [v3 setNumberOfSharesFromCurrentAppWithConversation:v18];

  v19 = [*(id *)(a1 + 56) privacyMitigatedFeatureValueFromName:@"numberOfSharesOfTopDomainURLWithConversation" forConversationId:v36];
  [v3 setNumberOfSharesOfTopDomainURLWithConversation:v19];

  v20 = [*(id *)(a1 + 56) privacyMitigatedFeatureValueFromName:@"numberOfSharesOfDetectedPeopleWithConversation" forConversationId:v36];
  [v3 setNumberOfSharesOfDetectedPeopleWithConversation:v20];

  v21 = [*(id *)(a1 + 56) privacyMitigatedFeatureValueFromName:@"numberOfSharesOfPeopleInPhotoWithConversation" forConversationId:v36];
  [v3 setNumberOfSharesOfPeopleInPhotoWithConversation:v21];

  v22 = [*(id *)(a1 + 56) privacyMitigatedFeatureValueFromName:@"numberOfOutgoingInteractionsWithConversation" forConversationId:v36];
  [v3 setNumberOfOutgoingInteractionsWithConversation:v22];

  v23 = [*(id *)(a1 + 56) privacyMitigatedFeatureValueFromName:@"numberOfIncomingInteractionsWithConversation" forConversationId:v36];
  [v3 setNumberOfIncomingInteractionsWithConversation:v23];

  v24 = [*(id *)(a1 + 56) privacyMitigatedFeatureValueFromName:@"numberOfInteractionsDuringTimePeriodWithConversation" forConversationId:v36];
  [v3 setNumberOfInteractionsDuringTimePeriodWithConversation:v24];

  v25 = [*(id *)(a1 + 56) privacyMitigatedFeatureValueFromName:@"numberOfEngagedSuggestionsWithConversation" forConversationId:v36];
  [v3 setNumberOfEngagedSuggestionsWithConversation:v25];

  v26 = [*(id *)(a1 + 56) privacyMitigatedFeatureValueFromName:@"numberOfEngagedSuggestionsFromCurrentAppWithConversation" forConversationId:v36];
  [v3 setNumberOfEngagedSuggestionsFromCurrentAppWithConversation:v26];

  v27 = [*(id *)(a1 + 56) privacyMitigatedFeatureValueFromName:@"numberOfEngagedSuggestionsOfTopDomainURLWithConversation" forConversationId:v36];
  [v3 setNumberOfEngagedSuggestionsOfTopDomainURLWithConversation:v27];

  v28 = [*(id *)(a1 + 56) privacyMitigatedFeatureValueFromName:@"numberOfEngagedSuggestionsOfDetectedPeopleWithConversation" forConversationId:v36];
  [v3 setNumberOfEngagedSuggestionsOfDetectedPeopleWithConversation:v28];

  v29 = [*(id *)(a1 + 56) privacyMitigatedFeatureValueFromName:@"numberOfEngagedSuggestionsOfPeopleInPhotoWithConversation" forConversationId:v36];
  [v3 setNumberOfEngagedSuggestionsOfPeopleInPhotoWithConversation:v29];

  v30 = [*(id *)(a1 + 56) privacyMitigatedFeatureValueFromName:@"hasEverSharePlayedWithConversation" forConversationId:v36];
  [v3 setHasEverSharePlayedWithConversation:v30];

  v31 = [*(id *)(*(void *)(a1 + 56) + 16) valueForFeature:@"suggestedRank" forConversationId:v36];
  v32 = v31;
  if (v31) {
    objc_msgSend(v3, "setSuggestedRank:", objc_msgSend(v31, "intValue"));
  }
  v33 = [*(id *)(*(void *)(a1 + 56) + 16) valueForFeature:@"coreMLModelScore" forConversationId:v36];
  [v33 doubleValue];
  objc_msgSend(v3, "setCoreMLModelScore:");

  v34 = [*(id *)(*(void *)(a1 + 56) + 16) valueForFeature:@"foundInInteractionStoreChunk" forConversationId:v36];
  objc_msgSend(v3, "setFoundInChunk:", objc_msgSend(v34, "intValue"));

  v35 = [*(id *)(*(void *)(a1 + 56) + 16) valueForFeature:@"updatedInInteractionStoreChunk" forConversationId:v36];
  objc_msgSend(v3, "setUpdatedInChunk:", objc_msgSend(v35, "intValue"));

  [*(id *)(*(void *)(a1 + 56) + 8) addCandidates:v3];
}

@end
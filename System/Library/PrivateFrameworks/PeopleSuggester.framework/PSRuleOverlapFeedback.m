@interface PSRuleOverlapFeedback
@end

@implementation PSRuleOverlapFeedback

void __50___PSRuleOverlapFeedback_writeRecordObjcWithData___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  v6 = +[_PSLogging generalChannel];
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v7)
    {
      v8 = [v5 localizedDescription];
      int v10 = 138412290;
      v11 = v8;
      v9 = "Error in dodML record creation: %@";
LABEL_6:
      _os_log_impl(&dword_1A314B000, v6, OS_LOG_TYPE_INFO, v9, (uint8_t *)&v10, 0xCu);
    }
  }
  else if (v7)
  {
    v8 = [v4 UUIDString];
    int v10 = 138412290;
    v11 = v8;
    v9 = "DodML record writing UUID: %@";
    goto LABEL_6;
  }
}

id __71___PSRuleOverlapFeedback_modelAccuracyLogging_WithMatchingInteraction___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __57___PSRuleOverlapFeedback_wasInteractionAmongSuggestLess___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 state] == 1)
  {
    v3 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __60___PSKNNModel_rankedMapsShareEtaSuggestions_maxSuggestions___block_invoke_cold_1(v2, v3);
    }
  }
}

void __57___PSRuleOverlapFeedback_wasInteractionAmongSuggestLess___block_invoke_343(uint64_t a1, void *a2)
{
  id v10 = [a2 eventBody];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = [_PSShareSheetSuggestLessFeedback alloc];
    id v4 = [v10 bundleId];
    id v5 = [v10 conversationIdentifier];
    v6 = [v10 derivedIdentifier];
    BOOL v7 = [v10 handle];
    v8 = [v10 contactIdentifier];
    v9 = [(_PSShareSheetSuggestLessFeedback *)v3 initWithBundleId:v4 conversationId:v5 derivedIntentId:v6 handle:v7 contactId:v8];

    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v9];
  }
}

BOOL __80___PSRuleOverlapFeedback_loggingForKnowledgeStoreEvent_WithMatchingInteraction___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 type];
  v3 = [v2 identifier];
  id v4 = [getBMItemTypeClass_0() interactionRecipients];
  id v5 = [v4 identifier];
  BOOL v6 = v3 == v5;

  return v6;
}

BOOL __80___PSRuleOverlapFeedback_loggingForKnowledgeStoreEvent_WithMatchingInteraction___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 type];
  v3 = [v2 identifier];
  id v4 = [getBMItemTypeClass_0() interactionTargetBundleID];
  id v5 = [v4 identifier];
  BOOL v6 = v3 == v5;

  return v6;
}

id __80___PSRuleOverlapFeedback_loggingForKnowledgeStoreEvent_WithMatchingInteraction___block_invoke_3(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

uint64_t __80___PSRuleOverlapFeedback_loggingForKnowledgeStoreEvent_WithMatchingInteraction___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __80___PSRuleOverlapFeedback_loggingForKnowledgeStoreEvent_WithMatchingInteraction___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  if (v3)
  {
    id v4 = +[_PSLogging feedbackChannel];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __80___PSRuleOverlapFeedback_loggingForKnowledgeStoreEvent_WithMatchingInteraction___block_invoke_5_cold_1();
    }
  }
}

uint64_t __104___PSRuleOverlapFeedback_feedbackPETPayloadForRule_ForInteraction_ForContextItems_WithConstantFeatures___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 type];
  id v3 = [v2 identifier];
  id v4 = [getBMItemTypeClass_0() interactionPhotoContact];
  id v5 = [v4 identifier];
  uint64_t v6 = [v3 isEqualToString:v5];

  return v6;
}

BOOL __104___PSRuleOverlapFeedback_feedbackPETPayloadForRule_ForInteraction_ForContextItems_WithConstantFeatures___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 type];
  id v3 = [v2 identifier];
  id v4 = [getBMItemTypeClass_0() interactionPhotoScene];
  id v5 = [v4 identifier];
  BOOL v6 = v3 == v5;

  return v6;
}

BOOL __104___PSRuleOverlapFeedback_feedbackPETPayloadForRule_ForInteraction_ForContextItems_WithConstantFeatures___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = [a2 type];
  id v3 = [v2 identifier];
  id v4 = [getBMItemTypeClass_0() interactionExtractedTopicFromAttachment];
  id v5 = [v4 identifier];
  BOOL v6 = v3 == v5;

  return v6;
}

BOOL __104___PSRuleOverlapFeedback_feedbackPETPayloadForRule_ForInteraction_ForContextItems_WithConstantFeatures___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = [a2 type];
  id v3 = [v2 identifier];
  id v4 = [getBMItemTypeClass_0() interactionPhotoContact];
  id v5 = [v4 identifier];
  BOOL v6 = v3 == v5;

  return v6;
}

BOOL __104___PSRuleOverlapFeedback_feedbackPETPayloadForRule_ForInteraction_ForContextItems_WithConstantFeatures___block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = [a2 type];
  id v3 = [v2 identifier];
  id v4 = [getBMItemTypeClass_0() interactionPhotoScene];
  id v5 = [v4 identifier];
  BOOL v6 = v3 == v5;

  return v6;
}

BOOL __104___PSRuleOverlapFeedback_feedbackPETPayloadForRule_ForInteraction_ForContextItems_WithConstantFeatures___block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = [a2 type];
  id v3 = [v2 identifier];
  id v4 = [getBMItemTypeClass_0() interactionExtractedTopicFromAttachment];
  id v5 = [v4 identifier];
  BOOL v6 = v3 == v5;

  return v6;
}

uint64_t __101___PSRuleOverlapFeedback_feedbackPayloadForRule_ForInteraction_ForContextItems_WithConstantFeatures___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 type];
  id v3 = [v2 identifier];
  id v4 = [getBMItemTypeClass_0() interactionPhotoContact];
  id v5 = [v4 identifier];
  uint64_t v6 = [v3 isEqualToString:v5];

  return v6;
}

BOOL __101___PSRuleOverlapFeedback_feedbackPayloadForRule_ForInteraction_ForContextItems_WithConstantFeatures___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 type];
  id v3 = [v2 identifier];
  id v4 = [getBMItemTypeClass_0() interactionPhotoScene];
  id v5 = [v4 identifier];
  BOOL v6 = v3 == v5;

  return v6;
}

BOOL __101___PSRuleOverlapFeedback_feedbackPayloadForRule_ForInteraction_ForContextItems_WithConstantFeatures___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = [a2 type];
  id v3 = [v2 identifier];
  id v4 = [getBMItemTypeClass_0() interactionPhotoContact];
  id v5 = [v4 identifier];
  BOOL v6 = v3 == v5;

  return v6;
}

BOOL __101___PSRuleOverlapFeedback_feedbackPayloadForRule_ForInteraction_ForContextItems_WithConstantFeatures___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = [a2 type];
  id v3 = [v2 identifier];
  id v4 = [getBMItemTypeClass_0() interactionPhotoScene];
  id v5 = [v4 identifier];
  BOOL v6 = v3 == v5;

  return v6;
}

BOOL __69___PSRuleOverlapFeedback_targetAppPredictedCorrectlyByRule_bundleId___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 type];
  id v3 = [v2 identifier];
  id v4 = [getBMItemTypeClass_0() interactionTargetBundleID];
  id v5 = [v4 identifier];
  BOOL v6 = v3 == v5;

  return v6;
}

BOOL __59___PSRuleOverlapFeedback_constantFeaturesFromContextItems___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 type];
  id v3 = [v2 identifier];
  id v4 = [getBMItemTypeClass_0() interactionPhotoContact];
  id v5 = [v4 identifier];
  BOOL v6 = v3 == v5;

  return v6;
}

BOOL __59___PSRuleOverlapFeedback_constantFeaturesFromContextItems___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 type];
  id v3 = [v2 identifier];
  id v4 = [getBMItemTypeClass_0() interactionPhotoScene];
  id v5 = [v4 identifier];
  BOOL v6 = v3 == v5;

  return v6;
}

BOOL __62___PSRuleOverlapFeedback_constantPETFeaturesFromContextItems___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 type];
  id v3 = [v2 identifier];
  id v4 = [getBMItemTypeClass_0() interactionPhotoContact];
  id v5 = [v4 identifier];
  BOOL v6 = v3 == v5;

  return v6;
}

BOOL __62___PSRuleOverlapFeedback_constantPETFeaturesFromContextItems___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 type];
  id v3 = [v2 identifier];
  id v4 = [getBMItemTypeClass_0() interactionPhotoScene];
  id v5 = [v4 identifier];
  BOOL v6 = v3 == v5;

  return v6;
}

BOOL __62___PSRuleOverlapFeedback_constantPETFeaturesFromContextItems___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = [a2 type];
  id v3 = [v2 identifier];
  id v4 = [getBMItemTypeClass_0() interactionExtractedTopicFromAttachment];
  id v5 = [v4 identifier];
  BOOL v6 = v3 == v5;

  return v6;
}

void __60___PSRuleOverlapFeedback_sharesheetFeedbackEventsSinceDate___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 state] == 1)
  {
    id v3 = +[_PSLogging feedbackChannel];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __60___PSKNNModel_rankedMapsShareEtaSuggestions_maxSuggestions___block_invoke_cold_1(v2, v3);
    }
  }
}

void __60___PSRuleOverlapFeedback_sharesheetFeedbackEventsSinceDate___block_invoke_570(uint64_t a1, void *a2)
{
  id v14 = a2;
  id v3 = [v14 eventBody];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    id v5 = (void *)MEMORY[0x1E4F1C9C8];
    [v14 timestamp];
    BOOL v6 = objc_msgSend(v5, "dateWithTimeIntervalSinceReferenceDate:");
    if ([v6 compare:*(void *)(a1 + 32)] == 1)
    {
      BOOL v7 = +[_PSInteractionStoreUtils metadataFromFeedbackEvent:v4];
      id v8 = objc_alloc(MEMORY[0x1E4F5B5F0]);
      v9 = [v4 sourceBundleID];
      id v10 = (void *)[v8 initWithIdentifier:@"sharesheet" bundleIdentifier:v9 itemIdentifier:0 groupIdentifier:0 deviceIdentifier:0 userIdentifier:0];

      v11 = (void *)MEMORY[0x1E4F5B510];
      uint64_t v12 = [MEMORY[0x1E4F5B520] eventStreamWithName:@"/dummyStream/tempStream"];
      v13 = [v11 eventWithStream:v12 source:v10 startDate:v6 endDate:v6 identifierStringValue:0 metadata:v7];

      [*(id *)(a1 + 40) addObject:v13];
    }
  }
}

void __80___PSRuleOverlapFeedback_loggingForKnowledgeStoreEvent_WithMatchingInteraction___block_invoke_5_cold_1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0(&dword_1A314B000, v0, v1, "Error saving feedback event to knowledge store: %@", v2);
}

@end
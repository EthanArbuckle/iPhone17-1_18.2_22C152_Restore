@interface _PSKNNModel
- (BOOL)_PSInteractionModelInUse;
- (BOOL)suggestedRecipientHandles:(id)a3 differFromFetchedRecipientHandles:(id)a4;
- (CNContactStore)contactStore;
- (NSArray)filterBundleIds;
- (NSDictionary)_PSKnnModelMinimumOccurenceOfInteractionByMechanism;
- (_CDInteractionCache)messageInteractionCache;
- (_CDInteractionCache)shareInteractionCache;
- (_CDInteractionStore)interactionStore;
- (_DKKnowledgeQuerying)knowledgeStore;
- (_PSContactResolver)contactResolver;
- (_PSKNNModel)initWithK:(unint64_t)a3 interactionStore:(id)a4 filterByBundleIds:(id)a5 knowledgeStore:(id)a6 contactResolver:(id)a7 messageInteractionCache:(id)a8 shareInteractionCache:(id)a9;
- (double)distanceOfNeighbor:(id)a3 fromReference:(id)a4;
- (double)jaccardDistanceFromSetBasedReference:(id)a3 neighbor:(id)a4;
- (id)_featureVectorFromSuggestionDate:(id)a3 bundleID:(id)a4 peopleInPhotoIdentifiers:(id)a5 scenesInPhotoIdentifiers:(id)a6;
- (id)_rankedZkwSuggestionsWithPredictionContext:(id)a3 bundleId:(id)a4 maxSuggestions:(unint64_t)a5 frequencyOnly:(BOOL)a6 interactions:(id)a7 interactionCache:(id)a8;
- (id)candidatePropertyFromCandidates:(id)a3;
- (id)contactKeysToFetch;
- (id)extractNearestNeighborLabelsForQueryResult:(id)a3 andNeighbors:(id)a4 frequencyOnly:(BOOL)a5 rankerType:(int64_t)a6 contactsOnly:(BOOL)a7 reason:(id)a8;
- (id)extractNearestNeighborsForMapsQueryResult:(id)a3 andNeighbors:(id)a4 frequencyOnly:(BOOL)a5;
- (id)featureVectorFromAbsolutePredictionTime:(double)a3 bundleId:(id)a4;
- (id)featureVectorFromInteraction:(id)a3;
- (id)featureVectorFromPredictionContext:(id)a3;
- (id)featureVectorFromPredictionDate:(id)a3 bundleId:(id)a4;
- (id)featuresFromInteractions:(id)a3;
- (id)featuresFromInteractionsSplitRecipients:(id)a3;
- (id)featuresFromMapsFeedbackEvents:(id)a3;
- (id)filterShareInteractions:(id)a3 minimumOccurencesByMechanism:(id)a4 contextBundleId:(id)a5 filterOutNonMatchingSourceBundleIDs:(BOOL)a6;
- (id)filterSuggestionsFrom:(id)a3 byFilteringOutSeedRecipients:(id)a4;
- (id)indexesOfObjectsWithKey:(id)a3 withValues:(id)a4 inArray:(id)a5;
- (id)interactionLabelsForQueryResult:(id)a3 queryPoint:(id)a4 rankerType:(int64_t)a5 frequencyOnly:(BOOL)a6 contactsOnly:(BOOL)a7;
- (id)mapsShareEtaDefaultKnnSuggestions:(id)a3 maxSuggestions:(unint64_t)a4;
- (id)mergedSuggestionsFromShares:(id)a3 andInteractions:(id)a4;
- (id)messagesGroupResultsForPredictionContext:(id)a3;
- (id)messagesGroupsMatchingSearchPrefix:(id)a3 inInteractions:(id)a4;
- (id)neighborsFromTrainingData:(id)a3 k:(unint64_t)a4 queryPoint:(id)a5;
- (id)normalizedScoresForInputDictionary:(id)a3;
- (id)normalizedStringFromString:(id)a3;
- (id)rankedAutocompleteSuggestionsWithPredictionContext:(id)a3 candidates:(id)a4;
- (id)rankedCoRecipientSuggestionsWithPredictionContext:(id)a3 modelConfiguration:(id)a4 maxSuggestions:(unint64_t)a5;
- (id)rankedGlobalSuggestionsForSiriNLWithPredictionContext:(id)a3 maxSuggestions:(unint64_t)a4;
- (id)rankedGlobalSuggestionsWithPredictionContext:(id)a3 maxSuggestions:(unint64_t)a4 contactsOnly:(BOOL)a5 interactions:(id)a6 contactIdIsInStoreBlock:(id)a7;
- (id)rankedHandlesFromCandidateHandles:(id)a3;
- (id)rankedLabelsFromInteractionsForPhoneCallsWithInteractions:(id)a3 andDistances:(id)a4;
- (id)rankedLabelsFromInteractionsMaintainRecipientsArray:(id)a3 andDistances:(id)a4 freqOnly:(BOOL)a5;
- (id)rankedLabelsFromInteractionsSingleRecipientArray:(id)a3 andDistances:(id)a4 freqOnly:(BOOL)a5 contactsOnly:(BOOL)a6 scoreLikeShareSheet:(BOOL)a7;
- (id)rankedLabelsFromInteractionsSiriNLWithInteractions:(id)a3 andDistances:(id)a4 freqOnly:(BOOL)a5;
- (id)rankedMapsShareEtaSuggestions:(id)a3 maxSuggestions:(unint64_t)a4;
- (id)rankedMessagesAutocompleteSuggestionsWithPredictionContext:(id)a3 bundleId:(id)a4 candidates:(id)a5;
- (id)rankedNameSuggestionsWithPredictionContext:(id)a3 forName:(id)a4;
- (id)rankedNameSuggestionsWithPredictionContext:(id)a3 forName:(id)a4 contactsOnly:(BOOL)a5;
- (id)rankedNonMessagesAutocompleteSuggestionsWithPredictionContext:(id)a3 bundleId:(id)a4 candidates:(id)a5 performSecondarySearch:(BOOL)a6;
- (id)rankedPhoneCallAutocompleteSuggestionsWithPredictionContext:(id)a3 candidates:(id)a4;
- (id)rankedSiriMLCRHandles:(id)a3 context:(id)a4;
- (id)rankedSuggestionsWithPredictionContext:(id)a3 bundleId:(id)a4 maxSuggestions:(unint64_t)a5 frequencyOnly:(BOOL)a6 interactions:(id)a7;
- (id)rankedZkwSuggestionsWithPredictionContext:(id)a3 modelConfiguration:(id)a4 maxSuggestions:(unint64_t)a5;
- (id)recipientsForChat:(id)a3;
- (id)sliceStart:(unint64_t)a3 end:(unint64_t)a4 ofArray:(id)a5;
- (id)softmaxAppliedOnScoresForInputDictionary:(id)a3;
- (id)splitShareLabels:(id)a3 suggestionDate:(id)a4 contextBundleId:(id)a5;
- (id)suggestionProxiesBasedOnNonSharingInteractionsWithPredictionContext:(id)a3;
- (id)suggestionProxiesBasedOnSharingInteractionsWithPredictionContext:(id)a3 withOnlyTopShares:(BOOL)a4 withFilterOutNonMatchingSourceBundleIDs:(BOOL)a5;
- (id)suggestionProxiesWithPredictionContext:(id)a3;
- (id)suggestionsByUpdatingGroupNamesFromSuggestions:(id)a3 imCoreTimeBudget:(double)a4;
- (id)targetBundleIdsForFilterBundlesIds:(id)a3;
- (int64_t)suggestionExists:(id)a3 withValue:(id)a4 inArray:(id)a5;
- (unint64_t)_PSKnnMessagesZkwTopNFilter;
- (unint64_t)_PSKnnModelDifferentPeoplePenalty;
- (unint64_t)_PSKnnModelGroupActivitiesMinimumOccuranceRegularizer;
- (unint64_t)_PSKnnModelRecencyMarginToPromoteShares;
- (unint64_t)_PSKnnModelRecencyMarginToPromoteSharesMatchingBundleId;
- (unint64_t)_PSKnnModelRecencyMarginToRetainGroupActivities;
- (unint64_t)_PSKnnModelRecencyMarginToRetainShares;
- (unint64_t)_PSKnnModelSameBundleIdPenalty;
- (unint64_t)_PSKnnModelSharePlayMinimumOccurenceRegularizer;
- (unint64_t)_PSKnnModelShareSheetMinimumOccurenceRegularizer;
- (unint64_t)_PSKnnModelShareSheetSuggestionEngagedMinimumOccurenceRegularizer;
- (unint64_t)_PSKnnTopKGroupActivities;
- (unint64_t)_PSKnnTopKShares;
- (unint64_t)indexToInsertNeighbor:(id)a3 array:(id)a4;
- (unint64_t)k;
- (void)setMessageInteractionCache:(id)a3;
- (void)setShareInteractionCache:(id)a3;
- (void)set_PSInteractionModelInUse:(BOOL)a3;
- (void)set_PSKnnMessagesZkwTopNFilter:(unint64_t)a3;
- (void)set_PSKnnModelDifferentPeoplePenalty:(unint64_t)a3;
- (void)set_PSKnnModelGroupActivitiesMinimumOccuranceRegularizer:(unint64_t)a3;
- (void)set_PSKnnModelMinimumOccurenceOfInteractionByMechanism:(id)a3;
- (void)set_PSKnnModelRecencyMarginToPromoteShares:(unint64_t)a3;
- (void)set_PSKnnModelRecencyMarginToPromoteSharesMatchingBundleId:(unint64_t)a3;
- (void)set_PSKnnModelRecencyMarginToRetainGroupActivities:(unint64_t)a3;
- (void)set_PSKnnModelRecencyMarginToRetainShares:(unint64_t)a3;
- (void)set_PSKnnModelSameBundleIdPenalty:(unint64_t)a3;
- (void)set_PSKnnModelSharePlayMinimumOccurenceRegularizer:(unint64_t)a3;
- (void)set_PSKnnModelShareSheetMinimumOccurenceRegularizer:(unint64_t)a3;
- (void)set_PSKnnModelShareSheetSuggestionEngagedMinimumOccurenceRegularizer:(unint64_t)a3;
- (void)set_PSKnnTopKGroupActivities:(unint64_t)a3;
- (void)set_PSKnnTopKShares:(unint64_t)a3;
- (void)updateModelProperties:(id)a3;
@end

@implementation _PSKNNModel

- (id)rankedPhoneCallAutocompleteSuggestionsWithPredictionContext:(id)a3 candidates:(id)a4
{
  v71[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v7 && [v7 count])
  {
    if ([v8 count] == 1)
    {
      id v9 = v8;
    }
    else
    {
      v10 = +[_PSLogging suggestionSignpost];
      if (os_signpost_enabled(v10))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A314B000, v10, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "rankedPhoneCallAutocompleteSuggestionsWithPredictionContext", " enableTelemetry=YES ", buf, 2u);
      }

      v11 = +[_PSLogging knnChannel];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138477827;
        unint64_t v64 = (unint64_t)v8;
        _os_log_impl(&dword_1A314B000, v11, OS_LOG_TYPE_DEFAULT, "Autocomplete candidates for PhoneCalls: %{private}@", buf, 0xCu);
      }

      v49 = [(_PSKNNModel *)self candidatePropertyFromCandidates:v8];
      v12 = [v49 allKeys];
      v53 = self;
      if ([v12 count])
      {
        v13 = +[_PSConstants mobilePhoneBundleId];
        v71[0] = v13;
        v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v71 count:1];
        v15 = [(_PSKNNModel *)v53 interactionStore];
        uint64_t v16 = +[_PSInteractionStoreUtils interactionsMatchingAnyHandlesOrDomainIds:v12 account:0 directions:&unk_1EF675F60 mechanisms:&unk_1EF675F78 bundleIds:v14 store:v15 fetchLimit:500];

        self = v53;
        v17 = (void *)v16;
      }
      else
      {
        v17 = 0;
      }
      v48 = v12;
      v18 = [v6 bundleID];
      id v51 = v6;
      v47 = v17;
      v19 = -[_PSKNNModel rankedSuggestionsWithPredictionContext:bundleId:maxSuggestions:frequencyOnly:interactions:](self, "rankedSuggestionsWithPredictionContext:bundleId:maxSuggestions:frequencyOnly:interactions:", v6, v18, [v8 count], 0, v17);

      v20 = +[_PSLogging knnChannel];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138477827;
        unint64_t v64 = (unint64_t)v19;
        _os_log_impl(&dword_1A314B000, v20, OS_LOG_TYPE_INFO, "Suggestions from rankedSuggestionsWithPredictionContext: %{private}@", buf, 0xCu);
      }

      v52 = [MEMORY[0x1E4F1CA48] array];
      v50 = v8;
      v21 = (void *)[v8 mutableCopy];
      long long v59 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      obuint64_t j = v19;
      uint64_t v22 = [obj countByEnumeratingWithState:&v59 objects:v70 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v60;
        do
        {
          for (uint64_t i = 0; i != v23; ++i)
          {
            if (*(void *)v60 != v24) {
              objc_enumerationMutation(obj);
            }
            v26 = *(void **)(*((void *)&v59 + 1) + 8 * i);
            v27 = [v26 recipients];
            if ([v27 count] == 1)
            {
              v28 = [v26 recipients];
              v29 = [v28 firstObject];
              v30 = [v29 handle];
              uint64_t v31 = [(_PSKNNModel *)v53 suggestionExists:@"handle" withValue:v30 inArray:v21];

              if (v31 != 0x7FFFFFFFFFFFFFFFLL)
              {
                v32 = [v26 recipients];
                v33 = [v21 objectAtIndexedSubscript:v31];
                [v33 setRecipients:v32];

                v34 = [v21 objectAtIndexedSubscript:v31];
                [v34 setResultSourceType:16];

                v35 = [v21 objectAtIndexedSubscript:v31];
                [v52 addObject:v35];

                [v21 removeObjectAtIndex:v31];
              }
            }
            else
            {
            }
          }
          uint64_t v23 = [obj countByEnumeratingWithState:&v59 objects:v70 count:16];
        }
        while (v23);
      }

      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      id v36 = v21;
      uint64_t v37 = [v36 countByEnumeratingWithState:&v55 objects:v69 count:16];
      id v9 = v52;
      if (v37)
      {
        uint64_t v38 = v37;
        uint64_t v39 = *(void *)v56;
        do
        {
          for (uint64_t j = 0; j != v38; ++j)
          {
            if (*(void *)v56 != v39) {
              objc_enumerationMutation(v36);
            }
            [v52 addObject:*(void *)(*((void *)&v55 + 1) + 8 * j)];
          }
          uint64_t v38 = [v36 countByEnumeratingWithState:&v55 objects:v69 count:16];
        }
        while (v38);
      }

      unint64_t v41 = [v52 count];
      v42 = +[_PSLogging knnChannel];
      v8 = v50;
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        if (v41 >= 0xA) {
          unint64_t v41 = 10;
        }
        v43 = objc_msgSend(v52, "subarrayWithRange:", 0, v41);
        uint64_t v44 = [v50 count];
        *(_DWORD *)buf = 134218498;
        unint64_t v64 = v41;
        __int16 v65 = 2112;
        v66 = v43;
        __int16 v67 = 2048;
        uint64_t v68 = v44;
        _os_log_impl(&dword_1A314B000, v42, OS_LOG_TYPE_INFO, "Autocomplete Top %lu results: %@ for candidates %lu", buf, 0x20u);
      }
      v45 = +[_PSLogging suggestionSignpost];
      id v6 = v51;
      if (os_signpost_enabled(v45))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A314B000, v45, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "rankedPhoneCallAutocompleteSuggestionsWithPredictionContext", (const char *)&unk_1A3274816, buf, 2u);
      }
    }
  }
  else
  {
    id v9 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v9;
}

- (id)rankedLabelsFromInteractionsForPhoneCallsWithInteractions:(id)a3 andDistances:(id)a4
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v44 = a4;
  v45 = [MEMORY[0x1E4F1CA60] dictionary];
  int64_t v6 = +[_PSPrivacyDataRetentionPeriod lookbackDurationInDays];
  if ([v5 count])
  {
    unint64_t v7 = 0;
    v8 = &off_1E5ADE000;
    double v9 = (double)(unint64_t)(86400 * v6);
    v43 = v5;
    do
    {
      long long v54 = 0u;
      long long v55 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      obuint64_t j = [v5 objectAtIndexedSubscript:v7];
      uint64_t v10 = [obj countByEnumeratingWithState:&v52 objects:v59 count:16];
      if (!v10) {
        goto LABEL_14;
      }
      uint64_t v11 = v10;
      uint64_t v47 = *(void *)v53;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v53 != v47) {
            objc_enumerationMutation(obj);
          }
          v13 = *(void **)(*((void *)&v52 + 1) + 8 * i);
          v14 = [v13 bundleId];
          v15 = [v8[121] mobilePhoneBundleId];
          if ([v14 isEqualToString:v15])
          {
            uint64_t v16 = [v13 derivedIntentIdentifier];

            if (!v16) {
              continue;
            }
            v14 = [MEMORY[0x1E4F1CA60] dictionary];
            v17 = [v13 derivedIntentIdentifier];
            [v14 setObject:v17 forKeyedSubscript:@"conversationId"];

            v18 = [v13 bundleId];
            [v14 setObject:v18 forKeyedSubscript:@"bundleId"];

            v19 = [v13 bundleId];
            [v14 setObject:v19 forKeyedSubscript:@"sourceBundleId"];

            v20 = [v13 startDate];
            [v14 setObject:v20 forKeyedSubscript:@"startDate"];

            v21 = [v14 objectForKeyedSubscript:@"bundleId"];
            uint64_t v22 = [v13 derivedIntentIdentifier];
            v15 = _PSSuggestionKey(v21, v22);

            uint64_t v23 = [v45 objectForKeyedSubscript:v15];
            uint64_t v24 = [v23 objectForKeyedSubscript:@"score"];

            v25 = NSNumber;
            [v24 doubleValue];
            double v27 = v26;
            [v44 objectAtIndexedSubscript:v7];
            v29 = unint64_t v28 = v7;
            [v29 doubleValue];
            uint64_t v31 = [v25 numberWithDouble:v27 + v9 / v30];

            v57[0] = @"score";
            v57[1] = @"key";
            v58[0] = v31;
            v58[1] = v14;
            v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v58 forKeys:v57 count:2];
            v8 = &off_1E5ADE000;
            [v45 setObject:v32 forKeyedSubscript:v15];

            unint64_t v7 = v28;
          }
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v52 objects:v59 count:16];
      }
      while (v11);
LABEL_14:

      ++v7;
      id v5 = v43;
    }
    while ([v43 count] > v7);
  }
  v33 = [v45 keysSortedByValueUsingComparator:&__block_literal_global_6];
  v34 = [MEMORY[0x1E4F1CA48] array];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v35 = v33;
  uint64_t v36 = [v35 countByEnumeratingWithState:&v48 objects:v56 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = *(void *)v49;
    do
    {
      for (uint64_t j = 0; j != v37; ++j)
      {
        if (*(void *)v49 != v38) {
          objc_enumerationMutation(v35);
        }
        v40 = [v45 objectForKeyedSubscript:*(void *)(*((void *)&v48 + 1) + 8 * j)];
        unint64_t v41 = [v40 objectForKeyedSubscript:@"key"];
        [v34 addObject:v41];
      }
      uint64_t v37 = [v35 countByEnumeratingWithState:&v48 objects:v56 count:16];
    }
    while (v37);
  }

  return v34;
}

- (int64_t)suggestionExists:(id)a3 withValue:(id)a4 inArray:(id)a5
{
  if (!a4) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  unint64_t v7 = (void *)MEMORY[0x1E4F28F60];
  id v8 = a5;
  double v9 = [v7 predicateWithFormat:@"%K ==[c] %@", a3, a4];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __80___PSKNNModel_PhoneAutocompleteSuggestions__suggestionExists_withValue_inArray___block_invoke;
  v13[3] = &unk_1E5ADF730;
  id v14 = v9;
  id v10 = v9;
  int64_t v11 = [v8 indexOfObjectPassingTest:v13];

  return v11;
}

- (id)candidatePropertyFromCandidates:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    id v10 = (void *)MEMORY[0x1E4F1CBF0];
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "chatGuid", (void)v19);

        if (v13)
        {
          id v14 = [v12 chatHandles];
          if (v14)
          {
            v3 = [v12 chatHandles];
            v15 = v3;
          }
          else
          {
            v15 = v10;
          }
          v17 = [v12 chatGuid];
          [v5 setObject:v15 forKeyedSubscript:v17];

          if (v14) {
        }
          }
        else
        {
          uint64_t v16 = [v12 handle];

          if (!v16) {
            continue;
          }
          id v14 = [v12 handle];
          [v5 setObject:v10 forKeyedSubscript:v14];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }

  return v5;
}

- (_PSKNNModel)initWithK:(unint64_t)a3 interactionStore:(id)a4 filterByBundleIds:(id)a5 knowledgeStore:(id)a6 contactResolver:(id)a7 messageInteractionCache:(id)a8 shareInteractionCache:(id)a9
{
  id v29 = a4;
  id v28 = a5;
  id v27 = a6;
  id v26 = a7;
  id v16 = a8;
  id v17 = a9;
  v18 = [(_PSKNNModel *)self init];
  long long v19 = v18;
  if (v18)
  {
    v18->_k = a3;
    objc_storeStrong((id *)&v18->_interactionStore, a4);
    objc_storeStrong((id *)&v19->_filterBundleIds, a5);
    objc_storeStrong((id *)&v19->_knowledgeStore, a6);
    objc_storeStrong((id *)&v19->_contactResolver, a7);
    objc_storeStrong((id *)&v19->_messageInteractionCache, a8);
    objc_storeStrong((id *)&v19->_shareInteractionCache, a9);
    uint64_t v30 = 0;
    uint64_t v31 = &v30;
    uint64_t v32 = 0x2050000000;
    long long v20 = (void *)getCNContactStoreClass_softClass_4;
    uint64_t v33 = getCNContactStoreClass_softClass_4;
    if (!getCNContactStoreClass_softClass_4)
    {
      ContactsLibraryCore_6();
      v31[3] = (uint64_t)objc_getClass("CNContactStore");
      getCNContactStoreClass_softClass_4 = v31[3];
      long long v20 = (void *)v31[3];
    }
    long long v21 = v20;
    _Block_object_dispose(&v30, 8);
    long long v22 = (CNContactStore *)objc_alloc_init(v21);
    contactStore = v19->_contactStore;
    v19->_contactStore = v22;

    uint64_t v24 = +[_PSConfig defaultConfig];
    [(_PSKNNModel *)v19 updateModelProperties:v24];
  }
  return v19;
}

- (void)updateModelProperties:(id)a3
{
  v39[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  uint64_t v7 = [v4 objectForKeyedSubscript:v6];

  uint64_t v8 = [v7 objectForKeyedSubscript:@"_PSKnnTopKShares"];
  -[_PSKNNModel set_PSKnnTopKShares:](self, "set_PSKnnTopKShares:", [v8 integerValue]);

  uint64_t v9 = [v7 objectForKeyedSubscript:@"_PSKnnMessagesZkwTopNFilter"];
  -[_PSKNNModel set_PSKnnMessagesZkwTopNFilter:](self, "set_PSKnnMessagesZkwTopNFilter:", [v9 integerValue]);

  id v10 = [v7 objectForKeyedSubscript:@"_PSKnnModelRecencyMarginToPromoteShares"];
  -[_PSKNNModel set_PSKnnModelRecencyMarginToPromoteShares:](self, "set_PSKnnModelRecencyMarginToPromoteShares:", [v10 integerValue]);

  int64_t v11 = [v7 objectForKeyedSubscript:@"_PSKnnModelRecencyMarginToPromoteSharesMatchingBundleId"];
  -[_PSKNNModel set_PSKnnModelRecencyMarginToPromoteSharesMatchingBundleId:](self, "set_PSKnnModelRecencyMarginToPromoteSharesMatchingBundleId:", [v11 integerValue]);

  v12 = [v7 objectForKeyedSubscript:@"_PSKnnModelRecencyMarginToRetainShares"];
  -[_PSKNNModel set_PSKnnModelRecencyMarginToRetainShares:](self, "set_PSKnnModelRecencyMarginToRetainShares:", [v12 integerValue]);

  v13 = [v7 objectForKeyedSubscript:@"_PSKnnTopKGroupActivities"];
  id v14 = v13;
  if (!v13) {
    v13 = &unk_1EF675618;
  }
  -[_PSKNNModel set_PSKnnTopKGroupActivities:](self, "set_PSKnnTopKGroupActivities:", [v13 integerValue]);

  v15 = [v7 objectForKeyedSubscript:@"_PSKnnModelRecencyMarginToRetainGroupActivities"];
  id v16 = v15;
  if (!v15) {
    v15 = &unk_1EF675630;
  }
  -[_PSKNNModel set_PSKnnModelRecencyMarginToRetainGroupActivities:](self, "set_PSKnnModelRecencyMarginToRetainGroupActivities:", [v15 integerValue]);

  id v17 = [v7 objectForKeyedSubscript:@"_PSKnnModelGroupActivitiesMinimumOccuranceRegularizer"];
  v18 = v17;
  if (!v17) {
    id v17 = &unk_1EF675648;
  }
  -[_PSKNNModel set_PSKnnModelGroupActivitiesMinimumOccuranceRegularizer:](self, "set_PSKnnModelGroupActivitiesMinimumOccuranceRegularizer:", [v17 integerValue]);

  long long v19 = [v7 objectForKeyedSubscript:@"_PSKnnModelShareSheetMinimumOccurenceRegularizer"];
  long long v20 = v19;
  if (!v19) {
    long long v19 = &unk_1EF675660;
  }
  -[_PSKNNModel set_PSKnnModelShareSheetMinimumOccurenceRegularizer:](self, "set_PSKnnModelShareSheetMinimumOccurenceRegularizer:", [v19 integerValue]);

  long long v21 = [v7 objectForKeyedSubscript:@"_PSKnnModelShareSheetSuggestionPressedMinimumOccurenceRegularizer"];
  long long v22 = v21;
  if (v21)
  {
    id v23 = v21;
  }
  else
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[_PSKNNModel _PSKnnModelShareSheetMinimumOccurenceRegularizer](self, "_PSKnnModelShareSheetMinimumOccurenceRegularizer"));
    id v23 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v24 = v23;

  -[_PSKNNModel set_PSKnnModelShareSheetSuggestionEngagedMinimumOccurenceRegularizer:](self, "set_PSKnnModelShareSheetSuggestionEngagedMinimumOccurenceRegularizer:", [v24 integerValue]);
  v25 = [v7 objectForKeyedSubscript:@"_PSKnnModelSharePlayMinimumOccurenceRegularizer"];
  id v26 = v25;
  if (!v25) {
    v25 = &unk_1EF675648;
  }
  -[_PSKNNModel set_PSKnnModelSharePlayMinimumOccurenceRegularizer:](self, "set_PSKnnModelSharePlayMinimumOccurenceRegularizer:", [v25 integerValue]);

  v38[0] = &unk_1EF675678;
  id v27 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[_PSKNNModel _PSKnnModelShareSheetMinimumOccurenceRegularizer](self, "_PSKnnModelShareSheetMinimumOccurenceRegularizer"));
  v39[0] = v27;
  v38[1] = &unk_1EF675690;
  id v28 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[_PSKNNModel _PSKnnModelShareSheetSuggestionEngagedMinimumOccurenceRegularizer](self, "_PSKnnModelShareSheetSuggestionEngagedMinimumOccurenceRegularizer"));
  v39[1] = v28;
  v38[2] = &unk_1EF6756A8;
  id v29 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[_PSKNNModel _PSKnnModelSharePlayMinimumOccurenceRegularizer](self, "_PSKnnModelSharePlayMinimumOccurenceRegularizer"));
  v39[2] = v29;
  uint64_t v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:3];
  [(_PSKNNModel *)self set_PSKnnModelMinimumOccurenceOfInteractionByMechanism:v30];

  uint64_t v31 = [v7 objectForKeyedSubscript:@"_PSInteractionModelInUse"];
  -[_PSKNNModel set_PSInteractionModelInUse:](self, "set_PSInteractionModelInUse:", [v31 BOOLValue]);

  uint64_t v32 = [v7 objectForKeyedSubscript:@"_PSKnnModelSameBundleIdPenalty"];
  uint64_t v33 = v32;
  if (!v32) {
    uint64_t v32 = &unk_1EF6767B8;
  }
  [v32 doubleValue];
  [(_PSKNNModel *)self set_PSKnnModelSameBundleIdPenalty:(unint64_t)v34];

  id v35 = [v7 objectForKeyedSubscript:@"_PSKnnModelDifferentPeoplePenalty"];
  uint64_t v36 = v35;
  if (!v35) {
    id v35 = &unk_1EF6767B8;
  }
  [v35 doubleValue];
  [(_PSKNNModel *)self set_PSKnnModelDifferentPeoplePenalty:(unint64_t)v37];
}

- (id)rankedSiriMLCRHandles:(id)a3 context:(id)a4
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    uint64_t v8 = [v7 bundleIds];
    if (v8)
    {
      uint64_t v9 = [v7 bundleIds];
    }
    else
    {
      uint64_t v9 = 0;
    }

    int64_t v11 = [v7 suggestionDate];
    uint64_t v12 = [(_PSKNNModel *)self featureVectorFromPredictionDate:v11 bundleId:0];

    id v48 = v7;
    if ([v7 domain] == 2)
    {
      v13 = &unk_1EF676368;
    }
    else if ([v7 domain] == 1)
    {
      v13 = &unk_1EF676380;
    }
    else
    {
      v13 = 0;
    }
    id v14 = +[_PSContactResolver normalizedHandlesDictionaryFromHandles:v6];
    v15 = (void *)MEMORY[0x1E4F1CAD0];
    long long v53 = v14;
    id v16 = [v14 allValues];
    id v17 = [v15 setWithArray:v16];
    v18 = (void *)[v17 mutableCopy];

    long long v50 = v18;
    long long v19 = [v18 allObjects];
    long long v20 = [(_PSKNNModel *)self interactionStore];
    uint64_t v47 = (void *)v9;
    uint64_t v21 = +[_PSInteractionStoreUtils interactionsMatchingAnyHandles:v19 account:0 directions:0 mechanisms:v13 bundleIds:v9 store:v20 fetchLimit:5000 messageInteractionCache:0];

    v45 = (void *)v21;
    id v44 = [(_PSKNNModel *)self featuresFromInteractionsSplitRecipients:v21];
    v46 = (void *)v12;
    long long v22 = -[_PSKNNModel interactionLabelsForQueryResult:queryPoint:rankerType:frequencyOnly:contactsOnly:](self, "interactionLabelsForQueryResult:queryPoint:rankerType:frequencyOnly:contactsOnly:");
    id v23 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    obuint64_t j = v22;
    uint64_t v24 = [obj countByEnumeratingWithState:&v58 objects:v63 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v59;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v59 != v26) {
            objc_enumerationMutation(obj);
          }
          id v28 = *(void **)(*((void *)&v58 + 1) + 8 * i);
          id v29 = [v28 objectForKeyedSubscript:@"key"];
          uint64_t v30 = [v28 objectForKeyedSubscript:@"score"];
          uint64_t v31 = [v29 objectForKeyedSubscript:@"conversationId"];
          uint64_t v32 = [v23 objectForKeyedSubscript:v31];
          if (v32)
          {
          }
          else if ([v50 containsObject:v31])
          {
            [v23 setObject:v30 forKeyedSubscript:v31];
          }
        }
        uint64_t v25 = [obj countByEnumeratingWithState:&v58 objects:v63 count:16];
      }
      while (v25);
    }

    id v10 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v49 = v6;
    id v51 = v6;
    uint64_t v33 = [v51 countByEnumeratingWithState:&v54 objects:v62 count:16];
    double v34 = v53;
    if (v33)
    {
      uint64_t v35 = v33;
      uint64_t v36 = *(void *)v55;
      do
      {
        for (uint64_t j = 0; j != v35; ++j)
        {
          if (*(void *)v55 != v36) {
            objc_enumerationMutation(v51);
          }
          uint64_t v38 = *(void *)(*((void *)&v54 + 1) + 8 * j);
          uint64_t v39 = [v34 objectForKeyedSubscript:v38];
          v40 = [v23 objectForKeyedSubscript:v39];
          if (v40)
          {
            unint64_t v41 = [v34 objectForKeyedSubscript:v38];
            v42 = [v23 objectForKeyedSubscript:v41];
            [v10 setObject:v42 forKeyedSubscript:v38];

            double v34 = v53;
          }
          else
          {
            [v10 setObject:&unk_1EF675798 forKeyedSubscript:v38];
          }
        }
        uint64_t v35 = [v51 countByEnumeratingWithState:&v54 objects:v62 count:16];
      }
      while (v35);
    }

    id v7 = v48;
    id v6 = v49;
  }
  else
  {
    id v10 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v10;
}

- (id)rankedHandlesFromCandidateHandles:(id)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    v42 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v5 = -[_PSKNNModel featureVectorFromPredictionDate:bundleId:](self, "featureVectorFromPredictionDate:bundleId:");
    v43 = v4;
    id v6 = +[_PSContactResolver normalizedHandlesDictionaryFromHandles:v4];
    id v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v47 = v6;
    uint64_t v8 = [v6 allValues];
    uint64_t v9 = [v7 setWithArray:v8];
    id v10 = (void *)[v9 mutableCopy];

    id v44 = v10;
    int64_t v11 = [v10 allObjects];
    uint64_t v12 = [(_PSKNNModel *)self interactionStore];
    uint64_t v13 = +[_PSInteractionStoreUtils interactionsMatchingAnyHandles:v11 account:0 directions:0 mechanisms:0 bundleIds:0 store:v12 fetchLimit:5000 messageInteractionCache:0];

    uint64_t v39 = (void *)v13;
    [(_PSKNNModel *)self featuresFromInteractionsSplitRecipients:v13];
    v40 = self;
    uint64_t v38 = v41 = (void *)v5;
    id v14 = -[_PSKNNModel interactionLabelsForQueryResult:queryPoint:rankerType:frequencyOnly:contactsOnly:](self, "interactionLabelsForQueryResult:queryPoint:rankerType:frequencyOnly:contactsOnly:");
    v15 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    obuint64_t j = v14;
    uint64_t v16 = [obj countByEnumeratingWithState:&v52 objects:v57 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v53;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v53 != v18) {
            objc_enumerationMutation(obj);
          }
          long long v20 = *(void **)(*((void *)&v52 + 1) + 8 * i);
          uint64_t v21 = [v20 objectForKeyedSubscript:@"key"];
          long long v22 = [v20 objectForKeyedSubscript:@"score"];
          id v23 = [v21 objectForKeyedSubscript:@"conversationId"];
          uint64_t v24 = [v15 objectForKeyedSubscript:v23];
          if (v24)
          {
          }
          else if ([v44 containsObject:v23])
          {
            [v15 setObject:v22 forKeyedSubscript:v23];
          }
        }
        uint64_t v17 = [obj countByEnumeratingWithState:&v52 objects:v57 count:16];
      }
      while (v17);
    }

    uint64_t v25 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v45 = v43;
    uint64_t v26 = [v45 countByEnumeratingWithState:&v48 objects:v56 count:16];
    id v27 = v47;
    if (v26)
    {
      uint64_t v28 = v26;
      uint64_t v29 = *(void *)v49;
      do
      {
        for (uint64_t j = 0; j != v28; ++j)
        {
          if (*(void *)v49 != v29) {
            objc_enumerationMutation(v45);
          }
          uint64_t v31 = *(void *)(*((void *)&v48 + 1) + 8 * j);
          uint64_t v32 = [v27 objectForKeyedSubscript:v31];
          uint64_t v33 = [v15 objectForKeyedSubscript:v32];
          if (v33)
          {
            double v34 = [v27 objectForKeyedSubscript:v31];
            uint64_t v35 = [v15 objectForKeyedSubscript:v34];
            [v25 setObject:v35 forKeyedSubscript:v31];

            id v27 = v47;
          }
          else
          {
            [v25 setObject:&unk_1EF675798 forKeyedSubscript:v31];
          }
        }
        uint64_t v28 = [v45 countByEnumeratingWithState:&v48 objects:v56 count:16];
      }
      while (v28);
    }

    uint64_t v36 = [(_PSKNNModel *)v40 normalizedScoresForInputDictionary:v25];

    id v4 = v43;
  }
  else
  {
    uint64_t v36 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v36;
}

- (id)rankedAutocompleteSuggestionsWithPredictionContext:(id)a3 candidates:(id)a4
{
  v30[4] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = +[_PSLogging knnChannel];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A314B000, v7, OS_LOG_TYPE_INFO, "Autocomplete request received", buf, 2u);
  }

  uint64_t v8 = [v5 bundleID];
  uint64_t v9 = +[_PSConstants mobileMessagesComposeBundleId];
  int v10 = [v8 isEqualToString:v9];

  if (v10)
  {
    uint64_t v11 = +[_PSConstants mobileMessagesBundleId];

    uint64_t v8 = (void *)v11;
  }
  uint64_t v12 = +[_PSConstants mobileMessagesBundleId];
  v30[0] = v12;
  uint64_t v13 = +[_PSConstants macMessagesBundleId];
  v30[1] = v13;
  id v14 = +[_PSConstants mobileFacetimeBundleId];
  v30[2] = v14;
  v15 = +[_PSConstants macFacetimeBundleId];
  v30[3] = v15;
  uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:4];

  uint64_t v17 = +[_PSConstants mobilePhoneBundleId];
  LODWORD(v13) = [v8 isEqualToString:v17];

  if (v13)
  {
    uint64_t v18 = +[_PSLogging knnChannel];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A314B000, v18, OS_LOG_TYPE_INFO, "Autocomplete Suggestions for InCallService", buf, 2u);
    }

    uint64_t v19 = [(_PSKNNModel *)self rankedPhoneCallAutocompleteSuggestionsWithPredictionContext:v5 candidates:v6];
LABEL_13:
    id v23 = (void *)v19;
    goto LABEL_17;
  }
  int v20 = [v16 containsObject:v8];
  uint64_t v21 = +[_PSLogging knnChannel];
  BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_INFO);
  if (v20)
  {
    if (v22)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A314B000, v21, OS_LOG_TYPE_INFO, "Autocomplete Suggestions for Messages", buf, 2u);
    }

    uint64_t v19 = [(_PSKNNModel *)self rankedMessagesAutocompleteSuggestionsWithPredictionContext:v5 bundleId:v8 candidates:v6];
    goto LABEL_13;
  }
  if (v22)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A314B000, v21, OS_LOG_TYPE_INFO, "Autocomplete Suggestions for Non-Messages", buf, 2u);
  }

  uint64_t v24 = [(_PSKNNModel *)self rankedNonMessagesAutocompleteSuggestionsWithPredictionContext:v5 bundleId:v8 candidates:v6 performSecondarySearch:1];
  uint64_t v25 = [v24 objectForKeyedSubscript:@"ranked"];
  uint64_t v26 = [v24 objectForKeyedSubscript:@"unranked"];
  id v23 = [v25 arrayByAddingObjectsFromArray:v26];

LABEL_17:

  return v23;
}

- (id)rankedNonMessagesAutocompleteSuggestionsWithPredictionContext:(id)a3 bundleId:(id)a4 candidates:(id)a5 performSecondarySearch:(BOOL)a6
{
  BOOL v6 = a6;
  v81[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = [v10 suggestionDate];
  id v14 = [v10 bundleID];
  uint64_t v15 = [(_PSKNNModel *)self featureVectorFromPredictionDate:v13 bundleId:v14];

  v69 = self;
  uint64_t v16 = [(_PSKNNModel *)self candidatePropertyFromCandidates:v12];
  uint64_t v17 = [v16 allKeys];

  v63 = v17;
  uint64_t v18 = [v17 count];
  uint64_t v19 = 0;
  if (v11 && v18)
  {
    int v20 = [v10 accountIdentifier];
    v81[0] = v11;
    uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v81 count:1];
    BOOL v22 = [(_PSKNNModel *)v69 interactionStore];
    id v23 = +[_PSInteractionStoreUtils interactionsMatchingAnyHandlesOrDomainIds:v63 account:v20 directions:&unk_1EF676398 mechanisms:0 bundleIds:v21 store:v22 fetchLimit:500];

    if (v6)
    {
      uint64_t v19 = v23;
      if (![v23 count])
      {
        uint64_t v24 = [v10 accountIdentifier];
        uint64_t v25 = [(_PSKNNModel *)v69 interactionStore];
        uint64_t v26 = +[_PSInteractionStoreUtils interactionsMatchingAnyHandlesOrDomainIds:v63 account:v24 directions:&unk_1EF6763B0 mechanisms:0 bundleIds:0 store:v25 fetchLimit:500];

        uint64_t v19 = (void *)v26;
      }
    }
    else
    {
      uint64_t v19 = v23;
    }
  }
  long long v61 = v11;
  long long v62 = v10;
  uint64_t v58 = v19;
  long long v57 = [(_PSKNNModel *)v69 featuresFromInteractionsSplitRecipients:v19];
  long long v59 = (void *)v15;
  id v27 = -[_PSKNNModel interactionLabelsForQueryResult:queryPoint:rankerType:frequencyOnly:contactsOnly:](v69, "interactionLabelsForQueryResult:queryPoint:rankerType:frequencyOnly:contactsOnly:");
  __int16 v65 = [MEMORY[0x1E4F1CA48] array];
  long long v60 = v12;
  uint64_t v28 = (void *)[v12 mutableCopy];
  unint64_t v64 = [v27 count];
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  obuint64_t j = v27;
  uint64_t v29 = [obj countByEnumeratingWithState:&v70 objects:v80 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    unint64_t v68 = 0;
    uint64_t v31 = @"key";
    uint64_t v32 = *(void *)v71;
    uint64_t v33 = @"conversationId";
    double v34 = @"handle";
    do
    {
      uint64_t v35 = 0;
      uint64_t v66 = v30;
      do
      {
        if (*(void *)v71 != v32) {
          objc_enumerationMutation(obj);
        }
        uint64_t v36 = [*(id *)(*((void *)&v70 + 1) + 8 * v35) objectForKeyedSubscript:v31];
        double v37 = [v36 objectForKeyedSubscript:v33];

        uint64_t v38 = [(_PSKNNModel *)v69 suggestionExists:v34 withValue:v37 inArray:v28];
        if (v38 != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v39 = v38;
          v40 = v34;
          unint64_t v41 = v33;
          v42 = v31;
          v43 = v28;
          id v44 = [v28 objectAtIndexedSubscript:v38];
          [v44 setResultSourceType:16];

          if (v64 >= 3
            && v68 <= 2
            && ([v28 objectAtIndexedSubscript:v39],
                id v45 = objc_claimAutoreleasedReturnValue(),
                [v45 contactIdentifier],
                v46 = objc_claimAutoreleasedReturnValue(),
                v46,
                v45,
                v46))
          {
            uint64_t v47 = [v43 objectAtIndexedSubscript:v39];
            [v65 insertObject:v47 atIndex:v68];

            ++v68;
            uint64_t v28 = v43;
          }
          else
          {
            uint64_t v28 = v43;
            long long v48 = [v43 objectAtIndexedSubscript:v39];
            [v65 addObject:v48];
          }
          [v28 removeObjectAtIndex:v39];
          uint64_t v31 = v42;
          uint64_t v33 = v41;
          double v34 = v40;
          uint64_t v30 = v66;
        }

        ++v35;
      }
      while (v30 != v35);
      uint64_t v30 = [obj countByEnumeratingWithState:&v70 objects:v80 count:16];
    }
    while (v30);
  }

  long long v49 = +[_PSLogging knnChannel];
  if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
  {
    unint64_t v50 = [v65 count];
    if (v50 >= 5) {
      uint64_t v51 = 5;
    }
    else {
      uint64_t v51 = v50;
    }
    long long v52 = objc_msgSend(v65, "subarrayWithRange:", 0, v51);
    uint64_t v53 = [v60 count];
    *(_DWORD *)buf = 138412546;
    v77 = v52;
    __int16 v78 = 2048;
    uint64_t v79 = v53;
    _os_log_impl(&dword_1A314B000, v49, OS_LOG_TYPE_INFO, "Autocomplete Top 5 results: %@ for candidates %lu", buf, 0x16u);
  }
  v74[0] = @"ranked";
  v74[1] = @"unranked";
  v75[0] = v65;
  long long v54 = (void *)[v28 copy];
  v75[1] = v54;
  long long v55 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v75 forKeys:v74 count:2];

  return v55;
}

- (id)rankedMessagesAutocompleteSuggestionsWithPredictionContext:(id)a3 bundleId:(id)a4 candidates:(id)a5
{
  v183[2] = *MEMORY[0x1E4F143B8];
  id v141 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    id v140 = v9;
    if ([v9 count])
    {
      id v10 = &off_1E5ADE000;
      id v11 = +[_PSLogging suggestionSignpost];
      if (os_signpost_enabled(v11))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A314B000, v11, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "rankedMessagesAutocompleteSuggestionsWithPredictionContext", " enableTelemetry=YES ", buf, 2u);
      }

      id v12 = +[_PSLogging knnChannel];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138477827;
        unint64_t v173 = (unint64_t)v140;
        _os_log_impl(&dword_1A314B000, v12, OS_LOG_TYPE_DEFAULT, "Autocomplete candidates: %{private}@", buf, 0xCu);
      }

      v136 = [(_PSKNNModel *)self candidatePropertyFromCandidates:v140];
      uint64_t v13 = [v136 allKeys];
      id v14 = v141;
      v134 = [v141 seedRecipients];
      v135 = v13;
      if ([v13 count])
      {
        uint64_t v15 = [v141 accountIdentifier];
        +[_PSConstants mobileMessagesBundleId];
        v17 = id v16 = v8;
        v183[0] = v17;
        uint64_t v18 = +[_PSConstants macMessagesBundleId];
        v183[1] = v18;
        uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v183 count:2];
        int v20 = [(_PSKNNModel *)self interactionStore];
        uint64_t v21 = +[_PSInteractionStoreUtils interactionsMatchingAnyHandlesOrDomainIds:v13 account:v15 directions:&unk_1EF6763C8 mechanisms:0 bundleIds:v19 store:v20 fetchLimit:500];

        id v10 = &off_1E5ADE000;
        id v8 = v16;

        BOOL v22 = (void *)v21;
        id v14 = v141;
      }
      else
      {
        BOOL v22 = 0;
      }
      id v137 = v8;
      v133 = v22;
      uint64_t v24 = -[_PSKNNModel rankedSuggestionsWithPredictionContext:bundleId:maxSuggestions:frequencyOnly:interactions:](self, "rankedSuggestionsWithPredictionContext:bundleId:maxSuggestions:frequencyOnly:interactions:", v14, v8, 2000, 0);
      uint64_t v25 = [v10[172] knnChannel];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138477827;
        unint64_t v173 = (unint64_t)v24;
        _os_log_impl(&dword_1A314B000, v25, OS_LOG_TYPE_INFO, "Suggestions from rankedSuggestionsWithPredictionContext: %{private}@", buf, 0xCu);
      }

      uint64_t v26 = [MEMORY[0x1E4F1CA48] array];
      id v27 = (void *)[v140 mutableCopy];
      v151 = [MEMORY[0x1E4F1CA60] dictionary];
      long long v168 = 0u;
      long long v169 = 0u;
      long long v170 = 0u;
      long long v171 = 0u;
      id v28 = v24;
      v144 = v28;
      v145 = self;
      v153 = v26;
      uint64_t v148 = [v28 countByEnumeratingWithState:&v168 objects:v182 count:16];
      if (v148)
      {
        uint64_t v29 = *(void *)v169;
        uint64_t v146 = *(void *)v169;
        do
        {
          uint64_t v30 = 0;
          do
          {
            if (*(void *)v169 != v29) {
              objc_enumerationMutation(v28);
            }
            uint64_t v31 = *(void **)(*((void *)&v168 + 1) + 8 * v30);
            uint64_t v32 = [v31 conversationIdentifier];
            int64_t v33 = [(_PSKNNModel *)self suggestionExists:@"chatGuid" withValue:v32 inArray:v27];

            double v34 = [v31 recipients];
            uint64_t v35 = v34;
            uint64_t v149 = v30;
            if (v33 != 0x7FFFFFFFFFFFFFFFLL)
            {
              uint64_t v51 = [v27 objectAtIndexedSubscript:v33];
              [v51 setRecipients:v35];

              long long v52 = [v27 objectAtIndexedSubscript:v33];
              [v52 setResultSourceType:16];

              uint64_t v53 = [v27 objectAtIndexedSubscript:v33];
              [v26 addObject:v53];

              [v27 removeObjectAtIndex:v33];
              goto LABEL_44;
            }
            if ([v34 count] == 1)
            {
              uint64_t v36 = [v31 recipients];
              double v37 = [v36 firstObject];
              uint64_t v38 = [v37 handle];
              int64_t v39 = [(_PSKNNModel *)self suggestionExists:@"handle" withValue:v38 inArray:v27];

              uint64_t v29 = v146;
              uint64_t v26 = v153;

              if (v39 != 0x7FFFFFFFFFFFFFFFLL)
              {
                v40 = [v31 recipients];
                unint64_t v41 = [v27 objectAtIndexedSubscript:v39];
                [v41 setRecipients:v40];

                v42 = [v27 objectAtIndexedSubscript:v39];
                [v42 setResultSourceType:16];

                v43 = [v27 objectAtIndexedSubscript:v39];
                [v153 addObject:v43];

                [v27 removeObjectAtIndex:v39];
                id v44 = [v31 recipients];
                id v45 = [v44 firstObject];
                v46 = [v45 handle];

                if (v46)
                {
                  uint64_t v47 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v153, "count") - 1);
                  long long v48 = [v31 recipients];
                  long long v49 = [v48 firstObject];
                  unint64_t v50 = [v49 handle];
                  [v151 setObject:v47 forKeyedSubscript:v50];
                }
                goto LABEL_44;
              }
            }
            else
            {
            }
            long long v54 = [v31 recipients];
            unint64_t v55 = [v54 count];

            if (v55 >= 2)
            {
              long long v56 = [v31 recipients];
              long long v57 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v56, "count"));
              long long v164 = 0u;
              long long v165 = 0u;
              long long v166 = 0u;
              long long v167 = 0u;
              id v58 = v56;
              uint64_t v59 = [v58 countByEnumeratingWithState:&v164 objects:v181 count:16];
              if (v59)
              {
                uint64_t v60 = v59;
                uint64_t v61 = *(void *)v165;
                do
                {
                  for (uint64_t i = 0; i != v60; ++i)
                  {
                    if (*(void *)v165 != v61) {
                      objc_enumerationMutation(v58);
                    }
                    v63 = *(void **)(*((void *)&v164 + 1) + 8 * i);
                    unint64_t v64 = [v63 handle];

                    if (v64)
                    {
                      __int16 v65 = [v63 handle];
                      [v57 addObject:v65];
                    }
                  }
                  uint64_t v60 = [v58 countByEnumeratingWithState:&v164 objects:v181 count:16];
                }
                while (v60);
              }

              v152 = [(_PSKNNModel *)self indexesOfObjectsWithKey:@"handle" withValues:v57 inArray:v27];
              uint64_t v66 = [v152 firstIndex];
              if (v66 != 0x7FFFFFFFFFFFFFFFLL)
              {
                uint64_t v67 = v66;
                do
                {
                  unint64_t v68 = [_PSRecipient alloc];
                  v69 = [v27 objectAtIndexedSubscript:v67];
                  long long v70 = [v69 contactIdentifier];
                  long long v71 = [v27 objectAtIndexedSubscript:v67];
                  long long v72 = [v71 handle];
                  long long v73 = [(_PSRecipient *)v68 initWithIdentifier:v70 handle:v72 contact:0];

                  if (v73)
                  {
                    v180 = v73;
                    v74 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v180 count:1];
                    v75 = [v27 objectAtIndexedSubscript:v67];
                    [v75 setRecipients:v74];
                  }
                  v76 = [v27 objectAtIndexedSubscript:v67];
                  [v76 setResultSourceType:16];

                  v77 = [v27 objectAtIndexedSubscript:v67];
                  [v153 addObject:v77];

                  __int16 v78 = [v27 objectAtIndexedSubscript:v67];
                  uint64_t v79 = [v78 handle];

                  if (v79)
                  {
                    v80 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v153, "count") - 1);
                    v81 = [v27 objectAtIndexedSubscript:v67];
                    v82 = [v81 handle];
                    [v151 setObject:v80 forKeyedSubscript:v82];
                  }
                  uint64_t v67 = [v152 indexGreaterThanIndex:v67];
                }
                while (v67 != 0x7FFFFFFFFFFFFFFFLL);
              }
              [v27 removeObjectsAtIndexes:v152];

              id v28 = v144;
              self = v145;
              uint64_t v26 = v153;
              uint64_t v29 = v146;
            }
LABEL_44:
            uint64_t v30 = v149 + 1;
          }
          while (v149 + 1 != v148);
          uint64_t v148 = [v28 countByEnumeratingWithState:&v168 objects:v182 count:16];
        }
        while (v148);
      }

      long long v162 = 0u;
      long long v163 = 0u;
      long long v160 = 0u;
      long long v161 = 0u;
      id v83 = v27;
      uint64_t v84 = [v83 countByEnumeratingWithState:&v160 objects:v179 count:16];
      if (v84)
      {
        uint64_t v85 = v84;
        uint64_t v86 = *(void *)v161;
        do
        {
          for (uint64_t j = 0; j != v85; ++j)
          {
            if (*(void *)v161 != v86) {
              objc_enumerationMutation(v83);
            }
            v88 = *(void **)(*((void *)&v160 + 1) + 8 * j);
            [v26 addObject:v88];
            v89 = [v88 handle];

            if (v89)
            {
              v90 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v26, "count") - 1);
              v91 = [v88 handle];
              [v151 setObject:v90 forKeyedSubscript:v91];
            }
          }
          uint64_t v85 = [v83 countByEnumeratingWithState:&v160 objects:v179 count:16];
        }
        while (v85);
      }

      v92 = objc_opt_new();
      if ([v26 count])
      {
        unint64_t v93 = 0;
        v138 = v92;
        id v139 = v83;
        do
        {
          unint64_t v150 = v93;
          v94 = +[_PSLogging knnChannel];
          if (os_log_type_enabled(v94, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            unint64_t v173 = (unint64_t)v26;
            _os_log_debug_impl(&dword_1A314B000, v94, OS_LOG_TYPE_DEBUG, "filteredSuggestions - start: %@", buf, 0xCu);
          }

          v95 = [v26 objectAtIndexedSubscript:v150];
          v96 = [v95 recipients];
          uint64_t v97 = [v96 valueForKey:@"handle"];

          v98 = [v26 objectAtIndexedSubscript:v150];
          uint64_t v99 = [v98 chatHandles];

          v100 = objc_opt_new();
          v147 = (void *)v97;
          uint64_t v101 = v97;
          v102 = (void *)v99;
          [v100 addObjectsFromArray:v101];
          [v100 addObjectsFromArray:v99];
          v143 = v100;
          id v103 = [v100 allObjects];
          if ((unint64_t)[v103 count] >= 2)
          {
            v104 = [v26 objectAtIndexedSubscript:v150];
            v105 = [v104 chatGuid];
            char v106 = [v92 containsObject:v105];

            if ((v106 & 1) == 0)
            {
              v142 = v102;
              v107 = +[_PSLogging knnChannel];
              if (os_log_type_enabled(v107, OS_LOG_TYPE_DEBUG))
              {
                v125 = [v26 objectAtIndexedSubscript:v150];
                v126 = [v125 chatGuid];
                *(_DWORD *)buf = 138412290;
                unint64_t v173 = (unint64_t)v126;
                _os_log_debug_impl(&dword_1A314B000, v107, OS_LOG_TYPE_DEBUG, "considering group: %@", buf, 0xCu);
              }
              v108 = [v26 objectAtIndexedSubscript:v150];
              v109 = [v108 chatGuid];
              [v92 addObject:v109];

              v158[0] = MEMORY[0x1E4F143A8];
              v158[1] = 3221225472;
              v158[2] = __94___PSKNNModel_rankedMessagesAutocompleteSuggestionsWithPredictionContext_bundleId_candidates___block_invoke;
              v158[3] = &unk_1E5AE0A70;
              id v110 = v151;
              id v159 = v110;
              v111 = [v103 sortedArrayUsingComparator:v158];

              long long v156 = 0u;
              long long v157 = 0u;
              long long v154 = 0u;
              long long v155 = 0u;
              id v103 = v111;
              uint64_t v112 = [v103 countByEnumeratingWithState:&v154 objects:v178 count:16];
              if (v112)
              {
                uint64_t v113 = v112;
                uint64_t v114 = *(void *)v155;
                unint64_t v115 = v150;
                do
                {
                  for (uint64_t k = 0; k != v113; ++k)
                  {
                    if (*(void *)v155 != v114) {
                      objc_enumerationMutation(v103);
                    }
                    v117 = *(void **)(*((void *)&v154 + 1) + 8 * k);
                    v118 = +[_PSLogging knnChannel];
                    if (os_log_type_enabled(v118, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 138412290;
                      unint64_t v173 = (unint64_t)v117;
                      _os_log_debug_impl(&dword_1A314B000, v118, OS_LOG_TYPE_DEBUG, "considering recipient: %@", buf, 0xCu);
                    }

                    v119 = [v110 objectForKeyedSubscript:v117];
                    unint64_t v120 = [v119 integerValue];

                    if (v120 > v115 && v115 <= [v153 count])
                    {
                      v121 = +[_PSLogging knnChannel];
                      if (os_log_type_enabled(v121, OS_LOG_TYPE_DEBUG))
                      {
                        *(_DWORD *)buf = 134218240;
                        unint64_t v173 = v120;
                        __int16 v174 = 2048;
                        unint64_t v175 = v115;
                        _os_log_debug_impl(&dword_1A314B000, v121, OS_LOG_TYPE_DEBUG, "swapping filteredSuggestions[idxOfRecipient] to item at idxOfGroup, idxOfRecipient: %tu, idxOfGroup: %tu", buf, 0x16u);
                      }

                      v122 = [v153 objectAtIndexedSubscript:v120];
                      [v153 insertObject:v122 atIndex:v115];

                      [v153 removeObjectAtIndex:v120 + 1];
                      v123 = [NSNumber numberWithUnsignedInteger:v115];
                      [v110 setObject:v123 forKeyedSubscript:v117];

                      ++v115;
                    }
                  }
                  uint64_t v113 = [v103 countByEnumeratingWithState:&v154 objects:v178 count:16];
                }
                while (v113);
              }

              self = v145;
              uint64_t v26 = v153;
              v92 = v138;
              id v83 = v139;
              v102 = v142;
            }
          }
          v124 = +[_PSLogging knnChannel];
          if (os_log_type_enabled(v124, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            unint64_t v173 = (unint64_t)v26;
            _os_log_debug_impl(&dword_1A314B000, v124, OS_LOG_TYPE_DEBUG, "filteredSuggestions - end: %@", buf, 0xCu);
          }

          unint64_t v93 = v150 + 1;
        }
        while (v150 + 1 < [v26 count]);
      }
      unint64_t v127 = [v26 count];
      v128 = +[_PSLogging knnChannel];
      if (os_log_type_enabled(v128, OS_LOG_TYPE_INFO))
      {
        if (v127 >= 5) {
          unint64_t v127 = 5;
        }
        v129 = objc_msgSend(v26, "subarrayWithRange:", 0, v127);
        uint64_t v130 = [v140 count];
        *(_DWORD *)buf = 134218498;
        unint64_t v173 = v127;
        __int16 v174 = 2112;
        unint64_t v175 = (unint64_t)v129;
        __int16 v176 = 2048;
        uint64_t v177 = v130;
        _os_log_impl(&dword_1A314B000, v128, OS_LOG_TYPE_INFO, "Autocomplete Top %lu results: %@ for candidates %lu", buf, 0x20u);
      }
      id v23 = [(_PSKNNModel *)self filterSuggestionsFrom:v26 byFilteringOutSeedRecipients:v134];
      v131 = +[_PSLogging suggestionSignpost];
      if (os_signpost_enabled(v131))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A314B000, v131, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "rankedMessagesAutocompleteSuggestionsWithPredictionContext", (const char *)&unk_1A3274816, buf, 2u);
      }

      id v8 = v137;
    }
    else
    {
      id v23 = (void *)MEMORY[0x1E4F1CBF0];
    }
    id v9 = v140;
  }
  else
  {
    id v23 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v23;
}

- (id)messagesGroupResultsForPredictionContext:(id)a3
{
  uint64_t v97 = *MEMORY[0x1E4F143B8];
  id v67 = a3;
  v3 = +[_PSLogging knnChannel];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    uint64_t v94 = (uint64_t)v67;
    _os_log_impl(&dword_1A314B000, v3, OS_LOG_TYPE_DEFAULT, "messagesGroupResultsForPredictionContext: %{private}@", buf, 0xCu);
  }

  v69 = objc_opt_new();
  id v4 = objc_opt_new();
  uint64_t v5 = +[_PSPrivacyDataRetentionPeriod lookbackDurationInDays];
  BOOL v6 = (void *)MEMORY[0x1E4F1CA48];
  id v7 = +[_PSConstants mobileMessagesBundleId];
  id v8 = +[_PSConstants macMessagesBundleId];
  uint64_t v66 = objc_msgSend(v6, "arrayWithObjects:", v7, v8, 0);

  id v9 = [MEMORY[0x1E4F5B458] sharedInstance];
  id v10 = [v9 allLearningDisabledBundleIDs];

  objc_opt_class();
  unint64_t v64 = v10;
  if (objc_opt_isKindOfClass())
  {
    id v11 = +[_PSConstants mobileMessagesBundleId];
    if ([v10 containsObject:v11])
    {
    }
    else
    {
      id v12 = +[_PSConstants macMessagesBundleId];
      int v13 = [v64 containsObject:v12];

      if (!v13) {
        goto LABEL_10;
      }
    }
    id v14 = +[_PSLogging knnChannel];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = +[_PSConstants mobileMessagesBundleId];
      id v16 = +[_PSConstants macMessagesBundleId];
      *(_DWORD *)buf = 138412546;
      uint64_t v94 = (uint64_t)v15;
      __int16 v95 = 2112;
      v96 = v16;
      _os_log_impl(&dword_1A314B000, v14, OS_LOG_TYPE_DEFAULT, "Falling back to contacts autocomplete bundle id as %@ or %@ is disabled in Siri & Search", buf, 0x16u);
    }
    uint64_t v17 = +[_PSConstants contactsAutocompleteBundleId];
    [v66 addObject:v17];
  }
LABEL_10:
  id v18 = 0;
  uint64_t v19 = 0;
  double v20 = (double)v5 * -86400.0;
  long long v70 = v4;
  do
  {
    uint64_t v21 = [v67 searchPrefix];
    BOOL v22 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:v20];
    id v23 = [(_PSKNNModel *)self interactionStore];
    uint64_t v24 = +[_PSInteractionStoreUtils groupInteractionsContainingSearchStringInDisplayName:v21 excludingInteractionUUIDs:0 account:0 directions:&unk_1EF6763E0 bundleIds:v66 excludedDomainIdentifiers:v4 startDate:v22 store:v23 fetchLimit:500 offset:v19];

    uint64_t v25 = +[_PSLogging knnChannel];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      uint64_t v26 = [v24 count];
      *(_DWORD *)buf = 134283521;
      uint64_t v94 = v26;
      _os_log_impl(&dword_1A314B000, v25, OS_LOG_TYPE_INFO, "Fetched %{private}tu group interactions", buf, 0xCu);
    }

    long long v89 = 0u;
    long long v90 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    id v18 = v24;
    uint64_t v27 = [v18 countByEnumeratingWithState:&v87 objects:v92 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v88;
      uint64_t v72 = v19;
      id v73 = v18;
      uint64_t v71 = *(void *)v88;
      do
      {
        uint64_t v30 = 0;
        uint64_t v74 = v28;
        do
        {
          if (*(void *)v88 != v29) {
            objc_enumerationMutation(v18);
          }
          uint64_t v31 = *(void **)(*((void *)&v87 + 1) + 8 * v30);
          uint64_t v32 = (void *)MEMORY[0x1A6243860]();
          v80 = v31;
          int64_t v33 = [v31 domainIdentifier];
          if (v33 && ([v4 containsObject:v33] & 1) == 0)
          {
            uint64_t v79 = v33;
            v75 = v32;
            uint64_t v76 = v30;
            __int16 v78 = [v80 groupName];
            v77 = [v80 account];
            double v34 = (void *)MEMORY[0x1E4F1CA48];
            uint64_t v35 = [v80 recipients];
            v81 = objc_msgSend(v34, "arrayWithCapacity:", objc_msgSend(v35, "count"));

            long long v85 = 0u;
            long long v86 = 0u;
            long long v83 = 0u;
            long long v84 = 0u;
            uint64_t v36 = [v80 recipients];
            uint64_t v37 = [v36 countByEnumeratingWithState:&v83 objects:v91 count:16];
            if (v37)
            {
              uint64_t v38 = v37;
              uint64_t v39 = *(void *)v84;
              do
              {
                for (uint64_t i = 0; i != v38; ++i)
                {
                  if (*(void *)v84 != v39) {
                    objc_enumerationMutation(v36);
                  }
                  unint64_t v41 = *(void **)(*((void *)&v83 + 1) + 8 * i);
                  v42 = [_PSRecipient alloc];
                  uint64_t v43 = [v41 personIdType];
                  if (v43 == 3)
                  {
                    uint64_t v44 = [v41 personId];
                    v82 = (void *)v44;
                  }
                  else
                  {
                    uint64_t v44 = 0;
                  }
                  id v45 = [v41 identifier];
                  v46 = [v41 displayName];
                  uint64_t v47 = [(_PSRecipient *)v42 initWithIdentifier:v44 handle:v45 displayName:v46 contact:0];

                  if (v43 == 3) {
                  if (v47)
                  }
                    [v81 addObject:v47];
                }
                uint64_t v38 = [v36 countByEnumeratingWithState:&v83 objects:v91 count:16];
              }
              while (v38);
            }

            long long v48 = v80;
            if ([v80 direction])
            {
              id v4 = v70;
              uint64_t v29 = v71;
              uint64_t v19 = v72;
              id v18 = v73;
              uint64_t v28 = v74;
            }
            else
            {
              long long v49 = [v80 sender];

              uint64_t v29 = v71;
              uint64_t v28 = v74;
              if (v49)
              {
                unint64_t v50 = [v80 sender];
                uint64_t v51 = [_PSRecipient alloc];
                uint64_t v52 = [v50 personIdType];
                if (v52 == 3)
                {
                  uint64_t v53 = [v50 personId];
                  unint64_t v68 = (void *)v53;
                }
                else
                {
                  uint64_t v53 = 0;
                }
                long long v54 = [v50 identifier];
                unint64_t v55 = [v50 displayName];
                long long v56 = [(_PSRecipient *)v51 initWithIdentifier:v53 handle:v54 displayName:v55 contact:0];

                if (v52 == 3) {
                id v4 = v70;
                }
                uint64_t v19 = v72;
                id v18 = v73;
                if (v56) {
                  [v81 addObject:v56];
                }

                long long v48 = v80;
              }
              else
              {
                id v4 = v70;
                uint64_t v19 = v72;
                id v18 = v73;
              }
            }
            long long v57 = [_PSSuggestion alloc];
            id v58 = [v48 bundleId];
            uint64_t v59 = [(_PSSuggestion *)v57 initWithBundleID:v58 conversationIdentifier:v79 groupName:v78 recipients:v81];

            [(_PSSuggestion *)v59 setMessagesGroupIdentifier:v77];
            if (v59) {
              [v69 addObject:v59];
            }
            int64_t v33 = v79;
            [v4 addObject:v79];

            uint64_t v32 = v75;
            uint64_t v30 = v76;
          }

          ++v30;
        }
        while (v30 != v28);
        uint64_t v28 = [v18 countByEnumeratingWithState:&v87 objects:v92 count:16];
      }
      while (v28);
    }
    v19 += 500;
  }
  while ((unint64_t)[v18 count] > 0x1F3);
  uint64_t v60 = [(_PSKNNModel *)self suggestionsByUpdatingGroupNamesFromSuggestions:v69 imCoreTimeBudget:0.5];
  uint64_t v61 = +[_PSLogging knnChannel];
  if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v62 = [v60 count];
    *(_DWORD *)buf = 134218243;
    uint64_t v94 = v62;
    __int16 v95 = 2113;
    v96 = v60;
    _os_log_impl(&dword_1A314B000, v61, OS_LOG_TYPE_DEFAULT, "Number of messages group results returned for prefix search: %tu, results: %{private}@", buf, 0x16u);
  }

  return v60;
}

- (id)suggestionsByUpdatingGroupNamesFromSuggestions:(id)a3 imCoreTimeBudget:(double)a4
{
  id v6 = a3;
  if ([v6 count])
  {
    id v7 = objc_opt_new();
    id v8 = [MEMORY[0x1E4F93B18] autoreleasingSerialQueueWithLabel:"suggestionsByUpdatingGroupNamesFromSuggestions IMCore queue"];
    v18[0] = 0;
    v18[1] = v18;
    v18[2] = 0x2020000000;
    *(double *)&v18[3] = a4;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __79___PSKNNModel_suggestionsByUpdatingGroupNamesFromSuggestions_imCoreTimeBudget___block_invoke;
    v13[3] = &unk_1E5AE0AC0;
    uint64_t v17 = v18;
    id v9 = v8;
    id v14 = v9;
    id v10 = v7;
    id v15 = v10;
    id v16 = self;
    objc_msgSend(v6, "_pas_mappedArrayWithTransform:", v13);
    id v11 = (id)objc_claimAutoreleasedReturnValue();

    _Block_object_dispose(v18, 8);
  }
  else
  {
    id v11 = v6;
  }

  return v11;
}

- (BOOL)suggestedRecipientHandles:(id)a3 differFromFetchedRecipientHandles:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 count];
  if (v7 == [v6 count])
  {
    id v8 = objc_opt_new();
    id v9 = objc_opt_new();
    if ([v5 count])
    {
      unint64_t v10 = 0;
      do
      {
        id v11 = [v5 objectAtIndexedSubscript:v10];
        id v12 = [v11 handle];

        if (v12) {
          [v8 addObject:v12];
        }
        int v13 = [v6 objectAtIndexedSubscript:v10];
        id v14 = [v13 handle];

        if (v14) {
          [v9 addObject:v14];
        }

        ++v10;
      }
      while (v10 < [v5 count]);
    }
    id v15 = [v8 sortedArrayUsingSelector:sel_compare_];
    id v16 = [v9 sortedArrayUsingSelector:sel_compare_];
    int v17 = [v15 isEqualToArray:v16] ^ 1;
  }
  else
  {
    LOBYTE(v17) = 1;
  }

  return v17;
}

- (id)recipientsForChat:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v27 = a3;
  v3 = [v27 participants];
  id v4 = [MEMORY[0x1E4F1CA48] array];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  obuint64_t j = v3;
  id v5 = 0;
  uint64_t v6 = [obj countByEnumeratingWithState:&v29 objects:v42 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v30 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = [*(id *)(*((void *)&v29 + 1) + 8 * i) address];
        uint64_t v38 = 0;
        uint64_t v39 = &v38;
        uint64_t v40 = 0x2020000000;
        unint64_t v10 = (uint64_t (*)(id))getIMStringIsPhoneNumberSymbolLoc_ptr;
        unint64_t v41 = getIMStringIsPhoneNumberSymbolLoc_ptr;
        if (!getIMStringIsPhoneNumberSymbolLoc_ptr)
        {
          uint64_t v33 = MEMORY[0x1E4F143A8];
          uint64_t v34 = 3221225472;
          uint64_t v35 = __getIMStringIsPhoneNumberSymbolLoc_block_invoke;
          uint64_t v36 = &unk_1E5ADE858;
          uint64_t v37 = &v38;
          id v11 = (void *)IMFoundationLibrary();
          id v12 = dlsym(v11, "IMStringIsPhoneNumber");
          *(void *)(v37[1] + 24) = v12;
          getIMStringIsPhoneNumberSymbolLoc_ptr = *(_UNKNOWN **)(v37[1] + 24);
          unint64_t v10 = (uint64_t (*)(id))v39[3];
        }
        _Block_object_dispose(&v38, 8);
        if (!v10)
        {
LABEL_24:
          -[_PSBlockedHandlesCache beginSyncingWithTU]();
          __break(1u);
        }
        int v13 = v10(v9);

        if (v13)
        {
          uint64_t v38 = 0;
          uint64_t v39 = &v38;
          uint64_t v40 = 0x2050000000;
          id v14 = (void *)getCNPhoneNumberClass_softClass_2;
          unint64_t v41 = (void *)getCNPhoneNumberClass_softClass_2;
          if (!getCNPhoneNumberClass_softClass_2)
          {
            uint64_t v33 = MEMORY[0x1E4F143A8];
            uint64_t v34 = 3221225472;
            uint64_t v35 = __getCNPhoneNumberClass_block_invoke_2;
            uint64_t v36 = &unk_1E5ADE858;
            uint64_t v37 = &v38;
            ContactsLibraryCore_6();
            Class Class = objc_getClass("CNPhoneNumber");
            *(void *)(v37[1] + 24) = Class;
            getCNPhoneNumberClass_softClass_2 = *(void *)(v37[1] + 24);
            id v14 = (void *)v39[3];
          }
          id v16 = v14;
          _Block_object_dispose(&v38, 8);
          int v17 = [v16 phoneNumberWithStringValue:v9];
          uint64_t v18 = [v17 unformattedInternationalStringValue];

          id v5 = (id)v18;
          goto LABEL_18;
        }
        id v19 = v9;
        uint64_t v38 = 0;
        uint64_t v39 = &v38;
        uint64_t v40 = 0x2020000000;
        double v20 = (uint64_t (*)(id))getIMStringIsEmailSymbolLoc_ptr;
        unint64_t v41 = getIMStringIsEmailSymbolLoc_ptr;
        if (!getIMStringIsEmailSymbolLoc_ptr)
        {
          uint64_t v33 = MEMORY[0x1E4F143A8];
          uint64_t v34 = 3221225472;
          uint64_t v35 = __getIMStringIsEmailSymbolLoc_block_invoke;
          uint64_t v36 = &unk_1E5ADE858;
          uint64_t v37 = &v38;
          uint64_t v21 = (void *)IMFoundationLibrary();
          BOOL v22 = dlsym(v21, "IMStringIsEmail");
          *(void *)(v37[1] + 24) = v22;
          getIMStringIsEmailSymbolLoc_ptr = *(_UNKNOWN **)(v37[1] + 24);
          double v20 = (uint64_t (*)(id))v39[3];
        }
        _Block_object_dispose(&v38, 8);
        if (!v20) {
          goto LABEL_24;
        }
        int v23 = v20(v19);

        if (v23)
        {
          id v24 = v19;
          int v17 = v5;
          id v5 = v24;
LABEL_18:
        }
        uint64_t v25 = [[_PSRecipient alloc] initWithIdentifier:0 handle:v5 contact:0];
        [v4 addObject:v25];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v29 objects:v42 count:16];
    }
    while (v6);
  }

  return v4;
}

- (id)contactKeysToFetch
{
  if (contactKeysToFetch_onceToken != -1) {
    dispatch_once(&contactKeysToFetch_onceToken, &__block_literal_global_28);
  }
  v2 = (void *)contactKeysToFetch_contactKeysToFetch;

  return v2;
}

- (id)filterSuggestionsFrom:(id)a3 byFilteringOutSeedRecipients:(id)a4
{
  id v6 = a4;
  uint64_t v7 = (void *)[a3 mutableCopy];
  id v8 = [(_PSKNNModel *)self indexesOfObjectsWithKey:@"chatGuid" withValues:v6 inArray:v7];
  [v7 removeObjectsAtIndexes:v8];
  id v9 = [(_PSKNNModel *)self indexesOfObjectsWithKey:@"contactIdentifier" withValues:v6 inArray:v7];

  [v7 removeObjectsAtIndexes:v9];
  unint64_t v10 = [(_PSKNNModel *)self indexesOfObjectsWithKey:@"handle" withValues:v6 inArray:v7];

  [v7 removeObjectsAtIndexes:v10];

  return v7;
}

- (id)indexesOfObjectsWithKey:(id)a3 withValues:(id)a4 inArray:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v8 && [v8 count])
  {
    unint64_t v10 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN[c] %@", v7, v8];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __58___PSKNNModel_indexesOfObjectsWithKey_withValues_inArray___block_invoke;
    v14[3] = &unk_1E5AE0AE8;
    id v15 = v10;
    id v11 = v10;
    id v12 = [v9 indexesOfObjectsPassingTest:v14];
  }
  else
  {
    id v12 = [MEMORY[0x1E4F28D60] indexSet];
  }

  return v12;
}

- (id)rankedZkwSuggestionsWithPredictionContext:(id)a3 modelConfiguration:(id)a4 maxSuggestions:(unint64_t)a5
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  unint64_t v10 = [v8 bundleID];
  if (v10)
  {
    id v11 = +[_PSConstants mobileMessagesBundleId];
    if ([v10 isEqualToString:v11])
    {
      int v12 = 1;
    }
    else
    {
      id v14 = +[_PSConstants macMessagesBundleId];
      int v12 = [v10 isEqualToString:v14];
    }
    id v15 = +[_PSConstants mobileFacetimeBundleId];
    if ([v10 isEqualToString:v15])
    {
      int v16 = 1;
    }
    else
    {
      int v17 = +[_PSConstants macFacetimeBundleId];
      int v16 = [v10 isEqualToString:v17];
    }
    if (_os_feature_enabled_impl()
      && ([v8 seedRecipients],
          uint64_t v18 = objc_claimAutoreleasedReturnValue(),
          uint64_t v19 = [v18 count],
          v18,
          v19))
    {
      double v20 = [(_PSKNNModel *)self rankedCoRecipientSuggestionsWithPredictionContext:v8 modelConfiguration:v9 maxSuggestions:a5];
    }
    else
    {
      long long v56 = v10;
      double v20 = [MEMORY[0x1E4F1CA48] array];
      if ((v12 | v16) == 1)
      {
        if ([(_PSKNNModel *)self _PSInteractionModelInUse])
        {
          unint64_t v21 = a5;
          BOOL v22 = +[_PSLogging generalChannel];
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A314B000, v22, OS_LOG_TYPE_INFO, "Using interaction model instead of kNN", buf, 2u);
          }

          int v23 = [_PSInteractionPredictor alloc];
          id v24 = [(_PSKNNModel *)self interactionStore];
          uint64_t v25 = [v8 suggestionDate];
          uint64_t v26 = [(_PSInteractionPredictor *)v23 initWithInteractionStore:v24 atDate:v25 withModelName:@"interactionPrediction" modelConfiguration:v9];

          id v27 = [v8 suggestionDate];
          uint64_t v28 = +[_PSInteractionPredictor getModelURLfromName:@"interactionPrediction"];
          long long v29 = [(_PSInteractionPredictor *)v26 predictAtDate:v27 usingModelAtURL:v28 showNumSuggestions:v21];

          a5 = v21;
          long long v30 = [(_PSInteractionPredictor *)v26 rankedZkwSuggestionsFromPredictionArray:v29 forBundleID:v56];
          [v20 addObjectsFromArray:v30];

          unint64_t v10 = v56;
        }
        else
        {
          id v54 = v9;
          unint64_t v51 = [(_PSKNNModel *)self _PSKnnMessagesZkwTopNFilter];
          long long v31 = [(_PSKNNModel *)self messageInteractionCache];
          id v55 = v8;
          unint64_t v53 = a5;
          long long v32 = [(_PSKNNModel *)self _rankedZkwSuggestionsWithPredictionContext:v8 bundleId:v10 maxSuggestions:a5 frequencyOnly:0 interactions:0 interactionCache:v31];
          uint64_t v33 = (void *)MEMORY[0x1E4F1CAD0];
          uint64_t v34 = [(_PSKNNModel *)self interactionStore];
          uint64_t v52 = v31;
          uint64_t v35 = [v31 interactions];
          uint64_t v36 = +[_PSInteractionStoreUtils interactionsMostRecentForBundleId:v10 store:v34 resultLimit:v51 interactions:v35];
          uint64_t v37 = [v33 setWithArray:v36];

          uint64_t v38 = [MEMORY[0x1E4F1CA48] array];
          long long v58 = 0u;
          long long v59 = 0u;
          long long v60 = 0u;
          long long v61 = 0u;
          id v39 = v32;
          uint64_t v40 = [v39 countByEnumeratingWithState:&v58 objects:v62 count:16];
          if (v40)
          {
            uint64_t v41 = v40;
            uint64_t v42 = *(void *)v59;
            do
            {
              for (uint64_t i = 0; i != v41; ++i)
              {
                if (*(void *)v59 != v42) {
                  objc_enumerationMutation(v39);
                }
                uint64_t v44 = *(void **)(*((void *)&v58 + 1) + 8 * i);
                id v45 = [v44 conversationIdentifier];
                int v46 = [v37 containsObject:v45];

                if (v46) {
                  uint64_t v47 = v38;
                }
                else {
                  uint64_t v47 = v20;
                }
                [v47 addObject:v44];
              }
              uint64_t v41 = [v39 countByEnumeratingWithState:&v58 objects:v62 count:16];
            }
            while (v41);
          }

          [v20 addObjectsFromArray:v38];
          id v9 = v54;
          id v8 = v55;
          unint64_t v10 = v56;
          a5 = v53;
        }
      }
    }
    unint64_t v48 = [v20 count];
    if (v48 >= a5) {
      unint64_t v49 = a5;
    }
    else {
      unint64_t v49 = v48;
    }
    int v13 = objc_msgSend(v20, "subarrayWithRange:", 0, v49);
  }
  else
  {
    int v13 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v13;
}

- (id)rankedCoRecipientSuggestionsWithPredictionContext:(id)a3 modelConfiguration:(id)a4 maxSuggestions:(unint64_t)a5
{
  uint64_t v152 = *MEMORY[0x1E4F143B8];
  id v88 = a3;
  id v80 = a4;
  id v84 = [MEMORY[0x1E4F1CA48] array];
  id v6 = [v88 suggestionDate];
  v81 = [(_PSKNNModel *)self featureVectorFromPredictionDate:v6 bundleId:0];

  id v7 = objc_opt_new();
  id v8 = objc_opt_new();
  uint64_t v127 = 0;
  v128 = &v127;
  uint64_t v129 = 0x2020000000;
  uint64_t v130 = 0;
  uint64_t v123 = 0;
  v124 = &v123;
  uint64_t v125 = 0x2020000000;
  uint64_t v126 = 0;
  uint64_t v119 = 0;
  unint64_t v120 = &v119;
  uint64_t v121 = 0x2020000000;
  uint64_t v122 = 0;
  id v9 = [v88 seedRecipients];
  v113[0] = MEMORY[0x1E4F143A8];
  v113[1] = 3221225472;
  v113[2] = __99___PSKNNModel_rankedCoRecipientSuggestionsWithPredictionContext_modelConfiguration_maxSuggestions___block_invoke;
  v113[3] = &unk_1E5AE0B10;
  v116 = &v127;
  v117 = &v119;
  v118 = &v123;
  id v10 = v7;
  id v114 = v10;
  id v82 = v8;
  id v115 = v82;
  [v9 enumerateObjectsUsingBlock:v113];

  id v11 = objc_opt_new();
  long long v111 = 0u;
  long long v112 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  obuint64_t j = v10;
  uint64_t v12 = [obj countByEnumeratingWithState:&v109 objects:v151 count:16];
  if (v12)
  {
    uint64_t v86 = *(void *)v110;
    do
    {
      id v89 = (id)v12;
      for (uint64_t i = 0; i != v89; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v110 != v86) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v109 + 1) + 8 * i);
        long long v105 = 0u;
        long long v106 = 0u;
        long long v107 = 0u;
        long long v108 = 0u;
        id v15 = [v14 emailAddresses];
        uint64_t v16 = [v15 countByEnumeratingWithState:&v105 objects:v150 count:16];
        if (v16)
        {
          uint64_t v17 = *(void *)v106;
          do
          {
            for (uint64_t j = 0; j != v16; ++j)
            {
              if (*(void *)v106 != v17) {
                objc_enumerationMutation(v15);
              }
              uint64_t v19 = (void *)MEMORY[0x1E4F5B3B0];
              double v20 = [*(id *)(*((void *)&v105 + 1) + 8 * j) value];
              unint64_t v21 = [v19 normalizedStringFromContactString:v20];
              [v11 addObject:v21];
            }
            uint64_t v16 = [v15 countByEnumeratingWithState:&v105 objects:v150 count:16];
          }
          while (v16);
        }

        long long v103 = 0u;
        long long v104 = 0u;
        long long v101 = 0u;
        long long v102 = 0u;
        BOOL v22 = [v14 phoneNumbers];
        uint64_t v23 = [v22 countByEnumeratingWithState:&v101 objects:v149 count:16];
        if (v23)
        {
          uint64_t v24 = *(void *)v102;
          do
          {
            for (uint64_t k = 0; k != v23; ++k)
            {
              if (*(void *)v102 != v24) {
                objc_enumerationMutation(v22);
              }
              uint64_t v26 = [*(id *)(*((void *)&v101 + 1) + 8 * k) value];
              id v27 = (void *)MEMORY[0x1E4F5B3B0];
              uint64_t v28 = [v26 stringValue];
              long long v29 = [v27 normalizedStringFromContactString:v28];
              [v11 addObject:v29];
            }
            uint64_t v23 = [v22 countByEnumeratingWithState:&v101 objects:v149 count:16];
          }
          while (v23);
        }
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v109 objects:v151 count:16];
    }
    while (v12);
  }

  long long v30 = [MEMORY[0x1E4F1CBF0] arrayByAddingObjectsFromArray:v11];
  uint64_t v79 = [v30 arrayByAddingObjectsFromArray:v82];

  long long v31 = +[_PSLogging knnChannel];
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    long long v32 = [v88 seedRecipients];
    uint64_t v33 = [v32 count];
    uint64_t v34 = v128[3];
    uint64_t v35 = v124[3];
    uint64_t v36 = v120[3];
    uint64_t v37 = [obj count];
    uint64_t v38 = [v11 count];
    uint64_t v39 = [v82 count];
    *(_DWORD *)buf = 134219520;
    uint64_t v136 = v33;
    __int16 v137 = 2048;
    uint64_t v138 = v34;
    __int16 v139 = 2048;
    uint64_t v140 = v35;
    __int16 v141 = 2048;
    uint64_t v142 = v36;
    __int16 v143 = 2048;
    uint64_t v144 = v37;
    __int16 v145 = 2048;
    uint64_t v146 = v38;
    __int16 v147 = 2048;
    uint64_t v148 = v39;
    _os_log_impl(&dword_1A314B000, v31, OS_LOG_TYPE_DEFAULT, "Knn - co-recipient algorithm has %tu recipients (%tu email, %tu phone, %tu unknown) --> %tu contacts (%tu handles), %tu unmatched", buf, 0x48u);
  }
  uint64_t v40 = [v88 accountIdentifier];
  uint64_t v41 = [v88 bundleID];
  v134 = v41;
  uint64_t v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v134 count:1];
  uint64_t v43 = [(_PSKNNModel *)self interactionStore];
  long long v87 = +[_PSInteractionStoreUtils interactionsMatchingAnyHandlesOrDomainIds:v79 account:v40 directions:&unk_1EF6763F8 mechanisms:0 bundleIds:v42 store:v43 fetchLimit:2000];

  uint64_t v44 = +[_PSLogging knnChannel];
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    id v45 = objc_opt_new();
    long long v99 = 0u;
    long long v100 = 0u;
    long long v97 = 0u;
    long long v98 = 0u;
    id v46 = v87;
    uint64_t v47 = [v46 countByEnumeratingWithState:&v97 objects:v133 count:16];
    if (v47)
    {
      uint64_t v48 = *(void *)v98;
      do
      {
        for (uint64_t m = 0; m != v47; ++m)
        {
          if (*(void *)v98 != v48) {
            objc_enumerationMutation(v46);
          }
          unint64_t v50 = [*(id *)(*((void *)&v97 + 1) + 8 * m) bundleId];
          [v45 addObject:v50];
        }
        uint64_t v47 = [v46 countByEnumeratingWithState:&v97 objects:v133 count:16];
      }
      while (v47);
    }

    unint64_t v51 = [v45 allObjects];
    id v52 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    v95[0] = MEMORY[0x1E4F143A8];
    v95[1] = 3221225472;
    v95[2] = __99___PSKNNModel_rankedCoRecipientSuggestionsWithPredictionContext_modelConfiguration_maxSuggestions___block_invoke_338;
    v95[3] = &unk_1E5AE0B38;
    id v53 = v45;
    id v96 = v53;
    id v54 = objc_msgSend(v51, "_pas_mappedArrayWithTransform:", v95);
    id v55 = (void *)[v52 initWithObjects:v54 forKeys:v51];

    *(_DWORD *)buf = 138477827;
    uint64_t v136 = (uint64_t)v55;
    _os_log_impl(&dword_1A314B000, v44, OS_LOG_TYPE_DEFAULT, "Knn - co-recipient alogrithm considering interactions from bundle IDs: %{private}@", buf, 0xCu);
  }
  __int16 v78 = [(_PSKNNModel *)self featuresFromInteractionsSplitRecipients:v87];
  long long v56 = [v88 suggestionDate];
  long long v57 = [v87 firstObject];
  long long v58 = [v57 startDate];
  [v56 timeIntervalSinceDate:v58];
  double v60 = v59;

  long long v61 = +[_PSLogging knnChannel];
  if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v62 = @"NO";
    if (v60 > 21600.0) {
      uint64_t v62 = @"YES";
    }
    *(_DWORD *)buf = 138543362;
    uint64_t v136 = (uint64_t)v62;
    _os_log_impl(&dword_1A314B000, v61, OS_LOG_TYPE_DEFAULT, "Knn - co-recipient frequency-only? %{public}@", buf, 0xCu);
  }

  uint64_t v63 = [(_PSKNNModel *)self interactionLabelsForQueryResult:v78 queryPoint:v81 rankerType:2 frequencyOnly:v60 > 21600.0 contactsOnly:0];
  unint64_t v64 = [MEMORY[0x1E4F1CA80] set];
  long long v93 = 0u;
  long long v94 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  id v90 = v63;
  uint64_t v65 = [v90 countByEnumeratingWithState:&v91 objects:v132 count:16];
  if (v65)
  {
    uint64_t v66 = *(void *)v92;
    do
    {
      for (uint64_t n = 0; n != v65; ++n)
      {
        if (*(void *)v92 != v66) {
          objc_enumerationMutation(v90);
        }
        unint64_t v68 = [*(id *)(*((void *)&v91 + 1) + 8 * n) objectForKeyedSubscript:@"key"];
        v69 = [v68 objectForKeyedSubscript:@"conversationId"];

        if (v69)
        {
          if (([v64 containsObject:v69] & 1) == 0)
          {
            long long v70 = [v88 seedRecipients];
            char v71 = [v70 containsObject:v69];

            if ((v71 & 1) == 0)
            {
              uint64_t v72 = [[_PSRecipient alloc] initWithIdentifier:v69 handle:v69 displayName:0 contact:0];
              id v73 = [_PSSuggestion alloc];
              uint64_t v74 = [v88 bundleID];
              v131 = v72;
              v75 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v131 count:1];
              uint64_t v76 = [(_PSSuggestion *)v73 initWithBundleID:v74 conversationIdentifier:v69 groupName:0 recipients:v75];

              if (v76) {
                [v84 addObject:v76];
              }
              [v64 addObject:v69];
            }
          }
        }
      }
      uint64_t v65 = [v90 countByEnumeratingWithState:&v91 objects:v132 count:16];
    }
    while (v65);
  }

  _Block_object_dispose(&v119, 8);
  _Block_object_dispose(&v123, 8);
  _Block_object_dispose(&v127, 8);

  return v84;
}

- (id)rankedSuggestionsWithPredictionContext:(id)a3 bundleId:(id)a4 maxSuggestions:(unint64_t)a5 frequencyOnly:(BOOL)a6 interactions:(id)a7
{
  BOOL v7 = a6;
  id v12 = a7;
  id v13 = a4;
  id v14 = a3;
  id v15 = [(_PSKNNModel *)self messageInteractionCache];
  uint64_t v16 = [(_PSKNNModel *)self _rankedZkwSuggestionsWithPredictionContext:v14 bundleId:v13 maxSuggestions:a5 frequencyOnly:v7 interactions:v12 interactionCache:v15];

  return v16;
}

- (id)_rankedZkwSuggestionsWithPredictionContext:(id)a3 bundleId:(id)a4 maxSuggestions:(unint64_t)a5 frequencyOnly:(BOOL)a6 interactions:(id)a7 interactionCache:(id)a8
{
  BOOL v10 = a6;
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  id v16 = a8;
  uint64_t v17 = [v13 suggestionDate];
  uint64_t v18 = [(_PSKNNModel *)self featureVectorFromPredictionDate:v17 bundleId:0];

  uint64_t v19 = v15;
  if (!v15)
  {
    double v20 = [v16 interactions];
    unint64_t v21 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"bundleId == %@", v14];
    uint64_t v19 = [v20 filteredArrayUsingPredicate:v21];
  }
  uint64_t v72 = v16;
  id v73 = v14;
  uint64_t v22 = [(_PSKNNModel *)self featuresFromInteractions:v19];
  uint64_t v23 = [v13 bundleID];
  uint64_t v24 = +[_PSConstants mobilePhoneBundleId];
  int v25 = [v23 isEqualToString:v24];

  if (v25) {
    uint64_t v26 = 5;
  }
  else {
    uint64_t v26 = 0;
  }
  v69 = (void *)v22;
  long long v70 = (void *)v18;
  id v27 = [(_PSKNNModel *)self interactionLabelsForQueryResult:v22 queryPoint:v18 rankerType:v26 frequencyOnly:v10 contactsOnly:0];
  __int16 v78 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v28 = [MEMORY[0x1E4F1CA80] set];
  long long v97 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  obuint64_t j = v27;
  uint64_t v82 = [obj countByEnumeratingWithState:&v97 objects:v103 count:16];
  if (v82)
  {
    uint64_t v29 = *(void *)v98;
    uint64_t v80 = *(void *)v98;
    id v74 = v15;
    id v75 = v13;
    uint64_t v76 = v19;
    v77 = v28;
    do
    {
      uint64_t v30 = 0;
      do
      {
        if (*(void *)v98 != v29)
        {
          uint64_t v31 = v30;
          objc_enumerationMutation(obj);
          uint64_t v30 = v31;
        }
        long long v83 = *(void **)(*((void *)&v97 + 1) + 8 * v30);
        uint64_t v84 = v30;
        long long v32 = [v83 objectForKeyedSubscript:@"conversationId"];
        if (([v28 containsObject:v32] & 1) == 0)
        {
          uint64_t v86 = v32;
          if (v15)
          {
            long long v95 = 0u;
            long long v96 = 0u;
            long long v93 = 0u;
            long long v94 = 0u;
            id v85 = v19;
            uint64_t v33 = [v85 countByEnumeratingWithState:&v93 objects:v102 count:16];
            if (v33)
            {
              uint64_t v34 = v33;
              uint64_t v35 = *(void *)v94;
              while (2)
              {
                for (uint64_t i = 0; i != v34; ++i)
                {
                  if (*(void *)v94 != v35) {
                    objc_enumerationMutation(v85);
                  }
                  uint64_t v37 = *(void **)(*((void *)&v93 + 1) + 8 * i);
                  uint64_t v38 = [v37 domainIdentifier];
                  uint64_t v39 = [v13 bundleID];
                  uint64_t v40 = +[_PSConstants mobilePhoneBundleId];
                  int v41 = [v39 isEqualToString:v40];

                  if (v41)
                  {
                    uint64_t v42 = [v37 derivedIntentIdentifier];

                    uint64_t v38 = (void *)v42;
                  }
                  if ([v38 isEqualToString:v86])
                  {
                    uint64_t v79 = v38;
                    uint64_t v43 = [v37 groupName];
                    id v45 = (void *)MEMORY[0x1E4F1CA48];
                    id v46 = [v37 recipients];
                    uint64_t v44 = objc_msgSend(v45, "arrayWithCapacity:", objc_msgSend(v46, "count"));

                    long long v91 = 0u;
                    long long v92 = 0u;
                    long long v89 = 0u;
                    long long v90 = 0u;
                    id v87 = [v37 recipients];
                    uint64_t v47 = [v87 countByEnumeratingWithState:&v89 objects:v101 count:16];
                    if (v47)
                    {
                      uint64_t v48 = v47;
                      uint64_t v49 = *(void *)v90;
                      unint64_t v50 = v44;
                      do
                      {
                        for (uint64_t j = 0; j != v48; ++j)
                        {
                          id v52 = v43;
                          if (*(void *)v90 != v49) {
                            objc_enumerationMutation(v87);
                          }
                          id v53 = *(void **)(*((void *)&v89 + 1) + 8 * j);
                          id v54 = [_PSRecipient alloc];
                          uint64_t v55 = [v53 personIdType];
                          if (v55 == 3)
                          {
                            uint64_t v56 = [v53 personId];
                            id v88 = (void *)v56;
                          }
                          else
                          {
                            uint64_t v56 = 0;
                          }
                          long long v57 = [v53 identifier];
                          long long v58 = [v53 displayName];
                          double v59 = [(_PSRecipient *)v54 initWithIdentifier:v56 handle:v57 displayName:v58 contact:0];

                          if (v55 == 3) {
                          uint64_t v43 = v52;
                          }
                          uint64_t v44 = v50;
                          if (v59) {
                            [v50 addObject:v59];
                          }
                        }
                        uint64_t v48 = [v87 countByEnumeratingWithState:&v89 objects:v101 count:16];
                      }
                      while (v48);
                    }

                    id v15 = v74;
                    id v13 = v75;
                    goto LABEL_39;
                  }
                }
                uint64_t v34 = [v85 countByEnumeratingWithState:&v93 objects:v102 count:16];
                if (v34) {
                  continue;
                }
                break;
              }
              uint64_t v43 = 0;
              uint64_t v44 = 0;
LABEL_39:
              uint64_t v19 = v76;
            }
            else
            {
              uint64_t v43 = 0;
              uint64_t v44 = 0;
            }

            uint64_t v28 = v77;
          }
          else
          {
            uint64_t v43 = 0;
            uint64_t v44 = 0;
          }
          double v60 = [_PSSuggestion alloc];
          long long v61 = [v83 objectForKeyedSubscript:@"bundleId"];
          uint64_t v62 = [(_PSSuggestion *)v60 initWithBundleID:v61 conversationIdentifier:v86 groupName:v43 recipients:v44];

          if (v62) {
            [v78 addObject:v62];
          }
          uint64_t v29 = v80;
          long long v32 = v86;
          if (v86) {
            [v28 addObject:v86];
          }
        }
        uint64_t v30 = v84 + 1;
      }
      while (v84 + 1 != v82);
      uint64_t v82 = [obj countByEnumeratingWithState:&v97 objects:v103 count:16];
    }
    while (v82);
  }

  unint64_t v63 = [v78 count];
  if (v63 >= a5) {
    unint64_t v64 = a5;
  }
  else {
    unint64_t v64 = v63;
  }
  uint64_t v65 = objc_msgSend(v78, "subarrayWithRange:", 0, v64);
  uint64_t v66 = v28;
  id v67 = (void *)v65;

  return v67;
}

- (id)rankedNameSuggestionsWithPredictionContext:(id)a3 forName:(id)a4
{
  return [(_PSKNNModel *)self rankedNameSuggestionsWithPredictionContext:a3 forName:a4 contactsOnly:1];
}

- (id)rankedNameSuggestionsWithPredictionContext:(id)a3 forName:(id)a4 contactsOnly:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v124 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v8 && [v8 length])
  {
    BOOL v92 = v5;
    __int16 v78 = v9;
    id v71 = v7;
    BOOL v10 = [(_PSKNNModel *)self messageInteractionCache];
    id v11 = [v10 interactions];

    id v12 = [MEMORY[0x1E4F1CA48] array];
    long long v114 = 0u;
    long long v115 = 0u;
    long long v116 = 0u;
    long long v117 = 0u;
    obuint64_t j = v11;
    uint64_t v13 = [obj countByEnumeratingWithState:&v114 objects:v123 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v115;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v115 != v15) {
            objc_enumerationMutation(obj);
          }
          uint64_t v17 = *(void **)(*((void *)&v114 + 1) + 8 * i);
          uint64_t v18 = [v17 recipients];
          uint64_t v19 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"displayName CONTAINS[cd] %@", v78];
          double v20 = [v18 filteredArrayUsingPredicate:v19];

          if ([v20 count]) {
            [v12 addObject:v17];
          }
        }
        uint64_t v14 = [obj countByEnumeratingWithState:&v114 objects:v123 count:16];
      }
      while (v14);
    }

    id v21 = v12;
    uint64_t v22 = (uint64_t)v21;
    if (![v21 count])
    {
      uint64_t v23 = [(_PSKNNModel *)self interactionStore];
      uint64_t v22 = +[_PSInteractionStoreUtils interactionsContainingSearchStringInDisplayName:v78 account:0 directions:&unk_1EF676410 bundleIds:0 store:v23 fetchLimit:1000];
    }
    v69 = (void *)v22;
    long long v70 = v21;
    uint64_t v24 = [(_PSKNNModel *)self rankedGlobalSuggestionsWithPredictionContext:v71 maxSuggestions:2000 contactsOnly:v92 interactions:v22 contactIdIsInStoreBlock:0];
    long long v91 = (void *)[v24 mutableCopy];
    id v93 = [MEMORY[0x1E4F1CA48] array];
    int v25 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v26 = [(_PSKNNModel *)self normalizedStringFromString:v78];
    id v75 = [v26 componentsSeparatedByString:@" "];
    long long v110 = 0u;
    long long v111 = 0u;
    long long v112 = 0u;
    long long v113 = 0u;
    id v73 = v24;
    uint64_t v27 = [v73 countByEnumeratingWithState:&v110 objects:v122 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v87 = *(void *)v111;
      do
      {
        for (uint64_t j = 0; j != v28; ++j)
        {
          if (*(void *)v111 != v87) {
            objc_enumerationMutation(v73);
          }
          uint64_t v30 = *(void **)(*((void *)&v110 + 1) + 8 * j);
          uint64_t v31 = (void *)MEMORY[0x1A6243860]();
          long long v32 = [v30 recipients];
          uint64_t v33 = [v32 firstObject];
          uint64_t v34 = [v33 displayName];

          if (v34)
          {
            uint64_t v35 = [(_PSKNNModel *)self normalizedStringFromString:v34];
            if ([v35 isEqualToString:v26])
            {
              uint64_t v36 = [v30 conversationIdentifier];
              char v37 = [v25 containsObject:v36];

              if ((v37 & 1) == 0)
              {
                [v93 addObject:v30];
                uint64_t v38 = [v30 conversationIdentifier];
                [v25 addObject:v38];

                [v91 removeObject:v30];
              }
            }
          }
        }
        uint64_t v28 = [v73 countByEnumeratingWithState:&v110 objects:v122 count:16];
      }
      while (v28);
    }

    long long v106 = 0u;
    long long v107 = 0u;
    long long v108 = 0u;
    long long v109 = 0u;
    id v72 = (id)[v91 mutableCopy];
    uint64_t v79 = [v72 countByEnumeratingWithState:&v106 objects:v121 count:16];
    if (v79)
    {
      id v76 = *(id *)v107;
      do
      {
        for (uint64_t k = 0; k != v79; ++k)
        {
          if (*(id *)v107 != v76) {
            objc_enumerationMutation(v72);
          }
          uint64_t v40 = *(void **)(*((void *)&v106 + 1) + 8 * k);
          int v41 = (void *)MEMORY[0x1A6243860]();
          uint64_t v42 = [v40 recipients];
          uint64_t v43 = [v42 firstObject];
          uint64_t v44 = [v43 displayName];

          if (v44)
          {
            id v85 = v41;
            uint64_t v88 = k;
            long long v83 = v44;
            v81 = [(_PSKNNModel *)self normalizedStringFromString:v44];
            id v45 = [v81 componentsSeparatedByString:@" "];
            long long v102 = 0u;
            long long v103 = 0u;
            long long v104 = 0u;
            long long v105 = 0u;
            id v46 = v75;
            uint64_t v47 = [v46 countByEnumeratingWithState:&v102 objects:v120 count:16];
            if (v47)
            {
              uint64_t v48 = v47;
              uint64_t v49 = *(void *)v103;
              do
              {
                for (uint64_t m = 0; m != v48; ++m)
                {
                  if (*(void *)v103 != v49) {
                    objc_enumerationMutation(v46);
                  }
                  if ([v45 containsObject:*(void *)(*((void *)&v102 + 1) + 8 * m)])
                  {
                    unint64_t v51 = [v40 conversationIdentifier];
                    char v52 = [v25 containsObject:v51];

                    if ((v52 & 1) == 0)
                    {
                      [v93 addObject:v40];
                      id v53 = [v40 conversationIdentifier];
                      [v25 addObject:v53];

                      [v91 removeObject:v40];
                    }
                  }
                }
                uint64_t v48 = [v46 countByEnumeratingWithState:&v102 objects:v120 count:16];
              }
              while (v48);
            }

            int v41 = v85;
            uint64_t k = v88;
            uint64_t v44 = v83;
          }
        }
        uint64_t v79 = [v72 countByEnumeratingWithState:&v106 objects:v121 count:16];
      }
      while (v79);
    }

    long long v98 = 0u;
    long long v99 = 0u;
    long long v100 = 0u;
    long long v101 = 0u;
    id v77 = (id)[v91 mutableCopy];
    uint64_t v82 = [v77 countByEnumeratingWithState:&v98 objects:v119 count:16];
    if (v82)
    {
      uint64_t v80 = *(void *)v99;
      do
      {
        for (uint64_t n = 0; n != v82; ++n)
        {
          if (*(void *)v99 != v80) {
            objc_enumerationMutation(v77);
          }
          uint64_t v55 = *(void **)(*((void *)&v98 + 1) + 8 * n);
          uint64_t v56 = (void *)MEMORY[0x1A6243860]();
          long long v57 = [v55 recipients];
          long long v58 = [v57 firstObject];
          double v59 = [v58 displayName];

          if (v59)
          {
            uint64_t v86 = v59;
            long long v89 = v56;
            uint64_t v84 = [(_PSKNNModel *)self normalizedStringFromString:v59];
            double v60 = [v84 componentsSeparatedByString:@" "];
            long long v94 = 0u;
            long long v95 = 0u;
            long long v96 = 0u;
            long long v97 = 0u;
            uint64_t v61 = [v60 countByEnumeratingWithState:&v94 objects:v118 count:16];
            if (v61)
            {
              uint64_t v62 = v61;
              uint64_t v63 = *(void *)v95;
              do
              {
                for (iuint64_t i = 0; ii != v62; ++ii)
                {
                  if (*(void *)v95 != v63) {
                    objc_enumerationMutation(v60);
                  }
                  if ([*(id *)(*((void *)&v94 + 1) + 8 * ii) hasPrefix:v26])
                  {
                    uint64_t v65 = [v55 conversationIdentifier];
                    char v66 = [v25 containsObject:v65];

                    if ((v66 & 1) == 0)
                    {
                      [v93 addObject:v55];
                      id v67 = [v55 conversationIdentifier];
                      [v25 addObject:v67];

                      [v91 removeObject:v55];
                    }
                  }
                }
                uint64_t v62 = [v60 countByEnumeratingWithState:&v94 objects:v118 count:16];
              }
              while (v62);
            }

            double v59 = v86;
            uint64_t v56 = v89;
          }
        }
        uint64_t v82 = [v77 countByEnumeratingWithState:&v98 objects:v119 count:16];
      }
      while (v82);
    }

    id v7 = v71;
    id v9 = v78;
  }
  else
  {
    id v93 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v93;
}

- (id)normalizedStringFromString:(id)a3
{
  return (id)MEMORY[0x1F41462C8](a3, 0);
}

- (id)rankedGlobalSuggestionsWithPredictionContext:(id)a3 maxSuggestions:(unint64_t)a4 contactsOnly:(BOOL)a5 interactions:(id)a6 contactIdIsInStoreBlock:(id)a7
{
  BOOL v9 = a5;
  v71[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a6;
  uint64_t v61 = (unsigned int (**)(id, void *))a7;
  uint64_t v13 = [v11 suggestionDate];
  uint64_t v62 = self;
  uint64_t v14 = [(_PSKNNModel *)self featureVectorFromPredictionDate:v13 bundleId:0];

  uint64_t v15 = [v11 bundleID];

  if (v15)
  {
    id v16 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v17 = [v11 bundleID];
    v71[0] = v17;
    uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v71 count:1];
    long long v58 = [v16 setWithArray:v18];
  }
  else
  {
    long long v58 = 0;
  }
  double v59 = (void *)v14;
  if (!v12)
  {
    uint64_t v19 = [(_PSKNNModel *)v62 interactionStore];
    double v20 = [MEMORY[0x1E4F1C9C8] distantPast];
    id v21 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v22 = [v21 dateByAddingTimeInterval:28800.0];
    [v11 accountIdentifier];
    v24 = BOOL v23 = v9;
    int v25 = (void *)MEMORY[0x1A6243860]();
    uint64_t v26 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", &unk_1EF6757B0, &unk_1EF675780, 0);
    LOBYTE(v54) = 0;
    uint64_t v27 = (void *)v19;
    id v12 = +[_PSInteractionStoreUtils interactionsFromStore:v19 startDate:v20 tillDate:v22 withMechanisms:0 withAccount:v24 withBundleIds:v58 withTargetBundleIds:0 withDirections:v26 singleRecipient:v54 fetchLimit:1000];

    BOOL v9 = v23;
  }
  uint64_t v28 = [(_PSKNNModel *)v62 featuresFromInteractionsSplitRecipients:v12];
  long long v57 = v11;
  uint64_t v29 = [v11 suggestionDate];
  uint64_t v55 = v12;
  uint64_t v30 = [v12 firstObject];
  uint64_t v31 = [v30 startDate];
  [v29 timeIntervalSinceDate:v31];
  BOOL v33 = v32 > 21600.0;

  uint64_t v34 = [(_PSKNNModel *)v62 interactionLabelsForQueryResult:v28 queryPoint:v14 rankerType:1 frequencyOnly:v33 contactsOnly:v9];
  double v60 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v63 = [MEMORY[0x1E4F1CA80] set];
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  obuint64_t j = v34;
  uint64_t v35 = [obj countByEnumeratingWithState:&v66 objects:v70 count:16];
  if (v35)
  {
    uint64_t v36 = v35;
    if (v61) {
      BOOL v37 = v9;
    }
    else {
      BOOL v37 = 0;
    }
    BOOL v64 = v37;
    uint64_t v38 = *(void *)v67;
    uint64_t v39 = @"conversationId";
    do
    {
      uint64_t v40 = 0;
      int v41 = v63;
      do
      {
        if (*(void *)v67 != v38) {
          objc_enumerationMutation(obj);
        }
        uint64_t v42 = [*(id *)(*((void *)&v66 + 1) + 8 * v40) objectForKeyedSubscript:@"key"];
        uint64_t v43 = [v42 objectForKeyedSubscript:v39];
        if (([v41 containsObject:v43] & 1) == 0 && (!v64 || v61[2](v61, v43)))
        {
          uint64_t v44 = v39;
          id v45 = [_PSSuggestion alloc];
          id v46 = [v42 objectForKeyedSubscript:@"recipients"];
          uint64_t v47 = (objc_class *)objc_opt_class();
          uint64_t v48 = NSStringFromClass(v47);
          uint64_t v49 = [(_PSSuggestion *)v45 initWithBundleID:0 conversationIdentifier:v43 groupName:0 recipients:v46 reason:@"kNN model" reasonType:v48];

          if (v49) {
            [v60 addObject:v49];
          }
          int v41 = v63;
          [v63 addObject:v43];

          uint64_t v39 = v44;
        }

        ++v40;
      }
      while (v36 != v40);
      uint64_t v36 = [obj countByEnumeratingWithState:&v66 objects:v70 count:16];
    }
    while (v36);
  }

  unint64_t v50 = [v60 count];
  if (v50 >= a4) {
    unint64_t v51 = a4;
  }
  else {
    unint64_t v51 = v50;
  }
  char v52 = objc_msgSend(v60, "subarrayWithRange:", 0, v51);

  return v52;
}

- (id)rankedGlobalSuggestionsForSiriNLWithPredictionContext:(id)a3 maxSuggestions:(unint64_t)a4
{
  v56[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [v5 suggestionDate];
  uint64_t v48 = self;
  uint64_t v7 = [(_PSKNNModel *)self featureVectorFromPredictionDate:v6 bundleId:0];

  id v8 = [v5 bundleID];

  if (v8)
  {
    BOOL v9 = (void *)MEMORY[0x1E4F1CAD0];
    BOOL v10 = [v5 bundleID];
    v56[0] = v10;
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:1];
    uint64_t v12 = [v9 setWithArray:v11];
  }
  else
  {
    uint64_t v12 = 0;
  }
  uint64_t v13 = [(_PSKNNModel *)v48 interactionStore];
  uint64_t v14 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1EF676428];
  id v45 = v5;
  uint64_t v15 = [v5 accountIdentifier];
  id v16 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1EF676440];
  uint64_t v42 = (void *)v12;
  uint64_t v17 = +[_PSInteractionStoreUtils interactionsFromStore:v13 referenceDate:0 withMechanisms:v14 withAccount:v15 withBundleIds:v12 withTargetBundleIds:0 withDirections:v16 fetchLimit:5000];

  int v41 = (void *)v17;
  uint64_t v40 = [(_PSKNNModel *)v48 featuresFromInteractionsSplitRecipients:v17];
  uint64_t v44 = (void *)v7;
  uint64_t v18 = -[_PSKNNModel interactionLabelsForQueryResult:queryPoint:rankerType:frequencyOnly:contactsOnly:](v48, "interactionLabelsForQueryResult:queryPoint:rankerType:frequencyOnly:contactsOnly:");
  id v46 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v19 = [MEMORY[0x1E4F1CA80] set];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  obuint64_t j = v18;
  uint64_t v20 = [obj countByEnumeratingWithState:&v51 objects:v55 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = @"key";
    uint64_t v23 = *(void *)v52;
    uint64_t v47 = *(void *)v52;
    do
    {
      uint64_t v24 = 0;
      uint64_t v49 = v21;
      do
      {
        if (*(void *)v52 != v23) {
          objc_enumerationMutation(obj);
        }
        int v25 = *(void **)(*((void *)&v51 + 1) + 8 * v24);
        uint64_t v26 = [v25 objectForKeyedSubscript:v22];
        uint64_t v27 = [v26 objectForKeyedSubscript:@"conversationId"];
        if (([v19 containsObject:v27] & 1) == 0)
        {
          uint64_t v28 = v19;
          uint64_t v29 = v22;
          uint64_t v30 = [_PSSuggestion alloc];
          uint64_t v31 = [v26 objectForKeyedSubscript:@"recipients"];
          double v32 = (objc_class *)objc_opt_class();
          BOOL v33 = NSStringFromClass(v32);
          uint64_t v34 = [v25 objectForKeyedSubscript:@"score"];
          uint64_t v35 = [(_PSSuggestion *)v30 initWithBundleID:0 conversationIdentifier:v27 groupName:0 recipients:v31 reason:@"kNN model" reasonType:v33 score:v34];

          if (v35) {
            [v46 addObject:v35];
          }
          uint64_t v19 = v28;
          [v28 addObject:v27];

          uint64_t v22 = v29;
          uint64_t v23 = v47;
          uint64_t v21 = v49;
        }

        ++v24;
      }
      while (v21 != v24);
      uint64_t v21 = [obj countByEnumeratingWithState:&v51 objects:v55 count:16];
    }
    while (v21);
  }

  unint64_t v36 = [v46 count];
  if (v36 >= a4) {
    unint64_t v37 = a4;
  }
  else {
    unint64_t v37 = v36;
  }
  uint64_t v38 = objc_msgSend(v46, "subarrayWithRange:", 0, v37);

  return v38;
}

- (id)suggestionProxiesWithPredictionContext:(id)a3
{
  uint64_t v116 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v102 = [(_PSKNNModel *)self featureVectorFromPredictionContext:v4];
  id v5 = [(_PSKNNModel *)self shareInteractionCache];
  id v6 = [v5 interactions];
  uint64_t v7 = [(_PSKNNModel *)self _PSKnnModelMinimumOccurenceOfInteractionByMechanism];
  long long v105 = self;
  id v8 = [(_PSKNNModel *)self filterShareInteractions:v6 minimumOccurencesByMechanism:v7 contextBundleId:0 filterOutNonMatchingSourceBundleIDs:0];

  BOOL v9 = +[_PSLogging knnChannel];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    BOOL v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
    *(_DWORD *)buf = 138412290;
    long long v115 = v10;
    _os_log_impl(&dword_1A314B000, v9, OS_LOG_TYPE_INFO, "Knn - Number of sharesheet interactions = %@", buf, 0xCu);
  }
  id v11 = [(_PSKNNModel *)self featuresFromInteractions:v8];
  uint64_t v12 = [v11 objectAtIndex:0];
  uint64_t v13 = [(_PSKNNModel *)self neighborsFromTrainingData:v12 k:[(_PSKNNModel *)self k] queryPoint:v102];

  long long v101 = [(_PSKNNModel *)self extractNearestNeighborLabelsForQueryResult:v11 andNeighbors:v13 frequencyOnly:0 rankerType:0 contactsOnly:0 reason:@"Previous Share"];
  uint64_t v14 = +[_PSLogging knnChannel];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[_PSKNNModel suggestionProxiesWithPredictionContext:]();
  }

  uint64_t v15 = [(_PSKNNModel *)self messageInteractionCache];
  id v16 = [v15 interactions];

  uint64_t v17 = +[_PSLogging knnChannel];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    uint64_t v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v16, "count"));
    *(_DWORD *)buf = 138412290;
    long long v115 = v18;
    _os_log_impl(&dword_1A314B000, v17, OS_LOG_TYPE_INFO, "Knn - Number of all interactions (sans Mail) = %@", buf, 0xCu);
  }
  uint64_t v19 = [(_PSKNNModel *)v105 featuresFromInteractions:v16];

  uint64_t v20 = [v19 objectAtIndex:0];
  uint64_t v21 = [(_PSKNNModel *)v105 neighborsFromTrainingData:v20 k:[(_PSKNNModel *)v105 k] queryPoint:v102];

  long long v98 = (void *)v21;
  long long v99 = v19;
  uint64_t v22 = [(_PSKNNModel *)v105 extractNearestNeighborLabelsForQueryResult:v19 andNeighbors:v21 frequencyOnly:0 rankerType:0 contactsOnly:0 reason:@"Message Interaction"];
  uint64_t v23 = [v4 suggestionDate];
  uint64_t v24 = [v4 bundleID];
  int v25 = [(_PSKNNModel *)v105 splitShareLabels:v101 suggestionDate:v23 contextBundleId:v24];

  uint64_t v26 = [v25 objectForKeyedSubscript:@"prioritizedShareLabels"];
  long long v96 = v25;
  uint64_t v27 = [v25 objectForKeyedSubscript:@"otherShareLabels"];
  uint64_t v28 = [(_PSKNNModel *)v105 sliceStart:0 end:[(_PSKNNModel *)v105 _PSKnnTopKShares] ofArray:v22];
  long long v100 = v16;
  long long v97 = v22;
  if (v28)
  {
    id v29 = (id)v28;
    uint64_t v30 = -[_PSKNNModel sliceStart:end:ofArray:](v105, "sliceStart:end:ofArray:", -[_PSKNNModel _PSKnnTopKShares](v105, "_PSKnnTopKShares"), [v22 count], v22);
  }
  else
  {
    id v29 = v22;
    uint64_t v30 = 0;
  }
  id v104 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v95 = (void *)v26;
  id v93 = v29;
  uint64_t v31 = [(_PSKNNModel *)v105 mergedSuggestionsFromShares:v26 andInteractions:v29];
  long long v94 = (void *)v27;
  BOOL v92 = (void *)v30;
  long long v90 = [(_PSKNNModel *)v105 mergedSuggestionsFromShares:v27 andInteractions:v30];
  long long v91 = (void *)v31;
  -[_PSKNNModel mergedSuggestionsFromShares:andInteractions:](v105, "mergedSuggestionsFromShares:andInteractions:", v31);
  long long v109 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v108 = [obj countByEnumeratingWithState:&v109 objects:v113 count:16];
  if (v108)
  {
    uint64_t v107 = *(void *)v110;
    id v103 = v4;
    do
    {
      uint64_t v32 = 0;
      do
      {
        if (*(void *)v110 != v107) {
          objc_enumerationMutation(obj);
        }
        BOOL v33 = *(void **)(*((void *)&v109 + 1) + 8 * v32);
        uint64_t v34 = [v33 objectForKeyedSubscript:@"bundleId"];
        uint64_t v35 = [v4 suggestionDate];
        unint64_t v36 = [v33 objectForKeyedSubscript:@"startDate"];
        [v35 timeIntervalSinceDate:v36];
        uint64_t v38 = (int)(v37 / 86400.0);

        uint64_t v39 = [v4 bundleID];
        uint64_t v40 = [v33 objectForKeyedSubscript:@"sourceBundleId"];
        int v41 = [v39 isEqualToString:v40];

        uint64_t v42 = [v33 objectForKeyedSubscript:@"sourceBundleId"];
        uint64_t v43 = [v33 objectForKeyedSubscript:@"bundleId"];
        int v44 = [v42 isEqualToString:v43];

        id v45 = [NSString alloc];
        uint64_t v46 = [v33 objectForKeyedSubscript:@"reason"];
        uint64_t v47 = (void *)v46;
        if (v44)
        {
          uint64_t v48 = [v45 initWithFormat:@"%@\n%@\nSent %d days ago", @"kNN Model", v46, v38, v89];
        }
        else
        {
          uint64_t v49 = @"From a different bundle ID";
          if (v41) {
            uint64_t v49 = @"From the same bundle ID";
          }
          uint64_t v48 = [v45 initWithFormat:@"%@\n%@\nSent %d days ago\n%@", @"kNN Model", v46, v38, v49];
        }
        unint64_t v50 = (void *)v48;

        uint64_t v51 = [v4 peopleInPhotoIdentifiers];
        long long v52 = &off_1E5ADE000;
        if (v51)
        {
          long long v53 = (void *)v51;
          long long v54 = [v4 peopleInPhotoIdentifiers];
          uint64_t v55 = [v54 count];

          if (v55)
          {
            uint64_t v56 = (void *)MEMORY[0x1E4F1CA80];
            long long v57 = [v4 peopleInPhotoIdentifiers];
            long long v58 = [v56 setWithArray:v57];

            double v59 = [v33 objectForKeyedSubscript:@"peopleInPhoto"];
            [v58 intersectSet:v59];
            double v60 = [v58 allObjects];
            uint64_t v61 = [v60 count];
            uint64_t v62 = @"these people";
            if (v61 == 1) {
              uint64_t v62 = @"this person";
            }
            uint64_t v63 = (objc_class *)NSString;
            BOOL v64 = v62;
            id v65 = [v63 alloc];
            long long v66 = [v60 sortedArrayUsingComparator:&__block_literal_global_412];
            long long v67 = (void *)[v65 initWithFormat:@"%@\nPhotos containing %@ were sent to this conversation in previous shares\n\nDetected People:\n%@", v50, v64, v66];

            if ([v58 count])
            {
              id v68 = v67;

              unint64_t v50 = v68;
            }
            long long v52 = &off_1E5ADE000;

            id v4 = v103;
          }
        }
        long long v69 = [v52[121] mobileMessagesBundleId];
        int v70 = [v34 isEqualToString:v69];

        if (v70)
        {
          id v71 = v33;
          id v72 = @"conversationId";
LABEL_29:
          id v73 = [v71 objectForKeyedSubscript:v72];
          if (!v34) {
            goto LABEL_38;
          }
          goto LABEL_36;
        }
        id v74 = [v52[121] mobileMailBundleId];
        int v75 = [v34 isEqualToString:v74];

        if (v75)
        {
          id v76 = (void *)MEMORY[0x1E4F5B3D8];
          id v77 = v33;
          __int16 v78 = @"mailRecipients";
        }
        else
        {
          uint64_t v79 = [v52[121] sharePlayBundleId];
          int v80 = [v34 isEqualToString:v79];

          if (!v80)
          {
            uint64_t v86 = [v33 objectForKeyedSubscript:@"derivedIntentIdentifier"];

            id v73 = 0;
            if (!v86 || !v34) {
              goto LABEL_38;
            }
            id v71 = v33;
            id v72 = @"derivedIntentIdentifier";
            goto LABEL_29;
          }
          id v76 = (void *)MEMORY[0x1E4F5B3D8];
          id v77 = v33;
          __int16 v78 = @"expanseRecipients";
        }
        v81 = [v77 objectForKeyedSubscript:v78];
        id v73 = [v76 generateConversationIdFromInteractionRecipients:v81];

        if (!v34) {
          goto LABEL_38;
        }
LABEL_36:
        if (v73)
        {
          uint64_t v82 = [_PSSuggestionProxy alloc];
          long long v83 = (objc_class *)objc_opt_class();
          uint64_t v84 = NSStringFromClass(v83);
          id v85 = [(_PSSuggestionProxy *)v82 initWithBundleID:v34 interactionRecipients:v73 contactID:0 reason:v50 reasonType:v84];

          [v104 addObject:v85];
        }
LABEL_38:

        ++v32;
      }
      while (v108 != v32);
      uint64_t v87 = [obj countByEnumeratingWithState:&v109 objects:v113 count:16];
      uint64_t v108 = v87;
    }
    while (v87);
  }

  return v104;
}

- (id)suggestionProxiesBasedOnSharingInteractionsWithPredictionContext:(id)a3 withOnlyTopShares:(BOOL)a4 withFilterOutNonMatchingSourceBundleIDs:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  BOOL v9 = [v8 suggestionDate];
  BOOL v10 = [v8 bundleID];
  uint64_t v11 = [(_PSKNNModel *)self featureVectorFromPredictionDate:v9 bundleId:v10];

  uint64_t v12 = [(_PSKNNModel *)self shareInteractionCache];
  uint64_t v13 = [v12 interactions];
  uint64_t v14 = [(_PSKNNModel *)self _PSKnnModelMinimumOccurenceOfInteractionByMechanism];
  uint64_t v15 = [v8 bundleID];
  uint64_t v16 = [(_PSKNNModel *)self filterShareInteractions:v13 minimumOccurencesByMechanism:v14 contextBundleId:v15 filterOutNonMatchingSourceBundleIDs:v5];

  uint64_t v17 = (void *)v16;
  uint64_t v18 = +[_PSLogging knnChannel];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    uint64_t v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v17, "count"));
    *(_DWORD *)buf = 138412290;
    id v71 = v19;
    _os_log_impl(&dword_1A314B000, v18, OS_LOG_TYPE_INFO, "Knn - Number of sharesheet interactions = %@", buf, 0xCu);
  }
  uint64_t v61 = v17;
  uint64_t v20 = [(_PSKNNModel *)self featuresFromInteractions:v17];
  uint64_t v21 = [v20 objectAtIndex:0];
  uint64_t v62 = (void *)v11;
  uint64_t v22 = [(_PSKNNModel *)self neighborsFromTrainingData:v21 k:[(_PSKNNModel *)self k] queryPoint:v11];

  double v59 = (void *)v22;
  double v60 = v20;
  uint64_t v23 = [(_PSKNNModel *)self extractNearestNeighborLabelsForQueryResult:v20 andNeighbors:v22 frequencyOnly:0 rankerType:0 contactsOnly:0 reason:@"Previous Share"];
  uint64_t v24 = +[_PSLogging knnChannel];
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
    -[_PSKNNModel suggestionProxiesWithPredictionContext:]();
  }

  int v25 = [v8 suggestionDate];
  uint64_t v63 = v8;
  uint64_t v26 = [v8 bundleID];
  long long v58 = (void *)v23;
  uint64_t v27 = [(_PSKNNModel *)self splitShareLabels:v23 suggestionDate:v25 contextBundleId:v26];

  uint64_t v28 = [v27 objectForKeyedSubscript:@"prioritizedShareLabels"];
  long long v57 = v27;
  uint64_t v29 = [v27 objectForKeyedSubscript:@"otherShareLabels"];
  id v64 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v55 = (void *)v29;
  uint64_t v56 = (void *)v28;
  if (v6) {
    uint64_t v30 = 0;
  }
  else {
    uint64_t v30 = v29;
  }
  [(_PSKNNModel *)self mergedSuggestionsFromShares:v28 andInteractions:v30];
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id v31 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v32 = [v31 countByEnumeratingWithState:&v65 objects:v69 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v66;
    do
    {
      uint64_t v35 = 0;
      do
      {
        if (*(void *)v66 != v34) {
          objc_enumerationMutation(v31);
        }
        unint64_t v36 = *(void **)(*((void *)&v65 + 1) + 8 * v35);
        double v37 = [v36 objectForKeyedSubscript:@"bundleId"];
        uint64_t v38 = +[_PSConstants mobileMessagesBundleId];
        int v39 = [v37 isEqualToString:v38];

        if (v39)
        {
          uint64_t v40 = v36;
          int v41 = @"conversationId";
LABEL_15:
          uint64_t v42 = [v40 objectForKeyedSubscript:v41];
          goto LABEL_18;
        }
        uint64_t v43 = +[_PSConstants mobileMailBundleId];
        int v44 = [v37 isEqualToString:v43];

        if (!v44)
        {
          long long v52 = [v36 objectForKeyedSubscript:@"derivedIntentIdentifier"];

          uint64_t v42 = 0;
          if (!v52 || !v37) {
            goto LABEL_23;
          }
          uint64_t v40 = v36;
          int v41 = @"derivedIntentIdentifier";
          goto LABEL_15;
        }
        id v45 = (void *)MEMORY[0x1E4F5B3D8];
        uint64_t v46 = [v36 objectForKeyedSubscript:@"mailRecipients"];
        uint64_t v42 = [v45 generateConversationIdFromInteractionRecipients:v46];

LABEL_18:
        if (v37) {
          BOOL v47 = v42 == 0;
        }
        else {
          BOOL v47 = 1;
        }
        if (!v47)
        {
          uint64_t v48 = [_PSSuggestionProxy alloc];
          uint64_t v49 = (objc_class *)objc_opt_class();
          unint64_t v50 = NSStringFromClass(v49);
          uint64_t v51 = [(_PSSuggestionProxy *)v48 initWithBundleID:v37 interactionRecipients:v42 contactID:0 reason:@"kNN model" reasonType:v50];

          [v64 addObject:v51];
        }
LABEL_23:

        ++v35;
      }
      while (v33 != v35);
      uint64_t v53 = [v31 countByEnumeratingWithState:&v65 objects:v69 count:16];
      uint64_t v33 = v53;
    }
    while (v53);
  }

  return v64;
}

- (id)suggestionProxiesBasedOnNonSharingInteractionsWithPredictionContext:(id)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [v4 suggestionDate];
  uint64_t v49 = v4;
  BOOL v6 = [v4 bundleID];
  uint64_t v7 = [(_PSKNNModel *)self featureVectorFromPredictionDate:v5 bundleId:v6];

  id v8 = [(_PSKNNModel *)self messageInteractionCache];
  BOOL v9 = [v8 interactions];

  BOOL v10 = +[_PSLogging knnChannel];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
    *(_DWORD *)buf = 138412290;
    long long v57 = v11;
    _os_log_impl(&dword_1A314B000, v10, OS_LOG_TYPE_INFO, "Knn - Number of all interactions (sans Mail) = %@", buf, 0xCu);
  }
  uint64_t v12 = [(_PSKNNModel *)self featuresFromInteractions:v9];
  uint64_t v13 = [v12 objectAtIndex:0];
  uint64_t v14 = [(_PSKNNModel *)self neighborsFromTrainingData:v13 k:[(_PSKNNModel *)self k] queryPoint:v7];

  uint64_t v46 = (void *)v14;
  BOOL v47 = v12;
  uint64_t v15 = [(_PSKNNModel *)self extractNearestNeighborLabelsForQueryResult:v12 andNeighbors:v14 frequencyOnly:0 rankerType:0 contactsOnly:0 reason:@"Message Interaction"];
  uint64_t v16 = [(_PSKNNModel *)self sliceStart:0 end:[(_PSKNNModel *)self _PSKnnTopKShares] ofArray:v15];
  uint64_t v48 = v9;
  id v45 = v15;
  if (v16)
  {
    id v17 = (id)v16;
    uint64_t v18 = -[_PSKNNModel sliceStart:end:ofArray:](self, "sliceStart:end:ofArray:", -[_PSKNNModel _PSKnnTopKShares](self, "_PSKnnTopKShares"), [v15 count], v15);
  }
  else
  {
    id v17 = v15;
    uint64_t v18 = 0;
  }
  id v50 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v43 = (void *)v18;
  int v44 = v17;
  uint64_t v19 = [(_PSKNNModel *)self mergedSuggestionsFromShares:v17 andInteractions:v18];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v51 objects:v55 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v52;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v52 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = *(void **)(*((void *)&v51 + 1) + 8 * v23);
        int v25 = [v24 objectForKeyedSubscript:@"bundleId"];
        uint64_t v26 = +[_PSConstants mobileMessagesBundleId];
        int v27 = [v25 isEqualToString:v26];

        if (v27)
        {
          uint64_t v28 = v24;
          uint64_t v29 = @"conversationId";
LABEL_13:
          uint64_t v30 = [v28 objectForKeyedSubscript:v29];
          goto LABEL_16;
        }
        id v31 = +[_PSConstants mobileMailBundleId];
        int v32 = [v25 isEqualToString:v31];

        if (!v32)
        {
          uint64_t v40 = [v24 objectForKeyedSubscript:@"derivedIntentIdentifier"];

          uint64_t v30 = 0;
          if (!v40 || !v25) {
            goto LABEL_21;
          }
          uint64_t v28 = v24;
          uint64_t v29 = @"derivedIntentIdentifier";
          goto LABEL_13;
        }
        uint64_t v33 = (void *)MEMORY[0x1E4F5B3D8];
        uint64_t v34 = [v24 objectForKeyedSubscript:@"mailRecipients"];
        uint64_t v30 = [v33 generateConversationIdFromInteractionRecipients:v34];

LABEL_16:
        if (v25) {
          BOOL v35 = v30 == 0;
        }
        else {
          BOOL v35 = 1;
        }
        if (!v35)
        {
          unint64_t v36 = [_PSSuggestionProxy alloc];
          double v37 = (objc_class *)objc_opt_class();
          uint64_t v38 = NSStringFromClass(v37);
          int v39 = [(_PSSuggestionProxy *)v36 initWithBundleID:v25 interactionRecipients:v30 contactID:0 reason:@"kNN model" reasonType:v38];

          [v50 addObject:v39];
        }
LABEL_21:

        ++v23;
      }
      while (v21 != v23);
      uint64_t v41 = [v19 countByEnumeratingWithState:&v51 objects:v55 count:16];
      uint64_t v21 = v41;
    }
    while (v41);
  }

  return v50;
}

- (id)messagesGroupsMatchingSearchPrefix:(id)a3 inInteractions:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = &off_1E5ADE000;
  uint64_t v29 = +[_PSAutocompleteSearchUtilities emojiCharacterSet];
  id v31 = [MEMORY[0x1E4F1CA48] array];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  obuint64_t j = v6;
  uint64_t v8 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v33 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        uint64_t v13 = [v12 groupName];
        if (!v13) {
          goto LABEL_15;
        }
        if (!v5) {
          goto LABEL_16;
        }
        uint64_t v14 = v7[92];
        uint64_t v15 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
        uint64_t v16 = [v14 rangeForSearchTerm:v5 inTarget:v13 tokenizedByCharacterSet:v15];

        if (v16 != 0x7FFFFFFFFFFFFFFFLL) {
          goto LABEL_15;
        }
        id v17 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
        uint64_t v18 = (void *)[v17 mutableCopy];

        [v18 formUnionWithCharacterSet:v29];
        uint64_t v19 = [v7[92] rangeForSearchTerm:v5 inTarget:v13 tokenizedByCharacterSet:v18];

        if (v19 != 0x7FFFFFFFFFFFFFFFLL) {
          goto LABEL_15;
        }
        uint64_t v20 = v7[92];
        uint64_t v21 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
        [v5 stringByTrimmingCharactersInSet:v21];
        v23 = uint64_t v22 = v7;
        LODWORD(v20) = [v20 searchString:v23 containsOnlyCharactersInSet:v29];

        uint64_t v7 = v22;
        if (!v20 || [v13 rangeOfString:v5 options:385] == 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v24 = [v12 recipients];
          int v25 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"displayName BEGINSWITH[cd] %@", v5];
          uint64_t v26 = [v24 filteredArrayUsingPredicate:v25];

          if ([v26 count]) {
            [v31 addObject:v12];
          }

          uint64_t v7 = v22;
        }
        else
        {
LABEL_15:
          [v31 addObject:v12];
        }
LABEL_16:
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v9);
  }

  int v27 = (void *)[v31 copy];

  return v27;
}

- (id)softmaxAppliedOnScoresForInputDictionary:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 allValues];
  id v5 = [v4 valueForKeyPath:@"@max.floatValue"];
  [v5 floatValue];
  float v7 = v6;

  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v9 = v4;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v34;
    float v13 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v34 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v33 + 1) + 8 * i) floatValue];
        float v16 = exp((float)(v15 - v7));
        float v13 = v13 + v16;
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v11);
  }
  else
  {
    float v13 = 0.0;
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v17 = objc_msgSend(v3, "allKeys", 0);
  uint64_t v18 = [v17 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v30;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v30 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void *)(*((void *)&v29 + 1) + 8 * j);
        uint64_t v23 = [v3 objectForKeyedSubscript:v22];
        [v23 floatValue];
        float v25 = exp((float)(v24 - v7));

        *(float *)&double v26 = v25 / v13;
        int v27 = [NSNumber numberWithFloat:v26];
        [v8 setObject:v27 forKeyedSubscript:v22];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v19);
  }

  return v8;
}

- (id)normalizedScoresForInputDictionary:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 allValues];
  id v5 = [v4 valueForKeyPath:@"@max.floatValue"];
  [v5 floatValue];
  float v7 = v6;

  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v9 = objc_msgSend(v3, "allKeys", 0);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v23;
    if (v7 <= 0.0) {
      float v13 = 1.0;
    }
    else {
      float v13 = v7;
    }
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v15 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        float v16 = [v3 objectForKeyedSubscript:v15];
        [v16 floatValue];
        float v18 = v17;

        *(float *)&double v19 = v18 / v13;
        uint64_t v20 = [NSNumber numberWithFloat:v19];
        [v8 setObject:v20 forKeyedSubscript:v15];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v11);
  }

  return v8;
}

- (id)interactionLabelsForQueryResult:(id)a3 queryPoint:(id)a4 rankerType:(int64_t)a5 frequencyOnly:(BOOL)a6 contactsOnly:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  id v12 = a4;
  id v13 = a3;
  uint64_t v14 = [v13 objectAtIndex:0];
  uint64_t v15 = [(_PSKNNModel *)self neighborsFromTrainingData:v14 k:[(_PSKNNModel *)self k] queryPoint:v12];

  float v16 = [(_PSKNNModel *)self extractNearestNeighborLabelsForQueryResult:v13 andNeighbors:v15 frequencyOnly:v8 rankerType:a5 contactsOnly:v7 reason:0];

  return v16;
}

- (id)splitShareLabels:(id)a3 suggestionDate:(id)a4 contextBundleId:(id)a5
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v80 = a4;
  id v78 = a5;
  id v76 = [MEMORY[0x1E4F1CA48] array];
  int v75 = [MEMORY[0x1E4F1CA48] array];
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  obuint64_t j = v8;
  uint64_t v79 = [obj countByEnumeratingWithState:&v81 objects:v87 count:16];
  if (v79)
  {
    uint64_t v77 = *(void *)v82;
    id v9 = &off_1E5ADE000;
    do
    {
      for (uint64_t i = 0; i != v79; ++i)
      {
        if (*(void *)v82 != v77) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v81 + 1) + 8 * i);
        id v12 = (void *)MEMORY[0x1A6243860]();
        id v13 = [v11 objectForKeyedSubscript:@"bundleId"];
        uint64_t v14 = [v11 objectForKeyedSubscript:@"sourceBundleId"];
        if ([v14 isEqualToString:v78]) {
          unint64_t v15 = [(_PSKNNModel *)self _PSKnnModelRecencyMarginToPromoteSharesMatchingBundleId];
        }
        else {
          unint64_t v15 = [(_PSKNNModel *)self _PSKnnModelRecencyMarginToPromoteShares];
        }
        unint64_t v16 = v15;
        float v17 = [v9[121] mobileMessagesBundleId];
        int v18 = [v13 isEqualToString:v17];

        if (v18)
        {
          double v19 = [v11 objectForKeyedSubscript:@"conversationId"];
          uint64_t v20 = [v11 objectForKeyedSubscript:@"startDate"];
          [v80 timeIntervalSinceDate:v20];
          double v22 = v21;
          double v23 = (double)v16;

          if (v22 < (double)v16)
          {
            unint64_t v24 = [v76 count];
            if (v24 >= [(_PSKNNModel *)self _PSKnnTopKShares]) {
              long long v25 = v75;
            }
            else {
              long long v25 = v76;
            }
            [v25 addObject:v11];
            goto LABEL_36;
          }
          long long v34 = [(_PSKNNModel *)self messageInteractionCache];
          long long v35 = [v34 mostRecentInteractionForCandidateIdentifier:v19];

          long long v36 = [v35 startDate];
          [v80 timeIntervalSinceDate:v36];
          double v38 = v37;

          if (v38 >= v23)
          {
            uint64_t v61 = [v35 startDate];
            [v80 timeIntervalSinceDate:v61];
            double v63 = v62;
            double v64 = (double)[(_PSKNNModel *)self _PSKnnModelRecencyMarginToRetainShares];

            uint64_t v40 = v75;
            if (v63 < v64) {
              goto LABEL_34;
            }
          }
          else
          {
            unint64_t v39 = [v76 count];
            if (v39 >= [(_PSKNNModel *)self _PSKnnTopKShares]) {
              uint64_t v40 = v75;
            }
            else {
              uint64_t v40 = v76;
            }
LABEL_34:
            [v40 addObject:v11];
          }

LABEL_36:
          goto LABEL_44;
        }
        double v26 = [v9[121] mobileMailBundleId];
        int v27 = [v13 isEqualToString:v26];

        if (v27)
        {
          uint64_t v28 = [v11 objectForKeyedSubscript:@"startDate"];
          [v80 timeIntervalSinceDate:v28];
          double v30 = v29;

          if (v30 >= (double)v16)
          {
            long long v57 = [v11 objectForKeyedSubscript:@"startDate"];
            [v80 timeIntervalSinceDate:v57];
            double v59 = v58;
            unint64_t v60 = [(_PSKNNModel *)self _PSKnnModelRecencyMarginToRetainShares];
            goto LABEL_41;
          }
          long long v31 = v76;
          unint64_t v32 = [v76 count];
          unint64_t v33 = [(_PSKNNModel *)self _PSKnnTopKShares];
        }
        else
        {
          uint64_t v41 = [v11 objectForKeyedSubscript:@"derivedIntentIdentifier"];
          if (v41)
          {
            uint64_t v42 = (void *)v41;
            uint64_t v43 = [v11 objectForKeyedSubscript:@"bundleId"];

            if (v43)
            {
              uint64_t v44 = [v11 objectForKeyedSubscript:@"derivedIntentIdentifier"];
              id v45 = [(_PSKNNModel *)self messageInteractionCache];
              id v73 = (void *)v44;
              uint64_t v46 = [v45 mostRecentInteractionForCandidateIdentifier:v44];

              BOOL v47 = [v46 startDate];
              [v80 timeIntervalSinceDate:v47];
              double v49 = v48;

              if (v49 >= (double)v16)
              {
                long long v65 = [v46 startDate];
                [v80 timeIntervalSinceDate:v65];
                double v67 = v66;
                double v68 = (double)[(_PSKNNModel *)self _PSKnnModelRecencyMarginToRetainShares];

                id v50 = v75;
                if (v67 < v68) {
                  goto LABEL_38;
                }
              }
              else
              {
                id v50 = v76;
                unint64_t v51 = [v76 count];
                if (v51 >= [(_PSKNNModel *)self _PSKnnTopKShares]) {
                  goto LABEL_39;
                }
LABEL_38:
                [v50 addObject:v11];
              }
LABEL_39:

              goto LABEL_44;
            }
          }
          long long v52 = [v11 objectForKeyedSubscript:@"expanseRecipients"];

          if (!v52) {
            goto LABEL_44;
          }
          long long v53 = [v11 objectForKeyedSubscript:@"startDate"];
          [v80 timeIntervalSinceDate:v53];
          double v55 = v54;

          if (v55 >= (double)v16)
          {
            long long v57 = [v11 objectForKeyedSubscript:@"startDate"];
            [v80 timeIntervalSinceDate:v57];
            double v59 = v69;
            unint64_t v60 = [(_PSKNNModel *)self _PSKnnModelRecencyMarginToRetainGroupActivities];
LABEL_41:
            double v70 = (double)v60;

            if (v59 >= v70) {
              goto LABEL_44;
            }
LABEL_42:
            uint64_t v56 = v75;
            goto LABEL_43;
          }
          long long v31 = v76;
          unint64_t v32 = [v76 count];
          unint64_t v33 = [(_PSKNNModel *)self _PSKnnTopKGroupActivities];
        }
        if (v32 >= v33) {
          goto LABEL_42;
        }
        uint64_t v56 = v31;
LABEL_43:
        [v56 addObject:v11];
LABEL_44:

        id v9 = &off_1E5ADE000;
      }
      uint64_t v79 = [obj countByEnumeratingWithState:&v81 objects:v87 count:16];
    }
    while (v79);
  }

  v85[0] = @"prioritizedShareLabels";
  v85[1] = @"otherShareLabels";
  v86[0] = v76;
  v86[1] = v75;
  id v71 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v86 forKeys:v85 count:2];

  return v71;
}

- (id)filterShareInteractions:(id)a3 minimumOccurencesByMechanism:(id)a4 contextBundleId:(id)a5 filterOutNonMatchingSourceBundleIDs:(BOOL)a6
{
  BOOL v55 = a6;
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v60 = a4;
  id v54 = a5;
  id v9 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v52 = v8;
  obuint64_t j = [v8 reverseObjectEnumerator];
  uint64_t v10 = [obj countByEnumeratingWithState:&v65 objects:v72 count:16];
  long long v53 = v9;
  if (!v10)
  {
    id v12 = 0;
    goto LABEL_24;
  }
  uint64_t v11 = v10;
  id v12 = 0;
  id v58 = *(id *)v66;
  id v13 = &off_1E5ADE000;
  do
  {
    uint64_t v14 = 0;
    do
    {
      if (*(id *)v66 != v58) {
        objc_enumerationMutation(obj);
      }
      unint64_t v15 = *(void **)(*((void *)&v65 + 1) + 8 * v14);
      unint64_t v16 = [v15 targetBundleId];
      float v17 = [v13[121] shareSheetTargetBundleIdMessages];
      int v18 = [v16 isEqualToString:v17];

      if (v18)
      {
        uint64_t v19 = [v15 domainIdentifier];
        goto LABEL_13;
      }
      uint64_t v20 = [v15 targetBundleId];
      double v21 = [v13[121] shareSheetTargetBundleIdMail];
      if ([v20 isEqualToString:v21])
      {

LABEL_11:
        long long v25 = (void *)MEMORY[0x1E4F5B3D8];
        double v26 = [v15 recipients];
        uint64_t v19 = [v25 generateConversationIdFromInteractionRecipients:v26];

LABEL_12:
        id v12 = v26;
        id v13 = &off_1E5ADE000;
LABEL_13:

        id v12 = (void *)v19;
        if (!v19) {
          goto LABEL_15;
        }
LABEL_14:
        int v27 = NSNumber;
        uint64_t v28 = [v9 objectForKeyedSubscript:v12];
        double v29 = [v28 objectForKeyedSubscript:@"count"];
        double v30 = objc_msgSend(v27, "numberWithInteger:", objc_msgSend(v29, "integerValue") + 1);

        v70[0] = @"interaction";
        v70[1] = @"count";
        v71[0] = v15;
        v71[1] = v30;
        long long v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v71 forKeys:v70 count:2];
        [v9 setObject:v31 forKeyedSubscript:v12];

        goto LABEL_15;
      }
      double v22 = [v15 targetBundleId];
      double v23 = [v13[121] sharePlayBundleId];
      int v24 = [v22 isEqualToString:v23];

      id v9 = v53;
      if (v24) {
        goto LABEL_11;
      }
      unint64_t v32 = [v15 derivedIntentIdentifier];

      if (v32)
      {
        double v26 = [v15 targetBundleId];
        unint64_t v33 = [v15 derivedIntentIdentifier];
        uint64_t v19 = _PSSuggestionKey(v26, v33);

        goto LABEL_12;
      }
      id v13 = &off_1E5ADE000;
      if (v12) {
        goto LABEL_14;
      }
LABEL_15:
      ++v14;
    }
    while (v11 != v14);
    uint64_t v34 = [obj countByEnumeratingWithState:&v65 objects:v72 count:16];
    uint64_t v11 = v34;
  }
  while (v34);
LABEL_24:

  id obja = [MEMORY[0x1E4F1CA48] array];
  [v9 allValues];
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v59 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v35 = [v59 countByEnumeratingWithState:&v61 objects:v69 count:16];
  if (v35)
  {
    uint64_t v36 = v35;
    uint64_t v37 = *(void *)v62;
    do
    {
      for (uint64_t i = 0; i != v36; ++i)
      {
        if (*(void *)v62 != v37) {
          objc_enumerationMutation(v59);
        }
        unint64_t v39 = *(void **)(*((void *)&v61 + 1) + 8 * i);
        uint64_t v40 = [v39 objectForKeyedSubscript:@"interaction"];
        uint64_t v41 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v40, "mechanism"));
        uint64_t v42 = [v39 objectForKeyedSubscript:@"count"];
        unint64_t v43 = [v42 integerValue];

        uint64_t v44 = [v60 objectForKeyedSubscript:v41];
        unint64_t v45 = [v44 integerValue];

        if (v43 >= v45)
        {
          uint64_t v46 = [v39 objectForKeyedSubscript:@"interaction"];
          BOOL v47 = v46;
          if (v55)
          {
            double v48 = [v46 bundleId];
            int v49 = [v48 isEqualToString:v54];

            if (v49)
            {
              id v50 = [v39 objectForKeyedSubscript:@"interaction"];
              [obja addObject:v50];
            }
          }
          else
          {
            [obja addObject:v46];
          }
        }
      }
      uint64_t v36 = [v59 countByEnumeratingWithState:&v61 objects:v69 count:16];
    }
    while (v36);
  }

  return obja;
}

- (id)targetBundleIdsForFilterBundlesIds:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[v3 mutableCopy];
  id v5 = +[_PSConstants mobileMessagesBundleId];
  int v6 = [v3 containsObject:v5];

  if (v6)
  {
    BOOL v7 = +[_PSConstants mobileMessagesBundleId];
    [v4 removeObject:v7];

    id v8 = +[_PSConstants shareSheetTargetBundleIdMessages];
    [v4 addObject:v8];
  }
  id v9 = +[_PSConstants mobileMailBundleId];
  int v10 = [v3 containsObject:v9];

  if (v10)
  {
    uint64_t v11 = +[_PSConstants mobileMailBundleId];
    [v4 removeObject:v11];

    id v12 = +[_PSConstants shareSheetTargetBundleIdMail];
    [v4 addObject:v12];
  }
  id v13 = [MEMORY[0x1E4F1CAD0] setWithArray:v4];

  return v13;
}

- (id)_featureVectorFromSuggestionDate:(id)a3 bundleID:(id)a4 peopleInPhotoIdentifiers:(id)a5 scenesInPhotoIdentifiers:(id)a6
{
  v28[4] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  int v10 = (__CFString *)a4;
  id v11 = a5;
  id v12 = a6;
  int v27 = v9;
  if (v9)
  {
    id v13 = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F1C9C8], "distantFuture", 0);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v14 = v13;
  if (v10) {
    unint64_t v15 = v10;
  }
  else {
    unint64_t v15 = &stru_1EF653EA8;
  }
  unint64_t v16 = (void *)MEMORY[0x1E4F1CBF0];
  if (v11) {
    float v17 = v11;
  }
  else {
    float v17 = (void *)MEMORY[0x1E4F1CBF0];
  }
  if (v12) {
    unint64_t v16 = v12;
  }
  int v18 = NSNumber;
  id v19 = v16;
  id v20 = v17;
  double v21 = v15;
  [v14 timeIntervalSinceReferenceDate];
  double v22 = objc_msgSend(v18, "numberWithDouble:");
  v28[0] = v22;
  v28[1] = v21;
  double v23 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v20];
  v28[2] = v23;
  int v24 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v19];

  v28[3] = v24;
  long long v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:4];

  return v25;
}

- (id)featureVectorFromPredictionContext:(id)a3
{
  id v4 = a3;
  id v5 = [v4 suggestionDate];
  int v6 = [v4 bundleID];
  BOOL v7 = [v4 peopleInPhotoIdentifiers];
  id v8 = [v4 scenesInPhotoIdentifiers];

  id v9 = [(_PSKNNModel *)self _featureVectorFromSuggestionDate:v5 bundleID:v6 peopleInPhotoIdentifiers:v7 scenesInPhotoIdentifiers:v8];

  return v9;
}

- (id)featureVectorFromInteraction:(id)a3
{
  id v4 = a3;
  id v5 = [v4 attachments];
  int v6 = objc_msgSend(v5, "_pas_mappedArrayWithTransform:", &__block_literal_global_443);

  BOOL v7 = [v4 startDate];
  id v8 = [v4 bundleId];

  id v9 = [(_PSKNNModel *)self _featureVectorFromSuggestionDate:v7 bundleID:v8 peopleInPhotoIdentifiers:v6 scenesInPhotoIdentifiers:0];

  return v9;
}

- (id)featureVectorFromPredictionDate:(id)a3 bundleId:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int v6 = NSNumber;
  id v7 = a4;
  [a3 timeIntervalSinceReferenceDate];
  uint64_t v8 = objc_msgSend(v6, "numberWithDouble:");
  id v9 = (void *)v8;
  if (a4)
  {
    uint64_t v16 = v8;
    id v17 = v7;
    int v10 = (void *)MEMORY[0x1E4F1C978];
    id v11 = &v16;
    uint64_t v12 = 2;
  }
  else
  {
    uint64_t v15 = v8;
    int v10 = (void *)MEMORY[0x1E4F1C978];
    id v11 = &v15;
    uint64_t v12 = 1;
  }
  id v13 = objc_msgSend(v10, "arrayWithObjects:count:", v11, v12, v15, v16, v17, v18);

  return v13;
}

- (id)featureVectorFromAbsolutePredictionTime:(double)a3 bundleId:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int v6 = NSNumber;
  id v7 = a4;
  uint64_t v8 = [v6 numberWithDouble:a3];
  id v9 = (void *)v8;
  if (a4)
  {
    uint64_t v16 = v8;
    id v17 = v7;
    int v10 = (void *)MEMORY[0x1E4F1C978];
    id v11 = &v16;
    uint64_t v12 = 2;
  }
  else
  {
    uint64_t v15 = v8;
    int v10 = (void *)MEMORY[0x1E4F1C978];
    id v11 = &v15;
    uint64_t v12 = 1;
  }
  id v13 = objc_msgSend(v10, "arrayWithObjects:count:", v11, v12, v15, v16, v17, v18);

  return v13;
}

- (id)mergedSuggestionsFromShares:(id)a3 andInteractions:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v8 = (void *)v7;
  if (v5 && v6)
  {
    id v9 = (void *)[v5 mutableCopy];

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v10 = v6;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v20 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v19 + 1) + 8 * i);
          if ((objc_msgSend(v9, "containsObject:", v15, (void)v19) & 1) == 0) {
            [v9 addObject:v15];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v12);
    }

    goto LABEL_13;
  }
  if (v5)
  {
    id v16 = v5;
  }
  else
  {
    if (!v6)
    {
      id v9 = (void *)v7;
LABEL_13:
      id v16 = v9;
      uint64_t v8 = v16;
      goto LABEL_18;
    }
    id v16 = v6;
  }
LABEL_18:
  id v17 = v16;

  return v17;
}

- (id)extractNearestNeighborLabelsForQueryResult:(id)a3 andNeighbors:(id)a4 frequencyOnly:(BOOL)a5 rankerType:(int64_t)a6 contactsOnly:(BOOL)a7 reason:(id)a8
{
  BOOL v39 = a7;
  BOOL v40 = a5;
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v42 = a8;
  BOOL v47 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v46 = [MEMORY[0x1E4F1CA48] array];
  unint64_t v43 = v10;
  double v48 = [v10 objectAtIndex:1];
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  obuint64_t j = v11;
  uint64_t v12 = [obj countByEnumeratingWithState:&v53 objects:v58 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v54;
    uint64_t v15 = (void *)MEMORY[0x1E4F1CBF0];
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v54 != v14) {
          objc_enumerationMutation(obj);
        }
        id v17 = *(void **)(*((void *)&v53 + 1) + 8 * i);
        uint64_t v18 = (void *)MEMORY[0x1A6243860]();
        long long v19 = [v17 nodeData];
        long long v20 = v19;
        if (!v19) {
          long long v19 = v15;
        }
        long long v21 = objc_msgSend(v19, "_pas_componentsJoinedByString:", &stru_1EF653EA8);

        long long v22 = [v48 objectForKeyedSubscript:v21];
        if (v22)
        {
          [v47 addObject:v22];
          double v23 = NSNumber;
          [v17 distance];
          uint64_t v24 = objc_msgSend(v23, "numberWithDouble:");
          [v46 addObject:v24];
        }
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v53 objects:v58 count:16];
    }
    while (v13);
  }

  switch(a6)
  {
    case 1:
      long long v25 = self;
      int v27 = v46;
      double v26 = v47;
      BOOL v29 = v39;
      BOOL v28 = v40;
      goto LABEL_16;
    case 2:
      long long v25 = self;
      int v27 = v46;
      double v26 = v47;
      BOOL v28 = v40;
      BOOL v29 = 0;
LABEL_16:
      uint64_t v31 = 0;
      goto LABEL_19;
    case 3:
      double v30 = [(_PSKNNModel *)self rankedLabelsFromInteractionsSiriNLWithInteractions:v47 andDistances:v46 freqOnly:v40];
      break;
    case 4:
      long long v25 = self;
      int v27 = v46;
      double v26 = v47;
      BOOL v29 = v39;
      BOOL v28 = v40;
      uint64_t v31 = 1;
LABEL_19:
      double v30 = [(_PSKNNModel *)v25 rankedLabelsFromInteractionsSingleRecipientArray:v26 andDistances:v27 freqOnly:v28 contactsOnly:v29 scoreLikeShareSheet:v31];
      break;
    case 5:
      double v30 = [(_PSKNNModel *)self rankedLabelsFromInteractionsForPhoneCallsWithInteractions:v47 andDistances:v46];
      break;
    default:
      double v30 = [(_PSKNNModel *)self rankedLabelsFromInteractionsMaintainRecipientsArray:v47 andDistances:v46 freqOnly:v40];
      break;
  }
  unint64_t v32 = v30;
  if (v42)
  {
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v33 = v30;
    uint64_t v34 = [v33 countByEnumeratingWithState:&v49 objects:v57 count:16];
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v36 = *(void *)v50;
      do
      {
        for (uint64_t j = 0; j != v35; ++j)
        {
          if (*(void *)v50 != v36) {
            objc_enumerationMutation(v33);
          }
          [*(id *)(*((void *)&v49 + 1) + 8 * j) setObject:v42 forKeyedSubscript:@"reason"];
        }
        uint64_t v35 = [v33 countByEnumeratingWithState:&v49 objects:v57 count:16];
      }
      while (v35);
    }
  }

  return v32;
}

- (id)rankedLabelsFromInteractionsMaintainRecipientsArray:(id)a3 andDistances:(id)a4 freqOnly:(BOOL)a5
{
  BOOL v130 = a5;
  uint64_t v162 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v126 = a4;
  uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v124 = v6;
  v128 = v7;
  if ([v6 count])
  {
    uint64_t v8 = 0;
    id v9 = &off_1E5ADE000;
    do
    {
      long long v153 = 0u;
      long long v154 = 0u;
      long long v151 = 0u;
      long long v152 = 0u;
      uint64_t v127 = v8;
      objc_msgSend(v6, "objectAtIndexedSubscript:", v8, v124);
      obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v132 = [obj countByEnumeratingWithState:&v151 objects:v161 count:16];
      if (!v132) {
        goto LABEL_88;
      }
      uint64_t v131 = *(void *)v152;
      do
      {
        for (uint64_t i = 0; i != v132; ++i)
        {
          if (*(void *)v152 != v131) {
            objc_enumerationMutation(obj);
          }
          id v11 = *(void **)(*((void *)&v151 + 1) + 8 * i);
          uint64_t v12 = [MEMORY[0x1E4F1CA60] dictionary];
          BOOL v13 = [v11 mechanism] == 13 || objc_msgSend(v11, "mechanism") == 20;
          uint64_t v14 = [v11 bundleId];
          uint64_t v15 = [v9[121] mobileMessagesBundleId];
          char v16 = [v14 isEqualToString:v15];
          if ((v16 & 1) != 0
            || ([v11 bundleId],
                id v17 = objc_claimAutoreleasedReturnValue(),
                [v9[121] macMessagesBundleId],
                v133 = objc_claimAutoreleasedReturnValue(),
                v134 = v17,
                objc_msgSend(v17, "isEqualToString:")))
          {
            uint64_t v18 = [v11 domainIdentifier];
            BOOL v19 = v18 != 0;

            if (v16)
            {

              if (v18) {
                goto LABEL_15;
              }
              goto LABEL_18;
            }
          }
          else
          {
            BOOL v19 = 0;
          }

          if (v19)
          {
LABEL_15:
            long long v20 = [v11 domainIdentifier];
            [v12 setObject:v20 forKeyedSubscript:@"conversationId"];

            long long v21 = [v11 bundleId];
            [v12 setObject:v21 forKeyedSubscript:@"bundleId"];

            long long v22 = [v11 bundleId];
            [v12 setObject:v22 forKeyedSubscript:@"sourceBundleId"];

            double v23 = [v11 startDate];
            [v12 setObject:v23 forKeyedSubscript:@"startDate"];

            uint64_t v24 = [v12 objectForKeyedSubscript:@"conversationId"];
            long long v25 = [v12 objectForKeyedSubscript:@"bundleId"];
            double v26 = [(__CFString *)v24 stringByAppendingString:v25];
            goto LABEL_78;
          }
LABEL_18:
          id v9 = &off_1E5ADE000;
          if (v13)
          {
            int v27 = [v11 targetBundleId];
            BOOL v28 = +[_PSConstants shareSheetTargetBundleIdMessages];
            if ([v27 isEqualToString:v28])
            {
              BOOL v29 = [v11 domainIdentifier];

              if (v29)
              {
                double v30 = [v11 domainIdentifier];
                [v12 setObject:v30 forKeyedSubscript:@"conversationId"];

                uint64_t v31 = +[_PSConstants mobileMessagesBundleId];
                [v12 setObject:v31 forKeyedSubscript:@"bundleId"];

                unint64_t v32 = [v11 bundleId];
                [v12 setObject:v32 forKeyedSubscript:@"sourceBundleId"];

                id v33 = [v11 startDate];
                [v12 setObject:v33 forKeyedSubscript:@"startDate"];

                uint64_t v24 = [v12 objectForKeyedSubscript:@"conversationId"];
                uint64_t v34 = v12;
LABEL_57:
                long long v25 = [v34 objectForKeyedSubscript:@"bundleId"];
                uint64_t v80 = [(__CFString *)v24 stringByAppendingString:v25];
                goto LABEL_62;
              }
            }
            else
            {
            }
          }
          uint64_t v35 = [v11 bundleId];
          uint64_t v36 = +[_PSConstants mobileMailBundleId];
          if ([v35 isEqualToString:v36])
          {
            uint64_t v37 = [v11 recipients];
            uint64_t v38 = [v37 count];

            if (v38)
            {
              BOOL v39 = [v11 recipients];
              [v12 setObject:v39 forKeyedSubscript:@"mailRecipients"];

              BOOL v40 = [v11 bundleId];
              [v12 setObject:v40 forKeyedSubscript:@"bundleId"];

              uint64_t v41 = [v11 bundleId];
              [v12 setObject:v41 forKeyedSubscript:@"sourceBundleId"];

              id v42 = [v11 startDate];
              [v12 setObject:v42 forKeyedSubscript:@"startDate"];

              long long v149 = 0u;
              long long v150 = 0u;
              long long v147 = 0u;
              long long v148 = 0u;
              unint64_t v43 = [v12 objectForKeyedSubscript:@"mailRecipients"];
              uint64_t v44 = [v43 countByEnumeratingWithState:&v147 objects:v160 count:16];
              if (v44)
              {
                uint64_t v45 = v44;
                uint64_t v46 = *(void *)v148;
                uint64_t v24 = &stru_1EF653EA8;
                do
                {
                  for (uint64_t j = 0; j != v45; ++j)
                  {
                    if (*(void *)v148 != v46) {
                      objc_enumerationMutation(v43);
                    }
                    double v48 = *(void **)(*((void *)&v147 + 1) + 8 * j);
                    long long v49 = [v48 identifier];

                    if (v49)
                    {
                      long long v50 = [v48 identifier];
                      uint64_t v51 = [(__CFString *)v24 stringByAppendingString:v50];

                      uint64_t v24 = (__CFString *)v51;
                    }
                  }
                  uint64_t v45 = [v43 countByEnumeratingWithState:&v147 objects:v160 count:16];
                }
                while (v45);
                goto LABEL_77;
              }
              goto LABEL_76;
            }
          }
          else
          {
          }
          if (v13)
          {
            long long v52 = [v11 targetBundleId];
            long long v53 = +[_PSConstants shareSheetTargetBundleIdMail];
            if ([v52 isEqualToString:v53])
            {
              long long v54 = [v11 recipients];
              uint64_t v55 = [v54 count];

              if (v55)
              {
                long long v56 = [v11 recipients];
                [v12 setObject:v56 forKeyedSubscript:@"mailRecipients"];

                long long v57 = +[_PSConstants mobileMailBundleId];
                [v12 setObject:v57 forKeyedSubscript:@"bundleId"];

                id v58 = [v11 bundleId];
                [v12 setObject:v58 forKeyedSubscript:@"sourceBundleId"];

                uint64_t v59 = [v11 startDate];
                [v12 setObject:v59 forKeyedSubscript:@"startDate"];

                long long v145 = 0u;
                long long v146 = 0u;
                long long v143 = 0u;
                long long v144 = 0u;
                unint64_t v43 = [v12 objectForKeyedSubscript:@"mailRecipients"];
                uint64_t v60 = [v43 countByEnumeratingWithState:&v143 objects:v159 count:16];
                if (v60)
                {
                  uint64_t v61 = v60;
                  uint64_t v62 = *(void *)v144;
                  uint64_t v24 = &stru_1EF653EA8;
                  do
                  {
                    for (uint64_t k = 0; k != v61; ++k)
                    {
                      if (*(void *)v144 != v62) {
                        objc_enumerationMutation(v43);
                      }
                      long long v64 = *(void **)(*((void *)&v143 + 1) + 8 * k);
                      long long v65 = [v64 identifier];

                      if (v65)
                      {
                        long long v66 = [v64 identifier];
                        uint64_t v67 = [(__CFString *)v24 stringByAppendingString:v66];

                        uint64_t v24 = (__CFString *)v67;
                      }
                    }
                    uint64_t v61 = [v43 countByEnumeratingWithState:&v143 objects:v159 count:16];
                  }
                  while (v61);
                  goto LABEL_77;
                }
                goto LABEL_76;
              }
            }
            else
            {
            }
          }
          uint64_t v68 = [v11 derivedIntentIdentifier];
          if (v68)
          {
            double v69 = (void *)v68;
            double v70 = [v11 bundleId];

            if (v70)
            {
              id v71 = [v11 derivedIntentIdentifier];
              [v12 setObject:v71 forKeyedSubscript:@"derivedIntentIdentifier"];

              if (v13) {
                [v11 targetBundleId];
              }
              else {
              long long v82 = [v11 bundleId];
              }
              [v12 setObject:v82 forKeyedSubscript:@"bundleId"];

              long long v83 = [v11 bundleId];
              [v12 setObject:v83 forKeyedSubscript:@"sourceBundleId"];

              long long v84 = [v11 startDate];
              [v12 setObject:v84 forKeyedSubscript:@"startDate"];

              uint64_t v24 = [v12 objectForKeyedSubscript:@"bundleId"];
              long long v25 = [v11 derivedIntentIdentifier];
              uint64_t v80 = _PSSuggestionKey(v24, v25);
LABEL_62:
              double v26 = (void *)v80;
LABEL_79:

              id v102 = objc_alloc(MEMORY[0x1E4F1CAD0]);
              id v103 = [v11 attachments];
              id v104 = objc_msgSend(v103, "_pas_mappedArrayWithTransform:", &__block_literal_global_448);
              long long v105 = (void *)[v102 initWithArray:v104];
              [v12 setObject:v105 forKeyedSubscript:@"peopleInPhoto"];

              long long v106 = [v7 objectForKeyedSubscript:v26];
              uint64_t v107 = [v106 objectForKeyedSubscript:@"score"];

              if (v130)
              {
                uint64_t v108 = NSNumber;
                [v107 doubleValue];
                double v110 = v109 + 1.0;
                goto LABEL_83;
              }
              if (!v107)
              {
                uint64_t v108 = NSNumber;
                uint64_t v107 = [v126 objectAtIndexedSubscript:v127];
                [v107 doubleValue];
                double v110 = -v111;
LABEL_83:
                uint64_t v112 = [v108 numberWithDouble:v110];

                uint64_t v107 = (void *)v112;
              }
              v156[0] = @"score";
              v156[1] = @"key";
              v157[0] = v107;
              v157[1] = v12;
              long long v113 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v157 forKeys:v156 count:2];
              [v7 setObject:v113 forKeyedSubscript:v26];

              goto LABEL_85;
            }
          }
          uint64_t v72 = [v11 domainIdentifier];
          if (v72)
          {
            uint64_t v73 = (void *)v72;
            id v74 = [v11 bundleId];

            if (v74)
            {
              int v75 = [v11 recipients];
              [v12 setObject:v75 forKeyedSubscript:@"expanseRecipients"];

              id v76 = [v11 domainIdentifier];
              [v12 setObject:v76 forKeyedSubscript:@"domainIdentifier"];

              uint64_t v77 = [v11 bundleId];
              [v12 setObject:v77 forKeyedSubscript:@"bundleId"];

              id v78 = [v11 bundleId];
              [v12 setObject:v78 forKeyedSubscript:@"sourceBundleId"];

              uint64_t v79 = [v11 startDate];
              [v12 setObject:v79 forKeyedSubscript:@"startDate"];

              uint64_t v24 = [v12 objectForKeyedSubscript:@"domainIdentifier"];
              uint64_t v34 = v12;
              goto LABEL_57;
            }
          }
          uint64_t v81 = [v11 domainIdentifier];
          if (!v81)
          {
            uint64_t v85 = [v11 bundleId];
            if (!v85) {
              goto LABEL_86;
            }
            double v26 = (void *)v85;
            uint64_t v86 = [v11 targetBundleId];
            if (!v86) {
              goto LABEL_85;
            }
            uint64_t v87 = (void *)v86;
            uint64_t v88 = [v11 recipients];
            uint64_t v89 = [v88 count];

            if (!v89) {
              goto LABEL_86;
            }
            long long v90 = [v11 recipients];
            [v12 setObject:v90 forKeyedSubscript:@"expanseRecipients"];

            long long v91 = [v11 targetBundleId];
            [v12 setObject:v91 forKeyedSubscript:@"bundleId"];

            BOOL v92 = [v11 bundleId];
            [v12 setObject:v92 forKeyedSubscript:@"sourceBundleId"];

            id v93 = [v11 startDate];
            [v12 setObject:v93 forKeyedSubscript:@"startDate"];

            long long v141 = 0u;
            long long v142 = 0u;
            long long v139 = 0u;
            long long v140 = 0u;
            unint64_t v43 = [v12 objectForKeyedSubscript:@"expanseRecipients"];
            uint64_t v94 = [v43 countByEnumeratingWithState:&v139 objects:v158 count:16];
            if (v94)
            {
              uint64_t v95 = v94;
              uint64_t v96 = *(void *)v140;
              uint64_t v24 = &stru_1EF653EA8;
              do
              {
                for (uint64_t m = 0; m != v95; ++m)
                {
                  if (*(void *)v140 != v96) {
                    objc_enumerationMutation(v43);
                  }
                  long long v98 = *(void **)(*((void *)&v139 + 1) + 8 * m);
                  long long v99 = [v98 identifier];

                  if (v99)
                  {
                    long long v100 = [v98 identifier];
                    uint64_t v101 = [(__CFString *)v24 stringByAppendingString:v100];

                    uint64_t v24 = (__CFString *)v101;
                  }
                }
                uint64_t v95 = [v43 countByEnumeratingWithState:&v139 objects:v158 count:16];
              }
              while (v95);
LABEL_77:

              long long v25 = [v12 objectForKeyedSubscript:@"bundleId"];
              double v26 = [(__CFString *)v24 stringByAppendingString:v25];
              uint64_t v7 = v128;
LABEL_78:
              id v9 = &off_1E5ADE000;
              goto LABEL_79;
            }
LABEL_76:
            uint64_t v24 = &stru_1EF653EA8;
            goto LABEL_77;
          }
          double v26 = (void *)v81;
LABEL_85:

LABEL_86:
        }
        uint64_t v132 = [obj countByEnumeratingWithState:&v151 objects:v161 count:16];
      }
      while (v132);
LABEL_88:

      uint64_t v8 = v127 + 1;
      id v6 = v124;
    }
    while ([v124 count] > (unint64_t)(v127 + 1));
  }
  long long v114 = objc_msgSend(v7, "keysSortedByValueUsingComparator:", &__block_literal_global_450, v124);
  long long v115 = [MEMORY[0x1E4F1CA48] array];
  long long v135 = 0u;
  long long v136 = 0u;
  long long v137 = 0u;
  long long v138 = 0u;
  id v116 = v114;
  uint64_t v117 = [v116 countByEnumeratingWithState:&v135 objects:v155 count:16];
  if (v117)
  {
    uint64_t v118 = v117;
    uint64_t v119 = *(void *)v136;
    do
    {
      for (uint64_t n = 0; n != v118; ++n)
      {
        if (*(void *)v136 != v119) {
          objc_enumerationMutation(v116);
        }
        uint64_t v121 = [v128 objectForKeyedSubscript:*(void *)(*((void *)&v135 + 1) + 8 * n)];
        uint64_t v122 = [v121 objectForKeyedSubscript:@"key"];
        [v115 addObject:v122];
      }
      uint64_t v118 = [v116 countByEnumeratingWithState:&v135 objects:v155 count:16];
    }
    while (v118);
  }

  return v115;
}

- (id)rankedLabelsFromInteractionsSingleRecipientArray:(id)a3 andDistances:(id)a4 freqOnly:(BOOL)a5 contactsOnly:(BOOL)a6 scoreLikeShareSheet:(BOOL)a7
{
  BOOL v72 = a7;
  BOOL v73 = a5;
  BOOL v7 = a6;
  uint64_t v99 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v70 = a4;
  uint64_t v77 = [MEMORY[0x1E4F1CA60] dictionary];
  id v74 = [MEMORY[0x1E4F1CA60] dictionary];
  double v69 = [MEMORY[0x1E4F1CA60] dictionary];
  int64_t v10 = +[_PSPrivacyDataRetentionPeriod lookbackDurationInDays];
  if ([v9 count])
  {
    uint64_t v11 = 0;
    double v12 = (double)(86400 * v10);
    BOOL v76 = v7;
    uint64_t v68 = v9;
    do
    {
      long long v87 = 0u;
      long long v88 = 0u;
      long long v85 = 0u;
      long long v86 = 0u;
      uint64_t v71 = v11;
      objc_msgSend(v9, "objectAtIndexedSubscript:", v11, v68);
      obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v79 = [obj countByEnumeratingWithState:&v85 objects:v98 count:16];
      if (!v79) {
        goto LABEL_51;
      }
      uint64_t v78 = *(void *)v86;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v86 != v78) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = *(void **)(*((void *)&v85 + 1) + 8 * v13);
          uint64_t v15 = [v14 recipients];
          char v16 = [v15 firstObject];

          if (v16 || ([v14 sender], (char v16 = objc_claimAutoreleasedReturnValue()) != 0))
          {
            if (!v7
              || ([v16 identifier],
                  id v17 = objc_claimAutoreleasedReturnValue(),
                  v17,
                  !v17))
            {
              uint64_t v24 = 0;
              long long v22 = 0;
              long long v21 = 0;
              goto LABEL_21;
            }
            uint64_t v18 = [v16 identifier];
            BOOL v19 = [v74 objectForKeyedSubscript:v18];
            if (v19 || [v16 personIdType] != 3)
            {
            }
            else
            {
              long long v20 = [v16 personId];

              if (v20)
              {
                long long v21 = [v16 personId];
                long long v22 = [v16 displayName];
                double v23 = [v14 sender];
                uint64_t v24 = [v23 identifier];

                if (v21 && v22)
                {
                  v96[0] = @"conversationId";
                  v96[1] = @"displayName";
                  v97[0] = v21;
                  v97[1] = v22;
                  long long v25 = (void *)MEMORY[0x1E4F1C9E8];
                  double v26 = (void **)v97;
                  int v27 = (__CFString **)v96;
                  uint64_t v28 = 2;
                  goto LABEL_46;
                }
                if (v21)
                {
                  uint64_t v94 = @"conversationId";
                  uint64_t v95 = v21;
                  long long v25 = (void *)MEMORY[0x1E4F1C9E8];
                  double v26 = &v95;
                  int v27 = &v94;
                  uint64_t v28 = 1;
LABEL_46:
                  uint64_t v55 = [v25 dictionaryWithObjects:v26 forKeys:v27 count:v28];
                  long long v56 = [v16 identifier];
                  [v74 setObject:v55 forKeyedSubscript:v56];

                  if (v24)
                  {
                    long long v57 = [v69 objectForKeyedSubscript:v21];

                    if (!v57) {
                      [v69 setObject:v24 forKeyedSubscript:v21];
                    }
                  }
                }
LABEL_21:
                uint64_t v31 = [MEMORY[0x1E4F1CA60] dictionary];
                unint64_t v32 = v31;
                if (!v7)
                {
                  uint64_t v80 = v22;
                  uint64_t v35 = [v16 identifier];
                  [v32 setObject:v35 forKeyedSubscript:@"conversationId"];

                  uint64_t v36 = [_PSRecipient alloc];
                  uint64_t v37 = [v32 objectForKeyedSubscript:@"conversationId"];
                  uint64_t v38 = [v16 identifier];
                  BOOL v39 = [v16 displayName];
                  id v33 = [(_PSRecipient *)v36 initWithIdentifier:v37 handle:v38 displayName:v39 contact:0];

                  BOOL v92 = v33;
                  uint64_t v34 = &v92;
                  goto LABEL_27;
                }
                if (v21)
                {
                  [v31 setObject:v21 forKeyedSubscript:@"conversationId"];
                  if (!v24)
                  {
                    uint64_t v24 = [v69 objectForKeyedSubscript:v21];
                  }
                  uint64_t v80 = v22;
                  id v33 = [[_PSRecipient alloc] initWithIdentifier:v21 senderHandle:v24 handle:0 displayName:v22 contact:0];
                  id v93 = v33;
                  uint64_t v34 = &v93;
LABEL_27:
                  BOOL v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:1];
                  [v32 setObject:v40 forKeyedSubscript:@"recipients"];

                  uint64_t v41 = [v32 objectForKeyedSubscript:@"conversationId"];

                  if (v41)
                  {
                    id v42 = [v77 objectForKeyedSubscript:v41];
                    unint64_t v43 = [v42 objectForKeyedSubscript:@"score"];

                    if (v73)
                    {
                      uint64_t v44 = NSNumber;
                      [v43 doubleValue];
                      double v46 = v45 + 1.0;
                      goto LABEL_34;
                    }
                    if (!v72 || v43)
                    {
                      if (!v72)
                      {
                        long long v50 = NSNumber;
                        [v43 doubleValue];
                        double v52 = v51;
                        long long v53 = [v70 objectAtIndexedSubscript:v71];
                        [v53 doubleValue];
                        uint64_t v48 = [v50 numberWithDouble:v52 + v12 / v54];

                        unint64_t v43 = v53;
                        goto LABEL_35;
                      }
                      BOOL v7 = v76;
                    }
                    else
                    {
                      uint64_t v44 = NSNumber;
                      unint64_t v43 = [v70 objectAtIndexedSubscript:v71];
                      [v43 doubleValue];
                      double v46 = -v47;
LABEL_34:
                      uint64_t v48 = [v44 numberWithDouble:v46];
LABEL_35:

                      unint64_t v43 = (void *)v48;
                      BOOL v7 = v76;
                    }
                    v90[0] = @"score";
                    v90[1] = @"key";
                    v91[0] = v43;
                    v91[1] = v32;
                    long long v49 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v91 forKeys:v90 count:2];
                    [v77 setObject:v49 forKeyedSubscript:v41];
                  }
                  else
                  {
                    BOOL v7 = v76;
                  }
                  long long v22 = v80;
                }

                goto LABEL_39;
              }
            }
            BOOL v29 = [v16 identifier];
            double v30 = [v74 objectForKeyedSubscript:v29];

            long long v21 = [v30 objectForKeyedSubscript:@"conversationId"];
            long long v22 = [v30 objectForKeyedSubscript:@"displayName"];

            uint64_t v24 = 0;
            goto LABEL_21;
          }
LABEL_39:
          ++v13;
        }
        while (v79 != v13);
        uint64_t v58 = [obj countByEnumeratingWithState:&v85 objects:v98 count:16];
        uint64_t v79 = v58;
      }
      while (v58);
LABEL_51:

      uint64_t v11 = v71 + 1;
      id v9 = v68;
    }
    while ([v68 count] > (unint64_t)(v71 + 1));
  }
  uint64_t v59 = [v77 keysSortedByValueUsingComparator:&__block_literal_global_455];
  uint64_t v60 = [MEMORY[0x1E4F1CA48] array];
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  id v61 = v59;
  uint64_t v62 = [v61 countByEnumeratingWithState:&v81 objects:v89 count:16];
  if (v62)
  {
    uint64_t v63 = v62;
    uint64_t v64 = *(void *)v82;
    do
    {
      for (uint64_t i = 0; i != v63; ++i)
      {
        if (*(void *)v82 != v64) {
          objc_enumerationMutation(v61);
        }
        long long v66 = [v77 objectForKeyedSubscript:*(void *)(*((void *)&v81 + 1) + 8 * i)];
        [v60 addObject:v66];
      }
      uint64_t v63 = [v61 countByEnumeratingWithState:&v81 objects:v89 count:16];
    }
    while (v63);
  }

  return v60;
}

- (id)rankedLabelsFromInteractionsSiriNLWithInteractions:(id)a3 andDistances:(id)a4 freqOnly:(BOOL)a5
{
  BOOL v58 = a5;
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v56 = a4;
  unint64_t v8 = 0x1E4F1C000uLL;
  uint64_t v62 = [MEMORY[0x1E4F1CA60] dictionary];
  int64_t v9 = +[_PSPrivacyDataRetentionPeriod lookbackDurationInDays];
  if ([v7 count])
  {
    uint64_t v10 = 0;
    double v11 = (double)(86400 * v9);
    uint64_t v59 = self;
    uint64_t v55 = v7;
    do
    {
      long long v69 = 0u;
      long long v70 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      uint64_t v57 = v10;
      double v12 = objc_msgSend(v7, "objectAtIndexedSubscript:", v10, v55);
      uint64_t v13 = [v12 countByEnumeratingWithState:&v67 objects:v76 count:16];
      if (!v13) {
        goto LABEL_28;
      }
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v68;
      uint64_t v60 = v12;
      uint64_t v61 = *(void *)v68;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v68 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = *(void **)(*((void *)&v67 + 1) + 8 * i);
          uint64_t v18 = [v17 recipients];
          BOOL v19 = [v18 firstObject];

          if (!v19)
          {
            BOOL v19 = [v17 sender];
            if (!v19) {
              continue;
            }
          }
          long long v20 = [*(id *)(v8 + 2656) dictionary];
          if ([v19 personIdType] == 3
            && ([v19 personId], long long v21 = objc_claimAutoreleasedReturnValue(), v21, v21))
          {
            long long v22 = [(_PSKNNModel *)self contactResolver];
            double v23 = [v19 personId];
            uint64_t v24 = [v22 contactWithIdentifier:v23];

            uint64_t v25 = [v24 identifier];
            if (v25)
            {
              double v26 = (void *)v25;
              [v20 setObject:v25 forKeyedSubscript:@"conversationId"];
              int v27 = [_PSRecipient alloc];
              uint64_t v28 = [v19 identifier];
              BOOL v29 = [(_PSRecipient *)v27 initWithIdentifier:v26 senderHandle:0 handle:v28 displayName:0 contact:v24];

              int v75 = v29;
              double v30 = &v75;
              goto LABEL_17;
            }
            uint64_t v31 = [(_PSKNNModel *)self contactResolver];
            unint64_t v32 = [v19 identifier];
            id v33 = [v31 resolveContactIfPossibleFromContactIdentifierString:v32 pickFirstOfMultiple:1];

            double v26 = [v33 identifier];
            if (v26)
            {
              [v20 setObject:v26 forKeyedSubscript:@"conversationId"];
              uint64_t v34 = [_PSRecipient alloc];
              uint64_t v35 = [v19 identifier];
              BOOL v29 = [(_PSRecipient *)v34 initWithIdentifier:v26 senderHandle:0 handle:v35 displayName:0 contact:v33];

              id v74 = v29;
              double v30 = &v74;
              uint64_t v24 = v33;
LABEL_17:
              uint64_t v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
              [v20 setObject:v36 forKeyedSubscript:@"recipients"];

              id v33 = [v20 objectForKeyedSubscript:@"conversationId"];

              if (v33)
              {
                uint64_t v37 = [v62 objectForKeyedSubscript:v33];
                uint64_t v38 = [v37 objectForKeyedSubscript:@"score"];

                BOOL v39 = NSNumber;
                [v38 doubleValue];
                double v41 = v40;
                double v12 = v60;
                if (v58)
                {
                  id v42 = [v39 numberWithDouble:v40 + 1.0];
                }
                else
                {
                  unint64_t v43 = [v56 objectAtIndexedSubscript:v57];
                  [v43 doubleValue];
                  id v42 = [v39 numberWithDouble:v41 + v11 / v44];

                  uint64_t v38 = v43;
                }

                v72[0] = @"score";
                v72[1] = @"key";
                v73[0] = v42;
                v73[1] = v20;
                double v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v73 forKeys:v72 count:2];
                [v62 setObject:v45 forKeyedSubscript:v33];

                self = v59;
                goto LABEL_23;
              }
              self = v59;
              double v12 = v60;
            }
            else
            {
LABEL_23:
            }
            unint64_t v8 = 0x1E4F1C000;
            uint64_t v15 = v61;
          }
          else
          {
            double v26 = 0;
          }

          continue;
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v67 objects:v76 count:16];
      }
      while (v14);
LABEL_28:

      uint64_t v10 = v57 + 1;
      id v7 = v55;
    }
    while ([v55 count] > (unint64_t)(v57 + 1));
  }
  double v46 = [v62 keysSortedByValueUsingComparator:&__block_literal_global_457];
  double v47 = [MEMORY[0x1E4F1CA48] array];
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id v48 = v46;
  uint64_t v49 = [v48 countByEnumeratingWithState:&v63 objects:v71 count:16];
  if (v49)
  {
    uint64_t v50 = v49;
    uint64_t v51 = *(void *)v64;
    do
    {
      for (uint64_t j = 0; j != v50; ++j)
      {
        if (*(void *)v64 != v51) {
          objc_enumerationMutation(v48);
        }
        long long v53 = [v62 objectForKeyedSubscript:*(void *)(*((void *)&v63 + 1) + 8 * j)];
        [v47 addObject:v53];
      }
      uint64_t v50 = [v48 countByEnumeratingWithState:&v63 objects:v71 count:16];
    }
    while (v50);
  }

  return v47;
}

- (id)featuresFromInteractions:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v22 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(v6);
        }
        double v11 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v12 = [v11 startDate];
        if (v12)
        {
          uint64_t v13 = (void *)v12;
          uint64_t v14 = [v11 bundleId];

          if (v14)
          {
            uint64_t v15 = [(_PSKNNModel *)self featureVectorFromInteraction:v11];
            char v16 = v15;
            if (!v15) {
              uint64_t v15 = (void *)MEMORY[0x1E4F1CBF0];
            }
            id v17 = objc_msgSend(v15, "_pas_componentsJoinedByString:", &stru_1EF653EA8);
            uint64_t v18 = [v5 objectForKeyedSubscript:v17];

            if (!v18)
            {
              BOOL v19 = [MEMORY[0x1E4F1CA48] array];
              [v5 setObject:v19 forKeyedSubscript:v17];
            }
            long long v20 = [v5 objectForKeyedSubscript:v17];
            [v20 addObject:v11];

            [v4 addObject:v16];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v8);
  }

  [v22 addObject:v4];
  [v22 addObject:v5];

  return v22;
}

- (id)featuresFromInteractionsSplitRecipients:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v42 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  uint64_t v34 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  obuint64_t j = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v47 objects:v53 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v48;
    uint64_t v35 = *(void *)v48;
    do
    {
      uint64_t v8 = 0;
      uint64_t v37 = v6;
      do
      {
        if (*(void *)v48 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v47 + 1) + 8 * v8);
        uint64_t v10 = (void *)MEMORY[0x1A6243860]();
        uint64_t v11 = [v9 startDate];
        if (v11)
        {
          uint64_t v12 = (void *)v11;
          uint64_t v13 = [v9 bundleId];

          if (v13)
          {
            BOOL v39 = v10;
            uint64_t v40 = v8;
            uint64_t v14 = [v9 startDate];
            uint64_t v15 = [v9 bundleId];
            char v16 = [(_PSKNNModel *)self featureVectorFromPredictionDate:v14 bundleId:v15];

            id v17 = [v16 valueForKey:@"description"];
            uint64_t v18 = objc_msgSend(v17, "_pas_componentsJoinedByString:", &stru_1EF653EA8);

            long long v45 = 0u;
            long long v46 = 0u;
            long long v43 = 0u;
            long long v44 = 0u;
            id v41 = [v9 recipients];
            uint64_t v19 = [v41 countByEnumeratingWithState:&v43 objects:v52 count:16];
            if (v19)
            {
              uint64_t v20 = v19;
              uint64_t v21 = *(void *)v44;
              do
              {
                for (uint64_t i = 0; i != v20; ++i)
                {
                  if (*(void *)v44 != v21) {
                    objc_enumerationMutation(v41);
                  }
                  uint64_t v23 = *(void *)(*((void *)&v43 + 1) + 8 * i);
                  long long v24 = [v4 objectForKeyedSubscript:v18];

                  if (!v24)
                  {
                    long long v25 = [MEMORY[0x1E4F1CA48] array];
                    [v4 setObject:v25 forKeyedSubscript:v18];
                  }
                  long long v26 = objc_opt_new();
                  long long v27 = [v9 startDate];
                  [v26 setStartDate:v27];

                  uint64_t v28 = [v9 endDate];
                  [v26 setEndDate:v28];

                  uint64_t v29 = [v9 bundleId];
                  [v26 setBundleId:v29];

                  objc_msgSend(v26, "setMechanism:", objc_msgSend(v9, "mechanism"));
                  objc_msgSend(v26, "setDirection:", objc_msgSend(v9, "direction"));
                  double v30 = [v9 sender];
                  [v26 setSender:v30];

                  uint64_t v51 = v23;
                  uint64_t v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v51 count:1];
                  [v26 setRecipients:v31];

                  unint64_t v32 = [v4 objectForKeyedSubscript:v18];
                  [v32 addObject:v26];

                  [v42 addObject:v16];
                }
                uint64_t v20 = [v41 countByEnumeratingWithState:&v43 objects:v52 count:16];
              }
              while (v20);
            }

            uint64_t v7 = v35;
            uint64_t v6 = v37;
            uint64_t v10 = v39;
            uint64_t v8 = v40;
          }
        }
        ++v8;
      }
      while (v8 != v6);
      uint64_t v6 = [obj countByEnumeratingWithState:&v47 objects:v53 count:16];
    }
    while (v6);
  }

  [v34 addObject:v42];
  [v34 addObject:v4];

  return v34;
}

- (id)sliceStart:(unint64_t)a3 end:(unint64_t)a4 ofArray:(id)a5
{
  id v7 = a5;
  if ([v7 count] >= a3 && objc_msgSend(v7, "count") >= a4)
  {
    uint64_t v8 = objc_msgSend(v7, "subarrayWithRange:", a3, a4 - a3);
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (double)jaccardDistanceFromSetBasedReference:(id)a3 neighbor:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  double v8 = 1.0;
  if (v5)
  {
    if (v6)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v9 = (void *)[v5 mutableCopy];
          [v9 intersectSet:v7];
          uint64_t v10 = [v5 count];
          uint64_t v11 = [v7 count] + v10;
          unint64_t v12 = v11 - [v9 count];
          if (v12) {
            double v8 = 1.0 - (double)(unint64_t)[v9 count] / (double)v12;
          }
        }
      }
    }
  }

  return v8;
}

- (double)distanceOfNeighbor:(id)a3 fromReference:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [v7 objectAtIndexedSubscript:0];
  [v8 doubleValue];
  double v10 = v9;
  uint64_t v11 = [v6 objectAtIndexedSubscript:0];
  [v11 doubleValue];
  double v13 = (v10 - v12) * (v10 - v12);

  if ([v7 count] != 1)
  {
    uint64_t v14 = [v7 objectAtIndexedSubscript:1];
    uint64_t v15 = [v6 objectAtIndexedSubscript:1];
    char v16 = [v14 isEqualToString:v15];

    if ((v16 & 1) == 0)
    {
      unint64_t v17 = [(_PSKNNModel *)self _PSKnnModelSameBundleIdPenalty];
      double v13 = v13 + (double)v17 * (double)v17;
    }
    if ([v7 count] != 2)
    {
      double v18 = (double)[(_PSKNNModel *)self _PSKnnModelDifferentPeoplePenalty];
      uint64_t v19 = [v7 objectAtIndexedSubscript:2];
      uint64_t v20 = [v6 objectAtIndexedSubscript:2];
      [(_PSKNNModel *)self jaccardDistanceFromSetBasedReference:v19 neighbor:v20];
      double v13 = v13 + v21 * v18 * (v21 * v18);
    }
  }

  return sqrt(v13);
}

- (id)neighborsFromTrainingData:(id)a3 k:(unint64_t)a4 queryPoint:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  double v10 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:a4];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        -[_PSKNNModel distanceOfNeighbor:fromReference:](self, "distanceOfNeighbor:fromReference:", v16, v9, (void)v24);
        double v18 = v17;
        if ([v10 count] >= a4)
        {
          uint64_t v19 = [v10 lastObject];
          [v19 distance];
          double v21 = v20;

          if (v18 >= v21) {
            continue;
          }
          [v10 removeLastObject];
        }
        long long v22 = [[_PSKNNeighbor alloc] initWithNodeData:v16 distance:v18];
        objc_msgSend(v10, "insertObject:atIndex:", v22, -[_PSKNNModel indexToInsertNeighbor:array:](self, "indexToInsertNeighbor:array:", v22, v10));
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v13);
  }

  return v10;
}

- (unint64_t)indexToInsertNeighbor:(id)a3 array:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  unint64_t v7 = objc_msgSend(v5, "indexOfObject:inSortedRange:options:usingComparator:", v6, 0, objc_msgSend(v5, "count"), 1024, &__block_literal_global_464);

  return v7;
}

- (id)rankedMapsShareEtaSuggestions:(id)a3 maxSuggestions:(unint64_t)a4
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  unint64_t v7 = [MEMORY[0x1E4F1CA80] set];
  id v8 = BiomeLibrary();
  id v9 = [v8 MapsShare];
  double v10 = [v9 ETAFeedback];

  long long v48 = v10;
  id v11 = [v10 publisherWithUseCase:@"MapsShareETAFeedback"];
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = __60___PSKNNModel_rankedMapsShareEtaSuggestions_maxSuggestions___block_invoke_471;
  v55[3] = &unk_1E5AE0BA0;
  id v12 = v7;
  id v56 = v12;
  long long v47 = v11;
  id v13 = (id)[v11 sinkWithCompletion:&__block_literal_global_470 receiveInput:v55];
  uint64_t v14 = +[_PSLogging knnChannel];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    uint64_t v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v12, "count"));
    *(_DWORD *)buf = 138412290;
    uint64_t v60 = v15;
    _os_log_impl(&dword_1A314B000, v14, OS_LOG_TYPE_INFO, "Knn - Number of maps feedback events = %@", buf, 0xCu);
  }
  long long v46 = v12;
  uint64_t v16 = [v12 allObjects];
  double v17 = [(_PSKNNModel *)self featuresFromMapsFeedbackEvents:v16];

  double v18 = [v6 suggestionDate];
  long long v49 = v6;
  uint64_t v19 = [v6 bundleID];
  uint64_t v20 = [(_PSKNNModel *)self featureVectorFromPredictionDate:v18 bundleId:v19];

  double v21 = [v17 objectAtIndex:0];
  long long v44 = (void *)v20;
  uint64_t v22 = [(_PSKNNModel *)self neighborsFromTrainingData:v21 k:[(_PSKNNModel *)self k] queryPoint:v20];

  long long v45 = v17;
  long long v43 = (void *)v22;
  uint64_t v23 = [(_PSKNNModel *)self extractNearestNeighborsForMapsQueryResult:v17 andNeighbors:v22 frequencyOnly:0];
  unint64_t v24 = [v23 count];
  if (v24 >= a4) {
    unint64_t v25 = a4;
  }
  else {
    unint64_t v25 = v24;
  }
  id v42 = v23;
  long long v26 = objc_msgSend(v23, "subarrayWithRange:", 0, v25);
  id v50 = [MEMORY[0x1E4F1CA48] array];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v27 = v26;
  uint64_t v28 = [v27 countByEnumeratingWithState:&v51 objects:v58 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v52;
    do
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v52 != v30) {
          objc_enumerationMutation(v27);
        }
        uint64_t v32 = *(void *)(*((void *)&v51 + 1) + 8 * i);
        id v33 = [(_PSKNNModel *)self contactResolver];
        uint64_t v34 = [v33 resolveContactIfPossibleFromContactIdentifierString:v32 pickFirstOfMultiple:1];

        if (v34)
        {
          uint64_t v35 = [_PSRecipient alloc];
          uint64_t v36 = [v34 identifier];
          uint64_t v37 = [(_PSRecipient *)v35 initWithIdentifier:v36 handle:v32 contact:v34];

          if (v37)
          {
            uint64_t v38 = [_PSSuggestion alloc];
            uint64_t v57 = v37;
            BOOL v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v57 count:1];
            uint64_t v40 = [(_PSSuggestion *)v38 initWithBundleID:0 conversationIdentifier:0 groupName:0 recipients:v39];

            [v50 addObject:v40];
          }
        }
      }
      uint64_t v29 = [v27 countByEnumeratingWithState:&v51 objects:v58 count:16];
    }
    while (v29);
  }

  return v50;
}

- (id)mapsShareEtaDefaultKnnSuggestions:(id)a3 maxSuggestions:(unint64_t)a4
{
  v77[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [v5 suggestionDate];
  unint64_t v7 = [v5 bundleID];
  uint64_t v57 = [(_PSKNNModel *)self featureVectorFromPredictionDate:v6 bundleId:v7];

  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v9 = (void *)MEMORY[0x1E4F28F60];
  double v10 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1EF676458];
  id v11 = [v9 predicateWithFormat:@"(direction IN %@)", v10];
  [v8 addObject:v11];

  id v12 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(mechanism == %@)", &unk_1EF675750];
  [v8 addObject:v12];

  id v13 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(recipientCount == 1)"];
  [v8 addObject:v13];

  uint64_t v14 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v8];
  uint64_t v15 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:0];
  uint64_t v16 = [(_PSKNNModel *)self interactionStore];
  v77[0] = v15;
  double v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v77 count:1];
  id v71 = 0;
  double v18 = [v16 queryInteractionsUsingPredicate:v14 sortDescriptors:v17 limit:2000 error:&v71];
  id v19 = v71;

  uint64_t v20 = +[_PSLogging knnChannel];
  double v21 = v20;
  if (v19)
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[_PSKNNModel mapsShareEtaDefaultKnnSuggestions:maxSuggestions:]();
    }
    id v58 = (id)MEMORY[0x1E4F1CBF0];
    uint64_t v22 = (void *)v57;
  }
  else
  {
    long long v53 = v15;
    long long v54 = v14;
    id v55 = v8;
    id v56 = v5;
    unint64_t v23 = 0x1E4F1C000uLL;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v24 = v21;
      unint64_t v25 = objc_opt_new();
      long long v67 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      id v26 = v18;
      uint64_t v27 = [v26 countByEnumeratingWithState:&v67 objects:v74 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v68;
        do
        {
          for (uint64_t i = 0; i != v28; ++i)
          {
            if (*(void *)v68 != v29) {
              objc_enumerationMutation(v26);
            }
            uint64_t v31 = [*(id *)(*((void *)&v67 + 1) + 8 * i) bundleId];
            [v25 addObject:v31];
          }
          uint64_t v28 = [v26 countByEnumeratingWithState:&v67 objects:v74 count:16];
        }
        while (v28);
      }

      uint64_t v32 = [v25 allObjects];
      id v33 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      v65[0] = MEMORY[0x1E4F143A8];
      v65[1] = 3221225472;
      v65[2] = __64___PSKNNModel_mapsShareEtaDefaultKnnSuggestions_maxSuggestions___block_invoke;
      v65[3] = &unk_1E5AE0B38;
      id v66 = v25;
      id v34 = v25;
      uint64_t v35 = objc_msgSend(v32, "_pas_mappedArrayWithTransform:", v65);
      uint64_t v36 = (void *)[v33 initWithObjects:v35 forKeys:v32];

      *(_DWORD *)buf = 138477827;
      BOOL v76 = v36;
      double v21 = v24;
      _os_log_impl(&dword_1A314B000, v24, OS_LOG_TYPE_DEFAULT, "Knn - Maps ShareETA considering interactions from bundle IDs: %{private}@", buf, 0xCu);
    }
    uint64_t v52 = [(_PSKNNModel *)self featuresFromInteractionsSplitRecipients:v18];
    uint64_t v37 = -[_PSKNNModel interactionLabelsForQueryResult:queryPoint:rankerType:frequencyOnly:contactsOnly:](self, "interactionLabelsForQueryResult:queryPoint:rankerType:frequencyOnly:contactsOnly:");
    id v58 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v60 = [MEMORY[0x1E4F1CA80] set];
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    obuint64_t j = v37;
    uint64_t v38 = [obj countByEnumeratingWithState:&v61 objects:v73 count:16];
    if (v38)
    {
      uint64_t v39 = v38;
      uint64_t v40 = *(void *)v62;
      id v41 = @"key";
      do
      {
        for (uint64_t j = 0; j != v39; ++j)
        {
          if (*(void *)v62 != v40) {
            objc_enumerationMutation(obj);
          }
          long long v43 = [*(id *)(*((void *)&v61 + 1) + 8 * j) objectForKeyedSubscript:v41];
          long long v44 = [v43 objectForKeyedSubscript:@"conversationId"];

          if (v44 && ([v60 containsObject:v44] & 1) == 0)
          {
            long long v45 = v41;
            long long v46 = [[_PSRecipient alloc] initWithIdentifier:v44 handle:v44 contact:0];
            long long v47 = [_PSSuggestion alloc];
            BOOL v72 = v46;
            unint64_t v48 = v23;
            long long v49 = [*(id *)(v23 + 2424) arrayWithObjects:&v72 count:1];
            id v50 = [(_PSSuggestion *)v47 initWithBundleID:0 conversationIdentifier:0 groupName:0 recipients:v49];

            if (v50) {
              [v58 addObject:v50];
            }
            [v60 addObject:v44];

            unint64_t v23 = v48;
            id v41 = v45;
          }
        }
        uint64_t v39 = [obj countByEnumeratingWithState:&v61 objects:v73 count:16];
      }
      while (v39);
    }

    id v5 = v56;
    uint64_t v22 = (void *)v57;
    uint64_t v14 = v54;
    id v8 = v55;
    uint64_t v15 = v53;
    double v21 = v52;
    id v19 = 0;
  }

  return v58;
}

- (id)featuresFromMapsFeedbackEvents:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v27 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  unint64_t v25 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        uint64_t v11 = [v10 startDate];
        if (v11)
        {
          id v12 = (void *)v11;
          id v13 = [v10 source];
          uint64_t v14 = [v13 bundleID];

          if (v14)
          {
            uint64_t v15 = [v10 startDate];
            uint64_t v16 = [v10 source];
            double v17 = [v16 bundleID];
            double v18 = [(_PSKNNModel *)self featureVectorFromPredictionDate:v15 bundleId:v17];

            id v19 = [v18 valueForKey:@"description"];
            uint64_t v20 = [v19 componentsJoinedByString:&stru_1EF653EA8];

            double v21 = [v4 objectForKeyedSubscript:v20];

            if (!v21)
            {
              uint64_t v22 = [MEMORY[0x1E4F1CA48] array];
              [v4 setObject:v22 forKeyedSubscript:v20];
            }
            unint64_t v23 = [v4 objectForKeyedSubscript:v20];
            [v23 addObject:v10];

            [v27 addObject:v18];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v7);
  }

  [v25 addObject:v27];
  [v25 addObject:v4];

  return v25;
}

- (id)extractNearestNeighborsForMapsQueryResult:(id)a3 andNeighbors:(id)a4 frequencyOnly:(BOOL)a5
{
  BOOL v43 = a5;
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
  id v42 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v38 = v6;
  id v41 = [v6 objectAtIndex:1];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  obuint64_t j = v7;
  uint64_t v9 = [obj countByEnumeratingWithState:&v48 objects:v53 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v49 != v11) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        uint64_t v14 = [v13 nodeData];
        uint64_t v15 = [v14 valueForKey:@"description"];
        uint64_t v16 = [v15 componentsJoinedByString:&stru_1EF653EA8];

        double v17 = [v41 objectForKeyedSubscript:v16];
        [v8 addObject:v17];

        double v18 = NSNumber;
        [v13 distance];
        id v19 = objc_msgSend(v18, "numberWithDouble:");
        [v42 addObject:v19];
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v48 objects:v53 count:16];
    }
    while (v10);
  }

  uint64_t v20 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([v8 count])
  {
    unint64_t v21 = 0;
    uint64_t v39 = v8;
    do
    {
      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      uint64_t v22 = [v8 objectAtIndexedSubscript:v21];
      uint64_t v23 = [v22 countByEnumeratingWithState:&v44 objects:v52 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v45;
        do
        {
          for (uint64_t j = 0; j != v24; ++j)
          {
            if (*(void *)v45 != v25) {
              objc_enumerationMutation(v22);
            }
            uint64_t v27 = [*(id *)(*((void *)&v44 + 1) + 8 * j) value];
            long long v28 = [v27 stringValue];

            if (v28)
            {
              long long v29 = [v20 objectForKeyedSubscript:v28];
              long long v30 = NSNumber;
              [v29 doubleValue];
              double v32 = v31;
              if (v43)
              {
                uint64_t v33 = [v30 numberWithDouble:v31 + 1.0];
              }
              else
              {
                id v34 = [v42 objectAtIndexedSubscript:v21];
                [v34 doubleValue];
                uint64_t v33 = [v30 numberWithDouble:v32 + 1.0 / v35];

                long long v29 = v34;
              }

              [v20 setObject:v33 forKeyedSubscript:v28];
            }
          }
          uint64_t v24 = [v22 countByEnumeratingWithState:&v44 objects:v52 count:16];
        }
        while (v24);
      }

      ++v21;
      uint64_t v8 = v39;
    }
    while ([v39 count] > v21);
  }
  uint64_t v36 = [v20 keysSortedByValueUsingComparator:&__block_literal_global_497];

  return v36;
}

- (unint64_t)k
{
  return self->_k;
}

- (_DKKnowledgeQuerying)knowledgeStore
{
  return self->_knowledgeStore;
}

- (_CDInteractionStore)interactionStore
{
  return self->_interactionStore;
}

- (_PSContactResolver)contactResolver
{
  return self->_contactResolver;
}

- (NSArray)filterBundleIds
{
  return self->_filterBundleIds;
}

- (_CDInteractionCache)messageInteractionCache
{
  return self->_messageInteractionCache;
}

- (void)setMessageInteractionCache:(id)a3
{
}

- (_CDInteractionCache)shareInteractionCache
{
  return self->_shareInteractionCache;
}

- (void)setShareInteractionCache:(id)a3
{
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (unint64_t)_PSKnnTopKShares
{
  return self->__PSKnnTopKShares;
}

- (void)set_PSKnnTopKShares:(unint64_t)a3
{
  self->__PSKnnTopKShares = a3;
}

- (unint64_t)_PSKnnMessagesZkwTopNFilter
{
  return self->__PSKnnMessagesZkwTopNFilter;
}

- (void)set_PSKnnMessagesZkwTopNFilter:(unint64_t)a3
{
  self->__PSKnnMessagesZkwTopNFilter = a3;
}

- (unint64_t)_PSKnnModelRecencyMarginToPromoteShares
{
  return self->__PSKnnModelRecencyMarginToPromoteShares;
}

- (void)set_PSKnnModelRecencyMarginToPromoteShares:(unint64_t)a3
{
  self->__PSKnnModelRecencyMarginToPromoteShares = a3;
}

- (unint64_t)_PSKnnModelRecencyMarginToPromoteSharesMatchingBundleId
{
  return self->__PSKnnModelRecencyMarginToPromoteSharesMatchingBundleId;
}

- (void)set_PSKnnModelRecencyMarginToPromoteSharesMatchingBundleId:(unint64_t)a3
{
  self->__PSKnnModelRecencyMarginToPromoteSharesMatchingBundleId = a3;
}

- (unint64_t)_PSKnnModelRecencyMarginToRetainShares
{
  return self->__PSKnnModelRecencyMarginToRetainShares;
}

- (void)set_PSKnnModelRecencyMarginToRetainShares:(unint64_t)a3
{
  self->__PSKnnModelRecencyMarginToRetainShares = a3;
}

- (unint64_t)_PSKnnModelShareSheetMinimumOccurenceRegularizer
{
  return self->__PSKnnModelShareSheetMinimumOccurenceRegularizer;
}

- (void)set_PSKnnModelShareSheetMinimumOccurenceRegularizer:(unint64_t)a3
{
  self->__PSKnnModelShareSheetMinimumOccurenceRegularizer = a3;
}

- (unint64_t)_PSKnnModelSharePlayMinimumOccurenceRegularizer
{
  return self->__PSKnnModelSharePlayMinimumOccurenceRegularizer;
}

- (void)set_PSKnnModelSharePlayMinimumOccurenceRegularizer:(unint64_t)a3
{
  self->__PSKnnModelSharePlayMinimumOccurenceRegularizer = a3;
}

- (unint64_t)_PSKnnModelShareSheetSuggestionEngagedMinimumOccurenceRegularizer
{
  return self->__PSKnnModelShareSheetSuggestionEngagedMinimumOccurenceRegularizer;
}

- (void)set_PSKnnModelShareSheetSuggestionEngagedMinimumOccurenceRegularizer:(unint64_t)a3
{
  self->__PSKnnModelShareSheetSuggestionEngagedMinimumOccurenceRegularizer = a3;
}

- (unint64_t)_PSKnnTopKGroupActivities
{
  return self->__PSKnnTopKGroupActivities;
}

- (void)set_PSKnnTopKGroupActivities:(unint64_t)a3
{
  self->__PSKnnTopKGroupActivities = a3;
}

- (unint64_t)_PSKnnModelRecencyMarginToRetainGroupActivities
{
  return self->__PSKnnModelRecencyMarginToRetainGroupActivities;
}

- (void)set_PSKnnModelRecencyMarginToRetainGroupActivities:(unint64_t)a3
{
  self->__PSKnnModelRecencyMarginToRetainGroupActivities = a3;
}

- (unint64_t)_PSKnnModelGroupActivitiesMinimumOccuranceRegularizer
{
  return self->__PSKnnModelGroupActivitiesMinimumOccuranceRegularizer;
}

- (void)set_PSKnnModelGroupActivitiesMinimumOccuranceRegularizer:(unint64_t)a3
{
  self->__PSKnnModelGroupActivitiesMinimumOccuranceRegularizer = a3;
}

- (unint64_t)_PSKnnModelSameBundleIdPenalty
{
  return self->__PSKnnModelSameBundleIdPenalty;
}

- (void)set_PSKnnModelSameBundleIdPenalty:(unint64_t)a3
{
  self->__PSKnnModelSameBundleIdPenalty = a3;
}

- (unint64_t)_PSKnnModelDifferentPeoplePenalty
{
  return self->__PSKnnModelDifferentPeoplePenalty;
}

- (void)set_PSKnnModelDifferentPeoplePenalty:(unint64_t)a3
{
  self->__PSKnnModelDifferentPeoplePenalty = a3;
}

- (BOOL)_PSInteractionModelInUse
{
  return self->__PSInteractionModelInUse;
}

- (void)set_PSInteractionModelInUse:(BOOL)a3
{
  self->__PSInteractionModelInUse = a3;
}

- (NSDictionary)_PSKnnModelMinimumOccurenceOfInteractionByMechanism
{
  return self->__PSKnnModelMinimumOccurenceOfInteractionByMechanism;
}

- (void)set_PSKnnModelMinimumOccurenceOfInteractionByMechanism:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__PSKnnModelMinimumOccurenceOfInteractionByMechanism, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_shareInteractionCache, 0);
  objc_storeStrong((id *)&self->_messageInteractionCache, 0);
  objc_storeStrong((id *)&self->_filterBundleIds, 0);
  objc_storeStrong((id *)&self->_contactResolver, 0);
  objc_storeStrong((id *)&self->_interactionStore, 0);

  objc_storeStrong((id *)&self->_knowledgeStore, 0);
}

- (void)suggestionProxiesWithPredictionContext:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_1A314B000, v0, OS_LOG_TYPE_DEBUG, "Knn - Sharesheet shareLabels: %@", v1, 0xCu);
}

- (void)mapsShareEtaDefaultKnnSuggestions:maxSuggestions:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0(&dword_1A314B000, v0, v1, "Knn - Maps ShareETA error querying interactions database for maps suggestions: %@", v2);
}

@end
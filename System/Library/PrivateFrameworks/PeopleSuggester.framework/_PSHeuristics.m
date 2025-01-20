@interface _PSHeuristics
+ (id)PSHeuristicsRecencyReasonToString:(int64_t)a3;
+ (id)templateForPhoneCallHeuristicFromSuggestionProxy:(id)a3;
- (NSDictionary)recencyHeuristicLimitNumberOfProxiesByReason;
- (_CDInteractionCache)messageInteractionCache;
- (_CDInteractionCache)recencyCache;
- (_CDInteractionStore)interactionStore;
- (_DKKnowledgeQuerying)knowledgeStore;
- (_PSContactResolver)contactResolver;
- (_PSHeuristics)initWithKnowledgeStore:(id)a3 interactionStore:(id)a4 contactResolver:(id)a5 messageInteractionCache:(id)a6;
- (_PSHeuristics)initWithKnowledgeStore:(id)a3 interactionStore:(id)a4 contactResolver:(id)a5 shareSheetSupportedBundleIds:(id)a6 messageInteractionCache:(id)a7;
- (double)recencyMargin;
- (id)heuristicsFromInteractionsStatistics:(id)a3 forStatsNames:(id)a4 threshold:(double)a5 maxNumberOfSuggestions:(int)a6 reason:(id)a7;
- (id)hourOfDayProbabilitiesToInteractWithContacts:(id)a3;
- (id)hyperRecentHeuristicIncomingSuggestionProxiesForInteractionStatistics:(id)a3;
- (id)hyperRecentHeuristicSuggestionProxiesForInteractionStatistics:(id)a3;
- (id)hyperRecentHeuristicSuggestionProxiesForInteractionStatistics:(id)a3 forStatName:(id)a4;
- (id)hyperRecentHeuristicSuggestionProxiesWithReferenceDate:(id)a3 predictionContextBundleId:(id)a4;
- (id)inPhoneCallHeuristicSuggestionProxiesWithBundleIds:(id)a3 predictionContext:(id)a4;
- (id)pastSharesAwareSuggestionProxiesForInteractionStatistics:(id)a3;
- (id)pastSharesOfTopDomainURLAwareSuggestionProxiesForInteractionStatistics:(id)a3;
- (id)pastSharesWithCurrentAppAwareSuggestionProxiesForInteractionStatistics:(id)a3;
- (id)peopleAwareSuggestionProxiesForInteractionStatistics:(id)a3;
- (id)proxiesByRecencyUsingInteractions:(id)a3 startIndex:(unint64_t)a4 reason:(int64_t)a5 allowNonSupportedBundleIDs:(BOOL)a6;
- (id)proximityBoostingHeuristicWithProximityBooster:(id)a3 existingSuggestions:(id)a4;
- (id)recentNonSystemSuggestionsForBundleIDs:(id)a3 numberOfSuggestion:(unint64_t)a4;
- (id)returnDocumentToSender:(id)a3;
- (id)seedSuggestionsForChatGuidsAndTransports:(id)a3;
- (void)prepareRecencyCacheWithSupportedBundleIds:(id)a3;
- (void)setRecencyCache:(id)a3;
- (void)setRecencyHeuristicLimitNumberOfProxiesByReason:(id)a3;
- (void)setRecencyMargin:(double)a3;
- (void)updateModelProperties:(id)a3;
@end

@implementation _PSHeuristics

- (_PSHeuristics)initWithKnowledgeStore:(id)a3 interactionStore:(id)a4 contactResolver:(id)a5 messageInteractionCache:(id)a6
{
  return [(_PSHeuristics *)self initWithKnowledgeStore:a3 interactionStore:a4 contactResolver:a5 shareSheetSupportedBundleIds:0 messageInteractionCache:a6];
}

- (_PSHeuristics)initWithKnowledgeStore:(id)a3 interactionStore:(id)a4 contactResolver:(id)a5 shareSheetSupportedBundleIds:(id)a6 messageInteractionCache:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v22.receiver = self;
  v22.super_class = (Class)_PSHeuristics;
  v18 = [(_PSHeuristics *)&v22 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_knowledgeStore, a3);
    objc_storeStrong((id *)&v19->_interactionStore, a4);
    objc_storeStrong((id *)&v19->_contactResolver, a5);
    objc_storeStrong((id *)&v19->_messageInteractionCache, a7);
    v20 = +[_PSConfig defaultConfig];
    [(_PSHeuristics *)v19 updateModelProperties:v20];
    [(_PSHeuristics *)v19 prepareRecencyCacheWithSupportedBundleIds:v16];
  }
  return v19;
}

- (void)updateModelProperties:(id)a3
{
  v27[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v7 = [v4 objectForKeyedSubscript:v6];

  v8 = [v7 objectForKeyedSubscript:@"_PSHeuristicsRecencyMargin"];
  -[_PSHeuristics setRecencyMargin:](self, "setRecencyMargin:", (double)[v8 integerValue]);

  v9 = +[_PSLogging heuristicsChannel];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[_PSHeuristics updateModelProperties:](self);
  }

  v26[0] = &unk_1EF675378;
  v10 = NSNumber;
  v11 = [v7 objectForKeyedSubscript:@"_PSHeuristicsBackfillLimit"];
  uint64_t v12 = [v11 integerValue];
  if (v12) {
    uint64_t v13 = v12;
  }
  else {
    uint64_t v13 = -1;
  }
  id v14 = [v10 numberWithUnsignedLong:v13];
  v27[0] = v14;
  v26[1] = &unk_1EF675390;
  id v15 = NSNumber;
  id v16 = [v7 objectForKeyedSubscript:@"_PSHeuristicsMessagesRecencyLimit"];
  uint64_t v17 = [v16 integerValue];
  if (v17) {
    uint64_t v18 = v17;
  }
  else {
    uint64_t v18 = 3;
  }
  v19 = [v15 numberWithInteger:v18];
  v27[1] = v19;
  v26[2] = &unk_1EF6753A8;
  v20 = NSNumber;
  v21 = [v7 objectForKeyedSubscript:@"_PSHeuristicsShareSheetRecencyLimit"];
  uint64_t v22 = [v21 integerValue];
  if (v22) {
    uint64_t v23 = v22;
  }
  else {
    uint64_t v23 = 2;
  }
  v24 = [v20 numberWithInteger:v23];
  v27[2] = v24;
  v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:3];
  [(_PSHeuristics *)self setRecencyHeuristicLimitNumberOfProxiesByReason:v25];
}

- (void)prepareRecencyCacheWithSupportedBundleIds:(id)a3
{
  v21[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(bundleId IN %@) AND (mechanism == %@)", v4, &unk_1EF6753C0];
    v6 = (void *)[v4 mutableCopy];
    v7 = +[_PSConstants shareSheetTargetBundleIdMail];
    [v6 removeObject:v7];

    v8 = +[_PSConstants mobileMailBundleId];
    [v6 removeObject:v8];

    v9 = +[_PSConstants mobileMessagesBundleId];
    [v6 removeObject:v9];

    v10 = +[_PSConstants shareSheetTargetBundleIdMessages];
    [v6 addObject:v10];

    v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(targetBundleId IN %@) AND (mechanism == %@)", v6, &unk_1EF6753D8];
    uint64_t v12 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(mechanism IN %@) AND (recipients.@count == 1) AND SUBQUERY(recipients, $recipient, $recipient.personId != nil).@count > 0", &unk_1EF676260];
    uint64_t v13 = (void *)MEMORY[0x1E4F28BA0];
    v21[0] = v5;
    v21[1] = v11;
    v21[2] = v12;
    id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:3];
    id v15 = [v13 orPredicateWithSubpredicates:v14];

    id v16 = [(_PSHeuristics *)self interactionStore];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __59___PSHeuristics_prepareRecencyCacheWithSupportedBundleIds___block_invoke;
    v19[3] = &unk_1E5AE0208;
    id v20 = v15;
    id v17 = v15;
    uint64_t v18 = +[_PSInteractionStoreUtils interactionCacheFromStore:v16 size:1 queryPredicate:v17 filterBlock:v19];
    [(_PSHeuristics *)self setRecencyCache:v18];
  }
}

- (id)seedSuggestionsForChatGuidsAndTransports:(id)a3
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (![v3 count])
  {
    v53 = MEMORY[0x1E4F1CBF0];
    goto LABEL_45;
  }
  unint64_t v4 = 0x1E4F1C000uLL;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    log = +[_PSLogging heuristicsChannel];
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      -[_PSHeuristics seedSuggestionsForChatGuidsAndTransports:](log);
    }
LABEL_44:
    v53 = MEMORY[0x1E4F1CBF0];

    goto LABEL_45;
  }
  log = objc_opt_new();
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v72 objects:v80 count:16];
  if (!v5) {
    goto LABEL_37;
  }
  uint64_t v6 = v5;
  v7 = &off_1E5ADE000;
  uint64_t v8 = *(void *)v73;
  uint64_t v55 = *(void *)v73;
  id v56 = v3;
  while (2)
  {
    uint64_t v9 = 0;
    uint64_t v57 = v6;
    do
    {
      if (*(void *)v73 != v8) {
        objc_enumerationMutation(obj);
      }
      v10 = [*(id *)(*((void *)&v72 + 1) + 8 * v9) componentsSeparatedByString:@"||"];
      if (![v10 count])
      {

        goto LABEL_44;
      }
      uint64_t v11 = [v10 objectAtIndexedSubscript:0];
      v63 = v10;
      uint64_t v64 = v9;
      if ((unint64_t)[v10 count] <= 1) {
        +[_PSConstants mobileMessagesBundleId];
      }
      else {
      v66 = [v10 objectAtIndexedSubscript:1];
      }
      uint64_t v12 = v7[165];
      v62 = v11;
      uint64_t v79 = v11;
      uint64_t v13 = [*(id *)(v4 + 2424) arrayWithObjects:&v79 count:1];
      id v14 = [(_PSHeuristics *)self interactionStore];
      id v15 = [v12 interactionsMatchingAnyHandlesOrDomainIds:v13 account:0 directions:&unk_1EF676278 mechanisms:0 bundleIds:0 store:v14 fetchLimit:500];

      id v16 = objc_msgSend(v15, "_pas_filteredArrayWithTest:", &__block_literal_global_20);
      v60 = v16;
      v61 = v15;
      if (v16 && (id v17 = v16, [v16 count]))
      {
        uint64_t v18 = [v17 firstObject];
        v19 = +[_PSLogging heuristicsChannel];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v78 = v18;
          _os_log_impl(&dword_1A314B000, v19, OS_LOG_TYPE_DEFAULT, "Interaction being used to generate suggestion %@", buf, 0xCu);
        }

        id v20 = objc_opt_new();
        long long v68 = 0u;
        long long v69 = 0u;
        long long v70 = 0u;
        long long v71 = 0u;
        v65 = v18;
        v21 = [v18 recipients];
        uint64_t v22 = [v21 countByEnumeratingWithState:&v68 objects:v76 count:16];
        if (v22)
        {
          uint64_t v23 = v22;
          uint64_t v24 = *(void *)v69;
          do
          {
            for (uint64_t i = 0; i != v23; ++i)
            {
              if (*(void *)v69 != v24) {
                objc_enumerationMutation(v21);
              }
              v26 = *(void **)(*((void *)&v68 + 1) + 8 * i);
              v27 = [(_PSHeuristics *)self contactResolver];
              v28 = [v26 handle];
              v29 = [v27 resolveContactIfPossibleFromContactIdentifierString:v28];

              v30 = [_PSRecipient alloc];
              if (v29) {
                v31 = v29;
              }
              else {
                v31 = v26;
              }
              v32 = [v31 identifier];
              v33 = [v26 handle];
              v34 = [v26 displayName];
              v35 = [(_PSRecipient *)v30 initWithIdentifier:v32 handle:v33 displayName:v34 contact:v29];

              [v20 addObject:v35];
            }
            uint64_t v23 = [v21 countByEnumeratingWithState:&v68 objects:v76 count:16];
          }
          while (v23);
        }

        v36 = [v65 contentURL];

        if (v36)
        {
          id INImageClass = getINImageClass();
          v38 = [v65 contentURL];
          v39 = [INImageClass imageWithURL:v38];
        }
        else
        {
          v39 = 0;
        }
        v44 = [_PSSuggestion alloc];
        v45 = NSString;
        v46 = [v65 domainIdentifier];
        v47 = [v45 stringWithFormat:@"%@_%@", v66, v46];
        v48 = [v65 groupName];
        v49 = (void *)[v20 copy];
        v50 = [v65 derivedIntentIdentifier];
        v51 = [(_PSSuggestion *)v44 initWithBundleID:v66 conversationIdentifier:v47 groupName:v48 recipients:v49 derivedIntentIdentifier:v50 image:v39 reason:@"Demo mode" reasonType:@"Demo mode" score:0];

        if (v51) {
          [log addObject:v51];
        }

        unint64_t v4 = 0x1E4F1C000;
        id v3 = v56;
        uint64_t v6 = v57;
        v7 = &off_1E5ADE000;
        uint64_t v8 = v55;
      }
      else
      {
        v40 = +[_PSLogging heuristicsChannel];
        v65 = v40;
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v41 = v62;
          v78 = v62;
          _os_log_impl(&dword_1A314B000, v40, OS_LOG_TYPE_DEFAULT, "Could not find any interaction matching seed suggestion %@", buf, 0xCu);
          v43 = v63;
          uint64_t v42 = v64;
          goto LABEL_35;
        }
      }
      v43 = v63;
      uint64_t v42 = v64;
      v41 = v62;
LABEL_35:

      uint64_t v9 = v42 + 1;
    }
    while (v9 != v6);
    uint64_t v6 = [obj countByEnumeratingWithState:&v72 objects:v80 count:16];
    if (v6) {
      continue;
    }
    break;
  }
LABEL_37:

  v52 = +[_PSLogging heuristicsChannel];
  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v78 = log;
    _os_log_impl(&dword_1A314B000, v52, OS_LOG_TYPE_DEFAULT, "Returned suggestions for demo mode %@", buf, 0xCu);
  }

  v53 = log;
LABEL_45:

  return v53;
}

- (id)recentNonSystemSuggestionsForBundleIDs:(id)a3 numberOfSuggestion:(unint64_t)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v36 = a3;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithArray:v36];
  uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
  v7 = +[_PSConstants mobileMessagesBundleId];
  uint64_t v8 = +[_PSConstants shareSheetTargetBundleIdMessages];
  uint64_t v9 = +[_PSConstants mobileMailBundleId];
  v10 = +[_PSConstants shareSheetTargetBundleIdMail];
  uint64_t v11 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, 0);
  [v5 minusSet:v11];

  v39 = self;
  uint64_t v12 = [(_PSHeuristics *)self interactionStore];
  v35 = v5;
  uint64_t v13 = (void *)[v5 copy];
  id v14 = +[_PSInteractionStoreUtils recentInteractionsFromStore:v12 bundleIDs:v13];

  id v37 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v16 = v14;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v42;
    uint64_t v38 = *(void *)v42;
    do
    {
      uint64_t v20 = 0;
      uint64_t v40 = v18;
      do
      {
        if (*(void *)v42 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = *(void **)(*((void *)&v41 + 1) + 8 * v20);
        uint64_t v22 = [v21 derivedIntentIdentifier];
        if ([v21 mechanism] == 13) {
          [v21 targetBundleId];
        }
        else {
        uint64_t v23 = [v21 bundleId];
        }
        uint64_t v24 = v23;
        if (v22) {
          BOOL v25 = v23 == 0;
        }
        else {
          BOOL v25 = 1;
        }
        if (!v25)
        {
          v26 = _PSSuggestionKey(v23, v22);
          if (([v15 containsObject:v26] & 1) == 0)
          {
            id v27 = v15;
            [v15 addObject:v26];
            v28 = [(_PSHeuristics *)v39 knowledgeStore];
            v29 = [(_PSHeuristics *)v39 contactResolver];
            v30 = (objc_class *)objc_opt_class();
            v31 = NSStringFromClass(v30);
            v32 = +[_PSSuggestion suggestionForBundleID:v24 derivedIntentIdentifier:v22 knowledgeStore:v28 contactResolver:v29 reason:@"Recent Non-System" reasonType:v31];

            if (v32) {
              [v37 addObject:v32];
            }

            id v15 = v27;
            uint64_t v19 = v38;
            uint64_t v18 = v40;
          }
        }
        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [v16 countByEnumeratingWithState:&v41 objects:v45 count:16];
    }
    while (v18);
  }

  v33 = (void *)[v37 copy];

  return v33;
}

- (id)proximityBoostingHeuristicWithProximityBooster:(id)a3 existingSuggestions:(id)a4
{
  return (id)[a3 suggestionsByBoostingNearbySuggestions:a4];
}

- (id)hyperRecentHeuristicSuggestionProxiesForInteractionStatistics:(id)a3
{
  return [(_PSHeuristics *)self hyperRecentHeuristicSuggestionProxiesForInteractionStatistics:a3 forStatName:@"timeSinceLastOutgoingInteraction"];
}

- (id)hyperRecentHeuristicIncomingSuggestionProxiesForInteractionStatistics:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(_PSHeuristics *)self hyperRecentHeuristicSuggestionProxiesForInteractionStatistics:a3 forStatName:@"timeSinceLastIncomingInteraction"];
  if ([v3 count])
  {
    unint64_t v4 = [v3 objectAtIndexedSubscript:0];
    v7[0] = v4;
    uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  }
  else
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v5;
}

- (id)hyperRecentHeuristicSuggestionProxiesForInteractionStatistics:(id)a3 forStatName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 conversationIds];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __91___PSHeuristics_hyperRecentHeuristicSuggestionProxiesForInteractionStatistics_forStatName___block_invoke;
  void v26[3] = &unk_1E5AE0230;
  id v9 = v6;
  id v27 = v9;
  id v10 = v7;
  id v28 = v10;
  v29 = self;
  uint64_t v11 = objc_msgSend(v8, "_pas_filteredArrayWithTest:", v26);

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __91___PSHeuristics_hyperRecentHeuristicSuggestionProxiesForInteractionStatistics_forStatName___block_invoke_2;
  v23[3] = &unk_1E5AE0258;
  id v12 = v9;
  id v24 = v12;
  id v13 = v10;
  id v25 = v13;
  id v14 = [v11 sortedArrayUsingComparator:v23];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __91___PSHeuristics_hyperRecentHeuristicSuggestionProxiesForInteractionStatistics_forStatName___block_invoke_3;
  v19[3] = &unk_1E5AE0280;
  id v20 = v12;
  id v21 = v13;
  uint64_t v22 = self;
  id v15 = v13;
  id v16 = v12;
  uint64_t v17 = objc_msgSend(v14, "_pas_mappedArrayWithTransform:", v19);

  return v17;
}

- (id)peopleAwareSuggestionProxiesForInteractionStatistics:(id)a3
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v9[0] = @"numberOfSharesOfDetectedPeopleWithConversation";
  v9[1] = @"numberOfEngagedSuggestionsOfDetectedPeopleWithConversation";
  unint64_t v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  id v6 = [v4 arrayWithObjects:v9 count:2];
  id v7 = [(_PSHeuristics *)self heuristicsFromInteractionsStatistics:v5 forStatsNames:v6 threshold:8 maxNumberOfSuggestions:@"PASS heuristic - PS Rewrite" reason:1.0];

  return v7;
}

- (id)pastSharesWithCurrentAppAwareSuggestionProxiesForInteractionStatistics:(id)a3
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v9[0] = @"numberOfSharesFromCurrentAppWithConversation";
  v9[1] = @"numberOfEngagedSuggestionsFromCurrentAppWithConversation";
  unint64_t v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  id v6 = [v4 arrayWithObjects:v9 count:2];
  id v7 = [(_PSHeuristics *)self heuristicsFromInteractionsStatistics:v5 forStatsNames:v6 threshold:4 maxNumberOfSuggestions:@"PastSharesWithCurrentApp heuristic - PS Rewrite" reason:3.0];

  return v7;
}

- (id)pastSharesAwareSuggestionProxiesForInteractionStatistics:(id)a3
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v9[0] = @"numberOfSharesWithConversation";
  v9[1] = @"numberOfEngagedSuggestionsWithConversation";
  unint64_t v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  id v6 = [v4 arrayWithObjects:v9 count:2];
  id v7 = [(_PSHeuristics *)self heuristicsFromInteractionsStatistics:v5 forStatsNames:v6 threshold:5 maxNumberOfSuggestions:@"PastSharesHeuristic - PS Rewrite" reason:3.0];

  return v7;
}

- (id)pastSharesOfTopDomainURLAwareSuggestionProxiesForInteractionStatistics:(id)a3
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v9[0] = @"numberOfSharesOfTopDomainURLWithConversation";
  v9[1] = @"numberOfEngagedSuggestionsOfTopDomainURLWithConversation";
  unint64_t v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  id v6 = [v4 arrayWithObjects:v9 count:2];
  id v7 = [(_PSHeuristics *)self heuristicsFromInteractionsStatistics:v5 forStatsNames:v6 threshold:3 maxNumberOfSuggestions:@"PastSharesOfTopDomainURLHeuristic - PS Rewrite" reason:1.0];

  return v7;
}

- (id)heuristicsFromInteractionsStatistics:(id)a3 forStatsNames:(id)a4 threshold:(double)a5 maxNumberOfSuggestions:(int)a6 reason:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a7;
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __108___PSHeuristics_heuristicsFromInteractionsStatistics_forStatsNames_threshold_maxNumberOfSuggestions_reason___block_invoke;
  v38[3] = &unk_1E5AE02D0;
  id v14 = v11;
  id v39 = v14;
  id v15 = (void *)MEMORY[0x1A6243AD0](v38);
  id v16 = [v14 conversationIds];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __108___PSHeuristics_heuristicsFromInteractionsStatistics_forStatsNames_threshold_maxNumberOfSuggestions_reason___block_invoke_3;
  v34[3] = &unk_1E5AE02F8;
  id v17 = v15;
  id v36 = v17;
  id v18 = v12;
  id v35 = v18;
  double v37 = a5;
  uint64_t v19 = objc_msgSend(v16, "_pas_filteredArrayWithTest:", v34);

  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __108___PSHeuristics_heuristicsFromInteractionsStatistics_forStatsNames_threshold_maxNumberOfSuggestions_reason___block_invoke_4;
  v31[3] = &unk_1E5AE0320;
  id v32 = v18;
  id v33 = v17;
  id v20 = v18;
  id v21 = v17;
  uint64_t v22 = [v19 sortedArrayUsingComparator:v31];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __108___PSHeuristics_heuristicsFromInteractionsStatistics_forStatsNames_threshold_maxNumberOfSuggestions_reason___block_invoke_5;
  v27[3] = &unk_1E5AE0280;
  id v28 = v14;
  id v29 = v13;
  v30 = self;
  id v23 = v13;
  id v24 = v14;
  id v25 = objc_msgSend(v22, "_pas_mappedArrayWithTransform:", v27);

  return v25;
}

- (id)hyperRecentHeuristicSuggestionProxiesWithReferenceDate:(id)a3 predictionContextBundleId:(id)a4
{
  v38[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  [(_PSHeuristics *)self recencyMargin];
  id v7 = [v5 dateByAddingTimeInterval:-v6];

  uint64_t v8 = [(_PSHeuristics *)self recencyCache];
  id v9 = [v8 interactions];
  id v10 = (void *)MEMORY[0x1E4F28F60];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __98___PSHeuristics_hyperRecentHeuristicSuggestionProxiesWithReferenceDate_predictionContextBundleId___block_invoke;
  v36[3] = &unk_1E5AE0348;
  id v11 = v7;
  id v37 = v11;
  id v12 = [v10 predicateWithBlock:v36];
  id v13 = [v9 filteredArrayUsingPredicate:v12];

  if ([v13 count])
  {
    id v14 = [v13 firstObject];
    if ([v14 mechanism] == 4 || [v14 mechanism] == 13)
    {
      if ([v14 mechanism] == 13)
      {
        id v15 = [v14 targetBundleId];
        id v16 = +[_PSConstants shareSheetTargetBundleIdMessages];
        if ([v15 isEqualToString:v16]) {
          +[_PSConstants mobileMessagesBundleId];
        }
        else {
        id v18 = [v14 targetBundleId];
        }

        uint64_t v19 = [v14 targetBundleId];
        uint64_t v20 = +[_PSConstants shareSheetTargetBundleIdMessages];
      }
      else
      {
        id v18 = [v14 bundleId];
        uint64_t v19 = [v14 bundleId];
        uint64_t v20 = +[_PSConstants mobileMessagesBundleId];
      }
      id v29 = (void *)v20;
      if ([v19 isEqualToString:v20]) {
        [v14 domainIdentifier];
      }
      else {
      id v21 = [v14 derivedIntentIdentifier];
      }

      v30 = [_PSSuggestionProxy alloc];
      v31 = (objc_class *)objc_opt_class();
      uint64_t v22 = NSStringFromClass(v31);
      id v28 = [(_PSSuggestionProxy *)v30 initWithBundleID:v18 interactionRecipients:v21 contactID:0 reason:@"Hyper-recent message heuristic" reasonType:v22];
    }
    else
    {
      v34 = [_PSSuggestionProxy alloc];
      id v18 = +[_PSConstants mobileMessagesBundleId];
      id v21 = [v14 recipients];
      uint64_t v22 = [v21 firstObject];
      id v23 = [v22 personId];
      id v33 = [v14 recipients];
      [v33 firstObject];
      id v24 = v35 = v11;
      id v25 = [v24 identifier];
      v26 = (objc_class *)objc_opt_class();
      id v27 = NSStringFromClass(v26);
      id v28 = [(_PSSuggestionProxy *)v34 initWithBundleID:v18 interactionRecipients:0 contactID:v23 handle:v25 reason:@"Hyper-recent call heuristic" reasonType:v27];

      id v11 = v35;
    }

    v38[0] = v28;
    id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:1];
  }
  else
  {
    id v14 = +[_PSLogging heuristicsChannel];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[_PSHeuristics hyperRecentHeuristicSuggestionProxiesWithReferenceDate:predictionContextBundleId:](v14);
    }
    id v17 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v17;
}

- (id)inPhoneCallHeuristicSuggestionProxiesWithBundleIds:(id)a3 predictionContext:(id)a4
{
  v99[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = +[_PSLogging heuristicsChannel];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A314B000, v7, OS_LOG_TYPE_INFO, "Looking to get in phone call heuristic", buf, 2u);
  }

  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v9 = [MEMORY[0x1E4F5B6A8] userContext];
  id v10 = [MEMORY[0x1E4F5B6B8] keyPathForActiveCall];
  id v11 = [v9 objectForKeyedSubscript:v10];
  if (!v11)
  {
    id v18 = (id)MEMORY[0x1E4F1CBF0];
    goto LABEL_71;
  }
  long long v75 = v10;
  v76 = v9;
  id v12 = [MEMORY[0x1E4F5B6B8] calleeContactIDsKey];
  id v13 = [v11 valueForKey:v12];

  id v14 = [MEMORY[0x1E4F5B6B8] calleeHandlesKey];
  id v15 = [v11 valueForKey:v14];

  id v16 = [MEMORY[0x1E4F5B6B8] bundleIDKey];
  uint64_t v17 = [v11 valueForKey:v16];

  if (v17)
  {
    v99[0] = v17;
    uint64_t v79 = [MEMORY[0x1E4F1C978] arrayWithObjects:v99 count:1];
  }
  else
  {
    uint64_t v79 = 0;
  }
  v88 = +[_PSConstants mobileMessagesBundleId];
  if ([v15 count] == 1)
  {
    uint64_t v19 = [v15 firstObject];
    uint64_t v20 = 0;
  }
  else
  {
    if ((unint64_t)[v15 count] < 2) {
      uint64_t v20 = 0;
    }
    else {
      uint64_t v20 = [objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v15];
    }
    uint64_t v19 = 0;
  }
  uint64_t v81 = v8;
  v82 = v13;
  id v77 = v5;
  v85 = v6;
  v80 = (void *)v20;
  if (v13 && [v13 count] == 1)
  {
    id v21 = +[_PSLogging heuristicsChannel];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A314B000, v21, OS_LOG_TYPE_INFO, "Found a donation in the context store on an active call where calleeContactIDsKey is set", buf, 2u);
    }

    uint64_t v22 = [v13 firstObject];
    id v87 = 0;
  }
  else
  {
    if (v20)
    {
      id v23 = +[_PSLogging heuristicsChannel];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A314B000, v23, OS_LOG_TYPE_INFO, "Found a donation in the context store on an active call where calleeHandlesKey is set", buf, 2u);
      }

      id v24 = [(_PSHeuristics *)self interactionStore];
      id v25 = [(_PSHeuristics *)self messageInteractionCache];
      v26 = +[_PSInteractionStoreUtils conversationIdWithExactMatchWithContactHandles:v80 store:v24 bundleIds:v5 messageInteractionCache:v25];

      if ([v26 count])
      {
        v83 = v15;
        uint64_t v27 = v19;
        id v28 = [v26 allValues];
        id v29 = [v28 firstObject];

        v30 = [v26 allKeys];
        v31 = [v30 firstObject];

        if ([v29 length] && objc_msgSend(v31, "length")) {
          id v87 = v29;
        }
        else {
          id v87 = 0;
        }
        uint64_t v19 = v27;

        id v15 = v83;
      }
      else
      {
        id v87 = 0;
      }
    }
    else
    {
      id v87 = 0;
    }
    uint64_t v22 = 0;
  }
  id v32 = +[_PSConstants mobileMessagesBundleId];
  v78 = (void *)v17;
  if (![v88 isEqualToString:v32])
  {
    v84 = 0;
    id v36 = 0;
LABEL_52:

    goto LABEL_53;
  }

  if (v19 | v22)
  {
    if (v22)
    {
      id v33 = objc_alloc(MEMORY[0x1E4F1CAD0]);
      uint64_t v98 = v22;
      v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v98 count:1];
      id v32 = (void *)[v33 initWithArray:v34];

      if (v19)
      {
LABEL_36:
        uint64_t v97 = v19;
        uint64_t v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v97 count:1];
        goto LABEL_41;
      }
    }
    else
    {
      id v32 = 0;
      if (v19) {
        goto LABEL_36;
      }
    }
    uint64_t v35 = 0;
LABEL_41:
    id v37 = [(_PSHeuristics *)self interactionStore];
    uint64_t v38 = [(_PSHeuristics *)self messageInteractionCache];
    long long v74 = (void *)v35;
    id v39 = +[_PSInteractionStoreUtils interactionsMatchingAnyHandlesOrContactIds:v35 identifiers:v32 account:0 directions:&unk_1EF676290 mechanisms:&unk_1EF6762A8 bundleIds:v79 store:v37 fetchLimit:1 messageInteractionCache:v38];

    uint64_t v40 = v39;
    long long v41 = [v39 firstObject];
    long long v42 = v41;
    if (v41
      && ([v41 bundleId], long long v43 = objc_claimAutoreleasedReturnValue(), v43, v43))
    {
      long long v73 = v40;
      uint64_t v44 = v19;
      id v45 = v78;

      v84 = [v42 groupName];
      uint64_t v46 = [v42 bundleId];
      v47 = +[_PSConstants mobileMessagesBundleId];
      char v48 = [v46 isEqualToString:v47];

      if ((v48 & 1) == 0)
      {
        uint64_t v49 = [v42 derivedIntentIdentifier];

        id v87 = (id)v49;
      }
      v88 = v45;
      uint64_t v19 = v44;
      uint64_t v40 = v73;
    }
    else
    {
      v84 = 0;
    }
    v50 = [v42 contentURL];

    if (v50)
    {
      id INImageClass = getINImageClass();
      v52 = [v42 contentURL];
      id v36 = [INImageClass imageWithURL:v52];
    }
    else
    {
      id v36 = 0;
    }

    goto LABEL_52;
  }
  v84 = 0;
  id v36 = 0;
LABEL_53:
  v53 = [_PSSuggestionProxy alloc];
  v54 = +[_PSConstants inCallHeuristicReason];
  uint64_t v55 = (objc_class *)objc_opt_class();
  id v56 = NSStringFromClass(v55);
  if (v19 || v22 || v87)
  {
    LOBYTE(v71) = 0;
    uint64_t v57 = [(_PSSuggestionProxy *)v53 initWithBundleID:v88 interactionRecipients:v87 contactID:v22 handles:v15 reason:v54 reasonType:v56 useGroupsWhenFindingRecipient:v71 groupName:v84 image:v36];

    v65 = +[_PSLogging heuristicsChannel];
    if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138413058;
      v90 = v88;
      __int16 v91 = 2112;
      id v92 = v87;
      __int16 v93 = 2112;
      uint64_t v94 = v22;
      __int16 v95 = 2112;
      uint64_t v96 = v19;
      _os_log_debug_impl(&dword_1A314B000, v65, OS_LOG_TYPE_DEBUG, "bundleId: %@, interactionRecipients: %@, contact: %@, handle: %@", buf, 0x2Au);
    }

    id v8 = v81;
    [v81 addObject:v57];
    if ([v85 isCollaborationAvailable])
    {
      v66 = [_PSSuggestionProxy alloc];
      v60 = +[_PSConstants collaborationSuggestionBundleId];
      v61 = +[_PSConstants inCallCollaborationHeuristicReason];
      v67 = (objc_class *)objc_opt_class();
      v63 = NSStringFromClass(v67);
      LOBYTE(v72) = 0;
      uint64_t v64 = [(_PSSuggestionProxy *)v66 initWithBundleID:v60 interactionRecipients:v87 contactID:v22 handles:v15 reason:v61 reasonType:v63 useGroupsWhenFindingRecipient:v72 groupName:v84 image:v36];
      goto LABEL_64;
    }
LABEL_65:
    long long v68 = 0;
    goto LABEL_66;
  }
  uint64_t v57 = [(_PSSuggestionProxy *)v53 initWithBundleID:v88 interactionRecipients:0 handles:v15 reason:v54 reasonType:v56];

  v58 = +[_PSLogging heuristicsChannel];
  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG)) {
    -[_PSHeuristics inPhoneCallHeuristicSuggestionProxiesWithBundleIds:predictionContext:]((uint64_t)v15, (uint64_t)v57, v58);
  }

  id v8 = v81;
  [v81 addObject:v57];
  if (![v85 isCollaborationAvailable]) {
    goto LABEL_65;
  }
  v59 = [_PSSuggestionProxy alloc];
  v60 = +[_PSConstants collaborationSuggestionBundleId];
  v61 = +[_PSConstants inCallCollaborationHeuristicReason];
  v62 = (objc_class *)objc_opt_class();
  v63 = NSStringFromClass(v62);
  uint64_t v64 = [(_PSSuggestionProxy *)v59 initWithBundleID:v60 interactionRecipients:0 handles:v15 reason:v61 reasonType:v63];
LABEL_64:
  long long v68 = (void *)v64;

  id v8 = v81;
LABEL_66:

  if (v68) {
    [v8 addObject:v68];
  }
  long long v69 = +[_PSLogging heuristicsChannel];
  id v5 = v77;
  if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138478595;
    v90 = v82;
    __int16 v91 = 2113;
    id v92 = v15;
    __int16 v93 = 2113;
    uint64_t v94 = (uint64_t)v87;
    __int16 v95 = 2113;
    uint64_t v96 = (uint64_t)v88;
    _os_log_impl(&dword_1A314B000, v69, OS_LOG_TYPE_INFO, "Active call donation, contactsIds: %{private}@, handles: %{private}@, interactionRecipients: %{private}@, bundleId: %{private}@", buf, 0x2Au);
  }

  id v18 = v8;
  id v6 = v85;
  id v10 = v75;
  id v9 = v76;
LABEL_71:

  return v18;
}

+ (id)templateForPhoneCallHeuristicFromSuggestionProxy:(id)a3
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v6 = [v3 interactionRecipients];
  id v7 = v6;
  if (v6)
  {
    id v31 = v6;
  }
  else
  {
    id v8 = [MEMORY[0x1E4F29128] UUID];
    id v31 = [v8 UUIDString];
  }
  uint64_t v9 = [v3 contactID];
  if (v9)
  {
    id v10 = (void *)v9;
    id v11 = [v3 handle];

    if (v11)
    {
      id v12 = [v3 contactID];
      v40[0] = v12;
      v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:1];

      id v13 = [v3 contactID];
      uint64_t v38 = v13;
      id v14 = [v3 handle];
      id v39 = v14;
      id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v39 forKeys:&v38 count:1];

      goto LABEL_9;
    }
  }
  else
  {
    id v11 = 0;
  }
  v30 = 0;
LABEL_9:
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v15 = [v3 handles];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v34 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        if ([v20 containsString:@"@"]) {
          id v21 = v5;
        }
        else {
          id v21 = v4;
        }
        [v21 addObject:v20];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v17);
  }

  uint64_t v22 = [_PSSuggestionTemplate alloc];
  id v23 = [v3 bundleID];
  id v24 = [v3 image];
  id v25 = [v3 groupName];
  v26 = [v3 reason];
  uint64_t v27 = NSStringFromClass((Class)a1);
  id v29 = [(_PSSuggestionTemplate *)v22 initWithBundleID:v23 interactionRecipients:v31 image:v24 groupName:v25 recipientContactIDs:v30 recipientEmailAddresses:v5 recipientPhoneNumbers:v4 recipientDisplayNames:0 contactIdToHandleMapping:v11 reason:v26 reasonType:v27];

  return v29;
}

+ (id)PSHeuristicsRecencyReasonToString:(int64_t)a3
{
  if ((unint64_t)a3 > 2) {
    return 0;
  }
  else {
    return off_1E5AE0398[a3];
  }
}

- (id)proxiesByRecencyUsingInteractions:(id)a3 startIndex:(unint64_t)a4 reason:(int64_t)a5 allowNonSupportedBundleIDs:(BOOL)a6
{
  id v10 = a3;
  id v11 = [(_PSHeuristics *)self recencyHeuristicLimitNumberOfProxiesByReason];
  id v12 = [NSNumber numberWithInteger:a5];
  id v13 = [v11 objectForKeyedSubscript:v12];
  unint64_t v14 = [v13 integerValue];

  id v39 = +[_PSHeuristics PSHeuristicsRecencyReasonToString:a5];
  id v15 = [MEMORY[0x1E4F1CA70] orderedSet];
  uint64_t v16 = _PSShareSheetExtensionBundleIDToAppBundleIDMapping(a6);
  if ([v10 count] > a4)
  {
    uint64_t v38 = v16;
    do
    {
      if ([v15 count] >= v14) {
        break;
      }
      uint64_t v17 = [v10 objectAtIndexedSubscript:a4];
      uint64_t v18 = [v17 bundleId];
      if ([v17 mechanism] == 13)
      {
        uint64_t v19 = [v17 targetBundleId];

        if (v19)
        {
          uint64_t v20 = [v17 targetBundleId];

          id v21 = [v17 targetBundleId];
          uint64_t v22 = [v16 objectForKey:v21];

          if (v22)
          {
            id v23 = [v17 targetBundleId];
            uint64_t v18 = [v16 objectForKeyedSubscript:v23];
          }
          else
          {
            uint64_t v18 = v20;
          }
        }
      }
      id v24 = +[_PSConstants mobileMessagesBundleId];
      int v25 = [v18 isEqualToString:v24];

      if (v25)
      {
        v26 = [_PSSuggestionProxy alloc];
        uint64_t v27 = [v17 domainIdentifier];
        id v28 = (objc_class *)objc_opt_class();
        id v29 = NSStringFromClass(v28);
        v30 = [(_PSSuggestionProxy *)v26 initWithBundleID:v18 interactionRecipients:v27 contactID:0 reason:v39 reasonType:v29];

        uint64_t v16 = v38;
        if (v30) {
          goto LABEL_11;
        }
      }
      else
      {
        id v31 = [v17 derivedIntentIdentifier];

        if (!v31) {
          goto LABEL_13;
        }
        id v32 = [_PSSuggestionProxy alloc];
        long long v33 = [v17 derivedIntentIdentifier];
        long long v34 = (objc_class *)objc_opt_class();
        long long v35 = NSStringFromClass(v34);
        v30 = [(_PSSuggestionProxy *)v32 initWithBundleID:v18 interactionRecipients:v33 contactID:0 reason:v39 reasonType:v35];

        uint64_t v16 = v38;
        if (v30) {
LABEL_11:
        }
          [v15 addObject:v30];
      }

LABEL_13:
      ++a4;
    }
    while (a4 < [v10 count]);
  }
  long long v36 = [v15 array];

  return v36;
}

- (id)returnDocumentToSender:(id)a3
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v44 = a3;
  id v3 = [v44 attachments];
  id v45 = objc_opt_new();
  uint64_t v59 = 0;
  v60 = &v59;
  uint64_t v61 = 0x2050000000;
  id v4 = (void *)getSYDocumentWorkflowsClientClass_softClass;
  uint64_t v62 = getSYDocumentWorkflowsClientClass_softClass;
  if (!getSYDocumentWorkflowsClientClass_softClass)
  {
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    v65 = __getSYDocumentWorkflowsClientClass_block_invoke;
    v66 = &unk_1E5ADE858;
    v67 = &v59;
    SynapseLibraryCore();
    Class Class = objc_getClass("SYDocumentWorkflowsClient");
    *(void *)(v67[1] + 24) = Class;
    getSYDocumentWorkflowsClientClass_softClass Class = *(void *)(v67[1] + 24);
    id v4 = (void *)v60[3];
  }
  id v6 = v4;
  _Block_object_dispose(&v59, 8);
  id v49 = objc_alloc_init(v6);
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id obj = v3;
  uint64_t v52 = [obj countByEnumeratingWithState:&v55 objects:v63 count:16];
  if (v52)
  {
    uint64_t v51 = *(void *)v56;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v56 != v51) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v55 + 1) + 8 * v7);
        uint64_t v9 = [v8 contentURL];
        if (!v9) {
          goto LABEL_26;
        }
        id v10 = [v8 contentURL];
        if (([v10 isFileURL] & 1) == 0)
        {

LABEL_26:
          uint64_t v18 = +[_PSLogging heuristicsChannel];
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
            [(_PSHeuristics *)&v53 returnDocumentToSender:v18];
          }
          goto LABEL_28;
        }
        id v11 = [v8 contentURLSandboxExtension];
        BOOL v12 = v11 == 0;

        if (v12) {
          goto LABEL_26;
        }
        id v13 = [v8 contentURLSandboxExtension];
        [v13 bytes];
        sandbox_extension_consume();

        uint64_t v59 = 0;
        v60 = &v59;
        uint64_t v61 = 0x2050000000;
        unint64_t v14 = (void *)getSYDocumentAttributesClass_softClass;
        uint64_t v62 = getSYDocumentAttributesClass_softClass;
        if (!getSYDocumentAttributesClass_softClass)
        {
          *(void *)&long long buf = MEMORY[0x1E4F143A8];
          *((void *)&buf + 1) = 3221225472;
          v65 = __getSYDocumentAttributesClass_block_invoke;
          v66 = &unk_1E5ADE858;
          v67 = &v59;
          SynapseLibraryCore();
          Class v15 = objc_getClass("SYDocumentAttributes");
          *(void *)(v67[1] + 24) = v15;
          getSYDocumentAttributesClass_softClass Class = *(void *)(v67[1] + 24);
          unint64_t v14 = (void *)v60[3];
        }
        id v16 = v14;
        _Block_object_dispose(&v59, 8);
        uint64_t v17 = [v8 contentURL];
        uint64_t v18 = [v16 documentAttributesForFileAtURL:v17];

        uint64_t v19 = [v18 sender];
        uint64_t v20 = [v19 handle];

        if (!v20) {
          goto LABEL_24;
        }
        id v21 = +[_PSLogging heuristicsChannel];
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_1A314B000, v21, OS_LOG_TYPE_INFO, "Non-nil attributes fetched from Synapse", (uint8_t *)&buf, 2u);
        }

        uint64_t v59 = 0;
        v60 = &v59;
        uint64_t v61 = 0x2050000000;
        uint64_t v22 = (void *)getSYReturnToDocumentRequestClass_softClass;
        uint64_t v62 = getSYReturnToDocumentRequestClass_softClass;
        if (!getSYReturnToDocumentRequestClass_softClass)
        {
          *(void *)&long long buf = MEMORY[0x1E4F143A8];
          *((void *)&buf + 1) = 3221225472;
          v65 = __getSYReturnToDocumentRequestClass_block_invoke;
          v66 = &unk_1E5ADE858;
          v67 = &v59;
          SynapseLibraryCore();
          Class v23 = objc_getClass("SYReturnToDocumentRequest");
          *(void *)(v67[1] + 24) = v23;
          getSYReturnToDocumentRequestClass_softClass Class = *(void *)(v67[1] + 24);
          uint64_t v22 = (void *)v60[3];
        }
        id v24 = v22;
        _Block_object_dispose(&v59, 8);
        id v25 = objc_alloc_init(v24);
        [v25 setDocumentAttributes:v18];
        SEL v26 = NSSelectorFromString(&cfstr_Canperformrequ.isa);
        char v27 = objc_opt_respondsToSelector();
        id v28 = +[_PSLogging heuristicsChannel];
        BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_INFO);
        if (v27)
        {
          if (v29)
          {
            LOWORD(buf) = 0;
            _os_log_impl(&dword_1A314B000, v28, OS_LOG_TYPE_INFO, "Can perform request is available from Synapse", (uint8_t *)&buf, 2u);
          }

          if (((uint64_t (*)(id, SEL, id, void))[v49 methodForSelector:v26])(v49, v26, v25, 0))
          {
            char v48 = [v18 sender];
            v30 = [_PSSuggestionProxy alloc];
            uint64_t v46 = [v18 sourceBundleIdentifier];
            id v31 = (void *)MEMORY[0x1E4F5B3D8];
            v47 = [v48 handle];
            id v32 = [v31 generateConversationIdFromHandle:v47];
            long long v33 = [v48 handle];
            long long v34 = +[_PSConstants returnToSenderReason];
            long long v35 = (objc_class *)objc_opt_class();
            long long v36 = NSStringFromClass(v35);
            id v37 = [v48 preferredFormattedName];
            uint64_t v38 = [(_PSSuggestionProxy *)v30 initWithBundleID:v46 interactionRecipients:v32 contactID:0 handle:v33 reason:v34 reasonType:v36 groupName:v37 image:0];

            if (v38)
            {
              [v45 addObject:v38];
            }
LABEL_24:
            sandbox_extension_release();
            goto LABEL_28;
          }
        }
        else
        {
          if (v29)
          {
            LOWORD(buf) = 0;
            _os_log_impl(&dword_1A314B000, v28, OS_LOG_TYPE_INFO, "Synapse SPI not available", (uint8_t *)&buf, 2u);
          }
        }
        id v39 = +[_PSLogging heuristicsChannel];
        if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
        {
          uint64_t v40 = [v8 contentURL];
          LODWORD(buf) = 138477827;
          *(void *)((char *)&buf + 4) = v40;
          _os_log_impl(&dword_1A314B000, v39, OS_LOG_TYPE_INFO, "Synapse could not perform request for %{private}@", (uint8_t *)&buf, 0xCu);
        }
LABEL_28:

        ++v7;
      }
      while (v52 != v7);
      uint64_t v41 = [obj countByEnumeratingWithState:&v55 objects:v63 count:16];
      uint64_t v52 = v41;
    }
    while (v41);
  }

  if ((unint64_t)[v45 count] <= 1) {
    id v42 = v45;
  }
  else {
    id v42 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v42;
}

- (id)hourOfDayProbabilitiesToInteractWithContacts:(id)a3
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  context = (void *)MEMORY[0x1A6243860]();
  objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  id v52 = (id)objc_claimAutoreleasedReturnValue();
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  id obj = v3;
  uint64_t v55 = [obj countByEnumeratingWithState:&v80 objects:v88 count:16];
  if (v55)
  {
    uint64_t v53 = *(void *)v81;
    unint64_t v4 = 0x1E4F1C000uLL;
    do
    {
      for (uint64_t i = 0; i != v55; ++i)
      {
        if (*(void *)v81 != v53) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v80 + 1) + 8 * i);
        uint64_t v7 = [v6 identifier];
        if (v7)
        {
          uint64_t v61 = i;
          id v8 = [*(id *)(v4 + 2632) array];
          uint64_t v9 = [v6 emailAddresses];
          long long v76 = 0u;
          long long v77 = 0u;
          long long v78 = 0u;
          long long v79 = 0u;
          uint64_t v10 = [v9 countByEnumeratingWithState:&v76 objects:v87 count:16];
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v12 = *(void *)v77;
            do
            {
              for (uint64_t j = 0; j != v11; ++j)
              {
                if (*(void *)v77 != v12) {
                  objc_enumerationMutation(v9);
                }
                unint64_t v14 = [*(id *)(*((void *)&v76 + 1) + 8 * j) value];
                if ([v14 length]) {
                  [v8 addObject:v14];
                }
              }
              uint64_t v11 = [v9 countByEnumeratingWithState:&v76 objects:v87 count:16];
            }
            while (v11);
          }
          Class v15 = [*(id *)(v4 + 2632) array];
          id v16 = [v6 phoneNumbers];
          long long v72 = 0u;
          long long v73 = 0u;
          long long v74 = 0u;
          long long v75 = 0u;
          id v62 = v16;
          uint64_t v17 = [v16 countByEnumeratingWithState:&v72 objects:v86 count:16];
          if (v17)
          {
            uint64_t v18 = v17;
            uint64_t v19 = *(void *)v73;
            do
            {
              for (uint64_t k = 0; k != v18; ++k)
              {
                if (*(void *)v73 != v19) {
                  objc_enumerationMutation(v62);
                }
                id v21 = [*(id *)(*((void *)&v72 + 1) + 8 * k) value];
                uint64_t v22 = [v21 unformattedInternationalStringValue];

                if ([v22 length]) {
                  [v15 addObject:v22];
                }
              }
              uint64_t v18 = [v62 countByEnumeratingWithState:&v72 objects:v86 count:16];
            }
            while (v18);
          }
          long long v57 = v15;
          long long v58 = v9;
          uint64_t v59 = v8;
          v60 = v7;
          uint64_t v23 = [v15 arrayByAddingObjectsFromArray:v8];
          id v24 = [(_PSHeuristics *)self interactionStore];
          long long v56 = (void *)v23;
          id v25 = +[_PSInteractionStoreUtils interactionsMatchingAnyHandlesOrDomainIds:v23 account:0 directions:&unk_1EF6762C0 mechanisms:0 bundleIds:0 store:v24 fetchLimit:2000];

          SEL v26 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:24];
          unint64_t v54 = [v25 count];
          char v27 = [MEMORY[0x1E4F1C9A8] currentCalendar];
          long long v68 = 0u;
          long long v69 = 0u;
          long long v70 = 0u;
          long long v71 = 0u;
          id v63 = v25;
          uint64_t v28 = [v63 countByEnumeratingWithState:&v68 objects:v85 count:16];
          if (v28)
          {
            uint64_t v29 = v28;
            uint64_t v30 = *(void *)v69;
            do
            {
              for (uint64_t m = 0; m != v29; ++m)
              {
                if (*(void *)v69 != v30) {
                  objc_enumerationMutation(v63);
                }
                id v32 = [*(id *)(*((void *)&v68 + 1) + 8 * m) startDate];
                long long v33 = [v27 components:32 fromDate:v32];

                long long v34 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v33, "hour"));
                long long v35 = NSNumber;
                long long v36 = [v26 objectForKeyedSubscript:v34];
                id v37 = objc_msgSend(v35, "numberWithInteger:", objc_msgSend(v36, "integerValue") + 1);
                [v26 setObject:v37 forKeyedSubscript:v34];
              }
              uint64_t v29 = [v63 countByEnumeratingWithState:&v68 objects:v85 count:16];
            }
            while (v29);
          }

          uint64_t v38 = (void *)[v26 mutableCopy];
          long long v64 = 0u;
          long long v65 = 0u;
          long long v66 = 0u;
          long long v67 = 0u;
          id v39 = v26;
          uint64_t v40 = [v39 countByEnumeratingWithState:&v64 objects:v84 count:16];
          if (v40)
          {
            uint64_t v41 = v40;
            uint64_t v42 = *(void *)v65;
            do
            {
              for (uint64_t n = 0; n != v41; ++n)
              {
                if (*(void *)v65 != v42) {
                  objc_enumerationMutation(v39);
                }
                uint64_t v44 = *(void *)(*((void *)&v64 + 1) + 8 * n);
                id v45 = NSNumber;
                uint64_t v46 = [v38 objectForKeyedSubscript:v44];
                v47 = objc_msgSend(v45, "numberWithDouble:", (double)objc_msgSend(v46, "integerValue") / (double)v54);
                [v38 setObject:v47 forKeyedSubscript:v44];
              }
              uint64_t v41 = [v39 countByEnumeratingWithState:&v64 objects:v84 count:16];
            }
            while (v41);
          }

          uint64_t v7 = v60;
          [v52 setObject:v38 forKeyedSubscript:v60];

          unint64_t v4 = 0x1E4F1C000;
          uint64_t i = v61;
        }
      }
      uint64_t v55 = [obj countByEnumeratingWithState:&v80 objects:v88 count:16];
    }
    while (v55);
  }

  return v52;
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

- (_CDInteractionCache)messageInteractionCache
{
  return self->_messageInteractionCache;
}

- (_CDInteractionCache)recencyCache
{
  return self->_recencyCache;
}

- (void)setRecencyCache:(id)a3
{
}

- (double)recencyMargin
{
  return self->_recencyMargin;
}

- (void)setRecencyMargin:(double)a3
{
  self->_recencyMargiuint64_t n = a3;
}

- (NSDictionary)recencyHeuristicLimitNumberOfProxiesByReason
{
  return self->_recencyHeuristicLimitNumberOfProxiesByReason;
}

- (void)setRecencyHeuristicLimitNumberOfProxiesByReason:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recencyHeuristicLimitNumberOfProxiesByReason, 0);
  objc_storeStrong((id *)&self->_recencyCache, 0);
  objc_storeStrong((id *)&self->_messageInteractionCache, 0);
  objc_storeStrong((id *)&self->_contactResolver, 0);
  objc_storeStrong((id *)&self->_interactionStore, 0);

  objc_storeStrong((id *)&self->_knowledgeStore, 0);
}

- (void)updateModelProperties:(void *)a1 .cold.1(void *a1)
{
  v1 = NSNumber;
  [a1 recencyMargin];
  v2 = objc_msgSend(v1, "numberWithDouble:");
  OUTLINED_FUNCTION_4_0(&dword_1A314B000, v3, v4, "Recency margin: %@.", v5, v6, v7, v8, 2u);
}

- (void)seedSuggestionsForChatGuidsAndTransports:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A314B000, log, OS_LOG_TYPE_ERROR, "chatGuidsAndTransports is not of type NSArray as expected", v1, 2u);
}

- (void)hyperRecentHeuristicSuggestionProxiesWithReferenceDate:(os_log_t)log predictionContextBundleId:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A314B000, log, OS_LOG_TYPE_DEBUG, "No recent interactions for hyper-recency heuristic.", v1, 2u);
}

- (void)inPhoneCallHeuristicSuggestionProxiesWithBundleIds:(os_log_t)log predictionContext:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_1A314B000, log, OS_LOG_TYPE_DEBUG, "handleList: %@, PSSuggestionProxy:%@", (uint8_t *)&v3, 0x16u);
}

- (void)returnDocumentToSender:(os_log_t)log .cold.1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *long long buf = 0;
  *a2 = 0;
  _os_log_debug_impl(&dword_1A314B000, log, OS_LOG_TYPE_DEBUG, "Attachment is not valid for Synapse processing", buf, 2u);
}

@end
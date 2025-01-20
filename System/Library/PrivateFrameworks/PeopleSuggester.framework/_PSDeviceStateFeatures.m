@interface _PSDeviceStateFeatures
+ (id)isInCallWithCandidates:(id)a3 facetimeRequest:(BOOL)a4 caches:(id)a5 store:(id)a6;
+ (id)isInMeetingWithCandidates:(id)a3 caches:(id)a4;
@end

@implementation _PSDeviceStateFeatures

+ (id)isInCallWithCandidates:(id)a3 facetimeRequest:(BOOL)a4 caches:(id)a5 store:(id)a6
{
  v84[1] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v62 = a6;
  v9 = [MEMORY[0x1E4F5B6A8] userContext];
  v10 = [MEMORY[0x1E4F5B6B8] keyPathForActiveCall];
  v11 = [v9 objectForKeyedSubscript:v10];
  if (!v11)
  {
    v21 = +[_PSCandidate selfCandidate];
    v83 = v21;
    id v22 = objc_alloc(MEMORY[0x1E4F4FEE8]);
    v13 = (void *)[v22 initWithIntValue:0 doubleValue:0 stringValue:0 BOOLValue:MEMORY[0x1E4F1CC28] timeBucketValue:0];
    v84[0] = v13;
    v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v84 forKeys:&v83 count:1];
    goto LABEL_64;
  }
  v12 = [MEMORY[0x1E4F5B6B8] calleeContactIDsKey];
  v13 = [v11 valueForKey:v12];

  v14 = [MEMORY[0x1E4F5B6B8] calleeHandlesKey];
  v15 = [v11 valueForKey:v14];

  v16 = [MEMORY[0x1E4F5B6B8] bundleIDKey];
  uint64_t v17 = [v11 valueForKey:v16];

  if (v17)
  {
    uint64_t v82 = v17;
    [MEMORY[0x1E4F1C978] arrayWithObjects:&v82 count:1];
  }
  v56 = (void *)v17;
  v18 = &off_1E5ADE000;
  if (v13 && [v13 count] == 1)
  {
    v19 = +[_PSLogging featureGenerationChannel];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A314B000, v19, OS_LOG_TYPE_INFO, "Found a donation in the context store on an active call where calleeContactIDsKey is set", buf, 2u);
    }

    v61 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v13];
  }
  else
  {
    v61 = 0;
  }
  if ([v15 count] == 1) {
    id v20 = v15;
  }
  else {
    id v20 = 0;
  }
  v59 = v15;
  v60 = v20;
  v57 = v13;
  id v58 = v8;
  if (__PAIR128__((unint64_t)v61, (unint64_t)v20) != 0)
  {
    long long v72 = 0u;
    long long v73 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    id v24 = v8;
    uint64_t v25 = [v24 countByEnumeratingWithState:&v70 objects:v81 count:16];
    if (v25)
    {
      v52 = v10;
      v26 = 0;
      uint64_t v27 = *(void *)v71;
      while (2)
      {
        uint64_t v28 = 0;
        v29 = v26;
        do
        {
          if (*(void *)v71 != v27) {
            objc_enumerationMutation(v24);
          }
          v26 = +[_PSInteractionStoreUtils interactionsMatchingAnyHandlesOrContactIds:v60 identifiers:v61 account:0 directions:&unk_1EF676020 mechanisms:&unk_1EF676038 bundleIds:0 store:v62 fetchLimit:1 messageInteractionCache:*(void *)(*((void *)&v70 + 1) + 8 * v28)];

          if (v26 && [v26 count])
          {

            goto LABEL_28;
          }
          ++v28;
          v29 = v26;
        }
        while (v25 != v28);
        uint64_t v25 = [v24 countByEnumeratingWithState:&v70 objects:v81 count:16];
        if (v25) {
          continue;
        }
        break;
      }

      if (!v26)
      {
        id v8 = v58;
        v10 = v52;
        goto LABEL_35;
      }
LABEL_28:
      id v8 = v58;
      if (![v26 count])
      {
        v10 = v52;
        goto LABEL_35;
      }
      v30 = +[_PSLogging featureGenerationChannel];
      v10 = v52;
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A314B000, v30, OS_LOG_TYPE_INFO, "Could not find matching interaction in caches, falling back to interaction store", buf, 2u);
      }

      uint64_t v25 = +[_PSInteractionStoreUtils interactionsMatchingAnyHandlesOrContactIds:v60 identifiers:v61 account:0 directions:&unk_1EF676050 mechanisms:&unk_1EF676068 bundleIds:0 store:v62 fetchLimit:1 messageInteractionCache:0];
    }
    else
    {
      v26 = v24;
    }

    v26 = (void *)v25;
LABEL_35:
    v31 = [v26 firstObject];
    if (v31)
    {
      v21 = +[_PSInteractionStoreUtils conversationIdFromInteraction:v31 bundleIds:0];
    }
    else
    {
      v21 = 0;
    }

    v13 = v57;
    v18 = &off_1E5ADE000;
    goto LABEL_39;
  }
  v21 = 0;
LABEL_39:
  if ((unint64_t)[v15 count] >= 2)
  {
    BOOL v54 = a4;
    v55 = v11;
    v53 = v10;
    v32 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v15];
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    id v33 = v8;
    uint64_t v34 = [v33 countByEnumeratingWithState:&v66 objects:v80 count:16];
    if (v34)
    {
      uint64_t v35 = v34;
      v36 = v9;
      v37 = 0;
      uint64_t v38 = *(void *)v67;
LABEL_42:
      uint64_t v39 = 0;
      v40 = v37;
      while (1)
      {
        if (*(void *)v67 != v38) {
          objc_enumerationMutation(v33);
        }
        v37 = +[_PSInteractionStoreUtils conversationIdWithExactMatchWithContactHandles:v32 store:v62 bundleIds:0 messageInteractionCache:*(void *)(*((void *)&v66 + 1) + 8 * v39)];

        if ([v37 count]) {
          break;
        }
        ++v39;
        v40 = v37;
        if (v35 == v39)
        {
          uint64_t v35 = [v33 countByEnumeratingWithState:&v66 objects:v80 count:16];
          if (v35) {
            goto LABEL_42;
          }
          break;
        }
      }
    }
    else
    {
      v36 = v9;
      v37 = 0;
    }

    v9 = v36;
    if ([v37 count])
    {
      v41 = [v37 allValues];
      v42 = [v41 firstObject];

      v10 = v53;
      v11 = v55;
      v13 = v57;
      if ([v42 length])
      {
        id v43 = v42;

        v21 = v43;
      }
      v15 = v59;
    }
    else
    {
      v10 = v53;
      v11 = v55;
      v13 = v57;
      v15 = v59;
    }

    a4 = v54;
    v18 = &off_1E5ADE000;
  }
  v44 = objc_opt_new();
  v45 = [v18[172] featureGenerationChannel];
  BOOL v46 = os_log_type_enabled(&v45->super, OS_LOG_TYPE_INFO);
  if (v21)
  {
    if (v46)
    {
      *(_DWORD *)buf = 138478339;
      v75 = v15;
      __int16 v76 = 2113;
      v77 = v13;
      __int16 v78 = 2113;
      v79 = v21;
      _os_log_impl(&dword_1A314B000, &v45->super, OS_LOG_TYPE_INFO, "Resolved %{private}@ and %{private}@ to %{private}@", buf, 0x20u);
    }

    v47 = v56;
    v45 = [[_PSCandidate alloc] initWithDomainId:v21 derivedIntentId:v21 bundleId:v56 recipientsId:0];
    [v44 addObject:v45];
  }
  else
  {
    if (v46)
    {
      *(_DWORD *)buf = 138478083;
      v75 = v15;
      __int16 v76 = 2113;
      v77 = v13;
      _os_log_impl(&dword_1A314B000, &v45->super, OS_LOG_TYPE_INFO, "Could not resolve %{private}@ and %{private}@ to candidate identifier", buf, 0x16u);
    }
    v47 = v56;
  }

  v48 = [_PSFeatureDictionary alloc];
  v63[0] = MEMORY[0x1E4F143A8];
  v63[1] = 3221225472;
  v63[2] = __78___PSDeviceStateFeatures_isInCallWithCandidates_facetimeRequest_caches_store___block_invoke;
  v63[3] = &unk_1E5ADFF68;
  BOOL v65 = a4;
  id v64 = v47;
  id v49 = v47;
  v50 = objc_msgSend(v44, "_pas_mappedArrayWithTransform:", v63);
  v23 = [(_PSFeatureDictionary *)v48 initWithObjects:v50 forKeys:v44];

  id v8 = v58;
LABEL_64:

  return v23;
}

+ (id)isInMeetingWithCandidates:(id)a3 caches:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  v5 = [MEMORY[0x1E4F1C9C8] now];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  obuint64_t j = v4;
  uint64_t v26 = [obj countByEnumeratingWithState:&v32 objects:v39 count:16];
  if (!v26)
  {
    char v24 = 0;
    goto LABEL_28;
  }
  char v24 = 0;
  uint64_t v25 = *(void *)v33;
  do
  {
    for (uint64_t i = 0; i != v26; ++i)
    {
      if (*(void *)v33 != v25) {
        objc_enumerationMutation(obj);
      }
      v7 = *(void **)(*((void *)&v32 + 1) + 8 * i);
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v8 = [v7 interactions];
      uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v38 count:16];
      if (!v9) {
        goto LABEL_24;
      }
      uint64_t v10 = v9;
      uint64_t v27 = i;
      uint64_t v11 = *(void *)v29;
      while (2)
      {
        for (uint64_t j = 0; j != v10; ++j)
        {
          if (*(void *)v29 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v28 + 1) + 8 * j);
          v14 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v13, "mechanism"));
          if (![v14 isEqualToNumber:&unk_1EF6751F8]) {
            goto LABEL_17;
          }
          v15 = [v13 dateInterval];
          if (([v15 containsDate:v5] & 1) == 0)
          {

LABEL_17:
            continue;
          }
          if ([v13 selfParticipantStatus] == 2)
          {

LABEL_22:
            char v24 = 1;
            goto LABEL_23;
          }
          uint64_t v16 = [v13 selfParticipantStatus];

          if (v16 == 7) {
            goto LABEL_22;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v28 objects:v38 count:16];
        if (v10) {
          continue;
        }
        break;
      }
LABEL_23:
      uint64_t i = v27;
LABEL_24:
    }
    uint64_t v26 = [obj countByEnumeratingWithState:&v32 objects:v39 count:16];
  }
  while (v26);
LABEL_28:

  uint64_t v17 = +[_PSCandidate selfCandidate];
  v36 = v17;
  id v18 = objc_alloc(MEMORY[0x1E4F4FEE8]);
  v19 = [NSNumber numberWithBool:v24 & 1];
  id v20 = (void *)[v18 initWithIntValue:0 doubleValue:0 stringValue:0 BOOLValue:v19 timeBucketValue:0];
  v37 = v20;
  v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];

  return v21;
}

@end
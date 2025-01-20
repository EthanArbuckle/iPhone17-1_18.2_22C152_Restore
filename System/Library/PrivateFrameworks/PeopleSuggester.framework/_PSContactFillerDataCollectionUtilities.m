@interface _PSContactFillerDataCollectionUtilities
+ (BOOL)doesSuggestionProxyMatch:(id)a3 withInteraction:(id)a4;
+ (BOOL)doesTheRecipientsMatchInInteraction1:(id)a3 interaction2:(id)a4;
+ (BOOL)recipientPredictedCorrectlyByRule:(id)a3 interaction:(id)a4 bundleId:(id)a5;
+ (double)enforceOneSignificantFigureForDouble:(double)a3;
+ (id)calculateNormalizedCallingFrequencyForContactGivenContactIdPredicate:(id)a3 totalFrequency:(id)a4 numberOfDaysToLookBack:(int64_t)a5 timeOfShareInteraction:(id)a6 interactionStore:(id)a7 direction:(id)a8;
+ (id)calculateNormalizedShareFrequencyForContactGivenContactIdPredicate:(id)a3 totalFrequency:(id)a4 numberOfDaysToLookBack:(int64_t)a5 timeOfShareInteraction:(id)a6 interactionStore:(id)a7;
+ (id)calculateNormalizedTextingFrequencyForContactGivenContactIdPredicate:(id)a3 totalFrequency:(id)a4 numberOfDaysToLookBack:(int64_t)a5 timeOfShareInteraction:(id)a6 interactionStore:(id)a7 direction:(id)a8;
+ (id)filterRulesBasedOnInteractionGivenRuleList:(id)a3 interaction:(id)a4;
+ (id)getBehaviorRulesGivenContext:(id)a3 behaviorRetriever:(id)a4;
+ (id)getInteractionModelScoreForEvent:(id)a3 forInteractionRecipients:(id)a4;
+ (id)getInteractionModelScoreForSuggestions:(id)a3 forInteractionRecipients:(id)a4;
+ (id)getInteractionRecipientFromInteraction:(id)a3;
+ (id)getListOfContactsFromCashedMessagesInteraction:(id)a3 cashedShareInteractions:(id)a4;
+ (id)getListOfContactsInteractedInTheLastNumberOfDays:(int)a3 interactionStore:(id)a4 limit:(int)a5;
+ (id)initContactPropertyCache:(id)a3 timeOfShareInteraction:(id)a4 interactionStore:(id)a5;
+ (id)resolveUniqueContactIdGivenInteraction:(id)a3;
+ (int)calculateTimeBucketGivenInteraction:(id)a3 timeOfShareInteraction:(id)a4;
+ (int)calculateTimeSinceLastCallForContactGivenContactIdPredicate:(id)a3 direction:(id)a4 timeOfShareInteraction:(id)a5 interactionCache:(id)a6;
+ (int)calculateTimeSinceLastShareForContactGivenContactIdPredicate:(id)a3 timeOfShareInteraction:(id)a4 interactionCache:(id)a5;
+ (int)calculateTimeSinceLastTextForContactGivenContactIdPredicate:(id)a3 direction:(id)a4 timeOfShareInteraction:(id)a5 interactionCache:(id)a6;
+ (unsigned)contactFillerBucketedValue:(unint64_t)a3;
+ (unsigned)enforceOneSignificantFigureForSmallDouble:(double)a3;
+ (void)calculateNormContantsGivenInteractionStore:(id)a3 normConstants:(id)a4;
+ (void)extractFeaturesFromBehaviorRulesIntoPETMessage:(id)a3 behaviorRules:(id)a4 MLModelScores:(id)a5;
+ (void)extractFeaturesFromBehaviorRulesIntoPETMessage:(id)a3 behaviorRules:(id)a4 contextItems:(id)a5 ruleRankingModel:(id)a6;
+ (void)extractFrequencyRecencyFeaturesIntoPETMessage:(id)a3 recipientID:(id)a4 interaction:(id)a5 normConstants:(id)a6 numberOfDaysToLookBack:(int64_t)a7 interactionStore:(id)a8 timeOfShareInteraction:(id)a9 contactPropertyCache:(id)a10 interactionCache:(id)a11;
+ (void)extractUserFeaturesIntoPETMessage:(id)a3 normConstants:(id)a4 behaviorRetriever:(id)a5;
@end

@implementation _PSContactFillerDataCollectionUtilities

+ (id)resolveUniqueContactIdGivenInteraction:(id)a3
{
  id v3 = a3;
  v4 = [v3 targetBundleId];
  if ([v4 isEqualToString:@"com.apple.UIKit.activity.Message"])
  {

LABEL_4:
    uint64_t v7 = [v3 domainIdentifier];
LABEL_5:
    v8 = (void *)v7;
    goto LABEL_6;
  }
  v5 = [v3 bundleId];
  int v6 = [v5 isEqualToString:@"com.apple.MobileSMS"];

  if (v6) {
    goto LABEL_4;
  }
  v10 = [v3 bundleId];
  int v11 = [v10 isEqualToString:@"com.apple.mobilemail"];

  if (!v11 && ([v3 mechanism] == 13 || objc_msgSend(v3, "mechanism") == 4))
  {
    uint64_t v7 = [v3 derivedIntentIdentifier];
    goto LABEL_5;
  }
  v12 = (void *)MEMORY[0x1E4F5B3D8];
  v13 = [v3 recipients];
  v8 = [v12 generateConversationIdFromInteractionRecipients:v13];

LABEL_6:

  return v8;
}

+ (id)getListOfContactsFromCashedMessagesInteraction:(id)a3 cashedShareInteractions:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v22 = v5;
  v36[0] = v5;
  v36[1] = v6;
  id obj = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:2];
  uint64_t v25 = [obj countByEnumeratingWithState:&v31 objects:v37 count:16];
  v8 = 0;
  if (v25)
  {
    uint64_t v24 = *(void *)v32;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v32 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v26 = v9;
        v10 = *(void **)(*((void *)&v31 + 1) + 8 * v9);
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        id v11 = v10;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v27 objects:v35 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v28;
          do
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              v16 = v8;
              if (*(void *)v28 != v14) {
                objc_enumerationMutation(v11);
              }
              uint64_t v17 = *(void *)(*((void *)&v27 + 1) + 8 * i);
              v8 = +[_PSContactFillerDataCollectionUtilities resolveUniqueContactIdGivenInteraction:v17];

              if (v8)
              {
                v18 = [v7 objectForKey:v8];

                if (!v18)
                {
                  id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                  [v19 addObject:v17];
                  [v7 setObject:v19 forKey:v8];
                }
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v27 objects:v35 count:16];
          }
          while (v13);
        }

        uint64_t v9 = v26 + 1;
      }
      while (v26 + 1 != v25);
      uint64_t v25 = [obj countByEnumeratingWithState:&v31 objects:v37 count:16];
    }
    while (v25);
  }

  v20 = (void *)[v7 copy];

  return v20;
}

+ (id)getListOfContactsInteractedInTheLastNumberOfDays:(int)a3 interactionStore:(id)a4 limit:(int)a5
{
  v67[1] = *MEMORY[0x1E4F143B8];
  id v46 = a4;
  v42 = [MEMORY[0x1E4F1C9C8] date];
  id v7 = [v42 dateByAddingTimeInterval:(double)(-86400 * a3)];
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  int v45 = a5;
  if (a5 < 101)
  {
LABEL_24:
    v40 = (void *)[v8 copy];
  }
  else
  {
    uint64_t v9 = 0;
    int v10 = 100;
    v44 = v7;
    while (1)
    {
      int v47 = v10;
      uint64_t v53 = MEMORY[0x1A6243860]();
      id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v12 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(startDate > %@)", v7];
      [v11 addObject:v12];

      uint64_t v13 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(mechanism == %@)", &unk_1EF675228];
      [v11 addObject:v13];

      id v52 = v11;
      uint64_t v14 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v11];
      id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v16 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(startDate > %@)", v7];
      [v15 addObject:v16];

      uint64_t v17 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(direction IN %@)", &unk_1EF676080];
      [v15 addObject:v17];

      v18 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(mechanism IN %@)", &unk_1EF676098];
      [v15 addObject:v18];

      id v51 = v15;
      id v19 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v15];
      id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v55 = (void *)v14;
      [v20 addObject:v14];
      [v20 addObject:v19];
      uint64_t v21 = [MEMORY[0x1E4F28BA0] orPredicateWithSubpredicates:v20];
      v22 = [MEMORY[0x1E4F5B5D0] startDateSortDescriptorAscending:0];
      v67[0] = v22;
      v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v67 count:1];
      id v61 = 0;
      uint64_t v48 = v9;
      v56 = [v46 queryInteractionsUsingPredicate:v21 sortDescriptors:v23 limit:100 offset:v9 error:&v61];
      id v24 = v61;

      uint64_t v25 = +[_PSLogging feedbackChannel];
      uint64_t v26 = v25;
      v54 = v24;
      v49 = (void *)v21;
      v50 = v20;
      if (v24)
      {
        id v7 = v44;
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v66 = v24;
          _os_log_error_impl(&dword_1A314B000, v26, OS_LOG_TYPE_ERROR, "Unable to query interaction store: %@", buf, 0xCu);
        }
        long long v28 = v52;
        long long v27 = (void *)v53;
        long long v29 = v51;
        long long v30 = v55;
      }
      else
      {
        v43 = v19;
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
          +[_PSContactFillerDataCollectionUtilities getListOfContactsInteractedInTheLastNumberOfDays:interactionStore:limit:](v63, v56, &v64, v26);
        }

        long long v59 = 0u;
        long long v60 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        uint64_t v26 = v56;
        uint64_t v31 = [v26 countByEnumeratingWithState:&v57 objects:v62 count:16];
        long long v30 = v55;
        if (v31)
        {
          uint64_t v32 = v31;
          long long v33 = 0;
          uint64_t v34 = *(void *)v58;
          do
          {
            for (uint64_t i = 0; i != v32; ++i)
            {
              v36 = v33;
              if (*(void *)v58 != v34) {
                objc_enumerationMutation(v26);
              }
              uint64_t v37 = *(void *)(*((void *)&v57 + 1) + 8 * i);
              long long v33 = +[_PSContactFillerDataCollectionUtilities resolveUniqueContactIdGivenInteraction:v37];

              if (v33)
              {
                uint64_t v38 = [v8 objectForKey:v33];

                if (!v38)
                {
                  id v39 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                  [v39 addObject:v37];
                  [v8 setObject:v39 forKey:v33];
                }
              }
            }
            uint64_t v32 = [v26 countByEnumeratingWithState:&v57 objects:v62 count:16];
          }
          while (v32);

          id v7 = v44;
          long long v28 = v52;
          long long v27 = (void *)v53;
          long long v30 = v55;
        }
        else
        {
          id v7 = v44;
          long long v28 = v52;
          long long v27 = (void *)v53;
        }
        long long v29 = v51;
        id v19 = v43;
      }

      if (v54) {
        break;
      }
      uint64_t v9 = v48 + 100;
      int v10 = v47 + 100;
      if (v47 + 100 >= v45) {
        goto LABEL_24;
      }
    }

    v40 = 0;
  }

  return v40;
}

+ (id)getBehaviorRulesGivenContext:(id)a3 behaviorRetriever:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [getBMRetrievalFilterClass() filterWithOperand:1 inclusionOperator:0 items:v6];

  id v8 = [getBMItemTypeClass() interactionRecipients];
  uint64_t v9 = [getBMItemTypeClass() interactionTargetBundleID];
  int v10 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", v8, v9, 0);
  id v11 = [getBMRetrievalFilterClass() filterWithOperand:2 inclusionOperator:2 types:v10];
  uint64_t v12 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", v7, v11, 0);
  uint64_t v13 = [v5 retrieveRulesWithSupport:v12 confidence:0.0 filters:0.0];

  return v13;
}

+ (void)calculateNormContantsGivenInteractionStore:(id)a3 normConstants:(id)a4
{
  id v39 = a3;
  id v5 = (void *)MEMORY[0x1E4F28F60];
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  id v41 = a4;
  id v7 = [v6 setWithObjects:0];
  id v8 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", &unk_1EF675270, &unk_1EF675288, &unk_1EF675258, 0);
  v44 = [v5 predicateWithFormat:@"direction IN %@ && mechanism IN %@", v7, v8];

  uint64_t v9 = (void *)MEMORY[0x1E4F28F60];
  int v10 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", &unk_1EF675240, &unk_1EF675258, 0);
  id v11 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", &unk_1EF675270, &unk_1EF675288, &unk_1EF675258, 0);
  uint64_t v12 = [v9 predicateWithFormat:@"direction IN %@ && mechanism IN %@", v10, v11];

  v43 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"mechanism == %@", &unk_1EF675228];
  uint64_t v13 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v14 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", &unk_1EF6752A0, 0);
  id v15 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", &unk_1EF6752A0, &unk_1EF6752B8, &unk_1EF6752D0, &unk_1EF6752E8, &unk_1EF675300, 0);
  v42 = [v13 predicateWithFormat:@"direction IN %@ && mechanism IN %@", v14, v15];

  v16 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v17 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", &unk_1EF675240, &unk_1EF675258, 0);
  v18 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", &unk_1EF6752A0, &unk_1EF6752B8, &unk_1EF6752D0, &unk_1EF6752E8, &unk_1EF675300, 0);
  id v19 = [v16 predicateWithFormat:@"direction IN %@ && mechanism IN %@", v17, v18];

  id v49 = 0;
  uint64_t v40 = [v39 countInteractionsUsingPredicate:v12 error:&v49];
  id v20 = v49;
  if (v20)
  {
    uint64_t v21 = +[_PSLogging feedbackChannel];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      +[_PSContactFillerDataCollectionUtilities calculateNormContantsGivenInteractionStore:normConstants:].cold.5();
    }
  }
  id v48 = v20;
  uint64_t v22 = [v39 countInteractionsUsingPredicate:v44 error:&v48];
  id v23 = v48;

  if (v23)
  {
    id v24 = +[_PSLogging feedbackChannel];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      +[_PSContactFillerDataCollectionUtilities calculateNormContantsGivenInteractionStore:normConstants:].cold.4();
    }
  }
  id v47 = v23;
  uint64_t v25 = [v39 countInteractionsUsingPredicate:v43 error:&v47];
  id v26 = v47;

  if (v26)
  {
    long long v27 = +[_PSLogging feedbackChannel];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      +[_PSContactFillerDataCollectionUtilities calculateNormContantsGivenInteractionStore:normConstants:]();
    }
  }
  id v46 = v26;
  uint64_t v28 = [v39 countInteractionsUsingPredicate:v42 error:&v46];
  id v29 = v46;

  if (v29)
  {
    long long v30 = +[_PSLogging feedbackChannel];
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      +[_PSContactFillerDataCollectionUtilities calculateNormContantsGivenInteractionStore:normConstants:]();
    }
  }
  id v45 = v29;
  uint64_t v31 = [v39 countInteractionsUsingPredicate:v19 error:&v45];
  id v32 = v45;

  if (v32)
  {
    long long v33 = +[_PSLogging feedbackChannel];
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      +[_PSContactFillerDataCollectionUtilities calculateNormContantsGivenInteractionStore:normConstants:]();
    }
  }
  uint64_t v34 = [NSNumber numberWithUnsignedLong:v22];
  [v41 setIncomingTextTotal:v34];

  v35 = [NSNumber numberWithUnsignedLong:v40];
  [v41 setOutgoingTextTotal:v35];

  v36 = [NSNumber numberWithUnsignedLong:v25];
  [v41 setShareTotal:v36];

  uint64_t v37 = [NSNumber numberWithUnsignedLong:v28];
  [v41 setIncomingCallTotal:v37];

  uint64_t v38 = [NSNumber numberWithUnsignedLong:v31];
  [v41 setOutgoingCallTotal:v38];
}

+ (void)extractUserFeaturesIntoPETMessage:(id)a3 normConstants:(id)a4 behaviorRetriever:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v9 outgoingTextTotal];
  objc_msgSend(v8, "setTextInteractionsSent:", objc_msgSend(a1, "contactFillerBucketedValue:", objc_msgSend(v11, "unsignedLongValue")));

  uint64_t v12 = [v9 incomingTextTotal];
  objc_msgSend(v8, "setTextInteractionsReceived:", objc_msgSend(a1, "contactFillerBucketedValue:", objc_msgSend(v12, "unsignedLongValue")));

  id v26 = v9;
  uint64_t v13 = [v9 shareTotal];
  objc_msgSend(v8, "setShareInteractionsSent:", objc_msgSend(a1, "contactFillerBucketedValue:", objc_msgSend(v13, "unsignedLongValue")));

  uint64_t v25 = v10;
  uint64_t v14 = [v10 retrieveRulesWithFilters:0];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    unsigned int v17 = 0;
    unsigned int v18 = 0;
    unsigned int v19 = 0;
    uint64_t v20 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v28 != v20) {
          objc_enumerationMutation(v14);
        }
        uint64_t v22 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        [v22 confidence];
        if (v23 <= 0.75)
        {
          [v22 confidence];
          if (v24 <= 0.25) {
            ++v18;
          }
          else {
            ++v17;
          }
        }
        else
        {
          ++v19;
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v16);
  }
  else
  {
    unsigned int v17 = 0;
    unsigned int v18 = 0;
    unsigned int v19 = 0;
  }
  objc_msgSend(v8, "setLowConfidenceRuleCount:", objc_msgSend(a1, "contactFillerBucketedValue:", v18));
  objc_msgSend(v8, "setMediumConfidenceRuleCount:", objc_msgSend(a1, "contactFillerBucketedValue:", v17));
  objc_msgSend(v8, "setHighConfidenceRuleCount:", objc_msgSend(a1, "contactFillerBucketedValue:", v19));
}

+ (unsigned)contactFillerBucketedValue:(unint64_t)a3
{
  unsigned int result = a3;
  if (a3 > 0xA)
  {
    if (a3 > 0x64)
    {
      if (a3 > 0x3E7)
      {
        if (a3 >> 4 > 0x270) {
          return 10000;
        }
        __int16 v4 = (unsigned __int16)a3 / 0x3E8u;
        __int16 v5 = 1000;
      }
      else
      {
        __int16 v4 = (unsigned __int16)a3 / 0x64u;
        __int16 v5 = 100;
      }
      return a3 - (unsigned __int16)(a3 - v4 * v5);
    }
    return a3 - a3 % 0xAu;
  }
  return result;
}

+ (id)calculateNormalizedShareFrequencyForContactGivenContactIdPredicate:(id)a3 totalFrequency:(id)a4 numberOfDaysToLookBack:(int64_t)a5 timeOfShareInteraction:(id)a6 interactionStore:(id)a7
{
  id v11 = a4;
  if (a3)
  {
    double v12 = (double)(-86400 * a5);
    id v13 = a7;
    id v14 = a6;
    id v15 = a3;
    uint64_t v16 = [v14 dateByAddingTimeInterval:v12];
    id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    unsigned int v18 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(startDate >= %@)", v16];
    [v17 addObject:v18];

    unsigned int v19 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(startDate < %@)", v14];

    [v17 addObject:v19];
    uint64_t v20 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(direction IN %@)", &unk_1EF6760B0];
    [v17 addObject:v20];

    uint64_t v21 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(mechanism == %@)", &unk_1EF675228];
    [v17 addObject:v21];

    [v17 addObject:v15];
    uint64_t v22 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v17];
    id v31 = 0;
    unint64_t v23 = [v13 countInteractionsUsingPredicate:v22 error:&v31];

    id v24 = v31;
    if (v24)
    {
      uint64_t v25 = +[_PSLogging feedbackChannel];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        +[_PSContactFillerDataCollectionUtilities calculateNormContantsGivenInteractionStore:normConstants:]();
      }
    }
    [v11 doubleValue];
    if (v26 == 0.0)
    {
      double v28 = 0.0;
    }
    else
    {
      [v11 doubleValue];
      double v28 = (double)v23 / v27;
    }
    long long v29 = [NSNumber numberWithDouble:v28];
  }
  else
  {
    long long v29 = &unk_1EF675318;
  }

  return v29;
}

+ (id)calculateNormalizedTextingFrequencyForContactGivenContactIdPredicate:(id)a3 totalFrequency:(id)a4 numberOfDaysToLookBack:(int64_t)a5 timeOfShareInteraction:(id)a6 interactionStore:(id)a7 direction:(id)a8
{
  id v13 = a4;
  if (a3)
  {
    double v14 = (double)(-86400 * a5);
    id v15 = a8;
    id v16 = a7;
    id v17 = a6;
    id v18 = a3;
    unsigned int v19 = [v17 dateByAddingTimeInterval:v14];
    id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v21 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(startDate >= %@)", v19];
    [v20 addObject:v21];

    uint64_t v22 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(startDate < %@)", v17];

    [v20 addObject:v22];
    unint64_t v23 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(direction IN %@)", v15];

    [v20 addObject:v23];
    id v24 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(mechanism IN %@)", &unk_1EF6760C8];
    [v20 addObject:v24];

    [v20 addObject:v18];
    uint64_t v25 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v20];
    id v34 = 0;
    unint64_t v26 = [v16 countInteractionsUsingPredicate:v25 error:&v34];

    id v27 = v34;
    if (v27)
    {
      double v28 = +[_PSLogging feedbackChannel];
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        +[_PSContactFillerDataCollectionUtilities calculateNormalizedTextingFrequencyForContactGivenContactIdPredicate:totalFrequency:numberOfDaysToLookBack:timeOfShareInteraction:interactionStore:direction:]();
      }
    }
    [v13 doubleValue];
    if (v29 == 0.0)
    {
      double v31 = 0.0;
    }
    else
    {
      [v13 doubleValue];
      double v31 = (double)v26 / v30;
    }
    uint64_t v32 = [NSNumber numberWithDouble:v31];
  }
  else
  {
    uint64_t v32 = &unk_1EF675318;
  }

  return v32;
}

+ (id)calculateNormalizedCallingFrequencyForContactGivenContactIdPredicate:(id)a3 totalFrequency:(id)a4 numberOfDaysToLookBack:(int64_t)a5 timeOfShareInteraction:(id)a6 interactionStore:(id)a7 direction:(id)a8
{
  id v13 = a4;
  if (a3)
  {
    double v14 = (double)(-86400 * a5);
    id v15 = a8;
    id v16 = a7;
    id v17 = a6;
    id v18 = a3;
    unsigned int v19 = [v17 dateByAddingTimeInterval:v14];
    id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v21 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(startDate >= %@)", v19];
    [v20 addObject:v21];

    uint64_t v22 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(startDate < %@)", v17];

    [v20 addObject:v22];
    unint64_t v23 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(direction IN %@)", v15];

    [v20 addObject:v23];
    id v24 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(mechanism IN %@)", &unk_1EF6760E0];
    [v20 addObject:v24];

    [v20 addObject:v18];
    uint64_t v25 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v20];
    id v34 = 0;
    unint64_t v26 = [v16 countInteractionsUsingPredicate:v25 error:&v34];

    id v27 = v34;
    if (v27)
    {
      double v28 = +[_PSLogging feedbackChannel];
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        +[_PSContactFillerDataCollectionUtilities calculateNormalizedTextingFrequencyForContactGivenContactIdPredicate:totalFrequency:numberOfDaysToLookBack:timeOfShareInteraction:interactionStore:direction:]();
      }
    }
    [v13 doubleValue];
    if (v29 == 0.0)
    {
      double v31 = 0.0;
    }
    else
    {
      [v13 doubleValue];
      double v31 = (double)v26 / v30;
    }
    uint64_t v32 = [NSNumber numberWithDouble:v31];
  }
  else
  {
    uint64_t v32 = &unk_1EF675318;
  }

  return v32;
}

+ (int)calculateTimeSinceLastCallForContactGivenContactIdPredicate:(id)a3 direction:(id)a4 timeOfShareInteraction:(id)a5 interactionCache:(id)a6
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v9)
  {
    id v34 = v11;
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v35 = v10;
    double v14 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(direction IN %@)", v10];
    [v13 addObject:v14];

    id v15 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(mechanism IN %@)", &unk_1EF6760F8];
    [v13 addObject:v15];

    id v36 = v9;
    [v13 addObject:v9];
    uint64_t v16 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v13];
    id v33 = v12;
    id v17 = [v12 interactions];
    uint64_t v32 = (void *)v16;
    id v18 = [v17 filteredArrayUsingPredicate:v16];

    unsigned int v19 = [v18 firstObject];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v20 = v18;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v37 objects:v41 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v38 != v23) {
            objc_enumerationMutation(v20);
          }
          uint64_t v25 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          unint64_t v26 = [v25 startDate];
          id v27 = [v19 startDate];
          uint64_t v28 = [v26 compare:v27];

          if (v28 == 1)
          {
            id v29 = v25;

            unsigned int v19 = v29;
          }
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v37 objects:v41 count:16];
      }
      while (v22);
    }

    id v11 = v34;
    int v30 = +[_PSContactFillerDataCollectionUtilities calculateTimeBucketGivenInteraction:v19 timeOfShareInteraction:v34];

    id v10 = v35;
    id v9 = v36;
    id v12 = v33;
  }
  else
  {
    int v30 = 11;
  }

  return v30;
}

+ (int)calculateTimeBucketGivenInteraction:(id)a3 timeOfShareInteraction:(id)a4
{
  id v5 = a4;
  id v6 = [a3 endDate];
  [v5 timeIntervalSinceDate:v6];
  double v8 = v7;

  if (v8 < 120.0) {
    return 0;
  }
  if (v8 < 300.0) {
    return 1;
  }
  if (v8 < 600.0) {
    return 2;
  }
  if (v8 < 1800.0) {
    return 3;
  }
  if (v8 < 3600.0) {
    return 4;
  }
  if (v8 < 7200.0) {
    return 5;
  }
  if (v8 < 14400.0) {
    return 6;
  }
  if (v8 < 21600.0) {
    return 7;
  }
  if (v8 < 43200.0) {
    return 8;
  }
  if (v8 >= 86400.0) {
    return 10;
  }
  return 9;
}

+ (int)calculateTimeSinceLastShareForContactGivenContactIdPredicate:(id)a3 timeOfShareInteraction:(id)a4 interactionCache:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v7)
  {
    id v31 = v8;
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(direction IN %@)", &unk_1EF676110];
    [v10 addObject:v11];

    id v12 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(mechanism == %@)", &unk_1EF675228];
    [v10 addObject:v12];

    id v32 = v7;
    [v10 addObject:v7];
    uint64_t v13 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v10];
    id v30 = v9;
    double v14 = [v9 interactions];
    id v29 = (void *)v13;
    id v15 = [v14 filteredArrayUsingPredicate:v13];

    uint64_t v16 = [v15 firstObject];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v17 = v15;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v34 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          uint64_t v23 = [v22 startDate];
          id v24 = [v16 startDate];
          uint64_t v25 = [v23 compare:v24];

          if (v25 == 1)
          {
            id v26 = v22;

            uint64_t v16 = v26;
          }
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v19);
    }

    id v8 = v31;
    int v27 = +[_PSContactFillerDataCollectionUtilities calculateTimeBucketGivenInteraction:v16 timeOfShareInteraction:v31];

    id v7 = v32;
    id v9 = v30;
  }
  else
  {
    int v27 = 11;
  }

  return v27;
}

+ (int)calculateTimeSinceLastTextForContactGivenContactIdPredicate:(id)a3 direction:(id)a4 timeOfShareInteraction:(id)a5 interactionCache:(id)a6
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v9)
  {
    id v34 = v11;
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v35 = v10;
    double v14 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(direction IN %@)", v10];
    [v13 addObject:v14];

    id v15 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(mechanism IN %@)", &unk_1EF676128];
    [v13 addObject:v15];

    id v36 = v9;
    [v13 addObject:v9];
    uint64_t v16 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v13];
    id v33 = v12;
    id v17 = [v12 interactions];
    id v32 = (void *)v16;
    uint64_t v18 = [v17 filteredArrayUsingPredicate:v16];

    uint64_t v19 = [v18 firstObject];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v20 = v18;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v37 objects:v41 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v38 != v23) {
            objc_enumerationMutation(v20);
          }
          uint64_t v25 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          id v26 = [v25 startDate];
          int v27 = [v19 startDate];
          uint64_t v28 = [v26 compare:v27];

          if (v28 == 1)
          {
            id v29 = v25;

            uint64_t v19 = v29;
          }
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v37 objects:v41 count:16];
      }
      while (v22);
    }

    id v11 = v34;
    int v30 = +[_PSContactFillerDataCollectionUtilities calculateTimeBucketGivenInteraction:v19 timeOfShareInteraction:v34];

    id v10 = v35;
    id v9 = v36;
    id v12 = v33;
  }
  else
  {
    int v30 = 11;
  }

  return v30;
}

+ (id)filterRulesBasedOnInteractionGivenRuleList:(id)a3 interaction:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v22 = a4;
  id v6 = [getBMItemTypeClass() interactionTargetBundleID];
  id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = v5;
  uint64_t v23 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v23)
  {
    uint64_t v20 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v29 != v20) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        id v9 = objc_msgSend(v8, "consequent", v18);
        id v10 = (void *)[v9 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v10)
        {
          uint64_t v11 = *(void *)v25;
          while (2)
          {
            for (j = 0; j != v10; j = (char *)j + 1)
            {
              if (*(void *)v25 != v11) {
                objc_enumerationMutation(v9);
              }
              id v13 = *(void **)(*((void *)&v24 + 1) + 8 * (void)j);
              double v14 = [v13 type];
              int v15 = [v14 isEqual:v6];

              if (v15)
              {
                id v10 = [v13 value];
                goto LABEL_16;
              }
            }
            id v10 = (void *)[v9 countByEnumeratingWithState:&v24 objects:v32 count:16];
            if (v10) {
              continue;
            }
            break;
          }
        }
LABEL_16:

        if ([a1 recipientPredictedCorrectlyByRule:v8 interaction:v22 bundleId:v10]) {
          [v18 addObject:v8];
        }
      }
      uint64_t v23 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v23);
  }

  uint64_t v16 = (void *)[v18 copy];

  return v16;
}

+ (BOOL)recipientPredictedCorrectlyByRule:(id)a3 interaction:(id)a4 bundleId:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [a3 consequent];
  id v10 = [v9 objectsPassingTest:&__block_literal_global_17];
  uint64_t v11 = [v10 valueForKey:@"value"];

  LODWORD(v9) = [v8 isEqualToString:@"com.apple.MobileSMS"];
  if (v9)
  {
    uint64_t v12 = [v7 domainIdentifier];
LABEL_7:
    id v17 = (void *)v12;
    goto LABEL_8;
  }
  id v13 = [v7 bundleId];
  int v14 = [v13 isEqualToString:@"com.apple.mobilemail"];

  if (!v14)
  {
    uint64_t v12 = [v7 derivedIntentIdentifier];
    goto LABEL_7;
  }
  int v15 = (void *)MEMORY[0x1E4F5B3D8];
  uint64_t v16 = [v7 recipients];
  id v17 = [v15 generateConversationIdFromInteractionRecipients:v16];

  if (v17)
  {
LABEL_8:
    char v18 = [v11 containsObject:v17];
    goto LABEL_9;
  }
  char v18 = 0;
LABEL_9:

  return v18;
}

+ (void)extractFeaturesFromBehaviorRulesIntoPETMessage:(id)a3 behaviorRules:(id)a4 contextItems:(id)a5 ruleRankingModel:(id)a6
{
  id v9 = a6;
  id v10 = a4;
  id v11 = a3;
  uint64_t v12 = (void *)[a5 mutableCopy];
  id v13 = [v9 scoresOnRules:v10 contextItems:v12];

  +[_PSContactFillerDataCollectionUtilities extractFeaturesFromBehaviorRulesIntoPETMessage:v11 behaviorRules:v10 MLModelScores:v13];
}

+ (void)extractFeaturesFromBehaviorRulesIntoPETMessage:(id)a3 behaviorRules:(id)a4 MLModelScores:(id)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v35 = a5;
  id v9 = [[_PSContactFillerDataCollectionStatistics alloc] initWithList:v35];
  [(_PSContactFillerDataCollectionStatistics *)v9 avg];
  objc_msgSend(v7, "setAverageBehavioralRuleMLScore:");
  [(_PSContactFillerDataCollectionStatistics *)v9 max];
  objc_msgSend(v7, "setMaximumBehavioralRuleMLScore:");
  [(_PSContactFillerDataCollectionStatistics *)v9 min];
  objc_msgSend(v7, "setMinimumBehavioralRuleMLScore:");
  uint64_t v34 = v9;
  [(_PSContactFillerDataCollectionStatistics *)v9 stdev];
  id v36 = v7;
  objc_msgSend(v7, "setStdevBehavioralRuleMLScore:");
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v38 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v37 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v13 = v8;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v40 != v16) {
          objc_enumerationMutation(v13);
        }
        char v18 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        uint64_t v19 = NSNumber;
        [v18 confidence];
        uint64_t v20 = objc_msgSend(v19, "numberWithDouble:");
        [v10 addObject:v20];

        uint64_t v21 = NSNumber;
        [v18 conviction];
        id v22 = objc_msgSend(v21, "numberWithDouble:");
        [v11 addObject:v22];

        uint64_t v23 = NSNumber;
        [v18 rulePowerFactor];
        long long v24 = objc_msgSend(v23, "numberWithDouble:");
        [v38 addObject:v24];

        long long v25 = NSNumber;
        [v18 support];
        long long v26 = objc_msgSend(v25, "numberWithDouble:");
        [v37 addObject:v26];

        long long v27 = NSNumber;
        [v18 lift];
        long long v28 = objc_msgSend(v27, "numberWithDouble:");
        [v12 addObject:v28];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v39 objects:v43 count:16];
    }
    while (v15);
  }

  id v33 = [[_PSContactFillerDataCollectionStatistics alloc] initWithList:v10];
  [(_PSContactFillerDataCollectionStatistics *)v33 avg];
  objc_msgSend(v36, "setAverageBehavioralRuleConfidence:");
  [(_PSContactFillerDataCollectionStatistics *)v33 max];
  objc_msgSend(v36, "setMaximumBehavioralRuleConfidence:");
  [(_PSContactFillerDataCollectionStatistics *)v33 min];
  objc_msgSend(v36, "setMinimumBehavioralRuleConfidence:");
  [(_PSContactFillerDataCollectionStatistics *)v33 stdev];
  objc_msgSend(v36, "setStdevBehavioralRuleConfidence:");
  long long v29 = [[_PSContactFillerDataCollectionStatistics alloc] initWithList:v11];
  [(_PSContactFillerDataCollectionStatistics *)v29 avg];
  objc_msgSend(v36, "setAverageBehavioralRuleConviction:");
  [(_PSContactFillerDataCollectionStatistics *)v29 max];
  objc_msgSend(v36, "setMaximumBehavioralRuleConviction:");
  [(_PSContactFillerDataCollectionStatistics *)v29 min];
  objc_msgSend(v36, "setMinimumBehavioralRuleConviction:");
  [(_PSContactFillerDataCollectionStatistics *)v29 stdev];
  objc_msgSend(v36, "setStdevBehavioralRuleConviction:");
  long long v30 = [[_PSContactFillerDataCollectionStatistics alloc] initWithList:v12];
  [(_PSContactFillerDataCollectionStatistics *)v30 avg];
  objc_msgSend(v36, "setAverageBehavioralRuleLift:");
  [(_PSContactFillerDataCollectionStatistics *)v30 max];
  objc_msgSend(v36, "setMaximumBehavioralRuleLift:");
  [(_PSContactFillerDataCollectionStatistics *)v30 min];
  objc_msgSend(v36, "setMinimumBehavioralRuleLift:");
  [(_PSContactFillerDataCollectionStatistics *)v30 stdev];
  objc_msgSend(v36, "setStdevBehavioralRuleLift:");
  long long v31 = [[_PSContactFillerDataCollectionStatistics alloc] initWithList:v37];
  [(_PSContactFillerDataCollectionStatistics *)v31 avg];
  objc_msgSend(v36, "setAverageBehavioralRuleSupport:");
  [(_PSContactFillerDataCollectionStatistics *)v31 max];
  objc_msgSend(v36, "setMaximumBehavioralRuleSupport:");
  [(_PSContactFillerDataCollectionStatistics *)v31 min];
  objc_msgSend(v36, "setMinimumBehavioralRuleSupport:");
  [(_PSContactFillerDataCollectionStatistics *)v31 stdev];
  objc_msgSend(v36, "setStdevBehavioralRuleSupport:");
  id v32 = [[_PSContactFillerDataCollectionStatistics alloc] initWithList:v38];
  [(_PSContactFillerDataCollectionStatistics *)v32 avg];
  objc_msgSend(v36, "setAverageBehavioralRulePowerFactor:");
  [(_PSContactFillerDataCollectionStatistics *)v32 max];
  objc_msgSend(v36, "setMaximumBehavioralRulePowerFactor:");
  [(_PSContactFillerDataCollectionStatistics *)v32 min];
  objc_msgSend(v36, "setMinimumBehavioralRulePowerFactor:");
  [(_PSContactFillerDataCollectionStatistics *)v32 stdev];
  objc_msgSend(v36, "setStdevBehavioralRulePowerFactor:");
}

+ (double)enforceOneSignificantFigureForDouble:(double)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  [v4 setNumberStyle:1];
  id v5 = objc_msgSend(NSString, "stringWithFormat:", @"%.01f", *(void *)&a3);
  id v6 = [v4 numberFromString:v5];
  [v6 doubleValue];
  double v8 = v7;

  return v8;
}

+ (unsigned)enforceOneSignificantFigureForSmallDouble:(double)a3
{
  return +[_PSContactFillerDataCollectionUtilities contactFillerBucketedValue:(unint64_t)(a3 * 10000.0)];
}

+ (void)extractFrequencyRecencyFeaturesIntoPETMessage:(id)a3 recipientID:(id)a4 interaction:(id)a5 normConstants:(id)a6 numberOfDaysToLookBack:(int64_t)a7 interactionStore:(id)a8 timeOfShareInteraction:(id)a9 contactPropertyCache:(id)a10 interactionCache:(id)a11
{
  id v68 = a3;
  id v14 = a5;
  id v67 = a6;
  id v66 = a8;
  id v15 = a9;
  id v16 = a10;
  id v17 = a11;
  char v18 = +[_PSContactFillerDataCollectionUtilities resolveUniqueContactIdGivenInteraction:v14];
  uint64_t v19 = [v14 targetBundleId];
  if ([v19 isEqualToString:@"com.apple.UIKit.activity.Message"])
  {

LABEL_4:
    id v22 = @"domainIdentifier == %@";
LABEL_8:
    uint64_t v23 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", v22, v18);
    goto LABEL_9;
  }
  uint64_t v20 = [v14 bundleId];
  char v21 = [v20 isEqualToString:@"com.apple.MobileSMS"];

  if (v21) {
    goto LABEL_4;
  }
  if ([v14 mechanism] == 13 || objc_msgSend(v14, "mechanism") == 4)
  {
    id v22 = @"derivedIntentIdentifier == %@";
    goto LABEL_8;
  }
  uint64_t v23 = 0;
LABEL_9:
  long long v24 = [v16 objectForKeyedSubscript:@"normalizedShareFrequency"];
  long long v25 = [v24 valueForKey:v18];

  if (v25)
  {
    long long v26 = [v16 objectForKeyedSubscript:@"normalizedShareFrequency"];
    long long v27 = [v26 objectForKeyedSubscript:v18];
  }
  else
  {
    long long v28 = [v67 shareTotal];
    uint64_t v29 = +[_PSContactFillerDataCollectionUtilities calculateNormalizedShareFrequencyForContactGivenContactIdPredicate:v23 totalFrequency:v28 numberOfDaysToLookBack:a7 timeOfShareInteraction:v15 interactionStore:v66];

    long long v27 = (void *)v29;
    long long v26 = [v16 objectForKeyedSubscript:@"normalizedShareFrequency"];
    [v26 setValue:v27 forKey:v18];
  }

  v62 = v27;
  [v27 doubleValue];
  objc_msgSend(v68, "setNormalizedShareFrequency:", +[_PSContactFillerDataCollectionUtilities enforceOneSignificantFigureForSmallDouble:](_PSContactFillerDataCollectionUtilities, "enforceOneSignificantFigureForSmallDouble:"));
  long long v30 = [v16 objectForKeyedSubscript:@"normalizedIncomingTextFrequency"];
  long long v31 = [v30 valueForKey:v18];

  if (v31)
  {
    id v32 = [v16 objectForKeyedSubscript:@"normalizedIncomingTextFrequency"];
    id v33 = [v32 objectForKeyedSubscript:v18];
  }
  else
  {
    uint64_t v34 = [v67 incomingTextTotal];
    uint64_t v35 = +[_PSContactFillerDataCollectionUtilities calculateNormalizedTextingFrequencyForContactGivenContactIdPredicate:v23 totalFrequency:v34 numberOfDaysToLookBack:a7 timeOfShareInteraction:v15 interactionStore:v66 direction:&unk_1EF676140];

    id v33 = (void *)v35;
    id v32 = [v16 objectForKeyedSubscript:@"normalizedIncomingTextFrequency"];
    [v32 setValue:v33 forKey:v18];
  }

  id v61 = v33;
  [v33 doubleValue];
  objc_msgSend(v68, "setNormalizedIncomingTextFrequency:", +[_PSContactFillerDataCollectionUtilities enforceOneSignificantFigureForSmallDouble:](_PSContactFillerDataCollectionUtilities, "enforceOneSignificantFigureForSmallDouble:"));
  id v36 = [v16 objectForKeyedSubscript:@"normalizedOutgoingTextFrequency"];
  id v37 = [v36 valueForKey:v18];

  uint64_t v64 = v14;
  if (v37)
  {
    id v38 = [v16 objectForKeyedSubscript:@"normalizedOutgoingTextFrequency"];
    long long v39 = [v38 objectForKeyedSubscript:v18];
  }
  else
  {
    long long v40 = [v67 outgoingTextTotal];
    long long v39 = +[_PSContactFillerDataCollectionUtilities calculateNormalizedTextingFrequencyForContactGivenContactIdPredicate:v23 totalFrequency:v40 numberOfDaysToLookBack:a7 timeOfShareInteraction:v15 interactionStore:v66 direction:&unk_1EF676158];

    id v14 = v64;
    id v38 = [v16 objectForKeyedSubscript:@"normalizedOutgoingTextFrequency"];
    [v38 setValue:v39 forKey:v18];
  }

  [v39 doubleValue];
  objc_msgSend(v68, "setNormalizedOutgoingTextFrequency:", +[_PSContactFillerDataCollectionUtilities enforceOneSignificantFigureForSmallDouble:](_PSContactFillerDataCollectionUtilities, "enforceOneSignificantFigureForSmallDouble:"));
  objc_msgSend(v68, "setTimeSinceLastContactViaShare:", +[_PSContactFillerDataCollectionUtilities calculateTimeSinceLastShareForContactGivenContactIdPredicate:timeOfShareInteraction:interactionCache:](_PSContactFillerDataCollectionUtilities, "calculateTimeSinceLastShareForContactGivenContactIdPredicate:timeOfShareInteraction:interactionCache:", v23, v15, v17));
  objc_msgSend(v68, "setTimeSinceLastContactViaIncomingText:", +[_PSContactFillerDataCollectionUtilities calculateTimeSinceLastTextForContactGivenContactIdPredicate:direction:timeOfShareInteraction:interactionCache:](_PSContactFillerDataCollectionUtilities, "calculateTimeSinceLastTextForContactGivenContactIdPredicate:direction:timeOfShareInteraction:interactionCache:", v23, &unk_1EF676170, v15, v17));
  objc_msgSend(v68, "setTimeSinceLastContactViaOutgoingText:", +[_PSContactFillerDataCollectionUtilities calculateTimeSinceLastTextForContactGivenContactIdPredicate:direction:timeOfShareInteraction:interactionCache:](_PSContactFillerDataCollectionUtilities, "calculateTimeSinceLastTextForContactGivenContactIdPredicate:direction:timeOfShareInteraction:interactionCache:", v23, &unk_1EF676188, v15, v17));

  long long v41 = [v14 bundleId];
  int v42 = [v41 isEqualToString:@"com.apple.InCallService"];

  if (v42)
  {
    id v43 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v44 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"ANY recipients.identifier CONTAINS %@", v18];
    [v43 addObject:v44];

    id v45 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"sender.identifier CONTAINS %@", v18];
    [v43 addObject:v45];

    id v46 = [MEMORY[0x1E4F28BA0] orPredicateWithSubpredicates:v43];
  }
  else
  {
    id v46 = 0;
  }
  id v47 = [v16 objectForKeyedSubscript:@"normalizedOutgoingCallFrequency"];
  id v48 = [v47 valueForKey:v18];

  if (v48)
  {
    id v49 = v15;
    v50 = [v16 objectForKeyedSubscript:@"normalizedOutgoingCallFrequency"];
    id v51 = [v50 objectForKeyedSubscript:v18];
  }
  else
  {
    id v52 = [v67 outgoingCallTotal];
    id v49 = v15;
    id v51 = +[_PSContactFillerDataCollectionUtilities calculateNormalizedCallingFrequencyForContactGivenContactIdPredicate:v46 totalFrequency:v52 numberOfDaysToLookBack:a7 timeOfShareInteraction:v15 interactionStore:v66 direction:&unk_1EF6761A0];

    v50 = [v16 objectForKeyedSubscript:@"normalizedOutgoingCallFrequency"];
    [v50 setValue:v51 forKey:v18];
  }
  long long v60 = v39;
  v63 = v17;

  [v51 doubleValue];
  objc_msgSend(v68, "setNormalizedOutgoingCallFrequency:", +[_PSContactFillerDataCollectionUtilities enforceOneSignificantFigureForSmallDouble:](_PSContactFillerDataCollectionUtilities, "enforceOneSignificantFigureForSmallDouble:"));
  uint64_t v53 = [v16 objectForKeyedSubscript:@"normalizedIncomingCallFrequency"];
  v54 = [v53 valueForKey:v18];

  if (v54)
  {
    v55 = [v16 objectForKeyedSubscript:@"normalizedIncomingCallFrequency"];
    v56 = [v55 objectForKeyedSubscript:v18];
    long long v57 = v66;
    long long v58 = v67;
  }
  else
  {
    long long v58 = v67;
    long long v59 = [v67 incomingCallTotal];
    long long v57 = v66;
    v56 = +[_PSContactFillerDataCollectionUtilities calculateNormalizedCallingFrequencyForContactGivenContactIdPredicate:v46 totalFrequency:v59 numberOfDaysToLookBack:a7 timeOfShareInteraction:v49 interactionStore:v66 direction:&unk_1EF6761B8];

    v55 = [v16 objectForKeyedSubscript:@"normalizedIncomingCallFrequency"];
    [v55 setValue:v56 forKey:v18];
  }

  [v56 doubleValue];
  objc_msgSend(v68, "setNormalizedIncomingCallFrequency:", +[_PSContactFillerDataCollectionUtilities enforceOneSignificantFigureForSmallDouble:](_PSContactFillerDataCollectionUtilities, "enforceOneSignificantFigureForSmallDouble:"));
  objc_msgSend(v68, "setTimeSinceLastContactViaIncomingCall:", +[_PSContactFillerDataCollectionUtilities calculateTimeSinceLastCallForContactGivenContactIdPredicate:direction:timeOfShareInteraction:interactionCache:](_PSContactFillerDataCollectionUtilities, "calculateTimeSinceLastCallForContactGivenContactIdPredicate:direction:timeOfShareInteraction:interactionCache:", v46, &unk_1EF6761D0, v49, v63));
  objc_msgSend(v68, "setTimeSinceLastContactViaOutgoingCall:", +[_PSContactFillerDataCollectionUtilities calculateTimeSinceLastCallForContactGivenContactIdPredicate:direction:timeOfShareInteraction:interactionCache:](_PSContactFillerDataCollectionUtilities, "calculateTimeSinceLastCallForContactGivenContactIdPredicate:direction:timeOfShareInteraction:interactionCache:", v46, &unk_1EF6761E8, v49, v63));
}

+ (BOOL)doesTheRecipientsMatchInInteraction1:(id)a3 interaction2:(id)a4
{
  id v5 = a4;
  id v6 = +[_PSContactFillerDataCollectionUtilities resolveUniqueContactIdGivenInteraction:a3];
  double v7 = +[_PSContactFillerDataCollectionUtilities resolveUniqueContactIdGivenInteraction:v5];

  LOBYTE(v5) = [v6 isEqualToString:v7];
  return (char)v5;
}

+ (id)getInteractionModelScoreForSuggestions:(id)a3 forInteractionRecipients:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v23 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (v5)
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v21 = v6;
    id v7 = v6;
    uint64_t v24 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v24)
    {
      uint64_t v22 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v26 != v22) {
            objc_enumerationMutation(v7);
          }
          uint64_t v9 = *(void *)(*((void *)&v25 + 1) + 8 * i);
          double v10 = 0.0;
          if (objc_msgSend(v5, "count", v21))
          {
            unint64_t v11 = 1;
            while (1)
            {
              id v12 = [v5 objectAtIndexedSubscript:v11 - 1];
              id v13 = [v7 objectForKeyedSubscript:v9];
              id v14 = [v13 firstObject];
              BOOL v15 = +[_PSContactFillerDataCollectionUtilities doesSuggestionProxyMatch:v12 withInteraction:v14];

              if (v15) {
                break;
              }
              if ([v5 count] <= v11++) {
                goto LABEL_15;
              }
            }
            uint64_t v17 = v11;
            if (v11 >= 0xCuLL) {
              uint64_t v17 = 12;
            }
            double v10 = (double)(13 - v17) / 12.0;
          }
LABEL_15:
          char v18 = [NSNumber numberWithDouble:v10];
          [v23 setObject:v18 forKey:v9];
        }
        uint64_t v24 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v24);
    }

    id v6 = v21;
  }
  uint64_t v19 = objc_msgSend(v23, "copy", v21);

  return v19;
}

+ (id)getInteractionModelScoreForEvent:(id)a3 forInteractionRecipients:(id)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v40 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v7 = [v5 metadata];
  double v8 = [MEMORY[0x1E4F5B5E0] modelSuggestionProxies];
  uint64_t v9 = [v7 objectForKeyedSubscript:v8];

  if (v9)
  {
    double v10 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    id v14 = objc_msgSend(v10, "setWithObjects:", v11, v12, v13, objc_opt_class(), 0);
    id v46 = 0;
    BOOL v15 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v14 fromData:v9 error:&v46];
    id v16 = v46;
    uint64_t v17 = v16;
    if (v15)
    {
      id v37 = v16;
      id v38 = v15;
      char v18 = [v15 objectForKeyedSubscript:@"knnSuggestionProxies"];
      if (v18)
      {
        id v33 = v14;
        uint64_t v34 = v9;
        uint64_t v35 = v7;
        id v36 = v5;
        long long v44 = 0u;
        long long v45 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        id v19 = v6;
        uint64_t v41 = [v19 countByEnumeratingWithState:&v42 objects:v47 count:16];
        if (v41)
        {
          uint64_t v39 = *(void *)v43;
          do
          {
            for (uint64_t i = 0; i != v41; ++i)
            {
              if (*(void *)v43 != v39) {
                objc_enumerationMutation(v19);
              }
              uint64_t v21 = *(void *)(*((void *)&v42 + 1) + 8 * i);
              double v22 = 0.0;
              if ([v18 count])
              {
                unint64_t v23 = 1;
                while (1)
                {
                  uint64_t v24 = [v18 objectAtIndexedSubscript:v23 - 1];
                  long long v25 = [v19 objectForKeyedSubscript:v21];
                  long long v26 = [v25 firstObject];
                  BOOL v27 = +[_PSContactFillerDataCollectionUtilities doesSuggestionProxyMatch:v24 withInteraction:v26];

                  if (v27) {
                    break;
                  }
                  if ([v18 count] <= v23++) {
                    goto LABEL_17;
                  }
                }
                uint64_t v29 = v23;
                if (v23 >= 0xCuLL) {
                  uint64_t v29 = 12;
                }
                double v22 = (double)(13 - v29) / 12.0;
              }
LABEL_17:
              uint64_t v30 = [NSNumber numberWithDouble:v22];
              [v40 setObject:v30 forKey:v21];
            }
            uint64_t v41 = [v19 countByEnumeratingWithState:&v42 objects:v47 count:16];
          }
          while (v41);
        }

        id v5 = v36;
        uint64_t v9 = v34;
        id v7 = v35;
        id v14 = v33;
      }

      uint64_t v17 = v37;
      BOOL v15 = v38;
    }
  }
  long long v31 = (void *)[v40 copy];

  return v31;
}

+ (BOOL)doesSuggestionProxyMatch:(id)a3 withInteraction:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 interactionRecipients];
  if (v7)
  {
  }
  else
  {
    double v8 = [v5 contactID];

    if (!v8)
    {
      BOOL v14 = 0;
      goto LABEL_10;
    }
  }
  uint64_t v9 = +[_PSContactFillerDataCollectionUtilities getInteractionRecipientFromInteraction:v6];
  uint64_t v10 = [v5 interactionRecipients];
  if (v10)
  {
    uint64_t v11 = (void *)v10;
    uint64_t v12 = [v5 interactionRecipients];
    char v13 = [v12 isEqualToString:v9];

    if (v13) {
      goto LABEL_6;
    }
  }
  BOOL v15 = [v5 interactionRecipients];

  if (v15)
  {
LABEL_8:
    BOOL v14 = 0;
    goto LABEL_9;
  }
  uint64_t v17 = [v5 contactID];
  if (v17
    && (char v18 = (void *)v17,
        [v5 handle],
        id v19 = objc_claimAutoreleasedReturnValue(),
        v19,
        v18,
        !v19))
  {
    uint64_t v28 = [v6 recipients];
    if (!v28) {
      goto LABEL_8;
    }
    uint64_t v29 = (void *)v28;
    uint64_t v30 = [v6 recipients];
    uint64_t v31 = [v30 count];

    if (v31 != 1) {
      goto LABEL_8;
    }
    id v32 = [v6 recipients];
    id v33 = [v32 firstObject];

    if (!v33) {
      goto LABEL_8;
    }
    uint64_t v34 = [v5 contactID];
    uint64_t v35 = [v33 personId];
    char v36 = [v34 isEqualToString:v35];

    if ((v36 & 1) == 0) {
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v20 = [v6 recipients];
    if (!v20) {
      goto LABEL_8;
    }
    uint64_t v21 = (void *)v20;
    double v22 = [v6 recipients];
    uint64_t v23 = [v22 count];

    if (v23 != 1) {
      goto LABEL_8;
    }
    uint64_t v24 = [v6 recipients];
    long long v25 = [v24 firstObject];

    if (!v25) {
      goto LABEL_8;
    }
    long long v26 = [v5 contactID];
    BOOL v27 = [v25 personId];
    if ([v26 isEqualToString:v27])
    {
    }
    else
    {
      id v37 = [v5 handle];
      id v38 = [v25 identifier];
      char v39 = [v37 isEqualToString:v38];

      if ((v39 & 1) == 0) {
        goto LABEL_8;
      }
    }
  }
LABEL_6:
  BOOL v14 = 1;
LABEL_9:

LABEL_10:
  return v14;
}

+ (id)getInteractionRecipientFromInteraction:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3 && ([v3 mechanism] == 4 || objc_msgSend(v4, "mechanism") == 13))
  {
    if ([v4 mechanism] == 13)
    {
      id v5 = [v4 targetBundleId];
      +[_PSConstants shareSheetTargetBundleIdMessages];
    }
    else
    {
      id v5 = [v4 bundleId];
      +[_PSConstants mobileMessagesBundleId];
    id v7 = };
    if ([v5 isEqualToString:v7]) {
      [v4 domainIdentifier];
    }
    else {
    id v6 = [v4 derivedIntentIdentifier];
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (id)initContactPropertyCache:(id)a3 timeOfShareInteraction:(id)a4 interactionStore:(id)a5
{
  id v6 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v7 = a5;
  id v8 = a4;
  id v9 = objc_alloc_init(v6);
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v9 setObject:v10 forKeyedSubscript:@"normalizedShareFrequency"];

  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v9 setObject:v11 forKeyedSubscript:@"normalizedIncomingTextFrequency"];

  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v9 setObject:v12 forKeyedSubscript:@"normalizedOutgoingTextFrequency"];

  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v9 setObject:v13 forKeyedSubscript:@"normalizedOutgoingCallFrequency"];

  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v9 setObject:v14 forKeyedSubscript:@"normalizedIncomingCallFrequency"];

  BOOL v15 = [v8 dateByAddingTimeInterval:-86400.0];
  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v17 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(startDate >= %@)", v15];
  [v16 addObject:v17];

  char v18 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(startDate < %@)", v8];

  [v16 addObject:v18];
  id v19 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(direction IN %@)", &unk_1EF676200];
  [v16 addObject:v19];

  uint64_t v20 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(mechanism IN %@)", &unk_1EF676218];
  [v16 addObject:v20];

  uint64_t v21 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v16];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __108___PSContactFillerDataCollectionUtilities_initContactPropertyCache_timeOfShareInteraction_interactionStore___block_invoke;
  v24[3] = &unk_1E5AE0018;
  id v25 = &unk_1EF676200;
  id v26 = &unk_1EF676218;
  double v22 = +[_PSInteractionStoreUtils interactionCacheFromStore:v7 size:500 queryPredicate:v21 filterBlock:v24];

  return v22;
}

+ (void)getListOfContactsInteractedInTheLastNumberOfDays:(void *)a3 interactionStore:(NSObject *)a4 limit:.cold.1(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  id v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a2, "count"));
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_debug_impl(&dword_1A314B000, a4, OS_LOG_TYPE_DEBUG, "getListOfContactsInteractedInTheLastNumberOfDays - Number of interactions : %@", a1, 0xCu);
}

+ (void)calculateNormContantsGivenInteractionStore:normConstants:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(&dword_1A314B000, v0, v1, "Interaction store retrieval error. Sent call query: %@", v2, v3, v4, v5, v6);
}

+ (void)calculateNormContantsGivenInteractionStore:normConstants:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(&dword_1A314B000, v0, v1, "Interaction store retrieval error. Shares query: %@", v2, v3, v4, v5, v6);
}

+ (void)calculateNormContantsGivenInteractionStore:normConstants:.cold.4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(&dword_1A314B000, v0, v1, "Interaction store retrieval error. Recieved messages query: %@", v2, v3, v4, v5, v6);
}

+ (void)calculateNormContantsGivenInteractionStore:normConstants:.cold.5()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(&dword_1A314B000, v0, v1, "Interaction store retrieval error. Sent messages query: %@", v2, v3, v4, v5, v6);
}

+ (void)calculateNormalizedTextingFrequencyForContactGivenContactIdPredicate:totalFrequency:numberOfDaysToLookBack:timeOfShareInteraction:interactionStore:direction:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(&dword_1A314B000, v0, v1, "Interaction store retrieval error. Texting query: %@", v2, v3, v4, v5, v6);
}

@end
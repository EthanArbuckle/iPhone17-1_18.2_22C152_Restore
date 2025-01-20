@interface _PSSuggestionFromTextPredictor
+ (BOOL)isEligibleUnstructuredEvent:(id)a3;
- (_PSSuggestionFromTextPredictor)initWithEventStore:(id)a3 interactionStore:(id)a4;
- (id)suggestionFromContactPriors:(id)a3 priorScoreThreshold:(float)a4 bundleID:(id)a5 reason:(id)a6;
- (id)suggestionFromText:(id)a3 priorScoreThreshold:(float)a4 bundleID:(id)a5 reason:(id)a6;
- (id)suggestionsFromIncompleteRemindersWithContext:(id)a3 startDate:(id)a4 endDate:(id)a5 priorScoreThreshold:(float)a6;
- (id)suggestionsFromPortraitExtractionsWithContext:(id)a3 startDate:(id)a4 endDate:(id)a5 priorScoreThreshold:(float)a6 reason:(id)a7;
- (id)suggestionsFromUnstructuredCalendarEventsWithContext:(id)a3 startDate:(id)a4 endDate:(id)a5 priorScoreThreshold:(float)a6;
@end

@implementation _PSSuggestionFromTextPredictor

- (_PSSuggestionFromTextPredictor)initWithEventStore:(id)a3 interactionStore:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)_PSSuggestionFromTextPredictor;
  v9 = [(_PSSuggestionFromTextPredictor *)&v20 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_eventStore, a3);
    objc_storeStrong((id *)&v10->_interactionStore, a4);
    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x2050000000;
    v11 = (void *)getCNContactFormatterClass_softClass_2;
    uint64_t v29 = getCNContactFormatterClass_softClass_2;
    if (!getCNContactFormatterClass_softClass_2)
    {
      uint64_t v21 = MEMORY[0x1E4F143A8];
      uint64_t v22 = 3221225472;
      v23 = __getCNContactFormatterClass_block_invoke_2;
      v24 = &unk_1E5ADE858;
      v25 = &v26;
      __getCNContactFormatterClass_block_invoke_2((uint64_t)&v21);
      v11 = (void *)v27[3];
    }
    id v12 = v11;
    _Block_object_dispose(&v26, 8);
    uint64_t v13 = objc_opt_new();
    contactFormatter = v10->_contactFormatter;
    v10->_contactFormatter = (CNContactFormatter *)v13;

    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x2050000000;
    v15 = (void *)getREMStoreClass_softClass;
    uint64_t v29 = getREMStoreClass_softClass;
    if (!getREMStoreClass_softClass)
    {
      uint64_t v21 = MEMORY[0x1E4F143A8];
      uint64_t v22 = 3221225472;
      v23 = __getREMStoreClass_block_invoke;
      v24 = &unk_1E5ADE858;
      v25 = &v26;
      __getREMStoreClass_block_invoke((uint64_t)&v21);
      v15 = (void *)v27[3];
    }
    id v16 = v15;
    _Block_object_dispose(&v26, 8);
    uint64_t v17 = objc_opt_new();
    remStore = v10->_remStore;
    v10->_remStore = (REMStore *)v17;
  }
  return v10;
}

- (id)suggestionFromContactPriors:(id)a3 priorScoreThreshold:(float)a4 bundleID:(id)a5 reason:(id)a6
{
  v38[7] = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a6;
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __98___PSSuggestionFromTextPredictor_suggestionFromContactPriors_priorScoreThreshold_bundleID_reason___block_invoke;
  v36[3] = &__block_descriptor_36_e25_B16__0___PSContactPrior_8l;
  float v37 = a4;
  id v12 = objc_msgSend(a3, "_pas_filteredArrayWithTest:", v36);
  uint64_t v13 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    -[_PSSuggestionFromTextPredictor suggestionFromContactPriors:priorScoreThreshold:bundleID:reason:]();
  }

  if ([v12 count])
  {
    id v30 = v11;
    id v31 = v10;
    v14 = +[_PSConstants mobileFacetimeBundleId];
    v38[0] = v14;
    v15 = +[_PSConstants macFacetimeBundleId];
    v38[1] = v15;
    id v16 = +[_PSConstants mobileMessagesBundleId];
    v38[2] = v16;
    uint64_t v17 = +[_PSConstants macMessagesBundleId];
    v38[3] = v17;
    v18 = +[_PSConstants mobilePhoneBundleId];
    v38[4] = v18;
    v19 = +[_PSConstants mobileMailBundleId];
    v38[5] = v19;
    objc_super v20 = +[_PSConstants macMailBundleId];
    v38[6] = v20;
    uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:7];

    uint64_t v22 = [MEMORY[0x1E4F1C9C8] now];
    v23 = [v22 dateByAddingTimeInterval:-1209600.0];

    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __98___PSSuggestionFromTextPredictor_suggestionFromContactPriors_priorScoreThreshold_bundleID_reason___block_invoke_74;
    v33[3] = &unk_1E5AE04C0;
    v33[4] = self;
    id v24 = v21;
    id v34 = v24;
    id v25 = v23;
    id v35 = v25;
    uint64_t v26 = objc_msgSend(v12, "_pas_filteredArrayWithTest:", v33);
    if ([v26 count])
    {
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __98___PSSuggestionFromTextPredictor_suggestionFromContactPriors_priorScoreThreshold_bundleID_reason___block_invoke_76;
      v32[3] = &unk_1E5AE04E8;
      v32[4] = self;
      v27 = objc_msgSend(v26, "_pas_mappedArrayWithTransform:", v32);
      id v11 = v30;
      id v10 = v31;
      if ([v27 count]) {
        uint64_t v28 = [[_PSSuggestion alloc] initWithBundleID:v31 conversationIdentifier:0 groupName:0 recipients:v27 reason:v30 reasonType:0];
      }
      else {
        uint64_t v28 = 0;
      }
    }
    else
    {
      uint64_t v28 = 0;
      id v11 = v30;
      id v10 = v31;
    }
  }
  else
  {
    uint64_t v28 = 0;
  }

  return v28;
}

- (id)suggestionFromText:(id)a3 priorScoreThreshold:(float)a4 bundleID:(id)a5 reason:(id)a6
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if ([v10 length])
  {
    uint64_t v13 = +[_PSContactSuggester contactPriorSuggestionsForText:v10];
    v14 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412546;
      id v19 = v10;
      __int16 v20 = 2112;
      uint64_t v21 = v13;
      _os_log_impl(&dword_1A314B000, v14, OS_LOG_TYPE_DEFAULT, "For text %@ found contacts %@", (uint8_t *)&v18, 0x16u);
    }

    if ([v13 count])
    {
      *(float *)&double v15 = a4;
      id v16 = [(_PSSuggestionFromTextPredictor *)self suggestionFromContactPriors:v13 priorScoreThreshold:v11 bundleID:v12 reason:v15];
    }
    else
    {
      id v16 = 0;
    }
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

+ (BOOL)isEligibleUnstructuredEvent:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    if ([v3 isAllDay])
    {
      v5 = +[_PSLogging generalChannel];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        +[_PSSuggestionFromTextPredictor isEligibleUnstructuredEvent:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
    else if ([v4 status] == 3)
    {
      v5 = +[_PSLogging generalChannel];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        +[_PSSuggestionFromTextPredictor isEligibleUnstructuredEvent:](v5, v13, v14, v15, v16, v17, v18, v19);
      }
    }
    else
    {
      __int16 v20 = [v4 attendees];
      uint64_t v21 = [v20 count];

      if (!v21)
      {
        BOOL v29 = 1;
        goto LABEL_13;
      }
      v5 = +[_PSLogging generalChannel];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        +[_PSSuggestionFromTextPredictor isEligibleUnstructuredEvent:](v5, v22, v23, v24, v25, v26, v27, v28);
      }
    }
  }
  BOOL v29 = 0;
LABEL_13:

  return v29;
}

- (id)suggestionsFromIncompleteRemindersWithContext:(id)a3 startDate:(id)a4 endDate:(id)a5 priorScoreThreshold:(float)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  remStore = self->_remStore;
  id v28 = 0;
  uint64_t v14 = [(REMStore *)remStore fetchListsForEventKitBridgingWithError:&v28];
  id v15 = v28;
  if (v15 || ![v14 count])
  {
    uint64_t v16 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[_PSSuggestionFromTextPredictor suggestionsFromIncompleteRemindersWithContext:startDate:endDate:priorScoreThreshold:]();
    }
    uint64_t v17 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    uint64_t v16 = objc_msgSend(v14, "_pas_mappedArrayWithTransform:", &__block_literal_global_23);
    uint64_t v18 = self->_remStore;
    id v27 = 0;
    uint64_t v19 = [(REMStore *)v18 fetchIncompleteRemindersForEventKitBridgingWithDueDateFrom:v11 to:v12 withListIDs:v16 error:&v27];
    id v15 = v27;
    if (v15 || ![v19 count])
    {
      __int16 v20 = +[_PSLogging generalChannel];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        -[_PSSuggestionFromTextPredictor suggestionsFromIncompleteRemindersWithContext:startDate:endDate:priorScoreThreshold:]();
      }
      uint64_t v17 = (void *)MEMORY[0x1E4F1CBF0];
    }
    else
    {
      unint64_t v21 = [v19 count];
      if (v21 >= 2) {
        uint64_t v22 = 2;
      }
      else {
        uint64_t v22 = v21;
      }
      __int16 v20 = objc_msgSend(v19, "subarrayWithRange:", 0, v22);
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __118___PSSuggestionFromTextPredictor_suggestionsFromIncompleteRemindersWithContext_startDate_endDate_priorScoreThreshold___block_invoke_84;
      v24[3] = &unk_1E5AE0530;
      v24[4] = self;
      float v26 = a6;
      id v25 = v10;
      uint64_t v17 = [v20 _pas_mappedArrayWithTransform:v24];
    }
  }

  return v17;
}

- (id)suggestionsFromPortraitExtractionsWithContext:(id)a3 startDate:(id)a4 endDate:(id)a5 priorScoreThreshold:(float)a6 reason:(id)a7
{
  v46[2] = *MEMORY[0x1E4F143B8];
  id v31 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x2050000000;
  id v15 = (void *)getPPFuzzyContactQueryClass_softClass;
  uint64_t v45 = getPPFuzzyContactQueryClass_softClass;
  if (!getPPFuzzyContactQueryClass_softClass)
  {
    uint64_t v37 = MEMORY[0x1E4F143A8];
    uint64_t v38 = 3221225472;
    v39 = __getPPFuzzyContactQueryClass_block_invoke;
    v40 = &unk_1E5ADE858;
    v41 = &v42;
    PersonalizationPortraitLibraryCore_0();
    v43[3] = (uint64_t)objc_getClass("PPFuzzyContactQuery");
    getPPFuzzyContactQueryClass_softClass = *(void *)(v41[1] + 24);
    id v15 = (void *)v43[3];
  }
  id v16 = v15;
  _Block_object_dispose(&v42, 8);
  uint64_t v17 = objc_opt_new();
  uint64_t v18 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v19 = +[_PSConstants mobileCalendarBundleId];
  v46[0] = v19;
  __int16 v20 = +[_PSConstants macCalendarBundleId];
  v46[1] = v20;
  unint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:2];
  uint64_t v22 = [v18 setWithArray:v21];
  [v17 setSourceBundleIds:v22];

  [v17 setStartDate:v12];
  [v17 setEndDate:v13];
  [v17 setOnlyAddressBook:1];
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x2050000000;
  uint64_t v23 = (void *)getPPContactStoreClass_softClass_0;
  uint64_t v45 = getPPContactStoreClass_softClass_0;
  if (!getPPContactStoreClass_softClass_0)
  {
    uint64_t v37 = MEMORY[0x1E4F143A8];
    uint64_t v38 = 3221225472;
    v39 = __getPPContactStoreClass_block_invoke_0;
    v40 = &unk_1E5ADE858;
    v41 = &v42;
    PersonalizationPortraitLibraryCore_0();
    v43[3] = (uint64_t)objc_getClass("PPContactStore");
    getPPContactStoreClass_softClass_0 = *(void *)(v41[1] + 24);
    uint64_t v23 = (void *)v43[3];
  }
  id v24 = v23;
  _Block_object_dispose(&v42, 8);
  id v25 = objc_opt_new();
  id v36 = 0;
  float v26 = [v25 upcomingRelevantContactsForQuery:v17 error:&v36];
  id v27 = v36;
  if (v27 || ![v26 count])
  {
    id v28 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
      -[_PSSuggestionFromTextPredictor suggestionsFromPortraitExtractionsWithContext:startDate:endDate:priorScoreThreshold:reason:]();
    }
    BOOL v29 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    id v28 = objc_msgSend(v26, "_pas_mappedArrayWithTransform:", &__block_literal_global_92);
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __125___PSSuggestionFromTextPredictor_suggestionsFromPortraitExtractionsWithContext_startDate_endDate_priorScoreThreshold_reason___block_invoke_2;
    v32[3] = &unk_1E5AE0578;
    v32[4] = self;
    float v35 = a6;
    id v33 = v31;
    id v34 = v14;
    BOOL v29 = [v28 _pas_mappedArrayWithTransform:v32];
  }

  return v29;
}

- (id)suggestionsFromUnstructuredCalendarEventsWithContext:(id)a3 startDate:(id)a4 endDate:(id)a5 priorScoreThreshold:(float)a6
{
  id v10 = a3;
  eventStore = self->_eventStore;
  id v12 = a5;
  id v13 = a4;
  id v14 = [(EKEventStore *)eventStore calendarsForEntityType:0];
  id v15 = [(EKEventStore *)self->_eventStore predicateForEventsWithStartDate:v13 endDate:v12 calendars:v14];

  id v16 = objc_opt_new();
  uint64_t v17 = self->_eventStore;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __125___PSSuggestionFromTextPredictor_suggestionsFromUnstructuredCalendarEventsWithContext_startDate_endDate_priorScoreThreshold___block_invoke;
  v27[3] = &unk_1E5AE05A0;
  id v18 = v16;
  id v28 = v18;
  [(EKEventStore *)v17 enumerateEventsMatchingPredicate:v15 usingBlock:v27];
  if ([v18 count])
  {
    unint64_t v19 = [v18 count];
    if (v19 >= 2) {
      uint64_t v20 = 2;
    }
    else {
      uint64_t v20 = v19;
    }
    unint64_t v21 = objc_msgSend(v18, "subarrayWithRange:", 0, v20);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __125___PSSuggestionFromTextPredictor_suggestionsFromUnstructuredCalendarEventsWithContext_startDate_endDate_priorScoreThreshold___block_invoke_2;
    v24[3] = &unk_1E5AE05C8;
    v24[4] = self;
    float v26 = a6;
    id v25 = v10;
    uint64_t v22 = objc_msgSend(v21, "_pas_mappedArrayWithTransform:", v24);
  }
  else
  {
    uint64_t v22 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v22;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remStore, 0);
  objc_storeStrong((id *)&self->_contactFormatter, 0);
  objc_storeStrong((id *)&self->_interactionStore, 0);

  objc_storeStrong((id *)&self->_eventStore, 0);
}

- (void)suggestionFromContactPriors:priorScoreThreshold:bundleID:reason:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5(&dword_1A314B000, v0, v1, "Filtering over all contact priors %@", v2, v3, v4, v5, v6);
}

+ (void)isEligibleUnstructuredEvent:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)isEligibleUnstructuredEvent:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)isEligibleUnstructuredEvent:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)suggestionsFromIncompleteRemindersWithContext:startDate:endDate:priorScoreThreshold:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5(&dword_1A314B000, v0, v1, "Unable to find reminders lists w/ error %@", v2, v3, v4, v5, v6);
}

- (void)suggestionsFromIncompleteRemindersWithContext:startDate:endDate:priorScoreThreshold:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5(&dword_1A314B000, v0, v1, "Unable to find reminders w/ error %@", v2, v3, v4, v5, v6);
}

- (void)suggestionsFromPortraitExtractionsWithContext:startDate:endDate:priorScoreThreshold:reason:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5(&dword_1A314B000, v0, v1, "Unable to find any fuzzy contacts matching with Portrait w/ error %@", v2, v3, v4, v5, v6);
}

@end
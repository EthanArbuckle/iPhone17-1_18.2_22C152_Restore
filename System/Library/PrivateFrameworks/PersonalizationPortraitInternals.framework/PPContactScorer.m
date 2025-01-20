@interface PPContactScorer
+ (double)_scoreWithInitialScore:(void *)a3 identifier:(void *)a4 rankMap:;
+ (id)_contactRankMapWithRankedIdentifiers:(uint64_t)a1;
+ (id)_contactsWithIdentifiers:(void *)a3 store:;
+ (id)_scoreAndSortContacts:(void *)a3 rankMap:;
+ (id)_scoredLabeledValues:(uint64_t)a1;
+ (id)mostRelevantContactsWithName:(id)a3 store:(id)a4;
+ (id)mostRelevantContactsWithStore:(id)a3;
+ (id)mostRelevantContactsWithStore:(id)a3 shouldContinueBlock:(id)a4;
+ (id)scoredContactsWithContacts:(id)a3;
+ (void)scoreContactNameRecords:(id)a3;
@end

@implementation PPContactScorer

+ (void)scoreContactNameRecords:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = pp_contacts_signpost_handle();
  os_signpost_id_t v6 = os_signpost_id_generate(v5);

  v7 = pp_contacts_signpost_handle();
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "PPContactScorer.scoreContactNameRecords", "", buf, 2u);
  }
  os_signpost_id_t spid = v6;

  v9 = +[PPPeopleSuggester sharedInstance];
  v10 = [v9 rankedContactIdentifiers];
  v11 = +[PPContactScorer _contactRankMapWithRankedIdentifiers:]((uint64_t)a1, v10);

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v12 = v4;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v28 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        int v18 = objc_msgSend(v17, "source", spid);
        v19 = +[PPConfiguration sharedInstance];
        v20 = v19;
        if (v18 == 1) {
          [v19 recordSourceContactsInitialScore];
        }
        else {
          [v19 recordSourceNonContactsInitialScore];
        }
        float v22 = v21;

        v23 = [v17 sourceIdentifier];
        objc_msgSend(v17, "setScore:", +[PPContactScorer _scoreWithInitialScore:identifier:rankMap:](v22, (uint64_t)a1, v23, v11));
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v14);
  }

  [v12 sortUsingComparator:&__block_literal_global_4];
  v24 = pp_contacts_signpost_handle();
  v25 = v24;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v25, OS_SIGNPOST_INTERVAL_END, spid, "PPContactScorer.scoreContactNameRecords", "", buf, 2u);
  }
}

+ (id)_contactRankMapWithRankedIdentifiers:(uint64_t)a1
{
  id v2 = a2;
  self;
  v3 = objc_opt_new();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__PPContactScorer__contactRankMapWithRankedIdentifiers___block_invoke;
  v6[3] = &unk_1E65D96D0;
  id v4 = v3;
  id v7 = v4;
  [v2 enumerateObjectsUsingBlock:v6];

  return v4;
}

+ (double)_scoreWithInitialScore:(void *)a3 identifier:(void *)a4 rankMap:
{
  id v6 = a4;
  id v7 = a3;
  self;
  v8 = [v6 objectForKeyedSubscript:v7];

  if (v8)
  {
    double v9 = (double)(unint64_t)[v8 unsignedIntegerValue];
    a1 = a1 + (1.0 - v9 / (double)(unint64_t)[v6 count]) * (1.0 - a1);
  }

  return a1;
}

uint64_t __43__PPContactScorer_scoreContactNameRecords___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = (void *)MEMORY[0x1E4F89FC8];
  id v5 = a3;
  [a2 score];
  double v7 = v6;
  [v5 score];
  double v9 = v8;

  return [v4 reverseCompareDouble:v7 withDouble:v9];
}

void __56__PPContactScorer__contactRankMapWithRankedIdentifiers___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = NSNumber;
  id v6 = a2;
  id v7 = [v5 numberWithUnsignedInteger:a3];
  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v6];
}

+ (id)scoredContactsWithContacts:(id)a3
{
  id v4 = a3;
  id v5 = pp_contacts_signpost_handle();
  os_signpost_id_t v6 = os_signpost_id_generate(v5);

  id v7 = pp_contacts_signpost_handle();
  double v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "PPContactScorer.scoredContactsWithContacts", "", buf, 2u);
  }

  double v9 = +[PPPeopleSuggester sharedInstance];
  v10 = [v9 rankedContactIdentifiers];
  v11 = +[PPContactScorer _contactRankMapWithRankedIdentifiers:]((uint64_t)a1, v10);

  id v12 = +[PPContactScorer _scoreAndSortContacts:rankMap:]((uint64_t)a1, v4, v11);

  uint64_t v13 = pp_contacts_signpost_handle();
  uint64_t v14 = v13;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)v16 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v14, OS_SIGNPOST_INTERVAL_END, v6, "PPContactScorer.scoredContactsWithContacts", "", v16, 2u);
  }

  return v12;
}

+ (id)_scoreAndSortContacts:(void *)a3 rankMap:
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v28 = a3;
  uint64_t v5 = self;
  if ([v4 count])
  {
    id v29 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v26 = v4;
    id obj = v4;
    uint64_t v32 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v32)
    {
      uint64_t v30 = *(void *)v37;
      uint64_t v31 = v5;
      do
      {
        for (uint64_t i = 0; i != v32; ++i)
        {
          if (*(void *)v37 != v30) {
            objc_enumerationMutation(obj);
          }
          id v7 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          uint64_t v8 = MEMORY[0x1CB79D060]();
          int v9 = [v7 source];
          v10 = +[PPConfiguration sharedInstance];
          v11 = v10;
          if (v9 == 1) {
            [v10 recordSourceContactsInitialScore];
          }
          else {
            [v10 recordSourceNonContactsInitialScore];
          }
          float v13 = v12;

          double v14 = v13;
          uint64_t v15 = [v7 contactsContactIdentifierWithError:0];
          v34 = v15;
          context = (void *)v8;
          if (v15) {
            double v14 = +[PPContactScorer _scoreWithInitialScore:identifier:rankMap:](v14, v5, v15, v28);
          }
          v16 = (void *)MEMORY[0x1E4F89EF0];
          uint64_t v33 = objc_msgSend(v7, "phoneNumbers", v26);
          v17 = +[PPContactScorer _scoredLabeledValues:](v5, v33);
          int v18 = [v7 emailAddresses];
          v19 = +[PPContactScorer _scoredLabeledValues:](v5, v18);
          v20 = [v7 socialProfiles];
          float v21 = +[PPContactScorer _scoredLabeledValues:](v5, v20);
          float v22 = [v7 postalAddresses];
          v23 = +[PPContactScorer _scoredLabeledValues:](v5, v22);
          v24 = [v16 scoredContactWithContact:v7 scoredPhoneNumbers:v17 scoredEmailAddresses:v19 scoredSocialProfiles:v21 scoredPostalAddresses:v23 score:0 flags:v14];

          if (v24) {
            [v29 addObject:v24];
          }

          uint64_t v5 = v31;
        }
        uint64_t v32 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
      }
      while (v32);
    }

    [v29 sortUsingSelector:sel_reverseCompare_];
    id v4 = v26;
  }
  else
  {
    id v29 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v29;
}

+ (id)_scoredLabeledValues:(uint64_t)a1
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  self;
  v3 = PPContactLabelScoringMap();
  id v4 = objc_opt_new();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = v2;
  uint64_t v5 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(obj);
        }
        int v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v10 = (void *)MEMORY[0x1CB79D060]();
        v11 = [v9 label];
        float v12 = [v3 objectForKeyedSubscript:v11];

        if (v12)
        {
          [v12 doubleValue];
          double v14 = (v13 + 1.0) * 0.5;
        }
        else
        {
          double v14 = 0.5;
        }
        uint64_t v15 = [MEMORY[0x1E4F89F08] scoredLabeledValueWithLabeledValue:v9 score:0 flags:v14];
        if (v15) {
          [v4 addObject:v15];
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }

  [v4 sortUsingSelector:sel_reverseCompare_];
  return v4;
}

+ (id)mostRelevantContactsWithName:(id)a3 store:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = pp_contacts_signpost_handle();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  v10 = pp_contacts_signpost_handle();
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "PPContactScorer.mostRelevantContactsWithName", "", buf, 2u);
  }

  float v12 = +[PPPeopleSuggester sharedInstance];
  double v13 = [v12 rankedContactIdentifiersMatchingName:v7];

  double v14 = [v12 rankedContactIdentifiers];
  uint64_t v15 = +[PPContactScorer _contactRankMapWithRankedIdentifiers:]((uint64_t)a1, v14);

  v16 = +[PPContactScorer _contactsWithIdentifiers:store:]((uint64_t)a1, v13, v6);

  v17 = +[PPContactScorer _scoreAndSortContacts:rankMap:]((uint64_t)a1, v16, v15);

  long long v18 = pp_contacts_signpost_handle();
  long long v19 = v18;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_WORD *)long long v21 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v19, OS_SIGNPOST_INTERVAL_END, v9, "PPContactScorer.mostRelevantContactsWithName", "", v21, 2u);
  }

  return v17;
}

+ (id)_contactsWithIdentifiers:(void *)a3 store:
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = a2;
  self;
  id v6 = objc_opt_new();
  [v6 setMatchingIdentifiers:v5];

  id v11 = 0;
  id v7 = [v4 contactsWithQuery:v6 error:&v11];

  id v8 = v11;
  if (!v7)
  {
    os_signpost_id_t v9 = pp_contacts_log_handle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v8;
      _os_log_impl(&dword_1CA9A8000, v9, OS_LOG_TYPE_DEFAULT, "PPContactScorer: failed to resolve ranked identifiers to contacts: %@", buf, 0xCu);
    }
  }
  return v7;
}

+ (id)mostRelevantContactsWithStore:(id)a3 shouldContinueBlock:(id)a4
{
  id v6 = a3;
  id v7 = (uint64_t (**)(void))a4;
  id v8 = pp_contacts_signpost_handle();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  v10 = pp_contacts_signpost_handle();
  id v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "PPContactScorer.mostRelevantContacts", "", buf, 2u);
  }

  if (v7[2](v7))
  {
    float v12 = +[PPPeopleSuggester sharedInstance];
    id v13 = [v12 rankedContactIdentifiers];

    if (v7[2](v7))
    {
      uint64_t v14 = +[PPContactScorer _contactRankMapWithRankedIdentifiers:]((uint64_t)a1, v13);
      uint64_t v15 = +[PPContactScorer _contactsWithIdentifiers:store:]((uint64_t)a1, v13, v6);
      if (v7[2](v7))
      {
        v16 = +[PPContactScorer _scoreAndSortContacts:rankMap:]((uint64_t)a1, v15, v14);
        v17 = pp_contacts_signpost_handle();
        long long v18 = v17;
        if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
        {
          *(_WORD *)long long v20 = 0;
          _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v18, OS_SIGNPOST_INTERVAL_END, v9, "PPContactScorer.mostRelevantContacts", "", v20, 2u);
        }
      }
      else
      {
        long long v18 = pp_contacts_log_handle();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long v21 = 0;
          _os_log_impl(&dword_1CA9A8000, v18, OS_LOG_TYPE_DEFAULT, "mostRelevantContactsWithStore stopping due to shouldContinueBlock", v21, 2u);
        }
        v16 = (void *)MEMORY[0x1E4F1CBF0];
      }
    }
    else
    {
      uint64_t v14 = pp_contacts_log_handle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)float v22 = 0;
        _os_log_impl(&dword_1CA9A8000, v14, OS_LOG_TYPE_DEFAULT, "mostRelevantContactsWithStore stopping due to shouldContinueBlock", v22, 2u);
      }
      v16 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    id v13 = pp_contacts_log_handle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v23 = 0;
      _os_log_impl(&dword_1CA9A8000, v13, OS_LOG_TYPE_DEFAULT, "mostRelevantContactsWithStore stopping due to shouldContinueBlock", v23, 2u);
    }
    v16 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v16;
}

+ (id)mostRelevantContactsWithStore:(id)a3
{
  return (id)[a1 mostRelevantContactsWithStore:a3 shouldContinueBlock:&__block_literal_global_18193];
}

uint64_t __49__PPContactScorer_mostRelevantContactsWithStore___block_invoke()
{
  return 1;
}

@end
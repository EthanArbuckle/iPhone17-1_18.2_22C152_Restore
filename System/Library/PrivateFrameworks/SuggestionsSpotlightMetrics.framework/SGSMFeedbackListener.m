@interface SGSMFeedbackListener
- (SGSMFeedbackListener)init;
- (id)_eventIdentifierFromSearchResult:(id)a3;
- (void)_resetState;
- (void)_restoreStateIfUnset;
- (void)_saveAndUnsetState;
- (void)didEngageCardSection:(id)a3;
- (void)didEngageResult:(id)a3;
- (void)didEngageSuggestion:(id)a3;
- (void)didRankSections:(id)a3;
- (void)resultsDidBecomeVisible:(id)a3;
- (void)searchViewDidDisappear:(id)a3;
@end

@implementation SGSMFeedbackListener

- (void)_resetState
{
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v6 = 0;
    _os_log_debug_impl(&dword_224D4A000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG, "SGSM: resetting search state", v6, 2u);
  }
  previousState = self->_previousState;
  self->_previousState = 0;

  v4 = (SGSMMutableSearchState *)objc_opt_new();
  searchState = self->_searchState;
  self->_searchState = v4;
}

- (void)resultsDidBecomeVisible:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  v4 = (SGSMMutableSearchState *)a3;
  [(SGSMFeedbackListener *)self _restoreStateIfUnset];
  [(SGSMMutableSearchState *)self->_searchState resetJustEngaged];
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v35 = v4;
    _os_log_debug_impl(&dword_224D4A000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG, "SGSM: resultsDidBecomeVisible: %@", buf, 0xCu);
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v28 = v4;
  v5 = [(SGSMMutableSearchState *)v4 results];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v30;
    v9 = MEMORY[0x263EF8438];
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v30 != v8) {
          objc_enumerationMutation(v5);
        }
        v11 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        v12 = [v11 sectionBundleIdentifier];
        char v13 = [v12 isEqualToString:@"com.apple.searchd.zkw.apps"];

        if ((v13 & 1) == 0
          && [(SGSMMutableSearchState *)self->_searchState isFirstTimeSeeingResult:v11])
        {
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          {
            v26 = [v11 resultBundleId];
            *(_DWORD *)buf = 138412290;
            v35 = v26;
            _os_log_debug_impl(&dword_224D4A000, v9, OS_LOG_TYPE_DEBUG, "SGSM: resultsDidBecomeVisible.resultBundleId: %@", buf, 0xCu);
          }
          v14 = [v11 resultBundleId];
          int v15 = [v14 isEqualToString:@"com.apple.CoreSuggestions"];

          if (v15)
          {
            [(SGSMMutableSearchState *)self->_searchState scoreAsContactOpportunity];
LABEL_24:
            [(SGSMMutableSearchState *)self->_searchState scoreAsCuratedOrPseudoContactOpportunity];
            continue;
          }
          v16 = [v11 resultBundleId];
          int v17 = [v16 isEqualToString:@"com.apple.mobilecal"];

          if (!v17)
          {
            v24 = [v11 resultBundleId];
            int v25 = [v24 isEqualToString:@"com.apple.MobileAddressBook"];

            if (!v25) {
              continue;
            }
            goto LABEL_24;
          }
          v18 = [(SGSMFeedbackListener *)self _eventIdentifierFromSearchResult:v11];
          if (v18)
          {
            v19 = [(NSCache *)self->_eventLastInteractionTime objectForKey:v18];
            v20 = v19;
            if (!v19 || ([v19 timeIntervalSinceNow], v21 < -5.0))
            {
              if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v35 = v18;
                _os_log_debug_impl(&dword_224D4A000, v9, OS_LOG_TYPE_DEBUG, "SGSM: scoring event with identifier = %@ as event shown.", buf, 0xCu);
              }
              [(SGSuggestionsServiceEventsProtocol *)self->_suggestionsService logEventInteractionForEventWithExternalIdentifier:v18 interface:19 actionType:4];
              eventLastInteractionTime = self->_eventLastInteractionTime;
              v23 = objc_opt_new();
              [(NSCache *)eventLastInteractionTime setObject:v23 forKey:v18];

              v9 = MEMORY[0x263EF8438];
            }
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v7);
  }

  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG))
  {
    searchState = self->_searchState;
    *(_DWORD *)buf = 138412290;
    v35 = searchState;
    _os_log_debug_impl(&dword_224D4A000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG, "SGSM: state: %@", buf, 0xCu);
  }
}

- (void)didRankSections:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  v4 = (SGSMMutableSearchState *)a3;
  [(SGSMFeedbackListener *)self _resetState];
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v36 = v4;
    _os_log_debug_impl(&dword_224D4A000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG, "SGSM: didRankSections: %@", buf, 0xCu);
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v20 = v4;
  id obj = [(SGSMMutableSearchState *)v4 sections];
  uint64_t v23 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v23)
  {
    uint64_t v22 = *(void *)v30;
    v5 = MEMORY[0x263EF8438];
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v30 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v24 = v6;
        uint64_t v7 = *(void **)(*((void *)&v29 + 1) + 8 * v6);
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        uint64_t v8 = [v7 results];
        uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v26;
          do
          {
            uint64_t v12 = 0;
            do
            {
              if (*(void *)v26 != v11) {
                objc_enumerationMutation(v8);
              }
              char v13 = *(void **)(*((void *)&v25 + 1) + 8 * v12);
              if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
              {
                int v17 = [v13 result];
                v18 = [v17 resultBundleId];
                *(_DWORD *)buf = 138412290;
                uint64_t v36 = v18;
                _os_log_debug_impl(&dword_224D4A000, v5, OS_LOG_TYPE_DEBUG, "SGSM: didRankSections.resultBundleId: %@", buf, 0xCu);
              }
              v14 = [v13 result];
              int v15 = [v14 resultBundleId];
              int v16 = [v15 isEqualToString:@"com.apple.CoreSuggestions"];

              if (v16) {
                [(SGSMMutableSearchState *)self->_searchState scoreAsContactResult];
              }
              ++v12;
            }
            while (v10 != v12);
            uint64_t v10 = [v8 countByEnumeratingWithState:&v25 objects:v33 count:16];
          }
          while (v10);
        }

        uint64_t v6 = v24 + 1;
      }
      while (v24 + 1 != v23);
      uint64_t v23 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v23);
  }

  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG))
  {
    searchState = self->_searchState;
    *(_DWORD *)buf = 138412290;
    uint64_t v36 = searchState;
    _os_log_debug_impl(&dword_224D4A000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG, "SGSM: state: %@", buf, 0xCu);
  }
}

- (void)_restoreStateIfUnset
{
  p_searchState = &self->_searchState;
  if (!self->_searchState)
  {
    previousState = self->_previousState;
    if (previousState)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v5 = 0;
        _os_log_debug_impl(&dword_224D4A000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG, "SGSM: restoring search state", v5, 2u);
        previousState = self->_previousState;
      }
      objc_storeStrong((id *)p_searchState, previousState);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventLastInteractionTime, 0);
  objc_storeStrong((id *)&self->_suggestionsService, 0);
  objc_storeStrong((id *)&self->_previousState, 0);
  objc_storeStrong((id *)&self->_searchState, 0);
}

- (void)searchViewDidDisappear:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v4 = (SGSMMutableSearchState *)a3;
  [(SGSMFeedbackListener *)self _restoreStateIfUnset];
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG))
  {
    int v6 = 138412290;
    uint64_t v7 = v4;
    _os_log_debug_impl(&dword_224D4A000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG, "SGSM: searchViewDidDisappear: %@", (uint8_t *)&v6, 0xCu);
  }
  if (![(SGSMMutableSearchState *)self->_searchState justEngaged])
  {
    [(SGSMMutableSearchState *)self->_searchState scoreAsNonOpportunity];
    [(SGSMMutableSearchState *)self->_searchState commit];
  }
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG))
  {
    searchState = self->_searchState;
    int v6 = 138412290;
    uint64_t v7 = searchState;
    _os_log_debug_impl(&dword_224D4A000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG, "SGSM: state: %@", (uint8_t *)&v6, 0xCu);
  }
  [(SGSMFeedbackListener *)self _saveAndUnsetState];
}

- (void)didEngageCardSection:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v4 = (SGSMMutableSearchState *)a3;
  [(SGSMFeedbackListener *)self _restoreStateIfUnset];
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG))
  {
    int v6 = 138412290;
    uint64_t v7 = v4;
    _os_log_debug_impl(&dword_224D4A000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG, "SGSM: didEngageCardSection: %@", (uint8_t *)&v6, 0xCu);
  }
  [(SGSMMutableSearchState *)self->_searchState scoreAsOtherConversion];
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG))
  {
    searchState = self->_searchState;
    int v6 = 138412290;
    uint64_t v7 = searchState;
    _os_log_debug_impl(&dword_224D4A000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG, "SGSM: state: %@", (uint8_t *)&v6, 0xCu);
  }
  [(SGSMMutableSearchState *)self->_searchState commit];
  [(SGSMMutableSearchState *)self->_searchState setJustEngaged];
  [(SGSMFeedbackListener *)self _saveAndUnsetState];
}

- (void)didEngageSuggestion:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v4 = (SGSMMutableSearchState *)a3;
  [(SGSMFeedbackListener *)self _restoreStateIfUnset];
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG))
  {
    int v6 = 138412290;
    uint64_t v7 = v4;
    _os_log_debug_impl(&dword_224D4A000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG, "SGSM: didEngageSuggestion: %@", (uint8_t *)&v6, 0xCu);
  }
  [(SGSMMutableSearchState *)self->_searchState scoreAsOtherConversion];
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG))
  {
    searchState = self->_searchState;
    int v6 = 138412290;
    uint64_t v7 = searchState;
    _os_log_debug_impl(&dword_224D4A000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG, "SGSM: state: %@", (uint8_t *)&v6, 0xCu);
  }
  [(SGSMMutableSearchState *)self->_searchState commit];
  [(SGSMMutableSearchState *)self->_searchState setJustEngaged];
  [(SGSMFeedbackListener *)self _saveAndUnsetState];
}

- (void)didEngageResult:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v4 = (SGSMMutableSearchState *)a3;
  [(SGSMFeedbackListener *)self _restoreStateIfUnset];
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG))
  {
    int v20 = 138412290;
    double v21 = v4;
    _os_log_debug_impl(&dword_224D4A000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG, "SGSM: didEngageResult: %@", (uint8_t *)&v20, 0xCu);
  }
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG))
  {
    int v17 = [(SGSMMutableSearchState *)v4 result];
    v18 = [v17 resultBundleId];
    int v20 = 138412290;
    double v21 = v18;
    _os_log_debug_impl(&dword_224D4A000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG, "SGSM: didEngageResult.resultBundleId: %@", (uint8_t *)&v20, 0xCu);
  }
  v5 = [(SGSMMutableSearchState *)v4 result];
  int v6 = [v5 resultBundleId];
  int v7 = [v6 isEqualToString:@"com.apple.CoreSuggestions"];

  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v20) = 0;
      _os_log_debug_impl(&dword_224D4A000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG, "SGSM: scoring as contact conversion", (uint8_t *)&v20, 2u);
    }
    [(SGSMMutableSearchState *)self->_searchState scoreAsContactConversion];
  }
  else
  {
    uint64_t v8 = [(SGSMMutableSearchState *)v4 result];
    uint64_t v9 = [v8 resultBundleId];
    int v10 = [v9 isEqualToString:@"com.apple.mobilecal"];

    uint64_t v11 = [(SGSMMutableSearchState *)v4 result];
    uint64_t v12 = v11;
    if (v10)
    {
      char v13 = [(SGSMFeedbackListener *)self _eventIdentifierFromSearchResult:v11];

      if (v13)
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG))
        {
          int v20 = 138412290;
          double v21 = v13;
          _os_log_debug_impl(&dword_224D4A000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG, "SGSM: scoring event with identifier = %@ as event conversion.", (uint8_t *)&v20, 0xCu);
        }
        [(SGSuggestionsServiceEventsProtocol *)self->_suggestionsService logEventInteractionForEventWithExternalIdentifier:v13 interface:19 actionType:6];
      }
    }
    else
    {
      v14 = [v11 resultBundleId];
      int v15 = [v14 isEqualToString:@"com.apple.MobileAddressBook"];

      BOOL v16 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG);
      if (v15)
      {
        if (v16)
        {
          LOWORD(v20) = 0;
          _os_log_debug_impl(&dword_224D4A000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG, "SGSM: curated contact engaged, counting as a loss", (uint8_t *)&v20, 2u);
        }
        [(SGSMMutableSearchState *)self->_searchState scoreAsContactLoss];
      }
      else
      {
        if (v16)
        {
          LOWORD(v20) = 0;
          _os_log_debug_impl(&dword_224D4A000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG, "SGSM: scoring as non opportunity", (uint8_t *)&v20, 2u);
        }
        [(SGSMMutableSearchState *)self->_searchState scoreAsOtherConversion];
      }
    }
  }
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG))
  {
    searchState = self->_searchState;
    int v20 = 138412290;
    double v21 = searchState;
    _os_log_debug_impl(&dword_224D4A000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG, "SGSM: state: %@", (uint8_t *)&v20, 0xCu);
  }
  [(SGSMMutableSearchState *)self->_searchState commit];
  [(SGSMMutableSearchState *)self->_searchState setJustEngaged];
  [(SGSMFeedbackListener *)self _saveAndUnsetState];
}

- (id)_eventIdentifierFromSearchResult:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (!v3) {
    goto LABEL_4;
  }
  v5 = [v3 resultBundleId];
  if ([v5 isEqualToString:@"com.apple.mobilecal"])
  {
    int v6 = [v4 identifier];
    char v7 = [v6 isEqualToString:@"com.apple.mobilecal"];

    if (v7)
    {
LABEL_4:
      id v8 = 0;
      goto LABEL_11;
    }
    uint64_t v9 = [v4 identifier];
    int v10 = [v9 componentsSeparatedByString:@"."];
    uint64_t v11 = [v10 firstObject];
    uint64_t v12 = [MEMORY[0x263F08708] whitespaceCharacterSet];
    v5 = [v11 stringByTrimmingCharactersInSet:v12];

    if ([v5 length]) {
      char v13 = v5;
    }
    else {
      char v13 = 0;
    }
    id v8 = v13;
  }
  else
  {
    id v8 = 0;
  }

LABEL_11:
  return v8;
}

- (void)_saveAndUnsetState
{
  searchState = self->_searchState;
  if (searchState)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v5 = 0;
      _os_log_debug_impl(&dword_224D4A000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG, "SGSM: saving search state", v5, 2u);
      searchState = self->_searchState;
    }
    objc_storeStrong((id *)&self->_previousState, searchState);
    [(SGSMMutableSearchState *)self->_previousState resetConversionCounts];
    v4 = self->_searchState;
    self->_searchState = 0;
  }
}

- (SGSMFeedbackListener)init
{
  v9.receiver = self;
  v9.super_class = (Class)SGSMFeedbackListener;
  v2 = [(SGSMFeedbackListener *)&v9 init];
  id v3 = v2;
  if (v2)
  {
    [(SGSMFeedbackListener *)v2 _resetState];
    uint64_t v4 = [MEMORY[0x263F38270] serviceForEvents];
    suggestionsService = v3->_suggestionsService;
    v3->_suggestionsService = (SGSuggestionsServiceEventsProtocol *)v4;

    uint64_t v6 = objc_opt_new();
    eventLastInteractionTime = v3->_eventLastInteractionTime;
    v3->_eventLastInteractionTime = (NSCache *)v6;

    [(NSCache *)v3->_eventLastInteractionTime setCountLimit:4];
  }
  return v3;
}

@end
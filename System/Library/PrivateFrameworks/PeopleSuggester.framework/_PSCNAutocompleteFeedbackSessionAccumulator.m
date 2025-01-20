@interface _PSCNAutocompleteFeedbackSessionAccumulator
+ (id)parseSubmodel:(id)a3;
- (NSMutableArray)metricsForImpressions;
- (NSMutableArray)metricsForSubmodelImpressions;
- (NSMutableArray)vendedSuggestionEvents;
- (_CDInteraction)interaction;
- (_PSCNAutocompleteFeedbackActionStatistics)metricsForAction;
- (_PSCNAutocompleteFeedbackSessionAccumulator)init;
- (void)updateWithFeedback:(id)a3;
- (void)updateWithInteraction:(id)a3;
- (void)updateWithTappedSuggestion:(id)a3;
- (void)updateWithVendedSuggestions:(id)a3 reportTime:(id)a4;
@end

@implementation _PSCNAutocompleteFeedbackSessionAccumulator

+ (id)parseSubmodel:(id)a3
{
  id v3 = a3;
  v4 = [v3 reason];

  if (v4)
  {
    v5 = NSString;
    v6 = [v3 reason];
    v7 = [v5 stringWithString:v6];
  }
  else
  {
    v7 = @"Unknown";
  }

  return v7;
}

- (_PSCNAutocompleteFeedbackSessionAccumulator)init
{
  v12.receiver = self;
  v12.super_class = (Class)_PSCNAutocompleteFeedbackSessionAccumulator;
  v2 = [(_PSCNAutocompleteFeedbackSessionAccumulator *)&v12 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    vendedSuggestionEvents = v2->_vendedSuggestionEvents;
    v2->_vendedSuggestionEvents = (NSMutableArray *)v3;

    uint64_t v5 = objc_opt_new();
    metricsForImpressions = v2->_metricsForImpressions;
    v2->_metricsForImpressions = (NSMutableArray *)v5;

    uint64_t v7 = objc_opt_new();
    metricsForSubmodelImpressions = v2->_metricsForSubmodelImpressions;
    v2->_metricsForSubmodelImpressions = (NSMutableArray *)v7;

    uint64_t v9 = objc_opt_new();
    metricsForAction = v2->_metricsForAction;
    v2->_metricsForAction = (_PSCNAutocompleteFeedbackActionStatistics *)v9;
  }
  return v2;
}

- (void)updateWithInteraction:(id)a3
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  v6 = [v4 sender];
  uint64_t v7 = [v6 identifier];

  if (v7)
  {
    v8 = [v4 sender];
    uint64_t v9 = [v8 identifier];
    [v5 addObject:v9];
  }
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  v53 = (_CDInteraction *)v4;
  v10 = [v4 recipients];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v67 objects:v73 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v68;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v68 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v67 + 1) + 8 * i);
        v16 = [v15 identifier];

        if (v16)
        {
          v17 = [v15 identifier];
          [v5 addObject:v17];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v67 objects:v73 count:16];
    }
    while (v12);
  }

  if ([(NSMutableArray *)self->_vendedSuggestionEvents count])
  {
    uint64_t v18 = 0;
    v58 = self;
    do
    {
      uint64_t v55 = v18;
      v19 = [(NSMutableArray *)self->_vendedSuggestionEvents objectAtIndexedSubscript:v18];
      v20 = [v19 vendedSuggestions];
      v21 = [v20 suggestions];

      long long v65 = 0u;
      long long v66 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      obuint64_t j = v21;
      uint64_t v57 = [obj countByEnumeratingWithState:&v63 objects:v72 count:16];
      if (v57)
      {
        uint64_t v56 = *(void *)v64;
        uint64_t v22 = 1;
        do
        {
          for (uint64_t j = 0; j != v57; ++j)
          {
            if (*(void *)v64 != v56) {
              objc_enumerationMutation(obj);
            }
            v24 = *(void **)(*((void *)&v63 + 1) + 8 * j);
            v25 = [(id)objc_opt_class() parseSubmodel:v24];
            long long v59 = 0u;
            long long v60 = 0u;
            long long v61 = 0u;
            long long v62 = 0u;
            v26 = [v24 recipients];
            uint64_t v27 = [v26 countByEnumeratingWithState:&v59 objects:v71 count:16];
            if (v27)
            {
              uint64_t v28 = v27;
              uint64_t v29 = *(void *)v60;
              while (2)
              {
                for (uint64_t k = 0; k != v28; ++k)
                {
                  if (*(void *)v60 != v29) {
                    objc_enumerationMutation(v26);
                  }
                  v31 = [*(id *)(*((void *)&v59 + 1) + 8 * k) handle];
                  int v32 = [v5 containsObject:v31];

                  if (v32)
                  {
                    v33 = [(NSMutableArray *)v58->_metricsForImpressions objectAtIndexedSubscript:v55];
                    objc_msgSend(v33, "setCountUsed:", objc_msgSend(v33, "countUsed") + 1);

                    v34 = [(NSMutableArray *)v58->_metricsForImpressions objectAtIndexedSubscript:v55];
                    objc_msgSend(v34, "setTotalRankUsed:", objc_msgSend(v34, "totalRankUsed") + v22);

                    v35 = [(NSMutableArray *)v58->_metricsForImpressions objectAtIndexedSubscript:v55];
                    [v35 setHighestRankUsed:v22];

                    v36 = [(NSMutableArray *)v58->_metricsForImpressions objectAtIndexedSubscript:v55];
                    uint64_t v37 = [v36 lowestRankUsed];
                    if (v37) {
                      uint64_t v38 = v37;
                    }
                    else {
                      uint64_t v38 = v22;
                    }
                    v39 = [(NSMutableArray *)v58->_metricsForImpressions objectAtIndexedSubscript:v55];
                    [v39 setLowestRankUsed:v38];

                    v40 = [(NSMutableArray *)v58->_metricsForSubmodelImpressions objectAtIndexedSubscript:v55];
                    v41 = [v40 objectForKeyedSubscript:v25];
                    objc_msgSend(v41, "setCountUsed:", objc_msgSend(v41, "countUsed") + 1);

                    v42 = [(NSMutableArray *)v58->_metricsForSubmodelImpressions objectAtIndexedSubscript:v55];
                    v43 = [v42 objectForKeyedSubscript:v25];
                    objc_msgSend(v43, "setTotalRankUsed:", objc_msgSend(v43, "totalRankUsed") + v22);

                    v44 = [(NSMutableArray *)v58->_metricsForSubmodelImpressions objectAtIndexedSubscript:v55];
                    v45 = [v44 objectForKeyedSubscript:v25];
                    [v45 setHighestRankUsed:v22];

                    v46 = [(NSMutableArray *)v58->_metricsForSubmodelImpressions objectAtIndexedSubscript:v55];
                    v47 = [v46 objectForKeyedSubscript:v25];
                    uint64_t v48 = [v47 lowestRankUsed];
                    if (v48) {
                      uint64_t v49 = v48;
                    }
                    else {
                      uint64_t v49 = v22;
                    }
                    v50 = [(NSMutableArray *)v58->_metricsForSubmodelImpressions objectAtIndexedSubscript:v55];
                    v51 = [v50 objectForKeyedSubscript:v25];
                    [v51 setLowestRankUsed:v49];

                    [(_PSCNAutocompleteFeedbackActionStatistics *)v58->_metricsForAction setCountUsedSuggestions:[(_PSCNAutocompleteFeedbackActionStatistics *)v58->_metricsForAction countUsedSuggestions]+ 1];
                    goto LABEL_35;
                  }
                }
                uint64_t v28 = [v26 countByEnumeratingWithState:&v59 objects:v71 count:16];
                if (v28) {
                  continue;
                }
                break;
              }
            }
LABEL_35:

            ++v22;
            self = v58;
          }
          uint64_t v57 = [obj countByEnumeratingWithState:&v63 objects:v72 count:16];
        }
        while (v57);
      }

      uint64_t v18 = v55 + 1;
    }
    while (v55 + 1 < (unint64_t)[(NSMutableArray *)self->_vendedSuggestionEvents count]);
  }
  interaction = self->_interaction;
  self->_interaction = v53;
}

- (void)updateWithFeedback:(id)a3
{
  id v9 = a3;
  if ([v9 feedbackType] == 3)
  {
    id v4 = [v9 tappedSuggestion];
    uint64_t v5 = [v4 suggestion];
    [(_PSCNAutocompleteFeedbackSessionAccumulator *)self updateWithTappedSuggestion:v5];
  }
  else if ([v9 feedbackType] == 2)
  {
    v6 = [v9 vendedSuggestions];
    uint64_t v7 = [v6 suggestions];
    v8 = [v9 reportTime];
    [(_PSCNAutocompleteFeedbackSessionAccumulator *)self updateWithVendedSuggestions:v7 reportTime:v8];

    [(NSMutableArray *)self->_vendedSuggestionEvents addObject:v9];
  }
}

- (void)updateWithTappedSuggestion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMutableArray *)self->_vendedSuggestionEvents lastObject];
  v6 = [v5 vendedSuggestions];
  uint64_t v7 = [v6 suggestions];

  if (!v7)
  {
    uint64_t v12 = +[_PSLogging feedbackChannel];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[_PSCNAutocompleteFeedbackSessionAccumulator updateWithTappedSuggestion:](v12);
    }
    goto LABEL_7;
  }
  v8 = [(NSMutableArray *)self->_vendedSuggestionEvents lastObject];
  id v9 = [v8 vendedSuggestions];
  v10 = [v9 suggestions];
  uint64_t v11 = [v10 indexOfObject:v4];

  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v12 = +[_PSLogging feedbackChannel];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[_PSCNAutocompleteFeedbackSessionAccumulator updateWithTappedSuggestion:](v12);
    }
LABEL_7:

    goto LABEL_15;
  }
  uint64_t v13 = [(id)objc_opt_class() parseSubmodel:v4];
  v14 = [(NSMutableArray *)self->_metricsForImpressions lastObject];
  objc_msgSend(v14, "setCountTapped:", objc_msgSend(v14, "countTapped") + 1);

  v15 = [(NSMutableArray *)self->_metricsForImpressions lastObject];
  objc_msgSend(v15, "setTotalRankTapped:", objc_msgSend(v15, "totalRankTapped") + v11 + 1);

  v16 = [(NSMutableArray *)self->_metricsForImpressions lastObject];
  [v16 setHighestRankTapped:v11 + 1];

  v17 = [(NSMutableArray *)self->_metricsForImpressions lastObject];
  uint64_t v18 = [v17 lowestRankTapped];
  if (v18) {
    uint64_t v19 = v18;
  }
  else {
    uint64_t v19 = v11 + 1;
  }
  v20 = [(NSMutableArray *)self->_metricsForImpressions lastObject];
  [v20 setLowestRankTapped:v19];

  v21 = [(NSMutableArray *)self->_metricsForSubmodelImpressions lastObject];
  uint64_t v22 = [v21 objectForKeyedSubscript:v13];
  objc_msgSend(v22, "setCountTapped:", objc_msgSend(v22, "countTapped") + 1);

  v23 = [(NSMutableArray *)self->_metricsForSubmodelImpressions lastObject];
  v24 = [v23 objectForKeyedSubscript:v13];
  objc_msgSend(v24, "setTotalRankTapped:", objc_msgSend(v24, "totalRankTapped") + v11 + 1);

  v25 = [(NSMutableArray *)self->_metricsForSubmodelImpressions lastObject];
  v26 = [v25 objectForKeyedSubscript:v13];
  [v26 setHighestRankTapped:v11 + 1];

  uint64_t v27 = [(NSMutableArray *)self->_metricsForSubmodelImpressions lastObject];
  uint64_t v28 = [v27 objectForKeyedSubscript:v13];
  uint64_t v29 = [v28 lowestRankTapped];
  if (v29) {
    uint64_t v30 = v29;
  }
  else {
    uint64_t v30 = v11 + 1;
  }
  v31 = [(NSMutableArray *)self->_metricsForSubmodelImpressions lastObject];
  int v32 = [v31 objectForKeyedSubscript:v13];
  [v32 setLowestRankTapped:v30];

  [(_PSCNAutocompleteFeedbackActionStatistics *)self->_metricsForAction setCountTappedSuggestions:[(_PSCNAutocompleteFeedbackActionStatistics *)self->_metricsForAction countTappedSuggestions]+ 1];
LABEL_15:
}

- (void)updateWithVendedSuggestions:(id)a3 reportTime:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = objc_opt_new();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = objc_msgSend((id)objc_opt_class(), "parseSubmodel:", *(void *)(*((void *)&v17 + 1) + 8 * v11), (void)v17);
        uint64_t v13 = [v6 objectForKeyedSubscript:v12];

        if (!v13)
        {
          v14 = objc_opt_new();
          [v6 setObject:v14 forKeyedSubscript:v12];
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  metricsForImpressions = self->_metricsForImpressions;
  v16 = objc_opt_new();
  [(NSMutableArray *)metricsForImpressions addObject:v16];

  [(NSMutableArray *)self->_metricsForSubmodelImpressions addObject:v6];
}

- (_CDInteraction)interaction
{
  return self->_interaction;
}

- (NSMutableArray)vendedSuggestionEvents
{
  return self->_vendedSuggestionEvents;
}

- (NSMutableArray)metricsForImpressions
{
  return self->_metricsForImpressions;
}

- (NSMutableArray)metricsForSubmodelImpressions
{
  return self->_metricsForSubmodelImpressions;
}

- (_PSCNAutocompleteFeedbackActionStatistics)metricsForAction
{
  return self->_metricsForAction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricsForAction, 0);
  objc_storeStrong((id *)&self->_metricsForSubmodelImpressions, 0);
  objc_storeStrong((id *)&self->_metricsForImpressions, 0);
  objc_storeStrong((id *)&self->_vendedSuggestionEvents, 0);

  objc_storeStrong((id *)&self->_interaction, 0);
}

- (void)updateWithTappedSuggestion:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A314B000, log, OS_LOG_TYPE_DEBUG, "_PSCNAutocompleteFeedbackSessionAccumulator: Skipping processing of tapped suggestion feedback event - no prior vended suggestions event to match against.", v1, 2u);
}

- (void)updateWithTappedSuggestion:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A314B000, log, OS_LOG_TYPE_ERROR, "_PSCNAutocompleteFeedbackSessionAccumulator: Skipping processing of tapped suggestion feedback event - tapped suggestion could not be found in list of prior vended suggestions!", v1, 2u);
}

@end
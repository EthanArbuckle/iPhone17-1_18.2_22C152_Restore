@interface PPSocialHighlightEngagementProvider
- (PPSocialHighlightEngagementProvider)initWithFeedbackType:(unint64_t)a3 feedbackGroupByBlock:(id)a4 highlightKeyBlock:(id)a5 highlights:(id)a6;
- (PPSocialHighlightEngagementProvider)initWithFeedbackType:(unint64_t)a3 feedbackGroupByBlock:(id)a4 highlightKeyBlock:(id)a5 intervalSinceNow:(double)a6 highlights:(id)a7;
- (id)applyFeedback:(id)a3;
- (id)valueForHighlight:(id)a3;
@end

@implementation PPSocialHighlightEngagementProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_earliestDateToAccept, 0);
  objc_storeStrong(&self->_keyBlock, 0);
  objc_storeStrong(&self->_groupByBlock, 0);
  objc_storeStrong((id *)&self->_engagementsByKey, 0);
}

- (PPSocialHighlightEngagementProvider)initWithFeedbackType:(unint64_t)a3 feedbackGroupByBlock:(id)a4 highlightKeyBlock:(id)a5 intervalSinceNow:(double)a6 highlights:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  v39.receiver = self;
  v39.super_class = (Class)PPSocialHighlightEngagementProvider;
  v15 = [(PPSocialHighlightEngagementProvider *)&v39 init];
  v16 = v15;
  if (v15)
  {
    v15->_unint64_t feedbackType = a3;
    uint64_t v17 = [v12 copy];
    id groupByBlock = v16->_groupByBlock;
    v16->_id groupByBlock = (id)v17;

    uint64_t v19 = [v13 copy];
    id keyBlock = v16->_keyBlock;
    v16->_id keyBlock = (id)v19;

    id v21 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __127__PPSocialHighlightEngagementProvider_initWithFeedbackType_feedbackGroupByBlock_highlightKeyBlock_intervalSinceNow_highlights___block_invoke;
    v37[3] = &unk_1E65D8300;
    id v38 = v13;
    v22 = objc_msgSend(v14, "_pas_mappedArrayWithTransform:", v37);
    v23 = (void *)[v21 initWithArray:v22];

    id v24 = objc_alloc(MEMORY[0x1E4F1CA60]);
    v25 = objc_msgSend(MEMORY[0x1E4F1C978], "_pas_proxyArrayWithObject:repetitions:", &unk_1F2569380, objc_msgSend(v23, "count"));
    v26 = [v23 allObjects];
    uint64_t v27 = [v24 initWithObjects:v25 forKeys:v26];
    engagementsByKey = v16->_engagementsByKey;
    v16->_engagementsByKey = (NSMutableDictionary *)v27;

    uint64_t v29 = [objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:-a6];
    earliestDateToAccept = v16->_earliestDateToAccept;
    v16->_earliestDateToAccept = (NSDate *)v29;

    unint64_t feedbackType = v16->_feedbackType;
    BOOL v35 = a3 != 9 && feedbackType != 2 && a3 != 3 && feedbackType != 4;
    v16->_acceptOnlyPrimary = v35;
  }
  return v16;
}

- (PPSocialHighlightEngagementProvider)initWithFeedbackType:(unint64_t)a3 feedbackGroupByBlock:(id)a4 highlightKeyBlock:(id)a5 highlights:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = objc_opt_new();
  [v13 timeIntervalSince1970];
  id v14 = -[PPSocialHighlightEngagementProvider initWithFeedbackType:feedbackGroupByBlock:highlightKeyBlock:intervalSinceNow:highlights:](self, "initWithFeedbackType:feedbackGroupByBlock:highlightKeyBlock:intervalSinceNow:highlights:", a3, v12, v11, v10);

  return v14;
}

- (id)applyFeedback:(id)a3
{
  id v5 = a3;
  v6 = [v5 eventBody];

  if (!v6)
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"PPSocialHighlightFeatureProviders.m", 69, @"Invalid parameter not satisfying: %@", @"feedback.eventBody != nil" object file lineNumber description];
  }
  v7 = [v5 eventBody];
  if ([v7 feedbackType] == self->_feedbackType)
  {
    uint64_t v8 = [v7 highlight];
    if (v8)
    {
      v9 = (void *)v8;
      id v10 = [v7 feedbackCreationDate];
      uint64_t v11 = [v10 compare:self->_earliestDateToAccept];

      if (v11 == 1)
      {
        if (!self->_acceptOnlyPrimary
          || ([v7 highlight],
              id v12 = objc_claimAutoreleasedReturnValue(),
              [v12 isPrimary],
              id v13 = objc_claimAutoreleasedReturnValue(),
              char v14 = [MEMORY[0x1E4F1CC28] isEqual:v13],
              v13,
              v12,
              (v14 & 1) == 0))
        {
          v15 = (*((void (**)(void))self->_groupByBlock + 2))();
          if (v15)
          {
            v16 = [(NSMutableDictionary *)self->_engagementsByKey objectForKeyedSubscript:v15];

            if (v16)
            {
              uint64_t v17 = [(NSMutableDictionary *)self->_engagementsByKey objectForKeyedSubscript:v15];
              uint64_t v18 = [v17 unsignedIntegerValue];

              uint64_t v19 = [NSNumber numberWithUnsignedInteger:v18 + 1];
              [(NSMutableDictionary *)self->_engagementsByKey setObject:v19 forKeyedSubscript:v15];
            }
          }
        }
      }
    }
  }
  v20 = self;

  return v20;
}

- (id)valueForHighlight:(id)a3
{
  v4 = (*((void (**)(void))self->_keyBlock + 2))();
  id v5 = &unk_1F256B240;
  if (v4)
  {
    uint64_t v6 = [(NSMutableDictionary *)self->_engagementsByKey objectForKeyedSubscript:v4];
    v7 = (void *)v6;
    if (v6) {
      uint64_t v8 = (void *)v6;
    }
    else {
      uint64_t v8 = &unk_1F256B240;
    }
    id v5 = v8;
  }
  return v5;
}

uint64_t __127__PPSocialHighlightEngagementProvider_initWithFeedbackType_feedbackGroupByBlock_highlightKeyBlock_intervalSinceNow_highlights___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end
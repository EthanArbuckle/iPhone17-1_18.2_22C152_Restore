@interface PPSocialHighlightFractionalEngagementProvider
- (PPSocialHighlightFractionalEngagementProvider)initWithFeedbackGroupByBlock:(id)a3 highlightKeyBlock:(id)a4 highlights:(id)a5;
- (id)applyFeedback:(id)a3;
- (id)valueForHighlight:(id)a3;
@end

@implementation PPSocialHighlightFractionalEngagementProvider

- (void).cxx_destruct
{
  objc_storeStrong(&self->_keyBlock, 0);
  objc_storeStrong(&self->_groupByBlock, 0);
  objc_storeStrong((id *)&self->_offeredByKey, 0);
  objc_storeStrong((id *)&self->_engagementsByKey, 0);
}

- (PPSocialHighlightFractionalEngagementProvider)initWithFeedbackGroupByBlock:(id)a3 highlightKeyBlock:(id)a4 highlights:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v32.receiver = self;
  v32.super_class = (Class)PPSocialHighlightFractionalEngagementProvider;
  v11 = [(PPSocialHighlightFractionalEngagementProvider *)&v32 init];
  if (v11)
  {
    id v12 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __107__PPSocialHighlightFractionalEngagementProvider_initWithFeedbackGroupByBlock_highlightKeyBlock_highlights___block_invoke;
    v30[3] = &unk_1E65D8300;
    id v29 = v9;
    id v31 = v29;
    v13 = objc_msgSend(v10, "_pas_mappedArrayWithTransform:", v30);
    v14 = (void *)[v12 initWithArray:v13];
    v15 = [v14 allObjects];

    id v16 = objc_alloc(MEMORY[0x1E4F1CA60]);
    v17 = objc_msgSend(MEMORY[0x1E4F1C978], "_pas_proxyArrayWithObject:repetitions:", &unk_1F2569380, objc_msgSend(v15, "count"));
    uint64_t v18 = [v16 initWithObjects:v17 forKeys:v15];
    engagementsByKey = v11->_engagementsByKey;
    v11->_engagementsByKey = (NSMutableDictionary *)v18;

    id v20 = objc_alloc(MEMORY[0x1E4F1CA60]);
    v21 = objc_msgSend(MEMORY[0x1E4F1C978], "_pas_proxyArrayWithObject:repetitions:", &unk_1F2569380, objc_msgSend(v15, "count"));
    uint64_t v22 = [v20 initWithObjects:v21 forKeys:v15];
    offeredByKey = v11->_offeredByKey;
    v11->_offeredByKey = (NSMutableDictionary *)v22;

    uint64_t v24 = [v8 copy];
    id groupByBlock = v11->_groupByBlock;
    v11->_id groupByBlock = (id)v24;

    uint64_t v26 = [v29 copy];
    id keyBlock = v11->_keyBlock;
    v11->_id keyBlock = (id)v26;
  }
  return v11;
}

- (id)applyFeedback:(id)a3
{
  id v5 = a3;
  v6 = [v5 eventBody];

  if (!v6)
  {
    id v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"PPSocialHighlightFeatureProviders.m", 121, @"Invalid parameter not satisfying: %@", @"feedback.eventBody != nil" object file lineNumber description];
  }
  v7 = [v5 eventBody];
  id v8 = [v7 highlight];
  if (!v8 || [v7 feedbackType] != 1 && objc_msgSend(v7, "feedbackType")) {
    goto LABEL_14;
  }
  id v9 = [v7 highlight];
  id v10 = [v9 isPrimary];
  char v11 = [MEMORY[0x1E4F1CC28] isEqual:v10];

  if ((v11 & 1) == 0)
  {
    id v8 = (*((void (**)(void))self->_groupByBlock + 2))();
    if (!v8) {
      goto LABEL_14;
    }
    p_engagementsByKey = &self->_engagementsByKey;
    uint64_t v13 = [(NSMutableDictionary *)self->_engagementsByKey objectForKeyedSubscript:v8];
    if (!v13) {
      goto LABEL_14;
    }
    v14 = (void *)v13;
    v15 = [(NSMutableDictionary *)self->_offeredByKey objectForKeyedSubscript:v8];

    if (!v15) {
      goto LABEL_14;
    }
    if ([v7 feedbackType] != 1)
    {
      if ([v7 feedbackType])
      {
LABEL_14:

        goto LABEL_15;
      }
      p_engagementsByKey = &self->_offeredByKey;
    }
    id v16 = [(NSMutableDictionary *)*p_engagementsByKey objectForKeyedSubscript:v8];
    uint64_t v17 = [v16 unsignedIntegerValue];

    uint64_t v18 = [NSNumber numberWithUnsignedInteger:v17 + 1];
    [(NSMutableDictionary *)*p_engagementsByKey setObject:v18 forKeyedSubscript:v8];

    goto LABEL_14;
  }
LABEL_15:

  return self;
}

- (id)valueForHighlight:(id)a3
{
  v4 = (*((void (**)(void))self->_keyBlock + 2))();
  if (!v4) {
    goto LABEL_3;
  }
  id v5 = [(NSMutableDictionary *)self->_engagementsByKey objectForKeyedSubscript:v4];
  unint64_t v6 = [v5 unsignedIntegerValue];

  v7 = [(NSMutableDictionary *)self->_offeredByKey objectForKeyedSubscript:v4];
  unint64_t v8 = [v7 unsignedIntegerValue];

  if (v6 | v8)
  {
    if (v6) {
      BOOL v11 = v8 == 0;
    }
    else {
      BOOL v11 = 0;
    }
    if (v11)
    {
      id v9 = &unk_1F2569398;
    }
    else
    {
      id v9 = [NSNumber numberWithDouble:(double)v6 / (double)v8];
    }
  }
  else
  {
LABEL_3:
    id v9 = &unk_1F256B250;
  }

  return v9;
}

uint64_t __107__PPSocialHighlightFractionalEngagementProvider_initWithFeedbackGroupByBlock_highlightKeyBlock_highlights___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end
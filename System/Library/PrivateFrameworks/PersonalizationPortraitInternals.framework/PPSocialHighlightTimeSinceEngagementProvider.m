@interface PPSocialHighlightTimeSinceEngagementProvider
- (PPSocialHighlightTimeSinceEngagementProvider)initWithFeedbackType:(unint64_t)a3 feedbackGroupByBlock:(id)a4 highlightKeyBlock:(id)a5 mostRecent:(BOOL)a6 highlights:(id)a7;
- (id)applyFeedback:(id)a3;
- (id)valueForHighlight:(id)a3;
@end

@implementation PPSocialHighlightTimeSinceEngagementProvider

- (PPSocialHighlightTimeSinceEngagementProvider)initWithFeedbackType:(unint64_t)a3 feedbackGroupByBlock:(id)a4 highlightKeyBlock:(id)a5 mostRecent:(BOOL)a6 highlights:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  v35.receiver = self;
  v35.super_class = (Class)PPSocialHighlightTimeSinceEngagementProvider;
  v15 = [(PPSocialHighlightTimeSinceEngagementProvider *)&v35 init];
  if (v15)
  {
    id v16 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __130__PPSocialHighlightTimeSinceEngagementProvider_initWithFeedbackType_feedbackGroupByBlock_highlightKeyBlock_mostRecent_highlights___block_invoke;
    v33[3] = &unk_1E65D8300;
    id v17 = v13;
    id v34 = v17;
    v18 = objc_msgSend(v14, "_pas_mappedArrayWithTransform:", v33);
    v19 = (void *)[v16 initWithArray:v18];
    v20 = [v19 allObjects];

    BOOL v32 = a6;
    if (a6)
    {
      unint64_t v21 = a3;
      [MEMORY[0x1E4F1C9C8] distantPast];
    }
    else
    {
      unint64_t v21 = a3;
      [MEMORY[0x1E4F1C9C8] distantFuture];
    v22 = };
    id v23 = objc_alloc(MEMORY[0x1E4F1CA60]);
    v24 = objc_msgSend(MEMORY[0x1E4F1C978], "_pas_proxyArrayWithObject:repetitions:", v22, objc_msgSend(v20, "count"));
    uint64_t v25 = [v23 initWithObjects:v24 forKeys:v20];
    dates = v15->_dates;
    v15->_dates = (NSMutableDictionary *)v25;

    uint64_t v27 = [v17 copy];
    id keyBlock = v15->_keyBlock;
    v15->_id keyBlock = (id)v27;

    uint64_t v29 = [v12 copy];
    id groupByBlock = v15->_groupByBlock;
    v15->_id groupByBlock = (id)v29;

    v15->_feedbackType = v21;
    v15->_mostRecent = v32;
  }
  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_groupByBlock, 0);
  objc_storeStrong(&self->_keyBlock, 0);
  objc_storeStrong((id *)&self->_dates, 0);
}

- (id)applyFeedback:(id)a3
{
  id v5 = a3;
  v6 = [v5 eventBody];

  if (!v6)
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PPSocialHighlightFeatureProviders.m", 226, @"Invalid parameter not satisfying: %@", @"feedback.eventBody != nil" object file lineNumber description];
  }
  v7 = [v5 eventBody];
  if ([v7 feedbackType] == self->_feedbackType)
  {
    v8 = (*((void (**)(void))self->_groupByBlock + 2))();
    if (v8)
    {
      v9 = [(NSMutableDictionary *)self->_dates objectForKeyedSubscript:v8];

      if (v9)
      {
        if (self->_mostRecent) {
          uint64_t v10 = -1;
        }
        else {
          uint64_t v10 = 1;
        }
        v11 = [(NSMutableDictionary *)self->_dates objectForKeyedSubscript:v8];
        id v12 = [v7 feedbackCreationDate];
        uint64_t v13 = [v11 compare:v12];

        if (v13 == v10)
        {
          id v14 = [v7 feedbackCreationDate];
          [(NSMutableDictionary *)self->_dates setObject:v14 forKeyedSubscript:v8];
        }
      }
    }
  }
  return self;
}

- (id)valueForHighlight:(id)a3
{
  v4 = (*((void (**)(void))self->_keyBlock + 2))();
  if (!v4)
  {
    v9 = NSNumber;
    id v5 = [MEMORY[0x1E4F1C9C8] distantPast];
    [v5 timeIntervalSinceNow];
    goto LABEL_7;
  }
  id v5 = [(NSMutableDictionary *)self->_dates objectForKeyedSubscript:v4];
  v6 = [MEMORY[0x1E4F1C9C8] distantFuture];
  int v7 = [v5 isEqualToDate:v6];

  if (v7)
  {
    uint64_t v8 = [MEMORY[0x1E4F1C9C8] distantPast];

    id v5 = (void *)v8;
  }
  v9 = NSNumber;
  if (v5)
  {
    [v5 timeIntervalSinceNow];
    double v11 = -v10;
LABEL_7:
    id v12 = [v9 numberWithDouble:v11];
    goto LABEL_9;
  }
  uint64_t v13 = [MEMORY[0x1E4F1C9C8] distantPast];
  [v13 timeIntervalSinceNow];
  id v12 = objc_msgSend(v9, "numberWithDouble:");

  id v5 = 0;
LABEL_9:

  return v12;
}

uint64_t __130__PPSocialHighlightTimeSinceEngagementProvider_initWithFeedbackType_feedbackGroupByBlock_highlightKeyBlock_mostRecent_highlights___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end
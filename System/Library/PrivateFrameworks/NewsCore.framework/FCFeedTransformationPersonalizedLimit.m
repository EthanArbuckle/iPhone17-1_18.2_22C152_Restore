@interface FCFeedTransformationPersonalizedLimit
+ (id)transformationWithPersonalizer:(id)a3 dateRange:(id)a4;
+ (id)transformationWithPersonalizer:(id)a3 timeInterval:(double)a4;
- (FCFeedPersonalizing)feedPersonalizer;
- (double)timeInterval;
- (id)transformFeedItems:(id)a3;
- (void)setFeedPersonalizer:(id)a3;
- (void)setTimeInterval:(double)a3;
@end

@implementation FCFeedTransformationPersonalizedLimit

+ (id)transformationWithPersonalizer:(id)a3 dateRange:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a3;
  if (([v5 isFinite] & 1) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v11 = (void *)[[NSString alloc] initWithFormat:@"personalization limit requires a finite date range"];
    int v12 = 136315906;
    v13 = "+[FCFeedTransformationPersonalizedLimit transformationWithPersonalizer:dateRange:]";
    __int16 v14 = 2080;
    v15 = "FCFeedTransformationPersonalize.m";
    __int16 v16 = 1024;
    int v17 = 140;
    __int16 v18 = 2114;
    v19 = v11;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v12, 0x26u);
  }
  v7 = objc_opt_new();
  [v7 setFeedPersonalizer:v6];

  [v5 absoluteTimeInterval];
  double v9 = v8;

  [v7 setTimeInterval:v9];
  return v7;
}

+ (id)transformationWithPersonalizer:(id)a3 timeInterval:(double)a4
{
  id v5 = a3;
  id v6 = objc_opt_new();
  [v6 setFeedPersonalizer:v5];

  [v6 setTimeInterval:a4];
  return v6;
}

- (id)transformFeedItems:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = NewsCoreUserDefaults();
  if ([v5 BOOLForKey:@"personalization_disabled"])
  {

LABEL_12:
    id v16 = v4;
    goto LABEL_13;
  }
  id v6 = [(FCFeedTransformationPersonalizedLimit *)self feedPersonalizer];

  if (!v6) {
    goto LABEL_12;
  }
  v7 = [MEMORY[0x1E4F1CA80] set];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v4;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "sourceChannelID", (void)v18);
        [v7 addObject:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  __int16 v14 = [(FCFeedTransformationPersonalizedLimit *)self feedPersonalizer];
  [(FCFeedTransformationPersonalizedLimit *)self timeInterval];
  objc_msgSend(v14, "limitItemsByFlowRate:timeInterval:publisherCount:", v8, objc_msgSend(v7, "count"), v15);
  id v16 = (id)objc_claimAutoreleasedReturnValue();

LABEL_13:
  return v16;
}

- (FCFeedPersonalizing)feedPersonalizer
{
  return self->_feedPersonalizer;
}

- (void)setFeedPersonalizer:(id)a3
{
}

- (double)timeInterval
{
  return self->_timeInterval;
}

- (void)setTimeInterval:(double)a3
{
  self->_timeInterval = a3;
}

- (void).cxx_destruct
{
}

@end
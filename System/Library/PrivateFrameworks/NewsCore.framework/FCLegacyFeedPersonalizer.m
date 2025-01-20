@interface FCLegacyFeedPersonalizer
- (FCFeedPersonalizing)feedPersonalizer;
- (FCLegacyFeedPersonalizer)init;
- (FCLegacyFeedPersonalizer)initWithFeedPersonalizer:(id)a3 functionProvider:(id)a4;
- (FCPersonalizationFunctionProviding)functionProvider;
- (double)decayedPublisherDiversificationPenalty;
- (id)diversifyItems:(id)a3 limit:(unint64_t)a4;
- (id)limitItemsByFlowRate:(id)a3 timeInterval:(double)a4 publisherCount:(unint64_t)a5;
- (id)limitItemsByMinimumItemQuality:(id)a3;
- (id)rankTagIDsDescending:(id)a3;
- (id)scoresForTagIDs:(id)a3;
- (id)sortItems:(id)a3 options:(int64_t)a4 configurationSet:(int64_t)a5;
- (void)prepareForUseWithCompletionHandler:(id)a3;
@end

@implementation FCLegacyFeedPersonalizer

- (FCLegacyFeedPersonalizer)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCLegacyFeedPersonalizer init]";
    __int16 v9 = 2080;
    v10 = "FCLegacyFeedPersonalizer.m";
    __int16 v11 = 1024;
    int v12 = 23;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCLegacyFeedPersonalizer init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (FCLegacyFeedPersonalizer)initWithFeedPersonalizer:(id)a3 functionProvider:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v12 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "feedPersonalizer");
    *(_DWORD *)buf = 136315906;
    v16 = "-[FCLegacyFeedPersonalizer initWithFeedPersonalizer:functionProvider:]";
    __int16 v17 = 2080;
    v18 = "FCLegacyFeedPersonalizer.m";
    __int16 v19 = 1024;
    int v20 = 28;
    __int16 v21 = 2114;
    v22 = v12;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v8) {
      goto LABEL_6;
    }
  }
  else if (v8)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    __int16 v13 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "functionProvider");
    *(_DWORD *)buf = 136315906;
    v16 = "-[FCLegacyFeedPersonalizer initWithFeedPersonalizer:functionProvider:]";
    __int16 v17 = 2080;
    v18 = "FCLegacyFeedPersonalizer.m";
    __int16 v19 = 1024;
    int v20 = 29;
    __int16 v21 = 2114;
    v22 = v13;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_6:
  v14.receiver = self;
  v14.super_class = (Class)FCLegacyFeedPersonalizer;
  __int16 v9 = [(FCLegacyFeedPersonalizer *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_feedPersonalizer, a3);
    objc_storeStrong((id *)&v10->_functionProvider, a4);
  }

  return v10;
}

- (void)prepareForUseWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(FCLegacyFeedPersonalizer *)self feedPersonalizer];
  [v5 prepareForUseWithCompletionHandler:v4];
}

- (id)rankTagIDsDescending:(id)a3
{
  id v4 = a3;
  id v5 = [(FCLegacyFeedPersonalizer *)self feedPersonalizer];
  id v6 = [v5 rankTagIDsDescending:v4];

  return v6;
}

- (id)scoresForTagIDs:(id)a3
{
  id v4 = a3;
  id v5 = [(FCLegacyFeedPersonalizer *)self feedPersonalizer];
  id v6 = [v5 scoresForTagIDs:v4];

  return v6;
}

- (double)decayedPublisherDiversificationPenalty
{
  v2 = [(FCLegacyFeedPersonalizer *)self feedPersonalizer];
  [v2 decayedPublisherDiversificationPenalty];
  double v4 = v3;

  return v4;
}

- (id)limitItemsByFlowRate:(id)a3 timeInterval:(double)a4 publisherCount:(unint64_t)a5
{
  id v8 = a3;
  __int16 v9 = [(FCLegacyFeedPersonalizer *)self feedPersonalizer];
  v10 = [v9 limitItemsByFlowRate:v8 timeInterval:a5 publisherCount:a4];

  return v10;
}

- (id)limitItemsByMinimumItemQuality:(id)a3
{
  id v4 = a3;
  id v5 = [(FCLegacyFeedPersonalizer *)self feedPersonalizer];
  id v6 = [v5 limitItemsByMinimumItemQuality:v4];

  return v6;
}

- (id)sortItems:(id)a3 options:(int64_t)a4 configurationSet:(int64_t)a5
{
  id v8 = a3;
  __int16 v9 = [(FCLegacyFeedPersonalizer *)self feedPersonalizer];
  v10 = [v9 sortItems:v8 options:a4 configurationSet:a5];

  return v10;
}

- (id)diversifyItems:(id)a3 limit:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(FCLegacyFeedPersonalizer *)self functionProvider];
  id v8 = [v7 diversifyItems:v6 limit:a4];

  return v8;
}

- (FCFeedPersonalizing)feedPersonalizer
{
  return self->_feedPersonalizer;
}

- (FCPersonalizationFunctionProviding)functionProvider
{
  return self->_functionProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_functionProvider, 0);
  objc_storeStrong((id *)&self->_feedPersonalizer, 0);
}

@end
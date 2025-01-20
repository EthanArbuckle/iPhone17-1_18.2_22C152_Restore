@interface FCAssertPreparedFeedPersonalizer
- (BOOL)isPreparedForUse;
- (FCAssertPreparedFeedPersonalizer)init;
- (FCAssertPreparedFeedPersonalizer)initWithTarget:(id)a3;
- (FCFeedPersonalizing)target;
- (double)decayedPublisherDiversificationPenalty;
- (id)limitItemsByFlowRate:(id)a3 timeInterval:(double)a4 publisherCount:(unint64_t)a5;
- (id)limitItemsByMinimumItemQuality:(id)a3;
- (id)rankTagIDsDescending:(id)a3;
- (id)scoresForTagIDs:(id)a3;
- (id)sortItems:(id)a3 options:(int64_t)a4 configurationSet:(int64_t)a5;
- (void)fetchAggregateMapForPersonalizingItem:(id)a3 completion:(id)a4;
- (void)prepareForUseWithCompletionHandler:(id)a3;
- (void)setPreparedForUse:(BOOL)a3;
@end

@implementation FCAssertPreparedFeedPersonalizer

uint64_t __71__FCAssertPreparedFeedPersonalizer_prepareForUseWithCompletionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setPreparedForUse:1];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)setPreparedForUse:(BOOL)a3
{
  self->_preparedForUse = a3;
}

- (void)prepareForUseWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = [(FCAssertPreparedFeedPersonalizer *)self target];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__FCAssertPreparedFeedPersonalizer_prepareForUseWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5B4CC80;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 prepareForUseWithCompletionHandler:v7];
}

- (FCFeedPersonalizing)target
{
  return self->_target;
}

- (FCAssertPreparedFeedPersonalizer)initWithTarget:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v9 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "target");
    *(_DWORD *)buf = 136315906;
    v12 = "-[FCAssertPreparedFeedPersonalizer initWithTarget:]";
    __int16 v13 = 2080;
    v14 = "FCAssertPreparedFeedPersonalizer.m";
    __int16 v15 = 1024;
    int v16 = 31;
    __int16 v17 = 2114;
    v18 = v9;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v10.receiver = self;
  v10.super_class = (Class)FCAssertPreparedFeedPersonalizer;
  id v6 = [(FCAssertPreparedFeedPersonalizer *)&v10 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_target, a3);
  }

  return v7;
}

- (FCAssertPreparedFeedPersonalizer)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    id v8 = "-[FCAssertPreparedFeedPersonalizer init]";
    __int16 v9 = 2080;
    objc_super v10 = "FCAssertPreparedFeedPersonalizer.m";
    __int16 v11 = 1024;
    int v12 = 26;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  id v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCAssertPreparedFeedPersonalizer init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (id)rankTagIDsDescending:(id)a3
{
  id v4 = a3;
  id v5 = [(FCAssertPreparedFeedPersonalizer *)self target];
  id v6 = [v5 rankTagIDsDescending:v4];

  return v6;
}

- (id)scoresForTagIDs:(id)a3
{
  id v4 = a3;
  id v5 = [(FCAssertPreparedFeedPersonalizer *)self target];
  id v6 = [v5 scoresForTagIDs:v4];

  return v6;
}

- (id)limitItemsByMinimumItemQuality:(id)a3
{
  id v4 = a3;
  id v5 = [(FCAssertPreparedFeedPersonalizer *)self target];
  id v6 = [v5 limitItemsByMinimumItemQuality:v4];

  return v6;
}

- (id)limitItemsByFlowRate:(id)a3 timeInterval:(double)a4 publisherCount:(unint64_t)a5
{
  id v8 = a3;
  __int16 v9 = [(FCAssertPreparedFeedPersonalizer *)self target];
  objc_super v10 = [v9 limitItemsByFlowRate:v8 timeInterval:a5 publisherCount:a4];

  return v10;
}

- (double)decayedPublisherDiversificationPenalty
{
  v2 = [(FCAssertPreparedFeedPersonalizer *)self target];
  [v2 decayedPublisherDiversificationPenalty];
  double v4 = v3;

  return v4;
}

- (id)sortItems:(id)a3 options:(int64_t)a4 configurationSet:(int64_t)a5
{
  id v8 = a3;
  __int16 v9 = [(FCAssertPreparedFeedPersonalizer *)self target];
  objc_super v10 = [v9 sortItems:v8 options:a4 configurationSet:a5];

  return v10;
}

- (void)fetchAggregateMapForPersonalizingItem:(id)a3 completion:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(FCAssertPreparedFeedPersonalizer *)self target];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    objc_super v10 = [(FCAssertPreparedFeedPersonalizer *)self target];
    [v10 fetchAggregateMapForPersonalizingItem:v6 completion:v7];
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      goto LABEL_5;
    }
    objc_super v10 = (void *)[[NSString alloc] initWithFormat:@"Case not implemented"];
    int v11 = 136315906;
    int v12 = "-[FCAssertPreparedFeedPersonalizer fetchAggregateMapForPersonalizingItem:completion:]";
    __int16 v13 = 2080;
    v14 = "FCAssertPreparedFeedPersonalizer.m";
    __int16 v15 = 1024;
    int v16 = 104;
    __int16 v17 = 2114;
    v18 = v10;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v11, 0x26u);
  }

LABEL_5:
}

- (BOOL)isPreparedForUse
{
  return self->_preparedForUse;
}

- (void).cxx_destruct
{
}

@end
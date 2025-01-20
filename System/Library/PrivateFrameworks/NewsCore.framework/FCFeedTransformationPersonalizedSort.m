@interface FCFeedTransformationPersonalizedSort
+ (id)transformationWithPersonalizer:(id)a3;
+ (id)transformationWithPersonalizer:(id)a3 configurationSet:(int64_t)a4;
+ (id)transformationWithPersonalizer:(id)a3 feedItemScores:(id)a4;
+ (id)transformationWithPersonalizer:(id)a3 feedItemScores:(id)a4 sortOptions:(int64_t)a5;
+ (id)transformationWithPersonalizer:(id)a3 feedItemScores:(id)a4 sortOptions:(int64_t)a5 configurationSet:(int64_t)a6;
+ (id)transformationWithPersonalizer:(id)a3 sortOptions:(int64_t)a4;
- (FCFeedPersonalizing)feedPersonalizer;
- (FCMapTable)feedItemScores;
- (id)personalizedHeadlines:(id)a3;
- (id)transformFeedItems:(id)a3;
- (id)transformHeadlines:(id)a3;
- (int64_t)configurationSet;
- (int64_t)sortOptions;
- (void)setConfigurationSet:(int64_t)a3;
- (void)setFeedItemScores:(id)a3;
- (void)setFeedPersonalizer:(id)a3;
- (void)setSortOptions:(int64_t)a3;
@end

@implementation FCFeedTransformationPersonalizedSort

+ (id)transformationWithPersonalizer:(id)a3 feedItemScores:(id)a4 sortOptions:(int64_t)a5 configurationSet:(int64_t)a6
{
  id v9 = a4;
  id v10 = a3;
  v11 = objc_opt_new();
  [v11 setFeedPersonalizer:v10];

  [v11 setFeedItemScores:v9];
  [v11 setSortOptions:a5];
  [v11 setConfigurationSet:a6];
  return v11;
}

+ (id)transformationWithPersonalizer:(id)a3 feedItemScores:(id)a4 sortOptions:(int64_t)a5
{
  return (id)[a1 transformationWithPersonalizer:a3 feedItemScores:a4 sortOptions:a5 configurationSet:0];
}

+ (id)transformationWithPersonalizer:(id)a3 feedItemScores:(id)a4
{
  return (id)[a1 transformationWithPersonalizer:a3 feedItemScores:a4 sortOptions:1];
}

+ (id)transformationWithPersonalizer:(id)a3 sortOptions:(int64_t)a4
{
  return (id)[a1 transformationWithPersonalizer:a3 feedItemScores:0 sortOptions:a4];
}

+ (id)transformationWithPersonalizer:(id)a3 configurationSet:(int64_t)a4
{
  return (id)[a1 transformationWithPersonalizer:a3 feedItemScores:0 sortOptions:1 configurationSet:a4];
}

+ (id)transformationWithPersonalizer:(id)a3
{
  return (id)[a1 transformationWithPersonalizer:a3 feedItemScores:0];
}

- (id)transformFeedItems:(id)a3
{
  id v4 = a3;
  v5 = NewsCoreUserDefaults();
  if ([v5 BOOLForKey:@"personalization_disabled"])
  {

LABEL_6:
    id v8 = v4;
    goto LABEL_7;
  }
  v6 = [(FCFeedTransformationPersonalizedSort *)self feedPersonalizer];

  if (!v6) {
    goto LABEL_6;
  }
  v7 = [(FCFeedTransformationPersonalizedSort *)self feedItemScores];

  if (v7)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __59__FCFeedTransformationPersonalizedSort_transformFeedItems___block_invoke;
    v11[3] = &unk_1E5B50530;
    v11[4] = self;
    id v8 = [v4 sortedArrayUsingComparator:v11];
  }
  else
  {
    id v8 = [(FCFeedTransformationPersonalizedSort *)self personalizedHeadlines:v4];
  }
LABEL_7:
  id v9 = v8;

  return v9;
}

uint64_t __59__FCFeedTransformationPersonalizedSort_transformFeedItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = [*(id *)(a1 + 32) feedItemScores];
  id v8 = [v7 objectForKey:v6];

  id v9 = [*(id *)(a1 + 32) feedItemScores];
  id v10 = [v9 objectForKey:v5];

  if (!v8 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v17 = (void *)[[NSString alloc] initWithFormat:@"expected a score for item %@", v6];
    *(_DWORD *)buf = 136315906;
    v20 = "-[FCFeedTransformationPersonalizedSort transformFeedItems:]_block_invoke";
    __int16 v21 = 2080;
    v22 = "FCFeedTransformationPersonalize.m";
    __int16 v23 = 1024;
    int v24 = 90;
    __int16 v25 = 2114;
    v26 = v17;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v11 = v10;
  if (!v10)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v18 = (void *)[[NSString alloc] initWithFormat:@"expected a score for item %@", v5];
      *(_DWORD *)buf = 136315906;
      v20 = "-[FCFeedTransformationPersonalizedSort transformFeedItems:]_block_invoke";
      __int16 v21 = 2080;
      v22 = "FCFeedTransformationPersonalize.m";
      __int16 v23 = 1024;
      int v24 = 91;
      __int16 v25 = 2114;
      v26 = v18;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
    v11 = &unk_1EF8D8448;
  }
  v12 = &unk_1EF8D8448;
  if (v8) {
    v12 = v8;
  }
  id v13 = v12;

  id v14 = v11;
  uint64_t v15 = [v13 compare:v14];

  return v15;
}

- (id)transformHeadlines:(id)a3
{
  id v4 = a3;
  id v5 = NewsCoreUserDefaults();
  if ([v5 BOOLForKey:@"personalization_disabled"])
  {
  }
  else
  {
    id v6 = [(FCFeedTransformationPersonalizedSort *)self feedPersonalizer];

    if (v6)
    {
      id v7 = [(FCFeedTransformationPersonalizedSort *)self personalizedHeadlines:v4];
      goto LABEL_6;
    }
  }
  id v7 = v4;
LABEL_6:
  id v8 = v7;

  return v8;
}

- (id)personalizedHeadlines:(id)a3
{
  id v4 = a3;
  id v5 = [(FCFeedTransformationPersonalizedSort *)self feedPersonalizer];
  id v6 = objc_msgSend(v5, "sortItems:options:configurationSet:", v4, -[FCFeedTransformationPersonalizedSort sortOptions](self, "sortOptions"), -[FCFeedTransformationPersonalizedSort configurationSet](self, "configurationSet"));

  id v7 = [v6 sortedItems];

  return v7;
}

- (FCFeedPersonalizing)feedPersonalizer
{
  return self->_feedPersonalizer;
}

- (void)setFeedPersonalizer:(id)a3
{
}

- (FCMapTable)feedItemScores
{
  return self->_feedItemScores;
}

- (void)setFeedItemScores:(id)a3
{
}

- (int64_t)sortOptions
{
  return self->_sortOptions;
}

- (void)setSortOptions:(int64_t)a3
{
  self->_sortOptions = a3;
}

- (int64_t)configurationSet
{
  return self->_configurationSet;
}

- (void)setConfigurationSet:(int64_t)a3
{
  self->_configurationSet = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedItemScores, 0);
  objc_storeStrong((id *)&self->_feedPersonalizer, 0);
}

@end
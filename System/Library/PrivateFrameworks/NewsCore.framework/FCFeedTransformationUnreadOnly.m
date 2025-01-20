@interface FCFeedTransformationUnreadOnly
+ (id)transformationWithReadingHistory:(id)a3;
- (FCReadingHistory)history;
- (id)transformFeedItems:(id)a3;
- (void)setHistory:(id)a3;
@end

@implementation FCFeedTransformationUnreadOnly

+ (id)transformationWithReadingHistory:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setHistory:v3];

  return v4;
}

- (id)transformFeedItems:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(FCFeedTransformationUnreadOnly *)self history];

  if (!v5 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v11 = (void *)[[NSString alloc] initWithFormat:@"can't filter read articles without history"];
    *(_DWORD *)buf = 136315906;
    v15 = "-[FCFeedTransformationUnreadOnly transformFeedItems:]";
    __int16 v16 = 2080;
    v17 = "FCFeedTransformationUnreadOnly.m";
    __int16 v18 = 1024;
    int v19 = 31;
    __int16 v20 = 2114;
    v21 = v11;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v6 = [(FCFeedTransformationUnreadOnly *)self history];
  v7 = [v6 allReadArticleIDs];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __53__FCFeedTransformationUnreadOnly_transformFeedItems___block_invoke;
  v12[3] = &unk_1E5B4C958;
  id v13 = v7;
  id v8 = v7;
  v9 = objc_msgSend(v4, "fc_arrayOfObjectsPassingTest:", v12);

  return v9;
}

uint64_t __53__FCFeedTransformationUnreadOnly_transformFeedItems___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 articleID];
  uint64_t v4 = [v2 containsObject:v3] ^ 1;

  return v4;
}

- (FCReadingHistory)history
{
  return self->_history;
}

- (void)setHistory:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
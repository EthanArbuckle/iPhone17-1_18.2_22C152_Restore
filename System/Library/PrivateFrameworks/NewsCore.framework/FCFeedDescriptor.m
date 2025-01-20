@interface FCFeedDescriptor
- (BOOL)hasNotificationsEnabledWithSubscriptionController:(id)a3;
- (BOOL)hideAccessoryText;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSubscribable;
- (BOOL)isSubscribedToWithSubscriptionController:(id)a3;
- (FCChannelProviding)backingChannel;
- (FCContentContext)context;
- (FCFeedDescriptor)alternativeFeedDescriptor;
- (FCFeedDescriptor)init;
- (FCFeedDescriptor)initWithIdentifier:(id)a3;
- (FCFeedTheming)theme;
- (FCTagProviding)backingTag;
- (NSArray)iAdCategories;
- (NSArray)iAdKeywords;
- (NSArray)otherArticleIDs;
- (NSString)backingChannelID;
- (NSString)backingSectionID;
- (NSString)backingTopicID;
- (NSString)description;
- (NSString)iAdFeedID;
- (NSString)iAdPrimaryAudience;
- (NSString)iAdSectionID;
- (NSString)identifier;
- (NSString)name;
- (NSString)referringFeedItemIdentifier;
- (id)associateAlternativeFeedDescriptor:(id)a3;
- (id)fetchOperationForHeadlinesWithIDs:(id)a3 context:(id)a4;
- (id)latestHeadlineResultsWithContext:(id)a3;
- (id)streamOfHeadlinesWithIDs:(id)a3 context:(id)a4 cachedOnly:(BOOL)a5 maxCachedAge:(double)a6;
- (id)streamOfLatestHeadlinesWithContext:(id)a3;
- (int64_t)feedPersonalizationConfigurationSet;
- (int64_t)feedSortMethod;
- (int64_t)feedType;
- (int64_t)iAdContentProvider;
- (unint64_t)feedConfiguration;
- (unint64_t)feedFilterOptions;
- (unint64_t)hash;
- (void)setContext:(id)a3;
- (void)setOtherArticleIDs:(id)a3;
- (void)setReferringFeedItemIdentifier:(id)a3;
@end

@implementation FCFeedDescriptor

- (id)latestHeadlineResultsWithContext:(id)a3
{
  id v4 = a3;
  v5 = [FCStreamingResults alloc];
  v6 = [(FCFeedDescriptor *)self streamOfLatestHeadlinesWithContext:v4];

  v7 = [(FCStreamingResults *)v5 initWithStream:v6];
  return v7;
}

- (id)streamOfHeadlinesWithIDs:(id)a3 context:(id)a4 cachedOnly:(BOOL)a5 maxCachedAge:(double)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  if (!v11 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v17 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "context");
    *(_DWORD *)buf = 136315906;
    v23 = "-[FCFeedDescriptor streamOfHeadlinesWithIDs:context:cachedOnly:maxCachedAge:]";
    __int16 v24 = 2080;
    v25 = "FCFeedDescriptor.m";
    __int16 v26 = 1024;
    int v27 = 238;
    __int16 v28 = 2114;
    v29 = v17;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v12 = [[FCArrayStream alloc] initWithArray:v10];
  v13 = [FCTransformedResultsStream alloc];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __77__FCFeedDescriptor_streamOfHeadlinesWithIDs_context_cachedOnly_maxCachedAge___block_invoke;
  v18[3] = &unk_1E5B4F1D0;
  v18[4] = self;
  id v19 = v11;
  BOOL v21 = a5;
  double v20 = a6;
  id v14 = v11;
  v15 = [(FCTransformedResultsStream *)v13 initWithStream:v12 asyncTransformBlock:v18];

  return v15;
}

- (FCFeedDescriptor)initWithIdentifier:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v10 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "identifier != nil");
    *(_DWORD *)buf = 136315906;
    v13 = "-[FCFeedDescriptor initWithIdentifier:]";
    __int16 v14 = 2080;
    v15 = "FCFeedDescriptor.m";
    __int16 v16 = 1024;
    int v17 = 65;
    __int16 v18 = 2114;
    id v19 = v10;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v11.receiver = self;
  v11.super_class = (Class)FCFeedDescriptor;
  v5 = [(FCFeedDescriptor *)&v11 init];
  v6 = v5;
  if (v5)
  {
    if (v4)
    {
      uint64_t v7 = [v4 copy];
      identifier = (FCFeedDescriptor *)v6->_identifier;
      v6->_identifier = (NSString *)v7;
    }
    else
    {
      identifier = v5;
      v6 = 0;
    }
  }
  return v6;
}

- (FCFeedDescriptor)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCFeedDescriptor init]";
    __int16 v9 = 2080;
    id v10 = "FCFeedDescriptor.m";
    __int16 v11 = 1024;
    int v12 = 60;
    __int16 v13 = 2114;
    __int16 v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCFeedDescriptor init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    uint64_t v7 = [(FCFeedDescriptor *)self identifier];
    v8 = [v6 identifier];
    char v9 = [v7 isEqualToString:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  v2 = [(FCFeedDescriptor *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSString)description
{
  unint64_t v3 = +[FCDescription descriptionWithObject:self];
  id v4 = [(FCFeedDescriptor *)self name];
  [v3 addField:@"name" value:v4];

  v5 = [(FCFeedDescriptor *)self identifier];
  [v3 addField:@"identifier" value:v5];

  unint64_t v6 = [(FCFeedDescriptor *)self feedConfiguration] - 1;
  if (v6 > 0xA) {
    uint64_t v7 = @"Default";
  }
  else {
    uint64_t v7 = off_1E5B4F1F0[v6];
  }
  [v3 addField:@"feedConfiguration" value:v7];
  v8 = [(FCFeedDescriptor *)self alternativeFeedDescriptor];
  [v3 addField:@"alternativeFeedDescriptor" object:v8];

  char v9 = [v3 descriptionString];

  return (NSString *)v9;
}

- (FCFeedTheming)theme
{
  return 0;
}

- (unint64_t)feedConfiguration
{
  return 0;
}

- (NSString)name
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Abstract method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCFeedDescriptor name]";
    __int16 v9 = 2080;
    id v10 = "FCFeedDescriptor.m";
    __int16 v11 = 1024;
    int v12 = 124;
    __int16 v13 = 2114;
    __int16 v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  unint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Abstract method", "-[FCFeedDescriptor name]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (BOOL)hideAccessoryText
{
  return 0;
}

- (BOOL)isSubscribable
{
  return 0;
}

- (BOOL)isSubscribedToWithSubscriptionController:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(FCFeedDescriptor *)self isSubscribable])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      id v6 = (void *)[[NSString alloc] initWithFormat:@"Abstract method"];
      *(_DWORD *)buf = 136315906;
      int v12 = "-[FCFeedDescriptor isSubscribedToWithSubscriptionController:]";
      __int16 v13 = 2080;
      __int16 v14 = "FCFeedDescriptor.m";
      __int16 v15 = 1024;
      int v16 = 142;
      __int16 v17 = 2114;
      __int16 v18 = v6;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
    uint64_t v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C3B8];
    __int16 v9 = [NSString stringWithFormat:@"%@: %s", @"Abstract method", "-[FCFeedDescriptor isSubscribedToWithSubscriptionController:]"];
    id v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];

    objc_exception_throw(v10);
  }

  return 0;
}

- (BOOL)hasNotificationsEnabledWithSubscriptionController:(id)a3
{
  return 0;
}

- (FCTagProviding)backingTag
{
  return 0;
}

- (FCChannelProviding)backingChannel
{
  return 0;
}

- (NSString)backingChannelID
{
  return 0;
}

- (NSString)backingSectionID
{
  return 0;
}

- (NSString)backingTopicID
{
  return 0;
}

- (NSArray)iAdCategories
{
  return 0;
}

- (NSArray)iAdKeywords
{
  return 0;
}

- (int64_t)iAdContentProvider
{
  return 1;
}

- (NSString)iAdPrimaryAudience
{
  return 0;
}

- (NSString)iAdFeedID
{
  return (NSString *)&stru_1EF8299B8;
}

- (NSString)iAdSectionID
{
  return (NSString *)&stru_1EF8299B8;
}

- (int64_t)feedSortMethod
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Abstract method"];
    *(_DWORD *)buf = 136315906;
    uint64_t v8 = "-[FCFeedDescriptor feedSortMethod]";
    __int16 v9 = 2080;
    id v10 = "FCFeedDescriptor.m";
    __int16 v11 = 1024;
    int v12 = 216;
    __int16 v13 = 2114;
    __int16 v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  unint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Abstract method", "-[FCFeedDescriptor feedSortMethod]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (unint64_t)feedFilterOptions
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Abstract method"];
    *(_DWORD *)buf = 136315906;
    uint64_t v8 = "-[FCFeedDescriptor feedFilterOptions]";
    __int16 v9 = 2080;
    id v10 = "FCFeedDescriptor.m";
    __int16 v11 = 1024;
    int v12 = 221;
    __int16 v13 = 2114;
    __int16 v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  unint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Abstract method", "-[FCFeedDescriptor feedFilterOptions]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (int64_t)feedPersonalizationConfigurationSet
{
  return 0;
}

- (id)associateAlternativeFeedDescriptor:(id)a3
{
  return self;
}

void __77__FCFeedDescriptor_streamOfHeadlinesWithIDs_context_cachedOnly_maxCachedAge___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  uint64_t v8 = [*(id *)(a1 + 32) fetchOperationForHeadlinesWithIDs:a2 context:*(void *)(a1 + 40)];
  __int16 v9 = v8;
  if (*(unsigned char *)(a1 + 56)) {
    uint64_t v10 = 3;
  }
  else {
    uint64_t v10 = 4;
  }
  [v8 setCachePolicy:v10];
  [v9 setMaximumCachedAge:*(double *)(a1 + 48)];
  [v9 setQualityOfService:a3];
  if (a3 == 9) {
    uint64_t v11 = -1;
  }
  else {
    uint64_t v11 = a3 == 33 || a3 == 25;
  }
  [v9 setRelativePriority:v11];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __77__FCFeedDescriptor_streamOfHeadlinesWithIDs_context_cachedOnly_maxCachedAge___block_invoke_2;
  v14[3] = &unk_1E5B4CAF8;
  id v15 = v7;
  id v12 = v7;
  [v9 setFetchCompletionBlock:v14];
  __int16 v13 = objc_msgSend(MEMORY[0x1E4F28F08], "fc_sharedConcurrentQueue");
  [v13 addOperation:v9];
}

void __77__FCFeedDescriptor_streamOfHeadlinesWithIDs_context_cachedOnly_maxCachedAge___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 fetchedObject];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

- (id)fetchOperationForHeadlinesWithIDs:(id)a3 context:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v10 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "context");
    *(_DWORD *)buf = 136315906;
    id v12 = "-[FCFeedDescriptor fetchOperationForHeadlinesWithIDs:context:]";
    __int16 v13 = 2080;
    __int16 v14 = "FCFeedDescriptor.m";
    __int16 v15 = 1024;
    int v16 = 263;
    __int16 v17 = 2114;
    __int16 v18 = v10;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v7 = [v6 articleController];
  uint64_t v8 = [v7 headlinesFetchOperationForArticleIDs:v5];

  return v8;
}

- (id)streamOfLatestHeadlinesWithContext:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = (void *)[[NSString alloc] initWithFormat:@"Abstract method"];
    *(_DWORD *)buf = 136315906;
    uint64_t v10 = "-[FCFeedDescriptor streamOfLatestHeadlinesWithContext:]";
    __int16 v11 = 2080;
    id v12 = "FCFeedDescriptor.m";
    __int16 v13 = 1024;
    int v14 = 271;
    __int16 v15 = 2114;
    int v16 = v4;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  id v7 = [NSString stringWithFormat:@"%@: %s", @"Abstract method", "-[FCFeedDescriptor streamOfLatestHeadlinesWithContext:]"];
  id v8 = [v5 exceptionWithName:v6 reason:v7 userInfo:0];

  objc_exception_throw(v8);
}

- (int64_t)feedType
{
  return self->_feedType;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (FCContentContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (NSString)referringFeedItemIdentifier
{
  return self->_referringFeedItemIdentifier;
}

- (void)setReferringFeedItemIdentifier:(id)a3
{
}

- (FCFeedDescriptor)alternativeFeedDescriptor
{
  return self->_alternativeFeedDescriptor;
}

- (NSArray)otherArticleIDs
{
  return self->_otherArticleIDs;
}

- (void)setOtherArticleIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_otherArticleIDs, 0);
  objc_storeStrong((id *)&self->_alternativeFeedDescriptor, 0);
  objc_storeStrong((id *)&self->_referringFeedItemIdentifier, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
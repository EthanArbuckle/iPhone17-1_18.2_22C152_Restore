@interface PRSQueryTask
+ (BOOL)supportsSecureCoding;
+ (void)initialize;
+ (void)resumeDecoding;
+ (void)suspendDecoding;
- (BOOL)canceled;
- (BOOL)started;
- (BOOL)webSearch;
- (NSArray)parsecCategoryOrder;
- (NSDictionary)category_stats;
- (NSDictionary)serverRelevanceScores;
- (NSDictionary)server_features;
- (NSString)fbq;
- (NSString)queryString;
- (OS_dispatch_queue)queue;
- (PRSQueryTask)initWithCoder:(id)a3;
- (PRSQueryTask)initWithSession:(id)a3 handler:(id)a4 queue:(id)a5 feedback:(id)a6 queryContext:(id)a7;
- (PRSSearchFeedback)feedback;
- (PRSSearchQueryHandler)handler;
- (PRSSearchSession)session;
- (SFEngagementSignal)engagementSignal;
- (SPSearchQueryContext)queryContext;
- (float)serverRelevanceScoreThreshold;
- (id)representedObject;
- (int64_t)queryId;
- (unint64_t)queryIdent;
- (void)cancel;
- (void)encodeWithCoder:(id)a3;
- (void)invalidateHandler;
- (void)resume;
- (void)setCanceled:(BOOL)a3;
- (void)setCategory_stats:(id)a3;
- (void)setEngagementSignal:(id)a3;
- (void)setFbq:(id)a3;
- (void)setFeedback:(id)a3;
- (void)setHandler:(id)a3;
- (void)setParsecCategoryOrder:(id)a3;
- (void)setQueryId:(int64_t)a3;
- (void)setQueryIdent:(unint64_t)a3;
- (void)setQueryString:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRepresentedObject:(id)a3;
- (void)setServerRelevanceScoreThreshold:(float)a3;
- (void)setServerRelevanceScores:(id)a3;
- (void)setServer_features:(id)a3;
- (void)setSession:(id)a3;
- (void)setStarted:(BOOL)a3;
- (void)setWebSearch:(BOOL)a3;
@end

@implementation PRSQueryTask

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E4F14430], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v2 = dispatch_queue_create("Query Decoding Queue", v4);
    v3 = (void *)decodingQueue;
    decodingQueue = (uint64_t)v2;
  }
}

+ (void)suspendDecoding
{
  dispatch_queue_t v2 = PRSLogCategoryDefault();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1BDB2A000, v2, OS_LOG_TYPE_INFO, "Suspend decoding queue", v3, 2u);
  }

  dispatch_suspend((dispatch_object_t)decodingQueue);
}

+ (void)resumeDecoding
{
  dispatch_queue_t v2 = PRSLogCategoryDefault();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1BDB2A000, v2, OS_LOG_TYPE_INFO, "Resume decoding queue", v3, 2u);
  }

  dispatch_resume((dispatch_object_t)decodingQueue);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  category_stats = self->_category_stats;
  id v5 = a3;
  [v5 encodeObject:category_stats forKey:@"_category_stats"];
  [v5 encodeObject:self->_server_features forKey:@"_server_features"];
  [v5 encodeObject:self->_fbq forKey:@"_fbq"];
  [v5 encodeObject:self->_queryString forKey:@"_queryString"];
}

- (PRSQueryTask)initWithCoder:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)PRSQueryTask;
  id v5 = [(PRSQueryTask *)&v24 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"_category_stats"];
    category_stats = v5->_category_stats;
    v5->_category_stats = (NSDictionary *)v11;

    v13 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    v16 = objc_msgSend(v13, "setWithObjects:", v14, v15, objc_opt_class(), 0);
    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"_server_features"];
    server_features = v5->_server_features;
    v5->_server_features = (NSDictionary *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_fbq"];
    fbq = v5->_fbq;
    v5->_fbq = (NSString *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_queryString"];
    queryString = v5->_queryString;
    v5->_queryString = (NSString *)v21;
  }
  return v5;
}

- (PRSQueryTask)initWithSession:(id)a3 handler:(id)a4 queue:(id)a5 feedback:(id)a6 queryContext:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v22.receiver = self;
  v22.super_class = (Class)PRSQueryTask;
  uint64_t v17 = [(PRSQueryTask *)&v22 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_feedback, a6);
    objc_storeWeak((id *)&v18->_handler, v13);
    objc_storeStrong((id *)&v18->_queue, a5);
    objc_storeWeak((id *)&v18->_session, v12);
    objc_storeStrong((id *)&v18->_queryContext, a7);
    uint64_t v19 = [(SPSearchQueryContext *)v18->_queryContext searchString];
    queryString = v18->_queryString;
    v18->_queryString = (NSString *)v19;
  }
  return v18;
}

- (void)resume
{
  self->_started = 1;
}

- (void)cancel
{
  self->_canceled = 1;
}

- (void)invalidateHandler
{
}

- (int64_t)queryId
{
  return self->_queryId;
}

- (void)setQueryId:(int64_t)a3
{
  self->_queryId = a3;
}

- (NSDictionary)category_stats
{
  return self->_category_stats;
}

- (void)setCategory_stats:(id)a3
{
}

- (NSDictionary)server_features
{
  return self->_server_features;
}

- (void)setServer_features:(id)a3
{
}

- (NSArray)parsecCategoryOrder
{
  return self->_parsecCategoryOrder;
}

- (void)setParsecCategoryOrder:(id)a3
{
}

- (NSDictionary)serverRelevanceScores
{
  return self->_serverRelevanceScores;
}

- (void)setServerRelevanceScores:(id)a3
{
}

- (float)serverRelevanceScoreThreshold
{
  return self->_serverRelevanceScoreThreshold;
}

- (void)setServerRelevanceScoreThreshold:(float)a3
{
  self->_serverRelevanceScoreThreshold = a3;
}

- (SFEngagementSignal)engagementSignal
{
  return self->_engagementSignal;
}

- (void)setEngagementSignal:(id)a3
{
}

- (id)representedObject
{
  id WeakRetained = objc_loadWeakRetained(&self->_representedObject);
  return WeakRetained;
}

- (void)setRepresentedObject:(id)a3
{
}

- (SPSearchQueryContext)queryContext
{
  return self->_queryContext;
}

- (NSString)queryString
{
  return self->_queryString;
}

- (void)setQueryString:(id)a3
{
}

- (unint64_t)queryIdent
{
  return self->_queryIdent;
}

- (void)setQueryIdent:(unint64_t)a3
{
  self->_queryIdent = a3;
}

- (BOOL)started
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (BOOL)canceled
{
  return self->_canceled;
}

- (void)setCanceled:(BOOL)a3
{
  self->_canceled = a3;
}

- (PRSSearchFeedback)feedback
{
  return (PRSSearchFeedback *)objc_getProperty(self, a2, 96, 1);
}

- (void)setFeedback:(id)a3
{
}

- (PRSSearchQueryHandler)handler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_handler);
  return (PRSSearchQueryHandler *)WeakRetained;
}

- (void)setHandler:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (PRSSearchSession)session
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_session);
  return (PRSSearchSession *)WeakRetained;
}

- (void)setSession:(id)a3
{
}

- (NSString)fbq
{
  return self->_fbq;
}

- (void)setFbq:(id)a3
{
}

- (BOOL)webSearch
{
  return self->_webSearch;
}

- (void)setWebSearch:(BOOL)a3
{
  self->_webSearch = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fbq, 0);
  objc_destroyWeak((id *)&self->_session);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_handler);
  objc_storeStrong((id *)&self->_feedback, 0);
  objc_storeStrong((id *)&self->_queryString, 0);
  objc_storeStrong((id *)&self->_queryContext, 0);
  objc_destroyWeak(&self->_representedObject);
  objc_storeStrong((id *)&self->_engagementSignal, 0);
  objc_storeStrong((id *)&self->_serverRelevanceScores, 0);
  objc_storeStrong((id *)&self->_parsecCategoryOrder, 0);
  objc_storeStrong((id *)&self->_server_features, 0);
  objc_storeStrong((id *)&self->_category_stats, 0);
}

@end
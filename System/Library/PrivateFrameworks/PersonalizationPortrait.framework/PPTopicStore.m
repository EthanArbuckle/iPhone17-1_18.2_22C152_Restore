@interface PPTopicStore
+ (double)decayValue:(double)a3 withDecayRate:(double)a4 forTimeElapsed:(double)a5;
+ (id)defaultStore;
+ (id)new;
- (BOOL)deleteAllTopicsFromSourcesWithBundleId:(id)a3 deletedCount:(unint64_t *)a4 error:(id *)a5;
- (BOOL)deleteAllTopicsFromSourcesWithBundleId:(id)a3 documentIds:(id)a4 deletedCount:(unint64_t *)a5 error:(id *)a6;
- (BOOL)deleteAllTopicsFromSourcesWithBundleId:(id)a3 groupId:(id)a4 olderThan:(id)a5 deletedCount:(unint64_t *)a6 error:(id *)a7;
- (BOOL)deleteAllTopicsFromSourcesWithBundleId:(id)a3 groupIds:(id)a4 deletedCount:(unint64_t *)a5 error:(id *)a6;
- (BOOL)deleteAllTopicsWithTopicId:(id)a3 deletedCount:(unint64_t *)a4 error:(id *)a5;
- (BOOL)donateTopics:(id)a3 source:(id)a4 algorithm:(unint64_t)a5 cloudSync:(BOOL)a6 sentimentScore:(double)a7 exactMatchesInSourceText:(id)a8 error:(id *)a9;
- (BOOL)iterRankedTopicsWithQuery:(id)a3 error:(id *)a4 block:(id)a5;
- (BOOL)iterScoresForTopicMapping:(id)a3 query:(id)a4 error:(id *)a5 block:(id)a6;
- (BOOL)iterTopicRecordsWithQuery:(id)a3 error:(id *)a4 block:(id)a5;
- (PPTopicStore)init;
- (id)_initFromSubclass;
- (id)cachedTopicScores;
- (id)rankedTopicsWithQuery:(id)a3 error:(id *)a4;
- (id)scoresForTopicMapping:(id)a3 query:(id)a4 error:(id *)a5;
- (id)topicExtractionsFromText:(id)a3 error:(id *)a4;
- (id)topicRecordsWithQuery:(id)a3 error:(id *)a4;
- (id)unmapMappedTopicIdentifier:(id)a3 mappingIdentifier:(id)a4 error:(id *)a5;
- (void)registerFeedback:(id)a3 completion:(id)a4;
- (void)registerUniversalSearchSpotlightFeedback:(id)a3 completion:(id)a4;
- (void)setClientIdentifier:(id)a3;
@end

@implementation PPTopicStore

- (void)registerUniversalSearchSpotlightFeedback:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  __break(1u);
}

- (void)setClientIdentifier:(id)a3
{
  id v3 = a3;
  __break(1u);
}

- (void)registerFeedback:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  __break(1u);
}

- (id)cachedTopicScores
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v7 = 0;
  v2 = [(PPTopicStore *)self cachePath:&v7];
  id v3 = v7;
  if (v2)
  {
    v4 = +[PPTopicUtils cachedTopicScoresAtPath:v2];
  }
  else
  {
    id v5 = pp_topics_log_handle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = v3;
      _os_log_error_impl(&dword_18CAA6000, v5, OS_LOG_TYPE_ERROR, "PPTopicStore: unable to recover cache path over XPC: %@", buf, 0xCu);
    }

    v4 = 0;
  }

  return v4;
}

- (BOOL)deleteAllTopicsFromSourcesWithBundleId:(id)a3 groupId:(id)a4 olderThan:(id)a5 deletedCount:(unint64_t *)a6 error:(id *)a7
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  __break(1u);
  return (char)v11;
}

- (BOOL)deleteAllTopicsFromSourcesWithBundleId:(id)a3 deletedCount:(unint64_t *)a4 error:(id *)a5
{
  id v5 = a3;
  __break(1u);
  return (char)v5;
}

- (BOOL)deleteAllTopicsFromSourcesWithBundleId:(id)a3 groupIds:(id)a4 deletedCount:(unint64_t *)a5 error:(id *)a6
{
  id v7 = a3;
  id v8 = a4;
  __break(1u);
  return (char)v8;
}

- (BOOL)deleteAllTopicsFromSourcesWithBundleId:(id)a3 documentIds:(id)a4 deletedCount:(unint64_t *)a5 error:(id *)a6
{
  id v7 = a3;
  id v8 = a4;
  __break(1u);
  return (char)v8;
}

- (BOOL)deleteAllTopicsWithTopicId:(id)a3 deletedCount:(unint64_t *)a4 error:(id *)a5
{
  id v5 = a3;
  __break(1u);
  return (char)v5;
}

- (BOOL)donateTopics:(id)a3 source:(id)a4 algorithm:(unint64_t)a5 cloudSync:(BOOL)a6 sentimentScore:(double)a7 exactMatchesInSourceText:(id)a8 error:(id *)a9
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a8;
  __break(1u);
  return (char)v13;
}

- (id)topicExtractionsFromText:(id)a3 error:(id *)a4
{
  id result = a3;
  __break(1u);
  return result;
}

- (id)topicRecordsWithQuery:(id)a3 error:(id *)a4
{
  id result = a3;
  __break(1u);
  return result;
}

- (BOOL)iterTopicRecordsWithQuery:(id)a3 error:(id *)a4 block:(id)a5
{
  id v6 = a3;
  id v7 = a5;
  __break(1u);
  return (char)v7;
}

- (id)unmapMappedTopicIdentifier:(id)a3 mappingIdentifier:(id)a4 error:(id *)a5
{
  id v6 = a3;
  id result = a4;
  __break(1u);
  return result;
}

- (id)scoresForTopicMapping:(id)a3 query:(id)a4 error:(id *)a5
{
  id v6 = a3;
  id result = a4;
  __break(1u);
  return result;
}

- (BOOL)iterScoresForTopicMapping:(id)a3 query:(id)a4 error:(id *)a5 block:(id)a6
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a6;
  __break(1u);
  return (char)v10;
}

- (id)rankedTopicsWithQuery:(id)a3 error:(id *)a4
{
  id result = a3;
  __break(1u);
  return result;
}

- (BOOL)iterRankedTopicsWithQuery:(id)a3 error:(id *)a4 block:(id)a5
{
  id v6 = a3;
  id v7 = a5;
  __break(1u);
  return (char)v7;
}

- (id)_initFromSubclass
{
  v3.receiver = self;
  v3.super_class = (Class)PPTopicStore;
  return [(PPTopicStore *)&v3 init];
}

- (PPTopicStore)init
{
  objc_super v3 = [[PPXPCTopicStore alloc] _init];

  return v3;
}

+ (double)decayValue:(double)a3 withDecayRate:(double)a4 forTimeElapsed:(double)a5
{
  double v5 = a3;
  if (a5 >= 0.0) {
    return exp(-(a4 * a5)) * a3;
  }
  return v5;
}

+ (id)defaultStore
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__PPTopicStore_defaultStore__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultStore__pasOnceToken12 != -1) {
    dispatch_once(&defaultStore__pasOnceToken12, block);
  }
  v2 = (void *)defaultStore__pasExprOnceResult_2447;
  return v2;
}

void __28__PPTopicStore_defaultStore__block_invoke()
{
  v0 = (void *)MEMORY[0x192F97350]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)defaultStore__pasExprOnceResult_2447;
  defaultStore__pasExprOnceResult_2447 = v1;
}

+ (id)new
{
  return (id)MEMORY[0x1F4181648](a1, a2);
}

@end
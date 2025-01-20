@interface PPNamedEntityStore
+ (id)defaultStore;
+ (id)new;
- (BOOL)deleteAllNamedEntitiesFromSourcesWithBundleId:(id)a3 deletedCount:(unint64_t *)a4 error:(id *)a5;
- (BOOL)deleteAllNamedEntitiesFromSourcesWithBundleId:(id)a3 documentIds:(id)a4 deletedCount:(unint64_t *)a5 error:(id *)a6;
- (BOOL)deleteAllNamedEntitiesFromSourcesWithBundleId:(id)a3 groupId:(id)a4 olderThan:(id)a5 deletedCount:(unint64_t *)a6 error:(id *)a7;
- (BOOL)deleteAllNamedEntitiesFromSourcesWithBundleId:(id)a3 groupIds:(id)a4 deletedCount:(unint64_t *)a5 error:(id *)a6;
- (BOOL)donateLocationNamedEntities:(id)a3 bundleId:(id)a4 groupId:(id)a5 error:(id *)a6;
- (BOOL)donateMapItem:(id)a3 forPlaceName:(id)a4 error:(id *)a5;
- (BOOL)donateNamedEntities:(id)a3 source:(id)a4 algorithm:(unint64_t)a5 cloudSync:(BOOL)a6 sentimentScore:(double)a7 error:(id *)a8;
- (BOOL)iterNamedEntityRecordsWithQuery:(id)a3 error:(id *)a4 block:(id)a5;
- (BOOL)iterRankedNamedEntitiesWithQuery:(id)a3 error:(id *)a4 block:(id)a5;
- (BOOL)loadNamedEntityRecordsAndMonitorChangesWithDelegate:(id)a3 error:(id *)a4;
- (BOOL)loadNamedEntityRecordsAndMonitorChangesWithDelegate:(id)a3 query:(id)a4 error:(id *)a5;
- (BOOL)removeMapItemForPlaceName:(id)a3 error:(id *)a4;
- (BOOL)removeMapItemsBeforeCutoffDate:(id)a3 error:(id *)a4;
- (PPNamedEntityStore)init;
- (id)_initFromSubclass;
- (id)mapItemForPlaceName:(id)a3 error:(id *)a4;
- (id)namedEntityRecordsWithQuery:(id)a3 error:(id *)a4;
- (id)rankedNamedEntitiesWithQuery:(id)a3 error:(id *)a4;
- (void)registerFeedback:(id)a3 completion:(id)a4;
- (void)setClientIdentifier:(id)a3;
- (void)unloadMonitoringDelegate:(id)a3;
@end

@implementation PPNamedEntityStore

- (PPNamedEntityStore)init
{
  v3 = [[PPXPCNamedEntityStore alloc] _init];

  return v3;
}

- (id)_initFromSubclass
{
  v3.receiver = self;
  v3.super_class = (Class)PPNamedEntityStore;
  return [(PPNamedEntityStore *)&v3 init];
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

- (BOOL)donateLocationNamedEntities:(id)a3 bundleId:(id)a4 groupId:(id)a5 error:(id *)a6
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __break(1u);
  return (char)v10;
}

- (BOOL)removeMapItemsBeforeCutoffDate:(id)a3 error:(id *)a4
{
  id v4 = a3;
  __break(1u);
  return (char)v4;
}

- (BOOL)removeMapItemForPlaceName:(id)a3 error:(id *)a4
{
  id v4 = a3;
  __break(1u);
  return (char)v4;
}

- (id)mapItemForPlaceName:(id)a3 error:(id *)a4
{
  id result = a3;
  __break(1u);
  return result;
}

- (BOOL)donateMapItem:(id)a3 forPlaceName:(id)a4 error:(id *)a5
{
  id v6 = a3;
  id v7 = a4;
  __break(1u);
  return (char)v7;
}

- (BOOL)deleteAllNamedEntitiesFromSourcesWithBundleId:(id)a3 groupId:(id)a4 olderThan:(id)a5 deletedCount:(unint64_t *)a6 error:(id *)a7
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  __break(1u);
  return (char)v11;
}

- (BOOL)deleteAllNamedEntitiesFromSourcesWithBundleId:(id)a3 deletedCount:(unint64_t *)a4 error:(id *)a5
{
  id v5 = a3;
  __break(1u);
  return (char)v5;
}

- (BOOL)deleteAllNamedEntitiesFromSourcesWithBundleId:(id)a3 groupIds:(id)a4 deletedCount:(unint64_t *)a5 error:(id *)a6
{
  id v7 = a3;
  id v8 = a4;
  __break(1u);
  return (char)v8;
}

- (BOOL)deleteAllNamedEntitiesFromSourcesWithBundleId:(id)a3 documentIds:(id)a4 deletedCount:(unint64_t *)a5 error:(id *)a6
{
  id v7 = a3;
  id v8 = a4;
  __break(1u);
  return (char)v8;
}

- (BOOL)donateNamedEntities:(id)a3 source:(id)a4 algorithm:(unint64_t)a5 cloudSync:(BOOL)a6 sentimentScore:(double)a7 error:(id *)a8
{
  id v9 = a3;
  id v10 = a4;
  __break(1u);
  return (char)v10;
}

- (void)unloadMonitoringDelegate:(id)a3
{
  id v3 = a3;
  __break(1u);
}

- (BOOL)loadNamedEntityRecordsAndMonitorChangesWithDelegate:(id)a3 query:(id)a4 error:(id *)a5
{
  id v6 = a3;
  id v7 = a4;
  __break(1u);
  return (char)v7;
}

- (BOOL)loadNamedEntityRecordsAndMonitorChangesWithDelegate:(id)a3 error:(id *)a4
{
  id v4 = a3;
  __break(1u);
  return (char)v4;
}

- (id)namedEntityRecordsWithQuery:(id)a3 error:(id *)a4
{
  id result = a3;
  __break(1u);
  return result;
}

- (BOOL)iterNamedEntityRecordsWithQuery:(id)a3 error:(id *)a4 block:(id)a5
{
  id v6 = a3;
  id v7 = a5;
  __break(1u);
  return (char)v7;
}

- (id)rankedNamedEntitiesWithQuery:(id)a3 error:(id *)a4
{
  id result = a3;
  __break(1u);
  return result;
}

- (BOOL)iterRankedNamedEntitiesWithQuery:(id)a3 error:(id *)a4 block:(id)a5
{
  id v6 = a3;
  id v7 = a5;
  __break(1u);
  return (char)v7;
}

+ (id)defaultStore
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__PPNamedEntityStore_defaultStore__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultStore__pasOnceToken12_9558 != -1) {
    dispatch_once(&defaultStore__pasOnceToken12_9558, block);
  }
  v2 = (void *)defaultStore__pasExprOnceResult_9559;
  return v2;
}

void __34__PPNamedEntityStore_defaultStore__block_invoke()
{
  v0 = (void *)MEMORY[0x192F97350]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)defaultStore__pasExprOnceResult_9559;
  defaultStore__pasExprOnceResult_9559 = v1;
}

+ (id)new
{
  return (id)MEMORY[0x1F4181648](a1, a2);
}

@end
@interface BMSyncCore
+ (void)resetEagerExitTimer;
- (BMCloudKitSyncEngine)cloudKitSyncEngine;
- (BMDistributedSyncMultiStreamManager)primaryUserSyncStreamManager;
- (BMRapportSyncEngine)rapportSyncEngine;
- (BMSyncCore)initWithQueue:(id)a3;
- (BMSyncDatabase)primaryDatabase;
- (BMSyncScheduler)syncScheduler;
- (BOOL)shouldCacheConnectionToMachService:(unint64_t)a3 domain:(unint64_t)a4 useCase:(id)a5;
- (BOOL)start;
- (unint64_t)state;
- (void)setCloudKitSyncEngine:(id)a3;
- (void)setPrimaryDatabase:(id)a3;
- (void)setPrimaryUserSyncStreamManager:(id)a3;
- (void)setRapportSyncEngine:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)setSyncScheduler:(id)a3;
@end

@implementation BMSyncCore

+ (void)resetEagerExitTimer
{
  if (qword_1000802B8 != -1) {
    dispatch_once(&qword_1000802B8, &stru_10006CD00);
  }
  v2 = qword_1000802B0;
  dispatch_time_t v3 = dispatch_time(0, 60000000000);

  dispatch_source_set_timer(v2, v3, 0xFFFFFFFFFFFFFFFFLL, 0x12A05F200uLL);
}

- (BMSyncCore)initWithQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BMSyncCore;
  v6 = [(BMSyncCore *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_queue, a3);
  }

  return v7;
}

- (BOOL)start
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_state == 2) {
    return 1;
  }
  +[BMAccessConnectionFactory setDelegate:self];
  id v4 = objc_alloc((Class)BMAccessClient);
  id v5 = [v4 initWithUseCase:BMUseCaseSync];
  id v6 = objc_alloc((Class)BMResourceSpecifier);
  id v7 = [v6 initWithType:5 name:BMSyncResource];
  id v26 = 0;
  v8 = [v5 requestAccessToResource:v7 mode:3 error:&v26];
  id v9 = v26;
  accessAssertion = self->_accessAssertion;
  self->_accessAssertion = v8;

  if (self->_accessAssertion)
  {
    v11 = +[BMSyncDatabase createPrimaryDatabaseWithQueue:self->_queue];
    unsigned __int8 v3 = [v11 open];
    if (v3)
    {
      objc_storeStrong((id *)&self->_primaryDatabase, v11);
      v12 = +[BMDistributedSyncMultiStreamManager multiStreamManagerWithPrimaryDatabase:self->_primaryDatabase account:0 queue:self->_queue];
      primaryUserSyncStreamManager = self->_primaryUserSyncStreamManager;
      self->_primaryUserSyncStreamManager = v12;

      v14 = [[BMRapportSyncEngine alloc] initWithQueue:self->_queue primarySyncManager:self->_primaryUserSyncStreamManager primaryDatabase:self->_primaryDatabase];
      rapportSyncEngine = self->_rapportSyncEngine;
      self->_rapportSyncEngine = v14;

      v16 = [[BMCloudKitSyncEngine alloc] initWithQueue:self->_queue multiStreamManager:self->_primaryUserSyncStreamManager database:self->_primaryDatabase];
      cloudKitSyncEngine = self->_cloudKitSyncEngine;
      self->_cloudKitSyncEngine = v16;

      v18 = [BMSyncScheduler alloc];
      v19 = self->_rapportSyncEngine;
      v20 = self->_cloudKitSyncEngine;
      v21 = [(BMRapportSyncEngine *)v19 peerStatusTracker];
      v22 = [(BMSyncScheduler *)v18 initWithRapportSyncEngine:v19 cloudKitSyncEngine:v20 peerStatusTracker:v21 database:self->_primaryDatabase queue:self->_queue];
      syncScheduler = self->_syncScheduler;
      self->_syncScheduler = v22;

      self->_state = 2;
      +[BMSyncCore resetEagerExitTimer];
    }
    else
    {
      self->_state = 1;
    }
  }
  else
  {
    v24 = __biome_log_for_category();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_100044994((uint64_t)v9, v24);
    }

    unsigned __int8 v3 = 0;
    self->_state = 1;
  }

  return v3;
}

- (BOOL)shouldCacheConnectionToMachService:(unint64_t)a3 domain:(unint64_t)a4 useCase:(id)a5
{
  id v7 = a5;
  v8 = v7;
  unsigned __int8 v9 = 0;
  if (a3 == 1 && !a4)
  {
    if (([v7 isEqual:BMUseCaseSync] & 1) != 0
      || ([v8 isEqual:BMUseCaseWriter] & 1) != 0)
    {
      unsigned __int8 v9 = 1;
    }
    else
    {
      unsigned __int8 v9 = [v8 isEqual:BMUseCasePruner];
    }
  }

  return v9;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (BMSyncDatabase)primaryDatabase
{
  return self->_primaryDatabase;
}

- (void)setPrimaryDatabase:(id)a3
{
}

- (BMDistributedSyncMultiStreamManager)primaryUserSyncStreamManager
{
  return self->_primaryUserSyncStreamManager;
}

- (void)setPrimaryUserSyncStreamManager:(id)a3
{
}

- (BMRapportSyncEngine)rapportSyncEngine
{
  return self->_rapportSyncEngine;
}

- (void)setRapportSyncEngine:(id)a3
{
}

- (BMCloudKitSyncEngine)cloudKitSyncEngine
{
  return self->_cloudKitSyncEngine;
}

- (void)setCloudKitSyncEngine:(id)a3
{
}

- (BMSyncScheduler)syncScheduler
{
  return self->_syncScheduler;
}

- (void)setSyncScheduler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncScheduler, 0);
  objc_storeStrong((id *)&self->_cloudKitSyncEngine, 0);
  objc_storeStrong((id *)&self->_rapportSyncEngine, 0);
  objc_storeStrong((id *)&self->_primaryUserSyncStreamManager, 0);
  objc_storeStrong((id *)&self->_primaryDatabase, 0);
  objc_storeStrong((id *)&self->_accessAssertion, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end
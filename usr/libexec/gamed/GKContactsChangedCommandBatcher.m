@interface GKContactsChangedCommandBatcher
- (BOOL)shouldExecuteCommands;
- (GKContactsCacheUpdateBatchEndCommand)batchEndCommand;
- (GKContactsCacheUpdateBatchStartCommand)batchStartCommand;
- (GKContactsCacheUpdateFinishedCommand)finishedCommand;
- (GKContactsChangedCommandBatcher)initWithPlayerProvider:(id)a3 meContactID:(id)a4 batchSize:(unint64_t)a5 batchStartCommand:(id)a6 batchEndCommand:(id)a7 finishedCommand:(id)a8;
- (GKContactsChangedCommandBatcher)initWithPlayerProvider:(id)a3 meContactID:(id)a4 batchSize:(unint64_t)a5 finishedCommand:(id)a6;
- (GKPlayerInternalProvider)playerProvider;
- (NSError)error;
- (NSMutableSet)commands;
- (NSString)meContactID;
- (id)executeCommandsWithContext:(id)a3;
- (unint64_t)batchSize;
- (void)addCommand:(id)a3;
- (void)addCommand:(id)a3 withContext:(id)a4;
- (void)finish;
- (void)finishWithContext:(id)a3;
- (void)setBatchEndCommand:(id)a3;
- (void)setBatchSize:(unint64_t)a3;
- (void)setBatchStartCommand:(id)a3;
- (void)setCommands:(id)a3;
- (void)setError:(id)a3;
- (void)setFinishedCommand:(id)a3;
- (void)setMeContactID:(id)a3;
- (void)setPlayerProvider:(id)a3;
- (void)visitAddContactEvent:(id)a3;
- (void)visitDeleteContactEvent:(id)a3;
- (void)visitDropEverythingEvent:(id)a3;
- (void)visitUpdateContactEvent:(id)a3;
@end

@implementation GKContactsChangedCommandBatcher

- (GKContactsChangedCommandBatcher)initWithPlayerProvider:(id)a3 meContactID:(id)a4 batchSize:(unint64_t)a5 finishedCommand:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  v13 = objc_alloc_init(GKContactsCacheUpdateBatchStartCommand);
  v14 = objc_alloc_init(GKContactsCacheUpdateBatchEndCommand);
  v15 = [(GKContactsChangedCommandBatcher *)self initWithPlayerProvider:v12 meContactID:v11 batchSize:a5 batchStartCommand:v13 batchEndCommand:v14 finishedCommand:v10];

  return v15;
}

- (GKContactsChangedCommandBatcher)initWithPlayerProvider:(id)a3 meContactID:(id)a4 batchSize:(unint64_t)a5 batchStartCommand:(id)a6 batchEndCommand:(id)a7 finishedCommand:(id)a8
{
  id v24 = a3;
  id v23 = a4;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v25.receiver = self;
  v25.super_class = (Class)GKContactsChangedCommandBatcher;
  v18 = [(GKContactsChangedCommandBatcher *)&v25 init];
  v19 = v18;
  if (v18)
  {
    v18->_batchSize = a5;
    objc_storeStrong((id *)&v18->_meContactID, a4);
    uint64_t v20 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", a5, v23, v24);
    commands = v19->_commands;
    v19->_commands = (NSMutableSet *)v20;

    objc_storeStrong((id *)&v19->_playerProvider, a3);
    objc_storeStrong((id *)&v19->_batchStartCommand, a6);
    objc_storeStrong((id *)&v19->_batchEndCommand, a7);
    objc_storeStrong((id *)&v19->_finishedCommand, a8);
  }

  return v19;
}

- (void)visitAddContactEvent:(id)a3
{
  id v4 = a3;
  v5 = [GKContactsChangedAddOrUpdateCommand alloc];
  v6 = [v4 contact];

  v7 = [(GKContactsChangedCommandBatcher *)self meContactID];
  v8 = [(GKContactsChangedAddOrUpdateCommand *)v5 initWithContact:v6 meContactID:v7];

  [(GKContactsChangedCommandBatcher *)self addCommand:v8];
}

- (void)visitDeleteContactEvent:(id)a3
{
  id v4 = a3;
  v5 = [GKContactsChangedDeleteCommand alloc];
  v6 = [v4 contactIdentifier];

  v7 = [(GKContactsChangedDeleteCommand *)v5 initWithContactID:v6];
  [(GKContactsChangedCommandBatcher *)self addCommand:v7];
}

- (void)visitDropEverythingEvent:(id)a3
{
  id v4 = objc_alloc_init(GKContactsChangedClearCommand);
  [(GKContactsChangedCommandBatcher *)self addCommand:v4];
}

- (void)visitUpdateContactEvent:(id)a3
{
  id v4 = a3;
  v5 = [GKContactsChangedAddOrUpdateCommand alloc];
  v6 = [v4 contact];

  v7 = [(GKContactsChangedCommandBatcher *)self meContactID];
  v8 = [(GKContactsChangedAddOrUpdateCommand *)v5 initWithContact:v6 meContactID:v7];

  [(GKContactsChangedCommandBatcher *)self addCommand:v8];
}

- (void)addCommand:(id)a3
{
  id v4 = a3;
  v5 = [(GKContactsChangedCommandBatcher *)self commands];
  [v5 addObject:v4];

  if ([(GKContactsChangedCommandBatcher *)self shouldExecuteCommands])
  {
    v6 = [(GKContactsChangedCommandBatcher *)self playerProvider];
    v7 = [v6 localPlayerCacheGroup];

    v8 = [v7 context];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1001243E4;
    v10[3] = &unk_1002D3B38;
    v10[4] = self;
    id v11 = v7;
    id v9 = v7;
    [v8 performBlockAndWait:v10];
  }
}

- (BOOL)shouldExecuteCommands
{
  v2 = self;
  v3 = [(GKContactsChangedCommandBatcher *)self commands];
  id v4 = [v3 count];
  LOBYTE(v2) = v4 >= (id)[(GKContactsChangedCommandBatcher *)v2 batchSize];

  return (char)v2;
}

- (void)addCommand:(id)a3 withContext:(id)a4
{
  id v9 = a4;
  id v6 = a3;
  v7 = [(GKContactsChangedCommandBatcher *)self commands];
  [v7 addObject:v6];

  if ([(GKContactsChangedCommandBatcher *)self shouldExecuteCommands]) {
    id v8 = [(GKContactsChangedCommandBatcher *)self executeCommandsWithContext:v9];
  }
}

- (id)executeCommandsWithContext:(id)a3
{
  id v4 = a3;
  v5 = [(GKContactsChangedCommandBatcher *)self commands];
  id v6 = [v5 count];

  if (!v6)
  {
    if (!os_log_GKGeneral) {
      id v10 = (id)GKOSLoggers();
    }
    id v11 = os_log_GKContacts;
    if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG)) {
      sub_100124B10(v11);
    }
    goto LABEL_12;
  }
  v7 = [(GKContactsChangedCommandBatcher *)self error];

  if (v7)
  {
    if (!os_log_GKGeneral) {
      id v8 = (id)GKOSLoggers();
    }
    id v9 = (void *)os_log_GKContacts;
    if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG)) {
      sub_100124B98(v9, self);
    }
    goto LABEL_12;
  }
  id v12 = [(GKContactsChangedCommandBatcher *)self batchStartCommand];
  v13 = [v12 executeWithContext:v4];
  [(GKContactsChangedCommandBatcher *)self setError:v13];

  v14 = [(GKContactsChangedCommandBatcher *)self error];

  if (v14)
  {
LABEL_12:
    id v15 = 0;
    goto LABEL_13;
  }
  if (!os_log_GKGeneral) {
    id v17 = (id)GKOSLoggers();
  }
  v18 = os_log_GKContacts;
  if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG)) {
    sub_100124B54(v18);
  }
  id v19 = objc_alloc((Class)NSMutableSet);
  uint64_t v20 = [(GKContactsChangedCommandBatcher *)self commands];
  id v15 = [v19 initWithCapacity:[v20 count]];

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v21 = [(GKContactsChangedCommandBatcher *)self commands];
  id v22 = [v21 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v31;
    do
    {
      for (i = 0; i != v23; i = (char *)i + 1)
      {
        if (*(void *)v31 != v24) {
          objc_enumerationMutation(v21);
        }
        v26 = [*(id *)(*((void *)&v30 + 1) + 8 * i) executeWithContext:v4];
        if (v26) {
          [v15 unionSet:v26];
        }
      }
      id v23 = [v21 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v23);
  }

  v27 = [(GKContactsChangedCommandBatcher *)self batchEndCommand];
  id v28 = [v15 copy];
  [v27 executeWithHandles:v28 context:v4];

  v29 = [(GKContactsChangedCommandBatcher *)self commands];
  [v29 removeAllObjects];

LABEL_13:

  return v15;
}

- (void)finish
{
  v3 = [(GKContactsChangedCommandBatcher *)self playerProvider];
  id v4 = [v3 localPlayerCacheGroup];

  v5 = [v4 context];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100124918;
  v7[3] = &unk_1002D3B38;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlockAndWait:v7];
}

- (void)finishWithContext:(id)a3
{
  id v7 = a3;
  id v4 = -[GKContactsChangedCommandBatcher executeCommandsWithContext:](self, "executeCommandsWithContext:");
  v5 = [(GKContactsChangedCommandBatcher *)self error];

  if (!v5)
  {
    id v6 = [(GKContactsChangedCommandBatcher *)self finishedCommand];
    [v6 executeWithContext:v7];
  }
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (GKContactsCacheUpdateBatchStartCommand)batchStartCommand
{
  return self->_batchStartCommand;
}

- (void)setBatchStartCommand:(id)a3
{
}

- (GKContactsCacheUpdateBatchEndCommand)batchEndCommand
{
  return self->_batchEndCommand;
}

- (void)setBatchEndCommand:(id)a3
{
}

- (GKContactsCacheUpdateFinishedCommand)finishedCommand
{
  return self->_finishedCommand;
}

- (void)setFinishedCommand:(id)a3
{
}

- (NSString)meContactID
{
  return self->_meContactID;
}

- (void)setMeContactID:(id)a3
{
}

- (GKPlayerInternalProvider)playerProvider
{
  return self->_playerProvider;
}

- (void)setPlayerProvider:(id)a3
{
}

- (NSMutableSet)commands
{
  return self->_commands;
}

- (void)setCommands:(id)a3
{
}

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (void)setBatchSize:(unint64_t)a3
{
  self->_batchSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commands, 0);
  objc_storeStrong((id *)&self->_playerProvider, 0);
  objc_storeStrong((id *)&self->_meContactID, 0);
  objc_storeStrong((id *)&self->_finishedCommand, 0);
  objc_storeStrong((id *)&self->_batchEndCommand, 0);
  objc_storeStrong((id *)&self->_batchStartCommand, 0);

  objc_storeStrong((id *)&self->_error, 0);
}

@end
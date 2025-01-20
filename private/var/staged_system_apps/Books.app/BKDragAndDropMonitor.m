@interface BKDragAndDropMonitor
+ (id)sharedInstance;
- (BKDragAndDropMonitor)init;
- (void)dragController:(id)a3 dragSessionDidEnd:(id)a4;
- (void)processWithDragSession:(id)a3;
@end

@implementation BKDragAndDropMonitor

- (BKDragAndDropMonitor)init
{
  v6.receiver = self;
  v6.super_class = (Class)BKDragAndDropMonitor;
  v2 = [(BKDragAndDropMonitor *)&v6 init];
  if (v2)
  {
    v3 = (NSHashTable *)[objc_alloc((Class)NSHashTable) initWithOptions:5 capacity:1];
    sessionsTable = v2->_sessionsTable;
    v2->_sessionsTable = v3;
  }
  return v2;
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100078E00;
  block[3] = &unk_100A43EF8;
  block[4] = a1;
  if (qword_100B4A428 != -1) {
    dispatch_once(&qword_100B4A428, block);
  }
  v2 = (void *)qword_100B4A420;

  return v2;
}

- (void)processWithDragSession:(id)a3
{
  id v4 = a3;
  if (![(NSHashTable *)self->_sessionsTable containsObject:v4])
  {
    [(NSHashTable *)self->_sessionsTable addObject:v4];
    v5 = objc_opt_new();
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v19 = v4;
    objc_super v6 = [v4 items];
    id v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v21;
      do
      {
        v10 = 0;
        do
        {
          if (*(void *)v21 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v20 + 1) + 8 * (void)v10);
          objc_opt_class();
          v12 = [v11 localObject];
          v13 = BUDynamicCast();
          v14 = [v13 storeID];

          if (![v14 length])
          {
            objc_opt_class();
            v15 = [v11 localObject];
            v16 = BUDynamicCast();
            uint64_t v17 = [v16 assetID];

            v14 = (void *)v17;
          }
          if ([v14 length]) {
            [v5 addObject:v14];
          }

          v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v8);
    }

    v18 = +[BAEventReporter sharedReporter];
    [v18 emitDragDropEventWithContentIDs:v5];

    id v4 = v19;
  }
}

- (void)dragController:(id)a3 dragSessionDidEnd:(id)a4
{
}

- (void).cxx_destruct
{
}

@end
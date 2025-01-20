@interface STPersistentHistoryCleanupManager
+ (BOOL)_wouldDeletingTransactionsBeforeDate:(id)a3 causeExpiryOfToken:(id)a4 forStore:(id)a5 inManagedObjectContext:(id)a6;
+ (id)_buildChangeDateForHourAge:(int64_t)a3 fromDate:(id)a4;
+ (id)_transactionsFoundByRequest:(id)a3 forStore:(id)a4 inManagedObjectContext:(id)a5 error:(id *)a6;
- (BOOL)_deletePersistentHistoryInContext:(id)a3 beforeDate:(id)a4 error:(id *)a5;
- (BOOL)cleanUpInContext:(id)a3 error:(id *)a4;
- (NSArray)relevantStores;
- (STPersistentHistoryCleanupManager)initWithRelevantStores:(id)a3 hourAge:(int64_t)a4 historyTokenForStore:(id)a5;
- (id)historyTokenForStore;
- (int64_t)hourAge;
@end

@implementation STPersistentHistoryCleanupManager

- (STPersistentHistoryCleanupManager)initWithRelevantStores:(id)a3 hourAge:(int64_t)a4 historyTokenForStore:(id)a5
{
  v8 = (NSArray *)a3;
  v16.receiver = self;
  v16.super_class = (Class)STPersistentHistoryCleanupManager;
  id v9 = a5;
  v10 = [(STPersistentHistoryCleanupManager *)&v16 init];
  relevantStores = v10->_relevantStores;
  v10->_relevantStores = v8;
  v12 = v8;

  v10->_hourAge = a4;
  id v13 = objc_retainBlock(v9);

  id historyTokenForStore = v10->_historyTokenForStore;
  v10->_id historyTokenForStore = v13;

  return v10;
}

- (BOOL)cleanUpInContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int64_t v7 = [(STPersistentHistoryCleanupManager *)self hourAge];
  v8 = objc_opt_new();
  id v9 = +[STPersistentHistoryCleanupManager _buildChangeDateForHourAge:v7 fromDate:v8];

  LOBYTE(a4) = [(STPersistentHistoryCleanupManager *)self _deletePersistentHistoryInContext:v6 beforeDate:v9 error:a4];
  return (char)a4;
}

- (BOOL)_deletePersistentHistoryInContext:(id)a3 beforeDate:(id)a4 error:(id *)a5
{
  id v9 = a3;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 1;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = sub_100051254;
  v25 = sub_100051264;
  id v26 = 0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10005126C;
  v15[3] = &unk_1002FD020;
  v15[4] = self;
  id v10 = a4;
  id v16 = v10;
  id v11 = v9;
  id v17 = v11;
  v18 = &v27;
  v19 = &v21;
  SEL v20 = a2;
  [v11 performBlockAndWait:v15];
  if (a5)
  {
    v12 = (void *)v22[5];
    if (v12) {
      *a5 = v12;
    }
  }
  char v13 = *((unsigned char *)v28 + 24);

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v13;
}

+ (BOOL)_wouldDeletingTransactionsBeforeDate:(id)a3 causeExpiryOfToken:(id)a4 forStore:(id)a5 inManagedObjectContext:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  v12 = +[NSPersistentHistoryChangeRequest fetchHistoryAfterToken:a4];
  id v23 = 0;
  char v13 = +[STPersistentHistoryCleanupManager _transactionsFoundByRequest:v12 forStore:v10 inManagedObjectContext:v11 error:&v23];
  id v14 = v23;
  if (v13)
  {
    v15 = +[NSPersistentHistoryChangeRequest fetchHistoryAfterDate:v9];
    id v22 = v14;
    id v16 = +[STPersistentHistoryCleanupManager _transactionsFoundByRequest:v15 forStore:v10 inManagedObjectContext:v11 error:&v22];
    id v17 = v22;

    if (v16)
    {
      id v18 = [v16 count];
      BOOL v19 = v18 > [v13 count];
    }
    else
    {
      SEL v20 = +[STLog persistence];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_1002624F0((uint64_t)v17, v20);
      }

      BOOL v19 = 1;
    }
  }
  else
  {
    v15 = +[STLog persistence];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_100262478((uint64_t)v14, v15);
    }
    BOOL v19 = 1;
    id v17 = v14;
  }

  return v19;
}

+ (id)_transactionsFoundByRequest:(id)a3 forStore:(id)a4 inManagedObjectContext:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = sub_100051254;
  v34 = sub_100051264;
  id v35 = 0;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = sub_100051254;
  v28 = sub_100051264;
  id v29 = 0;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100051994;
  v18[3] = &unk_1002FD048;
  id v12 = v9;
  id v19 = v12;
  id v13 = v10;
  id v20 = v13;
  id v14 = v11;
  id v21 = v14;
  id v22 = &v24;
  id v23 = &v30;
  [v14 performBlockAndWait:v18];
  if (a6)
  {
    v15 = (void *)v25[5];
    if (v15) {
      *a6 = v15;
    }
  }
  id v16 = (id)v31[5];

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  return v16;
}

+ (id)_buildChangeDateForHourAge:(int64_t)a3 fromDate:(id)a4
{
  id v5 = a4;
  id v6 = +[NSCalendar currentCalendar];
  int64_t v7 = [v6 dateByAddingUnit:32 value:-a3 toDate:v5 options:0];

  return v7;
}

- (NSArray)relevantStores
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (int64_t)hourAge
{
  return self->_hourAge;
}

- (id)historyTokenForStore
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_historyTokenForStore, 0);
  objc_storeStrong((id *)&self->_relevantStores, 0);
}

@end
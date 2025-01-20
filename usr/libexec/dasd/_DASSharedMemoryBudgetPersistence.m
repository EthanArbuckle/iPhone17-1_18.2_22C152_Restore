@interface _DASSharedMemoryBudgetPersistence
+ (id)log;
+ (id)persistence;
+ (void)initialize;
- (NSMutableDictionary)budgetToIndex;
- (_DASSharedMemoryBudgetPersistence)init;
- (id)lastModulationDate;
- (id)loadBudgetsWithExpectedNames:(id)a3;
- (id)validatedStringFromStoredValue:(char *)a3 withAllowedNames:(id)a4;
- (void)saveBudgets:(id)a3;
- (void)saveModulationDate:(id)a3;
- (void)setBudgetToIndex:(id)a3;
- (void)updateBudget:(id)a3;
@end

@implementation _DASSharedMemoryBudgetPersistence

+ (id)log
{
  if (qword_1001C3B38 != -1) {
    dispatch_once(&qword_1001C3B38, &stru_1001758D0);
  }
  v2 = (void *)qword_1001C3B40;

  return v2;
}

+ (void)initialize
{
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  v11[3] = 0;
  v2 = +[_DASSharedMemoryBudgetPersistence log];
  v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v4 = dispatch_queue_create("com.apple.dasd.shmemQueue", v3);
  v5 = (void *)qword_1001C3B30;
  qword_1001C3B30 = (uint64_t)v4;

  v6 = qword_1001C3B30;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100027680;
  v8[3] = &unk_1001758F8;
  id v9 = v2;
  v10 = v11;
  id v7 = v2;
  dispatch_sync(v6, v8);

  _Block_object_dispose(v11, 8);
}

- (_DASSharedMemoryBudgetPersistence)init
{
  v9.receiver = self;
  v9.super_class = (Class)_DASSharedMemoryBudgetPersistence;
  v2 = [(_DASSharedMemoryBudgetPersistence *)&v9 init];
  if (!v2) {
    goto LABEL_4;
  }
  if (qword_1001C3B48)
  {
    uint64_t v3 = +[NSMutableDictionary dictionary];
    budgetToIndex = v2->_budgetToIndex;
    v2->_budgetToIndex = (NSMutableDictionary *)v3;

LABEL_4:
    v5 = v2;
    goto LABEL_8;
  }
  v6 = +[_DASSharedMemoryBudgetPersistence log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Unable to obtain Shared Memory! Return nil as we won't be able to persist anything.", v8, 2u);
  }

  v5 = 0;
LABEL_8:

  return v5;
}

+ (id)persistence
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = sub_1000279D4;
  objc_super v9 = sub_1000279E4;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000279EC;
  v4[3] = &unk_100175920;
  v4[4] = &v5;
  v4[5] = a1;
  if (qword_1001C3B50 != -1) {
    dispatch_once(&qword_1001C3B50, v4);
  }
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (void)updateBudget:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[_DASSharedMemoryBudgetPersistence log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Updating budget: %@", buf, 0xCu);
  }

  v6 = qword_1001C3B30;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100027B60;
  v8[3] = &unk_100175570;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_sync(v6, v8);
}

- (void)saveBudgets:(id)a3
{
  id v4 = a3;
  uint64_t v5 = qword_1001C3B30;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100027D20;
  v7[3] = &unk_100175570;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (id)validatedStringFromStoredValue:(char *)a3 withAllowedNames:(id)a4
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = a4;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(id *)(*((void *)&v13 + 1) + 8 * i);
        if (!strncmp(a3, (const char *)objc_msgSend(v10, "UTF8String", (void)v13), (size_t)objc_msgSend(v10, "length") + 1))
        {
          id v11 = v10;
          goto LABEL_11;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v11 = 0;
LABEL_11:

  return v11;
}

- (id)loadBudgetsWithExpectedNames:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x3032000000;
  long long v15 = sub_1000279D4;
  long long v16 = sub_1000279E4;
  id v17 = &__NSArray0__struct;
  id v5 = qword_1001C3B30;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000282C0;
  block[3] = &unk_100175948;
  block[4] = self;
  id v10 = v4;
  id v11 = &v12;
  id v6 = v4;
  dispatch_sync(v5, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)saveModulationDate:(id)a3
{
  id v3 = a3;
  id v4 = qword_1001C3B30;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002869C;
  block[3] = &unk_1001754F8;
  id v7 = v3;
  id v5 = v3;
  dispatch_sync(v4, block);
}

- (id)lastModulationDate
{
  uint64_t v6 = 0;
  id v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100028908;
  block[3] = &unk_100175628;
  void block[4] = &v6;
  dispatch_sync((dispatch_queue_t)qword_1001C3B30, block);
  id v2 = 0;
  if (v7[3] >= 0.0001)
  {
    id v2 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
  }
  id v3 = +[_DASSharedMemoryBudgetPersistence log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Loaded modulation date: %@", buf, 0xCu);
  }

  _Block_object_dispose(&v6, 8);

  return v2;
}

- (NSMutableDictionary)budgetToIndex
{
  return self->_budgetToIndex;
}

- (void)setBudgetToIndex:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
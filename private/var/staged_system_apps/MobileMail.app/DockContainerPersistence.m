@interface DockContainerPersistence
+ (id)log;
- (DockContainerPersistence)initWithRecoveryDelegate:(id)a3;
- (DockContainerPersistenceRecoveryDelegate)recoveryDelegate;
- (EFCancelable)activeWriteCancelable;
- (EFCancelable)recoveryCancelable;
- (EFScheduler)queue;
- (NSHashTable)observers;
- (NSMutableArray)dockedStates;
- (id)requestDockedStates;
- (void)_beginLoadFromDisk;
- (void)_notifyObserversOfChange:(id)a3 sender:(id)a4;
- (void)_saveToDisk;
- (void)migrateDockContainerDraftsToWindowsIfNeeded:(id)a3;
- (void)pushNewDockedState:(id)a3 sender:(id)a4;
- (void)recoverAbandonedDrafts;
- (void)registerObserver:(id)a3;
- (void)removeDockedStateWithIdentifier:(id)a3 sender:(id)a4;
- (void)removeObserver:(id)a3;
- (void)setActiveWriteCancelable:(id)a3;
- (void)setDockedStates:(id)a3;
- (void)setObservers:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRecoveryCancelable:(id)a3;
- (void)setRecoveryDelegate:(id)a3;
@end

@implementation DockContainerPersistence

- (void)_beginLoadFromDisk
{
  v3 = [(DockContainerPersistence *)self queue];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001F7EC;
  v4[3] = &unk_1006047A0;
  v4[4] = self;
  [v3 performBlock:v4];
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  v5 = [(DockContainerPersistence *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100012AA0;
  v7[3] = &unk_100604618;
  v7[4] = self;
  id v6 = v4;
  id v8 = v6;
  [v5 performBlock:v7];
}

- (void)recoverAbandonedDrafts
{
  v3 = [(DockContainerPersistence *)self recoveryCancelable];
  [v3 cancel];

  id v4 = [(DockContainerPersistence *)self queue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001F9F0;
  v6[3] = &unk_1006065D8;
  v6[4] = self;
  v5 = [v4 performCancelableBlock:v6];
  [(DockContainerPersistence *)self setRecoveryCancelable:v5];
}

- (DockContainerPersistence)initWithRecoveryDelegate:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)DockContainerPersistence;
  v5 = [(DockContainerPersistence *)&v14 init];
  id v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_recoveryDelegate, v4);
    v7 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    dockedStates = v6->_dockedStates;
    v6->_dockedStates = v7;

    v9 = (NSHashTable *)[objc_alloc((Class)NSHashTable) initWithOptions:5 capacity:3];
    observers = v6->_observers;
    v6->_observers = v9;

    uint64_t v11 = +[EFScheduler serialDispatchQueueSchedulerWithName:@"DockContainerPersistenceQueue"];
    queue = v6->_queue;
    v6->_queue = (EFScheduler *)v11;

    [(DockContainerPersistence *)v6 _beginLoadFromDisk];
  }

  return v6;
}

- (NSHashTable)observers
{
  return self->_observers;
}

+ (id)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000848C;
  block[3] = &unk_1006044D8;
  block[4] = a1;
  if (qword_100699460 != -1) {
    dispatch_once(&qword_100699460, block);
  }
  v2 = (void *)qword_100699458;

  return v2;
}

- (void)setRecoveryCancelable:(id)a3
{
}

- (EFCancelable)recoveryCancelable
{
  return self->_recoveryCancelable;
}

- (EFScheduler)queue
{
  return self->_queue;
}

- (NSMutableArray)dockedStates
{
  return self->_dockedStates;
}

- (id)requestDockedStates
{
  v3 = [(DockContainerPersistence *)self queue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000A99D4;
  v6[3] = &unk_1006064D0;
  v6[4] = self;
  id v4 = +[EFFuture onScheduler:v3 futureWithBlock:v6];

  return v4;
}

- (void)pushNewDockedState:(id)a3 sender:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(DockContainerPersistence *)self queue];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000A9C48;
  v16[3] = &unk_100606520;
  id v9 = v6;
  id v17 = v9;
  v18 = self;
  v10 = +[EFFuture onScheduler:v8 futureWithBlock:v16];

  uint64_t v11 = [(DockContainerPersistence *)self queue];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000A9E54;
  v14[3] = &unk_100606548;
  v14[4] = self;
  id v12 = v7;
  id v15 = v12;
  [v10 onScheduler:v11 addSuccessBlock:v14];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000A9E64;
  v13[3] = &unk_100605EA8;
  v13[4] = self;
  [v10 addSuccessBlock:v13];
}

- (void)removeDockedStateWithIdentifier:(id)a3 sender:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = [(DockContainerPersistence *)self queue];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000AA07C;
    v14[3] = &unk_100606520;
    v14[4] = self;
    id v15 = v6;
    id v9 = +[EFFuture onScheduler:v8 futureWithBlock:v14];

    v10 = [(DockContainerPersistence *)self queue];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000AA240;
    v12[3] = &unk_100606548;
    v12[4] = self;
    id v13 = v7;
    [v9 onScheduler:v10 addSuccessBlock:v12];

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000AA250;
    v11[3] = &unk_100605EA8;
    v11[4] = self;
    [v9 addSuccessBlock:v11];
  }
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  v5 = [(DockContainerPersistence *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000AA334;
  v7[3] = &unk_100604618;
  v7[4] = self;
  id v6 = v4;
  id v8 = v6;
  [v5 performBlock:v7];
}

- (void)_notifyObserversOfChange:(id)a3 sender:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(DockContainerPersistence *)self observers];
  id v9 = [v8 allObjects];

  v10 = +[EFScheduler mainThreadScheduler];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000AA668;
  v14[3] = &unk_1006061C8;
  id v11 = v7;
  id v15 = v11;
  id v12 = v9;
  id v16 = v12;
  id v17 = self;
  id v13 = v6;
  id v18 = v13;
  [v10 performBlock:v14];
}

- (void)_saveToDisk
{
  v3 = [(DockContainerPersistence *)self activeWriteCancelable];

  if (v3)
  {
    id v4 = [(DockContainerPersistence *)self activeWriteCancelable];
    [v4 cancel];
  }
  v5 = [(DockContainerPersistence *)self dockedStates];
  id v6 = [v5 copy];

  id v7 = [(DockContainerPersistence *)self queue];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000AA9B8;
  v10[3] = &unk_1006065D8;
  id v8 = v6;
  id v11 = v8;
  id v9 = [v7 performCancelableBlock:v10];
  [(DockContainerPersistence *)self setActiveWriteCancelable:v9];
}

- (void)migrateDockContainerDraftsToWindowsIfNeeded:(id)a3
{
  id v4 = a3;
  v5 = +[DockContainerPersistence log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v11 = [v4 count];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Migrate %lu docked drafts", buf, 0xCu);
  }

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000AAC40;
  v7[3] = &unk_100606548;
  id v6 = v4;
  id v8 = v6;
  id v9 = self;
  +[MFBayAdoption migrateDockedDrafts:v6 completion:v7];
}

- (DockContainerPersistenceRecoveryDelegate)recoveryDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_recoveryDelegate);

  return (DockContainerPersistenceRecoveryDelegate *)WeakRetained;
}

- (void)setRecoveryDelegate:(id)a3
{
}

- (void)setDockedStates:(id)a3
{
}

- (void)setObservers:(id)a3
{
}

- (void)setQueue:(id)a3
{
}

- (EFCancelable)activeWriteCancelable
{
  return self->_activeWriteCancelable;
}

- (void)setActiveWriteCancelable:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recoveryCancelable, 0);
  objc_storeStrong((id *)&self->_activeWriteCancelable, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_dockedStates, 0);

  objc_destroyWeak((id *)&self->_recoveryDelegate);
}

@end
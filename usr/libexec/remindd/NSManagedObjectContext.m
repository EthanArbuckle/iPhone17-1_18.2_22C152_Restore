@interface NSManagedObjectContext
- (BOOL)ic_save;
- (BOOL)ic_saveWithLogDescription:(id)a3;
- (NSString)ic_debugName;
- (id)reduceIntoDictionaryByRootEntityNamesWithManagedObjectIDs:(id)a3;
- (id)rootEntityNameWithEntityName:(id)a3;
- (void)ic_performBlock:(id)a3 andPerformBlockOnMainThread:(id)a4;
- (void)ic_performBlockAndWait:(id)a3 andPerformBlockAndWaitOnMainThread:(id)a4;
- (void)setIc_debugName:(id)a3;
@end

@implementation NSManagedObjectContext

- (NSString)ic_debugName
{
  return (NSString *)objc_getAssociatedObject(self, off_100906D60);
}

- (void)setIc_debugName:(id)a3
{
}

- (BOOL)ic_save
{
  return [(NSManagedObjectContext *)self ic_saveWithLogDescription:0];
}

- (BOOL)ic_saveWithLogDescription:(id)a3
{
  id v4 = a3;
  if ([(NSManagedObjectContext *)self hasChanges])
  {
    id v12 = 0;
    BOOL v5 = [(NSManagedObjectContext *)self save:&v12];
    id v6 = v12;
    if (v4)
    {
      *(void *)buf = &v14;
      id v7 = objc_alloc((Class)NSString);
      v8 = [v7 initWithFormat:v4 arguments:*(void *)buf];
      v9 = v8;
      if (v5)
      {
        if (!v8)
        {
LABEL_17:

          goto LABEL_18;
        }
        v10 = +[REMLog cloudkit];
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          *(void *)&buf[4] = v9;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Saved context: %{public}@", buf, 0xCu);
        }
        goto LABEL_13;
      }
      if (v8)
      {
        v10 = +[REMLog cloudkit];
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          sub_100756264((uint64_t)v9, (uint64_t)v6, v10);
        }
LABEL_13:

LABEL_16:
        goto LABEL_17;
      }
    }
    else if (v5)
    {
      goto LABEL_17;
    }
    v9 = +[REMLog cloudkit];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1007561EC((uint64_t)v6, v9);
    }
    goto LABEL_16;
  }
  BOOL v5 = 1;
LABEL_18:

  return v5;
}

- (void)ic_performBlock:(id)a3 andPerformBlockOnMainThread:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100084A40;
  v8[3] = &unk_1008B0898;
  id v9 = a3;
  id v10 = a4;
  id v6 = v10;
  id v7 = v9;
  [(NSManagedObjectContext *)self performBlock:v8];
}

- (void)ic_performBlockAndWait:(id)a3 andPerformBlockAndWaitOnMainThread:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100084B40;
  v8[3] = &unk_1008AE138;
  id v9 = a3;
  id v6 = v9;
  id v7 = a4;
  [(NSManagedObjectContext *)self performBlockAndWait:v8];
  performBlockOnMainThread(v7);
}

- (id)reduceIntoDictionaryByRootEntityNamesWithManagedObjectIDs:(id)a3
{
  sub_1000963CC(0, (unint64_t *)&qword_100914150);
  unint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  BOOL v5 = self;
  sub_1005A36F4(v4);

  swift_bridgeObjectRelease();
  sub_100094134(&qword_100908270);
  v6.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v6.super.isa;
}

- (id)rootEntityNameWithEntityName:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = v5;
  id v7 = self;
  sub_1005A3FBC(v4, v6);
  uint64_t v9 = v8;

  swift_bridgeObjectRelease();
  if (v9)
  {
    NSString v10 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v10 = 0;
  }

  return v10;
}

@end
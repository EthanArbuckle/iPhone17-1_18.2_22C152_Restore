@interface GizmoSyncManager
- (_TtC9StocksApp16GizmoSyncManager)init;
- (void)dealloc;
- (void)session:(id)a3 activationDidCompleteWithState:(int64_t)a4 error:(id)a5;
- (void)session:(id)a3 didReceiveMessage:(id)a4;
- (void)sessionDidBecomeInactive:(id)a3;
- (void)sessionDidDeactivate:(id)a3;
@end

@implementation GizmoSyncManager

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = self;
  v5 = CFNotificationCenterGetDarwinNotifyCenter();
  if (qword_100053850 != -1) {
    swift_once();
  }
  CFNotificationCenterRemoveObserver(v5, v4, (CFNotificationName)qword_100056948, 0);

  v6 = CFNotificationCenterGetDarwinNotifyCenter();
  if (qword_100053858 != -1) {
    swift_once();
  }
  CFNotificationCenterRemoveObserver(v6, v4, (CFNotificationName)qword_100056950, 0);

  v7.receiver = v4;
  v7.super_class = ObjectType;
  [(GizmoSyncManager *)&v7 dealloc];
}

- (void).cxx_destruct
{
  sub_10001373C((uint64_t)self + OBJC_IVAR____TtC9StocksApp16GizmoSyncManager_watchlistManager);
  sub_10001373C((uint64_t)self + OBJC_IVAR____TtC9StocksApp16GizmoSyncManager_stockMetadataManager);

  swift_release();
}

- (_TtC9StocksApp16GizmoSyncManager)init
{
  result = (_TtC9StocksApp16GizmoSyncManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)sessionDidDeactivate:(id)a3
{
  uint64_t v4 = qword_100053868;
  id v5 = a3;
  v10 = self;
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v6 = type metadata accessor for Logger();
  sub_10002EF1C(v6, (uint64_t)qword_100056958);
  objc_super v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "session did deactivate, so reactivating", v9, 2u);
    swift_slowDealloc();
  }

  [v5 activateSession];
}

- (void)session:(id)a3 activationDidCompleteWithState:(int64_t)a4 error:(id)a5
{
  id v8 = a3;
  v9 = self;
  id v10 = a5;
  sub_100030C6C(a4, (uint64_t)a5);
}

- (void)session:(id)a3 didReceiveMessage:(id)a4
{
  uint64_t v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  id v7 = a3;
  id v8 = self;
  sub_100030F9C(v6);

  swift_bridgeObjectRelease();
}

- (void)sessionDidBecomeInactive:(id)a3
{
  uint64_t v4 = qword_100053868;
  id v10 = a3;
  id v5 = self;
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v6 = type metadata accessor for Logger();
  sub_10002EF1C(v6, (uint64_t)qword_100056958);
  id v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "session did become inactive", v9, 2u);
    swift_slowDealloc();
  }
}

@end
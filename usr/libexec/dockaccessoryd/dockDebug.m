@interface dockDebug
- (_TtC14dockaccessoryd9dockDebug)init;
- (void)connectedClientsWithCompletion:(id)a3;
- (void)dumpTrackerDiagnosticsWithPath:(id)a3 completion:(id)a4;
- (void)dumpTrackerStateWithPath:(id)a3 completion:(id)a4;
- (void)getTrackerDebugNotificationsWithCompletion:(id)a3;
- (void)migrateDataWithUpdate:(BOOL)a3 completion:(id)a4;
- (void)searchWithCalibrate:(BOOL)a3 completion:(id)a4;
- (void)setDockAccessoryStateWithInfo:(id)a3 docked:(int64_t)a4 completion:(id)a5;
- (void)setTrackingButtonStateWithState:(int64_t)a3 completion:(id)a4;
- (void)stopSearchWithCalibrate:(BOOL)a3 completion:(id)a4;
- (void)stopTrackerDebugNotificationsWithCompletion:(id)a3;
- (void)triggerSystemEventWithInfo:(id)a3 event:(id)a4 completion:(id)a5;
- (void)versionsWithCompletion:(id)a3;
@end

@implementation dockDebug

- (_TtC14dockaccessoryd9dockDebug)init
{
  return (_TtC14dockaccessoryd9dockDebug *)sub_1001E1DC0();
}

- (void)setDockAccessoryStateWithInfo:(id)a3 docked:(int64_t)a4 completion:(id)a5
{
  v8 = _Block_copy(a5);
  _Block_copy(v8);
  id v9 = a3;
  v10 = self;
  sub_1001E6384(a3, a4, (uint64_t)v10, (uint64_t)v8);
  _Block_release(v8);
  _Block_release(v8);
}

- (void)triggerSystemEventWithInfo:(id)a3 event:(id)a4 completion:(id)a5
{
  v8 = _Block_copy(a5);
  _Block_copy(v8);
  id v9 = a3;
  id v10 = a4;
  v11 = self;
  sub_1001E6E0C(a3, (uint64_t)v10, (uint64_t)v8);
  _Block_release(v8);
  _Block_release(v8);
}

- (void)getTrackerDebugNotificationsWithCompletion:(id)a3
{
}

- (void)stopTrackerDebugNotificationsWithCompletion:(id)a3
{
}

- (void)dumpTrackerDiagnosticsWithPath:(id)a3 completion:(id)a4
{
}

- (void)dumpTrackerStateWithPath:(id)a3 completion:(id)a4
{
}

- (void)searchWithCalibrate:(BOOL)a3 completion:(id)a4
{
}

- (void)stopSearchWithCalibrate:(BOOL)a3 completion:(id)a4
{
}

- (void)setTrackingButtonStateWithState:(int64_t)a3 completion:(id)a4
{
  v5 = (void (**)(void *, uint64_t, void))_Block_copy(a4);
  uint64_t v6 = qword_1002A7C00;
  v8 = self;
  if (v6 != -1) {
    swift_once();
  }
  unint64_t v7 = TrackingButtonState.rawValue.getter();
  if ((v7 & 0x8000000000000000) != 0 || v7 >= 0x100)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    sub_10018AB98(v7);
    v5[2](v5, 1, 0);
    _Block_release(v5);
  }
}

- (void)connectedClientsWithCompletion:(id)a3
{
}

- (void)versionsWithCompletion:(id)a3
{
}

- (void)migrateDataWithUpdate:(BOOL)a3 completion:(id)a4
{
  v5 = _Block_copy(a4);
  _Block_copy(v5);
  uint64_t v6 = self;
  sub_1001E8B84((uint64_t)v6, (uint64_t)v5);
  _Block_release(v5);
  _Block_release(v5);
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC14dockaccessoryd9dockDebug_logger;
  uint64_t v4 = type metadata accessor for Logger();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14dockaccessoryd9dockDebug_clientQueue);
}

@end
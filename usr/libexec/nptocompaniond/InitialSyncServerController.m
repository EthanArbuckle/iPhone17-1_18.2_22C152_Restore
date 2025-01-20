@interface InitialSyncServerController
- (_TtC14NanoPhotosSync27InitialSyncServerController)init;
- (void)syncCoordinator:(id)a3 beginSyncSession:(id)a4;
@end

@implementation InitialSyncServerController

- (_TtC14NanoPhotosSync27InitialSyncServerController)init
{
  swift_defaultActor_initialize();
  result = (_TtC14NanoPhotosSync27InitialSyncServerController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)syncCoordinator:(id)a3 beginSyncSession:(id)a4
{
  uint64_t v5 = qword_1000A0EB0;
  id v6 = a3;
  id v7 = a4;
  swift_retain();
  if (v5 != -1) {
    swift_once();
  }
  uint64_t v8 = type metadata accessor for Logger();
  sub_100006D88(v8, (uint64_t)qword_1000A4F48);
  v9 = Logger.logObject.getter();
  os_log_type_t v10 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "[InitialSync] Received sync session begin. Complete immediately.", v11, 2u);
    swift_slowDealloc();
  }

  [v7 syncDidComplete];

  swift_release();
}

@end
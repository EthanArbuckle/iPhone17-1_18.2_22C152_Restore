@interface PCViewServiceHandle
- (_TtC17proximitycontrold19PCViewServiceHandle)init;
- (void)dealloc;
- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4;
- (void)remoteAlertHandleDidActivate:(id)a3;
- (void)remoteAlertHandleDidDeactivate:(id)a3;
@end

@implementation PCViewServiceHandle

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = qword_10035A4F8;
  v5 = self;
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v6 = type metadata accessor for Logger();
  sub_10001D758(v6, (uint64_t)qword_10035F8B0);
  v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "Deinit", v9, 2u);
    swift_slowDealloc();
  }

  sub_100076B64();
  v10.receiver = v5;
  v10.super_class = ObjectType;
  [(PCViewServiceHandle *)&v10 dealloc];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_100077294((uint64_t)self + OBJC_IVAR____TtC17proximitycontrold19PCViewServiceHandle_context);
  swift_release();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17proximitycontrold19PCViewServiceHandle_remoteAlertHandle);
}

- (void)remoteAlertHandleDidActivate:(id)a3
{
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  uint64_t v6 = *(void (**)(id))((char *)&self->super.isa
                                 + OBJC_IVAR____TtC17proximitycontrold19PCViewServiceHandle_eventHandler);
  id v7 = a3;
  os_log_type_t v8 = self;
  id v9 = a4;
  v6(a4);
}

- (_TtC17proximitycontrold19PCViewServiceHandle)init
{
  result = (_TtC17proximitycontrold19PCViewServiceHandle *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
@interface RemoteAlertManager
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC9feedbackdP33_109D9EA95C5E46A2F39C291451DCB14618RemoteAlertManager)init;
- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4;
- (void)remoteAlertHandleDidActivate:;
- (void)remoteAlertHandleDidDeactivate:(id)a3;
- (void)remoteViewControllerDidLaunchWhileLockedWithCompletion:(id)a3;
@end

@implementation RemoteAlertManager

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10004D170(v4);
}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  id v6 = a3;
  v7 = self;
  id v8 = a4;
  sub_10004D58C(v6, (uint64_t)a4);
}

- (_TtC9feedbackdP33_109D9EA95C5E46A2F39C291451DCB14618RemoteAlertManager)init
{
  v3 = (char *)self
     + OBJC_IVAR____TtC9feedbackdP33_109D9EA95C5E46A2F39C291451DCB14618RemoteAlertManager_checkedThrowingContinuation;
  uint64_t v4 = sub_100008580(&qword_100093DD0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC9feedbackdP33_109D9EA95C5E46A2F39C291451DCB14618RemoteAlertManager_remoteAlertHandle) = 0;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for RemoteAlertManager();
  return [(RemoteAlertManager *)&v6 init];
}

- (void).cxx_destruct
{
  sub_10000A738((uint64_t)self+ OBJC_IVAR____TtC9feedbackdP33_109D9EA95C5E46A2F39C291451DCB14618RemoteAlertManager_checkedThrowingContinuation, &qword_100093E48);
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC9feedbackdP33_109D9EA95C5E46A2F39C291451DCB14618RemoteAlertManager_remoteAlertHandle);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  char v9 = sub_10004F204(v7);

  return v9 & 1;
}

- (void)remoteViewControllerDidLaunchWhileLockedWithCompletion:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_10004F3A4((uint64_t)v5, (uint64_t)v4);
  _Block_release(v4);
  _Block_release(v4);
}

- (void)remoteAlertHandleDidActivate:
{
  if (qword_100092A68 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  sub_100006040(v0, (uint64_t)qword_100093C30);
  oslog = Logger.logObject.getter();
  os_log_type_t v1 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(oslog, v1))
  {
    v2 = (uint8_t *)swift_slowAlloc();
    uint64_t v4 = swift_slowAlloc();
    *(_DWORD *)v2 = 136446210;
    sub_100007E60(0xD000000000000020, 0x800000010007E6B0, &v4);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, oslog, v1, "%{public}s", v2, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
}

@end
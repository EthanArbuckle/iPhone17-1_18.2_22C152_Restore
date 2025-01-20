@interface RemoteHandleObserverDelegateTrampoline
- (_TtC12searchpartydP33_B6591815384A8DEB8885452F1FDF33D538RemoteHandleObserverDelegateTrampoline)init;
- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4;
- (void)remoteAlertHandleDidActivate:(id)a3;
- (void)remoteAlertHandleDidDeactivate:(id)a3;
@end

@implementation RemoteHandleObserverDelegateTrampoline

- (void)remoteAlertHandleDidActivate:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100F29EF8(v4, "FMRemoteUILauncher - Did activate handle %@", (uint64_t)&unk_1015FD890, (uint64_t)&unk_101664238);
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100F29EF8(v4, "Did deactivate handle %@", (uint64_t)&unk_1015FD868, (uint64_t)&unk_101664228);
}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  id v6 = a3;
  v7 = self;
  id v8 = a4;
  sub_100F2A410(v6, (uint64_t)a4);
}

- (_TtC12searchpartydP33_B6591815384A8DEB8885452F1FDF33D538RemoteHandleObserverDelegateTrampoline)init
{
  result = (_TtC12searchpartydP33_B6591815384A8DEB8885452F1FDF33D538RemoteHandleObserverDelegateTrampoline *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end
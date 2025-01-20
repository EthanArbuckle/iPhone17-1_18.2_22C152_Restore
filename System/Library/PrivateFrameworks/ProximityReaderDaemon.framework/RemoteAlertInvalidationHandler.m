@interface RemoteAlertInvalidationHandler
- (_TtC21ProximityReaderDaemon30RemoteAlertInvalidationHandler)init;
- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4;
- (void)remoteAlertHandleDidDeactivate:(id)a3;
@end

@implementation RemoteAlertInvalidationHandler

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_25ABA82E4(v4);
}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  id v6 = a3;
  v7 = self;
  id v8 = a4;
  sub_25ABA8620(v6, (uint64_t)a4);
}

- (_TtC21ProximityReaderDaemon30RemoteAlertInvalidationHandler)init
{
  result = (_TtC21ProximityReaderDaemon30RemoteAlertInvalidationHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
}

@end
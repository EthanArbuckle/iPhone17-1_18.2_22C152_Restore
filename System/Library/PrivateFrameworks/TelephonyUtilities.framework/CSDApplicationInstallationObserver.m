@interface CSDApplicationInstallationObserver
- (BOOL)isApplicationInstalledWithBundleID:(id)a3;
- (CSDApplicationInstallationObserver)init;
- (CSDApplicationInstallationObserver)initWithQueue:(id)a3;
- (id)applicationRecordWithBundleID:(id)a3;
- (void)applicationsDidInstall:(id)a3;
- (void)applicationsDidUninstall:(id)a3;
@end

@implementation CSDApplicationInstallationObserver

- (CSDApplicationInstallationObserver)initWithQueue:(id)a3
{
  return (CSDApplicationInstallationObserver *)sub_1002CA9F8(a3);
}

- (id)applicationRecordWithBundleID:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = v5;
  v7 = self;
  v8 = (void *)sub_1002CAB4C(v4, v6);

  swift_bridgeObjectRelease();

  return v8;
}

- (BOOL)isApplicationInstalledWithBundleID:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = v5;
  v7 = self;
  LOBYTE(v4) = sub_1002CAE18(v4, v6);

  swift_bridgeObjectRelease();
  return v4 & 1;
}

- (CSDApplicationInstallationObserver)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)applicationsDidUninstall:(id)a3
{
}

- (void)applicationsDidInstall:(id)a3
{
}

@end
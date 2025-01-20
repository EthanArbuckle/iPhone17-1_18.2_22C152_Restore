@interface VUIAppInstallerHelper
- (VUIAppInstallerHelper)init;
- (VUIAppInstallerHelper)initWithAppBundleIDs:(id)a3;
- (VUIAppInstallerHelper)initWithPunchoutAction:(id)a3;
@end

@implementation VUIAppInstallerHelper

- (VUIAppInstallerHelper)initWithPunchoutAction:(id)a3
{
  id v3 = a3;
  AppInstallerHelper.init(punchoutAction:)();
  return result;
}

- (VUIAppInstallerHelper)initWithAppBundleIDs:(id)a3
{
  uint64_t v3 = sub_1E387CC98();
  return (VUIAppInstallerHelper *)AppInstallerHelper.init(appBundleIDs:)(v3);
}

- (VUIAppInstallerHelper)init
{
}

- (void).cxx_destruct
{
  sub_1E2BEA270((uint64_t)self + OBJC_IVAR___VUIAppInstallerHelper_punchoutURL, &qword_1EBF8F0E0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___VUIAppInstallerHelper____lazy_storage___serialQueue);
}

@end
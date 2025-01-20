@interface CSDFaceTimeInstallationNotifier
+ (BOOL)isFaceTimeInstalled;
- (CSDFaceTimeInstallationNotifier)init;
- (CSDFaceTimeInstallationNotifier)initWithQueue:(id)a3;
@end

@implementation CSDFaceTimeInstallationNotifier

+ (BOOL)isFaceTimeInstalled
{
  return sub_10027AFA8() & 1;
}

- (CSDFaceTimeInstallationNotifier)initWithQueue:(id)a3
{
  return (CSDFaceTimeInstallationNotifier *)sub_10027B120(a3);
}

- (CSDFaceTimeInstallationNotifier)init
{
}

- (void).cxx_destruct
{
  sub_10021E23C((uint64_t)self + OBJC_IVAR___CSDFaceTimeInstallationNotifier_storage, &qword_100586EF8);
  swift_unknownObjectRelease();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR___CSDFaceTimeInstallationNotifier_postFaceTimeUninstallAlertClosure);

  sub_100208490(v3);
}

@end
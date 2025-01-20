@interface SDAuthenticationSecurityManager
- (_TtC16DaemoniOSLibrary31SDAuthenticationSecurityManager)init;
- (void)handleKeyBagStateChanged;
- (void)handleOnWristStateChanged;
@end

@implementation SDAuthenticationSecurityManager

- (void)handleKeyBagStateChanged
{
  v2 = self;
  sub_10033EC28((uint64_t)sub_1003403E8, (uint64_t)&unk_1008D7398);
}

- (void)handleOnWristStateChanged
{
  v2 = self;
  sub_10033EC28((uint64_t)sub_1003403E0, (uint64_t)&unk_1008D7370);
}

- (_TtC16DaemoniOSLibrary31SDAuthenticationSecurityManager)init
{
  result = (_TtC16DaemoniOSLibrary31SDAuthenticationSecurityManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10033FEB0((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary31SDAuthenticationSecurityManager_lastUnlockDate);
  sub_10033FEB0((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary31SDAuthenticationSecurityManager_lastLockDate);
  sub_1002CA430(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC16DaemoniOSLibrary31SDAuthenticationSecurityManager_wristDetectionGenerator));
  sub_1002CA430(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC16DaemoniOSLibrary31SDAuthenticationSecurityManager_deviceUnlockedGenerator));
  sub_1002CA430(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC16DaemoniOSLibrary31SDAuthenticationSecurityManager_deviceBiolockedGenerator));
  sub_1002CA430(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC16DaemoniOSLibrary31SDAuthenticationSecurityManager_deviceHasPasscodeGenerator));
  sub_1002CA430(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC16DaemoniOSLibrary31SDAuthenticationSecurityManager_sleepModeGenerator));
  sub_1002CA430(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC16DaemoniOSLibrary31SDAuthenticationSecurityManager_lostModeGenerator));
  sub_1002CA430(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC16DaemoniOSLibrary31SDAuthenticationSecurityManager_motionGenerator));
  sub_1002CA430(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC16DaemoniOSLibrary31SDAuthenticationSecurityManager_faceIDEnabledGenerator));
  sub_1002CA430(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC16DaemoniOSLibrary31SDAuthenticationSecurityManager_raiseToWakeHandler));
  sub_1002CA430(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC16DaemoniOSLibrary31SDAuthenticationSecurityManager_lastUnlockedByPairedUnlockGenerator));
  sub_1002CA430(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC16DaemoniOSLibrary31SDAuthenticationSecurityManager_deviceIsBioUnarmedGenerator));
  sub_1002CA430(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC16DaemoniOSLibrary31SDAuthenticationSecurityManager_deviceIsInClassDGenerator));
  sub_1002CA430(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC16DaemoniOSLibrary31SDAuthenticationSecurityManager_deviceIsInAssertDelayGenerator));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary31SDAuthenticationSecurityManager_queue));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary31SDAuthenticationSecurityManager_pearlDevice));
  v3 = (char *)self + OBJC_IVAR____TtC16DaemoniOSLibrary31SDAuthenticationSecurityManager_lastUnlockedAndOnWristDate;

  sub_10033FEB0((uint64_t)v3);
}

@end
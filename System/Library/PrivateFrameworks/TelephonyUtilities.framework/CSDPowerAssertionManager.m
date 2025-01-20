@interface CSDPowerAssertionManager
- (CSDPowerAssertionManager)init;
@end

@implementation CSDPowerAssertionManager

- (CSDPowerAssertionManager)init
{
  return (CSDPowerAssertionManager *)sub_10020A7C8();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();

  sub_100208490(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___CSDPowerAssertionManager_acquirePowerAssertionHandler));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___CSDPowerAssertionManager_releasePowerAssertionHandler);

  sub_100208490(v3);
}

@end
@interface FMR1HapticsController
- (NSString)description;
- (_TtC10TVRemoteUI21FMR1HapticsController)init;
- (void)dealloc;
- (void)hapticDisplayLinkUpdateWithDisplaylink:(id)a3;
@end

@implementation FMR1HapticsController

- (_TtC10TVRemoteUI21FMR1HapticsController)init
{
  return (_TtC10TVRemoteUI21FMR1HapticsController *)FMR1HapticsController.init()();
}

- (void)dealloc
{
  v2 = self;
  FMR1HapticsController.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();

  outlined destroy of Any?((uint64_t)self + OBJC_IVAR____TtC10TVRemoteUI21FMR1HapticsController_tapHapticContext);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI21FMR1HapticsController_singleTapSelectedHapticPattern));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI21FMR1HapticsController_singleTap1HapticPattern));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI21FMR1HapticsController_singleTap2HapticPattern));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI21FMR1HapticsController_singleTap3HapticPattern));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI21FMR1HapticsController_singleTap4HapticPattern));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI21FMR1HapticsController_singleTap5HapticPattern));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI21FMR1HapticsController_connectedHapticPattern));

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI21FMR1HapticsController_scatterHapticPattern));

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI21FMR1HapticsController_aheadOffHapticPattern));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI21FMR1HapticsController_armsReachHapticPattern));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI21FMR1HapticsController_armsReachOffHapticPattern));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI21FMR1HapticsController_preNearbyHapticPattern));

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI21FMR1HapticsController_levelIncreaseHapticPattern));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI21FMR1HapticsController_levelDecreaseHapticPattern));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI21FMR1HapticsController_farNearHapticPattern));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI21FMR1HapticsController_continuousHapticPattern));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI21FMR1HapticsController_continuousHapticRampingFactorSpring));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC10TVRemoteUI21FMR1HapticsController_playedHapticPatternHandler);
  outlined consume of (@escaping @callee_guaranteed (@guaranteed FMR1HapticPattern?, @in_guaranteed Any?) -> ())?(v3);
}

- (NSString)description
{
  v2 = self;
  uint64_t v3 = FMR1HapticsController.description.getter();
  uint64_t v5 = v4;

  v6 = (void *)MEMORY[0x22A677130](v3, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (void)hapticDisplayLinkUpdateWithDisplaylink:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  FMR1HapticsController.hapticDisplayLinkUpdate(displaylink:)(v4);
}

@end
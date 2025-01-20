@interface MediaPlayer
- (_TtC12SeymourMedia11MediaPlayer)init;
- (id)playbackCoordinator:(id)a3 identifierForPlayerItem:(id)a4;
@end

@implementation MediaPlayer

- (_TtC12SeymourMedia11MediaPlayer)init
{
  result = (_TtC12SeymourMedia11MediaPlayer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12SeymourMedia11MediaPlayer_assetClient);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12SeymourMedia11MediaPlayer_analyticsReporter);
  swift_unknownObjectRelease();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12SeymourMedia11MediaPlayer_screenCaptureMonitor);
  sub_2261F873C((uint64_t)self + OBJC_IVAR____TtC12SeymourMedia11MediaPlayer_sessionOrigin);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12SeymourMedia11MediaPlayer_timeJumpCoordinator);
  v3 = (char *)self + OBJC_IVAR____TtC12SeymourMedia11MediaPlayer_workout;
  uint64_t v4 = sub_226297890();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_2262765F0((uint64_t)self + OBJC_IVAR____TtC12SeymourMedia11MediaPlayer_state);
  swift_release();

  sub_2261B43A8(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC12SeymourMedia11MediaPlayer_onReadyToPlay));
  v5 = (char *)self + OBJC_IVAR____TtC12SeymourMedia11MediaPlayer__startTimeOverride;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268124808);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  v7 = (char *)self + OBJC_IVAR____TtC12SeymourMedia11MediaPlayer__audioFormatMediaKind;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268124810);
  v9 = *(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8);

  v9(v7, v8);
}

- (id)playbackCoordinator:(id)a3 identifierForPlayerItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_2262977C0();

  v9 = (void *)sub_2262999D0();
  swift_bridgeObjectRelease();

  return v9;
}

@end
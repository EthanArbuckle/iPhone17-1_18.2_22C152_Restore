@interface VMPlayerItem
- (AVAsset)asset;
- (BOOL)looping;
- (BOOL)seeking;
- (NSArray)trackVolumes;
- (VMPlaybackController)controller;
- (_TtC10VoiceMemos12VMPlayerItem)init;
- (_TtC10VoiceMemos12VMPlayerItem)initWithAsset:(id)a3;
- (double)currentTime;
- (void)seekToTime:(double)a3 completionHandler:(id)a4;
- (void)setAsset:(id)a3;
- (void)setController:(id)a3;
- (void)setLooping:(BOOL)a3;
- (void)setPlayableRangeEndTime:(double)a3;
- (void)setTrackVolumes:(id)a3;
@end

@implementation VMPlayerItem

- (VMPlaybackController)controller
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (VMPlaybackController *)Strong;
}

- (void)setController:(id)a3
{
}

- (AVAsset)asset
{
  return (AVAsset *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                            + OBJC_IVAR____TtC10VoiceMemos12VMPlayerItem_asset));
}

- (void)setAsset:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10VoiceMemos12VMPlayerItem_asset);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10VoiceMemos12VMPlayerItem_asset) = (Class)a3;
  id v3 = a3;
}

- (_TtC10VoiceMemos12VMPlayerItem)initWithAsset:(id)a3
{
  return (_TtC10VoiceMemos12VMPlayerItem *)sub_10010193C((uint64_t)a3);
}

- (void)seekToTime:(double)a3 completionHandler:(id)a4
{
  v6 = _Block_copy(a4);
  if (v6)
  {
    v7 = v6;
    uint64_t v8 = swift_allocObject();
    *(void *)(v8 + 16) = v7;
    v9 = sub_100102170;
  }
  else
  {
    v9 = 0;
    uint64_t v8 = 0;
  }
  v10 = self;
  sub_100101A28((uint64_t (*)(void))v9, v8, a3);
  sub_1000D8194((uint64_t)v9);
}

- (BOOL)seeking
{
  return *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC10VoiceMemos12VMPlayerItem_seekCount) > 0;
}

- (double)currentTime
{
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (!Strong) {
    return 0.0;
  }
  id v4 = (void *)Strong;
  v5 = self;
  sub_100017220();
  sub_1000D3E9C();
  double v7 = v6;

  swift_release();
  return v7;
}

- (void)setPlayableRangeEndTime:(double)a3
{
  v5 = (double *)((char *)self + OBJC_IVAR____TtC10VoiceMemos12VMPlayerItem_playableRangeEndTime);
  double *v5 = a3;
  *((unsigned char *)v5 + 8) = 0;
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    double v7 = (void *)Strong;
    uint64_t v8 = self;
    sub_100017220();
    sub_1000D4788(a3);

    swift_release();
  }
}

- (BOOL)looping
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC10VoiceMemos12VMPlayerItem_looping);
}

- (void)setLooping:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC10VoiceMemos12VMPlayerItem_looping) = a3;
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    double v6 = (void *)Strong;
    double v7 = self;
    *(unsigned char *)(sub_100017220() + 112) = a3;

    swift_release();
  }
}

- (NSArray)trackVolumes
{
  swift_bridgeObjectRetain();
  v2.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v2.super.isa;
}

- (void)setTrackVolumes:(id)a3
{
  uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = self;
  sub_100101EB8(v4);
}

- (_TtC10VoiceMemos12VMPlayerItem)init
{
  result = (_TtC10VoiceMemos12VMPlayerItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_release();
  sub_10000C4A4((uint64_t)self + OBJC_IVAR____TtC10VoiceMemos12VMPlayerItem_controller);

  swift_bridgeObjectRelease();
}

@end
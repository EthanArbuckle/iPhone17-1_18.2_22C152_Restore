@interface JSContainerDetail
@end

@implementation JSContainerDetail

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicJSCore17JSContainerDetail_containerStoreItemMetadata));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicJSCore17JSContainerDetail_prominentItemIdentifiers));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicJSCore17JSContainerDetail_containerDetailLink));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_100046744((uint64_t)self + OBJC_IVAR____TtC11MusicJSCore17JSContainerDetail_containerDetailDelegate);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end
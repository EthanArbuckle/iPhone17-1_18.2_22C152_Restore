@interface BlueMoonStubPlayerAdapter
- (_TtC8Podcasts25BlueMoonStubPlayerAdapter)init;
@end

@implementation BlueMoonStubPlayerAdapter

- (_TtC8Podcasts25BlueMoonStubPlayerAdapter)init
{
  return (_TtC8Podcasts25BlueMoonStubPlayerAdapter *)sub_10005B24C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Podcasts25BlueMoonStubPlayerAdapter____lazy_storage___playerPathCoordinator));

  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Podcasts25BlueMoonStubPlayerAdapter_currentItemEpisodeNotes));

  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC8Podcasts25BlueMoonStubPlayerAdapter_autoStopMode;
  uint64_t v4 = type metadata accessor for PlayerAutoStopMode();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end
@interface PUIFeedManagerArtworkBridge
+ (PUIFeedManagerArtworkBridge)shared;
+ (void)setShared:(id)a3;
- (PUIFeedManagerArtworkBridge)init;
- (void)invalidateArtworkForPodcast:(id)a3;
- (void)updateArtworkForShow:(id)a3 useBackgroundFetch:(BOOL)a4 fetchUberImage:(BOOL)a5;
@end

@implementation PUIFeedManagerArtworkBridge

+ (PUIFeedManagerArtworkBridge)shared
{
  if (qword_1EAE24570 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return (PUIFeedManagerArtworkBridge *)(id)qword_1EAE299A8;
}

+ (void)setShared:(id)a3
{
  uint64_t v3 = qword_1EAE24570;
  id v4 = a3;
  if (v3 != -1) {
    swift_once();
  }
  swift_beginAccess();
  v5 = (void *)qword_1EAE299A8;
  qword_1EAE299A8 = (uint64_t)v4;
}

- (void)invalidateArtworkForPodcast:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1E3E3262C((void (*)(void, void, void))v4);
}

- (void)updateArtworkForShow:(id)a3 useBackgroundFetch:(BOOL)a4 fetchUberImage:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  v8 = self;
  sub_1E3E3440C((void (*)(void, void))v7, v5);
}

- (PUIFeedManagerArtworkBridge)init
{
  result = (PUIFeedManagerArtworkBridge *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR___PUIFeedManagerArtworkBridge_imageProvider);
  sub_1E3E34FE8((uint64_t)self + OBJC_IVAR___PUIFeedManagerArtworkBridge_caches, (uint64_t (*)(void))type metadata accessor for AssetCaches);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR___PUIFeedManagerArtworkBridge_imageStore);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR___PUIFeedManagerArtworkBridge_fileManager);

  uint64_t v3 = (char *)self + OBJC_IVAR___PUIFeedManagerArtworkBridge_signposter;
  uint64_t v4 = sub_1E3E7A6D0();
  BOOL v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end
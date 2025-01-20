@interface CacheDeleteNotifications
- (_TtC18PodcastsFoundation24CacheDeleteNotifications)init;
- (void)cacheDeleteObserver:(id)a3 didIdentifyCacheDeletedPath:(id)a4 deletedAtDate:(id)a5;
- (void)cacheDeleteObserverBecameSynchronizedWithFileSystem:(id)a3;
@end

@implementation CacheDeleteNotifications

- (void)cacheDeleteObserver:(id)a3 didIdentifyCacheDeletedPath:(id)a4 deletedAtDate:(id)a5
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB773140);
  MEMORY[0x1F4188790](v8 - 8);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1ACE761B8();
  uint64_t v13 = v12;
  if (a5)
  {
    sub_1ACE75078();
    uint64_t v14 = sub_1ACE750A8();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v10, 0, 1, v14);
  }
  else
  {
    uint64_t v15 = sub_1ACE750A8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v10, 1, 1, v15);
  }
  id v16 = a3;
  v17 = self;
  sub_1ACCBE050(v11, v13, (uint64_t)v10);

  swift_bridgeObjectRelease();
  sub_1ACA50E78((uint64_t)v10, (uint64_t *)&unk_1EB773140);
}

- (void)cacheDeleteObserverBecameSynchronizedWithFileSystem:(id)a3
{
  uint64_t v5 = type metadata accessor for CacheDeleteNotifications.CacheDeleteEvent(0);
  MEMORY[0x1F4188790](v5 - 8);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB76EE88);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB7705A0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v7, 1, 1, v12);
  id v13 = a3;
  uint64_t v14 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB770608);
  sub_1ACE76818();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (_TtC18PodcastsFoundation24CacheDeleteNotifications)init
{
  result = (_TtC18PodcastsFoundation24CacheDeleteNotifications *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC18PodcastsFoundation24CacheDeleteNotifications_stream;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB770640);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = (char *)self + OBJC_IVAR____TtC18PodcastsFoundation24CacheDeleteNotifications_continuation;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB770608);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);

  swift_release();
}

@end
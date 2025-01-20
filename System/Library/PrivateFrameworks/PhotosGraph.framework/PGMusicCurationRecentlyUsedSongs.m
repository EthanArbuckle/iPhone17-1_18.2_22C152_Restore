@interface PGMusicCurationRecentlyUsedSongs
+ (id)recentlyUsedAppleMusicSongsForCollectionsFromPhotoLibrary:(id)a3 error:(id *)a4;
+ (id)recentlyUsedAppleMusicSongsFromPhotoLibrary:(id)a3;
+ (id)recentlyUsedFlexMusicSongsForCollectionsFromPhotoLibrary:(id)a3 error:(id *)a4;
+ (id)recentlyUsedFlexMusicSongsFromPhotoLibrary:(id)a3;
- (NSString)description;
- (PGMusicCurationRecentlyUsedSongs)init;
- (id)allEntries;
- (void)addFlexMusicCuration:(id)a3 date:(id)a4;
- (void)addMusicCuration:(id)a3 date:(id)a4;
- (void)addSongIDs:(id)a3 date:(id)a4;
- (void)addWithSongIDDateMap:(id)a3;
- (void)appendWithOtherRecentlyUsed:(id)a3;
@end

@implementation PGMusicCurationRecentlyUsedSongs

- (void)addWithSongIDDateMap:(id)a3
{
  sub_1D1EBC910();
  uint64_t v4 = sub_1D1EBDCE0();
  v5 = self;
  RecentlyUsedSongs.add(songIDDateMap:)((Swift::OpaquePointer)v4);

  swift_bridgeObjectRelease();
}

- (void)addSongIDs:(id)a3 date:(id)a4
{
  uint64_t v5 = sub_1D1EBC910();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1D1EBE1B0();
  sub_1D1EBC8C0();
  v10 = self;
  RecentlyUsedSongs.add(songIDs:date:)(v9, (uint64_t)v8);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (id)allEntries
{
  swift_beginAccess();
  sub_1D1EBC910();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1D1EBDCC0();
  swift_bridgeObjectRelease();
  return v2;
}

- (void)appendWithOtherRecentlyUsed:(id)a3
{
  swift_beginAccess();
  id v5 = a3;
  uint64_t v6 = self;
  uint64_t v7 = swift_bridgeObjectRetain();
  sub_1D18527D0(v7, (void (*)(uint64_t, uint64_t, char *))sub_1D185496C);

  swift_bridgeObjectRelease();
}

- (PGMusicCurationRecentlyUsedSongs)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___PGMusicCurationRecentlyUsedSongs_mostRecentlyUsedSongIDDateMap) = (Class)MEMORY[0x1E4FBC868];
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___PGMusicCurationRecentlyUsedSongs_recentlyUsedToExclude) = (Class)MEMORY[0x1E4FBC870];
  v5.receiver = self;
  v5.super_class = ObjectType;
  return [(PGMusicCurationRecentlyUsedSongs *)&v5 init];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)addMusicCuration:(id)a3 date:(id)a4
{
}

- (void)addFlexMusicCuration:(id)a3 date:(id)a4
{
}

- (NSString)description
{
  v2 = self;
  RecentlyUsedSongs.description.getter();

  v3 = (void *)sub_1D1EBDE30();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

+ (id)recentlyUsedAppleMusicSongsFromPhotoLibrary:(id)a3
{
  return sub_1D184D4E8((uint64_t)a1, (uint64_t)a2, a3, 0);
}

+ (id)recentlyUsedFlexMusicSongsFromPhotoLibrary:(id)a3
{
  return sub_1D184D4E8((uint64_t)a1, (uint64_t)a2, a3, 1);
}

+ (id)recentlyUsedFlexMusicSongsForCollectionsFromPhotoLibrary:(id)a3 error:(id *)a4
{
  return sub_1D184D5C0((uint64_t)a1, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(void))sub_1D18536DC);
}

+ (id)recentlyUsedAppleMusicSongsForCollectionsFromPhotoLibrary:(id)a3 error:(id *)a4
{
  return sub_1D184D5C0((uint64_t)a1, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(void))sub_1D1853A34);
}

@end
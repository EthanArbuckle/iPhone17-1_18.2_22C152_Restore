@interface PGMusicCache
+ (id)cacheAtURL:(id)a3 error:(id *)a4;
+ (id)cacheWithPhotoLibrary:(id)a3 error:(id *)a4;
- (BOOL)removeAllWithProgressReporter:(id)a3 error:(id *)a4;
- (BOOL)removeSongSourcesWithSongSourceCategories:(id)a3 progressReporter:(id)a4 error:(id *)a5;
- (BOOL)removeSongSourcesWithSongSourceCategory:(id)a3 progressReporter:(id)a4 error:(id *)a5;
- (PGMusicCache)init;
- (id)statusAndReturnError:(id *)a3;
@end

@implementation PGMusicCache

+ (id)cacheWithPhotoLibrary:(id)a3 error:(id *)a4
{
  id v4 = a3;
  v5 = sub_1D18AC63C(v4);

  return v5;
}

+ (id)cacheAtURL:(id)a3 error:(id *)a4
{
  uint64_t v4 = sub_1D1EBC700();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D1EBC6C0();
  v8 = sub_1D18ABE78((uint64_t)v7);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v8;
}

- (BOOL)removeAllWithProgressReporter:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = self;
  MusicCache.removeAll(progressReporter:)();

  return 1;
}

- (PGMusicCache)init
{
  result = (PGMusicCache *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR___PGMusicCache_cacheURL;
  uint64_t v4 = sub_1D1EBC700();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  id v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___PGMusicCache_managedObjectContext);
}

- (BOOL)removeSongSourcesWithSongSourceCategory:(id)a3 progressReporter:(id)a4 error:(id *)a5
{
  uint64_t v7 = sub_1D1EBDE60();
  uint64_t v9 = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD47AC0);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_1D1F387A0;
  *(void *)(v10 + 32) = v7;
  *(void *)(v10 + 40) = v9;
  id v11 = a4;
  v12 = self;
  swift_bridgeObjectRetain();
  MusicCache.removeSongSources(songSourceCategories:progressReporter:)(v10);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  return 1;
}

- (BOOL)removeSongSourcesWithSongSourceCategories:(id)a3 progressReporter:(id)a4 error:(id *)a5
{
  uint64_t v7 = sub_1D1EBE1B0();
  id v8 = a4;
  uint64_t v9 = self;
  MusicCache.removeSongSources(songSourceCategories:progressReporter:)(v7);
  swift_bridgeObjectRelease();

  return 1;
}

- (id)statusAndReturnError:(id *)a3
{
  v3 = self;
  sub_1D1EBE7C0();

  uint64_t v4 = (void *)sub_1D1EBDE30();
  swift_bridgeObjectRelease();
  return v4;
}

@end
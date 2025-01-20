@interface PNWallpaperAlbumSuggestionGenerator
- (PNWallpaperAlbumSuggestionGenerator)init;
- (PNWallpaperAlbumSuggestionGenerator)initWithAssetCollection:(id)a3 photoLibrary:(id)a4;
- (id)assetsForDate:(id)a3 numberOfAssets:(int64_t)a4;
- (id)updateSuggestionsForDate:(id)a3 numberOfSuggestions:(int64_t)a4;
@end

@implementation PNWallpaperAlbumSuggestionGenerator

- (PNWallpaperAlbumSuggestionGenerator)initWithAssetCollection:(id)a3 photoLibrary:(id)a4
{
  return (PNWallpaperAlbumSuggestionGenerator *)WallpaperAlbumSuggestionGenerator.init(assetCollection:photoLibrary:)(a3, a4);
}

- (id)updateSuggestionsForDate:(id)a3 numberOfSuggestions:(int64_t)a4
{
  uint64_t v6 = sub_259842800();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2598427C0();
  v10 = self;
  v11 = (void *)sub_2595C4DD0((uint64_t)v9, a4);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v11;
}

- (id)assetsForDate:(id)a3 numberOfAssets:(int64_t)a4
{
  uint64_t v6 = sub_259842800();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2598427C0();
  v10 = self;
  sub_2595C5590(v9, a4);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  sub_25935633C(0, (unint64_t *)&qword_26B2F83C0);
  v11 = (void *)sub_2598444E0();
  swift_bridgeObjectRelease();
  return v11;
}

- (PNWallpaperAlbumSuggestionGenerator)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
@interface MusicLyricsLoader
+ (BOOL)supportsLyricsFor:(id)a3;
- (MusicLyricsLoader)init;
@end

@implementation MusicLyricsLoader

+ (BOOL)supportsLyricsFor:(id)a3
{
  id v3 = a3;
  char v4 = _s11MusicCoreUI12LyricsLoaderC08supportsD03forSbSo11MPModelSongC_tFZ_0(v3);

  return v4 & 1;
}

- (MusicLyricsLoader)init
{
  return (MusicLyricsLoader *)LyricsLoader.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  id v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___MusicLyricsLoader_operationQueue);
}

@end
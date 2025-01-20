@interface MTPodcastPlaylistSettings(DB)
- (unint64_t)needsUpdate;
- (void)setNeedsUpdate:()DB;
@end

@implementation MTPodcastPlaylistSettings(DB)

- (void)setNeedsUpdate:()DB
{
  v5 = [a1 playlist];
  unsigned int v6 = [v5 needsUpdate];

  uint64_t v7 = [a1 flags];
  if (((((v7 & 2) == 0) ^ a3) & 1) == 0)
  {
    uint64_t v8 = a3 | v6;
    uint64_t v9 = 2;
    if (!a3) {
      uint64_t v9 = 0;
    }
    [a1 setFlags:v7 & 0xFFFFFFFFFFFFFFFDLL | v9];
    v10 = [a1 playlist];
    [v10 setNeedsUpdate:v8];

    v11 = [a1 playlistIfDefault];
    LODWORD(v10) = [v11 needsUpdate];

    id v12 = [a1 playlistIfDefault];
    [v12 setNeedsUpdate:a3 | v10];
  }
}

- (unint64_t)needsUpdate
{
  return ((unint64_t)[a1 flags] >> 1) & 1;
}

@end
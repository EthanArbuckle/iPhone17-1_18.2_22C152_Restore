@interface MTPodcastPlaylistSettings
- (void)setNeedsUpdate:(BOOL)a3;
@end

@implementation MTPodcastPlaylistSettings

- (void)setNeedsUpdate:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(MTPodcastPlaylistSettings *)self playlist];
  unsigned int v6 = [v5 needsUpdate];

  uint64_t v7 = [(MTPodcastPlaylistSettings *)self flags];
  if (((((v7 & 2) == 0) ^ v3) & 1) == 0)
  {
    uint64_t v8 = v3 | v6;
    uint64_t v9 = 2;
    if (!v3) {
      uint64_t v9 = 0;
    }
    [(MTPodcastPlaylistSettings *)self setFlags:v7 & 0xFFFFFFFFFFFFFFFDLL | v9];
    v10 = [(MTPodcastPlaylistSettings *)self playlist];
    [v10 setNeedsUpdate:v8];

    v11 = [(MTPodcastPlaylistSettings *)self playlistIfDefault];
    LODWORD(v10) = [v11 needsUpdate];

    id v12 = [(MTPodcastPlaylistSettings *)self playlistIfDefault];
    [v12 setNeedsUpdate:v3 | v10];
  }
}

@end
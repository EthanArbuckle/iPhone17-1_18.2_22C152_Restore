@interface MTEpisode(Artwork)
+ (id)artworkForEpisodeUuid:()Artwork size:triggerDownload:;
+ (uint64_t)isImageCachedForEpisodeUuid:()Artwork;
+ (void)downloadArtworkIfNeededForEpisodeUuid:()Artwork successCallback:;
- (id)artworkWithSize:()Artwork;
- (id)playStatusImageForDarkBackground:()Artwork;
- (id)playStatusImageForTheme:()Artwork;
- (uint64_t)playStatusImage;
@end

@implementation MTEpisode(Artwork)

+ (uint64_t)isImageCachedForEpisodeUuid:()Artwork
{
  id v3 = a3;
  v4 = +[MTImageStore defaultStore];
  v5 = [v4 imageUrlForKey:v3];

  if (v5)
  {
    uint64_t v6 = 1;
  }
  else
  {
    v7 = (void *)MEMORY[0x1E4F91FA8];
    v8 = [MEMORY[0x1E4F91F60] sharedInstance];
    v9 = [v8 mainOrPrivateContext];
    v10 = [v7 podcastUuidForEpisodeUuid:v3 ctx:v9];

    uint64_t v6 = [MEMORY[0x1E4F91FA8] isImageCachedForPodcastUuid:v10];
  }

  return v6;
}

+ (id)artworkForEpisodeUuid:()Artwork size:triggerDownload:
{
  id v9 = a5;
  v10 = +[MTImageStore defaultStore];
  v11 = objc_msgSend(v10, "imageForKey:size:", v9, a1, a2);

  if (v11)
  {
    id v12 = v11;
  }
  else
  {
    v13 = (void *)MEMORY[0x1E4F91FA8];
    v14 = [MEMORY[0x1E4F91F60] sharedInstance];
    v15 = [v14 mainOrPrivateContext];
    v16 = [v13 podcastUuidForEpisodeUuid:v9 ctx:v15];

    objc_msgSend(MEMORY[0x1E4F91FA8], "artworkForPodcastUuid:size:triggerDownload:", v16, a6, a1, a2);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

+ (void)downloadArtworkIfNeededForEpisodeUuid:()Artwork successCallback:
{
  v5 = (void *)MEMORY[0x1E4F91FA8];
  uint64_t v6 = (void *)MEMORY[0x1E4F91F60];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 sharedInstance];
  v10 = [v9 mainOrPrivateContext];
  id v11 = [v5 podcastUuidForEpisodeUuid:v8 ctx:v10];

  [MEMORY[0x1E4F91FA8] downloadArtworkForPodcastIfNeeded:v11 successCallback:v7];
}

- (id)artworkWithSize:()Artwork
{
  uint64_t v6 = +[MTImageStore defaultStore];
  id v7 = [a1 uuid];
  id v8 = objc_msgSend(v6, "imageForKey:size:", v7, a2, a3);

  if (v8)
  {
    id v9 = v8;
  }
  else
  {
    v10 = (void *)MEMORY[0x1E4F91FA8];
    id v11 = [a1 podcastUuid];
    objc_msgSend(v10, "artworkForPodcastUuid:size:triggerDownload:", v11, 1, a2, a3);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (uint64_t)playStatusImage
{
  return [a1 playStatusImageForTheme:0];
}

- (id)playStatusImageForTheme:()Artwork
{
  id v4 = a3;
  uint64_t v5 = [a1 playState];
  if (v5 == 1)
  {
    uint64_t v6 = [MEMORY[0x1E4FB1818] halfPlayedIconForTheme:v4];
  }
  else if (v5 == 2)
  {
    uint64_t v6 = [MEMORY[0x1E4FB1818] unplayedIconForTheme:v4];
  }
  else if ([a1 isPartiallyPlayedBackCatalogItem])
  {
    uint64_t v6 = [MEMORY[0x1E4FB1818] backCatalogPartiallyPlayedIconForTheme:v4];
  }
  else
  {
    if ([a1 isBackCatalogItem]) {
      [MEMORY[0x1E4FB1818] backCatalogIconForTheme:v4];
    }
    else {
    uint64_t v6 = [MEMORY[0x1E4FB1818] playedIcon];
    }
  }
  id v7 = (void *)v6;

  return v7;
}

- (id)playStatusImageForDarkBackground:()Artwork
{
  uint64_t v5 = [a1 playState];
  if (v5 == 1)
  {
    uint64_t v6 = [MEMORY[0x1E4FB1818] halfPlayedIconForDarkBackground:a3];
  }
  else if (v5 == 2)
  {
    uint64_t v6 = [MEMORY[0x1E4FB1818] unplayedIconForDarkBackground:a3];
  }
  else if ([a1 isPartiallyPlayedBackCatalogItem])
  {
    uint64_t v6 = [MEMORY[0x1E4FB1818] backCatalogPartiallyPlayedIconForDarkBackground:a3];
  }
  else
  {
    if ([a1 isBackCatalogItem]) {
      [MEMORY[0x1E4FB1818] backCatalogIconForDarkBackground:a3];
    }
    else {
    uint64_t v6 = [MEMORY[0x1E4FB1818] playedIcon];
    }
  }

  return v6;
}

@end
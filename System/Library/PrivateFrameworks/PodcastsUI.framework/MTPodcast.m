@interface MTPodcast
@end

@implementation MTPodcast

void __65__MTPodcast_Artwork__fetchArtworkForPodcastUuid_size_completion___block_invoke(uint64_t a1)
{
  v2 = +[MTImageStore defaultStore];
  uint64_t v3 = objc_msgSend(v2, "imageForKey:size:", *(void *)(a1 + 32), *(double *)(a1 + 56), *(double *)(a1 + 64));

  v4 = (void *)v3;
  if (!v3)
  {
    [*(id *)(a1 + 72) downloadArtworkForPodcastIfNeeded:*(void *)(a1 + 32) successCallback:0];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    v4 = objc_msgSend(WeakRetained, "_defaultPlaceholderArtworkWithSize:", *(double *)(a1 + 56), *(double *)(a1 + 64));
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__MTPodcast_Artwork__fetchArtworkForPodcastUuid_size_completion___block_invoke_2;
  v7[3] = &unk_1E6E1FF68;
  id v10 = *(id *)(a1 + 40);
  id v8 = v4;
  id v9 = *(id *)(a1 + 32);
  BOOL v11 = v3 == 0;
  id v6 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

uint64_t __65__MTPodcast_Artwork__fetchArtworkForPodcastUuid_size_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(void *)(a1 + 32), *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 56));
}

uint64_t __69__MTPodcast_Artwork__asyncDiskArtworkForPodcastUuid_size_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __72__MTPodcast_Artwork__downloadArtworkForPodcastIfNeeded_successCallback___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2 != 0);
}

uint64_t __38__MTPodcast_Artwork___imageFetchQueue__block_invoke()
{
  _imageFetchQueue_queue = (uint64_t)dispatch_queue_create("com.apple.podcasts.podcast-artwork", MEMORY[0x1E4F14430]);

  return MEMORY[0x1F41817F8]();
}

@end
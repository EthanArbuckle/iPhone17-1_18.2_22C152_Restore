@interface MTEpisode
@end

@implementation MTEpisode

uint64_t __46__MTEpisode_NMSDownloadableItem__downloadInfo__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) uuid];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  v5 = [*(id *)(a1 + 32) podcast];
  uint64_t v6 = [v5 feedURL];
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  [*(id *)(a1 + 32) duration];
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v9;
  uint64_t result = [*(id *)(a1 + 32) byteSize];
  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = result;
  return result;
}

uint64_t __49__MTEpisode_NMSDownloadableItem___sizeEstimation__block_invoke()
{
  v0 = objc_alloc_init(NMSPodcastSizeEstimation);
  uint64_t v1 = _sizeEstimation_sizeEstimation;
  _sizeEstimation_sizeEstimation = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

@end
@interface FMSongAsset(PhotosGraph)
- (uint64_t)pg_requestDownloadIfNeeded;
@end

@implementation FMSongAsset(PhotosGraph)

- (uint64_t)pg_requestDownloadIfNeeded
{
  if (![a1 localURLExists]
    || (uint64_t result = [a1 contentUpdateAvailable], result))
  {
    return [a1 requestDownload];
  }
  return result;
}

@end
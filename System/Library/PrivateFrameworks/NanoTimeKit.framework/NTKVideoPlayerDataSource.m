@interface NTKVideoPlayerDataSource
- (NTKVideoPlayerDataSource)init;
- (NTKVideoPlayerListing)currentListing;
- (UIImage)posterImage;
- (id)listingToQueueOncePlaybackStarts;
- (id)listingsToQueueAfterCurrent;
- (void)setCurrentListing:(id)a3;
- (void)setPosterImage:(id)a3;
@end

@implementation NTKVideoPlayerDataSource

- (NTKVideoPlayerDataSource)init
{
  v6.receiver = self;
  v6.super_class = (Class)NTKVideoPlayerDataSource;
  v2 = [(NTKVideoPlayerDataSource *)&v6 init];
  v3 = v2;
  if (v2)
  {
    currentListing = v2->_currentListing;
    v2->_currentListing = 0;
  }
  return v3;
}

- (id)listingsToQueueAfterCurrent
{
  return 0;
}

- (id)listingToQueueOncePlaybackStarts
{
  return 0;
}

- (UIImage)posterImage
{
  return self->_posterImage;
}

- (void)setPosterImage:(id)a3
{
}

- (NTKVideoPlayerListing)currentListing
{
  return self->_currentListing;
}

- (void)setCurrentListing:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentListing, 0);
  objc_storeStrong((id *)&self->_posterImage, 0);
}

@end
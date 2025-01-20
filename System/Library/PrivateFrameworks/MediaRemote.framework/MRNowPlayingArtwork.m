@interface MRNowPlayingArtwork
- (BOOL)hasArtworkData;
- (id)copyImageData;
- (unsigned)type;
@end

@implementation MRNowPlayingArtwork

- (unsigned)type
{
  return 0;
}

- (BOOL)hasArtworkData
{
  return 0;
}

- (id)copyImageData
{
  return 0;
}

@end
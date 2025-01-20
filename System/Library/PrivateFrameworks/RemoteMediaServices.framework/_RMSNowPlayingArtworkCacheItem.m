@interface _RMSNowPlayingArtworkCacheItem
- (BOOL)beginContentAccess;
- (BOOL)isContentDiscarded;
- (NSData)artworkData;
- (NSString)artworkIdentifier;
- (void)discardContentIfPossible;
- (void)endContentAccess;
- (void)setArtworkData:(id)a3;
- (void)setArtworkIdentifier:(id)a3;
@end

@implementation _RMSNowPlayingArtworkCacheItem

- (BOOL)beginContentAccess
{
  artworkData = self->_artworkData;
  if (artworkData) {
    self->_keepAlive = 1;
  }
  return artworkData != 0;
}

- (void)endContentAccess
{
  self->_keepAlive = 0;
}

- (void)discardContentIfPossible
{
  if (!self->_keepAlive)
  {
    self->_artworkData = 0;
    MEMORY[0x270F9A758]();
  }
}

- (BOOL)isContentDiscarded
{
  return self->_artworkData == 0;
}

- (NSString)artworkIdentifier
{
  return self->_artworkIdentifier;
}

- (void)setArtworkIdentifier:(id)a3
{
}

- (NSData)artworkData
{
  return self->_artworkData;
}

- (void)setArtworkData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkData, 0);
  objc_storeStrong((id *)&self->_artworkIdentifier, 0);
}

@end
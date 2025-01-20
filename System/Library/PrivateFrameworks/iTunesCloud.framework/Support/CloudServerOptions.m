@interface CloudServerOptions
- (BOOL)prohibitArtworkPrefetch;
- (BOOL)prohibitLibraryUpload;
- (BOOL)supportsAutomaticEnablingiCloudMusicLibrary;
- (void)setProhibitArtworkPrefetch:(BOOL)a3;
- (void)setProhibitLibraryUpload:(BOOL)a3;
- (void)setSupportsAutomaticEnablingiCloudMusicLibrary:(BOOL)a3;
@end

@implementation CloudServerOptions

- (void)setSupportsAutomaticEnablingiCloudMusicLibrary:(BOOL)a3
{
  self->_supportsAutomaticEnablingiCloudMusicLibrary = a3;
}

- (BOOL)prohibitArtworkPrefetch
{
  return self->_prohibitArtworkPrefetch;
}

- (BOOL)supportsAutomaticEnablingiCloudMusicLibrary
{
  return self->_supportsAutomaticEnablingiCloudMusicLibrary;
}

- (void)setProhibitArtworkPrefetch:(BOOL)a3
{
  self->_prohibitArtworkPrefetch = a3;
}

- (void)setProhibitLibraryUpload:(BOOL)a3
{
  self->_prohibitLibraryUpload = a3;
}

- (BOOL)prohibitLibraryUpload
{
  return self->_prohibitLibraryUpload;
}

@end
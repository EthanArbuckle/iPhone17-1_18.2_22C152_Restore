@interface ML3MutableDatabaseImport
- (void)setFileHandle:(id)a3;
- (void)setHomeSharingBasePlaylistID:(unsigned int)a3;
- (void)setIsServerImport:(BOOL)a3;
- (void)setLibraryPath:(id)a3;
- (void)setPairedDeviceCanProcessStandaloneCollections:(BOOL)a3;
- (void)setPendingMatch:(BOOL)a3;
- (void)setPlaylistData:(id)a3;
- (void)setPlaylistsAreLibraryOwnedContent:(BOOL)a3;
- (void)setPreferredVideoQuality:(int64_t)a3;
- (void)setResetSync:(BOOL)a3;
- (void)setSagaEnabled:(BOOL)a3;
- (void)setStoreAccountID:(int64_t)a3;
- (void)setSuspendable:(BOOL)a3;
- (void)setSyncAnchor:(id)a3;
- (void)setSyncLibraryID:(id)a3;
- (void)setTrackData:(id)a3;
- (void)setTracksAreLibraryOwnedContent:(BOOL)a3;
@end

@implementation ML3MutableDatabaseImport

- (void)setPairedDeviceCanProcessStandaloneCollections:(BOOL)a3
{
  self->super._pairedDeviceCanProcessStandaloneCollections = a3;
}

- (void)setSuspendable:(BOOL)a3
{
  self->super._suspendable = a3;
}

- (void)setSyncLibraryID:(id)a3
{
  self->super._syncLibraryID = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (void)setIsServerImport:(BOOL)a3
{
  self->super._isServerImport = a3;
}

- (void)setPendingMatch:(BOOL)a3
{
  self->super._pendingMatch = a3;
}

- (void)setPlaylistsAreLibraryOwnedContent:(BOOL)a3
{
  self->super._playlistsAreLibraryOwnedContent = a3;
}

- (void)setTracksAreLibraryOwnedContent:(BOOL)a3
{
  self->super._tracksAreLibraryOwnedContent = a3;
}

- (void)setHomeSharingBasePlaylistID:(unsigned int)a3
{
  self->super._homeSharingBasePlaylistID = a3;
}

- (void)setPreferredVideoQuality:(int64_t)a3
{
  self->super._preferredVideoQuality = a3;
}

- (void)setStoreAccountID:(int64_t)a3
{
  self->super._storeAccountID = a3;
}

- (void)setSagaEnabled:(BOOL)a3
{
  self->super._sagaEnabled = a3;
}

- (void)setResetSync:(BOOL)a3
{
  self->super._resetSync = a3;
}

- (void)setSyncAnchor:(id)a3
{
  self->super._syncAnchor = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (void)setFileHandle:(id)a3
{
}

- (void)setPlaylistData:(id)a3
{
  self->super._playlistData = (NSData *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (void)setTrackData:(id)a3
{
  self->super._trackData = (NSData *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (void)setLibraryPath:(id)a3
{
  self->super._libraryPath = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

@end
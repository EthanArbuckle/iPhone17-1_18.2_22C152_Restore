@interface ICMutablePlayActivityEventContainerIDs
- (id)copyWithZone:(_NSZone *)a3;
- (void)setAdamID:(int64_t)a3;
- (void)setCloudAlbumID:(id)a3;
- (void)setCloudPlaylistID:(unint64_t)a3;
- (void)setGlobalPlaylistID:(id)a3;
- (void)setPlaylistVersionHash:(id)a3;
- (void)setStationHash:(id)a3;
- (void)setStationID:(int64_t)a3;
- (void)setStationStringID:(id)a3;
@end

@implementation ICMutablePlayActivityEventContainerIDs

- (void)setStationStringID:(id)a3
{
  v4 = (NSString *)[a3 copy];
  stationStringID = self->super._stationStringID;
  self->super._stationStringID = v4;

  MEMORY[0x1F41817F8](v4, stationStringID);
}

- (void)setStationID:(int64_t)a3
{
  self->super._stationID = a3;
}

- (void)setStationHash:(id)a3
{
  v4 = (NSString *)[a3 copy];
  stationHash = self->super._stationHash;
  self->super._stationHash = v4;

  MEMORY[0x1F41817F8](v4, stationHash);
}

- (void)setPlaylistVersionHash:(id)a3
{
  v4 = (NSString *)[a3 copy];
  playlistVersionHash = self->super._playlistVersionHash;
  self->super._playlistVersionHash = v4;

  MEMORY[0x1F41817F8](v4, playlistVersionHash);
}

- (void)setGlobalPlaylistID:(id)a3
{
  v4 = (NSString *)[a3 copy];
  globalPlaylistID = self->super._globalPlaylistID;
  self->super._globalPlaylistID = v4;

  MEMORY[0x1F41817F8](v4, globalPlaylistID);
}

- (void)setCloudPlaylistID:(unint64_t)a3
{
  self->super._cloudPlaylistID = a3;
}

- (void)setCloudAlbumID:(id)a3
{
  v4 = (NSString *)[a3 copy];
  cloudAlbumID = self->super._cloudAlbumID;
  self->super._cloudAlbumID = v4;

  MEMORY[0x1F41817F8](v4, cloudAlbumID);
}

- (void)setAdamID:(int64_t)a3
{
  self->super._adamID = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_opt_class();

  return [(ICPlayActivityEventContainerIDs *)self _copyWithClass:v4];
}

@end
@interface ML3MigrationMisgroupedAlbum
- (ML3MigrationMisgroupedAlbum)initWithAlbumPID:(int64_t)a3 albumArtistPID:(int64_t)a4;
- (NSArray)misgroupedTracks;
- (int64_t)albumArtistPID;
- (int64_t)albumPID;
- (void)addMisgroupedTrack:(id)a3;
@end

@implementation ML3MigrationMisgroupedAlbum

- (void).cxx_destruct
{
}

- (int64_t)albumArtistPID
{
  return self->_albumArtistPID;
}

- (int64_t)albumPID
{
  return self->_albumPID;
}

- (NSArray)misgroupedTracks
{
  return (NSArray *)self->_misgroupedTracks;
}

- (void)addMisgroupedTrack:(id)a3
{
}

- (ML3MigrationMisgroupedAlbum)initWithAlbumPID:(int64_t)a3 albumArtistPID:(int64_t)a4
{
  v11.receiver = self;
  v11.super_class = (Class)ML3MigrationMisgroupedAlbum;
  v6 = [(ML3MigrationMisgroupedAlbum *)&v11 init];
  v7 = v6;
  if (v6)
  {
    v6->_albumPID = a3;
    v6->_albumArtistPID = a4;
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    misgroupedTracks = v7->_misgroupedTracks;
    v7->_misgroupedTracks = v8;
  }
  return v7;
}

@end
@interface SREMusicMetadata
- (NSString)genreID;
- (SREMusicMetadata)init;
- (int64_t)adamID;
- (int64_t)albumAdamID;
- (int64_t)artistAdamID;
- (void)setAdamID:(int64_t)a3;
- (void)setAlbumAdamID:(int64_t)a3;
- (void)setArtistAdamID:(int64_t)a3;
- (void)setGenreID:(id)a3;
@end

@implementation SREMusicMetadata

- (SREMusicMetadata)init
{
  v3.receiver = self;
  v3.super_class = (Class)SREMusicMetadata;
  return [(SREMusicMetadata *)&v3 init];
}

- (int64_t)adamID
{
  return self->adamID;
}

- (void)setAdamID:(int64_t)a3
{
  self->adamID = a3;
}

- (int64_t)artistAdamID
{
  return self->artistAdamID;
}

- (void)setArtistAdamID:(int64_t)a3
{
  self->artistAdamID = a3;
}

- (int64_t)albumAdamID
{
  return self->albumAdamID;
}

- (void)setAlbumAdamID:(int64_t)a3
{
  self->albumAdamID = a3;
}

- (NSString)genreID
{
  return self->genreID;
}

- (void)setGenreID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
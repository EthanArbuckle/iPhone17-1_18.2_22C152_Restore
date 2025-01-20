@interface ICMusicLibraryContentItemSnapshot
- (BOOL)hasArtistAndAlbumData;
- (BOOL)isValid;
- (ICMusicLibraryContentItemSnapshot)initWithSong:(id)a3;
- (ICMusicLibraryContentMetadataDescriptor)albumMetadataDescriptor;
- (ICMusicLibraryContentMetadataDescriptor)artistMetadataDescriptor;
- (ICMusicLibraryContentMetadataDescriptor)songMetadataDescriptor;
- (NSDate)lastPlayedDate;
- (NSDate)libraryAddedDate;
- (float)userRating;
- (id)debugDescription;
- (int64_t)playCount;
- (int64_t)skipCount;
- (void)setAlbumMetadataDescriptor:(id)a3;
- (void)setArtistMetadataDescriptor:(id)a3;
- (void)setHasArtistAndAlbumData:(BOOL)a3;
- (void)setLastPlayedDate:(id)a3;
- (void)setLibraryAddedDate:(id)a3;
- (void)setPlayCount:(int64_t)a3;
- (void)setSkipCount:(int64_t)a3;
- (void)setSongMetadataDescriptor:(id)a3;
- (void)setUserRating:(float)a3;
@end

@implementation ICMusicLibraryContentItemSnapshot

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryAddedDate, 0);
  objc_storeStrong((id *)&self->_lastPlayedDate, 0);
  objc_storeStrong((id *)&self->_albumMetadataDescriptor, 0);
  objc_storeStrong((id *)&self->_artistMetadataDescriptor, 0);

  objc_storeStrong((id *)&self->_songMetadataDescriptor, 0);
}

- (void)setHasArtistAndAlbumData:(BOOL)a3
{
  self->_hasArtistAndAlbumData = a3;
}

- (BOOL)hasArtistAndAlbumData
{
  return self->_hasArtistAndAlbumData;
}

- (void)setLibraryAddedDate:(id)a3
{
}

- (NSDate)libraryAddedDate
{
  return self->_libraryAddedDate;
}

- (void)setLastPlayedDate:(id)a3
{
}

- (NSDate)lastPlayedDate
{
  return self->_lastPlayedDate;
}

- (void)setUserRating:(float)a3
{
  self->_userRating = a3;
}

- (float)userRating
{
  return self->_userRating;
}

- (void)setSkipCount:(int64_t)a3
{
  self->_skipCount = a3;
}

- (int64_t)skipCount
{
  return self->_skipCount;
}

- (void)setPlayCount:(int64_t)a3
{
  self->_playCount = a3;
}

- (int64_t)playCount
{
  return self->_playCount;
}

- (void)setAlbumMetadataDescriptor:(id)a3
{
}

- (ICMusicLibraryContentMetadataDescriptor)albumMetadataDescriptor
{
  return self->_albumMetadataDescriptor;
}

- (void)setArtistMetadataDescriptor:(id)a3
{
}

- (ICMusicLibraryContentMetadataDescriptor)artistMetadataDescriptor
{
  return self->_artistMetadataDescriptor;
}

- (void)setSongMetadataDescriptor:(id)a3
{
}

- (ICMusicLibraryContentMetadataDescriptor)songMetadataDescriptor
{
  return self->_songMetadataDescriptor;
}

- (id)debugDescription
{
  v3 = [(ICMusicLibraryContentMetadataDescriptor *)self->_artistMetadataDescriptor title];
  v4 = [(ICMusicLibraryContentMetadataDescriptor *)self->_songMetadataDescriptor title];
  v5 = [(ICMusicLibraryContentMetadataDescriptor *)self->_albumMetadataDescriptor title];
  v6 = +[NSString stringWithFormat:@"%@ - %@ - %@, playCount: %ld", v3, v4, v5, self->_playCount];
  id v7 = [v6 mutableCopy];

  if (self->_lastPlayedDate) {
    id v8 = [v7 stringByAppendingFormat:@", lastPlayedDate: %@", self->_lastPlayedDate];
  }

  return v7;
}

- (BOOL)isValid
{
  return self->_hasArtistAndAlbumData;
}

- (ICMusicLibraryContentItemSnapshot)initWithSong:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)ICMusicLibraryContentItemSnapshot;
  v5 = [(ICMusicLibraryContentItemSnapshot *)&v28 init];
  v6 = v5;
  if (v5)
  {
    v5->_hasArtistAndAlbumData = 1;
    id v7 = [ICMusicLibraryContentMetadataDescriptor alloc];
    id v8 = [v4 title];
    v9 = [v4 identifiers];
    v10 = [v9 universalStore];
    v11 = -[ICMusicLibraryContentMetadataDescriptor initWithTitle:andStoreAdamID:](v7, "initWithTitle:andStoreAdamID:", v8, [v10 adamID]);
    [(ICMusicLibraryContentItemSnapshot *)v6 setSongMetadataDescriptor:v11];

    v12 = [v4 artist];
    if (!v12) {
      v6->_hasArtistAndAlbumData = 0;
    }
    v13 = [ICMusicLibraryContentMetadataDescriptor alloc];
    v14 = [v12 name];
    v15 = [v12 identifiers];
    v16 = [v15 universalStore];
    v17 = -[ICMusicLibraryContentMetadataDescriptor initWithTitle:andStoreAdamID:](v13, "initWithTitle:andStoreAdamID:", v14, [v16 adamID]);
    [(ICMusicLibraryContentItemSnapshot *)v6 setArtistMetadataDescriptor:v17];

    uint64_t v18 = [v4 album];
    v19 = (void *)v18;
    if (v6->_hasArtistAndAlbumData && !v18) {
      v6->_hasArtistAndAlbumData = 0;
    }
    v20 = [ICMusicLibraryContentMetadataDescriptor alloc];
    v21 = [v19 title];
    v22 = [v19 identifiers];
    v23 = [v22 universalStore];
    v24 = -[ICMusicLibraryContentMetadataDescriptor initWithTitle:andStoreAdamID:](v20, "initWithTitle:andStoreAdamID:", v21, [v23 adamID]);
    [(ICMusicLibraryContentItemSnapshot *)v6 setAlbumMetadataDescriptor:v24];

    -[ICMusicLibraryContentItemSnapshot setPlayCount:](v6, "setPlayCount:", [v4 playCount]);
    -[ICMusicLibraryContentItemSnapshot setSkipCount:](v6, "setSkipCount:", [v4 skipCount]);
    [v4 userRating];
    -[ICMusicLibraryContentItemSnapshot setUserRating:](v6, "setUserRating:");
    v25 = [v4 lastDevicePlaybackDate];
    [(ICMusicLibraryContentItemSnapshot *)v6 setLastPlayedDate:v25];

    v26 = [v4 libraryAddedDate];
    [(ICMusicLibraryContentItemSnapshot *)v6 setLibraryAddedDate:v26];
  }
  return v6;
}

@end
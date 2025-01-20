@interface MCDPlaylistTracksDataSource
- (Class)requestItemClass;
- (MCDPlaylistTracksDataSource)initWithLimitedUI:(BOOL)a3 playlist:(id)a4;
- (MPModelPlaylist)playlist;
- (id)itemSortDescriptors;
- (id)requestItemKind;
- (id)requestItemProperties;
- (id)requestLabel;
- (id)scopedContainers;
- (void)setPlaylist:(id)a3;
@end

@implementation MCDPlaylistTracksDataSource

- (MCDPlaylistTracksDataSource)initWithLimitedUI:(BOOL)a3 playlist:(id)a4
{
  BOOL v5 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MCDPlaylistTracksDataSource;
  v8 = [(_MCDLibraryDataSource *)&v11 initWithLimitedUI:v5];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_playlist, a4);
  }

  return v9;
}

- (Class)requestItemClass
{
  return (Class)objc_opt_class();
}

- (id)requestItemKind
{
  v2 = +[MPModelSong kindWithVariants:1];
  v6 = v2;
  v3 = +[NSArray arrayWithObjects:&v6 count:1];
  v4 = +[MPModelPlaylistEntry kindWithKinds:v3];

  return v4;
}

- (id)requestLabel
{
  return @"Playlist Detail CarPlay View Controller";
}

- (id)requestItemProperties
{
  id v2 = objc_alloc((Class)MPPropertySet);
  v31[0] = MPModelPropertySongTitle;
  v31[1] = MPModelPropertySongDuration;
  v31[2] = MPModelPropertySongArtwork;
  v31[3] = MPModelPropertySongExplicit;
  v31[4] = MPModelPropertySongIsFavorite;
  v31[5] = MPModelPropertySongIsDisliked;
  v31[6] = MPModelPropertySongLibraryAdded;
  v31[7] = MPModelPropertySongShouldShowComposer;
  v31[8] = MPModelPropertySongArtistUploadedContent;
  v3 = +[NSArray arrayWithObjects:v31 count:9];
  v29[0] = MPModelRelationshipSongArtist;
  uint64_t v28 = MPModelPropertyArtistName;
  v4 = +[NSArray arrayWithObjects:&v28 count:1];
  BOOL v5 = +[MPPropertySet propertySetWithProperties:v4];
  v30[0] = v5;
  v29[1] = MPModelRelationshipSongAlbum;
  uint64_t v27 = MPModelPropertyAlbumTitle;
  v6 = +[NSArray arrayWithObjects:&v27 count:1];
  id v7 = +[MPPropertySet propertySetWithProperties:v6];
  v30[1] = v7;
  v29[2] = MPModelRelationshipSongComposer;
  uint64_t v26 = MPModelPropertyComposerName;
  v8 = +[NSArray arrayWithObjects:&v26 count:1];
  v9 = +[MPPropertySet propertySetWithProperties:v8];
  v30[2] = v9;
  v10 = +[NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:3];
  id v11 = [v2 initWithProperties:v3 relationships:v10];

  v12 = objc_opt_class();
  v13 = [v12 requiredPlaylistEntryPropertiesForModelClass:objc_opt_class()];
  v14 = [v11 propertySetByCombiningWithPropertySet:v13];

  v25[0] = v14;
  v24[0] = MPModelRelationshipPlaylistEntrySong;
  v24[1] = MPModelRelationshipPlaylistEntrySocialContributor;
  v23[0] = MPModelPropertySocialPersonName;
  v23[1] = MPModelPropertySocialPersonArtwork;
  v15 = +[NSArray arrayWithObjects:v23 count:2];
  v16 = +[MPPropertySet propertySetWithProperties:v15];
  v25[1] = v16;
  v17 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:2];

  id v18 = [objc_alloc((Class)MPPropertySet) initWithProperties:0 relationships:v17];
  v19 = objc_opt_class();
  v20 = [v19 requiredPlaylistEntryPropertiesForModelClass:objc_opt_class()];
  v21 = [v18 propertySetByCombiningWithPropertySet:v20];

  return v21;
}

- (id)itemSortDescriptors
{
  id v2 = [(MCDPlaylistTracksDataSource *)self playlist];
  v3 = [v2 preferredTracklistSortDescriptors];

  return v3;
}

- (id)scopedContainers
{
  id v2 = [(MCDPlaylistTracksDataSource *)self playlist];
  BOOL v5 = v2;
  v3 = +[NSArray arrayWithObjects:&v5 count:1];

  return v3;
}

- (MPModelPlaylist)playlist
{
  return self->_playlist;
}

- (void)setPlaylist:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
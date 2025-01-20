@interface MCDNowPlayingDataSource
- (id)_propertySet;
- (id)playingItemProperties;
- (id)queueItemProperties;
- (id)queueSectionProperties;
- (id)requestLabel;
@end

@implementation MCDNowPlayingDataSource

- (id)queueSectionProperties
{
  id v2 = objc_alloc((Class)MPPropertySet);
  v15[0] = MPModelRelationshipGenericAlbum;
  uint64_t v14 = MPModelPropertyAlbumTitle;
  v3 = +[NSArray arrayWithObjects:&v14 count:1];
  v4 = +[MPPropertySet propertySetWithProperties:v3];
  v16[0] = v4;
  v15[1] = MPModelRelationshipGenericPlaylist;
  v13[0] = MPModelPropertyPlaylistName;
  v13[1] = MPModelPropertyPlaylistCollaboratorStatus;
  v5 = +[NSArray arrayWithObjects:v13 count:2];
  v6 = +[MPPropertySet propertySetWithProperties:v5];
  v16[1] = v6;
  v15[2] = MPModelRelationshipGenericRadioStation;
  v12[0] = MPModelPropertyRadioStationName;
  v12[1] = MPModelPropertyRadioStationType;
  v12[2] = MPModelPropertyRadioStationAttributionLabel;
  v7 = +[NSArray arrayWithObjects:v12 count:3];
  v8 = +[MPPropertySet propertySetWithProperties:v7];
  v16[2] = v8;
  v9 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:3];
  id v10 = [v2 initWithProperties:0 relationships:v9];

  return v10;
}

- (id)_propertySet
{
  id v21 = objc_alloc((Class)MPPropertySet);
  v36[0] = MPModelPropertySongTitle;
  v36[1] = MPModelPropertySongExplicit;
  v36[2] = MPModelPropertySongIsFavorite;
  v36[3] = MPModelPropertySongIsDisliked;
  v36[4] = MPModelPropertySongArtwork;
  v36[5] = MPModelPropertySongDuration;
  v36[6] = MPModelPropertySongHasVideo;
  v36[7] = MPModelPropertySongLibraryAdded;
  v36[8] = MPModelPropertySongLibraryAddEligible;
  v36[9] = MPModelPropertySongShouldShowComposer;
  v36[10] = MPModelPropertySongArtistUploadedContent;
  v20 = +[NSArray arrayWithObjects:v36 count:11];
  v34[0] = MPModelRelationshipSongComposer;
  uint64_t v33 = MPModelPropertyComposerName;
  v23 = +[NSArray arrayWithObjects:&v33 count:1];
  v22 = +[MPPropertySet propertySetWithProperties:v23];
  v35[0] = v22;
  v34[1] = MPModelRelationshipSongAlbum;
  id v2 = objc_alloc((Class)MPPropertySet);
  v32[0] = MPModelPropertyAlbumTitle;
  v32[1] = MPModelPropertyAlbumLibraryAdded;
  v3 = +[NSArray arrayWithObjects:v32 count:2];
  uint64_t v30 = MPModelRelationshipAlbumArtist;
  uint64_t v4 = MPModelPropertyArtistName;
  uint64_t v29 = MPModelPropertyArtistName;
  v5 = +[NSArray arrayWithObjects:&v29 count:1];
  v6 = +[MPPropertySet propertySetWithProperties:v5];
  v31 = v6;
  v7 = +[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
  id v8 = [v2 initWithProperties:v3 relationships:v7];
  v35[1] = v8;
  v34[2] = MPModelRelationshipSongArtist;
  uint64_t v28 = v4;
  v9 = +[NSArray arrayWithObjects:&v28 count:1];
  id v10 = +[MPPropertySet propertySetWithProperties:v9];
  v35[2] = v10;
  v11 = +[NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:3];
  id v12 = [v21 initWithProperties:v20 relationships:v11];

  id v13 = objc_alloc((Class)MPPropertySet);
  v27[0] = v12;
  v26[0] = MPModelRelationshipGenericSong;
  v26[1] = MPModelRelationshipGenericPlaylistEntry;
  id v14 = objc_alloc((Class)MPPropertySet);
  uint64_t v24 = MPModelRelationshipPlaylistEntrySong;
  id v25 = v12;
  v15 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
  id v16 = [v14 initWithProperties:&__NSArray0__struct relationships:v15];
  v27[1] = v16;
  v17 = +[NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:2];
  id v18 = [v13 initWithProperties:0 relationships:v17];

  return v18;
}

- (id)requestLabel
{
  return @"CarPlay Now Playing Request";
}

- (id)queueItemProperties
{
  return [(MCDNowPlayingDataSource *)self _propertySet];
}

- (id)playingItemProperties
{
  return [(MCDNowPlayingDataSource *)self _propertySet];
}

@end
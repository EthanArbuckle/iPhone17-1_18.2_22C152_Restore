@interface MCDFuseDataSource
- (MPPropertySet)albumProperties;
- (MPPropertySet)curatorProperties;
- (MPPropertySet)itemProperties;
- (MPPropertySet)playlistProperties;
- (MPPropertySet)radioStationProperties;
- (MPPropertySet)sectionProperties;
- (MPPropertySet)songProperties;
- (double)timeoutInterval;
@end

@implementation MCDFuseDataSource

- (double)timeoutInterval
{
  return 20.0;
}

- (MPPropertySet)sectionProperties
{
  return (MPPropertySet *)+[MPPropertySet emptyPropertySet];
}

- (MPPropertySet)itemProperties
{
  return (MPPropertySet *)+[MPPropertySet emptyPropertySet];
}

- (MPPropertySet)albumProperties
{
  id v2 = objc_alloc((Class)MPPropertySet);
  v15[0] = MPModelPropertyAlbumTitle;
  v15[1] = MPModelPropertyAlbumIsFavorite;
  v15[2] = MPModelPropertyAlbumIsDisliked;
  v15[3] = MPModelPropertyAlbumIsClassical;
  v15[4] = MPModelPropertyAlbumArtwork;
  v15[5] = MPModelPropertyAlbumSongPopularity;
  v15[6] = MPModelPropertyAlbumLibraryAddEligible;
  v15[7] = MPModelPropertyAlbumIsCompilation;
  v3 = +[NSArray arrayWithObjects:v15 count:8];
  v13[0] = MPModelRelationshipAlbumArtist;
  uint64_t v12 = MPModelPropertyArtistName;
  v4 = +[NSArray arrayWithObjects:&v12 count:1];
  v5 = +[MPPropertySet propertySetWithProperties:v4];
  v14[0] = v5;
  v13[1] = MPModelRelationshipAlbumGenre;
  uint64_t v11 = MPModelPropertyGenreName;
  v6 = +[NSArray arrayWithObjects:&v11 count:1];
  v7 = +[MPPropertySet propertySetWithProperties:v6];
  v14[1] = v7;
  v8 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
  id v9 = [v2 initWithProperties:v3 relationships:v8];

  return (MPPropertySet *)v9;
}

- (MPPropertySet)songProperties
{
  id v2 = objc_alloc((Class)MPPropertySet);
  v23[0] = MPModelPropertySongTitle;
  v23[1] = MPModelPropertySongExplicit;
  v23[2] = MPModelPropertySongIsFavorite;
  v23[3] = MPModelPropertySongIsDisliked;
  v23[4] = MPModelPropertySongArtwork;
  v23[5] = MPModelPropertySongShouldShowComposer;
  v15 = +[NSArray arrayWithObjects:v23 count:6];
  v21[0] = MPModelRelationshipSongAlbum;
  id v3 = objc_alloc((Class)MPPropertySet);
  v20[0] = MPModelPropertyAlbumTitle;
  v20[1] = MPModelPropertyAlbumIsFavorite;
  v20[2] = MPModelPropertyAlbumIsDisliked;
  v20[3] = MPModelPropertyAlbumReleaseDateComponents;
  v20[4] = MPModelPropertyAlbumYear;
  v14 = +[NSArray arrayWithObjects:v20 count:5];
  uint64_t v18 = MPModelRelationshipAlbumArtist;
  v4 = +[MPPropertySet propertySetWithProperties:&__NSArray0__struct];
  v19 = v4;
  v5 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
  id v6 = [v3 initWithProperties:v14 relationships:v5];
  v22[0] = v6;
  v21[1] = MPModelRelationshipSongArtist;
  uint64_t v17 = MPModelPropertyArtistName;
  v7 = +[NSArray arrayWithObjects:&v17 count:1];
  v8 = +[MPPropertySet propertySetWithProperties:v7];
  v22[1] = v8;
  v21[2] = MPModelRelationshipSongComposer;
  uint64_t v16 = MPModelPropertyComposerName;
  id v9 = +[NSArray arrayWithObjects:&v16 count:1];
  v10 = +[MPPropertySet propertySetWithProperties:v9];
  v22[2] = v10;
  uint64_t v11 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:3];
  id v12 = [v2 initWithProperties:v15 relationships:v11];

  return (MPPropertySet *)v12;
}

- (MPPropertySet)playlistProperties
{
  id v2 = objc_alloc((Class)MPPropertySet);
  v12[0] = MPModelPropertyPlaylistName;
  v12[1] = MPModelPropertyPlaylistArtwork;
  v12[2] = MPModelPropertyPlaylistEditorialArtwork;
  v12[3] = MPModelPropertyPlaylistTracksTiledArtwork;
  v12[4] = MPModelPropertyPlaylistType;
  v12[5] = MPModelPropertyPlaylistCuratorPlaylist;
  v12[6] = MPModelPropertyPlaylistIsFavorite;
  v12[7] = MPModelPropertyPlaylistIsDisliked;
  v12[8] = MPModelPropertyPlaylistPublicPlaylist;
  v12[9] = MPModelPropertyPlaylistVisiblePlaylist;
  v12[10] = MPModelPropertyPlaylistLastModifiedDateComponents;
  v12[11] = MPModelPropertyPlaylistLibraryAdded;
  id v3 = +[NSArray arrayWithObjects:v12 count:12];
  uint64_t v10 = MPModelRelationshipPlaylistCurator;
  uint64_t v9 = MPModelPropertyCuratorName;
  v4 = +[NSArray arrayWithObjects:&v9 count:1];
  v5 = +[MPPropertySet propertySetWithProperties:v4];
  uint64_t v11 = v5;
  id v6 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  id v7 = [v2 initWithProperties:v3 relationships:v6];

  return (MPPropertySet *)v7;
}

- (MPPropertySet)curatorProperties
{
  v5[0] = MPModelPropertyCuratorName;
  v5[1] = MPModelPropertyCuratorShortName;
  v5[2] = MPModelPropertyCuratorKind;
  v5[3] = MPModelPropertyCuratorEditorialArtwork;
  id v2 = +[NSArray arrayWithObjects:v5 count:4];
  id v3 = +[MPPropertySet propertySetWithProperties:v2];

  return (MPPropertySet *)v3;
}

- (MPPropertySet)radioStationProperties
{
  v5[0] = MPModelPropertyRadioStationBeats1;
  v5[1] = MPModelPropertyRadioStationSubtype;
  v5[2] = MPModelPropertyRadioStationName;
  v5[3] = MPModelPropertyRadioStationEditorNotes;
  void v5[4] = MPModelPropertyRadioStationShortEditorNotes;
  v5[5] = MPModelPropertyRadioStationArtwork;
  v5[6] = MPModelPropertyRadioStationGlyph;
  id v2 = +[NSArray arrayWithObjects:v5 count:7];
  id v3 = +[MPPropertySet propertySetWithProperties:v2];

  return (MPPropertySet *)v3;
}

@end
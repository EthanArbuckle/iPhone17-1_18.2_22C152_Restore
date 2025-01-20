@interface MCDRecentlyAddedDataSource
- (_NSRange)contentRange;
- (id)itemSortDescriptors;
- (id)requestItemKind;
- (id)requestItemProperties;
- (id)requestLabel;
@end

@implementation MCDRecentlyAddedDataSource

- (id)requestItemKind
{
  v12[0] = MPModelRelationshipGenericAlbum;
  v2 = +[MPModelSong kindWithVariants:1];
  v3 = +[MPModelAlbum kindWithSongKind:v2];
  v13[0] = v3;
  v12[1] = MPModelRelationshipGenericPlaylist;
  v4 = +[MPModelSong kindWithVariants:1];
  v11 = v4;
  v5 = +[NSArray arrayWithObjects:&v11 count:1];
  v6 = +[MPModelPlaylistEntry kindWithKinds:v5];
  v7 = +[MPModelPlaylist kindWithPlaylistEntryKind:v6 options:4];
  v13[1] = v7;
  v8 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
  v9 = +[MPModelGenericObject kindWithRelationshipKinds:v8];

  return v9;
}

- (id)requestLabel
{
  return @"Recently Added CarPlay View Controller";
}

- (id)requestItemProperties
{
  v28[0] = MPModelPropertyAlbumTitle;
  v28[1] = MPModelPropertyAlbumIsFavorite;
  v28[2] = MPModelPropertyAlbumIsDisliked;
  v28[3] = MPModelPropertyAlbumArtwork;
  v28[4] = MPModelPropertyAlbumIsCompilation;
  v28[5] = MPModelPropertyAlbumTrackCount;
  v28[6] = MPModelPropertyAlbumSongPopularity;
  v2 = +[NSArray arrayWithObjects:v28 count:7];
  v26[0] = MPModelRelationshipAlbumArtist;
  uint64_t v25 = MPModelPropertyArtistName;
  v3 = +[NSArray arrayWithObjects:&v25 count:1];
  v4 = +[MPPropertySet propertySetWithProperties:v3];
  v27[0] = v4;
  v26[1] = MPModelRelationshipAlbumRepresentativeSong;
  uint64_t v24 = MPModelPropertySongTitle;
  v5 = +[NSArray arrayWithObjects:&v24 count:1];
  v6 = +[MPPropertySet propertySetWithProperties:v5];
  v27[1] = v6;
  v7 = +[NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:2];

  id v8 = [objc_alloc((Class)MPPropertySet) initWithProperties:v2 relationships:v7];
  v23[0] = MPModelPropertyPlaylistName;
  v23[1] = MPModelPropertyPlaylistIsFavorite;
  v23[2] = MPModelPropertyPlaylistIsDisliked;
  v23[3] = MPModelPropertyPlaylistArtwork;
  v23[4] = MPModelPropertyPlaylistType;
  v23[5] = MPModelPropertyPlaylistTracksTiledArtwork;
  v23[6] = MPModelPropertyPlaylistLastModifiedDateComponents;
  v23[7] = MPModelPropertyPlaylistLibraryAdded;
  v9 = +[NSArray arrayWithObjects:v23 count:8];
  uint64_t v21 = MPModelRelationshipPlaylistCurator;
  uint64_t v20 = MPModelPropertyCuratorName;
  v10 = +[NSArray arrayWithObjects:&v20 count:1];
  v11 = +[MPPropertySet propertySetWithProperties:v10];
  v22 = v11;
  v12 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];

  id v13 = [objc_alloc((Class)MPPropertySet) initWithProperties:v9 relationships:v12];
  id v14 = objc_alloc((Class)MPPropertySet);
  v18[0] = MPModelRelationshipGenericAlbum;
  v18[1] = MPModelRelationshipGenericPlaylist;
  v19[0] = v8;
  v19[1] = v13;
  v15 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];
  id v16 = [v14 initWithProperties:0 relationships:v15];

  return v16;
}

- (id)itemSortDescriptors
{
  v6[0] = MPModelRelationshipGenericAlbum;
  v6[1] = MPModelRelationshipGenericPlaylist;
  v7[0] = MPModelPropertyAlbumLibraryAddedDate;
  v7[1] = MPModelPropertyPlaylistLibraryAddedDate;
  v2 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];
  v3 = +[MPMultiSortDescriptor sortDescriptorWithRelatedProperties:v2 ascending:0];
  id v8 = v3;
  v4 = +[NSArray arrayWithObjects:&v8 count:1];

  return v4;
}

- (_NSRange)contentRange
{
  NSUInteger v2 = 0;
  NSUInteger v3 = 20;
  result.length = v3;
  result.location = v2;
  return result;
}

@end
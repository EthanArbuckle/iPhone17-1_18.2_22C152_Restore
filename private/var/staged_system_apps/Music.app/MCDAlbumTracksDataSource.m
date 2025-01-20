@interface MCDAlbumTracksDataSource
- (BOOL)storeContent;
- (MCDAlbumTracksDataSource)initWithLimitedUI:(BOOL)a3 album:(id)a4 storeContent:(BOOL)a5;
- (MPModelAlbum)album;
- (id)allowedSectionIdentifiers;
- (id)itemSortDescriptors;
- (id)requestIdentifierSet;
- (id)requestItemKind;
- (id)requestItemProperties;
- (id)requestLabel;
- (id)requestSectionKind;
- (id)requestSectionProperties;
- (id)scopedContainers;
- (void)setAlbum:(id)a3;
- (void)setStoreContent:(BOOL)a3;
@end

@implementation MCDAlbumTracksDataSource

- (MCDAlbumTracksDataSource)initWithLimitedUI:(BOOL)a3 album:(id)a4 storeContent:(BOOL)a5
{
  BOOL v7 = a3;
  id v9 = a4;
  v10 = [(_MCDLibraryDataSource *)self initWithLimitedUI:v7];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_album, a4);
    v11->_storeContent = a5;
  }

  return v11;
}

- (id)requestItemKind
{
  return +[MPModelSong kindWithVariants:1];
}

- (id)requestSectionKind
{
  v2 = [(MCDAlbumTracksDataSource *)self requestItemKind];
  v3 = +[MPModelAlbum kindWithSongKind:v2];

  return v3;
}

- (id)requestLabel
{
  return @"Albums Detail CarPlay View Controller";
}

- (id)itemSortDescriptors
{
  v2 = +[NSSortDescriptor sortDescriptorWithKey:MPModelPropertySongDiscNumber ascending:1];
  v3 = +[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", MPModelPropertySongTrackNumber, 1, v2);
  v7[1] = v3;
  v4 = +[NSSortDescriptor sortDescriptorWithKey:MPModelPropertySongTitle ascending:1];
  v7[2] = v4;
  v5 = +[NSArray arrayWithObjects:v7 count:3];

  return v5;
}

- (id)requestItemProperties
{
  id v3 = objc_alloc((Class)MPPropertySet);
  v10[0] = MPModelPropertySongTitle;
  v10[1] = MPModelPropertySongArtwork;
  v10[2] = MPModelPropertySongTrackNumber;
  v10[3] = MPModelPropertySongExplicit;
  v10[4] = MPModelPropertySongIsFavorite;
  v10[5] = MPModelPropertySongIsDisliked;
  v10[6] = MPModelPropertySongDuration;
  v10[7] = MPModelPropertySongArtistUploadedContent;
  v4 = +[NSArray arrayWithObjects:v10 count:8];
  id v5 = [v3 initWithProperties:v4 relationships:0];

  v9.receiver = self;
  v9.super_class = (Class)MCDAlbumTracksDataSource;
  v6 = [(MCDPlayableItemsDataSource *)&v9 requestItemProperties];
  BOOL v7 = [v6 propertySetByCombiningWithPropertySet:v5];

  return v7;
}

- (id)requestSectionProperties
{
  uint64_t v19 = MPModelRelationshipAlbumArtist;
  uint64_t v18 = MPModelPropertyArtistName;
  id v3 = +[NSArray arrayWithObjects:&v18 count:1];
  v4 = +[MPPropertySet propertySetWithProperties:v3];
  v20 = v4;
  id v5 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];

  id v6 = objc_alloc((Class)MPPropertySet);
  v17[0] = MPModelPropertyAlbumTitle;
  v17[1] = MPModelPropertyAlbumIsFavorite;
  v17[2] = MPModelPropertyAlbumIsDisliked;
  v17[3] = MPModelPropertyAlbumIsCompilation;
  v17[4] = MPModelPropertyAlbumArtwork;
  v17[5] = MPModelPropertyAlbumTrackCount;
  v17[6] = MPModelPropertyAlbumYear;
  v17[7] = MPModelPropertyAlbumSongPopularity;
  BOOL v7 = +[NSArray arrayWithObjects:v17 count:8];
  id v8 = [v6 initWithProperties:v7 relationships:v5];

  if ([(MCDAlbumTracksDataSource *)self storeContent])
  {
    uint64_t v15 = MPModelStoreBrowseContentItemRelationshipAlbum;
    id v16 = v8;
    objc_super v9 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    id v10 = objc_alloc((Class)MPPropertySet);
    uint64_t v14 = MPModelStoreBrowseContentItemPropertyItemType;
    v11 = +[NSArray arrayWithObjects:&v14 count:1];
    id v12 = [v10 initWithProperties:v11 relationships:v9];
  }
  else
  {
    id v12 = v8;
  }

  return v12;
}

- (id)scopedContainers
{
  v2 = [(MCDAlbumTracksDataSource *)self album];
  id v5 = v2;
  id v3 = +[NSArray arrayWithObjects:&v5 count:1];

  return v3;
}

- (id)allowedSectionIdentifiers
{
  v2 = [(MCDAlbumTracksDataSource *)self album];
  id v3 = [v2 identifiers];
  id v6 = v3;
  v4 = +[NSArray arrayWithObjects:&v6 count:1];

  return v4;
}

- (id)requestIdentifierSet
{
  v2 = [(MCDAlbumTracksDataSource *)self album];
  id v3 = [v2 identifiers];

  return v3;
}

- (MPModelAlbum)album
{
  return self->_album;
}

- (void)setAlbum:(id)a3
{
}

- (BOOL)storeContent
{
  return self->_storeContent;
}

- (void)setStoreContent:(BOOL)a3
{
  self->_storeContent = a3;
}

- (void).cxx_destruct
{
}

@end
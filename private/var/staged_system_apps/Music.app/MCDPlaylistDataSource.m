@interface MCDPlaylistDataSource
- (MCDPlaylistDataSource)initWithLimitedUI:(BOOL)a3 playlist:(id)a4;
- (MPModelPlaylist)playlist;
- (id)itemSortDescriptors;
- (id)requestItemKind;
- (id)requestItemProperties;
- (id)requestLabel;
- (id)requestSectionProperties;
- (id)scopedContainers;
- (unint64_t)favoriteFilteringOptions;
- (void)setPlaylist:(id)a3;
@end

@implementation MCDPlaylistDataSource

- (MCDPlaylistDataSource)initWithLimitedUI:(BOOL)a3 playlist:(id)a4
{
  BOOL v5 = a3;
  id v7 = a4;
  v8 = [(_MCDLibraryDataSource *)self initWithLimitedUI:v5];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_playlist, a4);
  }

  return v9;
}

- (id)requestItemKind
{
  if ([(_MCDLibraryDataSource *)self limitedUI]) {
    uint64_t v2 = 215;
  }
  else {
    uint64_t v2 = 223;
  }
  v3 = +[MPModelSong kindWithVariants:1];
  v8 = v3;
  v4 = +[NSArray arrayWithObjects:&v8 count:1];
  BOOL v5 = +[MPModelPlaylistEntry kindWithKinds:v4];
  v6 = +[MPModelPlaylist kindWithVariants:v2 playlistEntryKind:v5 options:4];

  return v6;
}

- (id)requestLabel
{
  return @"Playlist CarPlay View Controller";
}

- (id)requestItemProperties
{
  v11[0] = MPModelPropertyPlaylistName;
  v11[1] = MPModelPropertyPlaylistType;
  v11[2] = MPModelPropertyPlaylistArtwork;
  v11[3] = MPModelPropertyPlaylistTracksTiledArtwork;
  v11[4] = MPModelPropertyPlaylistCuratorPlaylist;
  v11[5] = MPModelPropertyPlaylistIsFavorite;
  v11[6] = MPModelPropertyPlaylistIsDisliked;
  v11[7] = MPModelPropertyPlaylistLastModifiedDateComponents;
  v11[8] = MPModelPropertyPlaylistIsOwner;
  v11[9] = MPModelPropertyPlaylistLibraryAdded;
  uint64_t v2 = +[NSArray arrayWithObjects:v11 count:10];
  uint64_t v9 = MPModelRelationshipPlaylistCurator;
  uint64_t v8 = MPModelPropertyCuratorName;
  v3 = +[NSArray arrayWithObjects:&v8 count:1];
  v4 = +[MPPropertySet propertySetWithProperties:v3];
  v10 = v4;
  BOOL v5 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];

  id v6 = [objc_alloc((Class)MPPropertySet) initWithProperties:v2 relationships:v5];

  return v6;
}

- (id)requestSectionProperties
{
  uint64_t v5 = MPModelPropertySectionTitle;
  uint64_t v2 = +[NSArray arrayWithObjects:&v5 count:1];
  v3 = +[MPPropertySet propertySetWithProperties:v2];

  return v3;
}

- (id)itemSortDescriptors
{
  v3 = [(_MCDLibraryDataSource *)self sortingPreference];
  if ([(_MCDLibraryDataSource *)self limitedUI])
  {
    uint64_t v4 = sub_100096B70();

    v3 = (void *)v4;
  }
  uint64_t v5 = sub_100096C78();
  unsigned int v6 = [v3 isEqualToString:v5];

  if (v6)
  {
    id v7 = +[NSSortDescriptor sortDescriptorWithKey:MPModelPropertyPlaylistLibraryAddedDate ascending:0];
    v20 = v7;
    uint64_t v8 = &v20;
LABEL_11:
    v15 = +[NSArray arrayWithObjects:v8 count:1];

    goto LABEL_12;
  }
  uint64_t v9 = sub_100096B70();
  unsigned int v10 = [v3 isEqualToString:v9];

  if (v10)
  {
    id v7 = +[NSSortDescriptor sortDescriptorWithKey:MPModelPropertyPlaylistLastDevicePlaybackDate ascending:0];
    v19 = v7;
    uint64_t v8 = &v19;
    goto LABEL_11;
  }
  v11 = sub_100096D80();
  unsigned int v12 = [v3 isEqualToString:v11];

  if (v12)
  {
    id v7 = +[NSSortDescriptor sortDescriptorWithKey:MPModelPropertyPlaylistLastModifiedDateComponents ascending:0];
    v18 = v7;
    uint64_t v8 = &v18;
    goto LABEL_11;
  }
  v13 = sub_100096E88();
  unsigned int v14 = [v3 isEqualToString:v13];

  if (v14)
  {
    id v7 = +[NSSortDescriptor sortDescriptorWithKey:MPModelPropertyPlaylistName ascending:1];
    v17 = v7;
    uint64_t v8 = &v17;
    goto LABEL_11;
  }
  v15 = 0;
LABEL_12:

  return v15;
}

- (id)scopedContainers
{
  v3 = [(MCDPlaylistDataSource *)self playlist];

  if (v3)
  {
    uint64_t v4 = [(MCDPlaylistDataSource *)self playlist];
    id v7 = v4;
    uint64_t v5 = +[NSArray arrayWithObjects:&v7 count:1];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (unint64_t)favoriteFilteringOptions
{
  return 0x1000000;
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
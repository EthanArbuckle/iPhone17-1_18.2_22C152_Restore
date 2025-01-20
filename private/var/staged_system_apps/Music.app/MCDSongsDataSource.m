@interface MCDSongsDataSource
- (id)itemSortDescriptors;
- (id)requestItemKind;
- (id)requestItemProperties;
- (id)requestLabel;
- (unint64_t)favoriteFilteringOptions;
@end

@implementation MCDSongsDataSource

- (id)requestItemKind
{
  return +[MPModelSong kindWithVariants:1];
}

- (id)requestLabel
{
  return @"Songs CarPlay View Controller";
}

- (id)requestItemProperties
{
  v21[0] = MPModelRelationshipSongArtist;
  uint64_t v20 = MPModelPropertyArtistName;
  v3 = +[NSArray arrayWithObjects:&v20 count:1];
  v4 = +[MPPropertySet propertySetWithProperties:v3];
  v22[0] = v4;
  v21[1] = MPModelRelationshipSongAlbum;
  uint64_t v19 = MPModelPropertyAlbumTitle;
  v5 = +[NSArray arrayWithObjects:&v19 count:1];
  v6 = +[MPPropertySet propertySetWithProperties:v5];
  v22[1] = v6;
  v21[2] = MPModelRelationshipSongComposer;
  uint64_t v18 = MPModelPropertyComposerName;
  v7 = +[NSArray arrayWithObjects:&v18 count:1];
  v8 = +[MPPropertySet propertySetWithProperties:v7];
  v22[2] = v8;
  v9 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:3];

  id v10 = objc_alloc((Class)MPPropertySet);
  v17[0] = MPModelPropertySongTitle;
  v17[1] = MPModelPropertySongArtwork;
  v17[2] = MPModelPropertySongExplicit;
  v17[3] = MPModelPropertySongIsFavorite;
  v17[4] = MPModelPropertySongIsDisliked;
  v17[5] = MPModelPropertySongShouldShowComposer;
  v17[6] = MPModelPropertySongArtistUploadedContent;
  v11 = +[NSArray arrayWithObjects:v17 count:7];
  id v12 = [v10 initWithProperties:v11 relationships:v9];

  v16.receiver = self;
  v16.super_class = (Class)MCDSongsDataSource;
  v13 = [(MCDPlayableItemsDataSource *)&v16 requestItemProperties];
  v14 = [v13 propertySetByCombiningWithPropertySet:v12];

  return v14;
}

- (id)itemSortDescriptors
{
  v3 = [(_MCDLibraryDataSource *)self sortingPreference];
  if ([(_MCDLibraryDataSource *)self limitedUI])
  {
    uint64_t v4 = sub_1000A0704();

    v3 = (void *)v4;
  }
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  v5 = (void *)qword_1010D6EF8;
  uint64_t v25 = qword_1010D6EF8;
  if (!qword_1010D6EF8)
  {
    v6 = (void *)sub_100029C70();
    v23[3] = (uint64_t)dlsym(v6, "MCDSortByRecentlyAdded");
    qword_1010D6EF8 = v23[3];
    v5 = (void *)v23[3];
  }
  _Block_object_dispose(&v22, 8);
  if (!v5) {
    goto LABEL_22;
  }
  if ([v3 isEqualToString:*v5])
  {
    v7 = +[NSSortDescriptor sortDescriptorWithKey:MPModelPropertySongLibraryAddedDate ascending:0];
    v30 = v7;
    uint64_t v8 = +[NSArray arrayWithObjects:&v30 count:1];
LABEL_10:
    v11 = (void *)v8;
LABEL_11:

    goto LABEL_12;
  }
  v9 = sub_1000A0704();
  unsigned int v10 = [v3 isEqualToString:v9];

  if (v10)
  {
    v7 = +[NSSortDescriptor sortDescriptorWithKey:MPModelPropertySongLastDevicePlaybackDate ascending:0];
    v29 = v7;
    uint64_t v8 = +[NSArray arrayWithObjects:&v29 count:1];
    goto LABEL_10;
  }
  if (!v3)
  {
LABEL_20:
    uint64_t v15 = MPModelRelationshipSongAlbum;
    v27[0] = MPModelRelationshipSongAlbum;
    v27[1] = MPModelRelationshipAlbumArtist;
    v27[2] = MPModelPropertyArtistName;
    v7 = +[NSArray arrayWithObjects:v27 count:3];
    objc_super v16 = +[MPModelSortDescriptor sortDescriptorWithKeyPath:v7 ascending:1];
    v28[0] = v16;
    v26[0] = v15;
    v26[1] = MPModelPropertyAlbumTitle;
    v17 = +[NSArray arrayWithObjects:v26 count:2];
    uint64_t v18 = +[MPModelSortDescriptor sortDescriptorWithKeyPath:v17 ascending:1];
    v28[1] = v18;
    uint64_t v19 = +[NSSortDescriptor sortDescriptorWithKey:MPModelPropertySongDiscNumber ascending:1];
    v28[2] = v19;
    uint64_t v20 = +[NSSortDescriptor sortDescriptorWithKey:MPModelPropertySongTrackNumber ascending:1];
    v28[3] = v20;
    v21 = +[NSSortDescriptor sortDescriptorWithKey:MPModelPropertySongTitle ascending:1];
    v28[4] = v21;
    v11 = +[NSArray arrayWithObjects:v28 count:5];

    goto LABEL_11;
  }
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  v13 = (void *)qword_1010D6F00;
  uint64_t v25 = qword_1010D6F00;
  if (!qword_1010D6F00)
  {
    v14 = (void *)sub_100029C70();
    v23[3] = (uint64_t)dlsym(v14, "MCDSortByArtist");
    qword_1010D6F00 = v23[3];
    v13 = (void *)v23[3];
  }
  _Block_object_dispose(&v22, 8);
  if (!v13)
  {
LABEL_22:
    sub_100D691B8();
    __break(1u);
  }
  if ([v3 isEqualToString:*v13]) {
    goto LABEL_20;
  }
  v11 = 0;
LABEL_12:

  return v11;
}

- (unint64_t)favoriteFilteringOptions
{
  return 0x800000;
}

@end
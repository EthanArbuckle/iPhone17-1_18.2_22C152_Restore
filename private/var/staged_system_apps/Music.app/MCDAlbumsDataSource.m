@interface MCDAlbumsDataSource
- (MCDAlbumsDataSource)initWithLimitedUI:(BOOL)a3 genre:(id)a4;
- (MCDAlbumsDataSource)initWithLimitedUI:(BOOL)a3 person:(id)a4;
- (MPModelGenre)genre;
- (MPModelPerson)person;
- (id)containerObject;
- (id)itemSortDescriptors;
- (id)requestItemKind;
- (id)requestItemProperties;
- (id)requestLabel;
- (id)scopedContainers;
- (unint64_t)favoriteFilteringOptions;
@end

@implementation MCDAlbumsDataSource

- (MCDAlbumsDataSource)initWithLimitedUI:(BOOL)a3 person:(id)a4
{
  BOOL v5 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MCDAlbumsDataSource;
  v8 = [(_MCDLibraryDataSource *)&v11 initWithLimitedUI:v5];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_person, a4);
  }

  return v9;
}

- (MCDAlbumsDataSource)initWithLimitedUI:(BOOL)a3 genre:(id)a4
{
  BOOL v5 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MCDAlbumsDataSource;
  v8 = [(_MCDLibraryDataSource *)&v11 initWithLimitedUI:v5];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_genre, a4);
  }

  return v9;
}

- (id)requestItemKind
{
  v2 = +[MPModelSong kindWithVariants:1];
  v3 = +[MPModelAlbum kindWithSongKind:v2];

  return v3;
}

- (id)requestLabel
{
  return @"Albums CarPlay View Controller";
}

- (id)requestItemProperties
{
  uint64_t v11 = MPModelRelationshipAlbumArtist;
  uint64_t v10 = MPModelPropertyArtistName;
  v2 = +[NSArray arrayWithObjects:&v10 count:1];
  v3 = +[MPPropertySet propertySetWithProperties:v2];
  v12 = v3;
  v4 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];

  id v5 = objc_alloc((Class)MPPropertySet);
  v9[0] = MPModelPropertyAlbumTitle;
  v9[1] = MPModelPropertyAlbumIsFavorite;
  v9[2] = MPModelPropertyAlbumIsDisliked;
  v9[3] = MPModelPropertyAlbumIsCompilation;
  v9[4] = MPModelPropertyAlbumArtwork;
  v9[5] = MPModelPropertyAlbumTrackCount;
  v9[6] = MPModelPropertyAlbumYear;
  v9[7] = MPModelPropertyAlbumSongPopularity;
  v6 = +[NSArray arrayWithObjects:v9 count:8];
  id v7 = [v5 initWithProperties:v6 relationships:v4];

  return v7;
}

- (id)itemSortDescriptors
{
  v3 = [(_MCDLibraryDataSource *)self sortingPreference];
  if ([(_MCDLibraryDataSource *)self limitedUI])
  {
    uint64_t v4 = sub_10009ED40();

    v3 = (void *)v4;
  }
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2020000000;
  id v5 = (void *)qword_1010D6EB0;
  uint64_t v30 = qword_1010D6EB0;
  if (!qword_1010D6EB0)
  {
    v6 = (void *)sub_100029A70();
    v28[3] = (uint64_t)dlsym(v6, "MCDSortByRecentlyAdded");
    qword_1010D6EB0 = v28[3];
    id v5 = (void *)v28[3];
  }
  _Block_object_dispose(&v27, 8);
  if (!v5) {
    goto LABEL_34;
  }
  if ([v3 isEqualToString:*v5])
  {
    id v7 = +[NSSortDescriptor sortDescriptorWithKey:MPModelPropertyAlbumLibraryAddedDate ascending:0];
    v38 = v7;
    uint64_t v8 = +[NSArray arrayWithObjects:&v38 count:1];
LABEL_10:
    uint64_t v11 = (void *)v8;
LABEL_11:

    goto LABEL_12;
  }
  v9 = sub_10009ED40();
  unsigned int v10 = [v3 isEqualToString:v9];

  if (v10)
  {
    id v7 = +[NSSortDescriptor sortDescriptorWithKey:MPModelPropertyAlbumLastDevicePlaybackDate ascending:0];
    v37 = v7;
    uint64_t v8 = +[NSArray arrayWithObjects:&v37 count:1];
    goto LABEL_10;
  }
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2020000000;
  v13 = (void *)qword_1010D6EB8;
  uint64_t v30 = qword_1010D6EB8;
  if (!qword_1010D6EB8)
  {
    v14 = (void *)sub_100029A70();
    v28[3] = (uint64_t)dlsym(v14, "MCDSortByArtist");
    qword_1010D6EB8 = v28[3];
    v13 = (void *)v28[3];
  }
  _Block_object_dispose(&v27, 8);
  if (!v13) {
    goto LABEL_34;
  }
  unsigned int v15 = [v3 isEqualToString:*v13];
  if (v3) {
    int v16 = v15;
  }
  else {
    int v16 = 1;
  }
  if (v16 == 1)
  {
    v35[0] = MPModelRelationshipAlbumArtist;
    v35[1] = MPModelPropertyArtistName;
    id v7 = +[NSArray arrayWithObjects:v35 count:2];
    v17 = +[MPModelSortDescriptor sortDescriptorWithKeyPath:v7 ascending:1];
    v36[0] = v17;
    v18 = +[NSSortDescriptor sortDescriptorWithKey:MPModelPropertyAlbumTitle ascending:1];
    v36[1] = v18;
    uint64_t v11 = +[NSArray arrayWithObjects:v36 count:2];

    goto LABEL_11;
  }
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2020000000;
  v19 = (void *)qword_1010D6EC0;
  uint64_t v30 = qword_1010D6EC0;
  if (!qword_1010D6EC0)
  {
    v20 = (void *)sub_100029A70();
    v28[3] = (uint64_t)dlsym(v20, "MCDSortByReleaseDateAscending");
    qword_1010D6EC0 = v28[3];
    v19 = (void *)v28[3];
  }
  _Block_object_dispose(&v27, 8);
  if (!v19) {
    goto LABEL_34;
  }
  if ([v3 isEqualToString:*v19])
  {
    uint64_t v33 = MPModelPropertyAlbumReleaseDateComponents;
    id v7 = +[NSArray arrayWithObjects:&v33 count:1];
    v21 = +[MPModelSortDescriptor sortDescriptorWithKeyPath:v7 ascending:1];
    v34[0] = v21;
    v22 = +[NSSortDescriptor sortDescriptorWithKey:MPModelPropertyAlbumTitle ascending:1];
    v34[1] = v22;
    uint64_t v11 = +[NSArray arrayWithObjects:v34 count:2];

    goto LABEL_11;
  }
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2020000000;
  v23 = (void *)qword_1010D6EC8;
  uint64_t v30 = qword_1010D6EC8;
  if (!qword_1010D6EC8)
  {
    v24 = (void *)sub_100029A70();
    v28[3] = (uint64_t)dlsym(v24, "MCDSortByReleaseDateDescending");
    qword_1010D6EC8 = v28[3];
    v23 = (void *)v28[3];
  }
  _Block_object_dispose(&v27, 8);
  if (!v23)
  {
LABEL_34:
    sub_100D691B8();
    __break(1u);
  }
  if ([v3 isEqualToString:*v23])
  {
    uint64_t v31 = MPModelPropertyAlbumReleaseDateComponents;
    id v7 = +[NSArray arrayWithObjects:&v31 count:1];
    v25 = +[MPModelSortDescriptor sortDescriptorWithKeyPath:v7 ascending:0];
    v32[0] = v25;
    v26 = +[NSSortDescriptor sortDescriptorWithKey:MPModelPropertyAlbumTitle ascending:1];
    v32[1] = v26;
    uint64_t v11 = +[NSArray arrayWithObjects:v32 count:2];

    goto LABEL_11;
  }
  uint64_t v11 = 0;
LABEL_12:

  return v11;
}

- (id)scopedContainers
{
  v3 = [(MCDAlbumsDataSource *)self person];

  if (v3)
  {
    uint64_t v4 = [(MCDAlbumsDataSource *)self person];
    v9 = v4;
    id v5 = &v9;
  }
  else
  {
    v6 = [(MCDAlbumsDataSource *)self genre];

    if (!v6) {
      goto LABEL_6;
    }
    uint64_t v4 = [(MCDAlbumsDataSource *)self genre];
    uint64_t v8 = v4;
    id v5 = &v8;
  }
  v6 = +[NSArray arrayWithObjects:v5 count:1];

LABEL_6:

  return v6;
}

- (id)containerObject
{
  v2 = [(MCDAlbumsDataSource *)self scopedContainers];
  v3 = [v2 firstObject];

  return v3;
}

- (unint64_t)favoriteFilteringOptions
{
  return 0x1000000;
}

- (MPModelPerson)person
{
  return self->_person;
}

- (MPModelGenre)genre
{
  return self->_genre;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_genre, 0);

  objc_storeStrong((id *)&self->_person, 0);
}

@end
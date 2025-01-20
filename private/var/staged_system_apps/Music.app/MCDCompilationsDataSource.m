@interface MCDCompilationsDataSource
- (BOOL)forceScopingToResponseResults;
- (id)itemSortDescriptors;
- (id)requestItemKind;
- (id)requestLabel;
- (unint64_t)favoriteFilteringOptions;
@end

@implementation MCDCompilationsDataSource

- (id)requestLabel
{
  return @"Compilations CarPlay View Controller";
}

- (id)requestItemKind
{
  v2 = +[MPModelSong kindWithVariants:1];
  v3 = +[MPModelAlbum kindWithVariants:2 songKind:v2];

  return v3;
}

- (BOOL)forceScopingToResponseResults
{
  return 1;
}

- (id)itemSortDescriptors
{
  v3 = [(_MCDLibraryDataSource *)self sortingPreference];
  if ([(_MCDLibraryDataSource *)self limitedUI])
  {
    uint64_t v4 = sub_1000B320C();

    v3 = (void *)v4;
  }
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  v5 = (void *)qword_1010D7088;
  uint64_t v20 = qword_1010D7088;
  if (!qword_1010D7088)
  {
    v6 = (void *)sub_10002A370();
    v18[3] = (uint64_t)dlsym(v6, "MCDSortByRecentlyAdded");
    qword_1010D7088 = v18[3];
    v5 = (void *)v18[3];
  }
  _Block_object_dispose(&v17, 8);
  if (!v5) {
    goto LABEL_21;
  }
  if ([v3 isEqualToString:*v5])
  {
    v7 = +[NSSortDescriptor sortDescriptorWithKey:MPModelPropertyAlbumLibraryAddedDate ascending:0];
    v24 = v7;
    uint64_t v8 = +[NSArray arrayWithObjects:&v24 count:1];
LABEL_10:
    v11 = (void *)v8;
LABEL_11:

    goto LABEL_12;
  }
  v9 = sub_1000B320C();
  unsigned int v10 = [v3 isEqualToString:v9];

  if (v10)
  {
    v7 = +[NSSortDescriptor sortDescriptorWithKey:MPModelPropertyAlbumLastDevicePlaybackDate ascending:0];
    v23 = v7;
    uint64_t v8 = +[NSArray arrayWithObjects:&v23 count:1];
    goto LABEL_10;
  }
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  v13 = (void *)qword_1010D7090;
  uint64_t v20 = qword_1010D7090;
  if (!qword_1010D7090)
  {
    v14 = (void *)sub_10002A370();
    v18[3] = (uint64_t)dlsym(v14, "MCDSortByArtist");
    qword_1010D7090 = v18[3];
    v13 = (void *)v18[3];
  }
  _Block_object_dispose(&v17, 8);
  if (!v13)
  {
LABEL_21:
    sub_100D691B8();
    __break(1u);
  }
  if ([v3 isEqualToString:*v13])
  {
    v21[0] = MPModelRelationshipAlbumArtist;
    v21[1] = MPModelPropertyArtistName;
    v7 = +[NSArray arrayWithObjects:v21 count:2];
    v15 = +[MPModelSortDescriptor sortDescriptorWithKeyPath:v7 ascending:1];
    v22[0] = v15;
    v16 = +[NSSortDescriptor sortDescriptorWithKey:MPModelPropertyAlbumTitle ascending:1];
    v22[1] = v16;
    v11 = +[NSArray arrayWithObjects:v22 count:2];

    goto LABEL_11;
  }
  v11 = 0;
LABEL_12:

  return v11;
}

- (unint64_t)favoriteFilteringOptions
{
  return 0x1000000;
}

@end
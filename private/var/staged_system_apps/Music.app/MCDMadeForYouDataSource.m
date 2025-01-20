@interface MCDMadeForYouDataSource
- (MCDMadeForYouDataSource)initWithLimitedUI:(BOOL)a3;
- (id)itemSortDescriptors;
- (id)requestItemKind;
- (unint64_t)favoriteFilteringOptions;
@end

@implementation MCDMadeForYouDataSource

- (MCDMadeForYouDataSource)initWithLimitedUI:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MCDMadeForYouDataSource;
  return [(_MCDLibraryDataSource *)&v4 initWithLimitedUI:a3];
}

- (id)itemSortDescriptors
{
  v3 = [(_MCDLibraryDataSource *)self sortingPreference];
  if ([(_MCDLibraryDataSource *)self limitedUI])
  {
    uint64_t v4 = sub_100096B70();

    v3 = (void *)v4;
  }
  v5 = sub_100096C78();
  unsigned int v6 = [v3 isEqualToString:v5];

  if (v6)
  {
    v7 = +[NSSortDescriptor sortDescriptorWithKey:MPModelPropertyPlaylistLibraryAddedDate ascending:0];
    v20 = v7;
    v8 = &v20;
LABEL_11:
    v15 = +[NSArray arrayWithObjects:v8 count:1];

    goto LABEL_12;
  }
  v9 = sub_100096B70();
  unsigned int v10 = [v3 isEqualToString:v9];

  if (v10)
  {
    v7 = +[NSSortDescriptor sortDescriptorWithKey:MPModelPropertyPlaylistLastDevicePlaybackDate ascending:0];
    v19 = v7;
    v8 = &v19;
    goto LABEL_11;
  }
  v11 = sub_100096D80();
  unsigned int v12 = [v3 isEqualToString:v11];

  if (v12)
  {
    v7 = +[NSSortDescriptor sortDescriptorWithKey:MPModelPropertyPlaylistLastModifiedDateComponents ascending:0];
    v18 = v7;
    v8 = &v18;
    goto LABEL_11;
  }
  v13 = sub_100096E88();
  unsigned int v14 = [v3 isEqualToString:v13];

  if (v14)
  {
    v7 = +[NSSortDescriptor sortDescriptorWithKey:MPModelPropertyPlaylistName ascending:1];
    v17 = v7;
    v8 = &v17;
    goto LABEL_11;
  }
  v15 = 0;
LABEL_12:

  return v15;
}

- (id)requestItemKind
{
  v2 = +[MPModelSong kindWithVariants:1];
  v7 = v2;
  v3 = +[NSArray arrayWithObjects:&v7 count:1];
  uint64_t v4 = +[MPModelPlaylistEntry kindWithKinds:v3];
  v5 = +[MPModelPlaylist kindWithVariants:64 playlistEntryKind:v4 options:4];

  return v5;
}

- (unint64_t)favoriteFilteringOptions
{
  return 0x1000000;
}

@end
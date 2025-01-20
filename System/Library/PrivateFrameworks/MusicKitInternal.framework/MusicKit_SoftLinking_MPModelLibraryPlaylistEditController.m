@interface MusicKit_SoftLinking_MPModelLibraryPlaylistEditController
+ (NSString)playlistDidChangeNotificationName;
- (BOOL)addInsertedTracksToLibrary;
- (CGImage)userImage;
- (MusicKit_SoftLinking_MPModelLibraryPlaylistEditController)initWithPlaylist:(id)a3 initialTracklist:(id)a4 authorProfile:(id)a5 library:(id)a6;
- (MusicKit_SoftLinking_MPModelLibraryPlaylistEditController)initWithPlaylist:(id)a3 underlyingSectionedCollection:(id)a4 authorProfile:(id)a5 library:(id)a6;
- (MusicKit_SoftLinking_MPModelObject)parentPlaylist;
- (MusicKit_SoftLinking_MPSectionedCollection)currentTrackList;
- (NSNumber)isCuratorPlaylist;
- (NSNumber)isPublicPlaylist;
- (NSNumber)isVisiblePlaylist;
- (NSString)coverArtworkRecipe;
- (NSString)descriptionText;
- (NSString)name;
- (id)underlyingEditController;
- (void)_handlePlaylistDidChangeNotification:(id)a3;
- (void)appendModelObject:(id)a3 completion:(id)a4;
- (void)appendModelObjects:(id)a3 completion:(id)a4;
- (void)beginEditingWithCompletion:(id)a3;
- (void)commitWithCompletion:(id)a3;
- (void)dealloc;
- (void)insertModelObject:(id)a3 afterEntry:(id)a4 completion:(id)a5;
- (void)insertModelObjects:(id)a3 afterEntry:(id)a4 completion:(id)a5;
- (void)moveEntry:(id)a3 afterEntry:(id)a4;
- (void)removeEntries:(id)a3;
- (void)removeEntry:(id)a3;
- (void)setAddInsertedTracksToLibrary:(BOOL)a3;
- (void)setCoverArtworkRecipe:(id)a3;
- (void)setCuratorPlaylist:(id)a3;
- (void)setDescriptionText:(id)a3;
- (void)setInitialTrackList:(id)a3;
- (void)setName:(id)a3;
- (void)setParentPlaylist:(id)a3;
- (void)setPublicPlaylist:(id)a3;
- (void)setUserImage:(CGImage *)a3;
- (void)setVisiblePlaylist:(id)a3;
@end

@implementation MusicKit_SoftLinking_MPModelLibraryPlaylistEditController

- (MusicKit_SoftLinking_MPModelLibraryPlaylistEditController)initWithPlaylist:(id)a3 initialTracklist:(id)a4 authorProfile:(id)a5 library:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v28.receiver = self;
  v28.super_class = (Class)MusicKit_SoftLinking_MPModelLibraryPlaylistEditController;
  v14 = [(MusicKit_SoftLinking_MPModelLibraryPlaylistEditController *)&v28 init];
  if (v14)
  {
    if (v11)
    {
      v15 = [v11 _underlyingSectionedCollection];
      v16 = [v15 lazyMapWithSections:&__block_literal_global_0 items:&__block_literal_global_10];
    }
    if (v12)
    {
      v17 = [v12 _underlyingModelObject];
    }
    else
    {
      v17 = 0;
    }
    v18 = [MEMORY[0x1E4F38658] _supportedPropertiesForModelObjectType:17];
    id v19 = objc_alloc((Class)getMPModelLibraryPlaylistEditControllerClass());
    v20 = [v13 _underlyingMediaLibrary];
    if (v10)
    {
      v21 = [v10 _underlyingModelObject];
      uint64_t v22 = [v19 initWithLibrary:v20 playlist:v21 playlistEntryProperties:v18 authorProfile:v17];
      underlyingEditController = v14->_underlyingEditController;
      v14->_underlyingEditController = (MPModelLibraryPlaylistEditController *)v22;
    }
    else
    {
      uint64_t v24 = [v19 initWithLibrary:v20 playlistEntryProperties:v18 authorProfile:v17];
      v21 = v14->_underlyingEditController;
      v14->_underlyingEditController = (MPModelLibraryPlaylistEditController *)v24;
    }

    v25 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v26 = getMPModelLibraryPlaylistEditControllerDidChangeNotification();
    [v25 addObserver:v14 selector:sel__handlePlaylistDidChangeNotification_ name:v26 object:v14->_underlyingEditController];
  }
  return v14;
}

- (MusicKit_SoftLinking_MPModelLibraryPlaylistEditController)initWithPlaylist:(id)a3 underlyingSectionedCollection:(id)a4 authorProfile:(id)a5 library:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v25.receiver = self;
  v25.super_class = (Class)MusicKit_SoftLinking_MPModelLibraryPlaylistEditController;
  v14 = [(MusicKit_SoftLinking_MPModelLibraryPlaylistEditController *)&v25 init];
  if (v14)
  {
    v15 = [MEMORY[0x1E4F38658] _supportedPropertiesForModelObjectType:17];
    id v16 = v11;
    id v17 = objc_alloc((Class)getMPModelLibraryPlaylistEditControllerClass());
    v18 = [v13 _underlyingMediaLibrary];
    id v19 = [v12 _underlyingModelObject];
    if (v10) {
      uint64_t v20 = [v17 initWithLibrary:v18 playlist:v10 initialTrackList:v16 playlistEntryProperties:v15 authorProfile:v19];
    }
    else {
      uint64_t v20 = [v17 initWithLibrary:v18 playlistEntryProperties:v15 authorProfile:v19];
    }
    underlyingEditController = v14->_underlyingEditController;
    v14->_underlyingEditController = (MPModelLibraryPlaylistEditController *)v20;

    uint64_t v22 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v23 = getMPModelLibraryPlaylistEditControllerDidChangeNotification();
    [v22 addObserver:v14 selector:sel__handlePlaylistDidChangeNotification_ name:v23 object:v14->_underlyingEditController];
  }
  return v14;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v4 = getMPModelLibraryPlaylistEditControllerDidChangeNotification();
  [v3 removeObserver:self name:v4 object:self->_underlyingEditController];

  v5.receiver = self;
  v5.super_class = (Class)MusicKit_SoftLinking_MPModelLibraryPlaylistEditController;
  [(MusicKit_SoftLinking_MPModelLibraryPlaylistEditController *)&v5 dealloc];
}

- (id)underlyingEditController
{
  return self->_underlyingEditController;
}

- (BOOL)addInsertedTracksToLibrary
{
  return [(MPModelLibraryPlaylistEditController *)self->_underlyingEditController addInsertedTracksToLibrary];
}

- (void)setAddInsertedTracksToLibrary:(BOOL)a3
{
}

- (NSString)name
{
  return (NSString *)[(MPModelLibraryPlaylistEditController *)self->_underlyingEditController name];
}

- (void)setName:(id)a3
{
}

- (NSString)descriptionText
{
  return (NSString *)[(MPModelLibraryPlaylistEditController *)self->_underlyingEditController descriptionText];
}

- (void)setDescriptionText:(id)a3
{
}

- (MusicKit_SoftLinking_MPModelObject)parentPlaylist
{
  v2 = [(MPModelLibraryPlaylistEditController *)self->_underlyingEditController parentPlaylist];
  if (v2) {
    v3 = (void *)[objc_alloc(MEMORY[0x1E4F38620]) initWithUnderlyingModelObject:v2];
  }
  else {
    v3 = 0;
  }

  return (MusicKit_SoftLinking_MPModelObject *)v3;
}

- (void)setParentPlaylist:(id)a3
{
  if (a3)
  {
    uint64_t v4 = [a3 _underlyingModelObject];
  }
  else
  {
    uint64_t v4 = 0;
  }
  id v5 = (id)v4;
  [(MPModelLibraryPlaylistEditController *)self->_underlyingEditController setParentPlaylist:v4];
}

- (CGImage)userImage
{
  id v2 = [(MPModelLibraryPlaylistEditController *)self->_underlyingEditController userImage];
  v3 = (CGImage *)[v2 CGImage];

  return v3;
}

- (void)setUserImage:(CGImage *)a3
{
  if (a3)
  {
    uint64_t v10 = 0;
    id v11 = &v10;
    uint64_t v12 = 0x2050000000;
    id v5 = (void *)getUIImageClass_softClass;
    uint64_t v13 = getUIImageClass_softClass;
    if (!getUIImageClass_softClass)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __getUIImageClass_block_invoke;
      v9[3] = &unk_1E6D453B0;
      v9[4] = &v10;
      __getUIImageClass_block_invoke((uint64_t)v9);
      id v5 = (void *)v11[3];
    }
    v6 = v5;
    _Block_object_dispose(&v10, 8);
    v7 = (void *)[[v6 alloc] initWithCGImage:a3];
    [(MPModelLibraryPlaylistEditController *)self->_underlyingEditController setUserImage:v7];
  }
  else
  {
    underlyingEditController = self->_underlyingEditController;
    -[MPModelLibraryPlaylistEditController setUserImage:](underlyingEditController, "setUserImage:");
  }
}

- (NSString)coverArtworkRecipe
{
  return (NSString *)[(MPModelLibraryPlaylistEditController *)self->_underlyingEditController coverArtworkRecipe];
}

- (void)setCoverArtworkRecipe:(id)a3
{
}

- (NSNumber)isPublicPlaylist
{
  return (NSNumber *)[(MPModelLibraryPlaylistEditController *)self->_underlyingEditController isPublicPlaylist];
}

- (void)setPublicPlaylist:(id)a3
{
}

- (NSNumber)isVisiblePlaylist
{
  return (NSNumber *)[(MPModelLibraryPlaylistEditController *)self->_underlyingEditController isVisiblePlaylist];
}

- (void)setVisiblePlaylist:(id)a3
{
}

- (NSNumber)isCuratorPlaylist
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy_;
  uint64_t v12 = __Block_byref_object_dispose_;
  id v13 = 0;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2050000000;
  v3 = (void *)getMPModelObjectClass_softClass;
  uint64_t v18 = getMPModelObjectClass_softClass;
  if (!getMPModelObjectClass_softClass)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __getMPModelObjectClass_block_invoke;
    v14[3] = &unk_1E6D453B0;
    v14[4] = &v15;
    __getMPModelObjectClass_block_invoke((uint64_t)v14);
    v3 = (void *)v16[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v15, 8);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __78__MusicKit_SoftLinking_MPModelLibraryPlaylistEditController_isCuratorPlaylist__block_invoke;
  v7[3] = &unk_1E6D45510;
  v7[4] = self;
  v7[5] = &v8;
  [v4 performWithoutEnforcement:v7];
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSNumber *)v5;
}

- (void)setCuratorPlaylist:(id)a3
{
}

- (MusicKit_SoftLinking_MPSectionedCollection)currentTrackList
{
  id v2 = [(MPModelLibraryPlaylistEditController *)self->_underlyingEditController currentTrackList];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F386A8]) initWithUnderlyingSectionedCollection:v2];

  return (MusicKit_SoftLinking_MPSectionedCollection *)v3;
}

- (void)setInitialTrackList:(id)a3
{
  underlyingEditController = self->_underlyingEditController;
  id v4 = [a3 _underlyingSectionedCollection];
  [(MPModelLibraryPlaylistEditController *)underlyingEditController setInitialTrackList:v4];
}

+ (NSString)playlistDidChangeNotificationName
{
  return (NSString *)@"MusicKit_SoftLinking_MPModelLibraryPlaylistEditControllerDidChangeNotification";
}

- (void)_handlePlaylistDidChangeNotification:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F28EB8];
  id v5 = a3;
  id v7 = [v4 defaultCenter];
  v6 = [v5 userInfo];

  [v7 postNotificationName:@"MusicKit_SoftLinking_MPModelLibraryPlaylistEditControllerDidChangeNotification" object:self userInfo:v6];
}

- (void)beginEditingWithCompletion:(id)a3
{
}

- (void)appendModelObject:(id)a3 completion:(id)a4
{
  underlyingEditController = self->_underlyingEditController;
  id v6 = a4;
  id v7 = [a3 _underlyingModelObject];
  [(MPModelLibraryPlaylistEditController *)underlyingEditController appendItem:v7 completion:v6];
}

- (void)appendModelObjects:(id)a3 completion:(id)a4
{
  id v6 = a4;
  objc_msgSend(a3, "msv_map:", &__block_literal_global_21);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [(MPModelLibraryPlaylistEditController *)self->_underlyingEditController appendItems:v7 completion:v6];
}

- (void)insertModelObject:(id)a3 afterEntry:(id)a4 completion:(id)a5
{
  id v12 = a4;
  underlyingEditController = self->_underlyingEditController;
  id v9 = a5;
  uint64_t v10 = [a3 _underlyingModelObject];
  if (v12)
  {
    uint64_t v11 = [v12 _underlyingModelObject];
    [(MPModelLibraryPlaylistEditController *)underlyingEditController insertItem:v10 afterEntry:v11 completion:v9];

    id v9 = (id)v11;
  }
  else
  {
    [(MPModelLibraryPlaylistEditController *)underlyingEditController insertItemAtStart:v10 completion:v9];
  }
}

- (void)insertModelObjects:(id)a3 afterEntry:(id)a4 completion:(id)a5
{
  id v12 = a4;
  id v8 = a5;
  id v9 = objc_msgSend(a3, "msv_map:", &__block_literal_global_23);
  underlyingEditController = self->_underlyingEditController;
  if (v12)
  {
    uint64_t v11 = [v12 _underlyingModelObject];
    [(MPModelLibraryPlaylistEditController *)underlyingEditController insertItems:v9 afterEntry:v11 completion:v8];
  }
  else
  {
    [(MPModelLibraryPlaylistEditController *)underlyingEditController insertItemsAtStart:v9 completion:v8];
  }
}

- (void)moveEntry:(id)a3 afterEntry:(id)a4
{
  id v9 = a4;
  underlyingEditController = self->_underlyingEditController;
  id v7 = [a3 _underlyingModelObject];
  if (v9)
  {
    id v8 = [v9 _underlyingModelObject];
    [(MPModelLibraryPlaylistEditController *)underlyingEditController moveEntry:v7 afterEntry:v8];
  }
  else
  {
    [(MPModelLibraryPlaylistEditController *)underlyingEditController moveEntryToStart:v7];
  }
}

- (void)removeEntry:(id)a3
{
  underlyingEditController = self->_underlyingEditController;
  id v4 = [a3 _underlyingModelObject];
  [(MPModelLibraryPlaylistEditController *)underlyingEditController removeEntry:v4];
}

- (void)removeEntries:(id)a3
{
  objc_msgSend(a3, "msv_map:", &__block_literal_global_26);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(MPModelLibraryPlaylistEditController *)self->_underlyingEditController removeEntries:v4];
}

- (void)commitWithCompletion:(id)a3
{
  id v4 = a3;
  underlyingEditController = self->_underlyingEditController;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __82__MusicKit_SoftLinking_MPModelLibraryPlaylistEditController_commitWithCompletion___block_invoke;
  v7[3] = &unk_1E6D45578;
  id v8 = v4;
  id v6 = v4;
  [(MPModelLibraryPlaylistEditController *)underlyingEditController commitWithCompletion:v7];
}

- (void).cxx_destruct
{
}

@end
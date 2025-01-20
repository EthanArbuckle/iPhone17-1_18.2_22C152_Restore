@interface MusicKitInternal_SoftLinking_MPModelLibraryPlaylistEditChangeRequest
- (MusicKitInternal_SoftLinking_MPModelLibraryPlaylistEditChangeRequest)initWithParentPlaylist:(id)a3 playlistEntries:(id)a4 playlistName:(id)a5 playlistDescription:(id)a6 playlistUserImage:(CGImage *)a7 coverArtworkRecipe:(id)a8 publicPlaylist:(id)a9 visiblePlaylist:(id)a10 authorStoreIdentifier:(id)a11;
- (MusicKitInternal_SoftLinking_MPModelLibraryPlaylistEditChangeRequest)initWithPlaylist:(id)a3 playlistEntries:(id)a4 playlistName:(id)a5 playlistDescription:(id)a6 playlistUserImage:(CGImage *)a7 publicPlaylist:(id)a8 visiblePlaylist:(id)a9 authorStoreIdentifier:(id)a10;
- (void)_performWithRequest:(id)a3 completionPolicy:(int64_t)a4 completionHandler:(id)a5;
- (void)performWithCompletionPolicy:(int64_t)a3 completionHandler:(id)a4;
@end

@implementation MusicKitInternal_SoftLinking_MPModelLibraryPlaylistEditChangeRequest

- (MusicKitInternal_SoftLinking_MPModelLibraryPlaylistEditChangeRequest)initWithPlaylist:(id)a3 playlistEntries:(id)a4 playlistName:(id)a5 playlistDescription:(id)a6 playlistUserImage:(CGImage *)a7 publicPlaylist:(id)a8 visiblePlaylist:(id)a9 authorStoreIdentifier:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  v38.receiver = self;
  v38.super_class = (Class)MusicKitInternal_SoftLinking_MPModelLibraryPlaylistEditChangeRequest;
  v23 = [(MusicKitInternal_SoftLinking_MPModelLibraryPlaylistEditChangeRequest *)&v38 init];
  if (v23)
  {
    v35 = a7;
    id v36 = v18;
    v24 = (MPModelLibraryPlaylistEditChangeRequest *)objc_alloc_init((Class)getMPModelLibraryPlaylistEditChangeRequestClass());
    underlyingRequest = v23->_underlyingRequest;
    v23->_underlyingRequest = v24;

    v26 = v23->_underlyingRequest;
    [getMPMediaLibraryClass() deviceMediaLibrary];
    v28 = v27 = v16;
    [(MPModelLibraryPlaylistEditChangeRequest *)v26 setMediaLibrary:v28];

    v29 = v23->_underlyingRequest;
    v37 = v27;
    v30 = [v27 _underlyingModelObject];
    [(MPModelLibraryPlaylistEditChangeRequest *)v29 setPlaylist:v30];

    if (v17)
    {
      v31 = objc_msgSend(v17, "msv_map:", &__block_literal_global_7);
      id v32 = objc_alloc_init((Class)getMPMutableSectionedCollectionClass_0());
      [v32 appendSection:&stru_1F3B7D290];
      [v32 appendItems:v31];
      [(MPModelLibraryPlaylistEditChangeRequest *)v23->_underlyingRequest setPlaylistEntries:v32];
    }
    id v18 = v36;
    if (v35)
    {
      v33 = (void *)[objc_alloc((Class)getUIImageClass()) initWithCGImage:v35];
      [(MPModelLibraryPlaylistEditChangeRequest *)v23->_underlyingRequest setPlaylistUserImage:v33];
    }
    [(MPModelLibraryPlaylistEditChangeRequest *)v23->_underlyingRequest setPlaylistName:v36];
    [(MPModelLibraryPlaylistEditChangeRequest *)v23->_underlyingRequest setPlaylistDescription:v19];
    [(MPModelLibraryPlaylistEditChangeRequest *)v23->_underlyingRequest setPublicPlaylist:v20];
    [(MPModelLibraryPlaylistEditChangeRequest *)v23->_underlyingRequest setVisiblePlaylist:v21];
    [(MPModelLibraryPlaylistEditChangeRequest *)v23->_underlyingRequest setAuthorStoreIdentifier:v22];
    id v16 = v37;
  }

  return v23;
}

- (MusicKitInternal_SoftLinking_MPModelLibraryPlaylistEditChangeRequest)initWithParentPlaylist:(id)a3 playlistEntries:(id)a4 playlistName:(id)a5 playlistDescription:(id)a6 playlistUserImage:(CGImage *)a7 coverArtworkRecipe:(id)a8 publicPlaylist:(id)a9 visiblePlaylist:(id)a10 authorStoreIdentifier:(id)a11
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  id v23 = a11;
  v38.receiver = self;
  v38.super_class = (Class)MusicKitInternal_SoftLinking_MPModelLibraryPlaylistEditChangeRequest;
  v24 = [(MusicKitInternal_SoftLinking_MPModelLibraryPlaylistEditChangeRequest *)&v38 init];
  if (v24)
  {
    id v36 = v18;
    v25 = (MPModelLibraryPlaylistEditChangeRequest *)objc_alloc_init((Class)getMPModelLibraryPlaylistEditChangeRequestClass());
    underlyingRequest = v24->_underlyingRequest;
    v24->_underlyingRequest = v25;

    v27 = v24->_underlyingRequest;
    v28 = [getMPMediaLibraryClass() deviceMediaLibrary];
    [(MPModelLibraryPlaylistEditChangeRequest *)v27 setMediaLibrary:v28];

    [(MPModelLibraryPlaylistEditChangeRequest *)v24->_underlyingRequest setShouldCreatePlaylist:1];
    v29 = v24->_underlyingRequest;
    v30 = [v16 _underlyingModelObject];
    [(MPModelLibraryPlaylistEditChangeRequest *)v29 setParentPlaylist:v30];

    if (v17)
    {
      v31 = objc_msgSend(v17, "msv_map:", &__block_literal_global_9);
      id v32 = objc_alloc_init((Class)getMPMutableSectionedCollectionClass_0());
      [v32 appendSection:&stru_1F3B7D290];
      [v32 appendItems:v31];
      [(MPModelLibraryPlaylistEditChangeRequest *)v24->_underlyingRequest setPlaylistEntries:v32];
    }
    id v18 = v36;
    if (a7)
    {
      v33 = (void *)[objc_alloc((Class)getUIImageClass()) initWithCGImage:a7];
      [(MPModelLibraryPlaylistEditChangeRequest *)v24->_underlyingRequest setPlaylistUserImage:v33];
    }
    -[MPModelLibraryPlaylistEditChangeRequest setCoverArtworkRecipe:](v24->_underlyingRequest, "setCoverArtworkRecipe:", v20, v19, v36);
    [(MPModelLibraryPlaylistEditChangeRequest *)v24->_underlyingRequest setIsOwner:MEMORY[0x1E4F1CC38]];
    v34 = [(MPModelLibraryPlaylistEditChangeRequest *)v24->_underlyingRequest playlist];
    [v34 setOwner:1];

    [(MPModelLibraryPlaylistEditChangeRequest *)v24->_underlyingRequest setPlaylistName:v18];
    [(MPModelLibraryPlaylistEditChangeRequest *)v24->_underlyingRequest setPlaylistDescription:v19];
    [(MPModelLibraryPlaylistEditChangeRequest *)v24->_underlyingRequest setPublicPlaylist:v21];
    [(MPModelLibraryPlaylistEditChangeRequest *)v24->_underlyingRequest setVisiblePlaylist:v22];
    [(MPModelLibraryPlaylistEditChangeRequest *)v24->_underlyingRequest setAuthorStoreIdentifier:v23];
  }

  return v24;
}

- (void)performWithCompletionPolicy:(int64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v7 = [(MPModelLibraryPlaylistEditChangeRequest *)self->_underlyingRequest playlistEntries];
  v8 = [v7 allItems];
  v9 = objc_msgSend(v8, "msv_compactMap:", &__block_literal_global_13);

  if ([v9 count])
  {
    id v10 = objc_alloc_init((Class)getMPMutableSectionedCollectionClass_0());
    [v10 appendSection:&stru_1F3B7D290];
    [v10 appendItems:v9];
    uint64_t v18 = 0;
    id v19 = &v18;
    uint64_t v20 = 0x2050000000;
    v11 = (void *)getMPModelLibraryImportChangeRequestClass_softClass;
    uint64_t v21 = getMPModelLibraryImportChangeRequestClass_softClass;
    if (!getMPModelLibraryImportChangeRequestClass_softClass)
    {
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __getMPModelLibraryImportChangeRequestClass_block_invoke;
      v17[3] = &unk_1E6D453B0;
      v17[4] = &v18;
      __getMPModelLibraryImportChangeRequestClass_block_invoke((uint64_t)v17);
      v11 = (void *)v19[3];
    }
    v12 = v11;
    _Block_object_dispose(&v18, 8);
    id v13 = objc_alloc_init(v12);
    [v13 setModelObjects:v10];
    [v13 setShouldLibraryAdd:0];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __118__MusicKitInternal_SoftLinking_MPModelLibraryPlaylistEditChangeRequest_performWithCompletionPolicy_completionHandler___block_invoke_2;
    v14[3] = &unk_1E6D45BA8;
    v14[4] = self;
    id v15 = v6;
    int64_t v16 = a3;
    [v13 performWithResponseHandler:v14];
  }
  else
  {
    [(MusicKitInternal_SoftLinking_MPModelLibraryPlaylistEditChangeRequest *)self _performWithRequest:self->_underlyingRequest completionPolicy:a3 completionHandler:v6];
  }
}

- (void)_performWithRequest:(id)a3 completionPolicy:(int64_t)a4 completionHandler:(id)a5
{
  id v7 = a5;
  underlyingRequest = self->_underlyingRequest;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __127__MusicKitInternal_SoftLinking_MPModelLibraryPlaylistEditChangeRequest__performWithRequest_completionPolicy_completionHandler___block_invoke;
  v18[3] = &unk_1E6D45BD0;
  int64_t v20 = a4;
  id v19 = v7;
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  v14 = __127__MusicKitInternal_SoftLinking_MPModelLibraryPlaylistEditChangeRequest__performWithRequest_completionPolicy_completionHandler___block_invoke_2;
  id v15 = &unk_1E6D45BD0;
  id v16 = v19;
  int64_t v17 = a4;
  id v9 = v19;
  id v10 = (void *)[(MPModelLibraryPlaylistEditChangeRequest *)underlyingRequest newOperationWithLocalPersistenceResponseHandler:v18 completeResponseHandler:&v12];
  v11 = +[MusicKit_SoftLinking_MPModelLibraryTransientStateController sharedLibraryTransientStateController];
  [v11 performOperation:v10];
}

- (void).cxx_destruct
{
}

@end
@interface MusicKit_SoftLinking_MPModelLibraryAddToPlaylistChangeRequest
- (MPModelLibraryAddToPlaylistChangeRequest)_underlyingLibraryAddToPlaylistChangeRequest;
- (MusicKit_SoftLinking_MPModelLibraryAddToPlaylistChangeRequest)initWithPlaylist:(id)a3 songIdentifiers:(id)a4 representativeObject:(id)a5 referralObject:(id)a6;
- (id)storeImportAllowedHandler;
- (void)setStoreImportAllowedHandler:(id)a3;
@end

@implementation MusicKit_SoftLinking_MPModelLibraryAddToPlaylistChangeRequest

- (MusicKit_SoftLinking_MPModelLibraryAddToPlaylistChangeRequest)initWithPlaylist:(id)a3 songIdentifiers:(id)a4 representativeObject:(id)a5 referralObject:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v30.receiver = self;
  v30.super_class = (Class)MusicKit_SoftLinking_MPModelLibraryAddToPlaylistChangeRequest;
  v14 = [(MusicKit_SoftLinking_MPModelLibraryAddToPlaylistChangeRequest *)&v30 init];
  if (v14)
  {
    uint64_t v36 = 0;
    v37 = &v36;
    uint64_t v38 = 0x2050000000;
    v15 = (void *)getMPModelLibraryAddToPlaylistChangeRequestClass_softClass;
    uint64_t v39 = getMPModelLibraryAddToPlaylistChangeRequestClass_softClass;
    if (!getMPModelLibraryAddToPlaylistChangeRequestClass_softClass)
    {
      uint64_t v31 = MEMORY[0x1E4F143A8];
      uint64_t v32 = 3221225472;
      v33 = __getMPModelLibraryAddToPlaylistChangeRequestClass_block_invoke;
      v34 = &unk_1E6D453B0;
      v35 = &v36;
      __getMPModelLibraryAddToPlaylistChangeRequestClass_block_invoke((uint64_t)&v31);
      v15 = (void *)v37[3];
    }
    v16 = v15;
    _Block_object_dispose(&v36, 8);
    v17 = (MPModelLibraryAddToPlaylistChangeRequest *)objc_alloc_init(v16);
    underlyingAddToPlaylistChangeRequest = v14->_underlyingAddToPlaylistChangeRequest;
    v14->_underlyingAddToPlaylistChangeRequest = v17;

    v19 = v14->_underlyingAddToPlaylistChangeRequest;
    v20 = [v10 _underlyingModelObject];
    [(MPModelLibraryAddToPlaylistChangeRequest *)v19 setPlaylist:v20];

    v21 = objc_msgSend(v11, "msv_map:", &__block_literal_global_1);
    uint64_t v36 = 0;
    v37 = &v36;
    uint64_t v38 = 0x2050000000;
    v22 = (void *)getMPMutableSectionedCollectionClass_softClass;
    uint64_t v39 = getMPMutableSectionedCollectionClass_softClass;
    if (!getMPMutableSectionedCollectionClass_softClass)
    {
      uint64_t v31 = MEMORY[0x1E4F143A8];
      uint64_t v32 = 3221225472;
      v33 = __getMPMutableSectionedCollectionClass_block_invoke;
      v34 = &unk_1E6D453B0;
      v35 = &v36;
      __getMPMutableSectionedCollectionClass_block_invoke((uint64_t)&v31);
      v22 = (void *)v37[3];
    }
    v23 = v22;
    _Block_object_dispose(&v36, 8);
    id v24 = objc_alloc_init(v23);
    [v24 appendSection:&stru_1F3B7D290];
    [v24 appendItems:v21];
    [(MPModelLibraryAddToPlaylistChangeRequest *)v14->_underlyingAddToPlaylistChangeRequest setSongResults:v24];
    v25 = v14->_underlyingAddToPlaylistChangeRequest;
    v26 = [v12 _underlyingModelObject];
    [(MPModelLibraryAddToPlaylistChangeRequest *)v25 setRepresentativeModelObject:v26];

    v27 = v14->_underlyingAddToPlaylistChangeRequest;
    v28 = [v13 _underlyingModelObject];
    [(MPModelLibraryAddToPlaylistChangeRequest *)v27 setReferralObject:v28];
  }
  return v14;
}

- (MPModelLibraryAddToPlaylistChangeRequest)_underlyingLibraryAddToPlaylistChangeRequest
{
  return self->_underlyingAddToPlaylistChangeRequest;
}

- (void)setStoreImportAllowedHandler:(id)a3
{
  v4 = (void *)[a3 copy];
  id storeImportAllowedHandler = self->_storeImportAllowedHandler;
  self->_id storeImportAllowedHandler = v4;

  underlyingAddToPlaylistChangeRequest = self->_underlyingAddToPlaylistChangeRequest;
  id v7 = self->_storeImportAllowedHandler;
  [(MPModelLibraryAddToPlaylistChangeRequest *)underlyingAddToPlaylistChangeRequest setStoreImportAllowedHandler:v7];
}

- (id)storeImportAllowedHandler
{
  return self->_storeImportAllowedHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_storeImportAllowedHandler, 0);
  objc_storeStrong((id *)&self->_underlyingAddToPlaylistChangeRequest, 0);
}

@end
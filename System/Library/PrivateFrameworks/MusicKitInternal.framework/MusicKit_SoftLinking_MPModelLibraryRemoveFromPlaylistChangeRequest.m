@interface MusicKit_SoftLinking_MPModelLibraryRemoveFromPlaylistChangeRequest
- (MusicKit_SoftLinking_MPModelLibraryRemoveFromPlaylistChangeRequest)initWithPlaylist:(id)a3 entriesToRemove:(id)a4;
- (void)performWithCompletionPolicy:(int64_t)a3 completionHandler:(id)a4;
@end

@implementation MusicKit_SoftLinking_MPModelLibraryRemoveFromPlaylistChangeRequest

- (MusicKit_SoftLinking_MPModelLibraryRemoveFromPlaylistChangeRequest)initWithPlaylist:(id)a3 entriesToRemove:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)MusicKit_SoftLinking_MPModelLibraryRemoveFromPlaylistChangeRequest;
  v8 = [(MusicKit_SoftLinking_MPModelLibraryRemoveFromPlaylistChangeRequest *)&v20 init];
  if (v8)
  {
    uint64_t v9 = [v6 _underlyingModelObject];
    underlyingPlaylist = v8->_underlyingPlaylist;
    v8->_underlyingPlaylist = (MPModelPlaylist *)v9;

    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x2050000000;
    v11 = (void *)getMPMediaLibraryClass_softClass;
    uint64_t v29 = getMPMediaLibraryClass_softClass;
    if (!getMPMediaLibraryClass_softClass)
    {
      uint64_t v21 = MEMORY[0x1E4F143A8];
      uint64_t v22 = 3221225472;
      v23 = __getMPMediaLibraryClass_block_invoke;
      v24 = &unk_1E6D453B0;
      v25 = &v26;
      __getMPMediaLibraryClass_block_invoke((uint64_t)&v21);
      v11 = (void *)v27[3];
    }
    id v12 = v11;
    _Block_object_dispose(&v26, 8);
    v13 = [v12 deviceMediaLibrary];
    v14 = objc_msgSend(v7, "msv_compactMap:", &__block_literal_global_4);
    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x2050000000;
    v15 = (void *)getMPModelLibraryRemoveFromPlaylistChangeRequestClass_softClass;
    uint64_t v29 = getMPModelLibraryRemoveFromPlaylistChangeRequestClass_softClass;
    if (!getMPModelLibraryRemoveFromPlaylistChangeRequestClass_softClass)
    {
      uint64_t v21 = MEMORY[0x1E4F143A8];
      uint64_t v22 = 3221225472;
      v23 = __getMPModelLibraryRemoveFromPlaylistChangeRequestClass_block_invoke;
      v24 = &unk_1E6D453B0;
      v25 = &v26;
      __getMPModelLibraryRemoveFromPlaylistChangeRequestClass_block_invoke((uint64_t)&v21);
      v15 = (void *)v27[3];
    }
    v16 = v15;
    _Block_object_dispose(&v26, 8);
    uint64_t v17 = [[v16 alloc] initWithPlaylist:v8->_underlyingPlaylist inMediaLibrary:v13 andEntriesToRemove:v14];
    underlyingRequest = v8->_underlyingRequest;
    v8->_underlyingRequest = (MPModelLibraryRemoveFromPlaylistChangeRequest *)v17;
  }
  return v8;
}

- (void)performWithCompletionPolicy:(int64_t)a3 completionHandler:(id)a4
{
  id v5 = a4;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy__0;
  v11[4] = __Block_byref_object_dispose__0;
  id v12 = self->_underlyingPlaylist;
  underlyingRequest = self->_underlyingRequest;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __116__MusicKit_SoftLinking_MPModelLibraryRemoveFromPlaylistChangeRequest_performWithCompletionPolicy_completionHandler___block_invoke;
  v8[3] = &unk_1E6D45770;
  v10 = v11;
  id v7 = v5;
  id v9 = v7;
  [(MPModelLibraryRemoveFromPlaylistChangeRequest *)underlyingRequest performWithResponseHandler:v8];

  _Block_object_dispose(v11, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingPlaylist, 0);
  objc_storeStrong((id *)&self->_underlyingRequest, 0);
}

@end
@interface MusicKit_SoftLinking_MPModelLibraryDuplicatePlaylistChangeRequest
- (MusicKit_SoftLinking_MPModelLibraryDuplicatePlaylistChangeRequest)initWithPlaylist:(id)a3;
- (void)performWithCompletionPolicy:(int64_t)a3 completionHandler:(id)a4;
@end

@implementation MusicKit_SoftLinking_MPModelLibraryDuplicatePlaylistChangeRequest

- (MusicKit_SoftLinking_MPModelLibraryDuplicatePlaylistChangeRequest)initWithPlaylist:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MusicKit_SoftLinking_MPModelLibraryDuplicatePlaylistChangeRequest;
  v5 = [(MusicKit_SoftLinking_MPModelLibraryDuplicatePlaylistChangeRequest *)&v16 init];
  if (v5)
  {
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x2050000000;
    v6 = (void *)getMPModelLibraryDuplicatePlaylistChangeRequestClass_softClass;
    uint64_t v25 = getMPModelLibraryDuplicatePlaylistChangeRequestClass_softClass;
    if (!getMPModelLibraryDuplicatePlaylistChangeRequestClass_softClass)
    {
      uint64_t v17 = MEMORY[0x1E4F143A8];
      uint64_t v18 = 3221225472;
      v19 = __getMPModelLibraryDuplicatePlaylistChangeRequestClass_block_invoke;
      v20 = &unk_1E6D453B0;
      v21 = &v22;
      __getMPModelLibraryDuplicatePlaylistChangeRequestClass_block_invoke((uint64_t)&v17);
      v6 = (void *)v23[3];
    }
    v7 = v6;
    _Block_object_dispose(&v22, 8);
    id v8 = [v7 alloc];
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x2050000000;
    v9 = (void *)getMPMediaLibraryClass_softClass_0;
    uint64_t v25 = getMPMediaLibraryClass_softClass_0;
    if (!getMPMediaLibraryClass_softClass_0)
    {
      uint64_t v17 = MEMORY[0x1E4F143A8];
      uint64_t v18 = 3221225472;
      v19 = __getMPMediaLibraryClass_block_invoke_0;
      v20 = &unk_1E6D453B0;
      v21 = &v22;
      __getMPMediaLibraryClass_block_invoke_0((uint64_t)&v17);
      v9 = (void *)v23[3];
    }
    id v10 = v9;
    _Block_object_dispose(&v22, 8);
    v11 = [v10 deviceMediaLibrary];
    v12 = [v4 _underlyingModelObject];
    uint64_t v13 = [v8 initWithLibrary:v11 playlist:v12];
    underlyingChangeRequest = v5->_underlyingChangeRequest;
    v5->_underlyingChangeRequest = (MPModelLibraryDuplicatePlaylistChangeRequest *)v13;
  }
  return v5;
}

- (void)performWithCompletionPolicy:(int64_t)a3 completionHandler:(id)a4
{
  id v5 = a4;
  underlyingChangeRequest = self->_underlyingChangeRequest;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __115__MusicKit_SoftLinking_MPModelLibraryDuplicatePlaylistChangeRequest_performWithCompletionPolicy_completionHandler___block_invoke;
  v8[3] = &unk_1E6D45A48;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  [(MPModelLibraryDuplicatePlaylistChangeRequest *)underlyingChangeRequest performWithResponseHandler:v8];
}

- (void).cxx_destruct
{
}

@end
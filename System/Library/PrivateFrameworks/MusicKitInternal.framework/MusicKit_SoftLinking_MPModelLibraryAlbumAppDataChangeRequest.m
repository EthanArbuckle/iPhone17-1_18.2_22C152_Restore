@interface MusicKit_SoftLinking_MPModelLibraryAlbumAppDataChangeRequest
- (MusicKit_SoftLinking_MPModelLibraryAlbumAppDataChangeRequest)init;
- (void)performWithAlbum:(id)a3 appData:(id)a4 completionHandler:(id)a5;
@end

@implementation MusicKit_SoftLinking_MPModelLibraryAlbumAppDataChangeRequest

- (MusicKit_SoftLinking_MPModelLibraryAlbumAppDataChangeRequest)init
{
  v8.receiver = self;
  v8.super_class = (Class)MusicKit_SoftLinking_MPModelLibraryAlbumAppDataChangeRequest;
  v2 = [(MusicKit_SoftLinking_MPModelLibraryAlbumAppDataChangeRequest *)&v8 init];
  if (v2)
  {
    uint64_t v10 = 0;
    v11 = &v10;
    uint64_t v12 = 0x2050000000;
    v3 = (void *)getMPModelLibraryAlbumAppDataChangeRequestClass_softClass;
    uint64_t v13 = getMPModelLibraryAlbumAppDataChangeRequestClass_softClass;
    if (!getMPModelLibraryAlbumAppDataChangeRequestClass_softClass)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __getMPModelLibraryAlbumAppDataChangeRequestClass_block_invoke;
      v9[3] = &unk_1E6D453B0;
      v9[4] = &v10;
      __getMPModelLibraryAlbumAppDataChangeRequestClass_block_invoke((uint64_t)v9);
      v3 = (void *)v11[3];
    }
    v4 = v3;
    _Block_object_dispose(&v10, 8);
    v5 = (MPModelLibraryAlbumAppDataChangeRequest *)objc_alloc_init(v4);
    underlyingChangeRequest = v2->_underlyingChangeRequest;
    v2->_underlyingChangeRequest = v5;
  }
  return v2;
}

- (void)performWithAlbum:(id)a3 appData:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  underlyingChangeRequest = self->_underlyingChangeRequest;
  id v10 = a4;
  v11 = [a3 _underlyingModelObject];
  [(MPModelLibraryAlbumAppDataChangeRequest *)underlyingChangeRequest setModelObject:v11];

  uint64_t v12 = self->_underlyingChangeRequest;
  uint64_t v13 = [v10 _underlyingAlbumAppData];

  [(MPModelLibraryAlbumAppDataChangeRequest *)v12 setAlbumAppData:v13];
  v14 = self->_underlyingChangeRequest;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __107__MusicKit_SoftLinking_MPModelLibraryAlbumAppDataChangeRequest_performWithAlbum_appData_completionHandler___block_invoke;
  v18[3] = &unk_1E6D45E98;
  id v19 = v8;
  id v15 = v8;
  v16 = (void *)[(MPModelLibraryAlbumAppDataChangeRequest *)v14 newOperationWithResponseHandler:v18];
  v17 = [MEMORY[0x1E4F385E0] deviceLibrary];
  [v17 performOperation:v16];
}

- (void).cxx_destruct
{
}

@end
@interface MusicKit_SoftLinking_MPModelLibraryStartCollaborationChangeRequest
- (MusicKit_SoftLinking_MPModelLibraryStartCollaborationChangeRequest)initWithPlaylist:(id)a3 sharingMode:(int64_t)a4;
- (void)performWithCompletionHandler:(id)a3;
@end

@implementation MusicKit_SoftLinking_MPModelLibraryStartCollaborationChangeRequest

- (MusicKit_SoftLinking_MPModelLibraryStartCollaborationChangeRequest)initWithPlaylist:(id)a3 sharingMode:(int64_t)a4
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MusicKit_SoftLinking_MPModelLibraryStartCollaborationChangeRequest;
  v7 = [(MusicKit_SoftLinking_MPModelLibraryStartCollaborationChangeRequest *)&v15 init];
  if (v7)
  {
    uint64_t v17 = 0;
    v18 = &v17;
    uint64_t v19 = 0x2050000000;
    v8 = (void *)getMPModelLibraryStartCollaborationChangeRequestClass_softClass;
    uint64_t v20 = getMPModelLibraryStartCollaborationChangeRequestClass_softClass;
    if (!getMPModelLibraryStartCollaborationChangeRequestClass_softClass)
    {
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __getMPModelLibraryStartCollaborationChangeRequestClass_block_invoke;
      v16[3] = &unk_1E6D453B0;
      v16[4] = &v17;
      __getMPModelLibraryStartCollaborationChangeRequestClass_block_invoke((uint64_t)v16);
      v8 = (void *)v18[3];
    }
    v9 = v8;
    _Block_object_dispose(&v17, 8);
    v10 = (MPModelLibraryStartCollaborationChangeRequest *)objc_alloc_init(v9);
    underlyingStartCollaborationRequest = v7->_underlyingStartCollaborationRequest;
    v7->_underlyingStartCollaborationRequest = v10;

    v12 = v7->_underlyingStartCollaborationRequest;
    v13 = [v6 _underlyingModelObject];
    [(MPModelLibraryStartCollaborationChangeRequest *)v12 setPlaylistToConvert:v13];

    -[MPModelLibraryStartCollaborationChangeRequest setCollaborationSharingMode:](v7->_underlyingStartCollaborationRequest, "setCollaborationSharingMode:", [MEMORY[0x1E4F38628] _underlyingModelSharingModeForSharingMode:a4]);
  }

  return v7;
}

- (void)performWithCompletionHandler:(id)a3
{
  id v4 = a3;
  underlyingStartCollaborationRequest = self->_underlyingStartCollaborationRequest;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __99__MusicKit_SoftLinking_MPModelLibraryStartCollaborationChangeRequest_performWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E6D45578;
  id v8 = v4;
  id v6 = v4;
  [(MPModelLibraryStartCollaborationChangeRequest *)underlyingStartCollaborationRequest performWithResponseHandler:v7];
}

- (void).cxx_destruct
{
}

@end
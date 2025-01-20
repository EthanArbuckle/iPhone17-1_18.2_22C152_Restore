@interface MusicKit_SoftLinking_MPModelLibraryJoinCollaborationChangeRequest
- (MusicKit_SoftLinking_MPModelLibraryJoinCollaborationChangeRequest)initWithPlaylist:(id)a3 invitationURL:(id)a4;
- (void)performWithCompletionHandler:(id)a3;
@end

@implementation MusicKit_SoftLinking_MPModelLibraryJoinCollaborationChangeRequest

- (MusicKit_SoftLinking_MPModelLibraryJoinCollaborationChangeRequest)initWithPlaylist:(id)a3 invitationURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)MusicKit_SoftLinking_MPModelLibraryJoinCollaborationChangeRequest;
  v8 = [(MusicKit_SoftLinking_MPModelLibraryJoinCollaborationChangeRequest *)&v16 init];
  if (v8)
  {
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x2050000000;
    v9 = (void *)getMPModelLibraryJoinCollaborationChangeRequestClass_softClass;
    uint64_t v21 = getMPModelLibraryJoinCollaborationChangeRequestClass_softClass;
    if (!getMPModelLibraryJoinCollaborationChangeRequestClass_softClass)
    {
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __getMPModelLibraryJoinCollaborationChangeRequestClass_block_invoke;
      v17[3] = &unk_1E6D453B0;
      v17[4] = &v18;
      __getMPModelLibraryJoinCollaborationChangeRequestClass_block_invoke((uint64_t)v17);
      v9 = (void *)v19[3];
    }
    v10 = v9;
    _Block_object_dispose(&v18, 8);
    v11 = (MPModelLibraryJoinCollaborationChangeRequest *)objc_alloc_init(v10);
    underlyingJoinCollaborationRequest = v8->_underlyingJoinCollaborationRequest;
    v8->_underlyingJoinCollaborationRequest = v11;

    v13 = v8->_underlyingJoinCollaborationRequest;
    v14 = [v6 _underlyingModelObject];
    [(MPModelLibraryJoinCollaborationChangeRequest *)v13 setCollaborationToJoin:v14];

    [(MPModelLibraryJoinCollaborationChangeRequest *)v8->_underlyingJoinCollaborationRequest setInvitationURL:v7];
  }

  return v8;
}

- (void)performWithCompletionHandler:(id)a3
{
  id v4 = a3;
  underlyingJoinCollaborationRequest = self->_underlyingJoinCollaborationRequest;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __98__MusicKit_SoftLinking_MPModelLibraryJoinCollaborationChangeRequest_performWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E6D45578;
  id v8 = v4;
  id v6 = v4;
  [(MPModelLibraryJoinCollaborationChangeRequest *)underlyingJoinCollaborationRequest performWithResponseHandler:v7];
}

- (void).cxx_destruct
{
}

@end
@interface MusicKit_SoftLinking_MPModelLibraryEndCollaborationChangeRequest
- (MusicKit_SoftLinking_MPModelLibraryEndCollaborationChangeRequest)initWithPlaylist:(id)a3;
- (void)performWithCompletionHandler:(id)a3;
@end

@implementation MusicKit_SoftLinking_MPModelLibraryEndCollaborationChangeRequest

- (MusicKit_SoftLinking_MPModelLibraryEndCollaborationChangeRequest)initWithPlaylist:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MusicKit_SoftLinking_MPModelLibraryEndCollaborationChangeRequest;
  v5 = [(MusicKit_SoftLinking_MPModelLibraryEndCollaborationChangeRequest *)&v13 init];
  if (v5)
  {
    uint64_t v15 = 0;
    v16 = &v15;
    uint64_t v17 = 0x2050000000;
    v6 = (void *)getMPModelLibraryEndCollaborationChangeRequestClass_softClass;
    uint64_t v18 = getMPModelLibraryEndCollaborationChangeRequestClass_softClass;
    if (!getMPModelLibraryEndCollaborationChangeRequestClass_softClass)
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __getMPModelLibraryEndCollaborationChangeRequestClass_block_invoke;
      v14[3] = &unk_1E6D453B0;
      v14[4] = &v15;
      __getMPModelLibraryEndCollaborationChangeRequestClass_block_invoke((uint64_t)v14);
      v6 = (void *)v16[3];
    }
    v7 = v6;
    _Block_object_dispose(&v15, 8);
    v8 = (MPModelLibraryEndCollaborationChangeRequest *)objc_alloc_init(v7);
    underlyingEndCollaborationRequest = v5->_underlyingEndCollaborationRequest;
    v5->_underlyingEndCollaborationRequest = v8;

    v10 = v5->_underlyingEndCollaborationRequest;
    v11 = [v4 _underlyingModelObject];
    [(MPModelLibraryEndCollaborationChangeRequest *)v10 setCollaborationToEnd:v11];
  }
  return v5;
}

- (void)performWithCompletionHandler:(id)a3
{
  id v4 = a3;
  underlyingEndCollaborationRequest = self->_underlyingEndCollaborationRequest;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __97__MusicKit_SoftLinking_MPModelLibraryEndCollaborationChangeRequest_performWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E6D45578;
  id v8 = v4;
  id v6 = v4;
  [(MPModelLibraryEndCollaborationChangeRequest *)underlyingEndCollaborationRequest performWithResponseHandler:v7];
}

- (void).cxx_destruct
{
}

@end
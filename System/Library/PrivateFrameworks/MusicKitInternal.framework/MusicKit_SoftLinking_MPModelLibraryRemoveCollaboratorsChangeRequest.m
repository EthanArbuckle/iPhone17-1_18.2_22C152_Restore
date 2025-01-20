@interface MusicKit_SoftLinking_MPModelLibraryRemoveCollaboratorsChangeRequest
- (MusicKit_SoftLinking_MPModelLibraryRemoveCollaboratorsChangeRequest)initWithPlaylist:(id)a3 socialProfileIDs:(id)a4;
- (void)performWithCompletionHandler:(id)a3;
@end

@implementation MusicKit_SoftLinking_MPModelLibraryRemoveCollaboratorsChangeRequest

- (MusicKit_SoftLinking_MPModelLibraryRemoveCollaboratorsChangeRequest)initWithPlaylist:(id)a3 socialProfileIDs:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)MusicKit_SoftLinking_MPModelLibraryRemoveCollaboratorsChangeRequest;
  v8 = [(MusicKit_SoftLinking_MPModelLibraryRemoveCollaboratorsChangeRequest *)&v16 init];
  if (v8)
  {
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x2050000000;
    v9 = (void *)getMPModelLibraryRemoveCollaboratorsChangeRequestClass_softClass;
    uint64_t v21 = getMPModelLibraryRemoveCollaboratorsChangeRequestClass_softClass;
    if (!getMPModelLibraryRemoveCollaboratorsChangeRequestClass_softClass)
    {
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __getMPModelLibraryRemoveCollaboratorsChangeRequestClass_block_invoke;
      v17[3] = &unk_1E6D453B0;
      v17[4] = &v18;
      __getMPModelLibraryRemoveCollaboratorsChangeRequestClass_block_invoke((uint64_t)v17);
      v9 = (void *)v19[3];
    }
    v10 = v9;
    _Block_object_dispose(&v18, 8);
    v11 = (MPModelLibraryRemoveCollaboratorsChangeRequest *)objc_alloc_init(v10);
    underlyingRemoveCollaboratorsChangeRequest = v8->_underlyingRemoveCollaboratorsChangeRequest;
    v8->_underlyingRemoveCollaboratorsChangeRequest = v11;

    v13 = v8->_underlyingRemoveCollaboratorsChangeRequest;
    v14 = [v6 _underlyingModelObject];
    [(MPModelLibraryRemoveCollaboratorsChangeRequest *)v13 setCollaboration:v14];

    [(MPModelLibraryRemoveCollaboratorsChangeRequest *)v8->_underlyingRemoveCollaboratorsChangeRequest setSocialProfileIDsToRemove:v7];
  }

  return v8;
}

- (void)performWithCompletionHandler:(id)a3
{
  id v4 = a3;
  underlyingRemoveCollaboratorsChangeRequest = self->_underlyingRemoveCollaboratorsChangeRequest;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __100__MusicKit_SoftLinking_MPModelLibraryRemoveCollaboratorsChangeRequest_performWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E6D45578;
  id v8 = v4;
  id v6 = v4;
  [(MPModelLibraryRemoveCollaboratorsChangeRequest *)underlyingRemoveCollaboratorsChangeRequest performWithResponseHandler:v7];
}

- (void).cxx_destruct
{
}

@end
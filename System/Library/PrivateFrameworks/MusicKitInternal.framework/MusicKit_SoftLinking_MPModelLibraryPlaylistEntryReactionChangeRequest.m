@interface MusicKit_SoftLinking_MPModelLibraryPlaylistEntryReactionChangeRequest
- (MusicKit_SoftLinking_MPModelLibraryPlaylistEntryReactionChangeRequest)initWithPlaylist:(id)a3 playlistEntry:(id)a4 reactionText:(id)a5;
- (void)performWithResponseHandler:(id)a3;
@end

@implementation MusicKit_SoftLinking_MPModelLibraryPlaylistEntryReactionChangeRequest

- (MusicKit_SoftLinking_MPModelLibraryPlaylistEntryReactionChangeRequest)initWithPlaylist:(id)a3 playlistEntry:(id)a4 reactionText:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)MusicKit_SoftLinking_MPModelLibraryPlaylistEntryReactionChangeRequest;
  v11 = [(MusicKit_SoftLinking_MPModelLibraryPlaylistEntryReactionChangeRequest *)&v20 init];
  if (v11)
  {
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x2050000000;
    v12 = (void *)getMPModelLibraryPlaylistEntryReactionChangeRequestClass_softClass;
    uint64_t v25 = getMPModelLibraryPlaylistEntryReactionChangeRequestClass_softClass;
    if (!getMPModelLibraryPlaylistEntryReactionChangeRequestClass_softClass)
    {
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __getMPModelLibraryPlaylistEntryReactionChangeRequestClass_block_invoke;
      v21[3] = &unk_1E6D453B0;
      v21[4] = &v22;
      __getMPModelLibraryPlaylistEntryReactionChangeRequestClass_block_invoke((uint64_t)v21);
      v12 = (void *)v23[3];
    }
    v13 = v12;
    _Block_object_dispose(&v22, 8);
    id v14 = [v13 alloc];
    v15 = [v8 _underlyingModelObject];
    v16 = [v9 _underlyingModelObject];
    uint64_t v17 = [v14 initWithPlaylist:v15 playlistEntry:v16 reactionText:v10];
    underlyingPlaylistEntryReactionChangeRequest = v11->_underlyingPlaylistEntryReactionChangeRequest;
    v11->_underlyingPlaylistEntryReactionChangeRequest = (MPModelLibraryPlaylistEntryReactionChangeRequest *)v17;
  }
  return v11;
}

- (void)performWithResponseHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
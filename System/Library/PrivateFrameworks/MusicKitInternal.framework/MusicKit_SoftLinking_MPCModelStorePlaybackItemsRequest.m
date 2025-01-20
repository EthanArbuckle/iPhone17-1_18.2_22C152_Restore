@interface MusicKit_SoftLinking_MPCModelStorePlaybackItemsRequest
- (MusicKit_SoftLinking_MPCModelStorePlaybackItemsRequest)initWithStoreIDs:(id)a3;
- (void)performWithCompletionHandler:(id)a3;
@end

@implementation MusicKit_SoftLinking_MPCModelStorePlaybackItemsRequest

- (MusicKit_SoftLinking_MPCModelStorePlaybackItemsRequest)initWithStoreIDs:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MusicKit_SoftLinking_MPCModelStorePlaybackItemsRequest;
  v5 = [(MusicKit_SoftLinking_MPCModelStorePlaybackItemsRequest *)&v11 init];
  if (v5)
  {
    uint64_t v13 = 0;
    v14 = &v13;
    uint64_t v15 = 0x2050000000;
    v6 = (void *)getMPCModelStorePlaybackItemsRequestClass_softClass;
    uint64_t v16 = getMPCModelStorePlaybackItemsRequestClass_softClass;
    if (!getMPCModelStorePlaybackItemsRequestClass_softClass)
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __getMPCModelStorePlaybackItemsRequestClass_block_invoke;
      v12[3] = &unk_1E6D453B0;
      v12[4] = &v13;
      __getMPCModelStorePlaybackItemsRequestClass_block_invoke((uint64_t)v12);
      v6 = (void *)v14[3];
    }
    v7 = v6;
    _Block_object_dispose(&v13, 8);
    id v8 = objc_alloc_init(v7);
    [v8 setStoreIDs:v4];
    underlyingRequest = v5->_underlyingRequest;
    v5->_underlyingRequest = (MPCModelStorePlaybackItemsRequest *)v8;
  }
  return v5;
}

- (void)performWithCompletionHandler:(id)a3
{
  id v4 = a3;
  underlyingRequest = self->_underlyingRequest;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __87__MusicKit_SoftLinking_MPCModelStorePlaybackItemsRequest_performWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E6D45428;
  id v8 = v4;
  id v6 = v4;
  [(MPCModelStorePlaybackItemsRequest *)underlyingRequest performWithResponseHandler:v7];
}

- (void).cxx_destruct
{
}

@end
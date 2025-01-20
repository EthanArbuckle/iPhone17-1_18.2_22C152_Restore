@interface MusicKit_SoftLinking_MPModelLibraryDownloadQueueRequest
+ (NSString)downloadQueueDidChangeNotificationName;
- (MusicKit_SoftLinking_MPModelLibraryDownloadQueueRequest)init;
- (void)_handleDownloadQueueDidChangeNotification:(id)a3;
- (void)dealloc;
- (void)performWithCompletionHandler:(id)a3;
@end

@implementation MusicKit_SoftLinking_MPModelLibraryDownloadQueueRequest

- (MusicKit_SoftLinking_MPModelLibraryDownloadQueueRequest)init
{
  v14.receiver = self;
  v14.super_class = (Class)MusicKit_SoftLinking_MPModelLibraryDownloadQueueRequest;
  v2 = [(MusicKit_SoftLinking_MPModelLibraryDownloadQueueRequest *)&v14 init];
  if (v2)
  {
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x2050000000;
    v3 = (void *)getMPModelLibraryDownloadQueueRequestClass_softClass;
    uint64_t v23 = getMPModelLibraryDownloadQueueRequestClass_softClass;
    if (!getMPModelLibraryDownloadQueueRequestClass_softClass)
    {
      uint64_t v15 = MEMORY[0x1E4F143A8];
      uint64_t v16 = 3221225472;
      v17 = __getMPModelLibraryDownloadQueueRequestClass_block_invoke;
      v18 = &unk_1E6D453B0;
      v19 = &v20;
      __getMPModelLibraryDownloadQueueRequestClass_block_invoke((uint64_t)&v15);
      v3 = (void *)v21[3];
    }
    v4 = v3;
    _Block_object_dispose(&v20, 8);
    v5 = (MPModelLibraryDownloadQueueRequest *)objc_alloc_init(v4);
    underlyingDownloadQueueRequest = v2->_underlyingDownloadQueueRequest;
    v2->_underlyingDownloadQueueRequest = v5;

    v7 = v2->_underlyingDownloadQueueRequest;
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x2050000000;
    v8 = (void *)getMPModelSongClass_softClass_0;
    uint64_t v23 = getMPModelSongClass_softClass_0;
    if (!getMPModelSongClass_softClass_0)
    {
      uint64_t v15 = MEMORY[0x1E4F143A8];
      uint64_t v16 = 3221225472;
      v17 = __getMPModelSongClass_block_invoke_0;
      v18 = &unk_1E6D453B0;
      v19 = &v20;
      __getMPModelSongClass_block_invoke_0((uint64_t)&v15);
      v8 = (void *)v21[3];
    }
    id v9 = v8;
    _Block_object_dispose(&v20, 8);
    v10 = [v9 kindWithVariants:3];
    [(MPModelLibraryDownloadQueueRequest *)v7 setItemKind:v10];

    v11 = v2->_underlyingDownloadQueueRequest;
    v12 = [MEMORY[0x1E4F38658] _supportedPropertiesForModelObjectType:30];
    [(MPModelLibraryDownloadQueueRequest *)v11 setItemProperties:v12];

    [(MPModelLibraryDownloadQueueRequest *)v2->_underlyingDownloadQueueRequest setLabel:@"MusicKit - Download Queue"];
  }
  return v2;
}

- (void)dealloc
{
  if (self->_underlyingUpdatedResponse)
  {
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    underlyingUpdatedResponse = self->_underlyingUpdatedResponse;
    v5 = getMPModelResponseDidInvalidateNotification();
    [v3 removeObserver:underlyingUpdatedResponse name:v5 object:self->_underlyingUpdatedResponse];
  }
  v6.receiver = self;
  v6.super_class = (Class)MusicKit_SoftLinking_MPModelLibraryDownloadQueueRequest;
  [(MusicKit_SoftLinking_MPModelLibraryDownloadQueueRequest *)&v6 dealloc];
}

+ (NSString)downloadQueueDidChangeNotificationName
{
  return (NSString *)@"MusicKit_SoftLinking_MPModelLibraryDownloadQueueDidChangeNotification";
}

- (void)_handleDownloadQueueDidChangeNotification:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F28EB8];
  id v5 = a3;
  id v7 = [v4 defaultCenter];
  objc_super v6 = [v5 userInfo];

  [v7 postNotificationName:@"MusicKit_SoftLinking_MPModelLibraryDownloadQueueDidChangeNotification" object:self userInfo:v6];
}

- (void)performWithCompletionHandler:(id)a3
{
  id v4 = a3;
  underlyingDownloadQueueRequest = self->_underlyingDownloadQueueRequest;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __88__MusicKit_SoftLinking_MPModelLibraryDownloadQueueRequest_performWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E6D45A88;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(MPModelLibraryDownloadQueueRequest *)underlyingDownloadQueueRequest performWithResponseHandler:v7];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingUpdatedResponse, 0);
  objc_storeStrong((id *)&self->_underlyingDownloadQueueRequest, 0);
}

@end
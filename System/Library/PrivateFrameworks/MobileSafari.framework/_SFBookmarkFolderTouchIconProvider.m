@interface _SFBookmarkFolderTouchIconProvider
- (BOOL)canHandleRequest:(id)a3;
- (_SFBookmarkFolderTouchIconProvider)init;
- (id)backgroundColor;
- (id)defaultFolderIconForRequest:(id)a3;
- (id)folderUUIDForRequest:(id)a3;
- (id)subrequestsForRequest:(id)a3 maximumNumberOfSubrequests:(unint64_t)a4;
- (void)_folderContentsDidChange:(id)a3;
@end

@implementation _SFBookmarkFolderTouchIconProvider

- (BOOL)canHandleRequest:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [v3 bookmark];
    char v5 = [v4 isFolder];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (_SFBookmarkFolderTouchIconProvider)init
{
  v13.receiver = self;
  v13.super_class = (Class)_SFBookmarkFolderTouchIconProvider;
  v2 = [(WBSBookmarkFolderTouchIconProvider *)&v13 init];
  if (v2)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"com.apple.Safari._SFBookmarkFolderTouchIconProvider.internalQueue.%p", v2);
    id v3 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v4 = dispatch_queue_create((const char *)[v3 UTF8String], 0);
    bookmarkCollectionAccessQueue = v2->_bookmarkCollectionAccessQueue;
    v2->_bookmarkCollectionAccessQueue = (OS_dispatch_queue *)v4;

    v6 = v2->_bookmarkCollectionAccessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __42___SFBookmarkFolderTouchIconProvider_init__block_invoke;
    block[3] = &unk_1E54E9858;
    v7 = v2;
    v12 = v7;
    dispatch_async(v6, block);
    v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 addObserver:v7 selector:sel__folderContentsDidChange_ name:*MEMORY[0x1E4FB6158] object:0];

    v9 = v7;
  }

  return v2;
}

- (id)backgroundColor
{
  return (id)[MEMORY[0x1E4FB1618] systemBackgroundColor];
}

- (id)defaultFolderIconForRequest:(id)a3
{
  return 0;
}

- (id)folderUUIDForRequest:(id)a3
{
  id v3 = [a3 bookmark];
  dispatch_queue_t v4 = [v3 UUID];

  return v4;
}

- (id)subrequestsForRequest:(id)a3 maximumNumberOfSubrequests:(unint64_t)a4
{
  v6 = [a3 bookmark];
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__0;
  v19 = __Block_byref_object_dispose__0;
  id v20 = 0;
  bookmarkCollectionAccessQueue = self->_bookmarkCollectionAccessQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __87___SFBookmarkFolderTouchIconProvider_subrequestsForRequest_maximumNumberOfSubrequests___block_invoke;
  v11[3] = &unk_1E54EA058;
  v11[4] = self;
  id v12 = v6;
  objc_super v13 = &v15;
  unint64_t v14 = a4;
  id v8 = v6;
  dispatch_sync(bookmarkCollectionAccessQueue, v11);
  id v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);

  return v9;
}

- (void)_folderContentsDidChange:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  bookmarkCollectionAccessQueue = self->_bookmarkCollectionAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63___SFBookmarkFolderTouchIconProvider__folderContentsDidChange___block_invoke;
  block[3] = &unk_1E54EA4F0;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(bookmarkCollectionAccessQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bookmarkCollectionAccessQueue, 0);

  objc_storeStrong((id *)&self->_collection, 0);
}

@end
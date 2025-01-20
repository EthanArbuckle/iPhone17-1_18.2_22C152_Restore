@interface ICRemoveMediaDRMOperation
- (ICRemoveMediaDRMOperation)initWithFilePath:(id)a3 sinfs:(id)a4;
- (void)execute;
- (void)removeDRMWithCompletionHandler:(id)a3;
@end

@implementation ICRemoveMediaDRMOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_newFileExtension, 0);
  objc_storeStrong((id *)&self->_sinfs, 0);

  objc_storeStrong((id *)&self->_mediaFilePath, 0);
}

- (void)execute
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = v3;
  sinfs = self->_sinfs;
  if (sinfs) {
    [v3 setObject:sinfs forKey:*MEMORY[0x1E4F580D0]];
  }
  v6 = [MEMORY[0x1E4F580D8] fileProcessor];
  mediaFilePath = self->_mediaFilePath;
  v13[4] = self;
  id v14 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __36__ICRemoveMediaDRMOperation_execute__block_invoke;
  v13[3] = &unk_1E5AC9A38;
  v8 = [v6 processPurchasedItem:mediaFilePath withAttributes:v4 resultInfo:&v14 progressBlock:v13];
  id v9 = v14;

  v10 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v16 = v8;
    __int16 v17 = 2114;
    id v18 = v9;
    _os_log_impl(&dword_1A2D01000, v10, OS_LOG_TYPE_DEFAULT, "RemoveDRM operation complete. err=%{public}@, resultInfo=%{public}@", buf, 0x16u);
  }

  if (!v8)
  {
    v11 = [v9 objectForKey:*MEMORY[0x1E4F580C0]];
    newFileExtension = self->_newFileExtension;
    self->_newFileExtension = v11;
  }
  [(ICRequestOperation *)self finishWithError:v8];
}

void __36__ICRemoveMediaDRMOperation_execute__block_invoke(uint64_t a1, float a2)
{
  id v3 = [*(id *)(a1 + 32) progress];
  [v3 setCompletedUnitCount:100 * (uint64_t)a2];
}

- (void)removeDRMWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__ICRemoveMediaDRMOperation_removeDRMWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E5ACD8E0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(ICRequestOperation *)self performRequestWithCompletionHandler:v6];
}

uint64_t __60__ICRemoveMediaDRMOperation_removeDRMWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 320), a2);
}

- (ICRemoveMediaDRMOperation)initWithFilePath:(id)a3 sinfs:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICRemoveMediaDRMOperation;
  id v9 = [(ICRequestOperation *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mediaFilePath, a3);
    objc_storeStrong((id *)&v10->_sinfs, a4);
  }

  return v10;
}

@end
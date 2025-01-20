@interface MFDARequestQueue
- (BOOL)processRequests:(id)a3;
- (MFDARequestQueue)initWithAccount:(id)a3 folderID:(id)a4;
- (id)filterRequests:(id)a3;
@end

@implementation MFDARequestQueue

- (MFDARequestQueue)initWithAccount:(id)a3 folderID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MFDARequestQueue;
  v9 = [(MFRequestQueue *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_account, a3);
    objc_storeStrong((id *)&v10->_folderID, a4);
  }

  return v10;
}

- (id)filterRequests:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__MFDARequestQueue_filterRequests___block_invoke;
  v7[3] = &unk_1E5D3B638;
  id v5 = v4;
  id v8 = v5;
  [v3 enumerateObjectsUsingBlock:v7];

  return v5;
}

void __35__MFDARequestQueue_filterRequests___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [v5 first];

  if (v3)
  {
    id v4 = [v5 first];
    if ([v4 shouldSend]
      && ([*(id *)(a1 + 32) containsObject:v5] & 1) == 0)
    {
      [*(id *)(a1 + 32) addObject:v5];
    }
  }
}

- (BOOL)processRequests:(id)a3
{
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 1;
  id v4 = [(MFDARequestQueue *)self filterRequests:a3];
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  int v20 = -1;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  v13 = __36__MFDARequestQueue_processRequests___block_invoke;
  v14 = &unk_1E5D3B660;
  v17 = v19;
  id v6 = v5;
  id v15 = v6;
  v16 = self;
  v18 = &v21;
  [v4 enumerateObjectsUsingBlock:&v11];
  if (objc_msgSend(v6, "count", v11, v12, v13, v14))
  {
    BOOL v7 = [(DAMailAccount *)self->_account processRequests:v6 mailbox:self->_folderID];
    id v8 = v22;
    if (!v7) {
      *((unsigned char *)v22 + 24) = 0;
    }
  }
  else
  {
    id v8 = v22;
  }
  char v9 = *((unsigned char *)v8 + 24);

  _Block_object_dispose(v19, 8);
  _Block_object_dispose(&v21, 8);
  return v9;
}

void __36__MFDARequestQueue_processRequests___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = [v6 first];
  int v4 = [v3 bodyFormat];
  int v5 = v4;
  if (v4 != -1
    && v4 != *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)
    && [*(id *)(a1 + 32) count])
  {
    if (([*(id *)(*(void *)(a1 + 40) + 24) processRequests:*(void *)(a1 + 32) mailbox:*(void *)(*(void *)(a1 + 40) + 32)] & 1) == 0)*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0; {
    [*(id *)(a1 + 32) removeAllObjects];
    }
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = -1;
  }
  [*(id *)(a1 + 32) addObject:v6];
  if (v5 != -1) {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v5;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_folderID, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
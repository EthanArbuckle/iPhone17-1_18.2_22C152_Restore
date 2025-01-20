@interface FCAVAssetFactory
- (FCAVAssetFactory)init;
- (id)assetWithIdentifier:(id)a3 remoteURL:(id)a4 overrideMIMEType:(id)a5;
- (id)initWithAssetCache:(void *)a3 assetKeyCache:(void *)a4 assetKeyManager:(void *)a5 assetResourceLoader:;
@end

@implementation FCAVAssetFactory

- (id)initWithAssetCache:(void *)a3 assetKeyCache:(void *)a4 assetKeyManager:(void *)a5 assetResourceLoader:
{
  id v10 = a2;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (a1)
  {
    v20.receiver = a1;
    v20.super_class = (Class)FCAVAssetFactory;
    v14 = (id *)objc_msgSendSuper2(&v20, sel_init);
    a1 = v14;
    if (v14)
    {
      objc_storeStrong(v14 + 1, a2);
      objc_storeStrong(a1 + 2, a3);
      objc_storeStrong(a1 + 3, a4);
      objc_storeStrong(a1 + 4, a5);
      uint64_t v15 = +[FCMapTable strongToWeakObjectsMapTable];
      id v16 = a1[5];
      a1[5] = (id)v15;

      uint64_t v17 = [objc_alloc(MEMORY[0x1E4F81C18]) initWithOptions:1];
      id v18 = a1[6];
      a1[6] = (id)v17;
    }
  }

  return a1;
}

- (id)assetWithIdentifier:(id)a3 remoteURL:(id)a4 overrideMIMEType:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__90;
  v27 = __Block_byref_object_dispose__90;
  id v28 = 0;
  if (self) {
    assetsLock = self->_assetsLock;
  }
  else {
    assetsLock = 0;
  }
  id v12 = assetsLock;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __67__FCAVAssetFactory_assetWithIdentifier_remoteURL_overrideMIMEType___block_invoke;
  v18[3] = &unk_1E5B5C190;
  v18[4] = self;
  id v13 = v8;
  id v19 = v13;
  v22 = &v23;
  id v14 = v9;
  id v20 = v14;
  id v15 = v10;
  id v21 = v15;
  [(NFUnfairLock *)v12 performWithLockSync:v18];

  id v16 = (id)v24[5];
  _Block_object_dispose(&v23, 8);

  return v16;
}

void __67__FCAVAssetFactory_assetWithIdentifier_remoteURL_overrideMIMEType___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  if (v2) {
    v2 = (void *)v2[5];
  }
  uint64_t v3 = a1[5];
  v4 = v2;
  v5 = [v4 objectForKey:v3];

  if (v5)
  {
    uint64_t v24 = a1[8];
    id v23 = v5;
    objc_storeStrong((id *)(*(void *)(v24 + 8) + 40), v5);
  }
  else
  {
    v6 = [FCAVAsset alloc];
    id v8 = (void *)a1[5];
    v7 = (void *)a1[6];
    id v9 = (void *)a1[4];
    if (v9)
    {
      id v11 = (void *)v9[1];
      id v10 = (void *)v9[2];
      id v12 = (void *)v9[3];
      id v9 = (void *)v9[4];
    }
    else
    {
      id v12 = 0;
      id v11 = 0;
      id v10 = 0;
    }
    id v13 = (void *)a1[7];
    id v14 = v9;
    id v15 = v12;
    id v16 = v10;
    id v17 = v11;
    id v18 = -[FCAVAsset initWithIdentifier:remoteURL:assetCache:assetKeyCache:assetKeyManager:assetResourceLoader:overrideMIMEType:]((id *)&v6->super.isa, v8, v7, v17, v16, v15, v14, v13);
    uint64_t v19 = *(void *)(a1[8] + 8);
    id v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v18;

    uint64_t v21 = a1[4];
    if (v21) {
      v22 = *(void **)(v21 + 40);
    }
    else {
      v22 = 0;
    }
    [v22 setObject:*(void *)(*(void *)(a1[8] + 8) + 40) forKey:a1[5]];
  }
}

- (FCAVAssetFactory)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    id v8 = "-[FCAVAssetFactory init]";
    __int16 v9 = 2080;
    id v10 = "FCAVAssetFactory.m";
    __int16 v11 = 1024;
    int v12 = 32;
    __int16 v13 = 2114;
    id v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCAVAssetFactory init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

void __67__FCAVAssetFactory_assetWithIdentifier_remoteURL_overrideMIMEType___block_invoke_2(uint64_t a1)
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetsLock, 0);
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_assetResourceLoader, 0);
  objc_storeStrong((id *)&self->_assetKeyManager, 0);
  objc_storeStrong((id *)&self->_assetKeyCache, 0);
  objc_storeStrong((id *)&self->_assetCache, 0);
}

@end
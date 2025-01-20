@interface FCAVAsset
- (AVURLAsset)asset;
- (BOOL)isEqual:(id)a3;
- (FCAVAsset)init;
- (FCContentArchive)contentArchive;
- (FCContentManifest)contentManifest;
- (NSString)identifier;
- (id)initWithIdentifier:(void *)a3 remoteURL:(void *)a4 assetCache:(void *)a5 assetKeyCache:(void *)a6 assetKeyManager:(void *)a7 assetResourceLoader:(void *)a8 overrideMIMEType:;
- (uint64_t)isHLS;
- (unint64_t)hash;
- (void)_resetUnderlyingAsset;
@end

@implementation FCAVAsset

void __120__FCAVAsset_initWithIdentifier_remoteURL_assetCache_assetKeyCache_assetKeyManager_assetResourceLoader_overrideMIMEType___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *MEMORY[0x1E4F16138];
  id v4 = a2;
  objc_msgSend(v4, "fc_safelySetObjectAllowingNil:forKey:", v2, v3);
  objc_msgSend(v4, "fc_safelySetObjectAllowingNil:forKey:", MEMORY[0x1E4F1CC38], *MEMORY[0x1E4F16160]);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    v7 = [(FCAVAsset *)self identifier];
    v8 = [v6 identifier];
    char v9 = [v7 isEqualToString:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (id)initWithIdentifier:(void *)a3 remoteURL:(void *)a4 assetCache:(void *)a5 assetKeyCache:(void *)a6 assetKeyManager:(void *)a7 assetResourceLoader:(void *)a8 overrideMIMEType:
{
  id v15 = a2;
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  if (a1)
  {
    v35.receiver = a1;
    v35.super_class = (Class)FCAVAsset;
    a1 = (id *)objc_msgSendSuper2(&v35, sel_init);
    if (a1)
    {
      uint64_t v22 = [v15 copy];
      id v23 = a1[2];
      a1[2] = (id)v22;

      objc_storeWeak(a1 + 5, v17);
      objc_storeWeak(a1 + 6, v18);
      objc_storeWeak(a1 + 8, v19);
      objc_storeWeak(a1 + 7, v20);
      v24 = (void *)MEMORY[0x1E4F1C9E8];
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __120__FCAVAsset_initWithIdentifier_remoteURL_assetCache_assetKeyCache_assetKeyManager_assetResourceLoader_overrideMIMEType___block_invoke;
      v33[3] = &unk_1E5B4BF78;
      id v34 = v21;
      uint64_t v25 = objc_msgSend(v24, "fc_dictionary:", v33);
      id v26 = a1[3];
      a1[3] = (id)v25;

      id v27 = objc_alloc_init(MEMORY[0x1E4F81C18]);
      id v28 = a1[4];
      a1[4] = v27;

      uint64_t v29 = [v16 copy];
      id v30 = a1[9];
      a1[9] = (id)v29;

      v31 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v31 addObserver:a1 selector:sel__resetUnderlyingAsset name:*MEMORY[0x1E4F15048] object:0];
    }
  }

  return a1;
}

- (FCAVAsset)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCAVAsset init]";
    __int16 v9 = 2080;
    v10 = "FCAVAsset.m";
    __int16 v11 = 1024;
    int v12 = 52;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCAVAsset init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (unint64_t)hash
{
  uint64_t v2 = [(FCAVAsset *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (AVURLAsset)asset
{
  uint64_t v8 = 0;
  __int16 v9 = &v8;
  uint64_t v10 = 0x3032000000;
  __int16 v11 = __Block_byref_object_copy__80;
  int v12 = __Block_byref_object_dispose__80;
  id v13 = 0;
  if (self) {
    assetLock = self->_assetLock;
  }
  else {
    assetLock = 0;
  }
  uint64_t v4 = assetLock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __18__FCAVAsset_asset__block_invoke;
  v7[3] = &unk_1E5B4F3B0;
  v7[4] = self;
  v7[5] = &v8;
  [(NFUnfairLock *)v4 performWithLockSync:v7];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (AVURLAsset *)v5;
}

void __18__FCAVAsset_asset__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  unint64_t v3 = *(void **)(v2 + 8);
  if (!v3) {
    goto LABEL_4;
  }
  if ([v3 statusOfValueForKey:@"duration" error:0] != 3) {
    goto LABEL_17;
  }
  uint64_t v2 = *(void *)(a1 + 32);
  if (!v2)
  {
    id v5 = 0;
    id WeakRetained = 0;
  }
  else
  {
LABEL_4:
    id WeakRetained = objc_loadWeakRetained((id *)(v2 + 40));
    id v5 = *(void **)(a1 + 32);
  }
  id v6 = [v5 identifier];
  v7 = [WeakRetained interestTokenForAssetIdentifier:v6];

  uint64_t v8 = *(void *)(a1 + 32);
  if (v8)
  {
    id v9 = objc_loadWeakRetained((id *)(v8 + 40));
    uint64_t v10 = *(void **)(a1 + 32);
  }
  else
  {
    uint64_t v10 = 0;
    id v9 = 0;
  }
  __int16 v11 = [v10 identifier];
  int v12 = [v9 cachedFileURLForAssetIdentifier:v11];

  id v13 = (void *)MEMORY[0x1E4F166C8];
  v14 = *(void **)(a1 + 32);
  if (v12)
  {
    if (v14) {
      v14 = (void *)v14[3];
    }
    uint64_t v15 = v14;
    uint64_t v16 = [v13 URLAssetWithURL:v12 options:v15];
    uint64_t v17 = *(void *)(a1 + 32);
    id v18 = *(void **)(v17 + 8);
    *(void *)(v17 + 8) = v16;

    id v19 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));
    [v19 registerAVURLAssetForAutomaticKeyManagement:*(void *)(*(void *)(a1 + 32) + 8)];
  }
  else
  {
    if (v14)
    {
      id v20 = (void *)v14[9];
      v14 = (void *)v14[3];
    }
    else
    {
      id v20 = 0;
    }
    id v21 = v14;
    id v22 = v20;
    uint64_t v23 = [v13 URLAssetWithURL:v22 options:v21];
    uint64_t v24 = *(void *)(a1 + 32);
    uint64_t v25 = *(void **)(v24 + 8);
    *(void *)(v24 + 8) = v23;

    id v26 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));
    [v26 registerAVURLAssetForAutomaticKeyManagement:*(void *)(*(void *)(a1 + 32) + 8)];

    id v19 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));
    [v19 registerAVURLAssetForAutomaticResourceManagement:*(void *)(*(void *)(a1 + 32) + 8)];
  }

  id v27 = *(void **)(*(void *)(a1 + 32) + 8);
  if (v27) {
    objc_setAssociatedObject(v27, (const void *)FCAVURLAssetInterestTokenKey, v7, (void *)0x301);
  }

LABEL_17:
  id v28 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v29 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  objc_storeStrong(v29, v28);
}

- (FCContentArchive)contentArchive
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __27__FCAVAsset_contentArchive__block_invoke;
  v5[3] = &unk_1E5B4BF30;
  v5[4] = self;
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1C978], "fc_array:", v5);
  unint64_t v3 = +[FCContentArchive archiveWithChildArchives:v2];

  return (FCContentArchive *)v3;
}

void __27__FCAVAsset_contentArchive__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v4 + 40));
    id v6 = *(void **)(a1 + 32);
  }
  else
  {
    id v6 = 0;
    id WeakRetained = 0;
  }
  v7 = [v6 identifier];
  uint64_t v8 = [WeakRetained contentArchiveForAssetIdentifier:v7];
  objc_msgSend(v3, "fc_safelyAddObject:", v8);

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9)
  {
    id v10 = objc_loadWeakRetained((id *)(v9 + 40));
    __int16 v11 = *(void **)(a1 + 32);
  }
  else
  {
    __int16 v11 = 0;
    id v10 = 0;
  }
  int v12 = objc_msgSend(v11, "identifier", (void)v25);
  id v13 = [v10 contentKeyIdentifiersForAssetIdentifier:v12];

  uint64_t v14 = [v13 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v26;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v26 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v25 + 1) + 8 * v17);
        uint64_t v19 = *(void *)(a1 + 32);
        if (v19) {
          id v20 = objc_loadWeakRetained((id *)(v19 + 48));
        }
        else {
          id v20 = 0;
        }
        id v21 = [MEMORY[0x1E4F1CB10] URLWithString:v18];
        id v22 = [v20 assetKeyForURI:v21];

        uint64_t v23 = [v22 contentArchive];
        objc_msgSend(v3, "fc_safelyAddObject:", v23);

        ++v17;
      }
      while (v15 != v17);
      uint64_t v24 = [v13 countByEnumeratingWithState:&v25 objects:v29 count:16];
      uint64_t v15 = v24;
    }
    while (v24);
  }
}

- (FCContentManifest)contentManifest
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v3 = [FCContentManifest alloc];
  uint64_t v4 = [(FCAVAsset *)self identifier];
  v11[0] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_assetCache);
  }
  else {
    id WeakRetained = 0;
  }
  v7 = [(FCAVAsset *)self identifier];
  uint64_t v8 = [WeakRetained contentKeyIdentifiersForAssetIdentifier:v7];
  uint64_t v9 = [(FCContentManifest *)v3 initWithAVAssetIDs:v5 avAssetKeyIDs:v8];

  return v9;
}

- (uint64_t)isHLS
{
  uint64_t v1 = a1;
  if (a1)
  {
    id v2 = *(id *)(a1 + 72);
    id v3 = [v2 pathExtension];
    if ([v3 isEqualToString:@"m3u"])
    {
      uint64_t v1 = 1;
    }
    else
    {
      uint64_t v4 = [*(id *)(v1 + 72) pathExtension];
      uint64_t v1 = [v4 isEqualToString:@"m3u8"];
    }
  }
  return v1;
}

- (void)_resetUnderlyingAsset
{
  if (self) {
    assetLock = self->_assetLock;
  }
  else {
    assetLock = 0;
  }
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __34__FCAVAsset__resetUnderlyingAsset__block_invoke;
  v3[3] = &unk_1E5B4C018;
  v3[4] = self;
  [(NFUnfairLock *)assetLock performWithLockSync:v3];
}

void __34__FCAVAsset__resetUnderlyingAsset__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 8);
  *(void *)(v1 + 8) = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteURL, 0);
  objc_destroyWeak((id *)&self->_assetKeyManager);
  objc_destroyWeak((id *)&self->_assetResourceLoader);
  objc_destroyWeak((id *)&self->_assetKeyCache);
  objc_destroyWeak((id *)&self->_assetCache);
  objc_storeStrong((id *)&self->_assetLock, 0);
  objc_storeStrong((id *)&self->_assetOptions, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

@end
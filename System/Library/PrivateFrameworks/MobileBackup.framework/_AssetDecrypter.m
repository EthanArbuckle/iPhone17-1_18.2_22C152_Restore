@interface _AssetDecrypter
- (BOOL)decrypt:(id)a3 error:(id *)a4;
- (id)_initWith:(id)a3 asset:(id)a4;
- (id)_keybag:(id *)a3;
- (id)_keybagUUIDData;
- (id)_keybagUUIDString;
- (id)_localFileInfo:(id)a3;
@end

@implementation _AssetDecrypter

- (id)_initWith:(id)a3 asset:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7) {
    __assert_rtn("-[_AssetDecrypter _initWith:asset:]", "MBAssetRecordFetcher.m", 234, "fetcher");
  }
  v9 = v8;
  if (!v8) {
    __assert_rtn("-[_AssetDecrypter _initWith:asset:]", "MBAssetRecordFetcher.m", 235, "asset");
  }
  v13.receiver = self;
  v13.super_class = (Class)_AssetDecrypter;
  v10 = [(_AssetDecrypter *)&v13 init];
  p_isa = (id *)&v10->super.isa;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_fetcher, a3);
    objc_storeStrong(p_isa + 2, a4);
  }

  return p_isa;
}

- (BOOL)decrypt:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!v6) {
    __assert_rtn("-[_AssetDecrypter decrypt:error:]", "MBAssetRecordFetcher.m", 248, "encryptedFilePath");
  }
  if (!a4) {
    __assert_rtn("-[_AssetDecrypter decrypt:error:]", "MBAssetRecordFetcher.m", 249, "error");
  }
  id v7 = v6;
  id v8 = [(_AssetDecrypter *)self _keybag:a4];
  if (v8)
  {
    v9 = [(MBAssetRecordFetcher *)self->_fetcher tracker];
    v10 = [v9 account];

    if (!v10) {
      __assert_rtn("-[_AssetDecrypter decrypt:error:]", "MBAssetRecordFetcher.m", 259, "account");
    }
    v11 = [v10 persona];
    id v12 = [v11 accountType];

    objc_super v13 = MBGetDefaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v14 = [v8 keybagUUIDString];
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v7;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "=asset-fetch= Decrypting file in place at %@ with keybag %@", buf, 0x16u);

      v26 = [v8 keybagUUIDString];
      _MBLog();
    }
    uint64_t v32 = 0;
    v33 = &v32;
    uint64_t v34 = 0x2020000000;
    char v35 = 0;
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v45 = sub_100064768;
    v46 = sub_100064778;
    id v47 = 0;
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_1000657B4;
    v27[3] = &unk_1004112A0;
    v30 = &v32;
    id v15 = v7;
    id v28 = v15;
    v29 = self;
    v31 = buf;
    unsigned __int8 v16 = +[MBCKKeyBag unlockKeybag:v8 accountType:v12 error:a4 block:v27];
    BOOL v17 = *((unsigned char *)v33 + 24) != 0;
    if (!*((unsigned char *)v33 + 24))
    {
      if (v16)
      {
        if (!*(void *)(*(void *)&buf[8] + 40)) {
          __assert_rtn("-[_AssetDecrypter decrypt:error:]", "MBAssetRecordFetcher.m", 278, "decryptError");
        }
        v18 = [(_AssetDecrypter *)self _localFileInfo:v15];
        v19 = MBGetDefaultLog();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          asset = self->_asset;
          uint64_t v21 = *(void *)(*(void *)&buf[8] + 40);
          *(_DWORD *)v36 = 138413058;
          id v37 = v15;
          __int16 v38 = 2112;
          v39 = asset;
          __int16 v40 = 2112;
          v41 = v18;
          __int16 v42 = 2112;
          uint64_t v43 = v21;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "=asset-fetch= Failed to decrypt file at %@, asset:%@, on-disk:%@: %@", v36, 0x2Au);
          _MBLog();
        }

        *a4 = *(id *)(*(void *)&buf[8] + 40);
      }
      else
      {
        v18 = MBGetDefaultLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          v24 = (_TtC7backupd14MBFetchedAsset *)*a4;
          *(_DWORD *)v36 = 138412546;
          id v37 = v15;
          __int16 v38 = 2112;
          v39 = v24;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "=asset-fetch= Failed to unlock keybag to decrypt file at %@: %@", v36, 0x16u);
          _MBLog();
        }
      }
    }
    _Block_object_dispose(buf, 8);

    _Block_object_dispose(&v32, 8);
  }
  else
  {
    v22 = MBGetDefaultLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      id v23 = *a4;
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v7;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v23;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "=asset-fetch= Failed to find a keybag to decrypt file at %@: %@", buf, 0x16u);
      _MBLog();
    }

    +[MBError errorWithCode:205 path:v7 format:@"No keybag found for protected file"];
    BOOL v17 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

- (id)_keybagUUIDData
{
  v3 = [(MBFetchedAsset *)self->_asset metadata];
  v4 = [v3 encryptionKey];
  int v5 = MKBBackupCopyBackupKeyUUID();

  if (v5)
  {
    id v6 = MBGetDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      asset = self->_asset;
      *(_DWORD *)buf = 138412290;
      v10 = asset;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_FAULT, "=asset-fetch= Failed to get UUID from encryption key for file %@", buf, 0xCu);
      _MBLog();
    }
  }
  return 0;
}

- (id)_keybagUUIDString
{
  v2 = [(_AssetDecrypter *)self _keybagUUIDData];
  v3 = [v2 base64EncodedStringWithOptions:0];

  return v3;
}

- (id)_keybag:(id *)a3
{
  if (!a3) {
    __assert_rtn("-[_AssetDecrypter _keybag:]", "MBAssetRecordFetcher.m", 308, "error");
  }
  int v5 = [(MBAssetRecordFetcher *)self->_fetcher device];
  if (!v5) {
    __assert_rtn("-[_AssetDecrypter _keybag:]", "MBAssetRecordFetcher.m", 311, "device");
  }
  id v6 = v5;
  uint64_t v7 = [v5 keybagManager];
  if (!v7) {
    __assert_rtn("-[_AssetDecrypter _keybag:]", "MBAssetRecordFetcher.m", 314, "keybagManager");
  }
  id v8 = (void *)v7;
  v9 = [(_AssetDecrypter *)self _keybagUUIDString];
  if (v9)
  {
    v10 = [v8 keybagWithUUID:v9];
    v11 = v10;
    if (v10)
    {
      id v12 = v10;
    }
    else
    {
      uint64_t v13 = [(MBAssetRecordFetcher *)self->_fetcher tracker];
      if (!v13) {
        __assert_rtn("-[_AssetDecrypter _keybag:]", "MBAssetRecordFetcher.m", 329, "tracker");
      }
      v14 = (void *)v13;
      id v15 = [(_AssetDecrypter *)self _keybagUUIDData];
      id v27 = 0;
      id v12 = +[MBCKKeyBag keybagWithDevice:v6 keybagUUID:v15 operationTracker:v14 error:&v27];
      id v16 = v27;

      if (v12)
      {
        [v8 addKeybag:v12];
        id v26 = v16;
        unsigned __int8 v17 = [v6 saveWithOperationTracker:v14 error:&v26];
        id v18 = v26;

        if ((v17 & 1) == 0)
        {
          v19 = MBGetDefaultLog();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            v20 = [v12 keybagUUIDString];
            *(_DWORD *)buf = 138543618;
            v29 = v20;
            __int16 v30 = 2112;
            id v31 = v18;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "=asset-fetch= Failed to save device record with recovered keybag %{public}@: %@", buf, 0x16u);

            v25 = [v12 keybagUUIDString];
            _MBLog();
          }
        }
        id v21 = v12;
      }
      else
      {
        v22 = MBGetDefaultLog();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v29 = v9;
          __int16 v30 = 2112;
          id v31 = v16;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "=asset-fetch= No keybag found for %{public}@: %@", buf, 0x16u);
          _MBLog();
        }

        if (v16)
        {
          id v23 = v16;
        }
        else
        {
          id v23 = +[MBError errorWithCode:205, @"No keybag found with UUID %@ for asset %@", v9, self->_asset format];
        }
        *a3 = v23;
        id v18 = v16;
      }
    }
  }
  else
  {
    +[MBError errorWithCode:205, @"No keybag for asset %@", self->_asset format];
    id v12 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (id)_localFileInfo:(id)a3
{
  id v3 = a3;
  uint64_t v11 = 0;
  memset(v10, 0, sizeof(v10));
  id v9 = 0;
  int v4 = MBNodeForPath(v3, (uint64_t)v10, &v9);
  id v5 = v9;
  if (v4)
  {
    MBNodeAsString((unsigned int *)v10);
    id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v7 = MBGetDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v13 = v3;
      __int16 v14 = 2112;
      id v15 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "=asset-fetch= Failed to get file info for %@: %@", buf, 0x16u);
      _MBLog();
    }

    id v6 = @"Unknown file info";
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_fetcher, 0);
}

@end
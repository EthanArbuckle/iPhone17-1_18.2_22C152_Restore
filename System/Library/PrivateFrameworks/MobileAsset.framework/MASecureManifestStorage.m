@interface MASecureManifestStorage
- (BOOL)_storeManifest:(id)a3 infoPlist:(id)a4 stage:(BOOL)a5 error:(id *)a6;
- (BOOL)commitStagedManifestsForSelectors:(id)a3 error:(id *)a4;
- (BOOL)invalidateManifestForAssetType:(id)a3 specifier:(id)a4 error:(id *)a5;
- (BOOL)stageManifest:(id)a3 infoPlist:(id)a4 error:(id *)a5;
- (BOOL)storeManifest:(id)a3 infoPlist:(id)a4 error:(id *)a5;
- (id)_errorWithCode:(unint64_t)a3 underlyingError:(id)a4;
- (id)_manifestPathForAssetType:(id)a3 specifier:(id)a4 stage:(BOOL)a5;
- (id)_serviceConnectionWithError:(id *)a3;
- (id)manifestPathForAssetType:(id)a3 specifier:(id)a4;
- (id)stagedManifestPathForAssetType:(id)a3 specifier:(id)a4;
@end

@implementation MASecureManifestStorage

- (BOOL)storeManifest:(id)a3 infoPlist:(id)a4 error:(id *)a5
{
  return [(MASecureManifestStorage *)self _storeManifest:a3 infoPlist:a4 stage:0 error:a5];
}

- (BOOL)stageManifest:(id)a3 infoPlist:(id)a4 error:(id *)a5
{
  return [(MASecureManifestStorage *)self _storeManifest:a3 infoPlist:a4 stage:1 error:a5];
}

- (BOOL)_storeManifest:(id)a3 infoPlist:(id)a4 stage:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  v12 = [(MASecureManifestStorage *)self _serviceConnectionWithError:a6];
  v13 = v12;
  if (v12)
  {
    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__4;
    v23 = __Block_byref_object_dispose__4;
    id v24 = 0;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __64__MASecureManifestStorage__storeManifest_infoPlist_stage_error___block_invoke;
    v18[3] = &unk_1E6005360;
    v18[4] = self;
    v18[5] = &v19;
    v14 = [v12 synchronousRemoteObjectProxyWithErrorHandler:v18];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __64__MASecureManifestStorage__storeManifest_infoPlist_stage_error___block_invoke_2;
    v17[3] = &unk_1E6005388;
    v17[4] = &v19;
    [v14 storeManifest:v10 infoPlist:v11 stage:v7 completion:v17];

    if (a6) {
      *a6 = (id) v20[5];
    }
    [v13 invalidate];
    BOOL v15 = v20[5] == 0;
    _Block_object_dispose(&v19, 8);
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

uint64_t __64__MASecureManifestStorage__storeManifest_infoPlist_stage_error___block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) _errorWithCode:1 underlyingError:a2];
  return MEMORY[0x1F41817F8]();
}

void __64__MASecureManifestStorage__storeManifest_infoPlist_stage_error___block_invoke_2(uint64_t a1, void *a2)
{
}

- (BOOL)commitStagedManifestsForSelectors:(id)a3 error:(id *)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v20 = a3;
  v18 = self;
  uint64_t v21 = [(MASecureManifestStorage *)self _serviceConnectionWithError:a4];
  if (v21)
  {
    v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v20, "count"));
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v6 = v20;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v31 != v8) {
            objc_enumerationMutation(v6);
          }
          id v10 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          id v11 = NSString;
          v12 = [v10 assetType];
          v13 = [v10 assetSpecifier];
          v14 = [v11 stringWithFormat:@"%@:%@", v12, v13];

          [v5 addObject:v14];
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v7);
    }

    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__4;
    v28 = __Block_byref_object_dispose__4;
    id v29 = 0;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __67__MASecureManifestStorage_commitStagedManifestsForSelectors_error___block_invoke;
    v23[3] = &unk_1E6005360;
    v23[4] = v18;
    v23[5] = &v24;
    BOOL v15 = [v21 synchronousRemoteObjectProxyWithErrorHandler:v23];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __67__MASecureManifestStorage_commitStagedManifestsForSelectors_error___block_invoke_2;
    v22[3] = &unk_1E6005388;
    v22[4] = &v24;
    [v15 commitStagedManifestsForSelectors:v5 completion:v22];

    if (a4) {
      *a4 = (id) v25[5];
    }
    [v21 invalidate];
    BOOL v16 = v25[5] == 0;
    _Block_object_dispose(&v24, 8);
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

uint64_t __67__MASecureManifestStorage_commitStagedManifestsForSelectors_error___block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) _errorWithCode:1 underlyingError:a2];
  return MEMORY[0x1F41817F8]();
}

void __67__MASecureManifestStorage_commitStagedManifestsForSelectors_error___block_invoke_2(uint64_t a1, void *a2)
{
}

- (BOOL)invalidateManifestForAssetType:(id)a3 specifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(MASecureManifestStorage *)self _serviceConnectionWithError:a5];
  id v11 = v10;
  if (v10)
  {
    uint64_t v17 = 0;
    v18 = &v17;
    uint64_t v19 = 0x3032000000;
    id v20 = __Block_byref_object_copy__4;
    uint64_t v21 = __Block_byref_object_dispose__4;
    id v22 = 0;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __74__MASecureManifestStorage_invalidateManifestForAssetType_specifier_error___block_invoke;
    v16[3] = &unk_1E6005360;
    v16[4] = self;
    v16[5] = &v17;
    v12 = [v10 synchronousRemoteObjectProxyWithErrorHandler:v16];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __74__MASecureManifestStorage_invalidateManifestForAssetType_specifier_error___block_invoke_2;
    v15[3] = &unk_1E6005388;
    v15[4] = &v17;
    [v12 invalidateManifestForAssetType:v8 specifier:v9 completion:v15];

    if (a5) {
      *a5 = (id) v18[5];
    }
    [v11 invalidate];
    BOOL v13 = v18[5] == 0;
    _Block_object_dispose(&v17, 8);
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

uint64_t __74__MASecureManifestStorage_invalidateManifestForAssetType_specifier_error___block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) _errorWithCode:1 underlyingError:a2];
  return MEMORY[0x1F41817F8]();
}

void __74__MASecureManifestStorage_invalidateManifestForAssetType_specifier_error___block_invoke_2(uint64_t a1, void *a2)
{
}

- (id)manifestPathForAssetType:(id)a3 specifier:(id)a4
{
  return [(MASecureManifestStorage *)self _manifestPathForAssetType:a3 specifier:a4 stage:0];
}

- (id)stagedManifestPathForAssetType:(id)a3 specifier:(id)a4
{
  return [(MASecureManifestStorage *)self _manifestPathForAssetType:a3 specifier:a4 stage:1];
}

- (id)_manifestPathForAssetType:(id)a3 specifier:(id)a4 stage:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  id v9 = getRepositoryPath(@"/private/var/MobileAsset/AssetsV2");
  id v10 = [v9 stringByAppendingPathComponent:@"manifests"];

  if (v5)
  {
    uint64_t v18 = [v10 stringByAppendingPathComponent:@"staged"];

    id v10 = (void *)v18;
  }
  uint64_t v19 = normalizedAssetType((uint64_t)v7, v11, v12, v13, v14, v15, v16, v17);
  id v20 = [v10 stringByAppendingPathComponent:v19];

  v28 = normalizedAssetType((uint64_t)v8, v21, v22, v23, v24, v25, v26, v27);

  id v29 = [v20 stringByAppendingPathComponent:v28];

  long long v30 = [v29 stringByAppendingPathComponent:@"SecureMobileAssetCryptex1Ticket.img4"];

  return v30;
}

- (id)_serviceConnectionWithError:(id *)a3
{
  BOOL v5 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithServiceName:@"com.apple.MobileAsset.ManifestStorageService"];
  id v6 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0A9F748];
  [v5 setRemoteObjectInterface:v6];
  [v5 resume];
  if (v5)
  {
    id v11 = v5;
  }
  else
  {
    _MobileAssetLog(0, 3, (uint64_t)"-[MASecureManifestStorage _serviceConnectionWithError:]", @"Failed to connect to service", v7, v8, v9, v10, v13);
    if (a3)
    {
      *a3 = [(MASecureManifestStorage *)self _errorWithCode:1 underlyingError:0];
    }
  }

  return v5;
}

- (id)_errorWithCode:(unint64_t)a3 underlyingError:(id)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = v5;
  if (v5)
  {
    uint64_t v10 = *MEMORY[0x1E4F28A50];
    v11[0] = v5;
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  }
  else
  {
    uint64_t v7 = 0;
  }
  uint64_t v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ManifestStorageServiceErrorDomain" code:a3 userInfo:v7];

  return v8;
}

@end
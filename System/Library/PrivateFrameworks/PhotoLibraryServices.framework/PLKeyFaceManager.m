@interface PLKeyFaceManager
+ (id)sharedInstance;
- (void)markPersonAsNeedingKeyFace:(id)a3 photoLibrary:(id)a4;
@end

@implementation PLKeyFaceManager

- (void)markPersonAsNeedingKeyFace:(id)a3 photoLibrary:(id)a4
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (PLIsAssetsd())
  {
    v9 = [v8 photoAnalysisClient];
    if (v9)
    {
      if (v7)
      {
        Class v10 = NSClassFromString(&cfstr_Phperson.isa);
        if (!v10)
        {
          v17 = [MEMORY[0x1E4F28B00] currentHandler];
          [v17 handleFailureInMethod:a2 object:self file:@"PLKeyFaceManager.m" lineNumber:39 description:@"markPersonAsNeedingKeyFace: cannot load PHPerson class."];
        }
        v11 = [(objc_class *)v10 localIdentifierWithUUID:v7];
        v24[0] = v11;
        v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __60__PLKeyFaceManager_markPersonAsNeedingKeyFace_photoLibrary___block_invoke;
        v18[3] = &unk_1E5871450;
        id v13 = v7;
        id v19 = v13;
        uint64_t v14 = [v9 updateKeyFacesOfPersonsWithLocalIdentifiers:v12 forceUpdate:1 completion:v18];

        v15 = PLBackendGetLog();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v21 = v13;
          __int16 v22 = 2048;
          uint64_t v23 = v14;
          _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_DEFAULT, "Started operation to update key face for person: %@, operationId: %zd", buf, 0x16u);
        }

        goto LABEL_16;
      }
      v11 = PLBackendGetLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v16 = "markPersonAsNeedingKeyFace: personUUID cannot be nil.";
        goto LABEL_15;
      }
    }
    else
    {
      v11 = PLBackendGetLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v16 = "markPersonAsNeedingKeyFace: no photoanalysisserviceclient.";
LABEL_15:
        _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_ERROR, v16, buf, 2u);
      }
    }
LABEL_16:

    goto LABEL_17;
  }
  v9 = PLBackendGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v7;
    _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_FAULT, "Non-assetsd process cannot update key face for person %@, key face may not be set", buf, 0xCu);
  }
LABEL_17:
}

void __60__PLKeyFaceManager_markPersonAsNeedingKeyFace_photoLibrary___block_invoke(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = PLBackendGetLog();
  v9 = v8;
  if (a2)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      int v16 = 138412546;
      uint64_t v17 = v10;
      __int16 v18 = 2048;
      uint64_t v19 = a3;
      v11 = "Successfully updated key face for person: %@, operationId: %zd";
      v12 = v9;
      os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
      uint32_t v14 = 22;
LABEL_6:
      _os_log_impl(&dword_19B3C7000, v12, v13, v11, (uint8_t *)&v16, v14);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    uint64_t v15 = *(void *)(a1 + 32);
    int v16 = 138412802;
    uint64_t v17 = v15;
    __int16 v18 = 2048;
    uint64_t v19 = a3;
    __int16 v20 = 2112;
    id v21 = v7;
    v11 = "Failed to update key face for person: %@, operationId: %zd, error: %@";
    v12 = v9;
    os_log_type_t v13 = OS_LOG_TYPE_ERROR;
    uint32_t v14 = 32;
    goto LABEL_6;
  }
}

+ (id)sharedInstance
{
  pl_dispatch_once();
  v2 = (void *)sharedInstance_pl_once_object_15;
  return v2;
}

void __34__PLKeyFaceManager_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(PLKeyFaceManager);
  v1 = (void *)sharedInstance_pl_once_object_15;
  sharedInstance_pl_once_object_15 = (uint64_t)v0;
}

@end
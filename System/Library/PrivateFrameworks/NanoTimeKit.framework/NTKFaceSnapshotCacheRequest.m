@interface NTKFaceSnapshotCacheRequest
- (NSDate)creationDate;
- (NSString)faceSnapshotKey;
- (NTKFace)face;
- (NTKFaceSnapshotCacheRequest)initWithFace:(id)a3 options:(id)a4 completion:(id)a5;
- (NTKFaceSnapshotCacheRequestOptions)options;
- (id)completion;
- (void)setCompletion:(id)a3;
@end

@implementation NTKFaceSnapshotCacheRequest

- (NTKFaceSnapshotCacheRequest)initWithFace:(id)a3 options:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v37.receiver = self;
  v37.super_class = (Class)NTKFaceSnapshotCacheRequest;
  v12 = [(NTKFaceSnapshotCacheRequest *)&v37 init];
  if (v12)
  {
    uint64_t v13 = [MEMORY[0x1E4F1C9C8] date];
    creationDate = v12->_creationDate;
    v12->_creationDate = (NSDate *)v13;

    objc_storeStrong((id *)&v12->_face, a3);
    v15 = [v9 dailySnapshotKey];
    uint64_t v16 = [v15 copy];
    faceSnapshotKey = v12->_faceSnapshotKey;
    v12->_faceSnapshotKey = (NSString *)v16;

    objc_storeStrong((id *)&v12->_options, a4);
    v35[0] = 0;
    v35[1] = v35;
    v35[2] = 0x2020000000;
    char v36 = 0;
    objc_initWeak(&location, v12);
    v18 = [v9 unsafeDailySnapshotKey];
    v19 = (void *)[v18 copy];

    uint64_t v25 = MEMORY[0x1E4F143A8];
    uint64_t v26 = 3221225472;
    v27 = __63__NTKFaceSnapshotCacheRequest_initWithFace_options_completion___block_invoke;
    v28 = &unk_1E62C69B8;
    objc_copyWeak(&v33, &location);
    v32 = v35;
    id v29 = v9;
    id v20 = v19;
    id v30 = v20;
    id v31 = v11;
    v21 = _Block_copy(&v25);
    uint64_t v22 = objc_msgSend(v21, "copy", v25, v26, v27, v28);
    id completion = v12->_completion;
    v12->_id completion = (id)v22;

    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
    _Block_object_dispose(v35, 8);
  }

  return v12;
}

void __63__NTKFaceSnapshotCacheRequest_initWithFace_options_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    v8 = WeakRetained;
    objc_sync_enter(v8);
    uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
    if (*(unsigned char *)(v9 + 24))
    {
      id v10 = _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        __63__NTKFaceSnapshotCacheRequest_initWithFace_options_completion___block_invoke_cold_1((uint64_t)v8, v10);
      }

      objc_sync_exit(v8);
LABEL_18:

      goto LABEL_19;
    }
    *(unsigned char *)(v9 + 24) = 1;
    objc_sync_exit(v8);

    id v11 = [*(id *)(a1 + 32) dailySnapshotKey];
    v12 = [*(id *)(a1 + 32) unsafeDailySnapshotKey];
    if (a2)
    {
      uint64_t v13 = _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = v8[5];
        int v19 = 138412546;
        id v20 = v8;
        __int16 v21 = 2112;
        uint64_t v22 = v14;
        _os_log_impl(&dword_1BC5A9000, v13, OS_LOG_TYPE_DEFAULT, "Snapshot request cancelled for %@ (%@)", (uint8_t *)&v19, 0x16u);
      }
    }
    else
    {
      if ([v11 isEqualToString:v8[5]])
      {
        id v15 = v5;
LABEL_15:
        uint64_t v16 = *(void *)(a1 + 48);
        if (v16) {
          (*(void (**)(uint64_t, uint64_t, id))(v16 + 16))(v16, a2, v15);
        }

        v8 = v11;
        goto LABEL_18;
      }
      uint64_t v13 = _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v17 = (void *)v8[5];
        uint64_t v18 = *(void *)(a1 + 40);
        int v19 = 138413058;
        id v20 = v17;
        __int16 v21 = 2112;
        uint64_t v22 = v18;
        __int16 v23 = 2112;
        v24 = v11;
        __int16 v25 = 2112;
        uint64_t v26 = v12;
        _os_log_error_impl(&dword_1BC5A9000, v13, OS_LOG_TYPE_ERROR, "Invalid snapshot: key changed from %@ / %@ to %@ / %@", (uint8_t *)&v19, 0x2Au);
      }
    }

    id v15 = 0;
    goto LABEL_15;
  }
LABEL_19:
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NTKFace)face
{
  return self->_face;
}

- (NTKFaceSnapshotCacheRequestOptions)options
{
  return self->_options;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (NSString)faceSnapshotKey
{
  return self->_faceSnapshotKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceSnapshotKey, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_face, 0);

  objc_storeStrong((id *)&self->_creationDate, 0);
}

void __63__NTKFaceSnapshotCacheRequest_initWithFace_options_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 40);
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = v2;
  _os_log_error_impl(&dword_1BC5A9000, a2, OS_LOG_TYPE_ERROR, "Snapshot handler called again for %@ (%@)", (uint8_t *)&v3, 0x16u);
}

@end
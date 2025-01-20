@interface NTKFaceSnapshotRequest
- (BOOL)isReady;
- (NSDate)creationDate;
- (NSDictionary)options;
- (NTKFace)face;
- (NTKFaceSnapshotRequest)initWithFace:(id)a3 options:(id)a4 completion:(id)a5;
- (id)completion;
- (void)setCompletion:(id)a3;
@end

@implementation NTKFaceSnapshotRequest

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_face, 0);

  objc_storeStrong((id *)&self->_creationDate, 0);
}

- (NTKFaceSnapshotRequest)initWithFace:(id)a3 options:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)NTKFaceSnapshotRequest;
  v12 = [(NTKFaceSnapshotRequest *)&v20 init];
  if (v12)
  {
    uint64_t v13 = [MEMORY[0x1E4F1C9C8] date];
    creationDate = v12->_creationDate;
    v12->_creationDate = (NSDate *)v13;

    objc_storeStrong((id *)&v12->_face, a3);
    uint64_t v15 = [v10 copy];
    options = v12->_options;
    v12->_options = (NSDictionary *)v15;

    uint64_t v17 = [v11 copy];
    id completion = v12->_completion;
    v12->_id completion = (id)v17;
  }
  return v12;
}

- (BOOL)isReady
{
  v2 = [(NTKFaceSnapshotRequest *)self face];
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  v12 = __33__NTKFaceSnapshotRequest_isReady__block_invoke;
  uint64_t v13 = &unk_1E62C1F28;
  id v3 = v2;
  id v14 = v3;
  uint64_t v15 = &v16;
  [v3 enumerateComplicationSlotsWithBlock:&v10];
  if (*((unsigned char *)v17 + 24))
  {
    v4 = objc_msgSend(v3, "device", v10, v11, v12, v13);
    v5 = [v4 nrDeviceUUID];
    if (v5)
    {
      v6 = [(id)NTKFaceSnapshotterComplicationCollections objectForKey:v5];
      char v7 = [v6 hasLoaded];
    }
    else
    {
      char v7 = 1;
    }
    char v8 = v7 & NTKFaceSnapshotterCompanionAppLibraryLoaded;
  }
  else
  {
    char v8 = 1;
  }

  _Block_object_dispose(&v16, 8);
  return v8;
}

void __33__NTKFaceSnapshotRequest_isReady__block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  id v5 = [*(id *)(a1 + 32) complicationForSlot:a2];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v5 complicationType] == 31;
  *a3 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NTKFace)face
{
  return self->_face;
}

- (NSDictionary)options
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

@end
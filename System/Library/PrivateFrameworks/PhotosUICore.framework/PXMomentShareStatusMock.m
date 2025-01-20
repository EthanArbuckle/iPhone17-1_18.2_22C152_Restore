@interface PXMomentShareStatusMock
+ (BOOL)shouldUseMockStatus;
- (PXMomentShareStatusMock)initWithMomentShare:(id)a3;
- (id)_actionManager;
- (id)_createStatusProvider;
- (id)owner;
- (void)_updateStatus;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation PXMomentShareStatusMock

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mockMomentShare, 0);
  objc_storeStrong((id *)&self->_originalMomentShare, 0);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a6 == &_MockMomentShareStatusUserDefaultsContext)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __74__PXMomentShareStatusMock_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_1E5DD36F8;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)PXMomentShareStatusMock;
    -[PXMomentShareStatusMock observeValueForKeyPath:ofObject:change:context:](&v6, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

uint64_t __74__PXMomentShareStatusMock_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateStatus];
}

- (id)_actionManager
{
  v4 = self->_originalMomentShare;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    v11 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v11);
    v12 = [(PXDisplayMomentShare *)v4 px_descriptionForAssertionMessage];
    [v8 handleFailureInMethod:a2, self, @"PXMomentShareStatusMock.m", 246, @"%@ should be an instance inheriting from %@, but it is %@", @"_originalMomentShare", v10, v12 object file lineNumber description];
  }
  else
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    [v8 handleFailureInMethod:a2, self, @"PXMomentShareStatusMock.m", 246, @"%@ should be an instance inheriting from %@, but it is nil", @"_originalMomentShare", v10 object file lineNumber description];
  }

LABEL_3:
  v5 = [(PXDisplayMomentShare *)v4 photoLibrary];
  objc_super v6 = [[PXPhotoKitCPLActionManager alloc] initWithPhotoLibrary:v5];

  return v6;
}

- (id)owner
{
  v2 = objc_alloc_init(_PXMomentShareMockParticipant);
  [(_PXMomentShareMockParticipant *)v2 setLocalizedName:@"Jane"];
  [(_PXMomentShareMockParticipant *)v2 setFirstName:@"Jane"];
  [(_PXMomentShareMockParticipant *)v2 setLastName:@"Doe"];
  return v2;
}

- (void)_updateStatus
{
  v4 = PXSharedUserDefaults();
  v5 = [v4 objectForKey:@"MomentShareStatusMock"];

  if (v5)
  {
    objc_super v6 = [v5 componentsSeparatedByString:@"/"];
    if ((unint64_t)[v6 count] < 2)
    {
      v26 = [MEMORY[0x1E4F28B00] currentHandler];
      v27 = v26;
      SEL v28 = a2;
      v29 = self;
      uint64_t v30 = 216;
    }
    else
    {
      v7 = [v6 objectAtIndexedSubscript:0];
      v8 = [v6 objectAtIndexedSubscript:1];
      v32 = self;
      if ([v7 isEqualToString:@"sender"])
      {
        long long v33 = 0u;
        if (objc_msgSend(v8, "isEqualToString:", @"uploading", v7))
        {
          uint64_t v9 = 0;
          uint64_t v10 = 0;
          uint64_t v11 = 0;
          uint64_t v12 = 0;
          __int16 v13 = 1;
          uint64_t v14 = 26;
          uint64_t v15 = 49;
LABEL_48:

          v34[0] = MEMORY[0x1E4F143A8];
          v34[1] = 3221225472;
          v34[2] = __40__PXMomentShareStatusMock__updateStatus__block_invoke_2;
          v34[3] = &__block_descriptor_114_e38_v16__0___PXMutableMomentShareStatus__8l;
          __int16 v43 = v13;
          long long v35 = xmmword_1AB359F10;
          uint64_t v36 = v15;
          uint64_t v37 = v14;
          uint64_t v38 = v9;
          uint64_t v39 = v10;
          uint64_t v40 = v11;
          long long v41 = v33;
          uint64_t v42 = v12;
          [(PXMomentShareStatus *)v32 performChanges:v34];

          goto LABEL_49;
        }
        if ([v8 isEqualToString:@"downloading"])
        {
          uint64_t v9 = 0;
          uint64_t v10 = 0;
          uint64_t v11 = 0;
          long long v33 = xmmword_1AB359F00;
          __int16 v13 = 1;
LABEL_29:
          uint64_t v12 = 26;
          uint64_t v14 = 40;
          uint64_t v15 = 60;
          goto LABEL_48;
        }
        if (([v8 isEqualToString:@"idle"] & 1) == 0)
        {
          v24 = [MEMORY[0x1E4F28B00] currentHandler];
          [v24 handleFailureInMethod:a2 object:self file:@"PXMomentShareStatusMock.m" lineNumber:161 description:@"MockMomentShareStatus only supports uploading/downloading/idle for sender"];

          uint64_t v15 = 0;
          uint64_t v14 = 0;
          uint64_t v9 = 0;
          uint64_t v10 = 0;
          uint64_t v11 = 0;
          uint64_t v12 = 0;
          __int16 v13 = 1;
          goto LABEL_48;
        }
        uint64_t v9 = 0;
        uint64_t v10 = 0;
        uint64_t v11 = 0;
        long long v33 = xmmword_1AB359EE0;
        __int16 v13 = 1;
        goto LABEL_44;
      }
      if (objc_msgSend(v7, "isEqualToString:", @"receiver", v7))
      {
        if ([v8 isEqualToString:@"downloading"])
        {
          long long v33 = xmmword_1AB359F00;
          if ((unint64_t)[v6 count] < 3)
          {
            uint64_t v9 = 0;
            uint64_t v10 = 0;
            uint64_t v11 = 0;
            __int16 v13 = 3;
            goto LABEL_29;
          }
          v16 = [v6 objectAtIndexedSubscript:2];
          int v17 = [v16 isEqualToString:@"waitingforupload"];

          uint64_t v9 = 0;
          uint64_t v10 = 0;
          uint64_t v11 = 0;
          if (v17) {
            uint64_t v15 = 49;
          }
          else {
            uint64_t v15 = 60;
          }
          uint64_t v12 = 26;
          if (v17) {
            uint64_t v14 = 26;
          }
          else {
            uint64_t v14 = 40;
          }
LABEL_47:
          __int16 v13 = 3;
          goto LABEL_48;
        }
        if ([v8 isEqualToString:@"saving"])
        {
          long long v33 = xmmword_1AB359EE0;
          if ((unint64_t)[v6 count] >= 3)
          {
            v18 = [v6 objectAtIndexedSubscript:2];
            int v19 = [v18 isEqualToString:@"savingall"];

            uint64_t v11 = 0;
            uint64_t v15 = 60;
            if (v19) {
              uint64_t v9 = 60;
            }
            else {
              uint64_t v9 = 49;
            }
            uint64_t v14 = 40;
            if (v19) {
              uint64_t v10 = 40;
            }
            else {
              uint64_t v10 = 26;
            }
LABEL_38:
            __int16 v13 = 3;
LABEL_45:
            uint64_t v12 = 40;
            goto LABEL_48;
          }
          uint64_t v11 = 0;
          __int16 v13 = 3;
          uint64_t v10 = 26;
          uint64_t v9 = 49;
        }
        else if ([v8 isEqualToString:@"saved"])
        {
          if ((unint64_t)[v6 count] >= 3)
          {
            v20 = [v6 objectAtIndexedSubscript:2];
            int v21 = [v20 isEqualToString:@"savedall"];

            uint64_t v9 = 0;
            uint64_t v10 = 0;
            uint64_t v15 = 60;
            if (v21) {
              uint64_t v11 = 60;
            }
            else {
              uint64_t v11 = 49;
            }
            uint64_t v22 = 26;
            uint64_t v14 = 40;
            if (v21) {
              uint64_t v22 = 40;
            }
            int64x2_t v23 = vdupq_n_s64(0x3CuLL);
            v23.i64[0] = v22;
            long long v33 = (__int128)v23;
            goto LABEL_38;
          }
          uint64_t v9 = 0;
          uint64_t v10 = 0;
          long long v33 = xmmword_1AB359EF0;
          __int16 v13 = 3;
          uint64_t v11 = 49;
        }
        else
        {
          if (([v8 isEqualToString:@"idle"] & 1) == 0)
          {
            v25 = [MEMORY[0x1E4F28B00] currentHandler];
            [v25 handleFailureInMethod:a2 object:self file:@"PXMomentShareStatusMock.m" lineNumber:209 description:@"MockMomentShareStatus only supports downloading/saving/saved/idle for receiver"];

            uint64_t v15 = 0;
            uint64_t v14 = 0;
            uint64_t v9 = 0;
            uint64_t v10 = 0;
            uint64_t v11 = 0;
            uint64_t v12 = 0;
            long long v33 = 0u;
            goto LABEL_47;
          }
          uint64_t v9 = 0;
          uint64_t v10 = 0;
          uint64_t v11 = 0;
          long long v33 = xmmword_1AB359EE0;
          __int16 v13 = 3;
        }
LABEL_44:
        uint64_t v14 = 40;
        uint64_t v15 = 60;
        goto LABEL_45;
      }
      v26 = [MEMORY[0x1E4F28B00] currentHandler];
      v27 = v26;
      SEL v28 = a2;
      v29 = self;
      uint64_t v30 = 213;
    }
    [v26 handleFailureInMethod:v28 object:v29 file:@"PXMomentShareStatusMock.m" lineNumber:v30 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __40__PXMomentShareStatusMock__updateStatus__block_invoke;
  v44[3] = &unk_1E5DC2248;
  v44[4] = self;
  [(PXMomentShareStatus *)self performChanges:v44];
LABEL_49:
}

void __40__PXMomentShareStatusMock__updateStatus__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 144);
  id v3 = a2;
  [v3 setMomentShare:v2];
  v4 = objc_alloc_init(_PXMomentShareMockFetchResult);
  [v3 setCopyingAssetsFetchResult:v4];

  v5 = objc_alloc_init(_PXMomentShareMockFetchResult);
  [v3 setCopiedAssetsFetchResult:v5];

  objc_super v6 = objc_alloc_init(_PXMomentShareMockFetchResult);
  [v3 setAllAssetsFetchResult:v6];
}

void __40__PXMomentShareStatusMock__updateStatus__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned __int16 *)(a1 + 112);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  id v8 = a2;
  uint64_t v9 = +[_PXMomentShareMockMomentShare momentShareWithStatus:v3 photosCount:v4 videosCount:v5 uploadedPhotosCount:v6 uploadedVideosCount:v7];
  [v8 setMomentShare:v9];

  uint64_t v10 = +[_PXMomentShareMockFetchResult momentShareMockFetchResultWithPhotosCount:*(void *)(a1 + 64) videosCount:*(void *)(a1 + 72)];
  [v8 setCopyingAssetsFetchResult:v10];

  uint64_t v11 = +[_PXMomentShareMockFetchResult momentShareMockFetchResultWithPhotosCount:*(void *)(a1 + 80) videosCount:*(void *)(a1 + 88)];
  [v8 setCopiedAssetsFetchResult:v11];

  id v12 = +[_PXMomentShareMockFetchResult momentShareMockFetchResultWithPhotosCount:*(void *)(a1 + 96) videosCount:*(void *)(a1 + 104)];
  [v8 setAllAssetsFetchResult:v12];
}

- (id)_createStatusProvider
{
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  uint64_t v3 = [[PXPhotoKitCPLActionManager alloc] initWithPhotoLibrary:v2];
  uint64_t v4 = [[PXCPLUIStatusProvider alloc] initWithPhotoLibrary:v2 actionManager:v3];

  return v4;
}

- (void)dealloc
{
  uint64_t v3 = PXSharedUserDefaults();
  [v3 removeObserver:self forKeyPath:@"MomentShareStatusMock" context:&_MockMomentShareStatusUserDefaultsContext];

  v4.receiver = self;
  v4.super_class = (Class)PXMomentShareStatusMock;
  [(PXMomentShareStatusMock *)&v4 dealloc];
}

- (PXMomentShareStatusMock)initWithMomentShare:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PXMomentShareStatusMock;
  uint64_t v6 = [(PXMomentShareStatus *)&v10 initWithMomentShare:v5];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_originalMomentShare, a3);
    [(PXMomentShareStatusMock *)v7 _updateStatus];
    id v8 = PXSharedUserDefaults();
    [v8 addObserver:v7 forKeyPath:@"MomentShareStatusMock" options:0 context:&_MockMomentShareStatusUserDefaultsContext];
  }
  return v7;
}

+ (BOOL)shouldUseMockStatus
{
  uint64_t v2 = PXSharedUserDefaults();
  uint64_t v3 = [v2 objectForKey:@"MomentShareStatusMock"];
  BOOL v4 = v3 != 0;

  return v4;
}

@end
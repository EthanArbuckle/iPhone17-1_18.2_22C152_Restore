@interface NTKFaceCollectionStateCapture
- (NTKFaceCollectionStateCapture)initWithFaceCollection:(id)a3 identifier:(id)a4;
- (id)_faceCollectionDescription;
- (os_state_data_s)_stateDump;
- (void)dealloc;
- (void)start;
@end

@implementation NTKFaceCollectionStateCapture

- (NTKFaceCollectionStateCapture)initWithFaceCollection:(id)a3 identifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)NTKFaceCollectionStateCapture;
  v9 = [(NTKFaceCollectionStateCapture *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_faceCollection, a3);
    objc_storeStrong((id *)&v10->_identifier, a4);
    objc_initWeak(&location, v10);
    objc_copyWeak(&v12, &location);
    v10->_stateDumpHandler = os_state_add_handler();
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

  return v10;
}

uint64_t __67__NTKFaceCollectionStateCapture_initWithFaceCollection_identifier___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained _stateDump];

  return v2;
}

- (void)start
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = _NTKLoggingObjectForDomain(0, (uint64_t)"NTKLoggingDomainDefault");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    identifier = self->_identifier;
    int v5 = 138412290;
    v6 = identifier;
    _os_log_impl(&dword_1BC5A9000, v3, OS_LOG_TYPE_DEFAULT, "NTKFaceCollectionStateCapture: did start for %@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)dealloc
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3 = _NTKLoggingObjectForDomain(0, (uint64_t)"NTKLoggingDomainDefault");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    identifier = self->_identifier;
    *(_DWORD *)buf = 138412290;
    uint64_t v7 = identifier;
    _os_log_impl(&dword_1BC5A9000, v3, OS_LOG_TYPE_DEFAULT, "NTKFaceCollectionStateCapture: dealloc %@", buf, 0xCu);
  }

  if (self->_stateDumpHandler) {
    os_state_remove_handler();
  }
  v5.receiver = self;
  v5.super_class = (Class)NTKFaceCollectionStateCapture;
  [(NTKFaceCollectionStateCapture *)&v5 dealloc];
}

- (os_state_data_s)_stateDump
{
  v3 = [@"NTKFaceCollection" stringByAppendingFormat:@"-%@", self->_identifier];
  v4 = [(NTKFaceCollectionStateCapture *)self _faceCollectionDescription];
  id v15 = 0;
  objc_super v5 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v4 format:200 options:0 error:&v15];
  id v6 = v15;
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = [NSString stringWithFormat:@"{\n%@}\n", @"error: failed to serialize state dump\n"];
    id v14 = 0;
    uint64_t v9 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v8 format:200 options:0 error:&v14];
    id v10 = v14;

    objc_super v5 = (void *)v9;
  }
  if (v5)
  {
    size_t v11 = [v5 length];
    id v12 = (os_state_data_s *)malloc_type_calloc(1uLL, v11 + 200, 0x4C08C03DuLL);
    v12->var0 = 1;
    v12->var1.var1 = v11;
    [v3 UTF8String];
    __strlcpy_chk();
    memcpy(v12->var4, (const void *)[v5 bytes], v11);
  }
  else
  {
    id v12 = (os_state_data_s *)malloc_type_calloc(1uLL, 0xC8uLL, 0x84CAB192uLL);
  }

  return v12;
}

- (id)_faceCollectionDescription
{
  v3 = objc_opt_new();
  if ([(NTKFaceCollection *)self->_faceCollection hasLoaded])
  {
    v4 = self->_faceCollection;
    unint64_t v5 = [(NTKFaceCollection *)v4 numberOfFaces];
    id v6 = [(NTKFaceCollection *)v4 selectedFace];
    uint64_t v35 = 0;
    v36 = &v35;
    uint64_t v37 = 0x3032000000;
    v38 = __Block_byref_object_copy__22;
    v39 = __Block_byref_object_dispose__22;
    id v40 = 0;
    uint64_t v29 = 0;
    v30 = &v29;
    uint64_t v31 = 0x3032000000;
    v32 = __Block_byref_object_copy__22;
    v33 = __Block_byref_object_dispose__22;
    id v34 = 0;
    if (v5 >= 2)
    {
      uint64_t v7 = [(NTKFaceCollection *)v4 selectedFaceIndex];
      if (v7 == v5 - 1) {
        uint64_t v8 = -1;
      }
      else {
        uint64_t v8 = v7 + 1;
      }
      if (v7) {
        uint64_t v9 = v7 - 1;
      }
      else {
        uint64_t v9 = -1;
      }
      if (v7) {
        uint64_t v10 = v8;
      }
      else {
        uint64_t v10 = 1;
      }
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __59__NTKFaceCollectionStateCapture__faceCollectionDescription__block_invoke;
      v22[3] = &unk_1E62C3E08;
      v23 = v4;
      v24 = &v35;
      v25 = &v29;
      uint64_t v26 = v9;
      uint64_t v27 = v10;
      uint64_t v28 = -1;
      [(NTKFaceCollection *)v23 enumerateFacesUsingBlock:v22];
    }
    size_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"Number of Faces: %u\n", v5);
    [v3 appendString:v11];

    id v12 = [NSString stringWithFormat:@"\nSelected Face: %@\n", v6];
    [v3 appendString:v12];

    v13 = [NSString stringWithFormat:@"\nLeft On Deck Face: %@\n", v36[5]];
    [v3 appendString:v13];

    id v14 = [NSString stringWithFormat:@"\nRight On Deck Face: %@\n", v30[5]];
    [v3 appendString:v14];

    id v15 = +[NTKFastFaceSwitchingSettings sharedInstance];
    uint64_t v16 = [v15 fastFaceSwitchingEnabled];

    v17 = NSString;
    v18 = [NSNumber numberWithBool:v16];
    v19 = [v17 stringWithFormat:@"\nFast Face Switching Enabled: %@\n", v18];
    [v3 appendString:v19];

    _Block_object_dispose(&v29, 8);
    _Block_object_dispose(&v35, 8);
  }
  else
  {
    v4 = [NSString stringWithFormat:@"error: face collection has not loaded\n"];
    [v3 appendString:v4];
  }

  v20 = [NSString stringWithFormat:@"{\n%@}\n", v3];

  return v20;
}

void __59__NTKFaceCollectionStateCapture__faceCollectionDescription__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "indexOfFace:") == *(void *)(a1 + 56))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) || *(void *)(a1 + 64) == *(void *)(a1 + 72)) {
      *a3 = 1;
    }
  }
  if ([*(id *)(a1 + 32) indexOfFace:v6] == *(void *)(a1 + 64))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
    if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) || *(void *)(a1 + 56) == *(void *)(a1 + 72)) {
      *a3 = 1;
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_faceCollection, 0);
}

@end
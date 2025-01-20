@interface PXAutoloopVideoProcessTask
- (BOOL)shouldExtractGateFeatures;
- (void)performTaskWithInput:(id)a3;
- (void)setShouldExtractGateFeatures:(BOOL)a3;
@end

@implementation PXAutoloopVideoProcessTask

- (void)setShouldExtractGateFeatures:(BOOL)a3
{
  self->_shouldExtractGateFeatures = a3;
}

- (BOOL)shouldExtractGateFeatures
{
  return self->_shouldExtractGateFeatures;
}

- (void)performTaskWithInput:(id)a3
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = NSString;
  v6 = [MEMORY[0x1E4F29128] UUID];
  v7 = [v6 UUIDString];
  v8 = [v5 stringWithFormat:@"autoloop-tmp-%@", v7];

  v9 = (void *)MEMORY[0x1E4F1CB10];
  v10 = NSTemporaryDirectory();
  v11 = [v10 stringByAppendingPathComponent:v8];
  v12 = [v9 fileURLWithPath:v11];

  v13 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v52 = 0;
  char v14 = [v13 createDirectoryAtURL:v12 withIntermediateDirectories:1 attributes:0 error:&v52];
  id v15 = v52;

  if (v14)
  {
    v16 = [v12 path];
    [(PXAutoloopVideoTask *)self setTemporaryFilesDirectory:v16];

    [v4 asset];
    unsigned int v51 = 0;
    uint64_t v50 = 0;
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    id location = 0;
    p_id location = &location;
    uint64_t v55 = 0x2020000000;
    v18 = (uint64_t (*)(id, unsigned int *))getcreateAutoLoopSettingsForAssetSymbolLoc_ptr;
    v56 = getcreateAutoLoopSettingsForAssetSymbolLoc_ptr;
    if (!getcreateAutoLoopSettingsForAssetSymbolLoc_ptr)
    {
      uint64_t v59 = MEMORY[0x1E4F143A8];
      uint64_t v60 = 3221225472;
      v61 = __getcreateAutoLoopSettingsForAssetSymbolLoc_block_invoke;
      v62 = &unk_1E5DD2B08;
      v63 = &location;
      v19 = (void *)AutoLoopLibrary();
      v20 = dlsym(v19, "createAutoLoopSettingsForAsset");
      *((void *)v63[1] + 3) = v20;
      getcreateAutoLoopSettingsForAssetSymbolLoc_ptr = (_UNKNOWN *)*((void *)v63[1] + 3);
      v18 = (uint64_t (*)(id, unsigned int *))p_location[3];
    }
    _Block_object_dispose(&location, 8);
    if (!v18)
    {
      v40 = [MEMORY[0x1E4F28B00] currentHandler];
      v41 = objc_msgSend(NSString, "stringWithUTF8String:", "struct autoloopSettings *_createAutoLoopSettingsForAsset(AVAsset *__strong, autoloopErrorCode *)");
      objc_msgSend(v40, "handleFailureInFunction:file:lineNumber:description:", v41, @"PXAutoloopSoftLinks.m", 25, @"%s", dlerror());

      goto LABEL_35;
    }
    uint64_t v21 = v18(v17, &v51);

    uint64_t v22 = v51;
    if (!v51)
    {
      unsigned int v51 = 0;
      if ([(PXAutoloopVideoProcessTask *)self shouldExtractGateFeatures])
      {
        id location = 0;
        p_id location = &location;
        uint64_t v55 = 0x2020000000;
        v23 = (uint64_t (*)(void))getcreateBundleDefaultGatingClassifierURLSymbolLoc_ptr;
        v56 = getcreateBundleDefaultGatingClassifierURLSymbolLoc_ptr;
        if (!getcreateBundleDefaultGatingClassifierURLSymbolLoc_ptr)
        {
          uint64_t v59 = MEMORY[0x1E4F143A8];
          uint64_t v60 = 3221225472;
          v61 = __getcreateBundleDefaultGatingClassifierURLSymbolLoc_block_invoke;
          v62 = &unk_1E5DD2B08;
          v63 = &location;
          v24 = (void *)AutoLoopLibrary();
          v25 = dlsym(v24, "createBundleDefaultGatingClassifierURL");
          *((void *)v63[1] + 3) = v25;
          getcreateBundleDefaultGatingClassifierURLSymbolLoc_ptr = (_UNKNOWN *)*((void *)v63[1] + 3);
          v23 = (uint64_t (*)(void))p_location[3];
        }
        _Block_object_dispose(&location, 8);
        if (!v23)
        {
          while (1)
          {
            v42 = [MEMORY[0x1E4F28B00] currentHandler];
            v43 = [NSString stringWithUTF8String:"CFURLRef _createBundleDefaultGatingClassifierURL(void)"];
            objc_msgSend(v42, "handleFailureInFunction:file:lineNumber:description:", v43, @"PXAutoloopSoftLinks.m", 28, @"%s", dlerror());

LABEL_35:
            __break(1u);
          }
        }
        CFTypeRef cf = (CFTypeRef)v23();
        v26 = [v4 imageURL];
        v27 = v26;
        if (v26) {
          _autoloopSettingsSetGating(v21, (uint64_t)cf, (uint64_t)v26);
        }
        else {
          _autoloopSettingsSetGating(v21, (uint64_t)cf, 0);
        }
      }
      else
      {
        v27 = 0;
        CFTypeRef cf = 0;
      }
      LODWORD(v60) = 2;
      uint64_t v59 = 0x100000000;
      objc_initWeak(&location, self);
      v48[0] = MEMORY[0x1E4F143A8];
      v48[1] = 3221225472;
      v48[2] = __51__PXAutoloopVideoProcessTask_performTaskWithInput___block_invoke;
      v48[3] = &unk_1E5DB4F00;
      objc_copyWeak(&v49, &location);
      _runLiveAnalysisPipeline(v21, v12, v17, (uint64_t)&v59, (uint64_t)&v50, v48);
      unsigned int v51 = v30;
      if (!v30)
      {
        v46 = _liveAnalysisResultToDictionary(v50);
        v31 = (void *)MEMORY[0x1E4F1CB10];
        uint64_t v32 = [(PXAutoloopVideoTask *)self temporaryFilesDirectory];
        v45 = [v31 fileURLWithPath:v32 isDirectory:1];

        v44 = [v45 URLByAppendingPathComponent:@"liveAnalysisResult.plist" isDirectory:0];
        LOBYTE(v32) = objc_msgSend(v46, "writeToURL:error:");
        id v33 = 0;
        if ((v32 & 1) == 0)
        {
          v34 = [(PXAutoloopVideoTask *)self temporaryFilesDirectory];
          NSLog(&cfstr_CouldnTWriteTo.isa, @"liveAnalysisResult.plist", v34, v33);
        }
        [(PXAutoloopVideoTask *)self setStatus:4];
      }
      if (v50) {
        _liveAnalysisResultDestroy(v50);
      }
      if (cf) {
        CFRelease(cf);
      }
      if (v27) {
        CFRelease(v27);
      }
      objc_destroyWeak(&v49);
      objc_destroyWeak(&location);
      uint64_t v22 = v51;
    }
    if (v22 >= 2)
    {
      _autoloopErrorCodeToString(v22);
      v36 = v35;
      v37 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v57 = *MEMORY[0x1E4F28588];
      v58 = v35;
      v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v58 forKeys:&v57 count:1];
      v39 = [v37 errorWithDomain:@"com.apple.photos" code:666 userInfo:v38];

      [(PXAutoloopVideoTask *)self setError:v39];
      [(PXAutoloopVideoTask *)self setStatus:1];
    }
    if (v21) {
      _autoloopSettingsDestroy(v21);
    }
  }
  else
  {
    id v28 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v17 = v28;
    if (v15) {
      [v28 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
    }
    [v17 setObject:@"Subdirectory could not be created in NSTemporaryDirectory()" forKeyedSubscript:*MEMORY[0x1E4F28568]];
    v29 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.photos" code:666 userInfo:v17];
    [(PXAutoloopVideoTask *)self setError:v29];
    [(PXAutoloopVideoTask *)self setStatus:1];
  }
}

BOOL __51__PXAutoloopVideoProcessTask_performTaskWithInput___block_invoke(uint64_t a1, float a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    BOOL v5 = [WeakRetained status] != 3;
    [v4 setProgress:a2];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

@end
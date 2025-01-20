@interface PGSettlingEffectConfig
- (PGSettlingEffectConfig)initWithPhotoLibrary:(id)a3 loggingConnection:(id)a4;
- (id)_requestWallpaperDownloadServerConfigWithPhotoLibrary:(id)a3 loggingConnection:(id)a4;
- (unint64_t)defaultFRCRequestsAllowed;
- (unint64_t)defaultL1FailuresAllowed;
- (unint64_t)maxFRCRequestsAllowed;
- (unint64_t)maxL1FailuresAllowed;
@end

@implementation PGSettlingEffectConfig

- (unint64_t)defaultFRCRequestsAllowed
{
  return self->_defaultFRCRequestsAllowed;
}

- (unint64_t)defaultL1FailuresAllowed
{
  return self->_defaultL1FailuresAllowed;
}

- (unint64_t)maxFRCRequestsAllowed
{
  return self->_maxFRCRequestsAllowed;
}

- (unint64_t)maxL1FailuresAllowed
{
  return self->_maxL1FailuresAllowed;
}

- (id)_requestWallpaperDownloadServerConfigWithPhotoLibrary:(id)a3 loggingConnection:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__33076;
  v30 = __Block_byref_object_dispose__33077;
  id v31 = 0;
  v6 = a4;
  os_signpost_id_t v7 = os_signpost_id_generate(v6);
  v8 = v6;
  v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "RequestWallpaperDownloadServerConfig", "", buf, 2u);
  }

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v10 = mach_absolute_time();
  dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __98__PGSettlingEffectConfig__requestWallpaperDownloadServerConfigWithPhotoLibrary_loggingConnection___block_invoke;
  v22[3] = &unk_1E68E9010;
  v24 = &v26;
  v12 = v11;
  v23 = v12;
  [v5 getCPLConfigrationValueForClient:0 completionHandler:v22];
  dispatch_time_t v13 = dispatch_time(0, 60000000000);
  if (dispatch_semaphore_wait(v12, v13) && os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1805000, v9, OS_LOG_TYPE_ERROR, "[PGSettlingEffectConfig] Timeout requesting 'Wallpaper Download' server config.", buf, 2u);
  }
  uint64_t v14 = mach_absolute_time();
  uint32_t numer = info.numer;
  uint32_t denom = info.denom;
  v17 = v9;
  v18 = v17;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v18, OS_SIGNPOST_INTERVAL_END, v7, "RequestWallpaperDownloadServerConfig", "", buf, 2u);
  }

  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v33 = "RequestWallpaperDownloadServerConfig";
    __int16 v34 = 2048;
    double v35 = (float)((float)((float)((float)(v14 - v10) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1D1805000, v18, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    v19 = (const char *)v27[5];
    *(_DWORD *)buf = 138412290;
    v33 = v19;
    _os_log_impl(&dword_1D1805000, v18, OS_LOG_TYPE_INFO, "[PGSettlingEffectConfig] Requested 'Wallpaper Download' server config: %@", buf, 0xCu);
  }
  id v20 = (id)v27[5];

  _Block_object_dispose(&v26, 8);
  return v20;
}

void __98__PGSettlingEffectConfig__requestWallpaperDownloadServerConfigWithPhotoLibrary_loggingConnection___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (PGSettlingEffectConfig)initWithPhotoLibrary:(id)a3 loggingConnection:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  os_signpost_id_t v7 = a4;
  v29.receiver = self;
  v29.super_class = (Class)PGSettlingEffectConfig;
  v8 = [(PGSettlingEffectConfig *)&v29 init];
  v9 = (PGSettlingEffectConfig *)v8;
  if (v8)
  {
    *(_OWORD *)(v8 + 8) = xmmword_1D1F4F210;
    *(_OWORD *)(v8 + 24) = xmmword_1D1F4F220;
    uint64_t v10 = [v8 _requestWallpaperDownloadServerConfigWithPhotoLibrary:v6 loggingConnection:v7];
    dispatch_semaphore_t v11 = v10;
    if (v10)
    {
      v12 = [v10 objectForKeyedSubscript:@"max.num.stabilizationFailuresAllowed"];
      dispatch_time_t v13 = v12;
      if (v12)
      {
        uint64_t v14 = [v12 unsignedIntegerValue];
        int v15 = v14;
        v9->_maxL1FailuresAllowed = v14;
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          int v31 = v15;
          _os_log_impl(&dword_1D1805000, v7, OS_LOG_TYPE_INFO, "[PGSettlingEffectConfig] Set server configured maxL1FailuresAllowed: %d", buf, 8u);
        }
      }
      v16 = [v11 objectForKeyedSubscript:@"max.num.frcRequestsAllowed"];
      v17 = v16;
      if (v16)
      {
        uint64_t v18 = [v16 unsignedIntegerValue];
        int v19 = v18;
        v9->_maxFRCRequestsAllowed = v18;
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          int v31 = v19;
          _os_log_impl(&dword_1D1805000, v7, OS_LOG_TYPE_INFO, "[PGSettlingEffectConfig] Set server configured maxFRCRequestsAllowed: %d", buf, 8u);
        }
      }
      id v20 = [v11 objectForKeyedSubscript:@"default.num.stabilizationFailuresAllowed"];
      v21 = v20;
      if (v20)
      {
        uint64_t v22 = [v20 unsignedIntegerValue];
        int v23 = v22;
        v9->_defaultL1FailuresAllowed = v22;
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          int v31 = v23;
          _os_log_impl(&dword_1D1805000, v7, OS_LOG_TYPE_INFO, "[PGSettlingEffectConfig] Set server configured defaultL1FailuresAllowed: %d", buf, 8u);
        }
      }
      v24 = [v11 objectForKeyedSubscript:@"default.num.frcRequestsAllowed"];
      v25 = v24;
      if (v24)
      {
        uint64_t v26 = [v24 unsignedIntegerValue];
        int v27 = v26;
        v9->_defaultFRCRequestsAllowed = v26;
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          int v31 = v27;
          _os_log_impl(&dword_1D1805000, v7, OS_LOG_TYPE_INFO, "[PGSettlingEffectConfig] Set server configured defaultFRCRequestsAllowed: %d", buf, 8u);
        }
      }
    }
  }

  return v9;
}

@end
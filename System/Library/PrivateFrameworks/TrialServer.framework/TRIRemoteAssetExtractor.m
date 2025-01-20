@interface TRIRemoteAssetExtractor
- ($A5A652246548B43F8BC05201A1C72A70)extractArchiveFromFile:(id)a3 withArchiveName:(id)a4 toEmptyDirectory:(id)a5 postExtractionCompression:(id)a6 error:(id *)a7;
- (TRIRemoteAssetExtractor)initWithMonitoredActivity:(id)a3;
@end

@implementation TRIRemoteAssetExtractor

- (TRIRemoteAssetExtractor)initWithMonitoredActivity:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRIRemoteAssetExtractor;
  v6 = [(TRIRemoteAssetExtractor *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_monitoredActivity, a3);
  }

  return v7;
}

- ($A5A652246548B43F8BC05201A1C72A70)extractArchiveFromFile:(id)a3 withArchiveName:(id)a4 toEmptyDirectory:(id)a5 postExtractionCompression:(id)a6 error:(id *)a7
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  monitoredActivity = self->_monitoredActivity;
  if (monitoredActivity && xpc_activity_should_defer(monitoredActivity))
  {
    v16 = TRILogCategory_Archiving();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v17.unint64_t var0 = 2;
      _os_log_impl(&dword_1DA291000, v16, OS_LOG_TYPE_DEFAULT, "Deferral requested before start of archive extraction.", buf, 2u);
    }
    else
    {
      v17.unint64_t var0 = 2;
    }
  }
  else
  {
    unint64_t var0 = a6.var0;
    v16 = [objc_alloc(MEMORY[0x1E4F29268]) initWithServiceName:@"com.apple.trial.TrialArchivingService"];
    v18 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F34A4248];
    [v16 setRemoteObjectInterface:v18];

    [v16 resume];
    *(void *)buf = 0;
    v40 = buf;
    uint64_t v41 = 0x3032000000;
    v42 = __Block_byref_object_copy__27;
    v43 = __Block_byref_object_dispose__27;
    id v44 = 0;
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __115__TRIRemoteAssetExtractor_extractArchiveFromFile_withArchiveName_toEmptyDirectory_postExtractionCompression_error___block_invoke;
    v38[3] = &unk_1E6BBBB50;
    v38[4] = buf;
    v19 = [v16 synchronousRemoteObjectProxyWithErrorHandler:v38];
    v20 = +[TRISandboxExtensionFactory extensionTokenForPath:v14 extensionClass:1];
    if (v20)
    {
      v21 = (void *)MEMORY[0x1E4F28CB0];
      v22 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:v12];
      id v37 = 0;
      v23 = [v21 fileHandleForReadingFromURL:v22 error:&v37];
      id v27 = v37;

      if (v23)
      {
        *(void *)v45 = 0;
        *(void *)&v45[8] = v45;
        *(void *)&v45[16] = 0x2810000000;
        v46 = "";
        char v47 = 0;
        v24 = self->_monitoredActivity;
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __115__TRIRemoteAssetExtractor_extractArchiveFromFile_withArchiveName_toEmptyDirectory_postExtractionCompression_error___block_invoke_20;
        v29[3] = &unk_1E6BBBBA0;
        id v30 = v19;
        id v31 = v23;
        id v32 = v13;
        id v33 = v14;
        id v34 = v20;
        v35 = v45;
        unint64_t v36 = var0;
        +[TRIDeferralNotifier forwardDeferralsFromMonitoredActivity:v24 usingDarwinNotificationName:"com.apple.trial.TrialArchivingService.shouldDefer" whileExecutingBlock:v29];
        [v16 invalidate];
        if (a7) {
          *a7 = *((id *)v40 + 5);
        }
        if (*((void *)v40 + 5)) {
          v17.unint64_t var0 = 0;
        }
        else {
          v17.unint64_t var0 = *(unsigned char *)(*(void *)&v45[8] + 32);
        }

        _Block_object_dispose(v45, 8);
      }
      else
      {
        v25 = TRILogCategory_Server();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v45 = 138543618;
          *(void *)&v45[4] = v12;
          *(_WORD *)&v45[12] = 2114;
          *(void *)&v45[14] = v27;
          _os_log_error_impl(&dword_1DA291000, v25, OS_LOG_TYPE_ERROR, "Failed to open archive handle for %{public}@ with error %{public}@", v45, 0x16u);
        }

        v17.unint64_t var0 = 0;
      }
    }
    else
    {
      v17.unint64_t var0 = 0;
    }

    _Block_object_dispose(buf, 8);
  }

  return v17;
}

void __115__TRIRemoteAssetExtractor_extractArchiveFromFile_withArchiveName_toEmptyDirectory_postExtractionCompression_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = TRILogCategory_Server();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = v3;
    _os_log_impl(&dword_1DA291000, v4, OS_LOG_TYPE_DEFAULT, "connection invalidated with error %{public}@", (uint8_t *)&v7, 0xCu);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __115__TRIRemoteAssetExtractor_extractArchiveFromFile_withArchiveName_toEmptyDirectory_postExtractionCompression_error___block_invoke_20(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = [MEMORY[0x1E4F1CB10] fileURLWithPath:a1[7] isDirectory:1];
  uint64_t v6 = a1[10];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __115__TRIRemoteAssetExtractor_extractArchiveFromFile_withArchiveName_toEmptyDirectory_postExtractionCompression_error___block_invoke_2;
  v8[3] = &unk_1E6BBBB78;
  uint64_t v7 = a1[8];
  uint64_t v10 = a1[9];
  id v9 = (id)a1[6];
  [v2 extractArchiveFromHandle:v3 withArchiveName:v4 toDirectory:v5 destDirExtension:v7 postExtractionCompression:v6 completion:v8];
}

void __115__TRIRemoteAssetExtractor_extractArchiveFromFile_withArchiveName_toEmptyDirectory_postExtractionCompression_error___block_invoke_2(uint64_t a1, char a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = a2;
  uint64_t v3 = TRILogCategory_Server();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    unint64_t v5 = *(char *)(*(void *)(*(void *)(a1 + 40) + 8) + 32);
    if (v5 > 2) {
      uint64_t v6 = 0;
    }
    else {
      uint64_t v6 = off_1E6BBBBC0[v5];
    }
    int v7 = 138543618;
    uint64_t v8 = v4;
    __int16 v9 = 2114;
    uint64_t v10 = v6;
    _os_log_impl(&dword_1DA291000, v3, OS_LOG_TYPE_DEFAULT, "extraction of %{public}@ completed with result: %{public}@", (uint8_t *)&v7, 0x16u);
  }
}

- (void).cxx_destruct
{
}

@end
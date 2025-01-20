@interface TRIRemoteAssetPatcher
- ($A5A652246548B43F8BC05201A1C72A70)applyPatchWithFilename:(id)a3 toSrcDir:(id)a4 writingToEmptyDestDir:(id)a5 postPatchCompression:(id)a6 error:(id *)a7;
- (TRIRemoteAssetPatcher)initWithMonitoredActivity:(id)a3;
- (id)_tokenForSandboxExtensionWithClass:(const char *)a3 path:(id)a4;
@end

@implementation TRIRemoteAssetPatcher

- (TRIRemoteAssetPatcher)initWithMonitoredActivity:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRIRemoteAssetPatcher;
  v6 = [(TRIRemoteAssetPatcher *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_monitoredActivity, a3);
  }

  return v7;
}

- (id)_tokenForSandboxExtensionWithClass:(const char *)a3 path:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  [v4 fileSystemRepresentation];
  uint64_t v5 = sandbox_extension_issue_file();
  if (v5)
  {
    v6 = (void *)v5;
    v7 = (void *)[[NSString alloc] initWithCString:v5 encoding:4];
    free(v6);
  }
  else
  {
    v8 = TRILogCategory_Server();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138543362;
      id v11 = v4;
      _os_log_error_impl(&dword_1DA291000, v8, OS_LOG_TYPE_ERROR, "Failed to create sandbox extension for %{public}@", (uint8_t *)&v10, 0xCu);
    }

    v7 = 0;
  }

  return v7;
}

- ($A5A652246548B43F8BC05201A1C72A70)applyPatchWithFilename:(id)a3 toSrcDir:(id)a4 writingToEmptyDestDir:(id)a5 postPatchCompression:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v15 = (void *)MEMORY[0x1E016E7F0]();
  v16 = [(TRIRemoteAssetPatcher *)self _tokenForSandboxExtensionWithClass:"com.apple.app-sandbox.read" path:v12];
  if (v16)
  {
    v17 = [(TRIRemoteAssetPatcher *)self _tokenForSandboxExtensionWithClass:"com.apple.app-sandbox.read" path:v13];
    if (v13)
    {
      v18 = [(TRIRemoteAssetPatcher *)self _tokenForSandboxExtensionWithClass:"com.apple.app-sandbox.read-write" path:v14];
      if (v18)
      {
        monitoredActivity = self->_monitoredActivity;
        if (monitoredActivity && xpc_activity_should_defer(monitoredActivity))
        {
          v20 = TRILogCategory_Archiving();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            LOBYTE(a7) = 2;
            _os_log_impl(&dword_1DA291000, v20, OS_LOG_TYPE_DEFAULT, "Deferring before start of patch application.", buf, 2u);
          }
          else
          {
            LOBYTE(a7) = 2;
          }
        }
        else
        {
          v31 = v18;
          v21 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithServiceName:@"com.apple.trial.TrialArchivingService"];
          [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F34A4248];
          v22 = v32 = v17;
          [v21 setRemoteObjectInterface:v22];

          [v21 resume];
          *(void *)buf = 0;
          v58 = buf;
          uint64_t v59 = 0x3032000000;
          v60 = __Block_byref_object_copy__40;
          v61 = __Block_byref_object_dispose__40;
          id v62 = 0;
          v56[0] = MEMORY[0x1E4F143A8];
          v56[1] = 3221225472;
          v56[2] = __106__TRIRemoteAssetPatcher_applyPatchWithFilename_toSrcDir_writingToEmptyDestDir_postPatchCompression_error___block_invoke;
          v56[3] = &unk_1E6BBBB50;
          v56[4] = buf;
          v23 = (void *)MEMORY[0x1E016EA80](v56);
          uint64_t v51 = 0;
          v52 = &v51;
          uint64_t v53 = 0x2810000000;
          v54 = "";
          char v55 = 0;
          uint64_t v45 = 0;
          v46 = &v45;
          uint64_t v47 = 0x3032000000;
          v48 = __Block_byref_object_copy__40;
          v49 = __Block_byref_object_dispose__40;
          id v50 = 0;
          v30 = self->_monitoredActivity;
          v33[0] = MEMORY[0x1E4F143A8];
          v33[1] = 3221225472;
          v33[2] = __106__TRIRemoteAssetPatcher_applyPatchWithFilename_toSrcDir_writingToEmptyDestDir_postPatchCompression_error___block_invoke_2;
          v33[3] = &unk_1E6BBD1D8;
          v24 = v21;
          v18 = v31;
          v20 = v24;
          v34 = v24;
          id v25 = v23;
          v17 = v32;
          id v29 = v25;
          id v41 = v25;
          id v35 = v12;
          id v36 = v16;
          id v37 = v13;
          id v38 = v32;
          id v39 = v14;
          id v40 = v31;
          v42 = &v51;
          v43 = &v45;
          unint64_t var0 = a6.var0;
          +[TRIDeferralNotifier forwardDeferralsFromMonitoredActivity:v30 usingDarwinNotificationName:"com.apple.trial.TrialArchivingService.shouldDefer" whileExecutingBlock:v33];
          [v20 invalidate];
          v26 = (void *)*((void *)v58 + 5);
          if (v26)
          {
            v27 = v29;
            if (a7)
            {
              objc_storeStrong(a7, v26);
              LOBYTE(a7) = 0;
            }
          }
          else
          {
            v27 = v29;
            if (a7) {
              objc_storeStrong(a7, (id)v46[5]);
            }
            LOBYTE(a7) = *((unsigned char *)v52 + 32);
          }

          _Block_object_dispose(&v45, 8);
          _Block_object_dispose(&v51, 8);

          _Block_object_dispose(buf, 8);
        }
      }
      else
      {
        LOBYTE(a7) = 0;
      }
    }
    else
    {
      LOBYTE(a7) = 0;
    }
  }
  else
  {
    LOBYTE(a7) = 0;
  }

  return ($A5A652246548B43F8BC05201A1C72A70)a7;
}

void __106__TRIRemoteAssetPatcher_applyPatchWithFilename_toSrcDir_writingToEmptyDestDir_postPatchCompression_error___block_invoke(uint64_t a1, void *a2)
{
}

void __106__TRIRemoteAssetPatcher_applyPatchWithFilename_toSrcDir_writingToEmptyDestDir_postPatchCompression_error___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) synchronousRemoteObjectProxyWithErrorHandler:*(void *)(a1 + 88)];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 64);
  uint64_t v7 = *(void *)(a1 + 72);
  uint64_t v8 = *(void *)(a1 + 80);
  uint64_t v9 = *(void *)(a1 + 112);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __106__TRIRemoteAssetPatcher_applyPatchWithFilename_toSrcDir_writingToEmptyDestDir_postPatchCompression_error___block_invoke_3;
  v10[3] = &unk_1E6BBD1B0;
  long long v11 = *(_OWORD *)(a1 + 96);
  [v2 applyPatchWithFilename:v3 patchExtension:v4 toSrcDir:v5 srcDirExtension:v6 writingToDestDir:v7 destDirExtension:v8 postPatchCompression:v9 completion:v10];
}

void __106__TRIRemoteAssetPatcher_applyPatchWithFilename_toSrcDir_writingToEmptyDestDir_postPatchCompression_error___block_invoke_3(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 32) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (void).cxx_destruct
{
}

@end
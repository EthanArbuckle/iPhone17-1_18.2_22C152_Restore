@interface TRIRemoteAssetDecrypter
+ (BOOL)decryptAssetWithURL:(id)a3 destinationFilename:(id)a4 namespaceName:(id)a5 error:(id *)a6;
@end

@implementation TRIRemoteAssetDecrypter

+ (BOOL)decryptAssetWithURL:(id)a3 destinationFilename:(id)a4 namespaceName:(id)a5 error:(id *)a6
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v26 = a5;
  v13 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithServiceName:@"com.apple.trial.TrialArchivingService"];
  v14 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F34A4248];
  [v13 setRemoteObjectInterface:v14];

  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__36;
  v33 = __Block_byref_object_dispose__36;
  id v34 = 0;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __87__TRIRemoteAssetDecrypter_decryptAssetWithURL_destinationFilename_namespaceName_error___block_invoke;
  v28[3] = &unk_1E6BBBB50;
  v28[4] = &v29;
  v15 = [v13 synchronousRemoteObjectProxyWithErrorHandler:v28];
  [v13 resume];
  v16 = [v11 path];
  if (!v16)
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, a1, @"TRIRemoteAssetDecrypter.m", 34, @"Expression was unexpectedly nil/false: %@", @"assetURL.path" object file lineNumber description];
  }
  v17 = +[TRISandboxExtensionFactory extensionTokenForPath:v16 extensionClass:0];

  uint64_t v18 = +[TRISandboxExtensionFactory extensionTokenForPath:v12 extensionClass:1];
  v19 = (void *)v18;
  if (!v17)
  {
    v22 = TRILogCategory_Server();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v24 = [v11 path];
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v24;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v26;
      _os_log_error_impl(&dword_1DA291000, v22, OS_LOG_TYPE_ERROR, "Unable to get source extension token for path: %{public}@, namespace name: %{public}@", buf, 0x16u);
    }
    goto LABEL_14;
  }
  if (!v18)
  {
    v22 = TRILogCategory_Server();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v12;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v26;
      _os_log_error_impl(&dword_1DA291000, v22, OS_LOG_TYPE_ERROR, "Unable to get destination extension token for path: %{public}@, namespace name: %{public}@", buf, 0x16u);
    }
LABEL_14:

    BOOL v21 = 0;
    goto LABEL_17;
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  char v36 = 0;
  v20 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v12 isDirectory:1];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __87__TRIRemoteAssetDecrypter_decryptAssetWithURL_destinationFilename_namespaceName_error___block_invoke_25;
  v27[3] = &unk_1E6BBCE30;
  v27[4] = buf;
  [v15 decryptAssetWithURL:v11 toDestinationFileURL:v20 namespaceName:v26 sourceExtension:v17 destinationExtension:v19 completion:v27];

  [v13 invalidate];
  if (a6) {
    *a6 = (id) v30[5];
  }
  if (v30[5]) {
    BOOL v21 = 0;
  }
  else {
    BOOL v21 = *(unsigned char *)(*(void *)&buf[8] + 24) != 0;
  }
  _Block_object_dispose(buf, 8);
LABEL_17:

  _Block_object_dispose(&v29, 8);
  return v21;
}

void __87__TRIRemoteAssetDecrypter_decryptAssetWithURL_destinationFilename_namespaceName_error___block_invoke(uint64_t a1, void *a2)
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

void __87__TRIRemoteAssetDecrypter_decryptAssetWithURL_destinationFilename_namespaceName_error___block_invoke_25(uint64_t a1, int a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v4 = TRILogCategory_Server();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = @"NO";
    if (a2) {
      uint64_t v5 = @"YES";
    }
    int v6 = 138543362;
    int v7 = v5;
    _os_log_impl(&dword_1DA291000, v4, OS_LOG_TYPE_DEFAULT, "decryption of asset completed with result %{public}@", (uint8_t *)&v6, 0xCu);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
}

@end
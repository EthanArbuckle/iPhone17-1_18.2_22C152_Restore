@interface TRINamespaceStatusProvider(Tasks)
+ (uint64_t)updateStatusFetchSuccess:()Tasks forNamespaceName:withContext:;
@end

@implementation TRINamespaceStatusProvider(Tasks)

+ (uint64_t)updateStatusFetchSuccess:()Tasks forNamespaceName:withContext:
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  v9 = [v8 namespaceDatabase];
  v10 = [v9 dynamicNamespaceRecordWithNamespaceName:v7];

  v11 = [v10 appContainer];
  v12 = [v8 paths];

  if (v11)
  {
    v13 = [v10 appContainer];
    uint64_t v14 = [v12 pathsForContainer:v13 asClientProcess:0];

    v12 = (void *)v14;
  }

  if (v12)
  {
    v15 = [objc_alloc(MEMORY[0x1E4FB01E0]) initWithPaths:v12];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __91__TRINamespaceStatusProvider_Tasks__updateStatusFetchSuccess_forNamespaceName_withContext___block_invoke;
    v20[3] = &__block_descriptor_33_e48___TRINamespaceStatus_16__0__TRINamespaceStatus_8l;
    char v21 = a3;
    uint64_t v16 = [v15 updateStatusForNamespaceWithName:v7 usingBlock:v20];
  }
  else
  {
    v15 = TRILogCategory_Server();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v17 = [v10 appContainer];
      v18 = [v17 identifier];
      *(_DWORD *)buf = 138543362;
      v23 = v18;
      _os_log_impl(&dword_1DA291000, v15, OS_LOG_TYPE_DEFAULT, "updateStatusFetchSuccess skipping missing app container: %{public}@", buf, 0xCu);
    }
    uint64_t v16 = 0;
  }

  return v16;
}

@end
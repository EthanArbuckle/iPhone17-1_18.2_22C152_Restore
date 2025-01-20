@interface PHAExternalAssetsTask
- (BOOL)currentPlatformIsSupported;
- (BOOL)runWithGraphManager:(id)a3 progressReporter:(id)a4 error:(id *)a5;
- (BOOL)shouldRunWithGraphManager:(id)a3;
- (NSString)name;
- (PHAExternalAssetsTask)init;
- (double)period;
- (id)incrementalKey;
- (id)taskClassDependencies;
- (int)priority;
- (void)timeoutFatal:(BOOL)a3;
@end

@implementation PHAExternalAssetsTask

- (void)timeoutFatal:(BOOL)a3
{
  if (a3) {
    __assert_rtn("-[PHAExternalAssetsTask timeoutFatal:]", "PHAExternalAssetsTask.m", 84, "NO");
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_fault_impl(&dword_1D21F2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "PHAExternalAssetsTask is stuck", v3, 2u);
  }
}

- (BOOL)runWithGraphManager:(id)a3 progressReporter:(id)a4 error:(id *)a5
{
  v7 = (objc_class *)MEMORY[0x1E4F8D3E0];
  id v8 = a4;
  id v9 = a3;
  id v10 = [v7 alloc];
  v11 = [v9 workingContextForExternalRelevance];

  v12 = (void *)[v10 initWithWorkingContext:v11];
  LOBYTE(a5) = [v12 processExternalAssetRelevanceInferenceWithError:a5 progressReporter:v8];

  return (char)a5;
}

- (BOOL)shouldRunWithGraphManager:(id)a3
{
  id v3 = a3;
  if (!_os_feature_enabled_impl())
  {
LABEL_7:
    char v6 = 0;
    goto LABEL_8;
  }
  v4 = [v3 photoLibrary];
  char v5 = [v4 isSystemPhotoLibrary];

  if ((v5 & 1) == 0)
  {
    v7 = [v3 workingContext];
    id v8 = [v7 loggingConnection];

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_1D21F2000, v8, OS_LOG_TYPE_DEFAULT, "Task is running on a non system photo library, not running external asset processing job", v10, 2u);
    }

    goto LABEL_7;
  }
  char v6 = [v3 isReady];
LABEL_8:

  return v6;
}

- (int)priority
{
  return 1;
}

- (id)taskClassDependencies
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

- (id)incrementalKey
{
  return 0;
}

- (BOOL)currentPlatformIsSupported
{
  return 1;
}

- (PHAExternalAssetsTask)init
{
  v3.receiver = self;
  v3.super_class = (Class)PHAExternalAssetsTask;
  return [(PHAExternalAssetsTask *)&v3 init];
}

- (double)period
{
  return 21600.0;
}

- (NSString)name
{
  return (NSString *)@"PHAExternalAssetsTask";
}

@end
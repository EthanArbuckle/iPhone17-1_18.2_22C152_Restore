@interface SYDocumentWorkflowsDisabledDataStore
+ (id)_disabledRepositoryError;
- (BOOL)saveUserActivity:(id)a3 forRelatedUniqueIdentifier:(id)a4 sourceBundleIdentifier:(id)a5 error:(id *)a6;
- (id)fetchUserActivityWithRelatedUniqueIdentifier:(id)a3 error:(id *)a4;
@end

@implementation SYDocumentWorkflowsDisabledDataStore

+ (id)_disabledRepositoryError
{
  if (_disabledRepositoryError_onceToken != -1) {
    dispatch_once(&_disabledRepositoryError_onceToken, &__block_literal_global_5);
  }
  v2 = (void *)_disabledRepositoryError_error;
  return v2;
}

void __64__SYDocumentWorkflowsDisabledDataStore__disabledRepositoryError__block_invoke()
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v4 = *MEMORY[0x1E4F28568];
  v5[0] = @"Repository is disabled.";
  v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  uint64_t v2 = [v0 errorWithDomain:@"com.apple.synapse" code:-129 userInfo:v1];
  v3 = (void *)_disabledRepositoryError_error;
  _disabledRepositoryError_error = v2;
}

- (id)fetchUserActivityWithRelatedUniqueIdentifier:(id)a3 error:(id *)a4
{
  if (a4)
  {
    *a4 = [(id)objc_opt_class() _disabledRepositoryError];
  }
  return 0;
}

- (BOOL)saveUserActivity:(id)a3 forRelatedUniqueIdentifier:(id)a4 sourceBundleIdentifier:(id)a5 error:(id *)a6
{
  if (a6)
  {
    *a6 = [(id)objc_opt_class() _disabledRepositoryError];
  }
  return 0;
}

@end
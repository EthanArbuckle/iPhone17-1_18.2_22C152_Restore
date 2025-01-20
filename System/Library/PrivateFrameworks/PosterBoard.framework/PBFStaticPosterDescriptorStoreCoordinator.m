@interface PBFStaticPosterDescriptorStoreCoordinator
+ (BOOL)shouldBeExcludedFromBackup;
+ (int64_t)type;
- (id)_accessQueue_buildIdentityForVersion:(unint64_t)a3 supplement:(unint64_t)a4;
@end

@implementation PBFStaticPosterDescriptorStoreCoordinator

+ (int64_t)type
{
  return 2;
}

+ (BOOL)shouldBeExcludedFromBackup
{
  return 1;
}

- (id)_accessQueue_buildIdentityForVersion:(unint64_t)a3 supplement:(unint64_t)a4
{
  v8 = [(PBFPosterModelStoreCoordinator *)self extensionIdentifier];
  v9 = [(PBFPosterModelStoreCoordinator *)self descriptorIdentifier];
  v10 = [(PBFPosterModelStoreCoordinator *)self posterUUID];
  uint64_t v11 = [(PBFPosterModelStoreCoordinator *)self role];
  v12 = (void *)v11;
  if (a4)
  {
    v15 = [NSString stringWithFormat:@"static descriptors don't support multiple supplements : provider=%@ descriptor=%@ role=%@ posterUUID=%@ version=%llu supplement=%llu", v8, v9, v11, v10, a3, a4];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFStaticPosterDescriptorStoreCoordinator _accessQueue_buildIdentityForVersion:supplement:](a2, (uint64_t)self, (uint64_t)v15);
    }
LABEL_14:
    [v15 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D323BD74);
  }
  if (!v8 || !v9 || !v10 || !v11)
  {
    v15 = [NSString stringWithFormat:@"static descriptors missing component : provider=%@ descriptor=%@ role=%@ posterUUID=%@ version=%llu supplement=%llu", v8, v9, v11, v10, a3, 0];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFStaticPosterDescriptorStoreCoordinator _accessQueue_buildIdentityForVersion:supplement:](a2, (uint64_t)self, (uint64_t)v15);
    }
    goto LABEL_14;
  }
  v13 = [MEMORY[0x1E4F924C8] staticDescriptorIdentityWithProvider:v8 identifier:v9 role:v11 posterUUID:v10 version:a3];

  return v13;
}

- (void)_accessQueue_buildIdentityForVersion:(uint64_t)a3 supplement:.cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v4 = NSStringFromSelector(a1);
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0();
  v9 = @"PBFStaticPosterDescriptorStoreCoordinator.m";
  __int16 v10 = 1024;
  int v11 = 33;
  __int16 v12 = v7;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_1D31CE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v8, 0x3Au);
}

- (void)_accessQueue_buildIdentityForVersion:(uint64_t)a3 supplement:.cold.2(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v4 = NSStringFromSelector(a1);
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0();
  v9 = @"PBFStaticPosterDescriptorStoreCoordinator.m";
  __int16 v10 = 1024;
  int v11 = 30;
  __int16 v12 = v7;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_1D31CE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v8, 0x3Au);
}

@end
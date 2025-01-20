@interface REMAuxiliaryChangeInfoFetchResult(REMChangeTrackingInternalAccess)
@end

@implementation REMAuxiliaryChangeInfoFetchResult(REMChangeTrackingInternalAccess)

- (void)auxiliaryChangeInfoFromData:()REMChangeTrackingInternalAccess withObjectID:fromChangeObject:error:.cold.1(void *a1)
{
  v1 = NSStringFromClass((Class)[a1 typedKlass]);
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_1_0(&dword_1B9AA2000, v2, v3, "REMChangeTracking+AuxiliaryChgInfo: Could not instantiate auxiliary change info model for {class: %{public}@, remObjectID: %{public}@}", v4, v5, v6, v7, v8);
}

- (void)auxiliaryChangeInfoFromData:()REMChangeTrackingInternalAccess withObjectID:fromChangeObject:error:.cold.2(void *a1)
{
  v1 = NSStringFromClass((Class)[a1 typedKlass]);
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_1_0(&dword_1B9AA2000, v2, v3, "REMChangeTracking+AuxiliaryChgInfo: No object identifier decoded from plist dictionary for {class: %{public}@, remObjectID: %{public}@}", v4, v5, v6, v7, v8);
}

@end
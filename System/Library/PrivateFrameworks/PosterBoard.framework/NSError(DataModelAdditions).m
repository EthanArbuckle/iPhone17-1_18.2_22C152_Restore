@interface NSError(DataModelAdditions)
+ (uint64_t)pbf_dataStoreErrorWithCode:()DataModelAdditions userInfo:;
+ (uint64_t)pbf_descriptorStoreCoordinatorErrorWithCode:()DataModelAdditions userInfo:;
+ (uint64_t)pbf_extensionStoreCoordinatorErrorWithCode:()DataModelAdditions userInfo:;
+ (uint64_t)pbf_generalErrorWithCode:()DataModelAdditions userInfo:;
- (BOOL)pbf_isGeneralCancelledError;
@end

@implementation NSError(DataModelAdditions)

+ (uint64_t)pbf_descriptorStoreCoordinatorErrorWithCode:()DataModelAdditions userInfo:
{
  return [MEMORY[0x1E4F28C58] errorWithDomain:PBFPosterDescriptorStoreCoordinatorErrorDomain code:a3 userInfo:a4];
}

+ (uint64_t)pbf_extensionStoreCoordinatorErrorWithCode:()DataModelAdditions userInfo:
{
  return [MEMORY[0x1E4F28C58] errorWithDomain:PBFPosterDescriptorStoreCoordinatorErrorDomain code:a3 userInfo:a4];
}

+ (uint64_t)pbf_dataStoreErrorWithCode:()DataModelAdditions userInfo:
{
  return [MEMORY[0x1E4F28C58] errorWithDomain:PBFPosterExtensionDataStoreErrorDomain code:a3 userInfo:a4];
}

+ (uint64_t)pbf_generalErrorWithCode:()DataModelAdditions userInfo:
{
  return [MEMORY[0x1E4F28C58] errorWithDomain:PBFGeneralErrorDomain code:a3 userInfo:a4];
}

- (BOOL)pbf_isGeneralCancelledError
{
  v2 = [a1 domain];
  if ([v2 isEqualToString:PBFGeneralErrorDomain]) {
    BOOL v3 = [a1 code] == 4;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

@end
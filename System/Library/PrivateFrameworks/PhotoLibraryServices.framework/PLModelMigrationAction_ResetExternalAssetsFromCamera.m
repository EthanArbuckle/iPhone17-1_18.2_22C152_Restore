@interface PLModelMigrationAction_ResetExternalAssetsFromCamera
+ (id)predicateForFetchingAssetsToReset;
@end

@implementation PLModelMigrationAction_ResetExternalAssetsFromCamera

+ (id)predicateForFetchingAssetsToReset
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"additionalAttributes.importedByBundleIdentifier", @"com.apple.camera"];
}

@end
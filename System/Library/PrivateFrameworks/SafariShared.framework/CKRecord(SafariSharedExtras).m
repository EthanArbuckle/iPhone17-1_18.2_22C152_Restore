@interface CKRecord(SafariSharedExtras)
+ (uint64_t)safari_folderTypeForRecordName:()SafariSharedExtras;
@end

@implementation CKRecord(SafariSharedExtras)

+ (uint64_t)safari_folderTypeForRecordName:()SafariSharedExtras
{
  uint64_t v3 = safari_folderTypeForRecordName__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&safari_folderTypeForRecordName__onceToken, &__block_literal_global_14);
  }
  v5 = [(id)safari_folderTypeForRecordName__builtInRecordNamesToRecordTypes objectForKeyedSubscript:v4];

  uint64_t v6 = [v5 integerValue];
  return v6;
}

@end
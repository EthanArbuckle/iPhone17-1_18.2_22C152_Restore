@interface CKRecord
@end

@implementation CKRecord

void __63__CKRecord_SafariSharedExtras__safari_folderTypeForRecordName___block_invoke()
{
  v4[3] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F98090];
  v3[0] = *MEMORY[0x1E4F98098];
  v3[1] = v0;
  v4[0] = &unk_1EFC224B0;
  v4[1] = &unk_1EFC224C8;
  v3[2] = *MEMORY[0x1E4F980A0];
  v4[2] = &unk_1EFC224E0;
  uint64_t v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:3];
  v2 = (void *)safari_folderTypeForRecordName__builtInRecordNamesToRecordTypes;
  safari_folderTypeForRecordName__builtInRecordNamesToRecordTypes = v1;
}

@end
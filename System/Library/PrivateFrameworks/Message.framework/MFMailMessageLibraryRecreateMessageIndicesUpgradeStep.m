@interface MFMailMessageLibraryRecreateMessageIndicesUpgradeStep
+ (BOOL)runWithConnection:(id)a3;
@end

@implementation MFMailMessageLibraryRecreateMessageIndicesUpgradeStep

+ (BOOL)runWithConnection:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = [&unk_1EFF50868 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(&unk_1EFF50868);
        }
        if (([v3 executeStatementString:*(void *)(*((void *)&v9 + 1) + 8 * i) errorMessage:@"Adding index"] & 1) == 0)
        {
          BOOL v7 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [&unk_1EFF50868 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v7 = 1;
LABEL_11:

  return v7;
}

@end
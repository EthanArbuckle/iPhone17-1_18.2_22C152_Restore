@interface NSDictionary(RunningBoard)
- (id)entriesToStringWithIndent:()RunningBoard debug:;
@end

@implementation NSDictionary(RunningBoard)

- (id)entriesToStringWithIndent:()RunningBoard debug:
{
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__0;
  v16 = __Block_byref_object_dispose__0;
  id v17 = [MEMORY[0x1E4F28E78] string];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__NSDictionary_RunningBoard__entriesToStringWithIndent_debug___block_invoke;
  v9[3] = &unk_1E57412C8;
  v9[4] = &v12;
  int v10 = a3;
  char v11 = a4;
  [a1 enumerateKeysAndObjectsUsingBlock:v9];
  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

@end
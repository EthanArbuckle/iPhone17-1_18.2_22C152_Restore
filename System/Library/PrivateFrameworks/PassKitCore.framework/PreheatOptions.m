@interface PreheatOptions
@end

@implementation PreheatOptions

void ___PreheatOptions_block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v1 = [NSNumber numberWithInteger:4];
  uint64_t v2 = *MEMORY[0x1E4F1DD18];
  v3 = [NSNumber numberWithInteger:4];
  uint64_t v4 = *MEMORY[0x1E4F1DD20];
  uint64_t v5 = *MEMORY[0x1E4F1DD30];
  uint64_t v6 = *MEMORY[0x1E4F1DD38];
  v7 = [NSNumber numberWithBool:1];
  uint64_t v8 = *MEMORY[0x1E4F1DD48];
  v9 = [NSNumber numberWithBool:1];
  id v13 = (id)objc_msgSend(v0, "initWithObjectsAndKeys:", v1, v2, v3, v4, v5, v6, v7, v8, v9, *MEMORY[0x1E4F2FF08], 0);

  if (qword_1EB402B20 != -1) {
    dispatch_once(&qword_1EB402B20, &__block_literal_global_227);
  }
  v10 = v13;
  if (qword_1EB402B18)
  {
    objc_msgSend(v13, "addEntriesFromDictionary:");
    v10 = v13;
  }
  uint64_t v11 = [v10 copy];
  v12 = (void *)_MergedGlobals_196;
  _MergedGlobals_196 = v11;
}

@end
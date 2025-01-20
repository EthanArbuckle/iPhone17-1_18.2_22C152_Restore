@interface NSManagedObjectContext(RCExtensions)
- (BOOL)rc_performAndWaitReturningError:()RCExtensions block:;
- (id)recordingsModel;
@end

@implementation NSManagedObjectContext(RCExtensions)

- (id)recordingsModel
{
  return +[RCSavedRecordingsModel recordingsModelForContext:a1];
}

- (BOOL)rc_performAndWaitReturningError:()RCExtensions block:
{
  id v6 = a4;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__0;
  v19 = __Block_byref_object_dispose__0;
  id v20 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __78__NSManagedObjectContext_RCExtensions__rc_performAndWaitReturningError_block___block_invoke;
  v11[3] = &unk_1E6496300;
  v13 = &v21;
  id v7 = v6;
  id v12 = v7;
  v14 = &v15;
  [a1 performBlockAndWait:v11];
  int v8 = *((unsigned __int8 *)v22 + 24);
  if (a3 && !*((unsigned char *)v22 + 24))
  {
    *a3 = (id) v16[5];
    int v8 = *((unsigned __int8 *)v22 + 24);
  }
  BOOL v9 = v8 != 0;

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

@end
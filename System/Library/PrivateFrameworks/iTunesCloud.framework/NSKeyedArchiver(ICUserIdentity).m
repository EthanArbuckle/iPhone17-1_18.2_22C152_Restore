@interface NSKeyedArchiver(ICUserIdentity)
+ (id)ic_archivedDataWithRootUserIdentity:()ICUserIdentity inStore:requiringSecureCoding:error:;
@end

@implementation NSKeyedArchiver(ICUserIdentity)

+ (id)ic_archivedDataWithRootUserIdentity:()ICUserIdentity inStore:requiringSecureCoding:error:
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__5287;
  v31 = __Block_byref_object_dispose__5288;
  id v32 = 0;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__5287;
  v25 = __Block_byref_object_dispose__5288;
  id v26 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __107__NSKeyedArchiver_ICUserIdentity__ic_archivedDataWithRootUserIdentity_inStore_requiringSecureCoding_error___block_invoke;
  v15[3] = &unk_1E5AC7828;
  v17 = &v27;
  uint64_t v19 = a1;
  id v12 = v10;
  char v20 = a5;
  id v16 = v12;
  v18 = &v21;
  [v12 _performEncodingTaskUsingSpecificIdentityStore:v11 encodingHandler:v15];
  if (a6) {
    *a6 = (id) v22[5];
  }
  id v13 = (id)v28[5];

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v13;
}

@end
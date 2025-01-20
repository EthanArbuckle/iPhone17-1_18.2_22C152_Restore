@interface NSCoder(ICUserIdentity)
- (void)ic_encodeUserIdentity:()ICUserIdentity withStore:forKey:;
@end

@implementation NSCoder(ICUserIdentity)

- (void)ic_encodeUserIdentity:()ICUserIdentity withStore:forKey:
{
  id v8 = a3;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __66__NSCoder_ICUserIdentity__ic_encodeUserIdentity_withStore_forKey___block_invoke;
  v12[3] = &unk_1E5ACD5C8;
  v12[4] = a1;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [v11 _performEncodingTaskUsingSpecificIdentityStore:a4 encodingHandler:v12];
}

@end
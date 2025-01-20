@interface FCMescalSignature
+ (void)signatureFromData:(id)a3 completion:(id)a4;
@end

@implementation FCMescalSignature

+ (void)signatureFromData:(id)a3 completion:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a3;
  v7 = +[FCAMSBag bag];
  id v8 = v6;
  v9 = (const void *)[v8 bytes];
  CC_LONG v10 = [v8 length];

  CC_SHA1(v9, v10, md);
  v11 = [MEMORY[0x1E4F1C9B8] dataWithBytes:md length:20];
  v12 = [MEMORY[0x1E4F4DD50] signaturePromiseFromData:v11 type:1 bag:v7];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __50__FCMescalSignature_signatureFromData_completion___block_invoke;
  v14[3] = &unk_1E5B54240;
  id v15 = v5;
  id v13 = v5;
  [v12 addFinishBlock:v14];
}

void __50__FCMescalSignature_signatureFromData_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  if (v6)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __50__FCMescalSignature_signatureFromData_completion___block_invoke_2;
    v10[3] = &unk_1E5B4CC80;
    id v11 = v6;
    id v12 = *(id *)(a1 + 32);
    __50__FCMescalSignature_signatureFromData_completion___block_invoke_2((uint64_t)v10);
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 32);
    if (v8)
    {
      v9 = [v5 base64EncodedStringWithOptions:0];
      (*(void (**)(uint64_t, void *, void))(v8 + 16))(v8, v9, 0);
    }
  }
}

uint64_t __50__FCMescalSignature_signatureFromData_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = FCDefaultLog;
  if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v4;
    _os_log_error_impl(&dword_1A460D000, v2, OS_LOG_TYPE_ERROR, "Mescal signing failed to sign data with error: %{public}@", (uint8_t *)&v5, 0xCu);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, *(void *)(a1 + 32));
  }
  return result;
}

@end
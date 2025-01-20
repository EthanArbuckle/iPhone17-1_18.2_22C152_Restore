@interface NSException(NSErrorConverting)
- (id)error;
@end

@implementation NSException(NSErrorConverting)

- (id)error
{
  v16[3] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F28C58]);
  v3 = [a1 name];
  uint64_t v4 = *MEMORY[0x1E4F28A50];
  v16[0] = a1;
  uint64_t v5 = *MEMORY[0x1E4F28228];
  v15[0] = v4;
  v15[1] = v5;
  uint64_t v6 = [a1 userInfo];
  v7 = (void *)v6;
  uint64_t v8 = MEMORY[0x1E4F1CC08];
  if (v6) {
    uint64_t v8 = v6;
  }
  v16[1] = v8;
  v15[2] = *MEMORY[0x1E4F28578];
  uint64_t v9 = [a1 reason];
  v10 = (void *)v9;
  v11 = &stru_1F03A51F0;
  if (v9) {
    v11 = (__CFString *)v9;
  }
  v16[2] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:3];
  v13 = (void *)[v2 initWithDomain:v3 code:0 userInfo:v12];

  return v13;
}

@end
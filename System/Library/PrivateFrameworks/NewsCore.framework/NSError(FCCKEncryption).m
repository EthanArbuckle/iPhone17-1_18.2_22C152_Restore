@interface NSError(FCCKEncryption)
+ (id)fc_encryptionErrorWithCode:()FCCKEncryption description:;
+ (id)fc_encryptionErrorWithCode:()FCCKEncryption descriptionFormat:;
+ (uint64_t)fc_encryptionErrorWithCode:()FCCKEncryption;
@end

@implementation NSError(FCCKEncryption)

+ (uint64_t)fc_encryptionErrorWithCode:()FCCKEncryption
{
  return [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.news.encryption" code:a3 userInfo:0];
}

+ (id)fc_encryptionErrorWithCode:()FCCKEncryption description:
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v5 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v11 = *MEMORY[0x1E4F28568];
  v12[0] = a4;
  v6 = (void *)MEMORY[0x1E4F1C9E8];
  id v7 = a4;
  v8 = [v6 dictionaryWithObjects:v12 forKeys:&v11 count:1];
  v9 = [v5 errorWithDomain:@"com.apple.news.encryption" code:a3 userInfo:v8];

  return v9;
}

+ (id)fc_encryptionErrorWithCode:()FCCKEncryption descriptionFormat:
{
  v18[1] = *MEMORY[0x1E4F143B8];
  v10 = (objc_class *)NSString;
  id v11 = a4;
  v12 = (void *)[[v10 alloc] initWithFormat:v11 arguments:&a9];

  v13 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v17 = *MEMORY[0x1E4F28568];
  v18[0] = v12;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
  v15 = [v13 errorWithDomain:@"com.apple.news.encryption" code:a3 userInfo:v14];

  return v15;
}

@end
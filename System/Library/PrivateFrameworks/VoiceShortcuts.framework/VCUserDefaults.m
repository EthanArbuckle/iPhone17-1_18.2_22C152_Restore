@interface VCUserDefaults
+ (id)sharedUserDefaults;
- (BOOL)setCodableObject:(id)a3 forKey:(id)a4 error:(id *)a5;
- (id)codableObjectOfClass:(Class)a3 forKey:(id)a4;
@end

@implementation VCUserDefaults

+ (id)sharedUserDefaults
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__VCUserDefaults_sharedUserDefaults__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedUserDefaults_once != -1) {
    dispatch_once(&sharedUserDefaults_once, block);
  }
  v2 = (void *)sharedUserDefaults_userDefaults;
  return v2;
}

uint64_t __36__VCUserDefaults_sharedUserDefaults__block_invoke(uint64_t a1)
{
  sharedUserDefaults_userDefaults = [objc_alloc(*(Class *)(a1 + 32)) initWithSuiteName:@"com.apple.siri.VoiceShortcuts"];
  return MEMORY[0x1F41817F8]();
}

- (BOOL)setCodableObject:(id)a3 forKey:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  if (v10)
  {
    if (v9) {
      goto LABEL_3;
    }
LABEL_6:
    v11 = 0;
    goto LABEL_7;
  }
  v13 = [MEMORY[0x1E4F28B00] currentHandler];
  [v13 handleFailureInMethod:a2, self, @"VCUserDefaults.m", 44, @"Invalid parameter not satisfying: %@", @"key" object file lineNumber description];

  if (!v9) {
    goto LABEL_6;
  }
LABEL_3:
  v11 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v9 requiringSecureCoding:1 error:a5];
  if (v11)
  {
LABEL_7:
    [(VCUserDefaults *)self setObject:v11 forKey:v10];

    BOOL v12 = 1;
    goto LABEL_8;
  }
  BOOL v12 = 0;
LABEL_8:

  return v12;
}

- (id)codableObjectOfClass:(Class)a3 forKey:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if (!v7)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"VCUserDefaults.m", 28, @"Invalid parameter not satisfying: %@", @"key" object file lineNumber description];
  }
  v8 = [(VCUserDefaults *)self objectForKey:v7];
  if (v8)
  {
    id v14 = 0;
    id v9 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:a3 fromData:v8 error:&v14];
    id v10 = v14;
    if (!v9)
    {
      v11 = getWFGeneralLogObject();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v16 = "-[VCUserDefaults codableObjectOfClass:forKey:]";
        __int16 v17 = 2112;
        id v18 = v7;
        __int16 v19 = 2112;
        id v20 = v10;
        _os_log_impl(&dword_1C7D7E000, v11, OS_LOG_TYPE_ERROR, "%s Failed to unarchive object for key (%@) with Error: %@", buf, 0x20u);
      }
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

@end
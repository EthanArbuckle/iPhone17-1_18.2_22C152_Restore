@interface FCIdentityAssetTransformer
+ (id)sharedInstance;
- (BOOL)transformAssetDataFromFilePath:(id)a3 toFilePath:(id)a4 error:(id *)a5;
@end

@implementation FCIdentityAssetTransformer

+ (id)sharedInstance
{
  if (qword_1EB5D13B0 != -1) {
    dispatch_once(&qword_1EB5D13B0, &__block_literal_global_63);
  }
  v2 = (void *)_MergedGlobals_166;
  return v2;
}

uint64_t __44__FCIdentityAssetTransformer_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(FCIdentityAssetTransformer);
  uint64_t v1 = _MergedGlobals_166;
  _MergedGlobals_166 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (BOOL)transformAssetDataFromFilePath:(id)a3 toFilePath:(id)a4 error:(id *)a5
{
  v7 = (void *)MEMORY[0x1E4F28CB8];
  id v8 = a4;
  id v9 = a3;
  v10 = [v7 defaultManager];
  v11 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v9];

  v12 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v8];

  LOBYTE(a5) = [v10 copyItemAtURL:v11 toURL:v12 error:a5];
  return (char)a5;
}

@end
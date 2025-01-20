@interface PCSSyncingSetupInterface
@end

@implementation PCSSyncingSetupInterface

Class ___PCSSyncingSetupInterface_block_invoke()
{
  v24[2] = *MEMORY[0x1E4F143B8];
  if (initCloudKit_onceToken != -1) {
    dispatch_once(&initCloudKit_onceToken, &__block_literal_global_303);
  }
  v0 = (void (*)(void))dlsym((void *)cloudKit, "CKAcceptableValueClasses");
  if (!v0) {
    PCSAbort("symbol %s is missing", v1, v2, v3, v4, v5, v6, v7, (char)"CKAcceptableValueClasses");
  }
  v8 = v0;
  v9 = (void *)MEMORY[0x1E4F1CAD0];
  v24[0] = objc_opt_class();
  v24[1] = objc_opt_class();
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
  uint64_t v11 = [v9 setWithArray:v10];
  v12 = (void *)_PCSSyncingSetupInterface_keyClasses;
  _PCSSyncingSetupInterface_keyClasses = v11;

  v13 = (void *)MEMORY[0x1E4F1CA80];
  v14 = v8();
  uint64_t v15 = [v13 setWithSet:v14];
  v16 = (void *)_PCSSyncingSetupInterface_errClasses;
  _PCSSyncingSetupInterface_errClasses = v15;

  v17 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v23 = objc_opt_class();
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
  uint64_t v19 = [v17 setWithArray:v18];
  v20 = (void *)_PCSSyncingSetupInterface_statsClasses;
  _PCSSyncingSetupInterface_statsClasses = v19;

  for (uint64_t i = 0; i != 5; ++i)
  {
    Class result = objc_getClass(off_1E5E6F040[i]);
    if (result) {
      Class result = (Class)[(id)_PCSSyncingSetupInterface_errClasses addObject:result];
    }
  }
  return result;
}

@end
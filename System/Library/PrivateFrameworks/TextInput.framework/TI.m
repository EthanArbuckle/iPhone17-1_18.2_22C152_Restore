@interface TI
@end

@implementation TI

uint64_t __TI_filteredSetWithClass_block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

void __TI_USER_DIRECTORY_block_invoke()
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  v0 = (void (*)(void))getCPSharedResourcesDirectorySymbolLoc_ptr;
  v8 = getCPSharedResourcesDirectorySymbolLoc_ptr;
  if (!getCPSharedResourcesDirectorySymbolLoc_ptr)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __getCPSharedResourcesDirectorySymbolLoc_block_invoke;
    v4[3] = &unk_1E555A528;
    v4[4] = &v5;
    __getCPSharedResourcesDirectorySymbolLoc_block_invoke((uint64_t)v4);
    v0 = (void (*)(void))v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (v0)
  {
    v1 = v0();
    uint64_t v2 = [v1 stringByAppendingPathComponent:@"/Library"];

    TI_USER_DIRECTORY_default_user_directory = v2;
  }
  else
  {
    dlerror();
    uint64_t v3 = abort_report_np();
    __getCPSharedResourcesDirectorySymbolLoc_block_invoke(v3);
  }
}

@end
@interface KSUserWordsWereDownloadedFilesKeySymbolLoc
@end

@implementation KSUserWordsWereDownloadedFilesKeySymbolLoc

void *__get_KSUserWordsWereDownloadedFilesKeySymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)KeyboardServicesLibrary();
  result = dlsym(v2, "_KSUserWordsWereDownloadedFilesKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  get_KSUserWordsWereDownloadedFilesKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end
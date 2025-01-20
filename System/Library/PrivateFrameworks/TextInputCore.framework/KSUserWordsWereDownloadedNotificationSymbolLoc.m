@interface KSUserWordsWereDownloadedNotificationSymbolLoc
@end

@implementation KSUserWordsWereDownloadedNotificationSymbolLoc

void *__get_KSUserWordsWereDownloadedNotificationSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)KeyboardServicesLibrary();
  result = dlsym(v2, "_KSUserWordsWereDownloadedNotification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  get_KSUserWordsWereDownloadedNotificationSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end
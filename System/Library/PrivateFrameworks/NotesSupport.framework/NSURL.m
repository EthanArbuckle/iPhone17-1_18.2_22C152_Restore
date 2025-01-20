@interface NSURL
@end

@implementation NSURL

void __46__NSURL_IC__ic_updateFlagToExcludeFromBackup___block_invoke()
{
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  attr = dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_BACKGROUND, 0);

  dispatch_queue_t v1 = dispatch_queue_create("com.apple.notes.url.exclude-from-backup", attr);
  v2 = (void *)ic_updateFlagToExcludeFromBackup__excludeFromBackupQueue;
  ic_updateFlagToExcludeFromBackup__excludeFromBackupQueue = (uint64_t)v1;
}

uint64_t __46__NSURL_IC__ic_updateFlagToExcludeFromBackup___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "ic_updateFlagToExcludeFromBackupNow:", *(unsigned __int8 *)(a1 + 40));
}

@end
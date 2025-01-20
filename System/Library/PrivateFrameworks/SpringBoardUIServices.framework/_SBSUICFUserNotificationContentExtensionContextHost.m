@interface _SBSUICFUserNotificationContentExtensionContextHost
+ (id)_allowedItemPayloadClasses;
@end

@implementation _SBSUICFUserNotificationContentExtensionContextHost

+ (id)_allowedItemPayloadClasses
{
  if (_allowedItemPayloadClasses_onceToken != -1) {
    dispatch_once(&_allowedItemPayloadClasses_onceToken, &__block_literal_global_15);
  }
  v2 = (void *)_allowedItemPayloadClasses_allowedItemPayloadClasses;
  return v2;
}

@end
@interface SBSUICFUserNotificationContentExtensionContextHost
@end

@implementation SBSUICFUserNotificationContentExtensionContextHost

void __81___SBSUICFUserNotificationContentExtensionContextHost__allowedItemPayloadClasses__block_invoke()
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v4 count:7];
  uint64_t v2 = objc_msgSend(v0, "setWithArray:", v1, v4, v5, v6, v7, v8, v9);
  v3 = (void *)_allowedItemPayloadClasses_allowedItemPayloadClasses;
  _allowedItemPayloadClasses_allowedItemPayloadClasses = v2;
}

@end
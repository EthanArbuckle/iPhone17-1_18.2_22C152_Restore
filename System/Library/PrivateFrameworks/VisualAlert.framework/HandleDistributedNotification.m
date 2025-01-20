@interface HandleDistributedNotification
@end

@implementation HandleDistributedNotification

void ___HandleDistributedNotification_block_invoke(void *a1)
{
  id v6 = +[VISAXNotificationHandler _safelyGetObserverForIdentifier:a1[4]];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = a1[7];
  if (isKindOfClass) {
    [v6 _handleForwardDistributedNotificationWithName:v3 object:v4 userInfo:v5];
  }
  else {
    [v6 _handleNotificationWithName:v3 object:v4 userInfo:v5];
  }
}

@end
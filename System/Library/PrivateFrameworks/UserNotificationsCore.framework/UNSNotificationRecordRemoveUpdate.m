@interface UNSNotificationRecordRemoveUpdate
+ (id)updateWithNotificationRecord:(id)a3 shouldSync:(BOOL)a4;
@end

@implementation UNSNotificationRecordRemoveUpdate

+ (id)updateWithNotificationRecord:(id)a3 shouldSync:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)a1) _initWithNotificationRecord:v6 shouldSync:v4];

  return v7;
}

@end
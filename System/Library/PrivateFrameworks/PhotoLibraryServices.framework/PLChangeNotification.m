@interface PLChangeNotification
+ (id)notificationWithName:(id)a3 object:(id)a4 userInfo:(id)a5;
- (PLChangeNotificationCenter)changeNotificationCenter;
@end

@implementation PLChangeNotification

+ (id)notificationWithName:(id)a3 object:(id)a4 userInfo:(id)a5
{
  v7 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4, a5);
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"PLChangeNotification.m", 24, @"Cannot create a PLChangeNotification via %s", "+[PLChangeNotification notificationWithName:object:userInfo:]");

  id v8 = objc_alloc_init((Class)a1);
  return v8;
}

- (PLChangeNotificationCenter)changeNotificationCenter
{
  return (PLChangeNotificationCenter *)+[PLChangeNotificationCenter defaultCenter];
}

@end
@interface PushNotification
+ (id)entityFromContext:(id)a3;
@end

@implementation PushNotification

+ (id)entityFromContext:(id)a3
{
  id v3 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "persistentStoreCoordinator"), "managedObjectModel"), "entitiesByName");

  return [v3 objectForKey:@"PushNotification"];
}

@end
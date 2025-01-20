@interface UNNotificationContactService
@end

@implementation UNNotificationContactService

void __47___UNNotificationContactService_sharedInstance__block_invoke()
{
  v0 = [_UNNotificationContactService alloc];
  v3 = objc_alloc_init(_UNCNContactResolver);
  uint64_t v1 = [(_UNNotificationContactService *)v0 initWithResolver:v3];
  v2 = (void *)sharedInstance___sharedInstance;
  sharedInstance___sharedInstance = v1;
}

@end
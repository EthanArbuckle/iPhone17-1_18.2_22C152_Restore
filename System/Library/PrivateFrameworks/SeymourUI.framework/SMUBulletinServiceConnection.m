@interface SMUBulletinServiceConnection
+ (id)sharedBulletinService;
@end

@implementation SMUBulletinServiceConnection

+ (id)sharedBulletinService
{
  if (sharedBulletinService_onceToken[0] != -1) {
    dispatch_once(sharedBulletinService_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)sharedBulletinService_service;

  return v2;
}

void __53__SMUBulletinServiceConnection_sharedBulletinService__block_invoke()
{
  id v0 = [[SMUBulletinService alloc] initNoop];
  v1 = (void *)sharedBulletinService_service;
  sharedBulletinService_service = (uint64_t)v0;
}

@end
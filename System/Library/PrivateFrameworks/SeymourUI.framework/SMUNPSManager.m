@interface SMUNPSManager
- (SMUNPSManager)init;
- (void)synchronizeNanoDomain:(id)a3 keys:(id)a4;
@end

@implementation SMUNPSManager

- (SMUNPSManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)SMUNPSManager;
  v2 = [(SMUNPSManager *)&v6 init];
  if (v2)
  {
    v3 = (NPSManager *)objc_alloc_init(MEMORY[0x263F57528]);
    syncManager = v2->_syncManager;
    v2->_syncManager = v3;
  }
  return v2;
}

- (void)synchronizeNanoDomain:(id)a3 keys:(id)a4
{
}

- (void).cxx_destruct
{
}

@end
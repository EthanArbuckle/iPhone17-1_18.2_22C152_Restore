@interface RTCameraManager
+ (RTCameraManager)allocWithZone:(_NSZone *)a3;
- (void)_shutdownWithHandler:(id)a3;
@end

@implementation RTCameraManager

uint64_t __58__RTCameraManager_Embedded_handleCameraPowerNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleCameraPowerNotification:*(void *)(a1 + 40)];
}

void __53__RTCameraManager_Embedded_internalAddObserver_name___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained handleCameraPowerNotification:@"com.apple.isp.backcamerapower"];
}

void __53__RTCameraManager_Embedded_internalAddObserver_name___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained handleCameraPowerNotification:@"com.apple.isp.frontcamerapower"];
}

+ (RTCameraManager)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1)
  {
    return (RTCameraManager *)+[RTCameraManager allocWithZone:a3];
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___RTCameraManager;
    return (RTCameraManager *)[super allocWithZone:a3];
  }
}

- (void)_shutdownWithHandler:(id)a3
{
  if (a3) {
    (*((void (**)(id, void))a3 + 2))(a3, 0);
  }
}

@end
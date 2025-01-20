@interface MRTelevisionController
+ (Class)externalDeviceClass;
- (MRTelevisionController)init;
- (_MRTelevisionControllerBlockCallback)discoveryCallback;
- (_MRTelevisionControllerBlockCallback)removalCallback;
- (void)externalDeviceController:(id)a3 didDiscoverDevice:(id)a4;
- (void)externalDeviceController:(id)a3 didRemoveDevice:(id)a4;
- (void)setDiscoveryCallback:(id)a3;
- (void)setRemovalCallback:(id)a3;
@end

@implementation MRTelevisionController

- (void)externalDeviceController:(id)a3 didDiscoverDevice:(id)a4
{
  id v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"MRTelevisionController.m" lineNumber:71 description:@"Got a non-television device from a television bonjour service."];
  }
  id v7 = v6;
  discoveryCallback = self->_discoveryCallback;
  if (discoveryCallback)
  {
    v9 = [(_MRTelevisionControllerBlockCallback *)discoveryCallback queue];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __69__MRTelevisionController_externalDeviceController_didDiscoverDevice___block_invoke;
    v11[3] = &unk_1E57D0790;
    v11[4] = self;
    id v12 = v7;
    dispatch_async(v9, v11);
  }
}

- (MRTelevisionController)init
{
  v5.receiver = self;
  v5.super_class = (Class)MRTelevisionController;
  v2 = [(MRExternalDeviceController *)&v5 initWithBonjourServiceType:@"_mediaremotetv._tcp."];
  v3 = v2;
  if (v2) {
    [(MRExternalDeviceController *)v2 setDelegate:v2];
  }
  return v3;
}

+ (Class)externalDeviceClass
{
  return (Class)objc_opt_class();
}

void __69__MRTelevisionController_externalDeviceController_didDiscoverDevice___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 72) callbackBlock];
  v2[2](v2, *(void *)(a1 + 40));
}

- (void)externalDeviceController:(id)a3 didRemoveDevice:(id)a4
{
  id v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"MRTelevisionController.m" lineNumber:83 description:@"Got a non-television device from a television bonjour service."];
  }
  id v7 = v6;
  removalCallback = self->_removalCallback;
  if (removalCallback)
  {
    v9 = [(_MRTelevisionControllerBlockCallback *)removalCallback queue];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __67__MRTelevisionController_externalDeviceController_didRemoveDevice___block_invoke;
    v11[3] = &unk_1E57D0790;
    v11[4] = self;
    id v12 = v7;
    dispatch_async(v9, v11);
  }
}

void __67__MRTelevisionController_externalDeviceController_didRemoveDevice___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 80) callbackBlock];
  v2[2](v2, *(void *)(a1 + 40));
}

- (_MRTelevisionControllerBlockCallback)discoveryCallback
{
  return self->_discoveryCallback;
}

- (void)setDiscoveryCallback:(id)a3
{
}

- (_MRTelevisionControllerBlockCallback)removalCallback
{
  return self->_removalCallback;
}

- (void)setRemovalCallback:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removalCallback, 0);

  objc_storeStrong((id *)&self->_discoveryCallback, 0);
}

@end
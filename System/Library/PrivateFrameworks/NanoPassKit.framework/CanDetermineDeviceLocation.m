@interface CanDetermineDeviceLocation
@end

@implementation CanDetermineDeviceLocation

void ___CanDetermineDeviceLocation_block_invoke(uint64_t a1)
{
  int v2 = [MEMORY[0x263F00A60] locationServicesEnabled];
  char v3 = v2;
  if (v2)
  {
    v4 = (void *)MEMORY[0x263F00A60];
    v5 = PKPassKitCoreBundle();
    int v6 = [v4 authorizationStatusForBundle:v5];
  }
  else
  {
    int v6 = 2;
  }
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = ___CanDetermineDeviceLocation_block_invoke_2;
  v7[3] = &unk_2644D54D8;
  char v10 = v3;
  int v9 = v6;
  id v8 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

uint64_t ___CanDetermineDeviceLocation_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end
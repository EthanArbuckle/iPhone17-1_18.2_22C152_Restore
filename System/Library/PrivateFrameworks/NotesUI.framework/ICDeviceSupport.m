@interface ICDeviceSupport
@end

@implementation ICDeviceSupport

void __40__ICDeviceSupport_UI__isCameraAvailable__block_invoke_2(uint64_t a1)
{
  v3[1] = *MEMORY[0x1E4F143B8];
  isCameraAvailable_isCameraAvailable = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  v3[0] = @"cameraRestriction";
  [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];
  id v2 = *(id *)(a1 + 32);
  MGRegisterForUpdates();
}

uint64_t __40__ICDeviceSupport_UI__isCameraAvailable__block_invoke()
{
  int v0 = [MEMORY[0x1E4FB1828] isSourceTypeAvailable:1];
  v1 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int v2 = [v1 BOOLForKey:*MEMORY[0x1E4F83878]];

  return v0 & (v2 ^ 1u);
}

uint64_t __40__ICDeviceSupport_UI__isCameraAvailable__block_invoke_3(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  isCameraAvailable_isCameraAvailable = result;
  return result;
}

@end
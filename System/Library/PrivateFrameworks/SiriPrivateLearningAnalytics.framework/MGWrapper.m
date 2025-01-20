@interface MGWrapper
+ (id)sharedMGWrapper;
- (BOOL)isDeviceIPad;
- (BOOL)isDeviceIPhone;
- (id)deviceClass;
@end

@implementation MGWrapper

+ (id)sharedMGWrapper
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__MGWrapper_sharedMGWrapper__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedMGWrapper_onceToken != -1) {
    dispatch_once(&sharedMGWrapper_onceToken, block);
  }
  v2 = (void *)sharedMGWrapper_sharedMGWrapper;
  return v2;
}

void __28__MGWrapper_sharedMGWrapper__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedMGWrapper_sharedMGWrapper;
  sharedMGWrapper_sharedMGWrapper = (uint64_t)v1;
}

- (id)deviceClass
{
  v2 = (void *)MGCopyAnswer();
  return v2;
}

- (BOOL)isDeviceIPad
{
  v2 = [(MGWrapper *)self deviceClass];
  char v3 = [v2 isEqualToString:@"iPad"];

  return v3;
}

- (BOOL)isDeviceIPhone
{
  v2 = [(MGWrapper *)self deviceClass];
  char v3 = [v2 isEqualToString:@"iPhone"];

  return v3;
}

@end
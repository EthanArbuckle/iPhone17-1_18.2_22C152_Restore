@interface MetalDeviceInfo
+ (id)sharedInfo;
- (BOOL)supportXR10;
- (BOOL)supportXR10ForDevice:(id)a3;
- (unint64_t)defaultResourceOptionForDevice:(id)a3;
- (unint64_t)defaultStorageModeForDevice:(id)a3;
@end

@implementation MetalDeviceInfo

+ (id)sharedInfo
{
  id v2 = a1;
  objc_sync_enter(v2);
  if (!sharedDeviceInfo)
  {
    v7.receiver = v2;
    v7.super_class = (Class)&OBJC_METACLASS___MetalDeviceInfo;
    uint64_t v3 = objc_msgSend(objc_msgSendSuper2(&v7, sel_alloc), "init");
    v4 = (void *)sharedDeviceInfo;
    sharedDeviceInfo = v3;
  }
  objc_sync_exit(v2);

  v5 = (void *)sharedDeviceInfo;
  return v5;
}

- (unint64_t)defaultStorageModeForDevice:(id)a3
{
  return 0;
}

- (unint64_t)defaultResourceOptionForDevice:(id)a3
{
  return 0;
}

- (BOOL)supportXR10ForDevice:(id)a3
{
  return 1;
}

- (BOOL)supportXR10
{
  return 1;
}

@end
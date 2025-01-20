@interface ICDeviceSupport(UI)
+ (BOOL)isLargerCompactHorizontalWidthDevice;
+ (uint64_t)isCameraAvailable;
@end

@implementation ICDeviceSupport(UI)

+ (uint64_t)isCameraAvailable
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__ICDeviceSupport_UI__isCameraAvailable__block_invoke_2;
  block[3] = &unk_1E5FD9320;
  id v3 = &__block_literal_global_73;
  if (isCameraAvailable_onceToken[0] != -1) {
    dispatch_once(isCameraAvailable_onceToken, block);
  }
  uint64_t v0 = isCameraAvailable_isCameraAvailable;

  return v0;
}

+ (BOOL)isLargerCompactHorizontalWidthDevice
{
  if (objc_msgSend(MEMORY[0x1E4FB16C8], "ic_isiPad")) {
    return 0;
  }
  v1 = +[ICUIApplicationShim sharedInstance];
  v2 = [v1 keyWindow];

  id v3 = [v2 traitCollection];
  uint64_t v4 = [v3 horizontalSizeClass];

  [v2 bounds];
  BOOL v0 = CGRectGetWidth(v7) > 667.0 && v4 == 1;

  return v0;
}

@end
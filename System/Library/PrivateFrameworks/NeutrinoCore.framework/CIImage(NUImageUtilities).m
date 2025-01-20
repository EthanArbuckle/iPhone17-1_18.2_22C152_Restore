@interface CIImage(NUImageUtilities)
+ (id)imageWithNUImageBuffer:()NUImageUtilities;
@end

@implementation CIImage(NUImageUtilities)

+ (id)imageWithNUImageBuffer:()NUImageUtilities
{
  id v3 = a3;
  v4 = objc_getAssociatedObject(v3, NUImageUtilitiesCIImageKey);
  if (!v4)
  {
    v4 = objc_msgSend(MEMORY[0x1E4F1E050], "imageWithCVPixelBuffer:", objc_msgSend(v3, "CVPixelBuffer"));
    objc_setAssociatedObject(v3, NUImageUtilitiesCIImageKey, v4, (void *)0x301);
  }

  return v4;
}

@end
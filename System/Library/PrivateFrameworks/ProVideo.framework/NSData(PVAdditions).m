@interface NSData(PVAdditions)
+ (__CVBuffer)pv_dataWithPixelBuffer:()PVAdditions;
- (BOOL)pv_writeToPixelBuffer:()PVAdditions;
@end

@implementation NSData(PVAdditions)

- (BOOL)pv_writeToPixelBuffer:()PVAdditions
{
  if (!a3) {
    return 0;
  }
  size_t v5 = [a1 length];
  if (v5 > CVPixelBufferGetDataSize(a3) || CVPixelBufferLockBaseAddress(a3, 0)) {
    return 0;
  }
  [a1 getBytes:CVPixelBufferGetBaseAddress(a3) length:v5];
  return CVPixelBufferUnlockBaseAddress(a3, 0) == 0;
}

+ (__CVBuffer)pv_dataWithPixelBuffer:()PVAdditions
{
  v3 = a3;
  if (a3)
  {
    size_t DataSize = CVPixelBufferGetDataSize(a3);
    if (DataSize && (size_t v5 = DataSize, !CVPixelBufferLockBaseAddress(v3, 1uLL)))
    {
      v6 = [MEMORY[0x1E4F1C9B8] dataWithBytes:CVPixelBufferGetBaseAddress(v3) length:v5];
      if (CVPixelBufferUnlockBaseAddress(v3, 1uLL)) {
        v3 = 0;
      }
      else {
        v3 = v6;
      }
    }
    else
    {
      v3 = 0;
    }
  }

  return v3;
}

@end
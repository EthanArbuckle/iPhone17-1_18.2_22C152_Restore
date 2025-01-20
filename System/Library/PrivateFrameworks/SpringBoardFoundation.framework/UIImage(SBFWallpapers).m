@interface UIImage(SBFWallpapers)
- (CGImage)sbf_imageHashData;
@end

@implementation UIImage(SBFWallpapers)

- (CGImage)sbf_imageHashData
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  DataProvider = (CGImage *)[a1 CGImage];
  if (DataProvider)
  {
    DataProvider = CGImageGetDataProvider(DataProvider);
    if (DataProvider)
    {
      DataProvider = CGDataProviderCopyData(DataProvider);
      if (DataProvider)
      {
        CFDataRef v2 = DataProvider;
        BytePtr = CFDataGetBytePtr(DataProvider);
        CC_LONG Length = CFDataGetLength(v2);
        CC_SHA1(BytePtr, Length, md);
        CFRelease(v2);
        DataProvider = [MEMORY[0x1E4F1C9B8] dataWithBytes:md length:20];
      }
    }
  }
  return DataProvider;
}

@end
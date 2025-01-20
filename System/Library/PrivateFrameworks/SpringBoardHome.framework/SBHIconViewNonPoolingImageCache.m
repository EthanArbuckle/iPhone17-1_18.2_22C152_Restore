@interface SBHIconViewNonPoolingImageCache
+ (BOOL)supportsMemoryPooling;
@end

@implementation SBHIconViewNonPoolingImageCache

+ (BOOL)supportsMemoryPooling
{
  return 0;
}

@end
@interface _VisionCoreE5RTProgramLibraryBundleModelSource
+ (BOOL)isModelSourceURL:(id)a3;
@end

@implementation _VisionCoreE5RTProgramLibraryBundleModelSource

+ (BOOL)isModelSourceURL:(id)a3
{
  return +[VisionCoreE5RTProgramLibrary isProgramLibraryAtURL:a3];
}

@end
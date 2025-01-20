@interface NSData(PosterUIFoundation)
+ (id)pui_loadImageDataFromFileURL:()PosterUIFoundation error:;
@end

@implementation NSData(PosterUIFoundation)

+ (id)pui_loadImageDataFromFileURL:()PosterUIFoundation error:
{
  if (a3)
  {
    [a3 path];
    uint64_t MappedDataFromPath = CPBitmapCreateMappedDataFromPath();
    v6 = (void *)MappedDataFromPath;
    if (a4 && !MappedDataFromPath) {
      *a4 = 0;
    }
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

@end
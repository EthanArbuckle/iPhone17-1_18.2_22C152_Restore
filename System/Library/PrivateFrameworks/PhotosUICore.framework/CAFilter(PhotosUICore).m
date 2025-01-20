@interface CAFilter(PhotosUICore)
+ (id)px_filterWithPXCompositingFilterType:()PhotosUICore;
@end

@implementation CAFilter(PhotosUICore)

+ (id)px_filterWithPXCompositingFilterType:()PhotosUICore
{
  if (a3 == 1)
  {
    id v3 = (id)*MEMORY[0x1E4F3A078];
    if (v3)
    {
      v4 = [MEMORY[0x1E4F39BC0] filterWithType:v3];
      goto LABEL_6;
    }
  }
  else
  {
    id v3 = 0;
  }
  v4 = 0;
LABEL_6:

  return v4;
}

@end
@interface CADisplayLink(PhotosUICore)
+ (id)px_displayLinkWithWeakTarget:()PhotosUICore selector:;
@end

@implementation CADisplayLink(PhotosUICore)

+ (id)px_displayLinkWithWeakTarget:()PhotosUICore selector:
{
  id v5 = a3;
  v6 = [[_PXDisplayLinkWeakReference alloc] initWithObject:v5 selector:a4];

  v7 = [MEMORY[0x1E4F39B68] displayLinkWithTarget:v6 selector:sel_handleDisplayLink_];

  return v7;
}

@end
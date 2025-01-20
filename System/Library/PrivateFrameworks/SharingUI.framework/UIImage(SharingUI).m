@interface UIImage(SharingUI)
+ (id)sfui_imageNamed:()SharingUI;
@end

@implementation UIImage(SharingUI)

+ (id)sfui_imageNamed:()SharingUI
{
  v3 = (void *)MEMORY[0x263F086E0];
  id v4 = a3;
  v5 = objc_msgSend(v3, "sfui_bundle");
  v6 = [MEMORY[0x263F827E8] imageNamed:v4 inBundle:v5];

  return v6;
}

@end
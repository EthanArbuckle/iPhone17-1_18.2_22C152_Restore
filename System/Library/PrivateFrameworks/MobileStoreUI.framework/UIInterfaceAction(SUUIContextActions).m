@interface UIInterfaceAction(SUUIContextActions)
+ (id)actionWithTitle:()SUUIContextActions resource:handler:;
@end

@implementation UIInterfaceAction(SUUIContextActions)

+ (id)actionWithTitle:()SUUIContextActions resource:handler:
{
  v7 = (void *)MEMORY[0x263F82848];
  id v8 = a4;
  v9 = [v7 actionWithTitle:a3 type:0 handler:a5];
  [v9 setTitleAlignment:4];
  v10 = [v8 _imageThatSuppressesAccessibilityHairlineThickening];

  [v10 size];
  v12 = objc_msgSend(v10, "imageWithAlignmentRectInsets:", (56.0 - v11) * -0.5, 0.0, (56.0 - v11) * -0.5, 0.0);
  [v9 setTrailingImage:v12];

  return v9;
}

@end
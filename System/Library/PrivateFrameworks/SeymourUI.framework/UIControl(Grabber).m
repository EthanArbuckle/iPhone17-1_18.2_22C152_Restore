@interface UIControl(Grabber)
+ (id)grabberView;
@end

@implementation UIControl(Grabber)

+ (id)grabberView
{
  id v0 = objc_alloc_init(MEMORY[0x263F82F90]);

  return v0;
}

@end
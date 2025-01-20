@interface RBNullDevice
+ (RBNullDevice)sharedDevice;
- (CGImage)renderImageInRect:(CGRect)a3 options:(id)a4 renderer:(id)a5;
- (void)renderImageInRect:(CGRect)a3 options:(id)a4 renderer:(id)a5 completionQueue:(id)a6 handler:(id)a7;
@end

@implementation RBNullDevice

+ (RBNullDevice)sharedDevice
{
  {
    +[RBNullDevice sharedDevice]::device = objc_opt_new();
  }
  return (RBNullDevice *)+[RBNullDevice sharedDevice]::device;
}

- (CGImage)renderImageInRect:(CGRect)a3 options:(id)a4 renderer:(id)a5
{
  return (CGImage *)render_image(0, a4, (uint64_t)a5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)renderImageInRect:(CGRect)a3 options:(id)a4 renderer:(id)a5 completionQueue:(id)a6 handler:(id)a7
{
}

@end
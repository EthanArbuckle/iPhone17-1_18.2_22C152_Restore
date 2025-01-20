@interface ICSDefaultIconLoader
+ (id)iconWithType:(int64_t)a3 size:(CGSize)a4 drawBorder:(BOOL)a5;
+ (id)tableIconWithType:(int64_t)a3 drawBorder:(BOOL)a4;
- (ICSDefaultIconLoader)init;
@end

@implementation ICSDefaultIconLoader

+ (id)iconWithType:(int64_t)a3 size:(CGSize)a4 drawBorder:(BOOL)a5
{
  v5 = (void *)_s14iCloudSettings17DefaultIconLoaderC4icon4type4size10drawBorderSo7UIImageCAA16ICSIconUTTypeKeyO_So6CGSizeVSbtFZ_0(a3, a5, a4.width, a4.height);

  return v5;
}

+ (id)tableIconWithType:(int64_t)a3 drawBorder:(BOOL)a4
{
  v4 = (void *)_s14iCloudSettings17DefaultIconLoaderC05tableD04type10drawBorderSo7UIImageCAA16ICSIconUTTypeKeyO_SbtFZ_0(a3, a4);

  return v4;
}

- (ICSDefaultIconLoader)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(ICSDefaultIconLoader *)&v3 init];
}

@end
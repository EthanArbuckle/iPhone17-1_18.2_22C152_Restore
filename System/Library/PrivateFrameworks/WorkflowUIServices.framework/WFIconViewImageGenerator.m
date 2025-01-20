@interface WFIconViewImageGenerator
+ (id)loadIcon:(id)a3 size:(CGSize)a4 style:(int64_t)a5;
- (WFIconViewImageGenerator)init;
@end

@implementation WFIconViewImageGenerator

+ (id)loadIcon:(id)a3 size:(CGSize)a4 style:(int64_t)a5
{
  double height = a4.height;
  double width = a4.width;
  id v8 = a3;
  id v9 = sub_217825D30(v8, a5, width, height);

  return v9;
}

- (WFIconViewImageGenerator)init
{
  return (WFIconViewImageGenerator *)WFIconViewImageGenerator.init()();
}

@end
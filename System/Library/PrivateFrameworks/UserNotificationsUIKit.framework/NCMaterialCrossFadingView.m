@interface NCMaterialCrossFadingView
+ (Class)layerClass;
- (NCMaterialCrossFadingView)init;
@end

@implementation NCMaterialCrossFadingView

- (NCMaterialCrossFadingView)init
{
  v6.receiver = self;
  v6.super_class = (Class)NCMaterialCrossFadingView;
  v2 = [(NCMaterialCrossFadingView *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v4 = [(NCMaterialCrossFadingView *)v2 layer];
    [v4 setAllowsInPlaceFiltering:1];
  }
  return v3;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

@end
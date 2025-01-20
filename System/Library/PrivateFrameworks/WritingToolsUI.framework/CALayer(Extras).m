@interface CALayer(Extras)
+ (id)layerWithName:()Extras;
@end

@implementation CALayer(Extras)

+ (id)layerWithName:()Extras
{
  id v3 = a3;
  v4 = [(id)objc_opt_class() layer];
  [v4 setName:v3];

  return v4;
}

@end
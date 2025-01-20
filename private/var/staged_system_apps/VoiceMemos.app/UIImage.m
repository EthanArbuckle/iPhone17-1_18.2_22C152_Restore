@interface UIImage
+ (id)templateImageNamed:(id)a3;
@end

@implementation UIImage

+ (id)templateImageNamed:(id)a3
{
  v3 = +[UIImage imageNamed:a3];
  v4 = [v3 imageWithRenderingMode:2];

  return v4;
}

@end
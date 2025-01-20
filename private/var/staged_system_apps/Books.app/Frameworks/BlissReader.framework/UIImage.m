@interface UIImage
+ (id)th_imageNamed:(id)a3;
@end

@implementation UIImage

+ (id)th_imageNamed:(id)a3
{
  uint64_t v4 = THBundle();

  return +[UIImage imageNamed:a3 inBundle:v4 compatibleWithTraitCollection:0];
}

@end
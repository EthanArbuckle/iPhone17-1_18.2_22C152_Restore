@interface REImage(UIImageExtensions)
+ (REImageImage)imageWithImage:()UIImageExtensions;
- (id)image;
@end

@implementation REImage(UIImageExtensions)

+ (REImageImage)imageWithImage:()UIImageExtensions
{
  id v3 = a3;
  v4 = [[REImageImage alloc] initWithImage:v3];

  return v4;
}

- (id)image
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  id v0 = objc_alloc_init(MEMORY[0x263F1C6B0]);

  return v0;
}

@end
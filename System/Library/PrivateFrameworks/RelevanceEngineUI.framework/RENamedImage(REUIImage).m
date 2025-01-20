@interface RENamedImage(REUIImage)
- (id)image;
@end

@implementation RENamedImage(REUIImage)

- (id)image
{
  v2 = (void *)MEMORY[0x263F1C6B0];
  v3 = [a1 name];
  v4 = [a1 bundle];
  v5 = [v2 imageNamed:v3 inBundle:v4 compatibleWithTraitCollection:0];

  return v5;
}

@end
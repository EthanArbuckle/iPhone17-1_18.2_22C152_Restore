@interface REFileImage(REUIImage)
- (id)image;
@end

@implementation REFileImage(REUIImage)

- (id)image
{
  v1 = (void *)MEMORY[0x263F1C6B0];
  v2 = [a1 path];
  v3 = [v1 imageWithContentsOfFile:v2];

  return v3;
}

@end
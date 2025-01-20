@interface REDataImage(REUIImage)
- (id)image;
@end

@implementation REDataImage(REUIImage)

- (id)image
{
  [a1 scale];
  double v3 = v2;
  if (v2 < 1.0)
  {
    v4 = [MEMORY[0x263F1C920] mainScreen];
    [v4 scale];
    double v3 = v5;
  }
  v6 = (void *)MEMORY[0x263F1C6B0];
  v7 = [a1 data];
  v8 = [v6 imageWithData:v7 scale:v3];

  return v8;
}

@end
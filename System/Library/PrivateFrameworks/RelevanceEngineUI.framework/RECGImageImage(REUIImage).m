@interface RECGImageImage(REUIImage)
- (uint64_t)image;
@end

@implementation RECGImageImage(REUIImage)

- (uint64_t)image
{
  v1 = (void *)MEMORY[0x263F1C6B0];
  id v2 = a1;
  uint64_t v3 = [v2 CGImage];
  [v2 scale];

  return objc_msgSend(v1, "imageWithCGImage:scale:orientation:", v3, 0);
}

@end
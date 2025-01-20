@interface ACM_AppleLogo_2x_PNG
- (id)data;
- (id)image;
@end

@implementation ACM_AppleLogo_2x_PNG

- (id)image
{
  uint64_t v2 = [MEMORY[0x263EFF8F8] dataWithBytes:&ACM_AppleLogo_2x_bytes length:1121];
  v3 = (void *)MEMORY[0x263F1C6B0];

  return (id)[v3 imageWithData:v2];
}

- (id)data
{
  return (id)[MEMORY[0x263EFF8F8] dataWithBytes:&ACM_AppleLogo_2x_bytes length:1121];
}

@end
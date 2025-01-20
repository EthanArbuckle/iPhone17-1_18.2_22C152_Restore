@interface ACM_apple_PNG
- (id)data;
- (id)image;
@end

@implementation ACM_apple_PNG

- (id)image
{
  uint64_t v2 = [MEMORY[0x263EFF8F8] dataWithBytes:&ACM_apple_bytes length:458];
  v3 = (void *)MEMORY[0x263F1C6B0];

  return (id)[v3 imageWithData:v2];
}

- (id)data
{
  return (id)[MEMORY[0x263EFF8F8] dataWithBytes:&ACM_apple_bytes length:458];
}

@end
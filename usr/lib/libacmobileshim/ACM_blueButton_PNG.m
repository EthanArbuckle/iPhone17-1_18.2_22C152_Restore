@interface ACM_blueButton_PNG
- (id)data;
- (id)image;
@end

@implementation ACM_blueButton_PNG

- (id)image
{
  uint64_t v2 = [MEMORY[0x263EFF8F8] dataWithBytes:&ACM_blueButton_bytes length:675];
  v3 = (void *)MEMORY[0x263F1C6B0];

  return (id)[v3 imageWithData:v2];
}

- (id)data
{
  return (id)[MEMORY[0x263EFF8F8] dataWithBytes:&ACM_blueButton_bytes length:675];
}

@end
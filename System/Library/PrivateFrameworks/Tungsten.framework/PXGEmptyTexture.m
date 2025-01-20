@interface PXGEmptyTexture
- (BOOL)isOpaque;
- (CGImage)imageRepresentation;
- (CGSize)pixelSize;
- (int64_t)estimatedByteSize;
- (unsigned)presentationType;
@end

@implementation PXGEmptyTexture

- (CGSize)pixelSize
{
  double v2 = *MEMORY[0x263F001B0];
  double v3 = *(double *)(MEMORY[0x263F001B0] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (unsigned)presentationType
{
  return 0;
}

- (BOOL)isOpaque
{
  return 1;
}

- (CGImage)imageRepresentation
{
  return 0;
}

- (int64_t)estimatedByteSize
{
  return 0;
}

@end
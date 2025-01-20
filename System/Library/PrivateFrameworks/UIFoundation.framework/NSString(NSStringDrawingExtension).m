@interface NSString(NSStringDrawingExtension)
- (double)_sizeWithSize:()NSStringDrawingExtension attributes:;
@end

@implementation NSString(NSStringDrawingExtension)

- (double)_sizeWithSize:()NSStringDrawingExtension attributes:
{
  if (a2 <= 0.0 || a3 <= 0.0) {
    return *MEMORY[0x1E4F28AE0];
  }
  objc_msgSend(a1, "boundingRectWithSize:options:attributes:context:", 1, a5, 0);
  return v5;
}

@end
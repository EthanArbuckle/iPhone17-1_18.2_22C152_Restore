@interface NSAttributedString(NSStringDrawing)
- (__CFString)drawInRect:()NSStringDrawing;
- (double)size;
- (void)drawAtPoint:()NSStringDrawing;
@end

@implementation NSAttributedString(NSStringDrawing)

- (double)size
{
  objc_msgSend(a1, "boundingRectWithSize:options:context:", 1, 0, *MEMORY[0x1E4F28AE0], *(double *)(MEMORY[0x1E4F28AE0] + 8));
  return v1;
}

- (void)drawAtPoint:()NSStringDrawing
{
  double v6 = MEMORY[0x192FAD920](0.15);
  MEMORY[0x192FAD930](0.0);
  _NSStringDrawingCore(a1, 0, 1, 0, a2, a3, 0.0, 0.0, 0.0, v7, 0);
  MEMORY[0x192FAD920](v6);

  JUMPOUT(0x192FAD930);
}

- (__CFString)drawInRect:()NSStringDrawing
{
  if (a4 > 0.0 && a5 > 0.0)
  {
    v9 = result;
    double v10 = MEMORY[0x192FAD920](0.15);
    MEMORY[0x192FAD930](0.0);
    _NSStringDrawingCore(v9, 0, 1, 0, a2, a3, a4, a5, 0.0, v11, 0);
    MEMORY[0x192FAD920](v10);
    JUMPOUT(0x192FAD930);
  }
  return result;
}

@end
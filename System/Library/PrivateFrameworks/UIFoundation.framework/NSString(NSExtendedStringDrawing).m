@interface NSString(NSExtendedStringDrawing)
- (double)boundingRectWithSize:()NSExtendedStringDrawing options:attributes:context:;
- (uint64_t)boundingRectWithSize:()NSExtendedStringDrawing options:attributes:;
- (uint64_t)drawWithRect:()NSExtendedStringDrawing options:attributes:;
- (uint64_t)hasColorGlyphsInRange:()NSExtendedStringDrawing attributes:;
- (void)drawWithRect:()NSExtendedStringDrawing options:attributes:context:;
@end

@implementation NSString(NSExtendedStringDrawing)

- (double)boundingRectWithSize:()NSExtendedStringDrawing options:attributes:context:
{
  double v13 = MEMORY[0x192FAD920](0.15);
  double v14 = MEMORY[0x192FAD930](0.0);
  char v18 = 0;
  if (!a6) {
    a6 = +[NSAttributeDictionary emptyAttributeDictionary];
  }
  double v15 = __NSStringDrawingEngine(a1, a6, a5, 0, a7, 0, &v18, 0.0, 0.0, a2, a3, 0.0);
  uint64_t v16 = MEMORY[0x192FAD920](v13);
  MEMORY[0x192FAD930](v16, v14);
  return v15;
}

- (void)drawWithRect:()NSExtendedStringDrawing options:attributes:context:
{
  double v17 = MEMORY[0x192FAD920](0.15);
  MEMORY[0x192FAD930](0.0);
  if (!a8) {
    a8 = +[NSAttributeDictionary emptyAttributeDictionary];
  }
  _NSStringDrawingCore(a1, a8, a7, 0, a2, a3, a4, a5, 0.0, v18, a9);
  MEMORY[0x192FAD920](v17);

  JUMPOUT(0x192FAD930);
}

- (uint64_t)drawWithRect:()NSExtendedStringDrawing options:attributes:
{
  return objc_msgSend(a1, "drawWithRect:options:attributes:context:", a3, a4, 0);
}

- (uint64_t)boundingRectWithSize:()NSExtendedStringDrawing options:attributes:
{
  return objc_msgSend(a1, "boundingRectWithSize:options:attributes:context:", a3, a4, 0);
}

- (uint64_t)hasColorGlyphsInRange:()NSExtendedStringDrawing attributes:
{
  v8 = (void *)[objc_allocWithZone((Class)_NSCachedAttributedString) initWithString:a1 attributes:a5];
  uint64_t v9 = [v8 copyCachedInstance];
  if (v9)
  {
    v10 = (void *)v9;

    v8 = v10;
  }
  else
  {
    objc_msgSend(v8, "fixAttributesInRange:", a3, a4);
    if (a4 == [a1 length]) {
      [v8 cache];
    }
  }
  uint64_t v11 = objc_msgSend(v8, "hasColorGlyphsInRange:", a3, a4);

  return v11;
}

@end
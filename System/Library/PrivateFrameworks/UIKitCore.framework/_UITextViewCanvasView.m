@interface _UITextViewCanvasView
- (_NSRange)_extendedGlyphRangeForRange:(_NSRange)a3 maxGlyphIndex:(unint64_t)a4;
- (void)drawTextInRect:(CGRect)a3;
@end

@implementation _UITextViewCanvasView

- (_NSRange)_extendedGlyphRangeForRange:(_NSRange)a3 maxGlyphIndex:(unint64_t)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v7 = [(_UITextCanvasView *)self context];
  v8 = [v7 layoutManager];
  v9 = [v7 textContainer];
  if (location)
  {
    v20.NSUInteger location = 0;
    v20.NSUInteger length = 0;
    [v8 lineFragmentRectForGlyphAtIndex:location effectiveRange:&v20];
    v21.NSUInteger location = location;
    v21.NSUInteger length = length;
    NSRange v10 = NSUnionRange(v21, v20);
    NSUInteger location = v10.location;
    NSUInteger length = v10.length;
    if (v10.location)
    {
      [v8 lineFragmentRectForGlyphAtIndex:v10.location - 1 effectiveRange:&v20];
      v11 = [v8 textContainerForGlyphAtIndex:v20.location effectiveRange:0];

      if (v11 == v9)
      {
        NSRange v12 = NSUnionRange(v10, v20);
        NSUInteger location = v12.location;
        NSUInteger length = v12.length;
      }
    }
  }
  if (length)
  {
    if (location + length < a4)
    {
      NSRange v20 = (NSRange)0;
      [v8 lineFragmentRectForGlyphAtIndex:location + length - 1 effectiveRange:&v20];
      v22.NSUInteger location = location;
      v22.NSUInteger length = length;
      NSRange v13 = NSUnionRange(v22, v20);
      NSUInteger location = v13.location;
      NSUInteger length = v13.length;
      NSUInteger v14 = v13.location + v13.length;
      if (v13.location + v13.length < a4)
      {
        [v8 lineFragmentRectForGlyphAtIndex:v14 effectiveRange:&v20];
        v15 = [v8 textContainerForGlyphAtIndex:v14 effectiveRange:0];

        if (v15 == v9)
        {
          NSRange v16 = NSUnionRange(v13, v20);
          NSUInteger location = v16.location;
          NSUInteger length = v16.length;
        }
      }
    }
  }
  if (location + length <= a4) {
    unint64_t v17 = length;
  }
  else {
    unint64_t v17 = a4 - location;
  }

  NSUInteger v18 = location;
  NSUInteger v19 = v17;
  result.NSUInteger length = v19;
  result.NSUInteger location = v18;
  return result;
}

- (void)drawTextInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = [(_UITextCanvasView *)self context];
  v9 = v8;
  if (v8)
  {
    NSRange v10 = [v8 layoutManager];
    v11 = [v9 textContainer];
    objc_msgSend(v9, "_ensureLayoutCompleteForRect:", x, y, width, height);
    v27[0] = 0;
    v27[1] = v27;
    v27[2] = 0x3010000000;
    uint64_t v28 = 0;
    uint64_t v29 = 0;
    v27[3] = &unk_186D7DBA7;
    [v9 textContainerOrigin];
    uint64_t v28 = v12;
    uint64_t v29 = v13;
    NSUInteger v14 = [v10 textStorage];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __40___UITextViewCanvasView_drawTextInRect___block_invoke;
    v17[3] = &unk_1E530AF38;
    double v23 = x;
    double v24 = y;
    double v25 = width;
    double v26 = height;
    NSRange v22 = v27;
    id v15 = v10;
    id v18 = v15;
    id v16 = v11;
    id v19 = v16;
    id v20 = v9;
    NSRange v21 = self;
    [v14 coordinateReading:v17];

    _Block_object_dispose(v27, 8);
  }
}

@end
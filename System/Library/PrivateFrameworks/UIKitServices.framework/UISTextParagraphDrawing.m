@interface UISTextParagraphDrawing
- (CGRect)alignmentRect;
- (CGSize)drawingSize;
- (UISTextParagraphDrawing)initWithString:(id)a3 attributes:(__CFDictionary *)a4 size:(CGSize)a5 numberOfLines:(unsigned __int8)a6 scale:(double)a7;
- (unsigned)lineCount;
- (void)dealloc;
- (void)drawInContext:(CGContext *)a3 atPoint:(CGPoint)a4;
@end

@implementation UISTextParagraphDrawing

- (UISTextParagraphDrawing)initWithString:(id)a3 attributes:(__CFDictionary *)a4 size:(CGSize)a5 numberOfLines:(unsigned __int8)a6 scale:(double)a7
{
  unsigned int v8 = a6;
  double height = a5.height;
  CGFloat width = a5.width;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v13 = (__CFString *)a3;
  v35.receiver = self;
  v35.super_class = (Class)UISTextParagraphDrawing;
  v14 = [(UISTextParagraphDrawing *)&v35 init];
  v15 = v14;
  if (v14)
  {
    v14->_scale = a7;
    CFAllocatorRef Default = CFAllocatorGetDefault();
    CFAttributedStringRef v17 = CFAttributedStringCreate(Default, v13, a4);
    v15->_textString = v17;
    v18 = CTFramesetterCreateWithAttributedString(v17);
    if (height <= 0.0) {
      double v19 = 10000.0;
    }
    else {
      double v19 = height;
    }
    v15->_frameSize.CGFloat width = width;
    v15->_frameSize.double height = v19;
    uint64_t v20 = 0;
    uint64_t v21 = 0;
    CGFloat v22 = width;
    v23 = CGPathCreateWithRect(*(CGRect *)(&v19 - 3), 0);
    v37.location = 0;
    v37.length = 0;
    Frame = CTFramesetterCreateFrame(v18, v37, v23, 0);
    v15->_frame = Frame;
    CFArrayRef Lines = CTFrameGetLines(Frame);
    CFIndex Count = CFArrayGetCount(Lines);
    unsigned __int8 v27 = v8;
    if (Count < v8) {
      unsigned __int8 v27 = Count;
    }
    if (!v8) {
      unsigned __int8 v27 = Count;
    }
    v15->_lineCFIndex Count = v27;
    if (v27)
    {
      CFArrayGetCount(Lines);
      v28 = (CGPoint *)(&v32 - 2 * MEMORY[0x1F4188790]());
      v38.location = 0;
      v38.length = 0;
      CTFrameGetLineOrigins(v15->_frame, v38, v28);
      CGFloat descent = 0.0;
      CGFloat ascent = 0.0;
      ValueAtIndex = (const __CTLine *)CFArrayGetValueAtIndex(Lines, 0);
      CTLineGetTypographicBounds(ValueAtIndex, &ascent, 0, 0);
      v30 = (const __CTLine *)CFArrayGetValueAtIndex(Lines, v15->_lineCount - 1);
      CTLineGetTypographicBounds(v30, 0, &descent, 0);
      v15->_drawingHeight = ceil((v28->y - v28[v15->_lineCount - 1].y + ascent + descent) * v15->_scale) / v15->_scale;
    }
    if (v18) {
      CFRelease(v18);
    }
    if (v23) {
      CFRelease(v23);
    }
  }

  return v15;
}

- (CGRect)alignmentRect
{
  double width = self->_frameSize.width;
  double drawingHeight = self->_drawingHeight;
  double v4 = 0.0;
  double v5 = 0.0;
  result.size.double height = drawingHeight;
  result.size.double width = width;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (void)drawInContext:(CGContext *)a3 atPoint:(CGPoint)a4
{
  double y = a4.y;
  CGFloat x = a4.x;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  CFArrayRef Lines = CTFrameGetLines(self->_frame);
  unsigned __int8 Count = CFArrayGetCount(Lines);
  unsigned int v10 = Count;
  if (self->_lineCount) {
    BOOL v11 = Count >= self->_lineCount;
  }
  else {
    BOOL v11 = 0;
  }
  if (v11)
  {
    CGFloat v12 = y + self->_frameSize.height;
    transform.a = 1.0;
    transform.b = 0.0;
    transform.c = 0.0;
    transform.d = -1.0;
    transform.tCGFloat x = x;
    transform.tdouble y = v12;
    CGContextConcatCTM(a3, &transform);
    uint64_t v13 = CGContextSetFontRenderingStyle();
    if (self->_frameSize.height == 10000.0 && self->_lineCount == Count)
    {
      CTFrameDraw(self->_frame, a3);
    }
    else
    {
      MEMORY[0x1F4188790](v13);
      v15 = (CGPoint *)((char *)&v34 - v14);
      CFArrayRef v16 = CTFrameGetLines(self->_frame);
      v37.location = 0;
      v37.length = 0;
      CTFrameGetLineOrigins(self->_frame, v37, v15);
      lineunsigned __int8 Count = self->_lineCount;
      if (lineCount < 2)
      {
        CFIndex v21 = lineCount - 1;
      }
      else
      {
        CFIndex v18 = 0;
        p_double y = &v15->y;
        do
        {
          ValueAtIndeCGFloat x = (const __CTLine *)CFArrayGetValueAtIndex(v16, v18);
          CGContextSetTextPosition(a3, *(p_y - 1), *p_y);
          CTLineDraw(ValueAtIndex, a3);
          ++v18;
          CFIndex v21 = self->_lineCount - 1;
          p_y += 2;
        }
        while (v18 < v21);
      }
      CGFloat v22 = (const __CTLine *)CFArrayGetValueAtIndex(v16, v21);
      CFIndex Length = CFAttributedStringGetLength(self->_textString);
      CFIndex v24 = self->_lineCount;
      if (v10 <= v24)
      {
        CFIndex v27 = Length;
      }
      else
      {
        v25 = (const __CTLine *)CFArrayGetValueAtIndex(v16, v24);
        CFRange StringRange = CTLineGetStringRange(v25);
        CFIndex v27 = StringRange.location + StringRange.length;
      }
      v38.location = CTLineGetStringRange(v22).location;
      v38.length = v27 - v38.location;
      CFAttributedStringRef v28 = CFAttributedStringCreateWithSubstring((CFAllocatorRef)*MEMORY[0x1E4F1CF80], self->_textString, v38);
      CTLineRef v29 = CTLineCreateWithAttributedString(v28);
      TruncatedLineWithTokenHandler = (const __CTLine *)CTLineCreateTruncatedLineWithTokenHandler();
      int IsRightToLeft = CTLineIsRightToLeft();
      double v32 = 0.0;
      if (IsRightToLeft) {
        double v32 = 1.0;
      }
      double PenOffsetForFlush = CTLineGetPenOffsetForFlush(TruncatedLineWithTokenHandler, v32, self->_frameSize.width);
      CGContextSetTextPosition(a3, PenOffsetForFlush, v15[self->_lineCount - 1].y);
      CTLineDraw(TruncatedLineWithTokenHandler, a3);
      if (v28) {
        CFRelease(v28);
      }
      if (v29) {
        CFRelease(v29);
      }
      if (TruncatedLineWithTokenHandler) {
        CFRelease(TruncatedLineWithTokenHandler);
      }
    }
  }
}

- (CGSize)drawingSize
{
  double width = self->_frameSize.width;
  double drawingHeight = self->_drawingHeight;
  result.double height = drawingHeight;
  result.double width = width;
  return result;
}

- (void)dealloc
{
  textString = self->_textString;
  if (textString) {
    CFRelease(textString);
  }
  frame = self->_frame;
  if (frame) {
    CFRelease(frame);
  }
  v5.receiver = self;
  v5.super_class = (Class)UISTextParagraphDrawing;
  [(UISTextParagraphDrawing *)&v5 dealloc];
}

- (unsigned)lineCount
{
  return self->_lineCount;
}

@end
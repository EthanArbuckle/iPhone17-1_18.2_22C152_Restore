@interface PXCTFrame
- (BOOL)_truncateLine:(const __CTLine *)a3 withOrigin:(CGPoint *)a4 referenceAttributedString:(id *)a5 bounds:(CGRect)a6;
- (BOOL)allowTruncation;
- (BOOL)isTruncated;
- (CGPoint)origin;
- (NSArray)lines;
- (PXCTFrame)init;
- (PXCTFrame)initWithFrame:(__CTFrame *)a3 maximumLineCount:(unint64_t)a4 allowTruncation:(BOOL)a5 framesetter:(id)a6;
- (PXCTFramesetter)framesetter;
- (__CTFrame)frame;
- (unint64_t)maximumLineCount;
- (void)dealloc;
- (void)prepare;
@end

@implementation PXCTFrame

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_framesetter);
  objc_storeStrong((id *)&self->_lines, 0);
}

- (CGPoint)origin
{
  double x = self->_origin.x;
  double y = self->_origin.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (PXCTFramesetter)framesetter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_framesetter);
  return (PXCTFramesetter *)WeakRetained;
}

- (BOOL)allowTruncation
{
  return self->_allowTruncation;
}

- (unint64_t)maximumLineCount
{
  return self->_maximumLineCount;
}

- (__CTFrame)frame
{
  return self->_frame;
}

- (BOOL)isTruncated
{
  return self->_truncated;
}

- (NSArray)lines
{
  return self->_lines;
}

- (BOOL)_truncateLine:(const __CTLine *)a3 withOrigin:(CGPoint *)a4 referenceAttributedString:(id *)a5 bounds:(CGRect)a6
{
  CGFloat height = a6.size.height;
  CGFloat width = a6.size.width;
  CGFloat y = a6.origin.y;
  CGFloat x = a6.origin.x;
  if (![(PXCTFrame *)self allowTruncation]) {
    return 0;
  }
  CFRange StringRange = CTLineGetStringRange(*a3);
  v15 = [(PXCTFrame *)self framesetter];
  v16 = [v15 attributedString];
  if (StringRange.location + StringRange.length >= (unint64_t)[v16 length])
  {
    BOOL v24 = 0;
  }
  else
  {
    v33 = a5;
    objc_msgSend(v16, "attributedSubstringFromRange:", StringRange.location, objc_msgSend(v16, "length") - StringRange.location);
    CFAttributedStringRef v17 = (const __CFAttributedString *)objc_claimAutoreleasedReturnValue();
    v18 = CTLineCreateWithAttributedString(v17);
    v19 = objc_msgSend(v16, "attributesAtIndex:effectiveRange:", objc_msgSend(v16, "length") - 1, 0);
    CFAttributedStringRef v20 = (const __CFAttributedString *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@"…" attributes:v19];
    v21 = CTLineCreateWithAttributedString(v20);
    v34.origin.CGFloat x = x;
    v34.origin.CGFloat y = y;
    v34.size.CGFloat width = width;
    v34.size.CGFloat height = height;
    double v22 = CGRectGetWidth(v34);
    CTLineRef TruncatedLine = CTLineCreateTruncatedLine(v18, v22, kCTLineTruncationEnd, v21);
    CFRelease(v21);
    CFRelease(v18);
    BOOL v24 = TruncatedLine != 0;
    if (TruncatedLine)
    {
      *a3 = (const __CTLine *)CFAutorelease(TruncatedLine);
      v25 = [v19 objectForKeyedSubscript:*MEMORY[0x1E4FB0738]];
      v26 = v25;
      if (v25)
      {
        uint64_t v27 = [v25 alignment];
        double v28 = 0.0;
        if (v27 == 1) {
          double v28 = 0.5;
        }
        if (v27 == 2) {
          double v29 = 1.0;
        }
        else {
          double v29 = v28;
        }
      }
      else
      {
        double v29 = 0.0;
      }
      v35.origin.CGFloat x = x;
      v35.origin.CGFloat y = y;
      v35.size.CGFloat width = width;
      v35.size.CGFloat height = height;
      double v30 = CGRectGetWidth(v35);
      double PenOffsetForFlush = CTLineGetPenOffsetForFlush(TruncatedLine, v29, v30);
      v36.origin.CGFloat x = x;
      v36.origin.CGFloat y = y;
      v36.size.CGFloat width = width;
      v36.size.CGFloat height = height;
      a4->CGFloat x = PenOffsetForFlush + CGRectGetMinX(v36);
      id *v33 = v17;
    }
  }

  return v24;
}

- (void)prepare
{
  if (!self->_prepared)
  {
    self->_prepared = 1;
    v3 = [(PXCTFrame *)self frame];
    Path = CTFrameGetPath(v3);
    BoundingBoCGFloat x = CGPathGetBoundingBox(Path);
    CGFloat x = BoundingBox.origin.x;
    CGFloat y = BoundingBox.origin.y;
    v7 = CTFrameGetLines(v3);
    unint64_t v8 = [v7 count];
    BOOL v9 = v8 > [(PXCTFrame *)self maximumLineCount];
    unint64_t v10 = [(PXCTFrame *)self maximumLineCount];
    if (v8 >= v10) {
      size_t v11 = v10;
    }
    else {
      size_t v11 = v8;
    }
    v12 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v11];
    if (v11)
    {
      v13 = (CGPoint *)malloc_type_calloc(v11, 0x10uLL, 0x1000040451B5BE8uLL);
      v15.location = 0;
      v15.length = v11;
      CTFrameGetLineOrigins(self->_frame, v15, v13);
      [v7 objectAtIndexedSubscript:0];

      PXPointAdd();
    }
    lines = self->_lines;
    self->_lines = v12;

    self->_truncated = v9;
    self->_origin.CGFloat x = x;
    self->_origin.CGFloat y = y;
  }
}

- (void)dealloc
{
  CFRelease(self->_frame);
  v3.receiver = self;
  v3.super_class = (Class)PXCTFrame;
  [(PXCTFrame *)&v3 dealloc];
}

- (PXCTFrame)initWithFrame:(__CTFrame *)a3 maximumLineCount:(unint64_t)a4 allowTruncation:(BOOL)a5 framesetter:(id)a6
{
  id v10 = a6;
  v13.receiver = self;
  v13.super_class = (Class)PXCTFrame;
  size_t v11 = [(PXCTFrame *)&v13 init];
  if (v11)
  {
    v11->_frame = (__CTFrame *)CFRetain(a3);
    v11->_maximumLineCount = a4;
    v11->_allowTruncation = a5;
    objc_storeWeak((id *)&v11->_framesetter, v10);
  }

  return v11;
}

- (PXCTFrame)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CoreText+PhotosUICore.m", 111, @"%s is not available as initializer", "-[PXCTFrame init]");

  abort();
}

@end
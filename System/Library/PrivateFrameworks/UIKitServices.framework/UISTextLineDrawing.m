@interface UISTextLineDrawing
- (BOOL)hasLineBreak;
- (CGRect)alignmentRect;
- (CGSize)drawingSize;
- (UISTextLineDrawing)initWithAttributedString:(__CFAttributedString *)a3 lineBreakMode:(unsigned __int8)a4 textAlignment:(unsigned __int8)a5 width:(double)a6 scale:(double)a7;
- (UISTextLineDrawing)initWithNonretainedLine:(__CTLine *)a3 lineBreakMode:(unsigned __int8)a4 textAlignment:(unsigned __int8)a5 width:(double)a6 scale:(double)a7;
- (UISTextLineDrawing)initWithString:(__CFString *)a3 attributes:(__CFDictionary *)a4 lineBreakMode:(unsigned __int8)a5 textAlignment:(unsigned __int8)a6 width:(double)a7 scale:(double)a8;
- (void)dealloc;
- (void)drawInContext:(CGContext *)a3 atPoint:(CGPoint)a4;
@end

@implementation UISTextLineDrawing

- (UISTextLineDrawing)initWithNonretainedLine:(__CTLine *)a3 lineBreakMode:(unsigned __int8)a4 textAlignment:(unsigned __int8)a5 width:(double)a6 scale:(double)a7
{
  int v8 = a5;
  int v9 = a4;
  v23.receiver = self;
  v23.super_class = (Class)UISTextLineDrawing;
  v11 = [(UISTextLineDrawing *)&v23 init];
  if (v11)
  {
    char v12 = 0;
    switch(v9)
    {
      case 0:
        CFIndex length = CTLineGetStringRange(a3).length;
        CGFloatIsValid();
        uint64_t v14 = CTLineSuggestLineBreakWithOffset();
        goto LABEL_5;
      case 1:
        CFIndex length = CTLineGetStringRange(a3).length;
        CGFloatIsValid();
        uint64_t v14 = CTLineSuggestClusterBreakWithOffset();
LABEL_5:
        if (v14 == length) {
          goto LABEL_10;
        }
        TruncatedLineWithTokenHandler = (__CTLine *)CTLineCreateFromLineWithOffset();
LABEL_8:
        if (TruncatedLineWithTokenHandler)
        {
          char v12 = 1;
LABEL_12:
          CFRelease(a3);
          a3 = TruncatedLineWithTokenHandler;
        }
        else
        {
LABEL_10:
          char v12 = 0;
        }
LABEL_13:
        v11->_hasLineBreak = v12;
        double v16 = 0.0;
        switch(v8)
        {
          case 1:
            double v16 = 1.0;
            break;
          case 2:
            double v16 = 0.5;
            break;
          case 3:
            CTLineRef JustifiedLine = CTLineCreateJustifiedLine(a3, 1.0, a6);
            if (JustifiedLine)
            {
              v18 = JustifiedLine;
              CFRelease(a3);
              a3 = v18;
            }
            break;
          case 4:
            if (CTLineIsRightToLeft()) {
              double v16 = 1.0;
            }
            else {
              double v16 = 0.0;
            }
            break;
          default:
            break;
        }
        v11->_line = a3;
        CTLineGetDefaultBounds();
        v19.f64[0] = a6;
        v19.f64[1] = 0.0 + 0.0;
        float64x2_t v20 = vdivq_f64(vrndpq_f64(vmulq_n_f64(v19, a7)), (float64x2_t)vdupq_lane_s64(*(uint64_t *)&a7, 0));
        v11->_size = (CGSize)v20;
        v11->_offset.dx = CTLineGetPenOffsetForFlush(v11->_line, v16, v20.f64[0]);
        v11->_offset.dy = round(0.0 * a7) / a7;
        break;
      case 3:
      case 4:
      case 5:
        TruncatedLineWithTokenHandler = (__CTLine *)CTLineCreateTruncatedLineWithTokenHandler();
        if (TruncatedLineWithTokenHandler != a3) {
          goto LABEL_8;
        }
        char v12 = 0;
        TruncatedLineWithTokenHandler = a3;
        goto LABEL_12;
      default:
        goto LABEL_13;
    }
  }
  return v11;
}

- (UISTextLineDrawing)initWithString:(__CFString *)a3 attributes:(__CFDictionary *)a4 lineBreakMode:(unsigned __int8)a5 textAlignment:(unsigned __int8)a6 width:(double)a7 scale:(double)a8
{
  uint64_t v10 = a6;
  uint64_t v11 = a5;
  uint64_t v13 = CTLineCreateWithString();
  return [(UISTextLineDrawing *)self initWithNonretainedLine:v13 lineBreakMode:v11 textAlignment:v10 width:a7 scale:a8];
}

- (UISTextLineDrawing)initWithAttributedString:(__CFAttributedString *)a3 lineBreakMode:(unsigned __int8)a4 textAlignment:(unsigned __int8)a5 width:(double)a6 scale:(double)a7
{
  uint64_t v9 = a5;
  uint64_t v10 = a4;
  CTLineRef v12 = CTLineCreateWithAttributedString(a3);
  return [(UISTextLineDrawing *)self initWithNonretainedLine:v12 lineBreakMode:v10 textAlignment:v9 width:a6 scale:a7];
}

- (void)dealloc
{
  line = self->_line;
  if (line) {
    CFRelease(line);
  }
  v4.receiver = self;
  v4.super_class = (Class)UISTextLineDrawing;
  [(UISTextLineDrawing *)&v4 dealloc];
}

- (CGRect)alignmentRect
{
  double width = self->_size.width;
  double height = self->_size.height;
  double v4 = 0.0;
  double v5 = 0.0;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGSize)drawingSize
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)drawInContext:(CGContext *)a3 atPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  CGContextSetFontRenderingStyle();
  CGContextScaleCTM(a3, 1.0, -1.0);
  long long v8 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&v9.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v9.c = v8;
  *(_OWORD *)&v9.tdouble x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  CGContextSetTextMatrix(a3, &v9);
  CGContextSetTextPosition(a3, x + self->_offset.dx, -(y + self->_offset.dy));
  CTLineDraw(self->_line, a3);
}

- (BOOL)hasLineBreak
{
  return self->_hasLineBreak;
}

@end
@interface UIPDFSquareOrCircleAnnotation
- (UIPDFSquareOrCircleAnnotation)initWithAnnotationDictionary:(CGPDFDictionary *)a3;
- (void)drawInContext:(CGContext *)a3;
@end

@implementation UIPDFSquareOrCircleAnnotation

- (UIPDFSquareOrCircleAnnotation)initWithAnnotationDictionary:(CGPDFDictionary *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)UIPDFSquareOrCircleAnnotation;
  v4 = -[UIPDFAnnotation initWithAnnotationDictionary:](&v10, sel_initWithAnnotationDictionary_);
  v5 = v4;
  if (v4)
  {
    v4->_W = 1.0;
    v4->_S = 83;
    CGPDFDictionaryRef value = 0;
    if (CGPDFDictionaryGetDictionary(a3, "BS", &value))
    {
      CGPDFDictionaryGetNumber(value, "W", &v5->_W);
      CGPDFDictionaryRef dict = 0;
      if (CGPDFDictionaryGetName(value, "S", (const char **)&dict) && *(unsigned char *)dict) {
        v5->_S = *(char *)dict;
      }
      v5->_D = 0;
      CGPDFDictionaryGetArray(value, "D", &v5->_D);
    }
    CGPDFDictionaryRef dict = 0;
    if (CGPDFDictionaryGetDictionary(a3, "BE", &dict))
    {
      v5->_SE = 83.0;
      v7 = 0;
      if (CGPDFDictionaryGetName(dict, "S", (const char **)&v7) && *v7) {
        v5->_SE = (double)*v7;
      }
      v5->_I = 0.0;
      CGPDFDictionaryGetNumber(dict, "I", &v5->_I);
    }
  }
  return v5;
}

- (void)drawInContext:(CGContext *)a3
{
  lengths[1] = *(CGFloat *)MEMORY[0x1E4F143B8];
  if (self->super._appearanceStream)
  {
    v19.receiver = self;
    v19.super_class = (Class)UIPDFSquareOrCircleAnnotation;
    [(UIPDFAnnotation *)&v19 drawInContext:a3];
  }
  else
  {
    [(UIPDFAnnotation *)self Rect];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    CGContextSaveGState(a3);
    CGContextSetStrokeColorWithColor(a3, self->super._color);
    CGContextSetLineWidth(a3, self->_W);
    if (self->_S == 68)
    {
      D = self->_D;
      if (D)
      {
        size_t Count = CGPDFArrayGetCount(D);
        v15 = (CGFloat *)malloc_type_malloc(8 * Count, 0x100004000313F17uLL);
        v16 = v15;
        if (Count)
        {
          size_t v17 = 0;
          v18 = v15;
          do
            CGPDFArrayGetNumber(self->_D, v17++, v18++);
          while (Count != v17);
        }
        CGContextSetLineDash(a3, 0.0, v16, Count);
        free(v16);
      }
      else
      {
        lengths[0] = 3.0;
        CGContextSetLineDash(a3, 0.0, lengths, 1uLL);
      }
    }
    -[UIPDFSquareOrCircleAnnotation strokePath:inRect:](self, "strokePath:inRect:", a3, v6, v8, v10, v12);
    CGContextRestoreGState(a3);
  }
}

@end
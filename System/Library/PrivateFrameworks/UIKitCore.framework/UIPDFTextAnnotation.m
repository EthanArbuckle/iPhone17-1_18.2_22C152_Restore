@interface UIPDFTextAnnotation
- (int)annotationType;
- (void)drawInContext:(CGContext *)a3;
@end

@implementation UIPDFTextAnnotation

- (int)annotationType
{
  return 7;
}

- (void)drawInContext:(CGContext *)a3
{
  [(UIPDFAnnotation *)self Rect];
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  CGContextSetFillColorWithColor(a3, [+[UIColor yellowColor] CGColor]);
  uint64_t v12 = v5;
  uint64_t v13 = v7;
  uint64_t v14 = v9;
  uint64_t v15 = v11;
  CGContextFillRect(a3, *(CGRect *)&v12);
}

@end
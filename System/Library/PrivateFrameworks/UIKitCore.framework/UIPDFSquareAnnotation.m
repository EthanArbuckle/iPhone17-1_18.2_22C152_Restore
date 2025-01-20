@interface UIPDFSquareAnnotation
- (int)annotationType;
- (void)strokePath:(CGContext *)a3 inRect:(CGRect)a4;
@end

@implementation UIPDFSquareAnnotation

- (int)annotationType
{
  return 4;
}

- (void)strokePath:(CGContext *)a3 inRect:(CGRect)a4
{
}

@end
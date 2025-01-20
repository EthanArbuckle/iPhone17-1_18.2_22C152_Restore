@interface TSDVaryWidthPathManipulation
- (CGPath)manipulatePath:(CGPath *)a3 withLineWidth:(double)a4;
@end

@implementation TSDVaryWidthPathManipulation

- (CGPath)manipulatePath:(CGPath *)a3 withLineWidth:(double)a4
{
  v10.receiver = self;
  v10.super_class = (Class)TSDVaryWidthPathManipulation;
  v5 = -[TSDPathManipulation manipulatePath:withLineWidth:](&v10, sel_manipulatePath_withLineWidth_, a3);
  Mutable = CGPathCreateMutable();
  double v7 = a4 + a4;
  uint64_t v8 = 3;
  do
  {
    v5 = TSDCreateWobblyPathWithMaxWobbleAndSubdivisions(v5, 2uLL, v7);
    CGPathAddPath(Mutable, 0, v5);
    --v8;
  }
  while (v8);
  return Mutable;
}

@end
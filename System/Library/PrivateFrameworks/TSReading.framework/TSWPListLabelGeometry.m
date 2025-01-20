@interface TSWPListLabelGeometry
+ (id)listLabelGeometry;
- (BOOL)isEqual:(id)a3;
- (BOOL)scaleWithText;
- (TSWPListLabelGeometry)initWithScale:(double)a3 scaleWithText:(BOOL)a4 baselineOffset:(double)a5;
- (double)baselineOffset;
- (double)scale;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setBaselineOffset:(double)a3;
- (void)setScale:(double)a3;
- (void)setScaleWithText:(BOOL)a3;
@end

@implementation TSWPListLabelGeometry

- (TSWPListLabelGeometry)initWithScale:(double)a3 scaleWithText:(BOOL)a4 baselineOffset:(double)a5
{
  v9.receiver = self;
  v9.super_class = (Class)TSWPListLabelGeometry;
  result = [(TSWPListLabelGeometry *)&v9 init];
  if (result)
  {
    result->mScaleWithText = a4;
    result->mScale = a3;
    result->mBaselineOffset = a5;
  }
  return result;
}

+ (id)listLabelGeometry
{
  v2 = (void *)[objc_alloc((Class)a1) initWithScale:1 scaleWithText:1.0 baselineOffset:0.0];

  return v2;
}

- (BOOL)isEqual:(id)a3
{
  v3 = self;
  BOOL v4 = a3 == self;
  LOBYTE(self) = a3 == self;
  if (a3)
  {
    if (!v4)
    {
      LODWORD(self) = [a3 isMemberOfClass:objc_opt_class()];
      if (self)
      {
        double mScale = v3->mScale;
        double v7 = *((double *)a3 + 1);
        if ((mScale == v7 || vabdd_f64(mScale, v7) < fabs(v7 * 0.000000999999997))
          && ((mBaselineOffset = v3->mBaselineOffset, double v9 = *((double *)a3 + 2), mBaselineOffset == v9)
           || vabdd_f64(mBaselineOffset, v9) < fabs(v9 * 0.000000999999997)))
        {
          LOBYTE(self) = v3->mScaleWithText ^ (*((unsigned char *)a3 + 24) == 0);
        }
        else
        {
          LOBYTE(self) = 0;
        }
      }
    }
  }
  return (char)self;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v4 = [TSWPListLabelGeometry alloc];
  BOOL mScaleWithText = self->mScaleWithText;
  double mScale = self->mScale;
  double mBaselineOffset = self->mBaselineOffset;

  return [(TSWPListLabelGeometry *)v4 initWithScale:mScaleWithText scaleWithText:mScale baselineOffset:mBaselineOffset];
}

- (id)description
{
  v3 = NSString;
  BOOL v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  if (self->mScaleWithText) {
    v6 = @"YES";
  }
  else {
    v6 = @"NO";
  }
  return (id)[v3 stringWithFormat:@"<%@: %p> { scale=%.2f baselineOffset=%.2f scaleWithText=%@ }", v5, self, *(void *)&self->mScale, *(void *)&self->mBaselineOffset, v6];
}

- (double)scale
{
  return self->mScale;
}

- (void)setScale:(double)a3
{
  self->double mScale = a3;
}

- (double)baselineOffset
{
  return self->mBaselineOffset;
}

- (void)setBaselineOffset:(double)a3
{
  self->double mBaselineOffset = a3;
}

- (BOOL)scaleWithText
{
  return self->mScaleWithText;
}

- (void)setScaleWithText:(BOOL)a3
{
  self->BOOL mScaleWithText = a3;
}

@end
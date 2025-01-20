@interface CRLWPListLabelGeometry
+ (id)listLabelGeometry;
- (BOOL)isEqual:(id)a3;
- (BOOL)scaleWithText;
- (CRLWPListLabelGeometry)initWithScale:(double)a3 scaleWithText:(BOOL)a4 baselineOffset:(double)a5;
- (double)baselineOffset;
- (double)scale;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)setBaselineOffset:(double)a3;
- (void)setScale:(double)a3;
- (void)setScaleWithText:(BOOL)a3;
@end

@implementation CRLWPListLabelGeometry

+ (id)listLabelGeometry
{
  id v2 = [objc_alloc((Class)a1) initWithScale:1 scaleWithText:1.0 baselineOffset:0.0];

  return v2;
}

- (CRLWPListLabelGeometry)initWithScale:(double)a3 scaleWithText:(BOOL)a4 baselineOffset:(double)a5
{
  v9.receiver = self;
  v9.super_class = (Class)CRLWPListLabelGeometry;
  result = [(CRLWPListLabelGeometry *)&v9 init];
  if (result)
  {
    result->mScaleWithText = a4;
    result->mScale = a3;
    result->mBaselineOffset = a5;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CRLWPListLabelGeometry *)a3;
  v5 = v4;
  BOOL v6 = v4 == self;
  if (v4 && v4 != self)
  {
    if ([(CRLWPListLabelGeometry *)v4 isMemberOfClass:objc_opt_class()])
    {
      v7 = v5;
      double mScale = self->mScale;
      double v9 = v7[1];
      if ((mScale == v9 || vabdd_f64(mScale, v9) < fabs(v9 * 0.000000999999997))
        && ((double mBaselineOffset = self->mBaselineOffset, v11 = v7[2], mBaselineOffset == v11)
         || vabdd_f64(mBaselineOffset, v11) < fabs(v11 * 0.000000999999997)))
      {
        BOOL v6 = self->mScaleWithText ^ (*((unsigned char *)v7 + 24) == 0);
      }
      else
      {
        BOOL v6 = 0;
      }
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  v3 = objc_alloc_init(CRLHasher);
  [(CRLHasher *)v3 addBool:self->mScaleWithText];
  unint64_t v4 = [(CRLHasher *)v3 hashValue];

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v4 = [CRLWPListLabelGeometry alloc];
  BOOL mScaleWithText = self->mScaleWithText;
  double mScale = self->mScale;
  double mBaselineOffset = self->mBaselineOffset;

  return [(CRLWPListLabelGeometry *)v4 initWithScale:mScaleWithText scaleWithText:mScale baselineOffset:mBaselineOffset];
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  v5 = (void *)v4;
  if (self->mScaleWithText) {
    CFStringRef v6 = @"YES";
  }
  else {
    CFStringRef v6 = @"NO";
  }
  v7 = +[NSString stringWithFormat:@"<%@: %p> { scale=%.2f baselineOffset=%.2f scaleWithText=%@ }", v4, self, *(void *)&self->mScale, *(void *)&self->mBaselineOffset, v6];

  return v7;
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
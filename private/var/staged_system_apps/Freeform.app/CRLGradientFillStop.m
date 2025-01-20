@interface CRLGradientFillStop
+ (id)gradientStopWithColor:(id)a3 fraction:(double)a4;
+ (id)gradientStopWithColor:(id)a3 fraction:(double)a4 inflection:(double)a5;
- (BOOL)isEqual:(id)a3;
- (CRLColor)color;
- (CRLGradientFillStop)initWithColor:(id)a3 fraction:(double)a4;
- (CRLGradientFillStop)initWithColor:(id)a3 fraction:(double)a4 inflection:(double)a5;
- (CRLGradientFillStop)initWithGradientStop:(id)a3;
- (double)fraction;
- (double)inflection;
- (id)description;
- (id)gradientStopWithColor:(id)a3;
- (id)gradientStopWithInflection:(double)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)p_setColor:(id)a3;
- (void)p_setFraction:(double)a3;
- (void)p_setInflection:(double)a3;
@end

@implementation CRLGradientFillStop

- (CRLGradientFillStop)initWithColor:(id)a3 fraction:(double)a4
{
  return [(CRLGradientFillStop *)self initWithColor:a3 fraction:a4 inflection:0.5];
}

- (CRLGradientFillStop)initWithColor:(id)a3 fraction:(double)a4 inflection:(double)a5
{
  id v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CRLGradientFillStop;
  v9 = [(CRLGradientFillStop *)&v12 init];
  v10 = v9;
  if (v9)
  {
    [(CRLGradientFillStop *)v9 p_setColor:v8];
    [(CRLGradientFillStop *)v10 p_setFraction:a4];
    [(CRLGradientFillStop *)v10 p_setInflection:a5];
  }

  return v10;
}

- (CRLGradientFillStop)initWithGradientStop:(id)a3
{
  if (self)
  {
    v3 = self;
    id v4 = a3;
    v5 = [v4 color];
    [v4 fraction];
    double v7 = v6;
    [v4 inflection];
    double v9 = v8;

    v10 = [(CRLGradientFillStop *)v3 initWithColor:v5 fraction:v7 inflection:v9];
    return v10;
  }
  return self;
}

+ (id)gradientStopWithColor:(id)a3 fraction:(double)a4
{
  id v6 = a3;
  id v7 = [objc_alloc((Class)a1) initWithColor:v6 fraction:a4 inflection:0.5];

  return v7;
}

+ (id)gradientStopWithColor:(id)a3 fraction:(double)a4 inflection:(double)a5
{
  id v8 = a3;
  id v9 = [objc_alloc((Class)a1) initWithColor:v8 fraction:a4 inflection:a5];

  return v9;
}

- (id)description
{
  return +[NSString stringWithFormat:@"CRLGradientFillStop<%p>: fraction=%g inflection=%g color=%@", self, *(void *)&self->mFraction, *(void *)&self->mInflection, self->mColor];
}

- (unint64_t)hash
{
  return [(CRLColor *)self->mColor hash];
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = sub_1002469D0(v5, v4);

  if (v6
    && ((double mFraction = self->mFraction, [v6 fraction], mFraction == v8)
     || vabdd_f64(mFraction, v8) < fabs(v8 * 0.000000999999997))
    && (mColor = self->mColor,
        [v6 color],
        v10 = objc_claimAutoreleasedReturnValue(),
        LODWORD(mColor) = [(CRLColor *)mColor isEqual:v10],
        v10,
        mColor))
  {
    [v6 inflection];
    *(float *)&double v11 = v11;
    float mInflection = self->mInflection;
    BOOL v13 = *(float *)&v11 == mInflection;
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (void)p_setColor:(id)a3
{
}

- (void)p_setFraction:(double)a3
{
  self->double mFraction = sub_100407E48(a3, 0.0, 1.0);
}

- (void)p_setInflection:(double)a3
{
  self->float mInflection = sub_100407E48(a3, 0.0, 1.0);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = +[CRLMutableGradientFillStop allocWithZone:a3];
  uint64_t v5 = [(CRLGradientFillStop *)self color];
  [(CRLGradientFillStop *)self fraction];
  double v7 = v6;
  [(CRLGradientFillStop *)self inflection];
  id v9 = [(CRLGradientFillStop *)v4 initWithColor:v5 fraction:v7 inflection:v8];

  return v9;
}

- (id)gradientStopWithColor:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  [(CRLGradientFillStop *)self fraction];
  double v7 = v6;
  [(CRLGradientFillStop *)self inflection];
  id v9 = [v5 gradientStopWithColor:v4 fraction:v7 inflection:v8];

  return v9;
}

- (id)gradientStopWithInflection:(double)a3
{
  id v4 = [(CRLGradientFillStop *)self color];
  [(CRLGradientFillStop *)self fraction];
  uint64_t v5 = +[CRLGradientFillStop gradientStopWithColor:fraction:inflection:](CRLGradientFillStop, "gradientStopWithColor:fraction:inflection:", v4);

  return v5;
}

- (CRLColor)color
{
  return self->mColor;
}

- (double)fraction
{
  return self->mFraction;
}

- (double)inflection
{
  return self->mInflection;
}

- (void).cxx_destruct
{
}

@end
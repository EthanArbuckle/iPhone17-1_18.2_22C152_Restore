@interface TSDGradientStop
+ (id)gradientStopWithColor:(id)a3 fraction:(double)a4;
+ (id)gradientStopWithColor:(id)a3 fraction:(double)a4 inflection:(double)a5;
- (BOOL)isEqual:(id)a3;
- (TSDGradientStop)gradientStopWithColor:(id)a3;
- (TSDGradientStop)gradientStopWithInflection:(double)a3;
- (TSDGradientStop)initWithColor:(id)a3 fraction:(double)a4;
- (TSDGradientStop)initWithColor:(id)a3 fraction:(double)a4 inflection:(double)a5;
- (TSDGradientStop)initWithGradientStop:(id)a3;
- (TSUColor)color;
- (double)fraction;
- (double)inflection;
- (id)description;
- (id)mixedObjectWithFraction:(double)a3 ofObject:(id)a4;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)mixingTypeWithObject:(id)a3;
- (unint64_t)hash;
- (void)dealloc;
- (void)p_setColor:(id)a3;
- (void)p_setFraction:(double)a3;
- (void)p_setInflection:(double)a3;
@end

@implementation TSDGradientStop

- (TSDGradientStop)initWithColor:(id)a3 fraction:(double)a4
{
  return [(TSDGradientStop *)self initWithColor:a3 fraction:a4 inflection:0.5];
}

- (TSDGradientStop)initWithColor:(id)a3 fraction:(double)a4 inflection:(double)a5
{
  v11.receiver = self;
  v11.super_class = (Class)TSDGradientStop;
  v8 = [(TSDGradientStop *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(TSDGradientStop *)v8 p_setColor:a3];
    [(TSDGradientStop *)v9 p_setFraction:a4];
    [(TSDGradientStop *)v9 p_setInflection:a5];
  }
  return v9;
}

- (TSDGradientStop)initWithGradientStop:(id)a3
{
  if (self)
  {
    v4 = self;
    uint64_t v5 = [a3 color];
    [a3 fraction];
    double v7 = v6;
    [a3 inflection];
    return [(TSDGradientStop *)v4 initWithColor:v5 fraction:v7 inflection:v8];
  }
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSDGradientStop;
  [(TSDGradientStop *)&v3 dealloc];
}

+ (id)gradientStopWithColor:(id)a3 fraction:(double)a4
{
  v4 = (void *)[objc_alloc((Class)a1) initWithColor:a3 fraction:a4 inflection:0.5];

  return v4;
}

+ (id)gradientStopWithColor:(id)a3 fraction:(double)a4 inflection:(double)a5
{
  uint64_t v5 = (void *)[objc_alloc((Class)a1) initWithColor:a3 fraction:a4 inflection:a5];

  return v5;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"TSDGradientStop<%p>: fraction=%g inflection=%g color=%@", self, *(void *)&self->mFraction, *(void *)&self->mInflection, self->mColor];
}

- (unint64_t)hash
{
  [(TSUColor *)self->mColor hash];
  TSUHashWithSeed();

  return TSUHashWithSeed();
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    objc_opt_class();
    v4 = (void *)TSUDynamicCast();
    if (v4)
    {
      uint64_t v5 = v4;
      [v4 fraction];
      if (v6 == self->mFraction)
      {
        LODWORD(v4) = -[TSUColor isEqual:](self->mColor, "isEqual:", [v5 color]);
        if (v4)
        {
          [v5 inflection];
          LOBYTE(v4) = v7 == self->mInflection;
        }
      }
      else
      {
        LOBYTE(v4) = 0;
      }
    }
  }
  return (char)v4;
}

- (void)p_setColor:(id)a3
{
  id v5 = a3;

  self->mColor = (TSUColor *)a3;
}

- (void)p_setFraction:(double)a3
{
  TSUClamp();
  self->mFraction = v4;
}

- (void)p_setInflection:(double)a3
{
  TSUClamp();
  self->mInflection = v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  double v4 = +[TSDMutableGradientStop allocWithZone:a3];
  id v5 = [(TSDGradientStop *)self color];
  [(TSDGradientStop *)self fraction];
  double v7 = v6;
  [(TSDGradientStop *)self inflection];

  return [(TSDGradientStop *)v4 initWithColor:v5 fraction:v7 inflection:v8];
}

- (TSDGradientStop)gradientStopWithColor:(id)a3
{
  id v5 = objc_opt_class();
  [(TSDGradientStop *)self fraction];
  double v7 = v6;
  [(TSDGradientStop *)self inflection];

  return (TSDGradientStop *)[v5 gradientStopWithColor:a3 fraction:v7 inflection:v8];
}

- (TSDGradientStop)gradientStopWithInflection:(double)a3
{
  double v4 = [(TSDGradientStop *)self color];
  [(TSDGradientStop *)self fraction];

  return +[TSDGradientStop gradientStopWithColor:fraction:inflection:](TSDGradientStop, "gradientStopWithColor:fraction:inflection:", v4);
}

- (int64_t)mixingTypeWithObject:(id)a3
{
  return TSDMixingTypeWithObject((unint64_t)self, (unint64_t)a3, (uint64_t)&__block_literal_global_57);
}

uint64_t __40__TSDGradientStop_mixingTypeWithObject___block_invoke()
{
  return 3;
}

- (id)mixedObjectWithFraction:(double)a3 ofObject:(id)a4
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __52__TSDGradientStop_mixedObjectWithFraction_ofObject___block_invoke;
  v5[3] = &unk_2646B1780;
  v5[4] = a4;
  v5[5] = self;
  *(double *)&v5[6] = a3;
  return (id)TSDMixingMixedObjectWithFraction(self, a4, (uint64_t)v5);
}

TSDGradientStop *__52__TSDGradientStop_mixedObjectWithFraction_ofObject___block_invoke(uint64_t a1)
{
  objc_opt_class();
  v2 = (void *)TSUDynamicCast();
  uint64_t v3 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "color"), "blendedColorWithFraction:ofColor:", objc_msgSend(v2, "color"), *(double *)(a1 + 48));
  [*(id *)(a1 + 40) fraction];
  double v5 = v4;
  [v2 fraction];
  double v7 = TSDMixFloats(v5, v6, *(double *)(a1 + 48));

  return +[TSDGradientStop gradientStopWithColor:v3 fraction:v7];
}

- (TSUColor)color
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

@end
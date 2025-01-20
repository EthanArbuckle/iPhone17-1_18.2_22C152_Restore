@interface OADGradientFillStop
+ (void)addStopWithColor:(id)a3 position:(float)a4 toArray:(id)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)usesPlaceholderColor;
- (OADGradientFillStop)initWithColor:(id)a3 position:(float)a4;
- (float)position;
- (id)color;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setStyleColor:(id)a3;
@end

@implementation OADGradientFillStop

- (OADGradientFillStop)initWithColor:(id)a3 position:(float)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)OADGradientFillStop;
  v8 = [(OADGradientFillStop *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->mColor, a3);
    v9->mPosition = a4;
  }

  return v9;
}

- (id)color
{
  return self->mColor;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    id v7 = (float *)v4;
    if ([(OADColor *)self->mColor isEqual:*((void *)v7 + 1)]) {
      BOOL v6 = self->mPosition == v7[4];
    }
    else {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = -[OADColor copyWithZone:](self->mColor, "copyWithZone:");
  BOOL v6 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  *(float *)&double v7 = self->mPosition;
  v8 = (void *)[v6 initWithColor:v5 position:v7];

  return v8;
}

- (void)setStyleColor:(id)a3
{
  id v6 = a3;
  -[OADColor colorForStyleColor:](self->mColor, "colorForStyleColor:");
  id v4 = (OADColor *)objc_claimAutoreleasedReturnValue();
  mColor = self->mColor;
  self->mColor = v4;
}

- (float)position
{
  return self->mPosition;
}

- (BOOL)usesPlaceholderColor
{
  return objc_opt_isKindOfClass() & 1;
}

- (unint64_t)hash
{
  return [(OADColor *)self->mColor hash] ^ (unint64_t)self->mPosition;
}

+ (void)addStopWithColor:(id)a3 position:(float)a4 toArray:(id)a5
{
  id v11 = a3;
  id v7 = a5;
  if (v11)
  {
    v8 = [OADGradientFillStop alloc];
    *(float *)&double v9 = a4;
    v10 = [(OADGradientFillStop *)v8 initWithColor:v11 position:v9];
    [v7 addObject:v10];
  }
}

- (void).cxx_destruct
{
}

@end
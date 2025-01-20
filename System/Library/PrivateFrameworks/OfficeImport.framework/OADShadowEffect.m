@interface OADShadowEffect
- (BOOL)isEqual:(id)a3;
- (OADShadowEffect)initWithShadowEffect:(id)a3 type:(int)a4;
- (OADShadowEffect)initWithType:(int)a3;
- (float)angle;
- (float)blurRadius;
- (float)distance;
- (id)color;
- (id)description;
- (unint64_t)hash;
- (void)setAngle:(float)a3;
- (void)setBlurRadius:(float)a3;
- (void)setColor:(id)a3;
- (void)setDistance:(float)a3;
- (void)setStyleColor:(id)a3;
@end

@implementation OADShadowEffect

- (OADShadowEffect)initWithType:(int)a3
{
  v7.receiver = self;
  v7.super_class = (Class)OADShadowEffect;
  v3 = [(OADEffect *)&v7 initWithType:*(void *)&a3];
  v4 = v3;
  if (v3)
  {
    mColor = v3->mColor;
    v3->mColor = 0;

    v4->mBlurRadius = 0.0;
    v4->mDistance = 0.0;
    v4->mAngle = 0.0;
  }
  return v4;
}

- (void)setBlurRadius:(float)a3
{
  self->mBlurRadius = a3;
}

- (void)setDistance:(float)a3
{
  self->mDistance = a3;
}

- (void)setAngle:(float)a3
{
  self->mAngle = a3;
}

- (void)setColor:(id)a3
{
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)OADShadowEffect;
  if ([(OADEffect *)&v8 isEqual:v4])
  {
    v5 = (float *)v4;
    BOOL v6 = [(OADColor *)self->mColor isEqual:*((void *)v5 + 2)]
      && self->mBlurRadius == v5[6]
      && self->mDistance == v5[7]
      && self->mAngle == v5[8];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3 = [(OADColor *)self->mColor hash] ^ (unint64_t)self->mBlurRadius ^ (unint64_t)self->mDistance ^ (unint64_t)self->mAngle;
  v5.receiver = self;
  v5.super_class = (Class)OADShadowEffect;
  return v3 ^ [(OADEffect *)&v5 hash];
}

- (OADShadowEffect)initWithShadowEffect:(id)a3 type:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  objc_super v7 = [(OADShadowEffect *)self initWithType:v4];
  if (v7)
  {
    objc_super v8 = [v6 color];
    uint64_t v9 = [v8 copy];
    mColor = v7->mColor;
    v7->mColor = (OADColor *)v9;

    [v6 blurRadius];
    v7->mBlurRadius = v11;
    [v6 distance];
    v7->mDistance = v12;
    [v6 angle];
    v7->mAngle = v13;
  }

  return v7;
}

- (id)color
{
  return self->mColor;
}

- (float)blurRadius
{
  return self->mBlurRadius;
}

- (float)distance
{
  return self->mDistance;
}

- (float)angle
{
  return self->mAngle;
}

- (void)setStyleColor:(id)a3
{
  id v4 = [(OADColor *)self->mColor colorForStyleColor:a3];
  -[OADShadowEffect setColor:](self, "setColor:");
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)OADShadowEffect;
  v2 = [(OADEffect *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
}

@end
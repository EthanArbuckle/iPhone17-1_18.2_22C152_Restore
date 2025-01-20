@interface OADFillOverlayEffect
- (BOOL)isEqual:(id)a3;
- (OADFillOverlayEffect)init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)fill;
- (int)blendMode;
- (unint64_t)hash;
- (void)setBlendMode:(int)a3;
- (void)setFill:(id)a3;
@end

@implementation OADFillOverlayEffect

- (OADFillOverlayEffect)init
{
  v3.receiver = self;
  v3.super_class = (Class)OADFillOverlayEffect;
  result = [(OADEffect *)&v3 initWithType:5];
  if (result) {
    *(&result->super.mType + 1) = 0;
  }
  return result;
}

- (void)setBlendMode:(int)a3
{
  *(&self->super.mType + 1) = a3;
}

- (void)setFill:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)[*(id *)&self->mBlendMode copyWithZone:a3];
  [v5 setFill:v6];
  [v5 setBlendMode:*((unsigned int *)&self->super.mType + 1)];

  return v5;
}

- (int)blendMode
{
  return *(&self->super.mType + 1);
}

- (id)fill
{
  return *(id *)&self->mBlendMode;
}

- (unint64_t)hash
{
  uint64_t v3 = [*(id *)&self->mBlendMode hash];
  uint64_t v4 = *((unsigned int *)&self->super.mType + 1);
  v6.receiver = self;
  v6.super_class = (Class)OADFillOverlayEffect;
  return v3 ^ v4 ^ [(OADEffect *)&v6 hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = *(void **)&self->mBlendMode;
    objc_super v6 = [v4 fill];
    if ([v5 isEqual:v6]
      && (int v7 = *(&self->super.mType + 1), v7 == [v4 blendMode]))
    {
      v10.receiver = self;
      v10.super_class = (Class)OADFillOverlayEffect;
      BOOL v8 = [(OADEffect *)&v10 isEqual:v4];
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)OADFillOverlayEffect;
  v2 = [(OADEffect *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
}

@end
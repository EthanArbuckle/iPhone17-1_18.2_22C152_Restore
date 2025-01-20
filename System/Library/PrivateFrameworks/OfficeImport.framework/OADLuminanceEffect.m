@interface OADLuminanceEffect
- (BOOL)isEqual:(id)a3;
- (OADLuminanceEffect)init;
- (float)brightness;
- (float)contrast;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setBrightness:(float)a3;
- (void)setContrast:(float)a3;
@end

@implementation OADLuminanceEffect

- (OADLuminanceEffect)init
{
  v3.receiver = self;
  v3.super_class = (Class)OADLuminanceEffect;
  return [(OADBlipEffect *)&v3 initWithType:2];
}

- (void)setContrast:(float)a3
{
  self->mBrightness = a3;
}

- (void)setBrightness:(float)a3
{
  *((float *)&self->super.mType + 1) = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  LODWORD(v5) = *(&self->super.mType + 1);
  [v4 setBrightness:v5];
  *(float *)&double v6 = self->mBrightness;
  [v4 setContrast:v6];
  return v4;
}

- (float)brightness
{
  return *((float *)&self->super.mType + 1);
}

- (float)contrast
{
  return self->mBrightness;
}

- (unint64_t)hash
{
  unint64_t v2 = (unint64_t)self->mBrightness ^ (unint64_t)*((float *)&self->super.mType + 1);
  v4.receiver = self;
  v4.super_class = (Class)OADLuminanceEffect;
  return v2 ^ [(OADBlipEffect *)&v4 hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (float v5 = *((float *)&self->super.mType + 1), [v4 brightness], v5 == v6)
    && (float mBrightness = self->mBrightness, [v4 contrast], mBrightness == v8))
  {
    v11.receiver = self;
    v11.super_class = (Class)OADLuminanceEffect;
    BOOL v9 = [(OADBlipEffect *)&v11 isEqual:v4];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

@end
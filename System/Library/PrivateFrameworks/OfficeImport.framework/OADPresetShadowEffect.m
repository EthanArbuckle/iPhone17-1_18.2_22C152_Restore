@interface OADPresetShadowEffect
- (BOOL)isEqual:(id)a3;
- (OADPresetShadowEffect)init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)equivalentOuterShadowEffect;
- (int)presetShadowType;
- (unint64_t)hash;
- (void)setPresetShadowType:(int)a3;
@end

@implementation OADPresetShadowEffect

- (OADPresetShadowEffect)init
{
  v3.receiver = self;
  v3.super_class = (Class)OADPresetShadowEffect;
  result = [(OADShadowEffect *)&v3 initWithType:2];
  if (result) {
    *((_DWORD *)&result->super.mAngle + 1) = 0;
  }
  return result;
}

- (void)setPresetShadowType:(int)a3
{
  *((_DWORD *)&self->super.mAngle + 1) = a3;
}

- (int)presetShadowType
{
  return *((_DWORD *)&self->super.mAngle + 1);
}

- (unint64_t)hash
{
  uint64_t v2 = *((unsigned int *)&self->super.mAngle + 1);
  v4.receiver = self;
  v4.super_class = (Class)OADPresetShadowEffect;
  return [(OADShadowEffect *)&v4 hash] ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  objc_super v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)OADPresetShadowEffect;
  if ([(OADShadowEffect *)&v7 isEqual:v4]) {
    BOOL v5 = *((_DWORD *)&self->super.mAngle + 1) == v4[9];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithShadowEffect:type:", self, 2);
  [v4 setPresetShadowType:*((unsigned int *)&self->super.mAngle + 1)];
  return v4;
}

- (id)equivalentOuterShadowEffect
{
  objc_super v3 = objc_alloc_init(OADOuterShadowEffect);
  objc_super v4 = v3;
  switch(*((_DWORD *)&self->super.mAngle + 1))
  {
    case 3:
      [(OADOuterShadowEffect *)v3 setAlignment:8];
      float v7 = 0.5;
      LODWORD(v9) = 1109626716;
      [(OADOuterShadowEffect *)v4 setYSkew:v9];
      goto LABEL_12;
    case 4:
    case 0xC:
      [(OADOuterShadowEffect *)v3 setAlignment:8];
      LODWORD(v5) = -1037856932;
      goto LABEL_10;
    case 7:
    case 0xF:
      [(OADOuterShadowEffect *)v3 setAlignment:8];
      LODWORD(v6) = 1109626716;
      goto LABEL_5;
    case 8:
    case 0x10:
      [(OADOuterShadowEffect *)v3 setAlignment:8];
      LODWORD(v6) = -1037856932;
LABEL_5:
      float v7 = -0.5;
      [(OADOuterShadowEffect *)v4 setXSkew:v6];
      goto LABEL_12;
    case 9:
      [(OADOuterShadowEffect *)v3 setAlignment:1];
      float v7 = 0.75;
      LODWORD(v10) = 0.75;
      [(OADOuterShadowEffect *)v4 setXScale:v10];
      goto LABEL_12;
    case 0xA:
      [(OADOuterShadowEffect *)v3 setAlignment:9];
      float v7 = 1.25;
      LODWORD(v11) = 1.25;
      [(OADOuterShadowEffect *)v4 setXScale:v11];
      goto LABEL_12;
    case 0xB:
      [(OADOuterShadowEffect *)v3 setAlignment:8];
      LODWORD(v5) = 1109626716;
LABEL_10:
      float v7 = 0.5;
      [(OADOuterShadowEffect *)v4 setXSkew:v5];
      goto LABEL_12;
    case 0x13:
      float v7 = 0.5;
      [(OADOuterShadowEffect *)v3 setAlignment:8];
LABEL_12:
      *(float *)&double v8 = v7;
      [(OADOuterShadowEffect *)v4 setYScale:v8];
      break;
    case 0x14:
      [(OADOuterShadowEffect *)v3 setAlignment:8];
      break;
    default:
      break;
  }
  v12 = [(OADShadowEffect *)self color];
  [(OADShadowEffect *)v4 setColor:v12];

  [(OADShadowEffect *)self blurRadius];
  -[OADShadowEffect setBlurRadius:](v4, "setBlurRadius:");
  [(OADShadowEffect *)self distance];
  -[OADShadowEffect setDistance:](v4, "setDistance:");
  [(OADShadowEffect *)self angle];
  -[OADShadowEffect setAngle:](v4, "setAngle:");
  return v4;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)OADPresetShadowEffect;
  uint64_t v2 = [(OADShadowEffect *)&v4 description];
  return v2;
}

@end
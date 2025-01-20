@interface OADDuotoneEffect
- (BOOL)isEqual:(id)a3;
- (OADDuotoneEffect)init;
- (id)color1;
- (id)color2;
- (id)copyWithZone:(_NSZone *)a3;
- (int)transferMode1;
- (int)transferMode2;
- (unint64_t)hash;
- (void)setColor1:(id)a3;
- (void)setColor2:(id)a3;
- (void)setStyleColor:(id)a3;
- (void)setTransferMode1:(int)a3;
- (void)setTransferMode2:(int)a3;
@end

@implementation OADDuotoneEffect

- (OADDuotoneEffect)init
{
  v3.receiver = self;
  v3.super_class = (Class)OADDuotoneEffect;
  result = [(OADBlipEffect *)&v3 initWithType:5];
  if (result)
  {
    result->mTransferMode1 = 11;
    result->mTransferMode2 = 4;
  }
  return result;
}

- (void)setColor1:(id)a3
{
}

- (void)setColor2:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(OADColor *)self->mColor1 copyWithZone:a3];
  [v5 setColor1:v6];
  id v7 = [(OADColor *)self->mColor2 copyWithZone:a3];
  [v5 setColor2:v7];

  return v5;
}

- (void)setStyleColor:(id)a3
{
  id v6 = a3;
  v4 = -[OADColor colorForStyleColor:](self->mColor1, "colorForStyleColor:");
  [(OADDuotoneEffect *)self setColor1:v4];

  v5 = [(OADColor *)self->mColor2 colorForStyleColor:v6];
  [(OADDuotoneEffect *)self setColor2:v5];
}

- (id)color1
{
  return self->mColor1;
}

- (id)color2
{
  return self->mColor2;
}

- (int)transferMode1
{
  return self->mTransferMode1;
}

- (void)setTransferMode1:(int)a3
{
  self->mTransferMode1 = a3;
}

- (int)transferMode2
{
  return self->mTransferMode2;
}

- (void)setTransferMode2:(int)a3
{
  self->mTransferMode2 = a3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(OADColor *)self->mColor1 hash];
  unint64_t v4 = [(OADColor *)self->mColor2 hash] ^ v3;
  unint64_t v5 = self->mTransferMode1 ^ (unint64_t)self->mTransferMode2;
  v7.receiver = self;
  v7.super_class = (Class)OADDuotoneEffect;
  return v4 ^ v5 ^ [(OADBlipEffect *)&v7 hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    mColor1 = self->mColor1;
    id v6 = [v4 color1];
    if ([(OADColor *)mColor1 isEqual:v6])
    {
      mColor2 = self->mColor2;
      v8 = [v4 color2];
      if ([(OADColor *)mColor2 isEqual:v8]
        && (int mTransferMode1 = self->mTransferMode1, mTransferMode1 == [v4 transferMode1])
        && (int mTransferMode2 = self->mTransferMode2, mTransferMode2 == [v4 transferMode2]))
      {
        v13.receiver = self;
        v13.super_class = (Class)OADDuotoneEffect;
        BOOL v11 = [(OADBlipEffect *)&v13 isEqual:v4];
      }
      else
      {
        BOOL v11 = 0;
      }
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mColor2, 0);
  objc_storeStrong((id *)&self->mColor1, 0);
}

@end
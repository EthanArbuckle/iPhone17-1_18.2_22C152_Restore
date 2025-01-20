@interface OADBevel
- (BOOL)isEqual:(id)a3;
- (OADBevel)init;
- (float)height;
- (float)width;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)type;
- (unint64_t)hash;
- (void)setHeight:(float)a3;
- (void)setType:(int)a3;
- (void)setWidth:(float)a3;
@end

@implementation OADBevel

- (OADBevel)init
{
  v8.receiver = self;
  v8.super_class = (Class)OADBevel;
  result = [(OADBevel *)&v8 init];
  if (result)
  {
    result->mType = 2;
    __asm { FMOV            V0.2S, #6.0 }
    *(void *)&result->mWidth = _D0;
  }
  return result;
}

- (void)setWidth:(float)a3
{
  self->mWidth = a3;
}

- (void)setHeight:(float)a3
{
  self->mHeight = a3;
}

- (void)setType:(int)a3
{
  self->mType = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_DWORD *)result + 2) = self->mType;
  *((_DWORD *)result + 3) = LODWORD(self->mWidth);
  *((_DWORD *)result + 4) = LODWORD(self->mHeight);
  return result;
}

- (int)type
{
  return self->mType;
}

- (float)width
{
  return self->mWidth;
}

- (float)height
{
  return self->mHeight;
}

- (unint64_t)hash
{
  return (unint64_t)self->mWidth ^ self->mType ^ (unint64_t)self->mHeight;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v6 = 0;
LABEL_7:
    BOOL v12 = 0;
    goto LABEL_8;
  }
  id v5 = v4;
  v6 = v5;
  if (!v5) {
    goto LABEL_7;
  }
  int mType = self->mType;
  if (mType != [v5 type]) {
    goto LABEL_7;
  }
  float mWidth = self->mWidth;
  [v6 width];
  if (mWidth != v9) {
    goto LABEL_7;
  }
  float mHeight = self->mHeight;
  [v6 height];
  BOOL v12 = mHeight == v11;
LABEL_8:

  return v12;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)OADBevel;
  v2 = [(OADBevel *)&v4 description];
  return v2;
}

@end
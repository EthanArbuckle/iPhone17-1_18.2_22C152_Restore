@interface OADTabStop
- (BOOL)isEqual:(id)a3;
- (int)position;
- (unint64_t)hash;
- (unsigned)align;
- (void)setAlign:(unsigned __int8)a3;
- (void)setPosition:(int)a3;
@end

@implementation OADTabStop

- (void)setAlign:(unsigned __int8)a3
{
  self->mAlign = a3;
}

- (void)setPosition:(int)a3
{
  self->mPosition = a3;
}

- (unsigned)align
{
  return self->mAlign;
}

- (int)position
{
  return self->mPosition;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  uint64_t v5 = objc_opt_class();
  BOOL v6 = v5 == objc_opt_class() && self->mAlign == *((unsigned __int8 *)v4 + 8) && self->mPosition == v4[3];

  return v6;
}

- (unint64_t)hash
{
  return self->mPosition ^ self->mAlign;
}

@end
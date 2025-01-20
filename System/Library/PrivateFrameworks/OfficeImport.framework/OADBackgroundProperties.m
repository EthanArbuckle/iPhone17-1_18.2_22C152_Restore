@interface OADBackgroundProperties
- (BOOL)isEqual:(id)a3;
- (id)effects;
- (id)fill;
- (unint64_t)hash;
- (void)setEffects:(id)a3;
- (void)setFill:(id)a3;
@end

@implementation OADBackgroundProperties

- (void)setFill:(id)a3
{
}

- (id)fill
{
  return self->mFill;
}

- (void)setEffects:(id)a3
{
}

- (id)effects
{
  return self->mEffects;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = (objc_object **)v4;
    if (TCObjectEqual((objc_object *)self->mFill, v5[1])) {
      char v6 = TCObjectEqual((objc_object *)self->mEffects, v5[2]);
    }
    else {
      char v6 = 0;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3 = [(OADFill *)self->mFill hash];
  return [(NSArray *)self->mEffects count] + v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mEffects, 0);
  objc_storeStrong((id *)&self->mFill, 0);
}

@end
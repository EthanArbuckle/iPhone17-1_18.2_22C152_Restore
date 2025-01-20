@interface OADImageBulletProperties
- (BOOL)isEqual:(id)a3;
- (OADImageBulletProperties)initWithBlipRef:(id)a3;
- (id)image;
- (unint64_t)hash;
@end

@implementation OADImageBulletProperties

- (OADImageBulletProperties)initWithBlipRef:(id)a3
{
  return self;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (id *)a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(OADBlipRef *)self->mImage blip];
    v6 = [v4[1] blip];
    char v7 = [v5 isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)image
{
  return self->mImage;
}

- (unint64_t)hash
{
  return [(OADBlipRef *)self->mImage hash];
}

- (void).cxx_destruct
{
}

@end
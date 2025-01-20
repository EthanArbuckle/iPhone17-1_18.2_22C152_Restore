@interface OADGraphic
- (id)description;
- (id)geometry;
- (id)graphicProperties;
- (id)masterGraphic;
- (void)setMasterGraphic:(id)a3;
@end

@implementation OADGraphic

- (id)graphicProperties
{
  return self->super.mDrawableProperties;
}

- (id)masterGraphic
{
  return self->mMasterGraphic;
}

- (void)setMasterGraphic:(id)a3
{
}

- (id)geometry
{
  return 0;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)OADGraphic;
  v2 = [(OADDrawable *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
}

@end
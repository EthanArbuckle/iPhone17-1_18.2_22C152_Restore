@interface OADConnector
- (OADConnector)init;
- (id)connectorProperties;
- (id)description;
@end

@implementation OADConnector

- (OADConnector)init
{
  uint64_t v3 = objc_opt_class();
  v5.receiver = self;
  v5.super_class = (Class)OADConnector;
  return [(OADDrawable *)&v5 initWithPropertiesClass:v3];
}

- (id)connectorProperties
{
  return self->super.super.super.mDrawableProperties;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)OADConnector;
  v2 = [(OADShape *)&v4 description];
  return v2;
}

@end
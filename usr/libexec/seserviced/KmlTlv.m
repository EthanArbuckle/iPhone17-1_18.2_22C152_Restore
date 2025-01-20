@interface KmlTlv
- (id)description;
@end

@implementation KmlTlv

- (id)description
{
  id v3 = [objc_alloc((Class)NSString) initWithData:self->_value encoding:1];
  if (v3)
  {
    v9.receiver = self;
    v9.super_class = (Class)KmlTlv;
    v4 = [(KmlTlv *)&v9 description];
    +[NSString stringWithFormat:@"%@ %02x = %@ \"%@\"", v4, self->_tag, self->_value, v3];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)KmlTlv;
    v4 = [(KmlTlv *)&v8 description];
    +[NSString stringWithFormat:@"%@ %02x = %@", v4, self->_tag, self->_value, v7];
  v5 = };

  return v5;
}

- (void).cxx_destruct
{
}

@end
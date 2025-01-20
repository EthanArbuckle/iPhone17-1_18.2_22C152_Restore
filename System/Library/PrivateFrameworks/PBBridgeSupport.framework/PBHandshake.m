@interface PBHandshake
- (id)description;
- (unsigned)position;
- (unsigned)state;
- (unsigned)version;
- (void)setPosition:(unsigned int)a3;
- (void)setState:(unsigned int)a3;
- (void)setVersion:(unsigned int)a3;
@end

@implementation PBHandshake

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"%p - %@ -- State: %d, Position %d, Version: %d", self, v5, self->_state, self->_position, self->_version];

  return v6;
}

- (unsigned)position
{
  return self->_position;
}

- (void)setPosition:(unsigned int)a3
{
  self->_position = a3;
}

- (unsigned)version
{
  return self->_version;
}

- (void)setVersion:(unsigned int)a3
{
  self->_version = a3;
}

- (unsigned)state
{
  return self->_state;
}

- (void)setState:(unsigned int)a3
{
  self->_state = a3;
}

@end
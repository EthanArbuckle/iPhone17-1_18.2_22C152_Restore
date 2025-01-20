@interface SRHMediaView
- (CGRect)position;
- (NSUUID)uuid;
- (SRHMediaView)init;
- (id)description;
- (void)dealloc;
- (void)setPosition:(CGRect)a3;
- (void)setUuid:(id)a3;
@end

@implementation SRHMediaView

- (SRHMediaView)init
{
  v4.receiver = self;
  v4.super_class = (Class)SRHMediaView;
  v2 = [(SRHMediaView *)&v4 init];
  if (v2) {
    v2->_uuid = (NSUUID *)(id)[MEMORY[0x263F08C38] UUID];
  }
  return v2;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"uuid:%@", self->_uuid];
}

- (void)dealloc
{
  self->_uuid = 0;
  v3.receiver = self;
  v3.super_class = (Class)SRHMediaView;
  [(SRHMediaView *)&v3 dealloc];
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (CGRect)position
{
  double x = self->_position.origin.x;
  double y = self->_position.origin.y;
  double width = self->_position.size.width;
  double height = self->_position.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setPosition:(CGRect)a3
{
  self->_position = a3;
}

@end
@interface SmartRoutingConnectConfig
- (NSString)address;
- (int)type;
- (void)setAddress:(id)a3;
- (void)setType:(int)a3;
@end

@implementation SmartRoutingConnectConfig

- (NSString)address
{
  return self->_address;
}

- (void)setAddress:(id)a3
{
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
}

@end
@interface VOSUSBDevice
- (BOOL)connected;
- (BOOL)connecting;
- (BOOL)paired;
- (NSString)address;
- (NSString)identifier;
- (NSString)name;
- (void)setAddress:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setName:(id)a3;
@end

@implementation VOSUSBDevice

- (BOOL)paired
{
  return 1;
}

- (BOOL)connected
{
  return 1;
}

- (BOOL)connecting
{
  return 0;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)address
{
  return self->_address;
}

- (void)setAddress:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end
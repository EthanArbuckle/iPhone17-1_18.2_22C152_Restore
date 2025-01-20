@interface PPMockRTMapItem
- (NSString)name;
- (PPMockRTAddress)address;
- (PPMockRTLocation)location;
- (void)setAddress:(id)a3;
- (void)setLocation:(id)a3;
- (void)setName:(id)a3;
@end

@implementation PPMockRTMapItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setLocation:(id)a3
{
}

- (PPMockRTLocation)location
{
  return self->_location;
}

- (void)setAddress:(id)a3
{
}

- (PPMockRTAddress)address
{
  return self->_address;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

@end
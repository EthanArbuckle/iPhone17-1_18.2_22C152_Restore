@interface RAPAddressFields
- (NSString)building;
- (NSString)floor;
- (NSString)freeformAddress;
- (NSString)unit;
- (void)setBuilding:(id)a3;
- (void)setFloor:(id)a3;
- (void)setFreeformAddress:(id)a3;
- (void)setUnit:(id)a3;
@end

@implementation RAPAddressFields

- (NSString)freeformAddress
{
  return self->_freeformAddress;
}

- (void)setFreeformAddress:(id)a3
{
}

- (NSString)floor
{
  return self->_floor;
}

- (void)setFloor:(id)a3
{
}

- (NSString)unit
{
  return self->_unit;
}

- (void)setUnit:(id)a3
{
}

- (NSString)building
{
  return self->_building;
}

- (void)setBuilding:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_building, 0);
  objc_storeStrong((id *)&self->_unit, 0);
  objc_storeStrong((id *)&self->_floor, 0);

  objc_storeStrong((id *)&self->_freeformAddress, 0);
}

@end
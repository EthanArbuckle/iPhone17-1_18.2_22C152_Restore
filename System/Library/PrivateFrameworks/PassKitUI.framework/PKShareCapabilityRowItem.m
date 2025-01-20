@interface PKShareCapabilityRowItem
- (NSString)sectionIdentifier;
- (PKPassEntitlementCapabilitySet)capabilitySet;
- (unint64_t)capability;
- (void)setCapability:(unint64_t)a3;
- (void)setCapabilitySet:(id)a3;
- (void)setSectionIdentifier:(id)a3;
@end

@implementation PKShareCapabilityRowItem

- (NSString)sectionIdentifier
{
  return self->_sectionIdentifier;
}

- (void)setSectionIdentifier:(id)a3
{
  self->_sectionIdentifier = (NSString *)a3;
}

- (unint64_t)capability
{
  return self->_capability;
}

- (void)setCapability:(unint64_t)a3
{
  self->_capability = a3;
}

- (PKPassEntitlementCapabilitySet)capabilitySet
{
  return self->_capabilitySet;
}

- (void)setCapabilitySet:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
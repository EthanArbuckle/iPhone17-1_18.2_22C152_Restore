@interface PKProvisioningRequirementOracle
- (PKProvisioningRequirementOracle)init;
- (id)recoverableRequirements;
- (id)requirementsForAddSecureElementPassConfiguration:(id)a3;
@end

@implementation PKProvisioningRequirementOracle

- (PKProvisioningRequirementOracle)init
{
  v6.receiver = self;
  v6.super_class = (Class)PKProvisioningRequirementOracle;
  v2 = [(PKProvisioningRequirementOracle *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(_PKProvisioningRequirementOracle);
    underlying = v2->_underlying;
    v2->_underlying = v3;
  }
  return v2;
}

- (id)requirementsForAddSecureElementPassConfiguration:(id)a3
{
  return [(_PKProvisioningRequirementOracle *)self->_underlying requirementsForAddSecureElementPassConfiguration:a3];
}

- (id)recoverableRequirements
{
  return [(_PKProvisioningRequirementOracle *)self->_underlying recoverableRequirementsContainer];
}

- (void).cxx_destruct
{
}

@end
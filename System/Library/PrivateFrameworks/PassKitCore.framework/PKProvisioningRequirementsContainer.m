@interface PKProvisioningRequirementsContainer
+ (BOOL)supportsSecureCoding;
- (BOOL)containsNotManagedAccount;
- (NSString)provisioningSID;
- (PKProvisioningRequirementsContainer)init;
- (PKProvisioningRequirementsContainer)initWithCoder:(id)a3;
- (PKProvisioningRequirementsContainer)initWithContainer:(id)a3;
- (id)container;
- (id)displayableError;
- (id)requirementsByRemovingRequirements:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setContainer:(id)a3;
- (void)setProvisioningSID:(id)a3;
@end

@implementation PKProvisioningRequirementsContainer

- (PKProvisioningRequirementsContainer)init
{
  return 0;
}

- (PKProvisioningRequirementsContainer)initWithContainer:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKProvisioningRequirementsContainer;
  v6 = [(PKProvisioningRequirementsContainer *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong(&v6->_container, a3);
  }

  return v7;
}

- (id)requirementsByRemovingRequirements:(id)a3
{
  v3 = [self->_container containerMinus:*((void *)a3 + 1)];
  v4 = [[PKProvisioningRequirementsContainer alloc] initWithContainer:v3];

  return v4;
}

- (BOOL)containsNotManagedAccount
{
  return [self->_container containsNotManagedAccount];
}

- (id)displayableError
{
  return (id)[self->_container displayableError];
}

- (NSString)provisioningSID
{
  return (NSString *)[self->_container provisioningSID];
}

- (void)setProvisioningSID:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKProvisioningRequirementsContainer)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKProvisioningRequirementsContainer;
  id v5 = [(PKProvisioningRequirementsContainer *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"container"];
    id container = v5->_container;
    v5->_id container = (id)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (id)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
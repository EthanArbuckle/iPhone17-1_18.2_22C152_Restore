@interface PKSharingIDSManagerHandlerConfiguration
- (NSString)accountIdentifier;
- (NSString)handle;
- (PKSharingIDSManagerHandlerConfiguration)initWithSharingGroup:(unint64_t)a3;
- (id)description;
- (unint64_t)accessLevel;
- (unint64_t)sharingGroup;
- (void)setAccessLevel:(unint64_t)a3;
- (void)setAccountIdentifier:(id)a3;
- (void)setHandle:(id)a3;
@end

@implementation PKSharingIDSManagerHandlerConfiguration

- (PKSharingIDSManagerHandlerConfiguration)initWithSharingGroup:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKSharingIDSManagerHandlerConfiguration;
  result = [(PKSharingIDSManagerHandlerConfiguration *)&v5 init];
  if (result) {
    result->_sharingGroup = a3;
  }
  return result;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  v4 = v3;
  unint64_t sharingGroup = self->_sharingGroup;
  v6 = @"peerPayment";
  if (sharingGroup == 2) {
    v6 = @"accountUsers";
  }
  if (sharingGroup) {
    v7 = v6;
  }
  else {
    v7 = @"unknown";
  }
  [v3 appendFormat:@"sharingGroup: '%@'; ", v7];
  [v4 appendFormat:@"handle: '%@'; ", self->_handle];
  [v4 appendFormat:@"accountIdentifier: '%@'; ", self->_accountIdentifier];
  v8 = PKAccountAccessLevelToString(self->_accessLevel);
  [v4 appendFormat:@"accessLevel: '%@'; ", v8];

  return v4;
}

- (unint64_t)sharingGroup
{
  return self->_sharingGroup;
}

- (NSString)handle
{
  return self->_handle;
}

- (void)setHandle:(id)a3
{
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
}

- (unint64_t)accessLevel
{
  return self->_accessLevel;
}

- (void)setAccessLevel:(unint64_t)a3
{
  self->_accessLevel = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_handle, 0);
}

@end
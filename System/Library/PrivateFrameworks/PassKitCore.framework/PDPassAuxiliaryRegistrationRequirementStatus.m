@interface PDPassAuxiliaryRegistrationRequirementStatus
- (BOOL)isRegistered;
- (NSString)requirementIdentifier;
- (int64_t)registrationBackoffCounter;
- (void)setIsRegistered:(BOOL)a3;
- (void)setRegistrationBackoffCounter:(int64_t)a3;
- (void)setRequirementIdentifier:(id)a3;
@end

@implementation PDPassAuxiliaryRegistrationRequirementStatus

- (NSString)requirementIdentifier
{
  return self->_requirementIdentifier;
}

- (void)setRequirementIdentifier:(id)a3
{
}

- (BOOL)isRegistered
{
  return self->_isRegistered;
}

- (void)setIsRegistered:(BOOL)a3
{
  self->_isRegistered = a3;
}

- (int64_t)registrationBackoffCounter
{
  return self->_registrationBackoffCounter;
}

- (void)setRegistrationBackoffCounter:(int64_t)a3
{
  self->_registrationBackoffCounter = a3;
}

- (void).cxx_destruct
{
}

@end
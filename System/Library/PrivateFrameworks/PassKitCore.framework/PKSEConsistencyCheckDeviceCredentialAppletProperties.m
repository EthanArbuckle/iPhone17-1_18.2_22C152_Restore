@interface PKSEConsistencyCheckDeviceCredentialAppletProperties
- (BOOL)isContainer;
- (BOOL)isLocked;
- (PKSEConsistencyCheckDeviceCredentialAppletProperties)init;
- (id)description;
@end

@implementation PKSEConsistencyCheckDeviceCredentialAppletProperties

- (PKSEConsistencyCheckDeviceCredentialAppletProperties)init
{
  return 0;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  v4 = v3;
  if (self->_locked) {
    v5 = @"Y";
  }
  else {
    v5 = @"N";
  }
  [v3 appendFormat:@"isLocked: '%@'; ", v5];
  if (self->_container) {
    v6 = @"Y";
  }
  else {
    v6 = @"N";
  }
  [v4 appendFormat:@"isContainer: '%@'; ", v6];
  [v4 appendFormat:@">"];
  return v4;
}

- (BOOL)isLocked
{
  return self->_locked;
}

- (BOOL)isContainer
{
  return self->_container;
}

@end
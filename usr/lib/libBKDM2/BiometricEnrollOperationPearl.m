@interface BiometricEnrollOperationPearl
- ($7287BE6C16BD8CBBAFC45DEB4D81687E)augmentedIdentity;
- (BOOL)clientToComplete;
- (BiometricEnrollOperationPearl)init;
- (unsigned)enrollmentType;
- (unsigned)periocularGlassesRequirement;
- (void)setClientToComplete:(BOOL)a3;
- (void)setEnrollmentType:(unsigned int)a3;
- (void)setPeriocularGlassesRequirement:(unsigned __int8)a3;
@end

@implementation BiometricEnrollOperationPearl

- (BiometricEnrollOperationPearl)init
{
  v3.receiver = self;
  v3.super_class = (Class)BiometricEnrollOperationPearl;
  result = [(BiometricEnrollOperation *)&v3 init];
  if (result)
  {
    *(_DWORD *)&result->_clientToComplete = 0;
    *(&result->super._processedFlags + 1) = -1;
  }
  return result;
}

- ($7287BE6C16BD8CBBAFC45DEB4D81687E)augmentedIdentity
{
  return ($7287BE6C16BD8CBBAFC45DEB4D81687E *)(&self->super._processedFlags + 1);
}

- (unsigned)enrollmentType
{
  return *(_DWORD *)&self->_clientToComplete;
}

- (void)setEnrollmentType:(unsigned int)a3
{
  *(_DWORD *)&self->_clientToComplete = a3;
}

- (BOOL)clientToComplete
{
  return self->_augmentedIdentity.uuid[12];
}

- (void)setClientToComplete:(BOOL)a3
{
  self->_augmentedIdentity.uuid[12] = a3;
}

- (unsigned)periocularGlassesRequirement
{
  return self->_augmentedIdentity.uuid[13];
}

- (void)setPeriocularGlassesRequirement:(unsigned __int8)a3
{
  self->_augmentedIdentity.uuid[13] = a3;
}

@end
@interface BiometricMatchOperationPearl
- ($7287BE6C16BD8CBBAFC45DEB4D81687E)preAugmentationCheckIdentity;
- (BOOL)autoRetry;
- (BOOL)fullFaceOnly;
- (BOOL)longTimeout;
- (BOOL)preAugmentationCheck;
- (BiometricMatchOperationPearl)init;
- (unsigned)trigger;
- (void)setAutoRetry:(BOOL)a3;
- (void)setFullFaceOnly:(BOOL)a3;
- (void)setLongTimeout:(BOOL)a3;
- (void)setPreAugmentationCheck:(BOOL)a3;
- (void)setTrigger:(unsigned __int8)a3;
@end

@implementation BiometricMatchOperationPearl

- (BiometricMatchOperationPearl)init
{
  v3.receiver = self;
  v3.super_class = (Class)BiometricMatchOperationPearl;
  result = [(BiometricMatchOperation *)&v3 init];
  if (result) {
    result->_preAugmentationCheckIdentity.userID = -1;
  }
  return result;
}

- ($7287BE6C16BD8CBBAFC45DEB4D81687E)preAugmentationCheckIdentity
{
  return ($7287BE6C16BD8CBBAFC45DEB4D81687E *)&self->_preAugmentationCheckIdentity;
}

- (BOOL)longTimeout
{
  return self->_longTimeout;
}

- (void)setLongTimeout:(BOOL)a3
{
  self->_longTimeout = a3;
}

- (BOOL)autoRetry
{
  return self->_autoRetry;
}

- (void)setAutoRetry:(BOOL)a3
{
  self->_autoRetry = a3;
}

- (BOOL)preAugmentationCheck
{
  return self->_preAugmentationCheck;
}

- (void)setPreAugmentationCheck:(BOOL)a3
{
  self->_preAugmentationCheck = a3;
}

- (BOOL)fullFaceOnly
{
  return self->_fullFaceOnly;
}

- (void)setFullFaceOnly:(BOOL)a3
{
  self->_fullFaceOnly = a3;
}

- (unsigned)trigger
{
  return self->_trigger;
}

- (void)setTrigger:(unsigned __int8)a3
{
  self->_trigger = a3;
}

@end
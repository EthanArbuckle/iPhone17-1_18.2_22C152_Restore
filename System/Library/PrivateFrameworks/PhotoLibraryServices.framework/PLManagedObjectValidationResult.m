@interface PLManagedObjectValidationResult
- (BOOL)status;
- (NSArray)errorMessages;
- (NSArray)infoMessages;
- (PLValidatedManagedObject)validatedObject;
- (void)setErrorMessages:(id)a3;
- (void)setInfoMessages:(id)a3;
- (void)setStatus:(BOOL)a3;
- (void)setValidatedObject:(id)a3;
@end

@implementation PLManagedObjectValidationResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_infoMessages, 0);
  objc_storeStrong((id *)&self->_errorMessages, 0);
  objc_storeStrong((id *)&self->_validatedObject, 0);
}

- (void)setInfoMessages:(id)a3
{
}

- (NSArray)infoMessages
{
  return self->_infoMessages;
}

- (void)setErrorMessages:(id)a3
{
}

- (NSArray)errorMessages
{
  return self->_errorMessages;
}

- (void)setValidatedObject:(id)a3
{
}

- (PLValidatedManagedObject)validatedObject
{
  return self->_validatedObject;
}

- (void)setStatus:(BOOL)a3
{
  self->_status = a3;
}

- (BOOL)status
{
  return self->_status;
}

@end
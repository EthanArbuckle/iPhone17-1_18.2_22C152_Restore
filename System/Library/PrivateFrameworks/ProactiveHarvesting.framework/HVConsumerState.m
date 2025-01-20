@interface HVConsumerState
- (HVConsumerState)init;
- (id)description;
- (unsigned)documentsConsumed;
- (unsigned)documentsIgnored;
- (unsigned)errorsReported;
- (unsigned)levelOfService;
- (unsigned)numberOfExtractions;
- (unsigned)numberOfInterruptions;
- (void)setDocumentsConsumed:(unsigned int)a3;
- (void)setDocumentsIgnored:(unsigned int)a3;
- (void)setErrorsReported:(unsigned int)a3;
- (void)setLevelOfService:(unsigned __int8)a3;
- (void)setNumberOfExtractions:(unsigned int)a3;
- (void)setNumberOfInterruptions:(unsigned int)a3;
@end

@implementation HVConsumerState

- (void)setErrorsReported:(unsigned int)a3
{
  self->_errorsReported = a3;
}

- (unsigned)errorsReported
{
  return self->_errorsReported;
}

- (void)setNumberOfInterruptions:(unsigned int)a3
{
  self->_numberOfInterruptions = a3;
}

- (unsigned)numberOfInterruptions
{
  return self->_numberOfInterruptions;
}

- (void)setNumberOfExtractions:(unsigned int)a3
{
  self->_numberOfExtractions = a3;
}

- (unsigned)numberOfExtractions
{
  return self->_numberOfExtractions;
}

- (void)setDocumentsIgnored:(unsigned int)a3
{
  self->_documentsIgnored = a3;
}

- (unsigned)documentsIgnored
{
  return self->_documentsIgnored;
}

- (void)setDocumentsConsumed:(unsigned int)a3
{
  self->_documentsConsumed = a3;
}

- (unsigned)documentsConsumed
{
  return self->_documentsConsumed;
}

- (void)setLevelOfService:(unsigned __int8)a3
{
  self->_levelOfService = a3;
}

- (unsigned)levelOfService
{
  return self->_levelOfService;
}

- (id)description
{
  v2 = objc_msgSend([NSString alloc], "initWithFormat:", @"<HVConsumerState l:%hhu d:%u i:%u ex:%u int:%u err:%u>", self->_levelOfService, self->_documentsConsumed, self->_documentsIgnored, self->_numberOfExtractions, self->_numberOfInterruptions, self->_errorsReported);

  return v2;
}

- (HVConsumerState)init
{
  v3.receiver = self;
  v3.super_class = (Class)HVConsumerState;
  result = [(HVConsumerState *)&v3 init];
  if (result)
  {
    result->_levelOfService = 0;
    *(void *)&result->_numberOfExtractions = 0;
    *(void *)&result->_documentsConsumed = 0;
    result->_errorsReported = 0;
  }
  return result;
}

@end
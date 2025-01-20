@interface SWSystemActivityAcquisitionDetails
- (BOOL)afterFailingToRevertPendingSleep;
- (BOOL)afterPendingSleepWasAlreadyInitiated;
- (BOOL)afterSleepOfNonZeroDuration;
- (NSString)description;
- (SWSystemActivityAcquisitionDetails)initWithAfterPendingSleepWasAlreadyInitiated:(BOOL)a3 afterFailingToRevertPendingSleep:(BOOL)a4 afterSleepOfNonZeroDuration:(BOOL)a5;
@end

@implementation SWSystemActivityAcquisitionDetails

- (SWSystemActivityAcquisitionDetails)initWithAfterPendingSleepWasAlreadyInitiated:(BOOL)a3 afterFailingToRevertPendingSleep:(BOOL)a4 afterSleepOfNonZeroDuration:(BOOL)a5
{
  v9.receiver = self;
  v9.super_class = (Class)SWSystemActivityAcquisitionDetails;
  result = [(SWSystemActivityAcquisitionDetails *)&v9 init];
  if (result)
  {
    result->_afterPendingSleepWasAlreadyInitiated = a3;
    result->_afterFailingToRevertPendingSleep = a4;
    result->_afterSleepOfNonZeroDuration = a5;
  }
  return result;
}

- (NSString)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = (id)[v3 appendBool:self->_afterPendingSleepWasAlreadyInitiated withName:@"afterPendingSleepWasAlreadyInitiated"];
  id v5 = (id)[v3 appendBool:self->_afterFailingToRevertPendingSleep withName:@"afterFailingToRevertPendingSleep"];
  id v6 = (id)[v3 appendBool:self->_afterSleepOfNonZeroDuration withName:@"afterSleepOfNonZeroDuration"];
  v7 = [v3 build];

  return (NSString *)v7;
}

- (BOOL)afterPendingSleepWasAlreadyInitiated
{
  return self->_afterPendingSleepWasAlreadyInitiated;
}

- (BOOL)afterFailingToRevertPendingSleep
{
  return self->_afterFailingToRevertPendingSleep;
}

- (BOOL)afterSleepOfNonZeroDuration
{
  return self->_afterSleepOfNonZeroDuration;
}

@end
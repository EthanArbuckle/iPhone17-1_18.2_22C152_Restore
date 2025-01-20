@interface TRAInputsValidationContext
- (NSArray)acquiredParticipants;
- (TRAInputsValidationContext)initWithAcquiredParticipants:(id)a3;
@end

@implementation TRAInputsValidationContext

- (void).cxx_destruct
{
}

- (TRAInputsValidationContext)initWithAcquiredParticipants:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRAInputsValidationContext;
  v6 = [(TRAInputsValidationContext *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_acquiredParticipants, a3);
  }

  return v7;
}

- (NSArray)acquiredParticipants
{
  return self->_acquiredParticipants;
}

@end
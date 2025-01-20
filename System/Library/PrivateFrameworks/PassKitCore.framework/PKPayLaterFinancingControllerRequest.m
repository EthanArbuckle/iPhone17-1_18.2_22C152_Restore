@interface PKPayLaterFinancingControllerRequest
- (BOOL)coalesceWithRequest:(id)a3;
- (NSDecimalNumber)amount;
- (NSError)stateMachineError;
- (NSOrderedSet)completions;
- (NSString)optionIdentifierToCancel;
- (PKPayLaterFinancingControllerRequest)initWithTransactionAmount:(id)a3 completion:(id)a4;
- (PKPayLaterFinancingControllerRequest)initWithTransactionAmount:(id)a3 optionIdentifierToCancel:(id)a4 authenticationState:(unint64_t)a5 stateMachineError:(id)a6 stateMachineCancelReason:(int64_t)a7 completion:(id)a8;
- (id)description;
- (int64_t)stateMachineCancelReason;
- (unint64_t)authenticationState;
- (void)addCompletions:(id)a3;
@end

@implementation PKPayLaterFinancingControllerRequest

- (PKPayLaterFinancingControllerRequest)initWithTransactionAmount:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PKPayLaterFinancingControllerRequest;
  v9 = [(PKPayLaterFinancingControllerRequest *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_amount, a3);
    v11 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
    completions = v10->_completions;
    v10->_completions = v11;

    v13 = v10->_completions;
    v14 = _Block_copy(v8);
    [(NSMutableOrderedSet *)v13 pk_safelyAddObject:v14];
  }
  return v10;
}

- (PKPayLaterFinancingControllerRequest)initWithTransactionAmount:(id)a3 optionIdentifierToCancel:(id)a4 authenticationState:(unint64_t)a5 stateMachineError:(id)a6 stateMachineCancelReason:(int64_t)a7 completion:(id)a8
{
  id v25 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a8;
  v26.receiver = self;
  v26.super_class = (Class)PKPayLaterFinancingControllerRequest;
  v18 = [(PKPayLaterFinancingControllerRequest *)&v26 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_amount, a3);
    objc_storeStrong((id *)&v19->_optionIdentifierToCancel, a4);
    v19->_authenticationState = a5;
    objc_storeStrong((id *)&v19->_stateMachineError, a6);
    v19->_stateMachineCancelReason = a7;
    v20 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
    completions = v19->_completions;
    v19->_completions = v20;

    v22 = v19->_completions;
    v23 = _Block_copy(v17);
    [(NSMutableOrderedSet *)v22 pk_safelyAddObject:v23];
  }
  return v19;
}

- (BOOL)coalesceWithRequest:(id)a3
{
  id v4 = a3;
  v5 = [v4 amount];
  v6 = v5;
  amount = self->_amount;
  if (v5 && amount)
  {
    char v8 = [(NSDecimalNumber *)v5 isEqual:self->_amount];

    if ((v8 & 1) == 0) {
      goto LABEL_10;
    }
LABEL_6:
    v9 = [v4 optionIdentifierToCancel];
    optionIdentifierToCancel = self->_optionIdentifierToCancel;
    v11 = v9;
    v12 = optionIdentifierToCancel;
    BOOL v13 = v11 != v12;
    if (v11 == v12)
    {
    }
    else
    {
      v14 = v12;
      if (v11 && v12)
      {
        BOOL v15 = [(NSString *)v11 isEqualToString:v12];

        if (v15) {
          goto LABEL_10;
        }
      }
      else
      {
      }
      v11 = [v4 completions];
      [(PKPayLaterFinancingControllerRequest *)self addCompletions:v11];
    }

    goto LABEL_15;
  }

  if (v6 == amount) {
    goto LABEL_6;
  }
LABEL_10:
  BOOL v13 = 0;
LABEL_15:

  return v13;
}

- (void)addCompletions:(id)a3
{
  completions = self->_completions;
  id v4 = [a3 array];
  [(NSMutableOrderedSet *)completions addObjectsFromArray:v4];
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"amount: '%@'; ", self->_amount];
  if (self->_optionIdentifierToCancel) {
    [v3 appendFormat:@"optionIdentifierToCancel: '%@'; ", self->_optionIdentifierToCancel];
  }
  id v4 = @"error";
  switch(self->_authenticationState)
  {
    case 0uLL:
      goto LABEL_9;
    case 1uLL:
      id v4 = @"success";
      goto LABEL_8;
    case 2uLL:
      id v4 = @"cancel";
      goto LABEL_8;
    case 4uLL:
      id v4 = @"startedAuthenticating";
      goto LABEL_8;
    case 5uLL:
      id v4 = @"readyToAuthenticate";
      goto LABEL_8;
    default:
LABEL_8:
      [v3 appendFormat:@"authenticationState: '%@'; ", v4];
LABEL_9:
      if (self->_stateMachineError) {
        [v3 appendFormat:@"stateMachineError: '%@'; ", self->_stateMachineError];
      }
      v5 = PKPaymentAuthorizationStateMachineCancelReasonToString(self->_stateMachineCancelReason);
      [v3 appendFormat:@"stateMachineCancelReason: '%@'; ", v5];

      objc_msgSend(v3, "appendFormat:", @"completionCount: '%ld'; ",
        [(NSMutableOrderedSet *)self->_completions count]);
      [v3 appendFormat:@">"];
      return v3;
  }
}

- (NSDecimalNumber)amount
{
  return self->_amount;
}

- (NSString)optionIdentifierToCancel
{
  return self->_optionIdentifierToCancel;
}

- (unint64_t)authenticationState
{
  return self->_authenticationState;
}

- (NSError)stateMachineError
{
  return self->_stateMachineError;
}

- (int64_t)stateMachineCancelReason
{
  return self->_stateMachineCancelReason;
}

- (NSOrderedSet)completions
{
  return &self->_completions->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateMachineError, 0);
  objc_storeStrong((id *)&self->_optionIdentifierToCancel, 0);
  objc_storeStrong((id *)&self->_amount, 0);
  objc_storeStrong((id *)&self->_completions, 0);
}

@end
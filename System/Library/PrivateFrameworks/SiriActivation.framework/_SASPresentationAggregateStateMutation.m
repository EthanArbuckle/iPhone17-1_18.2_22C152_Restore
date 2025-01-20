@interface _SASPresentationAggregateStateMutation
- (_SASPresentationAggregateStateMutation)init;
- (_SASPresentationAggregateStateMutation)initWithBaseModel:(id)a3;
- (id)generate;
- (void)setCanAcceptNewActivations:(BOOL)a3;
- (void)setDidNewActivationAcceptanceChange:(BOOL)a3;
- (void)setRequestState:(int64_t)a3;
@end

@implementation _SASPresentationAggregateStateMutation

- (_SASPresentationAggregateStateMutation)init
{
  return [(_SASPresentationAggregateStateMutation *)self initWithBaseModel:0];
}

- (_SASPresentationAggregateStateMutation)initWithBaseModel:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SASPresentationAggregateStateMutation;
  v6 = [(_SASPresentationAggregateStateMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_baseModel, a3);
  }

  return v7;
}

- (void)setCanAcceptNewActivations:(BOOL)a3
{
  self->_canAcceptNewActivations = a3;
  *(unsigned char *)&self->_mutationFlags |= 3u;
}

- (void)setDidNewActivationAcceptanceChange:(BOOL)a3
{
  self->_didNewActivationAcceptanceChange = a3;
  *(unsigned char *)&self->_mutationFlags |= 5u;
}

- (void)setRequestState:(int64_t)a3
{
  self->_requestState = a3;
  *(unsigned char *)&self->_mutationFlags |= 9u;
}

- (id)generate
{
  baseModel = self->_baseModel;
  if (baseModel)
  {
    char mutationFlags = (char)self->_mutationFlags;
    if ((mutationFlags & 1) == 0)
    {
      id v5 = (SASPresentationAggregateState *)[(SASPresentationAggregateState *)baseModel copy];
      goto LABEL_14;
    }
    if ((*(unsigned char *)&self->_mutationFlags & 2) != 0)
    {
      uint64_t canAcceptNewActivations = self->_canAcceptNewActivations;
      if ((*(unsigned char *)&self->_mutationFlags & 4) != 0)
      {
LABEL_7:
        BOOL didNewActivationAcceptanceChange = self->_didNewActivationAcceptanceChange;
        if ((mutationFlags & 8) != 0)
        {
LABEL_8:
          int64_t requestState = self->_requestState;
LABEL_12:
          v6 = [SASPresentationAggregateState alloc];
          BOOL v7 = canAcceptNewActivations;
          BOOL v8 = didNewActivationAcceptanceChange;
          int64_t v9 = requestState;
          goto LABEL_13;
        }
LABEL_11:
        int64_t requestState = [(SASPresentationAggregateState *)self->_baseModel requestState];
        goto LABEL_12;
      }
    }
    else
    {
      uint64_t canAcceptNewActivations = [(SASPresentationAggregateState *)baseModel canAcceptNewActivations];
      char mutationFlags = (char)self->_mutationFlags;
      if ((mutationFlags & 4) != 0) {
        goto LABEL_7;
      }
    }
    BOOL didNewActivationAcceptanceChange = [(SASPresentationAggregateState *)self->_baseModel didNewActivationAcceptanceChange];
    if ((*(unsigned char *)&self->_mutationFlags & 8) != 0) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }
  v6 = [SASPresentationAggregateState alloc];
  BOOL v7 = self->_canAcceptNewActivations;
  BOOL v8 = self->_didNewActivationAcceptanceChange;
  int64_t v9 = self->_requestState;
LABEL_13:
  id v5 = [(SASPresentationAggregateState *)v6 initWithCanAcceptNewActivations:v7 didNewActivationAcceptanceChange:v8 requestState:v9];
LABEL_14:
  return v5;
}

- (void).cxx_destruct
{
}

@end
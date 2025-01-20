@interface SASPresentationAggregateState
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (BOOL)canAcceptNewActivations;
- (BOOL)didNewActivationAcceptanceChange;
- (BOOL)isEqual:(id)a3;
- (SASPresentationAggregateState)initWithBuilder:(id)a3;
- (SASPresentationAggregateState)initWithCanAcceptNewActivations:(BOOL)a3 didNewActivationAcceptanceChange:(BOOL)a4 requestState:(int64_t)a5;
- (SASPresentationAggregateState)initWithCoder:(id)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (int64_t)requestState;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SASPresentationAggregateState

- (SASPresentationAggregateState)initWithBuilder:(id)a3
{
  v4 = +[SASPresentationAggregateState newWithBuilder:a3];

  return v4;
}

- (SASPresentationAggregateState)initWithCanAcceptNewActivations:(BOOL)a3 didNewActivationAcceptanceChange:(BOOL)a4 requestState:(int64_t)a5
{
  v9.receiver = self;
  v9.super_class = (Class)SASPresentationAggregateState;
  result = [(SASPresentationAggregateState *)&v9 init];
  if (result)
  {
    result->_canAcceptNewActivations = a3;
    result->_didNewActivationAcceptanceChange = a4;
    result->_requestState = a5;
  }
  return result;
}

- (id)description
{
  v19[3] = *MEMORY[0x1E4F143B8];
  id v3 = [NSString alloc];
  v18.receiver = self;
  v18.super_class = (Class)SASPresentationAggregateState;
  v4 = [(SASPresentationAggregateState *)&v18 description];
  id v5 = [NSString alloc];
  if (self->_canAcceptNewActivations) {
    v6 = @"YES";
  }
  else {
    v6 = @"NO";
  }
  v7 = (void *)[v5 initWithFormat:@"canAcceptNewActivations = %@", v6];
  v19[0] = v7;
  id v8 = [NSString alloc];
  if (self->_didNewActivationAcceptanceChange) {
    objc_super v9 = @"YES";
  }
  else {
    objc_super v9 = @"NO";
  }
  v10 = (void *)[v8 initWithFormat:@"didNewActivationAcceptanceChange = %@", v9];
  v19[1] = v10;
  id v11 = [NSString alloc];
  v12 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_requestState];
  v13 = (void *)[v11 initWithFormat:@"requestState = %@", v12];
  v19[2] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:3];
  v15 = [v14 componentsJoinedByString:@", "];
  v16 = (void *)[v3 initWithFormat:@"%@ {%@}", v4, v15];

  return v16;
}

- (unint64_t)hash
{
  id v3 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_canAcceptNewActivations];
  uint64_t v4 = [v3 hash];
  id v5 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_didNewActivationAcceptanceChange];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_requestState];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (SASPresentationAggregateState *)a3;
  if (self == v4)
  {
    BOOL v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      BOOL canAcceptNewActivations = self->_canAcceptNewActivations;
      if (canAcceptNewActivations == [(SASPresentationAggregateState *)v5 canAcceptNewActivations]&& (BOOL didNewActivationAcceptanceChange = self->_didNewActivationAcceptanceChange, didNewActivationAcceptanceChange == [(SASPresentationAggregateState *)v5 didNewActivationAcceptanceChange]))
      {
        int64_t requestState = self->_requestState;
        BOOL v9 = requestState == [(SASPresentationAggregateState *)v5 requestState];
      }
      else
      {
        BOOL v9 = 0;
      }
    }
    else
    {
      BOOL v9 = 0;
    }
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SASPresentationAggregateState)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SASPresentationAggregateState::canAcceptNewActivations"];
  uint64_t v6 = [v5 BOOLValue];

  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SASPresentationAggregateState::didNewActivationAcceptanceChange"];
  uint64_t v8 = [v7 BOOLValue];

  BOOL v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SASPresentationAggregateState::requestState"];

  uint64_t v10 = [v9 integerValue];
  return [(SASPresentationAggregateState *)self initWithCanAcceptNewActivations:v6 didNewActivationAcceptanceChange:v8 requestState:v10];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F28ED0];
  BOOL canAcceptNewActivations = self->_canAcceptNewActivations;
  id v6 = a3;
  v7 = [v4 numberWithBool:canAcceptNewActivations];
  [v6 encodeObject:v7 forKey:@"SASPresentationAggregateState::canAcceptNewActivations"];

  uint64_t v8 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_didNewActivationAcceptanceChange];
  [v6 encodeObject:v8 forKey:@"SASPresentationAggregateState::didNewActivationAcceptanceChange"];

  id v9 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_requestState];
  [v6 encodeObject:v9 forKey:@"SASPresentationAggregateState::requestState"];
}

- (BOOL)canAcceptNewActivations
{
  return self->_canAcceptNewActivations;
}

- (BOOL)didNewActivationAcceptanceChange
{
  return self->_didNewActivationAcceptanceChange;
}

- (int64_t)requestState
{
  return self->_requestState;
}

+ (id)newWithBuilder:(id)a3
{
  id v3 = (void (**)(id, _SASPresentationAggregateStateMutation *))a3;
  id v4 = objc_alloc_init(_SASPresentationAggregateStateMutation);
  if (v3) {
    v3[2](v3, v4);
  }
  id v5 = [(_SASPresentationAggregateStateMutation *)v4 generate];

  return v5;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  id v4 = (void (**)(id, _SASPresentationAggregateStateMutation *))a3;
  if (v4)
  {
    id v5 = [[_SASPresentationAggregateStateMutation alloc] initWithBaseModel:self];
    v4[2](v4, v5);
    id v6 = [(_SASPresentationAggregateStateMutation *)v5 generate];
  }
  else
  {
    id v6 = (void *)[(SASPresentationAggregateState *)self copy];
  }

  return v6;
}

@end
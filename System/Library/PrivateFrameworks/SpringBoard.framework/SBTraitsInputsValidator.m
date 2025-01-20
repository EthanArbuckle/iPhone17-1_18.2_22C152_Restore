@interface SBTraitsInputsValidator
- (NSNumber)validatorOrder;
- (NSString)description;
- (SBTraitsInputsValidator)init;
- (SBTraitsInputsValidator)initWithValidatorOrder:(id)a3;
- (id)validateInputs:(id)a3 withContext:(id)a4;
@end

@implementation SBTraitsInputsValidator

- (id)validateInputs:(id)a3 withContext:(id)a4
{
  id v6 = a3;
  if (!v6)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"SBTraitsInputsValidators.m", 40, @"Invalid parameter not satisfying: %@", @"inputs != nil" object file lineNumber description];
  }
  return v6;
}

- (SBTraitsInputsValidator)initWithValidatorOrder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBTraitsInputsValidator;
  v5 = [(SBTraitsInputsValidator *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    validatorOrder = v5->_validatorOrder;
    v5->_validatorOrder = (NSNumber *)v6;
  }
  return v5;
}

- (SBTraitsInputsValidator)init
{
  return [(SBTraitsInputsValidator *)self initWithValidatorOrder:&unk_1F334A418];
}

- (NSString)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  v8.receiver = self;
  v8.super_class = (Class)SBTraitsInputsValidator;
  id v4 = [(SBTraitsInputsValidator *)&v8 description];
  v5 = [v3 stringWithString:v4];

  uint64_t v6 = [(NSNumber *)self->_validatorOrder stringValue];
  [v5 appendFormat:@" order: %@", v6];

  return (NSString *)v5;
}

- (NSNumber)validatorOrder
{
  return self->_validatorOrder;
}

- (void).cxx_destruct
{
}

@end
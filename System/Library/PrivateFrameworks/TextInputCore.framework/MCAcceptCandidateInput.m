@interface MCAcceptCandidateInput
- (BOOL)canComposeNew:(id)a3;
- (MCAcceptCandidateInput)initWithCandidateText:(id)a3 convertedInput:(id)a4;
- (NSArray)remainingMecabraInputs;
- (NSString)candidateText;
- (NSString)convertedInput;
- (NSString)remainingInputString;
- (id)copyWithZone:(_NSZone *)a3;
- (id)shortDescriptionWithLeadingString:(id)a3;
- (void)setRemainingInputString:(id)a3;
- (void)setRemainingMecabraInputs:(id)a3;
@end

@implementation MCAcceptCandidateInput

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remainingInputString, 0);
  objc_storeStrong((id *)&self->_remainingMecabraInputs, 0);
  objc_storeStrong((id *)&self->_convertedInput, 0);

  objc_storeStrong((id *)&self->_candidateText, 0);
}

- (void)setRemainingInputString:(id)a3
{
}

- (NSString)remainingInputString
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setRemainingMecabraInputs:(id)a3
{
}

- (NSArray)remainingMecabraInputs
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)convertedInput
{
  return self->_convertedInput;
}

- (NSString)candidateText
{
  return self->_candidateText;
}

- (BOOL)canComposeNew:(id)a3
{
  return 0;
}

- (id)shortDescriptionWithLeadingString:(id)a3
{
  v4 = NSString;
  v5 = [(MCAcceptCandidateInput *)self candidateText];
  v6 = [(MCAcceptCandidateInput *)self convertedInput];
  v7 = [(MCAcceptCandidateInput *)self remainingInputString];
  v8 = [v4 stringWithFormat:@"MCAcceptCandidateInput: candidate=%@, input=%@, remaining=%@", v5, v6, v7];

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v15.receiver = self;
  v15.super_class = (Class)MCAcceptCandidateInput;
  v5 = -[MCKeyboardInput copyWithZone:](&v15, sel_copyWithZone_);
  if (v5)
  {
    uint64_t v6 = [(NSString *)self->_candidateText copyWithZone:a3];
    v7 = (void *)v5[4];
    v5[4] = v6;

    uint64_t v8 = [(NSString *)self->_convertedInput copyWithZone:a3];
    v9 = (void *)v5[5];
    v5[5] = v8;

    uint64_t v10 = [(NSArray *)self->_remainingMecabraInputs copyWithZone:a3];
    v11 = (void *)v5[6];
    v5[6] = v10;

    uint64_t v12 = [(NSString *)self->_remainingInputString copyWithZone:a3];
    v13 = (void *)v5[7];
    v5[7] = v12;
  }
  return v5;
}

- (MCAcceptCandidateInput)initWithCandidateText:(id)a3 convertedInput:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MCAcceptCandidateInput;
  uint64_t v8 = [(MCKeyboardInput *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    candidateText = v8->_candidateText;
    v8->_candidateText = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    convertedInput = v8->_convertedInput;
    v8->_convertedInput = (NSString *)v11;
  }
  return v8;
}

@end
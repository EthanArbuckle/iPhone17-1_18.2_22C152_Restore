@interface SIRINLURequest
+ (BOOL)supportsSecureCoding;
- (NSArray)previousTurnInputs;
- (SIRINLURequest)initWithCoder:(id)a3;
- (SIRINLURequest)initWithRequestId:(id)a3 currentTurnInput:(id)a4 previousTurnInputs:(id)a5;
- (SIRINLURequestID)requestId;
- (SIRINLUTurnInput)currentTurnInput;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setCurrentTurnInput:(id)a3;
- (void)setPreviousTurnInputs:(id)a3;
- (void)setRequestId:(id)a3;
@end

@implementation SIRINLURequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousTurnInputs, 0);
  objc_storeStrong((id *)&self->_currentTurnInput, 0);
  objc_storeStrong((id *)&self->_requestId, 0);
}

- (void)setPreviousTurnInputs:(id)a3
{
}

- (NSArray)previousTurnInputs
{
  return self->_previousTurnInputs;
}

- (void)setCurrentTurnInput:(id)a3
{
}

- (SIRINLUTurnInput)currentTurnInput
{
  return self->_currentTurnInput;
}

- (void)setRequestId:(id)a3
{
}

- (SIRINLURequestID)requestId
{
  return self->_requestId;
}

- (id)description
{
  v3 = [(SIRINLURequest *)self requestId];
  v4 = [v3 description];
  v5 = +[SIRINLUPrintUtils indentLines:v4 numSpaces:4];

  v6 = [(SIRINLURequest *)self currentTurnInput];
  v7 = [v6 description];
  v8 = +[SIRINLUPrintUtils indentLines:v7 numSpaces:4];

  v9 = [(SIRINLURequest *)self previousTurnInputs];
  v10 = +[SIRINLUPrintUtils indentArray:v9 numSpaces:4];

  v11 = [NSString stringWithFormat:@"{Request\n  requestId:\n%@\n  currentTurnInput:\n%@\n  previousTurnInputs:\n%@\n}", v5, v8, v10];

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SIRINLURequest *)self requestId];
  [v4 encodeObject:v5 forKey:@"requestId"];

  v6 = [(SIRINLURequest *)self currentTurnInput];
  [v4 encodeObject:v6 forKey:@"currentTurnInput"];

  id v7 = [(SIRINLURequest *)self previousTurnInputs];
  [v4 encodeObject:v7 forKey:@"previousTurnInputs"];
}

- (SIRINLURequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SIRINLURequest;
  v5 = [(SIRINLURequest *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requestId"];
    requestId = v5->_requestId;
    v5->_requestId = (SIRINLURequestID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currentTurnInput"];
    currentTurnInput = v5->_currentTurnInput;
    v5->_currentTurnInput = (SIRINLUTurnInput *)v8;

    v10 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v11 = objc_opt_class();
    v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"previousTurnInputs"];
    previousTurnInputs = v5->_previousTurnInputs;
    v5->_previousTurnInputs = (NSArray *)v13;
  }
  return v5;
}

- (SIRINLURequest)initWithRequestId:(id)a3 currentTurnInput:(id)a4 previousTurnInputs:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SIRINLURequest;
  v12 = [(SIRINLURequest *)&v15 init];
  uint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_requestId, a3);
    objc_storeStrong((id *)&v13->_currentTurnInput, a4);
    objc_storeStrong((id *)&v13->_previousTurnInputs, a5);
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
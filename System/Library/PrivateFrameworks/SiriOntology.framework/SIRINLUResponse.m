@interface SIRINLUResponse
+ (BOOL)supportsSecureCoding;
- (NSArray)parses;
- (NSArray)repetitionResults;
- (SIRINLURequestID)requestId;
- (SIRINLUResponse)initWithCoder:(id)a3;
- (SIRINLUResponse)initWithRequestId:(id)a3 parses:(id)a4;
- (SIRINLUResponse)initWithRequestId:(id)a3 parses:(id)a4 repetitionResults:(id)a5;
- (SIRINLUResponseStatus)responseStatus;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setParses:(id)a3;
- (void)setRepetitionResults:(id)a3;
- (void)setRequestId:(id)a3;
- (void)setResponseStatus:(id)a3;
@end

@implementation SIRINLUResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_repetitionResults, 0);
  objc_storeStrong((id *)&self->_responseStatus, 0);
  objc_storeStrong((id *)&self->_parses, 0);
  objc_storeStrong((id *)&self->_requestId, 0);
}

- (void)setRepetitionResults:(id)a3
{
}

- (NSArray)repetitionResults
{
  return self->_repetitionResults;
}

- (void)setResponseStatus:(id)a3
{
}

- (SIRINLUResponseStatus)responseStatus
{
  return self->_responseStatus;
}

- (void)setParses:(id)a3
{
}

- (NSArray)parses
{
  return self->_parses;
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
  v3 = [(SIRINLUResponse *)self requestId];
  v4 = [v3 description];
  v5 = +[SIRINLUPrintUtils indentLines:v4 numSpaces:4];

  v6 = [(SIRINLUResponse *)self repetitionResults];
  v7 = +[SIRINLUPrintUtils indentArray:v6 numSpaces:4];

  v8 = [(SIRINLUResponse *)self parses];
  v9 = +[SIRINLUPrintUtils indentArray:v8 numSpaces:4];

  v10 = [NSString stringWithFormat:@"{Response\n  requestId:\n%@\n  parses:\n%@\n  repetitionResults:\n%@\n}", v5, v9, v7];

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SIRINLUResponse *)self requestId];
  [v4 encodeObject:v5 forKey:@"requestId"];

  v6 = [(SIRINLUResponse *)self parses];
  [v4 encodeObject:v6 forKey:@"parses"];

  id v7 = [(SIRINLUResponse *)self repetitionResults];
  [v4 encodeObject:v7 forKey:@"repetitionResults"];
}

- (SIRINLUResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SIRINLUResponse;
  v5 = [(SIRINLUResponse *)&v19 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requestId"];
    requestId = v5->_requestId;
    v5->_requestId = (SIRINLURequestID *)v9;

    uint64_t v11 = [v4 decodeObjectOfClasses:v8 forKey:@"parses"];
    parses = v5->_parses;
    v5->_parses = (NSArray *)v11;

    v13 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v14 = objc_opt_class();
    v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"repetitionResults"];
    repetitionResults = v5->_repetitionResults;
    v5->_repetitionResults = (NSArray *)v16;
  }
  return v5;
}

- (SIRINLUResponse)initWithRequestId:(id)a3 parses:(id)a4 repetitionResults:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SIRINLUResponse;
  v12 = [(SIRINLUResponse *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_requestId, a3);
    objc_storeStrong((id *)&v13->_parses, a4);
    objc_storeStrong((id *)&v13->_repetitionResults, a5);
  }

  return v13;
}

- (SIRINLUResponse)initWithRequestId:(id)a3 parses:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SIRINLUResponse;
  id v9 = [(SIRINLUResponse *)&v13 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_requestId, a3);
    objc_storeStrong((id *)&v10->_parses, a4);
    repetitionResults = v10->_repetitionResults;
    v10->_repetitionResults = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
@interface SIRINLUUserParse
+ (BOOL)supportsSecureCoding;
- (NSArray)userDialogActs;
- (NSString)parserId;
- (NSUUID)nsUUID;
- (SIRINLUParser)parser;
- (SIRINLURepetitionResult)repetitionResult;
- (SIRINLUUserParse)initWithCoder:(id)a3;
- (SIRINLUUserParse)initWithUserDialogActs:(id)a3 probability:(double)a4 nsUUID:(id)a5 parserId:(id)a6;
- (SIRINLUUserParse)initWithUserDialogActs:(id)a3 probability:(double)a4 nsUUID:(id)a5 parserId:(id)a6 repetitionResult:(id)a7;
- (SIRINLUUserParse)initWithUserDialogActs:(id)a3 probability:(double)a4 nsUUID:(id)a5 parserId:(id)a6 repetitionResult:(id)a7 comparableProbability:(double)a8;
- (SIRINLUUserParse)initWithUserDialogActs:(id)a3 probability:(double)a4 nsUUID:(id)a5 parserId:(id)a6 repetitionResult:(id)a7 parser:(id)a8 comparableProbability:(double)a9;
- (SIRINLUUserParse)initWithUserDialogActs:(id)a3 probability:(double)a4 parserId:(id)a5;
- (SIRINLUUserParse)initWithUserDialogActs:(id)a3 probability:(double)a4 parserId:(id)a5 repetitionResult:(id)a6;
- (SIRINLUUserParse)initWithUserDialogActs:(id)a3 probability:(double)a4 parserId:(id)a5 repetitionResult:(id)a6 parser:(id)a7;
- (SIRINLUUserParse)initWithUserDialogActs:(id)a3 probability:(double)a4 parserId:(id)a5 repetitionResult:(id)a6 parser:(id)a7 comparableProbability:(double)a8;
- (double)comparableProbability;
- (double)probability;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setComparableProbability:(double)a3;
- (void)setNsUUID:(id)a3;
- (void)setParser:(id)a3;
- (void)setParserId:(id)a3;
- (void)setProbability:(double)a3;
- (void)setRepetitionResult:(id)a3;
- (void)setUserDialogActs:(id)a3;
@end

@implementation SIRINLUUserParse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parser, 0);
  objc_storeStrong((id *)&self->_repetitionResult, 0);
  objc_storeStrong((id *)&self->_parserId, 0);
  objc_storeStrong((id *)&self->_nsUUID, 0);
  objc_storeStrong((id *)&self->_userDialogActs, 0);
}

- (void)setComparableProbability:(double)a3
{
  self->_comparableProbability = a3;
}

- (double)comparableProbability
{
  return self->_comparableProbability;
}

- (void)setParser:(id)a3
{
}

- (SIRINLUParser)parser
{
  return self->_parser;
}

- (void)setRepetitionResult:(id)a3
{
}

- (SIRINLURepetitionResult)repetitionResult
{
  return self->_repetitionResult;
}

- (void)setParserId:(id)a3
{
}

- (NSString)parserId
{
  return self->_parserId;
}

- (void)setNsUUID:(id)a3
{
}

- (NSUUID)nsUUID
{
  return self->_nsUUID;
}

- (void)setProbability:(double)a3
{
  self->_probability = a3;
}

- (double)probability
{
  return self->_probability;
}

- (void)setUserDialogActs:(id)a3
{
}

- (NSArray)userDialogActs
{
  return self->_userDialogActs;
}

- (id)description
{
  v3 = [(SIRINLUUserParse *)self userDialogActs];
  v4 = +[SIRINLUPrintUtils indentArray:v3 numSpaces:4];

  v5 = NSString;
  [(SIRINLUUserParse *)self probability];
  uint64_t v7 = v6;
  v8 = [(SIRINLUUserParse *)self nsUUID];
  v9 = [v8 UUIDString];
  v10 = [(SIRINLUUserParse *)self parserId];
  v11 = [(SIRINLUUserParse *)self repetitionResult];
  v12 = [v11 description];
  v13 = [(SIRINLUUserParse *)self parser];
  v14 = [v13 description];
  [(SIRINLUUserParse *)self comparableProbability];
  v16 = [v5 stringWithFormat:@"{UserParse\n  userDialogActs:\n%@\n  probability: %f\n  nsUUID: %@\n  parserId: %@\n  repetitionResult: %@\n  parser: %@\n  comparableProbability: %f\n}", v4, v7, v9, v10, v12, v14, v15];

  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = NSNumber;
  double probability = self->_probability;
  id v6 = a3;
  id v13 = [v4 numberWithDouble:probability];
  uint64_t v7 = [NSNumber numberWithDouble:self->_comparableProbability];
  v8 = [(SIRINLUUserParse *)self userDialogActs];
  [v6 encodeObject:v8 forKey:@"userDialogActs"];

  [v6 encodeObject:v13 forKey:@"probability"];
  v9 = [(SIRINLUUserParse *)self nsUUID];
  [v6 encodeObject:v9 forKey:@"nsUUID"];

  v10 = [(SIRINLUUserParse *)self parserId];
  [v6 encodeObject:v10 forKey:@"parserId"];

  v11 = [(SIRINLUUserParse *)self repetitionResult];
  [v6 encodeObject:v11 forKey:@"repetitionResult"];

  v12 = [(SIRINLUUserParse *)self parser];
  [v6 encodeObject:v12 forKey:@"parser"];

  [v6 encodeObject:v7 forKey:@"comparableProbability"];
}

- (SIRINLUUserParse)initWithCoder:(id)a3
{
  v26 = (void *)MEMORY[0x1E4F1CAD0];
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  id v13 = objc_msgSend(v26, "setWithObjects:", v4, v5, v6, v7, v8, v9, v10, v11, v12, objc_opt_class(), 0);
  v14 = [v3 decodeObjectOfClasses:v13 forKey:@"userDialogActs"];
  uint64_t v15 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"probability"];
  v16 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"nsUUID"];
  v17 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"parserId"];
  [v15 doubleValue];
  double v19 = v18;
  v20 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"repetitionResult"];
  v21 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"parser"];
  v22 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"comparableProbability"];

  [v22 doubleValue];
  v24 = [(SIRINLUUserParse *)self initWithUserDialogActs:v14 probability:v16 nsUUID:v17 parserId:v20 repetitionResult:v21 parser:v19 comparableProbability:v23];

  return v24;
}

- (SIRINLUUserParse)initWithUserDialogActs:(id)a3 probability:(double)a4 nsUUID:(id)a5 parserId:(id)a6 repetitionResult:(id)a7 parser:(id)a8 comparableProbability:(double)a9
{
  id v24 = a3;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  v25.receiver = self;
  v25.super_class = (Class)SIRINLUUserParse;
  v21 = [(SIRINLUUserParse *)&v25 init];
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_userDialogActs, a3);
    v22->_double probability = a4;
    objc_storeStrong((id *)&v22->_nsUUID, a5);
    objc_storeStrong((id *)&v22->_parserId, a6);
    objc_storeStrong((id *)&v22->_repetitionResult, a7);
    objc_storeStrong((id *)&v22->_parser, a8);
    v22->_comparableProbability = a9;
  }

  return v22;
}

- (SIRINLUUserParse)initWithUserDialogActs:(id)a3 probability:(double)a4 nsUUID:(id)a5 parserId:(id)a6 repetitionResult:(id)a7 comparableProbability:(double)a8
{
  return [(SIRINLUUserParse *)self initWithUserDialogActs:a3 probability:a5 nsUUID:a6 parserId:a7 repetitionResult:0 parser:a4 comparableProbability:a8];
}

- (SIRINLUUserParse)initWithUserDialogActs:(id)a3 probability:(double)a4 nsUUID:(id)a5 parserId:(id)a6 repetitionResult:(id)a7
{
  return [(SIRINLUUserParse *)self initWithUserDialogActs:a3 probability:a5 nsUUID:a6 parserId:a7 repetitionResult:0 parser:a4 comparableProbability:0.0];
}

- (SIRINLUUserParse)initWithUserDialogActs:(id)a3 probability:(double)a4 nsUUID:(id)a5 parserId:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  id v13 = [[SIRINLURepetitionResult alloc] initWithAsrHypothesisIndex:0 repetitionType:0];
  v14 = [(SIRINLUUserParse *)self initWithUserDialogActs:v12 probability:v11 nsUUID:v10 parserId:v13 repetitionResult:0 parser:a4 comparableProbability:0.0];

  return v14;
}

- (SIRINLUUserParse)initWithUserDialogActs:(id)a3 probability:(double)a4 parserId:(id)a5
{
  uint64_t v8 = (void *)MEMORY[0x1E4F29128];
  id v9 = a5;
  id v10 = a3;
  id v11 = [v8 UUID];
  id v12 = [(SIRINLUUserParse *)self initWithUserDialogActs:v10 probability:v11 nsUUID:v9 parserId:a4];

  return v12;
}

- (SIRINLUUserParse)initWithUserDialogActs:(id)a3 probability:(double)a4 parserId:(id)a5 repetitionResult:(id)a6
{
  id v10 = (void *)MEMORY[0x1E4F29128];
  id v11 = a6;
  id v12 = a5;
  id v13 = a3;
  v14 = [v10 UUID];
  uint64_t v15 = [(SIRINLUUserParse *)self initWithUserDialogActs:v13 probability:v14 nsUUID:v12 parserId:v11 repetitionResult:0 parser:a4 comparableProbability:0.0];

  return v15;
}

- (SIRINLUUserParse)initWithUserDialogActs:(id)a3 probability:(double)a4 parserId:(id)a5 repetitionResult:(id)a6 parser:(id)a7
{
  id v12 = (void *)MEMORY[0x1E4F29128];
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a3;
  id v17 = [v12 UUID];
  id v18 = [(SIRINLUUserParse *)self initWithUserDialogActs:v16 probability:v17 nsUUID:v15 parserId:v14 repetitionResult:v13 parser:a4 comparableProbability:0.0];

  return v18;
}

- (SIRINLUUserParse)initWithUserDialogActs:(id)a3 probability:(double)a4 parserId:(id)a5 repetitionResult:(id)a6 parser:(id)a7 comparableProbability:(double)a8
{
  id v14 = (void *)MEMORY[0x1E4F29128];
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a3;
  id v19 = [v14 UUID];
  id v20 = [(SIRINLUUserParse *)self initWithUserDialogActs:v18 probability:v19 nsUUID:v17 parserId:v16 repetitionResult:v15 parser:a4 comparableProbability:a8];

  return v20;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
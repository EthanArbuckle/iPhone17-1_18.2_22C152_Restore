@interface SIRINLURepetitionResult
+ (BOOL)supportsSecureCoding;
- (SIRINLURepetitionResult)initWithAsrHypothesisIndex:(unsigned int)a3 repetitionType:(unsigned int)a4;
- (SIRINLURepetitionResult)initWithCoder:(id)a3;
- (id)description;
- (unsigned)asrHypothesisIndex;
- (unsigned)repetitionType;
- (void)encodeWithCoder:(id)a3;
- (void)setAsrHypothesisIndex:(unsigned int)a3;
- (void)setRepetitionType:(unsigned int)a3;
@end

@implementation SIRINLURepetitionResult

- (void)setRepetitionType:(unsigned int)a3
{
  self->_repetitionType = a3;
}

- (unsigned)repetitionType
{
  return self->_repetitionType;
}

- (void)setAsrHypothesisIndex:(unsigned int)a3
{
  self->_asrHypothesisIndex = a3;
}

- (unsigned)asrHypothesisIndex
{
  return self->_asrHypothesisIndex;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"{RepetitionResult:\n  asrHypothesisIndex: %d\n  repetitionType: %d\n}", -[SIRINLURepetitionResult asrHypothesisIndex](self, "asrHypothesisIndex"), -[SIRINLURepetitionResult repetitionType](self, "repetitionType"));
}

- (void)encodeWithCoder:(id)a3
{
  v4 = NSNumber;
  uint64_t asrHypothesisIndex = self->_asrHypothesisIndex;
  id v6 = a3;
  id v8 = [v4 numberWithUnsignedInt:asrHypothesisIndex];
  [v6 encodeObject:v8 forKey:@"asrHypothesisIndex"];
  v7 = [NSNumber numberWithUnsignedInt:self->_repetitionType];
  [v6 encodeObject:v7 forKey:@"repetitionType"];
}

- (SIRINLURepetitionResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SIRINLURepetitionResult;
  v5 = [(SIRINLURepetitionResult *)&v9 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"asrHypothesisIndex"];
    v5->_uint64_t asrHypothesisIndex = [v6 unsignedIntValue];
    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"repetitionType"];
    v5->_repetitionType = [v7 unsignedIntValue];
  }
  return v5;
}

- (SIRINLURepetitionResult)initWithAsrHypothesisIndex:(unsigned int)a3 repetitionType:(unsigned int)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SIRINLURepetitionResult;
  result = [(SIRINLURepetitionResult *)&v7 init];
  if (result)
  {
    result->_uint64_t asrHypothesisIndex = a3;
    result->_repetitionType = a4;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
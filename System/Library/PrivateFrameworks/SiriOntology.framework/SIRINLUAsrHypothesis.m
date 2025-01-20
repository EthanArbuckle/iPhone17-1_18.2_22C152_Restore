@interface SIRINLUAsrHypothesis
+ (BOOL)supportsSecureCoding;
- (NSArray)asrTokens;
- (NSString)utterance;
- (NSUUID)uuid;
- (SIRINLUAsrHypothesis)initWithCoder:(id)a3;
- (SIRINLUAsrHypothesis)initWithUtterance:(id)a3 probability:(double)a4 asrTokens:(id)a5 uuid:(id)a6;
- (SIRINLUAsrHypothesis)initWithUtterance:(id)a3 probability:(double)a4 uuid:(id)a5;
- (double)probability;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setAsrTokens:(id)a3;
- (void)setProbability:(double)a3;
- (void)setUtterance:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation SIRINLUAsrHypothesis

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_asrTokens, 0);
  objc_storeStrong((id *)&self->_utterance, 0);
}

- (void)setUuid:(id)a3
{
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setAsrTokens:(id)a3
{
}

- (NSArray)asrTokens
{
  return self->_asrTokens;
}

- (void)setProbability:(double)a3
{
  self->_probability = a3;
}

- (double)probability
{
  return self->_probability;
}

- (void)setUtterance:(id)a3
{
}

- (NSString)utterance
{
  return self->_utterance;
}

- (id)description
{
  v3 = [(SIRINLUAsrHypothesis *)self asrTokens];
  v4 = +[SIRINLUPrintUtils indentArray:v3 numSpaces:4];

  v5 = NSString;
  v6 = [(SIRINLUAsrHypothesis *)self utterance];
  [(SIRINLUAsrHypothesis *)self probability];
  uint64_t v8 = v7;
  v9 = [(SIRINLUAsrHypothesis *)self uuid];
  v10 = [v9 UUIDString];
  v11 = [v5 stringWithFormat:@"{AsrHypothesis:\n  utterance: %@\n  probability: %f\n  asrTokens: %@\n  uuid: %@\n}", v6, v8, v4, v10];

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = NSNumber;
  double probability = self->_probability;
  id v6 = a3;
  id v10 = [v4 numberWithDouble:probability];
  uint64_t v7 = [(SIRINLUAsrHypothesis *)self utterance];
  [v6 encodeObject:v7 forKey:@"utterance"];

  [v6 encodeObject:v10 forKey:@"probability"];
  uint64_t v8 = [(SIRINLUAsrHypothesis *)self uuid];
  [v6 encodeObject:v8 forKey:@"uuid"];

  v9 = [(SIRINLUAsrHypothesis *)self asrTokens];
  [v6 encodeObject:v9 forKey:@"asrTokens"];
}

- (SIRINLUAsrHypothesis)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SIRINLUAsrHypothesis;
  v5 = [(SIRINLUAsrHypothesis *)&v18 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"utterance"];
    utterance = v5->_utterance;
    v5->_utterance = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"probability"];
    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uuid"];
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v9;

    [v8 doubleValue];
    v5->_double probability = v11;
    v12 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v13 = objc_opt_class();
    v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"asrTokens"];
    asrTokens = v5->_asrTokens;
    v5->_asrTokens = (NSArray *)v15;
  }
  return v5;
}

- (SIRINLUAsrHypothesis)initWithUtterance:(id)a3 probability:(double)a4 asrTokens:(id)a5 uuid:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)SIRINLUAsrHypothesis;
  v14 = [(SIRINLUAsrHypothesis *)&v17 init];
  uint64_t v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_utterance, a3);
    v15->_double probability = a4;
    objc_storeStrong((id *)&v15->_uuid, a6);
    objc_storeStrong((id *)&v15->_asrTokens, a5);
  }

  return v15;
}

- (SIRINLUAsrHypothesis)initWithUtterance:(id)a3 probability:(double)a4 uuid:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SIRINLUAsrHypothesis;
  id v11 = [(SIRINLUAsrHypothesis *)&v15 init];
  id v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_utterance, a3);
    v12->_double probability = a4;
    objc_storeStrong((id *)&v12->_uuid, a5);
    asrTokens = v12->_asrTokens;
    v12->_asrTokens = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
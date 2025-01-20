@interface TITypologyRecordCandidateRejected
+ (BOOL)supportsSecureCoding;
- (TIKeyboardCandidate)candidate;
- (TITypologyRecordCandidateRejected)initWithCoder:(id)a3;
- (id)shortDescription;
- (void)applyToStatistic:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setCandidate:(id)a3;
@end

@implementation TITypologyRecordCandidateRejected

- (void).cxx_destruct
{
}

- (void)setCandidate:(id)a3
{
}

- (TIKeyboardCandidate)candidate
{
  return self->_candidate;
}

- (id)shortDescription
{
  v2 = NSString;
  v3 = [(TITypologyRecordCandidateRejected *)self candidate];
  v4 = [v3 candidate];
  v5 = [v2 stringWithFormat:@"CANDIDATE REJECTED: \"%@\"", v4];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TITypologyRecordCandidateRejected;
  id v4 = a3;
  [(TITypologyRecord *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_candidate, @"candidate", v5.receiver, v5.super_class);
}

- (TITypologyRecordCandidateRejected)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TITypologyRecordCandidateRejected;
  objc_super v5 = [(TITypologyRecord *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"candidate"];
    candidate = v5->_candidate;
    v5->_candidate = (TIKeyboardCandidate *)v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)applyToStatistic:(id)a3
{
}

@end
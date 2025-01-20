@interface TITypologyRecordTextAccepted
+ (BOOL)supportsSecureCoding;
- (TIKeyboardCandidate)candidate;
- (TITypologyRecordTextAccepted)initWithCoder:(id)a3;
- (id)changedText;
- (id)shortDescription;
- (id)textSummary;
- (void)applyToStatistic:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setCandidate:(id)a3;
@end

@implementation TITypologyRecordTextAccepted

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

- (id)changedText
{
  v3 = [(TITypologyRecordTextAccepted *)self candidate];
  v4 = [v3 input];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    v6 = NSString;
    v7 = [(TITypologyRecordTextAccepted *)self candidate];
    v8 = [v7 input];
    v9 = [(TITypologyRecordTextAccepted *)self candidate];
    v10 = [v9 candidate];
    v11 = [v6 stringWithFormat:@"%@->%@", v8, v10];

LABEL_5:
    goto LABEL_6;
  }
  v12 = [(TITypologyRecordTextAccepted *)self candidate];
  v13 = [v12 candidate];

  if (v13)
  {
    v7 = [(TITypologyRecordTextAccepted *)self candidate];
    v11 = [v7 candidate];
    goto LABEL_5;
  }
  v11 = 0;
LABEL_6:

  return v11;
}

- (id)shortDescription
{
  v3 = NSString;
  v4 = [(TITypologyRecordTextAccepted *)self candidate];
  uint64_t v5 = [v4 candidate];
  v6 = [(TITypologyRecordTextAccepted *)self candidate];
  v7 = [v6 input];
  v8 = [v3 stringWithFormat:@"TEXT ACCEPTED: \"%@\" for \"%@\"", v5, v7];

  return v8;
}

- (id)textSummary
{
  v3 = [(TITypologyRecordTextAccepted *)self candidate];
  int v4 = [v3 isAutocorrection];

  if (v4)
  {
    uint64_t v5 = [(TITypologyRecordTextAccepted *)self candidate];
    v6 = [(TITypologyRecord *)self textSummaryForAutocorrection:v5];
  }
  else
  {
    v6 = &stru_1EDBDCE38;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TITypologyRecordTextAccepted;
  id v4 = a3;
  [(TITypologyRecord *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_candidate, @"candidate", v5.receiver, v5.super_class);
}

- (TITypologyRecordTextAccepted)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TITypologyRecordTextAccepted;
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
@interface TITypologyRecordAcceptedCandidate
+ (BOOL)supportsSecureCoding;
- (NSString)textToCommit;
- (TIKeyboardCandidate)candidate;
- (TIKeyboardConfiguration)keyboardConfig;
- (TIKeyboardState)keyboardState;
- (TITypologyRecordAcceptedCandidate)initWithCoder:(id)a3;
- (id)changedText;
- (id)shortDescription;
- (id)textSummary;
- (void)applyToStatistic:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)removeContextFromKeyboardState;
- (void)replaceDocumentState:(id)a3;
- (void)setCandidate:(id)a3;
- (void)setKeyboardConfig:(id)a3;
- (void)setKeyboardState:(id)a3;
- (void)setTextToCommit:(id)a3;
@end

@implementation TITypologyRecordAcceptedCandidate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textToCommit, 0);
  objc_storeStrong((id *)&self->_keyboardConfig, 0);
  objc_storeStrong((id *)&self->_keyboardState, 0);

  objc_storeStrong((id *)&self->_candidate, 0);
}

- (void)setTextToCommit:(id)a3
{
}

- (NSString)textToCommit
{
  return self->_textToCommit;
}

- (void)setKeyboardConfig:(id)a3
{
}

- (TIKeyboardConfiguration)keyboardConfig
{
  return self->_keyboardConfig;
}

- (void)setKeyboardState:(id)a3
{
}

- (TIKeyboardState)keyboardState
{
  return self->_keyboardState;
}

- (void)setCandidate:(id)a3
{
}

- (TIKeyboardCandidate)candidate
{
  return self->_candidate;
}

- (void)replaceDocumentState:(id)a3
{
  id v4 = a3;
  id v5 = [(TITypologyRecordAcceptedCandidate *)self keyboardState];
  [v5 setDocumentState:v4];
}

- (id)changedText
{
  v3 = [(TITypologyRecordAcceptedCandidate *)self candidate];
  id v4 = [v3 input];
  if ([v4 length])
  {
    id v5 = [(TITypologyRecordAcceptedCandidate *)self candidate];
    v6 = [v5 input];
    v7 = [(TITypologyRecordAcceptedCandidate *)self candidate];
    v8 = [v7 candidate];
    char v9 = [v6 isEqualToString:v8];

    if ((v9 & 1) == 0)
    {
      v10 = NSString;
      v11 = [(TITypologyRecordAcceptedCandidate *)self candidate];
      v12 = [v11 input];
      v13 = [(TITypologyRecordAcceptedCandidate *)self candidate];
      v14 = [v13 candidate];
      v15 = [v10 stringWithFormat:@"%@->%@", v12, v14];

LABEL_7:
      goto LABEL_9;
    }
  }
  else
  {
  }
  v16 = [(TITypologyRecordAcceptedCandidate *)self candidate];
  v17 = [v16 candidate];

  if (v17)
  {
    v11 = [(TITypologyRecordAcceptedCandidate *)self candidate];
    v15 = [v11 candidate];
    goto LABEL_7;
  }
  v15 = 0;
LABEL_9:

  return v15;
}

- (id)shortDescription
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = [(TITypologyRecordAcceptedCandidate *)self candidate];
  id v5 = [v4 candidate];
  v6 = [v3 stringWithFormat:@"ACCEPTED %@", v5];

  v7 = [(TITypologyRecordAcceptedCandidate *)self textToCommit];

  if (v7)
  {
    v8 = [(TITypologyRecordAcceptedCandidate *)self textToCommit];
    [v6 appendFormat:@"; COMMIT \"%@\"", v8];
  }
  char v9 = [(TITypologyRecordAcceptedCandidate *)self keyboardConfig];
  v10 = [v9 intermediateText];

  if (v10)
  {
    v11 = [(TITypologyRecordAcceptedCandidate *)self keyboardConfig];
    v12 = [v11 intermediateText];
    [v6 appendFormat:@"; %@", v12];
  }

  return v6;
}

- (id)textSummary
{
  v2 = [(TITypologyRecordAcceptedCandidate *)self candidate];
  v3 = [v2 candidate];
  id v4 = v3;
  if (!v3) {
    v3 = &stru_1EDBDCE38;
  }
  id v5 = v3;

  return v5;
}

- (void)removeContextFromKeyboardState
{
  v3 = [(TITypologyRecordAcceptedCandidate *)self keyboardState];
  id v4 = (id)[v3 copy];

  [v4 setInputContextHistory:0];
  [(TITypologyRecordAcceptedCandidate *)self setKeyboardState:v4];
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TITypologyRecordAcceptedCandidate;
  id v4 = a3;
  [(TITypologyRecord *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_candidate, @"candidate", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_keyboardState forKey:@"keyboardState"];
  [v4 encodeObject:self->_keyboardConfig forKey:@"keyboardConfig"];
  [v4 encodeObject:self->_textToCommit forKey:@"textToCommit"];
}

- (TITypologyRecordAcceptedCandidate)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)TITypologyRecordAcceptedCandidate;
  objc_super v5 = [(TITypologyRecord *)&v16 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"candidate"];
    candidate = v5->_candidate;
    v5->_candidate = (TIKeyboardCandidate *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"keyboardState"];
    keyboardState = v5->_keyboardState;
    v5->_keyboardState = (TIKeyboardState *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"keyboardConfig"];
    keyboardConfig = v5->_keyboardConfig;
    v5->_keyboardConfig = (TIKeyboardConfiguration *)v10;

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"textToCommit"];
    uint64_t v13 = [v12 copy];
    textToCommit = v5->_textToCommit;
    v5->_textToCommit = (NSString *)v13;
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
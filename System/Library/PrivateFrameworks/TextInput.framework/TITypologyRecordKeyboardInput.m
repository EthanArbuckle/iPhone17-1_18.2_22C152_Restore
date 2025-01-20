@interface TITypologyRecordKeyboardInput
+ (BOOL)supportsSecureCoding;
- (TIKeyboardConfiguration)keyboardConfig;
- (TIKeyboardInput)input;
- (TIKeyboardOutput)output;
- (TIKeyboardState)keyboardState;
- (TITypologyRecordKeyboardInput)initWithCoder:(id)a3;
- (id)changedText;
- (id)shortDescription;
- (id)textSummary;
- (void)applyToStatistic:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)removeContextFromKeyboardState;
- (void)replaceDocumentState:(id)a3;
- (void)setInput:(id)a3;
- (void)setKeyboardConfig:(id)a3;
- (void)setKeyboardState:(id)a3;
- (void)setOutput:(id)a3;
@end

@implementation TITypologyRecordKeyboardInput

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboardConfig, 0);
  objc_storeStrong((id *)&self->_output, 0);
  objc_storeStrong((id *)&self->_keyboardState, 0);

  objc_storeStrong((id *)&self->_input, 0);
}

- (void)setKeyboardConfig:(id)a3
{
}

- (TIKeyboardConfiguration)keyboardConfig
{
  return self->_keyboardConfig;
}

- (void)setOutput:(id)a3
{
}

- (TIKeyboardOutput)output
{
  return self->_output;
}

- (void)setKeyboardState:(id)a3
{
}

- (TIKeyboardState)keyboardState
{
  return self->_keyboardState;
}

- (void)setInput:(id)a3
{
}

- (TIKeyboardInput)input
{
  return self->_input;
}

- (void)replaceDocumentState:(id)a3
{
  id v4 = a3;
  id v5 = [(TITypologyRecordKeyboardInput *)self keyboardState];
  [v5 setDocumentState:v4];
}

- (id)changedText
{
  v3 = [(TITypologyRecordKeyboardInput *)self output];
  uint64_t v4 = [v3 deletionCount];

  if (v4)
  {
    id v5 = NSString;
    v6 = [(TITypologyRecordKeyboardInput *)self output];
    v7 = objc_msgSend(v5, "stringWithFormat:", @"-%li", objc_msgSend(v6, "deletionCount"));
    goto LABEL_19;
  }
  v8 = [(TITypologyRecordKeyboardInput *)self input];
  v9 = [v8 string];

  v10 = [(TITypologyRecordKeyboardInput *)self input];
  v11 = [v10 acceptedCandidate];
  v7 = [v11 candidate];

  if (!v9)
  {
    if (!v7) {
      goto LABEL_20;
    }
    v26 = [(TITypologyRecordKeyboardInput *)self input];
    v27 = [v26 acceptedCandidate];
    v28 = [v27 input];
    v29 = [(TITypologyRecordKeyboardInput *)self input];
    v30 = [v29 acceptedCandidate];
    v31 = [v30 candidate];
    char v32 = [v28 isEqualToString:v31];

    if (v32)
    {
      v6 = [(TITypologyRecordKeyboardInput *)self input];
      v33 = [v6 acceptedCandidate];
      v7 = [v33 candidate];

      goto LABEL_19;
    }
    v46 = NSString;
    v6 = [(TITypologyRecordKeyboardInput *)self input];
    v37 = [v6 acceptedCandidate];
    v38 = [v37 input];
    v47 = [(TITypologyRecordKeyboardInput *)self input];
    v48 = [v47 acceptedCandidate];
    v49 = [v48 candidate];
    v7 = [v46 stringWithFormat:@"%@->%@", v38, v49];

LABEL_18:
    goto LABEL_19;
  }
  v12 = [(TITypologyRecordKeyboardInput *)self input];
  v13 = v12;
  if (v7)
  {
    v14 = [v12 acceptedCandidate];
    v15 = [v14 input];
    v16 = [(TITypologyRecordKeyboardInput *)self input];
    v17 = [v16 acceptedCandidate];
    v18 = [v17 candidate];
    char v19 = [v15 isEqualToString:v18];

    v20 = NSString;
    v21 = [(TITypologyRecordKeyboardInput *)self input];
    v13 = v21;
    if (v19)
    {
      v22 = [v21 string];
      v23 = [(TITypologyRecordKeyboardInput *)self input];
      v24 = [v23 acceptedCandidate];
      v25 = [v24 candidate];
      v7 = [v20 stringWithFormat:@"|%@->%@", v22, v25];
    }
    else
    {
      v22 = [v21 acceptedCandidate];
      v23 = [v22 input];
      v24 = [(TITypologyRecordKeyboardInput *)self input];
      v25 = [v24 acceptedCandidate];
      v34 = [v25 candidate];
      v35 = [(TITypologyRecordKeyboardInput *)self input];
      v36 = [v35 string];
      v7 = [v20 stringWithFormat:@"%@->%@|%@", v23, v34, v36];
    }
  }
  else
  {
    v7 = [v12 string];
  }

  v6 = [(TITypologyRecordKeyboardInput *)self input];
  v37 = [v6 string];
  v38 = [(TITypologyRecordKeyboardInput *)self output];
  v39 = [v38 insertionText];
  if ([v37 isEqualToString:v39])
  {

    goto LABEL_18;
  }
  v40 = [(TITypologyRecordKeyboardInput *)self output];
  v41 = [v40 insertionText];
  uint64_t v42 = [v41 length];

  if (!v42) {
    goto LABEL_20;
  }
  v43 = NSString;
  v6 = [(TITypologyRecordKeyboardInput *)self output];
  v44 = [v6 insertionText];
  uint64_t v45 = [v43 stringWithFormat:@"%@->%@|", v7, v44];

  v7 = (void *)v45;
LABEL_19:

LABEL_20:

  return v7;
}

- (id)shortDescription
{
  v3 = [MEMORY[0x1E4F28E78] stringWithString:@"INPUT "];
  uint64_t v4 = [(TITypologyRecordKeyboardInput *)self input];
  id v5 = [v4 string];

  v6 = [(TITypologyRecordKeyboardInput *)self input];
  v7 = v6;
  if (v5)
  {
    v8 = [v6 string];
    [v3 appendFormat:@"\"%@\"", v8];
LABEL_3:

    goto LABEL_10;
  }
  int v9 = [v6 isBackspace];

  if (v9)
  {
    v10 = @"delete";
  }
  else
  {
    v11 = [(TITypologyRecordKeyboardInput *)self input];
    v12 = [v11 object];

    if (v12)
    {
      v7 = [(TITypologyRecordKeyboardInput *)self input];
      v8 = [v7 object];
      v13 = [v8 description];
      [v3 appendString:v13];

      goto LABEL_3;
    }
    v10 = @"none";
  }
  [v3 appendString:v10];
LABEL_10:
  v14 = [(TITypologyRecordKeyboardInput *)self output];
  [v3 appendFormat:@" -> OUTPUT \"%@\"", v14];

  v15 = [(TITypologyRecordKeyboardInput *)self input];
  v16 = [v15 acceptedCandidate];

  if (v16)
  {
    v17 = [(TITypologyRecordKeyboardInput *)self input];
    v18 = [v17 acceptedCandidate];
    char v19 = [v18 candidate];
    [v3 appendFormat:@"; accepted \"%@\"", v19];
  }
  v20 = [(TITypologyRecordKeyboardInput *)self input];
  int v21 = [v20 isSynthesizedByAcceptingCandidate];

  if (v21) {
    [v3 appendFormat:@"; synth"];
  }
  v22 = [(TITypologyRecordKeyboardInput *)self input];
  v23 = [v22 touchEvent];

  if (v23)
  {
    v24 = [(TITypologyRecordKeyboardInput *)self input];
    v25 = [v24 touchEvent];
    v26 = [v25 shortDescription];
    [v3 appendFormat:@"; touch %@", v26];
  }
  v27 = [(TITypologyRecordKeyboardInput *)self keyboardConfig];
  v28 = [v27 intermediateText];

  if (v28)
  {
    v29 = [(TITypologyRecordKeyboardInput *)self keyboardConfig];
    v30 = [v29 intermediateText];
    [v3 appendFormat:@"; %@", v30];
  }
  v31 = [(TITypologyRecordKeyboardInput *)self keyboardState];
  char v32 = [v31 documentState];
  [v3 appendFormat:@" (doc=%@)", v32];

  return v3;
}

- (id)textSummary
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  uint64_t v4 = [(TITypologyRecordKeyboardInput *)self input];
  id v5 = [v4 acceptedCandidate];
  int v6 = [v5 isAutocorrection];

  if (v6)
  {
    v7 = [(TITypologyRecordKeyboardInput *)self input];
    v8 = [v7 acceptedCandidate];
    int v9 = [(TITypologyRecord *)self textSummaryForAutocorrection:v8];
    [v3 appendString:v9];
  }
  v10 = [(TITypologyRecordKeyboardInput *)self output];
  uint64_t v11 = [v10 deletionCount];

  if (v11)
  {
    unint64_t v12 = 0;
    do
    {
      [v3 appendString:@"\\b"];
      ++v12;
      v13 = [(TITypologyRecordKeyboardInput *)self output];
      unint64_t v14 = [v13 deletionCount];
    }
    while (v12 < v14);
  }
  v15 = [(TITypologyRecordKeyboardInput *)self output];
  v16 = [v15 insertionText];

  if (v16)
  {
    v17 = [(TITypologyRecordKeyboardInput *)self output];
    v18 = [v17 insertionText];

    char v19 = [v18 stringByReplacingOccurrencesOfString:@"\\" withString:@"\\\\"];

    v20 = [v19 stringByReplacingOccurrencesOfString:@"\n" withString:@"\\n"];

    [v3 appendString:v20];
  }

  return v3;
}

- (void)removeContextFromKeyboardState
{
  id v3 = [(TITypologyRecordKeyboardInput *)self keyboardState];
  id v4 = (id)[v3 copy];

  [v4 setInputContextHistory:0];
  [(TITypologyRecordKeyboardInput *)self setKeyboardState:v4];
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TITypologyRecordKeyboardInput;
  id v4 = a3;
  [(TITypologyRecord *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_input, @"input", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_keyboardState forKey:@"keyboardState"];
  [v4 encodeObject:self->_output forKey:@"output"];
  [v4 encodeObject:self->_keyboardConfig forKey:@"keyboardConfig"];
}

- (TITypologyRecordKeyboardInput)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TITypologyRecordKeyboardInput;
  objc_super v5 = [(TITypologyRecord *)&v15 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"input"];
    input = v5->_input;
    v5->_input = (TIKeyboardInput *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"keyboardState"];
    keyboardState = v5->_keyboardState;
    v5->_keyboardState = (TIKeyboardState *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"output"];
    output = v5->_output;
    v5->_output = (TIKeyboardOutput *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"keyboardConfig"];
    keyboardConfig = v5->_keyboardConfig;
    v5->_keyboardConfig = (TIKeyboardConfiguration *)v12;
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
@interface SASTestingInput
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)text;
- (NSURL)recordedSpeechURL;
- (SASTestingInput)initWithBuilder:(id)a3;
- (SASTestingInput)initWithCoder:(id)a3;
- (SASTestingInput)initWithType:(int64_t)a3 text:(id)a4 recordedSpeechURL:(id)a5;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (int64_t)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SASTestingInput

- (SASTestingInput)initWithBuilder:(id)a3
{
  v4 = +[SASTestingInput newWithBuilder:a3];

  return v4;
}

- (SASTestingInput)initWithType:(int64_t)a3 text:(id)a4 recordedSpeechURL:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SASTestingInput;
  v10 = [(SASTestingInput *)&v17 init];
  v11 = v10;
  if (v10)
  {
    v10->_type = a3;
    uint64_t v12 = [v8 copy];
    text = v11->_text;
    v11->_text = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    recordedSpeechURL = v11->_recordedSpeechURL;
    v11->_recordedSpeechURL = (NSURL *)v14;
  }
  return v11;
}

- (id)description
{
  v20[3] = *MEMORY[0x1E4F143B8];
  id v3 = [NSString alloc];
  v19.receiver = self;
  v19.super_class = (Class)SASTestingInput;
  v4 = [(SASTestingInput *)&v19 description];
  id v5 = [NSString alloc];
  unint64_t type = self->_type;
  v7 = SASTestingInputTypeGetName(type);
  id v8 = (void *)[v5 initWithFormat:@"type = %ld (%@)", type, v7];
  v20[0] = v8;
  id v9 = [NSString alloc];
  v10 = [(NSString *)self->_text description];
  v11 = (void *)[v9 initWithFormat:@"text = %@", v10];
  v20[1] = v11;
  id v12 = [NSString alloc];
  v13 = [(NSURL *)self->_recordedSpeechURL description];
  uint64_t v14 = (void *)[v12 initWithFormat:@"recordedSpeechURL = %@", v13];
  v20[2] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:3];
  v16 = [v15 componentsJoinedByString:@", "];
  objc_super v17 = (void *)[v3 initWithFormat:@"%@ {%@}", v4, v16];

  return v17;
}

- (unint64_t)hash
{
  id v3 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_type];
  uint64_t v4 = [v3 hash];
  NSUInteger v5 = [(NSString *)self->_text hash];
  unint64_t v6 = v5 ^ [(NSURL *)self->_recordedSpeechURL hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (SASTestingInput *)a3;
  if (self == v4)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      NSUInteger v5 = v4;
      int64_t type = self->_type;
      if (type == [(SASTestingInput *)v5 type])
      {
        v7 = [(SASTestingInput *)v5 text];
        text = self->_text;
        if (text == v7 || [(NSString *)text isEqual:v7])
        {
          id v9 = [(SASTestingInput *)v5 recordedSpeechURL];
          recordedSpeechURL = self->_recordedSpeechURL;
          BOOL v11 = recordedSpeechURL == v9 || [(NSURL *)recordedSpeechURL isEqual:v9];
        }
        else
        {
          BOOL v11 = 0;
        }
      }
      else
      {
        BOOL v11 = 0;
      }
    }
    else
    {
      BOOL v11 = 0;
    }
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SASTestingInput)initWithCoder:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SASTestingInput::type"];
  uint64_t v6 = [v5 integerValue];

  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SASTestingInput::text"];
  id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SASTestingInput::recordedSpeechURL"];

  id v9 = [(SASTestingInput *)self initWithType:v6 text:v7 recordedSpeechURL:v8];
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F28ED0];
  int64_t type = self->_type;
  id v7 = a3;
  uint64_t v6 = [v4 numberWithInteger:type];
  [v7 encodeObject:v6 forKey:@"SASTestingInput::type"];

  [v7 encodeObject:self->_text forKey:@"SASTestingInput::text"];
  [v7 encodeObject:self->_recordedSpeechURL forKey:@"SASTestingInput::recordedSpeechURL"];
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)text
{
  return self->_text;
}

- (NSURL)recordedSpeechURL
{
  return self->_recordedSpeechURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordedSpeechURL, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

+ (id)newWithBuilder:(id)a3
{
  id v3 = (void (**)(id, _SASTestingInputMutation *))a3;
  id v4 = objc_alloc_init(_SASTestingInputMutation);
  if (v3) {
    v3[2](v3, v4);
  }
  NSUInteger v5 = [(_SASTestingInputMutation *)v4 generate];

  return v5;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  id v4 = (void (**)(id, _SASTestingInputMutation *))a3;
  if (v4)
  {
    NSUInteger v5 = [[_SASTestingInputMutation alloc] initWithBaseModel:self];
    v4[2](v4, v5);
    uint64_t v6 = [(_SASTestingInputMutation *)v5 generate];
  }
  else
  {
    uint64_t v6 = (void *)[(SASTestingInput *)self copy];
  }

  return v6;
}

@end
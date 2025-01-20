@interface _SASTestingInputMutation
- (_SASTestingInputMutation)init;
- (_SASTestingInputMutation)initWithBaseModel:(id)a3;
- (id)generate;
- (void)setRecordedSpeechURL:(id)a3;
- (void)setText:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation _SASTestingInputMutation

- (_SASTestingInputMutation)init
{
  return [(_SASTestingInputMutation *)self initWithBaseModel:0];
}

- (_SASTestingInputMutation)initWithBaseModel:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SASTestingInputMutation;
  v6 = [(_SASTestingInputMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_baseModel, a3);
  }

  return v7;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
  *(unsigned char *)&self->_mutationFlags |= 3u;
}

- (void)setText:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 5u;
}

- (void)setRecordedSpeechURL:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 9u;
}

- (id)generate
{
  baseModel = self->_baseModel;
  if (!baseModel)
  {
    v4 = [[SASTestingInput alloc] initWithType:self->_type text:self->_text recordedSpeechURL:self->_recordedSpeechURL];
    goto LABEL_5;
  }
  if (*(unsigned char *)&self->_mutationFlags)
  {
    if ((*(unsigned char *)&self->_mutationFlags & 2) != 0)
    {
      int64_t type = self->_type;
      if ((*(unsigned char *)&self->_mutationFlags & 4) != 0) {
        goto LABEL_8;
      }
    }
    else
    {
      int64_t type = [(SASTestingInput *)baseModel type];
      if ((*(unsigned char *)&self->_mutationFlags & 4) != 0)
      {
LABEL_8:
        v7 = self->_text;
LABEL_11:
        v8 = v7;
        if ((*(unsigned char *)&self->_mutationFlags & 8) != 0)
        {
          objc_super v9 = self->_recordedSpeechURL;
        }
        else
        {
          objc_super v9 = [(SASTestingInput *)self->_baseModel recordedSpeechURL];
        }
        v10 = v9;
        id v5 = [[SASTestingInput alloc] initWithType:type text:v8 recordedSpeechURL:v9];

        goto LABEL_15;
      }
    }
    v7 = [(SASTestingInput *)self->_baseModel text];
    goto LABEL_11;
  }
  v4 = (SASTestingInput *)[(SASTestingInput *)baseModel copy];
LABEL_5:
  id v5 = v4;
LABEL_15:
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordedSpeechURL, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_baseModel, 0);
}

@end
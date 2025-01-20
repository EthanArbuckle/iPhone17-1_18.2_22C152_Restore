@interface _SVXSpeechSynthesisResultMutation
- (_SVXSpeechSynthesisResultMutation)init;
- (_SVXSpeechSynthesisResultMutation)initWithBaseModel:(id)a3;
- (id)generate;
- (void)setError:(id)a3;
- (void)setType:(int64_t)a3;
- (void)setUtteranceInfo:(id)a3;
@end

@implementation _SVXSpeechSynthesisResultMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_utteranceInfo, 0);

  objc_storeStrong((id *)&self->_baseModel, 0);
}

- (id)generate
{
  baseModel = self->_baseModel;
  if (!baseModel)
  {
    v4 = [[SVXSpeechSynthesisResult alloc] initWithType:self->_type utteranceInfo:self->_utteranceInfo error:self->_error];
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
      int64_t type = [(SVXSpeechSynthesisResult *)baseModel type];
      if ((*(unsigned char *)&self->_mutationFlags & 4) != 0)
      {
LABEL_8:
        v7 = self->_utteranceInfo;
LABEL_11:
        v8 = v7;
        if ((*(unsigned char *)&self->_mutationFlags & 8) != 0)
        {
          v9 = self->_error;
        }
        else
        {
          v9 = [(SVXSpeechSynthesisResult *)self->_baseModel error];
        }
        v10 = v9;
        v5 = [[SVXSpeechSynthesisResult alloc] initWithType:type utteranceInfo:v8 error:v9];

        goto LABEL_15;
      }
    }
    v7 = [(SVXSpeechSynthesisResult *)self->_baseModel utteranceInfo];
    goto LABEL_11;
  }
  v4 = (SVXSpeechSynthesisResult *)[(SVXSpeechSynthesisResult *)baseModel copy];
LABEL_5:
  v5 = v4;
LABEL_15:

  return v5;
}

- (void)setError:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 9u;
}

- (void)setUtteranceInfo:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 5u;
}

- (void)setType:(int64_t)a3
{
  self->_int64_t type = a3;
  *(unsigned char *)&self->_mutationFlags |= 3u;
}

- (_SVXSpeechSynthesisResultMutation)initWithBaseModel:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SVXSpeechSynthesisResultMutation;
  v6 = [(_SVXSpeechSynthesisResultMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_baseModel, a3);
  }

  return v7;
}

- (_SVXSpeechSynthesisResultMutation)init
{
  return [(_SVXSpeechSynthesisResultMutation *)self initWithBaseModel:0];
}

@end
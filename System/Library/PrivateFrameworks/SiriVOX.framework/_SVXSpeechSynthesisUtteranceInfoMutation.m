@interface _SVXSpeechSynthesisUtteranceInfoMutation
- (_SVXSpeechSynthesisUtteranceInfoMutation)init;
- (_SVXSpeechSynthesisUtteranceInfoMutation)initWithBaseModel:(id)a3;
- (id)generate;
- (void)setUtterance:(id)a3;
- (void)setWordTimings:(id)a3;
@end

@implementation _SVXSpeechSynthesisUtteranceInfoMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wordTimings, 0);
  objc_storeStrong((id *)&self->_utterance, 0);

  objc_storeStrong((id *)&self->_baseModel, 0);
}

- (id)generate
{
  baseModel = self->_baseModel;
  if (baseModel)
  {
    if (*(unsigned char *)&self->_mutationFlags)
    {
      if ((*(unsigned char *)&self->_mutationFlags & 2) != 0)
      {
        v6 = self->_utterance;
      }
      else
      {
        v6 = [(SVXSpeechSynthesisUtteranceInfo *)baseModel utterance];
      }
      v7 = v6;
      if ((*(unsigned char *)&self->_mutationFlags & 4) != 0)
      {
        v8 = self->_wordTimings;
      }
      else
      {
        v8 = [(SVXSpeechSynthesisUtteranceInfo *)self->_baseModel wordTimings];
      }
      v9 = v8;
      v5 = [[SVXSpeechSynthesisUtteranceInfo alloc] initWithUtterance:v7 wordTimings:v8];

      goto LABEL_13;
    }
    v4 = (SVXSpeechSynthesisUtteranceInfo *)[(SVXSpeechSynthesisUtteranceInfo *)baseModel copy];
  }
  else
  {
    v4 = [[SVXSpeechSynthesisUtteranceInfo alloc] initWithUtterance:self->_utterance wordTimings:self->_wordTimings];
  }
  v5 = v4;
LABEL_13:

  return v5;
}

- (void)setWordTimings:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 5u;
}

- (void)setUtterance:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 3u;
}

- (_SVXSpeechSynthesisUtteranceInfoMutation)initWithBaseModel:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SVXSpeechSynthesisUtteranceInfoMutation;
  v6 = [(_SVXSpeechSynthesisUtteranceInfoMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_baseModel, a3);
  }

  return v7;
}

- (_SVXSpeechSynthesisUtteranceInfoMutation)init
{
  return [(_SVXSpeechSynthesisUtteranceInfoMutation *)self initWithBaseModel:0];
}

@end
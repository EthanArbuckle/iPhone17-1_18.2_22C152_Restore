@interface _SVXSpeechSynthesisAudioMutation
- (_SVXSpeechSynthesisAudioMutation)init;
- (_SVXSpeechSynthesisAudioMutation)initWithBaseModel:(id)a3;
- (id)generate;
- (void)setData:(id)a3;
- (void)setDecoderASBD:(id)a3;
- (void)setPlayerASBD:(id)a3;
@end

@implementation _SVXSpeechSynthesisAudioMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerASBD, 0);
  objc_storeStrong((id *)&self->_decoderASBD, 0);
  objc_storeStrong((id *)&self->_data, 0);

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
        v6 = self->_data;
      }
      else
      {
        v6 = [(SVXSpeechSynthesisAudio *)baseModel data];
      }
      v7 = v6;
      if ((*(unsigned char *)&self->_mutationFlags & 4) != 0)
      {
        v8 = self->_decoderASBD;
      }
      else
      {
        v8 = [(SVXSpeechSynthesisAudio *)self->_baseModel decoderASBD];
      }
      v9 = v8;
      if ((*(unsigned char *)&self->_mutationFlags & 8) != 0)
      {
        v10 = self->_playerASBD;
      }
      else
      {
        v10 = [(SVXSpeechSynthesisAudio *)self->_baseModel playerASBD];
      }
      v11 = v10;
      v5 = [[SVXSpeechSynthesisAudio alloc] initWithData:v7 decoderASBD:v9 playerASBD:v10];

      goto LABEL_16;
    }
    v4 = (SVXSpeechSynthesisAudio *)[(SVXSpeechSynthesisAudio *)baseModel copy];
  }
  else
  {
    v4 = [[SVXSpeechSynthesisAudio alloc] initWithData:self->_data decoderASBD:self->_decoderASBD playerASBD:self->_playerASBD];
  }
  v5 = v4;
LABEL_16:

  return v5;
}

- (void)setPlayerASBD:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 9u;
}

- (void)setDecoderASBD:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 5u;
}

- (void)setData:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 3u;
}

- (_SVXSpeechSynthesisAudioMutation)initWithBaseModel:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SVXSpeechSynthesisAudioMutation;
  v6 = [(_SVXSpeechSynthesisAudioMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_baseModel, a3);
  }

  return v7;
}

- (_SVXSpeechSynthesisAudioMutation)init
{
  return [(_SVXSpeechSynthesisAudioMutation *)self initWithBaseModel:0];
}

@end
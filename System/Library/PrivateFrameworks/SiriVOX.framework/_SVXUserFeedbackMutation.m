@interface _SVXUserFeedbackMutation
- (_SVXUserFeedbackMutation)init;
- (_SVXUserFeedbackMutation)initWithBaseModel:(id)a3;
- (id)generate;
- (void)setAudioContent:(id)a3;
- (void)setContentType:(int64_t)a3;
- (void)setIdentifier:(id)a3;
- (void)setVoiceContent:(id)a3;
@end

@implementation _SVXUserFeedbackMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceContent, 0);
  objc_storeStrong((id *)&self->_audioContent, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_baseModel, 0);
}

- (id)generate
{
  baseModel = self->_baseModel;
  if (!baseModel)
  {
    v4 = [[SVXUserFeedback alloc] initWithIdentifier:self->_identifier contentType:self->_contentType audioContent:self->_audioContent voiceContent:self->_voiceContent];
    goto LABEL_5;
  }
  if (*(unsigned char *)&self->_mutationFlags)
  {
    if ((*(unsigned char *)&self->_mutationFlags & 2) != 0)
    {
      v6 = self->_identifier;
    }
    else
    {
      v6 = [(SVXUserFeedback *)baseModel identifier];
    }
    v7 = v6;
    if ((*(unsigned char *)&self->_mutationFlags & 4) != 0)
    {
      int64_t contentType = self->_contentType;
      if ((*(unsigned char *)&self->_mutationFlags & 8) != 0) {
        goto LABEL_11;
      }
    }
    else
    {
      int64_t contentType = [(SVXUserFeedback *)self->_baseModel contentType];
      if ((*(unsigned char *)&self->_mutationFlags & 8) != 0)
      {
LABEL_11:
        v9 = self->_audioContent;
LABEL_14:
        v10 = v9;
        if ((*(unsigned char *)&self->_mutationFlags & 0x10) != 0)
        {
          v11 = self->_voiceContent;
        }
        else
        {
          v11 = [(SVXUserFeedback *)self->_baseModel voiceContent];
        }
        v12 = v11;
        v5 = [[SVXUserFeedback alloc] initWithIdentifier:v7 contentType:contentType audioContent:v10 voiceContent:v11];

        goto LABEL_18;
      }
    }
    v9 = [(SVXUserFeedback *)self->_baseModel audioContent];
    goto LABEL_14;
  }
  v4 = (SVXUserFeedback *)[(SVXUserFeedback *)baseModel copy];
LABEL_5:
  v5 = v4;
LABEL_18:

  return v5;
}

- (void)setVoiceContent:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 0x11u;
}

- (void)setAudioContent:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 9u;
}

- (void)setContentType:(int64_t)a3
{
  self->_int64_t contentType = a3;
  *(unsigned char *)&self->_mutationFlags |= 5u;
}

- (void)setIdentifier:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 3u;
}

- (_SVXUserFeedbackMutation)initWithBaseModel:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SVXUserFeedbackMutation;
  v6 = [(_SVXUserFeedbackMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_baseModel, a3);
  }

  return v7;
}

- (_SVXUserFeedbackMutation)init
{
  return [(_SVXUserFeedbackMutation *)self initWithBaseModel:0];
}

@end
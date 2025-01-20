@interface _SVXUserFeedbackVoiceContentMutation
- (_SVXUserFeedbackVoiceContentMutation)init;
- (_SVXUserFeedbackVoiceContentMutation)initWithBaseModel:(id)a3;
- (id)generate;
- (void)setIsPhonetic:(BOOL)a3;
- (void)setText:(id)a3;
@end

@implementation _SVXUserFeedbackVoiceContentMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);

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
        v6 = self->_text;
      }
      else
      {
        v6 = [(SVXUserFeedbackVoiceContent *)baseModel text];
      }
      v7 = v6;
      if ((*(unsigned char *)&self->_mutationFlags & 4) != 0) {
        BOOL isPhonetic = self->_isPhonetic;
      }
      else {
        BOOL isPhonetic = [(SVXUserFeedbackVoiceContent *)self->_baseModel isPhonetic];
      }
      v5 = [[SVXUserFeedbackVoiceContent alloc] initWithText:v7 isPhonetic:isPhonetic];

      goto LABEL_13;
    }
    v4 = (SVXUserFeedbackVoiceContent *)[(SVXUserFeedbackVoiceContent *)baseModel copy];
  }
  else
  {
    v4 = [[SVXUserFeedbackVoiceContent alloc] initWithText:self->_text isPhonetic:self->_isPhonetic];
  }
  v5 = v4;
LABEL_13:

  return v5;
}

- (void)setIsPhonetic:(BOOL)a3
{
  self->_BOOL isPhonetic = a3;
  *(unsigned char *)&self->_mutationFlags |= 5u;
}

- (void)setText:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 3u;
}

- (_SVXUserFeedbackVoiceContentMutation)initWithBaseModel:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SVXUserFeedbackVoiceContentMutation;
  v6 = [(_SVXUserFeedbackVoiceContentMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_baseModel, a3);
  }

  return v7;
}

- (_SVXUserFeedbackVoiceContentMutation)init
{
  return [(_SVXUserFeedbackVoiceContentMutation *)self initWithBaseModel:0];
}

@end
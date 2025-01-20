@interface SVXUserFeedback
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)identifier;
- (SVXUserFeedback)initWithCoder:(id)a3;
- (SVXUserFeedback)initWithIdentifier:(id)a3 contentType:(int64_t)a4 audioContent:(id)a5 voiceContent:(id)a6;
- (SVXUserFeedbackAudioContent)audioContent;
- (SVXUserFeedbackVoiceContent)voiceContent;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (int64_t)contentType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SVXUserFeedback

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceContent, 0);
  objc_storeStrong((id *)&self->_audioContent, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (SVXUserFeedbackVoiceContent)voiceContent
{
  return self->_voiceContent;
}

- (SVXUserFeedbackAudioContent)audioContent
{
  return self->_audioContent;
}

- (int64_t)contentType
{
  return self->_contentType;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v6 = a3;
  [v6 encodeObject:identifier forKey:@"SVXUserFeedback::identifier"];
  v5 = [NSNumber numberWithInteger:self->_contentType];
  [v6 encodeObject:v5 forKey:@"SVXUserFeedback::contentType"];

  [v6 encodeObject:self->_audioContent forKey:@"SVXUserFeedback::audioContent"];
  [v6 encodeObject:self->_voiceContent forKey:@"SVXUserFeedback::voiceContent"];
}

- (SVXUserFeedback)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SVXUserFeedback::identifier"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SVXUserFeedback::contentType"];
  uint64_t v7 = [v6 integerValue];

  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SVXUserFeedback::audioContent"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SVXUserFeedback::voiceContent"];

  v10 = [(SVXUserFeedback *)self initWithIdentifier:v5 contentType:v7 audioContent:v8 voiceContent:v9];
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SVXUserFeedback *)a3;
  if (self == v4)
  {
    BOOL v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      int64_t contentType = self->_contentType;
      if (contentType == [(SVXUserFeedback *)v5 contentType])
      {
        uint64_t v7 = [(SVXUserFeedback *)v5 identifier];
        identifier = self->_identifier;
        if (identifier == v7 || [(NSString *)identifier isEqual:v7])
        {
          v9 = [(SVXUserFeedback *)v5 audioContent];
          audioContent = self->_audioContent;
          if (audioContent == v9 || [(SVXUserFeedbackAudioContent *)audioContent isEqual:v9])
          {
            v11 = [(SVXUserFeedback *)v5 voiceContent];
            voiceContent = self->_voiceContent;
            BOOL v13 = voiceContent == v11 || [(SVXUserFeedbackVoiceContent *)voiceContent isEqual:v11];
          }
          else
          {
            BOOL v13 = 0;
          }
        }
        else
        {
          BOOL v13 = 0;
        }
      }
      else
      {
        BOOL v13 = 0;
      }
    }
    else
    {
      BOOL v13 = 0;
    }
  }

  return v13;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  id v4 = [NSNumber numberWithInteger:self->_contentType];
  uint64_t v5 = [v4 hash];
  unint64_t v6 = v3 ^ [(SVXUserFeedbackAudioContent *)self->_audioContent hash];
  unint64_t v7 = v5 ^ v6 ^ [(SVXUserFeedbackVoiceContent *)self->_voiceContent hash];

  return v7;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v12.receiver = self;
  v12.super_class = (Class)SVXUserFeedback;
  uint64_t v5 = [(SVXUserFeedback *)&v12 description];
  identifier = self->_identifier;
  unint64_t contentType = self->_contentType;
  if (contentType > 2) {
    v8 = @"(unknown)";
  }
  else {
    v8 = off_264552490[contentType];
  }
  v9 = v8;
  v10 = (void *)[v4 initWithFormat:@"%@ {identifier = %@, unint64_t contentType = %@, audioContent = %@, voiceContent = %@}", v5, identifier, v9, self->_audioContent, self->_voiceContent];

  return v10;
}

- (id)description
{
  return [(SVXUserFeedback *)self _descriptionWithIndent:0];
}

- (SVXUserFeedback)initWithIdentifier:(id)a3 contentType:(int64_t)a4 audioContent:(id)a5 voiceContent:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v21.receiver = self;
  v21.super_class = (Class)SVXUserFeedback;
  BOOL v13 = [(SVXUserFeedback *)&v21 init];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    identifier = v13->_identifier;
    v13->_identifier = (NSString *)v14;

    v13->_unint64_t contentType = a4;
    uint64_t v16 = [v11 copy];
    audioContent = v13->_audioContent;
    v13->_audioContent = (SVXUserFeedbackAudioContent *)v16;

    uint64_t v18 = [v12 copy];
    voiceContent = v13->_voiceContent;
    v13->_voiceContent = (SVXUserFeedbackVoiceContent *)v18;
  }
  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  id v4 = (void (**)(id, _SVXUserFeedbackMutation *))a3;
  if (v4)
  {
    uint64_t v5 = [[_SVXUserFeedbackMutation alloc] initWithBaseModel:self];
    v4[2](v4, v5);
    unint64_t v6 = [(_SVXUserFeedbackMutation *)v5 generate];
  }
  else
  {
    unint64_t v6 = (void *)[(SVXUserFeedback *)self copy];
  }

  return v6;
}

+ (id)newWithBuilder:(id)a3
{
  NSUInteger v3 = (void (**)(id, _SVXUserFeedbackMutation *))a3;
  id v4 = objc_alloc_init(_SVXUserFeedbackMutation);
  if (v3) {
    v3[2](v3, v4);
  }
  uint64_t v5 = [(_SVXUserFeedbackMutation *)v4 generate];

  return v5;
}

@end
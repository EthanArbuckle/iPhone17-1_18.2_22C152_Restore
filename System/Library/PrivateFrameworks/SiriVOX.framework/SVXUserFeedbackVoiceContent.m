@interface SVXUserFeedbackVoiceContent
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPhonetic;
- (NSString)text;
- (SVXUserFeedbackVoiceContent)initWithCoder:(id)a3;
- (SVXUserFeedbackVoiceContent)initWithText:(id)a3 isPhonetic:(BOOL)a4;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SVXUserFeedbackVoiceContent

- (void).cxx_destruct
{
}

- (BOOL)isPhonetic
{
  return self->_isPhonetic;
}

- (NSString)text
{
  return self->_text;
}

- (void)encodeWithCoder:(id)a3
{
  text = self->_text;
  id v5 = a3;
  [v5 encodeObject:text forKey:@"SVXUserFeedbackVoiceContent::text"];
  id v6 = [NSNumber numberWithBool:self->_isPhonetic];
  [v5 encodeObject:v6 forKey:@"SVXUserFeedbackVoiceContent::isPhonetic"];
}

- (SVXUserFeedbackVoiceContent)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SVXUserFeedbackVoiceContent::text"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SVXUserFeedbackVoiceContent::isPhonetic"];

  uint64_t v7 = [v6 BOOLValue];
  v8 = [(SVXUserFeedbackVoiceContent *)self initWithText:v5 isPhonetic:v7];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SVXUserFeedbackVoiceContent *)a3;
  if (self == v4)
  {
    BOOL v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      BOOL isPhonetic = self->_isPhonetic;
      if (isPhonetic == [(SVXUserFeedbackVoiceContent *)v5 isPhonetic])
      {
        uint64_t v7 = [(SVXUserFeedbackVoiceContent *)v5 text];
        text = self->_text;
        BOOL v9 = text == v7 || [(NSString *)text isEqual:v7];
      }
      else
      {
        BOOL v9 = 0;
      }
    }
    else
    {
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_text hash];
  id v4 = [NSNumber numberWithBool:self->_isPhonetic];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v10.receiver = self;
  v10.super_class = (Class)SVXUserFeedbackVoiceContent;
  uint64_t v5 = [(SVXUserFeedbackVoiceContent *)&v10 description];
  id v6 = (void *)v5;
  if (self->_isPhonetic) {
    uint64_t v7 = @"YES";
  }
  else {
    uint64_t v7 = @"NO";
  }
  v8 = (void *)[v4 initWithFormat:@"%@ {text = %@, BOOL isPhonetic = %@}", v5, self->_text, v7];

  return v8;
}

- (id)description
{
  return [(SVXUserFeedbackVoiceContent *)self _descriptionWithIndent:0];
}

- (SVXUserFeedbackVoiceContent)initWithText:(id)a3 isPhonetic:(BOOL)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SVXUserFeedbackVoiceContent;
  uint64_t v7 = [(SVXUserFeedbackVoiceContent *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    text = v7->_text;
    v7->_text = (NSString *)v8;

    v7->_BOOL isPhonetic = a4;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  id v4 = (void (**)(id, _SVXUserFeedbackVoiceContentMutation *))a3;
  if (v4)
  {
    uint64_t v5 = [[_SVXUserFeedbackVoiceContentMutation alloc] initWithBaseModel:self];
    v4[2](v4, v5);
    id v6 = [(_SVXUserFeedbackVoiceContentMutation *)v5 generate];
  }
  else
  {
    id v6 = (void *)[(SVXUserFeedbackVoiceContent *)self copy];
  }

  return v6;
}

+ (id)newWithBuilder:(id)a3
{
  NSUInteger v3 = (void (**)(id, _SVXUserFeedbackVoiceContentMutation *))a3;
  id v4 = objc_alloc_init(_SVXUserFeedbackVoiceContentMutation);
  if (v3) {
    v3[2](v3, v4);
  }
  uint64_t v5 = [(_SVXUserFeedbackVoiceContentMutation *)v4 generate];

  return v5;
}

@end
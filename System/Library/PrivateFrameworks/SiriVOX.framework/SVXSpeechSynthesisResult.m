@interface SVXSpeechSynthesisResult
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSError)error;
- (SVXSpeechSynthesisResult)initWithCoder:(id)a3;
- (SVXSpeechSynthesisResult)initWithType:(int64_t)a3 utteranceInfo:(id)a4 error:(id)a5;
- (SVXSpeechSynthesisUtteranceInfo)utteranceInfo;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (int64_t)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SVXSpeechSynthesisResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);

  objc_storeStrong((id *)&self->_utteranceInfo, 0);
}

- (NSError)error
{
  return self->_error;
}

- (SVXSpeechSynthesisUtteranceInfo)utteranceInfo
{
  return self->_utteranceInfo;
}

- (int64_t)type
{
  return self->_type;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = NSNumber;
  int64_t type = self->_type;
  id v7 = a3;
  v6 = [v4 numberWithInteger:type];
  [v7 encodeObject:v6 forKey:@"SVXSpeechSynthesisResult::type"];

  [v7 encodeObject:self->_utteranceInfo forKey:@"SVXSpeechSynthesisResult::utteranceInfo"];
  [v7 encodeObject:self->_error forKey:@"SVXSpeechSynthesisResult::error"];
}

- (SVXSpeechSynthesisResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SVXSpeechSynthesisResult::type"];
  uint64_t v6 = [v5 integerValue];

  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SVXSpeechSynthesisResult::utteranceInfo"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SVXSpeechSynthesisResult::error"];

  v9 = [(SVXSpeechSynthesisResult *)self initWithType:v6 utteranceInfo:v7 error:v8];
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SVXSpeechSynthesisResult *)a3;
  if (self == v4)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      int64_t type = self->_type;
      if (type == [(SVXSpeechSynthesisResult *)v5 type])
      {
        id v7 = [(SVXSpeechSynthesisResult *)v5 utteranceInfo];
        utteranceInfo = self->_utteranceInfo;
        if (utteranceInfo == v7 || [(SVXSpeechSynthesisUtteranceInfo *)utteranceInfo isEqual:v7])
        {
          v9 = [(SVXSpeechSynthesisResult *)v5 error];
          error = self->_error;
          BOOL v11 = error == v9 || [(NSError *)error isEqual:v9];
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

- (unint64_t)hash
{
  v3 = [NSNumber numberWithInteger:self->_type];
  uint64_t v4 = [v3 hash];
  unint64_t v5 = [(SVXSpeechSynthesisUtteranceInfo *)self->_utteranceInfo hash];
  unint64_t v6 = v5 ^ [(NSError *)self->_error hash] ^ v4;

  return v6;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v11.receiver = self;
  v11.super_class = (Class)SVXSpeechSynthesisResult;
  unint64_t v5 = [(SVXSpeechSynthesisResult *)&v11 description];
  unint64_t type = self->_type;
  if (type > 4) {
    id v7 = @"(unknown)";
  }
  else {
    id v7 = off_264553160[type];
  }
  v8 = v7;
  v9 = (void *)[v4 initWithFormat:@"%@ {unint64_t type = %@, utteranceInfo = %@, error = %@}", v5, v8, self->_utteranceInfo, self->_error];

  return v9;
}

- (id)description
{
  return [(SVXSpeechSynthesisResult *)self _descriptionWithIndent:0];
}

- (SVXSpeechSynthesisResult)initWithType:(int64_t)a3 utteranceInfo:(id)a4 error:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SVXSpeechSynthesisResult;
  v10 = [(SVXSpeechSynthesisResult *)&v17 init];
  objc_super v11 = v10;
  if (v10)
  {
    v10->_unint64_t type = a3;
    uint64_t v12 = [v8 copy];
    utteranceInfo = v11->_utteranceInfo;
    v11->_utteranceInfo = (SVXSpeechSynthesisUtteranceInfo *)v12;

    uint64_t v14 = [v9 copy];
    error = v11->_error;
    v11->_error = (NSError *)v14;
  }
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  id v4 = (void (**)(id, _SVXSpeechSynthesisResultMutation *))a3;
  if (v4)
  {
    unint64_t v5 = [[_SVXSpeechSynthesisResultMutation alloc] initWithBaseModel:self];
    v4[2](v4, v5);
    unint64_t v6 = [(_SVXSpeechSynthesisResultMutation *)v5 generate];
  }
  else
  {
    unint64_t v6 = (void *)[(SVXSpeechSynthesisResult *)self copy];
  }

  return v6;
}

+ (id)newWithBuilder:(id)a3
{
  v3 = (void (**)(id, _SVXSpeechSynthesisResultMutation *))a3;
  id v4 = objc_alloc_init(_SVXSpeechSynthesisResultMutation);
  if (v3) {
    v3[2](v3, v4);
  }
  unint64_t v5 = [(_SVXSpeechSynthesisResultMutation *)v4 generate];

  return v5;
}

@end
@interface SVXSpeechSynthesisUtteranceInfo
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSArray)wordTimings;
- (NSString)utterance;
- (SVXSpeechSynthesisUtteranceInfo)initWithCoder:(id)a3;
- (SVXSpeechSynthesisUtteranceInfo)initWithUtterance:(id)a3 wordTimings:(id)a4;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SVXSpeechSynthesisUtteranceInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wordTimings, 0);

  objc_storeStrong((id *)&self->_utterance, 0);
}

- (NSArray)wordTimings
{
  return self->_wordTimings;
}

- (NSString)utterance
{
  return self->_utterance;
}

- (void)encodeWithCoder:(id)a3
{
  utterance = self->_utterance;
  id v5 = a3;
  [v5 encodeObject:utterance forKey:@"SVXSpeechSynthesisUtteranceInfo::utterance"];
  [v5 encodeObject:self->_wordTimings forKey:@"SVXSpeechSynthesisUtteranceInfo::wordTimings"];
}

- (SVXSpeechSynthesisUtteranceInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SVXSpeechSynthesisUtteranceInfo::utterance"];
  v6 = (void *)MEMORY[0x263EFFA08];
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v9 = [v4 decodeObjectOfClasses:v8 forKey:@"SVXSpeechSynthesisUtteranceInfo::wordTimings"];

  v10 = [(SVXSpeechSynthesisUtteranceInfo *)self initWithUtterance:v5 wordTimings:v9];
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SVXSpeechSynthesisUtteranceInfo *)a3;
  if (self == v4)
  {
    BOOL v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      v6 = [(SVXSpeechSynthesisUtteranceInfo *)v5 utterance];
      utterance = self->_utterance;
      if (utterance == v6 || [(NSString *)utterance isEqual:v6])
      {
        v8 = [(SVXSpeechSynthesisUtteranceInfo *)v5 wordTimings];
        wordTimings = self->_wordTimings;
        BOOL v10 = wordTimings == v8 || [(NSArray *)wordTimings isEqual:v8];
      }
      else
      {
        BOOL v10 = 0;
      }
    }
    else
    {
      BOOL v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_utterance hash];
  return [(NSArray *)self->_wordTimings hash] ^ v3;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v8.receiver = self;
  v8.super_class = (Class)SVXSpeechSynthesisUtteranceInfo;
  id v5 = [(SVXSpeechSynthesisUtteranceInfo *)&v8 description];
  v6 = (void *)[v4 initWithFormat:@"%@ {utterance = %@, wordTimings = %@}", v5, self->_utterance, self->_wordTimings];

  return v6;
}

- (id)description
{
  return [(SVXSpeechSynthesisUtteranceInfo *)self _descriptionWithIndent:0];
}

- (SVXSpeechSynthesisUtteranceInfo)initWithUtterance:(id)a3 wordTimings:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SVXSpeechSynthesisUtteranceInfo;
  objc_super v8 = [(SVXSpeechSynthesisUtteranceInfo *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    utterance = v8->_utterance;
    v8->_utterance = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    wordTimings = v8->_wordTimings;
    v8->_wordTimings = (NSArray *)v11;
  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  id v4 = (void (**)(id, _SVXSpeechSynthesisUtteranceInfoMutation *))a3;
  if (v4)
  {
    id v5 = [[_SVXSpeechSynthesisUtteranceInfoMutation alloc] initWithBaseModel:self];
    v4[2](v4, v5);
    id v6 = [(_SVXSpeechSynthesisUtteranceInfoMutation *)v5 generate];
  }
  else
  {
    id v6 = (void *)[(SVXSpeechSynthesisUtteranceInfo *)self copy];
  }

  return v6;
}

+ (id)newWithBuilder:(id)a3
{
  NSUInteger v3 = (void (**)(id, _SVXSpeechSynthesisUtteranceInfoMutation *))a3;
  id v4 = objc_alloc_init(_SVXSpeechSynthesisUtteranceInfoMutation);
  if (v3) {
    v3[2](v3, v4);
  }
  id v5 = [(_SVXSpeechSynthesisUtteranceInfoMutation *)v4 generate];

  return v5;
}

@end
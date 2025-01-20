@interface TIKeyboardCandidateSuggestion
+ (id)candidateWithSuggestion:(id)a3;
+ (id)candidateWithSuggestion:(id)a3 customInfoType:(unint64_t)a4;
- (BOOL)isEqual:(id)a3;
- (TIKeyboardCandidateSuggestion)initWithSuggestion:(id)a3 customInfoType:(unint64_t)a4;
- (UITextSuggestion)textSuggestion;
- (id)candidate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)input;
- (id)label;
- (unint64_t)customInfoType;
@end

@implementation TIKeyboardCandidateSuggestion

- (id)candidate
{
  return [(UITextSuggestion *)self->_textSuggestion inputText];
}

- (id)input
{
  return [(UITextSuggestion *)self->_textSuggestion searchText];
}

- (id)label
{
  return [(UITextSuggestion *)self->_textSuggestion displayText];
}

- (unint64_t)customInfoType
{
  return self->_customInfoType;
}

+ (id)candidateWithSuggestion:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithSuggestion:v4 customInfoType:0];

  return v5;
}

+ (id)candidateWithSuggestion:(id)a3 customInfoType:(unint64_t)a4
{
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)a1) initWithSuggestion:v6 customInfoType:a4];

  return v7;
}

- (TIKeyboardCandidateSuggestion)initWithSuggestion:(id)a3 customInfoType:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TIKeyboardCandidateSuggestion;
  v8 = [(TIKeyboardCandidateSuggestion *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_textSuggestion, a3);
    v9->_customInfoType = a4;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)TIKeyboardCandidateSuggestion;
  id v4 = [(TIKeyboardCandidateSuggestion *)&v8 copyWithZone:a3];
  uint64_t v5 = [(UITextSuggestion *)self->_textSuggestion copy];
  id v6 = (void *)v4[19];
  v4[19] = v5;

  v4[18] = self->_customInfoType;
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TIKeyboardCandidateSuggestion;
  if ([(TIKeyboardCandidateSuggestion *)&v9 isEqual:v4]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    textSuggestion = self->_textSuggestion;
    id v6 = [v4 textSuggestion];
    BOOL v7 = textSuggestion == v6;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (UITextSuggestion)textSuggestion
{
  return self->_textSuggestion;
}

- (void).cxx_destruct
{
}

@end
@interface UIAutoFillTextSuggestion
+ (id)autoFillSuggestionWithContents:(id)a3;
- (NSDictionary)contents;
- (UIAutoFillTextSuggestion)initWithContents:(id)a3;
- (id)_keyboardCandidate;
@end

@implementation UIAutoFillTextSuggestion

+ (id)autoFillSuggestionWithContents:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __59__UIAutoFillTextSuggestion_autoFillSuggestionWithContents___block_invoke;
  v10[3] = &unk_1E52DDE90;
  id v11 = v6;
  id v7 = v6;
  [v5 enumerateKeysAndObjectsUsingBlock:v10];

  v8 = (void *)[objc_alloc((Class)a1) initWithContents:v7];
  return v8;
}

void __59__UIAutoFillTextSuggestion_autoFillSuggestionWithContents___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v6];
    }
  }
}

- (UIAutoFillTextSuggestion)initWithContents:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIAutoFillTextSuggestion;
  id v5 = [(UITextSuggestion *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    contents = v5->_contents;
    v5->_contents = (NSDictionary *)v6;
  }
  return v5;
}

- (id)_keyboardCandidate
{
  return +[TIKeyboardCandidateSuggestion candidateWithSuggestion:self customInfoType:256];
}

- (NSDictionary)contents
{
  return self->_contents;
}

- (void).cxx_destruct
{
}

@end
@interface TIAutoshiftRegularExpressionLoader
+ (TIAutoshiftRegularExpressionLoader)loaderWithSentenceDelimiters:(id)a3 trailingChars:(id)a4 prefixChars:(id)a5;
- (NSRegularExpression)regex;
- (NSString)nextSentencePrefixCharacters;
- (NSString)sentenceDelimitingCharacters;
- (NSString)sentenceTrailingCharacters;
- (TIAutoshiftRegularExpressionLoader)initWithSentenceDelimiters:(id)a3 trailingChars:(id)a4 prefixChars:(id)a5;
- (void)setRegex:(id)a3;
- (void)startBackgroundLoad;
@end

@implementation TIAutoshiftRegularExpressionLoader

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextSentencePrefixCharacters, 0);
  objc_storeStrong((id *)&self->_sentenceTrailingCharacters, 0);
  objc_storeStrong((id *)&self->_sentenceDelimitingCharacters, 0);

  objc_storeStrong((id *)&self->_regex, 0);
}

- (NSString)nextSentencePrefixCharacters
{
  return self->_nextSentencePrefixCharacters;
}

- (NSString)sentenceTrailingCharacters
{
  return self->_sentenceTrailingCharacters;
}

- (NSString)sentenceDelimitingCharacters
{
  return self->_sentenceDelimitingCharacters;
}

- (void)setRegex:(id)a3
{
}

- (NSRegularExpression)regex
{
  regex = self->_regex;
  if (!regex)
  {
    v4 = [(TIAutoshiftRegularExpressionLoader *)self sentenceDelimitingCharacters];
    v5 = [(TIAutoshiftRegularExpressionLoader *)self sentenceTrailingCharacters];
    v6 = [(TIAutoshiftRegularExpressionLoader *)self nextSentencePrefixCharacters];
    createAutoshiftRegularExpression(v4, v5, v6);
    v7 = (NSRegularExpression *)objc_claimAutoreleasedReturnValue();
    v8 = self->_regex;
    self->_regex = v7;

    regex = self->_regex;
  }

  return regex;
}

- (void)startBackgroundLoad
{
  v2 = _TIQueueBackground();
  TIDispatchAsync();
}

void __57__TIAutoshiftRegularExpressionLoader_startBackgroundLoad__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) sentenceDelimitingCharacters];
  v3 = [*(id *)(a1 + 32) sentenceTrailingCharacters];
  v4 = [*(id *)(a1 + 32) nextSentencePrefixCharacters];
  v5 = createAutoshiftRegularExpression(v2, v3, v4);

  id v6 = v5;
  TIDispatchAsync();
}

uint64_t __57__TIAutoshiftRegularExpressionLoader_startBackgroundLoad__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setRegex:*(void *)(a1 + 40)];
}

- (TIAutoshiftRegularExpressionLoader)initWithSentenceDelimiters:(id)a3 trailingChars:(id)a4 prefixChars:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)TIAutoshiftRegularExpressionLoader;
  v11 = [(TIAutoshiftRegularExpressionLoader *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    sentenceDelimitingCharacters = v11->_sentenceDelimitingCharacters;
    v11->_sentenceDelimitingCharacters = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    sentenceTrailingCharacters = v11->_sentenceTrailingCharacters;
    v11->_sentenceTrailingCharacters = (NSString *)v14;

    uint64_t v16 = [v10 copy];
    nextSentencePrefixCharacters = v11->_nextSentencePrefixCharacters;
    v11->_nextSentencePrefixCharacters = (NSString *)v16;
  }
  return v11;
}

+ (TIAutoshiftRegularExpressionLoader)loaderWithSentenceDelimiters:(id)a3 trailingChars:(id)a4 prefixChars:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)[objc_alloc((Class)a1) initWithSentenceDelimiters:v10 trailingChars:v9 prefixChars:v8];

  return (TIAutoshiftRegularExpressionLoader *)v11;
}

@end
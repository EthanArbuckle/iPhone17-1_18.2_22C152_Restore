@interface PRSentenceCorrection
- (BOOL)presentAsAutocorrection;
- (BOOL)presentAsGrammarError;
- (BOOL)presentAsSpellingError;
- (PRSentenceCorrection)initWithCategory:(int)a3 range:(_NSRange)a4 word:(id)a5 corrections:(id)a6;
- (_NSRange)range;
- (id)corrections;
- (id)description;
- (id)word;
- (int)category;
- (void)dealloc;
@end

@implementation PRSentenceCorrection

- (PRSentenceCorrection)initWithCategory:(int)a3 range:(_NSRange)a4 word:(id)a5 corrections:(id)a6
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v14.receiver = self;
  v14.super_class = (Class)PRSentenceCorrection;
  v11 = [(PRSentenceCorrection *)&v14 init];
  v12 = v11;
  if (v11)
  {
    v11->_category = a3;
    v11->_range.NSUInteger location = location;
    v11->_range.NSUInteger length = length;
    v11->_word = (NSString *)[a5 copy];
    v12->_corrections = (NSArray *)[a6 copy];
  }
  return v12;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PRSentenceCorrection;
  [(PRSentenceCorrection *)&v3 dealloc];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"(%lu)%@<%@>(%@)", self->_category, NSStringFromRange(self->_range), self->_word, -[NSArray componentsJoinedByString:](self->_corrections, "componentsJoinedByString:", @"/"];
}

- (int)category
{
  return self->_category;
}

- (_NSRange)range
{
  NSUInteger length = self->_range.length;
  NSUInteger location = self->_range.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (id)word
{
  return self->_word;
}

- (id)corrections
{
  return self->_corrections;
}

- (BOOL)presentAsSpellingError
{
  return 0;
}

- (BOOL)presentAsAutocorrection
{
  return (self->_category & 0xFFFFFFFE) == 4;
}

- (BOOL)presentAsGrammarError
{
  if (presentAsGrammarError_onceToken != -1) {
    dispatch_once(&presentAsGrammarError_onceToken, &__block_literal_global_5);
  }
  return (self->_category & 0xFFFFFFFE) == 4;
}

uint64_t __45__PRSentenceCorrection_presentAsGrammarError__block_invoke()
{
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x263EFFA40], "standardUserDefaults"), "objectForKey:", @"NSSpellCheckerSentenceCorrectionSubjectVerbEnabled"))
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263EFFA40], "standardUserDefaults"), "BOOLForKey:", @"NSSpellCheckerSentenceCorrectionSubjectVerbEnabled");
  }
  uint64_t result = objc_msgSend((id)objc_msgSend(MEMORY[0x263EFFA40], "standardUserDefaults"), "objectForKey:", @"NSSpellCheckerSentenceCorrectionMissingArticleEnabled");
  if (result)
  {
    v1 = (void *)[MEMORY[0x263EFFA40] standardUserDefaults];
    return [v1 BOOLForKey:@"NSSpellCheckerSentenceCorrectionMissingArticleEnabled"];
  }
  return result;
}

@end
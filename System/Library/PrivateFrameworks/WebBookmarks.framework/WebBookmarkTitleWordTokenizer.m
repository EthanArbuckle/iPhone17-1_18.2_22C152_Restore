@interface WebBookmarkTitleWordTokenizer
+ (void)initialize;
- (WebBookmarkTitleWordTokenizer)init;
- (_NSRange)advanceToNextToken;
- (void)setString:(id)a3;
@end

@implementation WebBookmarkTitleWordTokenizer

+ (void)initialize
{
}

- (_NSRange)advanceToNextToken
{
  NSUInteger length = 0;
  if (self->_rangeOfNextToken.location >= self->_stringLength) {
    unint64_t stringLength = self->_stringLength;
  }
  else {
    unint64_t stringLength = self->_rangeOfNextToken.location;
  }
  unint64_t startOfUnclassifiedRangeBeforeNextToken = self->_startOfUnclassifiedRangeBeforeNextToken;
  while (startOfUnclassifiedRangeBeforeNextToken < stringLength)
  {
    uint64_t v6 = [(NSString *)self->_string characterAtIndex:startOfUnclassifiedRangeBeforeNextToken];
    if ((v6 & 0xFC00) == 0xD800 && self->_startOfUnclassifiedRangeBeforeNextToken + 1 < stringLength)
    {
      int v7 = -[NSString characterAtIndex:](self->_string, "characterAtIndex:");
      if ((v7 & 0xFC00) == 0xDC00) {
        uint64_t v6 = (v7 + (v6 << 10) - 56613888);
      }
      else {
        uint64_t v6 = v6;
      }
      if ((v7 & 0xFC00) == 0xDC00) {
        uint64_t v8 = 2;
      }
      else {
        uint64_t v8 = 1;
      }
    }
    else
    {
      uint64_t v8 = 1;
    }
    if (cjkIdeographCharacterSet_once != -1) {
      dispatch_once(&cjkIdeographCharacterSet_once, &__block_literal_global_12);
    }
    int v9 = [(id)cjkIdeographCharacterSet_cjkIdeographCharacterSet longCharacterIsMember:v6];
    unint64_t v10 = self->_startOfUnclassifiedRangeBeforeNextToken;
    if (v9) {
      NSUInteger length = v8;
    }
    unint64_t startOfUnclassifiedRangeBeforeNextToken = v10 + v8;
    self->_unint64_t startOfUnclassifiedRangeBeforeNextToken = v10 + v8;
    if (v9 && v10 != 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t startOfUnclassifiedRangeBeforeNextToken = v10;
      goto LABEL_25;
    }
  }
  if (startOfUnclassifiedRangeBeforeNextToken == self->_rangeOfNextToken.location)
  {
    NSUInteger length = self->_rangeOfNextToken.length;
    self->_rangeOfNextToken.location = [(TIWordTokenizer *)self->_wordTokenizer advanceToNextToken];
    self->_rangeOfNextToken.NSUInteger length = v11;
    self->_unint64_t startOfUnclassifiedRangeBeforeNextToken = length + startOfUnclassifiedRangeBeforeNextToken;
  }
  else
  {
    unint64_t startOfUnclassifiedRangeBeforeNextToken = 0x7FFFFFFFFFFFFFFFLL;
  }
LABEL_25:
  NSUInteger v12 = startOfUnclassifiedRangeBeforeNextToken;
  NSUInteger v13 = length;
  result.NSUInteger length = v13;
  result.location = v12;
  return result;
}

- (void)setString:(id)a3
{
  v4 = (NSString *)a3;
  int v9 = v4;
  if (self->_string == v4)
  {
    NSUInteger stringLength = self->_stringLength;
  }
  else
  {
    v5 = (NSString *)[(NSString *)v4 copy];
    string = self->_string;
    self->_string = v5;

    NSUInteger stringLength = [(NSString *)self->_string length];
    self->_NSUInteger stringLength = stringLength;
  }
  -[TIWordTokenizer setString:withSearchRange:](self->_wordTokenizer, "setString:withSearchRange:", v9, 0, stringLength);
  self->_rangeOfNextToken.location = [(TIWordTokenizer *)self->_wordTokenizer advanceToNextToken];
  self->_rangeOfNextToken.NSUInteger length = v8;
  self->_unint64_t startOfUnclassifiedRangeBeforeNextToken = 0;
}

- (WebBookmarkTitleWordTokenizer)init
{
  v9.receiver = self;
  v9.super_class = (Class)WebBookmarkTitleWordTokenizer;
  v2 = [(WebBookmarkTitleWordTokenizer *)&v9 init];
  if (v2)
  {
    uint64_t v11 = 0;
    NSUInteger v12 = &v11;
    uint64_t v13 = 0x2050000000;
    v3 = (void *)getTIWordTokenizerClass_softClass;
    uint64_t v14 = getTIWordTokenizerClass_softClass;
    if (!getTIWordTokenizerClass_softClass)
    {
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __getTIWordTokenizerClass_block_invoke;
      v10[3] = &unk_2643DAEE8;
      v10[4] = &v11;
      __getTIWordTokenizerClass_block_invoke((uint64_t)v10);
      v3 = (void *)v12[3];
    }
    v4 = v3;
    _Block_object_dispose(&v11, 8);
    v5 = (TIWordTokenizer *)objc_alloc_init(v4);
    wordTokenizer = v2->_wordTokenizer;
    v2->_wordTokenizer = v5;

    int v7 = v2;
  }

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wordTokenizer, 0);
  objc_storeStrong((id *)&self->_string, 0);
}

@end
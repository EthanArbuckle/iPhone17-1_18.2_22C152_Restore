@interface ICRandomTextGenerator
+ (BOOL)hasSpacesBetweenWordsForLanguage:(unint64_t)a3;
+ (id)loadWordsForLanguage:(unint64_t)a3;
+ (id)sentencePunctuationForLanguage:(unint64_t)a3 endOfParagraph:(BOOL)a4;
+ (id)wordsForLanguage:(unint64_t)a3;
- (BOOL)isRightToLeftLanguage;
- (ICRandomNumberGenerator)randomNumberGenerator;
- (ICRandomTextGenerator)initWithRandomNumberGenerator:(id)a3;
- (id)generateMinSentences:(unint64_t)a3 maxSentences:(unint64_t)a4 minWords:(unint64_t)a5 maxWords:(unint64_t)a6;
- (id)generateMinWords:(unint64_t)a3 maxWords:(unint64_t)a4;
- (id)generateWords:(unint64_t)a3 minLength:(unint64_t)a4;
- (id)generateWordsWithMinLength:(unint64_t)a3;
- (id)lineOfText;
- (id)paragraph;
- (id)sentence;
- (id)word;
- (unint64_t)language;
- (void)setLanguage:(unint64_t)a3;
- (void)setRandomNumberGenerator:(id)a3;
@end

@implementation ICRandomTextGenerator

- (ICRandomTextGenerator)initWithRandomNumberGenerator:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICRandomTextGenerator;
  v5 = [(ICRandomTextGenerator *)&v8 init];
  v6 = v5;
  if (v5) {
    [(ICRandomTextGenerator *)v5 setRandomNumberGenerator:v4];
  }

  return v6;
}

- (BOOL)isRightToLeftLanguage
{
  return [(ICRandomTextGenerator *)self language] == 5
      || [(ICRandomTextGenerator *)self language] == 7;
}

- (id)word
{
  return [(ICRandomTextGenerator *)self generateMinWords:1 maxWords:1];
}

- (id)lineOfText
{
  return [(ICRandomTextGenerator *)self generateMinWords:3 maxWords:20];
}

- (id)sentence
{
  return [(ICRandomTextGenerator *)self generateMinSentences:1 maxSentences:1 minWords:3 maxWords:20];
}

- (id)paragraph
{
  v2 = [(ICRandomTextGenerator *)self generateMinSentences:1 maxSentences:20 minWords:3 maxWords:20];
  v3 = [v2 stringByAppendingString:@"\n"];

  return v3;
}

+ (id)loadWordsForLanguage:(unint64_t)a3
{
  if (loadWordsForLanguage__onceToken != -1) {
    dispatch_once(&loadWordsForLanguage__onceToken, &__block_literal_global_5);
  }
  id v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v5 = [(id)loadWordsForLanguage__wordFileNames objectAtIndexedSubscript:a3];
  v6 = [v4 URLForResource:v5 withExtension:@"words" subdirectory:@"Internal"];

  id v19 = 0;
  v7 = [NSString stringWithContentsOfURL:v6 encoding:4 error:&v19];
  id v8 = v19;
  if (v7)
  {
    if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v7, "length"));
      uint64_t v10 = [v7 length];
      uint64_t v14 = MEMORY[0x1E4F143A8];
      uint64_t v15 = 3221225472;
      v16 = __46__ICRandomTextGenerator_loadWordsForLanguage___block_invoke_36;
      v17 = &unk_1E64A48A8;
      id v18 = v9;
      v11 = v9;
      objc_msgSend(v7, "enumerateSubstringsInRange:options:usingBlock:", 0, v10, 2, &v14);
      id v12 = [v11 copy];
    }
    else
    {
      v11 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
      id v12 = [v7 componentsSeparatedByCharactersInSet:v11];
    }
  }
  else
  {
    v11 = os_log_create("com.apple.notes", "Internal");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      +[ICRandomTextGenerator loadWordsForLanguage:v11];
    }
    id v12 = 0;
  }

  return v12;
}

void __46__ICRandomTextGenerator_loadWordsForLanguage___block_invoke()
{
  v0 = (void *)loadWordsForLanguage__wordFileNames;
  loadWordsForLanguage__wordFileNames = (uint64_t)&unk_1F1F62B80;
}

uint64_t __46__ICRandomTextGenerator_loadWordsForLanguage___block_invoke_36(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

+ (id)wordsForLanguage:(unint64_t)a3
{
  if (wordsForLanguage__onceToken != -1) {
    dispatch_once(&wordsForLanguage__onceToken, &__block_literal_global_40);
  }
  v5 = (void *)wordsForLanguage__wordsByLanguage;
  v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a3];
  v7 = [v5 objectForKey:v6];

  if (!v7)
  {
    v7 = [a1 loadWordsForLanguage:a3];
    if (v7)
    {
      id v8 = (void *)wordsForLanguage__wordsByLanguage;
      v9 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a3];
      [v8 setObject:v7 forKeyedSubscript:v9];
    }
  }
  return v7;
}

void __42__ICRandomTextGenerator_wordsForLanguage___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v1 = (void *)wordsForLanguage__wordsByLanguage;
  wordsForLanguage__wordsByLanguage = (uint64_t)v0;
}

+ (BOOL)hasSpacesBetweenWordsForLanguage:(unint64_t)a3
{
  return a3 - 4 < 0xFFFFFFFFFFFFFFFELL;
}

+ (id)sentencePunctuationForLanguage:(unint64_t)a3 endOfParagraph:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = @". ";
  if (a4) {
    v6 = @".";
  }
  v7 = v6;
  if (a3 - 2 < 2)
  {
    v9 = @"。";
  }
  else if (a3 == 4)
  {
    v9 = @" ";
  }
  else
  {
    if (a3 != 5) {
      goto LABEL_12;
    }
    id v8 = @"۔";
    if (v4) {
      id v8 = @"۔ ";
    }
    v9 = v8;
  }

  v7 = v9;
LABEL_12:
  return v7;
}

- (id)generateWords:(unint64_t)a3 minLength:(unint64_t)a4
{
  v7 = objc_msgSend((id)objc_opt_class(), "wordsForLanguage:", -[ICRandomTextGenerator language](self, "language"));
  uint64_t v8 = [v7 count] - 1;
  v9 = [(ICRandomTextGenerator *)self randomNumberGenerator];
  unint64_t v10 = [v9 randomIndexMin:0 max:v8];

  if (v10 >= [v7 count])
  {
    v22 = os_log_create("com.apple.notes", "Internal");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[ICRandomTextGenerator generateWords:minLength:](v22);
    }

    id v14 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  }
  else
  {
    id v11 = objc_alloc(MEMORY[0x1E4F28E78]);
    id v12 = [v7 objectAtIndexedSubscript:v10];
    v13 = [v12 localizedCapitalizedString];
    id v14 = (id)[v11 initWithString:v13];

    int v15 = objc_msgSend((id)objc_opt_class(), "hasSpacesBetweenWordsForLanguage:", -[ICRandomTextGenerator language](self, "language"));
    unint64_t v16 = a3 - 1;
    if (a3 != 1)
    {
      int v17 = v15;
      unint64_t v18 = 1;
      do
      {
        if (a4 && [v14 length] >= a4) {
          break;
        }
        id v19 = [(ICRandomTextGenerator *)self randomNumberGenerator];
        uint64_t v20 = [v19 randomIndexMin:0 max:v8];

        if (v17) {
          [v14 appendString:@" "];
        }
        v21 = [v7 objectAtIndexedSubscript:v20];
        [v14 appendString:v21];

        ++v18;
      }
      while (v16 >= v18);
    }
  }

  return v14;
}

- (id)generateMinWords:(unint64_t)a3 maxWords:(unint64_t)a4
{
  v7 = [(ICRandomTextGenerator *)self randomNumberGenerator];
  uint64_t v8 = -[ICRandomTextGenerator generateWords:minLength:](self, "generateWords:minLength:", [v7 randomIndexMin:a3 max:a4], 0);

  return v8;
}

- (id)generateWordsWithMinLength:(unint64_t)a3
{
  return [(ICRandomTextGenerator *)self generateWords:0 minLength:a3];
}

- (id)generateMinSentences:(unint64_t)a3 maxSentences:(unint64_t)a4 minWords:(unint64_t)a5 maxWords:(unint64_t)a6
{
  id v11 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  id v12 = [(ICRandomTextGenerator *)self randomNumberGenerator];
  uint64_t v13 = [v12 randomIndexMin:a3 max:a4];

  if (v13)
  {
    for (unint64_t i = 0; i != v13; ++i)
    {
      int v15 = [(ICRandomTextGenerator *)self generateMinWords:a5 maxWords:a6];
      [v11 appendString:v15];
      unint64_t v16 = objc_msgSend((id)objc_opt_class(), "sentencePunctuationForLanguage:endOfParagraph:", -[ICRandomTextGenerator language](self, "language"), i >= v13 - 1);
      [v11 appendString:v16];
    }
  }
  return v11;
}

- (unint64_t)language
{
  return self->_language;
}

- (void)setLanguage:(unint64_t)a3
{
  self->_language = a3;
}

- (ICRandomNumberGenerator)randomNumberGenerator
{
  return self->_randomNumberGenerator;
}

- (void)setRandomNumberGenerator:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (void)loadWordsForLanguage:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1C3A61000, log, OS_LOG_TYPE_ERROR, "Can't load words file %@ because %@", (uint8_t *)&v3, 0x16u);
}

- (void)generateWords:(os_log_t)log minLength:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C3A61000, log, OS_LOG_TYPE_ERROR, "Trying to generate random words, but the words aren't avaialble", v1, 2u);
}

@end
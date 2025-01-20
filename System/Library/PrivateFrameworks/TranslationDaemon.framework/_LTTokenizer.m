@interface _LTTokenizer
+ (unint64_t)_wordCount:(id)a3 inLocale:(id)a4;
- (id)_tokenizeString:(id)a3 inLocale:(id)a4;
- (id)tokenize:(id)a3 forLocale:(id)a4;
@end

@implementation _LTTokenizer

- (id)tokenize:(id)a3 forLocale:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 localeIdentifier];
  std::string::basic_string[abi:ne180100]<0>(&v32, (char *)[v7 UTF8String]);

  std::vector<unsigned short>::vector(&v30, [v5 length]);
  objc_msgSend(v5, "getCharacters:range:");
  std::basic_string<char16_t>::basic_string[abi:ne180100](__dst, v30, (v31 - (unsigned char *)v30) >> 1);
  v8 = [v6 languageCode];
  int v9 = [v8 isEqualToString:@"de"];

  if (v9)
  {
    v10 = [MEMORY[0x263F08708] whitespaceCharacterSet];
    v11 = [v5 componentsSeparatedByCharactersInSet:v10];

    v12 = [MEMORY[0x263F08A98] predicateWithFormat:@"SELF != ''"];
    v13 = [v11 filteredArrayUsingPredicate:v12];
  }
  else
  {
    __p = 0;
    uint64_t v25 = 0;
    uint64_t v26 = 0;
    morphun::util::ULocale::ULocale();
    uint64_t Tokenizer = morphun::TokenizerFactory::createTokenizer();
    morphun::util::ULocale::~ULocale((morphun::util::ULocale *)v27);
    v15 = (morphun::Chunk *)(*(uint64_t (**)(uint64_t, void **))(*(void *)Tokenizer + 24))(Tokenizer, __dst);
    v13 = [MEMORY[0x263EFF980] array];
    morphun::TokenIterator::TokenIterator();
    v27[0] = morphun::Chunk::end(v15);
    v27[1] = v16;
    while ((morphun::TokenIterator::operator!=() & 1) != 0)
    {
      v17 = (morphun::Token *)morphun::TokenIterator::operator*();
      if ((morphun::Token::isHead(v17) & 1) == 0
        && (morphun::Token::isTail(v17) & 1) == 0
        && (morphun::Token::isWhitespace(v17) & 1) == 0)
      {
        uint64_t Value = morphun::Token::getValue(v17);
        int v19 = *(char *)(Value + 23);
        if (v19 >= 0) {
          uint64_t v20 = Value;
        }
        else {
          uint64_t v20 = *(void *)Value;
        }
        if (v19 >= 0) {
          uint64_t v21 = *(unsigned __int8 *)(Value + 23);
        }
        else {
          uint64_t v21 = *(void *)(Value + 8);
        }
        v22 = objc_msgSend(NSString, "stringWithCharacters:length:", v20, v21, __p, v25, v26);
        [v13 addObject:v22];
      }
      morphun::TokenIterator::operator++();
    }
    if (v15) {
      (*(void (**)(morphun::Chunk *))(*(void *)v15 + 16))(v15);
    }
    (*(void (**)(uint64_t))(*(void *)Tokenizer + 16))(Tokenizer);
  }
  if (v29 < 0) {
    operator delete(__dst[0]);
  }
  if (v30)
  {
    v31 = v30;
    operator delete(v30);
  }
  if (v33 < 0) {
    operator delete(v32);
  }

  return v13;
}

- (id)_tokenizeString:(id)a3 inLocale:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)[objc_alloc(MEMORY[0x263F14040]) initWithUnit:0];
  v8 = [v6 languageCode];
  [v7 setLanguage:v8];

  [v7 setString:v5];
  int v9 = [MEMORY[0x263EFF980] array];
  uint64_t v10 = [v5 length];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __41___LTTokenizer__tokenizeString_inLocale___block_invoke;
  v16[3] = &unk_265548258;
  id v11 = v5;
  id v17 = v11;
  id v12 = v9;
  id v18 = v12;
  objc_msgSend(v7, "enumerateTokensInRange:usingBlock:", 0, v10, v16);
  v13 = v18;
  id v14 = v12;

  return v14;
}

+ (unint64_t)_wordCount:(id)a3 inLocale:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)[objc_alloc(MEMORY[0x263F14040]) initWithUnit:0];
  v8 = [v6 languageCode];
  [v7 setLanguage:v8];

  [v7 setString:v5];
  int v9 = objc_msgSend(v7, "tokensForRange:", 0, objc_msgSend(v5, "length"));
  unint64_t v10 = [v9 count];

  return v10;
}

@end
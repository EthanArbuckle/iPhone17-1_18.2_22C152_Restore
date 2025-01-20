@interface PXMiniHTMLParser
+ (NSDictionary)charactersForEntityNames;
+ (id)stringByConvertingToHTML:(id)a3;
- (NSString)_string;
- (PXMiniHTMLParser)init;
- (PXMiniHTMLParser)initWithString:(id)a3;
- (id)parsedCharactersBlock;
- (id)parsedErrorBlock;
- (id)parsedMarkupElementEndBlock;
- (id)parsedMarkupElementStartBlock;
- (void)parse;
- (void)setParsedCharactersBlock:(id)a3;
- (void)setParsedErrorBlock:(id)a3;
- (void)setParsedMarkupElementEndBlock:(id)a3;
- (void)setParsedMarkupElementStartBlock:(id)a3;
@end

@implementation PXMiniHTMLParser

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__string, 0);
  objc_storeStrong(&self->_parsedErrorBlock, 0);
  objc_storeStrong(&self->_parsedMarkupElementEndBlock, 0);
  objc_storeStrong(&self->_parsedMarkupElementStartBlock, 0);
  objc_storeStrong(&self->_parsedCharactersBlock, 0);
}

- (NSString)_string
{
  return self->__string;
}

- (void)setParsedErrorBlock:(id)a3
{
}

- (id)parsedErrorBlock
{
  return self->_parsedErrorBlock;
}

- (void)setParsedMarkupElementEndBlock:(id)a3
{
}

- (id)parsedMarkupElementEndBlock
{
  return self->_parsedMarkupElementEndBlock;
}

- (void)setParsedMarkupElementStartBlock:(id)a3
{
}

- (id)parsedMarkupElementStartBlock
{
  return self->_parsedMarkupElementStartBlock;
}

- (void)setParsedCharactersBlock:(id)a3
{
}

- (id)parsedCharactersBlock
{
  return self->_parsedCharactersBlock;
}

- (void)parse
{
  v3 = [PXMiniXMLParser alloc];
  v4 = [(PXMiniHTMLParser *)self _string];
  v5 = [(PXMiniXMLParser *)v3 initWithString:v4];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __25__PXMiniHTMLParser_parse__block_invoke;
  v9[3] = &unk_1E5DD2D18;
  v9[4] = self;
  [(PXMiniXMLParser *)v5 setParsedCharactersBlock:v9];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __25__PXMiniHTMLParser_parse__block_invoke_2;
  v8[3] = &unk_1E5DD2D40;
  v8[4] = self;
  [(PXMiniXMLParser *)v5 setParsedTagBlock:v8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __25__PXMiniHTMLParser_parse__block_invoke_3;
  v7[3] = &unk_1E5DD2D18;
  v7[4] = self;
  [(PXMiniXMLParser *)v5 setParsedEntityBlock:v7];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __25__PXMiniHTMLParser_parse__block_invoke_4;
  v6[3] = &unk_1E5DD2D68;
  v6[4] = self;
  [(PXMiniXMLParser *)v5 setParsedErrorBlock:v6];
  [(PXMiniXMLParser *)v5 parse];
}

void __25__PXMiniHTMLParser_parse__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  v3 = [*(id *)(a1 + 32) parsedCharactersBlock];

  if (v3)
  {
    v4 = [*(id *)(a1 + 32) parsedCharactersBlock];
    ((void (**)(void, id))v4)[2](v4, v5);
  }
}

void __25__PXMiniHTMLParser_parse__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v10 = a3;
  if ([v10 isEqualToString:@"b"])
  {
    uint64_t v5 = 1;
  }
  else
  {
    if (![v10 isEqualToString:@"i"]) {
      goto LABEL_12;
    }
    uint64_t v5 = 2;
  }
  if (a2 == 1)
  {
    v8 = [*(id *)(a1 + 32) parsedMarkupElementEndBlock];

    if (!v8) {
      goto LABEL_12;
    }
    uint64_t v7 = [*(id *)(a1 + 32) parsedMarkupElementEndBlock];
    goto LABEL_11;
  }
  if (!a2)
  {
    v6 = [*(id *)(a1 + 32) parsedMarkupElementStartBlock];

    if (v6)
    {
      uint64_t v7 = [*(id *)(a1 + 32) parsedMarkupElementStartBlock];
LABEL_11:
      v9 = (void *)v7;
      (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, v5);
    }
  }
LABEL_12:
}

void __25__PXMiniHTMLParser_parse__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = +[PXMiniHTMLParser charactersForEntityNames];
  id v7 = [v4 objectForKeyedSubscript:v3];

  if (v7)
  {
    uint64_t v5 = [*(id *)(a1 + 32) parsedCharactersBlock];

    if (v5)
    {
      v6 = [*(id *)(a1 + 32) parsedCharactersBlock];
      ((void (**)(void, id))v6)[2](v6, v7);
    }
  }
}

void __25__PXMiniHTMLParser_parse__block_invoke_4(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [*(id *)(a1 + 32) parsedErrorBlock];

  if (v3)
  {
    v4 = [*(id *)(a1 + 32) parsedErrorBlock];
    ((void (**)(void, id))v4)[2](v4, v5);
  }
}

- (PXMiniHTMLParser)initWithString:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXMiniHTMLParser;
  v6 = [(PXMiniHTMLParser *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->__string, a3);
  }

  return v7;
}

- (PXMiniHTMLParser)init
{
  return [(PXMiniHTMLParser *)self initWithString:0];
}

+ (id)stringByConvertingToHTML:(id)a3
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__300769;
  v14 = __Block_byref_object_dispose__300770;
  id v3 = a3;
  id v15 = v3;
  uint64_t v4 = [v3 stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"];
  id v5 = (void *)v11[5];
  v11[5] = v4;

  v6 = +[PXMiniHTMLParser charactersForEntityNames];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __45__PXMiniHTMLParser_stringByConvertingToHTML___block_invoke;
  v9[3] = &unk_1E5DD2D90;
  v9[4] = &v10;
  [v6 enumerateKeysAndObjectsUsingBlock:v9];

  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __45__PXMiniHTMLParser_stringByConvertingToHTML___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (([v5 isEqualToString:@"&"] & 1) == 0)
  {
    v6 = (void *)[[NSString alloc] initWithFormat:@"&%@;", v10];
    uint64_t v7 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) stringByReplacingOccurrencesOfString:v5 withString:v6];
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
    objc_super v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
}

+ (NSDictionary)charactersForEntityNames
{
  if (charactersForEntityNames_onceToken != -1) {
    dispatch_once(&charactersForEntityNames_onceToken, &__block_literal_global_300782);
  }
  v2 = (void *)charactersForEntityNames_charactersForEntityNames;
  return (NSDictionary *)v2;
}

void __44__PXMiniHTMLParser_charactersForEntityNames__block_invoke()
{
  v0 = (void *)charactersForEntityNames_charactersForEntityNames;
  charactersForEntityNames_charactersForEntityNames = (uint64_t)&unk_1F02DB9F0;
}

@end
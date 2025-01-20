@interface PXMiniXMLParser
- (BOOL)_isAtEnd;
- (BOOL)_parseCharacters;
- (BOOL)_parseEntity;
- (BOOL)_parseTag;
- (BOOL)_tryScanningUsingBlock:(id)a3;
- (NSCharacterSet)_syntaxMarkerCharactersSet;
- (NSScanner)_scanner;
- (PXMiniXMLParser)init;
- (PXMiniXMLParser)initWithString:(id)a3;
- (id)parsedCharactersBlock;
- (id)parsedEntityBlock;
- (id)parsedErrorBlock;
- (id)parsedTagBlock;
- (void)parse;
- (void)setParsedCharactersBlock:(id)a3;
- (void)setParsedEntityBlock:(id)a3;
- (void)setParsedErrorBlock:(id)a3;
- (void)setParsedTagBlock:(id)a3;
@end

@implementation PXMiniXMLParser

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__syntaxMarkerCharactersSet, 0);
  objc_storeStrong((id *)&self->__scanner, 0);
  objc_storeStrong(&self->_parsedErrorBlock, 0);
  objc_storeStrong(&self->_parsedEntityBlock, 0);
  objc_storeStrong(&self->_parsedTagBlock, 0);
  objc_storeStrong(&self->_parsedCharactersBlock, 0);
}

- (NSCharacterSet)_syntaxMarkerCharactersSet
{
  return self->__syntaxMarkerCharactersSet;
}

- (NSScanner)_scanner
{
  return self->__scanner;
}

- (void)setParsedErrorBlock:(id)a3
{
}

- (id)parsedErrorBlock
{
  return self->_parsedErrorBlock;
}

- (void)setParsedEntityBlock:(id)a3
{
}

- (id)parsedEntityBlock
{
  return self->_parsedEntityBlock;
}

- (void)setParsedTagBlock:(id)a3
{
}

- (id)parsedTagBlock
{
  return self->_parsedTagBlock;
}

- (void)setParsedCharactersBlock:(id)a3
{
}

- (id)parsedCharactersBlock
{
  return self->_parsedCharactersBlock;
}

- (BOOL)_tryScanningUsingBlock:(id)a3
{
  v4 = (uint64_t (**)(id, void *))a3;
  v5 = [(PXMiniXMLParser *)self _scanner];
  uint64_t v6 = [v5 scanLocation];
  char v7 = v4[2](v4, v5);

  if ((v7 & 1) == 0) {
    [v5 setScanLocation:v6];
  }

  return v7;
}

- (BOOL)_parseEntity
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __31__PXMiniXMLParser__parseEntity__block_invoke;
  v3[3] = &unk_1E5DCE378;
  v3[4] = self;
  return [(PXMiniXMLParser *)self _tryScanningUsingBlock:v3];
}

uint64_t __31__PXMiniXMLParser__parseEntity__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 scanString:@"&" intoString:0])
  {
    v4 = [MEMORY[0x1E4F28B88] letterCharacterSet];
    id v11 = 0;
    int v5 = [v3 scanCharactersFromSet:v4 intoString:&v11];
    id v6 = v11;

    if (v5 && [v3 scanString:@";" intoString:0])
    {
      char v7 = [*(id *)(a1 + 32) parsedEntityBlock];

      if (v7)
      {
        v8 = [*(id *)(a1 + 32) parsedEntityBlock];
        ((void (**)(void, id))v8)[2](v8, v6);
      }
      uint64_t v9 = 1;
    }
    else
    {
      uint64_t v9 = 0;
    }
  }
  else
  {
    uint64_t v9 = 0;
    id v6 = 0;
  }

  return v9;
}

- (BOOL)_parseTag
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __28__PXMiniXMLParser__parseTag__block_invoke;
  v3[3] = &unk_1E5DCE378;
  v3[4] = self;
  return [(PXMiniXMLParser *)self _tryScanningUsingBlock:v3];
}

uint64_t __28__PXMiniXMLParser__parseTag__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [v3 scanString:@"<" intoString:0];
  char v5 = [v3 scanString:@"/" intoString:0];
  char v6 = v5;
  if (v4)
  {
    char v7 = [MEMORY[0x1E4F28B88] letterCharacterSet];
    id v15 = 0;
    int v8 = [v3 scanCharactersFromSet:v7 intoString:&v15];
    id v9 = v15;

    if ((v6 & 1) == 0) {
      goto LABEL_3;
    }
  }
  else
  {
    int v8 = 0;
    id v9 = 0;
    if ((v5 & 1) == 0)
    {
LABEL_3:
      if ([v3 scanString:@"/" intoString:0]) {
        uint64_t v10 = 2;
      }
      else {
        uint64_t v10 = 0;
      }
      if (!v8) {
        goto LABEL_14;
      }
      goto LABEL_10;
    }
  }
  uint64_t v10 = 1;
  if (!v8)
  {
LABEL_14:
    uint64_t v13 = 0;
    goto LABEL_15;
  }
LABEL_10:
  if (![v3 scanString:@">" intoString:0]) {
    goto LABEL_14;
  }
  id v11 = [*(id *)(a1 + 32) parsedTagBlock];

  if (v11)
  {
    v12 = [*(id *)(a1 + 32) parsedTagBlock];
    ((void (**)(void, uint64_t, id))v12)[2](v12, v10, v9);
  }
  uint64_t v13 = 1;
LABEL_15:

  return v13;
}

- (BOOL)_parseCharacters
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __35__PXMiniXMLParser__parseCharacters__block_invoke;
  v3[3] = &unk_1E5DCE378;
  v3[4] = self;
  return [(PXMiniXMLParser *)self _tryScanningUsingBlock:v3];
}

uint64_t __35__PXMiniXMLParser__parseCharacters__block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  char v5 = [v3 _syntaxMarkerCharactersSet];
  id v11 = 0;
  uint64_t v6 = [v4 scanUpToCharactersFromSet:v5 intoString:&v11];

  id v7 = v11;
  if (v6)
  {
    int v8 = [*(id *)(a1 + 32) parsedCharactersBlock];

    if (v8)
    {
      id v9 = [*(id *)(a1 + 32) parsedCharactersBlock];
      ((void (**)(void, id))v9)[2](v9, v7);
    }
  }

  return v6;
}

- (BOOL)_isAtEnd
{
  v2 = [(PXMiniXMLParser *)self _scanner];
  char v3 = [v2 isAtEnd];

  return v3;
}

- (void)parse
{
  if (![(PXMiniXMLParser *)self _isAtEnd])
  {
    while (1)
    {
      if (![(PXMiniXMLParser *)self _parseCharacters]
        && ![(PXMiniXMLParser *)self _parseTag]
        && ![(PXMiniXMLParser *)self _parseEntity])
      {
        char v3 = [(PXMiniXMLParser *)self parsedErrorBlock];

        if (v3) {
          break;
        }
      }
      if ([(PXMiniXMLParser *)self _isAtEnd]) {
        goto LABEL_7;
      }
    }
    id v4 = [(PXMiniXMLParser *)self parsedErrorBlock];
    v4[2](v4, 0);
  }
LABEL_7:
  [(PXMiniXMLParser *)self setParsedCharactersBlock:0];
  [(PXMiniXMLParser *)self setParsedTagBlock:0];
  [(PXMiniXMLParser *)self setParsedEntityBlock:0];
  [(PXMiniXMLParser *)self setParsedErrorBlock:0];
}

- (PXMiniXMLParser)initWithString:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PXMiniXMLParser;
  char v5 = [(PXMiniXMLParser *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F28FE8]) initWithString:v4];
    scanner = v5->__scanner;
    v5->__scanner = (NSScanner *)v6;

    [(NSScanner *)v5->__scanner setCharactersToBeSkipped:0];
    uint64_t v8 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"<&"];
    syntaxMarkerCharactersSet = v5->__syntaxMarkerCharactersSet;
    v5->__syntaxMarkerCharactersSet = (NSCharacterSet *)v8;
  }
  return v5;
}

- (PXMiniXMLParser)init
{
  return [(PXMiniXMLParser *)self initWithString:0];
}

@end
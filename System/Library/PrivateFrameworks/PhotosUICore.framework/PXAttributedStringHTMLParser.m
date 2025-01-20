@interface PXAttributedStringHTMLParser
+ (id)stringByConvertingToHTML:(id)a3;
- (NSCountedSet)_currentMarkupElements;
- (NSDictionary)_currentAttributes;
- (NSDictionary)_defaultAttributes;
- (NSDictionary)emphasizedAttributes;
- (NSDictionary)italicizedAttributes;
- (NSString)_htmlString;
- (PXAttributedStringHTMLParser)init;
- (PXAttributedStringHTMLParser)initWithHTMLString:(id)a3 defaultAttributes:(id)a4;
- (id)parsedAttributedStringBlock;
- (id)parsedErrorBlock;
- (unsigned)_currentTraits;
- (void)_setCurrentAttributes:(id)a3;
- (void)_setCurrentTraits:(unsigned int)a3;
- (void)_updateCurrentTraits;
- (void)parse;
- (void)setEmphasizedAttributes:(id)a3;
- (void)setItalicizedAttributes:(id)a3;
- (void)setParsedAttributedStringBlock:(id)a3;
- (void)setParsedErrorBlock:(id)a3;
@end

@implementation PXAttributedStringHTMLParser

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__currentAttributes, 0);
  objc_storeStrong((id *)&self->__currentMarkupElements, 0);
  objc_storeStrong((id *)&self->__defaultAttributes, 0);
  objc_storeStrong((id *)&self->__htmlString, 0);
  objc_storeStrong(&self->_parsedErrorBlock, 0);
  objc_storeStrong(&self->_parsedAttributedStringBlock, 0);
  objc_storeStrong((id *)&self->_italicizedAttributes, 0);
  objc_storeStrong((id *)&self->_emphasizedAttributes, 0);
}

- (void)_setCurrentAttributes:(id)a3
{
}

- (NSDictionary)_currentAttributes
{
  return self->__currentAttributes;
}

- (unsigned)_currentTraits
{
  return self->__currentTraits;
}

- (NSCountedSet)_currentMarkupElements
{
  return self->__currentMarkupElements;
}

- (NSDictionary)_defaultAttributes
{
  return self->__defaultAttributes;
}

- (NSString)_htmlString
{
  return self->__htmlString;
}

- (void)setParsedErrorBlock:(id)a3
{
}

- (id)parsedErrorBlock
{
  return self->_parsedErrorBlock;
}

- (void)setParsedAttributedStringBlock:(id)a3
{
}

- (id)parsedAttributedStringBlock
{
  return self->_parsedAttributedStringBlock;
}

- (void)setItalicizedAttributes:(id)a3
{
}

- (NSDictionary)italicizedAttributes
{
  return self->_italicizedAttributes;
}

- (void)setEmphasizedAttributes:(id)a3
{
}

- (NSDictionary)emphasizedAttributes
{
  return self->_emphasizedAttributes;
}

- (void)_setCurrentTraits:(unsigned int)a3
{
  if (self->__currentTraits == a3) {
    return;
  }
  uint64_t v3 = *(void *)&a3;
  self->__currentTraits = a3;
  if (a3 == 1)
  {
    uint64_t v5 = [(PXAttributedStringHTMLParser *)self italicizedAttributes];
  }
  else
  {
    if (a3 != 2)
    {
LABEL_7:
      v7 = [(PXAttributedStringHTMLParser *)self _defaultAttributes];
      uint64_t v8 = *MEMORY[0x1E4FB06F8];
      v9 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4FB06F8]];
      v10 = (void *)MEMORY[0x1E4FB08E0];
      v11 = [v9 fontDescriptor];
      v12 = [v11 fontDescriptorWithSymbolicTraits:v3];
      [v9 pointSize];
      v13 = objc_msgSend(v10, "fontWithDescriptor:size:", v12);

      id v14 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v7];
      if (v13) {
        [v14 setObject:v13 forKeyedSubscript:v8];
      }

      id v6 = v14;
      goto LABEL_10;
    }
    uint64_t v5 = [(PXAttributedStringHTMLParser *)self emphasizedAttributes];
  }
  id v6 = (id)v5;
  if (!v5) {
    goto LABEL_7;
  }
LABEL_10:
  id v15 = v6;
  [(PXAttributedStringHTMLParser *)self _setCurrentAttributes:v6];
}

- (void)_updateCurrentTraits
{
  id v4 = [(PXAttributedStringHTMLParser *)self _currentMarkupElements];
  if ([v4 containsObject:&unk_1F02D7EA0]) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  -[PXAttributedStringHTMLParser _setCurrentTraits:](self, "_setCurrentTraits:", v3 | [v4 containsObject:&unk_1F02D7EB8]);
}

- (void)parse
{
  int v3 = [PXMiniHTMLParser alloc];
  id v4 = [(PXAttributedStringHTMLParser *)self _htmlString];
  uint64_t v5 = [(PXMiniHTMLParser *)v3 initWithString:v4];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __37__PXAttributedStringHTMLParser_parse__block_invoke;
  v9[3] = &unk_1E5DD2D18;
  v9[4] = self;
  [(PXMiniHTMLParser *)v5 setParsedCharactersBlock:v9];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __37__PXAttributedStringHTMLParser_parse__block_invoke_2;
  v8[3] = &unk_1E5DCF720;
  v8[4] = self;
  [(PXMiniHTMLParser *)v5 setParsedMarkupElementStartBlock:v8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__PXAttributedStringHTMLParser_parse__block_invoke_3;
  v7[3] = &unk_1E5DCF720;
  v7[4] = self;
  [(PXMiniHTMLParser *)v5 setParsedMarkupElementEndBlock:v7];
  id v6 = [(PXAttributedStringHTMLParser *)self parsedErrorBlock];
  [(PXMiniHTMLParser *)v5 setParsedErrorBlock:v6];

  [(PXMiniHTMLParser *)v5 parse];
}

void __37__PXAttributedStringHTMLParser_parse__block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  int v3 = [*(id *)(a1 + 32) parsedAttributedStringBlock];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) _currentAttributes];
    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v7 attributes:v4];
    id v6 = [*(id *)(a1 + 32) parsedAttributedStringBlock];
    ((void (**)(void, void *))v6)[2](v6, v5);
  }
}

uint64_t __37__PXAttributedStringHTMLParser_parse__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) _currentMarkupElements];
  uint64_t v5 = [NSNumber numberWithInteger:a2];
  [v4 addObject:v5];

  id v6 = *(void **)(a1 + 32);
  return [v6 _updateCurrentTraits];
}

uint64_t __37__PXAttributedStringHTMLParser_parse__block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) _currentMarkupElements];
  uint64_t v5 = [NSNumber numberWithInteger:a2];
  [v4 removeObject:v5];

  id v6 = *(void **)(a1 + 32);
  return [v6 _updateCurrentTraits];
}

- (PXAttributedStringHTMLParser)initWithHTMLString:(id)a3 defaultAttributes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PXAttributedStringHTMLParser;
  uint64_t v8 = [(PXAttributedStringHTMLParser *)&v16 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    htmlString = v8->__htmlString;
    v8->__htmlString = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    defaultAttributes = v8->__defaultAttributes;
    v8->__defaultAttributes = (NSDictionary *)v11;

    uint64_t v13 = [MEMORY[0x1E4F28BD0] setWithCapacity:3];
    currentMarkupElements = v8->__currentMarkupElements;
    v8->__currentMarkupElements = (NSCountedSet *)v13;

    objc_storeStrong((id *)&v8->__currentAttributes, v8->__defaultAttributes);
  }

  return v8;
}

- (PXAttributedStringHTMLParser)init
{
  return [(PXAttributedStringHTMLParser *)self initWithHTMLString:&stru_1F00B0030 defaultAttributes:0];
}

+ (id)stringByConvertingToHTML:(id)a3
{
  return +[PXMiniHTMLParser stringByConvertingToHTML:a3];
}

@end
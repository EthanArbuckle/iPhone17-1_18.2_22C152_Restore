@interface MFPlainTextDocument
- (id)archivedRepresentation;
- (id)quotedString:(unsigned int)a3;
- (id)string;
- (unint64_t)fragmentCount;
- (void)appendArchivedRepresentation:(id)a3;
- (void)appendString:(id)a3 withQuoteLevel:(unsigned int)a4;
- (void)getFormatFlowedString:(id *)a3 insertedTrailingSpaces:(BOOL *)a4 encoding:(unsigned int)a5;
- (void)getString:(id *)a3 quoteLevel:(unsigned int *)a4 ofFragmentAtIndex:(unint64_t)a5;
@end

@implementation MFPlainTextDocument

- (void)getFormatFlowedString:(id *)a3 insertedTrailingSpaces:(BOOL *)a4 encoding:(unsigned int)a5
{
  id v9 = +[_MFFormatFlowedWriter newWithPlainTextDocument:self encoding:*(void *)&a5];
  v7 = [v9 outputString];
  v8 = v7;
  if (a3) {
    *a3 = v7;
  }
  if (a4) {
    *a4 = [v9 addedTrailingSpaces];
  }
}

- (id)quotedString:(unsigned int)a3
{
  id v3 = +[_MFFormatFlowedWriter newWithPlainTextDocument:self encoding:*(void *)&a3];
  v4 = [v3 quotedString];

  return v4;
}

- (void)appendString:(id)a3 withQuoteLevel:(unsigned int)a4
{
  id v14 = a3;
  text = self->_text;
  if (!text)
  {
    v7 = (NSMutableString *)objc_alloc_init(MEMORY[0x1E4F28E78]);
    v8 = self->_text;
    self->_text = v7;

    text = self->_text;
  }
  uint64_t v9 = [(NSMutableString *)text length];
  uint64_t v10 = [v14 length];
  [(NSMutableString *)self->_text appendString:v14];
  if (!self->_fragments)
  {
    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    fragments = self->_fragments;
    self->_fragments = v11;
  }
  v13 = objc_alloc_init(MFPlainTextFragment);
  v13->_range.location = v9;
  v13->_range.length = v10;
  v13->_quoteLevel = a4;
  [(NSMutableArray *)self->_fragments addObject:v13];
}

- (unint64_t)fragmentCount
{
  return [(NSMutableArray *)self->_fragments count];
}

- (void)getString:(id *)a3 quoteLevel:(unsigned int *)a4 ofFragmentAtIndex:(unint64_t)a5
{
  uint64_t v8 = [(NSMutableArray *)self->_fragments objectAtIndex:a5];
  if (a3)
  {
    uint64_t v9 = v8;
    -[NSMutableString substringWithRange:](self->_text, "substringWithRange:", *(void *)(v8 + 8), *(void *)(v8 + 16));
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = v9;
  }
  if (a4) {
    *a4 = *(_DWORD *)(v8 + 24);
  }
}

- (id)string
{
  return self->_text;
}

- (id)archivedRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v4 = [(NSMutableArray *)self->_fragments count];
  if (v4)
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      unsigned int v11 = -1431655766;
      v6 = [MEMORY[0x1E4F1CA60] dictionary];
      id v10 = 0;
      [(MFPlainTextDocument *)self getString:&v10 quoteLevel:&v11 ofFragmentAtIndex:i];
      id v7 = v10;
      [v6 setObject:v7 forKey:@"string"];
      uint64_t v8 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:v11];
      [v6 setObject:v8 forKey:@"quoteLevel"];

      [v3 addObject:v6];
    }
  }
  return v3;
}

- (void)appendArchivedRepresentation:(id)a3
{
  id v10 = a3;
  uint64_t v4 = [v10 count];
  if (v4)
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      v6 = [v10 objectAtIndex:i];
      id v7 = [v6 objectForKey:@"string"];
      uint64_t v8 = [v6 objectForKey:@"quoteLevel"];
      uint64_t v9 = [v8 unsignedIntValue];

      [(MFPlainTextDocument *)self appendString:v7 withQuoteLevel:v9];
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fragments, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
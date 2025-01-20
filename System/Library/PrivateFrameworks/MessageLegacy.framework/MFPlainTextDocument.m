@interface MFPlainTextDocument
- (id)archivedRepresentation;
- (id)quotedString:(unsigned int)a3;
- (id)string;
- (unint64_t)fragmentCount;
- (void)appendArchivedRepresentation:(id)a3;
- (void)appendString:(id)a3 withQuoteLevel:(unsigned int)a4;
- (void)dealloc;
- (void)getFormatFlowedString:(id *)a3 insertedTrailingSpaces:(BOOL *)a4 encoding:(unsigned int)a5;
- (void)getString:(id *)a3 quoteLevel:(unsigned int *)a4 ofFragmentAtIndex:(unint64_t)a5;
@end

@implementation MFPlainTextDocument

- (void)getFormatFlowedString:(id *)a3 insertedTrailingSpaces:(BOOL *)a4 encoding:(unsigned int)a5
{
  id v9 = +[_MFFormatFlowedWriter newWithPlainTextDocument:self encoding:*(void *)&a5];
  v7 = (void *)[v9 outputString];
  if (a3) {
    *a3 = v7;
  }
  v8 = v9;
  if (a4)
  {
    *a4 = [v9 addedTrailingSpaces];
    v8 = v9;
  }
}

- (id)quotedString:(unsigned int)a3
{
  id v3 = +[_MFFormatFlowedWriter newWithPlainTextDocument:self encoding:*(void *)&a3];
  v4 = (void *)[v3 quotedString];

  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MFPlainTextDocument;
  [(MFPlainTextDocument *)&v3 dealloc];
}

- (void)appendString:(id)a3 withQuoteLevel:(unsigned int)a4
{
  text = self->_text;
  if (!text)
  {
    text = (NSMutableString *)objc_alloc_init(MEMORY[0x1E4F28E78]);
    self->_text = text;
  }
  uint64_t v8 = [(NSMutableString *)text length];
  uint64_t v9 = [a3 length];
  [(NSMutableString *)self->_text appendString:a3];
  if (!self->_fragments) {
    self->_fragments = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  v10 = objc_alloc_init(MFPlainTextFragment);
  v10->_range.location = v8;
  v10->_range.length = v9;
  v10->_quoteLevel = a4;
  [(NSMutableArray *)self->_fragments addObject:v10];
}

- (unint64_t)fragmentCount
{
  return [(NSMutableArray *)self->_fragments count];
}

- (void)getString:(id *)a3 quoteLevel:(unsigned int *)a4 ofFragmentAtIndex:(unint64_t)a5
{
  uint64_t v8 = [(NSMutableArray *)self->_fragments objectAtIndex:a5];
  if (a3) {
    *a3 = (id)-[NSMutableString substringWithRange:](self->_text, "substringWithRange:", *(void *)(v8 + 8), *(void *)(v8 + 16));
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
  objc_super v3 = (void *)[MEMORY[0x1E4F1CA48] array];
  uint64_t v4 = [(NSMutableArray *)self->_fragments count];
  if (v4)
  {
    uint64_t v5 = v4;
    for (uint64_t i = 0; i != v5; ++i)
    {
      uint64_t v10 = 0;
      unsigned int v9 = 0;
      v7 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
      [(MFPlainTextDocument *)self getString:&v10 quoteLevel:&v9 ofFragmentAtIndex:i];
      [v7 setObject:v10 forKey:@"string"];
      objc_msgSend(v7, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v9), @"quoteLevel");
      [v3 addObject:v7];
    }
  }
  return v3;
}

- (void)appendArchivedRepresentation:(id)a3
{
  uint64_t v5 = [a3 count];
  if (v5)
  {
    uint64_t v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
    {
      uint64_t v8 = (void *)[a3 objectAtIndex:i];
      -[MFPlainTextDocument appendString:withQuoteLevel:](self, "appendString:withQuoteLevel:", [v8 objectForKey:@"string"], objc_msgSend((id)objc_msgSend(v8, "objectForKey:", @"quoteLevel"), "unsignedIntValue"));
    }
  }
}

@end
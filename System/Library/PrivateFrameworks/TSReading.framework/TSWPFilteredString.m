@interface TSWPFilteredString
- (NSString)sourceString;
- (TSWPDeletionRangeMap)rangeMap;
- (TSWPFilteredString)initWithString:(id)a3 subrange:(_NSRange)a4 removeRanges:(id)a5;
- (TSWPRangeArray)sourceRanges;
- (_NSRange)charRangeMappedFromStorage:(_NSRange)a3;
- (_NSRange)charRangeMappedToStorage:(_NSRange)a3;
- (unint64_t)charIndexMappedFromStorage:(unint64_t)a3;
- (unint64_t)charIndexMappedToStorage:(unint64_t)a3;
- (unint64_t)length;
- (unsigned)characterAtIndex:(unint64_t)a3;
- (void)dealloc;
- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4;
- (void)setRangeMap:(id)a3;
- (void)setSourceString:(id)a3;
@end

@implementation TSWPFilteredString

- (TSWPFilteredString)initWithString:(id)a3 subrange:(_NSRange)a4 removeRanges:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v13.receiver = self;
  v13.super_class = (Class)TSWPFilteredString;
  v9 = [(TSWPFilteredString *)&v13 init];
  if (v9)
  {
    v9->_sourceString = (NSString *)a3;
    v10 = -[TSWPDeletionRangeMap initWithSubRange:removeRanges:]([TSWPDeletionRangeMap alloc], "initWithSubRange:removeRanges:", location, length, a5);
    v9->_rangeMap = v10;
    v9->_sourceRanges = (TSWPRangeArray *)-[TSWPDeletionRangeMap inverseRangesInStorageRange:](v10, "inverseRangesInStorageRange:", location, length);
    -[TSWPDeletionRangeMap mappedCharRange:](v9->_rangeMap, "mappedCharRange:", location, length);
    v9->_NSUInteger length = v11;
  }
  return v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSWPFilteredString;
  [(TSWPFilteredString *)&v3 dealloc];
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  v5 = [(TSWPFilteredString *)self sourceString];
  unint64_t v6 = [(TSWPDeletionRangeMap *)[(TSWPFilteredString *)self rangeMap] unmappedCharIndex:a3];

  return [(NSString *)v5 characterAtIndex:v6];
}

- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4
{
  uint64_t v6 = -[TSWPDeletionRangeMap unmappedCharRange:]([(TSWPFilteredString *)self rangeMap], "unmappedCharRange:", a4.location, a4.length);
  uint64_t v8 = v7;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  v11[3] = 0;
  v9 = [(TSWPFilteredString *)self sourceRanges];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __42__TSWPFilteredString_getCharacters_range___block_invoke;
  v10[3] = &unk_2646B2978;
  v10[5] = v11;
  v10[6] = a3;
  v10[4] = self;
  -[TSWPRangeArray enumerateRangesInRange:usingBlock:](v9, "enumerateRangesInRange:usingBlock:", v6, v8, v10);
  _Block_object_dispose(v11, 8);
}

uint64_t __42__TSWPFilteredString_getCharacters_range___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "sourceString"), "getCharacters:range:", *(void *)(a1 + 48) + 2 * *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24), a2, a3);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += a3;
  return result;
}

- (unint64_t)charIndexMappedToStorage:(unint64_t)a3
{
  v4 = [(TSWPFilteredString *)self rangeMap];

  return [(TSWPDeletionRangeMap *)v4 unmappedCharIndex:a3];
}

- (unint64_t)charIndexMappedFromStorage:(unint64_t)a3
{
  v4 = [(TSWPFilteredString *)self rangeMap];

  return [(TSWPDeletionRangeMap *)v4 mappedCharIndex:a3];
}

- (_NSRange)charRangeMappedToStorage:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v5 = [(TSWPFilteredString *)self rangeMap];

  NSUInteger v6 = -[TSWPDeletionRangeMap unmappedCharRange:](v5, "unmappedCharRange:", location, length);
  result.NSUInteger length = v7;
  result.NSUInteger location = v6;
  return result;
}

- (_NSRange)charRangeMappedFromStorage:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v5 = [(TSWPFilteredString *)self rangeMap];

  NSUInteger v6 = -[TSWPDeletionRangeMap mappedCharRange:](v5, "mappedCharRange:", location, length);
  result.NSUInteger length = v7;
  result.NSUInteger location = v6;
  return result;
}

- (unint64_t)length
{
  return self->_length;
}

- (NSString)sourceString
{
  return self->_sourceString;
}

- (void)setSourceString:(id)a3
{
}

- (TSWPDeletionRangeMap)rangeMap
{
  return self->_rangeMap;
}

- (void)setRangeMap:(id)a3
{
}

- (TSWPRangeArray)sourceRanges
{
  return self->_sourceRanges;
}

@end
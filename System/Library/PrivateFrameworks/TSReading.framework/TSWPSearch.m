@interface TSWPSearch
- (BOOL)isComplete;
- (NSString)searchedString;
- (TSWPFilteredString)filteredString;
- (TSWPSearch)initWithString:(id)a3 options:(unint64_t)a4 hitBlock:(id)a5 storage:(id)a6 range:(_NSRange)a7;
- (TSWPStorage)storage;
- (_NSRange)range;
- (void)dealloc;
- (void)foundHitWithRange:(_NSRange)a3;
- (void)setRange:(_NSRange)a3;
@end

@implementation TSWPSearch

- (TSWPSearch)initWithString:(id)a3 options:(unint64_t)a4 hitBlock:(id)a5 storage:(id)a6 range:(_NSRange)a7
{
  NSUInteger length = a7.length;
  NSUInteger location = a7.location;
  if (a3)
  {
    if (a6) {
      goto LABEL_3;
    }
  }
  else
  {
    v20 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v21 = [NSString stringWithUTF8String:"-[TSWPSearch initWithString:options:hitBlock:storage:range:]"];
    objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPSearch.mm"), 30, @"invalid nil value for '%s'", "string");
    if (a6) {
      goto LABEL_3;
    }
  }
  v22 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v23 = [NSString stringWithUTF8String:"-[TSWPSearch initWithString:options:hitBlock:storage:range:]"];
  objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPSearch.mm"), 31, @"invalid nil value for '%s'", "storage");
LABEL_3:
  v27.receiver = self;
  v27.super_class = (Class)TSWPSearch;
  v14 = [(TSKSearch *)&v27 initWithString:a3 options:a4 hitBlock:a5];
  v15 = v14;
  if (v14)
  {
    p_range = &v14->_range;
    v14->_range.NSUInteger location = location;
    v14->_range.NSUInteger length = length;
    v14->_storage = (TSWPStorage *)a6;
    id v17 = (id)objc_opt_new();
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __60__TSWPSearch_initWithString_options_hitBlock_storage_range___block_invoke;
    v26[3] = &unk_2646B2F70;
    v26[4] = v17;
    v26[5] = location;
    v26[6] = length;
    objc_msgSend(a6, "enumerateSmartFieldsWithAttributeKind:inRange:usingBlock:", 6, location, length, v26);
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __60__TSWPSearch_initWithString_options_hitBlock_storage_range___block_invoke_2;
    v25[3] = &unk_2646B2F98;
    v25[4] = v17;
    objc_msgSend(a6, "enumerateAttachmentsInTextRange:usingBlock:", location, length, v25);
    if ([v17 rangeCount])
    {
      v18 = -[TSWPFilteredString initWithString:subrange:removeRanges:]([TSWPFilteredString alloc], "initWithString:subrange:removeRanges:", [a6 string], location, length, v17);
      v15->_filteredString = v18;
      v15->_searchedString = &v18->super;
      p_range->NSUInteger location = -[TSWPFilteredString charRangeMappedFromStorage:](v15->_filteredString, "charRangeMappedFromStorage:", p_range->location, v15->_range.length);
      v15->_range.NSUInteger length = v19;
    }
    else
    {
      v15->_searchedString = (NSString *)[a6 string];
    }
  }
  return v15;
}

uint64_t __60__TSWPSearch_initWithString_options_hitBlock_storage_range___block_invoke(uint64_t a1, uint64_t a2, NSUInteger a3, NSUInteger a4)
{
  objc_opt_class();
  uint64_t result = TSUDynamicCast();
  if (result)
  {
    v8 = *(void **)(a1 + 32);
    v11.NSUInteger location = a3;
    v11.NSUInteger length = a4;
    NSRange v9 = NSIntersectionRange(*(NSRange *)(a1 + 40), v11);
    return objc_msgSend(v8, "addRange:", v9.location, v9.length);
  }
  return result;
}

uint64_t __60__TSWPSearch_initWithString_options_hitBlock_storage_range___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "addRange:", a4, 1);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSWPSearch;
  [(TSKSearch *)&v3 dealloc];
}

- (BOOL)isComplete
{
  [(TSWPSearch *)self range];
  return v2 == 0;
}

- (void)foundHitWithRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  if ([(TSWPSearch *)self filteredString])
  {
    NSUInteger location = -[TSWPFilteredString charRangeMappedToStorage:]([(TSWPSearch *)self filteredString], "charRangeMappedToStorage:", location, length);
    NSUInteger length = v6;
  }
  v7 = [(TSKSearch *)self hitBlock];
  v8 = +[TSWPSearchReference searchReferenceWithStorage:range:](TSWPSearchReference, "searchReferenceWithStorage:range:", [(TSWPSearch *)self storage], location, length);
  NSRange v9 = (void (*)(void *, TSWPSearchReference *))v7[2];

  v9(v7, v8);
}

- (_NSRange)range
{
  p_range = &self->_range;
  NSUInteger location = self->_range.location;
  NSUInteger length = p_range->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  self->_range = a3;
}

- (NSString)searchedString
{
  return self->_searchedString;
}

- (TSWPFilteredString)filteredString
{
  return self->_filteredString;
}

- (TSWPStorage)storage
{
  return self->_storage;
}

@end
@interface TSWPFilteredStorage
- (BOOL)adjustRangesByDelta:(int64_t)a3;
- (BOOL)hasColumnBreakAtCharIndex:(unint64_t)a3;
- (BOOL)hasColumnStyleForParagraphBreakAtCharIndex:(unint64_t)a3;
- (BOOL)hasSmartFieldsInRange:(_NSRange)a3;
- (BOOL)isWritingDirectionRightToLeftForParagraphAtCharIndex:(unint64_t)a3;
- (TSWPFilteredStorage)initWithStorage:(id)a3 subRange:(_NSRange)a4;
- (TSWPFilteredStorage)initWithStorage:(id)a3 subRange:(_NSRange)a4 removeRanges:(id)a5;
- (_NSRange)charRangeMappedFromStorage:(_NSRange)a3;
- (_NSRange)charRangeMappedToStorage:(_NSRange)a3;
- (_NSRange)rangeForSelectionAtCharIndex:(unint64_t)a3 caretIndex:(unint64_t)a4;
- (_NSRange)scanBackwardForWordAtCharIndex:(unint64_t)a3;
- (_NSRange)whiteSpaceRangeAtCharIndex:(unint64_t)a3 includingBreaks:(BOOL)a4;
- (_NSRange)wordAtCharIndex:(unint64_t)a3 includePreviousWord:(BOOL)a4;
- (__CFDictionary)createFilteredCoreTextAttributes:(__CFDictionary *)a3 effectiveRange:(_NSRange *)a4 filterDelegate:(id)a5;
- (double)filteredCoreTextAttributesFontScaleEffectiveRange:(_NSRange *)a3 filterDelegate:(id)a4;
- (id)attachmentAtCharIndex:(unint64_t)a3;
- (id)attachmentOrFootnoteAtCharIndex:(unint64_t)a3;
- (id)characterStyleAtCharIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4;
- (id)footnoteReferenceAtCharIndex:(unint64_t)a3;
- (id)objectAtLocationPriorToMappedCharIndex:(unint64_t)a3 forAttributeKind:(unsigned int)a4 effectiveRange:(_NSRange *)a5;
- (id)paragraphStyleAtCharIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4;
- (id)smartFieldAtCharIndex:(unint64_t)a3 attributeKind:(unsigned int)a4 effectiveRange:(_NSRange *)a5;
- (id)smartFieldsWithAttributeKind:(unsigned int)a3 intersectingRange:(_NSRange)a4;
- (id)string;
- (id)substringWithRange:(_NSRange)a3;
- (int64_t)hyphenationLocationBeforeIndex:(int64_t)a3 inRange:(_NSRange)a4 locale:(__CFLocale *)a5 hyphenChar:(unsigned int *)a6;
- (unint64_t)charIndexMappedFromStorage:(unint64_t)a3;
- (unint64_t)charIndexMappedToStorage:(unint64_t)a3;
- (unint64_t)charIndexRemappedFromStorage:(unint64_t)a3;
- (unint64_t)length;
- (unint64_t)nextCharacterIndex:(unint64_t)a3;
- (unint64_t)previousCharacterIndex:(unint64_t)a3;
- (unint64_t)storageLength;
- (unsigned)characterAtIndex:(unint64_t)a3;
- (void)attributesAtCharIndex:(unint64_t)a3 attributesOfInterest:(BOOL)a4[19] attributesTable:(id)a5[19] effectiveRange:(_NSRange *)a6;
- (void)dealloc;
- (void)enumerateSmartFieldsWithAttributeKind:(unsigned int)a3 inRange:(_NSRange)a4 usingBlock:(id)a5;
- (void)enumerateWithAttributeKind:(unsigned int)a3 inRange:(_NSRange)a4 usingBlock:(id)a5;
- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4;
@end

@implementation TSWPFilteredStorage

- (TSWPFilteredStorage)initWithStorage:(id)a3 subRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v8 = objc_msgSend(a3, "hiddenRangesInRange:", a4.location, a4.length);

  return -[TSWPFilteredStorage initWithStorage:subRange:removeRanges:](self, "initWithStorage:subRange:removeRanges:", a3, location, length, v8);
}

- (TSWPFilteredStorage)initWithStorage:(id)a3 subRange:(_NSRange)a4 removeRanges:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v14.receiver = self;
  v14.super_class = (Class)TSWPFilteredStorage;
  v9 = [(TSWPFilteredStorage *)&v14 init];
  v10 = v9;
  if (v9)
  {
    v9->_storage = (TSWPStorage *)a3;
    v11 = -[TSWPDeletionRangeMap initWithSubRange:removeRanges:]([TSWPDeletionRangeMap alloc], "initWithSubRange:removeRanges:", location, length, a5);
    v10->_rangeMap = v11;
    -[TSWPDeletionRangeMap mappedCharRange:](v11, "mappedCharRange:", location, length);
    v10->_NSUInteger length = v12;
    v10->_storageLength = [a3 length];
  }
  return v10;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSWPFilteredStorage;
  [(TSWPFilteredStorage *)&v3 dealloc];
}

- (unint64_t)length
{
  return self->_length;
}

- (id)string
{
  objc_super v3 = (void *)[MEMORY[0x263F089D8] string];
  uint64_t v4 = -[TSWPDeletionRangeMap unmappedCharRange:](self->_rangeMap, "unmappedCharRange:", 0, self->_length);
  id v6 = -[TSWPDeletionRangeMap inverseRangesInStorageRange:](self->_rangeMap, "inverseRangesInStorageRange:", v4, v5);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __29__TSWPFilteredStorage_string__block_invoke;
  v8[3] = &unk_2646B2B10;
  v8[4] = v3;
  v8[5] = self;
  [v6 enumerateRangesUsingBlock:v8];
  return v3;
}

uint64_t __29__TSWPFilteredStorage_string__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_super v3 = *(void **)(a1 + 32);
  uint64_t v4 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 8), "substringWithRange:", a2, a3);

  return [v3 appendString:v4];
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  storage = self->_storage;
  unint64_t v4 = [(TSWPDeletionRangeMap *)self->_rangeMap unmappedCharIndex:a3];

  return [(TSWPStorage *)storage characterAtIndex:v4];
}

- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v8 = -[TSWPDeletionRangeMap unmappedCharRange:](self->_rangeMap, "unmappedCharRange:", a4.location, a4.length);
  uint64_t v10 = v9;
  id v11 = -[TSWPDeletionRangeMap inverseRangesInStorageRange:](self->_rangeMap, "inverseRangesInStorageRange:", v8, v9);
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  int v14 = 0;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __43__TSWPFilteredStorage_getCharacters_range___block_invoke;
  v12[3] = &unk_2646B2B38;
  v12[6] = v8;
  v12[7] = v10;
  v12[8] = location;
  v12[9] = length;
  v12[4] = self;
  v12[5] = v13;
  v12[10] = a3;
  [v11 enumerateRangesUsingBlock:v12];
  _Block_object_dispose(v13, 8);
}

uint64_t __43__TSWPFilteredStorage_getCharacters_range___block_invoke(uint64_t result, unint64_t a2, uint64_t a3)
{
  uint64_t v5 = (void *)result;
  unint64_t v6 = *(void *)(result + 48);
  if (v6 > a2 || *(void *)(result + 56) + v6 < a2 + a3)
  {
    v7 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"-[TSWPFilteredStorage getCharacters:range:]_block_invoke"];
    result = objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPFilteredStorage.mm"), 107, @"Bogus visible range");
  }
  uint64_t v9 = *(unsigned int *)(*(void *)(v5[5] + 8) + 24);
  unint64_t v10 = a3 + v9;
  unint64_t v11 = v5[9];
  if (a3 + v9 > v11)
  {
    unint64_t v12 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v13 = [NSString stringWithUTF8String:"-[TSWPFilteredStorage getCharacters:range:]_block_invoke"];
    result = objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPFilteredStorage.mm"), 108, @"Not enough room in text buffer");
    uint64_t v9 = *(unsigned int *)(*(void *)(v5[5] + 8) + 24);
    unint64_t v11 = v5[9];
    unint64_t v10 = a3 + v9;
  }
  if (v10 <= v11)
  {
    result = objc_msgSend(*(id *)(v5[4] + 8), "getCharacters:range:", v5[10] + 2 * v9, a2, a3);
    *(_DWORD *)(*(void *)(v5[5] + 8) + 24) += a3;
  }
  return result;
}

- (BOOL)hasColumnBreakAtCharIndex:(unint64_t)a3
{
  storage = self->_storage;
  unint64_t v4 = [(TSWPDeletionRangeMap *)self->_rangeMap unmappedCharIndex:a3];

  return [(TSWPStorage *)storage hasColumnBreakAtCharIndex:v4];
}

- (BOOL)hasColumnStyleForParagraphBreakAtCharIndex:(unint64_t)a3
{
  storage = self->_storage;
  unint64_t v4 = [(TSWPDeletionRangeMap *)self->_rangeMap unmappedCharIndex:a3];

  return [(TSWPStorage *)storage hasColumnStyleForParagraphBreakAtCharIndex:v4];
}

- (void)attributesAtCharIndex:(unint64_t)a3 attributesOfInterest:(BOOL)a4[19] attributesTable:(id)a5[19] effectiveRange:(_NSRange *)a6
{
  long long v9 = xmmword_223837AD0;
  [(TSWPStorage *)self->_storage attributesAtCharIndex:[(TSWPDeletionRangeMap *)self->_rangeMap unmappedCharIndex:a3] attributesOfInterest:a4 attributesTable:a5 effectiveRange:&v9];
  if (a6)
  {
    a6->NSUInteger location = [(TSWPDeletionRangeMap *)self->_rangeMap mappedCharRange:v9];
    a6->NSUInteger length = v8;
  }
}

- (id)smartFieldAtCharIndex:(unint64_t)a3 attributeKind:(unsigned int)a4 effectiveRange:(_NSRange *)a5
{
  long long v11 = xmmword_223837AD0;
  id v7 = [(TSWPStorage *)self->_storage smartFieldAtCharIndex:[(TSWPDeletionRangeMap *)self->_rangeMap unmappedCharIndex:a3] attributeKind:*(void *)&a4 effectiveRange:&v11];
  NSUInteger v8 = v7;
  if (a5 && v7)
  {
    a5->NSUInteger location = [(TSWPDeletionRangeMap *)self->_rangeMap mappedCharRange:v11];
    a5->NSUInteger length = v9;
  }
  return v8;
}

- (id)smartFieldsWithAttributeKind:(unsigned int)a3 intersectingRange:(_NSRange)a4
{
  uint64_t v4 = *(void *)&a3;
  storage = self->_storage;
  uint64_t v7 = -[TSWPDeletionRangeMap unmappedCharRange:](self->_rangeMap, "unmappedCharRange:", a4.location, a4.length);

  return -[TSWPStorage smartFieldsWithAttributeKind:intersectingRange:](storage, "smartFieldsWithAttributeKind:intersectingRange:", v4, v7, v6);
}

- (id)footnoteReferenceAtCharIndex:(unint64_t)a3
{
  storage = self->_storage;
  unint64_t v4 = [(TSWPDeletionRangeMap *)self->_rangeMap unmappedCharIndex:a3];

  return [(TSWPStorage *)storage footnoteReferenceAtCharIndex:v4];
}

- (id)attachmentAtCharIndex:(unint64_t)a3
{
  storage = self->_storage;
  unint64_t v4 = [(TSWPDeletionRangeMap *)self->_rangeMap unmappedCharIndex:a3];

  return [(TSWPStorage *)storage attachmentAtCharIndex:v4];
}

- (id)attachmentOrFootnoteAtCharIndex:(unint64_t)a3
{
  storage = self->_storage;
  unint64_t v4 = [(TSWPDeletionRangeMap *)self->_rangeMap unmappedCharIndex:a3];

  return [(TSWPStorage *)storage attachmentOrFootnoteAtCharIndex:v4];
}

- (id)characterStyleAtCharIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  long long v12 = xmmword_223837AD0;
  storage = self->_storage;
  unint64_t v7 = [(TSWPDeletionRangeMap *)self->_rangeMap unmappedCharIndex:a3];
  if (a4) {
    NSUInteger v8 = &v12;
  }
  else {
    NSUInteger v8 = 0;
  }
  id v9 = [(TSWPStorage *)storage characterStyleAtCharIndex:v7 effectiveRange:v8];
  if (a4)
  {
    a4->NSUInteger location = [(TSWPDeletionRangeMap *)self->_rangeMap mappedCharRange:v12];
    a4->NSUInteger length = v10;
  }
  return v9;
}

- (_NSRange)wordAtCharIndex:(unint64_t)a3 includePreviousWord:(BOOL)a4
{
  BOOL v4 = a4;
  unint64_t v7 = (NSUInteger *)MEMORY[0x263F7C7C8];
  uint64_t v9 = *MEMORY[0x263F7C7C8];
  NSUInteger v8 = *(void *)(MEMORY[0x263F7C7C8] + 8);
  unint64_t v10 = -[TSWPDeletionRangeMap unmappedCharIndex:](self->_rangeMap, "unmappedCharIndex:");
  NSUInteger v11 = [(TSWPDeletionRangeMap *)self->_rangeMap unmappedCharIndex:0];
  unint64_t v12 = [(TSWPDeletionRangeMap *)self->_rangeMap unmappedCharIndex:[(TSWPFilteredStorage *)self length]];
  NSUInteger v13 = v12;
  if (v10) {
    BOOL v14 = v10 == v12;
  }
  else {
    BOOL v14 = 0;
  }
  uint64_t v15 = v14;
  v16.NSUInteger location = [(TSWPStorage *)self->_storage textRangeForParagraphAtCharIndex:v10 - v15];
  NSUInteger location = v16.location;
  if (v16.length)
  {
    if (v11 <= v13) {
      NSUInteger v18 = v13;
    }
    else {
      NSUInteger v18 = v11;
    }
    if (v11 >= v13) {
      v19.NSUInteger location = v13;
    }
    else {
      v19.NSUInteger location = v11;
    }
    v19.NSUInteger length = v18 - v19.location;
    NSRange v21 = NSIntersectionRange(v16, v19);
    NSUInteger length = v21.length;
    NSUInteger location = 0x7FFFFFFFFFFFFFFFLL;
    if (v21.length) {
      NSUInteger location = v21.location;
    }
  }
  else if (v16.location <= v13)
  {
    NSUInteger length = 0;
  }
  else
  {
    v22 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v23 = [NSString stringWithUTF8String:"-[TSWPFilteredStorage wordAtCharIndex:includePreviousWord:]"];
    objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPFilteredStorage.mm"), 224, @"unexpected paragraph range past the end of mapped storage");
    NSUInteger location = *v7;
    NSUInteger length = v7[1];
  }
  if (location != *v7 || length != v7[1])
  {
    uint64_t v25 = -[TSWPDeletionRangeMap mappedCharRange:](self->_rangeMap, "mappedCharRange:", location, length);
    uint64_t v27 = objc_msgSend(-[TSWPFilteredStorage substringWithRange:](self, "substringWithRange:", v25, v26), "rangeOfWordAtCharacterIndex:range:includePreviousWord:", a3 - v25, 0, v26, v4);
    NSUInteger v8 = v28;
    if (v27 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      uint64_t v9 = v27 + v25;
    }
  }
  NSUInteger v29 = v9;
  NSUInteger v30 = v8;
  result.NSUInteger length = v30;
  result.NSUInteger location = v29;
  return result;
}

- (int64_t)hyphenationLocationBeforeIndex:(int64_t)a3 inRange:(_NSRange)a4 locale:(__CFLocale *)a5 hyphenChar:(unsigned int *)a6
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  CFIndex v11 = [(TSWPDeletionRangeMap *)self->_rangeMap unmappedCharIndex:a3];
  CFIndex v12 = -[TSWPDeletionRangeMap unmappedCharRange:](self->_rangeMap, "unmappedCharRange:", location, length);
  CFIndex v14 = v13;
  CFStringRef v15 = [(TSWPStorage *)self->_storage string];
  v20.NSUInteger location = v12;
  v20.NSUInteger length = v14;
  int64_t result = CFStringGetHyphenationLocationBeforeIndex(v15, v11, v20, 0, a5, a6);
  if (result != -1)
  {
    int64_t v17 = result;
    rangeMap = self->_rangeMap;
    return [(TSWPDeletionRangeMap *)rangeMap mappedCharIndex:v17];
  }
  return result;
}

- (id)objectAtLocationPriorToMappedCharIndex:(unint64_t)a3 forAttributeKind:(unsigned int)a4 effectiveRange:(_NSRange *)a5
{
  id v7 = [(TSWPStorage *)self->_storage objectAtLocationPriorToMappedCharIndex:[(TSWPDeletionRangeMap *)self->_rangeMap unmappedCharIndex:a3] forAttributeKind:*(void *)&a4 effectiveRange:a5];
  if (a5)
  {
    a5->NSUInteger location = -[TSWPDeletionRangeMap mappedCharRange:](self->_rangeMap, "mappedCharRange:", a5->location, a5->length);
    a5->NSUInteger length = v8;
  }
  return v7;
}

- (double)filteredCoreTextAttributesFontScaleEffectiveRange:(_NSRange *)a3 filterDelegate:(id)a4
{
  if (a3)
  {
    a3->NSUInteger location = -[TSWPDeletionRangeMap unmappedCharRange:](self->_rangeMap, "unmappedCharRange:", a3->location, a3->length);
    a3->NSUInteger length = v7;
    [(TSWPStorage *)self->_storage filteredCoreTextAttributesFontScaleEffectiveRange:a3 filterDelegate:a4];
    double v9 = v8;
    a3->NSUInteger location = -[TSWPDeletionRangeMap mappedCharRange:](self->_rangeMap, "mappedCharRange:", a3->location, a3->length);
    a3->NSUInteger length = v10;
    return v9;
  }
  else
  {
    storage = self->_storage;
    -[TSWPStorage filteredCoreTextAttributesFontScaleEffectiveRange:filterDelegate:](storage, "filteredCoreTextAttributesFontScaleEffectiveRange:filterDelegate:");
  }
  return result;
}

- (__CFDictionary)createFilteredCoreTextAttributes:(__CFDictionary *)a3 effectiveRange:(_NSRange *)a4 filterDelegate:(id)a5
{
  if (a4)
  {
    a4->NSUInteger location = -[TSWPDeletionRangeMap unmappedCharRange:](self->_rangeMap, "unmappedCharRange:", a4->location, a4->length);
    a4->NSUInteger length = v9;
    NSUInteger v10 = [(TSWPStorage *)self->_storage createFilteredCoreTextAttributes:a3 effectiveRange:a4 filterDelegate:a5];
    a4->NSUInteger location = -[TSWPDeletionRangeMap mappedCharRange:](self->_rangeMap, "mappedCharRange:", a4->location, a4->length);
    a4->NSUInteger length = v11;
    return v10;
  }
  else
  {
    storage = self->_storage;
    return -[TSWPStorage createFilteredCoreTextAttributes:effectiveRange:filterDelegate:](storage, "createFilteredCoreTextAttributes:effectiveRange:filterDelegate:");
  }
}

- (unint64_t)charIndexMappedToStorage:(unint64_t)a3
{
  return [(TSWPDeletionRangeMap *)self->_rangeMap unmappedCharIndex:a3];
}

- (unint64_t)charIndexMappedFromStorage:(unint64_t)a3
{
  return [(TSWPDeletionRangeMap *)self->_rangeMap mappedCharIndex:a3];
}

- (_NSRange)charRangeMappedToStorage:(_NSRange)a3
{
  NSUInteger v3 = -[TSWPDeletionRangeMap unmappedCharRange:](self->_rangeMap, "unmappedCharRange:", a3.location, a3.length);
  result.NSUInteger length = v4;
  result.NSUInteger location = v3;
  return result;
}

- (_NSRange)charRangeMappedFromStorage:(_NSRange)a3
{
  NSUInteger v3 = -[TSWPDeletionRangeMap mappedCharRange:](self->_rangeMap, "mappedCharRange:", a3.location, a3.length);
  result.NSUInteger length = v4;
  result.NSUInteger location = v3;
  return result;
}

- (unint64_t)charIndexRemappedFromStorage:(unint64_t)a3
{
  unint64_t v4 = [(TSWPFilteredStorage *)self charIndexMappedFromStorage:a3];

  return [(TSWPFilteredStorage *)self charIndexMappedToStorage:v4];
}

- (id)paragraphStyleAtCharIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  id v6 = [(TSWPStorage *)self->_storage paragraphStyleAtCharIndex:[(TSWPDeletionRangeMap *)self->_rangeMap unmappedCharIndex:a3] effectiveRange:a4];
  if (a4)
  {
    a4->NSUInteger location = -[TSWPDeletionRangeMap mappedCharRange:](self->_rangeMap, "mappedCharRange:", a4->location, a4->length);
    a4->NSUInteger length = v7;
  }
  return v6;
}

- (BOOL)isWritingDirectionRightToLeftForParagraphAtCharIndex:(unint64_t)a3
{
  storage = self->_storage;
  unint64_t v4 = [(TSWPDeletionRangeMap *)self->_rangeMap unmappedCharIndex:a3];

  return [(TSWPStorage *)storage isWritingDirectionRightToLeftForParagraphAtCharIndex:v4];
}

- (BOOL)adjustRangesByDelta:(int64_t)a3
{
  unint64_t v5 = [(TSWPStorage *)self->_storage storageLength];
  if (a3 && self->_storageLength != v5)
  {
    self->_storageLength = v5;
    [(TSWPDeletionRangeMap *)self->_rangeMap adjustByDelta:a3];
  }
  return 1;
}

- (id)substringWithRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v7 = -[TSWPDeletionRangeMap unmappedCharRange:](self->_rangeMap, "unmappedCharRange:");
  uint64_t v8 = v6;
  if (v6 == length)
  {
    storage = self->_storage;
    return -[TSWPStorage substringWithRange:](storage, "substringWithRange:", v7, v6);
  }
  else
  {
    NSUInteger v11 = (void *)[MEMORY[0x263F089D8] stringWithCapacity:length];
    id v12 = -[TSWPDeletionRangeMap inverseRangesInStorageRange:](self->_rangeMap, "inverseRangesInStorageRange:", v7, v8);
    v14[0] = 0;
    v14[1] = v14;
    v14[2] = 0x2020000000;
    int v15 = 0;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __42__TSWPFilteredStorage_substringWithRange___block_invoke;
    void v13[3] = &unk_2646B2B60;
    v13[6] = v14;
    v13[7] = v7;
    v13[8] = v8;
    v13[9] = location;
    v13[10] = length;
    v13[4] = v11;
    v13[5] = self;
    [v12 enumerateRangesUsingBlock:v13];
    _Block_object_dispose(v14, 8);
    return v11;
  }
}

uint64_t __42__TSWPFilteredStorage_substringWithRange___block_invoke(uint64_t result, unint64_t a2, uint64_t a3)
{
  uint64_t v5 = result;
  unint64_t v6 = *(void *)(result + 56);
  if (v6 > a2 || *(void *)(result + 64) + v6 < a2 + a3)
  {
    uint64_t v7 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"-[TSWPFilteredStorage substringWithRange:]_block_invoke"];
    _NSRange result = objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPFilteredStorage.mm"), 392, @"Bogus visible range");
  }
  unint64_t v9 = a3 + *(unsigned int *)(*(void *)(*(void *)(v5 + 48) + 8) + 24);
  unint64_t v10 = *(void *)(v5 + 80);
  if (v9 > v10)
  {
    NSUInteger v11 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v12 = [NSString stringWithUTF8String:"-[TSWPFilteredStorage substringWithRange:]_block_invoke"];
    _NSRange result = objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPFilteredStorage.mm"), 393, @"Not enough room in text buffer");
    unint64_t v10 = *(void *)(v5 + 80);
    unint64_t v9 = a3 + *(unsigned int *)(*(void *)(*(void *)(v5 + 48) + 8) + 24);
  }
  if (v9 <= v10)
  {
    _NSRange result = objc_msgSend(*(id *)(v5 + 32), "appendString:", objc_msgSend(*(id *)(*(void *)(v5 + 40) + 8), "substringWithRange:", a2, a3));
    *(_DWORD *)(*(void *)(*(void *)(v5 + 48) + 8) + 24) += a3;
  }
  return result;
}

- (void)enumerateWithAttributeKind:(unsigned int)a3 inRange:(_NSRange)a4 usingBlock:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  uint64_t v8 = -[TSWPDeletionRangeMap unmappedCharRange:](self->_rangeMap, "unmappedCharRange:", a4.location, a4.length);
  storage = self->_storage;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __69__TSWPFilteredStorage_enumerateWithAttributeKind_inRange_usingBlock___block_invoke;
  v11[3] = &unk_2646B2B88;
  v11[4] = self;
  v11[5] = a5;
  -[TSWPStorage enumerateWithAttributeKind:inRange:usingBlock:](storage, "enumerateWithAttributeKind:inRange:usingBlock:", v6, v8, v10, v11);
}

uint64_t __69__TSWPFilteredStorage_enumerateWithAttributeKind_inRange_usingBlock___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "charRangeMappedFromStorage:");
  if (v3)
  {
    unint64_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v4();
  }
  return result;
}

- (void)enumerateSmartFieldsWithAttributeKind:(unsigned int)a3 inRange:(_NSRange)a4 usingBlock:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  uint64_t v8 = -[TSWPDeletionRangeMap unmappedCharRange:](self->_rangeMap, "unmappedCharRange:", a4.location, a4.length);
  storage = self->_storage;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __80__TSWPFilteredStorage_enumerateSmartFieldsWithAttributeKind_inRange_usingBlock___block_invoke;
  v11[3] = &unk_2646B2B88;
  v11[4] = self;
  v11[5] = a5;
  -[TSWPStorage enumerateSmartFieldsWithAttributeKind:inRange:usingBlock:](storage, "enumerateSmartFieldsWithAttributeKind:inRange:usingBlock:", v6, v8, v10, v11);
}

uint64_t __80__TSWPFilteredStorage_enumerateSmartFieldsWithAttributeKind_inRange_usingBlock___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "charRangeMappedFromStorage:");
  if (v3)
  {
    unint64_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v4();
  }
  return result;
}

- (BOOL)hasSmartFieldsInRange:(_NSRange)a3
{
  uint64_t v3 = self;
  uint64_t v10 = 0;
  NSUInteger v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  rangeMap = self->_rangeMap;
  uint64_t v5 = -[TSWPDeletionRangeMap unmappedCharRange:](rangeMap, "unmappedCharRange:", a3.location, a3.length);
  id v7 = -[TSWPDeletionRangeMap inverseRangesInStorageRange:](rangeMap, "inverseRangesInStorageRange:", v5, v6);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __45__TSWPFilteredStorage_hasSmartFieldsInRange___block_invoke;
  v9[3] = &unk_2646B2BB0;
  v9[4] = v3;
  v9[5] = &v10;
  [v7 enumerateRangesUsingBlock:v9];
  LOBYTE(v3) = *((unsigned char *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return (char)v3;
}

uint64_t __45__TSWPFilteredStorage_hasSmartFieldsInRange___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  uint64_t result = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "hasSmartFieldsInRange:", a2, a3);
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a5 = 1;
  }
  return result;
}

- (unint64_t)storageLength
{
  return self->_storageLength;
}

- (_NSRange)scanBackwardForWordAtCharIndex:(unint64_t)a3
{
  unint64_t v5 = a3;
  if (self->_length > a3)
  {
    unint64_t v5 = a3;
    if (IsWhitespaceCharacter([(TSWPFilteredStorage *)self characterAtIndex:a3]))
    {
      uint64_t v6 = [(TSWPFilteredStorage *)self whiteSpaceRangeAtCharIndex:a3 includingBreaks:1];
      if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
        unint64_t v5 = a3;
      }
      else {
        unint64_t v5 = v6;
      }
    }
  }
  NSUInteger v7 = [(TSWPFilteredStorage *)self wordAtCharIndex:a3 includePreviousWord:1];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL) {
    NSUInteger v7 = v5;
  }
  NSUInteger v8 = a3 - v7;
  result.NSUInteger length = v8;
  result.NSUInteger location = v7;
  return result;
}

- (unint64_t)previousCharacterIndex:(unint64_t)a3
{
  unint64_t v4 = [(TSWPDeletionRangeMap *)self->_rangeMap unmappedCharIndex:a3];
  do
    unint64_t v4 = [(TSWPStorage *)self->_storage previousCharacterIndex:v4];
  while ([(TSWPDeletionRangeMap *)self->_rangeMap containsCharIndex:v4]
       && [(TSWPDeletionRangeMap *)self->_rangeMap mappedCharIndex:v4]);
  rangeMap = self->_rangeMap;

  return [(TSWPDeletionRangeMap *)rangeMap mappedCharIndex:v4];
}

- (unint64_t)nextCharacterIndex:(unint64_t)a3
{
  unint64_t v4 = [(TSWPDeletionRangeMap *)self->_rangeMap unmappedCharIndex:a3];
  do
    unint64_t v4 = [(TSWPStorage *)self->_storage nextCharacterIndex:v4];
  while ([(TSWPDeletionRangeMap *)self->_rangeMap containsCharIndex:v4]
       && [(TSWPDeletionRangeMap *)self->_rangeMap mappedCharIndex:v4] < self->_length);
  rangeMap = self->_rangeMap;

  return [(TSWPDeletionRangeMap *)rangeMap mappedCharIndex:v4];
}

- (_NSRange)whiteSpaceRangeAtCharIndex:(unint64_t)a3 includingBreaks:(BOOL)a4
{
  unint64_t v5 = a3;
  unint64_t length = self->_length;
  if ([(TSWPFilteredStorage *)self length] > a3
    && IsWhitespaceCharacter([(TSWPFilteredStorage *)self characterAtIndex:v5]))
  {
    if (v5)
    {
      uint64_t v8 = v5;
      do
      {
        uint64_t v9 = v8 - 1;
        uint64_t v10 = [(TSWPFilteredStorage *)self characterAtIndex:v8 - 1];
        if (!IsWhitespaceCharacter(v10)) {
          break;
        }
        if (!a4)
        {
          char v11 = IsParagraphBreakingCharacter(v10);
          if v10 == 8232 || (v11) {
            break;
          }
        }
        --v8;
      }
      while (v9);
    }
    else
    {
      uint64_t v8 = 0;
    }
    if (length > v5)
    {
      while (1)
      {
        uint64_t v13 = [(TSWPFilteredStorage *)self characterAtIndex:v5];
        if (!IsWhitespaceCharacter(v13)) {
          break;
        }
        if (!a4)
        {
          char v14 = IsParagraphBreakingCharacter(v13);
          if v13 == 8232 || (v14) {
            break;
          }
        }
        if (length == ++v5)
        {
          unint64_t v5 = length;
          break;
        }
      }
    }
    NSUInteger v12 = v5 - v8;
  }
  else
  {
    NSUInteger v12 = 0;
    uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  }
  NSUInteger v15 = v8;
  result.unint64_t length = v12;
  result.NSUInteger location = v15;
  return result;
}

- (_NSRange)rangeForSelectionAtCharIndex:(unint64_t)a3 caretIndex:(unint64_t)a4
{
  unint64_t v5 = a3;
  if (a3 != a4 && [(TSWPFilteredStorage *)self previousCharacterIndex:a4] != a3)
  {
    NSUInteger v7 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"-[TSWPFilteredStorage rangeForSelectionAtCharIndex:caretIndex:]"];
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPFilteredStorage.mm"), 547, @"Precondition: caretIndex is either equal to the given charIndex or one past");
  }
  unint64_t length = self->_length;
  if (length - 1 < v5)
  {
    uint64_t v10 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v11 = [NSString stringWithUTF8String:"-[TSWPFilteredStorage rangeForSelectionAtCharIndex:caretIndex:]"];
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPFilteredStorage.mm"), 557, @"Character index should be inside allowable selection range.");
  }
  if (length <= v5) {
    uint64_t v12 = 0;
  }
  else {
    uint64_t v12 = [(TSWPFilteredStorage *)self characterAtIndex:v5];
  }
  if (!IsSpecialCharacter(v12))
  {
    uint64_t v14 = 0;
    goto LABEL_16;
  }
  id v13 = [(TSWPFilteredStorage *)self attachmentOrFootnoteAtCharIndex:v5];
  uint64_t v14 = (uint64_t)v13;
  if (!v13)
  {
LABEL_16:
    uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_20;
  }
  if ([v13 isDrawable] && objc_msgSend((id)v14, "isAnchored"))
  {
    if (length <= a4) {
      uint64_t v12 = 0;
    }
    else {
      uint64_t v12 = [(TSWPFilteredStorage *)self characterAtIndex:a4];
    }
    uint64_t v14 = 0;
    uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
    unint64_t v5 = a4;
  }
  else
  {
    uint64_t v14 = 1;
    uint64_t v15 = v5;
  }
LABEL_20:
  if (IsSpecialCharacter(v12)) {
    goto LABEL_42;
  }
  if (IsWhitespaceCharacter(v12))
  {
    if (v5 == a4 && v5)
    {
      unint64_t v16 = a4 - 1;
    }
    else
    {
      if (length <= a4) {
        unint64_t v17 = v5;
      }
      else {
        unint64_t v17 = a4;
      }
      if (v5 + 1 == a4) {
        unint64_t v16 = v17;
      }
      else {
        unint64_t v16 = v5;
      }
    }
    uint64_t v18 = [(TSWPFilteredStorage *)self characterAtIndex:v16];
    int v19 = v18;
    if ((IsWhitespaceCharacter(v18) & 1) == 0 && !IsSpecialCharacter(v19)) {
      goto LABEL_35;
    }
    uint64_t v15 = [(TSWPFilteredStorage *)self whiteSpaceRangeAtCharIndex:v5 includingBreaks:0];
    uint64_t v14 = v20;
  }
  unint64_t v16 = v5;
LABEL_35:
  if (v15 == 0x7FFFFFFFFFFFFFFFLL || !v14)
  {
    uint64_t v21 = [(TSWPFilteredStorage *)self wordAtCharIndex:v16 includePreviousWord:0];
    uint64_t v14 = v22;
    if (v21 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v16 >= length)
      {
        uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else
      {
        uint64_t v15 = objc_msgSend(-[TSWPFilteredStorage string](self, "string"), "rangeOfComposedCharacterSequenceAtIndex:", v16);
        uint64_t v14 = v23;
      }
    }
    else
    {
      uint64_t v15 = v21;
    }
  }
LABEL_42:
  NSUInteger v24 = v15;
  NSUInteger v25 = v14;
  result.unint64_t length = v25;
  result.NSUInteger location = v24;
  return result;
}

@end
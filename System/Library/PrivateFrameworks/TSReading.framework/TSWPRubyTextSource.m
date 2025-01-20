@interface TSWPRubyTextSource
- (BOOL)adjustRangesByDelta:(int64_t)a3;
- (BOOL)hasColumnBreakAtCharIndex:(unint64_t)a3;
- (BOOL)hasColumnStyleForParagraphBreakAtCharIndex:(unint64_t)a3;
- (BOOL)isWritingDirectionRightToLeftForParagraphAtCharIndex:(unint64_t)a3;
- (TSWPRubyTextSource)initWithSource:(id)a3 subRange:(_NSRange)a4;
- (_NSRange)charRangeMappedFromStorage:(_NSRange)a3;
- (_NSRange)charRangeMappedToStorage:(_NSRange)a3;
- (_NSRange)wordAtCharIndex:(unint64_t)a3 includePreviousWord:(BOOL)a4;
- (__CFDictionary)createFilteredCoreTextAttributes:(__CFDictionary *)a3 effectiveRange:(_NSRange *)a4 filterDelegate:(id)a5;
- (double)filteredCoreTextAttributesFontScaleEffectiveRange:(_NSRange *)a3 filterDelegate:(id)a4;
- (id).cxx_construct;
- (id)attachmentAtCharIndex:(unint64_t)a3;
- (id)attachmentOrFootnoteAtCharIndex:(unint64_t)a3;
- (id)characterStyleAtCharIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4;
- (id)footnoteReferenceAtCharIndex:(unint64_t)a3;
- (id)objectAtLocationPriorToMappedCharIndex:(unint64_t)a3 forAttributeKind:(unsigned int)a4 effectiveRange:(_NSRange *)a5;
- (id)paragraphStyleAtCharIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4;
- (id)smartFieldAtCharIndex:(unint64_t)a3 attributeKind:(unsigned int)a4 effectiveRange:(_NSRange *)a5;
- (id)smartFieldsWithAttributeKind:(unsigned int)a3 intersectingRange:(_NSRange)a4;
- (id)string;
- (int64_t)hyphenationLocationBeforeIndex:(int64_t)a3 inRange:(_NSRange)a4 locale:(__CFLocale *)a5 hyphenChar:(unsigned int *)a6;
- (unint64_t)charIndexMappedFromStorage:(unint64_t)a3;
- (unint64_t)charIndexMappedToStorage:(unint64_t)a3;
- (unint64_t)charIndexRemappedFromStorage:(unint64_t)a3;
- (unint64_t)length;
- (unint64_t)storageLength;
- (unsigned)characterAtIndex:(unint64_t)a3;
- (unsigned)composedCharacterAtCharIndex:(unint64_t)a3 isSurrogatePair:(BOOL *)a4;
- (void)attributesAtCharIndex:(unint64_t)a3 attributesOfInterest:(BOOL)a4[19] attributesTable:(id)a5[19] effectiveRange:(_NSRange *)a6;
- (void)dealloc;
- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4;
@end

@implementation TSWPRubyTextSource

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

- (id)smartFieldsWithAttributeKind:(unsigned int)a3 intersectingRange:(_NSRange)a4
{
  uint64_t v4 = *(void *)&a3;
  source = self->_source;
  uint64_t v7 = -[TSWPRangeMap unmappedCharRange:](self->_rangeMap, "unmappedCharRange:", a4.location, a4.length);

  return (id)-[TSWPTextSource smartFieldsWithAttributeKind:intersectingRange:](source, "smartFieldsWithAttributeKind:intersectingRange:", v4, v7, v6);
}

- (BOOL)hasColumnBreakAtCharIndex:(unint64_t)a3
{
  source = self->_source;
  unint64_t v4 = [(TSWPRangeMap *)self->_rangeMap unmappedCharIndex:a3];

  return [(TSWPTextSource *)source hasColumnBreakAtCharIndex:v4];
}

- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4
{
  uint64_t v6 = -[TSWPRangeMap unmappedCharRange:](self->_rangeMap, "unmappedCharRange:", a4.location, a4.length);
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  begin = self->_spaceCharIndexes.__begin_;
  end = self->_spaceCharIndexes.__end_;
  if (end == begin)
  {
    v21 = self->_bidiCharIndexes.__begin_;
    v20 = self->_bidiCharIndexes.__end_;
    if (v20 == v21)
    {
      unint64_t v13 = v6;
    }
    else
    {
      unint64_t v22 = v6;
      do
      {
        unint64_t v23 = *v21++;
        unint64_t v13 = v23;
        BOOL v24 = v22 >= v23;
        if (v22 <= v23) {
          unint64_t v25 = v13;
        }
        else {
          unint64_t v25 = v22;
        }
        if (v24) {
          unint64_t v26 = v13;
        }
        else {
          unint64_t v26 = v22;
        }
        unint64_t v27 = v25 - v26;
        -[TSWPTextSource getCharacters:range:](self->_source, "getCharacters:range:", a3);
        v28 = &a3[v27];
        unsigned __int16 *v28 = 8207;
        a3 = v28 + 1;
        unint64_t v22 = v13;
      }
      while (v21 != v20);
    }
  }
  else
  {
    unint64_t v12 = v6;
    do
    {
      unint64_t v14 = *begin++;
      unint64_t v13 = v14;
      BOOL v15 = v12 >= v14;
      if (v12 <= v14) {
        unint64_t v16 = v13;
      }
      else {
        unint64_t v16 = v12;
      }
      if (v15) {
        unint64_t v17 = v13;
      }
      else {
        unint64_t v17 = v12;
      }
      unint64_t v18 = v16 - v17;
      -[TSWPTextSource getCharacters:range:](self->_source, "getCharacters:range:", a3);
      v19 = &a3[v18];
      unsigned __int16 *v19 = 8209;
      a3 = v19 + 1;
      unint64_t v12 = v13;
    }
    while (begin != end);
  }
  source = self->_source;
  if (v13 <= v7 + v9) {
    unint64_t v30 = v7 + v9;
  }
  else {
    unint64_t v30 = v13;
  }
  if (v13 >= v7 + v9) {
    unint64_t v31 = v7 + v9;
  }
  else {
    unint64_t v31 = v13;
  }

  -[TSWPTextSource getCharacters:range:](source, "getCharacters:range:", a3, v31, v30 - v31);
}

- (unint64_t)charIndexMappedFromStorage:(unint64_t)a3
{
  rangeMap = self->_rangeMap;
  uint64_t v4 = [(TSWPTextSource *)self->_source charIndexMappedFromStorage:a3];

  return [(TSWPRangeMap *)rangeMap mappedCharIndex:v4];
}

- (_NSRange)charRangeMappedFromStorage:(_NSRange)a3
{
  rangeMap = self->_rangeMap;
  uint64_t v5 = -[TSWPTextSource charRangeMappedFromStorage:](self->_source, "charRangeMappedFromStorage:", a3.location, a3.length);

  NSUInteger v6 = -[TSWPRangeMap mappedCharRange:](rangeMap, "mappedCharRange:", v5, v4);
  result.length = v7;
  result.location = v6;
  return result;
}

- (unint64_t)charIndexMappedToStorage:(unint64_t)a3
{
  source = self->_source;
  unint64_t v4 = [(TSWPRangeMap *)self->_rangeMap unmappedCharIndex:a3];

  return [(TSWPTextSource *)source charIndexMappedToStorage:v4];
}

- (unint64_t)charIndexRemappedFromStorage:(unint64_t)a3
{
  unint64_t v4 = [(TSWPRubyTextSource *)self charIndexMappedFromStorage:a3];

  return [(TSWPRubyTextSource *)self charIndexMappedToStorage:v4];
}

- (void).cxx_destruct
{
  begin = self->_bidiCharIndexes.__begin_;
  if (begin)
  {
    self->_bidiCharIndexes.__end_ = begin;
    operator delete(begin);
  }
  unint64_t v4 = self->_spaceCharIndexes.__begin_;
  if (v4)
  {
    self->_spaceCharIndexes.__end_ = v4;
    operator delete(v4);
  }
}

- (__CFDictionary)createFilteredCoreTextAttributes:(__CFDictionary *)a3 effectiveRange:(_NSRange *)a4 filterDelegate:(id)a5
{
  if (a4)
  {
    uint64_t v12 = -[TSWPRangeMap unmappedCharRange:](self->_rangeMap, "unmappedCharRange:", a4->location, a4->length);
    uint64_t v13 = v9;
    a3 = (__CFDictionary *)[(TSWPTextSource *)self->_source createFilteredCoreTextAttributes:a3 effectiveRange:&v12 filterDelegate:a5];
    a4->location = -[TSWPRangeMap mappedCharRange:](self->_rangeMap, "mappedCharRange:", v12, v13);
    a4->length = v10;
  }
  return a3;
}

- (void)attributesAtCharIndex:(unint64_t)a3 attributesOfInterest:(BOOL)a4[19] attributesTable:(id)a5[19] effectiveRange:(_NSRange *)a6
{
  long long v9 = xmmword_223837AD0;
  [(TSWPTextSource *)self->_source attributesAtCharIndex:[(TSWPRangeMap *)self->_rangeMap unmappedCharIndex:a3] attributesOfInterest:a4 attributesTable:a5 effectiveRange:&v9];
  if (a6)
  {
    a6->location = [(TSWPRangeMap *)self->_rangeMap mappedCharRange:v9];
    a6->length = v8;
  }
}

- (TSWPRubyTextSource)initWithSource:(id)a3 subRange:(_NSRange)a4
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  v55.receiver = self;
  v55.super_class = (Class)TSWPRubyTextSource;
  unint64_t v4 = [(TSWPRubyTextSource *)&v55 init];
  if (v4)
  {
    uint64_t v5 = (TSWPTextSource *)a3;
    v4->_source = v5;
    uint64_t v49 = MEMORY[0x263EF8330];
    uint64_t v50 = 3221225472;
    v51 = __46__TSWPRubyTextSource_initWithSource_subRange___block_invoke;
    v52 = &unk_2646B2750;
    _NSRange v54 = a4;
    v53 = v4;
    -[TSWPTextSource enumerateSmartFieldsWithAttributeKind:inRange:usingBlock:](v5, "enumerateSmartFieldsWithAttributeKind:inRange:usingBlock:", 7);
    p_end = &v4->_spaceCharIndexes.__end_;
    if (v4->_spaceCharIndexes.__begin_ == v4->_spaceCharIndexes.__end_ && a4.length >= 2)
    {
      uint64_t v66 = 0x1000000;
      *(void *)v67 = 0x10000000000;
      *(_DWORD *)&v67[7] = 0;
      uint64_t v65 = 0;
      long long v63 = 0u;
      long long v64 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      NSUInteger location = a4.location;
      NSUInteger v8 = a4.location + a4.length;
      long long v59 = 0u;
      long long v60 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      long long v56 = 0u;
      uint64_t v9 = *MEMORY[0x263F7C918];
      do
      {
        -[TSWPTextSource attributesAtCharIndex:attributesOfInterest:attributesTable:effectiveRange:](v4->_source, "attributesAtCharIndex:attributesOfInterest:attributesTable:effectiveRange:", location, &v66, &v56, &v47, p_end);
        NSUInteger v10 = (void *)*((void *)&v57 + 1);
        if (*((void *)&v57 + 1))
        {
          int v11 = [*((id *)&v57 + 1) writingDirection];
          if ([v10 containsProperty:39]) {
            [v10 objectForProperty:39];
          }
        }
        else
        {
          int v11 = -1;
        }
        objc_opt_class();
        uint64_t v12 = TSUDynamicCast();
        uint64_t v13 = (void *)v12;
        if (v11 == -1 && v12) {
          int v11 = [MEMORY[0x263EFF960] characterDirectionForLanguage:v12] == 2;
        }
        NSUInteger v14 = v48 + v47;
        if (v8 < v48 + v47) {
          NSUInteger v14 = a4.location + a4.length;
        }
        if (v47 > location) {
          NSUInteger location = v47;
        }
        NSUInteger v15 = v14 - location;
        NSUInteger v47 = location;
        NSUInteger v48 = v14 - location;
        if (v11 == 1 && v14 > location)
        {
          BOOL v16 = 0;
          do
          {
            unsigned __int8 v46 = 0;
            int v17 = [v13 isEqualToString:v9];
            unsigned int v18 = [(TSWPRubyTextSource *)v4 composedCharacterAtCharIndex:location isSurrogatePair:&v46];
            int v19 = TSWPGetBidiClass();
            int v20 = v19;
            if (v18 == 9 || v19 == 6 || !v16 && v19 == 4 || v19 == 5 && (v17 & v16 & 1) == 0)
            {
              if (v46) {
                uint64_t v21 = 2;
              }
              else {
                uint64_t v21 = 1;
              }
              NSUInteger v22 = v21 + location;
              end = v4->_bidiCharIndexes.__end_;
              value = v4->_bidiCharIndexes.__end_cap_.__value_;
              if (end >= value)
              {
                begin = v4->_bidiCharIndexes.__begin_;
                uint64_t v27 = end - begin;
                unint64_t v28 = v27 + 1;
                if ((unint64_t)(v27 + 1) >> 61) {
                  abort();
                }
                uint64_t v29 = (char *)value - (char *)begin;
                if (v29 >> 2 > v28) {
                  unint64_t v28 = v29 >> 2;
                }
                if ((unint64_t)v29 >= 0x7FFFFFFFFFFFFFF8) {
                  unint64_t v30 = 0x1FFFFFFFFFFFFFFFLL;
                }
                else {
                  unint64_t v30 = v28;
                }
                if (v30)
                {
                  unint64_t v31 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<EQKitLayoutContext *>>((uint64_t)&v4->_bidiCharIndexes.__end_cap_, v30);
                  begin = v4->_bidiCharIndexes.__begin_;
                  end = v4->_bidiCharIndexes.__end_;
                }
                else
                {
                  unint64_t v31 = 0;
                }
                v32 = (unint64_t *)&v31[8 * v27];
                unint64_t *v32 = v22;
                unint64_t v25 = v32 + 1;
                while (end != begin)
                {
                  unint64_t v33 = *--end;
                  *--v32 = v33;
                }
                v4->_bidiCharIndexes.__begin_ = v32;
                v4->_bidiCharIndexes.__end_ = v25;
                v4->_bidiCharIndexes.__end_cap_.__value_ = (unint64_t *)&v31[8 * v30];
                if (begin) {
                  operator delete(begin);
                }
              }
              else
              {
                unint64_t *end = v22;
                unint64_t v25 = end + 1;
              }
              v4->_bidiCharIndexes.__end_ = v25;
            }
            BOOL v16 = v20 == 3;
            location += v46 + 1;
            NSUInteger v15 = v48;
          }
          while (location < v48 + v47);
          NSUInteger location = v47;
        }
        location += v15;
        if (location > v8)
        {
          v34 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
          uint64_t v35 = [NSString stringWithUTF8String:"-[TSWPRubyTextSource initWithSource:subRange:]"];
          objc_msgSend(v34, "handleFailureInFunction:file:lineNumber:description:", v35, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPRubyTextSource.mm"), 125, @"Bad curCharIndex");
        }
      }
      while (location < v8);
    }
    p_bidiCharIndexes = &v4->_bidiCharIndexes;
    v37 = &v4->_bidiCharIndexes.__end_;
    BOOL v38 = v4->_bidiCharIndexes.__begin_ == v4->_bidiCharIndexes.__end_;
    v39 = [TSWPRangeMap alloc];
    if (v38)
    {
      uint64_t v40 = -[TSWPRangeMap initWithSubRange:unmappedPairIndexes:](v39, "initWithSubRange:unmappedPairIndexes:", a4.location, a4.length, &v4->_spaceCharIndexes);
      v37 = p_end;
      p_bidiCharIndexes = &v4->_spaceCharIndexes;
    }
    else
    {
      uint64_t v40 = -[TSWPRangeMap initWithSubRange:unmappedIndexes:affinity:](v39, "initWithSubRange:unmappedIndexes:affinity:", a4.location, a4.length, &v4->_bidiCharIndexes, 1);
    }
    NSUInteger v41 = a4.length + *v37 - p_bidiCharIndexes->__begin_;
    v4->_rangeMap = (TSWPRangeMap *)v40;
    v4->_length = v41;
    v4->_storageLength = objc_msgSend(a3, "storageLength", p_end);
  }
  return v4;
}

- (unint64_t)length
{
  return self->_length;
}

- (_NSRange)charRangeMappedToStorage:(_NSRange)a3
{
  source = self->_source;
  uint64_t v5 = -[TSWPRangeMap unmappedCharRange:](self->_rangeMap, "unmappedCharRange:", a3.location, a3.length);

  NSUInteger v6 = -[TSWPTextSource charRangeMappedToStorage:](source, "charRangeMappedToStorage:", v5, v4);
  result.length = v7;
  result.NSUInteger location = v6;
  return result;
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  source = self->_source;
  unint64_t v4 = [(TSWPRangeMap *)self->_rangeMap unmappedCharIndex:a3];

  return [(TSWPTextSource *)source characterAtIndex:v4];
}

- (id)footnoteReferenceAtCharIndex:(unint64_t)a3
{
  source = self->_source;
  unint64_t v4 = [(TSWPRangeMap *)self->_rangeMap unmappedCharIndex:a3];

  return (id)[(TSWPTextSource *)source footnoteReferenceAtCharIndex:v4];
}

- (id)attachmentOrFootnoteAtCharIndex:(unint64_t)a3
{
  source = self->_source;
  unint64_t v4 = [(TSWPRangeMap *)self->_rangeMap unmappedCharIndex:a3];

  return (id)[(TSWPTextSource *)source attachmentOrFootnoteAtCharIndex:v4];
}

- (id)attachmentAtCharIndex:(unint64_t)a3
{
  source = self->_source;
  unint64_t v4 = [(TSWPRangeMap *)self->_rangeMap unmappedCharIndex:a3];

  return (id)[(TSWPTextSource *)source attachmentAtCharIndex:v4];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSWPRubyTextSource;
  [(TSWPRubyTextSource *)&v3 dealloc];
}

- (id)smartFieldAtCharIndex:(unint64_t)a3 attributeKind:(unsigned int)a4 effectiveRange:(_NSRange *)a5
{
  _NSRange v13 = (_NSRange)xmmword_223837AD0;
  NSUInteger v8 = (void *)-[TSWPTextSource smartFieldAtCharIndex:attributeKind:effectiveRange:](self->_source, "smartFieldAtCharIndex:attributeKind:effectiveRange:", -[TSWPRangeMap unmappedCharIndex:](self->_rangeMap, "unmappedCharIndex:"), *(void *)&a4, &v13);
  unint64_t length = v13.length;
  unint64_t location = v13.location;
  if (v8)
  {
    unint64_t location = [(TSWPRangeMap *)self->_rangeMap mappedCharRange:v13];
    v13.unint64_t location = location;
    v13.unint64_t length = length;
  }
  if (a3 < location || a3 - location >= length)
  {
    NSUInteger v8 = 0;
    _NSRange v13 = (_NSRange)xmmword_223837AD0;
  }
  if (a5) {
    *a5 = v13;
  }
  return v8;
}

void __46__TSWPRubyTextSource_initWithSource_subRange___block_invoke(void *a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  unint64_t v4 = a1[5];
  if (v4 <= a3)
  {
    uint64_t v7 = a3 + a4;
    if (a1[6] + v4 >= a3 + a4)
    {
      NSUInteger v8 = (void *)a1[4];
      uint64_t v9 = (char *)v8[2];
      unint64_t v10 = v8[3];
      if ((unint64_t)v9 >= v10)
      {
        uint64_t v12 = (char *)v8[1];
        uint64_t v13 = (v9 - v12) >> 3;
        unint64_t v14 = v13 + 1;
        if ((unint64_t)(v13 + 1) >> 61) {
          goto LABEL_37;
        }
        uint64_t v15 = v10 - (void)v12;
        if (v15 >> 2 > v14) {
          unint64_t v14 = v15 >> 2;
        }
        if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v16 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v16 = v14;
        }
        if (v16)
        {
          int v17 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<EQKitLayoutContext *>>((uint64_t)(v8 + 3), v16);
          uint64_t v12 = (char *)v8[1];
          uint64_t v9 = (char *)v8[2];
        }
        else
        {
          int v17 = 0;
        }
        unsigned int v18 = &v17[8 * v13];
        int v19 = &v17[8 * v16];
        *(void *)unsigned int v18 = a3;
        int v11 = v18 + 8;
        while (v9 != v12)
        {
          uint64_t v20 = *((void *)v9 - 1);
          v9 -= 8;
          *((void *)v18 - 1) = v20;
          v18 -= 8;
        }
        v8[1] = v18;
        v8[2] = v11;
        v8[3] = v19;
        if (v12) {
          operator delete(v12);
        }
      }
      else
      {
        *(void *)uint64_t v9 = a3;
        int v11 = v9 + 8;
      }
      v8[2] = v11;
      uint64_t v21 = (void *)a1[4];
      NSUInteger v22 = (char *)v21[2];
      unint64_t v23 = v21[3];
      if ((unint64_t)v22 < v23)
      {
        *(void *)NSUInteger v22 = v7;
        BOOL v24 = v22 + 8;
LABEL_35:
        v21[2] = v24;
        return;
      }
      unint64_t v25 = (char *)v21[1];
      uint64_t v26 = (v22 - v25) >> 3;
      unint64_t v27 = v26 + 1;
      if (!((unint64_t)(v26 + 1) >> 61))
      {
        uint64_t v28 = v23 - (void)v25;
        if (v28 >> 2 > v27) {
          unint64_t v27 = v28 >> 2;
        }
        if ((unint64_t)v28 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v29 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v29 = v27;
        }
        if (v29)
        {
          unint64_t v30 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<EQKitLayoutContext *>>((uint64_t)(v21 + 3), v29);
          unint64_t v25 = (char *)v21[1];
          NSUInteger v22 = (char *)v21[2];
        }
        else
        {
          unint64_t v30 = 0;
        }
        unint64_t v31 = &v30[8 * v26];
        v32 = &v30[8 * v29];
        *(void *)unint64_t v31 = v7;
        BOOL v24 = v31 + 8;
        while (v22 != v25)
        {
          uint64_t v33 = *((void *)v22 - 1);
          v22 -= 8;
          *((void *)v31 - 1) = v33;
          v31 -= 8;
        }
        v21[1] = v31;
        v21[2] = v24;
        v21[3] = v32;
        if (v25) {
          operator delete(v25);
        }
        goto LABEL_35;
      }
LABEL_37:
      abort();
    }
  }
}

- (unsigned)composedCharacterAtCharIndex:(unint64_t)a3 isSurrogatePair:(BOOL *)a4
{
  *a4 = 0;
  unint64_t v7 = [(TSWPTextSource *)self->_source length];
  unsigned int v8 = 0;
  if (v7 > a3)
  {
    unint64_t v9 = v7;
    unsigned int v8 = [(TSWPTextSource *)self->_source characterAtIndex:a3];
    unint64_t v10 = a3 + 1;
    if (a3 + 1 < v9)
    {
      int v11 = [(TSWPTextSource *)self->_source characterAtIndex:a3];
      int v12 = [(TSWPTextSource *)self->_source characterAtIndex:v10];
      if ((v11 & 0xFC00) == 0xD800 && (v12 & 0xFC00) == 56320)
      {
        *a4 = 1;
        return v12 + (v11 << 10) - 56613888;
      }
    }
  }
  return v8;
}

- (BOOL)adjustRangesByDelta:(int64_t)a3
{
  char v5 = -[TSWPTextSource adjustRangesByDelta:](self->_source, "adjustRangesByDelta:");
  if (a3)
  {
    unint64_t storageLength = self->_storageLength;
    if (storageLength != [(TSWPTextSource *)self->_source storageLength])
    {
      unint64_t v7 = self->_storageLength + a3;
      if (v7 != [(TSWPTextSource *)self->_source storageLength])
      {
        unsigned int v8 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v9 = [NSString stringWithUTF8String:"-[TSWPRubyTextSource adjustRangesByDelta:]"];
        objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPRubyTextSource.mm"), 187, @"delta mismatch");
      }
      self->_unint64_t storageLength = [(TSWPTextSource *)self->_source storageLength];
      if ((v5 & 1) == 0) {
        [(TSWPRangeMap *)self->_rangeMap adjustByDelta:a3];
      }
      return 1;
    }
  }
  return v5;
}

- (id)string
{
  uint64_t v3 = -[TSWPRangeMap unmappedCharRange:](self->_rangeMap, "unmappedCharRange:", 0, self->_length);
  uint64_t v5 = v3;
  uint64_t v6 = v4;
  if (self->_spaceCharIndexes.__end_ != self->_spaceCharIndexes.__begin_)
  {
    unint64_t v7 = (void *)[MEMORY[0x263F089D8] string];
    begin = self->_spaceCharIndexes.__begin_;
    end = self->_spaceCharIndexes.__end_;
    if (begin != end)
    {
      unint64_t v10 = v5;
      do
      {
        unint64_t v11 = v10;
        unint64_t v12 = *begin++;
        unint64_t v10 = v12;
        BOOL v13 = v11 >= v12;
        if (v11 <= v12) {
          unint64_t v14 = v10;
        }
        else {
          unint64_t v14 = v11;
        }
        if (v13) {
          unint64_t v15 = v10;
        }
        else {
          unint64_t v15 = v11;
        }
        objc_msgSend(v7, "appendString:", -[TSWPTextSource substringWithRange:](self->_source, "substringWithRange:", v15, v14 - v15));
        objc_msgSend(v7, "appendFormat:", @"%C", 8209);
      }
      while (begin != end);
      goto LABEL_24;
    }
    goto LABEL_23;
  }
  if (self->_bidiCharIndexes.__end_ != self->_bidiCharIndexes.__begin_)
  {
    unint64_t v7 = (void *)[MEMORY[0x263F089D8] string];
    unint64_t v16 = self->_bidiCharIndexes.__begin_;
    int v17 = self->_bidiCharIndexes.__end_;
    if (v16 != v17)
    {
      unint64_t v10 = v5;
      do
      {
        unint64_t v18 = v10;
        unint64_t v19 = *v16++;
        unint64_t v10 = v19;
        BOOL v20 = v18 >= v19;
        if (v18 <= v19) {
          unint64_t v21 = v10;
        }
        else {
          unint64_t v21 = v18;
        }
        if (v20) {
          unint64_t v22 = v10;
        }
        else {
          unint64_t v22 = v18;
        }
        objc_msgSend(v7, "appendString:", -[TSWPTextSource substringWithRange:](self->_source, "substringWithRange:", v22, v21 - v22));
        objc_msgSend(v7, "appendFormat:", @"%C", 8207);
      }
      while (v16 != v17);
LABEL_24:
      if (v7)
      {
        if (v10 <= v5 + v6) {
          unint64_t v23 = v5 + v6;
        }
        else {
          unint64_t v23 = v10;
        }
        if (v10 >= v5 + v6) {
          unint64_t v24 = v5 + v6;
        }
        else {
          unint64_t v24 = v10;
        }
        objc_msgSend(v7, "appendString:", -[TSWPTextSource substringWithRange:](self->_source, "substringWithRange:", v24, v23 - v24));
      }
      return v7;
    }
LABEL_23:
    unint64_t v10 = v5;
    goto LABEL_24;
  }
  if (v3 || v4 != objc_msgSend((id)-[TSWPTextSource string](self->_source, "string"), "length"))
  {
    source = self->_source;
    return (id)-[TSWPTextSource substringWithRange:](source, "substringWithRange:", v5, v6);
  }
  else
  {
    uint64_t v26 = self->_source;
    return (id)[(TSWPTextSource *)v26 string];
  }
}

- (BOOL)hasColumnStyleForParagraphBreakAtCharIndex:(unint64_t)a3
{
  source = self->_source;
  unint64_t v4 = [(TSWPRangeMap *)self->_rangeMap unmappedCharIndex:a3];

  return [(TSWPTextSource *)source hasColumnStyleForParagraphBreakAtCharIndex:v4];
}

- (double)filteredCoreTextAttributesFontScaleEffectiveRange:(_NSRange *)a3 filterDelegate:(id)a4
{
  if (!a3) {
    return 1.0;
  }
  uint64_t v12 = -[TSWPRangeMap unmappedCharRange:](self->_rangeMap, "unmappedCharRange:", a3->location, a3->length);
  uint64_t v13 = v7;
  [(TSWPTextSource *)self->_source filteredCoreTextAttributesFontScaleEffectiveRange:&v12 filterDelegate:a4];
  double v9 = v8;
  a3->unint64_t location = -[TSWPRangeMap mappedCharRange:](self->_rangeMap, "mappedCharRange:", v12, v13);
  a3->unint64_t length = v10;
  return v9;
}

- (id)paragraphStyleAtCharIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  long long v9 = xmmword_223837AD0;
  uint64_t v6 = (void *)[(TSWPTextSource *)self->_source paragraphStyleAtCharIndex:[(TSWPRangeMap *)self->_rangeMap unmappedCharIndex:a3] effectiveRange:&v9];
  if (a4)
  {
    a4->unint64_t location = [(TSWPRangeMap *)self->_rangeMap mappedCharRange:v9];
    a4->unint64_t length = v7;
  }
  return v6;
}

- (BOOL)isWritingDirectionRightToLeftForParagraphAtCharIndex:(unint64_t)a3
{
  return 0;
}

- (id)characterStyleAtCharIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  long long v12 = xmmword_223837AD0;
  source = self->_source;
  unint64_t v7 = [(TSWPRangeMap *)self->_rangeMap unmappedCharIndex:a3];
  if (a4) {
    double v8 = &v12;
  }
  else {
    double v8 = 0;
  }
  long long v9 = (void *)[(TSWPTextSource *)source characterStyleAtCharIndex:v7 effectiveRange:v8];
  if (a4)
  {
    a4->unint64_t location = [(TSWPRangeMap *)self->_rangeMap mappedCharRange:v12];
    a4->unint64_t length = v10;
  }
  return v9;
}

- (_NSRange)wordAtCharIndex:(unint64_t)a3 includePreviousWord:(BOOL)a4
{
  uint64_t v6 = [(TSWPTextSource *)self->_source wordAtCharIndex:[(TSWPRangeMap *)self->_rangeMap unmappedCharIndex:a3] includePreviousWord:a4];
  rangeMap = self->_rangeMap;

  NSUInteger v8 = -[TSWPRangeMap mappedCharRange:](rangeMap, "mappedCharRange:", v6, v5);
  result.unint64_t length = v9;
  result.unint64_t location = v8;
  return result;
}

- (int64_t)hyphenationLocationBeforeIndex:(int64_t)a3 inRange:(_NSRange)a4 locale:(__CFLocale *)a5 hyphenChar:(unsigned int *)a6
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  CFIndex v12 = -[TSWPRangeMap unmappedCharIndex:](self->_rangeMap, "unmappedCharIndex:");
  CFIndex v13 = -[TSWPRangeMap unmappedCharRange:](self->_rangeMap, "unmappedCharRange:", location, length);
  CFIndex v15 = v14;
  CFStringRef v16 = (const __CFString *)[(TSWPTextSource *)self->_source string];
  v21.NSUInteger location = v13;
  v21.NSUInteger length = v15;
  int64_t result = CFStringGetHyphenationLocationBeforeIndex(v16, v12, v21, 0, a5, a6);
  if (result != -1)
  {
    int64_t v18 = result;
    while (a3 > v18)
    {
      if ([(TSWPRubyTextSource *)self characterAtIndex:--a3] == 173)
      {
        int64_t v18 = a3 + 1;
        break;
      }
    }
    rangeMap = self->_rangeMap;
    return [(TSWPRangeMap *)rangeMap mappedCharIndex:v18];
  }
  return result;
}

- (id)objectAtLocationPriorToMappedCharIndex:(unint64_t)a3 forAttributeKind:(unsigned int)a4 effectiveRange:(_NSRange *)a5
{
  unint64_t v7 = (void *)[(TSWPTextSource *)self->_source objectAtLocationPriorToMappedCharIndex:[(TSWPRangeMap *)self->_rangeMap unmappedCharIndex:a3] forAttributeKind:*(void *)&a4 effectiveRange:a5];
  if (a5)
  {
    a5->NSUInteger location = -[TSWPRangeMap mappedCharRange:](self->_rangeMap, "mappedCharRange:", a5->location, a5->length);
    a5->NSUInteger length = v8;
  }
  return v7;
}

- (unint64_t)storageLength
{
  return self->_storageLength;
}

@end
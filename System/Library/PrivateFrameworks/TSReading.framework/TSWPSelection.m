@interface TSWPSelection
+ (Class)archivedSelectionClass;
+ (TSWPSelection)selectionWithRange:(_NSRange)a3;
+ (TSWPSelection)selectionWithRange:(_NSRange)a3 type:(int)a4 leadingEdge:(BOOL)a5 storage:(id)a6;
- (BOOL)containsCharacterAtIndex:(unint64_t)a3;
- (BOOL)containsCharacterAtIndex:(unint64_t)a3 allowRightEdge:(BOOL)a4;
- (BOOL)intersectsRange:(_NSRange)a3;
- (BOOL)isAtEndOfLine;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEquivalentForInsertionStyle:(id)a3;
- (BOOL)isInsertionPoint;
- (BOOL)isRange;
- (BOOL)isValid;
- (BOOL)isVisual;
- (BOOL)leadingEdge;
- (BOOL)validVisualRanges;
- (TSWPSelection)initWithRange:(_NSRange)a3;
- (TSWPSelection)initWithType:(int)a3 range:(_NSRange)a4 styleInsertionBehavior:(int)a5 caretAffinity:(int)a6;
- (TSWPSelection)initWithType:(int)a3 range:(_NSRange)a4 styleInsertionBehavior:(int)a5 caretAffinity:(int)a6 smartFieldRange:(_NSRange)a7 leadingEdge:(BOOL)a8 leadingCharIndex:(unint64_t)a9;
- (TSWPSelection)initWithType:(int)a3 range:(_NSRange)a4 styleInsertionBehavior:(int)a5 caretAffinity:(int)a6 smartFieldRange:(_NSRange)a7 leadingEdge:(BOOL)a8 storage:(id)a9;
- (_NSRange)range;
- (_NSRange)rawRange;
- (_NSRange)smartFieldRange;
- (_NSRange)superRange;
- (const)visualRanges;
- (id).cxx_construct;
- (id)copyWithNewRange:(_NSRange)a3;
- (id)copyWithNewType:(int)a3;
- (id)copyWithNewType:(int)a3 range:(_NSRange)a4;
- (id)copyWithNewType:(int)a3 smartFieldRange:(_NSRange)a4;
- (id)copyWithNewVisualRanges:(const void *)a3;
- (id)copyWithNewVisualTypeRange:(_NSRange)a3 head:(unint64_t)a4 tail:(unint64_t)a5;
- (id)copyWithVisualRanges:(const void *)a3 startChar:(unint64_t)a4 endChar:(unint64_t)a5 rightToLeft:(BOOL)a6 sameLine:(BOOL)a7;
- (id)copyWithZone:(_NSZone *)a3;
- (id)visualRangesArray;
- (int)caretAffinity;
- (int)styleInsertionBehavior;
- (int)type;
- (int64_t)compare:(id)a3;
- (unint64_t)end;
- (unint64_t)headChar;
- (unint64_t)insertionChar;
- (unint64_t)leadingCharIndex;
- (unint64_t)tailChar;
- (unint64_t)visualRangeCount;
- (void)dealloc;
- (void)i_setVisualRanges:(const void *)a3;
- (void)i_visualRanges;
- (void)setHeadChar:(unint64_t)a3;
- (void)setHeadChar:(unint64_t)a3 tailChar:(unint64_t)a4;
- (void)setTailChar:(unint64_t)a3;
@end

@implementation TSWPSelection

+ (TSWPSelection)selectionWithRange:(_NSRange)a3
{
  v3 = objc_msgSend(objc_alloc((Class)a1), "initWithRange:", a3.location, a3.length);

  return (TSWPSelection *)v3;
}

- (TSWPSelection)initWithRange:(_NSRange)a3
{
  LOBYTE(v4) = 1;
  return -[TSWPSelection initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:storage:](self, "initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:storage:", 0, a3.location, a3.length, 0, 0, *MEMORY[0x263F7C7C8], *(void *)(MEMORY[0x263F7C7C8] + 8), v4, 0);
}

- (TSWPSelection)initWithType:(int)a3 range:(_NSRange)a4 styleInsertionBehavior:(int)a5 caretAffinity:(int)a6 smartFieldRange:(_NSRange)a7 leadingEdge:(BOOL)a8 storage:(id)a9
{
  uint64_t v9 = *(void *)&a6;
  uint64_t v10 = *(void *)&a5;
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v13 = *(void *)&a3;
  if (a3 != 7 || a9 || a8)
  {
    if (a3 == 7 && a9 && !a8) {
      [a9 nextCharacterIndex:a4.location];
    }
  }
  else
  {
    v15 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v16 = [NSString stringWithUTF8String:"-[TSWPSelection initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:storage:]"];
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPSelection.mm"), 122, @"Selection has a leading edge but no storage to get the leading char");
  }

  return -[TSWPSelection initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:leadingCharIndex:](self, "initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:leadingCharIndex:", v13, location, length, v10, v9);
}

- (TSWPSelection)initWithType:(int)a3 range:(_NSRange)a4 styleInsertionBehavior:(int)a5 caretAffinity:(int)a6 smartFieldRange:(_NSRange)a7 leadingEdge:(BOOL)a8 leadingCharIndex:(unint64_t)a9
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  _NSRange v21 = a7;
  v20.receiver = self;
  v20.super_class = (Class)TSWPSelection;
  v14 = [(TSWPSelection *)&v20 init];
  v15 = v14;
  if (v14)
  {
    v14->_type = a3;
    v14->_range.NSUInteger location = location;
    v14->_range.NSUInteger length = length;
    v14->_leadingEdge = a8;
    v14->_leadingCharIndex = a9;
    v14->_styleInsertionBehavior = a5;
    v14->_caretAffinity = a6;
    if (a3 == 6)
    {
      uint64_t v16 = &v21;
    }
    else
    {
      uint64_t v16 = (_NSRange *)MEMORY[0x263F7C7C8];
      if (a7.location != *MEMORY[0x263F7C7C8] || a7.length != *(void *)(MEMORY[0x263F7C7C8] + 8))
      {
        v17 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v18 = [NSString stringWithUTF8String:"-[TSWPSelection initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:leadingCharIndex:]"];
        objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPSelection.mm"), 105, @"Non smartfield selection has smartField range");
        uint64_t v16 = (_NSRange *)MEMORY[0x263F7C7C8];
      }
    }
    v15->_smartFieldRange = *v16;
    v15->_validVisualRanges = 0;
    v15->_headChar = 0x7FFFFFFFFFFFFFFFLL;
    v15->_tailChar = 0x7FFFFFFFFFFFFFFFLL;
  }
  return v15;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)TSWPSelection;
  [(TSWPSelection *)&v2 dealloc];
}

- (_NSRange)range
{
  if ([(TSWPSelection *)self isVisual]
    && [(TSWPSelection *)self isInsertionPoint]
    && !self->_leadingEdge)
  {
    NSUInteger length = 0;
    p_leadingCharIndex = (_NSRange *)&self->_leadingCharIndex;
  }
  else
  {
    p_leadingCharIndex = &self->_range;
    NSUInteger length = self->_range.length;
  }
  NSUInteger location = p_leadingCharIndex->location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (BOOL)isVisual
{
  return self->_type == 7;
}

- (int)styleInsertionBehavior
{
  return self->_styleInsertionBehavior;
}

- (id).cxx_construct
{
  *((void *)self + 13) = 0;
  *((void *)self + 14) = 0;
  *((void *)self + 12) = 0;
  return self;
}

- (void).cxx_destruct
{
  p_visualRanges = &self->_visualRanges;
  begin = self->_visualRanges.__begin_;
  if (begin)
  {
    p_visualRanges->__end_ = begin;
    operator delete(begin);
  }
}

- (unint64_t)visualRangeCount
{
  return self->_visualRanges.__end_ - self->_visualRanges.__begin_;
}

- (BOOL)isRange
{
  return self->_range.length && self->_range.location != 0x7FFFFFFFFFFFFFFFLL;
}

- (unint64_t)insertionChar
{
  return self->_range.location;
}

- (TSWPSelection)initWithType:(int)a3 range:(_NSRange)a4 styleInsertionBehavior:(int)a5 caretAffinity:(int)a6
{
  LOBYTE(v7) = 1;
  return -[TSWPSelection initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:storage:](self, "initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:storage:", *(void *)&a3, a4.location, a4.length, *(void *)&a5, *(void *)&a6, *MEMORY[0x263F7C7C8], *(void *)(MEMORY[0x263F7C7C8] + 8), v7, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  LOBYTE(v6) = self->_leadingEdge;
  return (id)objc_msgSend(v4, "initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:leadingCharIndex:", self->_type, self->_range.location, self->_range.length, self->_styleInsertionBehavior, self->_caretAffinity, self->_smartFieldRange.location, self->_smartFieldRange.length, v6, self->_leadingCharIndex);
}

+ (Class)archivedSelectionClass
{
  return (Class)objc_opt_class();
}

+ (TSWPSelection)selectionWithRange:(_NSRange)a3 type:(int)a4 leadingEdge:(BOOL)a5 storage:(id)a6
{
  uint64_t v8 = *(void *)&a4;
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v11 = objc_alloc((Class)a1);
  LOBYTE(v14) = a5;
  v12 = objc_msgSend(v11, "initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:storage:", v8, location, length, 0, 0, *MEMORY[0x263F7C7C8], *(void *)(MEMORY[0x263F7C7C8] + 8), v14, a6);

  return (TSWPSelection *)v12;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  objc_opt_class();
  BOOL result = (objc_opt_isKindOfClass() & 1) != 0
        && (self->_range.location == *((void *)a3 + 2) ? (BOOL v5 = self->_range.length == *((void *)a3 + 3)) : (BOOL v5 = 0),
            v5
         && self->_type == *((_DWORD *)a3 + 2)
         && self->_styleInsertionBehavior == *((_DWORD *)a3 + 17)
         && self->_caretAffinity == *((_DWORD *)a3 + 18)
         && (self->_smartFieldRange.location == *((void *)a3 + 10)
           ? (BOOL v6 = self->_smartFieldRange.length == *((void *)a3 + 11))
           : (BOOL v6 = 0),
             v6))
        && self->_leadingEdge == *((unsigned __int8 *)a3 + 48);
  return result;
}

- (int64_t)compare:(id)a3
{
  objc_opt_class();
  int64_t result = TSUDynamicCast();
  if (result)
  {
    BOOL v5 = (void *)result;
    if (-[TSWPSelection isValid](self, "isValid") && [v5 isValid])
    {
      unint64_t v6 = [(TSWPSelection *)self range];
      if (v6 < [v5 range]) {
        return -1;
      }
      unint64_t v7 = [(TSWPSelection *)self range];
      if (v7 <= [v5 range])
      {
        [(TSWPSelection *)self range];
        unint64_t v9 = v8;
        [v5 range];
        if (v9 < v10) {
          return -1;
        }
        [(TSWPSelection *)self range];
        unint64_t v12 = v11;
        [v5 range];
        return v12 > v13;
      }
      else
      {
        return 1;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (BOOL)isInsertionPoint
{
  return !self->_range.length && self->_range.location != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)isValid
{
  return self->_range.location != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)isEmpty
{
  return ![(TSWPSelection *)self isValid];
}

- (BOOL)isEquivalentForInsertionStyle:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  uint64_t v5 = [(TSWPSelection *)self range];
  uint64_t v7 = v6;
  uint64_t v9 = [a3 range];
  BOOL result = 0;
  if (v5 == v9 && v7 == v8) {
    return self->_type == *((_DWORD *)a3 + 2);
  }
  return result;
}

- (id)copyWithNewType:(int)a3 smartFieldRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v6 = *(void *)&a3;
  id v8 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v10) = self->_leadingEdge;
  return (id)objc_msgSend(v8, "initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:leadingCharIndex:", v6, self->_range.location, self->_range.length, self->_styleInsertionBehavior, self->_caretAffinity, location, length, v10, self->_leadingCharIndex);
}

- (id)copyWithNewType:(int)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v6 = *(void *)&a3;
  if (a3 == 6) {
    p_smartFieldRange = &self->_smartFieldRange;
  }
  else {
    p_smartFieldRange = (_NSRange *)MEMORY[0x263F7C7C8];
  }
  NSUInteger v9 = p_smartFieldRange->location;
  NSUInteger v10 = p_smartFieldRange->length;
  id v11 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v13) = self->_leadingEdge;
  return (id)objc_msgSend(v11, "initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:leadingCharIndex:", v6, location, length, self->_styleInsertionBehavior, self->_caretAffinity, v9, v10, v13, self->_leadingCharIndex);
}

- (id)copyWithNewVisualTypeRange:(_NSRange)a3 head:(unint64_t)a4 tail:(unint64_t)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v10 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v13) = self->_leadingEdge;
  id v11 = objc_msgSend(v10, "initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:leadingCharIndex:", 7, location, length, self->_styleInsertionBehavior, self->_caretAffinity, self->_smartFieldRange.location, self->_smartFieldRange.length, v13, self->_leadingCharIndex);
  [v11 setHeadChar:a4 tailChar:a5];
  return v11;
}

- (id)copyWithNewType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (a3 == 6) {
    p_smartFieldRange = &self->_smartFieldRange;
  }
  else {
    p_smartFieldRange = (_NSRange *)MEMORY[0x263F7C7C8];
  }
  NSUInteger location = p_smartFieldRange->location;
  NSUInteger length = p_smartFieldRange->length;
  id v8 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v10) = self->_leadingEdge;
  return (id)objc_msgSend(v8, "initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:leadingCharIndex:", v3, self->_range.location, self->_range.length, self->_styleInsertionBehavior, self->_caretAffinity, location, length, v10, self->_leadingCharIndex);
}

- (id)copyWithNewRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  LOBYTE(v10) = 1;
  uint64_t v6 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:leadingCharIndex:", self->_type, location, a3.length, self->_styleInsertionBehavior, self->_caretAffinity, self->_smartFieldRange.location, self->_smartFieldRange.length, v10, location);
  uint64_t v7 = v6;
  if (self->_type == 7
    && self->_validVisualRanges
    && location == self->_range.location
    && length == self->_range.length)
  {
    objc_msgSend(v6, "i_setVisualRanges:", &self->_visualRanges);
  }
  return v7;
}

- (id)copyWithNewVisualRanges:(const void *)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  uint64_t v6 = *((void *)a3 + 1);
  if (*(void *)a3 == v6)
  {
    unint64_t v7 = 0;
    unint64_t v8 = 0;
  }
  else
  {
    unint64_t v7 = **(void **)a3;
    unint64_t v8 = *(void *)(v6 - 8) + *(void *)(v6 - 16);
  }
  if (v7 <= v8) {
    unint64_t v9 = v8;
  }
  else {
    unint64_t v9 = v7;
  }
  if (v7 >= v8) {
    uint64_t v10 = v8;
  }
  else {
    uint64_t v10 = v7;
  }
  LOBYTE(v13) = self->_leadingEdge;
  id v11 = objc_msgSend(v5, "initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:leadingCharIndex:", 7, v10, v9 - v10, self->_styleInsertionBehavior, self->_caretAffinity, self->_smartFieldRange.location, self->_smartFieldRange.length, v13, self->_leadingCharIndex);
  objc_msgSend(v11, "i_setVisualRanges:", a3);
  return v11;
}

- (id)copyWithVisualRanges:(const void *)a3 startChar:(unint64_t)a4 endChar:(unint64_t)a5 rightToLeft:(BOOL)a6 sameLine:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  if (self->_type != 7)
  {
    uint64_t v13 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v14 = [NSString stringWithUTF8String:"-[TSWPSelection copyWithVisualRanges:startChar:endChar:rightToLeft:sameLine:]"];
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPSelection.mm"), 339, @"Selection type must be visual");
  }
  id v15 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v21) = self->_leadingEdge;
  uint64_t v16 = objc_msgSend(v15, "initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:leadingCharIndex:", self->_type, self->_range.location, self->_range.length, self->_styleInsertionBehavior, self->_caretAffinity, self->_smartFieldRange.location, self->_smartFieldRange.length, v21, self->_leadingCharIndex);
  objc_msgSend(v16, "i_setVisualRanges:", a3);
  if (v7 && v8)
  {
    v17 = v16;
    unint64_t v18 = a5;
    unint64_t v19 = a4;
  }
  else
  {
    v17 = v16;
    unint64_t v18 = a4;
    unint64_t v19 = a5;
  }
  [v17 setHeadChar:v18 tailChar:v19];
  return v16;
}

- (unint64_t)end
{
  return self->_range.length + self->_range.location;
}

- (_NSRange)superRange
{
  if (self->_type == 7
    && [(TSWPSelection *)self isRange]
    && (begin = self->_visualRanges.__begin_, end = self->_visualRanges.__end_, end != begin))
  {
    NSUInteger location = begin->location;
    NSUInteger v6 = end[-1].length + end[-1].location;
    if (location <= v6) {
      NSUInteger v7 = v6;
    }
    else {
      NSUInteger v7 = location;
    }
    if (location >= v6) {
      NSUInteger v8 = v6;
    }
    else {
      NSUInteger v8 = location;
    }
    NSUInteger v9 = v7 - v8;
  }
  else
  {
    NSUInteger v8 = [(TSWPSelection *)self range];
  }
  result.NSUInteger length = v9;
  result.NSUInteger location = v8;
  return result;
}

- (void)i_setVisualRanges:(const void *)a3
{
  p_visualRanges = (char *)&self->_visualRanges;
  if (p_visualRanges != a3) {
    std::vector<EQKitLength>::__assign_with_size[abi:nn180100]<EQKitLength*,EQKitLength*>(p_visualRanges, *(char **)a3, *((void *)a3 + 1), (uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 4);
  }
  self->_validVisualRanges = 1;
}

- (const)visualRanges
{
  if (!self->_validVisualRanges)
  {
    uint64_t v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSWPSelection visualRanges]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPSelection.mm"), 394, @"Visual ranges have not been calculated");
  }
  return &self->_visualRanges;
}

- (void)i_visualRanges
{
  return &self->_visualRanges;
}

- (id)visualRangesArray
{
  if (self->_type == 7 && !self->_validVisualRanges && [(TSWPSelection *)self isRange])
  {
    uint64_t v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSWPSelection visualRangesArray]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPSelection.mm"), 406, @"Visual ranges have not been calculated");
  }
  p_visualRanges = &self->_visualRanges;
  int64_t v6 = (char *)self->_visualRanges.__end_ - (char *)self->_visualRanges.__begin_;
  if ((unint64_t)v6 < 0x11)
  {
    id v11 = (void *)MEMORY[0x263EFF980];
    unint64_t v12 = (void *)MEMORY[0x263F08D40];
    uint64_t v13 = [(TSWPSelection *)self superRange];
    uint64_t v15 = objc_msgSend(v12, "valueWithRange:", v13, v14);
    return (id)[v11 arrayWithObject:v15];
  }
  else
  {
    unint64_t v7 = v6 >> 4;
    NSUInteger v8 = (void *)[MEMORY[0x263EFF980] arrayWithCapacity:v6 >> 4];
    uint64_t v9 = 0;
    if (v7 <= 1) {
      unint64_t v7 = 1;
    }
    do
    {
      objc_msgSend(v8, "addObject:", objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", p_visualRanges->__begin_[v9].location, p_visualRanges->__begin_[v9].length));
      ++v9;
      --v7;
    }
    while (v7);
    return v8;
  }
}

- (void)setHeadChar:(unint64_t)a3 tailChar:(unint64_t)a4
{
  self->_headChar = a3;
  self->_tailChar = a4;
}

- (BOOL)containsCharacterAtIndex:(unint64_t)a3
{
  NSUInteger location = self->_range.location;
  BOOL v5 = a3 >= location;
  NSUInteger v4 = a3 - location;
  BOOL v5 = !v5 || v4 >= self->_range.length;
  return !v5;
}

- (BOOL)containsCharacterAtIndex:(unint64_t)a3 allowRightEdge:(BOOL)a4
{
  NSUInteger location = self->_range.location;
  if (a4) {
    return a3 - location <= self->_range.length;
  }
  BOOL v7 = a3 >= location;
  NSUInteger v6 = a3 - location;
  BOOL v7 = !v7 || v6 >= self->_range.length;
  return !v7;
}

- (BOOL)intersectsRange:(_NSRange)a3
{
  p_range = &self->_range;
  v4.NSUInteger length = self->_range.length;
  if (v4.length)
  {
    v4.NSUInteger location = p_range->location;
    return NSIntersectionRange(v4, a3).length != 0;
  }
  else
  {
    NSUInteger location = p_range->location;
    BOOL v8 = location >= a3.location && location - a3.location < a3.length;
    BOOL v9 = location == a3.location;
    if (a3.length) {
      return v8;
    }
    else {
      return v9;
    }
  }
}

- (BOOL)isAtEndOfLine
{
  return self->_caretAffinity == 1;
}

- (int)type
{
  return self->_type;
}

- (_NSRange)rawRange
{
  p_range = &self->_range;
  NSUInteger location = self->_range.location;
  NSUInteger length = p_range->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (_NSRange)smartFieldRange
{
  p_smartFieldRange = &self->_smartFieldRange;
  NSUInteger location = self->_smartFieldRange.location;
  NSUInteger length = p_smartFieldRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (unint64_t)headChar
{
  return self->_headChar;
}

- (void)setHeadChar:(unint64_t)a3
{
  self->_headChar = a3;
}

- (unint64_t)tailChar
{
  return self->_tailChar;
}

- (void)setTailChar:(unint64_t)a3
{
  self->_tailChar = a3;
}

- (BOOL)leadingEdge
{
  return self->_leadingEdge;
}

- (unint64_t)leadingCharIndex
{
  return self->_leadingCharIndex;
}

- (int)caretAffinity
{
  return self->_caretAffinity;
}

- (BOOL)validVisualRanges
{
  return self->_validVisualRanges;
}

@end
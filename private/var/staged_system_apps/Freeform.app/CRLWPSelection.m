@interface CRLWPSelection
+ (CRLWPSelection)selectionWithRange:(_NSRange)a3;
+ (CRLWPSelection)selectionWithRange:(_NSRange)a3 type:(unint64_t)a4 leadingEdge:(BOOL)a5 storage:(id)a6;
+ (id)selectionFromWPSelection:(id)a3;
- (BOOL)allowsKeyCommandCaching;
- (BOOL)containsCharacterAtIndex:(unint64_t)a3;
- (BOOL)containsCharacterAtIndex:(unint64_t)a3 withOptions:(unint64_t)a4;
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
- (BOOL)p_isEqual:(id)a3;
- (BOOL)validVisualRanges;
- (CRLWPSelection)initWithRange:(_NSRange)a3;
- (CRLWPSelection)initWithRangeArray:(id)a3;
- (CRLWPSelection)initWithType:(unint64_t)a3 range:(_NSRange)a4 styleInsertionBehavior:(int)a5 caretAffinity:(unint64_t)a6;
- (CRLWPSelection)initWithType:(unint64_t)a3 range:(_NSRange)a4 styleInsertionBehavior:(int)a5 caretAffinity:(unint64_t)a6 smartFieldRange:(_NSRange)a7 leadingEdge:(BOOL)a8 leadingCharIndex:(unint64_t)a9;
- (CRLWPSelection)initWithType:(unint64_t)a3 range:(_NSRange)a4 styleInsertionBehavior:(int)a5 caretAffinity:(unint64_t)a6 smartFieldRange:(_NSRange)a7 leadingEdge:(BOOL)a8 storage:(id)a9;
- (_NSRange)range;
- (_NSRange)rawRange;
- (_NSRange)smartFieldRange;
- (_NSRange)superRange;
- (id)constrainToRange:(_NSRange)a3;
- (id)copyWithNewRange:(_NSRange)a3;
- (id)copyWithNewRange:(_NSRange)a3 newCaretAffinity:(unint64_t)a4;
- (id)copyWithNewStyleInsertionBehavior:(int)a3 newCaretAffinity:(unint64_t)a4;
- (id)copyWithNewType:(unint64_t)a3;
- (id)copyWithNewType:(unint64_t)a3 range:(_NSRange)a4;
- (id)copyWithNewType:(unint64_t)a3 smartFieldRange:(_NSRange)a4;
- (id)copyWithNewVisualRanges:(id)a3;
- (id)copyWithNewVisualTypeRange:(_NSRange)a3 head:(unint64_t)a4 tail:(unint64_t)a5;
- (id)copyWithVisualRanges:(id)a3 headCharIndex:(unint64_t)a4 tailCharIndex:(unint64_t)a5 rightToLeft:(BOOL)a6 sameLine:(BOOL)a7;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)i_visualRanges;
- (id)visualRanges;
- (id)visualRangesArray;
- (int)styleInsertionBehavior;
- (int64_t)compare:(id)a3;
- (unint64_t)caretAffinity;
- (unint64_t)end;
- (unint64_t)hash;
- (unint64_t)headCharIndex;
- (unint64_t)headCursorAffinity;
- (unint64_t)insertionChar;
- (unint64_t)insertionEdge;
- (unint64_t)leadingCharIndex;
- (unint64_t)tailCharIndex;
- (unint64_t)tailCursorAffinity;
- (unint64_t)type;
- (unint64_t)visualRangeCount;
- (void)i_setVisualRanges:(id)a3;
- (void)setHeadCharIndex:(unint64_t)a3;
- (void)setHeadCharIndex:(unint64_t)a3 tailCharIndex:(unint64_t)a4;
- (void)setHeadCursorAffinity:(unint64_t)a3;
- (void)setInsertionEdge:(unint64_t)a3;
- (void)setTailCharIndex:(unint64_t)a3;
- (void)setTailCursorAffinity:(unint64_t)a3;
@end

@implementation CRLWPSelection

- (unint64_t)insertionChar
{
  return self->_range.location;
}

- (_NSRange)range
{
  if ([(CRLWPSelection *)self isVisual]
    && [(CRLWPSelection *)self isInsertionPoint]
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

- (unint64_t)insertionEdge
{
  return [(CRLWPSelection *)self leadingEdge] ^ 1;
}

- (void)setInsertionEdge:(unint64_t)a3
{
  self->_leadingEdge = a3 == 0;
}

- (CRLWPSelection)initWithType:(unint64_t)a3 range:(_NSRange)a4 styleInsertionBehavior:(int)a5 caretAffinity:(unint64_t)a6 smartFieldRange:(_NSRange)a7 leadingEdge:(BOOL)a8 leadingCharIndex:(unint64_t)a9
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  _NSRange v32 = a7;
  v31.receiver = self;
  v31.super_class = (Class)CRLWPSelection;
  v14 = [(CRLWPSelection *)&v31 init];
  v15 = v14;
  if (!v14) {
    goto LABEL_34;
  }
  v14->_type = a3;
  v14->_range.NSUInteger location = location;
  v14->_range.NSUInteger length = length;
  if (length) {
    a8 = 1;
  }
  v14->_leadingEdge = a8;
  if (length) {
    a9 = 0x7FFFFFFFFFFFFFFFLL;
  }
  v14->_leadingCharIndex = a9;
  v14->_styleInsertionBehavior = a5;
  v14->_caretAffinity = a6;
  if (a3 == 6)
  {
    v18 = (long long *)&v32;
  }
  else
  {
    v18 = &xmmword_101176F48;
    if (a7.location != 0x7FFFFFFFFFFFFFFFLL || a7.length)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FD0C0);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010B8380();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FD0E0);
      }
      v19 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_ERROR))
      {
        +[CRLAssertionHandler packedBacktraceString];
        objc_claimAutoreleasedReturnValue();
        sub_1010663B0();
      }

      v20 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPSelection initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:leadingCharIndex:]");
      v21 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPSelection.mm"];
      +[CRLAssertionHandler handleFailureInFunction:v20 file:v21 lineNumber:143 isFatal:0 description:"Non smartfield selection has smartField range"];

      v18 = &xmmword_101176F48;
    }
  }
  v15->_smartFieldRange = (_NSRange)*v18;
  v15->_validVisualRanges = 0;
  v15->_headCharIndex = 0x7FFFFFFFFFFFFFFFLL;
  v15->_tailCharIndex = 0x7FFFFFFFFFFFFFFFLL;
  v15->_tailCursorAffinity = 1;
  if (length) {
    uint64_t v22 = 2;
  }
  else {
    uint64_t v22 = 1;
  }
  v15->_headCursorAffinity = v22;
  if (length >= 0x7FFFFFFFFFFFFFFFLL)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FD100);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B82F8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FD120);
    }
    v23 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    v24 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPSelection initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:leadingCharIndex:]");
    v25 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPSelection.mm"];
    +[CRLAssertionHandler handleFailureInFunction:v24 file:v25 lineNumber:157 isFatal:0 description:"illegal range length"];
  }
  if ((location & 0x8000000000000000) != 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FD140);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B8270();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FD160);
    }
    v27 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    v28 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPSelection initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:leadingCharIndex:]");
    v29 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPSelection.mm"];
    +[CRLAssertionHandler handleFailureInFunction:v28 file:v29 lineNumber:158 isFatal:0 description:"illegal range location"];

    goto LABEL_44;
  }
  if (length > 0x7FFFFFFFFFFFFFFELL)
  {
LABEL_44:
    v26 = 0;
    goto LABEL_45;
  }
LABEL_34:
  v26 = v15;
LABEL_45:

  return v26;
}

- (CRLWPSelection)initWithType:(unint64_t)a3 range:(_NSRange)a4 styleInsertionBehavior:(int)a5 caretAffinity:(unint64_t)a6 smartFieldRange:(_NSRange)a7 leadingEdge:(BOOL)a8 storage:(id)a9
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v13 = a9;
  v14 = v13;
  if (a3 == 7 && !v13 && !a8)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FD180);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B8408();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FD1A0);
    }
    v15 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    v16 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPSelection initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:storage:]");
    v17 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPSelection.mm"];
    +[CRLAssertionHandler handleFailureInFunction:v16 file:v17 lineNumber:169 isFatal:0 description:"Selection has a leading edge but no storage to get the leading char"];

    goto LABEL_17;
  }
  if (a3 != 7 || !v13 || a8)
  {
LABEL_17:
    id v18 = (id)location;
    goto LABEL_18;
  }
  id v18 = [v13 nextCharacterIndex:location];
LABEL_18:
  LOBYTE(v21) = a8;
  v19 = -[CRLWPSelection initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:leadingCharIndex:](self, "initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:leadingCharIndex:", a3, location, length, a5, a6, 0x7FFFFFFFFFFFFFFFLL, 0, v21, v18);

  return v19;
}

- (CRLWPSelection)initWithType:(unint64_t)a3 range:(_NSRange)a4 styleInsertionBehavior:(int)a5 caretAffinity:(unint64_t)a6
{
  LOBYTE(v7) = 1;
  return -[CRLWPSelection initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:storage:](self, "initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:storage:", a3, a4.location, a4.length, *(void *)&a5, a6, 0x7FFFFFFFFFFFFFFFLL, 0, v7, 0);
}

- (CRLWPSelection)initWithRange:(_NSRange)a3
{
  LOBYTE(v4) = 1;
  return -[CRLWPSelection initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:storage:](self, "initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:storage:", 0, a3.location, a3.length, 0, 0, 0x7FFFFFFFFFFFFFFFLL, 0, v4, 0);
}

- (CRLWPSelection)initWithRangeArray:(id)a3
{
  id v5 = a3;
  LOBYTE(v9) = 1;
  v6 = -[CRLWPSelection initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:leadingCharIndex:](self, "initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:leadingCharIndex:", 0, 0x7FFFFFFFFFFFFFFFLL, 0, v9, 0x7FFFFFFFFFFFFFFFLL);
  if (v6)
  {
    if ([v5 rangeCount])
    {
      v6->_range.NSUInteger location = (NSUInteger)[v5 superRange];
      v6->_range.NSUInteger length = v7;
      if (v7)
      {
        objc_storeStrong((id *)&v6->_visualRanges, a3);
        v6->_validVisualRanges = 1;
      }
    }
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(id)objc_opt_class() allocWithZone:a3];
  LOBYTE(v6) = self->_leadingEdge;
  return [v4 initWithType:self->_type range:self->_range.location, self->_range.length styleInsertionBehavior:self->_styleInsertionBehavior caretAffinity:self->_caretAffinity smartFieldRange:self->_smartFieldRange.location, self->_smartFieldRange.length leadingEdge:v6 leadingCharIndex:self->_leadingCharIndex];
}

+ (CRLWPSelection)selectionWithRange:(_NSRange)a3
{
  id v3 = [objc_alloc((Class)a1) initWithRange:a3.location, a3.length];

  return (CRLWPSelection *)v3;
}

+ (CRLWPSelection)selectionWithRange:(_NSRange)a3 type:(unint64_t)a4 leadingEdge:(BOOL)a5 storage:(id)a6
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v11 = a6;
  LOBYTE(v14) = a5;
  id v12 = [objc_alloc((Class)a1) initWithType:a4 range:location length:length styleInsertionBehavior:0 caretAffinity:0 smartFieldRange:0x7FFFFFFFFFFFFFFFLL leadingEdge:0 storage:v14];

  return (CRLWPSelection *)v12;
}

+ (id)selectionFromWPSelection:(id)a3
{
  id v4 = (id *)a3;
  if (v4)
  {
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
    }
    else
    {
      id v9 = objc_alloc((Class)a1);
      id v10 = [v4 type];
      id v11 = [v4 rawRange];
      uint64_t v13 = v12;
      id v14 = [v4 styleInsertionBehavior];
      id v15 = [v4 caretAffinity];
      id v16 = [v4 smartFieldRange];
      uint64_t v18 = v17;
      LOBYTE(v20) = [v4 leadingEdge];
      id v5 = [v9 initWithType:v10 range:v11 styleInsertionBehavior:v13 caretAffinity:v14 smartFieldRange:v15 leadingEdge:v16 leadingCharIndex:[v4 leadingCharIndex]];
      v5[4] = v4[4];
      v5[5] = v4[5];
      *((unsigned char *)v5 + 64) = *((unsigned char *)v4 + 64);
      objc_storeStrong(v5 + 12, v4[12]);
    }
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FD1C0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B8490();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FD1E0);
    }
    uint64_t v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    NSUInteger v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLWPSelection selectionFromWPSelection:]");
    v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPSelection.mm"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 227, 0, "invalid nil value for '%{public}s'", "wpSelection");

    id v5 = 0;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  return [(CRLWPSelection *)self p_isEqual:a3];
}

- (BOOL)p_isEqual:(id)a3
{
  id v4 = (CRLWPSelection *)a3;
  if (v4 == self)
  {
    BOOL v10 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = sub_1002469D0(v5, v4);
    NSUInteger v7 = (void *)v6;
    BOOL v10 = 0;
    if (v6)
    {
      BOOL v8 = self->_range.location == *(void *)(v6 + 16) && self->_range.length == *(void *)(v6 + 24);
      if (v8
        && self->_type == *(void *)(v6 + 8)
        && self->_styleInsertionBehavior == *(_DWORD *)(v6 + 68)
        && self->_caretAffinity == *(void *)(v6 + 72))
      {
        BOOL v9 = self->_smartFieldRange.location == *(void *)(v6 + 80)
          && self->_smartFieldRange.length == *(void *)(v6 + 88);
        if (v9
          && self->_leadingEdge == *(unsigned __int8 *)(v6 + 48)
          && self->_leadingCharIndex == *(void *)(v6 + 56)
          && self->_validVisualRanges == *(unsigned __int8 *)(v6 + 64)
          && (!self->_validVisualRanges
           || [(CRLWPRangeArray *)self->_visualRanges isEqualToRangeArray:*(void *)(v6 + 96)]))
        {
          BOOL v10 = 1;
        }
      }
    }
  }
  return v10;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(CRLHasher);
  [(CRLHasher *)v3 addUnsignedInteger:self->_range.location];
  [(CRLHasher *)v3 addUnsignedInteger:self->_range.length];
  [(CRLHasher *)v3 addUnsignedInteger:self->_type];
  [(CRLHasher *)v3 addUnsignedInteger:self->_styleInsertionBehavior];
  [(CRLHasher *)v3 addUnsignedInteger:self->_caretAffinity];
  [(CRLHasher *)v3 addUnsignedInteger:self->_smartFieldRange.location];
  [(CRLHasher *)v3 addUnsignedInteger:self->_smartFieldRange.length];
  [(CRLHasher *)v3 addUnsignedInteger:self->_leadingCharIndex];
  [(CRLHasher *)v3 addUnsignedInteger:self->_validVisualRanges];
  [(CRLHasher *)v3 addBool:self->_leadingEdge];
  unint64_t v4 = [(CRLHasher *)v3 hashValue];

  return v4;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = sub_1002469D0(v5, v4);
  if (v6 && -[CRLWPSelection isValid](self, "isValid") && [v6 isValid])
  {
    id v7 = [(CRLWPSelection *)self range];
    if (v7 >= [v6 range])
    {
      id v10 = [(CRLWPSelection *)self range];
      if (v10 > [v6 range])
      {
        int64_t v8 = 1;
        goto LABEL_7;
      }
      [(CRLWPSelection *)self range];
      unint64_t v12 = v11;
      [v6 range];
      if (v12 >= v13)
      {
        [(CRLWPSelection *)self range];
        unint64_t v15 = v14;
        [v6 range];
        int64_t v8 = v15 > v16;
        goto LABEL_7;
      }
    }
    int64_t v8 = -1;
  }
  else
  {
    int64_t v8 = 0;
  }
LABEL_7:

  return v8;
}

- (BOOL)isVisual
{
  return self->_type == 7;
}

- (BOOL)isRange
{
  return self->_range.length && self->_range.location != 0x7FFFFFFFFFFFFFFFLL;
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
  return ![(CRLWPSelection *)self isValid];
}

- (BOOL)allowsKeyCommandCaching
{
  return 1;
}

- (BOOL)isEquivalentForInsertionStyle:(id)a3
{
  id v4 = (CRLWPSelection *)a3;
  if (v4 == self)
  {
    BOOL v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [(CRLWPSelection *)self range];
      uint64_t v7 = v6;
      BOOL v9 = 0;
      if (v5 == [(CRLWPSelection *)v4 range] && v7 == v8) {
        BOOL v9 = self->_type == v4->_type;
      }
    }
    else
    {
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (id)copyWithNewType:(unint64_t)a3 smartFieldRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v8 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v10) = self->_leadingEdge;
  return [v8 initWithType:a3 range:self->_range.location, self->_range.length styleInsertionBehavior:self->_styleInsertionBehavior caretAffinity:self->_caretAffinity smartFieldRange:location, length leadingEdge:v10 leadingCharIndex:self->_leadingCharIndex];
}

- (id)copyWithNewType:(unint64_t)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  if (a3 == 6) {
    p_smartFieldRange = &self->_smartFieldRange;
  }
  else {
    p_smartFieldRange = (_NSRange *)&xmmword_101176F48;
  }
  NSUInteger v9 = p_smartFieldRange->location;
  NSUInteger v10 = p_smartFieldRange->length;
  id v11 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v13) = self->_leadingEdge;
  return [v11 initWithType:a3 range:location length:length styleInsertionBehavior:self->_styleInsertionBehavior caretAffinity:self->_caretAffinity smartFieldRange:v9 leadingEdge:v10 leadingCharIndex:location];
}

- (id)copyWithNewVisualTypeRange:(_NSRange)a3 head:(unint64_t)a4 tail:(unint64_t)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v10 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v13) = self->_leadingEdge;
  id v11 = [v10 initWithType:7 range:location length:length styleInsertionBehavior:self->_styleInsertionBehavior caretAffinity:self->_caretAffinity smartFieldRange:self->_smartFieldRange.location, self->_smartFieldRange.length leadingEdge:v13 leadingCharIndex:self->_leadingCharIndex];
  [v11 setHeadCharIndex:a4 tailCharIndex:a5];
  return v11;
}

- (id)copyWithNewType:(unint64_t)a3
{
  if (a3 == 6) {
    p_smartFieldRange = &self->_smartFieldRange;
  }
  else {
    p_smartFieldRange = (_NSRange *)&xmmword_101176F48;
  }
  NSUInteger location = p_smartFieldRange->location;
  NSUInteger length = p_smartFieldRange->length;
  id v8 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v10) = self->_leadingEdge;
  return [v8 initWithType:a3 range:self->_range.location, self->_range.length styleInsertionBehavior:self->_styleInsertionBehavior caretAffinity:self->_caretAffinity smartFieldRange:location, length leadingEdge:v10 leadingCharIndex:self->_leadingCharIndex];
}

- (id)copyWithNewRange:(_NSRange)a3
{
  return -[CRLWPSelection copyWithNewRange:newCaretAffinity:](self, "copyWithNewRange:newCaretAffinity:", a3.location, a3.length, self->_caretAffinity);
}

- (id)copyWithNewRange:(_NSRange)a3 newCaretAffinity:(unint64_t)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  LOBYTE(v11) = 1;
  uint64_t v7 = [objc_alloc((Class)objc_opt_class()) initWithType:self->_type range:location a3.length self->_styleInsertionBehavior:a4 self->_smartFieldRange.location self->_smartFieldRange.length v11 location];
  id v8 = v7;
  if (v7)
  {
    if (location == self->_range.location && length == self->_range.length)
    {
      if (self->_type == 7 && self->_validVisualRanges)
      {
        [v7 i_setVisualRanges:self->_visualRanges];
        [v8 setHeadCharIndex:self->_headCharIndex tailCharIndex:self->_tailCharIndex];
      }
    }
    else
    {
      v7[9] = 0;
    }
  }
  return v8;
}

- (id)copyWithNewStyleInsertionBehavior:(int)a3 newCaretAffinity:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  NSUInteger location = self->_range.location;
  NSUInteger length = self->_range.length;
  BOOL leadingEdge = self->_leadingEdge;
  if (!a4 && self->_caretAffinity == 1)
  {
    if ([(CRLWPSelection *)self isInsertionPoint]) {
      NSUInteger location = self->_leadingCharIndex;
    }
    BOOL leadingEdge = 1;
  }
  LOBYTE(v11) = leadingEdge;
  return [objc_alloc((Class)objc_opt_class()) initWithType:self->_type range:location length:v5 styleInsertionBehavior:v5 smartFieldRange:self->_smartFieldRange.location self->_smartFieldRange.length caretAffinity:v11 leadingEdge:v11 leadingCharIndex:self->_leadingCharIndex];
}

- (id)constrainToRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v5 = self;
  v18.NSUInteger location = (NSUInteger)[(CRLWPSelection *)v5 range];
  NSUInteger v6 = v18.location;
  NSUInteger v7 = v18.length;
  v19.NSUInteger location = location;
  v19.NSUInteger length = length;
  NSUInteger v8 = sub_1002093DC(v18, v19, 1);
  if (v8 != v6 || v9 != v7)
  {
    BOOL v10 = v8 == 0x7FFFFFFFFFFFFFFFLL;
    BOOL v11 = v9 == 0;
    if (v6 + v7 <= location + length) {
      NSUInteger v12 = location;
    }
    else {
      NSUInteger v12 = location + length;
    }
    if (v10 && v11) {
      NSUInteger v13 = v12;
    }
    else {
      NSUInteger v13 = v8;
    }
    if (v10 && v11) {
      uint64_t v14 = 0;
    }
    else {
      uint64_t v14 = v9;
    }
    unint64_t v15 = -[CRLWPSelection copyWithNewRange:](v5, "copyWithNewRange:", v13, v14);

    uint64_t v5 = v15;
  }

  return v5;
}

- (id)copyWithNewVisualRanges:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  id v6 = [v4 superRange];
  LOBYTE(v10) = self->_leadingEdge;
  id v8 = [v5 initWithType:7 range:v6 styleInsertionBehavior:self->_styleInsertionBehavior caretAffinity:self->_caretAffinity smartFieldRange:self->_smartFieldRange.location leadingEdge:self->_smartFieldRange.length leadingCharIndex:self->_leadingCharIndex];
  [v8 i_setVisualRanges:v4];

  return v8;
}

- (id)copyWithVisualRanges:(id)a3 headCharIndex:(unint64_t)a4 tailCharIndex:(unint64_t)a5 rightToLeft:(BOOL)a6 sameLine:(BOOL)a7
{
  BOOL v21 = a7;
  BOOL v7 = a6;
  id v11 = a3;
  if (self->_type != 7)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FD200);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B8540();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FD220);
    }
    NSUInteger v12 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    NSUInteger v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPSelection copyWithVisualRanges:headCharIndex:tailCharIndex:rightToLeft:sameLine:]");
    uint64_t v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPSelection.mm"];
    +[CRLAssertionHandler handleFailureInFunction:v13 file:v14 lineNumber:482 isFatal:0 description:"Selection type must be visual"];
  }
  id v15 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v20) = self->_leadingEdge;
  id v16 = [v15 initWithType:self->_type range:self->_range.location, self->_range.length styleInsertionBehavior:self->_styleInsertionBehavior caretAffinity:self->_caretAffinity smartFieldRange:self->_smartFieldRange.location, self->_smartFieldRange.length leadingEdge:v20 leadingCharIndex:self->_leadingCharIndex];
  [v16 i_setVisualRanges:v11];
  if (v21 && v7) {
    unint64_t v17 = a5;
  }
  else {
    unint64_t v17 = a4;
  }
  if (v21 && v7) {
    unint64_t v18 = a4;
  }
  else {
    unint64_t v18 = a5;
  }
  [v16 setHeadCharIndex:v17 tailCharIndex:v18];

  return v16;
}

- (unint64_t)end
{
  return self->_range.length + self->_range.location;
}

- (_NSRange)superRange
{
  if (self->_type == 7
    && [(CRLWPSelection *)self isRange]
    && [(CRLWPRangeArray *)self->_visualRanges rangeCount])
  {
    visualRanges = self->_visualRanges;
    id v4 = [(CRLWPRangeArray *)visualRanges superRange];
  }
  else
  {
    id v4 = [(CRLWPSelection *)self range];
  }
  result.NSUInteger length = v5;
  result.NSUInteger location = (NSUInteger)v4;
  return result;
}

- (void)i_setVisualRanges:(id)a3
{
  id v6 = a3;
  id v4 = (CRLWPRangeArray *)[v6 copy];
  visualRanges = self->_visualRanges;
  self->_visualRanges = v4;

  [(CRLWPRangeArray *)self->_visualRanges enumerateRanges:&stru_1014FD260];
  self->_validVisualRanges = 1;
}

- (id)visualRanges
{
  return self->_visualRanges;
}

- (id)i_visualRanges
{
  return self->_visualRanges;
}

- (id)visualRangesArray
{
  if (self->_type == 7 && !self->_validVisualRanges && [(CRLWPSelection *)self isRange])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FD2C0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B8650();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FD2E0);
    }
    id v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPSelection visualRangesArray]");
    NSUInteger v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPSelection.mm"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:544 isFatal:0 description:"Visual ranges have not been calculated"];
  }
  unint64_t v6 = [(CRLWPRangeArray *)self->_visualRanges rangeCount];
  if (v6 < 2)
  {
    id v11 = [(CRLWPSelection *)self superRange];
    uint64_t v10 = +[NSValue valueWithRange:](NSValue, "valueWithRange:", v11, v12);
    id v9 = +[NSMutableArray arrayWithObject:v10];
  }
  else
  {
    BOOL v7 = +[NSMutableArray arrayWithCapacity:v6];
    visualRanges = self->_visualRanges;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10048892C;
    v14[3] = &unk_1014FD308;
    id v9 = v7;
    id v15 = v9;
    [(CRLWPRangeArray *)visualRanges enumerateRanges:v14];
    uint64_t v10 = v15;
  }

  return v9;
}

- (void)setHeadCharIndex:(unint64_t)a3 tailCharIndex:(unint64_t)a4
{
  self->_headCharIndex = a3;
  self->_tailCharIndex = a4;
}

- (unint64_t)visualRangeCount
{
  return [(CRLWPRangeArray *)self->_visualRanges rangeCount];
}

- (BOOL)containsCharacterAtIndex:(unint64_t)a3
{
  NSUInteger location = self->_range.location;
  BOOL v5 = a3 >= location;
  NSUInteger v4 = a3 - location;
  BOOL v5 = !v5 || v4 >= self->_range.length;
  return !v5;
}

- (BOOL)containsCharacterAtIndex:(unint64_t)a3 withOptions:(unint64_t)a4
{
  char v4 = a4;
  [(CRLWPSelection *)self visualRangesArray];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = [*(id *)(*((void *)&v14 + 1) + 8 * i) rangeValue:v14];
        if (sub_1001CEDC4(a3, 0, (uint64_t)v10, v11, v4))
        {
          BOOL v12 = 1;
          goto LABEL_11;
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 0;
LABEL_11:

  return v12;
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

- (id)description
{
  uint64_t v4 = objc_opt_class();
  BOOL v5 = sub_100485EAC(self->_type);
  unint64_t type = self->_type;
  id v7 = NSStringFromRange(self->_range);
  BOOL validVisualRanges = self->_validVisualRanges;
  if (self->_validVisualRanges)
  {
    v2 = [(CRLWPSelection *)self visualRangesArray];
    BOOL v9 = [v2 description];
  }
  else
  {
    BOOL v9 = @"not set";
  }
  unsigned int v10 = [(CRLWPSelection *)self isAtEndOfLine];
  unint64_t v11 = [(CRLWPSelection *)self insertionEdge];
  CFStringRef v12 = @".start";
  if (v10) {
    CFStringRef v12 = @".end";
  }
  CFStringRef v13 = @".trailing";
  if (!v11) {
    CFStringRef v13 = @".leading";
  }
  if (self->_leadingEdge) {
    CFStringRef v14 = @"YES";
  }
  else {
    CFStringRef v14 = @"NO";
  }
  long long v15 = +[NSString stringWithFormat:@"(%@*) %p: type: %@(%lu), %@, visual ranges: %@, caretAffinity: %@, insertionEdge: %@, leadingEdge: %@", v4, self, v5, type, v7, v9, v12, v13, v14];
  if (validVisualRanges)
  {
  }

  return v15;
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

- (unint64_t)type
{
  return self->_type;
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

- (unint64_t)headCharIndex
{
  return self->_headCharIndex;
}

- (void)setHeadCharIndex:(unint64_t)a3
{
  self->_headCharIndex = a3;
}

- (unint64_t)tailCharIndex
{
  return self->_tailCharIndex;
}

- (void)setTailCharIndex:(unint64_t)a3
{
  self->_tailCharIndex = a3;
}

- (BOOL)leadingEdge
{
  return self->_leadingEdge;
}

- (unint64_t)leadingCharIndex
{
  return self->_leadingCharIndex;
}

- (BOOL)validVisualRanges
{
  return self->_validVisualRanges;
}

- (int)styleInsertionBehavior
{
  return self->_styleInsertionBehavior;
}

- (unint64_t)caretAffinity
{
  return self->_caretAffinity;
}

- (unint64_t)headCursorAffinity
{
  return self->_headCursorAffinity;
}

- (void)setHeadCursorAffinity:(unint64_t)a3
{
  self->_headCursorAffinity = a3;
}

- (unint64_t)tailCursorAffinity
{
  return self->_tailCursorAffinity;
}

- (void)setTailCursorAffinity:(unint64_t)a3
{
  self->_tailCursorAffinity = a3;
}

- (void).cxx_destruct
{
}

@end
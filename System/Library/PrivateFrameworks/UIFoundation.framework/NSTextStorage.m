@interface NSTextStorage
+ (BOOL)supportsSecureCoding;
+ (NSTextStorage)allocWithZone:(_NSZone *)a3;
+ (void)initialize;
- (BOOL)_attributeFixingInProgress;
- (BOOL)_forceFixAttributes;
- (BOOL)_isEditing;
- (BOOL)_isSwiftAttributedString;
- (BOOL)_lockForReading;
- (BOOL)_lockForWriting;
- (BOOL)_lockForWritingWithExceptionHandler:(BOOL)a3;
- (BOOL)_shouldFixFontAttributes;
- (BOOL)_shouldSetOriginalFontAttribute;
- (BOOL)_usesSimpleTextEffects;
- (BOOL)beginEditTrackingForContextRange:(_NSRange)a3;
- (BOOL)ensuresFixingAttributes;
- (BOOL)ensuresFixingFontAttributes;
- (BOOL)fixesAttributesLazily;
- (Class)_intentResolver;
- (NSArray)layoutManagers;
- (NSInteger)changeInLength;
- (NSRange)editedRange;
- (NSTextStorage)init;
- (NSTextStorage)initWithCoder:(id)a3;
- (NSTextStorageEditActions)editedMask;
- (NSWritingToolsEditTracker)_editingTracker;
- (_NSRange)_rangeByEstimatingAttributeFixingForRange:(_NSRange)a3;
- (_NSRange)endEditTracking;
- (id)cuiCatalog;
- (id)cuiStyleEffects;
- (id)delegate;
- (id)textStorageObserver;
- (void)_fixAttributesInRange:(_NSRange)a3;
- (void)_notifyEdited:(unint64_t)a3 range:(_NSRange)a4 changeInLength:(int64_t)a5 invalidatedRange:(_NSRange)a6;
- (void)_setEditedRange:(_NSRange)a3;
- (void)_setIntentResolver:(Class)a3;
- (void)_setShouldSetOriginalFontAttribute:(BOOL)a3;
- (void)addLayoutManager:(NSLayoutManager *)aLayoutManager;
- (void)beginEditing;
- (void)coordinateAccess:(id)a3;
- (void)coordinateEditing:(id)a3;
- (void)coordinateReading:(id)a3;
- (void)dealloc;
- (void)edited:(NSTextStorageEditActions)editedMask range:(NSRange)editedRange changeInLength:(NSInteger)delta;
- (void)encodeWithCoder:(id)a3;
- (void)endEditing;
- (void)ensureAttributesAreFixedInRange:(NSRange)range;
- (void)finalize;
- (void)fixFontAttributeInRange:(_NSRange)a3;
- (void)fixGlyphInfoAttributeInRange:(_NSRange)a3;
- (void)fontSetChanged;
- (void)invalidateAttributesInRange:(NSRange)range;
- (void)processEditing;
- (void)removeLayoutManager:(NSLayoutManager *)aLayoutManager;
- (void)setDelegate:(id)delegate;
- (void)setEditedMask:(unint64_t)a3;
- (void)setEnsuresFixingAttributes:(BOOL)a3;
- (void)setEnsuresFixingFontAttributes:(BOOL)a3;
- (void)setTextStorageObserver:(id)textStorageObserver;
- (void)set_isSwiftAttributedString:(BOOL)a3;
@end

@implementation NSTextStorage

- (NSTextStorageEditActions)editedMask
{
  return (NSTextStorageEditActions)self->_flags;
}

- (void)setEnsuresFixingAttributes:(BOOL)a3
{
  self->_ensuresFixingAttributes = a3;
}

- (BOOL)ensuresFixingAttributes
{
  return self->_ensuresFixingAttributes;
}

- (NSInteger)changeInLength
{
  return self->_editedDelta;
}

- (NSRange)editedRange
{
  p_editedRange = &self->_editedRange;
  NSUInteger location = self->_editedRange.location;
  NSUInteger length = p_editedRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)dealloc
{
  layoutManagers = self->_layoutManagers;
  if (layoutManagers)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __24__NSTextStorage_dealloc__block_invoke;
    v5[3] = &unk_1E55C7A60;
    v5[4] = self;
    [(NSMutableArray *)layoutManagers enumerateObjectsUsingBlock:v5];
  }
  [(NSTextStorage *)self setTextStorageObserver:0];
  if (self->_sideData)
  {
    [(NSTextStorage *)self setDelegate:0];
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:", self);

  self->_editingTracker = 0;
  if ((unint64_t)[(NSTextStorage *)self retainCount] < 2)
  {
    v4.receiver = self;
    v4.super_class = (Class)NSTextStorage;
    [(NSTextStorage *)&v4 dealloc];
  }
  else
  {
  }
}

- (NSTextStorage)init
{
  v7.receiver = self;
  v7.super_class = (Class)NSTextStorage;
  v2 = [(NSTextStorage *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_layoutManagers = (NSMutableArray *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CA48], "allocWithZone:", -[NSTextStorage zone](v2, "zone")), "initWithCapacity:", 1);
    v3->_editedRange = (_NSRange)xmmword_18E5F72A0;
    v3->_flags = ($476B385495589A9445B0874D003C362D)(*((unsigned __int8 *)&v3->_flags + 1) << 8);
    uint64_t v4 = objc_opt_new();
    v3->_sideData = (id)v4;
    objc_storeWeak((id *)(v4 + 8), 0);
    *((_OWORD *)v3->_sideData + 1) = xmmword_18E5F72A0;
    v5 = (objc_class *)objc_opt_class();
    if ([NSStringFromClass(v5) isEqualToString:@"SwiftUI.NSSwiftMutableAttributedString"])
    {
      [(NSTextStorage *)v3 _setForceFixAttributes:0];
      [(NSTextStorage *)v3 setEnsuresFixingAttributes:0];
      [(NSTextStorage *)v3 set_isSwiftAttributedString:1];
    }
    else
    {
      [(NSTextStorage *)v3 _setForceFixAttributes:1];
      [(NSTextStorage *)v3 setEnsuresFixingAttributes:1];
    }
  }
  return v3;
}

- (void)setTextStorageObserver:(id)textStorageObserver
{
}

- (void)_setShouldSetOriginalFontAttribute:(BOOL)a3
{
  self->_shouldSetOriginalFontAttribute = a3;
}

- (BOOL)_isSwiftAttributedString
{
  return self->__isSwiftAttributedString;
}

- (void)setDelegate:(id)delegate
{
  id v5 = [(NSTextStorage *)self delegate];
  if (v5 != delegate)
  {
    id v6 = v5;
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:name:object:", v5, @"NSTextStorageWillProcessEditingNotification", self);
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:name:object:", v6, @"NSTextStorageDidProcessEditingNotification", self);
    sideData = (id *)self->_sideData;
    if (sideData) {
      objc_storeWeak(sideData + 1, delegate);
    }
    id v8 = [(NSTextStorage *)self delegate];
    if (objc_opt_respondsToSelector()) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "addObserver:selector:name:object:", v8, sel_textStorageWillProcessEditing_, @"NSTextStorageWillProcessEditingNotification", self);
    }
    if (objc_opt_respondsToSelector()) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "addObserver:selector:name:object:", v8, sel_textStorageDidProcessEditing_, @"NSTextStorageDidProcessEditingNotification", self);
    }
    if (objc_opt_respondsToSelector()) {
      int v9 = 256;
    }
    else {
      int v9 = 0;
    }
    self->_flags = ($476B385495589A9445B0874D003C362D)(*(_DWORD *)&self->_flags & 0xFFFFFEFF | v9);
    if (objc_opt_respondsToSelector()) {
      int v10 = 512;
    }
    else {
      int v10 = 0;
    }
    self->_flags = ($476B385495589A9445B0874D003C362D)(*(_DWORD *)&self->_flags & 0xFFFFFDFF | v10);
  }
}

- (id)delegate
{
  sideData = (id *)self->_sideData;
  if (sideData) {
    return objc_loadWeak(sideData + 1);
  }
  else {
    return 0;
  }
}

- (void)coordinateReading:(id)a3
{
  BOOL v5 = [(NSTextStorage *)self _lockForReading];
  (*((void (**)(id, NSTextStorage *))a3 + 2))(a3, self);
  if (v5)
  {
    [(NSTextStorage *)self _unlock];
  }
}

- (BOOL)_lockForReading
{
  return 0;
}

- (void)ensureAttributesAreFixedInRange:(NSRange)range
{
  NSUInteger length = range.length;
  NSUInteger location = range.location;
  if ((*(_DWORD *)&self->_flags < 0x10000u || [(NSTextStorage *)self _forceFixAttributes])
    && location != 0x7FFFFFFFFFFFFFFFLL)
  {
    sideData = self->_sideData;
    NSUInteger v7 = sideData[2];
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v8 = sideData[3];
      if (location <= v7) {
        NSUInteger v9 = v7;
      }
      else {
        NSUInteger v9 = location;
      }
      NSUInteger v10 = location + length;
      NSUInteger v11 = v8 + v7;
      if (location + length >= v8 + v7) {
        NSUInteger v10 = v8 + v7;
      }
      BOOL v12 = v10 > v9;
      NSUInteger v13 = v10 - v9;
      if (v12) {
        NSUInteger v14 = v13;
      }
      else {
        NSUInteger v14 = 0;
      }
      if (v12) {
        NSUInteger v15 = v9;
      }
      else {
        NSUInteger v15 = 0x7FFFFFFFFFFFFFFFLL;
      }
      if (v15 != 0x7FFFFFFFFFFFFFFFLL)
      {
        NSUInteger v16 = v15 - v7;
        if (v15 > v7)
        {
          BOOL v12 = v11 > v15 + v14;
          NSUInteger v17 = v11 - (v15 + v14);
          if (v12 && v17 >= v16)
          {
            v14 += v16;
            NSUInteger v15 = v7;
          }
          else
          {
            unint64_t v18 = [(NSTextStorage *)self _rangeByEstimatingAttributeFixingForRange:v15];
            v19 = self->_sideData;
            NSUInteger v7 = v19[2];
            uint64_t v8 = v19[3];
            if (v18 <= v7) {
              NSUInteger v15 = v7;
            }
            else {
              NSUInteger v15 = v18;
            }
            NSUInteger v14 = v8 + v7 - v15;
          }
        }
        unint64_t v20 = v8 + v7;
        uint64_t v21 = v20 - v15;
        BOOL v12 = v15 + 0x10000 > v20;
        uint64_t v22 = 0x10000;
        if (v12) {
          uint64_t v22 = v21;
        }
        if (v14 >> 16) {
          NSUInteger v23 = v14;
        }
        else {
          NSUInteger v23 = v22;
        }
        unint64_t v24 = [(NSTextStorage *)self length];
        if (v23 + v15 <= v24) {
          NSUInteger v25 = v23;
        }
        else {
          NSUInteger v25 = v24 - v15;
        }
        BOOL v26 = [(NSTextStorage *)self _lockForWriting];
        $476B385495589A9445B0874D003C362D flags = self->_flags;
        *((_WORD *)&self->_flags + 1) = ((*(_DWORD *)&flags & 0xFFFF0000) + 0x10000) >> 16;
        _NSRange editedRange = self->_editedRange;
        int64_t editedDelta = self->_editedDelta;
        char v29 = (char)flags;
        self->_editedRange.NSUInteger location = v15;
        self->_editedRange.NSUInteger length = v25;
        self->_int64_t editedDelta = 0;
        v30 = self->_sideData;
        unint64_t v31 = v30[2];
        if (v15 <= v31)
        {
          if (v25 == v30[3])
          {
            *((_OWORD *)v30 + 1) = xmmword_18E5F72A0;
          }
          else
          {
            v30[2] = v31 + v25;
            *((void *)self->_sideData + 3) -= v25;
          }
        }
        else
        {
          v30[3] = v15 - v31;
        }
        -[NSTextStorage _setForceFixAttributes:](self, "_setForceFixAttributes:", 0, editedRange);
        -[NSTextStorage _fixAttributesInRange:](self, "_fixAttributesInRange:", v15, v25);
        [(NSTextStorage *)self _setForceFixAttributes:1];
        *((_WORD *)&self->_flags + 1) = ((*((unsigned __int16 *)&self->_flags + 1) << 16) - 0x10000) >> 16;
        self->__NSRange editedRange = v33;
        self->_int64_t editedDelta = editedDelta;
        *(unsigned char *)&self->_$476B385495589A9445B0874D003C362D flags = v29;
        if (v26)
        {
          [(NSTextStorage *)self _unlock];
        }
      }
    }
  }
}

- (void)beginEditing
{
  [(NSTextStorage *)self _lockForWriting];
  $476B385495589A9445B0874D003C362D flags = self->_flags;
  if (!HIWORD(*(unsigned int *)&flags))
  {
    objc_msgSend(-[NSTextStorage textStorageObserver](self, "textStorageObserver"), "beginEditingTransaction");
    $476B385495589A9445B0874D003C362D flags = self->_flags;
  }
  self->_$476B385495589A9445B0874D003C362D flags = ($476B385495589A9445B0874D003C362D)(*(_DWORD *)&flags + 0x10000);
}

- (BOOL)_lockForWriting
{
  return [(NSTextStorage *)self _lockForWritingWithExceptionHandler:1];
}

- (id)textStorageObserver
{
  return objc_loadWeak((id *)&self->_textStorageObserver);
}

- (BOOL)_lockForWritingWithExceptionHandler:(BOOL)a3
{
  return 0;
}

- (void)coordinateEditing:(id)a3
{
}

- (void)endEditing
{
  $476B385495589A9445B0874D003C362D flags = self->_flags;
  if (*(unsigned int *)&flags >> 17)
  {
    self->_$476B385495589A9445B0874D003C362D flags = ($476B385495589A9445B0874D003C362D)(*(_DWORD *)&flags - 0x10000);
  }
  else
  {
    if (self->_editedRange.location != 0x7FFFFFFFFFFFFFFFLL)
    {
      self->_$476B385495589A9445B0874D003C362D flags = ($476B385495589A9445B0874D003C362D)((unsigned __int16)*(_DWORD *)&self->_flags | 0x10000);
      [(NSTextStorage *)self processEditing];
      self->_editedRange.NSUInteger location = 0x7FFFFFFFFFFFFFFFLL;
      self->_int64_t editedDelta = 0;
      $476B385495589A9445B0874D003C362D flags = self->_flags;
    }
    self->_$476B385495589A9445B0874D003C362D flags = ($476B385495589A9445B0874D003C362D)(*(_WORD *)&flags & 0xFF00);
    objc_msgSend(-[NSTextStorage textStorageObserver](self, "textStorageObserver"), "endEditingTransaction");
  }

  [(NSTextStorage *)self _unlock];
}

- (void)fixGlyphInfoAttributeInRange:(_NSRange)a3
{
  if (self->_fontFixingDisabledCount <= 0)
  {
    v3.receiver = self;
    v3.super_class = (Class)NSTextStorage;
    -[NSMutableAttributedString fixGlyphInfoAttributeInRange:](&v3, sel_fixGlyphInfoAttributeInRange_, a3.location, a3.length);
  }
}

- (void)fixFontAttributeInRange:(_NSRange)a3
{
  if (self->_fontFixingDisabledCount <= 0)
  {
    v3.receiver = self;
    v3.super_class = (Class)NSTextStorage;
    -[NSMutableAttributedString fixFontAttributeInRange:](&v3, sel_fixFontAttributeInRange_, a3.location, a3.length);
  }
}

- (Class)_intentResolver
{
  Class result = self->_intentResolver;
  if (!result)
  {
    v4.receiver = self;
    v4.super_class = (Class)NSTextStorage;
    return [(NSTextStorage *)&v4 _intentResolver];
  }
  return result;
}

- (void)processEditing
{
  uint64_t v3 = [(NSMutableArray *)self->_layoutManagers count];
  objc_super v4 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 postNotificationName:@"NSTextStorageWillProcessEditingNotification" object:self];
  if (*((unsigned char *)&self->_flags + 1)) {
    objc_msgSend(-[NSTextStorage delegate](self, "delegate"), "textStorage:willProcessEditing:range:changeInLength:", self, *(unsigned char *)&self->_flags, self->_editedRange.location, self->_editedRange.length, self->_editedDelta);
  }
  NSUInteger location = self->_editedRange.location;
  NSUInteger length = self->_editedRange.length;
  -[NSTextStorage invalidateAttributesInRange:](self, "invalidateAttributesInRange:", location, length);
  [v4 postNotificationName:@"NSTextStorageDidProcessEditingNotification" object:self];
  if ((*((unsigned char *)&self->_flags + 1) & 2) != 0) {
    objc_msgSend(-[NSTextStorage delegate](self, "delegate"), "textStorage:didProcessEditing:range:changeInLength:", self, *(unsigned char *)&self->_flags, self->_editedRange.location, self->_editedRange.length, self->_editedDelta);
  }
  if (v3 || ![(NSMutableArray *)self->_layoutManagers count])
  {
    uint64_t flags = (uint64_t)self->_flags;
    int64_t editedDelta = self->_editedDelta;
    NSUInteger v9 = self->_editedRange.location;
    NSUInteger v10 = self->_editedRange.length;
    -[NSTextStorage _notifyEdited:range:changeInLength:invalidatedRange:](self, "_notifyEdited:range:changeInLength:invalidatedRange:", flags, location, length, editedDelta, v9, v10);
  }
}

- (void)invalidateAttributesInRange:(NSRange)range
{
  NSUInteger length = range.length;
  NSUInteger location = range.location;
  if ([(NSTextStorage *)self fixesAttributesLazily]
    || ![(NSTextStorage *)self ensuresFixingAttributes])
  {
    sideData = self->_sideData;
    NSUInteger v7 = sideData[2];
    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    {
      sideData[2] = location;
      sideData[3] = length;
    }
    else
    {
      uint64_t v8 = sideData[3];
      if (v7 >= location) {
        NSUInteger v9 = location;
      }
      else {
        NSUInteger v9 = sideData[2];
      }
      NSUInteger v10 = v8 + v7;
      if (v8 + v7 <= location + length) {
        NSUInteger v10 = location + length;
      }
      NSUInteger v11 = v10 - v9;
      if (location == 0x7FFFFFFFFFFFFFFFLL)
      {
        NSUInteger v12 = sideData[3];
      }
      else
      {
        NSUInteger v7 = v9;
        NSUInteger v12 = v11;
      }
      sideData[2] = v7;
      sideData[3] = v12;
    }
    if ([(NSTextStorage *)self _isEditing])
    {
      NSUInteger v13 = self->_editedRange.location;
      if (v13 != 0x7FFFFFFFFFFFFFFFLL)
      {
        self->_editedRange.NSUInteger location = -[NSTextStorage _rangeByEstimatingAttributeFixingForRange:](self, "_rangeByEstimatingAttributeFixingForRange:", v13, self->_editedRange.length);
        self->_editedRange.NSUInteger length = v14;
      }
    }
  }
  else
  {
    -[NSTextStorage _fixAttributesInRange:](self, "_fixAttributesInRange:", location, length);
  }
}

- (void)_fixAttributesInRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  BOOL v6 = [(NSTextStorage *)self _shouldFixFontAttributes];
  if (!v6) {
    ++self->_fontFixingDisabledCount;
  }
  -[NSMutableAttributedString fixAttributesInRange:](self, "fixAttributesInRange:", location, length);
  if (!v6) {
    --self->_fontFixingDisabledCount;
  }
}

- (BOOL)_shouldFixFontAttributes
{
  if (!self->_ensuresFixingAttributes) {
    return 0;
  }
  if (self->_ensuresFixingFontAttributes
    || [(NSArray *)[(NSTextStorage *)self layoutManagers] count])
  {
    return 1;
  }
  return self->_textStorageObserver == 0;
}

- (NSArray)layoutManagers
{
  return &self->_layoutManagers->super;
}

- (void)_notifyEdited:(unint64_t)a3 range:(_NSRange)a4 changeInLength:(int64_t)a5 invalidatedRange:(_NSRange)a6
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  NSUInteger v9 = a4.length;
  NSUInteger v10 = a4.location;
  uint64_t v13 = [(NSMutableArray *)self->_layoutManagers count];
  if (v13)
  {
    uint64_t v14 = v13 - 1;
    do
      objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_layoutManagers, "objectAtIndex:", v14--), "processEditingForTextStorage:edited:range:changeInLength:invalidatedRange:", self, a3, v10, v9, a5, location, length);
    while (v14 != -1);
  }
  objc_msgSend(-[NSTextStorage textStorageObserver](self, "textStorageObserver"), "processEditingForTextStorage:edited:range:changeInLength:invalidatedRange:", self, a3, v10, v9, a5, location, length);
}

- (BOOL)fixesAttributesLazily
{
  return 0;
}

- (BOOL)_attributeFixingInProgress
{
  return 0;
}

- (void)edited:(NSTextStorageEditActions)editedMask range:(NSRange)editedRange changeInLength:(NSInteger)delta
{
  NSUInteger length = editedRange.length;
  NSUInteger location = editedRange.location;
  p__NSRange editedRange = &self->_editedRange;
  NSUInteger v10 = self->_editedRange.location;
  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    p_editedRange->NSUInteger location = editedRange.location;
    self->_editedRange.NSUInteger length = editedRange.length + delta;
    NSInteger v11 = delta;
  }
  else
  {
    if (editedRange.location >= v10) {
      NSUInteger v12 = self->_editedRange.location;
    }
    else {
      NSUInteger v12 = editedRange.location;
    }
    NSUInteger v13 = self->_editedRange.length + v10;
    if (editedRange.location + editedRange.length > v13) {
      NSUInteger v13 = editedRange.location + editedRange.length;
    }
    p_editedRange->NSUInteger location = v12;
    self->_editedRange.NSUInteger length = delta - v12 + v13;
    NSInteger v11 = self->_editedDelta + delta;
  }
  self->_int64_t editedDelta = v11;
  if (delta)
  {
    sideData = self->_sideData;
    NSUInteger v16 = sideData + 2;
    NSUInteger v15 = sideData[2];
    if (v15 != 0x7FFFFFFFFFFFFFFFLL)
    {
      NSUInteger v17 = editedRange.location + editedRange.length;
      if (editedRange.location + editedRange.length > v15)
      {
        uint64_t v18 = sideData[3];
        if (v18 + v15 <= editedRange.location) {
          goto LABEL_22;
        }
        if (v15 >= editedRange.location) {
          NSUInteger v19 = editedRange.location;
        }
        else {
          NSUInteger v19 = sideData[2];
        }
        if (v18 + v15 > v17) {
          NSUInteger v17 = v18 + v15;
        }
        NSUInteger v20 = v17 - v19;
        if (editedRange.location != 0x7FFFFFFFFFFFFFFFLL)
        {
          NSUInteger v15 = v19;
          uint64_t v18 = v20;
        }
        sideData[2] = v15;
        sideData[3] = v18;
        uint64_t v21 = self->_sideData;
        NSUInteger v22 = v21[3];
        NSUInteger v16 = v21 + 3;
        NSUInteger v15 = v22;
      }
      *NSUInteger v16 = v15 + delta;
    }
  }
LABEL_22:
  $476B385495589A9445B0874D003C362D flags = self->_flags;
  $476B385495589A9445B0874D003C362D v24 = ($476B385495589A9445B0874D003C362D)(*(unsigned int *)&flags | editedMask);
  self->_$476B385495589A9445B0874D003C362D flags = v24;
  if (!HIWORD(*(unsigned int *)&flags))
  {
    if (p_editedRange->location != 0x7FFFFFFFFFFFFFFFLL)
    {
      self->_$476B385495589A9445B0874D003C362D flags = ($476B385495589A9445B0874D003C362D)((unsigned __int16)(*(_WORD *)&flags | editedMask) | 0x10000);
      [(NSTextStorage *)self processEditing];
      p_editedRange->NSUInteger location = 0x7FFFFFFFFFFFFFFFLL;
      self->_int64_t editedDelta = 0;
      $476B385495589A9445B0874D003C362D v24 = self->_flags;
    }
    self->_$476B385495589A9445B0874D003C362D flags = ($476B385495589A9445B0874D003C362D)(*(_DWORD *)&v24 & 0xFFFFFF00);
  }
  editingTracker = self->_editingTracker;
  if (editingTracker)
  {
    -[NSWritingToolsEditTracker addEditForRange:lengthDelta:](editingTracker, "addEditForRange:lengthDelta:", location, length, delta);
  }
}

+ (NSTextStorage)allocWithZone:(_NSZone *)a3
{
  objc_super v4 = (objc_class *)a1;
  if ((id)objc_opt_class() == a1) {
    objc_super v4 = (objc_class *)objc_opt_class();
  }

  return (NSTextStorage *)NSAllocateObject(v4, 0, a3);
}

+ (void)initialize
{
  uint64_t v2 = objc_opt_class();
  if (v2 == objc_opt_class())
  {
    char v3 = dyld_program_sdk_at_least();
    __NSAllowsMutableEditedRange = v3 ^ 1;
    if ((v3 & 1) == 0)
    {
      objc_super v4 = (objc_class *)objc_opt_class();
      InstanceMethod = class_getInstanceMethod(v4, sel__setEditedRange_);
      if (InstanceMethod)
      {
        BOOL v6 = InstanceMethod;
        Implementation = method_getImplementation(InstanceMethod);
        Description = method_getDescription(v6);
        NSUInteger v9 = (objc_class *)objc_opt_class();
        types = Description->types;
        class_addMethod(v9, sel_setEditedRange_, Implementation, types);
      }
    }
  }
}

- (void)_setIntentResolver:(Class)a3
{
  self->_intentResolver = a3;
}

- (void)coordinateAccess:(id)a3
{
  [(NSTextStorage *)self _lockForWriting];
  (*((void (**)(id, NSTextStorage *))a3 + 2))(a3, self);

  [(NSTextStorage *)self _unlock];
}

- (void)_setEditedRange:(_NSRange)a3
{
  if (__NSAllowsMutableEditedRange) {
    self->__NSRange editedRange = a3;
  }
}

uint64_t __24__NSTextStorage_dealloc__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t result = [a2 textStorage];
  if (v3 == result)
  {
    return [a2 setTextStorage:0];
  }
  return result;
}

- (void)finalize
{
  if (self->_sideData) {
    [(NSTextStorage *)self setDelegate:0];
  }
  v3.receiver = self;
  v3.super_class = (Class)NSTextStorage;
  [(NSTextStorage *)&v3 finalize];
}

- (void)encodeWithCoder:(id)a3
{
  if ([a3 allowsKeyedCoding])
  {
    id v5 = [(NSTextStorage *)self delegate];
    v6.receiver = self;
    v6.super_class = (Class)NSTextStorage;
    [(NSTextStorage *)&v6 encodeWithCoder:a3];
    [a3 encodeConditionalObject:v5 forKey:@"NSDelegate"];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)NSTextStorage;
    [(NSTextStorage *)&v7 encodeWithCoder:a3];
  }
}

- (NSTextStorage)initWithCoder:(id)a3
{
  if ([a3 allowsKeyedCoding])
  {
    v8.receiver = self;
    v8.super_class = (Class)NSTextStorage;
    id v5 = [(NSTextStorage *)&v8 initWithCoder:a3];
    uint64_t v6 = [a3 decodeObjectForKey:@"NSDelegate"];
    if (v6) {
      [(NSTextStorage *)v5 setDelegate:v6];
    }
    [(NSTextStorage *)v5 setEnsuresFixingAttributes:1];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)NSTextStorage;
    return [(NSTextStorage *)&v9 initWithCoder:a3];
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)addLayoutManager:(NSLayoutManager *)aLayoutManager
{
  uint64_t v5 = [(NSMutableArray *)self->_layoutManagers count];
  [(NSMutableArray *)self->_layoutManagers addObject:aLayoutManager];
  [(NSLayoutManager *)aLayoutManager setTextStorage:self];
  if (!v5 && ![(NSAttributedString *)self _isStringDrawingTextStorage])
  {
    layoutManagers = self->_layoutManagers;
    [(NSMutableArray *)layoutManagers count];
  }
}

- (void)removeLayoutManager:(NSLayoutManager *)aLayoutManager
{
  uint64_t v5 = self;
  [(NSLayoutManager *)aLayoutManager setTextStorage:0];
  uint64_t v6 = aLayoutManager;
  uint64_t v7 = [(NSMutableArray *)self->_layoutManagers indexOfObjectIdenticalTo:aLayoutManager];
  if (v7 != 0x7FFFFFFFFFFFFFFFLL) {
    [(NSMutableArray *)self->_layoutManagers removeObjectAtIndex:v7];
  }
  layoutManagers = self->_layoutManagers;

  [(NSMutableArray *)layoutManagers count];
}

- (BOOL)_forceFixAttributes
{
  return 0;
}

- (BOOL)_isEditing
{
  return *((_WORD *)&self->_flags + 1) != 0;
}

- (void)setEditedMask:(unint64_t)a3
{
  *(unsigned char *)&self->_$476B385495589A9445B0874D003C362D flags = a3;
}

- (_NSRange)_rangeByEstimatingAttributeFixingForRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v5 = (void *)[(NSTextStorage *)self string];

  NSUInteger v6 = objc_msgSend(v5, "paragraphRangeForRange:", location, length);
  result.NSUInteger length = v7;
  result.NSUInteger location = v6;
  return result;
}

- (void)fontSetChanged
{
  BOOL v3 = [(NSTextStorage *)self _lockForWriting];
  -[NSTextStorage invalidateAttributesInRange:](self, "invalidateAttributesInRange:", 0, [(NSTextStorage *)self length]);
  if (v3)
  {
    [(NSTextStorage *)self _unlock];
  }
}

- (BOOL)_shouldSetOriginalFontAttribute
{
  uint64_t v7 = 0;
  objc_super v8 = &v7;
  uint64_t v9 = 0x2020000000;
  BOOL shouldSetOriginalFontAttribute = self->_shouldSetOriginalFontAttribute;
  if ([(NSTextStorage *)self _attributeFixingInProgress])
  {
    BOOL v3 = [(NSTextStorage *)self layoutManagers];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __48__NSTextStorage__shouldSetOriginalFontAttribute__block_invoke;
    v6[3] = &unk_1E55C6D40;
    v6[4] = &v7;
    [(NSArray *)v3 enumerateObjectsUsingBlock:v6];
  }
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __48__NSTextStorage__shouldSetOriginalFontAttribute__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 allowsOriginalFontMetricsOverride];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (id)cuiCatalog
{
  return 0;
}

- (id)cuiStyleEffects
{
  return 0;
}

- (BOOL)_usesSimpleTextEffects
{
  return 0;
}

- (BOOL)beginEditTrackingForContextRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  NSUInteger v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  if (self->_editingTracker) {
    BOOL v8 = 0;
  }
  else {
    BOOL v8 = location + length <= [(NSTextStorage *)self length];
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __50__NSTextStorage_beginEditTrackingForContextRange___block_invoke;
  v10[3] = &unk_1E55C7A88;
  v10[4] = self;
  v10[5] = location;
  v10[6] = length;
  _UIFoundationAssert(self, v7, v8, v10);
  if (self->_editingTracker) {
    [(NSTextStorage *)self endEditTracking];
  }
  self->_editingTracker = -[NSWritingToolsEditTracker initWithContextRange:]([NSWritingToolsEditTracker alloc], "initWithContextRange:", location, length);
  return 0;
}

uint64_t __50__NSTextStorage_beginEditTrackingForContextRange___block_invoke(uint64_t a1)
{
  return [NSString stringWithFormat:@"Invalid beginEditTrackingForContextRange: length=%lul contextRange=%@ _editingTracke=%@", objc_msgSend(*(id *)(a1 + 32), "length"), NSStringFromRange(*(NSRange *)(a1 + 40)), *(void *)(*(void *)(a1 + 32) + 96)];
}

- (_NSRange)endEditTracking
{
  BOOL v3 = (objc_class *)objc_opt_class();
  char v4 = NSStringFromClass(v3);
  _UIFoundationAssert(self, v4, self->_editingTracker != 0, &__block_literal_global_26);
  editingTracker = self->_editingTracker;
  if (editingTracker)
  {
    uint64_t v6 = [(NSWritingToolsEditTracker *)editingTracker currentContextRange];
    NSUInteger v8 = v7;
    uint64_t v9 = self->_editingTracker;
  }
  else
  {
    uint64_t v9 = 0;
    NSUInteger v8 = 0;
    uint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  }

  self->_editingTracker = 0;
  NSUInteger v10 = v6;
  NSUInteger v11 = v8;
  result.NSUInteger length = v11;
  result.NSUInteger location = v10;
  return result;
}

uint64_t __32__NSTextStorage_endEditTracking__block_invoke()
{
  return [NSString stringWithFormat:@"Unmatched endEditingTracking"];
}

- (BOOL)ensuresFixingFontAttributes
{
  return self->_ensuresFixingFontAttributes;
}

- (void)setEnsuresFixingFontAttributes:(BOOL)a3
{
  self->_ensuresFixingFontAttributes = a3;
}

- (NSWritingToolsEditTracker)_editingTracker
{
  return (NSWritingToolsEditTracker *)objc_getProperty(self, a2, 96, 1);
}

- (void)set_isSwiftAttributedString:(BOOL)a3
{
  self->__isSwiftAttributedString = a3;
}

@end
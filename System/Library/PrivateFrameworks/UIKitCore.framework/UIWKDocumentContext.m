@interface UIWKDocumentContext
- ($0AC6E346AE4835514AAA8AC86D8F4844)directionalRangeForSelectionRange:(_NSRange)a3;
- (NSArray)autocorrectedRanges;
- (NSAttributedString)annotatedText;
- (NSMutableData)_selectionRects;
- (NSObject)contextAfter;
- (NSObject)contextBefore;
- (NSObject)markedText;
- (NSObject)selectedText;
- (NSString)_contextAfterString;
- (NSString)_contextBeforeString;
- (NSString)_markedTextString;
- (NSString)_selectedTextString;
- (NSString)fullText;
- (UIWKDocumentContext)init;
- (_NSRange)markedTextRange;
- (_NSRange)rangeContainedWithinRect:(CGRect)a3;
- (_NSRange)selectedRangeInMarkedText;
- (_NSRange)selectedTextRange;
- (id)characterRectsForCharacterRange:(_NSRange)a3;
- (id)stringContainedWithinRect:(CGRect)a3;
- (unint64_t)closestCharacterIndexForPoint:(CGPoint)a3;
- (void)addTextRect:(CGRect)a3 forCharacterRange:(_NSRange)a4;
- (void)dealloc;
- (void)enumerateLayoutRects:(id)a3;
- (void)enumerateLayoutRectsWithOptions:(unint64_t)a3 characterRange:(_NSRange)a4 block:(id)a5;
- (void)resetTextRects;
- (void)setAnnotatedText:(id)a3;
- (void)setAutocorrectedRanges:(id)a3;
- (void)setContextAfter:(id)a3;
- (void)setContextBefore:(id)a3;
- (void)setMarkedText:(id)a3;
- (void)setSelectedRangeInMarkedText:(_NSRange)a3;
- (void)setSelectedText:(id)a3;
- (void)set_selectionRects:(id)a3;
- (void)sortTextRectsByCharacterRange;
@end

@implementation UIWKDocumentContext

- (UIWKDocumentContext)init
{
  v3.receiver = self;
  v3.super_class = (Class)UIWKDocumentContext;
  result = [(UIWKDocumentContext *)&v3 init];
  if (result)
  {
    result->_selectedRangeInMarkedText = (_NSRange)xmmword_186B93450;
    result->_rectsAreInCharacterOrder = 1;
    result->_lastRectRange = (_NSRange)xmmword_186B93450;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)UIWKDocumentContext;
  [(UIWKDocumentContext *)&v3 dealloc];
}

- (NSString)_contextBeforeString
{
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  contextBefore = self->_contextBefore;
  if (isKindOfClass) {
    return (NSString *)&contextBefore->isa;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  v5 = self->_contextBefore;
  return (NSString *)[v5 string];
}

- (NSString)_selectedTextString
{
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  selectedText = self->_selectedText;
  if (isKindOfClass) {
    return (NSString *)&selectedText->isa;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  v5 = self->_selectedText;
  return (NSString *)[v5 string];
}

- (NSString)_contextAfterString
{
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  contextAfter = self->_contextAfter;
  if (isKindOfClass) {
    return (NSString *)&contextAfter->isa;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  v5 = self->_contextAfter;
  return (NSString *)[v5 string];
}

- (NSString)_markedTextString
{
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  markedText = self->_markedText;
  if (isKindOfClass) {
    return (NSString *)&markedText->isa;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  v5 = self->_markedText;
  return (NSString *)[v5 string];
}

- (_NSRange)selectedTextRange
{
  NSUInteger v3 = [(NSString *)[(UIWKDocumentContext *)self _contextBeforeString] length];
  NSUInteger v4 = [(NSString *)[(UIWKDocumentContext *)self _selectedTextString] length];
  if (v4)
  {
    NSUInteger length = v4;
  }
  else
  {
    NSUInteger location = self->_selectedRangeInMarkedText.location;
    if (location == 0x7FFFFFFFFFFFFFFFLL)
    {
      NSUInteger length = 0;
    }
    else
    {
      v3 += location;
      NSUInteger length = self->_selectedRangeInMarkedText.length;
    }
  }
  NSUInteger v7 = v3;
  result.NSUInteger length = length;
  result.NSUInteger location = v7;
  return result;
}

- (_NSRange)markedTextRange
{
  NSUInteger v3 = [(NSString *)[(UIWKDocumentContext *)self _contextBeforeString] length];
  NSUInteger v4 = v3 - [(UIWKDocumentContext *)self selectedRangeInMarkedText];
  NSUInteger v5 = [(NSString *)[(UIWKDocumentContext *)self _markedTextString] length];
  NSUInteger v6 = v4;
  result.NSUInteger length = v5;
  result.NSUInteger location = v6;
  return result;
}

- (void)resetTextRects
{
  self->_rectsAreInCharacterOrder = 1;
  self->_lastRectRange = (_NSRange)xmmword_186B93450;
}

- (void)addTextRect:(CGRect)a3 forCharacterRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (![(UIWKDocumentContext *)self _selectionRects]) {
    -[UIWKDocumentContext set_selectionRects:](self, "set_selectionRects:", [MEMORY[0x1E4F1CA58] dataWithCapacity:960]);
  }
  [(NSMutableData *)[(UIWKDocumentContext *)self _selectionRects] appendBytes:&v12 length:48];
  if (self->_rectsAreInCharacterOrder)
  {
    NSUInteger v11 = self->_lastRectRange.location;
    if (v11 != 0x7FFFFFFFFFFFFFFFLL && location <= v11) {
      self->_rectsAreInCharacterOrder = 0;
    }
  }
  self->_lastRectRange.NSUInteger location = location;
  self->_lastRectRange.NSUInteger length = length;
}

- (void)sortTextRectsByCharacterRange
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (!self->_rectsAreInCharacterOrder)
  {
    NSUInteger v3 = (void *)[MEMORY[0x1E4F1CA48] array];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __52__UIWKDocumentContext_sortTextRectsByCharacterRange__block_invoke;
    v16[3] = &unk_1E52EE9D0;
    v16[4] = v3;
    [(UIWKDocumentContext *)self enumerateLayoutRects:v16];
    [v3 sortUsingComparator:&__block_literal_global_220];
    [(UIWKDocumentContext *)self resetTextRects];
    -[UIWKDocumentContext set_selectionRects:](self, "set_selectionRects:", objc_msgSend(MEMORY[0x1E4F1CA58], "dataWithCapacity:", 48 * objc_msgSend(v3, "count")));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v17 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v13;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v13 != v6) {
            objc_enumerationMutation(v3);
          }
          v8 = *(void **)(*((void *)&v12 + 1) + 8 * v7);
          long long v10 = 0u;
          long long v11 = 0u;
          long long v9 = 0u;
          [v8 getValue:&v9 size:48];
          -[UIWKDocumentContext addTextRect:forCharacterRange:](self, "addTextRect:forCharacterRange:", v11, v9, v10);
          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v17 count:16];
      }
      while (v5);
    }
  }
}

uint64_t __52__UIWKDocumentContext_sortTextRectsByCharacterRange__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5, double a6, double a7)
{
  *(double *)v8 = a4;
  *(double *)&v8[1] = a5;
  *(double *)&v8[2] = a6;
  *(double *)&v8[3] = a7;
  v8[4] = a2;
  v8[5] = a3;
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", objc_msgSend(MEMORY[0x1E4F29238], "valueWithBytes:objCType:", v8, "{?={CGRect={CGPoint=dd}{CGSize=dd}}{_NSRange=QQ}}"));
}

uint64_t __52__UIWKDocumentContext_sortTextRectsByCharacterRange__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  long long v8 = 0u;
  long long v6 = 0u;
  memset(v7, 0, sizeof(v7));
  objc_msgSend(a2, "getValue:size:", v7, 48, 0, 0, 0, 0);
  [a3 getValue:&v5 size:48];
  if ((unint64_t)v8 < (unint64_t)v6) {
    return -1;
  }
  if ((unint64_t)v8 > (unint64_t)v6) {
    return 1;
  }
  if (*((void *)&v8 + 1) >= *((void *)&v6 + 1)) {
    return *((void *)&v8 + 1) > *((void *)&v6 + 1);
  }
  return -1;
}

- (unint64_t)closestCharacterIndexForPoint:(CGPoint)a3
{
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  v12[3] = 0x7FEFFFFFFFFFFFFFLL;
  uint64_t v7 = 0;
  long long v8 = &v7;
  uint64_t v9 = 0x3010000000;
  long long v10 = &unk_186D7DBA7;
  long long v11 = xmmword_186B93450;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__UIWKDocumentContext_closestCharacterIndexForPoint___block_invoke;
  v5[3] = &unk_1E52EEA18;
  CGPoint v6 = a3;
  v5[4] = v12;
  v5[5] = &v7;
  [(UIWKDocumentContext *)self enumerateLayoutRects:v5];
  unint64_t v3 = v8[4];
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(v12, 8);
  return v3;
}

BOOL __53__UIWKDocumentContext_closestCharacterIndexForPoint___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  BOOL result = UIDistanceBetweenPointAndRect(*(CGFloat *)(a1 + 48), *(CGFloat *)(a1 + 56), a4, a5, a6, a7);
  if (v11 < *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
    *(void *)(v12 + 32) = a2;
    *(void *)(v12 + 40) = a3;
    *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v11;
  }
  return result;
}

- (id)characterRectsForCharacterRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  [(UIWKDocumentContext *)self sortTextRectsByCharacterRange];
  CGPoint v6 = (void *)[MEMORY[0x1E4F1CA48] array];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__UIWKDocumentContext_characterRectsForCharacterRange___block_invoke;
  v8[3] = &unk_1E52EE9D0;
  v8[4] = v6;
  -[UIWKDocumentContext enumerateLayoutRectsWithOptions:characterRange:block:](self, "enumerateLayoutRectsWithOptions:characterRange:block:", 0, location, length, v8);
  return v6;
}

uint64_t __55__UIWKDocumentContext_characterRectsForCharacterRange___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:");
  return [v1 addObject:v2];
}

- (_NSRange)rangeContainedWithinRect:(CGRect)a3
{
  uint64_t v9 = 0;
  long long v10 = &v9;
  uint64_t v11 = 0x3010000000;
  uint64_t v12 = &unk_186D7DBA7;
  long long v13 = xmmword_186B93450;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  _OWORD v7[2] = __48__UIWKDocumentContext_rangeContainedWithinRect___block_invoke;
  v7[3] = &unk_1E52EEA40;
  CGRect v8 = a3;
  v7[4] = &v9;
  [(UIWKDocumentContext *)self enumerateLayoutRects:v7];
  NSUInteger v3 = v10[4];
  NSUInteger v4 = v10[5];
  _Block_object_dispose(&v9, 8);
  NSUInteger v5 = v3;
  NSUInteger v6 = v4;
  result.NSUInteger length = v6;
  result.NSUInteger location = v5;
  return result;
}

NSUInteger __48__UIWKDocumentContext_rangeContainedWithinRect___block_invoke(uint64_t a1, NSUInteger a2, NSUInteger a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  v14.size.CGFloat height = a7;
  v14.size.CGFloat width = a6;
  v14.origin.CGFloat y = a5;
  v14.origin.CGFloat x = a4;
  v10.NSUInteger location = CGRectIntersectsRect(*(CGRect *)(a1 + 40), v14);
  if (LODWORD(v10.location))
  {
    uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
    v10.NSUInteger location = *(void *)(v11 + 32);
    if (v10.location == 0x7FFFFFFFFFFFFFFFLL)
    {
      *(void *)(v11 + 32) = a2;
      *(void *)(v11 + 40) = a3;
    }
    else
    {
      v10.NSUInteger length = *(void *)(v11 + 40);
      v13.NSUInteger location = a2;
      v13.NSUInteger length = a3;
      NSRange v10 = NSUnionRange(v10, v13);
      *(NSRange *)(*(void *)(*(void *)(a1 + 32) + 8) + 32) = v10;
    }
  }
  return v10.location;
}

- (id)stringContainedWithinRect:(CGRect)a3
{
  uint64_t v4 = -[UIWKDocumentContext rangeContainedWithinRect:](self, "rangeContainedWithinRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  uint64_t v7 = v4;
  uint64_t v8 = v5;
  uint64_t v9 = [(UIWKDocumentContext *)self fullText];
  return -[NSString substringWithRange:](v9, "substringWithRange:", v7, v8);
}

- (NSString)fullText
{
  NSUInteger v3 = [(UIWKDocumentContext *)self _contextBeforeString];
  uint64_t v4 = &stru_1ED0E84C0;
  if (v3) {
    uint64_t v5 = (__CFString *)v3;
  }
  else {
    uint64_t v5 = &stru_1ED0E84C0;
  }
  NSUInteger v6 = [(UIWKDocumentContext *)self _selectedTextString];
  if (v6) {
    uint64_t v7 = (__CFString *)v6;
  }
  else {
    uint64_t v7 = &stru_1ED0E84C0;
  }
  uint64_t v8 = [(UIWKDocumentContext *)self _markedTextString];
  if (v8) {
    uint64_t v9 = (__CFString *)v8;
  }
  else {
    uint64_t v9 = &stru_1ED0E84C0;
  }
  NSRange v10 = [(UIWKDocumentContext *)self _contextAfterString];
  if (v10) {
    uint64_t v4 = (__CFString *)v10;
  }
  uint64_t v11 = NSString;
  if ([(__CFString *)v9 length]) {
    uint64_t v12 = v9;
  }
  else {
    uint64_t v12 = v7;
  }
  return (NSString *)[v11 stringWithFormat:@"%@%@%@", v5, v12, v4];
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)directionalRangeForSelectionRange:(_NSRange)a3
{
  if (a3.location == 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v3 = 0;
    int64_t v4 = 0;
  }
  else
  {
    NSUInteger length = a3.length;
    int64_t v4 = a3.location - [(UIWKDocumentContext *)self selectedTextRange];
    int64_t v3 = length - v6;
  }
  result.var1 = v3;
  result.var0 = v4;
  return result;
}

- (void)enumerateLayoutRects:(id)a3
{
}

- (void)enumerateLayoutRectsWithOptions:(unint64_t)a3 characterRange:(_NSRange)a4 block:(id)a5
{
  if (a5)
  {
    NSUInteger length = a4.length;
    NSUInteger location = a4.location;
    char v8 = a3;
    if (a4.location == 0x7FFFFFFFFFFFFFFFLL || a4.length)
    {
      if (a4.location != 0x7FFFFFFFFFFFFFFFLL) {
        [(UIWKDocumentContext *)self sortTextRectsByCharacterRange];
      }
      NSUInteger v10 = [(NSMutableData *)[(UIWKDocumentContext *)self _selectionRects] length];
      unint64_t v11 = v10 / 0x30;
      uint64_t v12 = [(NSMutableData *)[(UIWKDocumentContext *)self _selectionRects] bytes];
      char v31 = 0;
      if ((v8 & 2) != 0)
      {
        if (v10 >= 0x30)
        {
          char v23 = 0;
          uint64_t v24 = v12 + 48 * v11 - 24;
          do
          {
            double v25 = *(double *)(v24 - 24);
            double v26 = *(double *)(v24 - 16);
            double v27 = *(double *)(v24 - 8);
            double v28 = *(double *)v24;
            uint64_t v29 = *(void *)(v24 + 8);
            uint64_t v30 = *(void *)(v24 + 16);
            if (location == 0x7FFFFFFFFFFFFFFFLL
              || (v33.location = location, v33.NSUInteger length = length, NSIntersectionRange(v33, *(NSRange *)(v24 + 8)).length))
            {
              (*((void (**)(id, uint64_t, uint64_t, char *, double, double, double, double))a5 + 2))(a5, v29, v30, &v31, v25, v26, v27, v28);
              char v23 = 1;
            }
            else if (v23)
            {
              char v23 = 1;
              char v31 = 1;
            }
            else
            {
              char v23 = 0;
            }
            if (v11 < 2) {
              break;
            }
            v24 -= 48;
            --v11;
          }
          while (!v31);
        }
      }
      else if (v10 >= 0x30)
      {
        char v13 = 0;
        uint64_t v14 = v12 + 24;
        unint64_t v15 = 1;
        do
        {
          double v16 = *(double *)(v14 - 24);
          double v17 = *(double *)(v14 - 16);
          double v18 = *(double *)(v14 - 8);
          double v19 = *(double *)v14;
          uint64_t v20 = *(void *)(v14 + 8);
          uint64_t v21 = *(void *)(v14 + 16);
          if (location == 0x7FFFFFFFFFFFFFFFLL
            || (v32.location = location, v32.NSUInteger length = length, NSIntersectionRange(v32, *(NSRange *)(v14 + 8)).length))
          {
            (*((void (**)(id, uint64_t, uint64_t, char *, double, double, double, double))a5 + 2))(a5, v20, v21, &v31, v16, v17, v18, v19);
            char v13 = 1;
          }
          else if (v13)
          {
            char v13 = 1;
            char v31 = 1;
          }
          else
          {
            char v13 = 0;
          }
          v14 += 48;
          if (v31) {
            BOOL v22 = 1;
          }
          else {
            BOOL v22 = v15 >= v11;
          }
          ++v15;
        }
        while (!v22);
      }
    }
  }
}

- (NSMutableData)_selectionRects
{
  return self->_selectionRects;
}

- (void)set_selectionRects:(id)a3
{
}

- (NSObject)contextBefore
{
  return self->_contextBefore;
}

- (void)setContextBefore:(id)a3
{
}

- (NSObject)selectedText
{
  return self->_selectedText;
}

- (void)setSelectedText:(id)a3
{
}

- (NSObject)contextAfter
{
  return self->_contextAfter;
}

- (void)setContextAfter:(id)a3
{
}

- (NSObject)markedText
{
  return self->_markedText;
}

- (void)setMarkedText:(id)a3
{
}

- (_NSRange)selectedRangeInMarkedText
{
  NSUInteger length = self->_selectedRangeInMarkedText.length;
  NSUInteger location = self->_selectedRangeInMarkedText.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setSelectedRangeInMarkedText:(_NSRange)a3
{
  self->_selectedRangeInMarkedText = a3;
}

- (NSArray)autocorrectedRanges
{
  return self->_autocorrectedRanges;
}

- (void)setAutocorrectedRanges:(id)a3
{
}

- (NSAttributedString)annotatedText
{
  return self->_annotatedText;
}

- (void)setAnnotatedText:(id)a3
{
}

@end
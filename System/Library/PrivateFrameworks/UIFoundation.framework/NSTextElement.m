@interface NSTextElement
+ (int64_t)_searchElements:(id)a3 forLocation:(id)a4;
- (BOOL)isBeginningOfDocument;
- (BOOL)isEndOfDocument;
- (BOOL)isRepresentedElement;
- (CGSize)estimatedIntrinsicContentSizeForTextLayoutManager:(id)a3;
- (NSArray)childElements;
- (NSTextContentManager)textContentManager;
- (NSTextElement)init;
- (NSTextElement)initWithTextContentManager:(NSTextContentManager *)textContentManager;
- (NSTextElement)parentElement;
- (NSTextRange)elementRange;
- (id)childTextElementForLocation:(id)a3 elementIndex:(int64_t *)a4;
- (unsigned)coalescingType;
- (void)dealloc;
- (void)setCoalescingType:(unsigned __int8)a3;
- (void)setElementRange:(NSTextRange *)elementRange;
- (void)setTextContentManager:(NSTextContentManager *)textContentManager;
@end

@implementation NSTextElement

- (NSTextContentManager)textContentManager
{
  return (NSTextContentManager *)objc_loadWeak((id *)&self->_textContentManager);
}

- (NSTextRange)elementRange
{
  return (NSTextRange *)objc_getProperty(self, a2, 24, 1);
}

- (NSArray)childElements
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (void)setElementRange:(NSTextRange *)elementRange
{
}

- (NSTextElement)initWithTextContentManager:(NSTextContentManager *)textContentManager
{
  v7.receiver = self;
  v7.super_class = (Class)NSTextElement;
  v4 = [(NSTextElement *)&v7 init];
  v5 = v4;
  if (v4)
  {
    [(NSTextElement *)v4 setTextContentManager:textContentManager];
    [(NSTextElement *)v5 setCoalescingType:0];
  }
  return v5;
}

- (void)setTextContentManager:(NSTextContentManager *)textContentManager
{
  v5 = self->_textContentManager;
  p_textContentManager = &self->_textContentManager;
  if (v5 != textContentManager)
  {
    objc_storeWeak((id *)p_textContentManager, textContentManager);
    objc_super v7 = [(NSTextElement *)self childElements];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __39__NSTextElement_setTextContentManager___block_invoke;
    v8[3] = &unk_1E55C6BC0;
    v8[4] = textContentManager;
    [(NSArray *)v7 enumerateObjectsUsingBlock:v8];
  }
}

- (void)setCoalescingType:(unsigned __int8)a3
{
  self->_coalescingType = a3;
}

- (unsigned)coalescingType
{
  return self->_coalescingType;
}

- (BOOL)isEndOfDocument
{
  int v3 = objc_msgSend(-[NSTextRange endLocation](-[NSTextContentManager documentRange](-[NSTextElement textContentManager](self, "textContentManager"), "documentRange"), "endLocation"), "isEqual:", -[NSTextRange endLocation](-[NSTextElement elementRange](self, "elementRange"), "endLocation"));
  if (v3) {
    LOBYTE(v3) = __NSTextElementGetFirstRepresentableChild(self) == 0;
  }
  return v3;
}

- (BOOL)isBeginningOfDocument
{
  int v3 = [(NSTextContentManager *)[(NSTextElement *)self textContentManager] documentRange];
  if (v3)
  {
    LODWORD(v3) = objc_msgSend(-[NSTextRange location](v3, "location"), "isEqual:", -[NSTextRange location](-[NSTextElement elementRange](self, "elementRange"), "location"));
    if (v3)
    {
      v4 = [(NSTextElement *)self parentElement];
      if (v4)
      {
        v5 = v4;
        do
        {
          BOOL v6 = [(NSTextElement *)v5 isRepresentedElement];
          if (v6) {
            break;
          }
          v5 = [(NSTextElement *)v5 parentElement];
        }
        while (v5);
        LOBYTE(v3) = !v6;
      }
      else
      {
        LOBYTE(v3) = 1;
      }
    }
  }
  return (char)v3;
}

- (void)dealloc
{
  [(NSTextElement *)self setTextContentManager:0];

  v3.receiver = self;
  v3.super_class = (Class)NSTextElement;
  [(NSTextElement *)&v3 dealloc];
}

- (id)childTextElementForLocation:(id)a3 elementIndex:(int64_t *)a4
{
  BOOL v6 = [(NSTextElement *)self childElements];
  if (![(NSArray *)v6 count]) {
    return 0;
  }
  do
  {
    uint64_t v7 = [(NSArray *)v6 count] - 1;
    if (v7 < 0)
    {
LABEL_11:
      id v11 = 0;
      goto LABEL_13;
    }
    int64_t v8 = 0;
    while (1)
    {
      uint64_t v9 = v7 - v8;
      if (v7 < v8) {
        ++v9;
      }
      int64_t v10 = v8 + (v9 >> 1);
      id v11 = [(NSArray *)v6 objectAtIndexedSubscript:v10];
      v12 = (void *)[v11 elementRange];
      if (objc_msgSend(a3, "compare:", objc_msgSend(v12, "location")) == -1)
      {
        uint64_t v7 = v10 - 1;
        goto LABEL_10;
      }
      if (objc_msgSend(a3, "compare:", objc_msgSend(v12, "endLocation")) == -1) {
        break;
      }
      int64_t v8 = v10 + 1;
LABEL_10:
      if (v8 > v7) {
        goto LABEL_11;
      }
    }
    *a4 = v10;
LABEL_13:
    BOOL v6 = (NSArray *)[v11 childElements];
  }
  while ([(NSArray *)v6 count]);
  return v11;
}

uint64_t __39__NSTextElement_setTextContentManager___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setTextContentManager:*(void *)(a1 + 32)];
}

- (NSTextElement)init
{
  return [(NSTextElement *)self initWithTextContentManager:0];
}

- (CGSize)estimatedIntrinsicContentSizeForTextLayoutManager:(id)a3
{
  objc_super v3 = objc_msgSend(a3, "textContainerForLocation:", -[NSTextRange location](-[NSTextElement elementRange](self, "elementRange"), "location"));
  double v5 = *MEMORY[0x1E4F1DB30];
  double v4 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if (v3)
  {
    BOOL v6 = v3;
    [v3 size];
    if (v7 > 0.0 && v7 < 10000000.0)
    {
      [v6 size];
      double v5 = v8;
    }
  }
  double v9 = v5;
  double v10 = v4;
  result.height = v10;
  result.width = v9;
  return result;
}

- (BOOL)isRepresentedElement
{
  return 1;
}

- (NSTextElement)parentElement
{
  return 0;
}

+ (int64_t)_searchElements:(id)a3 forLocation:(id)a4
{
  if (!a3)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"NSTextElement.m", 164, @"Invalid parameter not satisfying: %@", @"elements != nil");
    if (a4) {
      goto LABEL_3;
    }
LABEL_20:
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"NSTextElement.m", 165, @"Invalid parameter not satisfying: %@", @"location != nil");
    goto LABEL_3;
  }
  if (!a4) {
    goto LABEL_20;
  }
LABEL_3:
  uint64_t v8 = [a3 count] - 1;
  if (v8 < 0) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  int64_t v9 = 0;
  while (1)
  {
    uint64_t v10 = v8 - v9;
    if (v8 < v9) {
      ++v10;
    }
    int64_t v11 = v9 + (v10 >> 1);
    v12 = (void *)[a3 objectAtIndexedSubscript:v11];
    v13 = (void *)[v12 elementRange];
    if (objc_msgSend(a4, "compare:", objc_msgSend(v13, "location")) == -1)
    {
      uint64_t v8 = v11 - 1;
      goto LABEL_11;
    }
    if (objc_msgSend(a4, "compare:", objc_msgSend(v13, "endLocation")) == -1) {
      break;
    }
    int64_t v9 = v11 + 1;
LABEL_11:
    if (v9 > v8) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  if (v12 || v11 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v12 && [a3 indexOfObject:v12] != v11) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"NSTextElement.m", 169, @"Element %@ at index %ld has invalid index %ld", v12, objc_msgSend(a3, "indexOfObject:", v12), v11);
    }
  }
  else
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"NSTextElement.m", 168, @"Null element returned index %ld", v11, v15, v16);
  }
  return v11;
}

@end
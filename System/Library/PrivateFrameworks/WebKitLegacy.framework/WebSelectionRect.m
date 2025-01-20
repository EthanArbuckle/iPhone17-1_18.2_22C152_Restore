@interface WebSelectionRect
+ (CGRect)endEdge:(id)a3;
+ (CGRect)startEdge:(id)a3;
+ (id)selectionRect;
- (BOOL)containsEnd;
- (BOOL)containsStart;
- (BOOL)isFirstOnLine;
- (BOOL)isHorizontal;
- (BOOL)isInFixedPosition;
- (BOOL)isLastOnLine;
- (BOOL)isLineBreak;
- (CGRect)rect;
- (WebSelectionRect)init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)writingDirection;
- (void)setContainsEnd:(BOOL)a3;
- (void)setContainsStart:(BOOL)a3;
- (void)setIsFirstOnLine:(BOOL)a3;
- (void)setIsHorizontal:(BOOL)a3;
- (void)setIsInFixedPosition:(BOOL)a3;
- (void)setIsLastOnLine:(BOOL)a3;
- (void)setIsLineBreak:(BOOL)a3;
- (void)setRect:(CGRect)a3;
- (void)setWritingDirection:(int)a3;
@end

@implementation WebSelectionRect

+ (id)selectionRect
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

+ (CGRect)startEdge:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (![a3 count])
  {
    double v10 = *MEMORY[0x1E4F1DB28];
    double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v16 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    goto LABEL_23;
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v4 = [a3 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v25;
LABEL_4:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v25 != v6) {
        objc_enumerationMutation(a3);
      }
      v8 = *(void **)(*((void *)&v24 + 1) + 8 * v7);
      if ([v8 containsStart]) {
        break;
      }
      if (v5 == ++v7)
      {
        uint64_t v5 = [a3 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v5) {
          goto LABEL_4;
        }
        goto LABEL_12;
      }
    }
    if (v8) {
      goto LABEL_13;
    }
  }
LABEL_12:
  v8 = (void *)[a3 objectAtIndex:0];
LABEL_13:
  [v8 rect];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  char v17 = [v8 isHorizontal];
  int v18 = [v8 writingDirection];
  unsigned int v19 = v18 + 1;
  if ((v17 & 1) == 0)
  {
    if (v19 >= 2)
    {
      if (v18 != 1) {
        goto LABEL_23;
      }
      double v12 = v12 + v16 + -1.0;
    }
    double v16 = 1.0;
    goto LABEL_23;
  }
  if (v19 < 2) {
    goto LABEL_17;
  }
  if (v18 == 1)
  {
    double v10 = v10 + v14 + -1.0;
LABEL_17:
    double v14 = 1.0;
  }
LABEL_23:
  double v20 = v10;
  double v21 = v12;
  double v22 = v14;
  double v23 = v16;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

+ (CGRect)endEdge:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if ([a3 count])
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v4 = [a3 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v25;
LABEL_4:
      uint64_t v7 = 0;
      while (1)
      {
        if (*(void *)v25 != v6) {
          objc_enumerationMutation(a3);
        }
        v8 = *(void **)(*((void *)&v24 + 1) + 8 * v7);
        if ([v8 containsEnd]) {
          break;
        }
        if (v5 == ++v7)
        {
          uint64_t v5 = [a3 countByEnumeratingWithState:&v24 objects:v28 count:16];
          if (v5) {
            goto LABEL_4;
          }
          goto LABEL_12;
        }
      }
      if (v8) {
        goto LABEL_13;
      }
    }
LABEL_12:
    v8 = (void *)[a3 lastObject];
LABEL_13:
    [v8 rect];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    char v17 = [v8 isHorizontal];
    int v18 = [v8 writingDirection];
    unsigned int v19 = v18 + 1;
    if (v17)
    {
      if (v19 >= 2)
      {
        if (v18 == 1) {
          double v14 = 1.0;
        }
      }
      else
      {
        double v10 = v10 + v14 + -1.0;
        double v14 = 1.0;
      }
    }
    else if (v19 >= 2)
    {
      if (v18 == 1) {
        double v16 = 1.0;
      }
    }
    else
    {
      double v12 = v12 + v16 + -1.0;
      double v16 = 1.0;
    }
  }
  else
  {
    double v10 = *MEMORY[0x1E4F1DB28];
    double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v16 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  double v20 = v10;
  double v21 = v12;
  double v22 = v14;
  double v23 = v16;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (WebSelectionRect)init
{
  v5.receiver = self;
  v5.super_class = (Class)WebSelectionRect;
  id v2 = [(WebSelectionRect *)&v5 init];
  v3 = v2;
  if (v2)
  {
    -[WebSelectionRect setRect:](v2, "setRect:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(WebSelectionRect *)v3 setWritingDirection:0];
    [(WebSelectionRect *)v3 setIsLineBreak:0];
    [(WebSelectionRect *)v3 setIsFirstOnLine:0];
    [(WebSelectionRect *)v3 setIsLastOnLine:0];
    [(WebSelectionRect *)v3 setContainsStart:0];
    [(WebSelectionRect *)v3 setContainsEnd:0];
    [(WebSelectionRect *)v3 setIsInFixedPosition:0];
    [(WebSelectionRect *)v3 setIsHorizontal:0];
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[WebSelectionRect selectionRect];
  [(WebSelectionRect *)self rect];
  objc_msgSend(v4, "setRect:");
  objc_msgSend(v4, "setWritingDirection:", -[WebSelectionRect writingDirection](self, "writingDirection"));
  objc_msgSend(v4, "setIsLineBreak:", -[WebSelectionRect isLineBreak](self, "isLineBreak"));
  objc_msgSend(v4, "setIsFirstOnLine:", -[WebSelectionRect isFirstOnLine](self, "isFirstOnLine"));
  objc_msgSend(v4, "setIsLastOnLine:", -[WebSelectionRect isLastOnLine](self, "isLastOnLine"));
  objc_msgSend(v4, "setContainsStart:", -[WebSelectionRect containsStart](self, "containsStart"));
  objc_msgSend(v4, "setContainsEnd:", -[WebSelectionRect containsEnd](self, "containsEnd"));
  objc_msgSend(v4, "setIsInFixedPosition:", -[WebSelectionRect isInFixedPosition](self, "isInFixedPosition"));
  objc_msgSend(v4, "setIsHorizontal:", -[WebSelectionRect isHorizontal](self, "isHorizontal"));
  return v4;
}

- (id)description
{
  v3 = NSString;
  [(WebSelectionRect *)self rect];
  uint64_t v5 = v4;
  [(WebSelectionRect *)self rect];
  uint64_t v7 = v6;
  [(WebSelectionRect *)self rect];
  uint64_t v9 = v8;
  [(WebSelectionRect *)self rect];
  uint64_t v11 = v10;
  if ([(WebSelectionRect *)self writingDirection]) {
    double v12 = @"[RTL]";
  }
  else {
    double v12 = @"[LTR]";
  }
  if ([(WebSelectionRect *)self isLineBreak]) {
    double v13 = @" [BR]";
  }
  else {
    double v13 = &stru_1F3C7DA90;
  }
  if ([(WebSelectionRect *)self isFirstOnLine]) {
    double v14 = @" [FIRST]";
  }
  else {
    double v14 = &stru_1F3C7DA90;
  }
  if ([(WebSelectionRect *)self isLastOnLine]) {
    double v15 = @" [LAST]";
  }
  else {
    double v15 = &stru_1F3C7DA90;
  }
  if ([(WebSelectionRect *)self containsStart]) {
    double v16 = @" [START]";
  }
  else {
    double v16 = &stru_1F3C7DA90;
  }
  if ([(WebSelectionRect *)self containsEnd]) {
    char v17 = @" [END]";
  }
  else {
    char v17 = &stru_1F3C7DA90;
  }
  if ([(WebSelectionRect *)self isInFixedPosition]) {
    int v18 = @" [FIXED]";
  }
  else {
    int v18 = &stru_1F3C7DA90;
  }
  BOOL v19 = [(WebSelectionRect *)self isHorizontal];
  double v20 = @" [VERTICAL]";
  if (v19) {
    double v20 = &stru_1F3C7DA90;
  }
  return (id)[v3 stringWithFormat:@"<WebSelectionRect: %p> : { %.1f,%.1f,%.1f,%.1f } %@%@%@%@%@%@%@%@", self, v5, v7, v9, v11, v12, v13, v14, v15, v16, v17, v18, v20];
}

- (CGRect)rect
{
  double x = self->m_rect.origin.x;
  double y = self->m_rect.origin.y;
  double width = self->m_rect.size.width;
  double height = self->m_rect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setRect:(CGRect)a3
{
  self->m_rect = a3;
}

- (int)writingDirection
{
  return self->m_writingDirection;
}

- (void)setWritingDirection:(int)a3
{
  self->m_writingDirection = a3;
}

- (BOOL)isLineBreak
{
  return self->m_isLineBreak;
}

- (void)setIsLineBreak:(BOOL)a3
{
  self->m_isLineBreak = a3;
}

- (BOOL)isFirstOnLine
{
  return self->m_isFirstOnLine;
}

- (void)setIsFirstOnLine:(BOOL)a3
{
  self->m_isFirstOnLine = a3;
}

- (BOOL)isLastOnLine
{
  return self->m_isLastOnLine;
}

- (void)setIsLastOnLine:(BOOL)a3
{
  self->m_isLastOnLine = a3;
}

- (BOOL)containsStart
{
  return self->m_containsStart;
}

- (void)setContainsStart:(BOOL)a3
{
  self->m_containsStart = a3;
}

- (BOOL)containsEnd
{
  return self->m_containsEnd;
}

- (void)setContainsEnd:(BOOL)a3
{
  self->m_containsEnd = a3;
}

- (BOOL)isInFixedPosition
{
  return self->m_isInFixedPosition;
}

- (void)setIsInFixedPosition:(BOOL)a3
{
  self->m_isInFixedPosition = a3;
}

- (BOOL)isHorizontal
{
  return self->m_isHorizontal;
}

- (void)setIsHorizontal:(BOOL)a3
{
  self->m_isHorizontal = a3;
}

@end
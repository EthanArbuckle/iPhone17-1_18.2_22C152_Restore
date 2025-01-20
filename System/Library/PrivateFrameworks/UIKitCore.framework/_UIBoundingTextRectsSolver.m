@interface _UIBoundingTextRectsSolver
- (CGRect)bodyRect;
- (CGRect)boundingRect;
- (CGRect)firstLineRect;
- (CGRect)lastLineRect;
- (NSArray)rects;
- (_UIBoundingTextRectsSolver)initWithTextContainer:(id)a3 range:(id)a4 unifyRects:(BOOL)a5;
- (id)description;
- (void)_calculate;
- (void)_calculateRectsUsingLayoutManager:(id)a3;
- (void)_calculateRectsUsingTextLayoutManager:(id)a3;
- (void)_calculateTotalRect;
- (void)_coalesceRectsForRects:(id)a3;
@end

@implementation _UIBoundingTextRectsSolver

- (_UIBoundingTextRectsSolver)initWithTextContainer:(id)a3 range:(id)a4 unifyRects:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_UIBoundingTextRectsSolver;
  v11 = [(_UIBoundingTextRectsSolver *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_textContainer, a3);
    objc_storeStrong((id *)&v12->_range, a4);
    v12->_calculated = 0;
    v12->_unifyRects = a5;
  }

  return v12;
}

- (CGRect)firstLineRect
{
  [(_UIBoundingTextRectsSolver *)self _calculate];
  double x = self->_firstRect.origin.x;
  double y = self->_firstRect.origin.y;
  double width = self->_firstRect.size.width;
  double height = self->_firstRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)bodyRect
{
  [(_UIBoundingTextRectsSolver *)self _calculate];
  double x = self->_middleRect.origin.x;
  double y = self->_middleRect.origin.y;
  double width = self->_middleRect.size.width;
  double height = self->_middleRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)lastLineRect
{
  [(_UIBoundingTextRectsSolver *)self _calculate];
  double x = self->_lastRect.origin.x;
  double y = self->_lastRect.origin.y;
  double width = self->_lastRect.size.width;
  double height = self->_lastRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)boundingRect
{
  [(_UIBoundingTextRectsSolver *)self _calculate];
  double x = self->_totalRect.origin.x;
  double y = self->_totalRect.origin.y;
  double width = self->_totalRect.size.width;
  double height = self->_totalRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)_calculate
{
  if (!self->_calculated)
  {
    uint64_t v3 = MEMORY[0x1E4F1DB28];
    self->_calculated = 1;
    CGPoint v4 = *(CGPoint *)v3;
    CGSize v5 = *(CGSize *)(v3 + 16);
    self->_firstRect.origin = *(CGPoint *)v3;
    self->_firstRect.size = v5;
    self->_middleRect.origin = v4;
    self->_middleRect.size = v5;
    self->_lastRect.origin = v4;
    self->_lastRect.size = v5;
    self->_totalRect.origin = v4;
    self->_totalRect.size = v5;
    v6 = [(NSTextContainer *)self->_textContainer textLayoutManager];
    if (v6)
    {
      [(_UIBoundingTextRectsSolver *)self _calculateRectsUsingTextLayoutManager:v6];
    }
    else
    {
      v7 = [(NSTextContainer *)self->_textContainer layoutManager];
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __40___UIBoundingTextRectsSolver__calculate__block_invoke;
      v8[3] = &unk_1E530C7C0;
      v8[4] = self;
      [v7 coordinateAccess:v8];
    }
    [(_UIBoundingTextRectsSolver *)self _calculateTotalRect];
  }
}

- (void)_calculateRectsUsingTextLayoutManager:(id)a3
{
  id v4 = a3;
  CGSize v5 = objc_opt_new();
  [(NSTextContainer *)self->_textContainer textContainerOrigin];
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  id v10 = [(UITextRange *)self->_range unionTextRange];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  objc_super v14 = __68___UIBoundingTextRectsSolver__calculateRectsUsingTextLayoutManager___block_invoke;
  v15 = &unk_1E530C7E8;
  uint64_t v18 = v7;
  uint64_t v19 = v9;
  v16 = self;
  id v17 = v5;
  id v11 = v5;
  [v4 enumerateTextSegmentsInRange:v10 type:0 options:0 usingBlock:&v12];

  -[_UIBoundingTextRectsSolver _coalesceRectsForRects:](self, "_coalesceRectsForRects:", v11, v12, v13, v14, v15, v16);
}

- (void)_calculateRectsUsingLayoutManager:(id)a3
{
  id v4 = a3;
  CGSize v5 = objc_opt_new();
  [(NSTextContainer *)self->_textContainer textContainerOrigin];
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v10 = [(UITextRange *)self->_range asRange];
  uint64_t v12 = objc_msgSend(v4, "glyphRangeForCharacterRange:actualCharacterRange:", v10, v11, 0);
  uint64_t v14 = v13;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __64___UIBoundingTextRectsSolver__calculateRectsUsingLayoutManager___block_invoke;
  v17[3] = &unk_1E530C838;
  uint64_t v20 = v12;
  uint64_t v21 = v13;
  v17[4] = self;
  id v18 = v4;
  uint64_t v22 = v7;
  uint64_t v23 = v9;
  id v19 = v5;
  id v15 = v5;
  id v16 = v4;
  objc_msgSend(v16, "enumerateLineFragmentsForGlyphRange:usingBlock:", v12, v14, v17);
  [(_UIBoundingTextRectsSolver *)self _coalesceRectsForRects:v15];
}

- (void)_coalesceRectsForRects:(id)a3
{
  id v35 = a3;
  if ([v35 count] == 1)
  {
    id v4 = [v35 firstObject];
    [v4 CGRectValue];
    self->_middleRect.origin.double x = v5;
    self->_middleRect.origin.double y = v6;
    self->_middleRect.size.double width = v7;
    self->_middleRect.size.double height = v8;
  }
  else if ([v35 count])
  {
    uint64_t v9 = [v35 firstObject];
    [v9 CGRectValue];
    self->_firstRect.origin.double x = v10;
    self->_firstRect.origin.double y = v11;
    self->_firstRect.size.double width = v12;
    self->_firstRect.size.double height = v13;

    uint64_t v14 = [v35 lastObject];
    [v14 CGRectValue];
    self->_lastRect.origin.double x = v15;
    self->_lastRect.origin.double y = v16;
    self->_lastRect.size.double width = v17;
    self->_lastRect.size.double height = v18;

    if ((unint64_t)[v35 count] < 3)
    {
      if (self->_unifyRects)
      {
        double MinX = CGRectGetMinX(self->_firstRect);
        if (MinX > CGRectGetMaxX(self->_lastRect))
        {
          self->_middleRect = CGRectUnion(self->_firstRect, self->_lastRect);
          CGPoint v33 = (CGPoint)*MEMORY[0x1E4F1DB28];
          CGSize v34 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
          self->_firstRect.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
          self->_firstRect.size = v34;
          self->_lastRect.origin = v33;
          self->_lastRect.size = v34;
        }
      }
    }
    else
    {
      id v19 = [v35 objectAtIndexedSubscript:1];
      [v19 CGRectValue];
      self->_middleRect.origin.double x = v20;
      self->_middleRect.origin.double y = v21;
      self->_middleRect.size.double width = v22;
      self->_middleRect.size.double height = v23;

      if ((unint64_t)([v35 count] - 4) <= 0xFFFFFFFFFFFFFFFCLL)
      {
        unint64_t v24 = 2;
        do
        {
          v25 = [v35 objectAtIndexedSubscript:v24];
          [v25 CGRectValue];
          v37.origin.double x = v26;
          v37.origin.double y = v27;
          v37.size.double width = v28;
          v37.size.double height = v29;
          self->_middleRect = CGRectUnion(self->_middleRect, v37);

          ++v24;
        }
        while (v24 < [v35 count] - 1);
      }
      if (self->_unifyRects)
      {
        CGFloat v30 = CGRectGetMinY(self->_middleRect) + 1.0;
        self->_firstRect.size.double height = v30 - CGRectGetMinY(self->_firstRect);
        double MaxY = CGRectGetMaxY(self->_lastRect);
        self->_lastRect.size.double height = MaxY - CGRectGetMaxY(self->_middleRect) + 1.0;
        self->_lastRect.origin.double y = CGRectGetMaxY(self->_middleRect) + -1.0;
      }
    }
  }
}

- (void)_calculateTotalRect
{
  p_firstRect = &self->_firstRect;
  CGFloat x = self->_firstRect.origin.x;
  p_totalRect = &self->_totalRect;
  CGSize v6 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
  self->_totalRect.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
  self->_totalRect.CGSize size = v6;
  CGFloat y = self->_firstRect.origin.y;
  v6.double width = self->_firstRect.size.width;
  CGFloat height = self->_firstRect.size.height;
  if (!CGRectIsEmpty(*(CGRect *)&x))
  {
    CGSize size = p_firstRect->size;
    p_totalRect->origin = p_firstRect->origin;
    p_totalRect->CGSize size = size;
  }
  if (!CGRectIsEmpty(self->_middleRect))
  {
    if (CGRectIsEmpty(self->_totalRect))
    {
      CGSize v10 = self->_middleRect.size;
      p_totalRect->origin = self->_middleRect.origin;
      p_totalRect->CGSize size = v10;
    }
    else
    {
      self->_totalRect = CGRectUnion(self->_middleRect, self->_totalRect);
    }
  }
  if (!CGRectIsEmpty(self->_lastRect))
  {
    if (CGRectIsEmpty(self->_totalRect))
    {
      CGSize v11 = self->_lastRect.size;
      p_totalRect->origin = self->_lastRect.origin;
      p_totalRect->CGSize size = v11;
    }
    else
    {
      self->_totalRect = CGRectUnion(self->_lastRect, self->_totalRect);
    }
  }
}

- (NSArray)rects
{
  [(_UIBoundingTextRectsSolver *)self _calculate];
  uint64_t v3 = objc_opt_new();
  if (!CGRectIsEmpty(self->_firstRect))
  {
    id v4 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", self->_firstRect.origin.x, self->_firstRect.origin.y, self->_firstRect.size.width, self->_firstRect.size.height);
    [v3 addObject:v4];
  }
  if (!CGRectIsEmpty(self->_middleRect))
  {
    CGFloat v5 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", self->_middleRect.origin.x, self->_middleRect.origin.y, self->_middleRect.size.width, self->_middleRect.size.height);
    [v3 addObject:v5];
  }
  if (!CGRectIsEmpty(self->_lastRect))
  {
    CGSize v6 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", self->_lastRect.origin.x, self->_lastRect.origin.y, self->_lastRect.size.width, self->_lastRect.size.height);
    [v3 addObject:v6];
  }
  CGFloat v7 = (void *)[v3 copy];

  return (NSArray *)v7;
}

- (id)description
{
  BOOL calculated = self->_calculated;
  id v4 = NSString;
  CGFloat v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  CGFloat v7 = (void *)v6;
  range = self->_range;
  if (self->_unifyRects) {
    uint64_t v9 = @"unified";
  }
  else {
    uint64_t v9 = @"not unified";
  }
  if (calculated)
  {
    CGSize v10 = [(_UIBoundingTextRectsSolver *)self rects];
    CGSize v11 = [v10 componentsJoinedByString:@", "];
    CGFloat v12 = [v4 stringWithFormat:@"<%@:%p (%@, %@) = (%@)", v7, self, range, v9, v11];
  }
  else
  {
    CGFloat v12 = [v4 stringWithFormat:@"<%@:%p (%@, %@) not calculated>", v6, self, self->_range, v9];
  }

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textContainer, 0);
  objc_storeStrong((id *)&self->_range, 0);
}

@end
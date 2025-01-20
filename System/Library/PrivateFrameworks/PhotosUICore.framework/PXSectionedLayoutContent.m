@interface PXSectionedLayoutContent
- (CGSize)contentSize;
- (CGSize)internalContentSize;
- (NSArray)sections;
- (PXSectionedLayoutContent)init;
- (PXSectionedLayoutContent)initWithAxis:(int64_t)a3 insets:(UIEdgeInsets)a4;
- (UIEdgeInsets)edgeInsets;
- (id)description;
- (id)sectionAtIndex:(unint64_t)a3;
- (int64_t)axis;
- (void)_addSection:(id)a3;
- (void)_adjustSectionsFromIndex:(int64_t)a3;
- (void)_exchangeSectionAtIndex:(unint64_t)a3 withSectionAtIndex:(unint64_t)a4;
- (void)_insertSection:(id)a3 atIndex:(unint64_t)a4;
- (void)_removeSection:(id)a3;
- (void)insertSection:(id)a3 atIndex:(int64_t)a4;
- (void)removeAllSections;
- (void)removeSections:(id)a3;
- (void)setAxis:(int64_t)a3;
- (void)setInternalContentSize:(CGSize)a3;
- (void)updateSections:(id)a3;
@end

@implementation PXSectionedLayoutContent

- (void).cxx_destruct
{
}

- (void)setInternalContentSize:(CGSize)a3
{
  self->_internalContentSize = a3;
}

- (CGSize)internalContentSize
{
  double width = self->_internalContentSize.width;
  double height = self->_internalContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (UIEdgeInsets)edgeInsets
{
  double top = self->_edgeInsets.top;
  double left = self->_edgeInsets.left;
  double bottom = self->_edgeInsets.bottom;
  double right = self->_edgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setAxis:(int64_t)a3
{
  self->_axis = a3;
}

- (int64_t)axis
{
  return self->_axis;
}

- (void)_adjustSectionsFromIndex:(int64_t)a3
{
  int64_t v3 = a3;
  double width = *MEMORY[0x1E4F1DB30];
  double height = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if ([(NSMutableArray *)self->_sections count] > (unint64_t)a3)
  {
    if (v3 <= 1) {
      uint64_t v8 = 1;
    }
    else {
      uint64_t v8 = v3;
    }
    v9 = [(NSMutableArray *)self->_sections objectAtIndexedSubscript:v8 - 1];
    v10 = v9;
    if (v3)
    {
      [v9 frame];
      double left = v11;
      double top = v13;
      if (v3 >= 1)
      {
        int64_t axis = self->_axis;
        if (axis)
        {
          if (axis == 2)
          {
            [v10 frame];
            double left = left + v19;
            [v10 frame];
            if (height < v20) {
              double height = v20;
            }
            double width = left;
          }
          else if (axis == 1)
          {
            [v10 frame];
            double top = top + v16;
            [v10 frame];
            if (width < v17) {
              double width = v17;
            }
            double height = top;
          }
        }
        else
        {
          v18 = [MEMORY[0x1E4F28B00] currentHandler];
          [v18 handleFailureInMethod:a2 object:self file:@"PXSectionedLayoutContent.m" lineNumber:191 description:@"axis == PXAxisUndefined"];
        }
      }
    }
    else
    {
      double top = self->_edgeInsets.top;
      double left = self->_edgeInsets.left;
    }
    for (; v3 < (unint64_t)[(NSMutableArray *)self->_sections count]; ++v3)
    {
      v21 = [(NSMutableArray *)self->_sections objectAtIndexedSubscript:v3];
      [v21 frame];
      double v23 = v22;
      double v25 = v24;
      objc_msgSend(v21, "setFrame:", left, top);
      [v21 setIndex:v3];
      int64_t v26 = self->_axis;
      if (v26)
      {
        if (height >= v25) {
          double v27 = height;
        }
        else {
          double v27 = v25;
        }
        double v28 = top + v25;
        if (width >= v23) {
          double v29 = width;
        }
        else {
          double v29 = v23;
        }
        double v30 = height + v25;
        if (v26 != 1)
        {
          double v28 = top;
          double v30 = height;
          double v29 = width;
        }
        if (v26 == 2) {
          double left = left + v23;
        }
        else {
          double top = v28;
        }
        if (v26 == 2) {
          double height = v27;
        }
        else {
          double height = v30;
        }
        if (v26 == 2) {
          double width = width + v23;
        }
        else {
          double width = v29;
        }
      }
      else
      {
        v31 = [MEMORY[0x1E4F28B00] currentHandler];
        [v31 handleFailureInMethod:a2 object:self file:@"PXSectionedLayoutContent.m" lineNumber:220 description:@"axis == PXAxisUndefined"];
      }
    }
  }
  int64_t v32 = self->_axis;
  if (v32)
  {
    if (v32 == 2)
    {
      if (height < self->_internalContentSize.height) {
        double height = self->_internalContentSize.height;
      }
    }
    else if (v32 == 1 && width < self->_internalContentSize.width)
    {
      double width = self->_internalContentSize.width;
    }
  }
  else
  {
    v33 = [MEMORY[0x1E4F28B00] currentHandler];
    [v33 handleFailureInMethod:a2 object:self file:@"PXSectionedLayoutContent.m" lineNumber:239 description:@"axis == PXAxisUndefined"];
  }
  -[PXSectionedLayoutContent setInternalContentSize:](self, "setInternalContentSize:", width, height);
}

- (void)_exchangeSectionAtIndex:(unint64_t)a3 withSectionAtIndex:(unint64_t)a4
{
  -[NSMutableArray exchangeObjectAtIndex:withObjectAtIndex:](self->_sections, "exchangeObjectAtIndex:withObjectAtIndex:");
  if (a3 >= a4) {
    unint64_t v7 = a4;
  }
  else {
    unint64_t v7 = a3;
  }
  [(PXSectionedLayoutContent *)self _adjustSectionsFromIndex:v7];
}

- (void)_insertSection:(id)a3 atIndex:(unint64_t)a4
{
  id v8 = a3;
  if ([(NSMutableArray *)self->_sections count] < a4)
  {
    unint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXSectionedLayoutContent.m", 157, @"index %lu out of bounds %lu", a4, -[NSMutableArray count](self->_sections, "count"));
  }
  [(NSMutableArray *)self->_sections insertObject:v8 atIndex:a4];
  [(PXSectionedLayoutContent *)self _adjustSectionsFromIndex:a4];
}

- (void)_removeSection:(id)a3
{
  sections = self->_sections;
  id v6 = a3;
  if (([(NSMutableArray *)sections containsObject:v6] & 1) == 0)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"PXSectionedLayoutContent.m" lineNumber:150 description:@"section is not contained."];
  }
  uint64_t v7 = [v6 index];
  [(NSMutableArray *)self->_sections removeObject:v6];

  [(PXSectionedLayoutContent *)self _adjustSectionsFromIndex:v7];
}

- (void)_addSection:(id)a3
{
  id v6 = a3;
  if (-[NSMutableArray containsObject:](self->_sections, "containsObject:"))
  {
    v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"PXSectionedLayoutContent.m" lineNumber:143 description:@"section already inserted."];
  }
  [(NSMutableArray *)self->_sections addObject:v6];
  [(PXSectionedLayoutContent *)self _adjustSectionsFromIndex:[(NSMutableArray *)self->_sections count] - 1];
}

- (void)insertSection:(id)a3 atIndex:(int64_t)a4
{
  id v7 = a3;
  id v9 = v7;
  if (!v7)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"PXSectionedLayoutContent.m" lineNumber:138 description:@"section to insert is nil"];

    id v7 = 0;
  }
  [(PXSectionedLayoutContent *)self _insertSection:v7 atIndex:a4];
}

- (void)updateSections:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    unint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        unint64_t v10 = [*(id *)(*((void *)&v12 + 1) + 8 * i) index];
        if (v8 >= v10) {
          unint64_t v11 = v10;
        }
        else {
          unint64_t v11 = v8;
        }
        if (v8 == 0x7FFFFFFFFFFFFFFFLL) {
          unint64_t v8 = v10;
        }
        else {
          unint64_t v8 = v11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  else
  {
    unint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  }
  [(PXSectionedLayoutContent *)self _adjustSectionsFromIndex:v8];
}

- (void)removeSections:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(PXSectionedLayoutContent *)self _removeSection:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)removeAllSections
{
  [(NSMutableArray *)self->_sections removeAllObjects];
  [(PXSectionedLayoutContent *)self _adjustSectionsFromIndex:0];
}

- (id)sectionAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_sections objectAtIndexedSubscript:a3];
}

- (CGSize)contentSize
{
  float64x2_t v3 = (float64x2_t)vextq_s8((int8x16_t)self->_internalContentSize, (int8x16_t)self->_internalContentSize, 8uLL);
  int64_t axis = self->_axis;
  if (axis)
  {
    if (axis == 2 || axis == 1) {
      float64x2_t v3 = vaddq_f64(v3, vaddq_f64(*(float64x2_t *)&self->_edgeInsets.top, *(float64x2_t *)&self->_edgeInsets.bottom));
    }
  }
  else
  {
    float64x2_t v8 = v3;
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"PXSectionedLayoutContent.m" lineNumber:90 description:@"axis == PXAxisUndefined"];

    float64x2_t v3 = v8;
  }
  double v7 = v3.f64[1];
  result.double height = v3.f64[0];
  result.double width = v7;
  return result;
}

- (NSArray)sections
{
  v2 = (void *)[(NSMutableArray *)self->_sections copy];
  return (NSArray *)v2;
}

- (id)description
{
  v12.receiver = self;
  v12.super_class = (Class)PXSectionedLayoutContent;
  float64x2_t v3 = [(PXSectionedLayoutContent *)&v12 description];
  id v4 = v3;
  unint64_t axis = self->_axis;
  if (axis > 2) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = off_1E5DC5670[axis];
  }
  double v7 = [v3 stringByAppendingFormat:@"axis %@\n", v6];

  [(PXSectionedLayoutContent *)self contentSize];
  float64x2_t v8 = NSStringFromCGSize(v14);
  long long v9 = [v7 stringByAppendingFormat:@"contentSize %@\n", v8];

  long long v10 = [v9 stringByAppendingFormat:@"sections %@\n", self->_sections];

  return v10;
}

- (PXSectionedLayoutContent)initWithAxis:(int64_t)a3 insets:(UIEdgeInsets)a4
{
  CGFloat right = a4.right;
  CGFloat bottom = a4.bottom;
  CGFloat left = a4.left;
  CGFloat top = a4.top;
  if (!a3)
  {
    double v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"PXSectionedLayoutContent.m" lineNumber:36 description:@"axis cannot be PXAxisUndefined"];
  }
  v17.receiver = self;
  v17.super_class = (Class)PXSectionedLayoutContent;
  long long v10 = [(PXSectionedLayoutContent *)&v17 init];
  long long v11 = v10;
  if (v10)
  {
    v10->_unint64_t axis = a3;
    v10->_edgeInsets.CGFloat top = top;
    v10->_edgeInsets.CGFloat left = left;
    v10->_edgeInsets.CGFloat bottom = bottom;
    v10->_edgeInsets.CGFloat right = right;
    uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
    sections = v11->_sections;
    v11->_sections = (NSMutableArray *)v12;
  }
  return v11;
}

- (PXSectionedLayoutContent)init
{
  return 0;
}

@end
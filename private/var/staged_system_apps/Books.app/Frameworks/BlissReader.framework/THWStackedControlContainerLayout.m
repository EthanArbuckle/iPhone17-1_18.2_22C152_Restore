@interface THWStackedControlContainerLayout
- (BOOL)allowsLastLineTruncation:(id)a3;
- (BOOL)alwaysStartsNewTarget;
- (BOOL)columnsAreLeftToRight;
- (BOOL)shrinkTextToFit;
- (CGRect)autosizedFrameForTextLayout:(id)a3 textSize:(CGSize)a4;
- (CGRect)nonAutosizedFrameForTextLayout:(id)a3;
- (CGSize)adjustedInsets;
- (Class)repClassForTextLayout:(id)a3;
- (NSArray)childrenWithFixedHeight;
- (NSArray)childrenWithFlexibleHeight;
- (THWStackedControlContainerLayoutDelegate)delegate;
- (TSWPPadding)layoutMargins;
- (double)gapForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4;
- (double)heightForFlexibleChildLayout:(id)a3;
- (double)maxAutoGrowWidthForTextLayout:(id)a3;
- (double)p_computeTotalHeightWithInsets:(UIEdgeInsets)a3 fixedOnly:(BOOL)a4;
- (double)positionForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4 outWidth:(double *)a5 outGap:(double *)a6;
- (double)widthForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4;
- (id)additionalDependenciesForChildLayout:(id)a3;
- (id)computeLayoutGeometry;
- (id)dependentsOfTextLayout:(id)a3;
- (id)layoutGeometryForLayout:(id)a3;
- (id)styleProviderForLayout:(id)a3;
- (id)styleProviderForStorage:(id)a3;
- (unint64_t)columnCount;
- (unsigned)autosizeFlagsForTextLayout:(id)a3;
- (unsigned)maxLineCountForTextLayout:(id)a3;
- (unsigned)verticalAlignmentForTextLayout:(id)a3;
- (void)dealloc;
- (void)p_positionChildrenWithAlignment:(unsigned int)a3;
- (void)setChildrenWithFixedHeight:(id)a3;
- (void)setChildrenWithFlexibleHeight:(id)a3;
- (void)updateChildrenFromInfo;
- (void)validate;
@end

@implementation THWStackedControlContainerLayout

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THWStackedControlContainerLayout;
  [(THWContainerLayout *)&v3 dealloc];
}

- (THWStackedControlContainerLayoutDelegate)delegate
{
  id v2 = [(THWStackedControlContainerLayout *)self info];

  return (THWStackedControlContainerLayoutDelegate *)[v2 delegate];
}

- (void)updateChildrenFromInfo
{
  v17.receiver = self;
  v17.super_class = (Class)THWStackedControlContainerLayout;
  [(THWContainerLayout *)&v17 updateChildrenFromInfo];
  objc_super v3 = [(THWStackedControlContainerLayout *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v4 = [(THWStackedControlContainerLayout *)self children];
    id v5 = [v4 countByEnumeratingWithState:&v13 objects:v18 count:16];
    if (v5)
    {
      id v6 = v5;
      v7 = 0;
      v8 = 0;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v4);
          }
          uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * i);
          if ([(THWStackedControlContainerLayoutDelegate *)v3 stackedControlContainer:self isHeightFlexibleForLayout:v11])
          {
            if (v8)
            {
              id v12 = v8;
            }
            else
            {
              id v12 = objc_alloc_init((Class)NSMutableArray);
              v8 = v12;
            }
          }
          else if (v7)
          {
            id v12 = v7;
          }
          else
          {
            id v12 = objc_alloc_init((Class)NSMutableArray);
            v7 = v12;
          }
          [v12 addObject:v11];
        }
        id v6 = [v4 countByEnumeratingWithState:&v13 objects:v18 count:16];
      }
      while (v6);
    }
    else
    {
      v7 = 0;
      v8 = 0;
    }
    [(THWStackedControlContainerLayout *)self setChildrenWithFixedHeight:v7];
    [(THWStackedControlContainerLayout *)self setChildrenWithFlexibleHeight:v8];
  }
  else
  {
    [(THWStackedControlContainerLayout *)self setChildrenWithFixedHeight:[(THWStackedControlContainerLayout *)self children]];
    [(THWStackedControlContainerLayout *)self setChildrenWithFlexibleHeight:0];
  }
}

- (id)additionalDependenciesForChildLayout:(id)a3
{
  childrenWithFlexibleHeight = self->_childrenWithFlexibleHeight;
  if (childrenWithFlexibleHeight
    && [(NSArray *)childrenWithFlexibleHeight indexOfObjectIdenticalTo:a3] != 0x7FFFFFFFFFFFFFFFLL)
  {
    return +[NSArray arrayWithObject:self];
  }
  else
  {
    id v6 = (char *)[(NSArray *)self->_childrenWithFixedHeight indexOfObjectIdenticalTo:a3]
       + 1;
    if (v6 < (char *)[(NSArray *)self->_childrenWithFixedHeight count]
      && (id v7 = [(NSArray *)self->_childrenWithFixedHeight objectAtIndex:v6]) != 0)
    {
      id result = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v7, self, 0);
    }
    else
    {
      id result = +[NSArray arrayWithObject:self];
    }
    if (self->_childrenWithFlexibleHeight)
    {
      return [result arrayByAddingObjectsFromArray:];
    }
  }
  return result;
}

- (double)p_computeTotalHeightWithInsets:(UIEdgeInsets)a3 fixedOnly:(BOOL)a4
{
  BOOL v4 = a4;
  double bottom = a3.bottom;
  double top = a3.top;
  v8 = [(THWStackedControlContainerLayout *)self delegate];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  if (v4) {
    childrenWithFixedHeight = self->_childrenWithFixedHeight;
  }
  else {
    childrenWithFixedHeight = (NSArray *)[(THWStackedControlContainerLayout *)self children];
  }
  double v10 = top + bottom;
  id v11 = [(NSArray *)childrenWithFixedHeight countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v32;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v32 != v13) {
          objc_enumerationMutation(childrenWithFixedHeight);
        }
        [*(id *)(*((void *)&v31 + 1) + 8 * i) frame];
        double v10 = v10 + v15;
      }
      id v12 = [(NSArray *)childrenWithFixedHeight countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v12);
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v16 = [(THWStackedControlContainerLayout *)self children];
  id v17 = [v16 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = 0;
    uint64_t v20 = *(void *)v28;
    do
    {
      v21 = 0;
      uint64_t v22 = v19;
      do
      {
        if (*(void *)v28 != v20) {
          objc_enumerationMutation(v16);
        }
        uint64_t v19 = *(void *)(*((void *)&v27 + 1) + 8 * (void)v21);
        if (v22)
        {
          [(THWStackedControlContainerLayoutDelegate *)v8 stackedControlContainer:self verticalPaddingAfter:v22];
          double v24 = v23;
          [(THWStackedControlContainerLayoutDelegate *)v8 stackedControlContainer:self verticalPaddingBefore:v19];
          if (v24 >= v25) {
            double v25 = v24;
          }
          double v10 = v10 + v25;
        }
        v21 = (char *)v21 + 1;
        uint64_t v22 = v19;
      }
      while (v18 != v21);
      id v18 = [v16 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v18);
  }
  return v10;
}

- (double)heightForFlexibleChildLayout:(id)a3
{
  id v5 = [(THWStackedControlContainerLayout *)self delegate];
  [(THWStackedControlContainerLayoutDelegate *)v5 stackedControlContainerInsets:self];
  -[THWStackedControlContainerLayout p_computeTotalHeightWithInsets:fixedOnly:](self, "p_computeTotalHeightWithInsets:fixedOnly:", 1);
  double v7 = v6;
  if (objc_opt_respondsToSelector())
  {
    [(THWStackedControlContainerLayoutDelegate *)v5 stackedControlContainer:self heightForFlexibleLayout:a3 withTotalFixedHeight:v7];
  }
  else
  {
    char v8 = objc_opt_respondsToSelector();
    double result = 0.0;
    if (v8)
    {
      -[THWStackedControlContainerLayoutDelegate stackedControlContainerMinHeight:](v5, "stackedControlContainerMinHeight:", self, 0.0);
      if (v7 >= v9) {
        double v10 = 0.0;
      }
      else {
        double v10 = v9 - v7;
      }
      return v10 / (double)[(NSArray *)self->_childrenWithFlexibleHeight count];
    }
  }
  return result;
}

- (id)layoutGeometryForLayout:(id)a3
{
  id v5 = [(THWStackedControlContainerLayout *)self children];
  double v6 = (char *)[v5 indexOfObjectIdenticalTo:a3];
  if (v6 == (char *)0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  char v8 = v6;
  double v9 = [(THWStackedControlContainerLayout *)self delegate];
  [(THWStackedControlContainerLayoutDelegate *)v9 stackedControlContainerWidth:self];
  double v11 = v10;
  [(THWStackedControlContainerLayoutDelegate *)v9 stackedControlContainerInsets:self];
  double v13 = v12;
  double v15 = v14;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && -[THWStackedControlContainerLayoutDelegate stackedControlContainer:isHeightFlexibleForLayout:](v9, "stackedControlContainer:isHeightFlexibleForLayout:", self, a3)&& (-[THWStackedControlContainerLayout heightForFlexibleChildLayout:](self, "heightForFlexibleChildLayout:", a3), v16 > 0.0)&& (id v17 = objc_msgSend(objc_alloc((Class)TSDLayoutGeometry), "initWithFrame:", v13, 0.0, v11 - v13 - v15, v16)) != 0|| (id v17 = -[THWStackedControlContainerLayoutDelegate stackedControlContainer:layoutGeometryForLayout:](v9, "stackedControlContainer:layoutGeometryForLayout:", self, a3)) != 0
    || (result = [a3 layoutGeometryFromInfo], (id v17 = result) != 0))
  {
    if (v8)
    {
      id v18 = [v5 objectAtIndex:v8 - 1];
      if (v18)
      {
        id v19 = v18;
        [v18 frame];
        CGRectGetMaxY(v30);
        [(THWStackedControlContainerLayoutDelegate *)v9 stackedControlContainer:self verticalPaddingAfter:v19];
        [(THWStackedControlContainerLayoutDelegate *)v9 stackedControlContainer:self verticalPaddingBefore:a3];
        [(THWStackedControlContainerLayoutDelegate *)v9 stackedControlContainer:self verticalSpacingAfter:v19];
      }
    }
    [(THWStackedControlContainerLayoutDelegate *)v9 stackedControlContainer:self verticalPaddingBefore:a3];
    [(THWStackedControlContainerLayoutDelegate *)v9 stackedControlContainer:self alignmentForLayout:self];
    CGFloat y = CGPointZero.y;
    [v17 size];
    CGFloat v22 = v21;
    CGFloat v24 = v23;
    memset(&v29, 0, sizeof(v29));
    [v17 transform];
    id v25 = [(THWStackedControlContainerLayout *)self geometry];
    if (v25) {
      [v25 transform];
    }
    else {
      memset(&t2, 0, sizeof(t2));
    }
    CGAffineTransformConcat(&v29, &t1, &t2);
    CGAffineTransform v26 = v29;
    v31.origin.x = CGPointZero.x;
    v31.origin.CGFloat y = y;
    v31.size.width = v22;
    v31.size.height = v24;
    CGRectApplyAffineTransform(v31, &v26);
    TSDSubtractPoints();
    return [v17 geometryByTranslatingBy:];
  }
  return result;
}

- (void)p_positionChildrenWithAlignment:(unsigned int)a3
{
  id v5 = [(THWStackedControlContainerLayout *)self delegate];
  [(THWStackedControlContainerLayoutDelegate *)v5 stackedControlContainerWidth:self];
  double v7 = v6;
  [(THWStackedControlContainerLayoutDelegate *)v5 stackedControlContainerInsets:self];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  if (a3)
  {
    double v15 = v8;
    if (objc_opt_respondsToSelector())
    {
      [(THWStackedControlContainerLayoutDelegate *)v5 stackedControlContainerMinHeight:self];
      double v17 = v16;
      -[THWStackedControlContainerLayout p_computeTotalHeightWithInsets:fixedOnly:](self, "p_computeTotalHeightWithInsets:fixedOnly:", 0, v10, v12, v15, v14);
      if (v18 < v17)
      {
        if (a3 == 1 || a3 == 3)
        {
          double v10 = v10 + (v17 - v18) * 0.5;
        }
        else if (a3 == 2)
        {
          double v10 = v10 + v17 - v18;
        }
      }
    }
  }
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v19 = [(THWStackedControlContainerLayout *)self children];
  id v20 = [v19 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v20)
  {
    id v21 = v20;
    CGFloat v22 = 0;
    uint64_t v23 = *(void *)v43;
    double v41 = v7 - v12 - v14;
    double v24 = v7 - v14;
    do
    {
      id v25 = 0;
      CGAffineTransform v26 = v22;
      do
      {
        if (*(void *)v43 != v23) {
          objc_enumerationMutation(v19);
        }
        CGFloat v22 = *(void **)(*((void *)&v42 + 1) + 8 * (void)v25);
        unsigned int v27 = [(THWStackedControlContainerLayoutDelegate *)v5 stackedControlContainer:self alignmentForLayout:v22];
        [v22 frame];
        double v29 = v28;
        double v31 = v30;
        if (objc_opt_respondsToSelector())
        {
          [(THWStackedControlContainerLayoutDelegate *)v5 stackedControlContainer:self minHeightForChildLayout:v22];
          double v31 = v32;
        }
        if (v26)
        {
          [(THWStackedControlContainerLayoutDelegate *)v5 stackedControlContainer:self verticalPaddingAfter:v26];
          double v34 = v33;
          [(THWStackedControlContainerLayoutDelegate *)v5 stackedControlContainer:self verticalPaddingBefore:v22];
          if (v34 >= v35) {
            double v35 = v34;
          }
          double v10 = v10 + v35;
        }
        [(THWStackedControlContainerLayoutDelegate *)v5 stackedControlContainer:self verticalSpacingBefore:v22];
        double v37 = v10 + v36;
        double v38 = v24 - v29;
        if (v27 != 1) {
          double v38 = v12;
        }
        id v39 = [v22 geometry:v12 + (v41 - v29) * 0.5, v38];
        TSDSubtractPoints();
        [v22 setGeometry:[v39 geometryByTranslatingBy:]];
        [(THWStackedControlContainerLayoutDelegate *)v5 stackedControlContainer:self verticalSpacingAfter:v22];
        double v10 = v31 + v37 + v40;
        id v25 = (char *)v25 + 1;
        CGAffineTransform v26 = v22;
      }
      while (v21 != v25);
      id v21 = [v19 countByEnumeratingWithState:&v42 objects:v46 count:16];
    }
    while (v21);
  }
}

- (void)validate
{
  [(THWStackedControlContainerLayout *)self invalidateFrame];
  v3.receiver = self;
  v3.super_class = (Class)THWStackedControlContainerLayout;
  [(THWControlContainerLayout *)&v3 validate];
}

- (id)computeLayoutGeometry
{
  objc_super v3 = [(THWStackedControlContainerLayout *)self delegate];
  if (objc_opt_respondsToSelector()) {
    id v4 = [(THWStackedControlContainerLayoutDelegate *)v3 stackedControlContainerVerticalAlignment:self];
  }
  else {
    id v4 = 0;
  }
  [(THWStackedControlContainerLayout *)self p_positionChildrenWithAlignment:v4];
  if (objc_opt_respondsToSelector()) {
    [(THWStackedControlContainerLayoutDelegate *)v3 stackedControlContainerChildrenPositioned:self];
  }
  id v5 = [(THWStackedControlContainerLayout *)self children];
  if ([v5 count]) {
    id v6 = [v5 objectAtIndex:0];
  }
  else {
    id v6 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (id v7 = [(THWStackedControlContainerLayoutDelegate *)v3 stackedControlContainerHeightLastChild:self]) == 0)
  {
    id v7 = [v5 lastObject];
  }
  [(THWStackedControlContainerLayoutDelegate *)v3 stackedControlContainerInsets:self];
  double v9 = v8;
  double v11 = v10;
  double v12 = v8;
  if (v6)
  {
    [v6 frame];
    double MinY = CGRectGetMinY(v28);
    [(THWStackedControlContainerLayoutDelegate *)v3 stackedControlContainer:self verticalSpacingBefore:v6];
    double v12 = MinY - v14;
  }
  double v15 = v9;
  if (v7)
  {
    [v7 frame];
    double MaxY = CGRectGetMaxY(v29);
    [(THWStackedControlContainerLayoutDelegate *)v3 stackedControlContainer:self verticalSpacingAfter:v7];
    double v15 = MaxY + v17;
  }
  [(THWStackedControlContainerLayoutDelegate *)v3 stackedControlContainerWidth:self];
  double v19 = v18;
  char v20 = objc_opt_respondsToSelector();
  double v21 = 0.0;
  if (v20) {
    -[THWStackedControlContainerLayoutDelegate stackedControlContainerMinHeight:](v3, "stackedControlContainerMinHeight:", self, 0.0);
  }
  double v22 = fmax(fmax(v11 + v15 - (v12 - v9), 0.0), v21);
  [(THWStackedControlContainerLayoutDelegate *)v3 stackedControlContainerOrigin:self];
  id v25 = [objc_alloc((Class)TSDLayoutGeometry) initWithFrame:v23, v24, v19, v22];

  return v25;
}

- (unsigned)autosizeFlagsForTextLayout:(id)a3
{
  id v5 = [(THWStackedControlContainerLayout *)self delegate];
  unsigned int v6 = 3;
  if (objc_opt_respondsToSelector())
  {
    if ([(THWStackedControlContainerLayoutDelegate *)v5 stackedControlContainer:self autoGrowHorizontallyTextLayout:a3])return 7; {
    else
    }
      return 3;
  }
  return v6;
}

- (unsigned)verticalAlignmentForTextLayout:(id)a3
{
  return 0;
}

- (CGRect)nonAutosizedFrameForTextLayout:(id)a3
{
  [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THWStackedControlContainerLayout nonAutosizedFrameForTextLayout:]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/THWStackedControlContainer.m"] lineNumber:436 description:@"shouldn't be called"];
  double v3 = 100.0;
  double v4 = 0.0;
  double v5 = 0.0;
  double v6 = 100.0;
  result.size.height = v6;
  result.size.width = v3;
  result.origin.CGFloat y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)autosizedFrameForTextLayout:(id)a3 textSize:(CGSize)a4
{
  CGFloat height = a4.height;
  double width = a4.width;
  double v8 = [(THWStackedControlContainerLayout *)self delegate];
  id v9 = [(THWStackedControlContainerLayout *)self children];
  double v10 = (char *)[v9 indexOfObjectIdenticalTo:a3];
  if (v10)
  {
    id v11 = [v9 objectAtIndex:v10 - 1];
    [(THWStackedControlContainerLayoutDelegate *)v8 stackedControlContainerInsets:self];
    double v14 = v13;
    double v16 = v15;
    if (v11)
    {
      [v11 frame];
      double MaxY = CGRectGetMaxY(v35);
      [(THWStackedControlContainerLayoutDelegate *)v8 stackedControlContainer:self verticalPaddingAfter:v11];
      double v19 = v18;
      [(THWStackedControlContainerLayoutDelegate *)v8 stackedControlContainer:self verticalPaddingBefore:a3];
      if (v19 < v20) {
        double v19 = v20;
      }
      [(THWStackedControlContainerLayoutDelegate *)v8 stackedControlContainer:self verticalSpacingAfter:v11];
      double v22 = MaxY + v21 + v19;
    }
    else
    {
      double v22 = v12;
    }
  }
  else
  {
    [(THWStackedControlContainerLayoutDelegate *)v8 stackedControlContainerInsets:self];
    double v22 = v23;
    double v14 = v24;
    double v16 = v25;
  }
  [(THWStackedControlContainerLayoutDelegate *)v8 stackedControlContainer:self verticalSpacingBefore:a3];
  double v27 = v26;
  [(THWStackedControlContainerLayoutDelegate *)v8 stackedControlContainerWidth:self];
  double v29 = v28;
  if (objc_opt_respondsToSelector())
  {
    [(THWStackedControlContainerLayoutDelegate *)v8 stackedControlContainer:self leftRightInsetForTextLayout:a3];
    double v16 = v30;
    double v14 = v30;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [(THWStackedControlContainerLayoutDelegate *)v8 stackedControlContainer:self autoGrowHorizontallyTextLayout:a3])
  {
    double v29 = v16 + width + v14;
  }
  double v31 = v22 + v27;
  double v32 = v29 - v14 - v16;
  double v33 = v14;
  double v34 = height;
  result.size.CGFloat height = v34;
  result.size.double width = v32;
  result.origin.CGFloat y = v31;
  result.origin.x = v33;
  return result;
}

- (id)dependentsOfTextLayout:(id)a3
{
  return [(THWStackedControlContainerLayout *)self additionalDependenciesForChildLayout:a3];
}

- (Class)repClassForTextLayout:(id)a3
{
  return 0;
}

- (id)styleProviderForLayout:(id)a3
{
  double v5 = [(THWStackedControlContainerLayout *)self delegate];

  return [(THWStackedControlContainerLayoutDelegate *)v5 stackedControlContainer:self styleProviderForLayout:a3];
}

- (id)styleProviderForStorage:(id)a3
{
  double v5 = [(THWStackedControlContainerLayout *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }

  return [(THWStackedControlContainerLayoutDelegate *)v5 stackedControlContainer:self styleProviderForStorage:a3];
}

- (BOOL)allowsLastLineTruncation:(id)a3
{
  double v5 = [(THWStackedControlContainerLayout *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }

  return [(THWStackedControlContainerLayoutDelegate *)v5 stackedControlContainer:self allowsLastLineTruncationForLayout:a3];
}

- (unsigned)maxLineCountForTextLayout:(id)a3
{
  double v5 = [(THWStackedControlContainerLayout *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }

  return [(THWStackedControlContainerLayoutDelegate *)v5 stackedControlContainer:self maxLineCountForLayout:a3];
}

- (double)maxAutoGrowWidthForTextLayout:(id)a3
{
  double v4 = [(THWStackedControlContainerLayout *)self delegate];
  [(THWStackedControlContainerLayoutDelegate *)v4 stackedControlContainerWidth:self];
  double v6 = v5;
  [(THWStackedControlContainerLayoutDelegate *)v4 stackedControlContainerInsets:self];
  return v6 - v7 - v8;
}

- (CGSize)adjustedInsets
{
  double width = CGSizeZero.width;
  double height = CGSizeZero.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (TSWPPadding)layoutMargins
{
  return 0;
}

- (unint64_t)columnCount
{
  return 1;
}

- (double)widthForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4
{
  return 0.0;
}

- (double)gapForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4
{
  return 0.0;
}

- (double)positionForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4 outWidth:(double *)a5 outGap:(double *)a6
{
  if (a3) {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THWStackedControlContainerLayout positionForColumnIndex:bodyWidth:outWidth:outGap:]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/THWStackedControlContainer.m"] lineNumber:578 description:@"unexpected column index"];
  }
  if (a5) {
    *a5 = a4;
  }
  if (a6) {
    *a6 = 0.0;
  }
  return 0.0;
}

- (BOOL)alwaysStartsNewTarget
{
  return 0;
}

- (BOOL)shrinkTextToFit
{
  return 0;
}

- (BOOL)columnsAreLeftToRight
{
  return 1;
}

- (NSArray)childrenWithFixedHeight
{
  return self->_childrenWithFixedHeight;
}

- (void)setChildrenWithFixedHeight:(id)a3
{
}

- (NSArray)childrenWithFlexibleHeight
{
  return self->_childrenWithFlexibleHeight;
}

- (void)setChildrenWithFlexibleHeight:(id)a3
{
}

@end
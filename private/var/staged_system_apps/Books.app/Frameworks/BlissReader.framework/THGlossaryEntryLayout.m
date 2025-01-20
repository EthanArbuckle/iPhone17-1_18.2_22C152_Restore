@interface THGlossaryEntryLayout
- (BOOL)alwaysStartsNewTarget;
- (BOOL)columnsAreLeftToRight;
- (BOOL)p_shouldHaveFloatingLayout;
- (BOOL)shouldWrapAgainstFloatingDrawables;
- (BOOL)shrinkTextToFit;
- (BOOL)textIsVertical;
- (CGRect)autosizedFrameForTextLayout:(id)a3 textSize:(CGSize)a4;
- (CGRect)footerIndexDividerFrame;
- (CGRect)footerIndexTitleFrame;
- (CGRect)footerTermsDividerFrame;
- (CGRect)footerTermsTitleFrame;
- (CGRect)nonAutosizedFrameForTextLayout:(id)a3;
- (CGRect)p_columnFrameBasedOnStyle;
- (CGRect)p_unscaledViewFrameBasedOnStyle;
- (CGRect)p_viewFrameBasedOnStyle;
- (CGSize)adjustedInsets;
- (CGSize)maximumFrameSizeForChild:(id)a3;
- (Class)repClassForTextLayout:(id)a3;
- (THGlossaryDividerLayout)indexDividerLayout;
- (THGlossaryDividerLayout)relatedTermsDividerLayout;
- (THGlossaryEntryFloatingLayout)floatingLayout;
- (THGlossaryEntryLayoutStyleProvider)layoutStyleProvider;
- (THGlossaryWPLayout)bodyLayout;
- (THGlossaryWPLayout)headerLayout;
- (THGlossaryWPLayout)indexLayout;
- (THGlossaryWPLayout)relatedTermsLayout;
- (THWLabelControlLayout)indexLabelLayout;
- (THWLabelControlLayout)relatedTermsLabelLayout;
- (TSWPPadding)layoutMargins;
- (double)gapForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4;
- (double)maxAutoGrowHeightForTextLayout:(id)a3;
- (double)p_columnMargin;
- (double)p_heightForPortion:(int)a3;
- (double)p_topCoordinateForPortion:(int)a3;
- (double)positionForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4 outWidth:(double *)a5 outGap:(double *)a6;
- (double)widthForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4;
- (id)additionalDependenciesForChildLayout:(id)a3;
- (id)computeLayoutGeometry;
- (id)dependentsOfTextLayout:(id)a3;
- (id)p_layoutForPortion:(int)a3;
- (id)reliedOnLayouts;
- (id)reliedOnLayoutsForLayout:(id)a3;
- (id)textWrapper;
- (int)p_portionForLayout:(id)a3;
- (int64_t)p_portionCount;
- (unint64_t)columnCount;
- (unsigned)autosizeFlagsForTextLayout:(id)a3;
- (unsigned)verticalAlignmentForTextLayout:(id)a3;
- (void)dealloc;
- (void)p_updateFloatingPositionsIfRequired;
- (void)setIndexDividerLayout:(id)a3;
- (void)setIndexLabelLayout:(id)a3;
- (void)setLayoutStyleProvider:(id)a3;
- (void)setRelatedTermsDividerLayout:(id)a3;
- (void)setRelatedTermsLabelLayout:(id)a3;
- (void)updateChildrenFromInfo;
@end

@implementation THGlossaryEntryLayout

- (void)setLayoutStyleProvider:(id)a3
{
  self->mLayoutStyleProvider = (THGlossaryEntryLayoutStyleProvider *)a3;
  [(THGlossaryEntryLayout *)self updateChildrenFromInfo];
}

- (void)dealloc
{
  [(THGlossaryWPLayout *)self->mHeaderLayout setParent:0];

  self->mHeaderLayout = 0;
  [(THGlossaryWPLayout *)self->mBodyLayout setLayoutRequirementsProvider:0];
  [(THGlossaryWPLayout *)self->mBodyLayout setParent:0];

  self->mBodyLayout = 0;
  [(THGlossaryWPLayout *)self->mRelatedTermsLayout setParent:0];

  self->mRelatedTermsLayout = 0;
  [(THGlossaryWPLayout *)self->mIndexLayout setParent:0];

  self->mIndexLayout = 0;
  [(THGlossaryEntryFloatingLayout *)self->mFloatingLayout setParent:0];

  self->mFloatingLayout = 0;
  [(THWLabelControlLayout *)[(THGlossaryEntryLayout *)self relatedTermsLabelLayout] setParent:0];
  [(THGlossaryEntryLayout *)self setRelatedTermsLabelLayout:0];
  [(THGlossaryDividerLayout *)[(THGlossaryEntryLayout *)self relatedTermsDividerLayout] setParent:0];
  [(THGlossaryEntryLayout *)self setRelatedTermsDividerLayout:0];
  [(THWLabelControlLayout *)[(THGlossaryEntryLayout *)self indexLabelLayout] setParent:0];
  [(THGlossaryEntryLayout *)self setIndexLabelLayout:0];
  [(THGlossaryDividerLayout *)[(THGlossaryEntryLayout *)self indexDividerLayout] setParent:0];
  [(THGlossaryEntryLayout *)self setIndexDividerLayout:0];
  v3.receiver = self;
  v3.super_class = (Class)THGlossaryEntryLayout;
  [(THGlossaryEntryLayout *)&v3 dealloc];
}

- (BOOL)p_shouldHaveFloatingLayout
{
  return [(THGlossaryEntryLayoutStyleProvider *)self->mLayoutStyleProvider glossaryEntryLayoutFloatingStyle] != 0;
}

- (BOOL)shouldWrapAgainstFloatingDrawables
{
  return [(THGlossaryEntryLayoutStyleProvider *)self->mLayoutStyleProvider glossaryEntryLayoutFloatingStyle] == 1;
}

- (THGlossaryWPLayout)headerLayout
{
  id v3 = [[self info] headerInfo];
  result = self->mHeaderLayout;
  if (result) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = v3 == 0;
  }
  if (!v5)
  {
    v6 = [[THGlossaryWPLayout alloc] initWithInfo:v3];
    self->mHeaderLayout = v6;
    [(THGlossaryWPLayout *)v6 setParent:self];
    [(THGlossaryWPLayout *)self->mHeaderLayout setLayoutRequirementsProvider:self];
    return self->mHeaderLayout;
  }
  return result;
}

- (THGlossaryWPLayout)bodyLayout
{
  id v3 = [[self info] bodyStorage];
  result = self->mBodyLayout;
  if (result) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = v3 == 0;
  }
  if (!v5)
  {
    v6 = [[THGlossaryWPLayout alloc] initWithInfo:v3];
    self->mBodyLayout = v6;
    [(THGlossaryWPLayout *)v6 setParent:self];
    [(THGlossaryWPLayout *)self->mBodyLayout setLayoutRequirementsProvider:self];
    return self->mBodyLayout;
  }
  return result;
}

- (THGlossaryWPLayout)relatedTermsLayout
{
  id v3 = [self info].relatedTermsInfo;
  result = self->mRelatedTermsLayout;
  if (result) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = v3 == 0;
  }
  if (!v5)
  {
    v6 = [[THGlossaryWPLayout alloc] initWithInfo:v3];
    self->mRelatedTermsLayout = v6;
    [(THGlossaryWPLayout *)v6 setParent:self];
    [(THGlossaryWPLayout *)self->mRelatedTermsLayout setLayoutRequirementsProvider:self];
    return self->mRelatedTermsLayout;
  }
  return result;
}

- (THGlossaryWPLayout)indexLayout
{
  id v3 = [self info].linksInfo;
  result = self->mIndexLayout;
  if (result) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = v3 == 0;
  }
  if (!v5)
  {
    v6 = [[THGlossaryWPLayout alloc] initWithInfo:v3];
    self->mIndexLayout = v6;
    [(THGlossaryWPLayout *)v6 setParent:self];
    [(THGlossaryWPLayout *)self->mIndexLayout setLayoutRequirementsProvider:self];
    return self->mIndexLayout;
  }
  return result;
}

- (THGlossaryEntryFloatingLayout)floatingLayout
{
  id v3 = [self info].floatingInfo;
  if (self->mFloatingLayout) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = v3 == 0;
  }
  if (!v4)
  {
    BOOL v5 = v3;
    if ([(THGlossaryEntryLayout *)self p_shouldHaveFloatingLayout])
    {
      v6 = (THGlossaryEntryFloatingLayout *)objc_msgSend(objc_alloc((Class)objc_msgSend(v5, "layoutClass")), "initWithInfo:", v5);
      self->mFloatingLayout = v6;
      [(THGlossaryEntryFloatingLayout *)v6 setParent:self];
    }
  }
  return self->mFloatingLayout;
}

- (THWLabelControlLayout)relatedTermsLabelLayout
{
  result = self->_relatedTermsLabelLayout;
  if (!result)
  {
    result = [(THWControlLayout *)[THWLabelControlLayout alloc] initWithTag:0];
    self->_relatedTermsLabelLayout = result;
  }
  return result;
}

- (THGlossaryDividerLayout)relatedTermsDividerLayout
{
  result = self->_relatedTermsDividerLayout;
  if (!result)
  {
    result = objc_alloc_init(THGlossaryDividerLayout);
    self->_relatedTermsDividerLayout = result;
  }
  return result;
}

- (THWLabelControlLayout)indexLabelLayout
{
  result = self->_indexLabelLayout;
  if (!result)
  {
    result = [(THWControlLayout *)[THWLabelControlLayout alloc] initWithTag:1];
    self->_indexLabelLayout = result;
  }
  return result;
}

- (THGlossaryDividerLayout)indexDividerLayout
{
  result = self->_indexDividerLayout;
  if (!result)
  {
    result = objc_alloc_init(THGlossaryDividerLayout);
    self->_indexDividerLayout = result;
  }
  return result;
}

- (int)p_portionForLayout:(id)a3
{
  if (self->mHeaderLayout == a3) {
    return 1;
  }
  if (self->mBodyLayout == a3) {
    return 2;
  }
  if (self->mRelatedTermsLayout == a3) {
    return 3;
  }
  return 4 * (self->mIndexLayout == a3);
}

- (id)p_layoutForPortion:(int)a3
{
  if ((a3 - 1) > 3) {
    return 0;
  }
  else {
    return *(id *)&self->TSDLayout_opaque[*off_459010[a3 - 1]];
  }
}

- (double)p_heightForPortion:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  double v5 = 0.0;
  if ([(THGlossaryEntryLayoutStyleProvider *)self->mLayoutStyleProvider glossaryEntryLayoutIncludePortion:"glossaryEntryLayoutIncludePortion:"])
  {
    id v6 = [(THGlossaryEntryLayout *)self p_layoutForPortion:v3];
    [(THGlossaryEntryLayoutStyleProvider *)self->mLayoutStyleProvider glossaryEntryLayoutDefaultHeightForPortion:v3];
    if (v6)
    {
      objc_msgSend(objc_msgSend(v6, "geometry"), "size");
      double v5 = v8;
    }
    else
    {
      double v5 = v7;
    }
    if (v3 == 2)
    {
      [(THGlossaryEntryLayout *)self p_updateFloatingPositionsIfRequired];
      unsigned int v9 = [(THGlossaryEntryLayoutStyleProvider *)self->mLayoutStyleProvider glossaryEntryLayoutFloatingStyle];
      if (v9 == 1)
      {
        [(THGlossaryEntryFloatingLayout *)self->mFloatingLayout boundingBoxForChildren];
        double MaxY = CGRectGetMaxY(v17);
      }
      else
      {
        if (v9 != 2) {
          return v5;
        }
        [(THGlossaryEntryFloatingLayout *)self->mFloatingLayout boundingBoxForChildren];
        double v10 = CGRectGetMaxY(v16);
        [(THGlossaryEntryLayoutStyleProvider *)self->mLayoutStyleProvider glossaryEntryLayoutValueForDistance:6];
        double MaxY = v10 + v11;
      }
      [(THGlossaryEntryLayout *)self p_topCoordinateForPortion:2];
      double v14 = MaxY - v13;
      if (v14 > v5) {
        return v14;
      }
    }
  }
  return v5;
}

- (double)p_topCoordinateForPortion:(int)a3
{
  [(THGlossaryEntryLayoutStyleProvider *)self->mLayoutStyleProvider glossaryEntryLayoutTopMarginForPortion:"glossaryEntryLayoutTopMarginForPortion:"];
  uint64_t v6 = (uint64_t)v5;
  if (a3 >= 2)
  {
    uint64_t v7 = 1;
    do
    {
      [(THGlossaryEntryLayoutStyleProvider *)self->mLayoutStyleProvider glossaryEntryLayoutTopMarginForPortion:v7];
      double v9 = v8 + (double)v6;
      [(THGlossaryEntryLayout *)self p_heightForPortion:v7];
      uint64_t v7 = (v7 + 1);
      uint64_t v6 = (uint64_t)(v10 + (double)(uint64_t)v9);
    }
    while (a3 != v7);
  }
  return (double)v6;
}

- (void)updateChildrenFromInfo
{
  id v3 = [self info].childInfos;
  id v4 = [objc_alloc((Class)TSUNoCopyDictionary) initWithCapacity:5];
  if ([(THGlossaryEntryLayoutStyleProvider *)self->mLayoutStyleProvider glossaryEntryLayoutIncludePortion:1])
  {
    double v5 = [(THGlossaryEntryLayout *)self headerLayout];
    if ([(THGlossaryWPLayout *)v5 info]) {
      [v4 setObject:v5 forUncopiedKey:[v5 info]];
    }
  }
  if ([(THGlossaryEntryLayoutStyleProvider *)self->mLayoutStyleProvider glossaryEntryLayoutIncludePortion:2])
  {
    uint64_t v6 = [(THGlossaryEntryLayout *)self bodyLayout];
    if ([(THGlossaryWPLayout *)v6 info]) {
      [v4 setObject:v6 forUncopiedKey:[THGlossaryWPLayout info]];
    }
  }
  if ([(THGlossaryEntryLayoutStyleProvider *)self->mLayoutStyleProvider glossaryEntryLayoutIncludePortion:3])
  {
    uint64_t v7 = [(THGlossaryEntryLayout *)self relatedTermsLayout];
    if ([(THGlossaryWPLayout *)v7 info]) {
      [v4 setObject:v7 forUncopiedKey:[THGlossaryWPLayout info:v7]];
    }
  }
  if ([(THGlossaryEntryLayoutStyleProvider *)self->mLayoutStyleProvider glossaryEntryLayoutIncludePortion:4])
  {
    double v8 = [(THGlossaryEntryLayout *)self indexLayout];
    if ([(THGlossaryWPLayout *)v8 info]) {
      [v4 setObject:v8 forUncopiedKey:[THGlossaryWPLayout info]];
    }
  }
  double v9 = [(THGlossaryEntryLayout *)self floatingLayout];
  if ([(THGlossaryEntryFloatingLayout *)v9 info]) {
    [v4 setObject:v9 forUncopiedKey:[v9 info]];
  }
  id v10 = [self children].count;
  if (v10 != [v4 count])
  {
    id v11 = [objc_alloc((Class)NSMutableArray) initWithCapacity:5];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v12 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v18;
      do
      {
        v15 = 0;
        do
        {
          if (*(void *)v18 != v14) {
            objc_enumerationMutation(v3);
          }
          id v16 = [v4 objectForKey:*(void *)(*((void *)&v17 + 1) + 8 * (void)v15)];
          if (v16) {
            [v11 addObject:v16];
          }
          v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        id v13 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v13);
    }
    if ([(THGlossaryEntryLayoutStyleProvider *)self->mLayoutStyleProvider glossaryEntryLayoutIncludePortion:3])
    {
      [v11 addObject:[self relatedTermsLabelLayout]];
      [v11 addObject:[self relatedTermsDividerLayout]];
    }
    if ([(THGlossaryEntryLayoutStyleProvider *)self->mLayoutStyleProvider glossaryEntryLayoutIncludePortion:4])
    {
      [v11 addObject:[self indexLabelLayout]];
      [v11 addObject:[self indexDividerLayout]];
    }
    [(THGlossaryEntryLayout *)self setChildren:v11];

    [(THGlossaryEntryLayout *)self invalidate];
  }

  [self.children makeObjectsPerformSelector:@"updateChildrenFromInfo"];
}

- (double)p_columnMargin
{
  [(THGlossaryEntryLayoutStyleProvider *)self->mLayoutStyleProvider glossaryEntryLayoutValueForDistance:0];
  return result;
}

- (CGRect)p_viewFrameBasedOnStyle
{
  mLayoutStyleProvider = self->mLayoutStyleProvider;
  if (mLayoutStyleProvider)
  {
    [(THGlossaryEntryLayoutStyleProvider *)mLayoutStyleProvider glossaryEntryLayoutViewFrame];
  }
  else
  {
    double v3 = 0.0;
    double v5 = 100.0;
    double v4 = 0.0;
    double v6 = 100.0;
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)p_unscaledViewFrameBasedOnStyle
{
  [(THGlossaryEntryLayout *)self p_viewFrameBasedOnStyle];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  objc_msgSend(objc_msgSend(-[THGlossaryEntryLayout layoutController](self, "layoutController"), "canvas"), "viewScale");
  double v12 = v10 / v11;
  double v13 = v8 / v11;
  double v14 = v4;
  double v15 = v6;
  result.size.height = v12;
  result.size.width = v13;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (CGRect)p_columnFrameBasedOnStyle
{
  [(THGlossaryEntryLayout *)self p_columnMargin];
  CGFloat v4 = v3;
  [(THGlossaryEntryLayout *)self p_unscaledViewFrameBasedOnStyle];
  CGRect v14 = CGRectInset(v13, v4, 0.0);
  CGFloat x = v14.origin.x;
  CGFloat y = v14.origin.y;
  CGFloat width = v14.size.width;
  CGFloat height = v14.size.height;
  if (CGRectIsNull(v14))
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THGlossaryEntryLayout p_columnFrameBasedOnStyle]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THGlossaryEntryLayout.m") lineNumber:385 description:@"Column frame is NULL. Margin is probably too big."];
    CGFloat x = CGRectZero.origin.x;
    CGFloat y = CGRectZero.origin.y;
    CGFloat width = CGRectZero.size.width;
    CGFloat height = CGRectZero.size.height;
  }
  double v9 = x;
  double v10 = y;
  double v11 = width;
  double v12 = height;
  result.size.CGFloat height = v12;
  result.size.CGFloat width = v11;
  result.origin.CGFloat y = v10;
  result.origin.CGFloat x = v9;
  return result;
}

- (CGRect)footerIndexTitleFrame
{
  [(THGlossaryEntryLayout *)self p_columnFrameBasedOnStyle];
  double v4 = v3;
  double v6 = v5;
  [(THGlossaryEntryLayout *)self p_topCoordinateForPortion:4];
  double v8 = 28.0;
  double v9 = v7 + self->mFooterOffset - 28.0;
  double v10 = v4;
  double v11 = v6;
  result.size.CGFloat height = v8;
  result.size.CGFloat width = v11;
  result.origin.CGFloat y = v9;
  result.origin.CGFloat x = v10;
  return result;
}

- (CGRect)footerIndexDividerFrame
{
  [(THGlossaryEntryLayout *)self p_columnFrameBasedOnStyle];
  double v4 = v3;
  double v6 = v5;
  [(THGlossaryEntryLayout *)self p_topCoordinateForPortion:4];
  double v8 = v7;
  double mFooterOffset = self->mFooterOffset;
  [(THGlossaryEntryLayout *)self contentsScale];
  double v10 = 1.0;
  if (v11 > 1.0)
  {
    [(THGlossaryEntryLayout *)self contentsScale];
    double v10 = 1.0 / v12;
  }
  double v13 = v8 + mFooterOffset - (23.0 + 28.0);
  double v14 = v4;
  double v15 = v6;
  double v16 = v10;
  result.size.CGFloat height = v16;
  result.size.CGFloat width = v15;
  result.origin.CGFloat y = v13;
  result.origin.CGFloat x = v14;
  return result;
}

- (CGRect)footerTermsTitleFrame
{
  [(THGlossaryEntryLayout *)self p_columnFrameBasedOnStyle];
  double v4 = v3;
  double v6 = v5;
  [(THGlossaryEntryLayout *)self p_topCoordinateForPortion:3];
  double v8 = 28.0;
  double v9 = v7 + self->mFooterOffset - 28.0;
  double v10 = v4;
  double v11 = v6;
  result.size.CGFloat height = v8;
  result.size.CGFloat width = v11;
  result.origin.CGFloat y = v9;
  result.origin.CGFloat x = v10;
  return result;
}

- (CGRect)footerTermsDividerFrame
{
  [(THGlossaryEntryLayout *)self p_columnFrameBasedOnStyle];
  double v4 = v3;
  double v6 = v5;
  [(THGlossaryEntryLayout *)self p_topCoordinateForPortion:3];
  double v8 = v7;
  double mFooterOffset = self->mFooterOffset;
  [(THGlossaryEntryLayout *)self contentsScale];
  double v10 = 1.0;
  if (v11 > 1.0)
  {
    [(THGlossaryEntryLayout *)self contentsScale];
    double v10 = 1.0 / v12;
  }
  double v13 = v8 + mFooterOffset - (23.0 + 28.0);
  double v14 = v4;
  double v15 = v6;
  double v16 = v10;
  result.size.CGFloat height = v16;
  result.size.CGFloat width = v15;
  result.origin.CGFloat y = v13;
  result.origin.CGFloat x = v14;
  return result;
}

- (id)reliedOnLayouts
{
  id v2 = [(THGlossaryEntryLayout *)self children];

  return +[NSSet setWithArray:v2];
}

- (void)p_updateFloatingPositionsIfRequired
{
  if ([(THGlossaryEntryLayoutStyleProvider *)self->mLayoutStyleProvider glossaryEntryLayoutFloatingStyle] == 2)
  {
    [(THGlossaryEntryLayout *)self p_columnFrameBasedOnStyle];
    [(THGlossaryEntryLayoutStyleProvider *)self->mLayoutStyleProvider glossaryEntryLayoutValueForDistance:5];
    double v4 = v3;
    [(THGlossaryEntryLayoutStyleProvider *)self->mLayoutStyleProvider glossaryEntryLayoutValueForDistance:4];
    double v6 = v5;
    [(THGlossaryEntryLayout *)self p_topCoordinateForPortion:2];
    double v8 = v7;
    [(-[THGlossaryEntryLayout bodyLayout](self, "bodyLayout")) geometry].size;
    double v10 = v9;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v11 = [(THGlossaryEntryFloatingLayout *)[(THGlossaryEntryLayout *)self floatingLayout] floatingLayouts];
    id v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v12)
    {
      id v13 = v12;
      double v14 = v6 + v8 + v10;
      uint64_t v15 = *(void *)v21;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v21 != v15) {
            objc_enumerationMutation(v11);
          }
          long long v17 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          objc_msgSend(objc_msgSend(v17, "geometry"), "frame");
          double v19 = v18;
          TSDSubtractPoints();
          [v17 offsetGeometryBy:];
          double v14 = v14 + v4 + v19;
        }
        id v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v13);
    }
  }
}

- (int64_t)p_portionCount
{
  if ([(THGlossaryEntryLayoutStyleProvider *)self->mLayoutStyleProvider glossaryEntryLayoutHasFooter])return 5; {
  else
  }
    return 3;
}

- (id)computeLayoutGeometry
{
  [(THGlossaryEntryLayoutStyleProvider *)self->mLayoutStyleProvider glossaryEntryLayoutValueForDistance:1];
  double v4 = v3;
  uint64_t v5 = [(THGlossaryEntryLayout *)self p_portionCount];
  uint64_t v6 = v5;
  if (v5 >= 3) {
    uint64_t v7 = 3;
  }
  else {
    uint64_t v7 = v5;
  }
  if (v7 < 2)
  {
    double v9 = v4;
  }
  else
  {
    uint64_t v8 = 1;
    double v9 = v4;
    do
    {
      [(THGlossaryEntryLayoutStyleProvider *)self->mLayoutStyleProvider glossaryEntryLayoutTopMarginForPortion:v8];
      double v11 = v9 + v10;
      [(THGlossaryEntryLayout *)self p_heightForPortion:v8];
      double v9 = v11 + v12;
      ++v8;
    }
    while (v7 != v8);
  }
  double v13 = 0.0;
  if (v6 >= 4)
  {
    for (uint64_t i = 3; i < v6; uint64_t i = (i + 1))
    {
      [(THGlossaryEntryLayoutStyleProvider *)self->mLayoutStyleProvider glossaryEntryLayoutTopMarginForPortion:i];
      double v16 = v13 + v15;
      [(THGlossaryEntryLayout *)self p_heightForPortion:i];
      double v13 = v16 + v17;
    }
  }
  double v18 = v4 + v13;
  double v19 = v9 + v4 + v13;
  [(THGlossaryEntryLayout *)self p_unscaledViewFrameBasedOnStyle];
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  self->double mFooterOffset = 0.0;
  if ([(THGlossaryEntryLayoutStyleProvider *)self->mLayoutStyleProvider glossaryEntryLayoutHasFooter])
  {
    double mFooterOffset = v25 - v19;
    self->double mFooterOffset = v25 - v19;
  }
  else
  {
    double mFooterOffset = self->mFooterOffset;
  }
  if (mFooterOffset > 0.0)
  {
    [(THGlossaryEntryLayoutStyleProvider *)self->mLayoutStyleProvider glossaryEntryLayoutValueForDistance:2];
    double v28 = v4 + v27;
    double mFooterOffset = self->mFooterOffset;
    if (v28 > v18) {
      double mFooterOffset = mFooterOffset - (v28 - v18);
    }
  }
  double v29 = fmax(mFooterOffset, 0.0);
  self->double mFooterOffset = v29;
  if (self->mRelatedTermsLayout)
  {
    [(THGlossaryEntryLayout *)self p_topCoordinateForPortion:3];
    double v31 = v30 + self->mFooterOffset;
    id v32 = [(THGlossaryWPLayout *)self->mRelatedTermsLayout geometry];
    if (v32)
    {
      [v32 transform];
      double v33 = *((double *)&v62 + 1);
    }
    else
    {
      long long v61 = 0u;
      long long v62 = 0u;
      long long v60 = 0u;
      double v33 = 0.0;
    }
    -[THGlossaryWPLayout offsetGeometryBy:](self->mRelatedTermsLayout, "offsetGeometryBy:", 0.0, v31 - v33);
  }
  if (self->mIndexLayout)
  {
    [(THGlossaryEntryLayout *)self p_topCoordinateForPortion:4];
    double v35 = v34 + self->mFooterOffset;
    id v36 = [(THGlossaryWPLayout *)self->mIndexLayout geometry];
    if (v36)
    {
      [v36 transform];
      double v37 = *((double *)&v59 + 1);
    }
    else
    {
      long long v58 = 0u;
      long long v59 = 0u;
      long long v57 = 0u;
      double v37 = 0.0;
    }
    -[THGlossaryWPLayout offsetGeometryBy:](self->mIndexLayout, "offsetGeometryBy:", 0.0, v35 - v37, v57, v58, v59, v60, v61, v62);
  }
  [(THGlossaryEntryLayoutStyleProvider *)self->mLayoutStyleProvider glossaryEntryLayoutContentSize];
  id v39 = [objc_alloc((Class)TSDLayoutGeometry) initWithFrame:v21, v23, v38, v19 + v29];
  [(THGlossaryEntryLayout *)self footerTermsTitleFrame];
  [-[THGlossaryEntryLayout relatedTermsLabelLayout](self, "relatedTermsLabelLayout") setGeometry:[objc_alloc((Class)TSDLayoutGeometry) initWithFrame:v40, v41, v42, v43]];
  [(THGlossaryEntryLayout *)self footerTermsDividerFrame];
  -[THGlossaryDividerLayout setGeometry:][self relatedTermsDividerLayout] setGeometry:[objc_alloc((Class)TSDLayoutGeometry) initWithFrame:v44, v45, v46, v47];
  [(THGlossaryEntryLayout *)self footerIndexTitleFrame];
  -[THGlossaryEntryLayout indexLabelLayout](self, "indexLabelLayout").setGeometry:[objc_alloc((Class)TSDLayoutGeometry) initWithFrame:v48, v49, v50, v51];
  [(THGlossaryEntryLayout *)self footerIndexDividerFrame];
  -[THGlossaryDividerLayout setGeometry:][-[THGlossaryEntryLayout indexDividerLayout](self, "indexDividerLayout") setGeometry:[objc_alloc((Class)TSDLayoutGeometry) initWithFrame:v52, v53, v54, v55]];
  return v39;
}

- (double)widthForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4
{
  double result = 0.0;
  if (!a3) {
    objc_msgSend(objc_msgSend(-[THGlossaryEntryLayout info](self, "info", 0.0, v4, v5), "geometry"), "size");
  }
  return result;
}

- (double)gapForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4
{
  return 0.0;
}

- (double)positionForColumnIndex:(unint64_t)a3 bodyWidth:(double)a4 outWidth:(double *)a5 outGap:(double *)a6
{
  return 0.0;
}

- (CGSize)adjustedInsets
{
  double v2 = 0.0;
  double v3 = 0.0;
  result.CGFloat height = v3;
  result.CGFloat width = v2;
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

- (BOOL)alwaysStartsNewTarget
{
  return 0;
}

- (BOOL)shrinkTextToFit
{
  return 0;
}

- (BOOL)textIsVertical
{
  return 0;
}

- (BOOL)columnsAreLeftToRight
{
  return 1;
}

- (unsigned)autosizeFlagsForTextLayout:(id)a3
{
  return 3;
}

- (unsigned)verticalAlignmentForTextLayout:(id)a3
{
  return 0;
}

- (CGRect)nonAutosizedFrameForTextLayout:(id)a3
{
  uint64_t v5 = [(THGlossaryEntryLayout *)self p_portionForLayout:"p_portionForLayout:"];
  if (v5)
  {
    uint64_t v6 = v5;
    [(THGlossaryEntryLayout *)self p_viewFrameBasedOnStyle];
    double v8 = v7;
    [(THGlossaryEntryLayoutStyleProvider *)self->mLayoutStyleProvider glossaryEntryLayoutDefaultHeightForPortion:v6];
    -[THGlossaryEntryLayout autosizedFrameForTextLayout:textSize:](self, "autosizedFrameForTextLayout:textSize:", a3, v8, v9);
  }
  else
  {
    double x = CGRectNull.origin.x;
    double y = CGRectNull.origin.y;
    double width = CGRectNull.size.width;
    double height = CGRectNull.size.height;
  }
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)autosizedFrameForTextLayout:(id)a3 textSize:(CGSize)a4
{
  CGFloat height = a4.height;
  uint64_t v6 = -[THGlossaryEntryLayout p_portionForLayout:](self, "p_portionForLayout:", a3, a4.width);
  [(THGlossaryEntryLayout *)self p_columnFrameBasedOnStyle];
  double v8 = v7;
  double v10 = v9;
  [(THGlossaryEntryLayout *)self p_topCoordinateForPortion:v6];
  double v12 = v11;
  double v13 = v8;
  double v14 = v10;
  double v15 = height;
  result.size.CGFloat height = v15;
  result.size.double width = v14;
  result.origin.double y = v12;
  result.origin.double x = v13;
  return result;
}

- (id)dependentsOfTextLayout:(id)a3
{
  return 0;
}

- (Class)repClassForTextLayout:(id)a3
{
  id v3 = [a3 info];

  return (Class)[v3 repClass];
}

- (double)maxAutoGrowHeightForTextLayout:(id)a3
{
  return 4096.0;
}

- (id)textWrapper
{
  double v2 = objc_alloc_init(THGlossaryTextWrapController);

  return v2;
}

- (id)additionalDependenciesForChildLayout:(id)a3
{
  if ([(THGlossaryEntryLayout *)self floatingLayout] != a3) {
    return 0;
  }

  return +[NSArray arrayWithObject:self];
}

- (id)reliedOnLayoutsForLayout:(id)a3
{
  id v5 = +[NSMutableSet set];
  if ([(THGlossaryEntryLayout *)self bodyLayout] == a3)
  {
    if (![(THGlossaryEntryLayout *)self floatingLayout]) {
      goto LABEL_11;
    }
    [v5 addObjectsFromArray:[-[THGlossaryEntryLayout floatingLayout](self, "floatingLayout") childrenForWrappingDependents]];
    uint64_t v6 = [(THGlossaryEntryLayout *)self floatingLayout];
    goto LABEL_10;
  }
  if ([(THGlossaryEntryLayout *)self relatedTermsLayout] != a3)
  {
    if ([(THGlossaryEntryLayout *)self indexLayout] != a3) {
      return v5;
    }
    if ([(THGlossaryEntryLayout *)self relatedTermsLayout]) {
      [v5 addObject:[self relatedTermsLayout]];
    }
  }
  if ([(THGlossaryEntryLayout *)self bodyLayout])
  {
    uint64_t v6 = [(THGlossaryEntryLayout *)self bodyLayout];
LABEL_10:
    [v5 addObject:v6];
  }
LABEL_11:
  if ([(THGlossaryEntryLayout *)self headerLayout]) {
    [v5 addObject:[self headerLayout]];
  }
  return v5;
}

- (CGSize)maximumFrameSizeForChild:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)THGlossaryEntryLayout;
  -[THGlossaryEntryLayout maximumFrameSizeForChild:](&v13, "maximumFrameSizeForChild:");
  double v6 = v5;
  double v8 = v7;
  double v9 = (THGlossaryEntryFloatingLayout *)[a3 parent];
  if (v9 == [(THGlossaryEntryLayout *)self floatingLayout]
    && [(THGlossaryEntryLayoutStyleProvider *)self->mLayoutStyleProvider glossaryEntryLayoutFloatingStyle] == 2)
  {
    [(THGlossaryEntryLayout *)self p_columnFrameBasedOnStyle];
    double v6 = v10;
    double v8 = v10;
  }
  double v11 = v6;
  double v12 = v8;
  result.CGFloat height = v12;
  result.double width = v11;
  return result;
}

- (THGlossaryEntryLayoutStyleProvider)layoutStyleProvider
{
  return self->mLayoutStyleProvider;
}

- (void)setRelatedTermsLabelLayout:(id)a3
{
}

- (void)setIndexLabelLayout:(id)a3
{
}

- (void)setRelatedTermsDividerLayout:(id)a3
{
}

- (void)setIndexDividerLayout:(id)a3
{
}

@end
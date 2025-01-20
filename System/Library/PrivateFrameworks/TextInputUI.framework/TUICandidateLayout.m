@interface TUICandidateLayout
- (BOOL)candidateNumberEnabled;
- (BOOL)fillGridWithLines;
- (BOOL)flipsHorizontallyInOppositeLayoutDirection;
- (BOOL)hideSlottedCellSeparators;
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (BOOL)shouldJustifyRow;
- (BOOL)showExtraLineBeforeFirstRow;
- (BOOL)showsIndex;
- (CGPoint)gridLineOffset;
- (CGSize)collectionViewContentSize;
- (NSIndexPath)oldFirstVisibleIndexPath;
- (TUICandidateLayout)init;
- (UIEdgeInsets)gridLinePadding;
- (UIEdgeInsets)gridPadding;
- (double)customHeaderHeight;
- (double)interRowSpacing;
- (double)minimumInterItemSpacing;
- (double)oldFirstVisibleOffset;
- (double)singleSlottedCellMargin;
- (double)slottedCandidatesIterItemSpacing;
- (id)copyWithZone:(_NSZone *)a3;
- (id)keyForDummyCandidateIndexPath:(id)a3;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4;
- (int64_t)layoutOrientation;
- (int64_t)rowType;
- (int64_t)transitionState;
- (unint64_t)columnsCount;
- (void)clearLayoutAttributes;
- (void)invalidateLayout;
- (void)justify:(id)a3 rowStartX:(double)a4 maxWidth:(double)a5 remainingWidth:(double)a6 endOfSection:(BOOL)a7;
- (void)layoutSlottedCandidates;
- (void)prepareLayout;
- (void)prepareLayoutForMultiRow;
- (void)prepareLayoutForSingleRow;
- (void)rotateAttributesBy90Degrees;
- (void)setCandidateNumberEnabled:(BOOL)a3;
- (void)setColumnsCount:(unint64_t)a3;
- (void)setCustomHeaderHeight:(double)a3;
- (void)setFillGridWithLines:(BOOL)a3;
- (void)setGridLineOffset:(CGPoint)a3;
- (void)setGridLinePadding:(UIEdgeInsets)a3;
- (void)setGridPadding:(UIEdgeInsets)a3;
- (void)setHideSlottedCellSeparators:(BOOL)a3;
- (void)setInterRowSpacing:(double)a3;
- (void)setLayoutOrientation:(int64_t)a3;
- (void)setMinimumInterItemSpacing:(double)a3;
- (void)setOldFirstVisibleIndexPath:(id)a3;
- (void)setOldFirstVisibleOffset:(double)a3;
- (void)setRowType:(int64_t)a3;
- (void)setShouldJustifyRow:(BOOL)a3;
- (void)setShowExtraLineBeforeFirstRow:(BOOL)a3;
- (void)setShowsIndex:(BOOL)a3;
- (void)setSingleSlottedCellMargin:(double)a3;
- (void)setSlottedCandidatesIterItemSpacing:(double)a3;
- (void)setTransitionState:(int64_t)a3;
@end

@implementation TUICandidateLayout

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_oldFirstVisibleIndexPath, 0);
  objc_storeStrong((id *)&self->_customHeaderAttributes, 0);
  objc_storeStrong((id *)&self->_groupHeaderAttributes, 0);
  objc_storeStrong((id *)&self->_slottedCellSeparatorAttributes, 0);
  objc_storeStrong((id *)&self->_lineAttributes, 0);
  objc_storeStrong((id *)&self->_dummyCandidateAttributes, 0);
  objc_storeStrong((id *)&self->_candidateAttributes, 0);
}

- (void)setShowsIndex:(BOOL)a3
{
  self->_showsIndex = a3;
}

- (BOOL)showsIndex
{
  return self->_showsIndex;
}

- (void)setFillGridWithLines:(BOOL)a3
{
  self->_fillGridWithLines = a3;
}

- (BOOL)fillGridWithLines
{
  return self->_fillGridWithLines;
}

- (void)setShowExtraLineBeforeFirstRow:(BOOL)a3
{
  self->_showExtraLineBeforeFirstRow = a3;
}

- (BOOL)showExtraLineBeforeFirstRow
{
  return self->_showExtraLineBeforeFirstRow;
}

- (void)setGridLineOffset:(CGPoint)a3
{
  self->_gridLineOffset = a3;
}

- (CGPoint)gridLineOffset
{
  double x = self->_gridLineOffset.x;
  double y = self->_gridLineOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setHideSlottedCellSeparators:(BOOL)a3
{
  self->_hideSlottedCellSeparators = a3;
}

- (BOOL)hideSlottedCellSeparators
{
  return self->_hideSlottedCellSeparators;
}

- (void)setSlottedCandidatesIterItemSpacing:(double)a3
{
  self->_slottedCandidatesIterItemSpacing = a3;
}

- (double)slottedCandidatesIterItemSpacing
{
  return self->_slottedCandidatesIterItemSpacing;
}

- (void)setInterRowSpacing:(double)a3
{
  self->_interRowSpacing = a3;
}

- (double)interRowSpacing
{
  return self->_interRowSpacing;
}

- (void)setGridLinePadding:(UIEdgeInsets)a3
{
  self->_gridLinePadding = a3;
}

- (UIEdgeInsets)gridLinePadding
{
  double top = self->_gridLinePadding.top;
  double left = self->_gridLinePadding.left;
  double bottom = self->_gridLinePadding.bottom;
  double right = self->_gridLinePadding.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setGridPadding:(UIEdgeInsets)a3
{
  self->_gridPadding = a3;
}

- (UIEdgeInsets)gridPadding
{
  double top = self->_gridPadding.top;
  double left = self->_gridPadding.left;
  double bottom = self->_gridPadding.bottom;
  double right = self->_gridPadding.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setShouldJustifyRow:(BOOL)a3
{
  self->_shouldJustifyRow = a3;
}

- (BOOL)shouldJustifyRow
{
  return self->_shouldJustifyRow;
}

- (void)setMinimumInterItemSpacing:(double)a3
{
  self->_minimumInterItemSpacing = a3;
}

- (double)minimumInterItemSpacing
{
  return self->_minimumInterItemSpacing;
}

- (void)setSingleSlottedCellMargin:(double)a3
{
  self->_singleSlottedCellMargin = a3;
}

- (double)singleSlottedCellMargin
{
  return self->_singleSlottedCellMargin;
}

- (void)setColumnsCount:(unint64_t)a3
{
  self->_columnsCount = a3;
}

- (unint64_t)columnsCount
{
  return self->_columnsCount;
}

- (void)setCandidateNumberEnabled:(BOOL)a3
{
  self->_candidateNumberEnabled = a3;
}

- (BOOL)candidateNumberEnabled
{
  return self->_candidateNumberEnabled;
}

- (void)setCustomHeaderHeight:(double)a3
{
  self->_customHeaderHeight = a3;
}

- (double)customHeaderHeight
{
  return self->_customHeaderHeight;
}

- (void)setOldFirstVisibleOffset:(double)a3
{
  self->_oldFirstVisibleOffset = a3;
}

- (double)oldFirstVisibleOffset
{
  return self->_oldFirstVisibleOffset;
}

- (void)setOldFirstVisibleIndexPath:(id)a3
{
}

- (NSIndexPath)oldFirstVisibleIndexPath
{
  return self->_oldFirstVisibleIndexPath;
}

- (void)setLayoutOrientation:(int64_t)a3
{
  self->_layoutOrientation = a3;
}

- (int64_t)layoutOrientation
{
  return self->_layoutOrientation;
}

- (void)setTransitionState:(int64_t)a3
{
  self->_transitionState = a3;
}

- (int64_t)transitionState
{
  return self->_transitionState;
}

- (void)setRowType:(int64_t)a3
{
  self->_rowType = a3;
}

- (int64_t)rowType
{
  return self->_rowType;
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEqualToString:@"Line"])
  {
    unint64_t v8 = [v7 row];
    uint64_t v9 = 288;
    goto LABEL_5;
  }
  if ([v6 isEqualToString:@"SlottedCellSeparator"])
  {
    unint64_t v8 = [v7 row];
    uint64_t v9 = 296;
LABEL_5:
    if (v8 < [*(id *)((char *)&self->super.super.isa + v9) count])
    {
      groupHeaderAttributes = *(NSMutableArray **)((char *)&self->super.super.isa + v9);
      uint64_t v11 = [v7 row];
LABEL_7:
      v12 = [(NSMutableArray *)groupHeaderAttributes objectAtIndexedSubscript:v11];
LABEL_8:
      v13 = v12;
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  if ([v6 isEqualToString:@"GroupHeader"])
  {
    unint64_t v14 = [v7 section];
    if (v14 < [(NSMutableArray *)self->_groupHeaderAttributes count])
    {
      groupHeaderAttributes = self->_groupHeaderAttributes;
      uint64_t v11 = [v7 section];
      goto LABEL_7;
    }
  }
  else
  {
    if ([v6 isEqualToString:@"CustomHeader"])
    {
      v12 = self->_customHeaderAttributes;
      goto LABEL_8;
    }
    if ([v6 isEqualToString:@"DummyCandidate"])
    {
      v15 = [(TUICandidateLayout *)self keyForDummyCandidateIndexPath:v7];
      v13 = [(NSMutableDictionary *)self->_dummyCandidateAttributes objectForKey:v15];

      goto LABEL_17;
    }
  }
LABEL_16:
  v13 = 0;
LABEL_17:

  return v13;
}

- (id)keyForDummyCandidateIndexPath:(id)a3
{
  v3 = NSString;
  id v4 = a3;
  uint64_t v5 = [v4 section];
  uint64_t v6 = [v4 row];

  return (id)objc_msgSend(v3, "stringWithFormat:", @"%lld,%lld", v5, v6);
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 section];
  if (v5 >= [(NSMutableArray *)self->_candidateAttributes count]
    || (unint64_t v6 = [v4 row],
        -[NSMutableArray objectAtIndexedSubscript:](self->_candidateAttributes, "objectAtIndexedSubscript:", [v4 section]), id v7 = objc_claimAutoreleasedReturnValue(), v8 = objc_msgSend(v7, "count"), v7, v6 >= v8))
  {
    v10 = 0;
  }
  else
  {
    uint64_t v9 = -[NSMutableArray objectAtIndexedSubscript:](self->_candidateAttributes, "objectAtIndexedSubscript:", [v4 section]);
    v10 = objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v4, "row"));
  }
  return v10;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  CGRectGetMaxY(a3);
  unint64_t v8 = objc_opt_new();
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__TUICandidateLayout_layoutAttributesForElementsInRect___block_invoke;
  aBlock[3] = &unk_1E5593310;
  CGFloat v30 = x;
  CGFloat v31 = y;
  CGFloat v32 = width;
  CGFloat v33 = height;
  id v9 = v8;
  id v29 = v9;
  v10 = (void (**)(void *, void))_Block_copy(aBlock);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v11 = self->_candidateAttributes;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v24 objects:v34 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v25;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(v11);
        }
        v10[2](v10, *(void *)(*((void *)&v24 + 1) + 8 * v15++));
      }
      while (v13 != v15);
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v24 objects:v34 count:16];
    }
    while (v13);
  }

  ((void (**)(void *, NSMutableArray *))v10)[2](v10, self->_lineAttributes);
  ((void (**)(void *, NSMutableArray *))v10)[2](v10, self->_slottedCellSeparatorAttributes);
  ((void (**)(void *, NSMutableArray *))v10)[2](v10, self->_groupHeaderAttributes);
  customHeaderAttributes = self->_customHeaderAttributes;
  if (customHeaderAttributes)
  {
    [(UICollectionViewLayoutAttributes *)customHeaderAttributes frame];
    v37.origin.CGFloat x = v17;
    v37.origin.CGFloat y = v18;
    v37.size.CGFloat width = v19;
    v37.size.CGFloat height = v20;
    v36.origin.CGFloat x = x;
    v36.origin.CGFloat y = y;
    v36.size.CGFloat width = width;
    v36.size.CGFloat height = height;
    if (CGRectIntersectsRect(v36, v37)) {
      [v9 addObject:self->_customHeaderAttributes];
    }
  }
  v21 = [(NSMutableDictionary *)self->_dummyCandidateAttributes allValues];
  [v9 addObjectsFromArray:v21];

  id v22 = v9;
  return v22;
}

void __56__TUICandidateLayout_layoutAttributesForElementsInRect___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        unint64_t v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        [v8 frame];
        v19.origin.CGFloat x = v9;
        v19.origin.CGFloat y = v10;
        v19.size.CGFloat width = v11;
        v19.size.CGFloat height = v12;
        if (CGRectIntersectsRect(*(CGRect *)(a1 + 40), v19)) {
          [*(id *)(a1 + 32) addObject:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }
}

- (CGSize)collectionViewContentSize
{
  id v3 = [(NSMutableArray *)self->_candidateAttributes lastObject];
  uint64_t v4 = [v3 lastObject];

  if ([(TUICandidateLayout *)self rowType])
  {
    if ([(TUICandidateLayout *)self layoutOrientation] == 1)
    {
      uint64_t v5 = [(NSMutableArray *)self->_candidateAttributes firstObject];
      uint64_t v6 = [v5 firstObject];
      [v6 frame];
      CGFloat MaxX = CGRectGetMaxX(v21);
      unint64_t v8 = [(TUICandidateLayout *)self collectionView];
      [v8 frame];
      double MaxY = v9;
    }
    else
    {
      if ([(TUICandidateLayout *)self transitionState])
      {
        CGFloat v12 = [(TUICandidateLayout *)self collectionView];
        [v12 bounds];
        double Height = CGRectGetHeight(v23);
      }
      else
      {
        double Height = 0.0;
      }
      CGFloat v17 = [(TUICandidateLayout *)self collectionView];
      [v17 bounds];
      CGFloat MaxX = CGRectGetWidth(v26);
      [v4 frame];
      double MaxY = Height + CGRectGetMaxY(v27);
    }
  }
  else
  {
    if ([(NSMutableArray *)self->_slottedCellSeparatorAttributes count])
    {
      CGFloat v11 = [(TUICandidateLayout *)self collectionView];
      [v11 bounds];
      CGFloat MaxX = CGRectGetWidth(v22);
    }
    else
    {
      [v4 frame];
      CGFloat MaxX = CGRectGetMaxX(v24);
    }
    [v4 frame];
    double MaxY = CGRectGetMaxY(v25);
    long long v14 = [(TUICandidateLayout *)self collectionView];
    [v14 frame];
    double v16 = v15;

    if (MaxY >= v16) {
      double MaxY = v16;
    }
  }

  double v18 = MaxX;
  double v19 = MaxY;
  result.CGFloat height = v19;
  result.CGFloat width = v18;
  return result;
}

- (BOOL)flipsHorizontallyInOppositeLayoutDirection
{
  return 1;
}

- (void)justify:(id)a3 rowStartX:(double)a4 maxWidth:(double)a5 remainingWidth:(double)a6 endOfSection:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  if ([v12 count])
  {
    double v13 = a5 - a4;
    uint64_t v14 = [v12 count];
    [(TUICandidateLayout *)self minimumInterItemSpacing];
    double v16 = v15;
    unint64_t v17 = [v12 count];
    unint64_t v18 = [(TUICandidateLayout *)self columnsCount];
    unint64_t v19 = [v12 count];
    if (v18 <= v19) {
      unint64_t v18 = v19;
    }
    if (v13 > 0.0)
    {
      uint64_t v20 = [v12 count];
      if (a6 > 0.0)
      {
        if (v20)
        {
          double v21 = v13 - (double)(unint64_t)(v14 - 1) * v16;
          double v22 = v21 / (double)v17;
          if (v7 && v21 * 0.5 < a6)
          {
            [(TUICandidateLayout *)self minimumInterItemSpacing];
            double v22 = (v13 - ((double)v18 + -1.0) * v23) / (double)v18;
            double v24 = (double)(uint64_t)fmax((double)v18 - (double)(unint64_t)[v12 count], 0.0);
            [(TUICandidateLayout *)self minimumInterItemSpacing];
            double v26 = floor((a6 - v24 * v25) / v22);
            if (v26 > v24) {
              double v26 = v24;
            }
            double v27 = (double)(uint64_t)v26;
            [(TUICandidateLayout *)self minimumInterItemSpacing];
            a6 = a6 - v22 * v27 - v27 * v28;
          }
          long long v59 = 0u;
          long long v60 = 0u;
          long long v57 = 0u;
          long long v58 = 0u;
          id v29 = v12;
          uint64_t v30 = [v29 countByEnumeratingWithState:&v57 objects:v62 count:16];
          if (!v30) {
            goto LABEL_31;
          }
          uint64_t v31 = v30;
          uint64_t v32 = *(void *)v58;
          double v33 = 0.0;
          do
          {
            for (uint64_t i = 0; i != v31; ++i)
            {
              if (*(void *)v58 != v32) {
                objc_enumerationMutation(v29);
              }
              [*(id *)(*((void *)&v57 + 1) + 8 * i) frame];
              double v35 = v22 - CGRectGetWidth(v64);
              if (v35 < 1.0) {
                double v35 = 1.0;
              }
              double v33 = v33 + v35;
            }
            uint64_t v31 = [v29 countByEnumeratingWithState:&v57 objects:v62 count:16];
          }
          while (v31);

          if (v33 > 0.0)
          {
            CGRect v36 = [(TUICandidateLayout *)self collectionView];
            double v52 = TUIScreenScaleForView(v36);

            long long v55 = 0u;
            long long v56 = 0u;
            long long v53 = 0u;
            long long v54 = 0u;
            id v37 = v29;
            uint64_t v38 = [v37 countByEnumeratingWithState:&v53 objects:v61 count:16];
            if (v38)
            {
              uint64_t v39 = v38;
              uint64_t v40 = *(void *)v54;
              double v41 = a6 / v33;
              do
              {
                uint64_t v42 = 0;
                double v43 = a4;
                do
                {
                  if (*(void *)v54 != v40) {
                    objc_enumerationMutation(v37);
                  }
                  v44 = *(void **)(*((void *)&v53 + 1) + 8 * v42);
                  [v44 frame];
                  double y = v65.origin.y;
                  double width = v65.size.width;
                  double height = v65.size.height;
                  double v48 = v22 - CGRectGetWidth(v65);
                  if (v48 < 1.0) {
                    double v48 = 1.0;
                  }
                  CGFloat v49 = width + v41 * v48;
                  v66.origin.CGFloat x = v43;
                  v66.origin.double y = y;
                  v66.size.double width = v49;
                  v66.size.double height = height;
                  double MaxX = CGRectGetMaxX(v66);
                  [(TUICandidateLayout *)self minimumInterItemSpacing];
                  a4 = MaxX + v51;
                  objc_msgSend(v44, "setFrame:", TUIRectIntegralWithScale(v43, y, v49, height, v52));
                  ++v42;
                  double v43 = a4;
                }
                while (v39 != v42);
                uint64_t v39 = [v37 countByEnumeratingWithState:&v53 objects:v61 count:16];
              }
              while (v39);
            }
LABEL_31:
          }
        }
      }
    }
  }
}

- (void)rotateAttributesBy90Degrees
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  [(NSMutableArray *)self->_lineAttributes removeAllObjects];
  id v3 = [(NSMutableArray *)self->_candidateAttributes lastObject];
  uint64_t v4 = [v3 lastObject];
  [v4 frame];
  double MaxY = CGRectGetMaxY(v44);

  uint64_t v6 = [(TUICandidateLayout *)self collectionView];
  [v6 bounds];
  double v8 = v7;

  if (MaxY >= v8) {
    double v9 = MaxY;
  }
  else {
    double v9 = v8;
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  CGFloat v10 = self->_candidateAttributes;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v36 objects:v42 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v37 != v13) {
          objc_enumerationMutation(v10);
        }
        double v15 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        id v16 = v15;
        uint64_t v17 = [v16 countByEnumeratingWithState:&v32 objects:v41 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v33;
          do
          {
            for (uint64_t j = 0; j != v18; ++j)
            {
              if (*(void *)v33 != v19) {
                objc_enumerationMutation(v16);
              }
              double v21 = *(void **)(*((void *)&v32 + 1) + 8 * j);
              [v21 frame];
              objc_msgSend(v21, "setFrame:", v9 - CGRectGetMaxY(v45), v45.origin.x, v45.size.height, v45.size.width);
            }
            uint64_t v18 = [v16 countByEnumeratingWithState:&v32 objects:v41 count:16];
          }
          while (v18);
        }
      }
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v36 objects:v42 count:16];
    }
    while (v12);
  }

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  double v22 = self->_groupHeaderAttributes;
  uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v28 objects:v40 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v29;
    do
    {
      for (uint64_t k = 0; k != v24; ++k)
      {
        if (*(void *)v29 != v25) {
          objc_enumerationMutation(v22);
        }
        double v27 = *(void **)(*((void *)&v28 + 1) + 8 * k);
        objc_msgSend(v27, "frame", (void)v28);
        objc_msgSend(v27, "setFrame:", v9 - CGRectGetMaxY(v46), v46.origin.x, v46.size.height, v46.size.width);
      }
      uint64_t v24 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v28 objects:v40 count:16];
    }
    while (v24);
  }
}

- (void)prepareLayoutForMultiRow
{
  id v3 = [(TUICandidateLayout *)self collectionView];
  uint64_t v4 = [v3 dataSource];

  int64_t v5 = [(TUICandidateLayout *)self layoutOrientation];
  uint64_t v6 = [(TUICandidateLayout *)self collectionView];
  [v6 bounds];
  if (v5 == 1) {
    double Height = CGRectGetHeight(*(CGRect *)&v7);
  }
  else {
    double Height = CGRectGetWidth(*(CGRect *)&v7);
  }
  double v12 = Height;

  [(TUICandidateLayout *)self gridPadding];
  double v14 = v13;
  [(TUICandidateLayout *)self gridLinePadding];
  double v16 = v15;
  uint64_t v17 = [(TUICandidateLayout *)self collectionView];
  uint64_t v18 = [v4 numberOfSectionsInCollectionView:v17];

  if (v18)
  {
    uint64_t v19 = 0;
    double v20 = 0.0;
    do
    {
      double v21 = [(TUICandidateLayout *)self collectionView];
      [v4 collectionView:v21 layout:self widthForGroupHeaderInSection:v19];
      double v23 = v22;

      if (v20 < v23) {
        double v20 = v23;
      }
      ++v19;
    }
    while (v18 != v19);
    BOOL v24 = 0;
    BOOL v25 = v20 > 0.0;
    if (v18 == 1 && v20 <= 0.0)
    {
      BOOL v24 = [(TUICandidateLayout *)self shouldJustifyRow];
      BOOL v25 = 0;
    }
  }
  else
  {
    BOOL v25 = 0;
    BOOL v24 = 0;
    double v20 = 0.0;
  }
  double v26 = v12 - v14;
  BOOL v96 = v24;
  if (!v24 && v26 > 15.0 && [(TUICandidateLayout *)self showsIndex]) {
    double v26 = v26 + -15.0;
  }
  double v27 = [(TUICandidateLayout *)self collectionView];
  double v28 = TUIScreenScaleForView(v27);

  if (v25) {
    double v29 = v20;
  }
  else {
    double v29 = 0.0;
  }
  [(TUICandidateLayout *)self gridPadding];
  double v31 = v29 + v30;
  uint64_t v123 = 0;
  v124 = (double *)&v123;
  uint64_t v125 = 0x2020000000;
  double v126 = v29 + v30;
  uint64_t v119 = 0;
  v120 = (double *)&v119;
  uint64_t v121 = 0x2020000000;
  double v122 = 0.0;
  [(TUICandidateLayout *)self gridPadding];
  double v33 = v32;
  [(TUICandidateLayout *)self gridLinePadding];
  double v122 = v33 + v34;
  uint64_t v114 = 0;
  v115 = &v114;
  uint64_t v116 = 0x3010000000;
  v117 = &unk_18D51D2C6;
  long long v94 = *MEMORY[0x1E4F1DB30];
  long long v118 = *MEMORY[0x1E4F1DB30];
  uint64_t v110 = 0;
  v111 = &v110;
  uint64_t v112 = 0x2020000000;
  uint64_t v113 = 0;
  uint64_t v106 = 0;
  v107 = &v106;
  uint64_t v108 = 0x2020000000;
  uint64_t v109 = 0;
  long long v35 = [(TUICandidateLayout *)self oldFirstVisibleIndexPath];
  if ([v35 row]) {
    uint64_t v36 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    uint64_t v36 = 0;
  }

  uint64_t v109 = v36;
  uint64_t v102 = 0;
  v103 = (double *)&v102;
  uint64_t v104 = 0x2020000000;
  uint64_t v105 = 0;
  v100[0] = 0;
  v100[1] = v100;
  v100[2] = 0x3032000000;
  v100[3] = __Block_byref_object_copy_;
  v100[4] = __Block_byref_object_dispose_;
  id v101 = 0;
  if (v31 < v26 && v18 >= 1)
  {
    uint64_t v93 = v18;
    aBlock[1] = 3221225472;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[2] = __46__TUICandidateLayout_prepareLayoutForMultiRow__block_invoke;
    aBlock[3] = &unk_1E55932E8;
    BOOL v92 = v25;
    BOOL v98 = v25;
    void aBlock[4] = self;
    aBlock[5] = &v110;
    aBlock[6] = &v106;
    aBlock[7] = &v102;
    aBlock[8] = v100;
    aBlock[9] = &v114;
    BOOL v99 = v96;
    *(double *)&aBlock[12] = v31;
    *(double *)&aBlock[13] = v26;
    aBlock[10] = &v123;
    aBlock[11] = &v119;
    *(double *)&aBlock[14] = v28;
    *(double *)&aBlock[15] = v12 - v16;
    long long v38 = (void (**)(void *, void, uint64_t))_Block_copy(aBlock);
    if ([(TUICandidateLayout *)self showExtraLineBeforeFirstRow]) {
      v38[2](v38, 0, 1);
    }
    uint64_t v39 = 0;
    double v40 = v26 - v31;
    v95 = (void (**)(void, void, void))v38;
    do
    {
      double v41 = [(TUICandidateLayout *)self collectionView];
      uint64_t v42 = v4;
      uint64_t v43 = [v4 collectionView:v41 numberOfItemsInSection:v39];

      *((_OWORD *)v115 + 2) = v94;
      double v44 = v120[3];
      CGRect v45 = [MEMORY[0x1E4F1CA48] array];
      [(NSMutableArray *)self->_candidateAttributes addObject:v45];
      CGRect v46 = [MEMORY[0x1E4F1CA48] array];
      if (v43 >= 1)
      {
        for (uint64_t i = 0; i != v43; ++i)
        {
          double v48 = [MEMORY[0x1E4F28D58] indexPathForRow:i inSection:v39];
          int64_t v49 = [(TUICandidateLayout *)self layoutOrientation];
          v50 = [(TUICandidateLayout *)self collectionView];
          if (v49) {
            double v51 = 0;
          }
          else {
            double v51 = v48;
          }
          [v42 collectionView:v50 layout:self sizeForItemAtIndexPath:v51];
          double v52 = v115;
          v115[4] = v53;
          v52[5] = v54;

          double v55 = v124[3];
          [(TUICandidateLayout *)self minimumInterItemSpacing];
          if (v124[3] > v31)
          {
            if (v55 + v56 + *((double *)v115 + 4) > v26
              || [(TUICandidateLayout *)self columnsCount]
              && (unint64_t v57 = [v46 count], v57 >= -[TUICandidateLayout columnsCount](self, "columnsCount")))
            {
              ((void (**)(void, void *, void))v95)[2](v95, v46, 0);
            }
          }
          if (v107[3] != v111[3] || [(TUICandidateLayout *)self transitionState] != 1)
          {
            double v58 = *((double *)v115 + 4);
            if (v58 >= v40) {
              double v58 = v26 - v31;
            }
            *((double *)v115 + 4) = v58;
          }
          if (!v96 && [(TUICandidateLayout *)self columnsCount])
          {
            double v59 = *((double *)v115 + 4);
            [(TUICandidateLayout *)self minimumInterItemSpacing];
            double v61 = v40 - v60 * (double)[(TUICandidateLayout *)self columnsCount];
            double v62 = v61 / (double)[(TUICandidateLayout *)self columnsCount];
            if (v59 >= v62) {
              double v62 = v59;
            }
            *((double *)v115 + 4) = v62;
          }
          if ([(TUICandidateLayout *)self transitionState])
          {
            uint64_t v63 = [(TUICandidateLayout *)self oldFirstVisibleIndexPath];
            int v64 = [v48 isEqual:v63];

            if (v64)
            {
              v107[3] = v111[3];
              if ([(TUICandidateLayout *)self transitionState] != 1
                || [v48 item]
                || [v48 section]
                || ([(TUICandidateLayout *)self oldFirstVisibleOffset], v65 < 0.0))
              {
                double v66 = v124[3];
                [(TUICandidateLayout *)self oldFirstVisibleOffset];
                double v68 = v66 - v67;
              }
              else
              {
                double v68 = fmax(*((double *)v115 + 4) - v40, 0.0);
              }
              v103[3] = v68;
            }
          }
          v69 = +[UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:v48];
          if ([v46 count])
          {
            [(TUICandidateLayout *)self minimumInterItemSpacing];
            double v71 = v70 + v124[3];
            v124[3] = v71;
          }
          else
          {
            double v71 = v124[3];
          }
          objc_msgSend(v69, "setFrame:", v71, v120[3], *((double *)v115 + 4), *((double *)v115 + 5));
          [v69 setRow:v111[3]];
          [v45 addObject:v69];
          [v46 addObject:v69];
          v124[3] = *((double *)v115 + 4) + v124[3];
        }
      }
      ((void (**)(void, void *, uint64_t))v95)[2](v95, v46, 1);
      if (v92)
      {
        v72 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:v39];
        v73 = +[UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:@"GroupHeader" withIndexPath:v72];

        [(TUICandidateLayout *)self gridPadding];
        objc_msgSend(v73, "setFrame:", v74, v44, v20, v120[3] - v44);
        [(NSMutableArray *)self->_groupHeaderAttributes addObject:v73];
      }
      ++v39;
      uint64_t v4 = v42;
    }
    while (v39 != v93);
    if (*((double *)v115 + 5) < 1.0)
    {
      v75 = [(TUICandidateLayout *)self collectionView];
      [v42 collectionView:v75 layout:self sizeForItemAtIndexPath:0];
      v76 = v115;
      v115[4] = v77;
      v76[5] = v78;
    }
    if ([(TUICandidateLayout *)self fillGridWithLines])
    {
      double v79 = *((double *)v115 + 5);
      if (v79 >= 1.0)
      {
        double v87 = v120[3];
        for (double j = v87 + v79; ; double j = v120[3] + *((double *)v115 + 5))
        {
          v89 = [(TUICandidateLayout *)self collectionView];
          [v89 bounds];
          double v91 = v87 + v90;

          if (j >= v91) {
            break;
          }
          v95[2](v95, 0, 1);
        }
      }
    }
    [(TUICandidateLayout *)self customHeaderHeight];
    if (v80 > 0.0)
    {
      v81 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:0];
      v82 = +[UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:@"CustomHeader" withIndexPath:v81];
      customHeaderAttributes = self->_customHeaderAttributes;
      self->_customHeaderAttributes = v82;

      [(TUICandidateLayout *)self customHeaderHeight];
      double v85 = -v84;
      [(TUICandidateLayout *)self customHeaderHeight];
      -[UICollectionViewLayoutAttributes setFrame:](self->_customHeaderAttributes, "setFrame:", 0.0, v85, v26, v86);
    }
    if ([(TUICandidateLayout *)self layoutOrientation] == 1
      && [(TUICandidateLayout *)self columnsCount] == 1
      && ![(TUICandidateLayout *)self fillGridWithLines])
    {
      [(TUICandidateLayout *)self rotateAttributesBy90Degrees];
    }
  }
  _Block_object_dispose(v100, 8);

  _Block_object_dispose(&v102, 8);
  _Block_object_dispose(&v106, 8);
  _Block_object_dispose(&v110, 8);
  _Block_object_dispose(&v114, 8);
  _Block_object_dispose(&v119, 8);
  _Block_object_dispose(&v123, 8);
}

void __46__TUICandidateLayout_prepareLayoutForMultiRow__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) == *(void *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                                + 24)
                                                                    + 1
    && !*(unsigned char *)(a1 + 128))
  {
    BOOL v6 = [*(id *)(a1 + 32) transitionState] == 1
      || [*(id *)(a1 + 32) transitionState] == 2;
  }
  else
  {
    BOOL v6 = 0;
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) == *(void *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                                + 24))
  {
    if ([*(id *)(a1 + 32) transitionState] == 1)
    {
      long long v71 = 0u;
      long long v72 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      id v7 = v5;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v69 objects:v76 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v70;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v70 != v10) {
              objc_enumerationMutation(v7);
            }
            double v12 = *(void **)(*((void *)&v69 + 1) + 8 * i);
            [v12 frame];
            [v12 setFrame:v13 - *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v69 objects:v76 count:16];
        }
        while (v9);
      }
    }
    uint64_t v14 = [v5 copy];
    uint64_t v15 = *(void *)(*(void *)(a1 + 64) + 8);
    id v16 = *(id *)(v15 + 40);
    *(void *)(v15 + 40) = v14;
LABEL_24:

    goto LABEL_25;
  }
  if (v6)
  {
    uint64_t v17 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) lastObject];
    [v17 frame];
    double MaxX = CGRectGetMaxX(v78);

    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    id v16 = v5;
    uint64_t v19 = [v16 countByEnumeratingWithState:&v65 objects:v75 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      unsigned int v55 = a3;
      id v56 = v5;
      uint64_t v21 = *(void *)v66;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v66 != v21) {
            objc_enumerationMutation(v16);
          }
          double v23 = *(void **)(*((void *)&v65 + 1) + 8 * j);
          BOOL v24 = [v23 indexPath];
          BOOL v25 = +[UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:@"DummyCandidate" withIndexPath:v24];

          [v23 frame];
          objc_msgSend(v25, "setFrame:", v27 + MaxX - *(double *)(*(void *)(a1 + 32) + 440), v26 - *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 40));
          double v28 = *(void **)(a1 + 32);
          double v29 = [v25 indexPath];
          double v30 = [v28 keyForDummyCandidateIndexPath:v29];

          [*(id *)(*(void *)(a1 + 32) + 280) setObject:v25 forKey:v30];
        }
        uint64_t v20 = [v16 countByEnumeratingWithState:&v65 objects:v75 count:16];
      }
      while (v20);
      id v5 = v56;
      a3 = v55;
    }
    goto LABEL_24;
  }
LABEL_25:
  if (*(unsigned char *)(a1 + 129)
    && ([*(id *)(a1 + 32) transitionState] != 1
     || *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) != *(void *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                                 + 24)))
  {
    [*(id *)(a1 + 32) justify:v5 rowStartX:a3 maxWidth:*(double *)(a1 + 96) remainingWidth:*(double *)(a1 + 104) endOfSection:*(double *)(a1 + 104) - *(double *)(*(void *)(*(void *)(a1 + 80) + 8) + 24)];
  }
  if ([*(id *)(a1 + 32) columnsCount] == 1)
  {
    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    id v31 = v5;
    uint64_t v32 = [v31 countByEnumeratingWithState:&v61 objects:v74 count:16];
    if (v32)
    {
      uint64_t v33 = v32;
      uint64_t v34 = *(void *)v62;
      do
      {
        for (uint64_t k = 0; k != v33; ++k)
        {
          if (*(void *)v62 != v34) {
            objc_enumerationMutation(v31);
          }
          uint64_t v36 = *(void **)(*((void *)&v61 + 1) + 8 * k);
          [v36 frame];
          objc_msgSend(v36, "setFrame:");
          if ([*(id *)(a1 + 32) candidateNumberEnabled]) {
            [v36 setCandidateNumber:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
          }
        }
        uint64_t v33 = [v31 countByEnumeratingWithState:&v61 objects:v74 count:16];
      }
      while (v33);
    }
  }
  else
  {
    if (![*(id *)(a1 + 32) candidateNumberEnabled]) {
      goto LABEL_49;
    }
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id v37 = v5;
    uint64_t v38 = [v37 countByEnumeratingWithState:&v57 objects:v73 count:16];
    if (v38)
    {
      uint64_t v39 = v38;
      uint64_t v40 = *(void *)v58;
      uint64_t v41 = 1;
      do
      {
        for (uint64_t m = 0; m != v39; ++m)
        {
          if (*(void *)v58 != v40) {
            objc_enumerationMutation(v37);
          }
          [*(id *)(*((void *)&v57 + 1) + 8 * m) setCandidateNumber:v41 + m];
        }
        v41 += m;
        uint64_t v39 = [v37 countByEnumeratingWithState:&v57 objects:v73 count:16];
      }
      while (v39);
    }
  }

LABEL_49:
  [v5 removeAllObjects];
  *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = *(void *)(a1 + 96);
  double v43 = *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  [*(id *)(a1 + 32) gridLinePadding];
  double v45 = v43 + v44;
  [*(id *)(a1 + 32) interRowSpacing];
  *(double *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = v45
                                                              + v46
                                                              + *(double *)(*(void *)(*(void *)(a1 + 88) + 8)
                                                                          + 24);
  v47 = [MEMORY[0x1E4F28D58] indexPathForRow:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) inSection:0];
  double v48 = +[UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:@"Line" withIndexPath:v47];

  if (a3)
  {
    [*(id *)(a1 + 32) gridPadding];
    double v50 = v49;
  }
  else
  {
    double v50 = *(double *)(a1 + 96);
  }
  [*(id *)(a1 + 32) gridLineOffset];
  double v52 = v50 + v51;
  double v53 = *(double *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) - 1.0 / *(double *)(a1 + 112);
  [*(id *)(a1 + 32) gridLineOffset];
  objc_msgSend(v48, "setFrame:", v52, v53 + v54, *(double *)(a1 + 120) - v50, 1.0 / *(double *)(a1 + 112));
  [v48 setZIndex:10];
  if (*(double *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) == 0.0
    && ([*(id *)(a1 + 32) showExtraLineBeforeFirstRow] & 1) == 0)
  {
    [v48 setHidden:1];
  }
  [*(id *)(*(void *)(a1 + 32) + 288) addObject:v48];
  ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

- (void)layoutSlottedCandidates
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v3 = [(TUICandidateLayout *)self collectionView];
  uint64_t v4 = [v3 dataSource];

  id v5 = [(TUICandidateLayout *)self collectionView];
  uint64_t v6 = [v4 numberOfSectionsInCollectionView:v5];

  if (v6 == 1)
  {
    uint64_t v7 = [v4 slottedCandidatesCount];
    uint64_t v8 = [v4 extraCandidatesCount];
    uint64_t v9 = [(TUICandidateLayout *)self collectionView];
    [v4 collectionView:v9 numberOfItemsInSection:0];

    if (v7) {
      unint64_t v10 = v7;
    }
    else {
      unint64_t v10 = 1;
    }
    if (v8) {
      BOOL v11 = v7 != 0;
    }
    else {
      BOOL v11 = 0;
    }
    double v12 = [(TUICandidateLayout *)self collectionView];
    [v12 bounds];
    double Width = CGRectGetWidth(v50);

    uint64_t v14 = [(TUICandidateLayout *)self collectionView];
    uint64_t v15 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:0];
    [v4 collectionView:v14 layout:self sizeForItemAtIndexPath:v15];
    uint64_t v17 = v16;

    uint64_t v18 = [(TUICandidateLayout *)self collectionView];
    TUIScreenScaleForView(v18);

    if (v11 || v10 != 1)
    {
      double v20 = 0.0;
      if (v11) {
        double v22 = 50.0;
      }
      else {
        double v22 = 0.0;
      }
      if (v10 == 1 && v11)
      {
        [(TUICandidateLayout *)self singleSlottedCellMargin];
        double v22 = 50.0;
        if (v23 > 0.0) {
          double v20 = 50.0;
        }
        else {
          double v20 = 0.0;
        }
      }
    }
    else
    {
      [(TUICandidateLayout *)self singleSlottedCellMargin];
      double v20 = v19;
      [(TUICandidateLayout *)self singleSlottedCellMargin];
      double v22 = v21;
    }
    [(TUICandidateLayout *)self slottedCandidatesIterItemSpacing];
    if ((Width - v20 - v22 - v24 * (double)(v10 + v11 - 1)) / (double)v10 > 0.0)
    {
      BOOL v25 = [MEMORY[0x1E4F1CA48] array];
      [(NSMutableArray *)self->_candidateAttributes addObject:v25];
      for (uint64_t i = 0; i != v10; ++i)
      {
        double v27 = [MEMORY[0x1E4F28D58] indexPathForRow:i inSection:0];
        double v28 = +[UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:v27];

        [(TUICandidateLayout *)self slottedCandidatesIterItemSpacing];
        UIRectIntegralWithScale();
        objc_msgSend(v28, "setFrame:");
        [v25 addObject:v28];
      }
      if (v11)
      {
        double v29 = [MEMORY[0x1E4F28D58] indexPathForRow:v10 inSection:0];
        double v30 = +[UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:v29];

        UIRectIntegralWithScale();
        objc_msgSend(v30, "setFrame:");
        [v25 addObject:v30];
      }
      if ([(NSMutableArray *)self->_candidateAttributes count]
        && ![(TUICandidateLayout *)self hideSlottedCellSeparators])
      {
        v47[0] = 0;
        v47[1] = v47;
        v47[2] = 0x2020000000;
        v47[3] = 0;
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __45__TUICandidateLayout_layoutSlottedCandidates__block_invoke;
        aBlock[3] = &unk_1E55932C0;
        *(double *)&aBlock[6] = Width;
        aBlock[7] = 0x3FF0000000000000;
        aBlock[8] = v17;
        void aBlock[4] = self;
        aBlock[5] = v47;
        id v31 = (void (**)(void, double))_Block_copy(aBlock);
        if ([v25 count])
        {
          uint64_t v32 = [v25 firstObject];
          [v32 frame];
          CGFloat MinX = CGRectGetMinX(v51);
          v31[2](v31, MinX);
        }
        long long v44 = 0u;
        long long v45 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        id v34 = v25;
        uint64_t v35 = [v34 countByEnumeratingWithState:&v42 objects:v48 count:16];
        if (v35)
        {
          uint64_t v36 = v35;
          id v37 = 0;
          uint64_t v38 = *(void *)v43;
          do
          {
            uint64_t v39 = 0;
            uint64_t v40 = v37;
            do
            {
              if (*(void *)v43 != v38) {
                objc_enumerationMutation(v34);
              }
              id v37 = *(id *)(*((void *)&v42 + 1) + 8 * v39);

              [v37 frame];
              CGFloat MaxX = CGRectGetMaxX(v52);
              v31[2](v31, MaxX);
              ++v39;
              uint64_t v40 = v37;
            }
            while (v36 != v39);
            uint64_t v36 = [v34 countByEnumeratingWithState:&v42 objects:v48 count:16];
          }
          while (v36);
        }
        _Block_object_dispose(v47, 8);
      }
    }
  }
}

void __45__TUICandidateLayout_layoutSlottedCandidates__block_invoke(uint64_t a1, double a2)
{
  if (a2 > 0.0 && *(double *)(a1 + 48) > a2)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F28D58];
    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    id v5 = objc_msgSend(v4, "indexPathForRow:inSection:");
    id v6 = +[UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:@"SlottedCellSeparator" withIndexPath:v5];

    objc_msgSend(v6, "setFrame:", a2 - *(double *)(a1 + 56), 0.0, *(double *)(a1 + 56), *(double *)(a1 + 64));
    [v6 setZIndex:10];
    [*(id *)(*(void *)(a1 + 32) + 296) addObject:v6];
  }
}

- (void)prepareLayoutForSingleRow
{
  id v3 = [(TUICandidateLayout *)self collectionView];
  id v23 = [v3 dataSource];

  uint64_t v4 = [(TUICandidateLayout *)self collectionView];
  uint64_t v5 = [v23 numberOfSectionsInCollectionView:v4];

  if (v5)
  {
    [(TUICandidateLayout *)self gridPadding];
    double v7 = v6;
    uint64_t v8 = [v23 slottedCandidatesCount];
    if (v8 + [v23 extraCandidatesCount])
    {
      [(TUICandidateLayout *)self layoutSlottedCandidates];
    }
    else
    {
      uint64_t v9 = 0;
      unint64_t v24 = 1;
      do
      {
        unint64_t v10 = [MEMORY[0x1E4F1CA48] array];
        [(NSMutableArray *)self->_candidateAttributes addObject:v10];
        BOOL v11 = [(TUICandidateLayout *)self collectionView];
        uint64_t v12 = [v23 collectionView:v11 numberOfItemsInSection:v9];

        if (v12 >= 1)
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            uint64_t v14 = [MEMORY[0x1E4F28D58] indexPathForRow:i inSection:v9];
            uint64_t v15 = [(TUICandidateLayout *)self collectionView];
            [v23 collectionView:v15 layout:self sizeForItemAtIndexPath:v14];
            double v17 = v16;
            double v19 = v18;

            double v20 = +[UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:v14];
            objc_msgSend(v20, "setFrame:", v7, 0.0, v17, v19);
            [(TUICandidateLayout *)self minimumInterItemSpacing];
            double v22 = v21;
            [v10 addObject:v20];
            if ([(TUICandidateLayout *)self candidateNumberEnabled] && v24 <= 9)
            {
              objc_msgSend(v20, "setCandidateNumber:");
              ++v24;
            }
            double v7 = v7 + v17 + v22;
          }
        }

        ++v9;
      }
      while (v9 != v5);
    }
  }
}

- (void)prepareLayout
{
  v3.receiver = self;
  v3.super_class = (Class)TUICandidateLayout;
  [(TUICandidateLayout *)&v3 prepareLayout];
  if (self->_dirty)
  {
    [(TUICandidateLayout *)self clearLayoutAttributes];
    if ([(TUICandidateLayout *)self rowType]) {
      [(TUICandidateLayout *)self prepareLayoutForMultiRow];
    }
    else {
      [(TUICandidateLayout *)self prepareLayoutForSingleRow];
    }
    self->_dirtdouble y = 0;
  }
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v7 = [(TUICandidateLayout *)self collectionView];
  [v7 bounds];
  double v8 = CGRectGetWidth(v11);
  v12.origin.CGFloat x = x;
  v12.origin.CGFloat y = y;
  v12.size.CGFloat width = width;
  v12.size.CGFloat height = height;
  BOOL v9 = v8 != CGRectGetWidth(v12);

  return v9;
}

- (void)invalidateLayout
{
  v3.receiver = self;
  v3.super_class = (Class)TUICandidateLayout;
  [(TUICandidateLayout *)&v3 invalidateLayout];
  [(TUICandidateLayout *)self clearLayoutAttributes];
  self->_dirtCGFloat y = 1;
}

- (void)clearLayoutAttributes
{
  [(NSMutableArray *)self->_candidateAttributes removeAllObjects];
  [(NSMutableDictionary *)self->_dummyCandidateAttributes removeAllObjects];
  [(NSMutableArray *)self->_lineAttributes removeAllObjects];
  [(NSMutableArray *)self->_slottedCellSeparatorAttributes removeAllObjects];
  [(NSMutableArray *)self->_groupHeaderAttributes removeAllObjects];
  customHeaderAttributes = self->_customHeaderAttributes;
  self->_customHeaderAttributes = 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_alloc_init((Class)objc_opt_class());
  v4[41] = self->_rowType;
  v4[42] = self->_transitionState;
  uint64_t v5 = [(NSIndexPath *)self->_oldFirstVisibleIndexPath copy];
  double v6 = (void *)v4[44];
  v4[44] = v5;

  v4[45] = *(void *)&self->_oldFirstVisibleOffset;
  v4[46] = *(void *)&self->_customHeaderHeight;
  *((unsigned char *)v4 + 321) = self->_candidateNumberEnabled;
  v4[47] = self->_columnsCount;
  v4[48] = *(void *)&self->_singleSlottedCellMargin;
  long long v7 = *(_OWORD *)&self->_gridPadding.bottom;
  *((_OWORD *)v4 + 27) = *(_OWORD *)&self->_gridPadding.top;
  *((_OWORD *)v4 + 28) = v7;
  long long v8 = *(_OWORD *)&self->_gridLinePadding.bottom;
  *((_OWORD *)v4 + 29) = *(_OWORD *)&self->_gridLinePadding.top;
  *((_OWORD *)v4 + 30) = v8;
  v4[50] = *(void *)&self->_interRowSpacing;
  v4[51] = *(void *)&self->_slottedCandidatesIterItemSpacing;
  *((unsigned char *)v4 + 323) = self->_hideSlottedCellSeparators;
  *((_OWORD *)v4 + 26) = self->_gridLineOffset;
  *((unsigned char *)v4 + 325) = self->_fillGridWithLines;
  v4[49] = *(void *)&self->_minimumInterItemSpacing;
  *((unsigned char *)v4 + 322) = self->_shouldJustifyRow;
  return v4;
}

- (TUICandidateLayout)init
{
  v14.receiver = self;
  v14.super_class = (Class)TUICandidateLayout;
  v2 = [(TUICandidateLayout *)&v14 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    candidateAttributes = v2->_candidateAttributes;
    v2->_candidateAttributes = (NSMutableArray *)v3;

    uint64_t v5 = objc_opt_new();
    dummyCandidateAttributes = v2->_dummyCandidateAttributes;
    v2->_dummyCandidateAttributes = (NSMutableDictionary *)v5;

    uint64_t v7 = objc_opt_new();
    lineAttributes = v2->_lineAttributes;
    v2->_lineAttributes = (NSMutableArray *)v7;

    uint64_t v9 = objc_opt_new();
    slottedCellSeparatorAttributes = v2->_slottedCellSeparatorAttributes;
    v2->_slottedCellSeparatorAttributes = (NSMutableArray *)v9;

    uint64_t v11 = objc_opt_new();
    groupHeaderAttributes = v2->_groupHeaderAttributes;
    v2->_groupHeaderAttributes = (NSMutableArray *)v11;

    v2->_dirtCGFloat y = 1;
  }
  return v2;
}

@end
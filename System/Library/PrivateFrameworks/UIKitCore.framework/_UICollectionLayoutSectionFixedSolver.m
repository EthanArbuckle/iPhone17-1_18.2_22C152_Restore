@interface _UICollectionLayoutSectionFixedSolver
- (BOOL)auxillaryHostWantsOverlapAdjustmentForMatchingAlignmentsOnly;
- (BOOL)layoutRTL;
- (BOOL)shouldAdjustContentSizeForPartialLastGroupSolution;
- (CGPoint)orthogonalOffset;
- (CGRect)auxillaryHostPinningRect;
- (CGRect)contentFrameIncludingAuxiliaries;
- (CGRect)primaryContentFrame;
- (CGSize)auxillaryHostContentSize;
- (CGVector)orthogonalScrollingPrefetchingUnitVector;
- (NSCollectionLayoutSection)layoutSection;
- (NSIndexSet)pinnedSupplementaryIndexes;
- (NSString)errorDescription;
- (UITraitCollection)traitCollection;
- (_NSRange)preferredSizeGroupingRangeForItemAtIndex:(int64_t)a3;
- (_UICollectionLayoutContainer)container;
- (_UICollectionLayoutContainer)supplementaryContainer;
- (double)_dimensionForRootGroupAlongAxis:(unint64_t)a3;
- (double)_sectionContainer;
- (double)auxillaryHostPaddingBeforeBoundarySupplementaries;
- (id)_queryFramesIntersectingRect:(CGFloat)a3 frameOffset:(CGFloat)a4;
- (id)auxillaryHostAuxillaryItems;
- (id)auxillaryHostContainer;
- (id)auxillaryHostPreferredSizes;
- (id)auxillaryHostSupplementaryEnroller;
- (id)frameForIndex:(int64_t)a3;
- (id)initWithLayoutSection:(id *)a1;
- (id)queryFramesIntersectingRect:(CGRect)a3;
- (id)resolveWithParameters:(id)a3 preferredSizes:(id)a4;
- (id)sectionSupplementaryFrameForIndex:(int64_t)a3;
- (id)sectionSupplementaryFrameWithKind:(id)a3 index:(int64_t)a4;
- (id)supplementaryFrameWithKind:(id)a3 index:(int64_t)a4;
- (id)unpinnedSectionSupplementaryFrameForIndex:(int64_t)a3;
- (id)unpinnedSectionSupplementaryFrameWithKind:(id)a3 forIndex:(int64_t)a4;
- (id)visualDescription;
- (int64_t)auxillaryHostAuxillaryKind;
- (int64_t)frameCount;
- (int64_t)sectionSupplementaryKindIndexForEnrollmentIdentifier:(id)a3;
- (unint64_t)containerLayoutAxis;
- (unint64_t)containerSizeDependentAxes;
- (unint64_t)layoutAxis;
- (void)setContainer:(id)a3;
- (void)setContainerLayoutAxis:(unint64_t)a3;
- (void)setFrameCount:(int64_t)a3;
- (void)setLayoutAxis:(unint64_t)a3;
- (void)setLayoutRTL:(BOOL)a3;
- (void)setLayoutSection:(id)a3;
- (void)setOrthogonalOffset:(CGPoint)a3;
- (void)setOrthogonalScrollingPrefetchingUnitVector:(CGVector)a3;
- (void)setShouldAdjustContentSizeForPartialLastGroupSolution:(BOOL)a3;
- (void)setSupplementaryContainer:(id)a3;
- (void)setTraitCollection:(id)a3;
- (void)solveForContainer:(id)a3 supplementaryContainer:(id)a4 traitCollection:(id)a5 layoutAxis:(unint64_t)a6 frameCount:(int64_t)a7 preferredSizes:(id)a8 layoutRTL:(BOOL)a9;
- (void)solveForContainer:(id)a3 traitCollection:(id)a4 layoutAxis:(unint64_t)a5 frameCount:(int64_t)a6;
- (void)solveForContainer:(id)a3 traitCollection:(id)a4 layoutAxis:(unint64_t)a5 frameCount:(int64_t)a6 preferredSizes:(id)a7;
- (void)updatePinnedSupplementaryItemsWithVisibleBounds:(CGRect)a3;
- (void)updatePinnedSupplementaryItemsWithVisibleBounds:(CGRect)a3 overrideContentRectForPinning:(CGRect)a4;
@end

@implementation _UICollectionLayoutSectionFixedSolver

- (id)frameForIndex:(int64_t)a3
{
  v5 = 0;
  if ([(_UICollectionLayoutSectionFixedSolver *)self frameCount] > a3 && self)
  {
    solution = self->_solution;
    if (solution && (solveResult = solution->_solveResult) != 0 && solveResult->_itemFrameCount >= 1)
    {
      v8 = [(_UICollectionLayoutSectionFixedSolver *)self layoutSection];
      uint64_t v9 = [(_UICollectionLayoutSectionFixedSolver *)self layoutAxis];
      [v8 interGroupSpacing];
      double v11 = v10;
      sectionGeometryTranslator = self->_sectionGeometryTranslator;
      if (sectionGeometryTranslator)
      {
        double x = sectionGeometryTranslator->_primaryContentFrame.origin.x;
        double y = sectionGeometryTranslator->_primaryContentFrame.origin.y;
      }
      else
      {
        double y = 0.0;
        double x = 0.0;
      }
      v5 = [(_UICollectionLayoutItemSolver *)self->_solution frameForAbsoluteIndex:v9 additionalFrameOffset:x interSolutionSpacing:y repeatAxis:v11];
    }
    else
    {
      v5 = 0;
    }
  }
  return v5;
}

- (int64_t)auxillaryHostAuxillaryKind
{
  return 2;
}

- (CGRect)contentFrameIncludingAuxiliaries
{
  if (self && (v2 = self->_sectionGeometryTranslator) != 0)
  {
    CGFloat x = v2->_contentFrameIncludingAuxiliaries.origin.x;
    CGFloat y = v2->_contentFrameIncludingAuxiliaries.origin.y;
    CGFloat width = v2->_contentFrameIncludingAuxiliaries.size.width;
    CGFloat height = v2->_contentFrameIncludingAuxiliaries.size.height;
  }
  else
  {
    CGFloat x = *MEMORY[0x1E4F1DB28];
    CGFloat y = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    CGFloat width = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    CGFloat height = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  double v7 = x;
  double v8 = y;
  double v9 = width;
  double v10 = height;
  result.size.CGFloat height = v10;
  result.size.CGFloat width = v9;
  result.origin.CGFloat y = v8;
  result.origin.CGFloat x = v7;
  return result;
}

- (id)auxillaryHostAuxillaryItems
{
  v2 = [(_UICollectionLayoutSectionFixedSolver *)self layoutSection];
  v3 = [v2 boundarySupplementaryItems];

  return v3;
}

- (id)auxillaryHostSupplementaryEnroller
{
  if (self) {
    self = (_UICollectionLayoutSectionFixedSolver *)self->_sectionSupplementaryEnroller;
  }
  return self;
}

- (id)auxillaryHostPreferredSizes
{
  return 0;
}

- (double)auxillaryHostPaddingBeforeBoundarySupplementaries
{
  v2 = [(_UICollectionLayoutSectionFixedSolver *)self layoutSection];
  double v3 = 0.0;
  if (objc_opt_respondsToSelector())
  {
    [v2 _paddingToBoundarySupplementaries];
    double v3 = v4;
  }

  return v3;
}

- (CGSize)auxillaryHostContentSize
{
  uint64_t v3 = [(_UICollectionLayoutSectionFixedSolver *)self layoutAxis];
  if (self) {
    sectionGeometryTranslator = self->_sectionGeometryTranslator;
  }
  else {
    sectionGeometryTranslator = 0;
  }
  double v5 = -[_UICollectionLayoutSectionGeometryTranslator auxillaryHostContentSize]((uint64_t)sectionGeometryTranslator);
  double v7 = v6;
  double v8 = [(_UICollectionLayoutSectionFixedSolver *)self layoutSection];
  int v9 = [v8 scrollsOrthogonally];
  uint64_t v10 = v3 == 2;
  if (v3 == 1) {
    uint64_t v10 = 2;
  }
  if (!v9) {
    uint64_t v3 = v10;
  }
  double v11 = [(_UICollectionLayoutSectionFixedSolver *)self supplementaryContainer];
  [v11 contentSize];
  double v14 = _UISizeValueForAxis(v3, v12, v13);

  double v15 = _UISetSizeValueForAxis(v3, v5, v7, v14);
  double v17 = v16;

  double v18 = v15;
  double v19 = v17;
  result.CGFloat height = v19;
  result.CGFloat width = v18;
  return result;
}

- (id)initWithLayoutSection:(id *)a1
{
  v2 = a1;
  if (a1)
  {
    if (([a2 _isEmptySection] & 1) == 0)
    {
      double v4 = [a2 group];
      int v5 = [v4 containsEstimatedSizeItem];

      if (v5)
      {
        double v11 = [MEMORY[0x1E4F28B00] currentHandler];
        [v11 handleFailureInMethod:sel_initWithLayoutSection_, v2, @"_UICollectionLayoutSectionFixedSolver.m", 55, @"Invalid parameter not satisfying: %@", @"!layoutSection.group.containsEstimatedSizeItem" object file lineNumber description];
      }
    }
    v12.receiver = v2;
    v12.super_class = (Class)_UICollectionLayoutSectionFixedSolver;
    double v6 = (id *)objc_msgSendSuper2(&v12, sel_init);
    v2 = v6;
    if (v6)
    {
      objc_storeStrong(v6 + 8, a2);
      v2[12] = 0;
      double v7 = [a2 group];
      double v8 = [v7 size];
      *((unsigned char *)v2 + 8) = [v8 isContainerSize] ^ 1;

      long long v9 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
      *(_OWORD *)(v2 + 19) = *MEMORY[0x1E4F1DB20];
      *(_OWORD *)(v2 + 21) = v9;
      [v2[8] _checkForDuplicateSupplementaryItemKindsAndThrowIfFound];
    }
  }
  return v2;
}

- (NSString)errorDescription
{
  return self->_errorDescription;
}

- (unint64_t)containerSizeDependentAxes
{
  unint64_t solution = (unint64_t)self->_solution;
  if (solution) {
    unint64_t solution = *(void *)(solution + 40);
  }
  unint64_t sectionAuxillarySolution = (unint64_t)self->_sectionAuxillarySolution;
  if (sectionAuxillarySolution) {
    unint64_t sectionAuxillarySolution = *(void *)(sectionAuxillarySolution + 56);
  }
  return sectionAuxillarySolution | solution;
}

- (id)supplementaryFrameWithKind:(id)a3 index:(int64_t)a4
{
  if ([a3 length])
  {
    if ((a4 & 0x8000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_22:
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"_UICollectionLayoutSectionFixedSolver.m", 183, @"Invalid parameter not satisfying: %@", @"index >= 0" object file lineNumber description];

    if (self) {
      goto LABEL_4;
    }
    goto LABEL_23;
  }
  v24 = [MEMORY[0x1E4F28B00] currentHandler];
  [v24 handleFailureInMethod:a2, self, @"_UICollectionLayoutSectionFixedSolver.m", 182, @"Invalid parameter not satisfying: %@", @"kind.length" object file lineNumber description];

  if (a4 < 0) {
    goto LABEL_22;
  }
LABEL_3:
  if (self)
  {
LABEL_4:
    double v8 = self->_sectionGeometryTranslator;
    unint64_t sectionAuxillarySolution = self->_sectionAuxillarySolution;
    goto LABEL_5;
  }
LABEL_23:
  double v8 = 0;
  unint64_t sectionAuxillarySolution = 0;
LABEL_5:
  uint64_t v10 = [(_UICollectionLayoutAuxillaryItemSolver *)(id *)&sectionAuxillarySolution->super.isa supplementaryFrameWithKind:a4 index:*MEMORY[0x1E4F1DAD8] additionalFrameOffset:*(double *)(MEMORY[0x1E4F1DAD8] + 8)];
  if (v10) {
    goto LABEL_18;
  }
  if (self) {
    unint64_t solution = self->_solution;
  }
  else {
    unint64_t solution = 0;
  }
  objc_super v12 = -[_UICollectionLayoutItemSolver supplementaryOffsets](solution);
  double v13 = [v12 elementKinds];
  int v14 = [v13 containsObject:a3];

  if (!v14)
  {
    uint64_t v10 = 0;
    goto LABEL_18;
  }
  double v15 = [(_UICollectionLayoutSectionFixedSolver *)self layoutSection];
  uint64_t v16 = [(_UICollectionLayoutSectionFixedSolver *)self layoutAxis];
  [v15 interGroupSpacing];
  double v18 = v17;
  if (v8)
  {
    double x = v8->_primaryContentFrame.origin.x;
    double y = v8->_primaryContentFrame.origin.y;
    if (self)
    {
LABEL_11:
      v21 = self->_solution;
      goto LABEL_12;
    }
  }
  else
  {
    double y = 0.0;
    double x = 0.0;
    if (self) {
      goto LABEL_11;
    }
  }
  v21 = 0;
LABEL_12:
  uint64_t v22 = [(_UICollectionLayoutItemSolver *)v21 supplementaryFrameWithKind:a4 absoluteIndex:v16 additionalFrameOffset:x interSolutionSpacing:y repeatAxis:v18];
  uint64_t v10 = (void *)v22;
  if (v22
    && *(void *)(v22 + 56) == 4
    && [(_UICollectionLayoutSectionFixedSolver *)self frameCount] <= a4)
  {

    uint64_t v10 = 0;
  }

LABEL_18:
  return v10;
}

- (id)auxillaryHostContainer
{
  if (!self || (uint64_t v3 = self->_memoizedAuxillaryHostContainer) == 0)
  {
    if ([(NSCollectionLayoutSection *)self->_layoutSection supplementariesFollowContentInsets])
    {
      unint64_t v4 = [(_UICollectionLayoutSectionFixedSolver *)self containerLayoutAxis];
      if (v4 == 1) {
        uint64_t v5 = 2;
      }
      else {
        uint64_t v5 = v4 == 2;
      }
      [(NSCollectionLayoutSection *)self->_layoutSection contentInsets];
      if (v5 == 2) {
        double v10 = 0.0;
      }
      else {
        double v10 = v9;
      }
      if (v5 == 2) {
        double v11 = 0.0;
      }
      else {
        double v11 = v7;
      }
      if (v5 == 1) {
        double v8 = 0.0;
      }
      else {
        double v9 = v10;
      }
      if (v5 == 1) {
        double v6 = 0.0;
      }
      else {
        double v7 = v11;
      }
      if (v5) {
        double v12 = v9;
      }
      else {
        double v12 = 0.0;
      }
      if (v5) {
        double v13 = v8;
      }
      else {
        double v13 = 0.0;
      }
      if (v5) {
        double v14 = v7;
      }
      else {
        double v14 = 0.0;
      }
      if (v5) {
        double v15 = v6;
      }
      else {
        double v15 = 0.0;
      }
      uint64_t v16 = [_UICollectionLayoutContainer alloc];
      id v17 = [(_UICollectionLayoutSectionFixedSolver *)self supplementaryContainer];
      [v17 contentSize];
      memoizedAuxillaryHostContainer = -[_UICollectionLayoutContainer initWithContentSize:contentInsets:](v16, v18, v19, v15, v14, v13, v12);
      objc_storeStrong((id *)&self->_memoizedAuxillaryHostContainer, memoizedAuxillaryHostContainer);
    }
    else
    {
      id v17 = [(_UICollectionLayoutSectionFixedSolver *)self supplementaryContainer];
      memoizedAuxillaryHostContainer = self->_memoizedAuxillaryHostContainer;
      self->_memoizedAuxillaryHostContainer = (NSCollectionLayoutContainer *)v17;
    }

    uint64_t v3 = self->_memoizedAuxillaryHostContainer;
  }
  return v3;
}

- (_UICollectionLayoutContainer)supplementaryContainer
{
  return self->_supplementaryContainer;
}

- (id)_queryFramesIntersectingRect:(CGFloat)a3 frameOffset:(CGFloat)a4
{
  if (a1)
  {
    id v14 = (id)[a1 layoutSection];
    if ([v14 _isEmptySection])
    {
      id v15 = (id)MEMORY[0x1E4F1CBF0];
    }
    else
    {
      uint64_t v16 = a1[6];
      id v17 = (void *)a1[3];
      if (v16)
      {
        double v18 = *(double *)(v16 + 72);
        rect2.origin.double x = *(CGFloat *)(v16 + 80);
      }
      else
      {
        rect2.origin.double x = 0.0;
        double v18 = 0.0;
      }
      float64_t v61 = a2;
      float64_t v62 = a3;
      float64_t v63 = a4;
      float64_t v64 = a5;
      double v19 = -[_UICollectionLayoutSectionGeometryTranslator contentRectForSectionRect:](v16, a2, a3, a4, a5);
      double v21 = v20;
      CGFloat v72 = v23;
      CGFloat v73 = v22;
      uint64_t v24 = [a1 layoutAxis];
      uint64_t v25 = [a1 frameCount];
      -[_UICollectionLayoutItemSolver layoutFrame]((uint64_t)v17);
      double v27 = v26;
      double v29 = v28;
      double v30 = _UISizeValueForAxis(v24, v26, v28);
      [v14 interGroupSpacing];
      double v32 = v30 + v31;
      double v33 = _UISetSizeValueForAxis(v24, v27, v29, v32);
      uint64_t v35 = v34;
      double v36 = _UIPointValueForAxis(v24, v19, v21);
      v80[5] = MEMORY[0x1E4F143A8];
      v80[6] = 3221225472;
      v80[7] = __82___UICollectionLayoutSectionFixedSolver__queryFramesIntersectingRect_frameOffset___block_invoke;
      v80[8] = &__block_descriptor_40_e8_q16__0d8l;
      *(double *)&v80[9] = v32;
      v80[0] = MEMORY[0x1E4F143A8];
      v80[1] = 3221225472;
      v80[2] = __82___UICollectionLayoutSectionFixedSolver__queryFramesIntersectingRect_frameOffset___block_invoke_2;
      v80[3] = &__block_descriptor_40_e8_d16__0q8l;
      *(double *)&v80[4] = v32;
      *(void *)&rect2.origin.double y = MEMORY[0x1E4F143A8];
      *(void *)&rect2.size.CGFloat width = 3221225472;
      *(void *)&rect2.size.CGFloat height = __82___UICollectionLayoutSectionFixedSolver__queryFramesIntersectingRect_frameOffset___block_invoke_3;
      v75 = &__block_descriptor_64_e39__CGRect__CGPoint_dd__CGSize_dd__16__0q8lu32l8;
      v76 = v80;
      uint64_t v77 = v24;
      double v78 = v33;
      uint64_t v79 = v35;
      if (v36 >= 0.0) {
        uint64_t v37 = (uint64_t)(v36 / v32);
      }
      else {
        uint64_t v37 = 0;
      }
      double v69 = v36;
      if (v17)
      {
        uint64_t v38 = v17[6];
        if (v38) {
          uint64_t v38 = *(void *)(v38 + 56);
        }
      }
      else
      {
        uint64_t v38 = 0;
      }
      double v65 = a6;
      double v66 = a7;
      double v67 = a7 + rect2.origin.x;
      double v68 = a6 + v18;
      uint64_t v39 = v38 * v37;
      id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      double v40 = -[_UICollectionLayoutItemSolver offsetForEdgeSpacing]((uint64_t)v17);
      double v70 = v41;
      double v71 = v40;
      while (1)
      {
        v82.origin.double x = (*(double (**)(CGFloat *, uint64_t))&rect2.size.height)(&rect2.origin.y, v37);
        double x = v82.origin.x;
        double y = v82.origin.y;
        CGFloat width = v82.size.width;
        CGFloat height = v82.size.height;
        rect2.origin.double x = v71 + v82.origin.x;
        CGFloat v46 = v70 + v82.origin.y;
        CGFloat v47 = CGRectGetWidth(v82);
        v83.origin.double x = x;
        v83.origin.double y = y;
        v83.size.CGFloat width = width;
        v83.size.CGFloat height = height;
        v87.size.CGFloat height = CGRectGetHeight(v83);
        v84.origin.double x = v19;
        v84.origin.double y = v21;
        v84.size.CGFloat width = v73;
        v84.size.CGFloat height = v72;
        v87.origin.double x = rect2.origin.x;
        v87.origin.double y = v46;
        v87.size.CGFloat width = v47;
        if (!CGRectIntersectsRect(v84, v87) || v25 <= v39) {
          break;
        }
        double v49 = v67 + y;
        double v50 = _UIPointValueForAxis(v24, x, y);
        double v51 = _UISetPointValueForAxis(v24, v19, v21, v69 - v50);
        CGFloat v53 = v52;
        v85.origin.double x = v19;
        v85.origin.double y = v21;
        v85.size.CGFloat width = v73;
        v85.size.CGFloat height = v72;
        CGFloat v54 = CGRectGetWidth(v85);
        v86.size.CGFloat width = v73;
        CGFloat v55 = v54;
        v86.origin.double x = v19;
        v86.origin.double y = v21;
        v86.size.CGFloat height = v72;
        CGFloat v56 = CGRectGetHeight(v86);
        v57 = -[_UICollectionLayoutItemSolver queryFramesWithQueryRect:additionalFrameOffset:itemIndexOffset:itemLimit:supplementaryRepeatOffset:](v17, v39, v25 - v39, v37, v51, v53, v55, v56, v68 + x, v49);
        [v15 addObjectsFromArray:v57];
        if (v17)
        {
          uint64_t v58 = v17[6];
          if (v58) {
            uint64_t v58 = *(void *)(v58 + 56);
          }
        }
        else
        {
          uint64_t v58 = 0;
        }
        v39 += v58;

        ++v37;
      }
      v59 = -[_UICollectionLayoutAuxillaryItemSolver queryFramesIntersectingRect:frameOffset:](a1[4], v61, v62, v63, v64, v65, v66);
      [v15 addObjectsFromArray:v59];
    }
  }
  else
  {
    id v15 = 0;
  }
  return v15;
}

- (void)solveForContainer:(id)a3 supplementaryContainer:(id)a4 traitCollection:(id)a5 layoutAxis:(unint64_t)a6 frameCount:(int64_t)a7 preferredSizes:(id)a8 layoutRTL:(BOOL)a9
{
  -[_UICollectionLayoutSectionFixedSolver setContainer:](self, "setContainer:", a3, a4, a5, a6, a7, a8);
  if (a4) {
    id v15 = a4;
  }
  else {
    id v15 = a3;
  }
  [(_UICollectionLayoutSectionFixedSolver *)self setSupplementaryContainer:v15];
  [(_UICollectionLayoutSectionFixedSolver *)self setTraitCollection:a5];
  [(_UICollectionLayoutSectionFixedSolver *)self setContainerLayoutAxis:a6];
  uint64_t v16 = [(_UICollectionLayoutSectionFixedSolver *)self layoutSection];
  int v17 = [v16 scrollsOrthogonally];
  uint64_t v18 = a6 == 2;
  if (a6 == 1) {
    uint64_t v18 = 2;
  }
  if (v17) {
    unint64_t v19 = v18;
  }
  else {
    unint64_t v19 = a6;
  }
  [(_UICollectionLayoutSectionFixedSolver *)self setLayoutAxis:v19];

  [(_UICollectionLayoutSectionFixedSolver *)self setFrameCount:a7];
  [(_UICollectionLayoutSectionFixedSolver *)self setLayoutRTL:a9];
  if (self)
  {
    double v20 = [(_UICollectionLayoutSectionFixedSolver *)self layoutSection];
    char v21 = [v20 _isEmptySection];

    if ((v21 & 1) == 0)
    {
      -[_UICollectionLayoutSectionFixedSolver _sectionContainer]((double *)self);
      id v87 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v22 = [(_UICollectionLayoutSectionFixedSolver *)self layoutAxis];
      double v23 = [_UICollectionLayoutItemSolver alloc];
      uint64_t v24 = [(_UICollectionLayoutSectionFixedSolver *)self layoutSection];
      uint64_t v25 = [v24 group];
      double v26 = -[_UICollectionLayoutItemSolver initWithItem:](v23, v25);

      double v27 = [(_UICollectionLayoutSectionFixedSolver *)self traitCollection];
      char v28 = [(_UICollectionLayoutSectionFixedSolver *)self layoutRTL];
      if (v26)
      {
        double v29 = *MEMORY[0x1E4F1DB30];
        double v30 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
        [(_UICollectionLayoutItemSolver *)(uint64_t)v26 _solveForContainer:v22 layoutAxis:v27 traitCollection:0x7FFFFFFFFFFFFFFFLL maxFrameCount:v28 layoutRTL:0 preferredSizes:0 largestKnownItemSize:*MEMORY[0x1E4F1DB30] solutionRecursionDepth:v30];

        objc_storeStrong((id *)&self->_solution, v26);
        double v31 = v26[6];
        if (!v31) {
          goto LABEL_24;
        }
        uint64_t v32 = v31[7];
        if (!v32) {
          goto LABEL_24;
        }
        -[_UICollectionLayoutItemSolver layoutFrame]((uint64_t)v26);
        double v34 = v33;
        double v36 = v35;
        double v37 = _UISizeValueForAxis(v22, v33, v35);
        int64_t v38 = [(_UICollectionLayoutSectionFixedSolver *)self frameCount] / v32;
        int64_t v39 = [(_UICollectionLayoutSectionFixedSolver *)self frameCount] % v32;
        double v40 = -[_UICollectionLayoutItemSolver contentSizeForFrameCount:layoutAxis:]((uint64_t)v26, v39, v22);
        if (v39)
        {
          double v42 = v40;
          double v43 = v41;
          double v44 = v37;
          if ([(_UICollectionLayoutSectionFixedSolver *)self shouldAdjustContentSizeForPartialLastGroupSolution])
          {
            double v44 = _UISizeValueForAxis(v22, v42, v43);
          }
        }
        else
        {
          double v44 = 0.0;
        }
        uint64_t v45 = v39 <= 0 ? v38 : v38 + 1;
        BOOL v46 = v45 < 1;
        uint64_t v47 = v45 - 1;
        if (!v46)
        {
          double v48 = (double)v47;
          double v49 = [(_UICollectionLayoutSectionFixedSolver *)self layoutSection];
          [v49 interGroupSpacing];
          double v51 = v50 * v48;

          double v52 = _UISetSizeValueForAxis(v22, v34, v36, v37 * (double)v38 + v44 + v51);
          double v54 = v53;
        }
        else
        {
LABEL_24:
          double v52 = v29;
          double v54 = v30;
        }
      }
      else
      {

        objc_storeStrong((id *)&self->_solution, 0);
        double v52 = *MEMORY[0x1E4F1DB30];
        double v54 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
        double v29 = *MEMORY[0x1E4F1DB30];
        double v30 = v54;
      }
      CGFloat v55 = [_UICollectionLayoutSectionGeometryTranslator alloc];
      uint64_t v56 = [(_UICollectionLayoutSectionFixedSolver *)self containerLayoutAxis];
      BOOL layoutRTL = self->_layoutRTL;
      uint64_t v58 = [(_UICollectionLayoutSectionFixedSolver *)self layoutSection];
      [v58 contentInsets];
      float64_t v63 = -[_UICollectionLayoutSectionGeometryTranslator initWithPrimaryContentSize:sectionAuxiliarySolutionSize:layoutAxis:layoutRTL:sectionInsets:contentFrameSupplementaryOffset:](v55, v56, layoutRTL, v52, v54, v29, v30, v59, v60, v61, v62, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
      objc_storeStrong((id *)&self->_sectionGeometryTranslator, v63);

      float64_t v64 = objc_alloc_init(_UICollectionLayoutSupplementaryEnroller);
      objc_storeStrong((id *)&self->_sectionSupplementaryEnroller, v64);

      double v65 = (void *)-[_UICollectionLayoutAuxillaryItemSolver initWithAuxillaryHost:]([_UICollectionLayoutAuxillaryItemSolver alloc], self);
      objc_storeStrong((id *)&self->_sectionAuxillarySolution, v65);

      unint64_t sectionAuxillarySolution = self->_sectionAuxillarySolution;
      if (sectionAuxillarySolution
        && (sectionAuxillarySolution->_hostContentSizeInsets.top != 0.0
         || sectionAuxillarySolution->_hostContentSizeInsets.bottom != 0.0
         || sectionAuxillarySolution->_hostContentSizeInsets.leading != 0.0
         || sectionAuxillarySolution->_hostContentSizeInsets.trailing != 0.0))
      {
        double width = sectionAuxillarySolution->_contentSize.width;
        double height = sectionAuxillarySolution->_contentSize.height;
        double v69 = [_UICollectionLayoutSectionGeometryTranslator alloc];
        uint64_t v70 = [(_UICollectionLayoutSectionFixedSolver *)self containerLayoutAxis];
        BOOL v71 = self->_layoutRTL;
        CGFloat v72 = [(_UICollectionLayoutSectionFixedSolver *)self layoutSection];
        [v72 contentInsets];
        double v76 = v75;
        double v78 = v77;
        uint64_t v79 = self->_sectionAuxillarySolution;
        if (v79)
        {
          double x = v79->_hostContentOffset.x;
          double y = v79->_hostContentOffset.y;
        }
        else
        {
          double y = 0.0;
          double x = 0.0;
        }
        CGRect v82 = -[_UICollectionLayoutSectionGeometryTranslator initWithPrimaryContentSize:sectionAuxiliarySolutionSize:layoutAxis:layoutRTL:sectionInsets:contentFrameSupplementaryOffset:](v69, v70, v71, v52, v54, width, height, v76, v78, v73, v74, x, y);
        objc_storeStrong((id *)&self->_sectionGeometryTranslator, v82);
      }
      BOOL v83 = [(NSCollectionLayoutSection *)self->_layoutSection scrollsOrthogonally];
      double v84 = 0.0;
      double v85 = 0.0;
      if (v83)
      {
        unint64_t layoutAxis = self->_layoutAxis;
        if (layoutAxis == 1)
        {
          double v85 = 1.0;
        }
        else if (layoutAxis == 2)
        {
          double v84 = 1.0;
        }
      }
      -[_UICollectionLayoutSectionFixedSolver setOrthogonalScrollingPrefetchingUnitVector:](self, "setOrthogonalScrollingPrefetchingUnitVector:", v84, v85);
    }
  }
}

- (NSCollectionLayoutSection)layoutSection
{
  return self->_layoutSection;
}

- (int64_t)frameCount
{
  return self->_frameCount;
}

- (unint64_t)containerLayoutAxis
{
  return self->_containerLayoutAxis;
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (BOOL)layoutRTL
{
  return self->_layoutRTL;
}

- (void)setTraitCollection:(id)a3
{
}

- (void)setSupplementaryContainer:(id)a3
{
}

- (void)setOrthogonalScrollingPrefetchingUnitVector:(CGVector)a3
{
  self->_orthogonalScrollingPrefetchingUnitVector = a3;
}

- (void)setLayoutRTL:(BOOL)a3
{
  self->_BOOL layoutRTL = a3;
}

- (void)setLayoutAxis:(unint64_t)a3
{
  self->_unint64_t layoutAxis = a3;
}

- (void)setFrameCount:(int64_t)a3
{
  self->_frameCount = a3;
}

- (void)setContainerLayoutAxis:(unint64_t)a3
{
  self->_containerLayoutAxis = a3;
}

- (void)setContainer:(id)a3
{
}

- (double)_sectionContainer
{
  v1 = a1;
  if (a1)
  {
    v2 = [a1 container];
    [v2 contentInsets];
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;

    if ([v1 layoutAxis] == 2)
    {
      double v11 = [v1 layoutSection];
      [v11 contentInsets];
      double v6 = v6 + v12;

      double v13 = [v1 layoutSection];
      [v13 contentInsets];
      double v10 = v10 + v14;
    }
    else if ([v1 layoutAxis] == 1)
    {
      id v15 = [v1 layoutSection];
      [v15 contentInsets];
      double v4 = v4 + v16;

      double v13 = [v1 layoutSection];
      [v13 contentInsets];
      double v8 = v8 + v17;
    }
    else
    {
      double v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:sel__sectionContainer object:v1 file:@"_UICollectionLayoutSectionFixedSolver.m" lineNumber:494 description:@"Unknown layout axis."];
    }

    uint64_t v18 = [_UICollectionLayoutContainer alloc];
    unint64_t v19 = [v1 container];
    [v19 contentSize];
    v1 = -[_UICollectionLayoutContainer initWithContentSize:contentInsets:](v18, v20, v21, v4, v6, v8, v10);
  }
  return v1;
}

- (unint64_t)layoutAxis
{
  return self->_layoutAxis;
}

- (_UICollectionLayoutContainer)container
{
  return self->_container;
}

- (BOOL)shouldAdjustContentSizeForPartialLastGroupSolution
{
  return self->_shouldAdjustContentSizeForPartialLastGroupSolution;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_supplementaryContainer, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_layoutSection, 0);
  objc_storeStrong((id *)&self->_memoizedAuxillaryHostContainer, 0);
  objc_storeStrong((id *)&self->_sectionGeometryTranslator, 0);
  objc_storeStrong((id *)&self->_sectionSupplementaryEnroller, 0);
  objc_storeStrong((id *)&self->_sectionAuxillarySolution, 0);
  objc_storeStrong((id *)&self->_solution, 0);
  objc_storeStrong((id *)&self->_errorDescription, 0);
}

- (void)solveForContainer:(id)a3 traitCollection:(id)a4 layoutAxis:(unint64_t)a5 frameCount:(int64_t)a6
{
  LOBYTE(v6) = 0;
  [(_UICollectionLayoutSectionFixedSolver *)self solveForContainer:a3 supplementaryContainer:0 traitCollection:a4 layoutAxis:a5 frameCount:a6 preferredSizes:0 layoutRTL:v6];
}

- (void)solveForContainer:(id)a3 traitCollection:(id)a4 layoutAxis:(unint64_t)a5 frameCount:(int64_t)a6 preferredSizes:(id)a7
{
  LOBYTE(v7) = 0;
  [(_UICollectionLayoutSectionFixedSolver *)self solveForContainer:a3 supplementaryContainer:0 traitCollection:a4 layoutAxis:a5 frameCount:a6 preferredSizes:a7 layoutRTL:v7];
}

- (id)resolveWithParameters:(id)a3 preferredSizes:(id)a4
{
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  [v6 handleFailureInMethod:a2 object:self file:@"_UICollectionLayoutSectionFixedSolver.m" lineNumber:94 description:@"This solver does not handle estimated items so this method does nothing. Are you calling this in error?"];

  uint64_t v7 = objc_alloc_init(_UICollectionLayoutSolveResult);
  return v7;
}

- (void)updatePinnedSupplementaryItemsWithVisibleBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v8 = [(_UICollectionLayoutSectionFixedSolver *)self layoutSection];
  char v9 = [v8 _isEmptySection];

  if ((v9 & 1) == 0)
  {
    double v10 = objc_alloc_init(_UICollectionLayoutSupplementaryEnroller);
    -[UIBackgroundConfiguration _setBackgroundColor:]((uint64_t)self, v10);

    if (self) {
      unint64_t sectionAuxillarySolution = self->_sectionAuxillarySolution;
    }
    else {
      unint64_t sectionAuxillarySolution = 0;
    }
    -[_UICollectionLayoutAuxillaryItemSolver resolveSupplementaryItemsForVisibleBounds:]((id *)&sectionAuxillarySolution->super.isa, x, y, width, height);
  }
}

- (void)updatePinnedSupplementaryItemsWithVisibleBounds:(CGRect)a3 overrideContentRectForPinning:(CGRect)a4
{
  self->_overrideContentRectForPinning = a4;
  -[_UICollectionLayoutSectionFixedSolver updatePinnedSupplementaryItemsWithVisibleBounds:](self, "updatePinnedSupplementaryItemsWithVisibleBounds:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  CGSize v5 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
  self->_overrideContentRectForPinning.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
  self->_overrideContentRectForPinning.size = v5;
}

- (id)queryFramesIntersectingRect:(CGRect)a3
{
  return -[_UICollectionLayoutSectionFixedSolver _queryFramesIntersectingRect:frameOffset:](self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
}

- (id)visualDescription
{
  v28[2] = *MEMORY[0x1E4F143B8];
  double v3 = [(_UICollectionLayoutSectionFixedSolver *)self container];
  [v3 contentSize];
  double v5 = v4;
  uint64_t v6 = [(_UICollectionLayoutSectionFixedSolver *)self container];
  [v6 contentSize];
  double v8 = v7;

  [(_UICollectionLayoutSectionFixedSolver *)self contentFrameIncludingAuxiliaries];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  double v13 = [(_UICollectionLayoutSectionFixedSolver *)self layoutSection];
  [v13 contentInsets];
  double v15 = v14;
  double v16 = [(_UICollectionLayoutSectionFixedSolver *)self layoutSection];
  [v16 contentInsets];
  double v18 = v17;

  unint64_t v19 = -[_UICollectionLayoutSectionFixedSolver _queryFramesIntersectingRect:frameOffset:](self, 0.0, 0.0, v10, v12, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  double v20 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", 0.0, 0.0, v5, v8);
  double v21 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v15, v18, v10, v12);
  v28[0] = v20;
  v28[1] = v21;
  uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
  double v23 = [v19 valueForKey:@"frame"];
  uint64_t v24 = [v22 arrayByAddingObjectsFromArray:v23];

  uint64_t v25 = [[_UIASCIIArtFramesRenderer alloc] initWithFrames:v24];
  double v26 = [(_UIASCIIArtFramesRenderer *)v25 description];

  return v26;
}

- (NSIndexSet)pinnedSupplementaryIndexes
{
  if (self)
  {
    Class isa = self[1].super.isa;
    if (isa) {
      return (NSIndexSet *)*((void *)isa + 5);
    }
    else {
      return 0;
    }
  }
  return self;
}

- (CGRect)primaryContentFrame
{
  if (self && (v2 = self->_sectionGeometryTranslator) != 0)
  {
    CGFloat x = v2->_primaryContentFrame.origin.x;
    CGFloat y = v2->_primaryContentFrame.origin.y;
    CGFloat width = v2->_primaryContentFrame.size.width;
    CGFloat height = v2->_primaryContentFrame.size.height;
  }
  else
  {
    CGFloat x = *MEMORY[0x1E4F1DB28];
    CGFloat y = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    CGFloat width = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    CGFloat height = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  double v7 = x;
  double v8 = y;
  double v9 = width;
  double v10 = height;
  result.size.CGFloat height = v10;
  result.size.CGFloat width = v9;
  result.origin.CGFloat y = v8;
  result.origin.CGFloat x = v7;
  return result;
}

- (id)sectionSupplementaryFrameForIndex:(int64_t)a3
{
  double v5 = self;
  if (self) {
    self = (_UICollectionLayoutSectionFixedSolver *)self->_sectionAuxillarySolution;
  }
  uint64_t v6 = -[_UICollectionLayoutAuxillaryItemSolver supplementaryFrames]((id *)&self->super.isa);
  unint64_t v7 = [v6 count];

  if (v7 <= a3)
  {
    CGFloat v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, v5, @"_UICollectionLayoutSectionFixedSolver.m", 221, @"Invalid parameter not satisfying: %@", @"index < self.sectionAuxillarySolution.supplementaryFrames.count" object file lineNumber description];

    if (v5) {
      goto LABEL_5;
    }
LABEL_12:
    double v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, v5, @"_UICollectionLayoutSectionFixedSolver.m", 222, @"Invalid parameter not satisfying: %@", @"self.sectionGeometryTranslator" object file lineNumber description];

    p_Class isa = 0;
    goto LABEL_8;
  }
  if (!v5) {
    goto LABEL_12;
  }
LABEL_5:
  if (!v5->_sectionGeometryTranslator)
  {
    double v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, v5, @"_UICollectionLayoutSectionFixedSolver.m", 222, @"Invalid parameter not satisfying: %@", @"self.sectionGeometryTranslator" object file lineNumber description];
  }
  p_Class isa = (id *)&v5->_sectionAuxillarySolution->super.isa;
LABEL_8:
  double v9 = -[_UICollectionLayoutAuxillaryItemSolver supplementaryFrames](p_isa);
  double v10 = [v9 objectAtIndexedSubscript:a3];

  return v10;
}

- (id)unpinnedSectionSupplementaryFrameForIndex:(int64_t)a3
{
  if (self) {
    unint64_t sectionAuxillarySolution = self->_sectionAuxillarySolution;
  }
  else {
    unint64_t sectionAuxillarySolution = 0;
  }
  unint64_t v7 = sectionAuxillarySolution;
  double v8 = -[_UICollectionLayoutAuxillaryItemSolver unpinnedFramesOfPinnedSupplementaries](v7);

  if (v8)
  {
    double v9 = -[_UICollectionLayoutAuxillaryItemSolver unpinnedFramesOfPinnedSupplementaries](v7);
    unint64_t v10 = [v9 count];

    if (v10 <= a3)
    {
      double v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:a2, self, @"_UICollectionLayoutSectionFixedSolver.m", 235, @"Invalid parameter not satisfying: %@", @"index < sectionAuxillarySolution.unpinnedFramesOfPinnedSupplementaries.count" object file lineNumber description];

      if (!self) {
        goto LABEL_13;
      }
    }
    else if (!self)
    {
      goto LABEL_13;
    }
    if (self->_sectionGeometryTranslator)
    {
LABEL_7:
      double v11 = -[_UICollectionLayoutAuxillaryItemSolver unpinnedFramesOfPinnedSupplementaries](v7);
      CGFloat v12 = [v11 objectAtIndexedSubscript:a3];

      goto LABEL_9;
    }
LABEL_13:
    double v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"_UICollectionLayoutSectionFixedSolver.m", 236, @"Invalid parameter not satisfying: %@", @"self.sectionGeometryTranslator" object file lineNumber description];

    goto LABEL_7;
  }
  CGFloat v12 = [(_UICollectionLayoutSectionFixedSolver *)self sectionSupplementaryFrameForIndex:a3];
LABEL_9:

  return v12;
}

- (id)unpinnedSectionSupplementaryFrameWithKind:(id)a3 forIndex:(int64_t)a4
{
  if (a3 && [a3 length])
  {
    if ((a4 & 0x8000000000000000) == 0) {
      goto LABEL_4;
    }
LABEL_10:
    double v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"_UICollectionLayoutSectionFixedSolver.m", 243, @"Invalid parameter not satisfying: %@", @"index >= 0" object file lineNumber description];

    if (self) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
  unint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
  [v10 handleFailureInMethod:a2, self, @"_UICollectionLayoutSectionFixedSolver.m", 242, @"Invalid parameter not satisfying: %@", @"kind != nil && kind.length > 0" object file lineNumber description];

  if (a4 < 0) {
    goto LABEL_10;
  }
LABEL_4:
  if (self)
  {
LABEL_5:
    unint64_t sectionAuxillarySolution = self->_sectionAuxillarySolution;
    goto LABEL_6;
  }
LABEL_11:
  unint64_t sectionAuxillarySolution = 0;
LABEL_6:
  return -[_UICollectionLayoutAuxillaryItemSolver unpinnedSupplementaryFrameWithKind:index:]((id *)&sectionAuxillarySolution->super.isa, a3, a4);
}

- (int64_t)sectionSupplementaryKindIndexForEnrollmentIdentifier:(id)a3
{
  if (a3)
  {
    if (self)
    {
LABEL_3:
      sectionSupplementaryEnroller = self->_sectionSupplementaryEnroller;
      goto LABEL_4;
    }
  }
  else
  {
    double v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"_UICollectionLayoutSectionFixedSolver.m", 249, @"Invalid parameter not satisfying: %@", @"enrollmentIdentifier" object file lineNumber description];

    if (self) {
      goto LABEL_3;
    }
  }
  sectionSupplementaryEnroller = 0;
LABEL_4:
  return -[_UICollectionLayoutSupplementaryEnroller kindIndexForEnrollmentIdentifier:]((uint64_t)sectionSupplementaryEnroller, (uint64_t)a3);
}

- (id)sectionSupplementaryFrameWithKind:(id)a3 index:(int64_t)a4
{
  if ([a3 length])
  {
    if ((a4 & 0x8000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_11:
    double v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"_UICollectionLayoutSectionFixedSolver.m", 256, @"Invalid parameter not satisfying: %@", @"index>=0" object file lineNumber description];

    if (self) {
      goto LABEL_4;
    }
LABEL_12:
    CGFloat v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"_UICollectionLayoutSectionFixedSolver.m", 257, @"Invalid parameter not satisfying: %@", @"self.sectionGeometryTranslator" object file lineNumber description];

    unint64_t sectionAuxillarySolution = 0;
    goto LABEL_7;
  }
  unint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
  [v10 handleFailureInMethod:a2, self, @"_UICollectionLayoutSectionFixedSolver.m", 255, @"Invalid parameter not satisfying: %@", @"kind.length" object file lineNumber description];

  if (a4 < 0) {
    goto LABEL_11;
  }
LABEL_3:
  if (!self) {
    goto LABEL_12;
  }
LABEL_4:
  if (!self->_sectionGeometryTranslator)
  {
    double v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"_UICollectionLayoutSectionFixedSolver.m", 257, @"Invalid parameter not satisfying: %@", @"self.sectionGeometryTranslator" object file lineNumber description];
  }
  unint64_t sectionAuxillarySolution = self->_sectionAuxillarySolution;
LABEL_7:
  return -[_UICollectionLayoutAuxillaryItemSolver supplementaryFrameWithKind:index:]((id *)&sectionAuxillarySolution->super.isa, a3, a4);
}

- (_NSRange)preferredSizeGroupingRangeForItemAtIndex:(int64_t)a3
{
  NSUInteger v3 = 0x7FFFFFFFFFFFFFFFLL;
  NSUInteger v4 = 0;
  result.length = v4;
  result.location = v3;
  return result;
}

- (CGRect)auxillaryHostPinningRect
{
  if (self)
  {
    CGFloat x = self->_overrideContentRectForPinning.origin.x;
    CGFloat y = self->_overrideContentRectForPinning.origin.y;
    CGFloat width = self->_overrideContentRectForPinning.size.width;
    CGFloat height = self->_overrideContentRectForPinning.size.height;
  }
  else
  {
    CGFloat y = 0.0;
    CGFloat width = 0.0;
    CGFloat height = 0.0;
    CGFloat x = 0.0;
  }
  v12.origin.CGFloat x = x;
  v12.origin.CGFloat y = y;
  v12.size.CGFloat width = width;
  v12.size.CGFloat height = height;
  if (CGRectIsNull(v12))
  {
    CGFloat width = 0.0;
    if (self)
    {
      sectionGeometryTranslator = self->_sectionGeometryTranslator;
      CGFloat height = 0.0;
      CGFloat y = 0.0;
      CGFloat x = 0.0;
      if (sectionGeometryTranslator)
      {
        CGFloat x = sectionGeometryTranslator->_contentFrameIncludingAuxiliaries.origin.x;
        CGFloat y = sectionGeometryTranslator->_contentFrameIncludingAuxiliaries.origin.y;
        CGFloat width = sectionGeometryTranslator->_contentFrameIncludingAuxiliaries.size.width;
        CGFloat height = sectionGeometryTranslator->_contentFrameIncludingAuxiliaries.size.height;
      }
    }
    else
    {
      CGFloat height = 0.0;
      CGFloat y = 0.0;
      CGFloat x = 0.0;
    }
  }
  double v8 = x;
  double v9 = y;
  double v10 = width;
  double v11 = height;
  result.size.CGFloat height = v11;
  result.size.CGFloat width = v10;
  result.origin.CGFloat y = v9;
  result.origin.CGFloat x = v8;
  return result;
}

- (BOOL)auxillaryHostWantsOverlapAdjustmentForMatchingAlignmentsOnly
{
  return !CGRectIsNull(self->_overrideContentRectForPinning);
}

- (void)setOrthogonalOffset:(CGPoint)a3
{
  unint64_t layoutAxis = self->_layoutAxis;
  if (layoutAxis == 1) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = layoutAxis == 2;
  }
  double v6 = _UISetPointValueForAxis(v5, a3.x, a3.y, 0.0);
  double v8 = v7;
  double v9 = 1.0;
  double x = self->_orthogonalOffset.x;
  double y = self->_orthogonalOffset.y;
  BOOL v12 = v6 < x;
  BOOL v13 = v6 <= x;
  double v14 = -1.0;
  if (!v12) {
    double v14 = 0.0;
  }
  if (!v13) {
    double v14 = 1.0;
  }
  if (v8 <= y)
  {
    double v9 = 0.0;
    if (v8 < y) {
      double v9 = -1.0;
    }
  }
  -[_UICollectionLayoutSectionFixedSolver setOrthogonalScrollingPrefetchingUnitVector:](self, "setOrthogonalScrollingPrefetchingUnitVector:", v14, v9);
  self->_orthogonalOffset.double x = v6;
  self->_orthogonalOffset.double y = v8;
}

- (double)_dimensionForRootGroupAlongAxis:(unint64_t)a3
{
  uint64_t v5 = -[_UICollectionLayoutSectionFixedSolver _sectionContainer]((double *)self);
  double v6 = [(_UICollectionLayoutSectionFixedSolver *)self traitCollection];
  [v6 displayScale];
  double v8 = v7;

  double v9 = [(_UICollectionLayoutSectionFixedSolver *)self layoutSection];
  double v10 = [v9 group];
  double v11 = [v10 size];
  [v11 _effectiveSizeForContainer:v5 displayScale:0 ignoringInsets:v8];
  double v13 = v12;
  double v15 = v14;

  double v16 = _UISizeValueForAxis(a3, v13, v15);
  return v16;
}

- (void)setShouldAdjustContentSizeForPartialLastGroupSolution:(BOOL)a3
{
  self->_shouldAdjustContentSizeForPartialLastGroupSolution = a3;
}

- (CGPoint)orthogonalOffset
{
  double x = self->_orthogonalOffset.x;
  double y = self->_orthogonalOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setLayoutSection:(id)a3
{
}

- (CGVector)orthogonalScrollingPrefetchingUnitVector
{
  ddouble x = self->_orthogonalScrollingPrefetchingUnitVector.dx;
  ddouble y = self->_orthogonalScrollingPrefetchingUnitVector.dy;
  result.ddouble y = dy;
  result.ddouble x = dx;
  return result;
}

@end
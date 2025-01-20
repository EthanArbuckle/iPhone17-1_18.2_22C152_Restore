@interface _UICollectionLayoutSectionEstimatedSolver
- (BOOL)auxillaryHostWantsOverlapAdjustmentForMatchingAlignmentsOnly;
- (BOOL)layoutRTL;
- (BOOL)shouldAdjustContentSizeForPartialLastGroupSolution;
- (CGPoint)orthogonalOffset;
- (CGRect)_adjustContentFrameForLastPartialSolutionIfNeededForContentFrame:(CGRect)a3 bookmarks:(id)a4;
- (CGRect)_rectWithContentInsetTrailingLayoutDimensionAddedToToRect:(CGRect)a3 insets:(NSDirectionalEdgeInsets)a4 layoutAxis:(unint64_t)a5;
- (CGRect)auxillaryHostPinningRect;
- (CGRect)contentFrameIncludingAuxiliaries;
- (CGRect)primaryContentFrame;
- (CGSize)auxillaryHostContentSize;
- (CGVector)orthogonalScrollingPrefetchingUnitVector;
- (NSCollectionLayoutSection)layoutSection;
- (NSIndexSet)pinnedSupplementaryIndexes;
- (NSString)errorDescription;
- (UITraitCollection)traitCollection;
- (_NSRange)_rangeOfBookmarksAffectedByResolveItems:(id)a3;
- (_NSRange)preferredSizeGroupingRangeForItemAtIndex:(int64_t)a3;
- (_UICollectionLayoutContainer)container;
- (_UICollectionLayoutContainer)supplementaryContainer;
- (double)_dimensionForRootGroupAlongAxis:(unint64_t)a3;
- (double)auxillaryHostPaddingBeforeBoundarySupplementaries;
- (id)_sectionContainer;
- (id)_solveWithParameters:(id)a3;
- (id)auxillaryHostAuxillaryItems;
- (id)auxillaryHostContainer;
- (id)auxillaryHostPreferredSizes;
- (id)auxillaryHostSupplementaryEnroller;
- (id)frameForIndex:(int64_t)a3;
- (id)initWithLayoutSection:(void *)a1;
- (id)queryFramesIntersectingRect:(CGRect)a3;
- (id)queryFramesIntersectingRect:(CGRect)a3 frameOffset:(CGPoint)a4;
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
- (unint64_t)auxillaryHostLayoutAxis;
- (unint64_t)containerSizeDependentAxes;
- (unint64_t)layoutAxis;
- (void)_configureInitialOrthogonalPrefetchingUnitVector;
- (void)_updateSolutionAuxillaryRangeIndexerKindDict:(id)a3 fromBookmark:(id)a4;
- (void)setOrthogonalOffset:(CGPoint)a3;
- (void)setOrthogonalScrollingPrefetchingUnitVector:(CGVector)a3;
- (void)setShouldAdjustContentSizeForPartialLastGroupSolution:(BOOL)a3;
- (void)setSupplementaryContainer:(id)a3;
- (void)solveForContainer:(id)a3 supplementaryContainer:(id)a4 traitCollection:(id)a5 layoutAxis:(unint64_t)a6 frameCount:(int64_t)a7 preferredSizes:(id)a8 layoutRTL:(BOOL)a9;
- (void)solveForContainer:(id)a3 traitCollection:(id)a4 layoutAxis:(unint64_t)a5 frameCount:(int64_t)a6;
- (void)solveForContainer:(id)a3 traitCollection:(id)a4 layoutAxis:(unint64_t)a5 frameCount:(int64_t)a6 preferredSizes:(id)a7;
- (void)updatePinnedSupplementaryItemsWithVisibleBounds:(CGRect)a3;
- (void)updatePinnedSupplementaryItemsWithVisibleBounds:(CGRect)a3 overrideContentRectForPinning:(CGRect)a4;
@end

@implementation _UICollectionLayoutSectionEstimatedSolver

- (unint64_t)layoutAxis
{
  return self->_layoutAxis;
}

- (int64_t)auxillaryHostAuxillaryKind
{
  return 2;
}

- (id)frameForIndex:(int64_t)a3
{
  if (self && (solutionState = self->_solutionState) != 0)
  {
    v6 = solutionState->_itemRangeIndexer;
    v7 = self->_solutionState;
    v8 = v7;
    if (v7) {
      bookmarks = v7->_bookmarks;
    }
    else {
      bookmarks = 0;
    }
    v10 = bookmarks;

    if (!v6
      || (ptr = v6->_orderedRangeIndexerImpl.__ptr_,
          v36[0] = 0,
          v36[1] = 0,
          uint64_t v37 = 0,
          _UIOrderedRangeIndexerImpl::binarySearchForLocation(ptr, a3, (uint64_t)v36),
          v12 = 0,
          v37 != 0x7FFFFFFFFFFFFFFFLL))
    {
      uint64_t v13 = -[NSArray objectAtIndexedSubscript:](v10, "objectAtIndexedSubscript:");
      v14 = (double *)v13;
      if (v13)
      {
        int64_t v15 = a3 - *(void *)(v13 + 24);
        uint64_t v13 = *(void *)(v13 + 8);
      }
      else
      {
        int64_t v15 = a3;
      }
      v16 = -[_UICollectionLayoutItemSolver itemFrames](v13);
      uint64_t v17 = [v16 objectAtIndexedSubscript:v15];

      v18 = self->_solutionState;
      v19 = v18;
      if (v18) {
        sectionGeometryTranslator = v18->_sectionGeometryTranslator;
      }
      else {
        sectionGeometryTranslator = 0;
      }
      v21 = sectionGeometryTranslator;

      double v22 = 0.0;
      double v23 = 0.0;
      CGFloat v24 = 0.0;
      CGFloat v25 = 0.0;
      double v26 = 0.0;
      if (v17)
      {
        double v26 = *(double *)(v17 + 64);
        double v23 = *(double *)(v17 + 72);
        CGFloat v24 = *(double *)(v17 + 80);
        CGFloat v25 = *(double *)(v17 + 88);
      }
      double v27 = 0.0;
      if (v21)
      {
        double v27 = v21[9];
        double v22 = v21[10];
      }

      if (v14)
      {
        double v29 = v14[5];
        double v28 = v14[6];
      }
      else
      {
        double v28 = 0.0;
        double v29 = 0.0;
      }
      double v30 = v22 + v28;
      double v31 = v26 + v27 + v29;
      double v32 = v23 + v30;
      v39.origin.x = v26;
      v39.origin.y = v23;
      v39.size.width = v24;
      v39.size.height = v25;
      double Width = CGRectGetWidth(v39);
      v40.origin.x = v26;
      v40.origin.y = v23;
      v40.size.width = v24;
      v40.size.height = v25;
      double Height = CGRectGetHeight(v40);
      v12 = -[_UICollectionLayoutFramesQueryResult copyWithFrame:index:]((id *)v17, (void *)a3, v31, v32, Width, Height);
    }
  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (NSCollectionLayoutSection)layoutSection
{
  return self->_layoutSection;
}

- (CGRect)contentFrameIncludingAuxiliaries
{
  if (self)
  {
    v2 = self->_solutionState;
    v3 = v2;
    if (v2)
    {
      sectionGeometryTranslator = v2->_sectionGeometryTranslator;
      goto LABEL_4;
    }
  }
  else
  {
    v3 = 0;
  }
  sectionGeometryTranslator = 0;
LABEL_4:
  v5 = sectionGeometryTranslator;

  p_x = (double *)MEMORY[0x1E4F1DB28];
  p_y = (double *)(MEMORY[0x1E4F1DB28] + 8);
  p_width = (double *)(MEMORY[0x1E4F1DB28] + 16);
  p_height = (double *)(MEMORY[0x1E4F1DB28] + 24);
  if (v5)
  {
    p_height = &v5->_contentFrameIncludingAuxiliaries.size.height;
    p_width = &v5->_contentFrameIncludingAuxiliaries.size.width;
    p_y = &v5->_contentFrameIncludingAuxiliaries.origin.y;
    p_x = &v5->_contentFrameIncludingAuxiliaries.origin.x;
  }
  double v10 = *p_x;
  double v11 = *p_y;
  double v12 = *p_width;
  double v13 = *p_height;

  double v14 = v10;
  double v15 = v11;
  double v16 = v12;
  double v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (id)queryFramesIntersectingRect:(CGRect)a3 frameOffset:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat v8 = a3.origin.y;
  CGFloat v9 = a3.origin.x;
  if (self) {
    solutionState = self->_solutionState;
  }
  else {
    solutionState = 0;
  }
  id v12 = [(_UICollectionLayoutSectionEstimatedSolver *)self layoutSection];
  if (solutionState && ([v12 _isEmptySection] & 1) == 0)
  {
    uint64_t sectionGeometryTranslator = (uint64_t)solutionState->_sectionGeometryTranslator;
    double v15 = -[_UICollectionLayoutSectionGeometryTranslator contentRectForSectionRect:](sectionGeometryTranslator, v9, v8, width, height);
    float64_t v38 = v16;
    float64_t v39 = v15;
    long long v35 = v17;
    float64_t v37 = v18;
    if (sectionGeometryTranslator)
    {
      double v20 = *(double *)(sectionGeometryTranslator + 72);
      double v19 = *(double *)(sectionGeometryTranslator + 80);
    }
    else
    {
      double v19 = 0.0;
      double v20 = 0.0;
    }
    double v21 = x + v20;
    double v22 = y + v19;
    bookmarks = solutionState->_bookmarks;
    geometricIndexer = solutionState->_geometricIndexer;
    unint64_t v25 = [(_UICollectionLayoutSectionEstimatedSolver *)self layoutAxis];
    int64_t v26 = [(_UICollectionLayoutSectionEstimatedSolver *)self frameCount];
    double v27 = objc_opt_new();
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __85___UICollectionLayoutSectionEstimatedSolver_queryFramesIntersectingRect_frameOffset___block_invoke;
    v40[3] = &unk_1E52E14D8;
    v42 = bookmarks;
    unint64_t v43 = v25;
    float64_t v44 = v39;
    float64_t v45 = v36;
    float64_t v46 = v38;
    float64_t v47 = v37;
    CGFloat v48 = v9;
    CGFloat v49 = v8;
    CGFloat v50 = width;
    CGFloat v51 = height;
    int64_t v52 = v26;
    double v53 = v21;
    double v54 = v22;
    id v28 = v27;
    id v41 = v28;
    if (geometricIndexer)
    {
      char v56 = 0;
      ptr = geometricIndexer->_root.__ptr_;
      v31.f64[0] = v38;
      v30.f64[0] = v39;
      v30.f64[1] = v36;
      v31.f64[1] = v37;
      v55[0] = vaddq_f64(v30, vminnmq_f64(v31, (float64x2_t)0));
      v55[1] = vabsq_f64(v31);
      _UIRTreeContainerNode<unsigned long>::enumerateElementsIntersecting(ptr, v55, &v56, (uint64_t)v40);
    }
    if (self) {
      sectionSupplementarySolution = self->_sectionSupplementarySolution;
    }
    else {
      sectionSupplementarySolution = 0;
    }
    v33 = -[_UICollectionLayoutAuxillaryItemSolver queryFramesIntersectingRect:frameOffset:]((uint64_t)sectionSupplementarySolution, v9, v8, width, height, x, y);
    if ([v33 count]) {
      [v28 addObjectsFromArray:v33];
    }
    id v13 = v28;
  }
  else
  {
    id v13 = (id)MEMORY[0x1E4F1CBF0];
  }
  return v13;
}

- (int64_t)frameCount
{
  return self->_frameCount;
}

- (unint64_t)auxillaryHostLayoutAxis
{
  if (self) {
    return *(void *)(self + 112);
  }
  return self;
}

- (id)auxillaryHostSupplementaryEnroller
{
  v2 = objc_alloc_init(_UICollectionLayoutSupplementaryEnroller);
  return v2;
}

- (id)auxillaryHostPreferredSizes
{
  if (self) {
    self = (_UICollectionLayoutSectionEstimatedSolver *)self->_preferredSizes;
  }
  return self;
}

- (void)setOrthogonalScrollingPrefetchingUnitVector:(CGVector)a3
{
  self->_orthogonalScrollingPrefetchingUnitVector = a3;
}

- (NSString)errorDescription
{
  return self->_errorDescription;
}

- (void)solveForContainer:(id)a3 supplementaryContainer:(id)a4 traitCollection:(id)a5 layoutAxis:(unint64_t)a6 frameCount:(int64_t)a7 preferredSizes:(id)a8 layoutRTL:(BOOL)a9
{
  objc_storeStrong((id *)&self->_container, a3);
  if (a4) {
    id v16 = a4;
  }
  else {
    id v16 = a3;
  }
  objc_storeStrong((id *)&self->_supplementaryContainer, v16);
  objc_storeStrong((id *)&self->_traitCollection, a5);
  self->_containerLayoutAxis = a6;
  long long v17 = [(_UICollectionLayoutSectionEstimatedSolver *)self layoutSection];
  int v18 = [v17 scrollsOrthogonally];
  unint64_t v19 = a6 == 2;
  if (a6 == 1) {
    unint64_t v19 = 2;
  }
  if (!v18) {
    unint64_t v19 = a6;
  }
  self->_layoutAxis = v19;

  self->_frameCount = a7;
  objc_storeStrong((id *)&self->_preferredSizes, a8);
  self->_layoutRTL = a9;
  double v20 = +[_UICollectionLayoutSolveParameters parametersForFullResolve]();
  id v21 = [(_UICollectionLayoutSectionEstimatedSolver *)self _solveWithParameters:v20];

  [(_UICollectionLayoutSectionEstimatedSolver *)self _configureInitialOrthogonalPrefetchingUnitVector];
}

- (unint64_t)containerSizeDependentAxes
{
  return self->_containerSizeDependentAxes;
}

- (void)_configureInitialOrthogonalPrefetchingUnitVector
{
  BOOL v3 = [(NSCollectionLayoutSection *)self->_layoutSection scrollsOrthogonally];
  double v4 = 0.0;
  double v5 = 0.0;
  if (v3)
  {
    unint64_t layoutAxis = self->_layoutAxis;
    double v5 = 1.0;
    double v7 = layoutAxis == 2 ? 1.0 : 0.0;
    if (layoutAxis != 1)
    {
      double v4 = v7;
      double v5 = 0.0;
    }
  }
  -[_UICollectionLayoutSectionEstimatedSolver setOrthogonalScrollingPrefetchingUnitVector:](self, "setOrthogonalScrollingPrefetchingUnitVector:", v4, v5);
}

- (id)initWithLayoutSection:(void *)a1
{
  if (!a1) {
    return 0;
  }
  v9.receiver = a1;
  v9.super_class = (Class)_UICollectionLayoutSectionEstimatedSolver;
  BOOL v3 = (id *)objc_msgSendSuper2(&v9, sel_init);
  double v4 = v3;
  if (v3)
  {
    objc_storeStrong(v3 + 2, a2);
    v4[5] = 0;
    if (([a2 _isEmptySection] & 1) == 0)
    {
      double v5 = [a2 group];
      v6 = [v5 size];
      *((unsigned char *)v4 + 9) = [v6 isContainerSize] ^ 1;
    }
    long long v7 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
    *((_OWORD *)v4 + 10) = *MEMORY[0x1E4F1DB20];
    *((_OWORD *)v4 + 11) = v7;
  }
  [v4[2] _checkForDuplicateSupplementaryItemKindsAndThrowIfFound];
  return v4;
}

- (id)auxillaryHostContainer
{
  if (!self || (BOOL v3 = self->_memoizedSupplementaryHostContainer) == 0)
  {
    if ([(NSCollectionLayoutSection *)self->_layoutSection supplementariesFollowContentInsets])
    {
      unint64_t containerLayoutAxis = self->_containerLayoutAxis;
      if (containerLayoutAxis == 1) {
        uint64_t v5 = 2;
      }
      else {
        uint64_t v5 = containerLayoutAxis == 2;
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
      id v16 = [_UICollectionLayoutContainer alloc];
      long long v17 = [(_UICollectionLayoutSectionEstimatedSolver *)self supplementaryContainer];
      [(_UICollectionLayoutContainer *)v17 contentSize];
      memoizedSupplementaryHostContainer = -[_UICollectionLayoutContainer initWithContentSize:contentInsets:](v16, v18, v19, v15, v14, v13, v12);
      objc_storeStrong((id *)&self->_memoizedSupplementaryHostContainer, memoizedSupplementaryHostContainer);
    }
    else
    {
      long long v17 = [(_UICollectionLayoutSectionEstimatedSolver *)self supplementaryContainer];
      memoizedSupplementaryHostContainer = self->_memoizedSupplementaryHostContainer;
      self->_memoizedSupplementaryHostContainer = v17;
    }

    BOOL v3 = self->_memoizedSupplementaryHostContainer;
  }
  return v3;
}

- (CGSize)auxillaryHostContentSize
{
  if (self && self->_solutionState)
  {
    uint64_t v3 = [(_UICollectionLayoutSectionEstimatedSolver *)self layoutAxis];
    double v4 = self->_solutionState;
    uint64_t v5 = v4;
    if (v4) {
      double v4 = (_UICollectionLayoutSolutionState *)v4->_sectionGeometryTranslator;
    }
    double v6 = -[_UICollectionLayoutSectionGeometryTranslator auxillaryHostContentSize]((uint64_t)v4);
    double v8 = v7;

    double v9 = [(_UICollectionLayoutSectionEstimatedSolver *)self layoutSection];
    int v10 = [v9 scrollsOrthogonally];
    uint64_t v11 = v3 == 2;
    if (v3 == 1) {
      uint64_t v11 = 2;
    }
    if (!v10) {
      uint64_t v3 = v11;
    }
    double v12 = [(_UICollectionLayoutSectionEstimatedSolver *)self supplementaryContainer];
    [v12 contentSize];
    double v15 = _UISizeValueForAxis(v3, v13, v14);

    double v16 = _UISetSizeValueForAxis(v3, v6, v8, v15);
    double v18 = v17;
  }
  else
  {
    double v16 = *MEMORY[0x1E4F1DB30];
    double v18 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  double v19 = v16;
  double v20 = v18;
  result.CGFloat height = v20;
  result.CGFloat width = v19;
  return result;
}

- (_UICollectionLayoutContainer)supplementaryContainer
{
  return self->_supplementaryContainer;
}

- (id)resolveWithParameters:(id)a3 preferredSizes:(id)a4
{
  objc_storeStrong((id *)&self->_preferredSizes, a4);
  return [(_UICollectionLayoutSectionEstimatedSolver *)self _solveWithParameters:a3];
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
  -[_UICollectionLayoutSectionEstimatedSolver setOrthogonalScrollingPrefetchingUnitVector:](self, "setOrthogonalScrollingPrefetchingUnitVector:", v14, v9);
  self->_orthogonalOffset.double x = v6;
  self->_orthogonalOffset.double y = v8;
}

- (id)sectionSupplementaryFrameWithKind:(id)a3 index:(int64_t)a4
{
  if ([a3 length])
  {
    if ((a4 & 0x8000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_9:
    BOOL v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"_UICollectionLayoutSectionEstimatedSolver.m", 324, @"Invalid parameter not satisfying: %@", @"index>=0" object file lineNumber description];

    if (self) {
      goto LABEL_4;
    }
    goto LABEL_10;
  }
  BOOL v12 = [MEMORY[0x1E4F28B00] currentHandler];
  [v12 handleFailureInMethod:a2, self, @"_UICollectionLayoutSectionEstimatedSolver.m", 323, @"Invalid parameter not satisfying: %@", @"kind.length" object file lineNumber description];

  if (a4 < 0) {
    goto LABEL_9;
  }
LABEL_3:
  if (self)
  {
LABEL_4:
    sectionSupplementarySolution = self->_sectionSupplementarySolution;
    goto LABEL_5;
  }
LABEL_10:
  sectionSupplementarySolution = 0;
LABEL_5:
  double v9 = *MEMORY[0x1E4F1DAD8];
  double v10 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  return [(_UICollectionLayoutAuxillaryItemSolver *)(id *)&sectionSupplementarySolution->super.isa supplementaryFrameWithKind:a4 index:v9 additionalFrameOffset:v10];
}

- (id)supplementaryFrameWithKind:(id)a3 index:(int64_t)a4
{
  if (!self || !self->_solutionState)
  {
    BOOL v12 = 0;
    goto LABEL_27;
  }
  if (![a3 length])
  {
    v33 = [MEMORY[0x1E4F28B00] currentHandler];
    [v33 handleFailureInMethod:a2, self, @"_UICollectionLayoutSectionEstimatedSolver.m", 253, @"Invalid parameter not satisfying: %@", @"kind.length" object file lineNumber description];

    if ((a4 & 0x8000000000000000) == 0) {
      goto LABEL_5;
    }
LABEL_31:
    v34 = [MEMORY[0x1E4F28B00] currentHandler];
    [v34 handleFailureInMethod:a2, self, @"_UICollectionLayoutSectionEstimatedSolver.m", 254, @"Invalid parameter not satisfying: %@", @"absoluteIndex >= 0" object file lineNumber description];

    goto LABEL_5;
  }
  if (a4 < 0) {
    goto LABEL_31;
  }
LABEL_5:
  solutionState = self->_solutionState;
  if (solutionState) {
    solutionState = (_UICollectionLayoutSolutionState *)solutionState->_sectionGeometryTranslator;
  }
  double v9 = solutionState;
  double v10 = [(_UICollectionLayoutAuxillaryItemSolver *)(id *)&self->_sectionSupplementarySolution->super.isa supplementaryFrameWithKind:a4 index:*MEMORY[0x1E4F1DAD8] additionalFrameOffset:*(double *)(MEMORY[0x1E4F1DAD8] + 8)];
  if (v10)
  {
    uint64_t v11 = v10;
    BOOL v12 = v11;
  }
  else
  {
    BOOL v13 = [(_UICollectionLayoutSectionEstimatedSolver *)self layoutSection];
    double v14 = self->_solutionState;
    if (v14) {
      double v14 = (_UICollectionLayoutSolutionState *)v14->_auxillaryRangeIndexerKindDict;
    }
    double v15 = v14;
    double v16 = self->_solutionState;
    double v17 = v16;
    if (v16) {
      bookmarks = v16->_bookmarks;
    }
    else {
      bookmarks = 0;
    }
    double v19 = bookmarks;

    uint64_t v20 = [(_UICollectionLayoutSolutionState *)v15 objectForKeyedSubscript:a3];
    id v21 = (void *)v20;
    if (v20)
    {
      double v22 = *(_UIOrderedRangeIndexerImpl **)(v20 + 8);
      v36[0] = 0;
      v36[1] = 0;
      uint64_t v37 = 0;
      _UIOrderedRangeIndexerImpl::binarySearchForLocation(v22, a4, (uint64_t)v36);
      uint64_t v11 = 0;
      BOOL v12 = 0;
      if (v37 != 0x7FFFFFFFFFFFFFFFLL)
      {
        long long v35 = v13;
        uint64_t v23 = -[NSArray objectAtIndexedSubscript:](v19, "objectAtIndexedSubscript:");
        CGFloat v24 = (void *)v23;
        double v25 = 0.0;
        if (v23)
        {
          double v26 = *(double *)(v23 + 40);
          double v27 = *(double *)(v23 + 48);
          id v28 = *(id *)(v23 + 8);
          uint64_t v23 = v24[2];
        }
        else
        {
          id v28 = 0;
          double v26 = 0.0;
          double v27 = 0.0;
        }
        uint64_t v29 = a4 - [(id)v23 offsetForElementKind:a3];
        double v30 = 0.0;
        if (v9)
        {
          double v30 = v9[9];
          double v25 = v9[10];
        }
        float64x2_t v31 = [(_UICollectionLayoutItemSolver *)v28 supplementaryFrameWithKind:v29 index:v26 + v30 additionalFrameOffset:v27 + v25];
        uint64_t v11 = v31;
        if (v31) {
          BOOL v12 = -[_UICollectionLayoutFramesQueryResult copyWithIndex:](v31, (void *)a4);
        }
        else {
          BOOL v12 = 0;
        }

        BOOL v13 = v35;
      }
    }
    else
    {
      uint64_t v11 = 0;
      BOOL v12 = 0;
    }
  }
LABEL_27:
  return v12;
}

- (id)auxillaryHostAuxillaryItems
{
  v2 = [(_UICollectionLayoutSectionEstimatedSolver *)self layoutSection];
  uint64_t v3 = [v2 boundarySupplementaryItems];

  return v3;
}

- (CGPoint)orthogonalOffset
{
  double x = self->_orthogonalOffset.x;
  double y = self->_orthogonalOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGRect)primaryContentFrame
{
  if (self)
  {
    v2 = self->_solutionState;
    uint64_t v3 = v2;
    if (v2)
    {
      uint64_t sectionGeometryTranslator = v2->_sectionGeometryTranslator;
      goto LABEL_4;
    }
  }
  else
  {
    uint64_t v3 = 0;
  }
  uint64_t sectionGeometryTranslator = 0;
LABEL_4:
  uint64_t v5 = sectionGeometryTranslator;

  p_double x = (double *)MEMORY[0x1E4F1DB28];
  p_double y = (double *)(MEMORY[0x1E4F1DB28] + 8);
  p_CGFloat width = (double *)(MEMORY[0x1E4F1DB28] + 16);
  p_CGFloat height = (double *)(MEMORY[0x1E4F1DB28] + 24);
  if (v5)
  {
    p_CGFloat height = &v5->_primaryContentFrame.size.height;
    p_CGFloat width = &v5->_primaryContentFrame.size.width;
    p_double y = &v5->_primaryContentFrame.origin.y;
    p_double x = &v5->_primaryContentFrame.origin.x;
  }
  double v10 = *p_x;
  double v11 = *p_y;
  double v12 = *p_width;
  double v13 = *p_height;

  double v14 = v10;
  double v15 = v11;
  double v16 = v12;
  double v17 = v13;
  result.size.CGFloat height = v17;
  result.size.CGFloat width = v16;
  result.origin.double y = v15;
  result.origin.double x = v14;
  return result;
}

- (CGVector)orthogonalScrollingPrefetchingUnitVector
{
  ddouble x = self->_orthogonalScrollingPrefetchingUnitVector.dx;
  ddouble y = self->_orthogonalScrollingPrefetchingUnitVector.dy;
  result.ddouble y = dy;
  result.ddouble x = dx;
  return result;
}

- (double)_dimensionForRootGroupAlongAxis:(unint64_t)a3
{
  uint64_t v5 = [(_UICollectionLayoutSectionEstimatedSolver *)self _sectionContainer];
  double v6 = [(_UICollectionLayoutSectionEstimatedSolver *)self traitCollection];
  [v6 displayScale];
  double v8 = v7;

  double v9 = [(_UICollectionLayoutSectionEstimatedSolver *)self layoutSection];
  double v10 = [v9 group];
  double v11 = [v10 size];
  [v11 _effectiveSizeForContainer:v5 displayScale:0 ignoringInsets:v8];
  double v13 = v12;
  double v15 = v14;

  double v16 = _UISizeValueForAxis(a3, v13, v15);
  return v16;
}

- (double)auxillaryHostPaddingBeforeBoundarySupplementaries
{
  v2 = [(_UICollectionLayoutSectionEstimatedSolver *)self layoutSection];
  double v3 = 0.0;
  if (objc_opt_respondsToSelector())
  {
    [v2 _paddingToBoundarySupplementaries];
    double v3 = v4;
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supplementaryContainer, 0);
  objc_storeStrong((id *)&self->_solutionState, 0);
  objc_storeStrong((id *)&self->_memoizedSupplementaryHostContainer, 0);
  objc_storeStrong((id *)&self->_sectionSupplementaryEnroller, 0);
  objc_storeStrong((id *)&self->_sectionSupplementarySolution, 0);
  objc_storeStrong((id *)&self->_errorDescription, 0);
  objc_storeStrong((id *)&self->_preferredSizes, 0);
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_layoutSection, 0);
}

- (id)_solveWithParameters:(id)a3
{
  uint64_t v310 = *MEMORY[0x1E4F143B8];
  v186 = objc_alloc_init(_UICollectionLayoutSolveResult);
  v195 = self;
  double v4 = [(_UICollectionLayoutSectionEstimatedSolver *)self layoutSection];
  char v5 = [v4 _isEmptySection];

  if (v5) {
    goto LABEL_162;
  }
  uint64_t layoutAxis = v195->_layoutAxis;
  [(_UICollectionLayoutContainer *)v195->_container contentSize];
  v191 = [(_UICollectionLayoutSectionEstimatedSolver *)v195 _sectionContainer];
  v168 = v195->_preferredSizes;
  v169 = [(NSCollectionLayoutSection *)v195->_layoutSection group];
  v162 = [v169 layoutSize];
  uint64_t v6 = [v162 _axesUniformAcrossSiblings];
  if (v6) {
    int v179 = [v169 containsEstimatedSizeItem];
  }
  else {
    int v179 = 0;
  }
  v301[0] = 0;
  v301[1] = v301;
  v301[2] = 0x2020000000;
  v301[3] = 0;
  v300[0] = 0;
  v300[1] = v300;
  v300[2] = 0x2020000000;
  v300[3] = 0x7FFFFFFFFFFFFFFFLL;
  v299[0] = 0;
  v299[1] = v299;
  v299[2] = 0x2020000000;
  v299[3] = 0x7FFFFFFFFFFFFFFFLL;
  v297[0] = 0;
  v297[1] = v297;
  v297[2] = 0x2020000000;
  char v298 = 0;
  location = (id *)&v195->_solutionState;
  double v7 = v195->_solutionState;
  if (v7)
  {
    double v8 = v7;
    if (v6)
    {
      double v9 = v7->_bookmarks;
      uint64_t v183 = [(NSArray *)v9 count];

      uint64_t v10 = 0;
LABEL_9:
      double v12 = -[_UICollectionPreferredSizes largestItemSize]((uint64_t)v195->_preferredSizes);
      uint64_t v14 = v13;
      double v15 = [v169 subitems];
      uint64_t v16 = [v15 count] == 1;

      goto LABEL_16;
    }
    if (a3 && ([*((id *)a3 + 1) count] || objc_msgSend(*((id *)a3 + 2), "count")))
    {
      uint64_t v10 = [(_UICollectionLayoutSectionEstimatedSolver *)v195 _rangeOfBookmarksAffectedByResolveItems:a3];
      uint64_t v11 = v17;
    }
    else
    {
      uint64_t v11 = 0;
      uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  else
  {
    uint64_t v183 = 0;
    uint64_t v11 = 0;
    uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
    if (v6) {
      goto LABEL_9;
    }
  }
  uint64_t v16 = 0;
  double v12 = *MEMORY[0x1E4F1DB30];
  uint64_t v14 = *(void *)(MEMORY[0x1E4F1DB30] + 8);
  uint64_t v183 = v11;
LABEL_16:
  double v18 = [v169 subitems];
  double v19 = v18;
  if (!v16)
  {
    char v26 = 0;
    goto LABEL_36;
  }
  uint64_t v20 = [v18 objectAtIndexedSubscript:0];
  id v21 = [v20 layoutSize];
  double v22 = [v21 widthDimension];
  int v23 = [v22 isEstimated];
  if (v23
    && ([v21 widthDimension],
        uint64_t v16 = objc_claimAutoreleasedReturnValue(),
        ([(id)v16 isUniformAcrossSiblings] & 1) == 0))
  {

    char v26 = 0;
  }
  else
  {
    CGFloat v24 = [v21 heightDimension];
    if ([v24 isEstimated])
    {
      double v25 = [v21 heightDimension];
      char v189 = [v25 isUniformAcrossSiblings];

      if (v23) {
      if ((v189 & 1) == 0)
      }
      {
        char v26 = 0;
        goto LABEL_35;
      }
    }
    else
    {

      if (v23) {
    }
      }
    uint64_t v27 = [v162 _axesUniformAcrossSiblings];
    double v22 = [v20 auxillaryItems];
    if ([v22 count]) {
      BOOL v28 = 0;
    }
    else {
      BOOL v28 = v27 == v6;
    }
    char v26 = v28;
  }

LABEL_35:
LABEL_36:

  NSUInteger frameCount = v195->_frameCount;
  uint64_t v293 = 0;
  v294 = &v293;
  uint64_t v295 = 0x2020000000;
  uint64_t v296 = 0;
  uint64_t v289 = 0;
  v290 = &v289;
  uint64_t v291 = 0x2020000000;
  NSUInteger v163 = frameCount;
  NSUInteger v292 = frameCount;
  uint64_t v283 = 0;
  v284 = &v283;
  uint64_t v285 = 0x3032000000;
  v286 = __Block_byref_object_copy__33;
  v287 = __Block_byref_object_dispose__33;
  id v288 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v281[0] = 0;
  v281[1] = v281;
  v281[2] = 0x3032000000;
  v281[3] = __Block_byref_object_copy__33;
  v281[4] = __Block_byref_object_dispose__33;
  v282 = objc_alloc_init(_UICollectionLayoutAuxillaryOffsets);
  v279[0] = 0;
  v279[1] = v279;
  v279[2] = 0x3032000000;
  v279[3] = __Block_byref_object_copy__33;
  v279[4] = __Block_byref_object_dispose__33;
  id v280 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __66___UICollectionLayoutSectionEstimatedSolver__solveWithParameters___block_invoke;
  aBlock[3] = &unk_1E52E1500;
  v277 = v279;
  aBlock[4] = v195;
  id v30 = v191;
  id v276 = v30;
  uint64_t v278 = layoutAxis;
  float64x2_t v31 = _Block_copy(aBlock);
  v270[0] = MEMORY[0x1E4F143A8];
  v270[1] = 3221225472;
  v270[2] = __66___UICollectionLayoutSectionEstimatedSolver__solveWithParameters___block_invoke_2;
  v270[3] = &unk_1E52E1528;
  char v274 = v26;
  id v32 = v31;
  v272 = v281;
  v273 = &v293;
  v270[4] = v195;
  v270[5] = v168;
  id v271 = v32;
  v270[6] = a3;
  v33 = _Block_copy(v270);
  v263[0] = MEMORY[0x1E4F143A8];
  v263[1] = 3221225472;
  v263[2] = __66___UICollectionLayoutSectionEstimatedSolver__solveWithParameters___block_invoke_3;
  v263[3] = &unk_1E52E1550;
  v263[4] = v195;
  v263[5] = v168;
  v265 = &v293;
  v266 = v281;
  id v34 = v30;
  id v264 = v34;
  uint64_t v267 = layoutAxis;
  double v268 = v12;
  uint64_t v269 = v14;
  v165 = (void (**)(void))_Block_copy(v263);
  v262[0] = MEMORY[0x1E4F143A8];
  v262[1] = 3221225472;
  v262[2] = __66___UICollectionLayoutSectionEstimatedSolver__solveWithParameters___block_invoke_4;
  v262[3] = &unk_1E52E1578;
  v262[5] = v299;
  v262[4] = v195;
  v164 = (void (**)(void))_Block_copy(v262);
  v260[0] = MEMORY[0x1E4F143A8];
  v260[1] = 3221225472;
  v260[2] = __66___UICollectionLayoutSectionEstimatedSolver__solveWithParameters___block_invoke_5;
  v260[3] = &unk_1E52E15A0;
  id v158 = v32;
  id v261 = v158;
  v166 = (void (**)(void))_Block_copy(v260);
  v248[0] = MEMORY[0x1E4F143A8];
  v248[1] = 3221225472;
  v248[2] = __66___UICollectionLayoutSectionEstimatedSolver__solveWithParameters___block_invoke_6;
  v248[3] = &unk_1E52E15C8;
  uint64_t v255 = v10;
  uint64_t v256 = v183;
  v250 = v301;
  v251 = v300;
  v248[4] = v195;
  v248[5] = v168;
  v252 = &v293;
  v253 = v281;
  uint64_t v257 = layoutAxis;
  double v258 = v12;
  uint64_t v259 = v14;
  id v156 = v34;
  id v249 = v156;
  v254 = v297;
  v167 = (void (**)(void))_Block_copy(v248);
  v247[0] = MEMORY[0x1E4F143A8];
  v247[1] = 3221225472;
  v247[2] = __66___UICollectionLayoutSectionEstimatedSolver__solveWithParameters___block_invoke_7;
  v247[3] = &unk_1E52E15F0;
  v247[5] = &v289;
  v247[4] = v195;
  v247[6] = v281;
  v247[7] = &v293;
  v247[8] = &v283;
  long long v35 = _Block_copy(v247);
  long long v228 = xmmword_186B93BD0;
  uint64_t v229 = 1;
  long long v245 = 0u;
  long long v230 = 0u;
  long long v231 = 0u;
  long long v232 = 0u;
  long long v233 = 0u;
  long long v234 = 0u;
  long long v235 = 0u;
  long long v236 = 0u;
  long long v237 = 0u;
  long long v238 = 0u;
  long long v239 = 0u;
  long long v240 = 0u;
  long long v241 = 0u;
  long long v242 = 0u;
  long long v243 = 0u;
  long long v244 = 0u;
  uint64_t v246 = 0;
  v227[0] = MEMORY[0x1E4F143A8];
  v227[1] = 3221225472;
  v227[2] = __66___UICollectionLayoutSectionEstimatedSolver__solveWithParameters___block_invoke_8;
  v227[3] = &unk_1E52E1618;
  v227[5] = v163;
  v227[4] = a3;
  v227[6] = v10;
  v227[7] = v183;
  *((void *)&v233 + 1) = _Block_copy(v227);
  v224[0] = MEMORY[0x1E4F143A8];
  v224[1] = 3221225472;
  v224[2] = __66___UICollectionLayoutSectionEstimatedSolver__solveWithParameters___block_invoke_9;
  v224[3] = &unk_1E52E1640;
  v226 = &v289;
  id v36 = v33;
  id v225 = v36;
  *((void *)&v235 + 1) = _Block_copy(v224);
  v220[0] = MEMORY[0x1E4F143A8];
  v220[1] = 3221225472;
  v220[2] = __66___UICollectionLayoutSectionEstimatedSolver__solveWithParameters___block_invoke_10;
  v220[3] = &unk_1E52E1668;
  uint64_t v223 = v183;
  uint64_t v222 = v10;
  v220[4] = v195;
  id v170 = v35;
  id v221 = v170;
  *((void *)&v236 + 1) = _Block_copy(v220);
  v211[0] = MEMORY[0x1E4F143A8];
  v211[1] = 3221225472;
  v211[2] = __66___UICollectionLayoutSectionEstimatedSolver__solveWithParameters___block_invoke_11;
  v211[3] = &unk_1E52E1690;
  v213 = &v289;
  v214 = v301;
  uint64_t v219 = v183;
  uint64_t v218 = v10;
  v215 = v297;
  id v37 = v36;
  id v212 = v37;
  v211[4] = v195;
  v216 = v300;
  v217 = v299;
  *((void *)&v237 + 1) = _Block_copy(v211);
  v210[0] = MEMORY[0x1E4F143A8];
  v210[1] = 3221225472;
  v210[2] = __66___UICollectionLayoutSectionEstimatedSolver__solveWithParameters___block_invoke_12;
  v210[3] = &unk_1E52E16B8;
  v210[6] = v299;
  v210[5] = &v289;
  v210[4] = v195;
  *((void *)&v239 + 1) = _Block_copy(v210);
  v207[0] = MEMORY[0x1E4F143A8];
  v207[1] = 3221225472;
  v207[2] = __66___UICollectionLayoutSectionEstimatedSolver__solveWithParameters___block_invoke_13;
  v207[3] = &unk_1E52E1640;
  v209 = &v289;
  id v157 = v37;
  id v208 = v157;
  uint64_t v38 = 1;
  *((void *)&v241 + 1) = _Block_copy(v207);
  uint64_t v206 = 1;
  while (2)
  {
    handleEvent(&v228, v38, 0, 0, &v206);
    uint64_t v38 = v206;
    switch(v206)
    {
      case 2:
        float64_t v39 = v165[2]();
        (*((void (**)(id, void *))v170 + 2))(v170, v39);
        goto LABEL_44;
      case 3:
        float64_t v39 = v167[2]();
        (*((void (**)(id, void *))v170 + 2))(v170, v39);
        goto LABEL_44;
      case 4:
        float64_t v39 = v164[2]();
        (*((void (**)(id, void *))v170 + 2))(v170, v39);
        goto LABEL_44;
      case 5:
        float64_t v39 = v166[2]();
        (*((void (**)(id, void *))v170 + 2))(v170, v39);
        goto LABEL_44;
      case 6:
        goto LABEL_45;
      case 7:
        CGRect v40 = [MEMORY[0x1E4F28B00] currentHandler];
        [v40 handleFailureInMethod:a2 object:v195 file:@"_UICollectionLayoutSectionEstimatedSolver.m" lineNumber:783 description:@"Estimated section solver state machine failure. Please file a radar on UICollectionView."];

        goto LABEL_43;
      default:
LABEL_43:
        id v41 = [MEMORY[0x1E4F28B00] currentHandler];
        [v41 handleFailureInMethod:a2 object:v195 file:@"_UICollectionLayoutSectionEstimatedSolver.m" lineNumber:813 description:@"Unexpected state while performing resolve."];

        float64_t v39 = 0;
LABEL_44:

        if (v38 != 6) {
          continue;
        }
LABEL_45:
        v155 = [(_UICollectionLayoutSectionEstimatedSolver *)v195 layoutSection];
        [v155 interGroupSpacing];
        double v43 = *MEMORY[0x1E4F1DAD8];
        double v42 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
        double v45 = _UISetPointValueForAxis(layoutAxis, *MEMORY[0x1E4F1DAD8], v42, v44);
        double v175 = v46;
        double v176 = v45;
        v182 = objc_alloc_init(_UIRTree);
        v188 = objc_alloc_init(_UIOrderedRangeIndexer);
        float64_t v47 = objc_alloc_init(_UIOrderedRangeIndexer);
        v180 = objc_alloc_init(_UICollectionLayoutAuxillaryOffsets);
        id v181 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        v294[3] = 0;
        v290[3] = v163;
        id v48 = objc_alloc(MEMORY[0x1E4F1CA48]);
        id v190 = (id)objc_msgSend(v48, "initWithCapacity:", objc_msgSend((id)v284[5], "count"));
        v195->_containerSizeDependentAxes = 0;
        long long v204 = 0u;
        long long v205 = 0u;
        long long v202 = 0u;
        long long v203 = 0u;
        obuint64_t j = (id)v284[5];
        uint64_t v49 = [obj countByEnumeratingWithState:&v202 objects:v308 count:16];
        *(void *)v187 = *MEMORY[0x1E4F1DB28];
        *(void *)&v187[8] = *(void *)(MEMORY[0x1E4F1DB28] + 8);
        *(void *)&v187[16] = *(void *)(MEMORY[0x1E4F1DB28] + 16);
        *(void *)&v187[24] = *(void *)(MEMORY[0x1E4F1DB28] + 24);
        double v159 = v42;
        double v160 = v43;
        if (v49)
        {
          uint64_t v177 = v49;
          CGFloat v50 = 0;
          uint64_t v178 = *(void *)v203;
          uint64_t v51 = 2;
          if (layoutAxis != 1) {
            uint64_t v51 = layoutAxis == 2;
          }
          uint64_t v174 = v51;
          int64_t v52 = &selRef__queryFramesWithQueryRect_additionalFrameOffset_itemIndexOffset_itemLimit_supplementaryRepeatOffset_;
          double v172 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
          double v173 = *MEMORY[0x1E4F1DB30];
          do
          {
            uint64_t v192 = 0;
            v194 = v50;
            v154 = v52[6];
            do
            {
              if (*(void *)v203 != v178) {
                objc_enumerationMutation(obj);
              }
              if (v290[3] < 1)
              {
                CGFloat v50 = v194;
                goto LABEL_130;
              }
              uint64_t v53 = *(void *)(*((void *)&v202 + 1) + 8 * v192);
              if (v194) {
                double v54 = v176;
              }
              else {
                double v54 = -0.0;
              }
              if (v194) {
                double v55 = v175;
              }
              else {
                double v55 = -0.0;
              }
              -[_UICollectionLayoutItemSolver layoutFrame](*(void *)(*((void *)&v202 + 1) + 8 * v192));
              double v57 = v56;
              double v59 = v58;
              double v60 = -[_UICollectionLayoutItemSolver offsetForEdgeSpacing](v53);
              double v62 = _UIPointValueForAxis(v174, v60, v61);
              double v63 = _UISetSizeValueForAxis(v174, v173, v172, v62);
              double v65 = v64;
              v66 = -[_UICollectionLayoutItemSolver supplementaryOffsets]((void **)v53);
              v197 = [v66 offsetsByApplyingOffsets:v180];
              -[_UICollectionLayoutAuxillaryOffsets incrementCountsFromOffsets:]((id *)&v180->super.isa, v66);
              v185 = v66;
              v67 = [_UICollectionEstimatedSolutionBookmark alloc];
              double v68 = v43 + v54;
              double v69 = v42 + v55;
              if (v67)
              {
                NSUInteger v70 = v294[3];
                uint64_t v71 = v290[3];
                if (!v53)
                {
                  v107 = [MEMORY[0x1E4F28B00] currentHandler];
                  [v107 handleFailureInMethod:v154, v67, @"_UICollectionLayoutSectionEstimatedSolver.m", 1246, @"Invalid parameter not satisfying: %@", @"solution" object file lineNumber description];
                }
                if (v71 <= 0)
                {
                  v108 = [MEMORY[0x1E4F28B00] currentHandler];
                  [v108 handleFailureInMethod:v154, v67, @"_UICollectionLayoutSectionEstimatedSolver.m", 1247, @"Invalid parameter not satisfying: %@", @"maxItemFrameCount > 0" object file lineNumber description];
                }
                if (!v197)
                {
                  v109 = [MEMORY[0x1E4F28B00] currentHandler];
                  [v109 handleFailureInMethod:v154, v67, @"_UICollectionLayoutSectionEstimatedSolver.m", 1248, @"Invalid parameter not satisfying: %@", @"supplementaryOffsets" object file lineNumber description];
                }
                if (v53 && (uint64_t v72 = *(void *)(v53 + 48)) != 0) {
                  uint64_t v73 = *(void *)(v72 + 56);
                }
                else {
                  uint64_t v73 = 0;
                }
                v302.receiver = v67;
                v302.super_class = (Class)_UICollectionEstimatedSolutionBookmark;
                id v74 = [(_UICollectionLayoutSectionEstimatedSolver *)&v302 init];
                v67 = (_UICollectionEstimatedSolutionBookmark *)v74;
                if (v74)
                {
                  if (v73 < v71) {
                    uint64_t v71 = v73;
                  }
                  objc_storeStrong((id *)v74 + 1, (id)v53);
                  v67->_solutionFrame.origin.double x = v68;
                  v67->_solutionFrame.origin.double y = v69;
                  v67->_solutionFrame.size.CGFloat width = v57;
                  v67->_solutionFrame.size.CGFloat height = v59;
                  v67->_itemRange.location = v70;
                  v67->_itemRange.NSUInteger length = v71;
                  if (v53 && (uint64_t v75 = *(void *)(v53 + 48)) != 0 && (unint64_t)v71 < *(void *)(v75 + 56))
                  {
                    v76 = objc_alloc_init(_UICollectionLayoutAuxillaryOffsets);
                    v77 = -[_UICollectionLayoutItemSolver queryFramesWithItemLimit:]((void *)v53, v71);
                    long long v306 = 0u;
                    long long v305 = 0u;
                    long long v304 = 0u;
                    long long v303 = 0u;
                    uint64_t v78 = [v77 countByEnumeratingWithState:&v303 objects:&v309 count:16];
                    if (v78)
                    {
                      uint64_t v79 = *(void *)v304;
                      do
                      {
                        for (uint64_t i = 0; i != v78; ++i)
                        {
                          if (*(void *)v304 != v79) {
                            objc_enumerationMutation(v77);
                          }
                          v81 = *(void **)(*((void *)&v303 + 1) + 8 * i);
                          if (v81 && (v81[4] & 0xFFFFFFFFFFFFFFFELL) == 2)
                          {
                            v82 = -[_UICollectionLayoutFramesQueryResult auxillaryItem](v81);
                            v83 = [v82 elementKind];
                            -[_UICollectionLayoutAuxillaryOffsets incrementCountForElementKind:]((uint64_t)v76, v83);
                          }
                        }
                        uint64_t v78 = [v77 countByEnumeratingWithState:&v303 objects:&v309 count:16];
                      }
                      while (v78);
                    }
                    v84 = [(_UICollectionLayoutAuxillaryOffsets *)v76 offsetsByRebasingOnOffsets:v197];
                  }
                  else
                  {
                    v84 = v197;
                  }
                  supplementaryOffsets = v67->_supplementaryOffsets;
                  v67->_supplementaryOffsets = v84;
                }
              }
              if (v53) {
                uint64_t v86 = *(void *)(v53 + 40);
              }
              else {
                uint64_t v86 = 0;
              }
              v195->_containerSizeDependentAxes |= v86;
              uint64_t v87 = [v190 count];
              [v190 addObject:v67];
              double v88 = v57 + v63;
              double v89 = v59 + v65;
              -[_UIRTree insertFrame:forIndex:](v182, v87, v68, v69, v88, v89);
              if (v67)
              {
                _NSRange itemRange = v67->_itemRange;
              }
              else
              {
                itemRange.NSUInteger length = 0;
                itemRange.location = 0;
              }
              if (v188) {
                _UIOrderedRangeIndexerImpl::appendRange(v188->_orderedRangeIndexerImpl.__ptr_, itemRange);
              }
              if ((v179 & 1) == 0)
              {
                long long v200 = 0u;
                long long v201 = 0u;
                long long v198 = 0u;
                long long v199 = 0u;
                v91 = -[_UICollectionLayoutItemSolver preferredSizeGroupingRanges]((void *)v53);
                uint64_t v92 = [v91 countByEnumeratingWithState:&v198 objects:v307 count:16];
                if (v92)
                {
                  uint64_t v93 = *(void *)v199;
                  do
                  {
                    for (uint64_t j = 0; j != v92; ++j)
                    {
                      if (*(void *)v199 != v93) {
                        objc_enumerationMutation(v91);
                      }
                      uint64_t v95 = [*(id *)(*((void *)&v198 + 1) + 8 * j) rangeValue];
                      if (v47)
                      {
                        v312.NSUInteger length = v96;
                        v312.location = v294[3] + v95;
                        _UIOrderedRangeIndexerImpl::appendRange(v47->_orderedRangeIndexerImpl.__ptr_, v312);
                      }
                    }
                    uint64_t v92 = [v91 countByEnumeratingWithState:&v198 objects:v307 count:16];
                  }
                  while (v92);
                }
              }
              [(_UICollectionLayoutSectionEstimatedSolver *)v195 _updateSolutionAuxillaryRangeIndexerKindDict:v181 fromBookmark:v67];
              if (v183)
              {
                if (v67)
                {
                  NSUInteger v97 = v67->_itemRange.location;
                  NSUInteger length = v67->_itemRange.length;
                }
                else
                {
                  NSUInteger length = 0;
                  NSUInteger v97 = 0;
                }
                if (v186) {
                  -[NSMutableIndexSet addIndexesInRange:](v186->_invalidatedIndexes, "addIndexesInRange:", v97, length);
                }
                if (v67) {
                  v99 = v67->_supplementaryOffsets;
                }
                else {
                  v99 = 0;
                }
                v100 = v99;
                -[_UICollectionLayoutSolveResult addInvalidatedSupplementariesWithOffsets:]((uint64_t)v186, v100);
              }
              CGFloat v50 = v67;

              v317.origin.double x = v68;
              v317.origin.double y = v69;
              v317.size.CGFloat width = v88;
              v317.size.CGFloat height = v89;
              *(CGRect *)v187 = CGRectUnion(*(CGRect *)v187, v317);
              v314.origin.double x = v68;
              v314.origin.double y = v69;
              v314.size.CGFloat width = v88;
              v314.size.CGFloat height = v89;
              double MaxX = CGRectGetMaxX(v314);
              v315.origin.double x = v68;
              v315.origin.double y = v69;
              v315.size.CGFloat width = v88;
              v315.size.CGFloat height = v89;
              double MaxY = CGRectGetMaxY(v315);
              double v103 = _UIPointValueForAxis(layoutAxis, MaxX, MaxY);
              double v43 = _UISetPointValueForAxis(layoutAxis, v43, v42, v103);
              double v42 = v104;
              if (v53)
              {
                uint64_t v105 = *(void *)(v53 + 48);
                if (v105) {
                  uint64_t v105 = *(void *)(v105 + 56);
                }
                v294[3] += v105;
                uint64_t v106 = *(void *)(v53 + 48);
                if (v106) {
                  uint64_t v106 = *(void *)(v106 + 56);
                }
              }
              else
              {
                uint64_t v106 = 0;
              }
              v290[3] = (v290[3] - v106) & ~((v290[3] - v106) >> 63);

              ++v192;
              v194 = v50;
            }
            while (v192 != v177);
            uint64_t v110 = [obj countByEnumeratingWithState:&v202 objects:v308 count:16];
            uint64_t v177 = v110;
            int64_t v52 = &selRef__queryFramesWithQueryRect_additionalFrameOffset_itemIndexOffset_itemLimit_supplementaryRepeatOffset_;
          }
          while (v110);
        }
        else
        {
          CGFloat v50 = 0;
        }
LABEL_130:

        -[_UICollectionLayoutSectionEstimatedSolver _adjustContentFrameForLastPartialSolutionIfNeededForContentFrame:bookmarks:](v195, "_adjustContentFrameForLastPartialSolutionIfNeededForContentFrame:bookmarks:", v190, *(double *)v187, *(double *)&v187[8], *(double *)&v187[16], *(double *)&v187[24]);
        CGFloat v112 = v111;
        CGFloat v114 = v113;
        double v116 = v115;
        double v118 = v117;
        uint64_t containerLayoutAxis = v195->_containerLayoutAxis;
        v120 = [_UICollectionLayoutSectionGeometryTranslator alloc];
        BOOL layoutRTL = v195->_layoutRTL;
        [(NSCollectionLayoutSection *)v195->_layoutSection contentInsets];
        v126 = -[_UICollectionLayoutSectionGeometryTranslator initWithPrimaryContentSize:sectionAuxiliarySolutionSize:layoutAxis:layoutRTL:sectionInsets:contentFrameSupplementaryOffset:](v120, containerLayoutAxis, layoutRTL, v116, v118, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8), v122, v123, v124, v125, v160, v159);
        int v127 = v179;
        if (!v47) {
          int v127 = 0;
        }
        if (v127 == 1)
        {
          v313.location = 0;
          v313.NSUInteger length = v163;
          _UIOrderedRangeIndexerImpl::appendRange(v47->_orderedRangeIndexerImpl.__ptr_, v313);
        }
        v128 = [_UICollectionLayoutSolutionState alloc];
        if (v128)
        {
          if (!v190)
          {
            v150 = [MEMORY[0x1E4F28B00] currentHandler];
            [v150 handleFailureInMethod:sel_initWithGeometryTranslator_bookmarks_geometricIndexer_itemRangeIndexer_preferredSizeGroupingIndexer_auxillaryRangeIndexerDict_, v128, @"_UICollectionLayoutSectionEstimatedSolver.m", 1302, @"Invalid parameter not satisfying: %@", @"bookmarks" object file lineNumber description];
          }
          if (!v182)
          {
            v151 = [MEMORY[0x1E4F28B00] currentHandler];
            [v151 handleFailureInMethod:sel_initWithGeometryTranslator_bookmarks_geometricIndexer_itemRangeIndexer_preferredSizeGroupingIndexer_auxillaryRangeIndexerDict_, v128, @"_UICollectionLayoutSectionEstimatedSolver.m", 1303, @"Invalid parameter not satisfying: %@", @"geometricIndexer" object file lineNumber description];
          }
          if (!v188)
          {
            v152 = [MEMORY[0x1E4F28B00] currentHandler];
            [v152 handleFailureInMethod:sel_initWithGeometryTranslator_bookmarks_geometricIndexer_itemRangeIndexer_preferredSizeGroupingIndexer_auxillaryRangeIndexerDict_, v128, @"_UICollectionLayoutSectionEstimatedSolver.m", 1304, @"Invalid parameter not satisfying: %@", @"itemRangeIndexer" object file lineNumber description];
          }
          if (!v181)
          {
            v153 = [MEMORY[0x1E4F28B00] currentHandler];
            [v153 handleFailureInMethod:sel_initWithGeometryTranslator_bookmarks_geometricIndexer_itemRangeIndexer_preferredSizeGroupingIndexer_auxillaryRangeIndexerDict_, v128, @"_UICollectionLayoutSectionEstimatedSolver.m", 1305, @"Invalid parameter not satisfying: %@", @"auxillaryRangeIndexerDict" object file lineNumber description];
          }
          v309.receiver = v128;
          v309.super_class = (Class)_UICollectionLayoutSolutionState;
          v129 = [(_UICollectionLayoutSectionEstimatedSolver *)&v309 init];
          v128 = (_UICollectionLayoutSolutionState *)v129;
          if (v129)
          {
            objc_storeStrong((id *)&v129->_layoutSection, v190);
            objc_storeStrong((id *)&v128->_geometricIndexer, v182);
            objc_storeStrong((id *)&v128->_itemRangeIndexer, v188);
            objc_storeStrong((id *)&v128->_preferredSizeGroupingIndexer, v47);
            objc_storeStrong((id *)&v128->_auxillaryRangeIndexerKindDict, v181);
            objc_storeStrong((id *)&v128->_sectionGeometryTranslator, v126);
          }
        }
        objc_storeStrong(location, v128);
        v316.origin.double x = v112;
        v316.origin.double y = v114;
        v316.size.CGFloat width = v116;
        v316.size.CGFloat height = v118;
        IsEmptdouble y = CGRectIsEmpty(v316);
        v131 = objc_alloc_init(_UICollectionLayoutSupplementaryEnroller);
        objc_storeStrong((id *)&v195->_sectionSupplementaryEnroller, v131);

        uint64_t v132 = -[_UICollectionLayoutAuxillaryItemSolver initWithAuxillaryHost:]([_UICollectionLayoutAuxillaryItemSolver alloc], v195);
        v133 = (double *)v132;
        if (v132)
        {
          v195->_containerSizeDependentAxes |= *(void *)(v132 + 56);
          if (*(double *)(v132 + 144) == 0.0
            && *(double *)(v132 + 160) == 0.0
            && *(double *)(v132 + 152) == 0.0
            && *(double *)(v132 + 168) == 0.0
            && !IsEmpty)
          {
            goto LABEL_159;
          }
          double v136 = *(double *)(v132 + 112);
          double v135 = *(double *)(v132 + 120);
        }
        else
        {
          double v135 = 0.0;
          double v136 = 0.0;
          if (!IsEmpty) {
            goto LABEL_159;
          }
        }
        v137 = [_UICollectionLayoutSectionGeometryTranslator alloc];
        BOOL v138 = v195->_layoutRTL;
        [(NSCollectionLayoutSection *)v195->_layoutSection contentInsets];
        double v142 = v141;
        double v144 = v143;
        if (v133)
        {
          double v146 = v133[16];
          double v145 = v133[17];
        }
        else
        {
          double v145 = 0.0;
          double v146 = 0.0;
        }
        v147 = -[_UICollectionLayoutSectionGeometryTranslator initWithPrimaryContentSize:sectionAuxiliarySolutionSize:layoutAxis:layoutRTL:sectionInsets:contentFrameSupplementaryOffset:](v137, containerLayoutAxis, v138, v116, v118, v136, v135, v142, v144, v139, v140, v146, v145);
        if (*location) {
          objc_storeStrong((id *)*location + 1, v147);
        }

LABEL_159:
        objc_storeStrong((id *)&v195->_sectionSupplementarySolution, v133);

        for (uint64_t k = 32; k != 288; k += 32)
          __destructor_8_sb0_AB8s24n1_S_sb8_sb16_AE((uint64_t)&v228 + k);

        _Block_object_dispose(v279, 8);
        _Block_object_dispose(v281, 8);

        _Block_object_dispose(&v283, 8);
        _Block_object_dispose(&v289, 8);
        _Block_object_dispose(&v293, 8);
        _Block_object_dispose(v297, 8);
        _Block_object_dispose(v299, 8);
        _Block_object_dispose(v300, 8);
        _Block_object_dispose(v301, 8);

        break;
    }
    break;
  }
LABEL_162:
  return v186;
}

- (void)_updateSolutionAuxillaryRangeIndexerKindDict:(id)a3 fromBookmark:(id)a4
{
  if (a4)
  {
    if (a3) {
      goto LABEL_3;
    }
LABEL_7:
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"_UICollectionLayoutSectionEstimatedSolver.m", 1060, @"Invalid parameter not satisfying: %@", @"solutionAuxillaryRangeIndexerKindDict" object file lineNumber description];

    if (a4) {
      goto LABEL_4;
    }
LABEL_8:
    double v8 = 0;
    goto LABEL_5;
  }
  double v12 = [MEMORY[0x1E4F28B00] currentHandler];
  [v12 handleFailureInMethod:a2, self, @"_UICollectionLayoutSectionEstimatedSolver.m", 1059, @"Invalid parameter not satisfying: %@", @"solutionBookmark" object file lineNumber description];

  if (!a3) {
    goto LABEL_7;
  }
LABEL_3:
  if (!a4) {
    goto LABEL_8;
  }
LABEL_4:
  double v8 = (void *)*((void *)a4 + 2);
LABEL_5:
  id v9 = v8;
  uint64_t v10 = [v9 elementKinds];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __103___UICollectionLayoutSectionEstimatedSolver__updateSolutionAuxillaryRangeIndexerKindDict_fromBookmark___block_invoke;
  v14[3] = &unk_1E52E1708;
  id v15 = v9;
  id v16 = a3;
  id v11 = v9;
  [v10 enumerateObjectsUsingBlock:v14];
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (BOOL)layoutRTL
{
  return self->_layoutRTL;
}

- (id)_sectionContainer
{
  double v4 = [(_UICollectionLayoutSectionEstimatedSolver *)self layoutSection];
  char v5 = [(_UICollectionLayoutSectionEstimatedSolver *)self container];
  [v5 contentInsets];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  if ([(_UICollectionLayoutSectionEstimatedSolver *)self layoutAxis] == 2)
  {
    [v4 contentInsets];
    double v9 = v9 + v14;
    [v4 contentInsets];
    double v13 = v13 + v15;
  }
  else if ([(_UICollectionLayoutSectionEstimatedSolver *)self layoutAxis] == 1)
  {
    [v4 contentInsets];
    double v7 = v7 + v16;
    [v4 contentInsets];
    double v11 = v11 + v17;
  }
  else
  {
    double v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2 object:self file:@"_UICollectionLayoutSectionEstimatedSolver.m" lineNumber:1051 description:@"Unknown layout axis."];
  }
  double v19 = [_UICollectionLayoutContainer alloc];
  uint64_t v20 = [(_UICollectionLayoutSectionEstimatedSolver *)self container];
  [v20 contentSize];
  int v23 = -[_UICollectionLayoutContainer initWithContentSize:contentInsets:](v19, v21, v22, v7, v9, v11, v13);

  return v23;
}

- (_UICollectionLayoutContainer)container
{
  return self->_container;
}

- (CGRect)_adjustContentFrameForLastPartialSolutionIfNeededForContentFrame:(CGRect)a3 bookmarks:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if ([a4 count]
    && [(_UICollectionLayoutSectionEstimatedSolver *)self shouldAdjustContentSizeForPartialLastGroupSolution])
  {
    uint64_t v11 = [a4 lastObject];
    double v12 = (double *)v11;
    if (v11) {
      double v13 = *(void **)(v11 + 8);
    }
    else {
      double v13 = 0;
    }
    double v14 = v13;
    uint64_t v15 = [(_UICollectionLayoutSectionEstimatedSolver *)self layoutAxis];
    if ((unint64_t)(v15 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      id v34 = [MEMORY[0x1E4F28B00] currentHandler];
      [v34 handleFailureInMethod:a2 object:self file:@"_UICollectionLayoutSectionEstimatedSolver.m" lineNumber:1093 description:@"Unknown layout axis."];

      if (v12) {
        goto LABEL_7;
      }
    }
    else if (v12)
    {
LABEL_7:
      uint64_t v16 = *((void *)v12 + 4);
      if (v14)
      {
        uint64_t v17 = v14[6];
        if (v17) {
          uint64_t v17 = *(void *)(v17 + 56);
        }
      }
      else
      {
        uint64_t v17 = 0;
      }
      if (v16 >= v17) {
        goto LABEL_13;
      }
      double v18 = v12[7];
      double v19 = v12[8];
      goto LABEL_12;
    }
    if (!v14) {
      goto LABEL_13;
    }
    uint64_t v35 = v14[6];
    if (!v35 || *(uint64_t *)(v35 + 56) <= 0) {
      goto LABEL_13;
    }
    uint64_t v16 = 0;
    double v18 = 0.0;
    double v19 = 0.0;
LABEL_12:
    double v20 = -[_UICollectionLayoutItemSolver contentSizeForFrameCount:layoutAxis:]((uint64_t)v14, v16, v15);
    double v22 = v21;
    double v23 = _UISizeValueForAxis(v15, v18, v19);
    double v24 = _UISizeValueForAxis(v15, v20, v22) - v23;
    double v25 = _UISizeValueForAxis(v15, width, height);
    double v26 = _UISetSizeValueForAxis(v15, width, height, v25 + v24);
    double v28 = v27;
    v36.origin.CGFloat x = x;
    v36.origin.CGFloat y = y;
    v36.size.double width = width;
    v36.size.double height = height;
    CGFloat MinX = CGRectGetMinX(v36);
    v37.origin.CGFloat x = x;
    v37.origin.CGFloat y = y;
    v37.size.double width = width;
    v37.size.double height = height;
    CGFloat y = CGRectGetMinY(v37);
    double height = v28;
    double width = v26;
    CGFloat x = MinX;
LABEL_13:
  }
  double v30 = x;
  double v31 = y;
  double v32 = width;
  double v33 = height;
  result.size.double height = v33;
  result.size.double width = v32;
  result.origin.CGFloat y = v31;
  result.origin.CGFloat x = v30;
  return result;
}

- (BOOL)shouldAdjustContentSizeForPartialLastGroupSolution
{
  return self->_shouldAdjustContentSizeForPartialLastGroupSolution;
}

- (_NSRange)_rangeOfBookmarksAffectedByResolveItems:(id)a3
{
  if (a3)
  {
    if (self) {
      goto LABEL_3;
    }
LABEL_15:
    double v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"_UICollectionLayoutSectionEstimatedSolver.m", 981, @"Invalid parameter not satisfying: %@", @"self.solutionState" object file lineNumber description];

    goto LABEL_21;
  }
  double v25 = [MEMORY[0x1E4F28B00] currentHandler];
  [v25 handleFailureInMethod:a2, self, @"_UICollectionLayoutSectionEstimatedSolver.m", 980, @"Invalid parameter not satisfying: %@", @"resolveItems" object file lineNumber description];

  if (!self) {
    goto LABEL_15;
  }
LABEL_3:
  p_solutionState = &self->_solutionState;
  solutionState = self->_solutionState;
  if (solutionState)
  {
LABEL_4:
    solutionState = (_UICollectionLayoutSolutionState *)solutionState->_itemRangeIndexer;
    goto LABEL_5;
  }
  uint64_t v29 = [MEMORY[0x1E4F28B00] currentHandler];
  [v29 handleFailureInMethod:a2, self, @"_UICollectionLayoutSectionEstimatedSolver.m", 981, @"Invalid parameter not satisfying: %@", @"self.solutionState" object file lineNumber description];

  if (!self)
  {
LABEL_21:
    double v10 = 0;
    double v8 = 0;
    goto LABEL_22;
  }
  p_solutionState = &self->_solutionState;
  solutionState = self->_solutionState;
  if (solutionState) {
    goto LABEL_4;
  }
LABEL_5:
  double v8 = solutionState;
  double v9 = *p_solutionState;
  double v10 = v9;
  if (v9)
  {
    auxillaryRangeIndexerKindDict = v9->_auxillaryRangeIndexerKindDict;
    goto LABEL_7;
  }
LABEL_22:
  auxillaryRangeIndexerKindDict = 0;
LABEL_7:
  double v12 = auxillaryRangeIndexerKindDict;

  if (!v8)
  {
    double v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"_UICollectionLayoutSectionEstimatedSolver.m", 985, @"Invalid parameter not satisfying: %@", @"itemRangeIndexer" object file lineNumber description];

    if (v12) {
      goto LABEL_9;
    }
LABEL_17:
    double v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"_UICollectionLayoutSectionEstimatedSolver.m", 986, @"Invalid parameter not satisfying: %@", @"auxillaryRangeIndexerKindDict" object file lineNumber description];

    goto LABEL_9;
  }
  if (!v12) {
    goto LABEL_17;
  }
LABEL_9:
  id v13 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  double v14 = -[UIBarButtonItemGroup _items]((id *)a3);
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  void v36[2] = __85___UICollectionLayoutSectionEstimatedSolver__rangeOfBookmarksAffectedByResolveItems___block_invoke;
  v36[3] = &unk_1E52DADC0;
  uint64_t v15 = v8;
  CGRect v37 = v15;
  id v16 = v13;
  id v38 = v16;
  [v14 enumerateIndexesUsingBlock:v36];

  uint64_t v17 = -[_UICollectionLayoutSolveResult invalidatedAuxillaryKinds]((uint64_t)a3);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __85___UICollectionLayoutSectionEstimatedSolver__rangeOfBookmarksAffectedByResolveItems___block_invoke_2;
  v30[3] = &unk_1E52E16E0;
  double v18 = v12;
  double v31 = v18;
  id v32 = a3;
  SEL v35 = a2;
  double v33 = self;
  id v19 = v16;
  id v34 = v19;
  [v17 enumerateObjectsUsingBlock:v30];

  if ([v19 count]
    && (uint64_t v20 = [v19 firstIndex], v21 = objc_msgSend(v19, "lastIndex"), v21 >= v20))
  {
    uint64_t v22 = v21 - v20 + 1;
  }
  else
  {
    uint64_t v22 = 0;
    uint64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
  }

  NSUInteger v23 = v20;
  NSUInteger v24 = v22;
  result.NSUInteger length = v24;
  result.location = v23;
  return result;
}

- (_NSRange)preferredSizeGroupingRangeForItemAtIndex:(int64_t)a3
{
  if (self)
  {
    self = self->_solutionState;
    double v4 = self;
    if (self) {
      self = (_UICollectionLayoutSectionEstimatedSolver *)self->_layoutAxis;
    }
  }
  else
  {
    double v4 = 0;
  }
  uint64_t v5 = -[_UIOrderedRangeIndexer rangeContainingLocation:]((uint64_t)self, a3);
  NSUInteger v7 = v6;

  NSUInteger v8 = v5;
  NSUInteger v9 = v7;
  result.NSUInteger length = v9;
  result.location = v8;
  return result;
}

- (void)solveForContainer:(id)a3 traitCollection:(id)a4 layoutAxis:(unint64_t)a5 frameCount:(int64_t)a6
{
  LOBYTE(v6) = 0;
  [(_UICollectionLayoutSectionEstimatedSolver *)self solveForContainer:a3 supplementaryContainer:0 traitCollection:a4 layoutAxis:a5 frameCount:a6 preferredSizes:0 layoutRTL:v6];
}

- (void)solveForContainer:(id)a3 traitCollection:(id)a4 layoutAxis:(unint64_t)a5 frameCount:(int64_t)a6 preferredSizes:(id)a7
{
  LOBYTE(v7) = 0;
  [(_UICollectionLayoutSectionEstimatedSolver *)self solveForContainer:a3 supplementaryContainer:0 traitCollection:a4 layoutAxis:a5 frameCount:a6 preferredSizes:a7 layoutRTL:v7];
}

- (void)updatePinnedSupplementaryItemsWithVisibleBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  NSUInteger v8 = [(_UICollectionLayoutSectionEstimatedSolver *)self layoutSection];
  char v9 = [v8 _isEmptySection];

  if ((v9 & 1) == 0)
  {
    if (self) {
      sectionSupplementarySolution = self->_sectionSupplementarySolution;
    }
    else {
      sectionSupplementarySolution = 0;
    }
    -[_UICollectionLayoutAuxillaryItemSolver resolveSupplementaryItemsForVisibleBounds:]((id *)&sectionSupplementarySolution->super.isa, x, y, width, height);
  }
}

- (void)updatePinnedSupplementaryItemsWithVisibleBounds:(CGRect)a3 overrideContentRectForPinning:(CGRect)a4
{
  self->_overrideContentRectForPinning = a4;
  -[_UICollectionLayoutSectionEstimatedSolver updatePinnedSupplementaryItemsWithVisibleBounds:](self, "updatePinnedSupplementaryItemsWithVisibleBounds:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  CGSize v5 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
  self->_overrideContentRectForPinning.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
  self->_overrideContentRectForPinning.size = v5;
}

- (id)queryFramesIntersectingRect:(CGRect)a3
{
  return -[_UICollectionLayoutSectionEstimatedSolver queryFramesIntersectingRect:frameOffset:](self, "queryFramesIntersectingRect:frameOffset:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
}

- (id)sectionSupplementaryFrameForIndex:(int64_t)a3
{
  if (self)
  {
    if (self->_solutionState
      || ([MEMORY[0x1E4F28B00] currentHandler],
          double v14 = objc_claimAutoreleasedReturnValue(),
          [v14 handleFailureInMethod:a2, self, @"_UICollectionLayoutSectionEstimatedSolver.m", 290, @"Invalid parameter not satisfying: %@", @"self.solutionState" object file lineNumber description], v14, self))
    {
      sectionSupplementarySolution = self->_sectionSupplementarySolution;
      goto LABEL_4;
    }
  }
  else
  {
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, 0, @"_UICollectionLayoutSectionEstimatedSolver.m", 290, @"Invalid parameter not satisfying: %@", @"self.solutionState" object file lineNumber description];
  }
  sectionSupplementarySolution = 0;
LABEL_4:
  uint64_t v7 = -[_UICollectionLayoutAuxillaryItemSolver supplementaryFrames]((id *)&sectionSupplementarySolution->super.isa);
  unint64_t v8 = [v7 count];

  if (v8 <= a3)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"_UICollectionLayoutSectionEstimatedSolver.m", 291, @"Invalid parameter not satisfying: %@", @"index < self.sectionSupplementarySolution.supplementaryFrames.count" object file lineNumber description];

    if (self) {
      goto LABEL_6;
    }
  }
  else if (self)
  {
LABEL_6:
    char v9 = self->_sectionSupplementarySolution;
    goto LABEL_7;
  }
  char v9 = 0;
LABEL_7:
  double v10 = -[_UICollectionLayoutAuxillaryItemSolver supplementaryFrames]((id *)&v9->super.isa);
  uint64_t v11 = [v10 objectAtIndexedSubscript:a3];

  return v11;
}

- (id)unpinnedSectionSupplementaryFrameForIndex:(int64_t)a3
{
  if (self) {
    sectionSupplementarySolution = self->_sectionSupplementarySolution;
  }
  else {
    sectionSupplementarySolution = 0;
  }
  uint64_t v7 = sectionSupplementarySolution;
  unint64_t v8 = -[_UICollectionLayoutAuxillaryItemSolver unpinnedFramesOfPinnedSupplementaries](v7);

  if (v8)
  {
    if (!self || !self->_solutionState)
    {
      uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
      [v15 handleFailureInMethod:a2, self, @"_UICollectionLayoutSectionEstimatedSolver.m", 303, @"Invalid parameter not satisfying: %@", @"self.solutionState" object file lineNumber description];
    }
    char v9 = -[_UICollectionLayoutAuxillaryItemSolver unpinnedFramesOfPinnedSupplementaries](v7);
    unint64_t v10 = [v9 count];

    if (v10 <= a3)
    {
      double v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:a2, self, @"_UICollectionLayoutSectionEstimatedSolver.m", 304, @"Invalid parameter not satisfying: %@", @"index < sectionSupplementarySolution.unpinnedFramesOfPinnedSupplementaries.count" object file lineNumber description];
    }
    uint64_t v11 = -[_UICollectionLayoutAuxillaryItemSolver unpinnedFramesOfPinnedSupplementaries](v7);
    double v12 = [v11 objectAtIndexedSubscript:a3];
  }
  else
  {
    double v12 = [(_UICollectionLayoutSectionEstimatedSolver *)self sectionSupplementaryFrameForIndex:a3];
  }

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
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"_UICollectionLayoutSectionEstimatedSolver.m", 311, @"Invalid parameter not satisfying: %@", @"index >= 0" object file lineNumber description];

    if (self) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
  unint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
  [v10 handleFailureInMethod:a2, self, @"_UICollectionLayoutSectionEstimatedSolver.m", 310, @"Invalid parameter not satisfying: %@", @"kind != nil && kind.length > 0" object file lineNumber description];

  if (a4 < 0) {
    goto LABEL_10;
  }
LABEL_4:
  if (self)
  {
LABEL_5:
    sectionSupplementarySolution = self->_sectionSupplementarySolution;
    goto LABEL_6;
  }
LABEL_11:
  sectionSupplementarySolution = 0;
LABEL_6:
  return -[_UICollectionLayoutAuxillaryItemSolver unpinnedSupplementaryFrameWithKind:index:]((id *)&sectionSupplementarySolution->super.isa, a3, a4);
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
    unint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"_UICollectionLayoutSectionEstimatedSolver.m", 317, @"Invalid parameter not satisfying: %@", @"enrollmentIdentifier" object file lineNumber description];

    if (self) {
      goto LABEL_3;
    }
  }
  sectionSupplementaryEnroller = 0;
LABEL_4:
  return -[_UICollectionLayoutSupplementaryEnroller kindIndexForEnrollmentIdentifier:]((uint64_t)sectionSupplementaryEnroller, (uint64_t)a3);
}

- (id)visualDescription
{
  v15[1] = *MEMORY[0x1E4F143B8];
  [(_UICollectionLayoutContainer *)self->_container contentSize];
  double v4 = v3;
  [(_UICollectionLayoutContainer *)self->_container contentSize];
  double v6 = v5;
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", 0.0, 0.0, v4, v5);
  unint64_t v8 = -[_UICollectionLayoutSectionEstimatedSolver queryFramesIntersectingRect:](self, "queryFramesIntersectingRect:", 0.0, 0.0, v4, v6);
  char v9 = [v8 valueForKey:@"frame"];
  v15[0] = v7;
  unint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  uint64_t v11 = [v10 arrayByAddingObjectsFromArray:v9];

  double v12 = [[_UIASCIIArtFramesRenderer alloc] initWithFrames:v11];
  id v13 = [(_UIASCIIArtFramesRenderer *)v12 description];

  return v13;
}

- (NSIndexSet)pinnedSupplementaryIndexes
{
  if (self)
  {
    NSUInteger location = self[2]._internal._singleRange._range.location;
    if (location) {
      return *(NSIndexSet **)(location + 40);
    }
    else {
      return 0;
    }
  }
  return self;
}

- (CGRect)_rectWithContentInsetTrailingLayoutDimensionAddedToToRect:(CGRect)a3 insets:(NSDirectionalEdgeInsets)a4 layoutAxis:(unint64_t)a5
{
  double trailing = a4.trailing;
  double bottom = a4.bottom;
  double leading = a4.leading;
  double top = a4.top;
  double height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (a5 - 3 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    NSUInteger v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"_UICollectionLayoutSectionEstimatedSolver.m", 1123, @"Invalid parameter not satisfying: %@", @"layoutAxis == UIAxisVertical || layoutAxis == UIAxisHorizontal" object file lineNumber description];
  }
  double v14 = _UITrailingOffsetForInsetsAlongAxis(a5, top, leading, bottom, trailing);
  double v15 = _UISizeValueForAxis(a5, width, height);
  double v16 = _UISetSizeValueForAxis(a5, width, height, v14 + v15);
  double v18 = v17;
  double v19 = x;
  double v20 = y;
  result.size.double height = v18;
  result.size.double width = v16;
  result.origin.CGFloat y = v20;
  result.origin.CGFloat x = v19;
  return result;
}

- (CGRect)auxillaryHostPinningRect
{
  if (self && self->_solutionState)
  {
    CGFloat x = self->_overrideContentRectForPinning.origin.x;
    CGFloat y = self->_overrideContentRectForPinning.origin.y;
    CGFloat width = self->_overrideContentRectForPinning.size.width;
    CGFloat height = self->_overrideContentRectForPinning.size.height;
    v13.origin.CGFloat x = x;
    v13.origin.CGFloat y = y;
    v13.size.CGFloat width = width;
    v13.size.CGFloat height = height;
    if (CGRectIsNull(v13))
    {
      uint64_t v7 = self->_solutionState;
      CGFloat y = 0.0;
      if (v7)
      {
        uint64_t sectionGeometryTranslator = v7->_sectionGeometryTranslator;
        CGFloat width = 0.0;
        CGFloat height = 0.0;
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
        CGFloat width = 0.0;
        CGFloat height = 0.0;
        CGFloat x = 0.0;
      }
    }
  }
  else
  {
    CGFloat x = *MEMORY[0x1E4F1DB28];
    CGFloat y = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    CGFloat width = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    CGFloat height = *(double *)(MEMORY[0x1E4F1DB28] + 24);
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

- (BOOL)auxillaryHostWantsOverlapAdjustmentForMatchingAlignmentsOnly
{
  return !CGRectIsNull(self->_overrideContentRectForPinning);
}

- (void)setShouldAdjustContentSizeForPartialLastGroupSolution:(BOOL)a3
{
  self->_shouldAdjustContentSizeForPartialLastGroupSolution = a3;
}

- (void)setSupplementaryContainer:(id)a3
{
}

@end
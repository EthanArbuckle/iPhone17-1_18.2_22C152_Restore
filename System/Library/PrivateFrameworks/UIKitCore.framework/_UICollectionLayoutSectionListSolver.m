@interface _UICollectionLayoutSectionListSolver
- (BOOL)auxillaryHostWantsOverlapAdjustmentForMatchingAlignmentsOnly;
- (BOOL)layoutRTL;
- (BOOL)shouldAdjustContentSizeForPartialLastGroupSolution;
- (CGPoint)orthogonalOffset;
- (CGRect)auxillaryHostPinningRect;
- (CGRect)contentFrameIncludingAuxiliaries;
- (CGRect)primaryContentFrame;
- (CGSize)auxillaryHostContentSize;
- (CGVector)orthogonalScrollingPrefetchingUnitVector;
- (NSCollectionLayoutContainer)container;
- (NSCollectionLayoutContainer)supplementaryContainer;
- (NSCollectionLayoutSection)layoutSection;
- (NSIndexSet)pinnedSupplementaryIndexes;
- (NSString)errorDescription;
- (UITraitCollection)traitCollection;
- (_NSRange)preferredSizeGroupingRangeForItemAtIndex:(int64_t)a3;
- (_UICollectionLayoutSolveResult)_resolveWithParameters:(void *)a1;
- (double)_dimensionForRootGroupAlongAxis:(unint64_t)a3;
- (double)auxillaryHostPaddingBeforeBoundarySupplementaries;
- (id).cxx_construct;
- (id)_queryFramesIntersectingRect:(CGFloat)a3 frameOffset:(CGFloat)a4;
- (id)auxillaryHostAuxillaryItems;
- (id)auxillaryHostContainer;
- (id)auxillaryHostPreferredSizes;
- (id)auxillaryHostSupplementaryEnroller;
- (id)frameForIndex:(int64_t)a3;
- (id)initWithLayoutSection:(void *)a1;
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
- (uint64_t)_regionIndexForFrameIndex:(uint64_t)a1 startRegionIndex:(unint64_t)a2 endRegionIndex:(uint64_t)a3;
- (unint64_t)containerLayoutAxis;
- (unint64_t)containerSizeDependentAxes;
- (unint64_t)layoutAxis;
- (void)_solveSectionAuxiliariesWithSectionContentSize:(double)a3;
- (void)setContainer:(id)a3;
- (void)setContainerLayoutAxis:(unint64_t)a3;
- (void)setFrameCount:(int64_t)a3;
- (void)setLayoutAxis:(unint64_t)a3;
- (void)setLayoutRTL:(BOOL)a3;
- (void)setLayoutSection:(id)a3;
- (void)setOrthogonalOffset:(CGPoint)a3;
- (void)setOrthogonalScrollingPrefetchingUnitVector:(CGVector)a3;
- (void)setPreferredSizes:(uint64_t)a1;
- (void)setShouldAdjustContentSizeForPartialLastGroupSolution:(BOOL)a3;
- (void)setSupplementaryContainer:(id)a3;
- (void)setTraitCollection:(id)a3;
- (void)solveForContainer:(id)a3 supplementaryContainer:(id)a4 traitCollection:(id)a5 layoutAxis:(unint64_t)a6 frameCount:(int64_t)a7 preferredSizes:(id)a8 layoutRTL:(BOOL)a9;
- (void)solveForContainer:(id)a3 traitCollection:(id)a4 layoutAxis:(unint64_t)a5 frameCount:(int64_t)a6;
- (void)solveForContainer:(id)a3 traitCollection:(id)a4 layoutAxis:(unint64_t)a5 frameCount:(int64_t)a6 preferredSizes:(id)a7;
- (void)updatePinnedSupplementaryItemsWithVisibleBounds:(CGRect)a3;
- (void)updatePinnedSupplementaryItemsWithVisibleBounds:(CGRect)a3 overrideContentRectForPinning:(CGRect)a4;
@end

@implementation _UICollectionLayoutSectionListSolver

- (id)frameForIndex:(int64_t)a3
{
  int64_t v5 = [(_UICollectionLayoutSectionListSolver *)self frameCount];
  v6 = 0;
  if (v5 > a3 && self)
  {
    solution = self->_solution;
    if (solution && (solveResult = solution->_solveResult) != 0 && solveResult->_itemFrameCount == 1)
    {
      begin = self->_regions.__begin_;
      uint64_t v10 = self->_regions.__end_ - begin;
      if (!v10
        || (uint64_t v11 = -[_UICollectionLayoutSectionListSolver _regionIndexForFrameIndex:startRegionIndex:endRegionIndex:]((uint64_t)self, a3, 0x86BCA1AF286BCA1BLL * (v10 >> 3) - 1), v11 == 0x7FFFFFFFFFFFFFFFLL))
      {
        v12 = [MEMORY[0x1E4F28B00] currentHandler];
        [v12 handleFailureInMethod:sel__regionForFrameIndex_, self, @"_UICollectionLayoutSectionListSolver.mm", 881, @"Invalid parameter not satisfying: %@", @"regionIndex != NSNotFound" object file lineNumber description];

        begin = self->_regions.__begin_;
        uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
      }
      v13 = (void *)((char *)begin + 152 * v11);
      sectionGeometryTranslator = self->_sectionGeometryTranslator;
      if (sectionGeometryTranslator)
      {
        CGFloat x = sectionGeometryTranslator->_primaryContentFrame.origin.x;
        CGFloat y = sectionGeometryTranslator->_primaryContentFrame.origin.y;
      }
      else
      {
        CGFloat y = 0.0;
        CGFloat x = 0.0;
      }
      if ((unint64_t)a3 < *v13 || (unint64_t)(a3 - *v13) >= v13[1])
      {
        uint64_t v27 = v11;
        v28 = (void *)((char *)begin + 152 * v11);
        v25 = [MEMORY[0x1E4F28B00] currentHandler];
        v26 = [NSString stringWithUTF8String:"CGRect _UIRegionSolveResult::frameForIndex(NSInteger) const"];
        [v25 handleFailureInFunction:v26, @"_UICollectionLayoutSectionListSolver.mm", 254, @"Invalid parameter not satisfying: %@", @"NSLocationInRange(index, _range)" file lineNumber description];

        uint64_t v11 = v27;
        v13 = v28;
      }
      v18 = (char *)begin + 152 * v11;
      CGFloat v19 = *((double *)v18 + 4);
      CGFloat v20 = *((double *)v18 + 5);
      CGFloat v21 = *((double *)v18 + 6);
      CGFloat v22 = *((double *)v18 + 7);
      CGFloat v23 = *((double *)v18 + 2) + (CGRectGetHeight(*((CGRect *)v18 + 2)) + *((double *)v18 + 3)) * (double)(a3 - *v13);
      v30.origin.CGFloat x = v19;
      v30.origin.CGFloat y = v20;
      v30.size.width = v21;
      v30.size.height = v22;
      CGRect v31 = CGRectOffset(v30, 0.0, v23);
      CGRect v32 = CGRectOffset(v31, x, y);
      v6 = -[_UICollectionLayoutFramesQueryResult copyWithFrame:index:](*((id **)v18 + 18), (void *)a3, v32.origin.x, v32.origin.y, v32.size.width, v32.size.height);
    }
    else
    {
      v6 = 0;
    }
  }
  return v6;
}

- (int64_t)frameCount
{
  return self->_frameCount;
}

- (uint64_t)_regionIndexForFrameIndex:(uint64_t)a1 startRegionIndex:(unint64_t)a2 endRegionIndex:(uint64_t)a3
{
  if (a3 < 0) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v3 = 0;
  while (v3 != a3)
  {
    uint64_t v4 = a3 + v3;
    if (a3 + v3 < 0 != __OFADD__(a3, v3)) {
      ++v4;
    }
    uint64_t v5 = v4 >> 1;
    v6 = (unint64_t *)(*(void *)(a1 + 8) + 152 * (v4 >> 1));
    unint64_t v7 = *v6;
    unint64_t v8 = v6[1];
    if (a2 >= v7 && a2 - v7 < v8) {
      return v5;
    }
    if (a2 >= v7)
    {
      uint64_t v3 = v5 + 1;
      uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
      if (v5 >= a3) {
        return v12;
      }
    }
    else
    {
      a3 = v5 - 1;
      if (v3 >= v5) {
        return 0x7FFFFFFFFFFFFFFFLL;
      }
    }
  }
  uint64_t v10 = (void *)(*(void *)(a1 + 8) + 152 * v3);
  BOOL v11 = a2 - *v10 < v10[1] && a2 >= *v10;
  uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
  if (v11) {
    return v3;
  }
  return v12;
}

- (unint64_t)layoutAxis
{
  return self->_layoutAxis;
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

- (id)_queryFramesIntersectingRect:(CGFloat)a3 frameOffset:(CGFloat)a4
{
  if (a1)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    double v9 = (double *)*(id *)(a1 + 80);
    if (v9)
    {
      double v104 = v9[9];
      double v106 = v9[10];
    }
    else
    {
      double v104 = 0.0;
      double v106 = 0.0;
    }
    v97 = v9;
    double v123 = -[_UICollectionLayoutSectionGeometryTranslator contentRectForSectionRect:]((uint64_t)v9, a2, a3, a4, a5);
    CGFloat v121 = v11;
    double v122 = v10;
    CGFloat rect1 = v12;
    v119 = (void *)a1;
    if ([(id)a1 frameCount] >= 1)
    {
      uint64_t v14 = *(void *)(a1 + 8);
      uint64_t v13 = *(void *)(a1 + 16);
      uint64_t v15 = v13 - v14;
      if (v13 != v14)
      {
        [(id)a1 contentFrameIncludingAuxiliaries];
        v147.size.CGFloat width = v16;
        v147.size.CGFloat height = v17;
        v147.origin.CGFloat x = 0.0;
        v147.origin.CGFloat y = 0.0;
        v127.origin.CGFloat x = v123;
        v127.size.CGFloat width = v121;
        v127.origin.CGFloat y = v122;
        v127.size.CGFloat height = rect1;
        if (CGRectIntersectsRect(v127, v147))
        {
          uint64_t v18 = *(void *)(a1 + 8);
          CGFloat v19 = *(double *)(v18 + 64);
          CGFloat v20 = *(double *)(v18 + 72);
          CGFloat v21 = *(double *)(v18 + 80);
          CGFloat v22 = *(double *)(v18 + 88);
          v128.origin.CGFloat x = v19;
          v128.origin.CGFloat y = v20;
          v128.size.CGFloat width = v21;
          v128.size.CGFloat height = v22;
          double Height = CGRectGetHeight(v128);
          double v23 = *(double *)(v18 + 24);
          unint64_t v24 = *(void *)(v18 + 8);
          v129.origin.CGFloat x = v19;
          v129.origin.CGFloat y = v20;
          v129.size.CGFloat width = v21;
          v129.size.CGFloat height = v22;
          CGFloat MinX = CGRectGetMinX(v129);
          CGFloat v26 = *(double *)(v18 + 16);
          v130.origin.CGFloat x = v19;
          v130.origin.CGFloat y = v20;
          v130.size.CGFloat width = v21;
          v130.size.CGFloat height = v22;
          v131.size.CGFloat width = CGRectGetWidth(v130);
          v131.size.CGFloat height = (Height + v23) * (double)v24;
          v131.origin.CGFloat x = MinX;
          v131.origin.CGFloat y = v26;
          v148.origin.CGFloat x = v123;
          v148.size.CGFloat width = v121;
          v148.origin.CGFloat y = v122;
          v148.size.CGFloat height = rect1;
          if (CGRectIntersectsRect(v131, v148))
          {
            uint64_t v27 = 0;
LABEL_9:
            v132.origin.CGFloat x = v123;
            v132.size.CGFloat width = v121;
            v132.origin.CGFloat y = v122;
            v132.size.CGFloat height = rect1;
            double MaxY = CGRectGetMaxY(v132);
            uint64_t v95 = v15 / 152;
            if (v27 < v15 / 152)
            {
              double v100 = a7 + v106;
              double v28 = a6 + v104 + 0.0;
              do
              {
                uint64_t v29 = v119[1];
                CGRect v30 = (CGRect *)(v29 + 152 * v27);
                CGFloat x = v30[2].origin.x;
                CGFloat y = v30[2].origin.y;
                CGFloat width = v30[2].size.width;
                CGFloat v34 = v30[2].size.height;
                v133.origin.CGFloat x = x;
                v133.origin.CGFloat y = y;
                v133.size.CGFloat width = width;
                v133.size.CGFloat height = v34;
                double v112 = CGRectGetHeight(v133);
                double v35 = v30->size.height;
                unint64_t v108 = *(void *)&v30->origin.y;
                v134.origin.CGFloat x = x;
                v134.origin.CGFloat y = y;
                v134.size.CGFloat width = width;
                v134.size.CGFloat height = v34;
                CGFloat v36 = CGRectGetMinX(v134);
                CGFloat v38 = v30->size.width;
                p_CGFloat width = &v30->size.width;
                v135.origin.CGFloat x = x;
                v135.origin.CGFloat y = y;
                v135.size.CGFloat width = width;
                v135.size.CGFloat height = v34;
                v136.size.CGFloat width = CGRectGetWidth(v135);
                v136.size.CGFloat height = (v112 + v35) * (double)v108;
                v136.origin.CGFloat x = v36;
                v136.origin.CGFloat y = v38;
                if (CGRectGetMinY(v136) > MaxY) {
                  break;
                }
                if (*(void *)&v30->origin.y)
                {
                  v137.origin.CGFloat x = v123;
                  v137.size.CGFloat width = v121;
                  v137.origin.CGFloat y = v122;
                  v137.size.CGFloat height = rect1;
                  double MinY = CGRectGetMinY(v137);
                  double v40 = CGRectGetHeight(v30[2]);
                  unint64_t v41 = *(void *)&v30->origin.x;
                  v42 = *(char **)&v30->origin.x;
                  if (MinY > *p_width)
                  {
                    double v43 = (MinY - *p_width) / (v40 + v30->size.height) + (double)v41;
                    v42 = (uint64_t)(v41 + *(void *)&v30->origin.y - 1) >= (uint64_t)v43
                        ? (char *)(uint64_t)v43
                        : (char *)(v41 + *(void *)&v30->origin.y - 1);
                    if ((unint64_t)v42 < v41)
                    {
                      v71 = [MEMORY[0x1E4F28B00] currentHandler];
                      v72 = [NSString stringWithUTF8String:"NSInteger _UIRegionSolveResult::firstFrameIndexMatchingQueryRect(CGRect) const"];
                      [v71 handleFailureInFunction:v72, @"_UICollectionLayoutSectionListSolver.mm", 227, @"Invalid parameter not satisfying: %@", @"firstIndex >= _range.location && firstIndex <= maxIndex" file lineNumber description];
                    }
                  }
                  if (v42 != (char *)0x7FFFFFFFFFFFFFFFLL)
                  {
                    v138.origin.CGFloat x = v123;
                    v138.size.CGFloat width = v121;
                    v138.origin.CGFloat y = v122;
                    v138.size.CGFloat height = rect1;
                    double v44 = CGRectGetMaxY(v138);
                    uint64_t v45 = *(void *)&v30->origin.x + *(void *)&v30->origin.y - 1;
                    if ((uint64_t)v42 <= v45)
                    {
                      double v46 = v44;
                      uint64_t v47 = v29 + 152 * v27;
                      v109 = (CGFloat *)(v47 + 40);
                      v113 = (CGFloat *)(v47 + 32);
                      v105 = (CGFloat *)(v47 + 56);
                      v107 = (CGFloat *)(v47 + 48);
                      v102 = (_UIAuxillarySolveResult **)(v47 + 128);
                      v103 = (_UIAuxillarySolveResult **)(v47 + 120);
                      v101 = (_UIAuxillarySolveResult **)(v47 + 96);
                      v48 = (_UIAuxillarySolveResult **)(v47 + 104);
                      v49 = (id **)(v47 + 144);
                      while (1)
                      {
                        double v50 = _UIRegionSolveResult::boundingFrameForIndex((_UIRegionSolveResult *)v30, (unint64_t)v42);
                        CGFloat v52 = v51;
                        CGFloat v54 = v53;
                        CGFloat v56 = v55;
                        v139.origin.CGFloat x = v123;
                        v139.size.CGFloat width = v121;
                        v139.origin.CGFloat y = v122;
                        v139.size.CGFloat height = rect1;
                        v149.origin.CGFloat x = v50;
                        v149.origin.CGFloat y = v52;
                        v149.size.CGFloat width = v54;
                        v149.size.CGFloat height = v56;
                        BOOL v57 = CGRectIntersectsRect(v139, v149);
                        v140.origin.CGFloat x = v50;
                        v140.origin.CGFloat y = v52;
                        v140.size.CGFloat width = v54;
                        v140.size.CGFloat height = v56;
                        double v58 = CGRectGetMinY(v140);
                        if (v57)
                        {
                          double v59 = v100 + v58;
                          v141.origin.CGFloat x = *v113;
                          v141.origin.CGFloat y = *v109;
                          v141.size.CGFloat width = *v107;
                          v141.size.CGFloat height = *v105;
                          CGRect v142 = CGRectOffset(v141, v28, v59);
                          double v60 = v142.origin.x;
                          double v61 = v142.origin.y;
                          double v62 = v142.size.width;
                          double v63 = v142.size.height;
                          v64 = *v103;
                          v65 = *v102;
                          while (v64 != v65)
                          {
                            v125.CGFloat x = v28;
                            v125.CGFloat y = v59;
                            v66 = _UIAuxillarySolveResult::queryResultForIndexAndOffset(v64, (uint64_t)v42, v125);
                            [v8 addObject:v66];

                            v64 = (_UIAuxillarySolveResult *)((char *)v64 + 48);
                          }
                          v67 = *v101;
                          v68 = *v48;
                          while (v67 != v68)
                          {
                            v126.CGFloat x = v28;
                            v126.CGFloat y = v59;
                            v69 = _UIAuxillarySolveResult::queryResultForIndexAndOffset(v67, (uint64_t)v42, v126);
                            [v8 addObject:v69];

                            v67 = (_UIAuxillarySolveResult *)((char *)v67 + 48);
                          }
                          v70 = -[_UICollectionLayoutFramesQueryResult copyWithFrame:index:](*v49, v42, v60, v61, v62, v63);
                          [v8 addObject:v70];

                          if ((uint64_t)v42 >= v45) {
                            break;
                          }
                        }
                        else if ((uint64_t)v42 >= v45 || v58 > v46)
                        {
                          break;
                        }
                        ++v42;
                      }
                    }
                  }
                }
                ++v27;
              }
              while (v27 != v95);
            }
            goto LABEL_37;
          }
          uint64_t v73 = v119[2] - v119[1];
          if (v73 >= 152)
          {
            uint64_t v76 = 0;
            int64_t v77 = v73 / 0x98uLL - 1;
            while (1)
            {
              uint64_t v78 = v119[17];
              double v110 = _UIRectMinPointValueAlongAxis(v78, v123, v122);
              uint64_t v79 = v77 + v76;
              if (v77 + v76 < 0 != __OFADD__(v77, v76)) {
                ++v79;
              }
              uint64_t v27 = v79 >> 1;
              uint64_t v80 = v119[1];
              v81 = (double *)(v80 + 152 * (v79 >> 1));
              CGFloat v82 = v81[8];
              CGFloat v83 = v81[9];
              CGFloat v84 = v81[10];
              CGFloat v85 = v81[11];
              v143.origin.CGFloat x = v82;
              v143.origin.CGFloat y = v83;
              v143.size.CGFloat width = v84;
              v143.size.CGFloat height = v85;
              double v114 = CGRectGetHeight(v143);
              uint64_t v86 = v80 + 152 * v27;
              double v87 = *(double *)(v86 + 24);
              unint64_t v88 = *(void *)(v86 + 8);
              v144.origin.CGFloat x = v82;
              v144.origin.CGFloat y = v83;
              v144.size.CGFloat width = v84;
              v144.size.CGFloat height = v85;
              double v89 = CGRectGetMinX(v144);
              double v90 = *(double *)(v80 + 152 * v27 + 16);
              v145.origin.CGFloat x = v82;
              v145.origin.CGFloat y = v83;
              v145.size.CGFloat width = v84;
              v145.size.CGFloat height = v85;
              CGFloat v91 = CGRectGetWidth(v145);
              double v92 = _UIRectMinPointValueAlongAxis(v78, v89, v90);
              v146.origin.CGFloat x = v89;
              v146.origin.CGFloat y = v90;
              v146.size.CGFloat width = v91;
              v146.size.CGFloat height = (v114 + v87) * (double)v88;
              v150.origin.CGFloat x = v123;
              v150.size.CGFloat width = v121;
              v150.origin.CGFloat y = v122;
              v150.size.CGFloat height = rect1;
              BOOL v93 = CGRectIntersectsRect(v146, v150);
              if (v110 >= v92 && v93) {
                goto LABEL_9;
              }
              if (v110 >= v92)
              {
                uint64_t v76 = v27 + 1;
                if (v27 >= v77) {
                  break;
                }
              }
              else
              {
                int64_t v77 = v27 - 1;
                if (v76 >= v27) {
                  break;
                }
              }
            }
          }
        }
      }
    }
LABEL_37:
    v74 = -[_UICollectionLayoutAuxillaryItemSolver queryFramesIntersectingRect:frameOffset:](v119[8], a2, a3, a4, a5, a6, a7);
    [v8 addObjectsFromArray:v74];

    goto LABEL_38;
  }
  id v8 = 0;
LABEL_38:
  return v8;
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

- (id)auxillaryHostSupplementaryEnroller
{
  if (self) {
    self = (_UICollectionLayoutSectionListSolver *)self->_sectionSupplementaryEnroller;
  }
  return self;
}

- (id)auxillaryHostPreferredSizes
{
  if (self) {
    self = (_UICollectionLayoutSectionListSolver *)self->_preferredSizes;
  }
  return self;
}

- (id)auxillaryHostContainer
{
  if (!self || (uint64_t v3 = self->_memoizedAuxillaryHostContainer) == 0)
  {
    if ([(NSCollectionLayoutSection *)self->_layoutSection supplementariesFollowContentInsets])
    {
      unint64_t v4 = [(_UICollectionLayoutSectionListSolver *)self containerLayoutAxis];
      [(NSCollectionLayoutSection *)self->_layoutSection contentInsets];
      double v6 = v5;
      double v8 = v7;
      double v10 = v9;
      double v12 = v11;
      uint64_t v13 = [_UICollectionLayoutContainer alloc];
      id v14 = [(_UICollectionLayoutSectionListSolver *)self supplementaryContainer];
      [v14 contentSize];
      uint64_t v17 = v4 == 2;
      if (v4 == 1) {
        uint64_t v17 = 2;
      }
      double v18 = 0.0;
      if (v17 == 2) {
        double v19 = 0.0;
      }
      else {
        double v19 = v12;
      }
      if (v17 == 2) {
        double v20 = 0.0;
      }
      else {
        double v20 = v8;
      }
      if (v17 == 1)
      {
        double v19 = v12;
        double v21 = 0.0;
      }
      else
      {
        double v21 = v10;
      }
      if (v17 == 1) {
        double v22 = v8;
      }
      else {
        double v22 = v20;
      }
      if (v17 == 1) {
        double v23 = 0.0;
      }
      else {
        double v23 = v6;
      }
      if (v17) {
        double v24 = v19;
      }
      else {
        double v24 = 0.0;
      }
      if (v17) {
        double v25 = v21;
      }
      else {
        double v25 = 0.0;
      }
      if (v17) {
        double v26 = v22;
      }
      else {
        double v26 = 0.0;
      }
      if (v17) {
        double v18 = v23;
      }
      memoizedAuxillaryHostContainer = -[_UICollectionLayoutContainer initWithContentSize:contentInsets:](v13, v15, v16, v18, v26, v25, v24);
      objc_storeStrong((id *)&self->_memoizedAuxillaryHostContainer, memoizedAuxillaryHostContainer);
    }
    else
    {
      id v14 = [(_UICollectionLayoutSectionListSolver *)self supplementaryContainer];
      memoizedAuxillaryHostContainer = self->_memoizedAuxillaryHostContainer;
      self->_memoizedAuxillaryHostContainer = (NSCollectionLayoutContainer *)v14;
    }

    uint64_t v3 = self->_memoizedAuxillaryHostContainer;
  }
  return v3;
}

- (NSString)errorDescription
{
  return self->_errorDescription;
}

- (id)initWithLayoutSection:(void *)a1
{
  if (!a1) {
    return 0;
  }
  if (([a2 prefersListSolver] & 1) == 0)
  {
    double v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:sel_initWithLayoutSection_, a1, @"_UICollectionLayoutSectionListSolver.mm", 353, @"Invalid parameter not satisfying: %@", @"layoutSection.prefersListSolver" object file lineNumber description];
  }
  v11.receiver = a1;
  v11.super_class = (Class)_UICollectionLayoutSectionListSolver;
  unint64_t v4 = (id *)objc_msgSendSuper2(&v11, sel_init);
  double v5 = v4;
  if (v4)
  {
    objc_storeStrong(v4 + 13, a2);
    v5[17] = 0;
    double v6 = [a2 group];
    double v7 = [v6 size];
    *((unsigned char *)v5 + 40) = [v7 isContainerSize] ^ 1;

    long long v8 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
    *((_OWORD *)v5 + 12) = *MEMORY[0x1E4F1DB20];
    *((_OWORD *)v5 + 13) = v8;
    [v5[13] _checkForDuplicateSupplementaryItemKindsAndThrowIfFound];
  }
  return v5;
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

- (CGSize)auxillaryHostContentSize
{
  uint64_t v3 = [(_UICollectionLayoutSectionListSolver *)self layoutSection];
  int v4 = [v3 scrollsOrthogonally];
  unint64_t v5 = [(_UICollectionLayoutSectionListSolver *)self layoutAxis];
  if (self) {
    sectionGeometryTranslator = self->_sectionGeometryTranslator;
  }
  else {
    sectionGeometryTranslator = 0;
  }
  double v7 = -[_UICollectionLayoutSectionGeometryTranslator auxillaryHostContentSize]((uint64_t)sectionGeometryTranslator);
  double v9 = v8;
  uint64_t v10 = v5 == 2;
  if (v5 == 1) {
    uint64_t v10 = 2;
  }
  if (v4) {
    uint64_t v11 = v5;
  }
  else {
    uint64_t v11 = v10;
  }
  double v12 = [(_UICollectionLayoutSectionListSolver *)self supplementaryContainer];
  [v12 contentSize];
  double v15 = _UISizeValueForAxis(v11, v13, v14);

  double v16 = _UISetSizeValueForAxis(v11, v7, v9, v15);
  double v18 = v17;

  double v19 = v16;
  double v20 = v18;
  result.CGFloat height = v20;
  result.CGFloat width = v19;
  return result;
}

- (NSCollectionLayoutContainer)supplementaryContainer
{
  return self->_supplementaryContainer;
}

- (id)resolveWithParameters:(id)a3 preferredSizes:(id)a4
{
  -[_UICollectionLayoutSectionListSolver setPreferredSizes:]((uint64_t)self, a4);
  return -[_UICollectionLayoutSectionListSolver _resolveWithParameters:](self, (uint64_t)a3);
}

- (id)sectionSupplementaryFrameForIndex:(int64_t)a3
{
  unint64_t v5 = self;
  if (self) {
    self = (_UICollectionLayoutSectionListSolver *)self->_sectionAuxillarySolution;
  }
  double v6 = -[_UICollectionLayoutAuxillaryItemSolver supplementaryFrames]((id *)&self->super.isa);
  unint64_t v7 = [v6 count];

  if (v7 <= a3)
  {
    double v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, v5, @"_UICollectionLayoutSectionListSolver.mm", 509, @"Invalid parameter not satisfying: %@", @"index < self.sectionAuxillarySolution.supplementaryFrames.count" object file lineNumber description];

    if (!v5) {
      goto LABEL_11;
    }
  }
  else if (!v5)
  {
    goto LABEL_11;
  }
  if (v5->_sectionGeometryTranslator)
  {
LABEL_6:
    p_isa = (id *)&v5->_sectionAuxillarySolution->super.isa;
    goto LABEL_7;
  }
LABEL_11:
  double v13 = [MEMORY[0x1E4F28B00] currentHandler];
  [v13 handleFailureInMethod:a2, v5, @"_UICollectionLayoutSectionListSolver.mm", 510, @"Invalid parameter not satisfying: %@", @"self.sectionGeometryTranslator" object file lineNumber description];

  if (v5) {
    goto LABEL_6;
  }
  p_isa = 0;
LABEL_7:
  double v9 = -[_UICollectionLayoutAuxillaryItemSolver supplementaryFrames](p_isa);
  uint64_t v10 = [v9 objectAtIndexedSubscript:a3];

  return v10;
}

- (id)supplementaryFrameWithKind:(id)a3 index:(int64_t)a4
{
  if ([a3 length])
  {
    if ((a4 & 0x8000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_30:
    CGFloat v36 = [MEMORY[0x1E4F28B00] currentHandler];
    [v36 handleFailureInMethod:a2, self, @"_UICollectionLayoutSectionListSolver.mm", 474, @"Invalid parameter not satisfying: %@", @"index >= 0" object file lineNumber description];

    if (self) {
      goto LABEL_4;
    }
    goto LABEL_31;
  }
  double v35 = [MEMORY[0x1E4F28B00] currentHandler];
  [v35 handleFailureInMethod:a2, self, @"_UICollectionLayoutSectionListSolver.mm", 473, @"Invalid parameter not satisfying: %@", @"kind.length" object file lineNumber description];

  if (a4 < 0) {
    goto LABEL_30;
  }
LABEL_3:
  if (self)
  {
LABEL_4:
    unint64_t sectionAuxillarySolution = self->_sectionAuxillarySolution;
    goto LABEL_5;
  }
LABEL_31:
  unint64_t sectionAuxillarySolution = 0;
LABEL_5:
  id v9 = [(_UICollectionLayoutAuxillaryItemSolver *)(id *)&sectionAuxillarySolution->super.isa supplementaryFrameWithKind:a4 index:*MEMORY[0x1E4F1DAD8] additionalFrameOffset:*(double *)(MEMORY[0x1E4F1DAD8] + 8)];
  if (v9) {
    goto LABEL_13;
  }
  if (self) {
    unint64_t solution = self->_solution;
  }
  else {
    unint64_t solution = 0;
  }
  uint64_t v11 = -[_UICollectionLayoutItemSolver supplementaryOffsets](solution);
  double v12 = [v11 elementKinds];
  char v13 = [v12 containsObject:a3];

  if ((v13 & 1) == 0) {
    goto LABEL_12;
  }
  if (self)
  {
    begin = self->_regions.__begin_;
    uint64_t v15 = self->_regions.__end_ - begin;
    if (!v15
      || (uint64_t v16 = -[_UICollectionLayoutSectionListSolver _regionIndexForFrameIndex:startRegionIndex:endRegionIndex:]((uint64_t)self, a4, 0x86BCA1AF286BCA1BLL * (v15 >> 3) - 1), v16 == 0x7FFFFFFFFFFFFFFFLL))
    {
LABEL_12:
      id v9 = 0;
      goto LABEL_13;
    }
    uint64_t v18 = v16;
    sectionGeometryTranslator = self->_sectionGeometryTranslator;
    if (sectionGeometryTranslator)
    {
      double x = sectionGeometryTranslator->_primaryContentFrame.origin.x;
      double y = sectionGeometryTranslator->_primaryContentFrame.origin.y;
      goto LABEL_18;
    }
  }
  else
  {
    uint64_t v18 = 0;
    begin = (_UIRegionSolveResult *)MEMORY[8];
  }
  double y = 0.0;
  double x = 0.0;
LABEL_18:
  double v22 = (char *)begin + 152 * v18;
  double v23 = _UIRegionSolveResult::boundingFrameForIndex((_UIRegionSolveResult *)v22, a4);
  double v25 = v24;
  double v26 = (_UIAuxillarySolveResult *)*((void *)v22 + 12);
  uint64_t v27 = (_UIAuxillarySolveResult *)*((void *)v22 + 13);
  while (v26 != v27)
  {
    uint64_t v28 = -[_UICollectionLayoutFramesQueryResult auxillaryItem](*((void **)v26 + 5));
    uint64_t v29 = [(id)v28 elementKind];

    LOBYTE(v28) = [v29 isEqualToString:a3];
    if (v28)
    {
LABEL_26:
      v38.double x = x + v23;
      v38.double y = y + v25;
      CGFloat v34 = _UIAuxillarySolveResult::queryResultForIndexAndOffset(v26, a4, v38);
      goto LABEL_28;
    }
    double v26 = (_UIAuxillarySolveResult *)((char *)v26 + 48);
  }
  CGRect v30 = (char *)begin + 152 * v18;
  double v26 = (_UIAuxillarySolveResult *)*((void *)v30 + 15);
  CGRect v31 = (_UIAuxillarySolveResult *)*((void *)v30 + 16);
  while (v26 != v31)
  {
    uint64_t v32 = -[_UICollectionLayoutFramesQueryResult auxillaryItem](*((void **)v26 + 5));
    v33 = [(id)v32 elementKind];

    LOBYTE(v32) = [v33 isEqualToString:a3];
    if (v32) {
      goto LABEL_26;
    }
    double v26 = (_UIAuxillarySolveResult *)((char *)v26 + 48);
  }
  CGFloat v34 = 0;
LABEL_28:
  id v9 = v34;
LABEL_13:
  return v9;
}

- (void)solveForContainer:(id)a3 supplementaryContainer:(id)a4 traitCollection:(id)a5 layoutAxis:(unint64_t)a6 frameCount:(int64_t)a7 preferredSizes:(id)a8 layoutRTL:(BOOL)a9
{
  uint64_t v166 = *MEMORY[0x1E4F143B8];
  -[_UICollectionLayoutSectionListSolver setContainer:](self, "setContainer:");
  if (a4) {
    id v15 = a4;
  }
  else {
    id v15 = a3;
  }
  [(_UICollectionLayoutSectionListSolver *)self setSupplementaryContainer:v15];
  [(_UICollectionLayoutSectionListSolver *)self setTraitCollection:a5];
  [(_UICollectionLayoutSectionListSolver *)self setContainerLayoutAxis:a6];
  CGRect v132 = self;
  id v137 = [(_UICollectionLayoutSectionListSolver *)self layoutSection];
  int v16 = [v137 scrollsOrthogonally];
  uint64_t v17 = a6 == 2;
  if (a6 == 1) {
    uint64_t v17 = 2;
  }
  if (v16) {
    unint64_t v18 = v17;
  }
  else {
    unint64_t v18 = a6;
  }
  [(_UICollectionLayoutSectionListSolver *)self setLayoutAxis:v18];

  [(_UICollectionLayoutSectionListSolver *)self setFrameCount:a7];
  [(_UICollectionLayoutSectionListSolver *)self setLayoutRTL:a9];
  -[_UICollectionLayoutSectionListSolver setPreferredSizes:]((uint64_t)self, a8);
  if (self)
  {
    uint64_t v130 = [(_UICollectionLayoutSectionListSolver *)self layoutAxis];
    [(_UICollectionLayoutSectionListSolver *)self layoutSection];
    objc_claimAutoreleasedReturnValue();
    double v19 = [(_UICollectionLayoutSectionListSolver *)self container];
    [v19 contentInsets];
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;

    if ([(_UICollectionLayoutSectionListSolver *)self layoutAxis] == 2)
    {
      uint64_t v28 = [(_UICollectionLayoutSectionListSolver *)self layoutSection];
      [v28 contentInsets];
      double v30 = v29;

      CGRect v31 = [(_UICollectionLayoutSectionListSolver *)self layoutSection];
      [v31 contentInsets];
      double v23 = v23 + v30;
      double v27 = v27 + v32;
    }
    else if ([(_UICollectionLayoutSectionListSolver *)self layoutAxis] == 1)
    {
      v33 = [(_UICollectionLayoutSectionListSolver *)self layoutSection];
      [v33 contentInsets];
      double v35 = v34;

      CGRect v31 = [(_UICollectionLayoutSectionListSolver *)self layoutSection];
      [v31 contentInsets];
      double v21 = v21 + v35;
      double v25 = v25 + v36;
    }
    else
    {
      CGRect v31 = [MEMORY[0x1E4F28B00] currentHandler];
      [v31 handleFailureInMethod:sel__sectionContainer object:self file:@"_UICollectionLayoutSectionListSolver.mm" lineNumber:872 description:@"Unknown layout axis."];
    }

    v37 = [_UICollectionLayoutContainer alloc];
    CGPoint v38 = [(_UICollectionLayoutSectionListSolver *)self container];
    [v38 contentSize];
    CGRect v129 = -[_UICollectionLayoutContainer initWithContentSize:contentInsets:](v37, v39, v40, v21, v23, v25, v27);

    unint64_t v41 = [_UICollectionLayoutItemSolver alloc];
    v42 = [(_UICollectionLayoutSectionListSolver *)self layoutSection];
    double v43 = [v42 group];
    CGRect v131 = -[_UICollectionLayoutItemSolver initWithItem:](v41, v43);

    double v44 = [(_UICollectionLayoutSectionListSolver *)self traitCollection];
    char v45 = [(_UICollectionLayoutSectionListSolver *)self layoutRTL];
    if (v131) {
      [(_UICollectionLayoutItemSolver *)(uint64_t)v131 _solveForContainer:v130 layoutAxis:v44 traitCollection:0x7FFFFFFFFFFFFFFFLL maxFrameCount:v45 layoutRTL:0 preferredSizes:0 largestKnownItemSize:*MEMORY[0x1E4F1DB30] solutionRecursionDepth:*(double *)(MEMORY[0x1E4F1DB30] + 8)];
    }

    double v46 = -[_UICollectionLayoutItemSolver itemFrames]((uint64_t)v131);
    uint64_t v47 = [v46 count];

    if (v47 != 1)
    {
      CGPoint v126 = [MEMORY[0x1E4F28B00] currentHandler];
      [v126 handleFailureInMethod:sel__initialSolve, self, @"_UICollectionLayoutSectionListSolver.mm", 564, @"Invalid parameter not satisfying: %@", @"solution.itemFrames.count == 1" object file lineNumber description];
    }
    v48 = -[_UICollectionLayoutItemSolver itemFrames]((uint64_t)v131);
    v49 = [v48 objectAtIndexedSubscript:0];

    if (v49)
    {
      CGFloat v51 = v49[8];
      CGFloat v50 = v49[9];
      double v52 = v49[10];
      double v53 = v49[11];
    }
    else
    {
      CGFloat v50 = 0.0;
      double v52 = 0.0;
      double v53 = 0.0;
      CGFloat v51 = 0.0;
    }
    -[_UICollectionLayoutItemSolver layoutFrame]((uint64_t)v131);
    double v55 = v54;
    double v57 = v56;
    _UISizeValueForAxis(v130, v52, v53);
    _UISizeValueForAxis(v130, v55, v57);
    CGRect v127 = -[_UICollectionLayoutItemSolver auxillaryFrames]((uint64_t)v131);
    id v138 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v133 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v161 = 0u;
    long long v162 = 0u;
    long long v159 = 0u;
    long long v160 = 0u;
    id obj = v127;
    uint64_t v58 = [obj countByEnumeratingWithState:&v159 objects:v165 count:16];
    if (!v58)
    {
LABEL_35:

      [(_UICollectionLayoutSectionListSolver *)v132 frameCount];
      [v133 count];
      [v138 count];
      v66 = [(_UICollectionLayoutSectionListSolver *)v132 layoutSection];
      [v66 interGroupSpacing];

      v156 = 0;
      unint64_t v157 = 0;
      v158 = 0;
      std::vector<_UIAuxillarySolveResult>::reserve(&v156, [v133 count]);
      v153 = 0;
      v154 = 0;
      v155 = 0;
      std::vector<_UIAuxillarySolveResult>::reserve(&v153, [v138 count]);
      long long v151 = 0u;
      long long v152 = 0u;
      long long v149 = 0u;
      long long v150 = 0u;
      id v135 = v133;
      uint64_t v67 = [v135 countByEnumeratingWithState:&v149 objects:v164 count:16];
      if (v67)
      {
        uint64_t v68 = *(void *)v150;
        do
        {
          uint64_t v69 = 0;
          do
          {
            if (*(void *)v150 != v68) {
              objc_enumerationMutation(v135);
            }
            v70 = *(void **)(*((void *)&v149 + 1) + 8 * v69);
            if (v70)
            {
              uint64_t v72 = v70[8];
              uint64_t v71 = v70[9];
              uint64_t v74 = v70[10];
              uint64_t v73 = v70[11];
              uint64_t v75 = v70[2];
            }
            else
            {
              uint64_t v75 = 0;
              uint64_t v73 = 0;
              uint64_t v74 = 0;
              uint64_t v71 = 0;
              uint64_t v72 = 0;
            }
            unint64_t v76 = v157;
            if (v157 >= (unint64_t)v158)
            {
              unint64_t v78 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v157 - (void)v156) >> 4);
              unint64_t v79 = v78 + 1;
              if (v78 + 1 > 0x555555555555555) {
                abort();
              }
              if (0x5555555555555556 * ((v158 - v156) >> 4) > v79) {
                unint64_t v79 = 0x5555555555555556 * ((v158 - v156) >> 4);
              }
              if (0xAAAAAAAAAAAAAAABLL * ((v158 - v156) >> 4) >= 0x2AAAAAAAAAAAAAALL) {
                unint64_t v80 = 0x555555555555555;
              }
              else {
                unint64_t v80 = v79;
              }
              CGRect v144 = &v158;
              v81 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<_UIAuxillarySolveResult>>(v80);
              uint64_t v83 = v82;
              CGFloat v84 = &v81[48 * v78];
              *((void *)v84 + 5) = 0;
              *(void *)CGFloat v84 = v72;
              *((void *)v84 + 1) = v71;
              *((void *)v84 + 2) = v74;
              *((void *)v84 + 3) = v73;
              *((void *)v84 + 4) = v75;
              objc_storeStrong((id *)v84 + 5, v70);
              uint64_t v86 = v156;
              CGFloat v85 = (char *)v157;
              if ((char *)v157 == v156)
              {
                uint64_t v86 = (char *)v157;
                unint64_t v88 = v84;
              }
              else
              {
                unint64_t v87 = v157;
                unint64_t v88 = v84;
                do
                {
                  long long v89 = *(_OWORD *)(v87 - 48);
                  long long v90 = *(_OWORD *)(v87 - 32);
                  *((void *)v88 - 2) = *(void *)(v87 - 16);
                  *((_OWORD *)v88 - 3) = v89;
                  *((_OWORD *)v88 - 2) = v90;
                  uint64_t v91 = *(void *)(v87 - 8);
                  *(void *)(v87 - 8) = 0;
                  *((void *)v88 - 1) = v91;
                  v88 -= 48;
                  v87 -= 48;
                }
                while ((char *)v87 != v86);
              }
              int64_t v77 = v84 + 48;
              v156 = v88;
              unint64_t v157 = (unint64_t)v77;
              double v92 = v158;
              v158 = &v81[48 * v83];
              CGRect v142 = v85;
              CGRect v143 = v92;
              CGRect v140 = v86;
              CGRect v141 = v86;
              std::__split_buffer<_UIAuxillarySolveResult>::~__split_buffer((uint64_t)&v140);
            }
            else
            {
              *(void *)(v157 + 40) = 0;
              *(void *)unint64_t v76 = v72;
              *(void *)(v76 + 8) = v71;
              *(void *)(v76 + 16) = v74;
              *(void *)(v76 + 24) = v73;
              *(void *)(v76 + 32) = v75;
              objc_storeStrong((id *)(v76 + 40), v70);
              int64_t v77 = (char *)(v76 + 48);
            }
            unint64_t v157 = (unint64_t)v77;
            ++v69;
          }
          while (v69 != v67);
          uint64_t v93 = [v135 countByEnumeratingWithState:&v149 objects:v164 count:16];
          uint64_t v67 = v93;
        }
        while (v93);
      }

      long long v147 = 0u;
      long long v148 = 0u;
      long long v145 = 0u;
      long long v146 = 0u;
      id v134 = v138;
      uint64_t v94 = [v134 countByEnumeratingWithState:&v145 objects:v163 count:16];
      if (v94)
      {
        uint64_t v95 = *(void *)v146;
        do
        {
          uint64_t v96 = 0;
          do
          {
            if (*(void *)v146 != v95) {
              objc_enumerationMutation(v134);
            }
            v97 = *(void **)(*((void *)&v145 + 1) + 8 * v96);
            if (v97)
            {
              uint64_t v99 = v97[8];
              uint64_t v98 = v97[9];
              uint64_t v101 = v97[10];
              uint64_t v100 = v97[11];
              uint64_t v102 = v97[2];
            }
            else
            {
              uint64_t v102 = 0;
              uint64_t v100 = 0;
              uint64_t v101 = 0;
              uint64_t v98 = 0;
              uint64_t v99 = 0;
            }
            v103 = v154;
            if (v154 >= v155)
            {
              unint64_t v105 = 0xAAAAAAAAAAAAAAABLL * ((v154 - v153) >> 4);
              unint64_t v106 = v105 + 1;
              if (v105 + 1 > 0x555555555555555) {
                abort();
              }
              if (0x5555555555555556 * ((v155 - v153) >> 4) > v106) {
                unint64_t v106 = 0x5555555555555556 * ((v155 - v153) >> 4);
              }
              if (0xAAAAAAAAAAAAAAABLL * ((v155 - v153) >> 4) >= 0x2AAAAAAAAAAAAAALL) {
                unint64_t v107 = 0x555555555555555;
              }
              else {
                unint64_t v107 = v106;
              }
              CGRect v144 = &v155;
              unint64_t v108 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<_UIAuxillarySolveResult>>(v107);
              uint64_t v110 = v109;
              v111 = &v108[48 * v105];
              *((void *)v111 + 5) = 0;
              *(void *)v111 = v99;
              *((void *)v111 + 1) = v98;
              *((void *)v111 + 2) = v101;
              *((void *)v111 + 3) = v100;
              *((void *)v111 + 4) = v102;
              objc_storeStrong((id *)v111 + 5, v97);
              v113 = v153;
              double v112 = v154;
              if (v154 == v153)
              {
                v113 = v154;
                v115 = v111;
              }
              else
              {
                double v114 = v154;
                v115 = v111;
                do
                {
                  long long v116 = *((_OWORD *)v114 - 3);
                  long long v117 = *((_OWORD *)v114 - 2);
                  *((void *)v115 - 2) = *((void *)v114 - 2);
                  *((_OWORD *)v115 - 3) = v116;
                  *((_OWORD *)v115 - 2) = v117;
                  uint64_t v118 = *((void *)v114 - 1);
                  *((void *)v114 - 1) = 0;
                  *((void *)v115 - 1) = v118;
                  v115 -= 48;
                  v114 -= 48;
                }
                while (v114 != v113);
              }
              double v104 = v111 + 48;
              v153 = v115;
              v154 = v111 + 48;
              v119 = v155;
              v155 = &v108[48 * v110];
              CGRect v142 = v112;
              CGRect v143 = v119;
              CGRect v140 = v113;
              CGRect v141 = v113;
              std::__split_buffer<_UIAuxillarySolveResult>::~__split_buffer((uint64_t)&v140);
            }
            else
            {
              *((void *)v154 + 5) = 0;
              *(void *)v103 = v99;
              *((void *)v103 + 1) = v98;
              *((void *)v103 + 2) = v101;
              *((void *)v103 + 3) = v100;
              *((void *)v103 + 4) = v102;
              objc_storeStrong((id *)v103 + 5, v97);
              double v104 = v103 + 48;
            }
            v154 = v104;
            ++v96;
          }
          while (v96 != v94);
          uint64_t v120 = [v134 countByEnumeratingWithState:&v145 objects:v163 count:16];
          uint64_t v94 = v120;
        }
        while (v120);
      }

      v168.origin.double x = v51;
      v168.origin.double y = v50;
      v168.size.CGFloat width = v52;
      v168.size.CGFloat height = v53;
      CGFloat MinX = CGRectGetMinX(v168);
      v169.origin.double x = v51;
      v169.origin.double y = v50;
      v169.size.CGFloat width = v52;
      v169.size.CGFloat height = v53;
      CGFloat MinY = CGRectGetMinY(v169);
      v170.origin.double x = -[_UICollectionLayoutItemSolver layoutFrame]((uint64_t)v131);
      v171.origin.double x = MinX;
      v171.origin.double y = MinY;
      v171.size.CGFloat width = v52;
      v171.size.CGFloat height = v53;
      CGRectUnion(v170, v171);
      operator new();
    }
    uint64_t v59 = *(void *)v160;
LABEL_23:
    uint64_t v60 = 0;
    while (1)
    {
      if (*(void *)v160 != v59) {
        objc_enumerationMutation(obj);
      }
      double v61 = *(void **)(*((void *)&v159 + 1) + 8 * v60);
      double v62 = -[_UICollectionLayoutFramesQueryResult auxillaryItem](v61);
      if (!v62)
      {
        v65 = [MEMORY[0x1E4F28B00] currentHandler];
        [v65 handleFailureInMethod:sel__initialSolve, v132, @"_UICollectionLayoutSectionListSolver.mm", 584, @"Invalid parameter not satisfying: %@", @"auxilaryItem" object file lineNumber description];
      }
      if (!v61) {
        goto LABEL_33;
      }
      uint64_t v63 = v61[7];
      v64 = v138;
      if (v63 == 4) {
        goto LABEL_32;
      }
      if (v63 == 3) {
        break;
      }
LABEL_33:

      if (v58 == ++v60)
      {
        uint64_t v58 = [obj countByEnumeratingWithState:&v159 objects:v165 count:16];
        if (!v58) {
          goto LABEL_35;
        }
        goto LABEL_23;
      }
    }
    v64 = v133;
LABEL_32:
    [v64 addObject:v61];
    goto LABEL_33;
  }
  if (a8)
  {
    -[_UICollectionPreferredSizes indexes]((uint64_t)a8);
    id v139 = (id)objc_claimAutoreleasedReturnValue();
    double v123 = [_UICollectionLayoutSolveParameters alloc];
    v124 = -[_UICollectionLayoutSolveParameters initWithInvalidatedIndexes:scrollOffset:visibleBounds:]((id *)&v123->super.isa, v139, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    id v125 = -[_UICollectionLayoutSectionListSolver _resolveWithParameters:](self, (uint64_t)v124);
  }
}

- (NSCollectionLayoutSection)layoutSection
{
  return self->_layoutSection;
}

- (NSCollectionLayoutContainer)container
{
  return self->_container;
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

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (BOOL)layoutRTL
{
  return self->_layoutRTL;
}

- (id)auxillaryHostAuxillaryItems
{
  v2 = [(_UICollectionLayoutSectionListSolver *)self layoutSection];
  uint64_t v3 = [v2 boundarySupplementaryItems];

  return v3;
}

- (void)setPreferredSizes:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 96), a2);
  }
}

- (_UICollectionLayoutSolveResult)_resolveWithParameters:(void *)a1
{
  if (a1)
  {
    if (a1[2] == a1[1])
    {
      uint64_t v63 = [MEMORY[0x1E4F28B00] currentHandler];
      [v63 handleFailureInMethod:sel__resolveWithParameters_, a1, @"_UICollectionLayoutSectionListSolver.mm", 647, @"Invalid parameter not satisfying: %@", @"_regions.size()" object file lineNumber description];
    }
    int v4 = -[UIBarButtonItemGroup _items]((id *)a2);
    unint64_t v5 = objc_alloc_init(_UICollectionLayoutSolveResult);
    if (a2
      && (*(unsigned char *)(a2 + 24) || [*(id *)(a2 + 8) count] || objc_msgSend(*(id *)(a2 + 16), "count")))
    {
      if (v5) {
        [(NSMutableIndexSet *)v5->_invalidatedIndexes addIndexes:v4];
      }
      v71[0] = MEMORY[0x1E4F143A8];
      v71[1] = 3221225472;
      v71[2] = __63___UICollectionLayoutSectionListSolver__resolveWithParameters___block_invoke;
      v71[3] = &unk_1E52DAEF0;
      v71[4] = a1;
      [v4 enumerateIndexesUsingBlock:v71];
      if ([v4 count])
      {
        unint64_t v6 = [v4 firstIndex];
        uint64_t v8 = a1[1];
        uint64_t v7 = a1[2];
        uint64_t v9 = v7 - v8;
        if (v7 - v8 <= 151)
        {
          v64 = [MEMORY[0x1E4F28B00] currentHandler];
          [v64 handleFailureInMethod:sel__recomputeRegionOffsetsStartingAtFrameIndex_, a1, @"_UICollectionLayoutSectionListSolver.mm", 806, @"Invalid parameter not satisfying: %@", @"regionCount > 0" object file lineNumber description];

          uint64_t v8 = a1[1];
          uint64_t v7 = a1[2];
        }
        uint64_t v10 = v7 - v8;
        if (!v10
          || (uint64_t v11 = -[_UICollectionLayoutSectionListSolver _regionIndexForFrameIndex:startRegionIndex:endRegionIndex:]((uint64_t)a1, v6, -1 - 0x79435E50D79435E5 * (v10 >> 3)), v11 == 0x7FFFFFFFFFFFFFFFLL))
        {
          double v12 = [MEMORY[0x1E4F28B00] currentHandler];
          [v12 handleFailureInMethod:sel__recomputeRegionOffsetsStartingAtFrameIndex_, a1, @"_UICollectionLayoutSectionListSolver.mm", 810, @"Invalid parameter not satisfying: %@", @"regionIndex != NSNotFound" object file lineNumber description];

          uint64_t v8 = a1[1];
          uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
        }
        uint64_t v13 = v11 - (v11 > 0);
        double v14 = (CGFloat *)(v8 + 152 * v13);
        double v15 = v14[2];
        v14 += 2;
        double v65 = v15;
        CGFloat v16 = v14[6];
        CGFloat v17 = v14[7];
        CGFloat v18 = v14[8];
        CGFloat v19 = v14[9];
        v73.origin.CGFloat x = v16;
        v73.origin.CGFloat y = v17;
        v73.size.CGFloat width = v18;
        v73.size.CGFloat height = v19;
        double Height = CGRectGetHeight(v73);
        uint64_t v20 = v8 + 152 * v13;
        double v21 = *(double *)(v20 + 24);
        unint64_t v22 = *(void *)(v20 + 8);
        v74.origin.CGFloat x = v16;
        v74.origin.CGFloat y = v17;
        v74.size.CGFloat width = v18;
        v74.size.CGFloat height = v19;
        CGFloat MinX = CGRectGetMinX(v74);
        CGFloat v24 = *v14;
        v75.origin.CGFloat x = v16;
        v75.origin.CGFloat y = v17;
        v75.size.CGFloat width = v18;
        v75.size.CGFloat height = v19;
        v76.size.CGFloat width = CGRectGetWidth(v75);
        v76.size.CGFloat height = (Height + v21) * (double)v22;
        v76.origin.CGFloat x = MinX;
        v76.origin.CGFloat y = v24;
        double v25 = CGRectGetHeight(v76);
        int64_t v26 = 0x86BCA1AF286BCA1BLL * (v9 >> 3);
        int64_t v27 = v13 + 1;
        if (v13 + 1 < v26)
        {
          double v28 = v65 + v25;
          uint64_t v29 = 152 * v13 + 160;
          do
          {
            uint64_t v30 = a1[1] + v29;
            double v66 = v28;
            *(double *)(v30 + 8) = v28;
            CGFloat v31 = *(double *)(v30 + 56);
            CGFloat v32 = *(double *)(v30 + 64);
            CGFloat v33 = *(double *)(v30 + 72);
            CGFloat v34 = *(double *)(v30 + 80);
            v77.origin.CGFloat x = v31;
            v77.origin.CGFloat y = v32;
            v77.size.CGFloat width = v33;
            v77.size.CGFloat height = v34;
            double v69 = CGRectGetHeight(v77);
            double v35 = *(double *)(v30 + 16);
            unint64_t v36 = *(void *)v30;
            v78.origin.CGFloat x = v31;
            v78.origin.CGFloat y = v32;
            v78.size.CGFloat width = v33;
            v78.size.CGFloat height = v34;
            CGFloat v37 = CGRectGetMinX(v78);
            CGFloat v38 = *(double *)(v30 + 8);
            v79.origin.CGFloat x = v31;
            v79.origin.CGFloat y = v32;
            v79.size.CGFloat width = v33;
            v79.size.CGFloat height = v34;
            v80.size.CGFloat width = CGRectGetWidth(v79);
            v80.size.CGFloat height = (v69 + v35) * (double)v36;
            v80.origin.CGFloat x = v37;
            v80.origin.CGFloat y = v38;
            double v28 = v66 + CGRectGetHeight(v80);
            ++v27;
            v29 += 152;
          }
          while (v27 < v26);
        }
      }
      double v39 = [a1 layoutSection];
      [v39 interGroupSpacing];
      double v70 = v40;

      uint64_t v41 = a1[1];
      uint64_t v42 = -1 - 0x79435E50D79435E5 * ((a1[2] - v41) >> 3);
      double v43 = (double *)(v41 + 152 * v42);
      CGFloat v44 = v43[8];
      CGFloat v45 = v43[9];
      CGFloat v46 = v43[10];
      CGFloat v47 = v43[11];
      v81.origin.CGFloat x = v44;
      v81.origin.CGFloat y = v45;
      v81.size.CGFloat width = v46;
      v81.size.CGFloat height = v47;
      double v67 = CGRectGetHeight(v81);
      uint64_t v48 = v41 + 152 * v42;
      double v49 = *(double *)(v48 + 24);
      unint64_t v50 = *(void *)(v48 + 8);
      v82.origin.CGFloat x = v44;
      v82.origin.CGFloat y = v45;
      v82.size.CGFloat width = v46;
      v82.size.CGFloat height = v47;
      CGFloat v51 = CGRectGetMinX(v82);
      CGFloat v52 = *(double *)(v41 + 152 * v42 + 16);
      v83.origin.CGFloat x = v44;
      v83.origin.CGFloat y = v45;
      v83.size.CGFloat width = v46;
      v83.size.CGFloat height = v47;
      double Width = CGRectGetWidth(v83);
      if ((uint64_t)a1[19] < 1)
      {
        double v54 = 0.0;
      }
      else
      {
        v84.size.CGFloat width = Width;
        v84.size.CGFloat height = (v67 + v49) * (double)v50;
        v84.origin.CGFloat x = v51;
        v84.origin.CGFloat y = v52;
        double v54 = CGRectGetMaxY(v84) - v70;
      }
      double v55 = [a1 container];
      [v55 effectiveContentSize];
      double v57 = v56;
      double v59 = v58;

      double v60 = _UISetSizeValueForAxis(a1[17], v57, v59, v54);
      [(_UICollectionLayoutSectionListSolver *)(uint64_t)a1 _solveSectionAuxiliariesWithSectionContentSize:v61];
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  return v5;
}

- (void)_solveSectionAuxiliariesWithSectionContentSize:(double)a3
{
  unint64_t v6 = [_UICollectionLayoutSectionGeometryTranslator alloc];
  double v7 = *MEMORY[0x1E4F1DB30];
  double v8 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  uint64_t v9 = [(id)a1 containerLayoutAxis];
  int v10 = *(unsigned __int8 *)(a1 + 41);
  id v41 = [(id)a1 layoutSection];
  [v41 contentInsets];
  double v15 = -[_UICollectionLayoutSectionGeometryTranslator initWithPrimaryContentSize:sectionAuxiliarySolutionSize:layoutAxis:layoutRTL:sectionInsets:contentFrameSupplementaryOffset:](v6, v9, v10 != 0, a2, a3, v7, v8, v11, v12, v13, v14, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  CGFloat v16 = *(void **)(a1 + 80);
  *(void *)(a1 + 80) = v15;

  CGFloat v17 = objc_alloc_init(_UICollectionLayoutSupplementaryEnroller);
  CGFloat v18 = *(void **)(a1 + 72);
  *(void *)(a1 + 72) = v17;

  uint64_t v19 = -[_UICollectionLayoutAuxillaryItemSolver initWithAuxillaryHost:]([_UICollectionLayoutAuxillaryItemSolver alloc], (void *)a1);
  uint64_t v20 = *(void **)(a1 + 64);
  *(void *)(a1 + 64) = v19;

  double v21 = *(double **)(a1 + 64);
  if (v21 && (v21[18] != 0.0 || v21[20] != 0.0 || v21[19] != 0.0 || v21[21] != 0.0))
  {
    double v22 = v21[14];
    double v23 = v21[15];
    CGFloat v24 = [_UICollectionLayoutSectionGeometryTranslator alloc];
    uint64_t v25 = [(id)a1 containerLayoutAxis];
    int v26 = *(unsigned __int8 *)(a1 + 41);
    id v42 = [(id)a1 layoutSection];
    [v42 contentInsets];
    double v28 = v27;
    double v30 = v29;
    double v32 = v31;
    double v34 = v33;
    double v35 = (double *)*(id *)(a1 + 64);
    unint64_t v36 = v35;
    if (v35)
    {
      double v38 = v35[16];
      double v37 = v35[17];
    }
    else
    {
      double v37 = 0.0;
      double v38 = 0.0;
    }
    double v39 = -[_UICollectionLayoutSectionGeometryTranslator initWithPrimaryContentSize:sectionAuxiliarySolutionSize:layoutAxis:layoutRTL:sectionInsets:contentFrameSupplementaryOffset:](v24, v25, v26 != 0, a2, a3, v22, v23, v28, v30, v32, v34, v38, v37);
    double v40 = *(void **)(a1 + 80);
    *(void *)(a1 + 80) = v39;
  }
}

- (unint64_t)containerLayoutAxis
{
  return self->_containerLayoutAxis;
}

- (CGVector)orthogonalScrollingPrefetchingUnitVector
{
  dCGFloat x = self->_orthogonalScrollingPrefetchingUnitVector.dx;
  dCGFloat y = self->_orthogonalScrollingPrefetchingUnitVector.dy;
  result.dCGFloat y = dy;
  result.dCGFloat x = dx;
  return result;
}

- (CGPoint)orthogonalOffset
{
  double x = self->_orthogonalOffset.x;
  double y = self->_orthogonalOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setTraitCollection:(id)a3
{
}

- (void)setSupplementaryContainer:(id)a3
{
}

- (void)setLayoutRTL:(BOOL)a3
{
  self->_layoutRTL = a3;
}

- (void)setLayoutAxis:(unint64_t)a3
{
  self->_layoutAxis = a3;
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

- (double)auxillaryHostPaddingBeforeBoundarySupplementaries
{
  v2 = self->_layoutSection;
  double v3 = 0.0;
  if (objc_opt_respondsToSelector())
  {
    [(NSCollectionLayoutSection *)v2 _paddingToBoundarySupplementaries];
    double v3 = v4;
  }

  return v3;
}

- (NSIndexSet)pinnedSupplementaryIndexes
{
  if (self)
  {
    unint64_t sectionAuxillarySolution = self->_sectionAuxillarySolution;
    if (sectionAuxillarySolution) {
      unint64_t sectionAuxillarySolution = (_UICollectionLayoutAuxillaryItemSolver *)sectionAuxillarySolution->_pinnedSupplementaryIndexes;
    }
  }
  else
  {
    unint64_t sectionAuxillarySolution = 0;
  }
  double v3 = sectionAuxillarySolution;
  return (NSIndexSet *)v3;
}

- (void)updatePinnedSupplementaryItemsWithVisibleBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v8 = objc_alloc_init(_UICollectionLayoutSupplementaryEnroller);
  uint64_t v9 = v8;
  if (self)
  {
    objc_storeStrong((id *)&self->_sectionSupplementaryEnroller, v8);

    unint64_t sectionAuxillarySolution = self->_sectionAuxillarySolution;
  }
  else
  {

    unint64_t sectionAuxillarySolution = 0;
  }
  -[_UICollectionLayoutAuxillaryItemSolver resolveSupplementaryItemsForVisibleBounds:]((id *)&sectionAuxillarySolution->super.isa, x, y, width, height);
}

- (BOOL)auxillaryHostWantsOverlapAdjustmentForMatchingAlignmentsOnly
{
  return !CGRectIsNull(self->_overrideContentRectForPinning);
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
    CGFloat height = 0.0;
    if (self)
    {
      sectionGeometryTranslator = self->_sectionGeometryTranslator;
      CGFloat width = 0.0;
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
      CGFloat width = 0.0;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_supplementaryContainer, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_layoutSection, 0);
  objc_storeStrong((id *)&self->_preferredSizes, 0);
  objc_storeStrong((id *)&self->_memoizedAuxillaryHostContainer, 0);
  objc_storeStrong((id *)&self->_sectionGeometryTranslator, 0);
  objc_storeStrong((id *)&self->_sectionSupplementaryEnroller, 0);
  objc_storeStrong((id *)&self->_sectionAuxillarySolution, 0);
  objc_storeStrong((id *)&self->_solution, 0);
  objc_storeStrong((id *)&self->_errorDescription, 0);
  value = (void **)self->_templateItemSolveResult.__ptr_.__value_;
  self->_templateItemSolveResult.__ptr_.__value_ = 0;
  if (value) {
    std::default_delete<_UIItemSolveResult>::operator()[abi:nn180100](value);
  }
  begin = self->_regions.__begin_;
  if (begin)
  {
    end = (void **)self->_regions.__end_;
    unint64_t v6 = self->_regions.__begin_;
    if (end != (void **)begin)
    {
      do
      {
        end -= 19;
        std::__destroy_at[abi:nn180100]<_UIRegionSolveResult,0>(end);
      }
      while (end != (void **)begin);
      unint64_t v6 = self->_regions.__begin_;
    }
    self->_regions.__end_ = begin;
    operator delete(v6);
  }
}

- (_NSRange)preferredSizeGroupingRangeForItemAtIndex:(int64_t)a3
{
  NSUInteger v3 = 0x7FFFFFFFFFFFFFFFLL;
  NSUInteger v4 = 0;
  result.length = v4;
  result.location = v3;
  return result;
}

- (id)unpinnedSectionSupplementaryFrameForIndex:(int64_t)a3
{
  if (self) {
    unint64_t sectionAuxillarySolution = self->_sectionAuxillarySolution;
  }
  else {
    unint64_t sectionAuxillarySolution = 0;
  }
  double v7 = sectionAuxillarySolution;
  double v8 = -[_UICollectionLayoutAuxillaryItemSolver unpinnedFramesOfPinnedSupplementaries](v7);

  if (v8)
  {
    double v9 = -[_UICollectionLayoutAuxillaryItemSolver unpinnedFramesOfPinnedSupplementaries](v7);
    unint64_t v10 = [v9 count];

    if (v10 <= a3)
    {
      double v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:a2, self, @"_UICollectionLayoutSectionListSolver.mm", 523, @"Invalid parameter not satisfying: %@", @"index < sectionAuxillarySolution.unpinnedFramesOfPinnedSupplementaries.count" object file lineNumber description];

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
      CGRect v12 = [v11 objectAtIndexedSubscript:a3];

      goto LABEL_9;
    }
LABEL_13:
    double v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"_UICollectionLayoutSectionListSolver.mm", 524, @"Invalid parameter not satisfying: %@", @"self.sectionGeometryTranslator" object file lineNumber description];

    goto LABEL_7;
  }
  CGRect v12 = [(_UICollectionLayoutSectionListSolver *)self sectionSupplementaryFrameForIndex:a3];
LABEL_9:

  return v12;
}

- (void)solveForContainer:(id)a3 traitCollection:(id)a4 layoutAxis:(unint64_t)a5 frameCount:(int64_t)a6
{
  LOBYTE(v6) = 0;
  [(_UICollectionLayoutSectionListSolver *)self solveForContainer:a3 supplementaryContainer:0 traitCollection:a4 layoutAxis:a5 frameCount:a6 preferredSizes:0 layoutRTL:v6];
}

- (void)solveForContainer:(id)a3 traitCollection:(id)a4 layoutAxis:(unint64_t)a5 frameCount:(int64_t)a6 preferredSizes:(id)a7
{
  LOBYTE(v7) = 0;
  [(_UICollectionLayoutSectionListSolver *)self solveForContainer:a3 supplementaryContainer:0 traitCollection:a4 layoutAxis:a5 frameCount:a6 preferredSizes:a7 layoutRTL:v7];
}

- (void)updatePinnedSupplementaryItemsWithVisibleBounds:(CGRect)a3 overrideContentRectForPinning:(CGRect)a4
{
  self->_overrideContentRectForPinning = a4;
  -[_UICollectionLayoutSectionListSolver updatePinnedSupplementaryItemsWithVisibleBounds:](self, "updatePinnedSupplementaryItemsWithVisibleBounds:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  CGSize v5 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
  self->_overrideContentRectForPinning.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
  self->_overrideContentRectForPinning.size = v5;
}

- (id)queryFramesIntersectingRect:(CGRect)a3
{
  return -[_UICollectionLayoutSectionListSolver _queryFramesIntersectingRect:frameOffset:]((uint64_t)self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
}

- (id)visualDescription
{
  v28[2] = *MEMORY[0x1E4F143B8];
  NSUInteger v3 = [(_UICollectionLayoutSectionListSolver *)self container];
  [v3 contentSize];
  double v5 = v4;
  uint64_t v6 = [(_UICollectionLayoutSectionListSolver *)self container];
  [v6 contentSize];
  double v8 = v7;

  [(_UICollectionLayoutSectionListSolver *)self contentFrameIncludingAuxiliaries];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  double v13 = [(_UICollectionLayoutSectionListSolver *)self layoutSection];
  [v13 contentInsets];
  double v15 = v14;
  CGFloat v16 = [(_UICollectionLayoutSectionListSolver *)self layoutSection];
  [v16 contentInsets];
  double v18 = v17;

  uint64_t v19 = -[_UICollectionLayoutSectionListSolver _queryFramesIntersectingRect:frameOffset:]((uint64_t)self, 0.0, 0.0, v10, v12, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  uint64_t v20 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", 0.0, 0.0, v5, v8);
  double v21 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v15, v18, v10, v12);
  v28[0] = v20;
  v28[1] = v21;
  double v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
  double v23 = [v19 valueForKey:@"frame"];
  CGFloat v24 = [v22 arrayByAddingObjectsFromArray:v23];

  uint64_t v25 = [[_UIASCIIArtFramesRenderer alloc] initWithFrames:v24];
  int v26 = [(_UIASCIIArtFramesRenderer *)v25 description];

  return v26;
}

- (id)unpinnedSectionSupplementaryFrameWithKind:(id)a3 forIndex:(int64_t)a4
{
  if (a3 && [a3 length])
  {
    if ((a4 & 0x8000000000000000) == 0) {
      goto LABEL_4;
    }
LABEL_10:
    CGFloat v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"_UICollectionLayoutSectionListSolver.mm", 503, @"Invalid parameter not satisfying: %@", @"index >= 0" object file lineNumber description];

    if (self) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
  double v11 = [MEMORY[0x1E4F28B00] currentHandler];
  [v11 handleFailureInMethod:a2, self, @"_UICollectionLayoutSectionListSolver.mm", 502, @"Invalid parameter not satisfying: %@", @"kind != nil && kind.length > 0" object file lineNumber description];

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
  double v9 = -[_UICollectionLayoutAuxillaryItemSolver unpinnedSupplementaryFrameWithKind:index:]((id *)&sectionAuxillarySolution->super.isa, a3, a4);
  return v9;
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
    [v8 handleFailureInMethod:a2, self, @"_UICollectionLayoutSectionListSolver.mm", 530, @"Invalid parameter not satisfying: %@", @"enrollmentIdentifier" object file lineNumber description];

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
LABEL_10:
    CGFloat v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"_UICollectionLayoutSectionListSolver.mm", 537, @"Invalid parameter not satisfying: %@", @"index>=0" object file lineNumber description];

    if (!self) {
      goto LABEL_11;
    }
    goto LABEL_4;
  }
  double v11 = [MEMORY[0x1E4F28B00] currentHandler];
  [v11 handleFailureInMethod:a2, self, @"_UICollectionLayoutSectionListSolver.mm", 536, @"Invalid parameter not satisfying: %@", @"kind.length" object file lineNumber description];

  if (a4 < 0) {
    goto LABEL_10;
  }
LABEL_3:
  if (!self) {
    goto LABEL_11;
  }
LABEL_4:
  if (self->_sectionGeometryTranslator)
  {
LABEL_5:
    unint64_t sectionAuxillarySolution = self->_sectionAuxillarySolution;
    goto LABEL_6;
  }
LABEL_11:
  double v13 = [MEMORY[0x1E4F28B00] currentHandler];
  [v13 handleFailureInMethod:a2, self, @"_UICollectionLayoutSectionListSolver.mm", 538, @"Invalid parameter not satisfying: %@", @"self.sectionGeometryTranslator" object file lineNumber description];

  if (self) {
    goto LABEL_5;
  }
  unint64_t sectionAuxillarySolution = 0;
LABEL_6:
  double v9 = -[_UICollectionLayoutAuxillaryItemSolver supplementaryFrameWithKind:index:]((id *)&sectionAuxillarySolution->super.isa, a3, a4);
  return v9;
}

- (void)setOrthogonalOffset:(CGPoint)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3.x, a3.y);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2 object:self file:@"_UICollectionLayoutSectionListSolver.mm" lineNumber:1061 description:@"Orthogonal support is unsupported for List solver."];
}

- (double)_dimensionForRootGroupAlongAxis:(unint64_t)a3
{
  id v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"_UICollectionLayoutSectionListSolver.mm" lineNumber:1066 description:@"Orthogonal support is unsupported for List solver."];

  return 0.0;
}

- (BOOL)shouldAdjustContentSizeForPartialLastGroupSolution
{
  return self->_shouldAdjustContentSizeForPartialLastGroupSolution;
}

- (void)setShouldAdjustContentSizeForPartialLastGroupSolution:(BOOL)a3
{
  self->_shouldAdjustContentSizeForPartialLastGroupSolution = a3;
}

- (void)setLayoutSection:(id)a3
{
}

- (void)setOrthogonalScrollingPrefetchingUnitVector:(CGVector)a3
{
  self->_orthogonalScrollingPrefetchingUnitVector = a3;
}

@end
@interface _UICollectionLayoutItemSolver
- (BOOL)auxillaryHostShouldLayoutRTL;
- (BOOL)auxillaryHostWantsOverlapAdjustmentForMatchingAlignmentsOnly;
- (CGPoint)auxillaryHostAdditionalFrameOffset;
- (CGRect)auxillaryHostPinningRect;
- (CGSize)auxillaryHostContentSize;
- (NSString)description;
- (double)_additionalDimensionForRequiredEdgeSpacingAlongAxis:(void *)a3 group:(char)a4 trailingEdgeOnly:;
- (double)_frameOffsetForAdditionalFrameOffset:(uint64_t)a3 repeatOffset:(double)a4 repeatAxis:(double)a5 interSolutionSpacing:(double)a6;
- (double)contentFrame;
- (double)contentSizeForFrameCount:(uint64_t)a3 layoutAxis:;
- (double)layoutFrame;
- (double)offsetForEdgeSpacing;
- (id)_frameForAbsoluteIndex:(uint64_t)a3 additionalFrameOffset:(double)a4 interSolutionSpacing:(double)a5 repeatAxis:(double)a6;
- (id)_queryFramesWithQueryRect:(uint64_t)a3 additionalFrameOffset:(uint64_t)a4 itemIndexOffset:(CGFloat)a5 itemLimit:(CGFloat)a6 supplementaryRepeatOffset:(CGFloat)a7;
- (id)_queryFramesWithQueryRect:(uint64_t)a3 additionalFrameOffset:(uint64_t)a4 itemIndexOffset:(CGFloat)a5 supplementaryOffsets:(CGFloat)a6 itemLimit:(CGFloat)a7;
- (id)_supplementaryFrameWithKind:(uint64_t)a3 absoluteIndex:(uint64_t)a4 additionalFrameOffset:(double)a5 interSolutionSpacing:(double)a6 repeatAxis:(double)a7;
- (id)_supplementaryFrameWithKind:(uint64_t)a3 index:(double)a4 additionalFrameOffset:(double)a5;
- (id)auxillaryFrames;
- (id)auxillaryHostAuxillaryItems;
- (id)auxillaryHostContainer;
- (id)auxillaryHostPreferredSizes;
- (id)auxillaryHostSupplementaryEnroller;
- (id)auxillaryHostTraitCollection;
- (id)copyWithZone:(_NSZone *)a3;
- (id)frameForAbsoluteIndex:(uint64_t)a3 additionalFrameOffset:(double)a4 interSolutionSpacing:(double)a5 repeatAxis:(double)a6;
- (id)initWithItem:(void *)a1;
- (id)initWithItem:(void *)a3 supplementaryEnroller:(void *)a4 container:(void *)a5 layoutAxis:(void *)a6 traitCollection:(void *)a7 maxFrameCount:(char)a8 layoutRTL:(void *)a9 preferredSizes:(void *)a10 solverResult:(void *)a11 solutionRecursionDepth:;
- (id)itemFrames;
- (id)queryFramesApplyingFrameOffset:(double)a3;
- (id)queryFramesWithItemLimit:(void *)a1;
- (id)queryFramesWithQueryRect:(uint64_t)a3 additionalFrameOffset:(uint64_t)a4 itemIndexOffset:(CGFloat)a5 itemLimit:(CGFloat)a6 supplementaryRepeatOffset:(CGFloat)a7;
- (id)queryFramesWithQueryRect:(uint64_t)a3 additionalFrameOffset:(uint64_t)a4 itemIndexOffset:(CGFloat)a5 supplementaryOffsets:(CGFloat)a6 itemLimit:(CGFloat)a7;
- (id)supplementaryFrameWithKind:(uint64_t)a3 absoluteIndex:(uint64_t)a4 additionalFrameOffset:(double)a5 interSolutionSpacing:(double)a6 repeatAxis:(double)a7;
- (id)supplementaryFrameWithKind:(uint64_t)a3 index:(double)a4 additionalFrameOffset:(double)a5;
- (int64_t)auxillaryHostAuxillaryKind;
- (uint64_t)_layoutAxisForGroup:(uint64_t)a1;
- (unint64_t)_arrangeSolutionItems:(void *)a3 alongLayoutAxis:(void *)a4 forContainer:(double)a5 additionalLayoutOffset:(double)a6 interItemSpacing:;
- (unint64_t)auxillaryHostLayoutAxis;
- (void)_enumerateSolutionFramesForQueryRect:(uint64_t)a3 itemLimit:(CGFloat)a4 withHandler:(CGFloat)a5;
- (void)_solveForContainer:(uint64_t)a3 layoutAxis:(void *)a4 traitCollection:(uint64_t)a5 maxFrameCount:(char)a6 layoutRTL:(void *)a7 preferredSizes:(uint64_t)a8 largestKnownItemSize:(double)a9 solutionRecursionDepth:(double)a10;
- (void)_solveSingleItemWithPreferredSize:(double)a3 groupMaxItemSize:(double)a4;
- (void)errorDescription;
- (void)preferredSizeGroupingRanges;
- (void)setSolveResult:(uint64_t)a1;
- (void)supplementaryOffsets;
@end

@implementation _UICollectionLayoutItemSolver

- (id)frameForAbsoluteIndex:(uint64_t)a3 additionalFrameOffset:(double)a4 interSolutionSpacing:(double)a5 repeatAxis:(double)a6
{
  if (a1)
  {
    a1 = [(_UICollectionLayoutItemSolver *)(uint64_t)a1 _frameForAbsoluteIndex:a3 additionalFrameOffset:a4 interSolutionSpacing:a5 repeatAxis:a6];
    uint64_t v6 = vars8;
  }
  return a1;
}

- (int64_t)auxillaryHostAuxillaryKind
{
  if (self) {
    self = (_UICollectionLayoutItemSolver *)self->_item;
  }
  if ([(_UICollectionLayoutItemSolver *)self isGroup]) {
    return 3;
  }
  else {
    return 4;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supplementaryEnroller, 0);
  objc_storeStrong((id *)&self->_preferredSizes, 0);
  objc_storeStrong((id *)&self->_solveResult, 0);
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

- (id)initWithItem:(void *)a1
{
  if (!a1) {
    return 0;
  }
  v4 = objc_alloc_init(_UICollectionLayoutSupplementaryEnroller);
  v5 = -[_UICollectionLayoutItemSolver initWithItem:supplementaryEnroller:container:layoutAxis:traitCollection:maxFrameCount:layoutRTL:preferredSizes:solverResult:solutionRecursionDepth:](a1, a2, v4, 0, 0, 0, 0, 0, 0, 0, 0);

  return v5;
}

- (void)_solveForContainer:(uint64_t)a3 layoutAxis:(void *)a4 traitCollection:(uint64_t)a5 maxFrameCount:(char)a6 layoutRTL:(void *)a7 preferredSizes:(uint64_t)a8 largestKnownItemSize:(double)a9 solutionRecursionDepth:(double)a10
{
  uint64_t v349 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  if (a5 < 0)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:sel__solveForContainer_layoutAxis_traitCollection_maxFrameCount_layoutRTL_preferredSizes_largestKnownItemSize_solutionRecursionDepth_, a1, @"_UICollectionLayoutItemSolver.m", 552, @"Invalid parameter not satisfying: %@", @"maxFrameCount >= 0" object file lineNumber description];

    if (a7) {
      goto LABEL_4;
    }
  }
  else if (a7)
  {
LABEL_4:
    v19 = a7;
    goto LABEL_7;
  }
  v19 = objc_alloc_init(_UICollectionPreferredSizes);
LABEL_7:
  v21 = *(void **)(a1 + 56);
  *(void *)(a1 + 56) = v19;

  objc_storeStrong((id *)(a1 + 24), a2);
  *(void *)(a1 + 88) = a3;
  objc_storeStrong((id *)(a1 + 32), a4);
  uint64_t v22 = a1;
  v24 = (id *)(a1 + 48);
  v23 = *(void **)(a1 + 48);
  *(unsigned char *)(a1 + 8) = a6;
  *(void *)(a1 + 72) = a8;
  *(void *)(a1 + 80) = a5;
  *(double *)(a1 + 96) = a9;
  *(double *)(a1 + 104) = a10;
  *(void *)(a1 + 48) = 0;

  if (!a8)
  {
    v25 = objc_alloc_init(_UICollectionLayoutSupplementaryEnroller);
    v26 = *(void **)(a1 + 64);
    *(void *)(a1 + 64) = v25;
  }
  if (![*(id *)(a1 + 16) isGroup])
  {
    v56 = -[_UICollectionPreferredSizes objectAtIndexedSubscript:](*(void *)(a1 + 56), 0);
    [(_UICollectionLayoutItemSolver *)a1 _solveSingleItemWithPreferredSize:*(double *)(a1 + 96) groupMaxItemSize:*(double *)(a1 + 104)];

    v24 = (id *)(a1 + 48);
    goto LABEL_223;
  }
  if ([*(id *)(a1 + 16) hasCustomGroupItemProvider])
  {
    if (![*(id *)(a1 + 16) isGroup]) {
      goto LABEL_223;
    }
    v269 = (id *)(a1 + 48);
    id v27 = *(id *)(a1 + 16);
    [*(id *)(a1 + 32) displayScale];
    double v29 = v28;
    v30 = [*(id *)(a1 + 16) size];
    [v30 _effectiveSizeForContainer:*(void *)(a1 + 24) displayScale:1 ignoringInsets:v29];
    double v32 = v31;
    double v34 = v33;

    v35 = [_UICollectionLayoutContainer alloc];
    [*(id *)(a1 + 16) _effectiveContentInsets];
    v40 = -[_UICollectionLayoutContainer initWithContentSize:contentInsets:](v35, v32, v34, v36, v37, v38, v39);
    v41 = [[_UICollectionLayoutEnvironment alloc] initWithContainer:v40 traitCollection:*(void *)(a1 + 32) dataSourceSnapshot:0];
    v42 = [v27 customGroupItemProvider];
    v43 = ((void (**)(void, _UICollectionLayoutEnvironment *))v42)[2](v42, v41);

    id v44 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v45 = (id *)-[_UICollectionLayoutAuxillaryItemSolver initWithAuxillaryHost:]([_UICollectionLayoutAuxillaryItemSolver alloc], (void *)a1);
    v46 = -[_UICollectionLayoutAuxillaryItemSolver supplementaryFrames](v45);
    aBlocuint64_t k = MEMORY[0x1E4F143A8];
    uint64_t v340 = 3221225472;
    v341 = __66___UICollectionLayoutItemSolver__solveWithCustomGroupItemProvider__block_invoke;
    v342 = &unk_1E52E14B0;
    id v47 = v44;
    id v343 = v47;
    [v46 enumerateObjectsUsingBlock:&aBlock];

    buf.receiver = 0;
    buf.super_class = (Class)&buf;
    uint64_t v315 = 0x4010000000;
    v316 = &unk_186D7DBA7;
    long long v48 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
    v317[0] = *MEMORY[0x1E4F1DB28];
    v317[1] = v48;
    v346[0] = MEMORY[0x1E4F143A8];
    v346[1] = 3221225472;
    v346[2] = __66___UICollectionLayoutItemSolver__solveWithCustomGroupItemProvider__block_invoke_2;
    v346[3] = &unk_1E52E1358;
    p_objc_super buf = &buf;
    v346[4] = a1;
    id v49 = v47;
    id v347 = v49;
    [v43 enumerateObjectsUsingBlock:v346];
    v50 = [_UICollectionLayoutItemSolverState alloc];
    v51 = (void *)[v43 count];
    v52 = -[_UICollectionLayoutAuxillaryItemSolver supplementaryFrames](v45);
    v53 = (void *)[v52 count];
    v54 = -[_UICollectionLayoutItemSolverState initWithSolutionFrames:itemFrameCount:supplementaryFrameCount:solvedFittingFrame:preferredSizeGroupingRanges:additionalOffsetForOutermostGroup:errorDescription:](v50, v49, v51, v53, MEMORY[0x1E4F1CBF0], 0, *((double *)buf.super_class + 4), *((double *)buf.super_class + 5), *((double *)buf.super_class + 6), *((double *)buf.super_class + 7), *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));

    v55 = *(void **)(a1 + 48);
    *(void *)(a1 + 48) = v54;

    _Block_object_dispose(&buf, 8);
    goto LABEL_222;
  }
  v269 = (id *)(a1 + 48);
  id v57 = *(id *)(a1 + 16);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v257 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v22 = a1;
    [v257 handleFailureInMethod:sel__solveGroup object:a1 file:@"_UICollectionLayoutItemSolver.m" lineNumber:636 description:@"Cannot solve for a non-group item."];
  }
  id v59 = *(id *)(v22 + 16);
  id v60 = *(id *)(v22 + 24);
  id v280 = *(id *)(v22 + 32);
  id v61 = *(id *)(v22 + 64);
  id v292 = *(id *)(v22 + 72);
  [v60 contentInsets];
  v270 = v60;
  [v60 contentSize];
  v62 = *(char **)(v22 + 88);
  v279 = v59;
  uint64_t v63 = -[_UICollectionLayoutItemSolver _layoutAxisForGroup:](v22, v59);
  if (v63 == 1) {
    uint64_t v64 = 2;
  }
  else {
    uint64_t v64 = v63 == 2;
  }
  int v277 = *(unsigned __int8 *)(v22 + 8);
  v276 = v62;
  uint64_t v282 = v63;
  if (v63)
  {
    if (v62) {
      goto LABEL_21;
    }
  }
  else
  {
    v258 = [MEMORY[0x1E4F28B00] currentHandler];
    [v258 handleFailureInMethod:sel__solveGroup object:a1 file:@"_UICollectionLayoutItemSolver.m" lineNumber:649 description:@"No valid layout axis detected."];

    if (v276) {
      goto LABEL_21;
    }
  }
  v259 = [MEMORY[0x1E4F28B00] currentHandler];
  [v259 handleFailureInMethod:sel__solveGroup object:a1 file:@"_UICollectionLayoutItemSolver.m" lineNumber:650 description:@"No valid layout axis detected."];

LABEL_21:
  v65 = [v59 size];
  int v268 = [v65 _isEstimatedForAxis:v282];

  v66 = [v279 interItemSpacing];
  [v66 spacing];
  double v266 = v67;

  [v280 displayScale];
  double v69 = v68;
  v70 = [v279 size];
  [v70 _effectiveSizeForContainer:v270 displayScale:0 ignoringInsets:v69];
  double v72 = v71;
  double v74 = v73;

  if (*(void *)(a1 + 72)) {
    goto LABEL_37;
  }
  v75 = [v279 edgeSpacing];
  if ([v75 _hasSpacing])
  {
    if (v276 == (char *)2)
    {
      v77 = [v75 top];
      if ([v77 isFlexibleSpacing])
      {
      }
      else
      {
        v81 = [v75 bottom];
        int v82 = [v81 isFlexibleSpacing];

        if (!v82) {
          goto LABEL_36;
        }
      }
      v80 = *(NSObject **)(__UILogGetCategoryCachedImpl("CollectionLayout", &qword_1EB25F4C0) + 8);
      if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf.receiver) = 0;
        goto LABEL_35;
      }
    }
    else if (v276 == (char *)1)
    {
      v76 = [v75 leading];
      if ([v76 isFlexibleSpacing])
      {
      }
      else
      {
        v78 = [v75 trailing];
        int v79 = [v78 isFlexibleSpacing];

        if (!v79) {
          goto LABEL_36;
        }
      }
      v80 = *(NSObject **)(__UILogGetCategoryCachedImpl("CollectionLayout", &_MergedGlobals_987) + 8);
      if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf.receiver) = 0;
LABEL_35:
        _os_log_impl(&dword_1853B0000, v80, OS_LOG_TYPE_ERROR, "A NSCollectionLayoutGroup has specified flexible edge spacing along primary layout axis; flexible spacing will"
          " be ignored but any required spacing will be applied.",
          (uint8_t *)&buf,
          2u);
      }
    }
  }
LABEL_36:

LABEL_37:
  uint64_t v274 = [v279 count];
  [v279 _effectiveContentInsets];
  if (v84 >= 0.5) {
    double v87 = 1.0;
  }
  else {
    double v87 = v72;
  }
  double v88 = v84 * v87;
  if (v86 >= 0.5) {
    double v89 = 1.0;
  }
  else {
    double v89 = v72;
  }
  double v90 = v86 * v89;
  if (v83 >= 0.5) {
    double v91 = 1.0;
  }
  else {
    double v91 = v74;
  }
  double v92 = v83 * v91;
  if (v85 >= 0.5) {
    double v93 = 1.0;
  }
  else {
    double v93 = v74;
  }
  v267 = -[_UICollectionLayoutContainer initWithContentSize:contentInsets:]([_UICollectionLayoutContainer alloc], v72, v74, v92, v88, v85 * v93, v90);
  [v267 effectiveContentSize];
  double v264 = v95;
  double v265 = v94;
  double v96 = _UISizeValueForAxis(v282, v94, v95);
  char v97 = v268;
  if (v96 > 0.0) {
    char v97 = 1;
  }
  double v262 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  double v263 = *MEMORY[0x1E4F1DB30];
  BOOL v98 = v74 == v262 && v72 == *MEMORY[0x1E4F1DB30];
  if (v98 || (v97 & 1) == 0)
  {
    v161 = (void *)MEMORY[0x1E4F28E78];
    [v270 contentInsets];
    v162 = NSStringFromDirectionalEdgeInsets(v354);
    [v270 contentSize];
    v163 = NSStringFromCGSize(v352);
    v164 = [v161 stringWithFormat:@"There is no room for this NSCollectionLayoutGroup to fit into its parent group or section, or it has no room for any subitems itself. Inspect the parent and ensure the contentInsets (%@) do not result in a negative effectiveContentSize when applied to size: %@.", v162, v163];

    [v279 contentInsets];
    if (v168 != 0.0 || v165 != 0.0 || v167 != 0.0 || v166 != 0.0)
    {
      [v279 contentInsets];
      v169 = NSStringFromDirectionalEdgeInsets(v355);
      v353.double height = v264;
      v353.double width = v265;
      v170 = NSStringFromCGSize(v353);
      [v164 appendFormat:@"\nAlso ensure that the group's contentInsets (%@) leave space for its subitems after being applied to the group's effective size (%@).", v169, v170];
    }
    v171 = [v279 _externalDescription];
    [v164 appendFormat:@"\nGroup: %@", v171];

    v172 = [_UICollectionLayoutItemSolverState alloc];
    v173 = -[_UICollectionLayoutItemSolverState initWithSolutionFrames:itemFrameCount:supplementaryFrameCount:solvedFittingFrame:preferredSizeGroupingRanges:additionalOffsetForOutermostGroup:errorDescription:](v172, MEMORY[0x1E4F1CBF0], 0, 0, MEMORY[0x1E4F1CBF0], v164, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24), *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
    objc_storeStrong(v269, v173);
  }
  else
  {
    uint64_t v261 = *(void *)(a1 + 80);
    v281 = [v279 subitems];
    double v99 = fabs(v266);
    double v322 = v96;
    uint64_t v332 = 0x1000000;
    uint64_t v323 = v261;
    long long v324 = 0u;
    long long v325 = 0u;
    long long v326 = 0u;
    v327 = (id *)objc_opt_new();
    v328 = objc_opt_new();
    id v329 = (id)objc_opt_new();
    v100 = v267;
    v330 = v100;
    id v331 = (id)objc_opt_new();
    id v333 = 0;
    do
    {
      if (!BYTE3(v332) || v323 < 1) {
        break;
      }
      v102 = [v281 objectAtIndexedSubscript:(void)v326];
      v103 = [_UICollectionLayoutItemSolver alloc];
      v287 = v102;
      if (v103) {
        obuint64_t j = -[_UICollectionLayoutItemSolver initWithItem:supplementaryEnroller:container:layoutAxis:traitCollection:maxFrameCount:layoutRTL:preferredSizes:solverResult:solutionRecursionDepth:](v103, v102, v61, 0, 0, 0, 0, 0, 0, 0, 0);
      }
      else {
        obuint64_t j = 0;
      }
      uint64_t v104 = -[_UICollectionPreferredSizes preferredSizesApplyingFrameOffset:supplementaryBaseOffsets:](*(void **)(a1 + 56), *((uint64_t *)&v326 + 1), v327);
      [(_UICollectionLayoutItemSolver *)obj _solveForContainer:v276 layoutAxis:v280 traitCollection:v323 maxFrameCount:v277 != 0 layoutRTL:v104 preferredSizes:*(void *)(a1 + 72) + 1 largestKnownItemSize:*(double *)(a1 + 96) solutionRecursionDepth:*(double *)(a1 + 104)];
      id v285 = (id)v104;
      v105 = -[_UICollectionLayoutItemSolver errorDescription](obj);
      BOOL v106 = v105 == 0;

      if (v106)
      {
        v275 = [v287 layoutSize];
        uint64_t v111 = [v275 _containerSizeDependentAxes];
        v112 = obj;
        if (obj)
        {
          v112 = obj[6];
          if (v112) {
            v112 = (void *)v112[7];
          }
        }
        if ((uint64_t)v112 >= v323) {
          v112 = (void *)v323;
        }
        uint64_t v272 = v111 & v282;
        v273 = v112;
        BOOL v114 = (v111 & v282) == v282 && BYTE2(v332) == 0;
        if (v99 >= 2.22044605e-16 && [v331 count] && !v114) {
          double v322 = v322 - v266;
        }
        -[_UICollectionLayoutItemSolver layoutFrame]((uint64_t)obj);
        double v118 = _UISizeValueForAxis(v282, v116, v117);
        double v322 = v322 - v118;
        v119 = obj;
        if (obj) {
          v119 = (id *)obj[2];
        }
        v120 = v119;
        v121 = [v120 edgeSpacing];
        [v121 edgeOutsets];
        double v123 = v122;
        double v125 = v124;
        double v127 = v126;
        double v129 = v128;

        double v130 = _UITotalEdgeDimensionsForLayoutAxis(v282, v123, v125, v127, v129);
        double v131 = v322 - v130;
        double v322 = v131;
        if (v274 <= 0)
        {
          if (v131 >= -0.25) {
            char v137 = 1;
          }
          else {
            char v137 = v268;
          }
          BYTE3(v332) = v137;
          if ((v137 & 1) == 0)
          {
            uint64_t v138 = [v331 count];
            if (!obj || v138 || !*((unsigned char *)obj + 9)) {
              goto LABEL_88;
            }
            BYTE3(v332) = 1;
          }
        }
        else
        {
LABEL_88:
          if (!BYTE3(v332))
          {
            if (![v331 count])
            {
              v132 = NSString;
              v351.double height = v264;
              v351.double width = v265;
              v133 = NSStringFromCGSize(v351);
              v134 = [v279 _externalDescription];
              v135 = [v132 stringWithFormat:@"NSCollectionLayoutItem created with invalid combination of spacing and size specified. This group cannot fit even a single item. Inspect the spacing and size of the items in this group and ensure that they fit into the group when its effective size is %@.\nGroup: %@", v133, v134];
              id v136 = v333;
              id v333 = v135;

              int v110 = 9;
              goto LABEL_131;
            }
LABEL_124:
            int v110 = 0;
            if (!WORD1(v332) && BYTE1(v332) && v99 >= 2.22044605e-16)
            {
              if ((unint64_t)[v331 count] < 2)
              {
                int v110 = 0;
              }
              else
              {
                double v157 = _UISetSizeValueForAxis(v282, v263, v262, -v266 * (double)(unint64_t)([v331 count] - 1));
                v133 = -[_UICollectionLayoutContainer initWithContentSize:contentInsets:]([_UICollectionLayoutContainer alloc], v265 + v157, v264 + v158, 0.0, 0.0, 0.0, 0.0);
                double v322 = v96;
                uint64_t v323 = v261;
                long long v324 = 0u;
                long long v325 = 0u;
                long long v326 = 0u;
                if (v327) {
                  [v327[1] removeAllObjects];
                }
                [v328 removeAllObjects];
                [v329 removeAllIndexes];
                objc_storeStrong((id *)&v330, v133);
                [v331 removeAllObjects];
                LODWORD(v332) = 0x1000000;
                id v159 = v333;
                id v333 = 0;

                int v110 = 0;
                BYTE2(v332) = 1;
LABEL_131:
              }
            }

            goto LABEL_138;
          }
        }
        v139 = [_UICollectionSolutionGroupArrangementItem alloc];
        if (v139
          && (buf.receiver = v139,
              buf.super_class = (Class)_UICollectionSolutionGroupArrangementItem,
              v140 = (id *)objc_msgSendSuper2(&buf, sel_init),
              (v141 = v140) != 0))
        {
          objc_storeStrong(v140 + 1, obj);
          double v142 = -[_UICollectionLayoutItemSolver layoutFrame]((uint64_t)obj);
          v143 = v141;
          *((double *)v141 + 2) = v142;
          v141[3] = v144;
          v141[4] = v145;
          v141[5] = v146;
        }
        else
        {
          v143 = 0;
        }
        v271 = v143;
        objc_msgSend(v331, "addObject:");
        long long v320 = 0u;
        long long v321 = 0u;
        long long v318 = 0u;
        long long v319 = 0u;
        v147 = -[_UICollectionLayoutItemSolver preferredSizeGroupingRanges](obj);
        uint64_t v148 = [v147 countByEnumeratingWithState:&v318 objects:v346 count:16];
        if (v148)
        {
          uint64_t v149 = *(void *)v319;
          do
          {
            for (uint64_t i = 0; i != v148; ++i)
            {
              if (*(void *)v319 != v149) {
                objc_enumerationMutation(v147);
              }
              uint64_t v151 = [*(id *)(*((void *)&v318 + 1) + 8 * i) rangeValue];
              v152 = v328;
              v154 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", (void)v324 + v151, v153);
              [v152 addObject:v154];
            }
            uint64_t v148 = [v147 countByEnumeratingWithState:&v318 objects:v346 count:16];
          }
          while (v148);
        }

        if (([v287 isGroup] & 1) == 0)
        {
          objc_msgSend(v329, "addIndex:", objc_msgSend(v331, "count") - 1);
          if (!(_BYTE)v332) {
            LOBYTE(v332) = [v275 _axesUniformAcrossSiblings] != 0;
          }
        }
        if (!BYTE1(v332)) {
          BYTE1(v332) = v272 == v282;
        }
        *(void *)&long long v326 = v326 + 1;
        unint64_t v155 = v326;
        if (v155 >= [v281 count])
        {
          *(void *)&long long v326 = 0;
          ++*((void *)&v325 + 1);
        }
        *((void *)&v326 + 1) += v273;
        v323 -= (uint64_t)v273;
        *(void *)&long long v324 = (char *)v273 + v324;
        v156 = obj;
        if (obj)
        {
          v156 = (id *)obj[6];
          if (v156) {
            v156 = (id *)v156[8];
          }
        }
        *((void *)&v324 + 1) += v156;
        if (v274 < 1)
        {
          int v160 = v268;
          if (*((uint64_t *)&v325 + 1) <= 0) {
            int v160 = 0;
          }
          if (v160 == 1) {
LABEL_122:
          }
            BYTE3(v332) = 0;
        }
        else
        {
          *(void *)&long long v325 = v325 + 1;
          if ((uint64_t)v325 >= v274) {
            goto LABEL_122;
          }
        }

        goto LABEL_124;
      }
      if (!obj)
      {
        v108 = 0;
LABEL_142:
        v109 = 0;
        goto LABEL_67;
      }
      id v107 = obj[6];
      v108 = v107;
      if (!v107) {
        goto LABEL_142;
      }
      v109 = (void *)*((void *)v107 + 10);
LABEL_67:
      objc_storeStrong(&v333, v109);

      BYTE3(v332) = 0;
      int v110 = 9;
LABEL_138:
    }
    while (!v110);
    if ((_BYTE)v332)
    {
      id v174 = v329;
      buf.receiver = (id)MEMORY[0x1E4F143A8];
      buf.super_class = (Class)3254779904;
      uint64_t v315 = (uint64_t)__44___UICollectionLayoutItemSolver__solveGroup__block_invoke;
      v316 = &__block_descriptor_152_e8_32n41_8_8_t0w64_s64_s72_s80_s88_s96_t104w4_s112_e24_v32__0__NSRange_QQ_8_B24l;
      __copy_constructor_8_8_t0w64_s64_s72_s80_s88_s96_t104w4_s112((uint64_t)v317, (id *)&v322);
      [v174 enumerateRangesUsingBlock:&buf];
      __destructor_8_s64_s72_s80_s88_s96_s112((uint64_t)v317);
    }
    if (v292 || *(void *)(a1 + 72))
    {
      double v176 = *MEMORY[0x1E4F1DAD8];
      double v175 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      goto LABEL_154;
    }
    v234 = [v279 edgeSpacing];
    if (([v234 _hasSpacing] & 1) != 0 && (unint64_t)(v276 - 1) < 2)
    {
      aBlocuint64_t k = MEMORY[0x1E4F143A8];
      uint64_t v340 = 3221225472;
      v341 = __107___UICollectionLayoutItemSolver__outerContainerOffsetForGroup_groupComputedSize_container_outerLayoutAxis___block_invoke;
      v342 = &unk_1E52E1380;
      id v343 = v270;
      double v344 = v72;
      double v345 = v74;
      objb = (double (**)(id, uint64_t))_Block_copy(&aBlock);
      *(void *)v337 = MEMORY[0x1E4F143A8];
      *(void *)&v337[8] = 3221225472;
      *(void *)&v337[16] = __107___UICollectionLayoutItemSolver__outerContainerOffsetForGroup_groupComputedSize_container_outerLayoutAxis___block_invoke_2;
      *(void *)&v337[24] = &unk_1E52E13A8;
      id v235 = v234;
      *(void *)&v337[32] = v235;
      v236 = (uint64_t (**)(void *, uint64_t))_Block_copy(v337);
      *(void *)&v336.a = MEMORY[0x1E4F143A8];
      *(void *)&v336.b = 3221225472;
      *(void *)&v336.c = __107___UICollectionLayoutItemSolver__outerContainerOffsetForGroup_groupComputedSize_container_outerLayoutAxis___block_invoke_3;
      *(void *)&v336.d = &unk_1E52E13D0;
      id v237 = v235;
      *(void *)&v336.tdouble x = v237;
      v238 = (void (**)(void *, uint64_t))_Block_copy(&v336);
      if (v276 == (char *)1) {
        uint64_t v239 = 2;
      }
      else {
        uint64_t v239 = v276 == (char *)2;
      }
      uint64_t v240 = v236[2](v236, v239);
      double v241 = objb[2](objb, v239);
      v238[2](v238, v239);
      if (v240 < 1) {
        double v243 = 0.0;
      }
      else {
        double v243 = (v241 - v242) / (double)v240;
      }
      if (v276 == (char *)2)
      {
        v252 = [v237 top];
        [v252 spacing];
        double v175 = v253;

        v250 = [v237 leading];
        [v250 spacing];
        double v255 = v254;
        v256 = [v237 leading];
        if (![v256 isFlexibleSpacing]) {
          double v243 = 0.0;
        }

        double v176 = v255 + v243;
LABEL_245:
      }
      else
      {
        if (v276 == (char *)1)
        {
          v244 = [v237 top];
          [v244 spacing];
          double v246 = v245;
          v247 = [v237 top];
          int v248 = [v247 isFlexibleSpacing];

          v249 = [v237 leading];
          v250 = v249;
          if (!v248) {
            double v243 = 0.0;
          }
          [v249 spacing];
          double v176 = v251;
          double v175 = v246 + v243;
          goto LABEL_245;
        }
        double v176 = *MEMORY[0x1E4F1DAD8];
        double v175 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      }
    }
    else
    {
      double v176 = *MEMORY[0x1E4F1DAD8];
      double v175 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    }

LABEL_154:
    id v177 = v331;
    v178 = [v279 interItemSpacing];
    -[_UICollectionLayoutItemSolver _arrangeSolutionItems:alongLayoutAxis:forContainer:additionalLayoutOffset:interItemSpacing:](v177, v282, v100, v178, v176, v175);

    long long v312 = 0u;
    long long v313 = 0u;
    long long v310 = 0u;
    long long v311 = 0u;
    id v179 = v331;
    uint64_t v180 = [v179 countByEnumeratingWithState:&v310 objects:&aBlock count:16];
    if (v180)
    {
      uint64_t v181 = *(void *)v311;
      do
      {
        for (uint64_t j = 0; j != v180; ++j)
        {
          if (*(void *)v311 != v181) {
            objc_enumerationMutation(v179);
          }
          uint64_t v338 = *(void *)(*((void *)&v310 + 1) + 8 * j);
          v183 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v338 count:1];
          -[_UICollectionLayoutItemSolver _arrangeSolutionItems:alongLayoutAxis:forContainer:additionalLayoutOffset:interItemSpacing:](v183, v64, v100, 0, v176, v175);
        }
        uint64_t v180 = [v179 countByEnumeratingWithState:&v310 objects:&aBlock count:16];
      }
      while (v180);
    }

    if (v277 && ([v279 ignoresRTL] & 1) == 0)
    {
      id v184 = v331;
      if (([*(id *)(a1 + 16) isGroup] & 1) == 0)
      {
        v260 = [MEMORY[0x1E4F28B00] currentHandler];
        [v260 handleFailureInMethod:sel__transformGroupArrangementItemsForRTL_, a1, @"_UICollectionLayoutItemSolver.m", 1249, @"Invalid parameter not satisfying: %@", @"self.item.isGroup" object file lineNumber description];
      }
      if (([*(id *)(a1 + 16) ignoresRTL] & 1) == 0)
      {
        [*(id *)(a1 + 32) displayScale];
        double v186 = v185;
        v187 = [*(id *)(a1 + 16) size];
        [v187 _effectiveSizeForContainer:*(void *)(a1 + 24) displayScale:0 ignoringInsets:v186];
        CGFloat v189 = v188;

        memset(&v336, 0, sizeof(v336));
        CGAffineTransformMakeTranslation(&v336, v189, 0.0);
        memset(&v335, 0, sizeof(v335));
        *(CGAffineTransform *)v337 = v336;
        CGAffineTransformScale(&v335, (CGAffineTransform *)v337, -1.0, 1.0);
        [*(id *)(a1 + 16) isCustomGroup];
        *(void *)v337 = MEMORY[0x1E4F143A8];
        *(void *)&v337[8] = 3221225472;
        *(void *)&v337[16] = __71___UICollectionLayoutItemSolver__transformGroupArrangementItemsForRTL___block_invoke;
        *(void *)&v337[24] = &__block_descriptor_80_e58_v32__0___UICollectionSolutionGroupArrangementItem_8Q16_B24l;
        *(CGAffineTransform *)&v337[32] = v335;
        [v184 enumerateObjectsUsingBlock:v337];
      }
    }
    v278 = (id *)-[_UICollectionLayoutAuxillaryItemSolver initWithAuxillaryHost:]([_UICollectionLayoutAuxillaryItemSolver alloc], (void *)a1);
    v283 = -[_UICollectionLayoutAuxillaryItemSolver supplementaryFrames](v278);
    uint64_t v190 = [v283 count];
    *((void *)&v324 + 1) += v190;
    if (!v292)
    {
      long long v308 = 0u;
      long long v309 = 0u;
      long long v306 = 0u;
      long long v307 = 0u;
      id v191 = v283;
      uint64_t v192 = [v191 countByEnumeratingWithState:&v306 objects:v337 count:16];
      if (v192)
      {
        uint64_t v193 = *(void *)v307;
        do
        {
          for (uint64_t k = 0; k != v192; ++k)
          {
            if (*(void *)v307 != v193) {
              objc_enumerationMutation(v191);
            }
            v195 = *(void **)(*((void *)&v306 + 1) + 8 * k);
            if (v195) {
              v195 = (void *)v195[6];
            }
            v196 = v195;
            -[_UICollectionLayoutSupplementaryEnroller commitEnrollment:]((uint64_t)v61, (uint64_t)v196);
          }
          uint64_t v192 = [v191 countByEnumeratingWithState:&v306 objects:v337 count:16];
        }
        while (v192);
      }
    }
    id obja = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:v283];
    long long v304 = 0u;
    long long v305 = 0u;
    long long v302 = 0u;
    long long v303 = 0u;
    id v286 = v331;
    uint64_t v197 = [v286 countByEnumeratingWithState:&v302 objects:&v336 count:16];
    double x = *MEMORY[0x1E4F1DB28];
    double y = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double width = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double height = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    if (v197)
    {
      uint64_t v288 = *(void *)v303;
      do
      {
        uint64_t v202 = 0;
        do
        {
          if (*(void *)v303 != v288) {
            objc_enumerationMutation(v286);
          }
          uint64_t v203 = *(void *)(*((void *)&v302 + 1) + 8 * v202);
          if (v203)
          {
            id v204 = *(id *)(v203 + 8);
            double v205 = *(double *)(v203 + 16);
            double v206 = *(double *)(v203 + 24);
          }
          else
          {
            id v204 = 0;
            double v206 = 0.0;
            double v205 = 0.0;
          }
          v207 = [(_UICollectionLayoutItemSolver *)(uint64_t)v204 queryFramesApplyingFrameOffset:v206];

          [obja addObjectsFromArray:v207];
          if (!v292)
          {
            long long v300 = 0u;
            long long v301 = 0u;
            long long v298 = 0u;
            long long v299 = 0u;
            id v208 = v207;
            uint64_t v209 = [v208 countByEnumeratingWithState:&v298 objects:&v335 count:16];
            if (v209)
            {
              uint64_t v210 = *(void *)v299;
              do
              {
                for (uint64_t m = 0; m != v209; ++m)
                {
                  if (*(void *)v299 != v210) {
                    objc_enumerationMutation(v208);
                  }
                  uint64_t v212 = *(void *)(*((void *)&v298 + 1) + 8 * m);
                  if (v212 && (*(void *)(v212 + 32) & 0xFFFFFFFFFFFFFFFELL) == 2)
                  {
                    id v213 = *(id *)(v212 + 48);
                    -[_UICollectionLayoutSupplementaryEnroller commitEnrollment:]((uint64_t)v61, (uint64_t)v213);
                  }
                }
                uint64_t v209 = [v208 countByEnumeratingWithState:&v298 objects:&v335 count:16];
              }
              while (v209);
            }
          }
          if (v203)
          {
            uint64_t v214 = *(void *)(v203 + 16);
            uint64_t v215 = *(void *)(v203 + 24);
            uint64_t v216 = *(void *)(v203 + 32);
            uint64_t v217 = *(void *)(v203 + 40);
          }
          else
          {
            uint64_t v215 = 0;
            uint64_t v216 = 0;
            uint64_t v217 = 0;
            uint64_t v214 = 0;
          }
          v356.origin.double x = x;
          v356.origin.double y = y;
          v356.size.double width = width;
          v356.size.double height = height;
          CGRect v357 = CGRectUnion(v356, *(CGRect *)&v214);
          double x = v357.origin.x;
          double y = v357.origin.y;
          double width = v357.size.width;
          double height = v357.size.height;

          ++v202;
        }
        while (v202 != v197);
        uint64_t v218 = [v286 countByEnumeratingWithState:&v302 objects:&v336 count:16];
        uint64_t v197 = v218;
      }
      while (v218);
    }

    if (!v292)
    {
      double v219 = -[_UICollectionLayoutItemSolver _additionalDimensionForRequiredEdgeSpacingAlongAxis:group:trailingEdgeOnly:](*(void *)(a1 + 72), v276, v279, 1);
      double v220 = _UISetSizeValueForAxis((uint64_t)v276, v263, v262, v219);
      double v222 = v221;
      -[_UICollectionLayoutSupplementaryEnroller pruneUncommittedEnrollments]((uint64_t)v61);
      double width = width + v220;
      double height = height + v222;
    }
    long long v296 = 0u;
    long long v297 = 0u;
    long long v294 = 0u;
    long long v295 = 0u;
    id v223 = obja;
    uint64_t v224 = [v223 countByEnumeratingWithState:&v294 objects:v334 count:16];
    if (v224)
    {
      uint64_t v225 = 0;
      uint64_t v226 = *(void *)v295;
      do
      {
        for (uint64_t n = 0; n != v224; ++n)
        {
          if (*(void *)v295 != v226) {
            objc_enumerationMutation(v223);
          }
          uint64_t v228 = *(void *)(*((void *)&v294 + 1) + 8 * n);
          if (v228)
          {
            uint64_t v229 = *(void *)(v228 + 32);
            if (v229 == 1)
            {
              uint64_t v230 = v225++;
LABEL_217:
              *(void *)(v228 + 16) = v230;
              continue;
            }
            if (!v292 && (v229 & 0xFFFFFFFFFFFFFFFELL) == 2)
            {
              id v231 = *(id *)(v228 + 48);
              uint64_t v230 = -[_UICollectionLayoutSupplementaryEnroller kindIndexForEnrollmentIdentifier:]((uint64_t)v61, (uint64_t)v231);

              goto LABEL_217;
            }
          }
        }
        uint64_t v224 = [v223 countByEnumeratingWithState:&v294 objects:v334 count:16];
      }
      while (v224);
    }

    v232 = [_UICollectionLayoutItemSolverState alloc];
    v233 = -[_UICollectionLayoutItemSolverState initWithSolutionFrames:itemFrameCount:supplementaryFrameCount:solvedFittingFrame:preferredSizeGroupingRanges:additionalOffsetForOutermostGroup:errorDescription:](v232, v223, (void *)v324, *((void **)&v324 + 1), v328, v333, x, y, width, height, v176, v175);
    -[_UICollectionLayoutItemSolver setSolveResult:](a1, v233);

    __destructor_8_s64_s72_s80_s88_s96_s112((uint64_t)&v322);
  }

LABEL_222:
  v24 = v269;
LABEL_223:
  if (*v24)
  {
    id v293 = [*(id *)(a1 + 16) size];
    *(void *)(a1 + 40) = [v293 _containerSizeDependentAxes];
  }
}

- (double)layoutFrame
{
  if (a1)
  {
    v2 = *(void **)(a1 + 16);
    id v3 = (id)[v2 size];
    uint64_t v4 = *(void *)(a1 + 24);
    [*(id *)(a1 + 32) displayScale];
    objc_msgSend(v3, "_effectiveSizeForContainer:displayScale:ignoringInsets:", v4, 0);
    double v6 = v5;
    double v8 = v7;
    uint64_t v9 = *(void *)(a1 + 48);
    if (v9 && [v3 isEstimated])
    {
      if ([v2 isGroup])
      {
        +[_UICollectionPreferredSize preferredSizeForOriginalSize:*(double *)(v9 + 120) fittingSize:(uint64_t)_UICollectionPreferredSize layoutSize:v3];
      }
      else
      {
        v10 = -[_UICollectionLayoutItemSolverState itemFrames]((void *)v9);
        if ([v10 count] != 1)
        {
          v16 = [MEMORY[0x1E4F28B00] currentHandler];
          v17 = [v2 _externalDescription];
          [v16 handleFailureInMethod:sel_layoutFrame, a1, @"_UICollectionLayoutItemSolver.m", 411, @"Compositional Layout internal error: Unexpectedly found more than one item frame when computing the layout frame for item %@. Solve result: %@", v17, v9 object file lineNumber description];
        }
        v11 = [v10 objectAtIndexedSubscript:0];
        if (v11) {
          double v12 = v11[10];
        }
        else {
          double v12 = 0.0;
        }
        +[_UICollectionPreferredSize preferredSizeForOriginalSize:v12 fittingSize:(uint64_t)_UICollectionPreferredSize layoutSize:v3];
      }
    }
    if (!*(void *)(a1 + 72))
    {
      if ([v2 isGroup])
      {
        v13 = *(void **)(a1 + 88);
        double v14 = -[_UICollectionLayoutItemSolver _additionalDimensionForRequiredEdgeSpacingAlongAxis:group:trailingEdgeOnly:](*(void *)(a1 + 72), v13, v2, 0);
        if (fabs(v14) >= 2.22044605e-16) {
          _UISetSizeValueForAxis((uint64_t)v13, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8), v14);
        }
      }
    }
  }
  return 0.0;
}

- (double)_additionalDimensionForRequiredEdgeSpacingAlongAxis:(void *)a3 group:(char)a4 trailingEdgeOnly:
{
  double v4 = 0.0;
  if (!a1)
  {
    id v7 = (id)[a3 edgeSpacing];
    if ([v7 _hasSpacing])
    {
      if (a2 == (void *)2)
      {
        if ((a4 & 1) == 0)
        {
          a2 = [v7 top];
          [a2 spacing];
          double v4 = v10;
        }
        uint64_t v9 = [v7 bottom];
      }
      else
      {
        if (a2 != (void *)1) {
          return v4;
        }
        if ((a4 & 1) == 0)
        {
          a2 = [v7 leading];
          [a2 spacing];
          double v4 = v8;
        }
        uint64_t v9 = [v7 trailing];
      }
      v11 = v9;
      [v9 spacing];
      double v4 = v4 + v12;

      if ((a4 & 1) == 0) {
    }
      }
  }
  return v4;
}

- (id)initWithItem:(void *)a3 supplementaryEnroller:(void *)a4 container:(void *)a5 layoutAxis:(void *)a6 traitCollection:(void *)a7 maxFrameCount:(char)a8 layoutRTL:(void *)a9 preferredSizes:(void *)a10 solverResult:(void *)a11 solutionRecursionDepth:
{
  if (!a1) {
    return 0;
  }
  v22.receiver = a1;
  v22.super_class = (Class)_UICollectionLayoutItemSolver;
  v18 = (id *)objc_msgSendSuper2(&v22, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong(v18 + 2, a2);
    objc_storeStrong(v19 + 8, a3);
    objc_storeStrong(v19 + 3, a4);
    v19[11] = a5;
    objc_storeStrong(v19 + 4, a6);
    v19[10] = a7;
    *((unsigned char *)v19 + 8) = a8;
    objc_storeStrong(v19 + 7, a9);
    objc_storeStrong(v19 + 6, a10);
    v19[9] = a11;
    long long v20 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
    *((_OWORD *)v19 + 7) = *MEMORY[0x1E4F1DB20];
    *((_OWORD *)v19 + 8) = v20;
  }
  return v19;
}

- (void)errorDescription
{
  if (a1)
  {
    v2 = (void *)a1[6];
    if (v2) {
      v2 = (void *)v2[10];
    }
    a1 = v2;
    uint64_t v1 = vars8;
  }
  return a1;
}

- (unint64_t)_arrangeSolutionItems:(void *)a3 alongLayoutAxis:(void *)a4 forContainer:(double)a5 additionalLayoutOffset:(double)a6 interItemSpacing:
{
  if (a2 == 1) {
    uint64_t v12 = 2;
  }
  else {
    uint64_t v12 = a2 == 2;
  }
  uint64_t v13 = _UIDirectionalEdgeForPreEdgeOnLayoutAxis(a2);
  uint64_t v14 = _UIDirectionalEdgeForPostEdgeOnLayoutAxis(a2);
  unsigned int v15 = [a4 isFlexibleSpacing];
  [a3 contentInsets];
  double v17 = v16;
  [a3 contentInsets];
  double v18 = a5 + v17;
  double v20 = a6 + v19;
  [a4 spacing];
  double v22 = v21;
  if ([a1 count])
  {
    double v71 = a3;
    uint64_t v72 = v12;
    uint64_t v23 = 0;
    unint64_t v24 = 0;
    double v25 = 0.0;
    do
    {
      v26 = (double *)(id)[a1 objectAtIndexedSubscript:v24];
      id v27 = -[_UICollectionSolutionGroupArrangementItem item](v26);
      id v28 = (id)[v27 edgeSpacing];

      double v29 = 0.0;
      double v30 = 0.0;
      if (v26)
      {
        double v29 = v26[4];
        double v30 = v26[5];
      }
      double v31 = v25 + _UISizeValueForAxis(a2, v29, v30);
      [v28 spacingForEdge:v13];
      double v33 = v32;
      [v28 spacingForEdge:v14];
      double v35 = v31 + v33 + v34;
      uint64_t v36 = v23 + [v28 isSpacingFlexibleForEdge:v13];
      uint64_t v37 = v36 + [v28 isSpacingFlexibleForEdge:v14];
      uint64_t v38 = [a1 count];
      double v39 = -0.0;
      if (v24 != v38 - 1) {
        double v39 = v22;
      }
      double v25 = v35 + v39;
      if (v24 == v38 - 1) {
        uint64_t v40 = 0;
      }
      else {
        uint64_t v40 = v15;
      }
      uint64_t v23 = v37 + v40;
      ++v24;
    }
    while (v24 < [a1 count]);
    if (v23 <= 0)
    {
      double v51 = 0.0;
    }
    else
    {
      [v71 contentInsets];
      double v42 = v41;
      double v44 = v43;
      double v46 = v45;
      double v48 = v47;
      [v71 contentSize];
      double v51 = (_UISizeValueForAxis(a2, v49 - (v44 + v48), v50 - (v42 + v46)) - v25) / (double)v23;
      double v52 = -0.0;
      if (v15) {
        double v52 = v51;
      }
      double v22 = v22 + v52;
    }
    uint64_t v12 = v72;
  }
  else
  {
    double v51 = 0.0;
  }
  double v53 = _UIPointValueForAxis(a2, v18, v20);
  v73[0] = MEMORY[0x1E4F143A8];
  v73[1] = 3221225472;
  double v74 = (double (*)(uint64_t, double *, uint64_t))__124___UICollectionLayoutItemSolver__arrangeSolutionItems_alongLayoutAxis_forContainer_additionalLayoutOffset_interItemSpacing___block_invoke;
  v75 = &__block_descriptor_40_e54_d24__0___UICollectionSolutionGroupArrangementItem_8Q16l;
  double v76 = v51;
  unint64_t result = [a1 count];
  if (result)
  {
    for (unint64_t i = 0; i < result; ++i)
    {
      v56 = (double *)(id)[a1 objectAtIndexedSubscript:i];
      v74((uint64_t)v73, v56, v13);
      double v58 = 0.0;
      double v59 = 0.0;
      double v60 = 0.0;
      if (v56)
      {
        double v60 = v56[2];
        double v59 = v56[3];
      }
      double v61 = v53 + v57;
      double v62 = _UIPointValueForAxis(v12, v60, v59);
      double v63 = _UISetPointValueForAxis(a2, v18, v20, v61);
      double v18 = _UISetPointValueForAxis(v12, v63, v64, v62);
      double v20 = v65;
      double v66 = 0.0;
      if (v56)
      {
        double v66 = v56[4];
        double v58 = v56[5];
        v56[2] = v18;
        v56[3] = v65;
      }
      double v67 = v61 + _UISizeValueForAxis(a2, v66, v58);
      double v68 = v67 + v74((uint64_t)v73, v56, v14);
      uint64_t v69 = [a1 count] - 1;
      double v70 = -0.0;
      if (i != v69) {
        double v70 = v22;
      }
      double v53 = v68 + v70;
      unint64_t result = [a1 count];
    }
  }
  return result;
}

- (void)preferredSizeGroupingRanges
{
  if (a1)
  {
    v2 = (void *)a1[6];
    if (v2) {
      v2 = (void *)v2[9];
    }
    if (!v2) {
      v2 = (void *)MEMORY[0x1E4F1CBF0];
    }
    a1 = v2;
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)queryFramesApplyingFrameOffset:(double)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v4 = *(void *)(a1 + 48);
    if (v4)
    {
      if (*MEMORY[0x1E4F1DAD8] == a2 && *(double *)(MEMORY[0x1E4F1DAD8] + 8) == a3)
      {
        id v8 = *(id *)(v4 + 48);
      }
      else
      {
        id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        uint64_t v9 = *(void **)(a1 + 48);
        if (v9) {
          uint64_t v9 = (void *)v9[6];
        }
        double v10 = v9;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v23;
          do
          {
            uint64_t v14 = 0;
            do
            {
              if (*(void *)v23 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = *(void *)(*((void *)&v22 + 1) + 8 * v14);
              if (v15)
              {
                double v16 = *(void **)(v15 + 16);
                double v17 = *(void **)(v15 + 48);
              }
              else
              {
                double v16 = 0;
                double v17 = 0;
              }
              id v18 = v17;
              double v19 = [(_UICollectionLayoutFramesQueryResult *)(id *)v15 copyWithOffset:v18 index:a2 supplementaryEnrollmentIdentifier:a3];

              objc_msgSend(v8, "addObject:", v19, (void)v22);
              ++v14;
            }
            while (v12 != v14);
            uint64_t v20 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
            uint64_t v12 = v20;
          }
          while (v20);
        }
      }
    }
    else
    {
      id v8 = (id)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    id v8 = 0;
  }
  return v8;
}

- (void)setSolveResult:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 48), a2);
  }
}

- (id)itemFrames
{
  if (a1)
  {
    uint64_t v1 = -[_UICollectionLayoutItemSolverState itemFrames](*(void **)(a1 + 48));
    v2 = (void *)v1;
    id v3 = (void *)MEMORY[0x1E4F1CBF0];
    if (v1) {
      id v3 = (void *)v1;
    }
    id v4 = v3;
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (uint64_t)_layoutAxisForGroup:(uint64_t)a1
{
  uint64_t v2 = a1;
  if (a1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      double v6 = [MEMORY[0x1E4F28B00] currentHandler];
      [v6 handleFailureInMethod:sel__layoutAxisForGroup_ object:v2 file:@"_UICollectionLayoutItemSolver.m" lineNumber:1131 description:@"Must be an item group."];
    }
    if ([a2 isGroup])
    {
      id v4 = a2;
      if ([v4 isVerticalGroup])
      {
        uint64_t v2 = 2;
      }
      else if ([v4 isHorizontalGroup])
      {
        uint64_t v2 = 1;
      }
      else if ([v4 isCustomGroup])
      {
        uint64_t v2 = 2;
      }
      else
      {
        uint64_t v2 = 0;
      }
    }
    else
    {
      return 0;
    }
  }
  return v2;
}

- (id)queryFramesWithQueryRect:(uint64_t)a3 additionalFrameOffset:(uint64_t)a4 itemIndexOffset:(CGFloat)a5 supplementaryOffsets:(CGFloat)a6 itemLimit:(CGFloat)a7
{
  if (a1)
  {
    a1 = -[_UICollectionLayoutItemSolver _queryFramesWithQueryRect:additionalFrameOffset:itemIndexOffset:supplementaryOffsets:itemLimit:]((uint64_t)a1, a2, a3, a4, a5, a6, a7, a8, a9, a10);
    uint64_t v10 = vars8;
  }
  return a1;
}

- (id)_queryFramesWithQueryRect:(uint64_t)a3 additionalFrameOffset:(uint64_t)a4 itemIndexOffset:(CGFloat)a5 supplementaryOffsets:(CGFloat)a6 itemLimit:(CGFloat)a7
{
  if (a1)
  {
    if (a4 < 0)
    {
      long long v22 = [MEMORY[0x1E4F28B00] currentHandler];
      [v22 handleFailureInMethod:sel__queryFramesWithQueryRect_additionalFrameOffset_itemIndexOffset_supplementaryOffsets_itemLimit_, a1, @"_UICollectionLayoutItemSolver.m", 1278, @"Invalid parameter not satisfying: %@", @"itemLimit >= 0" object file lineNumber description];
    }
    if (*(void *)(a1 + 48))
    {
      uint64_t v24 = 0;
      long long v25 = &v24;
      uint64_t v26 = 0x3032000000;
      uint64_t v27 = __Block_byref_object_copy__32;
      id v28 = __Block_byref_object_dispose__32;
      id v29 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __128___UICollectionLayoutItemSolver__queryFramesWithQueryRect_additionalFrameOffset_itemIndexOffset_supplementaryOffsets_itemLimit___block_invoke;
      v23[3] = &unk_1E52E1438;
      v23[7] = a2;
      v23[8] = sel__queryFramesWithQueryRect_additionalFrameOffset_itemIndexOffset_supplementaryOffsets_itemLimit_;
      v23[4] = a3;
      v23[5] = a1;
      *(double *)&v23[9] = a9;
      *(double *)&v23[10] = a10;
      v23[6] = &v24;
      -[_UICollectionLayoutItemSolver _enumerateSolutionFramesForQueryRect:itemLimit:withHandler:](a1, a4, (uint64_t)v23, a5, a6, a7, a8);
      id v20 = (id)v25[5];
      _Block_object_dispose(&v24, 8);
    }
    else
    {
      id v20 = (id)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    id v20 = 0;
  }
  return v20;
}

- (void)_enumerateSolutionFramesForQueryRect:(uint64_t)a3 itemLimit:(CGFloat)a4 withHandler:(CGFloat)a5
{
  if (a2 < 0)
  {
    id v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:sel__enumerateSolutionFramesForQueryRect_itemLimit_withHandler_, a1, @"_UICollectionLayoutItemSolver.m", 1369, @"Invalid parameter not satisfying: %@", @"itemLimit >= 0" object file lineNumber description];

    if (a3) {
      goto LABEL_3;
    }
  }
  else if (a3)
  {
    goto LABEL_3;
  }
  id v29 = [MEMORY[0x1E4F28B00] currentHandler];
  [v29 handleFailureInMethod:sel__enumerateSolutionFramesForQueryRect_itemLimit_withHandler_, a1, @"_UICollectionLayoutItemSolver.m", 1370, @"Invalid parameter not satisfying: %@", @"handler" object file lineNumber description];

LABEL_3:
  uint64_t v10 = *(void *)(a1 + 48);
  if (v10)
  {
    v52.origin.double x = a4;
    v52.size.double width = a6;
    v52.origin.double y = a5;
    v52.size.double height = a7;
    BOOL v11 = CGRectEqualToRect(v52, *MEMORY[0x1E4F1DB28]);
    uint64_t v12 = *(void **)(v10 + 40);
    uint64_t v13 = *(void **)(v10 + 48);
    if (!v12)
    {
      uint64_t v14 = objc_alloc_init(_UIRTree);
      uint64_t v15 = *(void **)(v10 + 48);
      *(void *)&v48.f64[0] = MEMORY[0x1E4F143A8];
      *(void *)&v48.f64[1] = 3221225472;
      *(void *)&v49.f64[0] = __63___UICollectionLayoutItemSolverState__generateGeometricIndexer__block_invoke;
      *(void *)&v49.f64[1] = &unk_1E52E14B0;
      double v16 = v14;
      double v50 = v16;
      [v15 enumerateObjectsUsingBlock:&v48];
      double v17 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = v16;
      id v18 = v16;

      uint64_t v12 = *(void **)(v10 + 40);
    }
    double v19 = v12;

    v47[0] = 0;
    v47[1] = v47;
    v47[2] = 0x2020000000;
    v47[3] = 0;
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    double v35 = (uint64_t (*)(uint64_t, uint64_t, float64x2_t *))__92___UICollectionLayoutItemSolver__enumerateSolutionFramesForQueryRect_itemLimit_withHandler___block_invoke;
    uint64_t v36 = &unk_1E52E1488;
    uint64_t v38 = v47;
    double v39 = v13;
    BOOL v45 = a2 > 0;
    BOOL v46 = v11;
    CGFloat v40 = a4;
    CGFloat v41 = a5;
    CGFloat v42 = a6;
    CGFloat v43 = a7;
    uint64_t v37 = a3;
    uint64_t v44 = a2;
    if (v11) {
      goto LABEL_10;
    }
    v54.origin.double x = -[_UICollectionLayoutItemSolver contentFrame](a1);
    v54.origin.double y = v20;
    v54.size.double width = v21;
    v54.size.double height = v22;
    v53.origin.double x = a4;
    v53.size.double width = a6;
    v53.origin.double y = a5;
    v53.size.double height = a7;
    BOOL v23 = !CGRectContainsRect(v53, v54);
    if (a2 >= 1) {
      LOBYTE(v23) = 0;
    }
    if (v23)
    {
      if (v19)
      {
        v51[0] = 0;
        long long v25 = (void *)v19[1];
        v27.f64[0] = a4;
        v26.f64[0] = a6;
        v27.f64[1] = a5;
        v26.f64[1] = a7;
        float64x2_t v48 = vaddq_f64(v27, vminnmq_f64(v26, (float64x2_t)0));
        float64x2_t v49 = vabsq_f64(v26);
        _UIRTreeContainerNode<unsigned long>::enumerateElementsIntersecting(v25, &v48, v51, (uint64_t)v34);
      }
    }
    else
    {
LABEL_10:
      unint64_t v24 = 0;
      LOBYTE(v48.f64[0]) = 0;
      do
      {
        if (v24 >= [v13 count]) {
          break;
        }
        v35((uint64_t)v34, v24++, &v48);
      }
      while (!LOBYTE(v48.f64[0]));
    }
    _Block_object_dispose(v47, 8);
  }
}

- (double)contentFrame
{
  if (!a1) {
    return 0.0;
  }
  double v2 = -[_UICollectionLayoutItemSolver layoutFrame](a1);
  [*(id *)(a1 + 16) _effectiveContentInsets];
  if (v4 != 0.0 || v3 != 0.0 || v6 != 0.0 || v5 != 0.0) {
    return v2 + v4;
  }
  return v2;
}

- (void)_solveSingleItemWithPreferredSize:(double)a3 groupMaxItemSize:(double)a4
{
  if (a1)
  {
    [*(id *)(a1 + 32) displayScale];
    double v9 = v8;
    uint64_t v10 = [*(id *)(a1 + 16) size];
    [v10 _effectiveSizeForContainer:*(void *)(a1 + 24) displayScale:0 ignoringInsets:v9];
    double v12 = v11;
    double v14 = v13;

    if (a2)
    {
      double v15 = -[_UICollectionPreferredSize fittingSize](a2);
      double v16 = [*(id *)(a1 + 16) size];
      double v12 = +[_UICollectionPreferredSize preferredSizeForOriginalSize:v15 fittingSize:(uint64_t)_UICollectionPreferredSize layoutSize:v16];
      double v14 = v17;
    }
    id v18 = [*(id *)(a1 + 16) layoutSize];
    uint64_t v19 = [v18 _axesUniformAcrossSiblings];

    if ((v19 & (a3 > 0.0)) != 0) {
      double v20 = a3;
    }
    else {
      double v20 = v12;
    }
    if (((a4 > 0.0) & (v19 >> 1)) != 0) {
      double v21 = a4;
    }
    else {
      double v21 = v14;
    }
    if (v19)
    {
      double v14 = v21;
      double v22 = v20;
    }
    else
    {
      double v22 = v12;
    }
    objc_msgSend(*(id *)(a1 + 16), "_effectiveContentInsets", v20, v21);
    double v24 = v23 + 0.0;
    double v26 = v22 - (v25 + v23);
    double v28 = v27 + 0.0;
    *(double *)(a1 + 112) = v23 + 0.0;
    *(double *)(a1 + 120) = v27 + 0.0;
    double v30 = v14 - (v27 + v29);
    *(double *)(a1 + 128) = v26;
    *(double *)(a1 + 136) = v30;
    if (a2) {
      BOOL v31 = *(unsigned char *)(a2 + 48) != 0;
    }
    else {
      BOOL v31 = 0;
    }
    *(unsigned char *)(a1 + 9) = v31;
    id v43 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    double v32 = [(id)a1 auxillaryHostAuxillaryItems];
    double v33 = (void *)[v32 count];

    if (v33)
    {
      double v34 = (id *)-[_UICollectionLayoutAuxillaryItemSolver initWithAuxillaryHost:]([_UICollectionLayoutAuxillaryItemSolver alloc], (void *)a1);
      double v33 = -[_UICollectionLayoutAuxillaryItemSolver supplementaryFrames](v34);
    }
    double v35 = (void *)MEMORY[0x1E4F1CBF0];
    if (v33) {
      double v35 = v33;
    }
    id v36 = v35;

    [v43 addObjectsFromArray:v36];
    uint64_t v37 = [_UICollectionLayoutFramesQueryResult alloc];
    if (v37) {
      uint64_t v38 = -[_UICollectionLayoutFramesQueryResult initWithFrame:adjustedForPinning:index:zIndex:resultKind:item:auxillaryKind:supplementaryEnrollmentIdentifier:]((id *)&v37->super.isa, 0, 0, (void *)0x7FFFFFFFFFFFFFFFLL, (void *)1, *(void **)(a1 + 16), 0, 0, v24, v28, v26, v30);
    }
    else {
      uint64_t v38 = 0;
    }
    [v43 addObject:v38];
    double v39 = [_UICollectionLayoutItemSolverState alloc];
    CGFloat v40 = (void *)[v36 count];
    CGFloat v41 = -[_UICollectionLayoutItemSolverState initWithSolutionFrames:itemFrameCount:supplementaryFrameCount:solvedFittingFrame:preferredSizeGroupingRanges:additionalOffsetForOutermostGroup:errorDescription:](v39, v43, (void *)1, v40, MEMORY[0x1E4F1CBF0], 0, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24), *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
    CGFloat v42 = *(void **)(a1 + 48);
    *(void *)(a1 + 48) = v41;
  }
}

- (id)auxillaryHostAuxillaryItems
{
  double v2 = self;
  if (self) {
    self = (_UICollectionLayoutItemSolver *)self->_item;
  }
  uint64_t v3 = [(_UICollectionLayoutItemSolver *)self supplementaryItems];
  double v4 = (void *)v3;
  double v5 = (void *)MEMORY[0x1E4F1CBF0];
  if (v3) {
    double v6 = (void *)v3;
  }
  else {
    double v6 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v7 = v6;

  if (v2) {
    iteuint64_t m = v2->_item;
  }
  else {
    iteuint64_t m = 0;
  }
  uint64_t v9 = [(NSCollectionLayoutItem *)item decorationItems];
  uint64_t v10 = (void *)v9;
  if (v9) {
    double v11 = (void *)v9;
  }
  else {
    double v11 = v5;
  }
  id v12 = v11;

  double v13 = [v7 arrayByAddingObjectsFromArray:v12];

  return v13;
}

- (unint64_t)auxillaryHostLayoutAxis
{
  if (!self)
  {
    char v5 = [0 isGroup];
    iteuint64_t m = 0;
    if (v5) {
      goto LABEL_4;
    }
    return 0;
  }
  if (![(NSCollectionLayoutItem *)self->_item isGroup]) {
    return 0;
  }
  iteuint64_t m = self->_item;
LABEL_4:
  return -[_UICollectionLayoutItemSolver _layoutAxisForGroup:]((uint64_t)self, item);
}

- (id)auxillaryHostTraitCollection
{
  if (self) {
    self = (_UICollectionLayoutItemSolver *)self->_traitCollection;
  }
  return self;
}

- (id)auxillaryHostSupplementaryEnroller
{
  if (self)
  {
    supplementaryEnroller = self->_supplementaryEnroller;
    if (supplementaryEnroller) {
      goto LABEL_3;
    }
    double v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"_UICollectionLayoutItemSolver.m", 1594, @"Invalid parameter not satisfying: %@", @"self.supplementaryEnroller" object file lineNumber description];

    if (self)
    {
      supplementaryEnroller = self->_supplementaryEnroller;
      goto LABEL_3;
    }
  }
  else
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, 0, @"_UICollectionLayoutItemSolver.m", 1594, @"Invalid parameter not satisfying: %@", @"self.supplementaryEnroller" object file lineNumber description];
  }
  supplementaryEnroller = 0;
LABEL_3:
  return supplementaryEnroller;
}

- (BOOL)auxillaryHostShouldLayoutRTL
{
  if (self) {
    LOBYTE(self) = self->_layoutRTL;
  }
  return (char)self;
}

- (id)auxillaryHostPreferredSizes
{
  if (self) {
    self = (_UICollectionLayoutItemSolver *)self->_preferredSizes;
  }
  return self;
}

- (CGSize)auxillaryHostContentSize
{
  double v2 = self;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (self) {
    self = (_UICollectionLayoutItemSolver *)self->_item;
  }
  if ([(_UICollectionLayoutItemSolver *)self isGroup])
  {
    -[_UICollectionLayoutItemSolver contentFrame]((uint64_t)v2);
    double width = v3;
    double height = v5;
    goto LABEL_15;
  }
  if (!CGRectIsNull(v2->_uncommittedSolvedItemFrame))
  {
    double width = v2->_uncommittedSolvedItemFrame.size.width;
    double height = v2->_uncommittedSolvedItemFrame.size.height;
    goto LABEL_15;
  }
  if (os_variant_has_internal_diagnostics())
  {
    uint64_t v9 = __UIFaultDebugAssertLog();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      goto LABEL_10;
    }
    double v8 = v2->_item;
    uint64_t v10 = [(NSCollectionLayoutItem *)v8 _externalDescription];
    int v23 = 138412290;
    double v24 = v10;
    _os_log_fault_impl(&dword_1853B0000, v9, OS_LOG_TYPE_FAULT, "UIKit internal bug: Solver for item %@ queried for auxiliary host content size without having solved the item. Using fallback behavior.", (uint8_t *)&v23, 0xCu);
LABEL_9:

LABEL_10:
    goto LABEL_11;
  }
  id v7 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &auxillaryHostContentSize___s_category) + 8);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    double v8 = v2->_item;
    uint64_t v9 = v7;
    uint64_t v10 = [(NSCollectionLayoutItem *)v8 _externalDescription];
    int v23 = 138412290;
    double v24 = v10;
    _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, "UIKit internal bug: Solver for item %@ queried for auxiliary host content size without having solved the item. Using fallback behavior.", (uint8_t *)&v23, 0xCu);
    goto LABEL_9;
  }
LABEL_11:
  double v11 = -[_UICollectionPreferredSizes objectAtIndexedSubscript:]((uint64_t)v2->_preferredSizes, 0);
  id v12 = (id)[(NSCollectionLayoutItem *)v2->_item size];
  [(UITraitCollection *)v2->_traitCollection displayScale];
  double v14 = v13;
  iteuint64_t m = v2->_item;
  container = v2->_container;
  double v17 = item;
  [(NSCollectionLayoutItem *)v17 _insetSizeForContainer:container displayScale:v14];
  double width = v18;
  double height = v19;

  if (v11)
  {
    double width = [(_UICollectionPreferredSize *)(uint64_t)v11 preferredSizeForOriginalSize:width layoutSize:height];
    double height = v20;
  }

LABEL_15:
  double v21 = width;
  double v22 = height;
  result.double height = v22;
  result.double width = v21;
  return result;
}

- (id)auxillaryHostContainer
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (self)
  {
    if ([(NSCollectionLayoutItem *)self->_item isGroup])
    {
      container = self->_container;
LABEL_4:
      double v4 = container;
      goto LABEL_17;
    }
  }
  else
  {
    char v5 = [0 isGroup];
    container = 0;
    if (v5) {
      goto LABEL_4;
    }
  }
  if (CGRectIsNull(self->_uncommittedSolvedItemFrame))
  {
    if (os_variant_has_internal_diagnostics())
    {
      double v8 = __UIFaultDebugAssertLog();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        goto LABEL_11;
      }
      id v7 = self->_item;
      uint64_t v9 = [(NSCollectionLayoutItem *)v7 _externalDescription];
      int v22 = 138412290;
      int v23 = v9;
      _os_log_fault_impl(&dword_1853B0000, v8, OS_LOG_TYPE_FAULT, "UIKit internal bug: Solver for item %@ queried for auxiliary host container without having solved the item. Using fallback behavior.", (uint8_t *)&v22, 0xCu);
    }
    else
    {
      double v6 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &auxillaryHostContainer___s_category) + 8);
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
LABEL_12:
        [(UITraitCollection *)self->_traitCollection displayScale];
        double v11 = v10;
        id v12 = self->_container;
        double v13 = self->_item;
        [(NSCollectionLayoutItem *)v13 _insetSizeForContainer:v12 displayScale:v11];
        double width = v14;
        double height = v16;

        double v18 = -[_UICollectionPreferredSizes objectAtIndexedSubscript:]((uint64_t)self->_preferredSizes, 0);
        if (v18)
        {
          double v19 = [(NSCollectionLayoutItem *)self->_item size];
          double width = [(_UICollectionPreferredSize *)(uint64_t)v18 preferredSizeForOriginalSize:width layoutSize:height];
          double height = v20;
        }
        goto LABEL_16;
      }
      id v7 = self->_item;
      double v8 = v6;
      uint64_t v9 = [(NSCollectionLayoutItem *)v7 _externalDescription];
      int v22 = 138412290;
      int v23 = v9;
      _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_ERROR, "UIKit internal bug: Solver for item %@ queried for auxiliary host container without having solved the item. Using fallback behavior.", (uint8_t *)&v22, 0xCu);
    }

LABEL_11:
    goto LABEL_12;
  }
  double width = self->_uncommittedSolvedItemFrame.size.width;
  double height = self->_uncommittedSolvedItemFrame.size.height;
LABEL_16:
  double v4 = -[_UICollectionLayoutContainer initWithContentSize:contentInsets:]([_UICollectionLayoutContainer alloc], width, height, 0.0, 0.0, 0.0, 0.0);
LABEL_17:
  return v4;
}

- (CGPoint)auxillaryHostAdditionalFrameOffset
{
  double v3 = *MEMORY[0x1E4F1DAD8];
  double v2 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  if (!self)
  {
    char v10 = [0 isGroup];
    iteuint64_t m = 0;
    if (v10) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  if (([(NSCollectionLayoutItem *)self->_item isGroup] & 1) == 0)
  {
    iteuint64_t m = self->_item;
LABEL_4:
    [(NSCollectionLayoutItem *)item _effectiveContentInsets];
    double v2 = v6;
    double v3 = v7;
  }
LABEL_5:
  double v8 = v3;
  double v9 = v2;
  result.double y = v9;
  result.double x = v8;
  return result;
}

- (id)auxillaryFrames
{
  if (a1)
  {
    uint64_t v1 = -[_UICollectionLayoutItemSolverState auxillaryFrames](*(void **)(a1 + 48));
    double v2 = (void *)v1;
    double v3 = (void *)MEMORY[0x1E4F1CBF0];
    if (v1) {
      double v3 = (void *)v1;
    }
    id v4 = v3;
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (double)offsetForEdgeSpacing
{
  if (!a1) {
    return 0.0;
  }
  double v2 = (double *)*(id *)(a1 + 48);
  double v3 = v2;
  if (v2)
  {
    double v4 = v2[11];
  }
  else
  {
    double v6 = [MEMORY[0x1E4F28B00] currentHandler];
    id v7 = *(id *)(a1 + 16);
    double v8 = [v7 _externalDescription];
    [v6 handleFailureInMethod:sel_offsetForEdgeSpacing, a1, @"_UICollectionLayoutItemSolver.m", 455, @"Compositional layout internal bug: Attempting to access edge spacing offset before solving. Item: %@", v8 object file lineNumber description];

    double v4 = 0.0;
  }

  return v4;
}

- (void)supplementaryOffsets
{
  if (a1)
  {
    -[_UICollectionLayoutItemSolverState supplementaryFrameOffsets](a1[6]);
    a1 = (void **)objc_claimAutoreleasedReturnValue();
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  double v17 = +[_UICollectionLayoutItemSolver allocWithZone:a3];
  if (self)
  {
    double v4 = self->_item;
    char v5 = self->_supplementaryEnroller;
    double v6 = self->_container;
    layoutAxis = (void *)self->_layoutAxis;
    double v8 = self->_traitCollection;
    maxFrameCount = (void *)self->_maxFrameCount;
    char layoutRTL = self->_layoutRTL;
    double v11 = self->_preferredSizes;
    id v12 = self->_solveResult;
    solutionRecursionDepth = (void *)self->_solutionRecursionDepth;
  }
  else
  {
    id v12 = 0;
    char layoutRTL = 0;
    double v8 = 0;
    double v6 = 0;
    double v4 = 0;
    char v5 = 0;
    layoutAxis = 0;
    maxFrameCount = 0;
    double v11 = 0;
    solutionRecursionDepth = 0;
  }
  double v14 = -[_UICollectionLayoutItemSolver initWithItem:supplementaryEnroller:container:layoutAxis:traitCollection:maxFrameCount:layoutRTL:preferredSizes:solverResult:solutionRecursionDepth:](v17, v4, v5, v6, layoutAxis, v8, maxFrameCount, layoutRTL, v11, v12, solutionRecursionDepth);

  *((_OWORD *)v14 + 6) = self->_largestKnownItemSize;
  CGSize size = self->_uncommittedSolvedItemFrame.size;
  *((_OWORD *)v14 + 7) = self->_uncommittedSolvedItemFrame.origin;
  *((CGSize *)v14 + 8) = size;
  return v14;
}

- (id)queryFramesWithItemLimit:(void *)a1
{
  if (a1)
  {
    a1 = -[_UICollectionLayoutItemSolver _queryFramesWithQueryRect:additionalFrameOffset:itemIndexOffset:supplementaryOffsets:itemLimit:]((uint64_t)a1, 0, 0, a2, *MEMORY[0x1E4F1DB28], *(CGFloat *)(MEMORY[0x1E4F1DB28] + 8), *(CGFloat *)(MEMORY[0x1E4F1DB28] + 16), *(CGFloat *)(MEMORY[0x1E4F1DB28] + 24), *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
    uint64_t v2 = vars8;
  }
  return a1;
}

- (id)queryFramesWithQueryRect:(uint64_t)a3 additionalFrameOffset:(uint64_t)a4 itemIndexOffset:(CGFloat)a5 itemLimit:(CGFloat)a6 supplementaryRepeatOffset:(CGFloat)a7
{
  if (a1)
  {
    a1 = -[_UICollectionLayoutItemSolver _queryFramesWithQueryRect:additionalFrameOffset:itemIndexOffset:itemLimit:supplementaryRepeatOffset:]((uint64_t)a1, a2, a3, a4, a5, a6, a7, a8, a9, a10);
    uint64_t v10 = vars8;
  }
  return a1;
}

- (id)_queryFramesWithQueryRect:(uint64_t)a3 additionalFrameOffset:(uint64_t)a4 itemIndexOffset:(CGFloat)a5 itemLimit:(CGFloat)a6 supplementaryRepeatOffset:(CGFloat)a7
{
  if (a1)
  {
    id v20 = *(id *)(a1 + 64);
    if (v20)
    {
      if ((a3 & 0x8000000000000000) == 0) {
        goto LABEL_4;
      }
    }
    else
    {
      int v23 = [MEMORY[0x1E4F28B00] currentHandler];
      [v23 handleFailureInMethod:sel__queryFramesWithQueryRect_additionalFrameOffset_itemIndexOffset_itemLimit_supplementaryRepeatOffset_, a1, @"_UICollectionLayoutItemSolver.m", 1322, @"Invalid parameter not satisfying: %@", @"supplementaryEnroller" object file lineNumber description];

      if ((a3 & 0x8000000000000000) == 0)
      {
LABEL_4:
        if ((a4 & 0x8000000000000000) == 0)
        {
LABEL_5:
          if (*(void *)(a1 + 48))
          {
            uint64_t v34 = 0;
            double v35 = &v34;
            uint64_t v36 = 0x3032000000;
            uint64_t v37 = __Block_byref_object_copy__32;
            uint64_t v38 = __Block_byref_object_dispose__32;
            id v39 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            v26[0] = MEMORY[0x1E4F143A8];
            v26[1] = 3221225472;
            v26[2] = __133___UICollectionLayoutItemSolver__queryFramesWithQueryRect_additionalFrameOffset_itemIndexOffset_itemLimit_supplementaryRepeatOffset___block_invoke;
            v26[3] = &unk_1E52E1460;
            double v30 = a9;
            double v31 = a10;
            double v32 = sel__queryFramesWithQueryRect_additionalFrameOffset_itemIndexOffset_itemLimit_supplementaryRepeatOffset_;
            uint64_t v29 = a2;
            v26[4] = a1;
            uint64_t v33 = a4;
            id v27 = v20;
            double v28 = &v34;
            -[_UICollectionLayoutItemSolver _enumerateSolutionFramesForQueryRect:itemLimit:withHandler:](a1, a3, (uint64_t)v26, a5, a6, a7, a8);
            id v21 = (id)v35[5];

            _Block_object_dispose(&v34, 8);
          }
          else
          {
            id v21 = (id)MEMORY[0x1E4F1CBF0];
          }

          goto LABEL_9;
        }
LABEL_14:
        uint64_t v25 = [MEMORY[0x1E4F28B00] currentHandler];
        [v25 handleFailureInMethod:sel__queryFramesWithQueryRect_additionalFrameOffset_itemIndexOffset_itemLimit_supplementaryRepeatOffset_, a1, @"_UICollectionLayoutItemSolver.m", 1324, @"Invalid parameter not satisfying: %@", @"supplementaryRepeatOffset >= 0" object file lineNumber description];

        goto LABEL_5;
      }
    }
    uint64_t v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:sel__queryFramesWithQueryRect_additionalFrameOffset_itemIndexOffset_itemLimit_supplementaryRepeatOffset_, a1, @"_UICollectionLayoutItemSolver.m", 1323, @"Invalid parameter not satisfying: %@", @"itemLimit >= 0" object file lineNumber description];

    if ((a4 & 0x8000000000000000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
  id v21 = 0;
LABEL_9:
  return v21;
}

- (double)contentSizeForFrameCount:(uint64_t)a3 layoutAxis:
{
  if (!a1) {
    return 0.0;
  }
  if (a2 < 1) {
    return *MEMORY[0x1E4F1DB30];
  }
  uint64_t v5 = *(void *)(a1 + 48);
  if (!v5) {
    return *MEMORY[0x1E4F1DB30];
  }
  if (*(void *)(v5 + 56) <= a2)
  {
    -[_UICollectionLayoutItemSolver contentFrame](a1);
    return v25;
  }
  else
  {
    if ((unint64_t)(a3 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      uint64_t v33 = [MEMORY[0x1E4F28B00] currentHandler];
      [v33 handleFailureInMethod:sel_contentSizeForFrameCount_layoutAxis_ object:a1 file:@"_UICollectionLayoutItemSolver.m" lineNumber:237 description:@"Unknown layout axis."];
    }
    -[_UICollectionLayoutItemSolver contentFrame](a1);
    double v34 = v7;
    double v35 = v8;
    CGFloat x = *MEMORY[0x1E4F1DB28];
    CGFloat y = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    CGFloat width = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    CGFloat height = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    double v13 = -[_UICollectionLayoutItemSolver itemFrames](a1);
    uint64_t v14 = [v13 count];

    if (v14)
    {
      unint64_t v15 = 0;
      CGFloat v36 = x;
      CGFloat v37 = y;
      CGFloat v38 = height;
      CGFloat v39 = width;
      do
      {
        double v16 = -[_UICollectionLayoutItemSolver itemFrames](a1);
        double v17 = [v16 objectAtIndexedSubscript:v15];

        if (v17)
        {
          CGFloat v18 = v17[8];
          CGFloat v19 = v17[9];
          CGFloat v21 = v17[10];
          CGFloat v20 = v17[11];
        }
        else
        {
          CGFloat v19 = 0.0;
          CGFloat v21 = 0.0;
          CGFloat v20 = 0.0;
          CGFloat v18 = 0.0;
        }
        v40.origin.CGFloat x = x;
        v40.origin.CGFloat y = y;
        v40.size.CGFloat width = width;
        v40.size.CGFloat height = height;
        v48.origin.CGFloat x = v18;
        v48.origin.CGFloat y = v19;
        v48.size.CGFloat width = v21;
        v48.size.CGFloat height = v20;
        CGRect v41 = CGRectUnion(v40, v48);
        CGFloat x = v41.origin.x;
        CGFloat y = v41.origin.y;
        CGFloat width = v41.size.width;
        CGFloat height = v41.size.height;
        if ((uint64_t)v15 < a2)
        {
          v42.origin.CGFloat x = v36;
          v42.origin.CGFloat y = v37;
          v42.size.CGFloat height = v38;
          v42.size.CGFloat width = v39;
          v49.origin.CGFloat x = v18;
          v49.origin.CGFloat y = v19;
          v49.size.CGFloat width = v21;
          v49.size.CGFloat height = v20;
          CGRect v43 = CGRectUnion(v42, v49);
          CGFloat v36 = v43.origin.x;
          CGFloat v37 = v43.origin.y;
          CGFloat v38 = v43.size.height;
          CGFloat v39 = v43.size.width;
        }

        ++v15;
        int v22 = -[_UICollectionLayoutItemSolver itemFrames](a1);
        unint64_t v23 = [v22 count];
      }
      while (v15 < v23);
    }
    else
    {
      CGFloat v38 = height;
      CGFloat v39 = width;
      CGFloat v36 = x;
      CGFloat v37 = y;
    }
    v44.origin.CGFloat x = x;
    v44.origin.CGFloat y = y;
    v44.size.CGFloat width = width;
    v44.size.CGFloat height = height;
    double MaxX = CGRectGetMaxX(v44);
    v45.origin.CGFloat x = x;
    v45.origin.CGFloat y = y;
    v45.size.CGFloat width = width;
    v45.size.CGFloat height = height;
    double MaxY = CGRectGetMaxY(v45);
    v46.origin.CGFloat x = v36;
    v46.origin.CGFloat y = v37;
    v46.size.CGFloat width = v39;
    v46.size.CGFloat height = v38;
    double v28 = CGRectGetMaxX(v46);
    v47.origin.CGFloat x = v36;
    v47.origin.CGFloat y = v37;
    v47.size.CGFloat width = v39;
    v47.size.CGFloat height = v38;
    double v29 = CGRectGetMaxY(v47);
    double v30 = _UISizeValueForAxis(a3, MaxX, MaxY);
    double v31 = _UISizeValueForAxis(a3, v28, v29) - v30;
    double v32 = _UISizeValueForAxis(a3, v34, v35);
    return _UISetSizeValueForAxis(a3, v34, v35, v32 + v31);
  }
}

- (id)_frameForAbsoluteIndex:(uint64_t)a3 additionalFrameOffset:(double)a4 interSolutionSpacing:(double)a5 repeatAxis:(double)a6
{
  if (a1)
  {
    uint64_t v12 = *(void *)(a1 + 48);
    if (v12 && (uint64_t v13 = *(void *)(v12 + 56)) != 0)
    {
      if ((a2 & 0x8000000000000000) == 0)
      {
LABEL_5:
        double v14 = [(_UICollectionLayoutItemSolver *)a1 _frameOffsetForAdditionalFrameOffset:a3 repeatOffset:a4 repeatAxis:a5 interSolutionSpacing:a6];
        double v16 = v15;
        double v17 = -[_UICollectionLayoutItemSolver itemFrames](a1);
        CGFloat v18 = [v17 objectAtIndexedSubscript:a2 % v13];

        CGFloat v19 = [(_UICollectionLayoutFramesQueryResult *)v18 copyWithOffset:0 index:v14 supplementaryEnrollmentIdentifier:v16];
        goto LABEL_6;
      }
    }
    else
    {
      CGFloat v21 = [MEMORY[0x1E4F28B00] currentHandler];
      [v21 handleFailureInMethod:sel__frameForAbsoluteIndex_additionalFrameOffset_interSolutionSpacing_repeatAxis_, a1, @"_UICollectionLayoutItemSolver.m", 1436, @"Invalid parameter not satisfying: %@", @"itemCount" object file lineNumber description];

      uint64_t v13 = 0;
      if ((a2 & 0x8000000000000000) == 0) {
        goto LABEL_5;
      }
    }
    int v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:sel__frameForAbsoluteIndex_additionalFrameOffset_interSolutionSpacing_repeatAxis_, a1, @"_UICollectionLayoutItemSolver.m", 1437, @"Invalid parameter not satisfying: %@", @"absoluteIndex>=0" object file lineNumber description];

    goto LABEL_5;
  }
  CGFloat v19 = 0;
LABEL_6:
  return v19;
}

- (double)_frameOffsetForAdditionalFrameOffset:(uint64_t)a3 repeatOffset:(double)a4 repeatAxis:(double)a5 interSolutionSpacing:(double)a6
{
  if (a2)
  {
    -[_UICollectionLayoutItemSolver layoutFrame](a1);
    double v12 = _UISizeValueForAxis(a3, v10, v11);
    return a4
         + _UISetPointValueForAxis(a3, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), (v12 + a6) * (double)a2);
  }
  return a4;
}

- (NSString)description
{
  if (self) {
    solveResult = self->_solveResult;
  }
  else {
    solveResult = 0;
  }
  double v4 = NSString;
  uint64_t v5 = (objc_class *)objc_opt_class();
  double v6 = NSStringFromClass(v5);
  if (!solveResult)
  {
    if (self)
    {
      double v9 = self->_item;
      container = self->_container;
    }
    else
    {
      double v9 = 0;
      container = 0;
    }
    objc_msgSend(v4, "stringWithFormat:", @"<%@: %p: item=%p; container=%@ (yet to be solved)>",
      v6,
      self,
      v9,
    uint64_t v24 = container);
    goto LABEL_19;
  }
  double v7 = NSNumber;
  if (!self)
  {
    double v9 = 0;
    goto LABEL_25;
  }
  double v8 = self->_solveResult;
  double v9 = (NSCollectionLayoutItem *)v8;
  if (!v8)
  {
LABEL_25:
    solutionFrames = 0;
    goto LABEL_7;
  }
  solutionFrames = v8->_solutionFrames;
LABEL_7:
  double v11 = solutionFrames;
  double v12 = objc_msgSend(v7, "numberWithUnsignedInteger:", -[NSArray count](v11, "count"));
  id v27 = v4;
  if (self)
  {
    uint64_t v13 = self->_item;
    double v14 = self->_container;
    double v15 = NSNumber;
    double v16 = self->_solveResult;
    if (v16) {
      int64_t itemFrameCount = v16->_itemFrameCount;
    }
    else {
      int64_t itemFrameCount = 0;
    }
  }
  else
  {
    double v14 = 0;
    uint64_t v13 = 0;
    int64_t itemFrameCount = 0;
    double v15 = NSNumber;
  }
  CGFloat v18 = [v15 numberWithInteger:itemFrameCount];
  if (self && (CGFloat v19 = self->_solveResult) != 0) {
    int64_t supplementaryFrameCount = v19->_supplementaryFrameCount;
  }
  else {
    int64_t supplementaryFrameCount = 0;
  }
  CGFloat v21 = [NSNumber numberWithInteger:supplementaryFrameCount];
  if (self) {
    int64_t maxFrameCount = self->_maxFrameCount;
  }
  else {
    int64_t maxFrameCount = 0;
  }
  unint64_t v23 = [NSNumber numberWithInteger:maxFrameCount];
  objc_msgSend(v27, "stringWithFormat:", @"<%@: %p: solutionFrames=%@; item=%p; container:%@; itemCount=%@; supplementaryCount=%@; maxFrameCount:%@>",
    v6,
    self,
    v12,
    v13,
    v14,
    v18,
    v21,
  uint64_t v24 = v23);

LABEL_19:
  return (NSString *)v24;
}

- (id)supplementaryFrameWithKind:(uint64_t)a3 index:(double)a4 additionalFrameOffset:(double)a5
{
  if (a1)
  {
    a1 = [(_UICollectionLayoutItemSolver *)(uint64_t)a1 _supplementaryFrameWithKind:a3 index:a4 additionalFrameOffset:a5];
    uint64_t v5 = vars8;
  }
  return a1;
}

- (id)_supplementaryFrameWithKind:(uint64_t)a3 index:(double)a4 additionalFrameOffset:(double)a5
{
  if (!a1)
  {
    double v15 = 0;
    goto LABEL_9;
  }
  if (![a2 length])
  {
    double v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:sel__supplementaryFrameWithKind_index_additionalFrameOffset_, a1, @"_UICollectionLayoutItemSolver.m", 1451, @"Invalid parameter not satisfying: %@", @"kind.length" object file lineNumber description];

    if ((a3 & 0x8000000000000000) == 0) {
      goto LABEL_4;
    }
LABEL_13:
    CGFloat v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:sel__supplementaryFrameWithKind_index_additionalFrameOffset_, a1, @"_UICollectionLayoutItemSolver.m", 1452, @"Invalid parameter not satisfying: %@", @"index >= 0" object file lineNumber description];

    goto LABEL_4;
  }
  if (a3 < 0) {
    goto LABEL_13;
  }
LABEL_4:
  if (!*(void *)(a1 + 48))
  {
    CGFloat v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:sel__supplementaryFrameWithKind_index_additionalFrameOffset_, a1, @"_UICollectionLayoutItemSolver.m", 1453, @"Invalid parameter not satisfying: %@", @"self.solveResult" object file lineNumber description];
  }
  double v10 = +[_UICollectionLayoutFramesQueryResult kindIndexKeyForKind:index:]((uint64_t)_UICollectionLayoutFramesQueryResult, a2, a3);
  double v11 = -[_UICollectionLayoutItemSolverState supplementaryDictByKindIndex](*(void **)(a1 + 48));
  uint64_t v12 = [v11 objectForKeyedSubscript:v10];

  if (v12)
  {
    uint64_t v13 = *(void **)(v12 + 48);
  }
  else
  {
    CGFloat v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:sel__supplementaryFrameWithKind_index_additionalFrameOffset_ object:a1 file:@"_UICollectionLayoutItemSolver.m" lineNumber:1457 description:@"Failed to retrieve the supplementary frame for kind+index key."];

    uint64_t v13 = 0;
  }
  id v14 = v13;
  double v15 = [(_UICollectionLayoutFramesQueryResult *)(id *)v12 copyWithOffset:v14 index:a4 supplementaryEnrollmentIdentifier:a5];

LABEL_9:
  return v15;
}

- (id)supplementaryFrameWithKind:(uint64_t)a3 absoluteIndex:(uint64_t)a4 additionalFrameOffset:(double)a5 interSolutionSpacing:(double)a6 repeatAxis:(double)a7
{
  if (a1)
  {
    a1 = [(_UICollectionLayoutItemSolver *)(uint64_t)a1 _supplementaryFrameWithKind:a3 absoluteIndex:a4 additionalFrameOffset:a5 interSolutionSpacing:a6 repeatAxis:a7];
    uint64_t v7 = vars8;
  }
  return a1;
}

- (id)_supplementaryFrameWithKind:(uint64_t)a3 absoluteIndex:(uint64_t)a4 additionalFrameOffset:(double)a5 interSolutionSpacing:(double)a6 repeatAxis:(double)a7
{
  if (a1)
  {
    id v14 = *(void **)(a1 + 48);
    if (!v14)
    {
      double v28 = [MEMORY[0x1E4F28B00] currentHandler];
      [v28 handleFailureInMethod:sel__supplementaryFrameWithKind_absoluteIndex_additionalFrameOffset_interSolutionSpacing_repeatAxis_, a1, @"_UICollectionLayoutItemSolver.m", 1469, @"Invalid parameter not satisfying: %@", @"self.solveResult" object file lineNumber description];

      id v14 = *(void **)(a1 + 48);
    }
    double v15 = -[_UICollectionLayoutItemSolverState supplementaryFrameOffsets](v14);
    if (![a2 length])
    {
      double v29 = [MEMORY[0x1E4F28B00] currentHandler];
      [v29 handleFailureInMethod:sel__supplementaryFrameWithKind_absoluteIndex_additionalFrameOffset_interSolutionSpacing_repeatAxis_, a1, @"_UICollectionLayoutItemSolver.m", 1473, @"Invalid parameter not satisfying: %@", @"kind.length" object file lineNumber description];
    }
    [v15 rangeForElementKind:a2];
    uint64_t v17 = v16;
    if (v16)
    {
      if ((a3 & 0x8000000000000000) == 0)
      {
LABEL_8:
        double v18 = [(_UICollectionLayoutItemSolver *)a1 _frameOffsetForAdditionalFrameOffset:a4 repeatOffset:a5 repeatAxis:a6 interSolutionSpacing:a7];
        double v20 = v19;
        CGFloat v21 = +[_UICollectionLayoutFramesQueryResult kindIndexKeyForKind:index:]((uint64_t)_UICollectionLayoutFramesQueryResult, a2, a3 % v17);
        int v22 = -[_UICollectionLayoutItemSolverState supplementaryDictByKindIndex](*(void **)(a1 + 48));
        uint64_t v23 = [v22 objectForKeyedSubscript:v21];

        if (v23) {
          uint64_t v24 = *(void **)(v23 + 48);
        }
        else {
          uint64_t v24 = 0;
        }
        id v25 = v24;
        double v26 = [(_UICollectionLayoutFramesQueryResult *)(id *)v23 copyWithOffset:v25 index:v18 supplementaryEnrollmentIdentifier:v20];

        goto LABEL_11;
      }
    }
    else
    {
      double v30 = [MEMORY[0x1E4F28B00] currentHandler];
      [v30 handleFailureInMethod:sel__supplementaryFrameWithKind_absoluteIndex_additionalFrameOffset_interSolutionSpacing_repeatAxis_, a1, @"_UICollectionLayoutItemSolver.m", 1475, @"Invalid parameter not satisfying: %@", @"kindCount" object file lineNumber description];

      if ((a3 & 0x8000000000000000) == 0) {
        goto LABEL_8;
      }
    }
    double v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:sel__supplementaryFrameWithKind_absoluteIndex_additionalFrameOffset_interSolutionSpacing_repeatAxis_, a1, @"_UICollectionLayoutItemSolver.m", 1476, @"Invalid parameter not satisfying: %@", @"absoluteIndex>=0" object file lineNumber description];

    goto LABEL_8;
  }
  double v26 = 0;
LABEL_11:
  return v26;
}

- (CGRect)auxillaryHostPinningRect
{
  double v2 = *MEMORY[0x1E4F1DAD8];
  double v3 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  [(_UICollectionLayoutItemSolver *)self auxillaryHostContentSize];
  double v5 = v4;
  double v7 = v6;
  double v8 = v2;
  double v9 = v3;
  result.size.CGFloat height = v7;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v9;
  result.origin.CGFloat x = v8;
  return result;
}

- (BOOL)auxillaryHostWantsOverlapAdjustmentForMatchingAlignmentsOnly
{
  return 0;
}

@end
@interface _UICollectionLayoutAuxillaryItemSolver
- (double)_frameForSupplementaryItem:(void *)a3 container:(int)a4 primaryContentFrame:(double)a5 supplementaryItemSize:(double)a6 frameOffset:(double)a7 layoutRTL:(double)a8;
- (double)_requiredContentSizeForSupplementaryFrames:(uint64_t)a3 forLayoutAxis:(double)a4 containerSize:(double)a5;
- (double)_sizeForSupplementaryItem:(uint64_t)a3 container:(uint64_t)a4 preferredSizes:(uint64_t)a5 preferredIndex:;
- (double)_visiblePinningRectFromVisibleRect:(CGFloat)a3 auxillaryHost:(CGFloat)a4;
- (id)_rearrangedFramesForFrames:(void *)a3 container:(uint64_t)a4 primaryContentFrame:(int)a5 frameOffset:(void *)a6 preferredSizes:(double)a7 layoutRTL:(double)a8 supplementaryKind:(double)a9;
- (id)queryFramesIntersectingRect:(float64_t)a3 frameOffset:(float64_t)a4;
- (id)supplementaryFrameWithKind:(uint64_t)a3 index:;
- (id)supplementaryFrameWithKind:(uint64_t)a3 index:(double)a4 additionalFrameOffset:(double)a5;
- (id)supplementaryFrames;
- (id)unpinnedFramesOfPinnedSupplementaries;
- (uint64_t)initWithAuxillaryHost:(void *)a1;
- (uint64_t)memoizedSupplementaryKind;
- (void)_updateSupplementaryFrames:(void *)a3 atIndexes:(CGFloat)a4 forPinningToVisibleRect:(CGFloat)a5;
- (void)elementKinds;
- (void)resolve;
- (void)resolveSupplementaryItemsForVisibleBounds:(CGFloat)a3;
- (void)setFrames:(uint64_t)a1;
- (void)unpinnedSupplementaryFrameWithKind:(uint64_t)a3 index:;
@end

@implementation _UICollectionLayoutAuxillaryItemSolver

- (id)queryFramesIntersectingRect:(float64_t)a3 frameOffset:(float64_t)a4
{
  if (a1)
  {
    uint64_t v10 = -[_UICollectionLayoutAuxillaryItemSolver memoizedSupplementaryKind](a1);
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v12 = *(void *)(a1 + 72);
    v13 = *(void **)(a1 + 104);
    if (!v13)
    {
      v14 = objc_alloc_init(_UIRTree);
      v15 = *(void **)(a1 + 72);
      *(void *)&v40.f64[0] = MEMORY[0x1E4F143A8];
      *(void *)&v40.f64[1] = 3221225472;
      *(void *)&v41.f64[0] = __65___UICollectionLayoutAuxillaryItemSolver__updateGeometricIndexer__block_invoke;
      *(void *)&v41.f64[1] = &unk_1E52E14B0;
      v16 = v14;
      v42 = v16;
      [v15 enumerateObjectsUsingBlock:&v40];
      v17 = *(void **)(a1 + 104);
      *(void *)(a1 + 104) = v16;
      v18 = v16;

      v13 = *(void **)(a1 + 104);
    }
    v19 = v13;

    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __82___UICollectionLayoutAuxillaryItemSolver_queryFramesIntersectingRect_frameOffset___block_invoke;
    v30[3] = &unk_1E52E1848;
    uint64_t v32 = v12;
    float64_t v33 = a2;
    float64_t v34 = a3;
    float64_t v35 = a4;
    float64_t v36 = a5;
    double v37 = a6;
    double v38 = a7;
    uint64_t v39 = v10;
    id v20 = v11;
    id v31 = v20;
    v21 = v20;
    if (v19)
    {
      char v43 = 0;
      v22 = (void *)v19[1];
      v23.f64[0] = a2;
      v24.f64[0] = a4;
      v23.f64[1] = a3;
      v24.f64[1] = a5;
      float64x2_t v40 = vaddq_f64(v23, vminnmq_f64(v24, (float64x2_t)0));
      float64x2_t v41 = vabsq_f64(v24);
      _UIRTreeContainerNode<unsigned long>::enumerateElementsIntersecting(v22, &v40, &v43, (uint64_t)v30);
      v21 = v31;
    }
  }
  else
  {
    id v20 = 0;
  }
  return v20;
}

- (uint64_t)memoizedSupplementaryKind
{
  uint64_t result = *(void *)(a1 + 8);
  if (!result)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    *(void *)(a1 + 8) = [WeakRetained auxillaryHostAuxillaryKind];

    return *(void *)(a1 + 8);
  }
  return result;
}

- (id)supplementaryFrames
{
  if (a1)
  {
    a1 = (id *)a1[9];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supplementaryItemGeometricIndexer, 0);
  objc_storeStrong((id *)&self->_supplementaryFramesKeyedByKindIndex, 0);
  objc_storeStrong((id *)&self->_enrolledSupplementaryFramesDict, 0);
  objc_storeStrong((id *)&self->_unpinnedFrames, 0);
  objc_storeStrong((id *)&self->_frames, 0);
  objc_destroyWeak((id *)&self->_auxillaryHost);
  objc_storeStrong((id *)&self->_supplementariesThatCanAffectContentSize, 0);
  objc_storeStrong((id *)&self->_pinnedSupplementaryIndexes, 0);
  objc_storeStrong((id *)&self->_elementKinds, 0);
  objc_storeStrong((id *)&self->_memoizedAuxillaryItems, 0);
}

- (uint64_t)initWithAuxillaryHost:(void *)a1
{
  if (!a1) {
    return 0;
  }
  v6.receiver = a1;
  v6.super_class = (Class)_UICollectionLayoutAuxillaryItemSolver;
  v3 = (id *)objc_msgSendSuper2(&v6, sel_init);
  uint64_t v4 = (uint64_t)v3;
  if (v3)
  {
    objc_storeWeak(v3 + 8, a2);
    *(void *)(v4 + 8) = 0;
    *(void *)(v4 + 56) = 0;
    -[_UICollectionLayoutAuxillaryItemSolver resolve](v4);
  }
  return v4;
}

- (void)resolve
{
  uint64_t v207 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v1 = a1;
    v2 = (id *)(a1 + 64);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    *(void *)(v1 + 56) = 0;
    if (!WeakRetained)
    {
LABEL_112:

      return;
    }
    id v4 = objc_loadWeakRetained(v2);

    v142 = WeakRetained;
    uint64_t v152 = v1;
    if (!v4)
    {
      v128 = [MEMORY[0x1E4F28B00] currentHandler];
      [v128 handleFailureInMethod:sel_memoizedSupplementaryItems, v1, @"_UICollectionLayoutAuxillaryItemSolver.m", 802, @"Invalid parameter not satisfying: %@", @"self.auxillaryHost" object file lineNumber description];
    }
    v5 = *(void **)(v1 + 16);
    if (!v5)
    {
      id v149 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v202 = 0u;
      long long v203 = 0u;
      long long v204 = 0u;
      long long v205 = 0u;
      location = v2;
      id v6 = objc_loadWeakRetained(v2);
      id obj = [v6 auxillaryHostAuxillaryItems];

      uint64_t v7 = [obj countByEnumeratingWithState:&v202 objects:v206 count:16];
      if (!v7) {
        goto LABEL_47;
      }
      uint64_t v147 = *(void *)v203;
      while (1)
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v203 != v147) {
            objc_enumerationMutation(obj);
          }
          v9 = *(void **)(*((void *)&v202 + 1) + 8 * v8);
          uint64_t v10 = [v9 boundarySupplementaryItem];
          if (v10)
          {
            id v11 = objc_loadWeakRetained(location);
            uint64_t v12 = [v11 auxillaryHostLayoutAxis];
            if ((unint64_t)(v12 - 3) > 0xFFFFFFFFFFFFFFFDLL && (unint64_t v13 = [v10 alignment]) != 0)
            {
              if (v12 == 1)
              {
                if (v13 - 2 >= 3) {
                  uint64_t v14 = 8 * (v13 - 6 < 3);
                }
                else {
                  uint64_t v14 = 2;
                }
                if (v13 <= 8)
                {
                  if (((1 << v13) & 0x70) != 0)
                  {
                    uint64_t v16 = 10;
                    uint64_t v17 = 4;
                    goto LABEL_24;
                  }
                  if (((1 << v13) & 0x106) != 0)
                  {
                    uint64_t v16 = 10;
                    uint64_t v17 = 1;
                    goto LABEL_24;
                  }
                }
                uint64_t v17 = 0;
                uint64_t v16 = 10;
              }
              else
              {
                if (v12 == 2 && v13 < 9) {
                  uint64_t v14 = qword_186B93C20[v13 - 1];
                }
                else {
                  uint64_t v14 = 0;
                }
                uint64_t v16 = 5;
                if (v13 - 2 >= 3) {
                  uint64_t v17 = 8 * (v13 - 6 < 3);
                }
                else {
                  uint64_t v17 = 2;
                }
              }
LABEL_24:
              BOOL v18 = (v14 & v16) != 0;
              [v10 offset];
              v19 = objc_msgSend(off_1E52D2AF0, "layoutAnchorWithEdges:absoluteOffset:", v17 | v14);
              if ((v18 & [v10 extendsBoundary]) == 1)
              {
                if ((unint64_t)(v14 - 1) > 7) {
                  uint64_t v20 = 0;
                }
                else {
                  uint64_t v20 = qword_186B93BE0[v14 - 1];
                }
                v21 = [off_1E52D2AF0 layoutAnchorWithEdges:v20 | v17];
              }
              else
              {
                v21 = 0;
              }
              id v15 = (id)[v10 copyWithContainerAnchor:v19 itemAnchor:v21];
            }
            else
            {
              id v15 = v10;
            }

            [v149 addObject:v15];
            goto LABEL_39;
          }
          [v149 addObject:v9];
LABEL_39:
          if (!*(unsigned char *)(v152 + 32))
          {
            v22 = [v9 size];
            int v23 = [v22 isEstimated];

            if (v23) {
              *(unsigned char *)(v152 + 32) = 1;
            }
          }

          ++v8;
        }
        while (v7 != v8);
        uint64_t v24 = [obj countByEnumeratingWithState:&v202 objects:v206 count:16];
        uint64_t v7 = v24;
        if (!v24)
        {
LABEL_47:

          v25 = *(void **)(v152 + 16);
          *(void *)(v152 + 16) = v149;

          v5 = *(void **)(v152 + 16);
          id WeakRetained = v142;
          uint64_t v1 = v152;
          break;
        }
      }
    }
    id v26 = v5;
    if (![v26 count])
    {
LABEL_111:

      id WeakRetained = v142;
      goto LABEL_112;
    }
    int v148 = [WeakRetained auxillaryHostShouldLayoutRTL];
    uint64_t v27 = [WeakRetained auxillaryHostLayoutAxis];
    v150 = (void *)-[_UICollectionLayoutAuxillaryItemSolver memoizedSupplementaryKind](v1);
    v28 = [WeakRetained auxillaryHostContainer];
    if (!v28)
    {
      v129 = [MEMORY[0x1E4F28B00] currentHandler];
      [v129 handleFailureInMethod:sel_resolve, v152, @"_UICollectionLayoutAuxillaryItemSolver.m", 250, @"CompositionalLayout internal bug: Auxiliary host %@ returned a nil host container", v142 object file lineNumber description];
    }
    CGFloat v29 = *MEMORY[0x1E4F1DAD8];
    CGFloat v30 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    [v142 auxillaryHostContentSize];
    double v32 = v31;
    double v34 = v33;
    unint64_t v135 = v27 - 1;
    if (v27 == 1) {
      uint64_t v35 = 2;
    }
    else {
      uint64_t v35 = v27 == 2;
    }
    float64_t v36 = (double *)MEMORY[0x1E4F1DB30];
    if (v27)
    {
      v208.origin.x = v29;
      v208.origin.y = v30;
      v208.size.width = v32;
      v208.size.height = v34;
      double Width = CGRectGetWidth(v208);
      v209.origin.x = v29;
      v209.origin.y = v30;
      v209.size.width = v32;
      v209.size.height = v34;
      if (fabs(Width * CGRectGetHeight(v209)) < 2.22044605e-16)
      {
        [v28 contentSize];
        double v40 = _UISizeValueForAxis(v35, v38, v39);
        double v32 = _UISetSizeValueForAxis(v35, v32, v34, v40);
        double v34 = v41;
      }
      double v32 = _UISizeClampToMinimumSizeForAxis(v27, v32, v34, *v36, v36[1]);
      double v34 = v42;
    }
    CGFloat v43 = v30;
    CGFloat v44 = v29;
    if (objc_opt_respondsToSelector())
    {
      [v142 auxillaryHostAdditionalFrameOffset];
      CGFloat v44 = v45;
      CGFloat v43 = v46;
    }
    v47 = [v142 auxillaryHostSupplementaryEnroller];
    if (!v47)
    {
      v130 = [MEMORY[0x1E4F28B00] currentHandler];
      [v130 handleFailureInMethod:sel_resolve, v152, @"_UICollectionLayoutAuxillaryItemSolver.m", 274, @"Invalid parameter not satisfying: %@", @"supplementaryEnroller" object file lineNumber description];
    }
    v48 = [v142 auxillaryHostPreferredSizes];
    id v49 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v50 = objc_alloc_init(_UICollectionLayoutAuxillaryOffsets);
    uint64_t v51 = v27;
    id v52 = objc_alloc_init(MEMORY[0x1E4F28E60]);
    uint64_t v194 = 0;
    v195 = (CGFloat *)&v194;
    uint64_t v196 = 0x4010000000;
    v197 = &unk_186D7DBA7;
    CGFloat v198 = v29;
    CGFloat v199 = v30;
    double v200 = v32;
    double v201 = v34;
    uint64_t v190 = 0;
    v191 = (double *)&v190;
    uint64_t v192 = 0x2020000000;
    uint64_t v193 = 0;
    uint64_t v186 = 0;
    v187 = &v186;
    uint64_t v188 = 0x2020000000;
    uint64_t v189 = 0;
    v166[0] = MEMORY[0x1E4F143A8];
    v166[1] = 3221225472;
    v166[2] = __49___UICollectionLayoutAuxillaryItemSolver_resolve__block_invoke;
    v166[3] = &unk_1E52E1870;
    v176 = sel_resolve;
    v166[4] = v152;
    id v139 = v47;
    id v167 = v139;
    id v53 = v28;
    id v168 = v53;
    locationa = v48;
    v169 = locationa;
    CGFloat v177 = v29;
    CGFloat v178 = v30;
    double v179 = v32;
    double v180 = v34;
    CGFloat v137 = v44;
    CGFloat v181 = v44;
    CGFloat v182 = v43;
    CGFloat v54 = v43;
    char v185 = v148;
    v183 = v150;
    id v55 = v49;
    id v170 = v55;
    id v141 = v52;
    id v56 = v52;
    uint64_t v57 = v51;
    id v140 = v56;
    id v171 = v56;
    v173 = &v186;
    v58 = v50;
    v172 = v58;
    v174 = &v190;
    uint64_t v184 = v51;
    v175 = &v194;
    [v26 enumerateObjectsUsingBlock:v166];
    double v59 = v191[3];
    double v60 = v32;
    double v61 = v34;
    v62 = (double *)MEMORY[0x1E4F1DB30];
    if (v59 > 0.0)
    {
      double v60 = v32 + _UISetSizeValueForAxis(v51, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8), v59);
      double v61 = v34 + v63;
    }
    v210.origin.x = v29;
    v210.origin.y = v30;
    v210.size.width = v32;
    v210.size.height = v34;
    v214.origin.x = v29;
    v214.origin.y = v30;
    v214.size.width = v60;
    v214.size.height = v61;
    if (!CGRectEqualToRect(v210, v214))
    {
      v64 = v195;
      v195[4] = v29;
      v64[5] = v30;
      v64[6] = v60;
      v64[7] = v61;
      v153[0] = MEMORY[0x1E4F143A8];
      v153[1] = 3221225472;
      v153[2] = __49___UICollectionLayoutAuxillaryItemSolver_resolve__block_invoke_2;
      v153[3] = &unk_1E52E1898;
      v153[4] = v152;
      id v154 = v53;
      CGFloat v157 = v29;
      CGFloat v158 = v30;
      double v159 = v60;
      double v160 = v61;
      CGFloat v161 = v137;
      CGFloat v162 = v54;
      char v165 = v148;
      uint64_t v163 = v51;
      v164 = sel_resolve;
      id v155 = v55;
      v156 = &v194;
      [v155 enumerateObjectsUsingBlock:v153];
    }
    double obja = 0.0;
    if (v187[3] < 1)
    {
      v65 = (id *)v152;
    }
    else
    {
      v65 = (id *)v152;
      if ((objc_opt_respondsToSelector() & 1) == 0) {
        goto LABEL_75;
      }
      [v142 auxillaryHostPaddingBeforeBoundarySupplementaries];
      double obja = v66;
      if (v66 <= 0.0) {
        goto LABEL_75;
      }
      if (v57 == 1)
      {
        v70 = v195;
        double v68 = v66;
        v195[4] = v195[4] - v66;
        v69 = v70 + 6;
      }
      else
      {
        if (v57 != 2) {
          goto LABEL_75;
        }
        v67 = v195;
        double v68 = v66;
        v195[5] = v195[5] - v66;
        v69 = v67 + 7;
      }
      double *v69 = v68 + *v69;
    }
LABEL_75:
    v211.origin.x = v29;
    v211.origin.y = v30;
    v211.size.width = v60;
    v211.size.height = v61;
    BOOL v71 = !CGRectIsEmpty(v211);
    char v72 = v150 == (void *)4 || v71;
    if (v72)
    {
      v73 = v195;
      CGFloat v74 = v195[6];
      CGFloat v75 = v195[7];
      double v76 = v74;
      double v77 = v75;
LABEL_90:
      double v104 = _UIRectSubtractingRectYieldingDirectionalInsets(v29, v30, v32, v34, v73[4], v73[5], v74, v75);
      double v105 = v103;
      uint64_t v107 = v106;
      uint64_t v109 = v108;
      if (v187[3]) {
        char v110 = 0;
      }
      else {
        char v110 = v72;
      }
      if ((v110 & 1) == 0)
      {
        if (fabs(v103) >= 2.22044605e-16 || fabs(v104) >= 2.22044605e-16)
        {
          id v111 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          long long v204 = 0u;
          long long v205 = 0u;
          long long v202 = 0u;
          long long v203 = 0u;
          id v112 = v55;
          uint64_t v113 = [v112 countByEnumeratingWithState:&v202 objects:v206 count:16];
          if (v113)
          {
            uint64_t v114 = *(void *)v203;
            do
            {
              uint64_t v115 = 0;
              do
              {
                if (*(void *)v203 != v114) {
                  objc_enumerationMutation(v112);
                }
                uint64_t v116 = *(void *)(*((void *)&v202 + 1) + 8 * v115);
                if (v116)
                {
                  double v117 = *(double *)(v116 + 64);
                  double v118 = *(double *)(v116 + 72);
                  double v119 = *(double *)(v116 + 80);
                  double v120 = *(double *)(v116 + 88);
                  v121 = *(void **)(v116 + 16);
                }
                else
                {
                  v121 = 0;
                  double v118 = 0.0;
                  double v117 = 0.0;
                  double v120 = 0.0;
                  double v119 = 0.0;
                }
                v122 = -[_UICollectionLayoutFramesQueryResult copyWithFrame:index:]((id *)v116, v121, v117 - v105, v118 - v104, v119, v120);
                [v111 addObject:v122];

                ++v115;
              }
              while (v113 != v115);
              uint64_t v123 = [v112 countByEnumeratingWithState:&v202 objects:v206 count:16];
              uint64_t v113 = v123;
            }
            while (v123);
          }
        }
        else
        {
          id v111 = [MEMORY[0x1E4F1C978] arrayWithArray:v55];
        }
        uint64_t v124 = [v111 mutableCopy];

        id v55 = (id)v124;
        v65 = (id *)v152;
      }
      objc_setProperty_nonatomic_copy(v65, v102, v55, 80);
      objc_storeStrong(v65 + 5, v141);
      -[_UICollectionLayoutAuxillaryItemSolver setFrames:](v152, v55);
      *(double *)(v152 + 112) = v76;
      *(double *)(v152 + 120) = v77;
      *(double *)(v152 + 144) = v104;
      *(double *)(v152 + 152) = v105;
      *(void *)(v152 + 160) = v107;
      *(void *)(v152 + 168) = v109;
      *(double *)(v152 + 128) = -v105;
      *(double *)(v152 + 136) = -v104;
      v125 = *(void **)(v152 + 48);
      *(void *)(v152 + 48) = v58;
      v126 = v58;

      v127 = *(void **)(v152 + 104);
      *(void *)(v152 + 104) = 0;

      _Block_object_dispose(&v186, 8);
      _Block_object_dispose(&v190, 8);
      _Block_object_dispose(&v194, 8);

      goto LABEL_111;
    }
    [v53 contentSize];
    [v53 contentSize];
    double v133 = v78;
    double v134 = v79;
    if (v135 > 1)
    {
      double v84 = *v62;
      double v86 = v62[1];
      double v136 = *v62;
      double v138 = v86;
      if (v57)
      {
LABEL_89:
        v65 = (id *)v152;
        double v76 = v84 + _UISetSizeValueForAxis(v57, v136, v138, obja);
        double v77 = v86 + v101;
        v73 = v195;
        CGFloat v74 = v195[6];
        CGFloat v75 = v195[7];
        goto LABEL_90;
      }
      double v87 = _UISetSizeValueForAxis(1, v78, v79, 1000000.0);
      double v89 = v88;
      v83 = -[_UICollectionLayoutAuxillaryItemSolver _rearrangedFramesForFrames:container:primaryContentFrame:frameOffset:preferredSizes:layoutRTL:supplementaryKind:](v152, v55, v53, (uint64_t)locationa, v148, v150, v29, v30, v87, v88, v29, v30);
      double v90 = [(_UICollectionLayoutAuxillaryItemSolver *)v152 _requiredContentSizeForSupplementaryFrames:1 forLayoutAxis:v87 containerSize:v89];
      double v131 = v91;
      double v132 = v90;
      double v92 = _UISetSizeValueForAxis(2, v133, v134, 1000000.0);
      double v94 = v93;
      v95 = -[_UICollectionLayoutAuxillaryItemSolver _rearrangedFramesForFrames:container:primaryContentFrame:frameOffset:preferredSizes:layoutRTL:supplementaryKind:](v152, v55, v53, (uint64_t)locationa, v148, v150, v29, v30, v92, v93, v29, v30);
      double v96 = [(_UICollectionLayoutAuxillaryItemSolver *)v152 _requiredContentSizeForSupplementaryFrames:2 forLayoutAxis:v92 containerSize:v94];
      double v151 = v97;
      double v98 = v96;
      double v84 = _UISizeValueForAxis(1, v132, v131);
      v212.origin.x = v29;
      v212.origin.y = v30;
      v212.size.width = v60;
      v212.size.height = v61;
      double v99 = CGRectGetWidth(v212);
      if (v84 < v99) {
        double v84 = v99;
      }
      double v86 = _UISizeValueForAxis(2, v98, v151);
      v213.origin.x = v29;
      v213.origin.y = v30;
      v213.size.width = v60;
      v213.size.height = v61;
      double Height = CGRectGetHeight(v213);
      if (v86 < Height) {
        double v86 = Height;
      }
    }
    else
    {
      double v80 = _UISetSizeValueForAxis(v57, v78, v79, 1000000.0);
      double v82 = v81;
      v83 = -[_UICollectionLayoutAuxillaryItemSolver _rearrangedFramesForFrames:container:primaryContentFrame:frameOffset:preferredSizes:layoutRTL:supplementaryKind:](v152, v55, v53, (uint64_t)locationa, v148, v150, v29, v30, v80, v81, v29, v30);
      double v84 = [(_UICollectionLayoutAuxillaryItemSolver *)v152 _requiredContentSizeForSupplementaryFrames:v57 forLayoutAxis:v80 containerSize:v82];
      double v86 = v85;
      double v136 = *v62;
      double v138 = v62[1];
    }

    goto LABEL_89;
  }
}

- (double)_sizeForSupplementaryItem:(uint64_t)a3 container:(uint64_t)a4 preferredSizes:(uint64_t)a5 preferredIndex:
{
  if (!a1) {
    return 0.0;
  }
  id v10 = objc_loadWeakRetained((id *)(a1 + 64));
  id v11 = [v10 auxillaryHostTraitCollection];
  [v11 displayScale];
  double v13 = v12;

  uint64_t v14 = [a2 size];
  [v14 _effectiveSizeForContainer:a3 displayScale:0 ignoringInsets:v13];
  double v16 = v15;
  double v18 = v17;

  if (a4)
  {
    v19 = [a2 elementKind];
    uint64_t v20 = -[_UICollectionPreferredSizes objectForKeyedSubscript:](a4, v19);
    -[_UICollectionPreferredSizes objectAtIndexedSubscript:]((uint64_t)v20, a5);
    v21 = (unsigned char *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      if (_UICollectionViewCompositionalLayoutShouldRespectPreferredSizeOnEstimatedAxisOnly())
      {
        v22 = [a2 size];
        double v16 = [(_UICollectionPreferredSize *)(uint64_t)v21 preferredSizeForOriginalSize:v16 layoutSize:v18];
        double v18 = v23;
      }
      else if (!v21[48])
      {
        double v16 = -[_UICollectionPreferredSize fittingSize]((uint64_t)v21);
        double v18 = v24;
      }
      if (v16 == *MEMORY[0x1E4F1DB30] && v18 == *(double *)(MEMORY[0x1E4F1DB30] + 8))
      {
        id v26 = [MEMORY[0x1E4F28B00] currentHandler];
        [v26 handleFailureInMethod:sel__sizeForSupplementaryItem_container_preferredSizes_preferredIndex_, a1, @"_UICollectionLayoutAuxillaryItemSolver.m", 590, @"Preferred size is ZERO for auxiliary item %@ in container %@", a2, a3 object file lineNumber description];
      }
    }
  }
  return v16;
}

- (double)_frameForSupplementaryItem:(void *)a3 container:(int)a4 primaryContentFrame:(double)a5 supplementaryItemSize:(double)a6 frameOffset:(double)a7 layoutRTL:(double)a8
{
  if (!a1) {
    return 0.0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v24 = [WeakRetained auxillaryHostLayoutAxis];
  double v25 = 0.0;
  if (v24 && (v24 != 1 ? (uint64_t v26 = v24 == 2) : (uint64_t v26 = 2), v26))
  {
    [a3 contentInsets];
    if (v26 != 1)
    {
      double v25 = 0.0;
      double v28 = 0.0;
      goto LABEL_11;
    }
    double v29 = 0.0;
  }
  else
  {
    double v29 = 0.0;
    double v28 = 0.0;
  }
  double v27 = 0.0;
LABEL_11:
  double v30 = a5 + v28;
  double v31 = a7 - (v25 + v28);
  double v32 = a6 + v27;
  double v33 = a8 - (v29 + v27);
  [a3 effectiveContentSize];
  double v62 = v35;
  CGFloat v63 = v34;
  float64_t v36 = [a2 containerAnchor];
  double v37 = [a2 itemAnchor];
  objc_msgSend(v36, "_itemFrameForContainerRect:itemSize:itemLayoutAnchor:", v37, v30, v32, v31, v33, a9, a10);
  double v39 = v38;
  double v41 = v40;
  double v43 = v42;
  double v45 = v44;

  [a2 _effectiveContentInsets];
  CGFloat v47 = v39 + v46;
  CGFloat v49 = v43 - (v48 + v46);
  CGFloat v51 = v41 + v50;
  CGFloat v53 = v45 - (v50 + v52);
  double v54 = a11 + v39 + v46;
  double v55 = a12 + v51;
  v64.origin.x = v39 + v46;
  v64.origin.y = v51;
  v64.size.width = v49;
  v64.size.height = v53;
  CGFloat Width = CGRectGetWidth(v64);
  v65.origin.x = v47;
  v65.origin.y = v51;
  v65.size.width = v49;
  v65.size.height = v53;
  CGFloat Height = CGRectGetHeight(v65);
  if (a4)
  {
    v58 = [a2 item];
    char v59 = [v58 ignoresRTL];

    if ((v59 & 1) == 0 && fabs(v63 * v62) >= 2.22044605e-16)
    {
      _UIApplyRTLTransformForFrameWithDimension(v54, v55, Width, Height, v63);
      double v54 = v60;
    }
  }

  return v54;
}

- (void)setFrames:(uint64_t)a1
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    objc_storeStrong((id *)(a1 + 72), a2);
    id v4 = *(void **)(a1 + 104);
    *(void *)(a1 + 104) = 0;

    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v7 = a2;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v21;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(v7);
          }
          double v12 = *(uint64_t **)(*((void *)&v20 + 1) + 8 * v11);
          if (v12) {
            double v13 = (void *)v12[6];
          }
          else {
            double v13 = 0;
          }
          id v14 = v13;
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, v14, (void)v20);

          double v15 = -[_UICollectionLayoutFramesQueryResult kindIndexKey](v12);
          [v6 setObject:v12 forKeyedSubscript:v15];

          ++v11;
        }
        while (v9 != v11);
        uint64_t v16 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
        uint64_t v9 = v16;
      }
      while (v16);
    }

    double v17 = *(void **)(a1 + 88);
    *(void *)(a1 + 88) = v5;
    id v18 = v5;

    v19 = *(void **)(a1 + 96);
    *(void *)(a1 + 96) = v6;
  }
}

- (id)_rearrangedFramesForFrames:(void *)a3 container:(uint64_t)a4 primaryContentFrame:(int)a5 frameOffset:(void *)a6 preferredSizes:(double)a7 layoutRTL:(double)a8 supplementaryKind:(double)a9
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v50 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id obj = a2;
  uint64_t v51 = [obj countByEnumeratingWithState:&v52 objects:v56 count:16];
  if (v51)
  {
    uint64_t v44 = *(void *)v53;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v53 != v44) {
          objc_enumerationMutation(obj);
        }
        uint64_t v20 = *(void *)(*((void *)&v52 + 1) + 8 * v19);
        long long v21 = -[_UICollectionLayoutFramesQueryResult auxillaryItem]((void *)v20);
        if (v21)
        {
          if (v20) {
            goto LABEL_8;
          }
        }
        else
        {
          double v40 = [MEMORY[0x1E4F28B00] currentHandler];
          [v40 handleFailureInMethod:sel__rearrangedFramesForFrames_container_primaryContentFrame_frameOffset_preferredSizes_layoutRTL_supplementaryKind_ object:a1 file:@"_UICollectionLayoutAuxillaryItemSolver.m" lineNumber:469 description:@"Failed to retrieve auxillary item from result."];

          if (v20)
          {
LABEL_8:
            uint64_t v22 = *(void *)(v20 + 16);
            goto LABEL_9;
          }
        }
        uint64_t v22 = 0;
LABEL_9:
        double v23 = -[_UICollectionLayoutAuxillaryItemSolver _sizeForSupplementaryItem:container:preferredSizes:preferredIndex:](a1, v21, (uint64_t)a3, a4, v22);
        double v25 = -[_UICollectionLayoutAuxillaryItemSolver _frameForSupplementaryItem:container:primaryContentFrame:supplementaryItemSize:frameOffset:layoutRTL:](a1, v21, a3, a5, a7, a8, a9, a10, v23, v24, a11, a12);
        double v27 = v26;
        double v29 = v28;
        double v31 = v30;
        double v32 = [_UICollectionLayoutFramesQueryResult alloc];
        if (v20)
        {
          char v33 = *(unsigned char *)(v20 + 8) != 0;
          double v34 = *(void **)(v20 + 16);
          double v35 = *(void **)(v20 + 32);
          float64_t v36 = [v21 item];
          double v37 = *(void **)(v20 + 48);
        }
        else
        {
          float64_t v36 = [v21 item];
          double v35 = 0;
          char v33 = 0;
          double v34 = 0;
          double v37 = 0;
        }
        id v38 = v37;
        double v39 = -[_UICollectionLayoutFramesQueryResult initWithFrame:adjustedForPinning:index:zIndex:resultKind:item:auxillaryKind:supplementaryEnrollmentIdentifier:]((id *)&v32->super.isa, v33, v34, (void *)1, v35, v36, a6, v38, v25, v27, v29, v31);

        [v50 addObject:v39];
        ++v19;
      }
      while (v51 != v19);
      uint64_t v41 = [obj countByEnumeratingWithState:&v52 objects:v56 count:16];
      uint64_t v51 = v41;
    }
    while (v41);
  }

  return v50;
}

- (id)supplementaryFrameWithKind:(uint64_t)a3 index:
{
  if (a1)
  {
    a1 = [(_UICollectionLayoutAuxillaryItemSolver *)a1 supplementaryFrameWithKind:a3 index:*MEMORY[0x1E4F1DAD8] additionalFrameOffset:*(double *)(MEMORY[0x1E4F1DAD8] + 8)];
    uint64_t v3 = vars8;
  }
  return a1;
}

- (id)supplementaryFrameWithKind:(uint64_t)a3 index:(double)a4 additionalFrameOffset:(double)a5
{
  id v5 = a1;
  if (a1)
  {
    if (![a2 length])
    {
      double v15 = [MEMORY[0x1E4F28B00] currentHandler];
      [v15 handleFailureInMethod:sel_supplementaryFrameWithKind_index_additionalFrameOffset_, v5, @"_UICollectionLayoutAuxillaryItemSolver.m", 194, @"Invalid parameter not satisfying: %@", @"kind.length" object file lineNumber description];
    }
    uint64_t v10 = +[_UICollectionLayoutFramesQueryResult kindIndexKeyForKind:index:]((uint64_t)_UICollectionLayoutFramesQueryResult, a2, a3);
    uint64_t v11 = [v5[12] objectForKeyedSubscript:v10];
    id v5 = v11;
    if (a4 != *MEMORY[0x1E4F1DAD8] || a5 != *(double *)(MEMORY[0x1E4F1DAD8] + 8))
    {
      double v13 = [(_UICollectionLayoutFramesQueryResult *)v11 copyWithOffset:a5];

      id v5 = v13;
    }
  }
  return v5;
}

- (void)resolveSupplementaryItemsForVisibleBounds:(CGFloat)a3
{
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 8);
    if (WeakRetained)
    {
      id v17 = WeakRetained;
      id v11 = a1[5];
      if ([v11 count])
      {
        double v12 = (void *)[a1[10] mutableCopy];
        if ([v12 count])
        {
          double v13 = -[_UICollectionLayoutAuxillaryItemSolver _visiblePinningRectFromVisibleRect:auxillaryHost:]((uint64_t)a1, v17, a2, a3, a4, a5);
          -[_UICollectionLayoutAuxillaryItemSolver _updateSupplementaryFrames:atIndexes:forPinningToVisibleRect:]((uint64_t)a1, v12, v11, v13, v14, v15, v16);
          -[_UICollectionLayoutAuxillaryItemSolver setFrames:]((uint64_t)a1, v12);
        }
      }
      id WeakRetained = v17;
    }
  }
}

- (void)_updateSupplementaryFrames:(void *)a3 atIndexes:(CGFloat)a4 forPinningToVisibleRect:(CGFloat)a5
{
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    if (WeakRetained)
    {
      if ([a3 count])
      {
        v22.origin.x = a4;
        v22.origin.y = a5;
        v22.size.width = a6;
        v22.size.height = a7;
        if (!CGRectIsNull(v22))
        {
          double v13 = [a2 objectsAtIndexes:a3];
          if ([v13 count])
          {
            char v14 = [WeakRetained auxillaryHostWantsOverlapAdjustmentForMatchingAlignmentsOnly];
            [WeakRetained auxillaryHostPinningRect];
            uint64_t v19 = _UIPinnedNonOverlappingFramesForContentFrameVisibleFrame(v13, v14, v15, v16, v17, v18, a4, a5, a6, a7);
            [a2 replaceObjectsAtIndexes:a3 withObjects:v19];
          }
        }
      }
    }
  }
}

- (double)_visiblePinningRectFromVisibleRect:(CGFloat)a3 auxillaryHost:(CGFloat)a4
{
  if (!a1) {
    return 0.0;
  }
  [a2 auxillaryHostPinningRect];
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  v19.origin.x = a3;
  v19.origin.y = a4;
  v19.size.width = a5;
  v19.size.height = a6;
  if (CGRectIsEmpty(v19)) {
    return *MEMORY[0x1E4F1DB20];
  }
  v20.origin.x = a3;
  v20.origin.y = a4;
  v20.size.width = a5;
  v20.size.height = a6;
  v22.origin.x = v11;
  v22.origin.y = v13;
  v22.size.width = v15;
  v22.size.height = v17;
  if (!CGRectIntersectsRect(v20, v22)) {
    return *MEMORY[0x1E4F1DB20];
  }
  v21.origin.x = a3;
  v21.origin.y = a4;
  v21.size.width = a5;
  v21.size.height = a6;
  v23.origin.x = v11;
  v23.origin.y = v13;
  v23.size.width = v15;
  v23.size.height = v17;
  *(void *)&double result = (unint64_t)CGRectIntersection(v21, v23);
  return result;
}

- (void)elementKinds
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v1 = a1;
    v2 = (void *)a1[3];
    if (!v2)
    {
      id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      long long v13 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      id v4 = (id)v1[9];
      uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = *(void *)v14;
        do
        {
          uint64_t v8 = 0;
          do
          {
            if (*(void *)v14 != v7) {
              objc_enumerationMutation(v4);
            }
            uint64_t v9 = -[_UICollectionLayoutFramesQueryResult auxillaryItem](*(void **)(*((void *)&v13 + 1) + 8 * v8));
            double v10 = objc_msgSend(v9, "elementKind", (void)v13);
            if ([v10 length]) {
              [v3 addObject:v10];
            }

            ++v8;
          }
          while (v6 != v8);
          uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
        }
        while (v6);
      }

      CGFloat v11 = (void *)v1[3];
      v1[3] = v3;

      v2 = (void *)v1[3];
    }
    a1 = v2;
  }
  return a1;
}

- (double)_requiredContentSizeForSupplementaryFrames:(uint64_t)a3 forLayoutAxis:(double)a4 containerSize:(double)a5
{
  double v44 = a4;
  double v45 = a5;
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  if ((unint64_t)(a3 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    double v43 = [MEMORY[0x1E4F28B00] currentHandler];
    [v43 handleFailureInMethod:sel__requiredContentSizeForSupplementaryFrames_forLayoutAxis_containerSize_, a1, @"_UICollectionLayoutAuxillaryItemSolver.m", 714, @"Invalid parameter not satisfying: %@", @"layoutAxis == UIAxisVertical || layoutAxis == UIAxisHorizontal", *(void *)&v44, *(void *)&v45 object file lineNumber description];
  }
  if (![a2 count]) {
    return *MEMORY[0x1E4F1DB30];
  }
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v7 = a2;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v55 objects:v60 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v56;
    double v10 = 0.0;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v56 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v55 + 1) + 8 * v11);
        if (v12)
        {
          double v13 = *(double *)(v12 + 64);
          double v14 = *(double *)(v12 + 72);
        }
        else
        {
          double v14 = 0.0;
          double v13 = 0.0;
        }
        double v15 = _UIPointValueForAxis(a3, v13, v14);
        double v16 = fabs(v15);
        if (v16 > v10 && v15 < 0.0) {
          double v10 = v16;
        }
        ++v11;
      }
      while (v8 != v11);
      uint64_t v18 = [v7 countByEnumeratingWithState:&v55 objects:v60 count:16];
      uint64_t v8 = v18;
    }
    while (v18);
  }
  else
  {
    double v10 = 0.0;
  }

  double v20 = _UISetPointValueForAxis(a3, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v10);
  double v22 = v21;
  id v23 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v24 = v7;
  uint64_t v25 = [v24 countByEnumeratingWithState:&v51 objects:v59 count:16];
  if (v25)
  {
    uint64_t v26 = *(void *)v52;
    do
    {
      uint64_t v27 = 0;
      do
      {
        if (*(void *)v52 != v26) {
          objc_enumerationMutation(v24);
        }
        double v28 = *(double **)(*((void *)&v51 + 1) + 8 * v27);
        if (v28)
        {
          double v30 = v28[8];
          double v29 = v28[9];
          CGFloat v31 = v28[10];
          CGFloat Height = v28[11];
        }
        else
        {
          double v29 = 0.0;
          CGFloat v31 = 0.0;
          CGFloat Height = 0.0;
          double v30 = 0.0;
        }
        if (v10 > 0.0)
        {
          v62.origin.x = v30;
          v62.origin.y = v29;
          v62.size.width = v31;
          v62.size.height = Height;
          CGFloat Width = CGRectGetWidth(v62);
          v63.origin.x = v30;
          v63.origin.y = v29;
          v63.size.width = v31;
          v63.size.height = Height;
          CGFloat Height = CGRectGetHeight(v63);
          double v30 = v20 + v30;
          double v29 = v22 + v29;
          CGFloat v31 = Width;
        }
        double v34 = v30;
        double v35 = v29;
        CGFloat v36 = v31;
        CGFloat v37 = Height;
        if (a3 == 2)
        {
          double MinY = CGRectGetMinY(*(CGRect *)&v34);
          v64.origin.x = v30;
          v64.origin.y = v29;
          v64.size.width = v31;
          v64.size.height = Height;
          double MaxY = CGRectGetMaxY(v64);
        }
        else
        {
          double MinY = CGRectGetMinX(*(CGRect *)&v34);
          v65.origin.x = v30;
          v65.origin.y = v29;
          v65.size.width = v31;
          v65.size.height = Height;
          double MaxY = CGRectGetMaxX(v65);
        }
        objc_msgSend(v23, "addIndexesInRange:", (uint64_t)MinY, (uint64_t)MaxY - (uint64_t)MinY);
        ++v27;
      }
      while (v25 != v27);
      uint64_t v40 = [v24 countByEnumeratingWithState:&v51 objects:v59 count:16];
      uint64_t v25 = v40;
    }
    while (v40);
  }

  uint64_t v47 = 0;
  double v48 = &v47;
  uint64_t v49 = 0x2020000000;
  uint64_t v50 = 0;
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __113___UICollectionLayoutAuxillaryItemSolver__requiredContentSizeForSupplementaryFrames_forLayoutAxis_containerSize___block_invoke;
  v46[3] = &unk_1E52E18C0;
  v46[4] = &v47;
  [v23 enumerateRangesUsingBlock:v46];
  double v19 = _UISetSizeValueForAxis(a3, v44, v45, (double)v48[3]);
  _Block_object_dispose(&v47, 8);

  return v19;
}

- (id)unpinnedFramesOfPinnedSupplementaries
{
  if (a1)
  {
    a1 = (id *)a1[10];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)unpinnedSupplementaryFrameWithKind:(uint64_t)a3 index:
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
LABEL_17:
    CGFloat v17 = 0;
    goto LABEL_20;
  }
  if ([a1[10] count])
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v6 = a1[10];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v20;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v20 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v19 + 1) + 8 * v10);
          if (v11) {
            uint64_t v12 = v11[2];
          }
          else {
            uint64_t v12 = 0;
          }
          if (v12 == a3)
          {
            double v13 = -[_UICollectionLayoutFramesQueryResult auxillaryItem](*(void **)(*((void *)&v19 + 1) + 8 * v10));
            double v14 = objc_msgSend(v13, "elementKind", (void)v19);
            char v15 = [v14 isEqualToString:a2];

            if (v15)
            {
              CGFloat v17 = v11;

              goto LABEL_20;
            }
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v16 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
        uint64_t v8 = v16;
      }
      while (v16);
    }

    goto LABEL_17;
  }
  CGFloat v17 = -[_UICollectionLayoutAuxillaryItemSolver supplementaryFrameWithKind:index:](a1, a2, a3);
LABEL_20:
  return v17;
}

@end
@interface UICollectionLayoutSectionListSolver
@end

@implementation UICollectionLayoutSectionListSolver

void __63___UICollectionLayoutSectionListSolver__resolveWithParameters___block_invoke(uint64_t a1, unint64_t a2)
{
  uint64_t v106 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (!v2) {
    return;
  }
  -[_UICollectionPreferredSizes objectAtIndexedSubscript:](*(void *)(v2 + 96), a2);
  v90 = (id *)objc_claimAutoreleasedReturnValue();
  if (v90)
  {
    uint64_t v5 = *(void *)(v2 + 8);
    v4 = (uint64_t *)(v2 + 8);
    uint64_t v6 = *(void *)(v2 + 16) - v5;
    if (!v6
      || (uint64_t v7 = -[_UICollectionLayoutSectionListSolver _regionIndexForFrameIndex:startRegionIndex:endRegionIndex:](v2, a2, 0x86BCA1AF286BCA1BLL * (v6 >> 3) - 1), v7 == 0x7FFFFFFFFFFFFFFFLL))
    {
      v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:sel__updatePreferredSizeForFrameIndex_, v2, @"_UICollectionLayoutSectionListSolver.mm", 715, @"Invalid parameter not satisfying: %@", @"regionIndex != NSNotFound" object file lineNumber description];

      uint64_t v5 = *v4;
      uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      uint64_t v8 = v7;
    }
    unint64_t v10 = *(void *)(v5 + 152 * v8 + 8);
    if (v10 >= 2)
    {
      v11 = (double *)(v5 + 152 * v8);
      double v12 = *v11;
      double v14 = v11[2];
      double v13 = v11[3];
      if (a2 == *(void *)v11)
      {
        *(void *)v11 = a2 + 1;
        *((void *)v11 + 1) = v10 - 1;
        v108.location = a2;
        v108.length = 1;
        _UIRegionSolveResult::_UIRegionSolveResult((_UIRegionSolveResult *)v102, v108, v14, v13, *(const _UIItemSolveResult **)(v2 + 32));
        std::vector<_UIRegionSolveResult>::insert((uint64_t *)(v2 + 8), *v4 + 152 * v8, (unint64_t)v102);
      }
      else
      {
        *((void *)v11 + 1) = a2 - *(void *)v11;
        v109.location = a2;
        v109.length = 1;
        _UIRegionSolveResult::_UIRegionSolveResult((_UIRegionSolveResult *)v102, v109, v14, v13, *(const _UIItemSolveResult **)(v2 + 32));
        ++v8;
        std::vector<_UIRegionSolveResult>::insert((uint64_t *)(v2 + 8), *v4 + 152 * v8, (unint64_t)v102);
        v110.location = a2 + 1;
        v110.length = v10 + ~a2 + *(void *)&v12;
        _UIRegionSolveResult::_UIRegionSolveResult((_UIRegionSolveResult *)&v95, v110, v14, v13, *(const _UIItemSolveResult **)(v2 + 32));
        std::vector<_UIRegionSolveResult>::insert((uint64_t *)(v2 + 8), *v4 + 152 * v8 + 152, (unint64_t)&v95);

        v101[0] = v100;
        std::vector<_UIAuxillarySolveResult>::__destroy_vector::operator()[abi:nn180100](v101);
        v101[0] = (void **)&v99;
        std::vector<_UIAuxillarySolveResult>::__destroy_vector::operator()[abi:nn180100](v101);
      }
      *(void *)&long long v95 = &v104;
      std::vector<_UIAuxillarySolveResult>::__destroy_vector::operator()[abi:nn180100]((void ***)&v95);
      *(void *)&long long v95 = &v103;
      std::vector<_UIAuxillarySolveResult>::__destroy_vector::operator()[abi:nn180100]((void ***)&v95);
      if (v8 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v87 = [MEMORY[0x1E4F28B00] currentHandler];
        [v87 handleFailureInMethod:sel__updatePreferredSizeForFrameIndex_, v2, @"_UICollectionLayoutSectionListSolver.mm", 721, @"Invalid parameter not satisfying: %@", @"regionIndexToUpdate != NSNotFound" object file lineNumber description];

        uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
      }
    }
    uint64_t v15 = *(void *)(v2 + 8);
    uint64_t v16 = *(void *)(v2 + 56);
    v17 = (CGRect *)(v15 + 152 * v8);
    -[_UICollectionPreferredSize fittingSize]((uint64_t)v90);
    double v19 = v18;
    v111.origin.x = v17[1].origin.x;
    v111.origin.y = v17[1].origin.y;
    ++v17;
    v111.size.width = v17->size.width;
    v111.size.height = v17->size.height;
    double Height = CGRectGetHeight(v111);
    CGFloat MinX = CGRectGetMinX(*v17);
    CGFloat MinY = CGRectGetMinY(*v17);
    CGFloat Width = CGRectGetWidth(*v17);
    v17->origin.x = MinX;
    v17->origin.y = MinY;
    v17->size.width = Width;
    v17->size.height = v19;
    v24 = (double *)(v15 + 152 * v8);
    CGFloat v25 = v24[11];
    v24 += 11;
    v112.size.height = v25;
    v112.origin.x = *(v24 - 3);
    v112.origin.y = *(v24 - 2);
    v112.size.width = *(v24 - 1);
    CGFloat v26 = CGRectGetMinX(v112);
    CGFloat v27 = CGRectGetMinY(*(CGRect *)(v24 - 3));
    CGFloat v28 = CGRectGetWidth(*(CGRect *)(v24 - 3));
    CGFloat v29 = CGRectGetHeight(*(CGRect *)(v24 - 3));
    *(v24 - 3) = v26;
    *(v24 - 2) = v27;
    *(v24 - 1) = v28;
    double *v24 = v19 - Height + v29;
    if (fabs(v19 - Height) < 2.22044605e-16)
    {
      id v30 = v90[7];
      BOOL v31 = v30 == 0;

      if (v16) {
        char v32 = v31;
      }
      else {
        char v32 = 1;
      }
      if (v32) {
        goto LABEL_62;
      }
    }
    else if (!v16)
    {
      goto LABEL_62;
    }
    uint64_t v33 = *(void *)(v16 + 48);
    if (v33)
    {
      if (*(void *)(v33 + 64))
      {
        uint64_t v34 = v15 + 152 * v8;
        uint64_t v37 = *(void *)(v34 + 104);
        v35 = (void *)(v34 + 104);
        uint64_t v36 = v37;
        uint64_t v38 = *(v35 - 1);
        v92 = (char **)(v35 - 1);
        while (v36 != v38)
        {

          v36 -= 48;
        }
        void *v35 = v38;
        uint64_t v39 = v15 + 152 * v8;
        uint64_t v42 = *(void *)(v39 + 128);
        v40 = (void *)(v39 + 128);
        uint64_t v41 = v42;
        uint64_t v43 = *(v40 - 1);
        v94 = (char **)(v40 - 1);
        while (v41 != v43)
        {

          v41 -= 48;
        }
        void *v40 = v43;
        v44 = objc_alloc_init(_UICollectionPreferredSizes);
        -[_UICollectionPreferredSizes setObject:atIndexedSubscript:]((uint64_t)v44, (uint64_t)v90, 0);
        id v45 = *(id *)(v16 + 24);
        uint64_t v46 = *(void *)(v16 + 88);
        id v47 = *(id *)(v16 + 32);
        [(_UICollectionLayoutItemSolver *)v16 _solveForContainer:v46 layoutAxis:v47 traitCollection:0x7FFFFFFFFFFFFFFFLL maxFrameCount:*(unsigned char *)(v16 + 8) layoutRTL:v44 preferredSizes:0 largestKnownItemSize:*MEMORY[0x1E4F1DB30] solutionRecursionDepth:*(double *)(MEMORY[0x1E4F1DB30] + 8)];

        uint64_t v48 = *(void *)(v16 + 48);
        v91 = v44;
        if (!v48 || *(void *)(v48 + 56) != 1)
        {
          v88 = [MEMORY[0x1E4F28B00] currentHandler];
          v89 = objc_msgSend(NSString, "stringWithUTF8String:", "void _UIItemSolveResult::resolveAuxillaryResultsForFramePreferredSize(_UICollectionPreferredSize *const __strong, _UICollectionLayoutItemSolver *const __strong)");
          [v88 handleFailureInFunction:v89, @"_UICollectionLayoutSectionListSolver.mm", 149, @"Invalid parameter not satisfying: %@", @"solution.itemFrameCount == 1" file lineNumber description];
        }
        v49 = -[_UICollectionLayoutItemSolver itemFrames](v16);
        uint64_t v50 = [v49 objectAtIndexedSubscript:0];
        uint64_t v51 = v15 + 152 * v8;
        v52 = *(void **)(v51 + 144);
        *(void *)(v51 + 144) = v50;

        long long v97 = 0u;
        long long v98 = 0u;
        long long v95 = 0u;
        long long v96 = 0u;
        v53 = -[_UICollectionLayoutItemSolver auxillaryFrames](v16);
        id obj = v53;
        uint64_t v54 = [v53 countByEnumeratingWithState:&v95 objects:v102 count:16];
        if (v54)
        {
          uint64_t v55 = *(void *)v96;
          do
          {
            uint64_t v56 = 0;
            do
            {
              if (*(void *)v96 != v55) {
                objc_enumerationMutation(obj);
              }
              v57 = *(void **)(*((void *)&v95 + 1) + 8 * v56);
              if (v57)
              {
                uint64_t v59 = v57[8];
                uint64_t v58 = v57[9];
                uint64_t v61 = v57[10];
                uint64_t v60 = v57[11];
                uint64_t v62 = v57[2];
                v63 = v57;
                v64 = v63;
                uint64_t v65 = v63[7];
                v66 = v94;
                if (v65 != 3)
                {
                  if (v65 != 4) {
                    goto LABEL_57;
                  }
                  v66 = v92;
                }
                unint64_t v67 = (unint64_t)v66[2];
                v68 = v66[1];
                if ((unint64_t)v68 >= v67)
                {
                  unint64_t v70 = 0xAAAAAAAAAAAAAAABLL * ((v68 - *v66) >> 4);
                  unint64_t v71 = v70 + 1;
                  if (v70 + 1 > 0x555555555555555) {
                    abort();
                  }
                  unint64_t v72 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v67 - (void)*v66) >> 4);
                  if (2 * v72 > v71) {
                    unint64_t v71 = 2 * v72;
                  }
                  if (v72 >= 0x2AAAAAAAAAAAAAALL) {
                    unint64_t v73 = 0x555555555555555;
                  }
                  else {
                    unint64_t v73 = v71;
                  }
                  v101[4] = (void **)(v66 + 2);
                  if (v73)
                  {
                    v74 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<_UIAuxillarySolveResult>>(v73);
                    uint64_t v76 = v75;
                  }
                  else
                  {
                    v74 = 0;
                    uint64_t v76 = 0;
                  }
                  v77 = &v74[48 * v70];
                  *(void *)v77 = v59;
                  *((void *)v77 + 1) = v58;
                  *((void *)v77 + 2) = v61;
                  *((void *)v77 + 3) = v60;
                  *((void *)v77 + 4) = v62;
                  *((void *)v77 + 5) = v64;
                  v79 = (void **)*v66;
                  v78 = (void **)v66[1];
                  if (v78 == (void **)*v66)
                  {
                    v84 = (void **)v66[1];
                    v80 = v77;
                  }
                  else
                  {
                    v80 = v77;
                    do
                    {
                      long long v81 = *((_OWORD *)v78 - 3);
                      long long v82 = *((_OWORD *)v78 - 2);
                      *((void *)v80 - 2) = *(v78 - 2);
                      *((_OWORD *)v80 - 3) = v81;
                      *((_OWORD *)v80 - 2) = v82;
                      uint64_t v83 = (uint64_t)*(v78 - 1);
                      *(v78 - 1) = 0;
                      *((void *)v80 - 1) = v83;
                      v80 -= 48;
                      v78 -= 6;
                    }
                    while (v78 != v79);
                    v84 = (void **)*v66;
                    v78 = (void **)v66[1];
                  }
                  v69 = v77 + 48;
                  *v66 = v80;
                  v101[0] = v84;
                  v101[1] = v84;
                  v66[1] = v77 + 48;
                  v101[2] = v78;
                  v85 = (void **)v66[2];
                  v66[2] = &v74[48 * v76];
                  v101[3] = v85;
                  std::__split_buffer<_UIAuxillarySolveResult>::~__split_buffer((uint64_t)v101);
                  v44 = v91;
                }
                else
                {
                  *(void *)v68 = v59;
                  *((void *)v68 + 1) = v58;
                  *((void *)v68 + 2) = v61;
                  *((void *)v68 + 3) = v60;
                  *((void *)v68 + 4) = v62;
                  *((void *)v68 + 5) = v63;
                  v69 = v68 + 48;
                }
                v66[1] = v69;
              }
LABEL_57:

              ++v56;
            }
            while (v56 != v54);
            v53 = obj;
            uint64_t v86 = [obj countByEnumeratingWithState:&v95 objects:v102 count:16];
            uint64_t v54 = v86;
          }
          while (v86);
        }
      }
    }
  }
LABEL_62:
}

@end
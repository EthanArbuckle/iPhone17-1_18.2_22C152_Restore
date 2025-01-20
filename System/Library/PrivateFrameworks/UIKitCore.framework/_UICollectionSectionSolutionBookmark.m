@interface _UICollectionSectionSolutionBookmark
- (double)_layoutFrameIncludingContentInsets:(int)a3 supplementaries:(char)a4 clampingToContainer:;
- (double)contentInsetsOffset;
- (double)sectionAuxiliaryContentInsetsOffset;
- (id)description;
- (id)initWithSolution:(void *)a3 globalFrame:(void *)a4 globalPinningFrame:(void *)a5 insetEnvironment:(void *)a6 supplementaryInsetEnvironment:(double)a7 section:(double)a8 preferredSizes:(double)a9;
- (uint64_t)_containerAxis;
- (void)memoizedDescriptor;
@end

@implementation _UICollectionSectionSolutionBookmark

- (double)contentInsetsOffset
{
  double v1 = 0.0;
  if (a1)
  {
    uint64_t v3 = -[_UICollectionSectionSolutionBookmark _containerAxis](a1);
    if (v3 == 1) {
      uint64_t v4 = 2;
    }
    else {
      uint64_t v4 = v3 == 2;
    }
    [*(id *)(a1 + 88) effectiveInsets];
    if (v4 == 1) {
      return v5;
    }
  }
  return v1;
}

- (uint64_t)_containerAxis
{
  uint64_t v2 = [*(id *)(a1 + 8) layoutAxis];
  int v3 = [*(id *)(a1 + 16) scrollsOrthogonally];
  uint64_t v4 = v2 == 2;
  if (v2 == 1) {
    uint64_t v4 = 2;
  }
  if (v3) {
    return v4;
  }
  else {
    return v2;
  }
}

- (id)initWithSolution:(void *)a3 globalFrame:(void *)a4 globalPinningFrame:(void *)a5 insetEnvironment:(void *)a6 supplementaryInsetEnvironment:(double)a7 section:(double)a8 preferredSizes:(double)a9
{
  v14 = a1;
  if (!a1) {
    return v14;
  }
  if (a2)
  {
    if (a3) {
      goto LABEL_4;
    }
  }
  else
  {
    v32 = [MEMORY[0x1E4F28B00] currentHandler];
    [v32 handleFailureInMethod:sel_initWithSolution_globalFrame_globalPinningFrame_insetEnvironment_supplementaryInsetEnvironment_section_preferredSizes_, v14, @"_UICollectionCompositionalLayoutSolver.m", 3668, @"Invalid parameter not satisfying: %@", @"solution != nil" object file lineNumber description];

    if (a3)
    {
LABEL_4:
      if (a4) {
        goto LABEL_5;
      }
LABEL_14:
      v34 = [MEMORY[0x1E4F28B00] currentHandler];
      [v34 handleFailureInMethod:sel_initWithSolution_globalFrame_globalPinningFrame_insetEnvironment_supplementaryInsetEnvironment_section_preferredSizes_, v14, @"_UICollectionCompositionalLayoutSolver.m", 3670, @"Invalid parameter not satisfying: %@", @"supplementaryInsetEnvironment != nil" object file lineNumber description];

      if (a5) {
        goto LABEL_6;
      }
      goto LABEL_15;
    }
  }
  v33 = [MEMORY[0x1E4F28B00] currentHandler];
  [v33 handleFailureInMethod:sel_initWithSolution_globalFrame_globalPinningFrame_insetEnvironment_supplementaryInsetEnvironment_section_preferredSizes_, v14, @"_UICollectionCompositionalLayoutSolver.m", 3669, @"Invalid parameter not satisfying: %@", @"insetEnvironment != nil" object file lineNumber description];

  if (!a4) {
    goto LABEL_14;
  }
LABEL_5:
  if (a5) {
    goto LABEL_6;
  }
LABEL_15:
  v35 = [MEMORY[0x1E4F28B00] currentHandler];
  [v35 handleFailureInMethod:sel_initWithSolution_globalFrame_globalPinningFrame_insetEnvironment_supplementaryInsetEnvironment_section_preferredSizes_, v14, @"_UICollectionCompositionalLayoutSolver.m", 3671, @"Invalid parameter not satisfying: %@", @"section != nil" object file lineNumber description];

LABEL_6:
  v36.receiver = v14;
  v36.super_class = (Class)_UICollectionSectionSolutionBookmark;
  v28 = (id *)objc_msgSendSuper2(&v36, sel_init);
  v14 = v28;
  if (v28)
  {
    objc_storeStrong(v28 + 1, a2);
    *((double *)v14 + 3) = a7;
    *((double *)v14 + 4) = a8;
    *((double *)v14 + 5) = a9;
    *((double *)v14 + 6) = a10;
    *((double *)v14 + 7) = a11;
    *((double *)v14 + 8) = a12;
    *((double *)v14 + 9) = a13;
    *((double *)v14 + 10) = a14;
    objc_storeStrong(v14 + 11, a3);
    objc_storeStrong(v14 + 12, a4);
    objc_storeStrong(v14 + 2, a5);
    if (a6) {
      v29 = a6;
    }
    else {
      v29 = objc_alloc_init(_UICollectionPreferredSizes);
    }
    id v30 = v14[13];
    v14[13] = v29;
  }
  return v14;
}

- (double)sectionAuxiliaryContentInsetsOffset
{
  double v1 = 0.0;
  if (a1)
  {
    uint64_t v3 = -[_UICollectionSectionSolutionBookmark _containerAxis](a1);
    if (v3 == 1) {
      uint64_t v4 = 2;
    }
    else {
      uint64_t v4 = v3 == 2;
    }
    [*(id *)(a1 + 96) effectiveInsets];
    if (v4 == 1) {
      return v5;
    }
  }
  return v1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memoizedDescriptor, 0);
  objc_storeStrong((id *)&self->_preferredSizes, 0);
  objc_storeStrong((id *)&self->_supplementaryInsetEnvironment, 0);
  objc_storeStrong((id *)&self->_insetEnvironment, 0);
  objc_storeStrong((id *)&self->_section, 0);
  objc_storeStrong((id *)&self->_solution, 0);
}

- (void)memoizedDescriptor
{
  if (a1)
  {
    uint64_t v3 = (id *)(a1 + 112);
    uint64_t v2 = *(void **)(a1 + 112);
    if (v2)
    {
      uint64_t v4 = v2;
    }
    else
    {
      id v5 = *(id *)(a1 + 16);
      id v6 = *(id *)(a1 + 8);
      uint64_t v4 = objc_opt_new();
      uint64_t v7 = [v6 layoutAxis];
      uint64_t v8 = [v5 orthogonalScrollingBehavior];
      unint64_t v9 = v8 & 0xFFFFFFFFFFFFFFFELL;
      v10 = [v5 _orthogonalScrollingProperties];
      v11 = v10;
      if (v10)
      {
        [v10 decelerationRate];
        uint64_t v78 = v12;
        uint64_t v76 = [v11 bounce];
      }
      else
      {
        uint64_t v76 = 0;
        uint64_t v78 = *(void *)off_1E52D6B50;
      }
      double v13 = 0.0;
      uint64_t v14 = 0;
      if (v9 == 4)
      {
        [v5 interGroupSpacing];
        uint64_t v14 = v15;
      }
      if (objc_msgSend(v5, "scrollsOrthogonally", v76))
      {
        [v6 _dimensionForRootGroupAlongAxis:v7];
        double v17 = v16;
        [v5 interGroupSpacing];
        double v13 = v17 + v18;
      }
      uint64_t v96 = v7;
      if (v9 == 4) {
        double v19 = v13;
      }
      else {
        double v19 = 0.0;
      }
      [v5 _cornerRadius];
      uint64_t v21 = v20;
      char v91 = [v5 _clipsContentToBounds];
      char v22 = [v5 _excludesBoundarySupplementariesFromClipping];
      double v94 = v13;
      uint64_t v95 = v14;
      uint64_t v92 = v21;
      double v93 = v19;
      if (v22)
      {
        BOOL v23 = 0;
      }
      else
      {
        v24 = [v5 boundarySupplementaryItems];
        BOOL v23 = [v24 count] != 0;
      }
      [v5 _clippingInsets];
      double v26 = v25;
      double v28 = v27;
      double v97 = v29;
      double v31 = v30;
      v32 = [v6 traitCollection];
      [v32 displayScale];
      double v82 = v33;

      double v34 = -[_UICollectionSectionSolutionBookmark _layoutFrameIncludingContentInsets:supplementaries:clampingToContainer:](a1, 1, 1, 1);
      uint64_t v89 = v35;
      double v90 = v34;
      uint64_t v87 = v37;
      uint64_t v88 = v36;
      double v38 = -[_UICollectionSectionSolutionBookmark _layoutFrameIncludingContentInsets:supplementaries:clampingToContainer:](a1, 0, 0, 0);
      uint64_t v85 = v39;
      double v86 = v38;
      uint64_t v83 = v41;
      uint64_t v84 = v40;
      v99.origin.CGFloat x = -[_UICollectionSectionSolutionBookmark _layoutFrameIncludingContentInsets:supplementaries:clampingToContainer:](a1, 0, 0, 1);
      CGFloat x = v99.origin.x;
      CGFloat y = v99.origin.y;
      CGFloat width = v99.size.width;
      CGFloat height = v99.size.height;
      double MinX = CGRectGetMinX(v99);
      v100.origin.CGFloat x = x;
      v100.origin.CGFloat y = y;
      v100.size.CGFloat width = width;
      v100.size.CGFloat height = height;
      double MinY = CGRectGetMinY(v100);
      v101.origin.CGFloat x = x;
      v101.origin.CGFloat y = y;
      v101.size.CGFloat width = width;
      v101.size.CGFloat height = height;
      double v79 = CGRectGetWidth(v101);
      v102.origin.CGFloat x = x;
      v102.origin.CGFloat y = y;
      v102.size.CGFloat width = width;
      v102.size.CGFloat height = height;
      double v46 = CGRectGetHeight(v102);
      CGFloat v47 = v28
          + -[_UICollectionSectionSolutionBookmark _layoutFrameIncludingContentInsets:supplementaries:clampingToContainer:](a1, 1, v23, 1);
      CGFloat v50 = v26 + v49;
      CGFloat v52 = v51 - (v26 + v97);
      v103.origin.CGFloat x = v47;
      v103.origin.CGFloat y = v50;
      v103.size.CGFloat width = v53 - (v31 + v28);
      CGFloat v48 = v103.size.width;
      v103.size.CGFloat height = v52;
      double v54 = CGRectGetMinX(v103);
      v104.origin.CGFloat x = v47;
      v104.origin.CGFloat y = v50;
      v104.size.CGFloat width = v48;
      v104.size.CGFloat height = v52;
      double v55 = CGRectGetMinY(v104);
      v105.origin.CGFloat x = v47;
      v105.origin.CGFloat y = v50;
      v105.size.CGFloat width = v48;
      v105.size.CGFloat height = v52;
      double v56 = CGRectGetWidth(v105);
      v106.origin.CGFloat x = v47;
      v106.origin.CGFloat y = v50;
      v106.size.CGFloat width = v48;
      v106.size.CGFloat height = v52;
      double v57 = CGRectGetHeight(v106);
      if (v4)
      {
        double v58 = 1.0;
        if (fabs(v82) >= 2.22044605e-16) {
          double v58 = v82;
        }
        double v59 = round(v58 * v57) / v58;
        double v60 = round(v58 * v56) / v58;
        double v61 = round(v58 * v55) / v58;
        double v62 = round(v58 * v54) / v58;
        double v63 = round(v58 * v46) / v58;
        double v64 = round(v58 * v79) / v58;
        double v65 = round(v58 * MinY) / v58;
        v4[2] = v96;
        v4[3] = v8;
        v4[4] = v78;
        v4[5] = v77;
        *((unsigned char *)v4 + 8) = v91;
        *((unsigned char *)v4 + 9) = v22;
        v4[6] = v92;
        double v66 = round(v58 * MinX) / v58;
        [v6 orthogonalScrollingPrefetchingUnitVector];
        v4[10] = v67;
        v4[11] = v68;
        *((double *)v4 + 7) = v93;
        *((double *)v4 + 8) = v94;
        v4[9] = v95;
        [v6 orthogonalOffset];
        v4[12] = v69;
        v4[13] = v70;
        *((double *)v4 + 14) = v90;
        v4[15] = v89;
        v4[16] = v88;
        v4[17] = v87;
        *((double *)v4 + 18) = v86;
        v4[19] = v85;
        v4[20] = v84;
        v4[21] = v83;
        *((double *)v4 + 26) = v66;
        *((double *)v4 + 27) = v65;
        *((double *)v4 + 28) = v64;
        *((double *)v4 + 29) = v63;
        [v5 contentInsets];
        v4[22] = v71;
        v4[23] = v72;
        v4[24] = v73;
        v4[25] = v74;
        *((double *)v4 + 30) = v62;
        *((double *)v4 + 31) = v61;
        *((double *)v4 + 32) = v60;
        *((double *)v4 + 33) = v59;
      }
      else
      {
        objc_msgSend(v6, "orthogonalScrollingPrefetchingUnitVector", v57);
        [v6 orthogonalOffset];
        [v5 contentInsets];
      }
      objc_storeStrong(v3, v4);
    }
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

- (double)_layoutFrameIncludingContentInsets:(int)a3 supplementaries:(char)a4 clampingToContainer:
{
  id v8 = *(id *)(a1 + 8);
  double v9 = *(double *)(a1 + 24);
  double v10 = *(double *)(a1 + 32);
  uint64_t v11 = -[_UICollectionSectionSolutionBookmark _containerAxis](a1);
  uint64_t v12 = v11;
  if (v11 == 1) {
    uint64_t v13 = 2;
  }
  else {
    uint64_t v13 = v11 == 2;
  }
  uint64_t v14 = [v8 layoutSection];
  [v14 contentInsets];
  double v66 = v16;
  double v67 = v15;
  double v64 = v18;
  double v65 = v17;

  if (a3)
  {
    double v62 = v10;
    double v63 = v9;
    [*(id *)(a1 + 88) effectiveInsets];
    double v20 = v19;
    double v22 = v21;
    [*(id *)(a1 + 96) effectiveInsets];
    double v58 = v24;
    double v59 = v23;
    double v25 = _UILeadingOffsetForInsetsAlongAxis(v13, v23, v24);
    double v26 = _UILeadingOffsetForInsetsAlongAxis(v13, v20, v22);
    [v8 contentFrameIncludingAuxiliaries];
    double v60 = v28;
    double v61 = v27;
    double v68 = v30;
    double v69 = v29;
    if (v25 < v26)
    {
      double v31 = [v8 supplementaryContainer];
      double v22 = v58;
      double v20 = v59;
    }
    else
    {
      double v31 = [v8 container];
    }
    double v10 = v62;
    double v9 = v63;
    double v35 = v60;
    double v33 = v61;
  }
  else
  {
    [v8 primaryContentFrame];
    double v33 = v32;
    double v35 = v34;
    double v68 = v37;
    double v69 = v36;
    [*(id *)(a1 + 88) effectiveInsets];
    double v20 = v38;
    double v22 = v39;
    double v31 = [v8 container];
  }
  double v40 = _UIAddPointValueForAxisFromPoint(v12, v33, v35, v9, v10);
  double v41 = _UILeadingOffsetForInsetsAlongAxis(v13, v20, v22);
  double v42 = v40 + _UISetPointValueForAxis(v13, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v41);
  if (a3)
  {
    if (a4)
    {
      if (a2)
      {
        double v44 = v68;
        double v43 = v69;
LABEL_16:
        objc_msgSend(v31, "contentSize", *(void *)&v58, *(void *)&v59);
        double v47 = _UISizeValueForAxis(v13, v45, v46);
        double v48 = v43;
        double v49 = v44;
LABEL_19:
        _UISetSizeValueForAxis(v13, v48, v49, v47);
        goto LABEL_20;
      }
LABEL_18:
      double v50 = _UITotalEdgeDimensionsForLayoutAxis(v13, v67, v65, v64, v66);
      [v31 contentSize];
      double v52 = v51;
      double v54 = v53;
      double v55 = _UISetSizeValueForAxis(v13, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8), -v50);
      double v47 = _UISizeValueForAxis(v13, v52 + v55, v54 + v56);
      double v49 = v68;
      double v48 = v69;
      goto LABEL_19;
    }
  }
  else if (a2)
  {
    double v42 = v42 - v65;
    double v43 = v69 - (-v65 - v66);
    double v44 = v68 - (-v64 - v67);
    if (a4) {
      goto LABEL_16;
    }
  }
  else if (a4)
  {
    goto LABEL_18;
  }
LABEL_20:

  return v42;
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = NSStringFromRect(self->_globalFrame);
  insetEnvironment = self->_insetEnvironment;
  section = self->_section;
  double v9 = -[_UICollectionPreferredSizes indexes]((uint64_t)self->_preferredSizes);
  objc_msgSend(v3, "stringWithFormat:", @"<%@ %p: frame=%@; insetEnvironment=%@; section=%p; preferredSizes:%@>",
    v5,
    self,
    v6,
    insetEnvironment,
    section,
  double v10 = v9);

  return v10;
}

@end
@interface _UICollectionViewDataAttributesMap
- (void)_setItemAttributes:(uint64_t)a3 forGlobalItemIndex:;
- (void)_validateLayoutInRect:(CGFloat)a3;
- (void)indexesOfItemsInRect:(CGFloat)a3;
- (void)initWithCollectionViewData:(void *)a1;
- (void)invalidate;
- (void)pageInLayoutAttributes:(uint64_t)a3 forGlobalItemIndex:;
@end

@implementation _UICollectionViewDataAttributesMap

- (void)_setItemAttributes:(uint64_t)a3 forGlobalItemIndex:
{
  [a2 frame];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  uint64_t v14 = *(void *)(a1 + 8);
  uint64_t v18 = a3;
  char v19 = 0;
  char v20 = 0;
  id v21 = 0;
  id v22 = 0;
  LOBYTE(a3) = -[_UICollectionViewRTree insertFrame:forElement:](v14, (uint64_t)&v18, v6, v8, v10, v12);

  if ((a3 & 1) == 0)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    v23.origin.x = v7;
    v23.origin.y = v9;
    v23.size.width = v11;
    v23.size.height = v13;
    v16 = NSStringFromCGRect(v23);
    v17 = -[_UIHomeAffordanceObservationRecord observer](*(id **)(a1 + 40));
    [v15 handleFailureInMethod:sel__setItemAttributes_forGlobalItemIndex_, a1, @"_UICollectionViewDataAttributesMap.mm", 104, @"UICollectionView received layout attributes with invalid frame (%@). Layout attributes: %@. Collection view: %@.", v16, a2, v17 object file lineNumber description];
  }
}

- (void)pageInLayoutAttributes:(uint64_t)a3 forGlobalItemIndex:
{
  if (a1)
  {
    if (!a2)
    {
      CGFloat v6 = [MEMORY[0x1E4F28B00] currentHandler];
      [v6 handleFailureInMethod:sel_pageInLayoutAttributes_forGlobalItemIndex_, a1, @"_UICollectionViewDataAttributesMap.mm", 93, @"Invalid parameter not satisfying: %@", @"layoutAttributes != nil" object file lineNumber description];
    }
    -[_UICollectionViewDataAttributesMap _setItemAttributes:forGlobalItemIndex:](a1, a2, a3);
  }
}

- (void)_validateLayoutInRect:(CGFloat)a3
{
  uint64_t v110 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    CGFloat v10 = *(double *)(a1 + 48);
    CGFloat v11 = *(double *)(a1 + 56);
    CGFloat v13 = *(double *)(a1 + 64);
    CGFloat v12 = *(double *)(a1 + 72);
    v111.origin.CGFloat x = v10;
    v111.origin.CGFloat y = v11;
    v111.size.double width = v13;
    v111.size.double height = v12;
    v133.origin.CGFloat x = a2;
    v133.origin.CGFloat y = a3;
    v133.size.double width = a4;
    v133.size.double height = a5;
    if (CGRectContainsRect(v111, v133))
    {
      unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("UICollectionViewAttrMap", &_MergedGlobals_1200);
      if ((*(unsigned char *)CategoryCachedImpl & 1) == 0) {
        return;
      }
      v15 = *(id *)(CategoryCachedImpl + 8);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v112.origin.CGFloat x = a2;
        v112.origin.CGFloat y = a3;
        v112.size.double width = a4;
        v112.size.double height = a5;
        NSStringFromCGRect(v112);
        v16 = (objc_class *)objc_claimAutoreleasedReturnValue();
        v113.origin.CGFloat x = v10;
        v113.origin.CGFloat y = v11;
        v113.size.double width = v13;
        v113.size.double height = v12;
        v17 = NSStringFromCGRect(v113);
        *(_DWORD *)buf = 134218498;
        *(void *)&buf[4] = a1;
        __int16 v102 = 2112;
        v103 = v16;
        __int16 v104 = 2112;
        id v105 = v17;
        _os_log_impl(&dword_1853B0000, v15, OS_LOG_TYPE_ERROR, "_rTreeValidate: map: %p; returning early because query rect is within valid rect. query: %@. validRect: %@",
          buf,
          0x20u);
      }
      goto LABEL_75;
    }
    uint64_t v18 = (id *)*(id *)(a1 + 40);
    v15 = v18;
    if (!v18)
    {
LABEL_75:

      return;
    }
    *(CGFloat *)rect = v10;
    id WeakRetained = objc_loadWeakRetained(v18 + 1);
    char v20 = WeakRetained;
    if (!WeakRetained) {
      goto LABEL_74;
    }
    id v84 = WeakRetained;
    [WeakRetained _visibleBounds];
    double v83 = v21;
    double v23 = v22;
    v24 = (double *)*(id *)(a1 + 40);
    CGFloat v89 = v11;
    double v90 = v12;
    double v88 = v13;
    double v82 = v23;
    if (v23 > 0.0
      && ((int IsValid = CGFloatIsValid(), v83 > 0.0) ? (v26 = IsValid) : (v26 = 0), v26 == 1 && (CGFloatIsValid() & 1) != 0))
    {
      -[UICollectionViewData _validateContentSize]((uint64_t)v24);
      if (v24)
      {
        double v27 = v24[10];
        double v28 = v24[11];
      }
      else
      {
        double v28 = 0.0;
        double v27 = 0.0;
      }
      double v92 = v27;
      v114.origin.CGFloat x = a2;
      v114.origin.CGFloat y = a3;
      v114.size.double width = a4;
      v114.size.double height = a5;
      double MinX = CGRectGetMinX(v114);
      v115.origin.CGFloat x = v82 * floor(a2 / v82);
      rect[1] = *(void *)&v115.origin.x;
      v115.origin.CGFloat y = a3;
      v115.size.double width = a4;
      v115.size.double height = a5;
      double v30 = v82 * ceil((a4 + MinX - CGRectGetMinX(v115)) / v82);
      *(void *)&v116.origin.CGFloat x = rect[1];
      v116.origin.CGFloat y = a3;
      v116.size.double width = v30;
      v116.size.double height = a5;
      if (CGRectGetMaxX(v116) > v92 && (dyld_program_sdk_at_least() & 1) == 0)
      {
        *(void *)&v117.origin.CGFloat x = rect[1];
        v117.origin.CGFloat y = a3;
        v117.size.double width = v30;
        v117.size.double height = a5;
        double v30 = v30 - (CGRectGetMaxX(v117) - v92);
      }
      v118.origin.CGFloat x = a2;
      v118.origin.CGFloat y = a3;
      v118.size.double width = a4;
      v118.size.double height = a5;
      double MinY = CGRectGetMinY(v118);
      v119.origin.CGFloat y = v83 * floor(a3 / v83);
      *(void *)&v119.origin.CGFloat x = rect[1];
      CGFloat y = v119.origin.y;
      v119.size.double width = v30;
      v119.size.double height = a5;
      double v31 = v83 * ceil((a5 + MinY - CGRectGetMinY(v119)) / v83);
      *(void *)&v120.origin.CGFloat x = rect[1];
      v120.origin.CGFloat y = y;
      v120.size.double width = v30;
      v120.size.double height = v31;
      if (CGRectGetMaxY(v120) <= v28 || (dyld_program_sdk_at_least() & 1) != 0)
      {
        CGFloat v32 = v30;
        CGFloat v33 = *(double *)&rect[1];
        double v34 = v31;
      }
      else
      {
        *(void *)&v125.origin.CGFloat x = rect[1];
        v125.origin.CGFloat y = y;
        v125.size.double width = v30;
        v125.size.double height = v31;
        double v34 = v31 - (CGRectGetMaxY(v125) - v28);
        CGFloat v32 = v30;
        CGFloat v33 = *(double *)&rect[1];
      }
      CGFloat v35 = y;
    }
    else
    {
      double v34 = a5;
      CGFloat v32 = a4;
      CGFloat v35 = a3;
      CGFloat v33 = a2;
    }

    *(CGFloat *)&rect[1] = v33;
    v121.origin.CGFloat x = v33;
    v121.origin.CGFloat y = v35;
    v121.size.double width = v32;
    v121.size.double height = v34;
    BOOL IsEmpty = CGRectIsEmpty(v121);
    uint64_t v37 = rect[0];
    double v38 = v90;
    if (IsEmpty)
    {
      double v40 = v88;
      CGFloat v39 = v89;
      if (CGRectIsEmpty(*(CGRect *)&v37))
      {
        unint64_t v41 = __UILogGetCategoryCachedImpl("UICollectionViewAttrMap", &qword_1EB2624E8);
        char v20 = v84;
        if (*(unsigned char *)v41)
        {
          v42 = *(id *)(v41 + 8);
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            v122.origin.CGFloat x = a2;
            v122.origin.CGFloat y = a3;
            v122.size.double width = a4;
            v122.size.double height = a5;
            NSStringFromCGRect(v122);
            v43 = (objc_class *)objc_claimAutoreleasedReturnValue();
            *(void *)&v123.origin.CGFloat x = rect[0];
            v123.origin.CGFloat y = v89;
            v123.size.double width = v88;
            v123.size.double height = v90;
            v44 = NSStringFromCGRect(v123);
            *(_DWORD *)buf = 134218498;
            *(void *)&buf[4] = a1;
            __int16 v102 = 2112;
            v103 = v43;
            __int16 v104 = 2112;
            id v105 = v44;
            _os_log_impl(&dword_1853B0000, v42, OS_LOG_TYPE_ERROR, "_rTreeValidate: map: %p; returning early because query & currently valid rects are both empty. queryRect: "
              "%@. validRect: %@",
              buf,
              0x20u);
          }
          goto LABEL_73;
        }
LABEL_74:

        goto LABEL_75;
      }
    }
    double v45 = v32;
    *(void *)&v134.origin.CGFloat x = rect[1];
    float64_t v46 = v35;
    v134.origin.CGFloat y = v35;
    v134.size.double width = v45;
    v134.size.double height = v34;
    CGRect v124 = CGRectUnion(*(CGRect *)(a1 + 48), v134);
    CGFloat v85 = v124.origin.y;
    CGFloat x = v124.origin.x;
    double height = v124.size.height;
    double width = v124.size.width;
    *(void *)&v124.origin.CGFloat x = rect[1];
    v124.origin.CGFloat y = v35;
    v124.size.double width = v45;
    v124.size.double height = v34;
    *(void *)&v135.origin.CGFloat x = rect[0];
    v135.origin.CGFloat y = v89;
    v135.size.double width = v88;
    v135.size.double height = v90;
    if (CGRectIntersectsRect(v124, v135)
      && (width != v88 ? (BOOL v47 = height == v90) : (BOOL v47 = 1),
          v47 && (height <= v83 * 5.0 ? (BOOL v48 = width > v82 * 5.0) : (BOOL v48 = 1), !v48)))
    {
      unint64_t v49 = __UILogGetCategoryCachedImpl("UICollectionViewAttrMap", &qword_1EB2624F0);
      if (*(unsigned char *)v49)
      {
        v77 = *(id *)(v49 + 8);
        if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
        {
          v129.origin.CGFloat x = a2;
          v129.origin.CGFloat y = a3;
          v129.size.double width = a4;
          v129.size.double height = a5;
          NSStringFromCGRect(v129);
          v78 = (objc_class *)(id)objc_claimAutoreleasedReturnValue();
          *(void *)&v130.origin.CGFloat x = rect[1];
          v130.size.double height = v34;
          v130.origin.CGFloat y = v35;
          v130.size.double width = v45;
          NSStringFromCGRect(v130);
          id v79 = (id)objc_claimAutoreleasedReturnValue();
          *(void *)&v131.origin.CGFloat x = rect[0];
          v131.size.double width = v88;
          v131.origin.CGFloat y = v89;
          v131.size.double height = v90;
          v80 = NSStringFromCGRect(v131);
          v132.origin.CGFloat y = v85;
          v132.origin.CGFloat x = x;
          v132.size.double height = height;
          v132.size.double width = width;
          v81 = NSStringFromCGRect(v132);
          *(_DWORD *)buf = 134219010;
          *(void *)&buf[4] = a1;
          __int16 v102 = 2112;
          v103 = v78;
          __int16 v104 = 2112;
          id v105 = v79;
          __int16 v106 = 2112;
          v107 = v80;
          __int16 v108 = 2112;
          v109 = v81;
          _os_log_impl(&dword_1853B0000, v77, OS_LOG_TYPE_ERROR, "_rTreeValidate: map: %p; for query: %@, fault rect (%@) intersects with valid rect (%@). Using union (%@)",
            buf,
            0x34u);
        }
        float64_t v46 = v35;
      }
      if (dyld_program_sdk_at_least())
      {
        *(void *)&v50.f64[0] = rect[1];
        v51.f64[0] = v45;
        -[_UICollectionViewRTree removeAttributesWithFramesIntersectingFrame:](*(void *)(a1 + 8), v50, v46, v51, v34);
      }
    }
    else
    {
      unint64_t v52 = __UILogGetCategoryCachedImpl("UICollectionViewAttrMap", &qword_1EB2624F8);
      if (*(unsigned char *)v52)
      {
        v73 = *(id *)(v52 + 8);
        if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
        {
          v126.origin.CGFloat x = a2;
          v126.origin.CGFloat y = a3;
          v126.size.double width = a4;
          v126.size.double height = a5;
          NSStringFromCGRect(v126);
          v74 = (objc_class *)(id)objc_claimAutoreleasedReturnValue();
          *(void *)&v127.origin.CGFloat x = rect[0];
          v127.size.double width = v88;
          v127.origin.CGFloat y = v89;
          v127.size.double height = v90;
          v75 = NSStringFromCGRect(v127);
          *(void *)&v128.origin.CGFloat x = rect[1];
          v128.size.double height = v34;
          v128.origin.CGFloat y = v35;
          v128.size.double width = v45;
          v76 = NSStringFromCGRect(v128);
          *(_DWORD *)buf = 134218754;
          *(void *)&buf[4] = a1;
          __int16 v102 = 2112;
          v103 = v74;
          __int16 v104 = 2112;
          id v105 = v75;
          __int16 v106 = 2112;
          v107 = v76;
          _os_log_impl(&dword_1853B0000, v73, OS_LOG_TYPE_ERROR, "_rTreeValidate: map: %p; Reinitialising rTree for query: %@; currentValidLayoutRect: %@; fault rect: %@.",
            buf,
            0x2Au);

          float64_t v46 = v35;
        }
      }
      v53 = objc_alloc_init(_UICollectionViewRTree);
      v54 = *(void **)(a1 + 8);
      *(void *)(a1 + 8) = v53;

      CGFloat v85 = v46;
      CGFloat x = *(double *)&rect[1];
      double height = v34;
      double width = v45;
    }
    *(CGFloat *)(a1 + 48) = x;
    *(CGFloat *)(a1 + 56) = v85;
    *(double *)(a1 + 64) = width;
    *(double *)(a1 + 72) = height;
    -[UICollectionViewData _layoutAttributesForElementsInRectForMapping:](v15, *(double *)&rect[1], v46, v45, v34);
    long long v97 = 0u;
    long long v98 = 0u;
    *(_OWORD *)&rect[3] = 0u;
    long long v96 = 0u;
    v42 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v55 = [v42 countByEnumeratingWithState:&rect[3] objects:v100 count:16];
    if (!v55)
    {
LABEL_72:

      LOBYTE(v15[12].isa) &= ~1u;
LABEL_73:

      char v20 = v84;
      goto LABEL_74;
    }
    uint64_t v56 = *(void *)v96;
LABEL_45:
    uint64_t v57 = 0;
    while (1)
    {
      if (*(void *)v96 != v56) {
        objc_enumerationMutation(v42);
      }
      v58 = *(_WORD **)(rect[4] + 8 * v57);
      if (v58 && (__int16 v59 = v58[144], (v59 & 8) != 0))
      {
        uint64_t v63 = 32;
        if ((v59 & 3) == 0) {
          uint64_t v63 = 24;
        }
        if (v59) {
          uint64_t v64 = 16;
        }
        else {
          uint64_t v64 = v63;
        }
        v65 = *(void **)(a1 + v64);
        if (!v65)
        {
          uint64_t v69 = [MEMORY[0x1E4F1CA48] arrayWithObject:*(void *)(rect[4] + 8 * v57)];
          v70 = *(NSObject **)(a1 + v64);
          *(void *)(a1 + v64) = v69;
LABEL_69:

          goto LABEL_70;
        }
        [v65 addObject:*(void *)(rect[4] + 8 * v57)];
      }
      else
      {
        id v60 = -[UICollectionViewLayoutAttributes __indexPath](*(void **)(rect[4] + 8 * v57));
        v61 = v60;
        if (v58 && (v58[144] & 1) != 0)
        {
          if (!-[UICollectionViewData _isIndexPathValid:validateItemCounts:]((uint64_t)v15, v60, 0))
          {
            v70 = *(id *)(__UILogGetCategoryCachedImpl("CollectionView", &qword_1EB262500) + 8);
            if (!os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
              goto LABEL_69;
            }
LABEL_68:
            v71 = v15[2].isa;
            v72 = -[UICollectionViewData dataSourceCountsDescription](v15);
            *(_DWORD *)buf = 138412802;
            *(void *)&buf[4] = v58;
            __int16 v102 = 2112;
            v103 = v71;
            __int16 v104 = 2112;
            id v105 = v72;
            _os_log_impl(&dword_1853B0000, v70, OS_LOG_TYPE_ERROR, "Received layout attributes with an invalid index path. Attributes will be ignored. Attributes: %@; layout:"
              " %@; data source counts: %@",
              buf,
              0x20u);

            goto LABEL_69;
          }
          *(void *)buf = 0;
          uint64_t v99 = 0;
          objc_msgSend(v61, "ui_getSectionIndex:itemIndex:", buf, &v99);
          uint64_t v66 = -[UICollectionViewData numberOfItemsBeforeSection:]((uint64_t)v15, *(uint64_t *)buf);
          unint64_t v67 = v99 + v66;
          -[_UICollectionViewDataAttributesMap _setItemAttributes:forGlobalItemIndex:](a1, v58, v99 + v66);
          [(UICollectionViewData *)(uint64_t)v15 _attributesMapDidPageInAttributes:v67 globalItemIndex:v68];
        }
        else
        {
          if ([v60 section] >= (v15[14].isa - v15[13].isa) >> 3
            && [v61 item] != 0x7FFFFFFFFFFFFFFFLL)
          {
            v70 = *(id *)(__UILogGetCategoryCachedImpl("CollectionView", &qword_1EB262508) + 8);
            if (!os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
              goto LABEL_69;
            }
            goto LABEL_68;
          }
          [(UICollectionViewData *)(uint64_t)v15 _attributesMapDidPageInAttributes:0x7FFFFFFFFFFFFFFFuLL globalItemIndex:v62];
        }
      }
LABEL_70:
      if (v55 == ++v57)
      {
        uint64_t v55 = [v42 countByEnumeratingWithState:&rect[3] objects:v100 count:16];
        if (!v55) {
          goto LABEL_72;
        }
        goto LABEL_45;
      }
    }
  }
}

- (void)initWithCollectionViewData:(void *)a1
{
  if (!a1) {
    return 0;
  }
  v8.receiver = a1;
  v8.super_class = (Class)_UICollectionViewDataAttributesMap;
  v3 = objc_msgSendSuper2(&v8, sel_init);
  v4 = v3;
  if (v3)
  {
    v3[5] = a2;
    v5 = objc_alloc_init(_UICollectionViewRTree);
    CGFloat v6 = (void *)v4[1];
    v4[1] = v5;
  }
  return v4;
}

- (void)invalidate
{
  if (a1)
  {
    v2 = objc_alloc_init(_UICollectionViewRTree);
    v3 = *(void **)(a1 + 8);
    *(void *)(a1 + 8) = v2;

    long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
    *(_OWORD *)(a1 + 48) = *MEMORY[0x1E4F1DB28];
    *(_OWORD *)(a1 + 64) = v4;
    v5 = *(void **)(a1 + 32);
    *(void *)(a1 + 32) = 0;

    objc_storeStrong((id *)(a1 + 24), *(id *)(a1 + 32));
    CGFloat v6 = *(void **)(a1 + 24);
    objc_storeStrong((id *)(a1 + 16), v6);
  }
}

- (void)indexesOfItemsInRect:(CGFloat)a3
{
  v5 = a1;
  if (a1)
  {
    if (CGRectIsNull(*(CGRect *)&a2)) {
      goto LABEL_5;
    }
    v45.origin.CGFloat x = a2;
    v45.size.double width = a4;
    v45.origin.CGFloat y = a3;
    v45.size.double height = a5;
    if (CGRectIsEmpty(v45)
      || (v46.origin.CGFloat x = a2, v46.size.width = a4, v46.origin.y = a3, v46.size.height = a5, CGRectIsInfinite(v46)))
    {
LABEL_5:
      v5 = +[_UIFastIndexSet indexSet];
    }
    else
    {
      CGFloat v7 = +[_UIMutableFastIndexSet indexSet];
      uint64_t v38 = 0;
      CGFloat v39 = &v38;
      uint64_t v40 = 0x2020000000;
      uint64_t v41 = 0x7FFFFFFFFFFFFFFFLL;
      uint64_t v34 = 0;
      CGFloat v35 = &v34;
      uint64_t v36 = 0x2020000000;
      uint64_t v37 = 0x7FFFFFFFFFFFFFFFLL;
      uint64_t v8 = v5[1];
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __59___UICollectionViewDataAttributesMap_indexesOfItemsInRect___block_invoke;
      v30[3] = &unk_1E5303B88;
      CGFloat v32 = &v34;
      CGFloat v33 = &v38;
      v5 = v7;
      id v31 = v5;
      if (v8)
      {
        v11.f64[0] = a2;
        v10.f64[0] = a4;
        v11.f64[1] = a3;
        char v43 = 0;
        v10.f64[1] = a5;
        float64x2_t v12 = vaddq_f64(v11, vminnmq_f64(v10, (float64x2_t)0));
        __asm { FMOV            V2.2D, #6.0 }
        float64x2_t v18 = vmulq_f64(v12, _Q2);
        float64x2_t v19 = vmulq_f64(vabsq_f64(v10), _Q2);
        float64x2_t v20 = vrndaq_f64(v18);
        float64x2_t v21 = vrndaq_f64(v19);
        float64x2_t v22 = (float64x2_t)vdupq_n_s64(0x3F43A92A30553262uLL);
        double v23 = *(void **)(v8 + 8);
        v42[0] = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v22, vabdq_f64(v18, v20)), (int8x16_t)v20, (int8x16_t)v18);
        v42[1] = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v22, vabdq_f64(v19, v21)), (int8x16_t)v21, (int8x16_t)v19);
        _UIRTreeContainerNode<_UICollectionViewRTreeElement>::enumerateElementsIntersectingWithConstRef(v23, v42, &v43, (uint64_t)v30);
        v24 = v39;
      }
      else
      {
        v24 = &v38;
      }
      unint64_t v25 = v24[3];
      if (v25 != 0x7FFFFFFFFFFFFFFFLL) {
        -[_UIMutableFastIndexSet addIndexesInRange:]((uint64_t)v5, v25, v35[3] - v25, v9);
      }

      _Block_object_dispose(&v34, 8);
      _Block_object_dispose(&v38, 8);
    }
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clonedDecorationAttributes, 0);
  objc_storeStrong((id *)&self->_clonedSupplementaryAttributes, 0);
  objc_storeStrong((id *)&self->_clonedCellAttributes, 0);
  objc_storeStrong((id *)&self->_rTree, 0);
}

@end
@interface _UIFlowLayoutInfo
- (_UIFlowLayoutInfo)init;
- (_UIFlowLayoutSection)addSection;
- (id)copy;
- (id)setSize:(double)a3 forItemAtIndexPath:(double)a4;
- (id)specifiedItemSizes;
- (void)didUpdateSizeForSection:(double)a3 withDelta:;
- (void)invalidate:(uint64_t)a1;
- (void)setSizes:(void *)a3 forItemsAtIndexPaths:;
@end

@implementation _UIFlowLayoutInfo

- (void)didUpdateSizeForSection:(double)a3 withDelta:
{
  if (a1)
  {
    for (unint64_t i = a2 + 1; i < [*(id *)(a1 + 104) count]; ++i)
    {
      v6 = [*(id *)(a1 + 104) objectAtIndexedSubscript:i];
      if (v6)
      {
        double v7 = -0.0;
        if (*(unsigned char *)(a1 + 97)) {
          double v8 = a3;
        }
        else {
          double v8 = -0.0;
        }
        if (!*(unsigned char *)(a1 + 97)) {
          double v7 = a3;
        }
        double v9 = v6[40] + v7;
        v6[39] = v6[39] + v8;
        v6[40] = v9;
      }
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 120));
    [WeakRetained _updateContentSizeScrollingDimensionWithDelta:a3];
  }
}

- (_UIFlowLayoutSection)addSection
{
  if (a1)
  {
    v2 = objc_alloc_init(_UIFlowLayoutSection);
    v3 = v2;
    if (v2) {
      objc_storeWeak((id *)&v2->_layoutInfo, a1);
    }
    [a1[13] addObject:v3];
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (_UIFlowLayoutInfo)init
{
  v7.receiver = self;
  v7.super_class = (Class)_UIFlowLayoutInfo;
  v2 = [(_UIFlowLayoutInfo *)&v7 init];
  v3 = (_UIFlowLayoutInfo *)v2;
  if (v2)
  {
    *(_WORD *)(v2 + 97) = 256;
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    sections = v3->_sections;
    v3->_sections = v4;
  }
  return v3;
}

- (void)invalidate:(uint64_t)a1
{
  if (a1)
  {
    *(_OWORD *)(a1 + 72) = *MEMORY[0x1E4F1DB30];
    *(void *)(a1 + 88) = 0;
    *(unsigned char *)(a1 + 64) = 0;
    if (!a2
      || (id WeakRetained = objc_loadWeakRetained((id *)(a1 + 120)),
          int v4 = [WeakRetained _estimatesSizes],
          WeakRetained,
          v4))
    {
      id v5 = *(id *)(a1 + 104);
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v7 = *(void **)(a1 + 104);
      *(void *)(a1 + 104) = v6;

      double v8 = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __32___UIFlowLayoutInfo_invalidate___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0l;
      block[4] = v5;
      dispatch_async(v8, block);
    }
  }
}

- (id)copy
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  v3 = objc_alloc_init(_UIFlowLayoutInfo);
  p_isa = (id *)&v3->super.isa;
  if (v3)
  {
    v3->_usesFloatingHeaderFooter = self->_useFloatingHeaderFooter;
    v3->_horizontal = self->_horizontal;
    v3->_leftToRight = self->_leftToRight;
    CGSize size = self->_visibleBounds.size;
    v3->_visibleBounds.origin = self->_visibleBounds.origin;
    v3->_visibleBounds.CGSize size = size;
    v3->_layoutSize = self->_layoutSize;
    v3->_dimension = self->_dimension;
    v3->_isValid = self->_isValid;
    uint64_t v6 = *(void *)&self->_rowAlignmentOptions.commonRowHorizontalAlignment;
    v3->_rowAlignmentOptions.rowVerticalAlignment = self->_rowAlignmentOptions.rowVerticalAlignment;
    *(void *)&v3->_rowAlignmentOptions.commonRowHorizontalAlignment = v6;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    obj = self->_sections;
    uint64_t v37 = [(NSMutableArray *)obj countByEnumeratingWithState:&v43 objects:v55 count:16];
    if (v37)
    {
      v35 = p_isa;
      uint64_t v36 = *(void *)v44;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v44 != v36) {
            objc_enumerationMutation(obj);
          }
          uint64_t v8 = *(void *)(*((void *)&v43 + 1) + 8 * v7);
          double v9 = p_isa;
          if (v8 && (v10 = objc_alloc_init(_UIFlowLayoutSection)) != 0)
          {
            v11 = v10;
            uint64_t v40 = v7;
            long long v12 = *(_OWORD *)(v8 + 296);
            *(_OWORD *)&v10->_sectionMargins.top = *(_OWORD *)(v8 + 280);
            *(_OWORD *)&v10->_sectionMargins.bottom = v12;
            v10->_lineSpacing = *(double *)(v8 + 112);
            v10->_interItemSpacing = *(double *)(v8 + 120);
            CGSize v13 = *(CGSize *)(v8 + 328);
            v10->_frame.origin = *(CGPoint *)(v8 + 312);
            v10->_frame.CGSize size = v13;
            v10->_isValid = *(unsigned char *)(v8 + 8);
            CGSize v14 = *(CGSize *)(v8 + 360);
            v10->_headerFrame.origin = *(CGPoint *)(v8 + 344);
            v10->_headerFrame.CGSize size = v14;
            CGSize v15 = *(CGSize *)(v8 + 392);
            v10->_footerFrame.origin = *(CGPoint *)(v8 + 376);
            v10->_footerFrame.CGSize size = v15;
            v10->_headerDimension = *(double *)(v8 + 128);
            v10->_footerDimension = *(double *)(v8 + 136);
            location = (id *)&v10->_layoutInfo;
            v39 = v9;
            objc_storeWeak((id *)&v10->_layoutInfo, v9);
            v11->_fixedItemSize = *(unsigned char *)(v8 + 88);
            v11->_itemSize = *(CGSize *)(v8 + 248);
            v11->_itemsCount = *(void *)(v8 + 208);
            v11->_itemsByRowCount = *(void *)(v8 + 216);
            v11->_indexOfIncompleteRow = *(void *)(v8 + 224);
            v11->_beginMargin = *(double *)(v8 + 160);
            v11->_endMargin = *(double *)(v8 + 168);
            v11->_actualGap = *(double *)(v8 + 176);
            v11->_lastRowIncomplete = *(unsigned char *)(v8 + 89);
            v11->_lastRowBeginMargin = *(double *)(v8 + 184);
            v11->_lastRowEndMargin = *(double *)(v8 + 192);
            v11->_lastRowActualGap = *(double *)(v8 + 200);
            v11->_otherMargin = *(double *)(v8 + 152);
            long long v49 = 0u;
            long long v50 = 0u;
            long long v47 = 0u;
            long long v48 = 0u;
            id v41 = *(id *)(v8 + 104);
            uint64_t v16 = [v41 countByEnumeratingWithState:&v47 objects:v56 count:16];
            if (v16)
            {
              uint64_t v17 = v16;
              uint64_t v42 = *(void *)v48;
              do
              {
                uint64_t v18 = 0;
                do
                {
                  if (*(void *)v48 != v42) {
                    objc_enumerationMutation(v41);
                  }
                  uint64_t v19 = *(void *)(*((void *)&v47 + 1) + 8 * v18);
                  v20 = v11;
                  if (v19)
                  {
                    v21 = objc_alloc_init(_UIFlowLayoutRow);
                    v22 = v21;
                    if (v21)
                    {
                      objc_storeWeak((id *)&v21->_section, v20);
                      v22->_rowSize = *(CGSize *)(v19 + 56);
                      CGSize v23 = *(CGSize *)(v19 + 88);
                      v22->_rowFrame.origin = *(CGPoint *)(v19 + 72);
                      v22->_rowFrame.CGSize size = v23;
                      v22->_index = *(void *)(v19 + 32);
                      v22->_isValid = *(unsigned char *)(v19 + 8);
                      v22->_complete = *(unsigned char *)(v19 + 9);
                      v22->_verticalAlignement = *(_DWORD *)(v19 + 12);
                      v22->_horizontalAlignement = *(_DWORD *)(v19 + 16);
                      long long v53 = 0u;
                      long long v54 = 0u;
                      long long v51 = 0u;
                      long long v52 = 0u;
                      id v24 = *(id *)(v19 + 40);
                      uint64_t v25 = [v24 countByEnumeratingWithState:&v51 objects:v57 count:16];
                      if (v25)
                      {
                        uint64_t v26 = v25;
                        uint64_t v27 = *(void *)v52;
                        do
                        {
                          uint64_t v28 = 0;
                          do
                          {
                            if (*(void *)v52 != v27) {
                              objc_enumerationMutation(v24);
                            }
                            v29 = (id *)[*(id *)(*((void *)&v51 + 1) + 8 * v28) copy];
                            [(NSMutableArray *)v22->_items addObject:v29];
                            if (v29)
                            {
                              objc_storeWeak(v29 + 2, v20);
                              objc_storeWeak(v29 + 3, v22);
                            }

                            ++v28;
                          }
                          while (v26 != v28);
                          uint64_t v26 = [v24 countByEnumeratingWithState:&v51 objects:v57 count:16];
                        }
                        while (v26);
                      }
                    }
                  }
                  else
                  {
                    v22 = 0;
                  }

                  [(NSMutableArray *)v11->_rows addObject:v22];
                  if (v22) {
                    items = v22->_items;
                  }
                  else {
                    items = 0;
                  }
                  v31 = v11->_items;
                  [(NSMutableArray *)v31 addObjectsFromArray:items];

                  ++v18;
                }
                while (v18 != v17);
                uint64_t v32 = [v41 countByEnumeratingWithState:&v47 objects:v56 count:16];
                uint64_t v17 = v32;
              }
              while (v32);
            }

            objc_storeWeak(location, v39);
            p_isa = v35;
            uint64_t v7 = v40;
          }
          else
          {

            v11 = 0;
          }
          [p_isa[13] addObject:v11];

          ++v7;
        }
        while (v7 != v37);
        uint64_t v37 = [(NSMutableArray *)obj countByEnumeratingWithState:&v43 objects:v55 count:16];
      }
      while (v37);
    }
  }
  return p_isa;
}

- (void)setSizes:(void *)a3 forItemsAtIndexPaths:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    uint64_t v7 = [v5 count];
    id v40 = v6;
    if (v7 != [v6 count])
    {
      uint64_t v37 = [MEMORY[0x1E4F28B00] currentHandler];
      [v37 handleFailureInMethod:sel_setSizes_forItemsAtIndexPaths_, a1, @"UIFlowLayoutSupport.m", 2011, @"Invalid parameter not satisfying: %@", @"sizes.count == indexPaths.count" object file lineNumber description];
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 120));
    char v9 = [WeakRetained _estimatesSizes];

    if ((v9 & 1) == 0)
    {
      v38 = [MEMORY[0x1E4F28B00] currentHandler];
      v39 = NSStringFromSelector(sel_setSizes_forItemsAtIndexPaths_);
      [v38 handleFailureInMethod:sel_setSizes_forItemsAtIndexPaths_, a1, @"UIFlowLayoutSupport.m", 2012, @"This method %@ should only be called for layouts with estimated item sizes.", v39 object file lineNumber description];
    }
    id v10 = objc_alloc_init(MEMORY[0x1E4F28E60]);
    v11 = objc_opt_new();
    id v6 = v40;
    if ([v5 count])
    {
      unint64_t v12 = 0;
      do
      {
        CGSize v13 = [v5 objectAtIndexedSubscript:v12];
        [v13 CGSizeValue];
        double v15 = v14;
        double v17 = v16;

        uint64_t v18 = [v6 objectAtIndexedSubscript:v12];
        objc_msgSend(v10, "addIndex:", objc_msgSend(v18, "section"));
        double v19 = v17 + *(double *)(a1 + 80);
        *(double *)(a1 + 72) = v15 + *(double *)(a1 + 72);
        *(double *)(a1 + 80) = v19;
        ++*(void *)(a1 + 88);
        v20 = *(void **)(a1 + 104);
        id v21 = objc_loadWeakRetained((id *)(a1 + 120));
        uint64_t v22 = objc_msgSend(v20, "objectAtIndex:", objc_msgSend(v21, "_sectionArrayIndexForIndexPath:", v18));

        CGSize v23 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v18, "section"));
        id v24 = [v11 objectForKeyedSubscript:v23];

        if (!v24 || (uint64_t v25 = [v24 integerValue], v25 > objc_msgSend(v18, "item")))
        {
          if (v22)
          {
            unint64_t v27 = *(void *)(v22 + 264);
            unint64_t v26 = *(void *)(v22 + 272);
          }
          else
          {
            unint64_t v26 = 0;
            unint64_t v27 = 0;
          }
          unint64_t v28 = [v18 item];
          BOOL v29 = v28 >= v27;
          unint64_t v30 = v28 - v27;
          id v6 = v40;
          if (v29 && v30 < v26)
          {
            double v31 = -[_UIFlowLayoutSection frameForItemAtIndexPath:](v22, v18);
            if (v33 != v15 || v32 != v17)
            {
              v34 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v18, "item", v31));
              v35 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v18, "section"));
              [v11 setObject:v34 forKeyedSubscript:v35];

              id v6 = v40;
            }
          }
        }
        if (v22)
        {
          uint64_t v36 = objc_msgSend(*(id *)(v22 + 96), "objectAtIndexedSubscript:", objc_msgSend(v18, "item"));
          if (v36)
          {
            *(double *)(v36 + 48) = v15;
            *(double *)(v36 + 56) = v17;
            *(unsigned char *)(v36 + 8) |= 6u;
          }
        }
        ++v12;
      }
      while (v12 < [v5 count]);
    }
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __51___UIFlowLayoutInfo_setSizes_forItemsAtIndexPaths___block_invoke;
    v41[3] = &unk_1E52E6590;
    v41[4] = a1;
    [v11 enumerateKeysAndObjectsUsingBlock:v41];
  }
}

- (id)setSize:(double)a3 forItemAtIndexPath:(double)a4
{
  if (a1)
  {
    uint64_t v8 = (id *)(a1 + 120);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 120));
    int v10 = [WeakRetained _estimatesSizes];

    if (v10)
    {
      double v11 = a4 + *(double *)(a1 + 80);
      *(double *)(a1 + 72) = a3 + *(double *)(a1 + 72);
      *(double *)(a1 + 80) = v11;
      ++*(void *)(a1 + 88);
    }
    id v12 = objc_loadWeakRetained(v8);
    id v13 = objc_alloc_init((Class)[(id)objc_opt_class() invalidationContextClass]);

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v85 = [MEMORY[0x1E4F28B00] currentHandler];
      id v86 = objc_loadWeakRetained(v8);
      v87 = (objc_class *)[(id)objc_opt_class() invalidationContextClass];
      v88 = NSStringFromClass(v87);
      [v85 handleFailureInMethod:sel_setSize_forItemAtIndexPath_, a1, @"UIFlowLayoutSupport.m", 2063, @"Invalidation context class (%@) must be a subclass of UICollectionViewFlowLayoutInvalidationContext.", v88 object file lineNumber description];
    }
    [v13 setInvalidateFlowLayoutAttributes:0];
    [v13 setInvalidateFlowLayoutDelegateMetrics:0];
    id v14 = objc_loadWeakRetained(v8);
    unint64_t v15 = [v14 _sectionArrayIndexForIndexPath:a2];

    if ((v15 & 0x8000000000000000) == 0 && v15 < [*(id *)(a1 + 104) count])
    {
      double v16 = *(void **)(a1 + 104);
      if (v16)
      {
        uint64_t v17 = [v16 objectAtIndexedSubscript:v15];
        if (!v17)
        {
LABEL_64:

          goto LABEL_40;
        }
        unint64_t v18 = [a2 item];
        if (v18 >= [*(id *)(v17 + 96) count])
        {
          v94[0] = MEMORY[0x1E4F143A8];
          v94[1] = 3221225472;
          v94[2] = __71___UIFlowLayoutSection_setSize_forItemAtIndexPath_invalidationContext___block_invoke;
          v94[3] = &unk_1E52D9CD0;
          v94[4] = v17;
          v94[5] = v18;
          if (_MergedGlobals_997 != -1) {
            dispatch_once(&_MergedGlobals_997, v94);
          }
          goto LABEL_64;
        }
        double v19 = [MEMORY[0x1E4F1CA48] array];
        uint64_t v20 = objc_msgSend(*(id *)(v17 + 96), "objectAtIndexedSubscript:", objc_msgSend(a2, "item"));
        uint64_t v22 = v20;
        if (v20)
        {
          CGFloat v24 = *(double *)(v20 + 32);
          CGFloat v23 = *(double *)(v20 + 40);
          double v25 = *(double *)(v20 + 48);
          double v26 = *(double *)(v20 + 56);
        }
        else
        {
          CGFloat v23 = 0.0;
          double v25 = 0.0;
          double v26 = 0.0;
          CGFloat v24 = 0.0;
        }
        if (v25 != a3 || v26 != a4)
        {
          unint64_t v27 = *(void *)(v17 + 264);
          BOOL v28 = v18 >= v27;
          unint64_t v29 = v18 - v27;
          if (!v28 || v29 >= *(void *)(v17 + 272))
          {
            if (v20)
            {
              *(CGFloat *)(v20 + 32) = v24;
              *(CGFloat *)(v20 + 40) = v23;
              *(double *)(v20 + 48) = v25;
              *(double *)(v20 + 56) = v26;
              *(unsigned char *)(v20 + 8) |= 4u;
            }
            goto LABEL_61;
          }
          v96.origin.x = v24;
          v96.origin.y = v23;
          v96.size.width = v25;
          v96.size.height = v26;
          double Width = CGRectGetWidth(v96);
          v97.origin.x = v24;
          v97.origin.y = v23;
          v97.size.width = v25;
          v97.size.height = v26;
          double Height = CGRectGetHeight(v97);
          if (v22)
          {
            *(CGFloat *)(v22 + 32) = v24;
            *(CGFloat *)(v22 + 40) = v23;
            *(double *)(v22 + 48) = a3;
            *(double *)(v22 + 56) = a4;
            *(unsigned char *)(v22 + 8) |= 4u;
          }
          uint64_t v32 = [a2 section];
          if (v18 < *(void *)(v17 + 272) + *(void *)(v17 + 264))
          {
            unint64_t v33 = v18;
            do
            {
              v34 = [MEMORY[0x1E4F28D58] indexPathForItem:v33 inSection:v32];
              -[_UIFlowLayoutSection addInvalidatedIndexPath:](v17, (uint64_t)v34);
              [v19 addObject:v34];

              ++v33;
            }
            while (v33 < *(void *)(v17 + 272) + *(void *)(v17 + 264));
          }
          v35 = (unsigned __int8 *)objc_loadWeakRetained((id *)(v17 + 144));
          if (v35 && (int v36 = v35[97], v35, v36))
          {
            double v21 = a4 - Height;
            if (a4 - Height < 0.0)
            {
              if (v22) {
                uint64_t v37 = objc_loadWeakRetained((id *)(v22 + 24));
              }
              else {
                uint64_t v37 = 0;
              }
              uint64_t v38 = [*(id *)(v17 + 104) indexOfObject:v37];
              double MaxX = CGRectGetMaxX(*(CGRect *)(v17 + 16));
              if (v37)
              {
                uint64_t v40 = v37[9];
                uint64_t v41 = v37[10];
                uint64_t v42 = v37[11];
                uint64_t v43 = v37[12];
              }
              else
              {
                uint64_t v41 = 0;
                uint64_t v42 = 0;
                uint64_t v43 = 0;
                uint64_t v40 = 0;
              }
              double v44 = MaxX - CGRectGetMinX(*(CGRect *)&v40);
              if (v38 >= 1)
              {
                uint64_t v45 = [*(id *)(v17 + 104) objectAtIndexedSubscript:v38 - 1];
                v89 = (void *)v45;
                v91 = v37;
                if (v45)
                {
                  long long v46 = (void *)v45;
                  uint64_t v47 = [*(id *)(v45 + 40) count];
                  uint64_t v48 = v46[9];
                  uint64_t v49 = v46[10];
                  uint64_t v50 = v46[11];
                  uint64_t v51 = v46[12];
                }
                else
                {
                  uint64_t v47 = [0 count];
                  uint64_t v49 = 0;
                  uint64_t v50 = 0;
                  uint64_t v51 = 0;
                  uint64_t v48 = 0;
                }
                double v52 = CGRectGetWidth(*(CGRect *)&v48);
                if (v47 >= 1)
                {
                  int64_t v53 = v18 - v47;
                  do
                  {
                    long long v54 = [MEMORY[0x1E4F28D58] indexPathForItem:v53 inSection:v32];
                    -[_UIFlowLayoutSection addInvalidatedIndexPath:](v17, (uint64_t)v54);
                    [v19 addObject:v54];

                    ++v53;
                  }
                  while (v53 < (uint64_t)v18);
                }
                double v44 = v44 + v52;

                uint64_t v37 = v91;
              }
              v98.size.width = fmax(CGRectGetWidth(*(CGRect *)(v17 + 16)) - v44, 0.0);
              *(CGFloat *)(v17 + 32) = v98.size.width;
              v98.origin.x = *(CGFloat *)(v17 + 16);
              v98.origin.y = *(CGFloat *)(v17 + 24);
              v98.size.height = *(CGFloat *)(v17 + 40);
              CGFloat v55 = CGRectGetMaxX(v98);
              CGFloat MinY = CGRectGetMinY(*(CGRect *)(v17 + 16));
              CGFloat v57 = CGRectGetHeight(*(CGRect *)(v17 + 16));
              uint64_t v58 = [a2 section];
              uint64_t v59 = v17;
              CGFloat v60 = v55;
              CGFloat v61 = MinY;
              double v62 = v44;
              double v63 = v57;
LABEL_60:
              -[_UIFlowLayoutSection computeLayoutInRect:forSection:invalidating:invalidationContext:](v59, v58, 1u, v13, v60, v61, v62, v63);
            }
          }
          else
          {
            double v21 = a3 - Width;
            if (a3 - Width < 0.0)
            {
              if (v22) {
                uint64_t v37 = objc_loadWeakRetained((id *)(v22 + 24));
              }
              else {
                uint64_t v37 = 0;
              }
              uint64_t v65 = [*(id *)(v17 + 104) indexOfObject:v37];
              double MaxY = CGRectGetMaxY(*(CGRect *)(v17 + 16));
              if (v37)
              {
                uint64_t v67 = v37[9];
                uint64_t v68 = v37[10];
                uint64_t v69 = v37[11];
                uint64_t v70 = v37[12];
              }
              else
              {
                uint64_t v68 = 0;
                uint64_t v69 = 0;
                uint64_t v70 = 0;
                uint64_t v67 = 0;
              }
              double v71 = MaxY - CGRectGetMinY(*(CGRect *)&v67);
              if ((unint64_t)(v65 - 1) <= 0x7FFFFFFFFFFFFFFDLL)
              {
                uint64_t v72 = objc_msgSend(*(id *)(v17 + 104), "objectAtIndexedSubscript:");
                v90 = (void *)v72;
                v92 = v37;
                if (v72)
                {
                  v73 = (void *)v72;
                  uint64_t v74 = [*(id *)(v72 + 40) count];
                  uint64_t v75 = v73[9];
                  uint64_t v76 = v73[10];
                  uint64_t v77 = v73[11];
                  uint64_t v78 = v73[12];
                }
                else
                {
                  uint64_t v74 = [0 count];
                  uint64_t v76 = 0;
                  uint64_t v77 = 0;
                  uint64_t v78 = 0;
                  uint64_t v75 = 0;
                }
                double v79 = CGRectGetHeight(*(CGRect *)&v75);
                if (v74 >= 1)
                {
                  int64_t v80 = v18 - v74;
                  do
                  {
                    v81 = [MEMORY[0x1E4F28D58] indexPathForItem:v80 inSection:v32];
                    -[_UIFlowLayoutSection addInvalidatedIndexPath:](v17, (uint64_t)v81);
                    [v19 addObject:v81];

                    ++v80;
                  }
                  while (v80 < (uint64_t)v18);
                }
                double v71 = v71 + v79;

                uint64_t v37 = v92;
              }
              v99.size.height = fmax(CGRectGetHeight(*(CGRect *)(v17 + 16)) - v71, 0.0);
              *(CGFloat *)(v17 + 40) = v99.size.height;
              v99.origin.x = *(CGFloat *)(v17 + 16);
              v99.origin.y = *(CGFloat *)(v17 + 24);
              v99.size.width = *(CGFloat *)(v17 + 32);
              CGFloat MinX = CGRectGetMinX(v99);
              CGFloat v83 = CGRectGetMaxY(*(CGRect *)(v17 + 16));
              CGFloat v84 = CGRectGetWidth(*(CGRect *)(v17 + 16));
              uint64_t v58 = [a2 section];
              uint64_t v59 = v17;
              CGFloat v60 = MinX;
              CGFloat v61 = v83;
              double v62 = v84;
              double v63 = v71;
              goto LABEL_60;
            }
          }
        }
LABEL_61:
        if (objc_msgSend(v19, "count", v21)) {
          [v13 invalidateItemsAtIndexPaths:v19];
        }

        goto LABEL_64;
      }
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48___UIFlowLayoutInfo_setSize_forItemAtIndexPath___block_invoke;
    block[3] = &unk_1E52D9CD0;
    block[4] = a1;
    void block[5] = v15;
    if (qword_1EB25FEC8 != -1) {
      dispatch_once(&qword_1EB25FEC8, block);
    }
  }
  else
  {
    id v13 = 0;
  }
LABEL_40:
  return v13;
}

- (id)specifiedItemSizes
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v2 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id obj = *(id *)(a1 + 104);
    uint64_t v18 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v18)
    {
      uint64_t v3 = 0;
      uint64_t v17 = *(void *)v25;
      do
      {
        uint64_t v4 = 0;
        do
        {
          if (*(void *)v25 != v17) {
            objc_enumerationMutation(obj);
          }
          id v5 = *(void **)(*((void *)&v24 + 1) + 8 * v4);
          long long v20 = 0u;
          long long v21 = 0u;
          long long v22 = 0u;
          long long v23 = 0u;
          uint64_t v19 = v4;
          if (v5) {
            id v5 = (void *)v5[12];
          }
          id v6 = v5;
          uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v28 count:16];
          if (v7)
          {
            uint64_t v8 = v7;
            uint64_t v9 = 0;
            uint64_t v10 = *(void *)v21;
            do
            {
              for (uint64_t i = 0; i != v8; ++i)
              {
                if (*(void *)v21 != v10) {
                  objc_enumerationMutation(v6);
                }
                uint64_t v12 = *(void *)(*((void *)&v20 + 1) + 8 * i);
                if (v12 && (*(unsigned char *)(v12 + 8) & 4) != 0)
                {
                  id v13 = [MEMORY[0x1E4F28D58] indexPathForItem:v9 + i inSection:v3];
                  id v14 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGSize:", *(double *)(v12 + 48), *(double *)(v12 + 56));
                  [v2 setObject:v14 forKeyedSubscript:v13];
                }
              }
              uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v28 count:16];
              v9 += i;
            }
            while (v8);
          }

          ++v3;
          uint64_t v4 = v19 + 1;
        }
        while (v19 + 1 != v18);
        uint64_t v18 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v18);
    }
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_layout);
  objc_storeStrong((id *)&self->_sections, 0);
}

@end
@interface _UITableViewUpdateSupport
- (BOOL)_isReloadSectionUpdate;
- (UIImageView)_imageViewForView:(void *)a1;
- (double)_startOfRowAfterFooterInSection:(uint64_t)a3 withRowData:;
- (double)_startOfRowAfterHeaderInSection:(void *)a3 withRowData:;
- (double)_startOfRowAfterRow:(void *)a3 withRowData:;
- (id)_collectionViewUpdateItems;
- (id)_oldMapArray;
- (id)initWithTableView:(void *)a3 updateItems:(void *)a4 oldRowData:(void *)a5 newRowData:(void *)a6 oldRowRange:(void *)a7 newRowRange:(uint64_t)a8 context:(void *)a9;
- (int64_t)_setupAnimationStructures;
- (uint64_t)finalGlobalIndexForInitialGlobalIndex:(uint64_t)result;
- (uint64_t)finalSectionIndexForInitialSectionIndex:(uint64_t)result;
- (uint64_t)initialGlobalIndexForFinalGlobalIndex:(uint64_t)result;
- (uint64_t)initialSectionIndexForFinalSectionIndex:(uint64_t)result;
- (void)_computeAutomaticAnimationTypes;
- (void)_computeVisibleBounds;
- (void)_faultInRealHeightsOfNeededElements;
- (void)_setupAnimationForReorderingRow;
- (void)_setupAnimationForTableFooter;
- (void)_setupAnimationForTableHeader;
- (void)_setupAnimations;
- (void)_setupAnimationsForDeletedCells;
- (void)_setupAnimationsForDeletedHeadersAndFooters;
- (void)_setupAnimationsForExistingHeadersAndFooters;
- (void)_setupAnimationsForExistingOffscreenCells;
- (void)_setupAnimationsForExistingVisibleCells;
- (void)_setupAnimationsForInsertedHeadersAndFooters;
- (void)_setupAnimationsForNewlyInsertedCells;
- (void)dealloc;
@end

@implementation _UITableViewUpdateSupport

- (void)_faultInRealHeightsOfNeededElements
{
  if (a1)
  {
    uint64_t v2 = 0;
    uint64_t v3 = 0;
    uint64_t v4 = 0;
    unint64_t v5 = 0;
    unint64_t v6 = 100;
    while (1)
    {
      uint64_t v7 = v2;
      uint64_t v8 = MEMORY[0x18C108260]();
      uint64_t v9 = -[UITableViewRowData globalRowsInRect:canGuess:](*(void **)(a1 + 80), 0, *(CGFloat *)(a1 + 160), *(CGFloat *)(a1 + 168), *(CGFloat *)(a1 + 176), *(CGFloat *)(a1 + 184));
      if (v9) {
        uint64_t v11 = v10 + 1;
      }
      else {
        uint64_t v11 = v10;
      }
      if (v9) {
        uint64_t v12 = v9 - 1;
      }
      else {
        uint64_t v12 = 0;
      }
      uint64_t v20 = v7;
      unint64_t v21 = v5;
      context = (void *)v8;
      if (v11)
      {
        if (v11 + v12 >= (unint64_t)-[UITableViewRowData numberOfRows](*(void *)(a1 + 80))) {
          uint64_t v13 = v11;
        }
        else {
          uint64_t v13 = v11 + 1;
        }
      }
      else
      {
        uint64_t v13 = 0;
      }
      unint64_t v5 = -[UITableViewRowData sectionsInRect:](*(void *)(a1 + 80), *(CGFloat *)(a1 + 160), *(CGFloat *)(a1 + 168), *(CGFloat *)(a1 + 176), *(CGFloat *)(a1 + 184));
      uint64_t v2 = v14;
      uint64_t v15 = v14;
      uint64_t v16 = v5;
      if (v5 < v5 + v14)
      {
        do
        {
          -[UITableViewRowData heightForHeaderInSection:canGuess:](*(void *)(a1 + 80), v16, 0);
          -[UITableViewRowData heightForFooterInSection:canGuess:](*(void *)(a1 + 80), v16++, 0);
          --v15;
        }
        while (v15);
      }
      -[_UITableViewUpdateSupport _computeVisibleBounds](a1);
      if (v3 == v12 && v4 == v13 && v21 == v5 && v20 == v2) {
        break;
      }
      uint64_t v3 = v12;
      uint64_t v4 = v13;
      if (v6-- < 2)
      {
        if (os_variant_has_internal_diagnostics())
        {
          v19 = __UIFaultDebugAssertLog();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)v24 = 0;
            _os_log_fault_impl(&dword_1853B0000, v19, OS_LOG_TYPE_FAULT, "Exceeded the maximum number of passes!", v24, 2u);
          }
        }
        else
        {
          v18 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_faultInRealHeightsOfNeededElements___s_category)
                             + 8);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1853B0000, v18, OS_LOG_TYPE_ERROR, "Exceeded the maximum number of passes!", buf, 2u);
          }
        }
        return;
      }
    }
  }
}

- (void)_computeVisibleBounds
{
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained visibleBounds];
    *(void *)(a1 + 160) = v2;
    *(void *)(a1 + 168) = v3;
    *(void *)(a1 + 176) = v4;
    *(void *)(a1 + 184) = v5;
    if ([WeakRetained isScrollAnimating])
    {
      [WeakRetained _animatedTargetOffset];
      *(void *)(a1 + 160) = v6;
      *(void *)(a1 + 168) = v7;
    }
    double v8 = -[UITableViewRowData rectForTable](*(void *)(a1 + 80));
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    [WeakRetained _contentInset];
    double v16 = v15;
    double v18 = -v17;
    double v20 = v8 - v19;
    double v22 = v12 - (-v19 - v21);
    double v23 = v10 - v17;
    double v24 = v14 - (-v15 - v17);
    v61.origin.x = v20;
    v61.origin.y = v23;
    v61.size.width = v22;
    v61.size.height = v24;
    if (!CGRectContainsRect(v61, *(CGRect *)(a1 + 128)))
    {
      double MaxY = CGRectGetMaxY(*(CGRect *)(a1 + 128));
      v62.origin.x = v20;
      v62.origin.y = v23;
      v62.size.width = v22;
      v62.size.height = v24;
      if (MaxY > CGRectGetMaxY(v62))
      {
        v63.origin.x = v20;
        v63.origin.y = v23;
        v63.size.width = v22;
        v63.size.height = v24;
        double Height = CGRectGetHeight(v63);
        if (Height <= CGRectGetHeight(*(CGRect *)(a1 + 128)))
        {
          int v29 = [WeakRetained _isTableHeaderViewHidden];
          double v28 = v18;
          if (v29) {
            [WeakRetained contentOffset];
          }
        }
        else
        {
          double v27 = CGRectGetMaxY(*(CGRect *)(a1 + 128));
          v64.origin.x = v20;
          v64.origin.y = v23;
          v64.size.width = v22;
          v64.size.height = v24;
          double v28 = *(double *)(a1 + 168) - (v27 - CGRectGetMaxY(v64));
        }
        *(double *)(a1 + 168) = v28;
      }
    }
    uint64_t v30 = [WeakRetained _visibleGlobalRows];
    if (v31)
    {
      unint64_t v32 = v30;
      if (v30)
      {
        if (([WeakRetained _estimatesRowHeights] & 1) != 0
          || ([WeakRetained _estimatesSectionHeaderHeights] & 1) != 0
          || [WeakRetained _estimatesSectionFooterHeights])
        {
          uint64_t v33 = -[_UITableViewUpdateSupport finalGlobalIndexForInitialGlobalIndex:](a1, v32);
          v34 = -[UITableViewRowData numberOfRows](*(void *)(a1 + 72));
          if (v33 == 0x7FFFFFFFFFFFFFFFLL)
          {
            v35 = v34;
            while (1)
            {
              uint64_t v36 = v32 + 1;
              if ((uint64_t)(v32 + 1) >= (uint64_t)v35) {
                break;
              }
              uint64_t v37 = -[_UITableViewUpdateSupport finalGlobalIndexForInitialGlobalIndex:](a1, ++v32);
              if (v37 != 0x7FFFFFFFFFFFFFFFLL)
              {
                uint64_t v33 = v37;
                goto LABEL_22;
              }
            }
            while ((uint64_t)(v32 + 1) >= 1)
            {
              uint64_t v58 = -[_UITableViewUpdateSupport finalGlobalIndexForInitialGlobalIndex:](a1, v32--);
              if (v58 != 0x7FFFFFFFFFFFFFFFLL)
              {
                uint64_t v33 = v58;
                uint64_t v36 = v32 + 1;
                goto LABEL_22;
              }
            }
          }
          else
          {
            uint64_t v36 = v32;
LABEL_22:
            double v38 = -[UITableViewRowData rectForGlobalRow:heightCanBeGuessed:](*(void **)(a1 + 72), v36, 1);
            CGFloat v40 = v39;
            CGFloat v42 = v41;
            CGFloat v44 = v43;
            v65.origin.x = -[UITableViewRowData rectForGlobalRow:heightCanBeGuessed:](*(void **)(a1 + 80), v33, 1);
            double MinY = CGRectGetMinY(v65);
            double v46 = CGRectGetMinY(*(CGRect *)(a1 + 128));
            v66.origin.x = v38;
            v66.origin.y = v40;
            v66.size.width = v42;
            v66.size.height = v44;
            *(double *)(a1 + 168) = MinY + v46 - CGRectGetMinY(v66);
            double v47 = -[UITableViewRowData heightForTable](*(void *)(a1 + 80));
            double v48 = v47 - (CGRectGetHeight(*(CGRect *)(a1 + 160)) - v16);
            *(double *)(a1 + 168) = fmax(v18, fmin(v48, CGRectGetMinY(*(CGRect *)(a1 + 160))));
          }
        }
      }
    }
    v49 = [WeakRetained delegate];
    char v50 = objc_opt_respondsToSelector();
    uint64_t v51 = *(void *)(a1 + 160);
    uint64_t v52 = *(void *)(a1 + 168);
    if (v50)
    {
      objc_msgSend(v49, "tableView:newContentOffsetAfterUpdate:context:", WeakRetained, *(void *)(a1 + 296), *(double *)(a1 + 160), *(double *)(a1 + 168));
      uint64_t v51 = v53;
      uint64_t v52 = v54;
      *(void *)(a1 + 160) = v53;
      *(void *)(a1 + 168) = v54;
    }
    uint64_t v55 = *(void *)(a1 + 176);
    uint64_t v56 = *(void *)(a1 + 184);
    *(CGRect *)(a1 + 192) = CGRectUnion(*(CGRect *)(a1 + 128), *(CGRect *)&v51);
    double v57 = CGRectGetMaxY(*(CGRect *)(a1 + 160));
    *(double *)(a1 + 224) = v57 - CGRectGetMaxY(*(CGRect *)(a1 + 128));
  }
}

- (void)_setupAnimationsForExistingVisibleCells
{
  if (!a1) {
    return;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = *(void *)(a1 + 72);
  if (!v2)
  {
    id v3 = 0;
    goto LABEL_7;
  }
  id v3 = *(id *)(v2 + 184);
  if (!v3)
  {
LABEL_7:
    uint64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_8;
  }
  uint64_t v4 = [WeakRetained _globalReorderingRow];
LABEL_8:
  *(void *)(a1 + 288) = v4;

  unint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  *(void *)(a1 + 24) = v5;
  if (v5 < v6 + v5)
  {
    while (1)
    {
      uint64_t v7 = -[_UITableViewUpdateSupport finalGlobalIndexForInitialGlobalIndex:](a1, v5);
      *(void *)(a1 + 32) = v7;
      uint64_t v8 = *(void *)(a1 + 24);
      if (v7 != 0x7FFFFFFFFFFFFFFFLL && *(void *)(a1 + 288) != v8) {
        break;
      }
LABEL_18:
      unint64_t v5 = v8 + 1;
      *(void *)(a1 + 24) = v8 + 1;
      if ((unint64_t)(v8 + 1) >= *(void *)(a1 + 56) + *(void *)(a1 + 48)) {
        goto LABEL_22;
      }
    }
    uint64_t v9 = objc_msgSend(WeakRetained, "_visibleCellForGlobalRow:");
    double v10 = (void *)v9;
    if (*(void *)(*(void *)(a1 + 264) + 8 * *(void *)(a1 + 32)))
    {
      double v23 = [MEMORY[0x1E4F28B00] currentHandler];
      double v24 = -[_UITableViewUpdateSupport _collectionViewUpdateItems](a1);
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", sel__setupAnimationsForExistingVisibleCells, a1, @"UITableViewSupport.m", 735, @"Cannot animate existing visible cell because it already has an animation. Updates: %@; Cell: %@",
        v24,
        *(void *)(*(void *)(a1 + 264) + 8 * *(void *)(a1 + 32)));

      if (v10) {
        goto LABEL_13;
      }
    }
    else if (v9)
    {
LABEL_13:
      objc_storeStrong((id *)(*(void *)(a1 + 264) + 8 * *(void *)(a1 + 32)), v10);
      if ([*(id *)(a1 + 120) containsIndex:*(void *)(a1 + 32)]) {
        [WeakRetained _addContentSubview:v10 atBack:0];
      }
      double MinX = -[UITableViewRowData rectForGlobalRow:heightCanBeGuessed:](*(void **)(a1 + 80), *(void *)(a1 + 32), 0);
      double v13 = v12;
      double v15 = v14;
      double v17 = v16;
      double v18 = [WeakRetained _swipeToDeleteCell];

      if (v10 == v18)
      {
        [v10 frame];
        double MinX = CGRectGetMinX(v28);
      }
      double v19 = -[UITableViewRowData indexPathForRowAtGlobalRow:](*(void **)(a1 + 80), *(void *)(a1 + 32));
      char v20 = [WeakRetained _isEditingRowAtIndexPath:v19];
      v29.origin.x = MinX;
      v29.origin.y = v13;
      v29.size.width = v15;
      v29.size.height = v17;
      char v21 = !CGRectIntersectsRect(v29, *(CGRect *)(a1 + 160));
      double v22 = -[UIViewAnimation initWithView:indexPath:viewType:endRect:endAlpha:startFraction:endFraction:curve:animateFromCurrentPosition:shouldDeleteAfterAnimation:editing:]((id *)[UIViewAnimation alloc], v10, v19, 1, 0, 1, v21, v20, MinX, v13, v15, v17, 1.0, 0.0, 1.0);
      [*(id *)(a1 + 320) addObject:v22];
      objc_msgSend(v10, "setSectionLocation:animated:", -[UITableViewRowData sectionLocationForRow:inSection:](*(void *)(a1 + 80), objc_msgSend(v19, "row"), objc_msgSend(v19, "section")), 1);

      uint64_t v8 = *(void *)(a1 + 24);
      goto LABEL_18;
    }
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:sel__setupAnimationsForExistingVisibleCells object:a1 file:@"UITableViewSupport.m" lineNumber:736 description:@"Missing visible cell to setup animations"];

    goto LABEL_13;
  }
LABEL_22:
}

- (uint64_t)initialGlobalIndexForFinalGlobalIndex:(uint64_t)result
{
  if (result)
  {
    unint64_t v3 = *(unsigned int *)(result + 356);
    uint64_t v4 = *(void *)(result + 384);
    if (!v4)
    {
      unint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v6 = objc_msgSend(NSString, "stringWithUTF8String:", "NSInteger _UIUpdateMapOldGlobalItemForNewGlobalItem(const _UIDataSourceUpdateMaps, const NSInteger)");
      [v5 handleFailureInFunction:v6, @"_UIDataSourceBatchUpdateMap.h", 185, @"Invalid parameter not satisfying: %@", @"updateMaps.newGlobalItemMap != NULL" file lineNumber description];
    }
    if (a2 > 0x7FFFFFFFFFFFFFFELL) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
    if (v3 <= a2) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
    result = *(unsigned int *)(v4 + 4 * a2);
    if (result == -1) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return result;
}

- (void)_setupAnimationsForExistingHeadersAndFooters
{
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    *(void *)(a1 + 16) = 0;
    if (*(uint64_t *)(a1 + 240) >= 1)
    {
      unint64_t v2 = 0;
      double v207 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      double v208 = *MEMORY[0x1E4F1DB28];
      double v205 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
      double v206 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      while (1)
      {
        uint64_t v3 = -[_UITableViewUpdateSupport initialSectionIndexForFinalSectionIndex:](a1, v2);
        uint64_t v4 = *(void *)(a1 + 16);
        if (v3 == 0x7FFFFFFFFFFFFFFFLL) {
          goto LABEL_41;
        }
        uint64_t v5 = v3;
        if (!*(void *)(*(void *)(a1 + 272) + 8 * v4)) {
          break;
        }
LABEL_24:
        if (!*(void *)(*(void *)(a1 + 280) + 8 * v4))
        {
          v70 = [WeakRetained _visibleFooterViewForSection:v5];
          int v71 = [WeakRetained allowsFooterViewsToFloat];
          double v72 = -[UITableViewRowData rectForFooterInSection:heightCanBeGuessed:](*(void *)(a1 + 72), v5, 1);
          double v74 = v73;
          double v76 = v75;
          double v78 = v77;
          double v79 = -[UITableViewRowData rectForFooterInSection:heightCanBeGuessed:](*(void *)(a1 + 80), *(void *)(a1 + 16), 1);
          CGFloat v81 = v80;
          CGFloat v83 = v82;
          CGFloat v85 = v84;
          if (v71)
          {
            v250.origin.x = v72;
            v250.origin.y = v74;
            v250.size.width = v76;
            v250.size.height = v78;
            if (!CGRectIsEmpty(v250)
              || (v251.origin.x = v79,
                  v251.origin.y = v81,
                  v251.size.width = v83,
                  v251.size.height = v85,
                  !CGRectIsEmpty(v251)))
            {
              [WeakRetained _contentInset];
              double v228 = v89 + *(double *)(a1 + 136);
              double v230 = *(double *)(a1 + 128) + v90;
              double v224 = *(double *)(a1 + 152) - (v89 + v88);
              double v226 = *(double *)(a1 + 144) - (v90 + v87);
              double v91 = -[UITableViewRowData floatingRectForFooterInSection:visibleRect:heightCanBeGuessed:outIsFloating:](*(void *)(a1 + 72), v5, 1, 0, v230, v228, v226, v224);
              double v93 = v92;
              double v95 = v94;
              double v97 = v96;
              [WeakRetained _contentInset];
              double v220 = v100 + *(double *)(a1 + 168);
              double v222 = *(double *)(a1 + 160) + v101;
              double rect_24a = *(double *)(a1 + 184) - (v100 + v99);
              double v218 = *(double *)(a1 + 176) - (v101 + v98);
              double v102 = -[UITableViewRowData floatingRectForFooterInSection:visibleRect:heightCanBeGuessed:outIsFloating:](*(void *)(a1 + 80), *(void *)(a1 + 16), 1, 0, v222, v220, v218, rect_24a);
              CGFloat v104 = v103;
              CGFloat v106 = v105;
              CGFloat v108 = v107;
              v252.origin.x = v91;
              v252.origin.y = v93;
              v252.size.width = v95;
              v252.size.height = v97;
              v283.origin.x = v102;
              v283.origin.y = v104;
              v283.size.width = v106;
              v283.size.height = v108;
              CGRect v253 = CGRectUnion(v252, v283);
              if (CGRectIntersectsRect(v253, *(CGRect *)(a1 + 192)))
              {
                v254.origin.x = v91;
                v254.origin.y = v93;
                v254.size.width = v95;
                v254.size.height = v97;
                v284.origin.x = v102;
                v284.origin.y = v104;
                v284.size.width = v106;
                v284.size.height = v108;
                if (!CGRectEqualToRect(v254, v284))
                {
                  CGFloat rect_8a = v104;
                  CGFloat rect_16a = v102;
                  v255.origin.x = v102;
                  v255.origin.y = v104;
                  v255.size.width = v106;
                  CGFloat v204 = v108;
                  v255.size.height = v108;
                  double MaxY = CGRectGetMaxY(v255);
                  v256.origin.x = v91;
                  v256.origin.y = v93;
                  v256.size.width = v95;
                  v256.size.height = v97;
                  double v110 = MaxY - CGRectGetMaxY(v256);
                  v257.origin.y = v228;
                  v257.origin.x = v230;
                  v257.size.height = v224;
                  v257.size.width = v226;
                  double v111 = CGRectGetMaxY(v257);
                  v258.origin.x = v91;
                  v258.origin.y = v93;
                  v258.size.width = v95;
                  v258.size.height = v97;
                  double v112 = v111 - CGRectGetMaxY(v258);
                  double recta = 0.0;
                  CGFloat v113 = v106;
                  if (v112 > 0.0 && v110 < 0.0)
                  {
                    CGFloat v114 = rect_16a;
                    CGFloat v115 = v204;
                    goto LABEL_91;
                  }
                  CGFloat v114 = rect_16a;
                  CGFloat v115 = v204;
                  if (v112 < 0.0 && v110 > 0.0) {
                    goto LABEL_91;
                  }
                  if (v112 <= 0.0 || (v110 > 0.0 ? (BOOL v141 = v112 <= v110) : (BOOL v141 = 1), v141))
                  {
                    if (v112 >= 0.0)
                    {
                      double recta = v112;
                    }
                    else
                    {
                      BOOL v142 = v110 < 0.0 && v112 < v110;
                      double recta = v112;
                      if (v142) {
                        goto LABEL_90;
                      }
                    }
                  }
                  else
                  {
LABEL_90:
                    double recta = v110;
                  }
LABEL_91:
                  CGFloat v143 = rect_8a;
                  CGFloat v144 = v113;
                  CGFloat v145 = v115;
                  double v146 = CGRectGetMaxY(*(CGRect *)&v114);
                  v265.origin.y = v220;
                  v265.origin.x = v222;
                  v265.size.height = rect_24a;
                  v265.size.width = v218;
                  double v147 = v146 - CGRectGetMaxY(v265);
                  double v148 = 0.0;
                  if (v147 > 0.0 && v110 < 0.0 || v147 < 0.0 && v110 > 0.0) {
                    goto LABEL_102;
                  }
                  if (v147 > 0.0 && v110 > 0.0 && v147 > v110)
                  {
LABEL_101:
                    double v148 = v110;
                    goto LABEL_102;
                  }
                  if (v147 >= 0.0 || v110 >= 0.0)
                  {
                    double v148 = v147;
                    if (!v70) {
                      goto LABEL_103;
                    }
                  }
                  else
                  {
                    double v148 = v147;
                    if (v147 < v110) {
                      goto LABEL_101;
                    }
LABEL_102:
                    if (!v70)
                    {
LABEL_103:
                      if (([WeakRetained _delegateWantsFooterForSection:*(void *)(a1 + 16)] & 1) != 0
                        || (unint64_t v149 = [WeakRetained style], v70 = 0, v149 <= 0x10)
                        && ((1 << v149) & 0x10006) != 0)
                      {
                        v70 = objc_msgSend(WeakRetained, "_sectionFooterViewWithFrame:forSection:floating:reuseViewIfPossible:willDisplay:", *(void *)(a1 + 16), 0, 0, 1, v208, v207, v206, v205);
                        [WeakRetained _addContentSubview:v70 atBack:0];
                      }
                    }
                  }
                  objc_msgSend(v70, "setFrame:", v91, v93, v95, v97);
                  double v86 = v110;
                  if (v110 != 0.0)
                  {
                    v266.origin.y = rect_8a;
                    v266.origin.x = rect_16a;
                    v266.size.width = v113;
                    v266.size.height = v115;
                    char v116 = !CGRectIntersectsRect(v266, *(CGRect *)(a1 + 160));
                    if (recta == 0.0 && v148 == 0.0) {
                      goto LABEL_111;
                    }
                    v267.origin.x = v91;
                    v267.origin.y = v93;
                    v267.size.width = v95;
                    v267.size.height = v97;
                    double MinY = CGRectGetMinY(v267);
                    v268.origin.y = v228;
                    v268.origin.x = v230;
                    v268.size.height = v224;
                    v268.size.width = v226;
                    double v151 = MinY - CGRectGetMinY(v268);
                    v269.origin.y = rect_8a;
                    v269.origin.x = rect_16a;
                    v269.size.width = v113;
                    v269.size.height = v115;
                    double v152 = CGRectGetMinY(v269);
                    v270.origin.y = v220;
                    v270.origin.x = v222;
                    v270.size.height = rect_24a;
                    v270.size.width = v218;
                    if (v151 == v152 - CGRectGetMinY(v270))
                    {
LABEL_111:
                      v117 = [UIViewAnimation alloc];
                      char v118 = [WeakRetained _isEditingWithNoSwipedCell];
                      double v119 = 1.0;
                      double v120 = 0.0;
                      double v121 = 1.0;
                      double v123 = rect_8a;
                      double v122 = rect_16a;
                      double v124 = v113;
                      double v125 = v115;
                      goto LABEL_37;
                    }
                    CGFloat v231 = v113;
                    double v157 = fabs(recta / v110);
                    [v70 frame];
                    double v162 = v158;
                    double v163 = v160;
                    double v164 = v161;
                    double v165 = v159 + recta + recta / v110 * *(double *)(a1 + 224);
                    if (recta / v110 != 0.0)
                    {
                      v286.origin.x = v158;
                      v286.origin.y = v159 + recta + recta / v110 * *(double *)(a1 + 224);
                      v286.size.width = v160;
                      v286.size.height = v161;
                      if (!CGRectEqualToRect(*(CGRect *)&v158, v286))
                      {
                        v166 = -[UIViewAnimation initWithView:indexPath:viewType:endRect:endAlpha:startFraction:endFraction:curve:animateFromCurrentPosition:shouldDeleteAfterAnimation:editing:]((id *)[UIViewAnimation alloc], v70, 0, 3, 0, 1, v116, [WeakRetained _isEditingWithNoSwipedCell], v162, v165, v163, v164, 1.0, 0.0, v157);
                        [*(id *)(a1 + 320) addObject:v166];

                        char v116 = 0;
                      }
                    }
                    double v167 = v110;
                    double v168 = fmax(fabs((v110 - v148) / v110), v157);
                    if (v157 == 1.0) {
                      double v169 = 1.0;
                    }
                    else {
                      double v169 = v168;
                    }
                    double v170 = v165 + (v167 - recta - v148) / v167 * *(double *)(a1 + 224);
                    if (v157 == v169)
                    {
                      CGFloat v171 = rect_16a;
                    }
                    else
                    {
                      v276.origin.x = v162;
                      v276.origin.y = v165;
                      v276.size.width = v163;
                      v276.size.height = v164;
                      v287.origin.x = v162;
                      v287.origin.y = v170;
                      v287.size.width = v163;
                      v287.size.height = v164;
                      CGFloat v171 = rect_16a;
                      if (!CGRectEqualToRect(v276, v287))
                      {
                        v172 = -[UIViewAnimation initWithView:indexPath:viewType:endRect:endAlpha:startFraction:endFraction:curve:animateFromCurrentPosition:shouldDeleteAfterAnimation:editing:]((id *)[UIViewAnimation alloc], v70, 0, 3, 3, 1, v116, [WeakRetained _isEditingWithNoSwipedCell], v162, v170, v163, v164, 1.0, v157, v169);
                        [*(id *)(a1 + 320) addObject:v172];

                        char v116 = 0;
                      }
                    }
                    double v86 = 1.0;
                    if (v169 != 1.0)
                    {
                      v277.origin.x = v162;
                      v277.origin.y = v170;
                      v277.size.width = v163;
                      v277.size.height = v164;
                      v289.origin.x = v171;
                      v289.origin.y = rect_8a;
                      v289.size.width = v231;
                      v289.size.height = v204;
                      if (!CGRectEqualToRect(v277, v289))
                      {
                        v117 = [UIViewAnimation alloc];
                        char v118 = [WeakRetained _isEditingWithNoSwipedCell];
                        double v119 = 1.0;
                        double v121 = 1.0;
                        double v122 = v171;
                        double v123 = rect_8a;
                        double v124 = v231;
                        double v125 = v204;
                        double v120 = v169;
LABEL_37:
                        v126 = -[UIViewAnimation initWithView:indexPath:viewType:endRect:endAlpha:startFraction:endFraction:curve:animateFromCurrentPosition:shouldDeleteAfterAnimation:editing:]((id *)&v117->super.isa, v70, 0, 3, 0, 1, v116, v118, v122, v123, v124, v125, v119, v120, v121);
                        [*(id *)(a1 + 320) addObject:v126];
                      }
                    }
                  }
                }
              }
            }
LABEL_38:
            uint64_t v127 = *(void *)(a1 + 280);
            uint64_t v128 = *(void *)(a1 + 16);
            v129 = *(void **)(v127 + 8 * v128);
            if (v129)
            {
              v200 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", v86);
              [v200 handleFailureInMethod:sel__setupAnimationsForExistingHeadersAndFooters object:a1 file:@"UITableViewSupport.m" lineNumber:2294 description:@"Attempt to create two animations for footer view"];

              uint64_t v127 = *(void *)(a1 + 280);
              uint64_t v128 = *(void *)(a1 + 16);
              v129 = *(void **)(v127 + 8 * v128);
            }
            *(void *)(v127 + 8 * v128) = v70;

            uint64_t v4 = *(void *)(a1 + 16);
            goto LABEL_41;
          }
          v259.origin.x = v72;
          v259.origin.y = v74;
          v259.size.width = v76;
          v259.size.height = v78;
          if (CGRectIsEmpty(v259))
          {
            v260.origin.x = v79;
            v260.origin.y = v81;
            v260.size.width = v83;
            v260.size.height = v85;
            if (CGRectIsEmpty(v260)) {
              goto LABEL_38;
            }
          }
          v261.origin.x = v72;
          v261.origin.y = v74;
          v261.size.width = v76;
          v261.size.height = v78;
          v285.origin.x = v79;
          v285.origin.y = v81;
          v285.size.width = v83;
          v285.size.height = v85;
          CGRect v262 = CGRectUnion(v261, v285);
          if (!v70)
          {
            if (!CGRectIntersectsRect(v262, *(CGRect *)(a1 + 192)))
            {
              v70 = 0;
              goto LABEL_38;
            }
            if (([WeakRetained _delegateWantsFooterForSection:*(void *)(a1 + 16)] & 1) == 0)
            {
              unint64_t v131 = [WeakRetained style];
              v70 = 0;
              if (v131 > 0x10 || ((1 << v131) & 0x10006) == 0) {
                goto LABEL_38;
              }
            }
            v70 = objc_msgSend(WeakRetained, "_sectionFooterViewWithFrame:forSection:floating:reuseViewIfPossible:willDisplay:", *(void *)(a1 + 16), 0, 0, 1, v72, v74, v76, v78);
            [WeakRetained _addContentSubview:v70 atBack:0];
            if (!v70) {
              goto LABEL_38;
            }
          }
          v263.origin.x = v79;
          v263.origin.y = v81;
          v263.size.width = v83;
          v263.size.height = v85;
          char v116 = !CGRectIntersectsRect(v263, *(CGRect *)(a1 + 160));
          v117 = [UIViewAnimation alloc];
          char v118 = [WeakRetained _isEditingWithNoSwipedCell];
          double v119 = 1.0;
          double v120 = 0.0;
          double v121 = 1.0;
          double v122 = v79;
          double v123 = v81;
          double v124 = v83;
          double v125 = v85;
          goto LABEL_37;
        }
LABEL_41:
        unint64_t v2 = v4 + 1;
        *(void *)(a1 + 16) = v4 + 1;
        if (v4 + 1 >= *(void *)(a1 + 240)) {
          goto LABEL_167;
        }
      }
      uint64_t v6 = [WeakRetained _visibleHeaderViewForSection:v3];
      int v7 = [WeakRetained allowsHeaderViewsToFloat];
      double v8 = -[UITableViewRowData rectForHeaderInSection:heightCanBeGuessed:](*(void *)(a1 + 72), v5, 1);
      double v10 = v9;
      double v12 = v11;
      double v14 = v13;
      double v15 = -[UITableViewRowData rectForHeaderInSection:heightCanBeGuessed:](*(void *)(a1 + 80), *(void *)(a1 + 16), 1);
      CGFloat v17 = v16;
      CGFloat v19 = v18;
      CGFloat v21 = v20;
      if (!v7)
      {
        v245.origin.x = v8;
        v245.origin.y = v10;
        v245.size.width = v12;
        v245.size.height = v14;
        if (CGRectIsEmpty(v245))
        {
          v246.origin.x = v15;
          v246.origin.y = v17;
          v246.size.width = v19;
          v246.size.height = v21;
          if (CGRectIsEmpty(v246)) {
            goto LABEL_21;
          }
        }
        v247.origin.x = v8;
        v247.origin.y = v10;
        v247.size.width = v12;
        v247.size.height = v14;
        v282.origin.x = v15;
        v282.origin.y = v17;
        v282.size.width = v19;
        v282.size.height = v21;
        CGRect v248 = CGRectUnion(v247, v282);
        if (!v6)
        {
          if (!CGRectIntersectsRect(v248, *(CGRect *)(a1 + 192)))
          {
            uint64_t v6 = 0;
            goto LABEL_21;
          }
          if (([WeakRetained _delegateWantsHeaderForSection:*(void *)(a1 + 16)] & 1) == 0)
          {
            unint64_t v130 = [WeakRetained style];
            uint64_t v6 = 0;
            if (v130 > 0x10 || ((1 << v130) & 0x10006) == 0) {
              goto LABEL_21;
            }
          }
          uint64_t v6 = objc_msgSend(WeakRetained, "_sectionHeaderViewWithFrame:forSection:floating:reuseViewIfPossible:willDisplay:", *(void *)(a1 + 16), 0, 0, 1, v8, v10, v12, v14);
          [WeakRetained _addContentSubview:v6 atBack:0];
          if (!v6) {
            goto LABEL_21;
          }
        }
        v249.origin.x = v15;
        v249.origin.y = v17;
        v249.size.width = v19;
        v249.size.height = v21;
        char v56 = !CGRectIntersectsRect(v249, *(CGRect *)(a1 + 160));
        double v57 = [UIViewAnimation alloc];
        char v58 = [WeakRetained _isEditingWithNoSwipedCell];
        double v59 = 1.0;
        double v60 = 0.0;
        double v61 = 1.0;
        double v62 = v15;
        double v63 = v17;
        double v64 = v19;
        double v65 = v21;
LABEL_20:
        CGRect v66 = -[UIViewAnimation initWithView:indexPath:viewType:endRect:endAlpha:startFraction:endFraction:curve:animateFromCurrentPosition:shouldDeleteAfterAnimation:editing:]((id *)&v57->super.isa, v6, 0, 2, 0, 1, v56, v58, v62, v63, v64, v65, v59, v60, v61);
        [*(id *)(a1 + 320) addObject:v66];

LABEL_21:
        uint64_t v67 = *(void *)(a1 + 272);
        uint64_t v68 = *(void *)(a1 + 16);
        v69 = *(void **)(v67 + 8 * v68);
        if (v69)
        {
          v199 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", v22);
          [v199 handleFailureInMethod:sel__setupAnimationsForExistingHeadersAndFooters object:a1 file:@"UITableViewSupport.m" lineNumber:2185 description:@"Attempt to create two animations for header view"];

          uint64_t v67 = *(void *)(a1 + 272);
          uint64_t v68 = *(void *)(a1 + 16);
          v69 = *(void **)(v67 + 8 * v68);
        }
        *(void *)(v67 + 8 * v68) = v6;

        uint64_t v4 = *(void *)(a1 + 16);
        goto LABEL_24;
      }
      v234.origin.x = v8;
      v234.origin.y = v10;
      v234.size.width = v12;
      v234.size.height = v14;
      if (CGRectIsEmpty(v234))
      {
        v235.origin.x = v15;
        v235.origin.y = v17;
        v235.size.width = v19;
        v235.size.height = v21;
        if (CGRectIsEmpty(v235)) {
          goto LABEL_21;
        }
      }
      [WeakRetained _contentInset];
      double v227 = v25 + *(double *)(a1 + 136);
      double v229 = *(double *)(a1 + 128) + v26;
      double v223 = *(double *)(a1 + 152) - (v25 + v24);
      double v225 = *(double *)(a1 + 144) - (v26 + v23);
      double v27 = -[UITableViewRowData floatingRectForHeaderInSection:visibleRect:heightCanBeGuessed:outIsFloating:](*(void *)(a1 + 72), v5, 1, 0, v229, v227, v225, v223);
      double v29 = v28;
      double v31 = v30;
      double v33 = v32;
      [WeakRetained _contentInset];
      double v219 = v36 + *(double *)(a1 + 168);
      double v221 = *(double *)(a1 + 160) + v37;
      double rect_24 = *(double *)(a1 + 184) - (v36 + v35);
      double v217 = *(double *)(a1 + 176) - (v37 + v34);
      double v38 = -[UITableViewRowData floatingRectForHeaderInSection:visibleRect:heightCanBeGuessed:outIsFloating:](*(void *)(a1 + 80), *(void *)(a1 + 16), 1, 0, v221, v219, v217, rect_24);
      CGFloat v40 = v39;
      CGFloat v42 = v41;
      CGFloat v44 = v43;
      v236.origin.x = v27;
      v236.origin.y = v29;
      v236.size.width = v31;
      v236.size.height = v33;
      v280.origin.x = v38;
      v280.origin.y = v40;
      v280.size.width = v42;
      v280.size.height = v44;
      CGRect v237 = CGRectUnion(v236, v280);
      if (!CGRectIntersectsRect(v237, *(CGRect *)(a1 + 192))) {
        goto LABEL_21;
      }
      v238.origin.x = v27;
      v238.origin.y = v29;
      v238.size.width = v31;
      v238.size.height = v33;
      v281.origin.x = v38;
      v281.origin.y = v40;
      v281.size.width = v42;
      v281.size.height = v44;
      if (CGRectEqualToRect(v238, v281)) {
        goto LABEL_21;
      }
      v239.origin.x = v38;
      v239.origin.y = v40;
      v239.size.width = v42;
      v239.size.height = v44;
      CGFloat rect_8 = v44;
      CGFloat v45 = v42;
      CGFloat v46 = v40;
      CGFloat v47 = v38;
      double v48 = CGRectGetMinY(v239);
      v240.origin.x = v27;
      v240.origin.y = v29;
      v240.size.width = v31;
      v240.size.height = v33;
      double v49 = v48 - CGRectGetMinY(v240);
      if (v49 == 0.0)
      {
        v241.origin.x = v47;
        v241.origin.y = v46;
        v241.size.width = v45;
        v241.size.height = rect_8;
        double v50 = CGRectGetMinY(v241);
        v242.origin.x = v27;
        v242.origin.y = v29;
        v242.size.width = v31;
        v242.size.height = v33;
        double v49 = v50 - CGRectGetMinY(v242);
      }
      double rect_16 = v49;
      CGFloat v201 = v45;
      double v202 = v46;
      CGFloat rect = v47;
      v243.origin.y = v227;
      v243.origin.x = v229;
      v243.size.height = v223;
      v243.size.width = v225;
      double v51 = CGRectGetMinY(v243);
      v244.origin.x = v27;
      v244.origin.y = v29;
      v244.size.width = v31;
      v244.size.height = v33;
      double v52 = v51 - CGRectGetMinY(v244);
      double v203 = 0.0;
      if (v52 > 0.0 && rect_16 < 0.0)
      {
        CGFloat v53 = v47;
        CGFloat v55 = v45;
        CGFloat v54 = v202;
        goto LABEL_72;
      }
      CGFloat v53 = v47;
      CGFloat v55 = v45;
      CGFloat v54 = v202;
      if (v52 < 0.0 && rect_16 > 0.0) {
        goto LABEL_72;
      }
      if (v52 <= 0.0 || (rect_16 > 0.0 ? (BOOL v132 = v52 <= rect_16) : (BOOL v132 = 1), v132))
      {
        if (v52 >= 0.0)
        {
          double v203 = v52;
LABEL_72:
          CGFloat v134 = v54;
          CGFloat v135 = v55;
          CGFloat v136 = rect_8;
          double v137 = CGRectGetMinY(*(CGRect *)&v53);
          v264.origin.y = v219;
          v264.origin.x = v221;
          v264.size.height = rect_24;
          v264.size.width = v217;
          double v138 = v137 - CGRectGetMinY(v264);
          double v139 = 0.0;
          if (v138 > 0.0 && rect_16 < 0.0)
          {
            double v140 = v27;
            if (v6) {
              goto LABEL_127;
            }
            goto LABEL_122;
          }
          double v140 = v27;
          if (v138 >= 0.0 || rect_16 <= 0.0)
          {
            if (v138 > 0.0 && rect_16 > 0.0 && v138 > rect_16) {
              goto LABEL_120;
            }
            if (v138 >= 0.0 || rect_16 >= 0.0)
            {
              double v139 = v138;
              if (v6)
              {
LABEL_127:
                objc_msgSend(v6, "setFrame:", v140, v29, v31, v33);
                double v22 = rect_16;
                if (rect_16 == 0.0) {
                  goto LABEL_21;
                }
                v271.origin.x = rect;
                v271.size.height = rect_8;
                v271.origin.y = v54;
                v271.size.width = v55;
                char v56 = !CGRectIntersectsRect(v271, *(CGRect *)(a1 + 160));
                if (v203 == 0.0 && v139 == 0.0) {
                  goto LABEL_131;
                }
                v272.origin.x = v27;
                v272.origin.y = v29;
                v272.size.width = v31;
                v272.size.height = v33;
                double v154 = CGRectGetMinY(v272);
                v273.origin.y = v227;
                v273.origin.x = v229;
                v273.size.height = v223;
                v273.size.width = v225;
                double v155 = v154 - CGRectGetMinY(v273);
                v274.origin.x = rect;
                v274.size.height = rect_8;
                v274.origin.y = v54;
                v274.size.width = v55;
                double v156 = CGRectGetMinY(v274);
                v275.origin.y = v219;
                v275.origin.x = v221;
                v275.size.height = rect_24;
                v275.size.width = v217;
                if (v155 == v156 - CGRectGetMinY(v275))
                {
LABEL_131:
                  double v57 = [UIViewAnimation alloc];
                  char v58 = [WeakRetained _isEditingWithNoSwipedCell];
                  double v59 = 1.0;
                  double v60 = 0.0;
                  double v61 = 1.0;
                  double v62 = rect;
                  double v65 = rect_8;
                  double v63 = v54;
                  double v64 = v55;
                  goto LABEL_20;
                }
                double v173 = fabs(v203 / rect_16);
                [v6 frame];
                CGFloat v178 = v174;
                double v179 = v176;
                CGFloat v180 = v177;
                double v181 = v175 + v203 + v203 / rect_16 * *(double *)(a1 + 224);
                if (v203 / rect_16 == 0.0)
                {
                  double v183 = v177;
                }
                else
                {
                  v288.origin.x = v174;
                  v288.origin.y = v175 + v203 + v203 / rect_16 * *(double *)(a1 + 224);
                  v288.size.width = v176;
                  v288.size.height = v177;
                  double v182 = v177;
                  if (!CGRectEqualToRect(*(CGRect *)&v174, v288))
                  {
                    v186 = [UIViewAnimation alloc];
                    char v187 = [WeakRetained _isEditingWithNoSwipedCell];
                    double v184 = v178;
                    double v188 = v178;
                    double v185 = v179;
                    double v183 = v182;
                    v189 = -[UIViewAnimation initWithView:indexPath:viewType:endRect:endAlpha:startFraction:endFraction:curve:animateFromCurrentPosition:shouldDeleteAfterAnimation:editing:]((id *)&v186->super.isa, v6, 0, 2, 0, 1, v56, v187, v188, v181, v179, v182, 1.0, 0.0, v173);
                    [*(id *)(a1 + 320) addObject:v189];

                    char v56 = 0;
                    goto LABEL_151;
                  }
                  double v183 = v180;
                }
                double v184 = v178;
                double v185 = v179;
LABEL_151:
                double v190 = 1.0;
                double v191 = fmax(fabs((rect_16 - v139) / rect_16), v173);
                if (v173 != 1.0) {
                  double v190 = v191;
                }
                double v192 = v190;
                double v193 = v181 + (rect_16 - v203 - v139) / rect_16 * *(double *)(a1 + 224);
                if (v173 == v190)
                {
                  CGFloat v196 = rect;
                  CGFloat v198 = v202;
                  double v194 = v185;
                  CGFloat v195 = v184;
                }
                else
                {
                  v278.origin.x = v184;
                  v278.origin.y = v181;
                  double v194 = v185;
                  CGFloat v195 = v184;
                  v278.size.width = v194;
                  v278.size.height = v183;
                  v290.origin.x = v184;
                  v290.origin.y = v193;
                  v290.size.width = v194;
                  v290.size.height = v183;
                  CGFloat v196 = rect;
                  if (!CGRectEqualToRect(v278, v290))
                  {
                    v197 = -[UIViewAnimation initWithView:indexPath:viewType:endRect:endAlpha:startFraction:endFraction:curve:animateFromCurrentPosition:shouldDeleteAfterAnimation:editing:]((id *)[UIViewAnimation alloc], v6, 0, 2, 3, 1, v56, [WeakRetained _isEditingWithNoSwipedCell], v184, v193, v194, v183, 1.0, v173, v192);
                    [*(id *)(a1 + 320) addObject:v197];

                    char v56 = 0;
                  }
                  CGFloat v198 = v202;
                }
                double v22 = 1.0;
                if (v192 == 1.0) {
                  goto LABEL_21;
                }
                v279.origin.x = v195;
                v279.origin.y = v193;
                v279.size.width = v194;
                v279.size.height = v183;
                v291.origin.x = v196;
                v291.origin.y = v198;
                v291.size.width = v201;
                v291.size.height = rect_8;
                if (CGRectEqualToRect(v279, v291)) {
                  goto LABEL_21;
                }
                double v57 = [UIViewAnimation alloc];
                char v58 = [WeakRetained _isEditingWithNoSwipedCell];
                double v59 = 1.0;
                double v61 = 1.0;
                double v62 = v196;
                double v63 = v198;
                double v64 = v201;
                double v65 = rect_8;
                double v60 = v192;
                goto LABEL_20;
              }
LABEL_122:
              if ((objc_msgSend(WeakRetained, "_delegateWantsHeaderForSection:", *(void *)(a1 + 16), v140, rect_16) & 1) == 0)
              {
                unint64_t v153 = [WeakRetained style];
                uint64_t v6 = 0;
                if (v153 > 0x10)
                {
LABEL_126:
                  double v140 = v27;
                  goto LABEL_127;
                }
                double v140 = v27;
                if (((1 << v153) & 0x10006) == 0) {
                  goto LABEL_127;
                }
              }
              uint64_t v6 = objc_msgSend(WeakRetained, "_sectionHeaderViewWithFrame:forSection:floating:reuseViewIfPossible:willDisplay:", *(void *)(a1 + 16), 0, 0, 1, v208, v207, v206, v205);
              [WeakRetained _addContentSubview:v6 atBack:0];
              goto LABEL_126;
            }
            double v139 = v138;
            if (v138 < rect_16) {
LABEL_120:
            }
              double v139 = rect_16;
          }
          if (v6) {
            goto LABEL_127;
          }
          goto LABEL_122;
        }
        BOOL v133 = rect_16 < 0.0 && v52 < rect_16;
        double v203 = v52;
        if (!v133) {
          goto LABEL_72;
        }
      }
      double v203 = rect_16;
      goto LABEL_72;
    }
LABEL_167:
  }
}

- (void)_setupAnimations
{
  if (a1)
  {
    -[_UITableViewUpdateSupport _computeVisibleBounds](a1);
    -[_UITableViewUpdateSupport _faultInRealHeightsOfNeededElements](a1);
    -[_UITableViewUpdateSupport _setupAnimationStructures](a1);
    -[_UITableViewUpdateSupport _computeAutomaticAnimationTypes](a1);
    -[_UITableViewUpdateSupport _setupAnimationsForExistingVisibleCells](a1);
    -[_UITableViewUpdateSupport _setupAnimationForReorderingRow](a1);
    -[_UITableViewUpdateSupport _setupAnimationsForNewlyInsertedCells](a1);
    -[_UITableViewUpdateSupport _setupAnimationsForInsertedHeadersAndFooters](a1);
    -[_UITableViewUpdateSupport _setupAnimationsForExistingOffscreenCells](a1);
    -[_UITableViewUpdateSupport _setupAnimationsForExistingHeadersAndFooters](a1);
    -[_UITableViewUpdateSupport _setupAnimationForTableHeader](a1);
    -[_UITableViewUpdateSupport _setupAnimationForTableFooter](a1);
    -[_UITableViewUpdateSupport _setupAnimationsForDeletedCells](a1);
    -[_UITableViewUpdateSupport _setupAnimationsForDeletedHeadersAndFooters](a1);
  }
}

- (void)_setupAnimationsForInsertedHeadersAndFooters
{
  uint64_t v156 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    location = (id *)(a1 + 40);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained _currentScreenScale];
    double v136 = v2;
    long long v150 = 0u;
    long long v151 = 0u;
    long long v152 = 0u;
    long long v153 = 0u;
    id obj = *(id *)(a1 + 336);
    uint64_t v138 = [obj countByEnumeratingWithState:&v150 objects:v155 count:16];
    if (!v138) {
      goto LABEL_113;
    }
    uint64_t v137 = *(void *)v151;
    double v133 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v134 = *MEMORY[0x1E4F1DB28];
    double v131 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    double v132 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    while (1)
    {
      for (uint64_t i = 0; i != v138; ++i)
      {
        if (*(void *)v151 != v137) {
          objc_enumerationMutation(obj);
        }
        uint64_t v4 = *(void **)(*((void *)&v150 + 1) + 8 * i);
        uint64_t v5 = [v4 valueForKey:@"Section"];
        int v6 = [v5 intValue];

        uint64_t v7 = [v4 valueForKey:@"UpdateItem"];
        double v8 = [v4 valueForKey:@"OldHeaderRect"];
        double v9 = v8;
        if (v8) {
          [v8 CGRectValue];
        }
        BOOL v142 = v9;
        uint64_t v10 = v6;
        double v11 = -[UITableViewRowData rectForHeaderInSection:heightCanBeGuessed:](*(void *)(a1 + 80), v6, 1);
        double v13 = v12;
        double v15 = v14;
        double v16 = objc_msgSend(v4, "valueForKey:", @"OldFooterRect", v11);
        CGFloat v17 = v16;
        if (v16) {
          [v16 CGRectValue];
        }
        -[UITableViewRowData rectForFooterInSection:heightCanBeGuessed:](*(void *)(a1 + 80), v6, 1);
        double v19 = v18;
        double v21 = v20;
        double rect = v15;
        double v145 = v20;
        if (v7 && (*(unsigned char *)(v7 + 16) & 2) != 0)
        {
          uint64_t v23 = -[_UITableViewUpdateSupport initialSectionIndexForFinalSectionIndex:](a1, v6);
          int v24 = 1;
          double v25 = -[UITableViewRowData rectForHeaderInSection:heightCanBeGuessed:](*(void *)(a1 + 72), v23, 1);
          double v148 = v26;
          double v27 = -[UITableViewRowData rectForFooterInSection:heightCanBeGuessed:](*(void *)(a1 + 72), v23, 1);
          double v29 = v28;
          double MaxY = 0.0;
          goto LABEL_59;
        }
        if (v6 < 1)
        {
          int64_t v22 = v6 - 1;
          if (!v6)
          {
LABEL_21:
            double v33 = -[UITableViewRowData rectForTableHeaderView](*(void *)(a1 + 72));
            LODWORD(v22) = -1;
            goto LABEL_22;
          }
        }
        else
        {
          int64_t v22 = v6;
          while (-[_UITableViewUpdateSupport initialSectionIndexForFinalSectionIndex:](a1, --v22) == 0x7FFFFFFFFFFFFFFFLL)
          {
            if (v22 <= 0) {
              goto LABEL_21;
            }
          }
        }
        uint64_t v31 = *(void *)(a1 + 72);
        uint64_t v32 = -[_UITableViewUpdateSupport initialSectionIndexForFinalSectionIndex:](a1, v22);
        double v33 = -[UITableViewRowData rectForFooterInSection:heightCanBeGuessed:](v31, v32, 1);
LABEL_22:
        double MaxY = CGRectGetMaxY(*(CGRect *)&v33);
        uint64_t v37 = v6 + 1;
        while (1)
        {
          int64_t v38 = v37;
          int64_t v39 = *(void *)(a1 + 240);
          if (v38 >= v39) {
            break;
          }
          uint64_t v40 = -[_UITableViewUpdateSupport initialSectionIndexForFinalSectionIndex:](a1, v38);
          uint64_t v37 = v38 + 1;
          if (v40 != 0x7FFFFFFFFFFFFFFFLL)
          {
            int64_t v39 = *(void *)(a1 + 240);
            break;
          }
        }
        if (v39 == v38)
        {
          v157.origin.x = -[UITableViewRowData rectForTableFooterView](*(void *)(a1 + 72));
          double MinY = CGRectGetMinY(v157);
        }
        else
        {
          uint64_t v42 = -[_UITableViewUpdateSupport initialSectionIndexForFinalSectionIndex:](a1, v38);
          v158.origin.x = -[UITableViewRowData rectForHeaderInSection:heightCanBeGuessed:](*(void *)(a1 + 72), v42, 1);
          double v43 = CGRectGetMinY(v158);
          double MinY = v43 - -[UITableViewRowData offsetForHeaderInSection:](*(void *)(a1 + 72), v42);
        }
        uint64_t v44 = *(void *)(a1 + 80);
        CGFloat v140 = v13;
        if ((int)v10 < 1) {
          double v45 = -[UITableViewRowData rectForTableHeaderView](v44);
        }
        else {
          double v45 = -[UITableViewRowData rectForFooterInSection:heightCanBeGuessed:](v44, v10 - 1, 1);
        }
        double v46 = v45;
        CGFloat rect2 = v19;
        double v47 = MaxY;
        double v48 = MaxY;
        if (v38 - 1 >= (int)v22 + 1)
        {
          uint64_t v49 = (int)v22 + 1;
          double v48 = MaxY;
          double v47 = MaxY;
          do
          {
            if (v10 - 1 == v22) {
              double v48 = v47 - MaxY;
            }
            double v47 = v47 + -[UITableViewRowData heightForSection:](*(void *)(a1 + 80), v49);
            uint64_t v49 = (int)v22 + 2;
            LODWORD(v22) = v22 + 1;
          }
          while (v38 - 1 >= v49);
        }
        CGFloat v139 = v46;
        double v50 = 0.0;
        if (MaxY != v47) {
          double v50 = (MinY - MaxY) / (v47 - MaxY);
        }
        double v51 = MaxY + UIPixelBoundaryOffset(0, v48 * v50, v136);
        double v29 = v51 + v50 * (-[UITableViewRowData heightForSection:](*(void *)(a1 + 80), v10) - v21);
        double v52 = v51 + -[UITableViewRowData offsetForHeaderInSection:](*(void *)(a1 + 80), v10);
        [WeakRetained _contentInset];
        double v54 = *(double *)(a1 + 128) + v53;
        double v56 = v55 + *(double *)(a1 + 136);
        double v58 = *(double *)(a1 + 144) - (v53 + v57);
        double v60 = *(double *)(a1 + 152) - (v55 + v59);
        if (![WeakRetained allowsHeaderViewsToFloat])
        {
          double v70 = v52;
          CGFloat v69 = v60;
          double v19 = rect2;
          goto LABEL_50;
        }
        v159.origin.x = v54;
        v159.origin.y = v56;
        v159.size.width = v58;
        v159.size.height = v60;
        v182.origin.y = v29;
        v182.origin.x = v139;
        CGFloat v135 = v56;
        CGFloat v61 = v54;
        v182.size.width = rect2;
        CGFloat v62 = v60;
        double v19 = rect2;
        v182.size.height = v21;
        if (CGRectIntersectsRect(v159, v182))
        {
          v160.origin.x = v139;
          v160.origin.y = v52;
          v160.size.width = v140;
          v160.size.height = rect;
          double v63 = CGRectGetMinY(v160);
          v161.origin.x = v61;
          v161.origin.y = v135;
          v161.size.width = v58;
          v161.size.height = v62;
          CGFloat v64 = CGRectGetMinY(v161);
          double v65 = v58;
          double v66 = v62;
          if (v63 < v64)
          {
            double v54 = v61;
            CGFloat v67 = v61;
            CGFloat v149 = v52;
            CGFloat v68 = v135;
            CGFloat v69 = v66;
            double v129 = CGRectGetMinY(*(CGRect *)(&v65 - 2));
            v162.origin.x = v139;
            v162.origin.y = v29;
            v162.size.width = rect2;
            double v21 = v145;
            v162.size.height = v145;
            double v128 = CGRectGetMinY(v162);
            v163.origin.x = v139;
            v163.size.height = rect;
            v163.origin.y = v149;
            v163.size.width = v140;
            double v70 = v128 - CGRectGetHeight(v163);
            if (v129 < v70) {
              double v70 = v129;
            }
            double v19 = rect2;
            goto LABEL_49;
          }
          double v70 = v52;
          CGFloat v69 = v62;
          double v54 = v61;
          double v19 = rect2;
        }
        else
        {
          double v70 = v52;
          CGFloat v69 = v62;
          double v54 = v61;
        }
        double v21 = v145;
LABEL_49:
        double v56 = v135;
LABEL_50:
        double v148 = v70;
        if ([WeakRetained allowsFooterViewsToFloat])
        {
          v164.origin.x = v54;
          v164.origin.y = v56;
          v164.size.width = v58;
          v164.size.height = v69;
          v183.size.width = v140;
          v183.origin.x = v139;
          v183.size.height = rect;
          v183.origin.y = v148;
          if (CGRectIntersectsRect(v164, v183))
          {
            v165.origin.x = v139;
            v165.origin.y = v29;
            v165.size.width = rect2;
            v165.size.height = v21;
            double v71 = CGRectGetMaxY(v165);
            v166.origin.x = v54;
            v166.origin.y = v56;
            v166.size.width = v58;
            v166.size.height = v69;
            if (v71 <= CGRectGetMaxY(v166))
            {
              int v24 = 0;
              double v25 = v139;
              double v13 = v140;
              double v19 = rect2;
              double v27 = v139;
            }
            else
            {
              v167.origin.x = v54;
              v167.origin.y = v56;
              v167.size.width = v58;
              v167.size.height = v69;
              double v72 = CGRectGetMaxY(v167);
              v168.origin.x = v139;
              v168.origin.y = v29;
              double v19 = rect2;
              v168.size.width = rect2;
              v168.size.height = v21;
              double v73 = v72 - CGRectGetHeight(v168);
              v169.origin.x = v139;
              v169.size.height = rect;
              v169.origin.y = v148;
              double v13 = v140;
              v169.size.width = v140;
              double v74 = CGRectGetMaxY(v169);
              int v24 = 0;
              if (v73 >= v74) {
                double v74 = v73;
              }
              double v25 = v139;
              double v27 = v139;
              double v29 = v74;
            }
          }
          else
          {
            int v24 = 0;
            double v25 = v139;
            double v27 = v139;
            double v13 = v140;
            double v19 = rect2;
          }
        }
        else
        {
          int v24 = 0;
          double v27 = v139;
          double v13 = v140;
          double v25 = v139;
        }
LABEL_59:
        double v75 = -[UITableViewRowData heightForHeaderInSection:canGuess:](*(void *)(a1 + 80), v10, 1);
        double v76 = -[UITableViewRowData heightForFooterInSection:canGuess:](*(void *)(a1 + 80), v10, 1);
        [WeakRetained bounds];
        if (v7)
        {
          switch(*(void *)(v7 + 32))
          {
            case 1:
              double v25 = v25 + v77;
              double v27 = v27 + v77;
              break;
            case 2:
              double v25 = v25 - v77;
              double v27 = v27 - v77;
              break;
            case 3:
              if (v24)
              {
                v170.origin.x = v25;
                v170.size.height = rect;
                v170.origin.y = v148;
                v170.size.width = v13;
                double v148 = v148 - CGRectGetHeight(v170);
                v171.origin.x = v27;
                v171.origin.y = v29;
                v171.size.width = v19;
                v171.size.height = v145;
                double Height = CGRectGetHeight(v171);
                goto LABEL_66;
              }
              if (v76 <= v75) {
                double v80 = v75;
              }
              else {
                double v80 = v76;
              }
              double v29 = MaxY - v80;
              double v148 = MaxY - v80;
              break;
            case 6:
              double v79 = -[UITableViewRowData heightForSection:](*(void *)(a1 + 80), v10);
              double Height = UIPixelBoundaryOffset(0, v79 * 0.5, v136);
              double v148 = v148 - Height;
LABEL_66:
              double v29 = v29 - Height;
              break;
            default:
              break;
          }
        }
        double v146 = v29;
        double v81 = v27;
        double v82 = (id)v7;
        id v83 = objc_loadWeakRetained(location);
        BOOL v154 = 0;
        int v84 = [v83 allowsHeaderViewsToFloat];
        uint64_t v85 = *(void *)(a1 + 80);
        if (v84)
        {
          [v83 _contentInset];
          double v90 = -[UITableViewRowData floatingRectForHeaderInSection:visibleRect:heightCanBeGuessed:outIsFloating:](v85, v10, 1, &v154, *(double *)(a1 + 128) + v89, v86 + *(double *)(a1 + 136), *(double *)(a1 + 144) - (v89 + v87), *(double *)(a1 + 152) - (v86 + v88));
        }
        else
        {
          double v90 = -[UITableViewRowData rectForHeaderInSection:heightCanBeGuessed:](*(void *)(a1 + 80), v10, 1);
        }
        double v94 = v90;
        double v95 = v91;
        double v96 = v92;
        double v97 = v93;
        v172.origin.x = v25;
        v172.size.height = rect;
        v172.origin.y = v148;
        v172.size.width = v13;
        if (!CGRectIsEmpty(v172)
          || (v173.origin.x = v94,
              v173.origin.y = v95,
              v173.size.width = v96,
              v173.size.height = v97,
              !CGRectIsEmpty(v173)))
        {
          v174.origin.x = v25;
          v174.size.height = rect;
          v174.origin.y = v148;
          v174.size.width = v13;
          v184.origin.x = v94;
          v184.origin.y = v95;
          v184.size.width = v96;
          v184.size.height = v97;
          CGRect v175 = CGRectUnion(v174, v184);
          if (CGRectIntersectsRect(v175, *(CGRect *)(a1 + 192)))
          {
            if (([v83 _delegateWantsHeaderForSection:v10] & 1) != 0
              || (unint64_t v98 = [v83 style], v98 <= 0x10) && ((1 << v98) & 0x10006) != 0)
            {
              double v99 = objc_msgSend(v83, "_sectionHeaderViewWithFrame:forSection:floating:reuseViewIfPossible:willDisplay:", v10, v154, 0, 1, v134, v133, v132, v131);
              objc_msgSend(v83, "_addContentSubview:atBack:", v99, objc_msgSend(v83, "allowsHeaderViewsToFloat") ^ 1);
              if (*(void *)(*(void *)(a1 + 272) + 8 * v10))
              {
                v126 = [MEMORY[0x1E4F28B00] currentHandler];
                [v126 handleFailureInMethod:sel__setupInsertAnimationForHeaderInSection_withTargetRect_forUpdateItem_ object:a1 file:@"UITableViewSupport.m" lineNumber:1294 description:@"Attempt to create two animations for header view"];
              }
              double v100 = v99;
              if (!v99)
              {
                double v100 = [MEMORY[0x1E4F1CA98] null];
              }
              objc_storeStrong((id *)(*(void *)(a1 + 272) + 8 * v10), v100);
              if (!v99) {

              }
              if (!v7 || (unint64_t v101 = v82[4], v101 <= 6) && ((1 << v101) & 0x47) != 0) {
                [v99 setAlpha:0.0];
              }
              objc_msgSend(v99, "setFrame:", v25, v148, v13, rect);
              v176.origin.x = v94;
              v176.origin.y = v95;
              v176.size.width = v96;
              v176.size.height = v97;
              char v102 = !CGRectIntersectsRect(v176, *(CGRect *)(a1 + 160));
              double v103 = -[UIViewAnimation initWithView:indexPath:viewType:endRect:endAlpha:startFraction:endFraction:curve:animateFromCurrentPosition:shouldDeleteAfterAnimation:editing:]((id *)[UIViewAnimation alloc], v99, 0, 2, 0, 0, v102, 0, v94, v95, v96, v97, 1.0, 0.0, 1.0);
              [*(id *)(a1 + 320) addObject:v103];
            }
          }
        }

        CGFloat v104 = v82;
        id v105 = objc_loadWeakRetained(location);
        BOOL v154 = 0;
        int v106 = [v105 allowsFooterViewsToFloat];
        uint64_t v107 = *(void *)(a1 + 80);
        if (v106)
        {
          [v105 _contentInset];
          double v112 = -[UITableViewRowData floatingRectForFooterInSection:visibleRect:heightCanBeGuessed:outIsFloating:](v107, v10, 1, &v154, *(double *)(a1 + 128) + v111, v108 + *(double *)(a1 + 136), *(double *)(a1 + 144) - (v111 + v109), *(double *)(a1 + 152) - (v108 + v110));
        }
        else
        {
          double v112 = -[UITableViewRowData rectForFooterInSection:heightCanBeGuessed:](*(void *)(a1 + 80), v10, 1);
        }
        double v116 = v112;
        double v117 = v113;
        double v118 = v114;
        double v119 = v115;
        v177.origin.x = v81;
        v177.origin.y = v146;
        v177.size.width = v19;
        v177.size.height = v145;
        if (!CGRectIsEmpty(v177)
          || (v178.origin.x = v116,
              v178.origin.y = v117,
              v178.size.width = v118,
              v178.size.height = v119,
              !CGRectIsEmpty(v178)))
        {
          v179.origin.x = v81;
          v179.origin.y = v146;
          v179.size.width = v19;
          v179.size.height = v145;
          v185.origin.x = v116;
          v185.origin.y = v117;
          v185.size.width = v118;
          v185.size.height = v119;
          CGRect v180 = CGRectUnion(v179, v185);
          if (CGRectIntersectsRect(v180, *(CGRect *)(a1 + 192)))
          {
            if (([v105 _delegateWantsFooterForSection:v10] & 1) != 0
              || (unint64_t v120 = [v105 style], v120 <= 0x10) && ((1 << v120) & 0x10006) != 0)
            {
              double v121 = objc_msgSend(v105, "_sectionFooterViewWithFrame:forSection:floating:reuseViewIfPossible:willDisplay:", v10, v154, 0, 1, v134, v133, v132, v131);
              objc_msgSend(v105, "_addContentSubview:atBack:", v121, objc_msgSend(v105, "allowsFooterViewsToFloat") ^ 1);
              if (*(void *)(*(void *)(a1 + 280) + 8 * v10))
              {
                uint64_t v127 = [MEMORY[0x1E4F28B00] currentHandler];
                [v127 handleFailureInMethod:sel__setupInsertAnimationForFooterInSection_withTargetRect_forUpdateItem_ object:a1 file:@"UITableViewSupport.m" lineNumber:1324 description:@"Attempt to create two animations for footer view"];
              }
              double v122 = v121;
              if (!v121)
              {
                double v122 = [MEMORY[0x1E4F1CA98] null];
              }
              objc_storeStrong((id *)(*(void *)(a1 + 280) + 8 * v10), v122);
              if (!v121) {

              }
              if (!v7 || (unint64_t v123 = v104[4], v123 <= 6) && ((1 << v123) & 0x47) != 0) {
                [v121 setAlpha:0.0];
              }
              objc_msgSend(v121, "setFrame:", v81, v146, v19, v145);
              v181.origin.x = v116;
              v181.origin.y = v117;
              v181.size.width = v118;
              v181.size.height = v119;
              char v124 = !CGRectIntersectsRect(v181, *(CGRect *)(a1 + 160));
              double v125 = -[UIViewAnimation initWithView:indexPath:viewType:endRect:endAlpha:startFraction:endFraction:curve:animateFromCurrentPosition:shouldDeleteAfterAnimation:editing:]((id *)[UIViewAnimation alloc], v121, 0, 3, 0, 0, v124, 0, v116, v117, v118, v119, 1.0, 0.0, 1.0);
              [*(id *)(a1 + 320) addObject:v125];
            }
          }
        }
      }
      uint64_t v138 = [obj countByEnumeratingWithState:&v150 objects:v155 count:16];
      if (!v138)
      {
LABEL_113:

        return;
      }
    }
  }
}

- (void)_setupAnimationsForExistingOffscreenCells
{
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    uint64_t v3 = WeakRetained;
    unint64_t v4 = *(void *)(a1 + 88);
    uint64_t v5 = *(void *)(a1 + 96);
    *(void *)(a1 + 24) = v4;
    if (v4 < v5 + v4)
    {
      double v47 = WeakRetained;
      do
      {
        unint64_t v6 = *(void *)(a1 + 48);
        BOOL v8 = v4 >= v6;
        unint64_t v7 = v4 - v6;
        BOOL v8 = !v8 || v7 >= *(void *)(a1 + 56);
        if (!v8) {
          goto LABEL_28;
        }
        uint64_t v9 = -[_UITableViewUpdateSupport finalGlobalIndexForInitialGlobalIndex:](a1, v4);
        uint64_t v3 = v47;
        *(void *)(a1 + 32) = v9;
        if (v9 == 0x7FFFFFFFFFFFFFFFLL || *(void *)(*(void *)(a1 + 264) + 8 * v9)) {
          goto LABEL_28;
        }
        double v10 = -[UITableViewRowData rectForGlobalRow:heightCanBeGuessed:](*(void **)(a1 + 80), v9, 1);
        double v12 = v11;
        double v14 = v13;
        double v16 = v15;
        uint64_t v17 = *(void *)(a1 + 24);
        double v18 = v15;
        double rect = v13;
        double v19 = v11;
        double v20 = v10;
        if (v17 < *(void *)(a1 + 248))
        {
          double v20 = -[UITableViewRowData rectForGlobalRow:heightCanBeGuessed:](*(void **)(a1 + 72), v17, 1);
          double v19 = v21;
          double rect = v22;
          double v18 = v23;
        }
        v49.origin.x = v10;
        v49.origin.y = v12;
        v49.size.width = v14;
        v49.size.height = v16;
        BOOL v24 = CGRectIntersectsRect(v49, *(CGRect *)(a1 + 160));
        uint64_t v3 = v47;
        if (!v24)
        {
          v50.origin.x = v20;
          v50.origin.y = v19;
          v50.size.width = rect;
          v50.size.height = v18;
          double v25 = v18;
          double MaxY = CGRectGetMaxY(v50);
          BOOL v27 = MaxY < CGRectGetMinY(*(CGRect *)(a1 + 128));
          double v18 = v25;
          if (!v27) {
            goto LABEL_20;
          }
          v51.origin.x = v10;
          v51.origin.y = v12;
          v51.size.width = v14;
          v51.size.height = v16;
          double MinY = CGRectGetMinY(v51);
          CGFloat v29 = CGRectGetMaxY(*(CGRect *)(a1 + 160));
          uint64_t v3 = v47;
          BOOL v30 = MinY <= v29;
          double v18 = v25;
          if (v30)
          {
LABEL_20:
            v52.origin.x = v20;
            v52.origin.y = v19;
            v52.size.width = rect;
            v52.size.height = v18;
            double v31 = CGRectGetMinY(v52);
            CGFloat v32 = CGRectGetMaxY(*(CGRect *)(a1 + 128));
            uint64_t v3 = v47;
            if (v31 <= v32) {
              goto LABEL_28;
            }
            v53.origin.x = v10;
            v53.origin.y = v12;
            v53.size.width = v14;
            v53.size.height = v16;
            double v33 = CGRectGetMaxY(v53);
            CGFloat v34 = CGRectGetMinY(*(CGRect *)(a1 + 160));
            uint64_t v3 = v47;
            BOOL v27 = v33 < v34;
            double v18 = v25;
            if (!v27) {
              goto LABEL_28;
            }
          }
        }
        uint64_t v35 = [v3 _createPreparedCellForGlobalRow:*(void *)(a1 + 32) willDisplay:1];
        double v36 = (void *)v35;
        if (*(void *)(*(void *)(a1 + 264) + 8 * *(void *)(a1 + 32)))
        {
          double v43 = [MEMORY[0x1E4F28B00] currentHandler];
          uint64_t v44 = -[_UITableViewUpdateSupport _collectionViewUpdateItems](a1);
          objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", sel__setupAnimationsForExistingOffscreenCells, a1, @"UITableViewSupport.m", 2035, @"Cannot animate existing offscreen cell because it already has an animation. Updates: %@; Cell: %@",
            v44,
            *(void *)(*(void *)(a1 + 264) + 8 * *(void *)(a1 + 32)));

          if (!v36)
          {
LABEL_31:
            double v45 = [MEMORY[0x1E4F28B00] currentHandler];
            [v45 handleFailureInMethod:sel__setupAnimationsForExistingOffscreenCells object:a1 file:@"UITableViewSupport.m" lineNumber:2036 description:@"Missing offscreen cell to setup animations"];
          }
        }
        else if (!v35)
        {
          goto LABEL_31;
        }
        objc_storeStrong((id *)(*(void *)(a1 + 264) + 8 * *(void *)(a1 + 32)), v36);
        if (*(void *)(a1 + 288) != *(void *)(a1 + 32))
        {
          objc_msgSend(v36, "setFrame:", v20, v19, rect, v18);
          v54.origin.x = v10;
          v54.origin.y = v12;
          v54.size.width = v14;
          v54.size.height = v16;
          BOOL v37 = CGRectIntersectsRect(v54, *(CGRect *)(a1 + 160));
          int64_t v38 = -[UITableViewRowData indexPathForRowAtGlobalRow:](*(void **)(a1 + 80), *(void *)(a1 + 32));
          uint64_t v39 = [v47 _wasEditingRowAtIndexPath:v38];
          int v40 = [v47 _isEditingRowAtIndexPath:v38];
          char v41 = v40;
          if (v39 != v40) {
            [v47 _setupCell:v36 forEditing:v39 atIndexPath:v38 animated:0 updateSeparators:1];
          }
          uint64_t v42 = -[UIViewAnimation initWithView:indexPath:viewType:endRect:endAlpha:startFraction:endFraction:curve:animateFromCurrentPosition:shouldDeleteAfterAnimation:editing:]((id *)[UIViewAnimation alloc], v36, v38, 1, 0, 0, !v37, v41, v10, v12, v14, v16, 1.0, 0.0, 1.0);
          [*(id *)(a1 + 320) addObject:v42];
          objc_msgSend(v47, "_addContentSubview:atBack:", v36, objc_msgSend(*(id *)(a1 + 120), "containsIndex:", *(void *)(a1 + 32)) ^ 1);
        }
        uint64_t v3 = v47;
LABEL_28:
        unint64_t v4 = *(void *)(a1 + 24) + 1;
        *(void *)(a1 + 24) = v4;
      }
      while (v4 < *(void *)(a1 + 96) + *(void *)(a1 + 88));
    }
  }
}

- (void)_setupAnimationsForDeletedHeadersAndFooters
{
  uint64_t v149 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    location = (id *)(a1 + 40);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained _currentScreenScale];
    double v3 = v2;
    long long v144 = 0u;
    long long v145 = 0u;
    long long v146 = 0u;
    long long v147 = 0u;
    id obj = *(id *)(a1 + 328);
    uint64_t v134 = [obj countByEnumeratingWithState:&v144 objects:v148 count:16];
    if (!v134) {
      goto LABEL_132;
    }
    uint64_t v132 = *(void *)v145;
    double v131 = v3;
    while (1)
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v145 != v132) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void **)(*((void *)&v144 + 1) + 8 * v4);
        unint64_t v6 = [v5 valueForKey:@"Section"];
        int v7 = [v6 intValue];

        uint64_t v8 = [v5 valueForKey:@"UpdateItem"];
        uint64_t v9 = [v5 valueForKey:@"NewHeaderRect"];
        double v10 = v9;
        if (v9) {
          [v9 CGRectValue];
        }
        uint64_t v137 = v10;
        uint64_t v11 = v7;
        double v12 = -[UITableViewRowData rectForHeaderInSection:heightCanBeGuessed:](*(void *)(a1 + 72), v7, 1);
        double v14 = v13;
        double v16 = v15;
        uint64_t v17 = objc_msgSend(v5, "valueForKey:", @"NewFooterRect", v12);
        double v18 = v17;
        if (v17) {
          [v17 CGRectValue];
        }
        double v136 = v18;
        -[UITableViewRowData rectForFooterInSection:heightCanBeGuessed:](*(void *)(a1 + 72), v7, 1);
        double rect2 = v19;
        double rect = v16;
        double r2 = v20;
        if (v8 && (*(unsigned char *)(v8 + 16) & 2) != 0)
        {
          uint64_t v22 = -[_UITableViewUpdateSupport finalSectionIndexForInitialSectionIndex:](a1, v7);
          int v23 = 1;
          double v24 = -[UITableViewRowData rectForHeaderInSection:heightCanBeGuessed:](*(void *)(a1 + 80), v22, 1);
          double v26 = v25;
          double v143 = -[UITableViewRowData rectForFooterInSection:heightCanBeGuessed:](*(void *)(a1 + 80), v22, 1);
          double v140 = v27;
          double MaxY = 0.0;
          CGFloat v29 = WeakRetained;
          goto LABEL_57;
        }
        if (v7 >= 1)
        {
          int64_t v21 = v7;
          while (-[_UITableViewUpdateSupport finalSectionIndexForInitialSectionIndex:](a1, --v21) == 0x7FFFFFFFFFFFFFFFLL)
          {
            if (v21 <= 0) {
              goto LABEL_21;
            }
          }
LABEL_20:
          uint64_t v30 = *(void *)(a1 + 80);
          uint64_t v31 = -[_UITableViewUpdateSupport finalSectionIndexForInitialSectionIndex:](a1, v21);
          double v32 = -[UITableViewRowData rectForFooterInSection:heightCanBeGuessed:](v30, v31, 1);
          goto LABEL_22;
        }
        int64_t v21 = v7 - 1;
        if (v7) {
          goto LABEL_20;
        }
LABEL_21:
        double v32 = -[UITableViewRowData rectForTableHeaderView](*(void *)(a1 + 80));
        int64_t v21 = -1;
LABEL_22:
        double MaxY = CGRectGetMaxY(*(CGRect *)&v32);
        int v36 = v21 + 1;
        int64_t v37 = *(void *)(a1 + 232);
        int64_t v38 = v21 + 1;
        if (v21 + 1 < v37)
        {
          int64_t v38 = v21 + 1;
          do
          {
            uint64_t v39 = -[_UITableViewUpdateSupport finalSectionIndexForInitialSectionIndex:](a1, v38);
            int64_t v37 = *(void *)(a1 + 232);
            if (v39 != 0x7FFFFFFFFFFFFFFFLL) {
              break;
            }
            ++v38;
          }
          while (v38 < v37);
        }
        CGFloat v135 = v14;
        if (v38 == v37)
        {
          v150.origin.x = -[UITableViewRowData rectForTableFooterView](*(void *)(a1 + 80));
          double MinY = CGRectGetMinY(v150);
        }
        else
        {
          uint64_t v41 = -[_UITableViewUpdateSupport finalSectionIndexForInitialSectionIndex:](a1, v38);
          v151.origin.x = -[UITableViewRowData rectForHeaderInSection:heightCanBeGuessed:](*(void *)(a1 + 80), v41, 1);
          double v42 = CGRectGetMinY(v151);
          double MinY = v42 - -[UITableViewRowData offsetForHeaderInSection:](*(void *)(a1 + 80), v41);
        }
        uint64_t v43 = *(void *)(a1 + 72);
        if (v7 < 1) {
          double v44 = -[UITableViewRowData rectForTableHeaderView](v43);
        }
        else {
          double v44 = -[UITableViewRowData rectForFooterInSection:heightCanBeGuessed:](v43, v7 - 1, 1);
        }
        double v45 = v44;
        CGFloat v29 = WeakRetained;
        double v46 = MaxY;
        double v47 = MaxY;
        if (v38 > v36)
        {
          uint64_t v48 = v36;
          double v47 = MaxY;
          double v46 = MaxY;
          do
          {
            if (v11 == v48) {
              double v47 = v46 - MaxY;
            }
            double v46 = v46 + -[UITableViewRowData heightForSection:](*(void *)(a1 + 72), v48++);
          }
          while (v38 != v48);
        }
        double v143 = v45;
        double v49 = 0.0;
        if (MaxY != v46) {
          double v49 = (MinY - MaxY) / (v46 - MaxY);
        }
        double v50 = MaxY + UIPixelBoundaryOffset(0, v47 * v49, v3);
        double v51 = v50 + v49 * (-[UITableViewRowData heightForSection:](*(void *)(a1 + 72), v11) - r2);
        double v26 = v50 + -[UITableViewRowData offsetForHeaderInSection:](*(void *)(a1 + 72), v11);
        [WeakRetained _contentInset];
        double v53 = *(double *)(a1 + 128) + v52;
        double v55 = v54 + *(double *)(a1 + 136);
        double v57 = *(double *)(a1 + 144) - (v52 + v56);
        double v59 = *(double *)(a1 + 152) - (v54 + v58);
        double v140 = v51;
        if (![WeakRetained allowsHeaderViewsToFloat]) {
          goto LABEL_45;
        }
        v152.origin.x = v53;
        v152.origin.y = v55;
        v152.size.width = v57;
        v152.size.height = v59;
        v172.size.height = r2;
        v172.origin.x = v143;
        v172.origin.y = v51;
        v172.size.width = rect2;
        if (CGRectIntersectsRect(v152, v172))
        {
          v153.origin.x = v143;
          v153.origin.y = v26;
          v153.size.width = v135;
          v153.size.height = rect;
          double v60 = CGRectGetMinY(v153);
          v154.origin.x = v53;
          v154.origin.y = v55;
          v154.size.width = v57;
          v154.size.height = v59;
          if (v60 >= CGRectGetMinY(v154))
          {
            CGFloat v61 = v59;
          }
          else
          {
            v155.origin.x = v53;
            v155.origin.y = v55;
            v155.size.width = v57;
            CGFloat v61 = v59;
            v155.size.height = v59;
            double v62 = CGRectGetMinY(v155);
            v156.origin.x = v143;
            v156.size.width = rect2;
            v156.origin.y = v140;
            v156.size.height = r2;
            double v128 = CGRectGetMinY(v156);
            v157.origin.x = v143;
            v157.origin.y = v26;
            v157.size.width = v135;
            v157.size.height = rect;
            double v63 = v128 - CGRectGetHeight(v157);
            if (v62 >= v63) {
              double v26 = v63;
            }
            else {
              double v26 = v62;
            }
          }
        }
        else
        {
LABEL_45:
          CGFloat v61 = v59;
        }
        double v3 = v131;
        if (!objc_msgSend(WeakRetained, "allowsFooterViewsToFloat", *(void *)&v128))
        {
          int v23 = 0;
          double v24 = v143;
          double v14 = v135;
          goto LABEL_57;
        }
        v158.origin.x = v53;
        v158.origin.y = v55;
        v158.size.width = v57;
        v158.size.height = v61;
        double v24 = v143;
        v173.origin.x = v143;
        v173.origin.y = v26;
        v173.size.width = v135;
        v173.size.height = rect;
        if (!CGRectIntersectsRect(v158, v173))
        {
          int v23 = 0;
          double v14 = v135;
LABEL_54:
          double v3 = v131;
          goto LABEL_57;
        }
        CGFloat v129 = v26;
        v159.origin.x = v143;
        v159.size.width = rect2;
        v159.origin.y = v140;
        v159.size.height = r2;
        double v64 = CGRectGetMaxY(v159);
        v160.origin.x = v53;
        v160.origin.y = v55;
        v160.size.width = v57;
        v160.size.height = v61;
        if (v64 > CGRectGetMaxY(v160))
        {
          v161.origin.x = v53;
          v161.origin.y = v55;
          v161.size.width = v57;
          v161.size.height = v61;
          double v65 = CGRectGetMaxY(v161);
          v162.origin.x = v143;
          v162.origin.y = v140;
          v162.size.width = rect2;
          v162.size.height = r2;
          double v66 = v65 - CGRectGetHeight(v162);
          v163.origin.x = v143;
          double v26 = v129;
          v163.origin.y = v129;
          double v14 = v135;
          v163.size.width = v135;
          v163.size.height = rect;
          double v67 = CGRectGetMaxY(v163);
          int v23 = 0;
          if (v66 >= v67) {
            double v67 = v66;
          }
          double v140 = v67;
          goto LABEL_54;
        }
        int v23 = 0;
        double v3 = v131;
        double v14 = v135;
        double v26 = v129;
LABEL_57:
        double v68 = -[UITableViewRowData heightForHeaderInSection:canGuess:](*(void *)(a1 + 72), v11, 1);
        double v69 = -[UITableViewRowData heightForFooterInSection:canGuess:](*(void *)(a1 + 72), v11, 1);
        [v29 bounds];
        if (v8)
        {
          switch(*(void *)(v8 + 32))
          {
            case 1:
              double v24 = v24 + v70;
              double v71 = v143 + v70;
              goto LABEL_63;
            case 2:
              double v24 = v24 - v70;
              double v71 = v143 - v70;
LABEL_63:
              double v143 = v71;
              break;
            case 3:
              if (v23)
              {
                v164.origin.x = v24;
                v164.origin.y = v26;
                v164.size.width = v14;
                v164.size.height = rect;
                double v26 = v26 - CGRectGetHeight(v164);
                v165.size.height = r2;
                v165.origin.x = v143;
                v165.size.width = rect2;
                v165.origin.y = v140;
                double v140 = v140 - CGRectGetHeight(v165);
              }
              else
              {
                if (v69 <= v68) {
                  double v74 = v68;
                }
                else {
                  double v74 = v69;
                }
                double v26 = MaxY - v74;
                double v140 = MaxY - v74;
              }
              break;
            case 6:
              double v72 = -[UITableViewRowData heightForSection:](*(void *)(a1 + 72), v11);
              double v73 = UIPixelBoundaryOffset(0, v72 * 0.5, v3);
              double v26 = v26 - v73;
              double v140 = v140 - v73;
              break;
            default:
              break;
          }
        }
        double v75 = (id)v8;
        id v76 = objc_loadWeakRetained(location);
        int v77 = [v76 allowsHeaderViewsToFloat];
        uint64_t v78 = *(void *)(a1 + 72);
        if (v77)
        {
          [v76 _contentInset];
          double v83 = -[UITableViewRowData floatingRectForHeaderInSection:visibleRect:heightCanBeGuessed:outIsFloating:](v78, v11, 1, 0, *(double *)(a1 + 128) + v82, v79 + *(double *)(a1 + 136), *(double *)(a1 + 144) - (v82 + v80), *(double *)(a1 + 152) - (v79 + v81));
        }
        else
        {
          double v83 = -[UITableViewRowData rectForHeaderInSection:heightCanBeGuessed:](*(void *)(a1 + 72), v11, 1);
        }
        double v87 = v83;
        double v88 = v84;
        double v89 = v85;
        double v90 = v86;
        if (!CGRectIsEmpty(*(CGRect *)&v83)
          || (v166.origin.x = v24,
              v166.origin.y = v26,
              v166.size.width = v14,
              v166.size.height = rect,
              !CGRectIsEmpty(v166)))
        {
          v167.origin.x = v87;
          v167.origin.y = v88;
          v167.size.width = v89;
          v167.size.height = v90;
          v174.origin.x = v24;
          v174.origin.y = v26;
          v174.size.width = v14;
          v174.size.height = rect;
          CGRect v168 = CGRectUnion(v167, v174);
          if (CGRectIntersectsRect(v168, *(CGRect *)(a1 + 192)))
          {
            if (-[_UITableViewUpdateSupport _isReloadSectionUpdate](a1))
            {
              double v91 = [*(id *)(a1 + 64) objectAtIndex:0];
              double v92 = v91;
              if (v91) {
                double v91 = (void *)v91[3];
              }
              uint64_t v93 = [v91 section];

              id v94 = *(id *)(*(void *)(a1 + 272) + 8 * v93);
            }
            else
            {
              id v94 = 0;
            }
            uint64_t v95 = [v76 _visibleHeaderViewForSection:v11];
            if (!v95) {
              goto LABEL_96;
            }
            double v96 = (void *)v95;
            if (v94 == (id)v95)
            {
              double v96 = -[_UITableViewUpdateSupport _imageViewForView:](v94);
            }
            objc_msgSend(v96, "setFrame:", v87, v88, v89, v90);
            if (v94)
            {
              if (v8)
              {
                if (v75[4] == 5)
                {
                  double v97 = 0.0;
                  [v96 setAlpha:0.0];
                  goto LABEL_95;
                }
                [v96 setAlpha:1.0];
LABEL_90:
                unint64_t v98 = v75[4];
                double v99 = 1.0;
                if (v98 == 6) {
                  double v99 = 0.0;
                }
                if (v98 >= 3) {
                  double v97 = v99;
                }
                else {
                  double v97 = 0.0;
                }
LABEL_95:
                double v100 = -[UIViewAnimation initWithView:indexPath:viewType:endRect:endAlpha:startFraction:endFraction:curve:animateFromCurrentPosition:shouldDeleteAfterAnimation:editing:]((id *)[UIViewAnimation alloc], v96, 0, 2, 0, 1, 1, 0, v24, v26, v14, rect, v97, 0.0, 1.0);
                [*(id *)(a1 + 320) addObject:v100];
                objc_msgSend(v76, "_addContentSubview:atBack:", v96, objc_msgSend(v76, "allowsHeaderViewsToFloat") ^ 1);

LABEL_96:
                goto LABEL_97;
              }
              [v96 setAlpha:1.0];
            }
            else
            {
              [v96 setAlpha:1.0];
              if (v8) {
                goto LABEL_90;
              }
            }
            double v97 = 0.0;
            goto LABEL_95;
          }
        }
LABEL_97:

        unint64_t v101 = v75;
        id v102 = objc_loadWeakRetained(location);
        int v103 = [v102 allowsFooterViewsToFloat];
        uint64_t v104 = *(void *)(a1 + 72);
        if (v103)
        {
          [v102 _contentInset];
          double v109 = -[UITableViewRowData floatingRectForFooterInSection:visibleRect:heightCanBeGuessed:outIsFloating:](v104, v11, 1, 0, *(double *)(a1 + 128) + v108, v105 + *(double *)(a1 + 136), *(double *)(a1 + 144) - (v108 + v106), *(double *)(a1 + 152) - (v105 + v107));
        }
        else
        {
          double v109 = -[UITableViewRowData rectForFooterInSection:heightCanBeGuessed:](*(void *)(a1 + 72), v11, 1);
        }
        double v113 = v109;
        double v114 = v110;
        double v115 = v111;
        double v116 = v112;
        if (!CGRectIsEmpty(*(CGRect *)&v109)
          || (v169.origin.x = v143,
              v169.origin.y = v140,
              v169.size.width = rect2,
              v169.size.height = r2,
              !CGRectIsEmpty(v169)))
        {
          v170.origin.x = v113;
          v170.origin.y = v114;
          v170.size.width = v115;
          v170.size.height = v116;
          v175.origin.x = v143;
          v175.origin.y = v140;
          v175.size.width = rect2;
          v175.size.height = r2;
          CGRect v171 = CGRectUnion(v170, v175);
          if (CGRectIntersectsRect(v171, *(CGRect *)(a1 + 192)))
          {
            if (-[_UITableViewUpdateSupport _isReloadSectionUpdate](a1))
            {
              double v117 = [*(id *)(a1 + 64) objectAtIndex:0];
              double v118 = v117;
              if (v117) {
                double v117 = (void *)v117[3];
              }
              uint64_t v119 = [v117 section];

              id v120 = *(id *)(*(void *)(a1 + 280) + 8 * v119);
            }
            else
            {
              id v120 = 0;
            }
            uint64_t v121 = [v102 _visibleFooterViewForSection:v11];
            if (!v121) {
              goto LABEL_124;
            }
            double v122 = (void *)v121;
            if (v120 == (id)v121)
            {
              double v122 = -[_UITableViewUpdateSupport _imageViewForView:](v120);
            }
            objc_msgSend(v122, "setFrame:", v113, v114, v115, v116);
            if (v120)
            {
              if (v8)
              {
                if (v101[4] == 5)
                {
                  double v123 = 0.0;
                  [v122 setAlpha:0.0];
                  goto LABEL_123;
                }
                [v122 setAlpha:1.0];
LABEL_118:
                unint64_t v124 = v101[4];
                double v125 = 1.0;
                if (v124 == 6) {
                  double v125 = 0.0;
                }
                if (v124 >= 3) {
                  double v123 = v125;
                }
                else {
                  double v123 = 0.0;
                }
LABEL_123:
                v126 = -[UIViewAnimation initWithView:indexPath:viewType:endRect:endAlpha:startFraction:endFraction:curve:animateFromCurrentPosition:shouldDeleteAfterAnimation:editing:]((id *)[UIViewAnimation alloc], v122, 0, 3, 0, 1, 1, 0, v143, v140, rect2, r2, v123, 0.0, 1.0);
                [*(id *)(a1 + 320) addObject:v126];
                objc_msgSend(v102, "_addContentSubview:atBack:", v122, objc_msgSend(v102, "allowsFooterViewsToFloat") ^ 1);

LABEL_124:
                goto LABEL_125;
              }
              [v122 setAlpha:1.0];
            }
            else
            {
              [v122 setAlpha:1.0];
              if (v8) {
                goto LABEL_118;
              }
            }
            double v123 = 0.0;
            goto LABEL_123;
          }
        }
LABEL_125:

        ++v4;
      }
      while (v4 != v134);
      uint64_t v127 = [obj countByEnumeratingWithState:&v144 objects:v148 count:16];
      uint64_t v134 = v127;
      if (!v127)
      {
LABEL_132:

        return;
      }
    }
  }
}

- (int64_t)_setupAnimationStructures
{
  if (result)
  {
    v1 = (void *)result;
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    double v3 = (void *)v1[40];
    v1[40] = v2;

    int64_t v4 = v1[32];
    if (v4 < 1) {
      uint64_t v5 = 0;
    }
    else {
      uint64_t v5 = malloc_type_calloc(v4, 8uLL, 0x80040B8603338uLL);
    }
    v1[33] = v5;
    result = v1[30];
    if (result < 1)
    {
      unint64_t v6 = 0;
      v1[34] = 0;
    }
    else
    {
      v1[34] = malloc_type_calloc(result, 8uLL, 0x80040B8603338uLL);
      unint64_t v6 = malloc_type_calloc(v1[30], 8uLL, 0x80040B8603338uLL);
      result = v1[30];
    }
    v1[35] = v6;
    v1[4] = v1[32];
    v1[2] = result;
  }
  return result;
}

- (void)_setupAnimationForTableHeader
{
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    double v2 = -[UITableViewRowData rectForTableHeaderView](*(void *)(a1 + 72));
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    double v9 = -[UITableViewRowData rectForTableHeaderView](*(void *)(a1 + 80));
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    v22.origin.x = v2;
    v22.origin.y = v4;
    v22.size.width = v6;
    v22.size.height = v8;
    if (!CGRectIsEmpty(v22)
      || (v23.origin.x = v9, v23.origin.y = v11, v23.size.width = v13, v23.size.height = v15, !CGRectIsEmpty(v23)))
    {
      v24.origin.x = v2;
      v24.origin.y = v4;
      v24.size.width = v6;
      v24.size.height = v8;
      v27.origin.x = v9;
      v27.origin.y = v11;
      v27.size.width = v13;
      v27.size.height = v15;
      CGRect v25 = CGRectUnion(v24, v27);
      if (CGRectIntersectsRect(v25, *(CGRect *)(a1 + 192)))
      {
        if ([WeakRetained _shouldUseNewHeaderFooterBehavior]) {
          [WeakRetained _tableHeaderView:1];
        }
        else {
        double v16 = [WeakRetained tableHeaderView];
        }
        uint64_t v17 = v16;
        if (v16)
        {
          objc_msgSend(v16, "setFrame:", v2, v4, v6, v8);
          if ([WeakRetained _shouldUseNewHeaderFooterBehavior])
          {
            v26.origin.x = v9;
            v26.origin.y = v11;
            v26.size.width = v13;
            v26.size.height = v15;
            char v18 = !CGRectIntersectsRect(v26, *(CGRect *)(a1 + 160));
          }
          else
          {
            char v18 = 0;
          }
          double v19 = -[UIViewAnimation initWithView:indexPath:viewType:endRect:endAlpha:startFraction:endFraction:curve:animateFromCurrentPosition:shouldDeleteAfterAnimation:editing:]((id *)[UIViewAnimation alloc], v17, 0, 4, 0, 1, v18, [WeakRetained _isEditingWithNoSwipedCell], v9, v11, v13, v15, 1.0, 0.0, 1.0);
          [*(id *)(a1 + 320) addObject:v19];
        }
      }
    }
  }
}

- (void)_setupAnimationsForNewlyInsertedCells
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v1 = a1;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained _currentScreenScale];
    uint64_t v3 = v2;
    id v4 = objc_alloc_init(MEMORY[0x1E4F28E60]);
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v5 = *(id *)(v1 + 64);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (!v6) {
      goto LABEL_28;
    }
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v35;
    uint64_t v26 = v1;
    while (1)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v35 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v34 + 1) + 8 * v9);
        if (v10)
        {
          if ((*(unsigned char *)(v10 + 16) & 2) != 0 || *(_DWORD *)(v10 + 20)) {
            goto LABEL_21;
          }
          double v11 = *(void **)(v10 + 24);
        }
        else
        {
          double v11 = 0;
        }
        id v12 = v11;
        uint64_t v13 = [v12 row];
        [v4 removeAllIndexes];
        BOOL v14 = v13 == 0x7FFFFFFFFFFFFFFFLL;
        if (v13 == 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v15 = [v12 section];
          uint64_t v16 = -[UITableViewRowData numberOfRowsInSection:](*(void *)(v1 + 80), v15);
          uint64_t v17 = v1;
          uint64_t v18 = v16;
          uint64_t v19 = -[UITableViewRowData numberOfRowsBeforeSection:](*(void *)(v17 + 80), v15);
          if (v18 >= 1)
          {
            uint64_t v20 = v19;
            uint64_t v21 = v19 + v18;
            do
              [v4 addIndex:v20++];
            while (v20 < v21);
          }
        }
        else
        {
          if (v10) {
            CGRect v22 = *(void **)(v10 + 24);
          }
          else {
            CGRect v22 = 0;
          }
          uint64_t v23 = -[UITableViewRowData globalRowForRowAtIndexPath:](*(void *)(v1 + 80), v22);
          if (v23 == 0x7FFFFFFFFFFFFFFFLL)
          {

            goto LABEL_28;
          }
          [v4 addIndex:v23];
        }
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __75___UITableViewUpdateSupport_Private___setupAnimationsForNewlyInsertedCells__block_invoke;
        v28[3] = &unk_1E5309240;
        uint64_t v1 = v26;
        v28[4] = v26;
        v28[5] = v10;
        uint64_t v31 = sel__setupAnimationsForNewlyInsertedCells;
        id v29 = v12;
        BOOL v33 = v14;
        uint64_t v32 = v3;
        id v30 = WeakRetained;
        id v24 = v12;
        [v4 enumerateIndexesUsingBlock:v28];

LABEL_21:
        ++v9;
      }
      while (v9 != v7);
      uint64_t v25 = [v5 countByEnumeratingWithState:&v34 objects:v38 count:16];
      uint64_t v7 = v25;
      if (!v25)
      {
LABEL_28:

        return;
      }
    }
  }
}

- (uint64_t)initialSectionIndexForFinalSectionIndex:(uint64_t)result
{
  if (result)
  {
    unint64_t v3 = *(unsigned int *)(result + 348);
    uint64_t v4 = *(void *)(result + 368);
    if (!v4)
    {
      id v5 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v6 = objc_msgSend(NSString, "stringWithUTF8String:", "NSInteger _UIUpdateMapOldSectionForNewSection(const _UIDataSourceUpdateMaps, const NSInteger)");
      [v5 handleFailureInFunction:v6, @"_UIDataSourceBatchUpdateMap.h", 157, @"Invalid parameter not satisfying: %@", @"updateMaps.newSectionMap != NULL" file lineNumber description];
    }
    if (a2 > 0x7FFFFFFFFFFFFFFELL) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
    if (v3 <= a2) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
    result = *(unsigned int *)(v4 + 4 * a2);
    if (result == -1) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return result;
}

- (void)dealloc
{
  _UIDataSourceDestroyUpdateMaps((uint64_t)&self->_updateMaps);
  animatedCells = self->animatedCells;
  if (animatedCells)
  {
    if (self->newGlobalRowCount >= 1)
    {
      int64_t v4 = 0;
      do
      {
        id v5 = self->animatedCells;
        id v6 = v5[v4];
        v5[v4] = 0;

        ++v4;
      }
      while (v4 < self->newGlobalRowCount);
      animatedCells = self->animatedCells;
    }
    free(animatedCells);
  }
  animatedHeaders = self->animatedHeaders;
  if (animatedHeaders)
  {
    if (self->newSectionCount >= 1)
    {
      int64_t v8 = 0;
      do
      {
        uint64_t v9 = self->animatedHeaders;
        id v10 = v9[v8];
        v9[v8] = 0;

        ++v8;
      }
      while (v8 < self->newSectionCount);
      animatedHeaders = self->animatedHeaders;
    }
    free(animatedHeaders);
  }
  animatedFooters = self->animatedFooters;
  if (animatedFooters)
  {
    if (self->newSectionCount >= 1)
    {
      int64_t v12 = 0;
      do
      {
        uint64_t v13 = self->animatedFooters;
        id v14 = v13[v12];
        v13[v12] = 0;

        ++v12;
      }
      while (v12 < self->newSectionCount);
      animatedFooters = self->animatedFooters;
    }
    free(animatedFooters);
  }
  v15.receiver = self;
  v15.super_class = (Class)_UITableViewUpdateSupport;
  [(_UITableViewUpdateSupport *)&v15 dealloc];
}

- (void)_setupAnimationsForDeletedCells
{
  uint64_t v242 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v1 = a1;
    location = (id *)(a1 + 40);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    unint64_t v3 = [WeakRetained _swipeActionController];
    int64_t v4 = [v3 currentSwipeOccurrence];

    v214 = v4;
    BOOL v220 = _tableViewIsAnimatingSwipeToDelete(v4, *(void **)(v1 + 64));
    size_t count = *(void *)(v1 + 96) + *(void *)(v1 + 88);
    uint64_t v225 = v1;
    if (count && [*(id *)(v1 + 64) count])
    {
      id v218 = WeakRetained;
      id v5 = malloc_type_calloc(count, 8uLL, 0x80040B8603338uLL);
      long long v226 = 0u;
      long long v227 = 0u;
      long long v228 = 0u;
      long long v229 = 0u;
      id v6 = *(id *)(v1 + 64);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v226 objects:buf count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v227;
        do
        {
          uint64_t v10 = 0;
          do
          {
            if (*(void *)v227 != v9) {
              objc_enumerationMutation(v6);
            }
            uint64_t v11 = *(void *)(*((void *)&v226 + 1) + 8 * v10);
            if (v11 && (*(unsigned char *)(v11 + 16) & 2) == 0 && *(_DWORD *)(v11 + 20) == 1)
            {
              id v12 = *(id *)(v11 + 24);
              if ([v12 row] == 0x7FFFFFFFFFFFFFFFLL)
              {
                uint64_t v13 = [v12 section];
                uint64_t v14 = -[UITableViewRowData numberOfRowsBeforeSection:](*(void *)(v225 + 72), v13);
                uint64_t v15 = -[UITableViewRowData numberOfRowsInSection:](*(void *)(v225 + 72), v13);
                size_t v16 = v15 + v14;
                if (v14 < 0 || v16 > count)
                {
                  v215 = [MEMORY[0x1E4F28B00] currentHandler];
                  v212 = NSStringFromRange(*(NSRange *)(v225 + 88));
                  [v215 handleFailureInMethod:sel__buildDeleteUpdateItemsByOldGlobalRowLookupTable, v225, @"UITableViewSupport.m", 1388, @"Old global rows out of bounds: numRowsBeforeSection=%ld, numRowsInSection=%ld, oldRowRange=%@", v14, v15, v212 object file lineNumber description];
                }
                if (v15 >= 1)
                {
                  do
                    v5[v14++] = v11;
                  while (v14 < (uint64_t)v16);
                }
              }
              else
              {
                unint64_t v17 = -[UITableViewRowData globalRowForRowAtIndexPath:](*(void *)(v225 + 72), v12);
                unint64_t v18 = v17;
                if ((v17 & 0x8000000000000000) != 0 || v17 >= count)
                {
                  v216 = [MEMORY[0x1E4F28B00] currentHandler];
                  uint64_t v19 = NSStringFromRange(*(NSRange *)(v225 + 88));
                  [v216 handleFailureInMethod:sel__buildDeleteUpdateItemsByOldGlobalRowLookupTable, v225, @"UITableViewSupport.m", 1396, @"Old global row out of bounds: deletedGlobalRow=%ld, oldRowRange=%@", v18, v19 object file lineNumber description];
                }
                v5[v18] = v11;
              }
            }
            ++v10;
          }
          while (v10 != v8);
          uint64_t v20 = [v6 countByEnumeratingWithState:&v226 objects:buf count:16];
          uint64_t v8 = v20;
        }
        while (v20);
      }

      id WeakRetained = v218;
      uint64_t v1 = v225;
    }
    else
    {
      id v5 = 0;
    }
    [WeakRetained _currentScreenScale];
    double v213 = v21;
    unint64_t v22 = *(void *)(v1 + 88);
    uint64_t v23 = *(void *)(v1 + 96);
    *(void *)(v1 + 24) = v22;
    if (v22 < v23 + v22)
    {
      do
      {
        uint64_t v24 = -[_UITableViewUpdateSupport finalGlobalIndexForInitialGlobalIndex:](v1, v22);
        uint64_t v25 = *(void *)(v1 + 24);
        if (v24 != 0x7FFFFFFFFFFFFFFFLL || *(void *)(v1 + 288) == v25) {
          goto LABEL_222;
        }
        double v26 = -[UITableViewRowData rectForGlobalRow:heightCanBeGuessed:](*(void **)(v1 + 72), v25, 1);
        double v28 = v27;
        double v30 = v29;
        if (v5) {
          uint64_t v31 = (void *)v5[*(void *)(v1 + 24)];
        }
        else {
          uint64_t v31 = 0;
        }
        uint64_t v32 = v31;
        if (os_variant_has_internal_diagnostics())
        {
          if (v32)
          {
LABEL_37:
            int v33 = 0;
            int v219 = v32[2] & 1;
            goto LABEL_38;
          }
          double v192 = __UIFaultDebugAssertLog();
          if (os_log_type_enabled(v192, OS_LOG_TYPE_FAULT))
          {
            uint64_t v204 = *(void *)(v225 + 24);
            uint64_t v205 = *(void *)(v225 + 64);
            uint64_t v206 = *(void *)(v225 + 72);
            size_t countb = *(void *)(v225 + 80);
            -[_UITableViewUpdateSupport _oldMapArray](v225);
            id v207 = (id)objc_claimAutoreleasedReturnValue();
            id v208 = objc_loadWeakRetained(location);
            *(_DWORD *)buf = 134219266;
            uint64_t v231 = v204;
            __int16 v232 = 2112;
            uint64_t v233 = v205;
            __int16 v234 = 2112;
            uint64_t v235 = v206;
            __int16 v236 = 2112;
            size_t v237 = countb;
            __int16 v238 = 2112;
            id v239 = v207;
            __int16 v240 = 2112;
            id v241 = v208;
            _os_log_fault_impl(&dword_1853B0000, v192, OS_LOG_TYPE_FAULT, "UITableView internal inconsistency: missing delete update item for old global row (%ld) that does not exist after updates updateItems=%@; oldRowData=%@; newRowData=%@; oldGlobalRowMap: %@; tableView=%@",
              buf,
              0x3Eu);
          }
          int v219 = 0;
          int v33 = 1;
          uint64_t v1 = v225;
        }
        else
        {
          if (v32) {
            goto LABEL_37;
          }
          double v193 = *(id *)(__UILogGetCategoryCachedImpl("Assert", &_setupAnimationsForDeletedCells___s_category)+ 8);
          if (os_log_type_enabled(v193, OS_LOG_TYPE_ERROR))
          {
            uint64_t v194 = *(void *)(v225 + 24);
            uint64_t v195 = *(void *)(v225 + 64);
            id v196 = WeakRetained;
            uint64_t v197 = *(void *)(v225 + 72);
            size_t countc = *(void *)(v225 + 80);
            -[_UITableViewUpdateSupport _oldMapArray](v225);
            id v198 = (id)objc_claimAutoreleasedReturnValue();
            id v199 = objc_loadWeakRetained(location);
            *(_DWORD *)buf = 134219266;
            uint64_t v231 = v194;
            uint64_t v1 = v225;
            __int16 v232 = 2112;
            uint64_t v233 = v195;
            __int16 v234 = 2112;
            uint64_t v235 = v197;
            id WeakRetained = v196;
            __int16 v236 = 2112;
            size_t v237 = countc;
            __int16 v238 = 2112;
            id v239 = v198;
            __int16 v240 = 2112;
            id v241 = v199;
            _os_log_impl(&dword_1853B0000, v193, OS_LOG_TYPE_ERROR, "UITableView internal inconsistency: missing delete update item for old global row (%ld) that does not exist after updates updateItems=%@; oldRowData=%@; newRowData=%@; oldGlobalRowMap: %@; tableView=%@",
              buf,
              0x3Eu);
          }
          int v219 = 0;
          int v33 = 1;
        }
LABEL_38:
        int counta = v33;
        long long v34 = -[UITableViewRowData indexPathForRowAtGlobalRow:](*(void **)(v1 + 72), *(void *)(v1 + 24));
        uint64_t v35 = *(void *)(v1 + 24);
        do
        {
          uint64_t v36 = v35;
          BOOL v37 = v35-- < 1;
        }
        while (!v37
             && -[_UITableViewUpdateSupport finalGlobalIndexForInitialGlobalIndex:](v1, v35) == 0x7FFFFFFFFFFFFFFFLL);
        int64_t v38 = v36;
        if (v36 < *(void *)(v1 + 248))
        {
          int64_t v38 = v36;
          do
          {
            if (-[_UITableViewUpdateSupport finalGlobalIndexForInitialGlobalIndex:](v1, v38) != 0x7FFFFFFFFFFFFFFFLL) {
              break;
            }
            ++v38;
          }
          while (v38 < *(void *)(v1 + 248));
        }
        if (v36 < 0)
        {
          double v44 = [MEMORY[0x1E4F28B00] currentHandler];
          double v45 = v44;
          if (counta)
          {
            double v47 = 0;
          }
          else
          {
            uint64_t v46 = *((int *)v32 + 5);
            double v47 = @"unknown";
            if (v46 <= 3) {
              double v47 = off_1E53092D8[v46];
            }
          }
          [v44 handleFailureInMethod:sel__setupAnimationsForDeletedCells, v1, @"UITableViewSupport.m", 1446, @"Invalid prior old global row when computing beginning of old gap for %@ of row at index path %@", v47, v34 object file lineNumber description];
        }
        else
        {
          if (v36 < *(void *)(v1 + 248))
          {
            double v39 = -[UITableViewRowData rectForGlobalRow:heightCanBeGuessed:](*(void **)(v1 + 72), v36, 1);
LABEL_48:
            double MinY = CGRectGetMinY(*(CGRect *)&v39);
            goto LABEL_58;
          }
          if (v34)
          {
            if (!v219)
            {
              uint64_t v69 = *(void *)(v1 + 72);
              uint64_t v70 = -[_UITableViewUpdateSupport initialSectionIndexForFinalSectionIndex:](v1, [v34 section]);
              v245.origin.CGFloat x = -[UITableViewRowData rectForFooterInSection:heightCanBeGuessed:](v69, v70, 1);
              double MinY = CGRectGetMinY(v245);
              uint64_t v50 = v38 - 1;
              if (v38 < 1) {
                goto LABEL_72;
              }
              goto LABEL_59;
            }
            uint64_t v48 = [v34 section] + 1;
            uint64_t v49 = *(void *)(v1 + 72);
            if (v48 >= *(void *)(v1 + 232)) {
              double v39 = -[UITableViewRowData rectForTableFooterView](v49);
            }
            else {
              double v39 = -[UITableViewRowData rectForHeaderInSection:heightCanBeGuessed:](v49, v48, 1);
            }
            goto LABEL_48;
          }
        }
        double MinY = 0.0;
LABEL_58:
        uint64_t v50 = v38 - 1;
        if (v38 <= 0)
        {
          if (v219)
          {
            uint64_t v217 = v38 - 1;
            uint64_t v56 = [v34 section];
            if (v56 < 1) {
              double v57 = -[UITableViewRowData rectForTableHeaderView](*(void *)(v1 + 72));
            }
            else {
              double v57 = -[UITableViewRowData rectForFooterInSection:heightCanBeGuessed:](*(void *)(v1 + 72), v56 - 1, 1);
            }
            double MaxY = CGRectGetMaxY(*(CGRect *)&v57);
          }
          else
          {
            if (!v34)
            {
              uint64_t v217 = v38 - 1;
LABEL_64:
              double v55 = 0.0;
              goto LABEL_76;
            }
LABEL_72:
            uint64_t v217 = v50;
            uint64_t v71 = -[_UITableViewUpdateSupport initialSectionIndexForFinalSectionIndex:](v1, [v34 section]);
            double MaxY = -[_UITableViewUpdateSupport _startOfRowAfterHeaderInSection:withRowData:](v1, v71, *(void **)(v1 + 72));
          }
          double v55 = MaxY;
          goto LABEL_76;
        }
LABEL_59:
        uint64_t v217 = v50;
        if (v38 > *(void *)(v1 + 248))
        {
          double v51 = [MEMORY[0x1E4F28B00] currentHandler];
          double v52 = v51;
          if (counta)
          {
            double v54 = 0;
          }
          else
          {
            uint64_t v53 = *((int *)v32 + 5);
            double v54 = @"unknown";
            if (v53 <= 3) {
              double v54 = off_1E53092D8[v53];
            }
          }
          [v51 handleFailureInMethod:sel__setupAnimationsForDeletedCells, v1, @"UITableViewSupport.m", 1502, @"Invalid subsequent old global row when computing end of old gap for %@ of row at index path %@", v54, v34 object file lineNumber description];

          goto LABEL_64;
        }
        v243.origin.CGFloat x = -[UITableViewRowData rectForGlobalRow:heightCanBeGuessed:](*(void **)(v1 + 72), v50, 1);
        CGFloat x = v243.origin.x;
        CGFloat y = v243.origin.y;
        CGFloat width = v243.size.width;
        double v64 = v26;
        double v65 = v30;
        double v66 = v28;
        CGFloat height = v243.size.height;
        CGFloat v68 = CGRectGetMinY(v243);
        v244.origin.CGFloat x = x;
        v244.origin.CGFloat y = y;
        v244.size.CGFloat width = width;
        double v55 = v68;
        v244.size.CGFloat height = height;
        double v28 = v66;
        double v30 = v65;
        double v26 = v64;
        CGRectGetMaxY(v244);
LABEL_76:
        if (v55 < MinY)
        {
          uint64_t v73 = 0;
          double v74 = v55;
          double v75 = MinY;
          char v76 = counta;
          goto LABEL_155;
        }
        if (v36 < 1)
        {
          BOOL v78 = 0;
          uint64_t v79 = -1;
          if (v38 < 0) {
            goto LABEL_81;
          }
        }
        else if (v36 <= *(void *)(v1 + 248))
        {
          double v80 = v34;
          uint64_t v81 = -[_UITableViewUpdateSupport finalGlobalIndexForInitialGlobalIndex:](v1, v35);
          uint64_t v79 = 0x7FFFFFFFFFFFFFFFLL;
          if (v81 == 0x7FFFFFFFFFFFFFFFLL)
          {
            BOOL v78 = 0;
          }
          else
          {
            uint64_t v100 = v81;
            unint64_t v101 = -[UITableViewRowData indexPathForRowAtGlobalRow:](*(void **)(v1 + 72), v35);
            uint64_t v102 = [v101 section];
            BOOL v78 = v102 == [v80 section];

            uint64_t v79 = v100;
          }
          long long v34 = v80;
          if (v38 < 0)
          {
LABEL_81:
            uint64_t v73 = -1;
            goto LABEL_88;
          }
        }
        else
        {
          uint64_t v77 = v1;
          BOOL v78 = 0;
          uint64_t v79 = *(void *)(v77 + 256);
          if (v38 < 0) {
            goto LABEL_81;
          }
        }
        if (v38 >= *(void *)(v225 + 248)) {
          uint64_t v73 = *(void *)(v225 + 256);
        }
        else {
          uint64_t v73 = -[_UITableViewUpdateSupport finalGlobalIndexForInitialGlobalIndex:](v225, v38);
        }
LABEL_88:
        char v76 = counta;
        if (v79 < -1)
        {
          double v85 = [MEMORY[0x1E4F28B00] currentHandler];
          double v86 = v85;
          if (counta)
          {
            double v88 = 0;
            uint64_t v1 = v225;
          }
          else
          {
            uint64_t v87 = *((int *)v32 + 5);
            double v88 = @"unknown";
            uint64_t v1 = v225;
            if (v87 <= 3) {
              double v88 = off_1E53092D8[v87];
            }
          }
          [v85 handleFailureInMethod:sel__setupAnimationsForDeletedCells, v1, @"UITableViewSupport.m", 1571, @"Invalid prior new global row when computing beginning of new gap for %@ of row at index path %@", v88, v34 object file lineNumber description];

          double v75 = MinY;
        }
        else
        {
          uint64_t v82 = v79 + 1;
          if (v79 + 1 >= *(void *)(v225 + 256))
          {
            if (!v219)
            {
              uint64_t v1 = v225;
              uint64_t v112 = *(void *)(v225 + 80);
              uint64_t v113 = -[_UITableViewUpdateSupport finalSectionIndexForInitialSectionIndex:](v225, [v34 section]);
              v246.origin.CGFloat x = -[UITableViewRowData rectForFooterInSection:heightCanBeGuessed:](v112, v113, 1);
              double v75 = CGRectGetMinY(v246);
              if (v73 < 1) {
                goto LABEL_147;
              }
              goto LABEL_134;
            }
            uint64_t v1 = v225;
            if (counta) {
              double v89 = 0;
            }
            else {
              double v89 = (void *)v32[3];
            }
            id v90 = v89;
            uint64_t v91 = [v90 section];

            uint64_t v92 = *(void *)(v225 + 240);
            int64_t v93 = v91 + 1;
            while (v93 < *(void *)(v225 + 232))
            {
              uint64_t v94 = -[_UITableViewUpdateSupport finalSectionIndexForInitialSectionIndex:](v225, v93++);
              if (v94 != 0x7FFFFFFFFFFFFFFFLL)
              {
                uint64_t v92 = v94;
                break;
              }
            }
            uint64_t v95 = *(void *)(v225 + 80);
            if (v92 >= *(void *)(v225 + 240)) {
              double v96 = -[UITableViewRowData rectForTableFooterView](v95);
            }
            else {
              double v96 = -[UITableViewRowData rectForHeaderInSection:heightCanBeGuessed:](v95, v92, 1);
            }
            double v84 = CGRectGetMinY(*(CGRect *)&v96);
            goto LABEL_122;
          }
          if (v79 >= 0 && v78)
          {
            uint64_t v1 = v225;
            double v84 = -[_UITableViewUpdateSupport _startOfRowAfterRow:withRowData:](v225, v79, *(void **)(v225 + 80));
LABEL_122:
            double v75 = v84;
            goto LABEL_133;
          }
          v209 = v34;
          id v103 = WeakRetained;
          uint64_t v104 = -[UITableViewRowData indexPathForRowAtGlobalRow:](*(void **)(v225 + 72), *(void *)(v225 + 24));
          uint64_t v105 = -[_UITableViewUpdateSupport finalSectionIndexForInitialSectionIndex:](v225, [v104 section]);

          double v106 = -[UITableViewRowData indexPathForRowAtGlobalRow:](*(void **)(v225 + 80), v79 + 1);
          uint64_t v107 = 72;
          if (v79 >= 0) {
            uint64_t v107 = 80;
          }
          double v108 = -[UITableViewRowData indexPathForRowAtGlobalRow:](*(void **)(v225 + v107), v79 & ~(v79 >> 63));
          uint64_t v109 = [v108 section];

          if (v109 < [v106 section])
          {
            uint64_t v110 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:v109 + 1];

            double v106 = (void *)v110;
          }
          id WeakRetained = v103;
          if (v106) {
            uint64_t v111 = [v106 section];
          }
          else {
            uint64_t v111 = 0x7FFFFFFFFFFFFFFFLL;
          }
          uint64_t v1 = v225;
          if (v105 >= v111) {
            uint64_t v114 = v111;
          }
          else {
            uint64_t v114 = v105;
          }
          if (v114 == 0x7FFFFFFFFFFFFFFFLL || [v106 section] < v105 && objc_msgSend(v106, "row") >= 1)
          {
            v247.origin.CGFloat x = -[UITableViewRowData rectForGlobalRow:heightCanBeGuessed:](*(void **)(v225 + 80), v82, 1);
            double v115 = CGRectGetMinY(v247);
          }
          else
          {
            double v115 = -[_UITableViewUpdateSupport _startOfRowAfterHeaderInSection:withRowData:](v225, v114, *(void **)(v225 + 80));
          }
          double v75 = v115;

          long long v34 = v209;
          char v76 = counta;
        }
LABEL_133:
        if (v73 <= 0)
        {
          if (v219)
          {
            if (v76) {
              id v120 = 0;
            }
            else {
              id v120 = (void *)v32[3];
            }
            id v121 = v120;
            int64_t v122 = [v121 section];

            while (1)
            {
              BOOL v37 = v122-- < 1;
              if (v37) {
                break;
              }
              uint64_t v123 = -[_UITableViewUpdateSupport finalSectionIndexForInitialSectionIndex:](v1, v122);
              if (v123 != 0x7FFFFFFFFFFFFFFFLL)
              {
                double v124 = -[_UITableViewUpdateSupport _startOfRowAfterFooterInSection:withRowData:](v1, v123, *(void *)(v1 + 80));
                goto LABEL_149;
              }
            }
            v249.origin.CGFloat x = -[UITableViewRowData rectForTableHeaderView](*(void *)(v1 + 80));
            double v124 = CGRectGetMaxY(v249);
            goto LABEL_149;
          }
LABEL_147:
          uint64_t v125 = -[_UITableViewUpdateSupport finalSectionIndexForInitialSectionIndex:](v1, [v34 section]);
          double v124 = -[_UITableViewUpdateSupport _startOfRowAfterHeaderInSection:withRowData:](v1, v125, *(void **)(v1 + 80));
          goto LABEL_149;
        }
LABEL_134:
        if (v73 > *(void *)(v1 + 256))
        {
          double v116 = [MEMORY[0x1E4F28B00] currentHandler];
          double v117 = v116;
          if (v76)
          {
            uint64_t v119 = 0;
          }
          else
          {
            uint64_t v118 = *((int *)v32 + 5);
            uint64_t v119 = @"unknown";
            if (v118 <= 3) {
              uint64_t v119 = off_1E53092D8[v118];
            }
          }
          [v116 handleFailureInMethod:sel__setupAnimationsForDeletedCells, v1, @"UITableViewSupport.m", 1635, @"Invalid subsequent new global row when computing end of new gap for %@ of row at index path %@", v119, v34 object file lineNumber description];

          double v74 = v55;
          goto LABEL_150;
        }
        v248.origin.CGFloat x = -[UITableViewRowData rectForGlobalRow:heightCanBeGuessed:](*(void **)(v1 + 80), v73 - 1, 1);
        double v124 = CGRectGetMinY(v248);
LABEL_149:
        double v74 = v124;
LABEL_150:
        if (v74 <= v75)
        {
          double MinY = v75;
        }
        else
        {
          v250.origin.CGFloat x = -[UITableViewRowData rectForGlobalRow:heightCanBeGuessed:](*(void **)(v1 + 72), *(void *)(v1 + 24), 1);
          double v126 = CGRectGetMinY(v250);
          double v127 = 0.0;
          if (v55 > MinY) {
            double v127 = (v126 - MinY) / (v55 - MinY);
          }
          double MinY = v75 + UIPixelBoundaryOffset(0, (v74 - v75) * v127, v213);
        }
LABEL_155:
        if (v220)
        {
          uint64_t v128 = [v214 direction];
          double v30 = 0.0;
          if (v128)
          {
            if (v128 == 1)
            {
LABEL_161:
              [WeakRetained bounds];
              double v26 = v26 + v129;
            }
          }
          else
          {
LABEL_162:
            [WeakRetained bounds];
            double v26 = v26 - v130;
          }
        }
        else if ((v76 & 1) == 0)
        {
          switch(v32[4])
          {
            case 1uLL:
              goto LABEL_161;
            case 2uLL:
              goto LABEL_162;
            case 3uLL:
              if (v75 > v74 && [v34 row]) {
                goto LABEL_165;
              }
              uint64_t v135 = *(void *)(v1 + 72);
              uint64_t v136 = [v34 row];
              uint64_t v137 = [v34 section];
              if (v135) {
                double v138 = -[UITableViewRowData heightForRow:inSection:canGuess:adjustForReorderedRow:](v135, v136, v137, 1, 1);
              }
              else {
                double v138 = 0.0;
              }
              double MinY = v75 - v138;
              break;
            case 4uLL:
              if (v75 <= v74)
              {
                if (v75 != v74)
                {
                  v251.origin.CGFloat x = -[UITableViewRowData rectForGlobalRow:heightCanBeGuessed:](*(void **)(v1 + 72), v217, 1);
                  double v143 = CGRectGetHeight(v251);
                  uint64_t v144 = *(void *)(v1 + 72);
                  uint64_t v145 = [v34 row];
                  uint64_t v146 = [v34 section];
                  if (v144) {
                    double v147 = -[UITableViewRowData heightForRow:inSection:canGuess:adjustForReorderedRow:](v144, v145, v146, 1, 1);
                  }
                  else {
                    double v147 = 0.0;
                  }
                  double MinY = v74 + v143 + v147;
                  break;
                }
                if (![v34 row] && !(objc_msgSend(v34, "section") | v73))
                {
LABEL_165:
                  double MinY = v74;
                  break;
                }
              }
              else if (![v34 row])
              {
                double MinY = v75;
                break;
              }
              uint64_t v139 = *(void *)(v1 + 72);
              uint64_t v140 = [v34 row];
              uint64_t v141 = [v34 section];
              if (v139) {
                double v142 = -[UITableViewRowData heightForRow:inSection:canGuess:adjustForReorderedRow:](v139, v140, v141, 1, 1);
              }
              else {
                double v142 = 0.0;
              }
              double MinY = v74 + v142;
              break;
            case 6uLL:
              uint64_t v131 = *(void *)(v1 + 72);
              uint64_t v132 = [v34 row];
              uint64_t v133 = [v34 section];
              if (v131) {
                double v134 = -[UITableViewRowData heightForRow:inSection:canGuess:adjustForReorderedRow:](v131, v132, v133, 1, 1);
              }
              else {
                double v134 = 0.0;
              }
              double MinY = MinY - UIPixelBoundaryOffset(0, v134 * 0.5, v213);
              break;
            default:
              break;
          }
        }
        unint64_t v148 = *(void *)(v1 + 24);
        unint64_t v149 = *(void *)(v1 + 48);
        BOOL v150 = v148 >= v149;
        unint64_t v151 = v148 - v149;
        if (!v150 || v151 >= *(void *)(v1 + 56)) {
          goto LABEL_221;
        }
        CGRect v152 = objc_msgSend(WeakRetained, "_visibleCellForGlobalRow:");
        uint64_t v153 = -[_UITableViewUpdateSupport finalGlobalIndexForInitialGlobalIndex:](v1, *(void *)(v1 + 24));
        *(void *)(v1 + 32) = v153;
        if (v153 != 0x7FFFFFFFFFFFFFFFLL)
        {
          if (*(void *)(*(void *)(v1 + 264) + 8 * v153))
          {
            v200 = [MEMORY[0x1E4F28B00] currentHandler];
            -[_UITableViewUpdateSupport _collectionViewUpdateItems](v1);
            v202 = CGFloat v201 = v34;
            objc_msgSend(v200, "handleFailureInMethod:object:file:lineNumber:description:", sel__setupAnimationsForDeletedCells, v1, @"UITableViewSupport.m", 1733, @"Cannot animate deleted cell because it already has an animation. Updates: %@; Cell: %@",
              v202,
              *(void *)(*(void *)(v1 + 264) + 8 * *(void *)(v1 + 32)));

            long long v34 = v201;
            char v76 = counta;

            if (v152) {
              goto LABEL_191;
            }
          }
          else if (v152)
          {
LABEL_191:
            objc_storeStrong((id *)(*(void *)(v1 + 264) + 8 * *(void *)(v1 + 32)), v152);
            goto LABEL_192;
          }
          double v203 = [MEMORY[0x1E4F28B00] currentHandler];
          [v203 handleFailureInMethod:sel__setupAnimationsForDeletedCells object:v1 file:@"UITableViewSupport.m" lineNumber:1734 description:@"Missing deleted cell to setup animations"];

          goto LABEL_191;
        }
LABEL_192:
        [WeakRetained sendSubviewToBack:v152];
        CGRect v154 = v34;
        if (v76)
        {
          double v156 = 0.0;
        }
        else
        {
          unint64_t v155 = v32[4];
          double v156 = 1.0;
          if (v155 <= 6) {
            double v156 = dbl_186B9D5E8[v155];
          }
        }
        if (v220) {
          double v157 = 1.0;
        }
        else {
          double v157 = v156;
        }
        CGRect v158 = [UIViewAnimation alloc];
        CGRect v159 = -[UITableViewRowData indexPathForRowAtGlobalRow:](*(void **)(v1 + 72), *(void *)(v1 + 24));
        CGRect v160 = -[UIViewAnimation initWithView:indexPath:viewType:endRect:endAlpha:startFraction:endFraction:curve:animateFromCurrentPosition:shouldDeleteAfterAnimation:editing:]((id *)&v158->super.isa, v152, v159, 1, 0, 1, 1, [v152 isEditing], v26, MinY, v28, v30, v157, 0.0, 1.0);

        int v161 = [WeakRetained _showsBackgroundShadow];
        if ((counta | v161 ^ 1))
        {
          char v162 = counta | v161;
          long long v34 = v154;
        }
        else
        {
          long long v34 = v154;
          if (v32[4] - 1 <= 1
            && (CGRect v163 = *(void **)(v1 + 24),
                v163 == (void *)((char *)-[UITableViewRowData numberOfRows](*(void *)(v1 + 72)) - 1)))
          {
            v210 = v154;
            id v164 = WeakRetained;
            CGRect v165 = v160;
            id v166 = objc_loadWeakRetained(location);
            CGRect v167 = [v166 _backgroundShadowForSlideAnimation];
            if (v167)
            {
              [v166 insertSubview:v167 atIndex:0];
              [v167 frame];
              double v169 = v168;
              double v171 = v170;
              double v173 = v172;
              double v175 = v174;
              if (v165) {
                id v176 = v165[3];
              }
              else {
                id v176 = 0;
              }
              [v176 frame];
              double MinX = CGRectGetMinX(v252);
              double v178 = 0.0;
              id v179 = 0;
              id v180 = 0;
              id v181 = 0;
              id v182 = 0;
              if (v165)
              {
                id v182 = v165[8];
                id v179 = v165[9];
                id v180 = v165[10];
                id v181 = v165[11];
              }
              double v183 = CGRectGetMinX(*(CGRect *)&v182);
              CGRect v184 = [UIViewAnimation alloc];
              if (v165)
              {
                double v185 = *((double *)v165 + 5);
                double v186 = *((double *)v165 + 6);
                double v178 = *((double *)v165 + 7);
                int v187 = *((_DWORD *)v165 + 5);
              }
              else
              {
                int v187 = 0;
                double v185 = 0.0;
                double v186 = 0.0;
              }
              double v188 = -[UIViewAnimation initWithView:indexPath:viewType:endRect:endAlpha:startFraction:endFraction:curve:animateFromCurrentPosition:shouldDeleteAfterAnimation:editing:]((id *)&v184->super.isa, v167, 0, 1, v187, 1, 1, 0, v169 - (MinX - v183), v171, v173, v175, v185, v186, v178);
              v189 = v188;
              if (v188) {
                *((unsigned char *)v188 + 11) = 0;
              }
              [*(id *)(v225 + 320) addObject:v188];
            }
            char v162 = 0;
            id WeakRetained = v164;
            uint64_t v1 = v225;
            long long v34 = v210;
          }
          else
          {
            char v162 = 0;
          }
        }
        [*(id *)(v1 + 320) addObject:v160];
        if (!v220)
        {
          if (v162) {
            unint64_t v190 = 0;
          }
          else {
            unint64_t v190 = v32[4];
          }
          [v152 _animateFloatingSeparatorForInsertion:0 withRowAnimation:v190];
        }
        if (v162) {
          unint64_t v191 = 0;
        }
        else {
          unint64_t v191 = v32[4];
        }
        [v152 _animateInnerShadowForInsertion:0 withRowAnimation:v191];

LABEL_221:
        uint64_t v25 = *(void *)(v1 + 24);
LABEL_222:
        unint64_t v22 = v25 + 1;
        *(void *)(v1 + 24) = v22;
      }
      while (v22 < *(void *)(v1 + 96) + *(void *)(v1 + 88));
    }
    if (v5) {
      free(v5);
    }
  }
}

- (uint64_t)finalGlobalIndexForInitialGlobalIndex:(uint64_t)result
{
  if (result)
  {
    unint64_t v3 = *(unsigned int *)(result + 352);
    uint64_t v4 = *(void *)(result + 376);
    if (!v4)
    {
      id v5 = [MEMORY[0x1E4F28B00] currentHandler];
      id v6 = objc_msgSend(NSString, "stringWithUTF8String:", "NSInteger _UIUpdateMapNewGlobalItemForOldGlobalItem(const _UIDataSourceUpdateMaps, const NSInteger)");
      [v5 handleFailureInFunction:v6, @"_UIDataSourceBatchUpdateMap.h", 171, @"Invalid parameter not satisfying: %@", @"updateMaps.oldGlobalItemMap != NULL" file lineNumber description];
    }
    if (a2 > 0x7FFFFFFFFFFFFFFELL) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
    if (v3 <= a2) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
    result = *(unsigned int *)(v4 + 4 * a2);
    if (result == -1) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return result;
}

- (double)_startOfRowAfterHeaderInSection:(void *)a3 withRowData:
{
  if (!a1) {
    return 0.0;
  }
  uint64_t v4 = (id *)(a1 + 40);
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained(v4);
  double v7 = -[UITableViewRowData rectForHeaderInSection:heightCanBeGuessed:]((uint64_t)v5, a2, 1);
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;

  v17.origin.CGFloat x = v7;
  v17.origin.CGFloat y = v9;
  v17.size.CGFloat width = v11;
  v17.size.CGFloat height = v13;
  double MaxY = CGRectGetMaxY(v17);
  if (MaxY > 0.0)
  {
    [WeakRetained _sectionHeaderToFirstRowPadding];
    double MaxY = MaxY + v15;
  }

  return MaxY;
}

- (double)_startOfRowAfterRow:(void *)a3 withRowData:
{
  if (!a1) {
    return 0.0;
  }
  uint64_t v4 = (id *)(a1 + 40);
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained(v4);
  double v7 = [WeakRetained _constants];
  [v7 defaultPaddingBetweenRows];
  double v9 = v8;

  double v10 = -[UITableViewRowData rectForGlobalRow:heightCanBeGuessed:](v5, a2, 1);
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;

  v19.origin.CGFloat x = v10;
  v19.origin.CGFloat y = v12;
  v19.size.CGFloat width = v14;
  v19.size.CGFloat height = v16;
  double v17 = v9 + CGRectGetMaxY(v19);

  return v17;
}

- (void)_setupAnimationForReorderingRow
{
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id obj = [WeakRetained _reorderingCell];

    unint64_t v3 = *(void **)(a1 + 72);
    if (v3) {
      unint64_t v3 = (void *)v3[23];
    }
    uint64_t v4 = v3;
    if (obj && v4)
    {
      unint64_t v5 = -[UITableViewRowData globalRowForRowAtIndexPath:](*(void *)(a1 + 72), v4);
      *(void *)(a1 + 24) = v5;
      uint64_t v6 = -[_UITableViewUpdateSupport finalGlobalIndexForInitialGlobalIndex:](a1, v5);
      *(void *)(a1 + 32) = v6;
      uint64_t v7 = *(void *)(a1 + 264);
      if (*(void *)(v7 + 8 * v6))
      {
        double v8 = [MEMORY[0x1E4F28B00] currentHandler];
        double v9 = -[_UITableViewUpdateSupport _collectionViewUpdateItems](a1);
        objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", sel__setupAnimationForReorderingRow, a1, @"UITableViewSupport.m", 771, @"Cannot animate reordering cell because it already has an animation. Updates: %@; Cell: %@",
          v9,
          *(void *)(*(void *)(a1 + 264) + 8 * *(void *)(a1 + 32)));

        uint64_t v7 = *(void *)(a1 + 264);
        uint64_t v6 = *(void *)(a1 + 32);
      }
      objc_storeStrong((id *)(v7 + 8 * v6), obj);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidUpdatesErrorMessage, 0);
  objc_storeStrong((id *)&self->insertedSections, 0);
  objc_storeStrong((id *)&self->deletedSections, 0);
  objc_storeStrong((id *)&self->viewAnimations, 0);
  objc_storeStrong((id *)&self->_ignoringDragsToken, 0);
  objc_storeStrong(&self->_context, 0);
  objc_storeStrong((id *)&self->movedRows, 0);
  objc_storeStrong((id *)&self->newRowData, 0);
  objc_storeStrong((id *)&self->oldRowData, 0);
  objc_storeStrong((id *)&self->updateItems, 0);
  objc_destroyWeak((id *)&self->tableView);
}

- (id)initWithTableView:(void *)a3 updateItems:(void *)a4 oldRowData:(void *)a5 newRowData:(void *)a6 oldRowRange:(void *)a7 newRowRange:(uint64_t)a8 context:(void *)a9
{
  uint64_t v144 = *MEMORY[0x1E4F143B8];
  id obj = a2;
  id v93 = a3;
  id v94 = a4;
  id v95 = a5;
  id v96 = a11;
  if (a1)
  {
    v99.receiver = a1;
    v99.super_class = (Class)_UITableViewUpdateSupport;
    double v17 = (id *)objc_msgSendSuper2(&v99, sel_init);
    unint64_t v98 = v17;
    if (v17)
    {
      unint64_t v18 = v17 + 5;
      objc_storeWeak(v17 + 5, obj);
      v98[6] = (id)[obj _visibleGlobalRows];
      v98[7] = v19;
      objc_storeStrong(v98 + 8, a3);
      objc_storeStrong(v98 + 9, a4);
      objc_storeStrong(v98 + 10, a5);
      v98[11] = a6;
      v98[12] = a7;
      v98[13] = a9;
      v98[14] = a10;
      id WeakRetained = objc_loadWeakRetained(v18);
      [WeakRetained visibleBounds];
      v98[16] = v21;
      v98[17] = v22;
      v98[18] = v23;
      v98[19] = v24;

      objc_storeStrong(v98 + 37, a11);
      id v25 = v98[9];
      double v26 = v25;
      if (v25) {
        double v27 = (void *)*((void *)v25 + 8);
      }
      else {
        double v27 = 0;
      }
      v98[29] = v27;
      unint64_t v28 = (unint64_t)-[UITableViewRowData numberOfRows]((uint64_t)v25);
      v98[31] = (id)v28;
      unint64_t v29 = (unint64_t)v98[29];
      if (v29 != 0x7FFFFFFFFFFFFFFFLL)
      {
        if (!HIDWORD(v29))
        {
LABEL_9:
          if (v28 != 0x7FFFFFFFFFFFFFFFLL)
          {
            if (!HIDWORD(v28))
            {
LABEL_12:
              aBlock[0] = MEMORY[0x1E4F143A8];
              aBlock[1] = 3221225472;
              aBlock[2] = __48___UITableViewUpdateSupport__generateUpdateMaps__block_invoke;
              aBlock[3] = &unk_1E52E6400;
              id v30 = v26;
              id v135 = v30;
              id v90 = _Block_copy(aBlock);
              v132[0] = MEMORY[0x1E4F143A8];
              v132[1] = 3221225472;
              v132[2] = __48___UITableViewUpdateSupport__generateUpdateMaps__block_invoke_2;
              v132[3] = &unk_1E52E6400;
              id v85 = v30;
              id v133 = v85;
              double v89 = _Block_copy(v132);
              id v31 = v98[10];
              uint64_t v32 = v31;
              if (v31) {
                int v33 = (void *)*((void *)v31 + 8);
              }
              else {
                int v33 = 0;
              }
              v98[30] = v33;
              unint64_t v34 = (unint64_t)-[UITableViewRowData numberOfRows]((uint64_t)v31);
              v98[32] = (id)v34;
              unint64_t v35 = (unint64_t)v98[30];
              if (v35 != 0x7FFFFFFFFFFFFFFFLL)
              {
                if (!HIDWORD(v35))
                {
LABEL_17:
                  if (v34 != 0x7FFFFFFFFFFFFFFFLL)
                  {
                    if (!HIDWORD(v34)) {
                      goto LABEL_20;
                    }
                    uint64_t v82 = [MEMORY[0x1E4F28B00] currentHandler];
                    double v83 = [NSString stringWithUTF8String:"_UIMapIndex _UIMapIndexFromNSInteger(const NSInteger)"];
                    objc_msgSend(v82, "handleFailureInFunction:file:lineNumber:description:", v83, @"_UIDataSourceBatchUpdateMap.h", 28, @"NSInteger index is negative or too large: %ld", v34);
                  }
                  unint64_t v34 = 0xFFFFFFFFLL;
LABEL_20:
                  v130[0] = MEMORY[0x1E4F143A8];
                  v130[1] = 3221225472;
                  v130[2] = __48___UITableViewUpdateSupport__generateUpdateMaps__block_invoke_3;
                  v130[3] = &unk_1E52E6400;
                  id v36 = v32;
                  id v131 = v36;
                  uint64_t v92 = _Block_copy(v130);
                  v128[0] = MEMORY[0x1E4F143A8];
                  v128[1] = 3221225472;
                  v128[2] = __48___UITableViewUpdateSupport__generateUpdateMaps__block_invoke_4;
                  v128[3] = &unk_1E52E6400;
                  id v86 = v36;
                  id v129 = v86;
                  uint64_t v91 = _Block_copy(v128);
                  id v37 = v98[8];
                  uint64_t v122 = 0;
                  uint64_t v123 = &v122;
                  uint64_t v124 = 0x3032000000;
                  uint64_t v125 = __Block_byref_object_copy__194;
                  double v126 = __Block_byref_object_dispose__194;
                  id v127 = 0;
                  uint64_t v118 = 0;
                  uint64_t v119 = &v118;
                  uint64_t v120 = 0x2020000000;
                  char v121 = 0;
                  v114[0] = MEMORY[0x1E4F143A8];
                  v114[1] = 3221225472;
                  v114[2] = __48___UITableViewUpdateSupport__generateUpdateMaps__block_invoke_143;
                  v114[3] = &unk_1E5309268;
                  id v38 = v37;
                  id v115 = v38;
                  double v116 = &v122;
                  double v117 = &v118;
                  double v88 = _Block_copy(v114);
                  id v39 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                  id v40 = v98[41];
                  v98[41] = v39;

                  id v41 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                  id v42 = v98[42];
                  v98[42] = v41;

                  id v43 = objc_alloc_init(MEMORY[0x1E4F28E60]);
                  id v44 = v98[15];
                  v98[15] = v43;

                  v111[0] = MEMORY[0x1E4F143A8];
                  v111[1] = 3221225472;
                  v111[2] = __48___UITableViewUpdateSupport__generateUpdateMaps__block_invoke_2_146;
                  v111[3] = &unk_1E5309290;
                  v111[4] = v98;
                  id v45 = v38;
                  id v112 = v45;
                  v113[0] = _Block_copy(v111);
                  v109[0] = MEMORY[0x1E4F143A8];
                  v109[1] = 3221225472;
                  v109[2] = __48___UITableViewUpdateSupport__generateUpdateMaps__block_invoke_3_150;
                  v109[3] = &unk_1E5309290;
                  v109[4] = v98;
                  id v87 = v45;
                  id v110 = v87;
                  v113[1] = _Block_copy(v109);
                  memset(&v113[2], 0, 24);
                  v108[0] = MEMORY[0x1E4F143A8];
                  v108[1] = 3221225472;
                  v108[2] = __48___UITableViewUpdateSupport__generateUpdateMaps__block_invoke_4_151;
                  v108[3] = &unk_1E53092B8;
                  v108[4] = v98;
                  v113[5] = _Block_copy(v108);
                  v107[0] = v29 | (v28 << 32);
                  v107[1] = _Block_copy(v90);
                  v107[2] = _Block_copy(v89);
                  v106[0] = v35 | (v34 << 32);
                  v106[1] = _Block_copy(v92);
                  v106[2] = _Block_copy(v91);
                  uint64_t v46 = [v87 count];
                  __copy_constructor_8_8_sb0_sb8_sb16_sb24_sb32_sb40(v105, v113);
                  id v104 = 0;
                  _UIDataSourceGenerateUpdateMaps((unsigned int *)v107, (unsigned int *)v106, v46, (uint64_t)v88, (uint64_t *)v105, &v104, (uint64_t)v142);
                  id v47 = v104;
                  long long v48 = v142[1];
                  *(_OWORD *)(v98 + 43) = v142[0];
                  *(_OWORD *)(v98 + 45) = v48;
                  *(_OWORD *)(v98 + 47) = v142[2];
                  v98[49] = v143;
                  id v84 = v47;
                  uint64_t v49 = [v47 stringByReplacingOccurrencesOfString:@"item" withString:@"row"];
                  id v50 = v98[50];
                  v98[50] = (id)v49;

                  *((unsigned char *)v98 + 312) = *((unsigned char *)v119 + 24);
                  long long v102 = 0u;
                  long long v103 = 0u;
                  long long v100 = 0u;
                  long long v101 = 0u;
                  id v51 = (id)v123[5];
                  uint64_t v52 = [v51 countByEnumeratingWithState:&v100 objects:v142 count:16];
                  if (!v52) {
                    goto LABEL_51;
                  }
                  uint64_t v53 = *(void *)v101;
                  while (1)
                  {
                    uint64_t v54 = 0;
                    do
                    {
                      if (*(void *)v101 != v53) {
                        objc_enumerationMutation(v51);
                      }
                      uint64_t v55 = *(void *)(*((void *)&v100 + 1) + 8 * v54);
                      if (os_variant_has_internal_diagnostics())
                      {
                        if (v55 && (*(unsigned char *)(v55 + 16) & 1) != 0) {
                          goto LABEL_28;
                        }
                        uint64_t v70 = __UIFaultDebugAssertLog();
                        if (os_log_type_enabled(v70, OS_LOG_TYPE_FAULT))
                        {
                          *(_WORD *)buf = 0;
                          _os_log_fault_impl(&dword_1853B0000, v70, OS_LOG_TYPE_FAULT, "headerFooterOnly updates must be section operations", buf, 2u);
                        }
                      }
                      else
                      {
                        if (v55 && (*(unsigned char *)(v55 + 16) & 1) != 0) {
                          goto LABEL_28;
                        }
                        uint64_t v71 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_MergedGlobals_40_0) + 8);
                        if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
                        {
                          *(_WORD *)buf = 0;
                          _os_log_impl(&dword_1853B0000, v71, OS_LOG_TYPE_ERROR, "headerFooterOnly updates must be section operations", buf, 2u);
                        }
                      }
                      if (!v55)
                      {
                        double v63 = 0;
                        id v62 = v98[42];
                        v138[0] = @"Section";
                        goto LABEL_32;
                      }
LABEL_28:
                      int v56 = *(_DWORD *)(v55 + 20);
                      if (!v56)
                      {
                        id v62 = v98[42];
                        v138[0] = @"Section";
                        double v63 = *(void **)(v55 + 24);
LABEL_32:
                        double v64 = NSNumber;
                        id v65 = v63;
                        double v66 = objc_msgSend(v64, "numberWithInteger:", objc_msgSend(v65, "section"));
                        v138[1] = @"UpdateItem";
                        v139[0] = v66;
                        v139[1] = v55;
                        double v67 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v139 forKeys:v138 count:2];
                        [v62 addObject:v67];

                        goto LABEL_36;
                      }
                      if (v56 == 1)
                      {
                        id v57 = v98[41];
                        v140[0] = @"Section";
                        double v58 = NSNumber;
                        id v59 = *(id *)(v55 + 24);
                        double v60 = objc_msgSend(v58, "numberWithInteger:", objc_msgSend(v59, "section"));
                        v140[1] = @"UpdateItem";
                        v141[0] = v60;
                        v141[1] = v55;
                        CGFloat v61 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v141 forKeys:v140 count:2];
                        [v57 addObject:v61];
                      }
                      else if (os_variant_has_internal_diagnostics())
                      {
                        double v72 = __UIFaultDebugAssertLog();
                        if (os_log_type_enabled(v72, OS_LOG_TYPE_FAULT))
                        {
                          uint64_t v73 = *(unsigned int *)(v55 + 20);
                          *(_DWORD *)buf = 134217984;
                          uint64_t v137 = v73;
                          _os_log_fault_impl(&dword_1853B0000, v72, OS_LOG_TYPE_FAULT, "Unexpected action for headerFooterOnly update: %ld", buf, 0xCu);
                        }
                      }
                      else
                      {
                        CGFloat v68 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB259668) + 8);
                        if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
                        {
                          uint64_t v69 = *(unsigned int *)(v55 + 20);
                          *(_DWORD *)buf = 134217984;
                          uint64_t v137 = v69;
                          _os_log_impl(&dword_1853B0000, v68, OS_LOG_TYPE_ERROR, "Unexpected action for headerFooterOnly update: %ld", buf, 0xCu);
                        }
                      }
LABEL_36:
                      ++v54;
                    }
                    while (v52 != v54);
                    uint64_t v74 = [v51 countByEnumeratingWithState:&v100 objects:v142 count:16];
                    uint64_t v52 = v74;
                    if (!v74)
                    {
LABEL_51:

                      __destructor_8_sb0_sb8_sb16_sb24_sb32_sb40((uint64_t)v113);
                      _Block_object_dispose(&v118, 8);
                      _Block_object_dispose(&v122, 8);

                      goto LABEL_52;
                    }
                  }
                }
                double v80 = [MEMORY[0x1E4F28B00] currentHandler];
                uint64_t v81 = [NSString stringWithUTF8String:"_UIMapIndex _UIMapIndexFromNSInteger(const NSInteger)"];
                objc_msgSend(v80, "handleFailureInFunction:file:lineNumber:description:", v81, @"_UIDataSourceBatchUpdateMap.h", 28, @"NSInteger index is negative or too large: %ld", v35);

                unint64_t v34 = (unint64_t)v98[32];
              }
              unint64_t v35 = 0xFFFFFFFFLL;
              goto LABEL_17;
            }
            BOOL v78 = [MEMORY[0x1E4F28B00] currentHandler];
            uint64_t v79 = [NSString stringWithUTF8String:"_UIMapIndex _UIMapIndexFromNSInteger(const NSInteger)"];
            objc_msgSend(v78, "handleFailureInFunction:file:lineNumber:description:", v79, @"_UIDataSourceBatchUpdateMap.h", 28, @"NSInteger index is negative or too large: %ld", v28);
          }
          unint64_t v28 = 0xFFFFFFFFLL;
          goto LABEL_12;
        }
        char v76 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v77 = [NSString stringWithUTF8String:"_UIMapIndex _UIMapIndexFromNSInteger(const NSInteger)"];
        objc_msgSend(v76, "handleFailureInFunction:file:lineNumber:description:", v77, @"_UIDataSourceBatchUpdateMap.h", 28, @"NSInteger index is negative or too large: %ld", v29);

        unint64_t v28 = (unint64_t)v98[31];
      }
      unint64_t v29 = 0xFFFFFFFFLL;
      goto LABEL_9;
    }
  }
  unint64_t v98 = 0;
LABEL_52:

  return v98;
}

- (void)_computeAutomaticAnimationTypes
{
  uint64_t v214 = *MEMORY[0x1E4F143B8];
  if (!a1 || !*(unsigned char *)(a1 + 312)) {
    return;
  }
  if (!+[UIView areAnimationsEnabled])
  {
    long long v186 = 0u;
    long long v187 = 0u;
    long long v184 = 0u;
    long long v185 = 0u;
    id v36 = *(id *)(a1 + 64);
    uint64_t v37 = [v36 countByEnumeratingWithState:&v184 objects:v211 count:16];
    if (v37)
    {
      uint64_t v38 = v37;
      uint64_t v39 = *(void *)v185;
      do
      {
        for (uint64_t i = 0; i != v38; ++i)
        {
          if (*(void *)v185 != v39) {
            objc_enumerationMutation(v36);
          }
          uint64_t v41 = *(void *)(*((void *)&v184 + 1) + 8 * i);
          if (v41 && *(void *)(v41 + 32) == 100) {
            *(void *)(v41 + 32) = 0;
          }
        }
        uint64_t v38 = [v36 countByEnumeratingWithState:&v184 objects:v211 count:16];
      }
      while (v38);
    }
    goto LABEL_230;
  }
  v200[0] = MEMORY[0x1E4F143A8];
  v200[1] = 3221225472;
  CGFloat v201 = __50___UITableViewUpdateSupport_Private___computeGaps__block_invoke;
  double v202 = &unk_1E5309218;
  uint64_t v203 = a1;
  uint64_t v2 = [*(id *)(a1 + 64) sortedArrayUsingSelector:sel_compareIndexPaths_];
  v196[0] = MEMORY[0x1E4F143A8];
  v196[1] = 3221225472;
  uint64_t v197 = __50___UITableViewUpdateSupport_Private___computeGaps__block_invoke_2;
  id v198 = &unk_1E52E5E90;
  id v143 = v2;
  id v199 = v143;
  id v150 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v192 = 0u;
  long long v193 = 0u;
  long long v194 = 0u;
  long long v195 = 0u;
  uint64_t v139 = a1;
  id obj = *(id *)(a1 + 64);
  uint64_t v3 = [obj countByEnumeratingWithState:&v192 objects:v213 count:16];
  if (!v3)
  {
    unint64_t v5 = 0;
    uint64_t v6 = 0;
    double v8 = 0;
    goto LABEL_67;
  }
  uint64_t v4 = v3;
  unint64_t v5 = 0;
  uint64_t v6 = 0;
  char v7 = 0;
  double v8 = 0;
  uint64_t v9 = *(void *)v193;
  uint64_t v145 = *(void *)v193;
  do
  {
    uint64_t v10 = 0;
    uint64_t v147 = v4;
    do
    {
      if (*(void *)v193 != v9) {
        objc_enumerationMutation(obj);
      }
      uint64_t v11 = *(void *)(*((void *)&v192 + 1) + 8 * v10);
      if (v11 && (int v12 = *(_DWORD *)(v11 + 20)) != 0)
      {
        if (v12 == 1)
        {
          if (v8
            && ((unsigned int (*)(void *, void, void))v201)(v200, *(void *)(*((void *)&v192 + 1) + 8 * v10), v8[4]))
          {
            -[UITableViewUpdateGap addUpdateItem:]((uint64_t)v8, v11);
            uint64_t v6 = (void *)v11;
          }
          else
          {
            uint64_t v17 = -[UITableViewUpdateGap initWithUpdateItem:]([UITableViewUpdateGap alloc], (void *)v11);

            [v150 addObject:v17];
            unint64_t v5 = (void *)v11;
            uint64_t v6 = (void *)v11;
            double v8 = (void *)v17;
          }
        }
      }
      else
      {
        if (v7)
        {
          if (v8)
          {
            double v13 = (void *)v8[2];
            if (!v13) {
              double v13 = (void *)MEMORY[0x1E4F1CBF0];
            }
            id v14 = v13;
            double v15 = [v14 lastObject];
            int v16 = ((uint64_t (*)(void *, uint64_t, void *))v201)(v200, v11, v15);

            if (v16)
            {
              -[UITableViewUpdateGap addUpdateItem:]((uint64_t)v8, v11);
              char v7 = 1;
              unint64_t v5 = (void *)v11;
              goto LABEL_50;
            }
          }
        }
        else
        {
          -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v8, v6);
          -[UIBackgroundConfiguration _setBackgroundColor:]((uint64_t)v8, v5);

          double v8 = 0;
          uint64_t v6 = 0;
          unint64_t v5 = 0;
        }
        -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v8, v6);
        -[UIBackgroundConfiguration _setBackgroundColor:]((uint64_t)v8, v5);

        long long v190 = 0u;
        long long v191 = 0u;
        long long v188 = 0u;
        long long v189 = 0u;
        id v155 = v150;
        uint64_t v18 = [v155 countByEnumeratingWithState:&v188 objects:v212 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = 0;
          uint64_t v21 = *(void *)v189;
LABEL_25:
          uint64_t v22 = 0;
          while (1)
          {
            if (*(void *)v189 != v21) {
              objc_enumerationMutation(v155);
            }
            uint64_t v23 = *(void *)(*((void *)&v188 + 1) + 8 * v22);
            if (!v23 || ![*(id *)(v23 + 8) count]) {
              break;
            }
            if (!v20)
            {
              if (v11) {
                uint64_t v24 = *(void **)(v11 + 24);
              }
              else {
                uint64_t v24 = 0;
              }
              uint64_t v20 = v197((uint64_t)v196, v24);
            }
            id v25 = *(void **)(v23 + 32);
            if (v25) {
              uint64_t v26 = v25[3];
            }
            else {
              uint64_t v26 = 0;
            }
            double v27 = v25;
            unint64_t v28 = [v20 compare:v26];

            if (v28 <= 1)
            {
              unint64_t v29 = *(void **)(v23 + 40);
              uint64_t v30 = v29 ? v29[3] : 0;
              id v31 = v29;
              uint64_t v32 = [v20 compare:v30];

              if ((unint64_t)(v32 - 1) > 0xFFFFFFFFFFFFFFFDLL)
              {
                double v8 = (id)v23;
                uint64_t v6 = *(void **)(v23 + 32);
                uint64_t v34 = *(void *)(v23 + 40);

                -[UITableViewUpdateGap addUpdateItem:]((uint64_t)v8, v11);
                uint64_t v11 = v34;
                goto LABEL_49;
              }
            }
            if (v19 == ++v22)
            {
              uint64_t v33 = [v155 countByEnumeratingWithState:&v188 objects:v212 count:16];
              uint64_t v19 = v33;
              if (v33) {
                goto LABEL_25;
              }
              break;
            }
          }
        }
        else
        {
          uint64_t v20 = 0;
        }

        double v8 = (void *)-[UITableViewUpdateGap initWithUpdateItem:]([UITableViewUpdateGap alloc], (void *)v11);
        [v155 addObject:v8];
        uint64_t v6 = (void *)v11;
LABEL_49:

        char v7 = 1;
        unint64_t v5 = (void *)v11;
        uint64_t v9 = v145;
        uint64_t v4 = v147;
      }
LABEL_50:
      ++v10;
    }
    while (v10 != v4);
    uint64_t v35 = [obj countByEnumeratingWithState:&v192 objects:v213 count:16];
    uint64_t v4 = v35;
  }
  while (v35);
LABEL_67:

  -[UIContentUnavailableImageProperties _setTintColor:]((uint64_t)v8, v6);
  -[UIBackgroundConfiguration _setBackgroundColor:]((uint64_t)v8, v5);

  id WeakRetained = objc_loadWeakRetained((id *)(v139 + 40));
  long long v180 = 0u;
  long long v181 = 0u;
  long long v182 = 0u;
  long long v183 = 0u;
  id v36 = v150;
  uint64_t v42 = [v36 countByEnumeratingWithState:&v180 objects:v210 count:16];
  if (v42)
  {
    uint64_t v43 = v42;
    uint64_t v44 = *(void *)v181;
    id v45 = (uint64_t *)(v139 + 72);
    uint64_t v46 = (uint64_t *)(v139 + 80);
    uint64_t v140 = *(void *)v181;
    id v144 = v36;
    do
    {
      uint64_t v47 = 0;
      uint64_t v141 = v43;
      do
      {
        if (*(void *)v181 != v44) {
          objc_enumerationMutation(v36);
        }
        uint64_t v48 = *(void *)(*((void *)&v180 + 1) + 8 * v47);
        if (v48 && (*(unsigned char *)(v48 + 24) & 1) != 0)
        {
          unint64_t v151 = *(id **)(*((void *)&v180 + 1) + 8 * v47);
          uint64_t v49 = *(void *)(v48 + 32);
          if (!v49 || (*(unsigned char *)(v49 + 16) & 1) == 0)
          {
            if ([v151[1] count]) {
              id v50 = (id *)(v139 + 72);
            }
            else {
              id v50 = (id *)v46;
            }
            id v51 = *v50;
            uint64_t v52 = v151[4];
            uint64_t v53 = v151[5];
            if (v52) {
              uint64_t v54 = (void *)v52[3];
            }
            else {
              uint64_t v54 = 0;
            }
            obja = v51;
            id v154 = v54;
            uint64_t v142 = v47;
            if (v53) {
              uint64_t v55 = (void *)v53[3];
            }
            else {
              uint64_t v55 = 0;
            }
            unint64_t v149 = v53;
            uint64_t v146 = v52;
            id v148 = v55;
            v215.origin.CGFloat x = -[UITableViewRowData rectForTableHeaderView](*v45);
            double MinY = CGRectGetMinY(v215);
            v216.origin.CGFloat x = -[UITableViewRowData rectForTableHeaderView](*v46);
            double v57 = CGRectGetMinY(v216);
            v217.origin.CGFloat x = -[UITableViewRowData rectForTableFooterView](*v45);
            double MaxY = CGRectGetMaxY(v217);
            v218.origin.CGFloat x = -[UITableViewRowData rectForTableFooterView](*v46);
            double v59 = CGRectGetMaxY(v218);
            long long v172 = 0u;
            long long v173 = 0u;
            long long v174 = 0u;
            long long v175 = 0u;
            double v60 = [(UITableViewUpdateGap *)v151[1] updateItems];
            uint64_t v61 = [v60 countByEnumeratingWithState:&v172 objects:v208 count:16];
            if (v61)
            {
              uint64_t v62 = v61;
              uint64_t v63 = *(void *)v173;
              double v64 = 0.0;
              while (1)
              {
                uint64_t v65 = 0;
                do
                {
                  if (*(void *)v173 != v63) {
                    objc_enumerationMutation(v60);
                  }
                  uint64_t v66 = *(void *)(*((void *)&v172 + 1) + 8 * v65);
                  if (!v66)
                  {
                    id v69 = (id)*v46;
                    id v67 = 0;
LABEL_93:
                    uint64_t v70 = [v67 row];
                    uint64_t v71 = [v67 section];
                    if (v69) {
                      double v72 = -[UITableViewRowData heightForRow:inSection:canGuess:adjustForReorderedRow:]((uint64_t)v69, v70, v71, 1, 1);
                    }
                    else {
                      double v72 = 0.0;
                    }
                    if (v72 > v64) {
                      double v64 = v72;
                    }
                    goto LABEL_106;
                  }
                  id v67 = *(id *)(v66 + 24);
                  if (*(_DWORD *)(v66 + 20) == 1) {
                    CGFloat v68 = (id *)(v139 + 72);
                  }
                  else {
                    CGFloat v68 = (id *)v46;
                  }
                  id v69 = *v68;
                  if ((*(unsigned char *)(v66 + 16) & 1) == 0) {
                    goto LABEL_93;
                  }
                  uint64_t v73 = [v67 section];
                  uint64_t v74 = -[UITableViewRowData numberOfRowsInSection:]((uint64_t)v69, v73);
                  if (v74 >= 1)
                  {
                    uint64_t v75 = v74;
                    for (uint64_t j = 0; j != v75; ++j)
                    {
                      if (v69) {
                        double v77 = -[UITableViewRowData heightForRow:inSection:canGuess:adjustForReorderedRow:]((uint64_t)v69, j, v73, 1, 1);
                      }
                      else {
                        double v77 = 0.0;
                      }
                      if (v77 > v64) {
                        double v64 = v77;
                      }
                    }
                    uint64_t v46 = (uint64_t *)(v139 + 80);
                  }
LABEL_106:

                  ++v65;
                }
                while (v65 != v62);
                uint64_t v78 = [v60 countByEnumeratingWithState:&v172 objects:v208 count:16];
                uint64_t v62 = v78;
                if (!v78) {
                  goto LABEL_126;
                }
              }
            }
            double v64 = 0.0;
LABEL_126:

            if (v64 > MaxY - MinY || v64 > v59 - v57)
            {
              long long v170 = 0u;
              long long v171 = 0u;
              long long v168 = 0u;
              long long v169 = 0u;
              id v87 = [(UITableViewUpdateGap *)v151[1] updateItems];
              uint64_t v88 = [v87 countByEnumeratingWithState:&v168 objects:v207 count:16];
              double v89 = v146;
              if (v88)
              {
                uint64_t v90 = v88;
                uint64_t v91 = *(void *)v169;
                do
                {
                  for (uint64_t k = 0; k != v90; ++k)
                  {
                    if (*(void *)v169 != v91) {
                      objc_enumerationMutation(v87);
                    }
                    uint64_t v93 = *(void *)(*((void *)&v168 + 1) + 8 * k);
                    if (v93 && *(void *)(v93 + 32) == 100) {
                      *(void *)(v93 + 32) = 0;
                    }
                  }
                  uint64_t v90 = [v87 countByEnumeratingWithState:&v168 objects:v207 count:16];
                }
                while (v90);
              }
              goto LABEL_220;
            }
            double v89 = v146;
            if (obja) {
              uint64_t v94 = obja[8];
            }
            else {
              uint64_t v94 = 0;
            }
            if (!v149 || (v149[16] & 1) == 0) {
              goto LABEL_148;
            }
            if ([v148 section] < v94 - 1)
            {
              BOOL v95 = 1;
LABEL_151:
              if (!v146 || (v146[16] & 1) == 0)
              {
LABEL_153:
                BOOL v97 = [v154 row] > 0;
                goto LABEL_156;
              }
              if ([v154 section] <= 0)
              {
                if ((v146[16] & 1) == 0) {
                  goto LABEL_153;
                }
                BOOL v97 = 0;
              }
              else
              {
                BOOL v97 = 1;
LABEL_156:
                if (v97 && v95)
                {
                  long long v166 = 0u;
                  long long v167 = 0u;
                  long long v164 = 0u;
                  long long v165 = 0u;
                  unint64_t v98 = v151;
                  id v87 = [(UITableViewUpdateGap *)v151[1] updateItems];
                  uint64_t v99 = [v87 countByEnumeratingWithState:&v164 objects:v206 count:16];
                  if (!v99) {
                    goto LABEL_220;
                  }
                  uint64_t v100 = v99;
                  uint64_t v101 = *(void *)v165;
                  long long v102 = v154;
                  do
                  {
                    for (uint64_t m = 0; m != v100; ++m)
                    {
                      if (*(void *)v165 != v101) {
                        objc_enumerationMutation(v87);
                      }
                      uint64_t v104 = *(void *)(*((void *)&v164 + 1) + 8 * m);
                      if (v104 && *(void *)(v104 + 32) == 100)
                      {
                        if ([v102 row])
                        {
                          uint64_t v105 = -[UITableViewRowData globalRowForRowAtIndexPath:]((uint64_t)obja, v102) - 1;
                          uint64_t v106 = [v98[1] count];
                          uint64_t v107 = (void *)*v45;
                          if (v106)
                          {
                            v219.origin.CGFloat x = -[UITableViewRowData rectForGlobalRow:heightCanBeGuessed:]((void *)*v45, v105, 1);
                            double v108 = CGRectGetMaxY(v219);
                            uint64_t v109 = *(void **)(v139 + 80);
                            uint64_t v110 = -[_UITableViewUpdateSupport finalGlobalIndexForInitialGlobalIndex:](v139, v105);
                            uint64_t v111 = v109;
                          }
                          else
                          {
                            uint64_t v119 = -[_UITableViewUpdateSupport initialGlobalIndexForFinalGlobalIndex:](v139, v105);
                            v221.origin.CGFloat x = -[UITableViewRowData rectForGlobalRow:heightCanBeGuessed:](v107, v119, 1);
                            double v108 = CGRectGetMaxY(v221);
                            uint64_t v111 = *(void **)(v139 + 80);
                            uint64_t v110 = v105;
                          }
                          v222.origin.CGFloat x = -[UITableViewRowData rectForGlobalRow:heightCanBeGuessed:](v111, v110, 1);
                          if (v108 <= CGRectGetMaxY(v222))
                          {
                            uint64_t v120 = 3;
                            uint64_t v121 = 4;
                          }
                          else
                          {
                            uint64_t v120 = 4;
                            uint64_t v121 = 3;
                          }
                          long long v102 = v154;
                        }
                        else
                        {
                          uint64_t v112 = [v98[1] count];
                          uint64_t v113 = v102;
                          uint64_t v114 = *v45;
                          uint64_t v115 = [v113 section];
                          if (v112)
                          {
                            v220.origin.CGFloat x = -[UITableViewRowData rectForHeaderInSection:heightCanBeGuessed:](v114, v115, 1);
                            double v116 = CGRectGetMaxY(v220);
                            uint64_t v117 = *(void *)(v139 + 80);
                            uint64_t v118 = -[_UITableViewUpdateSupport finalSectionIndexForInitialSectionIndex:](v139, [v113 section]);
                          }
                          else
                          {
                            uint64_t v122 = -[_UITableViewUpdateSupport initialSectionIndexForFinalSectionIndex:](v139, v115);
                            v223.origin.CGFloat x = -[UITableViewRowData rectForHeaderInSection:heightCanBeGuessed:](v114, v122, 1);
                            double v116 = CGRectGetMaxY(v223);
                            uint64_t v117 = *(void *)(v139 + 80);
                            uint64_t v118 = [v113 section];
                          }
                          v224.origin.CGFloat x = -[UITableViewRowData rectForHeaderInSection:heightCanBeGuessed:](v117, v118, 1);
                          if (v116 <= CGRectGetMaxY(v224))
                          {
                            uint64_t v120 = 3;
                            uint64_t v121 = 4;
                          }
                          else
                          {
                            uint64_t v120 = 4;
                            uint64_t v121 = 3;
                          }
                          long long v102 = v154;
                          unint64_t v98 = v151;
                        }
                        if (*(_DWORD *)(v104 + 20)) {
                          uint64_t v120 = v121;
                        }
                        *(void *)(v104 + 32) = v120;
                      }
                    }
                    uint64_t v100 = [v87 countByEnumeratingWithState:&v164 objects:v206 count:16];
                  }
                  while (v100);
                  uint64_t v46 = (uint64_t *)(v139 + 80);
                  double v89 = v146;
                  goto LABEL_221;
                }
              }
              if ([v151[1] count] && objc_msgSend(v151[2], "count"))
              {
                long long v162 = 0u;
                long long v163 = 0u;
                long long v160 = 0u;
                long long v161 = 0u;
                uint64_t v123 = [(UITableViewUpdateGap *)v151[1] updateItems];
                uint64_t v124 = [v123 countByEnumeratingWithState:&v160 objects:v205 count:16];
                if (v124)
                {
                  uint64_t v125 = v124;
                  uint64_t v126 = *(void *)v161;
                  do
                  {
                    for (uint64_t n = 0; n != v125; ++n)
                    {
                      if (*(void *)v161 != v126) {
                        objc_enumerationMutation(v123);
                      }
                      uint64_t v128 = *(void *)(*((void *)&v160 + 1) + 8 * n);
                      if (v128 && *(void *)(v128 + 32) == 100)
                      {
                        if (*(_DWORD *)(v128 + 20)) {
                          uint64_t v129 = 1;
                        }
                        else {
                          uint64_t v129 = 2;
                        }
                        *(void *)(v128 + 32) = v129;
                      }
                    }
                    uint64_t v125 = [v123 countByEnumeratingWithState:&v160 objects:v205 count:16];
                  }
                  while (v125);
                }

                uint64_t v130 = 5;
              }
              else
              {
                BOOL v131 = v97 || !v95;
                if (v97) {
                  uint64_t v130 = 3;
                }
                else {
                  uint64_t v130 = 0;
                }
                if (!v131)
                {
                  if (v146 == v149) {
                    uint64_t v130 = 4;
                  }
                  else {
                    uint64_t v130 = 5;
                  }
                }
              }
              long long v158 = 0u;
              long long v159 = 0u;
              long long v156 = 0u;
              long long v157 = 0u;
              id v87 = [(UITableViewUpdateGap *)v151[1] updateItems];
              uint64_t v132 = [v87 countByEnumeratingWithState:&v156 objects:v204 count:16];
              if (v132)
              {
                uint64_t v133 = v132;
                uint64_t v134 = *(void *)v157;
                do
                {
                  for (iuint64_t i = 0; ii != v133; ++ii)
                  {
                    if (*(void *)v157 != v134) {
                      objc_enumerationMutation(v87);
                    }
                    uint64_t v136 = *(void *)(*((void *)&v156 + 1) + 8 * ii);
                    if (v136 && *(void *)(v136 + 32) == 100) {
                      *(void *)(v136 + 32) = v130;
                    }
                  }
                  uint64_t v133 = [v87 countByEnumeratingWithState:&v156 objects:v204 count:16];
                }
                while (v133);
              }
LABEL_220:
              long long v102 = v154;
LABEL_221:

              uint64_t v44 = v140;
              uint64_t v43 = v141;
              uint64_t v47 = v142;
              uint64_t v79 = obja;
LABEL_222:

              id v36 = v144;
              goto LABEL_223;
            }
            if ((v149[16] & 1) == 0)
            {
LABEL_148:
              if ([v148 section] < v94)
              {
                uint64_t v96 = [v148 row];
                BOOL v95 = v96 < -[UITableViewRowData numberOfRowsInSection:]((uint64_t)obja, [v148 section])
                          - 1;
                goto LABEL_151;
              }
            }
            BOOL v95 = 0;
            goto LABEL_151;
          }
          long long v178 = 0u;
          long long v179 = 0u;
          long long v176 = 0u;
          long long v177 = 0u;
          uint64_t v79 = [(UITableViewUpdateGap *)v151[1] updateItems];
          uint64_t v80 = [v79 countByEnumeratingWithState:&v176 objects:v209 count:16];
          if (v80)
          {
            uint64_t v81 = v80;
            uint64_t v82 = *(void *)v177;
            do
            {
              for (juint64_t j = 0; jj != v81; ++jj)
              {
                if (*(void *)v177 != v82) {
                  objc_enumerationMutation(v79);
                }
                uint64_t v84 = *(void *)(*((void *)&v176 + 1) + 8 * jj);
                if (v84)
                {
                  if (*(_DWORD *)(v84 + 20)) {
                    uint64_t v85 = 1;
                  }
                  else {
                    uint64_t v85 = 2;
                  }
                  *(void *)(v84 + 32) = v85;
                }
              }
              uint64_t v81 = [v79 countByEnumeratingWithState:&v176 objects:v209 count:16];
            }
            while (v81);
          }
          goto LABEL_222;
        }
LABEL_223:
        ++v47;
      }
      while (v47 != v43);
      uint64_t v137 = [v36 countByEnumeratingWithState:&v180 objects:v210 count:16];
      uint64_t v43 = v137;
    }
    while (v137);
  }

LABEL_230:
}

- (void)_setupAnimationForTableFooter
{
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    double v2 = -[UITableViewRowData rectForTableFooterView](*(void *)(a1 + 72));
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    double v9 = -[UITableViewRowData rectForTableFooterView](*(void *)(a1 + 80));
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    v22.origin.CGFloat x = v2;
    v22.origin.CGFloat y = v4;
    v22.size.CGFloat width = v6;
    v22.size.CGFloat height = v8;
    if (!CGRectIsEmpty(v22)
      || (v23.origin.CGFloat x = v9, v23.origin.y = v11, v23.size.width = v13, v23.size.height = v15, !CGRectIsEmpty(v23)))
    {
      v24.origin.CGFloat x = v2;
      v24.origin.CGFloat y = v4;
      v24.size.CGFloat width = v6;
      v24.size.CGFloat height = v8;
      v27.origin.CGFloat x = v9;
      v27.origin.CGFloat y = v11;
      v27.size.CGFloat width = v13;
      v27.size.CGFloat height = v15;
      CGRect v25 = CGRectUnion(v24, v27);
      if (CGRectIntersectsRect(v25, *(CGRect *)(a1 + 192)))
      {
        if ([WeakRetained _shouldUseNewHeaderFooterBehavior]) {
          [WeakRetained _tableFooterView:1];
        }
        else {
        int v16 = [WeakRetained tableFooterView];
        }
        uint64_t v17 = v16;
        if (v16)
        {
          objc_msgSend(v16, "setFrame:", v2, v4, v6, v8);
          if ([WeakRetained _shouldUseNewHeaderFooterBehavior])
          {
            v26.origin.CGFloat x = v9;
            v26.origin.CGFloat y = v11;
            v26.size.CGFloat width = v13;
            v26.size.CGFloat height = v15;
            char v18 = !CGRectIntersectsRect(v26, *(CGRect *)(a1 + 160));
          }
          else
          {
            char v18 = 0;
          }
          uint64_t v19 = -[UIViewAnimation initWithView:indexPath:viewType:endRect:endAlpha:startFraction:endFraction:curve:animateFromCurrentPosition:shouldDeleteAfterAnimation:editing:]((id *)[UIViewAnimation alloc], v17, 0, 5, 0, 1, v18, [WeakRetained _isEditingWithNoSwipedCell], v9, v11, v13, v15, 1.0, 0.0, 1.0);
          [*(id *)(a1 + 320) addObject:v19];
        }
      }
    }
  }
}

- (id)_collectionViewUpdateItems
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    double v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 64), "count"));
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v3 = *(id *)(a1 + 64);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v3);
          }
          double v8 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "collectionViewUpdateItem", (void)v10);
          [v2 addObject:v8];
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v5);
    }
  }
  else
  {
    double v2 = 0;
  }
  return v2;
}

- (BOOL)_isReloadSectionUpdate
{
  if ([*(id *)(a1 + 64) count] != 2) {
    return 0;
  }
  uint64_t v2 = [*(id *)(a1 + 64) objectAtIndexedSubscript:0];
  uint64_t v3 = [*(id *)(a1 + 64) objectAtIndexedSubscript:1];
  uint64_t v4 = (void *)v3;
  if (v2 && *(_DWORD *)(v2 + 20) == 1 && (!v3 || !*(_DWORD *)(v3 + 20)))
  {
    id v7 = *(id *)(v2 + 24);
    uint64_t v8 = [v7 section];
    if (v4) {
      double v9 = (void *)v4[3];
    }
    else {
      double v9 = 0;
    }
    BOOL v5 = v8 == [v9 section];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)_oldMapArray
{
  uint64_t v2 = (uint64_t)-[UITableViewRowData numberOfRows](*(void *)(a1 + 72));
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v2];
  if (v2 >= 1)
  {
    for (unint64_t i = 0; i != v2; ++i)
    {
      uint64_t v5 = -[_UITableViewUpdateSupport finalGlobalIndexForInitialGlobalIndex:](a1, i);
      if (v5 == 0x7FFFFFFFFFFFFFFFLL) {
        objc_msgSend(NSString, "stringWithFormat:", @"%ld->X", i, v8);
      }
      else {
      uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"%ld->%ld", i, v5);
      }
      [v3 addObject:v6];
    }
  }
  return v3;
}

- (double)_startOfRowAfterFooterInSection:(uint64_t)a3 withRowData:
{
  if (!a1) {
    return 0.0;
  }
  double v3 = -[UITableViewRowData rectForFooterInSection:heightCanBeGuessed:](a3, a2, 1);
  return CGRectGetMaxY(*(CGRect *)&v3);
}

- (uint64_t)finalSectionIndexForInitialSectionIndex:(uint64_t)result
{
  if (result)
  {
    unint64_t v3 = *(unsigned int *)(result + 344);
    uint64_t v4 = *(void *)(result + 360);
    if (!v4)
    {
      uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v6 = objc_msgSend(NSString, "stringWithUTF8String:", "NSInteger _UIUpdateMapNewSectionForOldSection(const _UIDataSourceUpdateMaps, const NSInteger)");
      [v5 handleFailureInFunction:v6, @"_UIDataSourceBatchUpdateMap.h", 143, @"Invalid parameter not satisfying: %@", @"updateMaps.oldSectionMap != NULL" file lineNumber description];
    }
    if (a2 > 0x7FFFFFFFFFFFFFFELL) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
    if (v3 <= a2) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
    result = *(unsigned int *)(v4 + 4 * a2);
    if (result == -1) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return result;
}

- (UIImageView)_imageViewForView:(void *)a1
{
  id v1 = a1;
  [v1 bounds];
  _UIGraphicsBeginImageContextWithOptions(0, 0, v2, v3, 0.0);
  uint64_t v4 = [v1 layer];
  uint64_t v5 = [v4 presentationLayer];
  ContextStacuint64_t k = GetContextStack(0);
  if (*(int *)ContextStack < 1) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  }
  [v5 renderInContext:v7];

  uint64_t v8 = _UIGraphicsGetImageFromCurrentImageContext(0);
  UIGraphicsEndImageContext();
  double v9 = [[UIImageView alloc] initWithImage:v8];
  [v1 frame];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  -[UIImageView setFrame:](v9, "setFrame:", v11, v13, v15, v17);
  return v9;
}

@end
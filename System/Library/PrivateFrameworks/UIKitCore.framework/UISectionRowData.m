@interface UISectionRowData
+ (uint64_t)sectionLocationForRow:(uint64_t)a3 inSection:(uint64_t)a4 numRows:(uint64_t)a5 gapIndexPath:(void *)a6 rowSpacing:;
- (double)_headerFooterSizeForSection:(void *)a3 inTable:(uint64_t)a4 withTitle:(uint64_t)a5 detailText:(uint64_t)a6 isHeader:(int)a7 stripPaddingForAbuttingView:(uint64_t)a8 isTopHeader:;
- (double)addOffset:(double)result fromRow:;
- (double)deleteRowAtIndex:(double)result;
- (double)headerSize;
- (double)heightForFooterInSection:(char)a3 canGuess:;
- (double)heightForRow:(uint64_t)a3 inSection:(char)a4 canGuess:;
- (double)insertRowAtIndex:(uint64_t)a3 inSection:(uint64_t)a4 rowHeight:(double)result tableViewRowData:;
- (double)offsetForRow:(char)a3 adjustedForGap:;
- (double)sizeForHeaderInSection:(char)a3 canGuess:;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (uint64_t)_rowForPoint:(int64_t)a3 beginningWithRow:(double)a4 numberOfRows:(double)a5 extraHitSpaceBetweenRows:(double)a6;
- (uint64_t)updateSectionHeightWithDelta:(int)a3 section:(double)a4 updateFooterOffset:;
- (void)allocateArraysWithCapacity:(uint64_t)a3 forSection:;
- (void)dealloc;
- (void)heightForEmptySection:(uint64_t)a1 inTableView:(void *)a2 rowData:(void *)a3;
- (void)refreshWithSection:(void *)a3 tableView:(uint64_t)a4 tableViewRowData:;
@end

@implementation UISectionRowData

void __66__UISectionRowData_refreshWithSection_tableView_tableViewRowData___block_invoke(uint64_t a1, char a2)
{
  if (*(void *)(*(void *)(a1 + 32) + 32))
  {
    uint64_t v4 = 0;
    while (1)
    {
      v5 = [MEMORY[0x1E4F28D58] indexPathForRow:v4 inSection:*(void *)(a1 + 48)];
      v6 = *(void **)(a1 + 56);
      if (a2) {
        break;
      }
      [v6 _dataSourceHeightForRowAtIndexPath:v5];
      float v8 = v10;
      if (v8 == -1.0)
      {
        float v8 = *(double *)(a1 + 72);
        if (v8 == -1.0)
        {
          float v8 = *(double *)(a1 + 80);
          if (*(unsigned char *)(a1 + 117)) {
            goto LABEL_24;
          }
        }
      }
      a2 = 0;
LABEL_25:
      *(float *)(*(void *)(*(void *)(a1 + 32) + 136) + 4 * v4) = v8;
      v12 = *(void **)(a1 + 32);
      float v13 = *(float *)(v12[17] + 4 * v4);
      if (v13 < -1.0) {
        float v13 = -v13;
      }
      double v14 = v13;
      if (v13 < 0.0)
      {
        v17 = [MEMORY[0x1E4F28B00] currentHandler];
        [v17 handleFailureInMethod:*(void *)(a1 + 88), *(void *)(a1 + 32), @"UITableViewRowData.m", 696, @"table view row height must not be negative - height for index path (%@) is %g", v5, *(void *)&v14 object file lineNumber description];

        v12 = *(void **)(a1 + 32);
      }
      if (*(unsigned char *)(v12[12] + 72)) {
        uint64_t v15 = 0x7FEFFFFFFFFFFFFFLL;
      }
      else {
        uint64_t v15 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      }
      *(void *)(v12[18] + 8 * v4) = v15;
      *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                              + 24)
                                                                  + v14;
      *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(double *)(a1 + 96)
                                                                  + *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                              + 24);
      uint64_t v16 = *(void *)(a1 + 104);
      if (v16)
      {
        if (*(double *)(v16 + 136) > v14) {
          *(double *)(v16 + 136) = v14;
        }
      }

      if (*(void *)(*(void *)(a1 + 32) + 32) <= (unint64_t)++v4) {
        return;
      }
    }
    [v6 _estimatedHeightForRowAtIndexPath:v5];
    float v8 = v7;
    if (v8 == -1.0)
    {
      if (*(unsigned char *)(a1 + 116))
      {
        float v8 = *(float *)(*(void *)(*(void *)(a1 + 32) + 136) + 4 * v4);
        if (v8 != 0.0)
        {
          if (v8 < -1.0) {
            float v8 = -v8;
          }
          if (v8 <= 1.0 && v8 > 0.0) {
            float v8 = 2.0;
          }
          goto LABEL_24;
        }
      }
      if (*(int *)(a1 + 112) >= 1)
      {
        double v11 = *(double *)(a1 + 64);
LABEL_23:
        float v8 = v11;
        goto LABEL_24;
      }
      float v8 = *(double *)(a1 + 72);
      if (v8 == -1.0)
      {
        double v11 = *(double *)(a1 + 80);
        goto LABEL_23;
      }
    }
LABEL_24:
    float v8 = -v8;
    a2 = 1;
    goto LABEL_25;
  }
}

- (double)heightForRow:(uint64_t)a3 inSection:(char)a4 canGuess:
{
  if (!a1) {
    return 0.0;
  }
  if ((a4 & 1) == 0 && *(float *)(*(void *)(a1 + 136) + 4 * a2) < -1.0)
  {
    id v7 = -[UITableViewRowData temporarilyDeletedIndexPathBeingReordered](*(void **)(a1 + 96));
    if (!v7
      || (float v8 = v7, [v7 section] != a3)
      || [v8 row] > a2
      || (uint64_t v9 = a2 + 1, (unint64_t)(a2 + 1) >= *(void *)(a1 + 32)))
    {
      uint64_t v9 = a2;
    }
    double v10 = [MEMORY[0x1E4F28D58] indexPathForRow:v9 inSection:a3];
    [*(id *)(*(void *)(a1 + 96) + 8) _heightForRowAtIndexPath:v10];
    float v12 = v11;
    uint64_t v13 = *(void *)(a1 + 136);
    float v14 = *(float *)(v13 + 4 * a2);
    if (v14 < -1.0) {
      float v14 = -v14;
    }
    double v15 = (float)(v12 - v14);
    *(float *)(v13 + 4 * a2) = v12;
    if (*(unsigned char *)(*(void *)(a1 + 96) + 72))
    {
      unint64_t v16 = *(void *)(a1 + 32);
      BOOL v17 = v16 > a2 + 1;
      unint64_t v18 = v16 - (a2 + 1);
      if (v17) {
        memset_pattern16((void *)(*(void *)(a1 + 144) + 8 * (a2 + 1)), &xmmword_186B93620, 8 * v18);
      }
    }
    else
    {
      unint64_t v19 = *(void *)(a1 + 32);
      if (a2 + 1 < v19)
      {
        unint64_t v20 = ~a2 + v19;
        v21 = (double *)(*(void *)(a1 + 144) + 8 * a2 + 8);
        do
        {
          double *v21 = *v21 + v15;
          ++v21;
          --v20;
        }
        while (v20);
      }
    }
    -[UISectionRowData updateSectionHeightWithDelta:section:updateFooterOffset:](a1, a3, 1, v15);
  }
  float v22 = *(float *)(*(void *)(a1 + 136) + 4 * a2);
  if (v22 < -1.0) {
    return (float)-v22;
  }
  return v22;
}

- (double)offsetForRow:(char)a3 adjustedForGap:
{
  double v3 = 0.0;
  if (!a1) {
    return v3;
  }
  uint64_t v5 = *(void *)(a1 + 144);
  if (!v5) {
    return v3;
  }
  uint64_t v7 = *(void *)(a1 + 96);
  if (!*(unsigned char *)(v7 + 72)) {
    return *(double *)(v5 + 8 * a2);
  }
  uint64_t v9 = a2;
  if (a2 < 0) {
    goto LABEL_11;
  }
  uint64_t v9 = a2;
  while (*(double *)(v5 + 8 * v9) == 1.79769313e308)
  {
    if (v9-- <= 0)
    {
      uint64_t v9 = -1;
      break;
    }
  }
  if (v7)
  {
LABEL_11:
    double v11 = *(double *)(v7 + 144);
    uint64_t v12 = *(void *)(v7 + 64);
    if (v12 < 1)
    {
LABEL_15:
      uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      uint64_t v13 = 0;
      while (*(void *)(*(void *)(v7 + 88) + 8 * v13) != a1)
      {
        if (v12 == ++v13) {
          goto LABEL_15;
        }
      }
    }
    if ((v9 & 0x8000000000000000) == 0) {
      goto LABEL_17;
    }
LABEL_20:
    double v14 = *(double *)(a1 + 112);
    if (v14 < -1.0) {
      double v14 = -v14;
    }
    double v3 = *(double *)(a1 + 48) + v14;
    if (v14 > 0.0)
    {
      [*(id *)(v7 + 8) _sectionHeaderToFirstRowPadding];
      double v3 = v3 + v15;
    }
    goto LABEL_24;
  }
  uint64_t v13 = 0;
  double v11 = 0.0;
  if (v9 < 0) {
    goto LABEL_20;
  }
LABEL_17:
  double v3 = *(double *)(v5 + 8 * v9);
LABEL_24:
  if (v9 < a2)
  {
    uint64_t v16 = *(void *)(a1 + 144) + 8;
    do
    {
      if ((v9 & 0x8000000000000000) == 0)
      {
        float v17 = *(float *)(*(void *)(a1 + 136) + 4 * v9);
        if (v17 < -1.0) {
          float v17 = -v17;
        }
        double v3 = v11 + v3 + v17;
      }
      *(double *)(v16 + 8 * v9++) = v3;
    }
    while (a2 != v9);
  }
  if (a3)
  {
    uint64_t v18 = *(void *)(a1 + 96);
    if (v18)
    {
      id v19 = *(id *)(v18 + 176);
      unint64_t v20 = v19;
      if (v19 && v13 == [v19 section] && objc_msgSend(v20, "row") <= a2)
      {
        uint64_t v21 = *(void *)(a1 + 96);
        if (v21) {
          double v22 = *(double *)(v21 + 216);
        }
        else {
          double v22 = 0.0;
        }
        double v3 = v3 + v11 + v22;
      }
    }
    else
    {
      unint64_t v20 = 0;
    }
  }
  return v3;
}

- (uint64_t)updateSectionHeightWithDelta:(int)a3 section:(double)a4 updateFooterOffset:
{
  *(double *)(a1 + 40) = *(double *)(a1 + 40) + a4;
  if (a3) {
    *(double *)(a1 + 56) = *(double *)(a1 + 56) + a4;
  }
  uint64_t v6 = a2 + 1;
  uint64_t v7 = *(void *)(a1 + 96);
  uint64_t v8 = *(void *)(v7 + 64);
  if (a2 + 1 < v8)
  {
    int v9 = *(unsigned __int8 *)(v7 + 72);
    do
    {
      if (!v9)
      {
        uint64_t v10 = *(void *)(*(void *)(v7 + 88) + 8 * v6);
        *(double *)(v10 + 16) = *(double *)(v10 + 16) + a4;
      }
      ++v6;
    }
    while (v8 != v6);
  }
  int v11 = dyld_program_sdk_at_least();
  uint64_t v12 = *(void **)(*(void *)(a1 + 96) + 8);
  if (v11)
  {
    return [v12 _coalesceContentSizeUpdateWithDelta:a4];
  }
  else
  {
    return [v12 _applyContentSizeDeltaImmediately:a4];
  }
}

- (void)refreshWithSection:(void *)a3 tableView:(uint64_t)a4 tableViewRowData:
{
  uint64_t v175 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  *(unsigned char *)(a4 + 72) = [a3 _estimatesHeights];
  [a3 _sectionContentInset];
  *(void *)(a4 + 32) = v8;
  *(void *)(a4 + 40) = v9;
  *(void *)(a4 + 48) = v10;
  *(void *)(a4 + 56) = v11;
  v151 = [a3 _constants];
  *(void *)(a1 + 104) = 0;
  *(void *)(a1 + 112) = 0;
  double v12 = -[UITableViewRowData fullContentWidth](a4);
  int v152 = [a3 _shouldHaveHeaderViewForSection:a2];
  if (v152)
  {
    int v13 = [a3 _sectionHeadersHugContent];
    double v14 = -v12;
    if (!v13) {
      double v14 = v12;
    }
    *(double *)(a1 + 104) = v14;
    *(void *)(a1 + 64) = [a3 _titleAlignmentForHeaderInSection:a2];
    [a3 _maxTitleWidthForHeaderInSection:a2];
    *(void *)(a1 + 80) = v15;
    *(void *)(a1 + 112) = 0xBFF0000000000000;
    if ([a3 _estimatesSectionHeaderHeights])
    {
      [a3 _estimatedHeightForHeaderInSection:a2];
      if (v16 == -1.0) {
        [a3 _defaultSectionHeaderHeight];
      }
      double v17 = -v16;
    }
    else
    {
      [a3 _dataSourceHeightForHeaderInSection:a2];
      double v17 = v18;
    }
    *(double *)(a1 + 112) = v17;
    double v19 = -v17;
    if (v17 >= -1.0) {
      double v20 = v17;
    }
    else {
      double v20 = -v17;
    }
    if (v20 != -1.0) {
      goto LABEL_25;
    }
    if (!a2) {
      *(void *)(a4 + 152) = 0;
    }
    unint64_t v21 = [a3 _tableStyle];
    if (v21 <= 0x10 && ((1 << v21) & 0x10006) != 0)
    {
      double v22 = [a3 _titleForHeaderInSection:a2];
      v23 = v22;
      if (v22 && [v22 length])
      {
        v24 = [a3 _detailTextForHeaderInSection:a2];
        double v17 = -[UISectionRowData _headerFooterSizeForSection:inTable:withTitle:detailText:isHeader:stripPaddingForAbuttingView:isTopHeader:](a1, a2, a3, (uint64_t)v23, (uint64_t)v24, 1, [*(id *)(a4 + 8) _shouldStripHeaderTopPaddingForSection:a2], a2 == 0);

        if (v17 != 0.0) {
          goto LABEL_24;
        }
      }
      else
      {
      }
    }
    -[UISectionRowData heightForEmptySection:inTableView:rowData:](a2, a3, (void *)a4);
    double v17 = v25;
LABEL_24:
    *(double *)(a1 + 112) = v17;
    double v19 = -v17;
LABEL_25:
    if (v17 >= -1.0) {
      double v19 = v17;
    }
    if (v19 < 0.0)
    {
      v144 = [MEMORY[0x1E4F28B00] currentHandler];
      v145 = v144;
      double v146 = *(double *)(a1 + 112);
      if (v146 < -1.0) {
        double v146 = -v146;
      }
      objc_msgSend(v144, "handleFailureInMethod:object:file:lineNumber:description:", sel_refreshWithSection_tableView_tableViewRowData_, a1, @"UITableViewRowData.m", 565, @"section header height must not be negative - provided height for section %ld is %f", a2, *(void *)&v146);
    }
  }
  double v26 = *(double *)(a1 + 112);
  if (v26 < -1.0) {
    double v26 = -v26;
  }
  if (v26 == 0.0)
  {
    unint64_t v27 = [a3 _tableStyle];
    if (v27 <= 0x10 && ((1 << v27) & 0x10006) != 0)
    {
      -[UISectionRowData heightForEmptySection:inTableView:rowData:](a2, a3, (void *)a4);
      *(double *)(a1 + 104) = v12;
      *(void *)(a1 + 112) = v28;
    }
  }
  *(void *)(a1 + 120) = 0;
  int v29 = [a3 _shouldHaveFooterViewForSection:a2];
  if (v29)
  {
    *(void *)(a1 + 72) = [a3 _titleAlignmentForFooterInSection:a2];
    [a3 _maxTitleWidthForFooterInSection:a2];
    *(void *)(a1 + 88) = v30;
    *(void *)(a1 + 120) = 0xBFF0000000000000;
    if ([a3 _estimatesSectionFooterHeights])
    {
      [a3 _estimatedHeightForFooterInSection:a2];
      if (v31 == -1.0) {
        [a3 _defaultSectionFooterHeight];
      }
      double v32 = -v31;
    }
    else
    {
      [a3 _dataSourceHeightForFooterInSection:a2];
      double v32 = v33;
    }
    *(double *)(a1 + 120) = v32;
    double v34 = -v32;
    if (v32 >= -1.0) {
      double v35 = v32;
    }
    else {
      double v35 = -v32;
    }
    if (v35 != -1.0) {
      goto LABEL_75;
    }
    if (*(void *)(a4 + 64) - 1 == a2) {
      *(void *)(a4 + 160) = 0;
    }
    unint64_t v36 = [a3 _tableStyle];
    if (v36 <= 0x10 && ((1 << v36) & 0x10006) != 0)
    {
      v37 = [a3 _titleForFooterInSection:a2];
      v38 = v37;
      if (v37 && [v37 length])
      {
        double v39 = -[UISectionRowData _headerFooterSizeForSection:inTable:withTitle:detailText:isHeader:stripPaddingForAbuttingView:isTopHeader:](a1, a2, a3, (uint64_t)v38, 0, 0, 0, 0);
        double v32 = v39;
        if (*(void *)(a4 + 64) - 1 == a2 && v39 > 0.0)
        {
          id v40 = a3;
          v41 = (double *)(id)a4;
          [v40 _bottomPadding];
          double v43 = v42;
          if (v42 == -1.0)
          {
            double v43 = 0.0;
            if (-[UITableViewRowData heightForTableFooterView]((uint64_t)v41) <= 0.0)
            {
              v44 = +[UIDevice currentDevice];
              uint64_t v150 = [v44 userInterfaceIdiom];

              double v43 = 20.0;
              if ((v150 & 0xFFFFFFFFFFFFFFFBLL) == 1)
              {
                if ([v40 usesVariableMargins]) {
                  double v43 = 40.0;
                }
                else {
                  double v43 = 20.0;
                }
              }
            }
          }

          v41[20] = v43;
        }

        if (v32 != 0.0) {
          goto LABEL_72;
        }
      }
      else
      {
      }
    }
    [a3 sectionFooterHeight];
    double v32 = v45;
    unint64_t v46 = [a3 _tableStyle];
    if (v46 <= 0x10 && ((1 << v46) & 0x10006) != 0 && *(void *)(a4 + 64) - 1 == a2)
    {
      id v47 = a3;
      v48 = (double *)(id)a4;
      [v47 _bottomPadding];
      double v50 = v49;
      if (v49 == -1.0)
      {
        double v50 = 0.0;
        if (-[UITableViewRowData heightForTableFooterView]((uint64_t)v48) <= 0.0)
        {
          v51 = +[UIDevice currentDevice];
          uint64_t v52 = [v51 userInterfaceIdiom];

          double v50 = 20.0;
          if ((v52 & 0xFFFFFFFFFFFFFFFBLL) == 1)
          {
            if ([v47 usesVariableMargins]) {
              double v50 = 40.0;
            }
            else {
              double v50 = 20.0;
            }
          }
        }
      }

      v48[20] = v50;
    }
LABEL_72:
    if (v32 == -1.0)
    {
      [a3 _defaultSectionFooterHeight];
      double v32 = v53;
    }
    *(double *)(a1 + 120) = v32;
    double v34 = -v32;
LABEL_75:
    if (v32 >= -1.0) {
      double v34 = v32;
    }
    if (v34 < 0.0)
    {
      v147 = [MEMORY[0x1E4F28B00] currentHandler];
      v148 = v147;
      double v149 = *(double *)(a1 + 120);
      if (v149 < -1.0) {
        double v149 = -v149;
      }
      objc_msgSend(v147, "handleFailureInMethod:object:file:lineNumber:description:", sel_refreshWithSection_tableView_tableViewRowData_, a1, @"UITableViewRowData.m", 592, @"section footer height must not be negative - provided height for section %ld is %f", a2, *(void *)&v149);
    }
  }
  double v54 = *(double *)(a1 + 120);
  if (v54 < -1.0) {
    double v54 = -v54;
  }
  if (v54 == 0.0)
  {
    unint64_t v55 = [a3 _tableStyle];
    if (v55 <= 0x10 && ((1 << v55) & 0x10006) != 0)
    {
      [a3 sectionFooterHeight];
      double v57 = v56;
      if (v56 == -1.0)
      {
        +[UITableViewHeaderFooterView defaultFooterHeightForStyle:](UITableViewHeaderFooterView, "defaultFooterHeightForStyle:", [*(id *)(*(void *)(a1 + 96) + 8) _tableStyle]);
        double v59 = v58;
        v60 = [*(id *)(*(void *)(a1 + 96) + 8) _scrollView];
        [v60 _currentScreenScale];
        double v57 = UIPixelBoundaryOffset(0, v59, v61);
      }
      *(double *)(a1 + 120) = v57;
      if (*(void *)(a4 + 64) - 1 == a2)
      {
        id v62 = a3;
        v63 = (double *)(id)a4;
        [v62 _bottomPadding];
        double v65 = v64;
        if (v64 == -1.0)
        {
          double v65 = 0.0;
          if (-[UITableViewRowData heightForTableFooterView]((uint64_t)v63) <= 0.0)
          {
            v66 = +[UIDevice currentDevice];
            uint64_t v67 = [v66 userInterfaceIdiom];

            double v65 = 20.0;
            if ((v67 & 0xFFFFFFFFFFFFFFFBLL) == 1)
            {
              if ([v62 usesVariableMargins]) {
                double v65 = 40.0;
              }
              else {
                double v65 = 20.0;
              }
            }
          }
        }

        v63[20] = v65;
      }
    }
  }
  int v68 = [a3 _estimatesRowHeights];
  unint64_t v69 = [a3 _numberOfRowsInSection:a2];
  *(void *)(a1 + 32) = v69;
  unint64_t v72 = *(void *)(a1 + 128);
  uint64_t v71 = *(void *)(a1 + 136);
  if (v71) {
    BOOL v73 = v72 == 0;
  }
  else {
    BOOL v73 = 1;
  }
  int v74 = !v73;
  double v75 = 0.0;
  if (v69 <= v72)
  {
    int v78 = 0;
    double v79 = 0.0;
  }
  else
  {
    uint64_t v76 = v69;
    if ((v68 & v74) == 1)
    {
      unint64_t v77 = 0;
      int v78 = 0;
      double v79 = 0.0;
      LODWORD(v70) = 1.0;
      do
      {
        float v80 = *(float *)(v71 + 4 * v77);
        double v81 = v80;
        BOOL v82 = v80 <= 1.0;
        double v83 = -0.0;
        if (!v82) {
          double v83 = v81;
        }
        double v79 = v79 + v83;
        if (!v82) {
          ++v78;
        }
        v77 += (int)(v72 / 0x3E8 + 1);
      }
      while (v72 > v77);
      if (v78)
      {
        v84 = objc_msgSend(a3, "_scrollView", v70);
        UIRoundToViewScale(v84);
        double v86 = v85;

        if (v86 > 1.0 || v86 <= 0.0) {
          double v79 = v86;
        }
        else {
          double v79 = 2.0;
        }
        uint64_t v76 = *(void *)(a1 + 32);
      }
    }
    else
    {
      int v78 = 0;
      double v79 = 0.0;
    }
    -[UISectionRowData allocateArraysWithCapacity:forSection:](a1, v76, a2);
    LOBYTE(v74) = 0;
  }
  uint64_t v169 = 0;
  v170 = (double *)&v169;
  uint64_t v171 = 0x2020000000;
  uint64_t v172 = 0;
  if (v152)
  {
    if (a2) {
      [a3 _paddingAboveSectionHeaders];
    }
    else {
      [a3 _paddingAboveFirstSectionHeader];
    }
    double v75 = v88 + v170[3];
    v170[3] = v75;
  }
  *(double *)(a1 + 48) = v75;
  if (([a3 overlapsSectionHeaderViews] & 1) == 0)
  {
    double v89 = *(double *)(a1 + 112);
    if (v89 < -1.0) {
      double v89 = -v89;
    }
    v170[3] = v170[3] + v89;
  }
  if (v152)
  {
    [a3 _sectionHeaderToFirstRowPadding];
    v170[3] = v90 + v170[3];
  }
  [a3 rowHeight];
  double v92 = v91;
  int v93 = dyld_program_sdk_at_least();
  BOOL v94 = v92 != -1.0 && v92 < 0.0;
  if (v93)
  {
    if (!v94) {
      goto LABEL_136;
    }
    v95 = [MEMORY[0x1E4F28B00] currentHandler];
    [v95 handleFailureInMethod:sel_refreshWithSection_tableView_tableViewRowData_, a1, @"UITableViewRowData.m", 651, @"Invalid table view rowHeight (%g). Value must be at least 0.0, or UITableViewAutomaticDimension.", *(void *)&v92 object file lineNumber description];
  }
  else
  {
    if (!v94) {
      goto LABEL_136;
    }
    v95 = *(id *)(__UILogGetCategoryCachedImpl("Assert", &refreshWithSection_tableView_tableViewRowData____s_category)+ 8);
    if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      double v174 = v92;
      _os_log_impl(&dword_1853B0000, v95, OS_LOG_TYPE_ERROR, "Invalid table view rowHeight (%g). Value must be at least 0.0, or UITableViewAutomaticDimension.", buf, 0xCu);
    }
  }

LABEL_136:
  [v151 defaultRowHeightForTableView:a3];
  double v97 = v96;
  if (v96 < 0.0)
  {
    v143 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v143, "handleFailureInMethod:object:file:lineNumber:description:", sel_refreshWithSection_tableView_tableViewRowData_, a1, @"UITableViewRowData.m", 653, @"UITableView internal inconsistency: default row height (%g) cannot be negative.", *(void *)&v97);
  }
  int v98 = [v151 defaultRowHeightDependsOnCellStyle];
  int v99 = v98;
  if (a4) {
    double v100 = *(double *)(a4 + 144);
  }
  else {
    double v100 = 0.0;
  }
  v153[0] = MEMORY[0x1E4F143A8];
  v153[1] = 3221225472;
  v154 = __66__UISectionRowData_refreshWithSection_tableView_tableViewRowData___block_invoke;
  v155 = &unk_1E53091A0;
  uint64_t v158 = a2;
  v159 = a3;
  char v167 = v74;
  int v166 = v78;
  double v160 = v79;
  double v161 = v92;
  double v162 = v97;
  char v168 = v98;
  v163 = sel_refreshWithSection_tableView_tableViewRowData_;
  uint64_t v156 = a1;
  v157 = &v169;
  double v164 = v100;
  uint64_t v165 = a4;
  if (v68)
  {
    __66__UISectionRowData_refreshWithSection_tableView_tableViewRowData___block_invoke((uint64_t)v153, 1);
LABEL_144:
    unint64_t v101 = *(void *)(a1 + 32);
LABEL_145:
    if (v101)
    {
      uint64_t v102 = *(void *)(a1 + 96);
      double v103 = *(double *)(v102 + 32);
      double v104 = *(double *)(v102 + 48);
      v105 = *(float **)(a1 + 136);
      double v106 = *v105;
      float v107 = v103 + v106;
      *(float *)&double v106 = v103 - v106;
      float v108 = -*(float *)&v106;
      if (*v105 >= -1.0) {
        float v108 = v107;
      }
      float *v105 = v108;
      if (v101 >= 2 && !*(unsigned char *)(*(void *)(a1 + 96) + 72))
      {
        unint64_t v109 = v101 - 1;
        v110 = (double *)(*(void *)(a1 + 144) + 8);
        do
        {
          double *v110 = v103 + *v110;
          ++v110;
          --v109;
        }
        while (v109);
      }
      v170[3] = v103 + v170[3];
      if (a4)
      {
        float v111 = -v108;
        if (v108 >= -1.0) {
          float v111 = v108;
        }
        double v112 = v111;
        if (*(double *)(a4 + 136) > v112) {
          *(double *)(a4 + 136) = v112;
        }
      }
      unint64_t v113 = v101 - 1;
      float v114 = v105[v113];
      BOOL v115 = v114 < -1.0;
      double v116 = v114;
      float v117 = v104 + v116;
      *(float *)&double v116 = v104 - v116;
      float v118 = -*(float *)&v116;
      if (!v115) {
        float v118 = v117;
      }
      v105[v113] = v118;
      v170[3] = v104 + v170[3];
      if (a4)
      {
        float v119 = -v118;
        if (v118 >= -1.0) {
          float v119 = v118;
        }
        double v120 = v119;
        if (*(double *)(a4 + 136) > v120) {
          *(double *)(a4 + 136) = v120;
        }
      }
    }
    goto LABEL_183;
  }
  if ([a3 _providesRowHeights])
  {
    v154((uint64_t)v153, 0);
    goto LABEL_144;
  }
  float v121 = v92;
  float v122 = v97;
  if (v121 == -1.0) {
    float v123 = v97;
  }
  else {
    float v123 = v92;
  }
  if (a4 && *(double *)(a4 + 136) > v123) {
    *(double *)(a4 + 136) = v123;
  }
  unint64_t v101 = *(void *)(a1 + 32);
  if (v101)
  {
    uint64_t v124 = 0;
    float v125 = -v123;
    if (v99) {
      float v122 = v125;
    }
    if (v121 == -1.0) {
      float v121 = v122;
    }
    uint64_t v126 = *(void *)(a1 + 136);
    uint64_t v127 = *(void *)(a1 + 144);
    float v128 = -v121;
    if (v121 >= -1.0) {
      float v128 = v121;
    }
    double v129 = v128;
    do
    {
      *(float *)(v126 + 4 * v124) = v121;
      if (*(unsigned char *)(*(void *)(a1 + 96) + 72)) {
        uint64_t v130 = 0x7FEFFFFFFFFFFFFFLL;
      }
      else {
        uint64_t v130 = *((void *)v170 + 3);
      }
      *(void *)(v127 + 8 * v124) = v130;
      v170[3] = v100 + v170[3] + v129;
      ++v124;
    }
    while (v101 != v124);
    goto LABEL_145;
  }
LABEL_183:
  if (((v29 | v152 ^ 1) & 1) != 0 || [a3 _tableStyle])
  {
    if (!v29) {
      goto LABEL_189;
    }
    goto LABEL_188;
  }
  if (*(double *)(a1 + 48) == 0.0)
  {
LABEL_188:
    [a3 _sectionFooterToLastRowPadding];
    v170[3] = v131 + v170[3];
  }
LABEL_189:
  v132 = v170;
  *(double *)(a1 + 56) = v170[3];
  double v133 = *(double *)(a1 + 120);
  if (v133 < -1.0) {
    double v133 = -v133;
  }
  double v134 = v132[3] + v133;
  double v135 = -0.0;
  if (v29) {
    double v135 = v100;
  }
  double v136 = v135 + v134;
  v132[3] = v136;
  *(double *)(a1 + 40) = v136;
  *(unsigned char *)(a1 + 8) = 1;
  if (a4)
  {
    id v137 = *(id *)(a4 + 184);
    v138 = v137;
    if (v137 && [v137 section] == a2)
    {
      uint64_t v139 = [v138 row];
      [(UISectionRowData *)a1 deleteRowAtIndex:v140];
    }
    id v141 = *(id *)(a4 + 176);
    v142 = v141;
    if (v141)
    {
      if ([v141 section] == a2) {
        -[UISectionRowData addOffset:fromRow:](a1, [v142 row], *(double *)(a4 + 216));
      }
    }
  }
  else
  {
    v142 = 0;
    v138 = 0;
  }

  _Block_object_dispose(&v169, 8);
}

- (double)heightForFooterInSection:(char)a3 canGuess:
{
  if (!a1) {
    return 0.0;
  }
  if ((a3 & 1) == 0 && *(double *)(a1 + 120) < -1.0)
  {
    [*(id *)(*(void *)(a1 + 96) + 8) _heightForFooterInSection:a2];
    float v6 = v5;
    double v7 = *(double *)(a1 + 120);
    if (v7 < -1.0) {
      double v7 = -v7;
    }
    float v8 = v7;
    *(double *)(a1 + 120) = v6;
    -[UISectionRowData updateSectionHeightWithDelta:section:updateFooterOffset:](a1, a2, 0, (float)(v6 - v8));
  }
  double result = *(double *)(a1 + 120);
  if (result < -1.0) {
    return -result;
  }
  return result;
}

- (double)headerSize
{
  if (!a1) {
    return 0.0;
  }
  if (![*(id *)(*(void *)(a1 + 96) + 8) _sectionHeadersHugContent]) {
    return -[UITableViewRowData fullContentWidth](*(void *)(a1 + 96));
  }
  double result = *(double *)(a1 + 104);
  if (result < -1.0) {
    return -result;
  }
  return result;
}

- (double)sizeForHeaderInSection:(char)a3 canGuess:
{
  if (!a1) {
    return 0.0;
  }
  if ((a3 & 1) == 0 && (*(double *)(a1 + 112) < -1.0 || *(double *)(a1 + 104) < -1.0))
  {
    [*(id *)(*(void *)(a1 + 96) + 8) _sizeForHeaderInSection:a2];
    float v7 = v6;
    double v8 = *(double *)(a1 + 112);
    if (v8 < -1.0) {
      double v8 = -v8;
    }
    float v9 = v8;
    double v10 = (float)(v7 - v9);
    *(void *)(a1 + 104) = v5;
    *(double *)(a1 + 112) = v7;
    uint64_t v11 = *(void *)(a1 + 32);
    if (*(unsigned char *)(*(void *)(a1 + 96) + 72))
    {
      if (v11) {
        memset_pattern16(*(void **)(a1 + 144), &xmmword_186B93620, 8 * v11);
      }
    }
    else if (v11)
    {
      double v12 = *(double **)(a1 + 144);
      do
      {
        double *v12 = *v12 + v10;
        ++v12;
        --v11;
      }
      while (v11);
    }
    -[UISectionRowData updateSectionHeightWithDelta:section:updateFooterOffset:](a1, a2, 1, v10);
  }
  return -[UISectionRowData headerSize](a1);
}

- (void)allocateArraysWithCapacity:(uint64_t)a3 forSection:
{
  *(void *)(a1 + 128) = a2;
  *(void *)(a1 + 136) = malloc_type_realloc(*(void **)(a1 + 136), 4 * a2, 0x100004052888210uLL);
  double v6 = malloc_type_realloc(*(void **)(a1 + 144), 8 * a2, 0x100004000313F17uLL);
  *(void *)(a1 + 144) = v6;
  if (*(void *)(a1 + 136)) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", sel_allocateArraysWithCapacity_forSection_, a1, @"UITableViewRowData.m", 214, @"Failed to allocate data stores for %ld rows in section %ld. Consider using fewer rows", *(void *)(a1 + 32), a3);
  }
}

- (void)heightForEmptySection:(uint64_t)a1 inTableView:(void *)a2 rowData:(void *)a3
{
  if ([a2 _tableStyle])
  {
    if (a1)
    {
      [a2 sectionHeaderHeight];
      if (v6 == -1.0)
      {
        [a2 _defaultSectionHeaderHeight];
      }
    }
    else
    {
      double v11 = GroupedTableOffsetFromTop(a2, a3);
      if (a3) {
        *((double *)a3 + 19) = v11;
      }
    }
  }
  else
  {
    [a2 sectionHeaderHeight];
    if (v7 == -1.0)
    {
      id v8 = [a2 _constants];
      float v9 = v8;
      if (a1) {
        [v8 defaultSectionHeaderHeightForTableView:a2];
      }
      else {
        [v8 defaultPlainFirstSectionHeaderHeightForTableView:a2];
      }
      double v12 = v10;
      int v13 = [a2 _scrollView];
      [v13 _currentScreenScale];
      UIPixelBoundaryOffset(1, v12, v14);
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [UISectionRowData alloc];
  if (v4)
  {
    rowData = self->_rowData;
    v11.receiver = v4;
    v11.super_class = (Class)UISectionRowData;
    double v6 = [(UISectionRowData *)&v11 init];
    double v7 = v6;
    if (v6) {
      v6->_rowData = rowData;
    }
  }
  else
  {
    double v7 = 0;
  }
  v7->_valid = self->_valid;
  v7->_headerSize = self->_headerSize;
  v7->_footerHeight = self->_footerHeight;
  v7->_headerOffset = self->_headerOffset;
  v7->_footerOffset = self->_footerOffset;
  v7->_numRows = self->_numRows;
  v7->_arrayLength = self->_arrayLength;
  id v8 = (float *)malloc_type_malloc(4 * self->_arrayLength, 0x100004052888210uLL);
  v7->_rowHeights = v8;
  memcpy(v8, self->_rowHeights, 4 * self->_arrayLength);
  float v9 = (double *)malloc_type_malloc(8 * self->_arrayLength, 0x100004000313F17uLL);
  v7->_rowOffsets = v9;
  memcpy(v9, self->_rowOffsets, 8 * self->_arrayLength);
  v7->_sectionHeight = self->_sectionHeight;
  v7->_sectionOffset = self->_sectionOffset;
  return v7;
}

- (uint64_t)_rowForPoint:(int64_t)a3 beginningWithRow:(double)a4 numberOfRows:(double)a5 extraHitSpaceBetweenRows:(double)a6
{
  *(double *)&long long v22 = a4;
  if (result)
  {
    uint64_t v6 = result;
    if (!*(void *)(result + 32)) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
    double v10 = a5 - -[UITableViewRowData offsetForSection:](*(void *)(result + 96), result);
    *((double *)&v22 + 1) = v10;
    double v11 = -[UISectionRowData offsetForRow:adjustedForGap:](v6, a2, 0);
    if (v10 < v11 || v10 > *(double *)(v6 + 40)) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
    if (a3 != 1)
    {
      uint64_t v12 = *(void *)(v6 + 96);
      if (!*(unsigned char *)(v12 + 72))
      {
        double v17 = (const void *)(*(void *)(v6 + 144) + 8 * a2);
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __88__UISectionRowData__rowForPoint_beginningWithRow_numberOfRows_extraHitSpaceBetweenRows___block_invoke;
        v19[3] = &unk_1E53091C8;
        v19[4] = v6;
        long long v20 = v22;
        double v21 = a6;
        double v18 = bsearch_b((char *)&v22 + 8, v17, a3, 8uLL, v19);
        if (v18) {
          return ((uint64_t)v18 - *(void *)(v6 + 144)) >> 3;
        }
        return 0x7FFFFFFFFFFFFFFFLL;
      }
      if (a3 < 1) {
        return 0x7FFFFFFFFFFFFFFFLL;
      }
      double v13 = *(double *)(v12 + 144);
      int64_t v14 = a3 + a2;
      double result = 0x7FFFFFFFFFFFFFFFLL;
      while (1)
      {
        float v15 = *(float *)(*(void *)(v6 + 136) + 4 * a2);
        if (v15 < -1.0) {
          float v15 = -v15;
        }
        double v16 = v15;
        if (v10 < v11 + v16 + a6) {
          break;
        }
        double v11 = v11 + v13 + v16;
        if (++a2 >= v14) {
          return result;
        }
      }
    }
    return a2;
  }
  return result;
}

- (void)dealloc
{
  free(self->_rowHeights);
  free(self->_rowOffsets);
  v3.receiver = self;
  v3.super_class = (Class)UISectionRowData;
  [(UISectionRowData *)&v3 dealloc];
}

- (double)_headerFooterSizeForSection:(void *)a3 inTable:(uint64_t)a4 withTitle:(uint64_t)a5 detailText:(uint64_t)a6 isHeader:(int)a7 stripPaddingForAbuttingView:(uint64_t)a8 isTopHeader:
{
  HIDWORD(v36) = a7;
  [a3 _prepareForRowDataHeaderFooterSizing];
  float v15 = (UITableViewHeaderFooterView *)*(id *)(*(void *)(a1 + 96) + 16);
  if (v15)
  {
    double v16 = v15;
    [(UITableViewHeaderFooterView *)v15 prepareForReuse];
  }
  else
  {
    double v16 = [[UITableViewHeaderFooterView alloc] initWithReuseIdentifier:0];
    objc_storeStrong((id *)(*(void *)(a1 + 96) + 16), v16);
  }
  uint64_t v17 = 72;
  if (a6) {
    uint64_t v17 = 64;
  }
  uint64_t v18 = *(void *)(a1 + v17);
  if _UITableViewHeadersFootersUseModernConfiguration() && (objc_opt_respondsToSelector())
  {
    LOBYTE(v36) = 0;
    [a3 _configureTableHeaderFooterView:v16 forHeader:a6 section:a2 floating:0 withTitle:a4 detailText:a5 textAlignment:v18 fromClient:v36];
    int v19 = 1;
  }
  else
  {
    [(UITableViewHeaderFooterView *)v16 setTable:a3];
    long long v20 = [a3 _constants];
    [(UITableViewHeaderFooterView *)v16 _setConstants:v20];

    -[UITableViewHeaderFooterView setTableViewStyle:](v16, "setTableViewStyle:", [a3 _tableStyle]);
    [(UITableViewHeaderFooterView *)v16 setSectionHeader:a6];
    [(UITableViewHeaderFooterView *)v16 setTextAlignment:v18];
    double v21 = [off_1E52D39B8 systemFontOfSize:0.0];
    long long v22 = [(UITableViewHeaderFooterView *)v16 textLabel];
    [v22 setFont:v21];

    v23 = [off_1E52D39B8 systemFontOfSize:0.0];
    v24 = [(UITableViewHeaderFooterView *)v16 detailTextLabel];
    [v24 setFont:v23];

    double v25 = [(UITableViewHeaderFooterView *)v16 textLabel];
    [v25 setText:a4];

    double v26 = [(UITableViewHeaderFooterView *)v16 detailTextLabel];
    [v26 setText:a5];

    [a3 _headerFooterLeadingMarginWidthIsHeader:a6 isFirstSection:a8];
    -[UITableViewHeaderFooterView _setMarginWidth:](v16, "_setMarginWidth:");
    [a3 _headerFooterTrailingMarginWidth];
    -[UITableViewHeaderFooterView _setRightMarginWidth:](v16, "_setRightMarginWidth:");
    uint64_t v27 = 88;
    if (a6) {
      uint64_t v27 = 80;
    }
    [(UITableViewHeaderFooterView *)v16 setMaxTitleWidth:*(double *)(a1 + v27)];
    [(UIView *)v16 setNeedsLayout];
    int v19 = 0;
  }
  [a3 _tableContentInset];
  double v30 = *(double *)(*(void *)(a1 + 96) + 24) - (v29 + v28);
  -[UITableViewHeaderFooterView setFrame:](v16, "setFrame:", v28, 0.0, v30, 0.0);
  if (v19)
  {
    LODWORD(v31) = 1148846080;
    LODWORD(v32) = 1112014848;
    -[UITableViewHeaderFooterView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](v16, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v30, 3.40282347e38, v31, v32);
  }
  else
  {
    -[UITableViewHeaderFooterView _sizeThatFits:stripPaddingForAbuttingView:isTopHeader:](v16, "_sizeThatFits:stripPaddingForAbuttingView:isTopHeader:", HIDWORD(v36), a8, v30, 3.40282347e38);
  }
  double v34 = v33;

  return v34;
}

- (double)addOffset:(double)result fromRow:
{
  if (a1)
  {
    double v3 = result;
    unint64_t v5 = *(void *)(a1 + 32);
    BOOL v6 = v5 >= a2;
    unint64_t v7 = v5 - a2;
    if (*(unsigned char *)(*(void *)(a1 + 96) + 72))
    {
      if (v7 != 0 && v6) {
        memset_pattern16((void *)(*(void *)(a1 + 144) + 8 * a2), &xmmword_186B93620, 8 * v7);
      }
    }
    else if (v7 != 0 && v6)
    {
      id v8 = (double *)(*(void *)(a1 + 144) + 8 * a2);
      do
      {
        *id v8 = *v8 + result;
        ++v8;
        --v7;
      }
      while (v7);
    }
    *(double *)(a1 + 56) = *(double *)(a1 + 56) + v3;
    double result = *(double *)(a1 + 40) + v3;
    *(double *)(a1 + 40) = result;
  }
  return result;
}

- (double)deleteRowAtIndex:(double)result
{
  if (a1)
  {
    uint64_t v3 = *(void *)(a1 + 96);
    if (v3) {
      double v4 = *(double *)(v3 + 144);
    }
    else {
      double v4 = 0.0;
    }
    uint64_t v5 = *(void *)(a1 + 136);
    float v6 = *(float *)(v5 + 4 * a2);
    if (v6 < -1.0) {
      float v6 = -v6;
    }
    double v7 = v4 + v6;
    *(double *)(a1 + 40) = *(double *)(a1 + 40) - v7;
    unint64_t v8 = *(void *)(a1 + 32);
    if (a2 + 1 < v8)
    {
      unint64_t v9 = ~a2 + v8;
      double v10 = (double *)(*(void *)(a1 + 144) + 8 * a2 + 8);
      double v11 = (_DWORD *)(v5 + 4 * a2 + 4);
      do
      {
        *(v11 - 1) = *v11;
        if (*(unsigned char *)(*(void *)(a1 + 96) + 72)) {
          double v12 = 1.79769313e308;
        }
        else {
          double v12 = *v10 - v7;
        }
        *(v10++ - 1) = v12;
        ++v11;
        --v9;
      }
      while (v9);
    }
    double result = *(double *)(a1 + 56) - v7;
    *(double *)(a1 + 56) = result;
    *(void *)(a1 + 32) = v8 - 1;
  }
  return result;
}

- (double)insertRowAtIndex:(uint64_t)a3 inSection:(uint64_t)a4 rowHeight:(double)result tableViewRowData:
{
  if (!a1) {
    return result;
  }
  double v6 = result;
  if (a2 < 0)
  {
    uint64_t v36 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", sel_insertRowAtIndex_inSection_rowHeight_tableViewRowData_, a1, @"UITableViewRowData.m", 814, @"Attempted to insert an out-of-bounds row %ld in section %ld", a2, a3);

    if (a4) {
      goto LABEL_4;
    }
LABEL_42:
    double v10 = 0.0;
    goto LABEL_5;
  }
  if (!a4) {
    goto LABEL_42;
  }
LABEL_4:
  double v10 = *(double *)(a4 + 144);
LABEL_5:
  uint64_t v11 = *(void *)(a1 + 32);
  *(void *)(a1 + 32) = v11 + 1;
  if ((unint64_t)(v11 + 1) > *(void *)(a1 + 128)) {
    -[UISectionRowData allocateArraysWithCapacity:forSection:](a1, v11 + 1, a3);
  }
  uint64_t v12 = v11 - a2;
  if (v11 - a2 < 0)
  {
    v37 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", sel_insertRowAtIndex_inSection_rowHeight_tableViewRowData_, a1, @"UITableViewRowData.m", 826, @"Attempted to insert an out-of-bounds row %ld in section %ld", a2, a3);
  }
  unint64_t v13 = a2 + 1;
  memmove((void *)(*(void *)(a1 + 136) + 4 * (a2 + 1)), (const void *)(*(void *)(a1 + 136) + 4 * a2), 4 * v12);
  if (!*(unsigned char *)(*(void *)(a1 + 96) + 72)) {
    memmove((void *)(*(void *)(a1 + 144) + 8 * v13), (const void *)(*(void *)(a1 + 144) + 8 * a2), 8 * v12);
  }
  float v14 = v6;
  uint64_t v15 = *(void *)(a1 + 136);
  *(float *)(v15 + 4 * a2) = v14;
  float v16 = -v14;
  if (v14 >= -1.0) {
    float v17 = v14;
  }
  else {
    float v17 = -v14;
  }
  if (a4)
  {
    double v18 = v17;
    if (*(double *)(a4 + 136) > v18) {
      *(double *)(a4 + 136) = v18;
    }
  }
  uint64_t v19 = *(void *)(a1 + 96);
  if (*(unsigned char *)(v19 + 72))
  {
    unint64_t v20 = *(void *)(a1 + 32);
    BOOL v21 = v20 > a2;
    unint64_t v22 = v20 - a2;
    if (v21) {
      memset_pattern16((void *)(*(void *)(a1 + 144) + 8 * a2), &xmmword_186B93620, 8 * v22);
    }
  }
  else
  {
    uint64_t v23 = a2 - 1;
    if (a2 < 1)
    {
      double v27 = *(double *)(a1 + 112);
      if (v27 < -1.0) {
        double v27 = -v27;
      }
      double v26 = *(double *)(a1 + 48) + v27;
      if (v27 > 0.0)
      {
        [*(id *)(v19 + 8) _sectionHeaderToFirstRowPadding];
        double v26 = v26 + v28;
        float v14 = *(float *)(*(void *)(a1 + 136) + 4 * a2);
      }
      uint64_t v24 = *(void *)(a1 + 144);
    }
    else
    {
      uint64_t v24 = *(void *)(a1 + 144);
      float v25 = *(float *)(v15 + 4 * v23);
      if (v25 < -1.0) {
        float v25 = -v25;
      }
      double v26 = v10 + *(double *)(v24 + 8 * v23) + v25;
    }
    *(double *)(v24 + 8 * a2) = v26;
    unint64_t v29 = *(void *)(a1 + 32);
    float v16 = -v14;
    if (v13 < v29)
    {
      if (v14 >= -1.0) {
        float v30 = v14;
      }
      else {
        float v30 = -v14;
      }
      double v31 = v10 + v30;
      unint64_t v32 = ~a2 + v29;
      double v33 = (double *)(v24 + 8 * a2 + 8);
      do
      {
        *double v33 = v31 + *v33;
        ++v33;
        --v32;
      }
      while (v32);
    }
  }
  if (v14 >= -1.0) {
    float v34 = v14;
  }
  else {
    float v34 = v16;
  }
  double v35 = v10 + v34;
  *(double *)(a1 + 56) = *(double *)(a1 + 56) + v35;
  double result = *(double *)(a1 + 40) + v35;
  *(double *)(a1 + 40) = result;
  return result;
}

+ (uint64_t)sectionLocationForRow:(uint64_t)a3 inSection:(uint64_t)a4 numRows:(uint64_t)a5 gapIndexPath:(void *)a6 rowSpacing:
{
  id v10 = a6;
  self;
  if (a1 > 0.0)
  {
    uint64_t v11 = 4;
    goto LABEL_17;
  }
  if (!v10 || [v10 section] != a4)
  {
    self;
    BOOL v12 = a5 - 1 == a3;
    goto LABEL_8;
  }
  if ([v10 row] > a3)
  {
    self;
    BOOL v12 = a5 == a3;
LABEL_8:
    if (v12) {
      unsigned int v13 = 4;
    }
    else {
      unsigned int v13 = 2;
    }
    if (v12) {
      unsigned int v14 = 3;
    }
    else {
      unsigned int v14 = 1;
    }
    if (a3) {
      uint64_t v11 = v14;
    }
    else {
      uint64_t v11 = v13;
    }
    goto LABEL_17;
  }
  if (a3 + 1 == a5) {
    unsigned int v16 = 4;
  }
  else {
    unsigned int v16 = 2;
  }
  if (a3 + 1 == a5) {
    unsigned int v17 = 3;
  }
  else {
    unsigned int v17 = 1;
  }
  if (a3 == -1) {
    uint64_t v11 = v16;
  }
  else {
    uint64_t v11 = v17;
  }
  self;
LABEL_17:

  return v11;
}

uint64_t __88__UISectionRowData__rowForPoint_beginningWithRow_numberOfRows_extraHitSpaceBetweenRows___block_invoke(uint64_t a1, uint64_t a2, double *a3)
{
  double v3 = *(double *)(a1 + 48);
  if (v3 < *a3) {
    return 0xFFFFFFFFLL;
  }
  float v5 = *(float *)(*(void *)(*(void *)(a1 + 32) + 136)
                + 4 * (((uint64_t)a3 - *(void *)(*(void *)(a1 + 32) + 144)) >> 3));
  if (v5 < -1.0) {
    float v5 = -v5;
  }
  return v3 >= *(double *)(a1 + 56) + *a3 + v5;
}

- (id)description
{
  double v3 = [MEMORY[0x1E4F28E78] stringWithString:@"{ "];
  double v4 = [MEMORY[0x1E4F28E78] stringWithString:@"{ "];
  if (self->_numRows)
  {
    unint64_t v5 = 0;
    do
    {
      float v6 = self->_rowHeights[v5];
      if (v6 >= -1.0) {
        double v7 = &stru_1ED0E84C0;
      }
      else {
        double v7 = @"e";
      }
      if (v6 < -1.0) {
        float v6 = -v6;
      }
      [v3 appendFormat:@"%@%g", v7, v6];
      objc_msgSend(v4, "appendFormat:", @"%g", -[UISectionRowData offsetForRow:adjustedForGap:]((uint64_t)self, v5, 1));
      unint64_t numRows = self->_numRows;
      if (v5 < numRows - 1)
      {
        [v3 appendString:@", "];
        [v4 appendString:@", "];
        unint64_t numRows = self->_numRows;
      }
      ++v5;
    }
    while (v5 < numRows);
  }
  [v3 appendString:@" }"];
  [v4 appendString:@" }"];
  double height = self->_headerSize.height;
  if (height >= -1.0) {
    id v10 = &stru_1ED0E84C0;
  }
  else {
    id v10 = @"e";
  }
  if (height < -1.0) {
    double height = -height;
  }
  uint64_t v11 = [NSString stringWithFormat:@"%@%g", v10, *(void *)&height];
  double footerHeight = self->_footerHeight;
  if (footerHeight >= -1.0) {
    unsigned int v13 = &stru_1ED0E84C0;
  }
  else {
    unsigned int v13 = @"e";
  }
  if (footerHeight < -1.0) {
    double footerHeight = -footerHeight;
  }
  unsigned int v14 = [NSString stringWithFormat:@"%@%g", v13, *(void *)&footerHeight];
  uint64_t v15 = NSString;
  v20.receiver = self;
  v20.super_class = (Class)UISectionRowData;
  unsigned int v16 = [(UISectionRowData *)&v20 description];
  if (self->_valid) {
    unsigned int v17 = @"YES";
  }
  else {
    unsigned int v17 = @"NO";
  }
  objc_msgSend(v15, "stringWithFormat:", @"%@ valid: %@; section height: %g; section offset: %g; header height: %@; footer height: %@; header offset: %g; footer offset: %g; num rows: %ld; array length: %ld; row heights: %@ row offsets: %@",
    v16,
    v17,
    *(void *)&self->_sectionHeight,
    -[UITableViewRowData offsetForSection:]((uint64_t)self->_rowData, (uint64_t)self),
    v11,
    v14,
    *(void *)&self->_headerOffset,
    *(void *)&self->_footerOffset,
    self->_numRows,
    self->_arrayLength,
    v3,
  double v18 = v4);

  return v18;
}

@end
@interface UITableViewUpdateSupport
@end

@implementation UITableViewUpdateSupport

void __48___UITableViewUpdateSupport__generateUpdateMaps__block_invoke_143(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  v5 = (id)[*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
  uint64_t v6 = (uint64_t)v5;
  if (v5)
  {
    if ((v5[16] & 2) != 0)
    {
      v7 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      if (!v7)
      {
        uint64_t v8 = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:512 capacity:0];
        uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
        v10 = *(void **)(v9 + 40);
        *(void *)(v9 + 40) = v8;

        v7 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      }
      [v7 addObject:v6];
    }
    uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
    if (!*(unsigned char *)(v11 + 24) && *(void *)(v6 + 32) == 100) {
      *(unsigned char *)(v11 + 24) = 1;
    }
  }
  _UIDataSourceUpdateFromUpdateItem(v6, a3);
}

uint64_t __48___UITableViewUpdateSupport__generateUpdateMaps__block_invoke(uint64_t a1, unsigned int a2)
{
  unint64_t v2 = -[UITableViewRowData numberOfRowsBeforeSection:](*(void *)(a1 + 32), a2);
  if (v2 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v3 = v2;
    if (!HIDWORD(v2)) {
      return v3;
    }
    v5 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"_UIMapIndex _UIMapIndexFromNSInteger(const NSInteger)"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"_UIDataSourceBatchUpdateMap.h", 28, @"NSInteger index is negative or too large: %ld", v3);
  }
  return 0xFFFFFFFFLL;
}

uint64_t __48___UITableViewUpdateSupport__generateUpdateMaps__block_invoke_3(uint64_t a1, unsigned int a2)
{
  unint64_t v2 = -[UITableViewRowData numberOfRowsBeforeSection:](*(void *)(a1 + 32), a2);
  if (v2 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v3 = v2;
    if (!HIDWORD(v2)) {
      return v3;
    }
    v5 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"_UIMapIndex _UIMapIndexFromNSInteger(const NSInteger)"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"_UIDataSourceBatchUpdateMap.h", 28, @"NSInteger index is negative or too large: %ld", v3);
  }
  return 0xFFFFFFFFLL;
}

void __75___UITableViewUpdateSupport_Private___setupAnimationsForNewlyInsertedCells__block_invoke(uint64_t a1, unint64_t a2)
{
  -[UITableViewRowData indexPathForRowAtGlobalRow:](*(void **)(*(void *)(a1 + 32) + 80), a2);
  id v147 = (id)objc_claimAutoreleasedReturnValue();
  double v4 = -[UITableViewRowData rectForGlobalRow:heightCanBeGuessed:](*(void **)(*(void *)(a1 + 32) + 80), a2, 1);
  double v145 = v6;
  double v146 = v5;
  double v8 = v7;
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 248);
  while (1)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)(a1 + 32);
    BOOL v12 = v9-- < 1;
    if (v12) {
      break;
    }
    if (-[_UITableViewUpdateSupport finalGlobalIndexForInitialGlobalIndex:](v11, v9) <= a2)
    {
      uint64_t v11 = *(void *)(a1 + 32);
      break;
    }
  }
  int64_t v13 = v10;
  if (v10 < *(void *)(v11 + 248))
  {
    int64_t v13 = v10;
    do
    {
      if (-[_UITableViewUpdateSupport finalGlobalIndexForInitialGlobalIndex:](v11, v13) != 0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      ++v13;
      uint64_t v11 = *(void *)(a1 + 32);
    }
    while (v13 < *(void *)(v11 + 248));
  }
  uint64_t v14 = [v147 section];
  if (v10 < 1)
  {
    if (v10 < 0)
    {
      v43 = [MEMORY[0x1E4F28B00] currentHandler];
      v44 = v43;
      v45 = *(__CFString **)(a1 + 40);
      if (v45)
      {
        uint64_t data_high = SHIDWORD(v45->data);
        if (data_high > 3) {
          v45 = @"unknown";
        }
        else {
          v45 = off_1E53092D8[data_high];
        }
      }
      [v43 handleFailureInMethod:*(void *)(a1 + 64), *(void *)(a1 + 32), @"UITableViewSupport.m", 873, @"Invalid prior old global row when computing beginning of old gap for %@ of row at index path %@", v45, *(void *)(a1 + 48) object file lineNumber description];

      double v40 = 0.0;
      goto LABEL_55;
    }
    goto LABEL_13;
  }
  uint64_t v15 = v14;
  uint64_t v16 = -[_UITableViewUpdateSupport finalGlobalIndexForInitialGlobalIndex:](*(void *)(a1 + 32), v9);
  if (v16 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_13:
    BOOL v18 = 0;
    goto LABEL_14;
  }
  v17 = -[UITableViewRowData indexPathForRowAtGlobalRow:](*(void **)(*(void *)(a1 + 32) + 80), v16);
  BOOL v18 = [v17 section] == v15;

LABEL_14:
  uint64_t v19 = *(void *)(a1 + 32);
  uint64_t v20 = *(void *)(v19 + 248);
  if (v10 >= v20)
  {
    if (!v147)
    {
      double v40 = 0.0;
      double v41 = 0.0;
      uint64_t v42 = v13 - 1;
      if (v13 < 1) {
        goto LABEL_74;
      }
      goto LABEL_57;
    }
    if (*(unsigned char *)(a1 + 80))
    {
      uint64_t v23 = [v147 section] + 1;
      while (1)
      {
        int64_t v24 = v23;
        uint64_t v25 = *(void *)(a1 + 32);
        int64_t v26 = *(void *)(v25 + 240);
        if (v24 >= v26) {
          break;
        }
        uint64_t v27 = -[_UITableViewUpdateSupport initialSectionIndexForFinalSectionIndex:](v25, v24);
        uint64_t v23 = v24 + 1;
        if (v27 != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v25 = *(void *)(a1 + 32);
          int64_t v26 = *(void *)(v25 + 240);
          break;
        }
      }
      uint64_t v28 = *(void *)(v25 + 72);
      if (v24 >= v26)
      {
        double v30 = -[UITableViewRowData rectForTableFooterView](*(void *)(v25 + 72));
      }
      else
      {
        uint64_t v29 = -[_UITableViewUpdateSupport initialSectionIndexForFinalSectionIndex:](v25, v24);
        double v30 = -[UITableViewRowData rectForHeaderInSection:heightCanBeGuessed:](v28, v29, 1);
      }
    }
    else
    {
      uint64_t v47 = *(void *)(v19 + 72);
      uint64_t v48 = -[_UITableViewUpdateSupport initialSectionIndexForFinalSectionIndex:](v19, [v147 section]);
      double v30 = -[UITableViewRowData rectForFooterInSection:heightCanBeGuessed:](v47, v48, 1);
    }
    double MinY = CGRectGetMinY(*(CGRect *)&v30);
    goto LABEL_37;
  }
  char v21 = !v18;
  if (v10 < 1) {
    char v21 = 1;
  }
  if ((v21 & 1) == 0)
  {
    double MinY = -[_UITableViewUpdateSupport _startOfRowAfterRow:withRowData:](*(void *)(a1 + 32), v9, *(void **)(v19 + 72));
LABEL_37:
    double v40 = MinY;
    goto LABEL_55;
  }
  v34 = -[UITableViewRowData indexPathForRowAtGlobalRow:](*(void **)(v19 + 80), a2);
  uint64_t v35 = -[_UITableViewUpdateSupport initialSectionIndexForFinalSectionIndex:](v19, [v34 section]);

  v36 = -[UITableViewRowData indexPathForRowAtGlobalRow:](*(void **)(*(void *)(a1 + 32) + 72), v10);
  uint64_t v37 = *(void *)(a1 + 32);
  if (v10 <= 0)
  {
    v38 = -[UITableViewRowData indexPathForRowAtGlobalRow:](*(void **)(v37 + 80), 0);
    uint64_t v39 = [v38 section] - 1;
  }
  else
  {
    v38 = -[UITableViewRowData indexPathForRowAtGlobalRow:](*(void **)(v37 + 72), v9);
    uint64_t v39 = [v38 section];
  }

  if (v39 < [v36 section])
  {
    uint64_t v49 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:v39 + 1];

    v36 = (void *)v49;
  }
  if (v36) {
    uint64_t v50 = [v36 section];
  }
  else {
    uint64_t v50 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v35 >= v50) {
    uint64_t v51 = v50;
  }
  else {
    uint64_t v51 = v35;
  }
  if (v51 == 0x7FFFFFFFFFFFFFFFLL || [v36 section] < v35 && objc_msgSend(v36, "row") >= 1)
  {
    v149.origin.CGFloat x = -[UITableViewRowData rectForGlobalRow:heightCanBeGuessed:](*(void **)(*(void *)(a1 + 32) + 72), v10, 1);
    double v52 = CGRectGetMinY(v149);
  }
  else
  {
    double v52 = -[_UITableViewUpdateSupport _startOfRowAfterHeaderInSection:withRowData:](*(void *)(a1 + 32), v51, *(void **)(*(void *)(a1 + 32) + 72));
  }
  double v40 = v52;

LABEL_55:
  uint64_t v42 = v13 - 1;
  if (v13 >= 1)
  {
    uint64_t v19 = *(void *)(a1 + 32);
    uint64_t v20 = *(void *)(v19 + 248);
LABEL_57:
    if (v13 > v20)
    {
      v53 = [MEMORY[0x1E4F28B00] currentHandler];
      v54 = v53;
      v55 = *(__CFString **)(a1 + 40);
      if (v55)
      {
        uint64_t v56 = SHIDWORD(v55->data);
        if (v56 > 3) {
          v55 = @"unknown";
        }
        else {
          v55 = off_1E53092D8[v56];
        }
      }
      [v53 handleFailureInMethod:*(void *)(a1 + 64), *(void *)(a1 + 32), @"UITableViewSupport.m", 932, @"Invalid subsequent old global row when computing end of old gap for %@ of row at index path %@", v55, *(void *)(a1 + 48) object file lineNumber description];

      goto LABEL_71;
    }
    v150.origin.CGFloat x = -[UITableViewRowData rectForGlobalRow:heightCanBeGuessed:](*(void **)(v19 + 72), v42, 1);
    double MaxY = CGRectGetMinY(v150);
    goto LABEL_68;
  }
  if (!v147)
  {
LABEL_71:
    double v41 = 0.0;
    goto LABEL_72;
  }
  if (*(unsigned char *)(a1 + 80))
  {
    int64_t v57 = [v147 section];
    while (1)
    {
      BOOL v12 = v57-- < 1;
      if (v12) {
        break;
      }
      if (-[_UITableViewUpdateSupport initialSectionIndexForFinalSectionIndex:](*(void *)(a1 + 32), v57) != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v58 = *(void *)(a1 + 32);
        uint64_t v59 = -[_UITableViewUpdateSupport initialSectionIndexForFinalSectionIndex:](v58, v57);
        double MaxY = -[_UITableViewUpdateSupport _startOfRowAfterFooterInSection:withRowData:](v58, v59, *(void *)(*(void *)(a1 + 32) + 72));
        goto LABEL_68;
      }
    }
    v151.origin.CGFloat x = -[UITableViewRowData rectForTableHeaderView](*(void *)(*(void *)(a1 + 32) + 72));
    double MaxY = CGRectGetMaxY(v151);
  }
  else
  {
    uint64_t v79 = *(void *)(a1 + 32);
    uint64_t v80 = -[_UITableViewUpdateSupport initialSectionIndexForFinalSectionIndex:](v79, [v147 section]);
    double MaxY = -[_UITableViewUpdateSupport _startOfRowAfterHeaderInSection:withRowData:](v79, v80, *(void **)(*(void *)(a1 + 32) + 72));
  }
LABEL_68:
  double v41 = MaxY;
LABEL_72:
  if (v41 < v40)
  {
LABEL_127:
    double v94 = v40;
    goto LABEL_128;
  }
  uint64_t v19 = *(void *)(a1 + 32);
LABEL_74:
  if (v10 < 1)
  {
    uint64_t v66 = 0;
    goto LABEL_83;
  }
  if (v10 <= *(void *)(v19 + 248))
  {
    uint64_t v61 = -[_UITableViewUpdateSupport finalGlobalIndexForInitialGlobalIndex:](v19, v9);
    uint64_t v19 = *(void *)(a1 + 32);
    goto LABEL_82;
  }
  uint64_t v61 = *(void *)(v19 + 256);
  if (v61 >= -1)
  {
LABEL_82:
    uint64_t v66 = v61 + 1;
LABEL_83:
    if (v66 < *(void *)(v19 + 256))
    {
      double v67 = -[UITableViewRowData rectForGlobalRow:heightCanBeGuessed:](*(void **)(v19 + 80), v66, 1);
LABEL_85:
      double v71 = CGRectGetMinY(*(CGRect *)&v67);
      goto LABEL_102;
    }
    double v71 = v40;
    id v72 = v147;
    if (v147)
    {
      if (*(unsigned char *)(a1 + 80))
      {
        uint64_t v73 = [v147 section] + 1;
        while (1)
        {
          int64_t v74 = v73;
          uint64_t v75 = *(void *)(a1 + 32);
          int64_t v76 = *(void *)(v75 + 232);
          if (v74 >= v76) {
            break;
          }
          uint64_t v77 = -[_UITableViewUpdateSupport initialSectionIndexForFinalSectionIndex:](v75, v74);
          uint64_t v73 = v74 + 1;
          if (v77 != 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v75 = *(void *)(a1 + 32);
            int64_t v76 = *(void *)(v75 + 232);
            break;
          }
        }
        uint64_t v78 = *(void *)(v75 + 80);
        if (v74 >= v76) {
          double v67 = -[UITableViewRowData rectForTableFooterView](v78);
        }
        else {
          double v67 = -[UITableViewRowData rectForHeaderInSection:heightCanBeGuessed:](v78, v74, 1);
        }
        goto LABEL_85;
      }
      v152.origin.CGFloat x = -[UITableViewRowData rectForFooterInSection:heightCanBeGuessed:](*(void *)(v19 + 72), [v147 section], 1);
      CGFloat v81 = CGRectGetMinY(v152);
      id v72 = v147;
      double v71 = v81;
    }
    if ((v13 & 0x8000000000000000) == 0) {
      goto LABEL_103;
    }
LABEL_111:
    double v89 = v41;
    if (!v72) {
      goto LABEL_123;
    }
    if (*(unsigned char *)(a1 + 80))
    {
      uint64_t v90 = [v147 section];
      while (1)
      {
        BOOL v12 = v90-- < 1;
        if (v12) {
          break;
        }
        if (-[_UITableViewUpdateSupport initialSectionIndexForFinalSectionIndex:](*(void *)(a1 + 32), v90) != 0x7FFFFFFFFFFFFFFFLL)
        {
          double v91 = -[_UITableViewUpdateSupport _startOfRowAfterFooterInSection:withRowData:](*(void *)(a1 + 32), v90, *(void *)(*(void *)(a1 + 32) + 80));
          goto LABEL_120;
        }
      }
      v154.origin.CGFloat x = -[UITableViewRowData rectForTableHeaderView](*(void *)(*(void *)(a1 + 32) + 80));
      double v91 = CGRectGetMaxY(v154);
    }
    else
    {
      double v91 = -[_UITableViewUpdateSupport _startOfRowAfterHeaderInSection:withRowData:](*(void *)(a1 + 32), [v147 section], *(void **)(*(void *)(a1 + 32) + 80));
    }
    goto LABEL_120;
  }
  v62 = [MEMORY[0x1E4F28B00] currentHandler];
  v63 = v62;
  v64 = *(__CFString **)(a1 + 40);
  if (v64)
  {
    uint64_t v65 = SHIDWORD(v64->data);
    if (v65 > 3) {
      v64 = @"unknown";
    }
    else {
      v64 = off_1E53092D8[v65];
    }
  }
  [v62 handleFailureInMethod:*(void *)(a1 + 64), *(void *)(a1 + 32), @"UITableViewSupport.m", 954, @"Invalid prior new global row when computing beginning of new gap for %@ of row at index path %@", v64, *(void *)(a1 + 48) object file lineNumber description];

  double v71 = v40;
LABEL_102:
  id v72 = v147;
  if (v13 < 0) {
    goto LABEL_111;
  }
LABEL_103:
  uint64_t v82 = *(void *)(a1 + 32);
  if (v13 >= *(void *)(v82 + 248)) {
    uint64_t v83 = *(void *)(v82 + 256);
  }
  else {
    uint64_t v83 = -[_UITableViewUpdateSupport finalGlobalIndexForInitialGlobalIndex:](v82, v13);
  }
  id v72 = v147;
  if (v83 < 1) {
    goto LABEL_111;
  }
  uint64_t v84 = *(void *)(a1 + 32);
  if (v83 <= *(void *)(v84 + 256))
  {
    v153.origin.CGFloat x = -[UITableViewRowData rectForGlobalRow:heightCanBeGuessed:](*(void **)(v84 + 80), v83 - 1, 1);
    double v91 = CGRectGetMinY(v153);
LABEL_120:
    double v89 = v91;
    goto LABEL_123;
  }
  v85 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", v147);
  v86 = v85;
  v87 = *(__CFString **)(a1 + 40);
  if (v87)
  {
    uint64_t v88 = SHIDWORD(v87->data);
    if (v88 > 3) {
      v87 = @"unknown";
    }
    else {
      v87 = off_1E53092D8[v88];
    }
  }
  [v85 handleFailureInMethod:*(void *)(a1 + 64), *(void *)(a1 + 32), @"UITableViewSupport.m", 1020, @"Invalid subsequent new global row when computing end of new gap for %@ of row at index path %@", v87, *(void *)(a1 + 48) object file lineNumber description];

  double v89 = v41;
LABEL_123:
  if (v41 <= v40) {
    goto LABEL_127;
  }
  v155.origin.CGFloat x = -[UITableViewRowData rectForGlobalRow:heightCanBeGuessed:](*(void **)(*(void *)(a1 + 32) + 80), a2, 1);
  double v92 = CGRectGetMinY(v155);
  double v93 = 0.0;
  if (v89 > v71) {
    double v93 = (v92 - v71) / (v89 - v71);
  }
  double v94 = v40 + UIPixelBoundaryOffset(0, (v41 - v40) * v93, *(double *)(a1 + 72));
LABEL_128:
  uint64_t v95 = *(void *)(a1 + 40);
  if (v95)
  {
    double v96 = v4;
    switch(*(void *)(v95 + 32))
    {
      case 1:
        [*(id *)(a1 + 56) bounds];
        double v96 = v4 + v97;
        goto LABEL_158;
      case 2:
        [*(id *)(a1 + 56) bounds];
        double v96 = v4 - v98;
        goto LABEL_158;
      case 3:
        if (v40 <= v41)
        {
          uint64_t v104 = *(void *)(*(void *)(a1 + 32) + 80);
          uint64_t v105 = [v147 row];
          uint64_t v106 = [v147 section];
          if (v104) {
            double v107 = -[UITableViewRowData heightForRow:inSection:canGuess:adjustForReorderedRow:](v104, v105, v106, 1, 1);
          }
          else {
            double v107 = 0.0;
          }
          double v94 = v40 - v107;
        }
        else
        {
          if ([v147 row]) {
            goto LABEL_134;
          }
          uint64_t v112 = *(void *)(*(void *)(a1 + 32) + 80);
          uint64_t v113 = [v147 row];
          uint64_t v114 = [v147 section];
          if (v112) {
            double v115 = -[UITableViewRowData heightForRow:inSection:canGuess:adjustForReorderedRow:](v112, v113, v114, 1, 1);
          }
          else {
            double v115 = 0.0;
          }
          double v94 = v41 - v115;
        }
        break;
      case 4:
        if (v40 <= v41)
        {
          if (v40 != v41)
          {
            v156.origin.CGFloat x = -[UITableViewRowData rectForGlobalRow:heightCanBeGuessed:](*(void **)(*(void *)(a1 + 32) + 72), v42, 1);
            double v116 = v41 + CGRectGetHeight(v156);
            uint64_t v117 = *(void *)(*(void *)(a1 + 32) + 80);
            uint64_t v118 = [v147 row];
            uint64_t v119 = [v147 section];
            if (v117) {
              double v120 = -[UITableViewRowData heightForRow:inSection:canGuess:adjustForReorderedRow:](v117, v118, v119, 1, 1);
            }
            else {
              double v120 = 0.0;
            }
            double v94 = v116 + v120;
            break;
          }
          if (![v147 row] && !(objc_msgSend(*(id *)(a1 + 48), "section") | v13))
          {
LABEL_134:
            double v94 = v41;
            break;
          }
        }
        else
        {
          uint64_t v99 = [v147 row];
          double v94 = v40;
          double v96 = v4;
          if (v99 != -[UITableViewRowData numberOfRowsInSection:](*(void *)(*(void *)(a1 + 32) + 80), [*(id *)(a1 + 48) section])- 1)goto LABEL_158; {
        }
          }
        uint64_t v108 = *(void *)(*(void *)(a1 + 32) + 80);
        uint64_t v109 = [v147 row];
        uint64_t v110 = [v147 section];
        if (v108) {
          double v111 = -[UITableViewRowData heightForRow:inSection:canGuess:adjustForReorderedRow:](v108, v109, v110, 1, 1);
        }
        else {
          double v111 = 0.0;
        }
        double v94 = v41 + v111;
        break;
      case 5:
        goto LABEL_158;
      case 6:
        uint64_t v100 = *(void *)(*(void *)(a1 + 32) + 80);
        uint64_t v101 = [v147 row];
        uint64_t v102 = [v147 section];
        if (v100) {
          double v103 = -[UITableViewRowData heightForRow:inSection:canGuess:adjustForReorderedRow:](v100, v101, v102, 1, 1)
        }
               * 0.5;
        else {
          double v103 = 0.0;
        }
        double v94 = v94 - UIPixelBoundaryOffset(0, v103, *(double *)(a1 + 72));
        break;
      default:
        break;
    }
  }
  double v96 = v4;
LABEL_158:
  v157.origin.CGFloat x = v96;
  double v143 = v94;
  v157.origin.CGFloat y = v94;
  v157.size.CGFloat width = v8;
  v157.size.CGFloat height = v145;
  v161.origin.CGFloat x = v4;
  v161.origin.CGFloat y = v146;
  v161.size.CGFloat width = v8;
  v161.size.CGFloat height = v145;
  CGRect v158 = CGRectUnion(v157, v161);
  CGFloat x = v158.origin.x;
  CGFloat y = v158.origin.y;
  CGFloat width = v158.size.width;
  v158.origin.CGFloat x = v4;
  CGFloat height = v158.size.height;
  double v144 = v158.origin.x;
  v158.origin.CGFloat y = v146;
  v158.size.CGFloat width = v8;
  v158.size.CGFloat height = v145;
  BOOL v125 = CGRectIntersectsRect(v158, *(CGRect *)(*(void *)(a1 + 32) + 160));
  v159.origin.CGFloat x = x;
  v159.origin.CGFloat y = y;
  v159.size.CGFloat width = width;
  v159.size.CGFloat height = height;
  if (CGRectIntersectsRect(v159, *(CGRect *)(*(void *)(a1 + 32) + 192)) && v125)
  {
    v127 = (void *)[*(id *)(a1 + 56) _createPreparedCellForGlobalRow:a2 willDisplay:1];
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 264) + 8 * a2))
    {
      v138 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v139 = *(void *)(a1 + 64);
      uint64_t v140 = *(void *)(a1 + 32);
      v141 = -[_UITableViewUpdateSupport _collectionViewUpdateItems](v140);
      objc_msgSend(v138, "handleFailureInMethod:object:file:lineNumber:description:", v139, v140, @"UITableViewSupport.m", 1107, @"Cannot animate inserted cell because it already has an animation. Updates: %@; Cell: %@",
        v141,
        *(void *)(*(void *)(*(void *)(a1 + 32) + 264) + 8 * a2));
    }
    if (!v127)
    {
      v142 = [MEMORY[0x1E4F28B00] currentHandler];
      [v142 handleFailureInMethod:*(void *)(a1 + 64) object:*(void *)(a1 + 32) file:@"UITableViewSupport.m" lineNumber:1108 description:@"Missing inserted cell to setup animations"];
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 264) + 8 * a2), v127);
    uint64_t v128 = *(void *)(a1 + 40);
    if (!v128 || (unint64_t v129 = *(void *)(v128 + 32), v129 <= 6) && ((1 << v129) & 0x47) != 0) {
      [v127 setAlpha:0.0];
    }
    objc_msgSend(v127, "setFrame:", v96, v143, v8, v145);
    v160.origin.CGFloat x = v144;
    v160.origin.CGFloat y = v146;
    v160.size.CGFloat width = v8;
    v160.size.CGFloat height = v145;
    char v130 = !CGRectIntersectsRect(v160, *(CGRect *)(*(void *)(a1 + 32) + 160));
    int v131 = [*(id *)(a1 + 56) _isEditingRowAtIndexPath:v147];
    v132 = -[UIViewAnimation initWithView:indexPath:viewType:endRect:endAlpha:startFraction:endFraction:curve:animateFromCurrentPosition:shouldDeleteAfterAnimation:editing:]((id *)[UIViewAnimation alloc], v127, v147, 1, 0, 0, v130, v131, v144, v146, v8, v145, 1.0, 0.0, 1.0);
    [*(id *)(*(void *)(a1 + 32) + 320) addObject:v132];
    uint64_t v133 = *(void *)(a1 + 40);
    if (v133 && v132 && *(void *)(v133 + 32) == 5) {
      *((unsigned char *)v132 + 11) = 0;
    }
    if (v131 && ([*(id *)(a1 + 56) _wasEditing] & 1) == 0) {
      [v127 setEditing:0];
    }
    uint64_t v134 = *(void *)(a1 + 40);
    if (v134) {
      uint64_t v135 = *(void *)(v134 + 32);
    }
    else {
      uint64_t v135 = 0;
    }
    [v127 _animateFloatingSeparatorForInsertion:1 withRowAnimation:v135];
    uint64_t v136 = *(void *)(a1 + 40);
    if (v136) {
      uint64_t v137 = *(void *)(v136 + 32);
    }
    else {
      uint64_t v137 = 0;
    }
    [v127 _animateInnerShadowForInsertion:1 withRowAnimation:v137];
    [*(id *)(a1 + 56) _addContentSubview:v127 atBack:1];
  }
}

BOOL __50___UITableViewUpdateSupport_Private___computeGaps__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2)
  {
    int v6 = *(_DWORD *)(a2 + 20);
    if (a3)
    {
LABEL_3:
      int v7 = *(_DWORD *)(a3 + 20);
      goto LABEL_4;
    }
  }
  else
  {
    int v6 = 0;
    if (a3) {
      goto LABEL_3;
    }
  }
  int v7 = 0;
LABEL_4:
  if (v6 != v7) {
    return 0;
  }
  if (!a2)
  {
    double v8 = 0;
    if (a3) {
      goto LABEL_7;
    }
LABEL_35:
    uint64_t v9 = 0;
    goto LABEL_8;
  }
  double v8 = *(void **)(a2 + 24);
  if (!a3) {
    goto LABEL_35;
  }
LABEL_7:
  uint64_t v9 = *(void **)(a3 + 24);
LABEL_8:
  uint64_t v10 = [v8 section];
  if (v10 == [v9 section])
  {
    uint64_t v11 = [v8 row];
    uint64_t v12 = [v9 row];
    uint64_t v13 = v11 - v12;
    if (v11 - v12 < 0) {
      uint64_t v13 = v12 - v11;
    }
    if (v13 == 1) {
      return 1;
    }
  }
  uint64_t v15 = [(id)a2 compareIndexPaths:a3];
  if (v15 == -1) {
    uint64_t v16 = a2;
  }
  else {
    uint64_t v16 = a3;
  }
  if (v15 == -1) {
    uint64_t v17 = a3;
  }
  else {
    uint64_t v17 = a2;
  }
  if (a2)
  {
    uint64_t v18 = 72;
    if (!*(_DWORD *)(a2 + 20)) {
      uint64_t v18 = 80;
    }
  }
  else
  {
    uint64_t v18 = 80;
  }
  uint64_t v19 = *(void *)(*(void *)(a1 + 32) + v18);
  if (!v16)
  {
    uint64_t v20 = 0;
    goto LABEL_25;
  }
  uint64_t v20 = *(void **)(v16 + 24);
  if ((*(unsigned char *)(v16 + 16) & 1) == 0)
  {
LABEL_25:
    double v21 = -[UITableViewRowData rectForRow:inSection:heightCanBeGuessed:](v19, [v20 row], objc_msgSend(v20, "section"), 1);
    goto LABEL_27;
  }
  double v21 = -[UITableViewRowData rectForSection:](v19, [v20 section]);
LABEL_27:
  CGFloat v25 = v21;
  CGFloat v26 = v22;
  CGFloat v27 = v23;
  CGFloat v28 = v24;
  if (v17)
  {
    uint64_t v29 = *(void **)(v17 + 24);
    if (*(unsigned char *)(v17 + 16))
    {
      double v30 = -[UITableViewRowData rectForSection:](v19, [*(id *)(v17 + 24) section]);
      goto LABEL_31;
    }
  }
  else
  {
    uint64_t v29 = 0;
  }
  double v30 = -[UITableViewRowData rectForRow:inSection:heightCanBeGuessed:](v19, [v29 row], objc_msgSend(v29, "section"), 1);
LABEL_31:
  CGFloat v34 = v30;
  CGFloat v35 = v31;
  CGFloat v36 = v32;
  CGFloat v37 = v33;
  v39.origin.CGFloat x = v25;
  v39.origin.CGFloat y = v26;
  v39.size.CGFloat width = v27;
  v39.size.CGFloat height = v28;
  double MaxY = CGRectGetMaxY(v39);
  v40.origin.CGFloat x = v34;
  v40.origin.CGFloat y = v35;
  v40.size.CGFloat width = v36;
  v40.size.CGFloat height = v37;
  return MaxY == CGRectGetMinY(v40);
}

id __50___UITableViewUpdateSupport_Private___computeGaps__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a2 row];
  uint64_t v5 = [a2 section];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v21 + 1) + 8 * v10);
        if (v11)
        {
          if (*(_DWORD *)(v11 + 20) == 1) {
            uint64_t v12 = 1;
          }
          else {
            uint64_t v12 = -1;
          }
          uint64_t v13 = *(void **)(v11 + 24);
          uint64_t v14 = objc_msgSend(v13, "section", (void)v21);
          unsigned __int8 v15 = *(unsigned char *)(v11 + 16) & 1;
        }
        else
        {
          uint64_t v14 = objc_msgSend(0, "section", (void)v21);
          uint64_t v13 = 0;
          unsigned __int8 v15 = 0;
          uint64_t v12 = -1;
        }
        if ((v15 & (v14 < v5)) != 0) {
          uint64_t v16 = v12;
        }
        else {
          uint64_t v16 = 0;
        }
        v5 += v16;
        if (v14 == v5)
        {
          if ([v13 row] >= v4) {
            uint64_t v17 = 0;
          }
          else {
            uint64_t v17 = v12;
          }
          v4 += v17;
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v18 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
      uint64_t v8 = v18;
    }
    while (v18);
  }

  uint64_t v19 = [MEMORY[0x1E4F28D58] indexPathForRow:v4 inSection:v5];
  return v19;
}

uint64_t __48___UITableViewUpdateSupport__generateUpdateMaps__block_invoke_2(uint64_t a1, unsigned int a2)
{
  unint64_t v2 = -[UITableViewRowData numberOfRowsInSection:](*(void *)(a1 + 32), a2);
  if (v2 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v3 = v2;
    if (!HIDWORD(v2)) {
      return v3;
    }
    uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
    id v6 = [NSString stringWithUTF8String:"_UIMapIndex _UIMapIndexFromNSInteger(const NSInteger)"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"_UIDataSourceBatchUpdateMap.h", 28, @"NSInteger index is negative or too large: %ld", v3);
  }
  return 0xFFFFFFFFLL;
}

uint64_t __48___UITableViewUpdateSupport__generateUpdateMaps__block_invoke_4(uint64_t a1, unsigned int a2)
{
  unint64_t v2 = -[UITableViewRowData numberOfRowsInSection:](*(void *)(a1 + 32), a2);
  if (v2 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v3 = v2;
    if (!HIDWORD(v2)) {
      return v3;
    }
    uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
    id v6 = [NSString stringWithUTF8String:"_UIMapIndex _UIMapIndexFromNSInteger(const NSInteger)"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"_UIDataSourceBatchUpdateMap.h", 28, @"NSInteger index is negative or too large: %ld", v3);
  }
  return 0xFFFFFFFFLL;
}

void __48___UITableViewUpdateSupport__generateUpdateMaps__block_invoke_2_146(uint64_t a1, uint64_t a2)
{
  v9[2] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 328);
  v8[0] = @"Section";
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:");
  v8[1] = @"UpdateItem";
  v9[0] = v5;
  id v6 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a2];
  v9[1] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];
  [v4 addObject:v7];
}

void __48___UITableViewUpdateSupport__generateUpdateMaps__block_invoke_3_150(uint64_t a1, uint64_t a2)
{
  v9[2] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 336);
  v8[0] = @"Section";
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:");
  v8[1] = @"UpdateItem";
  v9[0] = v5;
  id v6 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a2];
  v9[1] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];
  [v4 addObject:v7];
}

uint64_t __48___UITableViewUpdateSupport__generateUpdateMaps__block_invoke_4_151(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  return [*(id *)(*(void *)(a1 + 32) + 120) addIndex:a4];
}

@end
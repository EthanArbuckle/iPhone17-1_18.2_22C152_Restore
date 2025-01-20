@interface VUIShelfLayoutHelper
- (CGRect)frameForHeaderInSection:(int64_t)a3;
- (CGRect)frameForItemAtIndexPath:(id)a3;
- (UIEdgeInsets)insetForSection:(int64_t)a3;
- (VUIShelfLayoutHelper)initWithShelfViewLayout:(id)a3;
- (VUIShelfViewLayout)shelfViewLayout;
- (double)tallestColumnHeight;
- (double)tallestHeaderHeight;
- (double)tallestInsetBottom;
- (double)tallestInsetTop;
- (int64_t)actualRowCount;
- (void)_compute;
- (void)_freeBuffers;
- (void)dealloc;
@end

@implementation VUIShelfLayoutHelper

- (VUIShelfLayoutHelper)initWithShelfViewLayout:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)VUIShelfLayoutHelper;
  v5 = [(VUIShelfLayoutHelper *)&v8 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_shelfViewLayout, v4);
    [(VUIShelfLayoutHelper *)v6 _compute];
  }

  return v6;
}

- (void)dealloc
{
  [(VUIShelfLayoutHelper *)self _freeBuffers];
  v3.receiver = self;
  v3.super_class = (Class)VUIShelfLayoutHelper;
  [(VUIShelfLayoutHelper *)&v3 dealloc];
}

- (CGRect)frameForHeaderInSection:(int64_t)a3
{
  p_x = (double *)MEMORY[0x1E4F1DB28];
  headerFrames = self->_headerFrames;
  if (headerFrames) {
    p_x = &headerFrames[a3].origin.x;
  }
  double v5 = *p_x;
  double v6 = p_x[1];
  double v7 = p_x[2];
  double v8 = p_x[3];
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (UIEdgeInsets)insetForSection:(int64_t)a3
{
  p_top = (double *)MEMORY[0x1E4FB2848];
  sectionInsets = self->_sectionInsets;
  if (sectionInsets) {
    p_top = &sectionInsets[a3].top;
  }
  double v5 = *p_top;
  double v6 = p_top[1];
  double v7 = p_top[2];
  double v8 = p_top[3];
  result.right = v8;
  result.bottom = v7;
  result.left = v6;
  result.top = v5;
  return result;
}

- (CGRect)frameForItemAtIndexPath:(id)a3
{
  cellFrames = self->_cellFrames;
  if (cellFrames)
  {
    sectionOffsets = self->_sectionOffsets;
    id v5 = a3;
    int64_t v6 = sectionOffsets[[v5 section]];
    uint64_t v7 = [v5 item];

    p_x = &cellFrames[v7 + v6].origin.x;
  }
  else
  {
    p_x = (double *)MEMORY[0x1E4F1DB28];
  }
  double v9 = *p_x;
  double v10 = p_x[1];
  double v11 = p_x[2];
  double v12 = p_x[3];
  result.size.height = v12;
  result.size.width = v11;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

- (void)_compute
{
  v2 = self;
  id v130 = [(VUIShelfLayoutHelper *)self shelfViewLayout];
  objc_super v3 = [v130 collectionView];
  id v4 = [v3 dataSource];
  uint64_t v5 = [v130 delegate];
  char v6 = objc_opt_respondsToSelector();
  char v117 = objc_opt_respondsToSelector();
  char v7 = objc_opt_respondsToSelector();
  v129 = (void *)v5;
  char v116 = objc_opt_respondsToSelector();
  [v3 vuiBounds];
  double v9 = v8;
  [v3 vuiContentInsets];
  double v11 = v10;
  double v13 = v12;
  [v130 itemSize];
  double v15 = v14;
  double v17 = v16;
  unint64_t v18 = [v130 rowCount];
  if (v18 <= 1) {
    int64_t v19 = 1;
  }
  else {
    int64_t v19 = v18;
  }
  uint64_t v126 = [v130 prominentSectionIndex];
  if (v6) {
    int64_t v20 = [v4 numberOfSectionsInCollectionView:v3];
  }
  else {
    int64_t v20 = 1;
  }
  [v130 minimumInteritemSpacing];
  double v118 = v21;
  [v130 minimumLineSpacing];
  double v23 = v22;
  v24 = (int64_t *)malloc_type_calloc(v20 + 1, 8uLL, 0x100004000313F17uLL);
  v25 = v24;
  v124 = v4;
  int64_t v127 = v20;
  double v113 = v11;
  double v114 = v9;
  double v112 = v13;
  if (v20 < 1)
  {
    v115 = 0;
    v24[v20] = 0;
    v54 = (double *)malloc_type_calloc(v19, 8uLL, 0x100004000313F17uLL);
    v122 = 0;
    v123 = 0;
    double v128 = 0.0;
    double v125 = 0.0;
    double v55 = 0.0;
  }
  else
  {
    uint64_t v26 = 0;
    int64_t v27 = 0;
    do
    {
      uint64_t v28 = [v4 collectionView:v3 numberOfItemsInSection:v26];
      v25[v26] = v27;
      v27 += v28;
      ++v26;
    }
    while (v20 != v26);
    v25[v20] = v27;
    v111 = v2;
    if (v27 <= 0) {
      v115 = 0;
    }
    else {
      v115 = (CGRect *)malloc_type_calloc(v27, 0x20uLL, 0x1000040E0EAB150uLL);
    }
    v110 = v25;
    v29 = (CGRect *)malloc_type_calloc(v20, 0x20uLL, 0x1000040E0EAB150uLL);
    v30 = (UIEdgeInsets *)malloc_type_calloc(v20, 0x20uLL, 0x1000040E0EAB150uLL);
    v54 = (double *)malloc_type_calloc(v19, 8uLL, 0x100004000313F17uLL);
    uint64_t v31 = 0;
    double v55 = 0.0;
    v122 = v30;
    v123 = v29;
    double v125 = 0.0;
    p_x = &v29->origin.x;
    double v128 = 0.0;
    v33 = v115;
    do
    {
      uint64_t v34 = objc_msgSend(v124, "collectionView:numberOfItemsInSection:", v3, v31, v110);
      if (v34)
      {
        uint64_t v35 = v34;
        if (v116) {
          [v129 collectionView:v3 layout:v130 insetForSectionAtIndex:v31];
        }
        else {
          [v130 sectionInset];
        }
        double v40 = v36;
        CGFloat v41 = v37;
        double v42 = v38;
        CGFloat v43 = v39;
        if (v117) {
          [v129 collectionView:v3 layout:v130 referenceSizeForHeaderInSection:v31];
        }
        else {
          [v130 headerReferenceSize];
        }
        v30->top = v40;
        v30->left = v41;
        v30->bottom = v42;
        v30->double right = v43;
        ++v30;
        *((void *)p_x + 2) = v44;
        p_x[3] = v45;
        p_x += 4;
        double v46 = v128;
        if (v128 < v40) {
          double v46 = v40;
        }
        double v128 = v46;
        double v47 = v125;
        if (v125 < v42) {
          double v47 = v42;
        }
        double v125 = v47;
        if (v55 < v45) {
          double v55 = v45;
        }
        if (v35 < 1)
        {
          int64_t v20 = v127;
        }
        else
        {
          v119 = p_x;
          v121 = v30;
          uint64_t v48 = 0;
          BOOL v50 = v126 == 0x7FFFFFFFFFFFFFFFLL || v31 == v126;
          do
          {
            v51 = [MEMORY[0x1E4F28D58] indexPathForItem:v48 inSection:v31];
            double v52 = v15;
            double v53 = v17;
            if (v7) {
              objc_msgSend(v129, "collectionView:layout:sizeForItemAtIndexPath:", v3, v130, v51, v15, v17);
            }
            v33->size.width = v52;
            v33->size.height = v53;
            if (v50) {
              v54[v48 % v19] = fmax(v54[v48 % v19], v53);
            }
            ++v33;

            ++v48;
          }
          while (v35 != v48);
          int64_t v20 = v127;
          p_x = v119;
          v30 = v121;
        }
      }
      ++v31;
    }
    while (v31 != v20);
    v25 = v110;
    v2 = v111;
  }
  double v56 = 0.0;
  double v57 = 0.0;
  if (v19 >= 1)
  {
    v58 = v54;
    int64_t v59 = v19;
    do
    {
      double v60 = *v58++;
      double v57 = v57 + v60;
      --v59;
    }
    while (v59);
  }
  if (v55 > 0.0) {
    objc_msgSend(v130, "headerBottomMargin", 0.0);
  }
  double v120 = v55;
  if (v20 >= 1)
  {
    uint64_t v61 = 0;
    double v62 = v57 + v23 * (double)(v19 - 1);
    double v63 = v128 + v55 + v56;
    double v64 = 0.0;
    double v65 = 0.0;
    while (1)
    {
      uint64_t v66 = [v124 collectionView:v3 numberOfItemsInSection:v61];
      if (v66)
      {
        int64_t v67 = v25[v61];
        BOOL v69 = v126 == 0x7FFFFFFFFFFFFFFFLL || v61 == v126;
        v70 = &v122[v61];
        double right = v70->right;
        double v72 = v64 + v70->left;
        v73 = &v123[v61].origin.x;
        double *v73 = v72;
        v73[1] = v128;
        if (v66 >= 1)
        {
          uint64_t v74 = 0;
          uint64_t p_height = (uint64_t)&v115[v67].size.height;
          while (1)
          {
            double v76 = v74 <= 0 ? 0.0 : v118;
            if (v69)
            {
              uint64_t v77 = (uint64_t)fmin((double)v19, (double)(v66 - v74));
            }
            else
            {
              uint64_t v78 = v74;
              if (v66 > v74)
              {
                v79 = (double *)(p_height + 32 * v74);
                double v80 = 0.0;
                uint64_t v78 = v74;
                while (1)
                {
                  double v81 = v78 <= v74 ? 0.0 : v23;
                  double v80 = v80 + v81 + *v79;
                  if (v78 > v74 && v80 > v62) {
                    break;
                  }
                  ++v78;
                  v79 += 4;
                  if (v66 == v78)
                  {
                    uint64_t v78 = v66;
                    break;
                  }
                }
              }
              uint64_t v77 = v78 - v74;
            }
            uint64_t v82 = v77 + v74;
            if (v77 < 1)
            {
              double v86 = 0.0;
              double v84 = 0.0;
            }
            else
            {
              v83 = (double *)(p_height + 32 * v74);
              double v84 = 0.0;
              uint64_t v85 = v74;
              double v86 = 0.0;
              do
              {
                v87 = v83;
                if (v69) {
                  v87 = &v54[v85 % v19];
                }
                double v84 = v84 + *v87;
                double v86 = fmax(v86, *(v83 - 1));
                ++v85;
                v83 += 4;
              }
              while (v85 < v82);
            }
            double v88 = v72 + v76;
            double v89 = v23;
            if (!v69)
            {
              double v89 = 0.0;
              if (v77 > 1) {
                break;
              }
            }
            double v90 = v63;
            if (v77 >= 1) {
              goto LABEL_86;
            }
LABEL_92:
            double v65 = fmax(v65, v90 - v63);
            double v72 = v88 + v86;
            uint64_t v74 = v82;
            if (v82 >= v66)
            {
              double v97 = *v73;
              goto LABEL_95;
            }
          }
          double v89 = floor((v62 - v84) / (double)(v77 - 1));
LABEL_86:
          v91 = (double *)(p_height + 32 * v74);
          uint64_t v92 = v74;
          double v90 = v63;
          do
          {
            double v93 = -0.0;
            if (v92 > v74) {
              double v93 = v89;
            }
            v94 = v91;
            if (v69) {
              v94 = &v54[v92 % v19];
            }
            double v95 = v90 + v93;
            double v96 = *v94;
            *(v91 - 3) = v88 + floor((v86 - *(v91 - 1)) * 0.5);
            *(v91 - 2) = v95;
            double v90 = v95 + v96;
            ++v92;
            v91 += 4;
          }
          while (v92 < v82);
          goto LABEL_92;
        }
        double v97 = v72;
LABEL_95:
        double v98 = v114 - (v113 + v112);
        if (v72 >= v98 || v61 != v20 - 1) {
          double v98 = v72;
        }
        double v101 = v73[2];
        v100 = v73 + 2;
        double v102 = v101;
        double v103 = v97 + v101;
        if (v103 > v98) {
          double *v100 = v102 - (v103 - v98);
        }
        double v64 = right + v72;
      }
      if (++v61 == v127) {
        goto LABEL_106;
      }
    }
  }
  double v65 = 0.0;
LABEL_106:
  if (v19 < 1)
  {
    int64_t v104 = 0;
    int64_t v106 = v127;
    double v107 = v120;
  }
  else
  {
    int64_t v104 = 0;
    double v105 = 0.0;
    int64_t v106 = v127;
    double v107 = v120;
    while (1)
    {
      double v108 = v104 ? v23 : 0.0;
      double v105 = v105 + v108 + v54[v104];
      if (v105 >= v65) {
        break;
      }
      if (v19 == ++v104)
      {
        int64_t v104 = v19;
        break;
      }
    }
  }
  int64_t v109 = v104 + 1;
  free(v54);
  [(VUIShelfLayoutHelper *)v2 _freeBuffers];
  v2->_sectionCount = v106;
  v2->_sectionOffsets = v25;
  v2->_cellFrames = v115;
  v2->_headerFrames = v123;
  v2->_sectionInsets = v122;
  v2->_actualRowCount = v109;
  v2->_tallestInsetTop = v128;
  v2->_tallestInsetBottom = v125;
  v2->_tallestHeaderHeight = v107;
  v2->_tallestColumnHeight = v65;
}

- (void)_freeBuffers
{
  sectionOffsets = self->_sectionOffsets;
  if (sectionOffsets)
  {
    free(sectionOffsets);
    self->_sectionOffsets = 0;
  }
  cellFrames = self->_cellFrames;
  if (cellFrames)
  {
    free(cellFrames);
    self->_cellFrames = 0;
  }
  headerFrames = self->_headerFrames;
  if (headerFrames)
  {
    free(headerFrames);
    self->_headerFrames = 0;
  }
  sectionInsets = self->_sectionInsets;
  if (sectionInsets)
  {
    free(sectionInsets);
    self->_sectionInsets = 0;
  }
}

- (VUIShelfViewLayout)shelfViewLayout
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_shelfViewLayout);
  return (VUIShelfViewLayout *)WeakRetained;
}

- (int64_t)actualRowCount
{
  return self->_actualRowCount;
}

- (double)tallestInsetTop
{
  return self->_tallestInsetTop;
}

- (double)tallestInsetBottom
{
  return self->_tallestInsetBottom;
}

- (double)tallestHeaderHeight
{
  return self->_tallestHeaderHeight;
}

- (double)tallestColumnHeight
{
  return self->_tallestColumnHeight;
}

- (void).cxx_destruct
{
}

@end
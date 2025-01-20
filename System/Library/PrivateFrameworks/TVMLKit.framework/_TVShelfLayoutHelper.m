@interface _TVShelfLayoutHelper
- (CGRect)frameForHeaderInSection:(int64_t)a3;
- (CGRect)frameForItemAtIndexPath:(id)a3;
- (UIEdgeInsets)insetForSection:(int64_t)a3;
- (_TVShelfLayoutHelper)initWithShelfViewLayout:(id)a3;
- (_TVShelfViewLayout)shelfViewLayout;
- (double)tallestColumnHeight;
- (double)tallestHeaderHeight;
- (double)tallestInsetBottom;
- (double)tallestInsetTop;
- (int64_t)actualRowCount;
- (void)_compute;
- (void)_freeBuffers;
- (void)dealloc;
@end

@implementation _TVShelfLayoutHelper

- (_TVShelfLayoutHelper)initWithShelfViewLayout:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_TVShelfLayoutHelper;
  v5 = [(_TVShelfLayoutHelper *)&v8 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_shelfViewLayout, v4);
    [(_TVShelfLayoutHelper *)v6 _compute];
  }

  return v6;
}

- (void)dealloc
{
  [(_TVShelfLayoutHelper *)self _freeBuffers];
  v3.receiver = self;
  v3.super_class = (Class)_TVShelfLayoutHelper;
  [(_TVShelfLayoutHelper *)&v3 dealloc];
}

- (CGRect)frameForHeaderInSection:(int64_t)a3
{
  p_x = (double *)MEMORY[0x263F001A8];
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
  p_top = (double *)MEMORY[0x263F1D1C0];
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
    p_x = (double *)MEMORY[0x263F001A8];
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
  uint64_t v135 = *MEMORY[0x263EF8340];
  v130 = [(_TVShelfLayoutHelper *)self shelfViewLayout];
  objc_super v3 = [v130 collectionView];
  id v4 = [v3 dataSource];
  id v5 = [v3 delegate];
  if ([v5 conformsToProtocol:&unk_26E5D4D38])
  {
    uint64_t v6 = [v3 delegate];
  }
  else
  {
    uint64_t v6 = 0;
  }

  char v7 = objc_opt_respondsToSelector();
  char v116 = objc_opt_respondsToSelector();
  char v132 = objc_opt_respondsToSelector();
  char v115 = objc_opt_respondsToSelector();
  [v3 bounds];
  double v113 = v8;
  [v3 contentInset];
  double v111 = v10;
  double v112 = v9;
  [v130 itemSize];
  double v12 = v11;
  double v14 = v13;
  unint64_t v15 = [v130 rowCount];
  if (v15 <= 1) {
    int64_t v16 = 1;
  }
  else {
    int64_t v16 = v15;
  }
  uint64_t v125 = [v130 prominentSectionIndex];
  v123 = v4;
  if (v7) {
    int64_t v17 = [v4 numberOfSectionsInCollectionView:v3];
  }
  else {
    int64_t v17 = 1;
  }
  [v130 minimumInteritemSpacing];
  double v117 = v18;
  [v130 minimumLineSpacing];
  double v20 = v19;
  v21 = (int64_t *)malloc_type_calloc(v17 + 1, 8uLL, 0x100004000313F17uLL);
  v22 = v21;
  v129 = (void *)v6;
  int64_t v127 = v17;
  v122 = v21;
  if (v17 < 1)
  {
    v114 = 0;
    v21[v17] = 0;
    v54 = (double *)malloc_type_calloc(v16, 8uLL, 0x100004000313F17uLL);
    v120 = 0;
    v121 = 0;
    double v126 = 0.0;
    double v124 = 0.0;
    double v55 = 0.0;
  }
  else
  {
    uint64_t v23 = 0;
    int64_t v24 = 0;
    do
    {
      uint64_t v25 = [v4 collectionView:v3 numberOfItemsInSection:v23];
      v22[v23] = v24;
      v24 += v25;
      ++v23;
    }
    while (v17 != v23);
    v22[v17] = v24;
    if (v24 <= 0) {
      v114 = 0;
    }
    else {
      v114 = (CGRect *)malloc_type_calloc(v24, 0x20uLL, 0x1000040E0EAB150uLL);
    }
    v26 = (void *)v6;
    v27 = (CGRect *)malloc_type_calloc(v17, 0x20uLL, 0x1000040E0EAB150uLL);
    v28 = (UIEdgeInsets *)malloc_type_calloc(v17, 0x20uLL, 0x1000040E0EAB150uLL);
    v54 = (double *)malloc_type_calloc(v16, 8uLL, 0x100004000313F17uLL);
    uint64_t v29 = 0;
    double v55 = 0.0;
    v120 = v28;
    v121 = v27;
    v30 = v27;
    v31 = v114;
    double v124 = 0.0;
    double v126 = 0.0;
    v131 = v3;
    do
    {
      uint64_t v32 = [v123 collectionView:v3 numberOfItemsInSection:v29];
      if (v32)
      {
        uint64_t v33 = v32;
        if (v115) {
          [v26 collectionView:v131 layout:v130 insetForSectionAtIndex:v29];
        }
        else {
          [v130 sectionInset];
        }
        double v38 = v34;
        CGFloat v39 = v35;
        double v40 = v36;
        CGFloat v41 = v37;
        if (v116) {
          [v26 collectionView:v131 layout:v130 referenceSizeForHeaderInSection:v29];
        }
        else {
          [v130 headerReferenceSize];
        }
        v28->top = v38;
        v28->left = v39;
        v28->bottom = v40;
        v28->double right = v41;
        ++v28;
        v30->size.width = v42;
        v30->size.height = v43;
        ++v30;
        double v44 = v126;
        if (v126 < v38) {
          double v44 = v38;
        }
        double v126 = v44;
        double v45 = v124;
        if (v124 < v40) {
          double v45 = v40;
        }
        double v124 = v45;
        if (v55 < v43) {
          double v55 = v43;
        }
        if (v33 >= 1)
        {
          v118 = v30;
          v119 = v28;
          uint64_t v46 = 0;
          BOOL v48 = v125 == 0x7FFFFFFFFFFFFFFFLL || v29 == v125;
          do
          {
            v49 = [MEMORY[0x263F088C8] indexPathForItem:v46 inSection:v29];
            double v50 = v12;
            double v51 = v14;
            if (v132) {
              objc_msgSend(v129, "collectionView:layout:sizeForItemAtIndexPath:", v131, v130, v49, v12, v14);
            }
            if (fabs(v50) == INFINITY || (double v52 = fabs(v51), v52 >= INFINITY) && v52 <= INFINITY)
            {
              v53 = TVMLKitLogObject;
              if (os_log_type_enabled((os_log_t)TVMLKitLogObject, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v134 = v49;
                _os_log_impl(&dword_230B4C000, v53, OS_LOG_TYPE_DEFAULT, "shelf cell size not finite for %@, skipping", buf, 0xCu);
              }
            }
            else
            {
              v31->size.width = v50;
              v31->size.height = v51;
              if (v48) {
                v54[v46 % v16] = fmax(v54[v46 % v16], v51);
              }
            }

            ++v46;
            ++v31;
          }
          while (v33 != v46);
          v26 = v129;
          v30 = v118;
          v28 = v119;
        }
      }
      ++v29;
      objc_super v3 = v131;
    }
    while (v29 != v127);
    int64_t v17 = v127;
  }
  double v56 = 0.0;
  double v57 = 0.0;
  if (v16 >= 1)
  {
    v58 = v54;
    int64_t v59 = v16;
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
  double v128 = v55;
  if (v17 >= 1)
  {
    uint64_t v61 = 0;
    double v62 = v57 + v20 * (double)(v16 - 1);
    double v63 = v126 + v55 + v56;
    double v64 = 0.0;
    double v65 = 0.0;
    while (1)
    {
      uint64_t v66 = [v123 collectionView:v3 numberOfItemsInSection:v61];
      if (v66)
      {
        int64_t v67 = v122[v61];
        BOOL v69 = v125 == 0x7FFFFFFFFFFFFFFFLL || v61 == v125;
        v70 = &v120[v61];
        double right = v70->right;
        double v72 = v64 + v70->left;
        p_x = &v121[v61].origin.x;
        double *p_x = v72;
        p_x[1] = v126;
        if (v66 >= 1)
        {
          uint64_t v74 = 0;
          uint64_t p_height = (uint64_t)&v114[v67].size.height;
          while (1)
          {
            double v76 = v74 <= 0 ? 0.0 : v117;
            if (v69)
            {
              uint64_t v77 = (uint64_t)fmin((double)v16, (double)(v66 - v74));
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
                  double v81 = v78 <= v74 ? 0.0 : v20;
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
                  v87 = &v54[v85 % v16];
                }
                double v84 = v84 + *v87;
                double v86 = fmax(v86, *(v83 - 1));
                ++v85;
                v83 += 4;
              }
              while (v85 < v82);
            }
            double v88 = v72 + v76;
            double v89 = v20;
            if (!v69)
            {
              double v89 = 0.0;
              if (v77 > 1) {
                break;
              }
            }
            double v90 = v63;
            if (v77 >= 1) {
              goto LABEL_93;
            }
LABEL_99:
            double v65 = fmax(v65, v90 - v63);
            double v72 = v88 + v86;
            uint64_t v74 = v82;
            if (v82 >= v66)
            {
              double v97 = *p_x;
              goto LABEL_102;
            }
          }
          double v89 = floor((v62 - v84) / (double)(v77 - 1));
LABEL_93:
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
              v94 = &v54[v92 % v16];
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
          goto LABEL_99;
        }
        double v97 = v72;
LABEL_102:
        double v98 = v113 - (v112 + v111);
        if (v72 >= v98 || v61 != v17 - 1) {
          double v98 = v72;
        }
        double v101 = p_x[2];
        v100 = p_x + 2;
        double v102 = v101;
        double v103 = v97 + v101;
        if (v103 > v98) {
          double *v100 = v102 - (v103 - v98);
        }
        double v64 = right + v72;
      }
      if (++v61 == v127) {
        goto LABEL_113;
      }
    }
  }
  double v65 = 0.0;
LABEL_113:
  if (v16 < 1)
  {
    int64_t v104 = 0;
    v106 = v129;
    int64_t v107 = v127;
    double v108 = v128;
  }
  else
  {
    int64_t v104 = 0;
    double v105 = 0.0;
    v106 = v129;
    int64_t v107 = v127;
    double v108 = v128;
    while (1)
    {
      double v109 = v104 ? v20 : 0.0;
      double v105 = v105 + v109 + v54[v104];
      if (v105 >= v65) {
        break;
      }
      if (v16 == ++v104)
      {
        int64_t v104 = v16;
        break;
      }
    }
  }
  int64_t v110 = v104 + 1;
  free(v54);
  [(_TVShelfLayoutHelper *)self _freeBuffers];
  self->_sectionCount = v107;
  self->_sectionOffsets = v122;
  self->_cellFrames = v114;
  self->_headerFrames = v121;
  self->_sectionInsets = v120;
  self->_actualRowCount = v110;
  self->_tallestInsetTop = v126;
  self->_tallestInsetBottom = v124;
  self->_tallestHeaderHeight = v108;
  self->_tallestColumnHeight = v65;
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

- (_TVShelfViewLayout)shelfViewLayout
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_shelfViewLayout);
  return (_TVShelfViewLayout *)WeakRetained;
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
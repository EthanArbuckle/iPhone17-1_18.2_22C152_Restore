@interface _UIFlowLayoutSection
- (_UIFlowLayoutItem)addItem;
- (_UIFlowLayoutRow)addRowAtEnd:(void *)a1;
- (_UIFlowLayoutSection)init;
- (double)effectiveFooterFrameWithSectionMarginsApplied;
- (double)effectiveHeaderFrameWithSectionMarginsApplied;
- (double)frameForItemAtIndexPath:(uint64_t)a1;
- (uint64_t)addInvalidatedIndexPath:(uint64_t)a1;
- (uint64_t)computeLayout;
- (void)computeLayoutInRect:(unsigned int)a3 forSection:(void *)a4 invalidating:(CGFloat)a5 invalidationContext:(CGFloat)a6;
- (void)logInvalidSizes;
- (void)logInvalidSizesForHorizontalDirection:(int)a3 warnAboutDelegateValues:;
- (void)setEstimatedSize:(double)a3 forSection:(double)a4;
- (void)setFooterDimension:(double)a3 forSection:;
- (void)setHeaderDimension:(double)a3 forSection:;
- (void)updateEstimatedSizeForSection:(uint64_t)a1;
@end

@implementation _UIFlowLayoutSection

- (_UIFlowLayoutItem)addItem
{
  if (a1)
  {
    v2 = objc_alloc_init(_UIFlowLayoutItem);
    v3 = v2;
    if (v2) {
      objc_storeWeak((id *)&v2->_section, a1);
    }
    [a1[12] addObject:v3];
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)setEstimatedSize:(double)a3 forSection:(double)a4
{
  if (a1)
  {
    if (*(double *)(a1 + 328) == a3 && *(double *)(a1 + 336) == a4)
    {
      *(double *)(a1 + 328) = a3;
      *(double *)(a1 + 336) = a4;
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 144));
      v10 = WeakRetained;
      if (WeakRetained && *((unsigned char *)WeakRetained + 97)) {
        double v11 = a3 - CGRectGetWidth(*(CGRect *)(a1 + 312));
      }
      else {
        double v11 = a4 - CGRectGetHeight(*(CGRect *)(a1 + 312));
      }

      *(double *)(a1 + 328) = a3;
      *(double *)(a1 + 336) = a4;
      id v12 = objc_loadWeakRetained((id *)(a1 + 144));
      -[_UIFlowLayoutInfo didUpdateSizeForSection:withDelta:]((uint64_t)v12, a2, v11);
    }
  }
}

- (void)setHeaderDimension:(double)a3 forSection:
{
  if (a1)
  {
    double v4 = a3 - *(double *)(a1 + 128);
    *(double *)(a1 + 128) = a3;
    if (v4 != 0.0)
    {
      double v6 = *(double *)(a1 + 328);
      double v7 = *(double *)(a1 + 336);
      id WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 144));
      if (WeakRetained && (int v9 = WeakRetained[97], WeakRetained, v9)) {
        double v6 = v4 + v6;
      }
      else {
        double v7 = v4 + v7;
      }
      [(_UIFlowLayoutSection *)a1 setEstimatedSize:v6 forSection:v7];
    }
  }
}

- (void)setFooterDimension:(double)a3 forSection:
{
  if (a1)
  {
    double v4 = a3 - *(double *)(a1 + 136);
    *(double *)(a1 + 136) = a3;
    if (v4 != 0.0)
    {
      double v6 = *(double *)(a1 + 328);
      double v7 = *(double *)(a1 + 336);
      id WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 144));
      if (WeakRetained && (int v9 = WeakRetained[97], WeakRetained, v9)) {
        double v6 = v4 + v6;
      }
      else {
        double v7 = v4 + v7;
      }
      [(_UIFlowLayoutSection *)a1 setEstimatedSize:v6 forSection:v7];
    }
  }
}

- (_UIFlowLayoutSection)init
{
  v13.receiver = self;
  v13.super_class = (Class)_UIFlowLayoutSection;
  v2 = [(_UIFlowLayoutSection *)&v13 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    items = v2->_items;
    v2->_items = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    rows = v2->_rows;
    v2->_rows = v5;

    __asm { FMOV            V0.2D, #10.0 }
    *(_OWORD *)&v2->_lineSpacing = _Q0;
  }
  return v2;
}

- (uint64_t)computeLayout
{
  uint64_t v142 = *MEMORY[0x1E4F143B8];
  if (!result) {
    return result;
  }
  uint64_t v1 = result;
  v2 = (id *)(result + 144);
  id WeakRetained = objc_loadWeakRetained((id *)(result + 144));
  if (WeakRetained) {
    BOOL v4 = WeakRetained[97] != 0;
  }
  else {
    BOOL v4 = 0;
  }

  v5 = (double *)objc_loadWeakRetained(v2);
  if (v5) {
    double v6 = v5[14];
  }
  else {
    double v6 = 0.0;
  }

  double v7 = (id *)objc_loadWeakRetained(v2);
  v8 = v7;
  if (v7) {
    id v9 = objc_loadWeakRetained(v7 + 15);
  }
  else {
    id v9 = 0;
  }
  v10 = [v9 collectionView];
  if ([v10 _shouldReverseLayoutDirection])
  {
    double v11 = (id *)objc_loadWeakRetained(v2);
    id v12 = v11;
    if (v11) {
      id v13 = objc_loadWeakRetained(v11 + 15);
    }
    else {
      id v13 = 0;
    }
    int v14 = [v13 _wantsRightToLeftHorizontalMirroringIfNeeded];
  }
  else
  {
    int v14 = 1;
  }

  if (*(unsigned char *)(v1 + 88))
  {
    double v15 = *(double *)(v1 + 112);
    double v16 = *(double *)(v1 + 120);
    v17 = (void *)(v1 + 344);
    double v18 = *(double *)(v1 + 128);
    if (v4)
    {
      double v19 = *(double *)(v1 + 296);
      double v20 = *(double *)(v1 + 280);
      double v6 = v6 - (v20 + v19);
      *(double *)(v1 + 152) = v18 + *(double *)(v1 + 288);
      double v21 = *(double *)(v1 + 256);
      double v135 = v6;
      double v131 = *(double *)(v1 + 248);
      if (v18 > 0.0)
      {
        v22 = objc_loadWeakRetained(v2);
        uint64_t v23 = 0;
        if (v22) {
          uint64_t v23 = v22[14];
        }
        double v130 = 0.0;
        void *v17 = 0;
        *(void *)(v1 + 352) = 0;
        *(double *)(v1 + 360) = v18;
        *(void *)(v1 + 368) = v23;
LABEL_24:

        goto LABEL_27;
      }
      long long v28 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
      *(_OWORD *)v17 = *MEMORY[0x1E4F1DB28];
      *(_OWORD *)(v1 + 360) = v28;
      double v130 = 0.0;
    }
    else
    {
      double v19 = *(double *)(v1 + 304);
      double v20 = *(double *)(v1 + 288);
      double v6 = v6 - (v20 + v19);
      *(double *)(v1 + 152) = v18 + *(double *)(v1 + 280);
      double v21 = *(double *)(v1 + 248);
      double v130 = v6;
      double v131 = *(double *)(v1 + 256);
      if (v18 > 0.0)
      {
        v22 = objc_loadWeakRetained(v2);
        uint64_t v26 = 0;
        if (v22) {
          uint64_t v26 = v22[14];
        }
        double v135 = 0.0;
        uint64_t v27 = *(void *)(v1 + 128);
        void *v17 = 0;
        *(void *)(v1 + 352) = 0;
        *(void *)(v1 + 360) = v26;
        *(void *)(v1 + 368) = v27;
        goto LABEL_24;
      }
      long long v29 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
      *(_OWORD *)v17 = *MEMORY[0x1E4F1DB28];
      *(_OWORD *)(v1 + 360) = v29;
      double v135 = 0.0;
    }
LABEL_27:
    double v30 = *(double *)(v1 + 152);
    uint64_t v31 = *(void *)(v1 + 208);
    if (v31 >= 1)
    {
      if (v21 > v6)
      {
        -[_UIFlowLayoutSection logInvalidSizesForHorizontalDirection:warnAboutDelegateValues:](v1, v4, 0);
        uint64_t v31 = *(void *)(v1 + 208);
      }
      double v32 = v16 + v21;
      uint64_t v33 = vcvtmd_s64_f64((v16 + v6) / (v16 + v21));
      if ((unint64_t)v33 <= 1) {
        uint64_t v33 = 1;
      }
      uint64_t v34 = v31 / v33;
      *(void *)(v1 + 216) = v33;
      *(void *)(v1 + 224) = -1;
      uint64_t v35 = v31 % v33;
      *(unsigned char *)(v1 + 89) = v31 % v33 != 0;
      if (v31 % v33) {
        *(void *)(v1 + 224) = v34++;
      }
      switch(*(_DWORD *)(v1 + 232))
      {
        case 0:
          *(double *)(v1 + 176) = v16;
          *(double *)(v1 + 160) = v20;
          v36 = (double *)objc_loadWeakRetained(v2);
          if (v36) {
            double v37 = v36[14];
          }
          else {
            double v37 = 0.0;
          }
          double v38 = v37 - v20 - (v32 * (double)*(uint64_t *)(v1 + 216) - v16);
          goto LABEL_47;
        case 1:
          *(double *)(v1 + 176) = v16;
          v44 = (double *)objc_loadWeakRetained(v2);
          if (v44) {
            double v45 = v44[14];
          }
          else {
            double v45 = 0.0;
          }
          *(double *)(v1 + 160) = v20 + (v45 - (v19 + v20 + v32 * (double)*(uint64_t *)(v1 + 216) - v16)) * 0.5;

          *(void *)(v1 + 168) = *(void *)(v1 + 160);
          break;
        case 2:
          *(double *)(v1 + 176) = v16;
          v39 = (double *)objc_loadWeakRetained(v2);
          if (v39) {
            double v40 = v39[14];
          }
          else {
            double v40 = 0.0;
          }
          *(double *)(v1 + 160) = v40 - v19 - (v32 * (double)*(uint64_t *)(v1 + 216) - v16);

          *(double *)(v1 + 168) = v19;
          break;
        case 3:
          if (v33 > 1)
          {
            v46 = (double *)objc_loadWeakRetained(v2);
            if (v46) {
              double v47 = v46[14];
            }
            else {
              double v47 = 0.0;
            }
            *(double *)(v1 + 176) = (v47 - v20 - v19 - v21 * (double)*(uint64_t *)(v1 + 216))
                                  / (double)(*(void *)(v1 + 216) - 1);

            *(double *)(v1 + 160) = v20;
            *(double *)(v1 + 168) = v19;
          }
          else
          {
            *(double *)(v1 + 176) = v16;
            v41 = (double *)objc_loadWeakRetained(v2);
            double v42 = 0.0;
            if (v41) {
              double v42 = v41[14];
            }
            *(double *)(v1 + 160) = v20 + (v42 - v21 - v20 - v19) * 0.5;

            v36 = (double *)objc_loadWeakRetained(v2);
            double v43 = 0.0;
            if (v36) {
              double v43 = v36[14];
            }
            double v38 = v19 + (v43 - v21 - v20 - v19) * 0.5;
LABEL_47:
            *(double *)(v1 + 168) = v38;
          }
          break;
        default:
          *(double *)(v1 + 176) = v16;
          *(double *)(v1 + 160) = v20;
          break;
      }
      if (*(unsigned char *)(v1 + 89))
      {
        switch(*(_DWORD *)(v1 + 236))
        {
          case 1:
            *(double *)(v1 + 200) = v16;
            v48 = (double *)objc_loadWeakRetained(v2);
            if (v48) {
              double v54 = v48[14];
            }
            else {
              double v54 = 0.0;
            }
            double v50 = v20 + (v54 - (v19 + v20 + v32 * (double)v35 - v16)) * 0.5;
            goto LABEL_70;
          case 2:
            *(double *)(v1 + 200) = v16;
            v48 = (double *)objc_loadWeakRetained(v2);
            if (v48) {
              double v49 = v48[14];
            }
            else {
              double v49 = 0.0;
            }
            double v50 = v49 - v19 - (v32 * (double)v35 - v16);
LABEL_70:
            *(double *)(v1 + 184) = v50;
            goto LABEL_71;
          case 3:
            if (v35 > 1)
            {
              v55 = (double *)objc_loadWeakRetained(v2);
              if (v55) {
                double v56 = v55[14];
              }
              else {
                double v56 = 0.0;
              }
              *(double *)(v1 + 200) = (v56 - (v32 * (double)v35 - v16) - v20 - v19) / (double)(v35 - 1);

LABEL_75:
              *(double *)(v1 + 184) = v20;
            }
            else
            {
              *(double *)(v1 + 200) = v16;
              v51 = (double *)objc_loadWeakRetained(v2);
              double v52 = 0.0;
              double v53 = 0.0;
              if (v51) {
                double v53 = v51[14];
              }
              *(double *)(v1 + 184) = v20 + (v53 - v21 - v20 - v19) * 0.5;

              v48 = (double *)objc_loadWeakRetained(v2);
              if (v48) {
                double v52 = v48[14];
              }
              *(double *)(v1 + 168) = v19 + (v52 - v21 - v20 - v19) * 0.5;
LABEL_71:
            }
            break;
          default:
            *(double *)(v1 + 200) = v16;
            goto LABEL_75;
        }
      }
      double v30 = v30 + (v15 + v131) * (double)v34 - v15;
    }
    double v57 = *(double *)(v1 + 136);
    v58 = (_OWORD *)(v1 + 376);
    if (v4)
    {
      double v59 = v30 + *(double *)(v1 + 304);
      if (v57 <= 0.0)
      {
        long long v66 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
        _OWORD *v58 = *MEMORY[0x1E4F1DB28];
        *(_OWORD *)(v1 + 392) = v66;
        double v25 = v135;
      }
      else
      {
        v60 = objc_loadWeakRetained(v2);
        double v25 = v135;
        if (v60) {
          uint64_t v61 = v60[14];
        }
        else {
          uint64_t v61 = 0;
        }
        *(double *)(v1 + 376) = v59;
        *(void *)(v1 + 384) = 0;
        *(double *)(v1 + 392) = v57;
        *(void *)(v1 + 400) = v61;

        double v59 = v59 + *(double *)(v1 + 136);
      }
      v67 = (double *)objc_loadWeakRetained(v2);
      if (v67) {
        double v62 = v67[14];
      }
      else {
        double v62 = 0.0;
      }
      double v24 = v59;
    }
    else
    {
      double v62 = v30 + *(double *)(v1 + 296);
      if (v57 <= 0.0)
      {
        long long v68 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
        _OWORD *v58 = *MEMORY[0x1E4F1DB28];
        *(_OWORD *)(v1 + 392) = v68;
        double v24 = v130;
      }
      else
      {
        v63 = objc_loadWeakRetained(v2);
        double v24 = v130;
        if (v63) {
          uint64_t v64 = v63[14];
        }
        else {
          uint64_t v64 = 0;
        }
        uint64_t v65 = *(void *)(v1 + 136);
        *(void *)(v1 + 376) = 0;
        *(double *)(v1 + 384) = v62;
        *(void *)(v1 + 392) = v64;
        *(void *)(v1 + 400) = v65;

        double v62 = v62 + *(double *)(v1 + 136);
      }
      v67 = (double *)objc_loadWeakRetained(v2);
      if (v67) {
        double v59 = v67[14];
      }
      else {
        double v59 = 0.0;
      }
      double v25 = v62;
    }
    *(void *)(v1 + 312) = 0;
    *(void *)(v1 + 320) = 0;
    *(double *)(v1 + 328) = v59;
    *(double *)(v1 + 336) = v62;

    if (*(unsigned char *)(v1 + 88)) {
      goto LABEL_171;
    }
    goto LABEL_95;
  }
  double v24 = 0.0;
  double v25 = 0.0;
LABEL_95:
  double v69 = *(double *)(v1 + 128);
  v70 = (_OWORD *)(v1 + 344);
  v134 = v2;
  int v133 = v14;
  if (v4)
  {
    double v71 = *(double *)(v1 + 288);
    double v25 = v6 - (*(double *)(v1 + 280) + *(double *)(v1 + 296));
    double v72 = *(double *)(v1 + 112);
    double v73 = *(double *)(v1 + 120);
    if (v69 <= 0.0)
    {
      long long v79 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
      _OWORD *v70 = *MEMORY[0x1E4F1DB28];
      *(_OWORD *)(v1 + 360) = v79;
    }
    else
    {
      v74 = objc_loadWeakRetained(v2);
      if (v74) {
        uint64_t v75 = v74[14];
      }
      else {
        uint64_t v75 = 0;
      }
      *(void *)v70 = 0;
      *(void *)(v1 + 352) = 0;
      *(double *)(v1 + 360) = v69;
      *(void *)(v1 + 368) = v75;
    }
    double v80 = v25;
  }
  else
  {
    double v71 = *(double *)(v1 + 280);
    double v24 = v6 - (*(double *)(v1 + 288) + *(double *)(v1 + 304));
    double v73 = *(double *)(v1 + 112);
    double v72 = *(double *)(v1 + 120);
    if (v69 <= 0.0)
    {
      long long v81 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
      _OWORD *v70 = *MEMORY[0x1E4F1DB28];
      *(_OWORD *)(v1 + 360) = v81;
    }
    else
    {
      v76 = objc_loadWeakRetained(v2);
      if (v76) {
        uint64_t v77 = v76[14];
      }
      else {
        uint64_t v77 = 0;
      }
      uint64_t v78 = *(void *)(v1 + 128);
      *(void *)v70 = 0;
      *(void *)(v1 + 352) = 0;
      *(void *)(v1 + 360) = v77;
      *(void *)(v1 + 368) = v78;
    }
    double v80 = v24;
  }
  double v136 = v25;
  [*(id *)(v1 + 104) removeAllObjects];
  uint64_t v82 = [*(id *)(v1 + 96) count];
  int v83 = 1;
  if (v82 < 1)
  {
    uint64_t v85 = 0;
    v98 = 0;
    double v89 = v80;
    goto LABEL_135;
  }
  v84 = (char *)v82;
  double v132 = v71;
  uint64_t v85 = 0;
  v86 = 0;
  if (v4) {
    uint64_t v87 = 56;
  }
  else {
    uint64_t v87 = 48;
  }
  double v88 = v80;
  double v89 = v80;
  BOOL v90 = 1;
  do
  {
    uint64_t v91 = [*(id *)(v1 + 96) objectAtIndexedSubscript:v86];
    v92 = (void *)v91;
    if (v91) {
      double v93 = *(double *)(v91 + v87);
    }
    else {
      double v93 = 0.0;
    }
    if (v93 > v80) {
      -[_UIFlowLayoutSection logInvalidSizesForHorizontalDirection:warnAboutDelegateValues:](v1, v4, 1);
    }
    if (!v85)
    {
      uint64_t v85 = -[_UIFlowLayoutSection addRowAtEnd:]((void *)v1, 1);
    }
    if (v93 <= v88)
    {
      -[_UIFlowLayoutRow addItem:atEnd:]((void *)v85, v92, 1);
      double v96 = v88 - (v72 + v93);
      goto LABEL_130;
    }
    if (v85)
    {
      *(unsigned char *)(v85 + 9) = 1;
      if (!v90) {
        goto LABEL_128;
      }
      v94 = *(void **)(v85 + 40);
    }
    else
    {
      if (!v90)
      {
LABEL_128:
        BOOL v90 = 0;
        goto LABEL_129;
      }
      v94 = 0;
    }
    id v95 = v94;
    BOOL v90 = [v95 count] == 1;

LABEL_129:
    double v96 = v80 - (v72 + v93);
    -[_UIFlowLayoutRow layoutRow](v85);
    v97 = -[_UIFlowLayoutSection addRowAtEnd:]((void *)v1, 1);

    -[_UIFlowLayoutRow addItem:atEnd:](v97, v92, 1);
    uint64_t v85 = (uint64_t)v97;
    double v89 = v88;
LABEL_130:

    ++v86;
    double v88 = v96;
  }
  while (v84 != v86);
  if (!v85)
  {
    int v83 = 1;
    if (!v90)
    {
      int v126 = 0;
      double v71 = v132;
      goto LABEL_177;
    }
    double v80 = v96;
    v98 = 0;
    double v71 = v132;
LABEL_135:
    v84 = v98;
    if ([v84 count] != 1)
    {
      int v126 = 1;
      double v96 = v80;
      goto LABEL_177;
    }

    double v99 = v136;
    if ((v83 & 1) == 0) {
      goto LABEL_137;
    }
    goto LABEL_138;
  }
  *(unsigned char *)(v85 + 20) = *(unsigned char *)(v1 + 88);
  double v71 = v132;
  int v83 = 0;
  if (v90)
  {
    v98 = *(void **)(v85 + 40);
    double v80 = v96;
    goto LABEL_135;
  }
  int v126 = 0;
LABEL_177:
  unint64_t v127 = [*(id *)(v1 + 104) count];
  BOOL v129 = v96 != v89 || v127 < 2;
  if (v126) {

  }
  double v99 = v136;
  if (((v83 | v129) & 1) == 0) {
LABEL_137:
  }
    *(unsigned char *)(v85 + 9) = 1;
LABEL_138:
  double v100 = v69 + v71;
  -[_UIFlowLayoutRow layoutRow](v85);
  long long v139 = 0u;
  long long v140 = 0u;
  long long v137 = 0u;
  long long v138 = 0u;
  id v101 = *(id *)(v1 + 104);
  uint64_t v102 = [v101 countByEnumeratingWithState:&v137 objects:v141 count:16];
  if (v102)
  {
    uint64_t v103 = v102;
    uint64_t v104 = *(void *)v138;
    v105 = v134;
    int v14 = v133;
    do
    {
      uint64_t v106 = 0;
      do
      {
        if (*(void *)v138 != v104) {
          objc_enumerationMutation(v101);
        }
        uint64_t v107 = *(void *)(*((void *)&v137 + 1) + 8 * v106);
        if (v107)
        {
          uint64_t v108 = *(void *)(v107 + 56);
          uint64_t v109 = *(void *)(v107 + 64);
          if (v4) {
            double v110 = *(double *)(v107 + 56);
          }
          else {
            double v110 = *(double *)(v107 + 64);
          }
          if (v4) {
            double v111 = 0.0;
          }
          else {
            double v111 = v100;
          }
          if (v4) {
            double v112 = v100;
          }
          else {
            double v112 = 0.0;
          }
          *(double *)(v107 + 72) = v112;
          *(double *)(v107 + 80) = v111;
          *(void *)(v107 + 88) = v108;
          *(void *)(v107 + 96) = v109;
        }
        else
        {
          double v110 = 0.0;
        }
        double v100 = v100 + v73 + v110;
        ++v106;
      }
      while (v103 != v106);
      uint64_t v113 = [v101 countByEnumeratingWithState:&v137 objects:v141 count:16];
      uint64_t v103 = v113;
    }
    while (v113);
  }
  else
  {
    v105 = v134;
    int v14 = v133;
  }

  double v114 = v100 - v73;
  double v115 = *(double *)(v1 + 136);
  if (v4)
  {
    double v24 = v114 + *(double *)(v1 + 304);
    if (v115 > 0.0)
    {
      v116 = objc_loadWeakRetained(v105);
      if (v116) {
        uint64_t v117 = v116[14];
      }
      else {
        uint64_t v117 = 0;
      }
      *(double *)(v1 + 376) = v24;
      *(void *)(v1 + 384) = 0;
      *(double *)(v1 + 392) = v115;
      *(void *)(v1 + 400) = v117;

      double v24 = v24 + *(double *)(v1 + 136);
      goto LABEL_170;
    }
LABEL_169:
    long long v121 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
    *(_OWORD *)(v1 + 376) = *MEMORY[0x1E4F1DB28];
    *(_OWORD *)(v1 + 392) = v121;
    goto LABEL_170;
  }
  double v99 = v114 + *(double *)(v1 + 296);
  if (v115 <= 0.0) {
    goto LABEL_169;
  }
  v118 = objc_loadWeakRetained(v105);
  if (v118) {
    uint64_t v119 = v118[14];
  }
  else {
    uint64_t v119 = 0;
  }
  uint64_t v120 = *(void *)(v1 + 136);
  *(void *)(v1 + 376) = 0;
  *(double *)(v1 + 384) = v99;
  *(void *)(v1 + 392) = v119;
  *(void *)(v1 + 400) = v120;

  double v99 = v99 + *(double *)(v1 + 136);
LABEL_170:
  *(void *)(v1 + 312) = 0;
  *(void *)(v1 + 320) = 0;
  *(double *)(v1 + 328) = v24;
  *(double *)(v1 + 336) = v99;

LABEL_171:
  if (((v14 | !v4) & 1) == 0)
  {
    double MaxX = CGRectGetMaxX(*(CGRect *)(v1 + 312));
    double v123 = MaxX - CGRectGetWidth(*(CGRect *)(v1 + 344));
    *(double *)(v1 + 344) = v123 - CGRectGetMinX(*(CGRect *)(v1 + 344));
    double v124 = CGRectGetMaxX(*(CGRect *)(v1 + 312));
    double v125 = v124 - CGRectGetWidth(*(CGRect *)(v1 + 376));
    *(double *)(v1 + 376) = v125 - CGRectGetMinX(*(CGRect *)(v1 + 376));
  }
  result = [*(id *)(v1 + 96) count];
  *(void *)(v1 + 264) = 0;
  *(void *)(v1 + 272) = result;
  return result;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_layoutInfo);
  objc_storeStrong((id *)&self->_rows, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_invalidatedIndexPaths, 0);
}

- (void)logInvalidSizesForHorizontalDirection:(int)a3 warnAboutDelegateValues:
{
  NSLog(&cfstr_TheBehaviorOfT.isa);
  if (a2) {
    NSLog(&cfstr_TheItemHeightM.isa);
  }
  else {
    NSLog(&cfstr_TheItemWidthMu.isa);
  }
  if (a3) {
    NSLog(&cfstr_PleaseCheckThe.isa);
  }
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 144));
  double v7 = WeakRetained;
  if (WeakRetained) {
    id v9 = objc_loadWeakRetained(WeakRetained + 15);
  }
  else {
    id v9 = 0;
  }

  v8 = [v9 collectionView];
  NSLog(&cfstr_TheRelevantUic.isa, v9, v8);

  NSLog(&cfstr_MakeASymbolicB.isa);
  UICollectionViewFlowLayoutBreakForInvalidSizes((uint64_t)v9);
}

- (double)frameForItemAtIndexPath:(uint64_t)a1
{
  if (!a1) {
    return 0.0;
  }
  unint64_t v3 = [a2 item];
  unint64_t v4 = *(void *)(a1 + 264);
  BOOL v6 = v3 >= v4;
  unint64_t v5 = v3 - v4;
  BOOL v6 = !v6 || v5 >= *(void *)(a1 + 272);
  if (v6)
  {
    id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 144));
    v8 = WeakRetained;
    if (WeakRetained) {
      id v9 = objc_loadWeakRetained(WeakRetained + 15);
    }
    else {
      id v9 = 0;
    }
    v10 = [v9 collectionView];
    if ([v10 _shouldReverseLayoutDirection])
    {
      double v11 = (id *)objc_loadWeakRetained((id *)(a1 + 144));
      id v12 = v11;
      if (v11) {
        id v13 = objc_loadWeakRetained(v11 + 15);
      }
      else {
        id v13 = 0;
      }
      int v14 = [v13 _wantsRightToLeftHorizontalMirroringIfNeeded];
    }
    else
    {
      int v14 = 1;
    }

    v17 = [*(id *)(a1 + 96) objectAtIndex:v3];
    if (v17)
    {
      CGFloat v19 = v17[4];
      CGFloat v18 = v17[5];
      CGFloat v21 = v17[6];
      CGFloat v20 = v17[7];
    }
    else
    {
      CGFloat v18 = 0.0;
      CGFloat v21 = 0.0;
      CGFloat v20 = 0.0;
      CGFloat v19 = 0.0;
    }

    v22 = *(void **)(a1 + 104);
    if (v3 >= *(void *)(a1 + 264))
    {
      uint64_t v42 = [v22 lastObject];
      double v24 = (double *)v42;
      if (v42) {
        double v43 = *(void **)(v42 + 40);
      }
      else {
        double v43 = 0;
      }
      id v26 = v43;
      unint64_t v44 = [v26 count];
      if (v44 <= 1) {
        unint64_t v45 = 1;
      }
      else {
        unint64_t v45 = v44;
      }
      unint64_t v46 = v3 - (*(void *)(a1 + 264) + *(void *)(a1 + 272));
      uint64_t v34 = v46 / v45;
      if (v24)
      {
        CGFloat v30 = v24[9];
        CGFloat v29 = v24[10];
        CGFloat v32 = v24[11];
        CGFloat v31 = v24[12];
      }
      else
      {
        CGFloat v29 = 0.0;
        CGFloat v32 = 0.0;
        CGFloat v31 = 0.0;
        CGFloat v30 = 0.0;
      }
      uint64_t v33 = v46 % v45;
      double v47 = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 144));
      if (v47)
      {
        int v48 = v47[97];

        if (v48)
        {
          CGFloat v37 = v30;
          CGFloat v38 = v29;
          CGFloat v39 = v32;
          CGFloat v40 = v31;
          if (!v14) {
            goto LABEL_26;
          }
          goto LABEL_37;
        }
      }
      v65.origin.x = v30;
      v65.origin.y = v29;
      v65.size.width = v32;
      v65.size.height = v31;
      CGFloat v54 = CGRectGetMaxY(v65) + *(double *)(a1 + 112);
      v66.origin.x = v30;
      v66.origin.y = v29;
      v66.size.width = v32;
      v66.size.height = v31;
      double v51 = v54 + (CGRectGetHeight(v66) + *(double *)(a1 + 112)) * (double)v34;
      if (v14) {
        goto LABEL_40;
      }
    }
    else
    {
      uint64_t v23 = [v22 firstObject];
      double v24 = (double *)v23;
      if (v23) {
        double v25 = *(void **)(v23 + 40);
      }
      else {
        double v25 = 0;
      }
      id v26 = v25;
      uint64_t v27 = [v26 count];
      unint64_t v28 = *(void *)(a1 + 264) - v3;
      if (v24)
      {
        CGFloat v30 = v24[9];
        CGFloat v29 = v24[10];
        CGFloat v32 = v24[11];
        CGFloat v31 = v24[12];
      }
      else
      {
        CGFloat v29 = 0.0;
        CGFloat v32 = 0.0;
        CGFloat v31 = 0.0;
        CGFloat v30 = 0.0;
      }
      uint64_t v33 = v27 + ~(v28 % v27);
      uint64_t v34 = vcvtpd_s64_f64((double)v28 / (double)v27);
      uint64_t v35 = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 144));
      if (v35)
      {
        int v36 = v35[97];

        if (v36)
        {
          CGFloat v37 = v30;
          CGFloat v38 = v29;
          CGFloat v39 = v32;
          CGFloat v40 = v31;
          if (v14)
          {
LABEL_26:
            double MinX = CGRectGetMinX(*(CGRect *)&v37);
            v59.origin.x = v30;
            v59.origin.y = v29;
            v59.size.width = v32;
            v59.size.height = v31;
            double v16 = MinX - (CGRectGetWidth(v59) + *(double *)(a1 + 120)) * (double)v34;
LABEL_38:
            double v50 = *(double *)(a1 + 280);
            v61.origin.x = v16;
            v61.origin.y = v18;
            v61.size.width = v21;
            v61.size.height = v20;
            double v51 = v50 + (CGRectGetHeight(v61) + *(double *)(a1 + 112)) * (double)v33;
            goto LABEL_43;
          }
LABEL_37:
          CGFloat v49 = CGRectGetMaxX(*(CGRect *)&v37) + *(double *)(a1 + 120);
          v60.origin.x = v30;
          v60.origin.y = v29;
          v60.size.width = v32;
          v60.size.height = v31;
          double v16 = v49 + (CGRectGetWidth(v60) + *(double *)(a1 + 120)) * (double)v34;
          goto LABEL_38;
        }
      }
      v62.origin.x = v30;
      v62.origin.y = v29;
      v62.size.width = v32;
      v62.size.height = v31;
      double MinY = CGRectGetMinY(v62);
      v63.origin.x = v30;
      v63.origin.y = v29;
      v63.size.width = v32;
      v63.size.height = v31;
      double v51 = MinY - (CGRectGetHeight(v63) + *(double *)(a1 + 112)) * (double)v34;
      if (v14)
      {
LABEL_40:
        double v53 = *(double *)(a1 + 288);
        v64.origin.x = v19;
        v64.origin.y = v51;
        v64.size.width = v21;
        v64.size.height = v20;
        double v16 = v53 + (CGRectGetWidth(v64) + *(double *)(a1 + 120)) * (double)v33;
        goto LABEL_43;
      }
    }
    v67.origin.x = v30;
    v67.origin.y = v29;
    v67.size.width = v32;
    v67.size.height = v31;
    double Width = CGRectGetWidth(v67);
    double v56 = *(double *)(a1 + 288);
    v68.origin.x = v19;
    v68.origin.y = v51;
    v68.size.width = v21;
    v68.size.height = v20;
    double v57 = Width - (v56 + (CGRectGetWidth(v68) + *(double *)(a1 + 120)) * (double)v33);
    v69.origin.x = v19;
    v69.origin.y = v51;
    v69.size.width = v21;
    v69.size.height = v20;
    double v16 = v57 - CGRectGetWidth(v69);
LABEL_43:

    uint64_t v15 = [*(id *)(a1 + 96) objectAtIndexedSubscript:v3];
    if (v15)
    {
      *(double *)(v15 + 32) = v16;
      *(double *)(v15 + 40) = v51;
      *(CGFloat *)(v15 + 48) = v21;
      *(CGFloat *)(v15 + 56) = v20;
      *(unsigned char *)(v15 + 8) |= 2u;
    }
    goto LABEL_45;
  }
  uint64_t v15 = [*(id *)(a1 + 96) objectAtIndex:v3];
  if (v15) {
    double v16 = *(double *)(v15 + 32);
  }
  else {
    double v16 = 0.0;
  }
LABEL_45:

  return v16;
}

- (_UIFlowLayoutRow)addRowAtEnd:(void *)a1
{
  unint64_t v4 = objc_alloc_init(_UIFlowLayoutRow);
  unint64_t v5 = v4;
  if (v4) {
    objc_storeWeak((id *)&v4->_section, a1);
  }
  BOOL v6 = (void *)a1[13];
  if (a2) {
    [v6 addObject:v5];
  }
  else {
    [v6 insertObject:v5 atIndex:0];
  }
  return v5;
}

- (void)logInvalidSizes
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 144));
  id v4 = WeakRetained;
  if (WeakRetained) {
    BOOL v3 = *((unsigned char *)WeakRetained + 97) != 0;
  }
  else {
    BOOL v3 = 0;
  }
  -[_UIFlowLayoutSection logInvalidSizesForHorizontalDirection:warnAboutDelegateValues:](a1, v3, 1);
}

- (double)effectiveHeaderFrameWithSectionMarginsApplied
{
  if (!a1) {
    return 0.0;
  }
  double v2 = *(double *)(a1 + 344);
  id WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 144));
  if (WeakRetained && (int v4 = WeakRetained[97], WeakRetained, v4))
  {
    CGRectGetHeight(*(CGRect *)(a1 + 344));
  }
  else
  {
    double v2 = *(double *)(a1 + 288);
    CGRectGetWidth(*(CGRect *)(a1 + 344));
  }
  return v2;
}

- (double)effectiveFooterFrameWithSectionMarginsApplied
{
  if (!a1) {
    return 0.0;
  }
  double v2 = *(double *)(a1 + 376);
  id WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 144));
  if (WeakRetained && (int v4 = WeakRetained[97], WeakRetained, v4))
  {
    CGRectGetHeight(*(CGRect *)(a1 + 376));
  }
  else
  {
    double v2 = *(double *)(a1 + 288);
    CGRectGetWidth(*(CGRect *)(a1 + 376));
  }
  return v2;
}

- (uint64_t)addInvalidatedIndexPath:(uint64_t)a1
{
  int v4 = *(void **)(a1 + 80);
  if (!v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    BOOL v6 = *(void **)(a1 + 80);
    *(void *)(a1 + 80) = v5;

    int v4 = *(void **)(a1 + 80);
  }
  return [v4 addObject:a2];
}

- (void)computeLayoutInRect:(unsigned int)a3 forSection:(void *)a4 invalidating:(CGFloat)a5 invalidationContext:(CGFloat)a6
{
  uint64_t v382 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  uint64_t v12 = a1;
  long long v365 = 0u;
  long long v366 = 0u;
  long long v367 = 0u;
  long long v368 = 0u;
  obuint64_t j = *(id *)(a1 + 80);
  uint64_t v355 = v12;
  v331 = (id *)[obj countByEnumeratingWithState:&v365 objects:v376 count:16];
  if (v331)
  {
    uint64_t v329 = *(void *)v366;
    location = (id *)(v12 + 144);
    v352 = (double *)(v12 + 112);
    v345 = (double *)(v12 + 40);
    v348 = (double *)(v12 + 32);
    v343 = (double *)(v12 + 120);
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v366 != v329) {
          objc_enumerationMutation(obj);
        }
        int v14 = *(void **)(*((void *)&v365 + 1) + 8 * v13);
        uint64_t v15 = objc_msgSend(*(id *)(v12 + 96), "objectAtIndexedSubscript:", objc_msgSend(v14, "item"));
        double v16 = (void *)v15;
        if (v15) {
          id WeakRetained = objc_loadWeakRetained((id *)(v15 + 24));
        }
        else {
          id WeakRetained = 0;
        }
        id v335 = v16;
        id v341 = WeakRetained;
        *(void *)&v372.origin.double x = MEMORY[0x1E4F143A8];
        *(void *)&v372.origin.double y = 3221225472;
        *(void *)&v372.size.width = __61___UIFlowLayoutSection_sizeChangedForItem_atIndexPath_inRow___block_invoke;
        *(void *)&v372.size.height = &unk_1E52E64F0;
        uint64_t v373 = v12;
        CGFloat v18 = objc_loadWeakRetained(location);
        if (v18) {
          BOOL v19 = v18[97] != 0;
        }
        else {
          BOOL v19 = 0;
        }

        uint64_t v20 = [*(id *)(v12 + 104) indexOfObject:v341];
        uint64_t rect = v13;
        if (v341) {
          CGFloat v21 = (void *)*((void *)v341 + 5);
        }
        else {
          CGFloat v21 = 0;
        }
        id v337 = v21;
        uint64_t v22 = [*(id *)(v12 + 104) count];
        uint64_t v23 = (id *)objc_loadWeakRetained(location);
        double v24 = v23;
        if (v23) {
          id v25 = objc_loadWeakRetained(v23 + 15);
        }
        else {
          id v25 = 0;
        }
        id v26 = [v25 collectionView];
        if ([v26 _shouldReverseLayoutDirection])
        {
          uint64_t v27 = (id *)objc_loadWeakRetained(location);
          unint64_t v28 = v27;
          v327 = v14;
          if (v27) {
            id v29 = objc_loadWeakRetained(v27 + 15);
          }
          else {
            id v29 = 0;
          }
          int v30 = [v29 _wantsRightToLeftHorizontalMirroringIfNeeded];

          int v31 = v30;
          uint64_t v12 = v355;
          int v14 = v327;
        }
        else
        {
          int v31 = 1;
        }

        if (v22 >= 1)
        {
          if (!v20)
          {
            uint64_t v53 = [v14 item];
            uint64_t v54 = [v337 indexOfObject:v335];
            uint64_t v55 = *(void *)(v12 + 264);
            if (v53 - v54 == v55)
            {
              if (v55)
              {
                uint64_t v56 = [v337 count];
                uint64_t v57 = *(void *)(v12 + 272) - v56;
                *(void *)(v12 + 264) += v56;
                *(void *)(v12 + 272) = v57;
                if (v341)
                {
                  double v58 = *((double *)v341 + 7);
                  double v59 = *((double *)v341 + 8);
                  if (v19) {
                    goto LABEL_49;
                  }
LABEL_58:
                  v384.origin.double x = *(CGFloat *)(v12 + 16);
                  v384.origin.double y = *(double *)(v12 + 24) + v59 + *(double *)(v12 + 112);
                  *(CGFloat *)(v12 + 24) = v384.origin.y;
                  v384.size.width = *(CGFloat *)(v12 + 32);
                  v384.size.height = *(CGFloat *)(v12 + 40);
                  double Height = CGRectGetHeight(v384);
                  CGRect v65 = v352;
                  double v58 = v59;
                  CGRect v66 = v345;
                }
                else
                {
                  double v59 = 0.0;
                  double v58 = 0.0;
                  if (!v19) {
                    goto LABEL_58;
                  }
LABEL_49:
                  double v60 = *(double *)(v12 + 120);
                  double v61 = v58 - v60;
                  double v62 = v58 + v60;
                  double v63 = -v61;
                  if (!v31) {
                    double v62 = v63;
                  }
                  v383.origin.double y = *(CGFloat *)(v12 + 24);
                  v383.origin.double x = *(double *)(v12 + 16) + v62;
                  *(CGFloat *)(v12 + 16) = v383.origin.x;
                  v383.size.width = *(CGFloat *)(v12 + 32);
                  v383.size.height = *(CGFloat *)(v12 + 40);
                  double Height = CGRectGetWidth(v383);
                  CGRect v65 = v343;
                  CGRect v66 = v348;
                }
                *CGRect v66 = fmax(Height - (v58 + *v65), 0.0);
                memset(&remainder, 0, sizeof(remainder));
                long long v370 = 0u;
                long long v371 = 0u;
                CGRect v67 = v341;
                if (v341) {
                  CGRect v67 = (void *)*((void *)v341 + 5);
                }
                id v68 = v67;
                uint64_t v69 = [v68 countByEnumeratingWithState:&remainder objects:&slice count:16];
                if (v69)
                {
                  uint64_t v70 = v69;
                  uint64_t v71 = **(void **)&remainder.size.width;
                  do
                  {
                    for (uint64_t i = 0; i != v70; ++i)
                    {
                      if (**(void **)&remainder.size.width != v71) {
                        objc_enumerationMutation(v68);
                      }
                      uint64_t v73 = *(void *)(*(void *)&remainder.origin.y + 8 * i);
                      if (v73)
                      {
                        *(unsigned char *)(v73 + 8) |= 2u;
                        objc_storeWeak((id *)(v73 + 24), 0);
                      }
                      (*(void (**)(CGRect *, uint64_t))&v372.size.width)(&v372, v73);
                    }
                    uint64_t v70 = [v68 countByEnumeratingWithState:&remainder objects:&slice count:16];
                  }
                  while (v70);
                }

                [*(id *)(v12 + 104) removeObjectAtIndex:0];
                goto LABEL_71;
              }
            }
          }
          while (v22 > v20)
          {
            uint64_t v32 = [*(id *)(v12 + 104) objectAtIndexedSubscript:--v22];
            uint64_t v33 = (void *)v32;
            if (v32) {
              uint64_t v34 = *(void **)(v32 + 40);
            }
            else {
              uint64_t v34 = 0;
            }
            id v35 = v34;
            *(void *)(v12 + 272) -= [v35 count];

            uint64_t v36 = *(void *)(v12 + 16);
            uint64_t v37 = *(void *)(v12 + 24);
            uint64_t v38 = *(void *)(v12 + 32);
            uint64_t v39 = *(void *)(v12 + 40);
            if (v19)
            {
              double Width = CGRectGetWidth(*(CGRect *)&v36);
              if (v33)
              {
                uint64_t v41 = 7;
                uint64_t v42 = v343;
                double v43 = v348;
                goto LABEL_30;
              }
              double v51 = v343;
              double v52 = v348;
LABEL_44:
              unint64_t v44 = 0;
              *double v52 = fmax(Width - (*v51 + 0.0), 0.0);
              memset(&remainder, 0, sizeof(remainder));
              long long v370 = 0u;
              long long v371 = 0u;
            }
            else
            {
              double Width = CGRectGetHeight(*(CGRect *)&v36);
              if (!v33)
              {
                double v51 = v352;
                double v52 = v345;
                goto LABEL_44;
              }
              uint64_t v41 = 8;
              uint64_t v42 = v352;
              double v43 = v345;
LABEL_30:
              *double v43 = fmax(Width - (*(double *)&v33[v41] + *v42), 0.0);
              long long v370 = 0u;
              long long v371 = 0u;
              memset(&remainder, 0, sizeof(remainder));
              unint64_t v44 = (void *)v33[5];
            }
            id v45 = v44;
            uint64_t v46 = [v45 countByEnumeratingWithState:&remainder objects:&slice count:16];
            if (v46)
            {
              uint64_t v47 = v46;
              uint64_t v48 = **(void **)&remainder.size.width;
              do
              {
                for (uint64_t j = 0; j != v47; ++j)
                {
                  if (**(void **)&remainder.size.width != v48) {
                    objc_enumerationMutation(v45);
                  }
                  uint64_t v50 = *(void *)(*(void *)&remainder.origin.y + 8 * j);
                  if (v50)
                  {
                    *(unsigned char *)(v50 + 8) |= 2u;
                    objc_storeWeak((id *)(v50 + 24), 0);
                  }
                  (*(void (**)(CGRect *, uint64_t))&v372.size.width)(&v372, v50);
                }
                uint64_t v47 = [v45 countByEnumeratingWithState:&remainder objects:&slice count:16];
              }
              while (v47);
            }

            uint64_t v12 = v355;
            [*(id *)(v355 + 104) removeObjectAtIndex:v22];

            continue;
          }
        }
LABEL_71:

        uint64_t v13 = rect + 1;
      }
      while ((id *)(rect + 1) != v331);
      v331 = (id *)[obj countByEnumeratingWithState:&v365 objects:v376 count:16];
    }
    while (v331);
  }

  [*(id *)(v12 + 80) removeAllObjects];
  if (!CGRectIsEmpty(*(CGRect *)(v12 + 48)))
  {
    v422.origin.double x = a5;
    v422.origin.double y = a6;
    v422.size.width = a7;
    v422.size.height = a8;
    if (CGRectIntersectsRect(*(CGRect *)(v12 + 48), v422)
      && !CGRectContainsRect(*(CGRect *)(v12 + 16), *(CGRect *)(v12 + 48)))
    {
      double v74 = *(double *)(v12 + 48);
      double v75 = *(double *)(v12 + 56);
      double v76 = *(double *)(v12 + 64);
      double v77 = *(double *)(v12 + 72);
      long long v78 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
      *(_OWORD *)(v12 + 48) = *MEMORY[0x1E4F1DB28];
      *(_OWORD *)(v12 + 64) = v78;
      -[_UIFlowLayoutSection computeLayoutInRect:forSection:invalidating:invalidationContext:](v12, a2, a3, a4, v74, v75, v76, v77);
    }
  }
  long long v79 = (unsigned __int8 *)objc_loadWeakRetained((id *)(v12 + 144));
  if (v79)
  {
    int v80 = v79[97];

    memset(&remainder, 0, sizeof(remainder));
    if (v80)
    {
      v385.origin.double x = a5;
      v385.origin.double y = a6;
      v385.size.width = a7;
      v385.size.height = a8;
      double MaxX = CGRectGetMaxX(v385);
      if (MaxX > CGRectGetMaxX(*(CGRect *)(v12 + 16)))
      {
        v386.origin.double x = a5;
        v386.origin.double y = a6;
        v386.size.width = a7;
        v386.size.height = a8;
        double MinX = CGRectGetMinX(v386);
        if (MinX < CGRectGetMinX(*(CGRect *)(v12 + 16)))
        {
          memset(&slice, 0, sizeof(slice));
          double v83 = CGRectGetMinX(*(CGRect *)(v12 + 16));
          v387.origin.double x = a5;
          v387.origin.double y = a6;
          v387.size.width = a7;
          v387.size.height = a8;
          CGFloat v84 = v83 - CGRectGetMinX(v387);
          v388.origin.double x = a5;
          v388.origin.double y = a6;
          v388.size.width = a7;
          v388.size.height = a8;
          CGRectDivide(v388, &slice, &remainder, v84, CGRectMinXEdge);
          uint64_t v85 = a4;
          uint64_t v86 = a2;
          uint64_t v87 = a3;
          -[_UIFlowLayoutSection computeLayoutInRect:forSection:invalidating:invalidationContext:](v12, a2, a3, a4, slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
          memset(&v372, 0, sizeof(v372));
          v389.origin.double x = a5;
          v389.origin.double y = a6;
          v389.size.width = a7;
          v389.size.height = a8;
          double v88 = CGRectGetMaxX(v389);
          double v89 = v88 - CGRectGetMaxX(*(CGRect *)(v12 + 16));
          CGFloat v90 = a5;
          CGFloat v91 = a6;
          double v92 = a7;
          double v93 = a8;
          CGRectEdge v94 = CGRectMaxXEdge;
LABEL_87:
          CGRectDivide(*(CGRect *)&v90, &remainder, &v372, v89, v94);
          -[_UIFlowLayoutSection computeLayoutInRect:forSection:invalidating:invalidationContext:](v12, v86, v87, v85, v372.origin.x, v372.origin.y, v372.size.width, v372.size.height);
          return;
        }
      }
      int v95 = 1;
      goto LABEL_89;
    }
  }
  else
  {
    memset(&remainder, 0, sizeof(remainder));
  }
  v390.origin.double x = a5;
  v390.origin.double y = a6;
  v390.size.width = a7;
  v390.size.height = a8;
  double MaxY = CGRectGetMaxY(v390);
  if (MaxY > CGRectGetMaxY(*(CGRect *)(v12 + 16)))
  {
    v391.origin.double x = a5;
    v391.origin.double y = a6;
    v391.size.width = a7;
    v391.size.height = a8;
    double MinY = CGRectGetMinY(v391);
    if (MinY < CGRectGetMinY(*(CGRect *)(v12 + 16)))
    {
      memset(&slice, 0, sizeof(slice));
      double v98 = CGRectGetMinY(*(CGRect *)(v12 + 16));
      v392.origin.double x = a5;
      v392.origin.double y = a6;
      v392.size.width = a7;
      v392.size.height = a8;
      CGFloat v99 = v98 - CGRectGetMinY(v392);
      v393.origin.double x = a5;
      v393.origin.double y = a6;
      v393.size.width = a7;
      v393.size.height = a8;
      CGRectDivide(v393, &slice, &remainder, v99, CGRectMinYEdge);
      uint64_t v85 = a4;
      uint64_t v86 = a2;
      uint64_t v87 = a3;
      -[_UIFlowLayoutSection computeLayoutInRect:forSection:invalidating:invalidationContext:](v12, a2, a3, a4, slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
      memset(&v372, 0, sizeof(v372));
      v394.origin.double x = a5;
      v394.origin.double y = a6;
      v394.size.width = a7;
      v394.size.height = a8;
      double v100 = CGRectGetMaxY(v394);
      double v89 = v100 - CGRectGetMaxY(*(CGRect *)(v12 + 16));
      CGFloat v90 = a5;
      CGFloat v91 = a6;
      double v92 = a7;
      double v93 = a8;
      CGRectEdge v94 = CGRectMaxYEdge;
      goto LABEL_87;
    }
  }
  int v95 = 0;
LABEL_89:
  CGSize v349 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
  CGPoint v353 = (CGPoint)*MEMORY[0x1E4F1DB28];
  v372.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
  v372.size = v349;
  v395.origin.double x = a5;
  v395.origin.double y = a6;
  v395.size.width = a7;
  v395.size.height = a8;
  double v328 = a5;
  if (CGRectIsEmpty(v395))
  {
LABEL_93:
    v372.origin = v353;
    v372.size = v349;
    a7 = *(double *)(v12 + 32);
    double y = *(double *)(v12 + 24);
    double x = *(double *)(v12 + 16);
    int v101 = 1;
    a8 = *(double *)(v12 + 40);
    goto LABEL_94;
  }
  if (!CGRectIsEmpty(*(CGRect *)(v12 + 16)))
  {
    v424.origin.double x = a5;
    v424.origin.double y = a6;
    v424.size.width = a7;
    v424.size.height = a8;
    if (CGRectContainsRect(*(CGRect *)(v12 + 16), v424)) {
      goto LABEL_93;
    }
    v425.origin.double x = a5;
    v425.origin.double y = a6;
    v425.size.width = a7;
    v425.size.height = a8;
    if (!CGRectIntersectsRect(*(CGRect *)(v12 + 16), v425))
    {
      uint64_t v284 = *(void *)(v12 + 16);
      uint64_t v285 = *(void *)(v12 + 24);
      uint64_t v286 = *(void *)(v12 + 32);
      uint64_t v287 = *(void *)(v12 + 40);
      if (v95)
      {
        double v288 = CGRectGetMinX(*(CGRect *)&v284);
        v411.origin.double x = a5;
        v411.origin.double y = a6;
        v411.size.width = a7;
        v411.size.height = a8;
        if (v288 == CGRectGetMaxX(v411)) {
          goto LABEL_325;
        }
        double v289 = CGRectGetMaxX(*(CGRect *)(v12 + 16));
        v412.origin.double x = a5;
        v412.origin.double y = a6;
        v412.size.width = a7;
        v412.size.height = a8;
        double v290 = CGRectGetMinX(v412);
      }
      else
      {
        double v291 = CGRectGetMinY(*(CGRect *)&v284);
        v413.origin.double x = a5;
        v413.origin.double y = a6;
        v413.size.width = a7;
        v413.size.height = a8;
        if (v291 == CGRectGetMaxY(v413)) {
          goto LABEL_325;
        }
        double v289 = CGRectGetMaxY(*(CGRect *)(v12 + 16));
        v414.origin.double x = a5;
        v414.origin.double y = a6;
        v414.size.width = a7;
        v414.size.height = a8;
        double v290 = CGRectGetMinY(v414);
      }
      if (v289 != v290)
      {
        *(void *)(v12 + 264) = 0;
        *(void *)(v12 + 272) = 0;
        [*(id *)(v12 + 104) removeAllObjects];
        int v101 = 1;
        double y = a6;
        double x = a5;
        goto LABEL_94;
      }
    }
LABEL_325:
    v426.origin.double x = a5;
    v426.origin.double y = a6;
    v426.size.width = a7;
    v426.size.height = a8;
    CGRect v415 = CGRectUnion(*(CGRect *)(v12 + 16), v426);
    double y = v415.origin.y;
    double x = v415.origin.x;
    double v292 = v415.size.width;
    double v293 = v415.size.height;
    CGFloat v294 = a5;
    CGFloat v295 = a6;
    double v296 = a7;
    double v297 = a8;
    if (v95)
    {
      CGFloat v298 = a5;
      double v299 = CGRectGetMinX(*(CGRect *)&v294);
      if (v299 < CGRectGetMinX(*(CGRect *)(v12 + 16)))
      {
        double v300 = CGRectGetMinX(*(CGRect *)(v12 + 16));
        v416.origin.double x = v298;
        v416.origin.double y = a6;
        v416.size.width = a7;
        v416.size.height = a8;
        double v301 = v300 - CGRectGetMinX(v416);
        double v303 = y;
        double v302 = x;
        double v304 = v292;
        double v305 = v293;
        CGRectEdge v306 = CGRectMinXEdge;
LABEL_330:
        CGRectDivide(*(CGRect *)&v302, &v372, &remainder, v301, v306);
        int v101 = 0;
LABEL_337:
        a8 = v293;
        a7 = v292;
        goto LABEL_94;
      }
      v418.origin.double x = v298;
      v418.origin.double y = a6;
      v418.size.width = a7;
      v418.size.height = a8;
      double v310 = CGRectGetMaxX(v418);
      if (v310 > CGRectGetMaxX(*(CGRect *)(v12 + 16)))
      {
        v419.origin.double x = v298;
        v419.origin.double y = a6;
        v419.size.width = a7;
        v419.size.height = a8;
        double v311 = CGRectGetMaxX(v419);
        double v312 = v311 - CGRectGetMaxX(*(CGRect *)(v12 + 16));
        double v314 = y;
        double v313 = x;
        double v315 = v292;
        double v316 = v293;
        CGRectEdge v317 = CGRectMaxXEdge;
LABEL_335:
        CGRectDivide(*(CGRect *)&v313, &v372, &remainder, v312, v317);
      }
    }
    else
    {
      CGFloat v307 = a5;
      double v308 = CGRectGetMinY(*(CGRect *)&v294);
      if (v308 < CGRectGetMinY(*(CGRect *)(v12 + 16)))
      {
        double v309 = CGRectGetMinY(*(CGRect *)(v12 + 16));
        v417.origin.double x = v307;
        v417.origin.double y = a6;
        v417.size.width = a7;
        v417.size.height = a8;
        double v301 = v309 - CGRectGetMinY(v417);
        double v303 = y;
        double v302 = x;
        double v304 = v292;
        double v305 = v293;
        CGRectEdge v306 = CGRectMinYEdge;
        goto LABEL_330;
      }
      v420.origin.double x = v307;
      v420.origin.double y = a6;
      v420.size.width = a7;
      v420.size.height = a8;
      double v318 = CGRectGetMaxY(v420);
      if (v318 > CGRectGetMaxY(*(CGRect *)(v12 + 16)))
      {
        v421.origin.double x = v307;
        v421.origin.double y = a6;
        v421.size.width = a7;
        v421.size.height = a8;
        double v319 = CGRectGetMaxY(v421);
        double v312 = v319 - CGRectGetMaxY(*(CGRect *)(v12 + 16));
        double v314 = y;
        double v313 = x;
        double v315 = v292;
        double v316 = v293;
        CGRectEdge v317 = CGRectMaxYEdge;
        goto LABEL_335;
      }
    }
    int v101 = 1;
    goto LABEL_337;
  }
  v372.origin.double x = a5;
  v372.origin.double y = a6;
  v372.size.width = a7;
  v372.size.height = a8;
  v423.origin.double x = a5;
  v423.origin.double y = a6;
  v423.size.width = a7;
  v423.size.height = a8;
  CGRect v396 = CGRectUnion(*(CGRect *)(v12 + 16), v423);
  double y = v396.origin.y;
  double x = v396.origin.x;
  a7 = v396.size.width;
  a8 = v396.size.height;
  int v101 = 1;
LABEL_94:
  id v102 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v103 = (double *)objc_loadWeakRetained((id *)(v12 + 144));
  double v104 = 0.0;
  double v105 = 0.0;
  if (v103) {
    double v105 = v103[14];
  }
  int v321 = v101;
  v332 = (id *)(v12 + 144);

  double v106 = *(double *)(v12 + 120);
  uint64_t v107 = 288;
  if (v95) {
    uint64_t v107 = 280;
  }
  uint64_t v108 = 304;
  if (v95) {
    uint64_t v108 = 296;
  }
  double v109 = *(double *)(v12 + v107);
  double v110 = *(double *)(v12 + v108);
  long long v361 = 0u;
  long long v362 = 0u;
  long long v363 = 0u;
  long long v364 = 0u;
  id v111 = *(id *)(v12 + 104);
  uint64_t v112 = [v111 countByEnumeratingWithState:&v361 objects:v375 count:16];
  v354 = v102;
  if (!v112)
  {
    LOBYTE(v115) = 1;
    LOBYTE(v116) = 1;
    goto LABEL_140;
  }
  uint64_t v113 = v112;
  uint64_t v114 = *(void *)v362;
  LOBYTE(v115) = 1;
  int v116 = 1;
  id v346 = v111;
  do
  {
    uint64_t v117 = 0;
    uint64_t v350 = v113;
    do
    {
      if (*(void *)v362 != v114) {
        objc_enumerationMutation(v111);
      }
      v118 = *(void **)(*((void *)&v361 + 1) + 8 * v117);
      if (v118) {
        v118 = (void *)v118[5];
      }
      uint64_t v119 = v118;
      BOOL v120 = (unint64_t)[v119 count] < 2;
      if ((v115 & 1) == 0)
      {
        int v115 = 0;
        goto LABEL_134;
      }
      long long v359 = 0u;
      long long v360 = 0u;
      long long v357 = 0u;
      long long v358 = 0u;
      long long v121 = v119;
      uint64_t v122 = [v121 countByEnumeratingWithState:&v357 objects:v374 count:16];
      if (!v122)
      {
        int v115 = 1;
        goto LABEL_133;
      }
      uint64_t v123 = v122;
      uint64_t v124 = *(void *)v358;
LABEL_110:
      uint64_t v125 = 0;
      while (1)
      {
        if (*(void *)v358 != v124) {
          objc_enumerationMutation(v121);
        }
        int v126 = *(void **)(*((void *)&v357 + 1) + 8 * v125);
        if (v95)
        {
          if (v126)
          {
            uint64_t v127 = v126[4];
            uint64_t v128 = v126[5];
            uint64_t v129 = v126[6];
            uint64_t v130 = v126[7];
          }
          else
          {
            uint64_t v128 = 0;
            uint64_t v129 = 0;
            uint64_t v130 = 0;
            uint64_t v127 = 0;
          }
          double v131 = CGRectGetHeight(*(CGRect *)&v127);
        }
        else
        {
          if (v126)
          {
            uint64_t v132 = v126[4];
            uint64_t v133 = v126[5];
            uint64_t v134 = v126[6];
            uint64_t v135 = v126[7];
          }
          else
          {
            uint64_t v133 = 0;
            uint64_t v134 = 0;
            uint64_t v135 = 0;
            uint64_t v132 = 0;
          }
          double v131 = CGRectGetWidth(*(CGRect *)&v132);
        }
        if (v104 != 0.0) {
          break;
        }
        double v104 = v131;
LABEL_123:
        if (v123 == ++v125)
        {
          uint64_t v136 = [v121 countByEnumeratingWithState:&v357 objects:v374 count:16];
          uint64_t v123 = v136;
          if (!v136)
          {
            int v115 = 1;
            goto LABEL_131;
          }
          goto LABEL_110;
        }
      }
      if (v104 == v131) {
        goto LABEL_123;
      }
      int v115 = 0;
LABEL_131:
      id v111 = v346;
LABEL_133:

      uint64_t v12 = v355;
      uint64_t v113 = v350;
LABEL_134:
      v116 &= v120;

      if ((v116 | v115) != 1)
      {
        LOBYTE(v115) = 0;
        LOBYTE(v116) = 0;
        id v102 = v354;
        goto LABEL_140;
      }
      ++v117;
      id v102 = v354;
    }
    while (v117 != v113);
    uint64_t v113 = [v111 countByEnumeratingWithState:&v361 objects:v375 count:16];
  }
  while (v113);
LABEL_140:

  if (CGRectIsEmpty(v372))
  {
    char v342 = 0;
    goto LABEL_269;
  }
  double v323 = a6;
  char v342 = 0;
  v320 = sel_computeLayoutInRect_forSection_invalidating_invalidationContext_;
  double v137 = v105 - (v109 + v110);
  locationa = *(id **)MEMORY[0x1E4F1DB28];
  CGFloat recta = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v330 = v106;
  BOOL v138 = v116;
  while (2)
  {
    uint64_t v139 = *(void *)(v12 + 264);
    if (v321)
    {
      uint64_t v140 = *(void *)(v12 + 272);
      uint64_t v141 = v12;
      uint64_t v142 = v140 + v139;
      if ((unint64_t)(v140 + v139) >= *(void *)(v141 + 208))
      {
        uint64_t v12 = v355;
        break;
      }
      if (!v140)
      {
LABEL_150:
        v143 = objc_loadWeakRetained(v332);
        if (v143) {
          BOOL v144 = v143[97] != 0;
        }
        else {
          BOOL v144 = 0;
        }

        *(void *)&slice.origin.double x = MEMORY[0x1E4F143A8];
        *(void *)&slice.origin.double y = 3221225472;
        *(void *)&slice.size.width = __52___UIFlowLayoutSection_estimatedIndexOfItemAtPoint___block_invoke;
        *(void *)&slice.size.height = &unk_1E52E6540;
        uint64_t v378 = v355;
        double v379 = v328;
        double v380 = v323;
        BOOL v381 = v144;
        v145 = (uint64_t (**)(void))_Block_copy(&slice);
        uint64_t v146 = *(void *)(v355 + 16);
        uint64_t v147 = *(void *)(v355 + 24);
        uint64_t v148 = *(void *)(v355 + 32);
        uint64_t v149 = *(void *)(v355 + 40);
        if (v144)
        {
          double v150 = CGRectGetMinX(*(CGRect *)&v146);
          uint64_t v151 = *(void *)(v355 + 16);
          uint64_t v152 = *(void *)(v355 + 24);
          uint64_t v153 = *(void *)(v355 + 32);
          uint64_t v154 = *(void *)(v355 + 40);
          if (v328 < v150)
          {
            double v155 = v328 / CGRectGetMinX(*(CGRect *)&v151);
            goto LABEL_157;
          }
          if (v328 > CGRectGetMaxX(*(CGRect *)&v151))
          {
            double v162 = v328 - CGRectGetMaxX(*(CGRect *)(v355 + 16));
            double v163 = CGRectGetMaxX(*(CGRect *)(v355 + 312));
            double v164 = CGRectGetMaxX(*(CGRect *)(v355 + 16));
            goto LABEL_162;
          }
LABEL_164:
          uint64_t v142 = v145[2](v145);
        }
        else
        {
          double v156 = CGRectGetMinY(*(CGRect *)&v146);
          uint64_t v157 = *(void *)(v355 + 16);
          uint64_t v158 = *(void *)(v355 + 24);
          uint64_t v159 = *(void *)(v355 + 32);
          uint64_t v160 = *(void *)(v355 + 40);
          if (v323 >= v156)
          {
            if (v323 <= CGRectGetMaxY(*(CGRect *)&v157)) {
              goto LABEL_164;
            }
            double v162 = v323 - CGRectGetMaxY(*(CGRect *)(v355 + 16));
            double v163 = CGRectGetMaxY(*(CGRect *)(v355 + 312));
            double v164 = CGRectGetMaxY(*(CGRect *)(v355 + 16));
LABEL_162:
            double v155 = v162 / (v163 - v164);
            double v161 = (double)(unint64_t)(*(void *)(v355 + 208)
                                            - (*(void *)(v355 + 264)
                                             + *(void *)(v355 + 272)));
          }
          else
          {
            double v155 = v323 / CGRectGetMinY(*(CGRect *)&v157);
LABEL_157:
            double v161 = (double)*(unint64_t *)(v355 + 264);
          }
          uint64_t v142 = (uint64_t)(v155 * v161);
        }

        id v102 = v354;
      }
    }
    else
    {
      if (!v139) {
        break;
      }
      if (!*(void *)(v12 + 272)) {
        goto LABEL_150;
      }
      uint64_t v142 = v139 - 1;
    }
    uint64_t v165 = -[_UIFlowLayoutSection addRowAtEnd:]((void *)v355, v321);
    double v166 = v137;
    while (2)
    {
      v167 = objc_msgSend(*(id *)(v355 + 96), "objectAtIndexedSubscript:", v142, v320);
      v168 = v167;
      if (v167)
      {
        uint64_t v169 = v167[4];
        uint64_t v170 = v167[5];
        uint64_t v171 = v167[6];
        uint64_t v172 = v167[7];
        if (v95) {
          goto LABEL_169;
        }
LABEL_171:
        double v173 = CGRectGetWidth(*(CGRect *)&v169);
      }
      else
      {
        uint64_t v170 = 0;
        uint64_t v171 = 0;
        uint64_t v172 = 0;
        uint64_t v169 = 0;
        if (!v95) {
          goto LABEL_171;
        }
LABEL_169:
        double v173 = CGRectGetHeight(*(CGRect *)&v169);
      }
      double v174 = v173;
      if (v173 > v137) {
        -[_UIFlowLayoutSection logInvalidSizes](v355);
      }
      if (v104 == 0.0) {
        double v104 = v174;
      }
      int v115 = (v174 == v104) & v115;
      if (v174 <= v166
        || (!v165 ? (v175 = 0) : (v175 = *(void **)(v165 + 40)),
            id v176 = v175,
            uint64_t v177 = [v176 count],
            v176,
            !v177))
      {
        if (v168 && (v168[8] & 2) != 0)
        {
          v178 = [MEMORY[0x1E4F28D58] indexPathForItem:v142 inSection:a2];
          [v102 addObject:v178];

          v168[8] &= ~2u;
        }
        ++*(void *)(v355 + 272);
        if (v321)
        {
          -[_UIFlowLayoutRow addItem:atEnd:]((void *)v165, v168, 1);
          double v166 = v166 - (v106 + v174);
          if (++v142 >= *(void *)(v355 + 208)) {
            goto LABEL_190;
          }
          goto LABEL_188;
        }
        --*(void *)(v355 + 264);
        -[_UIFlowLayoutRow addItem:atEnd:]((void *)v165, v168, 0);
        double v166 = v166 - (v106 + v174);
        if (v142 > 0)
        {
          --v142;
LABEL_188:

          continue;
        }
LABEL_190:
        if (v104 > v166) {
          int v179 = v115;
        }
        else {
          int v179 = 0;
        }
        if (v138)
        {
          if (v165) {
            v180 = *(void **)(v165 + 40);
          }
          else {
            v180 = 0;
          }
          id v181 = v180;
          uint64_t v182 = [v181 count];

          if (v182 == 1) {
            char v183 = 1;
          }
          else {
            char v183 = v179;
          }
          uint64_t v12 = v355;
          if ((v183 & 1) == 0) {
            goto LABEL_200;
          }
LABEL_208:
          id v102 = v354;
          if (v165) {
            goto LABEL_209;
          }
        }
        else
        {
          uint64_t v12 = v355;
          if (v179) {
            goto LABEL_208;
          }
LABEL_200:
          id v102 = v354;
          if (v165) {
            goto LABEL_210;
          }
        }
LABEL_206:
        -[_UIFlowLayoutRow layoutRow](v165);

        double v186 = 0.0;
        double v187 = 0.0;
        goto LABEL_211;
      }
      break;
    }
    if (!v138)
    {
      BOOL v138 = 0;
      uint64_t v12 = v355;
      if (v165) {
        goto LABEL_209;
      }
      goto LABEL_206;
    }
    uint64_t v12 = v355;
    if (v165) {
      v184 = *(void **)(v165 + 40);
    }
    else {
      v184 = 0;
    }
    id v185 = v184;
    BOOL v138 = (unint64_t)[v185 count] < 2;

    if (!v165) {
      goto LABEL_206;
    }
LABEL_209:
    *(unsigned char *)(v165 + 9) = 1;
LABEL_210:
    *(unsigned char *)(v165 + 20) = v115;
    -[_UIFlowLayoutRow layoutRow](v165);

    double v187 = *(double *)(v165 + 56);
    double v186 = *(double *)(v165 + 64);
LABEL_211:
    double v351 = v187;
    uint64_t v188 = [*(id *)(v12 + 104) count];
    uint64_t v189 = v188;
    if (v321)
    {
      uint64_t v190 = v188 - 2;
      if (v95)
      {
        double v344 = a8;
        if (v188 < 2)
        {
          double v193 = a7;
          double v198 = *(double *)(v12 + 128) + *(double *)(v12 + 288);
        }
        else
        {
          v191 = [*(id *)(v12 + 104) objectAtIndex:v190];
          v192 = v191;
          double v193 = a7;
          if (v191)
          {
            uint64_t v194 = v191[9];
            uint64_t v195 = v191[10];
            uint64_t v196 = v191[11];
            uint64_t v197 = v191[12];
          }
          else
          {
            uint64_t v195 = 0;
            uint64_t v196 = 0;
            uint64_t v197 = 0;
            uint64_t v194 = 0;
          }
          double v198 = CGRectGetMaxX(*(CGRect *)&v194) + *(double *)(v12 + 112);
        }
        v405.origin.double x = v198;
        v405.origin.double y = recta;
        v405.size.width = v351;
        v405.size.height = v186;
        CGFloat v231 = CGRectGetMaxX(v405) + *(double *)(v12 + 120);
        double v232 = v231 - CGRectGetMinX(v372);
        if (v232 > 0.0)
        {
          v372.origin.double x = v232 + v372.origin.x;
          v372.size.width = v372.size.width - v232;
        }
        v406.origin.double x = v198;
        v406.origin.double y = recta;
        v406.size.width = v351;
        v406.size.height = v186;
        CGFloat v233 = CGRectGetMaxX(v406) + *(double *)(v12 + 120);
        v407.origin.double y = y;
        v407.origin.double x = x;
        v407.size.width = v193;
        v407.size.height = v344;
        double v234 = v233 - CGRectGetMaxX(v407);
        if (v234 <= 0.0) {
          double v234 = -0.0;
        }
        double v347 = v193 + v234;
        double v207 = recta;
      }
      else
      {
        double v347 = a7;
        if (v188 < 2)
        {
          double v215 = a8;
          double v207 = *(double *)(v12 + 128) + *(double *)(v12 + 280);
        }
        else
        {
          v213 = [*(id *)(v12 + 104) objectAtIndex:v190];
          v214 = v213;
          double v215 = a8;
          if (v213)
          {
            uint64_t v216 = v213[9];
            uint64_t v217 = v213[10];
            uint64_t v218 = v213[11];
            uint64_t v219 = v213[12];
          }
          else
          {
            uint64_t v217 = 0;
            uint64_t v218 = 0;
            uint64_t v219 = 0;
            uint64_t v216 = 0;
          }
          double v207 = CGRectGetMaxY(*(CGRect *)&v216) + *(double *)(v12 + 112);
        }
        *(void *)&v408.origin.double x = locationa;
        v408.origin.double y = v207;
        v408.size.width = v351;
        v408.size.height = v186;
        CGFloat v235 = CGRectGetMaxY(v408) + *(double *)(v12 + 112);
        double v236 = v235 - CGRectGetMinY(v372);
        if (v236 > 0.0)
        {
          v372.origin.double y = v236 + v372.origin.y;
          v372.size.height = v372.size.height - v236;
        }
        *(void *)&v409.origin.double x = locationa;
        v409.origin.double y = v207;
        v409.size.width = v351;
        v409.size.height = v186;
        CGFloat v237 = CGRectGetMaxY(v409) + *(double *)(v12 + 112);
        v410.origin.double y = y;
        v410.origin.double x = x;
        v410.size.width = v347;
        v410.size.height = v215;
        double v238 = v237 - CGRectGetMaxY(v410);
        if (v238 <= 0.0) {
          double v238 = -0.0;
        }
        double v344 = v215 + v238;
        double v198 = *(double *)&locationa;
      }
    }
    else
    {
      if (v188 <= 1)
      {
        v240 = [MEMORY[0x1E4F28B00] currentHandler];
        [v240 handleFailureInMethod:v320 object:v12 file:@"UIFlowLayoutSupport.m" lineNumber:1087 description:@"UICollectionViewFlowLayout internal error"];
      }
      v199 = [*(id *)(v12 + 104) objectAtIndex:v189 - 2];
      v200 = v199;
      if (v95)
      {
        double v344 = a8;
        double v201 = a7;
        if (v199)
        {
          uint64_t v202 = v199[9];
          uint64_t v203 = v199[10];
          uint64_t v204 = v199[11];
          uint64_t v205 = v199[12];
        }
        else
        {
          uint64_t v203 = 0;
          uint64_t v204 = 0;
          uint64_t v205 = 0;
          uint64_t v202 = 0;
        }
        double v206 = CGRectGetMinX(*(CGRect *)&v202);
        *(void *)&v397.origin.double x = locationa;
        v397.origin.double y = recta;
        v397.size.width = v351;
        v397.size.height = v186;
        double v207 = v206 - (CGRectGetWidth(v397) + *(double *)(v12 + 120));

        double v208 = CGRectGetMaxX(v372);
        *(void *)&v398.origin.double x = locationa;
        v398.origin.double y = v207;
        v398.size.width = v351;
        v398.size.height = v186;
        double v209 = v208 - (CGRectGetMinX(v398) + *(double *)(v12 + 120));
        if (v209 > 0.0) {
          v372.size.width = v372.size.width - v209;
        }
        v399.origin.double y = y;
        v399.origin.double x = x;
        v399.size.width = v201;
        v399.size.height = v344;
        double v210 = CGRectGetMinX(v399);
        double v198 = *(double *)&locationa;
        *(void *)&v400.origin.double x = locationa;
        v400.origin.double y = v207;
        v400.size.width = v351;
        v400.size.height = v186;
        double v211 = v210 - (CGRectGetMinX(v400) - *(double *)(v12 + 120));
        double v212 = -0.0;
        if (v211 > 0.0) {
          double v212 = v211;
        }
        double v347 = v201 + v212;
        double x = x - fmax(v211, 0.0);
      }
      else
      {
        double v347 = a7;
        double v220 = a8;
        if (v199)
        {
          uint64_t v221 = v199[9];
          uint64_t v222 = v199[10];
          uint64_t v223 = v199[11];
          uint64_t v224 = v199[12];
        }
        else
        {
          uint64_t v222 = 0;
          uint64_t v223 = 0;
          uint64_t v224 = 0;
          uint64_t v221 = 0;
        }
        CGFloat v225 = CGRectGetMinY(*(CGRect *)&v221) + *(double *)(v12 + 128);
        *(void *)&v401.origin.double x = locationa;
        v401.origin.double y = recta;
        v401.size.width = v351;
        v401.size.height = v186;
        double v207 = v225 - (CGRectGetHeight(v401) + *(double *)(v12 + 112));

        double v226 = CGRectGetMaxY(v372);
        *(void *)&v402.origin.double x = locationa;
        v402.origin.double y = v207;
        v402.size.width = v351;
        v402.size.height = v186;
        double v227 = v226 - (CGRectGetMinY(v402) + *(double *)(v12 + 112));
        if (v227 > 0.0) {
          v372.size.height = v372.size.height - v227;
        }
        v403.origin.double x = x;
        v403.origin.double y = y;
        v403.size.width = v347;
        v403.size.height = v220;
        double v228 = CGRectGetMinY(v403);
        *(void *)&v404.origin.double x = locationa;
        v404.origin.double y = v207;
        v404.size.width = v351;
        v404.size.height = v186;
        double v229 = v228 - (CGRectGetMinY(v404) - *(double *)(v12 + 112));
        double v230 = -0.0;
        if (v229 > 0.0) {
          double v230 = v229;
        }
        double v344 = v220 + v230;
        double y = y - fmax(v229, 0.0);
        double v198 = *(double *)&locationa;
      }
      double v106 = v330;
    }
    if (v165)
    {
      BOOL v239 = *(double *)(v165 + 88) != v351;
      if (*(double *)(v165 + 96) != v186) {
        BOOL v239 = 1;
      }
      *(double *)(v165 + 72) = v198;
      *(double *)(v165 + 80) = v207;
      *(double *)(v165 + 88) = v351;
      *(double *)(v165 + 96) = v186;
    }
    else
    {
      BOOL v239 = v351 != 0.0;
      if (v186 != 0.0) {
        BOOL v239 = 1;
      }
    }
    v342 |= v239;

    a8 = v344;
    a7 = v347;
    if (!CGRectIsEmpty(v372)) {
      continue;
    }
    break;
  }
LABEL_269:
  *(double *)(v12 + 16) = x;
  *(double *)(v12 + 24) = y;
  *(double *)(v12 + 32) = a7;
  *(double *)(v12 + 40) = a8;
  *(double *)(v12 + 48) = x;
  *(double *)(v12 + 56) = y;
  *(double *)(v12 + 64) = a7;
  *(double *)(v12 + 72) = a8;
  -[_UIFlowLayoutSection updateEstimatedSizeForSection:](v12, a2);
  if (v95)
  {
    v241 = v332;
    v242 = (unsigned __int8 *)objc_loadWeakRetained(v332);
    if (v242 && (int v243 = v242[98], v242, v243))
    {
      CGFloat v244 = CGRectGetWidth(*(CGRect *)(v12 + 312));
      double v245 = *(double *)(v12 + 128);
      double v246 = v244 - *(double *)(v12 + 136);
      double v247 = 0.0;
    }
    else
    {
      CGFloat v257 = CGRectGetWidth(*(CGRect *)(v12 + 312));
      double v245 = *(double *)(v12 + 128);
      double v247 = v257 - v245;
      double v246 = 0.0;
    }
    v258 = objc_loadWeakRetained(v332);
    uint64_t v256 = 0;
    uint64_t v259 = 0;
    if (v258) {
      uint64_t v259 = v258[14];
    }
    *(double *)(v12 + 344) = v247;
    *(void *)(v12 + 352) = 0;
    *(double *)(v12 + 360) = v245;
    *(void *)(v12 + 368) = v259;

    uint64_t v249 = *(void *)(v12 + 136);
    v254 = objc_loadWeakRetained(v332);
    if (v254) {
      uint64_t v256 = v254[14];
    }
    *(double *)(v12 + 376) = v246;
    double v255 = 0.0;
  }
  else
  {
    v241 = v332;
    v248 = objc_loadWeakRetained(v332);
    uint64_t v249 = 0;
    uint64_t v250 = 0;
    if (v248) {
      uint64_t v250 = v248[14];
    }
    uint64_t v251 = *(void *)(v12 + 128);
    *(void *)(v12 + 344) = 0;
    *(void *)(v12 + 352) = 0;
    *(void *)(v12 + 360) = v250;
    *(void *)(v12 + 368) = v251;

    double v252 = CGRectGetHeight(*(CGRect *)(v12 + 312));
    double v253 = *(double *)(v12 + 136);
    v254 = objc_loadWeakRetained(v332);
    if (v254) {
      uint64_t v249 = v254[14];
    }
    double v255 = v252 - v253;
    uint64_t v256 = *(void *)(v12 + 136);
    *(void *)(v12 + 376) = 0;
  }
  *(double *)(v12 + 384) = v255;
  *(void *)(v12 + 392) = v249;
  *(void *)(v12 + 400) = v256;

  if (a4 && [v354 count])
  {
    [a4 setInvalidateFlowLayoutAttributes:0];
    [a4 setInvalidateFlowLayoutDelegateMetrics:0];
    if (v342)
    {
      id v356 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v260 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      if (*(double *)(v12 + 136) > 0.0)
      {
        v261 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:a2];
        [v260 addObject:v261];
      }
      id v262 = objc_loadWeakRetained(v241);
      v263 = v262;
      if (v262) {
        v264 = (void *)*((void *)v262 + 13);
      }
      else {
        v264 = 0;
      }
      id v265 = v264;

      uint64_t v266 = [v265 count];
      uint64_t v267 = a2 + 1;
      if (a2 + 1 < v266)
      {
        uint64_t v268 = v266;
        do
        {
          v269 = objc_msgSend(v265, "objectAtIndexedSubscript:", v267, v320);
          v270 = v269;
          if (v269)
          {
            uint64_t v271 = v269[43];
            uint64_t v272 = v269[44];
            uint64_t v273 = v269[45];
            uint64_t v274 = v269[46];
          }
          else
          {
            uint64_t v272 = 0;
            uint64_t v273 = 0;
            uint64_t v274 = 0;
            uint64_t v271 = 0;
          }
          if (!CGRectIsEmpty(*(CGRect *)&v271))
          {
            v275 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:v267];
            [v356 addObject:v275];
          }
          if (v270)
          {
            uint64_t v276 = v270[47];
            uint64_t v277 = v270[48];
            uint64_t v278 = v270[49];
            uint64_t v279 = v270[50];
          }
          else
          {
            uint64_t v277 = 0;
            uint64_t v278 = 0;
            uint64_t v279 = 0;
            uint64_t v276 = 0;
          }
          if (!CGRectIsEmpty(*(CGRect *)&v276))
          {
            v280 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:v267];
            [v260 addObject:v280];
          }
          if (v270)
          {
            unint64_t v281 = v270[33];
            uint64_t v282 = v270[34];
          }
          else
          {
            uint64_t v282 = 0;
            unint64_t v281 = 0;
          }
          if (v281 < v281 + v282)
          {
            do
            {
              v283 = [MEMORY[0x1E4F28D58] indexPathForItem:v281 inSection:v267];
              [v354 addObject:v283];

              ++v281;
              --v282;
            }
            while (v282);
          }

          ++v267;
        }
        while (v267 != v268);
      }
      if (objc_msgSend(v356, "count", v320)) {
        [a4 invalidateSupplementaryElementsOfKind:@"UICollectionElementKindSectionHeader" atIndexPaths:v356];
      }
      if ([v260 count]) {
        [a4 invalidateSupplementaryElementsOfKind:@"UICollectionElementKindSectionFooter" atIndexPaths:v260];
      }
    }
    objc_msgSend(a4, "invalidateItemsAtIndexPaths:", v354, v320);
  }
}

- (void)updateEstimatedSizeForSection:(uint64_t)a1
{
  uint64_t v107 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    int v4 = (id *)(a1 + 144);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 144));
    if (WeakRetained) {
      BOOL v6 = WeakRetained[97] != 0;
    }
    else {
      BOOL v6 = 0;
    }

    if ([*(id *)(a1 + 96) count])
    {
      if ([*(id *)(a1 + 104) count])
      {
        if (v6)
        {
          long long v101 = 0uLL;
          long long v102 = 0uLL;
          long long v99 = 0uLL;
          long long v100 = 0uLL;
          id v7 = *(id *)(a1 + 104);
          uint64_t v8 = [v7 countByEnumeratingWithState:&v99 objects:v106 count:16];
          double v9 = 0.0;
          double v10 = 0.0;
          if (v8)
          {
            uint64_t v11 = v8;
            uint64_t v12 = *(void *)v100;
            do
            {
              uint64_t v13 = 0;
              do
              {
                if (*(void *)v100 != v12) {
                  objc_enumerationMutation(v7);
                }
                int v14 = *(void **)(*((void *)&v99 + 1) + 8 * v13);
                if (v14)
                {
                  uint64_t v15 = v14[9];
                  uint64_t v16 = v14[10];
                  uint64_t v17 = v14[11];
                  uint64_t v18 = v14[12];
                }
                else
                {
                  uint64_t v16 = 0;
                  uint64_t v17 = 0;
                  uint64_t v18 = 0;
                  uint64_t v15 = 0;
                }
                double v10 = v10 + CGRectGetWidth(*(CGRect *)&v15) + *(double *)(a1 + 112);
                ++v13;
              }
              while (v11 != v13);
              uint64_t v19 = [v7 countByEnumeratingWithState:&v99 objects:v106 count:16];
              uint64_t v11 = v19;
            }
            while (v19);
          }

          double v20 = v10 * (double)(unint64_t)(*(void *)(a1 + 208) / *(void *)(a1 + 272))
              - *(double *)(a1 + 112)
              + *(double *)(a1 + 288)
              + *(double *)(a1 + 304)
              + *(double *)(a1 + 128)
              + *(double *)(a1 + 136);
          CGFloat v21 = (double *)objc_loadWeakRetained(v4);
          uint64_t v22 = v21;
          if (v21) {
            double v9 = v21[14];
          }
          uint64_t v23 = a1;
          double v24 = v20;
        }
        else
        {
          long long v97 = 0uLL;
          long long v98 = 0uLL;
          long long v95 = 0uLL;
          long long v96 = 0uLL;
          id v49 = *(id *)(a1 + 104);
          uint64_t v50 = [v49 countByEnumeratingWithState:&v95 objects:v105 count:16];
          if (v50)
          {
            uint64_t v51 = v50;
            uint64_t v52 = *(void *)v96;
            double v9 = 0.0;
            do
            {
              uint64_t v53 = 0;
              do
              {
                if (*(void *)v96 != v52) {
                  objc_enumerationMutation(v49);
                }
                uint64_t v54 = *(void **)(*((void *)&v95 + 1) + 8 * v53);
                if (v54)
                {
                  uint64_t v55 = v54[9];
                  uint64_t v56 = v54[10];
                  uint64_t v57 = v54[11];
                  uint64_t v58 = v54[12];
                }
                else
                {
                  uint64_t v56 = 0;
                  uint64_t v57 = 0;
                  uint64_t v58 = 0;
                  uint64_t v55 = 0;
                }
                double v9 = v9 + CGRectGetHeight(*(CGRect *)&v55) + *(double *)(a1 + 112);
                ++v53;
              }
              while (v51 != v53);
              uint64_t v59 = [v49 countByEnumeratingWithState:&v95 objects:v105 count:16];
              uint64_t v51 = v59;
            }
            while (v59);
          }
          else
          {
            double v9 = 0.0;
          }

          unint64_t v79 = *(void *)(a1 + 272);
          if (v79) {
            double v9 = round(v9 * ((double)*(uint64_t *)(a1 + 208) / (double)v79))
          }
               - *(double *)(a1 + 112)
               + *(double *)(a1 + 280)
               + *(double *)(a1 + 296)
               + *(double *)(a1 + 128)
               + *(double *)(a1 + 136);
          int v80 = (double *)objc_loadWeakRetained(v4);
          uint64_t v22 = v80;
          if (v80) {
            double v24 = v80[14];
          }
          else {
            double v24 = 0.0;
          }
          uint64_t v23 = a1;
        }
        double v81 = v9;
        goto LABEL_97;
      }
      int v30 = (double *)objc_loadWeakRetained(v4);
      if (v6)
      {
        if (v30) {
          double v31 = v30[14];
        }
        else {
          double v31 = 0.0;
        }
        double v32 = *(double *)(a1 + 280);
        double v33 = *(double *)(a1 + 296);

        long long v93 = 0u;
        long long v94 = 0u;
        long long v91 = 0u;
        long long v92 = 0u;
        id v34 = *(id *)(a1 + 96);
        uint64_t v35 = [v34 countByEnumeratingWithState:&v91 objects:v104 count:16];
        if (v35)
        {
          uint64_t v36 = v35;
          uint64_t v37 = 0;
          double v38 = v31 - (v32 + v33);
          uint64_t v39 = *(void *)v92;
          double v40 = 0.0;
          do
          {
            uint64_t v41 = 0;
            uint64_t v42 = v36 + v37;
            do
            {
              if (*(void *)v92 != v39) {
                objc_enumerationMutation(v34);
              }
              double v43 = *(double **)(*((void *)&v91 + 1) + 8 * v41);
              if (v43)
              {
                CGFloat v45 = v43[4];
                CGFloat v44 = v43[5];
                CGFloat v46 = v43[6];
                CGFloat v47 = v43[7];
              }
              else
              {
                CGFloat v44 = 0.0;
                CGFloat v46 = 0.0;
                CGFloat v47 = 0.0;
                CGFloat v45 = 0.0;
              }
              v109.origin.double x = v45;
              v109.origin.double y = v44;
              v109.size.width = v46;
              v109.size.height = v47;
              if (CGRectGetHeight(v109) > v38)
              {
                uint64_t v42 = v37 + v41;
                goto LABEL_82;
              }
              v110.origin.double x = v45;
              v110.origin.double y = v44;
              v110.size.width = v46;
              v110.size.height = v47;
              double v38 = v38 - (CGRectGetHeight(v110) + *(double *)(a1 + 120));
              v111.origin.double x = v45;
              v111.origin.double y = v44;
              v111.size.width = v46;
              v111.size.height = v47;
              double v40 = fmax(v40, CGRectGetWidth(v111));
              ++v41;
            }
            while (v36 != v41);
            uint64_t v48 = [v34 countByEnumeratingWithState:&v91 objects:v104 count:16];
            uint64_t v36 = v48;
            uint64_t v37 = v42;
          }
          while (v48);
LABEL_82:

          if (v42) {
            goto LABEL_89;
          }
        }
        else
        {

          double v40 = 0.0;
        }
        -[_UIFlowLayoutSection logInvalidSizes](a1);
        uint64_t v42 = 1;
LABEL_89:
        double v82 = *(double *)(a1 + 136)
            + *(double *)(a1 + 128)
            + *(double *)(a1 + 304)
            + *(double *)(a1 + 288)
            + (v40 + *(double *)(a1 + 112)) * (double)(uint64_t)(double)(*(void *)(a1 + 208) / v42)
            - *(double *)(a1 + 112);
        double v83 = (double *)objc_loadWeakRetained(v4);
        uint64_t v22 = v83;
        if (v83) {
          double v81 = v83[14];
        }
        else {
          double v81 = 0.0;
        }
        uint64_t v23 = a1;
        double v24 = v82;
LABEL_97:
        [(_UIFlowLayoutSection *)v23 setEstimatedSize:v24 forSection:v81];

        return;
      }
      if (v30) {
        double v61 = v30[14];
      }
      else {
        double v61 = 0.0;
      }
      double v62 = *(double *)(a1 + 288);
      double v63 = *(double *)(a1 + 304);

      long long v89 = 0u;
      long long v90 = 0u;
      long long v87 = 0u;
      long long v88 = 0u;
      id v64 = *(id *)(a1 + 96);
      uint64_t v65 = [v64 countByEnumeratingWithState:&v87 objects:v103 count:16];
      if (v65)
      {
        uint64_t v66 = v65;
        uint64_t v67 = 0;
        double v68 = v61 - (v62 + v63);
        uint64_t v69 = *(void *)v88;
        double v70 = 0.0;
        do
        {
          uint64_t v71 = 0;
          uint64_t v72 = v66 + v67;
          do
          {
            if (*(void *)v88 != v69) {
              objc_enumerationMutation(v64);
            }
            uint64_t v73 = *(double **)(*((void *)&v87 + 1) + 8 * v71);
            if (v73)
            {
              CGFloat v75 = v73[4];
              CGFloat v74 = v73[5];
              CGFloat v76 = v73[6];
              CGFloat v77 = v73[7];
            }
            else
            {
              CGFloat v74 = 0.0;
              CGFloat v76 = 0.0;
              CGFloat v77 = 0.0;
              CGFloat v75 = 0.0;
            }
            v112.origin.double x = v75;
            v112.origin.double y = v74;
            v112.size.width = v76;
            v112.size.height = v77;
            if (CGRectGetWidth(v112) > v68)
            {
              uint64_t v72 = v67 + v71;
              goto LABEL_85;
            }
            v113.origin.double x = v75;
            v113.origin.double y = v74;
            v113.size.width = v76;
            v113.size.height = v77;
            double v68 = v68 - (CGRectGetWidth(v113) + *(double *)(a1 + 120));
            v114.origin.double x = v75;
            v114.origin.double y = v74;
            v114.size.width = v76;
            v114.size.height = v77;
            double v70 = fmax(v70, CGRectGetHeight(v114));
            ++v71;
          }
          while (v66 != v71);
          uint64_t v78 = [v64 countByEnumeratingWithState:&v87 objects:v103 count:16];
          uint64_t v66 = v78;
          uint64_t v67 = v72;
        }
        while (v78);
LABEL_85:

        if (v72) {
          goto LABEL_94;
        }
      }
      else
      {

        double v70 = 0.0;
      }
      -[_UIFlowLayoutSection logInvalidSizes](a1);
      uint64_t v72 = 1;
LABEL_94:
      double v84 = (v70 + *(double *)(a1 + 112)) * (double)(uint64_t)ceil((double)*(uint64_t *)(a1 + 208) / (double)v72)
          - *(double *)(a1 + 112);
      uint64_t v85 = (double *)objc_loadWeakRetained(v4);
      uint64_t v22 = v85;
      if (v85) {
        double v24 = v85[14];
      }
      else {
        double v24 = 0.0;
      }
      double v81 = v84 + *(double *)(a1 + 280) + *(double *)(a1 + 296) + *(double *)(a1 + 128) + *(double *)(a1 + 136);
      uint64_t v23 = a1;
      goto LABEL_97;
    }
    if (v6)
    {
      double v25 = *(double *)(a1 + 288) + *(double *)(a1 + 304) + *(double *)(a1 + 128) + *(double *)(a1 + 136);
      id v26 = (double *)objc_loadWeakRetained(v4);
      uint64_t v86 = v26;
      if (v26) {
        double v27 = v26[14];
      }
      else {
        double v27 = 0.0;
      }
      uint64_t v28 = a1;
      double v29 = v25;
    }
    else
    {
      double v60 = (double *)objc_loadWeakRetained(v4);
      uint64_t v86 = v60;
      if (v60) {
        double v29 = v60[14];
      }
      else {
        double v29 = 0.0;
      }
      double v27 = *(double *)(a1 + 280) + *(double *)(a1 + 296) + *(double *)(a1 + 128) + *(double *)(a1 + 136);
      uint64_t v28 = a1;
    }
    [(_UIFlowLayoutSection *)v28 setEstimatedSize:v29 forSection:v27];
  }
}

@end
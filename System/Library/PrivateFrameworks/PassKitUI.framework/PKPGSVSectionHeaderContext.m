@interface PKPGSVSectionHeaderContext
+ (id)createUpdatedHeaderContextForGroupStackView:(void *)a3 passType:(uint64_t)a4 withState:(uint64_t)a5 currentContext:(void *)a6 allowHeader:(int)a7 allowSubheaders:(int)a8 containerWidth:;
- (BOOL)isEqual:(id)a3;
- (PKPGSVSectionHeaderContext)init;
- (double)_headerViewSize;
- (double)_subheadersHeight;
- (double)positionForHeaderViewInContainerFrame:(double)a3;
- (double)totalHeight;
- (uint64_t)boundsForHeaderViewInContainerFrame:(double)a3;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation PKPGSVSectionHeaderContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subheaderContexts, 0);

  objc_storeStrong((id *)&self->_headerView, 0);
}

- (uint64_t)boundsForHeaderViewInContainerFrame:(double)a3
{
  if (result)
  {
    uint64_t v4 = result;
    double v5 = *(double *)(result + 8);
    if (a4 != v5) {
      objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3B8], @"PKPGSVSectionHeaderContext container width changed from %lu to %lu", (unint64_t)v5, (unint64_t)a4);
    }
    return objc_msgSend(*(id *)(v4 + 40), "bounds", -[PKPGSVSectionHeaderContext _headerViewSize](v4));
  }
  return result;
}

- (double)totalHeight
{
  if (!a1) {
    return 0.0;
  }
  double v2 = *(double *)(a1 + 56);
  -[PKPGSVSectionHeaderContext _headerViewSize](a1);
  double v4 = *(double *)(a1 + 72) + v2 + v3;
  return -[PKPGSVSectionHeaderContext _subheadersHeight](a1) + v4;
}

- (double)_headerViewSize
{
  if (!a1) {
    return 0.0;
  }
  if (*(unsigned char *)(a1 + 32)) {
    return *(double *)(a1 + 16);
  }
  objc_msgSend(*(id *)(a1 + 40), "sizeThatFits:", *(double *)(a1 + 8) - *(double *)(a1 + 64) - *(double *)(a1 + 80), 1.79769313e308);
  *(double *)(a1 + 16) = result;
  *(void *)(a1 + 24) = v3;
  *(unsigned char *)(a1 + 32) = 1;
  return result;
}

- (double)_subheadersHeight
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  double v1 = 0.0;
  if (a1)
  {
    double v2 = *(void **)(a1 + 48);
    if (v2)
    {
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      id v3 = v2;
      uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v4)
      {
        uint64_t v5 = v4;
        uint64_t v6 = *(void *)v15;
        do
        {
          uint64_t v7 = 0;
          do
          {
            if (*(void *)v15 != v6) {
              objc_enumerationMutation(v3);
            }
            uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 8 * v7);
            if (v8)
            {
              double v9 = *(double *)(v8 + 16);
              objc_msgSend(*(id *)(v8 + 8), "bounds", (void)v14);
              double v11 = *(double *)(v8 + 32) + v9 + v10;
            }
            else
            {
              double v11 = 0.0;
            }
            double v1 = v1 + v11;
            ++v7;
          }
          while (v5 != v7);
          uint64_t v12 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
          uint64_t v5 = v12;
        }
        while (v12);
      }
    }
  }
  return v1;
}

- (double)positionForHeaderViewInContainerFrame:(double)a3
{
  if (!a1) {
    return 0.0;
  }
  double v8 = *(double *)(a1 + 8);
  if (a4 != v8) {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3B8], @"PKPGSVSectionHeaderContext container width changed from %lu to %lu", (unint64_t)v8, (unint64_t)a4);
  }
  -[PKPGSVSectionHeaderContext boundsForHeaderViewInContainerFrame:](a1, a2, a3, a4);
  PKSizeAlignedInRect();
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  long long v15 = [*(id *)(a1 + 40) layer];
  [v15 anchorPoint];
  double v17 = v16;
  double v19 = v18;

  v20.n128_f64[0] = v12 * v17;
  PKFloatFloorToPixel(v20, v21);
  double v23 = v10 + v22;
  v24.n128_f64[0] = v14 * v19;
  PKFloatFloorToPixel(v24, v25);
  return v23;
}

+ (id)createUpdatedHeaderContextForGroupStackView:(void *)a3 passType:(uint64_t)a4 withState:(uint64_t)a5 currentContext:(void *)a6 allowHeader:(int)a7 allowSubheaders:(int)a8 containerWidth:
{
  id v14 = a3;
  id v15 = a6;
  self;
  double v16 = [v14 datasource];
  if (a7 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    long long v17 = *(_OWORD *)(a5 + 16);
    objc_super v56 = *(objc_super *)a5;
    long long v57 = v17;
    double v18 = [v16 groupStackView:v14 headerForPassType:a4 withState:&v56];
    double v19 = v18;
    if (v18)
    {
      __n128 v20 = [v18 layer];
      __n128 v21 = PKLayerNullActions();
      [v20 setActions:v21];
    }
  }
  else
  {
    double v19 = 0;
  }
  double v22 = (long long *)MEMORY[0x1E4FB2848];
  if (a8 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v53 = v15;
    id v54 = v14;
    long long v23 = *(_OWORD *)(a5 + 16);
    objc_super v56 = *(objc_super *)a5;
    long long v57 = v23;
    __n128 v24 = [v16 groupStackView:v14 subheadersWithState:&v56];
    uint64_t v25 = [v24 count];
    if (v25)
    {
      uint64_t v26 = v25;
      id v27 = 0;
      uint64_t v28 = 0;
      long long v55 = *v22;
      v29 = (void *)*((void *)v22 + 3);
      uint64_t v30 = v25 - 1;
      do
      {
        v31 = [v24 objectAtIndexedSubscript:v28];
        v32 = [v31 layer];
        v33 = PKLayerNullActions();
        [v32 setActions:v33];

        if (v30 == v28) {
          double v34 = 36.0;
        }
        else {
          double v34 = 17.0;
        }
        v35 = [PKPGSVSectionSubheaderContext alloc];
        id v36 = v31;
        v37 = v36;
        if (v35 && v36)
        {
          v56.receiver = v35;
          v56.super_class = (Class)PKPGSVSectionSubheaderContext;
          v38 = (id *)objc_msgSendSuper2(&v56, sel_init);
          v39 = v38;
          if (v38)
          {
            objc_storeStrong(v38 + 1, v31);
            *((_OWORD *)v39 + 1) = v55;
            *((double *)v39 + 4) = v34;
            v39[5] = v29;
          }
          v35 = v39;
          v40 = v35;
        }
        else
        {
          v40 = 0;
        }

        if (!v27) {
          id v27 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        }
        ++v28;
        [v27 addObject:v40];
      }
      while (v26 != v28);
    }
    else
    {
      id v27 = 0;
    }

    id v15 = v53;
    id v14 = v54;
    double v22 = (long long *)MEMORY[0x1E4FB2848];
  }
  else
  {
    id v27 = 0;
  }
  if (v19) {
    double v41 = 47.0;
  }
  else {
    double v41 = *(double *)v22;
  }
  if (v19) {
    double v42 = 17.0;
  }
  else {
    double v42 = 36.0;
  }
  v43 = [PKPGSVSectionHeaderContext alloc];
  id v44 = v19;
  id v45 = v27;
  if (v43)
  {
    v56.receiver = v43;
    v56.super_class = (Class)PKPGSVSectionHeaderContext;
    v46 = (id *)objc_msgSendSuper2(&v56, sel_init);
    v47 = v46;
    if (v46)
    {
      v48 = (void *)*((void *)v22 + 1);
      v49 = (void *)*((void *)v22 + 3);
      objc_storeStrong(v46 + 5, v19);
      *((double *)v47 + 7) = v41;
      v47[8] = v48;
      *((double *)v47 + 9) = v42;
      v47[10] = v49;
      *((double *)v47 + 1) = a1;
      if ([v45 count])
      {
        uint64_t v50 = [v45 copy];
        id v51 = v47[6];
        v47[6] = (id)v50;
      }
      else
      {
        id v51 = v47[6];
        v47[6] = 0;
      }
    }
  }
  else
  {
    v47 = 0;
  }

  return v47;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v5 = (char *)v4;
    uint64_t v6 = (double *)v5;
    if (self
      && self->_headerView == (PKPGSVSectionHeaderView *)*((void *)v5 + 5)
      && (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_headerMargins.top, *(float64x2_t *)(v5 + 56)), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_headerMargins.bottom, *(float64x2_t *)(v5 + 72)))), 0xFuLL))) & 1) != 0&& PKEqualObjects())
    {
      BOOL v7 = 0;
      if (self->_cachedHeaderViewSize.width == v6[2] && self->_cachedHeaderViewSize.height == v6[3]) {
        BOOL v7 = self->_containerWidth == v6[1];
      }
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)PKPGSVSectionHeaderContext;
  [(PKPGSVSectionHeaderContext *)&v2 dealloc];
}

- (PKPGSVSectionHeaderContext)init
{
  return 0;
}

- (unint64_t)hash
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  headerView = self->_headerView;
  long long v3 = *(_OWORD *)&self->_headerMargins.bottom;
  long long v17 = *(_OWORD *)&self->_headerMargins.top;
  long long v18 = v3;
  CGSize cachedHeaderViewSize = self->_cachedHeaderViewSize;
  double containerWidth = self->_containerWidth;
  unint64_t v4 = PKObjectHash(&headerView);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = self->_subheaderContexts;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v12 + 1) + 8 * v9);
        unint64_t v21 = v4;
        uint64_t v22 = 0;
        uint64_t v22 = objc_msgSend(v10, "hash", (void)v12);
        unint64_t v4 = PKObjectHash(&v21);
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v23 count:16];
    }
    while (v7);
  }

  return v4;
}

@end
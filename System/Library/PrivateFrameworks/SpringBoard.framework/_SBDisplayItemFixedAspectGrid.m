@interface _SBDisplayItemFixedAspectGrid
- (BOOL)_allowFullScreen;
- (CGSize)nearestGridSizeForSize:(CGSize)a3 countOnStage:(unint64_t)a4;
- (_SBDisplayItemFixedAspectGrid)initWithBounds:(CGRect)a3 fixedSize:(CGSize)a4 screenScale:(double)a5 supportsOrthogonalSizes:(BOOL)a6 chamoisLayoutAttributes:(id)a7;
- (id)allHeights;
- (id)allWidths;
- (void)_buildFixedGridWithScreenScale:(double)a3;
@end

@implementation _SBDisplayItemFixedAspectGrid

- (_SBDisplayItemFixedAspectGrid)initWithBounds:(CGRect)a3 fixedSize:(CGSize)a4 screenScale:(double)a5 supportsOrthogonalSizes:(BOOL)a6 chamoisLayoutAttributes:(id)a7
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  v14.receiver = self;
  v14.super_class = (Class)_SBDisplayItemFixedAspectGrid;
  v11 = -[_SBDisplayItemFlexibleGrid initWithBounds:screenScale:chamoisLayoutAttributes:](&v14, sel_initWithBounds_screenScale_chamoisLayoutAttributes_, a7, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a5);
  v12 = v11;
  if (v11)
  {
    v11->_fixedSize.CGFloat width = width;
    v11->_fixedSize.CGFloat height = height;
    v11->_supportsOrthogonalSizes = a6;
    [(_SBDisplayItemFixedAspectGrid *)v11 _buildFixedGridWithScreenScale:a5];
  }
  return v12;
}

- (void)_buildFixedGridWithScreenScale:(double)a3
{
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  [(SBSwitcherChamoisLayoutAttributes *)self->super._chamoisLayoutAttributes screenEdgePadding];
  double v5 = v4;
  [(SBSwitcherChamoisLayoutAttributes *)self->super._chamoisLayoutAttributes stripWidth];
  double v7 = v6;
  CGRectGetWidth(self->super._bounds);
  CGRectGetHeight(self->super._bounds);
  double width = self->super._bounds.size.width;
  [(SBSwitcherChamoisLayoutAttributes *)self->super._chamoisLayoutAttributes minimumDefaultWindowSize];
  double v10 = v9;
  if (BSFloatIsZero()) {
    double v11 = v7;
  }
  else {
    double v11 = width - v10;
  }
  double height = self->super._bounds.size.height;
  [(SBSwitcherChamoisLayoutAttributes *)self->super._chamoisLayoutAttributes maximumWindowHeightWithDock];
  double v14 = v13;
  p_double height = (CGSize *)&self->_fixedSize.height;
  double v73 = self->_fixedSize.height;
  double v74 = self->_fixedSize.width;
  uint64_t v91 = 0;
  v92 = &v91;
  uint64_t v93 = 0x3032000000;
  v94 = __Block_byref_object_copy__115;
  v95 = __Block_byref_object_dispose__115;
  id v96 = [MEMORY[0x1E4F1CA48] array];
  v90[0] = MEMORY[0x1E4F143A8];
  v90[1] = 3221225472;
  v90[2] = __64___SBDisplayItemFixedAspectGrid__buildFixedGridWithScreenScale___block_invoke;
  v90[3] = &unk_1E6B0CC10;
  v90[4] = &v91;
  v16 = (void (**)(void, void, __n128, __n128))MEMORY[0x1D948C7A0](v90);
  double v17 = width + v11 * -0.5 - v5;
  double v76 = width - v5 * 2.0;
  double v77 = height - v5 * 2.0;
  v18 = (CGSize *)&self->_fixedSize.height;
  p_fixedSize = &self->_fixedSize;
  if (v74 >= v73)
  {
    v18 = &self->_fixedSize;
    p_fixedSize = (CGSize *)&self->_fixedSize.height;
    if (!self->_supportsOrthogonalSizes)
    {
      v40 = &self->_fixedSize;
LABEL_43:
      double v41 = p_height->width;
      double v42 = v40->width;
      double v43 = v40->width / p_height->width;
      if (v40->width <= v17) {
        double v44 = v40->width;
      }
      else {
        double v44 = v17;
      }
      double v45 = v17 / v43;
      if (v41 <= v14) {
        double v46 = p_height->width;
      }
      else {
        double v46 = v14;
      }
      if (v46 > v45) {
        double v46 = v17 / v43;
      }
      double v75 = v46;
      if (v44 <= v14 * v43) {
        double v47 = v44;
      }
      else {
        double v47 = v14 * v43;
      }
      v48 = [(_SBDisplayItemFlexibleGrid *)self _gridWidthsForSafeWidth:v17 minimumWidth:v47];
      v49 = [v48 sortedArrayUsingSelector:sel_compare_];

      v51.n128_f64[0] = v47 / v43;
      if (v47 == v42) {
        v50.n128_f64[0] = v42;
      }
      else {
        v50.n128_f64[0] = v47;
      }
      if (v47 == v42) {
        v51.n128_f64[0] = v41;
      }
      ((void (**)(void, BOOL, __n128, __n128))v16)[2](v16, v47 != v42, v50, v51);
      v52 = [v49 lastObject];
      long long v84 = 0u;
      long long v85 = 0u;
      long long v82 = 0u;
      long long v83 = 0u;
      id v53 = v49;
      uint64_t v54 = [v53 countByEnumeratingWithState:&v82 objects:v98 count:16];
      if (v54)
      {
        uint64_t v55 = *(void *)v83;
        do
        {
          for (uint64_t i = 0; i != v54; ++i)
          {
            if (*(void *)v83 != v55) {
              objc_enumerationMutation(v53);
            }
            v57 = *(void **)(*((void *)&v82 + 1) + 8 * i);
            if (v57 != v52)
            {
              [v57 doubleValue];
              if (v42 + 44.0 <= v58.n128_f64[0]) {
                ((void (*)(void (**)(void, void, __n128, __n128), uint64_t, __n128, double))v16[2])(v16, 1, v58, v41 * (v58.n128_f64[0] / v42));
              }
            }
          }
          uint64_t v54 = [v53 countByEnumeratingWithState:&v82 objects:v98 count:16];
        }
        while (v54);
      }

      double v59 = v76;
      if (v17 > v47 && v45 <= v14 || v14 > v75 && (double v17 = v14 * v43, v45 = v14, v14 * v43 <= v76)) {
        ((void (*)(void (**)(void, void, __n128, __n128), uint64_t, double, double))v16[2])(v16, 1, v17, v45);
      }
      if (v76 / v43 <= v77)
      {
        double v77 = v76 / v43;
      }
      else
      {
        double v59 = v77 * v43;
        if (v77 * v43 > v76) {
          goto LABEL_79;
        }
      }
      ((void (*)(void (**)(void, void, __n128, __n128), uint64_t, double, double))v16[2])(v16, 1, v59, v77);
LABEL_79:

      goto LABEL_80;
    }
  }
  double v20 = p_fixedSize->width;
  double v21 = v18->width;
  double v22 = p_fixedSize->width / v18->width;
  double v23 = v14 * v22;
  if (p_fixedSize->width <= v17) {
    double v24 = p_fixedSize->width;
  }
  else {
    double v24 = v17;
  }
  if (v21 <= v14) {
    double v25 = v18->width;
  }
  else {
    double v25 = v14;
  }
  if (v25 <= v17 / v22) {
    double v26 = v25;
  }
  else {
    double v26 = v17 / v22;
  }
  if (v24 > v23) {
    double v24 = v14 * v22;
  }
  double v72 = v24;
  v27 = [(_SBDisplayItemFlexibleGrid *)self _gridHeightsForSafeHeight:v14 minimumHeight:v26];
  v28 = [v27 sortedArrayUsingSelector:sel_compare_];

  v30.n128_f64[0] = v22 * v26;
  if (v26 == v21)
  {
    v30.n128_f64[0] = v20;
    v29.n128_f64[0] = v21;
  }
  else
  {
    v29.n128_f64[0] = v26;
  }
  ((void (**)(void, BOOL, __n128, __n128))v16)[2](v16, v26 != v21, v30, v29);
  v31 = [v28 lastObject];
  long long v88 = 0u;
  long long v89 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  id v32 = v28;
  uint64_t v33 = [v32 countByEnumeratingWithState:&v86 objects:v99 count:16];
  if (v33)
  {
    uint64_t v34 = *(void *)v87;
    do
    {
      for (uint64_t j = 0; j != v33; ++j)
      {
        if (*(void *)v87 != v34) {
          objc_enumerationMutation(v32);
        }
        v36 = *(void **)(*((void *)&v86 + 1) + 8 * j);
        if (v36 != v31)
        {
          [v36 doubleValue];
          if (v21 + 44.0 <= v37) {
            ((void (*)(void (**)(void, void, __n128, __n128), uint64_t, double))v16[2])(v16, 1, v20 * (v37 / v21));
          }
        }
      }
      uint64_t v33 = [v32 countByEnumeratingWithState:&v86 objects:v99 count:16];
    }
    while (v33);
  }

  if (v14 > v26 && (v39.n128_f64[0] = v14, v23 <= v76)
    || v17 > v72 && (v39.n128_f64[0] = v17 / v22, double v23 = v17, v17 / v22 <= v14))
  {
    ((void (*)(void (**)(void, void, __n128, __n128), uint64_t, double, __n128))v16[2])(v16, 1, v23, v39);
  }
  v38.n128_f64[0] = v77 * v22;
  if (v77 * v22 <= v76 || (v38.n128_f64[0] = v76, v76 / v22 <= v77)) {
    ((void (*)(void (**)(void, void, __n128, __n128), uint64_t, __n128))v16[2])(v16, 1, v38);
  }

  if (v74 >= v73)
  {
    v40 = &self->_fixedSize;
    goto LABEL_43;
  }
  v40 = (CGSize *)&self->_fixedSize.height;
  p_double height = &self->_fixedSize;
  if (self->_supportsOrthogonalSizes) {
    goto LABEL_43;
  }
LABEL_80:
  uint64_t v60 = [(id)v92[5] count];
  [(id)v92[5] sortUsingComparator:&__block_literal_global_379];
  v61 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v60];
  v62 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v60];
  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  id v63 = (id)v92[5];
  uint64_t v64 = [v63 countByEnumeratingWithState:&v78 objects:v97 count:16];
  if (v64)
  {
    uint64_t v65 = *(void *)v79;
    do
    {
      for (uint64_t k = 0; k != v64; ++k)
      {
        if (*(void *)v79 != v65) {
          objc_enumerationMutation(v63);
        }
        [*(id *)(*((void *)&v78 + 1) + 8 * k) CGSizeValue];
        double v68 = v67;
        v70 = [NSNumber numberWithDouble:v69];
        [v61 addObject:v70];

        v71 = [NSNumber numberWithDouble:v68];
        [v62 addObject:v71];
      }
      uint64_t v64 = [v63 countByEnumeratingWithState:&v78 objects:v97 count:16];
    }
    while (v64);
  }

  objc_storeStrong((id *)&self->super._heights, v61);
  objc_storeStrong((id *)&self->super._widths, v62);
  self->_maximizeSupported = BSFloatApproximatelyEqualToFloat();

  _Block_object_dispose(&v91, 8);
}

- (CGSize)nearestGridSizeForSize:(CGSize)a3 countOnStage:(unint64_t)a4
{
  double height = a3.height;
  double width = a3.width;
  double v7 = *MEMORY[0x1E4F1DB30];
  double v8 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if ([(NSArray *)self->super._widths count])
  {
    unint64_t v9 = 0;
    double v10 = 1.79769313e308;
    do
    {
      double v11 = [(NSArray *)self->super._widths objectAtIndex:v9];
      [v11 doubleValue];
      double v13 = v12;

      double v14 = [(NSArray *)self->super._heights objectAtIndex:v9];
      [v14 doubleValue];
      double v16 = v15;

      double v17 = vabdd_f64(v13, width) + vabdd_f64(v16, height);
      if (v17 < v10)
      {
        double v8 = v16;
        double v7 = v13;
        double v10 = v17;
      }
      ++v9;
    }
    while (v9 < [(NSArray *)self->super._widths count]);
  }
  [(_SBDisplayItemFlexibleGrid *)self maxSize];
  if ([(_SBDisplayItemFixedAspectGrid *)self _allowFullScreen] && BSSizeEqualToSize())
  {
    double v7 = self->super._bounds.size.width;
    double v8 = self->super._bounds.size.height;
  }
  double v18 = v7;
  double v19 = v8;
  result.double height = v19;
  result.double width = v18;
  return result;
}

- (id)allWidths
{
  v2 = (void *)[(NSArray *)self->super._widths copy];
  return v2;
}

- (id)allHeights
{
  v2 = (void *)[(NSArray *)self->super._heights copy];
  return v2;
}

- (BOOL)_allowFullScreen
{
  if (self->_maximizeSupported) {
    return 1;
  }
  v3 = +[SBAppSwitcherDomain rootSettings];
  double v4 = [v3 chamoisSettings];
  char v5 = [v4 allowTrueMaximizeForAllApps];

  return v5;
}

@end
@interface TUIHStack
- ($881BB7C90C7D0DFCC1492E3DC022A30F)specifiedHeight;
- ($881BB7C90C7D0DFCC1492E3DC022A30F)specifiedWidth;
- (BOOL)prefersEqualWidth;
- (BOOL)useStrictEqualWidth;
- (CGSize)layoutSize;
- (NSArray)children;
- (TUIGuideLayoutController)guideLayoutController;
- (TUIHStack)initWithLayout:(id)a3;
- (TUIHStack)initWithLayout:(id)a3 children:(id)a4;
- (TUILayout)layout;
- (double)computedHeight;
- (double)computedWidth;
- (double)containingMaxWidth;
- (void)computeLayout;
- (void)computeLayoutWithOrigin:(CGPoint)a3;
- (void)setComputedHeight:(double)a3;
- (void)setComputedWidth:(double)a3;
- (void)setContainingMaxWidth:(double)a3;
- (void)setGuideLayoutController:(id)a3;
- (void)setPrefersEqualWidth:(BOOL)a3;
- (void)setSpecifiedHeight:(id *)a3;
- (void)setSpecifiedWidth:(id *)a3;
- (void)setUseStrictEqualWidth:(BOOL)a3;
@end

@implementation TUIHStack

- (TUIHStack)initWithLayout:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TUIHStack;
  v5 = [(TUIHStack *)&v8 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_layout, v4);
    *(_OWORD *)&v6->_specifiedWidth.value = TUILengthNull;
    *(_OWORD *)&v6->_specifiedWidth._flags = TUILengthNull;
    *(int64x2_t *)&v6->_computedHeight = vdupq_n_s64(0x7FF8000000000000uLL);
  }

  return v6;
}

- (TUIHStack)initWithLayout:(id)a3 children:(id)a4
{
  id v6 = a4;
  v7 = [(TUIHStack *)self initWithLayout:a3];
  if (v7)
  {
    objc_super v8 = (NSArray *)[v6 copy];
    children = v7->_children;
    v7->_children = v8;
  }
  return v7;
}

- (void)computeLayout
{
}

- (void)computeLayoutWithOrigin:(CGPoint)a3
{
  double computedWidth = self->_computedWidth;
  [(TUIGuideLayoutController *)self->_guideLayoutController reset];
  long long v139 = 0u;
  long long v140 = 0u;
  long long v137 = 0u;
  long long v138 = 0u;
  id obj = [(TUIHStack *)self children];
  id v5 = [obj countByEnumeratingWithState:&v137 objects:v146 count:16];
  if (v5)
  {
    id v6 = v5;
    v116 = 0;
    uint64_t v7 = *(void *)v138;
    double v8 = 0.0;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v138 != v7) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v137 + 1) + 8 * i);
        [v10 setFlexedWidth:NAN];
        [v10 setFlexedHeight:self->_computedHeight];
        [v10 setContainingMaxWidth:self->_containingMaxWidth];
        [v10 validateLayout];
        [v10 computedTransformedSize];
        double v12 = v11;
        id v13 = [v10 computedWidth];
        uint64_t v15 = v14;
        if ((v14 & 0x8000000000000) != 0
          || !self->_prefersEqualWidth
          && ([v10 box],
              v16 = objc_claimAutoreleasedReturnValue(),
              id v17 = [v16 hcompressed],
              v16,
              v17))
        {
          v18 = v116;
          if (!v116)
          {
            if (self->_prefersEqualWidth)
            {
              if (self->_useStrictEqualWidth) {
                id v19 = +[TUIFlexibleLayoutController newStrictEqualWidthController];
              }
              else {
                id v19 = +[TUIFlexibleLayoutController newEqualWidthController];
              }
            }
            else
            {
              id v19 = +[TUIFlexibleLayoutController newWidthController];
            }
            v18 = v19;
          }
          v20 = [v10 box];
          v116 = v18;
          [v18 addLayout:v10 length:v13 compressed:v15 hcompressed:[v20 hcompressed]];
        }
        double v8 = v8 + v12;
      }
      id v6 = [obj countByEnumeratingWithState:&v137 objects:v146 count:16];
    }
    while (v6);

    if (v116)
    {
      if (v8 != computedWidth || self->_prefersEqualWidth)
      {
        unint64_t v21 = [(TUIHStack *)self specifiedWidth];
        if (computedWidth <= -3.40282347e38)
        {
          uint64_t v23 = 4286578687;
        }
        else
        {
          uint64_t v23 = 2139095039;
          if (computedWidth < 3.40282347e38)
          {
            *(float *)&unsigned int v24 = computedWidth;
            uint64_t v23 = v24;
          }
        }
        [v116 computeWithMeasured:v23 | v21 & 0xFFFFFFFF00000000, v22 & 0xFFE8FFFFFFFFFFFFLL, v8];
        [v116 adjustedNaturalLengthWithMeasured:v8 computed:computedWidth];
        long long v133 = 0u;
        long long v134 = 0u;
        long long v135 = 0u;
        long long v136 = 0u;
        [v116 layouts:v25];
        id obj = (id)objc_claimAutoreleasedReturnValue();
        id v26 = [obj countByEnumeratingWithState:&v133 objects:v145 count:16];
        if (v26)
        {
          id v27 = v26;
          uint64_t v28 = *(void *)v134;
          do
          {
            for (j = 0; j != v27; j = (char *)j + 1)
            {
              if (*(void *)v134 != v28) {
                objc_enumerationMutation(obj);
              }
              v30 = *(void **)(*((void *)&v133 + 1) + 8 * (void)j);
              if (([v30 hidden] & 1) == 0)
              {
                [v116 adjustedLengthForLayout:v30];
                [v30 setFlexedWidth:];
                [v30 validateLayout];
              }
            }
            id v27 = [obj countByEnumeratingWithState:&v133 objects:v145 count:16];
          }
          while (v27);
        }
        goto LABEL_39;
      }
    }
    else
    {
      v116 = 0;
    }
    double v110 = computedWidth;
    goto LABEL_40;
  }
  v116 = 0;
  double v110 = computedWidth;
LABEL_39:

LABEL_40:
  guideLayoutController = self->_guideLayoutController;
  v32 = +[TUIGuideSpec contentWithEdge:](TUIGuideSpec, "contentWithEdge:", 2, *(void *)&v110);
  v112 = [(TUIGuideLayoutController *)guideLayoutController guideForSpec:v32];

  v33 = self->_guideLayoutController;
  v34 = +[TUIGuideSpec contentWithEdge:3];
  id obja = [(TUIGuideLayoutController *)v33 guideForSpec:v34];

  long long v131 = 0u;
  long long v132 = 0u;
  long long v129 = 0u;
  long long v130 = 0u;
  v35 = [(TUIHStack *)self children];
  id v36 = [v35 countByEnumeratingWithState:&v129 objects:v144 count:16];
  if (v36)
  {
    id v37 = v36;
    uint64_t v38 = *(void *)v130;
    double v39 = 0.0;
    double v40 = 0.0;
    double v41 = 0.0;
    do
    {
      for (k = 0; k != v37; k = (char *)k + 1)
      {
        if (*(void *)v130 != v38) {
          objc_enumerationMutation(v35);
        }
        v43 = *(void **)(*((void *)&v129 + 1) + 8 * (void)k);
        if (([v43 hidden] & 1) == 0)
        {
          [v43 computedTransformedSize];
          double v46 = v45;
          if (self->_guideLayoutController)
          {
            v47 = [v43 effectiveGuideTop];
            v48 = [v43 effectiveGuideBottom];
            if (v47) {
              -[TUIGuideLayoutController addEdgeFrom:to:length:](self->_guideLayoutController, "addEdgeFrom:to:length:", v112, v47, 0, 0xB00007F7FFFFFLL);
            }
            if (v48) {
              -[TUIGuideLayoutController addEdgeFrom:to:length:](self->_guideLayoutController, "addEdgeFrom:to:length:", v48, obja, 0, 0xB00007F7FFFFFLL);
            }
          }
          else
          {
            double v49 = v44;
            [v43 computedHeightAbovePivot];
            double v40 = fmax(v50, v40);
            double v39 = fmax(v49 - v50, v39);
          }
          double v41 = v41 + v46;
        }
      }
      id v37 = [v35 countByEnumeratingWithState:&v129 objects:v144 count:16];
    }
    while (v37);
  }
  else
  {
    double v39 = 0.0;
    double v40 = 0.0;
    double v41 = 0.0;
  }

  v51 = self->_guideLayoutController;
  if (!v51)
  {
    v59 = 0;
    double v53 = v39 + v40;
LABEL_69:
    if (v39 == 0.0)
    {
      [(TUIHStack *)self specifiedHeight];
      if ((HIWORD(v60) & 7) - 5 <= 1u)
      {
        [(TUIHStack *)self specifiedHeight];
        if ((v61 & 0x8000000000000) != 0)
        {
          long long v123 = 0u;
          long long v124 = 0u;
          long long v121 = 0u;
          long long v122 = 0u;
          v62 = [(TUIHStack *)self children];
          id v63 = [v62 countByEnumeratingWithState:&v121 objects:v142 count:16];
          if (v63)
          {
            id v64 = v63;
            uint64_t v65 = *(void *)v122;
            do
            {
              for (m = 0; m != v64; m = (char *)m + 1)
              {
                if (*(void *)v122 != v65) {
                  objc_enumerationMutation(v62);
                }
                v67 = *(void **)(*((void *)&v121 + 1) + 8 * (void)m);
                [v67 setFlexedHeight:v53];
                [v67 validateLayout];
              }
              id v64 = [v62 countByEnumeratingWithState:&v121 objects:v142 count:16];
            }
            while (v64);
          }
        }
      }
      v59 = self->_guideLayoutController;
    }
    goto LABEL_81;
  }
  [(TUIGuideLayoutController *)v51 solve];
  [(TUIGuideLayoutController *)self->_guideLayoutController computeLength];
  double v53 = v52;
  long long v125 = 0u;
  long long v126 = 0u;
  long long v127 = 0u;
  long long v128 = 0u;
  v54 = [(TUIHStack *)self children];
  id v55 = [v54 countByEnumeratingWithState:&v125 objects:v143 count:16];
  if (v55)
  {
    id v56 = v55;
    uint64_t v57 = *(void *)v126;
    do
    {
      for (n = 0; n != v56; n = (char *)n + 1)
      {
        if (*(void *)v126 != v57) {
          objc_enumerationMutation(v54);
        }
        [*(id *)(*((void *)&v125 + 1) + 8 * (void)n) validateLayout];
      }
      id v56 = [v54 countByEnumeratingWithState:&v125 objects:v143 count:16];
    }
    while (v56);
  }

  v59 = self->_guideLayoutController;
  if (!v59) {
    goto LABEL_69;
  }
LABEL_81:
  if (!v59)
  {
    LODWORD(v68) = [(TUIHStack *)self specifiedHeight];
    double v69 = COERCE_FLOAT([(TUIHStack *)self specifiedHeight]);
    [(TUIHStack *)self specifiedHeight];
    if ((v70 & 0x8000000000000) != 0)
    {
      LODWORD(v71) = (unint64_t)[(TUIHStack *)self specifiedHeight] >> 32;
      double v72 = fmax(fmin(v69, v53), COERCE_FLOAT((unint64_t)[(TUIHStack *)self specifiedHeight] >> 32));
      [(TUIHStack *)self specifiedHeight];
      LODWORD(v74) = v73;
      [(TUIHStack *)self specifiedHeight];
      double v53 = fmin(fmax(v72, v53), v75);
    }
    else
    {
      double v53 = v69;
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layout);
  v77 = (char *)[WeakRetained computedLayoutDirection];

  if (v77 == (unsigned char *)&def_141F14 + 2) {
    double v78 = computedWidth;
  }
  else {
    double v78 = 0.0;
  }
  id v79 = objc_loadWeakRetained((id *)&self->_layout);
  v80 = [v79 layoutAncestor];
  unsigned __int8 v81 = [v80 isHorizontallyAligningChildren];

  if ((v81 & 1) == 0)
  {
    id v82 = objc_loadWeakRetained((id *)&self->_layout);
    v83 = [v82 box];
    v84 = (char *)[v83 halign];

    if (v84 == (unsigned char *)&def_141F14 + 3)
    {
      if (v77 == (unsigned char *)&def_141F14 + 2) {
        double v78 = v41;
      }
      else {
        double v78 = computedWidth - v41;
      }
    }
    else if (v84 == (unsigned char *)&def_141F14 + 2)
    {
      double v85 = -0.0;
      if (v77 == (unsigned char *)&def_141F14 + 2) {
        double v85 = v41;
      }
      double v78 = (computedWidth - v41) * 0.5 + v85;
    }
  }
  long long v119 = 0u;
  long long v120 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  v86 = [(TUIHStack *)self children];
  id v87 = [v86 countByEnumeratingWithState:&v117 objects:v141 count:16];
  if (v87)
  {
    id v88 = v87;
    uint64_t v89 = *(void *)v118;
    do
    {
      for (ii = 0; ii != v88; ii = (char *)ii + 1)
      {
        if (*(void *)v118 != v89) {
          objc_enumerationMutation(v86);
        }
        v91 = *(void **)(*((void *)&v117 + 1) + 8 * (void)ii);
        if (([v91 hidden] & 1) == 0)
        {
          [v91 computedTransformedSize];
          double v93 = v92;
          double v95 = v94;
          [v91 computedHeightAbovePivot];
          double v97 = v96;
          if (v77 == (unsigned char *)&def_141F14 + 2) {
            double v98 = v93;
          }
          else {
            double v98 = 0.0;
          }
          if (!self->_guideLayoutController) {
            goto LABEL_112;
          }
          v99 = [v91 effectiveGuideTop];
          v100 = [v91 effectiveGuideBottom];
          v101 = v100;
          if (v99)
          {
            [v99 guideOffset];
            double v103 = v102;
            goto LABEL_111;
          }
          if (v100)
          {
            [v100 guideOffset];
            double v103 = v104 - v95;
LABEL_111:
          }
          else
          {
LABEL_112:
            v105 = [v91 box];
            v106 = (int *)[v105 valign];

            if ((unint64_t)v106 < 2)
            {
              double v103 = v40 - v97;
            }
            else
            {
              double v107 = v53 - v95;
              if (v106 == &dword_4) {
                double v107 = (v53 - v95) * 0.5;
              }
              if (v106 == (int *)((char *)&def_141F14 + 2)) {
                double v103 = 0.0;
              }
              else {
                double v103 = v107;
              }
            }
          }
          double v108 = v78 - v98;
          [v91 setComputedOrigin:a3.x + v108, a3.y + v103];
          double v109 = -0.0;
          if (v77 != (unsigned char *)&def_141F14 + 2) {
            double v109 = v93;
          }
          double v78 = v109 + v108;
          continue;
        }
      }
      id v88 = [v86 countByEnumeratingWithState:&v117 objects:v141 count:16];
    }
    while (v88);
  }

  *(void *)&self->_specifiedHeight.priority = v111;
  self->_layoutSize.width = v53;
}

- (TUILayout)layout
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layout);

  return (TUILayout *)WeakRetained;
}

- (NSArray)children
{
  return self->_children;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)specifiedWidth
{
  return *($881BB7C90C7D0DFCC1492E3DC022A30F **)&self->_specifiedWidth.value;
}

- (void)setSpecifiedWidth:(id *)a3
{
  *(void *)&self->_specifiedWidth.value = a3;
  *(void *)&self->_specifiedWidth.max = v3;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)specifiedHeight
{
  return *($881BB7C90C7D0DFCC1492E3DC022A30F **)&self->_specifiedWidth._flags;
}

- (void)setSpecifiedHeight:(id *)a3
{
  *(void *)&self->_specifiedWidth._flags = a3;
  *(void *)&self->_specifiedHeight.min = v3;
}

- (double)computedWidth
{
  return self->_computedWidth;
}

- (void)setComputedWidth:(double)a3
{
  self->_double computedWidth = a3;
}

- (double)computedHeight
{
  return self->_computedHeight;
}

- (void)setComputedHeight:(double)a3
{
  self->_computedHeight = a3;
}

- (double)containingMaxWidth
{
  return self->_containingMaxWidth;
}

- (void)setContainingMaxWidth:(double)a3
{
  self->_containingMaxWidth = a3;
}

- (TUIGuideLayoutController)guideLayoutController
{
  return self->_guideLayoutController;
}

- (void)setGuideLayoutController:(id)a3
{
}

- (BOOL)prefersEqualWidth
{
  return self->_prefersEqualWidth;
}

- (void)setPrefersEqualWidth:(BOOL)a3
{
  self->_prefersEqualWidth = a3;
}

- (BOOL)useStrictEqualWidth
{
  return self->_useStrictEqualWidth;
}

- (void)setUseStrictEqualWidth:(BOOL)a3
{
  self->_useStrictEqualWidth = a3;
}

- (CGSize)layoutSize
{
  double v2 = *(double *)&self->_specifiedHeight.priority;
  double width = self->_layoutSize.width;
  result.height = width;
  result.double width = v2;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_guideLayoutController, 0);
  objc_storeStrong((id *)&self->_children, 0);

  objc_destroyWeak((id *)&self->_layout);
}

@end
@interface PKStackedTextItemGroupView
- (CGSize)sizeThatFits:(CGSize)result;
- (PKStackedTextItemGroup)content;
- (PKStackedTextItemGroupView)initWithCoder:(id)a3;
- (PKStackedTextItemGroupView)initWithFrame:(CGRect)a3;
- (PKStackedTextItemGroupView)initWithStyle:(int64_t)a3;
- (UIEdgeInsets)contentInset;
- (double)headerPadding;
- (int64_t)style;
- (void)_updateSubviewsAnimated:(BOOL)a3;
- (void)layoutIfNeededAnimated:(BOOL)a3;
- (void)layoutSubviews;
- (void)setContent:(id)a3;
- (void)setContent:(id)a3 animated:(BOOL)a4;
- (void)setContentInset:(UIEdgeInsets)a3;
@end

@implementation PKStackedTextItemGroupView

- (PKStackedTextItemGroupView)initWithCoder:(id)a3
{
  return 0;
}

- (PKStackedTextItemGroupView)initWithFrame:(CGRect)a3
{
  return -[PKStackedTextItemGroupView initWithStyle:](self, "initWithStyle:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (PKStackedTextItemGroupView)initWithStyle:(int64_t)a3
{
  v12.receiver = self;
  v12.super_class = (Class)PKStackedTextItemGroupView;
  v4 = -[PKStackedTextItemGroupView initWithFrame:](&v12, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v5 = v4;
  if (v4)
  {
    v4->_style = a3;
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    itemViews = v5->_itemViews;
    v5->_itemViews = v6;

    v8 = [[PKStackedTextItemView alloc] initWithStyle:v5->_style];
    [(PKStackedTextItemGroupView *)v5 addSubview:v8];
    [(NSMutableArray *)v5->_itemViews addObject:v8];
    if (v8)
    {
      [(PKStackedTextItemView *)v8 boundingMetricForWidth:0.0];
      double v9 = v11;
    }
    else
    {
      double v9 = 0.0;
    }
    v5->_intrinsicHeight = v9;
    *(_WORD *)v5->_initialLayout = 257;
  }
  return v5;
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3 = self->_contentInset.top + self->_intrinsicHeight + self->_contentInset.bottom;
  result.height = v3;
  return result;
}

- (double)headerPadding
{
  if (![(NSMutableArray *)self->_itemViews count]) {
    return 0.0;
  }
  double v3 = [(NSMutableArray *)self->_itemViews firstObject];
  [v3 headerPadding];
  double v5 = v4;

  return v5;
}

- (void)layoutSubviews
{
  uint64_t v192 = *MEMORY[0x1E4F143B8];
  v190.receiver = self;
  v190.super_class = (Class)PKStackedTextItemGroupView;
  [(PKStackedTextItemGroupView *)&v190 layoutSubviews];
  [(PKStackedTextItemGroupView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double top = self->_contentInset.top;
  double left = self->_contentInset.left;
  double v10 = v9 - (left + self->_contentInset.right);
  double v12 = v11 - (top + self->_contentInset.bottom);
  BOOL v13 = self->_boundsSize.height == v12 && self->_boundsSize.width == v10;
  self->_boundsSize.width = v10;
  self->_boundsSize.height = v12;
  CGFloat v140 = v12;
  int v14 = [(PKStackedTextItemGroupView *)self _shouldReverseLayoutDirection];
  int v149 = v14;
  if (v14) {
    CGRectEdge v15 = CGRectMaxXEdge;
  }
  else {
    CGRectEdge v15 = CGRectMinXEdge;
  }
  if (v14) {
    CGRectEdge v16 = CGRectMinXEdge;
  }
  else {
    CGRectEdge v16 = CGRectMaxXEdge;
  }
  uint64_t v17 = [(NSMutableArray *)self->_itemViews count];
  if (v17)
  {
    uint64_t v18 = v17;
    v19 = [(NSMutableArray *)self->_itemViews objectAtIndexedSubscript:0];
    if (v18 == 1)
    {
      v20 = 0;
    }
    else
    {
      v20 = [(NSMutableArray *)self->_itemViews objectAtIndexedSubscript:1];
    }
  }
  else
  {
    v20 = 0;
    v19 = 0;
  }
  double v138 = v6 + top;
  double v139 = v4 + left;
  v21 = [v19 content];
  v144 = [v20 content];
  v22 = (double *)MEMORY[0x1E4F1DB30];
  v142 = v20;
  v143 = v19;
  v141 = v21;
  double v145 = v10;
  if (v13)
  {
    [v19 frame];
    double v24 = v23;
    [v20 frame];
    double v26 = v25;
    goto LABEL_84;
  }
  long long v188 = 0u;
  long long v189 = 0u;
  long long v186 = 0u;
  long long v187 = 0u;
  long long v184 = 0u;
  long long v185 = 0u;
  long long v182 = 0u;
  long long v183 = 0u;
  long long v181 = 0u;
  long long v179 = 0u;
  memset(&remainder, 0, sizeof(remainder));
  long long v177 = 0u;
  long long v178 = 0u;
  long long v175 = 0u;
  long long v176 = 0u;
  long long v173 = 0u;
  long long v174 = 0u;
  long long v171 = 0u;
  long long v172 = 0u;
  memset(&slice, 0, sizeof(slice));
  if (v19) {
    [v19 boundingMetricForWidth:v10];
  }
  if (v20) {
    [v20 boundingMetricForWidth:v10];
  }
  PKFloatRoundToPixel();
  double v137 = v27;
  unint64_t v136 = __PAIR64__(v16, v15);
  if ([v21 isSignificantPrimary]) {
    int v147 = [v144 isSignificantPrimary] ^ 1;
  }
  else {
    int v147 = 0;
  }
  unint64_t v28 = 0;
  unint64_t v29 = 0;
  double v150 = v22[1];
  double v152 = *v22;
  while (1)
  {
    v30 = &remainder.origin.x + 5 * v28;
    CGFloat v32 = v30[2];
    double v33 = v30[3];
    v31 = (char *)(v30 + 2);
    double v34 = *((double *)v31 + 2);
    double v35 = *((double *)v31 + 3);
    v36 = &slice.origin.x + 5 * v29;
    CGFloat v38 = v36[2];
    double v39 = v36[3];
    v37 = (char *)(v36 + 2);
    double v41 = *((double *)v37 + 2);
    double v40 = *((double *)v37 + 3);
    if (v34 == v152 && v35 == v150) {
      goto LABEL_43;
    }
    if (v41 == v152 && v40 == v150) {
      goto LABEL_43;
    }
    if (v33 < v39
      || (v193.origin.x = v38,
          v193.origin.y = v39,
          v193.size.width = *((CGFloat *)v37 + 2),
          double v44 = v32,
          v193.size.height = *((CGFloat *)v37 + 3),
          CGFloat v45 = CGRectGetMaxY(v193),
          CGFloat v32 = v44,
          v33 > v45))
    {
      if (v39 < v33) {
        goto LABEL_43;
      }
      v194.origin.x = v32;
      v194.origin.y = v33;
      v194.size.width = v34;
      double v46 = v32;
      v194.size.height = v35;
      CGFloat MaxY = CGRectGetMaxY(v194);
      CGFloat v32 = v46;
      if (v39 > MaxY) {
        goto LABEL_43;
      }
    }
    if (v34 + 5.0 + v41 <= v145)
    {
LABEL_43:
      double v49 = v41;
      double v48 = v34;
    }
    else
    {
      if (v147)
      {
        if (v34 <= v137) {
          double v48 = v34;
        }
        else {
          double v48 = v137;
        }
        double v49 = v145 - v48 + -5.0;
      }
      else
      {
        if (v41 <= v137) {
          double v49 = v41;
        }
        else {
          double v49 = v137;
        }
        double v48 = v145 - v49 + -5.0;
      }
      v62 = (char *)&remainder + 40 * v28;
      int v64 = v62[48];
      v63 = (BOOL *)(v62 + 48);
      if (!v64) {
        BOOL *v63 = v48 < v34;
      }
      *((double *)v31 + 2) = v48;
      v65 = (char *)&slice + 40 * v29;
      int v67 = v65[48];
      v66 = (BOOL *)(v65 + 48);
      if (!v67) {
        BOOL *v66 = v49 < v41;
      }
      *((double *)v37 + 2) = v49;
    }
    if (v28 >= 3 && v29 >= 3) {
      break;
    }
    unint64_t v50 = v28 + 1;
    CGFloat v51 = v32;
    double v52 = v33;
    double v53 = v35;
    double v54 = CGRectGetMaxY(*(CGRect *)(&v48 - 2));
    v195.origin.x = v38;
    v195.origin.y = v39;
    v195.size.width = v49;
    v195.size.height = v40;
    double v55 = CGRectGetMaxY(v195);
    if (v55 == v54)
    {
      if (v28 >= 3) {
        unint64_t v50 = v28;
      }
      if (v29 >= 3) {
        unint64_t v56 = v29;
      }
      else {
        unint64_t v56 = v29 + 1;
      }
    }
    else
    {
      if (v28 <= 2 && v55 > v54)
      {
        unint64_t v56 = v29;
        goto LABEL_69;
      }
      BOOL v57 = v54 > v55;
      BOOL v58 = v29 < 3;
      if (v29 >= 3) {
        unint64_t v59 = v29;
      }
      else {
        unint64_t v59 = v29 + 1;
      }
      if (v28 >= 3)
      {
        unint64_t v60 = v28;
      }
      else
      {
        unint64_t v59 = v29;
        unint64_t v60 = v28 + 1;
      }
      BOOL v61 = !v58 || !v57;
      if (v58 && v57) {
        unint64_t v56 = v29 + 1;
      }
      else {
        unint64_t v56 = v59;
      }
      if (v61) {
        unint64_t v50 = v60;
      }
      else {
        unint64_t v50 = v28;
      }
    }
    if (v50 == v28 && v56 == v29) {
      break;
    }
LABEL_69:
    if (v50 <= 3)
    {
      unint64_t v28 = v50;
      unint64_t v29 = v56;
      if (v56 < 4) {
        continue;
      }
    }
    break;
  }
  double v24 = 0.0;
  uint64_t v68 = 32;
  double v26 = 0.0;
  do
  {
    double v24 = fmax(v24, *(double *)((char *)&remainder.origin.x + v68));
    double v26 = fmax(v26, *(double *)((char *)&slice.origin.x + v68));
    v68 += 40;
  }
  while (v68 != 192);
  remainder.origin.x = v24;
  slice.origin.x = v26;
  long long v167 = v187;
  long long v168 = v188;
  long long v169 = v189;
  long long v163 = v183;
  long long v164 = v184;
  long long v165 = v185;
  long long v166 = v186;
  CGRect v160 = remainder;
  long long v161 = v181;
  long long v162 = v182;
  v19 = v143;
  [v143 setContentConstraints:&v160];
  long long v167 = v177;
  long long v168 = v178;
  long long v169 = v179;
  long long v163 = v173;
  long long v164 = v174;
  long long v165 = v175;
  long long v166 = v176;
  CGRect v160 = slice;
  long long v161 = v171;
  long long v162 = v172;
  v20 = v142;
  [v142 setContentConstraints:&v160];
  v21 = v141;
  CGRectEdge v16 = HIDWORD(v136);
LABEL_84:
  memset(&slice, 0, sizeof(slice));
  PKUIGetMinScreenType();
  PKFloatRoundToPixel();
  double v70 = v69;
  PKSizeAlignedInRect();
  CGFloat v72 = v71;
  CGFloat v153 = v73;
  double v148 = v139 - (v70 + self->_contentInset.left) - (v145 + self->_contentInset.right);
  v196.origin.x = v139;
  CGFloat v75 = v74;
  v196.origin.y = v138;
  CGFloat v77 = v76;
  v196.size.width = v145;
  v196.size.height = v140;
  CGFloat MaxX = CGRectGetMaxX(v196);
  double v79 = v70 + self->_contentInset.right;
  CGFloat v80 = v72;
  double v151 = MaxX + v79 + v145 + self->_contentInset.left;
  remainder.origin.x = v72;
  remainder.origin.y = v153;
  remainder.size.width = v75;
  remainder.size.height = v77;
  if (v19)
  {
    BOOL v81 = self->_animated && !self->_initialLayout[0];
    objc_msgSend(v19, "setTextAlignment:animated:", 0, v81, v136);
    CGRectDivide(remainder, &slice, &remainder, v24, v15);
    PKSizeAlignedInRect();
    double v86 = v83;
    double v87 = v84;
    double v88 = v85;
    BOOL animated = self->_animated;
    if (!self->_initialLayout[0]) {
      goto LABEL_94;
    }
    if (!self->_animated || !self->_slideMode) {
      goto LABEL_96;
    }
    double v146 = v82;
    double v90 = v151 - v84;
    if (!v149) {
      double v90 = v148;
    }
    objc_msgSend(v19, "setFrame:", v90, v83, v84, v85);
    [v19 layoutIfNeeded];
    double v82 = v146;
    self->_initialLayout[0] = 0;
    BOOL animated = self->_animated;
LABEL_94:
    if (animated) {
      uint64_t v91 = 1;
    }
    else {
LABEL_96:
    }
      uint64_t v91 = 0;
    objc_msgSend(v19, "pkui_setFrame:animated:", v91, v82, v86, v87, v88);
    [v19 layoutIfNeededAnimated:v91];
  }
  remainder.origin.x = v80;
  remainder.origin.y = v153;
  remainder.size.width = v75;
  remainder.size.height = v77;
  if (v20)
  {
    BOOL v92 = self->_animated && !self->_initialLayout[1];
    objc_msgSend(v20, "setTextAlignment:animated:", 1, v92, v136);
    CGRectDivide(remainder, &slice, &remainder, v26, v16);
    PKSizeAlignedInRect();
    double v97 = v96;
    double v98 = v93;
    double v99 = v94;
    double v100 = v95;
    BOOL v101 = self->_animated;
    if (!self->_initialLayout[1]) {
      goto LABEL_108;
    }
    if (!self->_animated || !self->_slideMode) {
      goto LABEL_110;
    }
    double v102 = v151 - v94;
    if (v149) {
      double v102 = v148;
    }
    objc_msgSend(v20, "setFrame:", v102, v93, v94, v95);
    [v20 layoutIfNeeded];
    self->_initialLayout[1] = 0;
    BOOL v101 = self->_animated;
LABEL_108:
    if (v101) {
      uint64_t v103 = 1;
    }
    else {
LABEL_110:
    }
      uint64_t v103 = 0;
    objc_msgSend(v20, "pkui_setFrame:animated:", v103, v97, v98, v99, v100);
    [v20 layoutIfNeededAnimated:v103];
  }
  snapshotsToRemove = self->_snapshotsToRemove;
  if (snapshotsToRemove)
  {
    long long v158 = 0u;
    long long v159 = 0u;
    long long v156 = 0u;
    long long v157 = 0u;
    v105 = snapshotsToRemove;
    uint64_t v106 = [(NSMutableArray *)v105 countByEnumeratingWithState:&v156 objects:v191 count:16];
    if (!v106) {
      goto LABEL_135;
    }
    uint64_t v107 = v106;
    uint64_t v108 = *(void *)v157;
    while (1)
    {
      for (uint64_t i = 0; i != v107; ++i)
      {
        if (*(void *)v157 != v108) {
          objc_enumerationMutation(v105);
        }
        v110 = *(void **)(*((void *)&v156 + 1) + 8 * i);
        if (!self->_animated)
        {
          [*(id *)(*((void *)&v156 + 1) + 8 * i) removeFromSuperview];
          continue;
        }
        v111 = [*(id *)(*((void *)&v156 + 1) + 8 * i) layer];
        [v111 opacity];
        float v113 = v112;
        [v111 anchorPoint];
        double v115 = v114;
        double v117 = v116;
        [v111 position];
        double v119 = v118;
        double v154 = v120;
        [v111 frame];
        double v122 = v121;
        double v124 = v123;
        double v126 = v125;
        double v127 = v151 - v123;
        int64_t slideMode = self->_slideMode;
        switch(slideMode)
        {
          case 2:
            v130 = [MEMORY[0x1E4F85060] springAnimationWithKeyPath:@"position"];
            v129 = v130;
            double v131 = v148;
            if (!v149) {
              double v131 = v127;
            }
LABEL_130:
            double v132 = v131 + v115 * v124;
            double v133 = v122 + v117 * v126;
            objc_msgSend(v130, "pkui_updateForAdditiveAnimationFromPoint:toPoint:", v119, v154, v132, v133, v136);
            objc_msgSend(v111, "setPosition:", v132, v133);
            if (v129) {
              goto LABEL_131;
            }
            break;
          case 1:
            v130 = [MEMORY[0x1E4F85060] springAnimationWithKeyPath:@"position"];
            v129 = v130;
            double v131 = v148;
            if (v149) {
              double v131 = v127;
            }
            goto LABEL_130;
          case 0:
            v129 = [MEMORY[0x1E4F85060] springAnimationWithKeyPath:@"opacity"];
            objc_msgSend(v129, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", v113, 0.0);
            [v111 setOpacity:0.0];
            if (v129)
            {
LABEL_131:
              v155[0] = MEMORY[0x1E4F143A8];
              v155[1] = 3221225472;
              v155[2] = __44__PKStackedTextItemGroupView_layoutSubviews__block_invoke;
              v155[3] = &unk_1E59CB6D8;
              v155[4] = v110;
              objc_msgSend(v129, "pkui_setCompletionHandler:", v155, v136);
              id v134 = (id)objc_msgSend(v111, "pkui_addAdditiveAnimation:", v129);

              goto LABEL_132;
            }
            break;
        }
        objc_msgSend(v110, "removeFromSuperview", v136);
LABEL_132:
      }
      uint64_t v107 = [(NSMutableArray *)v105 countByEnumeratingWithState:&v156 objects:v191 count:16];
      if (!v107)
      {
LABEL_135:

        v135 = self->_snapshotsToRemove;
        self->_snapshotsToRemove = 0;

        v20 = v142;
        v19 = v143;
        v21 = v141;
        break;
      }
    }
  }
  *(_WORD *)self->_initialLayout = 0;
}

uint64_t __44__PKStackedTextItemGroupView_layoutSubviews__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

- (void)layoutIfNeededAnimated:(BOOL)a3
{
  self->_BOOL animated = a3;
  [(PKStackedTextItemGroupView *)self layoutIfNeeded];
  self->_BOOL animated = 0;
}

- (void)_updateSubviewsAnimated:(BOOL)a3
{
  uint64_t v3 = a3;
  uint64_t v101 = *MEMORY[0x1E4F143B8];
  [(PKStackedTextItemGroupView *)self layoutIfNeeded];
  self->_boundsSize = (CGSize)*MEMORY[0x1E4F1DB30];
  double v5 = [(PKStackedTextItemGroup *)self->_content items];
  if ((unint64_t)[v5 count] > 1) {
    unint64_t v6 = 2;
  }
  else {
    unint64_t v6 = [v5 count];
  }
  double v87 = objc_msgSend(v5, "subarrayWithRange:", 0, v6);

  double v88 = self;
  unsigned int v86 = v3;
  unint64_t v85 = [(NSMutableArray *)self->_itemViews count];
  if (!v85) {
    goto LABEL_29;
  }
  uint64_t v7 = 0;
  unint64_t v8 = 0;
  unint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  unint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    if (v6)
    {
      for (unint64_t i = 0; i != v6; ++i)
      {
        double v12 = [(NSMutableArray *)v88->_itemViews objectAtIndexedSubscript:v8];
        BOOL v13 = [v12 content];
        int v14 = [v13 groupingIdentifier];

        CGRectEdge v15 = [v87 objectAtIndexedSubscript:i];
        CGRectEdge v16 = [v15 groupingIdentifier];

        if (v14) {
          BOOL v17 = v16 == 0;
        }
        else {
          BOOL v17 = 1;
        }
        if (!v17 && [v14 isEqualToString:v16])
        {
          unint64_t v10 = i;
          unint64_t v9 = v8;
          ++v7;
        }
      }
    }
    ++v8;
  }
  while (v8 != v85);
  uint64_t v3 = v86;
  if (v86 && v7 == 1 && v9 != v10)
  {
    uint64_t v80 = [(NSMutableArray *)v88->_itemViews objectAtIndexedSubscript:v9];
    id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    obuint64_t j = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v19 = 0;
    double v84 = v18;
    do
    {
      if (v9 != v19)
      {
        v20 = [(NSMutableArray *)v88->_itemViews objectAtIndexedSubscript:v19];
        v21 = [v20 snapshotViewAfterScreenUpdates:0];
        if (v21)
        {
          [v20 frame];
          double v23 = v22;
          double v25 = v24;
          double v27 = v26;
          double v29 = v28;
          v30 = [v20 layer];
          v31 = [v30 presentationLayer];
          double v83 = v31;
          if (v31)
          {
            CGFloat v32 = v31;
            [v31 anchorPoint];
            double v34 = v33;
            double v36 = v35;
            [v32 position];
            double v38 = v37;
            double v40 = v39;
            [v32 bounds];
            double v27 = v41;
            double v29 = v42;
            double v23 = v38 - v34 * v41;
            double v25 = v40 - v36 * v42;
          }
          v43 = objc_msgSend(v21, "layer", v80);
          objc_msgSend(v43, "setAllowsGroupOpacity:", objc_msgSend(v30, "allowsGroupOpacity"));
          [v30 compositingFilter];
          v45 = double v44 = v30;
          [v43 setCompositingFilter:v45];

          objc_msgSend(v21, "setFrame:", v23, v25, v27, v29);
          [(PKStackedTextItemGroupView *)v88 addSubview:v21];
          [obj addObject:v21];

          id v18 = v84;
        }
        objc_msgSend(v20, "setContent:animated:", 0, 0, v80);
        [v20 prepareForReuse];
        [v18 addObject:v20];
      }
      ++v19;
    }
    while (v85 != v19);
    if (v88->_snapshotsToRemove) {
      [(NSMutableArray *)v88->_snapshotsToRemove addObjectsFromArray:obj];
    }
    else {
      objc_storeStrong((id *)&v88->_snapshotsToRemove, obj);
    }
    [(NSMutableArray *)v88->_itemViews removeAllObjects];
    if (v6)
    {
      uint64_t v65 = 0;
      initialLayout = v88->_initialLayout;
      BOOL v67 = v88->_initialLayout[v9];
      do
      {
        if (v10 == v65)
        {
          uint64_t v68 = [v87 objectAtIndexedSubscript:v10];
          [v81 setContent:v68 animated:1];

          [(NSMutableArray *)v88->_itemViews addObject:v81];
          initialLayout[v10] = v67;
        }
        else
        {
          uint64_t v69 = [v84 count];
          if (v69)
          {
            uint64_t v70 = v69;
            double v71 = [v84 lastObject];
            [v84 removeObjectAtIndex:v70 - 1];
            CGFloat v72 = v88;
          }
          else
          {
            CGFloat v72 = v88;
            double v71 = [[PKStackedTextItemView alloc] initWithStyle:v88->_style];
            [(PKStackedTextItemGroupView *)v88 addSubview:v71];
          }
          double v73 = [v87 objectAtIndexedSubscript:v65];
          [(PKStackedTextItemView *)v71 setContent:v73 animated:0];

          [(NSMutableArray *)v72->_itemViews addObject:v71];
          initialLayout[v65] = 1;
        }
        ++v65;
      }
      while (v6 != v65);
    }
    uint64_t v74 = 1;
    if (v10 > v9) {
      uint64_t v74 = 2;
    }
    v63 = &OBJC_IVAR___PKAccountInvitationChooseMemberViewController__previousHeaderHeight;
    v88->_int64_t slideMode = v74;
    long long v93 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    long long v96 = 0u;
    id v75 = v84;
    uint64_t v76 = [v75 countByEnumeratingWithState:&v93 objects:v100 count:16];
    uint64_t v3 = v86;
    if (v76)
    {
      uint64_t v77 = v76;
      uint64_t v78 = *(void *)v94;
      do
      {
        for (uint64_t j = 0; j != v77; ++j)
        {
          if (*(void *)v94 != v78) {
            objc_enumerationMutation(v75);
          }
          [*(id *)(*((void *)&v93 + 1) + 8 * j) removeFromSuperview];
        }
        uint64_t v77 = [v75 countByEnumeratingWithState:&v93 objects:v100 count:16];
      }
      while (v77);
    }

    unint64_t v50 = v88;
  }
  else
  {
LABEL_29:
    if (v6)
    {
      for (unint64_t k = 0; k != v6; ++k)
      {
        if (k >= v85)
        {
          v47 = [[PKStackedTextItemView alloc] initWithStyle:v88->_style];
          double v49 = [v87 objectAtIndexedSubscript:k];
          [(PKStackedTextItemView *)v47 setContent:v49 animated:v3];

          [(PKStackedTextItemGroupView *)v88 addSubview:v47];
          [(NSMutableArray *)v88->_itemViews addObject:v47];
          v88->_initialLayout[k] = 1;
        }
        else
        {
          v47 = [(NSMutableArray *)v88->_itemViews objectAtIndexedSubscript:k];
          double v48 = [v87 objectAtIndexedSubscript:k];
          [(PKStackedTextItemView *)v47 setContent:v48 animated:v3];
        }
      }
    }
    unint64_t v50 = v88;
    if (v85 > v6)
    {
      CGFloat v51 = -[NSMutableArray subarrayWithRange:](v88->_itemViews, "subarrayWithRange:", v6, v85 - v6);
      -[NSMutableArray removeObjectsInRange:](v88->_itemViews, "removeObjectsInRange:", v6, v85 - v6);
      long long v91 = 0u;
      long long v92 = 0u;
      long long v89 = 0u;
      long long v90 = 0u;
      id v52 = v51;
      uint64_t v53 = [v52 countByEnumeratingWithState:&v89 objects:v99 count:16];
      if (v53)
      {
        uint64_t v54 = v53;
        uint64_t v55 = *(void *)v90;
        do
        {
          for (uint64_t m = 0; m != v54; ++m)
          {
            if (*(void *)v90 != v55) {
              objc_enumerationMutation(v52);
            }
            id v57 = *(id *)(*((void *)&v89 + 1) + 8 * m);
            BOOL v58 = v57;
            if (v3)
            {
              unint64_t v59 = [v57 layer];
              unint64_t v60 = [MEMORY[0x1E4F85060] springAnimationWithKeyPath:@"opacity"];
              [v59 opacity];
              objc_msgSend(v60, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", v61, 0.0);
              v97[0] = MEMORY[0x1E4F143A8];
              v97[1] = 3221225472;
              v97[2] = __RemoveViewFromSuperview_block_invoke_0;
              v97[3] = &unk_1E59CB6D8;
              id v98 = v58;
              objc_msgSend(v60, "pkui_setCompletionHandler:", v97);
              [v59 setOpacity:0.0];
              id v62 = (id)objc_msgSend(v59, "pkui_addAdditiveAnimation:", v60);
              [v60 duration];

              uint64_t v3 = v86;
            }
            else
            {
              [v57 removeFromSuperview];
            }
          }
          uint64_t v54 = [v52 countByEnumeratingWithState:&v89 objects:v99 count:16];
        }
        while (v54);
      }

      unint64_t v50 = v88;
    }
    v63 = &OBJC_IVAR___PKAccountInvitationChooseMemberViewController__previousHeaderHeight;
    if (v6 <= 1)
    {
      do
      {
        unint64_t v64 = v6;
        v50->_initialLayout[v6] = 1;
        unint64_t v6 = 1;
      }
      while (!v64);
    }
  }
  [(PKStackedTextItemGroupView *)v50 setNeedsLayout];
  [(PKStackedTextItemGroupView *)v50 layoutIfNeededAnimated:v3];
  *(Class *)((char *)&v50->super.super.super.isa + v63[152]) = 0;
}

- (void)setContent:(id)a3
{
}

- (void)setContent:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_content, a3);
    [(PKStackedTextItemGroupView *)self _updateSubviewsAnimated:v4];
  }
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  if (self->_contentInset.left != a3.left
    || self->_contentInset.top != a3.top
    || self->_contentInset.right != a3.right
    || self->_contentInset.bottom != a3.bottom)
  {
    self->_contentInset = a3;
    [(PKStackedTextItemGroupView *)self setNeedsLayout];
  }
}

- (int64_t)style
{
  return self->_style;
}

- (PKStackedTextItemGroup)content
{
  return self->_content;
}

- (UIEdgeInsets)contentInset
{
  double top = self->_contentInset.top;
  double left = self->_contentInset.left;
  bottouint64_t m = self->_contentInset.bottom;
  double right = self->_contentInset.right;
  result.double right = right;
  result.bottouint64_t m = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_snapshotsToRemove, 0);

  objc_storeStrong((id *)&self->_itemViews, 0);
}

@end
@interface VUIFeaturedCellOverlayView
- (BOOL)usesDefaultOverlayType;
- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4;
- (NSArray)buttons;
- (UIView)appleTVChannelLogoView;
- (VUILabel)disclaimerLabel;
- (VUILabel)subtitleLabel;
- (VUILabel)titleLabel;
- (void)_layoutSubviews;
- (void)setAppleTVChannelLogoView:(id)a3;
- (void)setButtons:(id)a3;
- (void)setDisclaimerLabel:(id)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setUsesDefaultOverlayType:(BOOL)a3;
@end

@implementation VUIFeaturedCellOverlayView

- (void)setAppleTVChannelLogoView:(id)a3
{
  v5 = (UIView *)a3;
  if (self->_appleTVChannelLogoView != v5)
  {
    v6 = v5;
    -[VUIFeaturedCellOverlayView vui_addSubview:oldView:](self, "vui_addSubview:oldView:", v5);
    objc_storeStrong((id *)&self->_appleTVChannelLogoView, a3);
    [(VUIFeaturedCellOverlayView *)self vui_setNeedsLayout];
    v5 = v6;
  }
}

- (void)setTitleLabel:(id)a3
{
  v5 = (VUILabel *)a3;
  if (self->_titleLabel != v5)
  {
    v6 = v5;
    -[VUIFeaturedCellOverlayView vui_addSubview:oldView:](self, "vui_addSubview:oldView:", v5);
    objc_storeStrong((id *)&self->_titleLabel, a3);
    [(VUIFeaturedCellOverlayView *)self vui_setNeedsLayout];
    v5 = v6;
  }
}

- (void)setSubtitleLabel:(id)a3
{
  v5 = (VUILabel *)a3;
  v6 = v5;
  if (self->_subtitleLabel != v5)
  {
    -[VUIFeaturedCellOverlayView vui_addSubview:oldView:](self, "vui_addSubview:oldView:", v5);
    objc_storeStrong((id *)&self->_subtitleLabel, a3);
  }
  [(VUIFeaturedCellOverlayView *)self vui_setNeedsLayout];
}

- (void)setDisclaimerLabel:(id)a3
{
  v5 = (VUILabel *)a3;
  v6 = v5;
  if (self->_disclaimerLabel != v5)
  {
    -[VUIFeaturedCellOverlayView vui_addSubview:oldView:](self, "vui_addSubview:oldView:", v5);
    objc_storeStrong((id *)&self->_disclaimerLabel, a3);
  }
  [(VUIFeaturedCellOverlayView *)self vui_setNeedsLayout];
}

- (void)setButtons:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([v5 count] || -[NSArray count](self->_buttons, "count"))
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    p_buttons = &self->_buttons;
    v7 = self->_buttons;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v23 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v22 + 1) + 8 * i) removeFromSuperview];
        }
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v9);
    }

    objc_storeStrong((id *)p_buttons, a3);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v12 = *p_buttons;
    uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v19;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v19 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v18 + 1) + 8 * j);
          objc_msgSend(v17, "vui_setNeedsLayout", (void)v18);
          [(VUIFeaturedCellOverlayView *)self vui_addSubview:v17 oldView:0];
        }
        uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
      }
      while (v14);
    }

    [(VUIFeaturedCellOverlayView *)self vui_setNeedsLayout];
  }
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  v12.receiver = self;
  v12.super_class = (Class)VUIFeaturedCellOverlayView;
  [(VUIFeaturedCellOverlayView *)&v12 vui_layoutSubviews:a3.width computationOnly:a3.height];
  double v7 = v6;
  double v9 = v8;
  if (!a4) {
    [(VUIFeaturedCellOverlayView *)self _layoutSubviews];
  }
  double v10 = v7;
  double v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)_layoutSubviews
{
  uint64_t v153 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4FB1F48], "vui_currentSizeClass");
  objc_msgSend(MEMORY[0x1E4FB1F48], "vui_padding");
  double v5 = v4;
  double v7 = v6;
  double v8 = objc_msgSend(MEMORY[0x1E4FB1F48], "vui_keyWindow");
  [v8 bounds];
  double Width = CGRectGetWidth(v154);

  [(VUIFeaturedCellOverlayView *)self bounds];
  double v10 = CGRectGetWidth(v155);
  [(VUIFeaturedCellOverlayView *)self bounds];
  double Height = CGRectGetHeight(v156);
  double v12 = 28.0;
  if (v3 == 7) {
    double v12 = 16.0;
  }
  if (v3 <= 2) {
    double v13 = 24.0;
  }
  else {
    double v13 = v12;
  }
  if (self->_usesDefaultOverlayType)
  {
    if ((unint64_t)v3 <= 2)
    {
      if (v10 == Width)
      {
        double v14 = Width - v5 - v7;
        double v15 = 8.0;
        double v16 = 20.0;
        double v17 = v5;
      }
      else
      {
        [(VUIFeaturedCellOverlayView *)self bounds];
        double v14 = CGRectGetWidth(v157);
        double v15 = v5 * 0.5 + 30.0;
        double v16 = v5 * 0.5 + 20.0;
        double v17 = 0.0;
        double v5 = -0.0;
      }
      double v118 = v17;
      double v119 = v14;
      int v18 = 0;
      double v130 = v14 + v16 * -2.0;
      double v132 = v5 + v16;
      double v21 = v5 + v15;
      double v116 = 20.0;
      double v123 = 28.0;
      double v127 = 26.0;
      double v120 = 24.0;
      double v20 = 20.0;
      goto LABEL_27;
    }
    if (v3 == 7)
    {
      if (v10 == Width) {
        double v22 = v5;
      }
      else {
        double v22 = 80.0;
      }
      double v15 = 30.0;
      double v21 = v22 + 30.0;
      int v18 = 1;
      double v20 = 48.0;
      double v123 = 64.0;
      *(double *)&uint64_t v19 = 410.0;
      double v127 = 54.0;
      double v120 = 50.0;
      double v116 = 48.0;
      goto LABEL_25;
    }
    double v22 = v5 + 16.0;
    double v15 = 0.0;
    double v127 = 26.0;
    int v18 = 1;
    double v116 = 20.0;
    double v120 = 24.0;
    *(double *)&uint64_t v19 = 248.0;
    double v123 = 26.0;
    double v20 = 26.0;
LABEL_24:
    double v21 = v22;
LABEL_25:
    double v118 = v22;
    goto LABEL_26;
  }
  if ((unint64_t)v3 >= 3)
  {
    double v116 = 0.0;
    if (v3 == 7)
    {
      int v18 = 1;
      double v123 = 62.0;
      *(double *)&uint64_t v19 = 410.0;
      double v22 = 80.0;
      double v127 = 72.0;
      double v120 = 50.0;
    }
    else
    {
      double v120 = 20.0;
      int v18 = 1;
      *(double *)&uint64_t v19 = 154.0;
      double v22 = 32.0;
      double v127 = 20.0;
      double v123 = 20.0;
    }
    double v20 = 0.0;
    double v15 = 0.0;
    goto LABEL_24;
  }
  double v118 = 16.0;
  double v116 = 0.0;
  double v120 = 18.0;
  int v18 = 1;
  *(double *)&uint64_t v19 = 108.0;
  double v127 = 18.0;
  double v123 = 18.0;
  double v20 = 0.0;
  double v15 = 0.0;
  double v21 = 16.0;
  double v22 = 16.0;
LABEL_26:
  double v130 = *(double *)&v19;
  double v132 = v22;
  double v119 = *(double *)&v19;
LABEL_27:
  long long v23 = (double *)MEMORY[0x1E4F1DB28];
  buttons = self->_buttons;
  double v25 = 0.0;
  if (buttons && [(NSArray *)buttons count] >= 2)
  {
    if (v3 == 7)
    {
      double v117 = v20;
      double v115 = 24.0;
      char v26 = 1;
      double v120 = 64.0;
    }
    else
    {
      double v113 = v123;
      if (v3 > 2) {
        double v113 = 34.0;
      }
      double v123 = v113;
      if (v3 > 2) {
        double v20 = 34.0;
      }
      double v117 = v20;
      double v120 = 26.0;
      double v115 = 20.0;
      char v26 = 1;
    }
  }
  else
  {
    double v117 = v20;
    char v26 = 0;
    double v115 = 0.0;
  }
  double v27 = *v23;
  double v28 = v23[1];
  double v30 = v23[2];
  double v29 = v23[3];
  disclaimerLabel = self->_disclaimerLabel;
  double v129 = v30;
  double v135 = v29;
  double rect = v28;
  double v133 = *v23;
  if (disclaimerLabel)
  {
    v32 = [(VUILabel *)disclaimerLabel vuiText];
    if ([v32 length]) {
      char v33 = v26;
    }
    else {
      char v33 = 1;
    }

    if (v33)
    {
      v34 = 0;
      double v125 = v30;
      double v126 = v135;
      double v128 = v28;
      double v122 = v133;
    }
    else
    {
      [(VUILabel *)self->_disclaimerLabel bottomMarginWithBaselineMargin:0.0];
      double v36 = v35;
      -[VUILabel sizeThatFits:](self->_disclaimerLabel, "sizeThatFits:", v130, 1.79769313e308);
      v158.size.height = v37;
      v158.origin.x = v132;
      v158.origin.y = v28;
      v158.size.width = v130;
      double v126 = v158.size.height;
      double v38 = v36 + CGRectGetHeight(v158);
      double v30 = v129;
      double Height = Height - v38;
      v34 = self->_disclaimerLabel;
      double v25 = v120;
      double v125 = v130;
      double v122 = v132;
      double v128 = Height;
    }
  }
  else
  {
    v34 = 0;
    double v125 = v30;
    double v126 = v29;
    double v128 = v28;
    double v122 = v27;
  }
  unint64_t v39 = 0x1E4F1C000uLL;
  v40 = [MEMORY[0x1E4F1CA48] array];
  v41 = self->_buttons;
  v134 = self;
  if (!v41 || ![(NSArray *)v41 count])
  {
    obuint64_t j = 0;
    double v63 = v130;
    double v64 = v123;
    goto LABEL_63;
  }
  v42 = [(NSArray *)self->_buttons reverseObjectEnumerator];
  v43 = [v42 allObjects];

  long long v148 = 0u;
  long long v149 = 0u;
  long long v146 = 0u;
  long long v147 = 0u;
  obuint64_t j = v43;
  uint64_t v44 = [obj countByEnumeratingWithState:&v146 objects:v152 count:16];
  if (!v44) {
    goto LABEL_61;
  }
  uint64_t v45 = v44;
  char v114 = v26;
  uint64_t v46 = *(void *)v147;
  double v47 = v119 + v15 * -2.0;
  do
  {
    for (uint64_t i = 0; i != v45; ++i)
    {
      v49 = v34;
      if (*(void *)v147 != v46) {
        objc_enumerationMutation(obj);
      }
      v50 = *(void **)(*((void *)&v146 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), double v51 = 0.0, (objc_opt_isKindOfClass()))
      {
        [(VUILabel *)v49 topMarginWithBaselineMargin:v25];
        double v51 = v52;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_msgSend(v50, "vui_sizeThatFits:", v47, 0.0);
        double v54 = v53;
        id v55 = v50;
        v56 = v55;
        if (v55 && (![v55 buttonType] || objc_msgSend(v56, "buttonType") == 3) && v3 <= 2)
        {
          [(VUIFeaturedCellOverlayView *)v134 bounds];
          double v57 = CGRectGetWidth(v159);
          [v56 width];
          double v59 = (v57 - v58) * 0.5;
          [v56 width];
          double v61 = v60;
          goto LABEL_58;
        }
      }
      else
      {
        v56 = 0;
        double v54 = v135;
      }
      double v59 = v21;
      double v61 = v47;
LABEL_58:
      v160.origin.x = v59;
      v160.origin.y = rect;
      v160.size.width = v61;
      v160.size.height = v54;
      double Height = Height - (v51 + CGRectGetHeight(v160));
      v34 = v50;

      v62 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v59, Height, v61, v54);
      [v40 addObject:v62];

      double v25 = v13;
    }
    uint64_t v45 = [obj countByEnumeratingWithState:&v146 objects:v152 count:16];
    double v25 = v13;
  }
  while (v45);
  double v25 = v13;
  self = v134;
  char v26 = v114;
  double v30 = v129;
  double v28 = rect;
LABEL_61:

  double v63 = v130;
  double v64 = v123;
  unint64_t v39 = 0x1E4F1C000;
LABEL_63:
  v65 = self->_disclaimerLabel;
  if (v65)
  {
    v66 = [(VUILabel *)v65 vuiText];
    uint64_t v67 = [v66 length];

    char v68 = v26 ^ 1;
    if (!v67) {
      char v68 = 1;
    }
    if ((v68 & 1) == 0)
    {
      [(VUILabel *)self->_disclaimerLabel bottomMarginWithBaselineMargin:v115];
      double v70 = v69;
      -[VUILabel sizeThatFits:](self->_disclaimerLabel, "sizeThatFits:", v63, 1.79769313e308);
      v161.size.height = v71;
      v161.origin.x = v132;
      v161.origin.y = v128;
      v161.size.width = v63;
      double v126 = v161.size.height;
      double v72 = v70 + CGRectGetHeight(v161);
      double v30 = v129;
      double Height = Height - v72;
      v73 = self->_disclaimerLabel;

      v34 = v73;
      double v125 = v63;
      double v122 = v132;
      double v28 = rect;
      double v128 = Height;
      double v25 = v120;
    }
  }
  if (self->_subtitleLabel)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(VUILabel *)v34 topMarginToLabel:self->_subtitleLabel withBaselineMargin:v25];
    }
    else {
      [(VUILabel *)self->_subtitleLabel bottomMarginWithBaselineMargin:v116];
    }
    double v78 = v74;
    -[VUILabel sizeThatFits:](self->_subtitleLabel, "sizeThatFits:", v63, 1.79769313e308);
    double v76 = v79;
    v162.origin.x = v132;
    v162.origin.y = v28;
    v162.size.width = v63;
    v162.size.height = v76;
    double v28 = Height - (v78 + CGRectGetHeight(v162));
    v80 = self->_subtitleLabel;

    v34 = v80;
    double v124 = v63;
    double v121 = v132;
    double Height = v28;
    double v30 = v129;
    double v75 = v135;
    double v77 = v133;
  }
  else
  {
    double v127 = v25;
    double v75 = v135;
    double v76 = v135;
    double v124 = v30;
    double v77 = v133;
    double v121 = v133;
  }
  if (self->_titleLabel)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(VUILabel *)v34 topMarginToLabel:self->_titleLabel withBaselineMargin:v127];
    }
    else {
      [(VUILabel *)self->_titleLabel bottomMarginWithBaselineMargin:v117];
    }
    double v83 = v81;
    -[VUILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v63, 1.79769313e308);
    double v75 = v84;
    v163.origin.x = v132;
    v163.origin.y = rect;
    v163.size.width = v63;
    v163.size.height = v75;
    double v82 = Height - (v83 + CGRectGetHeight(v163));
    v85 = self->_titleLabel;

    double v127 = v64;
    v34 = v85;
    double Height = v82;
    double v30 = v129;
  }
  else
  {
    double v63 = v30;
    double v82 = rect;
    double v132 = v77;
  }
  appleTVChannelLogoView = self->_appleTVChannelLogoView;
  if (appleTVChannelLogoView)
  {
    double v131 = v63;
    double v87 = v82;
    double v88 = v75;
    double v89 = v28;
    double v90 = v64;
    -[UIView vui_sizeThatFits:](appleTVChannelLogoView, "vui_sizeThatFits:", v119, 0.0);
    double v30 = v91;
    v164.size.height = v92;
    v164.origin.x = v133;
    v164.origin.y = rect;
    v164.size.width = v30;
    double v135 = v164.size.height;
    CGRectGetWidth(v164);
    VUIRoundValue();
    double v133 = v118 + v93;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(VUILabel *)v34 topMarginWithBaselineMargin:v127];
      double v90 = v94;
    }
    v165.origin.x = v133;
    v165.origin.y = rect;
    v165.size.width = v30;
    v165.size.height = v135;
    double rect = Height - (v90 + CGRectGetHeight(v165));
    double v28 = v89;
    double v75 = v88;
    double v82 = v87;
    double v63 = v131;
  }
  double v95 = 20.0;
  if (v18)
  {
    VUIRoundValue();
    double v95 = v96;
  }
  v97 = [*(id *)(v39 + 2632) array];
  long long v142 = 0u;
  long long v143 = 0u;
  long long v144 = 0u;
  long long v145 = 0u;
  id v98 = v40;
  uint64_t v99 = [v98 countByEnumeratingWithState:&v142 objects:v151 count:16];
  if (v99)
  {
    uint64_t v100 = v99;
    uint64_t v101 = *(void *)v143;
    do
    {
      for (uint64_t j = 0; j != v100; ++j)
      {
        if (*(void *)v143 != v101) {
          objc_enumerationMutation(v98);
        }
        [*(id *)(*((void *)&v142 + 1) + 8 * j) CGRectValue];
        v103 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:");
        [v97 addObject:v103];
      }
      uint64_t v100 = [v98 countByEnumeratingWithState:&v142 objects:v151 count:16];
    }
    while (v100);
  }

  v104 = (void *)[v97 copy];
  -[UIView setFrame:](v134->_appleTVChannelLogoView, "setFrame:", v133, rect - v95, v30, v135);
  -[VUILabel setFrame:](v134->_titleLabel, "setFrame:", v132, v82 - v95, v63, v75);
  -[VUILabel setFrame:](v134->_subtitleLabel, "setFrame:", v121, v28 - v95, v124, v76);
  long long v140 = 0u;
  long long v141 = 0u;
  long long v138 = 0u;
  long long v139 = 0u;
  id v105 = obj;
  uint64_t v106 = [v105 countByEnumeratingWithState:&v138 objects:v150 count:16];
  if (v106)
  {
    uint64_t v107 = v106;
    uint64_t v108 = 0;
    uint64_t v109 = *(void *)v139;
    do
    {
      for (uint64_t k = 0; k != v107; ++k)
      {
        if (*(void *)v139 != v109) {
          objc_enumerationMutation(v105);
        }
        v111 = *(void **)(*((void *)&v138 + 1) + 8 * k);
        v112 = [v104 objectAtIndex:v108 + k];
        [v112 CGRectValue];
        objc_msgSend(v111, "setFrame:");
      }
      uint64_t v107 = [v105 countByEnumeratingWithState:&v138 objects:v150 count:16];
      v108 += k;
    }
    while (v107);
  }

  -[VUILabel setFrame:](v134->_disclaimerLabel, "setFrame:", v122, v128 - v95, v125, v126);
}

- (UIView)appleTVChannelLogoView
{
  return self->_appleTVChannelLogoView;
}

- (VUILabel)titleLabel
{
  return self->_titleLabel;
}

- (VUILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (VUILabel)disclaimerLabel
{
  return self->_disclaimerLabel;
}

- (NSArray)buttons
{
  return self->_buttons;
}

- (BOOL)usesDefaultOverlayType
{
  return self->_usesDefaultOverlayType;
}

- (void)setUsesDefaultOverlayType:(BOOL)a3
{
  self->_usesDefaultOverlayType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttons, 0);
  objc_storeStrong((id *)&self->_disclaimerLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_appleTVChannelLogoView, 0);
}

@end
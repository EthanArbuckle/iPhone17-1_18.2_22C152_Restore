@interface VUIListLockupCollectionViewCellView
- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4;
- (FocusableTextView)descriptionTextView;
- (UIView)imageView;
- (VUIButton)primaryButton;
- (VUIButton)secondaryButton;
- (VUILabel)subTitleLabel;
- (VUILabel)titleLabel;
- (VUIListLockupCollectionViewCellView)initWithFrame:(CGRect)a3;
- (VUISeparatorView)separatorView;
- (int64_t)imagePosition;
- (void)setDescriptionTextView:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setImagePosition:(int64_t)a3;
- (void)setImageView:(id)a3;
- (void)setPrimaryButton:(id)a3;
- (void)setSecondaryButton:(id)a3;
- (void)setSemanticContentAttribute:(int64_t)a3;
- (void)setSeparatorView:(id)a3;
- (void)setSubTitleLabel:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)vui_prepareForReuse;
- (void)vui_setHighlighted:(BOOL)a3;
@end

@implementation VUIListLockupCollectionViewCellView

- (VUIListLockupCollectionViewCellView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)VUIListLockupCollectionViewCellView;
  v3 = -[VUIListLockupCollectionViewCellView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [VUISeparatorView alloc];
    uint64_t v5 = -[VUISeparatorView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    separatorView = v3->_separatorView;
    v3->_separatorView = (VUISeparatorView *)v5;

    [(VUIListLockupCollectionViewCellView *)v3 addSubview:v3->_separatorView];
  }
  return v3;
}

- (void)setTitleLabel:(id)a3
{
  uint64_t v5 = (VUILabel *)a3;
  if (self->_titleLabel != v5)
  {
    v6 = v5;
    -[VUIListLockupCollectionViewCellView vui_addSubview:oldView:](self, "vui_addSubview:oldView:", v5);
    objc_storeStrong((id *)&self->_titleLabel, a3);
    [(VUIListLockupCollectionViewCellView *)self vui_setNeedsLayout];
    uint64_t v5 = v6;
  }
}

- (void)setSubTitleLabel:(id)a3
{
  uint64_t v5 = (VUILabel *)a3;
  if (self->_subTitleLabel != v5)
  {
    v6 = v5;
    -[VUIListLockupCollectionViewCellView vui_addSubview:oldView:](self, "vui_addSubview:oldView:", v5);
    objc_storeStrong((id *)&self->_subTitleLabel, a3);
    [(VUIListLockupCollectionViewCellView *)self vui_setNeedsLayout];
    uint64_t v5 = v6;
  }
}

- (void)setDescriptionTextView:(id)a3
{
  uint64_t v5 = (FocusableTextView *)a3;
  if (self->_descriptionTextView != v5)
  {
    v6 = v5;
    -[VUIListLockupCollectionViewCellView vui_addSubview:oldView:](self, "vui_addSubview:oldView:", v5);
    objc_storeStrong((id *)&self->_descriptionTextView, a3);
    [(VUIListLockupCollectionViewCellView *)self vui_setNeedsLayout];
    uint64_t v5 = v6;
  }
}

- (void)setPrimaryButton:(id)a3
{
  uint64_t v5 = (VUIButton *)a3;
  if (self->_primaryButton != v5)
  {
    v6 = v5;
    -[VUIListLockupCollectionViewCellView vui_addSubview:oldView:](self, "vui_addSubview:oldView:", v5);
    objc_storeStrong((id *)&self->_primaryButton, a3);
    [(VUIListLockupCollectionViewCellView *)self vui_setNeedsLayout];
    uint64_t v5 = v6;
  }
}

- (void)setSecondaryButton:(id)a3
{
  uint64_t v5 = (VUIButton *)a3;
  if (self->_secondaryButton != v5)
  {
    v6 = v5;
    -[VUIListLockupCollectionViewCellView vui_addSubview:oldView:](self, "vui_addSubview:oldView:", v5);
    objc_storeStrong((id *)&self->_secondaryButton, a3);
    [(VUIListLockupCollectionViewCellView *)self vui_setNeedsLayout];
    uint64_t v5 = v6;
  }
}

- (void)setImageView:(id)a3
{
  uint64_t v5 = (UIView *)a3;
  if (self->_imageView != v5)
  {
    v6 = v5;
    -[VUIListLockupCollectionViewCellView vui_addSubview:oldView:](self, "vui_addSubview:oldView:", v5);
    objc_storeStrong((id *)&self->_imageView, a3);
    [(VUIListLockupCollectionViewCellView *)self vui_setNeedsLayout];
    uint64_t v5 = v6;
  }
}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)VUIListLockupCollectionViewCellView;
  -[VUIListLockupCollectionViewCellView setSemanticContentAttribute:](&v5, sel_setSemanticContentAttribute_);
  [(VUILabel *)self->_subTitleLabel setSemanticContentAttribute:a3];
  [(VUILabel *)self->_titleLabel setSemanticContentAttribute:a3];
  [(FocusableTextView *)self->_descriptionTextView setSemanticContentAttribute:a3];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)VUIListLockupCollectionViewCellView;
  -[VUIListLockupCollectionViewCellView setHighlighted:](&v5, sel_setHighlighted_);
  [(VUIListLockupCollectionViewCellView *)self vui_setHighlighted:v3];
}

- (void)vui_setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  -[VUILabel setHighlighted:](self->_titleLabel, "setHighlighted:");
  [(VUILabel *)self->_subTitleLabel setHighlighted:v3];
  descriptionTextView = self->_descriptionTextView;
  [(FocusableTextView *)descriptionTextView setHighlighted:v3];
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double height = a3.height;
  double width = a3.width;
  if (a3.width == *MEMORY[0x1E4F1DB30] && a3.height == *(double *)(MEMORY[0x1E4F1DB30] + 8)) {
    goto LABEL_97;
  }
  int64_t imagePosition = self->_imagePosition;
  double v10 = 16.0;
  if (imagePosition == 2) {
    double v10 = 20.0;
  }
  double rect_24 = v10;
  double v11 = 10.0;
  if (imagePosition == 2) {
    double v11 = 12.0;
  }
  double v165 = v11;
  [(VUISeparatorView *)self->_separatorView lineHeight];
  double v13 = v12;
  v14 = [(VUIListLockupCollectionViewCellView *)self vuiTraitCollection];
  int v15 = [v14 isAXEnabled];

  double v16 = *MEMORY[0x1E4F1DB28];
  double v196 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  CGFloat v18 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  CGFloat v17 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  imageView = self->_imageView;
  CGFloat rect = *MEMORY[0x1E4F1DB28];
  double v186 = v18;
  double v166 = v13;
  BOOL v173 = a4;
  if (!v15)
  {
    CGFloat v26 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    CGFloat v27 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    if (imageView)
    {
      -[UIView vui_sizeThatFits:](imageView, "vui_sizeThatFits:", width, height);
      CGFloat v27 = v28;
      CGFloat v26 = v29;
    }
    v199.origin.x = v16;
    v199.origin.CGFloat y = v196;
    v199.size.double width = v27;
    v199.size.double height = v26;
    v223.origin.x = v16;
    v223.origin.CGFloat y = v196;
    v223.size.double width = v18;
    v223.size.double height = v17;
    BOOL v30 = CGRectEqualToRect(v199, v223);
    double v31 = 8.0;
    if (v30) {
      double v31 = v196;
    }
    CGFloat v189 = v27;
    CGFloat y = v31;
    if (v30) {
      double v32 = v16;
    }
    else {
      double v32 = 0.0;
    }
    double v194 = v26;
    if (v30)
    {
      double v195 = width;
    }
    else
    {
      double v195 = width;
      if (imagePosition != 2)
      {
        [(VUIListLockupCollectionViewCellView *)self bounds];
        CGRectGetHeight(v200);
        double v32 = 0.0;
        v201.origin.x = 0.0;
        v201.origin.CGFloat y = v196;
        v201.size.double width = v27;
        v201.size.double height = v26;
        CGRectGetHeight(v201);
        VUIRoundValue();
        v202.origin.CGFloat y = v33;
        v202.origin.x = 0.0;
        CGFloat y = v202.origin.y;
        v202.size.double width = v27;
        v202.size.double height = v26;
        double v195 = width - (v165 + CGRectGetWidth(v202));
      }
    }
    primaryButton = self->_primaryButton;
    double v188 = v32;
    if (primaryButton)
    {
      -[UIView vui_sizeThatFits:](primaryButton, "vui_sizeThatFits:", width, 1.79769313e308);
      CGFloat v68 = v67;
      CGFloat v70 = v69;
      v208.origin.x = v16;
      v208.origin.CGFloat y = v196;
      v208.size.double width = v68;
      v208.size.double height = v70;
      double v71 = CGRectGetWidth(v208);
      double v72 = width - v71;
      CGFloat v164 = v70;
      double v159 = width - v71;
      if (imagePosition == 2)
      {
        double v185 = 0.0;
        double v174 = 8.0;
        CGFloat v18 = v186;
LABEL_47:
        titleLabel = self->_titleLabel;
        double v171 = v68;
        if (titleLabel)
        {
          -[UIView vui_sizeThatFits:](titleLabel, "vui_sizeThatFits:", v195, 1.79769313e308);
          CGFloat v76 = v75;
          double v161 = 0.0;
          if (imagePosition == 2)
          {
            [(VUILabel *)self->_titleLabel topMarginWithBaselineMargin:28.0];
            double v161 = v77;
          }
          v213.origin.x = v185;
          v213.origin.CGFloat y = v196;
          v213.size.double width = v195;
          double rect_8 = v76;
          v213.size.double height = v76;
          double v78 = CGRectGetHeight(v213) + 0.0;
          v37 = self->_titleLabel;
          double v79 = v195;
          CGFloat v58 = v185;
          double rect_16 = v185;
          double v16 = rect;
          CGFloat v18 = v186;
        }
        else
        {
          v37 = 0;
          double v161 = 0.0;
          double v78 = 0.0;
          double rect_8 = v17;
          double rect_16 = v16;
          double v79 = v18;
          CGFloat v58 = v185;
        }
        subTitleLabel = self->_subTitleLabel;
        CGFloat v162 = v17;
        double v160 = width;
        if (subTitleLabel)
        {
          -[UIView vui_sizeThatFits:](subTitleLabel, "vui_sizeThatFits:", v195, 1.79769313e308);
          v214.size.double height = v81;
          v214.origin.x = v58;
          v214.origin.CGFloat y = v196;
          v214.size.double width = v195;
          double v183 = v214.size.height;
          double v78 = v78 + CGRectGetHeight(v214);
          if (v37)
          {
            [(VUILabel *)self->_subTitleLabel topMarginToLabel:v37 withBaselineMargin:rect_24];
            double v78 = v78 + v82;
          }
          v85 = self->_subTitleLabel;

          v37 = v85;
          double v83 = v195;
          CGFloat v84 = v58;
        }
        else
        {
          double v183 = v17;
          double v83 = v18;
          CGFloat v84 = v16;
        }
        double v64 = v174;
        descriptionTextView = self->_descriptionTextView;
        if (descriptionTextView)
        {
          -[UIView vui_sizeThatFits:](descriptionTextView, "vui_sizeThatFits:", v195, 1.79769313e308);
          v215.size.double height = v87;
          v215.origin.x = v58;
          v215.origin.CGFloat y = v196;
          v215.size.double width = v195;
          CGFloat v88 = v215.size.height;
          double v78 = v78 + CGRectGetHeight(v215);
          double v181 = v88;
          int64_t v89 = imagePosition;
          if (v37)
          {
            [(FocusableTextView *)self->_descriptionTextView topMarginToLabel:v37 withBaselineMargin:rect_24];
            double v78 = v78 + v90;
          }
          CGFloat v58 = v185;
          CGFloat v18 = v186;
          double v64 = v174;
          uint64_t v92 = [(FocusableTextView *)self->_descriptionTextView computationLabel];

          v37 = (VUILabel *)v92;
          double v91 = v185;
        }
        else
        {
          int64_t v89 = imagePosition;
          double v181 = v162;
          double v195 = v18;
          double v91 = rect;
        }
        secondaryButton = self->_secondaryButton;
        double v182 = v84;
        double v184 = v83;
        double rect_24a = v91;
        if (secondaryButton)
        {
          double width = v160;
          -[UIView vui_sizeThatFits:](secondaryButton, "vui_sizeThatFits:", v160, 1.79769313e308);
          v216.size.double width = v94;
          CGFloat v96 = v95;
          v216.origin.x = v58;
          v216.origin.CGFloat y = v196;
          double v170 = v216.size.width;
          v216.size.double height = v96;
          double v78 = v78 + CGRectGetHeight(v216);
          CGFloat v163 = v96;
          if (v37)
          {
            [(VUIButton *)self->_secondaryButton topMarginToLabel:v37 withBaselineMargin:18.0];
            double v78 = v78 + v97;
          }
          double v98 = v162;
        }
        else
        {
          double v98 = v162;
          CGFloat v163 = v162;
          double v170 = v18;
          CGFloat v58 = rect;
          double width = v160;
        }
        if (v89 == 2)
        {
          v217.origin.x = v188;
          v217.size.double width = v189;
          v217.origin.CGFloat y = y;
          v217.size.double height = v194;
          CGRectGetMaxY(v217);
        }
        else
        {
          VUIRoundValue();
        }
        if (self->_titleLabel)
        {
          VUIRoundValue();
          double v187 = v99;
          v100 = self->_titleLabel;
          double v98 = rect_8;
          double v101 = rect_16;
          CGFloat v18 = v79;
        }
        else
        {
          v100 = 0;
          double v101 = rect;
          double v187 = v196;
        }
        double v172 = v79;
        if (self->_subTitleLabel)
        {
          double v102 = v187;
          CGFloat v103 = v18;
          double v104 = v98;
          CGRectGetMaxY(*(CGRect *)&v101);
          VUIRoundValue();
          double v106 = v105;
          v107 = self->_subTitleLabel;

          v100 = v107;
          double v101 = v182;
          double v98 = v183;
          CGFloat v18 = v184;
          double v108 = v106;
        }
        else
        {
          double v106 = v187;
          double v108 = v196;
        }
        double v169 = v108;
        if (self->_descriptionTextView)
        {
          double v109 = v106;
          CGFloat v110 = v18;
          double v111 = v98;
          CGRectGetMaxY(*(CGRect *)&v101);
          VUIRoundValue();
          double v106 = v112;
          v113 = self->_descriptionTextView;

          v100 = (VUILabel *)v113;
          double v101 = rect_24a;
          double v98 = v181;
          CGFloat v18 = v195;
          double v114 = v196;
          double v115 = v106;
        }
        else
        {
          double v114 = v196;
          double v115 = v196;
        }
        double v168 = v115;
        if (self->_secondaryButton)
        {
          double v116 = v106;
          CGFloat v117 = v18;
          double v118 = v98;
          CGRectGetMaxY(*(CGRect *)&v101);
          VUIRoundValue();
          double v120 = v119;
          v121 = self->_secondaryButton;

          v100 = (VUILabel *)v121;
        }
        else
        {
          double v120 = v114;
        }
        int64_t imagePosition = v89;
        double v65 = y;
        double v63 = v159;
        double v167 = v120;
        if (v89 == 2)
        {
          v218.origin.x = v188;
          v218.size.double width = v189;
          v218.origin.CGFloat y = y;
          v218.size.double height = v194;
          double v122 = v161 + v78 + CGRectGetHeight(v218) + 8.0;
          [(VUILabel *)v100 bottomMarginWithBaselineMargin:10.0];
          double height = v123 + v122;
        }
        else
        {
          double height = fmax(v78, 80.0);
        }
        double v62 = v164;

        goto LABEL_86;
      }
      v209.origin.x = width - v71;
      v209.origin.CGFloat y = v196;
      v209.size.double width = v68;
      v209.size.double height = v70;
      double v195 = v195 - (CGRectGetWidth(v209) + 10.0);
      [(VUIListLockupCollectionViewCellView *)self bounds];
      CGRectGetHeight(v210);
      v211.size.double height = v70;
      v211.origin.x = v72;
      v211.origin.CGFloat y = v196;
      v211.size.double width = v68;
      CGRectGetHeight(v211);
      CGFloat v27 = v189;
      VUIRoundValue();
      double v174 = v73;
      CGFloat v18 = v186;
    }
    else
    {
      double v159 = v16;
      double v185 = 0.0;
      double v174 = v196;
      CGFloat v68 = v18;
      CGFloat v164 = v17;
      if (imagePosition == 2) {
        goto LABEL_47;
      }
    }
    v212.origin.x = v32;
    v212.origin.CGFloat y = y;
    v212.size.double height = v194;
    v212.size.double width = v27;
    double v185 = CGRectGetMaxX(v212) + 10.0;
    goto LABEL_47;
  }
  if (imageView)
  {
    -[UIView vui_sizeThatFits:](imageView, "vui_sizeThatFits:", width, height);
    CGFloat v21 = v20;
    CGFloat v23 = v22;
    double v24 = 0.0;
    v198.origin.x = 0.0;
    v198.origin.CGFloat y = 8.0;
    v198.size.double width = v21;
    v198.size.double height = v23;
    double v191 = 8.0;
    double height = CGRectGetMaxY(v198) + 8.0;
    double v25 = v196;
  }
  else
  {
    double height = 0.0;
    CGFloat v23 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    CGFloat v21 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v25 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v191 = v25;
    double v24 = *MEMORY[0x1E4F1DB28];
  }
  v34 = self->_titleLabel;
  CGFloat v189 = v21;
  if (v34)
  {
    -[UIView vui_sizeThatFits:](v34, "vui_sizeThatFits:", width, 1.79769313e308);
    v203.size.double height = v35;
    double v36 = 0.0;
    v203.origin.x = 0.0;
    v203.origin.CGFloat y = height;
    v203.size.double width = width;
    double rect_8 = v203.size.height;
    double v187 = height;
    double height = height + CGRectGetHeight(v203);
    v37 = self->_titleLabel;
    double v172 = width;
  }
  else
  {
    v37 = 0;
    double rect_8 = v17;
    double v172 = v18;
    double v187 = v25;
    double v36 = v16;
  }
  v38 = self->_subTitleLabel;
  if (v38)
  {
    -[UIView vui_sizeThatFits:](v38, "vui_sizeThatFits:", width, 1.79769313e308);
    CGFloat v40 = v39;
    [(VUILabel *)self->_subTitleLabel topMarginToLabel:v37 withBaselineMargin:rect_24];
    CGFloat v42 = height + v41;
    v204.origin.x = 0.0;
    double v182 = 0.0;
    v204.origin.CGFloat y = v42;
    v204.size.double width = width;
    v204.size.double height = v40;
    double v169 = v42;
    double height = v42 + CGRectGetHeight(v204);
    v43 = self->_subTitleLabel;

    v37 = v43;
    double v44 = width;
  }
  else
  {
    double v44 = v18;
    CGFloat v40 = v17;
    double v169 = v196;
    double v182 = v16;
  }
  v45 = self->_descriptionTextView;
  double v194 = v23;
  double v184 = v44;
  double v188 = v24;
  double rect_16 = v36;
  if (v45)
  {
    -[UIView vui_sizeThatFits:](v45, "vui_sizeThatFits:", width, 1.79769313e308);
    CGFloat v47 = v46;
    [(FocusableTextView *)self->_descriptionTextView topMarginToLabel:v37 withBaselineMargin:rect_24];
    CGFloat v49 = height + v48;
    v205.origin.x = 0.0;
    double rect_24a = 0.0;
    v205.origin.CGFloat y = v49;
    v205.size.double width = width;
    v205.size.double height = v47;
    double v168 = v49;
    double height = v49 + CGRectGetHeight(v205);
    uint64_t v50 = [(FocusableTextView *)self->_descriptionTextView computationLabel];

    v37 = (VUILabel *)v50;
    double v195 = width;
  }
  else
  {
    CGFloat v47 = v17;
    double v195 = v186;
    double v168 = v196;
    double rect_24a = v16;
  }
  v51 = self->_secondaryButton;
  double v181 = v47;
  if (v51)
  {
    -[UIView vui_sizeThatFits:](v51, "vui_sizeThatFits:", width, 1.79769313e308);
    CGFloat v53 = v52;
    CGFloat v55 = v54;
    [(VUIButton *)self->_secondaryButton topMarginToLabel:v37 withBaselineMargin:18.0];
    CGFloat v57 = height + v56;
    CGFloat v58 = 0.0;
    v206.origin.x = 0.0;
    v206.origin.CGFloat y = v57;
    v206.size.double width = v53;
    CGFloat v163 = v55;
    v206.size.double height = v55;
    double v167 = v57;
    double height = v57 + CGRectGetHeight(v206);
  }
  else
  {
    CGFloat v163 = v17;
    CGFloat v58 = v16;
    CGFloat v53 = v186;
    double v167 = v196;
  }
  v59 = self->_primaryButton;
  double v183 = v40;
  double v170 = v53;
  if (v59)
  {
    -[UIView vui_sizeThatFits:](v59, "vui_sizeThatFits:", width, 1.79769313e308);
    v207.size.double width = v60;
    double v62 = v61;
    double v63 = 0.0;
    v207.origin.x = 0.0;
    v207.origin.CGFloat y = height;
    double v171 = v207.size.width;
    v207.size.double height = v62;
    double v64 = height;
    double height = height + CGRectGetHeight(v207) + 8.0;
  }
  else
  {
    double v62 = v17;
    double v171 = v186;
    double v64 = v196;
    double v63 = rect;
  }
  double v65 = v191;
LABEL_86:

  if (!v173)
  {
    if ([(VUIListLockupCollectionViewCellView *)self vuiIsRTL])
    {
      [(VUIListLockupCollectionViewCellView *)self bounds];
      VUIRectWithFlippedOriginRelativeToBoundingRect();
      double v188 = v124;
      double v190 = v125;
      double v193 = v126;
      double v194 = v127;
      VUIRectWithFlippedOriginRelativeToBoundingRect();
      double rect_16 = v128;
      double v187 = v129;
      double v172 = v130;
      double rect_8 = v131;
      VUIRectWithFlippedOriginRelativeToBoundingRect();
      double v182 = v132;
      double v183 = v133;
      double v169 = v134;
      double v184 = v135;
      VUIRectWithFlippedOriginRelativeToBoundingRect();
      double rect_24a = v136;
      double v168 = v137;
      double v195 = v138;
      double v181 = v139;
      VUIRectWithFlippedOriginRelativeToBoundingRect();
      double v175 = v140;
      double v171 = v141;
      double v142 = v190;
      double v65 = v193;
      double v63 = v143;
      double v62 = v144;
      VUIRectWithFlippedOriginRelativeToBoundingRect();
      double v146 = v145;
      double v167 = v147;
      double v170 = v148;
      double v150 = v149;
    }
    else
    {
      double v146 = v58;
      double v175 = v64;
      double v150 = v163;
      double v142 = v189;
    }
    -[UIView setFrame:](self->_imageView, "setFrame:", v188, v65, v142, v194, *(void *)&v159);
    -[VUILabel setFrame:](self->_titleLabel, "setFrame:", rect_16, v187, v172, rect_8);
    -[VUILabel setFrame:](self->_subTitleLabel, "setFrame:", v182, v169, v184, v183);
    -[FocusableTextView setFrame:](self->_descriptionTextView, "setFrame:", rect_24a, v168, v195, v181);
    -[VUIButton setFrame:](self->_primaryButton, "setFrame:", v63, v175, v171, v62);
    -[VUIButton setFrame:](self->_secondaryButton, "setFrame:", v146, v167, v170, v150);
    if (imagePosition == 2) {
      int v151 = 1;
    }
    else {
      int v151 = v15;
    }
    if (v151 == 1)
    {
      [(VUIListLockupCollectionViewCellView *)self bounds];
      double v152 = v166;
      double v153 = CGRectGetHeight(v219) - v166;
      double v154 = 0.0;
      double v155 = width;
    }
    else
    {
      v220.origin.x = v188;
      v220.origin.CGFloat y = v65;
      v220.size.double width = v142;
      v220.size.double height = v194;
      double v152 = v166;
      double v155 = width - CGRectGetWidth(v220) - v165;
      v221.origin.x = rect;
      v221.origin.CGFloat y = v196;
      v221.size.double width = v155;
      v221.size.double height = v166;
      double v154 = width - CGRectGetWidth(v221);
      [(VUIListLockupCollectionViewCellView *)self bounds];
      CGRectGetHeight(v222);
      VUIRoundValue();
      double v153 = v156;
    }
    -[VUISeparatorView setFrame:](self->_separatorView, "setFrame:", v154, v153, v155, v152);
  }
LABEL_97:
  double v157 = width;
  double v158 = height;
  result.double height = v158;
  result.double width = v157;
  return result;
}

- (void)vui_prepareForReuse
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(UIView *)self->_imageView setImage:0];
  }
  [(VUILabel *)self->_titleLabel setVuiText:0];
  [(VUILabel *)self->_subTitleLabel setVuiText:0];
  [(FocusableTextView *)self->_descriptionTextView setDescriptionText:0];
  [(VUIButton *)self->_primaryButton vui_prepareForReuse];
  secondaryButton = self->_secondaryButton;
  [(VUIButton *)secondaryButton vui_prepareForReuse];
}

- (UIView)imageView
{
  return self->_imageView;
}

- (VUILabel)titleLabel
{
  return self->_titleLabel;
}

- (VUILabel)subTitleLabel
{
  return self->_subTitleLabel;
}

- (FocusableTextView)descriptionTextView
{
  return self->_descriptionTextView;
}

- (VUIButton)primaryButton
{
  return self->_primaryButton;
}

- (VUIButton)secondaryButton
{
  return self->_secondaryButton;
}

- (int64_t)imagePosition
{
  return self->_imagePosition;
}

- (void)setImagePosition:(int64_t)a3
{
  self->_int64_t imagePosition = a3;
}

- (VUISeparatorView)separatorView
{
  return self->_separatorView;
}

- (void)setSeparatorView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_secondaryButton, 0);
  objc_storeStrong((id *)&self->_primaryButton, 0);
  objc_storeStrong((id *)&self->_descriptionTextView, 0);
  objc_storeStrong((id *)&self->_subTitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
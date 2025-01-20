@interface VUICollectionHeaderView
+ (id)configureCollectionHeaderViewWithTitle:(id)a3 subtitle:(id)a4 buttonString:(id)a5 existingView:(id)a6;
- (CGSize)_layoutWithSize:(CGSize)a3 metricsOnly:(BOOL)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIButton)headerButton;
- (UIEdgeInsets)padding;
- (VUICollectionHeaderViewLayout)layout;
- (VUILabel)subtitleTextView;
- (VUILabel)titleTextView;
- (VUISeparatorView)separatorView;
- (_TVImageView)imageView;
- (id)_buttonWithString:(id)a3 existingButton:(id)a4;
- (id)selectionHandler;
- (void)_selectButtonAction:(id)a3;
- (void)layoutSubviews;
- (void)setHeaderButton:(id)a3;
- (void)setImageView:(id)a3;
- (void)setLayout:(id)a3;
- (void)setPadding:(UIEdgeInsets)a3;
- (void)setSelectionHandler:(id)a3;
- (void)setSeparatorView:(id)a3;
- (void)setSubtitleTextView:(id)a3;
- (void)setTitleTextView:(id)a3;
- (void)tintColorDidChange;
@end

@implementation VUICollectionHeaderView

+ (id)configureCollectionHeaderViewWithTitle:(id)a3 subtitle:(id)a4 buttonString:(id)a5 existingView:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v13 = (VUICollectionHeaderView *)v11;
  }
  else
  {
    v14 = [VUICollectionHeaderView alloc];
    v13 = -[VUICollectionHeaderView initWithFrame:](v14, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  }
  v15 = v13;
  v16 = [(VUICollectionHeaderView *)v13 layout];
  v17 = v16;
  if (v16) {
    id v18 = v16;
  }
  else {
    id v18 = (id)objc_opt_new();
  }
  v19 = v18;

  [(VUICollectionHeaderView *)v15 setLayout:v19];
  if (v9)
  {
    v20 = [v19 titleTextLayout];
    v21 = [(VUICollectionHeaderView *)v15 titleTextView];
    v22 = +[VUILabel labelWithAttributedString:v9 textLayout:v20 existingLabel:v21];

    if (v10)
    {
LABEL_9:
      v23 = [v19 subtitleTextLayout];
      v24 = [(VUICollectionHeaderView *)v15 subtitleTextView];
      v25 = +[VUILabel labelWithString:v10 textLayout:v23 existingLabel:v24];

      goto LABEL_12;
    }
  }
  else
  {
    v22 = 0;
    if (v10) {
      goto LABEL_9;
    }
  }
  v25 = 0;
LABEL_12:
  v26 = [(VUICollectionHeaderView *)v15 headerButton];
  v27 = [(VUICollectionHeaderView *)v15 _buttonWithString:v12 existingButton:v26];

  [(VUICollectionHeaderView *)v15 setTitleTextView:v22];
  [(VUICollectionHeaderView *)v15 setSubtitleTextView:v25];
  [(VUICollectionHeaderView *)v15 setHeaderButton:v27];

  return v15;
}

- (void)setTitleTextView:(id)a3
{
  v5 = (VUILabel *)a3;
  titleTextView = self->_titleTextView;
  if (titleTextView != v5)
  {
    v7 = v5;
    [(VUILabel *)titleTextView removeFromSuperview];
    if (v7 && ([(VUILabel *)v7 isDescendantOfView:self] & 1) == 0) {
      [(VUICollectionHeaderView *)self addSubview:v7];
    }
    objc_storeStrong((id *)&self->_titleTextView, a3);
    [(VUICollectionHeaderView *)self setNeedsLayout];
    v5 = v7;
  }
}

- (void)setSeparatorView:(id)a3
{
  v5 = (VUISeparatorView *)a3;
  separatorView = self->_separatorView;
  if (separatorView != v5)
  {
    v7 = v5;
    [(VUISeparatorView *)separatorView removeFromSuperview];
    if (v7 && ([(VUISeparatorView *)v7 isDescendantOfView:self] & 1) == 0) {
      [(VUICollectionHeaderView *)self addSubview:v7];
    }
    objc_storeStrong((id *)&self->_separatorView, a3);
    [(VUICollectionHeaderView *)self setNeedsLayout];
    v5 = v7;
  }
}

- (void)setSubtitleTextView:(id)a3
{
  v5 = (VUILabel *)a3;
  subtitleTextView = self->_subtitleTextView;
  if (subtitleTextView != v5)
  {
    v7 = v5;
    [(VUILabel *)subtitleTextView removeFromSuperview];
    if (v7 && ([(VUILabel *)v7 isDescendantOfView:self] & 1) == 0) {
      [(VUICollectionHeaderView *)self addSubview:v7];
    }
    objc_storeStrong((id *)&self->_subtitleTextView, a3);
    [(VUICollectionHeaderView *)self setNeedsLayout];
    v5 = v7;
  }
}

- (void)setHeaderButton:(id)a3
{
  v5 = (UIButton *)a3;
  headerButton = self->_headerButton;
  if (headerButton != v5)
  {
    v7 = v5;
    [(UIButton *)headerButton removeTarget:0 action:0 forControlEvents:0xFFFFFFFFLL];
    [(UIButton *)self->_headerButton removeFromSuperview];
    if (v7 && ([(UIButton *)v7 isDescendantOfView:self] & 1) == 0)
    {
      [(VUICollectionHeaderView *)self addSubview:v7];
      [(UIButton *)v7 addTarget:self action:sel__selectButtonAction_ forControlEvents:64];
    }
    objc_storeStrong((id *)&self->_headerButton, a3);
    [(VUICollectionHeaderView *)self setNeedsLayout];
    v5 = v7;
  }
}

- (void)setImageView:(id)a3
{
  v5 = (_TVImageView *)a3;
  imageView = self->_imageView;
  if (imageView != v5)
  {
    v7 = v5;
    [(_TVImageView *)imageView removeFromSuperview];
    if (v7 && ([(_TVImageView *)v7 isDescendantOfView:self] & 1) == 0) {
      [(VUICollectionHeaderView *)self addSubview:v7];
    }
    objc_storeStrong((id *)&self->_imageView, a3);
    [(VUICollectionHeaderView *)self setNeedsLayout];
    v5 = v7;
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[VUICollectionHeaderView _layoutWithSize:metricsOnly:](self, "_layoutWithSize:metricsOnly:", 1, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  [(VUICollectionHeaderView *)self bounds];
  -[VUICollectionHeaderView _layoutWithSize:metricsOnly:](self, "_layoutWithSize:metricsOnly:", 0, v3, v4);
}

- (CGSize)_layoutWithSize:(CGSize)a3 metricsOnly:(BOOL)a4
{
  double height = a3.height;
  double width = a3.width;
  double v6 = *MEMORY[0x1E4F1DB30];
  if (a3.width != *MEMORY[0x1E4F1DB30] || a3.height != *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    p_padding = &self->_padding;
    double v11 = a3.width - self->_padding.left - self->_padding.right;
    id v12 = [(VUICollectionHeaderView *)self traitCollection];
    int v13 = [v12 isAXEnabled];

    v14 = [(VUICollectionHeaderView *)self traitCollection];
    v15 = +[VUICollectionHeaderViewLayout maxImageContentSizeCategory];
    +[VUIUtilities scaleContentSizeValue:v14 forTraitCollection:v15 maximumContentSizeCategory:40.0];
    double v17 = v16;

    double v18 = *MEMORY[0x1E4F1DB28];
    double v19 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v177 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    double v178 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v173 = v19;
    double v174 = width;
    if (v13)
    {
      CGFloat left = p_padding->left;
      imageView = self->_imageView;
      if (imageView)
      {
        -[_TVImageView sizeThatFits:](imageView, "sizeThatFits:", v11, 1.79769313e308);
        v183.size.double width = v22;
        v183.size.double height = v23;
        v183.origin.y = v17 - v23;
        v183.origin.CGFloat x = left;
        CGFloat rect = v183.origin.y;
        CGFloat v166 = v183.size.width;
        CGFloat v157 = v183.size.height;
        double MaxY = CGRectGetMaxY(v183) + 16.0;
        CGFloat v161 = v177;
        CGFloat v163 = v178;
        double v25 = v18;
        CGFloat v26 = v19;
        double v27 = v25;
        CGFloat v153 = v25;
        double v28 = left;
      }
      else
      {
        double v27 = *MEMORY[0x1E4F1DB28];
        titleTextView = self->_titleTextView;
        if (titleTextView)
        {
          [(VUILabel *)titleTextView topMarginToLabel:0 withBaselineMargin:40.0];
          CGFloat v26 = v43;
          -[VUILabel sizeThatFits:](self->_titleTextView, "sizeThatFits:", v11, 1.79769313e308);
          v184.size.double width = v44;
          v184.size.double height = v45;
          CGFloat v29 = left;
          v184.origin.CGFloat x = left;
          v184.origin.y = v26;
          CGFloat v161 = v184.size.height;
          CGFloat v163 = v184.size.width;
          double MaxY = CGRectGetMaxY(v184);
          CGFloat v153 = left;
          CGFloat v157 = v177;
          CGFloat v166 = v178;
          CGFloat rect = v173;
          double v28 = v27;
LABEL_15:
          subtitleTextView = self->_subtitleTextView;
          CGFloat v152 = v26;
          CGFloat x = v28;
          if (subtitleTextView)
          {
            double v47 = v11;
            -[VUILabel sizeThatFits:](subtitleTextView, "sizeThatFits:", v11, 1.79769313e308);
            CGFloat v49 = v48;
            CGFloat v51 = v50;
            v52 = self->_subtitleTextView;
            if (self->_imageView)
            {
              [(VUILabel *)v52 topMarginWithBaselineMargin:23.0];
            }
            else
            {
              double v90 = 40.0;
              if (self->_titleTextView) {
                double v90 = 23.0;
              }
              -[VUILabel topMarginToLabel:withBaselineMargin:](v52, "topMarginToLabel:withBaselineMargin:", v90);
            }
            double v76 = MaxY + v53;
            v187.origin.CGFloat x = v29;
            v187.origin.y = v76;
            v187.size.double width = v49;
            v187.size.double height = v51;
            double MaxY = CGRectGetMaxY(v187);
            CGFloat v77 = v29;
          }
          else
          {
            double v47 = v11;
            if (self->_imageView)
            {
              v71 = [(VUICollectionHeaderView *)self traitCollection];
              v72 = +[VUICollectionHeaderViewLayout maxImageContentSizeCategory];
              +[VUIUtilities scaleContentSizeValue:v71 forTraitCollection:v72 maximumContentSizeCategory:16.0];
              double v73 = v29;
              double v75 = v74;

              double MaxY = MaxY + v75;
              CGFloat v29 = v73;
            }
            CGFloat v51 = v177;
            CGFloat v49 = v178;
            double v76 = v173;
            CGFloat v77 = v27;
          }
          headerButton = self->_headerButton;
          double v170 = v51;
          double v171 = v49;
          double v168 = v76;
          double v169 = v77;
          if (headerButton)
          {
            -[UIButton sizeThatFits:](headerButton, "sizeThatFits:", v47, 0.0);
            CGFloat v93 = v92;
            v188.size.double height = v94;
            v188.origin.CGFloat x = v29;
            v188.origin.y = MaxY;
            v188.size.double width = v93;
            double v172 = v188.size.height;
            double v165 = MaxY;
            double MaxY = MaxY + CGRectGetHeight(v188);
            CGFloat v95 = rect;
            double v96 = v153;
LABEL_48:
            double v81 = v157;
            CGFloat v80 = v166;
            goto LABEL_49;
          }
          v97 = self->_subtitleTextView;
          if (self->_titleTextView)
          {
            if (!v97) {
              v97 = self->_titleTextView;
            }
            double v96 = v153;
          }
          else
          {
            double v96 = v153;
            if (!v97)
            {
LABEL_47:
              CGFloat v93 = v178;
              double v172 = v177;
              double v165 = v173;
              CGFloat v29 = v27;
              CGFloat v95 = rect;
              goto LABEL_48;
            }
          }
          [(VUILabel *)v97 bottomMarginWithBaselineMargin:16.0];
          double MaxY = MaxY + v101;
          goto LABEL_47;
        }
        double MaxY = 0.0;
        CGFloat v161 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
        CGFloat v163 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
        CGFloat v26 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
        double v28 = *MEMORY[0x1E4F1DB28];
        CGFloat v153 = *MEMORY[0x1E4F1DB28];
        CGFloat v157 = v161;
        CGFloat v166 = v163;
        CGFloat rect = v26;
      }
      CGFloat v29 = left;
      goto LABEL_15;
    }
    if (self->_imageView)
    {
      v30 = [(VUICollectionHeaderViewLayout *)self->_layout imageViewLayout];
      [v30 decoratorSize];
      double recta = v17 - v31;

      v32 = self->_headerButton;
      if (v32)
      {
        v33 = [(UIButton *)v32 titleLabel];
        objc_msgSend(v33, "sizeThatFits:", v11, 0.0);
        double v35 = v34;
        double v172 = v36;

        v37 = [(UIButton *)self->_headerButton titleLabel];
        objc_msgSend(v37, "vui_heightToBaseline");
        double v39 = v38;

        double v154 = width - v35 - p_padding->right;
        double v158 = v35;
        double v165 = v17 - v39;
        double v40 = v11 - v35 + -10.0;
        double v41 = v40;
        if (self->_headerButton)
        {
LABEL_27:
          -[_TVImageView sizeThatFits:](self->_imageView, "sizeThatFits:", v41, 1.79769313e308);
          v185.size.double width = v78;
          v185.size.double height = v79;
          v185.origin.CGFloat x = p_padding->left;
          CGFloat x = v185.origin.x;
          v185.origin.y = recta;
          CGFloat v80 = v185.size.width;
          double v81 = v185.size.height;
          double v82 = CGRectGetMaxY(v185);
          v83 = self->_subtitleTextView;
          if (v83)
          {
            if (!self->_headerButton) {
              double v40 = v11;
            }
            -[VUILabel sizeThatFits:](v83, "sizeThatFits:", v40, 1.79769313e308);
            CGFloat v85 = v84;
            CGFloat v86 = p_padding->left;
            [(VUILabel *)self->_subtitleTextView topMarginWithBaselineMargin:23.0];
            v186.origin.y = v82 + v87;
            double v168 = v82 + v87;
            double v169 = v86;
            v186.origin.CGFloat x = v86;
            double v170 = v85;
            double v171 = v40;
            v186.size.double width = v40;
            v186.size.double height = v85;
            double v88 = CGRectGetMaxY(v186);
            [(VUILabel *)self->_subtitleTextView bottomMarginWithBaselineMargin:16.0];
            double MaxY = v88 + v89;
            CGFloat v161 = v177;
            CGFloat v163 = v178;
            CGFloat v152 = v173;
          }
          else
          {
            [(_TVImageView *)self->_imageView bottomMarginWithBaselineMargin:16.0];
            double MaxY = v82 + v98;
            double v170 = v177;
            double v171 = v178;
            double v168 = v173;
            double v169 = v18;
            CGFloat v161 = v177;
            CGFloat v163 = v178;
            CGFloat v152 = v173;
          }
          double v96 = v18;
          CGFloat v29 = v154;
          CGFloat v93 = v158;
          CGFloat v95 = recta;
LABEL_49:
          CGFloat v102 = x;
          if (!a4)
          {
LABEL_50:
            double v176 = v102;
            CGFloat v167 = v80;
            if ([(VUICollectionHeaderView *)self effectiveUserInterfaceLayoutDirection] == 1)
            {
              [(VUICollectionHeaderView *)self bounds];
              VUIRectWithFlippedOriginRelativeToBoundingRect();
              double v104 = v103;
              double v106 = v105;
              double v162 = v108;
              double v164 = v107;
              [(VUICollectionHeaderView *)self bounds];
              VUIRectWithFlippedOriginRelativeToBoundingRect();
              double v168 = v110;
              double v169 = v109;
              double v170 = v112;
              double v171 = v111;
              [(VUICollectionHeaderView *)self bounds];
              VUIRectWithFlippedOriginRelativeToBoundingRect();
              double v155 = v113;
              double v160 = v114;
              double v165 = v115;
              double v172 = v116;
              [(VUICollectionHeaderView *)self bounds];
              VUIRectWithFlippedOriginRelativeToBoundingRect();
              double v118 = v117;
              double rectb = v119;
              double v121 = v120;
              double v81 = v122;
              [(VUICollectionHeaderView *)self bounds];
              VUIRectWithFlippedOriginRelativeToBoundingRect();
              double v124 = v123;
              double v125 = v104;
              double v127 = v126;
              double v128 = v106;
              double v130 = v129;
              double v132 = v131;
              double v134 = v162;
              double v133 = v164;
            }
            else
            {
              double v125 = v96;
              double v132 = 1.0;
              double rectb = v95;
              double v127 = height + -1.0;
              double v124 = 0.0;
              double v155 = v29;
              double v160 = v93;
              double v130 = v174;
              double v118 = v176;
              double v128 = v152;
              double v134 = v161;
              double v133 = v163;
              double v121 = v167;
            }
            -[VUILabel setFrame:](self->_titleTextView, "setFrame:", v125, v128, v133, v134);
            -[VUILabel setFrame:](self->_subtitleTextView, "setFrame:", v169, v168, v171, v170);
            -[UIButton setFrame:](self->_headerButton, "setFrame:", v155, v165, v160, v172);
            -[_TVImageView setFrame:](self->_imageView, "setFrame:", v118, rectb, v121, v81);
            -[VUISeparatorView setFrame:](self->_separatorView, "setFrame:", v124, v127, v130, v132);
          }
LABEL_54:
          double height = ceil(MaxY);
          double width = v174;
          goto LABEL_55;
        }
      }
      else
      {
        double v40 = v11 - v6 + -10.0;
        double v165 = v19;
        double v154 = v18;
        double v158 = v178;
        double v172 = v177;
      }
      double v41 = v11;
      goto LABEL_27;
    }
    v54 = self->_titleTextView;
    double v151 = *MEMORY[0x1E4F1DB28];
    if (!v54)
    {
      double v70 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      double v172 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
      double v159 = v70;
      double v165 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      CGFloat v29 = *MEMORY[0x1E4F1DB28];
      double v99 = v172;
      CGFloat v100 = *MEMORY[0x1E4F1DB28];
      double v56 = v165;
      goto LABEL_59;
    }
    [(VUILabel *)v54 topMarginToLabel:0 withBaselineMargin:40.0];
    CGFloat v29 = v18;
    double v56 = v55;
    v57 = self->_headerButton;
    double v58 = v19;
    double v60 = v177;
    double v59 = v178;
    if (v57)
    {
      v61 = [(UIButton *)v57 titleLabel];
      objc_msgSend(v61, "sizeThatFits:", v11, 0.0);
      double v6 = v62;
      double v172 = v63;

      v64 = [(UIButton *)self->_headerButton titleLabel];
      objc_msgSend(v64, "vui_heightToBaseline");
      double v66 = v65;

      double v67 = width - v6 - p_padding->right;
      [(UILabel *)self->_titleTextView vui_heightToBaseline];
      double v69 = v56 + v68;
      double v58 = v69 - v66;
      if (self->_headerButton)
      {
        double v165 = v69 - v66;
        double v159 = v6;
        CGFloat v29 = v67;
        double v70 = v11 - v6 + -10.0;
LABEL_58:
        -[VUILabel sizeThatFits:](self->_titleTextView, "sizeThatFits:", v70, 1.79769313e308, v58);
        double v99 = v137;
        CGFloat v100 = p_padding->left;
LABEL_59:
        CGFloat v152 = v56;
        CGFloat v156 = v100;
        double v138 = v56;
        CGFloat v163 = v70;
        double v139 = v70;
        double v140 = v99;
        double MaxY = CGRectGetMaxY(*(CGRect *)&v100);
        v141 = self->_subtitleTextView;
        if (v141)
        {
          if (self->_headerButton) {
            double v142 = v11 - v6 + -10.0;
          }
          else {
            double v142 = v11;
          }
          -[VUILabel sizeThatFits:](v141, "sizeThatFits:", v142, 1.79769313e308);
          CGFloat v144 = v143;
          CGFloat v145 = p_padding->left;
          double v146 = 40.0;
          if (self->_titleTextView) {
            double v146 = 23.0;
          }
          -[VUILabel topMarginToLabel:withBaselineMargin:](self->_subtitleTextView, "topMarginToLabel:withBaselineMargin:", v146);
          v189.origin.y = MaxY + v147;
          double v168 = MaxY + v147;
          double v169 = v145;
          v189.origin.CGFloat x = v145;
          double v171 = v142;
          v189.size.double width = v142;
          v189.size.double height = v144;
          double MaxY = CGRectGetMaxY(v189);
          double v148 = v151;
        }
        else
        {
          CGFloat v144 = v177;
          double v171 = v178;
          double v148 = v151;
          double v168 = v173;
          double v169 = v151;
        }
        CGFloat v93 = v159;
        v149 = self->_subtitleTextView;
        CGFloat v161 = v99;
        double v170 = v144;
        if (self->_titleTextView)
        {
          if (!v149) {
            v149 = self->_titleTextView;
          }
        }
        else if (!v149)
        {
          goto LABEL_73;
        }
        [(VUILabel *)v149 bottomMarginWithBaselineMargin:16.0];
        double MaxY = MaxY + v150;
LABEL_73:
        double v81 = v177;
        CGFloat v80 = v178;
        CGFloat v95 = v173;
        CGFloat v102 = v148;
        double v96 = v156;
        if (!a4) {
          goto LABEL_50;
        }
        goto LABEL_54;
      }
      double v59 = v6;
      CGFloat v29 = v67;
      double v60 = v172;
    }
    double v165 = v58;
    double v172 = v60;
    double v159 = v59;
    double v70 = v11;
    goto LABEL_58;
  }
LABEL_55:
  double v135 = width;
  double v136 = height;
  result.double height = v136;
  result.double width = v135;
  return result;
}

- (void)tintColorDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)VUICollectionHeaderView;
  [(VUICollectionHeaderView *)&v4 tintColorDidChange];
  if (self->_headerButton)
  {
    if ([(VUICollectionHeaderView *)self tintAdjustmentMode] == 2) {
      [MEMORY[0x1E4FB1618] systemMidGrayColor];
    }
    else {
    double v3 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_keyColor");
    }
    [(UIButton *)self->_headerButton setTitleColor:v3 forState:0];
  }
}

- (id)_buttonWithString:(id)a3 existingButton:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 length])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = v6;
    }
    else
    {
      id v7 = [MEMORY[0x1E4FB14D0] buttonWithType:1];
    }
    v8 = v7;
    id v9 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_keyColor");
    [v8 setTitleColor:v9 forState:0];

    id v10 = [v8 titleLabel];
    double v11 = objc_msgSend(MEMORY[0x1E4FB08E0], "vui_fontFromTextStyle:fontWeight:fontSize:symbolicTraits:", 13, 0, 0, 0.0);
    [v10 setFont:v11];

    id v12 = [v8 titleLabel];
    [v12 setNumberOfLines:1];

    int v13 = [v8 titleLabel];
    [v13 setAdjustsFontForContentSizeCategory:1];

    [v8 setTitle:v5 forState:0];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_selectButtonAction:(id)a3
{
  selectionHandler = (void (**)(id, id))self->_selectionHandler;
  if (selectionHandler) {
    selectionHandler[2](selectionHandler, a3);
  }
}

- (UIEdgeInsets)padding
{
  double top = self->_padding.top;
  double left = self->_padding.left;
  double bottom = self->_padding.bottom;
  double right = self->_padding.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setPadding:(UIEdgeInsets)a3
{
  self->_padding = a3;
}

- (id)selectionHandler
{
  return self->_selectionHandler;
}

- (void)setSelectionHandler:(id)a3
{
}

- (VUICollectionHeaderViewLayout)layout
{
  return self->_layout;
}

- (void)setLayout:(id)a3
{
}

- (VUILabel)titleTextView
{
  return self->_titleTextView;
}

- (VUILabel)subtitleTextView
{
  return self->_subtitleTextView;
}

- (_TVImageView)imageView
{
  return self->_imageView;
}

- (UIButton)headerButton
{
  return self->_headerButton;
}

- (VUISeparatorView)separatorView
{
  return self->_separatorView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_headerButton, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_subtitleTextView, 0);
  objc_storeStrong((id *)&self->_titleTextView, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong(&self->_selectionHandler, 0);
}

@end
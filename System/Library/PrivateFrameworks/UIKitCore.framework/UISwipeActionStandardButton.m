@interface UISwipeActionStandardButton
- (UISwipeActionStandardButton)initWithFrame:(CGRect)a3;
- (double)buttonWidth;
- (double)extensionLength;
- (id)titleLabel;
- (void)layoutSubviews;
- (void)setExtensionLength:(double)a3;
- (void)setTitle:(id)a3 forState:(unint64_t)a4;
@end

@implementation UISwipeActionStandardButton

- (UISwipeActionStandardButton)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)UISwipeActionStandardButton;
  v3 = -[UISwipeActionButton initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [UIView alloc];
    [(UIView *)v3 bounds];
    v5 = -[UIView initWithFrame:](v4, "initWithFrame:");
    [(UISwipeActionButton *)v3 setBackgroundView:v5];

    v6 = [(UISwipeActionButton *)v3 visualStyle];
    v7 = [v6 defaultButtonBackgroundColor];
    v8 = [(UISwipeActionButton *)v3 backgroundView];
    [v8 setBackgroundColor:v7];

    v9 = [(UISwipeActionButton *)v3 backgroundView];
    [(UIView *)v3 addSubview:v9];

    [(UIView *)v3 setClipsToBounds:0];
    v10 = [(UIButton *)v3 _visualProvider];
    [v10 setAvoidDefaultTitleAndImageLayout:1];
  }
  return v3;
}

- (void)layoutSubviews
{
  *(unsigned char *)&self->_flags |= 1u;
  v110.receiver = self;
  v110.super_class = (Class)UISwipeActionStandardButton;
  [(UIButton *)&v110 layoutSubviews];
  [(UIView *)self bounds];
  -[UIButton contentRectForBounds:](self, "contentRectForBounds:");
  -[UISwipeActionButton _allowableContentRectForContentRect:](self, "_allowableContentRectForContentRect:");
  CGFloat v4 = v3;
  CGFloat v108 = v5;
  double v7 = v6;
  double v9 = v8;
  v10 = [(UIButton *)self _currentImageWithResolvedConfiguration];
  v11 = [(UIButton *)self currentImage];

  if (v11)
  {
    [v10 size];
    [(UIView *)self frame];
    [(UISwipeActionButton *)self _defaultLayoutForHeight:v12];
    int isRenderingText = _isRenderingText(self);
    double v14 = 1.0;
    if ((isRenderingText & 1) == 0)
    {
      v15 = self;
      [(UIView *)v15 bounds];
      uint64_t v16 = [(UISwipeActionButton *)v15 _defaultLayoutForHeight:CGRectGetHeight(v111)];

      if (v16 == 2) {
        double v14 = 0.8;
      }
      else {
        double v14 = 1.0;
      }
    }
    [v10 size];
    if (v17 > 0.0)
    {
      [v10 size];
      if (v18 > v7)
      {
        [v10 size];
        double v20 = v7 / v19;
        if (v14 >= v20) {
          double v14 = v20;
        }
      }
    }
    [v10 size];
    if (v21 > 0.0)
    {
      [v10 size];
      if (v22 > v9)
      {
        [v10 size];
        if (v14 >= v9 / v23) {
          double v14 = v9 / v23;
        }
      }
    }
    if (fabs(v14 + -1.0) >= 2.22044605e-16)
    {
      v24 = [(UIButton *)self imageView];
      [v24 setContentMode:1];
    }
    double v25 = _UITableCellLineHeightCenteredImageInRect(v10, v14, v4, v108, v7, v9);
    double v27 = v26;
    double v29 = v28;
    double v31 = v30;
    v32 = [(UISwipeActionStandardButton *)self titleLabel];
    [v32 setHidden:isRenderingText ^ 1u];

    if (isRenderingText)
    {
      CGFloat v106 = v27;
      v33 = [(UISwipeActionStandardButton *)self titleLabel];
      [(UIView *)self bounds];
      objc_msgSend(v33, "sizeThatFits:", v34, v35);
      double v102 = v36;

      v37 = [(UISwipeActionStandardButton *)self titleLabel];
      v38 = [v37 font];

      v39 = +[UIScreen mainScreen];
      [v39 scale];
      double v100 = v40;

      [v38 lineHeight];
      double v42 = v41;
      v43 = [(UISwipeActionButton *)self visualStyle];
      [v43 iconToTitleSpacing];
      double v45 = v42 + v44;

      v46 = [v10 symbolConfiguration];
      v47 = v46;
      CGFloat v105 = v31;
      double v98 = v45;
      if (v46)
      {
        double v109 = 0.0;
        v48 = v46;
        if ((v48[40] & 1) == 0)
        {
          uint64_t v49 = +[UIImageSymbolConfiguration unspecifiedConfiguration];

          v48 = (unsigned char *)v49;
        }
        CGFloat v50 = v29;
        [v48 _deriveGlyphSize:0 weight:0 pointSize:&v109];
        v51 = [off_1E52D39B8 systemFontOfSize:v109];
        [v10 baselineOffsetFromBottom];
        double v53 = -v52;
        [v51 descender];
        double v96 = v53 - v54;
      }
      else
      {
        CGFloat v50 = v29;
        double v96 = 0.0;
      }
      v112.origin.x = v4;
      v112.origin.y = v108;
      v112.size.double width = v7;
      v112.size.height = v9;
      double MinY = CGRectGetMinY(v112);
      v113.origin.x = v25;
      v113.size.double width = v50;
      CGFloat rect = v7;
      CGFloat v97 = v9;
      CGFloat v63 = v4;
      v113.origin.y = v106;
      v113.size.height = v105;
      double v64 = CGRectGetMinY(v113);
      UIRoundToScale(v98 * 0.5, v100);
      double v66 = v64 - v65;
      if (MinY >= v66) {
        double v67 = MinY;
      }
      else {
        double v67 = v66;
      }
      double v68 = v25;
      double v107 = v67;
      CGFloat v99 = v50;
      CGFloat v69 = v50;
      CGFloat v70 = v105;
      double v71 = v96 + CGRectGetMaxY(*(CGRect *)(&v67 - 1));
      v72 = [(UISwipeActionButton *)self visualStyle];
      [v72 iconToTitleSpacing];
      UIRoundToScale(v71 + v73, v100);
      double v75 = v74;

      v114.origin.x = v63;
      v114.origin.y = v108;
      v114.size.double width = rect;
      v114.size.height = v97;
      double v76 = CGRectGetMaxY(v114) - v75;
      if (v76 >= v102) {
        double v77 = v102;
      }
      else {
        double v77 = v76;
      }
      v115.origin.x = v63;
      v115.origin.y = v108;
      v115.size.double width = rect;
      v115.size.height = v97;
      CGFloat MinX = CGRectGetMinX(v115);
      v116.origin.x = v63;
      v116.origin.y = v108;
      v116.size.double width = rect;
      v116.size.height = v97;
      v117.size.double width = CGRectGetWidth(v116);
      double width = v117.size.width;
      double v103 = MinX;
      v117.origin.x = MinX;
      v117.origin.y = v75;
      v117.size.height = v77;
      double MaxY = CGRectGetMaxY(v117);
      v118.origin.x = v63;
      v118.origin.y = v108;
      v118.size.double width = rect;
      v118.size.height = v97;
      double v80 = MaxY - CGRectGetMaxY(v118);
      if (v80 <= 0.0)
      {
        double v27 = v107;
        double v29 = v99;
      }
      else
      {
        v119.origin.x = v25;
        v119.size.height = v105;
        v119.origin.y = v107;
        v119.size.double width = v99;
        double v81 = CGRectGetMinY(v119);
        v120.origin.x = v63;
        v120.origin.y = v108;
        v120.size.double width = rect;
        v120.size.height = v97;
        double v82 = v81 - CGRectGetMinY(v120);
        if (v82 >= v80) {
          double v82 = v80;
        }
        double v27 = v107 - v82;
        double v75 = v75 - v82;
        double v29 = v99;
      }
      v83 = [(UISwipeActionStandardButton *)self titleLabel];
      objc_msgSend(v83, "setFrame:", v103, v75, width, v77);

      double v31 = v105;
    }
    v56 = [(UIButton *)self imageView];
    v57 = v56;
    double v58 = v25;
    double v59 = v27;
    double v60 = v29;
    double v61 = v31;
  }
  else
  {
    v55 = [(UISwipeActionStandardButton *)self titleLabel];
    [v55 setHidden:0];

    v56 = [(UISwipeActionStandardButton *)self titleLabel];
    v57 = v56;
    double v58 = v4;
    double v59 = v108;
    double v60 = v7;
    double v61 = v9;
  }
  objc_msgSend(v56, "setFrame:", v58, v59, v60, v61);

  [(UIView *)self bounds];
  double v85 = v84;
  double v87 = v86;
  double v89 = v88;
  [(UISwipeActionStandardButton *)self extensionLength];
  double v91 = v90;
  [(UIView *)self bounds];
  double v92 = CGRectGetWidth(v121);
  if (v91 < v92) {
    double v91 = v92;
  }
  if ([(UIControl *)self contentHorizontalAlignment] == UIControlContentHorizontalAlignmentRight)
  {
    [(UIView *)self bounds];
    double v93 = CGRectGetWidth(v122);
    v123.origin.x = v85;
    v123.origin.y = v87;
    v123.size.double width = v91;
    v123.size.height = v89;
    double v85 = v93 - CGRectGetWidth(v123);
  }
  v94 = [(UISwipeActionButton *)self backgroundView];
  objc_msgSend(v94, "setFrame:", v85, v87, v91, v89);

  v95 = [(UISwipeActionButton *)self backgroundView];
  [(UIView *)self sendSubviewToBack:v95];

  *(unsigned char *)&self->_flags &= ~1u;
}

- (void)setTitle:(id)a3 forState:(unint64_t)a4
{
  v5.receiver = self;
  v5.super_class = (Class)UISwipeActionStandardButton;
  [(UISwipeActionButton *)&v5 setTitle:a3 forState:a4];
  self->_buttonWidth = 0.0;
}

- (double)buttonWidth
{
  if ([(UISwipeActionButton *)self autosizes])
  {
    double result = self->_buttonWidth;
    if (result == 0.0)
    {
      CGFloat v4 = [(UIButton *)self _currentImageWithResolvedConfiguration];
      [(UISwipeActionButton *)self _horizontalPaddingForCurrentIdiom];
      double v6 = v5;
      if (dyld_program_sdk_at_least()
        && ([(UIButton *)self currentImage],
            double v7 = objc_claimAutoreleasedReturnValue(),
            v7,
            v7))
      {
        double v8 = [(UISwipeActionStandardButton *)self titleLabel];
        if (([v8 isHidden] & 1) == 0)
        {
          double v9 = [(UISwipeActionStandardButton *)self titleLabel];
          v10 = [v9 text];
          [v10 length];
        }
        [(UIView *)self bounds];
        [(UISwipeActionButton *)self _defaultLayoutForHeight:CGRectGetHeight(v42)];
        [v4 size];
        double v12 = v11;
        v13 = self;
        [(UIView *)v13 bounds];
        uint64_t v14 = [(UISwipeActionButton *)v13 _defaultLayoutForHeight:CGRectGetHeight(v43)];

        double v15 = 0.8;
        if (v14 != 2) {
          double v15 = 1.0;
        }
        double v16 = v12 * v15;
        double v17 = [(UISwipeActionStandardButton *)v13 titleLabel];
        [(UIView *)v13 bounds];
        objc_msgSend(v17, "sizeThatFits:", v18, v19);
        double v21 = v20;

        if ((_isRenderingText(v13) & (v16 < v21)) != 0) {
          double v22 = v21;
        }
        else {
          double v22 = v16;
        }
        double v23 = [(UISwipeActionButton *)v13 visualStyle];
        [v23 maxButtonWidth];
        double v25 = v24;

        double v26 = [(UISwipeActionButton *)v13 visualStyle];
        [v26 defaultButtonWidth];
        double v28 = v27;

        double v29 = v6 + v6 + v22;
        if (v28 >= v29) {
          double v29 = v28;
        }
        if (v25 < v29) {
          double v29 = v25;
        }
      }
      else
      {
        double v30 = [(UISwipeActionStandardButton *)self titleLabel];
        [(UIView *)self bounds];
        objc_msgSend(v30, "sizeThatFits:", v31, v32);
        double v34 = v33;

        double v35 = [(UISwipeActionButton *)self visualStyle];
        [v35 maxButtonWidth];
        double v37 = v36;

        v38 = [(UISwipeActionButton *)self visualStyle];
        [v38 defaultButtonWidth];
        double v40 = v39;

        double v29 = v6 + v6 + v34;
        if (v40 >= v29) {
          double v29 = v40;
        }
        if (v37 < v29) {
          double v29 = v37;
        }
      }
      self->_buttonWidth = v29;

      return self->_buttonWidth;
    }
  }
  else
  {
    v41.receiver = self;
    v41.super_class = (Class)UISwipeActionStandardButton;
    [(UISwipeActionButton *)&v41 buttonWidth];
  }
  return result;
}

- (id)titleLabel
{
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    [(UIButton *)self setNeedsLayout];
  }
  v5.receiver = self;
  v5.super_class = (Class)UISwipeActionStandardButton;
  double v3 = [(UIButton *)&v5 titleLabel];
  return v3;
}

- (double)extensionLength
{
  return self->_extensionLength;
}

- (void)setExtensionLength:(double)a3
{
  self->_extensionLength = a3;
}

@end
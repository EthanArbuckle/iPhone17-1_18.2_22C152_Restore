@interface SKUICollectionViewCell
- (BOOL)_showsBottomBorder;
- (BOOL)_showsLeftBorder;
- (BOOL)_showsRightBorder;
- (BOOL)_showsTopBorder;
- (BOOL)showsCellSeparators;
- (SKUICollectionViewCell)initWithFrame:(CGRect)a3;
- (UIColor)separatorColor;
- (UIEdgeInsets)separatorInsets;
- (UIEdgeInsets)separatorWidths;
- (int64_t)separatorStyle;
- (void)_setPosition:(int64_t)a3;
- (void)_updateBorderVisibility;
- (void)applyLayoutAttributes:(id)a3;
- (void)layoutSubviews;
- (void)setHighlighted:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSeparatorColor:(id)a3;
- (void)setSeparatorInsets:(UIEdgeInsets)a3;
- (void)setSeparatorStyle:(int64_t)a3;
- (void)setSeparatorWidths:(UIEdgeInsets)a3;
- (void)setShowsCellSeparators:(BOOL)a3;
@end

@implementation SKUICollectionViewCell

- (SKUICollectionViewCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[SKUICollectionViewCell initWithFrame:]();
  }
  v13.receiver = self;
  v13.super_class = (Class)SKUICollectionViewCell;
  v8 = -[SKUICollectionViewCell initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
  if (v8)
  {
    v9 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v9 scale];
    double v11 = 1.0 / v10;

    *((double *)v8 + 87) = v11;
    *((double *)v8 + 88) = v11;
    *((double *)v8 + 89) = v11;
    *((double *)v8 + 90) = v11;
    *(_OWORD *)(v8 + 728) = xmmword_1C1CCB660;
    *(_OWORD *)(v8 + 744) = xmmword_1C1CCB660;
  }
  return (SKUICollectionViewCell *)v8;
}

- (void)setSeparatorColor:(id)a3
{
  id v5 = a3;
  p_uint64_t separatorColor = &self->_separatorColor;
  uint64_t separatorColor = (uint64_t)self->_separatorColor;
  if ((id)separatorColor != v5)
  {
    id v16 = v5;
    uint64_t separatorColor = [(id)separatorColor isEqual:v5];
    id v5 = v16;
    if ((separatorColor & 1) == 0)
    {
      objc_storeStrong((id *)&self->_separatorColor, a3);
      bottomBorderView = self->_bottomBorderView;
      if (*p_separatorColor)
      {
        -[UIView setBackgroundColor:](self->_bottomBorderView, "setBackgroundColor:");
      }
      else
      {
        v9 = [MEMORY[0x1E4FB1618] clearColor];
        [(UIView *)bottomBorderView setBackgroundColor:v9];
      }
      leftBorderView = self->_leftBorderView;
      if (*p_separatorColor)
      {
        -[UIView setBackgroundColor:](self->_leftBorderView, "setBackgroundColor:");
      }
      else
      {
        double v11 = [MEMORY[0x1E4FB1618] clearColor];
        [(UIView *)leftBorderView setBackgroundColor:v11];
      }
      rightBorderView = self->_rightBorderView;
      if (*p_separatorColor)
      {
        -[UIView setBackgroundColor:](self->_rightBorderView, "setBackgroundColor:");
      }
      else
      {
        objc_super v13 = [MEMORY[0x1E4FB1618] clearColor];
        [(UIView *)rightBorderView setBackgroundColor:v13];
      }
      topBorderView = self->_topBorderView;
      if (*p_separatorColor)
      {
        uint64_t separatorColor = -[UIView setBackgroundColor:](topBorderView, "setBackgroundColor:");
      }
      else
      {
        v15 = [MEMORY[0x1E4FB1618] clearColor];
        [(UIView *)topBorderView setBackgroundColor:v15];
      }
      id v5 = v16;
    }
  }

  MEMORY[0x1F41817F8](separatorColor, v5);
}

- (void)setSeparatorStyle:(int64_t)a3
{
  if (self->_separatorStyle != a3)
  {
    self->_separatorStyle = a3;
    bottomBorderView = self->_bottomBorderView;
    if (a3)
    {
      if (!bottomBorderView)
      {
        id v5 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
        v6 = self->_bottomBorderView;
        self->_bottomBorderView = v5;

        v7 = self->_bottomBorderView;
        if (self->_separatorColor)
        {
          -[UIView setBackgroundColor:](self->_bottomBorderView, "setBackgroundColor:");
        }
        else
        {
          double v10 = [MEMORY[0x1E4FB1618] clearColor];
          [(UIView *)v7 setBackgroundColor:v10];
        }
        [(SKUICollectionViewCell *)self addSubview:self->_bottomBorderView];
        bottomBorderView = self->_bottomBorderView;
      }
      [(UIView *)bottomBorderView setHidden:[(SKUICollectionViewCell *)self _showsBottomBorder] ^ 1];
      leftBorderView = self->_leftBorderView;
      if (!leftBorderView)
      {
        v12 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
        objc_super v13 = self->_leftBorderView;
        self->_leftBorderView = v12;

        v14 = self->_leftBorderView;
        if (self->_separatorColor)
        {
          -[UIView setBackgroundColor:](self->_leftBorderView, "setBackgroundColor:");
        }
        else
        {
          v15 = [MEMORY[0x1E4FB1618] clearColor];
          [(UIView *)v14 setBackgroundColor:v15];
        }
        [(SKUICollectionViewCell *)self addSubview:self->_leftBorderView];
        leftBorderView = self->_leftBorderView;
      }
      [(UIView *)leftBorderView setHidden:[(SKUICollectionViewCell *)self _showsLeftBorder] ^ 1];
      rightBorderView = self->_rightBorderView;
      if (!rightBorderView)
      {
        v17 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
        v18 = self->_rightBorderView;
        self->_rightBorderView = v17;

        v19 = self->_rightBorderView;
        if (self->_separatorColor)
        {
          -[UIView setBackgroundColor:](self->_rightBorderView, "setBackgroundColor:");
        }
        else
        {
          v20 = [MEMORY[0x1E4FB1618] clearColor];
          [(UIView *)v19 setBackgroundColor:v20];
        }
        [(SKUICollectionViewCell *)self addSubview:self->_rightBorderView];
        rightBorderView = self->_rightBorderView;
      }
      [(UIView *)rightBorderView setHidden:[(SKUICollectionViewCell *)self _showsRightBorder] ^ 1];
      topBorderView = self->_topBorderView;
      if (!topBorderView)
      {
        v22 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
        v23 = self->_topBorderView;
        self->_topBorderView = v22;

        v24 = self->_topBorderView;
        if (self->_separatorColor)
        {
          -[UIView setBackgroundColor:](self->_topBorderView, "setBackgroundColor:");
        }
        else
        {
          v25 = [MEMORY[0x1E4FB1618] clearColor];
          [(UIView *)v24 setBackgroundColor:v25];
        }
        [(SKUICollectionViewCell *)self addSubview:self->_topBorderView];
        topBorderView = self->_topBorderView;
      }
      uint64_t v9 = [(SKUICollectionViewCell *)self _showsTopBorder] ^ 1;
      v8 = topBorderView;
    }
    else
    {
      [(UIView *)self->_bottomBorderView setHidden:1];
      [(UIView *)self->_leftBorderView setHidden:1];
      [(UIView *)self->_rightBorderView setHidden:1];
      v8 = self->_topBorderView;
      uint64_t v9 = 1;
    }
    [(UIView *)v8 setHidden:v9];
  }
}

- (void)setSeparatorWidths:(UIEdgeInsets)a3
{
  if (self->_separatorWidths.left != a3.left
    || self->_separatorWidths.top != a3.top
    || self->_separatorWidths.right != a3.right
    || self->_separatorWidths.bottom != a3.bottom)
  {
    self->_separatorWidths = a3;
    [(SKUICollectionViewCell *)self setNeedsLayout];
  }
}

- (void)setShowsCellSeparators:(BOOL)a3
{
}

- (BOOL)showsCellSeparators
{
  return self->_separatorStyle != 0;
}

- (void)applyLayoutAttributes:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SKUICollectionViewCell;
  id v4 = a3;
  [(SKUICollectionViewCell *)&v8 applyLayoutAttributes:v4];
  id v5 = [v4 backgroundColor];
  v7.receiver = self;
  v7.super_class = (Class)SKUICollectionViewCell;
  [(SKUICollectionViewCell *)&v7 setBackgroundColor:v5];

  uint64_t v6 = [v4 position];
  [(SKUICollectionViewCell *)self _setPosition:v6];
}

- (void)setHighlighted:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SKUICollectionViewCell;
  [(SKUICollectionViewCell *)&v4 setHighlighted:a3];
  [(SKUICollectionViewCell *)self _updateBorderVisibility];
}

- (void)setSelected:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SKUICollectionViewCell;
  [(SKUICollectionViewCell *)&v4 setSelected:a3];
  [(SKUICollectionViewCell *)self _updateBorderVisibility];
}

- (void)layoutSubviews
{
  v60.receiver = self;
  v60.super_class = (Class)SKUICollectionViewCell;
  [(SKUICollectionViewCell *)&v60 layoutSubviews];
  double right = *(double *)(MEMORY[0x1E4FB2848] + 24);
  double left = *(double *)(MEMORY[0x1E4FB2848] + 8);
  if (self->_separatorStyle != 4)
  {
    if (self->_position) {
      double left = self->_separatorInsets.left;
    }
    if ((self->_position & 5) == 4) {
      double right = self->_separatorInsets.right;
    }
  }
  double v56 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  double v57 = *MEMORY[0x1E4FB2848];
  [(SKUICollectionViewCell *)self bounds];
  CGFloat v4 = v3;
  double v6 = v5;
  CGFloat v8 = v7;
  double v10 = v9;
  double v11 = [(SKUICollectionViewCell *)self contentView];
  bottomBorderView = self->_bottomBorderView;
  double v13 = v10;
  if (bottomBorderView)
  {
    double v13 = v10;
    if (![(UIView *)bottomBorderView isHidden])
    {
      double v13 = v10 - self->_separatorWidths.bottom;
      v61.origin.double x = v4;
      v61.origin.double y = v6;
      v61.size.double width = v8;
      v61.size.double height = v10;
      double MinX = CGRectGetMinX(v61);
      v62.origin.double x = v4;
      v62.origin.double y = v6;
      v62.size.double width = v8;
      v62.size.double height = v10;
      CGFloat v15 = CGRectGetMaxY(v62) - self->_separatorWidths.bottom;
      v63.origin.double x = v4;
      v63.origin.double y = v6;
      v63.size.double width = v8;
      v63.size.double height = v10;
      CGFloat Width = CGRectGetWidth(v63);
      v17 = self->_bottomBorderView;
      SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(left + MinX, v57 + v15, Width - (right + left), self->_separatorWidths.bottom - (v57 + v56), v4, v6, v8, v10);
      -[UIView setFrame:](v17, "setFrame:");
    }
  }
  leftBorderView = self->_leftBorderView;
  double v19 = v8;
  double v20 = v4;
  if (leftBorderView)
  {
    double v19 = v8;
    double v20 = v4;
    if (![(UIView *)leftBorderView isHidden])
    {
      double v53 = v13;
      double v21 = self->_separatorWidths.left;
      double v22 = 0.0;
      if (v21 > 0.00000011920929)
      {
        double v23 = v21 * 0.5;
        v24 = [MEMORY[0x1E4FB1BA8] mainScreen];
        [v24 scale];
        double v26 = 1.0 / v25;

        if (v23 >= v26) {
          double v22 = v23;
        }
        else {
          double v22 = v26;
        }
      }
      double v52 = v8 - v22;
      v64.origin.double x = v4;
      v64.origin.double y = v6;
      v64.size.double width = v8;
      v64.size.double height = v10;
      CGFloat v27 = CGRectGetMinX(v64);
      v65.origin.double x = v4;
      v65.origin.double y = v6;
      v65.size.double width = v8;
      v65.size.double height = v10;
      CGFloat MinY = CGRectGetMinY(v65);
      v66.origin.double x = v4;
      v66.origin.double y = v6;
      v66.size.double width = v8;
      v66.size.double height = v10;
      CGFloat v29 = CGRectGetHeight(v66) - self->_separatorWidths.bottom;
      v30 = self->_leftBorderView;
      CGFloat v31 = v27;
      double v20 = v4 + v22;
      double v19 = v8 - v22;
      SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v31, MinY, v22, v29, v4, v6, v8, v10);
      -[UIView setFrame:](v30, "setFrame:");
      double v13 = v53;
    }
  }
  rightBorderView = self->_rightBorderView;
  if (rightBorderView && ![(UIView *)rightBorderView isHidden])
  {
    double v52 = v20;
    double v54 = v13;
    double v33 = self->_separatorWidths.right;
    double v34 = 0.0;
    if (v33 > 0.00000011920929)
    {
      double v35 = v33 * 0.5;
      v36 = [MEMORY[0x1E4FB1BA8] mainScreen];
      [v36 scale];
      double v38 = 1.0 / v37;

      if (v35 >= v38) {
        double v34 = v35;
      }
      else {
        double v34 = v38;
      }
    }
    double v19 = v19 - v34;
    v67.origin.double x = v4;
    v67.origin.double y = v6;
    v67.size.double width = v8;
    v67.size.double height = v10;
    CGFloat v39 = CGRectGetMaxX(v67) - v34;
    v68.origin.double x = v4;
    v68.origin.double y = v6;
    v68.size.double width = v8;
    v68.size.double height = v10;
    CGFloat v40 = CGRectGetMinY(v68);
    v69.origin.double x = v4;
    v69.origin.double y = v6;
    v69.size.double width = v8;
    v69.size.double height = v10;
    CGFloat Height = CGRectGetHeight(v69);
    v42 = self->_rightBorderView;
    SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v39, v40, v34, Height - self->_separatorWidths.bottom, v4, v6, v8, v10);
    -[UIView setFrame:](v42, "setFrame:");
    double v20 = v52;
    double v13 = v54;
  }
  topBorderView = self->_topBorderView;
  if (topBorderView && ![(UIView *)topBorderView isHidden])
  {
    double top = self->_separatorWidths.top;
    double v55 = v6 + top;
    double v13 = v13 - top;
    v70.origin.double x = v4;
    v70.origin.double y = v6;
    v70.size.double width = v8;
    v70.size.double height = v10;
    double v52 = v19;
    double v45 = v20;
    double v46 = CGRectGetMinX(v70);
    v71.origin.double x = v4;
    v71.origin.double y = v6;
    v71.size.double width = v8;
    v71.size.double height = v10;
    double v47 = CGRectGetMinY(v71);
    v72.origin.double x = v4;
    v72.origin.double y = v6;
    v72.size.double width = v8;
    v72.size.double height = v10;
    CGFloat v48 = CGRectGetWidth(v72);
    double v49 = self->_separatorWidths.top;
    v50 = self->_topBorderView;
    CGFloat v51 = left + v46;
    double v20 = v45;
    double v19 = v52;
    SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v51, v57 + v47, v48 - (right + left), v49 - (v57 + v56), v4, v6, v8, v10);
    -[UIView setFrame:](v50, "setFrame:");
    double v6 = v55;
  }
  objc_msgSend(v11, "setFrame:", v20, v6, v19, v13, *(void *)&v52);
}

- (void)_setPosition:(int64_t)a3
{
  if (self->_position != a3)
  {
    self->_position = a3;
    [(SKUICollectionViewCell *)self _updateBorderVisibility];
  }
}

- (BOOL)_showsBottomBorder
{
  BOOL v2 = 1;
  switch(self->_separatorStyle)
  {
    case 2:
    case 4:
    case 7:
      return v2;
    case 3:
      BOOL v2 = (self->_position & 0x20) == 0;
      break;
    default:
      BOOL v2 = 0;
      break;
  }
  return v2;
}

- (BOOL)_showsLeftBorder
{
  int64_t separatorStyle = self->_separatorStyle;
  int64_t v3 = self->_position & 1;
  BOOL v4 = v3 == 0;
  BOOL v6 = separatorStyle != 5 && separatorStyle != 0;
  if (separatorStyle == 6)
  {
    BOOL v7 = 0;
  }
  else
  {
    BOOL v4 = 0;
    BOOL v7 = v3 == 0;
  }
  if (v7) {
    BOOL v8 = v6;
  }
  else {
    BOOL v8 = v4;
  }
  if (separatorStyle == 7) {
    return (self->_position & 1) == 0;
  }
  else {
    return v8;
  }
}

- (BOOL)_showsRightBorder
{
  int64_t separatorStyle = self->_separatorStyle;
  int64_t v3 = self->_position & 4;
  BOOL v4 = v3 == 0;
  BOOL v6 = separatorStyle != 5 && separatorStyle != 0;
  if (separatorStyle == 6)
  {
    BOOL v7 = 0;
  }
  else
  {
    BOOL v4 = 0;
    BOOL v7 = v3 == 0;
  }
  if (v7) {
    BOOL v8 = v6;
  }
  else {
    BOOL v8 = v4;
  }
  if (separatorStyle == 7) {
    return (self->_position & 4) == 0;
  }
  else {
    return v8;
  }
}

- (BOOL)_showsTopBorder
{
  BOOL v2 = self;
  LOBYTE(self) = 0;
  unint64_t separatorStyle = v2->_separatorStyle;
  if (separatorStyle <= 7)
  {
    if (((1 << separatorStyle) & 0x9C) != 0)
    {
      LODWORD(self) = (LOBYTE(v2->_position) >> 3) & 1;
    }
    else if (((1 << separatorStyle) & 0x22) != 0)
    {
      LOBYTE(self) = (v2->_position & 8) == 0;
    }
  }
  return (char)self;
}

- (void)_updateBorderVisibility
{
  BOOL v3 = [(SKUICollectionViewCell *)self _showsBottomBorder];
  int v4 = v3 ^ [(UIView *)self->_bottomBorderView isHidden];
  if ((v4 & 1) == 0) {
    [(UIView *)self->_bottomBorderView setHidden:!v3];
  }
  BOOL v5 = [(SKUICollectionViewCell *)self _showsLeftBorder];
  if (v5 == [(UIView *)self->_leftBorderView isHidden])
  {
    [(UIView *)self->_leftBorderView setHidden:!v5];
    int v6 = 1;
  }
  else
  {
    int v6 = v4 ^ 1;
  }
  BOOL v7 = [(SKUICollectionViewCell *)self _showsRightBorder];
  if (v7 == [(UIView *)self->_rightBorderView isHidden])
  {
    [(UIView *)self->_rightBorderView setHidden:!v7];
    int v6 = 1;
  }
  BOOL v8 = [(SKUICollectionViewCell *)self _showsTopBorder];
  if (v8 == [(UIView *)self->_topBorderView isHidden])
  {
    [(UIView *)self->_topBorderView setHidden:!v8];
  }
  else if (!v6)
  {
    return;
  }

  [(SKUICollectionViewCell *)self setNeedsLayout];
}

- (int64_t)separatorStyle
{
  return self->_separatorStyle;
}

- (UIColor)separatorColor
{
  return self->_separatorColor;
}

- (UIEdgeInsets)separatorWidths
{
  double top = self->_separatorWidths.top;
  double left = self->_separatorWidths.left;
  double bottom = self->_separatorWidths.bottom;
  double right = self->_separatorWidths.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIEdgeInsets)separatorInsets
{
  double top = self->_separatorInsets.top;
  double left = self->_separatorInsets.left;
  double bottom = self->_separatorInsets.bottom;
  double right = self->_separatorInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setSeparatorInsets:(UIEdgeInsets)a3
{
  self->_separatorInsets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorColor, 0);
  objc_storeStrong((id *)&self->_topBorderView, 0);
  objc_storeStrong((id *)&self->_rightBorderView, 0);
  objc_storeStrong((id *)&self->_leftBorderView, 0);

  objc_storeStrong((id *)&self->_bottomBorderView, 0);
}

- (void)initWithFrame:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUICollectionViewCell initWithFrame:]";
}

@end
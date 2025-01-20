@interface SUUICollectionViewCell
- (BOOL)_showsBottomBorder;
- (BOOL)_showsLeftBorder;
- (BOOL)_showsRightBorder;
- (BOOL)_showsTopBorder;
- (BOOL)showsCellSeparators;
- (SUUICollectionViewCell)initWithFrame:(CGRect)a3;
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

@implementation SUUICollectionViewCell

- (SUUICollectionViewCell)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SUUICollectionViewCell;
  v3 = -[SUUICollectionViewCell initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x263F82B60] mainScreen];
    [v4 scale];
    double v6 = 1.0 / v5;

    *((double *)v3 + 87) = v6;
    *((double *)v3 + 88) = v6;
    *((double *)v3 + 89) = v6;
    *((double *)v3 + 90) = v6;
    *(_OWORD *)(v3 + 728) = xmmword_2568A1F50;
    *(_OWORD *)(v3 + 744) = xmmword_2568A1F50;
  }
  return (SUUICollectionViewCell *)v3;
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
        v9 = [MEMORY[0x263F825C8] clearColor];
        [(UIView *)bottomBorderView setBackgroundColor:v9];
      }
      leftBorderView = self->_leftBorderView;
      if (*p_separatorColor)
      {
        -[UIView setBackgroundColor:](self->_leftBorderView, "setBackgroundColor:");
      }
      else
      {
        v11 = [MEMORY[0x263F825C8] clearColor];
        [(UIView *)leftBorderView setBackgroundColor:v11];
      }
      rightBorderView = self->_rightBorderView;
      if (*p_separatorColor)
      {
        -[UIView setBackgroundColor:](self->_rightBorderView, "setBackgroundColor:");
      }
      else
      {
        v13 = [MEMORY[0x263F825C8] clearColor];
        [(UIView *)rightBorderView setBackgroundColor:v13];
      }
      topBorderView = self->_topBorderView;
      if (*p_separatorColor)
      {
        uint64_t separatorColor = -[UIView setBackgroundColor:](topBorderView, "setBackgroundColor:");
      }
      else
      {
        v15 = [MEMORY[0x263F825C8] clearColor];
        [(UIView *)topBorderView setBackgroundColor:v15];
      }
      id v5 = v16;
    }
  }
  MEMORY[0x270F9A758](separatorColor, v5);
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
        id v5 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
        double v6 = self->_bottomBorderView;
        self->_bottomBorderView = v5;

        v7 = self->_bottomBorderView;
        if (self->_separatorColor)
        {
          -[UIView setBackgroundColor:](self->_bottomBorderView, "setBackgroundColor:");
        }
        else
        {
          v10 = [MEMORY[0x263F825C8] clearColor];
          [(UIView *)v7 setBackgroundColor:v10];
        }
        [(SUUICollectionViewCell *)self addSubview:self->_bottomBorderView];
        bottomBorderView = self->_bottomBorderView;
      }
      [(UIView *)bottomBorderView setHidden:[(SUUICollectionViewCell *)self _showsBottomBorder] ^ 1];
      leftBorderView = self->_leftBorderView;
      if (!leftBorderView)
      {
        v12 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
        v13 = self->_leftBorderView;
        self->_leftBorderView = v12;

        v14 = self->_leftBorderView;
        if (self->_separatorColor)
        {
          -[UIView setBackgroundColor:](self->_leftBorderView, "setBackgroundColor:");
        }
        else
        {
          v15 = [MEMORY[0x263F825C8] clearColor];
          [(UIView *)v14 setBackgroundColor:v15];
        }
        [(SUUICollectionViewCell *)self addSubview:self->_leftBorderView];
        leftBorderView = self->_leftBorderView;
      }
      [(UIView *)leftBorderView setHidden:[(SUUICollectionViewCell *)self _showsLeftBorder] ^ 1];
      rightBorderView = self->_rightBorderView;
      if (!rightBorderView)
      {
        v17 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
        v18 = self->_rightBorderView;
        self->_rightBorderView = v17;

        v19 = self->_rightBorderView;
        if (self->_separatorColor)
        {
          -[UIView setBackgroundColor:](self->_rightBorderView, "setBackgroundColor:");
        }
        else
        {
          v20 = [MEMORY[0x263F825C8] clearColor];
          [(UIView *)v19 setBackgroundColor:v20];
        }
        [(SUUICollectionViewCell *)self addSubview:self->_rightBorderView];
        rightBorderView = self->_rightBorderView;
      }
      [(UIView *)rightBorderView setHidden:[(SUUICollectionViewCell *)self _showsRightBorder] ^ 1];
      topBorderView = self->_topBorderView;
      if (!topBorderView)
      {
        v22 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
        v23 = self->_topBorderView;
        self->_topBorderView = v22;

        v24 = self->_topBorderView;
        if (self->_separatorColor)
        {
          -[UIView setBackgroundColor:](self->_topBorderView, "setBackgroundColor:");
        }
        else
        {
          v25 = [MEMORY[0x263F825C8] clearColor];
          [(UIView *)v24 setBackgroundColor:v25];
        }
        [(SUUICollectionViewCell *)self addSubview:self->_topBorderView];
        topBorderView = self->_topBorderView;
      }
      uint64_t v9 = [(SUUICollectionViewCell *)self _showsTopBorder] ^ 1;
      objc_super v8 = topBorderView;
    }
    else
    {
      [(UIView *)self->_bottomBorderView setHidden:1];
      [(UIView *)self->_leftBorderView setHidden:1];
      [(UIView *)self->_rightBorderView setHidden:1];
      objc_super v8 = self->_topBorderView;
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
    [(SUUICollectionViewCell *)self setNeedsLayout];
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
  v8.super_class = (Class)SUUICollectionViewCell;
  id v4 = a3;
  [(SUUICollectionViewCell *)&v8 applyLayoutAttributes:v4];
  id v5 = [v4 backgroundColor];
  v7.receiver = self;
  v7.super_class = (Class)SUUICollectionViewCell;
  [(SUUICollectionViewCell *)&v7 setBackgroundColor:v5];

  uint64_t v6 = [v4 position];
  [(SUUICollectionViewCell *)self _setPosition:v6];
}

- (void)setHighlighted:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SUUICollectionViewCell;
  [(SUUICollectionViewCell *)&v4 setHighlighted:a3];
  [(SUUICollectionViewCell *)self _updateBorderVisibility];
}

- (void)setSelected:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SUUICollectionViewCell;
  [(SUUICollectionViewCell *)&v4 setSelected:a3];
  [(SUUICollectionViewCell *)self _updateBorderVisibility];
}

- (void)layoutSubviews
{
  v55.receiver = self;
  v55.super_class = (Class)SUUICollectionViewCell;
  [(SUUICollectionViewCell *)&v55 layoutSubviews];
  double right = *(double *)(MEMORY[0x263F834E8] + 24);
  double left = *(double *)(MEMORY[0x263F834E8] + 8);
  if (self->_separatorStyle != 4)
  {
    if (self->_position) {
      double left = self->_separatorInsets.left;
    }
    if ((self->_position & 5) == 4) {
      double right = self->_separatorInsets.right;
    }
  }
  double v51 = *(double *)(MEMORY[0x263F834E8] + 16);
  double v52 = *MEMORY[0x263F834E8];
  [(SUUICollectionViewCell *)self bounds];
  CGFloat v4 = v3;
  double v6 = v5;
  CGFloat v8 = v7;
  double v10 = v9;
  v11 = [(SUUICollectionViewCell *)self contentView];
  bottomBorderView = self->_bottomBorderView;
  double v13 = v10;
  if (bottomBorderView)
  {
    double v13 = v10;
    if (![(UIView *)bottomBorderView isHidden])
    {
      double v13 = v10 - self->_separatorWidths.bottom;
      v56.origin.x = v4;
      v56.origin.y = v6;
      v56.size.width = v8;
      v56.size.height = v10;
      double MinX = CGRectGetMinX(v56);
      v57.origin.x = v4;
      v57.origin.y = v6;
      v57.size.width = v8;
      v57.size.height = v10;
      CGFloat v15 = CGRectGetMaxY(v57) - self->_separatorWidths.bottom;
      v58.origin.x = v4;
      v58.origin.y = v6;
      v58.size.width = v8;
      v58.size.height = v10;
      CGFloat Width = CGRectGetWidth(v58);
      [(UIView *)self->_bottomBorderView setFrame:SUUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(left + MinX, v52 + v15, Width - (right + left), self->_separatorWidths.bottom - (v52 + v51), v4, v6, v8, v10)];
    }
  }
  leftBorderView = self->_leftBorderView;
  double v18 = v8;
  double v19 = v4;
  if (leftBorderView)
  {
    double v18 = v8;
    double v19 = v4;
    if (![(UIView *)leftBorderView isHidden])
    {
      double v48 = v13;
      double v20 = self->_separatorWidths.left;
      double v21 = 0.0;
      if (v20 > 0.00000011920929)
      {
        double v22 = v20 * 0.5;
        v23 = [MEMORY[0x263F82B60] mainScreen];
        [v23 scale];
        double v25 = 1.0 / v24;

        if (v22 >= v25) {
          double v21 = v22;
        }
        else {
          double v21 = v25;
        }
      }
      double v47 = v8 - v21;
      v59.origin.x = v4;
      v59.origin.y = v6;
      v59.size.width = v8;
      v59.size.height = v10;
      CGFloat v26 = CGRectGetMinX(v59);
      v60.origin.x = v4;
      v60.origin.y = v6;
      v60.size.width = v8;
      v60.size.height = v10;
      CGFloat MinY = CGRectGetMinY(v60);
      v61.origin.x = v4;
      v61.origin.y = v6;
      v61.size.width = v8;
      v61.size.height = v10;
      CGFloat v28 = CGRectGetHeight(v61) - self->_separatorWidths.bottom;
      CGFloat v29 = v26;
      double v19 = v4 + v21;
      double v18 = v8 - v21;
      [(UIView *)self->_leftBorderView setFrame:SUUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v29, MinY, v21, v28, v4, v6, v8, v10)];
      double v13 = v48;
    }
  }
  rightBorderView = self->_rightBorderView;
  if (rightBorderView && ![(UIView *)rightBorderView isHidden])
  {
    double v47 = v19;
    double v49 = v13;
    double v31 = self->_separatorWidths.right;
    double v32 = 0.0;
    if (v31 > 0.00000011920929)
    {
      double v33 = v31 * 0.5;
      v34 = [MEMORY[0x263F82B60] mainScreen];
      [v34 scale];
      double v36 = 1.0 / v35;

      if (v33 >= v36) {
        double v32 = v33;
      }
      else {
        double v32 = v36;
      }
    }
    double v18 = v18 - v32;
    v62.origin.x = v4;
    v62.origin.y = v6;
    v62.size.width = v8;
    v62.size.height = v10;
    CGFloat v37 = CGRectGetMaxX(v62) - v32;
    v63.origin.x = v4;
    v63.origin.y = v6;
    v63.size.width = v8;
    v63.size.height = v10;
    CGFloat v38 = CGRectGetMinY(v63);
    v64.origin.x = v4;
    v64.origin.y = v6;
    v64.size.width = v8;
    v64.size.height = v10;
    CGFloat Height = CGRectGetHeight(v64);
    [(UIView *)self->_rightBorderView setFrame:SUUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v37, v38, v32, Height - self->_separatorWidths.bottom, v4, v6, v8, v10)];
    double v19 = v47;
    double v13 = v49;
  }
  topBorderView = self->_topBorderView;
  if (topBorderView && ![(UIView *)topBorderView isHidden])
  {
    double top = self->_separatorWidths.top;
    double v50 = v6 + top;
    double v13 = v13 - top;
    v65.origin.x = v4;
    v65.origin.y = v6;
    v65.size.width = v8;
    v65.size.height = v10;
    double v47 = v18;
    double v42 = v19;
    double v43 = CGRectGetMinX(v65);
    v66.origin.x = v4;
    v66.origin.y = v6;
    v66.size.width = v8;
    v66.size.height = v10;
    double v44 = CGRectGetMinY(v66);
    v67.origin.x = v4;
    v67.origin.y = v6;
    v67.size.width = v8;
    v67.size.height = v10;
    CGFloat v45 = CGRectGetWidth(v67);
    CGFloat v46 = left + v43;
    double v19 = v42;
    double v18 = v47;
    [(UIView *)self->_topBorderView setFrame:SUUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v46, v52 + v44, v45 - (right + left), self->_separatorWidths.top - (v52 + v51), v4, v6, v8, v10)];
    double v6 = v50;
  }
  objc_msgSend(v11, "setFrame:", v19, v6, v18, v13, *(void *)&v47);
}

- (void)_setPosition:(int64_t)a3
{
  if (self->_position != a3)
  {
    self->_position = a3;
    [(SUUICollectionViewCell *)self _updateBorderVisibility];
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
  BOOL v3 = [(SUUICollectionViewCell *)self _showsBottomBorder];
  int v4 = v3 ^ [(UIView *)self->_bottomBorderView isHidden];
  if ((v4 & 1) == 0) {
    [(UIView *)self->_bottomBorderView setHidden:!v3];
  }
  BOOL v5 = [(SUUICollectionViewCell *)self _showsLeftBorder];
  if (v5 == [(UIView *)self->_leftBorderView isHidden])
  {
    [(UIView *)self->_leftBorderView setHidden:!v5];
    int v6 = 1;
  }
  else
  {
    int v6 = v4 ^ 1;
  }
  BOOL v7 = [(SUUICollectionViewCell *)self _showsRightBorder];
  if (v7 == [(UIView *)self->_rightBorderView isHidden])
  {
    [(UIView *)self->_rightBorderView setHidden:!v7];
    int v6 = 1;
  }
  BOOL v8 = [(SUUICollectionViewCell *)self _showsTopBorder];
  if (v8 == [(UIView *)self->_topBorderView isHidden])
  {
    [(UIView *)self->_topBorderView setHidden:!v8];
  }
  else if (!v6)
  {
    return;
  }
  [(SUUICollectionViewCell *)self setNeedsLayout];
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

@end
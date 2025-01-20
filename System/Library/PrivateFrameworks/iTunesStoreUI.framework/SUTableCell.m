@interface SUTableCell
- ($3CC19D079FD0B010EE84973AA846B91B)position;
- (BOOL)_canDrawContent;
- (BOOL)drawAsDisabled;
- (BOOL)highlightsOnlyContentView;
- (BOOL)showHighlight;
- (BOOL)usesSubviews;
- (SUCellConfiguration)configuration;
- (SUItemOfferButton)itemOfferButton;
- (SUTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UIBezierPath)clippingPath;
- (UIColor)bottomBorderColor;
- (UIColor)topBorderColor;
- (id)copyPurchaseAnimationView;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (int)clipCorners;
- (int64_t)editState;
- (void)dealloc;
- (void)drawRect:(CGRect)a3;
- (void)layoutSubviews;
- (void)setBottomBorderColor:(id)a3;
- (void)setClipCorners:(int)a3;
- (void)setConfiguration:(id)a3;
- (void)setDrawAsDisabled:(BOOL)a3;
- (void)setEditState:(int64_t)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4;
- (void)setHighlightsOnlyContentView:(BOOL)a3;
- (void)setPosition:(id *)a3;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
- (void)setShowHighlight:(BOOL)a3;
- (void)setShowingDeleteConfirmation:(BOOL)a3;
- (void)setTopBorderColor:(id)a3;
- (void)setUsesSubviews:(BOOL)a3;
@end

@implementation SUTableCell

- (SUTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)SUTableCell;
  v4 = [(SUTableCell *)&v10 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    v6 = (void *)[(SUTableCell *)v4 contentView];
    v7 = [SUTableCellContentView alloc];
    [v6 bounds];
    v8 = -[SUTableCellContentView initWithFrame:](v7, "initWithFrame:");
    v5->_configurationView = v8;
    [(SUTableCellContentView *)v8 setContentMode:9];
    [(SUTableCellContentView *)v5->_configurationView setAutoresizingMask:18];
    -[SUTableCellContentView setBackgroundColor:](v5->_configurationView, "setBackgroundColor:", [MEMORY[0x263F1C550] clearColor]);
    [v6 addSubview:v5->_configurationView];
    if (!initWithStyle_reuseIdentifier__sLayoutManager) {
      initWithStyle_reuseIdentifier__sLayoutManager = objc_alloc_init(SUTableCellLayoutManager);
    }
    [(SUTableCell *)v5 setLayoutManager:"setLayoutManager:"];
  }
  return v5;
}

- (void)dealloc
{
  self->_bottomBorderColor = 0;
  self->_configurationView = 0;

  self->_itemOfferButton = 0;
  self->_topBorderColor = 0;
  v3.receiver = self;
  v3.super_class = (Class)SUTableCell;
  [(SUTableCell *)&v3 dealloc];
}

- (id)copyPurchaseAnimationView
{
  v2 = [(SUTableCell *)self configuration];
  uint64_t v3 = [(SUCellConfiguration *)v2 indexOfLabelForPurchaseAnimation];
  if (v3 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }

  return __CreateLabel(v2, v3, 0);
}

- (BOOL)_canDrawContent
{
  return self->_topBorderColor && self->_position.globalIndex || self->_bottomBorderColor != 0;
}

- (void)drawRect:(CGRect)a3
{
  [(SUTableCell *)self bounds];
  CGFloat v5 = v4;
  double v7 = v6;
  topBorderColor = self->_topBorderColor;
  if (topBorderColor && self->_position.globalIndex)
  {
    [(UIColor *)topBorderColor set];
    v12.origin.x = 0.0;
    v12.origin.y = 0.0;
    v12.size.height = 1.0;
    v12.size.width = v5;
    UIRectFill(v12);
  }
  if (self->_bottomBorderColor)
  {
    double v9 = 1.0;
    if (self->_topBorderColor)
    {
      long long v10 = *(_OWORD *)&self->_position.globalIndex;
      v11[0] = *(_OWORD *)&self->_position.localIndex;
      v11[1] = v10;
      if (SUPositionIsLast((uint64_t)v11))
      {
        [(UIColor *)self->_topBorderColor set];
        v13.origin.y = v7 + -1.0;
        v13.origin.x = 0.0;
        v13.size.height = 1.0;
        v13.size.width = v5;
        UIRectFill(v13);
        double v9 = 2.0;
      }
    }
    [(UIColor *)self->_bottomBorderColor set];
    v14.origin.y = v7 - v9;
    v14.origin.x = 0.0;
    v14.size.height = 1.0;
    v14.size.width = v5;
    UIRectFill(v14);
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v10.receiver = self;
  v10.super_class = (Class)SUTableCell;
  double v7 = -[SUTableCell hitTest:withEvent:](&v10, sel_hitTest_withEvent_, a4);
  if (v7)
  {
    itemOfferButton = self->_itemOfferButton;
    if (v7 != itemOfferButton)
    {
      if ([(SUItemOfferButton *)itemOfferButton isDescendantOfView:self])
      {
        [(SUItemOfferButton *)self->_itemOfferButton frame];
        CGRect v13 = CGRectInset(v12, -30.0, -8.0);
        v11.CGFloat x = x;
        v11.CGFloat y = y;
        if (CGRectContainsPoint(v13, v11)) {
          return self->_itemOfferButton;
        }
      }
    }
  }
  return v7;
}

- (void)layoutSubviews
{
  v38.receiver = self;
  v38.super_class = (Class)SUTableCell;
  [(SUTableCell *)&v38 layoutSubviews];
  uint64_t v3 = (void *)[(SUTableCell *)self accessoryView];
  if ((SUTableCell *)[v3 superview] == self && (objc_msgSend(v3, "alpha"), v4 > 0.00000011920929))
  {
    objc_msgSend((id)-[SUTableCell layoutManager](self, "layoutManager"), "accessoryEndingRectForCell:forNewEditingState:showingDeleteConfirmation:", self, -[SUTableCell isEditing](self, "isEditing"), -[SUTableCell showingDeleteConfirmation](self, "showingDeleteConfirmation"));
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGRect v13 = (void *)[(SUTableCell *)self contentView];
    [v13 frame];
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    v39.origin.CGFloat x = v6;
    v39.origin.CGFloat y = v8;
    v39.size.width = v10;
    v39.size.height = v12;
    double v20 = CGRectGetMinX(v39) + -5.0 - v15;
  }
  else
  {
    CGRect v13 = (void *)[(SUTableCell *)self contentView];
    [v13 frame];
    double v15 = v21;
    double v17 = v22;
    double v19 = v23;
    double v20 = v24 + -10.0;
  }
  objc_msgSend(v13, "setFrame:", v15, v17, v20, v19);
  objc_msgSend((id)-[SUTableCell contentView](self, "contentView"), "frame");
  double v28 = v27;
  double v30 = v29;
  int64_t editState = self->_editState;
  if (editState) {
    double v32 = v25 + 40.0;
  }
  else {
    double v32 = v25;
  }
  if (editState) {
    double v33 = v26 + -40.0;
  }
  else {
    double v33 = v26;
  }
  [(SUTableCellContentView *)self->_configurationView frame];
  v41.origin.CGFloat x = v34;
  v41.origin.CGFloat y = v35;
  v41.size.width = v36;
  v41.size.height = v37;
  v40.origin.CGFloat x = v32;
  v40.origin.CGFloat y = v28;
  v40.size.width = v33;
  v40.size.height = v30;
  if (!CGRectEqualToRect(v40, v41))
  {
    -[SUTableCellContentView setFrame:](self->_configurationView, "setFrame:", v32, v28, v33, v30);
    [(SUTableCellContentView *)self->_configurationView layoutSubviews];
  }
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if (a3) {
    *(void *)&a3 = [(SUTableCell *)self showingDeleteConfirmation];
  }
  [(SUTableCellContentView *)self->_configurationView setDeleteConfirmationVisisble:a3];
  [(SUTableCellContentView *)self->_configurationView setUsesSubviews:v5 animated:v4];
  v7.receiver = self;
  v7.super_class = (Class)SUTableCell;
  [(SUTableCell *)&v7 setEditing:v5 animated:v4];
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if ([(SUTableCell *)self highlightsOnlyContentView])
  {
    configurationView = self->_configurationView;
    [(SUTableCellContentView *)configurationView setHighlighted:v5];
  }
  else
  {
    BOOL v8 = v5 && (*((unsigned char *)self + 1032) & 1) == 0;
    v9.receiver = self;
    v9.super_class = (Class)SUTableCell;
    [(SUTableCell *)&v9 setHighlighted:v8 animated:v4];
  }
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if ([(SUTableCell *)self highlightsOnlyContentView])
  {
    configurationView = self->_configurationView;
    [(SUTableCellContentView *)configurationView setHighlighted:v5];
  }
  else
  {
    BOOL v8 = v5 && (*((unsigned char *)self + 1032) & 1) == 0;
    v9.receiver = self;
    v9.super_class = (Class)SUTableCell;
    [(SUTableCell *)&v9 setSelected:v8 animated:v4];
  }
}

- (void)setShowingDeleteConfirmation:(BOOL)a3
{
  BOOL v3 = a3;
  -[SUTableCellContentView setDeleteConfirmationVisisble:](self->_configurationView, "setDeleteConfirmationVisisble:");
  v5.receiver = self;
  v5.super_class = (Class)SUTableCell;
  [(SUTableCell *)&v5 setShowingDeleteConfirmation:v3];
}

- (void)setEditState:(int64_t)a3
{
  if (self->_editState != a3)
  {
    self->_int64_t editState = a3;
    [(SUTableCell *)self setEditing:a3 != 0 animated:0];
    [(SUTableCell *)self setNeedsLayout];
    [(SUTableCell *)self setNeedsDisplay];
  }
}

- (int)clipCorners
{
  return [(SUTableCellContentView *)self->_configurationView clipCorners];
}

- (UIBezierPath)clippingPath
{
  return (UIBezierPath *)[(SUTableCellContentView *)self->_configurationView _clipPath];
}

- (SUCellConfiguration)configuration
{
  return [(SUTableCellContentView *)self->_configurationView configuration];
}

- (BOOL)drawAsDisabled
{
  return [(SUTableCellContentView *)self->_configurationView drawAsDisabled];
}

- (BOOL)highlightsOnlyContentView
{
  return [(SUTableCellContentView *)self->_configurationView highlightsOnlyContentView];
}

- (SUItemOfferButton)itemOfferButton
{
  result = self->_itemOfferButton;
  if (!result)
  {
    BOOL v4 = objc_alloc_init(SUItemOfferButton);
    self->_itemOfferButton = v4;
    [(SUItemOfferButton *)v4 sizeToFit];
    return self->_itemOfferButton;
  }
  return result;
}

- (void)setBottomBorderColor:(id)a3
{
  bottomBorderColor = self->_bottomBorderColor;
  if (bottomBorderColor != a3)
  {

    self->_bottomBorderColor = (UIColor *)a3;
    [(SUTableCell *)self setNeedsDisplay];
  }
}

- (void)setClipCorners:(int)a3
{
}

- (void)setConfiguration:(id)a3
{
}

- (void)setDrawAsDisabled:(BOOL)a3
{
}

- (void)setHighlightsOnlyContentView:(BOOL)a3
{
}

- (void)setPosition:(id *)a3
{
  p_position = &self->_position;
  long long v6 = *(_OWORD *)&self->_position.globalIndex;
  v10[0] = *(_OWORD *)&self->_position.localIndex;
  v10[1] = v6;
  long long v7 = *(_OWORD *)&a3->var2;
  v9[0] = *(_OWORD *)&a3->var0;
  v9[1] = v7;
  if (!SUPositionEqualToPosition(v10, v9))
  {
    long long v8 = *(_OWORD *)&a3->var2;
    *(_OWORD *)&p_position->localIndeCGFloat x = *(_OWORD *)&a3->var0;
    *(_OWORD *)&p_position->globalIndeCGFloat x = v8;
    [(SUTableCell *)self setNeedsDisplay];
  }
}

- (void)setShowHighlight:(BOOL)a3
{
  *((unsigned char *)self + 1032) = *((unsigned char *)self + 1032) & 0xFE | !a3;
}

- (void)setTopBorderColor:(id)a3
{
  topBorderColor = self->_topBorderColor;
  if (topBorderColor != a3)
  {

    self->_topBorderColor = (UIColor *)a3;
    [(SUTableCell *)self setNeedsDisplay];
  }
}

- (void)setUsesSubviews:(BOOL)a3
{
}

- (BOOL)showHighlight
{
  return (*((unsigned char *)self + 1032) & 1) == 0;
}

- (BOOL)usesSubviews
{
  return [(SUTableCellContentView *)self->_configurationView usesSubviews];
}

- (UIColor)bottomBorderColor
{
  return self->_bottomBorderColor;
}

- ($3CC19D079FD0B010EE84973AA846B91B)position
{
  long long v3 = *(_OWORD *)&self[33].var1;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[32].var3;
  *(_OWORD *)&retstr->var2 = v3;
  return self;
}

- (UIColor)topBorderColor
{
  return self->_topBorderColor;
}

- (int64_t)editState
{
  return self->_editState;
}

@end
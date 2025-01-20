@interface SearchUITableViewCellDragSource
- (UIEdgeInsets)customEdgeInsets;
- (id)dragParametersForPreviewView:(id)a3;
- (void)setCustomEdgeInsets:(UIEdgeInsets)a3;
@end

@implementation SearchUITableViewCellDragSource

- (id)dragParametersForPreviewView:(id)a3
{
  v20.receiver = self;
  v20.super_class = (Class)SearchUITableViewCellDragSource;
  id v4 = a3;
  v5 = [(SearchUIDragSource *)&v20 dragParametersForPreviewView:v4];
  [(SearchUITableViewCellDragSource *)self customEdgeInsets];
  double v7 = v6;
  [(SearchUITableViewCellDragSource *)self customEdgeInsets];
  double v9 = v8;
  [v4 bounds];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  v18 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRoundedRect:cornerRadius:", v11 + 0.0, v7 + v13, v15, v17 - (v7 + v9), 20.0);
  [v5 setVisiblePath:v18];

  return v5;
}

- (UIEdgeInsets)customEdgeInsets
{
  double top = self->_customEdgeInsets.top;
  double left = self->_customEdgeInsets.left;
  double bottom = self->_customEdgeInsets.bottom;
  double right = self->_customEdgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setCustomEdgeInsets:(UIEdgeInsets)a3
{
  self->_customEdgeInsets = a3;
}

@end
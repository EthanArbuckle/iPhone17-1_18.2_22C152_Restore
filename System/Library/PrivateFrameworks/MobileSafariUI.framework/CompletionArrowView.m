@interface CompletionArrowView
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)usesDownBackwardCompletionArrow;
- (UIButtonConfiguration)buttonConfiguration;
- (UITableViewCell)parentCell;
- (id)accessibilityIdentifier;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)setButtonConfiguration:(id)a3;
- (void)setParentCell:(id)a3;
- (void)setUsesDownBackwardCompletionArrow:(BOOL)a3;
@end

@implementation CompletionArrowView

- (void)setUsesDownBackwardCompletionArrow:(BOOL)a3
{
  BOOL v3 = a3;
  if (!self->_buttonConfiguration || self->_usesDownBackwardCompletionArrow != a3)
  {
    self->_usesDownBackwardCompletionArrow = a3;
    if (!self->_buttonConfiguration)
    {
      v5 = [MEMORY[0x1E4FB14D8] plainButtonConfiguration];
      buttonConfiguration = self->_buttonConfiguration;
      self->_buttonConfiguration = v5;

      v7 = [MEMORY[0x1E4FB1618] clearColor];
      v8 = [(UIButtonConfiguration *)self->_buttonConfiguration background];
      [v8 setBackgroundColor:v7];

      -[UIButtonConfiguration setContentInsets:](self->_buttonConfiguration, "setContentInsets:", *MEMORY[0x1E4FB12A8], *(double *)(MEMORY[0x1E4FB12A8] + 8), *(double *)(MEMORY[0x1E4FB12A8] + 16), *(double *)(MEMORY[0x1E4FB12A8] + 24));
      v9 = [MEMORY[0x1E4FB1830] configurationWithTextStyle:*MEMORY[0x1E4FB28C8] scale:2];
      v10 = (void *)MEMORY[0x1E4FB1830];
      v11 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
      v12 = [v10 configurationWithHierarchicalColor:v11];
      v13 = [v12 configurationByApplyingConfiguration:v9];

      [(UIButtonConfiguration *)self->_buttonConfiguration setPreferredSymbolConfigurationForImage:v13];
    }
    if (v3) {
      v14 = @"arrow.down.backward.circle";
    }
    else {
      v14 = @"arrow.up.backward.circle";
    }
    v15 = [MEMORY[0x1E4FB1818] systemImageNamed:v14];
    [(UIButtonConfiguration *)self->_buttonConfiguration setImage:v15];

    v16 = self->_buttonConfiguration;
    [(CompletionArrowView *)self setConfiguration:v16];
  }
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(CompletionArrowView *)self bounds];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  [(CompletionArrowView *)self bounds];
  CGFloat v15 = fmax(44.0 - CGRectGetWidth(v40), 0.0) * -0.5;
  v41.origin.CGFloat x = v8;
  v41.origin.CGFloat y = v10;
  v41.size.double width = v12;
  v41.size.CGFloat height = v14;
  CGRect v42 = CGRectInset(v41, v15, 0.0);
  CGFloat v16 = v42.origin.x;
  CGFloat v17 = v42.origin.y;
  double width = v42.size.width;
  CGFloat height = v42.size.height;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentCell);
  if (WeakRetained
    && [(CompletionArrowView *)self isDescendantOfView:WeakRetained])
  {
    [WeakRetained bounds];
    -[CompletionArrowView convertRect:fromView:](self, "convertRect:fromView:", WeakRetained);
    CGFloat v22 = v21;
    CGFloat v17 = v23;
    CGFloat v25 = v24;
    CGFloat height = v26;
    int v27 = [(CompletionArrowView *)self _sf_usesLeftToRightLayout];
    double v38 = y;
    CGFloat v28 = v16;
    CGFloat v29 = v17;
    double v30 = width;
    CGFloat v31 = height;
    if (v27)
    {
      double MaxX = CGRectGetMaxX(*(CGRect *)&v28);
      v43.origin.CGFloat x = v22;
      v43.origin.CGFloat y = v17;
      v43.size.double width = v25;
      v43.size.CGFloat height = height;
      if (MaxX < CGRectGetMaxX(v43))
      {
        v44.origin.CGFloat x = v22;
        v44.origin.CGFloat y = v17;
        v44.size.double width = v25;
        v44.size.CGFloat height = height;
        double v33 = CGRectGetMaxX(v44);
        v45.origin.CGFloat x = v16;
        v45.origin.CGFloat y = v17;
        v45.size.double width = width;
        v45.size.CGFloat height = height;
        double width = width + v33 - CGRectGetMaxX(v45);
      }
    }
    else
    {
      double MinX = CGRectGetMinX(*(CGRect *)&v28);
      v46.origin.CGFloat x = v22;
      v46.origin.CGFloat y = v17;
      v46.size.double width = v25;
      v46.size.CGFloat height = height;
      if (MinX > CGRectGetMinX(v46))
      {
        v47.origin.CGFloat x = v16;
        v47.origin.CGFloat y = v17;
        v47.size.double width = width;
        v47.size.CGFloat height = height;
        double v35 = CGRectGetMinX(v47);
        v48.origin.CGFloat x = v22;
        v48.origin.CGFloat y = v17;
        v48.size.double width = v25;
        v48.size.CGFloat height = height;
        double width = width + v35 - CGRectGetMinX(v48);
        v49.origin.CGFloat x = v22;
        v49.origin.CGFloat y = v17;
        v49.size.double width = v25;
        v49.size.CGFloat height = height;
        CGFloat v16 = CGRectGetMinX(v49);
      }
    }
    CGFloat y = v38;
  }
  v50.origin.CGFloat x = v16;
  v50.origin.CGFloat y = v17;
  v50.size.double width = width;
  v50.size.CGFloat height = height;
  v39.CGFloat x = x;
  v39.CGFloat y = y;
  BOOL v36 = CGRectContainsPoint(v50, v39);

  return v36;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CompletionArrowView;
  -[CompletionArrowView hitTest:withEvent:](&v11, sel_hitTest_withEvent_, v7, x, y);
  CGFloat v8 = (CompletionArrowView *)objc_claimAutoreleasedReturnValue();
  if (v8 || !-[CompletionArrowView pointInside:withEvent:](self, "pointInside:withEvent:", v7, x, y)) {
    self = v8;
  }
  double v9 = self;

  return v9;
}

- (id)accessibilityIdentifier
{
  return @"SearchSuggestionCompletionArrowView";
}

- (UITableViewCell)parentCell
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentCell);
  return (UITableViewCell *)WeakRetained;
}

- (void)setParentCell:(id)a3
{
}

- (BOOL)usesDownBackwardCompletionArrow
{
  return self->_usesDownBackwardCompletionArrow;
}

- (UIButtonConfiguration)buttonConfiguration
{
  return self->_buttonConfiguration;
}

- (void)setButtonConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonConfiguration, 0);
  objc_destroyWeak((id *)&self->_parentCell);
}

@end
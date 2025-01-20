@interface TKPickerDividerTableViewCell
- (CGRect)_dividerViewFrame;
- (TKPickerDividerTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UIColor)contentBackgroundColor;
- (int64_t)contentBackdropOverlayBlendMode;
- (void)layoutSubviews;
- (void)setContentBackdropOverlayBlendMode:(int64_t)a3;
- (void)setContentBackgroundColor:(id)a3;
- (void)setSeparatorStyle:(int64_t)a3;
@end

@implementation TKPickerDividerTableViewCell

- (TKPickerDividerTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)TKPickerDividerTableViewCell;
  v4 = [(TKPickerDividerTableViewCell *)&v10 initWithStyle:0 reuseIdentifier:a4];
  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x263F1CB60]);
    [(TKPickerDividerTableViewCell *)v4 _dividerViewFrame];
    uint64_t v6 = objc_msgSend(v5, "initWithFrame:");
    dividerView = v4->_dividerView;
    v4->_dividerView = (UIView *)v6;

    v8 = [(TKPickerDividerTableViewCell *)v4 contentView];
    [v8 addSubview:v4->_dividerView];
  }
  return v4;
}

- (UIColor)contentBackgroundColor
{
  return [(UIView *)self->_dividerView backgroundColor];
}

- (void)setContentBackgroundColor:(id)a3
{
}

- (void)setContentBackdropOverlayBlendMode:(int64_t)a3
{
  if (self->_contentBackdropOverlayBlendMode != a3)
  {
    self->_contentBackdropOverlayBlendMode = a3;
    -[UIView _setDrawsAsBackdropOverlayWithBlendMode:](self->_dividerView, "_setDrawsAsBackdropOverlayWithBlendMode:");
  }
}

- (void)setSeparatorStyle:(int64_t)a3
{
  v3.receiver = self;
  v3.super_class = (Class)TKPickerDividerTableViewCell;
  [(TKPickerDividerTableViewCell *)&v3 setSeparatorStyle:0];
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)TKPickerDividerTableViewCell;
  [(TKPickerDividerTableViewCell *)&v4 layoutSubviews];
  dividerView = self->_dividerView;
  [(TKPickerDividerTableViewCell *)self _dividerViewFrame];
  -[UIView setFrame:](dividerView, "setFrame:");
}

- (CGRect)_dividerViewFrame
{
  [(TKPickerDividerTableViewCell *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(TKPickerDividerTableViewCell *)self contentView];
  -[TKPickerDividerTableViewCell convertRect:toView:](self, "convertRect:toView:", v11, v4, v6, v8, v10);
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;

  v20 = [(TKPickerDividerTableViewCell *)self window];
  v21 = [v20 screen];

  if (!v21)
  {
    v21 = [MEMORY[0x263F1C920] mainScreen];
  }
  [v21 scale];
  double v23 = v19 + -1.0 / v22;

  double v24 = v13;
  double v25 = v15;
  double v26 = v17;
  double v27 = v23;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (int64_t)contentBackdropOverlayBlendMode
{
  return self->_contentBackdropOverlayBlendMode;
}

- (void).cxx_destruct
{
}

@end
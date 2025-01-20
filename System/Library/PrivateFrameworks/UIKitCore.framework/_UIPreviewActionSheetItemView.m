@interface _UIPreviewActionSheetItemView
- (BOOL)selected;
- (UIImageView)imageView;
- (UILabel)label;
- (UIPreviewAction)action;
- (_UIPreviewActionSheetItemView)initWithCoder:(id)a3;
- (_UIPreviewActionSheetItemView)initWithFrame:(CGRect)a3;
- (_UIPreviewActionSheetItemView)initWithFrame:(CGRect)a3 action:(id)a4;
- (void)_updateConstraints;
- (void)_updateImageFromAction;
- (void)_updateLabelFont;
- (void)_updateTitleFromAction;
- (void)dealloc;
- (void)setAction:(id)a3;
- (void)setImageView:(id)a3;
- (void)setLabel:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation _UIPreviewActionSheetItemView

- (_UIPreviewActionSheetItemView)initWithFrame:(CGRect)a3
{
  return -[_UIPreviewActionSheetItemView initWithFrame:action:](self, "initWithFrame:action:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_UIPreviewActionSheetItemView)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UIPreviewActionSheetItemView;
  return [(UIView *)&v4 initWithCoder:a3];
}

- (_UIPreviewActionSheetItemView)initWithFrame:(CGRect)a3 action:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v22.receiver = self;
  v22.super_class = (Class)_UIPreviewActionSheetItemView;
  v10 = -[UIView initWithFrame:](&v22, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    v12 = v10;
    [(UIView *)v12 setTranslatesAutoresizingMaskIntoConstraints:0];
    v13 = [UIImageView alloc];
    double v14 = *MEMORY[0x1E4F1DB28];
    double v15 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v16 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v17 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    v18 = -[UIImageView initWithFrame:](v13, "initWithFrame:", *MEMORY[0x1E4F1DB28], v15, v16, v17);
    [(UIImageView *)v18 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v18 setContentMode:1];
    [(UIView *)v12 addSubview:v18];
    [(_UIPreviewActionSheetItemView *)v12 setImageView:v18];
    v19 = -[UILabel initWithFrame:]([UILabel alloc], "initWithFrame:", v14, v15, v16, v17);
    [(UIView *)v19 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v19 setTextAlignment:1];
    [(UIView *)v12 addSubview:v19];
    [(_UIPreviewActionSheetItemView *)v12 setLabel:v19];
    v20 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v20 addObserver:v12 selector:sel__contentSizeChanged_ name:@"UIContentSizeCategoryDidChangeNotification" object:0];

    [(_UIPreviewActionSheetItemView *)v12 setAction:v9];
    [(_UIPreviewActionSheetItemView *)v12 _updateLabelFont];
  }

  return v11;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"UIContentSizeCategoryDidChangeNotification" object:0];

  v4.receiver = self;
  v4.super_class = (Class)_UIPreviewActionSheetItemView;
  [(UIView *)&v4 dealloc];
}

- (void)setAction:(id)a3
{
  v5 = (UIPreviewAction *)a3;
  if (self->_action != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_action, a3);
    [(_UIPreviewActionSheetItemView *)self _updateTitleFromAction];
    [(_UIPreviewActionSheetItemView *)self _updateImageFromAction];
    [(_UIPreviewActionSheetItemView *)self _updateConstraints];
    v5 = v6;
  }
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if ([(_UIPreviewActionSheetItemView *)self selected] != a3)
  {
    [(_UIPreviewActionSheetItemView *)self setSelected:v5];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __54___UIPreviewActionSheetItemView_setSelected_animated___block_invoke;
    aBlock[3] = &unk_1E52D9F70;
    aBlock[4] = self;
    v7 = (void (**)(void))_Block_copy(aBlock);
    v8 = v7;
    if (v4)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __54___UIPreviewActionSheetItemView_setSelected_animated___block_invoke_2;
      v9[3] = &unk_1E52DA040;
      v10 = v7;
      +[UIView animateWithDuration:v9 animations:0.2];
    }
    else
    {
      v7[2](v7);
    }
  }
}

- (void)_updateLabelFont
{
  v3 = [(id)UIApp preferredContentSizeCategory];
  double v4 = 20.0;
  if (([v3 isEqualToString:@"UICTContentSizeCategoryXS"] & 1) == 0
    && ([v3 isEqualToString:@"UICTContentSizeCategoryS"] & 1) == 0
    && ([v3 isEqualToString:@"UICTContentSizeCategoryM"] & 1) == 0
    && ([v3 isEqualToString:@"UICTContentSizeCategoryL"] & 1) == 0)
  {
    double v4 = 22.0;
    if (([v3 isEqualToString:@"UICTContentSizeCategoryXL"] & 1) == 0)
    {
      if ([v3 isEqualToString:@"UICTContentSizeCategoryXXL"]) {
        double v4 = 23.0;
      }
      else {
        double v4 = 24.0;
      }
    }
  }

  BOOL v5 = [off_1E52D39B8 systemFontOfSize:v4];
  v6 = [(_UIPreviewActionSheetItemView *)self label];
  [v6 setFont:v5];

  [(UIView *)self invalidateIntrinsicContentSize];
}

- (void)_updateTitleFromAction
{
  if (self->_action)
  {
    v3 = [(_UIPreviewActionSheetItemView *)self action];
    id v7 = [v3 _effectiveColor];

    double v4 = [(_UIPreviewActionSheetItemView *)self label];
    BOOL v5 = [(_UIPreviewActionSheetItemView *)self action];
    v6 = [v5 title];
    [v4 setText:v6];

    if (v7) {
      [v4 setTextColor:v7];
    }
    [v4 _setTextColorFollowsTintColor:v7 == 0];
  }
}

- (void)_updateImageFromAction
{
  if (self->_action)
  {
    id v8 = [(_UIPreviewActionSheetItemView *)self imageView];
    v3 = [(_UIPreviewActionSheetItemView *)self action];
    double v4 = [v3 _effectiveColor];
    [v8 setTintColor:v4];

    BOOL v5 = [(_UIPreviewActionSheetItemView *)self action];
    v6 = [v5 _effectiveImage];
    id v7 = [v6 imageWithRenderingMode:2];
    [v8 setImage:v7];
  }
}

- (void)_updateConstraints
{
  id v37 = [(_UIPreviewActionSheetItemView *)self label];
  v3 = [(_UIPreviewActionSheetItemView *)self imageView];
  double v4 = [MEMORY[0x1E4F1CA48] array];
  BOOL v5 = [v3 image];

  v6 = [v37 leadingAnchor];
  id v7 = [(UIView *)self leadingAnchor];
  id v8 = [v6 constraintEqualToAnchor:v7 constant:21.0];

  [v8 setIdentifier:@"labelLeading"];
  LODWORD(v9) = 1132068864;
  [v8 setPriority:v9];
  [v4 addObject:v8];
  if (v5)
  {
    v10 = [v3 trailingAnchor];
    v11 = [(UIView *)self trailingAnchor];
    v12 = [v10 constraintEqualToAnchor:v11 constant:-21.0];

    [v12 setIdentifier:@"imageTrailing"];
    LODWORD(v13) = 1148846080;
    [v12 setPriority:v13];
    [v4 addObject:v12];
    double v14 = [v3 leadingAnchor];
    double v15 = [v37 trailingAnchor];
    double v16 = [v14 constraintGreaterThanOrEqualToAnchor:v15 constant:17.0];

    [v16 setIdentifier:@"labelToImageSpacing"];
    LODWORD(v17) = 1132068864;
    [v16 setPriority:v17];
    [v4 addObject:v16];
    v18 = [v37 centerXAnchor];
    v19 = [(UIView *)self centerXAnchor];
    v20 = [v18 constraintEqualToAnchor:v19];

    [v20 setIdentifier:@"labelCentering"];
    LODWORD(v21) = 1132068864;
    [v20 setPriority:v21];
    [v4 addObject:v20];
    objc_super v22 = [v3 centerYAnchor];
    v23 = [(UIView *)self centerYAnchor];
    v24 = [v22 constraintEqualToAnchor:v23];
    [v4 addObject:v24];
  }
  else
  {
    v25 = [v37 trailingAnchor];
    v26 = [(UIView *)self trailingAnchor];
    v12 = [v25 constraintEqualToAnchor:v26 constant:-21.0];

    [v12 setIdentifier:@"labelTrailing"];
    LODWORD(v27) = 1132068864;
    [v12 setPriority:v27];
    [v4 addObject:v12];
    v28 = [v37 centerXAnchor];
    v29 = [(UIView *)self centerXAnchor];
    double v16 = [v28 constraintEqualToAnchor:v29];

    [v16 setIdentifier:@"labelCentering"];
    LODWORD(v30) = 1144750080;
    [v16 setPriority:v30];
    [v4 addObject:v16];
  }

  v31 = [v37 firstBaselineAnchor];
  v32 = [(UIView *)self topAnchor];
  v33 = [v31 constraintEqualToAnchor:v32 constant:36.0];
  [v4 addObject:v33];

  v34 = [v37 lastBaselineAnchor];
  v35 = [(UIView *)self bottomAnchor];
  v36 = [v34 constraintEqualToAnchor:v35 constant:-21.0];
  [v4 addObject:v36];

  [MEMORY[0x1E4F5B268] activateConstraints:v4];
}

- (UIPreviewAction)action
{
  return self->_action;
}

- (UILabel)label
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_label);
  return (UILabel *)WeakRetained;
}

- (void)setLabel:(id)a3
{
}

- (UIImageView)imageView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_imageView);
  return (UIImageView *)WeakRetained;
}

- (void)setImageView:(id)a3
{
}

- (BOOL)selected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_imageView);
  objc_destroyWeak((id *)&self->_label);
  objc_storeStrong((id *)&self->_action, 0);
}

@end
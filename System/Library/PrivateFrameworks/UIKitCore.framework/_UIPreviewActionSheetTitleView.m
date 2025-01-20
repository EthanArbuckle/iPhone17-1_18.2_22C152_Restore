@interface _UIPreviewActionSheetTitleView
- (NSString)title;
- (UILabel)label;
- (_UIPreviewActionSheetTitleView)initWithCoder:(id)a3;
- (_UIPreviewActionSheetTitleView)initWithFrame:(CGRect)a3;
- (_UIPreviewActionSheetTitleView)initWithFrame:(CGRect)a3 title:(id)a4;
- (void)_updateLabelFont;
- (void)dealloc;
- (void)setLabel:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation _UIPreviewActionSheetTitleView

- (_UIPreviewActionSheetTitleView)initWithFrame:(CGRect)a3 title:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a4;
  v25.receiver = self;
  v25.super_class = (Class)_UIPreviewActionSheetTitleView;
  v11 = -[UIView initWithFrame:](&v25, sel_initWithFrame_, x, y, width, height);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_title, a4);
    v13 = v12;
    v14 = [UILabel alloc];
    v15 = -[UILabel initWithFrame:](v14, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(UIView *)v15 setTranslatesAutoresizingMaskIntoConstraints:0];
    v16 = [(_UIPreviewActionSheetTitleView *)v13 title];
    [(UILabel *)v15 setText:v16];

    [(UILabel *)v15 setNumberOfLines:0];
    [(UILabel *)v15 setTextAlignment:1];
    if (_AXDarkenSystemColors()) {
      +[UIColor blackColor];
    }
    else {
    v17 = +[UIColor colorWithWhite:0.56 alpha:1.0];
    }
    [(UILabel *)v15 setTextColor:v17];

    [(UIView *)v13 addSubview:v15];
    [(_UIPreviewActionSheetTitleView *)v13 setLabel:v15];
    v18 = _NSDictionaryOfVariableBindings(&cfstr_Label.isa, v15, 0);
    v19 = [MEMORY[0x1E4F1CA48] array];
    v20 = [MEMORY[0x1E4F5B268] constraintsWithVisualFormat:@"H:|-[label]-|" options:0 metrics:0 views:v18];
    [v19 addObjectsFromArray:v20];

    v21 = [MEMORY[0x1E4F5B268] constraintWithItem:v15 attribute:12 relatedBy:0 toItem:v13 attribute:3 multiplier:1.0 constant:25.0];
    [v19 addObject:v21];

    v22 = [MEMORY[0x1E4F5B268] constraintWithItem:v15 attribute:11 relatedBy:0 toItem:v13 attribute:11 multiplier:1.0 constant:-15.0];
    [v19 addObject:v22];

    [MEMORY[0x1E4F5B268] activateConstraints:v19];
    [(_UIPreviewActionSheetTitleView *)v13 _updateLabelFont];
    v23 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v23 addObserver:v13 selector:sel__contentSizeChanged_ name:@"UIContentSizeCategoryDidChangeNotification" object:0];
  }
  return v12;
}

- (_UIPreviewActionSheetTitleView)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UIPreviewActionSheetTitleView;
  return [(UIView *)&v4 initWithCoder:a3];
}

- (_UIPreviewActionSheetTitleView)initWithFrame:(CGRect)a3
{
  return -[_UIPreviewActionSheetTitleView initWithFrame:title:](self, "initWithFrame:title:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"UIContentSizeCategoryDidChangeNotification" object:0];

  v4.receiver = self;
  v4.super_class = (Class)_UIPreviewActionSheetTitleView;
  [(UIView *)&v4 dealloc];
}

- (void)_updateLabelFont
{
  v3 = [off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleFootnote"];
  objc_super v4 = [(_UIPreviewActionSheetTitleView *)self label];
  [v4 setFont:v3];

  [(UIView *)self invalidateIntrinsicContentSize];
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (UILabel)label
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_label);
  return (UILabel *)WeakRetained;
}

- (void)setLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_label);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
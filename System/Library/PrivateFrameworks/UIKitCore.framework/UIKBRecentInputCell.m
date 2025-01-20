@interface UIKBRecentInputCell
+ (id)textColorForRenderConfig:(id)a3 isSelected:(BOOL)a4;
+ (id)titleAttributesForRenderConfig:(id)a3;
- (BOOL)_canFocusProgrammatically;
- (UIKBRecentInputCell)initWithFrame:(CGRect)a3;
- (UILabel)label;
- (void)layoutSubviews;
- (void)setInputText:(id)a3;
- (void)setLabel:(id)a3;
- (void)setSelected:(BOOL)a3;
@end

@implementation UIKBRecentInputCell

- (UIKBRecentInputCell)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UIKBRecentInputCell;
  v3 = -[UICollectionViewCell initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(UICollectionViewCell *)v3 _setFocusStyle:1];
  }
  return v4;
}

- (BOOL)_canFocusProgrammatically
{
  return 1;
}

- (void)setSelected:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)UIKBRecentInputCell;
  [(UICollectionViewCell *)&v8 setSelected:a3];
  v4 = objc_opt_class();
  v5 = [(UIView *)self _inheritedRenderConfig];
  objc_super v6 = objc_msgSend(v4, "textColorForRenderConfig:isSelected:", v5, -[UICollectionViewCell isSelected](self, "isSelected"));
  v7 = [(UIKBRecentInputCell *)self label];
  [v7 setTextColor:v6];
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)UIKBRecentInputCell;
  [(UICollectionViewCell *)&v12 layoutSubviews];
  [(UIView *)self bounds];
  double v4 = v3 + 20.0;
  double v6 = v5 + -20.0;
  double v8 = v7 + 9.0;
  double v10 = v9 + -9.0;
  v11 = [(UIKBRecentInputCell *)self label];
  objc_msgSend(v11, "setFrame:", v4, v8, v6, v10);
}

- (void)setInputText:(id)a3
{
  id v4 = a3;
  double v5 = [(UIKBRecentInputCell *)self label];

  if (!v5)
  {
    double v6 = [UILabel alloc];
    [(UIView *)self bounds];
    double v7 = -[UILabel initWithFrame:](v6, "initWithFrame:");
    double v8 = [(UICollectionViewCell *)self contentView];
    [v8 addSubview:v7];

    [(UIKBRecentInputCell *)self setLabel:v7];
  }
  id v9 = objc_alloc(MEMORY[0x1E4F28B18]);
  double v10 = objc_opt_class();
  id v14 = [(UIView *)self _inheritedRenderConfig];
  v11 = [v10 titleAttributesForRenderConfig:v14];
  objc_super v12 = (void *)[v9 initWithString:v4 attributes:v11];

  v13 = [(UIKBRecentInputCell *)self label];
  [v13 setAttributedText:v12];
}

+ (id)textColorForRenderConfig:(id)a3 isSelected:(BOOL)a4
{
  BOOL v4 = a4;
  if ([a3 lightKeyboard])
  {
    double v5 = 0.0;
  }
  else
  {
    if (v4)
    {
      double v6 = +[UIColor blackColor];
      goto LABEL_7;
    }
    double v5 = 1.0;
  }
  double v6 = +[UIColor colorWithWhite:v5 alpha:0.6];
LABEL_7:
  return v6;
}

+ (id)titleAttributesForRenderConfig:(id)a3
{
  uint64_t v4 = qword_1EB25C9A8;
  id v5 = a3;
  if (v4 != -1) {
    dispatch_once(&qword_1EB25C9A8, &__block_literal_global_324);
  }
  double v6 = (void *)[(id)_MergedGlobals_5_10 mutableCopy];
  double v7 = [a1 textColorForRenderConfig:v5 isSelected:0];

  [v6 setObject:v7 forKey:*(void *)off_1E52D2048];
  return v6;
}

void __54__UIKBRecentInputCell_titleAttributesForRenderConfig___block_invoke()
{
  v4[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)off_1E52D2040;
  v0 = [off_1E52D39B8 systemFontOfSize:36.0];
  v4[0] = v0;
  uint64_t v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:&v3 count:1];
  v2 = (void *)_MergedGlobals_5_10;
  _MergedGlobals_5_10 = v1;
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
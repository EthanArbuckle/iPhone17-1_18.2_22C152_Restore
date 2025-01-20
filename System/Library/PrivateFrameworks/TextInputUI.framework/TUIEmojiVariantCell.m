@interface TUIEmojiVariantCell
+ (id)_createDraggableEmojiLabel;
- (BOOL)isHighlighted;
- (EMFEmojiToken)emojiToken;
- (TUIEmojiVariantCell)initWithFrame:(CGRect)a3 token:(id)a4;
- (TUIEmojiVariantSelectorView)variantSelectorView;
- (UIView)backgroundView;
- (_TUIKeyboardEmojiDraggableView)labelView;
- (void)dragDidEnd:(id)a3 withOperation:(unint64_t)a4;
- (void)dragWillBegin:(id)a3;
- (void)layoutSubviews;
- (void)setHighlighted:(BOOL)a3;
- (void)setVariantSelectorView:(id)a3;
@end

@implementation TUIEmojiVariantCell

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_variantSelectorView);
  objc_storeStrong((id *)&self->_emojiToken, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_labelView, 0);
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (void)setVariantSelectorView:(id)a3
{
}

- (TUIEmojiVariantSelectorView)variantSelectorView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_variantSelectorView);
  return (TUIEmojiVariantSelectorView *)WeakRetained;
}

- (EMFEmojiToken)emojiToken
{
  return self->_emojiToken;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (_TUIKeyboardEmojiDraggableView)labelView
{
  return self->_labelView;
}

- (void)dragDidEnd:(id)a3 withOperation:(unint64_t)a4
{
  p_variantSelectorView = &self->_variantSelectorView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_variantSelectorView);
  v5 = [WeakRetained delegate];
  id v6 = objc_loadWeakRetained((id *)p_variantSelectorView);
  [v5 dragAndDropDidEnd:v6];
}

- (void)dragWillBegin:(id)a3
{
  p_variantSelectorView = &self->_variantSelectorView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_variantSelectorView);
  v4 = [WeakRetained delegate];
  id v5 = objc_loadWeakRetained((id *)p_variantSelectorView);
  [v4 dragAndDropWillBegin:v5];
}

- (void)setHighlighted:(BOOL)a3
{
}

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)TUIEmojiVariantCell;
  [(TUIEmojiVariantCell *)&v11 layoutSubviews];
  [(TUIEmojiVariantCell *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[UIView setFrame:](self->_backgroundView, "setFrame:");
  -[_TUIKeyboardEmojiDraggableView setFrame:](self->_labelView, "setFrame:", v4, v6, v8, v10);
}

- (TUIEmojiVariantCell)initWithFrame:(CGRect)a3 token:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a4;
  v33.receiver = self;
  v33.super_class = (Class)TUIEmojiVariantCell;
  objc_super v11 = -[TUIEmojiVariantCell initWithFrame:](&v33, sel_initWithFrame_, x, y, width, height);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_emojiToken, a4);
    id v13 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    double v14 = *MEMORY[0x1E4F1DB28];
    double v15 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v16 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v17 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v18 = objc_msgSend(v13, "initWithFrame:", *MEMORY[0x1E4F1DB28], v15, v16, v17);
    backgroundView = v12->_backgroundView;
    v12->_backgroundView = (UIView *)v18;

    v20 = [(UIView *)v12->_backgroundView layer];
    [v20 setCornerRadius:5.0];

    v21 = [(UIView *)v12->_backgroundView layer];
    [v21 setMasksToBounds:1];

    v22 = [(TUIEmojiVariantCell *)v12 tintColor];
    [(UIView *)v12->_backgroundView setBackgroundColor:v22];

    [(TUIEmojiVariantCell *)v12 addSubview:v12->_backgroundView];
    uint64_t v23 = [(id)objc_opt_class() _createDraggableEmojiLabel];
    labelView = v12->_labelView;
    v12->_labelView = (_TUIKeyboardEmojiDraggableView *)v23;

    v25 = v12->_labelView;
    if (v25)
    {
      [(_TUIKeyboardEmojiDraggableView *)v25 setDelegate:v12];
    }
    else
    {
      v26 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v14, v15, v16, v17);
      [v26 setTextAlignment:1];
      v27 = v12->_labelView;
      v12->_labelView = (_TUIKeyboardEmojiDraggableView *)v26;
    }
    [(TUIEmojiVariantCell *)v12 addSubview:v12->_labelView];
    id v28 = objc_alloc(MEMORY[0x1E4F28B18]);
    v29 = [v10 string];
    v30 = +[TUIEmojiVariantSelectorView emojiTextAttributes];
    v31 = (void *)[v28 initWithString:v29 attributes:v30];

    [(_TUIKeyboardEmojiDraggableView *)v12->_labelView setAttributedText:v31];
    [(TUIEmojiVariantCell *)v12 setHighlighted:0];
  }
  return v12;
}

+ (id)_createDraggableEmojiLabel
{
  v2 = objc_msgSend(objc_alloc(NSClassFromString(&cfstr_Uikeyboardemoj.isa)), "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (objc_opt_respondsToSelector())
  {
    [v2 setDragEnabled:_os_feature_enabled_impl()];
    id v3 = v2;
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

@end
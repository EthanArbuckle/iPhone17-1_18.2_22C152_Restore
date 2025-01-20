@interface UIKeyboardStickerEmptyContentView
- (UIKeyboardStickerEmptyContentView)initWithFrame:(CGRect)a3;
- (UIView)unavailableView;
- (void)handleTap;
- (void)layoutSubviews;
- (void)setUnavailableView:(id)a3;
@end

@implementation UIKeyboardStickerEmptyContentView

- (UIKeyboardStickerEmptyContentView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v24.receiver = self;
  v24.super_class = (Class)UIKeyboardStickerEmptyContentView;
  v7 = -[UICollectionReusableView initWithFrame:](&v24, sel_initWithFrame_);
  if (v7)
  {
    v8 = +[UIContentUnavailableConfiguration emptyConfiguration];
    v9 = _UINSLocalizedStringWithDefaultValue(@"Stickers", @"Stickers");
    [v8 setText:v9];

    v10 = _UINSLocalizedStringWithDefaultValue(@"Send stickers you make from photos, emoji, or your very own Memoji.", @"Send stickers you make from photos, emoji, or your very own Memoji.");
    [v8 setSecondaryText:v10];

    v11 = _UINSLocalizedStringWithDefaultValue(@"Open Stickers", @"Open Stickers");
    v12 = [v8 button];
    [v12 setTitle:v11];

    objc_initWeak(&location, v7);
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    v20 = __51__UIKeyboardStickerEmptyContentView_initWithFrame___block_invoke;
    v21 = &unk_1E52DDB60;
    objc_copyWeak(&v22, &location);
    v13 = +[UIAction actionWithHandler:&v18];
    v14 = objc_msgSend(v8, "buttonProperties", v18, v19, v20, v21);
    [v14 setPrimaryAction:v13];

    v15 = [[UIContentUnavailableView alloc] initWithConfiguration:v8];
    unavailableView = v7->_unavailableView;
    v7->_unavailableView = &v15->super;

    [(UIView *)v7->_unavailableView setTranslatesAutoresizingMaskIntoConstraints:1];
    -[UIView setFrame:](v7->_unavailableView, "setFrame:", x, y, width, height);
    [(UIView *)v7 addSubview:v7->_unavailableView];
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
  return v7;
}

void __51__UIKeyboardStickerEmptyContentView_initWithFrame___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained handleTap];
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)UIKeyboardStickerEmptyContentView;
  [(UIView *)&v4 layoutSubviews];
  unavailableView = self->_unavailableView;
  [(UIView *)self bounds];
  -[UIView setFrame:](unavailableView, "setFrame:");
}

- (void)handleTap
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v8[0] = @"window";
  v3 = [(UIView *)self window];
  v8[1] = @"windowScene";
  v9[0] = v3;
  objc_super v4 = [(UIView *)self window];
  v5 = [v4 windowScene];
  v9[1] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];

  v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 postNotificationName:@"UIEmojiAndStickerShouldPresentPickerNotification" object:0 userInfo:v6];
}

- (UIView)unavailableView
{
  return self->_unavailableView;
}

- (void)setUnavailableView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
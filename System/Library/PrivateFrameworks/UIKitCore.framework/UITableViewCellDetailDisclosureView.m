@interface UITableViewCellDetailDisclosureView
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIButton)accessoryButton;
- (UIColor)accessoryTintColor;
- (UITableViewCellDetailDisclosureView)initWithTarget:(id)a3 action:(SEL)a4 cell:(id)a5 buttonType:(int64_t)a6 shouldReverseLayoutDirection:(BOOL)a7;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)_updateDisclosureChevronImage;
- (void)addTarget:(id)a3 action:(SEL)a4 forControlEvents:(unint64_t)a5;
- (void)removeTarget:(id)a3 action:(SEL)a4 forControlEvents:(unint64_t)a5;
- (void)setAccessoryTintColor:(id)a3;
- (void)setSemanticContentAttribute:(int64_t)a3;
@end

@implementation UITableViewCellDetailDisclosureView

- (UITableViewCellDetailDisclosureView)initWithTarget:(id)a3 action:(SEL)a4 cell:(id)a5 buttonType:(int64_t)a6 shouldReverseLayoutDirection:(BOOL)a7
{
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)UITableViewCellDetailDisclosureView;
  v11 = -[UIControl initWithFrame:](&v19, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_cell, v10);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __106__UITableViewCellDetailDisclosureView_initWithTarget_action_cell_buttonType_shouldReverseLayoutDirection___block_invoke;
    v14[3] = &unk_1E52E89B8;
    v15 = v12;
    int64_t v17 = a6;
    id v16 = v10;
    BOOL v18 = a7;
    +[UIView performWithoutAnimation:v14];
  }
  return v12;
}

void __106__UITableViewCellDetailDisclosureView_initWithTarget_action_cell_buttonType_shouldReverseLayoutDirection___block_invoke(uint64_t a1)
{
  uint64_t v2 = +[UIButton buttonWithType:*(void *)(a1 + 48)];
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 456);
  *(void *)(v3 + 456) = v2;

  [*(id *)(a1 + 32) addSubview:*(void *)(*(void *)(a1 + 32) + 456)];
  id v38 = [*(id *)(a1 + 40) _disclosureChevronImage];
  v5 = [[UIImageView alloc] initWithImage:v38];
  uint64_t v6 = *(void *)(a1 + 32);
  v7 = *(void **)(v6 + 464);
  *(void *)(v6 + 464) = v5;

  uint64_t v8 = MEMORY[0x1E4F1DB28];
  v9 = [*(id *)(*(void *)(a1 + 32) + 464) image];
  [v9 size];
  double v11 = v10;
  double v13 = v12;

  double v14 = 0.0;
  if (!*(unsigned char *)(a1 + 56))
  {
    [*(id *)(*(void *)(a1 + 32) + 456) frame];
    double v14 = CGRectGetMaxX(v40) + 12.0;
  }
  CGFloat v15 = *(double *)(v8 + 8);
  [*(id *)(*(void *)(a1 + 32) + 456) frame];
  double v19 = v18;
  double v21 = v20;
  double v22 = v17;
  CGFloat rect = v15;
  if (*(unsigned char *)(a1 + 56))
  {
    v41.origin.x = v14;
    v41.origin.y = v15;
    v41.size.width = v11;
    v41.size.height = v13;
    double v23 = CGRectGetMaxX(v41) + 12.0;
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 456), "setFrame:", v23, v19, v21, v22);
    double v17 = v22;
  }
  else
  {
    double v23 = v16;
  }
  double v24 = v23;
  CGFloat v25 = v19;
  double v26 = v19;
  CGFloat v27 = v21;
  double v28 = v21;
  CGFloat v29 = v17;
  double Height = CGRectGetHeight(*(CGRect *)(&v17 - 3));
  v42.origin.x = v14;
  v42.origin.y = rect;
  v42.size.width = v11;
  v42.size.height = v13;
  double v31 = (Height - CGRectGetHeight(v42)) * 0.5;
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 464), "setFrame:", v14, v31, v11, v13);
  [*(id *)(a1 + 32) addSubview:*(void *)(*(void *)(a1 + 32) + 464)];
  if (*(unsigned char *)(a1 + 56)) {
    double v32 = v25;
  }
  else {
    double v32 = v31;
  }
  if (*(unsigned char *)(a1 + 56)) {
    double v33 = v23;
  }
  else {
    double v33 = v14;
  }
  if (*(unsigned char *)(a1 + 56)) {
    double v34 = v27;
  }
  else {
    double v34 = v11;
  }
  if (*(unsigned char *)(a1 + 56)) {
    double v35 = v29;
  }
  else {
    double v35 = v13;
  }
  double MaxX = CGRectGetMaxX(*(CGRect *)(&v32 - 1));
  v43.origin.x = v23;
  v43.origin.y = v25;
  v43.size.width = v27;
  v43.size.height = v29;
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", 0.0, 0.0, MaxX, CGRectGetHeight(v43));
}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UITableViewCellDetailDisclosureView;
  -[UIView setSemanticContentAttribute:](&v5, sel_setSemanticContentAttribute_);
  [(UIImageView *)self->_disclosureView setSemanticContentAttribute:a3];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  [(UIView *)self frame];
  double v4 = v3;
  double v6 = v5;
  result.height = v6;
  result.width = v4;
  return result;
}

- (void)addTarget:(id)a3 action:(SEL)a4 forControlEvents:(unint64_t)a5
{
}

- (void)removeTarget:(id)a3 action:(SEL)a4 forControlEvents:(unint64_t)a5
{
}

- (void)_updateDisclosureChevronImage
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cell);
  double v3 = [WeakRetained _disclosureChevronImageWithBaseColor:self->_accessoryTintColor];
  [(UIImageView *)self->_disclosureView setImage:v3];
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)UITableViewCellDetailDisclosureView;
  [(UIView *)&v3 _dynamicUserInterfaceTraitDidChange];
  [(UITableViewCellDetailDisclosureView *)self _updateDisclosureChevronImage];
}

- (void)setAccessoryTintColor:(id)a3
{
  id v5 = a3;
  if (!-[UIColor isEqual:](self->_accessoryTintColor, "isEqual:"))
  {
    objc_storeStrong((id *)&self->_accessoryTintColor, a3);
    [(UITableViewCellDetailDisclosureView *)self _updateDisclosureChevronImage];
  }
}

- (UIButton)accessoryButton
{
  return self->_accessoryButton;
}

- (UIColor)accessoryTintColor
{
  return self->_accessoryTintColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryTintColor, 0);
  objc_destroyWeak((id *)&self->_cell);
  objc_storeStrong((id *)&self->_disclosureView, 0);
  objc_storeStrong((id *)&self->_accessoryButton, 0);
}

@end
@interface PKMessageTableCell
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKMessageTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)_dismissButtonPressed;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setActionOnDismiss:(id)a3;
- (void)setContent:(id)a3;
@end

@implementation PKMessageTableCell

- (PKMessageTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  id v6 = a4;
  v32.receiver = self;
  v32.super_class = (Class)PKMessageTableCell;
  v7 = [(PKMessageTableCell *)&v32 initWithStyle:a3 reuseIdentifier:v6];
  if (v7)
  {
    id v8 = objc_alloc(MEMORY[0x1E4FB1950]);
    v9 = [MEMORY[0x1E4FB1948] subtitleCellConfiguration];
    v10 = (void *)[v8 initWithConfiguration:v9];

    v11 = [(PKMessageTableCell *)v7 contentView];
    [v11 addSubview:v10];

    objc_storeStrong((id *)&v7->_listContentView, v10);
    v12 = (void *)MEMORY[0x1E4FB14D8];
    v13 = [MEMORY[0x1E4FB1818] systemImageNamed:@"xmark"];
    v14 = (void *)MEMORY[0x1E4FB1830];
    v15 = [MEMORY[0x1E4FB08E0] systemFontOfSize:12.0 weight:*MEMORY[0x1E4FB09A8]];
    v16 = [v14 configurationWithFont:v15];
    v17 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    v18 = objc_msgSend(v12, "pkui_plainConfigurationWithImage:imageConfiguration:foregroundColor:", v13, v16, v17);

    objc_initWeak(&location, v7);
    v19 = (void *)MEMORY[0x1E4FB14D0];
    v20 = (void *)MEMORY[0x1E4FB13F0];
    uint64_t v26 = MEMORY[0x1E4F143A8];
    uint64_t v27 = 3221225472;
    v28 = __52__PKMessageTableCell_initWithStyle_reuseIdentifier___block_invoke;
    v29 = &unk_1E59CBEE0;
    objc_copyWeak(&v30, &location);
    v21 = [v20 actionWithHandler:&v26];
    uint64_t v22 = objc_msgSend(v19, "buttonWithConfiguration:primaryAction:", v18, v21, v26, v27, v28, v29);
    dismissButton = v7->_dismissButton;
    v7->_dismissButton = (UIButton *)v22;

    [(UIButton *)v7->_dismissButton setHidden:1];
    [(UIButton *)v7->_dismissButton setAccessibilityIdentifier:*MEMORY[0x1E4F85488]];
    v24 = [(PKMessageTableCell *)v7 contentView];
    [v24 addSubview:v7->_dismissButton];

    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);
  }
  return v7;
}

void __52__PKMessageTableCell_initWithStyle_reuseIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _dismissButtonPressed];
}

- (void)_dismissButtonPressed
{
  actionOnDismiss = (void (**)(void))self->_actionOnDismiss;
  if (actionOnDismiss) {
    actionOnDismiss[2]();
  }
}

- (void)setContent:(id)a3
{
  id v8 = a3;
  v4 = [(UIListContentView *)self->_listContentView configuration];
  char v5 = [v8 isEqual:v4];

  if ((v5 & 1) == 0)
  {
    listContentView = self->_listContentView;
    if (v8)
    {
      [(UIListContentView *)listContentView setConfiguration:v8];
    }
    else
    {
      v7 = [MEMORY[0x1E4FB1948] subtitleCellConfiguration];
      [(UIListContentView *)listContentView setConfiguration:v7];
    }
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  -[UIListContentView sizeThatFits:](self->_listContentView, "sizeThatFits:", a3.width + -20.0 + -20.0, 3.40282347e38);
  double v5 = width;
  result.height = v4;
  result.CGFloat width = v5;
  return result;
}

- (void)setActionOnDismiss:(id)a3
{
  double v4 = _Block_copy(a3);
  id actionOnDismiss = self->_actionOnDismiss;
  self->_id actionOnDismiss = v4;

  dismissButton = self->_dismissButton;
  BOOL v7 = self->_actionOnDismiss == 0;

  [(UIButton *)dismissButton setHidden:v7];
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)PKMessageTableCell;
  [(PKTableViewCell *)&v4 prepareForReuse];
  [(PKMessageTableCell *)self setActionOnDismiss:0];
  v3 = [MEMORY[0x1E4FB1948] subtitleCellConfiguration];
  [(PKMessageTableCell *)self setContent:v3];
}

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)PKMessageTableCell;
  [(PKMessageTableCell *)&v11 layoutSubviews];
  int v3 = [(PKMessageTableCell *)self _shouldReverseLayoutDirection];
  [(PKMessageTableCell *)self bounds];
  remainder.origin.x = v4;
  remainder.origin.y = v5;
  remainder.size.CGFloat width = v6;
  remainder.size.height = v7;
  memset(&v9, 0, sizeof(v9));
  if (v3) {
    CGRectEdge v8 = CGRectMaxXEdge;
  }
  else {
    CGRectEdge v8 = CGRectMinXEdge;
  }
  CGRectDivide(*(CGRect *)&v4, &v9, &remainder, v6 + -20.0 + -20.0, v8);
  -[UIListContentView setFrame:](self->_listContentView, "setFrame:", *(_OWORD *)&v9.origin, *(_OWORD *)&v9.size);
  CGRectDivide(remainder, &v9, &remainder, 10.0, CGRectMinYEdge);
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  -[UIButton setFrame:](self->_dismissButton, "setFrame:");
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_actionOnDismiss, 0);
  objc_storeStrong((id *)&self->_dismissButton, 0);

  objc_storeStrong((id *)&self->_listContentView, 0);
}

@end
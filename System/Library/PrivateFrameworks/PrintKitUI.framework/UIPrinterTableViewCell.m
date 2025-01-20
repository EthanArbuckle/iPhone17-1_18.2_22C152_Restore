@interface UIPrinterTableViewCell
- (BOOL)checked;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (PKPrinter)printer;
- (UIGestureRecognizer)expandedAccessoryTapRecognizer;
- (UIPrinterAccessoryView)printerAccessoryView;
- (UIPrinterTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (id)delegate;
- (int)printerState;
- (void)expandedAccessoryAreaTapped;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)printerAccessoryViewInfoButtonPressed:(id)a3;
- (void)setChecked:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setExpandedAccessoryTapRecognizer:(id)a3;
- (void)setPrinter:(id)a3;
- (void)setPrinterAccessoryView:(id)a3;
- (void)setPrinterState:(int)a3;
@end

@implementation UIPrinterTableViewCell

- (UIPrinterTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v17.receiver = self;
  v17.super_class = (Class)UIPrinterTableViewCell;
  v4 = [(UIPrinterTableViewCell *)&v17 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = [UIPrinterAccessoryView alloc];
    uint64_t v6 = -[UIPrinterAccessoryView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    printerAccessoryView = v4->_printerAccessoryView;
    v4->_printerAccessoryView = (UIPrinterAccessoryView *)v6;

    [(UIPrinterAccessoryView *)v4->_printerAccessoryView setDelegate:v4];
    [(UIPrinterTableViewCell *)v4 setAccessoryView:v4->_printerAccessoryView];
    v8 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    v9 = [(UIPrinterTableViewCell *)v4 detailTextLabel];
    [v9 setTextColor:v8];

    v10 = [MEMORY[0x1E4FB1818] systemImageNamed:@"checkmark"];
    v11 = [(UIPrinterTableViewCell *)v4 imageView];
    [v11 setImage:v10];

    v12 = [(UIPrinterTableViewCell *)v4 imageView];
    [v12 setHidden:1];

    v13 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:v4 action:sel_expandedAccessoryAreaTapped];
    [(UIPrinterTableViewCell *)v4 setExpandedAccessoryTapRecognizer:v13];

    v14 = [(UIPrinterTableViewCell *)v4 expandedAccessoryTapRecognizer];
    [v14 setDelegate:v4];

    v15 = [(UIPrinterTableViewCell *)v4 expandedAccessoryTapRecognizer];
    [(UIPrinterTableViewCell *)v4 addGestureRecognizer:v15];
  }
  return v4;
}

- (void)setPrinter:(id)a3
{
  p_printer = &self->_printer;
  id v5 = a3;
  objc_storeWeak((id *)p_printer, v5);
  uint64_t v6 = [v5 displayName];
  v7 = (void *)v6;
  if (v6) {
    v8 = (__CFString *)v6;
  }
  else {
    v8 = &stru_1F3C9D3F8;
  }
  v9 = [(UIPrinterTableViewCell *)self textLabel];
  [v9 setText:v8];

  v10 = [v5 location];

  if (v10) {
    v11 = v10;
  }
  else {
    v11 = &stru_1F3C9D3F8;
  }
  v12 = [(UIPrinterTableViewCell *)self detailTextLabel];
  [v12 setText:v11];

  [(UIPrinterTableViewCell *)self setSelectionStyle:v5 != 0];
}

- (BOOL)checked
{
  v2 = [(UIPrinterTableViewCell *)self imageView];
  char v3 = [v2 isHidden] ^ 1;

  return v3;
}

- (void)setChecked:(BOOL)a3
{
  BOOL v3 = !a3;
  id v4 = [(UIPrinterTableViewCell *)self imageView];
  [v4 setHidden:v3];
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)UIPrinterTableViewCell;
  [(UIPrinterTableViewCell *)&v3 prepareForReuse];
  [(UIPrinterTableViewCell *)self setPrinter:0];
  [(UIPrinterTableViewCell *)self setPrinterState:0];
  [(UIPrinterTableViewCell *)self setChecked:0];
}

- (void)printerAccessoryViewInfoButtonPressed:(id)a3
{
  id v4 = [(UIPrinterTableViewCell *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 printerInfoButtonTapped:self];
  }
}

- (int)printerState
{
  v2 = [(UIPrinterTableViewCell *)self printerAccessoryView];
  int v3 = [v2 printerState];

  return v3;
}

- (void)setPrinterState:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = [(UIPrinterTableViewCell *)self printerAccessoryView];
  int v6 = [v5 printerState];

  if (v6 != v3)
  {
    v7 = [(UIPrinterTableViewCell *)self printerAccessoryView];
    [v7 setPrinterState:v3];

    [(UIPrinterTableViewCell *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  uint64_t v3 = [(UIPrinterTableViewCell *)self accessoryView];
  [v3 sizeToFit];

  v4.receiver = self;
  v4.super_class = (Class)UIPrinterTableViewCell;
  [(UIPrinterTableViewCell *)&v4 layoutSubviews];
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v5 = a4;
  int v6 = [(UIPrinterTableViewCell *)self contentView];
  [v5 locationInView:v6];
  double v8 = v7;

  v9 = [(UIPrinterTableViewCell *)self contentView];
  v10 = [(UIPrinterTableViewCell *)self printerAccessoryView];
  v11 = [v10 infoButton];
  [v11 frame];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  v20 = [(UIPrinterTableViewCell *)self printerAccessoryView];
  objc_msgSend(v9, "convertRect:fromView:", v20, v13, v15, v17, v19);
  uint64_t v22 = v21;
  uint64_t v24 = v23;
  uint64_t v26 = v25;
  uint64_t v28 = v27;

  v29 = [MEMORY[0x1E4FB1438] sharedApplication];
  uint64_t v30 = [v29 userInterfaceLayoutDirection];

  uint64_t v31 = v22;
  uint64_t v32 = v24;
  uint64_t v33 = v26;
  uint64_t v34 = v28;
  if (v30) {
    return v8 <= CGRectGetMaxX(*(CGRect *)&v31);
  }
  else {
    return v8 >= CGRectGetMinX(*(CGRect *)&v31);
  }
}

- (void)expandedAccessoryAreaTapped
{
  uint64_t v3 = [(UIPrinterTableViewCell *)self expandedAccessoryTapRecognizer];
  uint64_t v4 = [v3 state];

  if (v4 == 3)
  {
    id v5 = [(UIPrinterTableViewCell *)self printerAccessoryView];
    [(UIPrinterTableViewCell *)self printerAccessoryViewInfoButtonPressed:v5];
  }
}

- (PKPrinter)printer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_printer);
  return (PKPrinter *)WeakRetained;
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  return WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIPrinterAccessoryView)printerAccessoryView
{
  return self->_printerAccessoryView;
}

- (void)setPrinterAccessoryView:(id)a3
{
}

- (UIGestureRecognizer)expandedAccessoryTapRecognizer
{
  return self->_expandedAccessoryTapRecognizer;
}

- (void)setExpandedAccessoryTapRecognizer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expandedAccessoryTapRecognizer, 0);
  objc_storeStrong((id *)&self->_printerAccessoryView, 0);
  objc_destroyWeak(&self->_delegate);
  objc_destroyWeak((id *)&self->_printer);
}

@end
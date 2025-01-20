@interface UIPrinterAccessoryView
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIButton)infoButton;
- (UIPrinterAccessoryView)initWithFrame:(CGRect)a3;
- (UIPrinterAccessoryViewDelegate)delegate;
- (UIView)statusView;
- (int)printerState;
- (void)infoButtonPressed:(id)a3;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setInfoButton:(id)a3;
- (void)setPrinterState:(int)a3;
- (void)setStatusView:(id)a3;
@end

@implementation UIPrinterAccessoryView

- (UIPrinterAccessoryView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)UIPrinterAccessoryView;
  v3 = -[UIPrinterAccessoryView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4FB14D0] buttonWithType:3];
    infoButton = v3->_infoButton;
    v3->_infoButton = (UIButton *)v4;

    [(UIButton *)v3->_infoButton addTarget:v3 action:sel_infoButtonPressed_ forControlEvents:64];
    [(UIPrinterAccessoryView *)v3 addSubview:v3->_infoButton];
    v3->_printerState = 0;
  }
  return v3;
}

- (void)infoButtonPressed:(id)a3
{
  uint64_t v4 = [(UIPrinterAccessoryView *)self delegate];
  if (v4)
  {
    v5 = (void *)v4;
    if (objc_opt_respondsToSelector()) {
      [v5 printerAccessoryViewInfoButtonPressed:self];
    }
  }
  MEMORY[0x1F4181820]();
}

- (void)setPrinterState:(int)a3
{
  if (self->_printerState == a3) {
    return;
  }
  self->_int printerState = a3;
  uint64_t v4 = [(UIPrinterAccessoryView *)self statusView];

  if (v4)
  {
    v5 = [(UIPrinterAccessoryView *)self statusView];
    [v5 removeFromSuperview];

    [(UIPrinterAccessoryView *)self setStatusView:0];
  }
  int printerState = self->_printerState;
  switch(printerState)
  {
    case 4:
      v10 = (void *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:3];
      [v10 startAnimating];
LABEL_11:
      [(UIPrinterAccessoryView *)self setStatusView:v10];

      break;
    case 2:
      id v7 = objc_alloc(MEMORY[0x1E4FB1838]);
      v8 = (void *)MEMORY[0x1E4FB1818];
      v9 = @"lock.open.fill";
      goto LABEL_10;
    case 1:
      id v7 = objc_alloc(MEMORY[0x1E4FB1838]);
      v8 = (void *)MEMORY[0x1E4FB1818];
      v9 = @"lock.fill";
LABEL_10:
      v11 = [v8 systemImageNamed:v9];
      v10 = (void *)[v7 initWithImage:v11];

      goto LABEL_11;
  }
  v12 = [(UIPrinterAccessoryView *)self statusView];

  if (v12)
  {
    v13 = [(UIPrinterAccessoryView *)self statusView];
    [(UIPrinterAccessoryView *)self addSubview:v13];
  }
  [(UIPrinterAccessoryView *)self setNeedsLayout];
}

- (void)layoutSubviews
{
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v3 = [(UIPrinterAccessoryView *)self subviews];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v22;
    double v7 = 0.0;
    double v8 = 0.0;
    double v9 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        double v20 = v7;
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v21 + 1) + 8 * i) frame];
        CGFloat x = v28.origin.x;
        CGFloat y = v28.origin.y;
        CGFloat width = v28.size.width;
        CGFloat height = v28.size.height;
        double MinX = CGRectGetMinX(v28);
        v29.origin.CGFloat x = x;
        v29.origin.CGFloat y = y;
        v29.size.CGFloat width = width;
        v29.size.CGFloat height = height;
        double MaxX = CGRectGetMaxX(v29);
        v30.origin.CGFloat x = x;
        v30.origin.CGFloat y = y;
        v30.size.CGFloat width = width;
        v30.size.CGFloat height = height;
        double v17 = CGRectGetHeight(v30);
        double v7 = v20;
        if (MinX < v20) {
          double v7 = MinX;
        }
        if (MaxX > v8) {
          double v8 = MaxX;
        }
        if (v17 > v9) {
          double v9 = v17;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v5);
  }
  else
  {
    double v7 = 0.0;
    double v8 = 0.0;
    double v9 = 0.0;
  }

  double v18 = v8 - v7;
  double v19 = v9;
  result.CGFloat height = v19;
  result.CGFloat width = v18;
  return result;
}

- (UIButton)infoButton
{
  return self->_infoButton;
}

- (void)setInfoButton:(id)a3
{
}

- (UIView)statusView
{
  return self->_statusView;
}

- (void)setStatusView:(id)a3
{
}

- (UIPrinterAccessoryViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (UIPrinterAccessoryViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int)printerState
{
  return self->_printerState;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_statusView, 0);
  objc_storeStrong((id *)&self->_infoButton, 0);
}

@end
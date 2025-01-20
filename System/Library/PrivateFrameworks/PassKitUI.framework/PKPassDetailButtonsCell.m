@interface PKPassDetailButtonsCell
- (BOOL)hasEnabledWidgets;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKPassDetailButtonsCell)initWithReuseIdentifier:(id)a3 widgetViewStyle:(unint64_t)a4;
- (void)layoutSubviews;
- (void)setAccount:(id)a3;
- (void)setBankConnectAccount:(id)a3;
- (void)setCurrentUser:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPaymentPass:(id)a3;
- (void)setPeerPaymentAccount:(id)a3;
@end

@implementation PKPassDetailButtonsCell

- (PKPassDetailButtonsCell)initWithReuseIdentifier:(id)a3 widgetViewStyle:(unint64_t)a4
{
  v11.receiver = self;
  v11.super_class = (Class)PKPassDetailButtonsCell;
  v5 = [(PKPassDetailButtonsCell *)&v11 initWithStyle:0 reuseIdentifier:a3];
  if (v5)
  {
    v6 = [[PKPaymentPassActionWidgetView alloc] initWithWidgetViewStyle:a4];
    widgetView = v5->_widgetView;
    v5->_widgetView = v6;

    v8 = [MEMORY[0x1E4FB1618] clearColor];
    [(PKPassDetailButtonsCell *)v5 setBackgroundColor:v8];

    v9 = [(PKPassDetailButtonsCell *)v5 contentView];
    [v9 addSubview:v5->_widgetView];
    [(PKPassDetailButtonsCell *)v5 setAccessibilityIdentifier:*MEMORY[0x1E4F85B88]];
  }
  return v5;
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)PKPassDetailButtonsCell;
  [(PKPassDetailButtonsCell *)&v12 layoutSubviews];
  v3 = [(PKPassDetailButtonsCell *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  -[PKPaymentPassActionWidgetView setFrame:](self->_widgetView, "setFrame:", v5, v7, v9, v11);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[PKPaymentPassActionWidgetView sizeThatFits:](self->_widgetView, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setPaymentPass:(id)a3
{
}

- (void)setDelegate:(id)a3
{
}

- (void)setAccount:(id)a3
{
}

- (void)setBankConnectAccount:(id)a3
{
}

- (void)setPeerPaymentAccount:(id)a3
{
}

- (void)setCurrentUser:(id)a3
{
}

- (BOOL)hasEnabledWidgets
{
  return [(PKPaymentPassActionWidgetView *)self->_widgetView hasEnabledWidgets];
}

- (void).cxx_destruct
{
}

@end
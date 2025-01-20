@interface PKPassMessageFooterContentView
- (PKPassMessageFooterContentView)initWithPass:(id)a3;
- (PKPassMessageFooterContentView)initWithPass:(id)a3 presentationContext:(id)a4;
- (void)layoutSubviews;
- (void)updateWithMessages:(id)a3;
@end

@implementation PKPassMessageFooterContentView

- (PKPassMessageFooterContentView)initWithPass:(id)a3
{
  return [(PKPassMessageFooterContentView *)self initWithPass:a3 presentationContext:0];
}

- (PKPassMessageFooterContentView)initWithPass:(id)a3 presentationContext:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)PKPassMessageFooterContentView;
  v4 = [(PKPassFooterContentView *)&v9 initWithPass:a3 presentationContext:0];
  if (v4)
  {
    v5 = [PKDashboardMessagesView alloc];
    uint64_t v6 = -[PKDashboardMessagesView initWithInsets:](v5, "initWithInsets:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
    messagesView = v4->_messagesView;
    v4->_messagesView = (PKDashboardMessagesView *)v6;

    [(PKPassMessageFooterContentView *)v4 addSubview:v4->_messagesView];
  }
  return v4;
}

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)PKPassMessageFooterContentView;
  [(PKPassFooterContentView *)&v11 layoutSubviews];
  [(PKPassMessageFooterContentView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  -[PKDashboardMessagesView sizeThatFits:](self->_messagesView, "sizeThatFits:", v7, v9 + -16.0);
  -[PKDashboardMessagesView setFrame:](self->_messagesView, "setFrame:", v4, v6 + 16.0, v8, v10);
}

- (void)updateWithMessages:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
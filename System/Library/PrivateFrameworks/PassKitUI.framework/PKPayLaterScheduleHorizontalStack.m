@interface PKPayLaterScheduleHorizontalStack
- (PKConnectedCircleView)circleView;
- (PKPayLaterScheduleHorizontalStack)initWithLeadingText:(id)a3 trailingText:(id)a4 stackIndex:(unint64_t)a5;
- (UILabel)leadingLabel;
- (UILabel)trailingLabel;
- (double)minimumLeadingLabelWidth;
- (id)_greyGradientConnector;
- (id)allViews;
- (void)_configureViews;
- (void)setCircleView:(id)a3;
- (void)setLeadingLabel:(id)a3;
- (void)setTrailingLabel:(id)a3;
@end

@implementation PKPayLaterScheduleHorizontalStack

- (PKPayLaterScheduleHorizontalStack)initWithLeadingText:(id)a3 trailingText:(id)a4 stackIndex:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PKPayLaterScheduleHorizontalStack;
  v11 = [(PKPayLaterScheduleHorizontalStack *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_leadingText, a3);
    objc_storeStrong((id *)&v12->_trailingText, a4);
    v12->_stackIndex = a5;
    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    allViews = v12->_allViews;
    v12->_allViews = v13;

    [(PKPayLaterScheduleHorizontalStack *)v12 _configureViews];
  }

  return v12;
}

- (id)allViews
{
  v2 = (void *)[(NSMutableArray *)self->_allViews copy];

  return v2;
}

- (double)minimumLeadingLabelWidth
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = *MEMORY[0x1E4FB06F8];
  v3 = [(UILabel *)self->_leadingLabel font];
  v9[0] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];

  [(NSString *)self->_leadingText sizeWithAttributes:v4];
  double v6 = v5;

  return v6;
}

- (void)_configureViews
{
  [(NSMutableArray *)self->_allViews removeAllObjects];
  __52__PKPayLaterScheduleHorizontalStack__configureViews__block_invoke(self->_leadingText, 1);
  v3 = (UILabel *)objc_claimAutoreleasedReturnValue();
  leadingLabel = self->_leadingLabel;
  self->_leadingLabel = v3;

  [(UILabel *)self->_leadingLabel setAccessibilityIdentifier:*MEMORY[0x1E4F85668]];
  [(NSMutableArray *)self->_allViews safelyAddObject:self->_leadingLabel];
  __52__PKPayLaterScheduleHorizontalStack__configureViews__block_invoke(self->_trailingText, 0);
  double v5 = (UILabel *)objc_claimAutoreleasedReturnValue();
  trailingLabel = self->_trailingLabel;
  self->_trailingLabel = v5;

  [(UILabel *)self->_trailingLabel setAccessibilityIdentifier:*MEMORY[0x1E4F85AC8]];
  [(NSMutableArray *)self->_allViews safelyAddObject:self->_trailingLabel];
  unint64_t stackIndex = self->_stackIndex;
  if (stackIndex == 2)
  {
    id v12 = [(PKPayLaterScheduleHorizontalStack *)self _greyGradientConnector];
    id v9 = PKPayLaterPaymentScheduleConnectedCircleEmptyView();
    uint64_t v8 = 0;
  }
  else if (stackIndex == 1)
  {
    uint64_t v8 = [(PKPayLaterScheduleHorizontalStack *)self _greyGradientConnector];
    id v12 = [(PKPayLaterScheduleHorizontalStack *)self _greyGradientConnector];
    id v9 = PKPayLaterPaymentScheduleConnectedCircleEmptyView();
  }
  else if (stackIndex)
  {
    id v12 = 0;
    uint64_t v8 = 0;
    id v9 = 0;
  }
  else
  {
    uint64_t v8 = [(PKPayLaterScheduleHorizontalStack *)self _greyGradientConnector];
    id v9 = PKPayLaterPaymentScheduleConnectedCircleTargetView();
    id v12 = 0;
  }
  id v10 = objc_alloc_init(PKConnectedCircleView);
  circleView = self->_circleView;
  self->_circleView = v10;

  [(PKConnectedCircleView *)self->_circleView setTopConnector:v12];
  [(PKConnectedCircleView *)self->_circleView setBottomConnector:v8];
  [(PKConnectedCircleView *)self->_circleView setTargetView:v9];
  [(PKConnectedCircleView *)self->_circleView setNeedsDisplay];
  [(NSMutableArray *)self->_allViews safelyAddObject:self->_circleView];
}

id __52__PKPayLaterScheduleHorizontalStack__configureViews__block_invoke(void *a1, int a2)
{
  if (a1)
  {
    v3 = (objc_class *)MEMORY[0x1E4FB1930];
    id v4 = a1;
    id v5 = objc_alloc_init(v3);
    int v6 = [v5 _shouldReverseLayoutDirection];
    uint64_t v7 = 2;
    if (v6) {
      uint64_t v8 = 2;
    }
    else {
      uint64_t v8 = 0;
    }
    if (v6) {
      uint64_t v7 = 0;
    }
    if (a2) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = v7;
    }
    id v10 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [v5 setTextColor:v10];

    [v5 setTextAlignment:v9];
    v11 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB2950], (NSString *)*MEMORY[0x1E4FB2790]);
    [v5 setFont:v11];

    [v5 setNumberOfLines:0];
    [v5 setText:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)_greyGradientConnector
{
  v2 = [PKGradientVerticalConnector alloc];
  v3 = PKPayLaterPaymentScheduleVerticalConnectorGreyColor();
  id v4 = PKPayLaterPaymentScheduleVerticalConnectorGreyColor();
  id v5 = [(PKGradientVerticalConnector *)v2 initWithTopGradientColor:v3 bottomGradientColor:v4];

  return v5;
}

- (UILabel)leadingLabel
{
  return self->_leadingLabel;
}

- (void)setLeadingLabel:(id)a3
{
}

- (UILabel)trailingLabel
{
  return self->_trailingLabel;
}

- (void)setTrailingLabel:(id)a3
{
}

- (PKConnectedCircleView)circleView
{
  return self->_circleView;
}

- (void)setCircleView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_circleView, 0);
  objc_storeStrong((id *)&self->_trailingLabel, 0);
  objc_storeStrong((id *)&self->_leadingLabel, 0);
  objc_storeStrong((id *)&self->_allViews, 0);
  objc_storeStrong((id *)&self->_trailingText, 0);

  objc_storeStrong((id *)&self->_leadingText, 0);
}

@end
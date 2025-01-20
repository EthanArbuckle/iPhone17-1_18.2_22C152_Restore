@interface PKRewardsSummaryBarViewWrapper
- (PKRewardsSummaryBarViewWrapper)initWithBarView:(id)a3 configuration:(id)a4;
- (void)layoutSubviews;
@end

@implementation PKRewardsSummaryBarViewWrapper

- (PKRewardsSummaryBarViewWrapper)initWithBarView:(id)a3 configuration:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PKRewardsSummaryBarViewWrapper;
  v9 = [(PKRewardsSummaryBarViewWrapper *)&v15 init];
  v10 = v9;
  if (v9)
  {
    p_barView = (id *)&v9->_barView;
    objc_storeStrong((id *)&v9->_barView, a3);
    [*p_barView setRoundBaselineCorners:1];
    [*p_barView setUseSmallCornerRadius:0];
    [*p_barView setShowPlaceholder:1];
    id v12 = *p_barView;
    v13 = PKRewardsHubIncompleteProgressGrayColor();
    [v12 setPlaceholderColor:v13];

    [(PKRewardsSummaryBarViewWrapper *)v10 addSubview:*p_barView];
    objc_storeStrong((id *)&v10->_configuration, a4);
  }

  return v10;
}

- (void)layoutSubviews
{
  [(PKRewardsSummaryBarViewWrapper *)self bounds];
  double v4 = v3;
  -[PKSegmentedBarView setFrame:](self->_barView, "setFrame:");
  barView = self->_barView;
  configuration = self->_configuration;

  [(PKSegmentedBarView *)barView configureWithBarConfiguration:configuration axis:0 maximumLength:1 barLength:&__block_literal_global_138 synchronous:v4 completion:v4];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);

  objc_storeStrong((id *)&self->_barView, 0);
}

@end
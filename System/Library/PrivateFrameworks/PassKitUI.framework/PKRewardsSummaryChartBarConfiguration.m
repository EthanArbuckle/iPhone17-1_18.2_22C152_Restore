@interface PKRewardsSummaryChartBarConfiguration
- (BOOL)isReady;
- (PKAccountRewardsTierSummary)summary;
- (PKRewardsSummaryChartBarConfiguration)initWithSummary:(id)a3;
- (double)totalValue;
- (double)valueForSegmentAtIndex:(int64_t)a3;
- (id)_valueAtIndex:(int64_t)a3;
- (id)colorForSegmentAtIndex:(int64_t)a3;
- (int64_t)numberOfSegments;
- (unint64_t)_rewardsTierForIndex:(int64_t)a3;
@end

@implementation PKRewardsSummaryChartBarConfiguration

- (PKRewardsSummaryChartBarConfiguration)initWithSummary:(id)a3
{
  v16[4] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKRewardsSummaryChartBarConfiguration;
  v6 = [(PKRewardsSummaryChartBarConfiguration *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_summary, a3);
    v8 = [v5 onePercentTotal];
    v16[0] = v8;
    v9 = [v5 twoPercentTotal];
    v16[1] = v9;
    v10 = [v5 threePercentTotal];
    v16[2] = v10;
    v11 = [v5 specialTotal];
    v16[3] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:4];
    tierAmounts = v7->_tierAmounts;
    v7->_tierAmounts = (NSArray *)v12;
  }
  return v7;
}

- (BOOL)isReady
{
  return self->_summary != 0;
}

- (int64_t)numberOfSegments
{
  return [(NSArray *)self->_tierAmounts count];
}

- (double)totalValue
{
  v2 = [(PKAccountRewardsTierSummary *)self->_summary totalAmount];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (double)valueForSegmentAtIndex:(int64_t)a3
{
  double v3 = [(PKRewardsSummaryChartBarConfiguration *)self _valueAtIndex:a3];
  [v3 doubleValue];
  double v4 = 0.0;
  if (v5 >= 0.0)
  {
    [v3 doubleValue];
    double v4 = v6;
  }

  return v4;
}

- (id)colorForSegmentAtIndex:(int64_t)a3
{
  uint64_t v3 = [(PKRewardsSummaryChartBarConfiguration *)self _rewardsTierForIndex:a3];

  return PKColorForRewardsTier(v3);
}

- (id)_valueAtIndex:(int64_t)a3
{
  if ([(PKRewardsSummaryChartBarConfiguration *)self numberOfSegments] <= a3)
  {
    double v5 = 0;
  }
  else
  {
    double v5 = [(NSArray *)self->_tierAmounts objectAtIndex:a3];
  }

  return v5;
}

- (unint64_t)_rewardsTierForIndex:(int64_t)a3
{
  if ((unint64_t)a3 < 4) {
    return a3 + 1;
  }
  else {
    return 0;
  }
}

- (PKAccountRewardsTierSummary)summary
{
  return self->_summary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summary, 0);

  objc_storeStrong((id *)&self->_tierAmounts, 0);
}

@end
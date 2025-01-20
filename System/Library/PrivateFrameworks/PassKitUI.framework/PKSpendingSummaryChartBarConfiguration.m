@interface PKSpendingSummaryChartBarConfiguration
- (BOOL)isReady;
- (PKSpendingSummary)summary;
- (PKSpendingSummaryChartBarConfiguration)initWithSummary:(id)a3;
- (double)totalValue;
- (double)valueForSegmentAtIndex:(int64_t)a3;
- (id)_categoryAtIndex:(int64_t)a3;
- (id)colorForSegmentAtIndex:(int64_t)a3;
- (int64_t)numberOfSegments;
- (void)_configureWithSummary:(id)a3;
@end

@implementation PKSpendingSummaryChartBarConfiguration

- (PKSpendingSummaryChartBarConfiguration)initWithSummary:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKSpendingSummaryChartBarConfiguration;
  v6 = [(PKSpendingSummaryChartBarConfiguration *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_summary, a3);
    [(PKSpendingSummaryChartBarConfiguration *)v7 _configureWithSummary:v5];
  }

  return v7;
}

- (void)_configureWithSummary:(id)a3
{
  id v6 = [a3 orderedSpendingCategories];
  v4 = [v6 sortedArrayUsingComparator:&__block_literal_global_175];
  orderedCategories = self->_orderedCategories;
  self->_orderedCategories = v4;
}

uint64_t __64__PKSpendingSummaryChartBarConfiguration__configureWithSummary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  unint64_t v5 = [a2 merchantCategory] - 1;
  if (v5 > 6) {
    unint64_t v6 = -1;
  }
  else {
    unint64_t v6 = qword_1A0444E88[v5];
  }
  uint64_t v7 = [v4 merchantCategory];

  if ((unint64_t)(v7 - 1) > 6) {
    unint64_t v8 = -1;
  }
  else {
    unint64_t v8 = qword_1A0444E88[v7 - 1];
  }
  BOOL v9 = v6 >= v8;
  BOOL v10 = v6 > v8;
  if (v9) {
    return v10;
  }
  else {
    return -1;
  }
}

- (BOOL)isReady
{
  return [(PKSpendingSummary *)self->_summary isLoading] ^ 1;
}

- (int64_t)numberOfSegments
{
  return [(NSArray *)self->_orderedCategories count];
}

- (double)totalValue
{
  v2 = [(PKSpendingSummary *)self->_summary totalSpending];
  v3 = [v2 amount];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (double)valueForSegmentAtIndex:(int64_t)a3
{
  v3 = [(PKSpendingSummaryChartBarConfiguration *)self _categoryAtIndex:a3];
  double v4 = [v3 totalAmount];
  double v5 = [v4 amount];
  [v5 doubleValue];
  double v6 = 0.0;
  if (v7 >= 0.0)
  {
    unint64_t v8 = [v3 totalAmount];
    BOOL v9 = [v8 amount];
    [v9 doubleValue];
    double v6 = v10;
  }
  return v6;
}

- (id)colorForSegmentAtIndex:(int64_t)a3
{
  v3 = [(PKSpendingSummaryChartBarConfiguration *)self _categoryAtIndex:a3];
  double v4 = PKBrightColorForMerchantCategory([v3 merchantCategory]);

  return v4;
}

- (id)_categoryAtIndex:(int64_t)a3
{
  if ([(PKSpendingSummaryChartBarConfiguration *)self numberOfSegments] <= a3)
  {
    double v5 = 0;
  }
  else
  {
    double v5 = [(NSArray *)self->_orderedCategories objectAtIndex:a3];
  }

  return v5;
}

- (PKSpendingSummary)summary
{
  return self->_summary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summary, 0);

  objc_storeStrong((id *)&self->_orderedCategories, 0);
}

@end
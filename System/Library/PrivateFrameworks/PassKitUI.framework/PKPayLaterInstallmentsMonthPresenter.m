@interface PKPayLaterInstallmentsMonthPresenter
- (CGSize)sizeForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5;
- (Class)itemClass;
- (PKPayLaterInstallmentsMonthPresenter)init;
- (id)cellForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5;
- (id)collectionViewCellClasses;
- (void)_configureCell:(id)a3 item:(id)a4;
- (void)_configureView:(id)a3 item:(id)a4;
- (void)traitCollectionDidChangeFromTrait:(id)a3 toTrait:(id)a4 inCollectionView:(id)a5;
@end

@implementation PKPayLaterInstallmentsMonthPresenter

- (PKPayLaterInstallmentsMonthPresenter)init
{
  v6.receiver = self;
  v6.super_class = (Class)PKPayLaterInstallmentsMonthPresenter;
  v2 = [(PKPayLaterInstallmentsMonthPresenter *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    sizeByItem = v2->_sizeByItem;
    v2->_sizeByItem = v3;
  }
  return v2;
}

- (Class)itemClass
{
  return (Class)objc_opt_class();
}

- (id)collectionViewCellClasses
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v4 = @"PKPayLaterInstallmentsMonthPresenterCellIdentifier";
  v5[0] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (id)cellForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  v9 = [a4 dequeueReusableCellWithReuseIdentifier:@"PKPayLaterInstallmentsMonthPresenterCellIdentifier" forIndexPath:a5];
  v10 = [v9 hostedContentView];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v11 = v10;
  }
  else {
    v11 = 0;
  }
  v12 = v10;
  if (!v11)
  {
    v12 = objc_alloc_init(PKCalendarMonthView);
    [v9 setHostedContentView:v12];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v13 = v8;
  }
  else {
    id v13 = 0;
  }
  [(PKPayLaterInstallmentsMonthPresenter *)self _configureView:v12 item:v13];

  return v9;
}

- (CGSize)sizeForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v9 = v7;
  }
  else {
    v9 = 0;
  }
  id v10 = v9;
  v11 = [v10 installmentsMonth];
  v12 = [v11 startDate];

  id v13 = [(NSMutableDictionary *)self->_sizeByItem objectForKey:v12];
  [v13 CGSizeValue];
  double v15 = v14;
  double v17 = v16;

  double v18 = *MEMORY[0x1E4F1DB30];
  double v19 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if (*MEMORY[0x1E4F1DB30] == v15 && v19 == v17)
  {
    sampleView = self->_sampleView;
    if (!sampleView)
    {
      v22 = objc_alloc_init(PKCalendarMonthView);
      v23 = self->_sampleView;
      self->_sampleView = v22;

      sampleView = self->_sampleView;
    }
    -[PKPayLaterInstallmentsMonthPresenter _configureView:item:](self, "_configureView:item:", sampleView, v10, v18, v19);
    v24 = self->_sampleView;
    [v8 bounds];
    double v26 = v25;
    +[PKDashboardCollectionViewCell defaultHorizontalInset];
    -[PKCalendarMonthView sizeThatFits:](v24, "sizeThatFits:", v26 + v27 * -2.0, 3.40282347e38);
    double v15 = v28;
    double v17 = v29;
    sizeByItem = self->_sizeByItem;
    v31 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGSize:");
    [(NSMutableDictionary *)sizeByItem setObject:v31 forKey:v12];
  }
  double v32 = v15;
  double v33 = v17;
  result.height = v33;
  result.width = v32;
  return result;
}

- (void)traitCollectionDidChangeFromTrait:(id)a3 toTrait:(id)a4 inCollectionView:(id)a5
{
  if (a3)
  {
    if (a4)
    {
      id v7 = a4;
      id v8 = [a3 preferredContentSizeCategory];
      v9 = [v7 preferredContentSizeCategory];

      NSComparisonResult v10 = UIContentSizeCategoryCompareToCategory(v8, v9);
      if (v10)
      {
        v11 = objc_alloc_init(PKCalendarMonthView);
        sampleView = self->_sampleView;
        self->_sampleView = v11;

        id v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
        sizeByItem = self->_sizeByItem;
        self->_sizeByItem = v13;
      }
    }
  }
}

- (void)_configureCell:(id)a3 item:(id)a4
{
  id v12 = a4;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v12;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v9 = v6;
  }
  else {
    v9 = 0;
  }
  NSComparisonResult v10 = [v9 hostedContentView];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v11 = v10;
  }
  else {
    v11 = 0;
  }
  [(PKPayLaterInstallmentsMonthPresenter *)self _configureView:v11 item:v8];
}

- (void)_configureView:(id)a3 item:(id)a4
{
  if (a3)
  {
    id v5 = a4;
    id v6 = a3;
    id v7 = [PKPayLaterCalendarMonthHeaderView alloc];
    id v8 = [v5 installmentsMonth];
    v11 = [(PKPayLaterCalendarMonthHeaderView *)v7 initWithInstallmentsMonth:v8];

    v9 = [v5 dataSource];
    NSComparisonResult v10 = [v5 appearance];

    [v6 configureWithDataSource:v9 appearance:v10 headerView:v11];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sizeByItem, 0);

  objc_storeStrong((id *)&self->_sampleView, 0);
}

@end